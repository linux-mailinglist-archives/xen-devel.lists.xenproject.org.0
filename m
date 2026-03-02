Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJNoMQappWmpDgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 16:13:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 370B21DB927
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 16:13:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244310.1543750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx4x8-0007XB-DL; Mon, 02 Mar 2026 15:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244310.1543750; Mon, 02 Mar 2026 15:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx4x8-0007Vc-9Z; Mon, 02 Mar 2026 15:12:58 +0000
Received: by outflank-mailman (input) for mailman id 1244310;
 Mon, 02 Mar 2026 15:12:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z8ZE=BC=bounce.vates.tech=bounce-md_30504962.69a5a8f5.v1-fb2ad6a223ec4fbc99e8451c1e815e95@srs-se1.protection.inumbo.net>)
 id 1vx4x7-0007VU-0G
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 15:12:57 +0000
Received: from mail178-23.suw51.mandrillapp.com
 (mail178-23.suw51.mandrillapp.com [198.2.178.23])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49e04c48-164a-11f1-b164-2bf370ae4941;
 Mon, 02 Mar 2026 16:12:55 +0100 (CET)
Received: from pmta13.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail178-23.suw51.mandrillapp.com (Mailchimp) with ESMTP id
 4fPj9K6ZQHz35hTRY
 for <xen-devel@lists.xenproject.org>; Mon,  2 Mar 2026 15:12:53 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 fb2ad6a223ec4fbc99e8451c1e815e95; Mon, 02 Mar 2026 15:12:53 +0000
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
X-Inumbo-ID: 49e04c48-164a-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1772464373; x=1772734373;
	bh=RTaZqS3PvGkavhrM8JFJRLxcqXxTqAdbTc8WRXPL040=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=eFAB9KXU6usOD9CQKV3G68e0fgqxb1OWyn7ybo1vFX8TIkvOMBSEHux/JcHVpXAOc
	 rqiI3+Oi7N/B7d6V4qfsEdlTGjyP90jVJ12DYu+UZcCOBDlfcpccoNnOqUMVM7ZNTH
	 F2isDDKQziO0QVMyK45Y7oPZqK66klboYL8JIwg1pRjx+ZX5VPT78ZWuaWfx/VTFcw
	 oJkdMSlt+T+k2I/bcaivm19TRmPUValhahmwXvJNhPcLo4VmcebsWFJBJJBj54stZ2
	 VMWF/lUqHK6wKRxFo+AXA3rTa1xAA1ci5BriHx4LFTZxuq9quw7kZ/LjtRkYrUJcQ+
	 4WjWXG1uQ8RbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1772464373; x=1772724873; i=anthony.perard@vates.tech;
	bh=RTaZqS3PvGkavhrM8JFJRLxcqXxTqAdbTc8WRXPL040=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=W3YmwKPyca4ki2flYBzM934IYBPtdaS87ix0hAGyHZ0rZfJkyTforXi0cLHcnNNCO
	 wFdl2Ch8EfQ9HNOpZO6c+tpu7w66xmLtYrg2ME1mPJbK0tcMDyZvh+HIdNY5LTI5Yl
	 f/Oxm2FWHeyUJNq6d+HsG6alvrjDJ4W2qPc/9VqD6z5pbEZvdKawTuIRWoEKaOJdEz
	 uNwjnI1KIL6YpEGYiyZOmMqjTom9BSGJv4iLmKUnZOgjGLdW7dWbMdRMJD4fgJfyAE
	 E1xTQ9GmS97jpKiEwITvq7PzZavd94rEJDD4grBv+P3rnrZ+1Rapk3LuxpBP87COLY
	 uAuYpfLwwL1Wg==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v8=201/2]=20libxc:=20Report=20consistent=20errors=20in=20xc=5Fresource=5Fop?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1772464373342
