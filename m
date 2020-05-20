Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 107741DB235
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 13:47:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbNBh-0002Ye-2L; Wed, 20 May 2020 11:47:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/hkT=7C=zohomail.eu=elliotkillick@srs-us1.protection.inumbo.net>)
 id 1jbNBf-0002YX-AC
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 11:47:03 +0000
X-Inumbo-ID: 9e26030e-9a8f-11ea-b07b-bc764e2007e4
Received: from sender11-pp-o93.zoho.eu (unknown [31.186.226.251])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e26030e-9a8f-11ea-b07b-bc764e2007e4;
 Wed, 20 May 2020 11:47:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1589975219; cv=none; d=zohomail.eu; s=zohoarc; 
 b=chTRUJ3vgHGLesrZHWnOhV+zdtjfA7ARzIkqQ1FdXoFTwGQ9KyxOZ0l14jY1++IyIQ/0v0lo02TFGZCkr4j+5dqYnxooUh8/HEu8GIv/Ixzr9M3kIWsUf+fjKKFq08u6Bgp3IrYPoVeEdFg+33j5SsiAsGAaklD+vrkgeiLbPSc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu;
 s=zohoarc; t=1589975219;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=3KZK3LTh1DP6fs9SUzKRT3SHJyw42JnzKR0mhAkLv+s=; 
 b=KCLDNP1DhQGzHxkOOAt5cNP0DlziRjVr1jbvEOUaWvEqzZIoC88SoByesT17jEXohPHOOmAEkt8qEeGyrsZRVcJF9+6Te5GtXTygXjqkNuiVFDhI0coul1wDjm0lJEpWW6yG6CDU9WP6vrDEwFSkpyWDFoKea6mLgX+D/mlSpio=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
 dkim=pass  header.i=zohomail.eu;
 spf=pass  smtp.mailfrom=elliotkillick@zohomail.eu;
 dmarc=pass header.from=<elliotkillick@zohomail.eu>
 header.from=<elliotkillick@zohomail.eu>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1589975219; 
 s=zoho; d=zohomail.eu; i=elliotkillick@zohomail.eu;
 h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=3KZK3LTh1DP6fs9SUzKRT3SHJyw42JnzKR0mhAkLv+s=;
 b=ca48+O65GZtTCFHs7oiN+9hFc5f4addQ9wwe9kksx9Z7ha46rY9jpMeOPzznWd9n
 FZFwGD/0yJeVv1tq5nWgAKbR/XeP91cAJq66bCp5YeiLzSt/qQBc6bwk9euLXO4/Z2V
 gp+IFWrVG6hBQ9gWtmHx44dn2OG5NXSd0YekcK9c=
Received: from [10.137.0.35]
 (CPEac202e7c9cc3-CMac202e7c9cc0.cpe.net.cable.rogers.com [99.231.147.74]) by
 mx.zoho.eu with SMTPS id 1589975218562995.3045505491439;
 Wed, 20 May 2020 13:46:58 +0200 (CEST)
Subject: Re: [BUG] Consistent LBR/TSX vmentry failure (0x80000022) calling
 domain_crash() in vmx.c:3324
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <36815795-223f-2b96-5401-c262294cbaa8@zohomail.eu>
 <c715f89a-b2ba-490c-c027-b4c7d7069f42@citrix.com>
 <2bcd2ccc-b58e-1268-68ce-3ef534534245@zohomail.eu>
 <1b76cd6a-c6a2-c9c9-1d8b-32a9a1dbc557@citrix.com>
From: Elliot Killick <elliotkillick@zohomail.eu>
Message-ID: <657e7522-bd0f-bea3-7ce8-2f6c4ec72407@zohomail.eu>
Date: Wed, 20 May 2020 11:46:54 +0000
MIME-Version: 1.0
In-Reply-To: <1b76cd6a-c6a2-c9c9-1d8b-32a9a1dbc557@citrix.com>
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

On 2020-05-20 11:27, Andrew Cooper wrote:
> On 20/05/2020 12:20, Elliot Killick wrote:
>> On 2020-05-20 11:10, Andrew Cooper wrote:
>>> On 20/05/2020 11:33, Elliot Killick wrote:
>>>> Hello,
>>>>
>>>> Xen is crashing Windows 10 (64-bit) VMs consistently whenever IDA
>>>> Debugger
>>>> (https://www.hex-rays.com/products/ida/support/download_freeware/)
>>>> launches the Local Windows Debugger. The crash occurs when trying to
>>>> launch the debugger against any executable (e.g. calc.exe) right at th=
e
>>>> time IDA says it is "Moving segment from <X address> to <Y address>".
>>>>
>>>> Tested on Windows 7, 8 and Linux as well but the bug is only triggered
>>>> on Windows 10. Happens whether or not IDA is running with administrato=
r
>>>> privileges. No drivers/VM tools installed. Windows has a bug check cod=
e
>>>> of zero, leaves no memory dump, nothing in the logs from QEMU in Dom0,
>>>> the domain just powers off immediately leaving a record of the inciden=
t
>>>> in the hypervisor.log. So, it does appear to be a Xen issue. Modern
>>>> Intel CPU.
>>>>
>>>> Does anyone have some ideas on what may be causing this?
>>> What exact CPU do you have?=C2=A0 This looks exactly like the
>>> Haswell/Broadwell TSX errata.
>>>
>>> ~Andrew
>>>
>> i5-4590
>=20
> How about the output of `head /proc/cpuinfo` in dom0?
>=20
> ~Andrew
>=20

processor=09: 0
vendor_id=09: GenuineIntel
cpu family=09: 6
model=09=09: 60
model name=09: Intel(R) Core(TM) i5-4590 CPU @ 3.30GHz
stepping=09: 3
microcode=09: 0x27
cpu MHz=09=09: 3299.926
cache size=09: 6144 KB
physical id=09: 0


