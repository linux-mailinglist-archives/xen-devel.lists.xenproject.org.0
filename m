Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F6079DF9C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 07:58:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600952.936806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgIt9-000835-5O; Wed, 13 Sep 2023 05:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600952.936806; Wed, 13 Sep 2023 05:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgIt9-00081E-1q; Wed, 13 Sep 2023 05:58:11 +0000
Received: by outflank-mailman (input) for mailman id 600952;
 Wed, 13 Sep 2023 05:58:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgIt7-000817-AN
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 05:58:09 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 829cf7ff-51fa-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 07:58:07 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8378.eurprd04.prod.outlook.com (2603:10a6:10:25f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 05:58:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 05:58:04 +0000
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
X-Inumbo-ID: 829cf7ff-51fa-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ogw/rbkbLIL7oVoxarbFERvm6WRF95/0zZcMbY8NXvHLZRaYmaUvPiEzDJAqFQX9AKoTvdkLE2Fqhxt+CSxMHoyeYn6kvS/QQXLwkEDWsKi51BqZfYuQzTPv+FmTb/s5qPgg3RTdvma1dRf19sAbMWt8FEJZPUYufNyeSKHn89UFLKN/pPmbQzyY/LpxA2X3onGSoLmJwTmLM5VakfhRUC2YGKzbt079MQnbbVxSjx+GU0fye8X93xSyB0y7iPF0DmDSoVBz2DovgdRXoiNNaS8l2Ig3cZWaVHpBUtXQa+xVx6NAG0AF1r/9kaTD//prckqGfgBaYfznSgpQ0PQVlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3XRPmyR/rYeCPkUbHbM6Ne0NiE7p8QqzvML3QMDIx8=;
 b=NL4fzdaIEP3fEQWVHEivPV7r6h+EQyYryA2fYrGB6aRYh0xl7vbscT6V8PAVpJeXU2gAl11S+Z2qd2QyZ5if4tu9B3tu/sDav03vyITN2vIGypqy7pNfCYHlssKsU3iGHzXgoj7VDiw8k0dW3Siwj21yOBkgkWGIyoEpJuWXxKFVRThuYr0g/XsOZEnLfPLG0ROFfqNveq0vhjRIYqy4vHSrb12iJi4cHV2VREBVywR0uQ7VVQwFZAr6MEqETM2Krc7eFDjrMyrxLOx/HRV0EKzo/OyC0RTTQl9ZQtJjuIVjdC5Q1ShzDUOzI9o2CBMqviyWQlhewCR1Mz6C3oWIPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3XRPmyR/rYeCPkUbHbM6Ne0NiE7p8QqzvML3QMDIx8=;
 b=SLFzUZ4bt7MOP5MA7UPxThXWmkqEVZzKAwkIdj62OLm2AfbIsprrSMSShmrXUn7m+oXlPNuqUYPww6JVEkPgzFNNmZnmMoiP2vTFyZciQtKLRL9rfDP6569xNhdKctHcBtDJxaIz5AvE2AFUtZLCE6aFDkHwk0r3XiMNKy+Mvv5lOV5gC+irQ7eSltITN4P7S9BqG9LnQLJkXEPilaUm0xKZ02R6LdzNOUAeZeqfw2nJ80ZhtJhYEiRWsizDZ0BdMPLkO84+xLCohS2+UKepvn8rptIGanG8uCIOJiEfY/pevHMmRE+cfnzWY3W/TX4R1v17aPepCpNLcvfj0UIINQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1f57bbf2-d6f3-2e3d-61e0-049b8e2e070a@suse.com>
Date: Wed, 13 Sep 2023 07:58:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v9 04/16] vpci: add hooks for PCI device assign/de-assign
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-5-volodymyr_babchuk@epam.com>
 <77e2dbc0-c224-4c1e-72a0-5b19aa76ba0b@suse.com> <874jjzhsd4.fsf@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <874jjzhsd4.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0212.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8378:EE_
