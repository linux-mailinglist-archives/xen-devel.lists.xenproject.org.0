Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e9RLFKsBNWqylwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 10:45:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A09B46A4B01
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 10:45:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=JxRoEjkx;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1341937.1602235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waUqp-0004TK-CR; Fri, 19 Jun 2026 08:45:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341937.1602235; Fri, 19 Jun 2026 08:45:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waUqp-0004R1-9O; Fri, 19 Jun 2026 08:45:23 +0000
Received: by outflank-mailman (input) for mailman id 1341937;
 Fri, 19 Jun 2026 08:45:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1waUqo-0004Qp-Mf
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 08:45:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waUqo-00BzDh-3D
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 10:45:22 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a35019a-e002-0a2a0a5209dd-0a2a45029570-28
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 10:45:22 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3501a1-fdf1-0a2a45020019-d155802dd59f-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 10:45:21 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so13501655e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 01:45:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4650b76e7c9sm6263420f8f.21.2026.06.19.01.45.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2026 01:45:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1781858721; x=1782463521; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fLKCHIRADBj7MhH/ep83P5xjQRVNMGjx7m28JcLAZ8Y=;
        b=JxRoEjkxpvYWrK6JzNHmLjjJe26SfFRtSBLvvlxZKqx4UEDWXwGlc/Fkvg314GYA/u
         t1aeALMC3Cn4IRwMdsblcXT1B2qwNFDVT1OxOlSOqSyt6ecBkRrv9KUGOzhoYOVQ/At+
         8On6Kp647FOmvPYhu8nOs7wdlNcttYHsYTG7MTvrIdUf7vAq4H67b4zrgYNSOerXLWoK
         FDivwmGHa1D6ynW2ksMDhy5ibmctLXcUbm3JHRuk2M5Lc0EAkwazv01iuWgIH9ef3Bg1
         o/H9Aby5H10MpMRQSvU3YktXto2ebl3LgBeBne76ajirMEQ0jrAaxkdANQYUxJFgKc+i
         eHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781858721; x=1782463521;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLKCHIRADBj7MhH/ep83P5xjQRVNMGjx7m28JcLAZ8Y=;
        b=GpYNoz4IZbnN1470XI8JT1BJ/zRVFpPoFKD/GMcGGZ7AmNd6GyNiX14ezi+h/mtFKE
         NSWcFAhnIKlorfG2AUnX3l9L51lwj+Cy+Wh5Vid0EODrkLYFs/mPnEZIhqZPlr2H46sx
         qVuvxRLb8sA1wtxVd6/CovxQ474f7pOBN3BV4fWnWuOISCi4l4R4i41SeWA7P2AjeOKs
         Q7EC2s9LnmgWClb/wRXf7DTwBqcHpklDDS4vVyLDnSQdtqjFWkf6O30VMW4CWjgQF7+s
         OSIIhfpxWWBohEwvaEL8FPV2MPFuLFLL2gYKJK6ajb1W4P/qreRGyREprVIl9GPqy4GQ
         o/FA==
X-Forwarded-Encrypted: i=1; AFNElJ8r0QEhx4zRqp5FpiqtB5Ye3guX8cnPMKK9sm+RqJzcFiPNLNPkvOvSpl8RqBt4G10WxtckidE08eQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwSWFvnUNuGtatduRS4DZK/vVd8o+ZWusJGvusi3SmVU4HETVZK
	Wcemn2Xx6fu4r3d3M1treWAhx1nQKhI+5IhaE3LbrFsqWT7nTj3j4WObAatMsJFmNw==
X-Gm-Gg: AfdE7cnIZpVCN1Q8cxvJXllCWqprgPNXRBbCo+hcZyaAgqCqcHTh3OJBbSGql/JTiS1
	q0JzSqhsi2ldGSsrxab2b7isllwaQefgJlq7m6PZhH3CNzxIkmsqFSyDw4uoaI6f43uUd3v/I3x
	ZExfbhZ6B5YZ+b8uJF46LP38AfTaP4oCrFHJtmm11sqtl0x+4f9aGe/g2cDqPa/4MLVrmxf3GAH
	5qOY61IJU4phU0zTb+swcndNCnF1K12y1lsF7UQ/v6ksmeAiI/vp3uSNBvZj3j/HXXOtqYjiTi4
	yuxWgFSMQc3SZ1QLdaZTBwwJYCT1OYdm0rDF7I0iA1+rWQUnw+ndCc3f29/ONxIrfGwap/d5VRC
	ZdOCH+o1WEmCObQbxSjHfLczEt1PDXhdOOur+42nJNK5ln7qh5J58kZvV4NjDdkT/SFBuvOtsyW
	SFNQF2XLzXtGXfcIEq9azV6tpHcoIRoWfj7503OBgN/mIAumTxjtad/IKxOzKVCB4rmP6cpEEk+
	JiU
X-Received: by 2002:a05:600c:8b17:b0:492:4188:5819 with SMTP id 5b1f17b1804b1-49241885b42mr30289325e9.1.1781858721433;
        Fri, 19 Jun 2026 01:45:21 -0700 (PDT)
Message-ID: <6642566c-91a0-4399-968a-f11af5a33395@suse.com>
Date: Fri, 19 Jun 2026 10:45:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/22] xen/common: Allow building ARM32 Xen with
 CONFIG_NUMA
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260619075011.377116-1-taka@valinux.co.jp>
 <20260619075011.377116-9-taka@valinux.co.jp>
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
In-Reply-To: <20260619075011.377116-9-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1781858721-4E2653F3-11BAE0F1/0/0
X-purgate-type: clean
X-purgate-size: 214
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
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
X-Rspamd-Queue-Id: A09B46A4B01

On 19.06.2026 09:49, Hirokazu Takahashi wrote:
> Allow ARM32 Xen to be built with NUMA configurations.
> 
> Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>

Acked-by: Jan Beulich <jbeulich@suse.com>


