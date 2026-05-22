Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBvJL4P9D2qCSAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 08:53:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E9E5AFB54
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 08:53:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316352.1585744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQJlG-0008G1-7W; Fri, 22 May 2026 06:53:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316352.1585744; Fri, 22 May 2026 06:53:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQJlG-0008Df-4r; Fri, 22 May 2026 06:53:34 +0000
Received: by outflank-mailman (input) for mailman id 1316352;
 Fri, 22 May 2026 06:53:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wQJlE-0008DZ-TF
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 06:53:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQJlD-005EgM-QR
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 08:53:31 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0ffd60-5cb7-0a2a0a5109dd-0a2a4503df2e-46
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 08:53:31 +0200
Received: from [209.85.208.182] (helo=mail-lj1-f182.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0ffd6b-672d-0a2a45030019-d155d0b6b0be-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 08:53:31 +0200
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-39397d63804so18272501fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 23:53:31 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1779432811; cv=none;
        d=google.com; s=arc-20240605;
        b=LB0MVA+OSVwE4y6u6dNSmBy3ZXnwraTjHLVgLnuLVi45qfSx7fU3GjMxG3tEB2HrXE
         KbRlmDF18CNdoBH/uWfKZWRfmq5UaKtqo1eO4zbXMmdn/2OvrqyCSu/9ywGorzfkPz9t
         Lp5Qd+aEXWJAeeiq/yckStbL3tEL9zzoLchQTaFrbGiNWxgzmltFvEgVS4a1e2f+k7Ze
         bCzpYgaprS4drcr16O32ryJVGQMVRlUnroHC/8M95DKnclNJodOjCJte7HD2P9mjVTNv
         ycuj3q8j5/v6tg4LkJsZd+q9mvMcQjfdJ/9k+7APD2cmzFr9kaaEd0AROBeS65lEOlEq
         E4Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IqHZTnhvDlodEAfN9SoUDUUzUXKdGnA4Ep6wRKSYkRI=;
        fh=074dSOZR2TjZuH9KX7pMcX1QOxphcb/LlKcediamujk=;
        b=JmdjFGE1vRO5FcTbcVDIL9//RrnVNLgVmko37jz5jPDkGBQFlg8RbB8fFfAalMBGuM
         /YvlZsfMaGsGOek87NZ6prbe4ENMarhoAv+GB5homEXwRgh5hujVQ9/RlZVnWK24SWrT
         BhEWRZv4GqhC35eXeq4pLtnU8jC7dFW3SNX+p7jEXA2RYEarakXrbzPzE4sQW7Lvy7OZ
         292IuwRIE5hi/1B5gxLT1aeLXH6E1jL0tCRqvulMU2trUw9A52bIe7+m84UwUBnK80iB
         j3+1VgCFpvgo+RdLoQ+66kVKt3iHfnf9WdYdxmraIGfveIeuwBe4NOdvkZSkD4yqNyyQ
         iiLA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779432811; x=1780037611; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqHZTnhvDlodEAfN9SoUDUUzUXKdGnA4Ep6wRKSYkRI=;
        b=nXZ3HmhLzYgzILQCVUBguDiSSA7wAqVnhnw+TJM1ijuJu2Oj0OCbD5uf1gvaJDCAFt
         m/phX0/dtlY87VkBUSVsKR9kvmNjznCai1kx4qSQ/Y7xWWdV18gj6BZd0Cx8ujDQKXzm
         IFiSb9S83VUK3jVhxIdz7dbMEJWk/qRRURcjXZnChJ2lqvDxcnZ+4VmU0PXlSgboA7kZ
         znMPu/8oK4MPCE/jJCkOzt1yki/RMZQYfp1lOZNTQhGo9yEnwqhH8mDOkCkPcy/rUWXu
         bHaz2v+kBI4+qJv7B482TLgltkAeUagbmPpCy65iD8qv1505aSanFqTdMbWLt/pAcTE8
         zP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779432811; x=1780037611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IqHZTnhvDlodEAfN9SoUDUUzUXKdGnA4Ep6wRKSYkRI=;
        b=jKtPG/FTmJII0G6sh2CkvjZgDjZNjieeFzK3UgrYiRRKySAbilOGCw+7xtk2HAHxxl
         uCcvxRzjn39Dkw7H73qCNeOLjUTUInG7AtvTeipv6oK5Qxf8jAgbcsV43I4Yrf2K1i9U
         6XeMzjxbtgMPfnQ/ly03npJYvhXVZGhKFqZn/DjDe7dCfvZZqINONr013efWH2PJmnK1
         6Jo3eQ0A/9r1Pc6hJwfeaAEme+ujoW2r9OUjVUmWs8Ul2MklzxhDg16C12iYOxF7bsqM
         IWVM2Ni2AxsXGWGB0KCgIlyExS4QGpcHtSCxhbVMm7ctMzNSq95UOK7fg5TPeFlWXWwe
         s85w==
X-Gm-Message-State: AOJu0Yzbl45Fd/Z2EUibTjB5kT8RGb65XJio7NF1IAqxKuD0Egzlecbo
	rKYPRpZmrHOGCxz0Bf3gwrBWNjyypIhYELgvdJN1V8woEi6MMAgWwt5uBQ3zRn3SafdGyn1WEDI
	er4xFzm1/QAEOvCsbV2PNLODRBMd2hwQ=
X-Gm-Gg: Acq92OEdFdMYc4W+rlpbS3aw9NPZ4Simkza9Q1FDB1A5TQ7S8NA4ZH8seD6DVckzRcF
	zTgHatfhtgOTdmZCrGafkLa4QSSzROQvxDvVOjAyOUHZC1gthZkfJRSJNHqnqyLUsMYaitR5P3Y
	sOlmzyNNP8o+qDyBC+wYa8IYYRuAZuSyNxGbl4sN0W3y8dpQsKbr4yzv5xcq9RUbBxWszno824r
	gs8G+tWXWFZWM35kovqexVGCeHtxjU6aPa0hwMUPjEpk0lHByKbxapDASKmmPwW5GMGaX7lwUrJ
	5Iyms331DtKcDJg=
X-Received: by 2002:a05:651c:882:b0:38e:9eb1:693b with SMTP id
 38308e7fff4ca-395d8c1238emr7088961fa.3.1779432810870; Thu, 21 May 2026
 23:53:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260521232529.694570-1-dmukhin@ford.com> <20260521232529.694570-2-dmukhin@ford.com>
In-Reply-To: <20260521232529.694570-2-dmukhin@ford.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 22 May 2026 09:53:18 +0300
X-Gm-Features: AVHnY4I9LC7-6HdtsaD27ry0_Px0zmYX37FycGeibaJAN-3eWl0LtxwvONqv5t0
Message-ID: <CAGeoDV9L5+N7nnhY1A4on0L1+aAfb8JxbBLwoV+XxMwnoTS8xQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] argo: lower level of noisy connection-refused log
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
	christopher.w.clark@gmail.com, dpsmith@apertussolutions.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1779432811-40A6A938-3C811EFA/0/0
