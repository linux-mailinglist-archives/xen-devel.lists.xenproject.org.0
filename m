Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xl5pHqZ+ImrmYgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:45:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D65CE64619F
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:45:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=bra+++CC;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1329132.1593336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVPFF-0001Kj-H8; Fri, 05 Jun 2026 07:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329132.1593336; Fri, 05 Jun 2026 07:45:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVPFF-0001IP-E9; Fri, 05 Jun 2026 07:45:33 +0000
Received: by outflank-mailman (input) for mailman id 1329132;
 Fri, 05 Jun 2026 07:45:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wVPFD-0001IF-6k
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 07:45:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVPFC-008w8Q-G4
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 09:45:30 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a227e81-e002-0a2a0a5209dd-0a2a45059530-48
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:45:30 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a227e99-aaa8-0a2a45050019-d1558030a988-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:45:30 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-490bc6a7958so15540545e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 00:45:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc4082c3sm128222235e9.13.2026.06.05.00.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2026 00:45:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1780645529; x=1781250329; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8SeIiky47HYOBTBO4E6X5nDTDvMKndnIgnKQ6nfrwQ=;
        b=bra+++CCMWgfv2Pe4CkEHn63PPyEgpAOXlhQtSQRf3iDYzzsaM0nGrfm3UaY4ET4SZ
         QfAjGShG83n/TtH6/vN6lk9pR4OxdFQ+GBe3qHAj3X4etw5vtAMZIsXo62GurY/7JK2H
         ICTxLZAf6BAgCrf5EX/WMRWyBERsl+aSf5vN4x+njaYQMapZxkJWqQw2gadRXL59cpsA
         UIhde9BuIzF85vez69GM4+qHQYfNQGSE+SLxs4qr9zEeBevWB+K9Ip2BeUM+0DaKuXIu
         o7MqTRe7/JTtCiYDqTW10m7PVDDEwK5IcR1+5XFjy7b5ELEQg4xPfzVXC8KwaZIkfJaR
         s3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780645529; x=1781250329;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8SeIiky47HYOBTBO4E6X5nDTDvMKndnIgnKQ6nfrwQ=;
        b=DTBumqiyiT8ZQxT0qjN91M2NN4XEwqSVpHqhZBqCckYKf230WZ8qsnC/TZecpK09CF
         mTd11ar1d3B/isgV52Q20T5Has6ySKymRSR7h7jBjRLspwvZEwBc5Yua/EMXeEhP/WiO
         rkhCCLIRUzmfg++OFyYEXZ8ZzOdu8rcYfFPBj3ql0/boJ13FpGY++Vb4XCihlXFOPGG7
         1o5anA8Ybmz9Lj9fcf0uNx+YOeI8T1F2RW0BV9EU+crZxRhofFtDkuOWnxryCjJEy/UP
         cmoMK/8WoSqtZHT8tB2UI3YzJtJHvrNbzp24npCA/vL8UoNe3KX9L8FwDorb7Qv9SaDd
         Qe0g==
X-Forwarded-Encrypted: i=1; AFNElJ+S7l70wWSwC+0QXa5isWIXZ4w/q7gmLJPPv04+MG1kt1zR6jB9CDEOVt5/1f7XgdTTuGzyW4HI44o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2gUgg5puS4xLy2faBuXy7wahTcDhh+wuoi6Wuh/520ZE2oyRb
	2Xs8X/LkfLiAVZD2Alz1ebiH9erAfgGyBVdSKt4wRbLbA61q7d4rNwiy318fgHvXmw==
