Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 408EE652F2F
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 11:14:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467725.726761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7w6V-00025v-FX; Wed, 21 Dec 2022 10:13:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467725.726761; Wed, 21 Dec 2022 10:13:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7w6V-00023L-CY; Wed, 21 Dec 2022 10:13:39 +0000
Received: by outflank-mailman (input) for mailman id 467725;
 Wed, 21 Dec 2022 10:13:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GA0H=4T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7w6T-00023F-Vu
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 10:13:37 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2041.outbound.protection.outlook.com [40.107.7.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21f6d50c-8118-11ed-91b6-6bf2151ebd3b;
 Wed, 21 Dec 2022 11:13:37 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6908.eurprd04.prod.outlook.com (2603:10a6:10:116::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 10:13:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 10:13:34 +0000
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
X-Inumbo-ID: 21f6d50c-8118-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLLYjkZXJN1Zg40bVvtpTjKhlcyv7hc8a11VygaZGgUxnHfRk3J8x8Vk2atG+gBqwPVB/761pnnPn6tzxTLe8OSkuNM8XK11Ps3Ek6stA1c53/gZzpR4KaSH3+SwkkqEiVcnfw0f3xqtxcpbgKDywszS/Bc+Y4HD7QU49vH3xaKyIIpx2/KBfQhBlYJT9ebNAoCpzYamRuLzt6n1fdeEXCr8hNgd8gTcGeGMscYaMqNLwQ+KgKm1VgZzuGshlzuc8fK+W9cBbukLCD+WEFuaoPle/kY1r1Fnumm7dPVHTdzGfbHRt+OvxpX/zCDqxeodfpSoWShcbrIFIHVweH4ZhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxHLnB66cKtWFyV8NxlthOE17z+vwATgZeHTVQZC2S0=;
 b=lk5RjJnWOWwKta0EHMHGYudC1n/YkaGzTGt5AshE+el6jQWe46k7fhX0+WCrhdoWqF4wWQLEksV7M6PfSLgwtddVamsT0F2RW4PRR/a1wnxDOHmioUN+r7AcKaO1vyr5/Q9N62eA8UwRC/LROQtHpu14hFpnbbuqLfuSWm77pJZjGk6Om9rpz4gpBz7OAgO0moxF2c9qoq91WQudzpDC9xhTtMiGZE+vRLFarshRn4v7V8ZpA+a4lfZCskJtfIRWJ1YhpsritV+eFTHmNRORJ0crE+0PFeegd5+2O8u8JMq0aOoOfNVXTHTbYG0mNNMdsiWb/wN3tvD4yB0GCdmLVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxHLnB66cKtWFyV8NxlthOE17z+vwATgZeHTVQZC2S0=;
 b=CLfNccn2wUw7KqMpCx+iXkeOUBbNB72MWJidA3L/jUW/qD5OBU25cSE1L8YTqRE1C1Wd15SAX9TS2n/0c0btnfwmoXSIr1QB/CHNevK1OHLZkR2zupH5sPRgIXoxR9azzKlDz28mwqTM1OOY4QTptl1xQ4u5x1e33df9+hzU/BGn9oQngcbcwQBF0FdsO2TQzWD8qibu0Ui958J3c3ZzX0eBJ3ktN4No1q9HHdVgBLfbb7rhPMm43D4rZO1mIg4HG1hc8/lbmRj3z6kypRONA/zeujo7idlMzQij7aTM/Pqi0TWMP+L7vMUZ2gPGOyA7XcykxGYabw2lzke0efE82g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d7f12b04-1077-cfc9-25a9-0eba37dde753@suse.com>
Date: Wed, 21 Dec 2022 11:13:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC 6/7] x86/iommu: call pi_update_irte through an hvm_function
 callback
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
 <20221219063456.2017996-7-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221219063456.2017996-7-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0209.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6908:EE_
X-MS-Office365-Filtering-Correlation-Id: 995a5728-b345-4288-db6b-08dae33c04f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bk07NKvE/FkEaRI8JIKlg7DA8oFGXMTP0nmWWl3Kt+y7LTYUO6bItmaKCR7zEikvHHvveJGSAcFqbMmxTVuNL1S3xIr3owWmgFS0GrdaqxpdrpTVsewYwCLPYK7ol6CfI8MMa3pqYnl9CsmQNryP+0kBVmahglD22ppqF4d9HSS9fEjzd3dfFju7XZNAV4VPp0Ckw9qIGSjKm13a9Uv3thKZJbsl9d59+irElFDnLYQJNsQ+xwzGP6ZQB4vay1/xeenSdPgfw2Pf59vILH/P5ZgJxgJ4LgeI7SdQTLdlH8gwAKWccxS9gJxtPXMhenQJI782RB5EwojiRen2iXCivHLr1E0ADZJdNE7eXTYAMEuJcA6NqQTWj75MC1Ggx06gKPFlURMFPA67UfWaIM6+TlMtYqfVEzFENZ23ERZEL7RDFgL5QwOsS3cwt6Gcr+XGdQrNcTQ0PZg4ouWsyhYBo4bb6N+vCwFoEcP1UCwhpaPTQsQTr/o75qidFhn2CoUsYHwmpx6QCjeiW2zUQUBtJVH9mx9d2YLOqFCzIewlzZ1ZnAE7YN2aSJxD/V+/tuHZKFoSyUOEeGdQ4VP36zG2d1pX1MhvFGxrJnbfUKwLchn7VEDyQ9cGoYGN4H1qZeawWJZcN6gcgG+RqEfaMWaACGY2ZRNORkN0UDfFh1dom9w5vMrOXUxwO/1peDLT/TxpXoxPxAIg80vsHQIyJ91bx1PAG32i4N7e6wt44yEuH9k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(396003)(366004)(39860400002)(376002)(451199015)(8676002)(66476007)(66556008)(316002)(4326008)(66946007)(36756003)(8936002)(83380400001)(41300700001)(5660300002)(86362001)(6506007)(478600001)(6486002)(2616005)(6916009)(31696002)(26005)(53546011)(54906003)(6512007)(186003)(2906002)(38100700002)(31686004)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2lJWEdZdms3dEowUXEyMUZVQnVDS1VidFpMOHhQSHY1UGloTjNBVmlXcm5t?=
 =?utf-8?B?T3JXemJxS29hL2V3N1RrSG14T2Y1WEFyaXpLQTdCS1U2YmRERVFqeXhkME93?=
 =?utf-8?B?d0NsMFIxa1huWW5MTzJyRW81c0RNa3d6eEk2WEVjYVQ1ZFdKaXcxcG1sVWFQ?=
 =?utf-8?B?Tm1FL0tiRGV4aW84MFJNbTdaOUo2eE1DbG5JZzFNaHZHdldta2ljbDF3YjU0?=
 =?utf-8?B?WmVHVDBIQ01ObFhkMkJxbnZNV0VUckpzeEtncHhNVzNMYlpndkJoc2xxLytk?=
 =?utf-8?B?RTlMWDRPOXVHMktEc0VoaUxLSkJsVTNRRks4VUx5UTZ0aytjWDhKQ1pKV2h1?=
 =?utf-8?B?bVdRMjRBTEUvSU93WVI4UDdZa2JQMFcycXlaSmtDUm5ic0xLRGUyQ1dnYW1p?=
 =?utf-8?B?R0x2YXFTajdtZGovSDNyT21Ga3JxbCtoa0JaRkc5cFdsQnhsQUJVZEkrRDlL?=
 =?utf-8?B?UHdaMnJZOTJobURGY0o3ZEZ3Y3dYaVdlSlEyOFdhTU1pLzlGN2N4V1lOZnVt?=
 =?utf-8?B?YU5yZVBKMUc5aXJQK1FlK09aVmhTbGVwR0tJL2w0KzFWNWNCUWdJT3V6YmF4?=
 =?utf-8?B?alhoNVh1dEVMN1VnS3hNSzNLeEtwdUFFUGJ0UzlPc1ZNKzI3SStKUG5sc3RE?=
 =?utf-8?B?dk9zV0xoNWRxMDEvQnVQSGY0SnJtdHZXcitpNFpTVlZZUk84cVZnaGVsdFk2?=
 =?utf-8?B?clBPOXJhSFlyR2M0dVBpd216Y3UvSWxHWDIvTFErbDlRSHRXOE9YdjZ5Z1Nu?=
 =?utf-8?B?YkYvWmgrdEFTUGpFSmNQNmxNQWpQZE05TUFPZTg0NGNPdWFsS2IycEtBTysr?=
 =?utf-8?B?L3AvWGhleGJGVit6bWVLaDdoeTgyY1dPMFJOWGg1L1ZwRkkwSk1iclowR2ZL?=
 =?utf-8?B?NWRYZ0FsRGVrM3haNHhLaDQrNHV6L1FGcW9xQllWOTZIcGlRbDJYTHNFdWJG?=
 =?utf-8?B?Yi9ERnNCeWtucERMaE01ZnFaYlBSSC90MGk1Wi9aYzlGc1M1bzVSejRsZ1lI?=
 =?utf-8?B?eGZmVzgzbkVSZThhWVNjQitxaDVKa283K2twdmw2eHNyMjJLYUQ2WVpNNjN1?=
 =?utf-8?B?YVRMMkc4azkrUFJ2VVhUcTU1dmV5UHc3ZTIwcUIrSjRvN0tqaWY0ZDJvS1cr?=
 =?utf-8?B?NXhiMHNoMHlFK0t1cWtWRTB4aElUdmtJNHRTbjRZS08zTUxQWDk0eDdkTUQw?=
 =?utf-8?B?cWtBdldYOGE3aFdvRzh3RHI5ZFZuRTZCb21TczNyazRJKzQxMGNRcURSZUxR?=
 =?utf-8?B?VE03elBhL3JFZ3NqUWRFazR3Tm1RWXNHZEFRcnJxK05ZTCtjcVVNbkFTcUVu?=
 =?utf-8?B?cGM2QytGeXRFT2g4R2wzbVVpT0ZmMEJERS80N1lJVGx2TmxkMXhwd2ZhTWs3?=
 =?utf-8?B?YURoSE1OVWhhM1REWUZRMzNJdFBwVkxSR2xxbk9JNWpySTRTalVCKzVQaW9H?=
 =?utf-8?B?V1VSYnpuaGNBZG1Bek4raEt4NGgrdXpLTXhjczFSWnFFWGxLRmRzNWs5ZHRS?=
 =?utf-8?B?d1ZLRThIcEpPR016eVhib2oxVUNxVHJtblZDNWMxcDJQZ2R4b1hVTHpLUkJv?=
 =?utf-8?B?YkYvQ25veitZWTVlMGVlWWVVMmxqdCtEVjEyaHczYnV4bWszNDJTMnJ1OUFu?=
 =?utf-8?B?KzMydmR0dC9DRG9UTDhiWlhTRE8xeG95R2NaR0I5Nk5UY2RaUUhWeFQ3bnZF?=
 =?utf-8?B?dHA3Sk1qczJXZ3d1d1JqU3BvUkdBSisvQmFNQTZvaWRjOTh3VzR4Q0oyam8z?=
 =?utf-8?B?M240OW9PWjlwNVFZaDRDR2E1bk82aUEyekp6QUNNYllROUZZa21TSzhjczJ6?=
 =?utf-8?B?ZUtzQUJxR0dOOEYyZFpJV2tHV3JublgzR1kvYW9ET2VadUtIWWp5RTY3ZTI4?=
 =?utf-8?B?QVByRFVQci9iT1hGa29rQWY3ZnBKNkxTV24rTTBwaSt3WnFQSTYvL1VwYVFn?=
 =?utf-8?B?eWtkb2VzQ3BpS1VqeDFuS0pkYTc5Rm40dExxUnlqdUtpQ25PaW9BR0JTNWxm?=
 =?utf-8?B?OTNhNnRGYmJsQ3Mvc3pCbnJ5OXBSV2pqWWgxbUZWM2VaRjNyVExCUThaclNw?=
 =?utf-8?B?SWF4cnZycXFrc2ZHd0pVVWUrTkNCRzIzb0FtdFJLK1JJbDZZZkdkOHBTVVpT?=
 =?utf-8?Q?Si42pZp95ISUlurZoF9aOY9qT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 995a5728-b345-4288-db6b-08dae33c04f2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 10:13:34.8320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zIoCXyYxVzf9U/6OrwxgE0ipBVO8KCx8KC5vgoacNAa8lixT5FsbUD4FC72fbXyTx9sstim6lAGuZsDKGk7fYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6908

On 19.12.2022 07:34, Xenia Ragiadakou wrote:
> @@ -774,6 +779,16 @@ static inline void hvm_set_nonreg_state(struct vcpu *v,
>          alternative_vcall(hvm_funcs.set_nonreg_state, v, nrs);
>  }
>  
> +static inline int hvm_pi_update_irte(const struct vcpu *v,
> +                                     const struct pirq *pirq, uint8_t gvec)

Why "int" as return type when both call sites ignore the return value?

> @@ -893,6 +908,13 @@ static inline void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
>      ASSERT_UNREACHABLE();
>  }
>  
> +static inline int hvm_pi_update_irte(const struct vcpu *v,
> +                                     const struct pirq *pirq, uint8_t gvec)
> +{
> +    ASSERT_UNREACHABLE();
> +    return -EOPNOTSUPP;
> +}

I don't think you need this stub - both callers live in a file which
is built only for HVM=y anyway.

Jan

