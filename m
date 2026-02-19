Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLF/J26tlmlkjQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 07:27:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F30C715C5DC
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 07:27:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236057.1538844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsxUy-0006BA-C8; Thu, 19 Feb 2026 06:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236057.1538844; Thu, 19 Feb 2026 06:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsxUy-00068i-95; Thu, 19 Feb 2026 06:26:52 +0000
Received: by outflank-mailman (input) for mailman id 1236057;
 Thu, 19 Feb 2026 06:26:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsxUw-00068c-7b
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 06:26:50 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f81fd2b3-0d5b-11f1-b164-2bf370ae4941;
 Thu, 19 Feb 2026 07:26:48 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-435f177a8f7so524756f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Feb 2026 22:26:48 -0800 (PST)
Received: from ?IPV6:2003:ca:b70c:6a43:c9a6:464e:db69:c159?
 (p200300cab70c6a43c9a6464edb69c159.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a43:c9a6:464e:db69:c159])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796abd793sm45774991f8f.25.2026.02.18.22.26.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Feb 2026 22:26:47 -0800 (PST)
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
X-Inumbo-ID: f81fd2b3-0d5b-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771482408; x=1772087208; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m+j4oVGjPrG5B3vHzrt7TeQ7UaIRaDHN2pIsHha+I0k=;
        b=R38Siy0pKkCMLnrtDcEA/aw2RduA3wu9ZQxz6zcNsUk+U+t+KC4P9vQGfG2J5xvtib
         DjIebcDGMDXKra02wM7AGx+vUNDMvur9gR5SJxdujNZhHi8+Ms7PX3zdGPuI4I0guLPO
         0K6+IdJQvqWKMQcH2MYk8pdQVJwYL16umScgoLV4S7TFRICKwlYIaXRj0n/kRo6HOZzg
         TnWr4lRwEmkndr/R7r9fGg4MPGzd77qsdGELpoFNEZy63DrRKzTMRqr/Bu1Xm7d2FHvE
         raJvqSSV4ZBWNGIIDB738au7KOm5K5mL85QpUykCAu/DWy9e24PQDDRLkWDl6QUmpjhX
         NY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771482408; x=1772087208;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+j4oVGjPrG5B3vHzrt7TeQ7UaIRaDHN2pIsHha+I0k=;
        b=aVGUDEt6PZczEDUTPfEAMQKHGUrpAPIw12Vc1XJDE2QfKuGsD70pjiaSkJOL9CxsZX
         Ab3UHAYS0UHTpGnDSr7otT8JzIJxHzwud384KyRaFWIyDiiO8rHkzqLFO6oycm/jwQT1
         hovKz2gWQBnx3JwT1Tn1HHJ+phObR65Mn/J+YQ7BWvgXUH2x3BUItlTjAaKPaZyPWAXR
         S1TWkpgVczMGMjGxPMohULJz/tqcVjt31pz/MmY5ErggaHTaPGTvew+BMUjXSjcAQGqZ
         nKjJFCtkY9igzk8oblAfy+6Gcn7n1l/abwGYnj+TfLHme9SSePpIqPuOLGhI/6gxzvgX
         /XDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAMcnU+dvMi3Z1Hkknr/HXA7MwJJNJB3wcrcHRCg9lZolKfHCx77fJXkBAVGZxaBOXmBqgpAKN6uM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwCYFwH0y8PArNzLiHXD+ZVEZE4CRAiPv8Zvv50lbnGHngTnF0S
	LlRHa6wE4bbWFZ0swOX36xi0o7yOIYCiInTlGvaUnOvxkMEp71Tg4H378BwmcvN6lA==
X-Gm-Gg: AZuq6aJiMIVDYf483vWPdnng2cSwBS+XAqVM/TU0bOrxA2y7S1j9AukqHVJu6Sz5I+i
	DmOt3a6fAVyw6fwBVwsW7jYP2oBFRc+p8gxdPbelmGYf9rDd7R/TOlFg5pbJNP5QaJsohye6w3+
	egUInpMY/itbyO1uYWWOPMsvMDB9CbiMB9YV7qCnrRC7WZRi2Xo1Bo13G5oTBUp8RHE6N3D+3HB
	Bu9+fmceA8CR5G6cgGMva8HlKdwNrA+vHVgUJqrAhNv5QfBoPw1jvyMndkOXcSe8KDOsWxZMNWu
	2j3Cf7/gYtp9I2pTiWY9q6+heUl/dnn5PCCtAJM//X9UI8c2EZy+MfOk8n8wfwc6Zs8zbAzKsss
	IxBJy2T6LUffRpJ2n/K1j5Fq/M1oIodNRRbjyGe+VqfocbuCK2prr27wlyqYVrB3Qxa/nS8jGik
	rlrpOTbGQMOnEYb1FdRCE4T+p0dtkunyK4JnU4AR+mqIw21KbtojMy922bcoQHlOkjnZK1GfzEv
	d4kYvfzG1YMnmBVZFNbprQKhJVnfNQdelkPIxOC4CrsXz+m2mSSo/4tYyRjux67lelC6WU=
X-Received: by 2002:a5d:5d85:0:b0:430:ff0c:35f9 with SMTP id ffacd0b85a97d-4379dba3125mr31706377f8f.48.1771482407773;
        Wed, 18 Feb 2026 22:26:47 -0800 (PST)
Message-ID: <d95da240-2e4d-489d-9107-8269b3301b93@suse.com>
Date: Thu, 19 Feb 2026 07:26:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] vPCI: introduce private header
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <25c65557-c97c-499c-a698-571e40cde563@suse.com>
 <4fda7acb-e1a4-4a24-982e-4cae90048018@suse.com>
 <997450bd-3c01-47d9-a0db-21b58fdbc8c6@amd.com>
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
In-Reply-To: <997450bd-3c01-47d9-a0db-21b58fdbc8c6@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stewart.hildebrand@amd.com,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
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
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: F30C715C5DC
X-Rspamd-Action: no action

On 18.02.2026 22:58, Stewart Hildebrand wrote:
> On 2/10/26 05:53, Jan Beulich wrote:
>> --- a/xen/include/xen/vpci.h
>> +++ b/xen/include/xen/vpci.h
>> @@ -30,20 +19,6 @@ typedef struct {
>>   */
>>  #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
>>  
>> -#define REGISTER_VPCI_CAPABILITY(cap, name, finit, fclean, ext) \
>> -    static const vpci_capability_t name##_entry \
>> -        __used_section(".data.rel.ro.vpci") = { \
>> -        .id = (cap), \
>> -        .init = (finit), \
>> -        .cleanup = (fclean), \
>> -        .is_ext = (ext), \
>> -    }
>> -
>> -#define REGISTER_VPCI_CAP(name, finit, fclean) \
>> -    REGISTER_VPCI_CAPABILITY(PCI_CAP_ID_##name, name, finit, fclean, false)
>> -#define REGISTER_VPCI_EXTCAP(name, finit, fclean) \
>> -    REGISTER_VPCI_CAPABILITY(PCI_EXT_CAP_ID_##name, name, finit, fclean, true)
>> -
>>  int __must_check vpci_init_header(struct pci_dev *pdev);
> Nit: I suppose vpci_init_header() could also move to the new private header file

Hmm, yes, will do. I wonder why I didn't, as I went by being pretty aggressive
in moving, to then move back what needs exposing to the outside.

Jan

