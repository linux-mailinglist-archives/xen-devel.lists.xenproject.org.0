Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD7D710639
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 09:24:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539316.840070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q25Jw-0000WG-3Y; Thu, 25 May 2023 07:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539316.840070; Thu, 25 May 2023 07:23:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q25Jw-0000Tk-0o; Thu, 25 May 2023 07:23:36 +0000
Received: by outflank-mailman (input) for mailman id 539316;
 Thu, 25 May 2023 07:23:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q25Ju-0000Te-79
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 07:23:34 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0be6e153-facd-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 09:23:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8576.eurprd04.prod.outlook.com (2603:10a6:102:217::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 07:23:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 07:23:27 +0000
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
X-Inumbo-ID: 0be6e153-facd-11ed-b230-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TfvEw/zzypCqkc5w8togE7vAAxNdOWTTfB55yNlwMUfhXSR4n8f6R+36NV4fi22quGv/Y5B1vbOQ1NJttOeIAJsnJ4r1LSiGUv2ozlbapn8OWQba7OJ1v944MMC+vLcDTGKNjx1ZbQg7bPuyVYvxE8WO6PBTENtlTXrcjtVdmM2Qgb+R8H2e16yMKfLzSlnUy4Nwkka6BR/0njWc0BUoKWR+r7FnYjqQByZToPSpwmFSjKbCDA1HsReQiWdPu94otHBL1chfsvdKCccQ0w3/Y5YmXcscidNgtBkrLEB3pOaOR2/kpXP9XYoSj4YXIS00lzxI2fGibLCbEXdIZII4Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s86RG9AS8FGHvqLTvKEg/XH5nVrjdm1UbFwo7Q5Z18w=;
 b=bnJCGtwdt4132YGkFAZ3zMCUKwyQ0NP/f/Gqdx8Zr5pz1DOsqUv1t7pqIOMmY85u57U075M74mmUAb5p5GRtIjihsoTc1I6bxAaQN7V0/XwWe2PJzDAezcI+oTVXYqwifcNDEw2vg6Z6YAaixZNqF+JyitFJQMq1+A20Mn753bfI0i1B20y5RWWos0J9Mw63kcZgUcUL/f3gOAHCBgsBDJZJlbr6X/roCs0UtPncn/EqzWsGtgZppKXcZmceev8TiDlYws+WxuY4Zy6SMrhcbREU6vOpvPTlG7SARJDz5XNHzlOR+dOLpg02N0yD6TFCxmTMvM4+eBEG/9WRNfTEfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s86RG9AS8FGHvqLTvKEg/XH5nVrjdm1UbFwo7Q5Z18w=;
 b=U206SHHYCwJK3Z3fAWnTab2wP3virKcXpb4yK7chR4OB9gcap1M3ypy073Pi8jPUzyindQr0VCNnznRwubvWznc0MsH1x5fdiy4MLwfDVVMe51g88jtz3SU5pCB12G5Rfv5ULRIRtvSlyMnULrTnHrnDfUsF8jJkXTUwBtIk6aVsuCHPux3pObj3UDJy+wtMMi59fRlpHmdZVWIWc1YImsh9pvrzHHJ+WdfoaexlhpSkGzxYAjgX3nzs8FLv6rpZ31rTfHK15249jAVFjL50chxQoXgCDl5/auk5j9PjV5vtgzUxk2BD7kR7WaS6Sdn5gZvBUVFVET+7y38cci7TcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8956af09-9ba4-11bf-a272-25f508bbbb3c@suse.com>
Date: Thu, 25 May 2023 09:23:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v2] vPCI: account for hidden devices
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7294a70c-0089-e375-bb5a-bf9544d4f251@suse.com>
 <ZG4dmJuzNVUE5UIY@Air-de-Roger>
 <614c5bf4-b273-7439-caf7-f6df0d90bf87@suse.com>
 <alpine.DEB.2.22.394.2305241627290.44000@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2305241627290.44000@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8576:EE_
