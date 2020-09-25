Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFF9278DC3
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 18:13:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLqLj-0007OA-4a; Fri, 25 Sep 2020 16:13:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9v36=DC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kLqLh-0007O2-EP
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 16:13:29 +0000
X-Inumbo-ID: e70f2178-a6d8-4df2-9dde-c535f43e186f
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e70f2178-a6d8-4df2-9dde-c535f43e186f;
 Fri, 25 Sep 2020 16:13:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601050407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p6Sq9ji1PM5FlGQO1c4vjS28meIESNDlDXj8DIEVwHY=;
 b=c0aO188ToDtqQTZKluNxZNLfbTIIv6vLbK4C3KZfN83zQC8k6ruDq2O0D4FNRxRfGlQ29X
 F0ibgsqh0dt6WeKsN1wr+w84OHGYHmgMTjCHQE6i/hKRt2x8GXsa4zupkTUCi3OV8/17H3
 MCSeP71puRQBYPC2FZGQdLFX5qSzsGo=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 67595ACA3;
 Fri, 25 Sep 2020 16:13:27 +0000 (UTC)
Subject: Re: [PATCH] evtchn/Flask: pre-allocate node on send path
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <f633e95e-11e7-ccfc-07ce-7cc817fcd7fe@suse.com>
 <8237e286-168f-a4e7-be8b-aba5ff781e7c@xen.org>
 <706b94ae-ca05-2218-6025-e5d62297dda6@suse.com>
 <3ad0529d-ad55-8864-1df2-193eaf104c1f@xen.org>
 <6d6d7550-8847-267e-49f2-0ca098ef97ad@suse.com>
 <2a62f5e4-9915-bcd7-05b3-77663c995a13@xen.org>
 <9adeac3b-2b0f-6e9d-aa82-fd966e984fa0@suse.com>
 <52dba8e8-5976-48a2-7a74-ddf877880c6e@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <80ca5fa6-4f55-bb3b-bb21-f8b8f024d08c@suse.com>
Date: Fri, 25 Sep 2020 18:13:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <52dba8e8-5976-48a2-7a74-ddf877880c6e@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.09.2020 18:00, Julien Grall wrote:
> On 25/09/2020 16:36, Jan Beulich wrote:
>> Plus, as said, the minimal change of making Flask
>> avoid xmalloc() when IRQs are off is a change that ought to be made
>> anyway imo, in order to favor proper functioning over performance.
> If there are other use, then yes. What I don't like in the current 
> approach is we are hijacking xsm_event_send() for pre-allocating memory.

I first had a designated function for this, but the need to wire
this through ops, dummy.h, etc made me pretty quickly turn to this
lower churn variant. But that other one hasn't been ruled out if
the "hijacking" is deemed too bad.

Jan

