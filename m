Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 257EC5FE951
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 09:17:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422485.668544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojEw0-0000Op-5N; Fri, 14 Oct 2022 07:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422485.668544; Fri, 14 Oct 2022 07:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojEw0-0000LZ-1y; Fri, 14 Oct 2022 07:16:44 +0000
Received: by outflank-mailman (input) for mailman id 422485;
 Fri, 14 Oct 2022 07:16:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F+Di=2P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ojEvy-0000Ky-2a
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 07:16:42 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70055.outbound.protection.outlook.com [40.107.7.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25dc1d20-4b90-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 09:16:40 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9452.eurprd04.prod.outlook.com (2603:10a6:10:367::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 14 Oct
 2022 07:16:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 07:16:37 +0000
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
X-Inumbo-ID: 25dc1d20-4b90-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uuv7iC4zqaTKCf8fAfcDen3d4/EJyRDIRHWRExSRbTwvbn5Bwiw4z7M051htjH8yVEgo5pUKZ7n5CYuETd1bzb4G0Sd1ZZve24vAJMYhf5NlKkP5f8WNZdACfW79xsDf1/liUMj/T38Q15fx7Ix08NwCL+95Ch6fyg7j5Lb2E7XxaRKV2KI2Lin/Jpm5DuHZvhlk6CHmytttb+GgBwx+qUL449M8xtbuDP2qV/uxzJ9SzeXUBkXWXb4SE8eZnTgFVZ7vuXvBl2u+nURDqUtHnLdvwjCGhpR91A1BbJmj30W0hn7ZgBz1G+mSpBAoCYJn6fKmBxSWlqtNn+m0ae6S9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fz4UN0Cnuxb/BfFeNdsBtbD6w11fgvQFBiLcoH1yywM=;
 b=XRzheaQWmVrqP0GinWWnjPXIf8Z4Phb5JryBMEw9MX32SiIJdJDdICzygAeYnBn5IhTg/N8q3kGm6Q1VDMvQxCzWIKxZcgkwu6tknzrRxzm/MdwJuo6rTRgrDIkG26dr/U+i3fq6yjuZ7UtOyoPoMNPkArb4Bj6hD/UZI5BFB3ZR+wFFM38F/XzHNMU4ZVRP6aGyB6XSZR2916q7oDyYQ4cPzEid4EQnAYs7SuZr1r2nEnRUB46/MlxJOqcWLHjE65qfByq4VNRdcviFH0ux+T5S9K4POSLXV9hPArDt1YIF5ctPOJWta0HWnErFJNQP1kzw7SNShB1IAf9YtR/OWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fz4UN0Cnuxb/BfFeNdsBtbD6w11fgvQFBiLcoH1yywM=;
 b=E1feUjD23aJmvZUNu1sFjnDdVOZ9xH7/EaY/d89roGBxcskYhS8eh3qYNo2Z74Y4zXnLPLwakX/VsD3ZpH9tEtlP1J7m3K9Cny6F+765XOJpX2FEiD6saQ1ZHToSlrptMOLACsxCXrCEyW4aeiNE7gQI0Peww+JRPsgiAVqvv6hCSb067irx119wE/OcrAu299rtturyAGR8bUr1aGWQ+ykoXO7SqPYLCQif5g72lFuZp+wsE7eJO9v1T3GgzQjjThW3ib0sSmOM+aJ9MHm20Hh4C4wnXqvtFms9sowie473+QJSkcaA3WpXfbIrP5Yjuim6Bou44WHnC0/1fN3fdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0ade954c-5741-754c-fc59-177feb67ddf4@suse.com>
Date: Fri, 14 Oct 2022 09:16:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH] xen/arm: mark handle_linux_pci_domain() __init
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
References: <20221014025354.30248-1-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221014025354.30248-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::31) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9452:EE_
X-MS-Office365-Filtering-Correlation-Id: e21ab535-ea58-42d5-411d-08daadb40893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	APJXQSgwkCDyLZlP4UNrTIo4EcW/Akto5Y6aoTLw2frUcRVPTZLTsW2e/AqAS9UN/fgBizsybN+/R5V4qDKAW54ylFvVUttoi2oW+Gz69mERg4RLt5dTCNRxWfh4O/Bt12dB6ZGOPluhizMN/MsedEFC0WtXoiAGcQA7yIJGEGSrqHTaAFCjo/x1G6jBAG9nlfiuPsBuPQFSeoOwD/IE02jE6O8Mtttx1sCVKsvsP46prGJIoFZRBVZI5LvEKxfDZGF6WRkrSVrxq/2FuChvg/C1krFsDQ7WtWejRiGkKA4YtwP6Bqv5EGL7M2fng+ZDlUxSWQzpF6eflU/neMhmmHDCxMVMLjoJmuMkHAKqTWtEOYVruOBCwdMQytBj3Qr+0C3CfN0nMrh1hfGa4F1oT0nSsQsYhIkIayEhD6V68ZP60nZdfwWdduWIMsDiPgeY/Fokmj2kM0NxBW5U9nA9Kp63Un8H+rba3cjyEAz0eTj97bLHFMq9irQYjTp317Un3fDNXOsoa3Kr+kxZhhxe2NtdvSXr+WuzMcsZ5Ww3+uqvYnp/sAwantkjdWt27UcPbwmSUETQbCO/alTGOhzdGfd1t/uCliLrQbUHKWpTOkMwM4dDeCBoW64XR4yFqksmgVxIT6CB73mOI7NCt2fGlUCaqI2Xy0GMpZ6Ks8f6gfQtTYxrV860xDC557AVSXh4f5aIhR5yJRWQnExES+HLHVOlysRzwnxshtu0YmIwIwwTBEh7Hh8oqN3hs0MchxqgSyFO8dZPm9Iif5/QewYEuNdkI5wFZ1VDoEUhFSv3zO4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199015)(2906002)(66946007)(36756003)(8676002)(4326008)(8936002)(66556008)(66476007)(31696002)(53546011)(26005)(6512007)(41300700001)(5660300002)(38100700002)(558084003)(86362001)(6506007)(2616005)(54906003)(6916009)(186003)(316002)(31686004)(478600001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXNPemxabFFpbWIrcjNVcmhvU0F6TSt5Q016eTJoanBOWU1ya0NZWG40enZa?=
 =?utf-8?B?c1VJQzZpSHYwYXNmVjFtVUVscGd1ZUZXU1JGT1JZU1ZGYkltc3kzcVF1a1c5?=
 =?utf-8?B?aS9EU21aUm9FekgvL2RkQXlkaFZVRjdYTUw5Yk11SzZDSVJKN3ZZaXZGLzY3?=
 =?utf-8?B?TXpjK3NUaWJkTUhnUEsva3RDM2hnTUwyMFFnSTlpVkxsNUUzTmlWNWhxQlhx?=
 =?utf-8?B?bHRjOFRYaFNaOVovWmlmRUNsa1h4d2dWZ0RJdzVtTEVTVlFsc2UrUFg4RWRH?=
 =?utf-8?B?TkdnbkI1Sk9Fem96NWZxcnYvTHY1akwwMENMWnBnMHU4VjBONUVSYzBObnJo?=
 =?utf-8?B?Q09DdEM3c2JxOXNrRHRXdlhmMjRPeDduTG1HTUt1Kzc3cEt2am1yRTV3Z2U0?=
 =?utf-8?B?OWttMk5nVC93dzNmRWxQYmlQRDVmT2cyb0VVNFNYOG9GajNEZnVGeTZNcVZ5?=
 =?utf-8?B?d1FDSnEvRVJKK2JleCs5WldJZjhHeUJEbnd6b1pOY3BIMlg2bytWZU9NVFg1?=
 =?utf-8?B?TzZ5Sk1QYytIVlZrbW9BeGUwNUZ0MndQQTlWSGh5aTRDc29oSFJuUGJ2c2JF?=
 =?utf-8?B?UUhJTlYwc01uV1hSVWplWHpMZmVwcW9JdlBTOWhMMDJlbWsyRlVUaVV3U2hu?=
 =?utf-8?B?dENXekY3N2ZHRDFaRFJJSVd1WFF5bW9LUjdROHpjelovTWFTT3dWN242bHpM?=
 =?utf-8?B?azdQcjN5aG5WYTB2SU0xYmtxQldqU055U29iY3czeWVhZ0pXSytvQjZwZTBP?=
 =?utf-8?B?RTlvbFd3WDBxeExUOFk1Mzc3WnJqMS91blhVclhYaHVIOWNhMHBLYVYxakx4?=
 =?utf-8?B?U3F4cGZRR01pZytVaXZKb1daQnhNd2drOE9QbVZXN2pYaFRmbWdkL21Gd3Fp?=
 =?utf-8?B?eG1pNkVOMlJnSXAybjZNaFBJNW1lN1RieDkwYm9lU0hmNzRmNXlSUWRwbGxS?=
 =?utf-8?B?NDZLSGlFN2thRUJQdXlKREc3S0FOKzJqeXh6WnJ0RHlBb05OVEtiNk5yc0ZH?=
 =?utf-8?B?Ni9jTEJFd014aDF3RnV3Y1VrUSttSGhTZnBqemhEaDM4L0x1TUE0S2djdkVs?=
 =?utf-8?B?NlZnaUFtSlZ6eWNwRDlqb0tOZzVST29WcjZUNGZHUzFYL24yYUFMUFM3NU5O?=
 =?utf-8?B?WS9OckhDcFpCZjg2MHNDU0NsZnBuNCsrWk0vaE15cVpPN2N0d2xhU1BEWFJB?=
 =?utf-8?B?dHdsMy9PN3drSjAzaDZ4S0libzljMU9oNER0bzE2RndGZ1A2cmRkblRrbVJw?=
 =?utf-8?B?TFZ4TlhCYkozNlJVa1ZBc3d6TjhpQzJhVVgzVXZUa3k2WUF3VjV6UnJMWU9o?=
 =?utf-8?B?dkF3WkNKNFJMRGhFNnNTOHNjaTVpNFZhQ0VZNHpScXRoOHNKTHFQa0pYbU5G?=
 =?utf-8?B?K1JUbTFqcnRtdjR1dVZHRHUzdkVLT3E5SzgvQUFtZ29WdkhtWGdwK21aTHFL?=
 =?utf-8?B?MzVBZ2FDVndEdWdiMlNEMW9jVEhocXhsd0RWSHZzUXF4R1RTLytoNTZMakNN?=
 =?utf-8?B?dXhFOXIzbVZxdVZqaEFwMmxkYzlsRE5Yakt1VCtSTjFCSGZmU2dFcTZqWTlw?=
 =?utf-8?B?dXdkeW5INEMvMWVha05sU3liMXIvSmVmUitydEtLdEFZbHF0QzU1ZjQ4RG1R?=
 =?utf-8?B?MFBqanMwRXNacmlEc0w5YjcwbHFDcUEwWTN0bkg0RS9CLyszNDFQUE5HMWVX?=
 =?utf-8?B?dHB4eTJCRmdUOHNQY21jVG9XanEzeU5QR1RaL09pOU13TDlIR2ZpOHhsc2Yw?=
 =?utf-8?B?d0N5Mkp0WGNEWittOEk1V29SbE9IUVhvQjlkclZ4R0ZNMEVycFBmRHRWUVMz?=
 =?utf-8?B?L3o3ekwvL3J5TUpyNHVPTVZrT2hkY3pOeFFWek9DaWVjT0xLY1h4a0ovRCtm?=
 =?utf-8?B?ZmRVY1hWUnYzSFpZdXYvZDVldzhlcTl6VUd1OEdyWUMySWd0a2hkVDEvYXU4?=
 =?utf-8?B?dGh4eE4xbEd1dkQyWXVlaVp3VkVDZ1dmaWUyN3pzQ1FkYW03RWhxQTM5dlNP?=
 =?utf-8?B?ZjFUZ3lacFFNRGp2MDdQTXBSOGM4WUE1ZnU4MUtMeUg2aTdzRmZxSDhtUDdw?=
 =?utf-8?B?d3R5R2Noa25WWUtzc3JWWnR4SENvWWJFVmtEekdDYmFvNHdXZkJ6WXlhNTNZ?=
 =?utf-8?Q?mkhTRBV0QTC+wx3A9bk3T/5S0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e21ab535-ea58-42d5-411d-08daadb40893
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 07:16:37.7651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQpEcAQIZab3gLFPFgdpso62kJTY6AFSkXtQMc3/28zDdlv1tR0yTt9D+XKdBTX7VghXdMLgqgn+50J4CDe4sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9452

On 14.10.2022 04:53, Stewart Hildebrand wrote:
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

I guess a non-empty description and a Fixes: tag would be nice.

Jan

