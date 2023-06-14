Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E33FE72F739
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 10:01:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548562.856531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9LQt-0005pK-UV; Wed, 14 Jun 2023 08:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548562.856531; Wed, 14 Jun 2023 08:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9LQt-0005nf-RH; Wed, 14 Jun 2023 08:00:47 +0000
Received: by outflank-mailman (input) for mailman id 548562;
 Wed, 14 Jun 2023 08:00:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9LQs-0005nW-7z
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 08:00:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90bca323-0a89-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 10:00:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8314.eurprd04.prod.outlook.com (2603:10a6:10:249::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 08:00:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Wed, 14 Jun 2023
 08:00:43 +0000
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
X-Inumbo-ID: 90bca323-0a89-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XnOEPB1RVFKJ1OFIrH/UnpQ6lSvZBcunoGrRESm9REBfMUWJnbtAzlUodmlg2NuuXaaSyZLPPXl52k1O2Zt9R3NsFcBP3P2Cw4rYv7T/j9qPS3ADvi0o6Gsvhvxr0iMlv6Maaq8WRXdz0qRt/d0uCQfGb6f+pseKay14pFJcUYa5lKmA7OU78eO4yhPqeq+wLYr6cla4sp9iIOEYdztyOYoJfHfactKd/eiHL583Q5GQ3ZJPUQqDRf4cktKDuFULemLi3RoeltIr5K0rBkEvcD2NUZS91JlDGErYp9dvMYlktuLBBZ5ztxzNpTVr19CvUYtD49jW1i5UrcCY9SK3nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yu8PGPc8GqK6hukTftBRFWre3GGRFVbt0d9DC/hfPuY=;
 b=Iy8BCpiNSROzOf+PIbUQhdMczWhrIEuCVGnUUqiuWC1auqslasPqxnQiq15CImTY+9/WbPcKLzZ+baQx3Kee1+z8jdC68I3/vjSCJ+1aVAFi3w57xeu2ey3ffKqqqTZLDm73gUSeuu9iFufaPtglVQxrVZVItMsGpNVBrxpfoKfAHx+r3CO3JQbSzDV/GW2GIdDM+F95iMGoqWwtvPsN0o4BuX4N3rNbuDe8VDjZTBBYbj0DWDUAfYxFpvMYEsTT+DzD8QpyJlIbRFWuamkN/DyWl1oIXKPtZIZ/wA3q5LW/4RzZcAULjvQqUmbVt0vBBJvoZQnIZn1YZ8/RYdHHEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yu8PGPc8GqK6hukTftBRFWre3GGRFVbt0d9DC/hfPuY=;
 b=N0zQIyziD4hr7MyD+kefk+muEvKgEqg7Tu2k7GAynYBCoJag3P/wqYZ5GuSwDZFdLeDpft8+YNlcK0wG0xrwDlrTehzBV3hWaBasQbNGfOC0JsWw/wvNEqouz5/1hCNIFP2X5Yot4hk9XuhDnOwC98xijT71J6qHjGKWirqJhWMJq+v3Dej3TQjTbxmmd6PVS7SyvBPOSrUx6yNPlvKsAFK5+AYBk4u+H8BClQeJ2BwvDI40rVS3nje1Ljlfwm6PGbIBBbUT/+NEZM/bxgkCESMcMScfcgylOBQLnKsTXpzToxWc4Zy6M0c+5Iw19OqgZG/ixZcwH5OP741HRTyrtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5f53088d-5561-0750-e0a8-ca8fbd0a00f8@suse.com>
Date: Wed, 14 Jun 2023 10:00:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] xen: Append a newline character to panic() where missing
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230614073018.21303-1-michal.orzel@amd.com>
 <6D17A0C9-1B69-42F8-88E9-E2E026C57CA3@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6D17A0C9-1B69-42F8-88E9-E2E026C57CA3@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8314:EE_
