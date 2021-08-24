Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAD63F5E9F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 15:04:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171350.312690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIW6W-0006iA-TP; Tue, 24 Aug 2021 13:04:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171350.312690; Tue, 24 Aug 2021 13:04:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIW6W-0006gG-Po; Tue, 24 Aug 2021 13:04:36 +0000
Received: by outflank-mailman (input) for mailman id 171350;
 Tue, 24 Aug 2021 13:04:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIW6W-0006g0-3E
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 13:04:36 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3d403ff-04db-11ec-a8d0-12813bfff9fa;
 Tue, 24 Aug 2021 13:04:34 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-hXlWO3V9OPqMmqT_L0cOSw-1; Tue, 24 Aug 2021 15:04:32 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB4612.eurprd04.prod.outlook.com (2603:10a6:208:6e::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Tue, 24 Aug
 2021 13:04:31 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 13:04:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0058.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 13:04:30 +0000
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
X-Inumbo-ID: d3d403ff-04db-11ec-a8d0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629810273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yQl0WH6sI/Z9GXY2JJfMfkmze301t6nbON81sx+AnHQ=;
	b=J5isUr6EPrBXHskahfi9e3DkzzYu7ebigRFcx+GAOFs82ABPpmspa7YeUTgHmiVqDnpJlo
	xEXfa1V1SOH1Oc//HeE5m7Ad9khDWKZywxFvrbs/n28CXBWjpi1GwNH2wpk+SCB9DSxTtK
	q3lnQtgpnOPULMFj9fv4q8mh9FgoF+U=
X-MC-Unique: hXlWO3V9OPqMmqT_L0cOSw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mRhijZsteHcFhHkeHvbxRICwrPwZ4V/Zhy4TkS48OkWLIXCyv9K/UC46EPZAYZHetZI2ZJXbkg7+GVMbG6gFyTCaLZ46C2OGeEMg6waBgjQ51rWvo+eGF5Xrgb0hlPbWSsX7U1ByjjnGDQCQsNilbo4Q78aXtBaRpnaUuvAI71uBQF3VrUJqEmMYrrsFX+bVPYqPeu77ghj13cvrPunnZAcpnQ064fnv7n58Yr25YP5SMDqUHvZewCGuXZ/+cExKqt2sNgmADJ56DlQmiiPAp0mLIMiPIPjFBmLXmLfxnrzzStacCpdEXitYV2RrnMLcN4nKA151MvbeAU0moDJDpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQl0WH6sI/Z9GXY2JJfMfkmze301t6nbON81sx+AnHQ=;
 b=HCEaOnIz9UujMNzJZBSrvI9jZkUU+p1++qP1rrCnoH4KXeAa9FJ2q1aLGiqg0QQWlQlBAYTvMRrZ1L90B1A8w3yvxrP2m64ekgfXGIj4fVq1c4e8FwXM91Xqa2FIVbzK4bNc2MlsjFWjcwzJMST9A7150nlNlGis8FLhLmo83MO8xN63/zawrAtzSZNouM5G/iNjuZWuoT0s7QQwysdaVpSPLxgNRLViPby6RlVdmopnVw3Vv5zvZU5i/6LKeuRGxpSiwh/bpPUhwJEiL0JNsWhBamZwcg36gEqI/YzgmnxnbZp07u+RNTA4a1/gv0X3eGa0iyhrDJKNcYt7jtoGKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/spec-ctrl: Skip RSB overwriting when safe to do so
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210819162641.22772-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <75e80f6e-f7e8-60d6-93fe-1a48e40593b5@suse.com>
Date: Tue, 24 Aug 2021 15:04:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210819162641.22772-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0058.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::22) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21362eec-133b-4b5b-c883-08d966ffb614
X-MS-TrafficTypeDiagnostic: AM0PR04MB4612:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB461254CE3E90CB4224CE7306B3C59@AM0PR04MB4612.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8JtFC3GrMYaf5dSIHNOT9KnYQ1xmsR+YKQm8WIYsdnhLZ+kOgUtGSm7BfCqn+3RAK8jJIMR3j6TEYYN8muZhebIygpv5uWLyn0XxV6s42I0Ub3m/8J3eo0d+i/9Av3mzEbvAYB3Wv3eaSPi31vrSzSD6IAlVRidGbqNVyG8bP0Ea4IuyIc1CWaxQ8+RJRor9HBcqk4u3vtYjnLWnFncLgUK+A4lwcnUg7R1ly40oeTBRcEn+DOWs6/+ko2o8gCn9+/dtCX5KOc7y1KheD1NbhOIKDeh6Gt0XVH/4MEccisP4rakOUctmz41V65Ml72XAlahksTKV6Vn1mn6YfuR/GIgh5rmlqcP6zfXjh8DyOFd2jCECVU2P+WUyun/nICGcBBhW3KKh31c0gThE1PNoyQ0A6V7Soy0MYIFz/ADS9/YqbhQPKkR84AjB1wCgP57winTTF0N0COJcP5qAtprPL/R70myU4uOivZ+sBpkuEY8ryctb7J9WPaBl+GR7UboYYuvTpQm/8UWOffvdtJhv4gQF9Ygt5dJTp+K5+YbiElo0lf5kNRlwmnZIoCD3Gxqmz299G4B1bf18eCD/PbX6L4fuir5VRqEtL+ossBdzAQDs6d0nf4gUsoe3XX1ly3SIf5eT9jfFEcRrybZ60LR4gGjaDI5fQujqOo8mRoHw1yVppvKaMF09DeS5JXbf16euqyPNMDwODddSYCZrtfDt2jhNrmbp3PGsU5Rga8aEsQw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(136003)(396003)(346002)(39860400002)(5660300002)(66556008)(66476007)(53546011)(31696002)(66946007)(316002)(6916009)(54906003)(31686004)(8676002)(38100700002)(2906002)(4326008)(6486002)(26005)(16576012)(956004)(478600001)(83380400001)(2616005)(186003)(8936002)(36756003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVpQWkxTZmJ4T0ZMa2NrM3psc29kcGtvcElVTlRZSlhIUzhNM01MbEJsbnF2?=
 =?utf-8?B?ZHZFU3IvbWFkWEpsalpDWDRDTkN6b05pcVorbTlWTmVxNVg1WWhrc0ZnTnRq?=
 =?utf-8?B?WjFrS0JuRG1lYUVoSUJqVDcrTm5GbzFqQzJyY1JsellCaFhQaXNaaC9UL1I2?=
 =?utf-8?B?K1ZiZkU0QXYxcW9PQnRNeHd4ak5DdVZpeHl4cVZZRHNzc21KaDlXMUpPSk45?=
 =?utf-8?B?NXlWSXdFQkpYTTJlVW1WL3Z4Kzh2ZXBMY0ZVajdDQkRKY2lLdW16cG0wMWho?=
 =?utf-8?B?bzlPOUc5TFpXZHBsTjhwWnl5cXU2UmhXdWRta1FBenUxY2RXYyswVmpuYWo1?=
 =?utf-8?B?dXkrK3IzNm9yVjVhK1laOFpCd2VOUmZjM2dhSytXd3QvZFZNQ3BIK21NeWg4?=
 =?utf-8?B?Y3FFMjhaT043UjlqRXRmNGlnY0VLelBhRERaWlNVYXlzQlVkNlFGK2hucXVN?=
 =?utf-8?B?R3VxTjJvd1BqT09nYW1nVGpmY2tiMGRxYkRpb1pXZURDaU1WWndDcWk5dVZm?=
 =?utf-8?B?TFUxaE5GKzkzb3NZMGlWQkcxblVRekFaeFc0T09QMHB5ZGgxa2VRcFY3ellk?=
 =?utf-8?B?UTR6Q3c1UStCaDdydmFuR0p3cW9ZMmtHb1NzTSsvYVhvaXFrSFhDd0RrMXho?=
 =?utf-8?B?WFpiUVJpVzM3OGxqWkI5cmF2d1hPVmdnOXFOOTNycUhFS1lrazVET0RWSmgx?=
 =?utf-8?B?dDE1NTBpMytEWTNJanlpTnpiOUQwZEZkdy9GdzljTEdyT3dTaDAxTFFtQnFX?=
 =?utf-8?B?VTRtcTdNWlgxN3VHVEFRS1VWRnB0TkgzK3pDT1BHeW92bXdTdzJxWmZNY1Zu?=
 =?utf-8?B?ekxWTWFTZ1pUZWxRRGR6UmVCak9GeWJhV1JYV1NEMkxZQW8vZFJicGlSZDQ3?=
 =?utf-8?B?RTk2VTM3QzJIRmpkYW1pK0JSMnMyNjhNOGFMZk53d3VwbGJRWW9vZDZ6cW1T?=
 =?utf-8?B?K3FZTGhndDY4S3VmTWwwam05STRsRDI5ZThpNlY5SktRS1ZEaXJaQ0FqcmFn?=
 =?utf-8?B?TFI0Q0IxREVLMENTakhTTlc4Vjk2bnZNOXlUb0REaTdTMjdRMVV6M3gySmxn?=
 =?utf-8?B?Qm1LTGZvSFZUNUZPcUZKRWlYcmh6U0hsZXAycVdqT3dRUEMwdFRCalVaOXV2?=
 =?utf-8?B?ZWkrcmVsMHpOWUdaVUdpSEcvaWZOczB4bmhkQTFHSFdZenhsSlZuYU5mVjYx?=
 =?utf-8?B?aWdFUTg2dHU4cmxrR3BjTFhvUFNOS0VVN3Y3QUVkVDdSZDh1UUsyQmRkSHhW?=
 =?utf-8?B?M1YwZldVZC81ZG9iQm1sT2VWamRIK1JZVkRHbUpwREJJeFFxS2xtdmxMRW4z?=
 =?utf-8?B?ZmgrbzllWTFkZ2JYWWlMWDBMVHEwdnJlTDZjMkZxbkVPRlV5WHhVY1hJVEEr?=
 =?utf-8?B?UmVtNWc0MU1vTVBrWVJJbFZXZVNYNWhabFpvOC84cmVCM3lnR1Jqb0twbFY0?=
 =?utf-8?B?RWpLejF3MU9ha29ja1BQM3FlajR6UTB0NE4rMkNUTXZ6bk1LOXZEb1Byd1Iv?=
 =?utf-8?B?NS9hTldqdkd2SXNwSDVpU1lxT0xNYVBxU1BCa1JJZ3FCQmZvUjY3ckRZNkhs?=
 =?utf-8?B?MFFkbXhkMGdxWUlidEIya0dxRUZiM0RwM0tMaUxOVlZEVE0yTmNIM3psVjBO?=
 =?utf-8?B?Q0I4WE5HUmNob0hTSDVzNmMwRGROaTVIdmJOUmtlZ2ZUVm1RZmtsTVI2L0hS?=
 =?utf-8?B?cnFUSWNNd0ozcy9Na1pXSHA4M2h0cTQ2aGFqVTZsY244OElqcW5VajU4Zmc3?=
 =?utf-8?Q?9dyFBatnI1gp1mp4jNUV3FLgsS8b8JJztSd+7Y5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21362eec-133b-4b5b-c883-08d966ffb614
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 13:04:30.8004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HpJZ2xmb3hnVa5oGvkgePN+GWx1vihJzHaCyZpser1lf4N9qCCjRM7xYHqIFhtIg6yPqdef7A29LHb8ffqbP8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4612

On 19.08.2021 18:26, Andrew Cooper wrote:
> In some configurations, it is safe to not overwrite the RSB on entry to Xen.
> Both Intel and AMD have guidelines in this area, because of the performance
> difference it makes for native kernels.

I don't think I've come across AMD's guidelines - would you happen to
have a pointer? Nevertheless ...

> A simple microperf test, measuring the amount of time a XENVER_version
> hypercall takes, shows the following improvements:
> 
>   KabyLake:     -13.9175% +/- 6.85387%
>   CoffeeLake-R:  -9.1183% +/- 5.04519%
>   Milan:        -17.7803% +/- 1.29808%
> 
> This is best case improvement, because no real workloads are making
> XENVER_version hypercalls in a tight loop.  However, this is the hypercall
> used by PV kernels to force evtchn delivery if one is pending, so it is a
> common hypercall to see, especially in dom0.
> 
> The avoidance of RSB-overwriting speeds up all interrupts, exceptions and
> system calls from PV or Xen context.  RSB-overwriting is still required on
> VMExit from HVM guests for now.
> 
> In terms of more realistic testing, LMBench in dom0 on an AMD Rome system
> shows improvements across the board, with the best improvement at 8% for
> simple syscall and simple write.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit with one further remark / request:

> @@ -992,18 +1021,36 @@ void __init init_speculation_mitigations(void)
>          default_xen_spec_ctrl |= SPEC_CTRL_SSBD;
>  
>      /*
> -     * PV guests can poison the RSB to any virtual address from which
> -     * they can execute a call instruction.  This is necessarily outside
> -     * of the Xen supervisor mappings.
> +     * PV guests can create RSB entries for any linear address they control,
> +     * which are outside of Xen's mappings.
> +     *
> +     * SMEP inhibits speculation to any user mappings, so in principle it is
> +     * safe to not overwrite the RSB when SMEP is active.
> +     *
> +     * However, some caveats apply:
> +     *
> +     * 1) CALL instructions push the next sequential linear address into the
> +     *    RSB, meaning that there is a boundary case at the user=>supervisor
> +     *    split.  This can be compensated for by having an unmapped or NX
> +     *    page, or an instruction which halts speculation.
>       *
> -     * With SMEP enabled, the processor won't speculate into user mappings.
> -     * Therefore, in this case, we don't need to worry about poisoned entries
> -     * from 64bit PV guests.
> +     *    For Xen, the next sequential linear address is the start of M2P
> +     *    (mapped NX), or a zapped hole (unmapped).

IIUC you mean the compat M2P here - perhaps worth being explicit? I'm
also not sure why you use "zapped": Nothing can ever be mapped into
the non-canonical hole.

Jan


