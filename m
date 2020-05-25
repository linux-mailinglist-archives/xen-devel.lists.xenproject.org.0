Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 552121E1369
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 19:31:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdGvw-0001GG-Gt; Mon, 25 May 2020 17:30:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pvIA=7H=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jdGvv-0001GB-JN
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 17:30:39 +0000
X-Inumbo-ID: 7327a302-9ead-11ea-af01-12813bfff9fa
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7327a302-9ead-11ea-af01-12813bfff9fa;
 Mon, 25 May 2020 17:30:39 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:43380
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jdGvs-000HbU-M1 (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Mon, 25 May 2020 18:30:36 +0100
Subject: Re: [PATCH] x86: avoid HPET use also on certain Coffee Lake H
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <26a90632-bb76-a24b-aef1-4c068b610c6a@suse.com>
 <de2ca5b7-5fe1-27e5-b6e6-08e695258f1f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5f5483cc-a8e8-51a3-6c47-5b061ff97108@citrix.com>
Date: Mon, 25 May 2020 18:30:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <de2ca5b7-5fe1-27e5-b6e6-08e695258f1f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25/05/2020 16:23, Jan Beulich wrote:
> On 25.05.2020 17:18, Jan Beulich wrote:
>> Linux commit f8edbde885bbcab6a2b4a1b5ca614e6ccb807577 says
>>
>> "Coffee Lake H SoC has similar behavior as Coffee Lake, skewed HPET
>>  timer once the SoCs entered PC10."
>>
>> Again follow this for Xen as well, noting though that even the
>> pre-existing PCI ID refers to a H-processor line variant (the 6-core
>> one). It is also suspicious that the datasheet names 0x3e10 for the
>> 4-core variant, while the Linux commit specifies 0x3e20, which I haven't
>> been able to locate in any datasheet yet.

3e20 is the host bridge ID for CFL-R (Gen 9) Core i9 (8c/16t) as found
in the Dell XPS 15 7590 amongst other things.

As such, it is a generation later than CFL.

>>  To be on the safe side, add
>> both until clarification can be provided by Intel.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Given the nature of issue (a power efficiently "feature" rather than a
bug), it will likely affect everything in a couple of generations worth
of CPUs.

The issue may not actually affect Xen yet, because I don't expect we've
got S0ix working yet.  It is only a problem on entry to S0i2/3 where the
HPET is halted.

> I'd like to note that I've been sitting on this for several months,
> hoping to be able to submit with less uncertainty. I shall further
> note that I'm sitting on a similar Ice Lake patch, triggered by
> seeing Linux'es e0748539e3d594dd26f0d27a270f14720b22a406. The
> situation seems even worse there - I can't make datasheet and
> Linux commit match even remotely, PCI-ID-wise. I didn't think it
> makes sense to submit a patch in such a case.

0x8a12 is an ID in the middle of a load of Ice Lake IDs, according to
the PCI-ID database, but there isn't entry specifically for it.

I can't find a datasheet either for it.

~Andrew

