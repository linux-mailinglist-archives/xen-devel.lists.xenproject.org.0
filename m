Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 424E41DB797
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 16:59:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbQC8-0002wI-ML; Wed, 20 May 2020 14:59:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/hkT=7C=zohomail.eu=elliotkillick@srs-us1.protection.inumbo.net>)
 id 1jbQC6-0002wB-Hy
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 14:59:42 +0000
X-Inumbo-ID: 882a9248-9aaa-11ea-aa32-12813bfff9fa
Received: from sender11-pp-o93.zoho.eu (unknown [31.186.226.251])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 882a9248-9aaa-11ea-aa32-12813bfff9fa;
 Wed, 20 May 2020 14:59:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1589986779; cv=none; d=zohomail.eu; s=zohoarc; 
 b=hsuZSaxiZNrWx4SZfuji5fG9mpoim99fDkem1jGRnxduetF9Oo5F6GhhBb1Cjc5di167pKl7LbQMu5B3zK33BRMnCYR49Q3Lgq/Od8r3B8TI/reJ+e4XupDTfRNP4FckxPsBbGvuoK6x5D07n5dVHEfIvBB0FcX+NfRB+Rj9h+Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu;
 s=zohoarc; t=1589986779;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=cw3sbluNfCHHl1K+t3LIMvsgkm5XgmIsw435d5vASq0=; 
 b=lnbO5MAseOwSBJE3NflNvVACPew4nNZEBgDSzr2Qm7de37Mo/R3HxLbUZQplPKU8Y6NEU5igABE+gToalTuelEgQtfM5GTP412GVJWoLALlYmys622NYORGnyLadyOknFeCYfRuLTblenuFm3SCiqpJW9WnLNfKFu6WtSdPNhKs=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
 dkim=pass  header.i=zohomail.eu;
 spf=pass  smtp.mailfrom=elliotkillick@zohomail.eu;
 dmarc=pass header.from=<elliotkillick@zohomail.eu>
 header.from=<elliotkillick@zohomail.eu>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1589986779; 
 s=zoho; d=zohomail.eu; i=elliotkillick@zohomail.eu;
 h=Subject:To:References:From:Cc:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=cw3sbluNfCHHl1K+t3LIMvsgkm5XgmIsw435d5vASq0=;
 b=BZlg6TKEz5zMnEsvvJ5z6Mo6vz+Pr76P4XfYK/Uzr0kiaXRNowZXhlYbOKY1qRAp
 1VJuNv3p0bL9l4gNa2foG5UjVzS+Jvm5CAI9kf5AAj5a8kK4Ehu3heOiq9VtPf67UcP
 PD/iGmEGCS2/G4PcokQHrtNsTXAacAECoYwlI9Y0=
Received: from [10.137.0.35]
 (CPEac202e7c9cc3-CMac202e7c9cc0.cpe.net.cable.rogers.com [99.231.147.74]) by
 mx.zoho.eu with SMTPS id 1589986777008891.008836865654;
 Wed, 20 May 2020 16:59:37 +0200 (CEST)
Subject: Re: [BUG] Consistent LBR/TSX vmentry failure (0x80000022) calling
 domain_crash() in vmx.c:3324
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <36815795-223f-2b96-5401-c262294cbaa8@zohomail.eu>
 <c715f89a-b2ba-490c-c027-b4c7d7069f42@citrix.com>
 <2bcd2ccc-b58e-1268-68ce-3ef534534245@zohomail.eu>
 <1b76cd6a-c6a2-c9c9-1d8b-32a9a1dbc557@citrix.com>
 <657e7522-bd0f-bea3-7ce8-2f6c4ec72407@zohomail.eu>
 <dc1ef4b6-9406-b625-c157-6ebec2a6afda@citrix.com>
From: Elliot Killick <elliotkillick@zohomail.eu>
Message-ID: <325c716c-df62-d24c-2e48-3a100e84f48d@zohomail.eu>
Date: Wed, 20 May 2020 14:59:33 +0000
MIME-Version: 1.0
In-Reply-To: <dc1ef4b6-9406-b625-c157-6ebec2a6afda@citrix.com>
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

On 2020-05-20 12:31, Andrew Cooper wrote:
> On 20/05/2020 12:46, Elliot Killick wrote:
>> On 2020-05-20 11:27, Andrew Cooper wrote:
>>> On 20/05/2020 12:20, Elliot Killick wrote:
>>>> On 2020-05-20 11:10, Andrew Cooper wrote:
>>>>> On 20/05/2020 11:33, Elliot Killick wrote:
>>>>>> Hello,
>>>>>>
>>>>>> Xen is crashing Windows 10 (64-bit) VMs consistently whenever IDA
>>>>>> Debugger
>>>>>> (https://www.hex-rays.com/products/ida/support/download_freeware/)
>>>>>> launches the Local Windows Debugger. The crash occurs when trying to
>>>>>> launch the debugger against any executable (e.g. calc.exe) right at =
the
>>>>>> time IDA says it is "Moving segment from <X address> to <Y address>"=
.
>>>>>>
>>>>>> Tested on Windows 7, 8 and Linux as well but the bug is only trigger=
ed
>>>>>> on Windows 10. Happens whether or not IDA is running with administra=
tor
>>>>>> privileges. No drivers/VM tools installed. Windows has a bug check c=
ode
>>>>>> of zero, leaves no memory dump, nothing in the logs from QEMU in Dom=
0,
>>>>>> the domain just powers off immediately leaving a record of the incid=
ent
>>>>>> in the hypervisor.log. So, it does appear to be a Xen issue. Modern
>>>>>> Intel CPU.
>>>>>>
>>>>>> Does anyone have some ideas on what may be causing this?
>>>>> What exact CPU do you have?=C2=A0 This looks exactly like the
>>>>> Haswell/Broadwell TSX errata.
>>>>>
>>>>> ~Andrew
>>>>>
>>>> i5-4590
>>> How about the output of `head /proc/cpuinfo` in dom0?
>>>
>>> ~Andrew
>>>
>> processor=09: 0
>> vendor_id=09: GenuineIntel
>> cpu family=09: 6
>> model=09=09: 60
>> model name=09: Intel(R) Core(TM) i5-4590 CPU @ 3.30GHz
>> stepping=09: 3
>> microcode=09: 0x27
>> cpu MHz=09=09: 3299.926
>> cache size=09: 6144 KB
>> physical id=09: 0
>=20
> Ok, so the errata is one of HSM182/HSD172.
>=20
> Xen has workaround for all of these.=C2=A0 However, I also see:
>=20
>> (XEN) ----[ Xen-4.8.5-15.fc25=C2=A0 x86_64=C2=A0 debug=3Dn=C2=A0=C2=A0 N=
ot tainted ]----
>=20
> which is an obsolete version of Xen these days.=C2=A0 It looks like these
> issues were first fixed in Xen 4.9, but you should upgrade to something
> rather newer.
>=20
> ~Andrew
>=20

Ah, so this is originally a CPU bug which Xen has had to patch over.

As for the Xen version, that's controlled by the "distribution" of Xen I
run which is Qubes. To remedy this I could run the testing stream of
Qubes which currently provides the latest version of Xen (4.13) but that
could bring its own set of problems.

Thank you for the help, Andrew!


