Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2360B36A7E7
	for <lists+xen-devel@lfdr.de>; Sun, 25 Apr 2021 17:13:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117236.223051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lagQD-0007M4-IH; Sun, 25 Apr 2021 15:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117236.223051; Sun, 25 Apr 2021 15:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lagQD-0007Lf-Ez; Sun, 25 Apr 2021 15:11:45 +0000
Received: by outflank-mailman (input) for mailman id 117236;
 Sun, 25 Apr 2021 15:11:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lagQC-0007La-19
 for xen-devel@lists.xenproject.org; Sun, 25 Apr 2021 15:11:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lagQA-0003kz-9C; Sun, 25 Apr 2021 15:11:42 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lagQA-0007Hi-2d; Sun, 25 Apr 2021 15:11:42 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=7C6eqqB4u8svDNxQWrKNWGDuzYXTR3XnATeXIg04FiY=; b=xhyri9Shxt5jirzCtdBPoop/fC
	1r7njQsj2OcZiWCiME8zT3ILppbsBugYNLiHad3nYUn7/dGHbqZaFqSpWtmtZ5G0VunExgbQfOvZd
	vTcgAdtumc+sutip7i1iUf9fKxdXvZPd4sBxjGMCONeJGBXxLljitVowjXXAExq0d0ac=;
Subject: Re: [PATCH RFC 4/6] xen/arm: mm: Allow other mapping size in
 xen_pt_update_entry()
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20201119190751.22345-1-julien@xen.org>
 <20201119190751.22345-5-julien@xen.org>
 <alpine.DEB.2.21.2011191706420.7979@sstabellini-ThinkPad-T480s>
 <1ba4afef-7efa-6d1a-5929-ec2652dbbb21@xen.org>
 <alpine.DEB.2.21.2011231409050.7979@sstabellini-ThinkPad-T480s>
 <eff4cb40-ac90-940c-aa97-16a5021386d3@xen.org>
 <alpine.DEB.2.21.2011231612330.7979@sstabellini-ThinkPad-T480s>
 <d02e29cb-a4f1-4ebe-a04f-67b4a159a193@xen.org>
 <alpine.DEB.2.21.2011301359290.1100@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <7aa25179-2926-d829-3fac-41aeda61dd4f@xen.org>
Date: Sun, 25 Apr 2021 16:11:40 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2011301359290.1100@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 30/11/2020 22:05, Stefano Stabellini wrote:
> On Sat, 28 Nov 2020, Julien Grall wrote:
>> If you take the ``if`` alone, yes they are alignment check. But if you take
>> the overall code, then it will just compute which mapping size can be used.
>>
>> However, what I am disputing here is "rely" because there are no assumption
>> made on the alignment in the loop (we are able to cater any size). In fact,
>> the fact mfn and vfn should be aligned to the mapping size is a requirement
>> from the hardware and not the implementation.
> 
> OK, maybe the "rely" gives a bad impression. What about:
> 
> This loop relies on mfn, vfn, and nr_mfn, to be all superpage aligned
> (mfn and vfn have to be architecturally), and it uses `mask' to check
> for that.
 >
> Feel free to reword it differently if you have a better idea.
I have used your new wording proposal.

Cheers,

-- 
Julien Grall

