Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F40875A0AE9
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 10:04:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393138.631899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR7px-0001bx-Ba; Thu, 25 Aug 2022 08:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393138.631899; Thu, 25 Aug 2022 08:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR7px-0001Yu-82; Thu, 25 Aug 2022 08:03:37 +0000
Received: by outflank-mailman (input) for mailman id 393138;
 Thu, 25 Aug 2022 08:03:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2f78=Y5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oR7pw-0001Ym-JZ
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 08:03:36 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60067.outbound.protection.outlook.com [40.107.6.67])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b3b2091-244c-11ed-bd2e-47488cf2e6aa;
 Thu, 25 Aug 2022 10:03:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB5078.eurprd04.prod.outlook.com (2603:10a6:20b:5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 08:03:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 08:03:32 +0000
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
X-Inumbo-ID: 6b3b2091-244c-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hySA7tHzDvtQT+t6f7Osu+kpFenRQOyjFZjrVHvX6Hg71nBHQgFy1UrS1S1hbFPBkXWtmlDcsOCMuS9qdiBf77jADHbHnkzZfycLEWTDN0aAEATNLjB5pzUOR4oBxQ/c6GakclIvviCB3ktS2KexizjPdOmnSq3BkVNXD0iXp35QTgQj7BzXOwMLQ671el+rIQJCKkQN/0Mpox5/p49FDFW6nRysrJfQzbcCxuigsFcuNr6Acjmq9MwDmoU9eEaJGtBfmV4Z3W+BFDgL/qur0zSmWfWOeQQPn8Qt+GpJQasE0CBzP1gtUDUWd80yVAuDAFwL7Av8OedFWfrLlTlHAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plS9lmhZI5vtsso6Q/XXBn9LZGERv3DFL8yWAe4rZYs=;
 b=dsQ9IBbQFYErKQdArxEXjB7PjNSzC65214kGAjtoeyXzmL+a37cRRc9pb9o8WalR57hS738ftbg2UGx2QOh2z/Vv02fGjfm6TfJ3sCU5KX5a0CcaJBm6dC7C1e2y44hUxCZW1OFlebKEFDimSUccRAO5+oAgQgnXZsFvjMbzSRoRPJXuVEoJkkQpLl4ysOUrXZGg3xppf6Rsurn8DdpivqwGNlSQWtQpfKiLEXk0wFhYot6VVf6HAFKn/CQQjWM/c2qxfDnIN2tsBA3I2I+bImbcXLYKcUfWN0eQllHXHpvawnNcP2YVz1mtbwq2V4GiRS1t3iZBE/EC+9EvCy5Oag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plS9lmhZI5vtsso6Q/XXBn9LZGERv3DFL8yWAe4rZYs=;
 b=1x3ROrs3LZ+Sk+H1asOiUpJJbpgbWL+IzaWqCLLfbpjrFH2agxulC8mSRDEvqVsE5l/SaUqWBhaWe4lcbGHZKYh8Md4eYdzesBHmmAWCIVh4Qj+ZUq1AO4xQXvJj6xZH++ahAQp54hYe7qoF4Vh/Zsdofamsdk/jy/NohW29ovsjn66uRitfHq2XUlpIS41OTpXSl4s3bHoQqTUn1RkAdRqS3kTke0NEl1c0Uj58nxltAa3y3vZW3IkgEc3XLcX6WSZkdNnINxUBhMAKI1pmTgBnqHF69OE8ol1wXbSGScel17mhbjJEI0uMhjQ/m6H43abnFQFZwbk8R1DsWPCCrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <22690eb0-9ed0-df88-b510-d3024ccee501@suse.com>
Date: Thu, 25 Aug 2022 10:03:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/4] x86/hvmloader: Don't override stddef.h
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220824105915.32127-1-andrew.cooper3@citrix.com>
 <20220824105915.32127-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220824105915.32127-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a100cd7c-455c-41c0-7bdb-08da86704dde
