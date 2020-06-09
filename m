Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 342BF1F39B2
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 13:30:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jicRv-0005Uv-5g; Tue, 09 Jun 2020 11:29:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZEd4=7W=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jicRt-0005UR-HQ
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 11:29:45 +0000
X-Inumbo-ID: 814f3254-aa44-11ea-b30e-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 814f3254-aa44-11ea-b30e-12813bfff9fa;
 Tue, 09 Jun 2020 11:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HPqLLjE8XMoM4zusJM9774uLnLFPvCnw9hYmCxWWvdU=; b=soD3VkevoW8DLGwC97kzc6AfMv
 8KQdLcLKGi1pwG3lQTkBBalS/HVDfUlyt16a34O95a11K/KbvtXAyJKXSPMdYRzWRti8Gev9/iZWE
 U5Gr/J9LsnGalN7ClFmKoEhRB3Jx0CUOBtzx54wugEN04IlzoMyz2AKKMHNfiTGj2z0Q=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jicRm-000587-7d; Tue, 09 Jun 2020 11:29:38 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jicRm-0006k7-0k; Tue, 09 Jun 2020 11:29:38 +0000
Subject: Re: XENMAPSPACE_grant_table vs. GNTTABOP_setup_table
To: Anil Madhavapeddy <anil@recoil.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200609094425.GB9734@nodbug.lucina.net>
 <3c7269b9-bf3f-5359-6ce2-049f935c8e84@citrix.com>
 <B13ACF6F-11B5-4E5C-AF94-CD5DE401B1DB@recoil.org>
From: Julien Grall <julien@xen.org>
Message-ID: <314dd258-14de-2d70-eec4-8cbc0a62e75a@xen.org>
Date: Tue, 9 Jun 2020 12:29:36 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <B13ACF6F-11B5-4E5C-AF94-CD5DE401B1DB@recoil.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
Cc: xen-devel@lists.xenproject.org, Martin Lucina <martin@lucina.net>,
 mirageos-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 09/06/2020 11:50, Anil Madhavapeddy wrote:
> On 9 Jun 2020, at 11:22, Andrew Cooper <andrew.cooper3@citrix.com 
> <mailto:andrew.cooper3@citrix.com>> wrote:
>>
>> On 09/06/2020 10:44, Martin Lucina wrote:
>>> Hi,
>>>
>>> I've been making progress on bootstrapping a new, PVHv2 only, Xen 
>>> platform
>>> stack for MirageOS [1]. The basics are now functional and I have 
>>> started to
>>> re-implement the grant table code.
>>>
>>> After studying both the Mini-OS and Linux implementations some, I don't
>>> understand the difference between using XENMAPSPACE_grant_table vs.
>>> GNTTABOP_setup_table to set up the initial grant table mapping for the
>>> guest.
>>>
>>> Are these calls just newer and older ways of accomplishing the same 
>>> thing?
>>> The Linux driver seems to use both in various conditions, whereas Mini-OS
>>> uses the former on ARM and the latter on x86.
>>>
>>> If these are functionally equivalent, then for my purposes I'd rather use
>>> XENMAPSPACE_setup_table, since IIUC this lets me map the grant table 
>>> at an
>>> address of my choosing rather than GNTTABOP_setup_table which at least on
>>> x86_64 appears to be returning PFNs at the top of the address space.
>>>
>>> Any advice much appreciated,
>>
>> There is a little bit of history here...
>>
>> GNTTABOP_setup_table was the original PV way of doing things (specify
>> size as an input, get a list of frames as an output to map), and
>> XENMAPSPACE_grant_table was the original HVM way of doing things (as
>> mapping is the other way around - I specify a GFN which I'd like to turn
>> into a grant table mapping).
>>
>> When grant v2 came along, it was only XENMAPSPACE_grant_table updated to
>> be compatible.  i.e. you have to use XENMAPSPACE_grant_table to map the
>> status frames even if you used GNTTABOP_setup_table previously.
>>
>> It is a mistake that GNTTABOP_setup_table was usable in HVM guests to
>> being with.  Returning -1 is necessary to avoid an information leak (the
>> physical address of the frames making up the grant table) which an HVM
>> guest shouldn't, and has no use knowing.
>>
>> An with that note, ARM is extra special because the grant API is
>> specified to use host physical addresses rather than guest physical (at
>> least for dom0, for reasons of there generally not being an IOMMU),
>> which is why it does use the old PV way.
> 
> Thanks, that makes sense. It doesn't seem too much of a mess from the guest
> perspective to use just XENMAPSPACE_grant_table exclusively then.  With
> Martin's work, the MirageOS Xen backend should just use the latest and 
> greatest
> APIs, with no backwards compatibility to older Xen versions required.
> 
> I'm still a little confused about ARM though -- is there an equivalent of
> XENMAPSPACE_grant_table there? It sounds like we can't leave the
> GNTTABOP macros behind entirely...

XENMAPSPACE_grant_table exists and works perfectly fine on Arm. It is 
using guest physical address as it should.

Cheers,

-- 
Julien Grall

