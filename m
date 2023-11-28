Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E673C7FC3E5
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 20:00:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643432.1003648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r83Iz-0008Jl-P2; Tue, 28 Nov 2023 18:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643432.1003648; Tue, 28 Nov 2023 18:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r83Iz-0008GY-MF; Tue, 28 Nov 2023 18:59:33 +0000
Received: by outflank-mailman (input) for mailman id 643432;
 Tue, 28 Nov 2023 18:59:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=23wz=HJ=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1r83Ix-0008Eo-Bw
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 18:59:31 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4163fdc3-8e20-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 19:59:29 +0100 (CET)
Received: from [127.0.0.1] ([98.35.210.218]) (authenticated bits=0)
 by mail.zytor.com (8.17.2/8.17.1) with ESMTPSA id 3ASIwqLV616002
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Tue, 28 Nov 2023 10:58:52 -0800
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
X-Inumbo-ID: 4163fdc3-8e20-11ee-98e3-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 3ASIwqLV616002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2023111101; t=1701197933;
	bh=74Rbbp6WmPGdUYvYwxbnx3GlgDUb6hVq+tbhktrir44=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=11Iza6/qBiVUooTKd04zGe3+wGNKZVtkyP1VW7naU9P22AgKrZowrwJtcMKq3USBK
	 0lE8KKp0aSf0L7vG6wMYqj3GBFBG4Z+IyjuorpigOVR+bZGRipokdFZpAHxsKxJVsJ
	 eXJ+JD+99XTQDzX1is23XA0HmvT2kbL85O4HuT09syHKKptCBqObIMJ1kEJAvGPIrT
	 Te5AF0KD+nO8MMWUcEFZ5cOMcsuvCtml6Q1SjlKD/yPKStgz2z/rfZFPbT9QhXqSv3
	 0Q4y+BTl1dMGW1ncv4Yl5PW3gnAB2+y+WTENs06cntMqYcI+tLMnha0J9K8iGZB7yh
	 4oXasKaWj6nVA==
Date: Tue, 28 Nov 2023 10:58:50 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: "Li, Xin3" <xin3.li@intel.com>, Borislav Petkov <bp@alien8.de>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
        "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "x86@kernel.org" <x86@kernel.org>,
        "Lutomirski, Andy" <luto@kernel.org>,
        "pbonzini@redhat.com" <pbonzini@redhat.com>,
        "seanjc@google.com" <seanjc@google.com>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "Gross, Jurgen" <jgross@suse.com>,
        "Shankar, Ravi V" <ravi.v.shankar@intel.com>,
        "mhiramat@kernel.org" <mhiramat@kernel.org>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "jiangshanlai@gmail.com" <jiangshanlai@gmail.com>,
        "nik.borisov@suse.com" <nik.borisov@suse.com>
Subject: =?US-ASCII?Q?RE=3A_=5BPATCH_v12_24/37=5D_x86/idtentry=3A_Incorporat?= =?US-ASCII?Q?e_definitions/declarations_of_the_FRED_entries?=
User-Agent: K-9 Mail for Android
In-Reply-To: <SA1PR11MB6734A1E439870989C7006166A8BCA@SA1PR11MB6734.namprd11.prod.outlook.com>
References: <20231003062458.23552-1-xin3.li@intel.com> <20231003062458.23552-25-xin3.li@intel.com> <20231128100910.GSZWW8RnyhX0YQjwDm@fat_crate.local> <SA1PR11MB6734A1E439870989C7006166A8BCA@SA1PR11MB6734.namprd11.prod.outlook.com>
Message-ID: <EE769C0F-FA81-49AD-A90B-F0E5D2A1DA7B@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 28, 2023 10:39:01 AM PST, "Li, Xin3" <xin3=2Eli@intel=2Ecom> wr=
ote:
>> > FRED and IDT can share most of the definitions and declarations so
>> > that in the majority of cases the actual handler implementation is th=
e
>> > same=2E
>> >
>> > The differences are the exceptions where FRED stores exception relate=
d
>> > information on the stack and the sysvec implementations as FRED can
>> > handle irqentry/exit() in the dispatcher instead of having it in each
>> > handler=2E
>> >
>> > Also add stub defines for vectors which are not used due to Kconfig
>> > decisions to spare the ifdeffery in the actual FRED dispatch code=2E
>> >
>> > Tested-by: Shan Kang <shan=2Ekang@intel=2Ecom>
>> > Signed-off-by: Thomas Gleixner <tglx@linutronix=2Ede>
>> > Signed-off-by: Xin Li <xin3=2Eli@intel=2Ecom>
>>=20
>> This makes me wonder too who the author is=2E The commit message text s=
ounds
>> like tglx=2E :)
>
>You have a very good sense =F0=9F=98=8A
>
>This is mostly from his review comments and suggestions on my original
>changes to IDTENTRY=2E  So probably I should put a "Suggested-by" instead
>of "Signed-off-by" as HPA pointed out!
>
>Thanks!
>    Xin
>

Remember that Signed-off-by: relates to the *patch flow*=2E

