Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIHfMKTxDmqmDQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 13:51:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2905A440C
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 13:51:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315091.1584964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ1vM-0006zj-CQ; Thu, 21 May 2026 11:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315091.1584964; Thu, 21 May 2026 11:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ1vM-0006xL-9i; Thu, 21 May 2026 11:50:48 +0000
Received: by outflank-mailman (input) for mailman id 1315091;
 Thu, 21 May 2026 11:50:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wQ1vK-0006xB-7T
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 11:50:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ1vJ-002MT5-KK
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 13:50:45 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0ef182-2eae-0a2a0a5409dd-0a2a4509d57a-42
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 13:50:45 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0ef195-2497-0a2a45090019-d155dd2db1f2-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 13:50:45 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-45ea19f412aso617218f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 04:50:45 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49033d44d7dsm68031065e9.5.2026.05.21.04.50.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 04:50:44 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779364245; x=1779969045; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Veh4yAlcfg3txmWXjV6A/+ZcZImXJ9gUqDbiQEAl0U4=;
        b=UW/DD9lfhCPhm2zsLWu44PfLUO7y+mEURR1YBjrdg5efsAW+Pd6Tih5PzakhthpsGR
         NrEQJC9MlJPQKmPeKKM8yNgcRKQqq5Dkjy3G5xfRD9nB4QfaDFfS89fv2+3xgNZezeGW
         nDkKj38HT0EO+DsW4hUb9uo63Ygi2LEGrswn/3VEMdaCPugm5/aLHoHvBssTCFXd3mb+
         q9IEeRmpUZUQspmaTkvjRH8vl+1Tw1m2b6OI9KT8jZDMXoqncXmnhHcuHX5teCCeOR4v
         Eoen0pygxkaz/Ptc66+l+C9yi2AUu+ySxfEd9sfwEkcb4sa438M9vW4b1QGk04hUE/by
         P/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779364245; x=1779969045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Veh4yAlcfg3txmWXjV6A/+ZcZImXJ9gUqDbiQEAl0U4=;
        b=LLR/WOGdwRPw1SCUKGeHkvXm8HtWW1rjDJSE/xb3KrZj6jUBUJImvYDqAX7y3KbvbL
         MgbTx66TDD0xYnNRX9lRRsr6+/YANyS9QAO7sW2pnb7BFDtGiBrdxh/aMpXRHqmcxJRW
         XBXKV72Y89qf8JzmV4Cvq00ywYb2uYG7/Zhs6dSWTyLlruwuC6JFrQaGdN/ZmyFEgj6A
         ck1c4De99jPK/s+UmfI1jyYJXfPMKxV7/d4P96fyVovgbBcHrupEig7nA3I4z3EM4EJ6
         jNjgeaRXeSaLK9+trro7cXxMmr7LYAut3hWKLIfTj1etef5UE2aagpfuVvbl/4NPyOXZ
         CoyA==
X-Forwarded-Encrypted: i=1; AFNElJ83ewlN5/cZ3jF6D/f/n3FSpksv0B6tgyAZ1vseFfhHUbEkgmWTiA4OXbm0Xrcnyyjc9Av/IIDdx54=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyfva/u852CeserTlMn7VEri9arpsNXiQ1S9qH5enBpuMVrITS6
	/Ci//D4kWxTKn/B6e32xYvJM74ypdI3feVq1UccWh0hRrHne63NGZ1kf
X-Gm-Gg: Acq92OE9AFkZdFnNYoUxw7MSnLdFjvRWozSPj/TbEVdpQKPHrPiruSqZaY98GpG0GbH
	vFBeOIxzoRviWoAdXSFbF38Nc6bthrGZ9RGMPtpKnAuVz7yPGMJ4byHD5VjNA1/7p5+Z//eDtDY
	hp8YlOvJjd9xzlBrBUTJvJVtWQBCLP/e0B4BkCaLyz3WWHnQhzn7NoiCZRWF/1uX4FLO09hx8V7
	pS/yrI8qRgKT66YUWgzdACBYDHfZoBLhBnAZRnCmxc4ulYmWd4qGjZNzFG5Bub17IcFs9VUAr6s
	LdgHU+Rx9XWMTiERe7jn8fjH7h0oCSqp49l8bAqA/B+Namr4T8TRvYoC51a+izmFxnSdHzQzXzB
	vt0muC/Ze8qFnf0VQ/FmV8zlGMUiJJXt+6nc1YyTXd0waCM9DIz2BRfrLEn1m5hFX7xI5sw4Fmx
	snFqRvhj5ztRpSxaRlrsOntupA2TcVzwWhPDQi9W+4itUxNo6aRoXTi34heHnNN3mwFW5PH9QEH
	ifuBqZ2cA==
X-Received: by 2002:a05:600c:a112:b0:48f:e230:80a3 with SMTP id 5b1f17b1804b1-490360dc0a4mr28940395e9.33.1779364244776;
        Thu, 21 May 2026 04:50:44 -0700 (PDT)
Message-ID: <47082d75-bb32-4178-952d-a237c111ee5a@gmail.com>
Date: Thu, 21 May 2026 13:50:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v6] x86/svm: Support vNMI on capable hardware
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20260514175623.1869042-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260514175623.1869042-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1779364245-4216DA53-5E208827/10/73395122804
X-purgate-type: spam
X-purgate-size: 1798
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,suse.com:email,amd.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:abdelkareem.abdelsaamad@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3B2905A440C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/14/26 7:56 PM, Andrew Cooper wrote:
> From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
> 
> Starting with Zen4, AMD CPUs can virtualise NMIs for a guest.  On older
> hardware, determining when an NMI is safe to deliver is a challenge and Xen
> does not handle all corner cases correctly.
> 
> With vNMI, there is an enablement bit and two new bits of state in the VMCB; a
> pending bit, and a blocked bit.  These directly map to the CPU state for
> handling NMIs, and are maintained by hardware during the running of the vCPU.
> 
> When vNMI is enabled, have svm_{get,set}set_interrupt_shadow() work in terms
> of the vnmi_blocking bit rather than the IRET intercept.  This allows an
> emulated IRET instruction to re-enable NMIs.
> 
> When injecting a new NMI, simply set the vnmi_pending bit; hardware will
> deliver the NMI to the guest at the next suitable juncture.
> 
> One complication is that, when delivering a second NMI before the first has
> completed, the mix between common HVM logic and SVM specific logic will try to
> open an NMI window, malfunctioning as it does so.  When vNMI is enabled, short
> circuit this to not consider NMIs blocked.
> 
> Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Teddy Astie <teddy.astie@vates.tech>
> CC: Jason Andryuk <jason.andryuk@amd.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> For 4.22.  This is somewhat overdue and makes a concrete improvement to NMI
> handling on recent AMD hardware.
> 
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

