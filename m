Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IE08OGlue2mMEgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 15:27:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48845B0EEF
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 15:27:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216636.1526582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlSzl-00062F-HJ; Thu, 29 Jan 2026 14:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216636.1526582; Thu, 29 Jan 2026 14:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlSzl-0005zm-EN; Thu, 29 Jan 2026 14:27:41 +0000
Received: by outflank-mailman (input) for mailman id 1216636;
 Thu, 29 Jan 2026 14:27:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g1vo=AC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vlSq9-0000f7-KD
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 14:17:45 +0000
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [2a00:1450:4864:20::543])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46a934fd-fd1d-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 15:17:43 +0100 (CET)
Received: by mail-ed1-x543.google.com with SMTP id
 4fb4d7f45d1cf-658cc45847cso1367317a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 06:17:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8dbf1c5b23sm261841866b.57.2026.01.29.06.17.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 06:17:42 -0800 (PST)
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
X-Inumbo-ID: 46a934fd-fd1d-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769696262; x=1770301062; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RN73keMBdn5sF5YAcK29ak1jpV6CD23sxnl8yLJ4dIQ=;
        b=B8ZirNpHWiW5QoOzJhoygVkHSiV1mlfo0a6glZNPX44bJFeauDIVBTEK0zG+StB+jy
         IcDUGAa2nJMP9oF9qmCLCSDSMb233g6+IK8wVpV94usU7RAZkPeV2s95AFuyTQ/b31T0
         1r/UdOnk0FtH1/5jSLfQXJTHWnE+jOeXl5Vr/BNlTbnBAw3KW5Dxu+UqoyfMXaWT4MuQ
         DqXs+ReHSvX1nDJI1pcCttBzCx+hqNILMb64x8iXJ+ID0stWqAeGYyFdk5X6OrgAgtBc
         1+2H12HqltSf7XtBU2/a0J3CAZcolP1RPVOifakBIlIDeq9ub9W4hs0bWDLHoM6AIRaa
         kS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769696262; x=1770301062;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RN73keMBdn5sF5YAcK29ak1jpV6CD23sxnl8yLJ4dIQ=;
        b=HZ1PM8yzZTGWhaVanUH21OI90TDNtfx6RkgzbOToUtF8z0Dm0ZrQdlScEY6ie9kCb0
         EyRS52dzBPDv/3QU82JOmctAiQl05WToXrbF9mbUZR8zPPJsY5Br/DvfjUfBWHXeEUe+
         tKQNCCO0y2NkMRTTG/mi+NBwM9Ak1X3bS5kbKydts2q0lkxv8u+0FLaG4dHxgtzs8gik
         2kSPXaiTNUEgeVULpTFbo+8/Qz0VBjoWZ4YyNC5hwl6/0lJ7QiW1WIm5Inh86hfgqkYC
         wQOiFUItz4Bofahevj7L6HZIK6UgzyclLWKIncGiz2k0JZYToiK7xdp365h961gu1YSW
         Fmow==
X-Gm-Message-State: AOJu0YwbUMMobRAhRoQDXLCWQLsPgA5HrfpkohRH0Zv/1TwbMDBgTz0t
	vc+OUE8D1pBQZMUN8BlhiSQiSyPYEL1sYjcATHSALDSyIABAOyKIAZsq5xSd0Ax0xw==
