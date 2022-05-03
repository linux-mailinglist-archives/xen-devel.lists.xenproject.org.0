Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E6B517F97
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 10:18:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319235.539390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlnjF-0005Ym-0d; Tue, 03 May 2022 08:17:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319235.539390; Tue, 03 May 2022 08:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlnjE-0005Wb-Tf; Tue, 03 May 2022 08:17:52 +0000
Received: by outflank-mailman (input) for mailman id 319235;
 Tue, 03 May 2022 08:17:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YfIj=VL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nlnjD-0005WS-ED
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 08:17:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8547be37-cab9-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 10:17:50 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-kP7db75DPSOqtJFIQ4iqbA-1; Tue, 03 May 2022 10:17:48 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PAXPR04MB8895.eurprd04.prod.outlook.com (2603:10a6:102:20e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 08:17:47 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Tue, 3 May 2022
 08:17:46 +0000
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
X-Inumbo-ID: 8547be37-cab9-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651565869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x46TocwA5uwXVUAnfWFqz6teqZCQXLhrna33aBeU+j8=;
	b=Ds2msBnZxHrmkGIw2zrY6kYjsuZfPMEo+8csbj0/TFMGZ1OkdH58/m7LeswgVDuSuTwzzJ
	sKjpL3jxK+sq6u9YOC96oK0NFoVGhrsZWc9/egUddQuAFHlr6QprRuEuPm+fCBjQXGFlcU
	GVfTY2eqvWWnAc5Ux+hqUn97igtIsHc=
X-MC-Unique: kP7db75DPSOqtJFIQ4iqbA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwApJTCcwxcxbrnAqL2neX8lA0Ulh3kNbo89fg0154X8BV2/r8fHGEqb8/Tk7iaxY4FoAAL5afEibSQ+qIrNkB4X2veMfs2TrPqQaL7g+KUkZRiqSfTWz3CawTJu2OOGcurIto/7qIDhuuKevpb5IRDsSMv9VrpHom+TYdCZOp6rg+gVrki8pdrjHvsvMC9VxooYFBr97G33MZkirzUXqkX4ONY0mVY3EpZ8DH2xCLpnWZW9xiVQHvpG2L4iFy1Nk6YP2to5rg69N3o3fuOjbzbnKdUb5VSk+dA5n7IN5Ne6S2RoitU8Ak7G+GMvQzBlOyq6NC1safC1WNrzUIB6Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnZqch3/2Z5D44xGyAUPkoZg7cZBGL2XMAuJFVXCT3A=;
 b=UFOy+f7/kNO9MV8NhnyRpAyWgQAVjUKZTcRngsKh+jAItq1d5r+M1Zl3dqHiBVOp+A7aNQZzN6SmRqpqqu6azxAVcP4mzY2AdYf283fC6LHnEKM7MxNBjz9UJH6iqzCvZ+zVWT5anxHbEzo9oqBfzXS8TS/N4oKzxE8jerCK7NESS4cywvpVwwcl7Wz4X/biwh3MF8nrsyidn8q55pwfC3WxtLz9RiDAAOEYQciMhiVwgb/xrxMulLHQW8y+iNS6eve1mh6yHu0eRfEVt8Wm2XlUf/di/RjSrwsvLjIneWoTzZjIwK8jD5TSBPaiamaOaixO58CG5yvFUqY8e4y1KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a8313955-98ff-d941-00a4-c5e318761c67@suse.com>
Date: Tue, 3 May 2022 10:17:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH RFC] x86/lld: fix symbol map generation
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220502152020.19768-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220502152020.19768-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR07CA0014.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::11) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f74ed3dc-0c0f-4813-67c1-08da2cdd67bc
X-MS-TrafficTypeDiagnostic: PAXPR04MB8895:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB8895E7FE2AF01B7B261DCF93B3C09@PAXPR04MB8895.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1CcWLiRwDg15AFoxeVDDMIEg+y+dGJg+omcQgNmRHZdiADdG9pxmGDHO002uHTimHhni8jQEv2JDWia96uT8ZfLiQSN9FbKG09Wwx9P4k9cjJ6saGTc3EPSkjZJQ823GTj2k0Td4s6TNBrV52mz/+L6aV4pnB82Bi9Y+LoHfHpigYpm2ys/rDQBbhZIS9OkLkDX3KHMmNi01cqUMTdRwmNdreXV5obTYyDIti1yKOGIqmzL11zu++41JURPFtJFupGyZy5N0b2lJhSwQcdXoYRXOHyxkbxN2sCfAogUuMsT/mBF5YHQW2KT0m2cthpJPuUSSjvhrKDqnxIHa6FaymzLdMwE2hERXhZerOsVqGsUX2bfo4LPUF48mMg5s04P2jd0XkX8bQ355OsfvLVBHu7L0ed70lgkjRdtfWKQXTVssVStKucm8JhfceauLu2Pw/yywl1KIW68Si8GhCH4NFG6l4R+6znjCqYrYebU/dqYhlvP9Y22SWCehEC3WVBrTpR0f4n6tqIiHw4Y/h8X3SLx1aQzyLx23yMlz4Y+pByjKXxYiD1k5f88QcjX/Y4Ij0XRuF6rA14z9rfx1JTlgXHTEtyC7b2axLkzszr0wzk6uS3jv1m4I1MVIqhS+8SQAxaqjQLOErvv7JCMdRLUcoFN/ErOMmCxgoResrtzf3g+HK8yAcnjDb/lF7xOnz+ulB9KRhbAd9WFM7pi3TbJ9Vsu0cctOJ3Jpjb+WwoESAd4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(38100700002)(2906002)(8676002)(4326008)(83380400001)(66556008)(53546011)(316002)(31686004)(86362001)(26005)(66476007)(6916009)(6506007)(8936002)(5660300002)(2616005)(508600001)(66946007)(36756003)(6512007)(6486002)(31696002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4myR3l7J/yguHYsBMT9dvF9ynscYg7adecg9dPELn4qeU+sAxYZpQzrqk7ZD?=
 =?us-ascii?Q?R2Gd79AO9SuMjzNQLe9YpM3B3nEqI6ju1SnRcmU5r0mIEw1zI25lhTu4wDlA?=
 =?us-ascii?Q?IXVGiqtKDn3BaXGB2j0SH18kFnQlMmNQxqvAT6Nr3QgFnCxi/TXHT3G+kRmK?=
 =?us-ascii?Q?cKGai962bjINPSDakrt1o3atL5wIOS25BDcLMc27h+/fXopTCsqg/TQUwssg?=
 =?us-ascii?Q?bVQwmeQbweUKbkUFYBIjGWp9Sq97aDXMhKa0AqDyTQkwJQJbQRb2SsFbZ1Js?=
 =?us-ascii?Q?JYk7c7DBQH4Hgtoxt8xox1kaZfiqrZgYWwtS4e2Xc+KyHM14LBNd/p6ga9w1?=
 =?us-ascii?Q?OupNPmjDUh3OZXOy+DPKrOk6Nrue6hOvw0GFx8heCKSamd+DGaauC0WamT0T?=
 =?us-ascii?Q?SI56Leg3GrP9T4CQXKCJ2a1JoWhRw90e4G9Eitj4aKGqZcUqTEgwSbKOENVL?=
 =?us-ascii?Q?m+s1vnOVvz99p+bu6IzqFKAX0xXGy2i1pIbDyWYsUQySY94giSDtCWu6YQO2?=
 =?us-ascii?Q?ayyjuDz8lokbsVXKtlfvZy+WHFtQvG4rX2mWtfM/MRJPrlDY4zIip7ujwFfK?=
 =?us-ascii?Q?IpdmoE+nbx8XSSRMf0BIhV1jEqZykE9tjmthqwBeakYUdYRJyfG83i/kR9d1?=
 =?us-ascii?Q?YEfBdbPQlcoterOabIPaCBBaVlTWXkHLmxrz8QDtfxdcC8Yb3YtCpNtqyIvi?=
 =?us-ascii?Q?U8fN78sqG/EGRlW6jIH60HW0ovR2nVxdtuUwusgJqMKl8QkMFICghCvF6eCu?=
 =?us-ascii?Q?Lkv9VRY2PfWTEd5wOz4sh7/TZMQC3fguENthD3b172BUe9RpORnBF17AgrpB?=
 =?us-ascii?Q?oKDdbmbLkwTXKumTtrEq1oP/IyAkw9kS52NxbFv4Gbpj5hPF/WeJwd9UC2lr?=
 =?us-ascii?Q?WPNhNmpVZFc7j5ZdWQy+M61NVSIaAly3RuJTTSm2a0GWxzelXcGKl7AGAf7U?=
 =?us-ascii?Q?JoMADGu1XIBYLBD1wTcwCN43Qb3FmN4V2qgeO5JzWwKD8+epyxGFOjZf5U+d?=
 =?us-ascii?Q?MWRkIt7cR4cVjI6slADx+bhmLdiK/c4A1T6yeLQlqNSgTIhgpz9gzgT9RI0l?=
 =?us-ascii?Q?rHWsIcT3L73SX+slc+G61gnpSNUUvh09o6LL4e5naO3IwQsnYR5Kzi5mkm+u?=
 =?us-ascii?Q?2Kn3rhpdPxs2hGLBeWSf24lnYWDSOX7amFdcFZKvzUqCxkNKuldueaEcrN55?=
 =?us-ascii?Q?JDmUUG7iTXiQfLHCySEwbToygnTBiG4j2bk/KFMVhOgoiDRinqnbtVly0smg?=
 =?us-ascii?Q?cFOSTjlflwWhU1WL6GLR5Dyw3Y4ALKKC54t7yriJxd5V2wgM7xXyCza26TSm?=
 =?us-ascii?Q?6U9Pak6Z+Cis4/WPoRzXuQ1pcn1+CVoM7YvrVlqavl4bpljjxc6Q923GuLfq?=
 =?us-ascii?Q?ew3cU+gNOv/tVQ67jdrjKt+RIhIa3Wz7jZ/q3iIJjib3Qt5P/nIj/rBW0h6J?=
 =?us-ascii?Q?C2WPJv2YfOAA5JqirUQIT146ZHyk9MyZ5xgKA/UJccgwnjG5grnAGx2xKeJI?=
 =?us-ascii?Q?lwqPk+2Btg1a0EyUapEYjcRnHGp/9wfDzC3d/hVABPFJj5GOpY7pNHawqi+O?=
 =?us-ascii?Q?nZdTL3dyzKmZaHz0PZd1nNxf/rMCXieCm2soZr+Xxv/al2dwE23g3DEAQ5co?=
 =?us-ascii?Q?StYHYO4N79u0F20x3qGS4FEHy2KhRIxuDZhmJhI7MeR6JSr5OgeJT5jMYcw4?=
 =?us-ascii?Q?dJqxGvtJWid+ncyvCjUAsXELIbGWkIET1qC/mKtyssnC3IdC8qxdDgMPxoq+?=
 =?us-ascii?Q?zCpgBBsHKg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f74ed3dc-0c0f-4813-67c1-08da2cdd67bc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 08:17:46.7548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNbEHBk8vF22i79V53dA8CMXXVb9cxdNmvdE9S09nGK/3fI2T5fTnuTBnKCSuoG0dLJv0rXjieNqsOUsVTXIiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8895

On 02.05.2022 17:20, Roger Pau Monne wrote:
> The symbol map generation (and thus the debug info attached to Xen) is
> partially broken when using LLVM LD.  That's due to LLD converting
> almost all symbols from global to local in the last linking step, and

I'm puzzled by "almost" - is there a pattern of which ones aren't
converted?

Also "last linking step" is ambiguous, as we link three binaries and
aiui the issue is present on every of these passes. May I suggest
"... when linking actual executables" or (still somewhat ambiguous)
"... when linking final binaries"?

> thus confusing tools/symbols into adding a file prefix to all text
> symbols, the results looks like:
>=20
> Xen call trace:
>    [<ffff82d040449fe8>] R xxhash64.c#__start_xen+0x3938/0x39c0
>    [<ffff82d040203734>] F __high_start+0x94/0xa0
>=20
> In order to workaround this create a list of global symbols prior to
> the linking step, and use objcopy to convert the symbols in the final
> binary back to global before processing with tools/symbols.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> I haven't found a way to prevent LLD from converting the symbols, so
> I've come up with this rather crappy workaround.

Perhaps a map file (like we use for shared libraries in tools/) would
allow doing so? But of course this would want to be machine-generated,
not manually maintained.

Have you gained any insight into _why_ they are doing what they do?

> Not applied to EFI, partially because I don't have an environment with
> LLD capable of generating the EFI binary.
>=20
> Obtaining the global symbol list could likely be a target on itself,
> if it is to be shared between the ELF and the EFI binary generation.

If, as the last paragraph of the description is worded, you did this
just once (as a prereq), I could see this working. Otherwise (as you
have it now, with it done 3 times) it would first require splitting
the linking rules into many separate ones (which has been the plan
anyway, but so far I didn't get to it).

> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -134,24 +134,34 @@ $(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mkel=
f32
>  CFLAGS-$(XEN_BUILD_EFI) +=3D -DXEN_BUILD_EFI
> =20
>  $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
> +	# Dump global text symbols before the linking step
> +	$(NM) -pa --format=3Dbsd $< | awk '{ if($$2 =3D=3D "T") print $$3}' \
> +	    > $(@D)/.$(@F).global-syms
>  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
> -	    $(objtree)/common/symbols-dummy.o -o $(@D)/.$(@F).0
> +	    $(objtree)/common/symbols-dummy.o -o $(@D)/.$(@F).0.tmp
> +	# LLVM LD has converted global symbols into local ones as part of the
> +	# linking step, convert those back to global before using tools/symbols=
.
> +	$(OBJCOPY) --globalize-symbols=3D$(@D)/.$(@F).global-syms \
> +	    $(@D)/.$(@F).0.tmp $(@D)/.$(@F).0
>  	$(NM) -pa --format=3Dsysv $(@D)/.$(@F).0 \
>  		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>  		>$(@D)/.$(@F).0.S
>  	$(MAKE) $(build)=3D$(@D) $(@D)/.$(@F).0.o
>  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
> -	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
> +	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1.tmp
> +	$(OBJCOPY) --globalize-symbols=3D$(@D)/.$(@F).global-syms \
> +	    $(@D)/.$(@F).1.tmp $(@D)/.$(@F).1
>  	$(NM) -pa --format=3Dsysv $(@D)/.$(@F).1 \
>  		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-du=
p-y) \
>  		>$(@D)/.$(@F).1.S
>  	$(MAKE) $(build)=3D$(@D) $(@D)/.$(@F).1.o
>  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
> -	    $(orphan-handling-y) $(@D)/.$(@F).1.o -o $@
> +	    $(orphan-handling-y) $(@D)/.$(@F).1.o -o $@.tmp
> +	$(OBJCOPY) --globalize-symbols=3D$(@D)/.$(@F).global-syms $@.tmp $@

Is this very useful? It only affects ...

>  	$(NM) -pa --format=3Dsysv $(@D)/$(@F) \
>  		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>  		>$(@D)/$(@F).map

... the actual map file; what's in the binary and in this map file doesn't
depend on local vs global anymore (and you limit this to text symbols
anyway; I wonder in how far livepatching might also be affected by the
same issue with data symbols).

In any event I would like to ask that the objcopy invocations be tied to
lld being in use. No matter that it shouldn't, objcopy can alter binaries
even if no actual change is being made (I've just recently observed this
with xen.efi, see the thread rooted at "EFI: strip xen.efi when putting it
on the EFI partition", and recall that at least for GNU binutils objcopy
and strip are effectively [almost] the same binary).

Jan


