Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA323CA451
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 19:26:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156904.289499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m457t-00042d-PS; Thu, 15 Jul 2021 17:26:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156904.289499; Thu, 15 Jul 2021 17:26:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m457t-000403-Lr; Thu, 15 Jul 2021 17:26:21 +0000
Received: by outflank-mailman (input) for mailman id 156904;
 Thu, 15 Jul 2021 17:26:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Mdo=MH=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1m457s-0003zx-Mv
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 17:26:20 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 564e3bd6-e9ee-4f81-8780-6921fb77db0a;
 Thu, 15 Jul 2021 17:26:20 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1626369973572796.1080043018195;
 Thu, 15 Jul 2021 10:26:13 -0700 (PDT)
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
X-Inumbo-ID: 564e3bd6-e9ee-4f81-8780-6921fb77db0a
ARC-Seal: i=1; a=rsa-sha256; t=1626369975; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Zn/cGNcOmYvNoo3nvVb6T+2VACJbZzPUVPbEH+ZZqy7aqxr6ivJbvnPw2/MoCJxusbtvefoQA3e6B7dzRk/5LeXhnAr67c2nab5WEP7GlbUVHa5p7M98h9KZ1lnqTU1kqgSy7oPz2VVZ+kQGsr64bm2d9rLMQBDhSpa38tA6z9A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1626369975; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=JVpGjzj3fyjoadNUUFi41JXu2J8XOWUUt6Uz8ynu66U=; 
	b=KQ4umMyhy3UQWKnkUKCO1Zhd7aAOuhqpVlz6vc79GaLSgxysJklk1SY+ENnuFP60Yw7/Ryw1fUjMVxEgrDOXAWeZzqvXRh6FMZD1OE13EF0abr8KXLFUPJoKTlyDOa4tZ9AIFf6DyNxpjsmHX1T2fXWOPyce4r07tkOXdiGkdTY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1626369975;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=JVpGjzj3fyjoadNUUFi41JXu2J8XOWUUt6Uz8ynu66U=;
	b=J/U6AolvhoI5qRDYYSp5eHFU9v2etaU5riC1ceUI+R8YMRXjHc5Q/Piit+YMZvoq
	IKAEbnQNZMkfGVEby+KpkdocI207ZAaLcdtfYV/cjPcTRV4woN6A8SrWHlGUY6LuoNL
	iKyJl35cnGYe4Cey/AjSgh+sDocyuWXP5e18DrYQ=
Subject: Re: [PATCH v2 07/10] xsm: drop generic event channel labeling
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-8-dpsmith@apertussolutions.com>
 <223bef6d-dc64-8353-af8c-357637b88f4b@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <fa31e916-82b6-f8fa-9410-e48864be760b@apertussolutions.com>
Date: Thu, 15 Jul 2021 13:26:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <223bef6d-dc64-8353-af8c-357637b88f4b@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/12/21 7:52 PM, Andrew Cooper wrote:
> On 12/07/2021 21:32, Daniel P. Smith wrote:
>> The generic event channel labeling has not been used by any XSM module since
>> its introduction. This commit removes the capability leaving FLASK labeling
>> field always present. In the future if a new XSM module needs to have its own
>> channel label, this or a new form can be introduced.
> 
> You're missing a SoB line.

Apologies, i was originally going to squash this but then decided it
probably served to be kept as a standalone commit. Will get the SoB added.

> Also, this too would benefit from being reordered higher than patch 6,
> to reduce the churn there.

Ack

v/r,
dps

