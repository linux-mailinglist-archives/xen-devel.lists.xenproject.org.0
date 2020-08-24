Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E95F24FE02
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 14:47:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kABsN-0006MJ-IH; Mon, 24 Aug 2020 12:47:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/Qh=CC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kABsM-0006ME-Lq
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 12:47:02 +0000
X-Inumbo-ID: cea11c50-2a34-424b-9c13-79fd24c4689f
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cea11c50-2a34-424b-9c13-79fd24c4689f;
 Mon, 24 Aug 2020 12:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598273220;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=cKRdsfy7yHmQ0JS5ok6pDUpqnIuXpGy1PLgjBqD/X9I=;
 b=evcZi1ULKYmxqlSfV+938Jbs1U3VWpecPwWpj7uxTjB14tcnah+YBM3N
 wHJsWkVV2bZjvjCmmg2nuONm2sPQOR+aMztwOl0/6PwNUvBwruGjBSTF1
 OvA2fQUCg5TIDCvWKarSL2ufCDbq5aTwdJJGftxbkjdT+m8aAfLuah54a U=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: g+v8PChjXuP4ExzN3jXEjdSIWWHB1zmEBHCiHXvewBlxwAsDHf3ubK2mxQaTS6+sy/rZisy8pX
 cdy63qkWveZ1xHObewF70JLWJbCjZyLvi07yfxo321mbOg1SIcM82wPcCe6+cG0cvg5Ufn1/NQ
 rL3btlOVSYnRXCqK144ysCZQgj61dLsB0mmHw2RKA5sOAgwZld4fMuucd2hAcNEggEXixiOzq/
 XS0eMIDP8Y0Ok/lFUu173yufKQDvAGjCk6O/7IbdBB3Nq5VI5VAeaFQeRiPtqzHwX3AuVlZpv/
 2Iw=
X-SBRS: 2.7
X-MesageID: 26079760
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,348,1592884800"; d="scan'208";a="26079760"
Subject: Re: [PATCH v2 4/5] x86/PV: also check kernel endianness when building
 Dom0
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <5d456607-b36b-9802-1021-2e6d01d7f158@suse.com>
 <b3d55826-a4f2-dc87-e573-8e7215db29de@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <870307f6-5fff-528e-a71a-b10ebcf3c35f@citrix.com>
Date: Mon, 24 Aug 2020 13:46:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b3d55826-a4f2-dc87-e573-8e7215db29de@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24/08/2020 13:35, Jan Beulich wrote:
> While big endian x86 images are pretty unlikely to appear, merely
> logging endianness isn't of much use.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

