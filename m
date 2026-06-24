Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LrrnA66KO2rzZQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 09:43:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FC46BC45C
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 09:43:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=OupwdBnT;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1344601.1603661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcIGd-0007ZV-7W; Wed, 24 Jun 2026 07:43:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344601.1603661; Wed, 24 Jun 2026 07:43:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcIGd-0007XC-4P; Wed, 24 Jun 2026 07:43:27 +0000
Received: by outflank-mailman (input) for mailman id 1344601;
 Wed, 24 Jun 2026 07:43:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcIGb-0007X4-SR
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 07:43:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcIGa-001QEn-7q
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 09:43:24 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3b8a97-2eae-0a2a0a5409dd-0a2a450ab1cc-16
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 09:43:24 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3b8a9b-93a5-0a2a450a0019-d155dd32b82f-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 09:43:23 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-462342ac290so862521f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 00:43:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c9f240c3dsm1538544f8f.35.2026.06.24.00.43.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 00:43:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1782287003; x=1782891803; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cuDmcXdKpgeIWxSU6IWo5VxVu5XuW44xSfqu1kHEyvw=;
        b=OupwdBnTEw5G0rqMTjS+RD1I2Rpk6XMcfKwLNYVryYHn5b4LbKSSeLLIO+kch2G9t6
         umZEueugUD4VZAaUz8xIheA+nYyGHDo0Q2Phj2LREBX83cNViGS5CSXWc8v0HjDca/WC
         UbH0gl8upzK/sbQbnC8az0g0bJGd6BEMhUDNRvH0J22xwOZqpHElcQOo8CPngov2M2pj
         fAXYRuUDBMJ/kwjkm1bGMwQqM5poa2FQkpDZgHsykV8Ls9um8oLFFZTeCG8ZhjwCgELP
         Ob45RgHIQmPOyj88bUakLrf/jQRoeiH6X90QrZFv5N67gyewzOwBor2l5Lx7MMxusa5R
         LhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782287003; x=1782891803;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cuDmcXdKpgeIWxSU6IWo5VxVu5XuW44xSfqu1kHEyvw=;
        b=ZxAI0FR07/wkEO1uuOBFfbl1XLYkNlvUYujtSn8zJLxsm5t+I6kd6rS4VU2GV3siGt
         PEpyPDj3p29U5nHa/4Z0RAAqYCpt8NjxUhfaOD98i0h2/YqwdbMc0zH2m9N2J8cDborF
         hMjfLIPoZT+Ug/d+FDgb1rT8oSoQPqjRxZeQdgl0hy9n9RGAaq3YVQSY6t0tZ8NE5JKl
         UKvnivYGomxeg0l/7VTt15oMKAwMB+4nbG/p+tUJBd9VEiRpSNtraQuV2kZmsKq33peJ
         /YqH0D6vf6faz1BXukmp+JbmP1Vp7U65MxeNwz0AIsth+W2dkH8JhjqSd5QqFXJZ90r9
         mG5g==
X-Gm-Message-State: AOJu0Yz/vwHTt33XAnDxKTXVrAwyYB1NM7KmKZwFscncXyjTMhDIBAop
	AULZ6NOH/OUfhmCl4zXyo582NbT2jnTq5jVuuzQUxi0ddC2U0FGDOgURVs7rtXRe/w==
X-Gm-Gg: AfdE7clhv1oHPlXerwE0oNNYzIBf0t43YFkJtkzEq/qCgjXPFVdzYDPSSNJSsH0adHI
	oQsA30rew5G79rClysu279K8aqJoGAmVPPP2nPaIpQ3yMlFATst+8ehxJ+DcG92TGbyWNzQfIvk
	V/PJVjvFO3xWvhpabRIfopZuGrtnxvWFxr7T032lO8NGsHbgu+IoiLl0CzbgbOk1lO6zVVCkKnx
	kfcGnm8nb8N1S/W+7dRJmbi8/VfljJODjcsoaXaDK03VW1ikB+P22J/3ml5VoDHci5jLMgzo7f6
	oTBlcHqmE21+e4auWw03ZP4DUwX5LlaBYRQhkXRDSd/4HttYuTn1WdEWYcyVtaHcgIHxXMI8ZIw
	e8nbnbpBiJXUDiw/C0VfJWoTu+IPOoGuTP+HL3EDuYSkKPlMiUAWqxXSCzCVmmU5hBuUl4/eyx8
	Bn0jqJ86ZlxSEMG0dtSfoUYq9uNoWuGQMXdbUWuZJIEW0V58q7dlSguT9ttseBNYtWi58hmljaP
	L9L
X-Received: by 2002:a05:6000:2006:b0:45e:f8d0:d22c with SMTP id ffacd0b85a97d-46adabe36fcmr9415529f8f.25.1782287003383;
        Wed, 24 Jun 2026 00:43:23 -0700 (PDT)