X-Gm-Gg: AZuq6aI39nVmD5IjydhQxyGwkxLk8SOI+dIzLjmVRy2QjLr39CxTEN6puQm+c7mGp5h
	R1oIp2aJslvBY4Dfkt+S7N1oKVVNJ8trVeZEtrNG/UzZrbFl3tiVhLmZjBlGn9A5MU73URU8ELP
	u3FchxZZPrqrpJgNkI9Isvy1Wn14HOHcWETWVIAV6SjiZBxkygBm4APq6H0qqmyPo2dyqPMEC2v
	s73GZb5xVY6BFCXuKuokrbuCZ44BLwxKs8q1J16AaFX6qA3K3XGesp9V6DrrK6eJG//ADlAOlgJ
	uuyJf6org9qeHZAHcvW2EvWS+q7c1QXWFhWHN8s39Ez/FiE4PyNhO+rZLCwqIHgDmAYsVWZuV/w
	GFMQLd3xKq95vafbxgGoacdBcyd712hkLjqeXBcDcTCXD6QuP39c81RTcim78b7wkES4VejxSZM
	EmzJGohBDwVNsmQ5rREHwN3M/79FOaImPJAtTMbZl71oPpX0rCL3DId9GryzXZTjqhwQhyHG3ro
	c8=
X-Received: by 2002:a17:907:3c87:b0:b88:3b3a:42b6 with SMTP id a640c23a62f3a-b8dab2fe030mr563791366b.37.1769696262410;
        Thu, 29 Jan 2026 06:17:42 -0800 (PST)
Message-ID: <45640da8-9e9f-4b9e-83a0-3bfe701cf5d4@suse.com>
Date: Thu, 29 Jan 2026 15:17:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] PCI: determine whether a device has extended
 config space
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <a67e69b8-c1e9-4448-adbd-17a19dfe13de@suse.com>
 <99d45a27-ce67-4f10-9883-dba96f055285@suse.com> <aXtqBEyhPgFSmvZA@Mac.lan>
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
In-Reply-To: <aXtqBEyhPgFSmvZA@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,citrix.com:email];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 48845B0EEF
X-Rspamd-Action: no action

On 29.01.2026 15:09, Roger Pau Monné wrote:
> On Thu, Jan 29, 2026 at 02:08:27PM +0100, Jan Beulich wrote:
>> Legacy PCI devices don't have any extended config space. Reading any part
>> thereof may return all ones or other arbitrary data, e.g. in some cases
>> base config space contents repeatedly.
>>
>> Logic follows Linux 6.19-rc's pci_cfg_space_size(), albeit leveraging our
>> determination of device type; in particular some comments are taken
>> verbatim from there. Like with Linux'es CONFIG_PCI_QUIRKS, only the alias
>> detection logic is covered by the new "pci=no-quirks". The singular access
>> at PCI_CFG_SPACE_SIZE is left unconditional.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>> The warning near the bottom of pci_check_extcfg() may be issued multiple
>> times for a single device now. Should we try to avoid that?
>>
>> Note that no vPCI adjustments are done here, but they're going to be
>> needed: Whatever requires extended capabilities will need re-
>> evaluating / newly establishing / tearing down in case an invocation of
>> PHYSDEVOP_pci_mmcfg_reserved alters global state.
>> ---
>> v3: Add command line (sub-)option.
>> v2: Major re-work to also check upon PHYSDEVOP_pci_mmcfg_reserved
>>     invocation.
>>
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -2009,12 +2009,21 @@ Only effective if CONFIG_PARTIAL_EMULATI
>>  behavior.**
>>  
>>  ### pci
>> -    = List of [ serr=<bool>, perr=<bool> ]
>> +    = List of [ serr=<bool>, perr=<bool>, quirks=<bool> ]
>> +
>> +* `serr` and `perr`
>>  
>>      Default: Signaling left as set by firmware.
>>  
>> -Override the firmware settings, and explicitly enable or disable the
>> -signalling of PCI System and Parity errors.
>> +  Override the firmware settings, and explicitly enable or disable the
>> +  signalling of PCI System and Parity errors.
>> +
>> +* `quirks`
>> +
>> +    Default: `on`
>> +
>> +  In its negative form, allows to suppress certain quirk workarounds, in case
>> +  they cause issues.
> 
> Not that I oppose to this, but I've assumed that you would introduce
> an option to fallback to the previous behavior where Xen would just
> assume extended space to be accessible.

But that would be wrong. It didn't even occur to me that you could have
wanted that.

Jan

