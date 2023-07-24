Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E314575F851
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 15:32:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568969.889225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvfP-00021a-F0; Mon, 24 Jul 2023 13:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568969.889225; Mon, 24 Jul 2023 13:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvfP-0001yS-C5; Mon, 24 Jul 2023 13:32:03 +0000
Received: by outflank-mailman (input) for mailman id 568969;
 Mon, 24 Jul 2023 13:32:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vJ35=DK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qNvfN-0001yM-IC
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 13:32:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77b53d30-2a26-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 15:32:00 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8480.eurprd04.prod.outlook.com (2603:10a6:10:2c6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 13:31:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 13:31:58 +0000
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
X-Inumbo-ID: 77b53d30-2a26-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwtINDcE8lMeryoyHFPtHZPI9LdpiEFLfyrUHaiNmZM9fDnfz/bne/oTlQEvPa5wTBERvc2F9cS7WXGs5l+3TBvl6DK2Om1C+eQqUxWZ4UPlr7OTcQau3IRKYIIeCziyONvvxlc4FkiLUR3z6AEvL7fFOFfJmnuCxgeaN4J5cG/h84SmL4MniywEZCm9CeayX4lqZTg+a8tCNtyxBxOTz0qctGLEHci4h4QpcqZT6vfDfjIfdawy1G5ZRfqzXr9WR2ZgftLHsYJAv5zRDjTM2b4EvFZI2HaNJ/PsWhCpK36AIrcrzm0L35LGp+q8+qeHVPc0KMBmLYaaNVqEvWei8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4bStPEJpe5jiTrOHHetxFmq274agqPmssi/OYDxvWC4=;
 b=f4BnbaquPIO2/6pWNbde9RYj2P6ZoDWwvarbOaMdKoT1IqI/O1MVsr0jn/99puS7WjfjtIR5mhEfjwBdLTk/o/63toVqkdPJkBpoTKd8ynHO3L+pNwlOrzOKI8jRaiO2cl+M9O2SjU0/2z9J7SwWr3QleECreN/L1B9DrA6UV7zw8Jf2wP3MYPR9LeNvR6fJ2QGa6TIxWp4BXF5z+DJeSSNQV13xiNnmR4viVTSAzpJwyxxrC7kRGmfXPpiP3ib37+9kPznkbX81EeXf/d3GewyE9wWp+oyw6K+3bVKrUGOKZI49oLc+9nDE2kpCy+Cd67xA3RwRtX9JcRbedSI2Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bStPEJpe5jiTrOHHetxFmq274agqPmssi/OYDxvWC4=;
 b=MvXLPyBQoMHO06YX/bQH3kV/+PJ2TmL3JSQo3GMZKnaYliXEGRsUQq5dWlwRpGp3L8gtL48g2HpFOHIRJ3O5FKhm6egELk0UJnakmD7y2S74jIpaQNa1LITISXWHvDZ9ido7sUrvQ2762+mUFcC5BfTSKchE0v4c68BfVbPvIK17cBOgwoDuTpYFQc91c4fpot+u1E78shqpY/NFuxjkJ5olOBBKKsfivdw9K6xfWg5wpc/4kzt0rho1GM9ZbzQzNhoPp6j4TNtFec+MHaz/zjfD5v92Q7tV38XeeK/fVmXE6pDZLL79m0KMxOVaB9AYGy16j9tkYVLhFMfxob6Ixw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a7821ebf-674a-87ce-7d26-d87ae4c9d040@suse.com>
Date: Mon, 24 Jul 2023 15:31:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 08/13] vpci/header: program p2m with guest BAR view
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-9-volodymyr_babchuk@epam.com>
 <f2b8945e-cedf-3b38-042c-7b1288cfcde7@suse.com>
 <ZL55nfjyL-WpIWyt@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZL55nfjyL-WpIWyt@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8480:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d37980f-5359-4ac7-9ddf-08db8c4a5ac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CU0ov2k7acbsqhHZ9K+4/Qt+KprR2TzqJLrywvGGSVo/nATHP8+XlHn/DD0442pdhCoC+N9j1UlcLVEql8/4YRkxPx6mh1z1eo2lNF5z0vDZehbB88SE+uzCrZJnp2qTfHYeenjDCjAPoVMFBMp197bXgSsbrgTwWA+GksCtwnFM61e5dFHVaCpl7va88GxuLroONkSVpxdz1zApMtkRF2+FlzI7rB/PsW0oNZPAA4kgjFsAyO2yt/4UGAl0WVWIwKd2iORoQHuHo82af5zmAy2R5MCmhQkxzl6D2OOzKST/ub/Pi8YHttsuwFEHcyganrSU35b0EcNIaofn6CvPNKxXvHiL57Eiiu0odAYZowaXXHKebjqV9NYEWMj4/9tkU92nlQwKv2HJ6stB1NKTDfvAjkL/Tb90Mx9rfFb0f/rOeT6d1+c/PMCKce0Vn55qTai1P2oKPXnJSt3wR8X06ImSITOv4UNDdE84Ac6kLkQiOogvxslCI5jxh1bdG+3bt0Rr1/NKip7d7su7fBHiTZBksqWUIjNQQG+Rwscda0WDM7WnxGtkj29uEE5CoutjruV9Dwo1ZYm3oyvYd3MY+/ggP2MoGHYGzNdYGpGhPuwGbz30dBfo/4ADqJwAqCdd4SV5La17hVub8TAx0hhj8w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199021)(2906002)(66946007)(66476007)(66556008)(6916009)(478600001)(6486002)(31696002)(6512007)(54906003)(83380400001)(86362001)(36756003)(186003)(2616005)(26005)(53546011)(6506007)(38100700002)(4326008)(41300700001)(8936002)(31686004)(8676002)(5660300002)(66899021)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0c2ckVBTjhqRXVDNVZzVCs3VzJQWm90WUpnTzVJR1ZNdGpsU0RaekFLRE53?=
 =?utf-8?B?OUhqenNtMFNncTl1bXZUNDRHUVhabENVVVRBWUZaNllQakJYTll0dWNud2Y4?=
 =?utf-8?B?bUM4cWtNSDdSSGJZM29RcVlycWV2b3NHVTFDNEFtejBmUE45MWFqbDFyenJv?=
 =?utf-8?B?aGthZ0xlRUdYdW1CTFFjak9HU29CTFk5S0NZZGxYS3F0TmZ6bzRvcndBVE5I?=
 =?utf-8?B?QmMrYS8wTG53N0YxTmk3RkZQTWhKRFNYOWtCOW9rNHNkd2JiVUpYMlBTSEJj?=
 =?utf-8?B?ejJKamh5Uzl0NXhuQnZicTd1Z21oaGY2ZFdOYjA5YVhYNVZzNTlDaXVTcUlN?=
 =?utf-8?B?aE53V1hwQitpTXlFekF0anhBSjVsWjBXanJBWjFpSUZ3Vlh2a2I5bWFadzZo?=
 =?utf-8?B?T0MyQkUwTlNFTUxuY0t3ZlprNnZiTG0vMVNZZFRPbmhWaGxKa3RjeEw2bGQy?=
 =?utf-8?B?Zy9vSDFTVUhEK1Q4Mk1tTHdjSW1CZzNNOFRHSTVPbnhnSi8xZnJ1NWZEVTBJ?=
 =?utf-8?B?TER3ZGE2dnBMRjlMUkxXYTJoSkNOR2ZHeGlSVnQrWktSd0JlUWI1ZnpuUVdy?=
 =?utf-8?B?TmpHc3dQeC9XejBaMlBhb05Ed2NtNU93UjVQWkRBRnRXb3VRNXVjaVRXa0Np?=
 =?utf-8?B?ZHg4UUd1OHpIWmJPdFg2UmVrQ0FVTFVybjdNZDI5Tll4RkVsMDJveVJsNDN4?=
 =?utf-8?B?aVo0WExGYTM4cjF6NzJSUlZKUFR1cGRMWThyV3RzL1dhSFhWRjhWSXRCTDJQ?=
 =?utf-8?B?QmZ2VFFXVEtyQlVwWGk5SjFJTjB5czFBT2NDSEJOaVI2ZjdBdmUvcmJJY1Fm?=
 =?utf-8?B?S29GZTkrUEs0OGMza3VKUHc1S1NlQzN6MVFXV2JMQzlTRTc3d3hvMGpLTmUz?=
 =?utf-8?B?ZE9KVy9RTkdjZk9LNG9XR1ZQVGhJRjE3UHFybnhtVWcyRFRVRTlsK29BQldi?=
 =?utf-8?B?U1lnaTYzb1lTT2ViT3ZFaHFIcldrZlpFaFdGUldSR2NOdTVnYWsxdHNadklk?=
 =?utf-8?B?NURNNWRlbXJoZHJMRjBFL2YxRk5oaVFLUFQ0eEJFd2dnWWJHUWozVTg5aHFR?=
 =?utf-8?B?NkhjVjNTK05NRUVqY1pQOTlGL1NPU3pmY3FuWmFqd3hSZnR3S0xqTHFmR3gx?=
 =?utf-8?B?QTRIdzNCWlp0UHhlalo5WFBNTEhzRjIwVHhmYlpCUU44S0xJRXh2aldTQ21a?=
 =?utf-8?B?ZWlEMjVlY2lTZWZqalhsWlBPdmk0aG9JaUtuMUJBSG1SV0Z6WGFrSFRoZmlC?=
 =?utf-8?B?aEw2aTIxMEsvS0IxYm1uYWoyNmdMVDJHeHNGelcwYzhzSGduUGI2LzBtNUJH?=
 =?utf-8?B?NmphMXhCOGVCM2tGM2Nrc3ErTWJXSzFjUzc2SjFvRm12Rk9hOGZjQVE5UFlI?=
 =?utf-8?B?VUgxMVkyT3hlUTR2VjZpc3NuUUJRT2dHWkR4OWNmQ2JBMitNWmh3VDFvcEhI?=
 =?utf-8?B?U3FFTTM3aU4wczJpR3UrajFreHEvRU9VaWhzT3lXb203d21vNDZyU29xb2tL?=
 =?utf-8?B?WkxuOXdQQkZmaDVkZ0p2ZjEyQmFidFF6ejJ2NDJ6SFlXSDdIdnRwY3ZUZ1FI?=
 =?utf-8?B?VmxaVlZUSm5Nc2wzRXpjTWVTYkp0anJmU2NNZTlrMFFJMDVieDdUVHVZd1I1?=
 =?utf-8?B?ZEsvSmJxcUlhVis1bWNIWDJ2em5tak15TnJQb3NzZG5sWkJnZEJhTXQ3bEQy?=
 =?utf-8?B?QUxRRS9KTzdDdzVkRG9NMWRZQ0cveTVTYTF2bDEwTzBHeDYzQUhTVnVhYVYr?=
 =?utf-8?B?WDh3ejdtUHI3Q01wQWpLdUE4Y2V4Y3hFNGJtQWdUbHFRbzJyZHZLZGZOMlR1?=
 =?utf-8?B?RWUwMGNCVjhLUHl1VXhtNGNmTGpodGZvRkxJckxvVzZoQlFBNXVqRHBSbzNq?=
 =?utf-8?B?MDdBbEJjZDVmR3RPTDRpYU5NUWxhY1FCRWEvSGt2dXJWRFdTRnp5Nktnd0dP?=
 =?utf-8?B?eHZiNmFDOXhlZ3JOWTJLVytSMUJlQXpOSDRWMTQvRTRpZmQ2QUNNdWU3Qmw1?=
 =?utf-8?B?alFxTXFMdGhPUDV4Yys5b01id01UTk5KdjduNnV1S0NLMmY2blBuOTR3dUZo?=
 =?utf-8?B?cmVWbjVkc0NlelozOXA1aVFPanNGNkREUU8zamVzVWVOYTZ4QWZMM0JURnZz?=
 =?utf-8?Q?85ZSDSzcWh/77RA0lCtMdTDaO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d37980f-5359-4ac7-9ddf-08db8c4a5ac9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 13:31:58.2950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6op0/GYmXmZFjdQvBsUiLqarGRcn14knfcvyR8gby9jWesvB4iqWc5JLu8otkQhtsDNkOdbtI7lT6mTfPaNB6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8480

