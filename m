Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLavLK8QzWmMZwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 14:33:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA3037A7D4
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 14:33:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270198.1558933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7ulM-00029z-MU; Wed, 01 Apr 2026 12:33:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270198.1558933; Wed, 01 Apr 2026 12:33:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7ulM-00027U-J3; Wed, 01 Apr 2026 12:33:36 +0000
Received: by outflank-mailman (input) for mailman id 1270198;
 Wed, 01 Apr 2026 12:33:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7ulL-00027O-1l
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 12:33:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7ulK-00C2Tg-Du
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 14:33:34 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cd108d-5cb7-0a2a0a5109dd-0a2a4508dec8-40
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 14:33:34 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69cd109e-fab6-0a2a45080019-d155802fbdec-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 14:33:34 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-486ff201041so67496455e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 05:33:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf21e3602sm36541686f8f.4.2026.04.01.05.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 05:33:33 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775046814; x=1775651614; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A4jre5ZL0ZR14ylZjsrp9i7n8+7Of9Lvm5Ieg71s3uY=;
        b=dcPK08B6/OsASpwTu/E6CZCxhC+XQLG11lkIhGVguR/5Af1vyJASJo6ftueFy57uks
         n03hLIdS0ZZ6cPaL9dlRNcdZdyOaGGANawKxwDBA6lHV+TRrMgsVSXzGm2z4xUh8O9sC
         Fg8dp5M+zjBSbvAuErfDjIoMDw2hmJG9D6J1FsZSvfqdbkQ7w/9vhT0k+37HOn9tavEX
         IDzGrf4c4ZBrIkgyqQFDauUBV5pT4sMh3BVrdUfU4NoHfiQ20lrlzOWDQo/IrwA6+rIO
         YZGTAeVwc108fe8DKgG6HA5jTPzWIpJASfPAuLVw1uNE8gEUy22+ZIqkUpNa3M3QHEH6
         lX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775046814; x=1775651614;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4jre5ZL0ZR14ylZjsrp9i7n8+7Of9Lvm5Ieg71s3uY=;
        b=PEc8vcppYuBfUyKCOB84gohpRxLIX8wxp2C7cCOe2GI5H44QfdYsI+UuRnrNNtTGR6
         RydTcIDUnS8geAKkoAOhoBDFG4J5uameaJ5/88hR8LHkt0eCkmBE12U47MbobbOVU0LK
         h8YozmRd2HMyToTeO2sTGICW4FTQ5Xkm/WcvyKns/p4bok+JHoI61bjrr6d/kJHOPTx/
         1IFU7t+WVIlY99d47hjGfdHjdokADBkIKklXg9ONu9BL205JxVYIR/GJBQDlpf94uvuJ
         wE1c6IMfdRpfNTiWvANIJc5ik4EPt3w41ANCFoDe8vu94OGyJPyq+JnWTbdbJPDh7mRP
         pxDw==
X-Gm-Message-State: AOJu0Yze6wO+LWhWHlUW6j7uHaC8AGrXkfAVMNk+dQiHarkDb3wyn3gx
	f00Qaba/ZYnvjfJuMFqoglA4m/IhoGJ6IfYw1HoK9LX+QY3WjiY80ryi4aqDcKaDbW1VKaTC26n
	fKJQ32w==
X-Gm-Gg: ATEYQzzMfXvh3rIzH9M9kNtUbZdpK7Be9gOwbawLlBr8YVKv7yBe2g1olpRIsd3z/Kz
	uxl5O6ZpImxmQmol7W/HKfdNP7aV+pCnz6gvUdl1/i8rI3kOVwf6QfT+uHX73C1GqZXlBxOsUvd
	VAVyuhUJ4WSKTsGn+SQrWkry7SPHvczoG9xplC7/7uZQF4rdVWVs33MntsW8Yu81QMnqS6YlOgi
	QlRbw/W19Tkb8A9EbnPjfnr3wVdOSyQneiTYDWlGtKy/161UM5isO3ADquuKHtBSuJw7IogwoXi
	kkh9BJizaCgTsfzDkBQ1jhRfGSKAm+/QDXfhj1JH1ZWKvD3/JziAwjXZGO8DmV36+YT79/CkJTN
	fBoHRRDHeBDyrx7UVWpjscANIIgRXgD0jI5EYEn4r8P+tlxkfabkmem/81h7mthAkJdkVcVLqzJ
	AMGMdkXw1yl0YgeUjO+p0cSbQ0nzl0q0H4S5q0eT8ebk4NQwro/4sEzM2ImHx8mdXgihDzTUSyW
	nqogDIHgc76obw=
X-Received: by 2002:a05:600c:4744:b0:487:716:2fa2 with SMTP id 5b1f17b1804b1-4888358ccf6mr55191775e9.16.1775046813525;
        Wed, 01 Apr 2026 05:33:33 -0700 (PDT)
Message-ID: <6d7b4344-8755-4dcd-a5bd-e7e5f982c11f@suse.com>
Date: Wed, 1 Apr 2026 14:33:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Ping: [PATCH v2 0/2] EFI: cfg file parsing adjustments
From: Jan Beulich <jbeulich@suse.com>
To: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <aa19318c-c91a-4cda-b36f-d2049914c42c@suse.com>
Content-Language: en-US
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
In-Reply-To: <aa19318c-c91a-4cda-b36f-d2049914c42c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1775046814-7455F497-28268A60/0/0
X-purgate-type: clean
X-purgate-size: 195
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1FA3037A7D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25.03.2026 14:22, Jan Beulich wrote:
> 1: avoid OOB config file reads
> 2: move pre_parse() back next to get_value()

May I ask for feedback (preferably an ack, as you may guess)?

Jan

