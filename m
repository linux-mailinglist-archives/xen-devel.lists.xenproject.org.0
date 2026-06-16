Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vZGmK/xrMWq5iwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 17:30:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 572A869114E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 17:30:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WmxykpQI;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1339421.1600636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZVjC-0003id-BM; Tue, 16 Jun 2026 15:29:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339421.1600636; Tue, 16 Jun 2026 15:29:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZVjC-0003gH-8a; Tue, 16 Jun 2026 15:29:26 +0000
Received: by outflank-mailman (input) for mailman id 1339421;
 Tue, 16 Jun 2026 15:29:25 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZVjB-0003gB-EO
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 15:29:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZVjA-00HP6p-Nu
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 17:29:24 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a316bc6-5cb7-0a2a0a5109dd-0a2a4508e296-26
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 17:29:24 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a316bd4-63b5-0a2a45080019-d155dd29e4ee-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 17:29:24 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-460662fcb4eso3231957f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 08:29:24 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa891acsm87743295e9.9.2026.06.16.08.29.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 08:29:23 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781623764; x=1782228564; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1cyOe5vjbvnWqCqRa9uPuvsD4BCMI6xh6YXkyBuJYKw=;
        b=WmxykpQIPbtQWZ6PItFoJCCtkIu3uH5RiIvske5aA3RlkwCuO9rR1Nn5ZXq0sGdmc3
         oPBtPuPZOKhNBVztGU8oY6QCzQHRu11CLzjT2wnkF0Rirx/e5dkOkl+R9Y9xWPD88OpY
         aR+mSEsqVhGLFh84eO9sV2cYL7Sv7pJJWXHA9/c+yQdKjnzeDcVgkaFT1f+W9zOj0QvU
         OVhRc8J6uVdbD9UwThPESmoFxFqCo7n0wJG/O5aIH4Y/YEFQQdXKvuiJ8as7nx5wxJya
         rmloKskkRgm8JosPhSiQkOn+aJ4QkWAWYBIFcVuP6tE0WnxhwLFIsj1tbCPTW4YVPK31
         BcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781623764; x=1782228564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cyOe5vjbvnWqCqRa9uPuvsD4BCMI6xh6YXkyBuJYKw=;
        b=pgDe9xeD8OOh0HmKIax0TBhpCw8kqDNQ05k5FI1AUglei1VZL2TlMO59Ix2bQGjJCg
         C5WOFTRu0lrt+bxyH8jLw4lAgeQRAldXV+9KEpRg9PlUrR34ybvvhcSVZ3LAmKyX24yu
         21hikl3Ff0He9nIitOokc94S3cw2Rf1q+BsEb9Rnwi+k/JNvZHHgo+LtFskVrDgYt+9l
         8IaP8NAPsuR8FbilsyMwphK/O6x7o4UVB1W6NeGd9hTk3PDVjXWj/7YgxyOpE2cgS+yG
         E+UtGLLOiTO4FxqpfzazF3iJgxITP+2xn2XQ94WrQm99o5lUlsIDs/PwN+u18SgGZ/oS
         BMrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/oa38Vx+frkRs4z2O0+Vm1f+VnaytNYR2VAwEhMFQ+OlhqnokiAQdk+DFWyvurukzrCTQoTPpw6t4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUiqJX0savvY0ojR4nt2AIVkdv8lisJfuv7nnvZPRXaEE8YoXd
	xEfDue7UGTuOUeF53o+xydXPnHH31AoPENUAy/+Jr03le0ToLdUAlhCM0ZiHIA==
X-Gm-Gg: Acq92OHfKJ3JXR/+Ue7a6KO/yAeB6zcibboHBjwc0lCkGw8Uu3DrNyNigpWMHgv7zDn
	jDrueVHxW11SrX5u6PIrbpKr7pN2jMwB2ybkhhAEcLx3Jfo7HD0RMIqYVALsOQpf6ZISmKX2Dry
	LxTWNFvyBGZLJtl78krSRt3+iVaqiaONsTuBgFi8UR9qLTFPpSusIzQMp5KsJ44/AtorguQnRhk
	Usy6XMMX/dhFaGVEtGczvRh6/fdeRmO90x0a2bkovDgmljYasylE1q18EeI2kvWV6xq8Tt4d5JA
	yavu7SrSi8wCmHKYozRv/JbXjxw4tMOtlU1oGTIeq+uYIlI8qGFI7Z8eJO5H6YpNFskCpEiGcvW
	8WC7LudgobeGlCS/X0i1XMLvI97LZf21UtN/4QXRth2v6UbJ90zfEQ1uh9gddNxlbLCB4hyvKS8
	Rp5XNSBqTw25BY6E/TKOxaxg33Zj80K3ZgkaOo0vGbntWpYtyrBw6stFa7fjEqF0LUHzCfip8wL
	yY8O0hIE/1utZhY
X-Received: by 2002:a05:600d:8496:10b0:492:3214:cbe6 with SMTP id 5b1f17b1804b1-4923214cd1emr25860075e9.23.1781623764024;
        Tue, 16 Jun 2026 08:29:24 -0700 (PDT)
Message-ID: <94d7fe88-02ac-4918-b125-d85d9481b932@gmail.com>
Date: Tue, 16 Jun 2026 17:29:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22? 9/9] x86/HVM: more checking for
 XEN_DOMCTL_ioport_mapping
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
 <b0a50973-7a84-4e69-8241-d761e9b887dc@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b0a50973-7a84-4e69-8241-d761e9b887dc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1781623764-B5F6ADB1-B37BCC57/10/73395122804
X-purgate-type: spam
X-purgate-size: 573
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 572A869114E



On 6/15/26 4:16 PM, Jan Beulich wrote:
> When adding ranges, only alter existing ones when there is an exact match.
> Don't accept ranges overlapping existing ones.
> 
> When removing ranges, only remove a range if there's an exact match.
> Return an error when the range isn't found, and also don't call
> ioports_deny_access() in that case.
> 
> Fixes: 192c4dabc344 ("domctl and p2m changes for PCI passthru")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

