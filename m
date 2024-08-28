Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAF1962DE2
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 18:48:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785028.1194451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjLqH-0006AR-2X; Wed, 28 Aug 2024 16:48:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785028.1194451; Wed, 28 Aug 2024 16:48:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjLqG-00068w-Vx; Wed, 28 Aug 2024 16:48:20 +0000
Received: by outflank-mailman (input) for mailman id 785028;
 Wed, 28 Aug 2024 16:48:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9MTI=P3=bounce.vates.tech=bounce-md_30504962.66cf54ce.v1-3a80558c6cae4a62bbe164a50dae955a@srs-se1.protection.inumbo.net>)
 id 1sjLqE-00068p-Q7
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 16:48:19 +0000
Received: from mail187-32.suw11.mandrillapp.com
 (mail187-32.suw11.mandrillapp.com [198.2.187.32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52243ebf-655d-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 18:48:16 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-32.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4Wv9Mf20DxzQXgCV9
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 16:48:14 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 3a80558c6cae4a62bbe164a50dae955a; Wed, 28 Aug 2024 16:48:14 +0000
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
X-Inumbo-ID: 52243ebf-655d-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1724863694; x=1725124194;
	bh=8NvK91ipe60HCoJYurXZDNDoH6ucf6ji/cyjBADJiGw=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=qylCvrzJLY0ccwpvzEV0owT4LCWYcvLo7Z/pGojFryzVVjmwiKkAfUfIezwV5an/e
	 DhSkQ0T3guKUJwJb9cacSQEMtDTWYPBKlNhdLR6jXzUg85kZOokG77V+/Oblmt3o+C
	 LcvGib4CYw1kD2vT+Zh9RCvdm7Em+qCzwEoEC+yBbDXK7LDMrCwP1+d74XMxU5zhGA
	 eCfMpmnHp1arBe/hoSEJOJgD1YvBWyGE97gyu9sO7Gq3MEfJdHc7MqKKVhhoIB3CqE
	 6zwEd+DiKF0MrgsFmWl8baVLezVc+L4dy0IPIxoq0QpTO2dMWC4IN7DhryBIGWzF29
	 x6I0yFx0l2CXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1724863694; x=1725124194; i=anthony.perard@vates.tech;
	bh=8NvK91ipe60HCoJYurXZDNDoH6ucf6ji/cyjBADJiGw=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=bTYaD2hnMc+BbPzw3L5NyKUg16FRWTeVRoejFBUdz+ouasejtQwSKMpxHEKEwK3Jo
	 ww/trbe3j/07ehlpdigWRLRXM0bEjOaQclumiJNM5a3saF/fu17fUduJPaz+GikWhi
	 o3vD3xKt7IhvPkeIe28fzt4wg+IYYRt3Mdwm3KnvPZKx6gerXOoYfesPEmn0ZJ/AFL
	 gw6HXYpEFF76BHGQhf0WFOwJ78htw8tbuPp7wQEW1ViuKQ6yYiyD1A1AqJ5S2gicFS
	 UrdI6fQk3tSJp2Puu76mC+ipJ3DW4JP6/oKAqKpK+Lffezji4sP2bpLauMYoBrvhtP
	 lm9ZWywd/+6Hg==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3=203/3]=20Do=20not=20access=20/dev/mem=20in=20MSI-X=20PCI=20passthrough=20on=20Xen?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1724863693032
To: =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Message-Id: <Zs9UzJVsjKU0/frk@l14>
References: <cover.f5d45e3c2fb87552abfaf80982b0b724fca2134c.1714955598.git-series.marmarek@invisiblethingslab.com> <ebeb8c419feedad9fe0e9f39d3ed3a9ff0f4c49b.1714955598.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <ebeb8c419feedad9fe0e9f39d3ed3a9ff0f4c49b.1714955598.git-series.marmarek@invisiblethingslab.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.3a80558c6cae4a62bbe164a50dae955a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240828:md
Date: Wed, 28 Aug 2024 16:48:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 06, 2024 at 02:33:22AM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> diff --git a/hw/xen/xen_pt_msi.c b/hw/xen/xen_pt_msi.c
> index 09cca4e..836cc9c 100644
> --- a/hw/xen/xen_pt_msi.c
> +++ b/hw/xen/xen_pt_msi.c
> @@ -493,7 +501,12 @@ static uint64_t pci_msix_read(void *opaque, hwaddr a=
ddr,
>          return get_entry_value(&msix->msix_entry[entry_nr], offset);
>      } else {
>          /* Pending Bit Array (PBA) */
> -        return *(uint32_t *)(msix->phys_iomem_base + addr);
> +        if (s->msix->phys_iomem_base) {
> +            return *(uint32_t *)(msix->phys_iomem_base + addr);
> +        }
> +        XEN_PT_LOG(&s->dev, "reading PBA, addr 0x%lx, offset 0x%lx\n",
> +                   addr, addr - msix->total_entries * PCI_MSIX_ENTRY_SIZ=
E);
> +        return 0xFFFFFFFF;

If Xen advertise XENFEAT_dm_msix_all_writes, we are not expecting QEMU
to reach this code, right? A comment might be useful.

>      }
>  }
>  
> @@ -576,33 +593,40 @@ int xen_pt_msix_init(XenPCIPassthroughState *s, uin=
t32_t base)
>      msix->table_base =3D s->real_device.io_regions[bar_index].base_addr;
>      XEN_PT_LOG(d, "get MSI-X table BAR base 0x%"PRIx64"\n", msix->table_=
base);
>  
> +    /* Accessing /dev/mem is needed only on older Xen. */
> +    if (!(xc_version_info.submap & (1U << XENFEAT_dm_msix_all_writes))) =
{

Would it be ok to use test_bit() instead?

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


