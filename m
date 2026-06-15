Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eRUVGGeIL2o9CAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 07:06:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E74D3683636
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 07:06:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=NXfX8nZP;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=redhat.com
Received: from list by lists.xenproject.org with outflank-mailman.1337981.1599011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYzW4-0004zU-3p; Mon, 15 Jun 2026 05:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337981.1599011; Mon, 15 Jun 2026 05:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYzW4-0004ws-0R; Mon, 15 Jun 2026 05:05:44 +0000
Received: by outflank-mailman (input) for mailman id 1337981;
 Mon, 15 Jun 2026 05:05:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <armbru@redhat.com>) id 1wYzW2-0004wm-H1
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 05:05:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYzW0-000LzM-GS
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 07:05:40 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <armbru@redhat.com>)
 id 6a2f880b-5cb7-0a2a0a5109dd-0a2a4509c7de-36
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 07:05:40 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <armbru@redhat.com>)
 id 6a2f8822-2497-0a2a45090019-aa0a817c8bc9-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 07:05:40 +0200
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-385-25T9ibBwOyeRJ2FdxCSBhg-1; Mon,
 15 Jun 2026 01:05:36 -0400
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5670418007F2; Mon, 15 Jun 2026 05:05:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.4])
 by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CD05636918; Mon, 15 Jun 2026 05:05:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6360721E6A01; Mon, 15 Jun 2026 07:05:32 +0200 (CEST)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781499938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ukah0pE80e2c75o55ohnW5seHcFB7Sqn/9erjKGRFo=;
	b=NXfX8nZPkcyU40I3lQNJkGd5p1htbQJilLBLGebAs0okSqD7qRVe9fV1sDWZKvJdcqqrLv
	qeFKysQ6r4QH+Hut17iazvL0Y7c9Us/6PtKSNS4JcHdQvKuRqHUaAmOmWBP6n9N22BQ+gP
	vQoGkKRBUwtWbbTpo5o05K3PSQQ4lhs=
X-MC-Unique: 25T9ibBwOyeRJ2FdxCSBhg-1
X-Mimecast-MFC-AGG-ID: 25T9ibBwOyeRJ2FdxCSBhg_1781499935
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org,  "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
  xen-devel@lists.xenproject.org,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Anthony PERARD <anthony@xenproject.org>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Stefano Stabellini
 <sstabellini@kernel.org>
Subject: Re: [PATCH 2/2] qom/object: Remove pre-C11 check
In-Reply-To: <20260613175151.1357-3-philmd@oss.qualcomm.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Sat, 13 Jun 2026 19:51:51
 +0200")
References: <20260613175151.1357-1-philmd@oss.qualcomm.com>
	<20260613175151.1357-3-philmd@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 07:05:32 +0200
Message-ID: <87h5n4tmub.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: jJScMdWwJPEpMYNa9dbR2D4uiQuCWu0vofinVVgXnN8_1781499935
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-bad1c0/1781499940-41F6EA53-4CE952E1/0/0
X-purgate-type: clean
X-purgate-size: 2022
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[armbru@redhat.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:philmd@oss.qualcomm.com,m:qemu-devel@nongnu.org,m:edgar.iglesias@gmail.com,m:xen-devel@lists.xenproject.org,m:berrange@redhat.com,m:anthony@xenproject.org,m:pbonzini@redhat.com,m:sstabellini@kernel.org,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[nongnu.org,gmail.com,lists.xenproject.org,redhat.com,xenproject.org,kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[armbru@redhat.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E74D3683636

Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com> writes:

> We mandate a compiler supporting C11 since 2021-06-15 in
> commit d22797ce36a ("configure: Use -std=3Dgnu11"), thus the
> max_align_t type definition exists. Remove what is now dead
> code.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>

> ---
>  qom/object.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
>
> diff --git a/qom/object.c b/qom/object.c
> index 0ac201de4c1..f79b2cf3618 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -675,18 +675,6 @@ static void object_finalize(void *data)
>      }
>  }
> =20
> -/* Find the minimum alignment guaranteed by the system malloc. */
> -#if __STDC_VERSION__ >=3D 201112L
> -typedef max_align_t qemu_max_align_t;
> -#else
> -typedef union {
> -    long l;
> -    void *p;
> -    double d;
> -    long double ld;
> -} qemu_max_align_t;
> -#endif
> -
>  static Object *object_new_with_type(Type type)
>  {
>      Object *obj;
> @@ -703,7 +691,7 @@ static Object *object_new_with_type(Type type)
>       * Do not use qemu_memalign unless required.  Depending on the
>       * implementation, extra alignment implies extra overhead.
>       */
> -    if (likely(align <=3D __alignof__(qemu_max_align_t))) {
> +    if (likely(align <=3D __alignof__(max_align_t))) {
>          obj =3D g_malloc(size);
>          obj_free =3D g_free;
>      } else {
           obj =3D qemu_memalign(align, size);
           obj_free =3D qemu_vfree;
       }

Reviewed-by: Markus Armbruster <armbru@redhat.com>

Context leads me to qemu_try_memalign() via qemu_memalign():

   #elif defined(CONFIG_ALIGNED_MALLOC)
       ptr =3D _aligned_malloc(size, alignment);
   #elif defined(CONFIG_VALLOC)
       ptr =3D valloc(size);
   #elif defined(CONFIG_MEMALIGN)
       ptr =3D memalign(alignment, size);
   #else
       #error No function to allocate aligned memory available
   #endif

C11 provides aligned_alloc().


