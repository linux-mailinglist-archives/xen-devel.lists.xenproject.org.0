Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 987C5914959
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 14:10:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746536.1153616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLiVF-0004NL-Qn; Mon, 24 Jun 2024 12:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746536.1153616; Mon, 24 Jun 2024 12:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLiVF-0004Ki-Nl; Mon, 24 Jun 2024 12:08:57 +0000
Received: by outflank-mailman (input) for mailman id 746536;
 Mon, 24 Jun 2024 12:08:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGGw=N2=bounce.vates.tech=bounce-md_30504962.667961d4.v1-eb1f2d732bc943e28a3af2ae209cd8cc@srs-se1.protection.inumbo.net>)
 id 1sLiVD-0004KW-Ue
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 12:08:56 +0000
Received: from mail134-3.atl141.mandrillapp.com
 (mail134-3.atl141.mandrillapp.com [198.2.134.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8625700c-3222-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 14:08:54 +0200 (CEST)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-3.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4W76FJ2PSWzDRHxX5
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 12:08:52 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 eb1f2d732bc943e28a3af2ae209cd8cc; Mon, 24 Jun 2024 12:08:52 +0000
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
X-Inumbo-ID: 8625700c-3222-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1719230932; x=1719491432;
	bh=ik4x/9rcwnuDs93PoEKkslGjBhp79Yp9oN8ISLlWzd8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Qxgc4NgX8Bfdog9+CpWLLia1JnEjOqUnITjFS4Lt8ZWnYYNKxOQEP5Hz0xNV5ijqx
	 RQFG81XJJH6PgRjOZiQ3lQx1ykn2sQbdNKOV3aALzU+vLMzsL34ri1zWf3Z3TQFuUk
	 NXOylneF6TjqWX+b0bjZ4bIXULIw+15RjgXJBUWOvW7dD/5jIVZEr8FUN6HdaCDyG0
	 5IvOVkAlAPrQmtpQewqAsV8l8oAvL9U12SWUeyZe5X1beEmQxL/59BqkD90gyO1lU0
	 76NhpX5x2Ej4lXY3wtxNTidoM0U99FaSHOShb1bJN3m98HXaxQ9jYwS+p87764Ss1F
	 sBceCDYNrNS9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1719230932; x=1719491432; i=anthony.perard@vates.tech;
	bh=ik4x/9rcwnuDs93PoEKkslGjBhp79Yp9oN8ISLlWzd8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=xYn9sCW7SsE6lQJSaaw/BEFQXXi0Cw+1XIfWLbOxJlM60c2wRonK6eelQN5NT5Li4
	 6jeu6huBd6/nN/4Hn9IBTeVx2EY9NWwubW8sDNr/0kd1smVyYpb8tCjxxrfByAdue8
	 eLKUsHUr8bNXkbHsev8isCs67usVhvHULjTEvjLLvI98XH/k9YygeFYZBKnZIImj+5
	 FcgC6T8DPHWw+WeX02Q0C01NkXDQDUgKBzmKU7bu29lrMkDMoiTtPvxur2Ti81g73U
	 0RMc2A23YV8qzSbUJOjQlwGkHpes8bLenWKL4Xo0yVuf93v3QTeyP6rYdloe8VEBae
	 BcK0pX6Uun7ew==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=20v10=204/5]=20tools:=20Add=20new=20function=20to=20get=20gsi=20from=20dev?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1719230930251
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>
Message-Id: <Znlh0QnvdvkqOmyH@l14>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com> <20240617090035.839640-5-Jiqian.Chen@amd.com> <ZnQ+/y/AGyasDGHY@l14> <BL1PR12MB5849AB68A6D6593A464D4D7EE7C92@BL1PR12MB5849.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB5849AB68A6D6593A464D4D7EE7C92@BL1PR12MB5849.namprd12.prod.outlook.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.eb1f2d732bc943e28a3af2ae209cd8cc?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240624:md
Date: Mon, 24 Jun 2024 12:08:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Jun 21, 2024 at 08:34:11AM +0000, Chen, Jiqian wrote:
> On 2024/6/20 22:38, Anthony PERARD wrote:
> > On Mon, Jun 17, 2024 at 05:00:34PM +0800, Jiqian Chen wrote:
> >> diff --git a/tools/include/xencall.h b/tools/include/xencall.h
> >> index fc95ed0fe58e..750aab070323 100644
> >> --- a/tools/include/xencall.h
> >> +++ b/tools/include/xencall.h
> >> @@ -113,6 +113,8 @@ int xencall5(xencall_handle *xcall, unsigned int op,
> >>               uint64_t arg1, uint64_t arg2, uint64_t arg3,
> >>               uint64_t arg4, uint64_t arg5);
> >>  
> >> +int xen_oscall_gsi_from_dev(xencall_handle *xcall, unsigned int sbdf);
> > 
> > I don't think that an appropriate library for this new feature.
> > libxencall is a generic lib to make hypercall.
> Do you have a suggested place to put this new function?

This is an internal function, which doesn't need to be exposed in a
public interface, but the implementation is used by another function. So
that can be moved to libxenctrl.


-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

