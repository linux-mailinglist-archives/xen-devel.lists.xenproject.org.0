Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hce5BEL0HmoaaAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 17:18:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A638762FAD0
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 17:18:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=T4DUcu1i;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1325195.1590691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUQsc-00010n-1X; Tue, 02 Jun 2026 15:18:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325195.1590691; Tue, 02 Jun 2026 15:18:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUQsb-0000yQ-V5; Tue, 02 Jun 2026 15:18:09 +0000
Received: by outflank-mailman (input) for mailman id 1325195;
 Tue, 02 Jun 2026 15:18:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUQsa-0000yE-Ig
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 15:18:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUQsZ-00Brua-V3
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 17:18:07 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1ef423-bab6-0a2a0a5309dd-0a2a4507c626-20
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 17:18:07 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1ef42f-229c-0a2a45070019-d155dd2ca8ea-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 17:18:07 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-45ef5146b56so2584108f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 08:18:07 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0e239f4sm113262235e9.7.2026.06.02.08.18.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 08:18:06 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780413487; x=1781018287; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dk7b7TV75Onq/xYGJsQzaqAHusaE5osboW11M//1zLQ=;
        b=T4DUcu1i7xYv0jAMFYWN3yzVMhBzSLlRQgzkkZS3cP1d7H7MZRdhqQi48yW6CgV28j
         zn7puZ2fgiVFm45jMRh1lebh8ZxfWvvxB9yMy2WF0oU3Qx8l/fPwOn+UliSwMzFIzJ5f
         3+iNEPZ4KE0qKj7i+G7L+z2IZrVTcooHEmvQ3JsHBc31JlciUQNxZHcJi8turdAM8Hkq
         M0x8XqjOLGUKt95q7JM4XP2j+TSamDrmk1sMX4PnVzUxL71CTwcBK4bxcuwRUpaAUYuH
         z38FW8uxVIxfx/ObRwFYhDzjxQTGc7vmEaoVEJmFzKg1iEyb4cm0M3P0CBhBA2vNRq2z
         xb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780413487; x=1781018287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dk7b7TV75Onq/xYGJsQzaqAHusaE5osboW11M//1zLQ=;
        b=pdG0gdGaoGSXJr4oU5d1V7F2m7IhIw6uZlmwfT43cS07TdJ94PELL94K/izFn+ZKzn
         8HMBRTsgYHowPwRfodSQuNXNSJKV87HqRsIqfpyEZ5AJp3Y3WIpFNLt9cueelxBjb6VU
         /bk8qE7+yYhoBH6vyrnpAa+r0RUeEN/VmjKPdn6hoppkXDnpBQsNTaevDH2PyF7TvQlj
         aIdzyNblXggz00YI6HRnaj5jKH8ZzrXyO27N5TT4PijkFbZW2S6bIvJbk9Uo+FlSB2HA
         ppldETe+jYInuQYFd4tPfj69EK6WQP29qJZk4WXl6qL1bOjrkCUZ6CbV9AtwtZfGrXaj
         Yexw==
X-Forwarded-Encrypted: i=1; AFNElJ931o6wER+q8gz1rjhgfPHxN4tFWGNwifA3H/7iWuOUc4wpcxGAdeFjoYexS2nXHCVOHdhJTCWf94c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyX43SMyGEZZDyR6FMvDKzzU7GrJVMboVC5w9jomx6pSOTzRBBF
	HIHBgxzNhiuJGir2P8ZV3iXp+wzqVaohODmOX9XCe3c8qPF0peasl0Hf
X-Gm-Gg: Acq92OGCVkVzpQ8YTvDg37r3LAAhrzIlwIwk/gOhmoCwr2ru0qGnVxCZf7Chv6fx2Hf
	6jrSEMP1BjueCkDFK0JnV2NQ9Q9GX/qA97BaNmox+Wn7LNZsOPR3cO8vuXYLH6N9gTBqIMUbIXC
	IUsA4Ym3KdwjP3Fki67SJYv0IU+YtJeUp2dM7nvsBaTywbxSI8Ea5cF4ZhEs80J4XegoBmC9fiK
	WRFYiVYn8bcFZRVYoyx+5KLqcEil00HPyH0sNAI3m268wIhUXtVk0ivQWhXzqM48Ki5Y0DXulZv
	UC3/X1iyMuZMoIQ9oIWUHXQlsntDrrnMvb7PBH4aXBBae8vH4VtcgmYqV2LWn08pqHxdwINRori
	C17ChEVS+tU+7XEmrM+YodCATwFjL0n8Vn8jfxB+m10Wfj4FcBsWyq7n6VJgsGa87EiOA8gqCdY
	6DyNOFBl3XbUlyqUARUzVw+iH25EpOJfD2ZdeqyWW0OSgvWQ7RIV+HtwvSrt3/1WIWiQcN/tIIp
	shxKCpvp374aEBP
X-Received: by 2002:a05:600c:c84:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-490b0e9f45cmr65119975e9.14.1780413487026;
        Tue, 02 Jun 2026 08:18:07 -0700 (PDT)
Message-ID: <4f125442-e5ff-4f43-a30b-8aca8a6a04fe@gmail.com>
Date: Tue, 2 Jun 2026 17:18:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/efi: Use blexit() instead of BUG_ON() in
 read_file()
To: =?UTF-8?Q?Szymon_Aceda=C5=84ski?= <accek@invisiblethingslab.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20260602131737.2983084-1-accek@invisiblethingslab.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260602131737.2983084-1-accek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1780413487-21D6FC48-17C13567/10/73395122804
X-purgate-type: spam
X-purgate-size: 677
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:accek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
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
X-Rspamd-Queue-Id: A638762FAD0



On 6/2/26 3:17 PM, Szymon Acedański wrote:
> Follow-up to 880e40b187aa, which added a BUG_ON() guard in read_file().
> 
> But as Jan pointed out, before ExitBootServices BUG_ON()
> is not functional. It results in a hang with no message.
> 
> On the other hand blexit() prints a message and returns back
> to the bootloader.
> 
> Fixes: 880e40b187aa ("xen/efi: Fix boot from a device without a file system")
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Szymon Acedański <accek@invisiblethingslab.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

