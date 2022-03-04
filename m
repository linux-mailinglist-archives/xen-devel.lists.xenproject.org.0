Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B164CD196
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 10:47:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284121.483273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ4W1-0007wq-E5; Fri, 04 Mar 2022 09:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284121.483273; Fri, 04 Mar 2022 09:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ4W1-0007vH-Aq; Fri, 04 Mar 2022 09:46:25 +0000
Received: by outflank-mailman (input) for mailman id 284121;
 Fri, 04 Mar 2022 09:46:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LpR9=TP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nQ4W0-0007vB-EJ
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 09:46:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3a32ca6-9b9f-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 10:46:23 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2058.outbound.protection.outlook.com [104.47.2.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-squpeonWMbGQNI437T58Xg-1; Fri, 04 Mar 2022 10:46:22 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM5PR04MB3281.eurprd04.prod.outlook.com (2603:10a6:206:f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Fri, 4 Mar
 2022 09:46:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.017; Fri, 4 Mar 2022
 09:46:20 +0000
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
X-Inumbo-ID: f3a32ca6-9b9f-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646387183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9oSHPoawc72BXb2ZOw22OcfjtJnd5eyq7T0i6qwUdhU=;
	b=bsqtS5+E2aiUQ6FAKreKfW5EaXMYi6Wi3k5OeU/EfGlGNug9KrttbTJj0cRKchQXE5jHdu
	36clOLiKg6fHTAtFPaRi4i9BbL9vk5HcRXHMwPe3KpiNohcxd8eEklVTPVKNdFOnxFTBYr
	qoIN/x4UcSCyR7MQap1EfrL3gdvZiV4=
X-MC-Unique: squpeonWMbGQNI437T58Xg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jy2yWJtUhnvfBpL521Mx7dMQ/KZz7IDomS0yx6KE4Xm4nxXG+fsd2OByzzCMEjYbKU93HgU1qki9fxpVz6GWaSJvvUNxB0gjRD3Er0HMoM6CFTD2pxSgYPDk6jGuPtTW7QTE1PRKTDvR5LAMLC6zf9DSN6N6WRgEjaGI+G2xqeFt5IUcrghEMkyxH7RyfyLXizTzDBy0xaYflCnzU2m05SuzhkHu5aoI0qKJ2gnPxKVL9vjn803m5xmo16vNkK567PeUU+lWbjrtwKAP1n90DCGQFi5xQSpbhhDaiYgxPGM2tttOeUkb1BHgUPe850Lnh65G3PI8w0cQXoIPgobowg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4wCX8Yi6MLEgQvA1tVPPT2clhigiZoNTvtJw7rYau8=;
 b=gecbx3yyABGOP3SxqKE8W74nzCOaonUeZrv1stn/nVrz8OMwhvrh+iB6LWleO1nKUrJU8/yG3Pz/r03dTJQTEelQj2BWBex+r09UKYIX3mruRyCxw4n9RhGuDNVzDDp/OGgtIo+8eK+WWTB4yzufrwd+xg9gZVoQ401PINhfSF37qKiN5zeaIlM1v6Fu0JDsRV6CQ8uOIOMlyKr4oD9dMy2fDUq6pqxbldRwTiJVf5c0JKEygVT8A82r8P2dG264JMwIZZef69WqYy5XTL1+MQytKk6lr7w58ZpVhWTImnW6HIBjNsPaCOeFwwTPlpZLXxvV0HYPS5NDd9BzjZAb6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e658c56c-5849-5c89-2d98-e617e42869b9@suse.com>
Date: Fri, 4 Mar 2022 10:46:19 +0100
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
 <3c335ca5-63e3-6389-cba5-b9047a4ce3b9@suse.com>
 <YiDaQY1ToO8G2QYd@Air-de-Roger>
 <abd691c8-9c7e-40d7-3f18-d96f826b8539@suse.com>
 <YiHceSbi5SPim/4S@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YiHceSbi5SPim/4S@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P192CA0067.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::44) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9ef1bbf-3b24-4069-5da7-08d9fdc3d640
X-MS-TrafficTypeDiagnostic: AM5PR04MB3281:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR04MB3281F7CCDFF978E537EE93FCB3059@AM5PR04MB3281.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+8KoGdR3DtlqjdcgHm1MZkGYIBHDIk0DyoM/JEtFufMLAMj6C9pox6zx4xsmzuGuyZYZyPpD2baAMLc3DKH1HOHGN5IlfasngElu5lyH5EtaV8jJQPHWEx9/DvlY3BqdEMG9Q7PYVjXX5pPA/AURYNuEK1zrb45bZe1GHLfcYdXEKXSHtJLPSrVPvnTvQr8xPxCuj29WhK3aKJ+7+abhP1fot44cU/DamPAPo1n3D0YHBvNG+rmjbH6ke/V+dOebcW0klbFqzmESHeePtsuOyzRqEHeeMOL7pcza0Xkht0mx0ACqw8R4ZhoqX5E42YdLvl6FAnFuPDFdoW8Cj019kmcMH/XagPgoywzaV4Cb6dQcswScVc7AYvXXH6JGHjTXFbZMfzUVsTgSmIywbKFU/wAzA3/VBipo5lD0Xr4emUjHtHCd/zSpulDLGL08fI2DwxQhyd1YqXJ3yTgjjTsbrmd/UbAD4RgcWpO+8wMTy4JIIAzA6+NyneFdUcyEOXAnDVDlJHmocWjx93+YkXo216kW3cn/0JWFU8+wL/3FVtppeutPId/t53NLzaatE24CwedqtX8/nNw9qMppjAOeF9G0sGe8A2sDWcZXOlQkJYWsMrlJQM4UFE+7v0xm30FQVwreGVUiedb5Oi84vuaT42h7Sx572jP2TtZjI3ZwhjPDCVQv9s410PcCBgTE93iAp2Q+wePmEvBtP0tPd43b9L6D2Cykexz5NqZcMEdlvMzuT2GNoKu2fIPLnjXt9H5w0cQaldRTcb8tREqmnv//4eA2YgpqTb3s8m1AmKBIkKnQ8dBBIREtn0LwMCemM7zXVWApsg74G9EW+g9guMZp+w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(53546011)(2616005)(2906002)(6512007)(54906003)(316002)(31686004)(8936002)(38100700002)(6486002)(31696002)(966005)(508600001)(66946007)(6506007)(66556008)(66476007)(36756003)(5660300002)(186003)(26005)(8676002)(4326008)(83380400001)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CoaLugokQHQEeZgfm8Sg0Z1ff7MSiwvP7Tqn2DgOzxnWok+brfqw/jgoh+8J?=
 =?us-ascii?Q?GXDYI3dhzAdIwyVFYGPNQMagKXFdHewLs9bq9v0vkbPqonTiLLsae4CReXIK?=
 =?us-ascii?Q?DvfAMwQDE28FWSHFCsol7VMEu2/pxi5cwlUfjupDYBuO8ErKoW/Qk2TeYuG9?=
 =?us-ascii?Q?2wJIEDaNYuI1NSH9wpalYOirTRHGY5XY+44VUHHRKqqh5UbNMAuqij+Pgo0S?=
 =?us-ascii?Q?LCN9bVowANKjR+dwHHoCqJd/JIbf8G6lw5iOxJRaDmIzfvTorH6ZkRX5/3jv?=
 =?us-ascii?Q?CrKGEZGmnmGX38EcmrAiD4uNvtqmI6+FpFJCI3n+3yrnXTGsTjbfbti3fvlx?=
 =?us-ascii?Q?7GTXWZeBgS28n7ec5Nj6FQ9KieIk/VvmvHfYs5hvOu5BIlvrlGdKOgK768mv?=
 =?us-ascii?Q?slIO7IK6fCnuuLftReNSiJnEIzOxseunTIaGJFImtNEQPo+y/adm6vAAwCyK?=
 =?us-ascii?Q?cOLtmX2VFsM2KILWx6e05/tx15VnQrO0VHS3YYsnhdtKbHzBl4wGMPfzEu/g?=
 =?us-ascii?Q?R7hn8shWUMMWH/YHLsmOxeyiTSQsSX5J8/jLuzubu7Sz7NLauqzOanM+CD+T?=
 =?us-ascii?Q?8jQYaN+EOqT382CT/fbWvmdaOo387q7HbMA//gZ/fO6Lpl9JgD6y/5X/A2hw?=
 =?us-ascii?Q?JNn/1sizdySsW1usldUKaUXy8I2dK3Xl++yx/YtWV/Zz7dnFUI7zISzv6717?=
 =?us-ascii?Q?LPXZRXwALswqZ58pbJS8bavchF9//3GQFn3RBrdVSgq+49rwd2/Zwptvbtbx?=
 =?us-ascii?Q?SeYOlm0l+LOIFFvF3gYE28zm2cfNMgZEPq9p3XPeW4TjZ8N/LDaDgM/BEHM5?=
 =?us-ascii?Q?P6dhXpTWiom3NUNx/Z/ijqXc7cVwv/EF5HL+QvYL6sdEYnZpTUoBach0LB8+?=
 =?us-ascii?Q?t34AQJgEDSUvtyQNetxR6LYgO0d/tycDBpR4tFXdYIHIUfRlSUCF/S7jfGw8?=
 =?us-ascii?Q?QsPSCQd+bD7N20zvEcuWHFJkA9eCHfO2MdjuCaKT7V/gsGxnp0InPXgRFIMd?=
 =?us-ascii?Q?1vo3d2fEkix/+MtJ2e6+W/wrNSN5j3nDjwmp4GFp+hs4sSoK7zSMCFWyaf0X?=
 =?us-ascii?Q?0stSWILWQWJfshrADtLDTVKMdMBvhJYpSwelAggOM7NwQoxHjGEwj/57kQC/?=
 =?us-ascii?Q?DP35UZ9rWNiWbp4JqmSHa0DGCiO+NG50WUyTPefYXZz/PNI/iQAGH6ZcGheB?=
 =?us-ascii?Q?NrlnJkKQsTkHsnJAB9I6mIBTZnBiBNAhb+zyclC7iTYxftT+AjLOeFAvKlm3?=
 =?us-ascii?Q?J027caPABJZgoOCJoO88Sv2BYJRc1TWiQjTnAMb97Xrm3WE462rR531yQvIF?=
 =?us-ascii?Q?xUcNXVd5hJ/uX+V00n0j0Csnm6hPBN9vLdUWvGWAz1M2Wih7pYFg0PdTZr8U?=
 =?us-ascii?Q?XgedyhblSG99dsQgopN7x5GrQBYcuS1TZ3nAt0iwLfzGEdqLFekruA2sx9U0?=
 =?us-ascii?Q?yrqm3+IXMF2mTlvC2pKYERhW2Gw1BH1gfKzJdyqd9SsWDKF1mx4YsAhTmCDz?=
 =?us-ascii?Q?44KTeolVLpRdt0c6cQZpkqEJZhb+dtn7wS/QBctzPbSD6VgiZ01S2R6hAFkA?=
 =?us-ascii?Q?hovCHpRC+7YjCr6NcW8M92I+6i99u/XMMcsdbdLaUgE/2ZgYRKqApSSbspJV?=
 =?us-ascii?Q?DG06JLFp8/gz1O5ofEErd8Y=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ef1bbf-3b24-4069-5da7-08d9fdc3d640
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 09:46:20.6034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +LegwGJWXkbcP7pGyJvxs9+qzIV3dYHdoK06ytWRfcrIVWOCxO7Poi9111WMnnkG9xBpvOZXC6DzGgdqz3m6RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3281

On 04.03.2022 10:31, Roger Pau Monn=C3=A9 wrote:
> On Fri, Mar 04, 2022 at 09:02:08AM +0100, Jan Beulich wrote:
>> On 03.03.2022 16:09, Roger Pau Monn=C3=A9 wrote:
>>> On Thu, Mar 03, 2022 at 01:17:03PM +0100, Jan Beulich wrote:
>>>> On 03.03.2022 12:19, Roger Pau Monn=C3=A9 wrote:
>>>>> On Wed, Mar 02, 2022 at 03:19:35PM +0100, Jan Beulich wrote:
>>>>>> As was e.g. making necessary 4b7fd8153ddf ("x86: fold sections in fi=
nal
>>>>>> binaries"), arbitrary sections appearing without our linker script
>>>>>> placing them explicitly can be a problem. Have the linker make us aw=
are
>>>>>> of such sections, so we would know that the script needs adjusting.
>>>>>>
>>>>>> To deal with the resulting warnings:
>>>>>> - Retain .note.* explicitly for ELF, and discard all of them (except=
 the
>>>>>>   earlier consumed .note.gnu.build-id) for PE/COFF.
>>>>>> - Have explicit statements for .got, .plt, and alike and add asserti=
ons
>>>>>>   that they're empty. No output sections will be created for these a=
s
>>>>>>   long as they remain empty (or else the assertions would cause earl=
y
>>>>>>   failure anyway).
>>>>>> - Collect all .rela.* into a single section, with again an assertion
>>>>>>   added for the resulting section to be empty.
>>>>>> - Extend the enumerating of .debug_* to ELF. Note that for Clang add=
ing
>>>>>>   of .debug_macinfo is necessary. Amend this by its Dwarf5 counterpa=
rt,
>>>>>>   .debug_macro, then as well (albeit more may need adding for full
>>>>>>   coverage).
>>>>>>
>>>>>> Suggested-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>> ---
>>>>>> I would have wanted to make this generic (by putting it in
>>>>>> xen/Makefile), but the option cannot be added to LDFLAGS, or else
>>>>>> there'll be a flood of warnings with $(LD) -r. (Besides, adding to
>>>>>> LDFLAGS would mean use of the option on every linker pass rather tha=
n
>>>>>> just the last one.)
>>>>>>
>>>>>> Retaining of .note in xen-syms is under question. Plus if we want to
>>>>>> retain all notes, the question is whether they wouldn't better go in=
to
>>>>>> .init.rodata. But .note.gnu.build-id shouldn't move there, and when
>>>>>> notes are discontiguous all intermediate space will also be assigned=
 to
>>>>>> the NOTE segment, thus making the contents useless for tools going j=
ust
>>>>>> by program headers.
>>>>>>
>>>>>> Newer Clang may require yet more .debug_* to be added. I've only pla=
yed
>>>>>> with versions 5 and 7 so far.
>>>>>>
>>>>>> Unless we would finally drop all mentioning of Stabs sections, we ma=
y
>>>>>> want to extend to there what is done for Dwarf here (allowing the EF=
I
>>>>>> conditional around the section to also go away).
>>>>>>
>>>>>> See also https://sourceware.org/pipermail/binutils/2022-March/119922=
.html.
>>>>>
>>>>> LLD 13.0.0 also warns about:
>>>>>
>>>>> ld: warning: <internal>:(.symtab) is being placed in '.symtab'
>>>>> ld: warning: <internal>:(.shstrtab) is being placed in '.shstrtab'
>>>>> ld: warning: <internal>:(.strtab) is being placed in '.strtab'
>>>>>
>>>>> So seeing your mail where you mention GNU ld not needing those, I
>>>>> think we would need to add them anyway for LLVM ld.
>>>>
>>>> Hmm, that's ugly. How do I recognize LLVM ld? I can't simply use a
>>>> pre-processor conditional keying off of __clang__, as that used as the
>>>> compiler doesn't mean their ld is also in use (typically the case on
>>>> Linux).
>>>
>>> Hard to tell, `ld -v` for LLD will typically contain '^LLD' I think,
>>> but I don't really like matching on human readable output like this.
>>
>> Same here. But Linux'es ld-version.sh looks to be doing just that.
>>
>>>> I also don't want to add these uniformly, for now knowing what
>>>> side effects their mentioning might have with GNU ld.
>>>
>>> Wouldn't it be fine to just place them at the end, just like it's
>>> done by default by ld?
>>>
>>> Are you worried about not getting the proper type if mentioned in the
>>> linker script?
>>
>> I'm worried of about any kind of anomaly that could be caused by
>> mentioning sections which a linker doesn't expect to be named in
>> a script. That's hardly something they would even test their
>> linkers against.
>=20
> Just realized, in arch/x86/boot/build32.lds we already explicitly
> handle .symtab, .shstrtab and .strtab for LLD, it was added by commit
> 10d27b48b5b in order to prevent LLD from complaining about discarding
> those sections. So it should be safe to also do this handling in the
> general linker script?

I wouldn't want to infer such. What build32.lds is used for is very
simple input. It's a hint at best that it might be okay to use even
with GNU ld.

Jan


