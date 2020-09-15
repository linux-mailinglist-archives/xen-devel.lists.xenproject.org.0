Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 767AD26A000
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 09:41:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kI5aV-0000hH-EP; Tue, 15 Sep 2020 07:41:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kI5aU-0000h9-Ci
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 07:41:14 +0000
X-Inumbo-ID: 71eefc30-63c1-49eb-9401-dae7817bd76f
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71eefc30-63c1-49eb-9401-dae7817bd76f;
 Tue, 15 Sep 2020 07:41:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C4BADAD2E;
 Tue, 15 Sep 2020 07:41:27 +0000 (UTC)
Subject: Re: [RFC PATCH] efi: const correct EFI functions
To: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200914142528.897639-1-hudson@trmm.net>
 <c83fa179-253b-29ba-57d7-c2b5a9b0daee@suse.com>
 <GzkAuTpoKeYXGDsEJtlgfK50xky_Z3ipeYUpbKvW9Fu-0uJamNpsRVMR8fIUYpIzoJlzowf-j7pbcoDAmL8qgYRjE2UwZ2wKma0Xm7U5PpQ=@trmm.net>
 <d94fdbee-7e41-99db-13f8-16394a288318@suse.com>
 <k1CeZGAJquzeIZ1QQgwjPptA5Of3tFvfAE7cUeOvP5D8Th9j55kbwhM410STM91F_ys-HvUZ4WRwch4-gY12EG7cx7u8LEQBxroiwhj8T5Q=@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6f21d741-7e6d-7434-ba2c-dbfb376b529d@suse.com>
Date: Tue, 15 Sep 2020 09:41:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <k1CeZGAJquzeIZ1QQgwjPptA5Of3tFvfAE7cUeOvP5D8Th9j55kbwhM410STM91F_ys-HvUZ4WRwch4-gY12EG7cx7u8LEQBxroiwhj8T5Q=@trmm.net>
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

On 14.09.2020 17:05, Trammell Hudson wrote:
> On Monday, September 14, 2020 10:55 AM, Jan Beulich <jbeulich@suse.com> wrote:
>> On 14.09.2020 16:46, Trammell Hudson wrote:
>>> Option 3 would be to write wrappers for the few functions that are
>>> used in the EFI boot path that cast-away the constness of their
>>> arguments (while also silently cursing the UEFI forum for not
>>> writing const-correct code).
>>
>> This would be kind of a last resort fallback (except for the
>> cursing, which of course we can do at any time).
> 
> Since you didn't like the time travel option, I checked to see
> which functions would need to be wrapped.  It is a surprisingly
> small number:
> 
> #define PrintStr(s) StdOut->OutputString(StdOut, (CHAR16 *)(s))
> #define PrintErr(s) StdErr->OutputString(StdErr, (CHAR16 *)(s))
> #define efi_file_open(file,handle,name,mode,attr) \
>   (file)->Open(file, handle, (CHAR16 *)(name), mode, attr)
> #define shim_verify(shim, ptr, len) \
>   (shim)->Verify((void *)(ptr), len)

That's surprisingly few. What about e.g. HandleProtocol() and
LocateHandle()? GUIDs shouldn't really be non-const either.

Jan

