Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A95F86FDFC
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 10:51:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688245.1072235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh4y3-0002G3-OA; Mon, 04 Mar 2024 09:50:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688245.1072235; Mon, 04 Mar 2024 09:50:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh4y3-0002Cu-KV; Mon, 04 Mar 2024 09:50:43 +0000
Received: by outflank-mailman (input) for mailman id 688245;
 Mon, 04 Mar 2024 09:50:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7SCY=KK=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rh4y2-0002Co-NI
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 09:50:42 +0000
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [2607:f8b0:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a89af9e7-da0c-11ee-a1ee-f123f15fe8a2;
 Mon, 04 Mar 2024 10:50:40 +0100 (CET)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3bbbc6e51d0so3249456b6e.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 01:50:40 -0800 (PST)
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
X-Inumbo-ID: a89af9e7-da0c-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709545839; x=1710150639; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xoCcnB+gmyD3hwUM672Y7W5xCmiCuFgtmu6gmGhOhTA=;
        b=Td7CuKPHMhcCNNOPlz3FFPLaEe7eFzelXI8q9IAbCoidvDjfyP5HnpoVBIH+04n8QR
         pbzosGlK1uRgk17/+ys1X439dCZOSlCN4X+GjCxgntk9EubQ3cGj1zUuW4Lx0tlQ+MIx
         9ygAoqrBwSAJInkrzXEF6p+h9KO/YnfK1TO4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709545839; x=1710150639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoCcnB+gmyD3hwUM672Y7W5xCmiCuFgtmu6gmGhOhTA=;
        b=I3HBLXjcRpU93vT4oOuNMoPZdTlnWFNDjGtIXt/e2Ia+x8i4khoSHdN4E8BJmieKJz
         D3eNGX6Dim8HOZNFpqdRABxdIcsPKQvv2ECUAMS8tXtI2Loaf1HdQP51NcNy4A7wOWt/
         BV79bmpXJUpTMeblmCky2YsuhpjgESq1nzS1EQpmimE5L+NKnafkGE/2DBmlk5wOcMHq
         Z2BmfwiQB8IXxErAV9qqVH0EHgPknQ02g48aaoPtrIYt5+ZkxXUz0owvnV2OvjyL3kUW
         PM3uMG8BmnvQl32pLNNftUdV2MuteqfKD6/mCSjK/zHxz5Kgg4EHWk0mvBSLBXceK4dy
         IGww==
X-Gm-Message-State: AOJu0YyEhW3lAkpugw6gK2S6uUmtChy0bp1DbuyuJ8pFsFz5hevRxFem
	U9/TMwnlx5gVQfe8IqHa/KqEypPPGQYmV8MAYjQRCGFW5WgIHEBsuMr0RLEDq+xRw88utZtSeyc
	lxIms6CUaFjePcB0Z75Dzl4Vqv1TwpaD5NzH9Rw==
X-Google-Smtp-Source: AGHT+IFdbm1pMRxTI/HkbkS3IwdAs1NkcByz0qE4XuiZyzUF1+DgdSTKKQoKJyNGKyLTghLl9wZpSKqlzirGHDf3Qfk=
X-Received: by 2002:a05:6870:ef86:b0:21e:be10:f39d with SMTP id
 qr6-20020a056870ef8600b0021ebe10f39dmr8723221oab.46.1709545839266; Mon, 04
 Mar 2024 01:50:39 -0800 (PST)
MIME-Version: 1.0
References: <20240206012051.3564035-1-george.dunlap@cloud.com>
 <20240206012051.3564035-6-george.dunlap@cloud.com> <03677752-2a39-4090-8d8b-12a82d82030d@citrix.com>
In-Reply-To: <03677752-2a39-4090-8d8b-12a82d82030d@citrix.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 4 Mar 2024 17:50:28 +0800
Message-ID: <CA+zSX=bmUUpzb9v7WUftUxr-BCMHQNAiMh+hmBm+1zH81bWeXw@mail.gmail.com>
Subject: Re: [PATCH 5/6] nestedsvm: Remove bogus debug message from nestedsvm_check_intercepts
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 12:47=E2=80=AFAM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 06/02/2024 1:20 am, George Dunlap wrote:
> > Changeset ef3e8db8068 ("x86/hvm: Corrections and improvements to
> > unhandled vmexit logging") introduced a printk to the default path of
> > the switch statement in nestedsvm_check_intercepts(), complaining of
> > an unknown exit reason.
> >
> > Unfortunately, the "core" switch statement which is meant to handle
> > all vmexit reasons is in nsvm_vmcb_guest_intercepts_exitcode(); the
> > switch statement in nestedsvm_check_intercepts() is only meant to
> > superimpose on top of that some special-casing for how to interaction
> > between L1 and L0 vmexits.
> >
> > Remove the printk, and add a comment to prevent future confusion.
> >
> > Signed-off-by: George Dunlap <george.dunlap@cloud.com>
>
> Erm...   The addition of this printk was very deliberate, to point out
> where security fixes are needed.
>
> It's not bogus in the slightest.  It is an error for exit reasons to not
> be inspected for safety in this path.

I'm a bit at a loss how to respond to this.  As I wrote above, exit
reasons are inspected for safety in this path -- in
nsvm_vmcb_guest_intercepts_exitcode().  If you want the patch
reverted, you'll have to explain why that's not sufficient.

 -George

