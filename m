Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNp5CkCHe2mlFQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 17:13:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78586B1F5C
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 17:13:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216811.1526740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlUe9-00029Z-Uk; Thu, 29 Jan 2026 16:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216811.1526740; Thu, 29 Jan 2026 16:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlUe9-00026k-RD; Thu, 29 Jan 2026 16:13:29 +0000
Received: by outflank-mailman (input) for mailman id 1216811;
 Thu, 29 Jan 2026 16:13:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g1vo=AC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vlUe9-00026e-3z
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 16:13:29 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f97d86c-fd2d-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 17:13:23 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so10524475e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 08:13:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066bee7d0sm220333435e9.4.2026.01.29.08.13.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 08:13:22 -0800 (PST)
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
X-Inumbo-ID: 6f97d86c-fd2d-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769703203; x=1770308003; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jRB24tX67tI2lywGWxRiTuPr64WQXluDOasgw5Bm6Tk=;
        b=F7KAIn1qvxgUIjqRD8k/eKmTWaRxG0mUP8fdpYdxr3laUgyU+Dekaw6Yvijoz0l76Z
         gIuf45Xb9saJDmR6lWot4B0wd82GkqoWROQwAPhmksr3YiwSl3yl4fYc3IktRfOdegkt
         n0eNcA+mkaG559tWAnxHYrr/xQD6QhkDnKSyrFmzRhwAci2Mvr/YTHg60+zMTvJgC4XS
         adI05neJXS9BIypQzJIKBkjf8cjNbCNNPXryE24n0ypDt3dVSRXGJPwF0Y+bvdT42RnQ
         KNYnvA5eeNvL80j7Ku0GOwTCuE/JJ1QCj4bqaluWCH78wtdsyrTh4BA37DFm6gsaIvYO
         8+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769703203; x=1770308003;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRB24tX67tI2lywGWxRiTuPr64WQXluDOasgw5Bm6Tk=;
        b=bXZJb9YnCkHVjfp8LJfW6j7rNzvdmDkyHUY4yvGOGK/Du01GBpn8sf56iwEsr0uVpX
         4VRwGyAHS5h8htrlZcEr5nX/Bey0WVfdxW+fi874l9vWr9IrnxETVGC3ogS7jUmJxaU1
         kFLFSModfqPLy5DlkQo/7BeUspcMEp+nHOifcFq9vSvLGK8c+3Su9JfCy3O66utRuk7g
         2NUPdZWqrpBIpNtXE70C1klnj9xffm7gC4/TcBOoPnClZVA/B3dxtnuiB/s1y9KFAc5+
         LW8JE8o3OMb9mPVLUFmDI6LLC6yW4ZHGefUyCoDguMXHvKLoMHBVNrzPpvYozx7XHKl7
         +u6g==
X-Forwarded-Encrypted: i=1; AJvYcCVvVN9Co9+CqEWkg++h2Q1sJSTFqby4hjHI3xB7LSj8bMbAaJkurZtDb5s6gOUOZPDgxdCJ5w39QCU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqOz4gadCgsh594j46WUxjdjkIc/4rQDHJKp767AXg024RKx0K
	HnWkOnNEb8QQYVWKnQCfrtyAveLL+lZ9z4ySNKOq2BXpoAxurpkyNAmzoduCRLVTFQ==
X-Gm-Gg: AZuq6aLQHq6srW3JaNw68Z3HbjqDH3lX34mvntWVhLhuALNTKF8udqtkpbL3IFffKgh
	8GWyhaB0R3cxb+z0J0B3jUOXTRPcsXbqMpbgWY8rGndPOuWUcyyKGsn/8kW5RzK4zUjEujrfMfv
	PrLP6OyWp7jXwr8PWY/9tgilwHseGtHfEaJNsbQBvCbxTtNafyYoCNVrxonkP7onHp4vl0aR196
	0sVqUDYOU9LJ31n6nuZd2egHubAZyGZa20Qd7Q5vQm++Xo2+E0Zw93Or5bwv0NPAteJJQ0sCTam
	ss1HMfbQsr1/nmlX5H0COAlCV3qYXhnN9SQkq/mfx7wlGh0klof/Eh7lWubn+QQ8dzd3ItWo19r
	hB6aP5DrRWHa429BFsbK8kbtjL2p8WfP7Vf2OlEhrcbvhFYiTttbhVMfuChho+GmHYRRCMAYzzt
	a9D7pkb0obFT6xEH/1+YPwH0+8E7lSR4NvzksZL1n2vBo+PBL39yoc8z7OimgzClUdXE9V74Evg
	v8=
X-Received: by 2002:a05:600c:3e16:b0:480:3b4e:41ba with SMTP id 5b1f17b1804b1-48069c5b971mr109579195e9.18.1769703203138;
        Thu, 29 Jan 2026 08:13:23 -0800 (PST)
Message-ID: <d214a841-eb52-4fd0-ba5d-79a809baac95@suse.com>
Date: Thu, 29 Jan 2026 17:13:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Always display CPU vendor string
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <8b50a689e549fd174d6c34dadc5df5c65711c615.1769694285.git.teddy.astie@vates.tech>
 <87181edd-fc9d-4221-827c-97abc7aaca65@suse.com>
 <90b5ac3f-9238-4344-8dbe-f7d5873a45c8@vates.tech>
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
In-Reply-To: <90b5ac3f-9238-4344-8dbe-f7d5873a45c8@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 78586B1F5C
X-Rspamd-Action: no action

On 29.01.2026 17:04, Teddy Astie wrote:
> Le 29/01/2026 à 15:06, Jan Beulich a écrit :
>> On 29.01.2026 14:58, Teddy Astie wrote:
>>> While we may not want all the other CPU informations. We likely
>>> want to keep the CPU string as it's more practical than trying to
>>> decode it from the family/model/stepping combination.
>>
>> Yet why would we want it logged several hundred times by default, on a
>> big enough system? IOW ...
> 
> Ah I see; one idea I had was to move this to early_cpu_init() or 
> somewhere similar, and only displaying it once (only for BSP ?) ?

Well, we have the command line option to log data for all CPUs to help
in case of problems.

Jan

