Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF7B4CCF7C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 09:02:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284011.483129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ2tF-0006c2-Jl; Fri, 04 Mar 2022 08:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284011.483129; Fri, 04 Mar 2022 08:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ2tF-0006aC-G2; Fri, 04 Mar 2022 08:02:17 +0000
Received: by outflank-mailman (input) for mailman id 284011;
 Fri, 04 Mar 2022 08:02:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LpR9=TP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nQ2tD-0006a6-VB
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 08:02:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6709457e-9b91-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 09:02:14 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-XdExIWqMNDu3DsLlRcNWrQ-1; Fri, 04 Mar 2022 09:02:13 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR04MB3082.eurprd04.prod.outlook.com (2603:10a6:7:1c::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Fri, 4 Mar
 2022 08:02:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.017; Fri, 4 Mar 2022
 08:02:09 +0000
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
X-Inumbo-ID: 6709457e-9b91-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646380934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FAeYqOQo0dqKfU9g7bMkIrOi77TAj/BS2m2GjPt7iH0=;
	b=l9EW7l7y4Xaw9TDGso+JKs427uUF+W0by60z+iDP2USMkPiUrWtPYWWuBr5SLdbSvJNb6n
	8daaKMigduzxZ0cTfT2507X3du1l7+ycbxV1pFOpH15uwCr013OtCk43nPFdDPX9tFzlLQ
	8K/gkuYyZF7MA1FZIGbZ9yYGiW+lWvo=
X-MC-Unique: XdExIWqMNDu3DsLlRcNWrQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZKf2o1jUWOIbZ8jixq9mZX3GBSjVr0gTDbrvcJEeFi+hVdBaxXwVq13sjAQjk1WUsw9OAmQVpV0ke56qBIaVYuVH/oPGA4Hc5xZSSAz8CFX552MKsMw6mRFWkGb+28Z3vhXRj/luAu7X4dH2RSFlnhbdsxwbT3b5kPR1TwEH3zU+w5+pna75iCMt1/XqGXrCsmCpLE6qVAZ+x/OTSf+wXam08i9hbczVmKFsPn8qEoZzI6WCadE+T1W/wYE8CK2HhlYJtz1cLjdXuGj1YWAX6dCulbx4G+h7WTYlcOVqh6HbTDH41HH+cwt1jAURZ49/mphpQD3nGpHoD/vB0Yx+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3vZgyK1VgbXd9WQxjc6Rwgr8IL/aKOpLKP3kWaqfBE=;
 b=nCCJ2FPiweKixaB4CySajB0AGG5W9t4mjKdnl0viivW9iVdzLomNk1d488J+RPGpcNybAIMWvEMkJFu/Kpfm5tY1KtVKDElZxkAfeVXB7/Cf0wFzWGA40e0pfOLqt5WjKidBdsqoyswHcTi3SnDhSfVHWQoBT1WcsgotxrIm9UHHi9l8+dVhlE13krDspXEyyGvg2I3A5GCgv1hat38x0YqraUv7Hgxcq1ZnYb6mFcD+w0kwZBDUQ+EIHjcQSer6jcNUNrVydY2kHS6TekAuEL25JM//XxqqOeh0bkMA1KFe0iYF5FB0orEo4jEq7gFHU8ZHkQS1JcWiuzmv6pNL2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <abd691c8-9c7e-40d7-3f18-d96f826b8539@suse.com>
Date: Fri, 4 Mar 2022 09:02:08 +0100
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YiDaQY1ToO8G2QYd@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0011.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ac48502-7a0c-44d4-8696-08d9fdb54885
X-MS-TrafficTypeDiagnostic: HE1PR04MB3082:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR04MB308263CBE3A65B5ABEDEBB49B3059@HE1PR04MB3082.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QitOkq0Z0Dy6S1ZXtUcJ1bQMAnpU+pEzpTu7WBGRZMwFUiVRCb/XbaogChiRlPoTJsZyO/zVGlNrXDIWmqdxeUWAq6PH3MHavaAt8p8dwTZWLfbOmnI92ZA1y4T3jutGC5GhOs+3ZnUnJPgxEmDPkuSWRJ0TupY1/TgaQTFP6UfzfclWLR5L34ZyoHh5yivXx1ncsDiCHts+C29z2vOb8jcfoBWqiXhX9euzLLrN0cen9owL9nXLDvw+QydvW/AZpvLs5b1CEDdG65Uhc5hgQsqvEHZRyGUa7ca5Dd1DJFTfUdVTr8ES9M3XZgsiUiIM4PDiK96FKE27QB6v8qbAdRR5H4yalyLS8JHToTfMplcJUATalt+7VxcyHlu1im7DA9aI/ch8E6NNtG97K7jRmpDj5f5CszK11BHWKXDOWFj+/AGXXiuBMxJn0QzDy+BMHCxy7iFR1RZHRFckA88LAAci145fAdc6vSS23StzZbH7PPSizajO0lBa6Ekwb8PUDI5ogRjcUBbgRuAJAHDpnI4C1feAOXftYADaGPgYFZ1k68RyWZxBNjJn2apbXS5eBckk+4ufvGArMlDFaGnqeVd74V9NXWoYqOkCiozaoFQaygyAL+70v6SfPgTyxiK67Ne9/6OSAGcjNbtg9TsBY2U5fqpDY+nE8YjdgAN6x6EydBYveGbhPtTL1T8dY8OPsaF1kwUOpPX7a3+Zzhvdr5WREmcADy9nqW11IlCKnxAbjKxm2iohVZzHzYGPNGvYX8zibrzO69VbmaxA/cqnD2q+Dl5NvX2J6fs3EZVgLGrr3AIFxZ23bGDr44KPW4uQgkldVwt2MmpjUnJXluRkUw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(66946007)(31686004)(66476007)(66556008)(6512007)(54906003)(4326008)(8676002)(53546011)(2616005)(2906002)(38100700002)(186003)(26005)(316002)(6916009)(5660300002)(31696002)(8936002)(86362001)(508600001)(966005)(6486002)(83380400001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vfSLslMCDI/N9ERD5BTotTUsh6j37hKO+MT/3otxA+ARXPMVlJ1Zhhr6IQaA?=
 =?us-ascii?Q?BDyOk/1ftbvjytKSKdeuDwgUbdDQItfulFPcu3cAbI1QBgIY9fuq+fZPzt+w?=
 =?us-ascii?Q?e2qqm0UndYd8tFXqUmrjeRl+xjomNPVx+sDMmP8/gqQz0U0AXFiOHpkgdPsN?=
 =?us-ascii?Q?vJRUXoIU1LYSxl17SvOh9K6ZRFizeS1yZ0bTS6aUD4rxHFh7Gehrx6HWcmB8?=
 =?us-ascii?Q?fn74Ex7ybS0AqY/pi3w5PanLsVFd+64nH6NK1v2vxWqgI4cBc6Fdh7kWTZTR?=
 =?us-ascii?Q?E26/cBsMrArM4ZEwpYIk8Vu48dYS6bqtmM0V4C9m2iIpk0inSUaf8zYtOjgX?=
 =?us-ascii?Q?euI3ouN8j5F9/cewMMettCvlAuFbHgmtj11F1kC05j7dJ1VeKT8xWxAqNOgx?=
 =?us-ascii?Q?ThXdJE0xXBk3JlPp09ev0EC6CdBxHPeo3UhxSrD3YEgp/I4/HXPLsxzgxutf?=
 =?us-ascii?Q?kbasNW5iFHbMu1p/54hf6okV0PrPAuDktU3wFRwoRwiJ9bAqIeXFVGdqBtUY?=
 =?us-ascii?Q?Rqakuhw6l++B2ReXHkEWfvby9vC+CrBd3oPv+C7GRc0qxTLYyvJbbronZvIC?=
 =?us-ascii?Q?Q3uiXFXu+mNqt6LGWMfeF9Q+V2VBttD47UOdUo6CYfkd8Y950sOQHDfV3K/T?=
 =?us-ascii?Q?UN+lxyLjgO4U90PAZRDLxCYfJnVwc2680hlLK0HnsEULJKvFSPD5OmUnGzcV?=
 =?us-ascii?Q?JULvKmpblLbP2+WellNvAQRjI0MSteaAXQzLtfYLl4EgxAPM+HiHnmUoYDFS?=
 =?us-ascii?Q?pE7vBhvmUz2SD3uh5g9aD1K5BOE3Rotc6yjH+UxkbHs6Kdk8eUKP1ZE2UegS?=
 =?us-ascii?Q?nat4Xt16emS6Rx+8JriSFs/Ni9Wq9uCL0ZWJF7xHhX762JtzUT+FzLghuNGV?=
 =?us-ascii?Q?RkRixxiRcqqqaiC/FvwoAK2tuC5K0s/rfVhrArP9uX87oyy8s5EVLIV14xwB?=
 =?us-ascii?Q?RRrlrpna6QLLqPRsqYzFchQPa7ISoEFAZyK8DeenBoHgAuojQBNClPBMnoJu?=
 =?us-ascii?Q?s47kTPjhAkXYu8UDDG0H7/GYuuzb7PeJJqfvEaUMTocnNzrNV3oeV0Tsu9M7?=
 =?us-ascii?Q?1cyPyvjXqLZP+pFDue8TPAJsmcMDcfAoeo52JceW9qqZdalEOLnUVEHMfHI2?=
 =?us-ascii?Q?GKrfYfXPEV4xHPaPEQKVMgm1o7L/QDmKIyfadEL2P8ejTWXoaTsY36duN8zM?=
 =?us-ascii?Q?kWjOcR1jV2dX5+J9XjJL5X3yjvQEM29crUEtjzrmPQsvycfty61QK2+rh4NW?=
 =?us-ascii?Q?MgGKxqYKIioo0EgNo7gdhQjUTKcHk5fqcrpCocGtGadfDQTyEYiAwhNz9Ri+?=
 =?us-ascii?Q?koHnQr3Ycw1180uZbt/AUqD+ZaXGkeTBPNAsW+AqX3vs4Jw8fIejRKhxCmVJ?=
 =?us-ascii?Q?6xLJ2G+88yOeUfLjDXseOcvNDZCUqTBjI1N1XLX7kR4oFbI6LIbrUSWHLSv9?=
 =?us-ascii?Q?3cc2TQjtz4CiLQOr6ixX0ChQu8S4npjD8InMDcfH/JpCDap0EWTHj4bIYhgA?=
 =?us-ascii?Q?5iWWLQfkm1ca74MFPhtLouI0kx8G2HTZ21cgGH68XVxY/DSa6+/AIXeYSkbN?=
 =?us-ascii?Q?7Jnggu4gJD+VO8E4BDadMmEnvl+XMEutTeuw5/ONvzG6Qo4i0VaWlz/qpBsL?=
 =?us-ascii?Q?k9F5LT9wTkpkuJVJ3f2L8EA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac48502-7a0c-44d4-8696-08d9fdb54885
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 08:02:09.8503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oDPY4uyPTYXxbmXLYXmpkAExuLgqWyvpr1jVVmp2OmOAc4GzU1UDMLtqHMlSeOZku5Ktp3iLyRZRxVB4wAX1Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3082

On 03.03.2022 16:09, Roger Pau Monn=C3=A9 wrote:
> On Thu, Mar 03, 2022 at 01:17:03PM +0100, Jan Beulich wrote:
>> On 03.03.2022 12:19, Roger Pau Monn=C3=A9 wrote:
>>> On Wed, Mar 02, 2022 at 03:19:35PM +0100, Jan Beulich wrote:
>>>> As was e.g. making necessary 4b7fd8153ddf ("x86: fold sections in fina=
l
>>>> binaries"), arbitrary sections appearing without our linker script
>>>> placing them explicitly can be a problem. Have the linker make us awar=
e
>>>> of such sections, so we would know that the script needs adjusting.
>>>>
>>>> To deal with the resulting warnings:
>>>> - Retain .note.* explicitly for ELF, and discard all of them (except t=
he
>>>>   earlier consumed .note.gnu.build-id) for PE/COFF.
>>>> - Have explicit statements for .got, .plt, and alike and add assertion=
s
>>>>   that they're empty. No output sections will be created for these as
>>>>   long as they remain empty (or else the assertions would cause early
>>>>   failure anyway).
>>>> - Collect all .rela.* into a single section, with again an assertion
>>>>   added for the resulting section to be empty.
>>>> - Extend the enumerating of .debug_* to ELF. Note that for Clang addin=
g
>>>>   of .debug_macinfo is necessary. Amend this by its Dwarf5 counterpart=
,
>>>>   .debug_macro, then as well (albeit more may need adding for full
>>>>   coverage).
>>>>
>>>> Suggested-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> I would have wanted to make this generic (by putting it in
>>>> xen/Makefile), but the option cannot be added to LDFLAGS, or else
>>>> there'll be a flood of warnings with $(LD) -r. (Besides, adding to
>>>> LDFLAGS would mean use of the option on every linker pass rather than
>>>> just the last one.)
>>>>
>>>> Retaining of .note in xen-syms is under question. Plus if we want to
>>>> retain all notes, the question is whether they wouldn't better go into
>>>> .init.rodata. But .note.gnu.build-id shouldn't move there, and when
>>>> notes are discontiguous all intermediate space will also be assigned t=
o
>>>> the NOTE segment, thus making the contents useless for tools going jus=
t
>>>> by program headers.
>>>>
>>>> Newer Clang may require yet more .debug_* to be added. I've only playe=
d
>>>> with versions 5 and 7 so far.
>>>>
>>>> Unless we would finally drop all mentioning of Stabs sections, we may
>>>> want to extend to there what is done for Dwarf here (allowing the EFI
>>>> conditional around the section to also go away).
>>>>
>>>> See also https://sourceware.org/pipermail/binutils/2022-March/119922.h=
tml.
>>>
>>> LLD 13.0.0 also warns about:
>>>
>>> ld: warning: <internal>:(.symtab) is being placed in '.symtab'
>>> ld: warning: <internal>:(.shstrtab) is being placed in '.shstrtab'
>>> ld: warning: <internal>:(.strtab) is being placed in '.strtab'
>>>
>>> So seeing your mail where you mention GNU ld not needing those, I
>>> think we would need to add them anyway for LLVM ld.
>>
>> Hmm, that's ugly. How do I recognize LLVM ld? I can't simply use a
>> pre-processor conditional keying off of __clang__, as that used as the
>> compiler doesn't mean their ld is also in use (typically the case on
>> Linux).
>=20
> Hard to tell, `ld -v` for LLD will typically contain '^LLD' I think,
> but I don't really like matching on human readable output like this.

Same here. But Linux'es ld-version.sh looks to be doing just that.

>> I also don't want to add these uniformly, for now knowing what
>> side effects their mentioning might have with GNU ld.
>=20
> Wouldn't it be fine to just place them at the end, just like it's
> done by default by ld?
>=20
> Are you worried about not getting the proper type if mentioned in the
> linker script?

I'm worried of about any kind of anomaly that could be caused by
mentioning sections which a linker doesn't expect to be named in
a script. That's hardly something they would even test their
linkers against.

>>>> --- a/xen/arch/x86/Makefile
>>>> +++ b/xen/arch/x86/Makefile
>>>> @@ -120,6 +120,8 @@ syms-warn-dup-y :=3D --warn-dup
>>>>  syms-warn-dup-$(CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS) :=3D
>>>>  syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) :=3D --error-dup
>>>> =20
>>>> +orphan-handling-$(call ld-option,--orphan-handling=3Dwarn) +=3D --orp=
han-handling=3Dwarn
>>>
>>> Might be better to place in xen/Kconfig with the CC checks?
>>
>> Well. I've tried to stay away from complaining if people introduce
>> new tool chain capability checks in Kconfig. But I'm not going to
>> add any myself (unless things would become really inconsistent) up
>> and until we have actually properly discussed the upsides and
>> downsides of either model. Doing this via email (see the "Kconfig
>> vs tool chain capabilities" thread started in August 2020) has
>> proven to not lead anywhere. I'm really hoping that we can finally
>> sort this in Bukarest.
>>
>>> I'm also wondering whether we could add the flag here into XEN_LDFLAGS
>>> and EFI_LDFLAGS, as those options are only used together with the
>>> linker script in the targets on the Makefile.
>>
>> Not for XEN_LDFLAGS at least, and undesirable for EFI_LDFLAGS. See
>> the respective post-commit message remark.
>=20
> But the calls to LD in order to generate $(TARGET)-syms do not use -r,
> and are all using the linker script, so it should be fine to use
> --orphan-handling=3Dwarn there?

But XEN_LDFLAGS is also used elsewhere together with -r. (Whether
that's actually correct is a different question.)

> Could we do something like:
>=20
> $(TARGET)-syms: XEN_LDFLAGS +=3D ...
>=20
> And similar for $(TARGET).efi?

Yes, this ought to be possible, but would again lead to the option
being passed on all three linking stages instead of just the final
one. When there are many warnings (e.g. because of the same kind of
section appearing many times), it's not helpful to see the flood
three times (or likely even six times, once for xen-syms and once
for xen.efi).

Jan


