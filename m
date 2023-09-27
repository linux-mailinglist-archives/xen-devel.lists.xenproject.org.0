Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C21E87AFE36
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 10:24:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608735.947409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlPpt-0000r2-VE; Wed, 27 Sep 2023 08:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608735.947409; Wed, 27 Sep 2023 08:23:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlPpt-0000oJ-SH; Wed, 27 Sep 2023 08:23:57 +0000
Received: by outflank-mailman (input) for mailman id 608735;
 Wed, 27 Sep 2023 08:23:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qlPps-0000oD-U4
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 08:23:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 317fc072-5d0f-11ee-878a-cb3800f73035;
 Wed, 27 Sep 2023 10:23:55 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PAXPR04MB8175.eurprd04.prod.outlook.com (2603:10a6:102:1bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 08:23:51 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc%7]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 08:23:51 +0000
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
X-Inumbo-ID: 317fc072-5d0f-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Twn44zZZS3fNKc13XoeVSYNExWI7dAJzLVVh+PJUVI7MIWMD+/TJrqyayALIjyZ9tccSv96IVkueqIKh0CVC92XmTbYbskEg90iTSMkcYIu5/K/Cngh7Tlm9BnoLp5B+/9buk2FC6/rxMt0dzjJZ9hcOM3VLBQW9RcRG7IA/DWnOGR5A0WEtpU26PUYONhVN5XCJgVm55NQY8Hv/x3OTSWJO/9e67A3EmNr+W3CxWZVxVbO2L9m+IPKzODhQI3v82t/LmeXjAgVunbHvGpkwUmnJG1nwE8bYJ3V2sgEYLjBmWc0WrONjOamqzYbz3Xj1/VvmVGQyeg6XvuI9hMDVeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/2z2lQAkQSM711vYBkwkAdNACvaX+6fRshVne93eAA=;
 b=PozSFw3akZtgAC42POBHfIOyoTNQRWXwRrQU+xydqAAn43VO49NKj1iL9kSoFjD8udiAiR/ePsPbeTOKQkv6elbHuZNp75molkfao0Rr3in+l/fLoFALD25kACHcLa3eHYgSSbCfYzwNhRv7PG91nYNQgI9bFm9y/b1ThqI10RWTO8VuDprMYsEuX1qBntSo+lWR2LzQPwhU+Jalf6tfHX5Q5Grp2PnF4vkQQH4kRGCV5NUNQu2dQ51D3Op1fNa5xaw9IB5inus47NELuMqzX7QJEGCR/Mt1AhvSqGMJV75bwMkHFW702YnsF0Z+I5jFf15zKpxiLPBZQ2Hjb74+DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/2z2lQAkQSM711vYBkwkAdNACvaX+6fRshVne93eAA=;
 b=iwpZwP9yJZAzhM6hehRkc85Z7BjwAwnBaqy9RLlFef6BoleIIWzjUYN3TnegbXFcWc4TG9J1vvuLi69cp5sQq6hWR/BVtPiWLih+LAX/viwpV7THnbEv0CoM6xAcz6h20f8995MzkAG/gIKYGSP6j77Tjfqh01RKO4n1Gtc2x4R/lJIf1MzYho/GKMpGQLAiyELc5SVEE9yCpELfmcBj4G1UwlwLy03w6x9vI4gEZbapNn0Nl0THMtiOiKT6CjNKqOHjhOran9ivoxcPIcii4o30vDKpDQGAeVWCoVKBZsALttmxIffWu9BZvDTAC/yUOsQFpex+7qthfwwtqcQJiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3002e10a-29d9-45f0-c3c2-ef79ec775934@suse.com>
Date: Wed, 27 Sep 2023 10:23:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3] docs/misra: add rule 2.1 exceptions
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "roberto.bagnara@bugseng.com" <roberto.bagnara@bugseng.com>,
 "julien@xen.org" <julien@xen.org>,
 Stefano Stabellini <stefano.stabellini@amd.com>
