Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 182694CBD7F
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 13:17:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283270.482239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPkON-0007GR-2X; Thu, 03 Mar 2022 12:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283270.482239; Thu, 03 Mar 2022 12:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPkOM-0007Dh-VX; Thu, 03 Mar 2022 12:17:10 +0000
Received: by outflank-mailman (input) for mailman id 283270;
 Thu, 03 Mar 2022 12:17:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPkOL-0007Db-DN
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 12:17:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d836becf-9aeb-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 13:17:08 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2055.outbound.protection.outlook.com [104.47.0.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-C0RjDyelMfGtV8M5CPIGOw-1; Thu, 03 Mar 2022 13:17:06 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB9173.eurprd04.prod.outlook.com (2603:10a6:20b:448::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 12:17:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 12:17:05 +0000
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
X-Inumbo-ID: d836becf-9aeb-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646309827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rhUtLO+jIi6lI8Jwu27yMwgfMw9xisbltg5nPG0t2Tk=;
	b=Vxdj0mNDglw08pTBnLadsZLWGuyKmKYAB8MpvUt9g6deem5Egubm/W505GAJ3JYCH3HUSq
	B69eFMs24cZ0hsO33lb2VaBxbXpIWfQqClQOlAUsLUO4KHwS3z4jZNZ9jUu6FLz2FKLk2A
	6n7ZejurLsqI7ZvHFMWNY0I5DVqfb2o=
X-MC-Unique: C0RjDyelMfGtV8M5CPIGOw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oU6TQ+nx/8O6fpykyW5V7DnBG+0CW//1pQBzsY/WGRvZnLVww4bN14IMBEps2Sof7HvpBsNF2fqjelZtSupJtaaCHWOro6PqFX7mwBrAvYqzgOsCk7GN6pnB8IHpfJP65tBjQCjStesonna+TcxeJ3rYREBwxDbQOcREZK2oV+Dy7zMPCdBf0fG2Wo3/6A0ubbyTizC1qqGh/YTkAxKLPH1A26IbTxw2iVX0+QoYmXy63SnXyZ3Q5NoUo3FJ+h6IDDwIhEQqTRlUd27OrxxdgQbJW3UOA/1kZ2NoGDs+HQTExwUC/r8YCkyKb48P/l+vFn+zF4VaA0yaTE/ew0D1Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kpg+qEs2SiQQjLZCKkeTIbGZhyLgcWeiXXihgTuA21U=;
 b=Us14XNq2ym5ct19F7Jj+Z/0Ra2ANhLuV0ds87CLvwPUB5UDOoaSvjQhAwbk/TLWxg6YqVASOg4LRjSpUqefrImGYxJPXlgsalc0LY2bLT4K41V+sA20jFdNu3BGvb6DyZWVOR4rvVDDCmJmJ38oDyyPNsfpO0OUVau0BmI2xhat+r5mLVjBTAKJ1PFRmO6GzH0qrjA0ciz4wzpYr7ADIB+xvZg6v+LcAQAT2BdwADgy3+Nm52Gsaq4D5DYEYzJzZFIl95m+PJlr91uAdazeres1RLjahzrfLsu9HIFj2HTGZaHemJHWSv3wz87N9RKz7JbKtq2YPPLO58CUVCBnpgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3c335ca5-63e3-6389-cba5-b9047a4ce3b9@suse.com>
Date: Thu, 3 Mar 2022 13:17:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] x86/build: use --orphan-handling linker option if
 available
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <5c374fd3-017d-3c40-4ded-25a3b1c978a6@suse.com>
 <YiCkUebvg0gaBm4/@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YiCkUebvg0gaBm4/@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR0301CA0038.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80f580d5-1d85-4281-4c4e-08d9fd0fbac0
X-MS-TrafficTypeDiagnostic: AS8PR04MB9173:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB9173021296FA1266686CDA7AB3049@AS8PR04MB9173.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8ZqSxGvJUqcP4aHsWS/5/hvh443ZUY6NiG1BXKAHHu5DY49WvcBhKLmAhbzg43Pk+lPch1lzJTKZfSXihJJSS9Kng2tTNbsv9bvy3v7pkxezKmtzZCeDp7RS2aSvKI5eww1gfHibQBhj23Rm8vhikSKxEnvzxdIQK4XxqTKOW4dWkvo7xAfl58REfPX5VwrsZkJB7qV37c+yE0apjhTDaooturQakPu+raKFC2439s2l+cDDVScS1MruHkhQ+kIiiCIVvLNf1NvZEdhNx5eOwfEdjAEGppep2tZhqDPorD4FEE68Df3mGA7o7innNfq8XO4Fu3c0BQ7NNq8KWofZok4SW1mWXb+r+y3+nteOIuPOiuJ7HB+jz6EoF4w5XzfyM3/5BilsyFKG80PpZvd1BaUByWlZ7gl8l4I4i04eIIvdig0eixtCIKfKVG/18AoeIJ75Tnr3QEiXM764P8MZPrg81MFceWHl6z1pIiKRT6F5fOMH1IfPYethabv8pAa2/7lTXVycPMBv/LnzL3+IjFTdvAgoUhQgYrwrV7s4FLm17yGli2A0L0ki6tN90DjSr7FdGn+shOy+Jrxv/0Ku2OSB+wEGYXm4LY188caK3qTkXnu9qxhnMX1FhACQP/mFsl4sz1iQb9Iw7oCgExt5r3qjsNBhpXmrX0982PqPtvZBUanDTJo77aKpTS3LHhSe4vsv8XmKXyIGjthRFfrsFtmoa4Sio39s7GH+zfTxKfgNFwUKGGCN7Xti6pRs+cx/xCbs4twUlbQXT76QrTh+g1t1gkhwGQ4mcoPniSf1qPXMBPjeucqnUlqoeGWDghHe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(6486002)(966005)(54906003)(316002)(6506007)(31696002)(86362001)(6916009)(83380400001)(6512007)(186003)(2616005)(53546011)(2906002)(31686004)(5660300002)(36756003)(8936002)(38100700002)(66556008)(66476007)(66946007)(4326008)(8676002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E6aEu5qln5+Jnotq4Ng0WTIwzdhRWHz2OVp8C2YhqZpaV3TyZELp84X3llA1?=
 =?us-ascii?Q?9X2ctrg/PYQUowg9JtUAXs3BMhG5D1yvugoCuuqrWJG6SQk38StPBAKA1WY6?=
 =?us-ascii?Q?y9dRPFo0PnIANU9b6Xj2cbWpl5TAM4765T+Af9/1JgllvpM+WDhvcnKudLfw?=
 =?us-ascii?Q?S6rsPsEANjzQ15ajxU60e8ahBXn+w3ewV2+iLLygOZb7gY4T0vog4HW7Pl87?=
 =?us-ascii?Q?B7qb5Ive+s7GiExvrP0aPafTYcziSz+te/9kodDUC5NXlX71J36SLTAOtLyr?=
 =?us-ascii?Q?3lc2Q1aGV5rpySd7PhoNPRd/NI4lOZAKft+5O76bIJuqQEd3u7C6lL6LbyxK?=
 =?us-ascii?Q?pKYbYZ3bF6gfSxe6MOr+/bjEA0GMpvQdLaeZicuOrL7xU1E/5jvTrZAs7TD5?=
 =?us-ascii?Q?6ay4ai74ASnqLXjs2ue1KwFIGw6mwMGtbh5jql7vXjtKYPxGKE8o0FUcI7Mh?=
 =?us-ascii?Q?8xTPHR8FyKHPLOzZ3BpLBaxPF5s34vqSxVBq9kw81oFVbLKlm8cnPZkDSpvv?=
 =?us-ascii?Q?0WMSTnYFkGtxnrglgBmcOxevJGmaEN28fMlpyOozud9+mBEffzsABvtgsUsZ?=
 =?us-ascii?Q?xJP/xIGQg8vIUPyg7Qa/VdiYOYC6Vebqe7PHtHYWZAVY6AxTti3ikl9NwetJ?=
 =?us-ascii?Q?mqnqnU7/qvG0qw9VrMuJ/AOJvXgkg84QB34zga/+V5TGOFZcIqgT94WYy2fv?=
 =?us-ascii?Q?CUvUUkHLpfZSGVYn+YEVNvNK/12KGzvBsIOWSgyh50aWVBOOzhwVEi7xzdbY?=
 =?us-ascii?Q?YfFSsebi+pZOI41kKsLYe7jp9rS+Rqp4c2oz9AcQuPcpcgsOSHkUnGI3EhBw?=
 =?us-ascii?Q?jKbzekUErbK+wZeuZhc4A9WnRXUN2rBvaUAgKCPRLWPa1Fhsp3dBwgRTOK7d?=
 =?us-ascii?Q?GX3mHIVlF0icWqOYvwxf+T+UunQxSqsB3Kx93qbmIezkUVxflNWO9UbEHZqw?=
 =?us-ascii?Q?FDScYi1MDjDqDllnDzwm9GYoBdtulQoCDWL2Nty79Ok0pZhdLDyy+pGLU7hm?=
 =?us-ascii?Q?DTY4whw4KqB1sM6YVzP4ZSLiH+cemUPdion4mNegUSaODX1Mn3XeG9Ej8Ubv?=
 =?us-ascii?Q?iqRd2+Qg0w3sD3M9dWz8PC1Bx2VkEUOBseKhykNIJRlYNpI14b2rscLev65j?=
 =?us-ascii?Q?z3pDaI78L+euk8a7Oe+Zx7hBuZWk4VVsiYGUbn/NwAEesRvC6iq/LFUAT/H0?=
 =?us-ascii?Q?HYC8KwhYWxud1BsDLb/CS8ccX6cewcr6zJL5ZAyAtix67VPnX2Y0bxs+z1Nj?=
 =?us-ascii?Q?b9N3+xHF7IQxej0Le1Gljt+YEBft1PXrGx3FEt/H5kjpxBBCz2UzGreDloUB?=
 =?us-ascii?Q?QoOvZQQwREKzsuQY3PB2I1LcY5tAhBAvHUcvTNHtBV7crjwy2x6+U5Cpn1F8?=
 =?us-ascii?Q?Q9hGZfAlJ+8biDjfRY5n/sdhZCnRWfEGgyjtz21PB/SP9oIjlZKzlUeswBn0?=
 =?us-ascii?Q?ksxMSo1yWcyAq6BDKSuvml0qbxjNhXoJUsFHyzPPsJ9YsMD2K49V6LWw5X3n?=
 =?us-ascii?Q?s1mCTfXkomauo7FzVsOM71nnBoHXZ1RNzHfGysHPcjz6io75xqKgcucBzXDk?=
 =?us-ascii?Q?8Anx0bz4TdhBzQgG7Q35emiE8G6xbmHi0ktHeGg8QEu4fZTeNIqM+bnBGTMR?=
 =?us-ascii?Q?uPSFcOeDOE7nU78p06evsHo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f580d5-1d85-4281-4c4e-08d9fd0fbac0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 12:17:05.0387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8AFex/jY/2/Xl/06ZGuO+5zTPpL0DX6Iqv3H5PORk37ta7mPb3YvqxzDxCPqzY+1YTsFwxeNbV14WeC4/L5ctw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9173

On 03.03.2022 12:19, Roger Pau Monn=C3=A9 wrote:
> On Wed, Mar 02, 2022 at 03:19:35PM +0100, Jan Beulich wrote:
>> As was e.g. making necessary 4b7fd8153ddf ("x86: fold sections in final
>> binaries"), arbitrary sections appearing without our linker script
>> placing them explicitly can be a problem. Have the linker make us aware
>> of such sections, so we would know that the script needs adjusting.
>>
>> To deal with the resulting warnings:
>> - Retain .note.* explicitly for ELF, and discard all of them (except the
>>   earlier consumed .note.gnu.build-id) for PE/COFF.
>> - Have explicit statements for .got, .plt, and alike and add assertions
>>   that they're empty. No output sections will be created for these as
>>   long as they remain empty (or else the assertions would cause early
>>   failure anyway).
>> - Collect all .rela.* into a single section, with again an assertion
>>   added for the resulting section to be empty.
>> - Extend the enumerating of .debug_* to ELF. Note that for Clang adding
>>   of .debug_macinfo is necessary. Amend this by its Dwarf5 counterpart,
>>   .debug_macro, then as well (albeit more may need adding for full
>>   coverage).
>>
>> Suggested-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I would have wanted to make this generic (by putting it in
>> xen/Makefile), but the option cannot be added to LDFLAGS, or else
>> there'll be a flood of warnings with $(LD) -r. (Besides, adding to
>> LDFLAGS would mean use of the option on every linker pass rather than
>> just the last one.)
>>
>> Retaining of .note in xen-syms is under question. Plus if we want to
>> retain all notes, the question is whether they wouldn't better go into
>> .init.rodata. But .note.gnu.build-id shouldn't move there, and when
>> notes are discontiguous all intermediate space will also be assigned to
>> the NOTE segment, thus making the contents useless for tools going just
>> by program headers.
>>
>> Newer Clang may require yet more .debug_* to be added. I've only played
>> with versions 5 and 7 so far.
>>
>> Unless we would finally drop all mentioning of Stabs sections, we may
>> want to extend to there what is done for Dwarf here (allowing the EFI
>> conditional around the section to also go away).
>>
>> See also https://sourceware.org/pipermail/binutils/2022-March/119922.htm=
l.
>=20
> LLD 13.0.0 also warns about:
>=20
> ld: warning: <internal>:(.symtab) is being placed in '.symtab'
> ld: warning: <internal>:(.shstrtab) is being placed in '.shstrtab'
> ld: warning: <internal>:(.strtab) is being placed in '.strtab'
>=20
> So seeing your mail where you mention GNU ld not needing those, I
> think we would need to add them anyway for LLVM ld.

Hmm, that's ugly. How do I recognize LLVM ld? I can't simply use a
pre-processor conditional keying off of __clang__, as that used as the
compiler doesn't mean their ld is also in use (typically the case on
Linux). I also don't want to add these uniformly, for now knowing what
side effects their mentioning might have with GNU ld.

>> --- a/xen/arch/x86/Makefile
>> +++ b/xen/arch/x86/Makefile
>> @@ -120,6 +120,8 @@ syms-warn-dup-y :=3D --warn-dup
>>  syms-warn-dup-$(CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS) :=3D
>>  syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) :=3D --error-dup
>> =20
>> +orphan-handling-$(call ld-option,--orphan-handling=3Dwarn) +=3D --orpha=
n-handling=3Dwarn
>=20
> Might be better to place in xen/Kconfig with the CC checks?

