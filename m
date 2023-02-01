Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 190256862E2
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 10:31:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488229.756210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN9Re-0005IF-E7; Wed, 01 Feb 2023 09:30:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488229.756210; Wed, 01 Feb 2023 09:30:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN9Re-0005G5-BL; Wed, 01 Feb 2023 09:30:22 +0000
Received: by outflank-mailman (input) for mailman id 488229;
 Wed, 01 Feb 2023 09:30:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8OZ7=55=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pN9Rc-0005Fz-Pk
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 09:30:21 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2083.outbound.protection.outlook.com [40.107.7.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b195b07-a213-11ed-933c-83870f6b2ba8;
 Wed, 01 Feb 2023 10:30:19 +0100 (CET)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AS1PR04MB9700.eurprd04.prod.outlook.com (2603:10a6:20b:473::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Wed, 1 Feb
 2023 09:30:17 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::bf72:b6d5:ae40:e192]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::bf72:b6d5:ae40:e192%7]) with mapi id 15.20.6043.036; Wed, 1 Feb 2023
 09:30:17 +0000
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
X-Inumbo-ID: 0b195b07-a213-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2p9BN4x+iFuVaExdg6k77YJleSlv2se5R2I3E682ztZOv4t+KilkAsbYpiCP4SGOkfsXiwE9KrwJJJj1n10sApOy5X8mSOfTAQ2Ks9i5tWFgn5l8FiCNvWQefv1iooQcoBA8KffBWeB8nLV1a5QUc5eX0s6h24f5cxRpwAVZEID17BX3Xpd1O/YYrrtdXqBhncvJlConUQIRl9As0Gg/g6BokSEJeF8cRVVSB5lT3w8A4+NLsXY0bf+0I+bXmPx24MN5yNsBhGQdA4Ag5CmyS8fcp/MYvVDV3qV4dYpIpS0Gry17AUmfHAvyHxEf9MeGFET749QTjBIqSi7YRbZgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTLRIiWcvo51/3o5VlJ0WQIdoSCIxoUaX4X6Ha3xogo=;
 b=bG8OhZu3SqJkuEl4vEzbRfvjDHOQZxmVDlDIY0YrUwKUuW2WlU90vkx1x1kD5nBF8PLaqT/evay2UXfSu1oaSIENJnlpWtqLKBI/HvaGQfF+M4jsbyrUVKlCwhAlCcoNKKO/JdcBoQ+fSbnS1SLhb4w4d5L8BHoF5EM6RFnNv2ae6EO8t3lF4t6c/gcCYJCbPl6LvNt9HPQn8lud8Gs+S7D3n+dEC4NsaZowiTsp0s4r0q+Dnzwz9cOSs9eUaEtXkWCXlw/bOTh7u1C8FwkAaYDAeoD/XflYXfARHdCFrv0Bihuqx9M6iMUqs2EkRJo/WAkGiCrYDxTqHcZ45I8pDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTLRIiWcvo51/3o5VlJ0WQIdoSCIxoUaX4X6Ha3xogo=;
 b=kZqb7FtOj09QA8isnkUVHJUfFCKjtc5/tSMTHKgEfoOPB8zKQQpHCKKh4jk4GXfAJr2j5pwySyCwbsBgAKz1uEDOVhbrWsA3PPgEpG6m6vMtKwjdYKNIWG4O2CSnhoUO6d3XrIHJUDYA79W0+LiCStR5HgVmhRO3+tFO941lHM/uiCeMZfB0dB/gzH8exh7eLtR0Ra6PQJnHVOML1wtOgsfYxWHb5e2ISF4U6FmxLBh3caWvntvBsIYheB4sFuvNlIFbX2gZD7fXiBB82HxsP/kr+q89FUIaFOc4pynTMUEHgXVoDQRArA97IyiruWNzM0DX5/Gmk0LGgkYskX2FNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <34649fa5-4676-1e45-e1cc-ea57d7027c5f@suse.com>
Date: Wed, 1 Feb 2023 10:30:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 2/5] x86/iommu: make code addressing CVE-2011-1898 no
 VT-d specific
Content-Language: en-US
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Pau_Monn=c3=a9=2c_Roger?=
 <roger.pau@citrix.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230124124142.38500-1-burzalodowa@gmail.com>
 <20230124124142.38500-3-burzalodowa@gmail.com>
 <BN9PR11MB5276023EB640F1CE9DD72BEE8CD19@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BN9PR11MB5276023EB640F1CE9DD72BEE8CD19@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::12) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AS1PR04MB9700:EE_
