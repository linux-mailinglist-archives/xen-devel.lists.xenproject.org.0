Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AM9HDHtQKWoRUwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 13:54:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC6A668FD5
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 13:54:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Zq4IOpdU;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1334207.1597319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXHVm-0000iw-HX; Wed, 10 Jun 2026 11:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334207.1597319; Wed, 10 Jun 2026 11:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXHVm-0000gA-EQ; Wed, 10 Jun 2026 11:54:22 +0000
Received: by outflank-mailman (input) for mailman id 1334207;
 Wed, 10 Jun 2026 11:54:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wXHVl-0000fx-KB
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 11:54:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXHVk-008TV0-PI
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 13:54:20 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a295066-2eae-0a2a0a5409dd-0a2a450b9e06-20
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 13:54:20 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a29506c-212f-0a2a450b0019-d155802dc4a4-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 13:54:20 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-490cdae130cso22147025e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 04:54:20 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3d6c65sm548270825e9.12.2026.06.10.04.54.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 04:54:19 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781092460; x=1781697260; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x3rSKkKvBSkUw1yVL7Wc98rHFbLn/xMwuexpV7snvpc=;
        b=Zq4IOpdUJtnDQgE5PJOGDwnTkPttwBpf9im4SxUAklukVaFG5vnAtUQ7eduQhOdJYn
         Rx3PC7R3hFNSjMc6SKD4ote3A5hXX97MiFTzmazzPeLzb+FTdkRRpWuEiww+V4wuLn9b
         Gi4TEAZeaBQSOLQwIxHbRSrIgqwoFP0W/uNRmdPEoKpjPXbPYk4cttjdXw8e9xZBphf8
         TqmEPgTl5t7ks6RoHvx8RBMUSg3X44e1yds/Amvn31zh1CQe8pd7B4TAJ2CerzkwVr7f
         DrwWwpUfM697gIC0neygx8Je+G3Cpx/+1eh1VJHdoQXh2fklAnWMqBb6AtkBYZ43TfhO
         t6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781092460; x=1781697260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3rSKkKvBSkUw1yVL7Wc98rHFbLn/xMwuexpV7snvpc=;
        b=ZAeADl3idUlMvNTIKLWqx4nDW9SO+e8DYOpkVDXITTg0MKHIaCmULe29jYtM13IX5L
         0n6xT0WtfUfkuNyhm+7PvfQRgcodtXXKnHQ+X4Jq73PatKp8s6fCInG26oeiy8wgdIZd
         AF/eoXuxdwtrArFwmF3N6recJAzMRJ+PUnNlT0eLW9yLZeR088TzIG6VWTLYepbjMUvF
         GIXO/n2gQDXoWXaNO+9Fup/UEBafqp9TKukhUTroUYB4Sjb7yHnL4Wg3xfbOGcB02+6t
         5xBcpj3lyfttl89l+95Ql/AhY8g6N13EBsiXRxnmybexVljQ04d6pas6NYThK8nz3tZ/
         weUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/AgWCImt2X1DCGu7z39qi4CY7FqabPr2PgarWTPMvyFDreO5fefWelTPTGbJFYMbF2UCSz/f4LBgc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3aSJ2DnL3rv+4KVh4EJzHwDtUUiZtsdpriUdYB/vfCnQngHed
	AhEgQ9rrbaXk4g7XeK06FmnAq23X7q4zIpTetnxONnKLjGOV9E7smb32Htw4VA==
X-Gm-Gg: Acq92OEREJ8ssJgDs2cmPSIq+pO4ZiKwH9VmO8gJsj1zU7+J0hAHC0xO4Drc/jwL95T
	oYGE0C++PLqKq9VCFr2z4pkeNg4ZWsGKC88TjoC1iJKobSkymuPAnMf1igZ6VcITyNnN9hWtDmM
	o9wA97xIgPhPua8Ysa+eQOgFoO+ASjfhRsI3DB3fmFKmDo4frEnRBP1mMTPZ+PAyEkMyyxTOJ2+
	4ZFyvRg+AzFwRW8bdDXuFxImTKsu3o5ox7MAqw6vrmbk6XP1iztePZZw7n2owfeqS4RyHdmgygV
	tASQ6mk7YW6P2hKAdrxkvnhKlLxV122SJRWf4qZONpGNrTdtH5Xi0ZcOYIxVX8WmGzo/KcQ1jVe
	ZQnB/+eUGfThDAc6Qbm2CiCprks9CVYT89VILWOxNWP5HX9wKnbIllHpGYWPEZ/KDzZlgXLNgUW
	OmU+RISURXveLJfh6NsVUyL4CXaBaAyK1m6bBaHUyF5Bt92yJNrO+yf4L7aX+0BhHH7eQ5CHqpr
	3BK7CHlXEc8D08l
X-Received: by 2002:a05:600c:1387:b0:48a:75b9:b0bc with SMTP id 5b1f17b1804b1-490c2619945mr379815115e9.29.1781092459869;
        Wed, 10 Jun 2026 04:54:19 -0700 (PDT)
Message-ID: <898862be-387b-47cd-b32f-3b8cf2338ef3@gmail.com>
Date: Wed, 10 Jun 2026 13:54:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] xen/x86: Change stub page freeing to fix smt=0
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20260609000638.121027-1-jason.andryuk@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260609000638.121027-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1781092460-13374F3B-B45BEDD7/10/73395122804
X-purgate-type: spam
X-purgate-size: 859
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: CDC6A668FD5



On 6/9/26 2:06 AM, Jason Andryuk wrote:
> This is a third approach to fixing the stub page handling that is
> broken with !CONFIG_PV and smt=0.
> 
> There is a CPU-indexed stubs array and a NUMA node-indexed node_stubs
> for allocating the stub buffers.
> 
>  From v2, this patch
>    xen/x86: Remove unneeded stub_page setting
> is dropped as stub_page is removed as part of patch 2.
> 
> Jason Andryuk (2):
>    xen/x86: Return virtual address from alloc_stub_page()
>    xen/x86: Change stub page allocation/free
> 
>   xen/arch/x86/include/asm/stubs.h |   2 +-
>   xen/arch/x86/setup.c             |   3 +-
>   xen/arch/x86/smpboot.c           | 114 +++++++++++++++++++++----------
>   3 files changed, 79 insertions(+), 40 deletions(-)
> 

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

