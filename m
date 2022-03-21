Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BD64E23AE
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 10:55:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292847.497334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWElK-0001Kb-2e; Mon, 21 Mar 2022 09:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292847.497334; Mon, 21 Mar 2022 09:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWElJ-0001He-Vl; Mon, 21 Mar 2022 09:55:41 +0000
Received: by outflank-mailman (input) for mailman id 292847;
 Mon, 21 Mar 2022 09:55:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PUce=UA=cantab.net=dvrabel@srs-se1.protection.inumbo.net>)
 id 1nWElI-0001Dd-O4
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 09:55:40 +0000
Received: from smarthost01b.ixn.mail.zen.net.uk
 (smarthost01b.ixn.mail.zen.net.uk [212.23.1.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 103bbc10-a8fd-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 10:55:39 +0100 (CET)
Received: from [82.70.146.41] (helo=pear.davidvrabel.org.uk)
 by smarthost01b.ixn.mail.zen.net.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 (envelope-from <dvrabel@cantab.net>)
 id 1nWElH-00040p-1H; Mon, 21 Mar 2022 09:55:39 +0000
Received: from apple.davidvrabel.org.uk ([82.70.146.43])
 by pear.davidvrabel.org.uk with esmtp (Exim 4.92)
 (envelope-from <dvrabel@cantab.net>)
 id 1nWElF-0001mL-Ub; Mon, 21 Mar 2022 09:55:38 +0000
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
X-Inumbo-ID: 103bbc10-a8fd-11ec-8fbc-03012f2f19d4
Message-ID: <faae606d-0cb3-43a7-5acd-64da371cc2fe@cantab.net>
Date: Mon, 21 Mar 2022 09:55:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Raphael Ning <raphning@gmail.com>, xen-devel@lists.xenproject.org
Cc: Raphael Ning <raphning@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, David Vrabel <dvrabel@amazon.co.uk>
References: <6b84a20b2753130cc62406a0fd14d2708f6f504b.1647455219.git.raphning@amazon.com>
From: David Vrabel <dvrabel@cantab.net>
In-Reply-To: <6b84a20b2753130cc62406a0fd14d2708f6f504b.1647455219.git.raphning@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 82.70.146.43
X-SA-Exim-Mail-From: dvrabel@cantab.net
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	pear.davidvrabel.org.uk
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no autolearn_force=no version=3.4.2
Subject: Re: [XEN PATCH] evtchn/fifo: Don't set PENDING bit if guest
 misbehaves
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on pear.davidvrabel.org.uk)
X-Originating-smarthost01b-IP: [82.70.146.41]
Feedback-ID: 82.70.146.41

On 16/03/2022 18:38, Raphael Ning wrote:
> Currently, evtchn_fifo_set_pending() will mark the event as PENDING even
> if it fails to lock the FIFO event queue(s), or if the guest has not
> initialized the FIFO control block for the target vCPU. A well-behaved
> guest should never trigger either of these cases.

Reviewed-by: David Vrabel <dvrabel@amazon.co.uk>

David

