Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D19461A32
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 15:45:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234606.407141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrhtt-00061f-8g; Mon, 29 Nov 2021 14:45:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234606.407141; Mon, 29 Nov 2021 14:45:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrhtt-0005zF-4n; Mon, 29 Nov 2021 14:45:01 +0000
Received: by outflank-mailman (input) for mailman id 234606;
 Mon, 29 Nov 2021 14:44:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LLD+=QQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mrhtr-0005z9-Ft
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 14:44:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec98cd01-5122-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 15:44:58 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-lTUqHDYuO2i6FpHlvb1rjg-1; Mon, 29 Nov 2021 15:44:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2605.eurprd04.prod.outlook.com (2603:10a6:800:57::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 29 Nov
 2021 14:44:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 14:44:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR04CA0066.eurprd04.prod.outlook.com (2603:10a6:20b:f0::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Mon, 29 Nov 2021 14:44:54 +0000
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
X-Inumbo-ID: ec98cd01-5122-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638197098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l9uxBhHKCmsBO8I0UXqdQ7QHoBG74brimC5VB0jo+3E=;
	b=djWd5HsX75ERhQQrry0kn0DBVb09VZ3ykjXkTrcuxFN8HBR0OyLmeUtXkLxA7Mjhk0tigW
	y3pZy4tqbACv+agyOchk1/EOfv7BjLSUvr/tuFNuWLcd2zJkepBEzJHG6/cLb1/jvDpmfJ
	ennn2nZGbeIDEWVAFyevd0Bm9gdX+uI=
X-MC-Unique: lTUqHDYuO2i6FpHlvb1rjg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2o2xHaX3INpaIBpLymCgqYh7OYaXBpqn1sls2+e4zzMkTu6ZoFpRbixKZ/eDCG2oLlSlbNqLw0OAzO+B26So+k0IY7aLs7BDiSY7gZ+WHIHBfn9kzwouEAhzzQ85AM/p9rPlM6oLQfjsycG+2TZ2R3LNGovcWx9LYxMlt/iANExJps8hAyzXCSW/WNKAny/LMnznBnvEWhurMw2RRxYltnPIwfuLeExBvFEDYWABdKOm8usHz0cJPeURtBRzEsE5Gl6q4EdjTrwg8sBOvU5afbzxC6zDE+7LbVxqWY3Vo2RMs00DusA1rGkvOjsYc46ceekj5NFA/ruSKBRoPQR+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9uxBhHKCmsBO8I0UXqdQ7QHoBG74brimC5VB0jo+3E=;
 b=e71uoWfwU5SHf4/MUKsKEIujukDqbEAuoV5umCagXweO4g09ixI4v3EtFr8aq48I6M0nBzKikfB+BasR6kBLlqWj742kBfhWmuz64aZHJDFx+Ez8OZ+BiQU3Z/tjFoBWjBqNSId5VghQ0XxWG6Cyn8a/V8C3Lmy1hjLwKyA7N6agrkqKLP7hessnaDfB/KM4UZKJPGByFjEsBGTZOpWbD9taQnB7bivyMd7XQhJQXsC5wC6GMU2QWsTqfs6n168a4GyxGYXPWqeP72DsBhnl6gFs7aLiZ1R3Aim9IwX/rE3Ple6dxcMW26hyq5K1sW8grOP/qoM+E6tlB5aLM6+lTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <178aa1cd-b510-7e3a-2074-a2ae261d4975@suse.com>
Date: Mon, 29 Nov 2021 15:44:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 00/65] x86: Support for CET Indirect Branch Tracking
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0066.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::43) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4177456c-a71a-4f1a-13d4-08d9b346ceff
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2605:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB26053FF7007861B4A1630E75B3669@VI1PR0401MB2605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UkWxZh/cO9hqwYEtKuaJdaVnhu8UjLSWMeJU3zHA7/lQ5C7H2lA3qtluS57qy9Q6ZVh/RMr7OfOphtBynhGqeATz3Vv8INzurXd/LWZsivAQlODWAJPH0iOIdckRkzqDAPylY47NvxEKvn/G11f4U+Ekf8WlhbtJdeeE3OIU6e3ngwzYRycyA7atjIdf1b0gfrtUnzRtYwAlUBgzXWgY26O3WyKH+42OYKaIJaZO2y16E1bpNOZT7jboz+OMobi0lYL3PVxdx7EdgXS+HzvKOdTLOdeD5eCCvBE6UGO97Fx63IKvxTGZmJWhrD9FcOAAuSMYWur8hq8q7DLjGR4nMJhR4OhJiGABLwtuufSu6mB1Tzoork88JRh+Ju9lQgRX9Z8fzQk7ySIBOL3UayXc2N+274erTZzIUnJxREvLGy5/opm/fA8PXEjt/qK2VsB435JJN1K8PrB7uh5gU0MgMu98V8QfxDony3bydqFBP0Rd8Cgvg0dUsBKWxjnrN5lAGZweJlBKZ+tGLN1Ro2g1qNZXA4fhxoNxtSZAKZmRM+3bHe83eTBwaOfjesglIC/9SHbVnju2ynhW7uSMrxY3pFMJErnu+tAA/RD9dB2I7kAA25/9lq4O+graEUswJv1u0NlChRjszxEt3/Wjkgp07nC/HG2V7ra8G5YaIaTOyByjATxlv3zKUrdxoywTIN5TP0CLC72a/ZPEWDmBSYu0qxg/aG2v+p+F6Y7+Ia6V8bZZCHyzGdKrl0CCtRNnknOMqVJMaWZrBr6LDj5ZhI9HUiTiU8qHsTiMke17yU+jFKfuvV38BFBISZP1YJsPntAIrb7DdLCOxHChsJFdkjnxmA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(8936002)(2906002)(86362001)(956004)(2616005)(66946007)(83380400001)(66556008)(4326008)(31696002)(8676002)(66476007)(508600001)(5660300002)(966005)(31686004)(6916009)(316002)(38100700002)(186003)(6486002)(16576012)(54906003)(53546011)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkphVTJQM2x4ZEZPVzBhbVRMMDhIRGtsNVpGcXY5UzFBZ2w2NzVOR0d6TzNQ?=
 =?utf-8?B?S3l0U0FqOTBhaFYyc1N5TzZqWGRDVWZkdnRtY3lBVjZwTEpHWnUyUlZ4dVVW?=
 =?utf-8?B?dkpNakZWOXUvK2RkOFB2aGdwRXhEaitId3hHbmJCdENMOWFxVjhJNnMrZE83?=
 =?utf-8?B?bTR4WkNWamVBWGtCc2Q3T0tyU0JjeHhybGttWFR3a3d1RXRsekMrcWtlTE5C?=
 =?utf-8?B?SVNIaVBFdjJRbnlrZTlCU1lWWmZTMjNuRjZJU2JBR2JpUkVKOFp6QW1LUnha?=
 =?utf-8?B?aEtEb2x5Rk0rZXErWUNnQXZPUTlPKzFWOHlQSTJmM3ZDSE5JWDZPc0N0b3dT?=
 =?utf-8?B?U2grcjYvNlZoRW9qMWFGL1FFS08wMEJ5V3pYM29CKzFpVTZuY1l0MC8wVGJM?=
 =?utf-8?B?clVkS2RNUllpL21jWWhocWpwMUs2VWhVWURsMFJNRTV2bFFQbWtQV1dZc082?=
 =?utf-8?B?S05PaitVMXQ3SjJ0S0tQMFV6UDlRNE85T3ZxTWYrQlVlK2NEd2pLb09DSXI5?=
 =?utf-8?B?RWt4bGNNRGswS3g5eFM2Vjl6QnJ1a1pOVTQvQXhSQUlZSkFDUXVSa1ZVK1Vu?=
 =?utf-8?B?U3B5VnFEQmljWG15dTFwRmxlQkx0NzBOem5DbG1CUndEY1NmQmM5Z2VZVGhR?=
 =?utf-8?B?S2RUN0JHWXlaWHowNXE2RFJhOGlHejZjTDd4aU00dnlnVnp5aStJcHdEdHg2?=
 =?utf-8?B?REJKem0rL0ZNMlhWNk5rcVNtUlRyQmtaKy91YzIrdEVGOFR0K0Q0QWVJMkhN?=
 =?utf-8?B?bCt2YzJlbW4vV1pNOWVUT1ZCUTBDRlR6UzRzQ3M2OWk3Q2E4K0x6Y1U1OGdF?=
 =?utf-8?B?VzFLcUw4K2tEMFZQRFlTWE9naDZPRlRyRDlEYUQwYzJEbjV6M29xbWNGeHdC?=
 =?utf-8?B?WjYzUmIybm9qVDh4ZnhsV3J0aHVHZVNEWVlKTFgxN01nSXJYeXRyY0RBdENB?=
 =?utf-8?B?eDZaVGVHZUlhRWpvblVMUnd2Wk1tb0lZQXMwRWw0T2VsYkJMU0M1NS82a1pZ?=
 =?utf-8?B?L1FIT0kycDdpOUpkeWljYmNpRmpXZmV4K01Wa0w0djZ4L09HT204VEord3lE?=
 =?utf-8?B?SFRxQytjejR2RThSb1EwL3I0Y2hsay9PMzRJTllGT1M1VlZtaW5sZzlISHVF?=
 =?utf-8?B?QWJSUFd6dTFtTjFZUlR0WnFYYXpwRGF0THpoT01TcUsrWmJKbG1EOWpodzc4?=
 =?utf-8?B?WWUvV2Q3bmJFSEVnMDRvVDNOYjJOVHdJd3JzRzFWNXp5TkxtcFVzUEsxRzlH?=
 =?utf-8?B?RVp6VnFINnA1UTFZTGhnblpWZ25nOEpoc1FjTFpFRENQUnRKaEN2a2dFMFNh?=
 =?utf-8?B?QXdTWU1VcE5XVTZKNkI1RTlEN1dGYXpMNXFDdDJtdkNyZUovOUNRbEQ0YU5S?=
 =?utf-8?B?WmxyUVRVRUtxNkdTZzd0TktqUXh0alRjb01XK0lRS0lPQmsyakJOQ29sUjV0?=
 =?utf-8?B?cVBZVWg1cmdndW9iOTR1V1R4NTFtVFRSY083dTk2VGkrSFR1UThXeHUzWExV?=
 =?utf-8?B?QmhWUTNyYVhCaHVaL0lKYzFhU25oK2lHNzZtdnFKMHoxZE9MR3dpRVZxYi91?=
 =?utf-8?B?ZEd6THpYNkNra0VTQTROMVlpeG5mR0NXOHhEM3RPVlgyQXpiNmdnTmJWU3Mx?=
 =?utf-8?B?S2RDVmFNU1U4bnBLOU1CcERVQ2tTRjFoZ0tkQjMxUHg4OURqNlhhRW1RMGdF?=
 =?utf-8?B?R1cwckk1VUEwSXpXR3dBZFFCWWZWUFVtblVyYnVGNW8xend6RW5ITldNazNj?=
 =?utf-8?B?UElFT1h1Q0pLQk9UMFJENG5mOHR1ekNzdkhFOUVPcU9SZzN4ZW5CbWFDTDBu?=
 =?utf-8?B?RzgyM01ZUjdWZHBYN3h1M3dQdUhoSFlEK0FTVGd0SlVpcWhFUm1kRVJpRjFn?=
 =?utf-8?B?ZEN2bm9tZnJzWkFDVVMxSEI0UU8vUGxqVG15L3NTQU9laVp1Tjcrclc1ZERS?=
 =?utf-8?B?U3ErL1JRZmI5TUlLNnZiaHFNMU1lSFcwL1RERkp2UUNhQlhGc1lRNDRZVTBq?=
 =?utf-8?B?c3UvWW9xL0JYL3hCKzllYkx1bVNlZUY0b2VUVzM0SytnWUZDTFU2Wk1DeFNq?=
 =?utf-8?B?U2tBakh2ZTRCdFoxK0pyNFNYaUJLN3NIdlRVNHM0Q2FyZ0ZrelczZmF2d1J1?=
 =?utf-8?B?SHRiZ2Rwc0c0ZmdmN1Yxc2NPb3c0c1l4Z09DbS9CeEsxUC9SU3JMdURVd1lr?=
 =?utf-8?Q?8jZ/kAV/nMyi+Sp9mhoonxw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4177456c-a71a-4f1a-13d4-08d9b346ceff
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 14:44:55.3090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C6QK+QkrcJFk4cU9/Vudd7zN3Xp7C0ux8qPpKQdGk7ckEvuP16yP307ZfMAtJHtoOWcccqvpLcUHqwVmJqyHWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2605

