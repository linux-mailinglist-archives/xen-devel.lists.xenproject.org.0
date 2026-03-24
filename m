Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sE6DKCC+wmmOlQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 17:38:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1048231925B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 17:38:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261126.1554248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w54mE-0002xw-Tj; Tue, 24 Mar 2026 16:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261126.1554248; Tue, 24 Mar 2026 16:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w54mE-0002us-Qb; Tue, 24 Mar 2026 16:38:46 +0000
Received: by outflank-mailman (input) for mailman id 1261126;
 Tue, 24 Mar 2026 16:38:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w54mD-0002ug-Md
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 16:38:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w54mC-001q6T-UB
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 17:38:44 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c2bdf6-2eae-0a2a0a5409dd-0a2a4503ba16-48
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 17:38:44 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c2be14-1947-0a2a45030019-d1558035bd03-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 17:38:44 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-486ff201041so36507355e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 09:38:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48716549160sm905435e9.3.2026.03.24.09.38.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 09:38:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1774370324; x=1774975124; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PYk9vEEfGRYDleF6fCoNLGed2AL29CgD3kCqdLh6Eqg=;
        b=Ka25E67T5QSaxqUuPbGBjeu4LGthhVk0aCnO6VyrZLOYoPKDSudDTzOzMpbYGz24mu
         zhaNupCEpVzx9MSzzNxTs3EPW7YsgnGPRqRglJ3Xu+fyp3bK/jmhdi5el98Erd8CcWFv
         YOB6nVxrMoyKAG2pofO8gTJtAD+u0Tveul9ovVf5mXd9yAMV4djGi2TYNCMYh8UfNXNu
         MiLAWPO3KrYGkAHWA39SmkzqiItWumFW7aBilLcF+8rhja8gRmjWBBC2jsWkr7UsnwgO
         ZJ/Axj5FsBmjvNmqjuHeNPR3VQp1zZDJKt2OTzc6uMf2wV2FDvjjAmhTCIz6XXI2zAVw
         wEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774370324; x=1774975124;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYk9vEEfGRYDleF6fCoNLGed2AL29CgD3kCqdLh6Eqg=;
        b=TuD7FuHXKttKC7b+pt5B8+M1976NM87J7cjwgVFXmc6FdiFb/pktDzf+siwm6WOcqe
         Z4x+pBXhghljn92+OwyhpfErWsAPtt9YFJiYwBNxNfSHDYnn3zrfLk0PmjT7dwrKmR7u
         EWjpPOyx+3sxppO1jstRY1IdVEmNVFq5oRq7akBornwLBT8hGnGDtvY+66VK8VFcLN5I
         oKtk0Ml8pNCxx1mUzn26Qf4QviQJO3QYWnXJ7lFpjSCUvAvqhgku2zFCUd2C7hCJAVQF
         0n/P3EKY4N3as6LAfhRb/LuDTONhq0l70JcJxxZGM1m4xiqFOAon6C36pk9t3R8JpxzP
         IFfw==
X-Gm-Message-State: AOJu0YwUHVhwMWr6s/u66ULOsWFjdHQoikKTl96ax5CQAOBjHYD7l0Np
	fh5gSG5zbNPgP7vNmrAGzT68Trc/71B/AlPAD9PVzwszmM95SulUo3VsvFQgZbPAetZ8JVjeNgk
	tkzMOGw==
X-Gm-Gg: ATEYQzzHM3/OKU41WtfPAfCnz+nhCX1TpPLuMGI6iAEkrXzvPsTnO4l2wHZO241hcHB
	aRllZ/NKwTQPq2qf0yHK8iDyl2yp8XQzIeqKjFtnuIvcZ5gYzAh1B5hGhLbRlpN2IgFBGMBHIDl
	0H2XBCKrCeH26jf35ogqn+VlI4r3h8hJTd1F17KdFTEVzhsA0hrkAhR2IQIXo24P2T5KkRkzB8D
	8n+Xkf2+P7bA2nWN5ZWtfHHQESLSIRvy/N08acptKJqDuyJyRjNaAGD5aulTZp3bVPmrdlF0eED
	ViRu1Q1TZrhjOzZWTffpxU2+UAHBpJV0WyOqHxXas35v62fAVtIFZnmQLxT0vaQqPZReaH9ArgF
	YfnoCyUZwTDIg9xpT6Hb4YFH2hQvy5GPpsBW59Eq/DevRdJg+1mZx/cqV+Pc4PgPbUaGtpGIKSn
	SErnpWAvDndF5ylAXHLx3E1+Tivlp7/dr58XYi+eU8Qf2jUQzUHYciFpo248xdGghoFu3qVd007
	z4Grh1SJeDz5DOMNXAwgDZDRQ==
X-Received: by 2002:a05:600c:8886:b0:480:4a8f:2d5c with SMTP id 5b1f17b1804b1-4871606dd88mr4297395e9.29.1774370324272;
        Tue, 24 Mar 2026 09:38:44 -0700 (PDT)
Message-ID: <b34b6e26-49ba-4ab8-8f43-a53c5dac63b7@suse.com>
Date: Tue, 24 Mar 2026 17:38:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/5] ns16550: harden positional parsing
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Kamil Frankowicz <kamil.frankowicz@cert.pl>
References: <63284ab7-8e38-4448-a789-1b9c23c4d95c@suse.com>
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
In-Reply-To: <63284ab7-8e38-4448-a789-1b9c23c4d95c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1774370324-4866F72C-FF9CEDF9/0/0
X-purgate-type: clean
X-purgate-size: 706
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:kamil.frankowicz@cert.pl,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid,cert.pl:email];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1048231925B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Advancing past a character without knowing whether that's the NUL char is
at risk of reading beyond the buffer.

Fixes: 25de1f692059 ("Allow arch-specific defaults to be specified for ns16550")
Reported-by: Kamil Frankowicz <kamil.frankowicz@cert.pl>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1541,6 +1541,9 @@ static bool __init parse_positional(stru
     {
         uart->data_bits = simple_strtoul(conf, &conf, 10);
 
+        if ( !*conf )
+            PARSE_ERR_RET("bad DPS setting");
+
         uart->parity = parse_parity_char(*conf);
 
         uart->stop_bits = simple_strtoul(conf + 1, &conf, 10);


