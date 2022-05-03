Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C068A51894D
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 18:06:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319771.540149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlv2j-00031b-Vw; Tue, 03 May 2022 16:06:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319771.540149; Tue, 03 May 2022 16:06:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlv2j-0002yV-Sn; Tue, 03 May 2022 16:06:29 +0000
Received: by outflank-mailman (input) for mailman id 319771;
 Tue, 03 May 2022 16:06:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YfIj=VL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nlv2j-0002yP-4U
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 16:06:29 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcc35531-cafa-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 18:06:27 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-kmLX6NTYNWWVkhG93Kgb2A-1; Tue, 03 May 2022 18:06:26 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM8PR04MB8002.eurprd04.prod.outlook.com (2603:10a6:20b:247::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 16:06:24 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Tue, 3 May 2022
 16:06:24 +0000
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
X-Inumbo-ID: fcc35531-cafa-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651593987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vu+AzfRNDiCGW2HH4jtGe5Gs/BEKSQ0r8+P7fnZ70TI=;
	b=OcgfnZCAJb0s8hCf+FkSCk7QHii5uvSKw2RC7ztxvZjHEAJxKw+3K1JBsXqVYaX9X4OAQF
	ahSzEUq+1QdcDH+HKgH+2z2C8Ie154ALw9wH/fJz51bcQoVuVFzQIRB8uhwCcVROHBwTer
	PRYF7N6bx9GCcd+n49nNU1wuuRxPgu8=
X-MC-Unique: kmLX6NTYNWWVkhG93Kgb2A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d09YyPyW+gFxI3dsL5n3kzi5fwsH//3Kf7QClzuyTtoGc4sl/Kz1sDHOidT54RX9ew3eBwiwJMemTl2INy7/o/6DkyCN/0LAC3n7YzegKwL2rMziOhUbbq8Tl4esTeAaRd+G07x9/if/fGwiESmr9pnQALTS6Rq+s+s1OKNeYcGCWxf1515t3c1cIBDR9ZAUEZQA2uJonlzPl6aJpVtoOgCXMJqOxYMRieQLmiNAiYVDpLe1NTTGk/0AOWJM1asF4Y2T9HUr9k3k119vjOfZWTCuFp+Uu7QxxBlJ+lp3XRnok+c8g9sS05fA6y9RBQUPsMXkGhxOv6R/QPd/FxQjBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=km7FEL/ymbiuEfFWWplf0LDFYJiDq7CdQKzWzw4/q6s=;
 b=htWY6yxUSGLu+KQ33981OUXcN1RpQYO371cAUj62u3kedp1RPvVO4uUQrd5nAH+UK459aMUSQ41qZQxiI9rumfehQvIoGY5fElDn9rO6MQd4OVVDkS8MPMiyU7o0RN322lgWrfH5dhUIB0O3uFTJc2NEj88bjhrb+Wgi5YxaZs38xLM45KhOwgzIPM25WPbgz8YBVrSVOe+rOHNpQV5+5aLNTqFUzCSJxr0E492mlkSkFCHzsrnErLe0dM1U23q9nC0RB8O6ttjIKVBUDnpRJ9L7JGFruCyFBXTeqCtpUdSKNBJMRNpatSCdHSFnFOxJFyGLCXaqNuP4CcE1v6blXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cf5be322-09b0-dfd9-bff2-be162f6f2863@suse.com>
Date: Tue, 3 May 2022 18:06:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH RFC] x86/lld: fix symbol map generation
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220502152020.19768-1-roger.pau@citrix.com>
 <a8313955-98ff-d941-00a4-c5e318761c67@suse.com>
 <YnDyluwoiux73pqV@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YnDyluwoiux73pqV@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR05CA0013.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::26) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3138b05-2063-4f58-f3cd-08da2d1edf00
