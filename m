Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCESJFVC/GlYNgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 09:42:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0407A4E4337
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 09:42:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302204.1576181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKtMr-0002rc-U3; Thu, 07 May 2026 07:41:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302204.1576181; Thu, 07 May 2026 07:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKtMr-0002pl-Qz; Thu, 07 May 2026 07:41:57 +0000
Received: by outflank-mailman (input) for mailman id 1302204;
 Thu, 07 May 2026 07:41:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKtMp-0002pf-F0
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 07:41:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKtMn-009ymz-AB
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 09:41:54 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fc423a-bab6-0a2a0a5309dd-0a2a4507e11c-28
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 09:41:54 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fc4242-229c-0a2a45070019-d155802dd1fd-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 09:41:54 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-48d146705b4so6103425e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 00:41:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e5313b023sm53281455e9.5.2026.05.07.00.41.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 00:41:53 -0700 (PDT)
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
        d=suse.com; s=google; t=1778139714; x=1778744514; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6HvWVmn2k36Po58FDqs30zdzUowu0TnA7Z1C0J1iGJs=;
        b=U/3I3fB9S171mRBrKurnuRbEwotfyQtqSi6efr7hbVqT0m3IeUUQQgZ0kWPj3Gukyf
         RHzdRdotERIX0SOFh2yqikrEr9jD11HnMMmXqMAosDssN74v4XDjUgr0JcHS9dQVEuhD
         0XztnC7Z/CwUyoC1Z8nSB5ocry+/W82WaeZ1iKzdHvnlkDruTSFfy7sxmGZr3C0DgIT5
         scNhitr2w9HE7nQplWwQzwShhJEY0s/U0L3YPSFqcuOUlaM3Rpplcb73XD0BdzLZFPvj
         FpgtaS7uf72wb0fjszxSCkNnLhh8Ejh0NTT3q6wHxMTh+uWekTv27jA9VdRvOR0rhZil
         BOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778139714; x=1778744514;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6HvWVmn2k36Po58FDqs30zdzUowu0TnA7Z1C0J1iGJs=;
        b=TSzL8Bz2aQ3JVL5VPgJisGhx4kIlb5kZt/MA6GHbvLNxaoylKy/SVMZUUWxNU0M+5J
         Tm0I5y3cEitlPwE8Na8tIc+3M3q4o+3D+OJrl4ReBWVlxNEs67Mtv4irP9qozKJ9GLp0
         fhAO3muWQ6TTR+JVT2TvndY67+frhuqMqzHAUKOqW+YgzBGRerteVQEy9nHqSJn980sW
         1uI4U6wlUWhKIPIZ/N6qZ/nlLakNOgWOvXdka0xnMuAOomRGbFZauPgNHRU6dXq+39wS
         +ED+0wMBVd0Fx6VOMWGbcoxhXh7LYPOesKHrHqIl9GeA9hUX2L+KnO/NrwW5fc8FftUN
         BW5g==
X-Gm-Message-State: AOJu0YwY2M0cTnJWBGzMVaV0dKPmGLOT0J8a6bFsz1YVcphaQxX+pqY+
	I59cV3vXUjM3Kz9+MksZF4r7kRqyU4w5Z4o/VF8+d2iTX+7S9nA+WGHa3o1QV4CWQw==
X-Gm-Gg: AeBDievDJmXoi3BTSQweJPmjQ1P3i2ZvQzL07lq8wRkl+F0YKclfYfTtOhOvZ7sGWwJ
	NcJ8cfZf5SiLiM4tXmgsDd/m7ZnYvchkifDtbpnqBlouJKz5ntHacKaRdUU18fKurK20l2nLjKp
	kUAfkal3Zi8XcZ2vtcaZ8pMhYU4ab9DNbHkRyN2cviKKwuxxoizwL7cIn4XEa7zJ/A3fAzRRjef
	ustnOtPg9eNsLAnaERXxBk93if7O5u9uNRXl+fk7MqnincZCfG38BYML96zWjK9FZQfQJ7WQkXW
	RZ74ZD7hoe5UhVBXbrMmmn19dMVJidCax+hOs2i1QDVzbr7pkz0RnJmCv70+1XGURk/qwD2C138
	V1VmJejQt/aPPQwP/RS10JKqhGzW2t6hg8HGjsdt0+O8Pum8KZPYpHu3RhzR88gSCIkFAJIqeYZ
	I40VprYTW75JJy7oFM8GrXWbQwuWYuaRQU7c0Vl7qzvGDjhv0iihNHNRjlPyiOCGhUIfUR2bSWQ
	MeHLdiw4xJCAv3dOWN2w6gGbm8XR2gC2p+c1TGsC+geDgI=
X-Received: by 2002:a05:600c:3b96:b0:48a:66a8:9981 with SMTP id 5b1f17b1804b1-48e51f55272mr117375885e9.27.1778139713823;
        Thu, 07 May 2026 00:41:53 -0700 (PDT)
Message-ID: <540ef3bd-6fc6-4cf1-a1fe-3def9cfcc114@suse.com>
Date: Thu, 7 May 2026 09:41:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CI: collect certain intermediate files as artifacts
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <6d9345e7-7ad9-48f4-8447-3a955305430a@suse.com>
 <alpine.DEB.2.22.394.2605061748080.1744448@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2605061753050.1744448@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2605061753050.1744448@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1778139714-0BD7FC48-25DE0715/0/0
X-purgate-type: clean
X-purgate-size: 2090
X-Rspamd-Queue-Id: 0407A4E4337
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 07.05.2026 02:54, Stefano Stabellini wrote:
> On Wed, 6 May 2026, Stefano Stabellini wrote:
>> On Wed, 6 May 2026, Jan Beulich wrote:
>>> When one of the linking passes fails, additional intermediate files are
>>> still in place. Having them available for analysis of the underlying
>>> problem can be pretty helpful. Collect some into a new intermediates/
>>> directory. (Nothing new will be collected if linking succeeds.)
>>>
>>> While there also make sure xen-syms is collected (into binaries/). This
>>> is rather more useful for analysis of possible problems than its stripped
>>> counterpart.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> As the issue this is meant to help with didn't re-occur with this in
>>> place, the new logic wasn't really tested yet.
>>
>> It looks OK but please provide a link to a successful pipeline

Well, I had it in use in
https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2503967215
but does that count, when the issue the change is for didn't really occur?
For now I can't test the additions without having a way to trigger that
symbol table issue (or any other problem at one of the linking stages).
Short of artificially breaking things, that is.

>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks, but the above wants clarifying first, and the below suggests you
actually meant to take back the R-b.

> Actually, I see that the build script is run with bash -ex so I wonder
> if collect_xen_artefacts would even run if make fails. I think we need: 
> 
> trap collect_xen_artefacts EXIT

I don't feel comfortable making such a change. Furthermore it's unrelated,
as it would mean that on other build failures successfully created final
binaries wouldn't be collected either (after all on x86 it may be only one
of the two links that failed). Plus then it would likely want doing
differently, by making the EXIT hook invoke a new
collect_xen_intermediates(), leaving collect_xen_artefacts() unaltered
(except for the xen-syms addition there)?

Jan

