Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPV3Gd3XcWk+MgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 08:55:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0915762B20
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 08:55:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210444.1522112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vipWq-0004wg-Sr; Thu, 22 Jan 2026 07:54:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210444.1522112; Thu, 22 Jan 2026 07:54:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vipWq-0004th-Pk; Thu, 22 Jan 2026 07:54:56 +0000
Received: by outflank-mailman (input) for mailman id 1210444;
 Thu, 22 Jan 2026 07:54:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vipWp-0004tI-2K
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 07:54:55 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2f173f4-f767-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 08:54:53 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-42fed090e5fso398628f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jan 2026 23:54:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569921df9sm43894070f8f.3.2026.01.21.23.54.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 23:54:52 -0800 (PST)
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
X-Inumbo-ID: a2f173f4-f767-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769068493; x=1769673293; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uy+/25C8wIOG9YLs0RH4n9xE0hTdhTudv1wLOOGooe8=;
        b=WB7Y6E60D68Q5YuuHyX/cMqOdXSspUxMnSbsqbZtzKVL/H4tKPamu644zr4lDxLbCz
         4ZroHlANr+Prf2j4zIw+2Ov5rzH6S/e6wiw8EgQjMUnOM0vrlr+VzZQohFzfk5IMMlkD
         1danedkAieN3lSChPNqcqv+cSdgDq1B4vjlGvW95lcgoOpNbWXe4hah7Z+M7EE9+9z2y
         lzyIRWSPnzAcJ1qrvgQDGV+uagoRHlojOghhV4tj7+9bUA+rrAXbNYzQ2YoAIwiF/vpk
         s1956GNUt4wT1ZV+hegW13X0PReYD+fU/tfYg7Y7zXRnseJ4DHxYxzUxCF66sMqDG3kh
         J1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769068493; x=1769673293;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uy+/25C8wIOG9YLs0RH4n9xE0hTdhTudv1wLOOGooe8=;
        b=rqGBucgq0OIMZ+XBcD1cOL7cjmU/L3Rwyt3DxF5h+9MPgdzZTHnC79XhajXZwxVdya
         dT/3aUZZuD65eZjLC5e8S7rhFmlx2qVqohXd3pQB8FzAfUydXxQKRtlwarGJGdz7X5dG
         9uzaBvyq2IZAQRQS2eJFBh51nIqY3cyJUNcOXPsztXQeBCEPPvCVW483bKf9BQbbN86i
         U1tHdGtrPvXVvyUF2K++QlmUNK7J4t9OMoiQRFAF03JiGlJvrCA5O98S3W/Zvi2X8zMG
         nqmirFWr8OwOrfSRmCP73/xdiKN4pz5uV8ki9x7Ud7lkYEW1CIclydYj+wJ0sEkG1w4D
         MqpQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4yKHbUs/EHiFDwXjFPTGrBLE6F+zKkCg61HBxdKR8wDMi8o8FQU7HQKhjyXkCz3LXJixC4WZTYZc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwY3su/qtRrtr22YjA2ZHMYsEvInFXDIYkuFTDU//FPUgqfGzTL
	8uVbi69CwUgaYzOIF7jypB5fLYc9dtJN2/W8ZZc5F63WR2i6vjGpwL8UyW3CxNNKng==
X-Gm-Gg: AZuq6aKj+PDyNhpnzsYVHvNz3c4nJj3SH50hBShuCjOPGW2qhlEtm7Il/atoY+mwuA5
	+NTemviNjXGjKcUJBPggW3775S4pY4up1C7PCVnNHxkHfXBjV3YQKDnXJjA4uRoClXCEGZu68V2
	4pHowYo1jG+Er+u5wRUjV5qppZT5GEy3J6gI4A8BhsxsM7h7S6j1hPOYUGN4Go4cJOkdzpi2VZ8
	5dK5KY8IA1czBi8LvkanMtmv9s3z3v600c3i80px2sRG97pP1LKYHc3z+M8PkD6fvsI7cBeUzvh
	YE6K9O76W4GhOJg9pbjI0mx2+lNwcQ3G7Rau1dq1iw8dVy5B9EJm2gLN9D9H3K+dNzHAxrVzbtU
	jw+/CKyF5C9iVoErxbahd8jNHI2fV//JUetWcimpw8DLzLp30ek2CSMjCkV15P4efEW56xTHHmi
	rvieaYDsUAR1NOPfocncxVaLBdsJuWRtD3Zj7FTpp6vplM4hqQLur/2Db2pIQtQc8YRcuPlZmOd
	jkz0WJTPnp6og==
X-Received: by 2002:a05:6000:3105:b0:435:985c:48f8 with SMTP id ffacd0b85a97d-435985c49b9mr10065607f8f.45.1769068493178;
        Wed, 21 Jan 2026 23:54:53 -0800 (PST)
Message-ID: <8f1fce9a-fc2b-48ce-8c50-2c18fe82e399@suse.com>
Date: Thu, 22 Jan 2026 08:54:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/svm: Adjust VMCB comments
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260121174314.1465759-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260121174314.1465759-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0915762B20
X-Rspamd-Action: no action

On 21.01.2026 18:43, Andrew Cooper wrote:
> The Intercept comments provide no value whatsoever.  For the VMCB, label the
> Control area and State Save area, which are the names given by the APM.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


