Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 382677D5459
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 16:51:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622078.969241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIkY-0001yZ-QL; Tue, 24 Oct 2023 14:51:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622078.969241; Tue, 24 Oct 2023 14:51:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIkY-0001uf-NR; Tue, 24 Oct 2023 14:51:18 +0000
Received: by outflank-mailman (input) for mailman id 622078;
 Tue, 24 Oct 2023 14:51:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=krZT=GG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvIkX-0001uX-BF
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 14:51:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c88df102-727c-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 16:51:16 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8336.eurprd04.prod.outlook.com (2603:10a6:102:1c5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.10; Tue, 24 Oct
 2023 14:51:13 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 14:51:13 +0000
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
X-Inumbo-ID: c88df102-727c-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tc48KJZzm6zJeoaZEz8QpYVgtdzlXGoWSTUG91TeaO14Doks5Naw22zA8M0atHihoMxVhniYlox8RM0wKZxrfaaiTL63We5U5/P9yBJzF7Llzjd3tccTrkcBdb4JceV/ilvXoouBv5QAw36k/GR7n2Pu3bdrF5nuwL+E0DGHBRxOhQEEGROhCdYsmLKKyZZLvi+TihAy6V9blE2xh1Y5wDm0dzHaZW0JuMoM3OqsFHzSM26UJ2mFEq4kPTUkAqYKCfSyyL3N0YbCpW36ipH1CfrvK0b5ilRjs1+9hdKAFnWLKOWEy6XvdVw5YX+LxpkNtogAWXB+0PuP+A1CvT9dow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaqokqBs1sqkVVHGOQEuQyUqzcWXAss3qc+lgbuhxdo=;
 b=MEN01i3+MQM3T1fDyd4xPrM86v4k11afVz6U0ypkw7BwNg/mCJuvIQsA9ixSoO5hspO4Ma6dELoCx9jxCxSCcVkSIl6zT0g4anQDeKzz+cMfOCdx/RgACER1lAO8Qx25JbZfEm2DaajXr2LwhRT+IR2K/sJOfoXpBtoxCVByI2Nu0qbvMfzH/t9iqpEMzbtJM7w9lujOnNff7sEKTqY7U17xG6ms/NlCSRw5IfE7DQAm/2+jryIPtAr4Oq1yhAEh2gJ16Q/KV4NavdU2AmCCp2pztpfa7ZJZDIxLPeyoSlzINd3WbU4WkKf0JSXlhh2b7oTefxlItgPNp1mofsS/og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OaqokqBs1sqkVVHGOQEuQyUqzcWXAss3qc+lgbuhxdo=;
 b=fI1tY1LljznlR6PvlFmEto96OTMQyyNxDWwRpGNsW/NZcqJltZTf+xViDq97sOCLqdfogk1zSbhGGUVM80hgO2jzGbHxTtqVwfgwZnA3KmkYwxvkZ7adQF6C5oWN2GPgtb3Fbd3LKUyg36+/MaTVDUFVc204F7dKDbuK8bhXDRymPB2jp/EtXgRWLqsF/gkv1tpbWHmieVqmQGTXyzEMQF0J+2eU4zcOOAn+D+PF5cu4TiwhAO2TRnXxYrP3sIVP6bYD7u3y/pDFESbAq4IoX44QOVGpB5LnNdlauxUEjB/xd3mOzLG6f7Aj+rA3mbBCeoLTz118u6WiZKCYHE3kBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ce4472a1-c3bc-563f-876f-87fbc4a02a53@suse.com>
Date: Tue, 24 Oct 2023 16:51:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC 4/4] amd/iommu: fully initialize array in
 'flush_command_buffer'
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <cover.1698155925.git.nicola.vetrini@bugseng.com>
 <b772842fccacc4fb108ff515bdcad6f2877b6b12.1698155925.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b772842fccacc4fb108ff515bdcad6f2877b6b12.1698155925.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8336:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fe82c53-2a06-44df-f323-08dbd4a0ab54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kzvM+lBP5MtQro9iLcCerlRTlIS88NTS69hfUtweDvAxLWzbKMgOs6Fa9KtE/NcXxBVwUl0WnQFjbVMX7F7j54IzfPWAvUBhkFI23n6hSDfKgbIGLeUDOInsdJQlquLerO1lajhbj6meETIzN0WU3pSMhAS3iyIyi0apGZ86zyeKpCYRGEVswiaJeEjPzShhySQz9diqoVyeSONkgC8uJVuf0OnR5ULjldim+k+owGr+IMQ9IY6uSz8o+1lGrl60h2AZPf18Pi4uFT/1bEVdX/4oqm0o0qMXPCttn0zAwGMHHrXIZ/YVeP8E4DCQ8gsqzU790f9pSF0PyvFJw7aO/Ex8RsnzMmyJqDnYaLOOULpC3gLpMWeGn6v+Kv+cJVRrvg8QQU7PDM5p5M6pY0oZzwJrJiEV58VhjiD30vYdYYQ8g+Ya/EIYEXibo0+lQv9qA9SIuHwG+J+FQPVkf1zoQ5ifnWop7YFHcEKfB61ogCo9NOx7Dk2nLtgR33vLvz8Xt7ctqj8Tf1KvJi2cR8c26KGNAbbxfdZERrFdgSUvcQ37/X309Wn5TsamBaUalHZKpdAN6aROHNJnLSdPpb6+naMoMeTopqC+EXe8gfXZaW9CH7PRcblh+TTXDX/qrPeW5qaauMtaxhnsnyjm8hZ2nQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(366004)(396003)(39860400002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(2906002)(31696002)(5660300002)(6486002)(478600001)(8936002)(4326008)(8676002)(41300700001)(316002)(66946007)(66476007)(6916009)(66556008)(6506007)(38100700002)(36756003)(558084003)(31686004)(26005)(2616005)(6512007)(53546011)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzI2SzFwZFQwUHlHWmFTV1ZSSkJOamJFeUxvK2draTJWL08xUUYxNWlSdEMv?=
 =?utf-8?B?UDZMUURjb0xFU0hJZ2dTMXVvejBmMnJ2UkxrVkFHQWxmYUhWcTFZMXQ5YWxq?=
 =?utf-8?B?QWFoTk9UbkdzZ0Z5MmZvTXZITk1hMDkxSTRDdmozUURMYXUxbW1XMStGNmE5?=
 =?utf-8?B?N2k3SHpwY1lMVXNZalNyUUFzRk5GVkFZNEg4MGt4bmU5WksxQ1YrbFhZcGlF?=
 =?utf-8?B?RlAwTXFaQTh6VTI4azY4RnlvL0hVRlhTVzg4Y0hjdHpsYUxPMEdQNFNKak9B?=
 =?utf-8?B?N2RQTDFRRUZFUlNtLzlEaE1TUm1XQXFDYlh4WmU5OU9iTzFoc1M4Rkc1U2lh?=
 =?utf-8?B?amRBNWdud2k2MGYyWnBsK3ZDR0hZcldicW5MQ09iL3lSYU92Z3N3SDhjNHhp?=
 =?utf-8?B?cHpWK1U0S2E2ZFh0UDREQWFpcHNsTU1jUGE5djQrWTlueHpkY0VGREt4a2Fo?=
 =?utf-8?B?bjkxSk5SV3Q0ZUxFaTVMNHBoM29USUdvY0tlenV0Q2dMcnpUNmFMT2kxWkhP?=
 =?utf-8?B?T2F0a0ZCUG9VQ2NQWWJxNktlN3YrK2dWVXA1SUJHTENNUW5pcG9GS3BsVDRL?=
 =?utf-8?B?ZWNISEtiNms0T2wxKythbjVtclJmbEJJY2JPdkZhOWdWb3ZSWGx1bnlNS0V0?=
 =?utf-8?B?ajZOYXNDMHFEZGpGMGtIRDJOdlY0d0ZCdmRKMTNqNFhXMDl1aWNlbjFaSjZ0?=
 =?utf-8?B?bm9XM2NnUHk0UlRRaGxLdXBMZWQ0eUdyRTBLUy9xblIvTm9CUEtQSWpjVk5L?=
 =?utf-8?B?bWZDZzdZb1FkbGpXZGIvQU9yN01WSFEvV2MvQnFxVVV2TnNBaXcrUHBBUFZa?=
 =?utf-8?B?NjV4Z0cxeU1vQ1RiRTJwQk10V1czRTNrM0U2VDBrS3V0WXJHOUhWTW16ZlFW?=
 =?utf-8?B?SzRBNnlWSnAzNGppa2FsU0I0OHpndlBWak5aTnJ3VlNibmVXL3lkU3d3YTJX?=
 =?utf-8?B?NzhHbjlhNDhEQzB0c2QvM1VMd1BOSk9oNlk0U0xEQThrcnRVcTVUN1Q5VlA3?=
 =?utf-8?B?cnZOajY3V2JZT0IwZG9BSDY0L1U1THRqWnM0U1o1UUJYWW5RN0c3M1prRlpN?=
 =?utf-8?B?eDZLT1pzSTF1cEdLaWNObDRHalRxL1Y0K0lXd0JDbmlOMURCNVRQOXRQY1Ez?=
 =?utf-8?B?azFiTHRqNGlnZ3pDdEFDMG5vbitIbVpzR0hTNWNSYk9kWGJ0bWxwTFpQQjZG?=
 =?utf-8?B?M1FqM0Y2NmNJcnhya1c5cFZwTWptUm5BWGlNSUExSUF4dWUxVENZbTZWVzB2?=
 =?utf-8?B?SzBQcmRwWVREVXF4Y0FmVGVHVDVKeTdlSkg4YW9Ca2VYYVJiZGFERXBDYkZK?=
 =?utf-8?B?RjZsNXdNdUFaZlVjR3pjY0RlSmtCYU9CMm5ibWpuT3hqOEYxREtYMEFFTXdP?=
 =?utf-8?B?UisxSTVnSmEySUpuOG1lZlA4YkJmRU1TbzF1ZGc0STVDdUU2bk1tQVM1VjNE?=
 =?utf-8?B?NkdHVytLVTVSMmhzODBlT1ZibFRPcUNsYmFsdklwQXZtd1l6QmpjMmFvWTdu?=
 =?utf-8?B?cmVXMHRPbWdKR1JiWE1pa2pWTHBkY08yQU1aSnVxSVJCMVRycmd3QXMrcWJj?=
 =?utf-8?B?NElicGI4a2l0S3dCaUowZUVPY0dPdTkwbVNSbWFJZFprSlowL0VHaXZSNi9W?=
 =?utf-8?B?VnRYVmxWQzFYdmYxSkptenlJUEZLRG84dmwzVUUvWG9PVGU0Ri91NlFWWWJs?=
 =?utf-8?B?Y0IvSW9ES2Q5Z3doMjNjQkYzbVBreU1XRExhYkVpWGpkZzZJM2N2aVJiU0NC?=
 =?utf-8?B?VG9pVk1JWlRzbEtyNExGQjQyd0psNWJUNlNPc3M5R3JMOHM2QVRmTXNyV3or?=
 =?utf-8?B?bU1QWUc4SFdJMTVWVFRpOVhwdWF2WWxaaktla0NJZEpFMXdJaU1TWnlkbWtF?=
 =?utf-8?B?b3VRUkozUVRWQ0x3ZGtzSWFkOEk3eHdOa2dxTXB1end5YnBhNE16Kyt6by9p?=
 =?utf-8?B?UUlIWFF3c05rcFpCcnpwdUVkSVhYOWpzR2pkSlZneDdvNFFiaTlzNkdVc2VH?=
 =?utf-8?B?RmVCRnFCaS93RVc1NHlzaS9GemdvS1dvdk4rQk9PUUJVckdodEFMUDdzWjEy?=
 =?utf-8?B?cGp0c21hR2ErWjlia2M4aDJranh1YXo2bjBjS2pnMmVHSjd1WC9RQnhiczV3?=
 =?utf-8?Q?zS0kz4KbcGeA+Ae7VYTJEAH9l?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fe82c53-2a06-44df-f323-08dbd4a0ab54
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 14:51:13.8695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DMBqRaEAGLMP7sixRzWd4PVvNfleV9oqfj/ic+CsThcvzmaEmmoNrjDs/h2znbx3gb3XLzbRQ0giAJsVoJpUcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8336

On 24.10.2023 16:31, Nicola Vetrini wrote:
> Fully explicit initialization of the cmd array resolves a violation of
> MISRA C:2012 Rule 9.3.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

While I'm not overly happy, we accepted the rule, so
Acked-by: Jan Beulich <jbeulich@suse.com>


