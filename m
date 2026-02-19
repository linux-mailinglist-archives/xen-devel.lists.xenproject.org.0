Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIOLN0gxl2kcvgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 16:50:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D95B1605EC
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 16:50:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236511.1539206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt6IH-0001Fj-JN; Thu, 19 Feb 2026 15:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236511.1539206; Thu, 19 Feb 2026 15:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt6IH-0001Cy-Fs; Thu, 19 Feb 2026 15:50:21 +0000
Received: by outflank-mailman (input) for mailman id 1236511;
 Thu, 19 Feb 2026 15:50:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vt6IG-0001Ch-Fk
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 15:50:20 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0b0d687-0daa-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Feb 2026 16:50:18 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4837584120eso8255895e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 07:50:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4839ea1e9absm22554085e9.3.2026.02.19.07.50.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 07:50:17 -0800 (PST)
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
X-Inumbo-ID: b0b0d687-0daa-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771516218; x=1772121018; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vL+NPhak5gWUHDY0Q7SGnWQewBdfLXy+S5oN0ZPZmcQ=;
        b=BYK8jqTQYfd59yxG29lTrtcE9l0sZBb2eZ3p/e2avTQ1cU9D34MmkbfLJb0ypOHXjs
         EyeXXgIDzuYmTbUUUXgAD7/SCwvOxuDOrcLjKdYDVJMbd4lpGFMTvqSD2V1IHlp451nR
         7d0Gn/Uy6+AnRnfDn6yNowAbatfZAu53L49lr7+5M2rKfIF+jwKSwnx0pVrK7nqKg0Nx
         t80noQXIL7FIpz2pg4qIwMOnBckF2NQEM77YJqKiIQDZ2ODK8Iz9YYYmPFHDlBNIx0Yi
         Nx4Gwunf95Xr9+HkbaGtVmYb+lrvOahhXSf7Nrsf8/HdTZtlBxwRD2/Wtxiz0Vfvjk/O
         Tr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771516218; x=1772121018;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vL+NPhak5gWUHDY0Q7SGnWQewBdfLXy+S5oN0ZPZmcQ=;
        b=GhR1XG1B5BAwYOFBq1W9KSVkv7Y8ptnZbeOb6ipwFHFvlRIq/CVRNQo/ETZ4jvIkPK
         6PlubwMrMD1SOfgFF4RAZQLhJDnYvdwvgLXJB/EKPKOb4GZ8wi12a05lFo+kaP26gzm2
         y8aHM1g4LLno/LVupwOtuUo/D6upbx/phN3tNcJ1BTiBFnhuxIkgd24ABu3gcIvRjOeh
         zZN8HTTfoMnsf95iPdWXgJiXfxnrB/x0FJYPVGQeJn75CsxF7lqmOWpRQ0oC4LCPryxi
         T+/hRg5DK9jzdjn4G28jv2GmX0HufKbWAMjf90TWKc9dS5KZl15sbL70hy8pyp65KOx0
         rsKA==
X-Gm-Message-State: AOJu0YwTpg5kq0el/TW2OMNQa4ZbPfBNGNjkM/qu1sFVQIg6yrEaYi8Z
	3u4d3Iq7Coj0S+jsLKlr4VPAX1sxBbpaoIIwNOHEcI/I742fwNU7kaM9gwRrTDTG4EkzV29fdvM
	CGXo=
X-Gm-Gg: AZuq6aKVJ0aPZIueGUodrzsdtq8+SXwkTJlR8X93W7lvUuDSvgTIY5REq7I4VX10wM6
	5VK4OTC9L17+x5W3zWpw2DjvQv3aL2dYV0KewgBhWEnFQJIlWqwvBQmk4OxrjasQn0UDvvPs53k
	CWblcyPyBX+VECRJuDlkLy8hU1fzapkCEzPiSd4LhGPmKifJiOU+NfkY1HTN3YLq6kaRmcVR9ws
	7SwEdUJg/Xk2ve5g8/kwA6YcDU91Cn0dXa/UIYeCKykFpbnF0X/mFB6+xgunT4S4t0k98JjsA7S
	NH8XBqKzpD8zGo1mjH/hatFzuYAqYEatugqKDLA3YO0ziNGoLxfr7v2rizOLuKuSdESGuNKHzBb
	zURCcdcGvj3Wyh/BuY1VO8jX+ZxdM+gpdQKyX3WVoPr7rhG/MsneuuIZMo9Ek7iWbSfT3IFzr8X
	EnJ6XJWzbhbaV5N4fkjZ7jK4qMw+yIIz0iEwjdQruxbO8NhtCCWRkwU+F4tlS5W1Ww1DOUlBM6j
	k71QMtJVN2y6d4=
X-Received: by 2002:a05:600c:1c08:b0:47a:8cce:2940 with SMTP id 5b1f17b1804b1-48379b991c6mr314854705e9.14.1771516218039;
        Thu, 19 Feb 2026 07:50:18 -0800 (PST)
Message-ID: <924f3ef2-7883-4322-a921-edc814c96719@suse.com>
Date: Thu, 19 Feb 2026 16:50:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] ioremap() et al
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,amd.com,wdc.com,gmail.com,arm.com,epam.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8D95B1605EC
X-Rspamd-Action: no action

I found an old todo item, carrying out of which then made me notice
another anomaly.

1: make ioremap_attr() common
2: make ioremap_wc() x86 only (for the time being)

Jan

