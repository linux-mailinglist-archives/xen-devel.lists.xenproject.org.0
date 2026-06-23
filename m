Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0dzYJzuHOmqJ/AcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 15:16:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C696B764E
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 15:16:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=XeuBSLV3;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1344243.1603344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc0yZ-0004zd-5B; Tue, 23 Jun 2026 13:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344243.1603344; Tue, 23 Jun 2026 13:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc0yZ-0004xx-25; Tue, 23 Jun 2026 13:15:39 +0000
Received: by outflank-mailman (input) for mailman id 1344243;
 Tue, 23 Jun 2026 13:15:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wc0yW-0004xr-U9
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 13:15:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wc0yV-00BCpC-LW
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 15:15:35 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3a86f1-2eae-0a2a0a5409dd-0a2a45068dcc-14
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 15:15:35 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3a86f7-b690-0a2a45060019-d155dd2ba5e8-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 15:15:35 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-4629051c946so741490f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 06:15:35 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-466648c5ddbsm37306159f8f.12.2026.06.23.06.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 06:15:34 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782220535; x=1782825335; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h9RInanI2ZcZe0WMMw3XlKa5djWr79jPbIW6DoHa7H4=;
        b=XeuBSLV3x5fhcb+cGIEK7ykSCKC8FetjV+SJPv6sTY1UQ6Eii7rTtzBVCtbKjwO3KR
         6NYQ8Ye/W0OX+OQYciEMzWEtwpI9fcg5GrghMGV79vqQ8W4iYTPURKK9Owx/JTyqa2c+
         QwJyC5Gn93XWRvxM3t26o63JdFEba1irmnfr9ca4gUEV4ZpzLHWe5j79TPw/xpr4AKfO
         XNvo4ML6xfRdj/BiNwOEoLFQgkmQY6fglUE+bET++XDXTizhIL2xBbq07FQb7+QgF7Fa
         rEtudxumv2Dxls8zHZZI0g0VVxVIN412PZHBWBEj4oIjzDCgoeS768xr/wwIn/64y/2s
         SNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220535; x=1782825335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9RInanI2ZcZe0WMMw3XlKa5djWr79jPbIW6DoHa7H4=;
        b=Hb9mYHDUp71Rn1w73xMlKUyGUKuSByencrB1ccXYJyp5bvIJhpMh0pbayE+9Df2PFU
         bpxDwZHkb3FHuHnGDaHONlZX0AXdGYjZFbUy62DUboeHa6j5FNlKjVaZj2VTywOUsi9I
         r2s0Fr3ZP43AmYzS9rhlqiYwNYiPbNhJSFppFY+wZaXknuFXnJ665CUpjfQ83how5y2V
         mnydPf0JPTz27DTVRMxrIQbVVF9jm5MDuESaA9MJ/spKND4kifhML3U5TzFdI+6namlt
         JyzVa2+USWhh1vb2W/e3sslkv5Zw2eK/lS9+DJSUYMqOE983hvWVMtlacGkKm8jYG7oT
         +Q2g==
X-Forwarded-Encrypted: i=1; AHgh+RoYQH2dKde1YgQ2H6vwxyGCZfsA3pwqUCCvuDfwHecn6FQiciGOGlD8UeJrH0SkXWJMmR+BiZQBEz8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+OFZzTc0GTUDtDfjCPd1h7T02YIFkq/bCS2NeQMnhz3/4UDYx
	SPaNi1nbPLgaixZ/siGOBEsRSrfpJj1KYDrs/OuVSTdeogzd2A3tyw3JSlRJCA==
X-Gm-Gg: AfdE7ckXzy6+VCbBNFdLSxnaT3EaWf0mohnmNhL5Y4Dtw+BKa2BAZZpObiQbfXgB6K0
	lb2TuWxhh2LmUJCOp0B6fQbuDniomFOW5xQSjKlPgWHH/7MjdGoA2ZaSDXEg94iiGuFyXAXKOOd
	wIVYJBq4rgcDM7TKoPmasb/rmfC1OctMihsk5WrvQIN8pIQWOrzIFsPEx1cbCeecZx0/wiuRaNC
	dvcc+z3iE8zBQ6ONUcmoFKcMR6X72hFTKqlBHxC33geAFQnzLMnWk5Ultc9bMA7P45kilgDRv9S
	I3FhR3OSdIQL/+pgq9R8keG4KE0xhqRhGMkoRdv2KCyOjmychqV7/If8NPgk+IonU8ZpZTAi8a+
	V9Z/yoQrMfZ7uGsk3lzkiNfphV0Umj9QpkgMEVx9qwnNwdxZoQp0Ryg1jQtzJkI3Gh5ee9e2eLO
	vzP90YtBf90lkAg0QueW2/EYzWmjFJNwltfQ2FeLCs66N14kmuNxsSTWMaHzg5H+H9FbU=
X-Received: by 2002:a5d:64e7:0:b0:45e:f93a:2069 with SMTP id ffacd0b85a97d-46a80c7aed5mr5658176f8f.23.1782220534721;
        Tue, 23 Jun 2026 06:15:34 -0700 (PDT)
Message-ID: <dfd93c7c-e5e6-4f3d-915c-e5248ac62715@gmail.com>
Date: Tue, 23 Jun 2026 15:15:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] x86/kexec: Check for a good per-cpu area before
 accessing IDTs
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Lin Liu <Lin.Liu01@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <20260622172054.504778-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260622172054.504778-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1782220535-3AFEF853-27A40FA2/10/73395122804
X-purgate-type: spam
X-purgate-size: 1366
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:Lin.Liu01@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	TO_DN_ALL(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 30C696B764E



On 6/22/26 7:20 PM, Andrew Cooper wrote:
> Prior to commit 9c20d3c5915d ("x86/IDT: Make idt_tables[] be per_cpu(idt)"),
> the global idt_tables[] was always safe to use for CPUs in any state.
> 
> However, not-yet-onlined CPUs (e.g. MADT with more entries than exist in
> practice) or offlined CPUs (e.g. xen-hptool) have their per-cpu pointer
> poisoned to detect incorrect uses.  machine_kexec() trips over the posion when
> clobbering #MC entry paths.
> 
> This fixes a fatal #GP (non-canonical memory reference) when trying to enter
> the crash kernel.
> 
> Fixes: 9c20d3c5915d ("x86/IDT: Make idt_tables[] be per_cpu(idt)")
> Reported-by: Lin Liu <Lin.Liu01@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Teddy Astie <teddy.astie@vates.tech>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Lin Liu <Lin.Liu01@citrix.com>
> 
> The fix here is a bit ugly.  nmi_shootdown_cpus() uses the cpu_online_map but
> this is wrong too; it misses parked CPUs, which do want to be captured.
> 
> For 4.22.  This is the minimal fix to stop systems crashing, but more work is
> needed to make this path fully robust.
> ---

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

