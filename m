Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FBD62B4D0
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 09:16:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444216.699183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovDaZ-000207-Aa; Wed, 16 Nov 2022 08:16:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444216.699183; Wed, 16 Nov 2022 08:16:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovDaZ-0001yE-7b; Wed, 16 Nov 2022 08:16:07 +0000
Received: by outflank-mailman (input) for mailman id 444216;
 Wed, 16 Nov 2022 08:16:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1l6N=3Q=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ovDaX-0001y4-9i
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 08:16:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9aca8ac-6586-11ed-91b6-6bf2151ebd3b;
 Wed, 16 Nov 2022 09:16:04 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7703.eurprd04.prod.outlook.com (2603:10a6:20b:23c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Wed, 16 Nov
 2022 08:16:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 08:16:01 +0000
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
X-Inumbo-ID: e9aca8ac-6586-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hTt9NqpbDUf6oTYL0Wl6S1rwwaKYD17e7e3VJJvZNKS4FAQTI4GNfsU4qMINcSKnPy1QM1uGhzes/WOGEAPiZuUPFRLPcTyaH8qVBBJvRYgzuoEYbP2GucvQIND9BSpAZByhJxqXPUDfgiw9THJt2Y04mHGz8AUQD3Smx3aJJhJJy/Q5kW3MTrhaHKttAtjLLpJfDSruUwpoV3SQGKluj8UVYRNBKk8Ji0j/w7G6IRj0MDfk2StKE//6qQrpAluyDqX9lSA7ct3ZEPQZ6kV978OBnArtSPsKopT6L9ufQ4yNzE6N1lG2htb6ke4dzhroCsPJEc6TM7VITggqMto+HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haJQbwwmOnI81hOD0BK1IhK6XybQnX+fwjiaKfKbmUQ=;
 b=mm/UKvlkuBXNaMBjZSRimUz94l2/ov37NdYQpywr6kaojxUZDPnZbddCeWg3wRIXJ76NS4YCJ+okBTKYuQW3ztn2nxb61qzXoFCDF0E9PbCsXkKypl8gL7HZJ0mC57p3rZMtoz7PbQsjJbsgpN7k3W6RE0yE9wJhNJ/I1MBzuKLRU0Pg0ekWeQpXSe1GIZ2fcoqyP87fC6FyPTmeKpeM8EfLYYXRGA17Xbh+oPAKMiyULB7pm8zpfn0DEKjSrKgGXk7t5hniRYmE0ytYH9iS2440F1Fl6G1z+IPUP5ft2LdOy9rhpoa5VSviT39Pnuys+PLEbFyoF8GuNXZCmGN21A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=haJQbwwmOnI81hOD0BK1IhK6XybQnX+fwjiaKfKbmUQ=;
 b=I/Du0Zwh1JVeXLwj4dKnWFBiGqRyQ3fiPIvilINTZMrencZJz2Sl6TpN0+hjN41BBNBLg9k5bQ54ffja5Wwnd/hpwnaYv1AKA9oL8oEunehU266JYoWWx5rrbk1BYJEez/R+4ijXsGQ/L7ZAQsyFwQgEtMy+WGa/0ag2LtOptyQcFvH6JeNUJDaN1ifNKU89bmPmxzzoUazmVdfpHpU0SgXHfb12m7iNGGEw9ukrfjpLcEwiN6ZvqEGWOhrS+X4m7OUdUSSrFy8vXVQ3KHPl2WzEO6gFaybeETkEDs5xgkWo3LI7RIsGcwUPLdlJSVQG2qW0VTE7oTi1OlqPmUauyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8efda654-c13b-2e8e-445a-ee537f1054c2@suse.com>
Date: Wed, 16 Nov 2022 09:15:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [XEN PATCH for-4.17 v2 6/6] xen: Used SPDX identifier in public
 headers
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Henry Wang <Henry.Wang@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Paul Durrant <paul@xen.org>, Juergen Gross <jgross@suse.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <20221103115204.49610-1-anthony.perard@citrix.com>
 <20221103115204.49610-7-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221103115204.49610-7-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7703:EE_
X-MS-Office365-Filtering-Correlation-Id: cef11ead-7710-405b-d06b-08dac7aacbef
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WzXMZZ/Kw129S5N9r8AbybGgWd4QYMtHI7P3VrmaBLi5fieD8jFJLPwbbPf6oZ7ircNsKtWpr3/ZhRE775Cfme7EDqnJbs1uqlAJchp5sFwHJW7aGU7wwvi+oragQ0OaiO6c18pdFM8CdJnZOtvRVo0o+GehUFmeO2RnsNkCpLkRDbGHA6/LEQMj2TzxdShOvB1tzVZ7MXvFdR3hJku2PL2paKUTRo6yc/vGxku+QioHv6+QrzrjjI9T9Lk9mUUdGi1/PTSvdvyX0Ll2+CvuO+aTKt36XIKTlyC82LAgXVYG/g1+vwLx4GntPdJ5cy3bfd0Re92wM23b39SkvZOYQ/WPaUzabpsl+jra/Fnl7Uc1UoOqjFQ8Sv5nCtlNKu1GtyG3euSYOPf5i4zNJm0IE/A2RFU0GJSeuabmSnyxGsmT/O1u4Tj/zt7p9ToO9u+lfPOZo506+zU99ywfdTU6shIUCcBN+2/rtiPUT8DQLYiLKE0l2U1vQmZObfvQRrkYkUhsDW5KeI7iK4K8ZJgjssHigXMavxVPGxHd5beZZe8BRqKnYJTCPstaik7XA+siLlQRUaxFbqU/0jmYDIoQdfbcVKy6gdzbEa+pZHlIhhUmclrPzpybDrCdir5kM9sdyl/YTuLP7mH9eCb8zNH6QCrsZOJFFuySa+fU83YcQu4nORYAU8189jC1BpF5mN1uFcZE/yOhO4KLqRHROqbgJeZet6dhGt68XzP2mZA+lonNmKoViXXBgfpfYOx9+KYEouyKeqTSgVijuVvNOyx+LQVjyqG9zXvPuhYnlPBIrLdX6MCoYOd+4pKANkIeiTpm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199015)(478600001)(2906002)(6666004)(53546011)(31686004)(6486002)(6506007)(966005)(6512007)(26005)(2616005)(36756003)(186003)(8676002)(4326008)(66946007)(66556008)(66476007)(316002)(5660300002)(6916009)(41300700001)(54906003)(4744005)(8936002)(7416002)(86362001)(31696002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djI0TDZlU2xjdEVCNzFEb1p3MXJPS2VteHpHWXdqZnRPa21OY1hnaGh3d0py?=
 =?utf-8?B?YURic09CZGF0OVMrWWRZblFzMkw0Y3NyTkppVVJ1NE1kdytJYmV5QStjTHZX?=
 =?utf-8?B?d3hQak1odDNwdGQ5RmkyaXNoWTJTazFGbTY2RjdIZmJVbW90L01IVDB4SG9G?=
 =?utf-8?B?SFpjRzRQUDRRZkUxOWt2b2VzbGNsck5CQU9QNmJybWRzeGFnU0dlcG1tcmMr?=
 =?utf-8?B?cjF0eDdoYzZ6S1QxMWtZQ3FvZUFUUFRIdkFqRHE1UFkyaUJrRjFLdmtVdEF0?=
 =?utf-8?B?eTY5clZuRmNJTDg3dGM5TmFSazdGYklpVmlvci8yV2lybm5qV3l0U3gxOHJU?=
 =?utf-8?B?M0Z4US95NFZCVlE0d1U4R09DSjE3bTZPTlVHYWYyT3kzNmk2QTFIT21weG1R?=
 =?utf-8?B?dEdlWS9lcmk2OXBIOW53WnNjMmlXcDBEQlJPYjQ0V25pZDJyMzNkUVhJVTR1?=
 =?utf-8?B?cGx5UGtzclZJTEszWElqcGZpTkxabGdrcmR1Q2dvelF5bDVBZmVsZEp1bmNU?=
 =?utf-8?B?YXNrdWxDeVJheEN4eitTM0U0dWdOdWlNNnV4Ukd6Z0ozL21GNmhJdTBNSHBG?=
 =?utf-8?B?YjdhMDJVbXY5ZkxUUGFpUGxyU2xuSkVUdUhKSEYveGtyRjY5NWRJU0F3NGlm?=
 =?utf-8?B?bnpYWkRpcFNxeXhRUXZqbXFYYVRka2VscDYvSjBYM2FUak9rK0JMUzFQdSs4?=
 =?utf-8?B?a29INGNEcmE4V1ZjeVR4bGVIU2pUSTE1MFpQSDc0M2JjNWQ1dmhheU5YY0Zh?=
 =?utf-8?B?MUN1NE9meWhLelVQS1ZuYWozR0tzcFJPUTBYSTdtazhudmZQcHd0aEtpS3M3?=
 =?utf-8?B?cXRUL1FiU3JDeC9JQ0VxNXhFNHh2M1BrSktRbktHdGJzcndlODNxV3JiMXVs?=
 =?utf-8?B?dlJiMWIrNVRUSTZsTVYrRVIrb3NpdW0rQ2kra3pPdUtwYXNwbXV2TUg0bWVM?=
 =?utf-8?B?MXFkZWVIUm5jL1ZiSVRBTmdaa0llMnoyem8yemdETUUvNmsxRXBWWi92bVhj?=
 =?utf-8?B?bjZ6NjN0Zm9RV1lWdFFHRVdIQU5YakpjNmVGRC9QUnplNEdQb1pqdUVuNldH?=
 =?utf-8?B?T240MWJwcHAxeFFDQ1o2bVA3bDdLczBwbU85S2pUMmRUK2dWQ2tIcnhhcTFZ?=
 =?utf-8?B?QVhBZkd5RFVmc05wdmZLODA0d05TU01vQmIzY0RpalJRNGIwTjMyVEp5V2hn?=
 =?utf-8?B?Y2JySEt4Z2xpQS9lS1QvczJ0bDJoWWw5ZVdncXNrUWJvZWRtUnRTTjlyQ1FO?=
 =?utf-8?B?UnhZOVpicHpwWXhSTHBZSklQVk1uL0xYODBJQjUyUXBmQy9mVmptcEhacjVB?=
 =?utf-8?B?dWp3QXN4MkFvSGhYdHJPblF3TnZjd2pjQk9mS2xuQ2d4Qm90RHdFTlY1aE1V?=
 =?utf-8?B?QnYyR3RKOUxTOEVUeEk3cWQ3bFk2QjR5NnJUeUNyekhvZVRCeUxQZlVIZkJw?=
 =?utf-8?B?eGRHYjhyZ1NRTkxsZXgyeXJUbkVJZUZsdmNNZitHRWM1bWJYSklrR3ZjaDdy?=
 =?utf-8?B?azEvM29Jek5kTVZ6UmdzR2dsTUFBaHVVdDlNOVFXY3I3TThkN3BVOFJhWWdK?=
 =?utf-8?B?WWwvd2Q1enE3N2hVY3lRL2Y0Rm9wdG11RjljNG5rS1RiWEp4cnRDZWRuR0NZ?=
 =?utf-8?B?QnUrVGt4dlhjQzNkWElNaE9vUW9ZYy9lcnozMm9MN3NrNWY3VW5USE45cTN6?=
 =?utf-8?B?SUZnaXlRM3ZXYUFHeEp1dDViZDVjdEVZVkpNVzNLV0t6RkdWV3ZLdXN3UjBX?=
 =?utf-8?B?YjVJKzRrQ0llNFM0TnVNVEVBdDRLL0tJNnJwdFlNdW94cXlyYVAvMDgzVXEv?=
 =?utf-8?B?RWM2RytQNnEySjgreVJGVldoV1lETUtZQTZ5bGdsN1BjcDZYbFNMMDVkVm5z?=
 =?utf-8?B?MC9JY2pLeEoxSlVVSWo2eFBleDJlNHNEd3Z3MG4vaTR3dmhjdXV1ZEFSWmtZ?=
 =?utf-8?B?dGhLZXY0cXViTm9hbUFiNS85TUxXSTNNMEtYMFZvNWNlQUt5Mzc5VWx6cG5M?=
 =?utf-8?B?a0pnZnNGak13aGFQMGlhYW42WkdyaHFocEp3eGdFNDZ6a3FBclZYd0lCRmgy?=
 =?utf-8?B?TDVDaTJSb2VqQzQ4UWRVZXRPaFdxbTZiSHFuYVZCenZGaGNoZVc0MkpFd1RO?=
 =?utf-8?Q?GP/GSbt52DdIuArssp11PAqPP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cef11ead-7710-405b-d06b-08dac7aacbef
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 08:16:01.2923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wcum+00qqUOsGaekXoBa8U7KTARUTG2CtGrJa5yJ1drf5VpoJ96IeXGgZYQjBNWIFAqz4bKdX3t3DZldup6K0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7703

On 03.11.2022 12:52, Anthony PERARD wrote:
> The text of the licence has been check to be the same as the one at
> https://spdx.org/licenses/MIT.html, except we don't have "(including
> the next paragraph)".
> 
> Mecanical change done with a script.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



