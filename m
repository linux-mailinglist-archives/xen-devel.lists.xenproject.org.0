Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF68192D59
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 16:50:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH8Ei-0006Kx-11; Wed, 25 Mar 2020 15:46:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QfP3=5K=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1jH8Ef-0006Ks-Ur
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 15:46:29 +0000
X-Inumbo-ID: c6c83220-6eaf-11ea-864b-12813bfff9fa
Received: from spam1.hygon.cn (unknown [110.188.70.11])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c6c83220-6eaf-11ea-864b-12813bfff9fa;
 Wed, 25 Mar 2020 15:46:25 +0000 (UTC)
Received: from MK-DB.hygon.cn ([172.23.18.60])
 by spam1.hygon.cn with ESMTP id 02PFjNXI017547;
 Wed, 25 Mar 2020 23:45:23 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from cncheex01.Hygon.cn ([172.23.18.10])
 by MK-DB.hygon.cn with ESMTP id 02PFjB1v047376;
 Wed, 25 Mar 2020 23:45:16 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from [192.168.1.193] (172.23.18.44) by cncheex01.Hygon.cn
 (172.23.18.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Wed, 25 Mar
 2020 23:44:52 +0800
To: Andrew Cooper <andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20200324103726.3406-1-puwen@hygon.cn>
 <f82b6a33-6af6-8c9d-2876-b518167eb832@citrix.com>
From: Pu Wen <puwen@hygon.cn>
Message-ID: <ee018b0a-6b92-4e87-1d22-c8839393f800@hygon.cn>
Date: Wed, 25 Mar 2020 23:22:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f82b6a33-6af6-8c9d-2876-b518167eb832@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.23.18.44]
X-ClientProxiedBy: cncheex01.Hygon.cn (172.23.18.10) To cncheex01.Hygon.cn
 (172.23.18.10)
X-MAIL: spam1.hygon.cn 02PFjNXI017547
X-DNSRBL: 
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

On 2020/3/24 20:28, Andrew Cooper wrote:
> Hmm - this field doesn't appear to be part of AVIC, which makes me
> wonder what we're doing without it.
> 
> It appears to be a shadow copy of EFLAGS.IF which is only written on
> vmexit, and never consumed, but this is based on Appendix B which is the
> only reference I can find to the field at all.  Neither the
> VMRUN/#VMEXIT descriptions discuss it at all.
> 
> Given its position next to the (ambiguous) INTERRUPT_SHADOW, it just
> might actually distinguish the STI shadow from the MovSS shadow, but it
> could only do that by not behaving as described, and being asymmetric
> with EFLAGS.  I don't have time to investigate this right now.
> 
> We need the field described in Xen to set it appropriately for virtual
> vmexit, but I think that is the extent of what we need to do.

We encountered problem while running xen with new firmware which
implement the bit[1] of the VMCB offset 68h: the DomU stopped when
running seabios. We debugged the seabios code and found that the
seabios hung after call16_int10().

Then we debugged the xen code, and found the cause at this place in
svm_get_interrupt_shadow():
    if ( vmcb->interrupt_shadow )
         intr_shadow |= HVM_INTR_SHADOW_MOV_SS | HVM_INTR_SHADOW_STI;
the conditional is true if bit[1] is 1 even though bit[0] is zero.
If just only use bit[0] in the conditional, the problem is solved, DomU
will run successfully.

-- 
Regards,
Pu Wen