On 24.07.2023 15:16, Roger Pau Monné wrote:
> On Mon, Jul 24, 2023 at 12:43:26PM +0200, Jan Beulich wrote:
>> On 20.07.2023 02:32, Volodymyr Babchuk wrote:
>>> @@ -52,8 +66,8 @@ static int cf_check map_range(
>>>           * - {un}map_mmio_regions doesn't support preemption.
>>>           */
>>>  
>>> -        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(s))
>>> -                      : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(s));
>>> +        rc = map->map ? map_mmio_regions(map->d, start_gfn, size, _mfn(s))
>>> +                      : unmap_mmio_regions(map->d, start_gfn, size, _mfn(s));
>>
>> Aiui this is the first direct exposure of these functions to DomU-s;
> 
> I guess it depends on how direct you consider exposure from
> XEN_DOMCTL_memory_mapping hypercall, as that's what gets called by
> QEMU also in order to set up BAR mappings.

Fair point - it is one of the few domctls not covered by XSA-77.

>> so far all calls were Xen-internal or from a domctl. There are a
>> couple of Arm TODOs listed in the comment ahead, but I'm not sure
>> that's all what is lacking here, and it's unclear whether this can
>> sensibly be left as a follow-on activity (at the very least known
>> open issues need mentioning as TODOs).
>>
>> For example the x86 function truncates an unsigned long local
>> variable to (signed) int in its main return statement. This may for
>> the moment still be only a theoretical issue, but will need dealing
>> with sooner or later, I think.
> 
> One bit that we need to add is the iomem_access_permitted() plus the
> xsm_iomem_mapping() checks to map_range().

The former would just be reassurance, wouldn't it? Assigning a PCI
device surely implies granting access to all its BARs (minus the
MSI-X page(s), if any). The latter would of course be more
"interesting", as XSM could in principle interject.

Jan