References: <20230908230318.1719290-1-sstabellini@kernel.org>
 <91d5ea6d-bdfa-45bf-a54b-5acdf1784ec4@xen.org>
 <alpine.DEB.2.22.394.2309111740160.1847660@ubuntu-linux-20-04-desktop>
 <156fac1ee8e37cddac95813f72a108e0@bugseng.com>
 <BEAF1369-C1FE-4B81-A0A1-5A4F39426E9E@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BEAF1369-C1FE-4B81-A0A1-5A4F39426E9E@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::9) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PAXPR04MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a62d08e-890b-4351-3806-08dbbf3314a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kYHg4AZ3VV2v9NrMR92a285kTv9zAj5gEgjdFZXHbbKwO4VjqrhQ0bQLhTLeFZlmSdAsAxJkkkMLOFWnmK0YYD+XuUySBRWXzuHE7cccwsZ7hpwr3t5bawlh0RJdQ1qbcoBd5U10g5WE4/Z79vlHNMr2/PsxJMOccRmVZ5iLPykmrws4AOV5z5TbORDRoUD8ZCAZFgkp2jgD4S+sXSHyYVz5y000efTi7rnk4rOPAEeb7201rpFCZVmJUdZGkIL6KeLha45xyh4ZnPCKFz+Zq3nZt9Dwf+8xuGKRI5HRpcf7+auCMxtrL8Yy0wyVmC2mJDyIhmG2hxJIISurXmOV/Z7fqLzLEry45IZgIGgRfi1qnF3HJkpdR3VBUAPg9P3bjmA8M8lbtUJymo+vOkm1wgTEvRmp9qTxfC+DAKZ8QzLUxFGddD+JhIQMKFnsqsSuEGrBSQqwS6FosV7wQ7TkOB0GAjiDqFr3vNbXv9wyu6AJKSqLSR/kPX4za2n4sklFK0pjCpfHSAxpN9sTPjkGuYXP98MSG79Zl5wLyRfX6AolnXLxiEl6cRJlXTF1gSq+VtqZ6UCUXUGf6Z6JFosVPKJdlFdh0IxzLiFM1dROnsQejqmOgbLb/nCdKyGbGlhlTqfvyK/qp5a8XHiYtDa08w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(39860400002)(376002)(366004)(230922051799003)(451199024)(1800799009)(186009)(7416002)(31686004)(66476007)(53546011)(2906002)(4744005)(54906003)(316002)(5660300002)(41300700001)(8936002)(8676002)(36756003)(4326008)(66556008)(2616005)(66946007)(86362001)(6486002)(110136005)(31696002)(6506007)(26005)(6512007)(38100700002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2VOYTFEQktwd1BmNVg5Yi9TQkdoUXJoODNYODhocW5xVDFWWG55clQwenB1?=
 =?utf-8?B?Qy9SV25Pa0dsSFdZOW0wdVBlMnFqYmNMalVoZ1NtYW04Wkg0R0FpYzgzOENJ?=
 =?utf-8?B?OElKRHJGbmMrdkhKWUJNakdJaVVDOTdpV3FQS2llU0t3T2cweUY1NGVYOVJJ?=
 =?utf-8?B?c3BSRjRqOG4zc3o2TS9oMWFLQWhwWitkR2N1d3RjRnBjUXhubHBVRVRqTlZJ?=
 =?utf-8?B?ZDVpYmMvZUYxODBNeHJ1bVZQNTZiUkN0V1lXWktmQ2dpZ3BzRlJtaDcvczBH?=
 =?utf-8?B?aExyTW1WbmJ4S3JTMWxqdW9UNjBya1B1M1V2cG5nZE4wa2s4a0VjMHNJWVUw?=
 =?utf-8?B?K3NZOG9sT0F4TkM1RUxIN1oyZEpYa2h1dE1FTmptc0RtQ01meUxFS09YRzBx?=
 =?utf-8?B?YW5GNmZKWTV4c09xb2tpaEl6bTFBT3ovaVc4KzZwbWw0Q2U0SE5jQ3QzT0c2?=
 =?utf-8?B?T2FrR2s0Zm9uTnZhdzZMcllJalhqTkJReHlZSUdSeStQb3ZUQ2tBR0ZOU3l4?=
 =?utf-8?B?VHlyUDBzam5qbUNTRHZIb2plUjI4cXVvVEZ1blFRdml6SUZaTjJWd2RPUUhR?=
 =?utf-8?B?aEk3eGhySjNMOFlZd0l2ZzVoUEFXMDd4QTJiV2Eyb0lrV0gyekg2SmhPczBK?=
 =?utf-8?B?c1V1Q25Mb2JxaTVlZ1hQUHBKNmRQNlNqcnpiRjNoMFZKb2RxODV5SnpIVGFk?=
 =?utf-8?B?c29UUHlDY2x1YUNwUGhKMFpPNm16VHNoNVBleVhUUjVrblRCK04zaGdpeUp4?=
 =?utf-8?B?OUdYUUxSWldUWHhRU2g2cTdvWWhGL1JKeXVCcGgvUXg0M0k2WmRiWmcyUTJL?=
 =?utf-8?B?LytTbVZmTTI2YlI1bUMzTGNGRk5leHlNdVNyQ1dKRXIxUC9maWkrcEZaOXNQ?=
 =?utf-8?B?UE11bnpGNENyajVaMURmMUNUMzExZ2w1ZGF2ZTd4VzlYTVZoS2lRNFFmd1lB?=
 =?utf-8?B?L0lUbXNDcDgrQzhGaEhjSTN5WWthYkV6RytzNkZSZ29RcHluUVE2TUlSQ2dU?=
 =?utf-8?B?YXBmQ3VtNlNFWC9EVUlucXF1RWlHYWVVS1hLREgrN0lGYTlqMWZtaWV0c3JR?=
 =?utf-8?B?SmJzdnY2eVJudWtJUmRSeTBsVERocnZiSWFTQ2ZYQUV2alZBbVdPc2w4WE9s?=
 =?utf-8?B?RVN6WE5SZitDUis5NDlabG5xc2x5N0RhVGR1TUFtUDFQN3lGQ0YrNHZrODhi?=
 =?utf-8?B?ajhBUGZNVVYwNGVzRGtPM3p5ZzFZbXB3L3lOdk9CRzQ2T3FCeWc3L1lNb1kv?=
 =?utf-8?B?d3F2MWVsQk1XS0Q1N01EV0R1dUdsNFJBVHJ3ak9RM3dTQU10WlAxNUY3Szh2?=
 =?utf-8?B?Vm44R3JWZzUwQUJWYjVQdVI2bVR3TFJJUDRIV1JQb3pCVHJPano0NENnR21p?=
 =?utf-8?B?QTlkMjROUDVFSmlzYS9ZVzBvRjJlQnBWbCtEdm1Bb0JWclZSSzlZbGdKcUhj?=
 =?utf-8?B?NkY2Y1duR3ZqTHFTaGFmRjBqTFZEWUsxU21iWVJDWWpGMnZwcFovTWIzV3Vj?=
 =?utf-8?B?cDJ4eHEvNUxsRU1vRjZ4clArR1VXcmU0emdyL3dOUGo3NDR3d0FBNkgwQXlp?=
 =?utf-8?B?cE5lVzgyeVl0elkxelI0UUFBbVBlT3JXYVB4R2laaEcxV2l0WHdIbzdWTTBt?=
 =?utf-8?B?SkFYdC9DS29aUWpxc2dmcWR4NDQvM2lTMGpVTnAwQ3EvN29lampOWmIxN1c5?=
 =?utf-8?B?RUE3bkYwY09kU0dybGJ5SUJpRUxkNTBIK3RJVG1xTTg2OE9UMmNJVkNlSDdX?=
 =?utf-8?B?dU5BNUZiaWxMdUxhOWlGNHZNclVNSjZIU0JwVWp4UFVFY0c3VVZkSHBFUjcv?=
 =?utf-8?B?ME9oSkRLREtvMU1hM1hJMVJUV1ZYSHB6VTFON2N5WGxYTUlSTUJIN0dtYVpn?=
 =?utf-8?B?cFB6NkxDR3QyS25lSnhRSEZsZjNveDhMVVU2OG00ZmZ6MmRvakhHTmk3R2hx?=
 =?utf-8?B?WU1zRHhPOCtXbEFhaWxZdGxQRnlkQVhuVmU2d1VtV0locVpMTENxUWlvbHBC?=
 =?utf-8?B?VDFYU3RadVdRd3lJZVQ3YmZnb2ptWXd2Z2c3T3BKay9BMWxTQnhGbHo4OXg3?=
 =?utf-8?B?Y2pHc1VJY2txaUlubWhGYjAyUjhBMVBkUThlVWhyWmJZQ285djk5YWVuUjFn?=
 =?utf-8?Q?VQ1wpmVtcKs1eVWg2haM4R1Jf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a62d08e-890b-4351-3806-08dbbf3314a3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 08:23:51.4443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1GrrxbaOpTNze6xhZortGnFBFon2fl/NF8GsMFVoGc4RzHpseYN4WP5FGDWUaqWDhEY3cu4nV3TsyrCXxH89Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8175

On 27.09.2023 10:14, Bertrand Marquis wrote:
>> On 27 Sep 2023, at 09:53, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
>> My opinion is that it's far easier for this to be an eclair configuration (which has the
>> advantage not to depend on the exact definition of unreachable) and then perhaps a comment
>> above it explaining the situation.
> 
> I agree here and it is easier to make an overall exception where we list the cases
> where this is acceptable (ie all flavors of unreacheable) and document that eclair
> was configured using "xxxx" to handle this.

What about cppcheck then, for example?

Jan

