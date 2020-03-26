Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D06DF19409A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 14:58:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHSzh-0005wD-Ki; Thu, 26 Mar 2020 13:56:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4pkz=5L=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jHSzg-0005w8-8u
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 13:56:24 +0000
X-Inumbo-ID: 93368212-6f69-11ea-87ed-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93368212-6f69-11ea-87ed-12813bfff9fa;
 Thu, 26 Mar 2020 13:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585230982;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=qFVOM5vcVP0USi4x5eWEMJxQCyyy5LJaAeMhBDvvTFc=;
 b=GNHatakX6HCQ793RnVpNZR3RcuyKb+Aw8aS85iDCbKzNWlkUbb4NEH17
 lBwg8Jya9OggorSbkIRs/zCvLoJjjnEqgKJTpKWFpSrQ/aaNQeGR95lzM
 Zllbr4ogHwQKrG8cBWNRh2syfLOQQ/OfOXSboO9I0nvGJyApxOt8Lxmgb 8=;
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
IronPort-SDR: EvzhLEnkdV6HMBdMl5P6IcG56H9pme+HE6B2SEajBE4yXmTyCFaQ192Pz6oKflB39/+cPpnoji
 ley6370s15Tu9lDKIn9fvBvDsgs2VU8vwZbI9gLnq6dqQ3SWzJoWZVC2fg89vrh5ASAg6i0sIS
 PFBJDzwhN6Ni9TUk755oUsTC5LUEyQkb5VGJoYtupYtCmopqhDIaQPgHfMOb7d3gpweMdPZB2g
 Lh+0cOs0y6RUgtWHcLeIPYfisGICZLslknrQQTt59OdwfiKjqfKX2zveX1Upfjy7/hxfsK8zcr
 /wk=
X-SBRS: 2.7
X-MesageID: 15338302
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,308,1580792400"; d="scan'208";a="15338302"
To: Pu Wen <puwen@hygon.cn>, <xen-devel@lists.xenproject.org>
References: <1585230270-24178-1-git-send-email-puwen@hygon.cn>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <92973061-0063-11de-5d5b-eb663de90cce@citrix.com>
Date: Thu, 26 Mar 2020 13:56:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1585230270-24178-1-git-send-email-puwen@hygon.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3] SVM: Add union intstat_t for offset 68h
 in vmcb struct
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26/03/2020 13:44, Pu Wen wrote:
> According to chapter "Appendix B Layout of VMCB" in the new version
> (v3.32) AMD64 APM[1], bit 1 of the VMCB offset 68h is defined as
> GUEST_INTERRUPT_MASK.
>
> In current xen codes, it use whole u64 interrupt_shadow to setup
> interrupt shadow, which will misuse other bit in VMCB offset 68h
> as part of interrupt_shadow, causing svm_get_interrupt_shadow() to
> mistake the guest having interrupts enabled as being in an interrupt
> shadow.  This has been observed to cause SeaBIOS to hang on boot.
>
> Add union intstat_t for VMCB offset 68h and fix codes to only use
> bit 0 as intr_shadow according to the new APM description.
>
> Reference:
> [1] https://www.amd.com/system/files/TechDocs/24593.pdf
>
> Signed-off-by: Pu Wen <puwen@hygon.cn>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Although thinking about it, renaming irq_stat to irq_state would
probably be a good move.  I can fix this on commit - no need to send a v4.

~Andrew

