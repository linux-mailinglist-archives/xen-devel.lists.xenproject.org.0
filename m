Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B3A1DB1E3
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 13:36:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbN0k-0001K9-3G; Wed, 20 May 2020 11:35:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4N77=7C=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jbN0i-0001K4-C0
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 11:35:44 +0000
X-Inumbo-ID: 08d86c3f-9a8e-11ea-a9f3-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08d86c3f-9a8e-11ea-a9f3-12813bfff9fa;
 Wed, 20 May 2020 11:35:43 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ywem84RArb9AGL+qMApH7vTM/3l1wdppDpiZwRXhuieTzAp4r4qpTEZCgFW5W0rF1dqr7nnCF1
 AMePiEunqm7+3VfZWxHZ+hx8wcIz1gt8eIdvERAJtzgYDyXIsNf1T+J22h3jzwB5F4foKV/ruj
 Ung1J6gbvjHyZyJBKF5t8d3Sf1U45a0UcYqJnS/2LNWGuVReM+lf9R8GlDJb6A5M9QzlZPBteT
 Cmbjvz4+yN14QZwMZf0wSVoZhrdyIuUMArTK+ywJod7SpbswZG6O2Qc/zhw4ofqQGt6yyUCtnC
 nso=
X-SBRS: 2.7
X-MesageID: 18335873
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,413,1583211600"; d="scan'208";a="18335873"
Subject: Re: [BUG] Consistent LBR/TSX vmentry failure (0x80000022) calling
 domain_crash() in vmx.c:3324
To: Elliot Killick <elliotkillick@zohomail.eu>
References: <36815795-223f-2b96-5401-c262294cbaa8@zohomail.eu>
 <c715f89a-b2ba-490c-c027-b4c7d7069f42@citrix.com>
 <2bcd2ccc-b58e-1268-68ce-3ef534534245@zohomail.eu>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1b76cd6a-c6a2-c9c9-1d8b-32a9a1dbc557@citrix.com>
Date: Wed, 20 May 2020 12:27:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2bcd2ccc-b58e-1268-68ce-3ef534534245@zohomail.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: FTLPEX02CAS03.citrite.net (10.13.99.94) To
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
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20/05/2020 12:20, Elliot Killick wrote:
> On 2020-05-20 11:10, Andrew Cooper wrote:
>> On 20/05/2020 11:33, Elliot Killick wrote:
>>> Hello,
>>>
>>> Xen is crashing Windows 10 (64-bit) VMs consistently whenever IDA
>>> Debugger
>>> (https://www.hex-rays.com/products/ida/support/download_freeware/)
>>> launches the Local Windows Debugger. The crash occurs when trying to
>>> launch the debugger against any executable (e.g. calc.exe) right at the
>>> time IDA says it is "Moving segment from <X address> to <Y address>".
>>>
>>> Tested on Windows 7, 8 and Linux as well but the bug is only triggered
>>> on Windows 10. Happens whether or not IDA is running with administrator
>>> privileges. No drivers/VM tools installed. Windows has a bug check code
>>> of zero, leaves no memory dump, nothing in the logs from QEMU in Dom0,
>>> the domain just powers off immediately leaving a record of the incident
>>> in the hypervisor.log. So, it does appear to be a Xen issue. Modern
>>> Intel CPU.
>>>
>>> Does anyone have some ideas on what may be causing this?
>> What exact CPU do you have?  This looks exactly like the
>> Haswell/Broadwell TSX errata.
>>
>> ~Andrew
>>
> i5-4590

How about the output of `head /proc/cpuinfo` in dom0?

~Andrew

