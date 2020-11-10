Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA4B2AD768
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 14:22:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23384.50087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcTaw-0002cE-Fa; Tue, 10 Nov 2020 13:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23384.50087; Tue, 10 Nov 2020 13:21:58 +0000
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
	id 1kcTaw-0002bp-CK; Tue, 10 Nov 2020 13:21:58 +0000
Received: by outflank-mailman (input) for mailman id 23384;
 Tue, 10 Nov 2020 13:21:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xL7T=EQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kcTau-0002bj-Dq
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 13:21:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b6fe35e8-bd66-4a21-8fa6-d65cb2ad7555;
 Tue, 10 Nov 2020 13:21:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 93BD4ABCC;
 Tue, 10 Nov 2020 13:21:43 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xL7T=EQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kcTau-0002bj-Dq
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 13:21:56 +0000
X-Inumbo-ID: b6fe35e8-bd66-4a21-8fa6-d65cb2ad7555
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b6fe35e8-bd66-4a21-8fa6-d65cb2ad7555;
	Tue, 10 Nov 2020 13:21:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605014503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MVUdvBPE8v73QV9es/7ggX0+OQLQnLELoXD9zmWU8Po=;
	b=nKmv5C6LRPUzQpuMNcVzUHsMVtlIgOwKdBS+00Lgv6CsHcOScHOviRG/rVdrW897LxTKc3
	qbx6PhO8fsmC/h7spnZ5Hr1UF77VeTYleIIc3j74cfEHQLZ93FmS9B7PctXA8acSN/tzp0
	f6Cbz2zL6Ic7mxIyrTmCp1KgsNJ1td0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 93BD4ABCC;
	Tue, 10 Nov 2020 13:21:43 +0000 (UTC)
Subject: Re: [PATCH 3/5] x86/p2m: suppress audit_p2m hook when possible
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
 <722cf75e-da6a-49c5-472a-898796c9030e@suse.com>
 <20201110113002.maox2v2w6om4lmik@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ae87c1d8-0b4b-8a6a-156d-9f596d73a7bf@suse.com>
Date: Tue, 10 Nov 2020 14:21:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201110113002.maox2v2w6om4lmik@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10.11.2020 12:30, Roger Pau Monné wrote:
> On Wed, Oct 28, 2020 at 10:23:42AM +0100, Jan Beulich wrote:
>> When P2M_AUDIT is false, it's unused, so instead of having a dangling
>> NULL pointer sit there, omit the field altogether.
>>
>> Instead of adding "#if P2M_AUDIT && defined(CONFIG_HVM)" in even more
>> places, fold the latter part right into the definition of P2M_AUDIT.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks. Since I see you keep replying to v1, are you aware of
there being v2? For this particular patch there actually is a
clang related fix in v2, which may be of interest to you.

Jan

