Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B057972D5
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 15:27:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597357.931587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeF2f-0005hX-PN; Thu, 07 Sep 2023 13:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597357.931587; Thu, 07 Sep 2023 13:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeF2f-0005fm-Ln; Thu, 07 Sep 2023 13:27:29 +0000
Received: by outflank-mailman (input) for mailman id 597357;
 Thu, 07 Sep 2023 13:27:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qeF2d-0005fe-KX
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 13:27:27 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49271ef8-4d82-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 15:27:26 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAWPR04MB9718.eurprd04.prod.outlook.com (2603:10a6:102:381::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 13:27:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 13:27:24 +0000
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
X-Inumbo-ID: 49271ef8-4d82-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UhZEggBwCBaXVQ+TM8EuMqmKjaPI5smoeyxfGm0nOiRATrtpzFBciODIZPrifUFVhpl06AInMPyxK+WVs+zZbIt+lJNETkXoug0Z7iBGk7hxVlXx0rb/yjawDBHHXTVVKwDNgaamw5C417ndIXP+b/E2rDD92CXL0+u+Fx1qtKC0MoboUDrtvmWZB1KSljw2S47opFyE2npkukeoBSiVlYtQbUmUCeIVrui6WlWDj00eCxCyscdRB0ty8mPKthhN+CGh50G0t3QsbeWtuyd8HqSdnYCKVEkvqX4XZcOp/0dvCdXyoFoj4lIm9gk4iZgx1WHNOBBUS5c2wyJ0rLgVTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uewgV2MuD45Goh3bDiDmDbOARnhDF5f8qE/sYeMid9E=;
 b=HQ6g6wwCxoKn4SLQHA6p9rdeC02W1alirchV2Xp7xZkoco2l5qI9qyQw8YhZicn6LhREyVV0maGNULjOTy1jzu6+wSxmspeM8xPosW7scOm7aE6qpEOfPsZGSWge8v9aZZ8dF8kR/Y3Ti6y63qr49UKq5DQEn1QqF3VN8R1FDGrmXhTpiX75AOBeX7p/tq9f5Oz/BhiY0BHh/PAw6WQYX0r1mcXk5oUm83vwRdNjd1gglROaks60KNTaCtaIv277YWGghCW5rixBj7wlTxgbGhOmuDtW/uZWOOhDNUKs+lc8465hp7lWgrYctziFilr+Adkgd2+Q94luFBNyh4B7iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uewgV2MuD45Goh3bDiDmDbOARnhDF5f8qE/sYeMid9E=;
 b=LMT8YV1UcqXbwRNDB0Ffxv+iL9HwLDj00yPLbQyUEsHlFsUSn3IpXgi4oYvgIPE7dqlE48/chvPfsDDdiRbbKfOL1qQFC4anLdg1wgAMY5fp2uDksZodkdPKPYfXczGLVIeQJ3CjfUN+4YF8ttjiy6+6ZvyBRqbxC/FWyWZQm5Cfi+ejKC/KGljH7au9ql5qfPqqeUZEz8RUg4y37ihUXbKzQHVB0zLhXRxFhKZdFP/vFr8y8ufuOptxeRB0wQUdmJn4Q3FTRBDBiVKJOwK6X/o5sq3cCwKQGTTyHxm+89ZL12Z+R+N1Q+MSElniN3YT6D9QwnX7Ngiyhdw498h2BQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fc126b75-d048-03cf-6cf7-6185b774cce2@suse.com>
Date: Thu, 7 Sep 2023 15:27:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH 3/4] x86/io_apic: address violations of MISRA C:2012
 Rules 8.2 and 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1693990010.git.federico.serafini@bugseng.com>
 <56bfeae4c6a5c7f65a3f329003583aed6de13b19.1693990010.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <56bfeae4c6a5c7f65a3f329003583aed6de13b19.1693990010.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::15)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAWPR04MB9718:EE_
