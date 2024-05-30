Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A75548D51B6
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 20:22:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732944.1138998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCkPr-000111-4W; Thu, 30 May 2024 18:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732944.1138998; Thu, 30 May 2024 18:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCkPr-0000zO-1W; Thu, 30 May 2024 18:22:19 +0000
Received: by outflank-mailman (input) for mailman id 732944;
 Thu, 30 May 2024 18:22:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LA40=NB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sCkPp-0000zI-96
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 18:22:17 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a1a5363-1eb1-11ef-b4bb-af5377834399;
 Thu, 30 May 2024 20:22:14 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2e95a883101so15651731fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 11:22:14 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d34b44sm34711e87.47.2024.05.30.11.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 11:22:13 -0700 (PDT)
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
X-Inumbo-ID: 8a1a5363-1eb1-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717093334; x=1717698134; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Gbgfy0IeTG3caifn22RgpWb2FS+8d3sBHn20PALzr2Y=;
        b=BcIQW3R+N8kmQMeuhete06E/VMLi8mQPM96ee1efhusEhuR5oPtRrfv1y1GkOC0Jnw
         ibUKERCI5pQe2SeX/kiFVdu09iu0GKw3PvRkNSeNLLmHk5mG4UZxYZaVfp/8sFsSmU3v
         jINl24bL3CiJUloEmUnJwVbQtAt8Gl1m9Q9P03HGb6K3zxALL3sYCTLojfXdsrxfJjRd
         JtGcH8cl9pO3Ub+WA76tNAaujCPZ5P+PttoyUBtz+ngehsgQJJ77IlCCVjjw1VkC2DGm
         BFBfMKlql5GqgCY0lGNH8AxKz8zWG0loz3PhcJV27ppqypX/koEhYnW7X8m9/vrs6GBW
         jDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717093334; x=1717698134;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gbgfy0IeTG3caifn22RgpWb2FS+8d3sBHn20PALzr2Y=;
        b=HXkD9k6b21DNrTaN3NetdRZsfifU1NU4mEAIIVPZwUu1lIFWSEmew2MeeCUcNhw1s6
         /D1wpx8lZsCJqT1sDInaxc5TNT9mWxZwDnkl/vXelTkgFFHqwpEWnTzD/aKU/OuZpur8
         gUlc1OALFNFIwArKCOvJRjPcJjfR2bX862ctm579V7uCVuYhHSZ4K6gu1Gp5xCTGL7A8
         pEyOVkaad2GiF1RebROOArB7t6huy75IUWL4/dr8h9ASjACwg2fJ+jlgdFMGce/SC4uV
         wi8Xhnn1J7BcF23v1CtfbvQ5AFr0+wG/asEyW8Ozmzr2upQKjV+iQG0BdSUxJFxyxgKh
         6Mxg==
X-Forwarded-Encrypted: i=1; AJvYcCVPaQS3GNdp30KpJXJNcf3YPJdGomOdUr79L15QiVlM9Im2hrx4pHA2P4oHZUcB3UMm8EnC1ez9ADZRXIKLCdj/uPi/04m6AqNgaI0aKkI=
X-Gm-Message-State: AOJu0YyJ7zRP/AZl+Wuk/3CcsMX/ixzT65BFIeVXBXG6FYH5yFZoSk+H
	z9wtFTnk6unc1g32TsnsEDShk/dsZ5/m7UiGlOJRaODBBjRp4EjD
X-Google-Smtp-Source: AGHT+IH+Jv246nTz3BmjhX4ngAvAPZgSFMIFXNCD4MCgktBeKti0UCEVEkgUjnZDxWP8059wx1/8vA==
X-Received: by 2002:ac2:5217:0:b0:52b:7a10:3537 with SMTP id 2adb3069b0e04-52b7d47a0e8mr1783402e87.54.1717093334008;
        Thu, 30 May 2024 11:22:14 -0700 (PDT)
Message-ID: <7721c1b4eb0ea76cca5460264954d40d639499b7.camel@gmail.com>
Subject: Re: [PATCH v12 5/8] xen/riscv: add minimal stuff to mm.h to build
 full Xen
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Date: Thu, 30 May 2024 20:22:12 +0200
In-Reply-To: <70128dba-498f-4d85-8507-bb1621182754@citrix.com>
References: <cover.1717008161.git.oleksii.kurochko@gmail.com>
	 <d00b86f41ef2c7d928a28dadd8c34fb845f23d0a.1717008161.git.oleksii.kurochko@gmail.com>
	 <70128dba-498f-4d85-8507-bb1621182754@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Thu, 2024-05-30 at 18:23 +0100, Andrew Cooper wrote:
