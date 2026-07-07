Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ytqdFe0fTWoAvgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 17:49:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF42471D7CC
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 17:49:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=SeiIE148;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356380.1611020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh82F-00063m-9m; Tue, 07 Jul 2026 15:48:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356380.1611020; Tue, 07 Jul 2026 15:48:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh82F-000621-6r; Tue, 07 Jul 2026 15:48:35 +0000
Received: by outflank-mailman (input) for mailman id 1356380;
 Tue, 07 Jul 2026 15:48:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wh82E-00061v-BJ
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 15:48:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh82D-006mZF-0d
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 17:48:33 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4d1fac-2eae-0a2a0a5409dd-0a2a4501e948-46
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 17:48:32 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4d1fd0-400f-0a2a45010019-d1558031c9c7-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 17:48:32 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-493b966dd74so15317625e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 08:48:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e01e658asm44553165e9.1.2026.07.07.08.48.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 08:48:31 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783439312; x=1784044112; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZdyCUM9vDDrRDYXxbHjr0qUoUhN/TW16J1gwhKax+a0=;
        b=SeiIE14804jDpMSSBIZuggD0chg1OLG6uHIsh3bJ+VBh6lfyWzFAkgq8mRBiM8C4Xw
         JaXoDSmeSK7Nkk2vYwZ0msbW7+f33F3687nIh6LX0HLvk/B7dyvDj+AUbqJUs8Ez0qK1
         lyMRkjbycMEE8nc3xRbv+rThBCe+AUYwABA4NLUKDte05baOPOUV3uuYh/xWUxBK7ibs
         EEsbZpX71xPqBf3M43wTUVpnbKZmq7PynRfpWyN/8KTeqjlz6nEKF/0mJWw9r/KXz8GJ
         iG4j8RUhjG1M0vYdoiPRD7wumkMa70miaXyxBlVLoQjh2GOQi0iJsvlV/dG6FaykZFZw
         UGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783439312; x=1784044112;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZdyCUM9vDDrRDYXxbHjr0qUoUhN/TW16J1gwhKax+a0=;
        b=GP/srv2YAYjgrHuxdf8MU3juR73YCRmXjeHf3OZteBGvZiyOKrQtkfv9iLgJN1yqYd
         vrhp+GDN3O8zFDVbS4y1re/0IJOSKIp4Hutu+UcRhIpBZ4/8t4VE++3ZQB/4SslpXTSB
         on8ITx2VysC/pRXWzUkFT87xKaJ83FSkQIPygiR3pyJqfiDJL1AVXu3lFm3l81wjSF0a
         kEotuFlwl3apLyNVkHf8l7PGKH1vMGsw6d32AFPG8aI2JbzalC98dS8A3IG8d466cPX3
         3ze9cnbY/cUXnpJfjc2u6Y3WPVCrE9P35aIRiauDXlV6ody9ewB84u0VZyKKyOCu5hgS
         aR0A==
X-Forwarded-Encrypted: i=1; AHgh+RoeGMRyGsJsPIn0cVmSAYI1vSPBhQJ41cD8Du5cpoz1oojgcP/FmEO5o+5GNyv9kQiL+NXPKEHzrjk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4dMkA4QMRJaBwzde4/HW179mzoxtXFeqWTo4Cr7ph3IvxKT3u
	Fpa4HDBnTKoMaiBwHrzubqy8X/nCXEZZLPlgjCoKMazg9kTz3D3OrtYyI9M8Fe1nQA==
X-Gm-Gg: AfdE7cnH33CNY4rbazJcQkyp8FQbU4512rF1oFSFh/oK05IuTa/BeZfD2zmbmjIbx8u
	usnDujBamQEuYCvhpFjaNR/IjWfzNJPTqzowtec/cTbA7E6pIE8NCdMeOy4gi2A1ppYwCZyHDdJ
	uEd634/+NENEpLPzR1c6Dxl204+RXsCIvUuXKOApdTnueGTJW2jN3ZfWjrIgeWgx9Dl2FmbSi/Y
	5kDEhiUblhwPUHt5Q2y4vQ4MvYrKtWgQJtxWlWLqaxoCvxJsClqTrxxlAVpPE+helJbHELdAkhX
	RR+T9G0QKF80tsNpsBY3Z2cINpH2XujeUo0+J2adWBnQolVpNzBuQkM1mhB3ZPLIYWCY7oGZNie
	huG/kaAf0zKuR8heThSCp45zS5PkTEG0y0nZhHm0IuMhmkpq9YvW8V9Lzwt7bmsT0ZjzXMTxcIt
	p+tXHecRIk83eG/ZA3C4WCJmW3wF0ufJFRorKk26GL+pBJVGS9MgASjLax5flzhcVhiu50OeWSL
	j43
X-Received: by 2002:a05:600c:350a:b0:492:e5a5:5a46 with SMTP id 5b1f17b1804b1-493df080753mr61329815e9.35.1783439311823;
        Tue, 07 Jul 2026 08:48:31 -0700 (PDT)
Message-ID: <8d309bc7-a972-4abe-a6d3-9de004ddd627@suse.com>
Date: Tue, 7 Jul 2026 17:48:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/18] pci: Allow ommiting func when parsing with
 parse_pci_sbdf()
To: Teddy Astie <teddy.astie@vates.tech>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1782747421.git.teddy.astie@vates.tech>
 <1782753822.8631fc262581453bbf619ec5b2062170.19f146885bb000701b@vates.tech>
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
In-Reply-To: <1782753822.8631fc262581453bbf619ec5b2062170.19f146885bb000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1783439312-D14DD1E0-F5D82E49/0/0
X-purgate-type: clean
X-purgate-size: 365
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF42471D7CC

On 29.06.2026 19:21, Teddy Astie wrote:
> Allow parsing PCI SBDF with the function part omitted (i.e XXXX:YY:ZZ),
> in such case, the parsed PCI function is zero.
> 
> Then use pci_sbdf_t variant of parse_pci() in parse_phantom_dev().

But you allow it to be omitted everywhere. I don't think we want people to
omit the .0 when they mean function 0.

Jan

