Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF5A1DB349
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 14:32:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbNtG-0006wI-No; Wed, 20 May 2020 12:32:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4N77=7C=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jbNtG-0006wD-4E
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 12:32:06 +0000
X-Inumbo-ID: e96626fe-9a95-11ea-a9ff-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e96626fe-9a95-11ea-a9ff-12813bfff9fa;
 Wed, 20 May 2020 12:32:04 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: tgETOYZF0Amr79w9J5VUeDFooHZSvwk6D0nnal5tDs+/2zGHjE6umka7eyhHo8unlu9OoXp061
 LpkMK6rF2rMFgiVrYhIfF/Dc7m//cPhauQLMtULnnF6Lvmewcc6i4aE9X/gZ0XSWyLZvsPrxwW
 V3CwQwIsbBlQbZ+qGtzihmVpPKpVUFvb1n5mJSkCaCGleQvhcpYumGKH3LC48eWWq4vPvP0GO3
 buHg1Dp/a0CnWA9BwNOCkeulsjqu/wuEpQrFk3RGnPmhdqjlnTuNlBHVZx4sX7LXvfDHDkHZU+
 JOM=
X-SBRS: 2.7
X-MesageID: 18239068
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,414,1583211600"; d="scan'208";a="18239068"
Subject: Re: [BUG] Consistent LBR/TSX vmentry failure (0x80000022) calling
 domain_crash() in vmx.c:3324
To: Elliot Killick <elliotkillick@zohomail.eu>
References: <36815795-223f-2b96-5401-c262294cbaa8@zohomail.eu>
 <c715f89a-b2ba-490c-c027-b4c7d7069f42@citrix.com>
 <2bcd2ccc-b58e-1268-68ce-3ef534534245@zohomail.eu>
 <1b76cd6a-c6a2-c9c9-1d8b-32a9a1dbc557@citrix.com>
 <657e7522-bd0f-bea3-7ce8-2f6c4ec72407@zohomail.eu>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <dc1ef4b6-9406-b625-c157-6ebec2a6afda@citrix.com>
Date: Wed, 20 May 2020 13:31:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <657e7522-bd0f-bea3-7ce8-2f6c4ec72407@zohomail.eu>
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
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20/05/2020 12:46, Elliot Killick wrote:
> On 2020-05-20 11:27, Andrew Cooper wrote:
>> On 20/05/2020 12:20, Elliot Killick wrote:
>>> On 2020-05-20 11:10, Andrew Cooper wrote:
>>>> On 20/05/2020 11:33, Elliot Killick wrote:
>>>>> Hello,
>>>>>
>>>>> Xen is crashing Windows 10 (64-bit) VMs consistently whenever IDA
>>>>> Debugger
>>>>> (https://www.hex-rays.com/products/ida/support/download_freeware/)
>>>>> launches the Local Windows Debugger. The crash occurs when trying to
>>>>> launch the debugger against any executable (e.g. calc.exe) right at the
>>>>> time IDA says it is "Moving segment from <X address> to <Y address>".
>>>>>
>>>>> Tested on Windows 7, 8 and Linux as well but the bug is only triggered
>>>>> on Windows 10. Happens whether or not IDA is running with administrator
>>>>> privileges. No drivers/VM tools installed. Windows has a bug check code
>>>>> of zero, leaves no memory dump, nothing in the logs from QEMU in Dom0,
>>>>> the domain just powers off immediately leaving a record of the incident
>>>>> in the hypervisor.log. So, it does appear to be a Xen issue. Modern
>>>>> Intel CPU.
>>>>>
>>>>> Does anyone have some ideas on what may be causing this?
>>>> What exact CPU do you have?  This looks exactly like the
>>>> Haswell/Broadwell TSX errata.
>>>>
>>>> ~Andrew
>>>>
>>> i5-4590
>> How about the output of `head /proc/cpuinfo` in dom0?
>>
>> ~Andrew
>>
> processor	: 0
> vendor_id	: GenuineIntel
> cpu family	: 6
> model		: 60
> model name	: Intel(R) Core(TM) i5-4590 CPU @ 3.30GHz
> stepping	: 3
> microcode	: 0x27
> cpu MHz		: 3299.926
> cache size	: 6144 KB
> physical id	: 0

Ok, so the errata is one of HSM182/HSD172.

Xen has workaround for all of these.  However, I also see:

> (XEN) ----[ Xen-4.8.5-15.fc25  x86_64  debug=n   Not tainted ]----

which is an obsolete version of Xen these days.  It looks like these
issues were first fixed in Xen 4.9, but you should upgrade to something
rather newer.

~Andrew

