Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8303F6065
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 16:29:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171530.313011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXQI-0006tF-B9; Tue, 24 Aug 2021 14:29:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171530.313011; Tue, 24 Aug 2021 14:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXQI-0006qU-79; Tue, 24 Aug 2021 14:29:06 +0000
Received: by outflank-mailman (input) for mailman id 171530;
 Tue, 24 Aug 2021 14:29:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIXQH-0006qK-2O
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 14:29:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f66f535d-4d29-4b6b-a630-bccc74d91914;
 Tue, 24 Aug 2021 14:29:04 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2058.outbound.protection.outlook.com [104.47.4.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-0UcqUhskP-aSz4trGnM9sA-2; Tue, 24 Aug 2021 16:29:01 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM8PR04MB7746.eurprd04.prod.outlook.com (2603:10a6:20b:235::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 14:29:01 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 14:29:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR01CA0118.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 14:29:01 +0000
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
X-Inumbo-ID: f66f535d-4d29-4b6b-a630-bccc74d91914
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629815343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=at8tJY4rlFeuURUMYSjVxXq1mLFE6bL+0bJrTSnVcZE=;
	b=AmbDiDfbJ0saxCR6Ebqpa2qkgHlQxK5lGrPfY9/yfjIYVMxMyL9N/v1hd6yGbhGGLgLI9k
	hY7gFq3I8idBNycTEQIYvD6J+0iL3JcIi0B8eyJ5epEcx6myWPRoLku5oI5suQEiXxNv2x
	YyKPG3z9Vr8TPO0go/ownsaTV3ZMz3Y=
X-MC-Unique: 0UcqUhskP-aSz4trGnM9sA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QgfyDVzT05d6tGWL6fAXUcwTYu3wbpDAJAtWvcyfnyDcq8qLsy891YKINQRCVhezS3L2LQy6AoT8SowRnO71FFqVArkpsQ+jfeWjEfd5eHQBj7M9RyBpoCKkwWHGRE5dbpaOa+iIxTvig/KsRd5RR4Nlg7WcMV1Mrr/N7/iRJmg1zakDFzKmfXJCuYGX5SYsM3dhnqtFkSbpIWVqzb8KaGSnVEOtARgK5XGX1j2jL0ybhcoJ+TVJZuxCA9jRg33HntMItSz0h9Ik1j0eF4250v5iLhyepkn6GTeiM2TOU7TY2rLa1jHuNomWt2hzIuwkZrhtlRnmk5Iq3HgkMPEKxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=at8tJY4rlFeuURUMYSjVxXq1mLFE6bL+0bJrTSnVcZE=;
 b=QVUyuUjD9YFouM90eS+rjGhZVSswpQ1ZRVdHco6Rkvk+xTr/kodnnEGYDmQAMXM769yPkxTKsIPSh/YVl3vI1/Cs/16eQ4gLRar3IaAqDxLCwZQv9l3mSLugQbZ/wQ2Exx0fUFkLlVOlrGc63ICM41o3j+56RvFKDAhpBJjeq+0WeQPXKbmIBeUFO+3mz81mMUvUv0L2j9tYPfFnzFi27fhnSGs4R8JjHyyGwtC+A4x3Q/+iC5VIJ8lEEPMPsU2nDkjX2YdayFRumYwjilt8D2FFgiCn7ZvfYaFmjnncrRj1e+VctX0qI6AfzgnVojrqBtUaR1NRteCDwjG2q6gW4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 15/17] IOMMU: page table dumping adjustments
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
 <d6b3d7e4-7ea0-387c-86d1-1fb3c59688fe@suse.com>
Message-ID: <666ce0fd-5bc1-f12c-4a13-93bf441a4ce4@suse.com>
Date: Tue, 24 Aug 2021 16:28:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d6b3d7e4-7ea0-387c-86d1-1fb3c59688fe@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0118.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::23) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d70c63ec-2eef-4da0-d4d7-08d9670b845c
X-MS-TrafficTypeDiagnostic: AM8PR04MB7746:
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB7746FE92BB40A56134A01DF3B3C59@AM8PR04MB7746.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZeMtO2tAdRVd3ORhBD3Pi51lJco+5HvmV5DyUjOK7Uh0qUaKi7bxjptCOGsxsv32hDgOdi8n4piiuPkx78ZKoCy49bELlvLitDZNC9QEjdMSJQcfd53cZzVOxr3Q3zIzEfkFrTvGU4XpKswx476BPmyKsoJoTnHTnmQ55YpCOkqP/PgbRRxQv7gGPuGt3l6JGqWcVElL7ImT1uVYzrQcm3bAPm0yuhmLvQ7KFttKBuTUyvbja9WIG/iBtaUILUpEjiZReQVy7mxSMZFrbfEyU7AmeRV3vUFLMXgolPA/paTqilgzA/7dRLderzmbipTk83KbYFEHrgciIeXgT5nssc5M5K3ymAHKwc3kTZhUcaywpu4fTe1wAcTyzR0SSH48fg0pMiitQPq6a7+wiGmePK7XQ9vhH/4elmt/gSuEAcxouhaLoZEs2OPT8FTdNCkHMjCeZnqq17z0EiqFHlH3yYZDxlIe6XMRHkirApDnvopHymxFeBiFaFXWg10Iwe+0goBaRf1bMylQt8LtYZBdD9mN89i9zJMptsDgaxOanjfSUPqIXxaCPIhsPNfMXUWd2bBojux8O5PrKvp2IJSFA1ZlNHUgAsOJsYvbrij2lq8VgZK8Ks5LEfP/Zfq7XDv6MkhEJ4QJtaQkWDIhhdgRszUD44EtAlqpqb1jomG5QZXJPnLPhF0KDKqJD6Xv/8OH1/+RmIqMjIHBAsItZtVRKw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(136003)(396003)(39860400002)(376002)(53546011)(186003)(2906002)(26005)(6486002)(2616005)(54906003)(86362001)(956004)(83380400001)(478600001)(66946007)(31686004)(8936002)(16576012)(8676002)(31696002)(6916009)(66476007)(4326008)(36756003)(5660300002)(316002)(66556008)(38100700002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2MxKytHTzVWMzBzL0pTQnNqSGQ5SmV2SmlVS3ZESXpuUCtVMHJBWXhrT0Fp?=
 =?utf-8?B?UmlKbVZSVmw0SkpKVERhSXh6dGVGajRiWlVjRFhVTjlaNHdabC96MWZsdHVT?=
 =?utf-8?B?d2ZzTXpvQTEzTS9ybGM5YnI2WXJLeFNYRUxuRXZZVFp2WUpWWWQ5RjR3TjNh?=
 =?utf-8?B?VG0rZzQvaVZNZ3hXaGw5UFZGQjRJR01tbTVHSVFzQ0l1cVFDb284MTZhcEtC?=
 =?utf-8?B?UUlBSmJEUmNDOXh0TDR4em52Q3B6WVpaL25kWURSaG9KVXhaZlFrZlA1Vmhh?=
 =?utf-8?B?RENFN0NVSnpaZUNEZXN2eHhaVDc0SmdlbnB6ZlUvQWRTMnFLL1FvYTVuWEE3?=
 =?utf-8?B?cmJjYWxLQkxLeVZjRk15RGJ0YlVyM1JzUlRIcUkvbTBlN0NWSkszeVpiSVJG?=
 =?utf-8?B?TWlTeHZIWTdPaGF5UGpaS1RXQVVyVnN4UXNUamJQeTVHR29ITjFlRERJR0wv?=
 =?utf-8?B?SkN3VnNhL0FOdU5hM0crakgvWkRnMGNrTFlURmtCT1VOY1VKYkVaRU90OGx4?=
 =?utf-8?B?RzJhZDRnYkhTNE5ScmkwM3JSaXcrQStIK2kwamwvblJIbW4xbkdCRERUYURl?=
 =?utf-8?B?VEg4NE84Q3RmMUtGckM2R2p5NGI4SDZJNFVha0JEUTVpN1p2a1k4N0ZXUmI3?=
 =?utf-8?B?aXF4SjFjaXV3VkFhZ2x3eWxTWTJyVVpUOFM2b0RCc3N4Z21aTG8rZEs4MU8r?=
 =?utf-8?B?bTZQcFFkTk5OaGE5T3BpTkRQWkJHQnQzblY0TmlZb2VPYTE3d3Z2Tm1zTThy?=
 =?utf-8?B?WklBQ0x3cTRHUjh1cFBGSVA4OXN3SG1LRzE1bUY5Zk91WTI0WkZtVCtFVTZP?=
 =?utf-8?B?V21KQ1JURDRKSGdRNGFyUElKakt6L00vM2V2VHBjWE9DbGRWc3FsdzFxQU9I?=
 =?utf-8?B?OUt2M1J4bVg0aUE1R3NTakRobWRJK1Y3MzRRSTJLdjh4OWo1QzFOZmdrcFRq?=
 =?utf-8?B?YWxheDFXb1Vtc3cyRCtpUkpCWEJZMSswWW05Vm9GWkhISzREUFQrM3haeThP?=
 =?utf-8?B?THgvZ1F2T211OHM3UUQ0TThYdW1wTjdkTWNuNDdSdW9QM0REZFNlTnp2aG1U?=
 =?utf-8?B?b2RCczUrQzd1TThzUFdoUXRtRHlIdHE1dHBoWTRuYVJudnllYXVGY21sSDVR?=
 =?utf-8?B?SVN5K215RCtqMU10K2piSXE3MHBLUUFYejZ2RE1ldWxVNmdObXJxN3Jyby9L?=
 =?utf-8?B?SlBzWS93TjhiTUVMbkE1N1hYNzhYQU9FTEhCQzAyNlV4aDJoc1QyeVlQYTB2?=
 =?utf-8?B?TU9QRjkrd0Z3UFZjeGR2bVBwOXJSeGxtRnpreGNTL1BYMndtTTVYYzZ5cDZZ?=
 =?utf-8?B?OG5FTE5iLzVRUlpaR1J2cDVNMkxGRnQ4QVFOUWtmUzZxNmtMcExJQldydDh3?=
 =?utf-8?B?YnBSckRuMUh0and2QkR5VTlTZlF6b3VTNFU1WHhmaVdnV0tVajdMbU5DOEZl?=
 =?utf-8?B?U0FOWTVpL1djZnQ1Y3NiYUV3RVV5dHhTUGcwUGZYK2E1YU9YY2YveTVHWEps?=
 =?utf-8?B?NU05NEthVlRTWmlUdnJRVi9Yc2d0UzJXU2M1NHFCbnB1SWFZVE1FN0VJUkk4?=
 =?utf-8?B?YnNpMDVmTTE4ejIxUzdXc01lSXEvazJqMkU0VGJoUnNqWG03bWtmTVY5cmx6?=
 =?utf-8?B?Y0p6ZnE2Qll0OFo1YTlaclU3SW9OUUZqM1dreUJ1WHgrSXAyMXNNRFRWSGtE?=
 =?utf-8?B?M1JyZWFUc2FjSXoxdnI0Q09CcVhITFFqUmVxWGxCWDcxMUNqVjFXODNZZUoz?=
 =?utf-8?Q?St64bn/fiBZ+cZt4VZSV26j9Y4InOx5kcVuD7L3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d70c63ec-2eef-4da0-d4d7-08d9670b845c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 14:29:01.3522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VtzolmNAKgYWWHxzt1iqWcNc38wVEypdrRTQNVBUnc/aq+kyEIePpsjMConUD4oz4f8dhl6oX6Tcj8HAbD/I1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7746

On 24.08.2021 16:26, Jan Beulich wrote:
> For one none of the three IOMMU implementations on Arm specify a dumping
> hook. Generalize VT-d's "don't dump shared page tables" to cover for
> this.
> 
> Further in the past I was told that on Arm in principle there could be
> multiple different IOMMUs, and hence different domains' platform_ops
> pointers could differ. Use each domain's ops for calling the dump hook.
> (In the long run all uses of iommu_get_ops() would likely need to
> disappear for this reason.)
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Should have Cc-ed Kevin on this one as well; now added.

Jan

> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -640,12 +640,9 @@ bool_t iommu_has_feature(struct domain *
>  static void iommu_dump_page_tables(unsigned char key)
>  {
>      struct domain *d;
> -    const struct iommu_ops *ops;
>  
>      ASSERT(iommu_enabled);
>  
> -    ops = iommu_get_ops();
> -
>      rcu_read_lock(&domlist_read_lock);
>  
>      for_each_domain(d)
> @@ -653,7 +650,13 @@ static void iommu_dump_page_tables(unsig
>          if ( is_hardware_domain(d) || !is_iommu_enabled(d) )
>              continue;
>  
> -        ops->dump_page_tables(d);
> +        if ( iommu_use_hap_pt(d) )
> +        {
> +            printk("%pd sharing page tables\n", d);
> +            continue;
> +        }
> +
> +        dom_iommu(d)->platform_ops->dump_page_tables(d);
>      }
>  
>      rcu_read_unlock(&domlist_read_lock);
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -2835,12 +2835,6 @@ static void vtd_dump_page_tables(struct
>  {
>      const struct domain_iommu *hd = dom_iommu(d);
>  
> -    if ( iommu_use_hap_pt(d) )
> -    {
> -        printk(VTDPREFIX " %pd sharing EPT table\n", d);
> -        return;
> -    }
> -
>      printk(VTDPREFIX" %pd table has %d levels\n", d,
>             agaw_to_level(hd->arch.vtd.agaw));
>      vtd_dump_page_table_level(hd->arch.vtd.pgd_maddr,
> 
> 


