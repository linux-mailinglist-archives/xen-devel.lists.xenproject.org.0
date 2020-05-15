Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E52BE1D5505
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 17:47:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZcWy-0002zY-DX; Fri, 15 May 2020 15:45:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kC4v=65=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jZcWw-0002zT-UK
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 15:45:46 +0000
X-Inumbo-ID: 23de8154-96c3-11ea-b07b-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23de8154-96c3-11ea-b07b-bc764e2007e4;
 Fri, 15 May 2020 15:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589557545;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=UtDV0Wc1d/DrVU2id3rwOqamk7RLP5bareP4MzNV1nc=;
 b=R35Z+D6iQZnaKEzrQwAAXeYYJxzCLPCtZVjjjh/7ji6KBoizg48Ox07n
 g0BfbZ/735RYLzPMzq1qOnfLSk3025gvlVUsLxlN0G4O9GwC4EyQikq7a
 H47xdgOn7Kpv8dDA9kSjuI/+RdciW4cp9t1hQto/xwuzWsCfKAx0pofBB 0=;
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
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: gCPOMydmHXfCjDbQ7f1je/Yx+NmydMK+205b1jM2YfbC70J/9Mf8Dn3QgPXJigWiC7ZmRyHfyv
 EiLL6e/HESuzk9RSHDRC7ssgrMd8Mka81q4BbIzfr7zrr2vBcPzpREL4GBgtyOuxo0UJdWcKpL
 Yelq5yDCEy/rHBi9rdwTfm/9AmnSjoySKQF5ITmnQp5lvmC98xPRxsHrasOVaTbQXXBSd+W5X4
 hssCxhitAruOSV7cvwie5zN1oYyDSbHZhfa17UBDDsF4aYp7SRy+zffVYTGu/BWxLO4shLquxc
 HZE=
X-SBRS: 2.7
X-MesageID: 18006277
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,395,1583211600"; d="scan'208";a="18006277"
Subject: Re: [PATCH v2 5/6] x86/mem-paging: move code to its dedicated source
 file
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <b8437b1f-af58-70df-91d2-bd875912e57b@suse.com>
 <b9b189b1-9484-4501-6085-adf86e73f262@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5ffd9c4e-fbb2-239d-1cdf-c72fcb0ef8ac@citrix.com>
Date: Fri, 15 May 2020 16:45:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b9b189b1-9484-4501-6085-adf86e73f262@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23/04/2020 09:39, Jan Beulich wrote:
> Do a little bit of style adjustment along the way, and drop the
> "p2m_mem_paging_" prefixes from the now static functions.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

