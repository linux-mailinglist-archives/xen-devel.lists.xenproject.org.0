Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB594A3FE9
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 11:16:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262903.455355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nETil-0003JK-Pb; Mon, 31 Jan 2022 10:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262903.455355; Mon, 31 Jan 2022 10:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nETil-0003Gy-ML; Mon, 31 Jan 2022 10:15:39 +0000
Received: by outflank-mailman (input) for mailman id 262903;
 Mon, 31 Jan 2022 10:15:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Fky=SP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nETij-0003Gs-IT
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 10:15:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb1a8cec-827e-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 11:15:36 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-tGfz8cQvMI6h0F_d_HeNwA-1; Mon, 31 Jan 2022 11:15:34 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7406.eurprd04.prod.outlook.com (2603:10a6:800:1ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 10:15:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 10:15:32 +0000
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
X-Inumbo-ID: bb1a8cec-827e-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643624135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A4cgaE2+3en0zvdAOuSnhC07PIijow6P6IJj2CJXHmI=;
	b=ZjvSSam8IsDAdthTLUT82UiFFjbJigmnfsbqANVDnE3NZu/sO8sWktyVDioFVlXuz3zlCf
	0KWkgx1nIXRvb84aS+P6tO57nXjJrx4kgPEXdAYOFxvS5QgWag30k1QRb48cwdcUel6v7X
	dyiMnjwzbhtfpxrEki0EziFEjFxBqgg=
X-MC-Unique: tGfz8cQvMI6h0F_d_HeNwA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUWcxRKrYgB3ICw3Yf47HIJS/o8LHr5WL485yej7Df/bPet2rebokHCrTra7DBJzgFG8LPuPSFi6QlG9yYokiJADwr4mpySrn3+HjQhs054bzkddwgkgVAI6QeyFPG8xAIOAFZepeXs9f1f3+6hUgJ43r4wixzCFw9Xh6lD1aR/9098/U4Ww0k9XRVVgdcq7KtobySCCidKqgGSoWMG1h/itmqT/SGsvm91CDKo+Xvl7u1gEueqsYjKtFeO2/dY+3uer+VIuWwSQx58+UNe312zLH16VRVQwzvTRKI52HXeav93U0tAZ8EOONK5lrMIDAbRqhrltd9SwLRD1WSTGWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4cgaE2+3en0zvdAOuSnhC07PIijow6P6IJj2CJXHmI=;
 b=jIpxLMsy33ayRCS2GboQp5QwpVuCTqyVtgzA7mCYCPo16dpBe3+nhZLgilMlIAY4FCitQiGNtEOeddgKd0qD64twKXkdIkicwblrRdLXAj5o+zn2k24/f1V3oWd9qxBzaRi4/mczV8l6wu7TjNLdPOmNs5MAGXBiwj3MzzIuByzm1YdEr8P151vS/2rHp1pZoR6OXVMuXU1bzoFFlVnbyz3wdWhnDwgfG52Py4RTPMmAgbD9u4UqXAN9cbmLfps23F9XZNiVuSfVkIq9K1OyAVbP5nzlduRI/3rGldN7BfghAStrKWRtnsfRDfl0ONSM4UFL7q1QDiPOW44u894gbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <23ac2bed-9ab4-8b4b-2861-3362434dea61@suse.com>
Date: Mon, 31 Jan 2022 11:15:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 4/9] x86/spec-ctrl: Don't use
 spec_ctrl_{enter,exit}_idle() for S3
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220128132927.14997-1-andrew.cooper3@citrix.com>
 <20220128132927.14997-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220128132927.14997-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0019.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c4ac7a1-037f-4fb0-1d4b-08d9e4a29d35
