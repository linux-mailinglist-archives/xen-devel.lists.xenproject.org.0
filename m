Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM8pN2z9cWmvZwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 11:35:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE3F6550E
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 11:35:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210755.1522371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vis1x-00061R-AH; Thu, 22 Jan 2026 10:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210755.1522371; Thu, 22 Jan 2026 10:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vis1x-000600-67; Thu, 22 Jan 2026 10:35:13 +0000
Received: by outflank-mailman (input) for mailman id 1210755;
 Thu, 22 Jan 2026 10:35:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vis1v-0005zu-Bm
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 10:35:11 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0629426b-f77e-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 11:35:09 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-43246af170aso504333f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 02:35:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43595e0a6fasm15676442f8f.10.2026.01.22.02.35.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 02:35:08 -0800 (PST)
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
X-Inumbo-ID: 0629426b-f77e-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769078108; x=1769682908; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9W697KmD3NrZjlIy5dYmKifNka1kkrawLJNHvYhEe3U=;
        b=M9bouvtzjpuksnQ0+UEkO+qscruyNes3WOmsHuEUtPLnlcKfMDRw2GH+7obBGsdzcK
         Galc1baJy65fhZ4yHTtlCocjn674TnbJN/0mTjvn6pdTrmbu3X1jPmDZnyBu7hqgtRU0
         ENDi9SKsUW0vOldKkIZMvJ3pSYx5lkkcl7wSgMpc4PvOOOEuDhSw7MMCOPxUjkmB/zTB
         OqHKbEPYY874sWE3KbJOfbMb73SnqsfXQiN3JGtfupHFuYNbNUiV9HUNabUX5OgLNMsS
         yfyVI82SjRoFa0jYPT1sJgkMmv6U6xdv0AcdkLDAxVGi1bd4wkosusENGOgZFaVuAEfy
         M4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078108; x=1769682908;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9W697KmD3NrZjlIy5dYmKifNka1kkrawLJNHvYhEe3U=;
        b=kfA8FGEVmttpxAJWf8YUoaf59Qat//5DukX3Xd065Ycl2c47DFRIQEO4LJ+3HK03IT
         iiGERNio11hZf2avok8euUrbVQm/sn2wqYp1rwhVcZhKnDXzFzdfiqM8xBVnD+WAEiYC
         SxXLWhe8fk7Fot2xh7E3d+aNCqh40rz22TadD944ousbpoSm1YMZgaZRHeg0Iz8kancu
         Vw9nxBuEozjO4l/um86U8X1CqWN6LQQ08lcPMTUIiJzABnQ6BQuoNaSHkaTxF9MJyoEY
         nnWN7vt1h2yvEJqp+JMfGf/kf3o5mXuKR07xFCI8oILOvzGpWN8TH12p/2573sUJZiLF
         0N1w==
X-Gm-Message-State: AOJu0YwN21RUm/8uEFIdKdnVvp1Af3xcGAzZIR6SGoOP0lBZAmSRuTLj
	46jMiPpGA/sLTvQwOMeg77ztp0SbDEwQPdKEEaXwLM9ha9EBSxJBdcYlALcmFiQhi170kSbUM4d
	jpPA=
X-Gm-Gg: AZuq6aIvSFwWuazTEPnXZKRsKMYvvwymsWJsYMLVVbDZTT1/sV5dQhvR9YlodlaAsbe
	rCMhhq5AvCrwNMXnjSdSGkDwLH5hPRGez6DZOACkYWvMRP4aX+bTXj+J0t3MEAKQV0ZOcfGmyiI
	Z5v0AJh4oYmQz8M+SL9Y4oPxgzPhm+quaNjLAZS0Spm0Sl9W5bQqHfdNebS+2XXrwY6KIJWrJy6
	1fh9TKltN+hP8mvPaLW/TgWSyO4z5V0jr+o3D04Zz89L6W1PNrfM6M0IvdLddzI2N9EBmN6VM0Y
	UXFnbjr+Vu/J3WB3G47zPdatJf0bDTEpwY7Ef0yVblPHjRmucVVcjq0PY3mqLyL3ECOkEe0zX9e
	FXvow+yOkiIlgqIk5/i+hCZeupqn7cRQtpd0RcAnI4Im4zCSyYzyxkeLHxv4WK63K5C15muHdoa
	Y6ZqSUKQDk78qDkJZkEQDmjLbWYHGjJ0aOCcSz7bE9UGSW+5n71Ep/140BwKvQ94dq/QoxAUPBa
	EY=
X-Received: by 2002:a5d:5d0e:0:b0:435:953e:5897 with SMTP id ffacd0b85a97d-435a5fe530emr4442812f8f.25.1769078108497;
        Thu, 22 Jan 2026 02:35:08 -0800 (PST)
Message-ID: <72bff85d-9771-4998-bc80-1efe2d453e6e@suse.com>
Date: Thu, 22 Jan 2026 11:35:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] x86/HPET: don't arbitrarily cap delta in
 reprogram_hpet_evt_channel()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
 <37cdba83-9bf8-493a-9a7b-5ec11c32159a@suse.com> <aXH6rwF7pJbPpxOV@Mac.lan>
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
In-Reply-To: <aXH6rwF7pJbPpxOV@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
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
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8DE3F6550E
X-Rspamd-Action: no action

On 22.01.2026 11:23, Roger Pau Monné wrote:
> On Mon, Nov 17, 2025 at 03:40:08PM +0100, Jan Beulich wrote:
>> @@ -162,10 +161,15 @@ static int reprogram_hpet_evt_channel(
>>  
>>      ch->next_event = expire;
>>  
>> -    delta = min_t(int64_t, delta, MAX_DELTA_NS);
>>      delta = max_t(int64_t, delta, MIN_DELTA_NS);
>>      delta = ns2ticks(delta, ch->shift, ch->mult);
>>  
>> +    if ( delta > UINT32_MAX )
>> +    {
>> +        hpet_write32(hpet_read32(HPET_COUNTER), HPET_Tn_CMP(ch->idx));
> 
> Should Xen disable interrupts around this call to avoid unexpected
> latency between the counter read and the comparator write?

Such latency could then still arise, due NMI or SMI. What's your underlying
concern here?

Jan

