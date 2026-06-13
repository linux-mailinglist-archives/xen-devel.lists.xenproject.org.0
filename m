Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DBpQG/RALWpreQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 13:37:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBBC67E7C8
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 13:37:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm1 header.b=damfCl8h;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b=XwmTienq;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=invisiblethingslab.com
Received: from list by lists.xenproject.org with outflank-mailman.1337259.1598786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYMfa-0003vM-9Q; Sat, 13 Jun 2026 11:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337259.1598786; Sat, 13 Jun 2026 11:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYMfa-0003tJ-6S; Sat, 13 Jun 2026 11:36:58 +0000
Received: by outflank-mailman (input) for mailman id 1337259;
 Sat, 13 Jun 2026 11:36:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wYMfY-0003tD-W1
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 11:36:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYMfY-00CT8d-Cv
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 13:36:56 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a2d405f-e002-0a2a0a5209dd-0a2a4508a8ac-44
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 13:36:56 +0200
Received: from [103.168.172.144] (helo=fout-a1-smtp.messagingengine.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a2d40d6-63b5-0a2a45080019-67a8ac90ea6d-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 13:36:55 +0200
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id 85DE2EC011C;
 Sat, 13 Jun 2026 07:36:54 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Sat, 13 Jun 2026 07:36:54 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Jun 2026 07:36:52 -0400 (EDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1781350614;
	 x=1781437014; bh=/r/JWaYL/fyaUzj+68PgkcU8H7/VMdu6kERZztXilDA=; b=
	damfCl8h4nZ2cxW8ejsU4eKD7InwoOstQpwauQpR67QlGQ7u1Z4re2fVzEMeeM/B
	ZgPlQkhWOZh9vbyrN34xoSidnvfg9VNAYXYywSRB4l+Q06Bxkp6ePKW3OAAEfoo6
	EcbWOGEKAT+BS7wDorKEyjdij5294vnCD5/O5b+T2X4Q66qrhH7CZxPmpvogw04y
	vbEXroC/icMrY5UQmWZ8UFswG+xsKuoSiF+bdlCqKlJudm+5VYBPTg4++UcLukT4
	LryLk/CmE5ymDyAxEgwHZPUma5yLIatXryAhu6La1nFdwKcgqUsPVia7nv20y7An
	ndqnByKUctTo/IKicGvp9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781350614; x=1781437014; bh=/r/JWaYL/fyaUzj+68PgkcU8H7/VMdu6kER
	ZztXilDA=; b=XwmTienqfWBV4mdJBPse6OsHtDOET1HbRWUuezTQHMxz3FMsBxz
	RlGKjByubQlSyD6S+8EW5h/V52r6pRambTYPtoidf8STw+HSmHBOPOxkGnh8/xT3
	hxa1ypLiZi/iJsZOwhHyT6DB8isFyLm8Xgj+2AoTZ2CRjY4DsoWc0IvtVG0z+D0E
	A240nAxr0WVd6pV38LxWry8tE95M5ScUxU9vMsePSeEmh4splTx6/pSvU0DFDGl8
	ox5fMwLtCyMqZFhqkV1khRCgvLzkG5pDdcVHnHtv1N3159sWs8jZTFp8da0QsW2/
	uEEMinxLmd9nJWns6nO2ZHZvVz4j+IqhAhg==
X-ME-Sender: <xms:1kAtagZ58fCZQlUArPdBT8EZRkVTpuXrxaU9pAzp63WrVUrZxjGPmA>
    <xme:1kAtatrv4U1YCPLhyoY-LHQ-d2xhBdqUMUaFXp4zzci37NbEi-eid4Omydlemd3NQ
    EmPb9Wsn4ajFskX7T4dne-MkPiAzncfDXIDV72bbdxRepVqBQ>
X-ME-Received: <xmr:1kAtatPX7DrTKBZtBmsJYLB5nyPJXQ-x39BzjU213MGUU2HmUWWACH5somhgO1_ZiHyWLYclV-fXu7COGd9IlsedsoOShBMosfU>
X-ME-Proxy-Cause: dmFkZTEyKldsMfUz7n9eOrcIsH6yxkBZ9aydQ8Nh6H/CfARO6H9NPJ2XOflANQO5kdjJ5G
    0bwXcetA6/7G+YsItgmmIZ+/yfmmbQSFYgaNGE97P1hfOey09hYVwsxazm0wNa1KSz0CQ5
    Jt7VDV2NoPlxAOlpPFF2wcPfrDGdVrr1Lwk8PLWCtZT4JN2T85+oQ2CZY4aXVntawnTaSQ
    R4zTDlr4eIGdVCfyfm5i7QKJasS9HKMqfXgG9DmhBAJH5lnHBXUu5TmtmpFh0aYanDe3j1
    nm1Az7T1ejXQdizsQ5cI8hIQB0k8cB2XY5cnnquqmnFoVK1ILPd1VTJfNuZ7Rwho346CeF
    CRTMlO9FBHm+BqIoRW+5LjEtewDa6B7Ort4cQ9UbvjlJ5QaUCF9Kb4ygncRJQlcsqG5eyz
    pqrfzsTw0Al9FlUHWGHPmXSm1O5CPuhw9udLSztE/yDo3Q/GzQgn4o8iSH2ThtKOo+++Jh
    s8/YJs/28nEJNZVuMKfBXdljjjjOij1klbcXBPZMvQykxfO/vmjDzSF9pW5yuZ6vTgTLSB
    IqP1qDqgC20jCajGaEzgeZkRSKuBe3EQ3nPtiKT4swqHoOcqxxfraNOzqaXeuhy7gJRzpi
    TMvEfYGJnUMUPsq3iQdnLA0kBm0MBgwSiv6dpRC2fZnZNQ01Ad/dszmID+cA
X-ME-Proxy: <xmx:1kAtagrl8l_7Z3cI_fMif1UYm1b0NRVB4hq-Sz4DXqUuVYD2TV4Qtg>
    <xmx:1kAtaqdVHy2uDcxhpW01UsjNT3HpqfctwxzNeEi_EID5apkmmtBwJw>
    <xmx:1kAtauThjHdliswON1eR5jLBiNYd_Bs7ek8vILG3jiwVTOibvTar7w>
    <xmx:1kAtarZh-ePRCdNDtolJ2HNgw-bSXkXUGxc3aJ2ET8JZg_O5OL_UUQ>
    <xmx:1kAtaqgaq2E2m2yxCxbEdfPS1O43d5-4gV2iN5NFSRTI70gUQMmGHW-b>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 13 Jun 2026 13:36:51 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/6] Align all sections to 4KB
Message-ID: <ai1A0xEjXZ1j67a8@mail-itl>
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
 <20260529153531.1341542-3-frediano.ziglio@cloud.com>
 <7067092e-ba18-4513-a9b1-83ba084ccbb4@suse.com>
 <CAHt6W4cP57pAPsNDKpssjYB=snLEZgOhWkYkVrJys01-NTMiRQ@mail.gmail.com>
 <75e86d74-9fa1-4090-bea7-332ec31ffb90@suse.com>
 <CAHt6W4dfXdyw4dOkqoQzo0x4XRmLsHXkhhznov+KvanKBi9bWw@mail.gmail.com>
 <5bee4f94-b2d0-4802-a990-b2a378d2f838@suse.com>
 <CAHt6W4cb4R7i79s9wYRpPfOdmkKS+XsaO=VphZ+jvmLKiRw-ZA@mail.gmail.com>
 <f83df0b1-9177-4b89-a854-e19a22e181a7@suse.com>
 <CAHt6W4efwGwdiTvKnG4n=A6PL_FogynsV23rDDi8rj_smZVoNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YUOYS7nC2vNRwBU6"
Content-Disposition: inline
In-Reply-To: <CAHt6W4efwGwdiTvKnG4n=A6PL_FogynsV23rDDi8rj_smZVoNw@mail.gmail.com>
X-purgate-ID: tlsNG-c1860d/1781350616-B7D7BDB1-1D3CF77A/0/0
X-purgate-type: clean
X-purgate-size: 10877
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:jbeulich@suse.com,m:frediano.ziglio@cloud.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,messagingengine.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,mail-itl:mid];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DBBC67E7C8


