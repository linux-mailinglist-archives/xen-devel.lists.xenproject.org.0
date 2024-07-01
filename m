Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D6391E538
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 18:22:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751838.1159914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOJmO-0002m2-AL; Mon, 01 Jul 2024 16:21:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751838.1159914; Mon, 01 Jul 2024 16:21:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOJmO-0002jc-6m; Mon, 01 Jul 2024 16:21:24 +0000
Received: by outflank-mailman (input) for mailman id 751838;
 Mon, 01 Jul 2024 16:21:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=geB4=OB=bounce.vates.tech=bounce-md_30504962.6682d77d.v1-0705d1d3cc834a03985c17a25c975ae7@srs-se1.protection.inumbo.net>)
 id 1sOJmN-0002jW-Dx
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 16:21:23 +0000
Received: from mail145-25.atl61.mandrillapp.com
 (mail145-25.atl61.mandrillapp.com [198.2.145.25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1fd6761-37c5-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 18:21:18 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-25.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4WCWWK2BcMz35hdVW
 for <xen-devel@lists.xenproject.org>; Mon,  1 Jul 2024 16:21:17 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 0705d1d3cc834a03985c17a25c975ae7; Mon, 01 Jul 2024 16:21:17 +0000
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
X-Inumbo-ID: f1fd6761-37c5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1719850877; x=1720111377;
	bh=D6Xn07DWPt6RLLyPEmJr9xUKep84FjQeTYDK7N3xyWk=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=p5XT8UAkd4rMqJNjeXEC1QbkpFw2fva655dmDQTwIpG273WEj6D/thEMbm0tIfrc3
	 Qc5/Bl2jTln/8zilENvyOBoYG1CMeg20rmHCTB0pw2mzynItV7hyfD87fQSEBMu0qE
	 ig2JpTYEdWqiQKpcLb57wJmWbE2asiHBCZ+mJffFR3nDIL1d2GzqofxbZHCLYKiIpw
	 rGGPq268B1lga0z8cERJsfsTMIKvddDYCf947KcC+0Ovz7HMBvy1j6AENkDDTxKp3C
	 QJNtNFCM0EcfMAalW61+rvWnj9fXG+O0FQmINrPy5/WfDpD2X2VHpkzN2vD5jtAFqA
	 NkELdraIt64Gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1719850877; x=1720111377; i=anthony.perard@vates.tech;
	bh=D6Xn07DWPt6RLLyPEmJr9xUKep84FjQeTYDK7N3xyWk=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=O2K7riaI4Y/+QypTIMksg3Fi/e2/kTgDbEM6/AW9qqgZzYLWp6zNCx/qChKvHrCYe
	 j+iljCTYsekMI5UrFgMMuUXtoFjcj2gb1JjMecXYbNJKgRB1c8kGtRjkTHp4f2Uy8U
	 ek8i2KOiQQGlTyS/Poc3fib7tAdLfIO//ULsEVG1WB5QdnbFwQG0/8JjZ9zLAh/T+v
	 RUfrgFfxCxkno0aYBJ7KOzVNeypWpmA6JoE14UZ5ApjzZZshDBOEwFZDD5BnWVoh4M
	 3fXnX+OnUIu0A2s1icT4g299sjG8ORse9DoJXqqI9WBpTxGraIw3D8Pv3dbzVdt8KL
	 HFAH9AXm06FwA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v8=202/8]=20xen:=20mapcache:=20Unmap=20first=20entries=20in=20buckets?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1719850876152
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, sstabellini@kernel.org, jgross@suse.com, "Edgar E. Iglesias" <edgar.iglesias@amd.com>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Message-Id: <ZoLXe9wjyXCU88Y0@l14>
References: <20240529140739.1387692-1-edgar.iglesias@gmail.com> <20240529140739.1387692-3-edgar.iglesias@gmail.com> <ZoKnQLBwIwh004yy@l14> <CAJy5ezqdxQ_y_sCyP243yTfgOJfLh1COzN9Eg+PxxoaVeOh-mQ@mail.gmail.com> <CAJy5ezrSs8r=ibTgb_oURdFTDW07sVVBeU6Rw7jsM+iaqPLNgg@mail.gmail.com> <CAJy5ezrPgUR3-gWK3Mfnc7iAgV3MEStSardY+0kkvHB+PHbe4w@mail.gmail.com>
In-Reply-To: <CAJy5ezrPgUR3-gWK3Mfnc7iAgV3MEStSardY+0kkvHB+PHbe4w@mail.gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.0705d1d3cc834a03985c17a25c975ae7?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240701:md
Date: Mon, 01 Jul 2024 16:21:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2024 at 04:34:53PM +0200, Edgar E. Iglesias wrote:
> On Mon, Jul 1, 2024 at 4:30=E2=80=AFPM Edgar E. Iglesias <edgar.iglesias@=
gmail.com>
> wrote:
> > On Mon, Jul 1, 2024 at 3:58=E2=80=AFPM Edgar E. Iglesias <edgar.iglesia=
s@gmail.com>
> > wrote:
> >> Any chance you could try to get a backtrace from QEMU when it failed?

Here it is:


#3  0x00007fa8762f4472 in __GI_abort () at ./stdlib/abort.c:79
        save_stage =3D 1
        act =3D {__sigaction_handler =3D {sa_handler =3D 0x20, sa_sigaction=
 =3D 0x20}, sa_mask =3D {__val =3D {94603440166168, 18446744073709551615, 9=
4603406369640, 0, 0, 94603406346720, 94603440166168, 140361486774256, 0, 14=
0361486773376, 94603401285536, 140361496232688, 94603440166096, 14036148677=
3456, 94603401289576, 140360849280256}}, sa_flags =3D -1804462896, sa_resto=
rer =3D 0x748f2d40}
#4  0x0000560a92230f0d in qemu_get_ram_block (addr=3D18446744073709551615) =
at ../system/physmem.c:801
        block =3D 0x0
#5  0x0000560a922350ab in qemu_ram_block_from_host (ptr=3D0x7fa84e8fcd00, r=
ound_offset=3Dfalse, offset=3D0x7fa8748f2de8) at ../system/physmem.c:2280
        ram_addr =3D 18446744073709551615
        _rcu_read_auto =3D 0x1
        block =3D 0x0
        host =3D 0x7fa84e8fcd00 ""
        _rcu_read_auto =3D 0x7fa8751f8288
