Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A48653A9E8
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 17:25:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340546.565603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwQDt-0004Hy-6u; Wed, 01 Jun 2022 15:25:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340546.565603; Wed, 01 Jun 2022 15:25:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwQDt-0004Fg-3X; Wed, 01 Jun 2022 15:25:25 +0000
Received: by outflank-mailman (input) for mailman id 340546;
 Wed, 01 Jun 2022 15:25:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6G0=WI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwQDr-0004FW-AF
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 15:25:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d15c786-e1bf-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 17:25:21 +0200 (CEST)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-bZsnnTM7NK6qG3um41bGdw-1; Wed, 01 Jun 2022 17:25:19 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6308.eurprd04.prod.outlook.com (2603:10a6:208:140::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 15:25:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 15:25:18 +0000
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
X-Inumbo-ID: 0d15c786-e1bf-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654097121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MGsZoBdgp151vc6aXUlDeN+Yl9fJ6c2k1hn8B13mDa8=;
	b=QjnxywJLli/3oOD98i8xF5HBwRuofIVHuqz20GlGquhHa47LEJewlVFd3PDfKhj+T3t5Qe
	GPbv6W4ct1J1KPPV2p/3YzgPUmgpdzWq3ByppFOE2Ff2O8wsJG/hqhYvmolTFpCxZUyN+Z
	2Pf8obTJ8u91XbsPFmjgbDKLjYLLcxU=
X-MC-Unique: bZsnnTM7NK6qG3um41bGdw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HxR63S9uihjTZqJPJMXMhCJ8f6CDZOp0vpbi3hmJttsuXL4VWUzlMAmB3LU83rjXs2AUhP667ez0YLGqmxPKz+3Ai4oEkwe2vxU39NDxxFnJlkRd4z6xkJ+4QcZVsbb/ccWmiiE542N9oocck6m6UM1mmPe8w5c+jJe9k47SJHuHsEZcxRn0w3PElMf92yMpTXKds199f//h3BZL8PkJNov40bcINlu6fdYeyHhHbO+zHNwfJyHtTFtY3OdB182MvRRaDes5yyTgMGpeBQWhI1+6LGmKket0+VjbMUvMCupJFr4Kl1XbGovEHceEGE9Ok2v6y9yvVL2NkALN01RVZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7pV5/dPL0HhN5Oev5pVTgPjhTkLl94wRUUk6mIRZApg=;
 b=aUQhVBE9dzk5XpZoK8ipwB7A0qJzuFWm1OpkKcF0Vx3s2QI+Br/wz5xN7ZThmiJzh8T3p6u42FZ4W8nhsljyy4SgScSI0ZQy67rpasjqNyVYHe5GbmMNmxR26bzx1VLeoRTi5UekoIz50dnTmceSq/IsmMH8Jsq1/bwoOWWsWDfDwvc/wFUSxRh4z3A5jkwB04LnGten40QHs7hGFjPTVk0BD7fPOoUoepQhBkFmIzlPDBomPTBAK0Fdbga0l/Fxy520URBhiHun0ZOzeW7rEpk4GGYA+eLXjZSf0D1dL3im+Egd6REo9tOZ7mL9HvgaNipcV93nB8zv4X1B8NB0FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2014c9a1-1c38-b36b-160e-f79afcdc3a10@suse.com>
Date: Wed, 1 Jun 2022 17:25:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 03/15] IOMMU/x86: support freeing of pagetables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
 <614413d8-5043-f0e3-929b-f161fa89bb35@suse.com>
 <YpZBjVxRdJOzJzZx@Air-de-Roger>
 <372325ed-18b6-9329-901d-6596ce6e497d@suse.com>
 <YpcwOCBEzI+qvTga@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YpcwOCBEzI+qvTga@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a7c4b0a-d578-4440-a4d9-08da43e2ef12
