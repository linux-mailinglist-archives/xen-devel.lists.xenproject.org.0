Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D362630D7
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 17:46:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG2If-0001Wp-EG; Wed, 09 Sep 2020 15:46:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wApk=CS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kG2Ie-0001Wa-Cv
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 15:46:20 +0000
X-Inumbo-ID: ffa29af4-7287-42d8-88ee-126c093995d3
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ffa29af4-7287-42d8-88ee-126c093995d3;
 Wed, 09 Sep 2020 15:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599666377;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=gJ6xdlfesjyy2jyzfOiC7d+NDmQvEMINabaHZvk4Vs8=;
 b=Dyp+354ZMeFZDpMSbjS3zDWFBJM5LOGYdAFcrxC73lU6Lc+vTfAjTlwI
 qPvxD/OO+jgz5d7aFgA7CtMB9PeHkmm4GI9eEJYDKZdHlw1blMQMogNqV
 zViyJkVu69iAqjAFNeMryK2t/ZJFyRSIfNWWz0X9DoExxDJ0+Vrd4q5wt M=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: bHnUjxR9XsOT5cQ9mq44XNWyuY+cV77uofRYyzTyGZMzt/zLDKO6NRTbAteIpDBfUfGhC2QItl
 3TpkVXSCt8eNpbj46gYvf9lW0L7KGvwCFPbVEkxdJJZt0lHDt70cG0SW5PhIzXC6z4kZQBfocM
 ozza/bk++e5IK2R3/2LtDVdVPHGMcZcXj6k3pYAMW/o6CfQ20nuM1PNIp19CZLDK5H58p9bIHP
 f1WMWLoOp8y54h2o5VAQEOC47mVUoeZdKxB5Hn8TOFU8wkvZtHpG/UAif9naZKdCpuP67Gi04c
 JeI=
X-SBRS: 2.7
X-MesageID: 26439391
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,409,1592884800"; d="scan'208";a="26439391"
Subject: Re: [PATCH] x86: drop use of prelink-efi_lto.o
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <1b0f6e53-4548-c8ed-7270-53a9a4557b78@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e36d20f2-93ee-9102-d02c-71618e1a3f98@citrix.com>
Date: Wed, 9 Sep 2020 16:46:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1b0f6e53-4548-c8ed-7270-53a9a4557b78@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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

On 09/09/2020 16:45, Jan Beulich wrote:
> As of de94e8b4f996 ("x86/EFI: sanitize build logic") it is identical to
> prelink_lto.o.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

>
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -135,14 +135,11 @@ ifeq ($(CONFIG_LTO),y)
>  prelink_lto.o: $(ALL_OBJS)
>  	$(LD_LTO) -r -o $@ $^
>  
> -prelink-efi_lto.o: $(ALL_OBJS)
> -	$(LD_LTO) -r -o $@ $^
> -
>  # Link it with all the binary objects
>  prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o $(EFI_OBJS-y)
>  	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
>  
> -prelink-efi.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink-efi_lto.o
> +prelink-efi.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o
>  	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
>  else
>  prelink.o: $(ALL_OBJS) $(EFI_OBJS-y)


