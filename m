Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DD27EA160
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 17:40:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631827.985505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2ZzB-0002rz-L9; Mon, 13 Nov 2023 16:40:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631827.985505; Mon, 13 Nov 2023 16:40:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2ZzB-0002pc-IJ; Mon, 13 Nov 2023 16:40:29 +0000
Received: by outflank-mailman (input) for mailman id 631827;
 Mon, 13 Nov 2023 16:40:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OC0U=G2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2ZzA-0002pW-9I
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 16:40:28 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20611.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58cb356f-8243-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 17:40:26 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9462.eurprd04.prod.outlook.com (2603:10a6:102:2aa::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.12; Mon, 13 Nov
 2023 16:40:22 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Mon, 13 Nov 2023
 16:40:22 +0000
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
X-Inumbo-ID: 58cb356f-8243-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WIMQYytbcpO26ZV5cIKS7nFIjbaSyXzPOkr5mPM+GoFrkarUAbCnpa4u20GINeVoYzBRfvpC5qdGPWdSf/XB0LRGPK72csf57pdvoojjwguG7PM4KQ0JFaPoRybwUaY589dYPeEoR7wr7acAtHN8cKu7kPRnVVgVKmjUQYxBNDHW6KLk8xuN1x4LxK4GUGKrDz7dB7ZMmhUCOIltplVOmCSfme9cF8qdUu3qoxBxBxYc1ZuKAyruZPAA4FDjKpQuxoX32zb2YnRIRjNWNBCspuh4iwcur/zy2popf+rX7KcB4Fz497eCz5v+w0hZAQnxhTK5vQusTCPGpIXGvps3ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bCmofWasZFXA/cG3KHgVCOndFdYkR6t6yoQqezHEVfQ=;
 b=ZqLEJZz9ghJwO3dUwxZSI3GaL47RsRDAr0okhPG2UWWq720J1FMiPsUWviLOM0tIKaRdGyaJztXJsbaaRXyuB3nwE5JN1gths8JnYSu5MWzyatMCzL1E44U4FnX7IsRlve2hyqXby4uDTg0mHFQ97GS9hntldMUGPQWOws35jmUyWSaGXjgVuafa7LfmDjBL9b0QKSx5xS+x5vhfSi9FReBmgQj6d2o+QUGGrxLaoaZxdPM8GSymvHIsGLpPJRmsX7j83fBibU1GdkMuwpuhAwASR2Di+0JjBK7rf3WB6/Py9Nqy/29jurW5GxM56ePObKjBNbSlqwxAnM08670GMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCmofWasZFXA/cG3KHgVCOndFdYkR6t6yoQqezHEVfQ=;
 b=tn053L+4YBOkV1ot85XZ3wRfySlf6DcC7cWhmYgpWe2a27brm6swO33DWceRV4l7qsFc6Xhn+HmqOtB0GLJWfah9w5maAeQR1qT/UOD5vJd2Cr/FXtbxO4a41Srv4XU/jnO2tzb6qCc0d0TYyhbhlT+CQoUbWmCaHCUdbX+D2dp+7Y/vqGzot51/zZnq783Ykfu0CG3s2hLbQGciAv8sRUnK8PXVshctzBfSdzpF71iX4A5Wy2xL2G/9KzftD6rPM/YLbHUAwWlMmmmASYFWxPRuS1gKrbGCLaQQkoVdoiUvSF6QbxPrVDow4TKreTymBAHoIbdYWobEAAZhTIb6hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ca73539f-24bc-407f-f002-1348c4182bc0@suse.com>
Date: Mon, 13 Nov 2023 17:40:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 01/15] xen/asm-generic: introduce stub header paging.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
 <c945fd8e0f92e3e325be77009a34aafcc6cc3a0a.1699633310.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c945fd8e0f92e3e325be77009a34aafcc6cc3a0a.1699633310.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0338.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9462:EE_
