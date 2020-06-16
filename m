Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7737D1FA924
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 08:52:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl5RH-0004qY-1C; Tue, 16 Jun 2020 06:51:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LuhO=75=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jl5RF-0004qT-Sk
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 06:51:17 +0000
X-Inumbo-ID: c6b2893c-af9d-11ea-bb8b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c6b2893c-af9d-11ea-bb8b-bc764e2007e4;
 Tue, 16 Jun 2020 06:51:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EC30DAF96;
 Tue, 16 Jun 2020 06:51:19 +0000 (UTC)
Subject: Re: [PATCH 2/9] tests/cpu-policy: Confirm that CPUID serialisation is
 sorted
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
 <20200615141532.1927-3-andrew.cooper3@citrix.com>
 <24295.35624.644030.417783@mariner.uk.xensource.com>
 <ec1364c4-f1df-c52d-8651-bbfb3b5b6a0b@citrix.com>
 <24295.38146.988316.316252@mariner.uk.xensource.com>
 <53a1f221-89ae-0d8e-32ef-c9c8c83580c5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <feb177f1-86bb-493d-cce7-4f49a836211a@suse.com>
Date: Tue, 16 Jun 2020 08:51:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <53a1f221-89ae-0d8e-32ef-c9c8c83580c5@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.06.2020 18:12, Andrew Cooper wrote:
> On 15/06/2020 16:34, Ian Jackson wrote:
>> Andrew Cooper writes ("Re: [PATCH 2/9] tests/cpu-policy: Confirm that CPUID serialisation is sorted"):
>>> Nothing runs it by default, but it is part of my prepush testing for
>>> anything in the relevant area.
>>>
>>> We should do something better, but its not totally trivial.  The x86
>>> emulator test for example needs a fairly bleeding edge version of
>>> binutils, given that we routinely add support for bleeding edge
>>> instruction groups.
>> Hmmm.  Is it likely that installing the version from Debian testing
>> (say) would work ?  Or do we want to build it from source ?  These are
>> all possibilities.
> 
> Pulling from Sid may work, if they're fairly prompt to update to new
> binutils releases.  (They're certainly up to date ATM)
> 
> Jan: are we ever in a position where we need something more bleeding
> edge than the latest binutils release?

Gcc needs to be about as recent: Right now the minimum is gcc 8 I
think, and I have a few hacks in place locally to make things
somewhat work back to gcc 5, as on my laptop (and hence when
working from home) I don't have any custom gcc builds.

Jan

