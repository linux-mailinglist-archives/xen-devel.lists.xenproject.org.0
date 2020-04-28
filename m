Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 014C01BBCDF
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 13:55:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTOpY-0007qo-MI; Tue, 28 Apr 2020 11:55:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NU6p=6M=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jTOpX-0007qf-2N
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 11:55:15 +0000
X-Inumbo-ID: 1b569975-8947-11ea-984f-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b569975-8947-11ea-984f-12813bfff9fa;
 Tue, 28 Apr 2020 11:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588074910;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=enUyvB+FB7mIYnf4Lgty66y0JScU1/TJBrpTb6nLWdg=;
 b=hsvHj0Q+B7e5O1c4px8KmV/0/V0Ta18m9m1TBWkPHK0BBNHXJqtQUytg
 Vz5CYouMkIdnm1eqC+v6HPXffMBN/ABnNb6CuZUsrKY4S+nZlhIYDAiCd
 XV3SUB6PFxSc2SSIxYNeYA8v3OATkRjgmtE7QGZla6VTA/IUjoxFT7drx Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qRGEp+/ruFgmzHfI3f2hn8wrW70I6cFQLjEwobFlX0hnz5KBqeD/A4WzTzMA9j5OoVxC5igpM0
 pXStId8iGGBl+HTIb0zGtRP5AvARC5E/9WmT89PlD4oCFIR/3Ix4+LxIyTUa6useHVcLLo8dLu
 s8tTbZj8iU3a+wXZrAG4aWUXEenqiNIhbmAGEWn58DdEkVZkYEBk491V28A77rX5pljBCgRBDp
 slLmkraaSr/U94kNxinex/LPy+2XaEARZ0oIA4l9wTQuah3fkq7I6BG0DYVaOksLJJlBehnYj7
 NGU=
X-SBRS: 2.7
X-MesageID: 16378220
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,327,1583211600"; d="scan'208";a="16378220"
Subject: Re: [PATCH] mini-os: Avoid segfaults in tc{g,s}etattr
To: Jason Andryuk <jandryuk@gmail.com>, Wei Liu <wl@xen.org>
References: <3ed7eb87-070c-28ea-4f8a-aa4421cea93a@citrix.com>
 <5ea8173d.1c69fb81.915ba.8400@mx.google.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c242b963-ae80-1ca0-9b4d-fe2c8f66b6a2@citrix.com>
Date: Tue, 28 Apr 2020 12:55:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5ea8173d.1c69fb81.915ba.8400@mx.google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: minios-devel@lists.xenproject.org, samuel.thibault@ens-lyon.org, Stefan
 Bader <stefan.bader@canonical.com>, JBeulich@suse.com,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28/04/2020 12:44, Jason Andryuk wrote:
> From: Andrew Cooper <andrew.cooper3@citrix.com>
>
> Andrew Cooper wrote:
>> On 28/04/2020 12:16, Wei Liu wrote:
>>>>>> ---
>>>>>> I can't get ioemu-stubdom to start without this.  With this, the guest
>>>>>> just reboots immediately, but it does that with a non-stubdom
>>>>>> device_model_version="qemu-xen-traditional" .  The same guest disk image
>>>>>> (cirros 0.5.1) boots with a linux stubdom or non-stubdom Ubuntu
>>>>>> qemu-system-x86_64.
>>>> Ubuntu gcc-9 adds -fcf-protection by default.  Somehow that flag
>>>> caused rombios (I think) to restart.  Setting -fcf-protection=none
>>>> like below (probably just the EMBEDDED_EXTRA_CFLAGS part) lets rombios
>>>> start properly.
>> All it does is insert ENDBR{32,64} instructions, which are nops on older
>> processors.
>>
>> I suspect that it is not the -fcf-protection= directly, but some change
>> in alignment of a critical function.
>>
>>>>   The hypervisor needs it as well via
>>>> EXTRA_CFLAGS_XEN_CORE=-fcf-protection=none and maybe also added to
>>>> xen/arch/x86/boot/build32.mk .
>>> Are you able to turn this into a proper patch? I suspect you will need
>>> to test the availability of this new (?) flag.
>>>
>>> Also Cc Jan and Andrew because it affects hypervisor build too.
>> I need to chase this up.  It is a GCC bug breaking the hypervisor build,
>> and I'm moderately disinclined to hack around it, seeing as
>> -fcf-protection is something we want in due course.
>>
>> The bug is that GCC falsely declares that -fcf-protection is
>> incompatible with -mindirect-thunk=extern, despite me spending a week
>> during the Spectre embargo period specifically arranging for the two to
>> be compatible, because we knew we'd want to build retpoline-safe
>> binaries which could also use CET on newer hardware.
> The gcc manual states:
>   "Note that -mindirect-branch=thunk-extern is incompatible with
>    -fcf-protection=branch since the external thunk cannot be modified
>    to disable control-flow check."
>
> https://gcc.gnu.org/onlinedocs/gcc/x86-Options.html

