Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4E878BEA6
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 08:44:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591972.924570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qasSo-0008SW-GL; Tue, 29 Aug 2023 06:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591972.924570; Tue, 29 Aug 2023 06:44:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qasSo-0008QZ-Cf; Tue, 29 Aug 2023 06:44:34 +0000
Received: by outflank-mailman (input) for mailman id 591972;
 Tue, 29 Aug 2023 06:44:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mPBx=EO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qasSn-0008QT-7F
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 06:44:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82261b71-4637-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 08:44:32 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7842.eurprd04.prod.outlook.com (2603:10a6:20b:245::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 06:44:29 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 06:44:29 +0000
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
X-Inumbo-ID: 82261b71-4637-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFNPNQWgWgC7EAy7Zq+JsymZv0747c/d+dsiRH6fZp4PxNSqTgRQ49EgBBVPsrP1jly1kGWMV8LstVexsERHix9dwBCQj+d3RvgXa/6SnQWwKsFYs97mydmqVXBxnO2oK1uB2wiEFU0VdXpNLHAdpiBuRiEBLY8Y5MdNE9Dvbgc+c3JHOBinCv9YEf98YoMGLc8ti5e1Unz6IHImSTg5oeuzweOc3yKEGCJ2rV2JIo1MveoT/Ru0enLqrHsVpXkOdcTzp392Pdo36EB5M4+Swzq0k0IMkZylRecYjqrqawfJrMz6mirFYQTfPS9AebMhRTVT+uL8hQKkyUiYNUd7TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2ZEcTED2Ldw3ZssioWW5/zSqPkYhoAKgh/r7FVTK0o=;
 b=brWWLv0IkUbj1gyeskQS8Pr8+Afbvobc4yIrCIcPb+HzfYQjBov5Cq1w4Qqo0E0oAfppkkEViCd009Dy+/OhW2X48VOwaUyMqUGPUwI/2W1ShJfSSw6aACzwa8RBmveRybYJzsXqbpvfXTfaQFy5VYL5KkiT/QqjhByFvNrN3x5IO52AlSuNGjxqKoKbaj2FHa69ilRKpyI5xckMQcv5P0T5przLgs52AFuAr2zyfDIX3j6cp2GLfSDmcapOw8ttn3+aMrBaIHh/sCWc9MG2EPiHZFgOpAPUHscJTO5jPL0VFezCt8rGeqnAuzagUeomG2Ws8kYsmMwGAin3D/DjAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2ZEcTED2Ldw3ZssioWW5/zSqPkYhoAKgh/r7FVTK0o=;
 b=f9DK8ae6NQmT/gvIcWP/gCMbD3ilNNLhYJhFB2Fh7oCkArxMzeD1xcDmhR5KbfCP/l9iRzrBvQ+Mju/q8KbBidVAcsfaocOPphuTTO+gQzn9z7FlN7StRLED7QHuKo25Tr7zbaLXO6lUNbHxvO2PcUUz/TQLC2HudSTILKR2p9s5JpL6GTkCC0ipSS4xhIPwMv3WIrZB9HbTQEWxY5KIkLEljhJxpF/168AvSgTy1qVnBW7NR/dbwfEZ+rMJe2UIw08edsAx2AmEzzB7fSQ1FVI6al82mT/zrw6wpGMUa+WHvjNJqe6fWApuDYf3+f7ccl0ByhaM6bXaM1L6KuySVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6ea4b89e-bdcd-3940-7e34-c0cf1843e941@suse.com>
Date: Tue, 29 Aug 2023 08:44:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 07/13] x86/asm: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
 <c5b6c3b7824d620b341c72c8d5dde5f5fce17dec.1693228255.git.simone.ballarin@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c5b6c3b7824d620b341c72c8d5dde5f5fce17dec.1693228255.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7842:EE_
