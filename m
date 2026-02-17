Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DVdCytElGl3BwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 11:34:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9278514AE3C
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 11:34:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234775.1537895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsIP7-0006El-IZ; Tue, 17 Feb 2026 10:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234775.1537895; Tue, 17 Feb 2026 10:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsIP7-0006CX-FX; Tue, 17 Feb 2026 10:34:05 +0000
Received: by outflank-mailman (input) for mailman id 1234775;
 Tue, 17 Feb 2026 10:34:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RxGT=AV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsIP5-0006CR-W2
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 10:34:03 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c4f2e43-0bec-11f1-9ccf-f158ae23cfc8;
 Tue, 17 Feb 2026 11:34:01 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-483487335c2so38294385e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 02:34:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48370a41be2sm176627595e9.1.2026.02.17.02.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 02:33:59 -0800 (PST)
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
X-Inumbo-ID: 2c4f2e43-0bec-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771324440; x=1771929240; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rMHP5nZ7nvK12wNfN/+6KSlVo6AusYlohOMqI3C0yIc=;
        b=CgJp1r6KCALFWLuoPqkkztgu8unwyV/3VdlNEjpepXi6JxXJ6weeQVhLUYL51ZWgRM
         T2c0lLs9QhdrB+Ua5oWR63PJY+XMlEj5lVq3WMpTRKSBBeOZr+CERd/YNrjPIrIxiwyN
         X2N3jNtY5GN8BqOXFjy4gRTQNGr7w3oncqHM3I2VXma/0LZwJBqlJo3zBzqT9vQJy4+I
         dhVltYHk7GiTCTPkhibSzXnjx3/Birh+xUZj7b7bca+rSg9fu2jVU+nXCmmr586JC5n6
         8JDouMzE2+ZasIbBD+YkNCTrCquuz1ZUNRB9qOxxVjVQY65B1MMmvIlpE0SQeMKjhune
         h/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771324440; x=1771929240;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMHP5nZ7nvK12wNfN/+6KSlVo6AusYlohOMqI3C0yIc=;
        b=ZVDI0yPM+5l2WDFr+pRYliZA6F2UVU3vVQfpDrlfy+q/QRfPMsP1jOy2j9U0iLDIdN
         zXS3iQhL+4ux8Jy9rQverqjLEWdALpvZjVDKKJQ4yRv73MpcNNkj2/t3XkI1Bhk+biCz
         wYv5/5cjrEzzHZ5PQ14sbCPlgztHpbqTSG4BJL+fKAr/aAe66lIL6WZdMbQoNd6v/0XH
         5b57fWEsdzxJC5QKzaGgUuevjiIAW5vy985N3H9mfLp+anSQZoTxv8jK3HRs+uqhcxAS
         EHsyURwV89P9igKczmHS6ekT/RFDadsSUHdBOCl0zlMgNehNUtc10TidEdvQKfSANvjZ
         Br0w==
X-Forwarded-Encrypted: i=1; AJvYcCUpY2XI8v5ryeE9FdevFDsC6kEAanrgqDA5vgd1xe1KLaeuqE1tnAb36t/vH8LkK908a/tDTXxOUUk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6tMNkK9Hkz85HxYU6skhET/0fyVJcsCTPXi4vU7hPqR4PR21g
	KNsE5oXL8XLC0cX6RtJ64pd4IpS0nfTfQA6XNHPJuc2COnrJvKgO0jqAg4W43Ywl+w==
X-Gm-Gg: AZuq6aJZ1XWphLuHWq392rjHH71jjiW+4Ks9h6KAEyKSshI7m0a6FKKt0KiAL6uLQTk
	ZWqo2Y+0p9KbUbUDAdUUAuO2ad5x8O10Z4s2M8OicC/mEMTe9KFzNr/v5396J1PbVPdZlGa0qcl
	2RbwUYVwvZlu8vNrXOYg+AmsWQyTaUOcSuOuk4Um5L/NoRykk2QT/Vpz3DlrqKuhWR+8Y/3vdK4
	hA0hGUkYJynbaNIowMFbKzqtntNublJQ2wYMT69pymhy4+YhRyGopw2GyPRXax0CKT3VxvXg1Ot
	lzVvVSq+lpa67J5mjMlMRK+kcKbjQrBxdvBs95EowmlmBx36atsgheuLj7+KZxKnt7y2WzJaSwH
	GiZlSc6LPQD4e9BGJifd1F1NW+Bx+lcnNDWl0IK/6f287LWW/qypQJne3R3bBeE/NoNd5eYuX+C
	w04oTlHS4RIwZ9Hdr0QmWCgOtQKXRNWJo1zN3DhAWCjqO0LwOyUQ4CD8JpgnuNvFH8BAIBQ1wiy
	NCBy5cHGrAo6pMtDZ2V+EU4BQ==
X-Received: by 2002:a05:600c:a113:b0:483:7ce6:1efb with SMTP id 5b1f17b1804b1-4837ce6228dmr142453405e9.17.1771324440279;
        Tue, 17 Feb 2026 02:34:00 -0800 (PST)
Message-ID: <4d956442-d73d-4b50-9aa0-6603b5734c1a@suse.com>
Date: Tue, 17 Feb 2026 11:33:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wait: drop wake_up_{all,one}()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3f1fb7a3-0abd-4df0-92b6-2bb6d78c6422@suse.com>
 <14d94ac0-f193-4344-bb04-f4bf1061d39b@citrix.com>
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
In-Reply-To: <14d94ac0-f193-4344-bb04-f4bf1061d39b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9278514AE3C
X-Rspamd-Action: no action

On 17.02.2026 10:47, Andrew Cooper wrote:
> On 17/02/2026 8:35 am, Jan Beulich wrote:
>> wake_up_one() isn't used at all, so violates Misra rule 2.1 (unreachable
>> code). wake_up_all() is only used locally, yet rather than making it
>> static its sole user can invoke wake_up_nr() in the intended way directly.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/common/wait.c
>> +++ b/xen/common/wait.c
>> @@ -85,11 +85,6 @@ void init_waitqueue_head(struct waitqueu
>>      INIT_LIST_HEAD(&wq->list);
>>  }
>>  
>> -void destroy_waitqueue_head(struct waitqueue_head *wq)
>> -{
>> -    wake_up_all(wq);
>> -}
>> -
>>  void wake_up_nr(struct waitqueue_head *wq, unsigned int nr)
>>  {
>>      struct waitqueue_vcpu *wqv;
>> @@ -107,12 +102,7 @@ void wake_up_nr(struct waitqueue_head *w
>>      spin_unlock(&wq->lock);
>>  }
>>  
>> -void wake_up_one(struct waitqueue_head *wq)
>> -{
>> -    wake_up_nr(wq, 1);
>> -}
>> -
>> -void wake_up_all(struct waitqueue_head *wq)
>> +void destroy_waitqueue_head(struct waitqueue_head *wq)
>>  {
>>      wake_up_nr(wq, UINT_MAX);
>>  }
> 
> The diff looks wonky because you also moved destroy_waitqueue_head(),
> despite wake_up_nr() not being static.
> 
> Keeping destroy_waitqueue_head() in it's old location will make the diff
> smaller and more obvious.

The diff size doesn't really change. As to "more obvious" - yes, the deletion
of the two functions is more obvious then. The "keep the UINT_MAX use" aspect
then becomes less obvious. That's why I did it the way shown. I'm okay doing
it the other way, if that eases it making progress.

Jan

