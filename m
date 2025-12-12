Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B43CBCB89EA
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 11:25:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185308.1507524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU0Km-0002HN-G0; Fri, 12 Dec 2025 10:25:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185308.1507524; Fri, 12 Dec 2025 10:25:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU0Km-0002Fa-DO; Fri, 12 Dec 2025 10:25:12 +0000
Received: by outflank-mailman (input) for mailman id 1185308;
 Fri, 12 Dec 2025 10:25:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qjHH=6S=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vU0Kl-0002FU-AJ
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 10:25:11 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d50a62ad-d744-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 11:25:08 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-37d056f5703so9572361fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Dec 2025 02:25:08 -0800 (PST)
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
X-Inumbo-ID: d50a62ad-d744-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765535107; x=1766139907; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4t0sEBE/3L5xc3QWbh+63uPdRQYdNbNFipf8kPWUPEw=;
        b=Mr9/DeCCRK/3l/CWb85libfWR7NPLwKtkJ+kL0ZGGdTUhRjxgOmMKFPaWgFEMyf/V6
         KiZk6nsKyf99AGjSW29lkbpaxYLm9jdXH4eK6KPZc+I6xkTsYPDvyiaVT7BD3bgIQ/TX
         xyoYruBsYHYNgydQtsLdQAuGrjhbTrtZ8aAZxOBAfAsba2x1jv90qrr5B28a3GH9lSkj
         icMhO7AK9ZI/rHMos11F/DGtdHgiH7R22ygrHQclZTxO6y3pS/FfRppybOeOGSk0NkqZ
         hltr2/wRP97CRz+mc8zjJMDzOMkUb/aaaQYBqsxAuE/Y0nOju5OqdTSq/fBQCHyWDP9e
         MkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765535107; x=1766139907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4t0sEBE/3L5xc3QWbh+63uPdRQYdNbNFipf8kPWUPEw=;
        b=VFsIKxFYEOQD7teXN2jlkOBDN0hqXwekb+AfQZnQxOUCNlWxxKL+p7d0xrkRTdnJMJ
         f0EssGLbgFO4MKSRFllImp0g4Qp6HI78jQJmizlbdmnN8048QRIUDD4dDXBHrydx/+rA
         Of2yYU/7jkuvaJIR0HZImp25V4M15kS2JV4XaMAgr59zZtxmibxOiV2x5B6IvkDrFCCb
         cXGli3ySHjSEQzhU6zJgwpU0AkcZ/R9iqgmitaNExTkXKc4YzPdorzd2i8vIQSb14/7e
         Yqk9SUXIg9oMJlo+WqmfivweCu8qeMCNmLVnoWtpounTTQhL/F2c25FyfGJPPwL+UbCs
         Ntnw==
X-Gm-Message-State: AOJu0YxHSutlOrmDNs/6e3498XDOqM4Ps0HraQ9k3XQKCoJe1oiH7V89
	fESHmOp4AvXJsOgHMUnm4UzGtEEsZNnHVAhhljTHAmk4RppItDFMyIy0u5jOapF/uNlgDBIntD+
	tuRt37ZgsBewxvynhZiKsWGZOjjtF/9cxSISs
X-Gm-Gg: AY/fxX77uVVcDm54hp7/XiAbYGKw4uPydfVrMz21p5JbvIXT1OdDMgSTbeU2P7HzHvo
	W2+L6RXf0cYPmojEebU1hmy/PRyGICldgIey55U3/7oES/2Ue4UhbumnjIGVuK/62TN2iEp/blR
	EGcCMRomxw8j4DeqYbo69SXN0+Eevs6i+1fyCyfBfyweTv2r3QLHvFakors7y5AdZ4KtsWSIL8a
	CFJajuWL+iKCrDjdPZ54/apK8Be8mg/4onkMmBhRSt7GNOomV1BClPdEvPnRe3Wkfysqg9VgSld
	Dhs=
X-Google-Smtp-Source: AGHT+IFpqn8xQYNelV+017Usbw3t7tjlAVPbTp70tYZ2yUoZtXO+WTkv/mKSUKTt5uf2lh2wePrN8NGUezQy3rK8WR0=
X-Received: by 2002:a2e:be9a:0:b0:37a:3963:ce8f with SMTP id
 38308e7fff4ca-37fd1f982e3mr4899531fa.33.1765535107283; Fri, 12 Dec 2025
 02:25:07 -0800 (PST)
MIME-Version: 1.0
References: <e57133182b9bcecb519911c8b3f0d871955d6fef.1754540991.git.mykola_kvach@epam.com>
 <CAGeoDV-j4nu1JhHyLpeDoqZ6evsExGvJSws-MK09M4HbUam1BA@mail.gmail.com> <ff935ee4-29f2-4f1c-835a-d821bcec79ed@amd.com>
In-Reply-To: <ff935ee4-29f2-4f1c-835a-d821bcec79ed@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 12 Dec 2025 12:24:56 +0200
X-Gm-Features: AQt7F2oTU0DYVSj01ua4go3ZQG49JOtnpfpMwZDerIafnjMKBZ40pz_VTNkqhsQ
Message-ID: <CAGeoDV9jDboEtcZvEGDr_-=a+ricDSD_vwdSz-5=uotoqBv8UQ@mail.gmail.com>
Subject: Re: Ping: [PATCH v5] xen/char: implement suspend/resume calls for
 SCIF driver
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Mykola Kvach <mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 12, 2025 at 10:51=E2=80=AFAM Orzel, Michal <michal.orzel@amd.co=
m> wrote:
>
>
>
> On 11/12/2025 19:56, Mykola Kvach wrote:
> > Gentle ping on this series.
> > It has already received a few Acks/Reviews - could it be considered for=
 merging,
> > or is there anything else I should address?
> I'll commit it shortly.

Thank you!


Best regards,
Mykola

>
> ~Michal
>

