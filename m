Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B171DB167
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 13:21:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbMmN-00007C-5j; Wed, 20 May 2020 11:20:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/hkT=7C=zohomail.eu=elliotkillick@srs-us1.protection.inumbo.net>)
 id 1jbMmM-00006L-FV
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 11:20:54 +0000
X-Inumbo-ID: f71a8b64-9a8b-11ea-b9cf-bc764e2007e4
Received: from sender11-pp-o92.zoho.eu (unknown [31.186.226.250])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f71a8b64-9a8b-11ea-b9cf-bc764e2007e4;
 Wed, 20 May 2020 11:20:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1589973650; cv=none; d=zohomail.eu; s=zohoarc; 
 b=Te8D8MxAZn8lO8f1D6jw2Vod41cgY0fLXmT63HCkreH322mL0tWy8z98PrIel+odBF2bwwjDLhgGmqJsIqsynyTIgfa4Hz1UhM4g6ZkzoORrOtuAXcyYXlaobKZCjZQfBRC0LYWSvCjui3U3TuWAOUH9OdA1I0bmklwBvm7SvOc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu;
 s=zohoarc; t=1589973650;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=aR7gBnILmO1RKcA2jKLkKUAJB/f8NlfON0JDkwcQY3Y=; 
 b=cAljNXntotx474riSRV1ig4S+u1y22eLAIB/VXrST4OYS5TywPh9RJbt+4T2NK1m7IHs9/FwPITzQq+wrrL3YVsIec9Up/gD5SIn7WBBVftDHbwC46LP34mrjbBetkcnqFk9Bw4i6SHJiP/2xyqDbTmFxTJaR4HTVK0aoz82UEA=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
 dkim=pass  header.i=zohomail.eu;
 spf=pass  smtp.mailfrom=elliotkillick@zohomail.eu;
 dmarc=pass header.from=<elliotkillick@zohomail.eu>
 header.from=<elliotkillick@zohomail.eu>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1589973650; 
 s=zoho; d=zohomail.eu; i=elliotkillick@zohomail.eu;
 h=Subject:To:References:From:Cc:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=aR7gBnILmO1RKcA2jKLkKUAJB/f8NlfON0JDkwcQY3Y=;
 b=UbtnNdKz71aaL+0922UNn6KNjoveyZ/ueU1h2r3oQxO7itQVjPhfxWea15WycpWb
 xQjiECQiM2T/8JaVh0rSDJxGxTifO01dCOKLf9dV/0xvDgVobzP4fhOcgLYYSIb1ML4
 xjAA88HeK54z11SaclJwRtqPzlHpZDPlMqTT9+uE=
Received: from [10.137.0.35]
 (CPEac202e7c9cc3-CMac202e7c9cc0.cpe.net.cable.rogers.com [99.231.147.74]) by
 mx.zoho.eu with SMTPS id 1589973648928178.0051062278701;
 Wed, 20 May 2020 13:20:48 +0200 (CEST)
Subject: Re: [BUG] Consistent LBR/TSX vmentry failure (0x80000022) calling
 domain_crash() in vmx.c:3324
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <36815795-223f-2b96-5401-c262294cbaa8@zohomail.eu>
 <c715f89a-b2ba-490c-c027-b4c7d7069f42@citrix.com>
From: Elliot Killick <elliotkillick@zohomail.eu>
Message-ID: <2bcd2ccc-b58e-1268-68ce-3ef534534245@zohomail.eu>
Date: Wed, 20 May 2020 11:20:44 +0000
MIME-Version: 1.0
In-Reply-To: <c715f89a-b2ba-490c-c027-b4c7d7069f42@citrix.com>
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

On 2020-05-20 11:10, Andrew Cooper wrote:
> On 20/05/2020 11:33, Elliot Killick wrote:
>> Hello,
>>
>> Xen is crashing Windows 10 (64-bit) VMs consistently whenever IDA
>> Debugger
>> (https://www.hex-rays.com/products/ida/support/download_freeware/)
>> launches the Local Windows Debugger. The crash occurs when trying to
>> launch the debugger against any executable (e.g. calc.exe) right at the
>> time IDA says it is "Moving segment from <X address> to <Y address>".
>>
>> Tested on Windows 7, 8 and Linux as well but the bug is only triggered
>> on Windows 10. Happens whether or not IDA is running with administrator
>> privileges. No drivers/VM tools installed. Windows has a bug check code
>> of zero, leaves no memory dump, nothing in the logs from QEMU in Dom0,
>> the domain just powers off immediately leaving a record of the incident
>> in the hypervisor.log. So, it does appear to be a Xen issue. Modern
>> Intel CPU.
>>
>> Does anyone have some ideas on what may be causing this?
>=20
> What exact CPU do you have?=C2=A0 This looks exactly like the
> Haswell/Broadwell TSX errata.
>=20
> ~Andrew
>=20

i5-4590


