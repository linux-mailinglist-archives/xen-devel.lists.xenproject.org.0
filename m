Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3551BDCB0
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 14:51:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTmA5-0003kl-BX; Wed, 29 Apr 2020 12:50:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xGEm=6N=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jTmA3-0003kg-Vc
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 12:50:00 +0000
X-Inumbo-ID: eebc625a-8a17-11ea-9940-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eebc625a-8a17-11ea-9940-12813bfff9fa;
 Wed, 29 Apr 2020 12:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588164598;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=3zT7Oma2mWJOk67Ve3hPzUQDxqWMW4fWXMq8ea7erOs=;
 b=aTE7bkZRvVNLCT3t/CQ5bYW98ebOJ8MJ3+mKQWXGr62c2DsvVepKrGN/
 0DM1SUsMpIwXNuTXV485C7l1Spf9/kkl+vyv/8Hk3v4lpOuh9T0nbGqqT
 fO1YaKR2NeKuPqSNI1FzOku/lFVuvzjT6riStBWgqg0xanw60DCUs7W3t o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HmKz6e68QJUTs3S+JTQKPrrkm0JvAt+reZFXgTklAaSLR/Q/Wa51AnAlWh94ClSw8TB0MBC5AO
 qa4aRAaFpR5AZQ5qbe3WpK70mk2UM419NhzaSbVANKjMzLmgBSOSFZWWi3MFYYGabu2i1bd/Fg
 Iq4CSNRR1aQfITYxvvm6vSNi/ZDvBCGs5UNO8gXnCVuSd7MANtzGgxmENjHZ9GLI9zBlZPGrTc
 XQP+7zTTNsy2IsDWGHAjqLLi9e0Q5Y93HiU9Qh54Bh+K2bHDxN9bkRqblvPaz2vpCra2cnsomB
 bMA=
X-SBRS: 2.7
X-MesageID: 16748867
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,332,1583211600"; d="scan'208";a="16748867"
Subject: Re: [PATCH] tools/xenstore: don't store domU's mfn of ring page in
 xensotred
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Julien Grall
 <julien@xen.org>, Julien Grall <julien.grall.oss@gmail.com>
References: <20200428155144.8253-1-jgross@suse.com>
 <CAJ=z9a0WfWQs+UJ-t4Kt6PGGdNnA2kMeK5p8bNnDT_eFcpDiiQ@mail.gmail.com>
 <d1c41bd7-676e-c50a-416d-c62efcbdd41d@suse.com>
 <76ed29d6-e2fc-cd48-6de7-e0032daaa2e9@xen.org>
 <3fd79cb1-e18f-1987-69ff-94f1bd15c66f@citrix.com>
 <3dcbe001-c66c-13a6-7a28-ef24b05eefa0@suse.com>
 <c07e5106-d8de-f6a7-e406-b25ee9ff6d49@citrix.com>
 <f80aff47-8617-8f59-0d34-bf0385128b62@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <a23c3d72-f5c8-5c3f-2c2f-5a9ca1065d1f@citrix.com>
Date: Wed, 29 Apr 2020 13:49:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f80aff47-8617-8f59-0d34-bf0385128b62@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29/04/2020 13:29, Jürgen Groß wrote:
> On 29.04.20 13:04, Igor Druzhinin wrote:
>> On 29/04/2020 11:49, Jürgen Groß wrote:
>>> On 29.04.20 12:39, Igor Druzhinin wrote:
>>>> On 29/04/2020 10:22, Julien Grall wrote:
>>>>> Hi Juergen,
>>>>>
>>>>> On 29/04/2020 06:51, Jürgen Groß wrote:
>>>>>>
>>>>>> Recreating the event channel would be fine, but I don't see why it
>>>>>> would ever be needed. And XS_INTRODUCE is called only at domain creation
>>>>>> time today, so there is obviously no need for repeating this call.
>>>>>>
>>>>>> Maybe the idea was to do this after sending a XS_RESUME command, which
>>>>>> isn't used anywhere in Xen and is another part of Xenstore which doesn't
>>>>>> make any sense today.
>>>>>
>>>>> Commit f6cc37ea8ac71385b60507c034519f304da75f4c "tools/oxenstored: port XS_INTRODUCE evtchn rebind function from cxenstored" added the exact same behavior in the OCaml XenStored last year.
>>>>>
>>>>> This was introduced 12 years after C XenStored, so surely someone think this is useful. We should check why this was introduced in OCaml XenStored (I have CCed the author of the patch).
>>>>>
>>>>> If we still think this is not useful, then you should add an explanation in the commit message why the two implementations diverge and possibly update the spec.
>>>>
>>>> Thanks for CC, Julien.
>>>>
>>>> We indeed already use this functionality in our toolstack for guest kdump
>>>> functions. It's not possible in XAPI to adopt libxl model where almost everything
>>>> is restarted for a domain entering kdump, so we have to use this message to
>>>> rebind xenstore evtchn after soft reset without shutting down backends and
>>>> recreating the whole subtree (frontends reconnect fine after that).
>>>>
>>>> We obviously only require it for now to be present in oxenstored only.
>>>> Please don't remove this functionality if possible.
>>>
>>> If I read handling in libxl correctly, in the soft reset case XS_RELEASE
>>> is issued before doing another XS_INTRODUCE. XS_RELEASE will result in
>>> xenstored throwing away its related struct domain, so XS_INTRODUCE will
>>> be possible again.
>>
>>  From what I remember it was not possible to keep xenstored data for a domain
>> and at the same time perform release-introduce cycle (at least in oxenstored).
>> It also involved firing @releaseDomain which caused havoc in other part of
>> the toolstack.
> 
> Wei, Ian, can you please tell me where I'm wrong?
> 
> A soft reset should restart the domain in a clean state. AFAIK libxl is
> handling that by doing kind of in-place save-restore, including calling
> xs_release_domain() and later xs_introduce_domain(). This should result
> in xenstored throwing away all state it has regarding the domain and
> then restarting with a new (internal) domain instance.
> 
> Is XAPI doing soft reset differently? Why should there be a need for
> keeping xenstored data across a soft reset?

Yes, XAPI is doing soft reset differently from libxl. You need to keep xenstore
data to at least keep backends working without the need to reinitialize them 
before entering kdump kernel. We do the same thing while entering crash kernel
in Windows after BSOD (CC Paul as he recommended this approach).
There are other reasons to not reset xenstore data.

I considered XS_INTRODUCE functionality to be part of xenstored ABI and we built
a lot of infrastructure on top of that. So I don't think it could be easily removed now.

Igor

