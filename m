Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B255682CB1
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 13:37:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487622.755304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMpt0-00079l-2Z; Tue, 31 Jan 2023 12:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487622.755304; Tue, 31 Jan 2023 12:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMpsz-00077X-Vx; Tue, 31 Jan 2023 12:37:17 +0000
Received: by outflank-mailman (input) for mailman id 487622;
 Tue, 31 Jan 2023 12:37:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0fq0=54=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pMpsy-00077M-Sv
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 12:37:16 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fda5c719-a163-11ed-b63b-5f92e7d2e73a;
 Tue, 31 Jan 2023 13:37:14 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id f7so7027140edw.5
 for <xen-devel@lists.xenproject.org>; Tue, 31 Jan 2023 04:37:14 -0800 (PST)
Received: from pc-879.home (83.29.147.144.ipv4.supernova.orange.pl.
 [83.29.147.144]) by smtp.gmail.com with ESMTPSA id
 g12-20020a056402114c00b004a216fa259esm6225345edw.60.2023.01.31.04.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 04:37:14 -0800 (PST)
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
X-Inumbo-ID: fda5c719-a163-11ed-b63b-5f92e7d2e73a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pQteqOCyAwbu0M9jaRz8XXN1rQY3QJ0D8KKKbXHgsYY=;
        b=GsBKl0XLdwLmbwS2zltNkihJofVcRpe+mstb6uMVNe1iuUVZveUv0scDmFbqNNzQvm
         YF0L/RqIE94fSwvmi56daqSKguUZzZ+CNOdu7+4v3OJoEi4bSlcSRRsIKdWFOMKjVFq/
         Ih4FSg5LkWCWP0z105kDQRXziFOv8DCuj7IIkWqT9KBf1TzMuhvsqp9p9ecnBMezmBW0
         FeGqOL/wMWAn1DIsGIXOqYTqNSCJ9tvpeJugnDRwl0ZajAvWyaW9e7zTkGkMotcXABW9
         XUx7Lgy6YZEfWjVj3q8qmWFtB1EdkCafvl/mYECOIo3Qftgfu8QlCu3VSCDggR90SJsj
         jRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pQteqOCyAwbu0M9jaRz8XXN1rQY3QJ0D8KKKbXHgsYY=;
        b=KQqUUuNIu6v5/vQrmtaJ6UAtQrIpQQI2s1y9BO0W0Rjh4uKVn0ZNTTu5C95KcOCvvu
         S1TJn6Lmu+NP4lfoNuy7GUCB3mEvZtEsZIdtWT4K7a7UmN8PQr7nXJ67h9hMjd12pC21
         NItyuyHQB6RB4qfGgGFDj0jeOTVBu48a+tYz5cQgwM7VLCIYyoMxL7I44R87w3ie+GxW
         fxH0LLwRMNfu1R2wCCvCVv0NLi6+Lql/CJlrX4uY393Jn0SETfHostN0TOQrQ1OXvsoo
         9ryUNESheSwjjKOlrD5yOi+JxoWXQxlaSUwq6CoBeSMcJXpD28h32ZVzA9TdiAGfax3n
         hqKA==
X-Gm-Message-State: AO0yUKUDcsebOKqCdk8wHKE121x/RCDkq7t6qkknzpCGC+gsb+o1A+T6
	c5Vrfm0c+KKkmaHzOUjoHVM=
X-Google-Smtp-Source: AK7set9nAjQwlEifEw/u78Qh5wLhEz5Cnq11+HNpony01MddJpfoNhlK5liZ9OQvbgIczskdaWIv1g==
X-Received: by 2002:a05:6402:22b9:b0:4a2:6f53:c417 with SMTP id cx25-20020a05640222b900b004a26f53c417mr1370199edb.32.1675168634511;
        Tue, 31 Jan 2023 04:37:14 -0800 (PST)
Message-ID: <5c6e413b606ae268f0a6a24d347d6dd994598d37.camel@gmail.com>
Subject: Re: [PATCH v8 1/2] xen/riscv: introduce early_printk basic stuff
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, Bobby Eshleman
 <bobby.eshleman@gmail.com>
Date: Tue, 31 Jan 2023 14:37:13 +0200
In-Reply-To: <12f4a315-19dc-2462-7bbf-f02408b09081@xen.org>
References: <cover.1675163330.git.oleksii.kurochko@gmail.com>
	 <06c2c36bd68b2534c757dc4087476e855253680a.1675163330.git.oleksii.kurochko@gmail.com>
	 <12f4a315-19dc-2462-7bbf-f02408b09081@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

Hi Julien,

On Tue, 2023-01-31 at 11:42 +0000, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 31/01/2023 11:17, Oleksii Kurochko wrote:
> > Because printk() relies on a serial driver (like the ns16550
> > driver)
> > and drivers require working virtual memory (ioremap()) there is not
> > print functionality early in Xen boot.
> >=20
> > The patch introduces the basic stuff of early_printk functionality
> > which will be enough to print 'hello from C environment".
> >=20
> > Originally early_printk.{c,h} was introduced by Bobby Eshleman
> > (
> > https://github.com/glg-rv/xen/commit/a3c9916bbdff7ad6030055bbee7e53d
> > 1aab71384)
> > but some functionality was changed:
> > early_printk() function was changed in comparison with the original
> > as
> > common isn't being built now so there is no vscnprintf.
> >=20
> > This commit adds early printk implementation built on the putc SBI
> > call.
> >=20
> > As sbi_console_putchar() is already being planned for deprecation
> > it is used temporarily now and will be removed or reworked after
> > real uart will be ready.
> >=20
> > Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > Reviewed-by: Bobby Eshleman <bobby.eshleman@gmail.com>
> > ---
> > Changes in V8:
> > =C2=A0=C2=A0=C2=A0=C2=A0 - Nothing was changed
> > ---
> > Changes in V7:
> > =C2=A0=C2=A0=C2=A0=C2=A0 - Nothing was changed
> > ---
> > Changes in V6:
> > =C2=A0=C2=A0=C2=A0=C2=A0 - Remove __riscv_cmodel_medany check from earl=
y_printk.c
>=20
> This discussion is still not resolved. I will echo Jan's point [1]
> and=20
> expand it. There is limited point to keep sending a new version for=20
> small changes if there main open points are not addressed.
>=20
> Can you please look at settling done on the issues first and then
> send a=20
> new version?
Sure, I won't provide new patch series until the issue will be
resolved.

This patch series has been sent to resolve an issue with CI&CD which I
missed after the renaming of task for RISC-V in build.yaml.

~ Oleksii
>=20
> Cheers,
>=20
> [1] 1d63dd9a-77df-4fca-e35b-886ba19fb35d@suse.com
>=20


