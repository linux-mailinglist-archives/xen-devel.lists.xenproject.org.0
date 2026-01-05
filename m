Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02048CF59FF
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 22:13:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195737.1513653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcrs2-0001yk-G6; Mon, 05 Jan 2026 21:12:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195737.1513653; Mon, 05 Jan 2026 21:12:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcrs2-0001wI-DM; Mon, 05 Jan 2026 21:12:10 +0000
Received: by outflank-mailman (input) for mailman id 1195737;
 Mon, 05 Jan 2026 21:12:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lzVw=7K=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vcrs1-0001wC-9m
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 21:12:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30129710-ea7b-11f0-9ccf-f158ae23cfc8;
 Mon, 05 Jan 2026 22:12:06 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 04F6E4EE0742;
 Mon,  5 Jan 2026 22:12:05 +0100 (CET)
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
X-Inumbo-ID: 30129710-ea7b-11f0-9ccf-f158ae23cfc8
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1767647525;
	b=jnNIDsDY+vU+TTv5NB0WozdOZ13Td8J3axRBEk7hhiX3sbKnJ8hJqp1p16NYE9P2yGgy
	 jCAsx9CiXFsbaSP4bRiIElx1lMoXlvsfUUjh4PpfAovD7HtzCXoUFeGtJrPM3YUQO7N1C
	 fX1HkEYHsf5KorRIE7eG8ybfjNU3+UWBoVw6PHz3nLe41PEClu3VtPVRRqEvifmzptzOI
	 cmJIU+GEP5XAIYDSzkHWcLUltgYSZwwDES140qdLznB3vFM4xKXZL+K4CDhBXSIm3g+7J
	 ZkXkYNe+2ma1IUStZAMIMXYKnduACDkSutcJnX2caPfBF8MSqTL/ONhGXUFyh0rDkR2xP
	 rPRm2amIpUmLpZeCngIlyCHdZUMYZdMX7Y3VkrjhoxTjGrqziPITWe08kI+XLKXhDuJl/
	 zs8hrNE0DcsY2fMHD/DtF/i6TYc0KnVRLLfbXjG/JebtRDK65+fn+UJEd40SeAGniQ3qs
	 c4CKwx6lyaTXzmpOOgkI7IKSk4U9kZd7GJH6XEoY2q0F/fSCnFM9/6bkROTE/yUN31Bw+
	 EMi/2jXWVqXuCpU9+yJ0tf95uRIYdOBm97Q48CoyecNTAa1ONsw7Ndl4S6GecqDa3R1nD
	 SqmmH0nSvfqkCb9GFqNP4A0dJSG43tKMAj0D3WHD+x+UgCge1FQwtzjnVBdIp+4=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1767647525;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=hmrUncizQe8f9wwReEAF/w1zYnSKq61MzoVCTzB7rHQ=;
	b=weF8nNVnXAroTX2Y4WqHcu2pWgOjOWbmbqlrwQ7SkPHM4COsR/44+6hfUUa+bWbG6Pbf
	 jbExfE9XKity/SNf+jlity/vBguE+1V1US8uGNY5v0o2lhX0fDxv0D0rCKgJqiz3Ev5J7
	 KBTR2uAkf5WzC1h1bbiYLwuq8vUPLGNs1CBcmN2t2hKlAj6Ma+bGsfRIa05X8i3X2r6N0
	 EhpMAqvJi1hxUemRP020urtAHqvt3Rlz6lN/4Rk8er9JZipW7tpp9ES3ZQ27rqheE+KrQ
	 QcY5+H54NHHZjbeCKP9Dk3jaucp5gcYSazcG/lJn5hmKgy6YVXKh0TPYRFOaNMpiXzH01
	 OB3ITSb4C/2oLro2AKcO8MRrs8UoKC+6s10baN4Y2kO3r5lfWcb1BfF2IhH6N7Kmc4MhS
	 tdXj6BPoY5ww89sPLPnZ1F+E+BDkch2UKxaqOmErELb/RTNYFIqBagooc9HWq7x9Rm8it
	 tMltb3Jser2V6XQt+Lldjx5EKq9uycY8FlX9Vr7qf5nysbMDcDqJY59I2SF12V86LwoBA
	 URQkRJKUIVgZEHCK/YwUU0ayN7edqQtd2s3bijo3sPmeVYZEzXr5z0U+/UeijNv2YGi2C
	 8vFt3rPtHxfUyYE0VAoyiBNOZqF6dXVTgJXky165ejed6NG8r0pCHw7A/Y6aCwg=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Mon, 05 Jan 2026 22:12:04 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, "consulting @ bugseng . com"
 <consulting@bugseng.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?R?=
 =?UTF-8?Q?oger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: ARM64 notes: Re: [PATCH] CI: Extend eclair-*-allcode to enable as
 much as possible
