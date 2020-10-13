Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D2928D176
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 17:47:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6301.16794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSMWC-0001Fd-86; Tue, 13 Oct 2020 15:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6301.16794; Tue, 13 Oct 2020 15:47:16 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSMWC-0001FE-4x; Tue, 13 Oct 2020 15:47:16 +0000
Received: by outflank-mailman (input) for mailman id 6301;
 Tue, 13 Oct 2020 15:47:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pNIz=DU=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kSMWA-0001F7-Vp
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 15:47:15 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df3c3e0b-9d39-4f9a-8199-bafa4d4ad748;
 Tue, 13 Oct 2020 15:47:13 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pNIz=DU=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
	id 1kSMWA-0001F7-Vp
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 15:47:15 +0000
X-Inumbo-ID: df3c3e0b-9d39-4f9a-8199-bafa4d4ad748
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id df3c3e0b-9d39-4f9a-8199-bafa4d4ad748;
	Tue, 13 Oct 2020 15:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602604033;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=qPWmkc2ZFeFYf0b2dKh9DRNp0gTWx0DBaI4WjaMTVxw=;
  b=ILzzLaIV0uZY/hOZQ2hC3r+YiNr/hoZjHq3u4AJAi66RK/gKTLwrJtdT
   7xOhjxdDHcqgY2HRS0NHPfObYJzvnXwcJtMQeuP8U51lKFpC5l7pHvipE
   LZWuGlkKkajYkqphbUv4DgOyj1AlR4NQi3gbvujfdCfJnZ01w0nHmvLK9
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 3e/y38pEDJMjCMfqTS0H0DHusp9IeEG24VUZjC0eniMrNLV744okFu+MwTwxhh6oGtINSogFDH
 gNaYfdD5m4KMmkZchp0RddtevJSkd0TLoEK51VBrxOerfB/dNeIvdco8tBIe7jUbcW1cC5bYru
 cmb5oJKSXbKXtMg1+tWDeQXWUhOd1aBQy5YcU+ISp1vykcgfGpwVOd0TnleZkgTjYa9DU6zg75
 4fdTSGfT9ruU0GAGAC/rbkGq/ngg9s5nEyZ7ddUrIyzYUfD/iKvALkdrjvkaGOgpqaVeoAhzud
 b+k=
X-SBRS: 2.5
X-MesageID: 29158354
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,371,1596513600"; 
   d="scan'208";a="29158354"
Subject: Re: [PATCH] hvmloader: flip "ACPI data" to ACPI NVS type for ACPI
 table region
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, <andrew.cooper3@citrix.com>,
	<roger.pau@citrix.com>, <wl@xen.org>, <iwj@xenproject.org>
References: <1602586216-27371-1-git-send-email-igor.druzhinin@citrix.com>
 <56bea9a9-2509-cc39-a6fd-fb7db3e54d71@suse.com>
 <83f567a1-35f3-a227-830b-a59b53217f3b@citrix.com>
 <ad54c16b-c3b0-cff2-921f-b84a735d3149@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <cc0f409e-60c0-41ae-f932-f6c2d7f82baa@citrix.com>
Date: Tue, 13 Oct 2020 16:47:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ad54c16b-c3b0-cff2-921f-b84a735d3149@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13/10/2020 16:35, Jan Beulich wrote:
> On 13.10.2020 14:59, Igor Druzhinin wrote:
>> On 13/10/2020 13:51, Jan Beulich wrote:
>>> As a consequence I think we will also want to adjust Xen itself to
>>> automatically disable ACPI when it ends up consuming E801 data. Or
>>> alternatively we should consider dropping all E801-related code (as
>>> being inapplicable to 64-bit systems).
>>
>> I'm not following here. What Xen has to do with E801? It's a SeaBIOS implemented
>> call that happened to be used by QEMU option ROM. We cannot drop it from there
>> as it's part of BIOS spec.
> 
> Any ACPI aware OS has to use E820 (and nothing else). Hence our
> own use of E801 should either be dropped, or lead to the
> disabling of ACPI. Otherwise real firmware using logic similar
> to SeaBIOS'es (but hopefully properly accounting for holes)
> could make us use ACPI table space as normal RAM.

It's not us using it - it's a boot loader from QEMU in a form of option ROM
that works in 16bit pre-OS environment which is not OS and relies on e801 BIOS call.
I'm sure any ACPI aware OS does indeed use E820 but the problem here is not an OS.

The option ROM is loaded using fw_cfg from QEMU so it's not our code. Technically
it's one foreign code (QEMU boot loader) talking to another foreign code (SeaBIOS)
which provides information based on E820 that we gave them.

So I'm afraid decision to dynamically disable ACPI (whatever you mean by this)
cannot be made by sole usage of this call by a pre-OS boot loader.

Igor

