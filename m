Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A31FF2D148C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 16:22:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46698.82774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmIKd-0001zy-0C; Mon, 07 Dec 2020 15:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46698.82774; Mon, 07 Dec 2020 15:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmIKc-0001zZ-TH; Mon, 07 Dec 2020 15:21:42 +0000
Received: by outflank-mailman (input) for mailman id 46698;
 Mon, 07 Dec 2020 15:21:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmIKb-0001zU-1u
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 15:21:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a0de98d-3d99-451e-abbd-1e897680e968;
 Mon, 07 Dec 2020 15:21:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7C0E1AB63;
 Mon,  7 Dec 2020 15:21:39 +0000 (UTC)
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
X-Inumbo-ID: 4a0de98d-3d99-451e-abbd-1e897680e968
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607354499; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4qsMwrQS7vfRwqSJw3t1sG9JFXYCXuoAuYCkKH3a51E=;
	b=QKeCgOo60R3nl5TYxtphUai48h7V7S/iBlIkmZYBqmEQ4bLJnAAx2ng7U1MU51fNs2OGzm
	JcK2lsI2id9FHzVETkzzGLdo9RDWEpvviyfuuiQPRgi1qWZg3hBUJoqh4Si4T+DOhbAZDB
	4D4dmHhnGtzyXHlxli/cgoaiSRpNvRs=
Subject: Re: [PATCH v2 04/17] xen/cpupool: switch cpupool id to unsigned
To: Dario Faggioli <dfaggioli@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-5-jgross@suse.com>
 <c2753a9853a1dccc159e0b34db0cdf0a364d2206.camel@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <45bd5958-5935-7cbf-ddb3-7fae9e2dfd4b@suse.com>
Date: Mon, 7 Dec 2020 16:21:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <c2753a9853a1dccc159e0b34db0cdf0a364d2206.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.12.2020 16:52, Dario Faggioli wrote:
> On Tue, 2020-12-01 at 09:21 +0100, Juergen Gross wrote:
>> The cpupool id is an unsigned value in the public interface header,
>> so
>> there is no reason why it is a signed value in struct cpupool.
>>
>> Switch it to unsigned int.
>>
> I think we can add:
> 
> "No functional change intended"

I've not added this - there is an intentional change at least
for

        if ( (poolid != CPUPOOLID_NONE) && (last >= poolid) )

Jan

