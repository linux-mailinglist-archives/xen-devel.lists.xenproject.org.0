Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cYwYJ0lPKWqDUgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 13:49:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0949E668F53
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 13:49:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=eV6dBa8a;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1334186.1597301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXHQv-0006xi-Pp; Wed, 10 Jun 2026 11:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334186.1597301; Wed, 10 Jun 2026 11:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXHQv-0006uv-Mk; Wed, 10 Jun 2026 11:49:21 +0000
Received: by outflank-mailman (input) for mailman id 1334186;
 Wed, 10 Jun 2026 11:49:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wXHQt-0006uP-UC
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 11:49:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXHQt-0093kH-Au
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 13:49:19 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a294f30-2eae-0a2a0a5409dd-0a2a4507e082-24
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 13:49:19 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a294f3f-229c-0a2a45070019-d155dd36cd79-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 13:49:19 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-45eee266c6cso5372645f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 04:49:19 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f351d69sm126391619f8f.29.2026.06.10.04.49.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 04:49:17 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781092159; x=1781696959; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wwUZ6bchHsQ0LqLygRKM4OkGUP74HWilAolQZmegxiI=;
        b=eV6dBa8a6Gvw5xHvwe/PWNqEtcGTplTNyUjMEBgMXiHCkC4oa0PmYzclLIXrGktUc+
         O0wepeIc35I0U6qkCzjeps5bRRAWH64CqiuPwoxh+r90jq9uTI4hPLHv4LsVmUkRgp/b
         pWInm0oD2GlzRgdpZxfEZaP1oV/smJw14AXzvzTvcQ6ANxNRowt8kADfLsCHL79sAk8P
         DejDJXorCRlrJCT9w3O7SBmX4kXOS3i/QRVPTp36s7m+j645d43g85aWrbo8fEIh9rsT
         J4O200yWDGN2s/wA5P92J/kE+y6qBDv4wNMmZpaKli4YKouwCgvUNHfsYXtADx4bLimH
         yUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781092159; x=1781696959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wwUZ6bchHsQ0LqLygRKM4OkGUP74HWilAolQZmegxiI=;
        b=igJ98T5oXG4eg4wC9qQM5bHPMT5rVPqTM2JqzmX7fI9Kbe6i6ArNXKI2hDbaa6s8wg
         zqiNrzeKBedc5ZJda9PQ2SJiLCNkMZOZrX1FRHyC6rOtHud3e9orkL7h7OxeoCA2o21t
         rUhxXJ7ZguajLZ8zr9UyXqyLHxX+b6W+cL3mWmGt+9RJqiPVC7XC9+LH62RrgdyS5VC5
         zNdiqh4I/wyTJKpZlkwBHE/Ir7ug+XLymbFeuv6yy2Q5khsXZATd3l7fWv2vR3zwiwSV
         +HNHiFmz6WB+TUbPjDiI9TSF7OtUxppuhNS6bE3SU4BHxvtcGK3HIkMksARXCqXyx99p
         8s0g==
X-Forwarded-Encrypted: i=1; AFNElJ96Y1KjiMLdhcJ1/MHNeZzfjLlP2EX6B/ibuib2j7qzgSAwpo4RU+qoRZARUi8Y4DUg6xQEsQ8vmac=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDgOO0Y0WuLU5EuIp2nHkNY8eDlStrPkTFZ/B4Dywha338lWJO
	mhntYnri6GDt0gL0tNief98E8C5sGbllyP3NUy5EdbAD89PckU0DmJ6BwIrbyw==
X-Gm-Gg: Acq92OEhYUb5ZljAudI0X4FsR1q0iMQCoW4MhMqGMWs9MGazPKRkeZ0jIMChFlxJ5rU
	G4oC2v8OhjRgt2ZYXbjCdvL9TTyCWIqxZzk5Kw/XUU+QGZuF7P/v6+XQliKwIDzfcEXOZy9s4bd
	PPP0XbQn7fhOgi6m+NMGifwI+SQnmzn8bfSfNMl7IUTR+o5fcQFo1s3/AaromTNW8Y5EJPUwK6h
	EAb3JcrBdU9k2S8vn/dB1oGI70k1LOlFytRUT95HUsbyOapRgs5Ed7i2yD+sY1zL/BuxrgcQ08a
	LINGOfrVdemhrNFsjWiH9AE5cQg8mgnRqdbKNk6gR2loIHuGZrEKAHJMC3euyQF6quKtvBXuI1f
	8oY8EoJ7yTQ1tTK99yYRnuWFKo+9hWph8nObMfD3/Atz2EWCwE6/TZT3oYt+4nRnDIhuPTbZpZV
	Mvv7KMdtrCmvid4FVgGF6Ob7yTqz+Qj4JM2CdpLVczyWOhiqeOFEi+3KovJP+zGgNdbZRuhAC4s
	bR8lWKSYveu0r6R
X-Received: by 2002:a5d:4811:0:b0:45e:7997:8b7a with SMTP id ffacd0b85a97d-460302e8170mr28236136f8f.16.1781092158714;
        Wed, 10 Jun 2026 04:49:18 -0700 (PDT)
Message-ID: <25af9d04-897a-40ea-97a2-17466ee4dde6@gmail.com>
Date: Wed, 10 Jun 2026 13:49:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 0/4] CI: Disentangle hardware runner containers
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20260609173102.2908514-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260609173102.2908514-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1781092159-23175C48-6B7C46FE/10/73395122804
X-purgate-type: spam
X-purgate-size: 1481
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0949E668F53



On 6/9/26 7:30 PM, Andrew Cooper wrote:
> ... and fix archlinux as I happened to get around to it.
> 
> There's a query on patch 3 which affects how we proceed.
> 
> Andrew Cooper (4):
>    CI: Fixes to containerize
>    CI: Rename xenial-xilinx to xilinx-hw-runner
>    CI: Introduce new qubes-hw-runner.dockerfile
>    CI: Rework the archlinux container
> 
>   .../build/alpine/qubes-hw-runner.dockerfile   | 21 ++++++++
>   .../build/archlinux/current-x86_64.dockerfile | 33 ++++++++++++
>   automation/build/archlinux/current.dockerfile | 53 -------------------
>   .../build/ubuntu/xenial-xilinx.dockerfile     | 27 ----------
>   .../build/ubuntu/xilinx-hw-runner.dockerfile  | 32 +++++++++++
>   automation/gitlab-ci/build.yaml               |  8 +--
>   automation/gitlab-ci/containers.yaml          |  4 +-
>   automation/gitlab-ci/test.yaml                |  6 +--
>   automation/scripts/containerize               |  9 ++--
>   9 files changed, 99 insertions(+), 94 deletions(-)
>   create mode 100644 automation/build/alpine/qubes-hw-runner.dockerfile
>   create mode 100644 automation/build/archlinux/current-x86_64.dockerfile
>   delete mode 100644 automation/build/archlinux/current.dockerfile
>   delete mode 100644 automation/build/ubuntu/xenial-xilinx.dockerfile
>   create mode 100644 automation/build/ubuntu/xilinx-hw-runner.dockerfile
> 

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

