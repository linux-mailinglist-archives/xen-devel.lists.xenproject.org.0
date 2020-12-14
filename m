Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A712D958E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 10:56:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52075.91114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koka9-0008AX-4G; Mon, 14 Dec 2020 09:55:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52075.91114; Mon, 14 Dec 2020 09:55:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koka9-0008A8-11; Mon, 14 Dec 2020 09:55:53 +0000
Received: by outflank-mailman (input) for mailman id 52075;
 Mon, 14 Dec 2020 09:55:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MGmN=FS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1koka7-0008A3-4Q
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 09:55:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a639bae2-21b8-4800-8dd0-b11dfcd442cd;
 Mon, 14 Dec 2020 09:55:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4FD3FAC10;
 Mon, 14 Dec 2020 09:55:48 +0000 (UTC)
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
X-Inumbo-ID: a639bae2-21b8-4800-8dd0-b11dfcd442cd
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607939748; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/M9Woq0xrSX0Ph47W4TRzOAiFvA1qaoHwi4ZzNqc5Y8=;
	b=CcDQcVMEvv3mZYF5XdIO7EP8b1JQOD8q1hJpqHZ1heMPkd2uI3IEinElz+E6fMQrMJry5S
	R3YYR87yxhBw/sJhs0OApoiKH2OSc1A1cJ1rw1dd5ykej1MgXsfn67xM/ynJ2+m21qsIaj
	ouEzlDu4uizKTSdKU4ywavnpbCsh2z4=
Subject: Re: [XEN PATCH v1 1/1] Invalidate cache for cpus affinitized to the
 domain
To: "Shamsundara Havanur, Harsha" <havanur@amazon.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1607686878.git.havanur@amazon.com>
 <aad47c43b7cd7a391492b8be7b881cd37e9764c7.1607686878.git.havanur@amazon.com>
 <149f7f6e-0ff4-affc-b65d-0f880fa27b13@suse.com>
 <81b5d64b0a08d217e0ae53606cd1b8afd59283e4.camel@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <db7fdadc-91de-aa5f-51cd-f2c78f88d034@suse.com>
Date: Mon, 14 Dec 2020 10:55:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <81b5d64b0a08d217e0ae53606cd1b8afd59283e4.camel@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 14.12.2020 10:26, Shamsundara Havanur, Harsha wrote:
> On Mon, 2020-12-14 at 09:52 +0100, Jan Beulich wrote:
>> On 11.12.2020 12:44, Harsha Shamsundara Havanur wrote:
>>> A HVM domain flushes cache on all the cpus using
>>> `flush_all` macro which uses cpu_online_map, during
>>> i) creation of a new domain
>>> ii) when device-model op is performed
>>> iii) when domain is destructed.
>>>
>>> This triggers IPI on all the cpus, thus affecting other
>>> domains that are pinned to different pcpus. This patch
>>> restricts cache flush to the set of cpus affinitized to
>>> the current domain using `domain->dirty_cpumask`.
>>
>> But then you need to effect cache flushing when a CPU gets
>> taken out of domain->dirty_cpumask. I don't think you/we want
>> to do that.
>>
> If we do not restrict, it could lead to DoS attack, where a malicious
> guest could keep writing to MTRR registers or do a cache flush through
> DM Op and keep sending IPIs to other neighboring guests.

Could you outline how this can become a DoS? Throughput may be
(heavily) impacted, yes, but I don't see how this could suppress
forward progress altogether. Improved accounting may be desirable
here, such that the time spent in the flushes gets subtracted
from the initiator's credits rather than the vCPU's which happens
to run on the subject pCPU at the time. This is a more general
topic though, which was previously brought up: Time spent in
servicing interrupts should in general not be accounted to the
vCPU running of which happened to be interrupted. It's just that
for the majority of interrupts the amount of time needed to
handle them is pretty well bounded, albeit very high interrupt
rates could have the same effect as a single interrupt taking
very long to service.

An intermediate option (albeit presumably somewhat intrusive)
might be to use e.g. a tasklet on each CPU to effect the
flushing. This wouldn't reduce the overall hit on the system,
but would at least avoid penalizing other vCPU-s as to their
scheduling time slices. The issuing vCPU would then need
pausing until all of the flushes got carried out.

Jan

