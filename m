Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0F37936B1
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 10:01:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596317.930164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdnTD-0001QL-5B; Wed, 06 Sep 2023 08:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596317.930164; Wed, 06 Sep 2023 08:01:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdnTD-0001M7-2R; Wed, 06 Sep 2023 08:01:03 +0000
Received: by outflank-mailman (input) for mailman id 596317;
 Wed, 06 Sep 2023 08:01:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SxG1=EW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdnTB-0001Ly-Lq
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 08:01:01 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84a70f3d-4c8b-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 10:01:00 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9574.eurprd04.prod.outlook.com (2603:10a6:20b:4fc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 08:00:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 08:00:58 +0000
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
X-Inumbo-ID: 84a70f3d-4c8b-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hcFBbnMl/ICDCIE9PV/EGZ8KLBGsr2+OIWEnkNLhl6Z8eXTe76cMD+wGYZgOKY3qq7sVDarubQmWGt8j6G5YF+ti2Voqu5vPPgbZ8vEbvXjAWj7G9DAmz/w4EqJeFrILpUZR6/mBCQF6sDDDq5nttXcd+K0TEvylietuoAyV/gCs4f8XVY9YpU00Vo3xwjz1gtntRi7lgZCRO5XiwL0lm38hZ16aPyLwCHaX1A5WULFz0G+bCtbufoxC9UP3fxx58aNp2pXVEyqr49lewxy9maN6Pwmy0X2Y9ejErTAFe+au3NRiI4vTfay3yHFgh9M2YNRvl6UL4LF6qRkQVH52Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVvUqnpUMebK4DgtpqZUlL/bKQ1dl3/Br0PPov3hBjw=;
 b=e1dn2zkNy5VY59Gk3iyT3b5gLD3sLcVaus42tl/AcoD1HiBxN4xt6qifp/4hE3Fs4e/zCOGtBywG5+mmYh/E4olPaMPj0Dkq4g+h9/C9q+SgaESO71PiNRR5YUDP8FijkoN4ZB3XUNt4jDuBTiMXe9ORoRnmOf11Dg1+lJ7dh2yRj/aXdUaIo2YZzJjTphT+w8jv/7/8ELPN0MOe1xUAiK5t/fJl0W/BY2naimZv6m8TCA6SUKNJvGEsQNZefejY6cQGuMPH8EN9jYVNavYu60fNPjxbx7kv7+IMBPlah9FTjDUKBa0fN2iWq291QRrfRyn4RV8oUS3kO9mcq8uK8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVvUqnpUMebK4DgtpqZUlL/bKQ1dl3/Br0PPov3hBjw=;
 b=RWScphPyL18EZ0o37kyHFZLqqDkyPZMwyiHmYtmHVPXuNKgpTHRPgivgqmMZNIYCfkwHjDqyjGG7ro4d74g238LDuFEki6J/1fb1vuHqU3f+sr17/GBJHOBxjxVj5YKbkOUAQk2oXQ7xAZ1CMg1EIOqAA86Gth4OeOuxrjwWMShvWOyGUHE42HtW95AcMhVAbfpxvklVEeEgC/HV/HmAUePrCcrAuk/g6vraiVCpssXY9ktRScFvxt5U/jelWaiCIsi2ut/Dh/VF60/nnVq0qe7uboaSm9b/eKHUcfVYQvzNB+vpgaIaa3d/jSOKtsDyxlVGicW5+RXfFNi4vYuxLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aa70cc0f-452b-7e73-0592-ff46c3727636@suse.com>
Date: Wed, 6 Sep 2023 10:00:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 3/5] xen/pci: update PCI_STATUS_* constants
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230901045742.235975-1-stewart.hildebrand@amd.com>
 <20230901045742.235975-4-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230901045742.235975-4-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9574:EE_
