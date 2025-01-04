Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 912DEA011F7
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 03:51:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864981.1276252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuFv-0004d1-DB; Sat, 04 Jan 2025 02:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864981.1276252; Sat, 04 Jan 2025 02:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuFv-0004a7-9I; Sat, 04 Jan 2025 02:51:15 +0000
Received: by outflank-mailman (input) for mailman id 864981;
 Sat, 04 Jan 2025 02:51:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTuFu-0004Zz-3T
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 02:51:14 +0000
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c24c0521-ca46-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 03:51:13 +0100 (CET)
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
X-Inumbo-ID: c24c0521-ca46-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735959071; x=1736218271;
	bh=bFgZsvN8ug6qv0E64JqLve9OtjkDvHUNjUVERtYWc3g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=j1qJ9rhCfFS0KSHqhjv460f1Yx601WxqF7xqaV70k8IJ370hpuDvab+2mJnnH/gkO
	 SJOBVfoprCKmwyuZqmV/G4BjdPyp+0bhFgbngneRhoGiLrRQcvLNK9M4bh6MlAz7XR
	 EIJNH1sxHMis1FQuxwziDGegxGNG0h4tpZy3ClP9+5/Hl6J9B8mVPZhsWyEn4X9iU7
	 kU6hazyL5TAYIO5Rh+BCDUppPa1fFQbmBQkzNckFRq1/u18Lg4DGoaRKZ2f70NKPTO
	 MQH/PEE+HUzm0Pg/NAZzUb+Wkq4PEYl3ePVf6rJTQ9rfDTq9YvXIs2nOXQCt3L3/QY
	 t8GZOMuqRnNoA==
Date: Sat, 04 Jan 2025 02:51:06 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 11/35] xen/domain: enable max_init_domid for all architectures
Message-ID: <7Hq9DTz8CArNygIvQfu-X4WS2kGp0GovCOriynZ8hXfYkwZdCO8isiX1UG_6y7XkxZAWDa84hO27pYRwLogcRTG1wk7p9mQFGzMdFruZk5Y=@proton.me>
In-Reply-To: <32065c58-ca83-4a18-8831-6044da2377e9@suse.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-11-e9aa923127eb@ford.com> <32065c58-ca83-4a18-8831-6044da2377e9@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 73aefb83cb254b9fa0adbac377501f3cd1ef1f8a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, December 10th, 2024 at 5:57 AM, Jan Beulich <jbeulich@suse.com>=
 wrote:

>
>
> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
>
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -65,6 +65,9 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
> > static struct domain *domain_hash[DOMAIN_HASH_SIZE];
> > struct domain *domain_list;
> >
> > +/* Last known non-system domain ID. /
> > +domid_t __read_mostly max_init_domid;
> > +
> > /
> > * Insert a domain into the domlist/hash. This allows the domain to be l=
ooked
> > * up by domid, and therefore to be the subject of hypercalls/etc.
> > @@ -815,6 +818,12 @@ struct domain *domain_create(domid_t domid,
> >
> > memcpy(d->handle, config->handle, sizeof(d->handle));
> >
> > + /*
> > + * Housekeeping for physical console forwarding to the domain.
> > + */
> > + if ( !is_system_domain(d) && max_init_domid < domid )
> > + max_init_domid =3D domid;
>
>
> Yet this affects all domains, not just init ones. Either the variable
> name is wrong then, or the updating logic needs adjustment. The comment
> in the earlier hunk suggests the former, yet then this is a behavioral
> change for Arm, correctness of which needs explaining.

Thanks, I have reworked that part.

>
> Jan



