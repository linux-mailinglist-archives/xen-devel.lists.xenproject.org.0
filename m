Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MqSGCDgJDGrSUQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 08:54:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3C15786F1
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 08:54:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312426.1582518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPELX-0005Oo-VG; Tue, 19 May 2026 06:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312426.1582518; Tue, 19 May 2026 06:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPELX-0005MU-SI; Tue, 19 May 2026 06:54:31 +0000
Received: by outflank-mailman (input) for mailman id 1312426;
 Tue, 19 May 2026 06:54:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPELW-0005MO-Sf
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 06:54:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPELW-002sa1-8g
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 08:54:30 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c0910-2eae-0a2a0a5409dd-0a2a45078e26-18
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 08:54:30 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c0925-229c-0a2a45070019-d155802bbd4c-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 08:54:30 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-488b0046078so28142595e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 23:54:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe53ab671sm308183535e9.1.2026.05.18.23.54.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 23:54:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1779173669; x=1779778469; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Wmu5e1tpzklBOlYf+M5dndt3/PCcAx4cpV7DzEBBG3o=;
        b=XiLHlfOFsRc1U3T4elHD8Ra+Yonud4FtQukme8jIff5OvqKl0Ch1dS/CAT3FrG13sz
         iGdKQgf7g1bRBiFIyG6mqOFERND9jDaT6im1vEkv+3u6geRHTIWcwhE+nymHeFxta/n8
         0oQ14/J78Bd/3H4Z47ZuNh4TKiw7HarKe7dVH8zQon16m+oggF2e8pDL54y50b3Gblqn
         /6fwEpLnKs69umVB5PIl8rLcC2r3zOx7lyIseDwCyF0ml8evsRoaydFXd53uiIrGIeEj
         IiQbRf8Z60ToRJC+yWC14B0VfT/abjAoKU8hRTc+g4L7l6ExpiRiXvhKXAg0BfBYAEbf
         Cg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779173669; x=1779778469;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wmu5e1tpzklBOlYf+M5dndt3/PCcAx4cpV7DzEBBG3o=;
        b=tKCUvCHXlDrFa1qIdyAvxTIGHbE3IF99CjX5vG+z2ZLEJ8WSo1enJ4W2B05AC43xoB
         +HxCeZmPd5mPyiEnjfiQOcfCcddctIw8fVx09016ku+6EWq8GUPtgCn5MbK7PM3bzYNV
         6UTk5801O3um4rMmiEmqWWbcZ52v86O+PWUgjyX4a86Y8QBXazz2E3R7HXURU5T8Fheg
         VFIvsX8ydjcoQ260L50O/y7UbXZogzrRZ4sYlt8LyvELqWRh0BE7O9AUaK4+cg/DkhT2
         QdRUj1drKxt2b6GhieHKp5nXo+YQEDl5mhoTZa2V45Fq8zVD4AiVQieLgpL6j3Sv6oUj
         FJHg==
X-Forwarded-Encrypted: i=1; AFNElJ+28FLyLUVsQ/2GI1MtCummyFv5fNMsOyxphe0S28DIhgX3lL3bGajbSdIMgBeElDd0X+EQyQnmYog=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5SelpKgpu8FSq2nBCETSUJIhyG+pv35NLCWzPuVMlevRljl/E
	w6567vVjACkx1VmPG5X7WcG5BaVMmX07eZKdCRfuQw4ehGz9SNjM2Pz3Ru3LOUO+CyHF80o8g6R
	fvfQ=
X-Gm-Gg: Acq92OHr05wFWLIrgefJF7zciMYyWq+MQg+CiSGNPJZT5EmrDtQrvCPjmhkZG5dkDbb
	IzbyQFSBzftwqUKfVJKdNOtACpMTDp+5KY8CMtdyJrG2tAur7umZZ/bF4xn+Mb5XtDsa2a+l/0f
	OoUaVGpiPbjdofhLR+QWp0yxfyBdu5fizuecW6Gg3Bg0uj9KqVPOoxtS/uV5d4O/+MWd/FP0jlp
	fWRn8xI2AQax3cMWklDJkr/E9rSfnSNW5Z3+2v0bb9KKRh/m+pA+CiR98mlHd650tIdd1agOKHH
	drRJBpWHUDZxmva4tBv+FhcZUSbtG/8etJwz+HbCI2HvdQb7QU1otDK1Gv9irnWpyb9JIvNFIzX
	j9qsSPRUZO2Ph5aGfmTVJOnMYgTNfQFXOzg9WhPvTHjB5/KkM3jPnCxHE9tMJxfquCs8FZgPj55
	UinkjkLHd6r1vkJibHFEBX9WcdLx4EV7PyBguJneH3QikN3UbzoiU1W0WhXwVHUmpiD3WLMYqwl
	KItOTfQOejl9rU=
X-Received: by 2002:a05:600c:608b:b0:48a:58ae:9933 with SMTP id 5b1f17b1804b1-48fe61ed232mr288393135e9.18.1779173669612;
        Mon, 18 May 2026 23:54:29 -0700 (PDT)
Message-ID: <8b0ec241-4636-44ff-917b-1bdadc03f6f8@suse.com>
Date: Tue, 19 May 2026 08:54:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22(?) v2] gnttab: simplify (really: drop)
 gnttab_set_frame_gfn()
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Rafal Wojtczuk <rafal.wojtczuk@7bulls.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6e3dbb4f-5849-4525-8f8b-a2818c39da2d@suse.com>
 <93e15ff8-a313-4f19-84f1-2906cb2ade1b@amd.com>
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
In-Reply-To: <93e15ff8-a313-4f19-84f1-2906cb2ade1b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1779173670-2176AC48-810B261D/0/0
X-purgate-type: clean
X-purgate-size: 1007
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[xen.org,kernel.org,epam.com,arm.com,citrix.com,vates.tech,7bulls.com,gmail.com,lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:rafal.wojtczuk@7bulls.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6D3C15786F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18.05.2026 20:00, Orzel, Michal wrote:
> On 12-May-26 16:46, Jan Beulich wrote:
>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -1844,8 +1844,7 @@ gnttab_unpopulate_status_frames(struct d
>>          {
>>              int rc = gfn_eq(gfn, INVALID_GFN)
>>                       ? 0
>> -                     : gnttab_set_frame_gfn(gt, true, i, INVALID_GFN,
>> -                                            page_to_mfn(pg));
>> +                     : guest_physmap_remove_page(d, gfn, page_to_mfn(pg), 0);
>>  
>>              if ( rc )
>>              {
>> @@ -4285,8 +4284,6 @@ int gnttab_map_frame_begin(
>>           */
>>          if ( !get_page(pg, d) )
>>              rc = -EBUSY;
>> -        else if ( (rc = gnttab_set_frame_gfn(gt, status, idx, gfn, *mfn)) )
> status is now a variable that is set but never read. Remove it.

Oh, good point. Thanks for spotting.

> With that:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks.

Jan