Yes.  This is false.

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93654

but sadly tumbleweeds.

I'll start a thread on the email list.

>
> Below is what I was preparing to submit as a patch.  So, yes it hacks around
> it, but it isn't messy.
>
> ---
> Disable fcf-protection to build working binaries
>
> Ubuntu gcc-9 enables -fcf-protection by default, which conflicts with
> -mindirect-branch=extern and prevents building the hypervisor with
> CONFIG_INDIRECT_THUNK:
> xmalloc.h:81:1: error: ‘-mindirect-branch’ and ‘-fcf-protection’ are not
> compatible
>
> Stefan Bader also noticed that build32.mk requires -fcf-protection=none
> or else the hypervisor will not boot.
> https://bugs.launchpad.net/ubuntu/+source/gcc-9/+bug/1863260  Similarly,
> rombios reboots almost immediately without -fcf-protection=none.  Both
> of those can be handled by setting it in EMBEDDED_EXTRA_CFLAGS.
>
> CC: Stefan Bader <stefan.bader@canonical.com>
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Sadly, this isn't really appropriate.  We specifically do want to use
both -fcf-protection and -mindirect-branch=thunk-extern together, when
GCC isn't broken.

Overriding -fcf-protection is ok but only when we're certain we've got a
buggy GCC, so that when this bug is fixed, we can return to sensible
behaviour.

~Andrew

> ---
>  Config.mk             | 1 +
>  xen/arch/x86/Rules.mk | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/Config.mk b/Config.mk
> index 0f303c79b2..efb3d42bc4 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -205,6 +205,7 @@ APPEND_CFLAGS += $(foreach i, $(APPEND_INCLUDES), -I$(i))
>  
>  EMBEDDED_EXTRA_CFLAGS := -nopie -fno-stack-protector -fno-stack-protector-all
>  EMBEDDED_EXTRA_CFLAGS += -fno-exceptions
> +EMBEDDED_EXTRA_CFLAGS += -fcf-protection=none
>  
>  XEN_EXTFILES_URL ?= http://xenbits.xen.org/xen-extfiles
>  # All the files at that location were downloaded from elsewhere on
> diff --git a/xen/arch/x86/Rules.mk b/xen/arch/x86/Rules.mk
> index 4b7ab78467..c3cbae69d2 100644
> --- a/xen/arch/x86/Rules.mk
> +++ b/xen/arch/x86/Rules.mk
> @@ -69,6 +69,7 @@ CFLAGS += -mno-sse $(call cc-option,$(CC),-mskip-rax-setup)
>  ifeq ($(CONFIG_INDIRECT_THUNK),y)
>  CFLAGS += -mindirect-branch=thunk-extern -mindirect-branch-register
>  CFLAGS += -fno-jump-tables
> +$(call cc-option-add,CFLAGS,CC,-fcf-protection=none)
>  endif
>  
>  # If supported by the compiler, reduce stack alignment to 8 bytes. But allow


