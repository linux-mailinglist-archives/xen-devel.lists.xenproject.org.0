Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C9A192ADD
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 15:13:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH6jv-0006mn-1T; Wed, 25 Mar 2020 14:10:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K3jc=5K=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jH6jt-0006mh-Mt
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 14:10:37 +0000
X-Inumbo-ID: 661591fa-6ea2-11ea-8622-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 661591fa-6ea2-11ea-8622-12813bfff9fa;
 Wed, 25 Mar 2020 14:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585145436;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=oJHuPy8YVX64cOHCh4EvAjVSh9fcgSV/J0qLjsaiK+k=;
 b=gWZZejRZmFeE8az9HNPxIgcjD8slO396WQlAiK0Gyq/UJ0arKMqLg6vJ
 7ulIqzfKYZK2ko/ifn0eM5t3jwPxkYrVxCoyP1Mw2LiDIPepEDTanxMsq
 vxCANEjyvroeNKLDjTIProF1CaGywTNJGieV83FRVYSCN0e/AxLMY2VCj g=;
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
IronPort-SDR: AAIMhAywX70+KuBnHYisvwDl55qusvRv+BDp9BVibQ/XEtYPuUA+0GoAdaf72a36xUKPU034By
 pw181QqDjb1E786agv8yBQDUqeCEQHVygfKMys9+A86aELX21tw9AlAYMVUaROHUtYqDHY0JwD
 2kdYTtvi4ZacfwtJdjcoCwzCmnW92gzyIGxOR8EFfui/OlI4svZypjhEm4udBWMaLGfV5crZSX
 9Xz1a5M5t30c2J6Z+/K8MP7b8oIwM2lsvKGn2ICGWb6y9s31Dl28ZFZwu3NE89qh/ZLPAeF8ul
 1KU=
X-SBRS: 2.7
X-MesageID: 15265052
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,304,1580792400"; d="scan'208";a="15265052"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <cfeb8fcf-3ba6-674c-17a9-93be9e746930@suse.com>
 <5fbb2e32-ad0f-af25-35de-720baff3351e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ab2f7a1c-9d42-db0a-fcc0-e8426f73046d@citrix.com>
Date: Wed, 25 Mar 2020 14:10:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <5fbb2e32-ad0f-af25-35de-720baff3351e@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 3/7] x86emul: vendor specific direct branch
 behavior in 64-bit mode
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24/03/2020 16:27, Jan Beulich wrote:
> Intel CPUs ignore operand size overrides here, while AMD ones don't.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

