Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3F01BDE9F
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 15:39:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTmvp-0001Oc-Ch; Wed, 29 Apr 2020 13:39:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xGEm=6N=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jTmvn-0001OW-58
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 13:39:19 +0000
X-Inumbo-ID: d2d2f764-8a1e-11ea-9887-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2d2f764-8a1e-11ea-9887-bc764e2007e4;
 Wed, 29 Apr 2020 13:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588167559;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=HDoCv6n49nZoScnJXmlMsM86nR5HqteBVwOZytz3nyk=;
 b=CAgTiHmJ5xr7l4EoBUT5NasxY7Jdj28jDfnKzgFp0EBMRoRK21yXrmGN
 lbsS318d2bt3XSdypLwHquVseqNkGvIw7IaKAacepKtnpjEW9NO+T9lMn
 57gptL2AS/v52U6I9J0ZkETbtsBs4T9CDw+nFIdLeH8eRd+VgVJQMnzR6 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0KZS6gNMFOfEp4CssVpwJOh2eDAU5TMsa16gsX8xhd/pGxFj8JOBznKozmftpIzkhEWeDf5kYC
 qiYU7H/awF4/16wA6/sH/DChT9uPnuRn/7HBE8Jh4EH6p7hWeiNTFDDi43RqyzIbBI1offV4fE
 BXWa6RPWjBZSdFqGaQypoitgx5PIVSmLeFR7ml/HPKLbHhktjoMaTGY1BtBRca50r78b0nCtvk
 y3ZSN6bRBBWoWb9GRrT6SuQOvAaGeEB/3P23c/HqZHKOVOzcYgKfJKPSE7KwMAUtBhg8lv1zRQ
 /pY=
X-SBRS: 2.7
X-MesageID: 16454740
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,332,1583211600"; d="scan'208";a="16454740"
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
 <a23c3d72-f5c8-5c3f-2c2f-5a9ca1065d1f@citrix.com>
 <0f553a2e-9541-8d47-c354-0e8273b4b783@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <eb16ae71-a4d9-354b-a96d-a0e496609b12@citrix.com>
Date: Wed, 29 Apr 2020 14:39:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0f553a2e-9541-8d47-c354-0e8273b4b783@suse.com>
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

On 29/04/2020 14:06, Jürgen Groß wrote:
> On 29.04.20 14:49, Igor Druzhinin wrote:
>> On 29/04/2020 13:29, Jürgen Groß wrote:
>>> On 29.04.20 13:04, Igor Druzhinin wrote:
>>
>> Yes, XAPI is doing soft reset differently from libxl. You need to keep xenstore
>> data to at least keep backends working without the need to reinitialize them
>> before entering kdump kernel. We do the same thing while entering crash kernel
>> in Windows after BSOD (CC Paul as he recommended this approach).
>> There are other reasons to not reset xenstore data.
>>
>> I considered XS_INTRODUCE functionality to be part of xenstored ABI and we built
>> a lot of infrastructure on top of that. So I don't think it could be easily removed now.
> 
> Nobody wants to remove XS_INTRODUCE. It was just questioned there is a
> need to call XS_INTRODUCE multiple times for a domain without a call of
> XS_RELEASE in between.

Sorry, I didn't mean the whole XS_INTRODUCE but that particular bit that
allows it to rebind the channels without calling XS_RELEASE first as the
latter has a lot of implications from toolstack point of view.

> In case there is such a need this means we either should just drop the
> test for the mfn to match and recreate the event-channel (which will do
> no harm IMO), or we need to keep the mfn in the live-update state record
> with the knowledge that it is far from being a good indicator for the
> test whether a domain is known already or not (two HVM domains using a
> similar configuration with the very same kernel will use the same gfn
> probably).
> 
> As only dom0 is allowed to use XS_INTRODUCE and I'm not aware of any
> problems with neither XS_INTRODUCE failing due to illegal calls (no mfn
> match), nor with potentially recreating the event channel for a "wrong"
> domain, I suggest to just allow XS_INTRODUCE to be called as often as
> the toolstack wants to.

If that means keeping the current semantics of XS_INTRODUCE - I'd be quite
happy with that.

Igor

