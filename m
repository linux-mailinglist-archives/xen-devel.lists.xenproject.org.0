Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B331FEECA
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 11:38:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlqzB-0008Cz-B3; Thu, 18 Jun 2020 09:37:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0tkY=77=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jlqzA-0008Cu-KH
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 09:37:28 +0000
X-Inumbo-ID: 522e9a64-b147-11ea-ba63-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 522e9a64-b147-11ea-ba63-12813bfff9fa;
 Thu, 18 Jun 2020 09:37:27 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: aoLNRDg4pKbFug4ENtnfp9oCqMg/u3r1J0M6KeKYsxGpYbVpe/zKRIsWviehbpxL9DnZUY+OZv
 BZ0CP4xpZNtS9sJzxcKVarKodKcqQ+oGLijt8CXDxQfk7tn5pmBihqsXPshZd4X9sgN5cwLw3d
 M1GOT+a8AB+aXOyyQWxEoiNb1RHauLSRAO4uh90U5OTVdFoZUERHdzjqmPXSxaI6y4wg5IiSHg
 ATZj0oWgSs8jCnQGMRw1E8qxc3NguSFrzqyfuAXVMziyJUjtzJ//YpXXhCuup13omBgT+Ofo5X
 ziw=
X-SBRS: 2.7
X-MesageID: 20349738
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,526,1583211600"; d="scan'208";a="20349738"
Subject: Re: [PATCH for-4.14 0/9] XSA-320 follow for IvyBridge
To: Jan Beulich <jbeulich@suse.com>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
 <f7c873ff-75f4-5917-b277-bd6bb18faac3@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <498c3f3d-d461-40b6-b5a4-4cb3eceee014@citrix.com>
Date: Thu, 18 Jun 2020 10:37:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <f7c873ff-75f4-5917-b277-bd6bb18faac3@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18/06/2020 08:18, Jan Beulich wrote:
> On 15.06.2020 16:15, Andrew Cooper wrote:
>> This is some work in light of IvyBridge not gaining microcode to combat SRBDS
>> / XSA-320.  It is a mix of some work I'd planned for 4.15, and some patches
>> posted already and delayed due to dependence's I'd discovered after-the-fact.
>>
>> This provides a more user-friendly way of making IvyBridge safe by default
>> without encountering migration incompatibilities.
>>
>> In terms of functionality, it finishes the "fresh boot" vs "migrate/restore
>> from pre-4.14" split in the libxc CPUID logic, and uses this to let us safely
>> hide features by default without breaking the "divine what a guest may have
>> seen previously" logic on migrate.
>>
>> On top of that, we hide RDRAND by default to mitigate XSA-320.
>>
>> Additionally, take the opportunity of finally getting this logic working to
>> hide MPX by default (as posted previously), due to upcoming Intel timelines.
>>
>> Request for 4.14.  The IvyBridge angle only became apparent after the public
>> embargo on Tue 9th.  Otherwise, I would have made a concerted effort to get
>> this logic sorted sooner and/or part of XSA-320 itself.
>>
>> Strictly speaking, patches 1-4 aren't necessary, but without them the logic is
>> very confusing to follow, particularly the reasoning about the safely of later
>> changes.  As it is a simple set of transforms, we're better with them than
>> without.
>>
>> Also, the MPX patch isn't related to the RDRAND issue, but I was planning to
>> get it into 4.14 already, until realising that the migration path was broken.
>> Now that the path is fixed for the RDRAND issue, include the MPX patch as it
>> pertains to future hardware compatibility (and would be backported to 4.14.1
>> if it misses 4.14.0).
> Just to be sure - it is my understanding that none of this can sensibly
> be backported, even if it was nice for us to take care of the IvyBridge
> situation on older trees as well.

Correct.  Much as I'd like this to be backported, it depends on
approximately all the toolstack work I got complete in 4.14.

The changes to xc_apply_cpuid_policy() are only safe because the
behaviour of 4.13 is known (and fixed), and that all versions of Xen
we've made "breaking" default changes have the boot CPUID settings
properly in the migrate stream.

~Andrew

