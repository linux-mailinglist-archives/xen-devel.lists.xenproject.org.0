Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 854BAC9F3F1
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 15:12:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176849.1501305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQnac-0004rZ-Ne; Wed, 03 Dec 2025 14:12:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176849.1501305; Wed, 03 Dec 2025 14:12:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQnac-0004pu-Kv; Wed, 03 Dec 2025 14:12:18 +0000
Received: by outflank-mailman (input) for mailman id 1176849;
 Wed, 03 Dec 2025 14:12:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4PLl=6J=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vQnaa-0004pn-Nm
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 14:12:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10c854da-d052-11f0-980a-7dc792cee155;
 Wed, 03 Dec 2025 15:12:13 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 57E014EEBE47;
 Wed,  3 Dec 2025 15:12:12 +0100 (CET)
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
X-Inumbo-ID: 10c854da-d052-11f0-980a-7dc792cee155
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1764771132;
	b=XxT/wl/yG7bewKr0OOgk6FCb9MSvQaCXcsK9Gcd4apkqlJ5EXfj8qqDRnk2QF9poZTaZ
	 IAjoFfmZ7/GnVx0m/y61SOPHE+ic+pa5sjAzdQ0a5QJM7R+LBmnDs92U3Ll+SFm1FJeCD
	 Cv9l0B1bC6EwszJIacgxlORoVz9NHieDw//ZsCqilCIIWssRjAudyR+oRghp0HQtQsVrz
	 0vtnVr7UKAZ2sESh5HD2g1O46/j1rQQ59huA1Lltxc/MV6J6R1mfDG0MDPI877+DeOeX4
	 cvt5HpD5flyhvbyDe7h5iTO/ZOMRlh/qgtc+FV0hn1zWPfcYC16vyIdoLqutsArYXMo2O
	 Y621AqpAQCDd+Me+vWxveIxMur7XVf+F5oif4AmRs+en62i5YOR2p6/+2dGHdNbtAq/Wy
	 IGIR4VllO4SKEHfZNgkzwNuMF4m+/DIDFmi+poC/+BcEVxDOLFZ34LPY6xdOKg435DQGK
	 +u8B6KsF+Zm5f4qrxa+xXCUqQrREKd4BKkQmzUMVSY4D40eoh4Trtn7OTDYPaV6/fpY0d
	 Gn030M64vn/pQzbcznN+bgBYVKc0Qb2CNZJ6Qyc+GVtu6lKo/SkQsIfNW0lKHoxMAhCWk
	 yztqTRkIpw/zPr1JiLFdzyJbpB4ppB9qE+Ipals23syY6CuWsA5xLpNhwRH0g9A=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1764771132;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=CsBBI8N+nh90r+GNkxKjJtlc4bAy0OVNevZauo3uL4g=;
	b=0jXuCG/jJ0yvtUlQdzzlw/SwKxa/chgkeJDVRjPVorljAGsrfxhlRD4rntrF1l8qoWM0
	 ciu3XShqECZPr7AhYHTppDjrqXn0WJNRdDa+Pu4qfVBEvQvKQTBqS3u23Tp4rQHpjGr2X
	 rj5lSCenD84jb6xW7vYMv+Mk6++jd3Ppoz3ONx5cQTLlpxUacVVXBjY8/HyWzs0AIyjH+
	 y5B1vHU/O9aXn6BdD3tu9uYQPZT1CmKvpCVHq12pOdCZywnRwFcSWIIW7zckw/FVbIuRW
	 zqeydyR4NV3m6/x6kBU80Yz4hG87MIVYrmii2J9039Nfkdb7c3CVPDuT/FWCaxAq2ZXa9
	 +i2SLZ+TAi+T84tbWjmGUOd7dWCnLd5QQ5wfqvtjvXpGdDyNFw7NILU/LywpJlz4hmMM7
	 TIOmNMDJ31LgkEgsidAsxFAiFb6KUn7euny5KfG+7KnNpJS0HtrzTTTI7+KNGk8fRPwSk
	 DCJbcx6QUYQnXgcq2AQ3cEHxDpeLccpIaBebHWhj5eUxX1Hytsb1dcfQ5AlAdATQDsUNJ
	 jgYjH6DPxxpN493zotNNcW7pqU0RsAeuahyeitM3WfBasoqMKA0gtzHEuPIj5iBPVOeC4
	 yk1B4no3RldbxxBBo+5TH2A9cvyUlYUPleQyqyBljU20XcNoh1HU+aEe0KSVDWE=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1764771132; bh=HTz3RO1SNx7+9wTF3fI9hRmX8TFSMz6k9E+UouvAduE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZSDFDaPXgSCGpGY0Ecn00ILJcWgUxxmLYv+3cuUy4zSsL+RF7CS1YBAQYvQX4zvVm
	 eLDMffH9fBvEZalUAXbI6rPxG1PZMHB9UKUcA9QZLiqdmJUvHdNlsTveAFkJFdDMiy
	 jzu4XimewY09worKNGg60u2rCmfFifwrvE2/gVuKJvUOtZ2wmQqiovneuyyz+9Cqjb
	 yhJkanCH3Hez9nz6wQKzhI6ri4aWeCJFATyZAzAeQ6J5bY8ouVZmHDBd2UmryPbSet
	 lpk7eEPysp1CcUIaSnaOEkH3A1dlm5ygEsOPZ+V9qXT/ndnp8x0Mj7xTcpgVU+r7Cz
	 dW+KPEDNh9vMQ==
