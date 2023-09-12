Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE6479D5D3
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 18:09:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600630.936353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg5wh-0008IM-LN; Tue, 12 Sep 2023 16:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600630.936353; Tue, 12 Sep 2023 16:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg5wh-0008Fw-Ig; Tue, 12 Sep 2023 16:08:59 +0000
Received: by outflank-mailman (input) for mailman id 600630;
 Tue, 12 Sep 2023 16:08:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z1UZ=E4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qg5wf-0008Fj-TY
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 16:08:57 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2045.outbound.protection.outlook.com [40.107.7.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ace98cff-5186-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 18:08:56 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8396.eurprd04.prod.outlook.com (2603:10a6:10:24a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Tue, 12 Sep
 2023 16:08:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 16:08:26 +0000
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
X-Inumbo-ID: ace98cff-5186-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZDx2VZJNNdAoOjaELPRc5mO14RqTq5pJeBH0cZGliC01Hxi9peShhKy77WjLKe1msPl2wElPlAod/PqcLOfxqL7m0sGWSuTQBVb87HKKJmib/BY/liDSJMHLXMrMm+88ZxB5csEhyt6998M/EvWSJWBH0SEHXu2/6OdNNAPqUGDxL5/AFhIEAniRMxlEp/rfj9ecPH+A9ubfdhRp1yFvqz8Wh4To6PzgPUJofuk/uB+cvOFpsWiH3PcXsT+wMpMEDBYWRqneGgBUrpVoat50XkjhAPMS0+tPIYQZuy8DQ2qT1XyDlXtjpFNETjp41XOuXyQ7o3Q1PeV+C2XqEGwIaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3BtOKa/wYHyWODKAu1fzKVLhgekzmC21fWU2hag2CYE=;
 b=nPd3AgFT5sN2zIRVUVhandO9tfomRKpwqRPPUMcG69sfZvu8VIBEzbsEvvOYVhmrkG/JK+XEixUtwLT0qvguTvkILMzuq+CgC3Nhm0CE2lWTW3XzbPgcUSB09s95oyDN0r0FJsDve0Y7px2JnlpFqmvkLKdYKA55aiOKAk2Wb1tFUx/47gmpapOMdnINca+LscXa0bhKpYQnNdiI4lQgS6yX4bOqgrqS/snRMuMwslMJ5xg6jhaZdhkoW1MmmnD52M2jTHw5rKWjC7HtNZzxjy10/LrQ+BCS5liyMahu5ApD1A4bQEgFq+BlOwLMPQr0PvQHdM4jrB2eOO8+vkJcmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3BtOKa/wYHyWODKAu1fzKVLhgekzmC21fWU2hag2CYE=;
 b=20geHaVo2xfzPjxvQ1UnA6JMRYs+n1kUQ3kyNklJhCkXYrO1Zi1F3XOt+IOW+4rsaFEPSR8zubUZJYqe+wwa0T81ws6YYeqUM/UUpJ9nJykc9VBoO941zNqDXGCbKFgD6OWgjG0YQAevDS+bIso7xkH7T3QYq7OX5+KCXygyfnDEzuPfcMy82c/VGJnvMHSQfiCVNVCsQic/dmDKucs3RR7FWE/PLN7G3FYn9KJYdBWSSDDhxnmB2xtLB75QWSk36bWhTKFvLJ+M/IGpsfiJHIErKQkJ1N6hIimws0DsJP/hY3/nm/mgcp24bgPXnUft3Rb9JK516mDgVr/fOIRqsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1455139c-f1b3-453e-5f04-7e8adef1c0a1@suse.com>
Date: Tue, 12 Sep 2023 18:08:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH v6 7/7] x86/efi: address violations of MISRA C:2012
 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Gianluca Luparini <gianluca.luparini@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694532795.git.simone.ballarin@bugseng.com>
 <176532a92dd159f9b6d189139e738e1cc8aebcbc.1694532795.git.simone.ballarin@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <176532a92dd159f9b6d189139e738e1cc8aebcbc.1694532795.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8396:EE_
X-MS-Office365-Filtering-Correlation-Id: a369331b-56c4-4066-2f40-08dbb3aa7f24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jEMXaMnz8AWEY2rm6CrASxd4qP2OE/StVbZheceJ/Ezq3hkBxrGV+kFFD+GtF02cSuuf/niT8OZVf6hvPDAX+AWuOW9MDtfrU3VClFhdacVntn2AvASatb7ignXDIYDVPiqOB28AAjsx/SUmT1sGey6JuKXAz8FEAxaghkJGszUoL3KhfF84TvrkLqZ1jsaR//ms0WIMsCKENWnNopEup/IyTimJf8GNSo5Epa7J+68XJslAwVDe77hN+Rht837XPuphZD+c+Lp2xXtdqkQB6Vz+ZD4Bat/c4PNvyEABHs/AfXB2gH+yU3d6g6NSc2yIkNkCmsnODL/NDWgTlWJflDqjAHVQHd7OvtMQBWf7wirMYJwVV3yg6jmHfmDZDVqJhVWxZHftw4Xw8EcxUSxk53xpqQfN1OGSZ7bU3m819/3GaI+ZLiNWnh7YrhBoz5vELCQ4Ijo60iaYzFwvmsqDr6xvt9lGY3Z9mjZRz0100mxIzviXDIeAIm8UiepRTXnNxy5UDdf+ajr4OcS8oUcXkVV2ooYgZlQZGP5QuGFmDqE/A8KB6wTJOJOiGbHOqDFIRYB9IfbmAWIedzyKZ7Y6Bmf5gjsBazojRxg8QscxGYHo/Eb+qnKRrZKD50EbHEaAOBoDnumBCzd80w2CW8Upow==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199024)(186009)(1800799009)(6512007)(6486002)(26005)(6506007)(53546011)(2616005)(66556008)(41300700001)(66946007)(54906003)(316002)(6916009)(5660300002)(4326008)(38100700002)(478600001)(8936002)(8676002)(66476007)(31686004)(36756003)(86362001)(4744005)(31696002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0d3OTkrSkF0dWZDdUtJd0Z2RFlBb3R3VmRmT2V3WndscWFTVGp0cUU5cVBB?=
 =?utf-8?B?VTl5MzJwMVlXYllhRjRRRkxwRkNXL3B5MnpNcnhWRWNOL3FBdmZ5SnkwZEh0?=
 =?utf-8?B?UXArYTFHcnlJQ0UwTVVuVGRKOS9GRUpSZFAyekRqaityK1A2c3lMcDZOYzBy?=
 =?utf-8?B?REJtOGtWWE12eFgwTXpZZmw0eUtwQ2hOaVVtK0ZtemFRQmxUUVViWE0zQ3VY?=
 =?utf-8?B?VmtqMWhjbUkwQTRTMGpVVWdiR3YydjZmb1J4Yi9PMTRuSFNJSUdZSElCQzF3?=
 =?utf-8?B?TllIUE5CNVhkMzZuaXFjTmFrVERGbWE1RHNBTFZDNGJGSzdoZ3dYeDBxZlhU?=
 =?utf-8?B?Y3RtTS9JT1hodC9jc0pUNTZNcUY1eE55a2ZwazB0clZyYVpPOUlrOTdlSnNj?=
 =?utf-8?B?aFVMRTRxNlFUYXNualRuWit5VDF5RmxsL2t5OUlmSElJZkFUYzNOazZqQ0ZW?=
 =?utf-8?B?aFZmK0J1OHgvdkpPZERhUnZpaW9neWFnSlZSNWRFcDk5aXdRWmI4ZDBmOWUv?=
 =?utf-8?B?TUpwWkcxRVUwamQ0Vi9qVm42RTNUSWlWbW1wc2x1TXBkVy8wTm5kTXNnWkFh?=
 =?utf-8?B?cFhOWENaK2ZDd2R2UE0yREZXNXVkQWdqTnBOaXIwbGIyZ01GNVhTUnQ5alFi?=
 =?utf-8?B?dVJud3l5a0lMRjYySDVPYW1qUWhzY0VoWGIwVHBGaGw5dlZGZFR3ZXdkTDQ5?=
 =?utf-8?B?aDE4a0dqKys1VHJtZk1TRFRBa2QwNm95YjFCU0tHNGcyNzIyK0JtaWdWMWxD?=
 =?utf-8?B?a3RuaVNUSmQySkJXYnFLTWdrWmZ2UFF1V2Q0WmNFcEVEOEUya2kxQlVVWCtN?=
 =?utf-8?B?QmszYjltd1RTOENNNWJEZnIvS3Q4YTByTDZxRE13c1p4aitlKytpWThsUmd6?=
 =?utf-8?B?MXoxUytTZGp0dEMyUUloRk1TczZmK2szTis0M3BLNGdtWlRrZmFoOWlNaFNW?=
 =?utf-8?B?ODNMUlgwcVZnL3djWDBycWswUlE0Snl4SFhEckl3UEZneW5pbzFQQjdWY2ZL?=
 =?utf-8?B?WFlnOXFrZVhzT0h3bnhueVJzamxkZTVPQmp0aExsL25vUUc3OGpSekQ0ajQv?=
 =?utf-8?B?UHJ6TWRiQjE4QkpyK21ZQVhIcU5YR21tc0ZYYmo5KzVXWk1tSXhGc293QUV0?=
 =?utf-8?B?cFR3RCs5bjdEUmRQMm8zdlE0ODh5MWlCNnExd1NoM3NBUnFYUHlvV0xWWG9M?=
 =?utf-8?B?WlpXVDU3djdsdjcxNWNuMnZURTdsaW9zNFkwZ05DTmp6WXJIRHZBdCswSDlD?=
 =?utf-8?B?Mlh3OHRMVG4wU3NMM3JGUkVXdjNUbitrQ0wwdHVpdVBIY1ZCejNUd2FUdXUy?=
 =?utf-8?B?RGgyeW9Ya1NrUGk5SUwzc1JYcEJ3SjhUbEpzdnV6UVNWNnNnajRRWnlUQkdH?=
 =?utf-8?B?MXgrWjMvSDUxSE1FbTd5OGxtNURHQUlPUDJKNHhJbngvUU1scmZtdGp6L21N?=
 =?utf-8?B?R2ZkdkVNK0lmdGhETkVtbW9QVGgyRWE4RU0vTlA5MkQ3ZUFSWmUreEJQNEYz?=
 =?utf-8?B?V2VpY1lyUWNBcUpJME1vS3o3YWdvaGt4UlBvd0p2cU45djZkdXhGNGhwZlRy?=
 =?utf-8?B?VnB4N3NubHRnbVRkaC9QdlQ1aENqRkpVdlk2eGtmbmdNcXczdUpsNkhyZXdn?=
 =?utf-8?B?UE01SW1GajRzY2p4M2M0clJqOC9zc3Zaa0d1eXJBN0pEZE9pYzhDR1owZE45?=
 =?utf-8?B?c1VkY3VQVitxYzM1YmtnQmxsZFRQc2xZNE9UOVhLMXc0VjNVN1FNdWx2WU9R?=
 =?utf-8?B?ekNyTC9WUGIvcjNjTjNMS2VOMlI5aHJiNTdhZGFsZ2ovUFVMSHpUTGREemx0?=
 =?utf-8?B?d2QyYUg1ZVdVMmNwOUQxcCsxamtFdEswQStZOGkxQ21PeWhUUGw2SXBHYkRy?=
 =?utf-8?B?bUNtOW0rcjQ3OTZ0cW5pRWJ6dU5Zbk14TEI3SlJEV0MxQmIzTXFjbGhydVdQ?=
 =?utf-8?B?U3N2di9UMnJhWWxJM3JxSU8xeDFwSXcxWjBKMUlhcUora282cTdhL3VseUx6?=
 =?utf-8?B?Y01Ba0VTS3JWdHJSNy8xc3Qzc3JqZ3R5WG15NzRwV1lyVTdPUDFsS2tFY0JC?=
 =?utf-8?B?TFptMXdtSTdMU2ZtVy80TmR5QWFyQVJwT1kyVCtNSmlaL0pTd21QTG94cEQ0?=
 =?utf-8?Q?PyRnodswDrIYIJoXvf9Zw5/Qm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a369331b-56c4-4066-2f40-08dbb3aa7f24
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 16:08:26.3065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: enHbef4JpsOWkAxFEIV10fAJ9s9hhUk3d7499VwlNZKkpPyQPqsssWULEp7tlQwiMiGz8ul3X0YTxhV+DmXExA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8396

On 12.09.2023 17:39, Simone Ballarin wrote:
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Addi the 'U' suffix to integers literals with unsigned type.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



