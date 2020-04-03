Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F95919D9F4
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 17:18:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKO4y-0001Rq-I0; Fri, 03 Apr 2020 15:17:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WUFr=5T=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jKO4x-0001Rl-E1
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 15:17:55 +0000
X-Inumbo-ID: 4a7a230c-75be-11ea-bd34-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a7a230c-75be-11ea-bd34-12813bfff9fa;
 Fri, 03 Apr 2020 15:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585927074;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=83j+5Tkowfz8HhhnuYl4Rh0uuDc1nomq8rA+k3VBjCo=;
 b=IK8kQCejkyTLZHjv/FQYZNwQmtgMRuPnX5DLQjHGFprANl6ZksHpbKn2
 MPOCvkygHXNAsxJUKVf5GgtOcImZ3dE2/8fPopb7o6tK1An4EuLjnizAP
 1VK4rS0pgporIv2iwfmsXzQg0cK8JUqnNupG7a0jpz/h7TDU4ahTpkQBl I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: R5j06J1v92J03FOsqkSnNpwx/FtPkGratEXQ+ypJHqmsunTDrFmgn3c/B7iYDDfy31FWfjgKgk
 WSBq66H5hNzBnWg1e+YwDm2hVWWRKkgKJeLWPM73aukeBB2lZXvlOA3tnj9S4fTxwcXOYYHJWe
 9jyHhdWIX13zqZBnBT1253SfSXEcC/quGcHosxxhVSCciCOSZKgZ9SxnKusDJRpkwqt51VfN7i
 GrKqoJwClGou/BIIU5F2R8sy71HKidGk1glm2ZcARzWEDSdAaeN5M38AFfcdhzNmBCNFWbg51H
 2rE=
X-SBRS: 2.7
X-MesageID: 15803287
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,340,1580792400"; d="scan'208";a="15803287"
Subject: Re: [PATCH] hvmloader: probe memory below 4G before allocation for
 OVMF
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <1585844328-30654-1-git-send-email-igor.druzhinin@citrix.com>
 <66ee36a9-b525-50d4-17e8-8a10f6afd55f@suse.com>
 <0faaee38-e314-24a8-b97d-9f000251a63e@citrix.com>
 <9cba6eda-2c7c-9700-a484-c72100b8268f@citrix.com>
 <050e4847-df42-6e16-3707-19fadbae9229@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <c4b676a9-58ce-ae11-e13b-aae41b6c27b1@citrix.com>
Date: Fri, 3 Apr 2020 16:17:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <050e4847-df42-6e16-3707-19fadbae9229@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com, wl@xen.org,
 roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03/04/2020 16:05, Jan Beulich wrote:
> On 03.04.2020 16:47, Igor Druzhinin wrote:
>> On 03/04/2020 15:39, Andrew Cooper wrote:
>>> On 03/04/2020 14:53, Jan Beulich wrote:
>>>> On 02.04.2020 18:18, Igor Druzhinin wrote:
>>>>> The area just below 4G where OVMF image is originally relocated is not
>>>>> necessarily a hole - it might contain pages preallocated by device model
>>>>> or the toolstack. By unconditionally populating on top of this memory
>>>>> the original pages are getting lost while still potentially foreign mapped
>>>>> in Dom0.
>>>> When there are pre-allocated pages - have they been orphaned? If
>>>> so, shouldn't whoever populated them unpopulate rather than
>>>> orphaning them? Or if not - how is the re-use you do safe?
>>>
>>> So this is a mess.
>>>
>>> OVMF is linked to run at a fixed address suitable for native hardware,
>>> which is in the SPI ROM immediately below the 4G boundary (this is
>>> correct).  We also put the framebuffer there (this is not correct).
>>>
>>> This was fine for RomBIOS which is located under the 1M boundary.
>>>
>>> It is also fine for a fully-emulated VGA device in Qemu, because the the
>>> framebuffer if moved (re-set up actually) when the virtual BAR is moved,
>>> but with a real GPU (SR-IOV in this case), there is no logic to play games.
> 
> So are you saying OVMF starts out appearing to run in VRAM then
> in the OVMF case, until the frame buffer gets moved? If so,
> with the logic added by this patch, how would both places end
> (old VRAM address, where OVMF lives, and new VRAM address) get
> backed by distinct pages? Wouldn't the avoided re-populate
> result in the same page having two uses? Or alternatively there
> being a hole in OVMF space, which would be a problem if this
> was backing runtime memory? 

In normal case (not SR-IOV) VRAM gets evacuated (by PCI logic) before
hvmloader overwrites it. So the issue is avoided. But for SR-IOV VRAM
stays so VRAM area is temporary used to hold OVMF image - until decompression
is complete. With this patch VRAM pages would be used for that purpose
instead new ones.

>>> The problem is entirely caused by the framebuffer in Xen not being like
>>> any real system.  The framebuffer isn't actually in a BAR, and also
>>> doesn't manifest itself in the way that graphics-stolen-ram normally
>>> does, either.
>>
>> Adding to what Andrew said:
>>
>> There multiple technical complications that caused this mess.
>> One of them is that there is no unfortunately a better place for the
>> framebuffer to be located initially. Second, SR-IOV device
>> is real and adding a virtual BAR to it is also complicated (due to
>> compatibility reasons) and NVIDIA decided to avoid that.
> 
> In which case I wonder - aren't you ending up with the MMIO case
> that I had mentioned, and that you said is difficult to deal with?

No, it's VRAM area (normal RAM pages) - not MMIO.

Igor

