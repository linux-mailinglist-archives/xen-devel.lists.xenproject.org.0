Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C873EDDE0
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 21:26:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167481.305707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFiF8-0006uQ-39; Mon, 16 Aug 2021 19:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167481.305707; Mon, 16 Aug 2021 19:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFiF7-0006s9-Vc; Mon, 16 Aug 2021 19:25:53 +0000
Received: by outflank-mailman (input) for mailman id 167481;
 Mon, 16 Aug 2021 19:25:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Flmd=NH=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mFiF5-0006s3-PT
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 19:25:51 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a90785a6-7a9c-42a9-965c-9a2effefb96c;
 Mon, 16 Aug 2021 19:25:50 +0000 (UTC)
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
X-Inumbo-ID: a90785a6-7a9c-42a9-965c-9a2effefb96c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629141950;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jzTvYbUCuZsC7Yr41B/1wQZPfZ8E4tcjpTbNrxHGfU8=;
  b=KIrIPkvYerCUiao++lH5eElt4oDqWwDExEZy6VzN6WCd75xj7xkHyN7+
   BDTzYULweQtbAE8tYdUmLMUN5BDHCzZ5Im+DQx8PPJGRRpcNN6tmALTMn
   yGQ9tOyazIz9D7Md6lU2bNnQ953Uc4BAMV+fGJ9jERqyELngPfQKc88Sk
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: mRVdNEgzFTb0UO/nl2MLCBvvC7cuSfcdTU0SS7da11bua5VJfu0Jb7PEdHsuq+Q0iHPd2zdXVp
 6tRRtMUZCmqTcZo9lAB8aRTEHfqmIpp1tBw+I2Y9HDBtI49ewS7QbhVuhZXYHjHY8bIxZ00ul7
 v6zBGyE3MPpeaMI73AWaLkoFF8jaSaKJLGJIyl+1dv5k9RRRCqrOatYCgKrEG5mZ6g3x6ICd+9
 i1vOzdaMMih7VKJQzXk7Sj0lrGQwAkZ5x27sqpL1aNg6abqnogMoyrsj6PvcZ5u9pGYJhXwcck
 E8ae0CG1Zs6tU7vysQq8j1zV
X-SBRS: 5.1
X-MesageID: 50576883
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:pSVE0q/Nj342pcdlCWNuk+AiI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHvJYVMqMk3I9uruBEDtex3hHP1OkOws1NWZLWrbUQKTRekP0WKL+Vbd8kbFh4xgPM
 lbEpSXCLfLfCVHZcSR2njFLz73quP3j5xBho3lvglQpRkBUdAG0+/gYDzraXGfQmN9dPwEPa
 vZ3OVrjRy6d08aa8yqb0N1JdQq97Xw5evbiQdtPW9e1DWz
X-IronPort-AV: E=Sophos;i="5.84,326,1620705600"; 
   d="scan'208";a="50576883"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPyFQ6aPCt/gSTw77Q/VbDkVxHi58M3ASkfnMGZCFsAXQbpm7qDZmqAeCJsTvLGdKWusrirTRilUvugwI+D1oporWRPFI660v++rPe1zuvDjy+/DWJatJsuPpLIwBjyTbIQx4CxYK178sjpaXlkokt9UhyICxN+hpvF6FJZyIScAIbWtMsslTLbDBrUKKsNkz4t+3sunag5cHj9TbbfwgfJWhmRl0tUuliVTxKgRKWr/P1JE45GQpVNaBu0alUzAcSccMtxN2KHHiXOkQhNTPyW/nqdrc2mK29IrQpwEFddfXotfl9enPMGy0hUPL1cLp6ZYsyGXUP1xk/7r5uxYkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3Y0Cyf/fLxod5qFC7RFXVKHndxprCsGWTyFr1qqzoo=;
 b=DBJnZHUR6ZRLb7eP90+kBqphvmnemAx20PQfknoBabCEWc/X8RRj9JtdnesP2ZCxUphIa5j4E9Wo0GCmYW9BWw3K5+GqLVHj86TIktNTxYtwD+Suw9zFG0bdeTv/R+IZB905W+2FVX8DahGwCPFGp6D1RWkzAJNcxGhIsqA5dpa0/bcWBSb4DrA7a0bplzRAnfKLRE13LPQALkORXQ+7Ivo9PIYyxCwxU1UqRihmQIwP8dES0apgFCw5PdzRyGTa74WhqmtKytaxRJ4Sc4RJCMrGaU4BByJStDySdpWlLZ1ba27WVwc6c1Md7SvR+1TmhJSn9BOdUZf1pmA3kKRbfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3Y0Cyf/fLxod5qFC7RFXVKHndxprCsGWTyFr1qqzoo=;
 b=Fw4fRiWHqWzeFjwbLhbnjOUUG1HPntRvECQT0DAW2OnUOn++dAqh6lhVZ9bB4D5BwQLIADXSMkb5uo8hDfqu+i5FjfkVKOGcmgvvzlHOnj1vlXwCOogLhpnyM8ISEHkdwHjq3RINE9QhV8DVqIKlP5MxTc4ivP4KQMG0KtpndpM=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <cbe46564-74ab-af38-7e31-2f0a3f46ab41@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/PV: assert page state in mark_pv_pt_pages_rdonly()
