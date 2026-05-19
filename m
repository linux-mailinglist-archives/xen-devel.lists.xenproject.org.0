Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBRyNnqxC2q2LAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 02:40:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC975759CF
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 02:40:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312339.1582473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP8Um-00062f-5M; Tue, 19 May 2026 00:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312339.1582473; Tue, 19 May 2026 00:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP8Um-00060u-2P; Tue, 19 May 2026 00:39:40 +0000
Received: by outflank-mailman (input) for mailman id 1312339;
 Tue, 19 May 2026 00:39:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wP8Ul-00060V-C1
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 00:39:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wP8Uk-004kWS-9J
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 02:39:38 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a0bb12d-5cb7-0a2a0a5109dd-0a2a450ae87c-8
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 02:39:38 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a0bb149-56b3-0a2a450a0019-ac6904fec070-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 02:39:38 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A57B8600CB;
 Tue, 19 May 2026 00:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14AB4C2BCB7;
 Tue, 19 May 2026 00:39:36 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779151176;
	bh=OgTVBZMDJzowQNma/1uscbb5FY7vAb8YvSLafcgHqkE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pMXVcplrrsYyMTuGrEOJOUDbcFsL7uHltYlFEKlrnec3Eaprvahp5yH2laM/3YJyp
	 3NLSakpi9drNa2z6Ouz4a0WsYCW0tAZDt9czUPs5Vmh31uWXwAoMSafxJUs4A1brL/
	 o2mqbg2snuer73tpImp32Y6DO8IRiaT2EXR8Diky48rxvdMj99KVH52C8xSmYuzvh7
	 UVHOl6xb3V1uA2waMw0S+TQvB+0b0kwdLJ/Jg0cUQHY+VoRghj884YoFLQI9SJet16
	 UwujxuF1o4DazoTwU7pXjXd/INZP18sTtywBHBIhAQ/z3SEqI5+A029sG0t9bHH4Pe
	 KKinQFiD7OSPQ==
Date: Mon, 18 May 2026 17:39:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    edgar.iglesias@amd.com, oleksii.kurochko@gmail.com
Subject: Re: [PATCH v1 1/1] xen/arm: gic-v3: Fix wake-up loop in
 gicv3_enable_redist
In-Reply-To: <20260518224652.422864-2-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2605181739130.4460@ubuntu-linux-20-04-desktop>
References: <20260518224652.422864-1-edgar.iglesias@gmail.com> <20260518224652.422864-2-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-4011c0/1779151178-7CA798B7-373C4B9A/0/0
X-purgate-type: clean
X-purgate-size: 1018
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edgar.iglesias@gmail.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:edgar.iglesias@amd.com,m:oleksii.kurochko@gmail.com,m:edgariglesias@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:email];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,kernel.org,xen.org,arm.com,amd.com,epam.com,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8EC975759CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 19 May 2026, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> timeout starts as false and is only set on the timeout break, so the
> loop always exits after one iteration and a stuck redistributor is
> silently treated as woken. Use while ( 1 ) to match the sibling
> gicv3_do_wait_for_rwp().
> 
> Fixes: bc183a0235 ("xen/arm: Add support for GIC v3")
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/gic-v3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 7f365cdbe9..f03217282e 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -828,7 +828,7 @@ static int gicv3_enable_redist(void)
>          }
>          cpu_relax();
>          udelay(1);
> -    } while ( timeout );
> +    } while ( 1 );
>  
>      if ( timeout )
>      {
> -- 
> 2.43.0
> 

