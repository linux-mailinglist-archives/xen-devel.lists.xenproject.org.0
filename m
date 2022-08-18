Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2C25983BE
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 15:09:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389533.626515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOfGm-0000ju-Qr; Thu, 18 Aug 2022 13:09:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389533.626515; Thu, 18 Aug 2022 13:09:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOfGm-0000h7-Mj; Thu, 18 Aug 2022 13:09:08 +0000
Received: by outflank-mailman (input) for mailman id 389533;
 Thu, 18 Aug 2022 13:09:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1x1s=YW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOfGk-0000h1-Mr
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 13:09:06 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80059.outbound.protection.outlook.com [40.107.8.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efebed1f-1ef6-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 15:09:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7180.eurprd04.prod.outlook.com (2603:10a6:10:12c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Thu, 18 Aug
 2022 13:09:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 18 Aug 2022
 13:09:03 +0000
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
X-Inumbo-ID: efebed1f-1ef6-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYqZJWergUzK8ZXX9Nk9TmUAX1eIEob/w/lBEsKJjvhoqrNlMd7cfgeBfRxTETahWSs2pVy3H8mq2PpdQywtd2HUovg5GcFJ5jBh1ugjNK/5jSgQSoxN6lL+aAtNhXdYOsQTMR8WfxbaqpqKFgmzLOKrSR5MgslS0E7jZEzd4kYaUrm8QsJqUeAzPWAgZpqebIj/BrQ4uwLL8kLkw4aFAUh5+xC8q9TqTUlk2fCTif2UQF4wP9oyPWF6byuvslefyNIujCQTKEBq4iBYPuL3q5lME8hZZ17H82IBaxaBGVcM3oVkhxoSToEkifdt49yuHvFoD9MeCFs6stPPYmDQ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJoHEJ3i8waIJ6upmWdZZkotMfcpN476vyOI2anv1tU=;
 b=TzJ7U4SEer1Vf2GsTDsXpN7u4Fo5AWRbR/PEowVnZS8LMtEGjThKM5yLCrPs6ijqeNIs+zw7BFiUKWtSZTLOn3qJjHKO5lI5F4EoTVi4O3o2gLpVNKeDaIUQ/ECaqdjqTWXrLSuXDKzltKFzjeC/4TN6zb8+jKEvpO0jpVRM8NL3PBPbd6YLJsrPq2c4h6l7NZQMuPQgGfVCPMdiqORopQs4MGwsCentF4RE8o9GH1w+oPZxgIb0n5hjPDaJIIVfL0R6XjMAfasLEsZ9Lgl1ZCK1ri1iteOJ21iFa5gpgRq45dwNWi2R5rmuw93OJV65HFfbh7CteXp6zc52qogAtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJoHEJ3i8waIJ6upmWdZZkotMfcpN476vyOI2anv1tU=;
 b=gc1DIEngReCci5P09KhYj9KNPNgwzDsE/WluHNsY+IwRXsMSskcd/+b0ilNAtDm7VdLEQr0Q9k+fBt1QbFS9kKBjXGCsR5woqdUZoXVrWIXmu+oDYTkj1dzT8WY54GkOtnAIEVok9VIppuuarc+xtuIjm5d5B1LPp0QCpYGOf9z7WKagvqcMh1tBcrMOLdqHYtmbmzuTmFb3c02jZOZsKY+LxSkIi/yx6DfWe+Ii+lP2ZISZgTxfhpd3oEPe9hIrz4DLLFMBnK4P97prw21ZwLRJz1ZSvOMwBXlL+D/F6RMq1jn2dHDzzOEIYxhKXg+BlKn85pyOaM2yVcr/Ra5V9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b0a3960c-8d1b-556d-f4fa-4fa4c8597a7b@suse.com>
Date: Thu, 18 Aug 2022 15:09:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 0/5] x86/mwait-idle: (remaining) SPR + (new) ADL
 support
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Henry Wang <Henry.Wang@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
In-Reply-To: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5a129b7-c798-43fc-69c5-08da811ad2ad
X-MS-TrafficTypeDiagnostic: DB8PR04MB7180:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2MMIsC2US2lQCEtsMFARzocrt38x0kBkveuB7Nvopry8KOivJ65wDkR0Rl139IagkNxOyULbBJ1+vI5tTBdwXt3hJOzECnAQHi8C32TM1Z7U0CYnyHDJUuy493BoB/XNvHajLU2qYqcDiyKO8CpcbLEpEI0VWuQaAde77KSzQksqyfQ+fi1wQmAgJgTNeiNU2Jzdt7vhETFC2p8XM4nl5ht+rvjgk9Zk0GYyotTaAzSVmAEgISVPDKboTuwwjZxQ6prWBoBinT43tku0L/6MGdvieAsaq4+AEdQNEBB0PBDxyaIlORVSf2/cKDAVS/KDa2x/6IIYCQVxJ+XJFcIWx0BN6G0Gt/CZgf4eTI/P51OcV66FB9cI3vaBeEDGjBSgd6Fvzw3HARIdL+4XT9ipldZkzebewuZPectJdbF/MflP3Jw1Cc0Xc+gRAG/yzBzvt9nhoA73oY1as3uhk2byS2CindtDysxlB+e1IB9Pbbg/RyywRkUYqSawR2e76qa6OruEHVO7XT24TSUh+97fLMXdlcN94NY0PrH683YCacWci9uYeatvrVk788SWGrzkaXRpE0VvsXSTDpuMm3cOyhJREanh9mi5KxKQI83jfIn6KMTa7C7gekcNKToSnUYfBXtFFiHuCP5bz3CyVAklU4nVgtUM528qHdUgHn3J17mB0CBglTvGkUUWnFLZqwsJR9GWaUfRzkeslCzQJNyofGouNq8RfVHQGJUvJqTwIHimy+ghxbZ5XqP0rQWMeO3kj/WyyBbLt3NbkBzlbcp0DE/5OXevmceHCTLD5n4k36g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(136003)(346002)(39860400002)(376002)(316002)(6916009)(54906003)(8936002)(4326008)(8676002)(36756003)(66946007)(66556008)(31686004)(38100700002)(66476007)(2906002)(83380400001)(6486002)(478600001)(6512007)(2616005)(86362001)(31696002)(186003)(5660300002)(4744005)(53546011)(6506007)(26005)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGh0RllKenRURWU5Wk5pRlUySFFmZ2hsam1lWmprK0JneUVrc3JvY3YveXVl?=
 =?utf-8?B?LzliRk8zaFAySWVzZng2aktucC9Td1hZSVREVWJUVmNhdVloY3dyMHQ1Tjhz?=
 =?utf-8?B?ajI4T0FuTTVHakhuZWs0aXFYcHo3bXNRWW9sNXl1SXZoT0kxclB1RWtsQUhv?=
 =?utf-8?B?L2hEZGRBcHF1MFV0cXVzVzd2SFhMR1RSZkc2M0IrNVBoU0c0WUhmTHFGK1JF?=
 =?utf-8?B?OTZFOFJlcVlNSEZMdVhOSnZVRmtrWXNPalM3WENUblNLUy9lUStKTmcvYjRT?=
 =?utf-8?B?VFRHei81V2s5b0d2b3dXZUR6SHRGcXNEaEYxOEY4VW45ajVWc0w2OFRPRFBO?=
 =?utf-8?B?bDFVNWlFK2xhNEJJblVXSFRhVWxmOENPdmVUT29JRGxJYnhSajY1dnpacVYw?=
 =?utf-8?B?ODM5eTZ4R0FlK1VmQXd2WVhHaGR6bFRrTjBzQnUxZlJheEJHYjQxcWttRElw?=
 =?utf-8?B?d0NsWUFrTGhzdWNXVGdIb0VseUZvd2diN1B3RHMzYXJQeGRudzRIR29oUWw4?=
 =?utf-8?B?QmllYXAwRUd4OWNoeGlXcWRrRmd6ZmJrcWtsTDNxVU5YR25KUVA2bG1UdG1t?=
 =?utf-8?B?Z3ZJenV4cmlJd2tHNmRTLy9HY3NOSy9LT3RmeWRDa29uY2h5NUxoWitZYWc2?=
 =?utf-8?B?RTJxOWpQaWJvZlFRSDd1TG44a3JudWFDNi8rNHV6MndRYUJ6S3JxRzlMbE9N?=
 =?utf-8?B?cHJUbWJnVlpRNDUrdG9WT1VpSEFvNzZFT2VaeGx5QXJsQ01UWjZHakpncHNu?=
 =?utf-8?B?QXhaQTlxcUduYkp5TnNXQUd2cVU5clZ2TDEzUm9HQXVpNCsxMnQ1Mys4VUt5?=
 =?utf-8?B?cWRjZllsYkZCS1Z6RHhFQStuUmRVTDRuQVdrQ0JBam1qZytNbkRpY2JwN2lq?=
 =?utf-8?B?eFYzenAwVk45QnRjNHRReVgrMHpDZmhteEZPSUxkUm1kQ3VLbDNYNGNvaEhq?=
 =?utf-8?B?TENjaGRMcjJLZll6R0tTZ0NQV3FLYVU4eGFLNlFyMEk5c0U5OGx6S0RwVFV0?=
 =?utf-8?B?TWFYenJqclNTWDdYY2xoWCtTVzNac2p2d01LRHNNYzV0R3J0dDZJaG1yY0VC?=
 =?utf-8?B?RU5iRWFiVkk0NTZEdmNlRkdpMUhXdUdiMEF4K1JCYll0K0VJcWMrWnd2NkQy?=
 =?utf-8?B?Y1ZLU1RVOEdKVzUwbXlvTFZ0SkNuMHhZQVk0VUc2L0RIZ2pqVzV5KytVY01M?=
 =?utf-8?B?RzRoUDQ0WXhKVUxKeS82Ui9nOTBaYkZiV2hQbmd6aWx1SU83RllMWGJkVjNp?=
 =?utf-8?B?Ly9td1FaTDkvRXJmSVpZQVphOXRTaTR2OW42MHl4MVZDZHZBcE5sODFmaDVM?=
 =?utf-8?B?MVJobURuQnZ2UFl3dFZmV2hiM244YmNpaGZMMlptcWdpK2xEbnc5UGdVTkRa?=
 =?utf-8?B?djRNR0F5bHpLMXRRQU4wNnMxWnhnNnh0VGJzbFBXSjlIV2oyaFZHL1p6MHpy?=
 =?utf-8?B?VVNMN0pzQml3TEJxSzhmZ0t1ZmxCRjUrWDc3MEsyV3pmZisrWWlNYlZ5LzNQ?=
 =?utf-8?B?Tks1TjNsS3NEd3lVbEVoT3NWRG1nSzhUdzc1NmdJY1pDeSs1U01xWUl1aDV4?=
 =?utf-8?B?L1AxUWp3Mk93NmpvZ1BSblQrR3NIMUFiNTRjTW8xZFdFLzJjMCtLMlMwcnNa?=
 =?utf-8?B?cVVzMEtvWFFrWWFNbmxhdEtUc2ZYU0dLM2lDTmVQTXF2VzlPTUNYek1BR2FD?=
 =?utf-8?B?QmdaSG1YYkN6c00rcHhienJBVmNNSGsydkVzR05kRmF4MVpkcEZNUUpmcEhF?=
 =?utf-8?B?RVpHNDZWb3pjV3dUMVNJVTJwVzFJa2Eyajh5bXFZck0rUk1CNzRIYlpTaDRO?=
 =?utf-8?B?aWJaNHhYMFJJWnpBdEkyOFVzcTFUb0hpQnczNnM4dnpzeHVQMVlISWFkKzdm?=
 =?utf-8?B?Rmg2bUU5YzA3UENYMjE0U3VzK2VYZldFUHZDTWJybjFjanVVdEJydm9LZHRa?=
 =?utf-8?B?RU1CQVJkMUxscy96ZFZ0ZVp6ZFp5aHZsUWVMeHczVzFTMHdsY3J5UXI0VWE0?=
 =?utf-8?B?ZWpIV1VqNjVrRHcvZW9SM2s1eFR3VERNdzlaaWNCMTVVdnErVFNYTVJoZ2NE?=
 =?utf-8?B?dWxIQ0hNaDV4UUN2ekdDWDZZNzBmUXR5ZkdXNnEzU05CZ0VxczU5SVFmRkZV?=
 =?utf-8?Q?C+7iuw83Iarx/qukL+WOte5b2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a129b7-c798-43fc-69c5-08da811ad2ad
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 13:09:03.0840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Q3D6tNnUGu2XWrThu9Qeoc2yjtRYb5/+1/9Nd1Haf7hbJRg/Qb956ao3lE9tYjrk03e0d6ujl87bOk5Mn/hBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7180

Henry,

On 18.08.2022 15:02, Jan Beulich wrote:
> New changes have appeared in the meantime, in particular one partly undoing
> what we still haven't merged (patch 1 here).
> 
> 1: add 'preferred_cstates' module argument
> 2: add core C6 optimization for SPR
> 3: add AlderLake support
> 4: disable IBRS during long idle
> 5: make SPR C1 and C1E be independent

strictly speaking patches 3-5 are late submissions. Patch 5, however,
actually corrects patch 1, and I'd prefer to keep things in the order
in which they were put in for Linux. Whether we actually want patch 4
is to be determined; if not that one should be easy to leave out. In
any event I'd like to ask for you to consider granting an exception
on these last three patches.

Thanks, Jan

