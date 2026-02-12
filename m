Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ESKC2d+jWl93QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 08:16:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 943E412AE47
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 08:16:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228409.1534589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqQwC-0005nd-BJ; Thu, 12 Feb 2026 07:16:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228409.1534589; Thu, 12 Feb 2026 07:16:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqQwC-0005l9-81; Thu, 12 Feb 2026 07:16:32 +0000
Received: by outflank-mailman (input) for mailman id 1228409;
 Thu, 12 Feb 2026 07:16:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqQwB-0005l3-9P
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 07:16:31 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd861207-07e2-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 08:16:25 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47edd9024b1so77555565e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 23:16:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4836d44b6cbsm349775e9.25.2026.02.11.23.16.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 23:16:24 -0800 (PST)
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
X-Inumbo-ID: bd861207-07e2-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770880584; x=1771485384; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1OCYbi/fUSmn5RApnFHWxuMLnmJU5dyiFcyROJnALf8=;
        b=VbSAdxfQDjXy+8oaw0ueig7djdyTZdbLr2Dw0DesmmUVWbk2Xn0tAXIXKOhkiuQ2Mk
         9eVuvs/NKcD4W8sPiUNifQGCYs9v+XoWfauKADjAQCP/LAL0ipwJHRopwnja/s4UqOsH
         tHdtGSy655Oo4uxlR15v+twilDkKtuIlMoiq6I8ejKOMv5mMLweujgn2gXuA9p8gInkU
         B0ob4KmNlQYulTGb43Jhfe9dKwyOrzvqjqqvpAbruaq8BxkqSIGLHlCofCmQ173sjduZ
         b3QKUyJQeluQrL7pmIwhGjbrAL2lZGr89DLagy1/HGwQiwiEBPnxmivKoHyf93hXUc11
         7Kqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770880584; x=1771485384;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OCYbi/fUSmn5RApnFHWxuMLnmJU5dyiFcyROJnALf8=;
        b=Vvc9b+cIAoTqagg93g8eunmdTex78ES7ctJTOwKYit4UKxLa7qTLlkrdeEZW7Lkk9i
         ++8L4/UD2NDKDCGBfZJynskIkxeBViJGWkUhGCa3ZbcL+6ypM6i6klm1EoqIbM6nUCsU
         oJL8xaIETmZRZN392bbVkPZf8NQUH5+Iowjvgizr0IIPyDeALEu25QHcJk/jOPh8a6mi
         79+KQlYeaYYlCOPGIW5gEZnUegkMs936eelTvOogUI5fVUQGx3UreNbrBpE86EKxo8ye
         GkwldUge4lDF0s+OmkyFAihE2tc9hRe8e2msoCnMPlaJtEYvYx2OLElueFD1FTPVMF5B
         waNA==
X-Forwarded-Encrypted: i=1; AJvYcCU2xuq0jhFnbzNQtz7p58+6E2sBWdBQ2vUpwJqFCY4km+N0Uf1BV7uNzo1yqsFPgVCNkNesulBbAyc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPlkmMu/vU89WENFXPoLDPzGNJgsEPZyqeE0Kesizf8z5x+dpi
	gU63ZlVhadJsIHUcz9fQBzIvbg2bFvQipAfOuSVNMMkrQvxWwvBz07G0VVhp+FwQ1g==
X-Gm-Gg: AZuq6aJCz2ZOadXr14kIHMAf9z6hDRKM05GMWC+bAIdsQh5MUto7XAlavOzHf4LAt81
	4SrpP/X1kbgz0fyijWVORnVhrX2EpDcE/me8Vww/vD0hilJcX8GwSHVT6YLe0nUloVJnjz5KvcE
	Id7DXEtsh3LxLp3H7ToCaWdyludQvTV7AjHV5GHKd7LiOqblNlOPGaEsaxm+FYpXB4UXseP36S0
	m5zK7tEpWB4C2mPHnmKHdrn0mtlWPjiFL1QaY4WcZDBy/P/cWS2j38va3SD64vmCDJxK6e2Slpj
	XOaRj7NbZ6x0WuoPaObOGdYj7p4xSZ3eKne7YYcBOs7O5878AUzWJ8GAbrDz5HxPK1x5BtcSt8Q
	DYR8qQC4xeXmbH692BEUG+/vmKksRdzKjwF0EynaJJU+a9I7m4rkMGqslFa2TE2dAtJR5v4cTEn
	0mS4HAfQjcz1Ll52xhkfesj/y8OliSFNa/zOwCr4+iVtwe5hKp9pYIYiTVBsTVAdL+Pik27nrwj
	KI1bW2wtkOKWuqRBsblRf9/0Q==
X-Received: by 2002:a05:600c:19ca:b0:482:dbd7:a1c1 with SMTP id 5b1f17b1804b1-48365720147mr21883535e9.34.1770880584344;
        Wed, 11 Feb 2026 23:16:24 -0800 (PST)
Message-ID: <ae3719e6-a0f0-48d7-861d-8733976b9761@suse.com>
Date: Thu, 12 Feb 2026 08:16:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] x86: Reject CPU policies with vendors other than
 the host's
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-2-alejandro.garciavallejo@amd.com>
 <a20d3f93-2209-4035-bacd-8bd00fb12d77@suse.com>
 <DGCBG8493YBL.17QYWCVX62YDQ@amd.com>
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
In-Reply-To: <DGCBG8493YBL.17QYWCVX62YDQ@amd.com>
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
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 943E412AE47
X-Rspamd-Action: no action

On 11.02.2026 18:41, Alejandro Vallejo wrote:
> On Wed Feb 11, 2026 at 4:41 PM CET, Jan Beulich wrote:
>> On 06.02.2026 17:15, Alejandro Vallejo wrote:
>>> --- a/xen/lib/x86/policy.c
>>> +++ b/xen/lib/x86/policy.c
>>> @@ -15,7 +15,8 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
>>>  #define FAIL_MSR(m) \
>>>      do { e.msr = (m); goto out; } while ( 0 )
>>>  
>>> -    if ( guest->basic.max_leaf > host->basic.max_leaf )
>>> +    if ( (guest->x86_vendor     != host->x86_vendor) ||
>>
>> With the subsequent "unknown" discussion also in mind, I wonder: Should we
>> fail the request here when either side is "unknown"?
> 
> That'd preclude the creation of VMs on new vendors. At that point, might as
> well drop support for unknown vendors altogether. I wouldn't mind that.
> 
> I was thinking of comparing the x86_vendor_id bytes instead, as I answered
> to Roger. Then the invariant that only $VENDOR VMs run on $VENDOR hosts is
> preserved even if we don't know about them.

This would be okay with me.

I wonder though if we aren't getting too restrictive here at the same
time (even with the above check): Hygon (Fam18) can likely run AMD Fam17
guests quite fine, for example. I wonder what Andrew's considerations
here are.

Jan