Message-ID: <d72d072f-d785-f90b-4e91-5ef7e8f17862@citrix.com>
Date: Mon, 16 Aug 2021 20:25:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <cbe46564-74ab-af38-7e31-2f0a3f46ab41@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0431.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5df713a5-afe6-47d5-8951-08d960eba545
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5567:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5567428A1E449D4912E88412BAFD9@SJ0PR03MB5567.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EK/UnhRwKwwos5APhAlJ65Pp8H0XI7KF5784Y6JzSrQRUD9q+0ISz/sZNxNWPzyoJpo1eWZpP6bQTySEecHDqAIcrIXvR60pa7Dkq36LWN9v45XXleZJcWqLC9AW0mcE5uCuaybQccX+ImquVCk8wuWziiHa3Vjn7aessrCgcoICAUlrlSWFtaTHenkiSUugA2mMoflQV5tNVLCv6X/kLynMQ+bWhRxoiolaZUXV8uYugRriNv4cQbfz++8PQVS9tmpXUgapzN2U4joDcOWlSmU/Y98iWAKRQg0Eoh29V6Vjdif/6g8XPB6BhNHQgGKE/DVCNNR1POcpN1iN8zcmrdr8rLtn/Lnr3IImGz4oDjaMKnt99umIBR4ac0IuwbGBFuQvzvuwUAA33KmmpcWLQPlYsVq21TQqr7O8JPjWwbsI98kbgC5AsaSLsVv9CVfXQEzHn7NZHP4fovYYvxy/vlQPT+6hPY40MnZVmTVRIZHq7c5ExSBdLoummtgDpXQc++Xm/0gIF/fs27YPrXMH5VUvEb0r3lRctqnpcn4JXPkZRgG0SdJIQOea0MhwCOVu/Xolsu1yYeaF8ZgZgDf4RLysq0bN6bsqTHnDXfv2ZvTjtQBoL+8/YyMUUIgSazkBd5Hq3NnhEX1pqL8jruAm4QNm+l/hmU7CtTwlK08dtYPRJAIOHNJH0iKWvoNCruIia+15BR/1Txfwy3gBjmamt3tsspcyvedxGBnZ3vf67SDJAlghyXYKHIwrGqLlyZqxh6ht7UcXpvNTyMrzCF3KBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(38100700002)(31686004)(6666004)(6486002)(8936002)(86362001)(316002)(478600001)(66946007)(66476007)(107886003)(66556008)(31696002)(36756003)(8676002)(956004)(110136005)(54906003)(53546011)(2616005)(83380400001)(186003)(4326008)(2906002)(16576012)(26005)(5660300002)(45980500001)(43740500002)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zm9hbGlTL1NXTkgxdEl6eXBZK3c1Szd3OEpLdnlEYzZnU2RIM3pHUWtsckx6?=
 =?utf-8?B?c0xxLzJXeXdHVy9hWDgrZEN2b0M5WnNXaFpETWgxYWJNZEU4VHdqVWpISVVW?=
 =?utf-8?B?SjI3R3NybVpYZGZrazFnaEJBWUVsUWhoUGhwUGVuRmNJM002VERSemJJaVlh?=
 =?utf-8?B?Q1ZOdFg2allLSnJhYjhDSDd0aFhTRWZobHRvTXg0cEpvZ3diemJ4eUl3VVFR?=
 =?utf-8?B?MUF5cUxRT2xyclZjUzZaRUhLaVk5UE9pWm95TGlTUUExdVVMQkZIaW1mUWdC?=
 =?utf-8?B?b0p2cllhVDgyb3FOU096dnI0akI0ZTZpdkVQVUQzREVsZTdLWVp5d2E0RTV6?=
 =?utf-8?B?SExDbG9vV2tIUnQreS9rSHJpZ01rU3BKanMwVDNMKzZyNGRTR3lnWURMNTRt?=
 =?utf-8?B?Szcvb2Z5WWlCZEw5KzBmZmx4U2tmZUJRT09BdmdlVlNPMVRPV2lZcVVJMkdO?=
 =?utf-8?B?L0MxSmhpVW1KbzBMRVRjZFBHY3BSQ3luTUt2NkcvaGpFQXg5V3ZWVTltREw1?=
 =?utf-8?B?MERDY21SeWdqeVVZOXhVTTdvdTUwUXFTenFlZFlxVDRXMEtweFpnLzhPMlNI?=
 =?utf-8?B?S1lQd3FQcTlTR0VJU0tBSnRCYXcwamRYMWtkR2F5eGtmNHh1bHF4QUZJSUZu?=
 =?utf-8?B?NlhneEJ1azFJOWw2Z1VsYkxiYWYxWk9DZlFoa01uMVRFRFRkUllQRlFxcEpu?=
 =?utf-8?B?Wm1nRGhucUJlYXRJdGdnSlRnYkdjbG1WZ3lHQ2RIS0Q5RlJMdmJrNzFveXY3?=
 =?utf-8?B?MFo3cURQK2VSTlVTcnJ3alZNL1k2RnRJK01NRjUvYTJjdjVuZ0kxOEd1NTl4?=
 =?utf-8?B?TXIvSWdvN1p4eGFwTDdVQVA4UUJKcWRGZk5ob0k2MjJEaVFPUnVkWm1jOEVy?=
 =?utf-8?B?ZWN2TU0zaEtuOHMyNks1WTVwSHFwUnNCWFdhcUdaN2NCWXdVVW5EOC9hUmlq?=
 =?utf-8?B?K3BFdnovTXUrZUVCK1hVa3dMZkFUVlVwYUQ1Z3hkYXkrV2Q3RGI5K24xL29M?=
 =?utf-8?B?a1QxOFUvUUs1bjY1RDNydHo4NjRvTUFCRkN5Q08ycmZhcjJCcnp5ZnpGRkpI?=
 =?utf-8?B?VWF6VW44SWVDY0M4K3ZDYWdsVTdOQ0gvdzgxUTh5K3JOanpoYzhFa0UzVGxR?=
 =?utf-8?B?UFNMN3h2UlN2WVJwZnVZQkNGSFRLc2NoRXY1enJxWi9sRmU5SGgyYU9HMFV3?=
 =?utf-8?B?SCs3RFpoSGNqeENLTjF6TXY4amE1ZGdDMVdjTmNaNS9JL0JucEg1QW5FZGFy?=
 =?utf-8?B?M0FZTWNHN1d3Y2JvUitOL2ZObWVyR1hOMXRLeUR5MGlJUVdzZEhvTGNuVG04?=
 =?utf-8?B?V3ArVWRGdWF2NkE3YUVacENCWUxRUUpzRjFoNXFFb3dOUzl1dTVadlpuQldR?=
 =?utf-8?B?QStocEtzNHRqN0hHL3dHV256emM3UlZOUmxWNGZtWEJ3cklHNjBLUFBwNXN1?=
 =?utf-8?B?L2R3ZmZ4SWtVbk9xSWl6SHc4dDJ1MnFYOVk0dVdkSEVUQ0gvVHZ4dHcwdlpC?=
 =?utf-8?B?SDZ0eUFBK3ZOK21lVldMcm9pcVRuY3pPNmUzUnRDZmlvd1ozejQyM3lwNndy?=
 =?utf-8?B?QkVxS3ZzTE91ajB4NCtranhXL1RCWFpxaWV5aXcwSmY1b0oxdDZhOUIvTG45?=
 =?utf-8?B?U0VOeHozM3RwaVpaK3I4OXVTYmxVeTBsNlZaKzFkMmZlamprTnBOK21ZalJH?=
 =?utf-8?B?ZEhRZWR1YVhjQTBtNkZyUktpcjJ5NTIwckpMVUdaQXVHRmdUelZaYmNPbzdy?=
 =?utf-8?Q?PpnoDbWOfR27+87GkF9kUk/gEWDrmSgFJV/wTj7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5df713a5-afe6-47d5-8951-08d960eba545
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 19:25:46.9356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: npEuppJ3rSPHZ33IeSTfp8/ymCH2PIhpb9dpDo1BjRUnw7+aPHwGTgMMY0M6goA5zShcA0wBWOSWDs0bIBq71cB5WyEPdH+OrdrHijRrJhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5567
X-OriginatorOrg: citrix.com

