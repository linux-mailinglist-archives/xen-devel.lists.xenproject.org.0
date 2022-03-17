Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBA94DC1BF
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 09:46:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291424.494574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUllT-0002Tw-6D; Thu, 17 Mar 2022 08:45:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291424.494574; Thu, 17 Mar 2022 08:45:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUllT-0002Qa-2V; Thu, 17 Mar 2022 08:45:47 +0000
Received: by outflank-mailman (input) for mailman id 291424;
 Thu, 17 Mar 2022 08:45:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=loIP=T4=cantab.net=dvrabel@srs-se1.protection.inumbo.net>)
 id 1nUllS-0002QS-7u
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 08:45:46 +0000
Received: from smarthost01a.ixn.mail.zen.net.uk
 (smarthost01a.ixn.mail.zen.net.uk [212.23.1.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a241d435-a5ce-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 09:45:45 +0100 (CET)
Received: from [82.70.146.41] (helo=pear.davidvrabel.org.uk)
 by smarthost01a.ixn.mail.zen.net.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 (envelope-from <dvrabel@cantab.net>)
 id 1nUllP-00059Y-Ub; Thu, 17 Mar 2022 08:45:43 +0000
Received: from apple.davidvrabel.org.uk ([82.70.146.43])
 by pear.davidvrabel.org.uk with esmtp (Exim 4.92)
 (envelope-from <dvrabel@cantab.net>)
 id 1nUllO-00071h-Pd; Thu, 17 Mar 2022 08:45:43 +0000
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
X-Inumbo-ID: a241d435-a5ce-11ec-8eba-a37418f5ba1a
Message-ID: <0811ec9b-2bf0-89cc-027c-3edd56e1c990@cantab.net>
Date: Thu, 17 Mar 2022 08:45:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, Raphael Ning <raphning@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Raphael Ning <raphning@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, David Vrabel <dvrabel@amazon.co.uk>
References: <6b84a20b2753130cc62406a0fd14d2708f6f504b.1647455219.git.raphning@amazon.com>
 <cb193980-c3e2-23ae-df4d-d0fb2e8da65c@suse.com>
From: David Vrabel <dvrabel@cantab.net>
In-Reply-To: <cb193980-c3e2-23ae-df4d-d0fb2e8da65c@suse.com>
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
X-Originating-smarthost01a-IP: [82.70.146.41]
Feedback-ID: 82.70.146.41



On 17/03/2022 06:28, Juergen Gross wrote:
> On 16.03.22 19:38, Raphael Ning wrote:
>> From: Raphael Ning <raphning@amazon.com>
>>
>> Currently, evtchn_fifo_set_pending() will mark the event as PENDING even
>> if it fails to lock the FIFO event queue(s), or if the guest has not
>> initialized the FIFO control block for the target vCPU. A well-behaved
>> guest should never trigger either of these cases.
> 
> Is this true even for the resume case e.g. after a migration?
> 
> The guests starts on the new host with no FIFO control block for any
> vcpu registered, so couldn't an event get lost with your patch in case
> it was sent before the target vcpu's control block gets registered?

An event that is PENDING but not LINKED is not reachable by the guest so 
it won't ever see such an event, so the event is lost whether the P bit 
is set or not.

Guests ensure that event channels are not bound to VCPUs that don't 
(yet) have FIFO control blocks.

For example, in Linux xen_irq_resume() reinitializes the control blocks 
(in xen_evtchn_resume()) before restoring any of the event channels.

David