> On 29/05/2024 8:55 pm, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
> This patch looks like it can go in independently?=C2=A0 Or does it depend
> on
> having bitops.h working in practice?
>=20
> However, one very strong suggestion...
>=20
>=20
> > diff --git a/xen/arch/riscv/include/asm/mm.h
> > b/xen/arch/riscv/include/asm/mm.h
> > index 07c7a0abba..cc4a07a71c 100644
> > --- a/xen/arch/riscv/include/asm/mm.h
> > +++ b/xen/arch/riscv/include/asm/mm.h
> > @@ -3,11 +3,246 @@
> > <snip>
> > +/* PDX of the first page in the frame table. */
> > +extern unsigned long frametable_base_pdx;
> > +
> > +/* Convert between machine frame numbers and page-info structures.
> > */
> > +#define
> > mfn_to_page(mfn)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 (frame_table + (mfn_to_pdx(mfn) - frametable_base_p=
dx))
> > +#define
> > page_to_mfn(pg)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 pdx_to_mfn((unsigned long)((pg) - frame_table) +
> > frametable_base_pdx)
>=20
> Do yourself a favour and not introduce frametable_base_pdx to begin
> with.
>=20
> Every RISC-V board I can find has things starting from 0 in physical
> address space, with RAM starting immediately after.
I checked Linux kernel and grep there:
   [ok@fedora linux-aia]$ grep -Rni "memory@" arch/riscv/boot/dts/ --
   exclude "*.tmp" -I
   arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi:33:   =
=20
   memory@40000000 {
   arch/riscv/boot/dts/starfive/jh7100-common.dtsi:28:     memory@80000000
   {
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts:49:      ddrc_cache:
   memory@1000000000 {
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts:33:   ddrc_cache_lo:
   memory@80000000 {
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts:37:   ddrc_cache_hi:
   memory@1040000000 {
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts:34:      ddrc_cache_lo:
   memory@80000000 {
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts:40:      ddrc_cache_hi:
   memory@1000000000 {
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dts:22:   ddrc_cache_lo:
   memory@80000000 {
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dts:27:   ddrc_cache_hi:
   memory@1000000000 {
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts:57:   ddrc_cache_lo:
   memory@80000000 {
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts:63:   ddrc_cache_hi:
   memory@1040000000 {
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts:32:  memory@0 {
   arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi:14:    =20
   memory@0 {
   arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts:26:    memory@80000000
   {
   arch/riscv/boot/dts/sophgo/cv1812h.dtsi:12:     memory@80000000 {
   arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts:26: memory@80000000
   {
   arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts:25: memory@80000000
   {
   arch/riscv/boot/dts/canaan/k210.dtsi:82:        sram: memory@80000000 {
  =20
And based on  that majority of supported by Linux kernel boards has RAM
starting not from 0 in physical address space. Am I confusing
something?

>=20
> Taking the microchip board as an example, RAM actually starts at
> 0x8000000,
Today we had conversation with the guy from SiFive in xen-devel channel
and he mentioned that they are using "starfive visionfive2 and sifive
unleashed platforms." which based on the grep above has RAM not at 0
address.

Also, QEMU uses 0x8000000.

>  which means that having frametable_base_pdx and assuming it
> does get set to 0x8000 (which isn't even a certainty, given that I
> think
> you'll need struct pages covering the PLICs), then what you are
> trading
> off is:
>=20
> * Saving 32k of virtual address space only (no need to even allocate
> memory for this range of the framtable), by
> * Having an extra memory load and add/sub in every page <-> mfn
> conversion, which is a screaming hotpath all over Xen.
>=20
> It's a terribly short-sighted tradeoff.
>=20
> 32k of VA space might be worth saving in a 32bit build (I personally
> wouldn't - especially as there's no need to share Xen's VA space with
> guests, given no PV guests on ARM/RISC-V), but it's absolutely not at
> all in an a 64bit build with TB of VA space available.
>=20
> Even if we do find a board with the first interesting thing in the
> frametable starting sufficiently away from 0 that it might be worth
> considering this slide, then it should still be Kconfig-able in a
> similar way to PDX_COMPRESSION.
I found your tradeoffs reasonable, but I don't understand how it will
work if RAM does not start from 0, as the frametable address and RAM
address are linked.
I tried to look at the PDX_COMPRESSION config and couldn't find any
"slide" there. Could you please clarify this for me?
If to use this "slide" would it help to avoid the mentioned above
tradeoffs?

One more question: if we decide to go without frametable_base_pdx,
would it be sufficient to simply remove mentions of it from the code (
at least, for now )?

~ Oleksii
>=20
> You don't want to be penalising everyone because of a
> theoretical/weird
> corner case.


>=20
> ~Andrew


