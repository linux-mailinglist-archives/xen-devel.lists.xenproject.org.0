Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B443219DF
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 15:12:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88092.165485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEBws-0008Ts-5r; Mon, 22 Feb 2021 14:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88092.165485; Mon, 22 Feb 2021 14:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEBws-0008TT-2G; Mon, 22 Feb 2021 14:12:30 +0000
Received: by outflank-mailman (input) for mailman id 88092;
 Mon, 22 Feb 2021 14:12:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bXc=HY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lEBwp-0008TO-Qt
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 14:12:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e637493-f65c-4c81-85e4-290dd2968932;
 Mon, 22 Feb 2021 14:12:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2AE18ACBF;
 Mon, 22 Feb 2021 14:12:26 +0000 (UTC)
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
X-Inumbo-ID: 8e637493-f65c-4c81-85e4-290dd2968932
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614003146; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2/u0KYvjfvVBPZ+ouLLVqw7o5ez4RuTOPoh1vjJdpMc=;
	b=GU96mxdwLML8CRLKpH3NZNbNuGRRqqzhbkXem5xuXIbdDGrPFIZ0yqkqfVXeD+3yXHB6wU
	yiy+6duwjtHkq3XmJW7HvIQUylH8wKZjKNFke3ufoyCc6M3pp6fZgJeojlqxAvYSynGQbl
	lwl8G3Ydz/DrawhKGSXmUnerzfVK3Do=
Subject: Re: [PATCH][4.15] x86: mirror compat argument translation area for
 32-bit PV
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>
References: <bdedf018-b6c4-d0da-fb4b-8cf2d048c3b1@suse.com>
 <YDOW+ftkNsG2RH3C@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <de119412-7a38-1446-55a0-806bddeda06c@suse.com>
Date: Mon, 22 Feb 2021 15:12:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YDOW+ftkNsG2RH3C@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.02.2021 12:35, Roger Pau Monné wrote:
> On Mon, Feb 22, 2021 at 11:27:07AM +0100, Jan Beulich wrote:
>> Now that we guard the entire Xen VA space against speculative abuse
>> through hypervisor accesses to guest memory, the argument translation
>> area's VA also needs to live outside this range, at least for 32-bit PV
>> guests. To avoid extra is_hvm_*() conditionals, use the alternative VA
>> uniformly.
> 
> Since you are double mapping the per-domain virtual area, won't it
> make more sense to map it just once outside of the Xen virtual space
> area? (so it's always using PML4_ADDR(511))

This would then require conditionals in paths using other parts of
the per-domain mappings for 64-bit PV, as the same range is under
guest control there.

> Is there anything concerning in the per-domain area that should be
> protected against speculative accesses?

First of all this is an unrelated question - I'm not changing what
gets accessed there, but only through which addresses these accesses
happen. What lives there are GDT/LDT mappings, map cache, and the
argument translation area. The guest has no control (or very limited
when considering GDT/LDT one) over the accesses made to this space.

Jan

