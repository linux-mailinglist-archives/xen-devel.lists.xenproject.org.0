Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2BD6FD8AC
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 09:54:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532676.828923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pweek-0002rX-2d; Wed, 10 May 2023 07:54:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532676.828923; Wed, 10 May 2023 07:54:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pweej-0002p5-W7; Wed, 10 May 2023 07:54:37 +0000
Received: by outflank-mailman (input) for mailman id 532676;
 Wed, 10 May 2023 07:54:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WIjz=A7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pweei-0002oz-PM
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 07:54:36 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7d00::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7fa0dbd-ef07-11ed-b229-6b7b168915f2;
 Wed, 10 May 2023 09:54:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS5PR04MB10017.eurprd04.prod.outlook.com (2603:10a6:20b:67c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Wed, 10 May
 2023 07:54:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 07:54:33 +0000
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
X-Inumbo-ID: e7fa0dbd-ef07-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3j3MOJ/7t6BwTPpsjK8TXvSl1FLjwbx0Ks7u0jnkGgxwinqyB9gLLXVTAG/Jm/Rt/c15rOT466QXNjO4QCx6mSA5AIlGC5q8ASsudTOymdFeL1rUpg5Ocrktt8x5KNaWR1bU17J+PWQed40VTFhHiYMgC2gqgl5b1ez9wRmltz1zJG1jGIrR2On2oGaDx1YlK9EML16NBG93TxJkLYswphCh7JEWNZpNAZzyK93TGqtp97jQE3Mkr6qelA8GdLOWMabO+pPdslSSUuwNFb+zTurfzBCxU9mo53uUHbEvEy0aMWMyMxDIJUEiNBGger1Y6undyySriRHt7cS0Abumw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udbh7q+uh6IremICmSasivqBR73eF4POi85bbc4gJLA=;
 b=fwDY1pYYynoigeqqhGATx6XBmKHexrqSifzeKzfPlWpwOBj8Ltc86TUYs/qrPzIQC1JV6MbVB016kuDLqgaYijVJF6N/7Ynj+06CKf/o0/wwg3WosOdMfCWfsLnAaCyS7SR3qlQ1+ch/f2655Yg4HVlE/VJUIjEBMZ5+IXFd0Q6EdHoSdKf988w1Ea1O+rCqkoD3DWBtwWbaxf+ZOoR2bQsCeKxxDnRPBsi2yUqQ1ehxNK7SmQp/1awUjdeia9A9599IzSLVS4Yo36rHDENRWsscYOKW5JmTuIyOZPcu+P+p0dH5C7kawc0VQZ44+Y4RYAVYdAQ1DS7lbcU7Js33PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udbh7q+uh6IremICmSasivqBR73eF4POi85bbc4gJLA=;
 b=IiFcMrA19fsnJzdsNRh8izEowyrBNtYGMs9aooC/dzap+f2wJDjhY9bgX/8XZnBFfcAkshLIN+Kf4xnSS5hpSsHW0Z/i5LB0J0JzgiyjpJ6v63q53loAPstbMguvZIW+j9NKDJEmbGBKCEPzfggkuE/MOHjE6BR9yIwXyydjzt6wb7JYrGPebHP8s30pkyTxI3VPCAp24kaP6WZY1ayk/kJthvDeCEUbgc00JsZj4SzAS+/6JDXVSqy/u1GhGO9TfY+k8m0tmwIUURM8LVwouISY5MR7xNyc+DFUe9VL4GVxo+IFud7pxEZmWXq6mocUVoxKB7pGRYnTdqaqtLurLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dc899580-e002-09c3-ba81-c8b828b05e08@suse.com>
Date: Wed, 10 May 2023 09:54:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [XEN PATCH 0/2] Use streaming decompression for ZSTD kernels
To: =?UTF-8?Q?Rafa=c3=abl_Kooi?= <rafael_andreas@hotmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <DU0P192MB170087F1C604F82B946E0CD5E3779@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DU0P192MB170087F1C604F82B946E0CD5E3779@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS5PR04MB10017:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bdfa85b-39cc-4e10-d269-08db512bcb17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I+sT9TwEMvK8lTkKAFcQIV/ndSbwx9Mi0SRbYdl+06eaY8aIdrXCaQ58abKqhyFu/WAAvhxI/p8hz4LyeB5S6vCoxCh9vcRRzODnPGnjqQGFauh/jpKBGuHbbYocpaZSM0HVWri0ITPyjBXlnwkMJnIU8zSeHvHQGspVgRKDhpkPeHdgdXyiprMDZgBOS0Xk1bjh8pxgGiTULLSyoXxIDptMo1+1IcrjLveGz6LByLLqjICVcEQ5e1B/xAtla25O3x+WR2XUe79eDgLmgezML4029o44XZlGzVIP725RVCn40ZMRVRbFJj15GZEQM5/8uml149PCA0LDi86HatvnXdrMePM7k09DLavs/kfO+eyDhynZ0Ud6PIcbHXk+zMfBGKJw2/RMft1ZRHWH7tTftjvfF7UlM9QfmCoQti12Thjs//MvL96D3qSkTYzsd1APMtfZzlOSLaYj7D4RVaUGtn/CcS/rxA/eX5/g9qWAEn9ZhJzz2BNWKIZIdvdnmuKCvkYrdfOFhed9Wh16gXuhEQdYbq2cb3yUsyDcpGvXROjGDZO9dcsSJQZ5Mvr/jVLQUfr6U1xa5Rp/nOY252tpTRR8nQVaqJuPcpeoUeEh+SV80n3OpZDtOp0HgThqbk4o8L3jGHz8TQTWwLgirri7Xg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(396003)(366004)(346002)(376002)(451199021)(31686004)(6916009)(5660300002)(66946007)(4326008)(66476007)(54906003)(478600001)(4744005)(66556008)(8676002)(8936002)(2906002)(316002)(41300700001)(31696002)(6486002)(53546011)(26005)(6506007)(6512007)(186003)(36756003)(2616005)(38100700002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1NITWRxUVNXa21oZUtjNzhNUzN4ZENUb2E2WElyOW05c05KVUFRYWF0UDY3?=
 =?utf-8?B?anJYQWV4NEZYbDhSSGM0Zk1lbVh0aFlHdlJid0JCR29RS2xzeWsyVCs3MWdz?=
 =?utf-8?B?SjhILzYwOS95ZU9RZG1xWW5GMGFnRVZqM1BDY3J0ZWdRMnhTbTZXV3A1S3kv?=
 =?utf-8?B?bEw1MFpHNUVpZjhpMGlmZkpkdVhUaktEaWt2ODdoSkM2YnNsek5raytybHV2?=
 =?utf-8?B?cXRoUVhoTm1HQkcwZml4Zk14SjA3eUxybm5CMmcvMisvTTJaaktVOHpGZ2pF?=
 =?utf-8?B?MFJSZ1EvS0RHMXo4Skx4cFc1QTJjSU9RVjhMVW1NSFNjTzhZWVBVRTBwdEdR?=
 =?utf-8?B?ak1zL21kVUZkWHdPVkhqSXNsMUVNUFR0TDFqYW9MTUdadm9xb1luY2NGdUxs?=
 =?utf-8?B?UmlBWjVDVGo1VC9aMjA3Z3NjanhLSkc2cTFwQU5xVlVjOHZUQ1BTcTVRL05k?=
 =?utf-8?B?N24yUFZJbmczWEhabm9MRWJ0QWVBM08veGh1dXBseEcraVBiWGFSak9yYUVp?=
 =?utf-8?B?MWxtbVovQnovMFhWdC9iOTJFS1BEYUliMlJvT2ZvdWV6SGZJU1hTYlBLNG10?=
 =?utf-8?B?Q09zVi83bEd3S05aMEI3M1pmbWNwYzJ5U0pFZUFORUt1MitEZEhuNlRwREpi?=
 =?utf-8?B?YTdLNmpiU2d4TFE5SU9nNjZHT2F1QTN5aVY3cVpxQ3k5aTY2YzV4YUJUMGs5?=
 =?utf-8?B?QmM2aEU0RkpiZjE3T1Y5SGZBQ3VUd05iYlh1a1VxeEh4SGtWVlU5d3Y2dzh6?=
 =?utf-8?B?WHNQSVR6RG9SQzZTZXYzRFVzQ0dGejlWd3VTejlhdnNiQVgxYWZTMGNyVUFP?=
 =?utf-8?B?V3NJa1ZLNGVvSThqbmlCQmNYVlNZeVJFd0pKV0tmSVNxYkVvRmJXM3hobkdG?=
 =?utf-8?B?NjJiUE9HdzJDeWNTQ1c1UnRqbytySU9pSnhIVzF1UTNVZ2RzWlcxYXFha3JJ?=
 =?utf-8?B?azAxcEdNSVdBWnZ3QVdkSzVibWt1cTJZekVoTmR1K0lJa0Jvcy9jTEJUd0d2?=
 =?utf-8?B?b3dzQncwQ3BDZ3NXUit6L21oSzNiY1Bsa09Wc2w5UXhIZmlCSjZvTXJheDJm?=
 =?utf-8?B?MExkTjZweGt5UkxJcnVTY2JZMVFUbjFMamV3a3YvS1FOU1kyRUZnQzc0UFQz?=
 =?utf-8?B?emhwN2J5WnppUE9PeFp6OHlDYVc1aWJscDM5UXR6VmtDN1dMZ1FJU2xyV3pM?=
 =?utf-8?B?STI4UlpDdjh4RW1Gb2ZUOWJsRysvTWd5dmZtK3BaY1pqQ0ZSU1UxbnAxMmtQ?=
 =?utf-8?B?a1dncHlsSGFXZU1sWXVhM2NGcVFYRHhWK3dqRm1LaW1NcVQrVTJILzh4V05C?=
 =?utf-8?B?ei9XNGMra1NXSTNadEpEVkVSdDh6ak80TzVWQk5yTFF2WVlQaFYxSVFqcVBk?=
 =?utf-8?B?SkF2NmU5VFY4WkJycit6NHE3Q1BvZ1h3TzZGWlNDeUxHU1h3a1cyNzhXeVVT?=
 =?utf-8?B?bXg5bjBlRE0zc2wwQksrWU81V2xheGxDcDZuVUpBbG83OXlYK1dISW1rZ0VM?=
 =?utf-8?B?a1BKTkF5Sk1kSUVCc2M3amRZVGZZa0tEOFJaWWpoeGp2UHZIUmp1bDRPOGp1?=
 =?utf-8?B?NWU5cVJ1b2VmZHV5UkR3ZkNkMmd1aWNnQnBON2J4L2RsMy9BY0hkNnR5dTJE?=
 =?utf-8?B?OUVOU1NIRE05OUtJMURhRHM5Y2MvTjNFb0ZiWmx6OFpXWEI5eXVqQlJ3bU9a?=
 =?utf-8?B?WjBTVFB1VGhOZWxFcXU5L1hzelpCejQyZWFMMk9qbElkeWIvYTZSY1VWeFcx?=
 =?utf-8?B?aGFENTBUTVF0QmszZnhuSHQrM0VMRXhuc0V3V1ZmWFdlTXF0a2l2OEVXd2tX?=
 =?utf-8?B?Z0x1VHVTRWlRRkI4UDRkUTZOY2FJamozOW1XZ1Q0QXlreUd6L3RvcVhTeXUv?=
 =?utf-8?B?cTRsa1ZObUxMWjBnUXRTWUVwZHc1QmRCK0dkUXRKNnZUWm9IMXZEL01xUHAy?=
 =?utf-8?B?TzVWci9LWGd2VXFqcTE3aUhLUXJEdklWTU5vQkJzT3pTWGoza2xSa0xscm5K?=
 =?utf-8?B?NVNuekErOEwvN3lsNG5PTkdYYmNZTkRQZDdXTFhtMUJuMEQvdzJIOVZDdlF6?=
 =?utf-8?B?NlB2SHRMak9nOXhhcHpjd3dyWFN3dW5yWHRQRFpKa0JVMjEwY1pJV3g2YjRj?=
 =?utf-8?Q?Do0XPvdMh4M7QemiP/Qmxtpz4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bdfa85b-39cc-4e10-d269-08db512bcb17
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 07:54:33.7529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vp/VVRpfyyqnW1I874RHs2zFpRCAtRBtcqn4YFRa+eSQa3TajNx2NznfkvestLQLq7JASx9evID0X34DcTwgDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10017

On 10.05.2023 02:18, Rafaël Kooi wrote:
> A problem I ran into was that adding book keeping to decompress.c would
> result in either a .data section being added or a .bss.* section. The
> linker would complain about this. And since I am not familiar with this
> code, and why it is this way, I opted to add a user-pointer to the
> internal decompression API.

At least gunzip uses global variables to track state as well. Without you
being explicit, I guess you mean "Error: size of <file>:<section> is <size>",
which is emitted by our build system, not the linker? That's easy to overcome
without touching all decompressors - use __initdata. See common/gunzip.c.

Jan

