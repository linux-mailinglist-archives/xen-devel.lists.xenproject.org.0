Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8856B55B9DB
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 15:23:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356663.584948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5ohl-00035p-9z; Mon, 27 Jun 2022 13:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356663.584948; Mon, 27 Jun 2022 13:23:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5ohl-00032d-6R; Mon, 27 Jun 2022 13:23:05 +0000
Received: by outflank-mailman (input) for mailman id 356663;
 Mon, 27 Jun 2022 13:23:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o5ohj-0002yI-AK
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 13:23:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42d038fd-f61c-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 15:22:58 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0402MB2748.eurprd04.prod.outlook.com (2603:10a6:3:e2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 13:22:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 13:22:59 +0000
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
X-Inumbo-ID: 42d038fd-f61c-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hOnC3hAjv0zorHbvy/ZQeD9GhIDvVaqIJ8Dv87tmiVKKsAyIXvritv15r2TwL9v/x/0gGM81GX1zG9Kqxx/XobMgt+c4Jiye3vaDI/NKLRjIattt6ZYgA5LQnNE9HZ7aLRMEHHLgfjnIGmaYLNIzXqsA9w8xAqN/rCM/pISEb4WZtzI381i3LHALSUinuW5RBuurqzug/pHCIf5+ciIwQmj76Pppy6sAshzPquW2xuqNyhn9Z0RchvHmD5w8/LgJZILJK07SL0XEbrvgazNNHYWAXGF1rRjmCLir8rJCnge4TwCMpoXKaYr0PockQj/NiLUS/wG1ozNiW/y6qdvvtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ezhv0zzQ1+MrV7DdGElOA2lWszu1wIz+Y/fSWeyX8M=;
 b=NEpk0y9tVoFpXXhmwQgwynptaETZdxOEeuj/f3EItjDn/3U/pY9IA7a40BsvsB1D9AH06Tw4X3ngYuhM4tMMGg8BP7zUt0JHwmFsBqX/y8AQkroXtADm7NW6g8UKo009SQFzHIwH0/5emdpYZhnyOd9ZLookVaVP2MOm0dEvMifE1h4hbqozu4jOG17Ma8+pG3QI4FcYtmwwDezy5wph2SzeGdoYBohGmXw8Xxp01BNFvuxdtESN481UnA3FQnHa7AUTsgbOtnKlC2VWSIVTo7MAW3n/tm9Pm6Pb+8nBPVION3KWd82YksujPu8zQngt8xey47NZoNCMbviRh1B8rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ezhv0zzQ1+MrV7DdGElOA2lWszu1wIz+Y/fSWeyX8M=;
 b=CEtoVgHPlbWF3ouWYYd34JYMYLGWw8cT/oZDExhc47sacEmL5vSD5zY1SsCHDMnVDeIaUCMH6DxSwkC+UNrjxeomYejd3doLUL0/SJ/zDNdVFrT2ObZNOpuOmrmpsM+6yE1i6zSV6HNuz3sEpc2nNE+4j/KRgjQY3olXsm/Kd/Y84EXS2KE/FKsIdrJb1JnnlaFRB66OiFJKB+d9+i+MUUT586LAWQ6sPB3BRedXWNsmUS4ssjVtFIiBjYqKVxdCa0aU9BXyXtSY+AreVdf8RuDAwtEMQiPT5ZX7Smw0uaaxv/yAVAgVYAkoxFVT6Gq7l18s4U4UCTJ9iJEaAWbovQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8595526d-9af9-c892-814f-e7002cc68f6e@suse.com>
Date: Mon, 27 Jun 2022 15:22:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/7] xen/common: Use unsigned int instead of plain
 unsigned
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <20220627131543.410971-1-michal.orzel@arm.com>
 <20220627131543.410971-4-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220627131543.410971-4-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0153.eurprd04.prod.outlook.com
 (2603:10a6:20b:48a::27) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 354cd993-3395-424d-ca61-08da584027dd
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2748:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EqwCB1cWHZMCbquKF9HH59F3+wTzW/Rh5ReyJGEGA13iqg6lVKX/u8cHDLkdkZ18eg9ZH3F+8uWnA4mZybSNINO/tXFbPuO985YY4c2RDuHGtjaCAsAflTaIweaNbmECkcV76w8y9Y6wQlPXx75NxzNi0mXwsQ+0t+g2LT4627EVTT53heWp/EAnz0Pw+0mfBnh86PdB00+FgrDTio5xM27QBiuUNKgU5dDnbsm9c0291Ip5rwh4TTwqM0FwnDDHkVvqoBdWNLevJu13mO6CAQ4F9BinYRNufaOADNLzLOA0qY8tZjbV8D3GNCT4o6BPJXnzba/DI0xtjYR5zsfgBtTGQv+E1FKPCRWyEkkAfqM/nZXPvYyVUHeOjpX3vjTpf3yWRBjacHcOoMzuKJ0BWQiVD8ZzaXp7lGBxIAKv2Pn0kQKKnwiXjfaCZJQ5MvZCCudZdnaHxE1QJFrYYWEIZ8ubW0bDXqTlNyba2DyrFTJOBj3w9785ba18zIdsZDUghdQVXgTBjhC4KdFJf95x2LAnd1WSWBnsZNTuyq/7sRNuTUi4vIvT6I2h1lKjnWdoT8Y6vIbFLGIHw6Q4gXSEyWghdrcAuEN8POjXSA6JOcv/IHMzd2o9E5m1qLN3ouQGTjyH1efX0Qk5tIT4Uh7A31sW4hLzKGUM5EdO2kT8+/KM/7H6QCJqGPW/6zXQXonz+Fjfb3xdm/VXBpe+Ik59auaM3zxhxcAWDO698qJEbpPytrJGEKer+MY3SsiOMroVRgUwq91WT8QPU/MKUctrpyVoODiQMeK0iLpQxTpAz9nlmgHekT/8jD5+mWG3/DKn1QIDT/cBldPxCJJaisEm+w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(136003)(376002)(396003)(346002)(26005)(31696002)(6486002)(8676002)(186003)(558084003)(54906003)(6916009)(4326008)(478600001)(6512007)(66476007)(86362001)(316002)(5660300002)(6506007)(53546011)(41300700001)(31686004)(2906002)(36756003)(66946007)(8936002)(66556008)(2616005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmZlQ3NjWlhqc2VlTnJaejNYS2Y5THBkUXJjSjFxR0xKZ1lmT0wzMnRCRGFk?=
 =?utf-8?B?SHIvZDdjM2tJbktTUVNNVlVYYlEwaW15eUtKbDdKY1pYWDFoWkZGSUtDaWdD?=
 =?utf-8?B?dy9qb1RzT2x1Qm05ZEVGTlZJQW9jTmZBWnJPOFhuSFp3czZ2OWg5TzNySy9G?=
 =?utf-8?B?MlpWSjhUdGZiM3hUMUdNZjg1TlkxNEtRTStvUmJBVHlPY1J4eGVaNnZ6eDlE?=
 =?utf-8?B?UTZQVE1KMnJKL1pON0RZeWVDcVU0aVNGWXNqeXp0cGxDSE5VLzJPK0pIakdC?=
 =?utf-8?B?YTRDY3dlRnlZTnJIQnMvaUpkWGluVm1kZFhCVUFlYmo5N3Ywa0YxQTZFWnZH?=
 =?utf-8?B?OEFEY1ljeFRFU1BXRktIcktLY2ROMk1aVHBhejlYSlM1VURSYWdrT1czaEwx?=
 =?utf-8?B?REdyc0VRa25wK0dicmViUjhONGhZR1FVZDR6ZFJYVXJQYkl0OS82SFRpZUYr?=
 =?utf-8?B?QVgzRGZvZ1NIcWFRbEd0R1BXb0I4VitpZkwzR3hUODlWMXB6d0NmbzZJVVdB?=
 =?utf-8?B?bEhxelU5UmJaNEJhN2NyLzk2NUNQS3FrS3JvOUtDYkF6L3NFUVQzblBWNHZp?=
 =?utf-8?B?czFIMWhsRHBJY0ppajhQTXRXM0w0NmJEN2ViRTYwOTN2NjR2dGZDZ2hDK3Np?=
 =?utf-8?B?THd4YmNrR1krNnQ4TkVxV0FvSFlsSGtMS1ZSNlpmRG5FSE9qS20vV2hoQXNk?=
 =?utf-8?B?TEtVMnlkck9QZSsvTjlsVEtyOG4yMWJJOXl1MVAzaExFUloxRVpFOGEwNDdT?=
 =?utf-8?B?V1ZzZmpPV041c0N2N3Z4eklpbm94eGVQRlRKYVRmeTk3SGtvUlpZK3Q2eUtM?=
 =?utf-8?B?YW1wMFIrdkQ2c0ZQOTFodjYydnQ0amRwdW9hVGVVODg4YjUyQXJ0OG1BSVF3?=
 =?utf-8?B?ZkdnNW15YVJDTUd0QS9tbzY2WEpvT3Y1Mkc5V2hBdEh0WDRyVGdwYjczTlY5?=
 =?utf-8?B?VWN4NGFXNkJvZVhabVd2RkZXTVlrb3prNVprdVJGQTJuV2tpVTVOTy9PR0dM?=
 =?utf-8?B?Z0FFeUZyM0I3WUovSG5mdmFhV3FBTEVMdUdXejNwZTdjaTRkbG1TQkpSV1kr?=
 =?utf-8?B?VjgrRkRocC9JSXpFdDFvYy9YVHFBVXJpU2dhL1RjbUpqMnNNZCtqKzd3dkY0?=
 =?utf-8?B?V0tGZVd2ck5iRHNib3dEWi9WdVV6TUVxUFozNkdaRWN3N29aUmtKTmNSZTNP?=
 =?utf-8?B?cXFvWHdlcVFtVi9oTEU4aTZhOGlFcmQwQ2V6Q3M4RjZZTWpBWG1HYmpzUTh0?=
 =?utf-8?B?UnBqd25HQVFZY0tlU0pHSHhhdGJVZzRjSSsvaWo4aHJXWDhwMTdHT1IxanAw?=
 =?utf-8?B?SnlYS2lETmRuU2FHdVZac2U3RkVQSE1BWjRLcno4TktaQU9ISFJpb0RzVnB0?=
 =?utf-8?B?VUtjQWlQYlNLb084L25SUVJPU0V6Zm5mTW9IYkxHbSs0TlFIZkc3L3RUdE1D?=
 =?utf-8?B?ZjVSck90eWp0c3hMREsrWWdLN3FMdHFzU0NsRjdyRGV6QnFZcFNJZmNxTVVP?=
 =?utf-8?B?Y1h3SzJOdkNnVit2N2dsT0dJSENRRGVEVGdidDFVcmI1cGN5bW9zOHlzNzBo?=
 =?utf-8?B?U3l4SGtWVkprNDgrZHRTWFBuSkFYVSt6dWF6NzJuUTZSWlMxZWdWSEl0R05o?=
 =?utf-8?B?UEoySk00KzM4YUVKRVdOZjR0ZEI4Q01IRFFwTnlMay9iOFU4Q2NsREsxRlJ5?=
 =?utf-8?B?eUJVb2EzQk1ERXBId3l3N3BSc093QTAwc3J3VUJmdDJidjd4WXlaanpseUsy?=
 =?utf-8?B?TXV5ek5sZGd3RE9mZVZ4N3ZCM2k4NHM3QTZ6cTgyRUR2Q0VpZnFpQ3FOV016?=
 =?utf-8?B?TUN4citiZE5mZXZ4aXRDM0dUWVE1NUxnWmpkME5NV2l3NU0rM3hmcUFoczZY?=
 =?utf-8?B?cjlEd1RsblUwTW1pV2hnUUZiTzFjUHcrelg2bk5VT0NqdjA1bHlRdWw0ZVhY?=
 =?utf-8?B?NEVwdk1IbnlYdVA1OW9ITTk5N3lvNmJtSUlBZDhMNTJwNjFzYXdrTGJEbHdL?=
 =?utf-8?B?Tm5CQUh4Z25sakdXZzB6a05VcWhHemg3TVQyTkNHemNBN1AxUkpFcmM0M0RU?=
 =?utf-8?B?emdwQ2c3Rm9DWmtOY3pwa1FjV2EycU5Sa0hGTkZpK0pvZGpXOFl3MG5PNy9M?=
 =?utf-8?Q?4YpOjSRGzEOl6VZ/4vnjiZpOe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 354cd993-3395-424d-ca61-08da584027dd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 13:22:59.7750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ZFUMufMq95ABoWGIWn11sG4qvnJRARsn4Q5rTOnKA9ZY2+t2ZN0EbeTqQMsG+D7QOk7j9Mf/KZnUzZlz1M9MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2748

On 27.06.2022 15:15, Michal Orzel wrote:
> This is just for the style and consistency reasons as the former is
> being used more often than the latter.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