X-MS-TrafficTypeDiagnostic: AM6PR04MB5078:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oLSbb/FdEx2Z2/pgO1hOkQLXNMRZClxK1gDQ7heubGgZ9b1OPIvLW0CfZcyz2zfgvNYXlKI7wvEdnFRftCpZM7ZavXiayJb2tAnrmx7UaIkJ50hf/KfcQY8E8KEp2PeTu8Cy2cH5FzPId0F4Lakb9xVKVquwzdB4hxKCG3bAWlSim8KhUj73y0DMZjHNi/B0rD17QBPvhH+1onN6NTtcc8t7mYBEkLzD/Gvln7lnOg0tn8QKbPOXngmbsVjGhK8tTztSKgdT8N+JCmJNRP5l17Y+375TP3Q8t+Rv/rYdrZSxpaJvY2bQvBslQR0OEbU1E01ChsVUCC0SrnKblO1etPnNf/nlVK1BfHFjPG24DaG+bfjqety58PVqXHxfs/3Qh+520avYQsqTkhs8ubVFt7PUt+STm9QtePH4LSnfam+hylThX5al4RX3YsU5xmo0F8vt31ZzFu9aRnK2MhYpmFJqXlFKXisKezELLGhCeu2v27663rmdmDzYYBfjIFcW0nylSZ1u4KtWs2eokldZprRCjhql/KNJS7WCnNhphzLgFCp3YDOSUqOgKCKHx43ilQ8wNpT+913Bt5awjiL1rKEK1KGdQZpY0XCzCbNjpxAiZIc84m/Lxo9W4n3GSNfyKkzhFAxFRRykBNE3G1SYiLbpRXXeCjhbaee41TeNjntQD5AMaqjlfipkZTHO8fpa3V4BMa6KseQiYY6lsPHtk4Bw1ELfFxeZXitMQCDwjPPYEEdsZW3dwqsQkrufvHF95i9EMnX0xWM+PKKAxh/mXFX6DaD7jrdimA6SJw69Gq4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(136003)(346002)(366004)(396003)(38100700002)(54906003)(66556008)(66476007)(8676002)(36756003)(478600001)(6916009)(66946007)(6486002)(4326008)(31686004)(316002)(8936002)(5660300002)(2616005)(4744005)(41300700001)(31696002)(86362001)(186003)(26005)(6512007)(53546011)(6506007)(2906002)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnM3d1MrRnJ3M0lDQUxkSXdLNWw3U3NnQlU3V28zeklGWGk2MlhyL2NjWThW?=
 =?utf-8?B?aDA4cXhZeDJlTElxMUNSTHNwbXpSb2IwNWRSMllaTzZFbk83VXRxcDA2dUVB?=
 =?utf-8?B?WTR4c1BHMWlsQVVHcWhYOVFOL1lIZGpBQ3kvVTUwY0ozOVFNaklVNm1neStx?=
 =?utf-8?B?bWkzajhBQ3pHNmlCTG9DUTZsR0VVajVFSWkzWm10M3BZTGM5cWRVOTFaU0Mw?=
 =?utf-8?B?QWx1RFF6QkpxM0JGYVNIWTQydk9uU2oxdzhZVlp5dnUyMmdvU0lKZURmNUsr?=
 =?utf-8?B?b2dab2RoaHlFM0RRTGo5cnlIZkpFS0hzL0ZjcUNxbDRDdTNZVTBWRlNROVlx?=
 =?utf-8?B?VUREMjJZRm1nOG1VMENlSytxWWJacUFTdndmQjZJbVkwVzFuVUxRR1BWSXVn?=
 =?utf-8?B?SkhwOUowUEJFNDlZN1FESjNkRXFudkZQdGhDY2NDVWFRMEdkbmloVEJ4MGZw?=
 =?utf-8?B?UGVpSEZzNHNaVlpkc29kRGR3VXVMczVlbTRlNWZwZWVyd21reHExTnN3VmhR?=
 =?utf-8?B?WUFmaXp6Vm5vKzQrdWFoaG54dGZxb0RQUERQVElkREtTVS9Ba2Vpc2EvaEcw?=
 =?utf-8?B?Z3R5eWZ4QjBrK0ZwU1JRMjJGczNoYTVMVE0xZm4zMElnVVlTR2kxQ3dYb3ov?=
 =?utf-8?B?bVVxZE01aFZNbmdSTkE4akNIWnZNaEdkY00wWE1IU1BtZ2dicDJQUDhUZ1du?=
 =?utf-8?B?UGtBc0xHMDdMS3h4VG84eGk3dXZqenNjcGl0T1NwSlJDdnVVK05qRVhvUCtn?=
 =?utf-8?B?WkxBS0V5b2hiQlNJVjEyWnVBNFVGWWQ4bjVHcXAwNTY1SWw0eTkwQ1MvUzZC?=
 =?utf-8?B?aTZYc1VmdXRDK0NZdkxiakczdlpoZDRxZlozMEdmVWROcFVFU1FiWkVkYVl1?=
 =?utf-8?B?cEpjS25BWkYzV3VReHM1alFUWkJiSXF4cjhNUmtWZjhrNGhWZFBzQnIreW9o?=
 =?utf-8?B?eVhKZmovWFZ5QkphdHhES0VPcDNrQytNRkVuWWg0MHQ2cnZVMS81Wnc2U1B3?=
 =?utf-8?B?VkV0UDlaMWlVSGNOa3JCbitNalRLYk05UzNoMkJUTUZ5Ung1YnVIZ1A5OGVR?=
 =?utf-8?B?azhmT25DQ3h6T01mY1ZvTWpETDdsRGVzRUY3ekg1VXZCTTNrdzBaNVlWV01S?=
 =?utf-8?B?bUU0MDloYldYWFJjem9TekRDcHRSTjA5TFdTNTlESHVOZWFlQk01aTNKdXV4?=
 =?utf-8?B?bUZ3VVJsNHAvOTRLQmd0OVk0UU9NTWVKb25HZnFMcXlLVHpmRHFOMUhJMTFH?=
 =?utf-8?B?a3ZYc1A5Sng4UmQzRXNac3JTYkpmZ21NQ3FERTdIRjZyQjYraFcvcGxJNkJ1?=
 =?utf-8?B?NU1YTWt4ZHBaKzhrakQ0QUJGMGVZZXM1d0ZocENaelVHTEgvV1hjNE95dkVT?=
 =?utf-8?B?Tit0bXptaGVZN3NhMkN0SWlvaEtBa2tqRmZ3R0kwRkFBU2lDV2dKSWFuSHpz?=
 =?utf-8?B?ZUlrdFFnOFdSaXRFTjJKd1hZOXJ1MU1NTUNFWS9kbURibEo1M3o0cjA2YTFr?=
 =?utf-8?B?UXpGTXdlcm53M3Z3ODdDQ1lHREhDWVFPam43QUQzMW05SHdFdy9UN2dGZHFY?=
 =?utf-8?B?QzZQVDhhYk9KekVod29WeElaSG9QZGJEYUR1Vit3akVYMkQ2NmpZQzlXa0tH?=
 =?utf-8?B?N2VlZGVOcjl4K0JMdVp0ZkFocTVzeFlBTE53bGVrc3NGOUJJQmRDRGZkejFa?=
 =?utf-8?B?ZURRQ0VJZWFkUjdaSjZoV3VCMTdjNHB1MDIvL3VZUW94SWFxMnp5QU1QY01D?=
 =?utf-8?B?QTBJdDJRajFWN3d0S1ZON0syQUtkU1VMbHl2Ym9zc3BLNUlHZkRoSHpoSWYw?=
 =?utf-8?B?QUEzVlpPS0U0S0ZIS1hKYndFTUVTVm5BT2tna0lEMWo2OCt2ekszZjdSQjY5?=
 =?utf-8?B?V3k1N2JnNVZCT2VXQnptMlh6ZVVNb0d2aWYyK1Nwb0NLQ2RzT2xNVnpWWUZF?=
 =?utf-8?B?dEdXSHJZa3hUdnFuUWJZWUFkVEFuV1dteCtXTVFaZnlvTkhEKy9ENHV4VGhW?=
 =?utf-8?B?dDlRTm51SXhXSWhkSTJsQ3AreU1LNVR3dDd1WFBPWFpoUzBaajduVDdudXo5?=
 =?utf-8?B?dEZuY3FlcEhFWnphdlZRU2JrOURwUmFtUmhpOGduMVhCa0VibDBQNWx3ZkEr?=
 =?utf-8?Q?PvMCFBpwCNLHp18c8QBD/kKzn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a100cd7c-455c-41c0-7bdb-08da86704dde
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 08:03:32.8950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O10ic5QpUmad3iNeNCd8eOisd2wUziiQG9uGKkXb6/HeZO4B2UcT4sF+d+/hlXZpBwwIah3p1qEOGaEaJq97ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5078

On 24.08.2022 12:59, Andrew Cooper wrote:
> Since c/s 73b13705af7c ("firmware: provide a stand alone set of headers"),
> we've had an implementation of offsetof() which isn't undefined behaviour.
> Actually use it.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


