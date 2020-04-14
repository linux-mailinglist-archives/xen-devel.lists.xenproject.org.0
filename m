Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0011A805E
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 16:50:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOMsm-0008UI-7V; Tue, 14 Apr 2020 14:49:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0GYB=56=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jOMsk-0008UD-65
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 14:49:46 +0000
X-Inumbo-ID: 2dba0bd4-7e5f-11ea-8951-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2dba0bd4-7e5f-11ea-8951-12813bfff9fa;
 Tue, 14 Apr 2020 14:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586875786;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=uxLmYsNH+Xi7YobeEaF28YYubY+/DLaE1APSADXT1hs=;
 b=UtztVBxwg5gAkgHmBW3OqeQj1PW4Bpqysc7QE+DvVgQ756BguYGubEo3
 ETwPEOO238ypagwWsrSK22sSJC3zwUUP3Oe1C2oWW2vQwHPBP5B1XSWfU
 pTtjie70NzZgfXYF6WTcKtwbJ4kP2SILU9301apMKIgjMdNzAYRANMWz7 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sM9RTn/E34kqzdyG0GG/cEr/6R1rWZE11TrG4PqxCU625n6DGbzq1ZNQkPD/NgVSrR2YnuYL+g
 J2eKOvOJESPN8MPFqaW0j0pY/d61wmfxhCEmzmrqWxpLToQModjSHOQsCI+p/TwtdppjK73I7s
 rwWcTM8O/aeeZu//PKNFE3m4rvzsX0LPvY7B3dexYe3F0fVqa4+3GVwzNkVT2+Noq0Mdqdnav/
 UkQesvhAtMW6U6m1+ddNC/UVA1azag1MnWP3knPUhlk8ePwuUgzyNLgz7uSmjipL1wmWikEeqD
 WoA=
X-SBRS: 2.7
X-MesageID: 15664233
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,382,1580792400"; d="scan'208";a="15664233"
Subject: Re: preparations for 4.13.1 and 4.12.3
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <f8ecb6b1-00de-67c1-07c6-6fdb92dd63ae@suse.com>
 <dbce2a2e-4cfd-9838-564d-710e5f10ab53@citrix.com>
 <6b800158-9f05-1b91-e1ae-f368746852bb@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <5e2ee422-bdbf-2493-8761-2753acacc7d4@citrix.com>
Date: Tue, 14 Apr 2020 15:49:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6b800158-9f05-1b91-e1ae-f368746852bb@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Anthony
 Perard <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14/04/2020 14:36, Jan Beulich wrote:
> On 14.04.2020 15:07, Andrew Cooper wrote:
>> On 09/04/2020 08:41, Jan Beulich wrote:
>>> All,
>>>
>>> the releases are due in a week or two. Please point out backports
>>> you find missing from the respective staging branches, but which
>>> you consider relevant. (Ian, I notice there haven't been any
>>> tools side backports at all so far. Julien, Stefano - same for
>>> Arm.)
>>
>> 540d4d60378c "cpu: sync any remaining RCU callbacks before CPU up/down"
>> which fixes crashes after vcpu hotplug in shim.
>>
>> It looks to depend on 53ddfc80a84a, a9b6dacf88fe, c301211a5111 and
>> 53594c7bd197 which are other RCU bugfixes.
> 
> And cef21210fb133 as well as a6fe79a5979a then. Iirc we had even
> talked about this on irc, and were largely in agreement that this
> is a little beyond what we'd normally backport.

Correct. Those 2 could be taken for completeness but not strictly necessary.
On the other hand, those mentioned by Andrew (maybe except for a9b6dacf88fe)
are necessary prerequisites.

> I have to admit that while I followed Igor's advice that there is
> a dependency of his patch on Jürgen's work, I'm still not really
> clear where that dependency actually lies. The patch merely moves
> where rcu_barrier() gets invoked from (thus covering previously
> uncovered places). If there hadn't been that named dependency, I
> would have taken Igor's patch already.

There is dependency in the fact after my patch is applied - rcu_barrier gets
invoked very frequently unlike before. This uncovers many issues in its
implementation that are addressed by RCU series. Without RCU series
rcu_barrier call is unstable and causes race condition induced crashes and
is incompatible with core-scheduling.

Igor

