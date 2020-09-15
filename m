Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD8E26A517
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 14:27:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIA2f-00039c-CW; Tue, 15 Sep 2020 12:26:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kIA2e-00039X-A6
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 12:26:36 +0000
X-Inumbo-ID: a2e0576a-a618-4cfe-bdc0-57e3f3abd09c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2e0576a-a618-4cfe-bdc0-57e3f3abd09c;
 Tue, 15 Sep 2020 12:26:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DC5CAB032;
 Tue, 15 Sep 2020 12:26:49 +0000 (UTC)
Subject: Re: [PATCH 1/9] build: use if_changed more consistently (and
 correctly) for prelink*.o
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <aabca463-21ed-3755-0e8d-908069f40d6e@suse.com>
 <75d94bf1-b419-8a82-2d15-fb02e56109d8@suse.com>
 <20200915115603.GL753@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ae76b7d7-ea16-f668-3408-13c01a660e06@suse.com>
Date: Tue, 15 Sep 2020 14:26:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200915115603.GL753@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 15.09.2020 13:56, Roger Pau Monné wrote:
> On Mon, Sep 14, 2020 at 12:15:39PM +0200, Jan Beulich wrote:
>> Switch to $(call if_changed,ld) where possible; presumably not doing so
>> in e321576f4047 ("xen/build: start using if_changed") right away was an
>> oversight, as it did for Arm in (just) one case. It failed to add
>> prelink.o to $(targets), though, causing - judging from the observed
>> behavior on x86 - undue rebuilds of the final binary (because of
>> prelink.o getting rebuild for $(cmd_prelink.o) being empty, in turn
>> because of .prelink.o.cmd not getting read) during "make install-xen".
> 
> I'm not sure I follow why prelink.o needs to be added to targets, does
> this offer some kind of protection against rebuilds when doing make
> install?

In a way, but (as I view it) not really. It is the use of ...

> The switch to if_changed LGTM.

... if_changed which requires this. .*.cmd files will only be loaded
for anything explicitly or implicitly listed as a target. While .o
coming from $(obj-y) get added there automatically, prelink.o is not
something that could be recognized as needing adding, hence the
"manual" insertion.

Without .prelink.o.cmd loaded, $(if_changed ) will always arrange
for it to get re-built, because it then will consider the command
used to build the file to have changed (as the stored one appears to
be empty).

Jan

