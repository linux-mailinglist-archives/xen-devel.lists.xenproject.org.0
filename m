Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C894A22C43A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 13:19:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyvjB-00015x-VD; Fri, 24 Jul 2020 11:19:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5T8C=BD=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jyvjA-00015s-Tl
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 11:19:00 +0000
X-Inumbo-ID: 78d43754-cd9f-11ea-a3ae-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 78d43754-cd9f-11ea-a3ae-12813bfff9fa;
 Fri, 24 Jul 2020 11:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EtP3ZpHeanLiq0448Cy//mqBKi2jh5zhhEKmkXDffD8=; b=JFairxnP4OUvqGOWa1fCuGcKHs
 8fS8lxZwwTycr4HLjYIGgbJrkf5J2UVjwG+h9CgvgHx8nnjTFBez6mubOaoNRkHwsKHC/iEpHpPUa
 XduD5E5ONffWcFje8TnFFEREowR/m+1oe+CdVGsfb2HsrwVtDg1spL9C2t3LJ1STYF4A=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jyvj8-00062X-Ax; Fri, 24 Jul 2020 11:18:58 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jyvj8-0003lC-4G; Fri, 24 Jul 2020 11:18:58 +0000
Subject: Re: dom0 LInux 5.8-rc5 kernel failing to initialize cooling maps for
 Allwinner H6 SoC
To: Amit Tomer <amittomer25@gmail.com>
References: <CA+wirGqXMoRkS-aJmfFLipUv8SdY5LKV1aMrF0yKRJQaMvzs6Q@mail.gmail.com>
 <1c5cee83-295e-cc02-d018-b53ddc6e3590@xen.org>
 <CABHD4K87aqCxsaW+j7uiM3kWQeHjSb+zQEs2p-SuYu83V-g38Q@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0dd0dba3-de51-ae76-ce57-41323fc6fb2c@xen.org>
Date: Fri, 24 Jul 2020 12:18:56 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CABHD4K87aqCxsaW+j7uiM3kWQeHjSb+zQEs2p-SuYu83V-g38Q@mail.gmail.com>
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alejandro <alejandro.gonzalez.correo@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 24/07/2020 12:17, Amit Tomer wrote:
> Hi,

Hi,

>> I remember this discussion. The problem was that the PMU is using
>> per-CPU interrupts. Xen is not yet able to handle PPIs as they often
>> requires more context to be saved/restored (in this case the PMU context).
>>
>> There was a proposal to look if a device is using PPIs and just remove
>> them from the Device-Tree. Unfortunately, I haven't seen any official
>> submission for this patch.
> 
> But we have this patch that remove devices using PPIs
> http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=9b1a31922ac066ef0dffe36ebd6a6ba016567d69

Urgh, I forgot we merged it. I should have double-checked the tree. 
Apologies for that.

Cheers,

-- 
Julien Grall

