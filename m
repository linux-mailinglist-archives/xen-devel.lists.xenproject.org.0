Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ECDA01219
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 04:31:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865160.1276452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuse-00075l-HK; Sat, 04 Jan 2025 03:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865160.1276452; Sat, 04 Jan 2025 03:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuse-000731-EB; Sat, 04 Jan 2025 03:31:16 +0000
Received: by outflank-mailman (input) for mailman id 865160;
 Sat, 04 Jan 2025 03:31:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTusc-0006nz-Nl
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 03:31:14 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58f3724c-ca4c-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 04:31:13 +0100 (CET)
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
X-Inumbo-ID: 58f3724c-ca4c-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735961472; x=1736220672;
	bh=TfPSx5ToGr+1+gRSVRuQXLSfHDgwTqVOv5KcTZJnjy0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Lp2NmLRJkns/gBV790oE+iQ/clqOxT9Ie/ujpn06zUUrrXLYbPYm5C8mroRC/ikpo
	 c3p0zDsuBTaas57ar68MzawnFjB4XIYLLTKyq+VEGhO2fPAi4WDzUw7xhO34mgDOE1
	 1/czknU7KzWkuHd64ZdZ05UU+s334/mD+82WFAxsXKxvt/nXIvJEPLGtzzIVWIwdLe
	 4XoPfS7RFMcBoC0l+cMbA9eQYfqnlZ9mFFx6kNbYLuyNP7s3RsPQ2aEFtZNPT5XOZM
	 yR95+lkBO3Fd5WysfpgWacuMwzaKkQlSQj8cJe6OcxMG82JbtORhyCENCoC1xsGd/8
	 fjE3ZCYYKsn0Q==
Date: Sat, 04 Jan 2025 03:31:08 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 19/35] xen/console: introduce console_set_owner()
Message-ID: <JnsgSWx03iGL2Y2dOfX0jA5b-MEkVTsIDcFAGjL55U9kZf4icDMolB42jqTNEiYtKHE05iN2gsohoHN2aA8sS_j2NdRh1onXjNxOahpx91o=@proton.me>
In-Reply-To: <1e36f66b-a423-428c-9b22-8fd58450f119@suse.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-19-e9aa923127eb@ford.com> <Z1q3COsFN3J9G60E@macbook.local> <1e36f66b-a423-428c-9b22-8fd58450f119@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: b2eba51675b0283a0c00e449f3838b172397dc16
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, December 12th, 2024 at 3:59 AM, Jan Beulich <jbeulich@suse.com=
> wrote:

>
>
> On 12.12.2024 11:12, Roger Pau Monn=C3=A9 wrote:
>
> > On Thu, Dec 05, 2024 at 08:41:49PM -0800, Denis Mukhin via B4 Relay wro=
te:
> >
> > > +static struct domain *rcu_lock_domain_console_by_id(domid_t domid)
> > > +{
> > > + struct domain *d;
> > > +
> > > + d =3D rcu_lock_domain_by_id(domid);
> > > +
> >
> > Nit: I would remove this newline.
>
>
> Or even better make the function call the variable's initializer.

Fixed.

>
> Jan