Message-ID: <1ecee09a-edd9-47cf-88d4-ad4e7e8b8216@suse.com>
Date: Wed, 24 Jun 2026 09:43:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux dom0 hangs on boot with Xen 4.22 and Heads firmware
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
References: <ajVUS5F9G4Jse20i@mail-itl>
 <a6b83fc1-aa98-4b45-ab7f-503715861a7d@suse.com> <ajslWA63ZdPhfYvw@mail-itl>
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
In-Reply-To: <ajslWA63ZdPhfYvw@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1782287003-B01C6DB8-8D8DB4EB/0/0
X-purgate-type: clean
X-purgate-size: 7399
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 51FC46BC45C

On 24.06.2026 02:31, Marek Marczykowski-Górecki wrote:
> On Mon, Jun 22, 2026 at 10:53:01AM +0200, Jan Beulich wrote:
>> On 19.06.2026 16:38, Marek Marczykowski-Górecki wrote:
>>> After updating Xen to 4.22-rc2 on a system with Heads firmware, dom0
>>> doesn't start anymore. It worked fine with Xen 4.19.
>>> The last messages on console are:
>>>
>>>     [    1.495140] installing Xen timer for CPU 2
>>>     [    1.496149] installing Xen timer for CPU 4
>>>     [    1.496587] installing Xen timer for CPU 5
>>>     [    1.496809] installing Xen timer for CPU 7
>>>     [    0.008235] [Firmware Bug]: CPU   2: APIC ID mismatch. CPUID: 0x0002 APIC: 0x0028
>>>     [    0.008235] [Firmware Bug]: CPU   2: APIC ID mismatch. Firmware: 0x0011 APIC: 0x0028
>>>     [    1.497055] cpu 2 spinlock event irq 200
>>>     [    0.008235] [Firmware Bug]: CPU   4: APIC ID mismatch. CPUID: 0x0004 APIC: 0x0000
>>>     [    0.008235] [Firmware Bug]: CPU   4: APIC ID mismatch. Firmware: 0x0019 APIC: 0x0000
>>>     [    1.497074] cpu 4 spinlock event irq 201
>>>     [    0.008235] [Firmware Bug]: CPU   5: APIC ID mismatch. CPUID: 0x0005 APIC: 0x0002
>>>     [    0.008235] [Firmware Bug]: CPU   5: APIC ID mismatch. Firmware: 0x0021 APIC: 0x0002
>>>     [    1.497074] cpu 5 spinlock event irq 202
>>>     [    0.008235] [Firmware Bug]: CPU   7: APIC I
>>>
>>> Full console log (containing both successful boot of Xen 4.19, and then
>>> reboot into 4.22):
>>> https://openqa.qubes-os.org/tests/184780/logfile?filename=serial0.txt
>>
>> The 4.19 log also has an anomaly around this point in time. Can you try
>> again with sync_console added to both the 4.19 and the 4.22 attempt?
> 
> Yes, sync_console helped quite a bit, now I get full dom0 panic message:
> 
>     [   10.334800] vesafb: cannot reserve video memory at 0x0
>     [   10.340009] vesafb: mode is 0x0x0, linelength=0, pages=0
>     [   10.345515] Oops: divide error: 0000 [#1] SMP NOPTI
>     [   10.346503] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.9-1.qubes.fc41.x86_64 #1 PREEMPT(full) 
>     [   10.346503] Hardware name: Notebook V54x_6x_TU/V54x_6x_TU, BIOS Dasharo (coreboot+heads) v0.9.0 01/01/1970
>     [   10.346503] RIP: e030:vesafb_probe.cold+0xd4/0x5fb
>     [   10.346503] Code: 08 75 1f 83 3d a8 8c 1d 02 00 75 16 48 c7 c7 90 4a fd 81 e8 8a ef f9 ff c7 05 d4 54 09 02 05 00 00 00 8b 05 c2 54 09 02 31 d2 <f7> 35 d2 54 09 02 8b 15 fc 54 09 02 48 89 c1 48 c1 e1 20 48 09 ca
>     [   10.346503] RSP: e02b:ffffc9004001fbb8 EFLAGS: 00010246
>     [   10.346503] RAX: 0000000000000000 RBX: ffff888101d86f28 RCX: ffffffff823666e8
>     [   10.346503] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000003
>     [   10.346503] RBP: ffff88810197d400 R08: 0000000000000000 R09: 6c656e696c202c30
>     [   10.346503] R10: 0000000000000030 R11: 203a626661736576 R12: 0000000000000000
>     [   10.346503] R13: 0000000000000000 R14: 0000000000000000 R15: ffff888106351000
>     [   10.346503] FS:  0000000000000000(0000) GS:ffff888cef7c1000(0000) knlGS:0000000000000000
>     [   10.346503] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
>     [   10.346503] CR2: ffffc900064ff000 CR3: 000000000222c000 CR4: 0000000000050660
>     [   10.346503] Call Trace:
>     [   10.346503]  <TASK>
>     [   10.346503]  ? __pfx___device_attach_driver+0x10/0x10
>     [   10.346503]  platform_probe+0x39/0x70
>     [   10.346503]  really_probe+0xdb/0x340
>     [   10.346503]  ? pm_runtime_barrier+0x54/0x90
>     [   10.346503]  __driver_probe_device+0x78/0x110
>     [   10.346503]  driver_probe_device+0x1f/0xa0
>     [   10.346503]  __device_attach_driver+0x89/0x110
>     [   10.346503]  bus_for_each_drv+0x94/0xf0
>     [   10.346503]  __device_attach+0xaf/0x1b0
>     [   10.346503]  bus_probe_device+0x8d/0xa0
>     [   10.346503]  device_add+0x508/0x710
>     [   10.346503]  platform_device_add+0xed/0x250
>     [   10.346503]  sysfb_init+0x283/0x320
>     [   10.346503]  ? __pfx_sysfb_init+0x10/0x10
>     [   10.346503]  do_one_initcall+0x57/0x310
>     [   10.346503]  do_initcalls+0x1ef/0x240
>     [   10.346503]  kernel_init_freeable+0x187/0x210
>     [   10.346503]  ? __pfx_kernel_init+0x10/0x10
>     [   10.346503]  kernel_init+0x1a/0x140
>     [   10.346503]  ret_from_fork+0xf2/0x110
>     [   10.346503]  ? __pfx_kernel_init+0x10/0x10
>     [   10.346503]  ret_from_fork_asm+0x1a/0x30
>     [   10.346503]  </TASK>
>     [   10.346503] Modules linked in:
>     [   10.559786] ---[ end trace 0000000000000000 ]---
>     [   10.564581] RIP: e030:vesafb_probe.cold+0xd4/0x5fb
>     [   10.569546] Code: 08 75 1f 83 3d a8 8c 1d 02 00 75 16 48 c7 c7 90 4a fd 81 e8 8a ef f9 ff c7 05 d4 54 09 02 05 00 00 00 8b 05 c2 54 09 02 31 d2 <f7> 35 d2 54 09 02 8b 15 fc 54 09 02 48 89 c1 48 c1 e1 20 48 09 ca
>     [   10.588833] RSP: e02b:ffffc9004001fbb8 EFLAGS: 00010246
>     [   10.594255] RAX: 0000000000000000 RBX: ffff888101d86f28 RCX: ffffffff823666e8
>     [   10.601622] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000003
>     [   10.609000] RBP: ffff88810197d400 R08: 0000000000000000 R09: 6c656e696c202c30
>     [   10.616378] R10: 0000000000000030 R11: 203a626661736576 R12: 0000000000000000
>     [   10.623755] R13: 0000000000000000 R14: 0000000000000000 R15: ffff888106351000
>     [   10.631136] FS:  0000000000000000(0000) GS:ffff888cef7c1000(0000) knlGS:0000000000000000
>     [   10.639483] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
>     [   10.645434] CR2: ffffc900064ff000 CR3: 000000000222c000 CR4: 0000000000050660
>     [   10.652817] Kernel panic - not syncing: Fatal exception
>     [   10.653803] Kernel Offset: disabled
>     (XEN) Hardware Dom0 crashed: 'noreboot' set - not rebooting.
> 
>>
>>> It doesn't reach loading graphics driver in dom0, so I don't have
>>> anything interesting on VGA (the last output is about the kexec call
>>> done by Heads). But at least I have a serial console.
>>
>> Yet interestingly Xen's "  VGA is ... mode ..." lines differ as well.
> 
> This might be relevant given the above.

Indeed. It looks like d5a73cdc6b90 ("x86/boot: Use boot_vid_info variable
directly from C code") is at fault, breaking this piece of pre-existing
code at the bottom of mbi2_reloc():

#ifdef CONFIG_VIDEO
    if ( video )
        video->orig_video_isVGA = 0x23;
#endif

Does the patch below help?

Jan

x86/boot: don't blindly mark VGA in graphics mode on MB2 path

Setting ->orig_video_isVGA to the specific marker should be done only when
the VBE tag is present and the FRAMEBUFFER is either absent or indicates
RGB type. Since the "video" variable now starts out non-NULL, this
property was broken when in particular neither of the tags are present. To
move back to at least close to original behavior, add a 2nd check to said
conditional.

Fixes: d5a73cdc6b90 ("x86/boot: Use boot_vid_info variable directly from C code")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -339,7 +339,7 @@ static multiboot_info_t *mbi2_reloc(uint
  end:
 
 #ifdef CONFIG_VIDEO
-    if ( video )
+    if ( video && video->lfb_size )
         video->orig_video_isVGA = 0x23;
 #endif
 


