Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 633B91FCCC3
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 13:47:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlWX9-0003PT-4Q; Wed, 17 Jun 2020 11:47:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6FoJ=76=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jlWX8-0003PO-2n
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 11:47:10 +0000
X-Inumbo-ID: 4661bb06-b090-11ea-b9d3-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4661bb06-b090-11ea-b9d3-12813bfff9fa;
 Wed, 17 Jun 2020 11:47:09 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 1D84Szqh/iAfruf+3HZ72EEcKWxaZiZxMTdIzOxYGQ8ZqQ0S+gQVKGC27M9jVRENqFSelu01Yq
 hpMJ6+hKEBxcsoKIvC58ICUGuuGiVYJyqQ+PT4p5LFrJoUcHFJrfhk26LlWIFVpz+723h2VvBY
 RmemDw89BEotREbBE0T8eb/DCUxio6OLjyBIYqkVpQxGgFAn8XIjbV/D8W+yJrTjwDYpM3lU9E
 97biLd0tT4tqAWSMYLEZMDN+8hDDcazdRx1aO2KilgjpxrzUvktGIK9SA+i+3xFhMDOmoy9vwR
 BWM=
X-SBRS: 2.7
X-MesageID: 20605793
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,522,1583211600"; d="scan'208";a="20605793"
Subject: Re: [PATCH 7/9] x86/hvm: Disable MPX by default
To: Jan Beulich <jbeulich@suse.com>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
 <20200615141532.1927-8-andrew.cooper3@citrix.com>
 <58d7254d-8953-93c4-9eb2-9be45f39bc4e@suse.com>
 <ee0819ab-71fe-dcc3-69c0-798ca9a2972c@citrix.com>
 <6898eb94-868c-b706-7cdd-7d54db09c1b0@suse.com>
 <76fabe81-3f2c-5c48-c2c0-879bc29f4fb7@citrix.com>
 <356b06c9-b176-8e72-a3bf-2be62f5cbdb5@suse.com>
 <be0e11e0-8d94-b3e2-da81-94a281eb371a@citrix.com>
 <7d0b514c-7af6-e1b2-4b95-1ab62fe02e1c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <630ecde9-c56b-0d69-75f4-366d1ecc6928@citrix.com>
Date: Wed, 17 Jun 2020 12:47:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <7d0b514c-7af6-e1b2-4b95-1ab62fe02e1c@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

On 17/06/2020 12:41, Jan Beulich wrote:
> On 17.06.2020 13:28, Andrew Cooper wrote:
>> We actually have AVX512 disabled by default in XenServer.  The perf
>> implications of letting 1 guest play with it is very severe.
>>
>> Now I think about it, I'm tempted to recommend it moves out of default
>> generally.
> Hmm, I'm tempted to ask whether you're kidding.

I'm very definitely not.

AVX512 is a disaster, perf wise on Skylake/CascadeLake, and its very
easy to cripple the entire system, including the other guest.

So much so that "better AVX512 frequency transitions" is a headline
feature in IceLake.

>  This is the kind of
> feature that I see no reason at all to move out of default. Imo we
> shouldn't put in place policy like this - if anything shouldn't be
> on by default, it should imo be because of limitations in our
> handling (I've recently revived my UMIP emulation patch, which
> comes to mind here) or because of uncertainty on some aspects (like
> is the case for MOVDIR / ENQCMD for example). Anything else should
> be left to the admins to decide.

"left to the admins to decide" does not mean "on by default".

"default" needs to be a sensible set, which migrates safely, and can't
be used to trivially DoS the rest of the system.  An admin can always
opt into allowing this DoS, but shouldn't have it by default.

~Andrew