X-MS-Office365-Filtering-Correlation-Id: 645d6067-49af-4a4a-17da-08db5cf0ee9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XB3j86Xg4FmEo/c8T2wPXQPoHvif29LwH+5InmCS37RGqWlcjTTWSvSdh2wfNoN+iuSnvkRgnZGiiQNiXg2PnXJPrW9XEbv1+ade+LipCwvN418ZDgiBBhT/ohW6cj3YcbsbSXQ1+fwOLKKYqeMi/k6iqs9hPY5EZxcgbMKCgOxOhYMWKwQGl3Z39orXt7JaDMvk21JUiZg75FyZvf9vhbx2k8xJ/9pMtd7JcPnusor6aAPTKCwd2ci4wgOoeaMjn5DHwFH2z/oRGwOrtyXX6AwC2ioOYr56WQ5cpoeBmvulKNZdX5tDe0JnaaBTp74Wnoum+trNQrlz3WDwoj53xh2dUkzEqI+xBs05coWUQKMe7mIAvQU7b6ZH/h4eEYj3CcKgLZC5pRxnhSES9ouyV3/r85fBf0tZfwis6p9J58V6NPoc8PtvRZFjIrFGo9asTG0zXLSjRjwAMah4O01nk/TAwRv3kNqNg9LN0mJR/UchIzAbt0g4jbgjes9R7agyoiSpJ8nSxsO06E8j2pfNuIu2jvsydEF1DJz4C/8OYClX0VuR+k0pzFg5sIVC1H3v8Ad6FP3edHtJkVDT5RjSDhTF/b1ZLfgqc/lfGMLeBqDv+x77CKvx9tVE9ZO/1rM0/J/neqocyQRMnVaLkzYTMg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(39860400002)(346002)(136003)(396003)(451199021)(6666004)(31686004)(54906003)(31696002)(38100700002)(83380400001)(6916009)(4326008)(36756003)(66476007)(66556008)(316002)(66946007)(2906002)(186003)(41300700001)(6486002)(2616005)(53546011)(6512007)(6506007)(26005)(8676002)(8936002)(478600001)(86362001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXUrK2k1U3lxeGY3M3A3QkgwZGU5bGpZRkNyYWRIbk1mTVBwcEwxWmhZQXdq?=
 =?utf-8?B?VHhzY0s2L0g3U0lvRHJLL040MjZ3ZjIyRGhZVVRwNmswQmZ6RmM5Z0poNnFJ?=
 =?utf-8?B?R00xV2tJSDIxRzd0OGxmZWZIOU82ZUJYa2RDK1dHa1RiWTJWRjQ3SUd4WFpl?=
 =?utf-8?B?eFJxVFgwR1dTY1JKNEhMSEpvM0ZBLzJBeHh3ZFVjYzJlM2RqQUx3eFhUOFZU?=
 =?utf-8?B?bGJteWEvbFBKSjlScUk2elNvQVM0Y0tLenMzUjhmeHRZbkMrZzZENmp4THVz?=
 =?utf-8?B?YWU2ZUJ2c1FCZ1JNYVR1a2x5MExGMzNhc1U4RmxSTFV0RnkxOWZrSEhTMHZz?=
 =?utf-8?B?ZE44Vk10RDI1WENjTnBsR0ZjQldmZjk5dUduMVJGV3cybnJIR3FWN05RVTFW?=
 =?utf-8?B?UWVpaElpYkpPU28yR3dZQlk3Q0RpZWVlTEY0SkRIVVNmc0g2SWloVFFHcEZt?=
 =?utf-8?B?cjgvRTUrY2xzK0V5cVdpY1VuVGpQd1ZUNU9NUTFKMU42TnBqdFVUbTVhMFN2?=
 =?utf-8?B?V0ZwQ1ViTkVqUFNXbHdLWkd5OEhWNHZhSDZhNXVUSEFSUkdBVE00VTd2VVBj?=
 =?utf-8?B?WndCcGR5YTZFSzZSRGY5Ylo3ellONFE4LzNmaFcvbElQWmNOeVdoMTdTbFpr?=
 =?utf-8?B?NC8xTGF6anlnV2N0NmJZVmpIcXVKUjB4ZXlRQVMwVGZKaVV1S2dDb0JJeUtn?=
 =?utf-8?B?Smg4Z05wUm90VS9WSDduNUVrcTA2L1RPQk5nQTJTbUJyeUt2ZXo1Mm9OSmJL?=
 =?utf-8?B?Sk9TNmcySkE1RzRlTUN4MUJQR2d1R3gvMXQ5WStGQnBSMFdJTmVzY0ZCWFJN?=
 =?utf-8?B?cDhHN1UzV0E3UTNNakUyK0RIMWZid3FuVTZxRHlTcENiL2NINy84aWRLOTVy?=
 =?utf-8?B?TTdTS2M5Y1V0aGQzeFNFQW5MMEFhQXB5Z3VwcUMyOWZ6NUNXYUo3UlBLSzFL?=
 =?utf-8?B?OVB4VTRZVS9xbExCekN3Mk44V256TTFEajNZNG5EUmtRbUpBRlNHbHNDVkJ0?=
 =?utf-8?B?L1VyZ1EyTnEyN1RpaUtHKzcwZytZRkR5N0hCTkhiTm9SSFhQNndpcFZON3ls?=
 =?utf-8?B?dmFCMVdhS05zczlFanQ2bzNOTHM3RjBWWXJ4N1BQMDliR1ZFZVdsdHZqcVFy?=
 =?utf-8?B?Z1ZQd09sS3hmcElGQm5QOHFSbW1SQzJxL1RRczl2ZWYxbnppL1I1dk9tY1V4?=
 =?utf-8?B?ekVSQlhuSWdldHgvMlZYMFVSbk9Ham8zejNjZXc5V0M1TWhPREpqbldSNEJ5?=
 =?utf-8?B?K3RuV3hPY1EzYnZqdmVrRjYvTlprVUwxYWxTM1FsUFZlSVdoUWZOdEtUNTNZ?=
 =?utf-8?B?VU9lT3hjSnNyMU1qQ2tWZC9qQjhMU1lNc0luWkF5dEFYZ3k0eXJFODhnam1E?=
 =?utf-8?B?K1FCSkZYaGpoakJvTVZXbDIvcWxvQ1haUlRTdURiaUM3SnBlSjF5RU1DaVdH?=
 =?utf-8?B?UnZCYXNzeTJhUVBpVGZrR0wxelRIKzhYUmMvSmJpNkJ4UGVCN0xnb1BXR0hX?=
 =?utf-8?B?ZDBVNk1RSmtvdVR3bFhKOGt4emduaE40S2NZVUlmRS82a2ZXZ2FSSlgwMk9O?=
 =?utf-8?B?MjhJb0NxRmt2T0praU03SUpTWEV6aUxFa3ZiMC9GQXBUVDRQREplUy8xcXFJ?=
 =?utf-8?B?TmtJaExIMUJUMld1UW5QSEptOXp2dmoya3dxaFNLWURFV0VNbGFTcng3VmJi?=
 =?utf-8?B?MndUMkt2R3FkNDQvaGtIaUpyZ0xBRmg0V0pRaXZGdVIzckg5OTFNcWt4eEha?=
 =?utf-8?B?MnFPOFBzRGdnb2FGUXVHUmhJYlZUYkpRalFVWWh5L3A2dU1jNmNZZVpoOGNF?=
 =?utf-8?B?WFhKQlE4MFVtL29JVWxMMGpSVjJSbGVWVW4wNUZVenpvTy9mZ2xUOHRXQnRL?=
 =?utf-8?B?M3VmZEFodUhhK241a1JoOHNGOWdoWURicStMdEN2NlJVN3haU2l3SEJiRytI?=
 =?utf-8?B?ZURYaFhCSUJjWWtpc2N6Sk1pekYwY045Q2cxSFFMNDYyZUxDczdJanBWK3g1?=
 =?utf-8?B?clJQQUZGQmwyL3kvc0U2b2UwcEM1d3B1WTY5bWxPQnpSYWZ1UkxyQ1MrOVBl?=
 =?utf-8?B?UVBRVGJyemhqOFFGU3N3Zjl1T0NZMTdyVGNoQWNWbW0ybjlWY1AzVisvSS9F?=
 =?utf-8?Q?FsB4z+cYJDY4+BL6B0os3ZGm2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 645d6067-49af-4a4a-17da-08db5cf0ee9f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 07:23:27.0067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9bNCuAZjQhSb3hr4/BRKCUlokqKFFzilmluTsnkyN/YCZHuZCk7ZIiK1h/0+iv2z3vzz4zf4RteFatYil3ealg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8576

On 25.05.2023 01:37, Stefano Stabellini wrote:
> On Wed, 24 May 2023, Jan Beulich wrote:
>>>> RFC: _setup_hwdom_pci_devices()' loop may want splitting: For
>>>>      modify_bars() to consistently respect BARs of hidden devices while
>>>>      setting up "normal" ones (i.e. to avoid as much as possible the
>>>>      "continue" path introduced here), setting up of the former may want
>>>>      doing first.
>>>
>>> But BARs of hidden devices should be mapped into dom0 physmap?
>>
>> Yes.
> 
> The BARs would be mapped read-only (not read-write), right? Otherwise we
> let dom0 access devices that belong to Xen, which doesn't seem like a
> good idea.
> 
> But even if we map the BARs read-only, what is the benefit of mapping
> them to Dom0? If Dom0 loads a driver for it and the driver wants to
> initialize the device, the driver will crash because the MMIO region is
> read-only instead of read-write, right?
> 
> How does this device hiding work for dom0? How does dom0 know not to
> access a device that is present on the PCI bus but is used by Xen?

None of these are new questions - this has all been this way for PV Dom0,
and so far we've limped along quite okay. That's not to say that we
shouldn't improve things if we can, but that first requires ideas as to
how.

> The reason why I was suggesting to hide the device completely in the
> past was that I assumed we had to hide the device (make it "disappear"
> on the PCI bus) otherwise Dom0 would access it. Is there another way to
> mark a PCI devices as "inaccessible" or "disabled"?

I'm no aware of any.

Jan

