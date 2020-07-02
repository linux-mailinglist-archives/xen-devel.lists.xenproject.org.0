Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A208C212FFA
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 01:24:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jr8Yx-0005nb-2X; Thu, 02 Jul 2020 23:24:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XMTP=AN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jr8Yv-0005nV-Ku
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 23:24:13 +0000
X-Inumbo-ID: 2329bb8e-bcbb-11ea-bca7-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2329bb8e-bcbb-11ea-bca7-bc764e2007e4;
 Thu, 02 Jul 2020 23:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1593732252;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=DD/40Qz8qZ78c4jky0R8eJwe8SV5DGFlqxwDiyq60pw=;
 b=dSkUvgeHtKGv8ckYivVY5J7d7/bFXIX60d6R2n8P14Cg/5guSF2fcJIN
 ayhG79qAW3QIAAHZ46z3oHU0wdFYBLZQwEuIFeeu7/nNwGgFDU1nvzrlu
 PiXF94l4++psFputDy+FfWtXcocL4FwJMNRallnLRMYV+uJ5qr5v939pE o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: EHdLL4zhLW9bpSAxAYvRa35rsjy9utSWkFNwQ8GKYJ+LgLEnAwpznR4lbdlktDiJaHK1o4M5lZ
 S9HVefjH7PkelGMqcFH6RJL0JqHfpf9IcxUSI8VAQovcbJluYYMeF1D8rqexJXsykDNol2W6J9
 zkUhu+rXVjkd5mxogyU8jPVFs0w0NNcM6Mrh4UdjXGLcHhpaa7BnEGf9ra8xsTjZKldT9NTuNF
 qTi/2UdOord7K58h1mQXpcGPw8obNGNY7+e1hE0eYiOjt5TnUJpkspi3E+mRNaXVAAtuQJ4Dr7
 fRM=
X-SBRS: 2.7
X-MesageID: 22346397
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,305,1589256000"; d="scan'208";a="22346397"
Subject: Re: [PATCH v2 1/4] x86/xen: remove 32-bit Xen PV guest support
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, <xen-devel@lists.xenproject.org>, <x86@kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20200701110650.16172-1-jgross@suse.com>
 <20200701110650.16172-2-jgross@suse.com>
 <6d0b517a-6c53-61d3-117b-40e33e013037@oracle.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9f8cc440-82f0-d6d8-945d-19c48f69a6b0@citrix.com>
Date: Fri, 3 Jul 2020 00:24:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <6d0b517a-6c53-61d3-117b-40e33e013037@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02/07/2020 23:59, Boris Ostrovsky wrote:
> On 7/1/20 7:06 AM, Juergen Gross wrote:
>>  
>> -#ifdef CONFIG_X86_PAE
>> -static void xen_set_pte_atomic(pte_t *ptep, pte_t pte)
>> -{
>> -	trace_xen_mmu_set_pte_atomic(ptep, pte);
>> -	__xen_set_pte(ptep, pte);
>
> Probably not for this series but I wonder whether __xen_set_pte() should
> continue to use hypercall now that we are 64-bit only.

The hypercall path is a SYSCALL (and SYSRET out).

The "writeable" PTE path is a #PF, followed by an x86 instruction
emulation, which then reaches the same logic as the hypercall path (and
an IRET out).

~Andrew

