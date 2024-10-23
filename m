Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 101939ABA70
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 02:17:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824341.1238458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3P3T-00015O-9w; Wed, 23 Oct 2024 00:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824341.1238458; Wed, 23 Oct 2024 00:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3P3T-00013E-6v; Wed, 23 Oct 2024 00:16:51 +0000
Received: by outflank-mailman (input) for mailman id 824341;
 Wed, 23 Oct 2024 00:16:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fY0y=RT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t3P3R-000138-Se
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 00:16:49 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 177cd4a3-90d4-11ef-a0be-8be0dac302b0;
 Wed, 23 Oct 2024 02:16:48 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 172964260236081.18775636948408;
 Tue, 22 Oct 2024 17:16:42 -0700 (PDT)
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
X-Inumbo-ID: 177cd4a3-90d4-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729642604; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=G/ySipiSpB+0hsRgKZXWUgr+T0n2D1mQzUtKE6PJCBib8Htl6SrlcemUOOL4/oOLGGybgnc0sF5CDbqTrNgsdDpKgQrNlaz8rq+4fNgUUim90/0joasc6iq9DucVZQlkwzJifHCnFlhaFKZRQMOWjSE0rlusm08W0HZPcG6LLkg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729642604; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ihha2WkaDo8YK9TFfNt/9gjktJNn6lcUbCtF1XUysTY=; 
	b=NjQDmI3Kcv8igoXxBCwSPPWteL2lii3ce6W9Fc1WMSzP/gMPQYtXEb0aZ6/1UjmPijEiL+7YSpZ8LmyacCvHEt9JoDBzr60cH5c58dXZCJL0eNGLPG73a0VQmKSDjFzfHPwS+e6eipZhi0ci4I7sa5Bj805buOyDci6xBF+PN9U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729642604;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Ihha2WkaDo8YK9TFfNt/9gjktJNn6lcUbCtF1XUysTY=;
	b=AawezXO3wA3HFV00qaqXCWD3kh7VFxTZUMi52ak+PBUHFETPQXnFFJ+n3iBXWz6u
	rM/oqWafnuRliIuaPYMhJmdp+8pIk/G8s5Y+YPHCsF0s2qP5dWRaszXqJZf9jnDaKS+
	Ktc3pTj8zFaadlPFcR5bLQ6UAo/8PBGNMxGAwCZY=
Message-ID: <0aa6940f-5aeb-4f14-bb18-2a598b926686@apertussolutions.com>
Date: Tue, 22 Oct 2024 20:16:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/boot: Simplify address calculations in
 move_memory()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241022223954.432554-1-andrew.cooper3@citrix.com>
 <20241022223954.432554-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241022223954.432554-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/22/24 18:39, Andrew Cooper wrote:
> Given that soffs is the offset into the 2M superpage,
> 
>    start = (src - soffs) >> PAGE_SIFT
> 
> is a complicated expression for the frame address of the containing superpage.
> Except, start is converted straight back to a byte address to use, so the
> shifting is unnecessary too.
> 
> The only done with the mapped pointer is to have soffs added back on for the

nit: think you dropped a word here, "The only done".

> memmove() call.  bootstrap_map_addr() passes through the offset, so we can
> pass src directly in and simplify the memmove() call too.  For the end mapping
> address, this simplifies to just src + sz too.
> 
> The same reasoning holds for dst and doffs.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>

After nit,

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

