Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE35479163A
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 13:28:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595086.928570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd7kS-0006xO-6l; Mon, 04 Sep 2023 11:28:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595086.928570; Mon, 04 Sep 2023 11:28:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd7kS-0006u2-4C; Mon, 04 Sep 2023 11:28:04 +0000
Received: by outflank-mailman (input) for mailman id 595086;
 Mon, 04 Sep 2023 11:28:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SRlT=EU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qd7kQ-0006tw-Ei
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 11:28:02 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a25d27d-4b16-11ee-9b0d-b553b5be7939;
 Mon, 04 Sep 2023 13:27:59 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5008faf4456so2060033e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Sep 2023 04:28:00 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a056512348300b005008b8dd56csm1699210lfr.44.2023.09.04.04.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 04:27:59 -0700 (PDT)
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
X-Inumbo-ID: 1a25d27d-4b16-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693826880; x=1694431680; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=87oJpJO59HBiBG6+j0oIk0WQCxoHB94G7LqpEKHqGzc=;
        b=JVRzaWEZ5+TdPzZNVAeOQC8JcTgyB93vkjnVcT7IIR+hXSWz07LS+W0O5zfjUi+mpQ
         HIKpEdMNfPQ1N0deu1PgANwfwkTusSjgz2fo+Hf8/jZ5W05KBSAKSNRY7Q4U/Cr4Y6qH
         L6VsDCwihsjTUpGJ2INcNtJCuGROFQ2vr6xvRQ2z+PmmW2o2Ep3G68RYt8zdUy1KlTUF
         o41USpMrzqa53uuxX1jcZ5LbDk1BixqXQyOniCD6Z2P3yxlLHIRBx+6nljLtbiFKoQSH
         b/sImB+JUaNAqEbqSgIfATl/6THPA5184CsDu7gU/4PIzrEuJDlsgkBYdjN113d+Bx/v
         lGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693826880; x=1694431680;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=87oJpJO59HBiBG6+j0oIk0WQCxoHB94G7LqpEKHqGzc=;
        b=ZEqKZ4TkdxsMahP21rHezTtq5DeWU3Y7AmOSWBxGrG03mRxE/PLRNf8t7mJgXKTGgn
         q9PHn6QvNSLnWv2MwvIbQ63RIx8luPduPnvyNBWtid/AkPXERrMYQwmlD02ZJGQfXSL2
         D8YO9tEZVDQFkIM7J/tg+2o651PKV+lpL4l1Eh7Z7Nhgb0eRV5ozxLSa0EnZXwQ0oQVg
         5yPRThjp50Qc0sO67ZJUwkD7KIqXZwEAHlQSAjf/ajtoBWdU9FjKW6zXaJw7btPuuCkJ
         1tRStxQ4aQ7dSt44s6hjxkx7gkC+4vIjj9nLHAyNHaVBwgdqgHt1dDPyU5HEF5qQ6KBI
         UAyA==
X-Gm-Message-State: AOJu0Yxj7ytGEJOv+6pAgOOMa6M7Xa1xQC5M+h9GTwheaGMpW8+seAH9
	3XK9fKV95Cpz2INy413q/nJCCG4H37g=
X-Google-Smtp-Source: AGHT+IE+eIY4N4hrd/MXexn38r73SBd/c4eg7u7H8oAJUp/F53iluQptAUdWh2y6UpwSPpOoDzxZLQ==
X-Received: by 2002:a05:6512:3e1f:b0:4fa:21d4:b3ca with SMTP id i31-20020a0565123e1f00b004fa21d4b3camr7383202lfv.2.1693826879641;
        Mon, 04 Sep 2023 04:27:59 -0700 (PDT)
Message-ID: <82ab4853d53b7e45525b1f5293a2ccc7340dc869.camel@gmail.com>
Subject: Re: [PATCH v4 2/2] xen: move arm/include/asm/vm_event.h to
 asm-generic
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 04 Sep 2023 14:27:58 +0300
In-Reply-To: <50ee02b6-45b1-9664-c001-31233c6fd47a@suse.com>
References: <cover.1693583721.git.oleksii.kurochko@gmail.com>
	 <0d273a71bb3caca894485a33970a81ec9a9f44e5.1693583721.git.oleksii.kurochko@gmail.com>
	 <CAMacjJz4-Zd8ferGuZKh83qiUCw_hh91Rep903Qys6pAx3kDfQ@mail.gmail.com>
	 <50ee02b6-45b1-9664-c001-31233c6fd47a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-09-04 at 08:53 +0200, Jan Beulich wrote:
> On 01.09.2023 19:14, Oleksii Kurochko wrote:
> > The change which adds generic-y +=3D vm_event.h to ARM's Kbuild was
> > lost
> > during creation of the patch. Should be added in the next patch
> > version
>=20
> Which I guess is an indication that ...
>=20
> > On Fri, Sep 1, 2023, 18:02 Oleksii Kurochko
> > <oleksii.kurochko@gmail.com>
> > wrote:
> >=20
> > > asm/vm_event.h is common for ARM and RISC-V so it will be moved
> > > to
> > > asm-generic dir.
> > >=20
> > > Original asm/vm_event.h from ARM was updated:
> > > =C2=A0* use SPDX-License-Identifier.
> > > =C2=A0* update comment messages of stubs.
> > > =C2=A0* update #ifdef.
> > > =C2=A0* change public/domctl.h to public/vm_event.h.
> > >=20
> > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>=20
> ... any earlier acks would better have been dropped.
You are right. I will remove acked-by in the next patch series version.

~ Oleksii


