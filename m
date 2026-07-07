Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tKkLFGUdTWo8vQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 17:38:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A416271D5B0
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 17:38:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=MWBfaTtg;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356347.1610983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh7rc-0002iP-LH; Tue, 07 Jul 2026 15:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356347.1610983; Tue, 07 Jul 2026 15:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh7rc-0002gt-Ig; Tue, 07 Jul 2026 15:37:36 +0000
Received: by outflank-mailman (input) for mailman id 1356347;
 Tue, 07 Jul 2026 15:37:35 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wh7rb-0002fg-DJ
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 15:37:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh7rZ-00EJvQ-JC
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 17:37:33 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4d1d32-5cb7-0a2a0a5109dd-0a2a4507cb0a-16
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 17:37:33 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4d1d3d-9c8e-0a2a45070019-d155dd2ad1ff-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 17:37:33 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-471eeac43bfso4642455f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 08:37:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e4d83bdsm35499345f8f.13.2026.07.07.08.37.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 08:37:32 -0700 (PDT)
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
        d=suse.com; s=google; t=1783438653; x=1784043453; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jh/o0Vre19w4FX+1VBEQcsOTLnDXfBCS+Im2YqL2Yv8=;
        b=MWBfaTtgcAFzxfjJH2mh8r/ij4xgkxbmm0O0fzwVm1gLa1QTk0IDeQjtklzb3pF5ys
         JgHtqk8/hmugdQutkGVss2pQm3fB/zHlxYw6uLO15r7RRJj54VlmBQUGKw0vcN3znEJ7
         0cCRL2uIeNcAmg/IKY/JGoKmm9oFQ3rubFtKwykaHu7SigRbN8RvGnlQDGsEFViQNrkE
         CWinveKmoWd1Cz+a/L8wtqewJX0fBpM+s+asuKs9iNQ8Zbeu3EWEpb/0+ds9FudwiD8P
         wPJ1zhfhMf160HUhXsxfIqRewKYaCQ2h75RLu1BLRaYVE8yAZVkqc6ilPlFSl7QQK+z+
         cC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783438653; x=1784043453;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jh/o0Vre19w4FX+1VBEQcsOTLnDXfBCS+Im2YqL2Yv8=;
        b=ZvrO+itr6k6nO4G2O2IjpO9S7DmIVKaPceDuIqnLCm0nP2sYbVapILPqihffxJcXcc
         4i3LIGSiKvQIkwtuEUutClSKI/RDvyT3fXnRlHMldFxCtn+NASTegDNzqrSHnaosgZRk
         7CPOCIVOh1+Van3sGU+mDBa2mOe/vlJ2Webai4vZhDcD4Lh3FDlH4Xc4178ymCX7MAKJ
         bj+wy0JAVRk4x57WA8rwdDdIw87WEfQ42TItvqP8havs/ejH1YUcu7Cyxwcp0dtAvPNs
         ft0jgGUhYaHwDoOBn8g3ilwfGsBcsPkJNhY/w5MF/+PUFY1ZQ0yylOEULj1cNcT8hc+s
         K76A==
X-Forwarded-Encrypted: i=1; AHgh+Rrj1yBgIc3e+KS6Eu29C/ZTaWREsyjfEoFsLzo3WoUBA8i2rIvX9BH/8sYL5MqIOQCJEaicR97WBwA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxk3kLEsEMyclBf5/bnegp083GxBmKT5zhqyE/+iL6zrqqYYjRe
	fyOLVIpZDEdK3xEkqEeSPNvMAYiJyjCcXBSjwnXZDSlMZ9/ZEkG6yXvlqqB6IhBg4Q==
X-Gm-Gg: AfdE7clsIM3CLwn03C/IyaIeY6cXsqWE1QsBsJfy0sIFVgFhfCEnY+TD73kCp6SGkyQ
	Gma8Dty9TIebtDb4Z0HChC/r77NnZYe3Xq89y0KtWwts1EDvlvyZVIbO5OZDfzzKo5dXG/iShyo
	EVs6AT4exevi5BNXN+xeUT7EcRtXh1hDSvhXLdbIhYDW2zQ5TXDaCu0iF/gydOFcNQjdl2IQtpg
	8D6kGAGSls5+7o1n9jA/CCxmMdB80pjdetPD4/M3/oIe7eIfqXX7TfHaCd0MAFjV+spHcXGax14
	UJLQDV0kqCtJJy1OoBoiaHMFOXZj+5Z1cs6f406HtwNOFat5CYy0PJ3dxVpLv6n+JHb40JxpKKg
	3UIrBUXaI0deyCdocyxbbd4xDWPSxzfX/IKi/R2iDPOOF9fPA3u8cfRdhnNtYmV/ColZq8lmOMo
	0cmBssxEwpyGfPnr9lkTwy81ywuhYzOFdRcXAjwy6Yi3pWjE1yaxeVH1AHdjn19HU0tbxnGWucA
	E0F
X-Received: by 2002:a05:6000:25c2:b0:477:b22:488d with SMTP id ffacd0b85a97d-47de669bb02mr6619318f8f.10.1783438652687;
        Tue, 07 Jul 2026 08:37:32 -0700 (PDT)
Message-ID: <33826f47-0601-45ad-8ec4-26d038a73ee0@suse.com>
Date: Tue, 7 Jul 2026 17:37:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/18] drivers/char/xhci: Parse into pci_sbdf_t
 directly
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1782747421.git.teddy.astie@vates.tech>
 <1782753819.8631fc262581453bbf619ec5b2062170.19f14687ad3000701b@vates.tech>
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
In-Reply-To: <1782753819.8631fc262581453bbf619ec5b2062170.19f14687ad3000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1783438653-FF13E25E-9283E155/0/0
X-purgate-type: clean
X-purgate-size: 1159
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: A416271D5B0

On 29.06.2026 19:21, Teddy Astie wrote:
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

If we deem this acceptable despite the behavioral change ...

> --- a/xen/drivers/char/xhci-dbc.c
> +++ b/xen/drivers/char/xhci-dbc.c
> @@ -1357,9 +1357,9 @@ static int __init cf_check xhci_parse_dbgp(const char *opt_dbgp)
>      }
>      else if ( strncmp(opt_dbgp + 4, "@pci", 4) == 0 )
>      {
> -        unsigned int bus, slot, func;
> +        pci_sbdf_t sbdf;
>  
> -        e = parse_pci(opt_dbgp + 8, NULL, &bus, &slot, &func);
> +        e = parse_pci(opt_dbgp + 8, &sbdf);

... from not permitting a segment to permitting one, this at the very
least needs to come with a non-empty description (justifying the
change). Also (as I think I has said there) the doc change wants to
accompany the functional change right away.

> @@ -1368,7 +1368,7 @@ static int __init cf_check xhci_parse_dbgp(const char *opt_dbgp)
>              return -EINVAL;
>          }
>  
> -        dbc->sbdf = PCI_SBDF(0, bus, slot, func);
> +        dbc->sbdf = sbdf;

Why is the extra variable needed? Can't we parse directly into dbc->sbdf?

Jan

