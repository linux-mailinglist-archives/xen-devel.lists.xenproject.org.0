Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C86756C4E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 20:41:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564818.882535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLT9X-0002IN-0J; Mon, 17 Jul 2023 18:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564818.882535; Mon, 17 Jul 2023 18:40:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLT9W-0002GZ-T7; Mon, 17 Jul 2023 18:40:58 +0000
Received: by outflank-mailman (input) for mailman id 564818;
 Mon, 17 Jul 2023 18:40:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OuH4=DD=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qLT9W-0002GT-B9
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 18:40:58 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 777d6123-24d1-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 20:40:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 3441B8285276;
 Mon, 17 Jul 2023 13:40:56 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id lBgqF4VjJr-Q; Mon, 17 Jul 2023 13:40:55 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 8C8CB8285369;
 Mon, 17 Jul 2023 13:40:55 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id urAnRz0L1yQL; Mon, 17 Jul 2023 13:40:55 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 175CD8285276;
 Mon, 17 Jul 2023 13:40:55 -0500 (CDT)
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
X-Inumbo-ID: 777d6123-24d1-11ee-b23a-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 8C8CB8285369
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1689619255; bh=ytMlalgUdh22Dcv879tSLhGfuYKmeqRGZBjRsBHDBk0=;
	h=Message-ID:Date:MIME-Version:From:To;
	b=NQGmforffxUHqNSIKExKxiqkQP9MbYZSzOy5eeM7lE0Xg6W984cC/vpVjOTzqIyIM
	 BVzBaN2y7S/y5wVg+joDM80HlClc5V+unQGWuT22RcSPfI96HS++4Jl4zbTGExJNMp
	 OPVsi2hrmHj2Y6JVejC3HhnfdJ6xq10v+boXi9/c=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <7e01fe7f-59ee-1fb3-fb9f-8013491b72a3@raptorengineering.com>
Date: Mon, 17 Jul 2023 13:40:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 2/3] xen/ppc: Implement early serial printk on pseries
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1688670018.git.sanastasio@raptorengineering.com>
 <85172d385a730e196999b366207e2b2e8a261906.1688670018.git.sanastasio@raptorengineering.com>
 <aa58706f-5033-ef33-5202-bcc418bedb86@suse.com>
 <2fa2837d-37f4-aa28-6ca8-2e28b6f44181@raptorengineering.com>
In-Reply-To: <2fa2837d-37f4-aa28-6ca8-2e28b6f44181@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Quick followup,

On 7/17/23 1:32 PM, Shawn Anastasio wrote:
> On 7/17/23 11:17 AM, Jan Beulich wrote:
>> This could do with using ARRAY_SIZE(rets). Same again below.
> 
> Sure, will do this.

ARRAY_SIZE is defined in <xen/lib.h> which can't yet be included due to
missing headers. I could copy its definition into this file along with a
TODO comment to fix it once the include works.

If I were to go down that route, I'd also probably not include the
__must_be_array assertion and related machinery that the <xen/lib.h>
version has, since it'd require a large portion of <xen/lib.h> to be
copy/pasted.