On 16/08/2021 16:29, Jan Beulich wrote:
> About every time I look at dom0_construct_pv()'s "calculation" of
> nr_pt_pages I question (myself) whether the result is precise or merely
> an upper bound. I think it is meant to be precise, but I think we would
> be better off having some checking in place. Hence add ASSERT()s to
> verify that
> - all pages have a valid L1...Ln (currently L4) page table type and
> - no other bits are set, in particular the type refcount is still zero.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> There are (at least) two factors supporting my uncertainty about the
> "calculation" being precise: The loop starting from 2 (which clearly is
> too small for a possible result)

2 was the correct absolute minimum for 2-level guests.

XTF kernels don't exceed the 2M boundary (at least, not currently), so
they can be mapped with only 3 or 4 pagetables, except:

* 3-level guests are created with 4 L2's for no obvious reason.=C2=A0 This =
is
nothing to do with legacy PAE paging, nor with how a typical Linux/BSD
kernel works.=C2=A0 The requirement to make 3-level guests work (and even
then, only under 32bit Xen) is to create a PGT_pae_xen_l2 if not already
covered by the other mappings.=C2=A0 Any non-toy kernel discards these
pagetables in favour of its own idea of pagetables.

* v_end is rounded up to 4MB.

Most XTF guests will operate entirely happily in a few hundred kb of
space, and the same will be true of other microservices.=C2=A0 The rounding
up of memory might be helpful for the traditional big VMs case, but it
isn't correct or useful for other usecases.

