Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5q9pOy8IPWqGwAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 12:51:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 461306C4DAB
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 12:51:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ThWc3B0M;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1345447.1604308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wchf1-0002wZ-Ij; Thu, 25 Jun 2026 10:50:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345447.1604308; Thu, 25 Jun 2026 10:50:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wchf1-0002uN-FU; Thu, 25 Jun 2026 10:50:19 +0000
Received: by outflank-mailman (input) for mailman id 1345447;
 Thu, 25 Jun 2026 10:50:18 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wchf0-0002tC-DS
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 10:50:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wchey-0051Ut-KU
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 12:50:16 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3d07e7-2eae-0a2a0a5409dd-0a2a45078f0c-10
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 12:50:16 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3d07e8-9c8e-0a2a45070019-d1558030b033-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 12:50:16 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-49249707788so11008945e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 03:50:16 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492660adaecsm56246185e9.5.2026.06.25.03.50.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 03:50:15 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782384616; x=1782989416; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/VbRxrhkkvQ69KcDgyWBeAh/AWDqsTD3yHTB1dbJ6Ro=;
        b=ThWc3B0MHSBnxyD5Q9lEjjWLE+mtYFSahqcvlwAybVensARtf0H8Ifo6e+qWENL9r0
         PjtR5rIarzvSZ46+PN7nOp9JUL5XioZa5kBcnXwP7lfWm4RRP0gZ8IgYS03aFcerPDgU
         lyJOI5lqTg5CLaBPOyud8tOsOlXOSDYAbglVdzJfnUQmkA/Hj5u3xw4FuC7eT9DTjPaD
         RFyWpqf8fB6+Jt4n2FFf+T0m6PfTsexSTkGthmDNkhIvymASUfuHxuy8g32536RFR0T/
         E95CXqEoDLSPwliV36olf8N9Zycgjy05QRTfGDEiL3Q/gxRDozumqV+uAZqUCJPtZSbZ
         aEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384616; x=1782989416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/VbRxrhkkvQ69KcDgyWBeAh/AWDqsTD3yHTB1dbJ6Ro=;
        b=dx3gJBkXcUH3i//FlG7WehzuxRmo9hF9qZNhkrMRjp4B42UpME/9eojtFY9ryR+qdJ
         algOoN1mrQ7y8+f+fUPmvFFkMoriYnTyQcwer5hrnRHukvkRQ4pHChrXLI+QEUfXtDnP
         vp/pN5LWqGSwBvUDNXQNoRxmeY2JR6Nz2gY/J0mzyoFUPVMDCj/4l5Xof6cG/9QNvazP
         5tCoLi8jvxueJG66Sqgil3tX1zdoSYIB9NC7g8ZgBtaJy9iWa4TjcizZwCXJkc2zTuTq
         Wr4No6fVJx5DoQ4+BUBtM2fNNswWHJgY1WUs51bqcoHLq/bO43kxkVY/UnFq6aqW4GqC
         u7Ug==
X-Forwarded-Encrypted: i=1; AHgh+RpJ/lS8eJcKIqL46RKcARX+YbB+1U9bVKq/NeMLceeA4xaodIPNZso7zG05wlX4bSyzrqnpmG6ZDYM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHNpCov1AXrpd8g32M3cfumHY1fLtfHeam2p9Vk+Ti6/tHhSyW
	6Jfegdyy7Dy2fNpjbbj/PoFMPqeTNtbzHCzpxN1qjp1NBQ2d3JxRpqHR
X-Gm-Gg: AfdE7cnO/pSefsZUjvlQd5+h1/x9OEe9wvsiK7AYsgdXbpAKZNWst9Cd14SQgGjHU9F
	zSFVNavOmtz2u/bzqqK3qtCYDcphqSZBYwinKh6BBKkXv4Pkdk2EIlBieayQsET0SBwMh+cOztT
	tnUvkGswGTqO0FRg/xmPWF5SIt9H8RkbBcQGINHs3ebYWxJTI9HuCGGTBbQ9lCF6Tno3rrR1kk/
	Ejij/JJ3xwlHjAfpJT1tBjHQum4tyAx6vdfJe4o0pwOSc9e/xFxRa7vss3v2FZ3CpFEGrjTEG4i
	iOPgf/Ex5+harfEoN1UJZdFE+MktyLy2c1SmtgLlxScnbcHPizssz1Ryx9o4LHdJcLkXsYxBGKy
	EVry4/qpQxFr2HRb4RikMjoZLjCWb6+1M4engDtbkuXCpjLnwGluBaO7iVfGqFIsydPLWBd5vMl
	9vBWKbS/YEubcaOd1jlg0nqtChJkz7njNo+ZUz+lMJVlH+Ltr2hVoAx/RlBugWacJaWhQ=
X-Received: by 2002:a05:600c:c4aa:b0:490:b189:212d with SMTP id 5b1f17b1804b1-492668a83dbmr24226115e9.33.1782384615899;
        Thu, 25 Jun 2026 03:50:15 -0700 (PDT)
Message-ID: <910ed097-10d8-41a2-9035-a3f10d60c214@gmail.com>
Date: Thu, 25 Jun 2026 12:50:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen: introduce CONFIG_HAS_SHARED_INFO for archs
 without a shared page
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1780494838.git.oleksii.kurochko@gmail.com>
 <7ed7b888e203b7cc6c3a3a82b3bcc89d90b3fb48.1780494838.git.oleksii.kurochko@gmail.com>
 <d63a3877-286a-43fe-97fa-301985c3a0ac@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d63a3877-286a-43fe-97fa-301985c3a0ac@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1782384616-7D72125E-721C110A/10/73395122804
X-purgate-type: spam
X-purgate-size: 1565
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 461306C4DAB



On 6/17/26 3:26 PM, Jan Beulich wrote:
>> +#define shared_info(d, field) \
>> +    (*(typeof(__shared_info(d, (d)->shared_info, field)) *)shared_info_absent())
> How about the simpler
> 
> extern struct shared_info *shared_info_absent;
> #define shared_info(d, field) (shared_info_absent->field)
> 
> ?

This could lead to compilation error:

common/domain.c: In function 'vcpu_info_reset':
common/domain.c:316:20: error: unused variable 'd' [-Werror=unused-variable]
   316 |     struct domain *d = v->domain;
       |                    ^
cc1: all warnings being treated as errors

One of fixes could be just drop usage of local variable d in 
vcpu_info_reset():

diff --git a/xen/common/domain.c b/xen/common/domain.c
index fba8e9161937..d3b0bd571609 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -313,11 +313,9 @@ static void vcpu_check_shutdown(struct vcpu *v)

  void vcpu_info_reset(struct vcpu *v)
  {
-    struct domain *d = v->domain;
-
      v->vcpu_info_area.map =
          IS_ENABLED(CONFIG_HAS_SHARED_INFO) && v->vcpu_id < 
XEN_LEGACY_MAX_VCPUS
-        ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
+        ? (vcpu_info_t *)&shared_info(v->domain, vcpu_info[v->vcpu_id])
          : &dummy_vcpu_info;
  }


OR shared_info() defintion should be updated to:

#define shared_info(d, field) (*((void)(d), &shared_info_absent->field))

IMO, an update of macros defintion looks a little bit more common.

Which one do you prefer? Any better suggestion?

Thanks.

~ oleksii

