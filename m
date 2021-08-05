Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECF33E0E93
	for <lists+xen-devel@lfdr.de>; Thu,  5 Aug 2021 08:53:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164141.300367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBXFW-0000Pu-LR; Thu, 05 Aug 2021 06:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164141.300367; Thu, 05 Aug 2021 06:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBXFW-0000NF-Hg; Thu, 05 Aug 2021 06:53:02 +0000
Received: by outflank-mailman (input) for mailman id 164141;
 Thu, 05 Aug 2021 06:53:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1FJ0=M4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mBXFV-0000N9-8Q
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 06:53:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c54d6ad6-f5b9-11eb-9bc1-12813bfff9fa;
 Thu, 05 Aug 2021 06:53:00 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2052.outbound.protection.outlook.com [104.47.8.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-oQMfnNTZNc-iSDA62YymAw-1;
 Thu, 05 Aug 2021 08:52:58 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6671.eurprd04.prod.outlook.com (2603:10a6:803:11f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Thu, 5 Aug
 2021 06:52:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4373.027; Thu, 5 Aug 2021
 06:52:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P195CA0024.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Thu, 5 Aug 2021 06:52:55 +0000
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
X-Inumbo-ID: c54d6ad6-f5b9-11eb-9bc1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628146379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X1LthYVrTs1QfFC9opXUv+JRiamFAUKS1QSFS2ubh+I=;
	b=dtznnGwMh7wWAt56S78S/z365cE9Eh3IaMbOGlGi8dn25GwwRUAXH8XiN0d8L/Or0ggfcB
	O8Bs9AF/jVWjGeyeDsgn2h35ckKoHiI6upyY17CCv4oY1F3BU2RKaLaV5suMiHhF1uRFuE
	fP25tXoSQHFqXMtWdDuPqRL6BMKl5UA=
X-MC-Unique: oQMfnNTZNc-iSDA62YymAw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpxqPqoMQNbxJcbYyH3Kc7H/NC7KUWroJjI6t5b28rUb4q9KKtqnj8uuK5cIiGuSSMXnlyszHBalfqjGaP25qZC1nFi+77p+0schRO4YVsFrjeLke378yKGlvigfh6YLJlPmHQGx3JQ5bXM1DkXnbLUacsdcDCwVoaalgj/wAMjSQW1LWgZiTa0ptJBaZtl5KFmbnnh6pevhLZNC+jKSvoaURfMQyvAw6iPbz3IIxfmJCROMA86FvQXj4uH1oE9r1virDCylNEAT/bb4Y7MfSBWzxePOQFE1Oh/lkIy4c7Uu3FBXPOSK5RUGMC+IrBa+1dTib5m8ZDtuwhWpbHgGmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1LthYVrTs1QfFC9opXUv+JRiamFAUKS1QSFS2ubh+I=;
 b=Jt64Acz31mXTT49wHliqUX0htO4eS04/DV9rMb5XX6gkOI4VL9CneFU0l47ir1LBwJOO8vVCE2JuCoABZ7MOJ8Pnwcs45z/3FMdavbjqChxRYtuy4Vy1Z3MWh98N/EFDs0ldWKMcxoHyWVtiOwiApJUO7x+0jtxz3fOHa9DiBzar9iS1nzilfGMzeFpTWNFU19guhJ32WlnSAKMsVCjpRgtL+VDz0JYVAhS874hh/E+LkWcIhI0I+Zj3AJydkqJpqjmvb+pku82vB3p2nySkd+Lri/T28w4rbIetzCfV3O/ad0f3zZyNXzB131Vjxsn4tp0EigXgSZ+Dxe8TxRydQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH V4 08/10] xen/arm: introduce acquire_staticmem_pages and
 acquire_domstatic_pages
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20210728102758.3269446-1-penny.zheng@arm.com>
 <20210728102758.3269446-9-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d1c65fd4-13f3-ad26-a13f-21f3f3f48e66@suse.com>
Date: Thu, 5 Aug 2021 08:52:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210728102758.3269446-9-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P195CA0024.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f43e4be0-ce08-4cb7-c778-08d957dda779
X-MS-TrafficTypeDiagnostic: VE1PR04MB6671:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6671BF12CD826978A6FB1B8CB3F29@VE1PR04MB6671.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hTY5lpflfR6o/lRcybsbeQd8tjXKtM2sK6VSkKryi8N9DuzKzSVMcP4I36jRV/QPo2LsMjl6phgllls04VAIrvFWPJ9v8DDY+YxnVatFfe/KOJm7It0YU1/uVFB4FNbJ0u3g7sG0HsgUUlH5dZuHHapj5cMi3fyNxZ0EACysMHwnxt8gVuhK9R9LxsXUluAhkZlNYxS4usfW+0eg9FJlR9YSv7E+5/RUSpTB7OxUu5zkoRjkLayHu4MusGoU9pA/AXt0oklEwr+cK3gO4ZsKzVlzwkqrZVtqlvZMpxbavNPjUUvdD+gZcsBlWuQWDJebs0VVi8ndAYRgOdWLQcb7DB8DJKdB6DIuANbPWErtHo6ToKAC/KWY+EjclCKNBn1/xT+LZJSX+RKq4eJzdTaBpsFw7VwwfYimO4RahFtxM/pfWlhlpEV4XXIM94Egxxj3DZhMydUMGSFSC2Xp6s6ml9Rf9IkjMfXwGbIANOGpmGanC9s/MJENBVWeRdcFrcXCGh5VhSBAuLVxj9uTBRnGe2lTSIJ+1hZufXWFwslOx3LTiA8Uv3sluzc2YVrjJA20my5FSKAV5GZqUYE4XOiXPH4vdFXExqmdUVD/1VPdoVU+puYb+XN8rc56AHgsQmZXFBx+9Oh6oqlKPQMuWc4jUUIHNMoGbSaU8V+NMS2wE/zGEonHdSyBOaVgJYNcHz1o61XTSvGSeitQHYjjJ0pJB7Xv8uDNby39ISScfJd+Slk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(39860400002)(376002)(136003)(396003)(5660300002)(8676002)(66476007)(8936002)(186003)(6916009)(66946007)(83380400001)(66556008)(38100700002)(4326008)(26005)(2906002)(2616005)(31686004)(956004)(36756003)(53546011)(478600001)(16576012)(86362001)(31696002)(6486002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFk1KzZaNVRUdFR6K3gzYTVpMWorcjM4Y3NqWU9MM2VJQjQ0SEpmYWNOK2M1?=
 =?utf-8?B?WVJLcHlFWmpPNVZXaUdKMlNBNUhtZlM4K21MMC8vR0xWZU5Rd1hzRG5CdjF2?=
 =?utf-8?B?Qnl6QXlQdHNNTzliS1Q5bjJRZ2EyZlpUdkJPNjl3VXc0cGx2dGhvdHFSZXE5?=
 =?utf-8?B?U1M2aFVtbG5veHVCL1ovejN4MGJCbW9DVkJ0L2tKM3BGRG9MYUZpWE9qamxU?=
 =?utf-8?B?cnF3ZUtDU0dYa0hVTUo3eHV2b0o0ekFPSnJUUS84UnJ1S0hrakY1eFlHeW5B?=
 =?utf-8?B?SWJMWjUyRnBPVzRLNlhLZXNWdTQ1bmUwV3NhNkZHMW1PQ3NzSDBMOS9UNkFn?=
 =?utf-8?B?NG9JTGc2Tzh6ZTVJVUdiZjJVOXlaeTdxUlRSNGN3STJtdmY1bTUzRW9PaHpq?=
 =?utf-8?B?VFpweUpOT01rRDJ0ZXdlN3BHV1dBRStBclFVZ3VTb0tvazdlc1hBM1ZQTWNu?=
 =?utf-8?B?c0dpNVZib21zNS93QUVkbnNuRWdnVmFNYUZtT1Izby9naDFMR3plZnBsc0o1?=
 =?utf-8?B?Rno0aWhJaWlVT0phV1BobC9UZ0JSQkxuWnlQTnpCOXNqZGtaK00xUzk0NDMz?=
 =?utf-8?B?QzM4WGJNU2NDRDNkbUk2eERQcVhrRXFqV3p0QTBLNStTcHQ3ZWJ6bFVOZzl6?=
 =?utf-8?B?NFp6TmgzbXRDNjZ0SkRjcElpRkN6QU1lQmZ1SkladStSdU5sUWhQTklGYTF2?=
 =?utf-8?B?MEZxakUyMVVVMENta0pDVUxGdStleUFtWk1BQzNRK3d0eSt2WlZxWXpZMzdp?=
 =?utf-8?B?dE1TSUs4bVNzSlpsd0REdFdTcGgwdExCb3A0eUpEbDUwS2pSbFVxdG1NT2Fn?=
 =?utf-8?B?cVQ4RGxJcGV3RDJSYklZZXUyQjRlTUxkbWs3SlRHdEFEZW1ZV3ZqQ2FHbis2?=
 =?utf-8?B?STc1WDJuY0V3UnVPWVdpVldBUDZpSXliemlHOWYwU1B4ZWpRMjJBQURUL3E1?=
 =?utf-8?B?MzI1bUJoK2tXQ0pJMk1Uc09jV08reS81ck8zdjUwZG0rWHJ4WWlYK0p5VVE1?=
 =?utf-8?B?VFFRWGhIajh6ZnA1bUxzTTVmR3dSZ2t0MWFHdzBhSlZkS2VZcjhnQ2NYNmov?=
 =?utf-8?B?MHpKSDM4QnEwZE8zdk1WTmNuRXMySmNVSE9WckYyVzJBaml4L0toYXBqdlVt?=
 =?utf-8?B?NVFqS2o0RUFic2x2T0RBK0l4V0RYVE1SdEl4WFdlZ25ucGJiWlZPNWJpRkdi?=
 =?utf-8?B?MUJKbWZGd2pncU1zeXRQWlBvNlVKcTdzc1BDWXpZckRDL2FLNEw1L1hRS0xQ?=
 =?utf-8?B?cU81QlZwcUlzbEUwT0VHR213MXFaTlpqU293eXhyb3g4RnFpTGdYNTFMT09R?=
 =?utf-8?B?QmJ1QnQyMUIvWEVzZTVXMUpSNGpOQW9vbzZZbFBPWWR0NWRjTGVnZ0Nkbmhs?=
 =?utf-8?B?Sm9xS09zTXpJN3N3ZVc1T0dFcThLaVdyNzBtUEd3MGZmd0hHa2d0anlZQkps?=
 =?utf-8?B?S1A1dkVlQi9SZFlValFzS0dIamVZZVVVKzY0NzRKUmZlRGM1L2M3a1FOTVln?=
 =?utf-8?B?LzdPWThyNWdEZ1VZN1FGN0MvT0tTZjdnQkpjRU56QS92RVF5b2xxdWlYRzVu?=
 =?utf-8?B?Nlc1Ymh1bENUNE54OERsU2FiS0FIQmhSZXhGV21NMEVKL2pDblhvTnZNd2dw?=
 =?utf-8?B?N0dsUFZrNlkzcWFEWDNpeUJqQXVwTkt2cU93eW5qeHB1SElRWXFxTWNOVTV2?=
 =?utf-8?B?SmRibnpvWndaZktXakdGR013M3c1blAvM1AyREk3Tm5sdU5DMVQwY2hMbWpK?=
 =?utf-8?Q?PueJA3DR3lgCktXQDT6P+NOv6jcnqAzxrb6pOot?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f43e4be0-ce08-4cb7-c778-08d957dda779
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 06:52:55.9490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IIoLKK8n+/JlngX0+rfBp4vrBOZ4sjJjK4e/B1PddYkIZfjGjmc5sfFy0sidqYJF4gE3CXK3Roi/sLxiFfq9NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6671

On 28.07.2021 12:27, Penny Zheng wrote:
> @@ -1065,6 +1069,73 @@ static struct page_info *alloc_heap_pages(
>      return pg;
>  }
>  
> +#ifdef CONFIG_STATIC_MEMORY
> +/*
> + * Acquire nr_mfns contiguous reserved pages, starting at #smfn, of
> + * static memory.
> + */
> +static struct page_info * __init acquire_staticmem_pages(unsigned long nr_mfns,
> +                                                         mfn_t smfn,
> +                                                         unsigned int memflags)
> +{
> +    bool need_tlbflush = false;
> +    uint32_t tlbflush_timestamp = 0;
> +    unsigned long i;
> +    struct page_info *pg;
> +
> +    /* For now, it only supports pre-configured static memory. */
> +    if ( !mfn_valid(smfn) || !nr_mfns )
> +        return NULL;
> +
> +    spin_lock(&heap_lock);
> +
> +    pg = mfn_to_page(smfn);

Nit: This can easily be done prior to acquiring the lock. And since PDX
compression causes this to be a non-trivial calculation, it is probably
better that way despite the compiler then being forced to use a non-
call-clobbered register to hold the variable (it might do so anyway,
but as it looks there currently is nothing actually requiring this).

> +    for ( i = 0; i < nr_mfns; i++ )
> +    {
> +        /*
> +         * Reference count must continuously be zero for free pages
> +         * of static memory(PGC_reserved).
> +         */
> +        if ( pg[i].count_info != (PGC_state_free | PGC_reserved) )
> +        {
> +            printk(XENLOG_ERR
> +                   "pg[%lu] Static MFN %"PRI_mfn" c=%#lx t=%#x\n",
> +                   i, mfn_x(page_to_mfn(pg + i)),

"mfn_x(smfn) + i" would cause less code to be generated, again due to
PDX compression making the transformation a non-trivial operation.

> +                   pg[i].count_info, pg[i].tlbflush_timestamp);
> +            BUG();
> +        }
> +
> +        if ( !(memflags & MEMF_no_tlbflush) )
> +            accumulate_tlbflush(&need_tlbflush, &pg[i],
> +                                &tlbflush_timestamp);
> +
> +        /*
> +         * Preserve flag PGC_reserved and change page state
> +         * to PGC_state_inuse.
> +         */
> +        pg[i].count_info = (PGC_reserved | PGC_state_inuse);

Nit: Parentheses aren't really needed here.

> @@ -2411,6 +2483,38 @@ struct page_info *alloc_domheap_pages(
>      return pg;
>  }
>  
> +#ifdef CONFIG_STATIC_MEMORY
> +/*
> + * Acquire nr_mfns contiguous pages, starting at #smfn, of static memory,
> + * then assign them to one specific domain #d.
> + */
> +struct page_info * __init acquire_domstatic_pages(struct domain *d,
> +                                                  unsigned long nr_mfns,
> +                                                  mfn_t smfn, unsigned int memflags)
> +{
> +    struct page_info *pg = NULL;

Unnecessary initializer.

> +    ASSERT(!in_irq());
> +
> +    pg = acquire_staticmem_pages(nr_mfns, smfn, memflags);
> +    if ( !pg )
> +        return NULL;
> +
> +    /*
> +     * MEMF_no_owner/MEMF_no_refcount cases are missing here because
> +     * right now, acquired static memory is only for guest RAM.
> +     */

I think you want to ASSERT() or otherwise check that the two flags are
clear. Whether you then still deem the comment appropriate in this
form is up to you, I guess. Otoh ...

> +    ASSERT(d);

... I'm less convinced that this ASSERT() is very useful. At the very
least if you use other than or more than ASSERT() for the checking
above, this one should follow suit. Perhaps altogether

    if ( !d || (memflags & (MEMF_no_owner | MEMF_no_refcount)) )
    {
        /*
         * Respective handling omitted here because right now
         * acquired static memory is only for guest RAM.
         */
        ASSERT_UNREACHABLE();
        return NULL;
    }

?

Jan


