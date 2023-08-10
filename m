Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C22677739F
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 11:03:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581998.911502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1Zq-0005FY-Pl; Thu, 10 Aug 2023 09:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581998.911502; Thu, 10 Aug 2023 09:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1Zq-0005CC-M4; Thu, 10 Aug 2023 09:03:30 +0000
Received: by outflank-mailman (input) for mailman id 581998;
 Thu, 10 Aug 2023 09:03:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qU1Zp-0005C6-9h
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 09:03:29 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c48c91d5-375c-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 11:03:27 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9082.eurprd04.prod.outlook.com (2603:10a6:10:2f1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 09:03:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Thu, 10 Aug 2023
 09:03:25 +0000
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
X-Inumbo-ID: c48c91d5-375c-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBl65i9j1h4b8VjazPCcar4Cm1VEisjHAEyyscLeHOC7znseL4f3ih6s0ia8zePz+mTV2NZ/1poFeCZ7mm+udmvJgMELPnCu8IG/lQeUGUnN/JeRoamaLMiNmpVyl/k9yee3mCN9yL2qpJzqvHFLowcxpt9nHY4iBTStFieD6KMtNkoQRXCqh2uUK7t1yzRQzXG7A/tGUG2ggQweuJUV4D+iVCtgFbk6GF0lxD++mOFCsb+wEFEtQiOaOgR/xxuAbbkjjXfRn5feWsPBA7iRqxvyEwIcdF/lwbOT2t8LBPnUfVTb4GbUAODqL9ggnon1sYtB1RpVLExA1JZQtua2gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYbPWEJQzOMw3aJzgHc0ko79hzSrUrc7ncYYQOm2RWk=;
 b=QJ20BcuJt5HUyVhWJPb18whrvJUfQ5YXmhBhDUfxgTMJG6aUYNbacwPLgHwhUQAn+gvDn2AoE03zkLWLTwFn3CWY2xFhSSYPYo5nT26oxWQmz7qycsWEFwgcXDKptS9J1dFMHe1rCijpr84ay57CaQREFOtVe10zeyFgxbY7X30Zb8/XctTHKtUhvy8VtiqSAKSMIk15M8lGdPt2mjJXmuOzk5tZHYR625NLTlQKVJIt1PDNFJ6zmxasGhJVaf1gkEby89/ywaqouxFy89+M6ujHRl1oLw1Lr9e4UBzhPdcFa6Rh2UTS6ecCRhzdJXYexQ12lJYSDnhwbB+Pz5ItZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYbPWEJQzOMw3aJzgHc0ko79hzSrUrc7ncYYQOm2RWk=;
 b=nUTC3UXm2cap1MvAJysbdZ9ULiFdQw3ZXIVGe6ZIbxzsAAiChlStMPK4MNSGmllU9zGn/Vx2Uvd8L99lRrfLVh55wGOEbTLMFApzRD2CfczWWNILLS7WKo5ILgrEwxIObHkFVFgSfL5WcclVFYL30nNQVcwHlUksfadtFDOetb3kXeYLTThUOYp7T8xPNGF6/LGRK1QDjx33I89k1F3JldtrcPibG5mwwes7d6kNJdx7S/JFsKUQ9wI1m89F4uCZr+yVCK2NoG75tskOf2IwMv1ld2e8K2x1wI+wlNVxDWcK+GlOy0qcQxMd87GwwU3s8qsr8GsDH+97tIvY6nhRJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b09536ee-2223-8ed9-6613-765626ac5c43@suse.com>
Date: Thu, 10 Aug 2023 11:03:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v2 5/7] x86: make some functions and variables static
 rather than extern
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691655814.git.nicola.vetrini@bugseng.com>
 <b9c554bfb322912d294007958339cc40c9d5a876.1691655814.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b9c554bfb322912d294007958339cc40c9d5a876.1691655814.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9082:EE_
