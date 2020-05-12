Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 604441CF7BD
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 16:48:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYWCT-000350-7n; Tue, 12 May 2020 14:48:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sh4E=62=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jYWCS-00034v-Cu
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 14:48:04 +0000
X-Inumbo-ID: 94d13d68-945f-11ea-a2c0-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94d13d68-945f-11ea-a2c0-12813bfff9fa;
 Tue, 12 May 2020 14:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589294884;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=jVjRbiYFDETmm85nMp64hRUUwpS0KFOXOZJIum9tDOM=;
 b=VpRj226SmuSgbbkyc8wkJ0QCH6F0JNfiUsAv7TqionBywCl0ukMglL7t
 f6hJm4M4nT+cOUdiRpPRAUzTkXX2a5ua8YSlA6I6/fQZqerX7rHFJ9bYB
 28Ms0+fgOLCOxyvrCRF/fGCW9w4I6wfHjCCJsRf+tPA4MZDGTVFZZz4JR Q=;
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: x+LMrm/A+JJLmLQzg+ujblcMvjaQmSsyIHvKNhEa5f99tijtFf2LUNrQ51fcwND+MkO3tYrSEo
 u2ZoXs3zsAkxnbeiPO5GhagHiVEF2hlLeJliKo6seBnZghzDHvnWXEHXcDbuLvUwxpb2V73yGk
 hAb90R+ng0ORnk7K9MO1SS4PywzFXgM85++PFGd+6kf5Yltq/3vpvDwnT3z0F4dt2emYDQ4bNU
 bt0xLRQ3g55ZC/kY4TVG35DS3hNlRULCTe667GVEevdasSUhl5GHb6HPTi65wqHNYXGCCSm3As
 u94=
X-SBRS: 2.7
X-MesageID: 17347226
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,384,1583211600"; d="scan'208";a="17347226"
Subject: Re: use of "stat -"
To: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <3bfd6384-fcaf-c74a-e560-a35aafa06a43@suse.com>
 <20200512141947.yqx4gmbvqs4grx5g@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
 <fa507eab-547a-c0fb-9620-825aba5f55b2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4b90b635-84bb-e827-d52e-dfe1ebdb4e4d@citrix.com>
Date: Tue, 12 May 2020 15:47:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <fa507eab-547a-c0fb-9620-825aba5f55b2@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jason
 Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Paul
 Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12/05/2020 15:33, Jan Beulich wrote:
> On 12.05.2020 16:19, Wei Liu wrote:
>> On Tue, May 12, 2020 at 12:58:46PM +0200, Jan Beulich wrote:
>>> now that I've been able to do a little bit of work from the office
>>> again, I've run into a regression from b72682c602b8 "scripts: Use
>>> stat to check lock claim". On one of my older machines I've noticed
>>> guests wouldn't launch anymore, which I've tracked down to the
>>> system having an old stat on it. Yes, the commit says the needed
>>> behavior has been available since 2009, but please let's not forget
>>> that we continue to support building with tool chains from about
>>> 2007.
>>>
>>> Putting in place and using newer tool chain versions without
>>> touching the base distro is pretty straightforward. Replacing the
>>> coreutils package isn't, and there's not even an override available
>>> by which one could point at an alternative one. Hence I think
>>> bumping the minimum required versions of basic tools should be
>>> done even more carefully than bumping required tool chain versions
>>> (which we've not dared to do in years). After having things
>>> successfully working again with a full revert, I'm now going to
>>> experiment with adapting behavior to stat's capabilities. Would
>>> something like that be acceptable (if it works out)?
>> Are you asking for reverting that patch?
> Well, I assume the patch has its merits, even if I don't really
> understand what they are from its description.

What is in any away unclear about the final paragraph in the commit message?

> I'm instead asking
> whether something like the below (meanwhile tested) would be
> acceptable.

Not really, seeing as removing perl was the whole point.

~Andrew