#6  0x0000560a92229669 in memory_region_from_host (ptr=3D0x7fa84e8fcd00, of=
fset=3D0x7fa8748f2de8) at ../system/memory.c:2440
        block =3D 0x0
#7  0x0000560a92237418 in address_space_unmap (as=3D0x560a94b05a20, buffer=
=3D0x7fa84e8fcd00, len=3D32768, is_write=3Dtrue, access_len=3D32768) at ../=
system/physmem.c:3246
        mr =3D 0x0
        addr1 =3D 0
        __PRETTY_FUNCTION__ =3D "address_space_unmap"
#8  0x0000560a91fd6cd3 in dma_memory_unmap (as=3D0x560a94b05a20, buffer=3D0=
x7fa84e8fcd00, len=3D32768, dir=3DDMA_DIRECTION_FROM_DEVICE, access_len=3D3=
2768) at /root/build/qemu/include/sysemu/dma.h:236
#9  0x0000560a91fd763d in dma_blk_unmap (dbs=3D0x560a94d87400) at ../system=
/dma-helpers.c:93
        i =3D 1
#10 0x0000560a91fd76e6 in dma_complete (dbs=3D0x560a94d87400, ret=3D0) at .=
./system/dma-helpers.c:105
        __PRETTY_FUNCTION__ =3D "dma_complete"
#11 0x0000560a91fd781c in dma_blk_cb (opaque=3D0x560a94d87400, ret=3D0) at =
../system/dma-helpers.c:129
        dbs =3D 0x560a94d87400
        ctx =3D 0x560a9448da90
        cur_addr =3D 0
        cur_len =3D 0
        mem =3D 0x0
        __PRETTY_FUNCTION__ =3D "dma_blk_cb"
#12 0x0000560a9232e974 in blk_aio_complete (acb=3D0x560a9448d5f0) at ../blo=
ck/block-backend.c:1555
#13 0x0000560a9232ebd1 in blk_aio_read_entry (opaque=3D0x560a9448d5f0) at .=
./block/block-backend.c:1610
        acb =3D 0x560a9448d5f0
        rwco =3D 0x560a9448d618
        qiov =3D 0x560a94d87460
        __PRETTY_FUNCTION__ =3D "blk_aio_read_entry"

> > One more thing, regarding this specific patch. I don't think we should
> > clear the
> > entire entry, the next field should be kept, otherwise we'll disconnect
> > following
> > mappings that will never be found again. IIUC, this could very well be
> > causing the problem you see.
> >
> > Does the following make sense?
> >
> And here without double-freeing entry->valid_mapping:
> 
> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> index 5f23b0adbe..667807b3b6 100644
> --- a/hw/xen/xen-mapcache.c
> +++ b/hw/xen/xen-mapcache.c
> @@ -597,7 +597,13 @@ static void
> xen_invalidate_map_cache_entry_unlocked(MapCache *mc,
>          pentry->next =3D entry->next;
>          g_free(entry);
>      } else {
> -        memset(entry, 0, sizeof *entry);
> +        /* Invalidate mapping.  */
> +        entry->paddr_index =3D 0;
> +        entry->vaddr_base =3D NULL;
> +        entry->size =3D 0;
> +        entry->valid_mapping =3D NULL;
> +        entry->flags =3D 0;
> +        /* Keep entry->next pointing to the rest of the list.  */
>      }
>  }

I've tried this patch, and that fix the issue I've seen. I'll run more
tests on it, just in case, but there's no reason that would break
something else.

Cheers,


-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


