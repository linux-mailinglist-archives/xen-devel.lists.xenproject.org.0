Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKnLG8KEy2l4IgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:24:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D20C83660E4
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:24:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268709.1557932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7UOf-0000gt-49; Tue, 31 Mar 2026 08:24:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268709.1557932; Tue, 31 Mar 2026 08:24:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7UOf-0000f1-1N; Tue, 31 Mar 2026 08:24:25 +0000
Received: by outflank-mailman (input) for mailman id 1268709;
 Tue, 31 Mar 2026 08:24:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7UOe-0000eq-1y
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 08:24:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7UOd-0071qi-Dr
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 10:24:23 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cb84b6-2eae-0a2a0a5409dd-0a2a45028258-10
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:24:23 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69cb84b0-63bb-0a2a45020019-d1558032c17a-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:24:16 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso44522015e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 01:24:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e844442sm17575545e9.13.2026.03.31.01.24.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 01:24:15 -0700 (PDT)
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
        d=suse.com; s=google; t=1774945456; x=1775550256; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MuaYHKqDVKRd6ZxFR6nh9+q+CaaTQRLhUubCPOS5NiA=;
        b=bJnG8vyeucMNEgpcchcXgmuOHwyPDUprIuC5mhZDiaZivqlKXQdDmqbOXLO4knGWNk
         zVkDblnjjKkIsNr9yfuPCKo7bFL8+ZjWMNyJ5iM7IvzwcStgdsjIcVK9jD4QyTvISfL0
         LPFe4TzzZ6al2tnv4xiXLrnFweihdfVSzgSCm93zu3reygZ6OGtddt3pDOMQHi7viLwv
         CTVo9oGilTNotdWJd1+F5hGBHLccL1QYYBgMluKdlMp4BjLp8mJKTA/5245cq59p2xQu
         dFSTq3c34tFyCt65Jl5AEIJ3o7oJ+fXHac6S62wI82WTsgpJF6/O7bZ9CmwuCpxK2AeT
         dS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774945456; x=1775550256;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuaYHKqDVKRd6ZxFR6nh9+q+CaaTQRLhUubCPOS5NiA=;
        b=NKHwX/iT476RO+5uBnRwerVP3kyBPQviJa7BVcONw/Em9xi4WM/fCNINwt+2JLrpVw
         ijIExY0WBgTGZDfa5buC8xUe2ivhPYvjQ4hBOo52T4Vbq/s+zrOIJIz5Ep9bmIZYxaca
         IH8E8lOZx5+unlwdMAVOSMR7jrn6A0a7JRyT5X7b0noNF1imvzF3bVhG4CXdIfk0r1XB
         bYJxgcKT7KBOBu/WQ5eL0soCKMkoq6jYsdNdRY7crTaaNx9E5PDAtITkACOQfvvUfpJt
         dnRP0u1EDyx51gksE48zimvYSGVVqUyyKWYgKtZ31W9BvrsZkUTYjZBrvaKqR7Yo9YBw
         qVng==
X-Forwarded-Encrypted: i=1; AJvYcCWTiPEhQ/uMYcQfcmV4g8ZMJi6AzIXSJ/mEW7JVoKxAkMcbckIWIeyH7hWWMrFu85PyYogBsEU+GkE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztzULrLm1hHzOyZvi34XXXGJKZ9lJ+mDnpC6K/Zl6KLudo1ede
	cgCMMxqYg3SL6qf0aKJc2xplUd6EFoRDsxC4P3njvEKSOIsT76fg0NwWYZMEkg1nPQ==
X-Gm-Gg: ATEYQzxQl0Q1+ErF1DqeLz5zNVhvgTrRWKwY59aE8o+cW+2PD7VBgHFblnRvy0OlasY
	getemuCzuJLkZEdQIH2klXXTX2qs6v2u29HbaGSKKz6/jS/jcFDSvoIvA0AblpiJH+iYtXdqegv
	gCoK9wqu4bZmJJ3wE9oPu57m+bpZG5BzfuZlHlCUFmRwQ2zb+/Accdh1iga+coHTQ51+CXuvICs
	8XX0TKBFqDx7AT4q6OsCEJqf7U2MlHTTmSqmeGB8dsvgMG4Zfh6GP2lYmHUGg3gvLO6wvAS72Ah
	z6fEjQhhEDlzaCK/ECO9M++vA6+MPpyMNds4L9/2GqThUddOhtiQAF+xAAAek9w43H+cQR6w4Mq
	dhHAJ/Tcm6YJLXzECK0A4NFkvQ1JdR7TP8yCsYOz4KgTdb3gl7i1lGLLeaXXGv8NRRMzLslngnN
	dgCUrX0Ezr+cTNHUPuSgzgCadQQKxIHuR7eOkdSzE6jpRoOpS+IALx7zA4amVoUGbwTHZUzS1Bg
	qEtWEJvMeci0F0=
X-Received: by 2002:a05:600c:34cf:b0:477:a1a2:d829 with SMTP id 5b1f17b1804b1-48727d84062mr284183995e9.13.1774945455743;
        Tue, 31 Mar 2026 01:24:15 -0700 (PDT)
Message-ID: <0b831a75-c205-427e-a35f-fa37a6bd0e35@suse.com>
Date: Tue, 31 Mar 2026 10:24:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] README: update minimum make to 4.1
To: Edwin Torok <edwin.torok@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1774886602.git.edwin.torok@citrix.com>
 <4bbe4e23abcd5b1b32204d391bdd593205b89201.1774886602.git.edwin.torok@citrix.com>
 <16b415a9-b74f-4afe-a14f-e9d2df704eb9@suse.com>
 <9F272BD1-F382-4337-ADFE-CCA4E390A8AC@citrix.com>
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
In-Reply-To: <9F272BD1-F382-4337-ADFE-CCA4E390A8AC@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1774945456-BFC8BDB8-49D3EDEC/0/0
X-purgate-type: clean
X-purgate-size: 791
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edwin.torok@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: D20C83660E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31.03.2026 10:15, Edwin Torok wrote:
>> On 31 Mar 2026, at 07:14, Jan Beulich <jbeulich@suse.com> wrote:
>> On 30.03.2026 18:17, Edwin Török wrote:
>>> Using .DEFAULT_GOAL requires at least GNU make 3.81.
>>> It was suggested to update make to match ~2015 era gcc/binutils, hence
>>> 4.1.
>>>
>>> Signed-off-by: Edwin Török <edwin.torok@citrix.com>
>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>>> Link: https://lore.kernel.org/xen-devel/c0ba57bb-0d86-4209-b019-daf8328b5205@suse.com/
>>
>> Unless we're specifically meaning to use 4.1 features, personally I'd prefer
>> the lower 4.0
> 
> 
> OK.
> 
>> (which is what I have on my main dev workstation).
> 
> Which OS/distribution are you using?

On that particular system it's SLES12 SP5 (in LTSS).

Jan

