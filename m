Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBD7976E5A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 18:03:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797688.1207717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1somHL-0007Hm-T0; Thu, 12 Sep 2024 16:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797688.1207717; Thu, 12 Sep 2024 16:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1somHL-0007FS-QK; Thu, 12 Sep 2024 16:02:43 +0000
Received: by outflank-mailman (input) for mailman id 797688;
 Thu, 12 Sep 2024 16:02:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F2hp=QK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1somHL-0007FM-9u
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 16:02:43 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 711dc170-7120-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 18:02:42 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8a7596b7dfso173413166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 09:02:42 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c61263sm765079866b.128.2024.09.12.09.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 09:02:40 -0700 (PDT)
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
X-Inumbo-ID: 711dc170-7120-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726156962; x=1726761762; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eArTj0M+rlyQm1RK4d56ASUkyTw+zLcF1Z35hsKwowQ=;
        b=c4Q32tWm8RDPCVk+i9gLdM9roF4sxjOMDoMgjUsvW/YJ2vmhVhW8u9jXJAyvApGxmS
         dqNXxFlEZz92bsVPM1ax3mOdwPO7J5e9Q+B2savw3kPxL3SzzBsP39rPJ1XwORnIy+cJ
         dGt4uq6LPskxXesj0UPSBig9nHTxKdDv6sfEgEUjeOl2/JOdkCecTOvPGD5sCQtJAhsD
         O2R76Oa9Y+HthkFXp4dxL1pXPo5AHkGfBNBFE2NRa6a4VVigID3k0BH3tXdk8bUOF1cf
         dsjNoR3gWzi3YTMjxEkyJLsZoDB/IAmI+L1pYYpWObENzzhl0kqG5eIJ48fVv+Tkjn7U
         G0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726156962; x=1726761762;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eArTj0M+rlyQm1RK4d56ASUkyTw+zLcF1Z35hsKwowQ=;
        b=Gna42VtORvT0VKlKmxFcBIHt29ro756f0eGqnfa4v7JYCXejPydUe75wj1rSHNrhLA
         XTpNNVE3qfKR5JqWG5Y/T4waswhEyjGuMoC7WooIFkFC6WfcgV7BOLEUwV5FWceYhT8J
         mEjI2X33JFL0L88mE4eVrPIxw0lZJE+v1BOQoSnTmqbjkmxz0aE4YnO5VDcrrSGtmADZ
         pxjE/XYvgymvUTbYmE0zAC9S8kxCbfem6dx3A3ZeKomoa0rfFt7NRyuMtSkow3q1GwTY
         286ivAfopB/SSciuBJ773mMX8MY+4lI1+62IgkM10XTQw/3VgX6EtdRzh+RnjXVc5fLX
         9zoA==
X-Forwarded-Encrypted: i=1; AJvYcCX9kCF76xIzN07IBttDUnk40wcSNOaBi+7oS6Q+UK9GD4IkuI5QixVK0kY9tMvTt2qE8gqIGYu7jA4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywig9UlMI5lohEU9pE4Ms4dW4EIooROffGjuxcwUGmQaSgN/NjA
	CauTEMljVsl6/Q9uTGC2hPcuQDXCYTVKwH3oSlT6sN4RSBzNVRFQ
X-Google-Smtp-Source: AGHT+IFn6y7iPUyJ4VXBf9xs1KNcb9/u8Bo16+P5CeW+jAybcpUKSntgSjNlJsX/KBkFO1lneBZ7ng==
X-Received: by 2002:a17:907:7210:b0:a7d:a453:dba1 with SMTP id a640c23a62f3a-a902a5c502dmr370180466b.20.1726156960767;
        Thu, 12 Sep 2024 09:02:40 -0700 (PDT)
Message-ID: <2e0213cef457234037980f45e338efd586bc7870.camel@gmail.com>
Subject: Re: [PATCH v6 6/9] xen/riscv: introduce functionality to work with
 CPU info
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 12 Sep 2024 18:02:39 +0200
In-Reply-To: <6c43c528-daa9-4449-a383-aade3da73160@suse.com>
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
	 <77a00222008f8b41d2454e74d1c9247252d7ccd9.1725295716.git.oleksii.kurochko@gmail.com>
	 <6c43c528-daa9-4449-a383-aade3da73160@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-09-10 at 12:33 +0200, Jan Beulich wrote:
> > +/*
> > + * Mapping between linux logical cpu index and hartid.
> > + */
> > +#define cpuid_to_hartid(cpu) (pcpu_info[cpu].hart_id)
>=20
> Does this need to be a macro (rather than an inline function)?
I started to rework that and I am using this macros for both read
and write. So it will be needed to introduce set and get inline
functions instead of just one macros. I think I will stick to one
macros instead of 2 inline functions.

~ Oleksii

