Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAQ6KSUntGl7hwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 16:03:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5516E2857F3
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 16:03:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253810.1549832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w141c-0001rn-QN; Fri, 13 Mar 2026 15:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253810.1549832; Fri, 13 Mar 2026 15:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w141c-0001oi-N6; Fri, 13 Mar 2026 15:02:04 +0000
Received: by outflank-mailman (input) for mailman id 1253810;
 Fri, 13 Mar 2026 15:02:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r3Rt=BN=bounce.vates.tech=bounce-md_30504962.69b426e3.v1-ea619ec38c7b4a838135114e8deeaa63@srs-se1.protection.inumbo.net>)
 id 1w141b-0001oY-AP
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 15:02:03 +0000
Received: from mail136-12.atl41.mandrillapp.com
 (mail136-12.atl41.mandrillapp.com [198.2.136.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 942fdc53-1eed-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 16:01:57 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-12.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4fXSPb5qvpz5RCsX6
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 15:01:55 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ea619ec38c7b4a838135114e8deeaa63; Fri, 13 Mar 2026 15:01:55 +0000
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
X-Inumbo-ID: 942fdc53-1eed-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773414115; x=1773684115;
	bh=FMFqKBqdqq8KF747t14e/qHbgGEqxUwmV/FQ8SvjIiU=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=dNwvLIcxA55/UIu0EfVPQ81+xAgUD6MEErjTw8KL342W8ZB/17fME5DlU3eYniKst
	 XRRbLB3x2hB300uCOFti10vnBUM+1das7F1aY3PXxLZfUA0GeV2snPfsq9P8j8NxMr
	 4d3fR/eo37iahANVUZCyo8er7TequGGMiwzc1QCU85NYYqzaDd0TAnIbBJPk2bhe2E
	 GGgDzE0I83qwwsVjjMh6FniWiDIYE8EDaSBhRZBSHDi72tLhJd4CH789knpiqi4F5y
	 Jj1CgjUyfPsgO0jDkm99gwmIZACQHXsRX5UL8w6YcxevKOY2G1uCn2cLVvXJbvKtSm
	 IRpxLdXYkNapw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773414115; x=1773674615; i=anthony.perard@vates.tech;
	bh=FMFqKBqdqq8KF747t14e/qHbgGEqxUwmV/FQ8SvjIiU=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=gt9WhvNHFNn6QGIUr8mZcru+sDDDs4iT82Ss2GbM2IVNfi0R/whxXw4RrVBVD0H3e
	 93rvEIZhAqvxsKkrvVxL/HkLJ3FyzW8RJNUXSM9tBbLf+d2YBXQnK+gjkAYunDSZA/
	 SnnPUZGCaK7CfOpIGzCFW37p2R/f8sFDYkKgjBONNB97m9v9CLBCnJ4rLsmF1g1wqd
	 90Ha/QTA4Crsxd4UOLUswJAH1yeVVAdE38G6TXFLq5Ds7eLcygHOT3Lcmw/gh4ayDO
	 CP66c1u+amtYp/pXp+ZVjhzzPAbjQDHU5twi39WxATlw6G9NJsVfVBXF/1A8cjje1n
	 aFhZ9XjTj7aug==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2002/11]=20tools/xenstored:=20add=20central=20quota=20check=20functions?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773414115137
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Julien Grall" <julien@xen.org>
Message-Id: <abQm4h7nmKvYSSxl@l14>
References: <20260305135208.2208663-1-jgross@suse.com> <20260305135208.2208663-3-jgross@suse.com>
In-Reply-To: <20260305135208.2208663-3-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ea619ec38c7b4a838135114e8deeaa63?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260313:md
Date: Fri, 13 Mar 2026 15:01:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [4.01 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:dkim,vates.tech:email,vates.tech:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.818];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5516E2857F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 05, 2026 at 02:51:59PM +0100, Juergen Gross wrote:
> Add central functions for checking a value (either an absolute one or
> the current domain value plus an offset) against a specific quota.
> 
> This is in preparation of introducing per-domain quota.
> 
> The required changes allow to drop the "update" parameter from
> domain_nbentry_fix().

This patch changes the return value of do_watch(), from E2BIG to ENOSPC,
but that's not mention.

> diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
> index e453b3061f..1df9265ad5 100644
> --- a/tools/xenstored/domain.c
> +++ b/tools/xenstored/domain.c
> @@ -490,10 +509,9 @@ static bool domain_can_read(struct connection *conn)
>  	if (domain_is_unprivileged(conn)) {
>  		if (domain->wrl_credit < 0)
>  			return false;
> -		if (domain->acc[ACC_OUTST].val >= hard_quotas[ACC_OUTST].val)
> +		if (domain_check_quota_add(domain, ACC_OUTST, 0))

Is this change fixing a potential bug? As now we check if there's a
quota for OUTST.

>  			return false;
> -		if (domain->acc[ACC_MEM].val >= hard_quotas[ACC_MEM].val &&
> -		    hard_quotas[ACC_MEM].val)
> +		if (domain_check_quota_add(domain, ACC_MEM, 0))
>  			return false;
>  	}
>  
> diff --git a/tools/xenstored/watch.c b/tools/xenstored/watch.c
> index b66a9f1a39..36e4d33f22 100644
> --- a/tools/xenstored/watch.c
> +++ b/tools/xenstored/watch.c
> @@ -220,8 +220,8 @@ int do_watch(const void *ctx, struct connection *conn, struct buffered_data *in)
>  			return EEXIST;
>  	}
>  
> -	if (domain_watch(conn) > hard_quotas[ACC_WATCH].val)
> -		return E2BIG;
> +	if (domain_check_quota_add(conn->domain, ACC_WATCH, 1))
> +		return ENOSPC;

Change of return value here not mentionned, even if it now aligned with
the value returned in other places.

>  
>  	watch = add_watch(conn, vec[0], vec[1], relative, false);
>  	if (!watch)

Patch looks fine to me:
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