X-MS-TrafficTypeDiagnostic: AM8PR04MB8002:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB80020B96BC95AB536FEAB697B3C09@AM8PR04MB8002.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YCD8beQR2MmGqEw6t2BX7AfKEZ3oq0X0Z8YIP02tUQOAzNzb30I5nd/PbUYVqHernWg+d6MMV9hvPYwvtlCSz6vCJ6sYhAazLhzgK8x4mc67qMyNxt9ar00VfYDUUnEP+7mI2G1K6sh8Tdc3xTiSCusB0YchY7iI1XXY305VoB1a8O+U3WFU2ZvQ+8SpZ53IFzAYC21Q5eUsAWL/gExK9TkpMOxbMhMA0limcK6T4BYF4Ja3XKTozefUpsnizUa0pLIqGy6tf/gkPW3rvavi+lzEAxt1uLsayrg7tgKzGqtVh1ykz03zQulWRgsg0ktncmJan1/+OpeGT1lU+AUC7JiqbVHDrt4zwQIYQbf8TKDf4gCLIKD+t1u20p7elqRDhxBhYQW0eHsThuMTsRd7LxaV0Zq3BbpCHEUjuw+AclT8ZyGbrOkyAnxtKMgoeKUxDDcB+JTaIOHOvP7J2O076wi5vcg55980eAvAhyH0rk8kWfgeTbJI98j5qG4zSkVGeM5VnPqX1k1rI+fss29+9wisO6prSDpQo8FSOQ2HTR48WMCJBes5mFHHMHkg/QCL1N1euf+O8Mng0x2p8m5TrL5a3PJ+RtOoW40TJfde9GdT9ufxmYbGBFicUpa8IEtIh38vwBf1cPqbLkcaMDjcPwrOek6L5Mg4EbK5taf2QzauNzQwnak6LFjg09AEf0ogwu3ZAKuRCVqlK6B5kw4VyUqIik7bW1cejThwJHjGyA0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(53546011)(6506007)(2906002)(6512007)(26005)(31696002)(508600001)(38100700002)(6486002)(8936002)(36756003)(5660300002)(8676002)(4326008)(83380400001)(66946007)(66556008)(66476007)(31686004)(186003)(316002)(54906003)(6916009)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xlcGhuCKQ9fgy1eh9jBb31lYaXhS/cMiSfYmpJX6Foh1APTJzS6vlCoaGbHM?=
 =?us-ascii?Q?hg8Lm1ehEAF/4tripQ7RNPZNhRwEDQFQI5DxC/XHLl994Vq1gLemkrvtopgn?=
 =?us-ascii?Q?B1k5VvPzfv+kYZd4LLiFPx2oBXphNLCllzxpGCaHWTHpUHyY8VlplFrcfZbS?=
 =?us-ascii?Q?6GsaeZGCSD1NW3q+UkFtpcKGLarBhKn1Rqh4Mc2BFHEPEsukzlOtAgdNHMOU?=
 =?us-ascii?Q?kiIdnadoE3l8ebeuYip5J0TGEe96WpDj0BKGerC4BOPxkJfnnk5zkvqV1mxD?=
 =?us-ascii?Q?RZsNrzRIddj/1nHZ1S+wJnN5XPesiVvn4UGL2DR/9aDhC5S7quyijZ/seYDk?=
 =?us-ascii?Q?Hrmx2on0tFA2YLy7fSIUHMmAACKBIBPX3vYLtBE2IyNum2DuvoRtJvxxIjis?=
 =?us-ascii?Q?v53FFM2sWX/u4ZiHDnhMvYB08ps6NelBHGnq88lR6BnVq+Jv3Yog6Qjc/tof?=
 =?us-ascii?Q?sIXQqjz34DIUAUzPN23Zknqun8mLLcn7eyMw8cuohrtQnXumE2qojYK9SOVf?=
 =?us-ascii?Q?Fg6ZrQ3Cpd6emmGlUgukp1BMlDzDgyUQhhsvc+ZkBHafycMYHUlRYfT3BHks?=
 =?us-ascii?Q?7QlPeFYdfpNqkzZ6ThujecG/8S/NHoaOyCV3gjQy6wSoXyG948U1exFLy6qk?=
 =?us-ascii?Q?wCi/8nQkLD8kCaMhsDqL2ZjoP0Lr93jJ4dNbsjaAq0i5xxDKX6t6ZJ2i4ySC?=
 =?us-ascii?Q?2r9Xs5tYlLB8biIuDlcC3ZvK4+trJL0BWtQPvEmIflrYw5kV5xdns2GkJ9m7?=
 =?us-ascii?Q?BOU/GHsqJAXfxC10prOd8O59IbiDh7J2lyJVbPHNBJUfoGSXKJJFqylXTaJl?=
 =?us-ascii?Q?h7byd10KayvNzD+aPVms5VssUHs9oBTV0nWJBi51yGpGIeGOt4HzkgJXVrxA?=
 =?us-ascii?Q?yK39A5CV3qtXsowKVJmAEo2+B38Kx0gVv+pS+J3SQxmWg5Ce6NLYmhGqwq7d?=
 =?us-ascii?Q?KiZOKxjTmeNf4yZO/uGWZCiOR7QNE/xRlutKC/cf/sdhlC0N2+YHi//8SMBa?=
 =?us-ascii?Q?cWeitJr8S7+rPqJrSt4aQyAyNnc5AfFz4Oy2YEefDyz9tYSJZYMWq+UHpqXW?=
 =?us-ascii?Q?dHEbOzoNh7HRdCZ8amNLd3XOwMPjWeVEERoM7ewTlRAPbksQTm3U9TrukeYU?=
 =?us-ascii?Q?UNWfqrLCkJu4hvSzlOY5JBVvFMcA3+leGS+VeVt9g2CO+ebdFaKu0NLJC20P?=
 =?us-ascii?Q?oaK4c22MTQtb82C/LuQb5YJpDzPYX/FrOt/PnsCs/ToXV1TPvRtbVMgCeBTl?=
 =?us-ascii?Q?1ECoNkp6OTLLz7CQSUqVcGv2+UnB8u83oqbx0JYuVDJiM2C+lfi6c75mCmHo?=
 =?us-ascii?Q?mxW+b2KtufoK2abX1ih7X3C16lO2nGaw/XIuwMAXBSOGAMLny1T5kpx1MhBu?=
 =?us-ascii?Q?lwi9Uo5sWy5WFQzgwBUgrRQdXB29iANZsdn7OeCTdaSTXXDWta292CcgtI2I?=
 =?us-ascii?Q?wrvBoyp8fiAH+mPQuAPCW9TBz2UUCBWuU7Y7yb5pKpzwhQYMwZVc1/1wM3Xi?=
 =?us-ascii?Q?ZmDd+hmZQ1og+Y4XEFEPHXnzhFJbM4UtI0HTAJ7mODyKSnC7n9k4dunwv/m4?=
 =?us-ascii?Q?BIc99owzyAtJYlGIH2IQecI+wwMN7huMdTnm5YyH3ip6SQO+wieQuuj+q75g?=
 =?us-ascii?Q?km8GExPg6oCss2A3GAcGAF5O1jxPBvwTPoBC1UUu9BUm/MtctDVQycEu1wL4?=
 =?us-ascii?Q?pbrcK+icoGBlMz4S/x8+i+jksQ9y1M2Gm/k0k5Qb3lQCjwxAM+YlJ8E3zW6B?=
 =?us-ascii?Q?keo7N7bRLw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3138b05-2063-4f58-f3cd-08da2d1edf00
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 16:06:24.1715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eqqHRdfSLX1T1U5GDtxoYWr1h3xOK4RpxRwxsMexG9c3Jz1LKmLzF7ISJaxSk2bmzQYcgpnLFp8kEKBkCxB2NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8002

