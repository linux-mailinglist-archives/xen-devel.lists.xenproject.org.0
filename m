Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MVDAiSQ52n69wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 16:56:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D28143C5BC
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 16:56:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289083.1569304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFCWY-0002AN-2h; Tue, 21 Apr 2026 14:56:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289083.1569304; Tue, 21 Apr 2026 14:56:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFCWX-00027v-VA; Tue, 21 Apr 2026 14:56:25 +0000
Received: by outflank-mailman (input) for mailman id 1289083;
 Tue, 21 Apr 2026 14:56:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wFCWX-00027N-5t
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 14:56:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFCWW-0047PZ-Il
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 16:56:24 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e79002-bab6-0a2a0a5309dd-0a2a45019d3e-40
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 16:56:24 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e79018-c1f2-0a2a45010019-d1558032b883-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 16:56:24 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so59400745e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 07:56:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb75a913sm114955355e9.12.2026.04.21.07.56.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 07:56:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1776783384; x=1777388184; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pBh+l/Zh+Pjzy9kEOtP6QRpBsBjh/2RwCcttvpuOGoU=;
        b=fSFgzcfzYWgB6eqt2bFsXHobdVdMbBhIg7v33Iwz3lofuZ1YGEnUapgGsjl1IXXPSw
         jU2hv44DLi6GYqp40Z6otlx8AokB4SYGcc0K07cmBGZxEvYlohMOx5ue8B+EQuoIMwQT
         cNPIXvJkLZoAIM8shm6GQPG/5AxeVgBNemfOJAKII/4Qw/UHaQZyoqlGEFKSLnak3nNV
         iuh8p4NAxXbDsEGRZXBUGhjw4W4ASWDPiquq50I3xuXE7x7OgNdjAK/yBCtwq0zQBwnn
         xsSFpBZ3EkdSiBV5flzQSzdpNekZcNiQu1/q3kKhdl3XHj5wF7VH0wQZNoJe4f2gO2UC
         umvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776783384; x=1777388184;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBh+l/Zh+Pjzy9kEOtP6QRpBsBjh/2RwCcttvpuOGoU=;
        b=R7pYr36NlRmg4UQoiQXam9uKEj4ovoVx+7ZIV8iAE2NHJ0MzeDFmgQVeI6nByJ+IQS
         J4pa2IvH3kS5aQCqpzmqnmdMu8TDBoYiqgCQYQS7ENnxLqigIe/IOglTDrZFYzhAaYqY
         /cT2CH4zzq1RdiE66WYTxzUZ3RlD/ZM2IVV84bWhjaUfwZKnaC9Ha3e7pe8KO2nI7Osc
         az/fqDHY/7HjPi4Ij+rvPGMSNDn2BZABIAj7l678G3bp5H9y7ZyCWycPTki9eqITp+OY
         y8rGvhBAJ+veGlnHBN40u+qryJ3YjqzZnOfOV0Tek6fgAx5nrn6iNuTdlCUeSrYOXWN+
         H9fg==
X-Forwarded-Encrypted: i=1; AFNElJ82yqHc0YWnZLXvVPSPYdxSTDL9bhRUGKMk1BA/k8QDyAKLUy5ArVPbMiKxj3K88coBN4KQc1bEm/c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzxct2RZJhVARR3nXAM3A4VJH38lNrVLrLpXnqux8NhwbeBS8U2
	eZtTiw3KhRAXKtuIdJaQB483x4pgrmZuKjEtsOR2xGK33vJHUI9un1On4wXE/HzTIA==
X-Gm-Gg: AeBDievBnl2UcuqCJeVmutIk5k5T9QT6w3DFjWKrdgJsV/mDJd16nFtVYbYy1Zv0wDC
	7RYGIuUmKilxCOOA4EcMd+KCTJ3uHjkUt0MzgE3kET6FpZDFwGLQz2v9N5P6T3M+lYO/58SmhNm
	k+xci5Yjjbwj7XezZ/p5Epm8yTVKcMk6noheiQcsQQy4epeZ/zvGYmu8pGPXBRV054GfP15nho2
	uDajm1m6sFwoLP6sefYrcYnMYasn7fgO29Gz57QDTm2m+niH8ixPEj80+6shVuhc4e8VTF3vk46
	BnGwcQC3uXn3QxHT/fuGUxlX3/gGrDMYJrnJ5/4CV8Pyn4x9hllECvifwo+iEeaGdXJ4u/d8yDa
	RdvBLNAEv6wzVJ2oWYBx5lMJL/X8g8SpuHWhU21Q0CSBzIAcjDyj4sO1MI9QEDCXESFwMTxchlP
	ph13HA5ecYfHf/MgFUpwJDB4WSNLV1dc3DKArnMMuSVnQsYL2oyX2aFdx0v50NjXFOd2X25HB1l
	nFAad1CWZ/rbCWJMEtv0DXAWy3Ly9TYv3nE
X-Received: by 2002:a05:600c:1da1:b0:488:bc6a:528d with SMTP id 5b1f17b1804b1-488fb785204mr301838635e9.22.1776783383433;
        Tue, 21 Apr 2026 07:56:23 -0700 (PDT)
Message-ID: <53130f8e-fbb0-4162-93eb-c95ae1d5af38@suse.com>
Date: Tue, 21 Apr 2026 16:56:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 7/7] docs: Update SR-IOV support status
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1775742115.git.mykyta_poturai@epam.com>
 <65100dbbd16c10a76d2b1847f8fd77850f134559.1775742115.git.mykyta_poturai@epam.com>
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
In-Reply-To: <65100dbbd16c10a76d2b1847f8fd77850f134559.1775742115.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1776783384-B5C64FF4-6A90D5FC/0/0
X-purgate-type: clean
X-purgate-size: 453
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6D28143C5BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.04.2026 16:01, Mykyta Poturai wrote:
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

Might this better be part of patch 5?

Jan

> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -170,8 +170,6 @@ unexpected behavior or issues on some hardware.
>  
>  At least the following features are missing on a PVH dom0:
>  
> -  * PCI SR-IOV.
> -
>    * Native NMI forwarding (nmi=dom0 command line option).
>  
>    * MCE handling.


