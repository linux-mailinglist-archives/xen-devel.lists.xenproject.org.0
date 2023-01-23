Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83208677E68
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 15:52:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482940.748756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJyAf-0003uC-Aw; Mon, 23 Jan 2023 14:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482940.748756; Mon, 23 Jan 2023 14:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJyAf-0003r6-81; Mon, 23 Jan 2023 14:51:41 +0000
Received: by outflank-mailman (input) for mailman id 482940;
 Mon, 23 Jan 2023 14:51:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJyAe-0003r0-Kk
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 14:51:40 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2040.outbound.protection.outlook.com [40.107.105.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7079880f-9b2d-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 15:51:38 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7773.eurprd04.prod.outlook.com (2603:10a6:102:cd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 14:51:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 14:51:37 +0000
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
X-Inumbo-ID: 7079880f-9b2d-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqJN31Piw5X6nWbpeLU7KI641m2lvGiT5YFSzuPD9TAebwOwOZQ+oz9RUxuVbHPzPdO0QdpGzjulcYCDPhh1MtDXAmDErXZ1YV6GGLi/irtd03XCX+oXHdWbjcoOjw+Ky4wWYpaQ9v+tJLLmA3fKl2j3KDJDGbhvqdk/GpgMgf4MmQJXcIZFIVfNeisw4oZg+aWHCujQ/Au+6cPbyoUbNqRLZC4BXeG1fZggX7updhOuCCFYMdTl3ln60Y+1yiix6BSfrBf+aNsWDOycnNIDfVT5CtJ0iZa3LlIJizIjyFRndBtAoFVeI41HTRPIld6KWeaDrfEEvI+KSnYxkyqpGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGqSe4Mdc/R6HXzv6T+Epa9rypABPXy+Qfj61MQdev4=;
 b=JpRuIsoG7pistEBLDpYqTzGpWsq37zHG1Ze/6GCmkTXd07Lm+ZfKiErK7AFaHNTS1MSamqjXZkISZWFU4H6LnRTwojQ/ybM4Kon+shwsEcMJlpnyROs8Zf+RUhn7Lf0ot/R1iML4Iqk7kva+Z5aC7xShCsffUzzJLlNY0DEJl2/lWZ4TOAP1G8w6qYyhfqxDmQ2dPYJQPf7lidBpIR9ld1/V7nZVDWYH0Qtc7+d4f6ZvPwvqKNEkvQg9j+mUyxCIMFDNP8hRPQQZq6ahjS0RJhSzNgYA6uGz6FRYW0Im7QY23GrclceFl7KxupxP2+HTQ1q3MVMOSR281ngfXN6FWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGqSe4Mdc/R6HXzv6T+Epa9rypABPXy+Qfj61MQdev4=;
 b=SmwStWRrtQdLpFcuEEAYp47/R2BlQ+xbdmx5C/qhtSVFX/gTdqlEo8BvY943uPcB6+4ugTTzomSKVhkeby+3yW0UwRJ3wPEbI/s0Jclc49UyPPb+U/K3pjshFSLNWgn9oWMUGFxDGcJ+0ud5s0uM4/lvdc2ovYfd83jg5GhFIUJfr/y7MdPbYz4ii8kytCsN6tbeQJJGuB0D7b996Tq/SvF5h6/VnLBJHqdj123jzqVNJFSVXKOtdGe2Jh6z5g7cnpfKhN9ELiAiPPf9ztL4+IXgHrKPoV+XtHoQNCtMpuvRTsxkb4NSTMN7wJ51bQzsNHNWzEJqs+cAejdC0y0sZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <33cd2aba-73fc-6dfe-d0f2-f41883e7cdfa@suse.com>
Date: Mon, 23 Jan 2023 15:51:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/8] runstate/time area registration by (guest) physical
 address
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: 14beab0c-d545-4aac-5f97-08dafd5153c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T9uEK8YRmzfgpqy8vD91+GQFo9YObhHlihUuQAIX6XrCg3P4RBxjanjK+cAC2s42h/IgsrXA6B7NXB+yDMCtahDFGDfVCgwZK7h4IerxjInzoscXYkXyyn6W2LAbR+9jsfeCBMGYH7OgepTqWPT/P7zEnoQH2+fdya6LDAM3xrmGi5XsjwTKbDtXminfvv/x74JfQXyS6sFUY+mKMW+I0u+Vq4BvtUGtHDsLsk0PF2mvWKVIr7pG5h+XaM9bG7I/CqFjlitX8eMmjVZaASFPJCqloY2rGcjCP8K9VFat1X29tUMJyMMAarpOBQL/fIKycAed+21kxkSWNyRZYoqsBUwpsD9ZXdbYwkrZevCr2glc9z/6SGvOJ7MiXs6UHt3Fwuzhi8zymn0sNtxItgJ5MVLnNYUw+Uoj3oI9Mhi59e8E07kw/8lsVcNBxpyqGT2JvaFUmE+Tqbx/k6G3HpLMoVmerqgxY6B4hnnBddJHh+Uv7ZWIOHMUrJc4D6Zbj3kWRFqc2iFaWz7nJvY8fSNR3uRNYtvf7iqolvdagq3mwhPqszvxrULiD74ibZXijNsox0WOMgxBz2gLKydWak5thpQ+JwkfSYbGOB6NTilkqA66FMe5376OrcpkpSYnUafLuClOne9wGX/ha/zNd6R8CPGi/iJVoOuWTDH7xs1Ws8I1fpROj7TizSt3V/cVdXE+bS90+t4XlDanOBMvj2QjesS8EPRfG6p5KuWy5hxPbS0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(346002)(39860400002)(376002)(366004)(451199015)(54906003)(86362001)(41300700001)(316002)(8676002)(36756003)(6916009)(66946007)(4326008)(66476007)(83380400001)(66556008)(31696002)(6486002)(38100700002)(478600001)(2616005)(186003)(6512007)(6506007)(26005)(4744005)(31686004)(2906002)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHRUQjB1elN0VUhXMHYxVHBkcUdHSEticXdSaDErbXZpbXN3UWw4SEt1N1BJ?=
 =?utf-8?B?KzJUYlJRY0g5cUtaR2NtWWx0SVdYTFpxYmExRm9pK1VRbEZDQ054MWQ5Zk1O?=
 =?utf-8?B?ejhTVnd5YmRyblNxMkI4WmFRQlNXQzcvR1F2UW1HSERuMDVsNG5xUXUwWUtL?=
 =?utf-8?B?cVJCak1TMjVYN3VtUTNVbXYxVHgwSDE2NEZiVGd4QzV0dTJ1bUt1VmR2a1RY?=
 =?utf-8?B?SU9nRlNHTWlhb2F1TTVwSiszT0podW9tUTA1NUlueDRNblk1NkMxbGd1c2xr?=
 =?utf-8?B?NzlaYkZiYTRka1VlKzlBclFYM21pS1VEdVVQa3g4QjNZQ3lIeW44blpsRUdy?=
 =?utf-8?B?NktJT2RyWWJsaFRvZ2NiRWtqVTlhTVRpZVZJYU1hNDR5VG9uZDNiKzgxR0w0?=
 =?utf-8?B?V0JGbEtWWWc5VC9UczJYVkp4QnlWQ3MxWkoxOEN0blBveU0wMGgzQnd0V1ox?=
 =?utf-8?B?OHE5Zk9nQldxbk91Zlp6YTgvMUdKWk4xUjB4L2hpRUVMc2dBYnlyOW5rRll5?=
 =?utf-8?B?TzVvQWY0aE5oc2FDeTg3Z2NHUFVBejdsWUJ2L0xYcERJWUY1UDVOZmYzNjls?=
 =?utf-8?B?NEgzR0FFMjRHRDBzQWRaSTE0ZmZHTWZQNlRUOWNoKzR4QUNYeHZDc3NNZlVp?=
 =?utf-8?B?Z2src3kxbFVLKzlqcURiUzBSbko4NTNUbCtSQVdUMVlVSHNENmRNd3hJMjBH?=
 =?utf-8?B?WTNyVWUwU0prdjZ5MkU1UmJqMHY3ckxBSWtZZ1dvM2xaMTRkZTV0aTNkUFgy?=
 =?utf-8?B?Rlp5dzMrRWRhZ2RNbU15U3ZCMXhPNDBWRjNqbGNxTW8vcXEwUE9xMWhMVmp6?=
 =?utf-8?B?elZaTm5HZXl3Ym43UGNXNVpVTjdkOEtJRWJ3RHlQWGpYaHpxcmdEYkY5Qi9L?=
 =?utf-8?B?aVR3L1grNmE2R2ZRS3MwQ3M5RG9BVjJlc2ZKT2s3eU80c09XODJ0LzNMbmtp?=
 =?utf-8?B?QzN1Z0thcVRzeHlmNnlRNkpvaDZuNnU0MmM1N00wUm5iN0pMSk9FeXdjdU04?=
 =?utf-8?B?TVdLMmVvWDh3YWRlcjJhU0dvK0dKREFLRnlhT1hLR2ROV29KYWp3ek93eGRa?=
 =?utf-8?B?bStvTnp3NGd3VWpQMktZVklhLzk4cEF4M1RRTHJCWWtic0RCSTBCVVI0S0pt?=
 =?utf-8?B?dGUyQk1VeUtEaUJnUHA5aWxER1k4WXJsZzBNS1AvRTFtSnVkemIrYngzMW9W?=
 =?utf-8?B?Q3Rvd3ZjWHRpTnFrN0JvV0VYYzNWQ3FyVFRVb3JDWXFCRGtHdjE3UW96OFFH?=
 =?utf-8?B?N0tCK29kTVpCR0NVUzBWTGhZRU5ycUZNRnd0dnZPWlp1UlhKak9zblJxNUx2?=
 =?utf-8?B?eUczOXF1Z2orUndTUGEzaFBPWXU4ZWhQSFVjQlVEZWJhOUoycVZVV2cxOGRR?=
 =?utf-8?B?NGhrRjBWeE9HYThxU0IvYVB4UGlwUTlGK1lOTEJwUTg4c3VIRzZuL3JQUlEx?=
 =?utf-8?B?b3RYNHJ4SHNjTWlMM1lpcDhlWkxWOWVDWjhZQ2lnWVdIanR3NXpxajdxRzV4?=
 =?utf-8?B?WU5zUWliaUxxbkNRbjZ5TzZ5Y1NXUysyREs4SDZ2R3RtMU10Vk15MVZLd2ZJ?=
 =?utf-8?B?NmVNQ0NzNW5CR2EwQTFPNklZNWsxRWNCQ1h3b3hmWUZtOFBwdHhmdGlYVmJl?=
 =?utf-8?B?clp6aDR5aFNidFVjY0l1U2l6bGdDdDNFQ1NObWd0QXRJVSsxV2N2eFdRS1dq?=
 =?utf-8?B?V3Zwc2RCMTVKZzNLWC9nVEhQSUFOanp2SkxtbjlYbW1PYWVqSnpvZjMzbGR3?=
 =?utf-8?B?VllSTUtoSWV6QUVNelg5N0IyL0VzbnNHd2Nja285Z0JpcEJJNktkcXBhd2RG?=
 =?utf-8?B?RnFWZGlzSWZZaTlqT1lwaFIxSm40L1BjNmo2cUIwZmE3anhiL3dVOWZQREQx?=
 =?utf-8?B?SkJFK3lsRnJMQWVweGNJYWg5cDRlMmppOGVXRFEra1ZIeUdiMEhUakc4R2Vy?=
 =?utf-8?B?dnZvd2EvN3lsa3NSTVJWNkRwRkZVS1dGL2pYcTZFdlpKdEF1bUJSM1JpV3k1?=
 =?utf-8?B?cEpvT08vakxaSDVBTXJialFGeXMrb2hjVVpXVEZDTnhCYXNZUlp0UStZcmNx?=
 =?utf-8?B?Wnh3bWlYY0hCTEV5UHVNdGdBRlhvRnNUMDVzMGFFbmw5WjQzUjhLSEpBLzEy?=
 =?utf-8?Q?0oco6WoUc4u1cVlM+l8dypL9r?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14beab0c-d545-4aac-5f97-08dafd5153c7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 14:51:36.8287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Za60HU3JVlrjlhlyzBBfFhSk3SCxZ8FV4Bbd8oCm7hwj3ohGiv+xGvlul2KNBgs2zo1uRBBC6wq1GP+w1FOg0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7773

Since it was indicated that introducing specific new vCPU ops may be
beneficial independent of the introduction of a fully physical-
address-based ABI flavor, here we go. There continue to be a number of
open questions throughout the series, resolving of which is one of the
main goals of this v2 posting.

1: domain: GADDR based shared guest area registration alternative - cleanup
3: domain: update GADDR based runstate guest area
4: x86: update GADDR based secondary time area
5: x86/mem-sharing: copy GADDR based shared guest areas
6: domain: map/unmap GADDR based shared guest areas
7: domain: introduce GADDR based runstate area registration alternative
8: x86: introduce GADDR based secondary time area registration alternative
9: common: convert vCPU info area registration

Jan

