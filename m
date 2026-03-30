Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OC2DJt0rymmQ5wUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 09:53:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FA3356B28
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 09:53:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267261.1556797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w77QV-0007al-5L; Mon, 30 Mar 2026 07:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267261.1556797; Mon, 30 Mar 2026 07:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w77QV-0007YN-2W; Mon, 30 Mar 2026 07:52:47 +0000
Received: by outflank-mailman (input) for mailman id 1267261;
 Mon, 30 Mar 2026 07:52:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w77QT-0007YF-K0
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 07:52:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w77QS-00E9Fj-SU
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 09:52:44 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ca2bc3-2eae-0a2a0a5409dd-0a2a45088cd8-46
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 09:52:44 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69ca2bcc-1950-0a2a45080019-d155dd29a946-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 09:52:44 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-43cf3ee0fc1so908138f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 00:52:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf2471ee2sm15826666f8f.29.2026.03.30.00.52.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 00:52:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1774857164; x=1775461964; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d51HySKidONBjxhWEIOhZg/Myko4MA48dlh0bdk2DWI=;
        b=HfPX4QcH5LAQ795sFOnt21WV9YHymLxH02iCTjcxAtzimMG+cIg3rfITp7UPD7/W9P
         aFkYezb3UDhx/ax7JwPfX2tNfjWwRhXXoQx0Ll7TiSpq9SXLrT9Iv6qJa+fD7wHLzRXz
         M2CtvGJS1mF+ohjX3aUoog6NOPXNM4QSzpC4nWZ9uWEfnUGdpiTTj0CUBbXfdreXL3Da
         /RV5Rz09bijR1jX+VvJbD9Zm0H49o393eUDupi0XWYL6KV3lYTzH5l1B/2eS6mbrkrBv
         bSrT0mK5eJVuMtTkL/zF54MiGPJx18w69eXKn8IEjQQm6G6ZYcMSmu7UmLZoKtLDMX3R
         q+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774857164; x=1775461964;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d51HySKidONBjxhWEIOhZg/Myko4MA48dlh0bdk2DWI=;
        b=mEdAB5xLlOSDy05bZwBb0+oNWAUiRqsn6nmunTFRDRxmFlcBQMltk1OmVrgtLt6t4n
         6ITmV/t/NWaWXSo47bdF8AKlhVEIM1dLZCzZnO0e9S5Q/VVyl4mooxH1JyINdgtKo/nF
         6B4Y2BaYjvk4cNANp7tx8KQcY2OteQeN4SLxLhdhP1PlfoMzKvC4vS/p+ldvvw3uQOjD
         fT3E+OkReD1E+jVy+f59x/4qsOIKFn7GjnaqWEnbAWAcNXolXUOnc/p4T1mcIkVSIa8a
         A9qG60Md7L6GfCUrqayqLe3DXUKukxP1CabQJ89aTVurg5/M4ywK6zsTNaX/j7Qx9US8
         aBVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg2tp99pJhv94sKrxj9EMVPxeCba3j65dBZVsUMx6EFp/aWzH3u6rXVNh4t9i/PqrrMkVb7BxjKp4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxdJYC35Cs5TJPxPeORfH8soTimWVf7BWmy1GSIrGXKX61ya/in
	n31OguvY5Qzg6MNdjTrmeAoPHAgxpyoDnlt5n1NGjvhAfJeHqSTEYT7mT8puTece+w==
X-Gm-Gg: ATEYQzzkEEZ48Ren/LWneaSng3ErDRWOBtlXWbsV6LDXx1SgilAt3Vt0K3KZ02AJmtF
	8Tpg1aHtMAMXuTgxJIa+DN+g05yUFjrPqFr7GCn2NDqpd+LZmepVATZq2gP/tiaSMvjNm9DdGh4
	8XhQoSUxOMDSJ/XhPgmX+omk2kz5ySxSSLbgnFCrw92QX51h5MQEwPKmoJljIs1fHOzDjOSBIAy
	tUBWOAsqJKbeTW5FPXqX43cZISNP9tP00T5suDjtjuYEMQyTOHO3hsXxEYvGZfmagVdUAnBp7nW
	0h+Tk+RxwF+J2cQgxtmlS5QoD2k1AbBje7upetCoND6xq40l0LPk+EMCBfMxyvlK06EMI6n5iGQ
	726kXBYu5vOx2VDm5umCgEXQG33R6c0fQQpM67fADN29JOgQK4sm+Z+c4ao2UJuoAMOmDeHmmVB
	E4mfHHV1ZAcUmJFKgwOzjd8S1O1EFILDKdwdDY6pmY1w7Tw2DqdcCL8vYKmu6oqP7DC0pRCSJJO
	El/pHwUUH9LBic=
X-Received: by 2002:adf:e183:0:b0:43b:4166:b855 with SMTP id ffacd0b85a97d-43b97a4b81emr22093213f8f.14.1774857164087;
        Mon, 30 Mar 2026 00:52:44 -0700 (PDT)
Message-ID: <7ecad1d7-75ff-4bb7-89c1-7f51398b156c@suse.com>
Date: Mon, 30 Mar 2026 09:52:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Configuration for Linear Address Space
 Separation
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260326131815.1139203-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260326131815.1139203-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1774857164-E2892726-00350388/0/0
X-purgate-type: clean
X-purgate-size: 979
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D0FA3356B28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26.03.2026 14:18, Andrew Cooper wrote:
> LASS is a feature designed in the aftermath of Meltdown, which codifies the
> user/kernel split in address space in order to block entire classes of
> sidechanels.  Specifically, it allows the CPU to terminate any memory access
> into the wrong half of the address space based on linear address alone and
> without needing a pagewalk.
> 
> It is available in CPUs starting with Intel Sapphire Rapids (2023).
> 
> For now, allow LASS to be opted in to, but leave it off by default.  Some work
> in the emulator is going to be needed to enable it by default.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> Abdel is going to look into the emulator side of things, which is going to be
> easier with this patch already in place.  I intend to get it fully supported
> for 4.22.

It indeed as "as simple as this" if you leave out the emulator part.

Jan