X-MS-Office365-Filtering-Correlation-Id: f226e0a9-4cd7-4af2-6022-08db9980a7ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BSIPTuAD2/7XODCAVYwel0troF706ri3FQizu5jdRtLoZv3Y7qkMfXye/O5p4eLG22ivT4z+XqKKmplIoXV0r69CTCl0/e4Zd/wa671DEUcdrBQK7BO0Xudg6XAKL8KB0ENprZO5cnnVoxFN3KTnoYjyC+CjwVrlUciSDpzRHxwZjrxvH+/HwsKeMH1nxwjNC8oHQsr4SFH4IvvYWHJKD6fcRNIhP0D6NxwDX5HsufZOEevZZxkQMf9CaML8dFL0GJH7crfP6/1EB72bfwhyeh9kBbNZ9zc8osp/s2vqkx96FSKossGVvM3SRNW6RxDHUagDjfPMl1ZFhpukFAG+WxoVM7r8IGDoNH8IPlKSTsScJlG14Juue4Gu+njo1eVAiiCD59L3niFaLko2AQGFX7WY5rlEU5E2YRbHRYubCnog+mStEXvd0WzCjlA7Gs2sOPW9xxaQibfFJ/3ihJpogT9v8bt4ZVR6LxbMFjBIz/vh1uWao/sQ0MuYOxsz0sDxnvrRZnITCbyXSv+OPQo3qCxc+L2lOEKz/hO2+iU+fdZivgXuG8tOjuEOfXWL3rNAjbS+tO5K0K8NVjsdGfcHB2sIvZ+XqmVwbAr1SXRLLc5U1Tldhb1uGhNX7xGGaUGHg9Nb5WyhFRGwrrPDznnu+g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(366004)(396003)(39860400002)(186006)(1800799006)(451199021)(7416002)(66476007)(66946007)(41300700001)(6512007)(6486002)(36756003)(6916009)(4326008)(66556008)(5660300002)(8676002)(8936002)(316002)(31686004)(54906003)(4744005)(478600001)(2906002)(38100700002)(26005)(6506007)(2616005)(86362001)(31696002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dm1lWW9qbTVwSkVtWDRCcEdMMnlUSlM3dEl0dWd4bXZlLzl4QUF0aVEzS1Ft?=
 =?utf-8?B?bGxsZTdLM3VyQWpWSXZ3RlpHNDVScmVaVGE5b04yUkdGNEJZeEVNdG1tV2l2?=
 =?utf-8?B?dU9ab1kxaWhXQ2V1Q2tYbktKYmRnRHlDZzFNenhjc21BQm1mb1pwMUVaa3dw?=
 =?utf-8?B?ZlIxK01NYVNYY3BjWDdhM1JTajNYN0IxTE5ZQUFUY0hZRnV3L0QwTU9DalJ0?=
 =?utf-8?B?SXgrbVFLOHdXYm1Wd3lZN01JeG4yci8yTENBdU9RcnNHYzB4aGlML2dLMHZo?=
 =?utf-8?B?aEc3VHA5U1NxRWwyemR6UmFyZUpuZlN1dllrRVliV2xBZ3YvQjN2eTlRRGFS?=
 =?utf-8?B?TldKZ3duaHRhZ0F0ckFDY1ZEbUMvbDN0ZlZFZmVpUDhHU0pES2U3eEI4dDA2?=
 =?utf-8?B?NUlXOWFkSXQrT1pwbHRsVWxyTTZ5bVZpb2VrcWN1WGpzbkpRN01SVWpocjJw?=
 =?utf-8?B?YVdVbVZmd3lYL3hxWDVDU1JEQWdYZDMrYzdMSVhXb0xlTVRIdEFFKzQ5c1Va?=
 =?utf-8?B?R0J6cVAwUHZPUzl1QzlWNDl5alhCQUFIRUdhZHREV2ZseXJoU3EweEdhckpF?=
 =?utf-8?B?WHZYU2pEOGp6S3BGZ3lkRDYwc3ljdGxNbkVwc2FKaW5EUEtjN2VNVHBxaW9D?=
 =?utf-8?B?QTgyTWE4ajVnUXZzMHMvUXZ1ZHNmYnYyNzhRMGZmTEkvRDFNZmhPbEVBVlBP?=
 =?utf-8?B?ZWdjUFZFUW9XYm1jbXBBY3lxK01oNlBOdUVBME91c1lwWXEzME56cUI2cTFW?=
 =?utf-8?B?UmFNbVM2SUpkQUNpaityVkxtdmUwaDhZaWo1MENzSERIVlBUQ1BoNWdPNExl?=
 =?utf-8?B?US9USUlFVWdkbERUajM4ZUNSSU01RFF3SGllemZpYjlUTVRuNjVRRHVTRGFa?=
 =?utf-8?B?REdwWG1UVUFXRUx2NFAwTXlqQmF0Q2pleVBxRDlnWWV6bUc3YngrZ3k3UEEr?=
 =?utf-8?B?dVJQSXp6Qkt0WDk5aFVsbCtPdHF4dHdTZXJKeWt3OU40Skl1NzVhQkNKZ08w?=
 =?utf-8?B?ZzBBdXkxMGRISXFTN2xXSElteHppSkloSE5VWEhJMzRoMElSanlXV3UyM0lD?=
 =?utf-8?B?UDlpOVQ3dWl1L0RpdkttVG1EanVPTTNjR0xVbGVIWGhvMmRRRzhuNkozc3JD?=
 =?utf-8?B?bmxPNG91YlNEYmI0b2xoYWhYRWo0bEl6Q1dkWVNneDFqa1R6blVxbWdZSTlE?=
 =?utf-8?B?UkV3YVR0bWxIMS9tVC9wcEp0WkhEYXMxdWFwbG9mdExtV1lmT25hZnIvUVJE?=
 =?utf-8?B?ODN0VHdiZ0I2T2JlK3ZJUmV0em1NN0RTK0lHM3kxYThZZWpNQ0pUdThxY1FD?=
 =?utf-8?B?ZFJyQXpwQkRFbEU5ZytpVCtCeXMxU2ZmSU9jclllYWN4NDlJYWptam1Zc21k?=
 =?utf-8?B?ZCtDNzczY2QxTXFGOXhQMHdjM1dkdVBGUFZ3RVNlZzBpSEtCbVg0ZnI4MXpo?=
 =?utf-8?B?NUJYZitTWDBHa051cG44NE1GOEZ2VlBzdGtveUp4VEVGaXFwV3kwS1ZKNXhY?=
 =?utf-8?B?SDRyOEdQUU5XeWRVZVNJTXB4d0lDTnVsTEJjbHhURHIyTkwvei9xUFJKQjZU?=
 =?utf-8?B?UlVpRmx1RnBOSmltdTNHQVZlNzVyWm9wYUtsUHhTRkJHUkcrWXArelFjTDZk?=
 =?utf-8?B?MXZhMVJUeElCRHh3NitQV01iTTVJc0lXSEo3SmdvZWUwb1E0dkhsRXc2blVB?=
 =?utf-8?B?Y2dMbTA2U2Z2U3MvRE5ia3FOeTdVNHlxMm5vNFAxb2ltaW96RGs2V3duTTVl?=
 =?utf-8?B?VVlQWWZ3V3ZDSlZEc2hVNWNNUzdhSnJGYk5KUnRhdVk0YUZKelgrMEpIaGln?=
 =?utf-8?B?d0N5aFJ5cVBDS1Vkclo2OVpSR2RuaXFzZDFlRUVUQzEzaE1GYzVNckhwQzBU?=
 =?utf-8?B?bW9vTUxqbVZyLzBrTEZCd1loZ0xHclprbnpRWUNGTS9VSjg5bVJaVTQwZWh2?=
 =?utf-8?B?cnZ1dFYxUmtpMG1BV3l2bUR1TGxYcFRFZ0R3Tk4zMFlKanhWL21QUWd2bnps?=
 =?utf-8?B?bkpOakczM0s3d3puZjRzTklHeFUyOEdwZWpaSG01bVg2dmJvbkhEVXJYYVYy?=
 =?utf-8?B?WGM3TjJ3bkxvdGFublRIZWk1cU1LenVVRGFDMHFSYld3cTdkbFovSDhVOTJa?=
 =?utf-8?Q?q4AkSeoolmNrW1SmTDxPZHjNq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f226e0a9-4cd7-4af2-6022-08db9980a7ed
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 09:03:25.6505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BoxxIgcJrSPRZzF5OsTyNubsDii2ukvoJDim39Q7PVo30nv5Ka6/mcyg3B+Z42aG0ypW90H+n+jQCJSYHaC7sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9082

On 10.08.2023 10:39, Nicola Vetrini wrote:
> The functions and variables touched by this commit can be static,
> as they are only used within the same unit. This in turn addresses
> the absence of declarations that violates Rule 8.4.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Fixes: 741367e77d6c ("mce: Clean-up mcheck_init handler")
> Fixes: 45f57813f646 ("x86/MCE: implement recoverscan for AMD")
> Fixes: 155587481e39 ("x86/microcode: Scan the initramfs payload for microcode blob")
> Fixes: af50dd63cf8d ("Pull nmi/traps changes from Linux 2.6.14.")
> Fixes: fef244b179c0 ("x86/spec-ctrl: Knobs for STIBP and PSFD, and follow hardware STIBP hint")

Reviewed-by: Jan Beulich <jbeulich@suse.com>



