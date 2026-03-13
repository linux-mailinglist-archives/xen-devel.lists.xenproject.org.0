Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJ6OGZMjtGl7hwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 15:47:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C037628546C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 15:47:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253777.1549823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w13Qi-0004xM-Vb; Fri, 13 Mar 2026 14:23:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253777.1549823; Fri, 13 Mar 2026 14:23:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w13Qi-0004ux-Rt; Fri, 13 Mar 2026 14:23:56 +0000
Received: by outflank-mailman (input) for mailman id 1253777;
 Fri, 13 Mar 2026 14:23:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tXKZ=BN=bounce.vates.tech=bounce-md_30504962.69b41df4.v1-8886886fd04a4b10a8bd71ea1b6e1887@srs-se1.protection.inumbo.net>)
 id 1w13Qh-0004ur-FD
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 14:23:55 +0000
Received: from mail136-12.atl41.mandrillapp.com
 (mail136-12.atl41.mandrillapp.com [198.2.136.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 409e3ba3-1ee8-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 15:23:49 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-12.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4fXRYc0fVdz5QkZZT
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 14:23:48 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8886886fd04a4b10a8bd71ea1b6e1887; Fri, 13 Mar 2026 14:23:48 +0000
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
X-Inumbo-ID: 409e3ba3-1ee8-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773411828; x=1773681828;
	bh=ArK9VrbgTO4J/ByfYUdZR7SXRclopXmghM4bDQiv6b0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=faWaHwbOZ3/isk3CnW05L49oK4COLhGubq9T5xm8svFKCMhZk9V0eAlmhHTTlu7+b
	 gY6yOIMkIF1VSyr9LD3bBde4HsZ88VWmbrNSrEyzvVMJaiYNz8jfQ0xGYo6Pkr5P9p
	 LkjAl5OmRv15kBDRuPqjzVRE2Pc7wj/HiW7czbov4rgYilS68dxTTplM1ow9ZMa1ww
	 LiDmtgoKi+Al8oC7jfcucJNcK6g/PPCGURmRBkARv7RnvPmCUuenntqf7o1viYx9t6
	 IsXdEzcZ3m75XYNF3FgSfSZmT4Bgu1h0gV9OoHdoO/RusmDRSQgA1kV7poKv4e+hl2
	 BPOycqtaZx12g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773411828; x=1773672328; i=anthony.perard@vates.tech;
	bh=ArK9VrbgTO4J/ByfYUdZR7SXRclopXmghM4bDQiv6b0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Cbv95xzU7znPvmjE1RJBpqRhAj3fQ9PQTURs7PHbq7vrMkbfiV/zSQelKr73ytPSC
	 f/mtnSv8hA45q7n1h3hmJZ6xPLekUhEfIrtqC5FQ8CQ9LOt1chNkOa+ytjcgqyTjvf
	 +twhW4w1ULYTvcmsldlBcyaEegp8dt/oCaGlsfxpW3SzSd2l7UiVFEx/ioaXW6ZmYO
	 Y/y/V0pp4LLifG5eGaZLTa3OwSjqC+aZIeyvQW9TVCUTvzYzc21oFb0s10h501HZKD
	 mbu9fhmuLqrXOpphvVtpy8h3JScxNS1xB45VMJ1w+BvMd9olbezNbW4/Kstm8CYHhZ
	 zQ5N9fcn72TWw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2001/11]=20tools/libs/store:=20add=20get-=20and=20set-quota=20related=20functions?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773411827419
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Julien Grall" <julien@xen.org>
Message-Id: <abQd82Z8x3_9CY2Q@l14>
References: <20260305135208.2208663-1-jgross@suse.com> <20260305135208.2208663-2-jgross@suse.com>
In-Reply-To: <20260305135208.2208663-2-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8886886fd04a4b10a8bd71ea1b6e1887?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260313:md
Date: Fri, 13 Mar 2026 14:23:48 +0000
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:dkim,vates.tech:url,mandrillapp.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,body];
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
	NEURAL_HAM(-0.00)[-0.830];
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
X-Rspamd-Queue-Id: C037628546C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 05, 2026 at 02:51:58PM +0100, Juergen Gross wrote:
> diff --git a/tools/include/xenstore.h b/tools/include/xenstore.h
> index 423422dc50..6b661e5895 100644
> --- a/tools/include/xenstore.h
> +++ b/tools/include/xenstore.h
> @@ -277,6 +277,25 @@ bool xs_get_features_domain(struct xs_handle *h, unsigned int domid,
>  bool xs_set_features_domain(struct xs_handle *h, unsigned int domid,
>  			    unsigned int features);
>  
> +/* Get names of supported quota. */
> +char **xs_get_quota_names(struct xs_handle *h, unsigned int *num);
> +
> +/* Get the value of one global quota. */
> +bool xs_get_global_quota(struct xs_handle *h, char *quota,
> +			 unsigned int *value);
> +
> +/* Set the value of one global quota. */
> +bool xs_set_global_quota(struct xs_handle *h, char *quota,
> +			 unsigned int value);
> +
> +/* Get the value of one domain quota. */
> +bool xs_get_domain_quota(struct xs_handle *h, unsigned int domid,
> +			 char *quota, unsigned int *value);
> +
> +/* Set the value of one domain quota. */
> +bool xs_set_domain_quota(struct xs_handle *h, unsigned int domid,
> +			 char *quota, unsigned int value);
> +

Do you think all those new prototype could get a bit more descriptions?
Which parameter are actually output (and not input), what does it mean
to return false, do they set errno, is there something to do with the
return value of xs_get_quota_names?

For output arguments, libxl have a convention (well at least a mention
in the coding style) to suffix argument names with `_r` or `_out`.

For the strings, could we use `const char *` instead of non-const one?

> diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
> index 8f4b90a3cf..dda37f7526 100644
> --- a/tools/libs/store/xs.c
> +++ b/tools/libs/store/xs.c
> @@ -1456,6 +1456,117 @@ bool xs_set_features_domain(struct xs_handle *h, unsigned int domid,
>  	return xs_bool(xs_talkv(h, iov, ARRAY_SIZE(iov), NULL));
>  }
>  
> +char **xs_get_quota_names(struct xs_handle *h, unsigned int *num)
> +{
> +	struct xsd_sockmsg msg = { .type = XS_GET_QUOTA };
> +	struct iovec iov[1];
> +	char **quota;
> +	char *reply;
> +	char *c;
> +	unsigned int i;
> +
> +	iov[0].iov_base = &msg;
> +	iov[0].iov_len  = sizeof(msg);
> +
> +	reply = xs_talkv(h, iov, ARRAY_SIZE(iov), NULL);
> +	if (!reply)
> +		return NULL;
> +
> +	*num = 1;
> +	for (c = reply; *c; c++)
> +		if (*c == ' ')
> +			(*num)++;
> +
> +	quota = malloc(*num * sizeof(char *) + strlen(reply) + 1);
> +	c = (char *)(quota + *num);
> +	strcpy(c, reply);
> +	for (i = 0; i < *num; i++) {
> +		quota[i] = c;
> +		c = strchr(c, ' ');
> +		if (c) {

If `c` is NULL, it's likely that this is the last iteration of the `for`
loop. But just in case, should we prevent the code from doing another
round and prevent `strchr(NULL, ' ')`? (Or just check that `c` is !NULL,
and let the loop finish set NULL for the remaining slot in `quota`)

> +			*c = 0;
> +			c++;
> +		}
> +	}
> +
> +	return quota;
> +}
> +
> +bool xs_get_global_quota(struct xs_handle *h, char *quota,
> +			 unsigned int *value)
> +{
> +	struct xsd_sockmsg msg = { .type = XS_GET_QUOTA };
> +	struct iovec iov[2];
> +
> +	iov[0].iov_base = &msg;
> +	iov[0].iov_len  = sizeof(msg);
> +	iov[1].iov_base = quota;
> +	iov[1].iov_len  = strlen(quota) + 1;
> +
> +	return xs_uint(xs_talkv(h, iov, ARRAY_SIZE(iov), NULL), value);
> +}
> +
> +bool xs_set_global_quota(struct xs_handle *h, char *quota,
> +			 unsigned int value)
> +{
> +	struct xsd_sockmsg msg = { .type = XS_SET_QUOTA };
> +	char val_str[MAX_STRLEN(value)];

MAX_STRLEN doesn't have a great name, I wounder what is was :-). And
it's not about a maximum size of payload that could go on xs wire or
something, it's actually the maximum string size that can take a
numerical value, when converted to charaters.


The rest looks fine to me.

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


