Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B83A19D94E
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 16:40:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKNUd-0006KT-Eq; Fri, 03 Apr 2020 14:40:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=okFK=5T=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jKNUc-0006KL-0o
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 14:40:22 +0000
X-Inumbo-ID: 0a29cb72-75b9-11ea-b58d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a29cb72-75b9-11ea-b58d-bc764e2007e4;
 Fri, 03 Apr 2020 14:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585924819;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=08R1lHZV/ONCIf1geiqFMi7ViO+irupyRbwZQRZvMjU=;
 b=Yvf9CRI1dXd/+EguJiY1rZi6zvJlAsgYsz9p1tqZzANAylmXpjpoJfia
 76f2n/iqMLuH3QiQ+mBWcSUib41S7QzZdcyRiVUFOcLVqd3g+dze+ioM6
 ce3vI8RRwV+8D4wuLe8Bc6zsxTOXvqCNhUkYCTbiphpBhkbFrUiBcJkzi E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SpqkEqpsfnoYL7v93Ky/HCU8nUolPrkHzjL1qj3BfvLiPKwMq9mGtIzNMi3+dw8Y1w/1KVNwbi
 gYRluvnuoxFMDywvhjNqGqpHKOWkGPBVn7nMiP4RxBjiCb6pbRh8MQIhgVUnYPjLiGPbcF4ugg
 hRq1/fFJtJTnTmYkEliafchxkCgPvmz3Iusuz327v/wO9fuqxjk7kuPsVZAJs0Y2O27hbweInS
 sv14ypFyFjX6oCr38qx6ORly0r3AhzSEg4HLFjepirPbJzCAUiLcuLCUSx8HfTSVsDpfFUdZ3d
 5r0=
X-SBRS: 2.7
X-MesageID: 15800948
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,340,1580792400"; d="scan'208";a="15800948"
Subject: Re: [PATCH 3/5] x86/p2m: make p2m_remove_page()'s parameters type-safe
To: Jan Beulich <jbeulich@suse.com>
References: <3fbe1d2e-034a-31d7-7207-52ef8b335529@suse.com>
 <858f22e3-0f4f-08f0-ef67-b8ce67146537@suse.com>
 <ae425c2f-0297-4944-5bd5-03ccdab8fdce@citrix.com>
 <d6a1dc4a-f6e6-ae2c-81fd-d918087c8328@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <28990129-054a-84eb-223c-935f1929cb9c@citrix.com>
Date: Fri, 3 Apr 2020 15:40:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <d6a1dc4a-f6e6-ae2c-81fd-d918087c8328@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, George
 Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03/04/2020 10:14, Jan Beulich wrote:
> On 03.04.2020 00:43, Andrew Cooper wrote:
>> On 01/04/2020 12:39, Jan Beulich wrote:
>>> @@ -790,21 +789,23 @@ p2m_remove_page(struct p2m_domain *p2m,
>>>                                            &cur_order, NULL);
>>>  
>>>          if ( p2m_is_valid(t) &&
>>> -             (!mfn_valid(_mfn(mfn)) || mfn + i != mfn_x(mfn_return)) )
>>> +             (!mfn_valid(mfn) || !mfn_eq(mfn_add(mfn, i), mfn_return)) )
>>>              return -EILSEQ;
>>>  
>>> -        i += (1UL << cur_order) - ((gfn_l + i) & ((1UL << cur_order) - 1));
>>> +        i += (1UL << cur_order) -
>>> +             (gfn_x(gfn_add(gfn, i)) & ((1UL << cur_order) - 1));
>> We're gaining an number of expressions starting to look like this, but
>> honestly, "gfn_x(gfn) + i" is equally typesafe, shorter, and easier to
>> read IMO.
> May I, just like you said for patch 3, imply A-b with this adjusted?

Yes.  Sorry - it was late when I was reviewing.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

