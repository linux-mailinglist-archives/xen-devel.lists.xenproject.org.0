Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B584377643A
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 17:42:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581221.909821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTlK1-0001zu-Sd; Wed, 09 Aug 2023 15:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581221.909821; Wed, 09 Aug 2023 15:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTlK1-0001y9-Pp; Wed, 09 Aug 2023 15:42:05 +0000
Received: by outflank-mailman (input) for mailman id 581221;
 Wed, 09 Aug 2023 15:42:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTlK0-0001y3-5b
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 15:42:04 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 487f7f38-36cb-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 17:42:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9446.eurprd04.prod.outlook.com (2603:10a6:102:2b3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 15:42:00 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Wed, 9 Aug 2023
 15:42:00 +0000
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
X-Inumbo-ID: 487f7f38-36cb-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hum0Fvogg6gk4P+QTUGJjJQKt1umYJkYLeOCuz9t0NyI3NTUMXstWYFbhTRdFT4SVL1GwnCscnNBGVKTj15Msa7jGirqc/4qtth+aX0uwhJN0OhQ5osIsnZsbrKaVhF0MopNoIc58E4L+8bhGajGOUjRO+sEv/5sIYTzQaEFvxb4DzcQuPe2GQM4Hj4uL6pXgrTJdtQnw2Fe3yiCgz1KZoo3xe9naFj4bCX4GK28W988N7RKiP2kK2REWiYx9szLEeztYeqS3N7bZz6CYfo6anHYwWkudP56kAlCgGzJDpqwRPjIRpJ7dzenyYns6b828Fgo9Y6Y63J0fIpOhWW4rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ik0Vxf42bfLbG418BKWRN8RzBEH+bI3LVPf5/4jUnGk=;
 b=b5Leq2PH28Jexj5mP8HBWK+PreMg/aWXiVgxSLynl7iWaE6LiWdZRG9RxkCXFlnlHKyzKQ1uLaDuWOupn70+/d39h7xQwEmFvDcF2YSOPlc37dJDsL4CL3aFqKyRWFDNJjjr4IAi+FX0hbEodzpE9WprKN8amN2iP52s5MQFDHwvYPLM5L/0uV+2urU5/h2709AR19N+i1k6lVpL3YDeZCFxi9O4CZbOsDHunvleh0jYU0p3OyC5EZGViuObdSgGZSH0bvG+gq1GpL4WLyxVbr8GyLhEDPOe/Dp+xL45tdGc3Xidz4TwgxqZTV0E2W6BHpJqIU4/WQv5B0bnwGSPog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ik0Vxf42bfLbG418BKWRN8RzBEH+bI3LVPf5/4jUnGk=;
 b=vUxjLm5tXNXKuu6at8wEroU2a46Tuf2vCzDAkNE7yWX9mVleIj8ipVALy4RYWnlpR6/ENc41sdsKLsWiz6S3kpqF3cFCwI3raAh/zSoYFWeyn3fL3zdDwfUTYSKnKTw2BI0XjFzBh9e4ER5508oKOmwpdtaopxDKQ058l9+XDGiWKMb+yh2agiFzX1KmWYxbXT2VVYDu44vRo4jMC431KTgM0vDIkrsI8DT8vwKvu5O6qhoRH9kqahH+B2jyZhafh4EKLkXSVhBmiVkrg4UEgpvpyvc13pMIZfti36KyWrw3OjqbXNyDXvn+0bFBpSicMJ1s6G1VapgmN9GsW7Hq4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <83037c3f-ca86-d2bc-d97a-8caee2e18b39@suse.com>
Date: Wed, 9 Aug 2023 17:41:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC PATCH 3/5] [WIP]xen/scripts: add codestyle.py script
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230728081144.4124309-1-luca.fancellu@arm.com>
 <20230728081144.4124309-4-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230728081144.4124309-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9446:EE_
