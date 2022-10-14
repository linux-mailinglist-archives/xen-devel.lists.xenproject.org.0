Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D04FA5FF023
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 16:18:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422910.669270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojLVo-0002ad-BY; Fri, 14 Oct 2022 14:18:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422910.669270; Fri, 14 Oct 2022 14:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojLVo-0002XE-8F; Fri, 14 Oct 2022 14:18:08 +0000
Received: by outflank-mailman (input) for mailman id 422910;
 Fri, 14 Oct 2022 14:18:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F+Di=2P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ojLVm-0002Wh-G9
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 14:18:06 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2083.outbound.protection.outlook.com [40.107.21.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04bee5ea-4bcb-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 16:18:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9126.eurprd04.prod.outlook.com (2603:10a6:20b:449::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Fri, 14 Oct
 2022 14:18:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 14:18:03 +0000
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
X-Inumbo-ID: 04bee5ea-4bcb-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXPTAhxxRm7OytTH/jwND1CrIEj9hWRtfLLzjnUs7dbZOj48UNsde/J4fyND8JqrJUMqeGDAAxaVLbtyA8ar64aJH4OCbqKJsMXQ2v+AxlIn4IRPQL3bwmOTEx+PokRZxMC0d4G0inlKh1ZhkaUtm3EtugcTNVqPvwGqUeyYnlYz+Rh7cRy7J0X0cALqzaFv87LmEq5ubjdG2hhBbkqyW2GUH8HqneVLxdiG5BRaH+T7zFR/UU809O0ANpJaeJSnGegzvXozJMd+Ifn7JIx9++66OCCVKIA/M3GSrsBgOLTWSsOSyfcD+J+/1BB4mAWBCfbHud6OPoDjM4IyC2amfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+JBZO2UZ1F3kgYUn6aOyopHji/OhRvLI4eE7O5gQrg=;
 b=C6PkphRHizheNpWIEhb3x4cO4pR+JEGcqE1UIDkQk+KbJiojrVi84xUtSnZpeHsz90piOOeroT58Hg66p0VoAI2KfQ/RWUQvihZBY5kob623V2GHmQZxmvW1+VK9LTnK3uVypflbBv/O1om3Q3FrflYg5/DSy4Je/9OB7+9hUYlmjPWQU9KlMv55baMmePRTTczqP3rxF+8pvd0TTnncc72PKnzQd34E7zmgHJ2IPhLcqDLHUEZRalHCLTxDoftSew4JTJpzem9eLKc8CR/Rm4Zvd4+uuNI5l3k3+PfoEpuiwfOvWiS9oIK6nfROLJWXYH1YqDj61iCo1kgfxgQXYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+JBZO2UZ1F3kgYUn6aOyopHji/OhRvLI4eE7O5gQrg=;
 b=L8AOiEJshJlgilqTJ3PaEhfAUI1P6jGTnJkM0EM7jGDKeTVeYXvZk5i8H0J245J+8jyRkThD8KjxzTqVFIK9kCuC9m38WKUbMC7O2iAu0edrddzNtDcRzrbS5El77HeOVsheoynDKPpbInrhYdO+u2Ivkrs8TlPWFiwNsSbE5714WqiNRG6vvuD2pRtwBdrwPTf5ULt/8hbbZwxxzgeP7RMucOQPxYAqJIpTa859WuA/ogAOtHXdtUyy2rUaZAs3rqs71Hzcpz/uEqcasirOpR0iM8LAFMK/vei3jGgK+ZOQtx2mzjUhTGPp2DwN/SxMYbcYG65Il9pCOJbFGoyO8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b2ed1bc1-a2db-068e-3293-5b449395d844@suse.com>
Date: Fri, 14 Oct 2022 16:18:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH] argo: Fixes to argo_dprintk()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20221014140221.31966-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221014140221.31966-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P250CA0012.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9126:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f58f192-6ea0-4b77-f6b4-08daadeee81f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7wKW+G6PYt0xheIT73CVPHPyZdQ55FUykH0qqKn4g641h0nYssAVrRp/xDvZMjpNkLGtRJgemLaOITn74HQD04NNU5PV2caDMeUthyETNzYO8AD08LIIJeRxQmA87ktsAxuw3JA++ES1KzSIl90qNfJedeTCITOwmZ3tTo4Tps3NNjrJsv/dWvjQ2Hb7qrZ0IYvSkzlzDLRvJyk9JusNxDLUeQEPDVWAKeUwwFlr5yhL8ojySNXNx07W4KFl9S4Rxl8XMBQsE1ycCwEGKRlHiH2rCvGXVm9GxRe8TYFIRE7i6t0J+58hSVvLB2A1G7cVb7coLeinxLlS1wo+G1KAKklDPLF70CIrxXu79Clec3uPBgXUyUpGt8tUgiiPcUntCu6sdaFjTxbd5ofVJ+HIYKyQWnWWXzcPJzcaATpL+44Fwb1EwG2P+P46r2HVDZShp43cRnrWPva+G+y89D2fhrArjon+gBRmp1dMTOT3SD8Cf/4Bx7nBOTWP7JNQtgnIddwNk83mqjon+uWMD2RzzEFVALPLXmFzJCyvUPm9+ebAOcMEWvMrKFWAfd0awssPlzqdaNH+oJChTme4aV9fAIouiSj23L7xz79EvZ52b/ii4GJuH8AW7thV3Ks4GuZwlMruCa3M4CiT1be/k/D5Yat8zUwQjsCLliNtQk6MklC/kf2ojxH3D91Ix49p0D2ZLhMUm6sOaJYsunZDjZ6f2ekp2sGcgqQa7MnAzHfHxsgz29ctN6Vat1IaG/0FIGU8GN2/xILl1ZDR/2kXikWhQb7aFSG0tZ7OS0qVJGWGsCc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(366004)(136003)(39860400002)(376002)(451199015)(8936002)(54906003)(316002)(6916009)(66946007)(2906002)(38100700002)(4326008)(41300700001)(66476007)(66556008)(4744005)(8676002)(5660300002)(26005)(186003)(6506007)(6512007)(53546011)(83380400001)(478600001)(2616005)(6486002)(31686004)(86362001)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDNUT0JJT2ZmMHo0RWYxdUVJNk85Ri95bExjMHhuVW43ZHdBY28xWGRuMHlC?=
 =?utf-8?B?UWg4OHVkU05jbXJaeEdIalh2RVF1S3ErbEVVa1dkdWJDeG1UZ2hmYXNBQ1NF?=
 =?utf-8?B?UXRFcDZLeVluUnQ5OWhzOExDd29LVDIrTTBkdUZkd0s4VVl2cVNMOFVqOW1v?=
 =?utf-8?B?bDNLZzJzUm5PMkxLNS9DZ3hkV3dobG5SRWRiZXZ2VDA4c2NzVFF6aUdoRks4?=
 =?utf-8?B?czE5VkNNSC93aXl4MnVRQjRrV2had2hXK29heHppdXo3WDlEK3NSTHY1Mktq?=
 =?utf-8?B?SUo3d29PMjFlY1JzSUdtZ2NpYVlNaC9TRnVGMjNrbzYvMU1kclNWM1p1eXFK?=
 =?utf-8?B?Q0s5TFF1UUJSamM2TDdGSXpmR1gyQzFBZUI4NkllR21YVldYM1JRMnQ4ZS9z?=
 =?utf-8?B?RDVEa0Z1UUpoTDZkSUJENWVFbXExeG1LdGdsSHB4aEJIeGF6TWtMbmF0VE1M?=
 =?utf-8?B?UzBKOUZzSllNb24yQ3lCTGtqZ2VUcTBvTEJFelZBOGVtM0htOXdXWWkrY1d6?=
 =?utf-8?B?VHQ1aUFRb3lxd2RsL1FSbFA3aXFFa2daSWVpRHR0VkhwK3gwWE5udm9pL2gv?=
 =?utf-8?B?THAzRWVGcHU1QUV3R0FMZUQ1N2lwek4vME1uY2luUjQxQ1NCSEowYSsyQXox?=
 =?utf-8?B?akc3a3VGUWtmeGh1T20vTzBnM2I5VEJWc1REWFdORy9tMytTaVdJYURQRllQ?=
 =?utf-8?B?QUFXWmlrcEdxcllzSUZBazVyOGJFU0s0emk0a3crYXNwcEEyQ2xiY3Y1bm5J?=
 =?utf-8?B?cDZDWnkwZ29JMlJXcFRVZXdrZ3k1Q05lYlJabnpra0ZNOThIVW81bWw1SWlK?=
 =?utf-8?B?OU5vSndyUm5uRC8zdCtiQ2I0dXVsNzhpWkQrRjhmNEdnaktYYmdiQ2F3N1pI?=
 =?utf-8?B?SStmTUF5R0hoNWRtSUxqUmx5R0t5UHVTN3pnY2Jlaks3Ri9BRXNWam4xT1VS?=
 =?utf-8?B?bHhleExtOWY4aTdIL2lmOElwYWU3NE01VGJ6NHE1dVNRbkpEWlViM0FnaExV?=
 =?utf-8?B?by9RNk5BQTkvb2lJZ0txekluRmhiTUlaajZhM0R1K2hrUVNWcnlGeUZ0bjFC?=
 =?utf-8?B?OVdHZHJ0MzVoZEpLSVpZY2VMNm1DZzV0cXM5WjFqVDc4WWE4Ymk5Yk53RUk4?=
 =?utf-8?B?NmQ3clRvdHVNVkFHSU8ySU4zRnA3ZnQ1MkVNd2dpU2ZET0s2cVJOZzk2TkYy?=
 =?utf-8?B?OFJwdHpIWTJyR25URkZRM3R1c3M3VDlvemIwTHpxdTJBdUhFaHltU2tjN3dx?=
 =?utf-8?B?QmhVVG9NaUFVV0U1OGdYTUIrcndlWXUxUSs4YXFhUGhBOHQ0MU9hczhlTDU4?=
 =?utf-8?B?TlNoelM5Y0YrYjkwOGc5dHF3bndZakNVbkxXVm15eWZpT0VjUmZGdG9oSHd5?=
 =?utf-8?B?c3ZZbWYwUWNMbkZscGxlYUV5NzA1d1BIWklCWDNLL2FGd1ZwZzREM0xaMm4z?=
 =?utf-8?B?V1M4OXNyZm9aVjRkZmJ0d1ZJUmtOQ2xCdEJHMGVRaEgyOXBoSENXRHZXQlh2?=
 =?utf-8?B?eDFYenVoSVM4YlpNSXFpdkM0ZnJlbk02MEliYTBwNUxPeGh5ZUtMUENCWnQ3?=
 =?utf-8?B?MFc0R1RiUDlDOGlYSEhxa3dKeS9peWFxcUx6Z2VzcXcvbldsSkF4bE9UYitw?=
 =?utf-8?B?RmppbTJ4a1QyaFVHb3JQYVlVTG42Nmg3cjRVTUVVUFBqUFk1RExXaGw4QjZh?=
 =?utf-8?B?ZjNGV1dTcjllandCenNkR1FTRmU0V2xvN0xOdHJaNG1qZTJvTmt5R3JZWTl5?=
 =?utf-8?B?Y01PcGU1NjBDQWgzL0pSUXFzWEtxZjZFMG5HNmxZK2M1a1JmRFpkc21UQzJW?=
 =?utf-8?B?bVE5UTNsSXYremhxdGZ2T3UybTI0SzdUbFlhZ1RudXF6cWMzZHE5cm5FUkpa?=
 =?utf-8?B?OVlVVzc2WEpXTTVQVGhwWTBOT0pic1pOam1uTm5ESkFnZUV3TFBVRStVRmZS?=
 =?utf-8?B?YU9ZRTFpRk1rVGIrUkxNOUVUanM2ZHE1TTdvck0wT3dhRGFib29ITWY4eVhQ?=
 =?utf-8?B?UmE2VDJjcVArSytwRkZ5OTJBSnZwc0ZzS2NPeDdQek5nNEF0cjE5enB3eG0v?=
 =?utf-8?B?cm9WaXhkVDZscnJRZnpUSHZ1aHMyZWY4MnQ2WkQzYlZGVUdQTWR3U1RlNnkw?=
 =?utf-8?Q?z8wGHmkO+n4emBmU3CWKwLwsn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f58f192-6ea0-4b77-f6b4-08daadeee81f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 14:18:03.6608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /W6OVgWN91mkxJG/bL28aL3CqlseK6kwK9I20L2GIDIpkWpnynTRX9pqT8tiAeqB7oVT1uEkq4i9vsLhlYJ2fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9126

On 14.10.2022 16:02, Andrew Cooper wrote:
> Rewrite argo_dprintk() so printk() format typechecking can always be
> performed.  This also fixes the evaluation of parameters.  Emit the messages
> at XENLOG_DEBUG.

I guess I don't really understand the "fixes the evaluation of parameters"
aspect: What is it that works differently now compared to before? If
ARGO_DEBUG is 0, none of the arguments will be evaluated, just like was
the case already.

Jan

