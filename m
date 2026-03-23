Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKeMEyA+wWk9RwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 14:20:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE30B2F2BA9
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 14:20:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259332.1552642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4fC6-00077o-H7; Mon, 23 Mar 2026 13:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259332.1552642; Mon, 23 Mar 2026 13:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4fC6-00076L-Dg; Mon, 23 Mar 2026 13:19:46 +0000
Received: by outflank-mailman (input) for mailman id 1259332;
 Mon, 23 Mar 2026 13:19:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gece=BX=bounce.vates.tech=bounce-md_30504962.69c13ded.v1-9ba1472d4c0d407eb27dac7e1afad91d@srs-se1.protection.inumbo.net>)
 id 1w4fC4-00076F-LW
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 13:19:44 +0000
Received: from mail180-47.suw31.mandrillapp.com
 (mail180-47.suw31.mandrillapp.com [198.2.180.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3a1dbea-26ba-11f1-b166-2bf370ae4941;
 Mon, 23 Mar 2026 14:19:42 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-47.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4ffYg12JnxzPm17Ks
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 13:19:41 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9ba1472d4c0d407eb27dac7e1afad91d; Mon, 23 Mar 2026 13:19:41 +0000
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
X-Inumbo-ID: f3a1dbea-26ba-11f1-b166-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1774271981; x=1774541981;
	bh=B9v+7+AVox/dnggf6f9JCfEKZgdLhL85lF9wgDvHbEc=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=04eEYlIHZ8kGPDOmiGkKZkp4C7M7RcPZPukCoY0d1NINBlpNC0DsIk2PToeWysz3/
	 bs6/yrQ81xNedqhgnOi+rB2nR24EZ+9oES6+KTgX38TdXgOW8IE8AMCMHx+H2BHgAL
	 skQ91TLCcn4+dCRpV4O3IctqgUzUQP8ldhH6/cv7NAeMDyDVPkc/V7DFZmQacWaJyw
	 alExcTWxYLTe3jfIXU/AxnKX0rieWcGgTbwFMMvafOar5cweIFiWfsabpGbOTP9J8a
	 Grq2NEUtQ7mhcAF+AW8zQC2AzMjP3Ht7yuCoIuSDVnndOliwkZwAhjWHR82RXiWG8z
	 5QTfAjg6qkRZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1774271981; x=1774532481; i=anthony.perard@vates.tech;
	bh=B9v+7+AVox/dnggf6f9JCfEKZgdLhL85lF9wgDvHbEc=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=QnlmBPgnYFHNf36Mj9kXvs/lL8rJ7EA2j8hhSclYFrxZqi0tNxO38VE1PSfaBXT8a
	 c+v8AvVkGAiuDI/Rp/zm8eIpHjRtGCK7IJ/8m7dQ/wvvaCMh8NFVH8l5eHrCAll87O
	 u/u6WlIg4/4UaxrNt8tozyWvB60r1NWCuJeprX3X1K8WzqGjJ3lkV4Ybg7X2H1Wt03
	 +geH0gQ7bce/pNmkGXIHUxMb6r3DDSI2D0A1av3oaCJt23N5US/JAV2vbDAbJl6QSA
	 t2E7xbrirgFvDmIL5QgV091sUlm8Ns0DYL5+IgkkEkQAlI8yFlqLymWNt//R3adZM1
	 rXO1BcWxxPXPQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=2009/12]=20tools/libxl:=20add=20functions=20for=20retrieving=20and=20setting=20xenstore=20quota?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1774271980736
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Nick Rosbrook" <enr0n@ubuntu.com>, "George Dunlap" <gwd@xenproject.org>
Message-Id: <acE97H02nggk05mc@l14>
References: <20260320150120.874878-1-jgross@suse.com> <20260320150120.874878-10-jgross@suse.com>
In-Reply-To: <20260320150120.874878-10-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9ba1472d4c0d407eb27dac7e1afad91d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260323:md
Date: Mon, 23 Mar 2026 13:19:41 +0000
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ubuntu.com:email,mandrillapp.com:dkim,vates.tech:dkim,vates.tech:email,vates.tech:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:enr0n@ubuntu.com,m:gwd@xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
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
X-Rspamd-Queue-Id: CE30B2F2BA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 04:01:17PM +0100, Juergen Gross wrote:
> Add some functions allowing to retrieve and set Xenstore quota (either
> global or domain specific).
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Nick Rosbrook <enr0n@ubuntu.com> # golang stuff
> ---
> V2:
> - rename libxl functions to use "xs_quota" instead of "xsquota"
>   (Anthony Perard)
> - rename the libxl_xs_quota_*_get() "q" parameter to "q_out"
>   (Anthony Perard)
> - rename the struct xs_quota_set to xs_quota_list (Anthony Perard)
> - several style changes (Anthony Perard)

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


