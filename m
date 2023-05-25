Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0266710E79
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 16:40:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539648.840761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2C8i-00078x-DR; Thu, 25 May 2023 14:40:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539648.840761; Thu, 25 May 2023 14:40:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2C8i-00076U-8k; Thu, 25 May 2023 14:40:28 +0000
Received: by outflank-mailman (input) for mailman id 539648;
 Thu, 25 May 2023 14:40:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q2C8g-00076O-DI
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 14:40:26 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2051.outbound.protection.outlook.com [40.107.7.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15cd379c-fb0a-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 16:40:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GVXPR04MB9802.eurprd04.prod.outlook.com (2603:10a6:150:110::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 14:39:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 14:39:54 +0000
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
X-Inumbo-ID: 15cd379c-fb0a-11ed-b230-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QyvSfGat793pFeYC1aQElEm0tx+434NJKlA3OxBJaMnu2JHukG9jNd5DeIn/ZZmI1gdvgXTyDqyBoyaWV2B3dx39PLipiIobDHRLCGKzu9B78FfKFggV4wfKyTZOprLQM84xWxhzo07ZLHJDgp100S0zlU5ed0DBnBfTvumKy48eBDb+pd5F+Gcibapjm4QdD/1p/+hgVzkzj0iuj1TKt7+sljYlZF/0e0EYHhVN4mJVWND9IRm8EZYgIzMZG2O8yqsTTltxKM2OQCl2raW1ckU0erNAfAv8kruvmYfO1Sla/ACRs6jy7thDlt+4G0D4CLSuwiKZq53t+zQUxztUqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYNH3iEaPXt1PGD9HSjTtWX/XIVVJiQGo3QmL6Kn4+s=;
 b=ELC/6bnOts+J0QW22JfheEHQo6Ppt9RAicA8npsszRwNTu1gBEL9SVgoa2TSabiPn6FCRErGrLwzInIXhnA8c7E/b1ViPwumtK3B+lJvNuDhMS1YfhygUFNJXBiVdchiY1RN4tNlA0q0RY+SYwfNNLjpmJt+ZQyuCpvL02LE2VrfdB+DiwBH43sYjaGNvcIBUrL+f20041msrjqpx77o2qjPKi7cxmNhbWLBCRyjWZhg3v8ay8ZXepLcoyfManC74x81kxQEU8L/iyAPOVqWcI9QBw81w7yUlHhZPzSvMxdm7o+/cHIX47ciNPMvMX+UKB4n+xobrkzNk2T5xlGFAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYNH3iEaPXt1PGD9HSjTtWX/XIVVJiQGo3QmL6Kn4+s=;
 b=Jbl6HDKQgIB7omRnIr0ovR+SX97lkMFDT21U3vxPEYd4YaluFSxq+iBrMhcfRelUYv9nvVv9bzQV7CcxWbL+fV3pSVJ6qgTc+LSqyCq8G90PVBkcIt3TGx1KRTF9liB4cUuPQB+2Sv21zDLTPU1+3zHc6JFc5Tupx2OKAFqqBPv7SRWQtyj1VdZq3/IE/0tDtLS6SWg1LnXfGjah+CXxua1iO9kHE4nyvjGOg3JVzqOqe2ui3KSPjS8zbDmbRQh38V25a05ZwseQ4lxaQTsR/+eTWYMoDajC8Lryf0kdOAK4ALYcrD8uVp2kqHBLTwbmqUV6f9sYZk94faBqWE17bA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2b1b1744-2bc3-c7c0-a2d8-6aa6996d4af9@suse.com>
Date: Thu, 25 May 2023 16:39:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v2] vPCI: account for hidden devices
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <7294a70c-0089-e375-bb5a-bf9544d4f251@suse.com>
 <ZG4zx+TvUWTCEMh3@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZG4zx+TvUWTCEMh3@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GVXPR04MB9802:EE_
X-MS-Office365-Filtering-Correlation-Id: bee7947e-441a-411f-e46a-08db5d2de75a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nMWTPgwMj9GRj5MjvD3nTaj4BFgoX8g+wxq8ycRTYNdR3d/TzHaUCbpKdJcl4TtVKVd2iyTECRTvDVBR+D94dZbZDXcIFOTXoECbmWms0iszO1Yw+byz7g444Pa5s8UErO3gRMJXL1BfopIOeVLSsorHbj9a6V3oSsmukPcI5tPWyD8L4v0Dcn48RuOpWxqLGMPZRu9ymgEFq8sgFyRzf1yN4Zb+gx+T7SiDasDNqYOVeToYeskSUq+Bnm1QDRHAJAxFGwitED/r9lOGH9eRTlgg8Jnp7Q/gI0+wtjDC8vjhrV6xBX+3aTAoeYtOezt8IWm+hk9dmg9ZFaBvhw/EHviVvx7QBIsMFARH8JDyIglkjghZGoJ+u3l+VXdIQtRkRVybgzs9V1+UiUlbPIGEL2kJT66qCRsv7nbFbBBwlroBGeXBl8uwr8Tmcn/ABL+uG3cN1lZ30TL5T47XKzRbogjM0eCiBObttIRA264LpImw5gqgVFkreLFWfHCucMCbTbTsu6OTGcXwh74UFuKmoRRHGC9kQP433OL6q2DluCHgvpDtnOKgh6kDxEhvTTzZncFue+IxKkUz1LyOpoGJtHJg85l69/g/z47soI1Yt/MLibiq7oZW0rNcmpbouzhm3LI0PHfdZCJuwH/3oB6fKQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(136003)(39860400002)(346002)(366004)(451199021)(31686004)(31696002)(2906002)(6666004)(6512007)(66946007)(6506007)(26005)(41300700001)(15650500001)(54906003)(66556008)(4326008)(6916009)(478600001)(66476007)(53546011)(38100700002)(83380400001)(86362001)(186003)(2616005)(5660300002)(316002)(8676002)(36756003)(8936002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEZGM3RSVXMzQkNQS0o3SXozNWpOUk04YXlGTGVBWHNMTEFEb20zb3VuMHdo?=
 =?utf-8?B?cld2ZXJTM1VsZ1hjRWtZcEZMUGQ1NkhyNmF1em5jeXZQd3V5NXBNdUxHaHpU?=
 =?utf-8?B?alc3Z002ajVzL09sUFdwZUF6aVIxQkJ6RE50UkF3dC9DelpRdG5IY2VWV1NP?=
 =?utf-8?B?Zy9ac3h2dE1ubEdaQlM3Q05GNDZNamhRalY1UXNaUjBCRU5BNTNSRTRBWDJH?=
 =?utf-8?B?aW5Cei82YW0yNXppeVp4SzdnZllCWFYwT01pczQ0UTk4RW9QcEl4Qk5EREVt?=
 =?utf-8?B?anBlaUo1ZFYzOEVzWnd0T3JVbG9neitQOGFHNzhKUHMvbXFGT3R3bFRrNCtG?=
 =?utf-8?B?SEE4VnVnenR5aHhUY2lhMzJFd0JqaDk5N3ZkNGZmb3BseFlrWnE5QVpPbGpJ?=
 =?utf-8?B?d2VDVWtHbFJwWXVZUlpaTmRlaUR0b3JmeUQxYjgvMitVQU8yeXZYT3dXd3Vz?=
 =?utf-8?B?VzB4ZXZrRGNnS09XeEd5ZWpQRzJ1N05kekRjYmpKdzhSZGhGS3J5TjBObmdo?=
 =?utf-8?B?YXpUNUxac3Qxc3J3ajIyUzBEMFdvN0NGQjZFV0E4Y25sc0dvMkdaSlpXRk9J?=
 =?utf-8?B?Skw1VFlLWFc2ZVNHaUZVY1JBbnBnQ3BFb2JLL2xnZHVtd3R1ellrU1hnSkxi?=
 =?utf-8?B?MzhPY2FlNTlRL0g2N0JoeHRWODVoT29nZkkvUHhvY2QweVFQMTRPVUpoOG1x?=
 =?utf-8?B?Zk5WWC9rNk9vSTdGdzYyMjI3YkNZWHVlejh1bkExb2x2Uks0aGR1b212MEVv?=
 =?utf-8?B?T0hnNGIzQXcxampnODVoR1gyUFRYQW5VUnZsK0JReWlKUzJMaTQ0VHpkSktp?=
 =?utf-8?B?a1hXUU85ZFZEQ3JnMnlPL2puTDVhM3Q3RmxwWmZMNXMxYkdhd29ZSlBLNkNM?=
 =?utf-8?B?cUIrRW5Jem5EeGhGbDJjUHd2QVVjMGpwNjNjUVNreFVSYThsbWI3WlJsYU52?=
 =?utf-8?B?cjJEN0pOSEljL2huQ3hCQ1JYcWZkYzNnVVRXWHU1aFdPbVVCdkljam5reDFP?=
 =?utf-8?B?clFUbnFKaU1SdWFmSjA0K08vRmxnbWdYM1ZTM3ZyWHBTOFRrOHJzdzRoeVVV?=
 =?utf-8?B?TFdZVzNIZk9IRGVtVThHTitKbzh0RUdyamoreXlJaDVtT1R6QnlXd2JudU1T?=
 =?utf-8?B?enhLKzdBRTdMbThjeEhLcVZXcEpUT01xdjd3aWQ4QVlGSFhkbXhKQ0wrWVR2?=
 =?utf-8?B?WndrSUxoZTVGRmh5bzg2TEcyYlpLb042WU9kNE5kVlk3Z05NbnUzVStUTzdG?=
 =?utf-8?B?RTRBNXhOdkVHVG12YXp3cjZCY1lOUVdEZ1hreXRpanFHT1M1MXlmY1d3dnlh?=
 =?utf-8?B?Qkhxcmo2UXNta3dpRW9QdWthVnk4ZHJtUW5XZGJvaWsxa0FKOU5JOG9Qei94?=
 =?utf-8?B?ZHRRMmtMUUVyL1prbkZLTHZaSDVRZmVnbFhHQ3g3anpTNERISEc4V3NGWkdu?=
 =?utf-8?B?aTh1ZThnSkNXWklHQ1g0bllCZTJHMW84UFNGU3RMbWpBNmhjTExac01qWVBF?=
 =?utf-8?B?Q2tHQndSL2dxWXRIQWROWWN0YnpsVnVHTzl3NmxYbnJqcWlmRDZNV0pwVTB6?=
 =?utf-8?B?b1BvNkRIaFIvSUVLSWZZOUgwYzVnSmlvUDZGSnN2UU10UFllTUpaQVByMnAx?=
 =?utf-8?B?aFZmU05CcWdwRWx6T3dFbTFCNGZPOG01NDYwaEFaY1RKM3NuTlZzTXk4MWdL?=
 =?utf-8?B?T096VW9RNnFvam0yUVdRVEtxMXpYTXoxbU55UDU1UytYRlF6ZHZqTDhHRFBC?=
 =?utf-8?B?NTZiR2IyVXlaSTlUYWNFVWN0cHdzQWQybEVZY1doTTdmUS9jQytSa2NReC8v?=
 =?utf-8?B?NTNUQzJ3SlE4d2xRUVZYbjdqVlp3cHpwSUJtZnlic2ZYVFZUQTZOQzZ5SlBI?=
 =?utf-8?B?WXkvNnhVZVpvWTVGNUJ1NnVlUXNNTUo4RGdxR3VTTVBmMmQzdVkxL1VjdVVN?=
 =?utf-8?B?N05Wa25qZTVYTE1MbGJwWlRLYnRSYkp0Y3ZweERid2lXMWE5c0lNTVkza1ZX?=
 =?utf-8?B?SlNlR1k0ZHUrRmJmczBIMFdralFKLzZyR0lTRTFxdFpEWkpFb0JqWStnSm1Z?=
 =?utf-8?B?L3BRZ0F3VkZmK2hDYzc2TUo2S0lORXlxV3V2ZXA5eHdMblZzMUd0QnV4eDhu?=
 =?utf-8?Q?bGy5GJz4HGxY5MzcUkezosJpz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bee7947e-441a-411f-e46a-08db5d2de75a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 14:39:54.1657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cgqV7NbURMbHy0gf4YlNo3JNK/Kl5AcCcs8sq58bnOOoSxoxafJTGBz8eyHV8ShJzbhCINfre/f9ptMSF/BpBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9802

On 24.05.2023 17:56, Roger Pau Monné wrote:
> On Wed, May 24, 2023 at 03:45:58PM +0200, Jan Beulich wrote:
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -218,6 +218,7 @@ static int modify_bars(const struct pci_
>>      struct vpci_header *header = &pdev->vpci->header;
>>      struct rangeset *mem = rangeset_new(NULL, NULL, 0);
>>      struct pci_dev *tmp, *dev = NULL;
>> +    const struct domain *d;
>>      const struct vpci_msix *msix = pdev->vpci->msix;
>>      unsigned int i;
>>      int rc;
>> @@ -285,9 +286,11 @@ static int modify_bars(const struct pci_
>>  
>>      /*
>>       * Check for overlaps with other BARs. Note that only BARs that are
>> -     * currently mapped (enabled) are checked for overlaps.
>> +     * currently mapped (enabled) are checked for overlaps. Note also that
>> +     * for Dom0 we also need to include hidden, i.e. DomXEN's, devices.
>>       */
>> -    for_each_pdev ( pdev->domain, tmp )
>> +for ( d = pdev->domain; ; d = dom_xen ) {//todo
> 
> Looking at this again, I think this is slightly more complex, as during
> runtime dom0 will get here with pdev->domain == hardware_domain OR
> dom_xen, and hence you also need to account that devices that have
> pdev->domain == dom_xen need to iterate over devices that belong to
> the hardware_domain, ie:
> 
> for ( d = pdev->domain; ;
>       d = (pdev->domain == dom_xen) ? hardware_domain : dom_xen )

Right, something along these lines. To keep loop continuation expression
and exit condition simple, I'll probably prefer

for ( d = pdev->domain != dom_xen ? pdev->domain : hardware_domain;
      ; d = dom_xen )

> And we likely want to limit this to devices that belong to the
> hardware_domain or to dom_xen (in preparation for vPCI being used for
> domUs).

I'm afraid I don't understand this remark, though.

Jan

