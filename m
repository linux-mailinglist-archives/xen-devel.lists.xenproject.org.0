Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4970019CCF6
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 00:39:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK8Ue-0005VT-2N; Thu, 02 Apr 2020 22:39:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8h32=5S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jK8Ud-0005VL-1K
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 22:39:23 +0000
X-Inumbo-ID: cb5373f2-7532-11ea-bc74-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb5373f2-7532-11ea-bc74-12813bfff9fa;
 Thu, 02 Apr 2020 22:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585867161;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=iyMTL4rPLTuGPL5Z81bP5Pv/1ZmuqkKFyRMrZTCWA/Q=;
 b=QeBMphujy0xiTYgWzc+VGvizTSrCXhyWlonYxBZEY8gAUitvyrwu1FuM
 jgLowJ7Ts27j4g8ID7vSfdZFrvTm/Q3qfLqmPqrr45S1xnZdQsvJEuf+W
 D7U5ABY8VQuo54coWhjGjTYPzWf0ENbvLYHgbBiwf3NqPFgjjlJnepv1k U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RJ0ISx5vEP7UXme5B54Lwkw6plygxLnP70gNWo50TR+xpY/Oy+DZf9WSQ0Yy2XmkZlqmcBoPLj
 jSeUuhmTZTVnIMrIIEMLwN46dEUwQBPAd7phZk8v8TxQqjKBRQ8ER/9eGz4rZSJbeHUVD8c9Kh
 t5D3dIAdiNWcJRFmVzND5EWZCbBa+/46JeLA6gGobKBZgGmNb/hndInCPngZIct5yHn4hsaFUa
 WB619AMXpFKEvGHkqsuzbN7s2CUK1V3EVnlgWWf3e2BgfH5GKWE88sSf2f7okkZ8/57Wd8W15Y
 6jQ=
X-SBRS: 2.7
X-MesageID: 15425264
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,337,1580792400"; d="scan'208";a="15425264"
Subject: Re: [PATCH 2/5] x86/p2m: don't assert that the passed in MFN matches
 for a remove
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <3fbe1d2e-034a-31d7-7207-52ef8b335529@suse.com>
 <da2e71b2-085b-390d-69ba-9edcbbf4fcd2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ab4ef9e3-0504-f7cb-d383-4922ac283339@citrix.com>
Date: Thu, 2 Apr 2020 23:39:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <da2e71b2-085b-390d-69ba-9edcbbf4fcd2@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 01/04/2020 12:39, Jan Beulich wrote:
> guest_physmap_remove_page() gets handed an MFN from the outside, yet
> takes the necessary lock to prevent further changes to the GFN <-> MFN
> mapping itself. While some callers, in particular guest_remove_page()
> (by way of having called get_gfn_query()), hold the GFN lock already,
> various others (most notably perhaps the 2nd instance in
> xenmem_add_to_physmap_one()) don't. While it also is an option to fix
> all the callers, deal with the issue in p2m_remove_page() instead:
> Replace the ASSERT() by a conditional and split the loop into two, such
> that all checking gets done before any modification would occur.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Paul Durrant <paul.durrant@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

