Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EmI2BGF9Mmrz0gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 12:56:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A67BD698B75
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 12:56:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JmIk0Alu;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1340056.1601061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZnwW-0004yW-6P; Wed, 17 Jun 2026 10:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340056.1601061; Wed, 17 Jun 2026 10:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZnwW-0004wk-3r; Wed, 17 Jun 2026 10:56:24 +0000
Received: by outflank-mailman (input) for mailman id 1340056;
 Wed, 17 Jun 2026 10:56:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZnwV-0004we-9r
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 10:56:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZnwU-009Zdm-H3
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 12:56:22 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a327d48-e002-0a2a0a5209dd-0a2a4505cfce-40
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 12:56:22 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a327d56-aaa8-0a2a45050019-d155dd2bb021-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 12:56:22 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-4633193af19so106992f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 03:56:22 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2e6a8fsm53799819f8f.37.2026.06.17.03.56.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 03:56:21 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781693782; x=1782298582; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g9ogqjAFwCi2vowAjQHJfzOyE2MxN2KVpVjGkd0uJ14=;
        b=JmIk0AlueoJX1TIaFnZk8CCPdUQ1s08xqA04/pn4jF185UxwzNzga3NiiLVz5JZc43
         wl31KvU6CNwSqLXOUJKPw5fKILTv7T9NANdJV30SZXiF04XFHDERctpSM3/LeDqUl8XR
         LnrgT+nMwFfNhg//Hf77d1cuPaNUgsP2kCLB+snwV6tf/VSioKBizgvJihTeYk2F92nK
         l3c9nDs1TXIAJxYZH5RdT9k/DvdpjX4MGr/0wScIP6VuDRj/ToYEqMiiJKnVcDo2/XnA
         mH9W2wYRrs69JYKIyUSo0m2Hq62YZT/JnBVIwJP3j99PS073j7oAKHyvuPg/b85frzNx
         O0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781693782; x=1782298582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g9ogqjAFwCi2vowAjQHJfzOyE2MxN2KVpVjGkd0uJ14=;
        b=UzNSQVYWeDPWhTMDmAAJFPrbXgXM4zx0Zv8HFsYQ+do3eCqXo2vLVt+t4cJFEWaOr0
         2kE/zKk2ORPRULqWZmjy6FTehQ7cM7a3yxLWl80+0kitv97MzZ9XZOqvmcmnJ7luOKzJ
         FuMBi0jr5wgW2EG8wHWDOcGYgwi6aFDgdRj+t2PvIM80hdTTY3A1NX1SeHQ66bbgFB9V
         F98fzsEoI8BrJTvBH+RYirOIz94Q9fLFDpYpJIVwnGrY69DvmxDHW1xtkpyV2Xodq1HQ
         2NtDrD3CKuSaUPclYFcPPd9tcz3gAxEWRoC+KnVU1ryhraqfsoPDNfxgBYxppnLgbr9P
         HLuA==
X-Forwarded-Encrypted: i=1; AFNElJ9bHOSX/+HzyhVD4R8wl/4BW7y9nyTTEoqbf3RhHVpRBt1EmzBOjBHbdQOUIG6kKWpZxOzLFDDRqUM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzcLlJ8VfXvnoBdVrESwETdr7GJovVSj05oj/cZ8X7uspTFOApi
	mBJt5NMSVnG6TxZNVFhXHuxES/YykaC2VMrs5Qcmm9LTiSbRBkhYT20y
X-Gm-Gg: AfdE7cm2UseBzdGAloIJGdHBDwjkjM41ePCX3h7r48oj8O/eobZGu4OUxq0fiMAkIbC
	4epVNV3mzHfm/dSQZ2nb+D/NKTAq2Fiw3wQdW9g+HP3sJDNY3MOfJTlxFa0EcpenqEBVlxTahP8
	Wiis62lb09o1Gu7o+3MvZP8R5MfLpEO5Vv59D5aKwOa+bUHgIt5zgCaKs5zy0LZ5U9dUUr21Q6t
	BozewYYnyTi4yWXiLvQJe8m0VmoEYwJnuYEOHu1cj8Bn/RNOyqGP+c3yT76ShdwLfAiSGuTM4SJ
	w6qT/schGnZ/ipWvCppTyH8IpF5gwSN6EyEMHYCgPHzcle0/KexOr+xKOvcRbourr89Hv31+RwS
	a+XSqC6oF/NEuyNSr9AeUtAjscwwNid0rQdf5GsSvevoy75vqHCTzrxcSEp+3hnxT0abBn4LUCR
	zDRwd3Y3yRwO3mV4xPAMDlyCuFMk1DkpKJSRyO2uW3iRf2WkVXHkc6M3WYEix4fb+9UN8=
X-Received: by 2002:a05:6000:40ce:b0:45e:f765:ff9 with SMTP id ffacd0b85a97d-46237f472ccmr6583448f8f.24.1781693781691;
        Wed, 17 Jun 2026 03:56:21 -0700 (PDT)
Message-ID: <4457b798-d553-486c-8727-908ef88ebb1e@gmail.com>
Date: Wed, 17 Jun 2026 12:56:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22?] x86/EFI: arrange for non-discardable .reloc in
 xen.efi
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
References: <652b57e0-42f8-47c8-b94d-df862874aba3@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <652b57e0-42f8-47c8-b94d-df862874aba3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1781693782-D3563443-5EF33C01/10/73395122804
X-purgate-type: spam
X-purgate-size: 691
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A67BD698B75



On 6/16/26 6:17 PM, Jan Beulich wrote:
> Loaders respecting IMAGE_SCN_MEM_DISCARDABLE would not load such sections,
> yet we need to access it ourselves when switching out of "physical mode".
> Leverage behavior new to GNU ld 2.46: Any contribution to .reloc which
> doesn't have the discardable flag set (which cannot even be expressed in
> ELF) will yield the output section also non-discardable.
> 
> Since for intermediate binaries we don't care about section attributes,
> link in the new object only on the final linking pass.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

