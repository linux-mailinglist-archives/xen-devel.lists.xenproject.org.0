Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDDA49AEA3
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 09:56:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260018.448948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCHbt-0004wQ-67; Tue, 25 Jan 2022 08:55:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260018.448948; Tue, 25 Jan 2022 08:55:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCHbt-0004uZ-33; Tue, 25 Jan 2022 08:55:29 +0000
Received: by outflank-mailman (input) for mailman id 260018;
 Tue, 25 Jan 2022 08:55:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCHbq-0004uT-Tq
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 08:55:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88f1f303-7dbc-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 09:55:25 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2051.outbound.protection.outlook.com [104.47.10.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-kniLUGuaOseSCvRbW7L-Rg-1; Tue, 25 Jan 2022 09:55:23 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by DB7PR04MB5081.eurprd04.prod.outlook.com (2603:10a6:10:23::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Tue, 25 Jan
 2022 08:55:20 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607%4]) with mapi id 15.20.4909.019; Tue, 25 Jan 2022
 08:55:20 +0000
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
X-Inumbo-ID: 88f1f303-7dbc-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643100924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+67q8GZx1mxeatuTqvwtC3MLyEd68icKe5zBuWa0rKo=;
	b=VkLOGnAVA5cBqbDUcqNytPGCvV9sCEV7/WaYrpGmishcFx4pANyLMeAQ73TLgEjvQ9KhW0
	CSxwwWvzwcc0r2Pm3Vjzc2647Yl76jqDOWAk8+B9INvkY03aygB95HjroRgkTGZS/BQIJR
	ayglf/Q+VpG5HPYE6Ipu+N5EiCa2+YU=
X-MC-Unique: kniLUGuaOseSCvRbW7L-Rg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ITkM38T43qvx0T8NSk/c8clzsPX43UnNR2H8wehsWYW80IocJRLgD+4mNUbb0EIUIA+QPB6azAN5ci0XWfw05XM8hureyhThY+uSxPKjsa6g27RhhtgMkbAn9T75JHJGZsut0omy90mq2xctzmm9FBcw9Ond9jYH8odg7G4NiTilspKaRUlD/omcajsIy5LNF2beqUxjrfpKyr62yP7dbuicgDRwrjiAkQwNfXvpTPedXONoSBw9lF1Jn9CYm0qtmRq1rn3NBX3SPGwXT5ni1TZ4WrzfvBBUOn7oe0VXmzfngO1u0L1gquK1o045N5Yq08nXYNXSum43/mwAyrZH8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+67q8GZx1mxeatuTqvwtC3MLyEd68icKe5zBuWa0rKo=;
 b=PzmMtv+lsijYqYh7CTuDl+uqj/ScGoi5Okkw8FSuIpYatpGcrMVE9R+O3V+PoHbXs0OajsjN27xq7/lWViwE+rgdi1eyF5q+feo4EBktH7l+ka8yYDLMWa7Yk44CtRFd5FevRRTi3VenMOWCQOyvJBgH7mRc2XPIm7fy9PtEQaKBRPA4z2M9L64XQe83Auel0+W76NQG7OWXlUQdwVGGT3kignHx5+5yX6umdHb/NrCB2ujfE43ot8oEOb+EXV6DWM8hJctrvxZ7v0RMx0H9UgNSvek5Y+4TuxFXbrx7vZ/acrH/yWAKJ+5Y1FB1fCk7SVOyAFafSyVXsZ6bcO//7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e6c217ba-2723-45ca-bb60-1c181359d261@suse.com>
Date: Tue, 25 Jan 2022 09:55:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN v3] xen/arm64: io: Decode ldr/str post-indexing instructions
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, xen-devel@lists.xenproject.org,
 stefanos@xilinx.com, julien@xen.org, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, wei.chen@arm.com,
 Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
