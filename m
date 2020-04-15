Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 585B71AA9E0
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 16:28:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOj1T-000240-MX; Wed, 15 Apr 2020 14:28:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Tbih=57=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jOj1R-00023n-OT
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 14:28:13 +0000
X-Inumbo-ID: 563b39cc-7f25-11ea-b58d-bc764e2007e4
Received: from mail-ed1-x529.google.com (unknown [2a00:1450:4864:20::529])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 563b39cc-7f25-11ea-b58d-bc764e2007e4;
 Wed, 15 Apr 2020 14:28:13 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id v1so5075710edq.8
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2020 07:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=zRDWejqZOu4I3rDxoALy34zPC87m3axdSTkg/jWQXik=;
 b=qJSqF4Mk3gjolhB8rf7wKTo1R+gBj7JOFrPgSGB09W9s/gVR9fvewBQpZLKNCXUY9E
 CWmgOqV1rqWK8ATLfprcfH7x9vpxk1wXaTjCpI+oBrS2HgzTd8jCDmgRYgGjhm+5Fvv+
 yZnly6w3JewfxBhYL8aRgz/ZcTEKI/vF1BIwkViAQ2Mu2AqN1y8z7ieeclzX1E8EXD23
 w1YInlHE8gqiiqPrOgYczqYVLPz9b0w9sgX1l8TVHZFPDzjsS3JE8I9MUoGJcGIqYkwb
 Eru4qFPMd4rY5KC4fLVBfSN2Fs2dRXJuyuxdsucbdDD+ZLu/sTRpFFfxfRTWHFPI9P5R
 YMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=zRDWejqZOu4I3rDxoALy34zPC87m3axdSTkg/jWQXik=;
 b=cXDLEK3u82Bh6siYBLG5nHS4e0xdz3q4nGmsq4hUm6Zp/5v05gTNX7wQS2dViYQF+N
 Pwj0MCyv2U+bdDWhtFArh+8iN//JpMEPFa8aUpYS7TTRlC/qGBT0mNhVI08hex3ndeMT
 Snhk9RyN3bJ+xPevrHlDEZ8wVmJKQtd5SPdOVaXId12SnKEWJGiVMO5nwF1qoukpSTIC
 P7uy3N7Tm1ntZ+xm7wI7WtNE0PYTtsbHffQx/KNOJDnRRzzkP9r5MHaxYZofXEFjA2di
 FV442mdFzKEFcchsvs1OGKpEDaAb1grXMLNjGW6MqkiCuKUX1xBJsRe4dgh5YJOpEe2k
 uSHA==
X-Gm-Message-State: AGi0PuZ6EXy1sn21Yb6GIaA6aqDl9kL/1ThFWUGL9evsTVp9s14dVar6
 V3rRahiZxRaRf+G2IX0jbGo=
X-Google-Smtp-Source: APiQypLjNCFpq520RRIJ3vSvyQ6C5IKem8PMjVdXlJHDqi2H5SFhWzATbTbAdk5ZzBGrCIAZY/gVyQ==
X-Received: by 2002:a50:f7ca:: with SMTP id i10mr26202693edn.274.1586960892188; 
 Wed, 15 Apr 2020 07:28:12 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id i26sm2181368edx.23.2020.04.15.07.28.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Apr 2020 07:28:11 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Harsha Shamsundara Havanur'" <havanur@amazon.com>,
 <xen-devel@lists.xenproject.org>
References: <9cfd038719fee7fcb01b8967ffcb23802bb75a0b.1586953651.git.havanur@amazon.com>
In-Reply-To: <9cfd038719fee7fcb01b8967ffcb23802bb75a0b.1586953651.git.havanur@amazon.com>
Subject: RE: [XEN PATCH v5] hvmloader: Enable MMIO and I/O decode,
 after all resource allocation
