Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E19577A08BD
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 17:12:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602428.939104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgo1C-0002Ci-4q; Thu, 14 Sep 2023 15:12:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602428.939104; Thu, 14 Sep 2023 15:12:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgo1C-0002Am-21; Thu, 14 Sep 2023 15:12:34 +0000
Received: by outflank-mailman (input) for mailman id 602428;
 Thu, 14 Sep 2023 15:12:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgo1B-00027V-JN
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 15:12:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 204e177d-5311-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 17:12:31 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8655.eurprd04.prod.outlook.com (2603:10a6:102:21e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Thu, 14 Sep
 2023 15:12:29 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 15:12:29 +0000
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
X-Inumbo-ID: 204e177d-5311-11ee-8787-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESu8ycG8rFE0zjK6i+5F0IdVVjT1OeJuqHdlGjSpCGcf3p/4C/r9oDG10w/x4WoqYiOXFYXlYLyrPWEgP/JuxGO1PAJlj7HkXQ5Wq2icgLD+FmChnQxttpbX+BbiHUAO49nvHTtq67Bvx6NnnZ69xtInd/XAvXIxgtGXtKXS1qj6eQCE1dKPPZI/nXFuy+/zmtgVk390OvVQW6rCktuBZ16Hw7jf7IT5TKPB++irT0LL6OMzbINsGDv2VaE+IZmzSg5VQ964HjgDU0JTWOVdRMd4+nzy6L+SG+ZV7mML1YY0PlDEgzwH58Pqt6LGDWPNxK/RazmV0i/KZRoCO8f0gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gM6VZA4clGqGRy+oJpQroRZgA4Re7aIz8co31FYaqZA=;
 b=JkMxaQlVOgD1X1U0u6BMC4Gz4B9hKgEFb72tm28lhfP38ybesf/Xz7P+ftzUI9fsuCoNhpvrUrPCNoBS60IzvhUpZAKKiXM0nN9/HejAu5G3FzZ8jZnl19nmHbE10xGUPjTeuPXv9ovDY31FmvFC+7r3HpgzmnYLcj71vsY+SBUop2W+38XLybAGbkJW3BvCN4FbQVEeGR/RXg/dR9n/yuN3WohNjpeGVhLSOyXO6s0LWSBObmXmRcqJqSedyoluGAvzb328k2EhOSHnYuRskvl/JrNJfqmZ5JZV+HVkFq3PNjFnNitHitTU0sUxt8AsmYXoXlVJecsSmNakB7F3gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gM6VZA4clGqGRy+oJpQroRZgA4Re7aIz8co31FYaqZA=;
 b=zQ6wQ2mGy3wHcTMHxv91crpkTrq0N6XWwdHqU/FXIKH72t0YX0tbAbU8xApyK0mIREfZHnK3XnArqUYiRFgnoS2cR1baDwLOcMNBBgzkpsbUMxZr4nwa+/MQkoKXbF8R5DGIv8HXw9StLRtdoDNVP13nbKIwtzBlqxxyLWG7hgg4nNc1z6m/G0YpfqdkAbdI4e7CtRH73xTtVB4VnIwQ53ekeZvnHUhnIW+FQ1Nu1xEVsAxP/3NB4xzdIzlVPxUkXx30jTkLDwkjvJo75/Gi6jRqpUpMcyImmZQdgyESSvRKW1tQf6ApMiHQie/Tw8SD0jlsb8E2lGE/tp8h/Sbxzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e1a37a76-679f-24a1-ca77-c903439038d4@suse.com>
Date: Thu, 14 Sep 2023 17:12:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 4/5] x86/pv: Drop priv_op_ctxt.bpmatch and use pending_dbg
 instead
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230912232113.402347-1-andrew.cooper3@citrix.com>
 <20230912232113.402347-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230912232113.402347-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0242.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8655:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e01133a-a0ab-474e-f914-08dbb535033b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T98F47ivONAbc7gC4kMSFmh5RA09RQd6haNFNMj9NL0WRuG6CuYDkj5XID4/hUGCOvgca/wCoJMQgqhwa2MhgA4RIm2nrYcm+cvOiWpzP8Xixg8NmJQOEJkQvbm0NP6G2eb/ynkG6/Lq3P6tr9cFXNy5UhWoZIVKI3Lz03bsErZoQIPmU4WLgmyFAvoJ2JJH/YK1MUqueSN73P0JpeJzqFsBirDl+DfOxiQGehPW2p7yp1NGmi8bRVd9x/7pFZ40jDDhJ/nsQYvVnKPXNO87G3O8xBdsuBQW8TBKYgOpNxp05DKxTHXpwX4QNoCauV9YEuyyb20w1YtEifDlEEgZLeq14AVnY2/ZSVa/yUmxC7BBBe2Aj9pw7BEOHtREFj7TSZ8+1Mc6+yc5Keu00moBOWW6eMFHBR3eC9zuLXQCun82Q7BY9nVMogA0AjFlAn5W+dMHTzAX/uAlrIJCKtdvagkfHK+tJJoI/V7w/gnMmCIIyN19PqSzarsxaIUfBaKcOZVk+reYQv1fMoJIoMnuko7nj/8Mqyl2uEzfxQGwer0GDcM8RG7box35DPYVi4QaivXKsRvQi7qigVCnm7CwtHL9ODNc8AlTgR0aVywwlwBvynctMlf7EC4s+5XAgyn2Xt8IvekeohiYRjT1LVYF+Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(366004)(396003)(376002)(1800799009)(451199024)(186009)(36756003)(31686004)(4744005)(2906002)(5660300002)(8936002)(8676002)(4326008)(41300700001)(66476007)(66556008)(54906003)(6916009)(26005)(66946007)(316002)(478600001)(86362001)(6666004)(6512007)(6506007)(6486002)(2616005)(38100700002)(53546011)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0VWa1J4VUY4WXZwdkg3QlFmc0pvenk5M3hTZ3RicHpKWGE0dmdzVXMveXZT?=
 =?utf-8?B?TE9ObU91L2dPdjFnK1pvRVFxanVsSHpjTHlMem5JMjNKNmU5cmVZcnRuNVpm?=
 =?utf-8?B?Qkcxd010YjNwNUxpei9XQ2pJT0xtYXJpcVFnZFhYS0pWVzA4dDR4TTBNaEVS?=
 =?utf-8?B?SnVxQlhRNnN5TEtKUmZKS29sT2dQdDVSb0MrZWxwcGNBRjhBY0RyMW8wa2pZ?=
 =?utf-8?B?SE5NSmRwTVdUZHZyUnpCR28rbEh2eGM2OU9RV3NVVFVwSWluV3R0N2t3RERz?=
 =?utf-8?B?T0laWDJtMGtzeUZHSEN0UGZ3d3JEcmplZ2dISVo4Z2IrcWtDMjYxU2xQQ05q?=
 =?utf-8?B?aTR5TWpQdzhqQjNSTWtVbkZJaDhjbUp2UGVESjB0RCtzeDc3ZEE5RVFKeDF1?=
 =?utf-8?B?WWFJWGkwL01rZG84MkxrTlVWYW1oMnYvWTVKaU5TK0tRamkzVEJkU3M4UGpR?=
 =?utf-8?B?cGNCem1ad3JYR3hhSnRBV21yaXAvQUF0cHRsK2ZwUmZFZkNkSFRpY29FR24z?=
 =?utf-8?B?Wm9YMHU3OWFPQ3U0ZjVCVW9HTjVQNjMrTmFKalRQb01yTEd0bXpEWGJBM0Ju?=
 =?utf-8?B?RVg4UGlrY2tRbStoR3Z1ZEJ4MVZKNlBabCsrTzlYWVVNakx4aUpzYVN2Nnkv?=
 =?utf-8?B?RlFSU2xsYmdtRDZodjY5QlRNU0NWd3BYazhKamoyZi84SmEwM2FyYlBZMHdK?=
 =?utf-8?B?NUhsdHZabWoyK2gzc2dkdXpGNkFWL2xGSk9US1l1bHQvR3VBQTVDM2M2d1N1?=
 =?utf-8?B?SWd1NXJIelFIdEFkMU5NeGIzcWs2MVRZM05USU1jWFBVN3VsRTJWTDNHbUNV?=
 =?utf-8?B?S3UzUEtpVTI3a0drc2JOclhzbjRPYXJNclo4UyswcWxZN2VPQk5WVUh2VENu?=
 =?utf-8?B?QlowL0prVWZMVDlTVndvREVNT0pERm40OTR3WmNUZ0hrbTJjaCtKdUExblpS?=
 =?utf-8?B?VDJuczdwZEUvR0FNOStQVldpWUw2M2hLVXdPUzJZeU9XTm1lOTRoVVBkZ2sv?=
 =?utf-8?B?Nnh5RU5hcDc4Y2Y4WllYWk53ZXlYNE5TMmNOcktWK3QzK1Y4WlV0ejM0RmJN?=
 =?utf-8?B?VEtUaUp3bTIwVmI3a3ZWKzREMlZaMmFaWXhxcjlna3lzUk5uaGVWTVkwYUx6?=
 =?utf-8?B?SHBEd3AvSkk2WUdSaFVIbUpQTi9kVVdmWjdCbTlEbktkSU1qUzFxVytuMWh1?=
 =?utf-8?B?RmgyczM4U0h6TDdaY0M3S04zanNxOUtzYVpEdG91S1liQzBNcGFZYzlLZXpk?=
 =?utf-8?B?cDJkcHpJVVh5MmZIdGFVN1BMajFDdnFSM3RtSHVOZ085cnhscGpmS0h4SUVh?=
 =?utf-8?B?cDAyaFBmT3RiWTRVWU4vUzVZb2FJTVJCYkZ0WnJOakpMSFpubW4yVzVLTnVN?=
 =?utf-8?B?QTB6dGo3d1JMdWpLVExpcEpodkNkNkRDWmhudFpMd3ZyRkdQamh5RWYwbWJi?=
 =?utf-8?B?WTNEaXBEeld2d090OG9IQUZoZnlsQVl0bEp0NjNiWWNNby9Rc2hpOEkwRDFi?=
 =?utf-8?B?YUFlZ0x5K1dwYkRYaUkyQW54QTJoeU1YUG1JSHdTQ2JaTWxiTjU2cGZISDVm?=
 =?utf-8?B?cUFHbXQvazV3TWRvRmQ4VjdTelNKczlrWjhpM0JRRWphTnVkbll3UFR3K3Ru?=
 =?utf-8?B?Y2hvZjZGRndNTkYwd1d2SFEzNGpXbkpQRVdEVGNyS0FiSG9iWk5Ya0JaRVYw?=
 =?utf-8?B?bFU4d3NkQ0txQ1ExR00rcncxWitFVmdVcHZRZlJURk9tZis4R1Q5dEdyWHQr?=
 =?utf-8?B?ZEN2WnFzcTVCbHRMdnptVG5tTjZoOFJVZHFRVGZ6QVN0WjJvSFAvU2VUcWNP?=
 =?utf-8?B?WFFUa2NWazFTNGMwd1hZbUJQZGM5b01pQ2RRZEZQNkY3U2NCKyt0TkZUUk9P?=
 =?utf-8?B?S243NXA1MVVDSjBuSWhrZ2E1WExJdHA5M3lYcmQ0d0tGTEw2d1M3WjVibUJo?=
 =?utf-8?B?L1crclNZdk9hMWVNT01iaVNYcVdKOGdhd2ZNSEdsU0IrczJzK2ZmbUFGRHJO?=
 =?utf-8?B?SEpNYm15c2ZHSTFIMWlzN1hLZEJtV2ZEc2ZVODBjcmNDeXUzbjNNSFNBTjEx?=
 =?utf-8?B?dkdBc2g0VUlLZ0E3QWZaUnE2b3pSb3JWVkUzRUM0dWpiWkV0aCt4TmVRaEVR?=
 =?utf-8?Q?R4h5nqUD4QdSLvAj0r/tZnUqK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e01133a-a0ab-474e-f914-08dbb535033b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 15:12:29.6556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qpEI6Vf39ise27MNxyiPLPR+E8n9QJV7CeeN+0HtJUZciN5ueb0dnrs44XrQYrMQ6Avtcqtv+WvpyIj6N7ysbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8655

On 13.09.2023 01:21, Andrew Cooper wrote:
> With a full pending_dbg field in x86_emulate_ctxt, use it rather than using a
> local bpmatch field.
> 
> This simplifies the OKAY/DONE path as singlestep is already accumulated by
> x86_emulate() when appropriate.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



