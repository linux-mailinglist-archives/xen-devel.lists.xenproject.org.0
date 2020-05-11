Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2DD1CDE04
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 17:01:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY9vf-0004xI-Mn; Mon, 11 May 2020 15:01:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQL3=6Z=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jY9vd-0004x9-Ii
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 15:01:13 +0000
X-Inumbo-ID: 407cce0c-9398-11ea-9887-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 407cce0c-9398-11ea-9887-bc764e2007e4;
 Mon, 11 May 2020 15:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589209272;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=6k1RSa0b9HpIrhEynQB+3VH7kQgkVRwe81YYLsq4b/Q=;
 b=QEHTVGPvKkkea5Yl60e6RQ5PmhaLlM3Ppk5cukQb7i+9mT1ruspZ+5V7
 T1x0gY6tyMKkebN/IxpqL1d+TcUkzd36JhKpIFtaqU4JCpZsHNWPthH3Y
 BDRYPGLD82Re3zPsjXwMEb8rTM0R0fbmvrvkKtLjGxBlJGo8o+xTou78y k=;
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
IronPort-SDR: jL9iz8iYybZHUJ5sG5imbQX6g2fRPuHHX8nws8tUowYFFhhDaNmcy8wvrW/uPKnsInraGhGRVn
 p8IdgAXy+CTdOJopA7ya8vK+X6YXepVb0n/+lpid+6IWCoQPuEuu1E1BLkfGg2R4qEcepaUIUx
 UutQM31k19JP1wI9u39btDyq11d+ISYi6B0/+V8nfV+X1zju3TXdqOxwJIw4h+SUUSQzMA2elD
 REcpry8gP4W2REgenGp7LIEM8wTg+8toLFt0c2ZA4FHjFNncrW/dp4lg8I5QGkN/NhSKiz/XhT
 P3k=
X-SBRS: 2.7
X-MesageID: 17490179
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,380,1583211600"; d="scan'208";a="17490179"
Subject: Re: [PATCH 02/16] x86/traps: Clean up printing in
 do_reserved_trap()/fatal_trap()
To: Jan Beulich <jbeulich@suse.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-3-andrew.cooper3@citrix.com>
 <aca22b53-895e-19bb-c54c-f1e4945c95c1@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8f1d68b1-895a-d2a6-4dcb-55b688b03336@citrix.com>
Date: Mon, 11 May 2020 16:01:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <aca22b53-895e-19bb-c54c-f1e4945c95c1@suse.com>
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

On 04/05/2020 14:08, Jan Beulich wrote:
> On 02.05.2020 00:58, Andrew Cooper wrote:
>> For one, they render the vector in a different base.
>>
>> Introduce X86_EXC_* constants and vec_name() to refer to exceptions by their
>> mnemonic, which starts bringing the code/diagnostics in line with the Intel
>> and AMD manuals.
> For this "bringing in line" purpose I'd like to see whether you could
> live with some adjustments to how you're currently doing things:
> - NMI is nowhere prefixed by #, hence I think we'd better not do so
>   either; may require embedding the #-es in the names[] table, or not
>   using N() for NMI

No-one is going to get confused at seeing #NMI in an error message.  I
don't mind jugging the existing names table, but anything more
complicated is overkill.

> - neither Coprocessor Segment Overrun nor vector 0x0f have a mnemonic
>   and hence I think we shouldn't invent one; just treat them like
>   other reserved vectors (of which at least vector 0x09 indeed is one
>   on x86-64)?

This I disagree with.  Coprocessor Segment Overrun *is* its name in both
manuals, and the avoidance of vector 0xf is clearly documented as well,
due to it being the default PIC Spurious Interrupt Vector.

Neither CSO or SPV are expected to be encountered in practice, but if
they are, highlighting them is a damn-sight more helpful than pretending
they don't exist.

~Andrew

