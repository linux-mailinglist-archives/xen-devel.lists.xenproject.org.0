Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DDE591162
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 15:28:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385685.621375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMUgo-0007zn-OF; Fri, 12 Aug 2022 13:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385685.621375; Fri, 12 Aug 2022 13:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMUgo-0007wn-LR; Fri, 12 Aug 2022 13:27:02 +0000
Received: by outflank-mailman (input) for mailman id 385685;
 Fri, 12 Aug 2022 13:27:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yzoh=YQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oMUgm-0007wh-Kz
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 13:27:00 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50056.outbound.protection.outlook.com [40.107.5.56])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70ceaf81-1a42-11ed-bd2e-47488cf2e6aa;
 Fri, 12 Aug 2022 15:26:58 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8185.eurprd04.prod.outlook.com (2603:10a6:10:240::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Fri, 12 Aug
 2022 13:26:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 12 Aug 2022
 13:26:55 +0000
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
X-Inumbo-ID: 70ceaf81-1a42-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxNS3mIQzi1cZKBXdc7Ka9Xg3mlX8cTwYwjJ9KnWgRM9nYAyBeAd25K4ncz0UfROKjqi6wae/x0jY+Qfg9ZE/5vlQ7eo6o80wg79sfqaXlv6JjRK8BVOvcTRPfo9GfCqhCmZTXRqPdtAb66QQhjzU4kk6gj1B5Eid41zvd7yh21NEyJXV4OM5JVP4ETbwZfH1D8h7+eaaCN/Fz02HqS/IIuTO2Lwj4z6M9BeUp9dDjRZkdJYjl55f6n6zxIP1Jn4DlORSItsWAnNwtEqauNl7sLUwGGM02Ac5WVF/uvHfrt7MAQioXsVD9f+l48l1+DEKucefNzRQwFbVTfOZCWe0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8F8RJD9OBdZyvfAHhN85Uzi/hqo9sT9HDXI3nP7soU=;
 b=KViE3Otw0LwqLhN4y+LWAJ6J+9g7ZsJVWFsl/3+yqyzUE28vMQxIA3OQE74eQEbzTRK2x+k3zjjgFUVWDqWMM4A0S2HGhDUFlMWuYCMoxquVMY+VLGw+mMCHyyxWAjDNCj4RoQCwH/a9dDLEipHCfjiGMTKj2jQRO984z7SHjIxifKwRjZiHxwDOgDhBpbCuUm+HB7tDH9ncs0oy4ZD46u0bQHeZ95ACJId/dbNgAsP+1YW7btG61CjavEOMmDbPWPobtL8TlQv+Uxq61UUmq0YK+Sgl9Dt0sMj/RptgFBUEI3AYJwldPCIaipE4FjbrvlT0wWqRzi6hxvLChN+LoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8F8RJD9OBdZyvfAHhN85Uzi/hqo9sT9HDXI3nP7soU=;
 b=4btuQcPHeYzu2DATWutLKnhL1DR3FQyGfMm+tvXurOElA1H8DB7KBd99PU/sMk0QDXU+ENf3uG70IQ92Q8JZyZxxoS9OvX6F86A6yKKd9iLpwrkl95r1i8hMZIGC/VcDCfEKMZg9/BKTAyaFjcno0fGMURL00o2vTzcnHnu9845F6+tdF4D9aYQfZu1H7P7KsyG0WeChHqUsdY3WlICTA9dYcbzAbbHxsaPCQz2016eSPyxglNG/trJJarX8+32JYQJbY9fawtU0jPOa54gX25IU/vg3jWyPk9jwOA6LNvGAvkiDuYu/H8R+YsaECQ905Ol0XMyijZp1cvK0YnuOyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <000d5bc9-d6bb-6e7b-abec-c504a660335c@suse.com>
Date: Fri, 12 Aug 2022 15:26:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/3] x86/build: Don't convert boot/{cmdline,head}.bin
 back to .S
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220414114708.4788-3-andrew.cooper3@citrix.com>
 <20220812125508.26104-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220812125508.26104-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d03313c-c179-4225-ddfa-08da7c665368
