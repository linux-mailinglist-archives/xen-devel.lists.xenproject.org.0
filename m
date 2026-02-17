Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yF/oIctMlGkNCQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 12:11:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F121F14B318
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 12:11:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234840.1537955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsIyp-0005jF-CL; Tue, 17 Feb 2026 11:10:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234840.1537955; Tue, 17 Feb 2026 11:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsIyp-0005gr-9T; Tue, 17 Feb 2026 11:10:59 +0000
Received: by outflank-mailman (input) for mailman id 1234840;
 Tue, 17 Feb 2026 11:10:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RxGT=AV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsIyn-0005eJ-VX
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 11:10:57 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54a96ac5-0bf1-11f1-9ccf-f158ae23cfc8;
 Tue, 17 Feb 2026 12:10:56 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso47947695e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 03:10:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6c1b4sm31926490f8f.14.2026.02.17.03.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 03:10:55 -0800 (PST)
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
X-Inumbo-ID: 54a96ac5-0bf1-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771326655; x=1771931455; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MnZdPGjo591uEjjPtTCALByWXfVhwbgx/rPBt8hGalY=;
        b=FND4hcCI9hd+27lKnH2NXlDDIEvbWQfmy+p2lX888Pt6xiFgCCGo++kThG010IC7t3
         zXZUEROLpzJly3dV42vmAJmhP/lakoQY9s95EjtYD2dgTuEy9KLrWaNxeGvOyC/gDNq1
         Ru2mFmKvLH6GuSzYRJGld8pgz1NVdl9ICmiHdzyLL8dzO+X6gQ6L1yw+8g9GkKxasPBB
         82iyPymMR/i6G/YYELyK4y4f1mWJPNN7wJmqXLbkCe/WTxsxnBIh0yTq69GIqyRGZeh9
         int3pYdxSHtIkfZwCvbKtl3g0/1VZcFD8TE97ASQBF7SIfZ9WCHfs021KnKF1Nmwxbbb
         4gEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771326655; x=1771931455;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnZdPGjo591uEjjPtTCALByWXfVhwbgx/rPBt8hGalY=;
        b=PlvvO2ZKnwPckVQeL7BEUbPaVXwKNtbm+5YyY2XmUZ6li7fTR0HIjQOJ1GTu+agbsn
         765qSa9JuLrzawtpEeRSMUriPktaWqmyCpM88pBJkVsxw0aovw0i9xXjea1N60xDU2Hw
         AsGVDUmXNKW25ewyAGZsWT3JOJbRJx/svdo0qrRKegu501Ti2Od2BwHlUhnaa7YcJX+A
         9FjIRSruiapEMKisKzMVjvzsf/kekySNHsgBxdjAY73S53fXm3NLhSojeocKfn3bk82g
         zQk0BA4UshswawHstz/Qy9yLzx9eSvpqY3NrZMmZpD0NoVuvz29IQUX1lYcFu7ocGs7E
         ED9g==
X-Forwarded-Encrypted: i=1; AJvYcCUT1kOpiGz7LQgNYtnpvmauMJHThYXSUmwb5NzOfmZwpw0LXNQ7L9hxbKwqhxtzPWFKdfTak0rS2cQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTtqFxvPMqpHJYvRH45eTVbsLE9LkzQhuA4ycIeojC0kOZYFvt
	N+UOOlOvt7tpG5tPdvD948g/Mrs76Vt0E6x19D+4qsMP9z2m3xopM0QTycSEs3H00g==
X-Gm-Gg: AZuq6aK79IqZ13uawq3IFICfHHYIPSmtC+Gvy+FY2kHVFjNDjKW1PchNal7s0fWvF5O
	+4eawDeK3nUgCmza3PurC3jgufNXQva/Gi7lVC/QIwhe4tp/gsUvxsu+ad9A0ygtfV8EKlsR7ye
	P615DhwKIR6cxQLI5/7aC6qNNbqxvSp+6oOgE/jTZj/71+2J2CVsMgvW6wJd4OR68JUsRNiK/9D
	NVvsAWQvp8jgRmXPEWzR+LGftJYntOnhgS3hjuj8+YEF9YL2WFh6gAaCdY/WsqrydoHhSr7eNzQ
	hY2VbtV7CqbKlhHCzjhzpRLhn0TyCpeSoilrSJDN/D97T2nppG0TGMweKcNk6yo2aniGgxBGO4J
	taUjc0a65ULltzpys+JmYEpVgsvwMam2L1j17gafL7cRo7SA7iuoIDOqLK7aTg5Vktks1PqrxBk
	Pqf0lDDBuA3KrAjkvicCZG3fr/iPiMaM+bbcf9cska0MeGCqqPg9e9jQ76PIk+bX8NdP9EqtR2Q
	Ia8j3ZaQAtIVk4=
X-Received: by 2002:a05:600c:5488:b0:477:a219:cdb7 with SMTP id 5b1f17b1804b1-48379b35657mr150462095e9.0.1771326655441;
        Tue, 17 Feb 2026 03:10:55 -0800 (PST)
Message-ID: <5b0be132-07f1-4d7b-92ac-2b1d9c4db408@suse.com>
Date: Tue, 17 Feb 2026 12:10:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] tools/tests: test harness fragment
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20260213024952.3270112-1-dmukhin@ford.com>
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
In-Reply-To: <20260213024952.3270112-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,ford.com:email];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: F121F14B318
X-Rspamd-Action: no action

On 13.02.2026 03:49, dmukhin@ford.com wrote:
> This series introduces the use of a new common unit test fragment across
> several existing unit tests.
> 
> Patch 1 contains assorted fixups for the domid Makefile.
> Patch 2 adds a new fragment for auto-generating test harness dependencies.
> Patch 3 adds some prerequisite changes for vPCI test (patch 4).
> Patch 4 switches the vPCI unit test to the new common fragment.
> Patch 5 switches the PDX unit test to the new common fragment.
> 
> [1] Link to v2: https://lore.kernel.org/xen-devel/20260111041145.553673-1-dmukhin@ford.com/
> [2] CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2323352235
> 
> Denis Mukhin (5):
>   tests: fixup domid make fragment
>   tests: use unit test fragment in domid test
>   xen/include: customize headers for host builds
>   tests: use unit test fragment in vPCI test
>   tests: use unit test fragment in PDX test

I remain unconvinced of this attempt to generalize things. Yes, it eliminates
some redundancy, but at the same time some of the new constructs are harder
to read / follow. Perhaps it would help if smaller pieces were abstracted out
first / incrementally.

Jan

