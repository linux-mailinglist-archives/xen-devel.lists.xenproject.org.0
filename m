Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C42475F351
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 12:30:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568711.888496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNspn-0001pF-8w; Mon, 24 Jul 2023 10:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568711.888496; Mon, 24 Jul 2023 10:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNspn-0001nY-5K; Mon, 24 Jul 2023 10:30:35 +0000
Received: by outflank-mailman (input) for mailman id 568711;
 Mon, 24 Jul 2023 10:30:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vJ35=DK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qNspl-0001nO-S8
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 10:30:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d7b5cd7-2a0d-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 12:30:31 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB8059.eurprd04.prod.outlook.com (2603:10a6:10:1e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 10:30:29 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 10:30:29 +0000
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
X-Inumbo-ID: 1d7b5cd7-2a0d-11ee-8612-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQootZuVpSWOq/5x+mK42PBG6+koVF6f7+SAkjzQdB8Hz9V3kLiYuCv6dld21UARGm/3ZhghxafIst7uRI5imQAyNYtvi9lQkRuUYxQ749C6qQ6Rt6ihmRw/aBlDeAQxg0iWPwP5D4EwduVrpaf+mfQi833YorQU9Iu5ZwCXrGz+eK+ZEUE8vZXw8SJ7kCEDfU/89wbeHDvRpaO54C0vrmRU9pT1GowlBUZwP2G9K8LtHAAbez7YsZDnQq+CBRJHJ4yppDSPaZs+wkfz+6LR3t/JzOf4kEASCGmnWqwjmTStGTTD8c9TpNhB46e6F3XoISZziRZIXcZjGMoL9Z4Gww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZmkc2QkwNO94vPcC2/TsHIaCueBdwovQsBRyUUDMOU=;
 b=KSFArn7o+XckPTX/Mx8nx9BYVE4uwwYPrY3rKTmO2P+0YVAIOslmyBTNV9nGbHxYEeGEpMvJPMArgALcDe48HZJPdyHrRIm1uwy/iNr0TYHfy7IfoU3iN5t2HAvhzpJ9dRAPctiKiH3c9WyMGIuN8Os1Uk0LWNhIi+b/CyX8CCyn/pJod3NQLFh6eBIJPhYhI0dq63TBqQ8Xp9jI5ifi2RGcpg8L2ZZfgJF7IJGotzdCPFVukQcHckMzKufrjTmFecZjM1444LPfSVRxvsKXQMnHAvP58IEoFYZrYy4RMeMoxIzGZDnrc5HfqkmIKc3YDshaw/sT49yt58LCCn1LrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZmkc2QkwNO94vPcC2/TsHIaCueBdwovQsBRyUUDMOU=;
 b=s7mWS92FV2zPbSF4RXB15MowJw+wt+jHgfAXJKxEQB0S+3t4qi20IAlVzM6uqqEQF5hnQDJSD0rg+nNyTSUh3tgJohjlZl7fo7fgo36Cn3a3PJF0xr5u4PjLglArYVp12WRXFqUC1XqPUuGdHpECj80bFaYdlFN8dXbbkyDiUlIC57YpBhhdOIpQqBqpNf2w5yOPiG+iOlTs2oQEAZmhlIzln9DZB+GlVm2dm4/cAgaTNc51nZIvQU62cfKVbXOKx5i6Btl4bpF50Nj+2J9y3JG1WaYD2XJPZtkqQFhwoBz4+M4hp249X21+rIlm0va/yaPObAFm+aKTd+WNRvvO0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5b9b873a-aa1b-2922-19e0-80e41a921e45@suse.com>
Date: Mon, 24 Jul 2023 12:30:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 08/13] vpci/header: program p2m with guest BAR view
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-9-volodymyr_babchuk@epam.com>
 <ZLqCr_ySq41C5w1i@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZLqCr_ySq41C5w1i@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d9a2287-4f99-497b-7999-08db8c31005b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OYznELYUpiYr4aPJIHTlilNrwe7TEMHBlFr+yrucFmlZ4eSNpb3EKUqGVVrKGYfp9rrwQXdzcEyCxawlzVUqUxNlyHGJZCM5CGXhD8FNPJfv/MvQEgku4hh/C1wSn/Dw11pWtXjGGtnKExSRKRfd3kMAc7sRFkWb4ABIorpnucbRToWaSW2bANbquT599RnHPXVzs/3QL+Rz6Hg+cFwE/zUrIaoLhtaVtzVndBYzRFYkDx7RYe9W1CWFTtFlMYekHr2loCpw/aNYcnhm9ti9FzRmQrd5tHP3n5UCqtK0srATKx1sYtWKzcsT8mUEVsFe8U1Dm/v1si9S2XXmDfZbjp1B3E0tR7ZJYcCsqaW6gbPm86VYEX2Bt8SLb3dK6pWwg267nz2+RaDNf36sXbvilAyjbx+QQQ1lY/SCMKj28UdaqxbGTYJrcEGWgDE+inTOHjexXS+93BbLeokBtKmh00MDLqhAO9Ha6dZKFU/sKmOeHQ99GaTubk84SwZg/7H+YmjsqTao+KiWX01dGRKrDNKNaSdlJUAXlG5gR3Cf17vNXCR4d0ZLwtg3Yp40ii/TBdOVGJ3y/1k2sTS5iIOuM9wJHgkNucYCBfJhZY+mqfkdhuFzmF72Uy6eZZvB3zEsR4hLPUcMJdXK44vhUZMY/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199021)(6506007)(26005)(186003)(36756003)(5660300002)(31696002)(8936002)(8676002)(4744005)(2906002)(53546011)(38100700002)(86362001)(6486002)(66476007)(66556008)(6512007)(66946007)(83380400001)(31686004)(54906003)(478600001)(110136005)(41300700001)(2616005)(4326008)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGpWajVvV2twVXZCNDRSbHRhb2tUbmJEb2VobnQvSlVZK1NWQkliNkxCdi9C?=
 =?utf-8?B?OTFDMnR2UDZZQnZIVHNxQjZlVUJBU3RIOFpKcVYvOFZQY2J6WjUrSncrSXlz?=
 =?utf-8?B?aGE1OHVBTW1EVElOVUxha1JucFRsZXJzdCt2a0VyY2FHbDBHQk0zWFA4VGZn?=
 =?utf-8?B?NVhnTmk0THpvOXBxWmhuRmp4YU5FMjRGRTl2OHRhVDQrTm5kQ1dFZUtybDJz?=
 =?utf-8?B?RFZDMmljSGFQSmJ0bHRiNU1iTkhIYVJZSStrNHdkNGRsOE9LS200WnovWVRX?=
 =?utf-8?B?M3g5Ung1MUR4VThteGhWWEtsb3AwOVovM0JEdEJHaWkyTHBLeXdpd2F1QlRH?=
 =?utf-8?B?aitNQVUvUkp3QVdnZjdDaU9qek5xcUdPVzNHbDJheUxtUG80b1dnS0k2NGJV?=
 =?utf-8?B?bTlhMlV3MG8yak9kQ2dpUFZ0aVlESVdsTUdCYjV5ZHJHUDErclJsS3RpU3Vo?=
 =?utf-8?B?TDdKdlJ1aGVqOHYxYkVCcG01ckpkS0FqeDdjaDRNUjRkUEFVTEhhb2JCQXBM?=
 =?utf-8?B?cTYvRjFBeWREazNDZks3RzBpMVdvYTJlUjhrRzV1c3JBL3hPbGpnTlU0REpu?=
 =?utf-8?B?MVBGa1pNdjljL2hMU1Y1M0lNbW93U1VLYll2dFcvRythSHBTaUh2Mzdua0Zm?=
 =?utf-8?B?MW1zTEhVcXcrdUwzc0h5SisyTXNPQXVaa1YvZ3hZWXZwTDZ5V2FTSjQ0UGV3?=
 =?utf-8?B?ZUJDdncyK3RyNHIxcW10cWhYSUdDMWNvMFZMbU1yZW5GS0FtczRYZzZHQlk5?=
 =?utf-8?B?czhOYXNEOHlHeVlmOXBKQ0M0N1hqTjB6cWV5Vyt1dDNUd0ZxZTZZQkZUb0VS?=
 =?utf-8?B?YTQ1VmU3VWdUSDdabS82RzRuZ21hOFUwSk8vQXVaaWRRZHNGMVJWOS9QQnhm?=
 =?utf-8?B?NERnT3hrazIvTElsLzV3cnZjM3RGbHhWNG9JUXZwdDArdnVOTXRodE92Mmhl?=
 =?utf-8?B?QUZmS3gyOGgrajYrcjFLaUpIT2wyT2NKVUkzZmRqdncwa0Y5NlVrL1lUTGJJ?=
 =?utf-8?B?UmJTaXpSMmE4SkRsRjNMRlJnTDJiK1BreGRBV1hnM0hYMzdUTkkyYTE5clFz?=
 =?utf-8?B?OHpMTENBbHVneHJXbUJURFZ6Zkl5UGR2WEMrN1JDWjNyLytEMkZ0Tmo1SkRB?=
 =?utf-8?B?VTg1R09Sak1TaDE5ZkljNkQ5ZnBYa1FyUFFTT05id2k2UnZsZ0pOUU53Rk9s?=
 =?utf-8?B?M1pOdEs3M1NmMVBIV2p5M1BGc0dqaXgzUWNrY1JiVllldVczUDNjRktUek9l?=
 =?utf-8?B?VzhHdVk0M3lvcE9kclN1Y2ZCR2xFTXNZUGg3S2x4MVYzZURBcVRiWEZRNWox?=
 =?utf-8?B?Z1pJOGN6TTBYTGc4cXQ1cWhDb0pSRlZPVE9hR2pLYkdKTlN0YnhIZFBrZVRq?=
 =?utf-8?B?MlkvMktNaDZlL0pNUmJUWFZtbFVRY2FoWGpweGlrMmZ1OTM2VXIzZm5NUTlU?=
 =?utf-8?B?S0J2TTJuL3dJRWFlYU1HQ1BnSlVlSHViVzBPb2RTTUNpVlpaZWtEU0NBdmdy?=
 =?utf-8?B?VitBUkxVMmVaaEdidDhUeVlSZ2JjeU9WVU9yaW50NWpWTDBXSXFYdE9mOUFL?=
 =?utf-8?B?blJTUUpIRnR0UDVtbHIxU2JmQkxGVTJqVVlYdnVsRmx6aHlIWVh3N1JGTzc3?=
 =?utf-8?B?elFBckZNSlFBeUczdnlaSVZQakk4T251bm9OUzhUTGZoekpjQjVYWGR4N0RU?=
 =?utf-8?B?NEZjMUNVQytoYktYd0RLWkVjNml3WXV0WllyaGxPRjNEV1ZubDBJRTNIbVY2?=
 =?utf-8?B?YXplOWtqeEhiRDF6VXp6aEl5Yy91L1piTzRTMGY0MHFyM2lkUjR2UGo1SkpB?=
 =?utf-8?B?TWxvb0RBWFNpWWcvSWVjRkVrUmJqNVNkeEl5U2tyQW44WkY1bzNoQXVMUUpG?=
 =?utf-8?B?R1dBVXNYNkNmWXR1c1RnZnVTeXVYcU0zTWRuWFdVbWJuWkhoY1orMGlwVWV2?=
 =?utf-8?B?ME8yRytLYjhIRDNFb2NuSTZKL052R1l5SFdqL3A4bzJRMS9DYlE0T1R3VnRL?=
 =?utf-8?B?YXVva3FTanBJWWZyWWM5dU92eGFUbERLTEJ3MTlNODRWOGJld2N0QmtGZ05J?=
 =?utf-8?B?S2ZjSHhwT0JOUUpRTWtqRzhteEVlSllOcWhqaUpXUHRrV01aQWxucHRUb2kx?=
 =?utf-8?Q?ukwFHjKOGpxxkuhX8cJKTK758?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d9a2287-4f99-497b-7999-08db8c31005b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 10:30:29.1674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ri4iIVBGLn6N9s0DvIh4a6l+weVBaP4P42pjv6zAhP/m1+8HzfE8wC8dn8NhVIKLg+pLersQd28rFMx8B9ZopQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8059

On 21.07.2023 15:05, Roger Pau Monné wrote:
> On Thu, Jul 20, 2023 at 12:32:33AM +0000, Volodymyr Babchuk wrote:
>> @@ -62,8 +76,8 @@ static int cf_check map_range(
>>          if ( rc < 0 )
>>          {
>>              printk(XENLOG_G_WARNING
>> -                   "Failed to identity %smap [%lx, %lx] for d%d: %d\n",
>> -                   map->map ? "" : "un", s, e, map->d->domain_id, rc);
>> +                   "Failed to %smap [%lx, %lx] for %pd: %d\n",
>> +                   map->map ? "" : "un", s, e, map->d, rc);
> 
> I would also print the gfn -> mfn values if it's no longer an identity
> map.

And also the actual range - it's not [s,e] anymore.

Jan

