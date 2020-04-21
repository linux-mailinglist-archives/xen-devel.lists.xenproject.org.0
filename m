Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DD11B2E5A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 19:31:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQwj6-0005rU-3t; Tue, 21 Apr 2020 17:30:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zbep=6F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jQwj5-0005rP-55
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 17:30:27 +0000
X-Inumbo-ID: c8fe2833-83f5-11ea-9175-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8fe2833-83f5-11ea-9175-12813bfff9fa;
 Tue, 21 Apr 2020 17:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587490225;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rTyg5GkSCEnmbYmkqxtD0tdi7bqwJ71vNPKBP0QsvuU=;
 b=To55zwlN2IL4hRMtuFInAXNt8DaRvDvkhDxixVzY0jEBbDEAzIqvU7wJ
 ZneYpSrEqMcDqQA7rRY0u0hyzJDfBIJGUk5RFFkVkXWfNBSm3GlwI1iLT
 yhQkDXSqEMelbPNuhKFZeImEKGdn8C5VjL0c6XbrQ0uco/k9oAbpmWMEZ I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8+wPFDfQSk/Nl84ZXfpS+QeVyRlOobvkreTY7CtgKDs9nFYoFzojVmfRbi8htLxThPATd/gqTz
 e1ubtSBNiiqtOEByK9Qfpss7DfTjZHESjaFnHAVBl+p0zmaEX712KQ09AKR+rgAH1NDKDMLwmY
 bWnP4hcbgPcZ5Xd1R8QdJiSgWs8F4ItMyd129lIfiqqVs+PWGPXBtDVmhioFvA2WpLDk+aYiDg
 10YIGf7JFTP37rfAiaafgL7sFLcQQ5chwYB0uyyMAxt1+FuAJGqLKw85HGB51whdELvDGZftPb
 LGE=
X-SBRS: 2.7
X-MesageID: 16335694
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,411,1580792400"; d="scan'208";a="16335694"
Date: Tue, 21 Apr 2020 19:30:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 4/4] x86: adjustments to guest handle treatment
Message-ID: <20200421173010.GY28601@Air-de-Roger>
References: <9d4b738a-4487-6bfc-3076-597d074c7b47@suse.com>
 <e820e1b9-7a7e-21f3-1ea0-d939de1905dd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <e820e1b9-7a7e-21f3-1ea0-d939de1905dd@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 21, 2020 at 11:13:23AM +0200, Jan Beulich wrote:
> First of all avoid excessive conversions. copy_{from,to}_guest(), for
> example, work fine with all of XEN_GUEST_HANDLE{,_64,_PARAM}().

I'm not sure I understand the difference between those two, as they
are both placeholders for linear guest addresses?

AFAICT XEN_GUEST_HANDLE should be used for guest pointers inside of an
hypercall struct, while XEN_GUEST_HANDLE_PARAM is for guest pointers
as hypercall arguments. But those are both just guest pointers,
whether they are a parameter to the hypercall or a field in a
struct, and hence could use the same type?

I assume there's some reason for not doing so, and I see the comment
about other arches, but again a linear guest address is just that in
all arches, regardless of it's placement.

Sorry, this is likely tangential to your patch.

Thanks, Roger.