X-MS-Office365-Filtering-Correlation-Id: c101005a-9037-4f78-0be4-08dbe4673b17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SRqaSvHfvLkXJgSrmmwtJ9dWwSw0FeSIjCsVGx0xfEx7/ka1YF1EmplcM7dqr3uInDBuTBBtzO3IpgwYA4/wDgUJkqRT4TasaXn9M7GXTvjVEpKVPLvW9EHqP4riAZBHwbc5bgj+yMW36W/667hyXdLzT2LNFPsmQt7fcBL3wp1OztJe8JQi+SuyGrvotOI2dCWPka+LuuL0kjozMnspWmNGkcjln3pttFjXiqbhCrrRAj/6j2EC5c20KRjeea4TyZGQi0s5nF+IPbR0AeEPsYpPfYHZV8hs4PIsM+ibaCKiWyqf7SgP+cWH4oGeQFleg3/aL8ObbBMOWxj4W24rQt+naJCuaM2++uBpr0mMMYBcazGyDcDjohd0QWqGU7bL3vBM9+SGeBU7WG8V2Pyj+TicyI4sLG/5KuBrIW+WSdMB+RhMoIncB7z9rdoshoRcg+kZK1U+xuG0b9hVHSr15zASY8/ScdfquIUJYC/lpNuG4utnA3LWEQJ5a+i9WUQkaaaBF+TSn3DdoZBb/NTtwkE6vs9R1R9XWeHvDF+xlVMY8Ifv0aMgf7vd+BKdgohoUY00hiwXG8VfyKBvZfoJND3PM5Z9kLfZbk3zMii7DAqgBaGn15YL5k5yLuqxVG7nW31QtAz7JBODKC4XQS7nrSVUpcIqa2X3HWSb8gdR8HHQf3gatV/f1SQZ/1OpZdnKOnJflIs+s4nepzPGP3/ndA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(39860400002)(366004)(136003)(230922051799003)(230273577357003)(230173577357003)(451199024)(1800799009)(186009)(64100799003)(66899024)(36756003)(26005)(316002)(6916009)(66946007)(66476007)(66556008)(54906003)(2906002)(7416002)(4326008)(8676002)(8936002)(5660300002)(53546011)(478600001)(6506007)(2616005)(6512007)(6486002)(31686004)(31696002)(86362001)(38100700002)(41300700001)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUdMVzhod0M4MDMzUWNBOWlFNUhsVVEyT3UxaThqRmtGbG9IdjZJUWc3QnVU?=
 =?utf-8?B?RTFSZTlZTWRWL08zdVNhbkhCUnROdVQ1RGhKcVlLSHNha0JVM0F3aUZNazV1?=
 =?utf-8?B?OHdOL1hhWEpOMEFYOFhYNFkvN1FBeFhiQ3lmK1lnWk9QZlhQSURNMWptV1pO?=
 =?utf-8?B?S09QWEZvRHo1MjBVR2lpOHk1V25RY0ZaME90WDdKbUNITktPL1hLY3ZVZ0ZI?=
 =?utf-8?B?SXFRNStqZS9IckEwa2Q5MzJkWFlCN05KNDdCcFliVStndTNhL0NsenYzbDNO?=
 =?utf-8?B?ZlUyRmFMTkswZnZvQzh0Zjd5b0JRSzJiWlMzQkU1ZS93U3NtTTMvbnowVy9k?=
 =?utf-8?B?TzlURWlBRWNVSWdOOGNuNWdLb2g0N3cycDMweG8xall3OU5Za1pGUzJVSTB3?=
 =?utf-8?B?MEp1a1ZwNXhRYVVuUFF0MHZIc1M1RGJNdVVOZThEVWVhWTQ0NWhEMUw3K3ZC?=
 =?utf-8?B?YTNBL1dRZDhNTEc5TElTdnZ2enVMNk1IUUt2R3NhQWg0S1lDQTdXOHl1Tkcv?=
 =?utf-8?B?cUFLY3dYZ3Z0MUNsZDFTZ0JKcVZmd0JVTGNrVHVKVE40MTJOdkFnYzNwZTZv?=
 =?utf-8?B?U1o5NXliRHdZMHJyQmJNeFdqYlB3a3I4Q25icmY2dGYyVVBzY0lMOGZsSklL?=
 =?utf-8?B?QTVvWVFZT2FuZFUwUWxVS21FZy9DTTZPNFhELzh5R0JmVXJON2o0RzhSZGtW?=
 =?utf-8?B?a1RhY2VILzU1NDNqc0taQXU1dXkrQjYvaWhISnQ5dkpEYTI3TGduL0JZWUtz?=
 =?utf-8?B?Y3BZY1FnQkUrYUIzaTJpRDNYMHZXeUtHbmZYU1VaWUhKdHVqUmZBOGRyUFph?=
 =?utf-8?B?b3FYVy9QakZZZW5xUmp5M1ZMZG5QMGlvUDhPRnNOWHlvMGpLYmUyZGRmdThB?=
 =?utf-8?B?L09mR1hzSlRIY3o2U1YwbXcxUU1PckYzajdndzNKZkFaK3BuSFE4MHY3RHpK?=
 =?utf-8?B?dXk5OHpMMWsxVW5tZUhueHZERWtiUjJpSnZEV0YxS2tOeHYxQ0VUOUxHWngw?=
 =?utf-8?B?SnpvTTFPSmNUcFB1cFNwMFY0cEsybjJxK0FLejAwVEx1enBsMzhPNG4rdWRm?=
 =?utf-8?B?TVVtT3dia0xXMkFPM0FPVkFnTCtVQ2pOTmR1V3BYRW5UYkMvRXJ4Q3lCWjJ4?=
 =?utf-8?B?U0Z0ZGZGT2xGaGVjeHhxZnlNU1U0aGlKcUlhaWhxQUFhVTFGNG5xR3lUMXRz?=
 =?utf-8?B?OXNnL05aa21WSWQxV1orSm8zZm15MlhyallRUk1qd2NTZnNBR0FaaXQ0Sjl1?=
 =?utf-8?B?UkhHeVpsRjZhcHBjRThuSmxRd0Q3Yi8weHdKY0psSERSTDhsUDRwc2JTMng0?=
 =?utf-8?B?d0hHMWFoMlBkOUZIVm5ZLzVNbmRkdVNFZ0IvVVllY3pveXk5T2ZBeTRleGx4?=
 =?utf-8?B?aVJ1SnQzSEUvcFJraG5XakNqU3JqK3ZoSEZQWTVQWWFYTHBIZ2JJdXJpN0dB?=
 =?utf-8?B?OEZSdHNCMGxha2V3d1VDNGw3MGg0ZEdnemVmM3RyRU4yL3RyZUhhUmhtMmgv?=
 =?utf-8?B?MHRoUkFtS25sZ3Y4WjlPdE9xbkZaTUNWT0lKYWYzNUFIQmRuM1RIZDdIL1hu?=
 =?utf-8?B?aEN1T3hHeFR2aW4xemVEZnBLaTk0aEFQMHlINlcrbVdxY0lreVd0cWFnUmRn?=
 =?utf-8?B?RzNLNk1JeUs4Z2hCVmFnK084NVZrU0Fzb1JnazVGYzYycE11MEpQQUNRR2du?=
 =?utf-8?B?ZXR6YkFqc20yKytrY2NBdXZZR2tWR0lVbEt5MWFtSTEzTUk3U0k4MlZNZGxt?=
 =?utf-8?B?UGNtLzEyUEJvWDI0aDc0VVdJMUR0dEhCT05oV0ZCKytENWxQVW5VTjNzQU1Y?=
 =?utf-8?B?OWZMdlVYb2FDMEF0Qm9CNG1aUVJXcnN1UThyYjRQYkU0MWtyNmsvaXpIcHFo?=
 =?utf-8?B?bk96aWJEb1l5Z1B6djdXVUh3WGRYUDZCREdORnhlWFdZWSswbVF0TVlOeGtC?=
 =?utf-8?B?cWhVdUNxcUtWYll6N1NxTGtadGtoSm1jcUJCZ1EySEdmNi9Gb1JwV2xETEZj?=
 =?utf-8?B?cGZDVGNYMUo3dmlaTWE1dkZGUGs0dTNweHJWWEdBb1Z6OHBRZWFSdXhKNlJV?=
 =?utf-8?B?ckxNN3dqbDZvWmp6MFFyTVUwNTA1d3ZtK2k2d1FxWGE4ejZoOU9VT3pWam1E?=
 =?utf-8?Q?JqZX2FbKZnyxlkFNC3//Hqwz8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c101005a-9037-4f78-0be4-08dbe4673b17
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 16:40:22.8346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0DuoBvotv7JkiE7uTEIoHfVAEv5NKdzkkqsbnh9iPO8KvCwOCFT32p9LWJnJFV4sWhzyXOZGPh7CnOPvhe45Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9462

On 10.11.2023 17:30, Oleksii Kurochko wrote:
> The patch introduces generic paging.h header for Arm, PPC and
> RISC-V.
> 
> All mentioned above architectures use hardware virt extensions
> and hardware pagetable extensions thereby it makes sense to set
> paging_mode_translate and paging_mode_external by default.
> 
> Also in this patch Arm and PPC architectures are switched to
> generic paging.h header.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one nit (applicable twice):

> --- a/xen/arch/arm/include/asm/Makefile
> +++ b/xen/arch/arm/include/asm/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  generic-y += vm_event.h
> +generic-y += paging.h

Like in obj-y lists it would be nice for the items here and ...

> --- a/xen/arch/ppc/include/asm/Makefile
> +++ b/xen/arch/ppc/include/asm/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  generic-y += vm_event.h
> +generic-y += paging.h

... here to be sorted alphabetically from the beginning. Right here I'd
be happy to make the change while committing, but I'm not going to promise
making the same offer on subsequent changes (should the same issue exist
there).

Jan

