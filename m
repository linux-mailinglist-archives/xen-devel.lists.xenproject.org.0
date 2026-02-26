Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEUzMiLwn2kyfAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 08:02:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AE81A18F7
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 08:02:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241258.1542369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvVNf-0001wr-8X; Thu, 26 Feb 2026 07:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241258.1542369; Thu, 26 Feb 2026 07:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvVNf-0001vN-4V; Thu, 26 Feb 2026 07:01:51 +0000
Received: by outflank-mailman (input) for mailman id 1241258;
 Thu, 26 Feb 2026 07:01:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S+Ht=A6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vvVNd-0001vG-EL
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 07:01:49 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff7f4866-12e0-11f1-9ccf-f158ae23cfc8;
 Thu, 26 Feb 2026 08:01:39 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-483770e0b25so4438515e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Feb 2026 23:01:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483c3b89c99sm23049495e9.15.2026.02.25.23.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 23:01:38 -0800 (PST)
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
X-Inumbo-ID: ff7f4866-12e0-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772089299; x=1772694099; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8cQZe2dHyQBEti5OjKsuauCeZzodfwWd8leeRVjApiY=;
        b=Jhgxc5TS2OtjgoAz5UBVxMlC2BHww5v2wwQCLHZal+orhUXRc2jzzblCC8flHJtDB+
         5/GXjYuN/iU0Ys8lM3Ff2QQZL9X+bblsexk/j7b+qVsP2G1nF39gctTQAt2d/kDWkuDe
         PDwITp/jiSKBTEunB/Lw2XSYopKo4kPjSltci1F2JsAs7alkLgHP2vdjoScXoltBcJSR
         7nhkTSSpenl3FaauAVJ0fsYtiut3c5wtn/sgtc2DO3t5WlySClZkSq7o6UzHGLnmCskf
         9fj0+QbrlTWtfQvi0DC+clqNHWpC0OhHmSTBQiqBGk80npQ5foqEcdVWu4/xfx9plNqA
         Xhsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772089299; x=1772694099;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cQZe2dHyQBEti5OjKsuauCeZzodfwWd8leeRVjApiY=;
        b=IewLbaTfbMbyEDmskn+jrVGQ0m+aZA4FzVjY1Yw4SCo7s6rGMoENrHACLaAXCAQhW+
         ScUTZlxj7qozT6TRiBhXDdRX1IUw+rJhZSXaOMAlbRNWS3Gi9LLCtqoCgVUSJGp+BJLF
         9/h/6gUNVprVvk+i5NNtH0pbwVlFX/MgmaPQVIp0I9Z67oTkfj+xNdEyzPd3gdK2HmoF
         CXh9UNNmar/T9Hz5T3sby1d1bHzer0LOeon/Rpa2GmY16dzFhAVDcuzMW4HQjmX0Z6uy
         BxpLXFOo5JAZrK7/aqV2MDKjbog7CO2LOHVqPlF7xr8v2mBFzkpbr73k/AhHfyB/IbSy
         QcGA==
X-Forwarded-Encrypted: i=1; AJvYcCVFHQKW+q02yFktF36FUY7wuV1YOKgHHz2FEmheHZHyeuJX5rcPRDmu1z8IbL3xj0pX6XlKsVZZmKc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzpw/OAyy5GzZZga/NvaF1EtpglP1jQqonCro6Fg0HODXk4oPRr
	fTU5A9P3yYGhciHW/jC7Qf4VEjc59kjjqPxT4ncLWrOBra8UsQLFrdWWyPKKXogoBw==
X-Gm-Gg: ATEYQzxipJNc8BJqnMTObEOEuoPizp/CRn6DWy4qbnITW/Il1ETcqWdIfaBZijN3k3e
	qJnshj6SpKo+1w6+SDqV8Z7HvwFhEx9T/RbPt/yYtfZIXR2JvSE5hW/K4wi2ZcYw42TVhgy2x1X
	yr0FcM0d6Op0RfpjnUa9M/FGPqbCbAI/gzDQBOQOafcJoEp8SRg9Zm9NiVTjx34yX5YlcMJHJpO
	TioPh+KT/SjCTdXW8iTWgut/A6xUXi67GNmQ9Xq1VDbZX8APRLNcYvmPBNn2OkPZrPiAKQGqKOG
	o3MBikcbTQnIrwVIBZA3UzQzxdH4P4bMFfmNB+T6HSrd1cpjgeBuMlyheahlAc5FrBTvysaBbft
	lRCiG3zzFuzSvzi5brcJkli/iztz6cJsgHVzII7RxrClnvDENNeAo0sQhEF5U+zpMcywi1tj2px
	0PlxVJOl0B7tFLfXHqjALFBFddoNMnIweM7Qf3m5I5wQLAK39KLRFjYZrgoxf/khTG/vLWtDz+D
	z20o9uEU7tqZro=
X-Received: by 2002:a05:600c:c166:b0:47a:935f:618e with SMTP id 5b1f17b1804b1-483a960a0e8mr339328615e9.15.1772089298904;
        Wed, 25 Feb 2026 23:01:38 -0800 (PST)
Message-ID: <e1fc4865-20ea-474c-8d4b-45d3ac207c85@suse.com>
Date: Thu, 26 Feb 2026 08:01:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] tools/tests: test harness fragment
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: dmukhin@ford.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <20260213024952.3270112-1-dmukhin@ford.com>
 <5b0be132-07f1-4d7b-92ac-2b1d9c4db408@suse.com>
 <alpine.DEB.2.22.394.2602251648220.1536420@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2602251648220.1536420@ubuntu-linux-20-04-desktop>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:dmukhin@ford.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 17AE81A18F7
X-Rspamd-Action: no action

On 26.02.2026 01:51, Stefano Stabellini wrote:
> On Tue, 17 Feb 2026, Jan Beulich wrote:
>> On 13.02.2026 03:49, dmukhin@ford.com wrote:
>>> This series introduces the use of a new common unit test fragment across
>>> several existing unit tests.
>>>
>>> Patch 1 contains assorted fixups for the domid Makefile.
>>> Patch 2 adds a new fragment for auto-generating test harness dependencies.
>>> Patch 3 adds some prerequisite changes for vPCI test (patch 4).
>>> Patch 4 switches the vPCI unit test to the new common fragment.
>>> Patch 5 switches the PDX unit test to the new common fragment.
>>>
>>> [1] Link to v2: https://lore.kernel.org/xen-devel/20260111041145.553673-1-dmukhin@ford.com/
>>> [2] CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2323352235
>>>
>>> Denis Mukhin (5):
>>>   tests: fixup domid make fragment
>>>   tests: use unit test fragment in domid test
>>>   xen/include: customize headers for host builds
>>>   tests: use unit test fragment in vPCI test
>>>   tests: use unit test fragment in PDX test
>>
>> I remain unconvinced of this attempt to generalize things. Yes, it eliminates
>> some redundancy, but at the same time some of the new constructs are harder
>> to read / follow. Perhaps it would help if smaller pieces were abstracted out
>> first / incrementally.
> 
> I don't think breaking it down further would help, it is already in
> pretty small pieces. At least, I cannot think of a way that breaking it
> down would make a difference. Do you have something specific in mind?

See Edwin's series moving in effectively the same direction.

> Also, I appreciate you being unconvinced about this series, but now it
> leaves me in a bit of limbo. I am fine with this series going in --
> should I continue reviewing it regardless?

Hard to say. Maybe take a look at Edwin's first?

Jan