X-MS-Office365-Filtering-Correlation-Id: 8702a808-3f5d-40ef-f431-08dbafa62c54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5n/sjlTuCUgYYB/rENEmf8zDz2aEn0rGp01cNy1hE0HOdj7apVRsfBWPVGH93cR75vLOQWmnrP+ymjwuNoqNteu+MhnVmJRURwaqlL9JC+yxbgBkWoc8oo/DzvUj1HSJoRyVAGNXtWI4u69paxlvb3e8Q+D6E3da0WBZOR5HBsWoZ9ImmdymhV8EUXMxsZG/9M+txVIW5zcNJFUipPdhijDpq93zWxYL8YQpV/B85cNdyQvLYKuvJ7YR3L+efZr3kLg0vy1boiK/9OFamA0X5lRLfmJ2kEiifmy2439YEpsS4vZzuc8LoGqA8/w4kTZBEXEkllDXkwzwk6iPgIQ/CKDR0G0+OfFyFfoaKW730i+c09MTNYC5PkCDOkccDk5jJ2dL9wEwAg67sZy64NY0ZpLwcdZ+lUv17xyM/sqE7EW8YLnxqenDARTL+LGJvc9txWxyIJusEVUSWlhIOCXJrUXuA/vpml0+ZjVr/UGV9PbRS24XuSwrgF5uy9/0kYyvIZxv4PhRUOntGcqLxkwDQeizUd3/3uJa4EcRTFs8I30diVllsL7qv6w0BEydn1SNyL9AaAmoiAt11Rv3sRUc0xpxQdJ+q8tbumGj7L8CA+r0fOpFN22LZxalQdiEpnOFDsnGLWrAyxIa+N6AIxDJEg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(396003)(346002)(136003)(451199024)(1800799009)(186009)(86362001)(31686004)(54906003)(2616005)(66476007)(66946007)(66556008)(316002)(6916009)(8936002)(8676002)(4326008)(6506007)(6486002)(53546011)(6512007)(41300700001)(26005)(5660300002)(478600001)(2906002)(31696002)(36756003)(558084003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnhDMG9rVWhCbkR5dEd6TjVlUWx2K1hjZ2NHdmlDQ0dkZ0pMb2tvdkoxQUlo?=
 =?utf-8?B?NjVnc1RkdVBDby9ZenFsWFBDSkM5ZUtwS0NrNmYxd1MxZ05tVWdvYzQ0dzJ1?=
 =?utf-8?B?Q25tSm5NOWluMk1JL1NTaG9SLy8yeHRicVFMcDlrSWVLZFJURWt1UENVZ3BM?=
 =?utf-8?B?V3duNm5Yc2Y1N2xIYW9ka0NGc3hEamQwUkZDdHBCRENmSW9lYlFsaGljV3U0?=
 =?utf-8?B?dzY0cmRHTDgyakYveFlIT1lCWXMyZFV3SGU5Zmovc0tHVHp1Nlh1S1MvMUcr?=
 =?utf-8?B?Z2RlemhwcHM1VVhva2ZjdUhtRzZHUE9CNEJjLy9wcThSdjQ2Ym1US1R2REN1?=
 =?utf-8?B?d2E2Y05Zc1pqWHArM0VpbVp4a0dZbURXVjI5anUwYUVkL3QwRnkyTXhSNHhw?=
 =?utf-8?B?dGxWbXJUL3V2ZXNXTDB6ZGg5NXpRNTNYbFljcU9sQ2MrdGtTTlcvalB5RXl5?=
 =?utf-8?B?SnVaT2ljeGNtaldSWGZwbHo4a0ttWHQxTllZS2tWNFQ2dVFjL0FEWXVIbllS?=
 =?utf-8?B?ZHFYdUxpK3EyN1MrV0JLNk9rdU9oR3JHekNudmtFOCsrb2k4eE1HTE5yQXBK?=
 =?utf-8?B?Z3hocS9SYmNPS3duMXhuTUkyaUpXbTRwZjBlRXc3Q1IxODhjWUZXNFg4c3RC?=
 =?utf-8?B?YjlvTktmQm51NnZHTGtzZXF6clRvcXdaZ25wMmRHaDF4cExQS3Q2SHI5T1lS?=
 =?utf-8?B?cnRTc1NSamJUaUVxYVBVaCtSaFlzQ3dxMEV4dEsvNXRsajh6NUVMZG8yV3lL?=
 =?utf-8?B?emdzNForczlGM0t5aTlUdE90cHRJT0YrbkhCSXAybkxVUWNtRWE3a1B4eTV2?=
 =?utf-8?B?OEpUc1lzWm5GbThObHFUSURSUWVkV29qK2JDWm04Z09xVnBNWHJ4dkQ1cjhY?=
 =?utf-8?B?WGpQdk5xUGRrZCs0a01qTXZDRUVRVFJoVGNPSU5RSUhDSUpiMExXcVg4QVMz?=
 =?utf-8?B?NUlSdVQyYjdLWFBxWjVGYS9sU2duenBTZGNCc3Z6ZW1QR3lkdFF1dGJCWUZk?=
 =?utf-8?B?N2JrL3lURUVGTytyc1NSaHU5TjZCRnJXOVVRMUhvM3hYUlVzT1gxeTVaSis2?=
 =?utf-8?B?QVBLalVLdzNtQ1ZHdnNPbGpPZ2Y2MFB6d0hvaUJteEFuU3VCSnhuYjFTMXlN?=
 =?utf-8?B?Ty9mVWZVZVk3MTI3c1E2ZE55WVZJQ3JVYWxpRkdrMmdzREg3TzZjU2c5dEhq?=
 =?utf-8?B?ZGc1cWdHVXU0cllKTk1qd0lJN3NKbU9LT0ZuOFI0aHBvVEd6MTFYdXBpbDd1?=
 =?utf-8?B?TjB5VlBCYkNxMlVxczlwamRlZERhWG5HWW1yamxNbzQ4ZUx3RHNQUWhWSVJx?=
 =?utf-8?B?aVA1YVltU0MzMEZpa055NWJKcElhWVI0WlR5ZHlVSFMwRE1tZFFVby9LQzBR?=
 =?utf-8?B?MVprS3lxaVN4UnFDSDlKS0I4dE9icStYNmxHRmxGa01CR3NLamg0dW1HNkpM?=
 =?utf-8?B?UzBmcTIwVEpIWlJNNWIxL3l4YTI2ZXczaUFoTTQyVkJqaEJwQ0NLQmYwRFFk?=
 =?utf-8?B?cnlyUTN2cEdsRjg1b213dWhobzRINU0vRG5yM1ZwaWVXT1VjSXNuakRWaGdH?=
 =?utf-8?B?enVBb1F1Ujd0VG9DZ3NWallIaWtGRm5ZMGRmTnR1U2FJTC9VblUvL1NpWjVh?=
 =?utf-8?B?cDg4WXZEbHE3YVdHdkhycTFNd3RpRVJEWnMxbjlUZ2MxTkQ0c1dGaDV2dmdI?=
 =?utf-8?B?QXl3d2htRHUvS1J6M3N6eW82eU45ZkQrcVZxb296ZGJYQWpPQkJXeERmeGky?=
 =?utf-8?B?dFNmNTdZcENTdGRlMTRGaW0vbURRRTRmS1d1ZXRrQzUwcGRySnc1b292Z3BU?=
 =?utf-8?B?dGl5ME5lNFVpYWhoYlJwelVpWFo2Si9DNnNHdlh0NHU0cUhVMmtUTVQyVVFw?=
 =?utf-8?B?aEpZanM0d05PZ3JYc1JMamczeHplYTJKeDVILzhKUXczVXFJMFNlby9xRXFT?=
 =?utf-8?B?RW5FbnZHSU54emhNNTUzbFl3czVESStHTkdsWkpkTFlhOTlTQ0dmQlFyZ0Qz?=
 =?utf-8?B?WjFTUW9keVNlbGFmZ0RjZ1dzanczT2h1YWppcWxaYnJnellHMnhKWjBpZ0dk?=
 =?utf-8?B?TnlONjNKeHJ4SVl5UERITWYxK3ByYlg3RS8vSE9LV2FiS3JxZDF2U3E3ZjI0?=
 =?utf-8?Q?4+S/0jvrKPIyEBekJ4qgOPcgB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8702a808-3f5d-40ef-f431-08dbafa62c54
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 13:27:24.7907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LAidUZyYX4De0fFh/2JpE1Gd5XKlBhWAfC8d5gcy5xZ3VRBbfcgik/yZ6q917O0tWPVo2GaGPS+1CjKCi+RKkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9718

On 06.09.2023 10:57, Federico Serafini wrote:
> Add missing parameter names and make function declarations and
> definitions consistent.
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



