Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBF298775D
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 18:11:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805706.1216888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1str5a-0008C6-Ie; Thu, 26 Sep 2024 16:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805706.1216888; Thu, 26 Sep 2024 16:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1str5a-00088n-Ex; Thu, 26 Sep 2024 16:11:34 +0000
Received: by outflank-mailman (input) for mailman id 805706;
 Thu, 26 Sep 2024 16:11:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=roLj=QY=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1str5Z-0007mE-2w
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 16:11:33 +0000
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [2607:f8b0:4864:20::1033])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe42f382-7c21-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 18:11:32 +0200 (CEST)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2e09ff2d890so668058a91.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 09:11:32 -0700 (PDT)
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
X-Inumbo-ID: fe42f382-7c21-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727367091; x=1727971891; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVw12OEDNKdoyn5atqj3yHHggi7Xj+gtLOUwNfZozIE=;
        b=deHxHZlhNo64CUnqs3OI6JBPVSEwhTBwjYjxSFQPGHmfrfNe8Z0k7VKzdDGjNbRHFA
         6qyctXZbXEu0+2TseQv6ZYJ79uUucgwJdhQN1JP3C2JMdRbhZBJaVfzzKJouIND2+MSk
         PouEpNva9COgOHMxEiG9S4lAua8MUr+XwXUqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727367091; x=1727971891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VVw12OEDNKdoyn5atqj3yHHggi7Xj+gtLOUwNfZozIE=;
        b=Mno2lkY1/MyDOzZnohHQxq/JI6iNWfTcWwC/penG9ewTdw7svKTbb4M58WMlS+aseI
         wzB3wPgXAHKTGRlxIS/O7aM3ZcW4eGcN7PMf3RCCRH/z9cwU5B3UDwPJPJR7WrCyCHDH
         ZDEvU1xlzx45HN5reernlgdXMTAVf8FESyFmGVnEezBvDjFTMifDcItwRISZ8LFiWSPO
         tnLxChKvV+nzYNfRJoHSwBQHH73Dd+IeazT+NrnybA0dvYFMhN1znZX74z3JRziCTDn7
         AAA/LCTm9ygQAb7RBXtCz1EMbiboRx3kJCmBgzAtrhEURLTOwRTfBWIyDf2cz+jh5/4u
         5Kzw==
X-Gm-Message-State: AOJu0Yx+uBkC1Rrfw2FV+KOCBQUydLvpAWBriCl9zl/hN3LVJeIjDIPA
	jXPnX2qEDeU6PAUWUE3xBSrwsb9AX/mVV/FkA8fiK3GVqPgFQGSd9UAm5QrWTE/CKPOaiCG4F0G
	0fVWBqVgOt5mx8o+rYDQA+Bh2QxGuLWJG9WxD
X-Google-Smtp-Source: AGHT+IFjBDbHoR40omg8fZ+O5hJP0z/5K5K+oKWoRuRQifuSgWLRkEGyKzXtc/3Gg4ctYC/UOD9SSeaHy694W9INgFM=
X-Received: by 2002:a17:90b:3cd:b0:2e0:7b2b:f76 with SMTP id
 98e67ed59e1d1-2e0b8b19d53mr267032a91.19.1727367090719; Thu, 26 Sep 2024
 09:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240926101431.97444-1-roger.pau@citrix.com> <20240926101431.97444-4-roger.pau@citrix.com>
In-Reply-To: <20240926101431.97444-4-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Thu, 26 Sep 2024 17:11:19 +0100
Message-ID: <CAG7k0Eq=TO+fPULFqCwmbPQtGVmn9+8JNOSnXxOAux=CTakEow@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] xen/livepatch: do Xen build-id check earlier
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 11:21=E2=80=AFAM Roger Pau Monne <roger.pau@citrix.=
com> wrote:
>
> The check against the expected Xen build ID should be done ahead of attem=
pting
> to apply the alternatives contained in the livepatch.
>
> If the CPUID in the alternatives patching data is out of the scope of the
> running Xen featureset the BUG() in _apply_alternatives() will trigger th=
us
> bringing the system down.  Note the layout of struct alt_instr could also
> change between versions.  It's also possible for struct exception_table_e=
ntry
> to have changed format, hence leading to other kind of errors if parsing =
of the
> payload is done ahead of checking if the Xen build-id matches.
>
> Move the Xen build ID check as early as possible.  To do so introduce a n=
ew
> check_xen_buildid() function that parses and checks the Xen build-id befo=
re
> moving the payload.  Since the expected Xen build-id is used early to
> detect whether the livepatch payload could be loaded, there's no reason t=
o
> store it in the payload struct, as a non-matching Xen build-id won't get =
the
> payload populated in the first place.
>
> Note printing the expected Xen build ID has part of dumping the payload
> information is no longer done: all loaded payloads would have Xen build I=
Ds
> matching the running Xen, otherwise they would have failed to load.
>
> Fixes: 879615f5db1d ('livepatch: Always check hypervisor build ID upon li=
vepatch upload')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Should the ELF_LIVEPATCH_XEN_DEPENDS check also be dropped from
check_special_sections() since it is no longer necessary?

Ross

