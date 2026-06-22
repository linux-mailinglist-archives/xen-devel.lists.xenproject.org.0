Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id itqgMfz3OGoHkwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 10:53:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DED06ADF07
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 10:53:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Qylhgdqp;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1343542.1602829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbaOv-0000rW-Uo; Mon, 22 Jun 2026 08:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343542.1602829; Mon, 22 Jun 2026 08:53:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbaOv-0000pF-RE; Mon, 22 Jun 2026 08:53:05 +0000
Received: by outflank-mailman (input) for mailman id 1343542;
 Mon, 22 Jun 2026 08:53:04 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wbaOu-0000p9-6g
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 08:53:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbaOt-005I73-JR
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 10:53:03 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a38f7eb-e002-0a2a0a5209dd-0a2a4503e03a-12
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 10:53:03 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a38f7ee-a3da-0a2a45030019-d1558034d0d3-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 10:53:02 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso61856115e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 01:53:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49240f054e3sm284649475e9.2.2026.06.22.01.53.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 01:53:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1782118382; x=1782723182; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mQmkZ3fi/7uWM/l73QKClDo7mn86Bhi9ThQFy1sB+SQ=;
        b=QylhgdqpsEwg+dgbCki909GYpuT6ju42o9Qj/NFpOzcDjOBaz7e7KH4TzeVWSkJWRs
         Bupl+R45Q74P8dXV15y6qAlP7eNFDf+PVzobnCuH+Is7NSM8+FykWgsitVhWCNBlALqG
         B74Qay161DdBMwaZNnZtl/Sg8mZJbdro+mtRAOKqvXaGjiRQljNNyM76qxTNp2wBF93N
         jQ0R9WHrbgFfTPjUXz/DWrEwH05EqiDuYpHHSgFlpzPpN68L7tcwX9wXaYSkNpvnr/jH
         WQacNmGBPZJZGQWkrqPXIq5Cny7cm7pYeVVDkjChDno89QniZ26Hmq1vGh0gabidmAzs
         rtnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782118382; x=1782723182;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQmkZ3fi/7uWM/l73QKClDo7mn86Bhi9ThQFy1sB+SQ=;
        b=GeiIW0AtBFuFWgV2X2EiLcAgCPaQLctuo80O5gihH/0Dg8GXdHjgQ65zlLuQIw1l1p
         rfAEHzKBMS2SEhyZg5pKBZEXN1yl4jLD71Z5ciqRGxB7CBWwJBbIf7AFhL/mrbZPI3ba
         FkOx7j6IBa0MWFHmKPHR/8D3nzx144GkLPG+4jWYtOb4Yxy6pquqS+6JX+RBBBDR2dIh
         UnUU0HELVmqZSZHig5+7Ul0gPk7YYFv6/Z3pQ8xKoBArWXJ6OJRIs8y5P0c7OIr0zPWd
         n0AlKfW67/PmDkHsuBBN28zOVl8mTKMd30XpaSUjLNLFSkpSnheALt+VZKWAi2isXoja
         oIcg==
X-Gm-Message-State: AOJu0YwTHD4SJtYthquNwyby+eHOpKvzpLRI/aaVK1CQwe50XRd7aLZD
	ZJ2ZFBoqJJt9B0JOIJgVDr4yEAveem1KGSMjuZXZyX+IIIUarU2h2YFPJp4ZDz2qIA==
X-Gm-Gg: AfdE7clrgVaHIm4KMGsmv/lkbMNH8wlDO0e9S+ezFwllaofTdGs4/t3z7chr+WezhF6
	mV1R0br2WFKmyAX+stCENEx5qgd3PD2dVXVz3k1fvgvlkgfxKcQJlZ1iA96sYZbEKHHrPzFnnHe
	SZD/y3FREXAz282xwzxzUyuX/aUuWys/0TOvbZmf1XZb0K4h8mgFUUpb9hzkFHbdd7xT0xPoA4s
	fyfBBLa6Lv7yEEQ+UyDyVGmzHIZZp5ct2aMqx+uleBr+PFV2XJLCyknRz3Rp3/yXgpjqSAsQsq0
	k7IW3TtO0wpNKaFGDFbJdBu+9PAkmKfKMspxESVD2ZnwydosvG3Ne2AsODoWo30Pj91kvJ1TnNx
	foFr6vdKuM/OnouxsMlDK1mty9qgARuJP3F/mkQA/uW5jJ1t4U3FS17RYib+H+0YGGe1uj4kG80
	ilugUCjhmiELnwdOzLZH9lvdoX3wDXzop5kSgZK+AMoWjEtrc6waRCUubtnC6FOrQqrzs7IM4FB
	5ii
