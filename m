Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 600E21E7A9C
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 12:30:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jecH8-0008TJ-Vg; Fri, 29 May 2020 10:30:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jecH7-0008LL-7i
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 10:30:05 +0000
X-Inumbo-ID: 5bd5c6ec-a197-11ea-8993-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5bd5c6ec-a197-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 10:30:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 32C07AC2D;
 Fri, 29 May 2020 10:30:03 +0000 (UTC)
Subject: Re: [PATCH] xsm: also panic upon "flask=enforcing" when XSM_FLASK=n
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <8a4c4486-cf27-66a0-5ff9-5329277deccf@suse.com>
 <c90b70f7-e52e-405c-adb4-1303d7d1c009@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <58e33283-a883-3bde-c697-8605586abace@suse.com>
Date: Fri, 29 May 2020 12:30:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <c90b70f7-e52e-405c-adb4-1303d7d1c009@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.05.2020 12:07, Andrew Cooper wrote:
> On 29/05/2020 10:34, Jan Beulich wrote:
>> While the behavior to ignore this option without FLASK support was
>> properly documented, it is still somewhat surprising to someone using
>> this option and then still _not_ getting the assumed security. Add a
>> 2nd handler for the command line option for the XSM_FLASK=n case, and
>> invoke panic() when the option is specified (and not subsequently
>> overridden by "flask=disabled").
>>
>> Suggested-by: Ian Jackson <ian.jackson@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I'm very tempted to nack this outright, lest I remind both of you of the
> total disaster that was XSA-9, and the subsequent retraction of the code
> which did exactly this.
> 
> If you want to do something like this, prohibit creating guests so the
> administrator can still log in and unbreak,

Unbreaking is as easy as removing the command line option, or
adding "flask=disable" at the end of the command line.

Preventing to create guests is another option, but complicated
by the late-hwdom feature we still have - to achieve what you
want we'd have to permit creating that one further domain.
Dom0less perhaps also would need special treatment (and there
I'm not sure we'd know which of the domains we are supposed to
allow being created, and which one(s) not).

> instead of having it
> entering a reboot loop with no output.  The console isn't established
> this early, so none of this text makes it out onto VGA/serial.

You didn't look at the patch then: I'm intentionally _not_
panic()-ing from the command line parsing function, but from
an initcall. Both VGA and serial have been set up by that time.
(I was in fact considering to pull it a little earlier, into
a pre-SMP initcall.)

Jan

