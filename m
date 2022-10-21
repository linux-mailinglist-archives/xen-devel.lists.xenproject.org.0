Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A8B607CD5
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 18:53:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427891.677479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olvGE-0004nF-F9; Fri, 21 Oct 2022 16:52:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427891.677479; Fri, 21 Oct 2022 16:52:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olvGE-0004kt-CK; Fri, 21 Oct 2022 16:52:42 +0000
Received: by outflank-mailman (input) for mailman id 427891;
 Fri, 21 Oct 2022 16:52:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1olvGC-0004kn-WD
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 16:52:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1olvGC-0007Ul-4V; Fri, 21 Oct 2022 16:52:40 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.29.168]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1olvGB-00005l-U1; Fri, 21 Oct 2022 16:52:40 +0000
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
	bh=rNAHhd7S3FOCyRv5Y30603mfan5Bm8aHVgUxVRLs5NU=; b=ryRCba2qerdrYzwQ5NY0icA2Qu
	l0pQT5HBqcuWyxTcw4qkJktHNELGdmWQdVwNkuvyYVA1Tn2tSLajJIo+4y1UlM6HeabiGsebtgG0y
	CHJEMWH8EvXNdjqtPbWK2kjS4xYgry8WE30Juey6ckP9QjqGX2G2XCvdf+r1tHIIV+VM=;
Message-ID: <e5144326-2784-0d3a-b7af-453bcf6ac3b1@xen.org>
Date: Fri, 21 Oct 2022 17:52:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH 08/12] Revert "xen/arm: setup: Add Xen as boot module
 before printing all boot modules"
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, jbeulich@suse.com, stefano.stabellini@amd.com,
 wl@xen.org, marco.solieri@unimore.it, andrea.bastoni@minervasys.tech,
 lucmiccio@gmail.com, Marco Solieri <marco.solieri@minervasys.tech>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-9-carlo.nonato@minervasys.tech>
 <a073d250-ade5-8048-e638-025dcf90ba96@xen.org>
 <CAG+AhRUn6ntUDc1tNqKsGjAn1mNH=hhU1tn6tTLKxF_q5tZNdQ@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAG+AhRUn6ntUDc1tNqKsGjAn1mNH=hhU1tn6tTLKxF_q5tZNdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/09/2022 14:54, Carlo Nonato wrote:
> Hi Julien,

Hi Carlo,

> On Sat, Sep 10, 2022 at 4:01 PM Julien Grall <julien@xen.org> wrote: > Do you have any suggestions? Is it ok to add the print to this very patch
> explaining why I added that (since it would edit the clean revert)?

I would consider to the call to early_print_info() after the Xen module 
is created.

Cheers,

-- 
Julien Grall