--YUOYS7nC2vNRwBU6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 13 Jun 2026 13:36:51 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/6] Align all sections to 4KB

On Sat, Jun 13, 2026 at 12:20:53PM +0100, Frediano Ziglio wrote:
> On Thu, 11 Jun 2026 at 16:18, Jan Beulich <jbeulich@suse.com> wrote:
> >
> > On 11.06.2026 16:49, Frediano Ziglio wrote:
> > > On Wed, 10 Jun 2026 at 10:43, Jan Beulich <jbeulich@suse.com> wrote:
> > >>
> > >> On 06.06.2026 18:02, Frediano Ziglio wrote:
> > >>> Frediano
> > >>>
> > >>> On Fri, 5 Jun 2026 at 08:45, Jan Beulich <jbeulich@suse.com> wrote:
> > >>>>
> > >>>> On 04.06.2026 12:16, Frediano Ziglio wrote:
> > >>>>> On Tue, 2 Jun 2026 at 13:09, Jan Beulich <jbeulich@suse.com> wrot=
e:
> > >>>>>> On 29.05.2026 17:35, Frediano Ziglio wrote:
> > >>>>>>> --- a/xen/arch/x86/xen.lds.S
> > >>>>>>> +++ b/xen/arch/x86/xen.lds.S
> > >>>>>>> @@ -162,8 +162,8 @@ SECTIONS
> > >>>>>>>         __note_gnu_build_id_end =3D .;
> > >>>>>>>    } PHDR(note) PHDR(text)
> > >>>>>>>  #elif defined(BUILD_ID_EFI)
> > >>>>>>> -  /* Workaround bug in binutils < 2.36 */
> > >>>>>>> -  . =3D ALIGN(32);
> > >>>>>>> +  /* align to satisfy UEFI CA memory mitigation */
> > >>>>>>> +  . =3D ALIGN(PAGE_SIZE);
> > >>>>>>>    DECL_SECTION(.buildid) {
> > >>>>>>>         __note_gnu_build_id_start =3D .;
> > >>>>>>>         *(.buildid)
> > >>>>>>> @@ -330,6 +330,7 @@ SECTIONS
> > >>>>>>>    __2M_rwdata_end =3D ALIGN(SECTION_ALIGN);
> > >>>>>>>
> > >>>>>>>  #ifdef EFI
> > >>>>>>> +  . =3D ALIGN(PAGE_SIZE);
> > >>>>>>>    .reloc ALIGN(4) : {
> > >>>>>>>      __base_relocs_start =3D .;
> > >>>>>>>      *(.reloc)
> > >>>>>>> @@ -355,6 +356,7 @@ SECTIONS
> > >>>>>>>    VIRT_START &=3D 0;
> > >>>>>>>    ALT_START &=3D 0;
> > >>>>>>>
> > >>>>>>> +  . =3D ALIGN(PAGE_SIZE);
> > >>>>>>>    .sbat (NOLOAD) : { *(.sbat) }
> > >>>>>>>  #elif defined(XEN_BUILD_EFI)
> > >>>>>>>    /*
> > >>>>>>
> > >>>>>> You say "all sections" in the title, yet this is not covering e.=
g. debug
> > >>>>>> info.
> > >>>>>
> > >>>>> I will change to "all loadable sections". debug sections are not
> > >>>>> loadable so they don't cause an issue.
> > >>>>
> > >>>> Please try to be precise there, as some aspects are subtle. As per=
 my
> > >>>> understanding, like .reloc all .debug_* are loadable (and may be l=
oaded).
> > >>>> The IMAGE_SCN_MEM_DISCARDABLE flag merely means they can be discar=
ded at
> > >>>> a certain point after image loading (for .reloc in particular: aft=
er
> > >>>> relocations were processed).
> > >>>
> > >>> No, debug sections are not loadable, for instance, in a random
> > >>> executable I found:
> > >>>
> > >>> Sections:
> > >>> Idx Name          Size      VMA               LMA               Fil=
e off  Algn
> > >>>   0 .text         0000c7f8  0000000140001000  0000000140001000  000=
00600  2**4
> > >>>                   CONTENTS, ALLOC, LOAD, READONLY, CODE, DATA
> > >>>   1 .data         00000250  000000014000e000  000000014000e000  000=
0ce00  2**4
> > >>>                   CONTENTS, ALLOC, LOAD, DATA
> > >>>   2 .rdata        00002c70  000000014000f000  000000014000f000  000=
0d200  2**4
> > >>>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> > >>>   3 .pdata        00000654  0000000140012000  0000000140012000  000=
10000  2**2
> > >>>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> > >>>   4 .xdata        00000630  0000000140013000  0000000140013000  000=
10800  2**2
> > >>>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> > >>>   5 .bss          00001ec0  0000000140014000  0000000140014000  000=
00000  2**4
> > >>>                   ALLOC
> > >>>   6 .idata        00000c88  0000000140016000  0000000140016000  000=
11000  2**2
> > >>>                   CONTENTS, ALLOC, LOAD, DATA
> > >>>   7 .CRT          00000060  0000000140017000  0000000140017000  000=
11e00  2**2
> > >>>                   CONTENTS, ALLOC, LOAD, DATA
> > >>>   8 .tls          00000010  0000000140018000  0000000140018000  000=
12000  2**2
> > >>>                   CONTENTS, ALLOC, LOAD, DATA
> > >>>   9 .reloc        0000009c  0000000140019000  0000000140019000  000=
12200  2**2
> > >>>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> > >>>  10 .debug_aranges 00000150  000000014001a000  000000014001a000  00=
012400  2**0
> > >>>                   CONTENTS, READONLY, DEBUGGING
> > >>>  11 .debug_info   0000d5e4  000000014001b000  000000014001b000  000=
12600  2**0
> > >>>                   CONTENTS, READONLY, DEBUGGING
> > >>>  12 .debug_abbrev 000014de  0000000140029000  0000000140029000  000=
1fc00  2**0
> > >>>                   CONTENTS, READONLY, DEBUGGING
> > >>>  13 .debug_line   00001a36  000000014002b000  000000014002b000  000=
21200  2**0
> > >>>                   CONTENTS, READONLY, DEBUGGING
> > >>>  14 .debug_frame  00000f40  000000014002d000  000000014002d000  000=
22e00  2**0
> > >>>                   CONTENTS, READONLY, DEBUGGING
> > >>>  15 .debug_str    000003a0  000000014002e000  000000014002e000  000=
23e00  2**0
> > >>>                   CONTENTS, READONLY, DEBUGGING
> > >>>  16 .debug_line_str 00000a76  000000014002f000  000000014002f000  0=
0024200  2**0
> > >>>                   CONTENTS, READONLY, DEBUGGING
> > >>>  17 .debug_loclists 0000174a  0000000140030000  0000000140030000  0=
0024e00  2**0
> > >>>                   CONTENTS, READONLY, DEBUGGING
> > >>>  18 .debug_rnglists 0000039c  0000000140032000  0000000140032000  0=
0026600  2**0
> > >>>                   CONTENTS, READONLY, DEBUGGING
> > >>
> > >> That's derived from libfd's internal representation, which means not=
hing at
> > >> all to the loader processing the image. If your objdump is suitably =
enabled,
> > >> try using its -P option.
> > >>
> > >> Jan
> > >
> > > You are right, I got
> > >
> > > Section headers (at offset 0x00000188):
> > >  # Name     paddr    vaddr    size     scnptr   relptr   lnnoptr   nr=
el nlnno
> > >  1 .text    0000c7f8 00001000 0000c800 00000600 00000000 00000000    =
 0     0
> > >             Flags: 60000060: EXECUTE,READ,CODE,INITIALIZED DATA
> > >  2 .data    00000250 0000e000 00000400 0000ce00 00000000 00000000    =
 0     0
> > >             Flags: c0000040: READ,WRITE,INITIALIZED DATA
> > >  3 .rdata   00002c70 0000f000 00002e00 0000d200 00000000 00000000    =
 0     0
> > >             Flags: 40000040: READ,INITIALIZED DATA
> > >  4 .pdata   00000654 00012000 00000800 00010000 00000000 00000000    =
 0     0
> > >             Flags: 40000040: READ,INITIALIZED DATA
> > >  5 .xdata   00000630 00013000 00000800 00010800 00000000 00000000    =
 0     0
> > >             Flags: 40000040: READ,INITIALIZED DATA
> > >  6 .bss     00001ec0 00014000 00000000 00000000 00000000 00000000    =
 0     0
> > >             Flags: c0000080: READ,WRITE,UNINITIALIZED DATA
> > >  7 .idata   00000c88 00016000 00000e00 00011000 00000000 00000000    =
 0     0
> > >             Flags: c0000040: READ,WRITE,INITIALIZED DATA
> > >  8 .CRT     00000060 00017000 00000200 00011e00 00000000 00000000    =
 0     0
> > >             Flags: c0000040: READ,WRITE,INITIALIZED DATA
> > >  9 .tls     00000010 00018000 00000200 00012000 00000000 00000000    =
 0     0
> > >             Flags: c0000040: READ,WRITE,INITIALIZED DATA
> > > 10 .reloc   0000009c 00019000 00000200 00012200 00000000 00000000    =
 0     0
> > >             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> > > 11 /4       00000150 0001a000 00000200 00012400 00000000 00000000    =
 0     0
> > >             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> > > 12 /19      0000d5e4 0001b000 0000d600 00012600 00000000 00000000    =
 0     0
> > >             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> > > 13 /31      000014de 00029000 00001600 0001fc00 00000000 00000000    =
 0     0
> > >             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> > > 14 /45      00001a36 0002b000 00001c00 00021200 00000000 00000000    =
 0     0
> > >             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> > > 15 /57      00000f40 0002d000 00001000 00022e00 00000000 00000000    =
 0     0
> > >             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> > > 16 /70      000003a0 0002e000 00000400 00023e00 00000000 00000000    =
 0     0
> > >             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> > > 17 /81      00000a76 0002f000 00000c00 00024200 00000000 00000000    =
 0     0
> > >             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> > > 18 /97      0000174a 00030000 00001800 00024e00 00000000 00000000    =
 0     0
> > >             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> > > 19 /113     0000039c 00032000 00000400 00026600 00000000 00000000    =
 0     0
> > >             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> > >
> > > I suppose I will change to simply "Align some sections to 4KB"
> >
> > "Some" is imo going to be too imprecise. Please qualify which sections =
you
> > intend to align. If new sections need adding in the future, this then c=
an
> > guide people as to whether those may also need aligning.
> >
> > Jan
>=20
> The main issue is that sections with different permissions must be in
> separate sections.
> In the case of debug sections they are contiguous and have the same
> permissions so it's not an issue (although better to strip them off).
>=20
> Any suggestions on how to describe this?

Maybe something like "Align sections of different permissions to force
them into separate pages"?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--YUOYS7nC2vNRwBU6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmotQNMACgkQ24/THMrX
1yyAHQgAglm+T344Ekbq1t6K43nNa0SWsyDWgyZnVaOciwrFJGw47LXKK7XRM/QY
l7vq8Nx7uYiQt/uzLSk2tlG4DCLgKc1WMiGRCZtYfiR2OjU2n2nW59hdlcZeKGvF
p5o9ii1++eIlMptJynKbr/8CF/PHrpOnGD+sUFJSK7A8CODeF5c+DdvzRwTXZWTP
AuwO9l1yua+PfaAF6zVo98diWxqTXedGz0BUsWvPQyW4bYLoxP1GF1efayGxFIZR
xBzgMTC3JjfRJh7tdrsMx0eYd7fqHpef5Hkm9OwEC6NPdtIrbkaAnvk+IOE8Ak6v
0Dx4tR/tBx4dQNNyXgRMGoBvInTL+g==
=vCU5
-----END PGP SIGNATURE-----

--YUOYS7nC2vNRwBU6--

