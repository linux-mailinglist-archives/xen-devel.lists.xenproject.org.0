Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFjIATfr+WkLFQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 15:05:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F694CE25A
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 15:05:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300666.1575188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKFT9-0004ry-Tq; Tue, 05 May 2026 13:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300666.1575188; Tue, 05 May 2026 13:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKFT9-0004p0-QW; Tue, 05 May 2026 13:05:47 +0000
Received: by outflank-mailman (input) for mailman id 1300666;
 Tue, 05 May 2026 13:05:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKFT8-0004ou-Rb
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 13:05:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKFT7-0067Fn-QL
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 15:05:45 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f9eb27-e002-0a2a0a5209dd-0a2a4503e2ba-6
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 15:05:45 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f9eb29-672d-0a2a45030019-d1558036e476-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 15:05:45 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-488ad135063so49646005e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 06:05:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8eba8487sm347010355e9.11.2026.05.05.06.05.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2026 06:05:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1777986345; x=1778591145; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oaToR717o0d1XMQPScFeyt3h9HFxwBrAXn+7rI/dfPI=;
        b=e5vOzZ77UR7ZMw+HodkMkIXpuF9GnNPcbmOkLeYqQVbddckwEJqw2EVBLauK+WQwsu
         Ix/b3Rs5SozvcKZ2hpd5h4T37UCmBiBoLhWOeJfMK6Vic80RefhhA1V4QpIep0rOCxpi
         kTfK2ogm2zhkUJ34D/BDt15bf1bNhMsT6xulNfxy+IK1jXOtXO75FJpEbX8YXNE1QNdB
         j0cGopKh6ZBY/lndo250ZmUy7Y8em+q1qC1sk5KywRGeaKlG44TGSuuK+PM51tjXc6dA
         8epOd82Ni8u1vryagfy5n5FWiv6fqqHp9Hg9abllnR2VFA/8Pqzq7GvyX5ofAoj+sFuW
         4fWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777986345; x=1778591145;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oaToR717o0d1XMQPScFeyt3h9HFxwBrAXn+7rI/dfPI=;
        b=YtAF6hGmkVBGSCSVmkJ2yMWowFs/P1lYtFrWTZ2emTqocD2a3kkGs8hbxztF2cJlYL
         LLa7LmRGdZHPaVzVER7s2EwUh5XVOrouVNITGWcPtq8arBfMnl8HHXxVoiWbb3yBpWqO
         wXOJspNjoqBzuOm1in1xmL7hAA8gGBVMjn6GM9q9YuCnNQu7VxvWimdJYv8MKM8pqNSS
         XRh219l58n17Z0ejDuiuxr8U9q+07a/0b+OYundf3rE+3lKXdccWYJzsG2N+i2JlWpBO
         GqQ+w88x0/341aT57DlxLP+WGg7HAzqXhQB1eoeYFMccklIHD3MVv1ggwfKsMDno29S1
         6lOw==
X-Forwarded-Encrypted: i=1; AFNElJ9hYLyqBx/R2fljhHgo8A2gHGdKObR+XYo/bQO3UdoRO0jkrncFrR8mHOsz9tjns5i4LGAKvz7LHi0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywbr1JwgKvkk87ppqpULPQhT0cS+ibebI4pZLYkBNJvTj/HjCGB
	0TY8uXQN5IvYryGewCM4fj6jmhBN3U9arkQiEAduXOirD09X+z9lieShkXvy6PVBlQ==
X-Gm-Gg: AeBDietdGpYgDmre/tptZObvyUfQOs7/7ufSRSOZ5xDgJzNVE5qUmvWgIzH0CKXJpBe
	R6ZcsQ24pN5Y2J1jKaD9nnQ4gcBNEXCY4UxQcDacxcBrN4p0ZllVbg2XdphA8s9l0cWsfMR2cNV
	nO0Wo5GKbYPd3ASb7bRSXfjx5m4WtrLKcCCYInvo5RVyBZgz7zPt7Yo79R+vlld7Zh5NkKvIwaM
	zglVkqiiJX9ZBHmt8NR8NpUNTBgHVjmBTlL/z1gP6cmB+CwoZcz3vXMJ2o3PrkLRjLSI6XC+kLB
	a5/thxTq/iXBNvoQJ0M3sJWu0Xud6CnpXpr0di1C7qggbDoYBEC5L8amCRxBTdrNm7sdHAk/rMn
	Xs+GBmKKSzaab4YengQZ38rpOOAywhHucf2twnZ2XxRGt/WPnh8QMJ5xWF2OeV/pgK7/tpTZhas
	FIw/NrntVzQz2nAE45wX/AiKqbBwUUFrg67ns1wcmb8FF63kdcBvav+siFkDdA+QlYYLL+cV9R/
	6011Rv3PyoF6b/ArDQmXmROOg==
X-Received: by 2002:a05:600c:8b47:b0:485:364e:9328 with SMTP id 5b1f17b1804b1-48d03b41c4bmr165692595e9.16.1777986344881;
        Tue, 05 May 2026 06:05:44 -0700 (PDT)
Message-ID: <661c18d9-eceb-4a4e-ac2e-37a6931e06b2@suse.com>
Date: Tue, 5 May 2026 15:05:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/pdx: account for frametable_base_pdx in
 generic pdx_to_page/page_to_pdx
To: Michal Orzel <michal.orzel@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260430125103.401811-1-michal.orzel@amd.com>
 <20260430125103.401811-2-michal.orzel@amd.com>
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
In-Reply-To: <20260430125103.401811-2-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1777986345-A3161938-C8F2CBB9/0/0
X-purgate-type: clean
X-purgate-size: 974
X-Rspamd-Queue-Id: 52F694CE25A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 30.04.2026 14:51, Michal Orzel wrote:
> --- a/xen/include/xen/pdx.h
> +++ b/xen/include/xen/pdx.h
> @@ -132,8 +132,9 @@ void set_pdx_range(unsigned long smfn, unsigned long emfn);
>   */
>  bool __mfn_valid(unsigned long mfn);
>  
> -#define page_to_pdx(pg)  ((pg) - frame_table)
> -#define pdx_to_page(pdx) gcc11_wrap(frame_table + (pdx))
> +#define page_to_pdx(pg) \
> +    ((unsigned long)((pg) - frame_table) + frametable_base_pdx)
> +#define pdx_to_page(pdx) gcc11_wrap(frame_table + ((pdx) - frametable_base_pdx))

If you alter these, ...

>  #define mfn_to_pdx(mfn) pfn_to_pdx(mfn_x(mfn))
>  #define pdx_to_mfn(pdx) _mfn(pdx_to_pfn(pdx))

... how come these can remain unaltered? Maybe you have some special
arrangements in Arm code, but surely in generic code transformations done
should be uniform. After all

    ASSERT(page_to_pdx(pg) == mfn_to_pdx(page_to_mfn(pg)));

(and alike) ought to be universally true for valid inputs.

Jan

