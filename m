Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F5C415C30
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 12:47:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193667.344985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMGP-0006Vf-Qs; Thu, 23 Sep 2021 10:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193667.344985; Thu, 23 Sep 2021 10:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMGP-0006Sw-Mr; Thu, 23 Sep 2021 10:47:37 +0000
Received: by outflank-mailman (input) for mailman id 193667;
 Thu, 23 Sep 2021 10:47:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uzs+=ON=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTMGO-0006Ix-47
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 10:47:36 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a71e0192-1c5b-11ec-ba29-12813bfff9fa;
 Thu, 23 Sep 2021 10:47:32 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-6-aji_W9-9MweHJFIQ7iCnzQ-1; Thu, 23 Sep 2021 12:47:30 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4351.eurprd04.prod.outlook.com (2603:10a6:803:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 10:47:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Thu, 23 Sep 2021
 10:47:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0227.eurprd02.prod.outlook.com (2603:10a6:20b:28f::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Thu, 23 Sep 2021 10:47:27 +0000
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
X-Inumbo-ID: a71e0192-1c5b-11ec-ba29-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632394051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ynZOPV3oqoTxSvfyfMk4y35fb66QaVR9wjA/3b3zu0=;
	b=kFQZ0izESg1efd8p1HCPhHHQ8YZ5/Skry12TGLKqGP8VcC7tgQvSFAXYxq9SxzZiEAwE1d
	gLQjEtbMWx96dKSrqasLGoopUgGPHVnHecdonWuevzr8VDe9zN0XM/kx3MiYy9pNL0fZcO
	7m/7agZtaISe5d2bHMD0GtEDS2nfb14=
X-MC-Unique: aji_W9-9MweHJFIQ7iCnzQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjB8HT/PJvGCNegWBAIwBEmhMqH2HTha3ktr9PMo5a9Bv/3/qZL3YVUEfwiCCMSexi80iot9wiJvqbIK/BQNWrIdCEe+wCQw6td9tzWe++vjzEp96bzpWpWm60sakkiJIX19qzHHza7FbgUDJ7GonHfBr4HCYyHr5VhtvJXNBFrtIjHBRM/cKjfu5KH65QCsNPcwwCnVNTJ3lXbp+EIVCXb5CyHH7fyuQhJN2W/DNKBQDq/V8hcnu2kgFWTiwkY25pqlt8DkhDyTlQYzq7tsOobLY9QwE8+g3fzBmlrUz7dbEarGEA13V8to7h4B3yimkk4rhfcBgaTTGpsLsDr3DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=dWTt9Hzwf1WGDtN+3AbYodjdeBnm9iihDjOXU4Qg7/Q=;
 b=DomRDal7hziBIjgduZyZ/50onsKGcWBpcLQDTU4Yy24Mtds+9gykbZdJqHnB184qkcj6haeGc+T0qDuU70SqeSIbUeFbVg1KpjfIGEUrB8uMY4ch4aolx/6yiXwafgTiN+QkYV/Fm6FcRGMlfFBKcmKZpi/AfIjgOT4WbBZxIpTpVLiiVlfpIDg1E/6QqJ9tN89vQXj+j33N3ukGEH+xsyvkFCszocb6cWoZxo7pcgC0vreS1s92BP41BJ9j2NMNxIMSEle/jfBMoZH+Yh0wUdRfFeZSQOBilBN931u0IL5vSkJdUQozz6ZLQxCCedz896VW/sXqYxI53aBlLSmQmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v3 7/9] x86/PVH: actually show Dom0's stacks from debug
 key '0'
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <ca129fa5-7165-a9ef-4e57-75c43a708960@suse.com>
 <YUxXcrMiPDiGkdw9@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3b292c10-e346-4af0-1575-acdb060f0c41@suse.com>
Date: Thu, 23 Sep 2021 12:47:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YUxXcrMiPDiGkdw9@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR02CA0227.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77e334f4-4f06-47cc-fab1-08d97e7f8965
X-MS-TrafficTypeDiagnostic: VI1PR04MB4351:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43516685E41121EDDFB349C6B3A39@VI1PR04MB4351.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U6VoRI24exTj/wQNRdlP1EJxec9B0F/VYIfMyZ2fzH/qvNi4FkyWOUGAHSVXBe4Z99x1ydZhkSDlzliiNFxMVkp7AwxuzH6AV/Ue7V4aDvLqaMc+W/ceppnvF4/zcb32ITIaZzT/IgbYci9RpgiDuLuHo9+5q6yUS7ijSS6bK31y0y0B2Xky1YqsKdIwkt/ToVHOcnooDylj/bOtE5ngWDdKN1SMUvx15MOOFIroA52kjvC/5pSJlmL/vBtm3qRidK86+YUl+Z2++kgYUhMs6UzlBQ3dzUYIaSv/yEs+Se/6fPuy2hbln8+XhdruVosvxk8n9orv9Mgql6Qak8CdD0PFEbW/Jtdy77gkPuKZ4f5mUM+JV7jhxas76sx2MTYGOOaKMZ78y+nn2g31OL5vh9IheYGlLkaQPjbbKFMfnzdw7tJGzszEGvF2hPlKk20FdZBvJM6Q0QHoxmVK9PhFmrS0KiIJK2l/kuqpMnZTgNceWVD9oS8OCMKmTu6mLTS8iss6ZbFK2pjkTf9/9ZZU9Y553dQUvgYb+kEkTyn36/XOpIHrmYg9f81AVcErCFZJZUOiOhVC1+RFSZoDZDBbYIk3VlnVxuoCuYvXKSe3lZUs9F45kD/rJJacTyZ9rMISIngI4o4pj0nOWDjeP3vv6jKsgoNSH53Hq2/WiaYew94ZhJ4BGnnQlN/78pS9H+DKo/RvTdtBjZIOLOBBzq77WNjaGX2GadUza3YozU18684=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(86362001)(956004)(16576012)(508600001)(2616005)(6916009)(316002)(8936002)(4326008)(83380400001)(38100700002)(66946007)(31696002)(6486002)(31686004)(36756003)(53546011)(54906003)(26005)(66476007)(5660300002)(66556008)(186003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q5LoQPKmtsjQfviw8q6JQ849IbzI9blUBC8CGdAr2a//6B+EXgRCGjtBJJJu?=
 =?us-ascii?Q?awT6M85/PzlaSTkYVWxhYJy3kHQgGmBWhW56KvPYLZ3zwAXjliv+evAUs4k2?=
 =?us-ascii?Q?8MsDa1JbsHseX5VvodvUjDBvp+06fTeOrDe4d5s72TZKcee7zicR1l5TYDgd?=
 =?us-ascii?Q?ijAq3z8a689BndjgTDAlkB0V+ZZx9dBx8HQ9DvjhxwYVCAbOqC8nnkrXWtac?=
 =?us-ascii?Q?kJ1S7S49gQF/43gVW8VWiEo/eYrvxnrAMcyiwFebrf1Y+NoqLT+5fzKBp0qE?=
 =?us-ascii?Q?ou7jV3MIS6frfPTVil2l0k3NrMncZqR6TDuEKO57kc8ch1GMmFc4bqssrN2u?=
 =?us-ascii?Q?4gJ3sAad35gBqQ3UghDEr4mHpQhz11DuUGw9LRyCNMoXa8E3NBxKbHCwVYgG?=
 =?us-ascii?Q?ORbnqhZ61SEBsa1qIvKOnkaT4QzOPH43/nokAjBsUH9k65+UrLeCpf8FNhwF?=
 =?us-ascii?Q?wg/nt4xbFJHT1QdciD1iIpLk/sg1lFox84Hqe3i48eynrjcZfQ0ARlgrE2p/?=
 =?us-ascii?Q?ZdzquMV3YS0wQMW58mLljaf50bYLHeRGgrx//X+u6YVwX+Z3OjrGF8gD3Ggp?=
 =?us-ascii?Q?kI0fR6/D96xxQYsAuTlDCGC0Si2ckCIF6KmoVJayC/1vP8fLNIHsPTMls1eA?=
 =?us-ascii?Q?hTSeaMA2QZyYsG81SxMx3RoYqn1q14pq99n7PNYxRkALaSgomjpBZj1QskXy?=
 =?us-ascii?Q?Bw71LsJTp8ePxHT0NbOyLlB9l7cUL7ZpEwysLwA/VBuBDm+5otbAwkPL6eYZ?=
 =?us-ascii?Q?By9yQgPpE6MA4Ge6R/tfOhsvT37kglra+/2tACFoPRNzkK+Z9ZwrlqY6fxqt?=
 =?us-ascii?Q?2u13DNUPwEkpZMGLVE9iefyKPc2xojz1Rsgu3JQvj5ElhPHKWlTs1iKLPQxU?=
 =?us-ascii?Q?98dvwKPwK46nhR9h1yZwsrI3d2EtXcV4aXBucl5RL08Jw8yJZ+ZVrHOUD7Lt?=
 =?us-ascii?Q?WwNZnXTYHmWZgRiCPuwYU7i4Z5JsGP9VUOOEBd5AGJtXCZ39fNrwIYmcahpT?=
 =?us-ascii?Q?1bRwTc/qmAee7E7p5BEEo7JAzPCUITiZthhzJ7npg6NOuoE6uZJFS2h/rLLE?=
 =?us-ascii?Q?utFGI0k0/UCCdD419dDF4a/Jftw20X2fLyjOXxl+RKPCxQkfwfyDgs9IPtIi?=
 =?us-ascii?Q?U5J4nQ0IGspY7HKj5R6Wq501vIPTFVdQvKFQu1RqLOv2dBhW1/mhktwDaaCG?=
 =?us-ascii?Q?FUDmMkEUijwLDy/9lGtLKXgVJAlh6QaI3TGN+lJ8dBCkg034b+j2Ww/CMvav?=
 =?us-ascii?Q?4hEMAvg7Y/5X4YOR4NGnJjNvu+LjMmY7qw9tONYLREIlv5Ttc6vy1pD/sMds?=
 =?us-ascii?Q?yt5hp0/nfbazXhRypZvCVn9p?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77e334f4-4f06-47cc-fab1-08d97e7f8965
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 10:47:28.1413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2LVpZKxNFKzwNP3c25v6LTid2Mhtqf6kNhHXJ+ovj5ta8Ilk4tMsWn4g6R5j8J0ejPAhEZnegeJB5tes6G0sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4351

On 23.09.2021 12:31, Roger Pau Monn=C3=A9 wrote:
> On Tue, Sep 21, 2021 at 09:20:00AM +0200, Jan Beulich wrote:
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -3408,6 +3408,15 @@ enum hvm_translation_result hvm_copy_fro
>>                        PFEC_page_present | pfec, pfinfo);
>>  }
>> =20
>> +enum hvm_translation_result hvm_copy_from_vcpu_linear(
>> +    void *buf, unsigned long addr, unsigned int size, struct vcpu *v,
>> +    unsigned int pfec)
>=20
> Even if your current use case doesn't need it, would it be worth
> adding a pagefault_info_t parameter?

