Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1DC1A9C3F
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 13:28:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOgD3-0000FA-Te; Wed, 15 Apr 2020 11:28:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=c95o=57=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jOgD1-0000F5-HY
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 11:27:59 +0000
X-Inumbo-ID: 28515b40-7f0c-11ea-9e09-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28515b40-7f0c-11ea-9e09-bc764e2007e4;
 Wed, 15 Apr 2020 11:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586950079;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=CIUTEn/Yeb9Hvgke6D2MSVCzCSUf9bwdmiJQpMGumlc=;
 b=FzlAYBz2X/f6gpHbgvgaTBwBoZBQBbEwDOPGe/C91Jt9ncaZKT0YLfiV
 5u11zE6WHpYy0mW52LfQcDrGLSX3mVFRZsynn3GwouasNDGJ/JLeEBvXv
 +hL26gxNqEhFnWOyj6paF834LUlPDm4NHHpRajWcs/hC5zK1vKglZtGH1 A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
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
IronPort-SDR: 0SI/xKFLtmGLJ7Li0CWH4uAESkufqJmMq31Bf5mbRhrgDHyhJqbccm+GqU6Wf4t08T/7uYcca1
 nXhU7DSDb1507I03ZxWgNoRRmuoh/aapJDcyAld0fbTJ68xpnCwbxXdklj0+eaznViozbFDDRP
 t5lQaswwVGnFCfx6YirPb4wQ6xLr7kv++KqCGqTLWLN4gTisK3se8qwOtCTmZYKlJnNakelUrE
 vX4VMIL9kWLBKBdDNgqzJl1fQluw3quZE1y8VIULbDnjHTvsiQaJjOuMwITDSi6WHFV5nqzIz5
 2tM=
X-SBRS: 2.7
X-MesageID: 15720227
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,386,1580792400"; d="scan'208";a="15720227"
Subject: Re: [PATCH 02/12] xen/arm: introduce arch_xen_dom_flags and direct_map
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-2-sstabellini@kernel.org>
 <4130f640-a664-a9e7-fcd7-85bbd58287e4@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2c6c6600-bf58-9833-deac-111a59c16239@citrix.com>
Date: Wed, 15 Apr 2020 12:27:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4130f640-a664-a9e7-fcd7-85bbd58287e4@suse.com>
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
Cc: julien@xen.org, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15/04/2020 11:27, Jan Beulich wrote:
> On 15.04.2020 03:02, Stefano Stabellini wrote:
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -682,6 +682,7 @@ int arch_domain_create(struct domain *d,
>>          return 0;
>>  
>>      ASSERT(config != NULL);
>> +    d->arch.direct_map = flags != NULL ? flags->arch.is_direct_map : false;
> Shouldn't "true" here imply ->disable_migrate also getting
> set to true? Or is this already the case anyway for domains
> created right at boot?

Please don't introduce any more uses for disable_migrate.  It is
fundamentally broken and won't survive to 4.14 (assuming that the 30 odd
patches of prereq fixes on xen-devel start unblocking themselves in time)

~Andrew

