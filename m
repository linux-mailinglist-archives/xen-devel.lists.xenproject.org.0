Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F544D1A1D
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 15:13:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286971.486711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRaaA-0007zK-HO; Tue, 08 Mar 2022 14:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286971.486711; Tue, 08 Mar 2022 14:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRaaA-0007xL-Cj; Tue, 08 Mar 2022 14:12:58 +0000
Received: by outflank-mailman (input) for mailman id 286971;
 Tue, 08 Mar 2022 14:12:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KW+D=TT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRaa8-0007xF-7t
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 14:12:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d92d91c2-9ee9-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 15:12:55 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-abiwVkvDNriLScoFT7xFqA-1; Tue, 08 Mar 2022 15:12:54 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DU2PR04MB8518.eurprd04.prod.outlook.com (2603:10a6:10:2d1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Tue, 8 Mar
 2022 14:12:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 14:12:52 +0000
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
X-Inumbo-ID: d92d91c2-9ee9-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646748774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=binHjUhMGNEw7NbqaJSal3Fyb8A5DoXGMU2cUeK2T/Q=;
	b=SMuA1hp9y5lzAAFEbZH/3vCtHG8W2uLcynlvIlCsvV7qf+bUKJG/3DWewMjwrMBu1oYCBh
	eCoEZ2dm8CcnNrf49zK1Ix53i+d/rGytp+bjciQiCU+SO0vCChWygRUlzsYcSPJDQx2S8w
	DCI3Oj81QH6inChLOGKg2aHusXx8cCA=
X-MC-Unique: abiwVkvDNriLScoFT7xFqA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9S3e4mV/PsLOdyE+71c6fH/F8IlB0bO8uGlwVJWvU6+zBgzUVHNceqZ+EFUyCWgtO5198BRkDMQj0oeb41FJEK1IKUY6+FjtUhgn+fm4K64ueuJ5C2jOxIrMhYPMenf8owFxYicGv8YS8/cKa238vc9AnZXaiVfhSdhfn0CYtbOfLnDdT2aVJuL2rOfcqVFli6iJMY61af/2S6uybyf/XD19qdxsPXjeUv1bE4RQe/SppIlDvU437wXcqv+RPSPL1Rt2b4EADohOfiM9ZSqIMjIQ3rTl07g9ep87/Ne6k6VY4GeFedkjcwFxEsXwPJ8AtkEnUDNXmkrBVtI0kleRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2y8xxcOSPcKDydZaw+1PgpNc6QcandMyY0+iEtAYbI=;
 b=ogO10mR+3UTaZDTawDMgbT+LhkBeBgSBVTpUZkKej4GU5ZWMZiiYaiG8kLZcaEpWXTGIYpkUkIqI9pUcz9O3lvos4kP/CjL1WH/yc4f36tht/LRkyxzcF+UV2av23bEp/eG7IiFahiNXO0FyxPwbrbmh5of8vNQTZ2b31AY+wlgPuM9zQEvEDn2vPGKhnAZhqpIrYPemz2d2uWgwNDv/4b5Bw+B2qoJ33LUS19uTHGv/bQpFolYN7tdrf/rcMqdejE4OZ4/46fhatdpv54k12PQJuI7BOtkx7ay2L7RecXzcsLbHEnN6t8rsuwUEnGp4143yF4TsbIod2JM27cW2ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cd3725d6-a155-f706-3dc2-a1dedb483cfc@suse.com>
Date: Tue, 8 Mar 2022 15:12:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2] x86/build: use --orphan-handling linker option if
 available
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <289684f6-fa73-bf02-137c-680ad8891640@suse.com>
 <YicsK8xqdcGZYaIn@Air-de-Roger>
 <0cde8972-b357-e2c0-ccc4-a0720cfb3501@suse.com>
 <YidH9La8I4X+M2S5@Air-de-Roger>
 <90124755-cd69-6352-e75f-80a1e53c93e8@suse.com>
 <YidjLL7xiBxUNtWx@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YidjLL7xiBxUNtWx@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0329.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc1ec6aa-9853-48a9-4321-08da010dbbff
