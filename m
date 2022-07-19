Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBA7579FA0
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 15:29:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370659.602527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDnHy-0003N1-5l; Tue, 19 Jul 2022 13:29:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370659.602527; Tue, 19 Jul 2022 13:29:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDnHy-0003K9-2k; Tue, 19 Jul 2022 13:29:26 +0000
Received: by outflank-mailman (input) for mailman id 370659;
 Tue, 19 Jul 2022 13:29:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UBo5=XY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDnHw-0003Jz-TM
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 13:29:24 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50074.outbound.protection.outlook.com [40.107.5.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cda395bf-0766-11ed-bd2d-47488cf2e6aa;
 Tue, 19 Jul 2022 15:29:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 13:29:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 13:29:22 +0000
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
X-Inumbo-ID: cda395bf-0766-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PH9FdB8I2D7Cp1zuz7nL1aGjgDpoU3Xo4h5QvD5cKudW5NGNOl0aF4IXbKTWOWSdpeQiCZ1t2cwGkonHc4uZAPKa0ajUipMXc7tyMnMhyuNNEBvQX1O49JGc641QQxbc7zv2pkO3wg1NxbhkRsfFiVCMmwfOO4sK18EOtQP8sBz0y8sxg1xj2r6SgMZmD+4CHmoLRvzW6k4qMSUqkWTTNVJ4fqStlrStRz5kBrObJEydp6jgEh4VgBpjCLl/D21R6qxvefP55qnZl+VuxER2cDK8Eh1yB74gGxtyxtsbpqtnBuZEX1j+lh9u6QyPX5B5S66CqSSFrjByX7wk0ScGrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZUWv5XNoaEhV7qQbV6cd/MFWBtiZID9AfeU/P84akY=;
 b=OuhliyyqAq2ouohx7AsCGtb8/Q1EDo82jLF7hC+e+KG9NcrGQsfGKZSve1qGOnJ4KkxdVcB6OHjg5I8eexAb6LesBUeLgLplFCCnqVBwKXSGPJMQu79evp/3TxRMpq0IaZjo96HKGdeXJVJ+JeghA2bDdHn3U0i16VBfc2eO6OrSwLz4kRr9AJZlqxmLWW/NITHveWnMT7TjQnBgEubWKRHi/2P8PyAlJWajHTXpbsYteAS1ydNDt5tPjx3PShRLkJYqL0cYCcRdKfnpD3ND4h6gWiI0X9SkovoJCjRHGZifd9Mr5WUZOWo1rIiSe47TctSUThRPcFG8UwQCA1+ceQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZUWv5XNoaEhV7qQbV6cd/MFWBtiZID9AfeU/P84akY=;
 b=zxVWVTijE9+dUwGkOyZlQ6tmS+Ju0kjnpIOkPnCWDJHuZNQPMEVJPKgsP0Rjla0SNo1WK+cj4Ix/5AtgYiUqWlWCEdERGP0d2cUY0xNCbZpdRYgYMmGyCZmnfYUreAI9DXyTuFeZjhj7kLKn3aExTS/xnOa0m8s1Ofg4+6gyP5Ue8RIjXF+pEkUiSN3FDSLQZabo60aBkmsjb1XdGLiuPD1wxJCNQikLUFeTa8MfXfrnct1fXWiL5ELytpxtMSwctcpDuNrsWAxA75WhM0zHbwwtyotRAHEfp3gKJzmYmDdDFpVUw1lneTIOdJLLe19djznITMW+GzgB0mjbjRzFqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <86f73a8a-5433-03c2-71fd-ee6a5abbe550@suse.com>
Date: Tue, 19 Jul 2022 15:29:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 08/18] kconfig: introduce domain builder config option
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-9-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220706210454.30096-9-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0032.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::45) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8215bcf6-5d86-4459-5e8d-08da698ab123
X-MS-TrafficTypeDiagnostic: PAXPR04MB8703:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RnMLvBkgwitSjhf65gx0mcV8JUTYB5iOmR1yFZd21ntoYO40zsN2bJVUD0an3/hcozxiyW/zRKw/iKr8EjOQpkImVq2luDu22E4Jo2DJuQljGwnWfUusBao9vQwSk88wjs6cDJjyKtrGr+6o1lxHEBQkq16Yf22nU7R/CML+m8NuSTpTrUvVLfP4DHGggj/YZx1I8Oh5mcmfnVHilmZYZ2742xujJnOI5oySK0tP59cFBBwxFfgMBNd/eAy7/lQrnCF0WcDh7VS1Q/hpd6RJ6mMGJn5o8TbjYxVWTX0+yd26ltdKOchc44i2WN7/uBc56KTUI0rJM7eucTwTJlCUg6HVpABzvfADA9rvotBDQSXub0eJAXzzmmPLMJeU/MEWzJAX36VRk32uMGBkk1ChODB2NWX2StHpfOGhZKMSpUfnEJqVeiZBowAO5cmeEPSflEEqdFMrvDkI/8cByM4kx6FQSAFgEHSovBmbC2WVb7/lkt0HowJdO+YrorKgrChK16C21ToipETMzeunFYGG24RdVQ0mik3Utu9sfFOfwDcdPcVPLjlTSBXJhbYbE/912nfTYtOaxKPn7jWeOJCwehBCBiNXPwRwhoqbzrmbKTDfLzaizUhMrZ179/pNUeCQSUWSJoP1+YiwGHET/zf5Sgv9/5p+9sP2CI6Ujxb8XQAg2g0sNbEF48vf0LjouUlDJHQWO63AOeK85JziEGL2vPBw8J7yFO98yUXE8aB3DoqNZF2SzZ1G2oq8Oou/0D4Se1A0/54SejP3/lQLzPhCcMTymyaoz0dd4AHtfrVnGWJrKQJZ7SZtRIzZAx8HVeDRD92XLIO0h4YHkdnbBTVRXA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(376002)(39860400002)(366004)(136003)(66556008)(4326008)(8936002)(86362001)(4744005)(66476007)(5660300002)(41300700001)(54906003)(66946007)(2906002)(8676002)(26005)(31696002)(53546011)(6486002)(6512007)(478600001)(36756003)(38100700002)(186003)(316002)(2616005)(6916009)(6506007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmxwY2tySXI5eklUcklKSHdZQzd5QUdmN0pIZ2hxbFVTeDl5T1ZkeUFLeHJM?=
 =?utf-8?B?ZldhblJlV2tTVjNub1VVVEFSZVAyK0xXUTJnVUZkMjF5MFRpL3JUdEorOFF1?=
 =?utf-8?B?UGNKVnZ3M3BFZlNzRE82T0h6RFViaXJwK3dKbVNyTllidmdJMENaMFBrbzYr?=
 =?utf-8?B?TkdEQ2p1K3NER2RUcktFZ1l3bVhnY3MwUXVGVC9aeEx1ZElycmxZZ2NUK0w0?=
 =?utf-8?B?NEczTU9Xbzh6K3piY0w5Q0huZkRyeUhFZUd1Y21Qd2NjY1NSR2dtckFuTUxX?=
 =?utf-8?B?aTdPSTRJTXlsYzFpZUpSUExoMmlmY2tOM1B1QzIzeE5ZRm1HSUhtQW9LbmlK?=
 =?utf-8?B?SHNJeGlxZzJjUk0vOTJrSzFoVVUxdzBaUDYza3ZVdTRKWk5JbGxNTktWcWdK?=
 =?utf-8?B?eWs0MjZBOWlZbmlVOWxISU95YzNKTExRMWwyZ25rQnpLRmI0TWd1eXZoWnB1?=
 =?utf-8?B?aUNLRmNRZWEza29aaHJldnFTTGJQUEFxU1N1b3l2WC9LZFdjaGlEdTZMb1FP?=
 =?utf-8?B?aGRXMlJHTWdNdWNlNUFMQWFtb2NOV1hIZWpkQVFsd2FQV29HUnVWU1lXTCtN?=
 =?utf-8?B?c2xocmo3UUg1MDFQRWVnenNvNFlwOVRXV1lNeHYwZlo2TkgzL3J3SmJvOEZ4?=
 =?utf-8?B?d29WVHdCYlRCQkllek53RE02L3ZhZTBOOWo3b3lRdFhpYmhhdm1JMFZwVjJs?=
 =?utf-8?B?bzVPaG5WNE9lR0JNNk5WZ3k3NWFSWTdGV1UzSldBV0U3SWRNMEUwVjNPaDFp?=
 =?utf-8?B?c2JBQTIzbC8xQkhiUjUzWWZabDFxcWMzQ0N3bm9ZOTB5ei80citMR21wUnZX?=
 =?utf-8?B?RmtRak1jejVDL1FhVDJ1bW9XNFI3cm5GdGFVRWl5a0pHQ05ja2ZzTE8ybWVh?=
 =?utf-8?B?U0Y4c1ZoSCt4amlaLzRGRlpIS2dMV3BSMGswb1Qrc20zMGtJZTR3MUtrSytP?=
 =?utf-8?B?NTlFajBXUVBZeTRXTytVZzVGNUpTR2JNOVhYSWErR0V2MTZJTk1yMHNBZENT?=
 =?utf-8?B?OUg2YUlpRnR6MkZ3SU1uUVhoeTNwb0Y5L2xJMlZmYXd2S0ZwcW1TTThSTGNz?=
 =?utf-8?B?UmJKaTFEOXlIN1RYR01sN1dlNWhKdldsT0RKOTBBazF4NEU5WnVGTXVualdO?=
 =?utf-8?B?S2drbWxxZVkrNVQyaS96QnoycE5hT1JYL0tMSnltWTE0eEZPbDR3SGNoYWVk?=
 =?utf-8?B?cTYrdEFHdG9KNDkvbWZJdUZpZ21OMmNYZlRBQWExdkZlejVHUzYzWGw4NzZi?=
 =?utf-8?B?eWxzaEh3Wm5maEdqdmdQaVpYRStHZ2JiUVZQR2VKRnZRZG5RdXhtdEp0TlVt?=
 =?utf-8?B?RklZLzU1REZRU0dMY0M4cHhkYzFCVXlUYkU0eUUvcTJjNEZqM3pacWhqM0Fr?=
 =?utf-8?B?OW15blBscTdYeGFjMkgrN1NkL2ExYmRnTHE0c1F6VnluTEh2MGNNSFVlZmxJ?=
 =?utf-8?B?V0RoMU94UTdtRHFlTHYrSzBNZDhleW9hK3BCSlJ1WnROYmZibmFKM2hZaEFB?=
 =?utf-8?B?cElPekV5SGk0bVYvdkdhQVlTZ05ONXdkSVBVRlRacFJZaWtQYWp2NmwyZm1w?=
 =?utf-8?B?TVdHTTQwTEJDakJGT2lQMXZrOEk0NmlENE1WS29SYUx1b2dvVVkwZXpqWFZa?=
 =?utf-8?B?WXdMd3Q0VjdCOFlyYVIwQmFSTjVxUFpGUDdlZHRYZUttQkNkcHcwYzhKWGdt?=
 =?utf-8?B?ckJMc1dmaHBwSEpZRVYybU5CNVhCbGxWSk9BZFNjRFVyOVRqSy8vQ0lvZUJN?=
 =?utf-8?B?Kzc5N2NYcnVITENVNjB6T0FvNFl0KzdlVWhFbER6blgwZ2JCT1VjcEd2eHNP?=
 =?utf-8?B?aGdmbXhWTFYvd01nM3VWSndzVXpBWjh5NXc2UzJTRVFDdFJKRDFNRkZqVFNY?=
 =?utf-8?B?Rjh5YWNlU2RBSUVMaXljZFpZWlN2eWJrVEFudUY2WTNNNnlFWkJaczA4ajlv?=
 =?utf-8?B?V3JHVmJxYURHdkJQL2Y1bnk3UGJVVG1ra2FVUlRYV1FtdmFhUGNkUDlXMmtU?=
 =?utf-8?B?eHNUd2grRHpZakZrQjBZK2d4R0Jjak9Qbmh1aXA4MXVETVVaR2F2TzlvU1JX?=
 =?utf-8?B?V2VKQklSMTFvMXZHRjk2VnpoWkliWFl6QkdUYlNBU2ptVUM2T1RMYTdDa1pG?=
 =?utf-8?Q?klNuo8IKaJ7wxa1stMzZdO6iP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8215bcf6-5d86-4459-5e8d-08da698ab123
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 13:29:22.5572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SKs5V3sUAAkck9uSr2VvK34LIcFNFEx981o+dtjzHsd1CYckQ0Ck7dDJsrw6B9MpPy2ip5KbQCa8j6DNy5Ebvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8703

On 06.07.2022 23:04, Daniel P. Smith wrote:
> --- /dev/null
> +++ b/xen/common/domain-builder/Kconfig
> @@ -0,0 +1,15 @@
> +
> +menu "Domain Builder Features"
> +
> +config BUILDER_FDT
> +	bool "Domain builder device tree (UNSUPPORTED)" if UNSUPPORTED
> +	select CORE_DEVICE_TREE
> +	---help---

Nit: No new ---help--- please anymore.

> +	  Enables the ability to configure the domain builder using a
> +	  flattened device tree.

Is this about both Dom0 and DomU? Especially if not, this wants making
explicit. But perhaps even if so it wants saying, for the avoidance of
doubt.

Jan

