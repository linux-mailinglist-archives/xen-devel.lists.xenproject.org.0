Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E741CE839
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 00:38:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYH2x-0001xk-I1; Mon, 11 May 2020 22:37:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U+Ik=6Z=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jYH2w-0001xf-5v
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 22:37:14 +0000
X-Inumbo-ID: f4fc208d-93d7-11ea-a260-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4fc208d-93d7-11ea-a260-12813bfff9fa;
 Mon, 11 May 2020 22:37:13 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B0AEC2070B;
 Mon, 11 May 2020 22:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589236633;
 bh=faqbtFB4H4RaJrawnQWAiM8zc0Du1EsVBGZThV+qQi0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=MGwM7pHEkN2CUXvMpM7AhYZC10Bn4P4gPwXAgo9kqZWzIFyzjhm5/cLCg9oJnM5bB
 CcRfy0+Yc2Y/ctFd83IU/VS0gYNDh75AyD+OxCuKYzrCQoNt9biGq29oAnEnNDv9nI
 eR4y3z+BLrEPqtkoI7BvPRNbJueHA9J9AE1/yB4w=
Date: Mon, 11 May 2020 15:37:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] optee: immediately free buffers that are released by
 OP-TEE
In-Reply-To: <f4e1cc2b-97bf-d242-8f1b-e72083f378be@citrix.com>
Message-ID: <alpine.DEB.2.21.2005111534160.26167@sstabellini-ThinkPad-T480s>
References: <20200506014246.3397490-1-volodymyr_babchuk@epam.com>
 <51b8c855-5e94-2829-a703-d43c84948120@xen.org>
 <f4e1cc2b-97bf-d242-8f1b-e72083f378be@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1829641898-1589236632=:26167"
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1829641898-1589236632=:26167
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 11 May 2020, Andrew Cooper wrote:
> On 11/05/2020 10:34, Julien Grall wrote:
> > Hi Volodymyr,
> >
> > On 06/05/2020 02:44, Volodymyr Babchuk wrote:
> >> Normal World can share buffer with OP-TEE for two reasons:
> >> 1. Some client application wants to exchange data with TA
> >> 2. OP-TEE asks for shared buffer for internal needs
> >>
> >> The second case was handle more strictly than necessary:
> >>
> >> 1. In RPC request OP-TEE asks for buffer
> >> 2. NW allocates buffer and provides it via RPC response
> >> 3. Xen pins pages and translates data
> >> 4. Xen provides buffer to OP-TEE
> >> 5. OP-TEE uses it
> >> 6. OP-TEE sends request to free the buffer
> >> 7. NW frees the buffer and sends the RPC response
> >> 8. Xen unpins pages and forgets about the buffer
> >>
> >> The problem is that Xen should forget about buffer in between stages 6
> >> and 7. I.e. the right flow should be like this:
> >>
> >> 6. OP-TEE sends request to free the buffer
> >> 7. Xen unpins pages and forgets about the buffer
> >> 8. NW frees the buffer and sends the RPC response
> >>
> >> This is because OP-TEE internally frees the buffer before sending the
> >> "free SHM buffer" request. So we have no reason to hold reference for
> >> this buffer anymore. Moreover, in multiprocessor systems NW have time
> >> to reuse buffer cookie for another buffer. Xen complained about this
> >> and denied the new buffer registration. I have seen this issue while
> >> running tests on iMX SoC.
> >>
> >> So, this patch basically corrects that behavior by freeing the buffer
> >> earlier, when handling RPC return from OP-TEE.
> >>
> >> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> >> ---
> >>   xen/arch/arm/tee/optee.c | 24 ++++++++++++++++++++----
> >>   1 file changed, 20 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
> >> index 6a035355db..af19fc31f8 100644
> >> --- a/xen/arch/arm/tee/optee.c
> >> +++ b/xen/arch/arm/tee/optee.c
> >> @@ -1099,6 +1099,26 @@ static int handle_rpc_return(struct
> >> optee_domain *ctx,
> >>           if ( shm_rpc->xen_arg->cmd == OPTEE_RPC_CMD_SHM_ALLOC )
> >>               call->rpc_buffer_type =
> >> shm_rpc->xen_arg->params[0].u.value.a;
> >>   +        /*
> >> +         * OP-TEE signals that it frees the buffer that it requested
> >> +         * before. This is the right for us to do the same.
> >> +         */
> >> +        if ( shm_rpc->xen_arg->cmd == OPTEE_RPC_CMD_SHM_FREE )
> >> +        {
> >> +            uint64_t cookie = shm_rpc->xen_arg->params[0].u.value.b;
> >> +
> >> +            free_optee_shm_buf(ctx, cookie);
> >> +
> >> +            /*
> >> +             * This should never happen. We have a bug either in the
> >> +             * OP-TEE or in the mediator.
> >> +             */
> >> +            if ( call->rpc_data_cookie && call->rpc_data_cookie !=
> >> cookie )
> >> +                gprintk(XENLOG_ERR,
> >> +                        "Saved RPC cookie does not corresponds to
> >> OP-TEE's (%"PRIx64" != %"PRIx64")\n",
> >
> > s/corresponds/correspond/
> >
> >> +                        call->rpc_data_cookie, cookie);
> >
> > IIUC, if you free the wrong SHM buffer then your guest is likely to be
> > running incorrectly afterwards. So shouldn't we crash the guest to
> > avoid further issue?
> 
> No - crashing the guest prohibits testing of the interface, and/or the
> guest realising it screwed up and dumping enough state to usefully debug
> what is going on.
> 
> Furthermore, if userspace could trigger this path, we'd have to issue an
> XSA.
> 
> Crashing the guest is almost never the right thing to do, and definitely
> not appropriate for a bad parameter.

Maybe we want to close the OPTEE interface for the guest, instead of
crashing the whole VM. I.e. freeing the OPTEE context for the domain
(d->arch.tee)?

But I think the patch is good as it is honestly.
--8323329-1829641898-1589236632=:26167--

