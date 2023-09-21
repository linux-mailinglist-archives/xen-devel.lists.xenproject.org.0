Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B49197A90E1
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 04:26:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606053.943726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj9Nw-0007y9-RW; Thu, 21 Sep 2023 02:25:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606053.943726; Thu, 21 Sep 2023 02:25:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj9Nw-0007vj-OX; Thu, 21 Sep 2023 02:25:44 +0000
Received: by outflank-mailman (input) for mailman id 606053;
 Thu, 21 Sep 2023 02:25:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OXC+=FF=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1qj9Nv-0007vd-MU
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 02:25:43 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 283e5f1a-5826-11ee-878a-cb3800f73035;
 Thu, 21 Sep 2023 04:25:42 +0200 (CEST)
Received: from [127.0.0.1] ([98.35.210.218]) (authenticated bits=0)
 by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 38L2Ojrq2878666
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Wed, 20 Sep 2023 19:24:46 -0700
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 283e5f1a-5826-11ee-878a-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 38L2Ojrq2878666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2023091101; t=1695263088;
	bh=WciaewRbFVCG7f/TWCqOhh4NlX/euw7ehl3BKDv4D2s=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Ljqz95c2+2ctrUrqDTYh4QJqwX6aq8mwwAySkJYOLB/rmPNr+SnxWAYlU/KQSCT5Y
	 tz1ezsYWqK0Q4cbXNch6WmSJ06yICbg3IW6efg/D3UscvInNuY+tdrl12AD0aOeABS
	 jJnQKYPibz2ODD7CuZvST50wrsGNzOQdvKs4ffKVf6+Dzir4Me4tyjJ9yIDffI8iep
	 PiaHLNeUMu9OkEdAJ0K0iskn+vI9N9gg/LhElcG3QQu2b49nd1vPLUf+lmlguTs+9v
	 aCY/LfiHWkB5ORkGwlNjhb+7FcMKMnOnZzBWQVPbPpuDO2ZZDvqBIwYYvhyazgjB9h
	 NhSAU3+MJhZIw==
Date: Wed, 20 Sep 2023 19:24:43 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Thomas Gleixner <tglx@linutronix.de>, "Li, Xin3" <xin3.li@intel.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
        "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "x86@kernel.org" <x86@kernel.org>,
        "Lutomirski, Andy" <luto@kernel.org>,
        "pbonzini@redhat.com" <pbonzini@redhat.com>,
        "Christopherson,, Sean" <seanjc@google.com>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "Gross, Jurgen" <jgross@suse.com>,
        "Shankar, Ravi V" <ravi.v.shankar@intel.com>,
        "mhiramat@kernel.org" <mhiramat@kernel.org>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "jiangshanlai@gmail.com" <jiangshanlai@gmail.com>
Subject: RE: [PATCH v10 36/38] x86/fred: Add fred_syscall_init()
User-Agent: K-9 Mail for Android
In-Reply-To: <87h6npuuk9.ffs@tglx>
References: <20230914044805.301390-1-xin3.li@intel.com> <20230914044805.301390-37-xin3.li@intel.com> <87v8c6woqo.ffs@tglx> <SA1PR11MB6734C02FFB973B2074EC6CC8A8F9A@SA1PR11MB6734.namprd11.prod.outlook.com> <87h6npuuk9.ffs@tglx>
Message-ID: <4578F690-1501-46C3-9048-5AED97EAD001@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 20, 2023 1:18:14 AM PDT, Thomas Gleixner <tglx@linutronix=2Ede=
> wrote:
>On Wed, Sep 20 2023 at 04:33, Li, Xin3 wrote:
>>> > +static inline void fred_syscall_init(void) {
>>> > +	/*
>>> > +	 * Per FRED spec 5=2E0, FRED uses the ring 3 FRED entrypoint for S=
YSCALL
>>> > +	 * and SYSENTER, and ERETU is the only legit instruction to return=
 to
>>> > +	 * ring 3, as a result there is _no_ need to setup the SYSCALL and
>>> > +	 * SYSENTER MSRs=2E
>>> > +	 *
>>> > +	 * Note, both sysexit and sysret cause #UD when FRED is enabled=2E
>>> > +	 */
>>> > +	wrmsrl(MSR_LSTAR, 0ULL);
>>> > +	wrmsrl_cstar(0ULL);
>>>=20
>>> That write is pointless=2E See the comment in wrmsrl_cstar()=2E
>>
>> What I heard is that AMD is going to support FRED=2E
>>
>> Both LSTAR and CSTAR have no function when FRED is enabled, so maybe
>> just do NOT write to them?
>
>Right=2E If AMD needs to clear it then it's trivial enough to add a
>wrmsrl_cstar(0) to it=2E

Just to clarify: the only reason I added the writes here was to possibly m=
ake bugs easier to track down=2E There is indeed no functional reason=2E

