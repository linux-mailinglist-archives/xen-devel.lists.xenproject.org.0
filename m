Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3F22CDDFD
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 19:48:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43924.78838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkte6-00076y-7e; Thu, 03 Dec 2020 18:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43924.78838; Thu, 03 Dec 2020 18:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkte6-00076Z-4L; Thu, 03 Dec 2020 18:48:02 +0000
Received: by outflank-mailman (input) for mailman id 43924;
 Thu, 03 Dec 2020 18:48:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Inx=FH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kkte5-00076U-DY
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 18:48:01 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c9cc0a2-28a5-46c8-acb8-95712f13c692;
 Thu, 03 Dec 2020 18:48:00 +0000 (UTC)
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
X-Inumbo-ID: 3c9cc0a2-28a5-46c8-acb8-95712f13c692
Date: Thu, 3 Dec 2020 10:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607021279;
	bh=fnHQEf2dIJMQWzsuScF0ayLSGLJiph4eWeZhD/3Evjg=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=Need5aTerq+HmBfK7p5NrrZ/dK2rK7N7CCWeo+9z3oyoticPoIO1UwJOUQcgEIw1R
	 Dd8Olm5yju+TphIGRkjv6QaJbXH4AhWJLLqytiBMmIk7QiGakqDG5Pvb8RLd3eUJId
	 yqcWyZpQ0ZIJNCY3C6tsTJqvhZw+oSnKAZeMqSTVA8EwUG8OzONLj4VLg36ssfWHwX
	 lqsY11+nr+H5hgRhM2iizlioDIv8TsoerQA0edLg7A6cpYTCTKiHoWbKBv+vAXFTi1
	 sWSlztAy8gyBYeqpZWC+T1M1YRv6ShyGfKrk3Zp4HgUVkXBc+fdN3QDyFYXiergmq/
	 oppthOVwKUd9A==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <Rahul.Singh@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
    Paul Durrant <paul@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 8/8] xen/arm: Add support for SMMUv3 driver
In-Reply-To: <BD247B69-7201-41E2-8687-49924B7396CA@arm.com>
Message-ID: <alpine.DEB.2.21.2012031045420.32240@sstabellini-ThinkPad-T480s>
References: <cover.1606406359.git.rahul.singh@arm.com> <de2101687020d18172a2b153f8977a5116d0cd66.1606406359.git.rahul.singh@arm.com> <alpine.DEB.2.21.2012011749550.1100@sstabellini-ThinkPad-T480s> <1912278a-13f4-885d-d1ca-cc130718d064@xen.org>
 <alpine.DEB.2.21.2012021958020.30425@sstabellini-ThinkPad-T480s> <BD247B69-7201-41E2-8687-49924B7396CA@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Dec 2020, Rahul Singh wrote:
> > On 3 Dec 2020, at 4:13 am, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > On Wed, 2 Dec 2020, Julien Grall wrote:
> >> On 02/12/2020 02:51, Stefano Stabellini wrote:
> >>> On Thu, 26 Nov 2020, Rahul Singh wrote:
> >>>> +/* Alias to Xen device tree helpers */
> >>>> +#define device_node dt_device_node
> >>>> +#define of_phandle_args dt_phandle_args
> >>>> +#define of_device_id dt_device_match
> >>>> +#define of_match_node dt_match_node
> >>>> +#define of_property_read_u32(np, pname, out) (!dt_property_read_u32(np,
> >>>> pname, out))
> >>>> +#define of_property_read_bool dt_property_read_bool
> >>>> +#define of_parse_phandle_with_args dt_parse_phandle_with_args
> >>> 
> >>> Given all the changes to the file by the previous patches we are
> >>> basically fully (or almost fully) adapting this code to Xen.
> >>> 
> >>> So at that point I wonder if we should just as well make these changes
> >>> (e.g. s/of_phandle_args/dt_phandle_args/g) to the code too.
> >> 
> >> I have already accepted the fact that keeping Linux code as-is is nearly
> >> impossible without much workaround :). The benefits tends to also limited as
> >> we noticed for the SMMU driver.
> >> 
> >> I would like to point out that this may make quite difficult (if not
> >> impossible) to revert the previous patches which remove support for some
> >> features (e.g. atomic, MSI, ATS).
> >> 
> >> If we are going to adapt the code to Xen (I'd like to keep Linux code style
> >> though), then I think we should consider to keep code that may be useful in
> >> the near future (at least MSI, ATS).
> > 
> > (I am fine with keeping the Linux code style.)
> > 
> > We could try to keep the code as similar to Linux as possible. This
> > didn't work out in the past.
> > 
> > Otherwise, we could fully adapt the driver to Xen. If we fully adapt the
> > driver to Xen (code style aside) it is better to be consistent and also
> > do substitutions like s/of_phandle_args/dt_phandle_args/g. Then the
> > policy becomes clear: the code comes from Linux but it is 100% adapted
> > to Xen.
> > 
> > 
> > Now the question about what to do about the MSI and ATS code is a good
> > one. We know that we are going to want that code at some point in the
> > next 2 years. Like you wrote, if we fully adapt the code to Xen and
> > remove MSI and ATS code, then it is going to be harder to add it back.
> > 
> > So maybe keeping the MSI and ATS code for now, even if it cannot work,
> > would be better. I think this strategy works well if the MSI and ATS
> > code can be disabled easily, i.e. with a couple of lines of code in the
> > init function rather than #ifdef everywhere. It doesn't work well if we
> > have to add #ifdef everywhere.
> > 
> > It looks like MSI could be disabled adding a couple of lines to
> > arm_smmu_setup_msis.
> > 
> > Similarly ATS seems to be easy to disable by forcing ats_enabled to
> > false.
> > 
> > So yes, this looks like a good way forward. Rahul, what do you think?
> 
> 
> I am ok to have the PCI ATS and MSI functionality in the code. 
> As per the discussion next version of the patch will include below modification:Please let me know if there are any suggestion overall that should be added in next version.
> 
> 1. Keep the PCI ATS and MSI functionality code.

I'll repeat one point I wrote above that I think it is important: please
try to disable ATS and MSI without invasive changes, ideally just a
couple of lines to force-disable each feature.


> 2. Make the code with XEN compatible ( remove linux compatibility functions)
> 3. Keep the Linux coding style for code imported from Linux.
> 4. Fix all comments.

Sounds good.


> I have one query what will be coding style for new code to make driver work  for XEN ? 

We try to keep the same code style for the entirety of a source file. In
this case, the whole driver should use Linux code style (both imported
code and new code).

