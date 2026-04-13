Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ML9FKhEJ3WkZZAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 17:17:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A573EDD0D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 17:17:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281243.1564252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCIjD-00037j-OI; Mon, 13 Apr 2026 14:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281243.1564252; Mon, 13 Apr 2026 14:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCIjD-00033R-Ky; Mon, 13 Apr 2026 14:57:31 +0000
Received: by outflank-mailman (input) for mailman id 1281243;
 Mon, 13 Apr 2026 14:57:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69dd0457.v1-28f3e43204da469e876df1a9d9bd776a@bounce.vates.tech>)
 id 1wCIjB-00033L-Ik
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 14:57:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCIjA-00H66A-TP
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 16:57:28 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69dd0457.v1-28f3e43204da469e876df1a9d9bd776a@bounce.vates.tech>)
 id 69dd0442-bab6-0a2a0a5309dd-0a2a4504eae2-36
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 16:57:28 +0200
Received: from [198.2.187.14] (helo=mail187-14.suw11.mandrillapp.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69dd0457.v1-28f3e43204da469e876df1a9d9bd776a@bounce.vates.tech>)
 id 69dd0457-bb33-0a2a45040019-c602bb0e0455-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 16:57:28 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-14.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fvVr716W2z8XRvwr
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 14:57:27 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 28f3e43204da469e876df1a9d9bd776a; Mon, 13 Apr 2026 14:57:27 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="anthony.perard@vates.tech" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1776092247; x=1776362247;
	bh=Ac2SMe+TO7wLj+00Cc1kM0953s+GmmDu/NitHI4i6w4=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:Feedback-ID:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=LYz6gAtpwooT2PCfBXeR9tP+AMS+/WIdZ9RP0WEQoY+POVNg+ShfhVwKHtyryDjjp
	 4zggltitjAP/hKag8KtzULPUDWTkepc6r+OSZNIIDxXMVLOdfwZnPv/No/r58Pshna
	 kGYMRU/5vwSyugqUJKaXo6++b01KJoD7nAe/vwYYCtqETFLYTMQfBWfqKAApKvay9x
	 GYD6J2PBBX+x3iXAJYcmKHVxogXwvdGYW15a2+WWceaUsk5g8foD/jZ7TZOM+g/a8r
	 VjZOo2hW4n+Kan9J28TQxj+xZK6j9yMKlgprRMSKRVAS5E9QyEjzBT7GHW5yS3/BGE
	 daZB6Q6zR4s2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776092247; x=1776352747; i=anthony.perard@vates.tech;
	bh=Ac2SMe+TO7wLj+00Cc1kM0953s+GmmDu/NitHI4i6w4=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:Feedback-ID:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=dx3L7YiDGuM+ep9omsd8lTJHPyNy2aWDPX23M6txrx7GGLh/X4l9myzkLoEnA15w7
	 9jk+23dvjUqu+RIgURfMU20SJRngQ5eiOkAFxx3jE0dkAPZM17GkFcz0Dp0QNw2Vq5
	 /WGFrV2AwhwMGu+nGyY9laYg9G1n6FwFHe1H1kzLQmjK4c2A2c8usEhRbOLCpl6e0M
	 e8zhzsLMG4zTkecD6Ff7Brkk1zivTDynDT0lGKKH7cwyihq0MhBZgb3y34hJMlT6aB
	 97dDKZTyIxUZOGCrjZ7aDe3m0E5xmuh+p+969+Z5iRGc7M/AaMDwheUUmJdL7BrSJ9
	 VRMAokc8b5uag==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20test-artifacts=20v3=2001/13]=20Add=20Alpine=203.22=20containers?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776092245824
To: "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <ad0EVSlkYcxQF5ce@l14>
In-Reply-To: <89e8adefe509165c419b0be7a1fdcd19289c2be7.1774999132.git-series.marmarek@invisiblethingslab.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.28f3e43204da469e876df1a9d9bd776a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260413:md
Date: Mon, 13 Apr 2026 14:57:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1776092248-B072A51B-5980200C/0/0
X-purgate-type: clean
X-purgate-size: 1665
X-Spamd-Result: default: False [4.01 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:url,mandrillapp.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.695];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 50A573EDD0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I'm commenting on changes I found in the branch used by the pipeline
linked in the cover leter, since there's no copy on the mailing list of
the patch :-( (overzealous spam filter).

> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index c698612d5acd..17d25ce0f921 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -40,6 +40,13 @@ alpine-3.18-arm64-rootfs:
>    variables:
>      CONTAINER: alpine:3.18-arm64-base
> 
> +alpine-3.22-arm64-rootfs:
> +  extends: .arm64-artifacts
> +  script:
> +    - ./scripts/alpine-rootfs.sh
> +  variables:
> +    CONTAINER: alpine:3.18-arm64-base
> +

Shouldn't this use the 3.22 converner version?


> diff --git a/containerize b/containerize
> index 38a434ab7075..b3722b465e01 100755
> --- a/containerize
> +++ b/containerize
> @@ -28,6 +28,10 @@ case "_${CONTAINER}" in
>      _alpine-3.18-arm64-build) CONTAINER="${BASE}/alpine:3.18-arm64-build" ;;
>      _alpine-3.18-x86_64-base) CONTAINER="${BASE}/alpine:3.18-x86_64-base" ;;
>      _alpine-3.18-x86_64-build|_) CONTAINER="${BASE}/alpine:3.18-x86_64-build" ;;
> +    _alpine-3.22-arm64-base) CONTAINER="${BASE}/alpine:3.22-arm64-base" ;;
> +    _alpine-3.22-arm64-build) CONTAINER="${BASE}/alpine:3.22-arm64-build" ;;
> +    _alpine-3.22-x86_64-base) CONTAINER="${BASE}/alpine:3.22-x86_64-base" ;;
> +    _alpine-3.22-x86_64-build|_) CONTAINER="${BASE}/alpine:3.22-x86_64-build" ;;

If you intend to make the x86 3.22 build container the new default, you
are going to need to change the 3.18 x86 build container line above.

Thanks,


--
 | Vates

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


