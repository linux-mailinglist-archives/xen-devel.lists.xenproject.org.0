Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2B8192D97
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 16:58:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH8O9-0007bx-EB; Wed, 25 Mar 2020 15:56:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K3jc=5K=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jH8O8-0007bl-7b
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 15:56:16 +0000
X-Inumbo-ID: 27223192-6eb1-11ea-b34e-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27223192-6eb1-11ea-b34e-bc764e2007e4;
 Wed, 25 Mar 2020 15:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585151775;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=7gEpc5SJsuzvHGvsfzl8Opc1my7bGMNj3aKOho7X0tw=;
 b=Hlmr0YP6fJVC1VvdKAOsSqBWCuUjfh4x1Ii6vbVM8gd6SNouLwotzzDx
 odHAiY7E0z/lhKRsIpot+WNNwWVV4ZDeedBwudhzwRKpahcT3LblIbcIN
 n5cYOnjgsbSja1BDxgvUgZ/OMgUfHrRKjo2iJy7iCgKrPQQb6PCBfd5l1 8=;
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
IronPort-SDR: 4CjKHacXeGmnfn90zDEib5mMXD+JbvNaE6c1JHVnpLhY8mJ1Pqww7Dg1C7F4bZfhEy5NpQh5S4
 +s9nGgHKgpuQKPOQtz7Th+rE8imxnBvtD7kpsYceZLGdPAfe6G581zilELwla3p8/9g3TsnA+a
 wcs29CvbL+bnQLwpRIvswSQE6o/KVf70MT02KXO8X3wLEHWaa3IQeBJIAkUvBkyRS2h/icvduf
 9TQl95jAT/vCoOhn0w0RdIiVqpDSEz9VUKTb1JaRlqvJ8d58RcN2mJ5N74DZg+JOAlC609smuM
 QW4=
X-SBRS: 2.7
X-MesageID: 14832598
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,304,1580792400"; d="scan'208";a="14832598"
To: Pu Wen <puwen@hygon.cn>, <xen-devel@lists.xenproject.org>
References: <20200324103726.3406-1-puwen@hygon.cn>
 <f82b6a33-6af6-8c9d-2876-b518167eb832@citrix.com>
 <ee018b0a-6b92-4e87-1d22-c8839393f800@hygon.cn>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b0200562-dea5-2ba0-a7b2-2663a199c640@citrix.com>
Date: Wed, 25 Mar 2020 15:56:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <ee018b0a-6b92-4e87-1d22-c8839393f800@hygon.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

On 25/03/2020 15:22, Pu Wen wrote:
> On 2020/3/24 20:28, Andrew Cooper wrote:
>> Hmm - this field doesn't appear to be part of AVIC, which makes me
>> wonder what we're doing without it.
>>
>> It appears to be a shadow copy of EFLAGS.IF which is only written on
>> vmexit, and never consumed, but this is based on Appendix B which is the
>> only reference I can find to the field at all.  Neither the
>> VMRUN/#VMEXIT descriptions discuss it at all.
>>
>> Given its position next to the (ambiguous) INTERRUPT_SHADOW, it just
>> might actually distinguish the STI shadow from the MovSS shadow, but it
>> could only do that by not behaving as described, and being asymmetric
>> with EFLAGS.  I don't have time to investigate this right now.
>>
>> We need the field described in Xen to set it appropriately for virtual
>> vmexit, but I think that is the extent of what we need to do.
> We encountered problem while running xen with new firmware which
> implement the bit[1] of the VMCB offset 68h: the DomU stopped when
> running seabios. We debugged the seabios code and found that the
> seabios hung after call16_int10().
>
> Then we debugged the xen code, and found the cause at this place in
> svm_get_interrupt_shadow():
>     if ( vmcb->interrupt_shadow )
>          intr_shadow |= HVM_INTR_SHADOW_MOV_SS | HVM_INTR_SHADOW_STI;
> the conditional is true if bit[1] is 1 even though bit[0] is zero.
> If just only use bit[0] in the conditional, the problem is solved, DomU
> will run successfully.

Oh - now you point this out, the issue is obvious.

The above content would make a far more informative commit message.  How
about extending the middle paragraph with:

"...part of interrupt_shadow, causing svm_get_interrupt_shadow() to
mistake the guest having interrupts enabled as being in an interrupt
shadow.  This has been observed to cause SeaBIOS to hang on boot."

or words to that effect.  The "it definitely breaks a guest" is the most
important piece of information here.

Do you happen to know call16_int10() was doing, exactly?  We've
presumably trapped for emulation to be using svm_get_interrupt_shadow()
in the first place.

~Andrew