On 03.05.2022 11:15, Roger Pau Monn=C3=A9 wrote:
> On Tue, May 03, 2022 at 10:17:44AM +0200, Jan Beulich wrote:
>> On 02.05.2022 17:20, Roger Pau Monne wrote:
>>> The symbol map generation (and thus the debug info attached to Xen) is
>>> partially broken when using LLVM LD.  That's due to LLD converting
>>> almost all symbols from global to local in the last linking step, and
>>
>> I'm puzzled by "almost" - is there a pattern of which ones aren't
>> converted?
>=20
> This is the list of the ones that aren't converted:
>=20
> __x86_indirect_thunk_r11
> s3_resume
> start
> __image_base__
> __high_start
> wakeup_stack
> wakeup_stack_start
> handle_exception
> dom_crash_sync_extable
> common_interrupt
> __x86_indirect_thunk_rbx
> __x86_indirect_thunk_rcx
> __x86_indirect_thunk_rax
> __x86_indirect_thunk_rdx
> __x86_indirect_thunk_rbp
> __x86_indirect_thunk_rsi
> __x86_indirect_thunk_rdi
> __x86_indirect_thunk_r8
> __x86_indirect_thunk_r9
> __x86_indirect_thunk_r10
> __x86_indirect_thunk_r12
> __x86_indirect_thunk_r13
> __x86_indirect_thunk_r14
> __x86_indirect_thunk_r15
>=20
> I assume there's some kind of pattern, but I haven't yet been able to
> spot where triggers the conversion from global to local in lld.