X-Gm-Gg: Acq92OG3i4T6EMqo3QD8e/AnJLRGrFh2rMOvG1HQZ4H/iOaboSW/3miVBlgQuY6yRo9
	E4Y/7AF5Ix4BTOQvsuRqKiUJL2h5EMD6ijoo9tft8LtmuMAthGlJGQ9sR0/8FQ3hv35RWWwOdSA
	/vy9FX+fajAb0udcB+s2xS8AMMgt9BFtvQ9J4Pv8x7HNeRPRzmiQXGzpvl9PNNl7Pin1kCBsNIQ
	FoqKC+JrNVBFBn7pPgOBsAm02JYMTSGu5NXhtxc3EEg/VRXcbo+cBjm1RaTqax0PZo6PkdcXaU/
	qBT37TvZI4A3HaLz5O3BNzXci8dC9IztXWrP08NxbCTNtQkm7KJHVhYZj9wY/nA6AgIBmLYqdl5
	KKb8KVpI57NSb0ikYlQ3q4S31THf6/XbFemcpL9snon7x04ywdr8ge9fbnZiA0FbQUn4njL6gxr
	+2Fr2JhCQ6PSkmJUZD/oEX2HhHI1kENVbEudwwoEviEj0O4XJIQlMwsawh+XsvINqc/GAOeKqMv
	6QU1yN/MpOagoe/ziI7iCJN7w==
X-Received: by 2002:a05:600c:34d2:b0:48f:e230:29f4 with SMTP id 5b1f17b1804b1-490c2d1fb35mr21882585e9.15.1780645529494;
        Fri, 05 Jun 2026 00:45:29 -0700 (PDT)
Message-ID: <75e86d74-9fa1-4090-bea7-332ec31ffb90@suse.com>
Date: Fri, 5 Jun 2026 09:45:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] Align all sections to 4KB
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
 <20260529153531.1341542-3-frediano.ziglio@cloud.com>
 <7067092e-ba18-4513-a9b1-83ba084ccbb4@suse.com>
 <CAHt6W4cP57pAPsNDKpssjYB=snLEZgOhWkYkVrJys01-NTMiRQ@mail.gmail.com>
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
In-Reply-To: <CAHt6W4cP57pAPsNDKpssjYB=snLEZgOhWkYkVrJys01-NTMiRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1780645530-E2193443-A342A1CD/0/0
X-purgate-type: clean
X-purgate-size: 1587
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:frediano.ziglio@cloud.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:mid,suse.com:dkim,suse.com:from_mime,suse.com:email];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D65CE64619F

On 04.06.2026 12:16, Frediano Ziglio wrote:
> On Tue, 2 Jun 2026 at 13:09, Jan Beulich <jbeulich@suse.com> wrote:
>> On 29.05.2026 17:35, Frediano Ziglio wrote:
>>> --- a/xen/arch/x86/xen.lds.S
>>> +++ b/xen/arch/x86/xen.lds.S
>>> @@ -162,8 +162,8 @@ SECTIONS
>>>         __note_gnu_build_id_end = .;
>>>    } PHDR(note) PHDR(text)
>>>  #elif defined(BUILD_ID_EFI)
>>> -  /* Workaround bug in binutils < 2.36 */
>>> -  . = ALIGN(32);
>>> +  /* align to satisfy UEFI CA memory mitigation */
>>> +  . = ALIGN(PAGE_SIZE);
>>>    DECL_SECTION(.buildid) {
>>>         __note_gnu_build_id_start = .;
>>>         *(.buildid)
>>> @@ -330,6 +330,7 @@ SECTIONS
>>>    __2M_rwdata_end = ALIGN(SECTION_ALIGN);
>>>
>>>  #ifdef EFI
>>> +  . = ALIGN(PAGE_SIZE);
>>>    .reloc ALIGN(4) : {
>>>      __base_relocs_start = .;
>>>      *(.reloc)
>>> @@ -355,6 +356,7 @@ SECTIONS
>>>    VIRT_START &= 0;
>>>    ALT_START &= 0;
>>>
>>> +  . = ALIGN(PAGE_SIZE);
>>>    .sbat (NOLOAD) : { *(.sbat) }
>>>  #elif defined(XEN_BUILD_EFI)
>>>    /*
>>
>> You say "all sections" in the title, yet this is not covering e.g. debug
>> info.
> 
> I will change to "all loadable sections". debug sections are not
> loadable so they don't cause an issue.

Please try to be precise there, as some aspects are subtle. As per my
understanding, like .reloc all .debug_* are loadable (and may be loaded).
The IMAGE_SCN_MEM_DISCARDABLE flag merely means they can be discarded at
a certain point after image loading (for .reloc in particular: after
relocations were processed).

Jan

