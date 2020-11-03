Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 367CA2A48B6
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 15:55:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18369.43381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZxi1-0001nK-S6; Tue, 03 Nov 2020 14:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18369.43381; Tue, 03 Nov 2020 14:54:53 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZxi1-0001mv-Oi; Tue, 03 Nov 2020 14:54:53 +0000
Received: by outflank-mailman (input) for mailman id 18369;
 Tue, 03 Nov 2020 14:54:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJlZ=EJ=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1kZxi0-0001mq-Jq
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 14:54:52 +0000
Received: from se15-1.privateemail.com (unknown [198.54.127.72])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb9d0bee-02be-42cd-9d7e-7440ec0bc06b;
 Tue, 03 Nov 2020 14:54:51 +0000 (UTC)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se15.registrar-servers.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <tamas@tklengyel.com>) id 1kZxhx-0000Ws-18
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 06:54:51 -0800
Received: from MTA-13.privateemail.com (unknown [10.20.147.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id 8730BA79
 for <xen-devel@lists.xenproject.org>; Tue,  3 Nov 2020 14:54:48 +0000 (UTC)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
 by mta-13.privateemail.com (Postfix) with ESMTP id 68F7E8005C
 for <xen-devel@lists.xenproject.org>; Tue,  3 Nov 2020 09:54:48 -0500 (EST)
Received: from mail-wr1-f47.google.com (unknown [10.20.151.214])
 by mta-13.privateemail.com (Postfix) with ESMTPA id 289D280053
 for <xen-devel@lists.xenproject.org>; Tue,  3 Nov 2020 14:54:48 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id e6so1635962wro.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2020 06:54:48 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GJlZ=EJ=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
	id 1kZxi0-0001mq-Jq
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 14:54:52 +0000
X-Inumbo-ID: fb9d0bee-02be-42cd-9d7e-7440ec0bc06b
Received: from se15-1.privateemail.com (unknown [198.54.127.72])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fb9d0bee-02be-42cd-9d7e-7440ec0bc06b;
	Tue, 03 Nov 2020 14:54:51 +0000 (UTC)
Received: from new-01-3.privateemail.com ([198.54.122.47])
	by se15.registrar-servers.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <tamas@tklengyel.com>)
	id 1kZxhx-0000Ws-18
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 06:54:51 -0800
Received: from MTA-13.privateemail.com (unknown [10.20.147.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by NEW-01-3.privateemail.com (Postfix) with ESMTPS id 8730BA79
	for <xen-devel@lists.xenproject.org>; Tue,  3 Nov 2020 14:54:48 +0000 (UTC)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
	by mta-13.privateemail.com (Postfix) with ESMTP id 68F7E8005C
	for <xen-devel@lists.xenproject.org>; Tue,  3 Nov 2020 09:54:48 -0500 (EST)
Received: from mail-wr1-f47.google.com (unknown [10.20.151.214])
	by mta-13.privateemail.com (Postfix) with ESMTPA id 289D280053
	for <xen-devel@lists.xenproject.org>; Tue,  3 Nov 2020 14:54:48 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id e6so1635962wro.1
        for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2020 06:54:48 -0800 (PST)
X-Gm-Message-State: AOAM532bF4FWaXVviaOiKaJDbPyQlI3yOobPB5O3CCeOIdXvSFaqGNrf
	BP7b2T3hh4QbS14jYL1FJXwHiRevLPaD6qLXGgg=
X-Google-Smtp-Source: ABdhPJztlFXTt/NiTpg/N64/yQuCvguv67n/Kfvd7kzT7TDF/qWbcdo9StlZuLSP5vl9n0XX+CxqNuFktKING+klUb0=
X-Received: by 2002:adf:8284:: with SMTP id 4mr1620841wrc.386.1604415282581;
 Tue, 03 Nov 2020 06:54:42 -0800 (PST)
MIME-Version: 1.0
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
 <247f0d77-9447-47d0-4fa6-8e17b3e6a6de@suse.com> <60302534-1dfb-af5f-4974-1790edcb2f17@bitdefender.com>
In-Reply-To: <60302534-1dfb-af5f-4974-1790edcb2f17@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 3 Nov 2020 09:54:06 -0500
X-Gmail-Original-Message-ID: <CABfawhnh_4cYbcDjP_yC_8KrMjq=Yfd6=-9=kU+WjQjbfe7AvA@mail.gmail.com>
Message-ID: <CABfawhnh_4cYbcDjP_yC_8KrMjq=Yfd6=-9=kU+WjQjbfe7AvA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 8/8] evtchn: don't call Xen consumer callback with
 per-channel lock held
To: Isaila Alexandru <aisaila@bitdefender.com>
Cc: Jan Beulich <jbeulich@suse.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, 
	Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP
X-Originating-IP: 198.54.122.47
X-SpamExperts-Domain: o3.privateemail.com
X-SpamExperts-Username: out-03
Authentication-Results: registrar-servers.com; auth=pass (plain) smtp.auth=out-03@o3.privateemail.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.09)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0XvADx2zSFwG+3csxFBPBHmpSDasLI4SayDByyq9LIhVIUNLlB3FHTXn
 c68xm9CuSETNWdUk1Ol2OGx3IfrIJKywOmJyM1qr8uRnWBrbSAGD6dlyFUCNOm4A+RbagoqcGcXW
 KniNrlErAk1ka2x3ssWY/RLwb8LtNblQmhlQVhqrCIm7vQ+wrWho34hgmOAj3dqwTTJhLChIm0ME
 lNcQXjgsWoWxNnQGVmXmGlNWFvqPiTX6paolSqlHgPgYmEpc/CXAqEAQZXCFCwvZK9SRAKXnpk/M
 4VaHG2sgIVYJKl4PiDKbdpSbtI1rabalqsakRhVVJ2mVvokCO2vVjpfr/eX3+RWxljT0AAJgouHP
 rg5R6cTrAfIBtLJVe62uoyOAUop4cZXX4YNvBwClFIJz3G8Bi53Psle5cUmOuJZEMw7GmFVVgWdB
 XKkEH0++/JhR/Qa+FEE+TmTK/6Hl36Y/23+8Ksk+aedMfNWSnJswrtlNb4Rbo17Z1teUSazoNDZl
 dHZc3qoCx6jB3DEPYTf4NonYQ5Td2RXsWX2IABvakz06874MD/XDMPpcnv6l5Hrq7jOPc3EG53uL
 3j4HL+IhMsqbPc0mYnNMTVPrDKDVIdcLW+y7FntU/xwaLfK/la1KDKAaXVo/EC2K+bDeFIM9LXsN
 6BOoBklDmN7a6acxstx8j8QB+r6c4JMDkXz0ELFOj4DOcg83LXH4GksgCfTIQ54TKgAQriuw1aTi
 a+0Fz1FRylBJH/HZL+SBwttDp25IjkFQ4FPMf16J1ee+Ao2D6rE14O9uIBc4R2FHvu2iptL1PT/Y
 jZYaXkTFxzBWuTQERk4vidrAbzPztKfs4s5XguI1eiePaQrZKwdQXE5oc9bbgU04Eqk0ovQHihEN
 x9UXNWt2q/kTHLzyCebGKfzivszIQZBdZwQyA3WtwOFul/wCAEskSfm9PBUpgWCdb6TGLpT7gdGH
 fbJUKKBLQmc/IEXooxwbXsRR+vzvUHpiFqCMdQSGZdUgxw/2/3R/MN3ySHt7xa38BTgaUFztXoSo
 PpB5Ee/uSzbytlYMSQpUVs4HMS+4ayUpOtEhdxekWDmK9g==
X-Report-Abuse-To: spam@se5.registrar-servers.com

On Tue, Nov 3, 2020 at 5:17 AM Isaila Alexandru <aisaila@bitdefender.com> wrote:
>
>
> Hi Jan and sorry for the late reply,
>
> On 20.10.2020 17:13, Jan Beulich wrote:
> > While there don't look to be any problems with this right now, the lock
> > order implications from holding the lock can be very difficult to follow
> > (and may be easy to violate unknowingly). The present callbacks don't
> > (and no such callback should) have any need for the lock to be held.
> >
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > TODO: vm_event_disable() frees the structures used by respective
> >        callbacks - need to either use call_rcu() for freeing, or maintain
> >        a count of in-progress calls, for evtchn_close() to wait to drop
> >        to zero before dropping the lock / returning.
>
> I would go with the second solution and maintain a count of in-progress
> calls.
>
> Tamas, Petre how does this sound?

Agree, doing a reference count before freeing is preferred.

Thanks,
Tamas

