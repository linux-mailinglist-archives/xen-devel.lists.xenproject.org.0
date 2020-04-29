Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 928FE1BD9DA
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 12:40:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTk7e-0007Bl-Go; Wed, 29 Apr 2020 10:39:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xGEm=6N=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jTk7c-0007Bg-K8
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 10:39:20 +0000
X-Inumbo-ID: ae657f6e-8a05-11ea-9927-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae657f6e-8a05-11ea-9927-12813bfff9fa;
 Wed, 29 Apr 2020 10:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588156760;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=9IhIiKA1ZIM0ahmF7IoijqekFzA8jgUXqg5Ly1OOxGo=;
 b=a523cy1Bljz5i09D3HSFLN2iPaVHUlkzjZ4t5IYcRqvgJd9fyOKV4Mub
 oMHYhCvKtVo7IoxR0spk54VPIg2svkRI5ZZy2PonxwK6BoFK1PBz/0A79
 CsFGBcw7Uj1z6RO2+0nkMsBebJeK1omazkm/xBi7HIUmtKSdr67azQsNT A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: UFJ7nNXNPLu2zemBh5egOYyELBvLAEUV3DXPgVhuP5NKATw35u9I8WzDiS+eRQeO94zf4MvsOv
 2vivAQKbH4vwllMpPbqrftC4dSxnsGr+bL201kvgh8MVU0F2LLXe/lwlbiOgT/SM81fJE+AqON
 Xdr69XT58sFzC5+hdQAsLf/X428us4iifNVhW1x00JVXEtVOmcSTBTVvLsXW5Lgfpo6vqKY48t
 0gcm59YHyYLZ5jBfH8KjbytwtVa8v3HyU+yPPVEgSGXhl56WCAWeB5jpkm4MQcQZ2/qaIhcUPP
 Ij0=
X-SBRS: 2.7
X-MesageID: 16681920
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,331,1583211600"; d="scan'208";a="16681920"
Subject: Re: [PATCH] tools/xenstore: don't store domU's mfn of ring page in
 xensotred
To: Julien Grall <julien@xen.org>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, Julien Grall <julien.grall.oss@gmail.com>
References: <20200428155144.8253-1-jgross@suse.com>
 <CAJ=z9a0WfWQs+UJ-t4Kt6PGGdNnA2kMeK5p8bNnDT_eFcpDiiQ@mail.gmail.com>
 <d1c41bd7-676e-c50a-416d-c62efcbdd41d@suse.com>
 <76ed29d6-e2fc-cd48-6de7-e0032daaa2e9@xen.org>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <3fd79cb1-e18f-1987-69ff-94f1bd15c66f@citrix.com>
Date: Wed, 29 Apr 2020 11:39:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <76ed29d6-e2fc-cd48-6de7-e0032daaa2e9@xen.org>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29/04/2020 10:22, Julien Grall wrote:
> Hi Juergen,
> 
> On 29/04/2020 06:51, Jürgen Groß wrote:
>>
>> Recreating the event channel would be fine, but I don't see why it
>> would ever be needed. And XS_INTRODUCE is called only at domain creation
>> time today, so there is obviously no need for repeating this call.
>>
>> Maybe the idea was to do this after sending a XS_RESUME command, which
>> isn't used anywhere in Xen and is another part of Xenstore which doesn't
>> make any sense today.
> 
> Commit f6cc37ea8ac71385b60507c034519f304da75f4c "tools/oxenstored: port XS_INTRODUCE evtchn rebind function from cxenstored" added the exact same behavior in the OCaml XenStored last year.
> 
> This was introduced 12 years after C XenStored, so surely someone think this is useful. We should check why this was introduced in OCaml XenStored (I have CCed the author of the patch).
> 
> If we still think this is not useful, then you should add an explanation in the commit message why the two implementations diverge and possibly update the spec.

Thanks for CC, Julien.

We indeed already use this functionality in our toolstack for guest kdump
functions. It's not possible in XAPI to adopt libxl model where almost everything
is restarted for a domain entering kdump, so we have to use this message to
rebind xenstore evtchn after soft reset without shutting down backends and
recreating the whole subtree (frontends reconnect fine after that).

We obviously only require it for now to be present in oxenstored only.
Please don't remove this functionality if possible.

Igor 