On 26.11.2021 13:33, Andrew Cooper wrote:
> CET Indirect Branch Tracking is a hardware feature designed to protect against
> forward-edge control flow hijacking (Call/Jump oriented programming), and is a
> companion feature to CET Shadow Stacks added in Xen 4.14.
> 
> This series depends on lots of previously posted patches.  See
> xenbits/xen-cet-ibt for the full branch with all dependencies.
> 
> Patch 1 introduces some compile time infrastructure.
> 
> Patches 2 thru 56 annotate all function pointer targets in the common and x86
> hypervisor code.  Patches are split by API and in no particular order, and
> largely mechanical.  As such, I'm limiting review mainly to The Rest.  While
> doing this work does depend on an experimental GCC change (patch 56), the
> result does actually work properly with GCC 9 onwards.
> 
> Patches 57 thru 65 do the final enablement of CET-IBT.
> 
> I have developed this on a TigerLake NUC.  Many thanks to Marek who has also
> given the series a spin on a TigerLake laptop.
> 
> Some CI runs, green across the board:
>   https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/416737379
>   https://cirrus-ci.com/build/6547947216175104
> 
> Various note accumulated through the work:
>   * I have already posted patches fixing some of the most egregious (ab)uses of
>     function pointers.  There are plenty of other areas which could do with
>     cleanup.
>   * With everything turned on, we get 1688 runtime endbr64's, and 233 init
>     time.  The number of runtime endbr64's is expected to reduce with
>     Juergen's hypercall series (see later), and in common deployment cases
>     where not everything is compiled in by default.
>   * I have not checked for misaligned endbr64's, and I'm not sure there is
>     anything useful we could do upon discovering that there were any.
>     Naively, there is a 1 in 2^32 chance (endbr64 being 4 bytes long), but
>     this doesn't account for the structure of x86 code, which is most
>     certainly not a uniform random distribution of bytes.
>   * I have followup work to reduce the number of runtime endbr64's using boot
>     time patching, which further improves the security benefit.
>   * Patches 2 and 3 are a minimal subset of Juergen's hypercall series, with
>     patch 4 annotating every hypercall.  I failed to get the full series pass
>     in CI, so put this together as a stopgap.  It reduces the dependencies
>     involved, and patch 4 can be dropped if the hypercall series gets in
>     first.
>   * The x86 MTRR code is a complete mess, and as far as I can tell, is mostly
>     pre-64bit support.  It could do with a prune.
>   * We do many passes of the MADT counting objects.  This is a waste of time
>     and we should count them on a single pass.
>   * The NUMA setup (SRAT parsing) appears to happen twice.  I'm pretty sure
>     this is one too many.
> 
> Andrew Cooper (63):
>   x86: Introduce support for CET-IBT
>   x86/hypercall: Annotate fnptr targets
>   xen: Annotate fnptr targets from custom_param()
>   xen: Annotate fnptr targets from __initcall()
>   xen: Annotate fnptr targets from notifier callbacks
>   xen: Annotate fnptr targets from acpi_table_parse()
>   xen: Annotate fnptr targets from continue_hypercall_on_cpu()
>   xen: Annotate fnptr targets from init_timer()
>   xen: Annotate fnptr targets from call_rcu()
>   xen: Annotate fnptr targets from IPIs
>   xen: Annotate fnptr targets from open_softirq()
>   xsm/flask:  Annotate fnptr targets in the security server
>   xsm: Annotate fnptr targets
>   xen/sched: Annotate fnptr targets
>   xen/evtchn: Annotate fnptr targets
>   xen/hypfs: Annotate fnptr targets
>   xen/tasklet: Annotate fnptr targets
>   xen/keyhandler: Annotate fnptr targets
>   xen/vpci: Annotate fnptr targets
>   xen/decompress: Annotate fnptr targets
>   xen/iommu: Annotate fnptr targets
>   xen/video: Annotate fnptr targets
>   xen/console: Annotate fnptr targets
>   xen/misc: Annotate fnptr targets
>   x86: Annotate fnptr targets from request_irq()
>   x86/hvm: Annotate fnptr targets from hvm_funcs
>   x86/hvm: Annotate fnptr targets from device emulation
>   x86/emul: Annotate fnptr targets
>   x86/ucode: Annotate fnptr targets
>   x86/power: Annotate fnptr targets
>   x86/apic: Annotate fnptr targets
>   x86/nmi: Annotate fnptr targets
>   x86/mtrr: Annotate fnptr targets
>   x86/idle: Annotate fnptr targets
>   x86/quirks: Annotate fnptr targets
>   x86/hvmsave: Annotate fnptr targets
>   x86/mce: Annotate fnptr targets
>   x86/pmu: Annotate fnptr targets
>   x86/cpu: Annotate fnptr targets
>   x86/guest: Annotate fnptr targets
>   x86/logdirty: Annotate fnptr targets
>   x86/shadow: Annotate fnptr targets
>   x86/hap: Annotate fnptr targets
>   x86/p2m: Annotate fnptr targets
>   x86/irq: Annotate fnptr targets
>   x86/aepi: Annotate fnptr targets
>   x86/psr: Annotate fnptr targets
>   x86/dpci: Annotate fnptr targets
>   x86/pt: Annotate fnptr targets
>   x86/time: Annotate fnptr targets
>   x86/misc: Annotate fnptr targets
>   x86/stack: Annotate fnptr targets
>   x86/bugframe: Annotate fnptr targets

Patches 4-55 as applicable
Acked-by: Jan Beulich <jbeulich@suse.com>
preferably with the subjects disambiguated and the minor remarks on
individual patches taken care of one way or another. It seems to me as
if the annotations on declarations are going to obtain a meaning, so I
guess I'm okay seeing them added despite not having any function there
just yet.

One question though: With the large number of __init functions gaining
cf_check, wouldn't it be possible to turn on CET-IBT only when we're
done using .init.text?

Jan


