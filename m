Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFB2665C4D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 14:18:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475289.736922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFayf-0005aW-9Y; Wed, 11 Jan 2023 13:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475289.736922; Wed, 11 Jan 2023 13:17:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFayf-0005YW-6i; Wed, 11 Jan 2023 13:17:13 +0000
Received: by outflank-mailman (input) for mailman id 475289;
 Wed, 11 Jan 2023 13:17:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UMm=5I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFayc-0005YQ-KP
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 13:17:10 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2079.outbound.protection.outlook.com [40.107.20.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3de542c8-91b2-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 14:17:05 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8558.eurprd04.prod.outlook.com (2603:10a6:102:215::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Wed, 11 Jan
 2023 13:17:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 13:17:03 +0000
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
X-Inumbo-ID: 3de542c8-91b2-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqydBGDl+UjeI6g9kwruVpimJmwH6MWBS2j22656D2/KZucAvPQwjiFjQKZQHa2llmJekV1OdrbyzFBdLyI+x3ddxCoTqH5P6CrUTPhcG9IHCDYSXJfsnHVXGXU+1/VSCQC90FLwtOpUr0ZXgjUNZP2PnJOvtXX8+ReM8Yk8Ac1r+AiJmgpo+cPAj+3ATQrrys5CXP5qpQzudmV5qDYyX0/jwh3Q7fTDtWcWPo5Y0HhAHXmyq1IIsWJUkrNCYWtknAkVmAQq4pryIurkdV8twRVCYtTPLuZ4FjLpw53G5paAxffD8t6Ray3pabYLvDrvzpx5THRbezC8ZLMRvuw5rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzrFD3tt/PvzTVbC4ffQHf9Qv8d3GT/J1THhPr70VZI=;
 b=ZymPjonLrqRvxOx50s1IAaz35c+dj9erKUpeBfurteWSto2X3YST9IyFXlGKuEGXF2m5qxIIpTImtHKU9vRZRhDm7Rp8rjB8Jn+9xSgmdNoR6Apw+hM+n7whimlIqKnurVxZySvVpcHmYcMkr+1qZVJELwXKTayR7H4atQU/IEIyeu7hyNW7nzufO2Q4O6xo5EUr7tYm+Nw3vHx2pQqfit/ED66Dr4uqNfZAdB6sXmuZX6RzOm9H4gYqlfmwdFJTZiZ//Yk78rTSIcLTYmq43fZPYD5aaGvnoNRhmfW9XJSEgwHkSeBMvAhNEaKvENXjIrhrhkhr5Aoebr7tWej4yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzrFD3tt/PvzTVbC4ffQHf9Qv8d3GT/J1THhPr70VZI=;
 b=i50kvVXFd+R2D4mVRVZy1Xp7LMahj/9XjDt511rYsNJtkFr6g44sQQGiVzkCZwtSBDX2P2Lrlkt8FcGy6SrPpy4P6W+zKOFCD6W+WJM4YEfh6aUE+Iz2gvsoNpLQ2gpYZbHJRUjgr6K2JZAXZsfQJG4rXIM/j/8HvYXqaBht2/Jkrfam15bVQ/Xam1NYfP0FVOItmg/F8zug+mxS7hHJonAQLwZs9DEsm9J3KCH9qcvj6MTg9Lv1GO7P/mxBt3AnKhZz3Z6O049NFbYZgBRjSmYYZJg9zGAgJAO2yXm0npimrvVEciBv5aFNJvdnqRh6wom/1j1pG8evBrJPyRBWZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <72930382-b216-4ec3-6d29-889a3bf0bc6e@suse.com>
Date: Wed, 11 Jan 2023 14:17:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 2/6] xen/riscv: introduce asm/types.h header file
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Oleksii <oleksii.kurochko@gmail.com>
References: <cover.1673362493.git.oleksii.kurochko@gmail.com>
 <ca2674739cfa71cae0bf084a7b471ad4518026d3.1673362493.git.oleksii.kurochko@gmail.com>
 <c333b5b0-f936-59f8-d962-79d449403e6c@suse.com>
 <06185fcfb8cbd849df4b033efa923b55c054738d.camel@gmail.com>
 <1b6ee20d-2f32-ab38-83ec-69c33baf42fd@suse.com>
 <0398c48c-cc5d-a4fb-354f-54e3c5900d18@gmail.com>
 <644334f1-8e1d-3203-e942-0eb3ef5584a9@suse.com>
 <2acf07aa-ec56-99fc-765e-70fb7e753547@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2acf07aa-ec56-99fc-765e-70fb7e753547@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: 49d1b50e-24e9-4f93-fca3-08daf3d62134
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dMCgeY6HsXb90QxYyMf6SDZpNcE5AeHrY8H2Maa7+QveUKAEyCCP7vW3l86bnpYFUM2NJ9rN1/HB1QC7i2XWgqxU+x1zlli/g5oZxaDg7vmFj3KKcjodkKuz81ylaVIHSYg0sEj03rnIeXvgg1PggGW+XrRvO9JR8ZyXi+f2axio1mHL3QHiYD10jcZ7HXyoVtZUTDXLdamyBz7hncbndSr7xTLiIiimqBpUWrUByiPeXx4j3fPH1iRZPGqCUqjorYDCaN7rcNl/bVJVOzIH/vV63BaleUL8LXFBrN9/gYFkau47c6qvZTwYf008LimkN9roxUULA3ApOJbOs5p600XYTr6e3vJkIMUR/GQzXfpvh4v87DIEMD0uJaJDC9lPZnIjqt26MeZsgp/xlGWtj4qSwISjL9s26v9SdtKyPsdcslYo1NS4+8yj77hglmJZV6V2Cze6XCa4968WxtGj8DIGWFylVydiPviAbsWjLjUJfbMNz8TSpyM1pDCF8AntncmRO3WrDGQ5ek37xsoja1rxDes2DOpO9VS7QoGhOPcXo2/ijambFUgayKcX634jGDthyfyyog0n1bJ3wH1W5cjlFQ/Ortnqo02vnmZFkDpb2xF2CopxQil4Hdd5Ztsz9R6c03Pqe2oxkdaaSNUaaZvlMKHAsXhvCTEdZv6RDUCl9g+hpPv9MnJnameB9sT/JdABxpF6Kcq2TJeDHeqk03bKG1b1rpg1bmWCIhVUHuk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(396003)(136003)(376002)(366004)(451199015)(7416002)(6506007)(2906002)(36756003)(8676002)(4326008)(6916009)(53546011)(5660300002)(8936002)(4744005)(31686004)(38100700002)(6512007)(41300700001)(6486002)(478600001)(26005)(66476007)(66946007)(66556008)(186003)(86362001)(31696002)(2616005)(54906003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWNld0pOYTJ3aERyanZpdWVxdG5KcEQ5Zy9GT3U3UzdTb3VWakExd1IwWTA4?=
 =?utf-8?B?NVY3cS9ySDFFdm9kNWFDbVVoM21yM2U3dmtoeE1NUEpYdFEvS1lmYVZ4RmdP?=
 =?utf-8?B?Tlg2aExoOTdlcXp2d2liM2g3SlpKL1hPU3NwckNRMEp3OUdzWHZhZTQzQ3pV?=
 =?utf-8?B?WDJqU2x1SDhaUFhyZ3cvNXcwdG9Cakw3aElpZUZrRFRiWlFmMTlYSXBsQ2Zi?=
 =?utf-8?B?STZKWi83US80Zng5ckNxVVhQaDlpSG05Q2k1MzBIWDZVT2VTUzhpald2QjBh?=
 =?utf-8?B?MHJnSERORzdTVmFxVXduLy9rNCtTZVdkUjdDR0NwVmY0UkxrTmVBQTJhQzZw?=
 =?utf-8?B?NnQ1THFYbGRMYnRhT1o5c0p6cTZXSEpmUkN5NlRldW1yWmUwZVJoamFPNmdM?=
 =?utf-8?B?TExsV0dnL1Q3Nkh3MkhGSjAyYVdUNnp6M015bCtFZ0oxVHk5VEJkOUxpcVJj?=
 =?utf-8?B?eGVlSTgzNmVqdHdQUytBL3NmZ1owZ001S2dqckgzN3VLVzVuLzEzYnlFUk1i?=
 =?utf-8?B?em5JNGVCcENSTmJqWHM3QUdhV3ZnanhwQ0U0NWhuMk5zLzk0V043U3hqY1JQ?=
 =?utf-8?B?VUJJTUFlSVlhaHZFSHMzVGd0aTF5V0hzRGhFVkdha0NISzk2MUg2ZXNmajIz?=
 =?utf-8?B?VzM5bUVjL2lxdm1iQ3g4cm5ZeUNsdDNnOGNyWXRYQ1c1NFVqRjNvTEtYaG54?=
 =?utf-8?B?bkUrVUF1N1U4SlExVE1CNUNwLzd0V2RDK3dicXRxWTlmbEVjOCtBcVJmT05M?=
 =?utf-8?B?Z1RhRERCcG8wL3lvSGd2Z09KckxkU05sWndlcC85dXZQZEgxMHMvTTJWcFVW?=
 =?utf-8?B?aHYrb1pFM0Njbm9mMDN2c04zM1RhbnR4a3NOTEhIeUJjd3J1VGswTkxla2hh?=
 =?utf-8?B?VzdjTFgxQkxINVRXMEpwemtleHVxa2tIQzNISHEzMjJGQTNQZlVaZUlBRkc2?=
 =?utf-8?B?ZnJISnlOOWNWUDRTOHpCRWRxeUdyZ01VcDVQSVAwVXRkcUJ0cDFCU3BPbXlh?=
 =?utf-8?B?cGpQQUcxeHlUTkkwR0NQdjB5a2RiVzdzeU5GNnQrSjZJYkpIVUZWMVpsTTBt?=
 =?utf-8?B?ZWNDLyswRFZFQzJZR2NWM0Z2Q1RUc25zaCsrT00xTkJDTEpMRUNSS1Flc0o1?=
 =?utf-8?B?MnQzcGFMSnY1cEtnYlZyZDdpejJJYkd3MXhPRG9CMVl4dHBzVkpFSmd5RTg3?=
 =?utf-8?B?QVVYTmJuQ0R2bU5HdTRZTkpyQi83MUdPbHFyZTRGems5REEyY200WkpRdXJ5?=
 =?utf-8?B?L2tiYzcvb3ZzK2JRV0pFYXdSdExCbElXa1VxYitrV2FueFNtdThjSDdibnNJ?=
 =?utf-8?B?NFRhbUF4ZEFGdVZvb05yd2lqWUNER1VXTUI1d0hZK0FGc08zTlllb0pOWDFY?=
 =?utf-8?B?Sk5pUjlYNWNsMVZ3ZVFEbnNzNHBkWUZnQ1pRS0NMam9JTXRyWkI3amEyNUg0?=
 =?utf-8?B?OHRXVmxSS3NTdHdSUWJoTUhCd1V0NVNxb0l5QVRnQ3l4OUVyelppYnZQUlNE?=
 =?utf-8?B?c3hiMFVtNGpSS3pJNEtQUWZUNXoxREpkZWdwUTRvbk93NVg5eXVNUXYvRWhP?=
 =?utf-8?B?M3hPZEFIeSsrT01YcEZaOEx6b3FVOVl3dy9TY1A1NEJ2bmVWVmt2d1JrZmRP?=
 =?utf-8?B?L1VkOS9IWTM5akJmbUlyYTFPUWNHbHpqOFdhQUR0bmNSRkUxYzEvNlFZQlZt?=
 =?utf-8?B?TktCQzRqbDRZbjVOSi85T1owM0hSRkxjZ2JJT1lza0JOakIxWWZEMWhtRjE2?=
 =?utf-8?B?RitRc3p0TWlJLy83Y21lMzFJOE84ZmNIUzNzL0h4MGxLUzIxZlR3L1ZXN1BL?=
 =?utf-8?B?L0FhU3p0WDFRTUNIZllRTWpSQk91UWJ2MkxGNWZmZEovOTZDUHVieFEvSE5E?=
 =?utf-8?B?dWFtNEk3bVhySEZxMnpCWGp5aXVhdEVsLzVFWGI1QmozdkowOWsvdlZXbnRr?=
 =?utf-8?B?RE4zSDI1bkdzMFJUTVRGNDRMRFNWdGlmdGpWaDFKQi9wTzFUOWNnU1hvQms1?=
 =?utf-8?B?bmpFNjBlaEpKTERvWFRaRDVGTUd2aXp4c1NOaTEyQ3pvSG1SaWhEcHg3bEdm?=
 =?utf-8?B?cGQ0WXRnVVA0RDVBWmlPQStGWlRTM3JSdjdoN29yQ0NiOXBvenFjdCtnUTZE?=
 =?utf-8?Q?BoP82NGQX0BZfo7tOhIxbWqb+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49d1b50e-24e9-4f93-fca3-08daf3d62134
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 13:17:03.3892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IZ2wtJMfXsN17lPxBHcqi3wKsJ69OXJ/+HLe4Q3yAYHK4jSgT2LIwnzYBuTwG+hYAWQgzfpajQH2E4oS//F6Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8558

On 11.01.2023 13:30, Xenia Ragiadakou wrote:
> Could you please help me understand also 
> why __signed__ keyword is required when declaring __{u,s}<N>?
> I mean why __{u,s}<N> cannot be declared using the signed type 
> specifier, just like {u,s}<N>?

I'm afraid I can't, as this looks to have been (blindly?) imported
from Linux very, very long ago. Having put time in going through
our own history, I'm afraid I don't want to go further and see
whether I could spot the reason for you by going through Linux'es.

Jan