X-MS-TrafficTypeDiagnostic: DU2PR04MB8518:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB8518BCDB3261CFFB7773E006B3099@DU2PR04MB8518.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DHzUIXgkO6JUnGUKMWQZItETAUQfRglwLboAPB9Fk18RcpjMwTcIWs9fsQLJ+M3D1MFd2oWUw+RjM2AUaIfjnScprT1sWV7+kYjiCNgN9Km3/kc3LyWSIFMZAsXq5xb/Zgz26TuQ6K7dJtNH7l8oWabKVBjY5xCylatQXTVdJXMvOoj1e27L+iyo45gMpHQUusPcpo1GvV0pecebDHYYakyfYXI0Wbb+UoaODUox7pueha1GvxDVe/OJqukubcgLx+QYEZKJdxVPrT6U/5/GG2psEz2JfIdavRlwfszNVQS45Xue4nbHPh2VlrLnn36/LKV2yCHnCPRs0J0c2yC+tMdX1BRQgt0VyYF6o4RtxVV1yLvSpdP3wl7KDqVcmJQM80BXg6xcIP1j22dYjk2UHUeUldBjFdw1eEQP0jW/JZ0O3JWk6G0ZYhawJgRVcm78XSrSWFzuHnvUzTDEvWKhDF2T44FzTNYgZpEjRh5z3spdGwJ+m/9qEWIbhngXn6GUqUyO5pjHeyrtOeBmbqbmGkcS94kYU++Be2g9BR40aXKNEWveduf+0qE/WqBZilwOBYQuwIsK0fEGiy4FO3QKWeu+LD8KulA9obyVCfugmmj3xE1my5S6gjBDsV3IfOcNJvvfPOfhhvgxqApAF63FcyzVT1REBXU35dz3wvyIkafffdlIGlEn334tWo7HvKCmm9HCejA4nBbgRA5bwgTjdEC9ceIa4EQFvEIHIb2hA2A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(508600001)(53546011)(6512007)(6506007)(4326008)(6916009)(31696002)(316002)(86362001)(66946007)(66476007)(66556008)(6486002)(54906003)(38100700002)(26005)(186003)(2616005)(36756003)(5660300002)(2906002)(8936002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+hHngSkbfTo0qn3fFPUXR+/S66PLNfBMDMRqEvAQxarOZ8ICOw2n8R1DZbdG?=
 =?us-ascii?Q?RlRIxrXtS0DNgFHj3utPoHoEMsI7qsfPUF8yff7ABqT7/9B2EC/jEeerfjI0?=
 =?us-ascii?Q?ZDiANT2NVunm69iWUA5IGJVtio6sUU1EC2/KexmiDMxUtz+7nFWcA/ntZKWX?=
 =?us-ascii?Q?6XExbX/x64pB60d18Y7/ljNacDXIxSB6sboBCB5HSqfQZLtxKsxF/IWcjL6B?=
 =?us-ascii?Q?E9QY84W8Tyg7ITVy1/jp/dORcFIVwq17tzE5Mme86I6p6E4FuQ1CsOC1hpjo?=
 =?us-ascii?Q?Nft7gwku0N4Gtd/aK0kY+zYaJPjTtNiH/iO+RrgB2M3xWqy9gh6apjb+P0Yz?=
 =?us-ascii?Q?pJaRShdT/pPGPOpicXgljCN1Tsu0QLjgvTjcKsOGjDissvckVAVLwyf5Y9DT?=
 =?us-ascii?Q?5V/fd1GIWkHx31Kj/00XuaY2A8M1wJ64vw1C8fWy60Ivy38rOQFLDM6pM3m0?=
 =?us-ascii?Q?k5l3ILA/kpSZec60iHfmT9om4xAFN7dH/S0WVYhZQdPg5TVWaRf/MdEnEHGg?=
 =?us-ascii?Q?ZDebcyxXRj4Lou7yIXPjb3/uURCbPdiJf183RPGQvtAiFLFRKZZLiwjAiTfS?=
 =?us-ascii?Q?8MLaVmYPKc0DCOothsYbgwSKMDgd9Izc44cAepcfXo50KGqbHmmptjAoM7vM?=
 =?us-ascii?Q?zVeXtaeFuVqabszy7b/GKqabzSOQn4dtelyDZlNft1PddnkqyTs8a0NwdKFa?=
 =?us-ascii?Q?zW/ipkX+44jGtGkzXtQ/zGDepKCG5kXq3kBwVh/dtS4QwPWq8jo2uA7EXake?=
 =?us-ascii?Q?TQ+o6x7d+R/Jwrdjz5DhN71s9Xmh43t1bebgXaMLjNMLiMLkSSN3gVHQlFVc?=
 =?us-ascii?Q?AEJ4qA3lcarsWbko3ZvhMzU8FbH9lThul840HcQzwf4TMd4q3TDDLnew48iB?=
 =?us-ascii?Q?Ll3ujh4dhlUBSE+MHCT211ohkShU15tDmWiIOEgfFp+Fc5uWhn40JBGx1e2n?=
 =?us-ascii?Q?Sv2UwwsuH22Om3NGkDo7kVVic4r1WUosOQgm5z/WqQ897YQHIE2YNqu7TPVO?=
 =?us-ascii?Q?W9eg8egcTiksUYHk2gkSQPiy2YoFjHI+CLZrJxzkCUd2fS/CyN7pxgyiiTqR?=
 =?us-ascii?Q?U4FVze9lr1jSnuoXTCIOHKZOEFbVOrX8POe8mAViK6duQTAAHchHo91LihF4?=
 =?us-ascii?Q?eyneNCb06lAkZyy0bXCCifukM348mMNlFE3NJ8qPha3+Tc7xjg8U20+n/iAU?=
 =?us-ascii?Q?1qAtNW8skXGKUYj3BzXdOcgO2S6mFw8bu1PFFpDc2LCNO3/tdbb4dm3oHvSl?=
 =?us-ascii?Q?xVBnj8o3aEJdm2qn2kvkXiJTynTRbu2JRf+C/jCChCKuE8Y4B+jzp+uo76Lj?=
 =?us-ascii?Q?GexeCOVByGOcl4HJFguMmzPprVRnci/DwgzAXErBZ653p5+Ue9+PTg5JHu4o?=
 =?us-ascii?Q?Rszot+U0psvqTCU6z9SXSH/S/VmDRkgx31VphZuqZjyzq6g86AvraSgt6Xh9?=
 =?us-ascii?Q?XXYzmfZDRXFVpBesHLlZTXEqGFTQbna0qILyzER2dT4s0g45Z9ZQ15JfnAIx?=
 =?us-ascii?Q?hb8D77pns/h6w7qwcHJQx4CGD23VZSoClu4p0W7GsR7jXvbNsqPDz9uDuscW?=
 =?us-ascii?Q?ymtHxG/fpwOSzqZsbmu0tFyK7wVCIQw0lOTsYMh7qan2czEVgFZxr0k3YW+z?=
 =?us-ascii?Q?+W3v8ERJBrqABtt2/h/qSsA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc1ec6aa-9853-48a9-4321-08da010dbbff
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 14:12:52.7867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7fTyM7kzKumIMslwWnNB++OTttNY+GI8PaDaz6hS5VNtGU6MF96eXg8hHWenNZhvGc8tdUMoAayfBe+wCXXTgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8518

On 08.03.2022 15:07, Roger Pau Monn=C3=A9 wrote:
> On Tue, Mar 08, 2022 at 01:34:06PM +0100, Jan Beulich wrote:
>> On 08.03.2022 13:11, Roger Pau Monn=C3=A9 wrote:
>>> On Tue, Mar 08, 2022 at 12:15:04PM +0100, Jan Beulich wrote:
>>>> On 08.03.2022 11:12, Roger Pau Monn=C3=A9 wrote:
>>>>> On Mon, Mar 07, 2022 at 02:53:32PM +0100, Jan Beulich wrote:
>>>>>> @@ -179,6 +188,13 @@ SECTIONS
>>>>>>  #endif
>>>>>>  #endif
>>>>>> =20
>>>>>> +#ifndef EFI
>>>>>> +  /* Retain these just for the purpose of possible analysis tools. =
*/
>>>>>> +  DECL_SECTION(.note) {
>>>>>> +       *(.note.*)
>>>>>> +  } PHDR(note) PHDR(text)
>>>>>
>>>>> Wouldn't it be enough to place it in the note program header?
>>>>>
>>>>> The buildid note is already placed in .rodata, so any remaining notes
>>>>> don't need to be in a LOAD section?
>>>>
>>>> All the notes will be covered by the NOTE phdr. I had this much later
>>>> in the script originally, but then the NOTE phdr covered large parts o=
f
>>>> .init.*. Clearly that yields invalid notes, which analysis (or simple
>>>> dumping) tools wouldn't be happy about. We might be able to add 2nd
>>>> NOTE phdr, but mkelf32 assumes exactly 2 phdrs if it finds more than
>>>> one, so changes there would likely be needed then (which I'd like to
>>>> avoid for the moment). I'm also not sure in how far tools can be
>>>> expected to look for multiple NOTE phdrs ...
>>>
>>> But if we are adding a .note section now we might as well merge it
>>> with .note.gnu.build-id:
>>>
>>>   DECL_SECTION(.note) {
>>>        __note_gnu_build_id_start =3D .;
>>>        *(.note.gnu.build-id)
>>>        __note_gnu_build_id_end =3D .;
>>>        *(.note.*)
>>>   } PHDR(note) PHDR(text)
>>>
>>> And drop the .note.Xen section?
>>
>> In an ideal world we likely could, yes. But do we know for sure that
>> nothing recognizes the Xen notes by section name?
>=20
> Wouldn't that be wrong? In the elfnotes.h file it's clearly specified
> that Xen notes live in a PT_NOTE program header and have 'Xen' in the
> name field. There's no requirement of them being in any specific
> section.

True. But ELF also tells us to not go from section names (only), but
to consider type and attribute as well. Yet what do most tools do?

>> .note.gnu.build-id
>> cannot be folded in any event - see the rule for generating note.o,
>> to be used by xen.efi linking in certain cases.
>=20
> Right, so we need to keep the .note.gnu.build-id section, but we could
> likely fold .note.Xen into .note I think?
>=20
> Or at least add a comment to mention that we don't want to fold
> .note.Xen into .note in case there are tools that search for specific
> Xen notes to be contained in .note.Xen.

I can add such a comment, sure.

Jan


