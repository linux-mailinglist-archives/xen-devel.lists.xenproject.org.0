Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF4777B2C4
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:42:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583284.913410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSD0-0008F2-Ty; Mon, 14 Aug 2023 07:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583284.913410; Mon, 14 Aug 2023 07:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSD0-0008DA-R8; Mon, 14 Aug 2023 07:41:50 +0000
Received: by outflank-mailman (input) for mailman id 583284;
 Mon, 14 Aug 2023 07:41:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q53I=D7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qVSCz-0008D2-20
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:41:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 059ee6c3-3a76-11ee-b288-6b7b168915f2;
 Mon, 14 Aug 2023 09:41:47 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VE1PR04MB7279.eurprd04.prod.outlook.com (2603:10a6:800:1a5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 07:41:45 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 07:41:45 +0000
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
X-Inumbo-ID: 059ee6c3-3a76-11ee-b288-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTL68sGs5bC7AJgh4mbYlj2zsUv8URoJhKUfE7pK+auGbO3iQvubjMyBxUpRpYLRD58KPpMsaHeHFtUH1OGoiTYiJ0ERlKTcegydwNjbgaw974GJnVo4Bn0ZwS6p/GQvRtnm1FpUcjStWP8LUxILGDwKM/LNE2Fax35vVdNeYRgiRcycRevohZQmoTB8RvziCnR9zpZAvOFcmWbqJlH0w+eQGqRR1THuRY3KMk7GpEd72dtRTP/35H+hNmmn25rm8atu732gLSmy5zzOdv33Vk4mFBx0ArsgCO312Ef+r5FXBiwWGXgJtNXCW1eBwTtLdc1K+kpMrqfo4+5qY1nzGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEIbLk52DMyLMV0EpYgbsv38TzyjRN/gcRiLvJSY7P4=;
 b=C0Rco2vF3d0eJcOXdzNsen7+BSnpvJkqEKmJYWvwOetNN82DwpTSLgkYDdkDe+SnK8XSkF2eVcZiARSCbzx9n/4NbPQT8rNe/F9slhU1d6W67tA970FadLo3WJGqqel+LtWw00qChPifI1vQk7nApK+ii1hNcN6rYLK95/9swXXHUy7ozhHTAtJdTyRKWIi7pIAAfaXV75VVcG+/rfHx4BjNe8RMvRPa9W6GMFCIkI1xK6e0J7H1b5sMbpNyFBgLqNSmINqjJnjfeHed5pCpfQbg3UlCfxuAHo05a4jQ8s/ZiKBDrsKeD3mc8RBe8uk3+cr3h1W36ANEgQDOZR0XjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEIbLk52DMyLMV0EpYgbsv38TzyjRN/gcRiLvJSY7P4=;
 b=AgtnY34LfK7SfujtM7nYQGbBrR0ndHaQTSE3MfQTHSelBjND4l8RqGBjOLbSMS1dZ2vrsRztUeA+QXcHP9LDJ//Px6ar44UxIQkp1YIUZBdBwr5G0ejBKx3zcJwqaE169RGqlhlb5ajFM5sW8y9dsIBwbAu8jFgnSPxZOF/6ah43Nsgw1ErUHrYzbbjhkPvdSoZyvMqbltkBZZBysaN2u4C+2PcRNwEnc2M34BSnxST/21PHVEVQte9v0KVdMR4X2LLZ21iLkksu6xoTvpR5iR0ozu4rUuCqRTg05QpWKqXUDLxb1U6VWM0Xq1xRoGNt8cB6V5ToA8LOwosW03zi2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <380241d4-df77-b9c4-8491-5893cbce383c@suse.com>
Date: Mon, 14 Aug 2023 09:41:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 4/6] cpufreq: add missing include of header 'pmstat.h'
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1691676251.git.nicola.vetrini@bugseng.com>
 <424e0523b9ec68eda5cf5b41a7bb6c980df2a52d.1691676251.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2308111602400.2127516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308111602400.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VE1PR04MB7279:EE_
