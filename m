Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A93470EDCA
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 08:19:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538762.838969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1hpY-00042i-Cv; Wed, 24 May 2023 06:18:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538762.838969; Wed, 24 May 2023 06:18:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1hpY-00040z-9U; Wed, 24 May 2023 06:18:40 +0000
Received: by outflank-mailman (input) for mailman id 538762;
 Wed, 24 May 2023 06:18:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1hpW-00040d-Ab
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 06:18:38 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce3eeb4b-f9fa-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 08:18:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7003.eurprd04.prod.outlook.com (2603:10a6:10:11d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 06:18:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Wed, 24 May 2023
 06:18:29 +0000
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
X-Inumbo-ID: ce3eeb4b-f9fa-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lh+70nPIjVjc/Zos+2dHkU+gWQyMXRZieV8Dq6LqIfjoeSshnbPPkpYAkSgL10iAQf9Cc4quw1yivdEtuzeZgfcDVUWq6wsCXsR45lWqdp0BWqexPYLfvU8LFejzM5nwzNMP2Bx1Zd+W+b3KEJ0bmxKVSajzHOL4bj4CO3L8NdXrtJnX5n2QJ+6gGHKrkZmgICL1BN6hbzld8+1rNT7qRzP4dUlcy4C8boywrAbTY/zOSD3DA3qQ/IStR9jk2OkaYHfpFV9vos2Ofe+eMqi8238Y0QMUDHQNh0CtY0L5L0YmuauFsHyg1EPvTpHh+GOsFWZ1YjUlUWkCCrhjGh0g/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDFKoE0fgUN+7hn7eXW8vi+a5SEBcycZlbKOC8fa38Q=;
 b=iEkj7JjPa13rsrgB4WqE9MstoL2BKJ854se7WTJFHGoXLM3gG4ZScBOPxnaYBozYjOvrlueFXqVkaNN2uwtjHcTr3YdY4bDqRcvo/akG5tjk9VOhDz+4tPBYJn8YYcQfa6anZMJApLhF27SBX5QD8KGiKjIPDfnHbfiAVhSVi6/f0lIVSIwzpaZSmnep2RgxXYb3IBzGCGwKrDFxQVb/+EfOSGEuqFWXGNZ/WsTTglZjwfrhZQuP/bwERDobP5WOhX6OGJDqYKHoTpJghHjd+w1BHWsxMx5ma+MPr4GQ74quSHbpyxn7eJl5FyniF9PZvE7Z+7YntzvBmjUOLaO2sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDFKoE0fgUN+7hn7eXW8vi+a5SEBcycZlbKOC8fa38Q=;
 b=RyczAYtK52/sHFnQgm2oy4r6rWtLKtxwFqQYPysUulHOPltmIkuYyDpvoEkYdfKmfcmYI5CjETETcdbedGWDOT+qZdEkNUdZR493+tpnOaHeKeJD+4YCn4hnlLPOA+pY6Jm8FkJeVH6u+O3Tb4D/g2rwUGUAR8JU49jI6w+B4qCsZqyLrrwLUR2hT9eSzFsuFpAbdL2dtF/KjlFmrxfgBkWYlpjBGo+XuyHy7QHpAY84C6UkkqegIZvB5vd7zsj9SM2NIfz8eaN7dZ7n/PTXUpqPjcdAY+KPTk2YQ0wBdeeL/vhn5SZ8ZA4W+pMT4rNJFfI3SuuRAAIFHTvRbPEqNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f0ec68a2-bfd9-22e8-39a8-24ba9a7505ca@suse.com>
Date: Wed, 24 May 2023 08:18:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: PVH Dom0 related UART failure
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org,
 marmarek@invisiblethingslab.com, xenia.ragiadakou@amd.com,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <alpine.DEB.2.22.394.2305171745450.128889@ubuntu-linux-20-04-desktop>
 <ZGX/Pvgy3+onJOJZ@Air-de-Roger>
 <alpine.DEB.2.22.394.2305181748280.128889@ubuntu-linux-20-04-desktop>
 <ZGcu7EWW1cuNjwDA@Air-de-Roger>
 <alpine.DEB.2.22.394.2305191641010.815658@ubuntu-linux-20-04-desktop>
 <ZGig68UTddfEwR6P@Air-de-Roger>
 <alpine.DEB.2.22.394.2305221520350.1553709@ubuntu-linux-20-04-desktop>
 <818859a6-883a-81c0-1222-84c62ada3200@suse.com>
 <alpine.DEB.2.22.394.2305231756500.44000@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2305231756500.44000@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0194.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7003:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d3c94d2-2b8b-4839-8f44-08db5c1eb129
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e2iTKhO1jGngs+afrwaSxe8HkeurECyvE0H8cfC9lkhTISV6ryh+nAiOv7cVKPXjEf6IktXCVYMlK+MGu4rAPuL5y51MywgLKgQ6RRrVuNaWpmCQ4TTJCUrrcRYxvxZRPeXS9MJ8N47v0sIGg3f2wx2c1a9/KjXftfxaQbM2a3RHTMBHoHVY3iB7ZZPKykf9vGnlMD44l3GS5PYyGSaQjC0EulQgQQ8Ocklpxo5xKvm8bIdDHnHZEU5l/WeK9y17dqZOMWXLv41UCnvyMAz7BI/kDuYpR0UAmKAdz/aOIXNamf62BR71WT6EvB2VBeGDLBjqJsh5uOrQU07RGkAnKZvzOTQECIubxKLS0v7Z7rD5g/sA+HvhNf2uN3bqombbI8dyGtMD/tynIRlOtCV5qAkAmkSwlqu45+CO9c8XP+kZR6/zyQSq4v8CCKRycma3v9g5npIFXB0009C3zoAR/FOZbJTm/OMmxpibTevO1i310src7Jx0LpeUXwDGnTOClOpCKd5aHjohUEmcjSlvU6sWOUT/JaPqQtr9EPNHwJj6f4iWRCieY/TVnpGhhXAdJIjDHgfVNypt8w0xKgxZfALRnQLnF2G9KErPhAiEddLQtj7NDkn3wK3H2STfEUulLYtovahyGuX9qsnYBzGaQCoTYS+jg/ScQe8znTU3wMDk24UZpc3cV7mWC3t4LhOt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(396003)(346002)(39860400002)(366004)(451199021)(31686004)(31696002)(2906002)(966005)(26005)(6506007)(6512007)(6486002)(41300700001)(6916009)(4326008)(66476007)(66556008)(478600001)(66946007)(38100700002)(83380400001)(53546011)(86362001)(2616005)(186003)(5660300002)(316002)(36756003)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHhYb1FvVHM5OWZ4djF2VVRZWkwySDdEckRBQ1dRU0g4RldPUjdyOE1vYlBW?=
 =?utf-8?B?eUpuMXZCL294L1pOWHBxakhsc1VEQjRFSFZTczJnYUpjV0dCRElPYldQOXAx?=
 =?utf-8?B?bHNTNW9sRVJJWXVqNHpKSWQxbFVlZlgxVjBNNWcwZlRTWGkzMHJuVnBQa2I0?=
 =?utf-8?B?SzRxQVpoYldQYUMrQkE1ZDZXK0tzT0ZZYUlKWlp0UjdyZDFFZFJXRE5HTjJI?=
 =?utf-8?B?RlVKMng4ZzV1eWdyaXkvUFhkVDRCeGhMZXRVUnFvM1QrODAxdEtqMi9EVzlZ?=
 =?utf-8?B?UjJoeEIwZnc5c0sxQitmVXFLUkJBVFoyQWlIRUM1TDUyWWtlZzRaWm1MWWtp?=
 =?utf-8?B?MGRESkhlMi81NVZHV2h0ZkVHRjZLM1ZnU3paWlNKdUViY3g0Ujl2ZUhXODlC?=
 =?utf-8?B?TXNvMkZDWWQrU0hJQ1JETHk3R0hQRWRuNVY2dHJsSnZTUGkrSjNQbnBWWld4?=
 =?utf-8?B?NHZLNHlSQUVNTDBxWnFVTi84K3RHMEp2UzhXVXZsYisvby9KRUMvWHhIME5R?=
 =?utf-8?B?OW5GR0pjb1V6dUluLzI5d1BOVUI4SDJsTkJiTGI1Y0JFV1lsMVFpbzU4cGJD?=
 =?utf-8?B?ZG05dnFWL3Y4c2FkQ0tOMDJpU0grSVVNTXpKU2d1dnhtV2VoK1lwS0tOZktE?=
 =?utf-8?B?c1h6cnlqMVo3dkVLQytNeVgvYzZKRzluQTl5dWFtTkNELzN0ZjhNZk5tZ2NW?=
 =?utf-8?B?WE4xYldmUXZyZU5qSTlicW5OcWwrZ0NQTEdFeVNTSVJpeU1XRU9sQ1BveGU0?=
 =?utf-8?B?NmZxUlVGMFpsR3Q5MGdNd1pjMFMxZ0hiUndvSDQzRTJIaVI3Q213U291bW9p?=
 =?utf-8?B?SnJjQWlxZXNBUmcxazl4cEhISE1aeFkxYmlPdDhhS0NJcWI1SkV6cXNnbmNQ?=
 =?utf-8?B?SWlvVU5WWTJvU0Faa2hqVlB6MmdQMll6eC92NDNlTXNRTlNoc3Z5b21ma2RV?=
 =?utf-8?B?T3Qxd3BZeVBuMjdTZmUvSHh5UEtLUjg3eXNxZ2tpcno1Uno1V2ZlR1JyakZ3?=
 =?utf-8?B?RmR0emtXL3J5Y3A4Y0w0UEdiNGoyOGRuVkhxQUo4SkZmMjB1ZzRYK0hBa0h2?=
 =?utf-8?B?dnVkS1gwRG92K2dDVGIwNndxRldseHNpMk1kSVlvVjlxcExqV0tYNlRrQmQ3?=
 =?utf-8?B?SWJkdVBhUkk3Q3NBb01YaDlrZ096VC9TSFpLd0dxdGVlN1p1elQrdXE4ZFRi?=
 =?utf-8?B?MnNBTWRraWJ4ckxtTTVWRzBqWG9ETDJ1TEwxVjdQRzBoQzNuanRQaTBvTU83?=
 =?utf-8?B?dXd3TXUvSGFhQTJnSFRQejNxQ0hsNHl0R0pqWHJXQVh1aWcrbHc0a3QwRU0x?=
 =?utf-8?B?NVRia2Q2Qy9qZlFkdnR1VmZCeDBDcWx3S1FCY3FSNTJRQXduUUFzQkI4REh0?=
 =?utf-8?B?RVdEcjd6VkplY2VDRGt0RTgxVDhKMXJjM0lFMElZejgzUXFCdFhyV2pwakR0?=
 =?utf-8?B?Rm9YN1B0UE0zb01RNC9VV2FSb3JneGVDK2RDOUhjVFk1SFpXV0E4amlkT2NR?=
 =?utf-8?B?eFRNSjZDWVFXMGxuUkY4eDB3OFBrK1BNTlJWTlIvVFljbXNWNDlndlpYMFUx?=
 =?utf-8?B?MDBFQlZGMGVDYWsrK2xGc0pZWXJXdzVBenBxK2gvbHppREpiNnlpNWFIUnQw?=
 =?utf-8?B?d0hKOW9PU25BdGRpT1I5RTVjSGpPK3NIeXJTT3dkQTFaaVBWV3ZHQ1dEeHhW?=
 =?utf-8?B?TEZTVVBpRFBkRnJ6MGFnc3NuYWl2NllNYzAvcTd5ZUZXVXVZblNibllLeVZX?=
 =?utf-8?B?aWlFbWU2THFLVzVtR2hHUEl5WmNHVE5wOFoxRS92WlVuUkdPZnltZzVMcmVm?=
 =?utf-8?B?Zy8yaTFVbzdUaFgweVNOc3BaYUM4TU5hcXBtYUpCZ0E4Y1pHdTlqMjQ2VDNV?=
 =?utf-8?B?QUlCODY3cWhlblEwVUVlMVBlNk0xMm43eUgzNXlBekFJZ1JzcVBoWENEbWpZ?=
 =?utf-8?B?TmVVYjJBd3FrVEx4VkZLZWtNZDJPVG85UDNRVmV4MXEycEhGV2lnYXJPMTVk?=
 =?utf-8?B?MjlqZnVuOEh3c2YzSExLOVZwaTNyZnN0T2tWd3BzQTFJZmd1aitKKyt0WFlj?=
 =?utf-8?B?dW91UUhDQTZJei9yRzZHUGhZSTNjd1FaajViOWJoa0tMM010OE1sS29FeEVY?=
 =?utf-8?Q?VPk6q2mhS3W7yBJwxIIx84J47?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3c94d2-2b8b-4839-8f44-08db5c1eb129
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 06:18:29.8621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFNmRxtw845PGWmgwndGti6+xON6G2gtuzZFEUgUlM2fMol3z0eAymTsrVfu/tfN/qddl7oNsuT05Pa/iICuDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7003

On 24.05.2023 03:13, Stefano Stabellini wrote:
> On Tue, 23 May 2023, Jan Beulich wrote:
>> On 23.05.2023 00:20, Stefano Stabellini wrote:
>>> On Sat, 20 May 2023, Roger Pau Monné wrote:
>>>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>>>> index ec2e978a4e6b..0ff8e940fa8d 100644
>>>> --- a/xen/drivers/vpci/header.c
>>>> +++ b/xen/drivers/vpci/header.c
>>>> @@ -289,6 +289,13 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>>>       */
>>>>      for_each_pdev ( pdev->domain, tmp )
>>>>      {
>>>> +        if ( !tmp->vpci )
>>>> +        {
>>>> +            printk(XENLOG_G_WARNING "%pp: not handled by vPCI for %pd\n",
>>>> +                   &tmp->sbdf, pdev->domain);
>>>> +            continue;
>>>> +        }
>>>> +
>>>>          if ( tmp == pdev )
>>>>          {
>>>>              /*
>>>> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
>>>> index 652807a4a454..0baef3a8d3a1 100644
>>>> --- a/xen/drivers/vpci/vpci.c
>>>> +++ b/xen/drivers/vpci/vpci.c
>>>> @@ -72,7 +72,12 @@ int vpci_add_handlers(struct pci_dev *pdev)
>>>>      unsigned int i;
>>>>      int rc = 0;
>>>>  
>>>> -    if ( !has_vpci(pdev->domain) )
>>>> +    if ( !has_vpci(pdev->domain) ||
>>>> +         /*
>>>> +          * Ignore RO and hidden devices, those are in use by Xen and vPCI
>>>> +          * won't work on them.
>>>> +          */
>>>> +         pci_get_pdev(dom_xen, pdev->sbdf) )
>>>>          return 0;
>>>>  
>>>>      /* We should not get here twice for the same device. */
>>>
>>>
>>> Now this patch works! Thank you!! :-)
>>>
>>> You can check the full logs here
>>> https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/4329259080
>>>
>>> Is the patch ready to be upstreamed aside from the commit message?
>>
>> I don't think so. vPCI ought to work on "r/o" devices. Out of curiosity,
>> have you also tried my (hackish and hence RFC) patch [1]?
>>
>> [1] https://lists.xen.org/archives/html/xen-devel/2021-08/msg01489.html
> 
> I don't know the code well enough to discuss what is the best solution.
> I'll let you and Roger figure it out. I would only kindly request to
> solve this in few days so that we can enable the real hardware PVH test
> in gitlab-ci as soon as possible. I think it is critical as it will
> allow us to catch many real issues going forward.

Funny. The problem has been pending for almost two years, and now you
expect it to be addressed within a few days?

> For sure I can test your patch. BTW it is also really easy for you to do
> it your simply by pushing a branch to a repo on gitlab-ci and watch for
> the results. If you are interested let me know I can give you a
> tutorial, you just need to create a repo, and register the gitlab runner
> and voila'.
> 
> This is the outcome:
> 
> https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/876808194
> 
> 
> (XEN) PCI add device 0000:00:00.0
> (XEN) PCI add device 0000:00:00.2
> (XEN) PCI add device 0000:00:01.0
> (XEN) PCI add device 0000:00:02.0
> (XEN) Assertion 'd == dom_xen && system_state < SYS_STATE_active' failed at drivers/vpci/header.c:313

So this is an assertion my patch adds. The right side of the && may be too
strict, but it's been too long to recall why exactly I thought the case
should occur only before Dom0 starts. You may want to retry with that 2nd
half of the condition dropped. Meanwhile I'll see to refresh my memory as
to the reasons for the assertion in its present shape.

Jan

