Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VXfiE89vMmrYzwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 11:58:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDD96982E0
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 11:58:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dMV+Pl5o;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1339987.1601017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZn26-00040W-Ac; Wed, 17 Jun 2026 09:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339987.1601017; Wed, 17 Jun 2026 09:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZn26-0003yR-7m; Wed, 17 Jun 2026 09:58:06 +0000
Received: by outflank-mailman (input) for mailman id 1339987;
 Wed, 17 Jun 2026 09:58:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZn24-0003yJ-Sq
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 09:58:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZn24-00D1SD-9n
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:58:04 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a326f9d-e002-0a2a0a5209dd-0a2a450bc496-24
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 11:58:04 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a326fab-212f-0a2a450b0019-d1558036c036-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 11:58:04 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-490c1915793so45876525e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 02:58:04 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923685fe90sm1222755e9.1.2026.06.17.02.58.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 02:58:02 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781690283; x=1782295083; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JvUHTF6DiDGjhs7DNDSIPta5tRFzJp586rl4ty8f5OM=;
        b=dMV+Pl5oY3+8y9GE8VLdDwCjYrlqd7Ta+B1I3xCibmfoDsI8gDacVLQxee0qB9drxD
         ce1XaUuQGuB6zWwO6nmyccLDPk2lWgN3j+ZzUZunFpv5cPpqm7dATo1JrfgQWAixKT8A
         YFQn31vpWF/rA5NFnrczXTNERtTFQ7nlAZXThCvcerh7M+UROKX/GIPjQ23usbE2iL9y
         7ONY133ppLhAkknTeew2kgdEObPgoyhPVPprz0xl3TatOywI9wId9LPm8JDLYkBRlEsW
         76vkdde2HwXEwvmfSbloKHOLQfrJMx0Hzk+RdKMdaXoIfdIKInXuLJwk5pfAb9LKmUw2
         yITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781690283; x=1782295083;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JvUHTF6DiDGjhs7DNDSIPta5tRFzJp586rl4ty8f5OM=;
        b=ZPEPW2mUknEu6kll9hqDROPd4TL+M4vU0/pleGZluw6TGbtlLMX7T0+kHbWc07OVKI
         zulv904/FgyN6SKmT0KdOyLCwOtP5u1zm/u0U7jRnT89z3qeBxf2vPa6F0KQXOsNXqgY
         n80fVn3NnOLfF8zEE6DCYRjh+SdWczSoKGx4yohYXT0U+dNsrqx4wXXqD4seaOITBlqf
         Lf1hiMBvsPLFKOqv7nnTX6Wz0JoID0fj9ZOxse1UJ2Q/JBWwZTVNxnmU5lSNYiHgA0W+
         3Q+TFZ0Jb7hdo4VlcAoApxxEp0jH48PhLq769xm8RZP20YZYGfr59iyHCEpZOcSi35mH
         6fWA==
X-Forwarded-Encrypted: i=1; AFNElJ8yq6cGkUhcze7qg+ocJDWvnsEDlXZTvNeylODDP1kvLTtdmGgT4IZ5OyuuF0EwJKWUN+PJnsxLOzY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8uXIRBEnce0cwUUA8PC2gRZ5CMrWQgKCP9OTJ3kHUvjAVCLqi
	354ZmchuPbk8ZbEzl/5ZcmliKe9Hb0oxv52GrunuTrjnC84LeCvxj9Wl
X-Gm-Gg: Acq92OFpwpAAH23xZaif8Ns6wzTOb9OQYAuoxzslgfo/FmZO4fuBhIzvzE68zqqDRqF
	wHPfOc1xX2cXIvTU1/Dt1tkJgw/sbKAzM1troNi7f9K43K9uzuodzCJzUJ4h0BFN+I0Ga9nAVOm
	VsWj6fu7nCOz05Nc9o1N6dtJ9tKv0nwX6gwZDQk0aM4l/0+SihNh0ewhvJq80W0HaPFr8II3OM0
	LQfgsdpA7XpMm3mITnPq2KjdddwM3Nh+5prF6xWlhoura73ZYU+VUdKpvNzvm/8WjDq1xeulPii
	ELTffyJhaa4/ZIKUaj+757bb3n+sG0VFJ48IUbbk4Kn2rqGjAmIhGcsPIhEo4GvXETyrYEE0k+7
	xVT+cknF6xnTrSXbiMQ2uqYKBAN7oHS4X6k3O+u6BZ0sLYyBRGqb5tzX98IlK5Fjcz5VgRjv1tu
	DVWV/9gHid0TFf8QPV70YIfW1kNvdW5/k3MMwgfEPEPPHivoc2LdwCJaE6aALcS5ocDaA=
X-Received: by 2002:a05:600d:4453:10b0:48f:e3e7:3d39 with SMTP id 5b1f17b1804b1-492341086a1mr29527175e9.11.1781690283380;
        Wed, 17 Jun 2026 02:58:03 -0700 (PDT)
Message-ID: <1514083e-6fec-4b13-9541-90fe412c40eb@gmail.com>
Date: Wed, 17 Jun 2026 11:58:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.22? 1/7] sched: introduce specialization of
 "running only" vcpu_runstate_get()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>
References: <ad1eb834-b2f2-4db2-b2fd-9d7f5bb857a9@suse.com>
 <a35b4b37-edc4-4173-b30c-6ff0fcb44df0@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a35b4b37-edc4-4173-b30c-6ff0fcb44df0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1781690284-1815DF3B-3E1953C9/10/73395122804
X-purgate-type: spam
X-purgate-size: 506
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBDD96982E0



On 6/17/26 11:26 AM, Jan Beulich wrote:
> About half the callers of vcpu_runstate_get() are solely after the
> "running" time of a vCPU. Introduce a specialization with a smaller
> read critical section and thus reduced risk of a need for retries.
> 
> Signed-off-by: Jan Beulich<jbeulich@suse.com>
> Acked-by: Roger Pau Monné<roger.pau@citrix.com>
> Reviewed-by: Juergen Gross<jgross@suse.com>
> ---

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

