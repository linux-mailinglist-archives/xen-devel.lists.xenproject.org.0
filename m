Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AET6DB0o52kf4wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:32:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E31437A1D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:32:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288382.1568658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5al-0007dU-Kf; Tue, 21 Apr 2026 07:32:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288382.1568658; Tue, 21 Apr 2026 07:32:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5al-0007bN-I2; Tue, 21 Apr 2026 07:32:19 +0000
Received: by outflank-mailman (input) for mailman id 1288382;
 Tue, 21 Apr 2026 07:32:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wF5aj-0007bH-Pb
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 07:32:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF5ai-00Fxq5-Mj
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 09:32:16 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e72800-2eae-0a2a0a5409dd-0a2a4507bf7c-6
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:32:16 +0200
Received: from [209.85.208.182] (helo=mail-lj1-f182.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e72800-229c-0a2a45070019-d155d0b6bd9e-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:32:16 +0200
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-38e12c67a6fso37812561fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 00:32:16 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4187ec277sm3524366e87.84.2026.04.21.00.32.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 00:32:14 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776756736; x=1777361536; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mUTCUhVtcctCX2T3AeSdAHlM06T+CtqBLPNdEJl594I=;
        b=ZPC4FRIQOgw42MvVMn7avxxVaeWGJQlqfUyv5ldq+ANrrQ2iKzen1vRUe1cEs10KgP
         Iu4Ncy24mfH/Y+32CNSDqJlQ1i4/yqBZ5dKyvucZW2AdUq1mzOlgi/oPBIcMo+pO8YkC
         E9sHqvjqlPqFYVC7WOoiNyh72Q+jdTEap1TUOiPgi1NecgSG+PlpDH8WvbLNjhd5E+dh
         EQd0w1RZu+441RILyzXai/iO21oYWbbzTmWHFF1GRVtiurOgStQcYKIPI9skCyW976SL
         X9rhBOWmuq/WpZ7Jndv4Ae8WI19ZEYgbpNlNb6xarjM2g8iiKL2HzHGU588sVGxrpWn8
         iXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776756736; x=1777361536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mUTCUhVtcctCX2T3AeSdAHlM06T+CtqBLPNdEJl594I=;
        b=qzQpU43JXcMLQdGMLbIzog4p9pMnesbe2MoedpAcXsMylODJT2/V7R/fWrZk/PGrAn
         PETBA0v1Ge6IF0WmJLQsTbsJ3hXVFGRdk8BFD8mz32jZM2X34zRv2FZl3QnzSpWTNzeR
         OUBBFMBDIdfqXUuqHZxU4hBF+cCTB4ZzO4CrzuLQjRHO6bRXeI8kFTMPjbFcuKSZf3g+
         TpyPAKYka1SmFt30Fw4sgADamhm59MAsFk41tBqKpciolYevHAdsIay77jDqL9wSYZxE
         vKx5fJAsbzZggrSId+NQXUCi6tZS3wdHaY05egqoG0YD+ObyQZbQelV9OGkFGDeB9ds9
         ECDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/B/xVxYIr60bnI+VC7nuBBOAnEC4Ai406bmd+hSQLL9VnYF+frCb+hZwvrnlTZJ4RrLp0yHUKInt8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8ZZkZdWHN/0O/td/Hq7YrR7Q/GtD7WxOtTHoM4Mz/5puoukrf
	0QcKx21ShJoi2CDRJAuzY2oRay7fONldaks+1A5Ugm4Hflmg7ghYVFdl
X-Gm-Gg: AeBDieuS9MZuK4Xym+UMkBJL8QcfdqPc+svluKbjcYpo0LXKVwY0EWZ6257DKmO+GZ6
	1aO347PyLxrVxdlHCOVOf/VWvmsf+zeruc/hfGXs3HGaLGFUg0qM4Ne0nMjbEITN0XLWMnnNpwK
	FynDhvWsGDA+JbFtaG2Kq3wo9uz5XJV03Un8J4C/t3zwMHfZQCRExZ0IK0DqyvuUPsRame3DA+M
	0E2UXZ2Rx6i8ZNVLqJ08L7cX+hvFacUCudlAg77716jYhak3lS5Um/nE2j/+h6vFB4fX4gP16SY
	ShOl/LV94veK//HTmzwzJkcgXUJP/B5PWg6IGKs4f8F7KnTsQUXRUyCOL0lgejPpJw8I1jwVkDd
	wfzLuXxgz31KdkFgrIawE+cGMNbCYUsxRI8wbRn/fHk/Kubg4viWrfUp6PQaW/FT1ZL7d37NfUP
	0t+Qkvi18cxmwR/IHJrVPlNdZoc0FkkdS83xCcaV5niIUb1kDCWkCw1hRrjTv791wAJsdzmOMwd
	lqSj7f+h5ozDw==
X-Received: by 2002:a05:6512:12c4:b0:5a2:be43:c57d with SMTP id 2adb3069b0e04-5a4172c77f5mr5686450e87.12.1776756735324;
        Tue, 21 Apr 2026 00:32:15 -0700 (PDT)
Message-ID: <a682a6fb-83cb-4240-a5c5-ce39e999394b@gmail.com>
Date: Tue, 21 Apr 2026 09:32:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/16] x86emul: support AVX10.1
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Community Manager <community.manager@xenproject.org>
References: <1e2ff012-b07a-43be-9ba6-290b38d3c97c@suse.com>
 <e23fa09d-b189-4c76-a22a-42df9fb9f9ef@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e23fa09d-b189-4c76-a22a-42df9fb9f9ef@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1776756736-AFB78C48-7BF6EC86/10/73395122804
