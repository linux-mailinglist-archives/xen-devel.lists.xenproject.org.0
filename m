Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEKRD6GV12mGPwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 14:03:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A48DE3CA09C
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 14:03:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277215.1562443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAo6b-0000vk-FC; Thu, 09 Apr 2026 12:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277215.1562443; Thu, 09 Apr 2026 12:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAo6b-0000tO-CU; Thu, 09 Apr 2026 12:03:29 +0000
Received: by outflank-mailman (input) for mailman id 1277215;
 Thu, 09 Apr 2026 12:03:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAo6a-0000tI-Hr
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 12:03:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAo6Y-0097TR-Bu
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 14:03:27 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d7958f-5cb7-0a2a0a5109dd-0a2a450ce332-4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 14:03:27 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d7958f-f40c-0a2a450c0019-d1558035a944-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 14:03:27 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-488b3f8fa2bso10174865e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 05:03:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cd0cbc57sm22873545e9.5.2026.04.09.05.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 05:03:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1775736207; x=1776341007; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HdHbUNE7bkDJH0xXe3FzCBUEZ0vzrKS413I9gU7IFxo=;
        b=OkbE7dhC7b3af51n541dXs0tX5HqXlJYKMMmExKyplbs2rpFkRJ5Yqs/eC2HOMgsBl
         ccUHOB+8ol2iqJAvnzigromtCbb9hgWxjA3T375v2iYNNNWfG+7nS4mxFVzXWKpzW288
         uoA6WViGI94/NJ5gAdBCJ3zVfDmhoGsYNomVF/tMF1i5lwvVTWCDq4ETRoQMAhj5lqWn
         btEHd/28l63UpeC6DlUlFRNjZV4kHq2v9JQ6yPg+oeqCbuqYR+u688YuKNCkJZ+T88fs
         3UyY8hPHrCdEZ2x/j545b/TGlOWr1ZgaaBsXHa9/r4BKrzONgwDa/MYlaRUUeepg7aAq
         VbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775736207; x=1776341007;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdHbUNE7bkDJH0xXe3FzCBUEZ0vzrKS413I9gU7IFxo=;
        b=ZR8In66+eJv1v/3QDUeo12T0HF+7jBzNM0akYEINuDh4Lnv3VfqfUkXgH1CHomkW4h
         h1JaAphBcrmhHHlLL5tDALc2MFkbFTgmSZkfPDYleTYV+GZU3x3WS8m0MO+JgPfVO+Y2
         z1C0VLuBmYBB8+0I/06NsdLovEdKj/K1ah7lVQ/2qABh7alOmosWqHQc+man/WZbU8Bs
         6CSJMSXWlHYimKB43op40DvhqtPUtX66Iy0M9UxzOfmGTpzP5IqZMSA7ziMNUDklC21N
         Ac2ftLYD6VHpDXl+0brNsm5edzMtO2ehEDdL3sxNZCDYII2+lw6o007E4TVA9aTOdwAD
         1mXA==
X-Forwarded-Encrypted: i=1; AJvYcCXvS+S3xdIIGh5viRwzUtFSdjzeLAtP2zqcytczGvPM0ygo+QRru/itCA5vb2HUZZG1lWhZd0idRAY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8NoCHyOULRgihKh0iloBL6nb87kvFjtLG4u0M7QIIM9ktN2gT
	I+o85+84jeouFsJgYc/il/HVE3Ixg1x2l2MRV0epU0Go5oJcVTzEd7v8Hn6HFrAJnQ==
X-Gm-Gg: AeBDieshItTIGYnmPpXkhcQ3H5jXGTR4EBavGpd7AhGtuzEAy+f/hK6F4EnEaIFe5Lq
	UGwTq6juFnlDre7UPNkR2p80zBeCn5Y7XObQfjuhZ5BIeznGEDAVhLUzy//Ddcxdx2IHmGIP7Je
	YmyrLSwwsPW878sj2nrGU2V5oB7oZL3Zr25ytHTKSq/Ath1a+SyYDnDEJYWivbh1RYZsPcZPSMV
	XFE2m4AJLZMGH1ro55SsnkgNV0n7AxTqXYaymah1YOPCMZCXDRFn9jJ+KfGV/DsujzayefN/jvh
	/7s29Jf93o5WxPH6VGA58JLmi7U4Q4uhdOwsfU0iS9fTNaMjruFA4YbbVpAPTbcG6lnrWKUUvqw
	EvJhs8tdgXe36PVtjMgjFz2y0PGn5HcCx5LPd7M+xC31NjtJAx+9ZzNvjYUtAc4P+7uOhdqtNtF
	QaDClNI3u4RnvXgnFPJz52nPvais8/YTbyYZ26azWILXxzHTzpTP3cLty2Peb4A0HtsMnhtvKNK
	M8OVLvt/ZZQgJE=
X-Received: by 2002:a05:600c:4e89:b0:485:3428:774c with SMTP id 5b1f17b1804b1-488cd5282c4mr40185695e9.4.1775736207032;
        Thu, 09 Apr 2026 05:03:27 -0700 (PDT)
Message-ID: <315eb80b-8467-40c1-977f-441b86331e96@suse.com>
Date: Thu, 9 Apr 2026 14:03:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86: Avoid using .byte for instructions where safe to
 do so
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260409114151.179408-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260409114151.179408-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1775736207-FE350A3D-294357A1/0/0
X-purgate-type: clean
X-purgate-size: 314
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A48DE3CA09C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.04.2026 13:41, Andrew Cooper wrote:
> The new toolchain baseline knows XGETBV, VPXOR and VPOR.
> 
> For the other cases using .byte, annotate the toolchain minima.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