X-MS-Office365-Filtering-Correlation-Id: 67caf272-4b8a-4020-3d0a-08db6cad73a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KwjNGV8iT/C/RvvSO6Az1hmNpZcEA4A7ccUTPES7nWXLQr/QZSVdCEXi8utzEBR48XUHtBEl/fKC1KJur+5wPbCdBsNVZKISpe/a8ql8tjdUR8mPPrvGn/cBZVop8MaBMKl94hyV/5JEVaMop3lP+Kx7eFgp2yJOQ3Qtojr+xA14DiwDFdhbUxFDcmwku2IyTyEKEofBAkYojwnkIHw/iouRMzyYSuxewuSzftfnnd6RDQ4ybUYU2w5h1mWfUyUYxGONMyxQ+8HOHZ6xRN6ZgtSufnNjfE0GfbqiipiB2QpTBEEmTLGIH72OkPwnXwYFSHo0O6FD1KPcx7/00Zafi2ut2dyrFwWvqwYuUQt3XGWa93ht7hVJhCpnnsIj3sZbI5+r80P0MEjfflarVVK8YFZk7AABzRJKc2q8j8dpgXJzrsrR6vswcvaMXPhu1n+erAd0uWbrAXIu018gwkkvmLOns3yn+ojuIUCMBrOtX9YSMv/+vXtTv4vZ3ZCEmduSt7PVThI6ZV6DhlmH6ksSalymR9hZbFy5kT2PUdx6S4eZTMcHCtUTHbDtl+oCRnkdA94xFkE6MRJ/aVC1QQpwWrR7j+aSH2DDbI2zHmr/1ehzkMWes4PT6MamY5nGK40tOOdiXCXoS8LhK15L/jJeIQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(396003)(366004)(39860400002)(346002)(451199021)(186003)(38100700002)(2906002)(4744005)(31696002)(86362001)(7416002)(53546011)(6512007)(6506007)(26005)(2616005)(36756003)(316002)(6486002)(4326008)(66556008)(66476007)(66946007)(478600001)(41300700001)(54906003)(5660300002)(110136005)(8676002)(8936002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RStaTWN0TVNmOG8xTHFwZDdPeXhhcHhCTG92UFcyRUJOd21ORk1jTTZndFdC?=
 =?utf-8?B?TGpIWmltM2RzYzhGZ2E5QTVPV2VTcXZSbXRSSUtBMTkyS2xoUUdmMCtTdmhM?=
 =?utf-8?B?MTlUcWJkMXRxWU5wbHNqb3VIelJIa3BRREVYanJVN1MvWkU0NEFWVkM4LzZp?=
 =?utf-8?B?R1VZSUpWUDdDWVV6WHkwUU5kQ0UybzRVRTFjNVVyVkVIZC9ZcHowajZGTXd4?=
 =?utf-8?B?UEE0WGJpb3UrSkZYdktYZU1oc0s2WEtmZ2kxSE4zWVIwUm9jVmZnMEZwNjZE?=
 =?utf-8?B?NlRPWFVhR0tjNndTVk1JOHdGR3NqczZYbEpBNjJsWjM1WDJudlJTbkZqVnE0?=
 =?utf-8?B?b1p5MGw2L2sra3JiZTFDVHZ4b0Y2VEs1Q3pRSDRTaXIydlloS2hkR2s3eVNi?=
 =?utf-8?B?dkU1V1p0Rzd5NEduc0ptUzlydXZMT3c3cUEweHE3ei9UV253bUFXUmlHc3Ru?=
 =?utf-8?B?ZHFCaWlpUGdrUmJjZFhVQzI0RHU0NHArRWxkS3B0aGdZNVVzV3gvU3Ztc1FI?=
 =?utf-8?B?L2MycHA3QUd1ZjFCMDUyZGhRT3hYUkZxN2QyMWxnaXBZNTJOMFdPaE8zekNv?=
 =?utf-8?B?NkFIamNydU9rLzNXOExMV3psdFVHTXlBSkNWTkVZcHk0VXBHemp4NVg1aWI5?=
 =?utf-8?B?Q1k2RU5CbkVQTnVub0pQNkY0NERnOTVnYys4N3Y5VUYxM016UWtLamxBTUU2?=
 =?utf-8?B?aXovcU43UE0rY0RnK0FNbTArTnhHNjlJRm5yQUppQkt3V2h3N0dSTEl4WjI4?=
 =?utf-8?B?Ym1OZXRScFpIT1V2VFhwU282SmRoNk9zYmVCYlcwMElBbmRBd2dFaEZZaUdX?=
 =?utf-8?B?UGdtRFlCOHFZRU1UQUFRU0lLYlcwWnBsZ0tHZzhrNStrN0RkMEZHdERKdHFr?=
 =?utf-8?B?TUxvUURmT1h1ME9JL1FhZ010Y1BNa3luS1p0OHVKYlc5RVViYlUrZm4rY2xV?=
 =?utf-8?B?UExUcnVxV0tCMVJlbnQ3enEzMDFQQjUveFZkVGdaUXE2Y2xIRFl4MlJleGtZ?=
 =?utf-8?B?ZjZxVVI3U0draW82ZXFjUjV6empjcTJZblVNTjZRYUhQbUhJc0ErM0JIV3pt?=
 =?utf-8?B?elE4Z240bDh0TWFkVDNyL1QxcXp4bE9reTRmalFMQyttemxvWVJ6V0E2aXkz?=
 =?utf-8?B?eVN0c0V1cTYyczhuTDBFSUNENTFuc0RrNnUzczl1SS8zenpTYVZTN01tMExO?=
 =?utf-8?B?ak15TUY3cUdvQmpQSitRTXpyU3lwYmlpbWtuRUNmZmIvT0tSSTI4anNqWktE?=
 =?utf-8?B?NHhYYUJJdUNQYlNFLy9hUDVVY0NjdHhRYU01QzZFQmdjeUhOamh3ZlVVWUNx?=
 =?utf-8?B?Y0dQcitibWJKcEJqV1QxNERSZis2b29ONzYvcUw2YnAvM2R2ZlBDV3FwcEVh?=
 =?utf-8?B?UUpDR2RjcEtsSzhteUVhZjhrZ2NXODZYWHRydENDNEw1VGZIMDBZNXNIbW5Z?=
 =?utf-8?B?b2toMWdHTVFTTWZwTmR4NTllNGNmamczUnh2ZDVYYTlQTGo3dHUwVFVSbkhO?=
 =?utf-8?B?b3AwVW1JdXp4eVVlMlY4VnNmWmdiVGYyTnNhZk5ZMnRkdk9BTTAyVFp3dnZV?=
 =?utf-8?B?S2EyTUlzWkMzZklwM2lYQUFSb1M2d2ptUlBjRkJUNW81Yzc2enpTR2VMOEN3?=
 =?utf-8?B?bFJ6Q0FNcG1MWUxBblFxZWtnQzdlSWxPeXEzMjdmdEtsckN3ZUZoRkxib0ZG?=
 =?utf-8?B?anNoOHJmeGZWamVrRGlHN0FWbFI2WkpXSzN0aXhvWkNEQjdtWnl2Z21uWVdQ?=
 =?utf-8?B?SzJFQytZQ3N2Wkg3V1NuR3h2WmQ4NGdXWXMxZ3R3bU5MM1Zoc0NPcWtPZitF?=
 =?utf-8?B?QUtFZW0zRnAzUFJEYU1RYitmL21EUHdEU3pxN3JMZVVVejlsZmZKVlE3OXRI?=
 =?utf-8?B?ajJ6bVZkdVVYRitOcXZ1UXZ2THlVSWNaZ3Q5aDdaWGFZUkdPb3B0TkcxWjNa?=
 =?utf-8?B?U3ZiWFMzb3hrbzRZalFTcmRjV2RPZFVwVlhXZ1dXMXM2aW1SeUptRjNLV1JE?=
 =?utf-8?B?eU9Jek5zdkFvTllHSUU1REF1WE92cklUL0NncUdhU01DQzJHMkJVT1pXL3JI?=
 =?utf-8?B?YmtXZ0NBNi9LTWdCbnNEVjZXRXM0Zko0RDAvRGhjOGNLaSsrV25zV0xtMW1K?=
 =?utf-8?Q?sC98NG9Gw28ylhsu8stN0kOmH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67caf272-4b8a-4020-3d0a-08db6cad73a2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 08:00:42.9374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /mMDbaCaq7FCItJAAe+H7VRa34nObdU6PAe8g235OpLgOPbetPSvsqcknabAeAwVBO8QPTILVuI0gQfgkFGfUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8314

On 14.06.2023 09:45, Luca Fancellu wrote:
>> On 14 Jun 2023, at 08:30, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Missing newline is inconsistent with the rest of the callers, since
>> panic() expects it.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



