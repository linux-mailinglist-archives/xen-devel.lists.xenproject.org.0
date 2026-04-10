Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFqsH3u82GlVhggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 11:01:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BDA3D473F
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 11:01:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278507.1563313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB7jz-0002Eg-T6; Fri, 10 Apr 2026 09:01:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278507.1563313; Fri, 10 Apr 2026 09:01:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB7jz-0002CU-QP; Fri, 10 Apr 2026 09:01:27 +0000
Received: by outflank-mailman (input) for mailman id 1278507;
 Fri, 10 Apr 2026 09:01:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wB7jy-0002C5-Hm
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 09:01:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB7jx-00CGcS-U0
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 11:01:25 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d8bc61-2eae-0a2a0a5409dd-0a2a450b8386-32
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 11:01:25 +0200
Received: from [209.85.208.48] (helo=mail-ed1-f48.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d8bc65-bca8-0a2a450b0019-d155d030e55e-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 11:01:25 +0200
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-670af4fc2f1so57022a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 02:01:25 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-670706251f0sm415649a12.15.2026.04.10.02.01.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2026 02:01:23 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775811685; x=1776416485; darn=lists.xenproject.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAo25sHibVddpyd9/kKMJyuwa3tRX8JvqBopaTkYYqk=;
        b=jzIUEF9EmB5GjqH+pM2ukBMrAm/TbIEoPN59lZORCjIRUzEl7CRFCr3ht9NuhNSsq+
         8quYURGj5ghfjdnDH9xer7E7FgIbX0N54wIuZx6wSsBzjLU2fRbKqZUz5K73S5AOXP9C
         eye01CTdUqWpFqllhiDZ4KBsIJklP435YIpeV8OfL7jZ7NckvtnXCZU3drDpX0igpldi
         YVfC7FTCzGfHk8469fveI6rrut2slCXtKwfyDYRMDTElwtmIw2vC9d6k4c9Cqpe3RG1G
         cblkzeF6h9EK35S5bbWINwfZtSufe5y6Pc9wZPfi/i2h2U4MX9bzMG4HSYmqR5keGet/
         GbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775811685; x=1776416485;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MAo25sHibVddpyd9/kKMJyuwa3tRX8JvqBopaTkYYqk=;
        b=Vupub6VsukFNyIP+LSPQP3dMpl43DZPaBz5kXqkv5p0BaJdgCNOBHktyPomcXUvsut
         iNbiAWBu7vF1FEiqfWL6Gps7xvAx1oJUi4fPywukkhidnk5c5V9+/WOVr6xEcFLF0h5Q
         9U6dVNgJmAChCBI5BnVikxljXRVyMIS8Bhz8R0NyBEbSPeIwKnrEE0i/7vkmtAZiLSVk
         zJzbyFRBbhmL7yFwj6aGy3wWpfgvAPY5u1wbVErId2eO5cxi+A07yFH7iaKJJ1o6YBXc
         IxzIhabd9Gt4UoK3HqOSfUytEpdlVVUmJQiAJnBfg+v422ajkb+aT6znpnjHBAlbYCm8
         de3w==
X-Gm-Message-State: AOJu0YxK25jL5avWYDZEXTSyaidNZL6+4Xgp1cPQaSZijH5edRAlXO+E
	dB/rxHXtBscgUkGfCO/CC4GFkG2UQaKhW3mj8JoHM1MSmIwg9742a9MPhFaXLQ==
X-Gm-Gg: AeBDietFNz3rEjTybz/AjEO2zbvf29lU961RfRN7p9ndRwRuvONZ00+tCrSxLD6bTXt
	o96g32UBg54spsRRa3TC593EZon7xlLbY9FB1AyL02bb5/zQF4oIQ3pugP+4U6c/adE5p7KzhhM
	CIhASZEL66IOZvRMBwzOIsYbQrRnK6wYZcAmajbcUHWz35E/hNSIENf9OT8pKSTSzUuAHFZgSP7
	zXekRiX3UYWmi3IACIzocIkVx/sScTCRsCgomR650fCM1QkHvzHvk59/XAD4FDlsw/NzJmA3Bab
	9nopA3Sy7e9GO+XyMe/QUwYG6ulopqK2owCX6T3HC/h6klYv/O2PjjF17ePr4tRHLOP2Js9ZXwk
	7WK8c+K1oeN971cuLX4QIARP+eIB546vpOf40hMRGTN7uprC4gWG2qAOd7C3PEJ3wsP5LtseD95
	pNXc8C57YFbbwHuqDTusEoitv8QVBsd5VZa+cgNk18lv6/fVw86EkWLeBZVLjW7PGz88gYlcdpi
	7g=
X-Received: by 2002:a05:6402:46d6:b0:670:a279:19b7 with SMTP id 4fb4d7f45d1cf-670a2791b27mr409599a12.12.1775811684709;
        Fri, 10 Apr 2026 02:01:24 -0700 (PDT)
Message-ID: <29f456c6-2f6a-4b7d-a70f-9d2d50663b47@gmail.com>
Date: Fri, 10 Apr 2026 11:01:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Orzel, Michal" <Michal.Orzel@amd.com>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Generation of phandles for guest DTB in dom0less
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1775811685-F5DC12A1-91BD72DE/10/73395122804
X-purgate-type: spam
X-purgate-size: 2434
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:Michal.Orzel@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E1BDA3D473F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

While working on dom0less guest FDT construction I noticed that 
fdt_generate_phandle() is "broken" when used to generate phandles for a 
guest's nodes. The root cause is the way dom0less manages phandle_intc 
(phandle_gic in Arm terminology): the dummy GIC node already occupies a 
phandle in pfdt, but fdt_generate_phandle(kinfo->fdt, ...) has no 
visibility into pfdt and therefore may produce a phandle that collides 
with phandle_intc.

I see three potential approaches to fix this and would like to get the 
community's feedback before going further.

**Option 1: guest_fdt_generate_phandle() wrapper**

Introduce a thin wrapper that skips any phandle already reserved by the 
architecture:

   int guest_fdt_generate_phandle(const struct kernel_info *kinfo, 
uint32_t *phandle)
   {
       int res;

       res = fdt_generate_phandle(kinfo->fdt, phandle);

       if ( *phandle == kinfo->phandle_intc )
           (*phandle)++;

       return res;
   }

The obvious downside is that this is not flexible: every future node 
added to pfdt would require a corresponding fixup here, which is easy to 
forget and hard to maintain.

**Option 2: Reserve a "first free phandle" field in the arch-specific 
structure**

Add a field to the arch-specific part of struct kernel_info that stores 
the first phandle number guaranteed not to be used by pfdt. Guest 
phandle allocation would then start from (and increment) this field, 
completely avoiding the pfdt phandle space.

This is cleaner than Option 1 but requires careful initialisation and 
documentation to make sure the field is always set before it is consumed.

**Option 3: Store a pfdt pointer in struct kernel_info**

Add a `pfdt` pointer to struct kernel_info and pass it to 
fdt_generate_phandle() whenever a guest phandle is needed:

   fdt_generate_phandle(kinfo->pfdt, ...)

Because fdt_generate_phandle() walks the target FDT to find the highest 
existing phandle and returns the next free one, using pfdt as the source 
of truth guarantees uniqueness across both pfdt and the guest FDT, 
without any manual bookkeeping.

This feels like the most robust option to me, since it naturally handles 
any future nodes added to pfdt without requiring changes to the phandle 
allocation logic.

Does anyone see issues with Option 3? Are there other approaches worth 
considering?

Thanks,
  Oleksii

