Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBF193B19C
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 15:28:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764214.1174570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWc2m-0001h9-Dy; Wed, 24 Jul 2024 13:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764214.1174570; Wed, 24 Jul 2024 13:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWc2m-0001f1-Au; Wed, 24 Jul 2024 13:28:36 +0000
Received: by outflank-mailman (input) for mailman id 764214;
 Wed, 24 Jul 2024 13:28:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GqIO=OY=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sWc2l-0001ev-GW
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 13:28:35 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a058b82b-49c0-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 15:28:34 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a7abf92f57bso22244766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 06:28:34 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a92dddccdsm188885966b.79.2024.07.24.06.28.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 06:28:33 -0700 (PDT)
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
X-Inumbo-ID: a058b82b-49c0-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1721827714; x=1722432514; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7e6GFagVKkp/el1EawOmsK1r0OoxC/mDz8AB0vr1l0=;
        b=XJo1/sweu/xNhlUcjG9Sgq7b/P5JLshgCJYWY7+E8akHEm+TnoO/38uDsCTT1/7VUe
         VWYN3A4LK1s0lEpNdQjXeKMSOZ9jYTwQnwi0Zbkh39ZpoeF0R8dzsgeDKnATMqf4ZqBh
         S5PBSacSTH5q7oawOPm1dyC6tvp3P67V6g8eM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721827714; x=1722432514;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/7e6GFagVKkp/el1EawOmsK1r0OoxC/mDz8AB0vr1l0=;
        b=C+S34FSsZVQZ+wueOnfekfYGCzpYYCnXX6tDCDizfzCqr1qMoAiKC+oqojMLjBeBTE
         HYv7tziJnb8ywhYWwQq7jb9NVPLX8zrLNnv9Y4rMjj19gIgK8nrfqnIeNsvD7qJJvb88
         ItaIDlW5nFI9a3hYiSxag9sKYhmx05srw6L/Nkv93HWyxfZfhQJWQV/nXdI6AJ6EANUs
         uWDKa6L05qqNrkl5Ozl+n5ZdxxMRnDdIagiYiaNLAIoZykW6Xsu0cMaoVF1YqG5b02hB
         QW0+G/9PEnP/eNwemeuksPQXVufKWje0gg2/a1cudywzrEsTLeFoL21ePBrNa2Q8aWTO
         q4WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMvXAHetXqoXRS2o0tzIFEQiYmrL9Wu3NBy/ivIBImLu+Xxn6wnbv+KoL+7bj1SeBaI9zejocjlcy+vmADjKVcbKFN+YAv2qT2bnJw1Tg=
X-Gm-Message-State: AOJu0YyZKvABojfDhQe0XuXnwlf02O4efwMlPYraVHEOKc5sPUiBp/qf
	/oLAlk6H0VMyEGGeINeJF/vRSawW3p0YASolBjXFrpOeZ1jsvwZk+MhDEf6+PEI=
X-Google-Smtp-Source: AGHT+IFjCSiFhugZFh4FQ3jbLeYPd9G5GPMq5K7UK7K8jhg9al+MWL+Ama+ZtRRqGYbZTviCoIpttQ==
X-Received: by 2002:a17:907:2d29:b0:a7a:ae85:f25a with SMTP id a640c23a62f3a-a7aae860315mr180561966b.64.1721827713975;
        Wed, 24 Jul 2024 06:28:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Jul 2024 14:28:31 +0100
Message-Id: <D2XSZET3RRIS.12CXT6HXUEBJB@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P .
 Smith" <dpsmith@apertussolutions.com>,
 =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, "Gene Bright" <gene@cyberlight.us>,
 "Andrew Cooper" <andrew.cooper3@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] x86/efi: Simplify efi_arch_cpu() a little
X-Mailer: aerc 0.17.0
References: <20240722101838.3946983-1-andrew.cooper3@citrix.com>
 <20240722101838.3946983-2-andrew.cooper3@citrix.com>
 <D2WYR6RSF2NH.3FCEH00B4ZRZ2@cloud.com>
 <d4860b8f-8562-4987-bd1b-fdbeacc0a994@suse.com>
In-Reply-To: <d4860b8f-8562-4987-bd1b-fdbeacc0a994@suse.com>

On Wed Jul 24, 2024 at 6:42 AM BST, Jan Beulich wrote:
> On 23.07.2024 15:47, Alejandro Vallejo wrote:
> > On Mon Jul 22, 2024 at 11:18 AM BST, Andrew Cooper wrote:
> >> +    if ( (eax >> 16) !=3D 0x8000 || eax < 0x80000000U )
> >> +        blexit(L"In 64bit mode, but no extended CPUID leaves?!?");
> >=20
> > I'm not sure about the condition even for the old code. If eax had 0x90=
000000
> > (because new convention appeared 10y in the future), then there would b=
e
> > extended leaves but we would be needlessly bailing out. Why not simply =
check
> > that eax < 0x80000001 in here?
>
> eax =3D 0x90000000 is in leaf group 0x9000, not in the extended leaf grou=
p
> (0x8000). The splitting into groups may not be written down very well,
> but you can see the pattern in e.g. groups 0x8086 and 0xc000 also being
> used (by non-Intel non-AMD hardware), without those really being extended
> leaves in the sense that 0x8000xxxx are.
>
> Jan

The code is checking for a number specifically in the extended group, but
that's the output of leaf 0x80000000 which is defined to be just that.

AMD: "The value returned in EAX provides the largest extended function numb=
er
      supported by the processor"

Intel: "Maximum Input Value for Extended Function CPUID Information."

Unless there are quirks I don't know about (I admit it's not unlikely) I ju=
st
don't see why this condition needs to be anything else than a check that th=
e
maximum function number is bigger than any of the leaves we read further ah=
ead.

If the number happens to start with 8000, that'd be fine; but there's no re=
ason
to bail out if it was 8001. And even if there was, the exit message is
misleading as it's claiming there's no extended CPUID leaves when in realit=
y an
unexpected max-extended-leaf was read off the base extended leaf.

Not that it matters a whole lot in practice because that's going to be with=
in
range. But it feels like a needless complication of the check.

Regardless, as I said it's more of a comment on the previous code than it i=
s
about this mechanical transformation.

Cheers,
Alejandro

