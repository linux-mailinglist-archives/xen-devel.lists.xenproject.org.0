Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CCB757835
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 11:38:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565062.882922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLh9w-0006j4-Hz; Tue, 18 Jul 2023 09:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565062.882922; Tue, 18 Jul 2023 09:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLh9w-0006hP-FI; Tue, 18 Jul 2023 09:38:20 +0000
Received: by outflank-mailman (input) for mailman id 565062;
 Tue, 18 Jul 2023 09:38:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g6ux=DE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLh9v-0006hJ-Mi
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 09:38:19 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d379fb34-254e-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 11:38:18 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8055.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 09:38:16 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 09:38:16 +0000
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
X-Inumbo-ID: d379fb34-254e-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTR70kA3V7yh9k4xl79qZJzaf1EYHJJSUIA462krSkEIMXF3a/lTmHp1QLtI9zQht5Fey9Qcb6fmYEYdKSH7SPiL6TGOe72K+zJ0NYbFtLwVquq6oRxGLMWMs895x7BtBTY3ep2lrhJZ2nVKMF/piRRaCb598AnSj3pbq6T8qD9crqL1xttJWf4iRJkYEL7zCcwqP5a+LnKMGZDaNLVJOKdadTfitfEau0ifIVg1CSpw4Tv7HRiBf/itAiTm8oQvaB9JM/chenlOmvM8k0K9EwtZEyvi+TWHxDxzm9dMsJwmO1n4/x7lJaNDpFmIui8fGO1ErH1jZCmTPgANRWbaIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7TwtBQMoB/ADHaeR/9vVOecR+8XvixG9mM/INkO07M=;
 b=iQBwHx8i+Yq6X9joAr+LNihf8RxnAoQf5AB62Ut182bjZtdqzRWf9sO50BZcbN4jihRZisiBVWoGPb91RrS0EyMkPwuRuEFdelqcWWF5Tz41sK/rVgjimgFNK5kPmBn6ICCNUMjr0tYA4BVfRszHnUiYaTr5gVLhGbjJ0iWt06YxjCGLzQh/+QCdO7GiGXPywT3i9NY7fexrjepf8MYXit+s0/ZNYAi8TN82emPWsPbj3zx6UIwetJFQJtMiIbSbK501nXYuw7HOMPnMpMBrGZdBb4Ndu4Km26+V4yELaFnxCNGZYPITj/Lc0E2/QRRt2Zt23f0zXvAdVfR5HRSJig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7TwtBQMoB/ADHaeR/9vVOecR+8XvixG9mM/INkO07M=;
 b=O7IiB3mxbm2zhl39DwVneWozIFHnOkqNbmzXkL5W9XQwEwArxZoLdCPHTep3gzhJJuM9xDIjE7MXCXwo/9tpBr63kzsnyG9voL/2PhhzET7rVTsFAIra7bRHHNtR/Og0nt4v/M4L3a1iJ9oKXR5cnwYPeiQCohvDsH70b7hoVKz0Arr2WeDRCdORMFW1pbZmk+lSzMQrw6LPWDUOjmqbRRTeh+qdh5qZ55XyvuWENJijWICTtExERWl6YM/v/yE7RWg7PhrCz9gQcE/ca8/T7G4d4fc0e9L2uT+z4ovmlRBG4SP9RVW5Uujc2VQ2CYgjat9iu9CeEMafBRh0+Ak6qA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d9cd0bfa-52f9-94a3-0226-aa85d49a58a5@suse.com>
