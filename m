Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id edpzHMb3MGqOZgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 09:14:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEA968CBF9
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 09:14:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bQSdJvrN;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1338709.1599751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZNzj-0000Gm-5p; Tue, 16 Jun 2026 07:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338709.1599751; Tue, 16 Jun 2026 07:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZNzj-0000FC-32; Tue, 16 Jun 2026 07:13:59 +0000
Received: by outflank-mailman (input) for mailman id 1338709;
 Tue, 16 Jun 2026 07:13:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZNzh-0000Dk-8o
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 07:13:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZNzg-008Udk-0d
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 09:13:56 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a30f7ac-5cb7-0a2a0a5109dd-0a2a4506b370-26
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 09:13:55 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a30f7b3-7371-0a2a45060019-d155dd2acd2c-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 09:13:55 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-45eee266c6cso3720334f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 00:13:55 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa3abd0sm60697795e9.1.2026.06.16.00.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 00:13:54 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781594035; x=1782198835; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gWaOqXusk5UH7sy1tR/gB25isu2gr52oSgtgNWgDo/A=;
        b=bQSdJvrNrKISQcHHGz9Q6EwDThxOEpVYPMbu9Gx2OZ04pKmtP5tnxG9rY7yKbOAfzl
         V2fGt9TLAPKn5jxPdmak+aUKQCRKFVv7L374xATa5zTFh2Cf6keeCNsmlpi0zklCPxqw
         yBiJa9VttXhs6iBjocklozSO82vYBozgKs0vJ052ELJ5wtKqdhXEFQN4GjAzVnAGtgin
         bDu+p4ywDBS8DzJU0oqdBxYwDzwIFKE0hYVgVqBlM4RqzvzXtJktc9U1l4eFyygI1I+0
         4EXz9choMsWKGADOEzOOvWeQPIgJq7kpjB7v6vodkwc2BGHx3lbmY22uMlFCkrnf1/ng
         LgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781594035; x=1782198835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWaOqXusk5UH7sy1tR/gB25isu2gr52oSgtgNWgDo/A=;
        b=hdPU+GwP5sxKfEwlNw3lfgTs7+NhFiZ7jj8B8e7aClIbg0GjFbEeAOb5DhBtZqcDsi
         QyOmpKQrIfWyjaG2DHWxrbFE3e3WzfULXkOrO0D/4dOg5BC8SMxVXORAMG5AZKD6Ed5w
         HQfyYHDb3/1mTV5EOaSfFEngHWf5w/2oTBzt6k8RcuMtELOs2hktV0MA0f9tKkKHSWKs
         5xqGyBom9fZSf6mYLGgeLActmBR/TvXARRCJXxARIARAYEd8OvajOfB/xbssUSA/XVqT
         x+udy6cddaWc3zS6kp7XVos6e3V+rocBj8GvRovFSx/JoHGGcJfjP2J7FlbJZxOaeSe+
         NHsw==
X-Forwarded-Encrypted: i=1; AFNElJ+Iq1b23McjMTl1Z59AlYYtFXKNpFo1EVYtEnw41M0qD/iBPKHsUIH+BS7zyyM6H3T+l7ASzD5yRbw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzA+fC0qPjtTNFTe48CW3VlnkTIMMqjYRqW0z7c348fT5cm0M3o
	kXcfJGeA4atXHeTHgOYFrfOYcaojgKEyH4lQD/My5LItuBqtF5m18Dve
X-Gm-Gg: Acq92OH0nWGrIhV55WVTSfXE+NVHcp2YAeBxInfDA2q5HNTEmAXIo3iKfqlYw6tHfuQ
	EsY1ZMzu1g2U/5x4188jEvjmf83yHyKXUMwG7kFlNu4H/NbvMH87q8qJ7Fu6685VVs5fy6i4axL
	+cxpEmOmCEQ6+mDV0ImTnoOtW1+47rdzph8YvM2W0A5kgp1CLZId3q7utBYKzkNdt6mHX/J1v2K
	u86kQ4lKhFdTugBkcX4lqbYIH1IlPK1a2eLqDek+keY+yWfnGkcDW9orzJxRN09NX1BtcySrTAy
	xn8Akz/OwuuI5ArJAm1UtEgCigI9cxx8Uwt/qFUd99ISPFElqlj6ec/rh0JgmFbXBqXKBHc8yCO
	bmaha3b6WCZ6Gigc84A3xVPuzPoeHdqxIBre4PKSMgVQsQcwujCA9gsIQ8b0ixbgNnf6TQ1aw2F
	tpjfsLu90rxbyX5AJJmq+NYA/gvqizcLul9gjN6wAmwxYo+PF3cqACOenTCBF2QKVdtpXqIDtQ4
	+nVXj7dliRqrgh8
X-Received: by 2002:a05:600c:34c9:b0:492:1e50:978d with SMTP id 5b1f17b1804b1-492200838bemr192849145e9.16.1781594035260;
        Tue, 16 Jun 2026 00:13:55 -0700 (PDT)
Message-ID: <0bba1000-531a-45b0-a442-59fbf4a288b3@gmail.com>
Date: Tue, 16 Jun 2026 09:13:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] gnttab: drop dead local variable from
 gnttab_map_frame_begin()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <d0702419-2cec-45fe-86b4-470cf4d55b5e@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d0702419-2cec-45fe-86b4-470cf4d55b5e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1781594035-84158D75-3E976DC4/10/73395122804
X-purgate-type: spam
X-purgate-size: 542
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,amd.com:email,suse.com:email];
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
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1AEA968CBF9



On 6/16/26 9:02 AM, Jan Beulich wrote:
> As Michal had indicated in review, status is now a variable that is set
> but never read. I made the resulting change locally, but then committed a
> stale version of the patch (also omitting Michal's R-b).
> 
> Amends: eff88c4d3543 ("gnttab: simplify (really: drop) gnttab_set_frame_gfn()")
> Reported-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


