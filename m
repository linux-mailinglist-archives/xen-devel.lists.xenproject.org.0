Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 101FBABFC4D
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 19:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992402.1376153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHnIo-00088Y-WB; Wed, 21 May 2025 17:32:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992402.1376153; Wed, 21 May 2025 17:32:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHnIo-00085Y-TQ; Wed, 21 May 2025 17:32:26 +0000
Received: by outflank-mailman (input) for mailman id 992402;
 Wed, 21 May 2025 17:32:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvEX=YF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uHnIn-000849-E4
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 17:32:25 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d3e9078-3669-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 19:32:23 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 17478487363520.5364171347913498;
 Wed, 21 May 2025 10:32:16 -0700 (PDT)
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
X-Inumbo-ID: 8d3e9078-3669-11f0-a2fa-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; t=1747848738; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=V2vYzP5s4TQ/bOD9hjVHW2NfdagKjH9iuvDLwHdbu6EnNcsAORmH49ujcqD7wLyyd/wae5LQy25SJiPSxQB4uD2e6SKOlmmfGav/1QLFDaJz+YJtfZigVKFxsq85l5NXyNQbqktCRWIQ+JmV9GZasaJNClAlVEmZmoVfeKfzJ7g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747848738; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2M/ZHcqsRoeogBFbSY4UDqqx2mVwPC35qS2+XjLNMDA=; 
	b=mbZpr1MIEqv1CjaJMO0Rnonzf3C4A+Mu6Q4Ajsp28dk4nmz2x4bQlByYILr9WCPb0ouD0KeFayNq3gTAzKHoE3T4m4053FjxBN6Z5LYGjm9JdNBEuCsbD0lLkRBIyzZqsXdH5o2twZcINBo+a65+kVFkg/rVTmDsvTnqXdsTa9c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747848738;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=2M/ZHcqsRoeogBFbSY4UDqqx2mVwPC35qS2+XjLNMDA=;
	b=pr7uT+D4udgkcUKMUOuL8uemuea8nx/rmRqjuhOYfQaMIXbKKQyDXI0FnIc0KETs
	V3Cq25mr7T6+l5vO+H/EYMkcxEH27NGaTwJM4Sqe4fEnheRbIapUma9WFBv/9mbFXBJ
	EDAGxoGYn5F+ROTgpa4RQjGbwpqg1XByfTfJsEBY=
Message-ID: <40b3eb93-779f-478a-a8a8-6716693a68fa@apertussolutions.com>
Date: Wed, 21 May 2025 13:32:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hyperlaunch/dom0less code sharing
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Alejandro Vallejo <agarciav@amd.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Jason Andryuk <jason.andryuk@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <958f591f-35ac-4a10-93e2-9301ccfc5353@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <958f591f-35ac-4a10-93e2-9301ccfc5353@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 5/21/25 11:31, Daniel P. Smith wrote:

> As for 3, I can repost my original analysis that went to the working 
> group on why using this is not the best idea. Doing 3 would require 
> doing at least two, if not three passes on the DTB for x86 with zero 
> benefit/need since, unlike Arm, we never have to read from it after 
> boot. The way the x86 parser is today, we are walking the DTB only once.
> 
> What I would suggest for 2 is that, perhaps, it might be an opportune 
> time to review the existing DTB parsing code. Providing a common 
> interface to parse standard/spec DTB structures regardless if it is 
> coming from an FTB or via the FTB index, aka "unflattened" DTB. Doing so 
> would enable a complete reuse within the DTB parsers and remove then 
> need for 3.

Apologies, I did not CC anyone on the posting of the original analysis. 
It is posted to xen-devel as "Hyperlaunch Device Tree Discussion".

v/r,
dps

