Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B2764E7F6
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 08:57:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464186.722553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p65aZ-00021j-LS; Fri, 16 Dec 2022 07:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464186.722553; Fri, 16 Dec 2022 07:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p65aZ-0001yq-IS; Fri, 16 Dec 2022 07:57:03 +0000
Received: by outflank-mailman (input) for mailman id 464186;
 Fri, 16 Dec 2022 07:57:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=joxT=4O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p65aX-0001yk-Mx
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 07:57:01 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2054.outbound.protection.outlook.com [40.107.249.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38665333-7d17-11ed-8fd3-01056ac49cbb;
 Fri, 16 Dec 2022 08:57:00 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6999.eurprd04.prod.outlook.com (2603:10a6:20b:de::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Fri, 16 Dec
 2022 07:56:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.011; Fri, 16 Dec 2022
 07:56:58 +0000
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
X-Inumbo-ID: 38665333-7d17-11ed-8fd3-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKWrPlVuD8mqu2goCG4Fzuvj0ERXEj57ri/IHTKUEAuz6XGB+AD8g91NSNJ7K9NVaDDpqcpd0s2BYTsxkuPTwqF+t7E1RSSbmG3qvSpPCZEQCBcFIcCSmtAmVgoAdEZwGXmdp6VeFVAdpE4p3u+97JCJLUZFYfkiwiN7e6dXdtbnlOUhsxhNFQDIY50dNDAtORt1nfqlMdSlayqYt21k9e3NQmxMfQ2DeDo6E5SFkP/cSeEPxMbMRoNhwGCyZB6M/zjnevN4E3jQSyk7k2F/gi1FTgmzJXo3A9ADIt/DZgumkOp+4zUzKz23tDT2YreSx7yPi+PABZ7xFQI5l0a/+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jaAB8Yvc2Gsh7+hS8XZAXXH6pajRoD+28gBuIpJerg=;
 b=i9Py730oavvTG+gRH7pfM8vS6shpA7Bn0HMAYqxLFHFjLMdgortHR2NU/XrRwLDeAQ9nR1zwD3g3Q8ktlw7PjjM6gIQp+1uyATmTAyuEPIIly+y24fHG7iT0YGGDBr45FONYnW/yFtdYlMc6FyyuRTR6ATsdkLsGtSTuOP4F2HA0GimayPezgHrXPBxWXrf0jIo3gX/uADXWRZNogQOrq8CBe0nYJpzQsq1VwutQEwKU9685OMiM/lkXuEBkN6Q2A/U6APG1eVGd7fhWz1rUQfMJF5MOAwRPySpzEygmqjX/SRl+AIcj8EWWGZ60ySMt55iXNnIn9SORl9Fr+/aHQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jaAB8Yvc2Gsh7+hS8XZAXXH6pajRoD+28gBuIpJerg=;
 b=xyj7qijwAIyFSttkNLosJwQ8YSw1Wx7S9selwETBSc49/RWcjGWk3Wn0nyI+Q/3/GCeDAL04FSscZExvG89zulpOOgiqXK5BJBpmWH41INTumi1bVqoM66xON+nLCRwjySq7LsCKT52gVRX0cgHleufZZB30GgYzAp9bOipkTpiK7zTpxHqmwvwLO+j2lgqPuafBkmOutNNntEDJ+zpyA2U0kuU31QaFcWnJ7dn/99cYaVVIfYFvcV6+1d6f+OFox+L//DAxwtG7DwHZEtfhbRrqTpP399nqZ62CLgxFfVZpetZxCkeFcIBJryMExYnjVx1LIUwub4UAHcNkC7VzFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <93186340-866b-b556-d58c-5768b8258b32@suse.com>
Date: Fri, 16 Dec 2022 08:56:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [XEN v1 1/9] xen/arm: Remove the extra assignment
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org
References: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
 <20221215193245.48314-2-ayan.kumar.halder@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221215193245.48314-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6999:EE_
X-MS-Office365-Filtering-Correlation-Id: e85f05d1-b95e-4fdd-0c42-08dadf3b1b6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gOCow7OTYDydiZKe+RBsquFOFY+pnR9w751mZP9bQuG4+AYoUFAcblFVhO13B1lSKqEK5Ww3Gf0s3AI0rzXhESZM3I7ZAAWYaXcu/30MTzecFI+wBHROLwiyLMp18cmWhrUbSN4rh/yDLw+5HlZN9ybUaQxMC4d9D2UEf+liUhq889wB0DB0DuJi6YovcPH9AwUAWUTjXWUdRtaNNz6OT+irM8D4gq5xS5wUf9wnmMys9NtruZoXOpNwLsjmj/maA7VC3VQM7GsxB4aLEBVPYtHFZs2TeSDWwOlS8ZvPMQTsNcQrfp6NhrloHdznwRDZbAXXITbZlrWsCDB++IUj03Cxw4ek8AEDfQyMdpogFkCZ85EB2uRfplCP7596NWXf/4gFTpSdOlEZo5eoPYpe6ARHVKX7Tc/tfuA0HzZzr1Er30btGYfHvAMpthmdH9BrqaQg+YxVzpm66+XgZZQJMmtwW/WWp5KaV6Mng6VejsxO6h3FLcFxe3jlzBnmJ6F+w8eJ1s+hfuq8JjjKNi0hvaLsVQZPI8bmeEw1ua7vNFmdZof9zvKofGFRetQuz5d7lvMiR2WdXuZFst2AVpVTfYxfRSkzE1F5vTCwJ8a/QdGX4Rtg1PQc9DhJVdmiuIpxmmmtKZsW52uskPRl8lAse1f1/F7iCDCCGqG8BWrTQDgs5uDmRo9pgosFsVPdBT7b6KqryR4JHdxbBT8ZNFhFsXgfTNKUUkcRp2kxWgqF+Gc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(396003)(366004)(39860400002)(346002)(451199015)(38100700002)(36756003)(316002)(31696002)(86362001)(6916009)(478600001)(6486002)(2906002)(4744005)(66476007)(8936002)(66556008)(5660300002)(8676002)(66946007)(41300700001)(4326008)(53546011)(6512007)(26005)(6506007)(186003)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFQ0UERodEFKUEprYzNkaG91V0VTeEpSNkdhR1NaanhXcjJkcldHMGhwYVlh?=
 =?utf-8?B?TmphRXcvSnYvazIvWWs1TUJUQlJQSUxXVTgyOTNUTXFad21pb2c2VzNqTkNs?=
 =?utf-8?B?aHFRNlMrOXdMdkdtSGRvdjEvOUc2RWV0TU5DRXNseCtjUUFzTlBIbFRRRkho?=
 =?utf-8?B?bzFZejJDUmc0ckg4eXFWSW5DcS9QRVNpZHBuRFllVHNYa3NiM3FNUEdHMW1Q?=
 =?utf-8?B?SmhITmx1TjJ1OEpnOHNZZFNqY1hiQUdCQjJQUmFzdXFVbXk3QXZzMjUyYm1t?=
 =?utf-8?B?NFpIQlFjU1ZIcUtvTE5oam1UMEtVcE1VL1gyN25wMCtKanFJSVpHcDdUT2Yv?=
 =?utf-8?B?WXBzUDg1MjdHWFhKWjMreS9rclVPakl5T1BMOHZabkM1dlU2Qk1MWEEwQ0tK?=
 =?utf-8?B?eWZlMDI1MGs1cmNUWE1TUVpDbXZCMHZGUFI4aWxuUW5BTzdCOEVWaVM1VHQv?=
 =?utf-8?B?Umc4bGduYWNBVFBuVTZSWk9POHRVNVZUc0dDZHRYZTZZeDV0ZW1EeGwrcEpV?=
 =?utf-8?B?QTZGamh3UXROMmxvQzQzWWVWUHVSQ1RnWHVoZHNrZzVPQ1lMb29XTlJsV2Ft?=
 =?utf-8?B?Y2R6UUdXZ3F2TURMSnNENDU3MStPZXJNVFdKenByYnlMZTRWQzBVOG5FbW4v?=
 =?utf-8?B?ZGsyT1RiTktDSFJ5clVWYmdNU2xSNDBWOThOTytaYzNvVjg4VktWenFGWXdR?=
 =?utf-8?B?MlU3cU95NGYvdU9LaTNlTXBET2l6ZzZkS1dpa1hMWkFIRnYxRG8wcXg1eXdh?=
 =?utf-8?B?VEVTMjBzdkxWM0hHaTRKMjVGWEZ6ZjJIU0VWWVlBWWNnQWJXcU9SWDRLWXZW?=
 =?utf-8?B?TlNHR1RwbCtZZytDcTFIb0NIVG50UEVaL3hxclFBNXdnNTUwLzV5bld2dU1a?=
 =?utf-8?B?eDNtancxT1pGZnkvTTY0aE1UckhJUk51M0NYekREVldDVTc2Ty8vVUJwYVF2?=
 =?utf-8?B?MnA1WTZBSUduREswNXR5TEVOZGd2SXhIK3pnZXFobEJPQThrT0VINDFRZU9S?=
 =?utf-8?B?OUlWSE1vR0JqYmwydmsxV0FVYzBPTUc2bGxscGw3ekNmU0ZDNkJvTnZSY3Bo?=
 =?utf-8?B?bnBmUG9kWVgvVUR6amVWYk9aNVhvQnA4SkZybTdHNnVrb2g0ajJkdHdGUm9U?=
 =?utf-8?B?aXcxZkdSb3RydHJ0UCsySGNsbVRYbkhlaXJOYU1iakhPQmJMNFd1cTgzSnU1?=
 =?utf-8?B?RUxZZmlzQkI2RXVIRUdIbG5RRzQ4Z3Y5b3gxWHVLZW5zeVdxZVpLb3oxbXVn?=
 =?utf-8?B?VXFVRGxxekNEb1FjN2crZUNleFNmT1d5NEFqT2xkeVRhUkNLbVVlL3E3dGY5?=
 =?utf-8?B?SS9pSVlnN0ROdGJTeW9UaDNTN3J4Q2tNa2Y0bGJFcUlOMUZES3Q1MkFXNU51?=
 =?utf-8?B?bldZdmxFZXZtTEcwRGRnaUtVdGx4Qmdlb0ttV3dkU3ZHbnZhN0ZYeXZPL2hz?=
 =?utf-8?B?Z1A1TzVLeWdqcEdxSXpENDd6V0dJUGRROC9MRXg1VXd6aUZZekZkV3l4c2hU?=
 =?utf-8?B?UklRbjE2dUEweWlqZElKWDk0MjNmOHFYNkpXOUI2dUFIdC8xdlM0Tk5QL0JK?=
 =?utf-8?B?N1hwWjlIRFV6L3RPUVhwRENtVmM5RFU5aCtDZHFRbnNGaWNXanpuaDd2RGV0?=
 =?utf-8?B?c1V6N1ZQeGlDbUxRU3pPdXduMHhEQ0lIc1JMYkxYOWM5MGlqSUZvUXBHVWRh?=
 =?utf-8?B?R0dUSlMvL3dlQ2xFL2lnOGJ3b3pGQ29QbURjdDdLaHBXaDdka1pMQTNJRGlN?=
 =?utf-8?B?YmNGNWptbjNRSnVYWmdUL3BqbEZGYlNVOGJwZkNIMjh1aHZGcUxLU0lHMyth?=
 =?utf-8?B?L0VieFZuWGtoQU1pVGY1TDZzTmEzdVVGV2FTY0RuSWdoT2dOZ0ZGRldUczhH?=
 =?utf-8?B?VFNpM25yK3FYOXA4V0JYeVNyZ2k3VWZWTWlJZy8rOEd4alhVUmU5VnAzZTgx?=
 =?utf-8?B?L1J6cDZ2eGlaTlMwVEhmWFA5b1BnVTU3YXBuZVZEenVlRURJYmhoM3pnK1d5?=
 =?utf-8?B?UkVsYkFqZ3EvUm9CY0szSE8yb1JQWlUrd1gyWnFMYmFQOEVoS3IrcVBDNU12?=
 =?utf-8?B?RU0wbEFPaWhEODZ1RDl2cGpYZkMrcURTY2NRQzA5a2FTZ1I2NlJNaFZSdEhm?=
 =?utf-8?Q?7/P4bCrVUsXJb+dgYmLa96A+F?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e85f05d1-b95e-4fdd-0c42-08dadf3b1b6f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 07:56:58.4079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHPNLbfigRvAOGGrHEv/Ap0savi/yJ2BRH0aCmlGWsDSx/QEbnQFbjCmML2+9C6cTzmpJXo0uV13uwxdJWxaNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6999

On 15.12.2022 20:32, Ayan Kumar Halder wrote:
> As "io_size" and "uart->io_size" are both u64, so there will be no truncation.
> Thus, one can remove the ASSERT() and extra assignment.
> 
> In an earlier commit (7c1de0038895),
> "ns16550.io_size" was u32 and "io_size" was u64. Thus, the ASSERT() was needed
> to check if the values are the same.
> However, in a later commit (c9f8e0aee507),
> "ns16550.io_size" was changed to u64. Thus, the ASSERT() became redundant.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

With the title improved to indicate what component is actually being touched
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