X-MS-Office365-Filtering-Correlation-Id: 09e798ac-2702-4574-6bfd-08dba85b6532
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JmBhjBDy4A1ikPUj7K5jgIJ4CcIGSdj6jClZEX6RrAWw2QhfcRl5wqPNrvR6APblLV8L3xwWUfpru9v0+MnurJwer5tfqDkoIrfmoc4RIlcjcaF3H8g6mM/Q6aHMgICA1qjhQnXJviVWoWUt3sEN3rUS1d48FtMm9wGbYcEHDdJLnjO83AN1gBR3cedZdwnDuor3hymYin+vtWyveC8xpc20Yq+RAulAULQiNbEBP22X8eNdjqKG6lQ7Eho9Gs8dArklghJY6La6JUMCOL11j4T7cKzVHEoHRvHGYBRX4WwN4AmiVP5rCUkV/lL3QU/t7LjD9FpE/u8hvujggJ9TUTzC9Moc9APjrMXqGMjM/1m8i5EgOdgCn9A+FPDHd2ZtHYjtzY5IUzaV4/4undqAih9FRR8/eor7R4Qy5GVQTPmKNl1CBR50QwIIbV2xhYT8IKoIirl/Y9vVN9A9v9+08SZinqMb6BgwncLRwTSBRrhgXCzyeJ2fLPUZVM6lgExIv5O1gPPHYYzhpTBeJanqXvcNf+m+LHYltDfZeUb3ewjCW0iayrtoILkP82u8pVUm2F5zmLvw/4gRmTieS7VO8xSx6LvCAruhFKg7yGp9YC0t84QSXGkAISpsvEn5YFkilMntTAaxGEWAoaABDll2UQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(396003)(136003)(366004)(186009)(451199024)(1800799009)(6512007)(6506007)(6486002)(53546011)(478600001)(4744005)(26005)(2906002)(2616005)(316002)(6916009)(54906003)(41300700001)(66476007)(66946007)(66556008)(8936002)(5660300002)(8676002)(4326008)(36756003)(38100700002)(86362001)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXB3RjUwQTNPZzhSK0lvVDVHUlNXTWNkWDRrL01UK1JzMnBrRTRWR3hjYnd4?=
 =?utf-8?B?L2hUdElJY2J0b3E4eDByeWIvK3VGN05xU1RCQ3FZZkQrUUVhY2wwWmtHQnht?=
 =?utf-8?B?ak4yVUJCSm8xVGJlZXZDRFJQRGtHNUhyUEhqQU1SckNISXRQTzhNMWxIVVBr?=
 =?utf-8?B?RGlLVHEyNVQzWmVNT3p6K3pGY3B1YWk4Vk5BMmtJU3VJeFhQNzNkZmo3dkdT?=
 =?utf-8?B?cVFqSFVqMUVjVGx1QjR3c3ltZXBCeG5YWGlMWXc0MFl0Mk5ja1ZsaXl4Y2k0?=
 =?utf-8?B?ZTlHa3hYcEo1SXcrV0dpSXl0YWw5WExYZUhrWjhaZjBjc012ZEN6ZGJOYVdk?=
 =?utf-8?B?czJSYlNUUnRWNXl6RUdGazRWNk5xR0tOQmFnRUxBcUFESlF6b3BuSGdkZnBL?=
 =?utf-8?B?SVpWZnJsdjl2Y09yZ3pnSWVTZWE3ME1MU2Uyc1g3WlVKTStKQlhwZUFOajNq?=
 =?utf-8?B?TWZPVDcxSy9TazhPQ2pYRUhIbUViQW5ub1oxSGVDekNRM3FURTlxWVFuK1BB?=
 =?utf-8?B?S2dBZEcrZU5Fc3FManhWZGtLZ2Zmb2dMemVid3pBa0FFQ3JNRE5ENkp1cHFH?=
 =?utf-8?B?VUpTOExnc2tqcmUwV0x0NTRaMzJWN3FhVC9VTWVXZGt2L2hLV1F4cUExY1A5?=
 =?utf-8?B?dkJCcDJMQjNRZHdRYUFBcTZIZlhSN0JqSWRDb1JhUitIZ04yL0poV0FyeHN1?=
 =?utf-8?B?QS9UM0FrU3MvcTNhRytMaGZIM1ppMHJkT0JWWE9DZThEb3lVaWJYd01xVytE?=
 =?utf-8?B?MjFNc0hxQisrRTVEaGVRVXVYMUFiWVovbXBZTGdLeGsxRnJrakhZeXFUK2xu?=
 =?utf-8?B?KzIrcnhnNEdSaGZKb2pDbm52WlNRZUZZYUJEcUd3Z2NoSm54SXNRZldZNTVm?=
 =?utf-8?B?c2Z4alpqNkRLWDdUK2owY1IzZXV4OVdpQ3B2Z3MyYzNnenNlZFZqM2l0bzNI?=
 =?utf-8?B?dVRCcUlPWU04U2RkN3gyNFM4SWZsL0wxcWp4S1lPaDZCWWJPNnc0d0hjSm5S?=
 =?utf-8?B?TUx1U1l0cmVEMDJ4ZWNWbmpUR1hjUXkvam1tQi9KcjVldG4rNWxKMWtqM0dh?=
 =?utf-8?B?ZVVLL20vVENNL00vWWJHYmVtcGduaDV6VTFZcXJCblZqTnROaGRrYkYyWHpI?=
 =?utf-8?B?V3NCcXIzYWM0cEhnQTZMam1wdlRDK0tSemIyT28ydnhScVBVR1h4ZTJDdC83?=
 =?utf-8?B?dWthblJxMGZjY2htcVRmMGlVMXI5TW13RDRrUGc1amxGdDRMVEpyajdGV3BZ?=
 =?utf-8?B?V1VmL1FkWElMZUxvd3Faai9LTDhWcjkzV1FGZzBRTjlLK050ZUNEei9Tc2hQ?=
 =?utf-8?B?TU5VNFVsa1JRR2ZQTktMaDg5cm5MbmhUVmV2dm9VeGptT1grRVpXVGU2TVlB?=
 =?utf-8?B?aG9XZkZINkIxQUZqR1QyanljZ0pXSWR2cC91ZW9NL0l3MGJjRzZkejMwcFVy?=
 =?utf-8?B?SklidDVuMTRBdXVzYnM5RkRRWGdMbldBQUdvZm84a1YzYXBkdVB2MnJ0eTlk?=
 =?utf-8?B?WjhoUU4veXZNVHV5VjRTZVI5QVY0WUdKbTlMOUh6dXErUnZ0bGJMOXJscE1j?=
 =?utf-8?B?RVhUT2VZV2ZUMXdZWTFkRkR1cXpURXlXK2d1V3BjamY0MDIwTTR1S0JvVlBN?=
 =?utf-8?B?ZlpNZVJUNXZ3TS92UDFqTjZkTlNKalZ2UTZraHQ1aXh5Tlg4aEx0RHQ0VDM5?=
 =?utf-8?B?ZEg4Q1k4WGVhMUlSa3ZzTnNseDNVamN6NlJOSE5XaUVVKzQ0U2ttaDMvNk1W?=
 =?utf-8?B?UjF1ZThLUEMxMkY2amRxdUtmSmZad0cwL3FJUXladi9hM2xUblp6aEg4dkR5?=
 =?utf-8?B?ZUtIN3dQRm9FOTBZREtaNnR5MG9QejZsc3pZQStNQnZNU1RsV3diNytBMkNr?=
 =?utf-8?B?YjYwQllkUmwxYzduWk9ONGNvTkxGc1lZb3BXRWpjbG01OEtSUkppNmxTMFQ1?=
 =?utf-8?B?RE5XL0ZleDN4VFA5NmV2ZFYvc2R2NjhwYzBOc0RUZGtTbXBMTllQdVJoMklk?=
 =?utf-8?B?VCsxaCtSQW1TMGtvNDZqVmhuNU9JZkluUXdkYWorMDVWVE5LZitxdG95YTNV?=
 =?utf-8?B?MHRaakdOaS9uSyswMkxWSnZlL3pBTGd1a2V0eHQvQ3RCbUdNWXNPdDV2bzd4?=
 =?utf-8?Q?m3vYKkeVri4ock5sLy8iqeG/6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e798ac-2702-4574-6bfd-08dba85b6532
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 06:44:29.8233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9oktrBfb/HAgIvEu7bFeP1BKeMAi7VdYccdHYCZuMwwThEFPzU0gNzZxE2csXp6ZHJm/XoMQUv2prDnD5MiUqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7842

On 28.08.2023 15:20, Simone Ballarin wrote:
> --- a/xen/arch/x86/include/asm/hypercall.h
> +++ b/xen/arch/x86/include/asm/hypercall.h
> @@ -2,13 +2,13 @@
>   * asm-x86/hypercall.h
>   */
>  
> +#ifndef __ASM_X86_HYPERCALL_H__
> +#define __ASM_X86_HYPERCALL_H__
> +
>  #ifndef __XEN_HYPERCALL_H__
>  #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
>  #endif
>  
> -#ifndef __ASM_X86_HYPERCALL_H__
> -#define __ASM_X86_HYPERCALL_H__
> -
>  #include <xen/types.h>
>  #include <public/physdev.h>
>  #include <public/event_channel.h>

See Julien's comment on the similar Arm change.

Jan

