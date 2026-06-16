Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9ml8Jl9qMWoziwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 17:23:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DFF690FA4
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 17:23:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MsfHD3tz;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1339406.1600618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZVcx-0001vg-Ic; Tue, 16 Jun 2026 15:22:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339406.1600618; Tue, 16 Jun 2026 15:22:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZVcx-0001tv-Ee; Tue, 16 Jun 2026 15:22:59 +0000
Received: by outflank-mailman (input) for mailman id 1339406;
 Tue, 16 Jun 2026 15:22:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZVcv-0001sk-9n
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 15:22:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZVcu-00BwIK-JU
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 17:22:56 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a316a44-e002-0a2a0a5209dd-0a2a450a88e8-16
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 17:22:56 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a316a50-56b3-0a2a450a0019-d1558036b08e-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 17:22:56 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-490afc47455so21434745e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 08:22:56 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49230a8ec56sm64720865e9.9.2026.06.16.08.22.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 08:22:55 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781623376; x=1782228176; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fP2r0Wv4fsZ0WsM+qhn/2NwwudmWfIa43ldoUVv1BYs=;
        b=MsfHD3tz4T8nUSKpcSPFO9y+82CprPaQyi1gc9X4W0ur7CgVQBKIsCBxHYWNwugfvu
         xdRxfUm5Y6+1PVyoDq98WHIP0khBKQGH1AHy5upz0rzMRy+V9qeeMrpkRD+C0syBZW6U
         igl/lJJWdNWRHKY/8rjjhi534HsIarj3/Ze2bexvzTJFJUjsBslAaaIVnrWns91G+RgM
         E5sLU/z4ufLoW01PqDpFQ5qTlLiRvJeR0h7Nwl+cCQ6iiRY13KhqZAHQw1fxu37W8t8P
         +GjFfq2r8bUjwmkj547/Z2XQkcaB1SfzPCV5vWXKTzehLtBUksv/s9Jl6yAWdvCJRoHG
         e4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781623376; x=1782228176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fP2r0Wv4fsZ0WsM+qhn/2NwwudmWfIa43ldoUVv1BYs=;
        b=cIvkwaYe6XyOxFRHCrMqirhqlp8VJmu6YBXaWYuQuO7F29JwviU7XrzFKxd/ZI0rAO
         Kd2XK0ZKyZyLJhWKcOJeES8v2VWAl2Qbz1TaM41CbtYKQEeeI4a25B7V8MDKTXeuwmxU
         OsRiJymg448gdkmfm106aDRMIAH470xdNzFpY09IjxBHatEChQyBVxp99uVole87iiFt
         gPRDeenHDnQqFHFAsYbbcN3/yzb6b6HMviq8hSY1v2mseNd/N7jjsu9BXWhSemKIOB+w
         dZqy5auDsX+liierj7ZQJ+8wG3EwO5eO9jEL3fZspg/XLd41OrErU+rynRduvjqEwE17
         N6nw==
X-Forwarded-Encrypted: i=1; AFNElJ8sctlO864X9QmWkZaX9bbRD0oM1ODhXvqqNmpZHbU71mcXM1bw1JoUoZ2qaSWwFy/8JsRXr7coxE0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRjvwYGTkhCu/xq9TuWSriUQSydysHwCuk5Gqs3VED1+8VATmV
	xxsCOMM2bTXF4lEsK53PERIXwahdrV05cjEo1So+WjAPJtGRRX1JBUEa
X-Gm-Gg: Acq92OE/0KZSJR3uXnhW7C2UZw7yeIklcgXzQhFInSe3X5vmcezn4vSIAsFii5RhUC7
	A2NVJ0fQSiMrBVvtNFUPjxjLIwuV1Pb1ZCUPZgfsGzsvACCAuTDnFnbQCgTbxAx7/+2yM9eLHZv
	XEaIc+FsRvO3+ZbtN+/I7kz0oMbruJQz8slYiVShPEJIHkMBj3mMfK7WdY9WtsoMxy01rSWceH9
	YYxWlL4PSDurtpoJVY8Xlm/c6D9ejVgjCuc6KY5XvEHPxJlW2e8tvo+hevdxhEZB3b9E7kALYUC
	k2pUdUN6pnyomJnWsHVzfOvqrNiJxLylS4xRIl6Yx0vhSs0D24rDXMvhUz1D2uZvwzwJLQON+Ai
	14NdnY8r0xSWL2oNnTXjF8SKsjVVEtdWG6X48k9onGKLPvHuwi5P7W2qHc6Bx6TaISUSLt0e76b
	DJURgZ83ShuBj99kdYGJgmLJrBBWhJTXdeMt2Skknftdsee2fcTX4JESNKXGpr/XucYIOxYC/Z1
	Jvp5Q==
X-Received: by 2002:a05:600c:3151:b0:490:d354:bd00 with SMTP id 5b1f17b1804b1-4922ffb823bmr64434685e9.25.1781623375589;
        Tue, 16 Jun 2026 08:22:55 -0700 (PDT)
Message-ID: <d88ee844-e75e-42b0-8de1-1576b2753fb4@gmail.com>
Date: Tue, 16 Jun 2026 17:22:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22? 6/9] domctl: handle XEN_DOMCTL_getvcpuinfo
 without acquiring domctl lock
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
 <0e38793c-e201-4cbe-8cee-6cd26996173a@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0e38793c-e201-4cbe-8cee-6cd26996173a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1781623376-7F1948B7-923DBA22/10/73395122804
X-purgate-type: spam
X-purgate-size: 429
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33DFF690FA4



On 6/15/26 4:15 PM, Jan Beulich wrote:
> Like for XEN_DOMCTL_getdomaininfo there's no need to hold the domctl
> lock for XEN_DOMCTL_getvcpuinfo. While moving the code also switch to
> using domain_vcpu().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Tentatively-acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