X-MS-TrafficTypeDiagnostic: DB9PR04MB8185:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y/uBx6rW6xLbZnCXV35PyGJjwQJqMrnS9UNyQLfRc6M0sv1uQDJAJMK5B6qWWClhtFLxlBN2L6ADZl7i8cjHy0V3sbmO7f/FNh9LE0WgmSJyN+n8FPKhq3B4SsI/d6jXs94zB8Nwo7IX+j4mRxUozpM03bnQK8DlMx60b7iHRcJVdtG0gPKGbZNfkmxL3ZYDhITAB7pJVlsf6s5KoMgs6m1Vn+JNMasAXyyw2bCZyuWE9L3e3wfqMZ6HLXgwXKPPuJ2YDab8WkYi1G3kMrcRb3K/hBakCkcxESfnE18IY+2ums1Nmpglp+3lQof/ASMMxHt8zCklukE8LTyf8g/5TkqBFtVzl6fvZQaMcvYGZMYXo2t3xPFtbMnMLEvjROyWE8jdSoCOtyBsZNTUFFn/OysqsUsNQYhkRETfRKPkuOZk5EJ8fPbQtPDDkMWfFR+gpFX17q+40Y2iYrPCZVfhUlv801OAy3fvPvpNWjbes77JWQEWD/OG0bAnqs+mb6yNM8jufNsioVPBs1LJh9vpefRoxEZEggqrj8CI+4l673YKCj7okiqjVr2nmygXXsdSbqdOMSaiERG0ONvKb3SM421Zf62MeikRd3s1tYTjbaamEvrv4fR1jw0+yyQXW3fifC21Xahoijz6OnhamkfngYhXjuZrXJG2oWzXg1e+h/Q3VlmBrNwJhKbBtM8AkikIjVvS6qutx5jBEjjBDIEMC4/pxHc6rTWv8/Jq/opj1m/EeykT132hYp+UYFKuIiFywk93Ds9U/cWR+nKEse2ErFdLQiVkXIctDLN8yYwekW69m7M2ZVkqwzPVi0F0yWODkjljEYOZI9C+pKBax0SV9WkKbnyCLAubLJGDjtR4QBg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(396003)(376002)(346002)(39860400002)(38100700002)(316002)(86362001)(66476007)(4326008)(8676002)(66946007)(66556008)(4744005)(5660300002)(8936002)(6486002)(31696002)(478600001)(53546011)(6506007)(26005)(6512007)(2616005)(41300700001)(186003)(6916009)(54906003)(31686004)(36756003)(2906002)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WE9OSmY1RTF1bitRNlh5MVVGdm5RWkFkcXNCVzVZVlJ6aTFSR2ZiNjZHbHNm?=
 =?utf-8?B?cDErSFFPVXlNSEU4bUxPRUh5ZnNjcG5pWWRPSlBqd25uUGxBZEJRNldjSjlp?=
 =?utf-8?B?UVl6Z0VLYzdsbWtmcGtvRkhyT3JsUlNJcDBzY2tOeE9JNzBWSG05UTRaekxD?=
 =?utf-8?B?QzBGSWFadDhWaldTSUlhMXJaL1ltYXY5emhLY0lXaHBuN1dkalVQeHF5dFZX?=
 =?utf-8?B?dDRPVE5vS2VxUUZtNFd3N1dOS2xOd0RWaVVFQmpZNnZLTUVhUkovTXFuaVRW?=
 =?utf-8?B?d25JTW5JQXcrR2dMUjl6K0hjWHpSeUdtTFo1RVNHaUZJYzJWR0NqR1M3NmxM?=
 =?utf-8?B?OU9ydjNvdTNIK0F5SG5hZzhlc01GZkVCR3dlcSt1VzBNd013NmpQY25RL2RL?=
 =?utf-8?B?Y2ptTmlvL0d5aDRBaXJhZDk3R1Nsa0M4THF0NTBQQXRubjhuN2VnNmxNbW82?=
 =?utf-8?B?TjFublVkZGhTWXJQNUhsWDQ4aFM3OVplUVNZbFdUdjVzaHZndEFFVmlTNmdj?=
 =?utf-8?B?OHBCU2pyOVM1ZzhuWDZGK1FDbUhwLzZMSDk2cXd6UW9WUDdLYlU0WHlHZ0t5?=
 =?utf-8?B?dE1HdE4yQ3NnK2JEb3l5dysySU85OW9aczRPY3A0cEJaWWxmVkVQMjlwNXI3?=
 =?utf-8?B?QWFmMXNPNFdaeHR4MG5VRjllT3lrSzliUHV3b1pMWFBOMXNzTDJjNHNqK05j?=
 =?utf-8?B?SmRvcVJucEpRVzM3MnVvZDhxU3ZlOVpwWEVjWGdCUDlLTnlUSzBUVU1MdXQy?=
 =?utf-8?B?dStwZnplNnFqY1J6LzJxOEJLeUdxcVhnTWxmQTlhMXk0ZlFYb3dQTGV5M3Er?=
 =?utf-8?B?MExDOEQ0MDdCbHhNSW9yY1lrckU3OVlYT1lTSGo0ZEI0MVNXMS8wS0NaMlZ1?=
 =?utf-8?B?MWlDTG5ERVplakRBT2lTMkw2ZVI3WVNUa0txblQvNEhMSDlOUlI4K3JsVm8v?=
 =?utf-8?B?RVBJdGdvNkxrV0V1a2doYng5TGFNdnVrZ09TMTFvZXJYbnp2N055WFFaZUZC?=
 =?utf-8?B?U09JSW9wQ29ScEpETGF0eWphM0lSQ3RTRjlJVUFLdDM3TFUvdDFvR2oyQ2Yx?=
 =?utf-8?B?MnhZNzAwK09sV2pLakQ3OGRxQ1pENUxMbm5SZXhhTEJKTitXTFUyaTBITEdh?=
 =?utf-8?B?N3l6MUFyUXlTT1p6WXlLYkUyZ3BzdEM2aml5T05aK1pOWnFRbCtPZkJLNEcw?=
 =?utf-8?B?Q3BOSGR1aXFPQzkrdXFkOXB5UDZmdmRETHAzZ1pvb0JwYjRQTFpDT0FobGg1?=
 =?utf-8?B?ODJRWG8wdU0welRpZWx1UFJYNTZJUzFDNHIxWFM1WmlWU2NwYnVwUTNRdEV6?=
 =?utf-8?B?ckhBWUw1UG9EOEY2SnF2MGtSNnNBUnlmMGhKUzkxemJWSzZQSmQ1N0lUNDJw?=
 =?utf-8?B?b2d6SmcxVTRKVXMvVG9xakFWb0FMWHAzb0pzSVFrL1g2cGszOTY3TnlkWVMx?=
 =?utf-8?B?UVA3anRRaktSZE9zUFZHbHJEa3hiUzIzODVkSjZZTTRjbUhmT3ZPd0NNTHdz?=
 =?utf-8?B?dnlxNFRXSm9GSGZUanpFSlBTN0tibCttdWlKSC9FdEtoWGdpR1BtNXNWaXl3?=
 =?utf-8?B?V0tnejBCZWNoRGRXZW91OElwT0VuRCtSa0tGaTdJMnJXVG5XL2tESVcyZm9y?=
 =?utf-8?B?WHRzcUtQWFZsSlFyL05TclNuQzBaaG82SzFIdi9LV09rVWp3dVRvMkg0Snho?=
 =?utf-8?B?S1VqY1Zpd3NhWi9hVng5WWhYQStGODRqNi8wOSt2dk5mcGtxbGZjZzNXZ3FJ?=
 =?utf-8?B?S1FidUd6WjZSeTdDS0FVNkZ1MHJESVRBZUhGT0pOL25yR2JqelZtdlRycE9R?=
 =?utf-8?B?aG9kSmU2Vy9GVnZxdGxnSXByN3lTRXNRWnZHZmZ1aExIOFlkVld1T1JRZ3BI?=
 =?utf-8?B?V2NibXQ1WmQyamx0cGw0VnNsT3ZwdXBTVHp6MTRFb0taWVNVY3lOZ2xlSGhW?=
 =?utf-8?B?Z0tYOHdzZ002bjRhbWkxenJIUDJ0c1R6SHZYZy91RDhxMXlMZW04bTNTaW5m?=
 =?utf-8?B?QVZ3N1BWUU5aQlg5OFVmSmRUS3ZhMy8rOUFFRGEyeGNON1lmV0FhVm9NaXM2?=
 =?utf-8?B?UDc1cTFCRENPUEhWcUdzc0tDbXpMT1l5Ky9iMHpWdzdVSTNRMEtlcjROQmtK?=
 =?utf-8?Q?Bb8y7gzxxcDrKRSJi5qOsHVj1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d03313c-c179-4225-ddfa-08da7c665368
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 13:26:55.5798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g27epiQWG0Y91ijREqKT3kh1uoOgkXFuaGDumvI3b86MvVRdeB5g+gF9dKI3o+FrkloitWXQSy0u62TYxgHI/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8185

On 12.08.2022 14:55, Andrew Cooper wrote:
> There's no point wasting time converting binaries back to asm source.  Just
> use .incbin directly.  Explain in head.S what these binaries are.
> 
> Also, explicitly align the blobs.  They contain 4-byte objects, and happen to
> be 4-byte aligned currently because of the position of `lret` and the size of
> cmdline.S but this is incredibly fragile.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


