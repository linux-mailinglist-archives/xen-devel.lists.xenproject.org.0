Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD5E539E3A
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 09:33:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340279.565281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwIqb-0003Gw-Dj; Wed, 01 Jun 2022 07:32:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340279.565281; Wed, 01 Jun 2022 07:32:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwIqb-0003Di-AU; Wed, 01 Jun 2022 07:32:53 +0000
Received: by outflank-mailman (input) for mailman id 340279;
 Wed, 01 Jun 2022 07:32:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6G0=WI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwIqa-0003Da-2w
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 07:32:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ab55379-e17d-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 09:32:51 +0200 (CEST)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2169.outbound.protection.outlook.com [104.47.51.169]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-43-htjD7aovM9u5tpDSzeowog-1; Wed, 01 Jun 2022 09:32:48 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4202.eurprd04.prod.outlook.com (2603:10a6:5:25::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 07:32:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 07:32:46 +0000
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
X-Inumbo-ID: 0ab55379-e17d-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654068770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eq+SXhEEWyZlcv8g0wbjQAiNce1U/8ZrVCoKA72CPjI=;
	b=QRXvDQW9T9R4Uju6jMPCEp5+XF0c4cs7NXsIF4CqaC1DzxIHbufnn2m0rXimElHktR1EaU
	135qRQN8taaR/OVhLxZGKcxhH2GRSZDf8MWe2MhtFWKJEnwaGPlLDDc673E1HIr3xJ9Iz3
	qSKfZiff367GVk3Cqu1fBLUENVEQ9OU=
X-MC-Unique: htjD7aovM9u5tpDSzeowog-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y7oovN/VM8jEsbRYPDHXRaZ4ps5UU37B4YGWuqLFb5gQ4rTL2wQ+4rRA2IH9bu+mtrDg1egorJFXGDdGFS7jmmcliBgThruXMLGb72sKpBX+3DRsUPiKfaLOCBfPtNjnfDcydiN3R/s7Jiq0jRbrT80w3qjgE2Mze9U4iyym398H2M/zPfpateYAxRO23G6dDz1sCK59KfAeCxp+11zt1rbc4lokmiUkZTXwDNexLHnCZHo6N9eskRpc9QgGilFG/spFOV5x/d4sU7zTYe4DLolbh9hUVhYvplZiL5JRHfUUXbLruYdV7VeCwm+u0A+1PW4Uep2TKDL80DKdhTStNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICqHSupe+g2orTcf3YUEr+7It+/wynk6o0K/KG5vsyY=;
 b=CFU4XCHVwOvffLkFmRSH+OjnPDahLuoE/c7ITUMD8f1gcazkpQDKVYo1dHpqtI4eUhQIBpMJmniCiUKCewdt5MzMrPl91TfVhvTKaWf+h4RpS+O7SDX4R4+xFHjP/vLlLNb2MdjjYLelq21I2YWBtm928WHvTgoMaO8OPWlwri+XlQnMAdOhEmDPHM0weCnaZUavVO8ILt5YrX45a0gHrsWbECPacUrtYFLE9jnnoMMluQwhmwf98hkuugJGzSOymtuMcPBh2xYaKUT1sEVKQoku3rFPIufJnRkDGgmnd2N59nGKgiVYfgBCA0PjDBql122xw2io773wmZOxmpTsuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <372325ed-18b6-9329-901d-6596ce6e497d@suse.com>
Date: Wed, 1 Jun 2022 09:32:44 +0200
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YpZBjVxRdJOzJzZx@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR08CA0040.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37a20e7c-3c50-4a2b-1b6b-08da43a0ec38
X-MS-TrafficTypeDiagnostic: DB7PR04MB4202:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB4202CC3EB72B8288AF0FFEE7B3DF9@DB7PR04MB4202.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zKoPMvDX0kMCfexNc+LZgzV6IoC/vvWpGFj2W1jfscUZanxNRXgGaKtN3eJWgRMn8YLGh8bN+Zo2P5EK14xZA7PKeeqfNW00sHjX/thQMWA54Yi8WiyQ36/jLlznmjuidXJML3qABl7RJCKiLEziFRYcOHYK+8n6lg7JV61xM5tsjqqMAcRTjoxPWLUATW+MY30bMHBJ+3MvmApAKBvlW35JYksY2R1KllX6AZzNkDu7ieEByJ0OCBVUiHSvGFkzlwhmP9aFF+txkXcR7I9uaZOlMD6g0Nyzej/aAFuHo4SrXGRkbuKQ+XKYV/OoOLlU3qNyxenJZXxgOWhS8u9Vi+PMKTKtYtRYCTyNURLczRAjcHcj72OwLMdbO/fOY9IJy228s0ibv9r7tUNjGx0yX44xTbTTaTHypx37bnf1AlOw9dqN91/OWJpmc/AWyl7kq9Fb9ovTh6OaR88R7mUmLT/ilp8jmGVX+8+GqG245vtGfLgQboEMEkr5q+3uO9+Ew3LGHtiNiSCry5mzZBhrCZxExAEVWgi+wbRyYuICeRkhylMa1lahot14nbap0/NbhPyk8u+lzl073XjJbkYx/Y2f7BZaed133W4NZ/dH1ALrXnXR8TLUZF4Ql3mzkXtSoneP/wSXhMmAxOEb7vl53eyZ+t/2MhBwFLyEYpiUpVsj6vbE75QAJbsz3zbWuG8m1iM+iL9utfYYg5fsorX/uP0zjEy3scxSbg7BSkRZeBMhxvKgnzL/0/N6P6NIUjLk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(53546011)(26005)(6506007)(31696002)(86362001)(2906002)(4326008)(66556008)(54906003)(36756003)(38100700002)(8676002)(66476007)(6916009)(316002)(66946007)(31686004)(186003)(6512007)(83380400001)(8936002)(508600001)(5660300002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K/ieQd2W4NlQf+xu5BgquYfBL+uxwimblHcaMcTBAe7HMENLPnPyHKa8xo9K?=
 =?us-ascii?Q?1R7uafNdbKgCQWciXjEQbbixm5ToZ3rq6GZOKGXc2sTFWjI1cgPlBgC3O+sy?=
 =?us-ascii?Q?881uaUK+tdMzZZVBwcglT9wywPPrBOxyiHEd852BcFbnkdvQGPQLZ+SxlpzG?=
 =?us-ascii?Q?z5LjDWpIrU6BVG1Ei3aaWf3EXIk0oq+GPYu9Ar385INDAJGCnJqASOFyV7c6?=
 =?us-ascii?Q?IyCq5EDiWCHEyZcRJOYdAfrjjJRwbsAxvKAiw5zBwckathWs5Anodjs3vgkZ?=
 =?us-ascii?Q?MQr8X4CYPOxxTqY0KNcTJLnPaqZhlcMJpudMTjjVHWCcZeb91sOS3k3FsnK5?=
 =?us-ascii?Q?8hT7XqKnh32COzkQ97PNk9H2igukG950ehZy4TlUkxkMHJUvfrg1YjBGlUqR?=
 =?us-ascii?Q?5jJ9Lul4bS1hvhOkEy6UY/A6aPR7TlNEsKxV/hidYzEtDT8nhv+s5IWKRNw9?=
 =?us-ascii?Q?2hmDNDlqo7V4SD7UOdhLGdT2ja0hoXG877g6D+2N0Ru/rhy5L9kvE8bvveQK?=
 =?us-ascii?Q?kuzP/ScBQMexLm59svKfRRWttqq9/QyrezaeNm4uHF4JxnutE0YXY3DCmYVY?=
 =?us-ascii?Q?SBdth7TGozghNCJqDXX+FD3QhP2PK+BZiMG2o33nGUy/sa3S/KoBRVAvq16Z?=
 =?us-ascii?Q?a6n7Q4ONAuczNi8tBMSCh5bVEhaBWxY0vS4375nAYm569zjG14sBiVtBnQJP?=
 =?us-ascii?Q?wmuOLSpElDUpvAhzx7b42ob4KBF538Z138HS3DG2DnhWt15HiZ5yYc1jVBXW?=
 =?us-ascii?Q?bsYW2H4Q4W3OerF7rIOQbIu6UJNZPWA5rbCfT2necaILC/FAXJJDYQTlXjXD?=
 =?us-ascii?Q?nkUkGxU6iZs2n84tF0NjPI6LdoNvIM9jkmiRDKVmC9IN4s95KgQljI1pd8bM?=
 =?us-ascii?Q?2VHjFIcB5010z8JUwA5c4Ts7UfmRXkpYboH5XVLExsYlTDQAYlQapPtyEco+?=
 =?us-ascii?Q?HaWrSeAEVds2RCGe9KwD1+NiogXcnmebQhWLZsslURu2Q17qOGDWK/0aVAaa?=
 =?us-ascii?Q?R6SYZS+As4YD4ULOfzBNUB/wDWvKuAtHxSoR9ztQcrGu+fSfif74EGOBoDDv?=
 =?us-ascii?Q?aOZfnUYcUMcFLZJJ0AXsVO6NokZaDSes63pFQ5sIcz2mqXdRD0r0smebTJdO?=
 =?us-ascii?Q?yxRipeUwQ4PLnUUFrzxTCTkYoUfxOmp3k/CMCz4iFWxx4SsdC4FXyMIKf1DB?=
 =?us-ascii?Q?n1eyNOutPIwx8ib/t1Tl8mpbphqa8FafPgNKKNdXpG/xpvm5qta1mDw9WRUv?=
 =?us-ascii?Q?sb5V659Vb5lHJu5Ef3FyNo+sAnBYEh2sCs3zYfFgiEH0LjoJwE/UaFiwLSLc?=
 =?us-ascii?Q?75QoqdO6YZ0NH/bJvB7uogw1eD3X8yJfAW8GUA6DKyUuyhVFAUTWPyKHv5Pg?=
 =?us-ascii?Q?bUdE0HAGZhi3vq0XyGSzzM0by6kRevVrtcx4rt6qj8HAbMTby1+9NaxAstmA?=
 =?us-ascii?Q?0rwpw8W/g64/hIxcCmBHUC9Os+1Nzsc26gIb6j2qc9FHBDfa41BwE2FBYclm?=
 =?us-ascii?Q?YLaXIjtgWgc+HtoGkbdTIveCa5XSBROWBrz572vIJ/3q5hmb5vwdtOMS7dMo?=
 =?us-ascii?Q?ext2iTgTKaAHETrmISg4qTjFAUaboAiw67P2NOebHbhPK1xh77Kgm8XWxm7V?=
 =?us-ascii?Q?F3VMizbXMEO1CwBTtFLM+ZgCxndrfJiZEprfm9+Yk9pmFakcV0LKArnR+BA3?=
 =?us-ascii?Q?/UrVF8mrkSmEE2R96/2KfblvTAGGbJLgp47mvKTx7WvRqZnyccGCBago3950?=
 =?us-ascii?Q?ciTx2W43Jw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37a20e7c-3c50-4a2b-1b6b-08da43a0ec38
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 07:32:46.4524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ViwfPFnVp1rRPot7wXDIqhxy/ld7QxwLjTb1y4RNbWiL+2EVfxYtdAdIs5ArR/gh5nQERysZ6n3fT6vZnuEqew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4202

On 31.05.2022 18:25, Roger Pau Monn=C3=A9 wrote:
> On Fri, May 27, 2022 at 01:13:09PM +0200, Jan Beulich wrote:
>> @@ -566,6 +567,98 @@ struct page_info *iommu_alloc_pgtable(st
>>      return pg;
>>  }
>> =20
>> +/*
>> + * Intermediate page tables which get replaced by large pages may only =
be
>> + * freed after a suitable IOTLB flush. Hence such pages get queued on a
>> + * per-CPU list, with a per-CPU tasklet processing the list on the assu=
mption
>> + * that the necessary IOTLB flush will have occurred by the time taskle=
ts get
>> + * to run. (List and tasklet being per-CPU has the benefit of accesses =
not
>> + * requiring any locking.)
>> + */
>> +static DEFINE_PER_CPU(struct page_list_head, free_pgt_list);
>> +static DEFINE_PER_CPU(struct tasklet, free_pgt_tasklet);
>> +
>> +static void free_queued_pgtables(void *arg)
>> +{
>> +    struct page_list_head *list =3D arg;
>> +    struct page_info *pg;
>> +    unsigned int done =3D 0;
>> +
>> +    while ( (pg =3D page_list_remove_head(list)) )
>> +    {
>> +        free_domheap_page(pg);
>> +
>> +        /* Granularity of checking somewhat arbitrary. */
>> +        if ( !(++done & 0x1ff) )
>> +             process_pending_softirqs();
>=20
> Hm, I'm wondering whether we really want to process pending softirqs
> here.
>=20
> Such processing will prevent the watchdog from triggering, which we
> likely want in production builds.  OTOH in debug builds we should make
> sure that free_queued_pgtables() doesn't take longer than a watchdog
> window, or else it's likely to cause issues to guests scheduled on
> this same pCPU (and calling process_pending_softirqs() will just mask
> it).

Doesn't this consideration apply to about every use of the function we
already have in the code base?

Jan


