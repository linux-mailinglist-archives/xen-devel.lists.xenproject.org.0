Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D79E31F5E0
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 09:29:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86800.163205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD19t-0007bS-Nw; Fri, 19 Feb 2021 08:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86800.163205; Fri, 19 Feb 2021 08:29:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD19t-0007b3-Kb; Fri, 19 Feb 2021 08:29:05 +0000
Received: by outflank-mailman (input) for mailman id 86800;
 Fri, 19 Feb 2021 08:29:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TOKe=HV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lD19s-0007ay-8W
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 08:29:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed4b9576-fe56-4e20-bc07-d9b151e47382;
 Fri, 19 Feb 2021 08:28:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 77AA6AC69;
 Fri, 19 Feb 2021 08:28:54 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: ed4b9576-fe56-4e20-bc07-d9b151e47382
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613723334; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oxrkD2bmNOcTxTC61FFJFdIn89f2Nu1xMQpb4dU6cWQ=;
	b=pXP0GGm2vKhd+ZXSbAsWySM5VGswYb24Yf2gNTBzALa4QPYt4e/7ZKUVyK0aSjujLdNKK2
	gHT6dQDQH1paafFM4Arq9EoiEj2RLFywm+hsQCh2DZgAgoxyEtzhvCBeWoqh0Tp89vpPu7
	RW12pIcJODY+Nq67dFYiKxkzcaafzKw=
Subject: Re: [PATCH] firmware: don't build hvmloader if it is not needed
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 cardoe@cardoe.com, andrew.cooper3@citrix.com, wl@xen.org,
 iwj@xenproject.org, anthony.perard@citrix.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20210213020540.27894-1-sstabellini@kernel.org>
 <20210213135056.GA6191@mail-itl>
 <4d9200cd-bd4b-e429-5c96-7a4399bb00b4@suse.com>
 <alpine.DEB.2.21.2102161016000.3234@sstabellini-ThinkPad-T480s>
 <5a574326-9560-e771-b84f-9d4f348b7f5f@suse.com>
 <alpine.DEB.2.21.2102171529460.3234@sstabellini-ThinkPad-T480s>
 <416e26b7-0e24-a9ee-6f9a-732f77f7e0cc@suse.com>
 <alpine.DEB.2.21.2102181737310.3234@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3723a430-e7de-017a-294f-4c3fdb35da51@suse.com>
Date: Fri, 19 Feb 2021 09:28:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2102181737310.3234@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.02.2021 02:42, Stefano Stabellini wrote:
> OK it took me a lot longer than expected (I have never had the dubious
> pleasure of working with autoconf before) but the following seems to
> work, tested on both Alpine Linux and Debian Unstable. Of course I had
> to run autoreconf first.
> 
> 
> diff --git a/config/Tools.mk.in b/config/Tools.mk.in
> index 48bd9ab731..d5e4f1679f 100644
> --- a/config/Tools.mk.in
> +++ b/config/Tools.mk.in
> @@ -50,6 +50,7 @@ CONFIG_OVMF         := @ovmf@
>  CONFIG_ROMBIOS      := @rombios@
>  CONFIG_SEABIOS      := @seabios@
>  CONFIG_IPXE         := @ipxe@
> +CONFIG_HVMLOADER    := @hvmloader@
>  CONFIG_QEMU_TRAD    := @qemu_traditional@
>  CONFIG_QEMU_XEN     := @qemu_xen@
>  CONFIG_QEMUU_EXTRA_ARGS:= @EXTRA_QEMUU_CONFIGURE_ARGS@
> diff --git a/tools/Makefile b/tools/Makefile
> index 757a560be0..6cff5766f3 100644
> --- a/tools/Makefile
> +++ b/tools/Makefile
> @@ -14,7 +14,7 @@ SUBDIRS-y += examples
>  SUBDIRS-y += hotplug
>  SUBDIRS-y += xentrace
>  SUBDIRS-$(CONFIG_XCUTILS) += xcutils
> -SUBDIRS-$(CONFIG_X86) += firmware
> +SUBDIRS-$(CONFIG_HVMLOADER) += firmware

But there are more subdirs under firmware/ than just hvmloader.
In particular you'd now also skip building the shim if hvmloader
was disabled.

> --- a/tools/configure.ac
> +++ b/tools/configure.ac
> @@ -307,6 +307,10 @@ AC_ARG_VAR([AWK], [Path to awk tool])
>  
>  # Checks for programs.
>  AC_PROG_CC
> +AC_LANG(C)
> +AC_LANG_CONFTEST([AC_LANG_SOURCE([[int main() { return 0;}]])])
> +AS_IF([gcc -m32 conftest.c -o - 2>/dev/null], [hvmloader=y], [AC_MSG_WARN(hvmloader build disabled as the compiler cannot build 32bit binaries)])
> +AC_SUBST(hvmloader)

I'm puzzled: "gcc -m32" looked to work fine on its own. I suppose
the above fails at the linking stage, but that's not what we care
about (we don't link with any system libraries). Instead, as said,
you want to check "gcc -m32 -c" produces correct code, in
particular with sizeof(uint64_t) being 8. Of course all of this
would be easier if their headers at least caused some form of
error, instead of silently causing bad code to be generated.

The way you do it, someone simply not having 32-bit C libraries
installed would then also have hvmloader build disabled, even if
their compiler and headers are fine to use.

Also I don't think "-o -" does what you want - it'll produce a
binary named "-" (if compilation and linking succeed), while I
suppose what you want is to discard the output (i.e. probably
"-o /dev/null"). Albeit even that doesn't look to be the commonly
used approach - a binary named "conftest" would normally be
specified as the output, according to other configure.ac I've
looked at. Such tests then have a final "rm -f conftest*".

Jan

