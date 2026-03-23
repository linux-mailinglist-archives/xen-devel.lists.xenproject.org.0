Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJGXO1Q3wWm7RQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 13:51:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A10B52F23B2
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 13:51:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259310.1552623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4ekF-0002am-5o; Mon, 23 Mar 2026 12:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259310.1552623; Mon, 23 Mar 2026 12:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4ekF-0002Yf-3C; Mon, 23 Mar 2026 12:50:59 +0000
Received: by outflank-mailman (input) for mailman id 1259310;
 Mon, 23 Mar 2026 12:50:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIpU=BX=bounce.vates.tech=bounce-md_30504962.69c1372d.v1-020fb4d42f844abfbc94953b73f98011@srs-se1.protection.inumbo.net>)
 id 1w4ekE-0002YZ-2T
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 12:50:58 +0000
Received: from mail180-47.suw31.mandrillapp.com
 (mail180-47.suw31.mandrillapp.com [198.2.180.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee03a985-26b6-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Mar 2026 13:50:55 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-47.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4ffY1n58DQzPm0hHP
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 12:50:53 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 020fb4d42f844abfbc94953b73f98011; Mon, 23 Mar 2026 12:50:53 +0000
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
X-Inumbo-ID: ee03a985-26b6-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1774270253; x=1774540253;
	bh=QV6Ov3N//XtKC760wpPNi7XKYh20alxA4UR8FMz7buo=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ghVdtAW3be4ChHCa3/2FQ5TryVBdzNVH710YKrOSHiuPGpeANSyYCanap6k67uBIN
	 BdUUCwWOHM0lWmiKePeEnGCcQcZMAivTKUGruTVaVbw+eTQCsoX1tTKHqCETtq2CWx
	 WKHRTOoHR2M2lFKU24YvWgd5VAaluJjNYy4EMuqGSu5O7B0twtMbRayTT0bhV5YEbX
	 CJKFpjvhtETrgbyyBTcoxA9uIonDmN9bJjqacLv2I8u0j7UKQr0fdbqdvZCe6orZm0
	 +klrnR143UR67/tIor8Ofs5ktFXNbsWL8ydgQH8yU1Yj9X0dLz+X+Jw7ziH8Dp8qwI
	 4mCHZaItUq1Rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1774270253; x=1774530753; i=anthony.perard@vates.tech;
	bh=QV6Ov3N//XtKC760wpPNi7XKYh20alxA4UR8FMz7buo=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=YYjcQNyJR8ikmOGOvGb+6PXF9lhLCKJYsi2/rEQXeYGGBzBsTD9w3LqjIX+k6/6ID
	 +zs6UGHc3X63cNIn7m9Suw9m/OLycBGc19hMObEy7yvTaUT/xO7aFZ0LDYsWlT5dAW
	 Q0hic4BBrZOJxTV9Y5o+GG1NA7jt2xaffIoWSknDbP7x63uRFWz4iww4Li5zUfu4eL
	 HSYOGdd7lNfeS8jUzPsCTxznrMZnaSd7nJpTcZA5k54nC29VG0gja6VTjln2OPb90/
	 EV3q1FUp6KrbxoHtpEi03THDoE3qkjDC1Jbzb4Rq+LxmuwWeMq3waJsSoZt9lmjdA9
	 ys2rMzhJ6xcjw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=2005/12]=20tools/xenstored:=20add=20GLOBAL=5FQUOTA=5FDATA=20record=20for=20live=20update?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1774270253135
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Julien Grall" <julien@xen.org>
Message-Id: <acE3LNSwDIowgGJm@l14>
References: <20260320150120.874878-1-jgross@suse.com> <20260320150120.874878-6-jgross@suse.com>
In-Reply-To: <20260320150120.874878-6-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.020fb4d42f844abfbc94953b73f98011?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260323:md
Date: Mon, 23 Mar 2026 12:50:53 +0000
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim,vates.tech:dkim,vates.tech:email,vates.tech:url];
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
	NEURAL_HAM(-0.00)[-1.000];
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
X-Rspamd-Queue-Id: A10B52F23B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 04:01:13PM +0100, Juergen Gross wrote:
> Communicate the global quota settings via the GLOBAL_QUOTA_DATA
> record to the new Xenstore instance.
> 
> This avoids to lose global quota settings done via xenstore-control.
> 
> In theory it would be possible to drop any quota related command line
> parameters in the live update case, but they don't do any harm, as
> the record data is applied on top of the command line data.
> 
> For soft-quota just prepend "soft-" to the quota name.
> 
> Use sub-functions for building and analyzing the quota part of the
> migration stream, as they will be reused for per-domain quotas.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - add macros for soft-quota name prefix and its length (Anthony Perard)
> - don't allow disabled quota in parse_quota_name() (Anthony Perard)
> - rename "len" to "rec_len" in dump_state_glb_quota() (Anthony Perard)
> - rename build_quota_data() parameter "name" to "names_buf" (Anthony Perard)
> - let get_quota_size() start with len 0 (Anthony Perard)

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


