Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8287940C578
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 14:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187562.336472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQUEx-0008BU-3s; Wed, 15 Sep 2021 12:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187562.336472; Wed, 15 Sep 2021 12:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQUEx-000888-0V; Wed, 15 Sep 2021 12:42:15 +0000
Received: by outflank-mailman (input) for mailman id 187562;
 Wed, 15 Sep 2021 12:42:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQUEv-000882-RZ
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 12:42:13 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58cf45ee-1622-11ec-b50d-12813bfff9fa;
 Wed, 15 Sep 2021 12:42:12 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-to2CDSwFO_m2MK3wGzJ1AA-1;
 Wed, 15 Sep 2021 14:42:10 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2448.eurprd04.prod.outlook.com (2603:10a6:800:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 12:42:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 12:42:08 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0027.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.9 via Frontend Transport; Wed, 15 Sep 2021 12:42:08 +0000
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
X-Inumbo-ID: 58cf45ee-1622-11ec-b50d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631709731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eR0V1NG0NMLIk9uijdWykWXvWlreOAGUhZ7ZSgPcfFY=;
	b=ceKjgrMRzWZXZQVt09n6SbsQ3362FaLBgCsqSykUr+G3fZGIdpp8ZETzrCKfuRh71glB6j
	7zPBFqYWtQDos9qAnbdmOfdf6PhAXK1Tx/CqMgFiQgcLrePmYQoI9fmKt28M/aobwdJ0q0
	SM+8hCqb/mrZUMTadn1c2JJuJEq1N34=
X-MC-Unique: to2CDSwFO_m2MK3wGzJ1AA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJStghtHSBspysOYcruAV3eqfNj85sH6F2ozjP3LwdQsD0+F3FI9hJIWlU0NfA/t22mHU5WKwPd56tODvB7aoDCzBilShkt6Rvi6q0BXPSf2ug9PUnKpxLKBRn7MpDjM7XBxrbXIueHUmRxoVkPzyjfn3AHL2iyBQ6Ca5Wsq1qZhxO9juCJrhtrm7K4jvU/HCYzhG6gj/7e2jJv4gHprxAFamPXLvOaepc89bvQiwBiv19dVYNwKE+PNM+YRFrGdP9aX8L6M9bSG3sK0Vj04fIP+qVPLqX8Ff926e2J6Yk2jb5blAzT0USuCai6kOcnqihksOO2gBzuJh9YOjgDDMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=eR0V1NG0NMLIk9uijdWykWXvWlreOAGUhZ7ZSgPcfFY=;
 b=l2cycB1TTsaWj9kUjiHZ1XI4l6+pG7Cu9xlRevQB6xAtW64c/2r1G8t+FUdvRDmOKm6jJSdcfnrPR1hi/veJYoAJQCHv9FTkVxP21yM5+P1peBvJj/Tr4BCXDfqpXkgOh7QiraDw5Paj82b4z8BPCV6n9SPRDoVRj8In4cicustBj3w61GbErObB1Ldpc37wptI/9PbpdfT6j9sIq2FqasMYzz2E/vLq9sCFjknjj7XmOgXENjyd1NwmqPSS7YAETd/OkPNcSCObmZT8Qn76r0sV5GKbMlO59VcJpMKQ+AC/AlZiYj8uiYu0Cf3sQVEXFfD+jMsuEyTOZus9DA/Mxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Ping: [PATCH 17/17] IOMMU/x86: drop pointless NULL checks
From: Jan Beulich <jbeulich@suse.com>
To: Kevin Tian <kevin.tian@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
 <25ad2429-df7d-95c6-ec70-4b23e6a023a2@suse.com>
Message-ID: <9fb1d554-8fcc-fc0c-2b0c-52756001d36d@suse.com>
Date: Wed, 15 Sep 2021 14:42:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <25ad2429-df7d-95c6-ec70-4b23e6a023a2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bf5ec3b-295b-4f72-aa2c-08d978463b29
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2448:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB24487D1D3105409D7347626EB3DB9@VI1PR0401MB2448.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cl9ildsgYYKtex/Oqtrbebt68Ed4ABHhf4708QsuSyMEG9aIY8S3i5wzsPnpjyiawGIvAczYMbJcBq73vz2f/QF5dVavE8udmdjnIhrKjtMtAW04+xi9LKorKhjCqt8pLwW70WrJvN6m0SMvlpAJCHslyjl/9qGVAJsEBhnhVdKdzAJbBh5OhZ32dvsyZUrSgQHLPlkLneJgu262RGME25PEfXYrRoYwzgc3tLNh3daA90ODShzljsq8F61HrVSPD6sRlqsyxuDW59q0JM1aKlLHFnUfCdq2sgDtvb/b/wDuAVhzHYZI/FBA0CKjiEGjhG0bgf2RNv+Tcbm5CpGxLiK3qySBLVr+tFtGDu4zRqasH50Gm2Nna4vVW0twMIf5d+nwjU0DWNhAC9EF+fjeHwD2Y8Atp4eMuyMrcW4UK67+ldiYUg/tEmOxEOGGuNOaMlpUgG6GT/IsgvVSH5i6TvlZqDMXeHhDbmYYxj07FfR6q0h3teN4oiEryux4W9GzFNB+orD55gIxFGhGLOSYmg3S3MKuWkIGSrEHTCLsdBYYJJ+f82QTXmotn935JBZywKcdkBd1xjlMABBjsNKvcr596+YTidP7Y91ff92/7TNeBPFAeONiyNXZqn8bN9UiUrUyC/nKJzGNar6sfyr/fkQCO2d7cDBqBdble43jBb+UylUCvFg3W05Wi+0abOgK1nEBxw2vMjs+5/WPfGbIaG0F1rMqpoTLNotHatnQEoU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(39860400002)(346002)(396003)(136003)(4326008)(2616005)(186003)(36756003)(66476007)(956004)(2906002)(54906003)(26005)(6486002)(31696002)(31686004)(316002)(16576012)(478600001)(8936002)(38100700002)(5660300002)(53546011)(66946007)(6916009)(8676002)(86362001)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1dBbHBUamlQMjhhNjBqa0x3cnlNWnVFOHVMOUgyZ0loQ0UzdjZ0U1FUWVY1?=
 =?utf-8?B?bnNDSEtQY2hZenZWUWhMZDhidkx3MStseW44SWlpSE5WcWRpdlFoVmcveDhL?=
 =?utf-8?B?WmJBL3NEcUxGYWdtQjhlK0I2L205Y0JRVDlPcGFCVXQ5aHBRVloyNVFsR1l4?=
 =?utf-8?B?RE1LeXdqYlBlUWk2cFpnMzNWdnZsWi9vb25xSllhaVQyK2JjNG1GVHRVcTZk?=
 =?utf-8?B?bUU4eVhIMlZ5eGlVdU9mMFJzaSttTGlVZjh2cExxazRwMXFNTmFFVy9talAz?=
 =?utf-8?B?TXR6akpkSWFFMXE2VlltSTBvbDdUdkdrN1QwcFhRMW0yUVROTSt5VWJTc2Y3?=
 =?utf-8?B?NjNHbDl3S0FESHUwWkp4dnZ3cXpFRk00MkxoeFJxWDFLRDVFYlZYMkdxMzU4?=
 =?utf-8?B?ZnpLckpUVy93NW1BVkVCTk9USlp2RTZpOHZybWZvVE9yei80c3dtUUUrT1dJ?=
 =?utf-8?B?YW53UmJOSHZYOWNiUHpXUDBFanl1YXJYLzlyU09aZk9DWndKTkNIVU9LTm10?=
 =?utf-8?B?UGE3NFUwbnlDdkpERGR6VVU3WWxwaXU1QXdYd1dLNkYwZ1V2S1B4eXp0VlNk?=
 =?utf-8?B?Z2pHNmd6SGdHZlNDbThQWi9GL0lEejJyd055MUNKYUFLSHlFRXREaVhla0hZ?=
 =?utf-8?B?YWpSRjg0WmdWZVllM1lVYWxJemxjN0I1eFZ1aE92cW15Q0pTM0JJeHhIOS9W?=
 =?utf-8?B?S05BVWtLZ1pzR25nZzl4MXRIQjVwNlA5ZmxCVWx1TEE0b1E3SFBscTRGNHd5?=
 =?utf-8?B?WVFselU1RUg2MGVvVHE1SE5MU2JNZWRUak5RL2IzOVgrQWgzR2pQR0hqdHl6?=
 =?utf-8?B?TmxoTGplUEhTaVJ6bFVnajhYRWtFdWNVR2p0dWFhb1RnSlNNeWFFR08vemNC?=
 =?utf-8?B?TmtyUHk3TE16WW1FN1MveFRvWkNobEVSeklpSUs4bzh3ODlXdm5VeEVvb2hL?=
 =?utf-8?B?UTdFNnBjNUJlRC95RlkwNnp4MGt2R0RnQnF6U2wzV1phTFdpcHpDTHhEUzFn?=
 =?utf-8?B?bEx6S3FuR0xSQ29JazhVTGIzbnAwRDNOYVdSMVZ5ZC9zek5DS1ZiVlFxS1cx?=
 =?utf-8?B?MXRSMkp4K1NxckJNcCtLK21OL2M2N2dkMlBUelNlRldsajIzNGRxRm1oUDFr?=
 =?utf-8?B?VDF1clJBbWh2NXlNaVBRdFpHcGkwNjdPeTRSeERXVFlVMWloUGhDY0twZ0p6?=
 =?utf-8?B?M2E4ZFh6dGFYdnBDN3RoTnJHZ3VxVnhDYWU0a0FnaUk2TVA5TU52TWd5Rlgr?=
 =?utf-8?B?S2MxQ2dlVlllc3I2eDJDaDJJRnNHaW5WN2I4eVdmZFJFR2VBcWVvdGF5MzBw?=
 =?utf-8?B?dVY2ZkFsblJJaVVZMC84Q0VPVm0wZlJQRi8ydzREckdVYW4vRGtXYkhFOWVq?=
 =?utf-8?B?RHhWOHZCUUFrazFzaEFLUncvUStZMFIrRTlKR1UvVXdQbHZnRzNETTllTkxR?=
 =?utf-8?B?bnI5a2RVMVd0MlBnODJIVG0wTDU0OUMyelZSeWZaR0t5UFlsQUUvTXdESVFW?=
 =?utf-8?B?d3FqZTZHUTNtRGxOTUpqalVkSkZIaWU2TEpSMkdOSjhrZ0gxamxUN0diMmdh?=
 =?utf-8?B?UExDaUIySGtnUE5DN2lBVnBvZTlmSGtHYndQakRYV20yUzVHSXhxRkZEM3Vv?=
 =?utf-8?B?TUJFOVMrNjQ1MTJRM05WNFRib25GUFJ1VzhHcHpHaDliOXJlM1d2NlR6cmlR?=
 =?utf-8?B?cUhsSzBZMnVRaklJSjhwd0hDczZwRnpmYmxqUGdnQ1lWL2p5MEV5czdFMGZF?=
 =?utf-8?Q?yVA74DwdhOvpcbHqa7LJeS+t9rfHQU0kOzpi1HD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf5ec3b-295b-4f72-aa2c-08d978463b29
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 12:42:08.6755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9u4HktpFU/HqsCpLCjkXHIOW4KQOf0xAaGntSf9bCTwKaPLdYA5Xt+TJfCjikcVZVCb+ldzIW2KnxLPIeOvBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2448

Kevin,

On 24.08.2021 16:27, Jan Beulich wrote:
> map_domain_page() et al never fail; no need to check their return values
> against NULL, and no need to carry dead printk()s.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

may I get an ack (or otherwise) on this patch please? Ideally also
for some other VT-d specific ones in this series? I'd really like
to get in at least some parts of this series, before submitting an
even larger v2.

Thanks, Jan

> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -530,12 +530,6 @@ static void amd_dump_page_table_level(st
>          return;
>  
>      table_vaddr = __map_domain_page(pg);
> -    if ( table_vaddr == NULL )
> -    {
> -        printk("AMD IOMMU failed to map domain page %"PRIpaddr"\n",
> -                page_to_maddr(pg));
> -        return;
> -    }
>  
>      for ( index = 0; index < PTE_PER_TABLE_SIZE; index++ )
>      {
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -2800,12 +2800,6 @@ static void vtd_dump_page_table_level(pa
>          return;
>  
>      pt_vaddr = map_vtd_domain_page(pt_maddr);
> -    if ( pt_vaddr == NULL )
> -    {
> -        printk(VTDPREFIX " failed to map domain page %"PRIpaddr"\n",
> -               pt_maddr);
> -        return;
> -    }
>  
>      next_level = level - 1;
>      for ( i = 0; i < PTE_NUM; i++ )
> --- a/xen/drivers/passthrough/vtd/utils.c
> +++ b/xen/drivers/passthrough/vtd/utils.c
> @@ -106,11 +106,6 @@ void print_vtd_entries(struct vtd_iommu
>      }
>  
>      root_entry = (struct root_entry *)map_vtd_domain_page(iommu->root_maddr);
> -    if ( root_entry == NULL )
> -    {
> -        printk("    root_entry == NULL\n");
> -        return;
> -    }
>  
>      printk("    root_entry[%02x] = %"PRIx64"\n", bus, root_entry[bus].val);
>      if ( !root_present(root_entry[bus]) )
> @@ -123,11 +118,6 @@ void print_vtd_entries(struct vtd_iommu
>      val = root_entry[bus].val;
>      unmap_vtd_domain_page(root_entry);
>      ctxt_entry = map_vtd_domain_page(val);
> -    if ( ctxt_entry == NULL )
> -    {
> -        printk("    ctxt_entry == NULL\n");
> -        return;
> -    }
>  
>      val = ctxt_entry[devfn].lo;
>      printk("    context[%02x] = %"PRIx64"_%"PRIx64"\n",
> @@ -151,11 +141,6 @@ void print_vtd_entries(struct vtd_iommu
>      do
>      {
>          l = map_vtd_domain_page(val);
> -        if ( l == NULL )
> -        {
> -            printk("    l%u == NULL\n", level);
> -            break;
> -        }
>          l_index = get_level_index(gmfn, level);
>          pte.val = l[l_index];
>          unmap_vtd_domain_page(l);
> 
> 


