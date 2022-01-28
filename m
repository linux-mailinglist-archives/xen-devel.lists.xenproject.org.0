Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C2749FBAE
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 15:32:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262057.454115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDSHV-0001ah-KU; Fri, 28 Jan 2022 14:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262057.454115; Fri, 28 Jan 2022 14:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDSHV-0001Xb-GU; Fri, 28 Jan 2022 14:31:17 +0000
Received: by outflank-mailman (input) for mailman id 262057;
 Fri, 28 Jan 2022 14:31:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B5aJ=SM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nDSHT-0001XV-Qo
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 14:31:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1fdd662-8046-11ec-8f75-fffcc8bd4f1a;
 Fri, 28 Jan 2022 15:31:14 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-tBaLVUMEPuyQNTHDOxlpJA-1; Fri, 28 Jan 2022 15:31:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB5672.eurprd04.prod.outlook.com (2603:10a6:20b:ae::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Fri, 28 Jan
 2022 14:31:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Fri, 28 Jan 2022
 14:31:10 +0000
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
X-Inumbo-ID: f1fdd662-8046-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643380273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GpO3mGnchwqODoNtvERBZBFMq1W+t+koqSwc4cyA+zo=;
	b=EHLW2L61LKqoLJPnb8jd6pT4GiOJ1nGLJqbSvRefCxk+xLUOlYQ6dGF0J4khpcW/DgtLkY
	elBus+DxGzmAsHjD4RmPKcCJ3Q09vwnExoK3sWIdpTvSsp08m54X/7y26+2GfKhg+58MVi
	F8KGGwAHI3p4f3NfcUTvAOIIYcq9pT8=
X-MC-Unique: tBaLVUMEPuyQNTHDOxlpJA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=as4a7KcbheCV8GOF2a/RUXxWCAdGhgSnJ6ogDZPDI869X9iYB7fitcoHQ7079EU46XjZaq+aYjzvhDy8arNlLO25gYzd2MUdlAp5Pf9CL+I9l+Ms4Ohse3g4asqskD8Ah5YYwtsPyZ79uBmDhMUpA+YUxgxnnv566RXgBufXBZoQqBeh7tlTqeDamoG/8/4t/oD7g7x35K+6G0H1Ap75jqfDMQumtjF1HZ1QR9XFQ6jKb+ktMX0ORlE7gX8dLT6ikmGHrtkuYfruwtJO0ABlQ7G9BX50MYrCv9ZOxvrLnotQrlqLnA/Qb8eK5M1GduIrEKXfbaA49Qe7uoYlv1gctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GpO3mGnchwqODoNtvERBZBFMq1W+t+koqSwc4cyA+zo=;
 b=fsk5p1tj65VeUvBG7wMh1qZPZF4+8O1/qaDs2/cxEXjoB0sRg0rRfJ+VEZs/d051LIJ6fgNtqWfDyzGMlYD7uV83WowO88uNAX1LyVuCHvSayOVCCDNe7l3lDLsqApjgt/zO3lw7rHcbQ8yMxT0ybalKEOjzEb0KoLIVV8nV5hJ2KXLlWCtH9g5s5gaKXKLtGeS3LiBmed98YG0AsRnCtL5u31J/tk/f19wlt/PY3WZbWhgy80NgR79Tb2fmmS7LihJwTYsLPTxW7MKeVYc+7AbmfVrKWC2dqql0p8kzM3aU6Y0jKraFfBGJHTxOEw2/ilIZBz8Ury8W+X4rHAc3Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d43b2c88-a302-2bac-abca-c35fe02be676@suse.com>
Date: Fri, 28 Jan 2022 15:31:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/9] x86/cpuid: Advertise SSB_NO to guests by default
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220128132927.14997-1-andrew.cooper3@citrix.com>
 <20220128132927.14997-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220128132927.14997-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0416.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4b30824-8e83-49d3-60d5-08d9e26ad411
