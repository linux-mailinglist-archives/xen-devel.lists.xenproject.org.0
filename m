Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 963E47972D2
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 15:25:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597343.931567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeF0I-0004WE-1q; Thu, 07 Sep 2023 13:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597343.931567; Thu, 07 Sep 2023 13:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeF0H-0004U9-VG; Thu, 07 Sep 2023 13:25:01 +0000
Received: by outflank-mailman (input) for mailman id 597343;
 Thu, 07 Sep 2023 13:25:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qeF0G-0004Tu-Gg
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 13:25:00 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2040.outbound.protection.outlook.com [40.107.7.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1c80691-4d81-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 15:24:59 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9430.eurprd04.prod.outlook.com (2603:10a6:20b:4da::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 13:24:31 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 13:24:31 +0000
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
X-Inumbo-ID: f1c80691-4d81-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIWT5jOEv/cINFYM+9KqfdUKEOnjBt/lv9tgk+ZLXFlKwXUX6+FWQdelRt3a9S29I2iVEyG3Cq9tH0H6wKShF87z0hPgJ+Sh4N+U+fru+JyAkWvlbJl9OthnsfCNKtj5XIRKKSd3u8N+tRD7xg7Masr5C8IY/lJun/ATUcGmVhwzIRXEuhJDXZlfoMBwo86LO9JzMS8JlLTXpbAdYoGL1reOtwjpASvwmIXY+20Gy3B3WMgpwAuuGWr/Q/O/dWaYzWUcrUddbawnuCe5guwvZ7YquGiOBRXm9Ub9w+rg15lrozQw16mMYwQcafy5mJkoRJN70RbheNB9QCqgT9nLKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7s9nDtvaECeQLljz8qD6/7IUuK/9RqmZadBVEtgrNak=;
 b=Wz8gZr1DZzGipqV9hRvUgalsXXLGGPpE3ofdVTj/sXdV6uj+cY/4pOi0DXbz3iefH7+PxPn+8Y2l1lIwZOMtGfOQZhkWE1+UrdeIyT1kmA6wGuSXnl9w2wSk+NHBUcjdUvVnuKfO0u+Tpr+E0AxsoWsxInyifZCMfj1xBZO/pUSWgxU6D5ycUk2UsO0DdIiSjaXEkwSu9uHfH3BRguXxrMwyPEDIceFF1Vazc+FtfJM4PQLgWrLhQX/amKSsqgQLPg2XXF93Ej6OtLGmmTT5oFyKQuZHviEw/PFuTAjF56Qqaoq1m6zUHXBlMiOFQiqIRWs5ghaKJrj8tXA74cAUNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7s9nDtvaECeQLljz8qD6/7IUuK/9RqmZadBVEtgrNak=;
 b=nc6PMToLZmVMBJC/5nfwWVfwt460P91ALacxRVbbH8tLLEHaV900BETjdkT3QZjbYcj8pFVEJAkZMFTUP73kohz8IwlZkFaAmMjJmEOi9Sm2RI01PzCz9qH9dBdgZoN7+BRN5OPKxCBsE5Q5a06+2xh5DPq82r7fTNhEfeXzOHPYJZ6Tul+/Sbvader1tp5qY+oIUxEtdah2+LXc4KL+taCpfkqBMuXO3MIhBlqsoY2/N/rwDa5e0wsEjMyhiT3o0O3hAUutfq83YsDWxzd3ACaNU2pShzO71JGXff5BotTkEOjzxie2yfTQeaW26sUlQu+wRKitIlrWC29cokXWCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d4dadf79-a05f-4fb5-193e-1acdb3470a49@suse.com>
Date: Thu, 7 Sep 2023 15:24:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH 1/4] x86/genapic: address a violation of MISRA C:2012
 Rule 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1693990010.git.federico.serafini@bugseng.com>
 <375af065f072488f74003256aecc325f166d532a.1693990010.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <375af065f072488f74003256aecc325f166d532a.1693990010.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9430:EE_
X-MS-Office365-Filtering-Correlation-Id: d6de685f-366e-499d-d4c1-08dbafa5c4c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oYhENMSHsVylIi9QhvBBoq/AkZZQ/t2GbRXE3O+ftlNp+J1ZcCHYXxqOpsYHsfvNIqk8jXZ6zgUNmr1gMoZncHY+F79UhG/2r1zReNlZ4s3tUr1yTgyn3LxvDB/+pwLFQt7bsPO6uA4TyltoVP2umStU1Djxt7Thj4BG2FuWGw59yBNa8/hZz21g3mXN4RIs8hh4w8806taY5Vq/V6v9tuJQZJwOeTNdA3q+ZJK+u91wZvdOyNyC1yg4VivJXVMqMA7ooXpz71svbwctv86oPxqMqlr0Euu5oC2hhN8RP6luH0gge0y3JO9nHG49tkmlNBgSWDxOSPl9M8B9oXXtPbRVCw0m9ZmVPux3E+C55LyKUeubrrJ7zGD2kU9QXdPrfEGTQvDAaBtLJK3AyRl2eRVmLzUUHrA4d/So3QwC3kYVD07nVV9EC0TQE3JhElbVlDkEre7SeoUh/ntDJM3++/zHl+A3OvufC/u6ei5E2wxKZQyUoZ5An6zTb8tWs2gkZr1taZOBwUrYztdPl6I6LkQ2PRfdLeK4wzASc902i5HUp2AX42KxdZm1a7g3BOo/5XYQor3RUa8QBReZs8iU3nziy7bVyk6ScdEVbhnMPDttTPINuaAGJzkhJgJ7o4Nmg3u4KP4o46uP8eokLZ02xg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(376002)(39860400002)(396003)(186009)(1800799009)(451199024)(6916009)(36756003)(2906002)(66476007)(54906003)(316002)(66946007)(66556008)(4326008)(8936002)(8676002)(5660300002)(31686004)(41300700001)(26005)(6486002)(6506007)(53546011)(6512007)(558084003)(6666004)(478600001)(38100700002)(2616005)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SCtjcUozTEt6ODg1ZVV3MXg5WW5TajVPNHRERnExS0kwcUdVRGZWWlFhamk4?=
 =?utf-8?B?SmtMN3ZybXVyVmRXSVNzQTN2SllveW1rVnhUOTI3UVhlTERBWTlNbXRmcStw?=
 =?utf-8?B?WTVlb1l1RFBVMEZUem5NRTlsZ1ErSFAvaGgyOGZtcFlwOUFBZGhYZDIxL2R0?=
 =?utf-8?B?SXo1bkRlZnI5RDNSTDRzaDQ1eVcyS1ZWVy9OVmM1cFNLVFZNeHRCbTl6NW43?=
 =?utf-8?B?MWQxRVdGcWpBZDlVdDh4b0lpSzBscXNIZzVwR3NheGF1SWlma3RZVE13L3ZN?=
 =?utf-8?B?dUNlOEtEdUZmblZ3OFJJWVExWU9ZeVlZbnZ5UDZYYWczdTNEWDFzRnNCUW9S?=
 =?utf-8?B?ak9LdVJNMCtQL0NvcDFwSTc2cU1qQ2JGWUEvVXF6cGdFcHJYRE5od1dCV3Nt?=
 =?utf-8?B?aUJOSTJIaUpNVzFsR2FTTVE4K042MVY5ckM2Q0xOdzVZb1pKbWdCQ3E3dml1?=
 =?utf-8?B?bFJIM1hiNXYvOFFyRDVabFNoTFEvSk1vR21kbUh4cm4rVzNzVGVPVGp1dlJW?=
 =?utf-8?B?OFUvVFllc0VicVF5VXMvb1N0ZmR6UEQxeDh4NURucjlqdjFLaTNyYm5GNWxr?=
 =?utf-8?B?OXd0MkE1dy93N1RCM2VHRHA0RGRyMVExVDBWSGZsdngrVklxaElLazVHeFNN?=
 =?utf-8?B?ek9WUFlsVnNvcVJPYytFNFVzRVc5RTNlWmdMdlhaeDVzTWQrMlBER0x0UHR2?=
 =?utf-8?B?ZVNscGhOUWNoUityNlU2SVl2UE1EV2daZm9leUo4Mm52R0N6L01mZE5PUzhv?=
 =?utf-8?B?V2cyUXQzUWx3Ym1RVlo0TE5DUXZwS1EyZFJBZThuUCtuQldWYjF6Qm1SeGFT?=
 =?utf-8?B?OHBaVXlFbFBTbUxObU1zWCtQYytvSzZzcVdtclB0aWVzOUVicGliMGlhY1pP?=
 =?utf-8?B?Sm5Qb04xTmt3Zjcva1BNUHZJUzRGTzNvL09XOElvMS9iQTdqVHBXYlozVmNQ?=
 =?utf-8?B?M2pVZXV5dXJhQWlJcGRhR01hQW9rSFBXbzBPelZwUnZ6eS9VRWh1MmZGTGhT?=
 =?utf-8?B?ZFVkNDVpS21jS1gyNFpCNXM5cno2QWgweTEraW85SHJUcWplMjJVV2JCdmdC?=
 =?utf-8?B?NW91SENkWkNkOGhmK0w4WEJuM013Ny83R051a2hyTGI1YUgxc3VSUmtVMVk3?=
 =?utf-8?B?UXN0dVZaTzNmTkpJVTU4bDIzMWhBOURvbnZ1Zk9VYzE4M3Q2NXJnZWM0MlVR?=
 =?utf-8?B?THhmRWFxeS96VHNDd1BYYldQNUlvMzdTc05FZnQ5SGdpVlNyZk9hVHBtbDV2?=
 =?utf-8?B?UEF2a3Bxd0FQWmlKODg2ekhpNnFPVU9lclNBRkpwUTVid2JldktvYUxEOXQz?=
 =?utf-8?B?UzJzVjVlcUJkeFB0eCtFblJYR05UT0RTdDgwQ1FRVldLdGozZkJFbDZPblpX?=
 =?utf-8?B?WmdycitvTVRDZGZUckUxUUtWeVZHcU5XSjNnN0V1L1dzdzR5YW9FU1pXQ3BJ?=
 =?utf-8?B?YlFLeENzeEF2TWMxMFhObzI4bG9SMXlUcWhyM2dlNU9tL1JaTUx0bllFQ2tw?=
 =?utf-8?B?RTBsSWlBUGZwaGJmTlJiMEhucnA3dG1SVXVhQ1N6T1p3UDdLYVZ6VDRJRW5U?=
 =?utf-8?B?RjlidWJZT285Q0I0Um9zOVRpN3lhM1FpYWJqdlJvUWNrYkkzT0pyaVVIVVNZ?=
 =?utf-8?B?eHpxcXlzZmpmQWRhV3hoclE2Ui9PTUcwbUhza3VncHdibU1td2V0QWl3bVdN?=
 =?utf-8?B?cWxqODVuZ3BmQ0E4TFBxbXEyNWhTeEZINVlmb2YvaGlTU3lQU3g5akNXNXVT?=
 =?utf-8?B?b283T2Y1TU8wSXhqb2ZXcEhGWlYxelVRZmhGVXVmWmhsQ1RFQ2lWb0d2RVBq?=
 =?utf-8?B?Wm12dGhzT2lTY3orTThtMTNXYk5SZUpvMVFHRkJGVkVFYWYwNHM4MGZoUEx3?=
 =?utf-8?B?WWxuZ1BUakVkdXBJd0kwbjNBWWRSa3IxSFE3ZFh2WkpTL00zRjF2RmlEMFBs?=
 =?utf-8?B?ZTFESTFiaW9UdEVEK0g3OHEwS3Q5ZU5RWXR6czFrbFQwaEo5V2ZySkFQaUFi?=
 =?utf-8?B?TnVOd3MvZ0hJQ0kzRG84MmNqbnBPNWM3WFY3MWlpZVAwNitxYjZHSjhqSjA5?=
 =?utf-8?B?aGNrN1Iybll6eFNHUHg3UTdDdHIrU0xFZVJHa2lES2xteG83NWV2dEVkOUl3?=
 =?utf-8?Q?yTkMm/ptc1fznKeVBtDDOaJyS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6de685f-366e-499d-d4c1-08dbafa5c4c4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 13:24:31.0364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZqbEBDx9B5kGTrvj+ZGT/yDNDcVYSNHJlc/Qf/JSe2DeydMWq+Jzm/1RldjeROBLnaVYJlipJ7LREmkW3RFSVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9430

On 06.09.2023 10:57, Federico Serafini wrote:
> Make function delcaration consistent with the corresponding definition.
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



