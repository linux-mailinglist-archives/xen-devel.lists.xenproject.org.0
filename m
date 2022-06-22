Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EFB554A66
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 15:02:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353863.580858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3zzj-0005p4-Na; Wed, 22 Jun 2022 13:02:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353863.580858; Wed, 22 Jun 2022 13:02:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3zzj-0005mk-Iw; Wed, 22 Jun 2022 13:02:07 +0000
Received: by outflank-mailman (input) for mailman id 353863;
 Wed, 22 Jun 2022 13:02:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kzGk=W5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o3zzi-0005me-KX
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 13:02:06 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130053.outbound.protection.outlook.com [40.107.13.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 836f06e2-f22b-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 15:02:04 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7597.eurprd04.prod.outlook.com (2603:10a6:102:e0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Wed, 22 Jun
 2022 13:02:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 13:02:02 +0000
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
X-Inumbo-ID: 836f06e2-f22b-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ME9P2woINjOebr93xuRszgsiubPmbObpWkafEk9ofJLqPSlFFPbWrwxqCoClz1cLp4RAcsNCXMWCaMMMYc5bkZW/nAwVLaWS+cphiScQRIaLYpK9iNhMQr+EG5U31H8lwsMSRqEOOcMx5ENiolq0yk0gJeBsr8pRaJBbbqMgu/Ed6OEC/zSh+15JLTRcjBf7/wJ7/nla5hQQ3xWVjNhXWMyDdeJZqWEjZ3rhWw8g2t/iyiiETBxuiOF8Bkzh38vu5RGq+JF/MMoNSDOM+YPebYALFgNXi7Csf8YKspYkWtjQyIvrdC198jir6JBv1slTDiitGTPM0DJV6aPEAzOS3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBj2JPc8UpYI6OEVt6nbuwqcrZmOnCzFbEe9Osq+8Hw=;
 b=Hrmbf12meiE3cEm3Qm+hcrmj281qVyHuz1wSq6cRymJUaRGSwPQFoQ1VaCOzfib+wuyXk5n0KIRM9TF74xOBp6hurjKKixWyVJzV4xvhgbot5uZFr0IR5f7BxkBU2S3+Kxh1HUgf5MtroeWxpQpbgT/0T9otYmWXyQ+xL06808NwUdSNO2nKVyI2UFDLuJyMRYMtpnBwwIATpR15v+qRRIISY9vcvFGInUSXYNzOnYKsFwVpAxVeSO/xRJOCG/LGSOnR1IhSOkIBbc6LkYWafk2U28sLxWfVLzVNC4s778Ids64hBhwp2qwXAgRH0bxy2vVqrLSKCX0uybFvnyo9ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBj2JPc8UpYI6OEVt6nbuwqcrZmOnCzFbEe9Osq+8Hw=;
 b=MmPqSPWSqAu5cypUxTEnj8QlGU+xWNPqw24AGMMV7Uquk8DElnsy4EmicW1gH8miv0o9josDMT3HX5EjULfvAe9wZ+rqsXmMRll+UDSDFzpKByo1rMkmdrC/zH6/oqB1fbZZnBotYT4qkTeOnVpKn+VxlxHeEHUiWB/6DaUP+cFLbbBVQ1NRRSJAYzFoLSq55rbmpciCfjvTnBjQsb+x0XXbtD0Pa2pLIcJ4wj8/TNnz7BY5GOTkOf0iCGi0MTwO4Qv+JM9DbwSYW4dY7C8MGPyPYnWagYggH8jhC8lxtVBiTv4kTdtpsvDxUWsdyhk2ufReNdtghJwPLXnHQHXcJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d91bb4ea-41be-225e-e2fe-1b03aa06c677@suse.com>
Date: Wed, 22 Jun 2022 15:01:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/9] MISRA C 2012 8.1 rule fixes
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20220620070245.77979-1-michal.orzel@arm.com>
 <dd016e82-2480-0e1e-6286-18b2f677dd65@suse.com>
 <74ec2158-3d19-3b2c-1e8c-fb5b30267658@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <74ec2158-3d19-3b2c-1e8c-fb5b30267658@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0036.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::49) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 435717a5-1e85-4032-9c33-08da544f6624
