Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPNEJmKPlGk9FgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 16:55:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 035D014DBD2
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 16:55:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235191.1538245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsNPN-0004Vj-Q1; Tue, 17 Feb 2026 15:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235191.1538245; Tue, 17 Feb 2026 15:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsNPN-0004Sg-Mk; Tue, 17 Feb 2026 15:54:41 +0000
Received: by outflank-mailman (input) for mailman id 1235191;
 Tue, 17 Feb 2026 15:54:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RxGT=AV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsNPM-0004Sa-3T
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 15:54:40 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f64f7c26-0c18-11f1-9ccf-f158ae23cfc8;
 Tue, 17 Feb 2026 16:54:37 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso60150065e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 07:54:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371a10cacsm184693985e9.4.2026.02.17.07.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 07:54:36 -0800 (PST)
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
X-Inumbo-ID: f64f7c26-0c18-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771343677; x=1771948477; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JKjnb/1WYws54/LhSk832/vT6iv7kP43DoFElbFaMTY=;
        b=D7q1RdXTAQyO2d52wCYvkg+0VZTbj1OcEBYtuY90FAPHEx9qLr1oZrybPWuW5F6Oof
         v6f3wOsGAodwa5l6DXYumsQdSGWoJk7QUbdJe20ZfIo55d/bAtQdbClhRGfqyVs0DMsY
         qOu6/NAlmP+itICpAM5zTwTpEM1IwiRoAMR97ShX8U1R7FBastrSTrVpFSKdmzBQLL6k
         FzjHg9KLYxXBKPFKrUdZ+SFeqt490zU2juGR5+v39TcJher72XAbxCVmm8IROZzxKsBW
         LGjjdLgkFzYT/xa8m9Q+jAv6yJHTjlZIa5nhHW+nfM9IUthJcvYS4YtV9uDqdYDszwGv
         nIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771343677; x=1771948477;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKjnb/1WYws54/LhSk832/vT6iv7kP43DoFElbFaMTY=;
        b=Mb9qe3kI1RMqyepHvM23VaUYYnObeV1VvGOjizJtqkS73WyBhjvEejqJS9Q8eTCN2h
         zK2lQU9U9OfsHvV1u6mudH+WP1Cz1+vWe+fjHpR2z/CJYR3w3xD2vZv9qdD2WD0Hoq3k
         c0SLQ0Eb2mdLWW46DmIS8g4FNJs5yjnluobGBe0ZR+qE2yACa2E7kaL2zOdY//YVtvYi
         iaF4xxLrR6VxIOh5mgj9fV74CGtBdMxlCcmJM40Mm371wuc0rR21U2lLFgFx7s65kMuT
         0RjjhvARizFEkCcXWl1VvBEVKzylLxhD/i5Kd8r2Bd7LfR6xNOZuZu0S9DJDVkOoDOHZ
         qzLw==
X-Forwarded-Encrypted: i=1; AJvYcCXAmRz0iDxX7fLOE4ycYB+3zMQVxHuHHEx/c/9AJ3PTDhqRP2VGYuvZHcI4uBh4iVHrVJ+T7edQbwc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzzXn3pp58OoqIM4dAFvcdWFvOzEWicDbMIXJIK/FwcQdVomfYf
	0/2F+r66zOFRaGGjFQwrYw3ai+PZ1MzVuve9nXMGGuEsQU8mS3yz1Tn89luEDtTHfQ==
X-Gm-Gg: AZuq6aJzPp049f4OeR82vKrMSOknrPVOFy7/ypz81s+011YlCLG0Udy8+CLwWFVIao/
	M1F9/wUPnr25rgHQxEqw3JZvssjwod3WoLTCCBdkrb3efvVfuwYNWjOWpNcti9dNtmRbCPtGYId
	sIBzokIwmUt68rYrFC06FvP6c60Kk3vMbYNberadC0tT2N/PIWbJPWzEruFcWufXOo+/vf0eFrv
	2g6leXi5CaS+06CtVQUNjivs+hIXxZxxn8F7an8gl39A8l8B8aU+aZd05ZcbQfjtuTHqkiYhOgK
	c8hfdVVemuPQcuwzNMgtCx9VemwzghhibE99H8D1lVsGimdyXcCYulf1JuMJHN3Uwp+JjuBdY/T
	PuWUZpR1ADVymIZfTvwkp9kS98a2VAWSc58yF+uaIQPSkRQnT08HqAGZJAmSYlvaPAbh1Lzwfmz
	7ngHMyn7D5/399yOmgzytPbvZ4XjGxecghqzB2iHFeafXqQ0lKMoLpcMkD89I3VbWzzztEwBxxu
	MnKaKQCdaiJGww=
X-Received: by 2002:a05:600c:4eca:b0:480:1c1c:47d6 with SMTP id 5b1f17b1804b1-48378d6a4c5mr232918615e9.6.1771343677165;
        Tue, 17 Feb 2026 07:54:37 -0800 (PST)
Message-ID: <9163d0b9-f77e-4c13-b986-2d890bdf8ccd@suse.com>
Date: Tue, 17 Feb 2026 16:54:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Arm: tighten translate_get_page()
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1d898900-1072-4ea6-ac4c-1262905cab29@suse.com>
 <abd54c11-28fc-4487-a2f8-733007d361ae@amd.com>
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
In-Reply-To: <abd54c11-28fc-4487-a2f8-733007d361ae@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[xen.org,kernel.org,epam.com,arm.com,gmail.com,lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,suse.com:mid,suse.com:dkim,suse.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 035D014DBD2
X-Rspamd-Action: no action

On 17.02.2026 16:28, Orzel, Michal wrote:
> 
> 
> On 16/02/2026 16:20, Jan Beulich wrote:
>> Permitting writes when the P2M type says "read-only" can't be correct.
>>
>> Fixes: 1661158723a ("xen/arm: Extend copy_to_guest to support copying from/to guest physical address")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks.

>> ---
>> What exactly p2m_ram_ro means on Arm is unclear: The comment next to its
>> definition says one thing, its use in get_page_from_gfn() says another.
>> (I remember raising this point before, i.e. it feels a little odd that the
>> ambiguity still exists.) The patch here assumes the comment is what is
>> wrong.
>>
>> --- a/xen/arch/arm/guestcopy.c
>> +++ b/xen/arch/arm/guestcopy.c
>> @@ -44,7 +44,7 @@ static struct page_info *translate_get_p
>>      if ( !page )
>>          return NULL;
>>  
>> -    if ( !p2m_is_ram(p2mt) )
>> +    if ( write ? p2mt != p2m_ram_rw : !p2m_is_ram(p2mt) )
>>      {
>>          put_page(page);
>>          return NULL;
> 
> The ambiguity you mention is indeed problematic. This mixes page type with p2m
> type. The comment "The p2m_type is based on the type of the page" admits this
> conflation for DOMID_XEN.
> 
> AFAICT, p2m_ram_ro is not used on Arm for normal domains. The only use is in
> get_page_from_gfn() for DOMID_XEN. Maybe we could change get_page_from_gfn() to
> always return p2m_ram_rw since DOMID_XEN has direct 1:1 access anyway?

But that's not correct for cases where share_xen_page_with_privileged_guest()
is passed SHARE_ro. XENMAPSPACE_gmfn_foreign requests have to result in r/o
mappings in that case.

Jan

