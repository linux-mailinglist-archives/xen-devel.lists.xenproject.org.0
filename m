Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABA5874F95
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 14:06:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689895.1075356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riDRW-00081I-0V; Thu, 07 Mar 2024 13:05:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689895.1075356; Thu, 07 Mar 2024 13:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riDRV-0007yZ-Tj; Thu, 07 Mar 2024 13:05:49 +0000
Received: by outflank-mailman (input) for mailman id 689895;
 Thu, 07 Mar 2024 13:05:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wkY=KN=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1riDRU-0007yR-Qr
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 13:05:48 +0000
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [2607:f8b0:4864:20::1036])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6961b2ee-dc83-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 14:05:47 +0100 (CET)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-29b1ee96191so516093a91.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 05:05:47 -0800 (PST)
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
X-Inumbo-ID: 6961b2ee-dc83-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709816745; x=1710421545; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aq/IIui6NlkqqF0mR0ekTDaM6i7W+Eg6RvK6usUzWAU=;
        b=GkCRQ/4D5uUcTy1dgayk5BGoMzSYQVC7qlP3tJETlsjxNEaUVaGLsuNMn9uzz2vhey
         2Ult6dV7RbgjaRKhau/47ZMa3aqJsIw0xj8SwrzVSwJeAfwQCkf9A/yUOTIJhD+yPBbT
         On0l0b0kprWUxvuFFao7nKww5856/jWBeswTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709816745; x=1710421545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aq/IIui6NlkqqF0mR0ekTDaM6i7W+Eg6RvK6usUzWAU=;
        b=jJuH42XDMiKkYMcWvzdzUzOBnfzpGPUwxxRm+BORpUp7rzzWQnD119rZsQ589CCD5s
         busqcTDSIyYlUNahBY0wB7kNKu/O2qc/pHosetKhln89MtIiUhjjroq2itr+OhRkw4W9
         M2OYtnEI2I1qcq4htbLjMTP5Z2+4Lox9GxeA7aJA6frf/zXHNT4sK8WeeByXb8UOEz21
         LkmhjSm/Ox8im5LkGNVT90AQ2AOc3muJEri6zj+AJ04p/yHCBm5Xba7Fqp2Di7Tccr6l
         6Y+N2fPUxvD5dhBIIfUDeYdDIFBXo3opSNR9qDq84qjALAlshPyrH9ylPdlNVPNo5A4J
         ZasQ==
X-Gm-Message-State: AOJu0Yzx8k/qeTKBu9XlaFv/WdGvITUcXD8wfWfudLZ0ohBMBc9hCkUK
	WDT2JP4EvCBSJnO0OFo/HBmF5ZJPf6NFxweEg6fDIWNDzhgrAQF3euoJz9yet3BjhC+FzI0cZaO
	XcAjeiz19ozjZ3fTJHeNcZRRsvHscZC3vRglO
X-Google-Smtp-Source: AGHT+IGLnn8RptkZu7AsublN8Z7lLDx3eCuLlisgUyfG8yEoUZycegMaLslD/OU1ezh3IuZB8v9zAqO5Wx+XCsj2xSs=
X-Received: by 2002:a17:90a:a516:b0:299:2927:4d2c with SMTP id
 a22-20020a17090aa51600b0029929274d2cmr15142043pjq.48.1709816745501; Thu, 07
 Mar 2024 05:05:45 -0800 (PST)
MIME-Version: 1.0
References: <20240305121121.3527944-1-andrew.cooper3@citrix.com> <20240305121121.3527944-2-andrew.cooper3@citrix.com>
In-Reply-To: <20240305121121.3527944-2-andrew.cooper3@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Thu, 7 Mar 2024 13:05:33 +0000
Message-ID: <CAG7k0Eo5Ar5wXXUy+Tv9KZfcQy+NLZibBWrcRco6=jP4tRs+OA@mail.gmail.com>
Subject: Re: [PATCH 1/3] xen/virtual-region: Rename start/end fields
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 12:11=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> ... to text_{start,end}.  We're about to introduce another start/end pair=
.
>
> As minor cleanup, replace ROUNDUP(x, PAGE_SIZE) with the more consice
> PAGE_ALIGN() ahead of duplicating the example.
>
> No functional change.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

