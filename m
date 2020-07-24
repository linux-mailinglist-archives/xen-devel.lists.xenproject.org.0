Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBF022CD1B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 20:22:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz2KJ-0004Sd-ES; Fri, 24 Jul 2020 18:21:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5T8C=BD=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jz2KI-0004SY-3P
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 18:21:46 +0000
X-Inumbo-ID: 8747e804-cdda-11ea-a453-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8747e804-cdda-11ea-a453-12813bfff9fa;
 Fri, 24 Jul 2020 18:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hO0CSEXxuhKjrfiNoF3MGAgwLOea+8O5dKayf8r11Kg=; b=6MaQjDvh1gcFxQbYEpQuMzHXcv
 blNxyXVDwb19re9Ze2/7evB1AmTvRrDTGabKl6mRJ+PECUnpJr604rp+c1VYfOxpZ1nmRouQZMWIT
 VcHBhiQ4JCJq4PH1YBx8e9jSnijcv4vRLIROBUTXACYR4jPY3n6jO9rUvswOwou0rXQU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jz2KF-0007Cd-Lf; Fri, 24 Jul 2020 18:21:43 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jz2KF-0006zd-Ag; Fri, 24 Jul 2020 18:21:43 +0000
Subject: Re: [RFC PATCH v1 1/4] arm/pci: PCI setup and PCI host bridge
 discovery within XEN on ARM.
To: Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1595511416.git.rahul.singh@arm.com>
 <64ebd4ef614b36a5844c52426a4a6a4a23b1f087.1595511416.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2007231055230.17562@sstabellini-ThinkPad-T480s>
 <9f09ff42-a930-e4e3-d1c8-612ad03698ae@xen.org>
 <alpine.DEB.2.21.2007241036460.17562@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <40582d63-49c7-4a51-b35b-8248dfa34b66@xen.org>
Date: Fri, 24 Jul 2020 19:21:41 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2007241036460.17562@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: Rahul Singh <rahul.singh@arm.com>, andrew.cooper3@citrix.com,
 Bertrand.Marquis@arm.com, jbeulich@suse.com, xen-devel@lists.xenproject.org,
 nd@arm.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 24/07/2020 18:41, Stefano Stabellini wrote:
> On Fri, 24 Jul 2020, Julien Grall wrote:
>> On 24/07/2020 00:38, Stefano Stabellini wrote:
>> The segment number is just a value defined by the software. So as long as
>> Linux and Xen agrees with the number, then we should be ok.
> 
> As far as I understand a Linux "domain" (linux,pci-domain in device
> tree) is a value defined by the software. The PCI segment has a
> definition in the PCI spec and it is returned by _SEG on ACPI systems.
> 
> The link above suggests that a Linux domain corresponds to (_SEG,
> _BBN) where _SEG is the segment and _BBN is the "Bus Number".
>
> I just would like to be precise with the terminology: if we are talking
> about domains in the linux sense of the word, as it looks like we are
> doing, then let's call them domain instead of segments which seem to
> have a different definition.

You seem to argue on the name but this doesn't resolve the underlying 
problem. Indeed, all our external interfaces are expecting a segment number.

If they are not equal, then I fail to see why it would be useful to have 
this value in Xen. In which case, we need to use 
PHYSDEVOP_pci_mmcfg_reserved so Dom0 and Xen can synchronize on the 
segment number.

Cheers,

-- 
Julien Grall

