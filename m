Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E5795487F
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 14:06:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778601.1188646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sevif-0003Tq-4k; Fri, 16 Aug 2024 12:06:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778601.1188646; Fri, 16 Aug 2024 12:06:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sevif-0003Qp-1Z; Fri, 16 Aug 2024 12:06:13 +0000
Received: by outflank-mailman (input) for mailman id 778601;
 Fri, 16 Aug 2024 12:06:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6pmz=PP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sevid-0003Q5-Dk
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 12:06:11 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec73a8fb-5bc7-11ef-8776-851b0ebba9a2;
 Fri, 16 Aug 2024 14:06:09 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-530e22878cfso1925489e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 Aug 2024 05:06:09 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5330d424d77sm529521e87.280.2024.08.16.05.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 05:06:08 -0700 (PDT)
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
X-Inumbo-ID: ec73a8fb-5bc7-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723809969; x=1724414769; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DGS2FlQzoejqcN5y+ZcOUrUjGggoEVLsPK9AEbgKgJw=;
        b=RJnC7RhjEgXEM4QkBpd4Q/dorjVqRxXMwnC5nIMNTa+yRf/Dzo9lD/3b/wvmtDtgWi
         WwDB94Ktj5KbpyeP2uRRvLCl3K5bqMM1hK5xBlxJ2qzgs+P+LInkAZSCodSvdoVL+vmi
         twrcfFAVmPK5C/frGLEkAgivX04VM0wtWUiAqIorCFNuXXv677uWP3hlTETTy/Gqx5Lq
         Md7a32nRIneiF5NDwXsTbj5XRo7chASF1TVmaYvSlPl/bJJBwzr8LTYUgjb26W7vZDcU
         QSTN1EsIgOOQig0e0V33qcvb+C3SZYUJC/x17WQCcVIi7cbLNc4gTRne6VGoETQ279F+
         mdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723809969; x=1724414769;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DGS2FlQzoejqcN5y+ZcOUrUjGggoEVLsPK9AEbgKgJw=;
        b=InhcLRdLR0RTLaKolKaKclyLZ+QbgLpS9FNMK+Y1x/ZiJnuUZEWPqBdTL79OkGu8Oc
         fRthO1SyqK9cWWGX8jdyyK/FEnGil0RX+Ua0mt/cyxRTk7EkcBfe8nVRpF/IDhy4+wn0
         mk1lDwyAVHZJ2r3HGX/tuGK7ozDr0WpRlU+9BdxgS4WrwnXhDujSzEgB0+p0uj+Adu+3
         +4iZwjS9esWogsoRJT+WAMobja+7JM3L/+QUvSqPD21Bvu4FXkHIkO96rCiWxoY8fiwH
         IVd2AncasxGh15RgmQovuVhH4+oNWK6rCvdLDmteJDPhHqtNxkMLGsPszJ1zkwX8v/Q0
         AO2A==
X-Forwarded-Encrypted: i=1; AJvYcCU6h52UlaJM/DAtpgm4RvBBXSBulqLN1i2CiUsf2TViuYPxWX+i8TkuGFk2TrvlwxdegdC2FAC/orXqYn98fd1TPyFKL0FLAW0S36y55ww=
X-Gm-Message-State: AOJu0YyWC8UXrbYfbrpxo6FLACOLkWebad2aWJdGiK7G9ZhxQ+uTkimp
	pl0XdxSgJgXqFbTPcjqPjtQiUym3Taw2LcUV0cseVX6rAKdZKMDN
X-Google-Smtp-Source: AGHT+IGIv24Zla4qUba8fy6dY+72K21eimFOfTorFzVl2lMnHAp9WclVx8XGbBQu5ig5GGE1nm/uug==
X-Received: by 2002:a05:6512:12cc:b0:530:c323:46a8 with SMTP id 2adb3069b0e04-5331c6a4577mr1648779e87.23.1723809968408;
        Fri, 16 Aug 2024 05:06:08 -0700 (PDT)
Message-ID: <9e3bfd3afdee65f913fe418e2f6e061c4c39aaf9.camel@gmail.com>
Subject: Re: [PATCH v4 5/7] xen/riscv: introduce and initialize SBI RFENCE
 extension
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Fri, 16 Aug 2024 14:06:06 +0200
In-Reply-To: <77ff59d1-b158-4603-bdbd-67c079ce87c9@suse.com>
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
	 <1a863d06866f86761d23e6da3f4a6ee58c474473.1723214540.git.oleksii.kurochko@gmail.com>
	 <77ff59d1-b158-4603-bdbd-67c079ce87c9@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-08-13 at 11:34 +0200, Jan Beulich wrote:
> > =C2=A0=20
> > +static unsigned long sbi_spec_version =3D SBI_SPEC_VERSION_DEFAULT;
> > +static unsigned long sbi_fw_id, sbi_fw_version;
>=20
> __ro_after_init for perhaps all three of them?
>=20
> Considering SBI_SPEC_VERSION_{MAJOR,MINOR}_MASK, at least the first
> of them also doesn't need to be unsigned long, but could be unsigned
> int?

sbi_spec_version can be really unsigned int as according to the spec
only 32 bits are used:
```
   struct sbiret sbi_get_spec_version(void);
   Returns the current SBI specification version. This function must
   always succeed. The minor number
   of the SBI specification is encoded in the low 24 bits, with the
   major number encoded in the next 7
   bits. Bit 31 must be 0 and is reserved for future expansion.
```

For sbi_fw_id, sbi_fw_version it is not mentioned the same thing, so we
can just assume ( despite of the fact that now this values are very
small and it is unlikely to be bigger the UINT_MAX ) that it will be
always fit in uint32_t.

But I think it would be better to leave unsigned long for everyone as
according to the specification this functions returns sbiret structure
which consist of 2 longs ( error and value ) and it is good idea to
follow the specification.

~ Oleksii