> and an apparently wrong comment stating
> that not only v_end but also v_start would be superpage aligned

Which comment?=C2=A0 The only one I see about 4M has nothing to do with
superpages.

>  (in fact
> v_end is 4MiB aligned, which is the superpage size only on long
> abandoned [by us] non-PAE x86-32).

Tangentially, that code needs some serious work to use ROUNDUP/DOWN
macros for clarity.

>
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -59,6 +59,10 @@ static __init void mark_pv_pt_pages_rdon
>          l1e_remove_flags(*pl1e, _PAGE_RW);
>          page =3D mfn_to_page(l1e_get_mfn(*pl1e));
> =20
> +        ASSERT(page->u.inuse.type_info & PGT_type_mask);
> +        ASSERT((page->u.inuse.type_info & PGT_type_mask) <=3D PGT_root_p=
age_table);

This is an obfuscated

ASSERT((page->u.inuse.type_info & PGT_type_mask) >=3D PGT_l1_page_table &&
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (page->u.inuse.type_info & PGT_type_ma=
sk) <=3D PGT_root_page_table);

and

> +        ASSERT(!(page->u.inuse.type_info & ~PGT_type_mask));

this has no context.

At a bare minimum, you need a comment stating what properties we're
looking for, so anyone suffering an assertion failure has some clue as
to what may have gone wrong.

~Andrew


