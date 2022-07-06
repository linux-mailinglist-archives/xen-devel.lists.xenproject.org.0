Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEEA567F01
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 08:55:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361799.591491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8yvV-000507-Nx; Wed, 06 Jul 2022 06:54:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361799.591491; Wed, 06 Jul 2022 06:54:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8yvV-0004y9-Js; Wed, 06 Jul 2022 06:54:21 +0000
Received: by outflank-mailman (input) for mailman id 361799;
 Wed, 06 Jul 2022 06:54:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8yvT-0004y3-7p
 for Xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 06:54:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2040.outbound.protection.outlook.com [40.107.22.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73e3b29c-fcf8-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 08:54:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR04MB3012.eurprd04.prod.outlook.com (2603:10a6:206:f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Wed, 6 Jul
 2022 06:54:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Wed, 6 Jul 2022
 06:54:15 +0000
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
X-Inumbo-ID: 73e3b29c-fcf8-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8/9IwHtVNyyMmS/p0LLK270MTWpQlBeXaE2q+l6UPYJPfSXXfSRZ9lvqw+4WPI5Q66TTlZR+1qGcaQdcsYOy548Ywxkj0zEG7O05KDUnB/YfgZntIJzIFAPLN/aEEFrXDpqU7ACS74/HiB2ZwEesuzEPnD7INgD0JdrZjX+tKF55t1qVyozzVrakZhCY5+tsvrw01CtO+Slpd92jooDLZ4CJQMnTJmNziheOwPG5CK7klMhJ5Ktv7TMxLKEBRiGBuig/VTZNfE0GQ8MQa7rM96dKhn8k6I7ArRWpu3ktcw84sy7tRs04CjJKMgERLimhRloZ8uThM8v7Z+/OBC+4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OcNK1E2+WvdMepGilGPDMb4jUR7+vQTyafiJd8TY0+4=;
 b=SX+xPxw1f5ABf3w8hiHrkmTH2m1WMsGgPe6QM4TWYTw9S0R4v77AbsFu4dzzSU4RD0g45t6KvWJ7vi9Av7Zm/BCbqSTX6CUJ1TlHilcAFDNKDMBW0RXxhcYlElXDZMlDL4XDzQdXr0+CogESIpHs4jW8PQl6xx/5jpF6Hf4GpFED0bdxLf/0FolOTLVF4Mn5hGZ4xGzM1iEHu7A0fbjo7kkhSFcyWYYSJHoG1Cr6JtHhGacL4apNbhaJ81w+eOOUvOkNakixfGLa3lYqJ8NAcCdgDiEA0ae3BPDsQzpqIrYAeawUrohMWD1RrsxLR1iE3T0iK6V9k+M1XzVmH7cQgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcNK1E2+WvdMepGilGPDMb4jUR7+vQTyafiJd8TY0+4=;
 b=pbEfzq1uV7I1vJkoFyD/edM+0pg+VwLNxuN1X9D1aO4NVH7RccFpqGJpKFtnn3egK85oOo4w9SDb9mOcku6uE+W3bG2WQ0iKMfYCbJBorQIpQEyCQ0NkjjBQz0JfpPFwTJzo/B48eiPg23TYYZjaRaiU5oI+1shdiurnEmTwni9UCU3nMFXlzO0NOJ9LJx+JAojC1yrjAH4jkaualwn7AlKPZsoY7MOZATO22PQmL31Z+Pq4tGc6S9gLYsQvxJYYgB2evU0kh7WyeAC3+9f8lL3SM4CBRt60zXam2BxYWAvYDzOS+fW1eJxCTIUR98x+yudPcjrCE+4qcJeD+MjtQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f0dfe416-76d3-0380-ba8a-f24e12c83a86@suse.com>
Date: Wed, 6 Jul 2022 08:54:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] livepatch: create-diff-object: Check that the section has
 a secsym
Content-Language: en-US
To: Sarah Newman <sarah.newman@computer.org>
References: <20220706021817.20437-1-sarah.newman@computer.org>
Cc: Xen-devel@lists.xenproject.org, Konrad Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220706021817.20437-1-sarah.newman@computer.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0159.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::26) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bce038c-e68d-435c-7e6f-08da5f1c5750
X-MS-TrafficTypeDiagnostic: AM5PR04MB3012:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c0f2D4Y2ysWZ07JoOBOyyRpeM2XN9R/0zbVyKQYXub3igjuiJ+zmlfcu4ffSURkJgdqRQWYGgAeD+JGxlDpsK5RdTkL8YWwFvNkOhuB05zCZp1qU5ePwxliH1XeiRQ+ow4Y6tgEKt5kxqkk2y43zfRCz5i2qMJHK1aAppoR3Yd5Fy/BpzwmAUMF0BwjGD6rnhXlfHtb3tXFLwt3bQ6PqG+UlRuDs+oKWTPI4/SAsqUJPUWuhTKFHEjz7R1Ns6r43KuNxKXDvME+6xk5GMOS13qnFPIF5Jf97fZvYZe4oeLh2H/LDjLm3CYh8AFQ3FFTKS3W70c2je3hMbgOCfDXcdZL8AwlFj1WQWzMTcT73/MNas94yuIJWzLEc+jZF951HIalPJyx+1vbOYq92QWFZgsYR2ErI8AMENqdbqn1nrXpNC0d88FT4tj6D78NDZqTK+WnatdzwX6Nt1XVSLDfWeANe8LJYvPAa+72Efrnxc0ltXgR/zTCJRx8fd2Yl85U2u6i+5Xnr0CXoFTxeGLZaiaWPkUzApol4VynnyD3tRijqnfQZDVWSIpfmoBCttTxMh0HhcWvbCzWvTpTNSApom0MI66dj075LL+KMOfi8CT+XJM4HKGZu/CcPZZljSXzgudTydgLQRKaM3uNoM9luoevnVVMgmYzx4f1HwFtIxlZE0Cfc9ZCuA4kQhk/BuzkjuCZFahkLTXF7ohLAYoxkjQMIl172z46vvxENrWF7Q9owWl1VY+2YpjCxURovnGI6Hj2REQDg+L5D5ixf0NPzSWwrBBHMtlL7entErkphxKyQhTlwUxCPnLWDHCID6FkYIgPbcxpoTeaZaPsfG+f5PCxfKEcwtht+gLbAoXkODPeNZbvVNSiP8hG9onQBZTAS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(136003)(396003)(366004)(376002)(186003)(26005)(6506007)(41300700001)(2906002)(54906003)(53546011)(316002)(36756003)(31686004)(6916009)(38100700002)(966005)(6486002)(8936002)(31696002)(5660300002)(86362001)(2616005)(4744005)(66556008)(478600001)(66946007)(6512007)(4326008)(8676002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmVDS3V0dERwdnNScUVWTTZhZHFSNExvVjRJUGw3b2piRUxpY3lWSm9lR0Rk?=
 =?utf-8?B?R2hSQzZwNndNYmVJc2NkRndhK29hNUk3RFE4K21aUjRQaGxkR2lEdEdMazNv?=
 =?utf-8?B?Szl0a1RHUW1ndlpBUWVSQnpGaHRrVFZSUXk0N09UNUdjbThZVXRVdjFDc2ZX?=
 =?utf-8?B?UDB2ZmlqNVdTZ2tpMEdtamo1cUdlZ1FyZ3hLZjBvVUU4R1F3WjZrSkMxMFVv?=
 =?utf-8?B?Mi9xTGVlak5ZSWNjNTJMVUlFMTRKQlgvYm5PYkpVVXk2cWtXUGpzRFlIMVV3?=
 =?utf-8?B?Q1l3VmJWNTdxOXVCSUY2UDVxdkNORUgzSTlPNndvUStUOGJHYkp5dWl0Wldu?=
 =?utf-8?B?ZVFPbkJtR1p4ell2dGVuVkJRSUtxSjZmdTNUbmVvUlllcHJ3amE5dm9talFD?=
 =?utf-8?B?Z2FYaUI1MVRKaG1GeDI0OWRVYjRPNytKYjlIQy9TbktmL1BEZ1BvK08rRlFP?=
 =?utf-8?B?b05xN2NQSXY2NmRXWkFvdGdYcWhETDdaVUlMTk1PVUhkYkJORXY1bm45WW90?=
 =?utf-8?B?V0pjdUNtREQ5dW9IN0VQWXlvNnNhaDRKUDdGNlQyVnpwRFRialBiUWxaa09x?=
 =?utf-8?B?Qm5kL3E0REVhQ1MrR3F0M0FiMEVLRS9KeUxhZm5XekY5dWw0dUhoMk9MV2Jm?=
 =?utf-8?B?WkZTMjdRRGFMNnl2bHpVTEZSVGJ4L3NETGV2SmpYaXA4TUJXT2h6VFVhdXpa?=
 =?utf-8?B?ODlkM3RGdTJhUDJaZFIrOEVML09ENkxBQm4zNEo4eUVXcTFhMm9RRjZIa0tK?=
 =?utf-8?B?enc3dERmTnh2U0dKSWdDekdtY0VnaEZRS25GNmlRNGFlbWgvR3Y2OVNyQkNL?=
 =?utf-8?B?UDlUdzhjeVBaZlkwUUpqMXRRZVFCOXk5OWJXYmhKYTJqYlpvcjVMNzg1cG5n?=
 =?utf-8?B?SGtrQktmSzN3SEZPMUxBWWMwdTU4NjdJTmcyYU5OVXVJUk55WFpIWHFZb3FP?=
 =?utf-8?B?ZTNCR3BBRDRkVUFnMVk3WU42MVh4ajlWRVRDQVRzYWtZSHVFYWhRNUJhMVFx?=
 =?utf-8?B?Y3RScXp0ekUxZGZ5cURFUUxaeWVTekNkbUJqbVozM1lGSXNmSko3bFFOWmpp?=
 =?utf-8?B?dGo1UVVTcFdNTEdCY092S2JkT2FnaUpEOGlsUjAydUVSaW5hQ2NuczNXcVdD?=
 =?utf-8?B?SmhVL0NsWVNiWlVLSTBLeUplZEJtNkljMU9naE53YkxySnFCT24ydDBMQnRO?=
 =?utf-8?B?c3JBaEVvVm1PZ01FUWJsMGltaHV3TnhSOG5jS1Q0NGgrZWlCK0RzbmQ0Zlow?=
 =?utf-8?B?MGFKVXZTRkh0amgyZmF0MXF2M2k3WkRtOUVVN0RTQWw2bFphajVwbkptVmt1?=
 =?utf-8?B?dVhhU25EQU5tYWtiSlZHNVU3bEpoS0FDNXpqbzZhZWhNcWd0Q090T1BaMG1r?=
 =?utf-8?B?SXFnbkViaUJkelI3VDBJVnRVanVlSTZ1bm5jQmRydEpxUXFPMGFWT2pRaEVn?=
 =?utf-8?B?MnIwY1RoZFlHUWI0N2Y4NmJsZW9PbzdtMEpwWnNZSmRaTnZMS09Oc21KcWkw?=
 =?utf-8?B?TlQ1b0h3NE9XaW9ycy9JS3M2WXdOY2hZUWp0bEdldUJjdkRaWkt1MEttUE1B?=
 =?utf-8?B?V1VaZXlpN2hQSElwQkx0S1lvWm9xTE0wdDBDZEdWWUZmSXRXcTQzVmtldVNB?=
 =?utf-8?B?MnNORnMxelFxYnhsaGE2blprSXpXRlZTcEl2ZVArWHYrTGxjSDB2UzRHZENI?=
 =?utf-8?B?UDdKUXBZTmNtOUNmeG5VSG9VMk4wcUxRSmQ0QTNOQ3hBTXFXTXhOY1czRklj?=
 =?utf-8?B?b1pHZVlGSlBGU3Z5YStvZzhJcmJrdHdUUGI1U0M5Q1BEQm4vNGczQVpjcnVn?=
 =?utf-8?B?RWtpNjk1NmtkMm8zUG5sbDU0T0RZWUxnbHdQSEE2dUhsMzBSZFpYSGRTOWdX?=
 =?utf-8?B?alpsdUhqWXdrZ1NnM1p4c2NqbHhxZGFLM1diTDUzeStLa0YrM1RMU2ZOaGVj?=
 =?utf-8?B?SWxXQWpCbjlVV0taZjFVWHlCM09UUXNXSGFTZFg0UktGMm5JMmlzQXI3V0NB?=
 =?utf-8?B?Z08rRm5HcDl4Rk5JT1pYaVhkY0N2dTZMekY0dGlIMGZiWjl6WS9pVUtrcjVq?=
 =?utf-8?B?eWtJMHVRZU9ubWVYZTBKbklJTGtheTc0UEs1Wk5jUHZUanUxL0dyaHdrU0hK?=
 =?utf-8?Q?Nakl559riz/1kMoXqgxF5ePJ0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bce038c-e68d-435c-7e6f-08da5f1c5750
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 06:54:15.6368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RsFxVoBzUIjUtVgkgjhfvzLsQLSS+rQTM07E/w5pvTFy13TXT8Ww8+3r5LxXTtZn1ekSVZySwr0Qxm0+JtfGgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3012

On 06.07.2022 04:18, Sarah Newman wrote:
> A STT_SECTION symbol is not needed if if it is not used as a relocation
> target. Therefore, a section, in this case a debug section, may not have
> a secsym associated with it.
> 
> This is a livepatch backport of kpatch upstream commit [1]:
> create-diff-object: Check that the section has a secsym ba3defa
> 
> Signed-off-by: Sarah Newman <sarah.newman@computer.org>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

However I think the 7-digit hash above wants either extending to at
least 10 digits (better 12), or dropping altogether for having the
full hash ...

> [1] https://github.com/dynup/kpatch/commit/ba3defa06073dcc69917dbbbb9df570ca4e56612

... here anyway. But I guess the rules set forth in
xen.git:docs/process/sending-patches.pandoc could be applied here,
and hence an Origin: tag would best be used.

The other thing is: You didn't Cc any of the maintainer(s).

Jan

