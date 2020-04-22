Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 913B21B44A0
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 14:20:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jREMV-0005tq-HH; Wed, 22 Apr 2020 12:20:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yehR=6G=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jREMT-0005tg-UZ
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 12:20:18 +0000
X-Inumbo-ID: 9f34712a-8493-11ea-926b-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9f34712a-8493-11ea-926b-12813bfff9fa;
 Wed, 22 Apr 2020 12:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587558015;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=uybLuVdkqaTFdLBCFX6aVDoWpAdWDrb62FwYzc00iR8=;
 b=dpj0Jpjrk9unop8RUl90n48HQc8sCvBMjxL4EXHEEqrqDZfhclD7rRSi
 DkZLymXyBhdtnCS5MMVfvk8Hn46yf65Xjhqxj/ns9EeULn2fgWSXTso6x
 b5gTxGfxM0iX+3mdiKbn+Y8W7Af+/JMfuKkHK3/P1qg94PYuZkaUyKSYh 0=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: IHRhp7IM1jZirlKm2mYv1r6iQd0LFBKt7B5KpGdpNWZtPb8z0hH5jYsAwEnEuZ1UuSK0e6YzPc
 V6HkO57CahywqKTXqxpBGGhY41KXvLJy5sSC4BRymasx8j+DksX5xG/MiBWVPtrNfJXZfJrEXv
 Se9NJGb5f5rh18kWGae/58aP2FCin0GO1KQnvS8xrMtFYQyRnpvyjJErWHUykeS0EJWaKcP/Q+
 6Cxf7WBI7CjEG1UKA4KX6lLnszkC8Fmgp9jcb2MCZwBa3aJCh6F492xL6lUlQpvnO2vanOSlQ/
 b7U=
X-SBRS: 2.7
X-MesageID: 16461383
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,414,1580792400"; d="scan'208";a="16461383"
Subject: Re: [PATCH 01/10] x86/mm: no-one passes a NULL domain to
 init_xen_l4_slots()
To: Jan Beulich <jbeulich@suse.com>
References: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
 <19d7ad4f-c653-b7b6-59a8-90c9700c9200@suse.com>
 <68542638-b5d5-3261-8088-d0cd6e2dcd74@citrix.com>
 <757e4a8b-f60d-1c5c-fe11-b1d22980f09e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9432cd11-3d40-76b7-b033-08aab274172a@citrix.com>
Date: Wed, 22 Apr 2020 13:20:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <757e4a8b-f60d-1c5c-fe11-b1d22980f09e@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Tim
 Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20/04/2020 06:48, Jan Beulich wrote:
> On 17.04.2020 21:46, Andrew Cooper wrote:
>> On 17/04/2020 15:25, Jan Beulich wrote:
>>> Drop the NULL checks - they've been introduced by commit 8d7b633ada
>>> ("x86/mm: Consolidate all Xen L4 slot writing into
>>> init_xen_l4_slots()") for no apparent reason.
>> :) I'll take this as conformation that all my sudden pagetable work in
>> Xen manage ended up being rather more subtle than Linux's equivalent
>> work for KPTI.
>>
>> https://lists.xenproject.org/archives/html/xen-devel/2018-01/msg00281.html
>>
>> Specifically, this was part of trying to arrange for fully per-pcpu
>> private mappings, and was used to construct the pagetables for the idle
>> vcpu which specifically don't have a perdomain mapping.
>>
>> Seeing as this is still an outstanding task in the secret-free-Xen
>> plans, any dropping of it now will have to be undone at some point in
>> the future.
> s/will/may/ I suppose - we don't know for sure how this will look
> like at this point.

Will.

The only reason we don't need it right now is because idle_pg_table[]
gets constructed at boot time.  As soon as we're creating one (or more)
per pcpu, we need a way of writing an L4 without a perdomain mapping.

~Andrew

