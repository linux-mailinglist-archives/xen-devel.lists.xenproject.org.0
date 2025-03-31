Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C29FA76FB9
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 22:56:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932974.1335019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzMAr-00013C-Pn; Mon, 31 Mar 2025 20:56:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932974.1335019; Mon, 31 Mar 2025 20:56:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzMAr-000109-Ma; Mon, 31 Mar 2025 20:56:01 +0000
Received: by outflank-mailman (input) for mailman id 932974;
 Mon, 31 Mar 2025 20:55:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F9bB=WS=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1tzMAp-000103-JJ
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 20:55:59 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b0070ca-0e72-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 22:55:58 +0200 (CEST)
Received: from [172.27.3.244] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52VKtBNP3418600
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Mon, 31 Mar 2025 13:55:12 -0700
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
X-Inumbo-ID: 8b0070ca-0e72-11f0-9ea7-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52VKtBNP3418600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1743454520;
	bh=VWL5qq9zWu3cNVnIm7LG7BNkZkCMGz8p/x6Wg1aq0Vk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LD97Y7SSrMxEUulSMZu+ff9YU54RyfVQzj+cvjC0nuyPVAEvUTBY9vRHA9kuqRBck
	 zCpoYM2uH/99eIUDQGh5oDFn03Tifu66IeQ3yxFSTx24lBmHWwTojxMeI1feo+cKyk
	 7eP21xGMkfSjHVWZupPDlETH4s1vyAwJDOC+QWi0AcWJErrmD9O7x5BZvgDMta9Uss
	 0c3ftb/ovwly81i9hfmlGacobBgXN1Th2kgo58DJsSRQjb9x/QGkISc7TVQc+0OMDc
	 i/TzJFXz/ephJVSay1Qes3/ceo2JQmIVHTc6M8xH77vra6FcPLxFWWqYEiisToZPWj
	 Zy5DmP5WmybQw==
Message-ID: <1add8de0-8c62-444e-a7d6-5681432d48a9@zytor.com>
Date: Mon, 31 Mar 2025 13:55:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 10/15] KVM: VMX: Use WRMSRNS or its immediate form
 when available
To: Andrew Cooper <andrew.cooper3@citrix.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        "Xin Li (Intel)" <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
        linux-edac@vger.kernel.org, kvm@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-ide@vger.kernel.org,
        linux-pm@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, jgross@suse.com,
        peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
        mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
        jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
        kan.liang@linux.intel.com, wei.liu@kernel.org, ajay.kaher@broadcom.com,
        alexey.amakhalov@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        tony.luck@intel.com, pbonzini@redhat.com, vkuznets@redhat.com,
        seanjc@google.com, luto@kernel.org, boris.ostrovsky@oracle.com,
        kys@microsoft.com, haiyangz@microsoft.com, decui@microsoft.com
References: <20250331082251.3171276-1-xin@zytor.com>
 <20250331082251.3171276-11-xin@zytor.com>
 <Z-r6qxmk7niRssee@char.us.oracle.com>
 <fde11fbb-4b3f-44f1-90cf-6aaefb6bb7c1@citrix.com>
Content-Language: en-US
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <fde11fbb-4b3f-44f1-90cf-6aaefb6bb7c1@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/31/25 13:41, Andrew Cooper wrote:
>>
>> That is replace the MSR write to disable speculative execution with a
>> non-serialized WRMSR? Doesn't that mean the WRMSRNS is speculative?
> 
> MSR_SPEC_CTRL is explicitly non-serialising, even with a plain WRMSR.
> 
> non-serialising != non-speculative.
> 
> Although WRMSRNS's precise statement on the matter of
> non-speculativeness is woolly, given an intent to optimise it some more
> in the future.
> 

To be specific, "serializing" is a much harder statement than 
"non-speculative."

For architecturally non-serializing MSRs, WRMSRNS and WRMSR are 
equivalent (or to put it differently, WRMSR acts like WRMSRNS.)

The advantage with making them explicitly WRMSRNS is that it allows for 
the substitution of the upcoming immediate forms.

	-hpa


