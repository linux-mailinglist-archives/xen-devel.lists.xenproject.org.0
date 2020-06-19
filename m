Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B33220043C
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 10:41:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmCa5-0006px-QS; Fri, 19 Jun 2020 08:41:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jg7u=AA=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jmCa3-0006ps-Uc
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 08:41:00 +0000
X-Inumbo-ID: 98b5ad30-b208-11ea-bca7-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98b5ad30-b208-11ea-bca7-bc764e2007e4;
 Fri, 19 Jun 2020 08:40:58 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t13so6417692wrs.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2020 01:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=tPIVcPOh9X2NVe2nN9LV2R3qW5V9zX1EvT4m1GHYZj4=;
 b=N+ifp5rlDp5SDl7qaGVjc2BywRzFQLcmaWaInLHUlI1ANG4ML9T55D/T1KdnriDztN
 5TUlpSAscMu+4RYXaw/6tl5Rh6S/yUz63rIDLas43wZMp2mr4wvQTDeaipVyblgAIy6G
 g8uaOAuxT45nVLyi6IKLAbegGjasJxytO7oCB8epw2lnxOAftjnVy5RCkkVFykjOPZ7G
 gwfkfHLpbZ0BRP+pDmoDqL67Z6Q5ixWqQbtkwHHd0GipMD5vC32GRXkmchN3godX+NmU
 vFlY+dUbr/tOGjovs7HVNBCvGtwyHjiekrBItlmUKwkBR+XuV+2jJFcO2ZUg+f+udErO
 hWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=tPIVcPOh9X2NVe2nN9LV2R3qW5V9zX1EvT4m1GHYZj4=;
 b=Gb9Ox/VWQh/AUbtRffRZExlbEEqdDqLPxJG3fna1rrKuVepWwhKoJweL3KqFXKrDk4
 eFrYDi7uuqrlS90UPCcoSGeI7Y67eX8Ledj71Puy/bZSchfEro/Q13YUMNYkUQ2fIvz9
 EQjk9CEi8NrG3dBvu41TSkFXeHG8Kio0GjtwpBl1Gw4aBi/JUbMmSJMWr9ZcdKTOlE5G
 f580AsntDu4kkeFaUKlhIS2Kt6mkMXqOeFHVWxrBQTkLyw4UDh2gh6iqTL7qV880RTp0
 5mixTkMvp+RV+SE8xzAvoN9QqPNQtnD+wDv5S+7ajY19OXuPfI5DRYRVsgEvcAagDXcV
 qTGQ==
X-Gm-Message-State: AOAM533BdMzBlMxvthVTy0SrU+pkXk4lcSxdtLcvsKgQNPsH8E6aHkHQ
 RI/C1FL2GFExwxpxkDj90cs=
X-Google-Smtp-Source: ABdhPJwPirNlXIVk7lJXXph+kEmtOaXhxUQz1BUt+HRAA3IQKAJ1co98aVEwVdHjvoY/rWbORtjTpw==
X-Received: by 2002:adf:f70e:: with SMTP id r14mr3054581wrp.150.1592556057574; 
 Fri, 19 Jun 2020 01:40:57 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id r12sm6472281wrc.22.2020.06.19.01.40.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jun 2020 01:40:56 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Stefano Stabellini'" <sstabellini@kernel.org>, <xadimgnik@gmail.com>,
 <pdurrant@amazon.co.uk>
References: <20200506014246.3397490-1-volodymyr_babchuk@epam.com>
 <51b8c855-5e94-2829-a703-d43c84948120@xen.org>
 <f4e1cc2b-97bf-d242-8f1b-e72083f378be@citrix.com>
 <alpine.DEB.2.21.2005111534160.26167@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2006181518470.14005@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2006181520390.14005@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2006181520390.14005@sstabellini-ThinkPad-T480s>
Subject: RE: [PATCH] optee: immediately free buffers that are released by
 OP-TEE
Date: Fri, 19 Jun 2020 09:40:55 +0100
Message-ID: <00a701d64615$59d076e0$0d7164a0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQKXhFJJ4ChNwzgTFWNefwS6FU305wI2G0MJA0Yfo+0BhgRBlwL2OG+uAiWMtYCm/DAoEA==
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: tee-dev@lists.linaro.org, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Julien Grall' <julien@xen.org>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Sent: 18 June 2020 23:21
> To: xadimgnik@gmail.com; pdurrant@amazon.co.uk
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Julien Grall =
<julien@xen.org>; Volodymyr Babchuk
> <Volodymyr_Babchuk@epam.com>; xen-devel@lists.xenproject.org; =
tee-dev@lists.linaro.org
> Subject: Re: [PATCH] optee: immediately free buffers that are released =
by OP-TEE
>=20
> Actually adding Paul
>=20
>=20
> On Thu, 18 Jun 2020, Stefano Stabellini wrote:
> > Hi Paul, Julien,
> >
> > Volodymyr hasn't come back with an update to this patch, but I think =
it
> > is good enough as-is as a bug fix and I would rather have it in its
> > current form in 4.14 than not having it at all leaving the bug =
unfixed.
> >
> > I think Julien agrees.
> >
> >
> > Paul, are you OK with this?

I will take my direction from the maintainers as to whether this fixes a =
critical issue and hence is a candidate for 4.14. If Volodymyr doesn't =
come back with a v2 then I would at least want a formal ack of this =
patch, and the cosmetic change requested by Julien fixed on commit, as =
well as...

