Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBi8CRmEBGrVKwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:00:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0831253492F
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:00:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308036.1579583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNA8k-0007C0-Gk; Wed, 13 May 2026 14:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308036.1579583; Wed, 13 May 2026 14:00:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNA8k-00079b-E8; Wed, 13 May 2026 14:00:46 +0000
Received: by outflank-mailman (input) for mailman id 1308036;
 Wed, 13 May 2026 14:00:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNA8j-00079K-Io
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 14:00:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNA8i-00357C-T6
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 16:00:44 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a048406-bab6-0a2a0a5309dd-0a2a4501e290-6
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:00:43 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a04840b-c1f2-0a2a45010019-d155802fc065-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:00:43 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso61476385e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 07:00:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fce38328esm44172595e9.13.2026.05.13.07.00.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 07:00:42 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778680843; x=1779285643; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G79nBLbusI+wOTeHofiLWxIFyMI86o2grvlpiB2XF6M=;
        b=HL+QtMsCYJ9DdQAmdNhVSJ8IJUzYd6pJs9yTNSxoJMVpGn0pyya/PjY4PbDOHx8S6s
         TYYOXxc4Ie0EjqfmSoV9QXqJuxsUzC56d7RVpujkKvxmC3zBTvMxFje/nPMmckuMjCEq
         XgYwMAlxATR7+YS3NvhK6HHgzmWGGiHerTeqJ0JkhtJPaPpa/Opc2LzECIoNrVHF6tbm
         2vmk0up88jZRb/RP7sJEB702EaMOybpB8qjjtri3Mb5iUAcHcMxUtJEYRwPtUkWa0/Km
         Uqs+AwW7zWZzyoRJz8maNRRs16bIIEilVh/SSQVov4fst1Xqi/XGFFBaFBZVNFtExlRh
         uTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680843; x=1779285643;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G79nBLbusI+wOTeHofiLWxIFyMI86o2grvlpiB2XF6M=;
        b=NDwAD+IxFD9cOmgd6i4Jw8YfMmiV6eyy79qYcwRhPyNxys4Ja+RkevehzEJG4A8TKt
         J+2xT/2Cr6thymJmOx9yhHEKbipKicRA56GzOsVz1ptmsWStKtXC3rcD6UaNRsvuoZMy
         tRp24O/lOMIJihq9I9ZIP8lq/bYOv0fXn5iHsi5IsBFknWw/XlDvehZ0QMlXCT04I4Ur
         rDPlYnTxI7NR9TDWdwr0+EMRPS8yQ4iP3biVp/7ybZr2uTPxIR5vuTUqtsgQIuoVYaAE
         aC5d4wA0UFWwAYZxO6e3e2gDBb9IjzFSRxNgxXisl1t1s0HsGuTqsA1KEYOKq42m/ERy
         b3Zw==
X-Gm-Message-State: AOJu0Yz+iah28r9G0O1GHi5gmGFYU2Q2hScLt6+4H3EEVlsEKFbtcl7j
	9v/mRi2bAKD9RApcqP8JofUGWo0/htP7+ddsYl4mG1eRwAdObXIBaNS8SA9WGjXgsuz0jXGY4Z/
	rB08=
X-Gm-Gg: Acq92OGef3NeAC5aIQsZEhpIcOZqvSMpW1e5U3s3kIRd02jSS4VnTZ5oV5N6jTXzCAZ
	2+nudHuzcrYILclRXvuKy8ppU4mtKBsnn1pDzwqIBHIdxWOHOto8w79ZidNEPi0O0Lz69Sn9irS
	CIGzjxdLTENxewuUF4pbvcQznpVUwhCd0UeKMu4pAfRzhcH9J07TIYlrNpUcsy5OfGhLyATnBvm
	CUAqLurskffTfZ1RRepadjuDh387iOpdqlOE1v6in9etYA7eWf0HmlQayfna5Q2t5u4J+i+X5W3
	HYwsukCWHN7uizq4b9dn+v6aKkKy7pT05eihSEt2D9kN7hE2+6FbpMKIvEnYMKryWQcwBAUNThJ
	mavL20StmhFBJJxKL1frH6qSQhVXFgyFudFfcAGCz3RMlJgqbMFxxf1vjfehD60ukPsP6dYpZv9
	gY1WUDAOlsYhYwAaCDofJaNs+VLz8JX92s9pKClwMzFfjRzzzwaeJA6O80AFZOATdqm9oObaL//
	DzClF5Vynu5eYs=
X-Received: by 2002:a05:600c:4e43:b0:489:1fa5:997f with SMTP id 5b1f17b1804b1-48fc9a0ef11mr46192765e9.9.1778680842484;
        Wed, 13 May 2026 07:00:42 -0700 (PDT)
Message-ID: <0af810a1-3392-472a-93c9-c98fcb81c43a@suse.com>
Date: Wed, 13 May 2026 16:00:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] kexec: kexec_crash_save_info() vs Misra C:2012 rule 8.3
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
References: <13ca5f9f-d985-41bf-9c30-afd657dade89@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <13ca5f9f-d985-41bf-9c30-afd657dade89@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1778680843-AC851FF4-E60505C5/0/0
X-purgate-type: clean
X-purgate-size: 644
X-Rspamd-Queue-Id: 0831253492F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

... ("All declarations of an object or function shall use the same names
and type qualifiers"). The declaration doesn't use the typedef, so the
definition shouldn't either.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Really, is the typedef of much use? I.e. can't we drop it altogether?

--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -333,7 +333,7 @@ void kexec_crash_save_cpu(void)
 }
 
 /* Set up the single Xen-specific-info crash note. */
-crash_xen_info_t *kexec_crash_save_info(void)
+struct crash_xen_info *kexec_crash_save_info(void)
 {
     int cpu = smp_processor_id();
     crash_xen_info_t info;


