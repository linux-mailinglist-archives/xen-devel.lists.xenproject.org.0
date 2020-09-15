Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F0A26A343
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 12:37:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kI8KA-0001cW-D4; Tue, 15 Sep 2020 10:36:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kI8K8-0001cR-Ri
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 10:36:32 +0000
X-Inumbo-ID: 50a20622-5c52-4908-9553-9c1f4c79460b
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50a20622-5c52-4908-9553-9c1f4c79460b;
 Tue, 15 Sep 2020 10:36:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7CF78AF52;
 Tue, 15 Sep 2020 10:36:46 +0000 (UTC)
Subject: Re: [RFC PATCH v2] efi: const correct EFI functions
To: Trammell Hudson <hudson@trmm.net>
References: <H6ozE5MaNxWCNeoYOjzIuwr5pFTnlM2wAGkSFsWA3-c6OZ4x0TpuFSJTh2e6zTVD-ZC-f9KRfA6THcbHLD2hNNbiByTbEHl56_itVZuLBYw=@trmm.net>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f5720a67-6156-7b90-1621-e680589eb420@suse.com>
Date: Tue, 15 Sep 2020 12:36:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <H6ozE5MaNxWCNeoYOjzIuwr5pFTnlM2wAGkSFsWA3-c6OZ4x0TpuFSJTh2e6zTVD-ZC-f9KRfA6THcbHLD2hNNbiByTbEHl56_itVZuLBYw=@trmm.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.09.2020 12:02, Trammell Hudson wrote:
> @@ -149,10 +150,23 @@ static struct file __initdata cfg;
>  static struct file __initdata kernel;
>  static struct file __initdata ramdisk;
>  static struct file __initdata xsm;
> -static CHAR16 __initdata newline[] = L"\r\n";
> -
> -#define PrintStr(s) StdOut->OutputString(StdOut, s)
> -#define PrintErr(s) StdErr->OutputString(StdErr, s)
> +static const CHAR16 __initconst newline[] = L"\r\n";
> +
> +/* Cast away const-ness on EFI entry points */
> +#define PrintStr(s) StdOut->OutputString(StdOut, (CHAR16 *)(s))
> +#define PrintErr(s) StdErr->OutputString(StdErr, (CHAR16 *)(s))
> +#define efi_file_open(file,handle,name,mode,attr) \
> +    (file)->Open(file, handle, (CHAR16 *)(name), mode, attr)
> +#define efi_handle_protocol(handle, protocol, interface) \
> +    efi_bs->HandleProtocol(handle, (EFI_GUID *)(protocol), interface)
> +#define efi_locate_protocol(protocol, registration, interface) \
> +    efi_bs->LocateProtocol((EFI_GUID *)(protocol), (void *)(registration), \
> +                           interface)
> +#define efi_locate_handle(type, protocol, key, size, buffer) \
> +    efi_bs->LocateHandle(type, (EFI_GUID *)(protocol), (void *)(key), \
> +                         size, buffer)
> +#define shim_verify(shim, ptr, len) \
> +    (shim)->Verify((void *)(ptr), len)

In order for these casts to be halfway safe, they need to happen in
inline functions, not macros. That way it'll be sufficiently clear
and certain that it's really _only_ the const which gets changed,
but not e.g. also the pointed-to type.

Apart from this I think the whole change wants splitting up, to
(about) one basic change at a time.

Jan

