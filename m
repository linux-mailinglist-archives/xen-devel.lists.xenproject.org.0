Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9AD19D9D9
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 17:13:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKO0o-0001GO-T4; Fri, 03 Apr 2020 15:13:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=okFK=5T=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jKO0n-0001GH-Vy
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 15:13:38 +0000
X-Inumbo-ID: b106a63c-75bd-11ea-b4f4-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b106a63c-75bd-11ea-b4f4-bc764e2007e4;
 Fri, 03 Apr 2020 15:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585926818;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=2M+SefhsEsAY6CRhSKlMU7ktZYYlZr8Fqsk+v0aaj/A=;
 b=a2NYk4FlEtqWWYSV/dye6NYoh4gZA5YlEJKhwtQ/Hj9K3pYK0UzlCLV8
 Q2MO9GqP+nhSWbbZa5EZI1LnV4kuENq3hEZoYsG459Yd/jC40khR0wDef
 7+rkSb8lYfEBbVigtExl52bU6TzjolAwJylMEJ4W/UmRDc0XPUB5qhR4q 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: mnB3MVdMIWfrZDLUD2rA2g+Qvrr56LUDd4rTYiZ1Atr+MMLVuPpp6BGW+cbfGPNJCmjVFYuVS1
 ZY1Ltdr95g2cJvFhPu7+9l5hiCro0zs9kzulQKlrvOvABQB3zkMAZoYKTbL6l6TegaOYqiRwMF
 IjkFbaPjQLyOo3qF4H2iRwTVsqaEWwDuxCVmU9cs8O2LG1jMpp+YOW9b/A9whjUUvXq5naeps4
 xMCbrgv82xCVo1dWzS5eCyXnBLQrUjhar18N86lx98EYzcD8npLTPqYUwl5rmEZSlgULePVo5k
 db4=
X-SBRS: 2.7
X-MesageID: 15122891
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,340,1580792400"; d="scan'208";a="15122891"
Subject: Re: [PATCH v5 05/10] x86emul: support MOVDIR64B insn
To: Jan Beulich <jbeulich@suse.com>
References: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
 <81e7aade-9dfb-313a-ad81-30b2703c2136@suse.com>
 <0a02ed6b-d7a0-7152-185f-a5bbc5491c49@citrix.com>
 <18ef0337-d6c7-3b60-aa2e-a83930cc0902@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f5d76dfd-61ea-1c1f-66e6-2bb1fc27be5a@citrix.com>
Date: Fri, 3 Apr 2020 16:13:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <18ef0337-d6c7-3b60-aa2e-a83930cc0902@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03/04/2020 08:57, Jan Beulich wrote:
> On 03.04.2020 01:12, Andrew Cooper wrote:
>> On 24/03/2020 12:34, Jan Beulich wrote:
>>> Introduce a new blk() hook, paralleling the rmw() on in certain way, but
>>> being intended for larger data sizes, and hence its HVM intermediate
>>> handling function doesn't fall back to splitting the operation if the
>>> requested virtual address can't be mapped.
>>>
>>> Note that SDM revision 071 doesn't specify exception behavior for
>>> ModRM.mod == 0b11; assuming #UD here.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Thanks much, but I'm puzzled by you providing this, and hence
> would like to double check: You specifically asked that I take
> care of the cachability issue for MOVDIRI before you would ack
> that change. How come you're not similarly concerned here?

This executes the MOVDIR64B instruction directly, so those properties
are taken care of.  (I think?)

The MOVDIRI support just does a memcpy().

~Andrew

