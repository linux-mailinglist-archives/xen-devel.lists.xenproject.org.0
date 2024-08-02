Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2D9945D3C
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 13:27:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771028.1181609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZqQi-0002WF-Nu; Fri, 02 Aug 2024 11:26:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771028.1181609; Fri, 02 Aug 2024 11:26:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZqQi-0002SU-Kp; Fri, 02 Aug 2024 11:26:40 +0000
Received: by outflank-mailman (input) for mailman id 771028;
 Fri, 02 Aug 2024 11:26:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=14L3=PB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sZqQh-0002QR-0z
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 11:26:39 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1487611a-50c2-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 13:26:37 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52f00ad303aso12277064e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 04:26:37 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530bba3d075sm201593e87.268.2024.08.02.04.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 04:26:35 -0700 (PDT)
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
X-Inumbo-ID: 1487611a-50c2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722597996; x=1723202796; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YaAP7smygLkz3CuBgBU7MLOgysw2GlGv+eXZXZeMU+o=;
        b=EJaXTPlyqycjQTgBd8ad9TA0UhjypJA+Pqc/PYoUiqgkS+ppjLKEIjCf/o3WGGSsv6
         UNpAR9GiJiu1ySv1xnTx6iAypza/8QXpzk6NZqXXI+xOnOZeyHTwEnODGhwQuY29dXuU
         ApCiFp0HbeXj3IvdI2bLzAPP/LtuiVzSLfpCjb2BXtOX+jaKnd5ig+Qbh7zlgVy/OQik
         VEZdl6QvkFEPZiqy8BTmB1qwAMdK0QLUe0Cacy7wVfUQ86YRIoYuc+7GBKiliD7MafXD
         wyGd1825/RQtVo+fYXtKkh0jEIXWbD2XIxVwiH09wnt8e/vNEEZr9IYA4wpNg64VwSaw
         82EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722597996; x=1723202796;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YaAP7smygLkz3CuBgBU7MLOgysw2GlGv+eXZXZeMU+o=;
        b=tEdEOb/+9H9AQ2l7mmKB4e38D6ZrynlgNSiMISlsTbB6SRJV5/KlZsdvMBXkZE4VLU
         IDeiYCPv6r/YyW3B4Gq0K1U8hqFCj+Leq54WwYKfWHSSazPkeVSnL9z9bpGY/4GRw4c/
         Pw2Mj8h9P/Mhv6xm9rk12E9wAJyPeWoRD1b1Z+pNTbfQgxxmWg+zC5xIu8dBIGRp/xLa
         2lTzhcD+N8r0OIGgONKbsI2C+YEbOi5o/PHZMJRpfJXr9NEOHnyRv9UtnQdGqfoAm0ht
         Z47ab8WqYFmjljCZJ0pYjlMFZG27gbVdqj8V2+foCzVMCD0b2ddCT/bLEUcoFnwSEqog
         J6pw==
X-Gm-Message-State: AOJu0YzQMsK02TLGcex6uecH0vp6bNiKgk9QBz6PrlnLSlbVv27ca2Sn
	R51zv1s0zaOHGWXn+qPlzCpCxRZzdcR7fh4s2tPqDxbSKubjKiWY
X-Google-Smtp-Source: AGHT+IEl6snRdxuhBwAEONwVjY8XhE6pjDejADBKmvzhb+LJsoK1BmUCXi8mtWmMmDMqc7/NHlvLbg==
X-Received: by 2002:a05:6512:b98:b0:52c:c9bb:2ba4 with SMTP id 2adb3069b0e04-530bb3cde63mr1869125e87.46.1722597995939;
        Fri, 02 Aug 2024 04:26:35 -0700 (PDT)
Message-ID: <2d61a90941e2df7b24907b8578a425ea6bfe15c7.camel@gmail.com>
Subject: Re: [PATCH v11 4/5] xen/riscv: enable GENERIC_BUG_FRAME
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Date: Fri, 02 Aug 2024 13:26:35 +0200
In-Reply-To: <6f339355-4f82-4b84-b437-cc72dc063b64@suse.com>
References: <cover.1721731887.git.oleksii.kurochko@gmail.com>
	 <b79bcfb9031564fc8d275af66fa94c1e82e54de2.1721731887.git.oleksii.kurochko@gmail.com>
	 <7c03ed78-7c80-45bf-acf3-a916b7abb7d5@suse.com>
	 <6c379c6a0ac3e046c67647fa63d085a341906224.camel@gmail.com>
	 <83e20f26-ae59-4191-a12d-f31f779c91e2@suse.com>
	 <a16ac4cd3fe0143e40f8b5ec993cd6049d41ea3d.camel@gmail.com>
	 <1d3ef706-fa3d-4dee-818c-83904012ca35@suse.com>
	 <1b3aff2873f3e9a46b6dd7936717c32945ecf30f.camel@gmail.com>
	 <6f339355-4f82-4b84-b437-cc72dc063b64@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Fri, 2024-08-02 at 13:18 +0200, Jan Beulich wrote:
> On 02.08.2024 13:02, oleksii.kurochko@gmail.com=C2=A0wrote:
> > There is something what we need is mentioned here:
> > https://github.com/riscv-non-isa/riscv-asm-manual/blob/main/riscv-asm.m=
d#instruction-aliases
> > But the problem is that is "de-facto" standard, but not really
> > standard
> > instruction. Anyway, I will update the patch to use (C0001073)
> > instead
> > of ebreak.
>=20
> Well, the official spec, in the C extension, mentions 0x0000 as
> "defined
> illegal instruction". Wouldn't using that work? It's going to be
> undefined
> no matter whether the C extension is actually implemented.
It should work. I will use 0x0000 then. Thanks.

~ Oleksii