Date: Tue, 18 Jul 2023 11:38:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/8] build: Remove CONFIG_HAS_PDX
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
 <20230717160318.2113-5-alejandro.vallejo@cloud.com>
 <7e5bd2a4-d810-cc48-cf43-3ad64e501d55@suse.com>
 <c06920d5-763e-a141-cd68-dedcecd33da8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c06920d5-763e-a141-cd68-dedcecd33da8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8055:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ca5d9b0-0ca4-4e0e-67f0-08db8772b69e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HOKVS9e8htInIJfsmtt+e90h2eeGNuAVPvQ129RFYW4DY2cXcKke5r01W0+X0Kx1EM4Mbvz3XeSppOHCxuxe8LQqNOhfPVGEmQ5poqHzYNR0A++mQM1x6Og79H3ueRDSReM/pUHeWm/jV+78cEZKTVXNG4PHHs7R/YMBiy5MqimJIN84sB2vblY77rhacgZU8ijnJ+lcyyLkyxEtVEVcg+hdw/I79pHAk4JCz4mgLF/dXHaYA8MsofrCwAb0pBgLjcaG9mqMga1bDoGB9t7oJJSlMX2rhZo5W6B8P4ipl1f7Y0KIO3Uzj0udhu7b8mL2F0BtbWhxIV/mlEnQuTRArZTZqZg1kzXLvN1PHVpO/3XzTPU/9xoGDsEbnzeEJkMbsSrfwRtS+VvbwgqXy9N+vX6mQ8iaC0lQu0dvX6t1bK+dE8+KULMQftbQzyKNLXi0/Kx17I9qR8WNGgi6XaQPQkiVcMWd1l8OmWvhtL8PP39FS47SpB44L7DsJbOu4JhzYCbcYO8MvKEq7ibW6sCfZ8hPDONbJcfvWMSbsQh3NDu/rNRWOFYB4mPi1T2XZXxOVFjBHdZLUTJV/13w4rpxjk1NxffYHcsLWHkScvg/F6Y8EbrMhU8d2fk8J6+JbHbVOH3BlhdcqocMGHnWxZ3qVg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(396003)(39860400002)(376002)(136003)(451199021)(478600001)(5660300002)(66556008)(66946007)(66476007)(54906003)(4326008)(7416002)(316002)(6916009)(8936002)(2906002)(8676002)(41300700001)(31686004)(66899021)(6512007)(26005)(53546011)(6486002)(6506007)(38100700002)(186003)(2616005)(83380400001)(36756003)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUN4VVlEWXB2dXpzcTQ5YkVoNU1xZngxZUszWFo0d0dYUjFSb2VCSHF1dDRp?=
 =?utf-8?B?ZGYwNWszeThMRk83RVdoc3V5dnV6V1VXMmNiWEFMRHFaWkN1M243RnVCYTR4?=
 =?utf-8?B?SVk0T1FnUFkrYkJaQkFNWnBHakVBeU0vSjNZOXVUMXBpRzlieFFCM2lSWmhq?=
 =?utf-8?B?TmtwcTR5Y1lRV0J4aEY5T0o5ZUY5UmJndWUzeDd0aTZTM3psaGk5UDd6czIv?=
 =?utf-8?B?VFFkUEFTMEJ6RDgrRmgwNWFjUG54UTlKZHAvSlN5MFBYQ3Y1OFB4aFBwYUlD?=
 =?utf-8?B?VXRUQTJ6N3htRDlzMnVXYTdMWk5ZbWxxUVhzNTVMaUUybVZ4TFFWS1l1SHQ3?=
 =?utf-8?B?RXFEbE9OZnpsZ3o3S0NjOXVHVVlKRldDVm5yb0hnNFErQjlzL0c4U3kvUDdW?=
 =?utf-8?B?OFRYcEVYdzBZbXBKcm93MnBveXZlUnlLb1JWeHdrVXJON01PNWNadW5TVmpM?=
 =?utf-8?B?ZWRkb2J1QzczWGRvK3FBblpNT0JwYmdzWWR2UEJzWTMwTWpLZVlxZ2VWMVpU?=
 =?utf-8?B?VzNOb0xHUHkzVTJQT2JCM0lUYmJiWUp2TkNJNHlFUFRaK2dLNjRrYnYyeVc4?=
 =?utf-8?B?aUhBVzJVdzJIV1NnQ0lFOXA2SFlINnp5Z0RtSERMUU44c29jYVAyd1I2b1kw?=
 =?utf-8?B?ZUptNkhVWGdiYThQd2tCazdnYUJCODFMMnN3SDNaVW5Zbjh6K3NMeCtTU0xj?=
 =?utf-8?B?QStSSjVhTTQrajNWVUE2RktLRmtqRG1oNHFhT3RSb2hEdnZ3RjdyeHNPVXpG?=
 =?utf-8?B?L2loT2YrOW5DKy8yVXBITnB3RkIyN3luK0VwRUN2VVhvcThMV005K2dUalND?=
 =?utf-8?B?cytIdzU4Qzg0V1RPaXJORUtNQjdSaFBZdmdLODlXNEltU0ZEcTdIS29Hckgz?=
 =?utf-8?B?ZVA5TnE1L2x2amNTeUVwa2tFbFMvS0RCdXN0K1JYWEMrYTdjZUR2cnpSYlh5?=
 =?utf-8?B?S2srNzBuNGVXUk5XeTRIcE5vSTU4dlQ1aE9VMnFtenNmYS9KWWdDQW5NSE5X?=
 =?utf-8?B?ZGVkWGNpVDBIRjcrTGlSd1NoTDlMUWREbVd0YWxkZDVVMWxQL0Y1a2dBQkZt?=
 =?utf-8?B?NC8rNlNTcXNLUStRMjZZbnRwSk1HK05tTGo5L0RURG1JTkJCaTJBWlhDYzdP?=
 =?utf-8?B?bkhIL2oweWdUb1RvWnJabWFqSTdnUzJJenhkQ0xVb2pVWWlwM0RPQTgxOGty?=
 =?utf-8?B?OVNBSWhZQ1lzeEMxcWpoUC9qOWJQZDhpRkFWZzhZMTdRREFLSS9teTNDS1JI?=
 =?utf-8?B?UjJRaHJHN2xsSUFLMEQ0RHJJZE51dW9OVTAzT2hUdDJFbmdqSVYyUEhFa2Fp?=
 =?utf-8?B?NVN5b0IxVlhiZTdGcTdZTXJMbkt6RkYwb0tVWVpaaEZkbjVlbndlOXNDaWhH?=
 =?utf-8?B?dWdSOFhQQzg3VFdRM2d5d0hlbWRGZmlaRllmVG5lcmFsaUw5VDh5eHM3T2I1?=
 =?utf-8?B?MktybFQ1eWF6SDY0ODhYa1BvbStGVUJXUFI0aXpwdVFJcXBkYUhKR0pjRVZH?=
 =?utf-8?B?Qjh0WTNoRXQ0SkFQekF3R1Y5bmpHUHNIalp4a0dyZUdrQTdpazhaQnphbTl4?=
 =?utf-8?B?Yno3NlZMZE5ZWUpHZHIrOXprZlhlTXpnYzlwQWdJcHpFQ2ZHa2tOSVhuUktW?=
 =?utf-8?B?dC9pQXg3RDN1MlowbzNCODFrVnBSWmdZL3ZvdUVIbHE3NHlWV2UzSDBFK0RY?=
 =?utf-8?B?K0gzYTkvSXBTZi9DUFhNVTd2WVQrM0lyODZ0NmR6UUY5cEszd2RTaHBBRXJK?=
 =?utf-8?B?aTZlSkVrOFRJYm84cTVoS0ZZSW94em94QkM4Z2oxUGVDQnlldkpJOTB5OGpt?=
 =?utf-8?B?cVRXTU56cHZNMTR1SklCYzI5UUhIVlBtV241bi9xOFlFQ2FpbnZpNXVCVnQ4?=
 =?utf-8?B?L3hKTUw4MC9peVIyZzR5MDZ0dG5rSEMvOWIyTGNVNVZLcFJuRFRXb2xlKzhv?=
 =?utf-8?B?VUhQdm5BTHlNRmNpSFJxNFRRYlNxM2dtUGEvRkdndDlXUzluQXliUkY5UTd5?=
 =?utf-8?B?aGVHaldaSkc1bWlRaXd4MmZOUFpRWkczTDAzYmtsTFlRZlBEaG9WUWJYekRl?=
 =?utf-8?B?SDJGOGs1ajZTcnFWOVQ2TGwrRGxacVZBRmpmdXhRSWU2amFjUXZlcHR6UDdo?=
 =?utf-8?Q?FmP1Tk0yx1r870BREIbgz++Qq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca5d9b0-0ca4-4e0e-67f0-08db8772b69e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 09:38:16.3753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MJ0zMkjClZidR5Bvs8uWnPoOqLRDqAO/4JJFbku8bvvdoB30qqzhADBWgkV/EwudCevHUQxAvKq1Iwd59Sk37A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8055