I'd prefer to add such parameters only once they become necessary.

>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -364,6 +364,71 @@ static void show_guest_stack(struct vcpu
>>      printk("\n");
>>  }
>> =20
>> +static void show_hvm_stack(struct vcpu *v, const struct cpu_user_regs *=
regs)
>> +{
>> +#ifdef CONFIG_HVM
>> +    unsigned long sp =3D regs->rsp, addr;
>> +    unsigned int i, bytes, words_per_line, pfec =3D PFEC_page_present;
>> +    struct segment_register ss, cs;
>> +
>> +    hvm_get_segment_register(v, x86_seg_ss, &ss);
>> +    hvm_get_segment_register(v, x86_seg_cs, &cs);
>> +
>> +    if ( hvm_long_mode_active(v) && cs.l )
>> +        i =3D 16, bytes =3D 8;
>> +    else
>> +    {
>> +        sp =3D ss.db ? (uint32_t)sp : (uint16_t)sp;
>> +        i =3D ss.db ? 8 : 4;
>> +        bytes =3D cs.db ? 4 : 2;
>> +    }
>> +
>> +    if ( bytes =3D=3D 8 || (ss.db && !ss.base) )
>> +        printk("Guest stack trace from sp=3D%0*lx:", i, sp);
>> +    else
>> +        printk("Guest stack trace from ss:sp=3D%04x:%0*lx:", ss.sel, i,=
 sp);
>> +
>> +    if ( !hvm_vcpu_virtual_to_linear(v, x86_seg_ss, &ss, sp, bytes,
>> +                                     hvm_access_read, &cs, &addr) )
>> +    {
>> +        printk(" Guest-inaccessible memory\n");
>> +        return;
>> +    }
>> +
>> +    if ( ss.dpl =3D=3D 3 )
>> +        pfec |=3D PFEC_user_mode;
>> +
>> +    words_per_line =3D stack_words_per_line * (sizeof(void *) / bytes);
>> +    for ( i =3D 0; i < debug_stack_lines * words_per_line; )
>> +    {
>> +        unsigned long val =3D 0;
>> +
>> +        if ( (addr ^ (addr + bytes - 1)) & PAGE_SIZE )
>> +            break;
>> +
>> +        if ( !(i++ % words_per_line) )
>> +            printk("\n  ");
>> +
>> +        if ( hvm_copy_from_vcpu_linear(&val, addr, bytes, v,
>> +                                       pfec) !=3D HVMTRANS_okay )
>=20
> I think I'm confused, but what about guests without paging enabled?
> Don't you need to use hvm_copy_from_guest_phys (likely transformed
> into hvm_copy_from_vcpu_phys)?

__hvm_copy() calls hvm_translate_get_page() telling it whether the
input is a linear or physical address. hvm_translate_get_page() will
use paging_gva_to_gfn() in this case. The HAP backing function
changes when the guest {en,dis}ables paging, while shadow code deals
with paging disabled by installing an identity mapping
(d->arch.paging.shadow.unpaged_pagetable) which it would then end up
(needlessly) walking.

It really is - afaict - intentional for callers to not have to deal
with the special case.

>> @@ -663,14 +728,22 @@ void vcpu_show_execution_state(struct vc
>>      }
>>  #endif
>> =20
>> -    /* Prevent interleaving of output. */
>> -    flags =3D console_lock_recursive_irqsave();
>> +    /*
>> +     * Prevent interleaving of output if possible. For HVM we can't do =
so, as
>> +     * the necessary P2M lookups involve locking, which has to occur wi=
th IRQs
>> +     * enabled.
>> +     */
>> +    if ( !is_hvm_vcpu(v) )
>> +        flags =3D console_lock_recursive_irqsave();
>> =20
>>      vcpu_show_registers(v);
>> -    if ( guest_kernel_mode(v, &v->arch.user_regs) )
>> +    if ( is_hvm_vcpu(v) )
>> +        show_hvm_stack(v, &v->arch.user_regs);
>=20
> Would it make sense to unlock in show_hvm_stack, and thus keep the
> printing of vcpu_show_registers locked even when in HVM context?

Perhaps not _in_, but before calling it, yet - why not.

> TBH I've never found the guest stack dump to be helpful for debugging
> purposes, but maybe others do.

I can't count how many times I did use the stack dumps of Dom0 to
actually pinpoint problems.

Jan


