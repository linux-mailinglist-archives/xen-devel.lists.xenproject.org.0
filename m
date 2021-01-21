Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C3C2FE860
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 12:08:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72002.129379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2XoM-0002Vi-H8; Thu, 21 Jan 2021 11:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72002.129379; Thu, 21 Jan 2021 11:07:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2XoM-0002V0-DW; Thu, 21 Jan 2021 11:07:34 +0000
Received: by outflank-mailman (input) for mailman id 72002;
 Thu, 21 Jan 2021 10:55:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I98w=GY=codiax.se=anders.tornqvist@srs-us1.protection.inumbo.net>)
 id 1l2XcF-0001UT-Km
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 10:55:04 +0000
Received: from mailrelay2-3.pub.mailoutpod1-cph3.one.com (unknown
 [46.30.212.11]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1cbe8209-6459-47e1-8c5a-db4296f91559;
 Thu, 21 Jan 2021 10:54:59 +0000 (UTC)
Received: from [192.168.101.129] (h77-53-239-0.cust.a3fiber.se [77.53.239.0])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 1a5d0810-5bd7-11eb-b55b-d0431ea8a290;
 Thu, 21 Jan 2021 10:54:58 +0000 (UTC)
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
X-Inumbo-ID: 1cbe8209-6459-47e1-8c5a-db4296f91559
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codiax.se; s=20191106;
	h=content-transfer-encoding:content-type:mime-version:date:message-id:subject:
	 from:to:from;
	bh=ypnQ06+b2xoX0izYOZjELVwGiJ/cjUIZL8rQPevSh0c=;
	b=m1vl0jops3lWh8s5iAdCz5t/x2jf2cDi6L/nb5hpyBgXeOHzRxB/QDlLEztZYgaugiY0VhjlkKFh1
	 qtg3evvKzvFQ4ARhFIJRLCf2CLeL3HBk01JqWggK35dun2eiKffhxK3qhwMFETLtos7KVkEWOa/83n
	 VSTKykwZ1zsUycyzXYnMG9eQ6XlcX9Jt2MIbx69847O9N7PTfjUQKvx+HxescSZaNYUi4gUfiuoabk
	 JzE5pxpO1Spcme9r88Ue+plk0mYa6W177/7t3EI2r3PK/ejWTxwNflvHCM2d2PD3KKP0BmNJn2QKOR
	 qGDZmN7sLK7pg5LNx41RYIhLMS4AaYQ==
X-HalOne-Cookie: f039374c1ea36113aeb8fde5a08da09b917970d5
X-HalOne-ID: 1a5d0810-5bd7-11eb-b55b-d0431ea8a290
To: xen-devel@lists.xenproject.org
From: =?UTF-8?Q?Anders_T=c3=b6rnqvist?= <anders.tornqvist@codiax.se>
Subject: Null scheduler and vwfi native problem
Message-ID: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
Date: Thu, 21 Jan 2021 11:54:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

Hi,

I see a problem with destroy and restart of a domain. Interrupts are not 
available when trying to restart a domain.

The situation seems very similar to the thread "null scheduler bug" 
https://lists.xenproject.org/archives/html/xen-devel/2018-09/msg01213.html.

The target system is a iMX8-based ARM board and Xen is a 4.13.0 version 
built from https://source.codeaurora.org/external/imx/imx-xen.git.

Xen is booted with sched=null vwfi=native.
One physical CPU core is pinned to the domu.
Some interrupts are passed through to the domu.

When destroying the domain with xl destroy etc it does not complain but 
then when trying to restart the domain
again with a "xl create <domain cfg>" I get:
(XEN) IRQ 210 is already used by domain 1

"xl list" does not contain the domain.

Repeating the "xl create" command 5-10 times eventually starts the 
domain without complaining about the IRQ.

Inspired from the discussion in the thread above I have put printks in 
the xen/common/domain.c file.
In the function domain_destroy I have a printk("End of domain_destroy 
function\n") in the end.
In the function complete_domain_destroy have a printk("Begin of 
complete_domain_destroy function\n") in the beginning.

With these printouts I get at "xl destroy":
(XEN) End of domain_destroy function

So it seems like the function complete_domain_destroy is not called.

"xl create" results in:
(XEN) IRQ 210 is already used by domain 1
(XEN) End of domain_destroy function

Then repeated "xl create" looks the same until after a few tries I also get:
(XEN) Begin of complete_domain_destroy function

After that the next "xl create" creates the domain.


I have also applied the patch from 
https://lists.xenproject.org/archives/html/xen-devel/2018-09/msg02469.html. 
This does seem to change the results.

Starting the system without "sched=null vwfi=native" does not result in 
the problem.

BR
Anders



