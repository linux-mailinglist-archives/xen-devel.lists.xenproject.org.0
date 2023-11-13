Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC28C7E98D0
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 10:22:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631457.984782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2T9F-00084l-3T; Mon, 13 Nov 2023 09:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631457.984782; Mon, 13 Nov 2023 09:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2T9F-000831-0L; Mon, 13 Nov 2023 09:22:25 +0000
Received: by outflank-mailman (input) for mailman id 631457;
 Mon, 13 Nov 2023 09:22:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OC0U=G2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2T9E-00082v-8o
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 09:22:24 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe02::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26d404cd-8206-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 10:22:23 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GVXPR04MB9780.eurprd04.prod.outlook.com (2603:10a6:150:114::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.14; Mon, 13 Nov
 2023 09:22:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Mon, 13 Nov 2023
 09:22:20 +0000
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
X-Inumbo-ID: 26d404cd-8206-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqq+wGYiz5O5PhHdLa5Ifu0ptnYPO0Bi27IVXdXgMWDmyBt34C9feW6po6Z6GE5pL4/GMFsOfEiB1x3oaiiJN2rbsnkG94ptfTUxyRZj5w3zrrp9pS38JNv6Izc1d61y1swQxDXl+MkMHt5mXE1QJ+PWm/KeANZflD+eYj1t3Lqqgox79HVTvtmeJ4j1epgTuWVbTeYj4PM6PgJIO1zJnGn5nC29iBuucZNoYK7+HPeT9jcaFJBL6vDKQetUmHFEUTyd99Fm4NMLxUXrP8p4O9r/tT/5+Y4fRtl7+qRlzA9AlFh2qjtIb2XEPFziyKQDVhubFCcfM/BlQt5UAJCcbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8SgREJKaFMKvxbaYb9MyueNX16ex2Dzdq7pSvkeOug=;
 b=eG+aGS8JoSic4OpgUL3hKoAwed7Wrtt/c9ja+4uX1ltISSH/D8TSEpG/sOyCcEHPSxzgWF/M99K4e+P0PvbsxG7KVRxggc6noBAmq7davKnqKlTiiaN4Sc7Wz7R+wnZrZz2EbFCmmhmFBgZ/O+prQzlD3sXzW8ofUXM9LA6rz5JIdUxhwmSX5WwvDGwCJ/RNZ0f4nqubXb04+kNlv2TNBVqATg6QocVdFIEza5dkTaeW4CDuxnDgwPNnCGQqsiBAFIZaSuOQh7iQRDobNnlhjHpjuYKJAM4J7XsE3hRynMBgRNxzPoBJcBxal8adwjycksB2lB3Zp5uWwJLvIkBMPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8SgREJKaFMKvxbaYb9MyueNX16ex2Dzdq7pSvkeOug=;
 b=SPYuw9pLCNvQLVZ37Jcg5Px8Pjyy9oIQEPEtMpwFvtThjsxTD5tmaOpbHZLP6S3KhTb6hohmB6ExY/t5iWJZ+3Lc6yB8khHEvB1816J4R+qJsxh6nseH9hlrbtfIs2feziRe4h5/MGVWpg89ZTVNyLbYprI22uoJrjrZhsXADgG3GFRQhK/yKgVAGtBszpYqfjyUqkqYsQrn/hAQ9kkuau2UJrH3EMACTSx0ShJtpsLxDCFhCwN6/bcaFUHvZIDUY+TPfoTmdttsdYr94QCG7lDlMzVHrd4+PDzh8qhyJEZ/nP+btGU676jXHBjxGUhgXh7McV8ToXl4ysm7uU0xjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <02f3b155-797d-8b6a-4f64-f2d376f9cc24@suse.com>
Date: Mon, 13 Nov 2023 10:22:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] x86/intel: fix indentation
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231113085130.43458-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231113085130.43458-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GVXPR04MB9780:EE_
X-MS-Office365-Filtering-Correlation-Id: 49d73906-f21f-43e1-98e5-08dbe42a09b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JXsOlqQBqHFU71JVpsBRxW5lRcQk34g7Bwnw9vTSrmHXPSTCq73U4cDmrm/Vug5Wffj0MnI/zUX0L5GqShsLB8pwZs1fCHWk7deiAk+pDqjDiTfhFd7XaaBGiUeekE4TA/rNqrcWhHe1gcGrTuWmbe6fRqiJ6SLno6TFpoyjoj/rl6eMOmBosIXw5GtPP9vQOHQx7ffcpLhcLvaCOrmPPGy30CyT2nxfQCwWTA4bqCXq+Y/GsD+/6rkhQDQvKWkf2EPG8jNsK8a/2vJPA3CxX7hNZzSF3+wyGLTTerPRNDM7pOCWsMh2AC2GUqnlYKhZwwqXgEwMSMPoQgkiJuleaAf/Z57L19NnRA2D29AaPC/hyeVUdQt1x4Ez4HsAKO0zny6oEMSZ5EJ/xMN/zTZLUFxwxfC0N7t0Ty2xxpA9fLcpxngzHJQKbGBTiauhUn5CPy/AEz/x27mZpB8+00V9cXYZnWs7R/eUgzQCe3xHGxvFXbnf2BdD1PeQ/ClCn76fShATvKAlBade1tB5BL9dQuFucgeABqpD2oHtrHcvfrgKH7W1YEMlGlh1/HErRlgdNLBe29MGKjiqfA//MSLozsSPH0pMo8CFB59sCR8ndqEVy1xqWaoy3vmPTrsGKk1h6NxEYNkeZ+Gw0HtTFKzcDg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(54906003)(66946007)(6916009)(66476007)(66556008)(316002)(478600001)(6486002)(86362001)(5660300002)(31696002)(41300700001)(36756003)(4744005)(2906002)(4326008)(8676002)(8936002)(26005)(31686004)(2616005)(38100700002)(6512007)(53546011)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aENGUDc3alQwMUNBVjVjaldrQXlMUnhYbVprMlBPaERSQkIwY2FTTEl4dklW?=
 =?utf-8?B?dEFQd3p5RHk0bU5KZmdNVUhpVU02WngySy9UN2JmUU4vanBhK0xMVS9wN3VR?=
 =?utf-8?B?UGJhK01hdStTMUZaWERrV3BIWVlDS25yYVJ0Y2JZKytPNEV4cXJOdEJjcnB0?=
 =?utf-8?B?QlZyejUvVHdUZkJHV2Frb1ZDQzR6ZDlsZUxmTFVqQ2pwRURiQndQUWxDdU44?=
 =?utf-8?B?RS9xLytZNS9KaDRJK3htTWc4c2hZT1FjdE1HT0daODNiVldiRlJsZW1aa2pK?=
 =?utf-8?B?YXlObWpaZmdtZE91T3RNTy84ak5uRVNVRmRNUkFhSGorMUpseTh2RmJNcGhp?=
 =?utf-8?B?T0RpYUhMZlBTUDRPczd5VnFVVXNPeUdQMHZaS0lwVkdveSsrV3lTcDBHVTlF?=
 =?utf-8?B?WCtlRVY1czRHNkJpMDI1NUlWdWl1b2N3TURCRWtIM3VxYzBKeW15aEpoT0VL?=
 =?utf-8?B?T0tRMTJyOVppMnRpOVFZZTllMmdVWVQ2enlUcVg5by9qUU14NWFGZWRUSVZj?=
 =?utf-8?B?M1NoODRTUEVhaGdiSWhkWlpaMG8vWkk1NElFNmdCTXUzbU5sTThoUXozemF5?=
 =?utf-8?B?OG5DaGNqTzR4QVJvWklGSlQ2VTFIZDdwZWJpald5a3laUGsxbmp2VkoyU01u?=
 =?utf-8?B?N1NtWjZuSjFua2tjREx0SlYzamU0em9BUStkN2pnWldLRXhwcTJuV1FndUE2?=
 =?utf-8?B?SThqVmpQN0lvbDA4M0FDaVNnLzNYeHYxanBoekRGV1JreUdYZjdSNTJBdXpk?=
 =?utf-8?B?OHY1U25CN29tQ2p6UVNlc3gveGhBb3FMUjNVUG1vU2VGLzByeE5tMTJPb2Iy?=
 =?utf-8?B?UkVkaWg3N2J6VUVNVnZuT2pNUFBtdG9UTXJ0UTA3OVF4eGlmeExhZlYwazJV?=
 =?utf-8?B?WldIZzNnU3BGRFpVQy95SzdKTGdpNXNGRUxKNm9SbnY1MThScWhBY2J1V1o4?=
 =?utf-8?B?OU9IcGRQVHJjdGJlWGNibXIyWWJEKy9DOFdwYjdWdmtyWWpGeWFkREdqNFNn?=
 =?utf-8?B?QnNsZFZXbFBlWGYrNC9pNUFTaFVuSjhaWGVuL21IUHNCUWZxTDBZS3IxQUFR?=
 =?utf-8?B?UUhYYkxwOGRtRDRHY1hBbVlrc2wvMm9NdkswN3J6cjg4QzBkcHRPaDZ3c3dr?=
 =?utf-8?B?OU1GUnBtWURYUWRZcW9JekdxT2NFSDFyWDVtaFNvaENET09pbDdBVWFocWZO?=
 =?utf-8?B?QUNHVGZOWHFncCtaOUVYT2FOL2dOMmtzNGV1VG5pekFlUUVyb3ZPSzVOeUhX?=
 =?utf-8?B?QlZTNWNyYnhxcEhFdGxWbTBTLzVKU3hkcEVwbXNQWHI1WDRPZGZVVHBSUHVO?=
 =?utf-8?B?M0FqaDNQMG1SbHFZa0o1MkFGUUhTNUVVRlZNWjRQbkJUWTZTMmF6S2Z6S0Jq?=
 =?utf-8?B?dkMrbWw3T2VDRG45ak5nRlAwL0ZGenVGTVJRaElmbFdJYlU3aldCTkR6bHhi?=
 =?utf-8?B?WE5mZktqQVFIcDVzQTRuRHRrNUdmQ2Eya3lzZG1iR3ZtOG9xbGdUYUxuNFBX?=
 =?utf-8?B?eUd4WnN6MCtUZkl5ZTUvckl3RXE0d3lTV3lhdGM1Q2xLQ3o1aE42QXh3SVFC?=
 =?utf-8?B?ek9kQldEQUNaUDEydmhnZTljRjQwWEt0VVhDaTNLL2pzSk9oZ0FQOENRQXJ5?=
 =?utf-8?B?ai9qVjdubkdKVjQvUXlTc3liU2k3V29xbFdGRWJ6RlZVZG9hcFdQY1U0TGpH?=
 =?utf-8?B?MTYvelZ0V0FzNmllakhMcEI2UHZKalg2MWorNndFNTFOeFBSZFFuQVVjQzBI?=
 =?utf-8?B?cHdISlJ6R0FBeHRaSnlQbDJwQytYZ2xyeWVUdjZnanBlZXczTUJUNUdhMGM5?=
 =?utf-8?B?SWI4WDhaOHRpbzc1UFFTT1FiN1RUT0l1TURtVDN6NnB2ZkhjeGxFblVzVzB4?=
 =?utf-8?B?c2hmSldGeVNXemlhQUQrSHRpdVFUV2FzcnB3M251Qy9aRWhya1JFVmMyVHZh?=
 =?utf-8?B?R1g4YnYvUWt1QVR4UmRzYWJwZTlNNzJFRUR0Y0VyK1ZQN0VibzNLK3JnYkQ5?=
 =?utf-8?B?cjgzdE1lVURWakdxcTZxRGdBdXkwUjRQa3g5b2VvREQvOVdTZmZ2NGtxdk9u?=
 =?utf-8?B?bEpQNHc3bzRTSWJMOWFVTGQxZ2lqWDBhT0Q2U3NCVTRqUG5PbjB6ZDNiaTd5?=
 =?utf-8?Q?IJV0ix2MkuagiocLM92autlN/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49d73906-f21f-43e1-98e5-08dbe42a09b0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 09:22:20.6921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tOSYG20Ke2gV+neDqu2SpCPMMl8XTVONUgOYoPQuSRr1Ze7G2sOPo5Qxs5u4/0Nqdr29vs7/B0tXbvukzI9Luw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9780

On 13.11.2023 09:51, Roger Pau Monne wrote:
> Adjust line to use a hard tab and align using spaces afterwards, instead of
> using all spaces.
> 
> Fixes: fc3090a47b21 ('x86/boot: Clear XD_DISABLE from the early boot path')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> ---
> Realized while doing backports, not sure if it's worth fixing on it's own.

Fine for staging, but regardless of the Fixes: tag not a backporting
candidate imo.

Jan

