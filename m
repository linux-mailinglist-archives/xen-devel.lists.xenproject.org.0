Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D84128F53A
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 16:51:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7448.19463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT4b1-0007v9-0H; Thu, 15 Oct 2020 14:51:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7448.19463; Thu, 15 Oct 2020 14:51:10 +0000
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
	id 1kT4b0-0007ty-T3; Thu, 15 Oct 2020 14:51:10 +0000
Received: by outflank-mailman (input) for mailman id 7448;
 Thu, 15 Oct 2020 14:51:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Un/f=DW=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kT4az-0007ta-9U
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 14:51:09 +0000
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ce8ef06-f75a-46f2-95d7-d9fa7b388a48;
 Thu, 15 Oct 2020 14:51:08 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id r127so3884008lff.12
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 07:51:08 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Un/f=DW=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kT4az-0007ta-9U
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 14:51:09 +0000
X-Inumbo-ID: 0ce8ef06-f75a-46f2-95d7-d9fa7b388a48
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0ce8ef06-f75a-46f2-95d7-d9fa7b388a48;
	Thu, 15 Oct 2020 14:51:08 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id r127so3884008lff.12
        for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 07:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bV4f1Qg+4Gv35N2wit/f7NjVpNxZdd3YNwQ6SWe/ma0=;
        b=OYat1tu/tT4xPSTOsQRpW6iStW0f2RAvrVqZM2wKYQ5qUpvTlkK0tW9fFDuKWCuYbx
         Ncv0Ts6rNHB0uqaIpNXIlQ0S7DkES1kA/yhljcF4/ynUIzo2tM/o87WVzk1bRBbjMP4B
         cSDdjZaLugIPplKKgZSVVV3mPnKPKuLVd8WksM8JbCG0OUG/fF4UUP3GMaKhdlwT/+zV
         HsXGKLICg97DrPVSd3rJxLq7PJBzjYNu3PyZJmM3JVfYKMvtP01owdX2hLVjWhsfVufr
         +rj+v3YZWE2VDHu65ilvtRlhbs8cnQqPZdBP9vlMVxEzgioF/fPt6CY7wLSadZ3WeNds
         7rrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bV4f1Qg+4Gv35N2wit/f7NjVpNxZdd3YNwQ6SWe/ma0=;
        b=cljIdth65gARwi+dKONofHoInrsAE00/k8u/T+mWaZyc07xWxxOVN1dFGBOiIVrOTE
         YHzav0UfEoxzZ4JifhvXAE9iev8bX+WrmhI/VvpwzZUkeRA3Ti+ZT+FPDWHeKC/hjCMG
         tgDWMnf4CTB4/IVgCfTdtQAM7JwDXOrZ/m0KwRGmLP98aX+9JG+SWw/ni5vDvxvXJMZc
         Vpwxn8O8Ku/PJLWpTjfoP2YzWOAXHk2B1Btgq2RYBaRjI37f43EK3msEm09HZhIbksV9
         rV8rfz7YXNkf6U212VOacIvXLopf3dTqlFkaKXuy41ylPE0fjS0L/o3NITbjW81PDooM
         pO3Q==
X-Gm-Message-State: AOAM5332XBtGOE4TZe+cXUtKICRDYoQXGwRz9W9Te+B+2o+Frnx3sVWG
	pflVsVBfPli3FLqduqdThmBlVYmbEhvYbBU5G7I=
X-Google-Smtp-Source: ABdhPJz4cz6ryROltTYzKnZPApyMbINiaXN8B0RTQpbg1uR4m85nIpOyOyacfPQKPIETr+/AP5JTkJuMVSaTsmdK8zM=
X-Received: by 2002:ac2:52b7:: with SMTP id r23mr1126232lfm.30.1602773467610;
 Thu, 15 Oct 2020 07:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201014175342.152712-1-jandryuk@gmail.com> <20201014175342.152712-3-jandryuk@gmail.com>
 <6cd9363c-ac0c-ea68-c8e7-9fd3cd30a89b@oracle.com> <4e31301b-0e57-ac89-cd71-6ad5e1a66628@citrix.com>
 <b097aec1-e549-a89a-ce43-e9c0a71179f2@oracle.com>
In-Reply-To: <b097aec1-e549-a89a-ce43-e9c0a71179f2@oracle.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 15 Oct 2020 10:50:55 -0400
Message-ID: <CAKf6xpuRZKF56yyOR-Q6oBSJUpRSr0P+XVJD7DvaS6GWnNcMTg@mail.gmail.com>
Subject: Re: [PATCH 2/2] xen: Kconfig: nest Xen guest options
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 15, 2020 at 9:17 AM <boris.ostrovsky@oracle.com> wrote:
>
>
> On 10/15/20 9:10 AM, Andrew Cooper wrote:
> > On 15/10/2020 13:37, boris.ostrovsky@oracle.com wrote:
> >> On 10/14/20 1:53 PM, Jason Andryuk wrote:
> >>> +config XEN_512GB
> >>> +   bool "Limit Xen pv-domain memory to 512GB"
> >>> +   depends on XEN_PV && X86_64
> >> Why is X86_64 needed here?
> >> 512G support was implemented using a direct-mapped P2M, and is rather
> > beyond the virtual address capabilities of 32bit.
> >
>
> Yes, my point was that XEN_PV already depends on X86_64.

Oh, thanks for catching this.  I re-introduced it by accident when
rebasing the patches.

Regards,
Jason

