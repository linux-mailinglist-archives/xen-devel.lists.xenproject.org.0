Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2631CDDBB
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 16:54:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY9oT-0003zI-HD; Mon, 11 May 2020 14:53:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQL3=6Z=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jY9oS-0003zC-56
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 14:53:48 +0000
X-Inumbo-ID: 37947dcc-9397-11ea-ae69-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37947dcc-9397-11ea-ae69-bc764e2007e4;
 Mon, 11 May 2020 14:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589208828;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=8x/qahwqikLhTKltH5G8F8Fn+ZigWA9Ayn1oIa2+6yI=;
 b=GEX5ya+w/o/5w8Km+fWkulJlIZsLAyjRxyy/pfCYpjdrjh8j+y0L2v43
 2GsCX3XC/+qmIPsLvXERZSsA6rIn1cUPFLWPSTkuubE4qq2tyFX77x6Fe
 0LM5noiABVW9Ynra8ruKX2speJRkq2GX3IAepS5DSSRU17bjjk0/NplmD I=;
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: 7R3ic9toiaykhYNmVUq9jQaGi4XMCpaOnFxHpaSGz+Q5uraBh92ojoMI/GBa8fp6ktx3KS3q6I
 VX2YCzOmW8BdsyH6KxiQIbj1HxkvXHG3HgQoE9UOZZl87w52w+2GBYf1WoklEXGfIW7mdfce3n
 5k7GAViWwXONNYqcgFFC8jqknbofxoD60d+XFo/FZ9Y+lI6ku6R/Cy779iPNert22OP6wj02UV
 gSiIZ5I+60brbMMK4uMLhRP2wvEvXrbupBXMvp5C0NS89fd6HGQgIVWKkjW5WEgb+JAuflTRSy
 +AI=
X-SBRS: 2.7
X-MesageID: 17489351
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,380,1583211600"; d="scan'208";a="17489351"
Subject: Re: [PATCH 01/16] x86/traps: Drop last_extable_addr
To: Jan Beulich <jbeulich@suse.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-2-andrew.cooper3@citrix.com>
 <3ec06cb1-6b31-2fde-6de4-23938acab73a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <64cb6793-c3a0-e396-c6cc-50f5a36e19a6@citrix.com>
Date: Mon, 11 May 2020 15:53:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3ec06cb1-6b31-2fde-6de4-23938acab73a@suse.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04/05/2020 13:44, Jan Beulich wrote:
> On 02.05.2020 00:58, Andrew Cooper wrote:
>> The only user of this facility is dom_crash_sync_extable() by passing 0 into
>> asm_domain_crash_synchronous().  The common error cases are already covered
>> with show_page_walk(), leaving only %ss/%fs selector/segment errors in the
>> compat case.
>>
>> Point at dom_crash_sync_extable in the error message, which is about as good
>> as the error hints from other users of asm_domain_crash_synchronous(), and
>> drop last_extable_addr.
> While I'm not entirely opposed, I'd like you to clarify that you indeed
> mean to (mostly) revert your own improvement from 6 or 7 years back
> (commit 8e0da8c07f4f). I'm also surprised to find this as part of the
> series it's in - in what way does this logic get in the way of CET-SS?

It was part of the exception_fixup() cleanup.  The first 4 patches not
specifically related to CET-SS.

~Andrew

