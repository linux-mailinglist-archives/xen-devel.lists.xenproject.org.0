Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BG/EGoKdJmpjZwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 12:46:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ADE6554CC
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 12:46:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="r/IsVbRl";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1331555.1594118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWXUk-0003aw-Bo; Mon, 08 Jun 2026 10:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331555.1594118; Mon, 08 Jun 2026 10:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWXUk-0003YX-8G; Mon, 08 Jun 2026 10:46:14 +0000
Received: by outflank-mailman (input) for mailman id 1331555;
 Mon, 08 Jun 2026 10:46:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wWXUj-0003YP-5X
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 10:46:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWXUi-00HL1v-IP
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 12:46:12 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a269d6f-5cb7-0a2a0a5109dd-0a2a450cb5cc-24
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 12:46:12 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a269d74-62f1-0a2a450c0019-d1558034f176-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 12:46:12 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-490b64c8311so46596815e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 03:46:12 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f3444fesm52068213f8f.20.2026.06.08.03.46.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2026 03:46:11 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780915572; x=1781520372; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VR6azSEsXCfN6MUjLTKF44FYAxiY7DmiqwjQ51RGI3Y=;
        b=r/IsVbRlSCX7pHA/R+TEIiM7p8F1YvfkKW3MA4y7PkIbI/Xfec9a1NI+JrqeZVd64T
         d6uTJe+YJ5WCU81USYYAeVSyn2/pHt7+oDzjrPqPfoxS+hP2zByk6NTvaun/QMHEgYgR
         7bBIqz0cYK1K0ReoiATuOTu6HL8YWLNBxIjCdp7U6uvtgsHsqM7O4Js13F5lKT2gbbiu
         pmH/rC+JkkQ2wu1iuog351VsqRuYtMvmCzSbbCj/i8loMvRN7mf80q8RIYc77jeeYGqz
         x/+SoZL0jTgATcFUoKd5ght3JPr9+TBlCgetr/PRl4MA+fFNKsn9vgJWoe+DcH+1EoNa
         4cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780915572; x=1781520372;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VR6azSEsXCfN6MUjLTKF44FYAxiY7DmiqwjQ51RGI3Y=;
        b=dsvHEHNT9zoO6oKCK33anaxuzGlBdov4iOwfiX0/Ct9YqoSGaEMIh7wT4WN481IL0F
         AmnOgRjUnBivl1HN49szrcMy4POBkt8KejJttMa45S6kB87DR1jdNNWB9bixITCMEnJx
         EjspQWCMEbLk6g2ZnhvGE81YdH+EyqTdmCHwPZwmutmRlGZzGrXYLf9UpwE0GDa1qCMq
         sWmS51gu8nTX4K16t3d6NmwfNpj6W8+L0jr4Q0c/L/R5K1zKhMGTuRB4AoqQ+NvIHTYB
         0FUYo6mHb9Zz89sviGk7OQRRaOme0SNqxzxes1nyCx9hIGuUmOzEQHl9Z9yk16AUYRzx
         /Y1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/bnvISfcB5u4evE5is1ednoqYrrKQptMmIqnlG7iAFe+9+YZX6cDuZNo0XJbribB1S5OdMkBhcoJo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgksXg+rCnXQFvZIhRnaQvhX9FwMcP3BO5U9rBqaboceZw7oUr
	xq32kWKds3SnAsIUR+LVLocbUgy2zpuZZuLoxQ9h08FGZeSK3tmIp/9I
X-Gm-Gg: Acq92OGv6kJ09lZFkS5vXG3wwFAzEWgscWLUxiv58y5C0cUqVLq1i4sGEZsxUuLEoxb
	5YI+4rqEZFZe69R3JHWFVpdhSB8VsvRruVnV8B9dxwVDffppm2LEPn7VY+/JF3IiOtDPwlx9+Kw
	RNPNVwJIMeDBHpXmlG20aGXyayEV/7b6qy3ZgXCjxyANEOLuovQ3QCfckz7Yp5iw3P1IX4aEI1G
	oRilkBK1NFZtK7H/cfkul7rq+72dZV4+/6O1j1X7tHY//Bd5hVHPrNKS76BhecVGTIg5DrQ8d8g
	9D9YQkjwOa3btvBqFh3wk7RCwUaUzwbCfxLEhKa5tEAg/qnx9PWoBcQQfOu5aadvTQSq68HdNUf
	9F14jJJq7XLp2svaowjs2AEouAI+cJmlmzf8qPLilB1VXZzWKhOKRT6W37+qmXnDx5ZeMaE6Whv
	KFjxkJLnHRe3v+1K4I807MUdYsWAVUI/V/4V9Ey7yuBm7AiT0zvslar7ZbMiTXcGpMR1KYmZ7+7
	K5gEN1KrIsgevY3
X-Received: by 2002:a05:600c:5246:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-490c25ff39amr249485435e9.27.1780915571730;
        Mon, 08 Jun 2026 03:46:11 -0700 (PDT)
Message-ID: <863d76e9-ec5e-479e-8d8c-ee43fdb5e5b7@gmail.com>
Date: Mon, 8 Jun 2026 12:46:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] docs: remove non-breaking space from
 xen-command-line
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260608082440.73415-1-roger.pau@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260608082440.73415-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1780915572-E0766CF5-791E328E/10/73395122804
X-purgate-type: spam
X-purgate-size: 1007
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
X-Rspamd-Queue-Id: 12ADE6554CC



On 6/8/26 10:24 AM, Roger Pau Monne wrote:
> Fixes rendering of the generated html.
> 
> Fixes: 31d9c88a3857 ("pdx: introduce command line compression toggle")
> Signed-of-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>   docs/misc/xen-command-line.pandoc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 93c2a73f4ade..1c711fa98086 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2082,7 +2082,7 @@ for all of them (`true`), only for those subject to XPTI (`xpti`) or for
>   those not subject to XPTI (`no-xpti`). The feature is used only in case
>   INVPCID is supported and not disabled via `invpcid=false`.
>   
> -### pdx-compress
> +### pdx-compress
>   > `= <boolean>`
>   
>   > Default: `true` if CONFIG_PDX_NONE is unset

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