X-MS-Office365-Filtering-Correlation-Id: fc3b5a70-6099-4306-61e3-08dbaeaf6779
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VXwnlSWzXhW5WX69LZb4rXiICgg+2kgzfh7sZFtgFAvcFNlIISrd8TY3LnLZvC2DAHPSSbzrB0qcFcoWZJPjApg1ZJuqryFKcJrlao2DsDBc6O06F0jr3qlyWbfHmrPgwUHx3yNsgLlRrEofM0RRznjIihrkKeTIBGZFLQKAOhaLFMMTQPil/LbEnHS4Netwr/K2ukqrt8I0oUE/POuTMNbgmQ2HF1iwjbWOQ0NNtak5uWQ05hoRrfqJtu40KhyGwl6t/Y/8BXFYkvy8OPsl0VyNpxCyezFiXReozxJJGfN9OFpGXrx1pBtc6LTyaE+IEaf33CWKKekdDUcbRN3qV8GaEYMEs0n8vbHihX1B0pdvTTgkLKEyL+/xfxxcifmNz1XE3gbUht/8aqy4x0Nr39L7cyf+4TemEOv8LLXm3ngSPTJyhDqWtg16NRZOCdYUA55UrJOBhD6YkjePwmgNb4Z4S/eHru+v2T/AoM7cdYFuIhmyvx8+FqUpbyVlTw2jTR1/Ap5uuGNaZdQaRusy21qL8yh2vDdFlb1FzDzp75K7+85CobVYtJzZPEwuou3OlAaGZTaq9VortB7E24FEpxzWcy4TtlRXSbTEy+M08zM6lDIIAHPn9iuk5w0Ivl7DLiFIxxsNUxvkOogxLetpqQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199024)(186009)(1800799009)(31686004)(53546011)(6666004)(6486002)(6506007)(36756003)(38100700002)(31696002)(86362001)(558084003)(2616005)(478600001)(2906002)(26005)(6512007)(41300700001)(8936002)(8676002)(5660300002)(4326008)(316002)(6916009)(66476007)(66946007)(66556008)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3l1RWZHcFoySEZUZVNtcUF2bUF1ZU51SlErZE5DUVVZdFMwTGdRbWpteGph?=
 =?utf-8?B?MU9qNFRXaGhISFNsUkJhRWpteXhUamk4c0JKWjZIdWE1Y1g2OWRRM0dlSW9U?=
 =?utf-8?B?dnJCeTQ4azJJeUEvSVZNOFlFcm0xUWdScEh2RXovZ1gwY21tUFdwOUIzKzha?=
 =?utf-8?B?aDhGL3FvY2gxZ1VUQU5IVGtLa21GV2YzQzlpd1NNNTFrdjA1OXJQVVhKMG5C?=
 =?utf-8?B?akNiRFQ0QWs1NDBVV0padmw1QmNOc1BBd1BZalU1aU5ISmg3dGE0Z0VrUmFx?=
 =?utf-8?B?TlVza2xML0xLZXBHT2tUaUtyaFRxVG5PRlBMQXM1cjNoekliM3ZsMm91ZGtX?=
 =?utf-8?B?QzA0b1lvRW5pdE1nKytGUlAzOTFFaGlpRWxJTG82b2l3aGVvcXp5R1B0bUVN?=
 =?utf-8?B?S1JLdUxCcWh5bHgyU2ZDU244OEpZMXdBdXZuYUhpTklQVVRIckw0MlAvM1VI?=
 =?utf-8?B?UkI3WFNWeHc2S2ZzU1B4d2xkQVlhdlRUZUVVR2Z3Rll5Sy9CbWx5UlYyYkdu?=
 =?utf-8?B?Ym1qQUloQ04vSW5HWUVSZGcyUmZxNm9Kam9PQVpyWGZjU0dqQjFjYjVkM3Vk?=
 =?utf-8?B?MWxpN0VBbjJXdGFRL2F2SXQ4Zm9Zdmt6R3IyYmQwTU9zZ3F1elFXTUJVWGxo?=
 =?utf-8?B?Y3pWQW85NkVzVlBpTnB6S0NpckdaMFo1eHc2cnMrRWRUUFllYUxLc0h4VUtv?=
 =?utf-8?B?Ymx5ZHJNUlM2NVNFaHZ0SUVvZHl1R1VrSG1PeVh1QVQ4N2xGdHpDektxMUk2?=
 =?utf-8?B?UXZCb0ppcm4yRkZ5bXc4OHpUVitCZkF4K2hBMFdBODVxTkh3NTYrL1RpS0FW?=
 =?utf-8?B?Mk9xa3hHVS82UUU2THUvdzU2UGJHd3ZlZUZXUXNuTzZYdWpNNHFYSGkxVk9T?=
 =?utf-8?B?Nm9ZUGRYSzJuV2JMSTNKa3FKRlZpZnRWZ3FsZnFvRTFnK1h3bmpTL3gxZHFo?=
 =?utf-8?B?WUpESnUxRndDbmNCSmt4ZW11M3FYUVlFUitOU05xN00wditXSU02MTU4bFZm?=
 =?utf-8?B?TXk4Z09UanpHYnJyRzlWVWIvU29URXBOd3BuNVJxZEFtNk9xZThCWngzMGhU?=
 =?utf-8?B?SzVsN0R6eVBnY3lpZG9oeUtCRW1KRERmZ01wNnR5V1I0TUNDdGVJSnA3UCs4?=
 =?utf-8?B?NjRNZnZDL2l4SG5mSThCZlUvUWR5WnFCZVltcmxwNXZkUy9yd3A4RFNJNHM2?=
 =?utf-8?B?bVVvRFk5bklQRFNuWlNrTTk1Mjk3L091bjAzQ1AxV1pXb0pKKzRxc2hnSTA5?=
 =?utf-8?B?VGFEYktyNHNiV3Bac28wVU5hcGw0MndWZGtuSWl6Q3R6K0duMlVRclhxMndR?=
 =?utf-8?B?SUJVYWxQY2xhZ2UvSWt6TFVtQXBSUzNFQzYrT1Z0MmhEVkxRQWlJL3kxSG5I?=
 =?utf-8?B?b0N5S0NsS0t6bG5Wcjk5LzJVVE9aUHBwU3lmY3lNODlDV2graGVKQzFiTEN5?=
 =?utf-8?B?bmc3Q0dRUURwMU05enY4emtRUXNGSkpEZ2lRQWNTeFFWMi9TQnN6akc3UVRn?=
 =?utf-8?B?LzNER0RwWFlDUXhFUVRTc3hjN3JDajZ4c2QyMUVCZEFmVUdMZWlqbDZXd29T?=
 =?utf-8?B?QjcvS09OQ3dRdmx0RjduZ2FWWnpGcU9wSityR2xUeTNXVWZreWdlV2Zack1S?=
 =?utf-8?B?RmQrMjdVNTk3cTRzRjdQcVE3ZEMxY1N6YzBPcVE0VXBWbXdHNTRGM0JtUUhh?=
 =?utf-8?B?cGNiMG02bWZSaWxjZkMyaEFLRmJSZThhdGtZelMreGJWMC9oREJ2Yk9nS083?=
 =?utf-8?B?UDhVbmhoTjhMNmFtOUFHQkFGc1p6TzVxYmlBdXgvdWkyaFVVbGtWN0oyUUFj?=
 =?utf-8?B?TlZ6UGVYNHhmaE1TY3Y4blFLU1luVVFWa3p4VUVOVDJncFRuVzYrNWd3WkpP?=
 =?utf-8?B?SDVaZlF6dFg1c3BFdWRzejBwQmplTEo0bDhkUW44TEZ2VFBUeWpIcWR4d0ZS?=
 =?utf-8?B?OWViaU5rZGtPOFVBbzR1aVNhSEltSDBJMURkMjVhU2syRlo0YTRCL3hZQkVr?=
 =?utf-8?B?QTJOaStPaU1qRElaNlovcURsT1l2Q1JuN2c3QzdXUHpJZGNDd1RLYUlyblJO?=
 =?utf-8?B?V0lxTFRubW9iZlVqOXczbWJTdWdJOXJFUmFkSXBROE0wU2NQUkFnR3dUayta?=
 =?utf-8?Q?w5cu6Qc6298vQxFZfSkuurUKG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc3b5a70-6099-4306-61e3-08dbaeaf6779
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 08:00:58.5752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vwYzKtTgsRRoU4BeZGzlmKTS8SLO8kjWF4g4RXV+rdsK18zRua5YGDNHi2efVSW92u68CPJtrui2KvU7BRS1cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9574

On 01.09.2023 06:57, Stewart Hildebrand wrote:
> Interrupt status introduced in PCI 2.3
> Immediate readiness introduced in PCIe 4.0
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



