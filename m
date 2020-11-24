Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5901E2C2A68
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 15:52:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36506.68431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khZgC-0000XB-R2; Tue, 24 Nov 2020 14:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36506.68431; Tue, 24 Nov 2020 14:52:28 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khZgC-0000Wk-Nm; Tue, 24 Nov 2020 14:52:28 +0000
Received: by outflank-mailman (input) for mailman id 36506;
 Tue, 24 Nov 2020 14:52:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khZgB-0000Wf-9j
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 14:52:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2cd59b1b-4096-4a9c-97bb-8a44bca28882;
 Tue, 24 Nov 2020 14:52:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D4E19AC2D;
 Tue, 24 Nov 2020 14:52:25 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khZgB-0000Wf-9j
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 14:52:27 +0000
X-Inumbo-ID: 2cd59b1b-4096-4a9c-97bb-8a44bca28882
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2cd59b1b-4096-4a9c-97bb-8a44bca28882;
	Tue, 24 Nov 2020 14:52:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606229545; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sr204FPM5CDV1auX+wkjq9RbyU5ZqXaUY/fc+ZiJfik=;
	b=eAtqPG3zCFwoUkydOibifk8F7b9/B/a1jVo1RLh4gwmSNYQop1zsDj3tfNhqV3LbsreZFi
	zv9o8Pf0Fal4ntIVSt/w4DdQwm+j+QgXC9Qst84STGh4L8a1TCXDv/+5IYgVF718GBOPHz
	fOK4mCCkbgrnyqRmq9RZ+NvReClXnas=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D4E19AC2D;
	Tue, 24 Nov 2020 14:52:25 +0000 (UTC)
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20201123095713.orfpg72r73m7f46n@Air-de-Roger>
 <20201123113241.GE2520@antioche.eu.org>
 <20201123125112.q3zqb4e5nk6jg4hw@Air-de-Roger>
 <20201123143150.GG2520@antioche.eu.org>
 <20201123170610.kzfxvcgkdkvh3ex4@Air-de-Roger>
 <20201123173925.GG4662@antioche.eu.org>
 <b3912e97-9684-fe97-1053-ad7168a19721@suse.com>
 <20201124122102.3igsriesou3vl6mu@Air-de-Roger>
 <20201124135948.GL2020@antioche.eu.org>
 <6d6a77cf-58de-4e4d-ed75-e9365be060b7@suse.com>
 <20201124142713.GM2020@antioche.eu.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e6a0fc84-e7ed-825c-5356-29b8a6359a2b@suse.com>
Date: Tue, 24 Nov 2020 15:52:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201124142713.GM2020@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.11.2020 15:27, Manuel Bouyer wrote:
> new log at
> http://www-soc.lip6.fr/~bouyer/xen-log7.txt
> 
> this one ends up in a panic, I hope you'll find what you expect here.

Did you actually, just to have the data point, ever try to disable
interrupt remapping ("iommu=no-intremap")? For PVH we can't ask you
to turn of the IOMMU as a whole, but aiui interrupt remapping is
not a strict prereq. (I'm sure Roger will correct me if I'm wrong.)

Jan

