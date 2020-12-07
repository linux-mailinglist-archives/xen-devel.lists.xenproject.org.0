Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 804242D0DEF
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 11:24:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46112.81795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDgH-0005cx-1P; Mon, 07 Dec 2020 10:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46112.81795; Mon, 07 Dec 2020 10:23:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDgG-0005ca-UX; Mon, 07 Dec 2020 10:23:44 +0000
Received: by outflank-mailman (input) for mailman id 46112;
 Mon, 07 Dec 2020 10:23:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmDgF-0005cU-So
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 10:23:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 179f1264-87fb-4104-b38d-51b17b54ac20;
 Mon, 07 Dec 2020 10:23:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3E444AC90;
 Mon,  7 Dec 2020 10:23:42 +0000 (UTC)
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
X-Inumbo-ID: 179f1264-87fb-4104-b38d-51b17b54ac20
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607336622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xQnepCiatrE8sJzTWk61do2J/pPpjtZ2Ei47QgkZUTM=;
	b=KnPyb8/oUA3AGG3RmXwfs2LZ/TfWPyU6an5SHK7SxPjNLmkAC/InvtijVoEvi+1CmBEpai
	OmLlsDv3PqTesY9Cg3ODnsgmAjut/y+l/KLQ3OtNY0gYUeHIYPcEBE4glx693aK2RwnLlf
	3rgOB1w1yQUVSwioZgrERK1NOEkl5Ao=
Subject: Re: [PATCH v2 7/8] lib: move bsearch code
To: Julien Grall <julien@xen.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
 <87a20884-5a76-a664-dcc9-bd4becee40b3@suse.com>
 <44ffc041-cacd-468e-a835-f5b2048bb201@xen.org>
 <2cf3a90d-f463-41f8-f861-6ef00279b204@suse.com>
 <2419eccf-c696-6aa1-ada4-0f7bd6bc5657@xen.org>
 <77534dc3-bdd6-f884-99e3-90dc9b02a81f@citrix.com>
 <59a4e1c1-ea39-1846-92ae-92560db4b1fb@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e0782c3b-9958-3792-eab9-d3fd6708225f@suse.com>
Date: Mon, 7 Dec 2020 11:23:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <59a4e1c1-ea39-1846-92ae-92560db4b1fb@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 24.11.2020 17:57, Julien Grall wrote:
> On 24/11/2020 00:40, Andrew Cooper wrote:
>> On a totally separate point,  I wonder if we'd be better off compiling
>> with -fgnu89-inline because I can't see any case we're we'd want the C99
>> inline semantics anywhere in Xen.
> 
> This was one of my point above. It feels that if we want to use the 
> behavior in Xen, then it should be everywhere rather than just this helper.

I'll be committing the series up to patch 6 in a minute. It remains
unclear to me whether your responses on this sub-thread are meant
to be an objection, or just a comment. Andrew gave his R-b despite
this separate consideration, and I now also have an ack from Wei
for the entire series. Please clarify.

Or actually I only thought I could commit a fair initial part of
the series - I'm still lacking Arm-side acks for patches 2 and 3
here.

Jan

