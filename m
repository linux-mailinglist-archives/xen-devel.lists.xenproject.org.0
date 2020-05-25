Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 163681E1498
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 21:04:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdIMq-0000jk-Jp; Mon, 25 May 2020 19:02:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=775J=7H=zohomail.eu=elliotkillick@srs-us1.protection.inumbo.net>)
 id 1jdIMo-0000jf-Uc
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 19:02:31 +0000
X-Inumbo-ID: 4769079e-9eba-11ea-9887-bc764e2007e4
Received: from sender11-pp-o93.zoho.eu (unknown [31.186.226.251])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4769079e-9eba-11ea-9887-bc764e2007e4;
 Mon, 25 May 2020 19:02:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1590433346; cv=none; d=zohomail.eu; s=zohoarc; 
 b=d2kW6MvdHWurCUa2wY2E1e9zGwAc9wlYX8l+/XpzWYA45rGZZdnB3w4ZZbKdlYQHrz6NMKjsSQ6St3mRf4u4P/TxTdwM6m3ip1sj3U4TRELnkHoYJpoRvgItAjOO9/JkAaPHCJ593Xzm483O0e2aeuAE8LyJntpsrcW9ICx862o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu;
 s=zohoarc; t=1590433346;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=zstc/sqbQ9WVCJVASP9+rIVmqfSTJUm3XzhTxVIi8+Q=; 
 b=SM/gweNYX2J0P3gC3Hi1x/rsQ6zC+J0MdMhX32vPLP5QJCchksx2AwaYTd/2P63h57h8yyDYxmxcuuaT6cSfBYGAFqKkKYbhdJlba/1DkOuuRLfF5CTLCcmyn+pJzn5EyurAFpNZn0AxDVVK9WFeggWS5cAvzu7Ku4X2BtMqlNc=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
 dkim=pass  header.i=zohomail.eu;
 spf=pass  smtp.mailfrom=elliotkillick@zohomail.eu;
 dmarc=pass header.from=<elliotkillick@zohomail.eu>
 header.from=<elliotkillick@zohomail.eu>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1590433346; 
 s=zoho; d=zohomail.eu; i=elliotkillick@zohomail.eu;
 h=From:Subject:To:Cc:Message-ID:References:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=zstc/sqbQ9WVCJVASP9+rIVmqfSTJUm3XzhTxVIi8+Q=;
 b=JF22u+9rO5ikwC3gRFLNhx3N8g197yvdBWlIAA4BTfl3dsifuZTS/izLf7gdh9v5
 DVr/QHRR6sfnn241K1xOPXFBfQubj1IFegdLlstq3zDCiR/fnxHbjIRMWaowvrXNMNQ
 7uDumIkcQL91C4HGEzXPJ6n40b1tuhNptnm3UM9Q=
Received: from [10.137.0.35]
 (CPEac202e7c9cc3-CMac202e7c9cc0.cpe.net.cable.rogers.com [99.231.147.74]) by
 mx.zoho.eu with SMTPS id 1590433345040946.9235816899597;
 Mon, 25 May 2020 21:02:25 +0200 (CEST)
From: Elliot Killick <elliotkillick@zohomail.eu>
Subject: Re: [BUG] Consistent LBR/TSX vmentry failure (0x80000022) calling
 domain_crash() in vmx.c:3324
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <767a6155-63f1-ab0c-377a-d2a1638babf4@zohomail.eu>
References: <36815795-223f-2b96-5401-c262294cbaa8@zohomail.eu>
 <c715f89a-b2ba-490c-c027-b4c7d7069f42@citrix.com>
 <2bcd2ccc-b58e-1268-68ce-3ef534534245@zohomail.eu>
 <1b76cd6a-c6a2-c9c9-1d8b-32a9a1dbc557@citrix.com>
 <657e7522-bd0f-bea3-7ce8-2f6c4ec72407@zohomail.eu>
 <dc1ef4b6-9406-b625-c157-6ebec2a6afda@citrix.com>
 <325c716c-df62-d24c-2e48-3a100e84f48d@zohomail.eu>
 <c09d62a4-6362-8eb9-a3b0-79c429850db6@citrix.com>
Date: Mon, 25 May 2020 19:01:31 +0000
MIME-Version: 1.0
In-Reply-To: <c09d62a4-6362-8eb9-a3b0-79c429850db6@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 2020-05-20 16:53, Andrew Cooper wrote:
> On 20/05/2020 15:59, Elliot Killick wrote:
>> On 2020-05-20 12:31, Andrew Cooper wrote:
>>> On 20/05/2020 12:46, Elliot Killick wrote:
>>>> processor=09: 0
>>>> vendor_id=09: GenuineIntel
>>>> cpu family=09: 6
>>>> model=09=09: 60
>>>> model name=09: Intel(R) Core(TM) i5-4590 CPU @ 3.30GHz
>>>> stepping=09: 3
>>>> microcode=09: 0x27
>>>> cpu MHz=09=09: 3299.926
>>>> cache size=09: 6144 KB
>>>> physical id=09: 0
>>> Ok, so the errata is one of HSM182/HSD172.
>>>
>>> Xen has workaround for all of these.=C2=A0 However, I also see:
>>>
>>>> (XEN) ----[ Xen-4.8.5-15.fc25=C2=A0 x86_64=C2=A0 debug=3Dn=C2=A0=C2=A0=
 Not tainted ]----
>>> which is an obsolete version of Xen these days.=C2=A0 It looks like the=
se
>>> issues were first fixed in Xen 4.9, but you should upgrade to something
>>> rather newer.
>>>
>>> ~Andrew
>>>
>> Ah, so this is originally a CPU bug which Xen has had to patch over.
>=20
> Yes.=C2=A0 It was an unintended consequence of Intel being forced to disa=
ble
> TSX in most of their Haswell/Broadwell CPUs.
>=20
>> As for the Xen version, that's controlled by the "distribution" of Xen I
>> run which is Qubes. To remedy this I could run the testing stream of
>> Qubes which currently provides the latest version of Xen (4.13) but that
>> could bring its own set of problems.
>=20
> Ah, in which case Qubes will probably consider backporting the fixes.=C2=
=A0
> Open a bug with them, and I can probably point out a minimum set of
> backports to make it work.
>=20
> ~Andrew
>=20

Hi, Andrew

I've opened up a bug with Qubes here:
https://github.com/QubesOS/qubes-issues/issues/5848

Please highlight the required backports at your earliest convenience,
thank you.


