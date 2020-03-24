Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D7A190D6B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 13:31:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGig2-0005Ut-2f; Tue, 24 Mar 2020 12:29:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wMh6=5J=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jGig0-0005Un-4j
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 12:29:00 +0000
X-Inumbo-ID: 094bd45c-6dcb-11ea-b34e-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 094bd45c-6dcb-11ea-b34e-bc764e2007e4;
 Tue, 24 Mar 2020 12:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585052940;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=0hhviVis8Vs1CZkKJvALYjvaHgWDYYYWqr0Bm99YQBE=;
 b=gjALyc4kwhGf1j+1X9IkiQojS+Gm8UL/ARYzYlotozIIVC9d1uGSRGwg
 82HPoWUhynhGgKIbpe1/uOiSGLsqWMU2A2xexlI/fFzr/9KehpYaamWH5
 QaD+b5+2XsvJ1yMMnQ/s0n8rC35UNBJSnRm4rSJYls7qNAQb4q/3fxrft s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6acaKA3lrj16G+Z0iqJo8y7+mWRRVMjiU+HPzruVb9ABu3bgS7NW2rU/ARXOaxW+84jgzrqXC0
 /pG0EtkYJ/qdjmIQHN0BzH9JcD92eYFP+WY8TIIytqDLCBGvgqm2pcxMXC2lWKbsjaKuDnLXAG
 8qPc6I2qAj75/wEBQSWfIw/VwUnrs+pqZmLffIhT/ic2fr3Oahk4Yj8PyaL0s9aRvgcaol/hsc
 Tg5nNvi0S16q3/tlsi/XxKYErrG8EpQ/rdH3iLHjiqm1Am7gzMqgmuePpBCr98Y+s1v3r/Ur28
 9MU=
X-SBRS: 2.7
X-MesageID: 14742814
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,300,1580792400"; d="scan'208";a="14742814"
To: Pu Wen <puwen@hygon.cn>, <xen-devel@lists.xenproject.org>
References: <20200324103726.3406-1-puwen@hygon.cn>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f82b6a33-6af6-8c9d-2876-b518167eb832@citrix.com>
Date: Tue, 24 Mar 2020 12:28:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200324103726.3406-1-puwen@hygon.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2] SVM: Add union intstat_t for offset 68h
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

On 24/03/2020 10:37, Pu Wen wrote:
> According to chapter "Appendix B Layout of VMCB" in the new version
> (v3.32) AMD64 APM[1], bit 1 of the VMCB offset 68h is defined as
> GUEST_INTERRUPT_MASK.
>
> In current xen codes, it use whole u64 interrupt_shadow to setup
> interrupt shadow, which will misuse other bit in VMCB offset 68h
> as part of interrupt_shadow.
>
> Add union intstat_t for VMCB offset 68h and fix codes to only use
> bit 0 as intr_shadow according to the new APM description.
>
> Reference:
> [1] https://www.amd.com/system/files/TechDocs/24593.pdf
>
> Signed-off-by: Pu Wen <puwen@hygon.cn>

Hmm - this field doesn't appear to be part of AVIC, which makes me
wonder what we're doing without it.

It appears to be a shadow copy of EFLAGS.IF which is only written on
vmexit, and never consumed, but this is based on Appendix B which is the
only reference I can find to the field at all.  Neither the
VMRUN/#VMEXIT descriptions discuss it at all.

Given its position next to the (ambiguous) INTERRUPT_SHADOW, it just
might actually distinguish the STI shadow from the MovSS shadow, but it
could only do that by not behaving as described, and being asymmetric
with EFLAGS.  I don't have time to investigate this right now.

We need the field described in Xen to set it appropriately for virtual
vmexit, but I think that is the extent of what we need to do.

~Andrew

