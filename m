Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1G3fDQwfTWrZvQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 17:45:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB0371D764
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 17:45:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=YKGh3Q2b;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356370.1611011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh7ys-0005Mr-Ss; Tue, 07 Jul 2026 15:45:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356370.1611011; Tue, 07 Jul 2026 15:45:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh7ys-0005KN-QA; Tue, 07 Jul 2026 15:45:06 +0000
Received: by outflank-mailman (input) for mailman id 1356370;
 Tue, 07 Jul 2026 15:45:05 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wh7yr-0005KH-D3
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 15:45:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh7yq-00Cv5N-Q3
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 17:45:04 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4d1ef6-e002-0a2a0a5209dd-0a2a4501988a-44
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 17:45:04 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4d1f00-400f-0a2a45010019-d155802abcdf-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 17:45:04 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so30507575e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 08:45:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0fbd355sm57963835e9.13.2026.07.07.08.45.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 08:45:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1783439104; x=1784043904; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wXGzJqsuRB8BDf5MUOhM/WxvKR8rxqqiqAclH6WdDrc=;
        b=YKGh3Q2bJXcOANEBcBhskRTZPUGWPyL2QSwA0eyBaHw2D3tjLVlO5eVuP2HIyZ1TNo
         Hc8OYnVuollP3pdZM4pU/T6x1b38Cw6QQ9wCLgNLjLGt9q9GEmqjOjMcN9WL76YDozBR
         A+uj6n+vBo0xtNKHEHRtK66vrIIPt+jfYs622Xr6GffhhLOSQNJht9FHDVcYOsiKbAOL
         bxoRFzVP2Sbshza0Sbt1gDk0yDu+iSnC60Ji/5MS3vRlqDIKZtDDCIEUjP92lI0ArvHc
         9qqd8u4h1lfF5bbNHFgMhVf4NA3GYwoX9ETLvPnfNtEUUWZrttspypKSFh9kOa4d2pu8
         kyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783439104; x=1784043904;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wXGzJqsuRB8BDf5MUOhM/WxvKR8rxqqiqAclH6WdDrc=;
        b=n3bdfjuyCoqck15EGV3CqELHSRV+c2FMlkxAPWCL2d3YLskLSaw+dSafIzHlvtBjCy
         1MP4pfY/Z/pP5Gual3T95p4racL6uZqfz3zTWxnoWxKI5UB3Jh7kX8hxq6GMu9hZbvBY
         uJRdmmqgzZWWq8I8FJXNnif4CRZgPFezVj65QaDL7yIdVITsnUBDX/VqfgyOeuShWECc
         ubBIPPYofXo4Mm4Zh2gOsf4D9KNTpnIhvJG7bJiyq6CXcCNdyinopNFeOX7gHU2Y1ybb
         EvEfJpL0VkbG4c6+nOsZMD2HYSVS/vMd075T/ocppixBgBI4VqfRTQUFjLNYRvZI3QjS
         kKdw==
X-Forwarded-Encrypted: i=1; AHgh+Rr9BgenlaqGfvXZvE5tlNnaQVvfrgmAd8rVtB7vFumjejEdA2FtdELEI7ubUSZCNf+8eaa0+s4JhuQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwuBLGTUW796yZZvTXuRgAk85CbQDzoxrffBDPdStDMVDUvnPnx
	HO4X3wv+pBZC1gId5S8ijokWfeJMSBbU+azP8G7CHXg3PEqdOTdggmAk8thoN+hU9w==
X-Gm-Gg: AfdE7cmN2me+7ynFl8df9PT3lsMkRpW3vs353g3bnUMWPqK2nDCbOV8HOn9Arj/AiUk
	7db9/xYR+yY7M4Sfi6gkVw+/9SDZJWB40gi9+l2hlD5Ur3KWZDbeN7EMewZV4/6ZtyTE/1wNR+k
	OGz3xLnxnYiZbiQzFig7B5EAPu9WIJ1mouYVv0dxuNmqWf4w2EPSJSruFK+wteAE59csegbG4JJ
	O+9AJ/LbaaxpfNcRyG9z76HFJHduEGgTuCI7ZDLx3xciBQTLGYwqk/6ukg3DT5SJNIEfa5yLHTj
	FjNl6ng3v8Atx0JssUxK/pp/x6YekYEcFf1GWyJXRV/EYVgL/lxVAhwrjVfLm6wSV8C/TgDqATY
	e4dXOvVbvNxOBR7jmKaJq+tcDv6AvXwS6UXFcY8jf4CUiyGsysXumiYA1U13I47xV/QKyIWL9wC
	OPvYERWTVviWOh6lKyA1bY+XQ42Eh+/16pNnn1OzSZF9869q5OrY4e5Edk7OxmMaZz1ka1YWPAH
	nxmRGbovvwq6eA=
X-Received: by 2002:a05:600c:c171:b0:493:c6ed:a044 with SMTP id 5b1f17b1804b1-493df076cbfmr61636835e9.34.1783439104015;
        Tue, 07 Jul 2026 08:45:04 -0700 (PDT)
Message-ID: <9f664356-2cd4-46b7-a4f4-807dfdc468e7@suse.com>
Date: Tue, 7 Jul 2026 17:45:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/18] pci: Use pci_sbdf_t in _scan_pci_devices
To: Teddy Astie <teddy.astie@vates.tech>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1782747421.git.teddy.astie@vates.tech>
 <1782753821.8631fc262581453bbf619ec5b2062170.19f146882fe000701b@vates.tech>
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
In-Reply-To: <1782753821.8631fc262581453bbf619ec5b2062170.19f146882fe000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1783439104-808D01E0-DBA74808/0/0
X-purgate-type: clean
X-purgate-size: 592
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4EB0371D764

On 29.06.2026 19:21, Teddy Astie wrote:
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -1218,6 +1218,8 @@ static int __init cf_check _scan_pci_devices(struct pci_seg *pseg, void *arg)
>          {
>              for ( func = 0; func < 8; func++ )
>              {
> +                pci_sbdf_t sbdf = PCI_SBDF(pseg->nr, bus, dev, func);
> +
>                  if ( !pci_device_detect(PCI_SBDF(pseg->nr, bus, dev, func)) )

Why don't you use the new variable right here? With that also converted:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

