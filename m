Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEQkHdksA2pe1QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 15:36:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21181521537
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 15:36:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306788.1578574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMnHU-0004LC-FT; Tue, 12 May 2026 13:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306788.1578574; Tue, 12 May 2026 13:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMnHU-0004KR-C8; Tue, 12 May 2026 13:36:16 +0000
Received: by outflank-mailman (input) for mailman id 1306788;
 Tue, 12 May 2026 13:36:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wMnHT-0004KL-JR
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 13:36:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMnHS-003yMz-SJ
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 15:36:14 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a032cce-2eae-0a2a0a5409dd-0a2a4505896e-0
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 15:36:14 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a032cce-aaa8-0a2a45050019-d1558033c07d-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 15:36:14 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso51066445e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 06:36:14 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e908cb403sm43449755e9.9.2026.05.12.06.36.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 06:36:13 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778592974; x=1779197774; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZaZ+NTBSU/ub/f0LQjzSVpAxRfv4aAjAGsxul3GYYRw=;
        b=RmK/V7ym5cGpvCjMg2byM+sBuRun8BhCQAfod4SGqg9XBiSZFskoAtI6Nj8NAU25l2
         jp2+3Q5Yzqkeb4xvXvXZVzci89drlBub51yVcQiiDn04J+zlmEIz1vDr2GSKPzxqz3HC
         JJJIcyS3JM2sZl4R6CbNzlkTReFdPiGBFcUIOL3XEN8K3QFjVHQE5OVqeIbJlkrSN6Ry
         LNhVL3fTAoRjBD9MmCkn9m0w+ywhLKBSZqw16B/5Ei69UfBiTypB42GQfpn1YB+IGzJs
         jtMmLC4tsan3xLcq2UN2/mH5ItVgY4husNYUmegdUDeNzmUMgi/DHkBGyeFNH9gJbOqg
         0LVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778592974; x=1779197774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZaZ+NTBSU/ub/f0LQjzSVpAxRfv4aAjAGsxul3GYYRw=;
        b=jGBFvJ1E4q59wlB65kup9aloUV9w3kvs5I+AVnrNpPxN3QiHrOT77pibiO3mLQxX5c
         NPgIKG5L9cBuOyvnluUWVNjgFqg30UBHlbTZ1K/eX27MCjAqPy5LBozFCwSP+AuWV3cw
         dmDwZDH2yeD1AtO5+N1M5jxiAOZBtsMKFTNJbrsQi3QBNG/5uKd1bYS6HhkuQmqmuoTS
         Q+BFIAc15ozpetlyPx0IGVh/R0O6e7/dthGIrzkKfhTbuh6XgOVbu/LFp4LbxquXrkxO
         jB5NEjw7JgBEGTWydNQqA4Ffy6eEQ/1FIdB3D6bTkhKBlmraOBoutHlDo37ybtf2gH2D
         w7HA==
X-Forwarded-Encrypted: i=1; AFNElJ8dH5Bcx5+C+aIIY/Mwx1ryXszrZje5e3yqZc4hFcZhj+2XxIe1oO7YJVxkNxxqqpCNydkzSFz7kpA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEgR4cRWSBt25j3QkDosRYSvMiUL3F1KmXx8+BkpMw1cEXMhQk
	1s4qZX9e1kPPkFzSSnSdbyfQxoJuLWw9hrhkf7Qnq4T0KHXO5Cbj+mby
X-Gm-Gg: Acq92OFa2U+kRrnEFEJk/zE5zOcYtYTNTREPngpbQxIqQ7jNnWRcQoueT+GPcQ6TRpz
	LC/2p9IFWqsCAS6oT6qrKO5ObnzYngkcGjWNTCFz/s+TuWm5219rCpBjzfSGOfvfid0cGeoaGm5
	Vb3jz/hZvDA6wuaXwWUab57CuZifBlS9wvnYKJvtuaVTIYnVXrrFgYuUO9BGWwQxy1ZHDORX15+
	jJpG6zfFeKHGJ2MZympZFdeC4v1LzuCbwHBzoaGLwUj6KuzVB9qc6C8UIDGhRRUTnp7PppG1+OZ
	O+V0PcL8IhMmKlO8UnUq24Xb3bAXfxA0vJAipFbitrf3Xaz7sVZ18ZyGGxHL4OsMLI+BdSys5Gp
	7Qc5VXxhZXhb/BHc4tnDNkp09kUCpR7Ee42QDW+fcrD2TAyV5Nej+Xn+zKruGY3qo901Ek6TePB
	uQT5lQ6baJ2TinPFagUnMKh+DGoOj6iI48Mc2JIzovpW3GHuB6jma/oKPT31A2VlTt8O+sBHfTO
	Zw=
X-Received: by 2002:a05:600c:4fc4:b0:48a:58ae:9938 with SMTP id 5b1f17b1804b1-48e706bd7bdmr223927435e9.19.1778592973599;
        Tue, 12 May 2026 06:36:13 -0700 (PDT)
Message-ID: <f16e96c7-7835-48c9-a44b-595457ac01f8@gmail.com>
Date: Tue, 12 May 2026 15:36:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/dom0: enable pf-fixup by default for PVH dom0
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Teddy Astie <teddy.astie@vates.tech>
References: <20260511185145.23750-1-roger.pau@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260511185145.23750-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1778592974-DAB68443-19A47BDC/10/73395122804
X-purgate-type: spam
X-purgate-size: 1321
X-Rspamd-Queue-Id: 21181521537
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,changelog.md:url,keepachangelog.com:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:community.manager@xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action



On 5/11/26 8:51 PM, Roger Pau Monne wrote:
> A non-trivial amount of issues related to PVH dom0 are fixed by enabling
> the `pf-fixup` command line option, and no issues have been reported as a
> result of its usage.  Enable the option by default to make PVH dom0 more
> robust in its default configuration.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>   - Slightly reword an expand option help text.
>   - Mention the change of defaults in CHANGELOG.
> ---
>   CHANGELOG.md                      | 2 ++
>   docs/misc/xen-command-line.pandoc | 8 ++++++--
>   xen/arch/x86/hvm/emulate.c        | 2 +-
>   3 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index ce46020dbdb4..25f5a192ed48 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -7,6 +7,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   ## [4.22.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
>   
>   ### Changed
> + - On x86:
> +   - Enable pf-fixup option by default for PVH dom0.

LGTM:
  Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

And also,
  Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

