Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3789F57937B
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 08:50:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370377.602105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDh3t-0006L3-Ed; Tue, 19 Jul 2022 06:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370377.602105; Tue, 19 Jul 2022 06:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDh3t-0006IX-Bc; Tue, 19 Jul 2022 06:50:29 +0000
Received: by outflank-mailman (input) for mailman id 370377;
 Tue, 19 Jul 2022 06:50:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UBo5=XY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDh3s-0006IQ-06
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 06:50:28 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60077.outbound.protection.outlook.com [40.107.6.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11d88afa-072f-11ed-bd2d-47488cf2e6aa;
 Tue, 19 Jul 2022 08:50:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4864.eurprd04.prod.outlook.com (2603:10a6:803:5d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 06:50:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 06:50:25 +0000
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
X-Inumbo-ID: 11d88afa-072f-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gI6EVl3ep63sP9gHJL4dbW9hP5MUX62VTwFg4hAJv1TZIwv5VqCmRRjWp8hEUsm24zEDv3DU3s39OXcGTmYzQsXg9GXEBdf1oWVr74W/Re8M9FDRnEPJiPubnB8V78QnpXfEceTVWq3VmgYc9oJdlfTLjezKZaH4WXlP65YGTpXW+fn2dstus4Y5Tc6y0yHEZmZ1bgyIewGfassRbQ9GnOeMLvGrUotCQBRUlJXwhaQTq42VqRCbzxmVWEQQ6D+6Tu0m6o+E3Cu84Q8KS9l4w3Nj5CjKmGT4+vTZ3B3HlzbUZcvGQtrpJc8aN/xyHmeUc16luFjCWxONSDjcKM4Z1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GUAzah9w/l5Z6D5t55tUznNm6b5NNsbbbrHqYCcZYGg=;
 b=BtGDMfm7SnWRqbvAFLr/Q8vJl0kebJDUVftcfk1TZyszf0d//86qZL4kZgyKn3CsrJDLejTTv3FHYHx5UYSjppTuHjc4ShUtyVplftGLkz2TgFBpOz14lVBH5m6Rxos9yUpKfY3pWAenDVMbjDSkn4jYC8rqroir5VZ9DFxw1h1dFJ+6OyKDnRJQSiPxOXxegeNrsVTHGmbLkwfzUkrgvJuYdmCTMZfc9MEVQzwPyoeweQwJ7yrTYV6pacvgJc38ynpSuHhdn7PQ8ZXrBxMdxOYqsCBDwbEvJm5iOuF/SEiagAeWKDBPxuzZ/HuSaB17uvDAbQUGXJ0VvqAbRtRw8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUAzah9w/l5Z6D5t55tUznNm6b5NNsbbbrHqYCcZYGg=;
 b=gmoYhUoboOqA7iGQHMRSKhCwFmfXUiD6Q+HlfLoSxHl/rti0CRizdiS/zWoGs4LctoOyJXgIn0RZBR0WN4idjOx4koZuaVGoLQ0KeuekDWCaEpV/7uPUq8UWJmWxoHMypS5nLgIU3sAmRL8kXOS/NW62hIEJjdDHUfQTZsAoB+ErhdU64KBXOp97192zSlWtxylvT2n+7sApKucBAat0P5OVcSWtxBC+xjImqn23V4alaDEwXw3/dz1AwhQnMh3EtNw/KEsUmZMJNPYggEAPAzR/ky/k2+9WZjwyZtvwbWPgZiIiPZiAl4xuCGrymuMXdBK7R2ODF7lBOv6YG5x4dQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1c14781b-e1a2-e049-c0ea-a12585f74e7e@suse.com>
Date: Tue, 19 Jul 2022 08:50:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/4] x86/P2M: allow 2M superpage use for shadowed guests
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c428b28-9ff7-4a23-c92f-08da6952f536
X-MS-TrafficTypeDiagnostic: VI1PR04MB4864:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l5c6skmO32uHbNBPy45K7lKniIvHQOTXJt93lz9rfD4+vNozamr3eXJY18UZZxrRP4hd4BI2i7jUoeqUm653/tfWcg80SkULYYrpACcdcvi5pjF6KMFvIU0nE+pb18nSwUWm2KFqp6FACfQHVZCetVcXf2QIvTNApc9mh5OwfuS5Dqi+CIpLw1tl/ZKQtoDqwevcn4wsZOenjcL50sbms6jPfXPB7ArgQyN9eXJyFNaHmXISzU8C8HimRVSMj5zgIiuZTDSHUDiOPSZl/aKt8CIlhU1wEOKXhiZ7dFvwirt4EKeMTKoucIdZ309lkaG7j8m2eY8wWbT764FWUrpb4SNXzhVPbpcEzNunYKXRqEcmGu12rL2JcEIpyfcIFf1RsOiQJVhpInND2A4PQEYHfC0dkEcv1ChLo4Fv0uAB8G7UuSqaPlIE/vJYU91BRjZCOCjgE49wBd+pklaADe+PtpXQHqsRcPIFd0YQ9z5nkIGvbUHCAeH3CwIfTXWD9lausJ3+IVwon6201wKvsIdFlEJwc4uNam1Dn/wGTLjApspAoyTLJ7r3OEmMuHkt3gykgmUeleKTAW+j8q6LkC+0CiLtQK2OFohbfr8WWACqpDwE7KelFq+QvNQ1ajn1ldhmbL18+enpu3cFTanrfbEQ0FgQxQt3iSQ20CqF0NYmkiBsvrsrpPYBpdDj/BSuMvxDOIm41pheRLB4CPRZB3HRw2Tv4R038jtNISZah+1MtkcVtwWo4J6wcV1Kk+n+QsJemK21qPmWGIl3rA5/1iE3UBI24GnIcnBCpjvmi8x3OXYS0KReF6mK1eK5iKrLqNRZpThLok5TW6ySBAq9yYB8PA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(396003)(366004)(136003)(39860400002)(8936002)(4326008)(66556008)(4744005)(66946007)(5660300002)(66476007)(54906003)(38100700002)(26005)(86362001)(31696002)(2906002)(478600001)(83380400001)(316002)(6486002)(8676002)(186003)(6916009)(6512007)(2616005)(6506007)(36756003)(31686004)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHVxWXpyZVNjZTJBZnpDQXhNbmthN1RnalBUV29pTGNyRUlpVFVjVWhiNEYx?=
 =?utf-8?B?Y3A4cFc0U2RlLzJtdXNHdXY4d1BqVDZ3SW9GK1NPY2t4dXNCRm1lL2M0TWNI?=
 =?utf-8?B?R1JBZUNic3pMcjMraUlvcEdGQUJyeXVab0htbmpBUWlJZUN2WHdjQnUwQzdM?=
 =?utf-8?B?c3BLaU5GUWJ4aDZCZHc4TmVtTmNydUdmcGY4YUcxMys1eTFUVzYwUkVLOE80?=
 =?utf-8?B?akFSem9xSlB1YjlyUGt3SC81a3J2eVhjRm53d0J5Ym0xblNYOEdYN2VydjdT?=
 =?utf-8?B?SStKdUpVM0h4bGZJdnpObTlyR0l2SXBYb01LMm1zNG5OOWYxSHlwbGErZE5F?=
 =?utf-8?B?Q0NZWVhGc0dlQ2xQTDdUNGVSTDJ5NEZMbkFkV3cybHlDMFN3RXdWeVhzWnRS?=
 =?utf-8?B?OFM0UXZSVDhxcldMdFFvN2NqeEFhclcwOXpBcmZnVFArQWN3YVJCcitwaFFM?=
 =?utf-8?B?UlFQVUtRSGNxdjFKODBjQ1BidExqaFFjUFVWMlJRVEhneWZocG9GWitoeXgx?=
 =?utf-8?B?NEtHSmVzZUNZR2hESHZuTWN6dTdLWGdNVDEwMWdHYlRYMTIrWC9icjFnV1NJ?=
 =?utf-8?B?RWFEMkZ5VTFMV3J1eDI5R2daRGlqNGdqU2RyZkhRZkg4V3RSYlM4OEoyeDlN?=
 =?utf-8?B?UGljK1U5dG1uOGdPMXpQUGxqa05lOUZUYmpMWkhFT0djR3VWQWxFLzI5bGg3?=
 =?utf-8?B?YWZNdU5VWjE4N1FyQTV4cndDc1I5cGh3ZVpTd1BkczUvNDhvSW1MNXd4MVFX?=
 =?utf-8?B?YUt2ZnBLRXk3UG9od2xRZUNzWFNYbWpYRkZ6UlhGbFdQcnR6S2szNzJTLzE0?=
 =?utf-8?B?cXlVT05yYndxNVJwdzcvRm5zWFFuejkwS3ZkdFhhWTB1ak5aRkR0WmhiKzFj?=
 =?utf-8?B?Sy9sTi84ZXRjQkpzbUh1Wk9yS3dQeTNoeUF0ZG5WWlR1YzF5WFpSRW5JK200?=
 =?utf-8?B?WDB4RC85enVYTGlUNWs5VzlIOWQySGw1NTFQNmloZWhjNUg2Q1plZHpuTkZr?=
 =?utf-8?B?cTZ1RStUZmVXWkNNQzNESFBKSWcyNStqemdGd2JOelRmQ2tHNjZnRGNmc1Bn?=
 =?utf-8?B?NDhsS0hhcmt0TnlBTXBUQmttYitvVmkwWUpBR3l0RkdaRnp4bnBBVTBaQmNP?=
 =?utf-8?B?WXlvc01kTHhEbWh4djk2MmJZQjllV0ZtUGRZRmlSUU9lVFpYMkdOZDlqOWE2?=
 =?utf-8?B?bzV2VWx1S212YllVU0wyc1lEWnczSEY1NnFJSEhha3RhVXg1Z0NLbFRGejVK?=
 =?utf-8?B?YXJ6MmRLOEtpeUpqZnJ5b2IzMG1halhYRW9FcUlLSmZidmNEclpzK1I3eTJW?=
 =?utf-8?B?dDQrM1RleWM5VmFrcXdjSGRLL1NnaHlyL3ExaXRhMW92UWpOSE01TUZTY3ZR?=
 =?utf-8?B?ZmQrR0pkWVIwRkdaSlpEOGlRcTR3MnlqeEwwTjR5SHRLRDVsOUhEMnZ1QWNM?=
 =?utf-8?B?YzFYd0JRUGlhOXJyTDdnSG9JRjRLUlJyQk1UZGxVajBxcFFCVlF2bHhaK0hh?=
 =?utf-8?B?RWVhTTJaNWRJeUVWZGZSczhjSG8zdE9vOUp2TDYxT0EvSnJCUnBlekMwQkxi?=
 =?utf-8?B?YXh0RU9hSmpDTkZ6YWxReUlBYis3eDdRTGdMTzd2T05vbHJWRk5yalNSR0xN?=
 =?utf-8?B?VWZwMHptQ25iTWhoN1VNWC9xQ0JaeGE0SzNjTVNiQTZpZHo3aW94OWpDWkNu?=
 =?utf-8?B?QzJTK3lTQ1ZoVmRqWHhzbi9KZXc4WEc4a3hOOFlxdEFoemZIOVhBZnMyMHdS?=
 =?utf-8?B?cExPQ0JLS1M5aUxCc1Q1NnU0bTVZa09sOTRaSmU1YStPY0R0UWhuNHhuTzRz?=
 =?utf-8?B?SHFKSnZJUksxU3k2K0pyTzRYYlk4VHRHRVBmd043NUFodlBBSkxFbEZFSmdS?=
 =?utf-8?B?M2lrQzFOTGtYc1pGWnQrRnhlcDQ0aDJtVnI1YkgrdTdxNEZLUm9LcFUzUU1Y?=
 =?utf-8?B?MEZYRnNocUI4Y2VNU3hhWDFMVTZEZEt3TXEyNlpUSXlxL3BTTmJwdDE1N0hZ?=
 =?utf-8?B?YzhveXV0M3A0RXZROU1OZEZlV0dFZ1p1VVZnRG5PM2JtMHBBQWIzZG1CMVJT?=
 =?utf-8?B?eDA1TDFwSFZYZ0xPb0QwaWI4NFdqU3I0TXBEWXBldGpTWkRTdEJrQWZZVU1n?=
 =?utf-8?Q?sSVEPIzVpMCFJSniWK/7WKgNC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c428b28-9ff7-4a23-c92f-08da6952f536
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 06:50:25.0308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6hnKyjNcR1VLp0wQmGTgu8FGND0tnmuUSl7hODWw/e+X7oMRPut5vgAETiTXlzbvwD6mMgifkJc52b/08bVnUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4864

I did notice this anomaly in the context of IOMMU side work.

1: shadow: slightly consolidate sh_unshadow_for_p2m_change() (part I)
2: shadow: slightly consolidate sh_unshadow_for_p2m_change() (part II)
3: shadow: slightly consolidate sh_unshadow_for_p2m_change() (part III)
4: P2M: allow 2M superpage use for shadowed guests

Jan