In-Reply-To: <82d99c52-c39b-4fbb-bbb2-0e952df91673@citrix.com>
References: <20260105122436.555444-1-andrew.cooper3@citrix.com>
 <82d99c52-c39b-4fbb-bbb2-0e952df91673@citrix.com>
Message-ID: <6609d3d66bb3522770967265f50cdd0d@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2026-01-05 19:14, Andrew Cooper wrote:
> On 05/01/2026 12:24 pm, Andrew Cooper wrote:
>>  eclair-x86_64-testing:
>> @@ -104,6 +122,33 @@ eclair-ARM64-allcode:
>>      LOGFILE: "eclair-ARM64.log"
>>      VARIANT: "ARM64"
>>      RULESET: "monitored"
>> +    EXTRA_XEN_CONFIG: |
>> +      CONFIG_ACPI=y
>> +      CONFIG_ARGO=y
>> +      CONFIG_ARM64_SVE=y
>> +      CONFIG_ARM_SMMU_V3=y
>> +      CONFIG_BOOT_TIME_CPUPOOLS=y
>> +      CONFIG_DEBUG_LOCK_PROFILE=y
>> +      CONFIG_DEBUG_TRACE=y
>> +      CONFIG_DEVICE_TREE_DEBUG=y
>> +      CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP=y
>> +      CONFIG_EXPERT=y
>> +      CONFIG_FFA=y
>> +      CONFIG_FFA_VM_TO_VM=y
>> +      CONFIG_GICV3_ESPI=y
>> +      CONFIG_HAS_ITS=y
>> +      CONFIG_IOREQ_SERVER=y
>> +      CONFIG_IPMMU_VMSA=y
>> +      CONFIG_LIVEPATCH=y
>> +      CONFIG_LLC_COLORING=y
>> +      CONFIG_OPTEE=y
>> +      CONFIG_OVERLAY_DTB=y
>> +      CONFIG_PCI_PASSTHROUGH=y
>> +      CONFIG_PERF_ARRAYS=y
>> +      CONFIG_PERF_COUNTERS=y
>> +      CONFIG_STACK_PROTECTOR=y
>> +      CONFIG_UNSUPPORTED=y
>> +      CONFIG_VM_EVENT=y
>>    allow_failure: true
> 
> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/12604499722
> shows 122 failures in otherwise-clean guidelines.  Some observations:
> 
> llc-colouring.c uses binary literals.  These are safe to use now since
> 4.21 with the updated toolchain baseline, but the Eclair config wants
> updating to allow this language extension.
> 

Yeah (though I don't see a strong reason to do so, for a single 
literal); I can write the patch.

Also xen/arch/arm/acpi/boot.c could use __func__ as almost everywhere 
else in xen/

> ipmmu-vmsa.c has a git:// url inside a block comment, which is
> considered to be a Rule 3.1 violation.  In principle this ought to fix 
> it:
> 

Indeed it should.

> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
> b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 7dee4a488d45..8f5fc6c93bc5 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -60,7 +60,7 @@ removed by the compiler, the resulting slowdown is 
> negligible."
>  
>  -doc_begin="Comments starting with '/*' and containing hyperlinks are 
> safe as
>  they are not instances of commented-out code."
> --config=MC3A2.R3.1,reports+={safe, 
> "first_area(text(^.*https?://.*$))"}
> +-config=MC3A2.R3.1,reports+={safe, 
> "first_area(text(^.*(https?|git)://.*$))"}
>  -doc_end
>  
>  #
> 
> 
> but I've not tried it yet.
> 
> There's a R8.4 violation against __stack_chk_guard.  I think this wants
> deviating locally, because it's a fairly magic construct.
> 

ack.

> Other than that, there's a smattering of violations.  Some will be 
> fixed
> by some work I've got pending for the x86 side of things, but most are
> specific to arch/arm/.
> 
> ~Andrew

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