At least this looks to all be symbols defined in assembly files, which
don't have a C-visible declaration.

>>> Not applied to EFI, partially because I don't have an environment with
>>> LLD capable of generating the EFI binary.
>>>
>>> Obtaining the global symbol list could likely be a target on itself,
>>> if it is to be shared between the ELF and the EFI binary generation.
>>
>> If, as the last paragraph of the description is worded, you did this
>> just once (as a prereq), I could see this working.
>=20
> Yes, my comment was about splitting the:
>=20
> $(NM) -pa --format=3Dbsd $< | awk '{ if($$2 =3D=3D "T") print $$3}' \
>       > $(@D)/.$(@F).global-syms
>=20
> rune into a separate $(TARGET)-syms.global-syms target or some such.
> Not sure it's really worth it.

Probably indeed only when splitting up the rule as a whole.

>>> --- a/xen/arch/x86/Makefile
>>> +++ b/xen/arch/x86/Makefile
>>> @@ -134,24 +134,34 @@ $(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mk=
elf32
>>>  CFLAGS-$(XEN_BUILD_EFI) +=3D -DXEN_BUILD_EFI
>>> =20
>>>  $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
>>> +	# Dump global text symbols before the linking step
>>> +	$(NM) -pa --format=3Dbsd $< | awk '{ if($$2 =3D=3D "T") print $$3}' \
>>> +	    > $(@D)/.$(@F).global-syms
>>>  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
>>> -	    $(objtree)/common/symbols-dummy.o -o $(@D)/.$(@F).0
>>> +	    $(objtree)/common/symbols-dummy.o -o $(@D)/.$(@F).0.tmp
>>> +	# LLVM LD has converted global symbols into local ones as part of the
>>> +	# linking step, convert those back to global before using tools/symbo=
ls.
>>> +	$(OBJCOPY) --globalize-symbols=3D$(@D)/.$(@F).global-syms \
>>> +	    $(@D)/.$(@F).0.tmp $(@D)/.$(@F).0
>>>  	$(NM) -pa --format=3Dsysv $(@D)/.$(@F).0 \
>>>  		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>>>  		>$(@D)/.$(@F).0.S
>>>  	$(MAKE) $(build)=3D$(@D) $(@D)/.$(@F).0.o
>>>  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
>>> -	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
>>> +	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1.tmp
>>> +	$(OBJCOPY) --globalize-symbols=3D$(@D)/.$(@F).global-syms \
>>> +	    $(@D)/.$(@F).1.tmp $(@D)/.$(@F).1
>>>  	$(NM) -pa --format=3Dsysv $(@D)/.$(@F).1 \
>>>  		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-=
dup-y) \
>>>  		>$(@D)/.$(@F).1.S
>>>  	$(MAKE) $(build)=3D$(@D) $(@D)/.$(@F).1.o
>>>  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
>>> -	    $(orphan-handling-y) $(@D)/.$(@F).1.o -o $@
>>> +	    $(orphan-handling-y) $(@D)/.$(@F).1.o -o $@.tmp
>>> +	$(OBJCOPY) --globalize-symbols=3D$(@D)/.$(@F).global-syms $@.tmp $@
>>
>> Is this very useful? It only affects ...
>>
>>>  	$(NM) -pa --format=3Dsysv $(@D)/$(@F) \
>>>  		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>>>  		>$(@D)/$(@F).map
>>
>> ... the actual map file; what's in the binary and in this map file doesn=
't
>> depend on local vs global anymore (and you limit this to text symbols
>> anyway; I wonder in how far livepatching might also be affected by the
>> same issue with data symbols).
>=20
> If I don't add this step then the map file will also end up with lines
> like:
>=20
> 0xffff82d0405b6968 b lib/xxhash64.c#iommuv2_enabled
> 0xffff82d0405b6970 b lib/xxhash64.c#nr_ioapic_sbdf
> 0xffff82d0405b6980 b lib/xxhash64.c#ioapic_sbdf
>=20
> I see the same happen with other non-text symbols, so I would likely
> need to extend the fixing to preserve all global symbols from the
> input file, not just text ones.

Oh, I see - yes, this wants avoiding.

Jan