X-MS-Office365-Filtering-Correlation-Id: 496fa93a-8c0c-469b-b3e3-08dbb41e64c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GPNLFCefySKTWPUEwvV3EDXqlftU+vj2uDh56LM+giBFOcEkBKA5HiCeOAajdnFkhsrruMAtFcSBY1DaU8QX3HIdQd4IbnUQaHrAD9z0UMeZuFpnYLEoCw9X2Pz/y215cageNhVWssvDNcFXN31XYEsxeUEx4pyyUle/hc7K1aC07Haebv3EB34csIrRg409xD4vTkfCUsOPkFbVOSxwdcXbA54u+ZhbxpQufe77Io4bRy2LmgKLDoa7wpSAMADGdIv+K2yowthn2agY9U6JXRhLiwJ2w8wKGmRYR1Q+HUttrJAvRuJtl22gsdYl/zHKi4oN23jwoBPwSj3Ie1tQbljN1MDe8SBCxG6NSgzVKQ7HMv86hha7ZlXTTMPJKquEsVMdPlgTib2whB79Le0FNnd9KIXhmnfECJVpiywAfZYIZBpfAgSUk/+RrgzriX/tOgP0m6qGL40bCBh6QZzDF7gIK506zR8ckhLBkRWa8xeLbfdn0iWjC4ZJ0jwYcmGGxIw7fCMOXFPg/l/G65saKsmceQRDHYSxSxDREWXiWH0Lzyn2IGyIxDHN+FMWzpSmBozu+ey5iYywanviFBQe+pvxh0rpy4z9Oa0RuwAJHu7Ei4t+fsM3ECmiNlrIEPNQcI86Yt8oUY37G6JYFfKGnA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199024)(186009)(1800799009)(38100700002)(2616005)(31686004)(36756003)(478600001)(6916009)(41300700001)(66556008)(66946007)(66476007)(54906003)(53546011)(83380400001)(6666004)(26005)(316002)(6506007)(6512007)(6486002)(8936002)(8676002)(2906002)(4326008)(31696002)(86362001)(5660300002)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3hFTVNQL2pOd0JrZ25QMXhQdWFiTTV1ZmVnWGcyNnVHOEExN0Fyb05vWGxR?=
 =?utf-8?B?TFlad2pTM3p1RVRsQjlJN0JreWRobTQ5TG1KMVFLUlVWRUNIcE9yOFNYS0hx?=
 =?utf-8?B?THJPdjlqdGM2ZHZ2RnlVS2JQWGViYzhubWg3aDNyRjBHUWpEWmtBTzBtN2FO?=
 =?utf-8?B?SkthKzZJOVdDRU1iak53bU5aYTFjNnlnd0ZhcHNQTGMrUk1KNzNxdXRIL2s1?=
 =?utf-8?B?ZXV1K3BFSkRVcUVTSEdBSzRXQWNjSEZ6RCs0L2IrZlprd2tLSjN0b2xGQWZp?=
 =?utf-8?B?eEVRSHEzTWlyRVgvY0NLWmxFYWl2Q0UraDVhVUplcWJtOUluRkxCN0hqV2lT?=
 =?utf-8?B?c2RNb09udXBtWDdoa0dTZ0NGbE4xZS9nQk9wYWhhMDlYYjNCZ3MySXRwcHN4?=
 =?utf-8?B?OVJpNk10UU40eEovVTNmS21PTkhZUk5NMGRQMkEyWFlMUFB6eUxOVGFQejNq?=
 =?utf-8?B?WTF6SVk5WVVHYWYrTFJEWFYrVkwvUzdNQVZkb0pWdFdqZGJ5LzhjRVZiNkxj?=
 =?utf-8?B?WXVSWFVhcUV3NzBzQ05VM3ZHRVhVYTVrY1NYR2hlZTZlVmdkZXBpR0ZqU0No?=
 =?utf-8?B?TXBFSlFSSENuUUZ2aVk0dXRTNFlza29SN0srenVVUGtoUVd1OHcvYXBENWEz?=
 =?utf-8?B?N0JCdlFwcHY5bFQ4K2ZNemkrUmZTTXZCUVBQTnkzcnNPSFpUZjg1ejdFdWlG?=
 =?utf-8?B?S2RRNjFyd3lwcWtWTzgvZUtncU1adHFkYjhWWngrOHlZaDlkQ1AzWHRrU0Y5?=
 =?utf-8?B?blVqeE1YRnQ2RkFtcWN0bGFFcHIyZHNzbzhjOFN3RDNPRTJqQk5wU3RPS2Zk?=
 =?utf-8?B?eXZ4azlJWC9mYjhtZklobzJpTFJIMjZuT2tsMHRHamU4TVQ2UVB1QTdmYUN1?=
 =?utf-8?B?WXBWSkpjUVQwcTBQc25RMFI3S3FCMlc1bGtuSEU4cWpEQjNPTFVRaWR3NWZt?=
 =?utf-8?B?M1o2VkVVdWdIUWJHeWdvSzZYOVE1KzdXZlJla0FydlpHYTNXYVVYU2Z1QUs4?=
 =?utf-8?B?NWxuczlKZGNFSWphZGlIUzE1VTFOckw1NVJZWHBXUFRCeGhiZWpLQ0djdCtK?=
 =?utf-8?B?YTJ5R1I2MDBsSEIwWmcrS3hWL3ovZVp0RGdLTVZ6cjJaWW1YZlJWTE1MNk9B?=
 =?utf-8?B?ODhBNG01V1kzMUZDdS9QRjlzb24yQ0t1a1AzYUhCYmVrTEhpSjlLSlI0WE5u?=
 =?utf-8?B?SnB1ZW9tOWVBSklDL0hIc0VMLzV2dWwwMEx6ZG1VOGpBT2NBMlBvQjRzdk03?=
 =?utf-8?B?R09HN2VwTUNTYlNldmF0akZlV1BPdHlJS1gwOXhnZjRncEJLY3hpOE5kR0s4?=
 =?utf-8?B?Z3plSHpUak5kK21ZaDdOQmtrZWpoeFc5NHF1d29ObllCWTVhNnE2UzlQNHNk?=
 =?utf-8?B?b3RHUVA5OHRaNnVzVDNpUWkyMkh1Kzk1SW9xSTF5dCtNNER4dDRHZjcxNTRh?=
 =?utf-8?B?VHZBd2FnaS93aEpNZDhzcThWM1FNUlhNUWU3WndzZ0xTT09iaTVjU2hxN01E?=
 =?utf-8?B?WW1CZXNBaDM2aDBZb29lSHZlR3R4TUxpVG56MGVUdWxVNENQb0tOMnloZUFr?=
 =?utf-8?B?dFhXNTM2SzFKZkpMdUt6WmN0NzdNSkVHeWxqLytOOW5qTllBbXN6NVdtcWk3?=
 =?utf-8?B?S2JjWjF2S3Baek5vWXAxZkJwcjVYVlBFYkFpNFQyaUlEd1FybzFvYlRBVlJ5?=
 =?utf-8?B?ZmpUUDdaZzIvQmdkRGJuUWJjMWI0T3BxZmJUWnFla0FPaVU0ZVZ3UHZrTW5k?=
 =?utf-8?B?VmU2bmNRenRuMDhncEpPbXpZT0VFRFpCSVZnbTdrRjlFZ0pxZnVZeXF3cWRI?=
 =?utf-8?B?T1pYS1FibzBHMFlpYTF4U0t1QUhzaklGUHhRcGxGaTlGeE9BMVpJYjllOXhm?=
 =?utf-8?B?ZFNTNTZxTVdGaW5YeWhYN2xKMjFlZGZwbUMxZ2pEbC81Tm5pVm9LTlEvVW10?=
 =?utf-8?B?ODFNSC9rZ1JoNHVYYTR1SUlvNFpMMGtHV2tuV2xLY2tNaEpwRiszMFhrMnhO?=
 =?utf-8?B?WFJ0a01meVd6aG41aEdXUTBWOUxPMnV1SEdFNndWZ2tpb1JadmhiTndyb0Y5?=
 =?utf-8?B?bzd3VHFTNXJDeDRXMUwzN0V6aWR1UjhVVkFlTVMrWnI0eU9SRjdpLzVabXVV?=
 =?utf-8?Q?A02TZXsinymExruO1RQKvWcvs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 496fa93a-8c0c-469b-b3e3-08dbb41e64c4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 05:58:03.8130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rbt9Y1zKEIoAeDuuuEJihyzxejT4KL9A3dAcY1ldWwU8VxFpb6z+06+lNwTtpmk4wtFHgEatk4+7XhehX4XBgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8378

