Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2sm0EMwKIGqKuwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 13:06:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF5A636D51
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 13:06:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=EKBYIZIv;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1326075.1591513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUjQ2-0006Sl-Ef; Wed, 03 Jun 2026 11:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326075.1591513; Wed, 03 Jun 2026 11:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUjQ2-0006Qd-Bh; Wed, 03 Jun 2026 11:05:54 +0000
Received: by outflank-mailman (input) for mailman id 1326075;
 Wed, 03 Jun 2026 11:05:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUjQ1-0006QX-4w
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 11:05:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUjQ0-002uaB-Gi
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:05:52 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a200a80-2eae-0a2a0a5409dd-0a2a4506dc7c-40
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 13:05:52 +0200
Received: from [209.85.218.48] (helo=mail-ej1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a200a90-7371-0a2a45060019-d155da30ed09-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 13:05:52 +0200
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-bebc80100efso435920766b.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 04:05:52 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf05177150esm138263366b.5.2026.06.03.04.05.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 04:05:51 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780484752; x=1781089552; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UMdI3bYpU2UgEjqcPpjyLwh/Ov8SPA6RgXdoSNMhAGE=;
        b=EKBYIZIvwlFryl+HnRrXnIdlmXIhzDIi7N93pVE+BfoiZFkX9Sg4wft/xrBEX53kpB
         rR0EKXH6udjygcYGOW8zL14Tb1YdiaClNTY0QO34vyt25lcUbhuT8Jr02DwjUuZN5uhn
         K3tstUu752gmX7M6TRnAgn2pXBebcvtWyXNtV0YZzQZttusd1Bj45rh1Q2D6b8wq97Zw
         PQCxabnePurxhcO0jsdYp+gFXCOdmaJQFsuZwwcNtySNACOxC0jBuZ/Ixy4SI4hjC/LZ
         B5Zt/NvhMiUDMbspJmJTtqJGCgrV2I2y9R+ROD22V5prmTkurG7BAzE3Z1g9cPx2gF0l
         YBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780484752; x=1781089552;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UMdI3bYpU2UgEjqcPpjyLwh/Ov8SPA6RgXdoSNMhAGE=;
        b=kp6VbK12HSwHqk6ssNRV0sQey+wDAuhBGNREpfhB9BW+B3gjEjSTJgZf6iMwHXlDaN
         oG+eCYf5YvqhbY58nGXkp6LKg/9dNQ580RE9bjSTLsLlZWsW1dFqXUYT8Yj5RIXSiHOS
         TmDf0R7ELoQU5j/kEvdsTNDd4dh+87z8Gr2YdYwuMlP4VqNJ52pWfLz2HQtyb72nnhnz
         8xkkvt2GAugWFkF75wg+pl3XxJDTk118HDLE0wrDejgIchJptpC9eV3EZymq+E+wMvn8
         +Unk5604hQFIC60tENXwIcA1HUDqaXrIc05Ez98sos0WyXJ5dyCAW8jzUtnAYg0aFvKw
         vLEg==
X-Forwarded-Encrypted: i=1; AFNElJ8Wn4v3dRVnbinAAPIciNH2kukxI5shW5qB4XYsGFx/0Yb08WpnOT2gVFTWeNgaH5tmBdf3jtJ4LvQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIttgLuFv9nMdehbr0CnE9v4gH7d4eX7Sa3i5D5sxaAoiCjYLT
	JigXH00dq5ZrAxv+aY5/au4P1EPkt9Ail+Ow5slKucScuBFNKQlFsIpPdgRqAA==
X-Gm-Gg: Acq92OFloF773J65S6OjwXfpFo7hxHqhpo/0yVBydLZQoIEWNzKZKND3t+6RBVH8qj6
	Rp/BJNx4uxerb+OlWvZPhKWuV8XdVrZIZGj+eyRpvlkxQdOJYx3PP9dcYWo2pa1AyVs2/1AqBwG
	o+Aoh/rUeysaYyou3KeV6jUeIc6zxnG7LyNUzHm+9CG2slTnoXxE3XOjVZCEKhH5Fyti0VKDxVi
	fDnhsTYZ4vTl+mDfOlHpKO2tSTAiX2fEWBE66qz690r+TZX6ZW7IftKtStror1IkKzcrznJaswb
	i9ItpY8u9Rrbydpjrft+OA6ZLvkwHZX2p5qRVofoMp0weZ+Aie8zTRCde02WQZBczi7BYZS6Z3o
	Z8LhMaRplM0MjqsQRB8ef2DmvDG5lzFKE9/olM6lxq0z7NDwVwM4LlIo7cB85BeaXFEp9cFZd4s
	NcNfDYmQGaWyC0pT/B2yqSC0meqbXePSqFWLUTcGElnDZzcHOzRRrU1zlvpo83nbzyetagsqRJ0
	cCTSHfoRFzP84ln
X-Received: by 2002:a17:907:2da5:b0:bef:5cbd:60aa with SMTP id a640c23a62f3a-bf0ae70abdbmr124355666b.32.1780484751697;
        Wed, 03 Jun 2026 04:05:51 -0700 (PDT)
Message-ID: <9ae22210-6dd5-43e3-918e-f68b1294448d@gmail.com>
Date: Wed, 3 Jun 2026 13:05:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/domain: fix UBSAN null pointer dereference of
 d->shared_info
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1779712171.git.oleksii.kurochko@gmail.com>
 <04dd784b6b9a4dfca9a313ea8802d8d514d65021.1779712171.git.oleksii.kurochko@gmail.com>
 <3aef7763-aea3-496a-8c18-d3659f590373@suse.com>
 <fb1b1194-5855-49d9-99fc-d35a3038833c@gmail.com>
 <3eb9ab3d-dc4d-4019-89c8-9f7dbdc528cd@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3eb9ab3d-dc4d-4019-89c8-9f7dbdc528cd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1780484752-8C47CD75-1D01AF6E/10/73395122804
X-purgate-type: spam
X-purgate-size: 2813
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 8EF5A636D51



On 6/3/26 7:54 AM, Jan Beulich wrote:
>> --- a/xen/common/event_fifo.c
>> +++ b/xen/common/event_fifo.c
>> @@ -562,9 +562,10 @@ static void setup_ports(struct domain *d, unsigned
>> int prev_evtchns)
>>
>>            evtchn = evtchn_from_port(d, port);
>>
>> -        if ( d->shared_info &&
>> -             guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
>> +#ifdef CONFIG_HAS_SHARED_INFO
>> +        if ( guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
>>                evtchn->pending = true;
>> +#endif
> While as per above shared_info() would best not exist when !HAS_SHARED_INFO
> (in which case #ifdef may be unavoidable here), an alternative where
> IS_ENABLED() could be used here may want at least considering. E.g.
> causing a link-time failure when shared_info() is used (and not compiled
> out).

We still want here to have #ifdef instead of IS_ENABLED() as 
shared_info() shouldn't exist for arch without 2L support so it will end 
with linkage error. Considering that setup_ports() will be called for 
such arch we have to avoid this part from compilation.

Alternative is that considering that I suggested in prev emails to 
introduced stubs for arch which doesn't use 2L:

+#ifndef CONFIG_HAS_SHARED_INFO
+static void cf_check evtchn_none_set_pending(
+    struct vcpu *v, struct evtchn *evtchn) {}
+static void cf_check evtchn_none_clear_pending(
+    struct domain *d, struct evtchn *evtchn) {}
+static void cf_check evtchn_none_unmask(
+    struct domain *d, struct evtchn *evtchn) {}
+static bool cf_check evtchn_none_is_pending(
+    const struct domain *d, const struct evtchn *evtchn) { return false; }
+static bool cf_check evtchn_none_is_masked(
+    const struct domain *d, const struct evtchn *evtchn) { return true; }
+static void cf_check evtchn_none_print_state(
+    struct domain *d, const struct evtchn *evtchn) {}
+
+static const struct evtchn_port_ops evtchn_port_ops_none = {
+    .set_pending   = evtchn_none_set_pending,
+    .clear_pending = evtchn_none_clear_pending,
+    .unmask        = evtchn_none_unmask,
+    .is_pending    = evtchn_none_is_pending,
+    .is_masked     = evtchn_none_is_masked,
+    .print_state   = evtchn_none_print_state,
+};
+
+static void evtchn_none_init(struct domain *d)
+{
+    d->evtchn_port_ops = &evtchn_port_ops_none;
+}
+#endif

For arch without 2L supports .is_pending() will return false we can just 
do the following instead of ifdef:

-#ifdef CONFIG_HAS_SHARED_INFO
-        if ( guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
-            evtchn->pending = true;
-#endif
+        if ( evtchn_is_pending(d, evtchn) )
+             evtchn->pending = true;

Would you be okay with this approach instead of ifdef?

~ Oleksii