References: <20220120215527.28138-1-ayankuma@xilinx.com>
 <20220122013046.6a786d3f@slackpad.fritz.box>
 <18e715ae-111d-58e6-55f9-a48a521e99b3@xilinx.com>
 <20220124143601.3e2ac6ac@donnerap.cambridge.arm.com>
 <bae9a35f-be42-2ebe-5ce0-30e08001ae97@xilinx.com>
 <alpine.DEB.2.22.394.2201240941310.27308@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2201240941310.27308@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0043.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::12) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6dd3a285-2e5a-4787-4b30-08d9dfe06ab0
X-MS-TrafficTypeDiagnostic: DB7PR04MB5081:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB5081F4719D837A98335C90E4B35F9@DB7PR04MB5081.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PFUp2iUggQi2Qzv8rwdnQgXfhinCYvpGIS/rlejZ5rr8bTus3UzWrVIJfiL2GKPxFyhUeC5TBRgukNQXjm3aD0Th50AhFbMbfEaOUt2+F+c1kUrjWnkZdmQqWzhCT42JgnqmDxpFwOpZtHexHK4/1krahd+ztgz0uy7Tmb0FmMCVPbzfluUofytzw2m33BKW6wGGHql3rBmuoVLDVZm8jWJtPVa8LgXpfqwzYuMrjq/UW96A1SKd1pZb/f8zRs8QLcRc8446tzByGE0+1j1r3WDLlPsCR6wVT2EHE8r9MRqet6ZFBP3eh7f5Gq3Dnes8Q+zHIHPxIbeDWs2xvtCYBFKVx/qvqdu+agG6VE490Z9+Xix01eLKfUzVSmmlDWFQ9+nRtHQn7FRsZkM5US/S7mV4hf/8T4kBx8wNS7f8kuOns1tQNFLz/O4CLeiz03sxqnPVgZIVnLO3JtIjU6LxhFLfDlr20HlEMnLR/VNFrRMlhenllXQaN1wJ2QFum4JcP9ejieLHSHVvXaxRdcyStQw6yUpmjTVaVKLRODGVnSAf8/7+a7bZuQSf1Y3lQT50lUgNvS9diJ9VGPFyr7jBk179gBrwz1ulIJkajJiFVJie/Ig3+uCwpODwXDcurUnx1cc1+BqUz1pUcdHT8PtCdW08uM2Mn8cHyNGQYMHtPvR9ot4g7LFBY99dbBAiuptySCza5Lunv+O1dsXd8aAvKIRJ7QAl0qheVllWiqd3FDU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(316002)(66946007)(6512007)(36756003)(8676002)(4326008)(6916009)(66476007)(38100700002)(86362001)(66556008)(6486002)(54906003)(26005)(53546011)(186003)(6506007)(2906002)(5660300002)(508600001)(31686004)(2616005)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWU4MFVOSEVFUWZJYUdCcUNKU3JMVTFvWTlJYWpzRVFoUjAvcTdvWk4yT1o4?=
 =?utf-8?B?UStmeGJmaUNENExHOWhpRG5nb1E4dlVQbW9JUzBGUmk3aDZsdlkyNGxRNEVW?=
 =?utf-8?B?QVRjT3dBZGQ4Zmk2SSt0Q3dlYldLYW52TS9jbFpkUmJGL3pabElLZWt4MTBR?=
 =?utf-8?B?WXczTDlqSHFWOTRlSHNwNUNkbmFCKzFUa1B3RHEzcU5Cek5kUFIxeFNuekFI?=
 =?utf-8?B?b2wreG9WSEdGTE4ybTgxNU52RVJ1WEV2K3RISzVja3l6UFpxamhsanl0NGdG?=
 =?utf-8?B?MnpqOHVrRlZqNmNTdGR4VTFaS0pIZ0JwWGRoa21UOVlvNmVnVDNSN1lpNDlZ?=
 =?utf-8?B?ZlBXaDVOTVlRQnp1QkpMN2NFa2pmanI5aVVqSloydmw2bTJvNkVmUnlmckZH?=
 =?utf-8?B?dXVXRjJBVkwvQkVGOXlYWjRmZUhTazNTeVRaUzZKNHlUWnhnY2xlMEZIS2px?=
 =?utf-8?B?VnUzZ0xFRnQ4eERoQmJyaXBQbFUvMTJDTWcrUktkMEZqc1EvdktXSks2a3Zv?=
 =?utf-8?B?QkV6azN4NWtpaHBDSmtrazhQTWNZWUdMWW1jK2xaWGNNTmJVSHpoRllSdzJn?=
 =?utf-8?B?WGEvM3g2WjZiZG9GbE03eFAwejhYNCttUTFySkkwYUFKcnRnT0d1ejAvNlhw?=
 =?utf-8?B?dzcrUHFUUDVYVE1RTFE0ZzRSTkR2MXJEa3VkNG5rSUVmUjFQTDV3NXdZUHJF?=
 =?utf-8?B?cG1yZllWOVZGTWxRcVF5K1M1WVo0dE02SWpjZmRtWVBGQzFNcTFGSEJVNkxI?=
 =?utf-8?B?TGF6bUpKaXFBcmdidGRpZ2lEcFhLdjJwYmE1bkcxOVBlTFhQbm0xcmcvNEti?=
 =?utf-8?B?TFBobW9hdUliNEh5UXVJUnY0ZExCanMxRXE0K1Y3WXMwdHA1NUVUQXJoWEFt?=
 =?utf-8?B?VENmQmF2b1FqQjNLd2txWkhrSm4wM1ExTG1mblNYUUlIOFpod0NVN3V0VkRy?=
 =?utf-8?B?dVVOOWlzc0dPa0pwcURXRS9JTzBBcWFWc1FTb1lGZnR5TG5yZkpkdFJjOCs1?=
 =?utf-8?B?eEh3V0ZsOWJ6STF4NUZGbFA5YW9LOXBzVzN3dVRUU3ZxUUFmU0R3MzYycXFu?=
 =?utf-8?B?Q29EVU9BWGFYUk9XL2kyZ0tmL2JsZldrcEg4NmRwVHRwNFpnOThkU1dKQW01?=
 =?utf-8?B?NWJmQ2t2YXhWNlhia0VKOFc5WWZBQ1ROMG1RNWlZNmtYZUNiaTZKRmlNaUVu?=
 =?utf-8?B?WWdIQ05GZ1JvZmxKUzZhckhiVW1kYWRHL2pNSHErY2szT2RWMzR5WllJVFZv?=
 =?utf-8?B?NkFuU3pQL2NCNWlBM1lDVndaUEwxdjYwRm1yYXFCK1RmZWtCRFlYalM5VGtw?=
 =?utf-8?B?MFJUeDFmeW14UG1vVnc1MkROd2ZNVkpVZEZ1UE52Y2Rza2ZiVExHS25WR2xu?=
 =?utf-8?B?eXIzdGJnN0Rld3BLL3cvSkIwSkQ5bGFSTmhYTzFsZjIvZTVEVzFhUUhQVFly?=
 =?utf-8?B?NytpSWRlMHROR3hvYlNna0J1a3YxRzIxdWsveUNzSVNCSWNzNXpiUForZXZC?=
 =?utf-8?B?SVVOdGxod0JabmlJdXRSK3JzL2ZOWEpQTTFkc0Q2ZnVwaU5rejRaYkVmemJV?=
 =?utf-8?B?OHBNVWZRY0RXdHlZMWltUDR5UExpUElVSXR0ZHdyTjh2dE9peFpDZ1dvb1Vo?=
 =?utf-8?B?Y2p1YUJKQmtTSFpmdE1RckpVRExqdGJRaGcvZGxIRlJYZFBpcytYbTg0V0Nm?=
 =?utf-8?B?dzZmR1Bxa2lCaURmd3I2ZndEdnZEMXpzYjkzZTdERU0vN2drZmJYWW0xUldM?=
 =?utf-8?B?aTRFckxFbFpHOE9yMWtXQ3lvNkxrWUhNTDZsKzJiZVBGdy85OHNNbTkzSmRG?=
 =?utf-8?B?M0hETlhmYkZ3WnNHMk8xZG1BSktWaXo3TlozbDBYL2hjdHZtZi9lZDFYRVVZ?=
 =?utf-8?B?TnVlaitqQnhZbTdKVmRYb2doUW9ScE1PU2xVVjErNXdONloyT1V1STlHZHJm?=
 =?utf-8?B?RHRRZVRMM3h6c1ZYMU1EUWZFT2JPNGUrZ2dkeDdDUkdFTzJlcUpYYjgvU0g0?=
 =?utf-8?B?aTRVZldMdXJqb0Q2TVpWUnpCL09WQ0k2UmNlYmpINElqN0hiUi81N0V2TFR5?=
 =?utf-8?B?WHBJVnhWWkNzSVhvRnlKeU9Ja3I2eHVoaHE0WVNET1BseDBQbVhqV3VsQ3hC?=
 =?utf-8?B?bnNrcU1BVlJSK2FUOTZlSTdQeDZqcVh4bjNjYUNPVjkyajJwZllMcE4ySGFW?=
 =?utf-8?Q?pKN6tosdFqEY2R9UnCvrMq0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd3a285-2e5a-4787-4b30-08d9dfe06ab0
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 08:55:20.6648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pu2RILz9+ShPfgOvoSqZO84JfS7ldaAfxJdafhZiW9QftZXx3iMvQfULDrUDoMEINHj0Pkuxuobrg1EodFTkxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5081

