Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 895BFD16F04
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 08:01:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201157.1516847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfYPQ-0005T5-OM; Tue, 13 Jan 2026 07:01:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201157.1516847; Tue, 13 Jan 2026 07:01:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfYPQ-0005Qz-L8; Tue, 13 Jan 2026 07:01:44 +0000
Received: by outflank-mailman (input) for mailman id 1201157;
 Tue, 13 Jan 2026 07:01:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sxhW=7S=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vfYPP-0005Qo-J0
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 07:01:43 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b29fae62-f04d-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 08:01:34 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-59b67388c9cso9175677e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 23:01:34 -0800 (PST)
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
X-Inumbo-ID: b29fae62-f04d-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768287694; x=1768892494; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6aB1YMGQen4QeppxKa0CPKNwdwfaYo/Ol0NlViX1KGM=;
        b=dlGBdA5GRu8IeJqi1VVRa4eEc/uLiBSLaUlr0FBfbKo50xCmivZLqYGwo7WrSV5UZP
         a3VT5cZBIIPcUPFD0M2tACKsYfigUCf+4glpjMIOhTJatcwhhzd8dbPg3Xfyh4NSNLVm
         qFiEAzytJ0Ygss0iE7aBV3Cd0u0kqAXbTbsLYkfF8nAqhpmtfPboJvyD3jYCYx6C4DgZ
         xAfB4GlEGV+caqUjUKIRx7i4tsk8c7gOqBHHzMWbKmrpJ//WqdnLTV5LzkIwIq8ymx0I
         oRIw1Ka0MmxZnJ/yZF6qfS8chPHna4J61Vc0bzf2GO1zl2EORjJl2tJv3Ym6H4PQrHG1
         4qcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768287694; x=1768892494;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6aB1YMGQen4QeppxKa0CPKNwdwfaYo/Ol0NlViX1KGM=;
        b=DH3mrjoCeHA2wLV4NSKWtzDsQhJjetvWsqIudaBTzzwya3JkVkxNDtqG/QQZESe6wh
         ZwrOEjvuM0gbGWrPVZL3kaxU68cTTUbojazn3+tVR5E5ssGVtfsjKnqmqA+of2NkYaPR
         Bwopg7Otm3Rp9C7Mm7tsn3W46+VyZOnxAMAq4DbJ07/ciE9x2udJ+mraG1sqyoEyxxwy
         I0LL1XkVAZVMpJgmvOyQHYasjmf1YKo9DsrRRl3D0x7lMCL38rX4E62DraO5Go5pHLkA
         ZswHYw/zWJzoM6Kp+pFb4H3we+Nxuk6eP9KzEsOJkD+H4jaDp3VbNVxm7VP7fmlisst/
         mJyg==
X-Gm-Message-State: AOJu0YxuOsZQ83YOvp8mjc1VCKDoZQTacpDkGuH4RXux5yo5ttq2sOpB
	L7HGMEArFZKHTPuUvdK8do2QhT97C+JUjA9UfQETW2F0nvEY5mIbH0+sjSmP8ql93Dpoe1jLPZN
	oXGtHvree4W+PdZWBNQ7+dI+H3CNNRRMfh7hr
X-Gm-Gg: AY/fxX7Yv9pKR2Qn9JW7vsyksywEwuWpDfgafMIfJCTz7eP1AUMEtrycgAem+HSTSFj
	lHXvUH/YihX5sDNNG4HJxiyrSr8EJ3BGgxRUe8oB0XFeVcEh5Nlh6UqyP8+s8XDC1V3mvRu7oaO
	8aQMOYhhzxDurBaNRb/JGCBFXoOqVeGoj1UAH5k9gp5ihCFfChi3itdWCvocQLxFEdzJKC0P/N/
	d3UPXDE5RWsYOfoNscWF7w/Qjq+IGAGQmKbmTSUUWSKmad9Rsdwtw10f2kICd6msRKjJuGC7DwM
	nHUhzw==
X-Google-Smtp-Source: AGHT+IHXe5iS39ifWI9d/jz3fbERUbKn2mgIzfvLDdiLxgkT2YcWgcUmk/Fx4qhqa7Jn6++lQCp+qYvEwYOQcHB2s5s=
X-Received: by 2002:a05:6512:2305:b0:59a:11a4:4c29 with SMTP id
 2adb3069b0e04-59b6f0410a5mr6699306e87.41.1768287693757; Mon, 12 Jan 2026
 23:01:33 -0800 (PST)
MIME-Version: 1.0
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 13 Jan 2026 09:00:00 +0200
X-Gm-Features: AZwV_QgAYBsA0hR4qP-pywTefCHjanYu4qjkMitQa2hRhd1-g1r5EjisWWoHD4g
Message-ID: <CAGeoDV86se5TsPK5hENABJqsN+0FvFv=TJSkHs4N7VivhB2UaA@mail.gmail.com>
Subject: [DISCUSS] xen/arm: CLIDR Ctype scan order in get_llc_way_size()
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Carlo Nonato <carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"

Hi all,

While investigating current Xen code, I noticed that get_llc_way_size()
scans CLIDR_EL1 Cache Type (CtypeN) fields in reverse order to locate
a unified cache level.

According to the Arm ARM (DDI 0487J.a, D19.2.27):

If software reads the Cache Type fields from Ctype1 upwards, once it has
seen a value of 000, no caches that can be managed using the architected
cache maintenance instructions that operate by set/way exist at
further-out levels of the hierarchy. So, for example, if Ctype3 is the
first Cache Type field with a value of 000, the values of Ctype4 to
Ctype7 must be ignored.

This reads to me as an architectural constraint on software: fields above
the first 0b000 are not architecturally meaningful for decisions (regardless
of what bit patterns might appear there in a given implementation). With our
current reverse scan, we could (at least in theory) mis-detect a "unified
cache" at a level whose Ctype field is required to be ignored.

Discussion points:
1. Is the reverse scan intentional? In particular, do we rely on the
assumption that Ctype fields above the first 0b000 are effectively
RES0 in practice, or that they may legitimately describe caches which
exist but are not manageable via the architected set/way maintenance
instructions?
2. Would it be more correct to scan from Ctype1 upwards and stop at the
first 0b000, tracking the outermost unified cache seen prior to that
point?

If there is agreement, I can send a small fix patch with "Fixes:" adjusting
the scan order/termination accordingly.

Thanks,
Mykola

