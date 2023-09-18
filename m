Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B48337A486B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 13:30:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603951.941111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiCR6-0003kD-OJ; Mon, 18 Sep 2023 11:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603951.941111; Mon, 18 Sep 2023 11:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiCR6-0003iO-La; Mon, 18 Sep 2023 11:29:04 +0000
Received: by outflank-mailman (input) for mailman id 603951;
 Mon, 18 Sep 2023 11:29:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q4jH=FC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiCR4-0003h1-GA
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 11:29:02 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20610.outbound.protection.outlook.com
 [2a01:111:f400:fe13::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90542cc6-5616-11ee-8788-cb3800f73035;
 Mon, 18 Sep 2023 13:29:00 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8412.eurprd04.prod.outlook.com (2603:10a6:10:24d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 11:28:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 11:28:56 +0000
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
X-Inumbo-ID: 90542cc6-5616-11ee-8788-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ardmNVBHj5CI/XaX0K7HpaN9ROqTt8K1eZfW20UfAXKz/z7cLV2aAuLTCp5flimY5akWpEq6joQ0rqSREDg/g5MBx+eibTrjQMr2E12y1g69jxo2PU5fENDSw8CTqofbPHWL215PYR9N7bIyCbsmSU0t6Byb+PYsMMYCoIk65BBUOdxOi1HR3p7Arq6Y33W7qhm6SCoSMibZiKBnRBFJ6djHvEotaZNv7vt1KVR/AQL/q3UVZO5ANnXdPsVzlvA96XqcAOqpulNZOYuOJUxSJVRadN1b0tBQRZKr6MC3evCDQRgzGwt0mE/0mPedBcMEd0sh21/60GlY/dzEc8ED0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Vp9355iLGkTVXUnf6hvBqzjJYfAaWD4xULBV4BMvK8=;
 b=Zp5vxJe/tYtiWHaNzja473vZpCNoGNOtU3vADpzkoj4Zm/axzmb2WdJO9B7KgRsYwk5TqTt8Ap1eixZzxIgf9ml05VXu5UlvuQwpzgZVQl0njeWTvjISvYHAUTcehtEXftqV4WRtfR86qqBOkHiwtHcZMM2nXhkUD5fKcLqK3aqthDfuD6UrBrkLT84BArohHz3O+3zK5q8ZF0MCmHzxyl5I+8cyg19d4VH6YSYmEXrg7TAyI5xwNLG1Xm3Oo6AQvi+Fk+NWKrFZtyB+DhLtRoRQh7EaKxznFkqJbedsCXV4jNNSlU7jPx8Ksunz5tg6fWdtbz7/2PSg0+p1xFD0LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Vp9355iLGkTVXUnf6hvBqzjJYfAaWD4xULBV4BMvK8=;
 b=fIEZ4XHf6uxxWPcfFFLUtg9T04PB07lNPpxgSErqnEb/bd1oEjTHOtK6ptmgGkBhihLxf1TKjyjRs+3uhQlFUHucDUXavDvkunrSJ7i75nxoWb1o5VU9E4KT0R9gTtru5hilzHugmOhxGVV2JZrNrp2bUtWwHIGmRviLQXeO8dSNdIgb+UF/+XKK26Qa7F7BguDD3meTRW0Nh7lhyWS/66RLMPcWgTl7qcWKX9zhBtmyk5Yo7JD9nJZljZnfqof4vxu2AHEjWJSiPXW2MdxGZwTshCezdh46cD/GI20zcRPl1lbTA9Yry7qSuzAW8zC3dNEIFKerX7/oych6d8fmpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f6b02336-4637-15a5-0c7d-33283c65e090@suse.com>
Date: Mon, 18 Sep 2023 13:28:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/7] x86/emul: Fix and extend #DB trap handling
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
 <20230915203628.837732-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230915203628.837732-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: d644998c-42ae-4811-c830-08dbb83a71b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EmAS/s1VqlWwbfRbiSEw3WEGxthtT4O7dI9+AxMxDm/pxbvWVkyn8s353AncLeLf99pFpQlx2NH7bBSy734KYzyZcTe6k9l3uWVangNovxw73g/nOPT7aCSaoPnPol83kMEZVsy8umkVbDlgFFcHa9+dUCJRnBcYoBL/icUDQujEe5rSxSFL4M1FMuZ0rZeyQNQoCnVbvKfy3RDFc9yY1cN6bPfKW25n75Uj/H2V4Hxrsb3A+G2ecklzafTjQj7kXNvB0i0ScEpNQkgfMYyjojIlZi73ncafn7tfsoj1Hz333ZV0XfOAi0zOPvtbtu8YzZ+7BZoCsQOWBv3s39+rZpMxUaiXhp+zMq2bz/TvLNjUPzP4NHB+q0Tg80c7QbbmR8rdTKCVTv1RqvkOZ/2x3yAc/pHUrc3lXgYF8FhlmEz/sMl+vUF1bDURyndRkQUEco0vjQ1ZdiwscDE6dEtD7PoYNZ7zJoaCpmF+1+KnNw2//aFxRpJSfH3Wc+RdeD0K510n2Qh/0IaNyVZe1EcrpK4OXVvK5VlK17h8xPCjgVcGntBNRlBoBJdIY/ic89+v5SqYjhLAMkL4v7TqVs8PEBN06XSODBurc8UK65U62QYgvH5pRuX9Oy9B43xr/c1sk32NBpMdYJ/83pFgHEacTQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(396003)(346002)(136003)(451199024)(186009)(1800799009)(66556008)(36756003)(31686004)(2616005)(26005)(2906002)(4744005)(5660300002)(38100700002)(86362001)(31696002)(4326008)(8676002)(8936002)(6916009)(316002)(41300700001)(66946007)(54906003)(66476007)(478600001)(6666004)(6486002)(6506007)(53546011)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MENtcWl5ZS9xL2NmRmZQMEl4cXFqTUZoeS94cThmaFFOY1JBQUJySXVWNWdG?=
 =?utf-8?B?NUI5NHZRYUptaTBPK3dzNUk2VU02Y3RWRjBNemlBMURETzBZUUxXT2pOakla?=
 =?utf-8?B?QzFOdmx0T0Q2UWhJdmlQVE1mSU9IeE5VLzJUWjhrVXpNdTFQYms5ODY4M3NQ?=
 =?utf-8?B?enJxY2p0cUMxSUt6eWYrRm1GRVIzTFhQZTJ6SjZFd3d3alVuNno1cC9Jci9Z?=
 =?utf-8?B?YW9ISk5Ib1ZoMFJyUmhjUTQ1eDFGbGdlRkdhcWh4OTV6eWNETDd4RjZQOVk2?=
 =?utf-8?B?dUVDWjJZZjc4SWsrN2xBUkJqRlhxT2ZLKzU0Z2o2dXBXSXZoYUdwYkFhcXFV?=
 =?utf-8?B?SEgwUjhFT0VVUlh6dnZtWGVQYllRZ1pHVk12WStiY3crTkRmNnFMNTFMQkg3?=
 =?utf-8?B?N2RmNTUyVVNXYi94eVY2VjJZN2hycDcwbFBrZ29tbkRBSnk4dGhlejhNTVpa?=
 =?utf-8?B?bHNRNHN6THdza3ZYVjFGM2JRVVkwQ3lWUzEwaTg2RS9udVFmb0JxdENnK2lS?=
 =?utf-8?B?elFsbWpYa0hZaFZ5eDdZYlF0RWM4eVhXY0FHNWN2WjFVQTc2ZWY1WmkwZ2Z6?=
 =?utf-8?B?RWE2WUdjZzh3UHpwT3c4dlMwMG9vQk45L0ttcUFNNUdrUmR1L1I2MzVlSzFp?=
 =?utf-8?B?R1ZPT2VBMTJHUmNWRkwybXB0VGhFSEk4eXIrWUhjV3RNTWRMS0Z2dFhZa2JT?=
 =?utf-8?B?NWI5SG8xWGQyUjF1TmRpT1ZvbUluRHFRNlkwU3JXaGRqckJRUWhURm44YVdM?=
 =?utf-8?B?RWZIMGhHMlM4NXJKTUJQVm9hbWZvTDQveFpKb0x5ZC95c0ZONmhwa2RWemlK?=
 =?utf-8?B?UE1oWGlER1JzM0Z2cWhyNDgxMXVxUnRsU0xRaTkzZE9yWERJdWYwYjhpckRX?=
 =?utf-8?B?VGVCZkJKYm9DS2xrdHNaaGpVQ0I5Vm55MElOMjIrUmdvRmMzc3dMci8wT0Fw?=
 =?utf-8?B?SktubGxuYzFOaFBsNGVsNUhxOVoveFF2bWEybThwUTVVR2hBSHd3K2pER2pH?=
 =?utf-8?B?Q0ZxNmRIcVBYL3ZaSENFWDVQQ3M3VzVkd1NvZi9MOFE3bXhXMVhZK1lCOWla?=
 =?utf-8?B?a2Z4eUc5QWRiYXdMUlRxT2hSaDF6SFRYaDdXMWo0MC9VSzBxbEtPQStxSVlD?=
 =?utf-8?B?dW1FUGpLYUpTVzI4bDdZRjRTNG9sNDJUT0hwamZDeFkzVkQyQmVCZ2tZT21V?=
 =?utf-8?B?b3RTQnZsWmRXbnJncW1hSEY3dFlRRnREQ3ZMcmwzaXVETWg1UkxWTXNCSVd0?=
 =?utf-8?B?TEYrMndSeHludW45MTlveXJZSFZCd1Z0NWhPL1Q2KytoUFJ3QVY4TlJQRWVR?=
 =?utf-8?B?b3RjSlp4UVcyaVY0eVhoQ1c5R3FNRVIzUnF0NlBxQmI1Y3hDdjdBcVlIR1dQ?=
 =?utf-8?B?dTZaemZiQllDOThwTWwzUDlaS3FVWUltRjNxcTc3Z0tjZno1TlVIN2xUTith?=
 =?utf-8?B?cTF2QWwrTDlMbGc5cW1TYkVncTUzUS9Da2hUd3pDSlY3dHNRaGk5bUxyZkU2?=
 =?utf-8?B?UWdKaEIyZmRyL01lZGcrd0hEMXErUHNuYjZMTTdtV2t0NHdGcWF0WForelUz?=
 =?utf-8?B?ZGhkanpFNTFURzNhbkFyVkQ2bVVXaVMrUURoMHlmZ1Z1VmFWeVVHcXEwMzMx?=
 =?utf-8?B?SVFBMFczWkNVN0laTUhNdDlycGRKYzRVYUtiejc3UUI1MVJMVVk2ak4wTFI3?=
 =?utf-8?B?Q2pPK0c1WUFHY2JkM003SzRrY0RpdVp5RE41TUpQay81WlkxKzhFREpHMGJD?=
 =?utf-8?B?WnlJbkwwaUlqQ2JZbEU4RVVaZWs1dDdWK0ErMWxNcFhHQjBOM3VwYTdnUENL?=
 =?utf-8?B?RmhKeUpKZTJqR003UzFEci85NE9hQ0J5S3NuQU9jdGNuclZYT2JFOWg3U0lM?=
 =?utf-8?B?YzFZVjN3WUtyczlSa2VVekFnY3U0WjU4bWVSOGxGTFkvZURTSmZaTE10eG9a?=
 =?utf-8?B?ODVGVXB6Qk9JaHRSNDlVTURLczdwVHRmSUNkaHVCcEF0N3ZLVmIvOHBSMkp6?=
 =?utf-8?B?ZkpYc1dlSmRxdlR4dStJdUhjaVVXSFliVDgxRTV1T2UxNTYrb0t5R0Fac0Fy?=
 =?utf-8?B?T3duOGY4bi9ZUnQ4TEpTd1o5U2VpTU9TeHdsYjFnd0JIQW82dEw1ejNZanI5?=
 =?utf-8?Q?ACMcl2BHox23JTmoAqy1AArzm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d644998c-42ae-4811-c830-08dbb83a71b9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 11:28:56.0695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x74Ykhl3oRLWwo9PmygNJkyULc9IsRLGq994POyROC2eabFj0m8GJjMPoj8OIU3pzGpmLO+V2kaj82MB3tUEJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8412

On 15.09.2023 22:36, Andrew Cooper wrote:
> Lots of this is very very broken, but we need to start somewhere.
> 
> First, the bugfix.  Hooks which use X86EMUL_DONE to skip the general emulation
> still need to evaluate singlestep as part of completing the instruction.
> Defer the logic until X86EMUL_DONE has been converted to X86EMUL_OKAY.

Doesn't this warrant a Fixes: tag against 4999bf3e8b4c?

Jan

