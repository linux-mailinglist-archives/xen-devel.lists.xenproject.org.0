Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AAC8083CD
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 10:07:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649646.1014407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBALw-00048X-QH; Thu, 07 Dec 2023 09:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649646.1014407; Thu, 07 Dec 2023 09:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBALw-00046I-Nk; Thu, 07 Dec 2023 09:07:28 +0000
Received: by outflank-mailman (input) for mailman id 649646;
 Thu, 07 Dec 2023 09:07:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y0Pn=HS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rBALv-00046A-7U
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 09:07:27 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 091e4a3d-94e0-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 10:07:24 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-54dcfca54e0so355145a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 01:07:24 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a1709061b4800b00a1933a57960sm544163ejg.22.2023.12.07.01.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 01:07:23 -0800 (PST)
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
X-Inumbo-ID: 091e4a3d-94e0-11ee-98e7-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701940044; x=1702544844; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PpnoIpCPtNNZKG13MjWQHCQtP8ts156WdNu1VBzxYzY=;
        b=e4RKWJ3CNN9txglGSCNUlHrepr+C0ieK8bx7cL5yG8/yAwd0k9F1zTBVOmT6qnwl1J
         5mnY9flTBxvDpzvZ4Pnpb0LIfk2lQHEDGgwxGM7CcoRnOLXa5YaAKR1rfnSBZ/MaUWip
         x13/6FYlncTnLyosQa8nR1xod+Ja6/Fyqr8ouQoCRS0O309VbOAHN5EYLXk1/rEsuSLv
         PtiUdO1ypLB8VmJdUYigxtLzDmZ3pDX1ZQ4gQSUdvkCFvdND0LgBlJukf1sOejK3OyYj
         OCv1WXjKkBQSSRJJcHvnihE7I0aUWAusg6oJj6VRtClXBe3C4elTWlevq8P/0uqKI71j
         v/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701940044; x=1702544844;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PpnoIpCPtNNZKG13MjWQHCQtP8ts156WdNu1VBzxYzY=;
        b=PBdjNRUkfGQYTwg1wl3Ijh0XwPnAUhDM2K6s6oSersifvVrvyQwoUTa+98hUlFjbfL
         SYZV467BxdC6RX5ZpYzIwaWXyZFX1D3OPJqi8lCkU8kZkfwdjtl5/o4v9dwEagdQDRYK
         RitDgWGhu5TyqeD3nE0Jh7dDeTP6iKXjHVwl/fkA785SqSOAmV2rjNbrdId2aLRD7Plc
         3lr36NlIH+zgXQoyrUDHkvytWncskmdzVkhl52+EGaJ/gHvn+N3iV/rf/1NnrtFIr5Lw
         hY1hr9GEp43iS8uYS74DqdZiI0goe4x/dJLxXxXYTQZRZwfayw+ZoKqin5vQUOXatImn
         3OLw==
X-Gm-Message-State: AOJu0Yxu1lbXFHOLdVUq0jLYOV+sv7k6wzfebffuVO6FiJoMey55WxVt
	az351Mu+u0zeBp9ZdlNxAmc=
X-Google-Smtp-Source: AGHT+IG86aZCgVvH1UWg+MR4LE8Z3vWuZ31nYgp5zsTBh3CT+GojA0W5OnjiqdXVo3x5v9oleEqpgg==
X-Received: by 2002:a17:906:21c:b0:a1e:91ab:ba2d with SMTP id 28-20020a170906021c00b00a1e91abba2dmr534426ejd.110.1701940043647;
        Thu, 07 Dec 2023 01:07:23 -0800 (PST)
Message-ID: <c4bf68b6008c63f9e8a631886aaa4cf5e1398e80.camel@gmail.com>
Subject: Re: [PATCH 1/3] xen/ppc: Enable Boot Allocator
From: Oleksii <oleksii.kurochko@gmail.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Julien Grall
	 <julien@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>, 
	xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>, Jan Beulich
	 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
	Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Date: Thu, 07 Dec 2023 11:07:22 +0200
In-Reply-To: <a6400750-fd17-4452-a60d-bd9307825548@apertussolutions.com>
References: <cover.1701384928.git.sanastasio@raptorengineering.com>
	 <5ed3351f7824a5d0a1ff29c17cb55b2608f28109.1701384928.git.sanastasio@raptorengineering.com>
	 <938b9bfe-fba0-4c77-b2e5-fb79fb316ab4@xen.org>
	 <a6400750-fd17-4452-a60d-bd9307825548@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

On Wed, 2023-12-06 at 21:01 -0500, Daniel P. Smith wrote:
> On 12/1/23 15:56, Julien Grall wrote:
> > (+ Arm and RISC-V folks)
> >=20
> > Hi Shawn,
> >=20
> > On 01/12/2023 20:59, Shawn Anastasio wrote:
> > > Adapt arm's earlyfdt parsing code to ppc64 and enable Xen's early
> > > boot
> > > allocator. Routines for parsing arm-specific devicetree nodes
> > > (e.g.
> > > multiboot) were excluded, reducing the overall footprint of code
> > > that
> > > was copied.
> >=20
> > I expect RISC-V to want similar code. I am not really thrilled in
> > the=20
> > idea of having 3 similar copy of the parsing. So can we extract the
> > common bits (or harmonize it) so it can be shared?
>=20
> That is actually 4, Hyperlaunch already did a common version for our
> usage.
Sounds great. I'll look at and switch RISC-V to it. Thanks.
>=20
> > Maybe Oleksii has already a version doing that.
> >=20
> > Cheers,
> >=20
>=20
>=20
>=20
> V/r,
> Daniel P. Smith
> Apertus Solutions, LLC
>=20


