Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D32139D4FB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 08:33:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137668.255044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq8pD-0000RL-T6; Mon, 07 Jun 2021 06:33:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137668.255044; Mon, 07 Jun 2021 06:33:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq8pD-0000Ow-PH; Mon, 07 Jun 2021 06:33:27 +0000
Received: by outflank-mailman (input) for mailman id 137668;
 Mon, 07 Jun 2021 06:33:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cRKJ=LB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lq8pB-0000Oq-FA
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 06:33:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 69f0d7b9-4315-4bfb-9e11-9d27209969d2;
 Mon, 07 Jun 2021 06:33:24 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-o1CXCpKMNKCBaK9eHzcZ2g-1; Mon, 07 Jun 2021 08:33:22 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4351.eurprd04.prod.outlook.com (2603:10a6:803:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Mon, 7 Jun
 2021 06:33:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 06:33:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0261.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.22 via Frontend Transport; Mon, 7 Jun 2021 06:33:20 +0000
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
X-Inumbo-ID: 69f0d7b9-4315-4bfb-9e11-9d27209969d2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623047603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O0JhOLHAau5riUtwzhZ0wKW/7b8/ajD73TmPQBB+jOU=;
	b=UCkBU+EZd3q8ySQuF0McHdWHYqcx767RAOn7a2Kpo/T3Kj/SBOSfkOtqLHglc+JG2QMf6G
	+8j3nFvPPIrUGkrZm+yAPQcO8t5zAoyh/yoeVAyQEDatqanTrUy+dBEMZQFchEnOk1q52s
	VoQah0TsOZ07wJgsTHfT39kUGufSeus=
X-MC-Unique: o1CXCpKMNKCBaK9eHzcZ2g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZV2FyUWd27rNXk8jbbldzRYvqAcAEYXe4ccS7U5mjNZdK7ldXvxxvE4t2dGMhPp8jcps5piDZjKB45iYJyEhstRDSQyRixhyejMiETBpcdasQ6oS/Zn693De+UWUIfthJddeV1tuso7G/scQtJtxqHRvSBdSpI7hp/21WeNM+p9akRLPkqPtrexgK8sa86OesgxhpCS4shrELAe/h+I/+EciXUfOEyBCqEQYRKlGbAt/JXb93j+ilP52n1kR0mPrWOS2wM5oGsV41421ss/mGhVJpzhxXhfyfDmNoBypSVQB30EuKBmtT5lG8kT/ehP8LfRRwtDLTdayBLj8koCTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0JhOLHAau5riUtwzhZ0wKW/7b8/ajD73TmPQBB+jOU=;
 b=dUlx5SqNRLKJFZ+aY0RXwJ8YbIpWdhjfrhYMqNB/+6iCdRNJ0PvY1Awt7u+GjloMajx4dQCP//viLE3iDjunvDprvZye7jb1Fli+rmqmc+xkFCsxl8/AJSZQSiehUnfE4r8MzeVv2d4Wqd0FwtxBGhqoZxeOS0mlaVgqi28tkznCjq9y0If0L4d070JrpasHxhyyHfNyeNx41J0T2GIxeTCFbuR6laxXJrVMT8g5UQ6uyiGfn5tDMdH20o6XZFaApmVvegWGE/Vsl4h/0pvdPxt24s64dAMxpgl9eYf4QsboavBtohvyKFTIgTHDyb03bkje11a4KDwuzebt23rnBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] MAINTAINERS: adjust x86/mm/shadow maintainers
To: Tim Deegan <tim@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
References: <YLjUM0Dzqn0lWA0l@deinos.phlegethon.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ce4b0cbc-2168-9320-d4df-ff9f27fb4559@suse.com>
Date: Mon, 7 Jun 2021 08:33:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YLjUM0Dzqn0lWA0l@deinos.phlegethon.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0261.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::33)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61bbe7e9-07ad-4f89-4634-08d9297e24ea
X-MS-TrafficTypeDiagnostic: VI1PR04MB4351:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43515B6FE15620BEC9DA9B28B3389@VI1PR04MB4351.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wMKMfa0prfq+oWAKN7kYyaIDfHNA3Z+o8SBVFZCrAn3EzG1hGu6RLI9UlV+8NHG/0Om5YnC2EFNWuxuuEs19QDnrgbeSqtvqTUVQgAUOPSQUk/k8JRIMQ/HKtDTvSezWcM53X6yUWWJN/mHCthrF6MPjqAVtGdZzm1qZryutOsjf+MCHRKFQOrdz+k1lWPuUjWHabMaNjVSywzvpSRe1o9Ok4kaXU173KU/D9JrxsaLzgRsmv6ICVRZomdVUkFV1euU1r6k49VCeFBjGcyNCxbXEya8XANc0PVXhtWCm2ZeJBu1zDGAyPKHwXfv3aKXxkqJ95WihgCLTr7o+q/70ePEBpWA8CGfZ1ZXYoR/vcalkPJeziEVJ/NO3KQYRSX4Q00500iICSQOz48PWfsXOBbZ1QeIcz+aEFnNEL00ilyJmz+pjQ+vIia0pQdwTEaChtibTh/i+0nn8QlFvy/QFbo27fyMnvteBIw5zCKzxUSsxbZc8+Oq2gHFpNb1nC8CCm6QtprqMXFxz0avMirqGu5hjsJVCjo32cokwZN5RUtd7xusPWBuwxqIhnMmk3ZN18j5sJIufsRwlYv0mrUYSYBYEeyw+WFooP822EnMWDz+Th8fGxMttz6aEEYyL66zL08cadPi7FOE/5lFvJ241DIlyiNpsygSJiV87fXVLuaHtSSL3ZIUTNgHdEOpLnG+z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(346002)(366004)(39850400004)(136003)(2616005)(2906002)(956004)(478600001)(5660300002)(26005)(8676002)(86362001)(53546011)(4744005)(6916009)(6486002)(316002)(186003)(31686004)(36756003)(8936002)(38100700002)(31696002)(54906003)(4326008)(66476007)(66556008)(66946007)(16526019)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?UngyU1hTTlpIdzU0dGw1SGt0ekJMWG41RkxlbmgzTmdIS3hFOCtub2I3bDFH?=
 =?utf-8?B?SVFoKzdqUlZoYnphQzVRWXpRU1EyTlJsWlJMS2lkUTRzalk2TWhKWTNMM3dG?=
 =?utf-8?B?NU94enFSTDVuN1oyVVBtTmNQL2xSN0U0WUJSN2FueWRXTFB6Zk1MV0hYYjgv?=
 =?utf-8?B?TEQzK3BWemJuL29KYm5ndWs5ZTd0RCtlckZSaHV3WnZGcmpZbjdhcVFkeSt2?=
 =?utf-8?B?L0EwZHkwRS9yVXRxQnBIVXFaMjI3cWVjcWw3S00yY0pNenBNeUJ2RjVvbjdG?=
 =?utf-8?B?QzRkV0V6bEhQNC9JNlJHRHN2TjkzNjAyZEc2WGg5b2ovYzZyYW05dVJkVEhT?=
 =?utf-8?B?VVZvLzJHeVFBUXpXMCt2VlpaZzN5NWo2UmJWUi9vK3dLcWQwYmtLekxOK1I1?=
 =?utf-8?B?Wkw3Y0JpUWxFOVprTFhRcWRmZmM2amgvcmh2N3BjNVJCLzJYMis4dDZQQytZ?=
 =?utf-8?B?cjRwQzVxVThGUVNzbldRL25ZaEJ6ZHpTM2xCN1BadEk4NmxBUCt6T0swcGZm?=
 =?utf-8?B?b01RK1pTK1VWV05yczZ6Zit4K1B4UGNFTnlxYldnZUJWM3RTa0dLckFrMmlJ?=
 =?utf-8?B?TUpnU3BmcC9uQVN3ZFN0dWxMeUNNUE1kd0x5RUFsUnFaUGRwRFE3MkNWaHRx?=
 =?utf-8?B?K1J0dWg0QVg0UHFvMVUyVmxBOHI1dWV5aUc4WmNYUVBQdjU4c05Ma0ZsQ2tH?=
 =?utf-8?B?a2oyQ2VCbzJJa2FtTFVuRUMwMkowMDhyZDFzZTRlUWVRVUVCazNYWW1nQTlx?=
 =?utf-8?B?c09iUDQ0TVRKNVRrWmExck5Fd2xxTXZKbWZlcXo1Y1FyNFpCZ0ZGNUZNSGFz?=
 =?utf-8?B?eFU2UmpkK3FSdzdXWUs5ZVFHUXRLUzJFTFBkN0lDTVBFbEpJSWx3a2dMQjJy?=
 =?utf-8?B?TG1HZ0NRTG0yYjV3Q1BsRDZBMUl4QTBpUHg2TjRaMERyQ09xKy9mbzh5MXdo?=
 =?utf-8?B?MXFtQzV6MllEdEZpSkhnTHF1ckVzODc0Z3pOWGRsMm9zM1U1OWxuUWFVOTJE?=
 =?utf-8?B?UE5HUi9UeGFqWUVlK3BIYjZOY3pjczZWWGN4RCtHY0pTbXpJeDcyUXliOFgv?=
 =?utf-8?B?aUticGE0alkwMHVUaVBPMS8rb1dXRUw2SnNodHhkM3BMakNzMVNSYjdhZ3ls?=
 =?utf-8?B?UjV5b2pPa1c4UHY2N3pSKzJGYjBNNmd3Y1FZbFBPdkROY2UrcFJEeU82VEtz?=
 =?utf-8?B?eUZJYWErQkx1VGRpeUkxRVl0cHorWlZLR1Brb2NXYmNGZm9tMWJUK2NBY2xX?=
 =?utf-8?B?UW5xQmt4QVB5VEVtZHdsWkpQQjZBUjlmOHRBWjZjOHRXMitMcUVjWFk0aWJE?=
 =?utf-8?B?SU5QM3g3djByVzlLSzFCUXd2VjU2VjZ3SjNOYndrLzNIdjhlVUQrYTdvb1ZI?=
 =?utf-8?B?dUtVTkFhT0kvUXpjKzNONWZSdkVjQnQ4TTRxeSt3K1RMRkZHeUUrTzBRNWVz?=
 =?utf-8?B?eUtpNEZqdENzZjNyTko4OTI2WFBmeGJiSk9jRzcxaE1IbncyQ3NqT1NEUjBn?=
 =?utf-8?B?WXlCd1FiVi92WUROQVY1eDFyWjRBbUQ4SXMvZ2VPQnArOVpmV3NKWkxzOUJ1?=
 =?utf-8?B?a09HYWlwWW9oY3YyTnhMZmthTUhWTk1UdEtvT1hGMTBTelJyWU96ajhLR2k5?=
 =?utf-8?B?ZURycUppaDJuY05tb2o4cEZtd3hKd3QyYk8yS0p2bGpRd2pNejJiQ1ZjSFF5?=
 =?utf-8?B?cFN6YXlEYWVOZGZtREtvWGdaa05DQkFSQ1RlczFudFhWbVkyNnBvd0FaK1RI?=
 =?utf-8?Q?rgMOH95f20IUIWbzZLMJfLx515tkDJR4YrHqTmF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61bbe7e9-07ad-4f89-4634-08d9297e24ea
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 06:33:21.2426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YuuWTxTNMW/dVWdH4FzvtQu9EU/wSidvyQ2mhgIf9ICokIyOBqj5xWxhm0Wqc9+KIwuorU2oGh12cahwCsWzlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4351

On 03.06.2021 15:08, Tim Deegan wrote:
> Better reflect reality: Andrew and Jan are active maintainers
> and I review patches.  Keep myself as a reviewer so I can help
> with historical context &c.
> 
> Signed-off-by: Tim Deegan <tim@xen.org>

Largely for formal reasons
Acked-by: Jan Beulich <jbeulich@suse.com>

> --- MAINTAINERS
> +++ MAINTAINERS
> @@ -591,7 +591,9 @@ F:	xen/arch/x86/mm/mem_sharing.c
>  F:	tools/tests/mem-sharing/
>  
>  X86 SHADOW PAGETABLES
> -M:	Tim Deegan <tim@xen.org>
> +M:	Jan Beulich <jbeulich@suse.com>
> +M:	Andrew Cooper <andrew.cooper3@citrix.com>
> +R:	Tim Deegan <tim@xen.org>
>  S:	Maintained
>  F:	xen/arch/x86/mm/shadow/
>  
> 