X-MS-TrafficTypeDiagnostic: VE1PR04MB7406:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7406FC44CF72B85ED16E9A05B3259@VE1PR04MB7406.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w0rHSvyfPkNSkqJarBqclrxXSsuANtCyLz8Dkk0RU2zm+z1L//PdMQVuAr532PXRmX+ymRk8YcNt70lp9UObQmr8RfOQE5O3F/pAqzdi0H+gYouZVqM3ijVC59BzwFa68yXEzBpNSNEQM5De17rdXQK67dcOgddkJq7IOAlBoyG57cPUaXR71i4bUvWDPRsFCheq5ysSrrwJMvUZ2rk4Ya2KQyZxHfGvpzj715u+xo6cAvt2qYwFO+p3HakmCqtU0ybDwf37wefg6jwvEde1Tnwn/Qm2GLr91f8PZO2BSiaMTUWEMIAgf2g6ErwREuromLgumyLgGM7K2Tc6P6KuWTrS55XoKK5GJxkigWVpGv+SEtvlGKSAxtIn36R4p8TLM5slMA4q9PBVajK9LMMt2l98jRrZ+coShg3zXvXqM9tDvS/YbnqJ/PgFjnl7mhpl6DCzvGdmjp1t0ovCbGRYQkaHVfMxIWErXmx+WelnOT8wHERYeANR1eKCC+niW2wPPpLek4GD5TxpK/RmHY+ATR5Yuhdb7ZLaRg6rAWiGLkgZozzJdQieB1B9T6OE56X8N9yuf2lnekiXkcM2CqTSVMuZZlI9u7P1XmCZW4mCjjtrdF1aYoN75dTFBrPSAyAefeXh3YUiNVPO/8Arjo4ToBQYbptGGfficV/cB41NZTc8aijrppTEBw6l1QZUDOya8QIMo1HCuJqxrs/bxbyCyext9yhEDsOtzLIGRJkputM2ahP+Zo9jbxM1JTy9ZpR+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(2906002)(186003)(26005)(4744005)(508600001)(2616005)(6916009)(316002)(31686004)(6486002)(54906003)(66476007)(66556008)(66946007)(5660300002)(6512007)(53546011)(31696002)(86362001)(38100700002)(6506007)(8676002)(8936002)(4326008)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnN5amM3L3VrOXBtQkp4UE44MGY5WlI3TmlNSnJReHpOaC80VFBuK1duZ1Vk?=
 =?utf-8?B?R0hiREdDUDNCR24xSHNhMGxLOFBnVkVPalQ4M3pGUTV3SGZnaEkwNGxZUWJN?=
 =?utf-8?B?V3k4YkFxbFJjZDZuYmN4N0Nwbzl1MEJNNjRNdCtrbzUwa3RBOTFwZTRSQmg2?=
 =?utf-8?B?elhPbDV0amFHd21reUJ0Y21paXlYN2pzNEhvMXVwOEIreVlFd3lQd2dsRUU3?=
 =?utf-8?B?S2Z1QzNncjl4OWE1bVhVTm5raVhwN2R3ZHljMVYwWHE1anlJVG9aY3ducWwv?=
 =?utf-8?B?alBGaXRlUEhxa2ZMdTV5cHc1RWNxcFlmenRiM1NRZWg2S0VwZkpUdW9DdkE3?=
 =?utf-8?B?WU05d3hQUktKSjY3L3hWTE9FWnBXbnFKeUIwOXNTeDJJalVxNktXR0EyN3Bh?=
 =?utf-8?B?VEQvd2d0KzIzNURwa0FZNjY4OWxzQ0diTlFYNUF3Nnl5RDdkaGQ0N1gyWFdX?=
 =?utf-8?B?QXlmdEUvTWkxeVhkcnl1OGpNVksrd3Qvbk93SWcwaFNhaGVmSVdTSU1OSEhG?=
 =?utf-8?B?UmZYOWNVMW1LNkhGMjN1MVdwOVlPSVl6N3BJMnpTRDBScjVBNHF2b1VMZ2RC?=
 =?utf-8?B?WlBCQ29kU2ZNRnQ3YXZCMUUzYTZETnY0dUR6SXU2c3YrUHFiQ0lJSFgrbWNS?=
 =?utf-8?B?QTNGcjE5bllRS25DY0dqNlpmak1EalNLK3E1U3BoRFNkU3JKNFdYOWFaS01p?=
 =?utf-8?B?dngyelVKWEd2U2tNSzk1RC96aVpnTk1uRVd0dDRISk9OSTNnMmFGU29OZmts?=
 =?utf-8?B?NTBCOG5reEZncS9vSEJ5aVhtSUpZb01YWVQ5cW1CTllWWDF2VEtFaENVVEZK?=
 =?utf-8?B?SjVtUVk3ME8zVFJidlNkNmNORmprb25ha3NoaUg5M25INkdKeW9oRFNjakJs?=
 =?utf-8?B?aUpwRUNTR2JkVElHMjFIWmJ1YzFyd01zcGQ4a3hHM0hNOTdHVCsySWd0Y2o1?=
 =?utf-8?B?QWlDMUx2bWM5RzhtTjBreEZQeDcyTm1Kd0lQYzFRWDR6aWRYTS9pcjM5cUdt?=
 =?utf-8?B?b0gvQnYzVkMwOE1oSk5WNTlRTlNXekN6UWxJWU0vZGJZMkV0VE5qWTdqWWNt?=
 =?utf-8?B?VzB3R01LUEJPb0NzNnZWWkRuemdzcHEvN1ZMZ0JxVTdNeTFyaE5wU2xuQnBV?=
 =?utf-8?B?YStUQWllQUVPY1ZFRTE3WVJmbDRJY0l5dlFyWFUyZEl2YzFnQ2hvOVYxN2tt?=
 =?utf-8?B?WHNlUE5IR0N0d3lxY0VwdHZQUzRUMDE2VzRHcC82OVRJWnpqeDFNQnhTS1Ru?=
 =?utf-8?B?M0daUE9ld2Z1M0hYWW5JeFkzUFlaazVoYVZpV0IwREU0TlN6U2sxZ3BHM1Nh?=
 =?utf-8?B?OWcrUi9pN2hhRXNvMUxtK3VnQktmMHpMaElxandpaENGQ2phYStQMThVZ2lp?=
 =?utf-8?B?TEY4ckV6TGZPNGpyejBFaWNEMEdMbCs2VHNhQ0IwS0dTSll4a0FEN3FyV0Iz?=
 =?utf-8?B?SU83TXhRSU9VMWVuam8zQlByaVVCVFcvaUVBeFNNSFZka2tvNkw3K0lhNTdk?=
 =?utf-8?B?eGxFSVlZazFEcGJLV3VkWVF5U0dOeWREZ2JSQzNhdzNaU0JuNmlIRWhkZnd4?=
 =?utf-8?B?OFhPMnFHemw5VmJOZVlNTWh1UGttbEMzakgwWElpWnJDSXRsQWc2NHBZQUpr?=
 =?utf-8?B?Q2lUeFA2ZE9MaGcwQmdLSVpnQUx0dStpbGEraU9OcHJJdlQrTDEzc1c4Znlt?=
 =?utf-8?B?b1ZwcC8yTndISnZVVnBuTURLQTZ2dy83LysyZXlIbnkwSUVJY0gyTnBueHR4?=
 =?utf-8?B?bUhXbXJjT0J1RTNNbElKcDZkUEdrelQ2bHU1cjZXU0xJc0IwZ2ZPbUZydi9D?=
 =?utf-8?B?RWRacTFBdjFldXNKVkp2RldGWlMxTjg2SjkvTzdtelR2blYvUHVsb0o1OUly?=
 =?utf-8?B?WHlBZ0JPQnJ4V1VmSmhPaFdFZTlwM09Ucm5Ic0FJTjUrcFNyaDhzWTZTbHhs?=
 =?utf-8?B?end5eXN3YlJVL20wbUNxUUdSN0dmQVd5cVkrVTRoTmZjSDQyNWNvTkR2cElV?=
 =?utf-8?B?amxNdFR6c2xZaHd5azBkeHRubWhZNFh2R1dJZnhTRHdPcnZPQlljWVg5OGNo?=
 =?utf-8?B?Z2h2TlU5WTRsQzR3V0RCSnRlWEtlZTZrMmQ1MlBTSmVSdkRrTG4vbTV6Zml5?=
 =?utf-8?B?OWUwMElKWHA2bVhkT2JuNWZxQk1Kd1F1d2xRN2RmMHI0RXhpTUlHQWJCWWVo?=
 =?utf-8?Q?0zaEZ7iV6MXYelGfXzGlqjY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4ac7a1-037f-4fb0-1d4b-08d9e4a29d35
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 10:15:32.4068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/zY1wF1gAufpC5COfiwD8DzoqjlR9BPU3rT4OpFwYpeOi5FFYTeXByH9ONxd0m3+2CwsCIB/G3PhyyfdmI+iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7406

On 28.01.2022 14:29, Andrew Cooper wrote:
> 'idle' here refers to hlt/mwait.  The S3 path isn't an idle path - it is a
> platform reset.
> 
> Conditionally clearing IBRS and flushing the store buffers on the way down is
> a waste of time.

I can buy this for the flushing aspect; I'm less certain about the clearing
of IBRS: Whether the act of clearing is slower than the performance price
of running with it enabled is unknown, I suppose?

> Furthermore, we want to load default_xen_mcu_opt_ctrl unilaterally on the way
> back up.  Currently it happens as a side effect of X86_FEATURE_SC_MSR_IDLE or
> the next return-to-guest, but that's fragile behaviour.

I'll assume from your reply that you've adjusted the description as well.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Preferably with the statement above softened a little:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