X-Received: by 2002:a05:600c:5489:b0:492:4668:27b5 with SMTP id 5b1f17b1804b1-4924668299emr182315515e9.6.1782118382311;
        Mon, 22 Jun 2026 01:53:02 -0700 (PDT)
Message-ID: <a6b83fc1-aa98-4b45-ab7f-503715861a7d@suse.com>
Date: Mon, 22 Jun 2026 10:53:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux dom0 hangs on boot with Xen 4.22 and Heads firmware
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
References: <ajVUS5F9G4Jse20i@mail-itl>
Content-Language: en-US
Cc: xen-devel <xen-devel@lists.xenproject.org>
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
In-Reply-To: <ajVUS5F9G4Jse20i@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1782118382-E2DDFD84-6555AE48/0/0
X-purgate-type: clean
X-purgate-size: 2551
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0DED06ADF07

On 19.06.2026 16:38, Marek Marczykowski-Górecki wrote:
> After updating Xen to 4.22-rc2 on a system with Heads firmware, dom0
> doesn't start anymore. It worked fine with Xen 4.19.
> The last messages on console are:
> 
>     [    1.495140] installing Xen timer for CPU 2
>     [    1.496149] installing Xen timer for CPU 4
>     [    1.496587] installing Xen timer for CPU 5
>     [    1.496809] installing Xen timer for CPU 7
>     [    0.008235] [Firmware Bug]: CPU   2: APIC ID mismatch. CPUID: 0x0002 APIC: 0x0028
>     [    0.008235] [Firmware Bug]: CPU   2: APIC ID mismatch. Firmware: 0x0011 APIC: 0x0028
>     [    1.497055] cpu 2 spinlock event irq 200
>     [    0.008235] [Firmware Bug]: CPU   4: APIC ID mismatch. CPUID: 0x0004 APIC: 0x0000
>     [    0.008235] [Firmware Bug]: CPU   4: APIC ID mismatch. Firmware: 0x0019 APIC: 0x0000
>     [    1.497074] cpu 4 spinlock event irq 201
>     [    0.008235] [Firmware Bug]: CPU   5: APIC ID mismatch. CPUID: 0x0005 APIC: 0x0002
>     [    0.008235] [Firmware Bug]: CPU   5: APIC ID mismatch. Firmware: 0x0021 APIC: 0x0002
>     [    1.497074] cpu 5 spinlock event irq 202
>     [    0.008235] [Firmware Bug]: CPU   7: APIC I
> 
> Full console log (containing both successful boot of Xen 4.19, and then
> reboot into 4.22):
> https://openqa.qubes-os.org/tests/184780/logfile?filename=serial0.txt

The 4.19 log also has an anomaly around this point in time. Can you try
again with sync_console added to both the 4.19 and the 4.22 attempt?

> It doesn't reach loading graphics driver in dom0, so I don't have
> anything interesting on VGA (the last output is about the kexec call
> done by Heads). But at least I have a serial console.

Yet interestingly Xen's "  VGA is ... mode ..." lines differ as well.
That may be a separate issue. Or maybe that's how one of the EFI changes
that were done a while ago actually surfaces?

Another difference is

(XEN) HWP: Using HWP for cpufreq

in the 4.19 log vs

(XEN) HPET: 8 timers usable for broadcast (8 total)

in the 4.22 one. Does the latter perhaps go away if you include [1] in
the build?

For the HWP driver do you perhaps have a patch in 4.19 to default-enable
it, but you don't have a similar patch in 4.22? If so, to compare apples
to apples the driver wants enabling/disabling consistently (via command
line option) for both runs.

And then "mwait-idle: lapic_timer_reliable_states ..." differ as well.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2026-04/msg00200.html