Well. I've tried to stay away from complaining if people introduce
new tool chain capability checks in Kconfig. But I'm not going to
add any myself (unless things would become really inconsistent) up
and until we have actually properly discussed the upsides and
downsides of either model. Doing this via email (see the "Kconfig
vs tool chain capabilities" thread started in August 2020) has
proven to not lead anywhere. I'm really hoping that we can finally
sort this in Bukarest.

> I'm also wondering whether we could add the flag here into XEN_LDFLAGS
> and EFI_LDFLAGS, as those options are only used together with the
> linker script in the targets on the Makefile.

Not for XEN_LDFLAGS at least, and undesirable for EFI_LDFLAGS. See
the respective post-commit message remark.

>> --- a/xen/arch/x86/xen.lds.S
>> +++ b/xen/arch/x86/xen.lds.S
>> @@ -12,6 +12,12 @@
>>  #undef __XEN_VIRT_START
>>  #define __XEN_VIRT_START __image_base__
>>  #define DECL_SECTION(x) x :
>> +/*
>> + * Use the NOLOAD directive, despite currently ignored by ld for PE out=
put, in
>=20
> Would you mind adding GNU ld here to avoid confusion?

I've done so, but I'm not sure if implicitly you mean to say that
LLVM ld does honor the directive when linking xen.efi? If that
wasn't the case, it would rather seem misleading to have "GNU"
there. Unless e.g. LLVM ld can't link xen.efi at all ...

Jan


