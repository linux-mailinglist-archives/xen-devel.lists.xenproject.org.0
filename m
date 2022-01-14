Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D90948E867
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jan 2022 11:40:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257585.442717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8JzK-0001p4-N1; Fri, 14 Jan 2022 10:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257585.442717; Fri, 14 Jan 2022 10:39:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8JzK-0001ml-I6; Fri, 14 Jan 2022 10:39:18 +0000
Received: by outflank-mailman (input) for mailman id 257585;
 Fri, 14 Jan 2022 10:39:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cu2m=R6=cantab.net=dvrabel@srs-se1.protection.inumbo.net>)
 id 1n8JzI-0001mf-N8
 for xen-devel@lists.xenproject.org; Fri, 14 Jan 2022 10:39:16 +0000
Received: from smarthost01c.sbp.mail.zen.net.uk
 (smarthost01c.sbp.mail.zen.net.uk [212.23.1.5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3753488d-7526-11ec-9bbc-9dff3e4ee8c5;
 Fri, 14 Jan 2022 11:39:15 +0100 (CET)
Received: from [82.70.146.41] (helo=pear.davidvrabel.org.uk)
 by smarthost01c.sbp.mail.zen.net.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 (envelope-from <dvrabel@cantab.net>)
 id 1n8JzE-0003Ce-DN; Fri, 14 Jan 2022 10:39:12 +0000
Received: from apple.davidvrabel.org.uk ([82.70.146.43])
 by pear.davidvrabel.org.uk with esmtp (Exim 4.92)
 (envelope-from <dvrabel@cantab.net>)
 id 1n8Jz6-0003ie-1J; Fri, 14 Jan 2022 10:39:11 +0000
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
X-Inumbo-ID: 3753488d-7526-11ec-9bbc-9dff3e4ee8c5
Message-ID: <0a6e1a87-5ad5-f434-5b80-acd1aae01378@cantab.net>
Date: Fri, 14 Jan 2022 10:39:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: David Vrabel <dvrabel@amazon.co.uk>, xen-devel@lists.xenproject.org,
 Paul Durrant <paul@xen.org>
References: <20220107125542.212725-1-dvrabel@amazon.co.uk>
 <2b137ad7-a022-bc6d-5551-3c01aa179261@suse.com>
From: David Vrabel <dvrabel@cantab.net>
In-Reply-To: <2b137ad7-a022-bc6d-5551-3c01aa179261@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 82.70.146.43
X-SA-Exim-Mail-From: dvrabel@cantab.net
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	pear.davidvrabel.org.uk
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,SPF_NEUTRAL
	autolearn=no autolearn_force=no version=3.4.2
Subject: Re: [PATCH] x86/hvm: reserve another HVM context save record ID for
 Amazon
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on pear.davidvrabel.org.uk)
X-Originating-smarthost01c-IP: [82.70.146.41]
Feedback-ID: 82.70.146.41



On 14/01/2022 07:08, Jan Beulich wrote:
> On 07.01.2022 13:55, David Vrabel wrote:
>> Amazon's guest transparent live migration work needs another save
>> record (for event channel upcall vectors). Reserve another HVM context
>> save record ID for this.
> 
> I have to admit that I have reservations: I didn't really like seeing
> the original range getting reserved. Even less so I'd like to see
> extensions / further such reservations. The more that iirc the
> original reservation was accepted based on a (perhaps vague) promise
> of the respective uses actually getting upstreamed. Yet that hasn't
> happened (nor even started to happen) in slightly over 2 years time,
> iirc.

I think this is fair. I hadn't realized we'd sat on this work for so long.

> What I could see as a compromise is to have, say, vendor ranges
> higher up in number space.

I (personally) would accept removing the reservation entirely -- we 
didn't follow the upstreaming process, so we take the cost of fixing up 
any compatibility issues.

David

