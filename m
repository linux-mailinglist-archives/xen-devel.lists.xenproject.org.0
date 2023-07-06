Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C981749775
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 10:28:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559782.875087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHKLV-0005Rt-8R; Thu, 06 Jul 2023 08:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559782.875087; Thu, 06 Jul 2023 08:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHKLV-0005Q7-5k; Thu, 06 Jul 2023 08:28:13 +0000
Received: by outflank-mailman (input) for mailman id 559782;
 Thu, 06 Jul 2023 08:28:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHKLT-0005Py-Me
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 08:28:11 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0969b2e5-1bd7-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 10:28:10 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9510.eurprd04.prod.outlook.com (2603:10a6:20b:44a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 08:28:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 08:28:07 +0000
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
X-Inumbo-ID: 0969b2e5-1bd7-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilvDoTOWbGh/mlCj2X8gen9cHhScOQWX/1Xp+LkBWekew8Gl3DMseCETYTk4pKuHHBhWLgUNUSjzFpKJLPCj+K3OIxTkunHEEM/MS9Gpz9KqbrKUOR3hWE1kBMVLWarUE+hVlBbfBfoRha/hAYhQ8rflXlNfbEnPXZ4r3eq9lopj9tvmfuH1MCPqseey6N1jG1a4LgC9h4NSFyoENm31a5oydwevxmGwa0Oj4kutWOF3QKZK0X1ryXrbihuc5XroQjZfnvGJWVFnqzW49KKYzW97sDu2Xxmj2pnGBJnq+O60kXKAEC9Jyf4D10NHFzsacINWR9/96GbmW/rq7r/fyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKIxWTdXVbNouRxTYXUB2l6mMWFiniubUmd4XyQOMVk=;
 b=JjzQNPYCkqpVMJyYjDCHnukng0PRZ6YXAVNN/1K2JKiWwAeWk0ovhxJv9QRRLUypYh/ydX/6c0AdBzKXto94bXnRULJe/Dvb+S4T4UT73vZB7ryFr177I2P1h+tEQeEr69XUVwVcckH+5i5SxS5KoFOdThdpn+KR4CzfhFaamQodRd9wNDcePKtTw3TW30XW0OAh09Zk9EWYn25ft/zOhJumj4dxZNuID7QXRoO8bgwTX7CKERHYmazsLO3JYyLirjuXogWBX6t2AYgZ72cBJ+aFwNamZ9AVp3aSg/2zh1c5gf7KjiBXWliqhJCXLhuo2FxsUEl2DN6jmPqNIiZJPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKIxWTdXVbNouRxTYXUB2l6mMWFiniubUmd4XyQOMVk=;
 b=0TK3LUWu88iAIIiqmt88UO7IkCRKVt2ADlKI5tp2birx7DhwEOQafWPrXP3tp1zDx7/sU4KMP6BUFSGhKByiS0JfmERjr3O3PDi+XeYWpwru83DVbBkFt40Pf8C9fYnQzImwg1hXBPT6S4xi6kgMUde5ZKtsSzRLdPvaqpyAMGwwtlp22+MYfzue0TWnfAirqVHO8XDJhwjFcplEA1mYgcoyqL05U7NyX5GrlFySh8cc4Y5OdDepOH9vOsF4zLYuAHvwnD+uMrFifLld5MuwIYd91EPhTK8ZIAZTctE9psnIM9jLpegoMQHhToPG8HmIQf0unkRbhQ1PhgrmXvt/Pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <07841452-7f20-769d-9fbf-2cffedeb9ef4@suse.com>
Date: Thu, 6 Jul 2023 10:28:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 13/13] xen: fix violations of MISRA C:2012 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Gianluca Luparini <gianluca.luparini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <76cf70cb43492966fbcf77d7a2d67d90fe0a32d4.1688559115.git.gianluca.luparini@bugseng.com>
 <00B5545B-7564-4AA6-9654-48FB30A074A4@arm.com>
 <CAFHJcJtgGQXVTJc9ibpmXHA7oZR1wd-GMVCKAJKZhJm+BTCk2Q@mail.gmail.com>
 <CAFHJcJtVDc0q6cZUFdSwB9Koj2HGf67jL=hEWXt38qhQ-F4Bvw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAFHJcJtVDc0q6cZUFdSwB9Koj2HGf67jL=hEWXt38qhQ-F4Bvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9510:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d0200ce-ab65-4cde-c0b2-08db7dfaed1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D7mcZooTBanNyUt+Q8aZ7xQxkzGCAs9gPPNCqMzEsMH8j1xznTSYkbcRWQikZ33EGPewPrdsUnurc0FY49OO0I3l0J9f78FJ494jrsRH1IqwU7yLDE1HBhmhUnhClh5NtXeXMeE/pNGqf0CmfrrrHlIfWJha/KckFi2VdjTTyneUvDLw3q20nPO9DTtidHNpbeHJ+bs8UkA+7ERZuzZp1F4BFGQ3snnpdozpaOqeDVyfOkHQhuO/qoXgtt10e1dN3EFhCr1tNPyfTDV2dINJ9o0RdP93VK0X9p0hc2RYpXhkkaz3lqSzAeisVZv6dkUgdkFNZ9TBM25lP8nVHR98w3Q9YuY2EnNRpyn5RY7ICiAf0RiB/o6pkjigy3VfCVt2RpFXw+wvBhZAFF5CPojm7z+Kw874J2PEAFe740Fx8fgd1fkLeACY9Zvj7vn7QqJbe3lGlzlPXP3IEdYym2q/rxwv0OqML6o5iJ2ghzsyyiCOwIsdhKKYzwt3DMV2VMAEakr7WPMZks4RTHwdrdJq/0Xdiyygk8AqB7clPUdLUezt2Ip0MiCkJ45gKWlxrYV85X2bX5d9sXEGvZ7J/cm9I0WN506lLtpsrx7Tg5YZY8b4ajIdtqFZdnyOZ2gPpx3rouziXlkrNh24ce31Hbg8vQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199021)(6916009)(4326008)(66946007)(38100700002)(66556008)(66476007)(2616005)(86362001)(186003)(36756003)(31696002)(558084003)(6486002)(6512007)(54906003)(53546011)(6506007)(26005)(478600001)(5660300002)(7416002)(31686004)(8936002)(8676002)(316002)(2906002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1IrYUdldGF2dG5NQ3g5eDZZa3JpbTFjc1pzS3pFTlI1b2Y4RlFwK1BsTVFE?=
 =?utf-8?B?OFMzZjdZL2lRaFRjRlBFWTIyTXdRbTY4a2h4ZkVxYlBMWjNESm9RTng3c3Nj?=
 =?utf-8?B?QjNHRzMyUklORVRCOEphTCtaL0R0Q2twWEZ0Rlc0cnU0K1FLYzRoMldtNGJN?=
 =?utf-8?B?NDdWS3VuYlBXKzBmQVQvOVZpQjY0NmlQaVo4UGJxUWdCTjFIci9nUm93ZjZw?=
 =?utf-8?B?Zk5IZ3pmODJlQzY2Z0pESGJYNGNQRUpnYWF4VGdHZkN0VnNuQXZ1UGVnZ0da?=
 =?utf-8?B?K0JMRDYrR2N3QS9vcWJpOTJVejhOQU9NMGhDdVUyeEh3WFBna0VaMmNRT2t4?=
 =?utf-8?B?WUZiandLckRjQ2ZPWE11TnVBYnQrWnRjKys5K1NHbmlOQnJYbVdEWW5PSE5y?=
 =?utf-8?B?cWt1RGl4aWJISGJCK0dOZkU5UTNNQ3A1NTVrUHNLN2pQcThHeEx3NE1rY25i?=
 =?utf-8?B?dVFVTG5BNTlHQTNjL1NQN3hqQXJFdXhLcmpVOVdncFVPUFdRLy9JaDd5WnRT?=
 =?utf-8?B?aHVWcGtqVTkwVzhINFlLV3BnQXROZWpjb3poTmEyWVhiQlhuZmJVWEMreFFp?=
 =?utf-8?B?R0QvcFJNUWJpaXoyZk1qYVhpTDBJMWg2dXk3amd1cGJScFV1Q2pib3NuNVZi?=
 =?utf-8?B?a2tJZW10MWlueHlFaS9rVllEM3l2SlNqNDZmYXU5VUhsc1h6cUlOblRHVXdD?=
 =?utf-8?B?bnhqL3JPQ3d0aXBqMzNCNytNQ082VlJ1SXNaZmZWMzZEUTc5ZmJGdzJvOFlo?=
 =?utf-8?B?QjU2amtTR3lMdFFuWmlrWXBQbmhSejI4WEJpcksxK3o0aFdEa0NCMlE3UWJK?=
 =?utf-8?B?Sm1UMk8wVkVEL29zWS9iOTRid3FtUXJaWFI1YVhzN2d6M0pJcThYUnlxNFZz?=
 =?utf-8?B?UmVJRlZ6SmNXZTE0UGZqbTMyZDRUb1djWmxKbVpjMW91cjZjRWRhOEJwRGtu?=
 =?utf-8?B?R0RLRCtDSVZFODNiQTBKYmYwaDk1VEpleDRocnhOU1M2OGxtaVlneU5CTTBR?=
 =?utf-8?B?blN5cCt6b1JWTXRSajJvLzVpYVlKbDB6V0hHSkxkZUVGaVVFaUt4Uis1Tjd0?=
 =?utf-8?B?RzIxcE5LdURzcmxvUlJxODFINFliU1RnWWpscnlmQ2dtWW9ZV2x1VityU3Fz?=
 =?utf-8?B?SkQzR21sWUx2L21zZjdiMUMrZlQvMVhWMTRDRVVhK1Rtc3pLRnVYQnQ0RXNU?=
 =?utf-8?B?MDZ2N0VLUU1EOUtLMTJjLzRzQnc3amFaQlRiNmIwSk5JbzMwWG1YaTFGYW9h?=
 =?utf-8?B?anVyR09OUnEycDJyMGJhUEZYSWZ6SVVSeWxUeGMwLy9pL2M3V0p5cVhvdTRp?=
 =?utf-8?B?NlhaT01jWVNrMlc3ZW5TcDBNNExzcjlSMVZTcDBwcktxSEJXMFpRbmt1U2Nn?=
 =?utf-8?B?bHFoOXR1Nzk2U2p1U3o0ak1CUUVpWWdSUE1XM01BTWJNWmtNSnlvWlI3MTAv?=
 =?utf-8?B?dU44STg2UGxrU1RXa09mWWg4aEpRaVdteFRGaWpDa09BN3hEMGRCcC9DQUk5?=
 =?utf-8?B?WVJWMWZjZkVJR2p5bzArMjhlYkpvRVcvZmsrMkJ2QWtmQ0N0ZDB6cnM4WWtD?=
 =?utf-8?B?bmtVKzJ3dXlTZ3pqd3NyRGlOM0FmekdQMXdQNllWMHk1a2VraE1PNUx0eFpM?=
 =?utf-8?B?OGpHK1NWREIwQUwxTUU0TFpUbnRFODZGNGVpVE0vZk1LbGtVWGFzaUl4azdh?=
 =?utf-8?B?ZVYwR3laWWVrb1JyeEsxYXpWdURKR3NGTjNWOTZodEJGWUk0T0QxbHhNTVJh?=
 =?utf-8?B?TzN1S2JoR0FKRHh6ZW0rMmFTeDlmd090Z0lTdVd3azY5eEE5ZFBCRWJEb295?=
 =?utf-8?B?V0ttODhFT1pRVGp4NzNENHhVZ25venE0ZW5zdGthWVhDaFFiZ3JRSC8xa1do?=
 =?utf-8?B?UE9qZnAwZHlNUWV3ejZPYkRXc2JqU2hrWThYbGhDbURjWWNJa21xZFhHbkdu?=
 =?utf-8?B?VWxuT0R0LzNEREZ6MDFPTG1zQ3ozelErczlmK1grV1IyNTdJcHFOcFVaTlZU?=
 =?utf-8?B?ckdPRzNsUWRVWWg5Z2JJRVQzRUhWR0pqOEVWdVVrVzAvdGZjY1kyQ1lmdEdi?=
 =?utf-8?B?ckt1N2RXTFA3N3lEaGJqOVEyL1lTci81a3B6UGc0WGJBK0tuQUlod2szQzNO?=
 =?utf-8?Q?C0cG1TZHqh7kDi/8E1sI2SKCh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d0200ce-ab65-4cde-c0b2-08db7dfaed1e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 08:28:07.7609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JNHQ3AfB2CyuvzY8d3xG3gAtarOmfej3Tbx/iT+9vi1I5HJYTzbm2NII5VEkthP5OQN0L6jDMNE7Iu4viyJF/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9510

On 05.07.2023 21:32, Simone Ballarin wrote:
> Rethinking about it, probably Jan's hint was to add the cast and remove the
> &.

Indeed.

> I will fix it in the next patch.

Thanks.

Jan