Date: Wed, 15 Apr 2020 15:28:10 +0100
Message-ID: <000501d61332$176a3fe0$463ebfa0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQKFNRJ78JBsHK6AS4VlXgPbepkbbqcb92eQ
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>, 'Jan Beulich' <jbeulich@suse.com>,
 'Wei Liu' <wl@xen.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Harsha Shamsundara Havanur
> Sent: 15 April 2020 13:28
> To: xen-devel@lists.xenproject.org
> Cc: Wei Liu <wl@xen.org>; Andrew Cooper <andrew.cooper3@citrix.com>; =
Ian Jackson
> <ian.jackson@eu.citrix.com>; Jan Beulich <jbeulich@suse.com>; Harsha =
Shamsundara Havanur
> <havanur@amazon.com>; Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Subject: [XEN PATCH v5] hvmloader: Enable MMIO and I/O decode, after =
all resource allocation
>=20
> It was observed that PCI MMIO and/or IO BARs were programmed with
> memory and I/O decodes (bits 0 and 1 of PCI COMMAND register) enabled,
> during PCI setup phase. This resulted in incorrect memory mapping as
> soon as the lower half of the 64 bit bar is programmed.
> This displaced any RAM mappings under 4G. After the
> upper half is programmed PCI memory mapping is restored to its
> intended high mem location, but the RAM displaced is not restored.
> The OS then continues to boot and function until it tries to access
> the displaced RAM at which point it suffers a page fault and crashes.
>=20
> This patch address the issue by deferring enablement of memory and
> I/O decode in command register until all the resources, like =
interrupts
> I/O and/or MMIO BARs for all the PCI device functions are programmed,
> in the descending order of memory requested.
>=20
> Signed-off-by: Harsha Shamsundara Havanur <havanur@amazon.com>
>=20
> ---
> Changes in v5:
>   - Fix style and comment
>   - Enable Bus master for all valid device functions
>=20
> Changes in v4:
>   Addressed review comments from Jan Beulich <jbeulich@suse.com>
>   - Disable decodes before writing ~0 to BARs
>   - Enable BUS MASTER at the end along with decode bits
>=20
> Changes in v3:
>   - Retained enabling of BUS master for all device functions as
>     was in original commit
>=20
> Changes in v2:
>   - BUS MASTER state was captured and restored to the same state
>     while enabling decode bits.
> ---
> ---
>  tools/firmware/hvmloader/pci.c | 49 =
+++++++++++++++++++++++++++++++-----------
>  1 file changed, 36 insertions(+), 13 deletions(-)
>=20
> diff --git a/tools/firmware/hvmloader/pci.c =
b/tools/firmware/hvmloader/pci.c
> index 0b708bf578..47cba69ce4 100644
> --- a/tools/firmware/hvmloader/pci.c
> +++ b/tools/firmware/hvmloader/pci.c
> @@ -84,6 +84,7 @@ void pci_setup(void)
>      uint32_t vga_devfn =3D 256;
>      uint16_t class, vendor_id, device_id;
>      unsigned int bar, pin, link, isa_irq;
> +    uint8_t pci_devfn_decode_type[256] =3D {};
>=20
>      /* Resources assignable to PCI devices via BARs. */
>      struct resource {
> @@ -120,6 +121,13 @@ void pci_setup(void)
>       */
>      bool allow_memory_relocate =3D 1;
>=20
> +    BUILD_BUG_ON((typeof(*pci_devfn_decode_type))PCI_COMMAND_IO !=3D
> +            PCI_COMMAND_IO);
> +    BUILD_BUG_ON((typeof(*pci_devfn_decode_type))PCI_COMMAND_MEMORY =
!=3D
> +            PCI_COMMAND_MEMORY);
> +    BUILD_BUG_ON((typeof(*pci_devfn_decode_type))PCI_COMMAND_MASTER =
!=3D
> +            PCI_COMMAND_MASTER);
> +

These don't align. Looks like you used an indent of 8 which seems =
entirely arbitrary.

The rest LGTM.

  Paul