X-MS-Office365-Filtering-Correlation-Id: caeb639d-7ec9-4af5-7c03-08db0436ee34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oxneE1vImDf/nbd3dfRfg9YZmaBsduQ2stdkTKqpcLgMuLkffT6hwH0cTdYPoau7991F7ZOZ9tVbYRWgSgo26DulyGbS1HLGuDQM+S521E8pcuiyz37P79K+oeYtAXd4Opqpv4dcaEKbyyWy2UKgLbp3swEOVi0cE9XccjDhhjb0OEQF4+CS/bDN9khN5lMsqgBErkXM3/0cbAoai+5yQ7+h1ACQODIUFKYhB1cloDlUFkD/khjhYAQhawLvmJs7LgluMht/LsqHWFCgeotHA6kxsbAlagsfPFUp5d+kB2sPkJjtPhWtZ3+5UInl/A3kLMRqTO8ZZWV7n9/EobDh8T/KAzQQN+0Sx7HTspMoZP/Zr+hQjDdEwPThkgJCFB3OfZJuKHNB4i+KhoRmdWYLdE3sfFo5+9+whshRjfjcxdkFtcrgsBDLsQyniT69aWPxeNp2AJWgqR1XskMD9QZgPhysmzKS8G0RZG3Xs4gDFPjfUhklq8HxFe6E/lJ0Omszwlh8gq3QBj7z1SLKFl2nyJ6XY2GlIOQn//IDznm4gC4Jo7tT6IIqYvihS9VhQtBtYCc9GH8DuoLXbAuWVIPP0ie2o68VbFf3tW/qZY5vjf8Ytu8JOohTTh1XuESPZ/rf/qPg5yYQLWdcaAD764hgh8En2kPWaBpYZWjWajufyQkwOu5PnkHxxG6s9nn3ymoMKt4m1D9GTJCtTXi3oEtgezR8H7HBd/aGJhU1AxIrPCo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(366004)(346002)(39860400002)(376002)(451199018)(31686004)(66556008)(6916009)(66476007)(4326008)(66946007)(41300700001)(8936002)(8676002)(83380400001)(6506007)(53546011)(2616005)(54906003)(316002)(38100700002)(5660300002)(31696002)(186003)(36756003)(26005)(6512007)(86362001)(2906002)(6486002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MERLTUlEc3R5U2ozdHp1U0hkNjhFdHRNVWNyaTFzNHROdjRtUXcwZi94NTFY?=
 =?utf-8?B?Y05PUXNCbVNlcmEweE1FRlpqNk4rV3IzMm5QcmVMSXhNbkpyT2hnTkRHWmda?=
 =?utf-8?B?RzZ5WW1VVk9BVjRZM2VqcmpSZGd6azBWWkFJZTQzVHZmbHBHWDhvQWJVOFlz?=
 =?utf-8?B?ZTE0UVBtRjBEb1JxMnpJNWJVU0c3TjFGdUxoT2FwcStremVOVXRraDQ5d1Fw?=
 =?utf-8?B?bTkzOEplVFptWHJHUzQ5VWtuMm5FZW1ZaHhoLzFhV0xMV3JBVGVnaUozTTVG?=
 =?utf-8?B?cXhZNGdZZStQMzBWanpyeGZ0UFdaYmFDcHJ5dHVFNk9RK0tweVFTazZkSzRa?=
 =?utf-8?B?SDlZN1BDUjlLU0twSlNFTE1QQU1SNG9BK0ZVYWNYcFpuSmdMbFYrSDFudnhK?=
 =?utf-8?B?d0kwWTdyamlPcUJTUS9QMXpheVhNdHQrWnRkd0FWRm9Cd05pZENlNHFsczZq?=
 =?utf-8?B?N3cxbTdhaE5OU2d4OUZzd1Fpdm5WeGZDVXVYeG4zcUg5amxYTlJreE1HYnpo?=
 =?utf-8?B?NUdVK1RsRG9MWmovY1F6aG1iYWIwNDhkMjcwalc0UjNsWmdscWFJWGIwUDVT?=
 =?utf-8?B?MWp3dld6Zmh0bDNOVG9zd2RIMzFINlJiUFhEeW4zcC9WOS9FMzY0WWg3R2FE?=
 =?utf-8?B?WXBzc3NEOG9HcXQvZSt0NE5Lck5yd1pJQjN5ZmRKTGdOcVhQbkJxeHR1aXNo?=
 =?utf-8?B?aXJUbGtoYW1Ed0Vnd0pmR1FJZ1hYOVJCSlpFYTNpT1pVY0FNcjNTbU5sbGRD?=
 =?utf-8?B?VytDV3lKbHZ1bDNHM3h1OVRVTE5JMXdGZEFnWStDT29XeUx4YUZXM2tyUmEw?=
 =?utf-8?B?b3J1ZzFiUHRsSzY3SWJCN2hBQmNmLzRJQ1l0UWVSWTJJZTU1ODh2eUFRVGJs?=
 =?utf-8?B?eHUzUDhUMFlNektJcEp5T0dtUHU3c2RMb3FtY3hMTExSZ3VCUzRnL2I5eExx?=
 =?utf-8?B?MDZZRkRmL0dNR3ZKMTdxdUZ6YjEwK3RxSWRiZU8wcTRqZUs2TDhrRWRzUUdY?=
 =?utf-8?B?YVRtdFFmMXN0ZFhaczJUa2NZTld0enhUNlNYUDI0VlZZZ3VVMnZ0TExzclB3?=
 =?utf-8?B?cnpXNWxRcFhGQ3U5UG82dWhxYnZnSmdXUzZjQzUyUnkyU080RWYzb3F0N01G?=
 =?utf-8?B?L1ZNZ2lmVzVGVmNoUWI3MThrdWdMLzVocTNMZUFlaTlmUXJEYWp4OWhacitD?=
 =?utf-8?B?ZGJSV2pDTmVpQytMY1RJRXZJUUZlbyt0cG9oa2dPTmJjZENoN3ZOWmthZFcy?=
 =?utf-8?B?eld1U0x0dFVCUTJENkFucUYrdS9pUnlLVm9YZVh5QzhBYWZvOWtSS2c5Sk1W?=
 =?utf-8?B?SDRmRlFHWG1uSU4vVXBrWkZ3bGZYZXVlaXVid0tnaTJZTzhDYVNHQVo5Q3Zj?=
 =?utf-8?B?eG9qdlRHZE5SMzVpclpjaENKb1U1WEtuZFJ1WnBUYXNET3ZCWFNwWUJxY1Bw?=
 =?utf-8?B?QTQ4ZW5jVjZZN29uOGxST2hGMFhBMlZGNFB5OCtnYlhmcWQ3K2FuV0ozMGlk?=
 =?utf-8?B?bmhCTTlRaVVmaU9kdEdsUlJqbWFrZ3YvMFhtY2haZTRkV2ZBL0NMQWZMWVg1?=
 =?utf-8?B?NElmRkZjQ0JweTBBMFNZTHNoQUFDTUVhTlBleUZSVEpGKzNaTDdqOUJNZCs2?=
 =?utf-8?B?TkkxWWVJTFFWYmFNaUhnVkpTTWIzbjMxT2x1VGdFN2MvaURvYUh3T1pKcUtC?=
 =?utf-8?B?cHhTT2J0dXBpOERSZDNsMld1SmhsMWJCc2NUbHB2ME1zYkozZVZTUFRRMDBs?=
 =?utf-8?B?dXdHVmxnb3ljY2FTbmpvZVpPQ1R0ZVlaN2pqTXZBbkVKdGhPbWV1dlZDSWRP?=
 =?utf-8?B?NWRiOFpJejBlUjBrWFBtQ25FZEE3bWVZYzNYRXNNNW5FUFBGSExJVnJDdFhL?=
 =?utf-8?B?dENXdFk3d2lWdDlWNlQvdjVNQklUNkN0N1Q1WTNFaWUxZlpUdmdvMXNIdnZo?=
 =?utf-8?B?Q3lxQysrWlBSNTQxQmI0dTFjbS9ISjVHTWo0TzVFNnFId1ZNQUIwcXY5S2N4?=
 =?utf-8?B?emV2d2s3VFJydG4vWHVpVG5ubThFYkxrcHE3OVlFd1d1ZjNFOVZZaVZMYTVp?=
 =?utf-8?B?QWJRTElob21lbVVjUkhmRUMvLy9GWGhUVElvbnRZR3U1NHByMXY1WTNaV0hm?=
 =?utf-8?Q?iwU2VWQWtL8mq1cmWl/3QY2vR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caeb639d-7ec9-4af5-7c03-08db0436ee34
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 09:30:17.5469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLRSGAgb/l6VloIVu0cxbRPbDxDWnd7muyPoLcdUM/NbJhtMo8sxCCWPfeo6Xb0+jpMaJ6JOSpWyi86pu0eiKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9700

On 01.02.2023 06:07, Tian, Kevin wrote:
>> From: Xenia Ragiadakou <burzalodowa@gmail.com>
>> Sent: Tuesday, January 24, 2023 8:42 PM
>>
>> The variable untrusted_msi indicates whether the system is vulnerable to
>> CVE-2011-1898 due to the absence of interrupt remapping support.
>> Although AMD iommus with interrupt remapping disabled are also affected,
>> this case is not handled yet. Given that the issue is not VT-d specific,
>> and to accommodate future use of the flag for covering also the AMD iommu
>> case, move the definition of the flag out of the VT-d specific code to the
>> common x86 iommu code.
>>
>> Also, since the current implementation assumes that only PV guests are
>> prone
>> to this attack, take the opportunity to define untrusted_msi only when PV is
>> enabled.
>>
> 
> I'm fine with this change given no functional change.
> 
> But I'm curious about the statement here that the current code only
> applies to PV guest. I didn't see such statement in original mail [1]
> and in concept a HVM guest with passthrough device can also do such
> attack w/o interrupt remapping.
> 
> Any more context?

Isn't this simply because we don't allow HVM to have devices assigned
without intremap? (I'm not sure, but even for PV allowing this may
have been limited to the xend tool stack.)

Jan