X-purgate-type: clean
X-purgate-size: 1291
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,suse.com,xen.org,amd.com,kernel.org,gmail.com,apertussolutions.com];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,mail.gmail.com:mid];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:dpsmith@apertussolutions.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 19E9E5AFB54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Denis,

Thank you for the contribution.

On Fri, May 22, 2026 at 2:57=E2=80=AFAM <dmukhin@ford.com> wrote:
>
> From: Denis Mukhin <dmukhin@ford.com>
>
> Lower the log level of the "connection refused" log line, as it can
> spam the logs when a dom0 service using the Argo hypercall tries to
> communicate with a domain that is still starting up.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/common/argo.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/xen/common/argo.c b/xen/common/argo.c
> index 28626e00a8cb..4f894470698e 100644
> --- a/xen/common/argo.c
> +++ b/xen/common/argo.c
> @@ -2034,10 +2034,9 @@ sendv(struct domain *src_d, xen_argo_addr_t *src_a=
ddr,
>                                          src_id.domain_id);
>      if ( !ring_info )
>      {
> -        gprintk(XENLOG_ERR,
> -                "argo: vm%u connection refused, src (vm%u:%x) dst (vm%u:=
%x)\n",
> -                current->domain->domain_id, src_id.domain_id, src_id.apo=
rt,
> -                dst_addr->domain_id, dst_addr->aport);
> +        argo_dprintk("argo: vm%u connection refused, src (vm%u:%x) dst (=
vm%u:%x)\n",

AFAIU, argo_dprintk() already adds the "argo: " prefix internally.

Best regards,
Mykola