X-MS-TrafficTypeDiagnostic: PA4PR04MB7597:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB7597657455C7BFE8ACEE6C57B3B29@PA4PR04MB7597.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dqA+JvKXJHpMTEQCgAGeEULDcLoXmiGRmuHfE3ObzT8yCu/sW2P8XWQZw95B1eY7YlgFCo9mkVnAa7YFBXMwD1yuSNo9sGad19sb4JPCCKYteHuFC7jvzwhfnzSyKffda9K4v5Qv5YGRKKCw6QQq+2a4E4gEyDGo/bWs1UvluaDV/0egw8dRSb+4HzSZV/qpf+rBGs2CydoK/E6kf8oa8NvK1maF29l/Qj4UvoZ+BqGWzCzNcaFcwxEonSW2zQ+YNt/Jk+a20cpuTpODX8e23HGVoQN80Vp4T00tuLjlEvK67PiEHz34vrF+R/E/oAxyZCfnECjcUJ4itk46lH4nY619ckbnwOzeUuFWA/ozBMuBJwJ2BLcdrNMExSnEL739Udfu4RRlmFfxx8lWHhUMJd226fhxvu7IT1XiU5q4WDoLqVew2v0WZEe/k27FYKze+NyRwgy1Q0q+tj4tTcQFqOODS4gC/lRVYG6Mq25qisy47sMWeGUR2Rz+EaSinZA9uQYfi2rnUjeO9eZtDZTBktvvWyfbGGQ6jQTXrrQKhzs7DVOYlF8Mym6lKzKL4+tIivpQr7BFCKLjtooJ7glNBX/fozWse//N2HNPyoPz6b9tUkJbS4AQOVOIYl8+4jo80lHUSLnm/eapiUQS+gQCRoJg4KbzEBtoWfHt5/NzMBr05FsBubdA1xPojhK94tQpPeN9Du+FI/nNuda/coYfBHGIgCRkZnNK7TQrzS1sCwF+24Onub6iDwR+m4PJnho6Zf7jjgr1X3zrULPfn6pxHSbKfKFtvIJksYvb3Rvv3C4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(39860400002)(346002)(136003)(376002)(5660300002)(7416002)(478600001)(6486002)(8936002)(31686004)(2616005)(53546011)(6512007)(38100700002)(26005)(31696002)(6506007)(86362001)(83380400001)(54906003)(186003)(41300700001)(6666004)(316002)(2906002)(36756003)(6916009)(4326008)(8676002)(66946007)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1V6K2p4RGxRbDNzSmVwbTA1SW91cjI2c1hSQlo3bXdLUjhaOUphMm5vaUxV?=
 =?utf-8?B?aDMyaURVMjhsQk5BWTRIcnBtWDROYmduMW9Ed1hKcXg5RVQxNHM0TmFnRE8r?=
 =?utf-8?B?UDNPdDdaNmFWYjhTQ0xtbmxNdld5ZHZrZEgwczJFWThuWnlRVDVaSXc2N1N0?=
 =?utf-8?B?bEJqbzJwOTh2bWVQbERKNWVsdXRDb3k1RGMwWEVub0NaVnVNYmdnUncwUTZX?=
 =?utf-8?B?ZWhtOGFWb0FYdFczYk83RlRhK2twNHZYTC90d3NZcXBvVEoxSDdPREs3eG9X?=
 =?utf-8?B?REtZU2wyN1lMZ0VhZ2dKVXQrVFduRFM1eEhCUFFpUkxyUG9NL2RNbVFlSitB?=
 =?utf-8?B?YzZNaUZ3blE2SUpzVHNXTWtkaUxXNXJIck5jOWY0Z29ESDdmTzNWZXUrUzdx?=
 =?utf-8?B?a3pRTTdrbkxtR0IvOXdGeC9YNkNwL3Jhd3pXYUtMd3RqcWtDSDl1bkpyeDNW?=
 =?utf-8?B?TElwcDBFb0FvUXNhYjczNHF3QnVFb1BsY0VqR1BKNm4xZ0hUdUNIVUtwRTZq?=
 =?utf-8?B?aE0rZjVSQ1p2dDVqSWNpb2VkZnFHWk5MVkg3UlBadCthNVUyQldhQXlCWDJI?=
 =?utf-8?B?TFhzK2F1L0VyTHdmcFIydzdaNnphNW9xY0grOGRRd09CVGwvd2d2d0I4c2c2?=
 =?utf-8?B?SS9mR0c3eUpUZUlhL2taVjJMVHlUTG90NlE0aEVnMHBTa0w3T1NrUkJvQm4z?=
 =?utf-8?B?N3NxYnAwRzJBMmowcW0wUjBNek1icm52UWdZaVJsMTAzc2hRQncyaWJxRnl3?=
 =?utf-8?B?d2NwOThOdmtuOTJtV1dNNUpQQ3VmZ09GbkRDL0QzZkp4cGpLZUx0clNwWDh1?=
 =?utf-8?B?T2NuM0tobldrSEtaWnFKYW5LbUtia1lUSTFaNVUwb0pLaG9VWU9tSWhRNmlr?=
 =?utf-8?B?NE53MnU3QWZVNlhWcUJSRG4ycGxhcDN0cVBwNVlGSm5BWTFKYW40TlJmQlBY?=
 =?utf-8?B?SzJvSUoyZGVoZVpYT09VanpxeXpaZVhRMlB1b2VXWUpJT0lRTVdsSUtqRk1Z?=
 =?utf-8?B?MU9UYzJhUFlrRzFQYklCbHA3dTh0WSs2Um1pT0grb2NyM3A1WGtrWHRhcE9Q?=
 =?utf-8?B?dENaREQ2UFdTNEpkUjBkTjF1WUcxRU1FelVqSy9ZVHpmbDRsN0NBZTVveUFY?=
 =?utf-8?B?bWI2UXhid1pYbVJHZXpYOFZVRXBnbkdpOUVpZjUvSHFuNmlWVkdwaHkwTG1D?=
 =?utf-8?B?ejlESkx2ODN1ZmtQakRCVVcwL25JR0lmZGk2enBDR2hZYjFpV3hzSXF1dXFK?=
 =?utf-8?B?UjlCVTl6UVV2VGtYOW1aYzBQblVBWXVaa21lbmZZNFJmbWE5Sk02bE9mSWVF?=
 =?utf-8?B?S2pweUpDOXZmMHNJS214UzVueTBsRURiNWNLUDlYOW9YbXZsZHUvOU5oUWlD?=
 =?utf-8?B?ZDFFKzFNWlVSSnh5Q0RKd216ZjhLeXhRUVhBdUxkY3BLaDQ1NjBtcHFVNlRF?=
 =?utf-8?B?ODArc3NadjJBQ0lWSG5tU0NkLy9PT3BocHFVSVdTQlBzTjFvSGlGUlJ2KzFm?=
 =?utf-8?B?UVVMM29McDNrVWJBYUd1QTEwNG1HaU5iR3YwOEg5M3N2L2RoUmpSMTV1TG5F?=
 =?utf-8?B?ckJnS29HejIzbys4ZXdmMmJGQUE2RnNXeU1CbWQyY2dvTHpXNC9zMEpCUm9K?=
 =?utf-8?B?NkJRbU9FMHFqei9oUS9QL1kva2h5M1Y5UzN5Y0xKVWRJMEdlR1hkWXpFYjNF?=
 =?utf-8?B?WnoyMEI5SmxraWVkYkZjYUlrN0JSRWVPeHpsRFZFYnRpdExTaHdDNGRGbmFT?=
 =?utf-8?B?NDFJNUNKKzJYeDZyYzlHTlVtSjE0NGw2bytweW5ZWExocG96SEx5cHRRbVIz?=
 =?utf-8?B?M2RYci9PSWt4ZjdFVHFUaUUraFNHUUhPNlhnaDJPUnl1QUZRMjRtSVczazB0?=
 =?utf-8?B?b2FJQ2pUazFEV0NLcHRvQ3hleGwvUWNWSG1iOTI3RDRraGhrQnBEeWZWSVhJ?=
 =?utf-8?B?MWRwOFloY0w1YUo3ZkxCWWdUN0Vrc1FuMzk5MytHenBibXdYOWJzYXh2N29V?=
 =?utf-8?B?eGFNNnROVXVOSkhtRFU5UWhXUzJTYkR0ZUtvTy9rUkRLVkhZeGN1M29xYmlv?=
 =?utf-8?B?K0hZYzBLQUZBOHpINjNmV0xYTTd5VnVpOU9UUEUwbmZ5RjN5RlRoWUJwY3dz?=
 =?utf-8?B?RGdhaUpjNm9kY1NXeE1oTTFXeWZDK0Rmd1hCcWdNUUlYcGlPWTJUd0EvWDYv?=
 =?utf-8?B?ZEQvWUtabGZ5ZUxwK1FBY3ZzNDJUMkZMR0NIVllraXZ2eXZNUHVpZTdzaFox?=
 =?utf-8?B?K2lEK1N5Z0FYTzVMWkIwOXYxOXZ2UE8zM2VNTW5KYXVMUWVsUG8wTjNkMWs0?=
 =?utf-8?B?REh1Ylh4cFdzNk5GSTNZNFY0MkozT09oQmxSTXhBd0RsaWs2bmJiQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 435717a5-1e85-4032-9c33-08da544f6624
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 13:02:02.0733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5rh2H1EpAvCc3K6ZDke2ju9fdSPAydaSDyKj0VW97CyFSyfM4RIgS3APYdGhGVSF0Amx2JHA5zz7Bscwy6mow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7597

