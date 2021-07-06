Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D623BC74B
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 09:34:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150830.278838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0fb4-0007Z7-T4; Tue, 06 Jul 2021 07:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150830.278838; Tue, 06 Jul 2021 07:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0fb4-0007WA-PT; Tue, 06 Jul 2021 07:34:22 +0000
Received: by outflank-mailman (input) for mailman id 150830;
 Tue, 06 Jul 2021 07:34:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0fb3-0007Vx-LZ
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 07:34:21 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 718cc6cf-7822-4a55-b88a-5287332243f8;
 Tue, 06 Jul 2021 07:34:21 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-qcR2Mdp3NaiOvv0S1Ae7vg-1; Tue, 06 Jul 2021 09:34:19 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6301.eurprd04.prod.outlook.com (2603:10a6:803:f1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 6 Jul
 2021 07:34:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 07:34:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P192CA0023.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.31 via Frontend Transport; Tue, 6 Jul 2021 07:34:16 +0000
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
X-Inumbo-ID: 718cc6cf-7822-4a55-b88a-5287332243f8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625556860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rRfkLdqYsqVnmR003T3MYKFXMVasMYCt8NKyWOX106M=;
	b=Oc9JIufa4b20Tg9AMLWVkzlkuP1Vy9iUCEmobJ0W5OCg2PhMWbDz/8vDXAA7FSw4G7ntqj
	HaTjbcnHtugXnkyo1Po8io7Pg2IiYtXIpe8nA/BR+dQzU+FOLb9qQQL/oRxianOfx3jgDD
	ajTudfJFjY7mH+hIfVy+N3IBZYV0/dI=
X-MC-Unique: qcR2Mdp3NaiOvv0S1Ae7vg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0BxCUBGNxFmFBGIn150axfie7jYN3A3+fJ5GQsN8PI69YJ6xbk1Umre4coenNGY2vg3X1lX5IaPBAF//wtkg0nHZ8qR0D1SXfsodHTJtvvIMORna1bYwjgp5rE++BbcSLQVDTGpOqkgdQ5gZNP24o7LFgZ8v1BrFjMZxU3x9i76LHJmbdjp7Zw8GP6vOZv7AICNt927rmF6SXgYCTDZ4NPN0kdXny4rpIKfqqSeV/quCVzZekA0SgyWJ2+FQPifT+BBPgTzBcyTNZkCJrQsQbdzlmbfNas/gK0UtKTmMod5NmLP1h1i8uuEM0cpARLZms9of9uzA1b9mEqH8flVGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRfkLdqYsqVnmR003T3MYKFXMVasMYCt8NKyWOX106M=;
 b=FTiUI1DO74bcuFRqav2MYdhl4B40L0YGM8RLed8PmLhKY/IIvFl+SaJxgfDcC0VOXHWe9om2ERFPksVVLOjNqfXiLzmr5VR32SE97TaDyq0YuWIkK7qM8HfXwv6nj8pI/ijdJHdnaI5JM/QGxN1RUzGbYq5EbDaBqNs4cDbE46JbE+3posLl42qaJHfdS1Ftavb6oWycN4yVqUaXSBlWAGuwxsT/uBTQMyzaSa1464r3y5b5yxE1mLQoffMjhxlMchGoC32d4QoO/hYgAj6t9DaIwh5/1FYYzpxpNTyvfZ3gpTMJdmD9ovTKF+e+nEyxtWJ5yAAdfM/L/6XBWRfpHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Ping: [PATCH 0/2] x86/mem-sharing: a fix and some cleanup
From: Jan Beulich <jbeulich@suse.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <dea13187-04ce-9c1d-aa5c-e2cd0a7d42d9@suse.com>
Message-ID: <c0c9705e-50a3-b5e2-469f-c96ef5f281ea@suse.com>
Date: Tue, 6 Jul 2021 09:34:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <dea13187-04ce-9c1d-aa5c-e2cd0a7d42d9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P192CA0023.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c6d4c44-2517-4bf0-f3cd-08d9405075ef
X-MS-TrafficTypeDiagnostic: VI1PR04MB6301:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6301983C68704613769521D6B31B9@VI1PR04MB6301.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FvlCTkh7yPQ7WmtWrGO84/LGUXFuXI3k+l9AFuG5n/GQEtl7EAYELAUBnsQJ3u8+gv0E/obR4WTYLqYeAQauVcg4GWupp/l+jm701wSh3FE55nEquqysrxYI2Xn5cIP6vWErUHMSLHOdCnGbq6ixf2PaFsR0460+VglOxrLYSBhgiRCiVl3PM2/4eRjUrx7f3sEPRIzFvj0Q/NUNUREHIxj3NqC5x1UiDbngfROVeOEQmrO6W9Qbc86UP7Chqlf+p/ZXp15QTJ0oXfryt/643UN1FdKZnNg4CmiCLPBuSyxzsW58T1Yrxr3i/RJCMq3+4gQId6DHrfPj9otxGenVoPv/ZD3KhUqU1UF0AeweQotkzkcidBSqcBeUuOIfn50l8fnyWzxiurGIn0cBkgt8WAtn+HC/+YewjkS6hKKLriIMM9xM7qfhRAdj5IMxvbd98nmJ95GKG8kWWrH8om/kDH+1dKjbMjAJCkQ8tup/18tr4XMC2Vj7qJLXQh9rDb0yRyJgaQZO0hQAsJmPndTa5G/CXwBKqFvbFboSWdrJcYsmYCirmyWWav/XjORZWV1ILoZFOqCWJKHLCE45+Th7itCkZefOQByxVs/ffrCNuuIWl5PKcNBayY1sQAL+5pvivX3YLGv5hVtNIOK2S5Ttu6mBBLrv9OMIOZzXHtdvgI7VkJhVC+zcvubTU6++zR7YCFqKLucQC9QDEML2T59n+83ZKs+SpT//CCVxMwF6kxc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(136003)(366004)(346002)(396003)(86362001)(31686004)(31696002)(83380400001)(26005)(2616005)(16576012)(6486002)(36756003)(4326008)(4744005)(8676002)(16526019)(8936002)(5660300002)(478600001)(66476007)(186003)(54906003)(53546011)(6916009)(956004)(38100700002)(66556008)(66946007)(2906002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUViUmlxWWp1N1hLNWxuaWc1d2lmMmIrNnd2MDN4ZU1CSnQvNzM4dHN5ZUk5?=
 =?utf-8?B?VjE2SGI2TWhXbXhMWEVGSVVldG5jN1lMKzF3eTRKNm9sTnQ5cW5MYmtCVnJx?=
 =?utf-8?B?eTdoUDdGcnROSnN0NHNuNVVPYndLK3RlblJ0ZEN4SG8zWmZNN1J4dU1WSXY3?=
 =?utf-8?B?d1FyQUMvdCthVGh6VDM4bHN3UC85MkErTnpKZ05BWkRLMHcybHVNbHg5NWo3?=
 =?utf-8?B?Qnl4VmlSVnhDY01CVWVlc1RqYVc2a0diRmNYYzUvYkxjSk5qcUJudksxaFZZ?=
 =?utf-8?B?S0d5UVZPZm9lOFpBWGlmeFZsWm00Y2d0NEN2SUtDM0M3Zks2WU5FZGhLYy91?=
 =?utf-8?B?MmNpbVZuK0wrZ3MzTmp4alA5RXBHUm5SckNORXVlQ3pGL08rYnRzOGdsOHRS?=
 =?utf-8?B?L0YyZ2FjQlRmbmZxa1dYUnIrb3ZEOERPdSt3UHlKK3ZJczVweUMrb0JHZmRJ?=
 =?utf-8?B?RklmdzF2NUUzTHJMVEI1WHg1cUFwQ2tIbHZvaVNvakVqYUswN29FTFNMaWw4?=
 =?utf-8?B?dzlLZnlOQ1Q5MDdNaWRPV0cvdVBuMDF0UHpYRis2Z2Q4L1lkTjh0bDZjUWRT?=
 =?utf-8?B?MUVDNFpuV3Fscm1RMWlkdklBTGtidkNrQ0FuY1N4UU1zUkFCc3l0dGc1YUJD?=
 =?utf-8?B?K1JBaGtxbFVXL1VCaE1ubE1CYi9VSjZsSTRxb1VnVU5sa2dFUU9VWVhWYjlC?=
 =?utf-8?B?WE1HNVhJaVVtOG41WjhoTTNKY1Z0dnBLZjI4dmVmcXJCZTNoWnhjRWhVdXMy?=
 =?utf-8?B?RlZPTFdRanRhRVRENzFtdEJCVlROaXBtdWhqQzR5QW9ML0MzdjRWeU41TjZ5?=
 =?utf-8?B?VGV2cDZGSHZuN0dUVHU2eGwzR2tvd0dySFIyaUIxODJCL0QrS28rZ2dxbHkr?=
 =?utf-8?B?czFReHlFb0ZRazY0UE5EVzNVeTRnR0s0dmlockJxMHFPbExJNVFwY2d3TVFp?=
 =?utf-8?B?Tmh2RGUwNUs3cXMzUmhSUmtEcDNuVVBYL0c1a2t6OERwZHAzT3A0YWNvRDBE?=
 =?utf-8?B?WE54aVhBdEx1TUpUeUt1WHB0RXVVMlV1ekZJK05QTUhFdEtQUUxlV0NnNUtE?=
 =?utf-8?B?SDl1N1dyQTlycDRXcStGNmlqejIwNUFQaWV1cXNlV3ZRTDZDOXRFUTM2Vmhl?=
 =?utf-8?B?NjBFc0RGbzh4NDhXVjhGK20rOUx0WUdaTVNvbm53ODk3aTlLaXBqRHJ2eHkx?=
 =?utf-8?B?L3RIVkVzTmdRNk01WEhKTFRtdGpydEdXNlVTK2hDQWE1TXJGRWUzUGhhak1P?=
 =?utf-8?B?dGdBL29HQkI2UlNrYzVDNEhsNWhqVXdqcHlBTnhvOEZIREJjRDMxSHBIU21E?=
 =?utf-8?B?aXJsdlZEZ2xvKzZlVi9JVE9Yd0V2bDlFdVhqd0gyZlhzYXRzcngwSFNZeXc2?=
 =?utf-8?B?ei84NDhZWFBVWnJXNXl6VTRJZ3lzQ204T25tbGtKMzhVWGlNVTFZUm5BWmRr?=
 =?utf-8?B?bmtncHJ1MU95Y2tRekNTSVdqc1lzVytTeE1tRWFVbjVTVXpkWGFLa0c0U0ZY?=
 =?utf-8?B?NWFackpsOTlYMXNSczdDRit3MUxpRXlEVXNjZkI3eGtUL0Z4RGJqVGZ3bVRT?=
 =?utf-8?B?a3Z3b1NWdzRhNW53SjNxOVZCU09RaGJmOC9NNy9HalVvYzNwMDdTQ010d1V0?=
 =?utf-8?B?WSt4WWduQmJJRytpNGxnL2JHQldXdE9pRTlPenFzcCtTOFZhWmtIL0NyUmF2?=
 =?utf-8?B?bTdvVnpDc2FXNHBnUU1MUFA3OC9VVlQxeWhYK05LeVUyd0dVQ0IxMXd1Z2or?=
 =?utf-8?Q?kYd3iwsTYZv0W3ynLx1ZNkaWu3lrifjPAEjyQDK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6d4c44-2517-4bf0-f3cd-08d9405075ef
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 07:34:17.2095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ptY9KT0qop7/8bs9LkyvUqFKLhfhKN59/PHiF530Q9vdvald2uvt37WSc1tZTs8L86UGKJeFzcvkbmCMIjBG3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6301

Tamas,

On 29.06.2021 14:53, Jan Beulich wrote:
> 1: guarantee consistent lock order in get_two_gfns()
> 2: mov {get,put}_two_gfns()

while purely from a code placement perspective you may not be the
primary maintainer of this code until the movement in patch 2, it
exists solely for mem-sharing purposes (which is also why I'm
moving it in patch 2), so I'd appreciate you taking a look.

Thanks, Jan


