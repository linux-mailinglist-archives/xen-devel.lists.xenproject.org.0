Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA4D42EA1D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 09:28:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209806.366366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbHdZ-0000pQ-31; Fri, 15 Oct 2021 07:28:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209806.366366; Fri, 15 Oct 2021 07:28:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbHdZ-0000n7-00; Fri, 15 Oct 2021 07:28:17 +0000
Received: by outflank-mailman (input) for mailman id 209806;
 Fri, 15 Oct 2021 07:28:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mbHdY-0000mz-0R
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 07:28:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mbHdW-00064c-Io; Fri, 15 Oct 2021 07:28:14 +0000
Received: from [54.239.6.185] (helo=[192.168.0.140])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mbHdW-00044C-CE; Fri, 15 Oct 2021 07:28:14 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=aVbNQ2Xos+phCJl4b+tjmV/GubKei39SKO+4D10YkWM=; b=TBPR0hJTsMDrjQT4+Aqj4+Nu0x
	5LiOXjXlJLhezYy3qqOOO2mgHkjzoJXzB1CYLT9niVcIME5KbXlpkqIQvceYMMvfl60kNEemuQm6c
	hg3jCVV5MWNeL97qcVdz0Tc8QXiO8H9+luaG//ARvvqjq21PpgHUsckj9P4HZAq3zJbo=;
Message-ID: <6f82141c-8a0b-1e30-a996-223f7c0c508d@xen.org>
Date: Fri, 15 Oct 2021 08:28:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v6 3/3] arm/libxl: Emulated PCI device tree node in libxl
 [and 1 more messages]
To: Ian Jackson <iwj@xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, Rahul Singh <rahul.singh@arm.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@arm.com>, Andre Przywara <Andre.Przywara@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <b81b5dea800c8fe47071f3dbd20588b1e472fb99.1633540842.git.rahul.singh@arm.com>
 <7bdac405-a889-15e1-be19-5876f7253855@xen.org>
 <24926.53690.621007.507249@mariner.uk.xensource.com>
 <294BE20A-7E45-405C-BC19-C292295E85E3@arm.com>
 <24927.7235.736221.270358@mariner.uk.xensource.com>
 <8A04B9B2-E816-425E-BF1B-5A8B89F8836C@arm.com>
 <cover.1634221830.git.bertrand.marquis@arm.com>
 <fd9c54a381daa52436b0a1b27cf1bba8e7ff9af9.1634221830.git.bertrand.marquis@arm.com>
 <24936.28385.679884.535704@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <24936.28385.679884.535704@mariner.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ian,

On 14/10/2021 18:54, Ian Jackson wrote:
> (Replying to both the earlier subthread on v5 and to the new v6
> patch.)
> 
> Bertrand Marquis writes ("Re: [PATCH v5 10/11] arm/libxl: Emulated PCI device tree node in libxl"):
>> Now you suggest to add a new field arm_vpci in libxl__domain_create_state.
> 
> Hi.  I was handwaving, hence "probably" :-).  I hadn't actually looked
> at the existing code to see precisely how it would fit.
> 
>> Once we have done that I will need to access this structure to know if I need
>> to add the DT part and somehow to give it a value depending something which
>> for now would the number of pcidevs as there will be no user parameter anymore.
> 
> Right.
> 
> I looked at libxl_arm.c again:
> 
> It seems that the main entrypoint to all this is libxl__prepare_dtb,
> and it is that function you want to do new stuff.  That gets
> libxl_domain_build_info (which is specified by the IDL and comes from
> outside libxl, subject to libxl's default-filling machinery) and
> libxl__domain_build_state (which is the general state struct).
> 
> The information you need is is libxl_domain_create_info.
> libxl__domain_config_setdefault already arranges to set
> c_info->passthrough based on the number of PCI PT devices
> (search for `need_pt` in libxl_create.c).
> 
> That is, as I understand it on ARM vpci should be enabled if
> passthrough is enabled and not otherwise.  That is precisely what
> the variable c_info->passthrough is.

On Arm, c_info->passthrough is also set when assigning platform devives 
(e.g. a non-PCI network card). At least for now, we don't want to create 
a node for vCPI in the Device-Tree because we don't enable the 
emulation. So...

> 
> There is a slight issue because of the distinction between create_info
> and build_info and domain_config (and, the corresponding _state)
> structs.  Currently the DT code ony gets b_info, not the whole
> libxl_domain_config.  These distinctions largely historical nowadays.
> Certainly there is no reason not to pass a pointer to the whole
> libxl_domain_config, rather than just libxl_domain_build_info, into
> libxl__arch_domain_init_hw_description.
> 
> So I think the right approach for this looks something like this:
> 
> 1. Change libxl__arch_domain_init_hw_description to take
>     libxl_domain_config* rather than libxl_domain_build_info*.
>     libxl_domain_config contains libxl_domain_build_info so
>     this is easy.
> 
>     If you put in a convenience alias variable for the
>     libxl_domain_build_info* you can avoid extra typing in the function
>     body.  (If you call the convenience alias `info` you won't need to
>     change the body at all, but maybe `info` isn't the best name so you
>     could rename it to `b_info` maybe; up to you.)
> 
> 2. Make the same change to libxl__prepare_dtb.
> 
> 3. Now you can use d_config->c_info.passthrough to gate the addition
>     of the additional stuff to the DT.  Ie, that is a respin of this
>     patch 3/3.

... we will need to check d_config->num_pcidevs for the time being.

Cheers,

-- 
Julien Grall