X-purgate-type: spam
X-purgate-size: 2680
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:community.manager@xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	TAGGED_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 88E31437A1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/9/26 5:03 PM, Jan Beulich wrote:
> This requires relaxing various pre-existing AVX512* checks, as AVX10.1
> covers all AVX512* except PF, ER, 4FMAPS, 4VNNIW (support for all of
> which was removed meanwhile anyway), and VP2INTERSECT. At the same time
> all vector widths are always supported.
> 
> Note that visa_check(), replacing host_and_vcpu_must_have() uses, checks
> only the guest capability: We wouldn't expose AVX512* (nor AVX10)
> without the hardware supporting it. Similarly in avx512_vlen_check() the
> original host_and_vcpu_must_have() is reduced just vcpu_must_have().
> This also simplifies (resulting) code in the test and fuzzing harnesses,
> as there the XCR0 checks that are part of cpu_has_avx512* are only
> needed in local code, not in the emulator itself (where respective
> checking occurs elsewhere anyway, utilizing emul_test_read_xcr()).
> 
> While in most cases the changes to x86_emulate() are entirely
> mechanical, for opmask insns earlier unconditional AVX512F checks are
> converted into "else" clauses to existing if/else-if ones.
> 
> To be certain that no uses remain, also drop respective cpu_has_avx512*
> (except in the test harness) and vcpu_has_avx512*().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Probably avx512_vlen_check() should have the avx512_ prefix dropped, now
> that it also covers AVX10. But if so that wants to be either a prereq or
> a follow-on patch.
> 
> visa_check() won't cover AVX10.2 and higher, but probably we will want
> independent checking logic for that anyway.
> 
> Spec version 2 still leaves unclear what the xstate components are which
> would need enabling for AVX10/256. x86emul_get_fpu() is therefore
> untouched for now.
> 
> Since it'll be reducing code size, we may want to further convert
> host_and_vcpu_must_have() to just vcpu_must_have() where appropriate
> (should be [almost?] everywhere).
> ---
> v4: Switch to using fallthrough pseudo-keyword. Drop new _vlen_check()
>      helper again. Re-base.
> v3: Add ChangeLog entry.
> v2: Drop use of vsz128 field. Re-base, in particular over dropping of
>      Xeon Phi support.
> 
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -16,6 +16,7 @@ The format is based on [Keep a Changelog
>        mitigate (by rate-limiting) the system wide impact of an HVM guest
>        misusing atomic instructions.
>      - Support for CPIO microcode in discrete multiboot modules.
> +   - Support for AVX10.1. (Experimental)

Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>.

What should be done else to have not experimental support of AVX10.1?

Thanks.

~ Oleksii


