Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CE184EA9D
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 22:35:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678487.1055833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYC3U-0006Sb-MX; Thu, 08 Feb 2024 21:35:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678487.1055833; Thu, 08 Feb 2024 21:35:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYC3U-0006R4-Jd; Thu, 08 Feb 2024 21:35:36 +0000
Received: by outflank-mailman (input) for mailman id 678487;
 Thu, 08 Feb 2024 21:35:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jPix=JR=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1rYC3T-0006Qy-84
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 21:35:35 +0000
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [2001:4860:4864:20::34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc777f29-c6c9-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 22:35:33 +0100 (CET)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-214410e969cso557221fac.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 13:35:33 -0800 (PST)
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
X-Inumbo-ID: fc777f29-c6c9-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707428131; x=1708032931; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Mh+xWIVTtqZw4i0bVaC8y7Z/eeQ+wmiQoKLgVaf7JA=;
        b=FdgxPk5gt6pOiLnWe2Y+wqWMN1Re5Hto4ER+C3bfR5HO+8XmMe+K6/DBxz4JPCSdc3
         9jstggOc4LBhARosWJspMIv7gx2EByqZoCjfV+HzCkc2I9xJVN2OYFa1e9QJJzY6D+my
         nXaoa14p23AfoF8/iVbWPDcNUoRKP6RLU+F5FT9bQgpnsmP92E4A6RXdsGGwxq1ty/RI
         dOLBD8tffravNK/8v6nemR/q22Smdb6hocDArsp8TMbDfYndKIXODX/ZGD5jpV9osTaK
         aYxsWp2VDGo5bLHd1ButrZ7W8GfrLci/xDA4PxMUmWMab5UgcNe5uKBhiw1ytUTt9N+n
         gWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707428131; x=1708032931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Mh+xWIVTtqZw4i0bVaC8y7Z/eeQ+wmiQoKLgVaf7JA=;
        b=lw+c/1LuWu1DKI1MSDcjh8J15DIWNylgPjx4DG/JpVrZda7H3qYhMLYe5EVOwn7Vm0
         5NWYMfigd0u58OKy+XUqezpLnLXDTs0PBn85AwFRVKX8qFb4Pa3AD+kD8bHxzF+9YFp0
         RgPomXX7P3WGsSuxK7baz8YrxoWSRNtpCH4WU4SQYPl8HRxGZOK9rAeSOhrCj+F5gcnR
         6qZnfEMXsOiK+rzkh+hlt/9rsusuAGAbswFC1bx7zVCPuk9dl8IXcO4a7Grpu6v6mkwK
         z0ndmFhNsbza1gryX2aMhP3IxeWma98Z582oc674jUyfXg3lu05lSYrCdTNdTQ/xU6YY
         vIUg==
X-Gm-Message-State: AOJu0YyEUQVtS75Bslhhlcz78NXM7lOIPvlEgKv2C9DGlWBnevQBNeFy
	DtAxjyj/+7d2g9BEs2pEAAoHxCJVyo3roVtHicyFasOkHtj+xh7mBjkwYRiqVGsRS3PWUZFJrGT
	fuhH//XZZE8tDdW5duN8/VHBS5e0=
X-Google-Smtp-Source: AGHT+IHfFjTyxsLbTPD/HdzbnDuyruvrDDAKk0A/2doxdRvMNO/PSk8n+hDuTVEr8ggOLJIpaxd/nUANy7d7AlhTa9A=
X-Received: by 2002:a05:6871:721:b0:214:fb22:c9b9 with SMTP id
 f33-20020a056871072100b00214fb22c9b9mr1994270oap.26.1707428131585; Thu, 08
 Feb 2024 13:35:31 -0800 (PST)
MIME-Version: 1.0
References: <9b9909c9e93cb540b3488c784935acc2bc9e071e.1707343396.git.w1benny@gmail.com>
 <3A858D7F-C953-4EF0-8919-AE96D6105AB1@cloud.com>
In-Reply-To: <3A858D7F-C953-4EF0-8919-AE96D6105AB1@cloud.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Thu, 8 Feb 2024 22:35:20 +0100
Message-ID: <CAKBKdXijXDcSnnm2P9kTe74924foiBxRks7mpxwE+q4rjiEbAA@mail.gmail.com>
Subject: Re: [PATCH] tools/ocaml: Add missing vmtrace_buf_kb field
To: Christian Lindig <christian.lindig@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> On Thu, Feb 8, 2024 at 10:14=E2=80=AFAM Christian Lindig <christian.lindi=
g@cloud.com> wrote:
>
> > On 7 Feb 2024, at 22:04, Petr Bene=C5=A1 <w1benny@gmail.com> wrote:
> >
> >
> > Add the missing `vmtrace_buf_kb` field to the OCaml bindings to match t=
he
> > vm.cfg configuration, correcting an oversight from its initial introduc=
tion.
> >
> > Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>
>
> Acked-by: Christian Lindig <christian.lindig@cloud.com>
>
> This looks correct from an OCaml perspective. Why was the new field added=
 in the middle of the record type domctl_create_config and thus forcing cha=
nges to the index of fields coming later in the record versus just appendin=
g the new field to the record type?
>

To match the position of the field inside of xen_domctl_createdomain.

P.

