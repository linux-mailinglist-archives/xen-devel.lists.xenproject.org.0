Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 812FB2D9454
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 09:52:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.51976.90926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kojaX-0006eG-Ks; Mon, 14 Dec 2020 08:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 51976.90926; Mon, 14 Dec 2020 08:52:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kojaX-0006du-Hk; Mon, 14 Dec 2020 08:52:13 +0000
Received: by outflank-mailman (input) for mailman id 51976;
 Mon, 14 Dec 2020 08:52:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MGmN=FS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kojaV-0006dp-Sz
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 08:52:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e84d4b78-b7f9-4168-841e-7944cd537383;
 Mon, 14 Dec 2020 08:52:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 51583AF31;
 Mon, 14 Dec 2020 08:52:09 +0000 (UTC)
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
X-Inumbo-ID: e84d4b78-b7f9-4168-841e-7944cd537383
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607935929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tRuCku03BruteHIQNSgq95gXrnU8F7jNNIn6OX3RNQk=;
	b=I0AlMAOrm7Y8fuM6zufXNSDl+VJtMpB46B9cr9A0qBiZ3z7aesnc6N9nzRMQgLzRjEUhRT
	nYqQil0681Vt9EVMf/o4Fj7okLK/TdGtkSUhhW1Jr9WD+sJwVvvoeGANiSPlvgKQHBvG5m
	UQqokTD7A3qk9eABeOVZ7SaJBnMOrxM=
Subject: Re: [XEN PATCH v1 1/1] Invalidate cache for cpus affinitized to the
 domain
To: Harsha Shamsundara Havanur <havanur@amazon.com>
References: <cover.1607686878.git.havanur@amazon.com>
 <aad47c43b7cd7a391492b8be7b881cd37e9764c7.1607686878.git.havanur@amazon.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <149f7f6e-0ff4-affc-b65d-0f880fa27b13@suse.com>
Date: Mon, 14 Dec 2020 09:52:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <aad47c43b7cd7a391492b8be7b881cd37e9764c7.1607686878.git.havanur@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.12.2020 12:44, Harsha Shamsundara Havanur wrote:
> A HVM domain flushes cache on all the cpus using
> `flush_all` macro which uses cpu_online_map, during
> i) creation of a new domain
> ii) when device-model op is performed
> iii) when domain is destructed.
> 
> This triggers IPI on all the cpus, thus affecting other
> domains that are pinned to different pcpus. This patch
> restricts cache flush to the set of cpus affinitized to
> the current domain using `domain->dirty_cpumask`.

But then you need to effect cache flushing when a CPU gets
taken out of domain->dirty_cpumask. I don't think you/we want
to do that.

Jan

