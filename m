Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A20696A1D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 17:44:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495379.765733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRyPZ-0004nj-U5; Tue, 14 Feb 2023 16:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495379.765733; Tue, 14 Feb 2023 16:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRyPZ-0004lW-QA; Tue, 14 Feb 2023 16:44:09 +0000
Received: by outflank-mailman (input) for mailman id 495379;
 Tue, 14 Feb 2023 16:44:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6HWG=6K=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pRyPY-0004lQ-BF
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 16:44:08 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb8259b0-ac86-11ed-93b5-47a8fe42b414;
 Tue, 14 Feb 2023 17:44:06 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 f47-20020a05600c492f00b003dc584a7b7eso14108915wmp.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Feb 2023 08:44:05 -0800 (PST)
Received: from [192.168.8.199] (46.204.109.85.nat.umts.dynamic.t-mobile.pl.
 [46.204.109.85]) by smtp.gmail.com with ESMTPSA id
 m23-20020a7bca57000000b003de8a1b06c0sm20662358wml.7.2023.02.14.08.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 08:44:05 -0800 (PST)
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
X-Inumbo-ID: cb8259b0-ac86-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IMpPHBh3R3g3y8/gU7zKudc6y8r/3JyW8gvF10nqUy8=;
        b=MdWMF0Gmqw71fx8shWoCJi8oiIXDP4xCCZRTorMAxLtHG8vy6nCQra976Mw3c7vn6L
         XLpefa/W1jhhfHno3jzritZ6S1y5/UHrq+ea2JiyLKXjfBPZX0gNA0gchHf3wrob/SIK
         /keViZitjtLzRfTaK8L4/xfddKCZD7LF2Y4otj8yXShunSt8PSr5BsOnCwooVQynvL1M
         PvWgrdkQ7Wq3a4EZmEWvecK/4NPBA2QyLknfscK2y990B+3Xva9CYx1yI70FC7Z4R5Vx
         PnhkrQNagudV96dWg9VOuDFRadcMEaQANatm9kZ5/Xi7z+UmVcjao5GXp4s10J1apI7D
         XVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IMpPHBh3R3g3y8/gU7zKudc6y8r/3JyW8gvF10nqUy8=;
        b=r4U4ZIaBgjw9KKuv4rc6GXSbNolnpi3G9MTzLaUfwUzOxeSVheW1cKoCDFS5AoDRCQ
         bzHOiBc26ZqxEMxxDD5ApQ3WwwSnpeL3oYHLX4AgAMfccxUXimlUTsp2g0Br3XhBJiMM
         NC507S3zuIOkzH6j851o4hY5Sm7IcuQk1sgeAcSYgACLr/plerl/KLD5vNajX7nhjZqz
         3geO8pOPu7Nbprr/wnPNn80QbSM1V7Hh6ZfL5R2/zBH+E9vcvzW9lmRROHxEMypbztmO
         v3PEEVMaMKqkFjZgZo+FPwVaPy+ZLm/fNZgRuQpJhbGGvUWK1KruaAEE4yVircWE6CXr
         4Vzg==
X-Gm-Message-State: AO0yUKVjqPYygCzWAmqD8AuKw+Xkag6Ho90oN6V0ee8MjDVCOmeZXaYr
	4Z+u1xE441RQn/oY/Cf1xO4=
X-Google-Smtp-Source: AK7set9niPDnlTjED/fbIVOIZ48TSWwlen+UwNsoe6nShyBFVMQId86KwaTk7uceK9L85IdCP6tnvA==
X-Received: by 2002:a05:600c:3318:b0:3dc:5823:d6c0 with SMTP id q24-20020a05600c331800b003dc5823d6c0mr2720387wmp.6.1676393045420;
        Tue, 14 Feb 2023 08:44:05 -0800 (PST)
Message-ID: <bf87c3570d23b58988edc8028f1e32d4465231af.camel@gmail.com>
Subject: Re: [PATCH v1 4/4] xen: change <asm/bug.h> to <xen/bug.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Tue, 14 Feb 2023 18:44:03 +0200
In-Reply-To: <e29d3f2a-84d2-c291-c479-c7be1f87b11f@suse.com>
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
	 <5a427934949e3b0cf6026c8ad6c62e37e5250ca7.1675441720.git.oleksii.kurochko@gmail.com>
	 <e29d3f2a-84d2-c291-c479-c7be1f87b11f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Mon, 2023-02-13 at 14:13 +0100, Jan Beulich wrote:
> On 03.02.2023 18:05, Oleksii Kurochko wrote:
> > Since the generic version of bug.h stuff was introduced it
> > is necessary to rename all uses of <asm/bug.h> to <xen/bug.h>
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Doesn't this change need to come ahead of at least what currently is
> patch 3?
> Or else why do you say "necessary" (I take this to mean the build
> otherwise
> is broken)? If the build works after patch 3, the change here may
> want to be
> drop the unnecessary asm/bug.h includes instead.
>=20
I'll double-check if the build works after patch 3 and fix the comment.
Thanks for the comment.
> Jan

~Oleksii


