Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PZLMTYWn2nWYwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 16:33:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4892F199A7B
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 16:33:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240854.1542107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvGsj-0002k8-Ts; Wed, 25 Feb 2026 15:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240854.1542107; Wed, 25 Feb 2026 15:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvGsj-0002hn-RD; Wed, 25 Feb 2026 15:32:57 +0000
Received: by outflank-mailman (input) for mailman id 1240854;
 Wed, 25 Feb 2026 15:32:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vvGsi-0002hh-Hi
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 15:32:56 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4176d110-125f-11f1-b164-2bf370ae4941;
 Wed, 25 Feb 2026 16:32:55 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4834826e5a0so84201315e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Feb 2026 07:32:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d3ff6dsm36514807f8f.25.2026.02.25.07.32.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 07:32:53 -0800 (PST)
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
X-Inumbo-ID: 4176d110-125f-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772033575; x=1772638375; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3c1u35Jni9xe27dch0rr3wNsKWBIFBxvE0aSzPNp7p8=;
        b=GOCuJ98vfP5QDnDCXfgPjfxNqQ55y4QUds3vHhEuSJTunK21AeexfDhmB/jTz34JGi
         JwhPULEMybrvK1iQ6JHvfZhDk7b5USJXmyHB7Yy/2kKqsWMDuS1fJDwOeqlQIcxg52Hn
         QY5AT+VuCD3vNSFrdd84rf2vUcuaJIOrswojO9nEauHTX8tvn0VJ8WrwNClGILM3K2eZ
         F3Lqs/FIlKa5VXSpOsqSr9JD7L8SqQFPkjukEHU+dHdapfiMYX86pZnhrcO380iNBBM0
         CFNNJk7URrncs6m7qZCiB8JDwiJmurhIm3Mtp/rp/caDdT2lBq+naDngWofskYk0R3or
         X3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772033575; x=1772638375;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3c1u35Jni9xe27dch0rr3wNsKWBIFBxvE0aSzPNp7p8=;
        b=f6aZhhox/gIWZa15QGm1z/ohK5nT7RJvCLV7O4M0TJzbsqFLtBnMcYYCighbRzi28S
         6udk9Vk99JnO/R+Y9ilIrKNkqOG5mLu1Zi7nrDqHNgtr7Gb53bwdAa19TMUYUiw9raUc
         L2cXH+1C2NMqVaHRfU9A6WFmdIZNN3JBzCrGzxIH26DNn9XvhBZ+KLUMJxFzA9IdPgv3
         Lz1qIgHa7iKa0xq7mfqT4JgXc90Bd1OY65g+jB41j4UTWFh04o1vReuhIpBfmS6S+uto
         7m8UEj4muGrDtT7y2I4Sv8yHVm7KgXXm5dUWLJ+0HDfXMX7x3YCdjDM874bOCXWTcDth
         Wz7w==
X-Forwarded-Encrypted: i=1; AJvYcCUIFOD+6ASCkAb+sRu40IQfh//lJr/QF8kyWefJR1kw8fYZ4l1wwRL4vDW+FnuF6VY3voAH5LTfAoI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwzVmCeX+lI02IZJOJ2Qc0aAsY+wWfOqMmJQa4RuZ/LehHzT8rP
	YpVmeMg5+ieH1iLepvY+5CY/Skccie0i4MFBzTLWQnYX3ks6ii+mcQ0mC9vILi0dVA==
X-Gm-Gg: ATEYQzxZjDAUjs3LdntYyXxNaeY6BunSClsju5UzqfqIzcIUv5HVBHJuC4utYmYw52c
	mH+HDAoYZTfT3YGNQSvtN4zGXCrwqu9ZZPgppc1s0d7NOY7166s20lKcEMrfQs1sKLYEYXwO0EY
	JDlt3cU5gf7FT1tBX0WYTorgg/oUpvVl75ndgASTP/pvyKiLrUgGkBHhx7oIwCuMXtVdkU1qhv2
	TDPPC9tjt2Gg+3u/dLHAonYyOiDznE9gLeoi1hCKz7sSK9YOI2Nea/NHYz0ngEGwUmq2k1BEipE
	URABOjIIfc2p+NaVWF3HL4UIR/OieWMPLA4F/CubIUrc9pCsUaGppXwhsTeVG9tML3NAjXIJS4b
	kNYknRyvMI1KpoWhEvFbLLoY86/2PdLWjM9fOVt6WlxBeTdXPwQW8d5kpnp7XTc4Fzap0uom9tX
	lusuSFC8eQV7s1UQikHDB1xZJ6zxBH4/nGQr9W36f17ITn7rmnbzxpyB5hNcCy6SjB/rNgKxKnx
	ZQZYtf841QNFRM=
X-Received: by 2002:a05:600c:46cd:b0:476:4efc:8ed4 with SMTP id 5b1f17b1804b1-483a95beff3mr301995065e9.11.1772033574004;
        Wed, 25 Feb 2026 07:32:54 -0800 (PST)
Message-ID: <8a015ce9-1d06-441a-8269-c5a81549ac3b@suse.com>
Date: Wed, 25 Feb 2026 16:32:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/vpci: automatically use iomem_permit_access for PCI
 device BARs
To: Ariadne Conill <ariadne@ariadne.space>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Steven Noonan <steven@edera.dev>, xen-devel@lists.xenproject.org,
 Daniel Smith <dpsmith@apertussolutions.com>
References: <20260224231249.6327-1-ariadne@ariadne.space>
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
In-Reply-To: <20260224231249.6327-1-ariadne@ariadne.space>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[edera.dev:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ariadne@ariadne.space,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:steven@edera.dev,m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4892F199A7B
X-Rspamd-Action: no action

On 25.02.2026 00:12, Ariadne Conill wrote:
> From: Steven Noonan <steven@edera.dev>
> 
> With vPCI, you shouldn't need to use xen-pciback for the device, so the
> memory access permissions need to be defined somewhere. This allows vPCI
> to automatically define the access permissions so that the domU can map
> the BARs via IOMMU.

What if XSM had something to say about this? IOW no, I don't think this is
permissible. xen-pciback needed or not, that's not where permissions are
granted. It's still the toolstack which needs to do that.

Also you're never undoing the granting of the extra permissions.

Jan

