Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCRyFf/0u2moqgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:07:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F14AA2CBA4A
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:07:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257077.1551526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3D5X-0008So-Pm; Thu, 19 Mar 2026 13:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257077.1551526; Thu, 19 Mar 2026 13:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3D5X-0008Q1-My; Thu, 19 Mar 2026 13:06:59 +0000
Received: by outflank-mailman (input) for mailman id 1257077;
 Thu, 19 Mar 2026 13:06:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vWPZ=BT=bounce.vates.tech=bounce-md_30504962.69bbf4ee.v1-1a214337d7a644c185503db736c96a31@srs-se1.protection.inumbo.net>)
 id 1w3D5W-0008PT-1B
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 13:06:58 +0000
Received: from mail136-12.atl41.mandrillapp.com
 (mail136-12.atl41.mandrillapp.com [198.2.136.12])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8131d857-2394-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 14:06:56 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-12.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4fc5Z66PnWz5QkWpg
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 13:06:54 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 1a214337d7a644c185503db736c96a31; Thu, 19 Mar 2026 13:06:54 +0000
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
X-Inumbo-ID: 8131d857-2394-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773925614; x=1774195614;
	bh=h6Nv3pzUuuG4oNJ5/0WmqZswyO6bOS7K6U7wXPbum9o=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=qteMZHYnaCBjKbJ0aVAImIQduxwwQ/nCq+BBAlT56TE/zyvVb/PNrDnP5ACUkvuFF
	 iiWJozwtTmxpKdt8TffeD1E2PcJPkNFC5UQuo2LB4zVNdRkM+HP7knHR2AmJ5A8k6y
	 Q7XJGkamkieGgJc08aSgTGEd9nvKubBwnQkF6W9N3gZc+hnl7Ia3pMvaZMX5S9HLfn
	 UCpVrMV3Zk3C5HwBwOBaeriHREXtZNU+u4zLJVxZGUKmI4C9aPv04qPaJC1DWLRgWU
	 XIvdgkPrK7/IcN9BMQ08z+msLk77Kie25frRWCWS/SEd9f7FvP3zwsSPCmy+GTv4G0
	 FdB9NgbxfvnmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773925614; x=1774186114; i=anthony.perard@vates.tech;
	bh=h6Nv3pzUuuG4oNJ5/0WmqZswyO6bOS7K6U7wXPbum9o=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=GqQpgFc3ZD83z9wmOgQG5ACTCyPiMgObSpsOKvRpNrDRIzoO6sriqH5yUZNHiH/FY
	 1La8wEozUGwqqKFIXvRt0wt/J/IXZh1zT9RLGgcwsYKrgLnYgEB6pl6owC2fYdVBaP
	 Exk3EfFOS1wNVP8ciKfNK462JclYgXEMpmewQaVpLsifqSpehQDL5q6sGEppIGkg4x
	 WW5d3FwYXUKstFR6xjN1xntiJjNLthNvQxDJvE10MtPNcG/XWf1g4/hhX9PiMprE7k
	 RmQYVIlvbt0uAKd2bDTCmTL7B3q7XpY6KAF3i9FbEMV+xGeqdZOnAixB0+G39iQq/Y
	 FmrNTwdgnRAcQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2011/11]=20tools/xl:=20add=20support=20for=20xenstore=20quota=20setting=20via=20domain=20config?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773925613982
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Message-Id: <abv07SIxrCVEZoK0@l14>
References: <20260305135208.2208663-1-jgross@suse.com> <20260305135208.2208663-12-jgross@suse.com>
In-Reply-To: <20260305135208.2208663-12-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.1a214337d7a644c185503db736c96a31?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260319:md
Date: Thu, 19 Mar 2026 13:06:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [4.01 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCPT_COUNT_TWO(0.00)[2];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:dkim,vates.tech:email,vates.tech:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	NEURAL_SPAM(0.00)[0.831];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: F14AA2CBA4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 05, 2026 at 02:52:08PM +0100, Juergen Gross wrote:
> Add a new "xenstore-quota" domain config parameter for setting the

You mean `xenstore_quota` ^ here.

> Xenstore quota of a new domain via a list of <quota>=<val> items.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 934ad4eeef..06a5b60736 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1467,6 +1468,26 @@ void parse_config_data(const char *config_source,
>      if (!xlu_cfg_get_long (config, "xenstore_feature_mask", &l, 0))
>          b_info->xenstore_feature_mask = l;
>  
> +    if (!xlu_cfg_get_list(config, "xenstore_quota", &xs_quota, &num_xs_quota, 0)) {
> +        b_info->xenstore_quota.num_quota = num_xs_quota;
> +        b_info->xenstore_quota.quota = calloc(num_xs_quota, sizeof(* b_info->xenstore_quota.quota));

You can call xcalloc() instead, and then not need to check for
allocation failure.

And with the two changes: Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