On 22.06.2022 14:55, Michal Orzel wrote:
> On 22.06.2022 12:25, Jan Beulich wrote:
>> On 20.06.2022 09:02, Michal Orzel wrote:
>>> This series fixes all the findings for MISRA C 2012 8.1 rule, reported by
>>> cppcheck 2.7 with misra addon, for Arm (arm32/arm64 - target allyesconfig).
>>> Fixing this rule comes down to replacing implicit 'unsigned' with explicit
>>> 'unsigned int' type as there are no other violations being part of that rule
>>> in the Xen codebase.
>>
>> I'm puzzled, I have to admit. While I agree with all the examples in the
>> doc, I notice that there's no instance of "signed" or "unsigned" there.
>> Which matches my understanding that "unsigned" and "signed" on their own
>> (just like "long") are proper types, and hence the omission of "int"
>> there is not an "omission of an explicit type".
>>
> Cppcheck was choosed as a tool for MISRA checking and it is considering it as a violation.

Which by no means indicates that the tool pointing out something as a
violation actually is one.

> It treats unsigned as an implicit type. You can see this flag in cppcheck source code:
> 
> "fIsImplicitInt          = (1U << 31),   // Is "int" token implicitly added?"

Neither the name of the variable nor the comment clarify that this is about
the specific case of "unsigned". As said there's also the fact that they
don't appear to point out the lack of "int" when seeing plain "long" (or
"long long"). I fully agree that "extern x;" or "const y;" lack explicit
"int".

Jan

