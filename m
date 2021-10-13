Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6F442C4E7
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 17:37:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208664.364875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1magJN-0005NC-0t; Wed, 13 Oct 2021 15:36:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208664.364875; Wed, 13 Oct 2021 15:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1magJM-0005LP-Tl; Wed, 13 Oct 2021 15:36:56 +0000
Received: by outflank-mailman (input) for mailman id 208664;
 Wed, 13 Oct 2021 15:36:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1magJL-0005LJ-Bi
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 15:36:55 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6425bb2e-2c3b-11ec-8181-12813bfff9fa;
 Wed, 13 Oct 2021 15:36:54 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-yorydFhJOF-YQNTEAxsUlg-1; Wed, 13 Oct 2021 17:36:52 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3391.eurprd04.prod.outlook.com (2603:10a6:803:3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Wed, 13 Oct
 2021 15:36:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Wed, 13 Oct 2021
 15:36:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0032.eurprd04.prod.outlook.com (2603:10a6:20b:312::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.14 via Frontend Transport; Wed, 13 Oct 2021 15:36:50 +0000
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
X-Inumbo-ID: 6425bb2e-2c3b-11ec-8181-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634139413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y9BIJQobaTZEoekm+P0iAA572KdUtOghT3sS1h6RJGc=;
	b=H9oweS7HXPhuf9LdXIbAc0Yg7XUgyX+zE9LBmlWEFEDh5c9hRirw70fzMwq0aH3oivnrhm
	GN3+3jnMiZEkb4HYHkhLzHuQVQVMKxV3GhzGWyzMG8RZwbOf+rPg39KIF8eWrLSvexy4ly
	hNcqTcClz87XFcSh8CWT6NOlJcz5p+Y=
X-MC-Unique: yorydFhJOF-YQNTEAxsUlg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwCpDHyMBfEi1tgf+KwCHOAoz+pituqrb4HyLjC23oJnJPOY12u7xHtNJytesSGxphWkoISq54Jlq2ZxNjfcM9fyv9Fa3roXd+zzz/67K+r+nLhIxSmOK7CT051W+QI6XB0UG0VGIx3WhYoRkYDW3THvmZHV+peC4d6JhoUB4DjfPEpCCb/mIga/KjAahLgV9aq0WfFVR1IrOQpeBupdO/Lg4S4/SAO7sSn2N6feZi523dFSBfFNPO1b0M/X8mAkxb+3WCdSZ2ymsUvHbk60lE8qdL2yE/GBltM7rwLu3RiVV3ghDQmGFxrrI14Cf/umde8SmZIA3s9SlZRflBZYwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9BIJQobaTZEoekm+P0iAA572KdUtOghT3sS1h6RJGc=;
 b=EQvDwfawRCkll3BiN48nbSDTDahQf2nrGEKr/Skl+3S3OxzvxomyWAYWFsWJsfJLK+lHHeMJ4wuBYt9UPSPAyGEj6E518cMoAblAFaKUX1bE3YUoVfklDUkjoMHMyfpuuMiGeAaFqq5ntyYmeFBqtaSD/zCbrl0a3iYDrY9qrZGQSalpc6mMzw/DxUF2U55OKiYNYnsD59lVm+Jn5P1IEcAAKsIfQ1gLfns4M1JMdWW8k7YaA2Pf+ZvfVo3US+Pzd0ZXsbyvk+ot9ypya+McJHG+F0JpCodSbmSsaDJHV2ikgyO2a2jtMOstm/9IrVp5IP5DZfRtNJibAlZkTF4rQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86/shadow: address two Coverity issues
Message-ID: <24329000-06d7-2047-b0a1-51b149d19189@suse.com>
Date: Wed, 13 Oct 2021 17:36:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0032.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad855273-f906-471e-77c1-08d98e5f46a7
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3391:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB33916544BFB72A30E832B881B3B79@VI1PR0402MB3391.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bB9HyhEBzY9o4X3iuvqDtdHek08ZeGdEIr0PpRL6+jCqxoFhvUMveyFp1fxrKVegFA9L4mYgNVpeFG+wNbAwqhMpnRoePxtjl2w4lFaqWVx+XfASJXZHAxNsWUY4EGSPXo5NT26MNY8SlNAnWKkhvnLjqu95sjw/WqzUM7jhEmXw5f3WPaQrriSnt97h8M0p4ovshxauNpJ4bhiAv1lI85eyUZz7XDNkGxKwhzC53K5oCIk3nUcHIX9oGyb2vATb686Y637yOWeu6A05BzVNJkmXtHS387iLKk6o0vumnARQdcFH364/fp8ECEkw36fjs9zQhy8rUx46Abnj3s3oliS2/TW139bSrVyywk2+rmi0vEXvBN2JzlIPL3FqYFP1EmlCeJUH/sYx2kYb4fswCPUU4uhKyeibf7sEN46zYWCX/zDuK0ZcREfvxXPkET5g9HZox3grEC8HMZVPZgBYssYyCI/DKHa/3nmWUDfQIwdvCAZKvCNiW7QczTf57xCVpQ2I5mSEjzzPfKXInJ1LbvUEOQ0M5JH87h/vd+CCEnwxwqiQcs9E+HZ35d2rp98D/R5KBjCDbQ5yVjhoDCZrTn6wnXMQxrqrqmL9P5+XYlzaby6sNxH65eTSDEvDq80Xq3/plhlWwkqYhHcTa0NjuLl4sw+pRPdsFGLyXvm8syQz+RTHV0kLq9EgXOWf5dyrDdExhY8oWtSlzF9UNMujA7N77qxXma+TJXJhJh30yNdTtZoE90HkVYkBCZV04J9J
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(66556008)(4744005)(8676002)(31696002)(8936002)(38100700002)(66946007)(2906002)(6916009)(508600001)(54906003)(26005)(4326008)(31686004)(5660300002)(6486002)(956004)(16576012)(2616005)(316002)(36756003)(86362001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVllODdJcHBiNnRTc1lHdnlTMUFCRkZpZVQ4MHRYYTJpc1lRNmIxenhhTTJP?=
 =?utf-8?B?bHBxUHJTVVh3NXJDZ08rK0tlTlBub2RTMnY1WTRwTDhXV0laamxWNk51RHZ6?=
 =?utf-8?B?WVZES3lBS3MvdXRmRE4yTElIUjVBNXpLL2hoWEpnNDQ3YWkrVVJjTFdwdTQ2?=
 =?utf-8?B?Mk90TTBnbUhMM3FuWG5jbGFDNUhVN3h4MUdONTcwMjNmdDZOU3pDRElZLzdP?=
 =?utf-8?B?ZlNDQ1hlZmJ6SVB1TndyTXdudXliVXRsTU9WQkFHcjloalAvM3k0OXh1NDBZ?=
 =?utf-8?B?UTJEN3NiSFpJTDBjRnV0RXFTSERPU3NXNGt6Z2ZzOGNPWWZBQ1RVMkNsZk1v?=
 =?utf-8?B?cnliMktpSEFKQk1tUGVobENVQ3owK0tqZVZlMGVVTExOeUc3QzByczBvZk82?=
 =?utf-8?B?RHV5SE83bi9ra2pXRzkwSzZHUWVrc2dQNm9jenZwc3JvSWU0VXJBTURPeWVB?=
 =?utf-8?B?Vmk2SmdwQ0JwckNaUXp4WEZtRjJyaUZkNkxuYkp2ZFBJT25scmM1NnlwZjJo?=
 =?utf-8?B?RnYrTk51RWVLMHM3Q202ZUgwZXc2R01SWUZGNGUxckM2TWFSWkxhd3NVQkhR?=
 =?utf-8?B?T1l1SXlmUFRjWHNsTmRYNDdrWlFMNnFST1A2aWNvQmRTZlllQ0RGMFdOSUk1?=
 =?utf-8?B?Q2RCVjBSNW5JQ3o5YjQ2S25oWDJ5SGdkMGc2Rmk0T1pEMzNScWtnMVNPTkJz?=
 =?utf-8?B?RlY3VnFqNWxLd2YvM0VmYXZUVVQyRWxxckpNdEwrYTc1ajlCS29KektKTGVC?=
 =?utf-8?B?QzBOdm8yZ3RCK0hUK2huWDJJa090MkZHd0xLbFI1RHlZODBlUURKVjV1QzRM?=
 =?utf-8?B?SlptR0YwejRQdVpSZjREdG0vazcvSnRGM3d3YlloaXdIYm5BUXBHV1czc1lp?=
 =?utf-8?B?Y2N3L3k0OXJ1RUxUSmJsU0ZBbEhZQWd1VjlZKzBGWENOSnVQMWJrQlRjQ1Np?=
 =?utf-8?B?YkFHSkw2cGFkQmFyZFhlOEo3bmY5TXgzYXlvd1hrYlNGSzlLcjlmSHNyVlpu?=
 =?utf-8?B?Y2pOK3htT1VJbUM1YWh0WlZZL1pnZGIwZCtPRUlZeXpNVVpzaVJTUjJKdERM?=
 =?utf-8?B?cm5zeU4ramFMMFBjNlEwd2hFUjZYajdHeHpUOWxxb2FaeVIyL1RmQXNDTW1C?=
 =?utf-8?B?L1hUMkxpckQzNmx1QlBVeExHQTE3NjdtbEZyN0M2OUtpRzhZTkR5ZVlFR21G?=
 =?utf-8?B?RGlUbDBBRURxeU9JallqRE9yc3I4MGx5aXdSa3NlUUhoazZ0Q1RLUXRJaVgy?=
 =?utf-8?B?SGozVjRlYjdWRHVWU1laQ21pcFdaWnFLS2NRV0RJbVFhQnBZT0dkaFJTM2pw?=
 =?utf-8?B?MlF5cmZjb2NNSEowY08rN0h2ZDFkY3dPVnJici94UmFHQ2NBUFkxZS83eUhM?=
 =?utf-8?B?bFBXbVJoNnpEWkV3Qzk2QnRsVjQ3OE91V20zbFZXbHRyRllPRFZWZ2RJWWtL?=
 =?utf-8?B?L2JiZTkycHFLQ3psdVJCazVnSnBacFdkVlFCS0JmUW1jK1hNQlg0N280eDZW?=
 =?utf-8?B?N1RIMFNEM2RFVnJvUGZ2di8rOEQ2ZTdTam1vVVJ2NlNlYXVvVnh4VU90aklJ?=
 =?utf-8?B?U3hpK1ZUWkl5aStoOEt5VS8wc2NHR0hycGRtbmp6bHQzMzVHc3lDSTI3NUxE?=
 =?utf-8?B?ek8yWjcvNFR0MURPNGlOckhYQnk0RjNVb0U3ZEtzYWZIeCtjaU11TlBxTnZp?=
 =?utf-8?B?OXhOMkphakV6bS81WFFEUzhwVnhuM1BMenZ4WmRDV1N6TUhNTEJ0R3pKWFJY?=
 =?utf-8?Q?rfSICx4U1HPLoAoSPnbbep+ObWP6EPa7/+lz/Qo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad855273-f906-471e-77c1-08d98e5f46a7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 15:36:50.8693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1txSfnlVSkAkWxm1hBw2ZAOjyThGTjPyLlXbRGuEF3fNw7VvqY41Y9AW6/7SDfpMSE9SRWcKXyK62Jl75fCBTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3391

It's not clear to me why the tool spotted them now and not before,
but this has got to be a subtle side effect of introducing the tiny
wrapper stubs. Anyway, the "fixes" (perhaps rather workarounds) are
pretty straightforward.

1: adjust some shadow_set_l<N>e() callers
2: adjust 2-level case of SHADOW_FOREACH_L2E()

Jan