On 18.07.2023 11:35, Andrew Cooper wrote:
> On 18/07/2023 10:19 am, Jan Beulich wrote:
>> On 17.07.2023 18:03, Alejandro Vallejo wrote:
>>> It's set everywhere and can't be turned off because it's presence is
>>> assumed in several parts of the codebase. This is an initial patch towards
>>> adding a more fine-grained CONFIG_HAS_PDX_COMPRESSION that can actually be
>>> disabled on systems that don't typically benefit from it.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>> On its own I don't think this is okay, as it's unclear whether it would
>> affect RISC-V or PPC in a negative way.
> 
> Neither could compile without layering violations of PDX logic in common
> code, and neither have got that far yet.
> 
> Now is an excellent time to be doing this, because it removes work for
> RISC-V/PPC...
> 
>>  If at all, it should only go in
>> together with the later re-introduction of a CONFIG_*. Still I question
>> whether that new CONFIG_HAS_PDX_COMPRESSION (which imo ought to be
>> CONFIG_PDX_COMPRESSION) then wouldn't better depend on the arch-selected
>> HAS_PDX, such that it wouldn't wrongly be offered to choose a value when
>> compression isn't supported in the first place.
> 
> ... although I do agree that the resulting option shouldn't be user
> selectable.  It's a property of the architecture, not something a user
> should be worrying about.

I disagree. Exotic x86 hardware may or may not want supporting, which
can only be determined by the build meister, as long as this is indeed
meant to become a build-time decision (rather than a runtime one; see
my response to the cover letter of this series).

Jan

