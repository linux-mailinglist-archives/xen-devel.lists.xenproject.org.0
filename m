Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D908928F546
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 16:53:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7454.19478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT4cf-00086M-Dw; Thu, 15 Oct 2020 14:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7454.19478; Thu, 15 Oct 2020 14:52:53 +0000
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
	id 1kT4cf-00085x-AY; Thu, 15 Oct 2020 14:52:53 +0000
Received: by outflank-mailman (input) for mailman id 7454;
 Thu, 15 Oct 2020 14:52:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Un/f=DW=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kT4cd-00085l-PX
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 14:52:51 +0000
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c3975da-4d0a-447b-a1f3-7f5faef25476;
 Thu, 15 Oct 2020 14:52:51 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id c21so3408915ljn.13
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 07:52:51 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Un/f=DW=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kT4cd-00085l-PX
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 14:52:51 +0000
X-Inumbo-ID: 8c3975da-4d0a-447b-a1f3-7f5faef25476
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8c3975da-4d0a-447b-a1f3-7f5faef25476;
	Thu, 15 Oct 2020 14:52:51 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id c21so3408915ljn.13
        for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 07:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bB0aML9iHly6lbfGENfyVAF9mzhMQjNP2v7ZMJRbBXc=;
        b=NYyuUoopM6Ye/9aTGGSOB131XjOnZjL/iS+3AOgzlbjqNBYntDH3hqF9Sa8z6T7qQO
         TFbfBig10huD73ZxXtbp6+MdY78PqWl46lNCDHJM4oMUiyPL/JbUuvpvSBlkaqgZ+tnf
         4zRprFMtakP7gVcQDwkAdzbbj2XVtPuDEL9MU8CfwnT1R/eg7qkNqGvCLhyf384K4Eut
         b5SOmAz6vqebc7qQRJZYfeOlodwWqVbroH95UIzhduCysDyNOWbP7yByoNfEyMNtzxlG
         STrJsFujUqu9tnOPCTY18x7xbvka2+B252zj3bRFlJvrvd7gKBrRxazqpkew1qU6YVZY
         V1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bB0aML9iHly6lbfGENfyVAF9mzhMQjNP2v7ZMJRbBXc=;
        b=sen0ngDJX9YZFTeNjP3E/zsUlcTfKb4+wXhEfEt+i1WBz7mNPyXKQ0e2udReCYN5L9
         uHPEdtzhNvwDHKmXjYqOogK/XusUyLp7sSMBOPrw0do91W6QF73RBSXJXaxCFrI9wq2G
         0zAO4ZTvxUzw44N+az4OJnLmk3qnlS+rCWUG7jokNggwhqe09FAMMhyWskgXOUspqeJs
         L+uKcZxmvt+upOnFBxgPcdO8RejPJUrGp4/jBCr2AYMLBPcrtZHhjLOOjfA83AXhM9vp
         Q6SGxO8UF0sN3ZY9TpzjBgr7oCZp//qxC1ciAPdkFG4UHtnmeeckoiA+Uc87zk+em3ak
         ncgw==
X-Gm-Message-State: AOAM532bIr+H95eEfufe4zkYHWhvZ22xT+peeQEh7nQe0dA40fhue0CJ
	MwEGs/dNiPvJlBce3ZS4ZhHdZIiI7bSX/j2GuNg=
X-Google-Smtp-Source: ABdhPJyx30xOfI/dCOEDwzdW1JN7ZaYBa0FLpSKwq8j154fT2ykNaCexw1AjUCzXXU/XmYTVCAGEXsCBq8BdXAsciwU=
X-Received: by 2002:a2e:9ccd:: with SMTP id g13mr1537362ljj.127.1602773570017;
 Thu, 15 Oct 2020 07:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20201014175342.152712-1-jandryuk@gmail.com> <20201014175342.152712-3-jandryuk@gmail.com>
 <d8a8ed95-ed55-4ccf-1b54-8d97db908742@suse.com>
In-Reply-To: <d8a8ed95-ed55-4ccf-1b54-8d97db908742@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 15 Oct 2020 10:52:38 -0400
Message-ID: <CAKf6xpv4Kborx8-0UvadyyzPRGg0TLfD1RWxmkM1PnfPKuXOaA@mail.gmail.com>
Subject: Re: [PATCH 2/2] xen: Kconfig: nest Xen guest options
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2020 at 5:42 AM J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wro=
te:
>
> On 14.10.20 19:53, Jason Andryuk wrote:
> > Moving XEN_512GB allows it to nest under XEN_PV.  That also allows
> > XEN_PVH to nest under XEN as a sibling to XEN_PV and XEN_PVHVM giving:
> >
> > [*]   Xen guest support
> > [*]     Xen PV guest support
> > [*]       Limit Xen pv-domain memory to 512GB
> > [*]       Xen PV Dom0 support
>
> This has currently a wrong text/semantics:
>
> It should be split to CONFIG_XEN_DOM0 and CONFIG_XEN_PV_DOM0.
>
> Otherwise the backends won't be enabled per default for a PVH-only
> config meant to be Dom0-capable.
>
> You don't have to do that in your patches if you don't want to, but
> I wanted to mention it with you touching this area of Kconfig.

Yes, good point.  I had not considered that.

> > [*]     Xen PVHVM guest support
> > [*]     Xen PVH guest support
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks,
Jason

