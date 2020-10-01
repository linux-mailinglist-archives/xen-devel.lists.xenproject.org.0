Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AEA280528
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 19:28:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1553.4729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO2Mh-0007w6-Th; Thu, 01 Oct 2020 17:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1553.4729; Thu, 01 Oct 2020 17:27:35 +0000
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
	id 1kO2Mh-0007vh-Q7; Thu, 01 Oct 2020 17:27:35 +0000
Received: by outflank-mailman (input) for mailman id 1553;
 Thu, 01 Oct 2020 17:27:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=44uA=DI=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kO2Mf-0007vc-VQ
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 17:27:34 +0000
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5544eef8-9db0-4123-accd-99d919307425;
 Thu, 01 Oct 2020 17:27:33 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id w3so5330127ljo.5
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 10:27:33 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=44uA=DI=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kO2Mf-0007vc-VQ
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 17:27:34 +0000
X-Inumbo-ID: 5544eef8-9db0-4123-accd-99d919307425
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5544eef8-9db0-4123-accd-99d919307425;
	Thu, 01 Oct 2020 17:27:33 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id w3so5330127ljo.5
        for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 10:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tc1yjnWLTCX+45mL27c71YyFWgA6XWpoJIr9YEN/nLw=;
        b=k6RGaFrmzfkQGdMI2DRmbD0ZF66y/rdQvY2D+Ntekyo6rfQXxSYtwlKsGdhuinnYxF
         DvPZf4BAeTN00HHf6q6mp4H7Sk+UF7R24CxRRvYXb0qTr+ED0lN+/u7N9wbp+eAFk7T1
         /4bQiOhKp6WUxqqAGxpq6ZDyk8p6D9TMegW2JTTXY7nITEKzB9TK4pUiP2U8sTC60hhI
         WtoV/1BQXmOeleOj05CjlqCKqZJA0KNXWuahRa/2a+Ta6AB5knvFL0yl6cLgcIwd5+l0
         XTp6RK5soB3bul9DUy07CHj1r7sTLcZ5iowaE3WLNdGsfQWj5MF167K/kmbhAnKdEQ0H
         fG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tc1yjnWLTCX+45mL27c71YyFWgA6XWpoJIr9YEN/nLw=;
        b=GASlI0rqoE2DOfK5H/DVPB73kM3DNfyKKZ68GD82Kid6Cwxy1cEPj52P81T/SyV4Sj
         eJY7efocsGnP/JM6OON6jrVRTAUeIK5ubE0Nfz7qCW5YBl0bPnS6qfqLOYfS+WwYxpP0
         rCKyoOxZc7UXrfBTOFFRJWLgH3Oq/LbkSMULdvL8xcCursdmy81P+wlqm4WjvrDz2SJY
         7clzQshHD98mdaJInDhd2bj9o017/ST1nUtyUgVEFI6s8Dscs7ovOSzMI6WbInt4z1Bj
         nut71B5cUj9skIh7me7uGxu7xkpca4CTxvnNE4NHwghoDOJUnupkeioj8iRaGsEC/1qu
         KEAg==
X-Gm-Message-State: AOAM531sa0R3iHytGVBBgy9XbxKzQNetGG5xIHrPk5nJIwCRcPm3sS3i
	GXck4+1HUXDqsLKscxjA6+UuC0sYgQ9t7BM3kdI=
X-Google-Smtp-Source: ABdhPJxp2b48DoNTYqyErD3PHQTMjrHJkKhWFjIzYhguxGidgivDdpTRm9n97ggW+fHzqEIksQWaTvkCzNaP+cB7SYI=
X-Received: by 2002:a2e:8782:: with SMTP id n2mr2899705lji.262.1601573252048;
 Thu, 01 Oct 2020 10:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <f633e95e-11e7-ccfc-07ce-7cc817fcd7fe@suse.com> <e5d5dfee-aeee-ed3d-bcea-91e82198e04f@xen.org>
In-Reply-To: <e5d5dfee-aeee-ed3d-bcea-91e82198e04f@xen.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 1 Oct 2020 13:27:20 -0400
Message-ID: <CAKf6xpuhCBAAHkk4D8NKiKH3EopQTYpeN9n3E60rJUY=5_SpGg@mail.gmail.com>
Subject: Re: [PATCH] evtchn/Flask: pre-allocate node on send path
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 1, 2020 at 12:05 PM Julien Grall <julien@xen.org> wrote:
>
> Hi,
>
> On 24/09/2020 11:53, Jan Beulich wrote:
> > xmalloc() & Co may not be called with IRQs off, or else check_lock()
> > will have its assertion trigger about locks getting acquired
> > inconsistently. Re-arranging the locking in evtchn_send() doesn't seem
> > very reasonable, especially since the per-channel lock was introduced to
> > avoid acquiring the per-domain event lock on the send paths. Issue a
> > second call to xsm_evtchn_send() instead, before acquiring the lock, to
> > give XSM / Flask a chance to pre-allocate whatever it may need.
> >
> > As these nodes are used merely for caching earlier decisions' results,
> > allocate just one node in AVC code despite two potentially being needed.
> > Things will merely be not as performant if a second allocation was
> > wanted, just like when the pre-allocation fails.
> >
> > Fixes: c0ddc8634845 ("evtchn: convert per-channel lock to be IRQ-safe")
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> As discussed on the community call with one comment below:
>
> Acked-by: Julien Grall <jgrall@amazon.com>

Tested-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks,
Jason