X-MS-Office365-Filtering-Correlation-Id: 31cf84e5-0276-48e6-0c8d-08db9c99e905
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xsycnm0MvHUQCuGA/S1h0iqgI6rKyPCWOtDijt4VkZz60B2nKqTqaymIOocJdlZLU9jBJT/POw1BPSAZzEKPeoYvUtqlXlM4kegQ7lywU6m/HDPD+in5SZNw9zc0NG19iW4KzIS6K+jApZG7YxU3ubaSgWqiTLofv2D44X2M0ZkU3s8v8/wCJ+bNu5Wm4vKTHVApS1tSyvHn/bzjypwI/6YnKzHSwBxuJpIvn5QIxjTGZwj47eAtM1K32421Hdxa4Ch7lnVoDoNjAnB56SY3HLgwCy3+fHe7/Xz1d900/rUpCoYMRzcvAlV9iQyQeGVwQ6zQZVqZgLfZk0WShJXrVmjqyrwnrxTuhrqCFTwzzfKRjxdyJdwHyH89mafOQNQwq+8umsd+LBitAr2aKrZGp/GjI02MV4rqrc/D1hWxBCZviMtCu7bcxAR9aXpKe6Dh1vczCg432DMUeK3SuXEzCw62Nc7NvdD8igaCEugJ7luR3bQi5JgjWi2rViGZM2KOaVWXicaqbFquFvafsDtPCq6KAJb5yBmTp/Dj+egXbbIHtojYbREfm2lnW/LQ80JLbEjwmCiP0pwGvdFhhFBk1TUcVemDGDTW1TeDnXuJgLEzKREToLn3Xs0Uby59W5dw3K3gaWWxukcG0sMX18zUHQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(396003)(346002)(376002)(366004)(136003)(451199021)(186006)(1800799006)(31686004)(6486002)(6506007)(478600001)(36756003)(86362001)(31696002)(2906002)(6512007)(26005)(66946007)(53546011)(4744005)(2616005)(38100700002)(316002)(4326008)(8676002)(66476007)(6916009)(66556008)(5660300002)(8936002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QU5qZUlWSCsrM2l2M3lvcy9LUk9ITkh2ZWZ4N1Y2d0Y3d21Fb0YwamMwWGRI?=
 =?utf-8?B?MHppRXd0eHlKVmcyelhZR2xEYkp1Nzgyb1Ria3FjRnpHOVh3cHp2eXZjQlZG?=
 =?utf-8?B?djd2WEwzczZ3d0Fod2haalA2Mll1K3poZTV2cmU3NkVRdzMweHB0WGkwUUpH?=
 =?utf-8?B?cFh3UzdGdkp2WTM0aFdMV29mUVpYSWJQanhNSVlLNStoY3lHdytSMEhRRUE4?=
 =?utf-8?B?K01WR3JJZnhoSmlneDdhSHhQSFlvU1FjV3hveGVWSmwvMVRnQm5lNFR0dFYv?=
 =?utf-8?B?czRNazMrdEZEZzJQMDhzMDloMmdnZjlBdnptWVV0MFZmYWY0SHF3bjBzOWV2?=
 =?utf-8?B?SlA3R0kzTVRyVjFHM3ppdWRFSVNSNXJMc1FnMXd4Y0dJeDJNWU5hc0ROcjc5?=
 =?utf-8?B?QUZ1WVBaUEZCbWpHRXJuTEx3SWtzYnJRQUY3em5LV1NkZk9CMjlsOGk5S3Ba?=
 =?utf-8?B?d2VuOVNxeXlxWmxMT3NKSDFLeWdZSDYvVExXU1BqSFFzek0xWXIzWFpZTXhN?=
 =?utf-8?B?eHpWbU05VWVaSGFITUJKUUJtV203YXAzTU0vZDRNWHBma2xsRC94Wm5NQkY0?=
 =?utf-8?B?UFlPM2VpYXIybUFlcTFiUFIvOVpsNFBSdXFTam10VmFJWWNTNWxkR3ZYYnBB?=
 =?utf-8?B?aUJjU2RHdGtkeW9tUE9RRnZ2RDBRc1VlN1oybUdvS0gyVksrWWE4YnBlS2t3?=
 =?utf-8?B?RjFpTnVISlJMbWtaZjBGSHJtZEtGYXM1enVGM1YvNUwvenFHMUwvUFdaT203?=
 =?utf-8?B?M3RsaVlzT29DUTRxTlE4UGxiaHE5aURUUUYrcVV0aVdUc1hnSVMrZFdOWkdz?=
 =?utf-8?B?aENYU2xVV09oUkk0OWd3d2oyMUFEaTFGWnBxNG1renM4WHFmQks2amg0RVJh?=
 =?utf-8?B?bWMwaGN5SU1sRm9oUDhzdTlVZXZ0MStIdnJqN1RGS1RhUDVZRnpaYnlla1d4?=
 =?utf-8?B?ZlJkUURPSVRiRzFVWDFpd1RTK21MZGZqMzN6Vi9CUzhSekpSTTRzWDh5UFE4?=
 =?utf-8?B?OXRUd0VEM3JnbkhxUTZMTEZtdy93MnNsZWU3Z0hHYmlJYnMvd3dvUGl4WVpk?=
 =?utf-8?B?c2xhT08vODVIbmFXUXdXL1kzbzVYNlgwUzZBVG5uYUZQbDZPcktVZW82UG9W?=
 =?utf-8?B?U245akdhOS95WGhTMUFvSmdoUE8rY1AzUVcxRUFTZ0ErczlTMTNYRlhtTE9X?=
 =?utf-8?B?bDVXR3FuaHJxRUFVTENnblhsZjlTbGlraEwzUDBjWWxmWk1lVkd6SjZESXll?=
 =?utf-8?B?M2N2VE9BQkhIS3dqMkdtSDZkYWh3RThQdTZqdUxJdm91Q0VvaDV5T0dRbm50?=
 =?utf-8?B?VnBDMlJ3UFN4cDVpMFRwb3c5dXp1c1BKYWhrb0w4Nkx5TVlTYjZ3MVhGNlVQ?=
 =?utf-8?B?WjBwZ1p3MEYyQ0xrR2I0T2NJUUVEUWs5N2VWMHkxQmk3KzZHSHZHc3pKakVk?=
 =?utf-8?B?cENKWXNCQnR6OTMrRW1PVTMxam9FdjBPd292TWJWWGZmZ1E5SzZGN2dzelp5?=
 =?utf-8?B?YVNzajBKRnJvWXFyeUsydDhhdncwcGNDZzI1TzZJaWdZMEhmNVZKeWt5azVW?=
 =?utf-8?B?SEN6c0RyQkd4RHNWcGNlcWhFaWh5SXlyd3JCYmVRVXlRYnVwQ21SN2ZrNW01?=
 =?utf-8?B?VXNZZGNDeU5rdHA5SlBoMHJ5UWEydlE2MjREVUVhT2d1OS9ia2IvVjV0RGlR?=
 =?utf-8?B?dmFodzljZHVvQWxpbFcxZUxIUldmQndKSHJMWC9sSisydHY3RzRkNnh5WC9K?=
 =?utf-8?B?RUEzbHovY1ZUQjBlSHk4cGN4b1BMdkx4WGdqK3p1cWhWQmY1VnJ3cjFTdmoy?=
 =?utf-8?B?RW9BQ0ZrRnZPQ0xLSENUbDlYK0c0cHBFbVY0czRzUDhPWlk0Q3VwTXVwTGg2?=
 =?utf-8?B?N1BlamllSldCdXA2TFY4WDQ3Q0FIUWpMRVdzZi9VWHdmUWxJMkVBM3pGZU0r?=
 =?utf-8?B?SkFkS2Z4ZUhDYXVObWVPbTc2Znc5bTRqdGRHaSs4OVIxa2htNXI4M0U0S1Jh?=
 =?utf-8?B?UWxuMzZLWVZ5YXZWQUlrT0lPMjFLTlJ2VzFKcTRTRG1ST2pZU1Y0ZjRJd0Rq?=
 =?utf-8?B?RzE4eHdCVnBzQjNrOVp5aWJOUUxvYlQ3UTJJSFRXTXdlRUhIWXlxYkxPQmRZ?=
 =?utf-8?Q?Rg7/mVcXWJa9hL3SuAn+20RVB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31cf84e5-0276-48e6-0c8d-08db9c99e905
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 07:41:45.7328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r33w3JYeGOaPkNj7u8Yh3Z0LYjYNUunmpW3KDtb0oXqNKCS/qeV3weZj920ey4RvpSOcZcjBWCB8CqrDwTyrxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7279

On 12.08.2023 01:03, Stefano Stabellini wrote:
> On Fri, 11 Aug 2023, Nicola Vetrini wrote:
>> The missing header included by this patch provides a declaration for
>> 'set_px_pminfo' that is visible prior to the definition in this file.
>> This also resolves a violation of MISRA C:2012 Rule 8.4.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> Fixes: 452119c09420 ("x86 and ia64: move cpufreq notify code to commone place")
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>



