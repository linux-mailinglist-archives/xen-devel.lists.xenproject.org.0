Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DB16A79BB
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 03:58:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504298.776920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXZ8x-0005iC-Tz; Thu, 02 Mar 2023 02:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504298.776920; Thu, 02 Mar 2023 02:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXZ8x-0005fv-QU; Thu, 02 Mar 2023 02:58:07 +0000
Received: by outflank-mailman (input) for mailman id 504298;
 Thu, 02 Mar 2023 02:58:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4tCB=62=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pXZ8w-0005fn-HF
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 02:58:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cb07be3-b8a6-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 03:58:04 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 34F3B6153A;
 Thu,  2 Mar 2023 02:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3352CC433D2;
 Thu,  2 Mar 2023 02:58:01 +0000 (UTC)
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
X-Inumbo-ID: 0cb07be3-b8a6-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677725882;
	bh=YhNasGejWCQOtt657TE7BeiFgCSOFUVKo476vfd1qqM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HfU/Ol3uZ00xaAagbJgmGiKR1oB7D55sGe4F4CjEAqIvPSbKiMTidDCCdjf85au7b
	 T2z0xfDRlCkg7Tm+7UjBOoXnBaYYOlP7S3rQAzhhbfMyMJUI8VaOtpDPoqHk0G+C6u
	 59XQjqR4k6MPkzBBDYcJrbqijsthrC8GVyryEBBrRifQV0+6HmSXxfgmOp/btJDdq+
	 bj4+QfscVI1fJ+uS12NOCcOcodAxSbliHiDkffMSJTzcV5ILlgzEI3WAdl1i7Gy7vt
	 MuQO+pyj9WgyOgfZ/EZwe8LDcEa6A7Va751xhUvnhO1eSQAGY/qSHELJGGOup4Q+HA
	 ttpacKa+Ay2vA==
Date: Wed, 1 Mar 2023 18:57:59 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Jan Beulich <jbeulich@suse.com>, Luca Fancellu <Luca.Fancellu@arm.com>, 
    Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 07/10] xen/physinfo: add arm SVE arch capability and
 vector length
In-Reply-To: <83BA2CB8-3CF5-4E4D-993C-026D0A19D277@arm.com>
Message-ID: <alpine.DEB.2.22.394.2303011857530.686499@ubuntu-linux-20-04-desktop>
References: <20230202110816.1252419-1-luca.fancellu@arm.com> <20230202110816.1252419-8-luca.fancellu@arm.com> <f1673cb6-6f4f-be53-ef82-2ea2045533fa@suse.com> <781EDC8B-B24C-431F-AB08-F2ACF64E4D4E@arm.com> <083e8a1f-8db6-350a-9138-58751c3fb44b@suse.com>
 <83BA2CB8-3CF5-4E4D-993C-026D0A19D277@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-22522286-1677725881=:686499"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-22522286-1677725881=:686499
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 23 Feb 2023, Bertrand Marquis wrote:
> Hi Jan,
> 
> > On 13 Feb 2023, at 09:36, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > On 10.02.2023 16:54, Luca Fancellu wrote:
> >>> On 2 Feb 2023, at 12:05, Jan Beulich <jbeulich@suse.com> wrote:
> >>> On 02.02.2023 12:08, Luca Fancellu wrote:
> >>>> (is hw_cap only for x86?)
> >>> 
> >>> I suppose it is, but I also expect it would better go away than be moved.
> >>> It doesn't hold a complete set of information, and it has been superseded.
> >>> 
> >>> Question is (and I think I did raise this before, perhaps in different
> >>> context) whether Arm wouldn't want to follow x86 in how hardware as well
> >>> as hypervisor derived / used ones are exposed to the tool stack
> >>> (XEN_SYSCTL_get_cpu_featureset). I guess there's nothing really precluding
> >>> that data to consist of more than just boolean fields.
> >> 
> >> Yes I guess that infrastructure could work, however I don’t have the bandwidth to
> >> put it in place at the moment, so I would like the Arm maintainers to give me a
> >> suggestion on how I can expose the vector length to XL if putting its value here
> >> needs to be avoided
> > 
> > Since you've got a reply from Andrew boiling down to the same suggestion
> > (or should I even say request), I guess it wants seriously considering
> > to introduce abstract base infrastructure first. As Andrew says, time not
> > invested now will very likely mean yet more time to be invested later.
> > 
> >>>> --- a/xen/include/public/sysctl.h
> >>>> +++ b/xen/include/public/sysctl.h
> >>>> @@ -18,7 +18,7 @@
> >>>> #include "domctl.h"
> >>>> #include "physdev.h"
> >>>> 
> >>>> -#define XEN_SYSCTL_INTERFACE_VERSION 0x00000015
> >>>> +#define XEN_SYSCTL_INTERFACE_VERSION 0x00000016
> >>> 
> >>> Why? You ...
> >>> 
> >>>> @@ -104,7 +110,8 @@ struct xen_sysctl_physinfo {
> >>>>    uint32_t cpu_khz;
> >>>>    uint32_t capabilities;/* XEN_SYSCTL_PHYSCAP_??? */
> >>>>    uint32_t arch_capabilities;/* XEN_SYSCTL_PHYSCAP_{X86,ARM,...}_??? */
> >>>> -    uint32_t pad;
> >>>> +    uint16_t arm_sve_vl_bits;
> >>>> +    uint16_t pad;
> >>>>    uint64_aligned_t total_pages;
> >>>>    uint64_aligned_t free_pages;
> >>>>    uint64_aligned_t scrub_pages;
> >>> 
> >>> ... add no new fields, and the only producer of the data zero-fills the
> >>> struct first thing.
> >> 
> >> Yes that is right, I will wait to understand how I can proceed here:
> >> 
> >> 1) rename arch_capabilities to arm_sve_vl_bits and put vector length there.
> >> 2) leave arch_capabilities untouched, no flag creation/setting, create uint32_t arm_sve_vl_bits field removing “pad”,
> >>    Use its value to determine if SVE is present or not.
> >> 3) ??
> > 
> > 3) Introduce suitable #define(s) to use part of arch_capabilities for your
> > purpose, without renaming the field. (But that's of course only if Arm
> > maintainers agree with you on _not_ going the proper feature handling route
> > right away.)
> 
> As Luca said, he does not have the required bandwidth to do this so I think it is ok for him to go with your solution 3.
> 
> @Julien/Stefano: any thoughts here ?

I am OK with that
--8323329-22522286-1677725881=:686499--

