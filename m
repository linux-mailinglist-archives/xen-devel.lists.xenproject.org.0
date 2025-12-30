Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0860ECEA52B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Dec 2025 18:35:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194407.1512812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vadcH-0000Fc-Ue; Tue, 30 Dec 2025 17:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194407.1512812; Tue, 30 Dec 2025 17:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vadcH-0000Ch-RF; Tue, 30 Dec 2025 17:34:41 +0000
Received: by outflank-mailman (input) for mailman id 1194407;
 Tue, 30 Dec 2025 17:34:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bdC4=7E=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vadcG-0000CX-4w
 for xen-devel@lists.xenproject.org; Tue, 30 Dec 2025 17:34:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d097eef0-e5a5-11f0-b15c-2bf370ae4941;
 Tue, 30 Dec 2025 18:34:38 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id A4C634EE0739;
 Tue, 30 Dec 2025 18:34:36 +0100 (CET)
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
X-Inumbo-ID: d097eef0-e5a5-11f0-b15c-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1767116077;
	b=dH2f7C13RYHKtVxI4yZrWfWgypzR0KMXNROahmnwuaQCGpbl3oOvI5Dx3hGimfeqPDc+
	 7eILRGiLWdAs8f8x9PQc4PySB54nslVzjK4N4c4DB9KoixR2icbZZY0bGljYTQCSuuAgV
	 bKrrXEgCGHvTxFfZTZDGqCFjzI0Q2cGuqn7+SOxM0u5pDzKroW+KF9WZFcPOlRcbOLWgb
	 WhbOGeql+IKo3kyEpITYuyeBdV9XZzZT4+O1KplI8GElSRhCP8qGMTiT66cDRR13uys29
	 Ii0iEZllClNDOSnkekRnuAufWQCHJfdUIHJepkSa73tgG1voq/49zN3VDyPX+HIrN4p+X
	 zri2pIv8ZOZm+jZDFNVY+MxcLxPpm945jbodv62BCT3RKw1NvXQ1nDN1YpfKIMa/bF4l6
	 9W0ngcQfcdtaxCXq6V8wBM7MDGhqtNqo582PluBfuyoCctI1B2LZADbo/c42HLM3sWf1d
	 mpIwqXfTjXluyE/pfp5JOpOGag/6gAlaXkayHPSUfgzL2iXatJboGDN5St72P5I70vgeW
	 Wks4oL6heT9eRTk/JZtetXB+AYRNi869MmpxTqMMqFp9foT0QWV4N2aQAOGJM2SvxJySQ
	 qBYSwlw5FHoPUC1b3GDGj0QyZ1EOwZkBaPr6Vd+GtQRCuxhfRHm3LQwNOjpy6gk=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1767116077;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=VD9yZ49TX3PZn18QGlS86Yttz4SfYHRGAunuDNXFAzI=;
	b=18KVQcOnF9WWgEo9cU+IKBbHOAgsaod+NKJpDVx6RL4gHv23Wbjp5+ty2J0LB1GIwgpn
	 l+LvIs/kZqcSu6uvFtpsUYQbsFQ57QeQAVDWnbfZC7yMWETNcG6bT59mMYM+0HWcNdLgf
	 z76ta0zcRWVpj5LMUCiZNJLWaatPQpugjMr6CYZ23Mx5JvkJGXyKdTG0tD7SZgmt9LV8/
	 FSDFM2Mbd1r+iTVbjn0ea6yl3XyCXS2efzgSTcNlxMFryX3gx/rYtbPsBKPOzM00MRqNq
	 o1mGBCVXV6h5MedTXzopKlTt2xLrAA3D9bPQWqHymLj3nh+oNT37vROMZUZq0HGu+AxK1
	 kYlXMNEfHW7C3+5IGhV9EeqTRHX8RC2gP0R4M0vvIaCctUtgm9rZQ3snqjyDxHwgj0p6o
	 gK6Vd5j22uwQRWjcAnSF3Pcs2tHSwgdVetSkUOayU2Gp4EANF7OUAsbBaMGLwAs7pjGm6
	 /LBUM9xiM7iRMJHeaDbJ/snQ9AmiuT04b/TvsBlIujN4aXfdBFRhCsE+FKbR6pOrK74vi
	 rYAW6sTodFWqHL8k5VX0AELTjLuxBHuXHHVU4k55M4Hdm4nGF7qyfH+XPgOoEe8qvuxts
	 oBdJCJmFbkw9fRVC95cMTkn6bS2XM9w2DwRLYE12W8wAUXjlTAWqfsPtmmN75DY=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1767116077; bh=dcfjUV6HjuqtPXYaGHUTDcjrdSCGRSOdJfeSFYXm+SE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SSUXJUOc23OL6m8IkJw6DgDmrWZXUw1xjyt0DssDD3rmq837+MdApKJNpNoz/pvZf
	 h/vIvVcWIl4xo248Im/n5Gcax+e+tTDLB11Rc3VhHJnA37nA7pVTv5bzFWpt9Zdrby
	 GBrNqCYSSOALh4nW3xbCWstMeT6sZIM7RBkPiCho+GeiAs48TtgNlLSR40jiba/sBX
	 TrRBW6sXKgOfiFtHnZVG9CW2xCH77ytOZ/Z9pE088t7FUKFj7Tzy30+e+aaDbkTbtv
	 72UKfZHiky5BHaVkEQj4rm/PL6JIxQpk6dkymsLawh9mBPK3TRF4GCviJ1/75jDzb8
	 XxeIElYyzojRQ==
MIME-Version: 1.0
Date: Tue, 30 Dec 2025 18:34:36 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, consulting@bugseng.com, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: Misra R17.1 in Xen
In-Reply-To: <191589a4-cb8c-4e92-866e-03d9a194db5f@citrix.com>
References: <191589a4-cb8c-4e92-866e-03d9a194db5f@citrix.com>
Message-ID: <d87f8fc638192656fa2a44eb9eff7801@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-12-30 18:05, Andrew Cooper wrote:
> Hello,
> 
> The x86_64-allcode run highlights one new violation of R17.1,
> vmcoreinfo_append_str().  In writing this email, I've found another in
> debugtrace_printk() meaning that we're missing some options in the
> -allcode configuration.
> 
> In deviations.ecl we have:
> 
> -doc_begin="printf()-like functions are allowed to use the variadic 
> features provided by stdarg.h."
> -config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printk\\(.*\\)$)))"}
> -config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printf\\(.*\\)$)))"}
> -config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(panic)&&kind(function))))"}
> -config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(elf_call_log_callback)&&kind(function))))"}
> -config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vprintk_common)&&kind(function))))"}
> -config=MC3A2.R17.1,macros+={hide , "^va_(arg|start|copy|end)$"}
> -doc_end
> 
> 
> First, we have no printf() so that row should be removed.
> 

I think it was for other variants of printf that are present in Xen 
(e.g. vsnprintf). Perhaps it could be restricted a bit to be more 
explicit.

> But, more importantly this is safe if and only if the function
> declaration uses __attribute__((__format__(printf, ...))) to cause the
> compiler to perform format typechecking.
> 
> Is it possible to encode this attribute requirement in the Eclair
> expression, so that e.g. accidentally dropping the attribute causes a
> violation to be reported?  This would also be rather safer than 
> assuming
> that any prefix on printk() is safe.
> 

Well, the UBs associated to that rule (to varargs in general) go beyond 
the formatting issues, but checking that the function decl has the 
attribute is a good suggestion to harden these deviations. I'll make 
some experiments and report back on this thread.

> Thanks,
> 
> ~Andrew

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