On 13.09.2023 01:41, Volodymyr Babchuk wrote:
> Jan Beulich <jbeulich@suse.com> writes:
>> On 30.08.2023 01:19, Volodymyr Babchuk wrote:
>>> @@ -1481,6 +1488,13 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>>>      if ( pdev->broken && d != hardware_domain && d != dom_io )
>>>          goto done;
>>>  
>>> +    if ( IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) )
>>> +    {
>>> +        write_lock(&pdev->domain->pci_lock);
>>> +        vpci_deassign_device(pdev);
>>> +        write_unlock(&pdev->domain->pci_lock);
>>> +    }
>>
>> Why is the DomIO special case ...
> 
> vpci_deassign_device() does nothing if vPCI was initialized for a
> domain. So it not wrong to call this function even if pdev belongs to dom_io.

Well, okay, but then you acquire a lock just to do nothing (apart
from the apparent asymmetry).

>>> @@ -1506,6 +1520,15 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>>>          rc = iommu_call(hd->platform_ops, assign_device, d, devfn,
>>>                          pci_to_dev(pdev), flag);
>>>      }
>>> +    if ( rc )
>>> +        goto done;
>>> +
>>> +    if ( IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) && d != dom_io)
>>> +    {
>>> +        write_lock(&d->pci_lock);
>>> +        rc = vpci_assign_device(pdev);
>>> +        write_unlock(&d->pci_lock);
>>> +    }
>>
>> ... relevant only here?
>>
> 
> There is no sense to initialize vPCI for dom_io.

Of course.

Jan