X-MS-TrafficTypeDiagnostic: AM0PR04MB6308:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6308A60DDE7A7B4E48759BF7B3DF9@AM0PR04MB6308.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JthYy9AjR5g2wjgSfmPBOF/HU4HnXlMaCV4IpbA4ZQOj4S10BPMRp9j+GDpPnuL7MSwTtD0ShgMTQqlIXKMlE7s+iXXyyk1HRclrqb/2dJ5c0MnGZ+/hdlrC/kpEhuhSiLWptSH9Mq46yDHIGkVAJMomH78p6jHIjvTRaZAJwfLRzuEdrp7rPFY+0paRFmjHEkeAq9mhwaoxYPqbJUBcvJtxZH+h0BhoFQGe2spb9fOPEJftLLZUIcdxfMwy5s8d3mV8oXxZDZ2LQYIuyR8p3rFCr0hie0vWBAQqs2MefRfh5SiBbEz49jH52pu3CFGJ0L3bmqYWIloRAKhTpjMXTGFCTZFC6OkuMaG3/spOGdL0ATnPmN2nmwkTyWitux+vLqcdHHLaq3KelDGGQ2way6Xknt3MVd3PnasuJGauz7CDY72+3DBWIY3yvc82X6wCGCx52XeinDn3A5gSUK4UHLcBK4/nCVJTSdNurE5fp9Ut/ajTfy4Lbj3/+1VA8Yf2QzQqvvRxiKdxnVSDg+xfamO4Ru8vCMAJJh1GZ6ZVLkuYmPqkrkJFWsvFuj2dSBzxnQPyffSidfzuWMyqxM+/O5qaA9piG1gK9m+B5wmDdOglnvgvnzsGi8t8GwLyJfnjZ0G7RE7eFZEgW2IjbaglAyn3LYPJtftIf105Rc2+I/JhTcVdHue/dKeGCTYcwj8O7Jb3D/VfKQAirCZTk61Uu4io3x4e6/kHWVukTS/RbA+S/kGJHVuTpvxf/FXGIO/3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(6486002)(5660300002)(8936002)(36756003)(316002)(6916009)(54906003)(31696002)(66476007)(66556008)(66946007)(8676002)(4326008)(86362001)(83380400001)(6506007)(6512007)(2616005)(186003)(26005)(38100700002)(2906002)(31686004)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sEeHRMgTdtRyWnhFtoPi+NjrLhxVA0OqWl1hZikO/gHuMnryyLH7Nv6GljWy?=
 =?us-ascii?Q?BCCNV2aT/wOOwEPQm1MoIgGEQGqhkYWWnmjY5cj1CY8H4Yfqxnjyn085c6GA?=
 =?us-ascii?Q?+3IF2cl0Xsxv8mI19/6APfZA4bHnRabccvO0C87uJ76AtF4Xm1DiW96SmOnL?=
 =?us-ascii?Q?NSL87Ybbw/X8xa0pU386VVLERo373J6ExPogNyrnVUe2R7mIsMZQGBnvTefv?=
 =?us-ascii?Q?MCgXGFg+C92BY7nuEB0GT3aZlCxXjqIc1FrNdtJIcczxdH5UdH0osaaOr83H?=
 =?us-ascii?Q?FXR0oIZd/g7e7SdNgVjMkSk3SP8e7y3Bsd1B3AV3JVVp03zwpR+XDk8rtnJb?=
 =?us-ascii?Q?53xpndCJGV5AiDtumNv6C35VGOuwnUTo84vLKe0yaCE09aDQjNI39mS6KpdM?=
 =?us-ascii?Q?Xh48I1yuYaM6lR4u4i82NnEcVGMxTNLYCrFV/2t01V4KZapl3oKvfpS9+hMH?=
 =?us-ascii?Q?UgO+4u+jixHUnzRp8DMvZ+Qgahmidb7SZpjS4iB6qqL1rAjtvlm/Gbb/b9wi?=
 =?us-ascii?Q?WngqdDz6lTLqLoHQxGYdcWL2LnwsB9dvg5Gpre3hlbaW7jrA38oEFwuDJ/UP?=
 =?us-ascii?Q?fjxF0vEDsSlrRYVynGC2YnwY7u7E3uRzKfWjlze5w5E+UiMsKUFL7sFqtBQP?=
 =?us-ascii?Q?Ji5TmTmAvlV7KqgIH8L7fdJTBa6+RV5K5kzbTo4Nq50FpHwhfykNpeunIdcE?=
 =?us-ascii?Q?LchNcW+Wkfrhb5eyAH9vewZljr9eF4G3gwFl5SAlqODHYkr77OWzU6TzloWG?=
 =?us-ascii?Q?SZtPIkm0lhtQMqP6a8eK8tOv8+xVuIUMQlGMI/gytdU8efQLBEHNPlDAiKki?=
 =?us-ascii?Q?1wxO7OwrinsPf9eZtuGpp4Dj+zC4WTuoRmkZxLNGQm+NYOf/duTIR16MPklT?=
 =?us-ascii?Q?HuQFsYeyRt9RFOhIlObrZi86uhSOoXc4zcj4ZI2zB+FOphe3wvtF0V91J0+q?=
 =?us-ascii?Q?jxMVErqNoeCqt2au8O2OsRIXhaHQnviJOFCqbzayLCb5FA2zYN8E9za1BxVy?=
 =?us-ascii?Q?F7SORKMyKtNQcwGLDGL4RanuizVVtfNHrBkYHLSy+66JXMbz3wpTVZVFCDlV?=
 =?us-ascii?Q?8QIrKLxyCC34zHRskx4ZeM8OXAhfydqyEmYMy3A7cqYLJjmDpRMmKmVRYx5S?=
 =?us-ascii?Q?K9/8UXLxGoSQ5xP5XvtCI0zmy8CKF+2/GKFGEk23eiDhhs8NdBZVs7b+Mo90?=
 =?us-ascii?Q?nyo2CueZEkWwDmuE3j6e0GLmBSqBfJcmGUgwFgu9OeW2BmnntSP680OFs26w?=
 =?us-ascii?Q?s80UYWJbFXmhcVLNeHj6+cZZ1f5sBeQx7nAFT1t/qZDlLcK19kql5krfCB+v?=
 =?us-ascii?Q?RXhEfJXbl8/Y5KufcL6vHR8UJn7TwKdzaNe3T6CPgN3yG5kb4mv8D54emwyN?=
 =?us-ascii?Q?l8LpapDvx4BC6SeIPjeuPi3QXyBa8THWK0sk1SvOaQWmizpt/IyCsg0RFwoj?=
 =?us-ascii?Q?cYV2t+zkuXNuiwmVfSnDinqKACXp66a9a6/oBkm+R5IIDBR/HfLmKmzWQCfR?=
 =?us-ascii?Q?QAgyNMLPJGKM+7bXxO6gsd7MXx4fO3REwN1vjD9/L6Nd5pEDTLWQWkxLn4N+?=
 =?us-ascii?Q?1b4sUZ90x8b4HdVTOLwx3MlHkLjVmuzF9I551geFJDNvPUahiWdOxeWjWmAo?=
 =?us-ascii?Q?2wmV2slxkMQVipC3L0xWzFhkrRBOE/FQbI5WIUEvwmA9YCHzthetuWFQuEc6?=
 =?us-ascii?Q?Pu2l+vmhB1Y3DKYodbURy3YjtTQW1SoMQGWA+w+yjX4ARAzmWopIjqNLR8SS?=
 =?us-ascii?Q?fCtZUvnulw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a7c4b0a-d578-4440-a4d9-08da43e2ef12
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 15:25:18.0555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xs/KNftOG0abhiV0aEA2aO5wDCFVsu8ufYlcwe1p+4MSCJjXaff4vlkXnufXa7J7p51L2rTa5E4vG21OKVpBpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6308

