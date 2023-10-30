Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB8E7DBD0F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 16:58:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625238.974343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUej-00055C-5m; Mon, 30 Oct 2023 15:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625238.974343; Mon, 30 Oct 2023 15:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUej-00052a-33; Mon, 30 Oct 2023 15:58:21 +0000
Received: by outflank-mailman (input) for mailman id 625238;
 Mon, 30 Oct 2023 15:58:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxUeh-0003J5-Ir
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 15:58:19 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24b393db-773d-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 16:58:19 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8341.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Mon, 30 Oct
 2023 15:58:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 15:58:17 +0000
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
X-Inumbo-ID: 24b393db-773d-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6N5sLRH1EzKrjrHMrRka+nc+NXcLrhqvgld4rtlsEtQGUAgFjC2hLukgo/araRPiKgk2XR9OekDGHKtQsiPLOKkquu7W2HHR07Yj/upa8cH2XePmqVneRbONIfU6/NRMiPQhYxcnwU0l6OMslgNf85p2n/9OX+v8tmddVdOATw7oa5sNCYYdkZxqgsw0nhsIKv9ADQh8KD2oF/yl5zLMgV4Q6S2sYvR8zAx8LKGEYUWuR8dHn2KQo4U38bj9/KXpdCpKe4EBC+y6oOI4runsl16+GkhCro8/ff3ABk7Ic9ljBScnVhY/W7m/HYhC/eKKZ41hebm69MIVTl1Lxk+Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TiSxU06r7eW9JyNJKVtrLumX8Oc3b3Q4lQ8Ys4Q0Sps=;
 b=mkbeorvrRMgFMSg5ITxtmpqw7ABPwidCAoegZCz3BnbVDpwnvhAefjeVDlKpyI+doFLjLeTIUIB36NxwdlgkKGS5fxiUqKXRQByX9BpLz3svCLHUEJB2njV2n8nsqmiiYbpsQzni8xVJsGSEaQpC+kHJEItw+gYSgM9jXyxQTujW4gvdktb7ySq9J0PrCiGO98IISRGLNT7SGsVaALgOTEqc+Ugww4C9qTSO+n3isttSHZxBdlbxidr8poRE6f6SZqWm6TVqK9Yr4L5TPTBC0/KwnJcqKFj+2pCqnEiBrdTx2oaOFACRgFx4ZY97DMOMqoTW4Op2umcCkwgJxXJh6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TiSxU06r7eW9JyNJKVtrLumX8Oc3b3Q4lQ8Ys4Q0Sps=;
 b=VRAlwZeF9IhgK8V4vao+wAP0Ff48Bi0+NjRlEMy8WIa0iaNXmBaCdyJHlhNmXnPa5ilA6XgM8YUUPPNZmWkZGfp3w8Qk8eo765uOM2rQgIWqN5aTRL75Uv3Uiejhx+Y0MlR3hi7TTrGU0vEcd4IWFFAtB+7SnM3Sx4fc68IqsK1twCQ765b+LPnCWJmBUFVndcKlIBQO14TkXY/Y3efj/b7qGY08MDq0Ut+/GoLPZnG8y6S+As/MAzinD7803uSt0vzxhhdBuZkIoVYv0r02bA6aTrA7kJ1O2Fc/QkBKzE0Erfn76oCezDWkxluMx7Ck5JHRjGBbqSNRjyFRs0w1kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4ac01e8a-5742-72cc-55d8-6569bb09d816@suse.com>
