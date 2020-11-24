Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1BC2C216D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 10:32:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35612.67240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khUf1-0001lH-0L; Tue, 24 Nov 2020 09:30:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35612.67240; Tue, 24 Nov 2020 09:30:54 +0000
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
	id 1khUf0-0001ks-TJ; Tue, 24 Nov 2020 09:30:54 +0000
Received: by outflank-mailman (input) for mailman id 35612;
 Tue, 24 Nov 2020 09:30:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khUez-0001kn-RY
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 09:30:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25413af2-ac18-4d21-8b34-ba82f67dac10;
 Tue, 24 Nov 2020 09:30:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1C181AC48;
 Tue, 24 Nov 2020 09:30:52 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khUez-0001kn-RY
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 09:30:53 +0000
X-Inumbo-ID: 25413af2-ac18-4d21-8b34-ba82f67dac10
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 25413af2-ac18-4d21-8b34-ba82f67dac10;
	Tue, 24 Nov 2020 09:30:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606210252; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+gDIb2S94xj9bvpj3ElBlsVJlCAUGjA4er3a6DmRAPU=;
	b=vS11Y6gVNpEjxyAOANUO0FYkpoEeTdTA/EXbs0hGhoBSXVemsnMBnVVBD5zzSfRzzEWiPK
	9X/VRPnE/X2JD133RGMTwotnqIfnnYcnpiFb4h0tEH3sXzn4FVI/dneoBrW8VU2eM8etpt
	FcqKR/WzNngmmqfJMjFjB4zwZ0TELzA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1C181AC48;
	Tue, 24 Nov 2020 09:30:52 +0000 (UTC)
Subject: Re: [PATCH v2 4/8] lib: move parse_size_and_unit()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
 <eaffac30-8bd0-6018-5186-ca53d1becfe5@suse.com>
 <1bd906ff-0b37-07de-75ab-84a169151c2d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ca34b711-c6e1-2dac-30a0-47fd54e16715@suse.com>
Date: Tue, 24 Nov 2020 10:30:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1bd906ff-0b37-07de-75ab-84a169151c2d@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 24.11.2020 01:58, Andrew Cooper wrote:
> On 23/10/2020 11:17, Jan Beulich wrote:
>> ... into its own CU, to build it into an archive.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>>  xen/common/lib.c     | 39 ----------------------------------
>>  xen/lib/Makefile     |  1 +
>>  xen/lib/parse-size.c | 50 ++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 51 insertions(+), 39 deletions(-)
>>  create mode 100644 xen/lib/parse-size.c
> 
> What is the point of turning this into a library?  It isn't a leaf
> function (calls simple_strtoull()) and doesn't have any any plausible
> way of losing all its callers in various configurations (given its
> direct use by the cmdline parsing logic).

It's still a library function. As said earlier, I think _all_
of what's now in lib.c should move to lib/. That's how it
should have been from the beginning, or stuff shouldn't have
been put in lib.c.

The one alternative I see is to move the code next to
parse_bool() / parse_boolean(), in kernel.c, or put all
parse_*() into a new common/parse.c.

Jan

