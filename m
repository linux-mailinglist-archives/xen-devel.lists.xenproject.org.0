Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wlZxHuqAIWpGHgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 15:43:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CB76406E8
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 15:43:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=koe4YYfZ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1327875.1592590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV8LE-00021U-MF; Thu, 04 Jun 2026 13:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327875.1592590; Thu, 04 Jun 2026 13:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV8LE-0001zN-Ja; Thu, 04 Jun 2026 13:42:36 +0000
Received: by outflank-mailman (input) for mailman id 1327875;
 Thu, 04 Jun 2026 13:42:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wV8LD-0001zB-Bm
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 13:42:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV8LC-00FQIh-NL
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 15:42:34 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2180b6-5cb7-0a2a0a5109dd-0a2a4501c1e0-46
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 15:42:34 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2180ca-c1f2-0a2a45010019-d155dd2ce1f0-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 15:42:34 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-45eedcdaeaaso506212f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 06:42:34 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f35133csm16674070f8f.25.2026.06.04.06.42.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 06:42:33 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780580554; x=1781185354; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Ewh0DZvXzqlRLQq/MQs2pLBQPsdlEdEe9QdmPtct9A=;
        b=koe4YYfZBNoSc+hWzCYzz+fY/MZgR6zsW9rfy7LY/pFrpH54TfdbAjdP0jrpnghfO3
         ui6Ktz8fPRK0hfShN4SCcyubW25o7JlBVDJPoOUGTfLygh6kM54vBYDRgS0DHE3o0lie
         HCaMik0cZ/Kjys/GyBmPJ135pNW4f9LhTZONv9b+Sip+YcA0hZ5poH4rUNKjgq2laubi
         IMMamFxpQSZib4KixMjv+Tw27pFtABOvJyBeBYvdo4pLThGPuDjOMIL4oGCFWG2ulRqR
         S32S7CTaeoRheGm0nJanpYvI9JzN7uKwC6y0HkDnbZT+49vCle9zvSMeAxYnWjDNql/U
         Xemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780580554; x=1781185354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Ewh0DZvXzqlRLQq/MQs2pLBQPsdlEdEe9QdmPtct9A=;
        b=czxY3kOy6zk0kFuOSN/SAk3qY1qQqnLPodU05w8u4z6m1vUpnR/SjfCouKdp3nJv9K
         VOnlbWY7WYrl6d8vW1wSlkc+0p1Zfco9SQSCgabL0u3/cPxnkGVu424axYtH6eCJnSGW
         0NiiDpdH73/NfH24sDi2I6T8yua/pCHIJ71fp3J0FLSYRC6WWx7QfycYRIPF07C6j5Ou
         t9L8H0yNVZQZlChlKtzVfZqaPAbWSZu0NWpm+zEOsULQCrKKjdwrWWxSQHAUl4GHgBwU
         8pTrDYZg44S7UXQIbAR+YTJmkfLiL4785AVK3Vwv+HYWy3lW8pL1OWz6BEdtAv/kMsfP
         afYg==
X-Forwarded-Encrypted: i=1; AFNElJ84OxrapsUrM+W2mRo0WgfHStont0cS+145+0qHAQO9PpzNcIhor1B0hIWzOje7MzYLPo545OyZids=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyjUEGwRG2FqCTCEjW7M3+aN/Xv0mkMZ86OFnqZwn++/fuyNonQ
	044Brf9G3ghTAijYvLDGWg8KdiQpl+/7+TIzQtatyYcTYu+6kz0xa4Fe
X-Gm-Gg: Acq92OFpbhF84SoXPHlLQ8SNcxIPyVKxRpAkTzU4DpzqvYl4CbNWmd5Slrwx0HuGBXd
	+LwJSEapjFFEQbSJnrbA0LtC1WIdEuSbxwwS+9O76s5yoseyVhFkXy5/Y5ws4ugds3mgsMh6GNG
	AWZxrjCANf0aufgQbCnQ+xMjRB2k3kn0p2Dy3Us8S1v7l6QJlrplG9EGMM8Mf3erbPbTDWXcl2X
	fJqOn5msdBjejmeVwo/em3TsM3v48zZTayTjrxLLpS8BXk34Ar/CAiPyK8KC/6zEZQXMBzeLdXt
	QbmSgGqREVgzgT8Y2DPXT3rk5gXw3eANsY55VWFOOyklzs4uSidhKaascbHsh/252zVjWurNeN1
	FS//dSb2ZoDjaQoMFXGQOfDpCKjdMFpvBcfGM6ZI7bdjrhcdbsmAahu/UMQQOB0xctBYXC+vAWo
	puOTLwrnxV+lunRnJBnacUzPQ6qgQnKJCvlc0GeQyS8DQw8upWWnrTQnQ1V+TgWPwhQwdu+OPWL
	uGOUWnBNVt5A6nIjqjyemNa4fk=
X-Received: by 2002:a5d:4589:0:b0:44e:d7f8:3945 with SMTP id ffacd0b85a97d-460217b5692mr9164326f8f.13.1780580553964;
        Thu, 04 Jun 2026 06:42:33 -0700 (PDT)
Message-ID: <786391dd-f5c1-4a56-8632-1e5f7a15acd9@gmail.com>
Date: Thu, 4 Jun 2026 15:42:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2 1/2] x86/mcfg: sort header includes
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20260604132523.95125-1-roger.pau@citrix.com>
 <20260604132523.95125-2-roger.pau@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260604132523.95125-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1780580554-B5947FF4-CE0CD0C0/10/73395122804
X-purgate-type: spam
X-purgate-size: 289
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email];
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
X-Rspamd-Queue-Id: 21CB76406E8



On 6/4/26 3:25 PM, Roger Pau Monne wrote:
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

