Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PXUMAN5DQmpe3AkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 12:07:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD256D8AB1
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 12:07:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=EEVYBhyU;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1347423.1605279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we8ta-0001k0-T4; Mon, 29 Jun 2026 10:07:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347423.1605279; Mon, 29 Jun 2026 10:07:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we8ta-0001h6-Px; Mon, 29 Jun 2026 10:07:18 +0000
Received: by outflank-mailman (input) for mailman id 1347423;
 Mon, 29 Jun 2026 10:07:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1we8tZ-0001ft-NP
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 10:07:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1we8tZ-00DR4L-3s
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 12:07:17 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4243d1-e002-0a2a0a5209dd-0a2a4507a1fe-4
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 12:07:17 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4243d2-9c8e-0a2a45070019-d155dd2ee09b-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 12:07:14 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-472493849a3so1153649f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 03:07:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47496fd271bsm2460348f8f.31.2026.06.29.03.07.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 03:07:13 -0700 (PDT)
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
        d=suse.com; s=google; t=1782727634; x=1783332434; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1BKeN7M96xr4xtm402LCsLk/aRKwuLGaMxy3AuQ93kk=;
        b=EEVYBhyUFay5crbmCo9UxsO6IlzTEnrZ1Ltbz/OgFiW0zYKdakauQ27019FQPX3Iz0
         F6N/VOfbucsxH69MsENIOcIFF7w+V+rCOUDG9eO0bF8+HKjZUBITrdGQFsoO33to3MLP
         2lphQEdIILpTF4Ci6ePJB0xgLWvD+SvJ8ajZdBkg7UnIRQzBUanuvAOcHbn7ms+6yWvd
         L49YkTQDXL8UJaQAbn23eRG1Tyl6kE9GV+Ql9gTGdcO2+5aXc9DjGAibu0bmFBfQUonH
         A+VFjfjSLXYEIdwouc/TxScjeUNZwwxqSATLFCynpLT5HRtsMUVAGbDFZaxlDVuMMWkG
         yK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727634; x=1783332434;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BKeN7M96xr4xtm402LCsLk/aRKwuLGaMxy3AuQ93kk=;
        b=BGIEPFLayd4Yjg5v7s63+7Nujq8HkzPLSZ2vNC/Akq5A8DDSEuXe9BGvLbc1ka+GRI
         0b2rJpo9zykshPE/0VGcPMgXm6UdAF1doE7/QwBEyfnN+yUEaUgqHnOefSplyGd2HWbv
         eJbN5b+hOX3yfY4W3Y/04aHjZb0N+C949euOBlcQbDg1oGt98KuK1cAWx0goc/jSyCnn
         xtzTAyzaXbTL/XaK5F/90nYJNJ2UUDvGYzJYwEyID10OLmiQZ0OzfrIxtaupIUn78ADH
         G+AXvotNAPSjhHT008ncNEkIs1NQK1ZqtvGBtaj3umEgPB8O+9YlfqRL/wNPruQtyWOt
         Vg1A==
X-Forwarded-Encrypted: i=1; AHgh+Rp6qpav7X4QPYdrriHPTQze4+pqWwk5YhkqguuXdGMJDFZsxNSBAD6Tm2TBXt1surFRTiJ+MK1JYuQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6TkQvATQ3+yAWBThZyItEOvkDPxQOjzKSAzQXgAC5XS1pB+zC
	/142rOWktbYFEba2BH5Guqixtt1RkoZ7kcbePsmXZr3bvgxeAu9iURyrh919L/aqGg==
X-Gm-Gg: AfdE7cnBMk/WyAAPXWKIOnPBdNUiy3z9blHJFT0XYqP05foKmF3WFX0tEqWJHxzKsGm
	D3xeqn+HvruyC+tO7xS72LOsbcvCTy2ky/CALCz48TC4p5uQRnXCq5r/2Vuyv1vzMi76b28B2aC
	plCUlxYOzvjH0vxoibdhtzCiKTWCGV2CbtYK99hGgpPR+l7C5D5Udyr8CkysVeLZ3/VM2ccrqAo
	eu2CdU+YCFJrEzI6fGUafxdx4Sa/azgAWkRMJyAHJsg3jqb5JMiU9yUo1ebWxlKyuOdHZf7sDpR
	QsgeNSxx9lN1MNnC3fQ321H2+cQ2C7nZ0Cm7UPOz1YCO/XJKsyDb+VZ1o/H/7u8AfBNwEBlf7CZ
	elsWYuNCGO447xCv963xvHz/oV43HbEOf3sQiHp/iTkeHDqLp41D5ikLL1AwRbMi00O1V12zvV/
	5urGTRyMM4huBkryR4ae7TLLGy8pCFr9cKSGAjvqGSF+XQ1hV52d+NI2a4V6ueuWhktTS2CjBY1
	g14
X-Received: by 2002:a05:6000:26c1:b0:473:f4c3:4d51 with SMTP id ffacd0b85a97d-473f4c34e14mr3646324f8f.43.1782727634189;
        Mon, 29 Jun 2026 03:07:14 -0700 (PDT)
Message-ID: <02604d9d-9798-4908-b7d9-db3ce69371f8@suse.com>
Date: Mon, 29 Jun 2026 12:07:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2 2/4] xen/ppc: introduce a dummy irq_to_desc()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260629094531.55555-1-roger.pau@citrix.com>
 <20260629094531.55555-3-roger.pau@citrix.com>
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
In-Reply-To: <20260629094531.55555-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1782727634-7EB3B25E-6729C8BD/0/0
X-purgate-type: clean
X-purgate-size: 346
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,raptorengineering.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:tpearson@raptorengineering.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5CD256D8AB1

On 29.06.2026 11:45, Roger Pau Monne wrote:
> In preparation for irq_to_desc() being called by common IRQ code.
> PowerPC doesn't have an irq_desc array defined, so it cannot use the
> generic irq_to_desc macro in the common header.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


