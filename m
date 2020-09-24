Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2ED276A0A
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 09:05:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLLJ4-0002Vt-GC; Thu, 24 Sep 2020 07:04:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2aH=DB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kLLJ3-0002Vo-OU
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 07:04:41 +0000
X-Inumbo-ID: 10404917-dea9-460d-9321-76282c3c2206
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10404917-dea9-460d-9321-76282c3c2206;
 Thu, 24 Sep 2020 07:04:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600931080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y8g7b+h2u4Q30mwgmqN6PLgsilN4ELYfqIQ7KqKvSnE=;
 b=L/Om2g/jfKCGug3kw+D4dUb3S0KwMyXP9s4vUCoOyLFysK1Ayh8vvpUmUveZcFfKs5Yq8o
 5KS+9NzQJia8zez86aU2QQLDumMFFDM27QZohZKquOxbnehGFbasn6Uk9gWgjVIQaSzjoA
 lnTikY7EBa5EKemk0kbJ22Rq1DN/KsI=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EEC98AA55;
 Thu, 24 Sep 2020 07:05:17 +0000 (UTC)
Subject: Re: [PATCH 5/9] lib: move parse_size_and_unit()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <aabca463-21ed-3755-0e8d-908069f40d6e@suse.com>
 <823c1802-9a61-4059-c6a8-61f5c2fad12c@suse.com>
 <91879555-30cd-3bcc-8f63-c8a2bbe6ef6d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <65380045-320f-eba4-67f3-eb7f62baccb5@suse.com>
Date: Thu, 24 Sep 2020 09:04:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <91879555-30cd-3bcc-8f63-c8a2bbe6ef6d@citrix.com>
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

On 22.09.2020 21:41, Andrew Cooper wrote:
> On 14/09/2020 11:17, Jan Beulich wrote:
>> ... into its own CU, to build it into an archive.
> 
> CU?

Compilation Unit - we've been using this acronym in a number of
cases, I think.

> Irrespective, it seems very weird to carve this out, seeing as it is
> called from a number of core locations, and depends on other core
> functions which aren't split out.

As said in the cover letter, the goal is to get rid of common/lib.c
as a whole. It's a bad file name for _anything_ to live in, as from
its name you can't really derive what may or may not be (or belong)
in there.

Depending on other core functions isn't a problem at all for stuff
living in archives. It being called "from a number of core
locations" isn't a convincing argument either, as all of those could
potentially be inside some #ifdef CONFIG_*. However, if it is
believed that this would better live in an object file than in an
archive, I can easily move it from lib-y to obj-y.

Jan