MIME-Version: 1.0
Date: Wed, 03 Dec 2025 15:12:12 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Grygorii Strashko <grygorii_strashko@epam.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [XEN][PATCH] common/libfdt: optimize usage
In-Reply-To: <b71fad57-ca46-40f4-a210-5f95b441f01d@citrix.com>
References: <20251114180130.346755-1-grygorii_strashko@epam.com>
 <b71fad57-ca46-40f4-a210-5f95b441f01d@citrix.com>
Message-ID: <1a46ef266f8b00869e8a44cdd6117183@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-12-03 14:12, Andrew Cooper wrote:
> On 14/11/2025 6:01 pm, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>> 
>> Now all libfdt features are built-it unconditionally, but...
>> 
>> X86: The libfdt is used on x86 only to parse Hyperlaunch/dom0less Xen
>> nodes, so full libfdt is not needed in this case and minimal, RO
>> configuration can be used.
>> 
>> ARM - situation is more complicated:
>> 1) ARM reads Host DT (fdt.c RO)
>> 2) ARM reads passthrough DT (RO)
>> 3) ARM generates dom0/hwdom DT from Host DT (there is a mix of WIP and 
>> SW APIs)
>> 4) ARM generates domU DT (there is a mix of WIP and SW APIs)
>> 4) With EFI enabled - ARM needs RW API and fdt_empty_tree
>> 5) With CONFIG_OVERLAY_DTB - ARM needs RW and fdt_overlay API
>> 
>> Hence, add possibility for optimizing libfdt usage by introducing 
>> separate
>> Kconfig options for each libfdt feature and select them where needed.
>> 
>> Following libfdt modules are not used after this change:
>>  Makefile.libfdt
>>  fdt_addresses.c
>>  fdt_strerror.c
>>  fdt_check.c
>> 
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>> Not sure about using DOMAIN_BUILD_HELPERS for selecting
>> LIBFDT features, as DOMAIN_BUILD_HELPERS doesn't exactly
>> says that domain's DT will be generated when selected.
>> 
>>  xen/arch/arm/Kconfig       |  4 ++++
>>  xen/common/Kconfig         |  4 ++++
>>  xen/common/libfdt/Kconfig  | 14 ++++++++++++++
>>  xen/common/libfdt/Makefile | 12 +++++++++---
>>  4 files changed, 31 insertions(+), 3 deletions(-)
>>  create mode 100644 xen/common/libfdt/Kconfig
>> 
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index cf6af68299f6..f10cd3d7effc 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -111,6 +111,8 @@ config ARM_EFI
>>  	bool "UEFI boot service support"
>>  	depends on ARM_64 && !MPU
>>  	default y
>> +	select LIBFDT_RW
>> +	select LIBFDT_EMPTY_TREE
>>  	help
>>  	  This option provides support for boot services through
>>  	  UEFI firmware. A UEFI stub is provided to allow Xen to
>> @@ -149,6 +151,8 @@ config HAS_ITS
>>  config OVERLAY_DTB
>>  	bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
>>  	depends on SYSCTL
>> +	select LIBFDT_RW
>> +	select LIBFDT_OVERLAY
>>  	help
>>  	  Dynamic addition/removal of Xen device tree nodes using a dtbo.
>> 
>> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
>> index 401d5046f6f5..256aff269c3b 100644
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -28,6 +28,8 @@ config DOM0LESS_BOOT
>> 
>>  config DOMAIN_BUILD_HELPERS
>>  	bool
>> +	select LIBFDT_WIP
>> +	select LIBFDT_SW
>> 
>>  config GRANT_TABLE
>>  	bool "Grant table support" if EXPERT
>> @@ -680,4 +682,6 @@ config PM_STATS
>>  	  Enable collection of performance management statistics to aid in
>>  	  analyzing and tuning power/performance characteristics of the 
>> system
>> 
>> +source "common/libfdt/Kconfig"
>> +
>>  endmenu
>> diff --git a/xen/common/libfdt/Kconfig b/xen/common/libfdt/Kconfig
>> new file mode 100644
>> index 000000000000..3abd904b2969
>> --- /dev/null
>> +++ b/xen/common/libfdt/Kconfig
>> @@ -0,0 +1,14 @@
>> +config LIBFDT_WIP
>> +	bool
>> +
>> +config LIBFDT_SW
>> +    bool
>> +
>> +config LIBFDT_RW
>> +    bool
>> +
>> +config LIBFDT_EMPTY_TREE
>> +    bool
>> +
>> +config LIBFDT_OVERLAY
>> +    bool
>> diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
>> index 6ce679f98f47..c832d1849a5c 100644
>> --- a/xen/common/libfdt/Makefile
>> +++ b/xen/common/libfdt/Makefile
>> @@ -1,7 +1,13 @@
>> -include $(src)/Makefile.libfdt
>> 
>>  SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
>> 
>> +obj-libfdt-y := fdt.o fdt_ro.o
>> +obj-libfdt-$(CONFIG_LIBFDT_WIP) += fdt_wip.o
>> +obj-libfdt-$(CONFIG_LIBFDT_SW) += fdt_sw.o
>> +obj-libfdt-$(CONFIG_LIBFDT_RW) += fdt_rw.o
>> +obj-libfdt-$(CONFIG_LIBFDT_EMPTY_TREE) += fdt_empty_tree.o
>> +obj-libfdt-$(CONFIG_LIBFDT_OVERLAY) += fdt_overlay.o
>> +
>>  # For CONFIG_OVERLAY_DTB, libfdt functionalities will be needed 
>> during runtime.
>>  ifneq ($(CONFIG_OVERLAY_DTB),y)
>>  OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section 
>> .$(s)=.init.$(s))
>> @@ -15,7 +21,7 @@ CFLAGS-y += -I$(srctree)/include/xen/libfdt/
>>  $(obj)/libfdt.o: $(obj)/libfdt-temp.o FORCE
>>  	$(call if_changed,objcopy)
>> 
>> -$(obj)/libfdt-temp.o: $(addprefix $(obj)/,$(LIBFDT_OBJS)) FORCE
>> +$(obj)/libfdt-temp.o: $(addprefix $(obj)/,$(obj-libfdt-y)) FORCE
>>  	$(call if_changed,ld)
>> 
>> -targets += libfdt-temp.o $(LIBFDT_OBJS)
>> +targets += libfdt-temp.o $(obj-libfdt-y)
> 
> Pulling together several aspects.
> 
> Now that we have xen/lib, library stuff should be in it, including this
> libfdt.  I suggest moving it to xen/lib/fdt.
> 
> The build system problems are created by using non-standard rules to
> bodge the init-ness.  For livepatches, we have `init_or_livepatch` as
> friends to do conditional init-ness.  I'd suggest a similar approach 
> here.
> 
> You might want a prompt-less CONFIG_LIBFDT_NONINIT which can be 
> selected
> by CONFIG_DTB_OVERLAY, because that's going to be better than trying to
> make an implication directly about DTB_OVERLAY.
> 
> 
> As to other issues hinted at:
> 
> * Init coverage.  The only reason we don't have init coverage is 
> because
> of the overly-restrictive SPECIAL_DATA_SECTIONS check, and while it
> serves a purpose, it does a lot of harm too.  It should be disabled by
> things like CONFIG_COVERAGE so that we can retrieve coverage of boot
> time paths, and because data placement is not interesting for these
> types of builds.
> 
> * -f{function,data}-sections and --gc-sections.  This gets dead
> code/data elimination with better granularity than the translation 
> unit,
> and removes the need for interior ifdefary to achieve the same 
> savings. 
> We already have -f*-sections for livepatching, so this is really just
> using --gc-sections and will probably net a good win in one fell swoop.
> 
> ~Andrew

I didn't check, but moving libfdt code might entail doing some 
replacements in ECLAIR deviations to keep guidelines clean, since there 
are a few assumptions about paths there and in 
"docs/misra/exclude-list.json", which is used also by ECLAIR.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