On 01.06.2022 11:24, Roger Pau Monn=C3=A9 wrote:
> On Wed, Jun 01, 2022 at 09:32:44AM +0200, Jan Beulich wrote:
>> On 31.05.2022 18:25, Roger Pau Monn=C3=A9 wrote:
>>> On Fri, May 27, 2022 at 01:13:09PM +0200, Jan Beulich wrote:
>>>> @@ -566,6 +567,98 @@ struct page_info *iommu_alloc_pgtable(st
>>>>      return pg;
>>>>  }
>>>> =20
>>>> +/*
>>>> + * Intermediate page tables which get replaced by large pages may onl=
y be
>>>> + * freed after a suitable IOTLB flush. Hence such pages get queued on=
 a
>>>> + * per-CPU list, with a per-CPU tasklet processing the list on the as=
sumption
>>>> + * that the necessary IOTLB flush will have occurred by the time task=
lets get
>>>> + * to run. (List and tasklet being per-CPU has the benefit of accesse=
s not
>>>> + * requiring any locking.)
>>>> + */
>>>> +static DEFINE_PER_CPU(struct page_list_head, free_pgt_list);
>>>> +static DEFINE_PER_CPU(struct tasklet, free_pgt_tasklet);
>>>> +
>>>> +static void free_queued_pgtables(void *arg)
>>>> +{
>>>> +    struct page_list_head *list =3D arg;
>>>> +    struct page_info *pg;
>>>> +    unsigned int done =3D 0;
>>>> +
>>>> +    while ( (pg =3D page_list_remove_head(list)) )
>>>> +    {
>>>> +        free_domheap_page(pg);
>>>> +
>>>> +        /* Granularity of checking somewhat arbitrary. */
>>>> +        if ( !(++done & 0x1ff) )
>>>> +             process_pending_softirqs();
>>>
>>> Hm, I'm wondering whether we really want to process pending softirqs
>>> here.
>>>
>>> Such processing will prevent the watchdog from triggering, which we
>>> likely want in production builds.  OTOH in debug builds we should make
>>> sure that free_queued_pgtables() doesn't take longer than a watchdog
>>> window, or else it's likely to cause issues to guests scheduled on
>>> this same pCPU (and calling process_pending_softirqs() will just mask
>>> it).
>>
>> Doesn't this consideration apply to about every use of the function we
>> already have in the code base?
>=20
> Not really, at least when used by init code or by the debug key
> handlers.  This use is IMO different than what I would expect, as it's
> a guest triggered path that we believe do require such processing.
> Normally we would use continuations for such long going guest
> triggered operations.

So what do you suggest I do? Putting the call inside #ifndef CONFIG_DEBUG
is not a good option imo. Re-scheduling the tasklet wouldn't help, aiui
(it would still run again right away). Moving the work to another CPU so
this one can do other things isn't very good either - what if other CPUs
are similarly busy? Remains making things more complicated here by
involving a timer, the handler of which would re-schedule the tasklet. I
have to admit I don't like that very much either. The more that the
use of process_pending_softirqs() is "just in case" here anyway - if lots
of page tables were to be queued, I'd expect the queuing entity to be
preempted before a rather large pile could accumulate.

Maybe I could make iommu_queue_free_pgtable() return non-void, to instruct
the caller to bubble up a preemption notification once a certain number
of pages have been queued for freeing. This might end up intrusive ...

Jan


