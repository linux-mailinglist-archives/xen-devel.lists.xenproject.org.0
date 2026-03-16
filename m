Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJ7WDeYcuGlYZAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 16:08:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6B329C04D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 16:08:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1255626.1550528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w29YA-0006PT-8A; Mon, 16 Mar 2026 15:08:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255626.1550528; Mon, 16 Mar 2026 15:08:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w29YA-0006Mz-5C; Mon, 16 Mar 2026 15:08:10 +0000
Received: by outflank-mailman (input) for mailman id 1255626;
 Mon, 16 Mar 2026 15:08:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lC2O=BQ=bounce.vates.tech=bounce-md_30504962.69b81cd5.v1-6a3f9db5333c4ded9245fee67960302f@srs-se1.protection.inumbo.net>)
 id 1w29Y9-0006Mr-7f
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2026 15:08:09 +0000
Received: from mail136-12.atl41.mandrillapp.com
 (mail136-12.atl41.mandrillapp.com [198.2.136.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef907441-2149-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Mar 2026 16:08:06 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-12.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4fZJPK44YYz5QkLR2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Mar 2026 15:08:05 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 6a3f9db5333c4ded9245fee67960302f; Mon, 16 Mar 2026 15:08:05 +0000
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
X-Inumbo-ID: ef907441-2149-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773673685; x=1773943685;
	bh=Fz3JBKPQMyeowZWRMqZh8FyijgWgZh/CEClLY+5GdN0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=L/Et4zMvJMuMI0aqYJu0LKSplnE/VOALGYoUh9KnUKNIIf9M6IPcuv1fPn7QqWgrt
	 Rwp6zfs4/6OxDx1kTy2p8KHvFszSgQpEz1jHwW2KfMNHpUqRj45iFFDX5P8bOnG+ek
	 A1WxR2Bn4FsmXF7dStD1DNGfWMR0gG6qlIPEwREvLFQdBaHCUhJTmI5xyWlxrphjEV
	 THAonOIyjUMMGf2gcsbEn+khpTPtanw3V/9BoAZUiTaQPSwAVIncsChJMxCGTFgXRo
	 EA3uTr/iLS4UVXDfaDUjBMDvchVe6FV7p5VZZx35xVme/s8GVd/TC2YMu1RqcRgXrW
	 5DCfYtAOuW1tQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773673685; x=1773934185; i=anthony.perard@vates.tech;
	bh=Fz3JBKPQMyeowZWRMqZh8FyijgWgZh/CEClLY+5GdN0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=qaJT7yQ0KMY/7RkbXPmSXezvTcVoDptf1tBWB9IJIG1iFddqdVIP5gKpOxy58s4+Y
	 hCo5o8NnYKMTycaeVmMLTsVq2uJt+sR4muZ2WrHlAxzhz8Lzh0idadKQOkqD8aA0Qk
	 3bu3UQzU/nxWS49n6Cj84Sw3B0f9rJx61IsQci75KxITd5CGK+4hrg39amqLGqLExc
	 zXWa2KU9m542AkxkGx2Qyfh+jxLZLBj83Zp0VndR9p28PA7DklSnsTkHKecmdBTpYW
	 MUTlEbZViLoXZ0IjH82Jgn1X5+k+6knjIxhfz/JEMACatPsYm1rkVUjAXvY9JR2xiJ
	 IYvS6XsUFFzVw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2007/11]=20tools/xenstored:=20implement=20the=20GET/SET=5FQUOTA=20commands?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773673684981
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Julien Grall" <julien@xen.org>
Message-Id: <abgc1Azehzw_m9Ff@l14>
References: <20260305135208.2208663-1-jgross@suse.com> <20260305135208.2208663-8-jgross@suse.com>
In-Reply-To: <20260305135208.2208663-8-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.6a3f9db5333c4ded9245fee67960302f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260316:md
Date: Mon, 16 Mar 2026 15:08:05 +0000
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.875];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9A6B329C04D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 05, 2026 at 02:52:04PM +0100, Juergen Gross wrote:
> diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
> index 8a06b35808..e283d47184 100644
> --- a/tools/xenstored/core.c
> +++ b/tools/xenstored/core.c
> @@ -2034,6 +2034,10 @@ static struct {
>  	    { "GET_FEATURE",   do_get_feature,  XS_FLAG_PRIV },
>  	[XS_SET_FEATURE]       =
>  	    { "SET_FEATURE",   do_set_feature,  XS_FLAG_PRIV },
> +	[XS_GET_QUOTA]         =
> +	    { "GET_QUOTA",     do_get_quota,    XS_FLAG_PRIV },
> +	[XS_SET_QUOTA]         =
> +	    { "SET_QUOTA",     do_set_quota,    XS_FLAG_PRIV },
>  };
>  
>  static const char *sockmsg_string(enum xsd_sockmsg_type type)
> diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
> index 8e52351695..c0bc8a3eb7 100644
> --- a/tools/xenstored/domain.c
> +++ b/tools/xenstored/domain.c
> @@ -1363,6 +1363,112 @@ static bool parse_quota_name(const char *name, unsigned int *qidx,
>  	return true;
>  }
>  
> +int do_get_quota(const void *ctx, struct connection *conn,
> +		 struct buffered_data *in)
> +{
> +	const char *vec[2];
> +	unsigned int n_pars;
> +	unsigned int domid;
> +	unsigned int q;
> +	unsigned int idx;
> +	char *resp;
> +	const char *name;
> +	const struct quota *quota;
> +	const struct domain *domain;
> +
> +	n_pars = get_strings(in, vec, ARRAY_SIZE(vec));
> +
> +	if (n_pars > 2)
> +		return EINVAL;
> +
> +	if (n_pars == 0) {
> +		resp = talloc_asprintf(ctx, "%s", "");

This could be written with talloc_strdup() instead, since there's no
formatting involve.

> +		if (!resp)
> +			return ENOMEM;
> +		for (q = 0; q < ACC_N; q++) {
> +			if (!quota_adm[q].name)
> +				continue;
> +			if (quotas[q].val[Q_IDX_HARD] != Q_VAL_DISABLED) {

Having set internally a value of Q_VAL_DISABLED, does it mean the named
quota is unsupported?

> +				resp = talloc_asprintf_append(resp, "%s%s",
> +					*resp ? " " : "", quota_adm[q].name);
> +				if (!resp)
> +					return ENOMEM;
> +			}
> +			if (quotas[q].val[Q_IDX_SOFT] != Q_VAL_DISABLED) {
> +				resp = talloc_asprintf_append(resp, "%ssoft-%s",
> +					*resp ? " " : "", quota_adm[q].name);
> +				if (!resp)
> +					return ENOMEM;
> +			}
> +		}
> +	} else {
> +		if (n_pars == 1) {
> +			quota = quotas;
> +			name = vec[0];
> +		} else {
> +			domid = atoi(vec[0]);

Shall we check that vec[0] actually contain a plausible domid? (An
integer between 0..65535). Right now, this accept everything, and would
return 0 if there's not a single digit.

> +			domain = find_or_alloc_existing_domain(domid);
> +			if (!domain)
> +				return ENOENT;
> +			quota = domain->acc;
> +			name = vec[1];
> +		}
> +
> +		if (parse_quota_name(name, &q, &idx))
> +			return EINVAL;
> +
> +		resp = talloc_asprintf(ctx, "%u", quota[q].val[idx]);

Why do we return 4294967295 for disabled quota check when the spec say
to return "0" when a quota check is disabled? That is for quota names
that are supposed to be not supported (if we ask "GET_QUOTA" first).

> +		if (!resp)
> +			return ENOMEM;
> +	}
> +
> +	send_reply(conn, XS_GET_QUOTA, resp, strlen(resp) + 1);
> +
> +	return 0;
> +}
> +
> +int do_set_quota(const void *ctx, struct connection *conn,
> +		 struct buffered_data *in)
> +{
> +	const char *vec[3];
> +	unsigned int n_pars;
> +	unsigned int domid;
> +	unsigned int q;
> +	unsigned int idx;
> +	const char *name;
> +	unsigned int val;
> +	struct quota *quota;
> +	struct domain *domain;
> +
> +	n_pars = get_strings(in, vec, ARRAY_SIZE(vec));
> +
> +	if (n_pars < 2 || n_pars > 3)
> +		return EINVAL;
> +
> +	if (n_pars == 2) {
> +		quota = quotas;
> +		name = vec[0];
> +		val = atoi(vec[1]);

We should check that vec[1] is a valid quota value, and also not an
internal value. Otherwise, we can just have "-1" on the wire, and have
unexpected changes for example. Only "0" is documented as a quota been
disabled, "-1" or "4294967295" isn't.

> +	} else {
> +		domid = atoi(vec[0]);
> +		domain = find_or_alloc_existing_domain(domid);
> +		if (!domain)
> +			return ENOENT;
> +		quota = domain->acc;
> +		name = vec[1];
> +		val = atoi(vec[2]);
> +	}
> +
> +	if (parse_quota_name(name, &q, &idx))
> +		return EINVAL;
> +
> +	quota[q].val[idx] = val;
> +
> +	send_ack(conn, XS_SET_QUOTA);
> +
> +	return 0;
> +}
> +
>  static int close_xgt_handle(void *_handle)
>  {
>  	xengnttab_close(*(xengnttab_handle **)_handle);
> diff --git a/tools/xenstored/domain.h b/tools/xenstored/domain.h
> index 62ce3b3166..6a06b0d1af 100644
> --- a/tools/xenstored/domain.h
> +++ b/tools/xenstored/domain.h
> @@ -93,6 +93,14 @@ int do_get_feature(const void *ctx, struct connection *conn,
>  int do_set_feature(const void *ctx, struct connection *conn,
>  		   struct buffered_data *in);
>  
> +/* Get quota names or value */

This could say "implement GET_QUOTA" or something instead. But a
comment here isn't going to give much value for internal functions.

> +int do_get_quota(const void *ctx, struct connection *conn,
> +		 struct buffered_data *in);
> +
> +/* Set quota value */
> +int do_set_quota(const void *ctx, struct connection *conn,
> +		 struct buffered_data *in);
> +
>  void domain_early_init(void);
>  void domain_init(int evtfd);
>  void init_domains(bool live_update);


Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