Date: Mon, 30 Oct 2023 16:58:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH 4/8] x86/smp: address a violation of MISRA C:2012 Rule
 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1698045505.git.federico.serafini@bugseng.com>
 <e36afb831557c91d4a61967293799e189c83b2dd.1698045505.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e36afb831557c91d4a61967293799e189c83b2dd.1698045505.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::13)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 2af5ed1f-dfce-4ef1-07f0-08dbd96107ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AarOFD+Bo8OVJPtUq2+bew5vxtgWixMtYw+kF15VvKa9I72+Vs9MvJTlV8pves0KV2urb7nLNnvF5CVA7sCk4RobnYDGOG5FGaKjWhKwTH2GobG3sfAM0+Ca8LszI76bPc1SUKkkWewNJKcF/PT8fF8hgky6uu2HccQ8sa3rH1I3p+8EHMh5pHuwDxU/VjtDmr8SsktP45AkCQimSvIIC2aVFg/WGoECO67c7iGRFnAVA6GH1+i2qOmA6cExJPQ1lcaU75co1wCqevqVPVA4DkhGbuHsz8H09DMyTSKHcu63SvdvUJukfLAjNuqiux/qSkV6Rt3PVgIzy2F+P1XYcrmZE+Fp+sxqB5y6wckeYic1ufPT/LpRk60Sy/enr3yIwzz1m2DKUeqSvaSX2d4Ps8I9J3TZDJHLcqKtd/yl231j5FF5e0WcfMHMz6ziIwYGmUxMdlpYcdeh7bnxpYJ8ZKv7Gq4MMadmz68nMOSbDOipGUAroH3UgcDPt0NgzJXQAw6oP5fSCEXLRBF4AAh8rUZcJOF8C3g0waFgBsAEm+II8+soiW8jYnfoCKDdvNEvnEse8F2ttwxx3MrKjxyQ16Y1j9VOSOaGvZLekQEjV6SXJT2gjDABu9uYoHGoN1zrLnKJMvhuMkfX29PPUH8v8g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(366004)(39860400002)(136003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(6486002)(86362001)(41300700001)(31696002)(5660300002)(66946007)(31686004)(6916009)(8936002)(8676002)(4326008)(6506007)(2906002)(54906003)(316002)(478600001)(53546011)(2616005)(66476007)(26005)(66556008)(38100700002)(558084003)(6512007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zm00eStRV2FaK01za1ZrYVo2Tm9Nem9idFNVZkpWRVBKZEM1SWNRWmNWYXVO?=
 =?utf-8?B?bHFWVDArQ3JUSmRjZjJRRTg4bzRHdFZJa0RGMGZzSHFBTjBWcFU4by9mcHdl?=
 =?utf-8?B?b091REJ2d2xCWWV4cEpWV2RoRlYxZzNQUGtLVVh0YXMvdUUwWUZCL1JjNytD?=
 =?utf-8?B?WHljU1Y4RmJSdmd3a1FOT1RyME9WMTIrSjVLbDZsSmZkM0NXd1pCVWltRTRh?=
 =?utf-8?B?N1VNbkJvM1hmTFhxMU1sRW82NWVIRkE3WlBnWjhFK0JSbityNHR1RFkxYjdo?=
 =?utf-8?B?cC9HbHFpNWtwQi96Z0E1NUtrSlZXQXkya05iWCsvK1FuaENUMzgxOTE5Q2gr?=
 =?utf-8?B?ci9TQUJvQk56ZWdVMWdiU2NTRWIveStYK0FvZWdveWg5a2ZEa29BL052V3lh?=
 =?utf-8?B?OWRVRjF5bytxdW54KzM4MkkxWnhDM0V5TkN4UTJEVHRIbHA0QW54a3NEY0xB?=
 =?utf-8?B?K0hTei9pTUYzUk5kNGFLMm5wQ2svVUlRYXVxaXh5THpNbzdHZDB1anBGSmw4?=
 =?utf-8?B?QzFrUHlSOHpBaFlVSEtIbjNNMk1nK2FIM0k3U2ZFNmxTdDFJVFU1TXB1Wkkz?=
 =?utf-8?B?Ty9mbGNPWFdxaE1oS29vOFQ1KzdJOGp0MW53cXpTOGNZdDF2RlRTZzBRZTRD?=
 =?utf-8?B?cDdjMnJEMG9pQStNWXZiVkk1WGRlcVlPM0laMUVxNExyWHVzMkFqNFhIT1JK?=
 =?utf-8?B?cnRBeHVBOFoxOHh1Y2grVDNIL2REbENzR2M2d3plKzJpTVVjaXZRZDdJNEU0?=
 =?utf-8?B?WEw3YnM0WkJzZUoydmlHcWltK3RTcXJaTnBIS2srcVlYc0xvY2k2TjNTR0NK?=
 =?utf-8?B?S09DVGxDNHprc0FSRm84eGN5b2Nhb3ZIdTZVVWlML084Um44T1N2YzlHT25r?=
 =?utf-8?B?WHF1SE0zbTI1OUxrS1d3YmVUSjRma04xYXIyaytqdTlpRjJrZmE3OWREMTd1?=
 =?utf-8?B?NEdqMklUaiszSjJ1T29CUWM1ekxSeDd2QVZYbzZrYXZJMXp4aXduTWhkV0hx?=
 =?utf-8?B?VHF4WURKMVF5ZmpHOGdodmlTZjNscytSYWl4TC9OVUhTNm0veHAwV1dyOXRl?=
 =?utf-8?B?WUJ4dEY3TzRPS2pSYkY2amw5SEFrVkpYTklTUk05RlZkTmhOMGY0QUdRS0xw?=
 =?utf-8?B?WU80bzdyUEY0dlN3Yy9pUFJQSXRLU3Q4UEZCVEZwWENaVmJsNVB2RmRqVlda?=
 =?utf-8?B?NkxPZ2doSUR0emoyNkZ3ZzVyeExzRnNuK2pSd3FxZTBLU1hzOGRMOUpSZk8r?=
 =?utf-8?B?U0YyNEdDMk13eVJMK1ZhWVhGeWdZdzl1UEFTMEcxa2xibkRTUzBETnhMc2JM?=
 =?utf-8?B?Q0E1Nm1NL3NKOEMyVUxxMUQ0d0VxSWVXQWpqVkNmNElZUTMxM2oySjVmdWZq?=
 =?utf-8?B?T1VzVjExMnRIb0hiUTFpVXpwYzJTaDhFQ0I5b0pMc0NLN0pYWVlIWlptODVK?=
 =?utf-8?B?Ly9QTngxTHlQR251WWpEUjVPNGl6U0J4a3c5dzg4OTJ5amRlQjVLVjBVYXZq?=
 =?utf-8?B?dllqckxmb09TVitXYTNLaERuZjFLZ2Z3dTRjT3oySEY3WUtDRzNPRERNcTNo?=
 =?utf-8?B?M1lEelhVL2hnc3A3UWhzTG9lUFRPNjVYSWJwOTBlbmNHSzNaYzBaQzBDWm1j?=
 =?utf-8?B?WXhBVGs3T29TcTQwakVaaUd4WVFFSHd2ekM3TjJsakFJUlFFQ2pPdHhvRnYv?=
 =?utf-8?B?QnNzdnZLVlhxM2RjWlg2QVZDT1FZNDgwQm11YTdjM25wOFpNSmc5UEVoaXYr?=
 =?utf-8?B?RWVETUZ6dEltRmdRVUpNSHM3OVpRYUUxVnk5L0ZoWVhSdldUUmdIcHR1N0pT?=
 =?utf-8?B?VXVucVBjQmV0b0NMcUhaeitxQlgvRjZ5LytmZGx4ZEp1MGZabzF5ajd3bExY?=
 =?utf-8?B?VnU3SDVEVEtEZUxzWU9DbVFYMHE0STFtQktrRk9adVhzcThFZnJURkVLeFli?=
 =?utf-8?B?QVRJU1BpcWhjZUd6Wll5L1VSdVZhT2d5NTdibVBlbWsxc2kvWk9tQTg5RE1v?=
 =?utf-8?B?ZFJ5VlRLWUsyaDJPYkZsNVVnSmtMUlp0OEV3TE4yL1E4UEhNOTV3SWhNeGh1?=
 =?utf-8?B?T1QwbnNKUlovUHZOUks1aHc0elVNc3FURVlSNmI3Y0VPOS9pTUh4Myt3dUNH?=
 =?utf-8?Q?OA+DzzjpOnt8E2eUIpWPrm+1f?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af5ed1f-dfce-4ef1-07f0-08dbd96107ec
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 15:58:17.2604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXH5SfSnIv78kmxmVlPDJ9A8fHiO5+YZ0gtZst4XFKhWm7UWnk6CD/fNRFwEtBAT/9Sa/V2L8u5zR5LGPpxQ4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8341

On 23.10.2023 09:22, Federico Serafini wrote:
> Add missing parameter name. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



