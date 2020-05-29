Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1891E78C4
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 10:52:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeakQ-0006oh-LO; Fri, 29 May 2020 08:52:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jeakP-0006oc-Ja
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 08:52:13 +0000
X-Inumbo-ID: b023cb94-a189-11ea-9dbe-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b023cb94-a189-11ea-9dbe-bc764e2007e4;
 Fri, 29 May 2020 08:52:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8CCBAAAD0;
 Fri, 29 May 2020 08:52:11 +0000 (UTC)
Subject: Re: Xen XSM/FLASK policy, grub defaults, etc.
To: George Dunlap <George.Dunlap@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>
References: <24270.35349.838484.116865@mariner.uk.xensource.com>
 <0D83AAA6-A205-4256-8A38-CC8122AC063D@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <757d53a0-ec8f-62f1-ca20-72eaf9e1c84d@suse.com>
Date: Fri, 29 May 2020 10:52:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <0D83AAA6-A205-4256-8A38-CC8122AC063D@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 "cjwatson@debian.org" <cjwatson@debian.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.05.2020 18:08, George Dunlap wrote:
>> On May 27, 2020, at 4:41 PM, Ian Jackson <ian.jackson@citrix.com> wrote:
>> 2. Xen should disable the XSM policy build when FLASK is disabled.
>> This is unfortunately not so simple because the XSM policy build is a
>> tools option and FLASK is a Xen option and the configuration systems
>> are disjoint.  But at the very least a default build, which has no XSM
>> support, should not build an XSM policy file either.
> 
> A simple thing to do here would be to have the flask policy controlled by a configure --flask option.  If neither --flask nor --no-flask is specified, we could maybe have configure also check the contents of xen/.config to see if CONFIG_XSM_FLASK is enabled?

But that's creating a chicken-and-egg problem: There's no ordering
between the tools/ and xen/ builds. xen/ may not be built at all,
and this is going to become increasingly likely once the xen/ part
of the tree supports out-of-tree builds (at least I'll switch most
of my build trees to that model as soon as it's available).

Do we perhaps need to resort to a make command line option, usable
at the top level as well as for major subtree builds, and being
honored (as long as set either way, falling back to current
behavior if unset) by both ./configure and the hypervisor's
Kconfig?

Jan

