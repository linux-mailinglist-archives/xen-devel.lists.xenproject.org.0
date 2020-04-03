Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3350719DA4A
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 17:36:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKOMj-0003zp-5R; Fri, 03 Apr 2020 15:36:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WUFr=5T=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jKOMh-0003zk-An
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 15:36:15 +0000
X-Inumbo-ID: da12e3da-75c0-11ea-83d8-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da12e3da-75c0-11ea-83d8-bc764e2007e4;
 Fri, 03 Apr 2020 15:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585928174;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ehC5Zoms2zII/jTyHLjKNjAR4lgbza6Xch3tXf1f8mM=;
 b=LAsoRaUWcGX1HdSOBMEhF3lQzRR0Rhw2ib9LAt51OtxR2lZc6RXxKyCn
 l4T/JO6GuGDKKyAUxtc2PaAF3svgHahSzkn9eAStBDEz/fyp5wl75FRPZ
 wJ3qdfz+kdAeB7yDO37kRje6omH0YGtPsvBsSjFx5KMzexXbNC/V07taQ U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1gTVzJ0cZTpS1yZsyQA2/zDk+PGZGOHMc7mqmx6/HBrUwpUVLuE5/gdJvDcw923AH3HjVJr+dp
 FtrRNzI4NvjvVV7z954/c7N3IokfdSAC92pzqYep8M7zHIrijnwCU1NKsRdaCpATJD9OzDWf/5
 VFYcNFiNx8yC2fKwnQVzWJaYWKMmGBTOyp/XLRKS9C53Z2h/062/IdvfUUXstjpJqewCG8wLFg
 PDRUiouukSdYhQtpyzxvtJ9c9I2ohYgtY27XtlJTBsb+u4IVvBKWbJCfjQkscgVlbkxyqnDKpo
 I+M=
X-SBRS: 2.7
X-MesageID: 15549666
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,340,1580792400"; d="scan'208";a="15549666"
Subject: Re: [PATCH] hvmloader: probe memory below 4G before allocation for
 OVMF
To: Jan Beulich <jbeulich@suse.com>
References: <1585844328-30654-1-git-send-email-igor.druzhinin@citrix.com>
 <66ee36a9-b525-50d4-17e8-8a10f6afd55f@suse.com>
 <0faaee38-e314-24a8-b97d-9f000251a63e@citrix.com>
 <9cba6eda-2c7c-9700-a484-c72100b8268f@citrix.com>
 <050e4847-df42-6e16-3707-19fadbae9229@suse.com>
 <c4b676a9-58ce-ae11-e13b-aae41b6c27b1@citrix.com>
 <24e20e5d-c661-3f40-ceb0-e0c6f0a753b2@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <7827d387-90be-a538-a41c-af104a7b2dd3@citrix.com>
Date: Fri, 3 Apr 2020 16:36:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <24e20e5d-c661-3f40-ceb0-e0c6f0a753b2@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, roger.pau@citrix.com,
 ian.jackson@eu.citrix.com, wl@xen.org, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03/04/2020 16:28, Jan Beulich wrote:
> On 03.04.2020 17:17, Igor Druzhinin wrote:
>> On 03/04/2020 16:05, Jan Beulich wrote:
>>> On 03.04.2020 16:47, Igor Druzhinin wrote:
>>>> There multiple technical complications that caused this mess.
>>>> One of them is that there is no unfortunately a better place for the
>>>> framebuffer to be located initially. Second, SR-IOV device
>>>> is real and adding a virtual BAR to it is also complicated (due to
>>>> compatibility reasons) and NVIDIA decided to avoid that.
>>>
>>> In which case I wonder - aren't you ending up with the MMIO case
>>> that I had mentioned, and that you said is difficult to deal with?
>>
>> No, it's VRAM area (normal RAM pages) - not MMIO.
> 
> Well, VRAM is still MMIO from the CPU's perspective, just without
> any side effects. But if it was another device that was passed
> through, couldn't its MMIO similarly end up in that area?

As Andrew said, Xen VRAM is just normal RAM. It's originally
populated in this area for the lack of a better place (at least now).
It's special and has nothing to do with the device passed through
using conventional PCI mechanisms which BARs will only occupy MMIO hole.

Igor

