Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCD5710F9C
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 17:31:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539734.840906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Cw6-0002gm-0o; Thu, 25 May 2023 15:31:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539734.840906; Thu, 25 May 2023 15:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Cw5-0002e4-Td; Thu, 25 May 2023 15:31:29 +0000
Received: by outflank-mailman (input) for mailman id 539734;
 Thu, 25 May 2023 15:31:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q2Cw3-0002dx-Tq
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 15:31:28 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2040.outbound.protection.outlook.com [40.107.7.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35cd2053-fb11-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 17:31:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8835.eurprd04.prod.outlook.com (2603:10a6:20b:42e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 15:30:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 15:30:57 +0000
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
X-Inumbo-ID: 35cd2053-fb11-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JfJspY+BXdwVKmc/eDdF/CVhaKdGflqZtb8mQv2hga13FUsYqL7uWi8i8tD2GJcbfGQpnCxwulbn6TB81+rIBsg9xX3LNE+y+Ms3oTOP4WhmCdxuomusFOduapw5+oY2S+hj8GdCs3HssuzZIhMLIBqlAEVmqe13Sxej94xMmkW18iafBQ7vaE80oOjg9tRIgFXlfj9vGLesV96gyrLzViawV6jc6d0v71DN38DXWZC4iW6e68mwbHBB1HBy+pzNHMcZapjVkiE6n9VliagfH+07DEH2Poviuocg/0ODFVEN2XOxMioA6CWWe8OptQj0Bmxg1Mxi+XbuT2VpLuK1Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XthclJhARAbRFWfZZIRRFnBerPteSOKIaVn5ezanCdw=;
 b=Xluegp34WxPDhLuGDKPLuVV9O5eEzUYXubpZzilBnUB4xG9497Txpyk4ZzqItFEYrRzesisu+AJDgD1BbNYB7Zf368Z2dhbUIT28MBkxWzb908vfZVvvtqsGGJ3dAiLyGBFFtkndKWOpqAt3OoyOvOXh6mavscz2mDSaI96fX9Cc1tpM2bLuQ+wdXcyGEUYdbVkR/y2g6v9GGVTqCEYQj8Mhq5AGq77Qqf+4f+c+Fg3DL+Md7+HcmPF3B5hGjnxOtzhtHFuTIZhVXzS4DnaAx5INy5+E/DQJVvWF+EcDkHwHFFhns0H9q+GL3k7gypuXlHAXCYiFAQOEuJxfd+gcCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XthclJhARAbRFWfZZIRRFnBerPteSOKIaVn5ezanCdw=;
 b=C13BKj3JMuqNWeuTYFaMo1rv5rqtyfl+qLPdgwmHalTkZE/TPxZ2yy2v3b0votR8e2RmFhvGzDwU+Ywv9CGjB9rnjKeWJXlRYViZpiZ6k008XwZfMEJa/U7GYp9llYmkGwrEPWoZhkIej0zYnl2382lzjYzuWDHyUH7N2CqLgdGoOXn9EkJLahxkeq/1eP/QxY8/oc9YD1LhPNamykgtYjTOX3NjivWcATzNstMenR8VjCTVVsOaoBTF8MDOYrKMhY1AkrVe5+L5W1MPUllShYjQTUsoGafcy8hLd8RZpefXIL4ZMHKbh7yPj9nhV1MaKeaZoOYibIEcxx1j7KcxKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cedbc257-9ad9-56f1-5060-eaf173d45760@suse.com>
Date: Thu, 25 May 2023 17:30:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v2] vPCI: account for hidden devices
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <7294a70c-0089-e375-bb5a-bf9544d4f251@suse.com>
 <ZG4zx+TvUWTCEMh3@Air-de-Roger>
 <2b1b1744-2bc3-c7c0-a2d8-6aa6996d4af9@suse.com>
 <ZG94c9y4j4udFmsy@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZG94c9y4j4udFmsy@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8835:EE_
X-MS-Office365-Filtering-Correlation-Id: 2df1157f-f1f9-444d-757c-08db5d3508eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1Jjd0WqZN5lOiCiUn4i1b+D/38llGWaMc0JJBAh6TFS2MUsdlCc5afLZeAqKdg2VrZSa4MQgImJYoVeiJYhzuuKybRuTVLcLbBuF1OYk/ogNRRgqO0LwuFcaaHXySgUs01M+4cbH2iF/xrQLnP0c+JNJntsdT0SCJliHLP5GuunRRWOokPvRm84IjerXj880DAJrQcy6X2F6VWgMDuxaDI679pVN2XLeFdMrDnBxxy9AZDDUDFZH3QlolLBxYGrqBxHWU2sfkJupmMVNjPG/ZMaZLaVG3S9HmppA+Gr3pv3sQYSo8pcE9SovGSPq0Dqo4Fjr3c1KkZIMQb6agiOvt8y2EKp07cGGcx3vs8ja5Vg+4LGOTqE48BrmVTbMfptnnxKKqixCSsohEM2WrqP8hxCbC57LELmfcIbQUxre1uxGwYWkAjSfZ19HSwUkV7GFVhAQIBjy/Qv5JCwZUrOreAcWSZteX5i6PF5+thmoeIXIQabph0GRBOGEVlLdkTEjtR+ZpOcy+rPEBMGY167ifKThhksEXl8SHEgDjuP9zEAxUJCzdcZcXXj94ajTQoKZGroem9cZGyH9HyJkIgOGRW8JVkKUKdT1IGP0ajMjR4P4mywqsFdceEpxgLLlOAW2o3NJtFsHvty0VXpy486uHA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(396003)(376002)(366004)(136003)(451199021)(31686004)(6916009)(66946007)(66556008)(66476007)(478600001)(316002)(4326008)(54906003)(86362001)(31696002)(36756003)(6506007)(26005)(186003)(2616005)(53546011)(6512007)(83380400001)(5660300002)(41300700001)(8936002)(15650500001)(8676002)(2906002)(6486002)(6666004)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWFsQVZyUG1oTURsVXI4bHhiRCtyL1lTdDlHcEJJRXNSOGNFNVlSY0lhOUY5?=
 =?utf-8?B?bWRGVXBjU1Q4UllwUm04K04wSTdsTnR3L21JT0V6bXhrQTYyR3krcThKL01m?=
 =?utf-8?B?SlRucWZPay93cFQ0OGJJMHhvN3l5QVI5WWtXN3QxbGdldHZkajdUTVJaaUtS?=
 =?utf-8?B?cGZMcUNURG9WbGRWV1VodzNmY1diMUVWcDNmTXpXSWhObmhiamU1a2ZvMnpC?=
 =?utf-8?B?VWVrSGNDR0lyZDFlS2RxU2FlZndkZ2RzQnZkVEJTQ3pIc1B6cTBZTmlocmpH?=
 =?utf-8?B?bFdDNmtoZXdraEkvVkcrUmVyZDgxUWhUek1rcUUzZk4xb1hCNmFHZUh6bXBE?=
 =?utf-8?B?M3FMRW5oUnk1eDlKSHJQNWQxZmNrQ1hlSmxCRDNiQUhtMFpZWWNjenlaUVYy?=
 =?utf-8?B?aW5GSk9jc1Y0bnJjOW8xck43U01jQmtiTFN0NWFMNFJBbUh4RksvaVZONzFq?=
 =?utf-8?B?Q0RhcUV1UlphWjd5TWk4dGdXWjJaNG9VQlJhT2hZWTdUQUgyeUFmN2E5c0Yz?=
 =?utf-8?B?bGo0a0d5SjdkV0pVMUtIbGxUbTBBUVp6Mit3ZkRqc0pJNW85dzgvRmVNYUVU?=
 =?utf-8?B?YUpyc3EvajRQRENlbEU2ZmdKU3liOWZ5dFg4RUFadWs1bDI1TUFqdE5taXlU?=
 =?utf-8?B?UmhraHliT1BXVXpPK2VSUTJsaXdOaTJuVzd4VEkxbzhabzJoT0xYaXBtOXFS?=
 =?utf-8?B?bnphZ0ZjclJHL0loQkQ2SEh6ckFodk51cFNZMHpEWk4wNTU0Ni8xY0pPdnN5?=
 =?utf-8?B?a1haZlhJMSt6UnZGWUlSV211bHJjYkx5N1lIUmdEY3FXNWZxaVFrcDlmbWU2?=
 =?utf-8?B?MjV6bGVGYlNTNWY3LzNob1R3dG9NbUZWTE1xdkQyWEFjWHlqRS9CbEFQR0Uz?=
 =?utf-8?B?RDFjczkrSUxpb1cyKzlZUU9NWng3MFRRcStMMCtLamFyKzl6bkVmZlVVckVz?=
 =?utf-8?B?cVFUVlZDbGlEVllvaTZYUmhxQjN1SStQa1didmRGbDVxZ0VEN2tMNFgrQkdJ?=
 =?utf-8?B?Wko4NGVjNXpCNnpnT3lRYVNITEJHV1VOQ2pxTHBHanpuY3k2c2pVNzYvL1k0?=
 =?utf-8?B?UGVreWl1N3dsbjNybkczK3krNE1ad0hBbU9WTERDNG1jb2FkZU1DWC9UWm1x?=
 =?utf-8?B?OFlhRUdBRlI0R3R0a1J5bVNSVFJzTUVKaUFUdXNHMXQxN1Vsa0hmQjB2L1RG?=
 =?utf-8?B?VFo4QWhuWmpZa0pQbkRJSGFiSkJYRnlDVGxnK1RBSDN4MHRiZk1nNEd5dFpx?=
 =?utf-8?B?ZkN0dWtHY2FYY1U2ZUZBV3dkc09MSjdiMkRVTlY5S1JFN3ExYnY4TVNrdWxq?=
 =?utf-8?B?K1lzTmRZTEZ4cFhqWndvbENrL2VtUjhWRXRuRHpidTAwY3BUc1Vpb015WWVt?=
 =?utf-8?B?OVBhODNuQjJMejVLMWVUcm1naTBZdDZ4K2xndWsrd0pNYlFjY1kwQTFGYTFL?=
 =?utf-8?B?R2ZJb3BtR0VBUm9WVFpHTjhqbVozNDl2NU9CRC9vUDJXZDJ1MitEOXVIbTJQ?=
 =?utf-8?B?OXQxaVFERHpzNlBwQzhCS1E0aDhlRVV0alVVK3lMM0VsdmxRKzVZaGZoRjg3?=
 =?utf-8?B?NVlXSWxtL2hrTzk5K0Nyb0ZiaXIyenlVdlZMZUwvRnZqUFlZNUNpNTZoZ1RL?=
 =?utf-8?B?SmRHZ0pNNXhjNjZGMHFaUnFuek1La3BlNFhTaXEyenBRNEtJd1hFdXBZZG1t?=
 =?utf-8?B?NGJWeGFiTFFDbDU2U3dKK081UjEzdUVlSWZXdy80ZEkzT1I2bE93ZXBrbkpN?=
 =?utf-8?B?dE5lSUNwQkljaEVTUFY3OUJHd2FJcXBNdnppWXVnc0IzT2dEd1F5dXRJb2Fh?=
 =?utf-8?B?SUJkSEZYRFVjNkkvM28zK0I2c2gyZGY3SWZ1K0xNQmRqZXgyMU8wWG1iRkow?=
 =?utf-8?B?SjZlRGc4RitXd1VQcUZVMUorS1RGQ1RNWUlUNFJFWC9Oa1pDbzZLZzdhcEdk?=
 =?utf-8?B?OFJFR051RmpEbGJTeWN5OWZWdE5mTzhmSERYbGFaQllCN2RhZ3NoSUNyL3ZH?=
 =?utf-8?B?VzZqTWFINHZJV09XL0tCOUZxWHQyMWd1VEJLZzNUYm04TVJGZTV5TmhHdEpl?=
 =?utf-8?B?WkRSTmZOZ1FRN2RLK0FSbWExbC8vQ0J5b2RaVEpEaUVuMExTUUNtVmd2a3Va?=
 =?utf-8?Q?OJ1cvOIxQc3TGJyvlfL3gVzIY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df1157f-f1f9-444d-757c-08db5d3508eb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 15:30:56.9499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XkeHH/2W38sCcDyep8WofYcnn/e9SQ1tsMyDjE5K40BJFK8o1PjayJdaBjN6yP8ZCdDdptgeBtor2+P97VsI7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8835

On 25.05.2023 17:02, Roger Pau Monné wrote:
> On Thu, May 25, 2023 at 04:39:51PM +0200, Jan Beulich wrote:
>> On 24.05.2023 17:56, Roger Pau Monné wrote:
>>> On Wed, May 24, 2023 at 03:45:58PM +0200, Jan Beulich wrote:
>>>> --- a/xen/drivers/vpci/header.c
>>>> +++ b/xen/drivers/vpci/header.c
>>>> @@ -218,6 +218,7 @@ static int modify_bars(const struct pci_
>>>>      struct vpci_header *header = &pdev->vpci->header;
>>>>      struct rangeset *mem = rangeset_new(NULL, NULL, 0);
>>>>      struct pci_dev *tmp, *dev = NULL;
>>>> +    const struct domain *d;
>>>>      const struct vpci_msix *msix = pdev->vpci->msix;
>>>>      unsigned int i;
>>>>      int rc;
>>>> @@ -285,9 +286,11 @@ static int modify_bars(const struct pci_
>>>>  
>>>>      /*
>>>>       * Check for overlaps with other BARs. Note that only BARs that are
>>>> -     * currently mapped (enabled) are checked for overlaps.
>>>> +     * currently mapped (enabled) are checked for overlaps. Note also that
>>>> +     * for Dom0 we also need to include hidden, i.e. DomXEN's, devices.
>>>>       */
>>>> -    for_each_pdev ( pdev->domain, tmp )
>>>> +for ( d = pdev->domain; ; d = dom_xen ) {//todo
>>>
>>> Looking at this again, I think this is slightly more complex, as during
>>> runtime dom0 will get here with pdev->domain == hardware_domain OR
>>> dom_xen, and hence you also need to account that devices that have
>>> pdev->domain == dom_xen need to iterate over devices that belong to
>>> the hardware_domain, ie:
>>>
>>> for ( d = pdev->domain; ;
>>>       d = (pdev->domain == dom_xen) ? hardware_domain : dom_xen )
>>
>> Right, something along these lines. To keep loop continuation expression
>> and exit condition simple, I'll probably prefer
>>
>> for ( d = pdev->domain != dom_xen ? pdev->domain : hardware_domain;
>>       ; d = dom_xen )
> 
> LGTM.  I would add parentheses around the pdev->domain != dom_xen
> condition, but that's just my personal taste.
> 
> We might want to add an
> 
> ASSERT(pdev->domain == hardware_domain || pdev->domain == dom_xen);
> 
> here, just to remind that this chunk must be revisited when adding
> domU support (but you can also argue we haven't done this elsewhere),
> I just feel here it's not so obvious we don't want do to this for
> domUs.

I could add such an assertion, if only ...

>>> And we likely want to limit this to devices that belong to the
>>> hardware_domain or to dom_xen (in preparation for vPCI being used for
>>> domUs).
>>
>> I'm afraid I don't understand this remark, though.
> 
> This was looking forward to domU support, so that you already cater
> for pdev->domain not being hardware_domain or dom_xen, but we might
> want to leave that for later, when domU support is actually
> introduced.

... I understood why this checking doesn't apply to DomU-s as well,
in your opinion.

Jan

