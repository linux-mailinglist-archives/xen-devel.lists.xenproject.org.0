Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOiFCmQxBGo/FAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 10:08:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BBB52F559
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 10:07:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307668.1579254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN4cL-0000x8-8z; Wed, 13 May 2026 08:06:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307668.1579254; Wed, 13 May 2026 08:06:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN4cL-0000vf-53; Wed, 13 May 2026 08:06:57 +0000
Received: by outflank-mailman (input) for mailman id 1307668;
 Wed, 13 May 2026 08:06:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wN4cJ-0000vZ-E9
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 08:06:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN4cI-003ilc-Cs
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 10:06:54 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a043114-e002-0a2a0a5209dd-0a2a45068cb0-32
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 10:06:54 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a04311d-7371-0a2a45060019-d155802bd06a-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 10:06:54 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-488e1a8ac40so62230765e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 01:06:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e8f43de84sm36074855e9.26.2026.05.13.01.06.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 01:06:52 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778659613; x=1779264413; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a1FDlrEZYHkmNRTGvaIPBLKEivfEuHLBmnLVK1kiJKI=;
        b=PYW+7DFxlA+KQBIEbRwgjJ+VqvN5f4qvd7eS5LhkM+q09CtmJtIxifY1ajKnuuZ/YY
         SctsGsCW5ZEzZmzm4ssBjJ7YI3nlPMtZcuskQzClLtG7Ievb5kVa7lygwuzRgcmzx+cs
         CDSV6TzuB5LpYUC1iBnBqTN4QPYgVl/k+l2fasEvkVA/2/rcq8gcHlefwXTfibpH58IN
         mLbjA4AvjyrxujD6yvrAxkdgn5YOGSVXu8iRL7bwYWe1XVWAk4r3EbpZX77Lvg/ivho3
         FW7bH5o0RvDqUwfalJP3Q+dfqoLxGov+Kd9n47/pBTiwdQ501WFJbFbSa4nHi/Ls+X/K
         uepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778659613; x=1779264413;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1FDlrEZYHkmNRTGvaIPBLKEivfEuHLBmnLVK1kiJKI=;
        b=CECcLpq1/LIJEMgXBzjtUXPS2YwYJFSix0j8lV3Ftm+X22iAMudAfOmBwROQL1CiMX
         t7GYfqMzf8httbV1GJQmM8XG0eoJM4PQN2c5wwlnQeIoEqpN0qYocb/eSQh1hyq0AALU
         +j+GFAGW9H9+jwZWMWGSu3z2T6QRak/5ZGO01x9z0ibfkLK2JNhKNUnFhcZb+1D2byWL
         2vwPltLHrd7z8YXxnFuHgMRuivQNz7jFmwfRNgAwhMgGmlAEEcxfb/0A7//0xkm8KVx1
         ZrqtQhUbilb/aTdjja7d3TThBAJa8DcnAleXHDYTjTvxuF3ySZ1x9HeAsKMs9LEXX6Ez
         0r6g==
X-Forwarded-Encrypted: i=1; AFNElJ8pxcqfK1TxKJpWY8nPXx6NlCpxzt6opDHkX9chOopLtvWu4WQuuLGDpHqdWGJ1Y8V+TAkoexrTmaQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNUphfQF2z4uxBqzdyvTIqGa4jMFu/OifnS02w8NgRQdysD6Xi
	H55nPMYLBUe/6GDromv3XnTNcirQS9vKXGS82EThD8yEqOxlCMNeKUX7UmQXcF7inA==
X-Gm-Gg: Acq92OECMp7sZ6xsKLE4wp5tjTszajc8KrrCMODDVbpepPaTHGPP0u6Xq4ys8gnwZEi
	7UIsmUHFiy4ka3HUk6X57ywYXqyQKiPDgciw+LfUjDqCTSx0uZCztCKKqHVbvXT52NtKzgeT2kl
	NPMKMqs6LPhBjpIxl+hKvBsjy9x7/mw49ZehOvgYMputmI96JC6wtNDdK6e1NppSMd365TIUFml
	WfFk2rothNmZuLTeXTNfOqiYEp+IlvGEy5oftxpk8AlDuPh9ZdJErMpcjgddeCfUp+U1Vtz6rga
	qb23nbpdEyWEs/SoJ214I8MedzEX8G0SeVHVI9WBxHPxtXdyCwuhg3XDFa03fX7zNwWpvxb7rQQ
	B0CRAXHgu6FZ2B+RT/j9OEULoDVPWp+pn91UBtdG1Nl2Ez4pUG+Anw1X8DpZIhEjoOPEgQPj1Q9
	USiTTfti9dhle3lj11oMS7Wk173vgT93AyGOTzpFUNRSgHJba16jTQXyUKsIYoCwtnSjKMMqj+E
	IRdw6Akrb9gseY=
X-Received: by 2002:a05:600c:811b:b0:48a:52f2:a0f1 with SMTP id 5b1f17b1804b1-48fc9a35f35mr28284285e9.18.1778659613512;
        Wed, 13 May 2026 01:06:53 -0700 (PDT)
Message-ID: <9827d24b-bc75-4a9e-bd34-950bc6663666@suse.com>
Date: Wed, 13 May 2026 10:06:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] tests/paging-mempool: Testing for P2M relocation
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260512155540.1733403-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <20260512155540.1733403-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1778659614-7FB7DD75-A9CB6B13/0/0
X-purgate-type: clean
X-purgate-size: 566
X-Rspamd-Queue-Id: B3BBB52F559
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vates.tech,amd.com,xen.org,citrix.com,kernel.org,gmail.com,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RBL_SEM_FAIL(0.00)[192.237.175.120:query timed out];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 12.05.2026 17:55, Andrew Cooper wrote:
> Andrew Cooper (2):
>   tests/paging-mempool: Misc cleanup
>   tests/paging-mempool: Extend to test P2M relocation
> 
>  tools/tests/paging-mempool/Makefile           |   4 +
>  .../paging-mempool/test-paging-mempool.c      | 222 +++++++++++++++++-
>  xen/common/memory.c                           |   2 +-
>  3 files changed, 223 insertions(+), 5 deletions(-)

Acked-by: Jan Beulich <jbeulich@suse.com>
ideally with line length of 80 chars not exceeded, as looks to be the case
in both of the patches.

Jan

