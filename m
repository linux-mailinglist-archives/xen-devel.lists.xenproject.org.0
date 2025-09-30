Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A20BAE7C8
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 22:00:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134475.1472336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3gVp-0005yf-6I; Tue, 30 Sep 2025 19:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134475.1472336; Tue, 30 Sep 2025 19:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3gVp-0005wV-3N; Tue, 30 Sep 2025 19:59:49 +0000
Received: by outflank-mailman (input) for mailman id 1134475;
 Tue, 30 Sep 2025 19:59:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3Ea=4J=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1v3gVn-0005w6-Jx
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 19:59:47 +0000
Received: from mail.zytor.com (terminus.zytor.com [2607:7c80:54:3::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0256c294-9e38-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 21:59:46 +0200 (CEST)
Received: from [IPV6:2601:646:8081:9484:3373:e8bd:aaa4:7c23]
 ([IPv6:2601:646:8081:9484:3373:e8bd:aaa4:7c23])
 (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 58UJxGxQ388770
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Tue, 30 Sep 2025 12:59:16 -0700
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
X-Inumbo-ID: 0256c294-9e38-11f0-9d14-b5c5bf9af7f9
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 58UJxGxQ388770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025092201; t=1759262357;
	bh=GUDfo0ggb2Kf0OLA6XTPKyaZ5hpYV0SrMLjTdCbuESQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=QaNz4Je2UXuQTSWaK4KMZazVcUDgrcjdxPf7vCTlHy0S5KlindalLZY9iSdbN0LPO
	 dZb78UBGhBI6zN+vsilEaxZSxAvZBA+b2DzFqnhlIs+P7vKdM8tGRUo3+SmH+ShgM7
	 b4ebKEuKD7ubKHHtEaatmx3ExNblsR56/PR+F2q18PSsag/YCLricKcIsLGhYsD8fm
	 +3Bi3bmpb/VjsC+tI1oc2MfG6eB2Odcjqkxn6QEL3QbDHW/e4z7LKSf4okznFo2Wwy
	 Y0OorC4QkeM6DrHa7SK6xfWjFIfjwzCLKSxx7dd3XM+E31C01/RFVTptacurWTbYs0
	 oHt+fMunsTYzg==
Message-ID: <2ca6c68f-16a7-402f-adb0-327583695d4a@zytor.com>
Date: Tue, 30 Sep 2025 12:59:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] x86/paravirt: Don't use pv_ops vector for MSR
 access functions
From: "H. Peter Anvin" <hpa@zytor.com>
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
        virtualization@lists.linux.dev, xin@zytor.com,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Ajay Kaher <ajay.kaher@broadcom.com>,
        Alexey Makhalov <alexey.makhalov@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        xen-devel@lists.xenproject.org
References: <20250930070356.30695-1-jgross@suse.com>
 <20250930070356.30695-12-jgross@suse.com>
 <20250930083827.GI3245006@noisy.programming.kicks-ass.net>
 <1541b670-8b29-42a5-a58d-34d85197751d@suse.com>
 <20250930100404.GK4067720@noisy.programming.kicks-ass.net>
 <fefbd1ee-ab8c-465e-89bf-39cd2601fc60@suse.com>
 <d2c68cbe-2e92-4801-b1a3-af4645e9ba78@zytor.com>
Content-Language: en-US, sv-SE
In-Reply-To: <d2c68cbe-2e92-4801-b1a3-af4645e9ba78@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-09-30 12:49, H. Peter Anvin wrote:
> 
> /* Xen code, stub sets CF = 1 on failure */
> 
>    0:   e8 xx xx xx xx          call   asm_xen_pv_wrmsr
>    5:   73 03                   jnc    0xa
>    7:   0f 0b                   ud2
>    9:   90                      nop
>    a:
> 
> The trap point even ends up in the same place! UD2 can be any 1-, 2-, or
> 3-byte trapping instruction.
> 

You can, of course, also simply have a conditional jump, at the expense of
making the whole alternative block one byte longer:

  0:   e8 xx xx xx xx          call   asm_xen_pv_wrmsr
  5:   0f 82 xx xx xx xx       jc     wrmsr_failed

	-hpa


