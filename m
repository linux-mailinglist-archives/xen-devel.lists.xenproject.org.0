Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DB66F61F3
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 01:16:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529489.823967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puLho-000716-S1; Wed, 03 May 2023 23:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529489.823967; Wed, 03 May 2023 23:16:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puLho-0006yE-Od; Wed, 03 May 2023 23:16:16 +0000
Received: by outflank-mailman (input) for mailman id 529489;
 Wed, 03 May 2023 23:16:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ISkc=AY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1puLhm-0006y6-Sy
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 23:16:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e2281fe-ea08-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 01:16:12 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1441A63042;
 Wed,  3 May 2023 23:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB734C433D2;
 Wed,  3 May 2023 23:16:08 +0000 (UTC)
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
X-Inumbo-ID: 7e2281fe-ea08-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683155770;
	bh=mcZbuchNBi5Fppn0ME2sv81rsNiMa7IiZd7Odu5pZ4w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TIt+fGLsl1M2PVavsLiu9koO6+kHcojFudesqPs55ZIJYJBY+T/0zekiTTiYaM9+L
	 mzEZNnIIigSwMmNjuUPRuODF8naScvaLDhUlR3TYElrm+NnCh98eR9e6OkjXSjjpxU
	 YHAMDk7lP23b+OHXStUdo2cp7uD+XHiThShIj8A2NzeEeNH5soRwiQXqIk5lBKIjwK
	 dIHp7dwk30/fjjBR8+nWbTDo05FB++JJ8k4UqQYOT1HXmgElY92iUQ8u4RYPS8Fj+k
	 8UchsvMA+7GIsc8kUpe7dxXkU6kcsl5k39QwGVTtXptU0GWaMy5vRhVQf2JmJPM1JX
	 PkKEf5sjuAQhw==
Date: Wed, 3 May 2023 16:16:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: andrew.cooper3@citrix.com
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    alejandro.vallejo@cloud.com, committers@xenproject.org, 
    michal.orzel@amd.com, xen-devel@lists.xenproject.org, 
    Julien Grall <jgrall@amazon.com>, Juergen Gross <jgross@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Edwin_T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
Subject: Re: dom0less vs xenstored setup race Was: xen | Failed pipeline for
 staging | 6a47ba2f
In-Reply-To: <2c1c83be-19d8-34cc-113a-36245adac07e@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2305031604070.974517@ubuntu-linux-20-04-desktop>
References: <644bfbc6939d8_2a49bbb403253f4@gitlab-sidekiq-catchall-v2-78885c497-qxnp2.mail> <alpine.DEB.2.22.394.2304281905020.974517@ubuntu-linux-20-04-desktop> <c74d231f-75e2-a26d-f2c4-3a135cc1ac10@citrix.com> <28235d38-ad7f-f1bd-f093-bd83f9fd6589@xen.org>
 <alpine.DEB.2.22.394.2305031451130.974517@ubuntu-linux-20-04-desktop> <2c1c83be-19d8-34cc-113a-36245adac07e@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1729168010-1683155543=:974517"
Content-ID: <alpine.DEB.2.22.394.2305031612400.974517@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1729168010-1683155543=:974517
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2305031612401.974517@ubuntu-linux-20-04-desktop>

On Wed, 3 May 2023, andrew.cooper3@citrix.com wrote:
> On 03/05/2023 10:53 pm, Stefano Stabellini wrote:
> > On Wed, 3 May 2023, Julien Grall wrote:
> >> On 03/05/2023 15:38, andrew.cooper3@citrix.com wrote:
> >>> Hello,
> >>>
> >>> After what seems like an unreasonable amount of debugging, we've tracked
> >>> down exactly what is going wrong here.
> >>>
> >>> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/4219721944
> >>>
> >>> Of note is the smoke.serial log around:
> >>>
> >>> io: IN 0xffff90fec250 d0 20230503 14:20:42 INTRODUCE (1 233473 1 )
> >>> obj: CREATE connection 0xffff90fff1f0
> >>> *** d1 CONN RESET req_cons 00000000, req_prod 0000003a rsp_cons
> >>> 00000000, rsp_prod 00000000
> >>> io: OUT 0xffff9105cef0 d0 20230503 14:20:42 WATCH_EVENT
> >>> (@introduceDomain domlist )
> >>>
> >>> XS_INTRODUCE (in C xenstored at least, not checked O yet) always
> >>> clobbers the ring pointers.  The added pressure on dom0 that the
> >>> xensconsoled adds with it's 4M hypercall bounce buffer occasionally
> >>> defers xenstored long enough that the XS_INTRODUCE clobbers the first
> >>> message that dom1 wrote into the ring.
> >>>
> >>> The other behaviour seen was xenstored observing a header looking like this:
> >>>
> >>> *** d1 HDR { ty 0x746e6f63, rqid 0x2f6c6f72, txid 0x74616c70, len
> >>> 0x6d726f66 }
> >>>
> >>> which was rejected as being too long.  That's "control/platform" in
> >>> ASCII, so the XS_INTRODUCE intersected dom1 between writing the header
> >>> and writing the payload.
> >>>
> >>>
> >>> Anyway, it is buggy for XS_INTRODUCE to be called on a live an
> >>> unsuspecting connection.  It is ultimately init-dom0less's fault for
> >>> telling dom1 it's good to go before having waited for XS_INTRODUCE to
> >>> complete.
> >> So the problem is xenstored will set interface->connection to
> >> XENSTORE_CONNECTED before finalizing the connection. Caqn you try the
> >> following, for now, very hackish patch:
> >>
> >> diff --git a/tools/xenstore/xenstored_domain.c
> >> b/tools/xenstore/xenstored_domain.c
> >> index f62be2245c42..bbf85bbbea3b 100644
> >> --- a/tools/xenstore/xenstored_domain.c
> >> +++ b/tools/xenstore/xenstored_domain.c
> >> @@ -688,6 +688,7 @@ static struct domain *introduce_domain(const void *ctx,
> >>                 talloc_steal(domain->conn, domain);
> >>
> >>                 if (!restore) {
> >> +                       domain_conn_reset(domain);
> >>                         /* Notify the domain that xenstore is available */
> >>                         interface->connection = XENSTORE_CONNECTED;
> >>                         xenevtchn_notify(xce_handle, domain->port);
> >> @@ -730,8 +731,6 @@ int do_introduce(const void *ctx, struct connection *conn,
> >>         if (!domain)
> >>                 return errno;
> >>
> >> -       domain_conn_reset(domain);
> >> -
> >>         send_ack(conn, XS_INTRODUCE);
> > Following Jurgen's suggestion, I made this slightly modified version of
> > the patch. With it, the problem is solved:
> >
> > https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/856450703
> 
> This fails to solve 3(?) of the 4(?) bugs pointed out between this email
> thread and on IRC.
> 
> Stop with the bull-in-a-china-shop approach.  There is no acceptable fix
> to this mess which starts with anything other than corrections to the
> documentation, and a plan for how to make startup work robustly given
> all the bugs introduced previously by failing to do it properly the
> first time around.

I am not suggesting this is the fix (I didn't add any Signed-off-by or
commit message on purpose). I think it is useful to know if a
theoretical proposal would work in practice as it helps us understand
the problem. In the little time I had in-between meetings I thought I
could help a bit by providing this update.

Like you, I would appreciate a comprehensive fix which includes a
documentation update.

Genuine question: how would you like to proceed? In the project
management sense of who does what and what is the suggested timeline.
--8323329-1729168010-1683155543=:974517--