> >
> >
> >
> > On Mon, 11 May 2020, Stefano Stabellini wrote:
> > > On Mon, 11 May 2020, Andrew Cooper wrote:
> > > > On 11/05/2020 10:34, Julien Grall wrote:
> > > > > Hi Volodymyr,
> > > > >
> > > > > On 06/05/2020 02:44, Volodymyr Babchuk wrote:
> > > > >> Normal World can share buffer with OP-TEE for two reasons:
> > > > >> 1. Some client application wants to exchange data with TA
> > > > >> 2. OP-TEE asks for shared buffer for internal needs
> > > > >>
> > > > >> The second case was handle more strictly than necessary:
> > > > >>
> > > > >> 1. In RPC request OP-TEE asks for buffer
> > > > >> 2. NW allocates buffer and provides it via RPC response
> > > > >> 3. Xen pins pages and translates data
> > > > >> 4. Xen provides buffer to OP-TEE
> > > > >> 5. OP-TEE uses it
> > > > >> 6. OP-TEE sends request to free the buffer
> > > > >> 7. NW frees the buffer and sends the RPC response
> > > > >> 8. Xen unpins pages and forgets about the buffer
> > > > >>
> > > > >> The problem is that Xen should forget about buffer in between =
stages 6
> > > > >> and 7. I.e. the right flow should be like this:
> > > > >>
> > > > >> 6. OP-TEE sends request to free the buffer
> > > > >> 7. Xen unpins pages and forgets about the buffer
> > > > >> 8. NW frees the buffer and sends the RPC response
> > > > >>
> > > > >> This is because OP-TEE internally frees the buffer before =
sending the
> > > > >> "free SHM buffer" request. So we have no reason to hold =
reference for
> > > > >> this buffer anymore. Moreover, in multiprocessor systems NW =
have time
> > > > >> to reuse buffer cookie for another buffer. Xen complained =
about this
> > > > >> and denied the new buffer registration. I have seen this =
issue while
> > > > >> running tests on iMX SoC.
> > > > >>
> > > > >> So, this patch basically corrects that behavior by freeing =
the buffer
> > > > >> earlier, when handling RPC return from OP-TEE.
> > > > >>
> > > > >> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> > > > >> ---
> > > > >>   xen/arch/arm/tee/optee.c | 24 ++++++++++++++++++++----
> > > > >>   1 file changed, 20 insertions(+), 4 deletions(-)
> > > > >>
> > > > >> diff --git a/xen/arch/arm/tee/optee.c =
b/xen/arch/arm/tee/optee.c
> > > > >> index 6a035355db..af19fc31f8 100644
> > > > >> --- a/xen/arch/arm/tee/optee.c
> > > > >> +++ b/xen/arch/arm/tee/optee.c
> > > > >> @@ -1099,6 +1099,26 @@ static int handle_rpc_return(struct
> > > > >> optee_domain *ctx,
> > > > >>           if ( shm_rpc->xen_arg->cmd =3D=3D =
OPTEE_RPC_CMD_SHM_ALLOC )
> > > > >>               call->rpc_buffer_type =3D
> > > > >> shm_rpc->xen_arg->params[0].u.value.a;
> > > > >>   +        /*
> > > > >> +         * OP-TEE signals that it frees the buffer that it =
requested
> > > > >> +         * before. This is the right for us to do the same.
> > > > >> +         */

...this comment being re-worded:

"OP-TEE is signalling that it has freed the buffer that it requested =
before. This is the right time for us to do the same."

perhaps?

  Paul

> > > > >> +        if ( shm_rpc->xen_arg->cmd =3D=3D =
OPTEE_RPC_CMD_SHM_FREE )
> > > > >> +        {
> > > > >> +            uint64_t cookie =3D =
shm_rpc->xen_arg->params[0].u.value.b;
> > > > >> +
> > > > >> +            free_optee_shm_buf(ctx, cookie);
> > > > >> +
> > > > >> +            /*
> > > > >> +             * This should never happen. We have a bug =
either in the
> > > > >> +             * OP-TEE or in the mediator.
> > > > >> +             */
> > > > >> +            if ( call->rpc_data_cookie && =
call->rpc_data_cookie !=3D
> > > > >> cookie )
> > > > >> +                gprintk(XENLOG_ERR,
> > > > >> +                        "Saved RPC cookie does not =
corresponds to
> > > > >> OP-TEE's (%"PRIx64" !=3D %"PRIx64")\n",
> > > > >
> > > > > s/corresponds/correspond/
> > > > >
> > > > >> +                        call->rpc_data_cookie, cookie);
> > > > >
> > > > > IIUC, if you free the wrong SHM buffer then your guest is =
likely to be
> > > > > running incorrectly afterwards. So shouldn't we crash the =
guest to
> > > > > avoid further issue?
> > > >
> > > > No - crashing the guest prohibits testing of the interface, =
and/or the
> > > > guest realising it screwed up and dumping enough state to =
usefully debug
> > > > what is going on.
> > > >
> > > > Furthermore, if userspace could trigger this path, we'd have to =
issue an
> > > > XSA.
> > > >
> > > > Crashing the guest is almost never the right thing to do, and =
definitely
> > > > not appropriate for a bad parameter.
> > >
> > > Maybe we want to close the OPTEE interface for the guest, instead =
of
> > > crashing the whole VM. I.e. freeing the OPTEE context for the =
domain
> > > (d->arch.tee)?
> > >
> > > But I think the patch is good as it is honestly.


