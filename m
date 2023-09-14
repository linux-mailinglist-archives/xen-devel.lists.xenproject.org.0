Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 206FF79FC68
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 08:57:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602065.938421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qggHH-0001Lo-Tt; Thu, 14 Sep 2023 06:56:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602065.938421; Thu, 14 Sep 2023 06:56:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qggHH-0001JI-R6; Thu, 14 Sep 2023 06:56:39 +0000
Received: by outflank-mailman (input) for mailman id 602065;
 Thu, 14 Sep 2023 06:56:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qggHG-0001JC-Rf
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 06:56:39 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d89fddbc-52cb-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 08:56:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7243.eurprd04.prod.outlook.com (2603:10a6:102:8c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 06:56:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 06:56:34 +0000
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
X-Inumbo-ID: d89fddbc-52cb-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9n67jp1gflccW+jbZwvO+EmjJjtJsZB46qwb4kbFS682s2xMWWfuHhVaSiTDDioEtB2bq7ZnRvxCmh+y2kKiC4N4H/lVuphBl+nMrI/Db4xq/LXAfZxDTkreMM5WbZgX3pU5VgrRN1A3bxQcsZQMkuOdZHvA4vcs6tK1Oc/B+/2yr4wcPQ7zsXWG383YAHNhB8XJq7mKHwMHLZOemJpjSGzQA24Lx7smGULXg8U8ddVd3+tfdXGdzvyBD7SeQYCUah2Xt8fzH8IhmzOft11RgwKvO2P/vwSh5uiGCv0VpJBui4sL9DJWmwpHGUPWcTIzs9pk9Fu+ghhal8BxC921Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dN0WcmNuDGd6vcXnaMp1yL8fcqCRWiAWE8wrXxrfN+A=;
 b=mPBcP+jdyd4VClKMr6sKzLb0fGxcAduOAaT0IA5PUlasUpqjngJcJD2Q2WtGu6sHaW/ETiIo5ljlJerns5l2yug2IRGNF1/h6fJ9a2F6gPzpIi2NRgMPo0S5eYLPTz7eNDbucufmtgLj8hklhhXt3ot1FQOhNtajZNS18NGxSqN0+j9p8TeO4NYx1hGufc51qV3CgMUZNgqSE7qlxLbvzc3Hfjn1kIAGmClxRDwLSc+skKOLcCTliIkJ9QgHTii7aG9juVK8PS5T461H2HIok05uZfJA/nryzybSANS6SoVyt99kmpXrFwW6k9v+InM1JNGseuiZUD1DvFl0lkGvnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dN0WcmNuDGd6vcXnaMp1yL8fcqCRWiAWE8wrXxrfN+A=;
 b=XXVSuPNgLsrFaSZ3+9oiyfxcn3zmf5VmImTlXVO3GEf2R/vMwWeCRLhxtaIoJmms+YA3Ab+WQWbaymu2KjvncQ6STUxFH4ls/81FNkxf/7KxlIpzF4iiW8Nyn8SDefJnc1Zpf0q+XFklmX78jMab4VrHAYSxeIob9IdkkD+g83N/ShGH9Mu+kb2pnae1EcNd2RGOEiEa0FYseotR2HIBsS0LeHmu7rHBUzKk1sNrTZTf7sjH5QQM2ysFouVzecPqGe6eQAKMzdyErmiIzKQa9eGhQyovoL0ScclMa3VBv9sVKc9zgnF8qGG9SU8KfltI9cQCRDY43d/IRYJf/7Dxeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4181dbec-38a4-d0dd-c132-2d23579c36a7@suse.com>
Date: Thu, 14 Sep 2023 08:56:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/8] x86/spec-ctrl: Fix confusion between
 SPEC_CTRL_EXIT_TO_XEN{,_IST}
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
 <20230913202758.508225-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230913202758.508225-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0188.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: 97b9f0a2-698e-4c1b-ec1e-08dbb4efbb85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SAzoasEuim3lHYGKehGURcpUkjTqB6YWqRgroHyQv+CSAXIcrme9sA00Yp9wEGh6/jihRxYukONSNwpMuQCcId6wk5obiuj3LAp0tTk4GSDBjK1S9pg50vU+ePu3dj/E5Oed2YwYwsGYLz/ZQEaL0jf/2w2LCNJhfbpNKKOroj3QwLqMbX7q8AoQ8dKT1Vx27bxKvpZ4uHP44LZkCzBVytwdLIHinGc/xgZr3mRUxhwDOs/fPSWdrd439jgrWctwmLcMYzcbAuWNLv1VFVF221tE+r3CNwDBfGhO7RNYMJgcqJvX3a74m6STiFKD5OafIaSQbqqvHsxBBgSuhsyXj35SfxF+xzCOA/mtFSYNuIHpAnXdVr+MTFNOvLqkMzvxH8P5jeqk0oWf4JpalujvZRs9obMJ2CP7vHOxNCkl2Pdx4m0f5NtZFTnXkpbaXib+zpv3UKNXXyGgzTGWs2JJmeS4KOT7WSyFOuTguFlT7eQAjxUgzNm9e/L5txJfw6tO9YpFxT5M7L9+yQyzPab7cV9ra5J4sjxvRKrKiXrvRpBH76qJ/y5Q2vZAZD2n15TU5uwSOHo1zjcW+WI4jGPvGNU2WU7urs6fsXHGDR23uA+RODG2OkXoG0NFHCIjCm11eq5/qmYP+pEcNHA8ME6tmg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199024)(1800799009)(186009)(2616005)(8676002)(4326008)(8936002)(26005)(5660300002)(53546011)(6512007)(6666004)(6486002)(6506007)(41300700001)(31686004)(83380400001)(86362001)(2906002)(6916009)(316002)(66556008)(66946007)(31696002)(54906003)(66476007)(36756003)(38100700002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGFOaS9PeGJlQzVuUlg3MnFtc0FwNEh0bWlscUovWVZkQjNjTi9zV2N4Qjkv?=
 =?utf-8?B?blRrY3Vxa2Z1aGJGVmtiUURMeDdkOENzQXJtSnBIZk9adEt3YVd5K0E3bjVE?=
 =?utf-8?B?VDlaL1VXRWdtUEp2Tmx4bkQ4K3J0MkpqRllRTVJFT0NmS082aXdySXhRNG5N?=
 =?utf-8?B?QXpKZkN5R2VXMEhSd3hkZUJsbk1Rb25kbStMRlhCK21TTVBPMGxYNCt3NW9D?=
 =?utf-8?B?VUhTMGhNZTdOYllTbUR3M09YV2RCNlNsZTdlWUZKaG0xbFY0RzFGU3pFdTZ1?=
 =?utf-8?B?OG5zTytmZ2ZJamNWTnpKWUR3VHI3aHRBazdXZDZRWmtwQjkwQkZOenFjRHpG?=
 =?utf-8?B?QWx4VDFJaXlNNjl4aWlSUGhSOEVhRXhNL0twenBZYmZGTXdDUk1mcHR1VENB?=
 =?utf-8?B?R3h3YjZKU1U0UStRT0FGRGtWTGV4T3JkRUxSYmhvVElRWExUS04xbWQ5Y2U4?=
 =?utf-8?B?bWd6S1M0Zm91dU05YlZHVGFCSmV1Zkd5by85NUtheUZkOUt6THVVVjRRalJ6?=
 =?utf-8?B?d0dXSndiNThHVG1PbXliM2NUVkVMcUNDU0owYVVMT2VvRnN3RVF1YXZ2SEd2?=
 =?utf-8?B?bGxqQ01wdDVqamV0emM4QWJVQm9ZaWV2R3dyYUdhUHRldHF5Tzc4clpmWGEv?=
 =?utf-8?B?aVF3ZXdjMzlKSTFQQ0p4eElIOEQ5NEZ4UTFxNTcrOHc0RFRIWUZkQklzN1Ur?=
 =?utf-8?B?SEZIN05sMlJrbzVRUnlKVVFlUUg3ZTdVallWTFh5V0dzNWp4S0M1N3hrNmxu?=
 =?utf-8?B?b0dqbmhmSUNPMTBLaHlsMm1aQ3g5d05aczlvU2d3eVV4TXNoZHQ4cHlFL2Qy?=
 =?utf-8?B?SVNCbG5xdjZUOFFDZGZyUldQQW1sN3kxemVZbUVyVjBQMnBFUXlyOTJIZWJw?=
 =?utf-8?B?aEtDS1hmbWkxL0U5QWhaM1VwK2g0TGMvUUYxNFhLWlUrM0luY3BUcFZnbDNv?=
 =?utf-8?B?a2VxM0NoVGZiSGFVY3BPTWIxN3hOU205Q2RaNmJWdXVud1d2TlR5U0xFTnBa?=
 =?utf-8?B?ODZBdU9JZVhGTlpOdUtsdWNJNSt0VzErVDhRdWp1TDBncUJYZDNRVVlRWnB4?=
 =?utf-8?B?K20rYXpBcEJ0YXpZU2JxaVl2elZES1p0MmRTbEZMdnp5VjZFUkdSZVBuS2RU?=
 =?utf-8?B?aTBPTzNoanRPYTlyQzRwTVVaQmdkSHkvM1lkNUdtMzNQYnIxMnQ3UlU0L3Ry?=
 =?utf-8?B?dk9VVnRISGRJTVl1c2k2dEJDbTJleWlOVzhaK25nQkJvVW96OWdabi9MMUlJ?=
 =?utf-8?B?QkcyMENIZlhXclc5MHVLYm5PUGJpcGxVbHlMS2FBRmtuN1FLZzJwKzkyVkNm?=
 =?utf-8?B?cDBnZTY0bnR1NGN0amNWbUhDank4elA4V09jVXNlbU5HY2hzYVNqK3h6OG5l?=
 =?utf-8?B?eFBJT1FVcUl0a3hta21vS3kzT25yUmNobU1UZUFBUWpmMjd1c2JXdUNadkVW?=
 =?utf-8?B?UGFHL2I2NWZjUTRJenc2TnJoZEowUWladk03M1BsdnA3SWZvKzBoNG5ZV0pH?=
 =?utf-8?B?czJ1NC9xOHR1WThSWmpBZzZtM1hiVyt6UkVVVlB6Z2s4SWp5cEZ1ZURTeTJB?=
 =?utf-8?B?RkZwdmtCTGdnbE5NTVN6bXozYWo4anhDdG5Ia3FkSHFObjM4WUJiNlIrVWhl?=
 =?utf-8?B?WVlFNStTTDV4Z2U4Z1ZjRGdCdGpGdzVEWDhUWmt1OFh4VDAzaGtPRVhWQjhT?=
 =?utf-8?B?NmdMR3I1MzBzVkxDWXExb3NaOWRGeEliT3lLZXBJVmFiZVRVMEt6VDExR0JT?=
 =?utf-8?B?TnNnZUNqMHBTdHd6VFRoakxEOVFiVU9nbkdpQXQ4Mm5kcEFPRUs2cXBZZ2Jw?=
 =?utf-8?B?cjRCZTBuVDB1a0lDWlVKOWZ4ZWVxS0VzU3pVWVg5bjNhQWNIdEkwaEw4U1pN?=
 =?utf-8?B?QmhEQ21ldVI4QTlVTWxKRklnSWpZU0l5QXl2ZXNxZ0E3Q2JLeVdqMzljMWgv?=
 =?utf-8?B?QlRJK2VKYkdhSWtUc01JblpZUXp4WlRIYlE4MVBEci9ML2k0bDBIajRYVkx3?=
 =?utf-8?B?NVdZQUpGRWJyWmd5Rk5LR0ZCRU1EdlNmeXFYTU85dFFUS1l3T3E4Q2xKckFW?=
 =?utf-8?B?NXl5OHUyUUh5UFRjN3FTYXA4SVNxMTdvZjJUSXdJaE9jUUZkb0d4ZnJ5QjBv?=
 =?utf-8?Q?THU+qJDjrDEzlmxT85k+g9LFB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b9f0a2-698e-4c1b-ec1e-08dbb4efbb85
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 06:56:34.0401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vEbCYW/xOdeZmwq24jb2tRD6KggU+cxrPldvuf+RLfHRerU2wbXOvOY+8sQpKwMGGKLtF86QbVGXSMyycepEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7243

On 13.09.2023 22:27, Andrew Cooper wrote:
> c/s 3fffaf9c13e9 ("x86/entry: Avoid using alternatives in NMI/#MC paths")
> dropped the only user, leaving behind the (incorrect) implication that Xen had
> split exit paths.
> 
> Delete the unused SPEC_CTRL_EXIT_TO_XEN and rename SPEC_CTRL_EXIT_TO_XEN_IST
> to SPEC_CTRL_EXIT_TO_XEN for consistency.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> @@ -256,11 +255,6 @@
>      ALTERNATIVE "", __stringify(DO_SPEC_CTRL_ENTRY maybexen=1),         \
>          X86_FEATURE_SC_MSR_PV
>  
> -/* Use when exiting to Xen context. */
> -#define SPEC_CTRL_EXIT_TO_XEN                                           \
> -    ALTERNATIVE "",                                                     \
> -        DO_SPEC_CTRL_EXIT_TO_XEN, X86_FEATURE_SC_MSR_PV
> -
>  /* Use when exiting to PV guest context. */
>  #define SPEC_CTRL_EXIT_TO_PV                                            \
>      ALTERNATIVE "",                                                     \
> @@ -328,7 +322,7 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
>  .endm
>  
>  /* Use when exiting to Xen in IST context. */
> -.macro SPEC_CTRL_EXIT_TO_XEN_IST
> +.macro SPEC_CTRL_EXIT_TO_XEN

... with the comment her updated (either by dropping "in IST" or by
explicitly mentioning both cases).

Jan

