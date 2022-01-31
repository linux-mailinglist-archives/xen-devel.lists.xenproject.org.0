Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8851D4A3F31
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 10:26:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262829.455222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nESwa-0000jr-6x; Mon, 31 Jan 2022 09:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262829.455222; Mon, 31 Jan 2022 09:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nESwa-0000hv-2i; Mon, 31 Jan 2022 09:25:52 +0000
Received: by outflank-mailman (input) for mailman id 262829;
 Mon, 31 Jan 2022 09:25:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Fky=SP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nESwY-0000hp-P0
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 09:25:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c70cb49b-8277-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 10:25:49 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-ppEK3Om-NBq3uM1Pas4gyA-1; Mon, 31 Jan 2022 10:25:48 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5153.eurprd04.prod.outlook.com (2603:10a6:208:c8::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 09:25:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 09:25:46 +0000
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
X-Inumbo-ID: c70cb49b-8277-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643621149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sq7Kl7apLS4yoC1Ge7Ga3oVjKpUmyx1qNGLnf5Kdqkw=;
	b=np1yJ3dW/eaye0BJ77SMyxmV6CNrkE8ETyxDB6399C8ATcK41uGemXaRbozDxr08386JJy
	AFF06CeSbIbHX1k6kh4Tp1IAju5cNxs9zalI9fH+QzupHSanfqjpC4eDYFZdZa3R7W92y8
	b4Kuerjs70gvc2B2g23TNiWu74u85Vk=
X-MC-Unique: ppEK3Om-NBq3uM1Pas4gyA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZxI5MQuQPWFUxCYAIl0IHwu2m45bPskLTjZ2aM6xUytrhcVrKY2M7LzV6B1jRw9/eAJXwZi4SLWcZOdvSab09cNUWCeGrLVvRlb2vUytW/DN8tq43lqEi59HHspG0bnyszWChfHIdalZCsE9zgt+PbFTfPT8PScSeM7018S2pj+iutI9wqHdYCQQNn5anLXdxsOyDAroO5DssMuJSGnatF1x9niBkRJS828Pd4kEwCzJe98GdxNztwmwvT/zT1F4GXaAeixiXaFneH4R8hGw4n1+LdMr6Wt8klge4xC2JPKcB+t6NZk3vabq7Q09LLdlsTlhtSBvrMXY+GHAjBCQqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sq7Kl7apLS4yoC1Ge7Ga3oVjKpUmyx1qNGLnf5Kdqkw=;
 b=LrLYbOXF6cTVgAlK/NxknxoS/QotV/Wa+e6R51jclpH4jaz5HBNsVmBcfapLs2sHuMuKYhLlzrwUM6uwluOW5Ev/mQphHMkER1Qr1GeAhFCH9Hw8CRA6HqBj04UaIYZMuWRXoyLJpHxX8v+ZWq0+TFDFP20HCarLHOdUKH+E2gaq6YaqvUncV8RHXvhq1s4tG/sdbRhfT0jYdlvj51Hd9kEyXPyjuiCFz/lLBJ1MOXmYc+nr8R3CbtxGPZHo8/FC0iG7I2d6uzeVPnsfMoT8b4pV6sd1hOmGMweD9pMKBz8ZiAlxkfWs/roRZrFIouDTYUpVS5Ca9ST0vDQJoPhD9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fe238ce3-a3d1-2403-7870-4a583c4afde4@suse.com>
Date: Mon, 31 Jan 2022 10:25:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] gitignore: remove stale entries
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220130084231.18896-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220130084231.18896-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89316afd-f867-4a30-a0e9-08d9e49ba958
X-MS-TrafficTypeDiagnostic: AM0PR04MB5153:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB51533A9144DB4199E606C923B3259@AM0PR04MB5153.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EZKREg24/nr+ZqllsmAnx2/Er8y3rghTNMN7I4es/ijovafA/wqvoVOjRm9iUdlA2TKAflvesasy3oz0ZsykcSMOHAvtCoD4QgTYixdqv21TdaT+vJhqnmcx+KKTI9VsCZQk7Aj4k8u0GGwHrv3BFjDzliKWiiQLHCtUb6I2ATbhUZBhz4c2UTUmgKmp7K+i2u9GEoAZXVwCtS76rtWZJjihU10Blt+0wLeospqk25buYr2s/U2p1xQ9P61wAi1fPw3w9PrJOlBSCNghBtLlrcHs2PEW/aziWJQ3tAWVbZ1iEKDpIYCdDXtBF7CrMNMMtNo/pGyzggg1sZzmh1y+jlXaXLS+flwBUdAJI8PiGI12mKArpJhHMMVb7jygfxzuhvEFwkBWQyHlMlF0UAePWR1vubGWAPw8YwZ+T91IZCJf19krRsZoxqRx9/tfc5mA66uzsXLyr7h3CdOSqKl59Faajkc1q+MF/OmufL4CIY55UbdV+Nau2isF2xaD9xfC6nSifQiBjd44llpDitYegyol8rGdCQ7BGpiSKwWz5IYGAF+Lk8ks031ACdaeSkJjZbWQEJwjSS+nOHG6vdokfkgTwaDo0JShcDsyTb+AULLrjG57RDfRbFNMTNmsH0NW4D9cgJWGNMgmK1tdjsqAigj4LCdqNWGKigagqIKQAx2Ja3dn4llANb1UGKFpoTqLpBl1s5ONkgDNoihO9X1qzYA/2PFV552yl8ijq9e8Bjs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(53546011)(186003)(5660300002)(2616005)(2906002)(558084003)(26005)(6512007)(6862004)(31696002)(86362001)(83380400001)(4326008)(316002)(66946007)(37006003)(31686004)(8936002)(8676002)(66556008)(66476007)(6486002)(54906003)(6636002)(508600001)(36756003)(38100700002)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tm9IbFlpbU1xa1k3MDRjR2pUVU9mdG94OXNvYnlIZVJvU0E4bVh2bi9oT0tt?=
 =?utf-8?B?VzM5UUtCRDc0U3YvNHBuVlRPbVFtRWcyc0dSMHBwby9VSTFRUU5OWFZhdWtS?=
 =?utf-8?B?Y29GdDk4QmJ4RnA1Nk92elZwQzdDNCtuM2IvaDNEYk5NWU5BZlVVQ1QwUDdV?=
 =?utf-8?B?RDBTRWdlRjlWak53UExxb1hOU2I2SjBvQjlxQjdqQ1JGaW03QmRyU3VsQnhm?=
 =?utf-8?B?TENDTFdVWVZxQnpkOE1tUXdKM2NyT053b1JycForWlozdithZ1hTeUYvRlor?=
 =?utf-8?B?OFA0cEc4WkZIdkliNmQ3a2ZERjFyM1hVaVVBYkhReCtWbGMwRGtmYWtORzlN?=
 =?utf-8?B?ZHlGK0ZzOW5yazNCTFZEdkhKaG9VSkk2U1EzcE00NEYyK0NVMkdaNENRcDhI?=
 =?utf-8?B?bkc1T253SjA2MFR2OFdxbEhhWEJFWGcxQU8vU1JiSFgrRmxsdUs0N2d6U3Ar?=
 =?utf-8?B?WlZCbkJvZlhWZG1MYyt1UjFzNWMvdTlLNzNzeWdMZ3NUODk5U1FMQ0U2aVdR?=
 =?utf-8?B?dXA2dzhmZ0NGOGg0ZEZ5SDlIdldjMWpDS3N4QUV0RzB5SlM2d2tHcmdZVVJP?=
 =?utf-8?B?VE5ET2g0WTEzNU5XRFlDM3hXTU45K2wxR2tmTW00NmtIWFpTV2NtRkpKSXpt?=
 =?utf-8?B?WXNndDdCMytHYm9wd2s3UWRORUxrNnJ6SWJwU2VIVUFlNitSeUd0S295OE5X?=
 =?utf-8?B?dkpyOVA0ZVlneDM4b0RnMjNBcCtRbkJJVnI3VXZZcEgzamtyYmZyZVdnL1F4?=
 =?utf-8?B?b2d1RmJPNnVKSW1RRzBPSEpJc3l5RDBvYVFiTHZSZGV6cmVVc2JRR0hpejYy?=
 =?utf-8?B?a2RxUkFGaUZYcTdndEJ2MXRhN0F2QnE5c2ZWWGp1M3BVbnBPeGU4L1A5VVRQ?=
 =?utf-8?B?eHhoZmhQMTY0bVAvYm54YS9PZTVWNkpFaTV0eHJlTGJEUEVLTnl5UXRTOGg1?=
 =?utf-8?B?UXI4Q1NLbWZYTFh3OHV6THhsd2g2YXFkTjcrQ0lyNXcra1ZyY2oxa2Q0Ykdw?=
 =?utf-8?B?MkwrcUk2WmlZaFNSeG93Z3NyYnpXaUJCajRXM0VpcFFUMUowLzd5bHZnQjRx?=
 =?utf-8?B?MmwxUWUyYjRIV2Rhbms5cGpYVTVWaUlQeUxQQnJralJ1NHVPM0xpVEdXenpx?=
 =?utf-8?B?UWptVTVacmI5cjcrN2JzanQ5N0VNSTBVWlMxVUhGSjZHSU53M0c5MmJuWFF1?=
 =?utf-8?B?UlZvSmZiUDhRUGljYkwxbmUrU1Y4U0JiaVMxVzVMcnFJaXZNZU9PVkFEWjNq?=
 =?utf-8?B?cjhtdld1amhqZ2dYWmhRUTY5ZDJmOU1WNElSMjc0V3VOVmNzL0VsV1RjKys0?=
 =?utf-8?B?cjUvbzk2c3NoRmdFYUlCZHU3NHlBVFVuM0xEQWpvUFZTNDdoMVQ2NlJ3WGNU?=
 =?utf-8?B?bUw0NVdFaXZDMDBQbk9yMVBaN0E1WjZ2V2M2YlNqcUlUS0JHeVB2VHdtMm1i?=
 =?utf-8?B?NmVlN01nd1Y0UUZTdEdNOVNZVTlwdWRSVkczeXZ1MVE2K0pRRFovd3ZxTDhL?=
 =?utf-8?B?akVhRGJ5L290bzJEa1RhSld3MURDUXdiUnQzTlpROVBqMXEzOW44MWpnK0dw?=
 =?utf-8?B?VzBBdHBNa0lQS0kwVDJYaHo4NW1DR2huZ0R4T0dWbG85akI3MUJNeGVDbnhU?=
 =?utf-8?B?MDF2L2R4QXRUVHNCblpKSnFGcm5jaCtWYWJwYjQwZTR2Qzd2cFU3QnRkL0tP?=
 =?utf-8?B?V2dnbDZDQ04rbkFKTWdraWJJMEZGZWpKVjNZT2hpUVFQZmxmNVlNMmcvTm9G?=
 =?utf-8?B?VlV4cTJiS2NWeHVMRXZvdGJ0QkpPck9BNjNMTUxUeHVnNEYwZjZ4U2xTZ2JU?=
 =?utf-8?B?cm54a29TcDBYRW9xVE9HTHlKS2k4UThscUY5eHZnZjdrcmlXbVdlaG9uUnZ5?=
 =?utf-8?B?Z3AvazJ1Y2dYNEg2NEVybytpTHhiZERVVWY2OWl4Y1k2QlBLQk90cFdPdTU2?=
 =?utf-8?B?aXpGQ0U0U202dDRHc3pmZitpenF1SGNnUGxtWjNkcktUcjRnQjEyeVBWMldy?=
 =?utf-8?B?dFc1S0JvamtxN2F1bXZ1ZnNPeDlod3hIYnVLY0xzMlkxMGVPMWZ3cUtxV3oz?=
 =?utf-8?B?TjdiTUJtVmhzNXA2eUcySEw5Vmc0MkVnakg0QWttZHFMSHNWUzdjeDdJcldG?=
 =?utf-8?B?N1N1cXhIOTNKVkh2R01ObDJIWllGT3ByS3FVazVGVTlqTDNydWZMQ1dQRm9N?=
 =?utf-8?Q?hz51F3tX9ZeKAWQezkGgMjg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89316afd-f867-4a30-a0e9-08d9e49ba958
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 09:25:46.3419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0P5575+duNkdLdty+ns2YRFrx6TEeX2UFW1y9tFOD1j12MesTrocUreAUkPURo3WBiQfZErQlkVakCzqe4JRAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5153

On 30.01.2022 09:42, Juergen Gross wrote:
> The entries referring to tools/security have become stale more than
> 10 years ago. Remove them.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


