Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4564D64A403
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 16:19:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459722.717490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4kaU-0000XD-O9; Mon, 12 Dec 2022 15:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459722.717490; Mon, 12 Dec 2022 15:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4kaU-0000U8-Kj; Mon, 12 Dec 2022 15:19:26 +0000
Received: by outflank-mailman (input) for mailman id 459722;
 Mon, 12 Dec 2022 15:19:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8fsB=4K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p4kaT-0000Pz-RZ
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 15:19:25 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2058.outbound.protection.outlook.com [40.107.8.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c7645cc-7a30-11ed-91b6-6bf2151ebd3b;
 Mon, 12 Dec 2022 16:19:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7146.eurprd04.prod.outlook.com (2603:10a6:10:127::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Mon, 12 Dec
 2022 15:19:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 15:19:23 +0000
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
X-Inumbo-ID: 5c7645cc-7a30-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eeE+vSrpHILBVY0kp6SgCtbK4avE+ue/ENXreDo3ZEBX9BGGoBuvndk/Luhr4SUlYb1arDp9T9Zr+RvbdD2pAIgwDWtDvgml7kAsDy2Cv6rk9r7tkLkT8fsvgDCGrtNvwPp4iZtq6BvIGl/TG2U8aghs1vxULbe91ErFH4j1Frwe6MKOV3pf6KnVS6GpW8RkVlv84yXp7lW+LFZVjhrsAMbapA2Dyqod3MflqQsXgsbO48tuafM4PJUWqGubtpEtUBpYev5cuARHL8pS3hUaUE0GewCIp0YpIqWQ1UuzDR6Ag473aIeIcmfuFxGV+YaIrHJEgzCS/jXmnnMJkhWUwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCrI+FvUuYFwOEIpx25ixdeuHI8r9x4ZL53O04LkOIE=;
 b=MViEGYynCiLw0Dnvoo1mthF1U07wwA4pdqIXXwqFC/oVcxHxfckGGCti6MuCytFz4uN1060BNL/1IWvqi3RLR6FJSfFZCD3AT46P/nhwJMhw1/MP4jOVIv/o5UNUQW7GdfX/iio2z3Sk5Y4Ubt4CexAa7LAHzCEFDA7PeWhkxKIlUfOhDXdxsnXRb193OTIm6FmFjb4HsztEy6Kcax/HNBVsiKhDk2620JJrE+2Jz7dc+FYWmhP/ERhmHqu03tGf9ERUbo5J8h/7GYuzjyOf6OHAGOb9qWjVFgpcA23PfVFMtd3/B79ep0mBvnhWdcKHLcj4RDtMZlL+eHl6/f+cJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCrI+FvUuYFwOEIpx25ixdeuHI8r9x4ZL53O04LkOIE=;
 b=3K4dwEfWzRG0Dmd+wr61vFedpCBfB92TegHrTySwFaAsNzX9EFNsI4dVuJt9r6hqQuhrN9zcUzwX72W6xiZsWKF9RfFc1qJcVpUWTDgw/6V0MrxpR9JXOk+pzTHvt229A1Ec6BNN+3k9/zf9d1KTzI7rKabAruWzGN5F/Q7yTGRagIdY3y7LdEAXvebERXTB3V2BMRsSDL/21QbvDyVhX2A/mJhqVz5OIHk3/dH4IEq4WJz7Plpfm1rXDM94Aae1kCI5hnKP/39J3LmFlWjJ8B4lVCb0Gzya6ir5mPII54GJr+xqCVDWxLUln/ZIBhrq/fGt3tsChIGYEGTJbnNLkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e4dfe73a-a0ff-54c4-054d-2044de1e546a@suse.com>
Date: Mon, 12 Dec 2022 16:19:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] Relocate the ESRT when booting via multiboot2
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <74145e57307e9b35cbdc296b22241e6f36405f6a.1670546744.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <74145e57307e9b35cbdc296b22241e6f36405f6a.1670546744.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: a1eeaf34-781a-4d50-eb29-08dadc543fea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JTKN/+FcqYlkvrJfhx3V98x2ew9P034wzi9BYP55EwWj7/6xdGBjfawXMCje2F9zOUYs9ntbSz6VtDOZLDYbQpY53v81k+4lmdsR+HLmFybqajPqUEO0KsBs8awTgsQkqD15DT6h7Sid9P/z7LKOobshw4t52pHuh0Ih/z2jYBhTZbdWa09ow21xhsQM6NnoUZ09E9Jghb8yzCRhGNBLMZ6bjPiqt0ol2urLxqKf190XJmHHXLVCFgzJgELj+YHmIiYzLDbGv4ThxxAMyUXuE3+8JCUdNWQu3MnV5YtB4Fb/jyvj+hW1FEL6mlMSBm4ec04DSFqzIFTobURRVg8nGKCrcdGjBYACqBK6DEMrA1hxEqQikTKFzLbjsGFxkPHSwrCzTe9zUvVUDtlXM6ljv9qJ1jN25Zqjh9AR6w1lRh6/xCGYQSUTLqmpOuZCXjYLpniuJ2DIPzq2JuZT9EnJSRth0N4fuOYBF10I5heETncyG6UpjkdbUt6IFM74urSV1qSVPYHiL01gAAMQXGokYWX3gB0B+wKPLjcPHhm+l1qWzzyf/Qaf/CjOq1uNx25FtpCOUHxRlcMo8o+Wnd1fXNarbhlGPYH50swTvBu6/ndp4YxpbYsCNz9RsX7jV/vLKcbEXjIga32EWi3JfK44X+orm/D5KnxSxCTzKytvJolr4rDVKEYN4pD/WG+EbBZBYBw3n1+yqkbl9hZmUmcvVoGSAskuzNzHdWVD9HYfoCU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(39860400002)(346002)(396003)(136003)(451199015)(83380400001)(36756003)(54906003)(86362001)(53546011)(6512007)(186003)(26005)(38100700002)(2616005)(6916009)(31696002)(41300700001)(4744005)(8936002)(5660300002)(2906002)(4326008)(316002)(66946007)(66476007)(66556008)(8676002)(6486002)(478600001)(6506007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUg0RU04WERMcXNTL3BKSnVwaXNIa2QzeitKQ1prVkJoWklxQi90bmlEejBY?=
 =?utf-8?B?cTRxV1B3TGJNdHE5dWdKMDNNS3V0MmxyV1pvNDI0TDBBMkNaYUJkcWZRelA5?=
 =?utf-8?B?M0VSa2Z4UUJ0NFF1Q3ZRQmV0blhFbW5CZmt3OTNLMXYrZkwwcTh5WXdkZ0do?=
 =?utf-8?B?K1p1OFIvNWpHTWZRWllsazVLc0VqdXYxKzdVMEx6WnpncS9EUVhBb2l3ZE9r?=
 =?utf-8?B?V1ZKQ0tjaWV3S01WWC9qeDBySncvNDVqTnZwWWpCdzdSekYrS2dzZHBVaEZs?=
 =?utf-8?B?ME0wZmxhckg5Qkl4RTBqQmRGY3dUWjN5MEJSUmxuWCtaMXdVVkIvVytJT0pM?=
 =?utf-8?B?MEdIdks5dTN1RG9VK3hWN29YVmFudGZpamVKNi9teDZ1M3VWM2dzMWhjZ2JW?=
 =?utf-8?B?T2Y1MnBPWFFXeHhKNUhwQnF5eW1nN3VubzIvUStpek9UTVF5OVp3UnVSdlc0?=
 =?utf-8?B?RUM3VnMrOHpONG84YjI2RE13OHhVazJTU3VrN2hqMUovaHN1Y0NGeUtlZlIw?=
 =?utf-8?B?ejVpZ1NkUmZqWlRxL25UZFRxYks3L2J3ZE4vZFdETXIzWnBVRXR5OHFGTmZi?=
 =?utf-8?B?Z3JxMWVMOWY4WUdzUWNSdXZld0JQYi9rYThzNDdYY1pXMjZ2UzhtSlEzWUpH?=
 =?utf-8?B?a3VPVjVCelV2TnU0elEzM0JRRTVnNlZ2UjhjaUQ3Z3Z3NGVxbklkaXYwQkZ3?=
 =?utf-8?B?TzJRMUFKMHAwK0tiK01MS2RCSk91UUlNOG5sSkhkbkNiTTNPUldjNzJKWllZ?=
 =?utf-8?B?NDNyR2MySCtVekZjcWMycjd2QzZKbTRBYTFsRHoxMGRPWHZEZkg5QXZpNlRM?=
 =?utf-8?B?RXBNRkdPaHVKNmx4b3VYME9qWk10Z1FWRzE0Ymdwa1ptMzYxMUt5V0E2TDYv?=
 =?utf-8?B?RTg4ZWtNMFM3STQxQWZKOTdENG5VUnFrR2Q2TUJwM3ZkRkFDZGJkeUVBMTFV?=
 =?utf-8?B?VFgvWGVsUU5HWmVZNDZja2FBSzl0Vkl2VnRTV25OS0ZZM1dWdGxQUlZHQk8y?=
 =?utf-8?B?dno2VGRmaXBteHQ5U1lPaTdxd2h1Vzh1VDJHUExlaXZCT2R4Q0RlN1ZVR3NH?=
 =?utf-8?B?elQ2NUFYVFhLeTcxek5WRlBacERPMUY5SzdKN291bWcranROM0phak5TcGJz?=
 =?utf-8?B?UzhzeStieElPRkVPdmVYWVNLNHZOb09xbnIwUFFNSWRjNENMa2RFZGZvYnBY?=
 =?utf-8?B?aWEvbEVVZC9OT0xrVmVXM20wNG9pZ05hQnFBV3lRbWxNRUFIR2dONDdyOW9o?=
 =?utf-8?B?NG0ycEcwZlRZdFE0cExQNksyQUUzTWJzT2tFUEEzVmxmNE1mVnFMM2lrV3dC?=
 =?utf-8?B?NDN0aW93UUVqcVNZMHRYSXoyMmorZEt0eWdNTlpUWk5UczhJay9TQ1BvNWF5?=
 =?utf-8?B?RUVXRnBEZTNHYi9Ib3I2ZFVPblpnaWhYTkVNYUtSb2NpMlR5WEFSbzFpaUhM?=
 =?utf-8?B?aFlXT2JPY1dOYjJRcHlzTEJYaUpKODFNQzdPTCs3WXV0TGVHelptOHRuVXZp?=
 =?utf-8?B?OUFOR1h1ejJKdUhGUXZScmQ2a1M3K2k1NUh3azdNVHUyOGNMS1BSK280MDFJ?=
 =?utf-8?B?N0d2WFdWV01lTUsweUFITzdIRlFSVXZsWTJUNGVmSitHVEx1bHdldFk5MGRu?=
 =?utf-8?B?SHpra0RwM3U0UFI0Qk1DS0FTMnJ1Zys0eGw5aHBiYUl0Mmc0QjJ4U2JzS21N?=
 =?utf-8?B?MS9Hb0hnNkZDSEhHWTZaYU5pTlZPMklhUTBPMGk3OHlLUXNRNk5JcEtDZXhL?=
 =?utf-8?B?Z2x2N2hmdHZxZ2tEUk9CWlJnZEtOaElNT3ZDTkZBWXU5c1paQmU4VTFaN2FC?=
 =?utf-8?B?WjV6bm52SXNyWWppWDhvZ0FzUHFEMm1BajdmMnFrNmRtVlY5cUhrb0NuSU9w?=
 =?utf-8?B?OThvWmVDbzJwckFPc3Jwekg2M2Jadm1LT2lJWXFTL0pRUDhDdkkwNGV1aTFL?=
 =?utf-8?B?U0pzcTBvVUhwTThMZ0Iwayt4Unk2UHFlbFpVSngzZlBWblpyR0p3M2NzakVh?=
 =?utf-8?B?SDE5RHBVZ0lSZzNPUjRncmFIV0N0eHdybzlYdS9KdWNyMmIwbDdQNWdNVEMv?=
 =?utf-8?B?Um9BQk52NDNtbmpjUGQ1UUpIMm04ZExPbGVtN0R5YlREWmc5NnRLT3MrbWFF?=
 =?utf-8?Q?hBkJ4I6j4Y1Lfo1X5SFikIr8S?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1eeaf34-781a-4d50-eb29-08dadc543fea
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 15:19:23.5163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X8ecy7lMjdjQ2y98Ysm/yzHw31W0vxrPEAce61MRiL4c+8DcZn+YkNzkyvqi9OOAvP0dPVuwH3Yl9zLaIozWlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7146

On 09.12.2022 01:52, Demi Marie Obenour wrote:
> This was missed in the initial patchset.
> 
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>

It looks as if, besides ...

> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -818,6 +818,8 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable
>      if ( gop )
>          efi_set_gop_mode(gop, gop_mode);
>  
> +    efi_relocate_esrt(SystemTable);
> +
>      efi_exit_boot(ImageHandle, SystemTable);
>  }
>  

... this core piece, the rest is merely pure code movement, with the goal
of avoiding a forward declaration. If such is the case, please say so in
your description. I'll add a sentence to this effect when committing, so
the remark if for future patches. Provided of course it is true (i.e. I'm
not overlooking any tiny change) - please confirm.

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

