Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA574B5777
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 17:54:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272547.467438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJec3-0007On-81; Mon, 14 Feb 2022 16:54:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272547.467438; Mon, 14 Feb 2022 16:54:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJec3-0007Mo-4Z; Mon, 14 Feb 2022 16:54:07 +0000
Received: by outflank-mailman (input) for mailman id 272547;
 Mon, 14 Feb 2022 16:54:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jv2p=S5=cantab.net=dvrabel@srs-se1.protection.inumbo.net>)
 id 1nJec1-0007Mi-JE
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 16:54:05 +0000
Received: from smarthost01b.sbp.mail.zen.net.uk
 (smarthost01b.sbp.mail.zen.net.uk [212.23.1.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b70914ee-8db6-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 17:54:04 +0100 (CET)
Received: from [82.70.146.41] (helo=pear.davidvrabel.org.uk)
 by smarthost01b.sbp.mail.zen.net.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 (envelope-from <dvrabel@cantab.net>)
 id 1nJebz-0001CO-A7; Mon, 14 Feb 2022 16:54:03 +0000
Received: from apple.davidvrabel.org.uk ([82.70.146.43])
 by pear.davidvrabel.org.uk with esmtp (Exim 4.92)
 (envelope-from <dvrabel@cantab.net>)
 id 1nJebq-0003SX-V9; Mon, 14 Feb 2022 16:54:02 +0000
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
X-Inumbo-ID: b70914ee-8db6-11ec-b215-9bbe72dcb22c
Message-ID: <71b7ebd1-5cc8-54f4-f45d-5da71f2298f6@cantab.net>
Date: Mon, 14 Feb 2022 16:53:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-22-andrew.cooper3@citrix.com>
From: David Vrabel <dvrabel@cantab.net>
In-Reply-To: <20220214125127.17985-22-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 82.70.146.43
X-SA-Exim-Mail-From: dvrabel@cantab.net
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	pear.davidvrabel.org.uk
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no autolearn_force=no version=3.4.2
Subject: Re: [PATCH v2 21/70] xen/evtchn: CFI hardening
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on pear.davidvrabel.org.uk)
X-Originating-smarthost01b-IP: [82.70.146.41]
Feedback-ID: 82.70.146.41

On 14/02/2022 12:50, Andrew Cooper wrote:
> Control Flow Integrity schemes use toolchain and optionally hardware support
> to help protect against call/jump/return oriented programming attacks.
> 
> Use cf_check to annotate function pointer targets for the toolchain.
[...]
> -static void evtchn_2l_set_pending(struct vcpu *v, struct evtchn *evtchn)
> +static void cf_check evtchn_2l_set_pending(
> +    struct vcpu *v, struct evtchn *evtchn)

Why manually annotate functions instead of getting the compiler to 
automatically work it out?

David