X-MS-Office365-Filtering-Correlation-Id: feb7290d-88cb-4cb1-1569-08db98ef2b98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AQh9ohV3OoGz38vRzlL9g1jFcbz08g2ct2h0fNvg1QT18rUAYxhQMx/JtuWF/nS+l0zR1O4E8MeQjUvMICnd2BP4Dx2DS7PUh4ZrSBwKXfHG9MF8lBBo2xKbwjDcUie4krvwWmG8/XjCkiM2oIufUP+dua2yB7CxyM2OygTfv+lvemKHox6HU+MbNjYZkhHlX/f8Gw+ML//oC8baHY9k/qnKq0HdCMDXFeO1XN5qw9E18eTGlDowkeIxq8Q2JUoGBnVHiqW5PI7SMtkZFzFh479qYJnzO9rvGm5dcBdY2Tz8W7cBjDJ9KWDmEEgMxZn16YXIvCKGPeWnmWqcV8MCSrtIlQeSmVx9j0cVventujnuM1xANN79Xk941KjxejvBlZm/ofEzQze6LM7Mwa4IMZjkNQyR8Y9IZeIcpZNElhY65kkCSekPFbjKn+CwJiUzmt5Uj//kZLEstU5GnF2ybKMGE7CG9sdNdt3BtZlfo9L7FQaw++yJv89cu5evo6sypY0sFC3SeIGmbMXDmJIm06IE6w4dFC13/IBLx8+1h2mjZF5apPfBiR8WoAxXs6YaRHblNeTooVRjhP3FBfpegCAJ1q+3icV5/EPkmVLCPLomcUnLgD/QjOhDzug4ok+maa42wG/Kk+85dwwfQwZaqg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(136003)(376002)(346002)(366004)(186006)(1800799006)(451199021)(36756003)(478600001)(54906003)(6666004)(66946007)(66556008)(53546011)(6916009)(4326008)(6506007)(66476007)(26005)(6512007)(2906002)(41300700001)(316002)(8936002)(31696002)(4744005)(8676002)(38100700002)(5660300002)(86362001)(2616005)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2w0aFlFZm5JODI2V3NIdTMwazBxdFJUZDNLWitNd2FPSmRGL21nYytFRjJx?=
 =?utf-8?B?eWxrWWo2T1hFdXQrM0VPemxscVVxcTliU3FUaEVSOENHWE9kMlE5YWk3T041?=
 =?utf-8?B?U0pndE1DaFdBSGtFNkhPTzEzSGgzSzUvTVFpcTJ0Rmx6b3Bwa3padm9pRXZ0?=
 =?utf-8?B?bWxnS3dhMkNTaGFsK0UyaVh4cFNPZGJ0OTAwTFY4MWEzL21PUVB0dityVnRv?=
 =?utf-8?B?b2V1S3BIYzJBMFhOaUVPMlBYYzRBUldzSG96T3RLakNQUmhiTHp1VXpBSHlP?=
 =?utf-8?B?cUYxSzhPbTI1SW1VcSsrV3dRNmJDUFhDZ3RqdFRTUmVHY3NFUHU3U1Rya1M2?=
 =?utf-8?B?c3psZWFJTmVJWVBvV0xXdmx4WWVXYThjRjNWekdUUDdYemNDd1dkMW1PQkxV?=
 =?utf-8?B?clR0TSt6ZDk4M2MrTEU2aTVqcWVvQ2JUVzBVcFBKbzV6anNCOVRQRWFxRFh4?=
 =?utf-8?B?ZEc0TEpwb2o0dDFzcENlMGpSa1ltYUV5aHVpVUZQYnRkenV4aDRMTmdDeEk5?=
 =?utf-8?B?QTJ4MG5lV1EycHYwbTNRS0tEQmRLWVFRR2ZFTlkwNnpwS2NxeUJyYTNVeDVQ?=
 =?utf-8?B?SHVLaFdVL3BuNW5RL1lGSUo2c3RMbWlidXJaZlR1Y3NwUy9OY1poNUVBT0tl?=
 =?utf-8?B?VXhSTmNpZHpUVml0elJIWDFQb09BU01JWFgyc2lrN2ZPYmxuaERxN2grTTR3?=
 =?utf-8?B?aUxYTGVVKzVueisvNW9wNXVXZ1VaeTU2UDBXYXVjSndNK2xyYS9ob2Q2NnpF?=
 =?utf-8?B?V3Jyeko0eDZDN0JwTS82YWYvaGN3bGVtZC95VmxXdTZzcEw1QmdheHVOOUNH?=
 =?utf-8?B?OFZJVXBHQTJuY21JNTVtTXJzMkxNbndtbU9vMFBEcklsck5FUHdHQ3FBNERO?=
 =?utf-8?B?Z1dEeUlabjJLeXJRSjAyWmk4eXVudW9FL3g1WFRXVmVDa3ltZjRxZXAyQU5t?=
 =?utf-8?B?dk9nMGM0c20rbm93bW1oTDk4cnhqamJub2NDTGdsOUdVRFRMdTZ5UlA1dkl0?=
 =?utf-8?B?UTdrWkdWajE1RkpvNXR2WEJRTXV6aitNSzhtRGNpc0l0Vm5uelZ3WXc4MGhB?=
 =?utf-8?B?WSt5VHlPWU5KS3JWbTFYSXVSQXQybzM3RmdUMXl1S1RsRXBudDdGazIwd1o5?=
 =?utf-8?B?WThnWjh1ZUl2UzZvSXM4d2RONlc0QlpTa1ZERkp0V2dVK1NxdklRd1orRUxU?=
 =?utf-8?B?eGlIbUZIRGdMbUJET1hRbWYvRkJuUFBOZVdkZndOS28wcXhRYWxWTnRNeVZN?=
 =?utf-8?B?Z2VPV1VQYkNwVm1PYWRjS1RjQVZqMWZQWjV6NnI5VWhYSENzLzdpQ0ZkNG94?=
 =?utf-8?B?R1Y4M2hFRnN3MXNVUGxhbjRxaUVPTzRmWWpaR3BtYzF1S1B1ZndtRU9wd1di?=
 =?utf-8?B?bTBEUFNuQlZtV1haUTFpOFMxQXVJQlZZUHlTWDFUTW9hZmMwRmVyR0xuaVlN?=
 =?utf-8?B?VENSaGtPZFV2d2FSdHNhWmg2OGtnSHdFbGFXc25QZDZIQjAwNDFlQUhBdHc5?=
 =?utf-8?B?VzRJdDJhZkU2S3N2eTVndG11dmhuVnFtYUY4NWNReGM4dXJmL2N6UDhTbDY1?=
 =?utf-8?B?aURPSEYrY2RCRnBOTDJLdDY5bG1XNk90RkNyZjNGclZzT2drVGo5NkJMVlNr?=
 =?utf-8?B?clVDZTh4cEhvc3c2aThISXY5S3hlbWtLZ0h0M09Jd200RmlRNVY4Z0hnM0pr?=
 =?utf-8?B?U3lQOVRMQUpISTNOZWFwQTJBM3ZSNG5CbXpKZFI5ajBJU1hua2ZNTUxkQ2lM?=
 =?utf-8?B?S0FuOVNIOW9Eb2pYT0VERHJkNXdYbGZlT1ZPc2drd3RMOElyaU96aUVBLzk5?=
 =?utf-8?B?SjVtZzdoTTZoWjBzZGJyUWFsUmZNdmtTVHFNRjJuWkpHWFExNy8yaEo4bHlv?=
 =?utf-8?B?NjNkMnlHUWExTUZ1M3d1dG9JK25oK2ZuQmwwTGRLR0VKY1FxSmg0QTBGWmN2?=
 =?utf-8?B?VEZ3ZC91S2hRazQydFlKaEdTSEZuL0x4bzB1SHFDdmlhV2lsYWV0Vnpab2xl?=
 =?utf-8?B?anhYUVJabCtreWpkMjNhTkUxL29TN0JreEE5b2RKTk4vRm1yenRzWWpXaG81?=
 =?utf-8?B?b1dBMXl6N2ppaHhZTkpPZHd1SHFlallOck93aVRrQUNnNGtOR1B2KzlIbmVt?=
 =?utf-8?Q?uRAsgC+XURicMUcyDlSJwEcSe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feb7290d-88cb-4cb1-1569-08db98ef2b98
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 15:42:00.0432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LESpRJtOTcRXfmaziwKYH5srz2IjD5/Oz8NExV5SCmpLtXYwFSy3htAfS42P0xJHNeM+GzFaZEFJFrMupvxwKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9446

On 28.07.2023 10:11, Luca Fancellu wrote:
> This script finds every .c and .h file in the xen hypervisor
> codebase, takes the exclusion list from docs/misra, removes the
> file excluded from the list and for the remaining files is
> calling clang-format on them.

I was going to ask what the intended purpose is, but looking at the
script itself I think I see the script can also be passed a set of
file names, so it won't necessarily scan the entire code base.
That'll make it more suitable to also be used in an incremental
fashion (whether that's also useful to scan patches isn't really
clear to me, but I guess that'll require yet more work).

Jan