X-MS-TrafficTypeDiagnostic: AM6PR04MB5672:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB56724BEF2CE5328CEEA12689B3229@AM6PR04MB5672.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	49fh423B2WM3vMKxcN2dbj4CRIG3cItg1cL5cUJtnswKeHRTG/1mR+Ylfy5qw6EnJRy8URKeGNKU5azFKYS5i5h8bwLJZrnqYY2v3/qu4xQQkvKKzD7xFKSHDWQ536IpFSdDMStd9tnjQfoXD/ZzkId4t2x4g4pczdkNVi6AziiPTKVgUs1dtfxpYfaTVlDc1qA7ST+fD3XvvZ6gubwcXp720lBXqvamSPBQgToICdO9krqWVP0BqcDvOIWEluU7oAQhHu1zPWj4l4a3KOT65b9OGQe4Uuo3JwdY4Q1cuQNjKa3R8u+8zXvMRRgCgHJUL0AtJPRbjUTubpGaTpijwVvvC2v1sl6IUwilXQSWk2B0C3KnWZcsyivQKzJic+bhl/H3hmEOmcGWj9o6FVnGkKAldUi/jPM5VWj0iJQeOPhUGknWu3ymCCReXS10ioZAF19tREeDFKEWQLZqC7YKM+eDANrIg0BbZ7V5IrdGZ83DfQjSFcVxURE/BlNeemz2oesMlsGvp8MB1kzzu0Jc1PMuUf4Vg2i6o1rQSJPmtR0n8rwVF5PmE1EKyotqG4MIyeg/cMBYC0qBTPJJKCFoWhDIvZHi+IHFH68qEgfsz2wnZeJGbSCXRoENkQfjsgGX1Tqw/6NC+HSXagifuPue35hzqxtpY5amWiT724g9rb1vQjtwtXwAaoojVeJmB31DT5onXSYbiFOqQHUD/SMU26LG8IoqrUbnBVnQ0viXFGk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(6916009)(508600001)(54906003)(558084003)(6512007)(6506007)(53546011)(86362001)(2616005)(26005)(31696002)(186003)(6486002)(5660300002)(36756003)(31686004)(2906002)(38100700002)(66476007)(66946007)(4326008)(8936002)(66556008)(8676002)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3UrbzBRS2d5eGVPZTNTaHd4VG9wWlZYSU16bGd1WVlwQlpubUNrNUlhUXht?=
 =?utf-8?B?djVnTFVIMGRYbDNyUzMzT3FrWkFFb0JFUTRsR0xxcDJWWVJMd3Q5Q2dLZytm?=
 =?utf-8?B?YnRub1FUd3h6ZEV1Nk4rejZySkh2R1VjRHp4dEt5T0dLYlhMbHZWdjczWmFh?=
 =?utf-8?B?ZE9mYnFZeWVGTDFBZzFpMDkzU2VGancySzA2NkYwM29keFZEUktpRklkRy92?=
 =?utf-8?B?WEFIRi9DZUVlekFVbFhRVGZhcHdFREhqNGN1dCtQZ240WXkxcVI0MUJBa2VZ?=
 =?utf-8?B?S2dYQy84WTVsdjFmeWxQbmxHa2VBOStJSkg0YzkxSGtWWnc1bW9VakZoS3JH?=
 =?utf-8?B?OThFZ2lxZnRoSStoeEtXUUVnWDZDLzZhUjNmTzk4dU50TnUyTkV5cmMxYXFH?=
 =?utf-8?B?RHViRmMyTkNZY1ZwOVNVU0ZjcnlVeUsrQnZaNFdtZzl0ekRsRndWOFdSempj?=
 =?utf-8?B?VFJ3SHVsbnlFVGsydlVNNG14ZklJa3AzNE84N2pBR0k2cFZWdGRaTFliczZB?=
 =?utf-8?B?Vk1pY2EvRWZMWm9kQnp1RGxFZnVmTmY3R2wzL0lXdmFsRStMS28xT0ovdkJv?=
 =?utf-8?B?T2RKYTVQdUFKMC9Dd0hmN0FQZWFWMmo4T2NZM3BjeDJVc2ZWTXBuVlpKZmVw?=
 =?utf-8?B?WjV1NG1xK0JQbkJGTjRMMlk4VTZDWmNqOEFxVGxseUVmUUhpUm15R0hDbFVZ?=
 =?utf-8?B?NGV0T2hGVjZKZW5TY01neFMxNkZvTlZtcFF6YnZselp4ZnJRRU1xMDl1RmR1?=
 =?utf-8?B?VXRXTTU5dHBGNldMQVdWaDdHMFV6aysySU9VSFFRUFdtVlgvQ2RwYVdpTklH?=
 =?utf-8?B?QWNlbzQwUDl0Ym5jbS9KenU4QWtCNTlWcWFPZTNPaVRsSDFRRGVLOVJWaXR2?=
 =?utf-8?B?eTdsVlY0UEFrYzJCcWptZjZBMGJ3ZFNIVTRBNVRjV3BPb0NRNkhrRHJCS3Zu?=
 =?utf-8?B?L1Z1cngzOVRXSFVwVXl2Zkx0WEdHM0QzMWY2NmdrQlB1NDUrNS9LdVlxUktC?=
 =?utf-8?B?R3VON0lGZytYQlhoVFpwQVJGOGlaTWc5TWNySVNZY3NxbG1TRGRNT05MODJp?=
 =?utf-8?B?NHBlazRZSUJRbFppZHh6N3RVSnQybXkrMHZEZ2Nrb3FNVlVkV1ZSZEV4aEtK?=
 =?utf-8?B?emgxMUZVV0xGbUIzWUpZR3hnTE9ib3F2RDMvSC9DcEFVYzd2MmR5cXkwalpH?=
 =?utf-8?B?b01PQXRISThocm9xTnBOYTBWWU9Dak1SS3hqbEFnbXBHWEh1V0ZjOUZKRTJj?=
 =?utf-8?B?RzFhNUJxcHpFVTFQdzJBUUZ2dVhJcXZBNTRCbHhHS1QwcWpDeU8rTy9URG1a?=
 =?utf-8?B?Wkpjd1ErOVRaY0RwcFpsUG9va090NE15ajNoSmw4THF5SjFYY0ozWkJyMjgv?=
 =?utf-8?B?T2QvL0pFRldDdHhrNmg5RnJwWUxHM0ZrWWVMRDU2MWo5dEtRVVBPYmExZW5q?=
 =?utf-8?B?WnBSRVdsb1JUdW5MdkZBd0M2eUFBT3B2eGIzVjk5Sld5NUtvMUdsT2RUSzEr?=
 =?utf-8?B?UUZKT3EyaFR1dXpKaXBLdE9UZU9pRzVQa1pObnliZGxNeDJYcWJ3MjZsdDdF?=
 =?utf-8?B?bk11YmF6bHZucVEzTWprdTlFeSt0MGtXR3lJTTRxOVVpZVF6cFR5UzFOSS9I?=
 =?utf-8?B?N3BDMmhBclNQMG0zckFqWmp6cGs3K1gvM2JmU2h4bFRBUXFKV1BEakFZNXFI?=
 =?utf-8?B?ZFFUVko5ZDdRa3ZmbXNHcUM3U0VRQTdpei8rdXpPV01lelViNTZtR2VsWVVk?=
 =?utf-8?B?ME9HSFNCbUZacTN1OTU0Mm1sRys3MWo0YjBhV01SeEtYRHhuMWdGMXpaUXFl?=
 =?utf-8?B?NnllRjhNWWpKUjFmUnpJQUtBS0lKa3E5NlNPSjlMcHBRbE1Qc3lHQnduaDRL?=
 =?utf-8?B?OGd1Zll1dVJtR1A1R0NHMk1HV2pEbmtwVFV4V0RpUTJYcjdndnpKTXkwR0RS?=
 =?utf-8?B?Y3R0ay8xVXVFVUVoQ1czVU1laFhLQkNjc21pTWhiOXFXR2EvaDlrM3BWcXdR?=
 =?utf-8?B?ZE5WSXFLM3BTOTNlVHY0MFRwcFJ1OFdMdWN4MnVuZWlCYThkSStCeS9zTmdM?=
 =?utf-8?B?TDhxcTdqMS9SN2h3MmV2R0czZHFTTXhjdUo4V3lueEJSTk93dDNtVUxyYzFn?=
 =?utf-8?B?VjBlUnhURGRZbFJ3NElNcGZvSVFGZkU5RzlZTHRMSTZVeVVqRXhvV2xPVllo?=
 =?utf-8?Q?pvTA7FhaEG7mHaDowDRvdus=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b30824-8e83-49d3-60d5-08d9e26ad411
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 14:31:10.3517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GpnWdumPPLEqL/+xwsQTKavJ31BV8XunU+6D2okYi7hw6rt6rDu74mwGeF/04/OZnM0ToZsRt9doXtS/fxK08w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5672

On 28.01.2022 14:29, Andrew Cooper wrote:
> This is a statement of hardware behaviour, and not related to controls for the
> guest kernel to use.  Pass it straight through from hardware.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