On 24.01.2022 19:41, Stefano Stabellini wrote:
> On Mon, 24 Jan 2022, Ayan Kumar Halder wrote:
>> As for the patch, I will mention this issue (as a comment in the code) where
>> we are loading the instruction from PC. Stefano/Julien/Bertrand/Volodymyr:-
>> Does it look fine with you ?
> 
> As this issue could happen on any architecture (the guest could change
> the instruction from another vcpu while the other is trapping in Xen)
> and given that we do quite a bit of emulation on x86 I asked Jan on IRC
> how do we handle this kind of things on x86 today. He had a good answer:
> "By not making any assumptions on what we're going to find."
> 
> In other words, don't assume you are going to find a store or a load
> instruction at the memory location pointed by the PC. You could find
> total garbage (because it was changed in between). Make sure to check
> everything is as expected before taking any actions.
> 
> And I think you are already doing that in decode_loadstore_postindexing.
> 
> These are the fields:
> 
> + * 31 30 29  27 26 25  23   21 20              11   9         4       0
> + * ___________________________________________________________________
> + * |size|1 1 1 |V |0 0 |opc |0 |      imm9     |0 1 |  Rn     |  Rt   |
> + * |____|______|__|____|____|__|_______________|____|_________|_______|
> + */
> +union ldr_str_instr_class {
> +    uint32_t value;
> +    struct ldr_str {
> +        unsigned int rt:5;     /* Rt register */
> +        unsigned int rn:5;     /* Rn register */
> +        unsigned int fixed1:2; /* value == 01b */
> +        signed int imm9:9;            /* imm9 */
> +        unsigned int fixed2:1; /* value == 0b */
> +        unsigned int opc:2;    /* opc */
> +        unsigned int fixed3:2; /* value == 00b */
> +        unsigned int v:1;      /* vector */
> +        unsigned int fixed4:3; /* value == 111b */
> +        unsigned int size:2;   /* size */
> +    } code;
> +};
> 
> 
> This patch already checks for:
> - the fixed values
> - v
> - opc
> - some special rt and rn values
> 
> Considering that:
> - size is fine either way
> - as rt and rn are 5 bits wide, all values are acceptable (x0->x31)
> 
> It doesn't look like we are missing anything, unless imm9 is restricted
> to some ranges only.

Beyond decoding there's at least one further assumption one may
mistakenly make: The address may not be suitably aligned and it may
not reference MMIO (or, should that matter, not the specific region
of MMIO that other trap-provided info my hint at).

Jan


