Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9D2240C66
	for <lists+xen-devel@lfdr.de>; Mon, 10 Aug 2020 19:52:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5BxT-0001Bc-Pz; Mon, 10 Aug 2020 17:51:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BwXP=BU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k5BxS-0001BV-Ol
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 17:51:38 +0000
X-Inumbo-ID: 3044a447-b355-425a-8068-c62f4393274b
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3044a447-b355-425a-8068-c62f4393274b;
 Mon, 10 Aug 2020 17:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597081898;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=KkYNIp5BI1P9vw8nTLp+dFkkzlA7M9TvIj9SgxC4PmM=;
 b=JOOsrQ+2wkm5JZhsZbXnPePTNIdL5K6CnBXUVmF7iXxEdp5T3rwUcufy
 xZl8pAmmS4Bm2kPtmprAXcexKIestyVNg1SlKrGW2TAbUfgCY+682aij3
 xfO/77v2XW+lbVj+HwvdYW1uTDMTaoB3DydUAGPkWOycGNsr/7MpPlDN+ 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: fYuSZd2x8vS2u4Apf7Hd/jn9yAdSa7b7/A5OqwkAfS/LizD5KAu/1+oPivauIhDScqcz0qvEk+
 EzCRHuYm2AyOO9wjY1N3n5XUpOlyvxZA84Rnj64bAPjhaHpDtUXAvadHaG3bgMORzGYwnzX0t/
 eyQf0rGkw4JZrmedirC3YFhDvp4sCI+gVOJVrr1m9LNA1ECRX/GqQO2D9JlW3orv7g2p6olX1Q
 wzpn1wg8WjErVlBJHuWUJK6D3rlX1iPw8A7rpUpCnchaTVBFv2XrloXUSZcqXneM8KqUMVG7g6
 brE=
X-SBRS: 2.7
X-MesageID: 24193531
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,458,1589256000"; d="scan'208";a="24193531"
Subject: Re: [PATCH 3/4] build: also check for empty .bss.* in .o -> .init.o
 conversion
To: Jan Beulich <jbeulich@suse.com>
References: <305c2532-408a-9f78-61fe-c90a2e86eb8e@suse.com>
 <c99cf808-0710-51b1-c07c-07bf237e22a3@suse.com>
 <5b2bbc31-0095-c3e2-9e34-20453ea2aa5f@citrix.com>
 <61481966-3052-ebf2-e23b-aac292cd09a1@suse.com>
 <9a3cd872-bc6c-3113-fdf9-2f80ad8fabce@citrix.com>
 <039916f1-c9f2-710f-8f46-3ff9d91a9109@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <039a6c48-8825-1e3e-44d8-23c7de4ac159@citrix.com>
Date: Mon, 10 Aug 2020 18:51:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <039916f1-c9f2-710f-8f46-3ff9d91a9109@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07/08/2020 16:40, Jan Beulich wrote:
> On 07.08.2020 17:12, Andrew Cooper wrote:
>> On 07/08/2020 11:56, Jan Beulich wrote:
>>> On 06.08.2020 18:16, Andrew Cooper wrote:
>>>> On 06/08/2020 10:05, Jan Beulich wrote:
>>>> Can't we remove all of this by having CONFIG_XEN_PE expressed/selectable
>>>> properly in Kconfig, and gathering all the objects normally, rather than
>>>> bodging all of common/efi/ through arch/efi/ ?
>>> _If_ we settle on Kconfig to be allowed to check compiler (and linker)
>>> features, then yes. This continues to be a pending topic though, so
>>> the switch can't be made like this at this point in time. (It could be
>>> made a Kconfig item now - which, when enabled, implies the assertion
>>> that a capable tool chain is in use.)
>> I am still of the opinion that nothing needs discussing, but you are
>> obviously not.
>>
>> Please raise this as a topic and lets discuss it, because it has a
>> meaningful impacting on a large number of pending series.
> Preferably I would have put this on this month's community meeting
> agenda, but I'll be ooo next week, so that's not going to help, I'm
> afraid. I guess I should put it up in email form when I'm back,
> albeit I wasn't thinking it should need to be me to start the
> discussion. Instead my view was that such a discussion should (have
> been, now after-the-fact) be started by whoever wants to introduce
> a new feature.

It would have been better to raise a concern/objection before you
committed the feature.

It was a very clear intent of upgrading Kconfig and switching to Kbuild,
to clean up the total and chronic mess we call a build system.  It has
been discussed multiple times in person, and on xen-devel, without
apparent objection at the time.

The state of 4.14 and later is that we have the feature, and it is
already in use, with a lot more use expected to continue fixing the
build system.

You are currently blocking work to fix aspects of the build system based
on a dislike of this feature, *and* expecting someone else to justify
why using this feature as intended is ok in the first place.

I do not consider that a reasonable expectation of how to proceed.

If you wish to undo what was a deliberate intention of the
Kconfig/Kbuild work, then it is you who must start the conversation on
why we should revert the improvements.

~Andrew