To: "Teddy Astie" <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, "Juergen Gross" <jgross@suse.com>
Message-Id: <aaWo9FfgQMYvy_2I@l14>
References: <ec92e54a493a16f5bc085738e943b3778c3a0231.1772211384.git.teddy.astie@vates.tech>
In-Reply-To: <ec92e54a493a16f5bc085738e943b3778c3a0231.1772211384.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.fb2ad6a223ec4fbc99e8451c1e815e95?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260302:md
Date: Mon, 02 Mar 2026 15:12:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 370B21DB927
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.01 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,mandrillapp.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
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
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	NEURAL_SPAM(0.00)[0.993];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 05:00:05PM +0000, Teddy Astie wrote:
> xc_report_op doesn't update errno in some error conditions.
> Make sure it reports -ENOMEM in out of memory errors and -EINVAL
> in invalid usages errors.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> v7: Introduced
> v8: Use errno to report errors
> 
>  tools/libs/ctrl/xc_resource.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/tools/libs/ctrl/xc_resource.c b/tools/libs/ctrl/xc_resource.c
> index cb6a97202b..ac1524d1bd 100644
> --- a/tools/libs/ctrl/xc_resource.c
> +++ b/tools/libs/ctrl/xc_resource.c
> @@ -28,7 +28,10 @@ static int xc_resource_op_one(xc_interface *xch, xc_resource_op_t *op)
>                                  XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
>  
>      if ( xc_hypercall_bounce_pre(xch, entries) )
> +    {
> +        errno = ENOMEM;

Looking at xc_hypercall_bounce_pre(), it's looks like `errno` should
already be set. On Linux, that would be `mmap()` or `madvise()` updating
it.

>          return -1;
> +    }
>  
>      platform_op.cmd = XENPF_resource_op;
>      platform_op.u.resource_op.nr_entries = op->nr_entries;
> @@ -54,11 +57,15 @@ static int xc_resource_op_multi(xc_interface *xch, uint32_t nr_ops, xc_resource_
>      call_list = xc_hypercall_buffer_alloc(xch, call_list,
>                                            sizeof(*call_list) * nr_ops);
>      if ( !call_list )
> +    {
> +        errno = ENOMEM;

Here, xc_hypercall_buffer_alloc() should already have updated `errno`.
(It's a function called by xc_hypercall_bounce_pre(), so we've got the
same culprit updating `errno`.)

>          return -1;
> +    }
>  
>      platform_ops = xc_hypercall_buffer_array_create(xch, nr_ops);
>      if ( !platform_ops )
>      {
> +        errno = ENOMEM;

Here, xc_hypercall_buffer_array_create() calls `calloc()` and `malloc()`
which will update `errno`.

>          rc = -1;
>          goto out;
>      }
> @@ -66,6 +73,7 @@ static int xc_resource_op_multi(xc_interface *xch, uint32_t nr_ops, xc_resource_
>      entries_list = xc_hypercall_buffer_array_create(xch, nr_ops);
>      if ( !entries_list )
>      {
> +        errno = ENOMEM;

Same as above.

>          rc = -1;
>          goto out;
>      }
> @@ -81,6 +89,7 @@ static int xc_resource_op_multi(xc_interface *xch, uint32_t nr_ops, xc_resource_
>                          platform_op, sizeof(xen_platform_op_t));
>          if ( !platform_op )
>          {
> +            errno = ENOMEM;

With xc_hypercall_buffer_array_alloc(), `errno` is updated by `mmap` or
`madvise`, like the first case.

>              rc = -1;
>              goto out;
>          }
> @@ -90,6 +99,7 @@ static int xc_resource_op_multi(xc_interface *xch, uint32_t nr_ops, xc_resource_
>                     entries, entries_size);
>          if ( !entries)
>          {
> +            errno = ENOMEM;

Same as above.

>              rc = -1;
>              goto out;
>          }
> @@ -137,6 +147,7 @@ int xc_resource_op(xc_interface *xch, uint32_t nr_ops, xc_resource_op_t *ops)
>      if ( nr_ops > 1 )
>          return xc_resource_op_multi(xch, nr_ops, ops);
>  
> +    errno = EINVAL;

Ha! This one was missing indeed.

The patch description will need to be updated with all the chunk be one
been dropped.

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


