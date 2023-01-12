Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0062F667327
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 14:27:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476151.738179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFxbJ-0008Cw-DW; Thu, 12 Jan 2023 13:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476151.738179; Thu, 12 Jan 2023 13:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFxbJ-0008A3-AM; Thu, 12 Jan 2023 13:26:37 +0000
Received: by outflank-mailman (input) for mailman id 476151;
 Thu, 12 Jan 2023 13:26:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFxbI-00089u-CK
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 13:26:36 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2084.outbound.protection.outlook.com [40.107.104.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbeee11e-927c-11ed-91b6-6bf2151ebd3b;
 Thu, 12 Jan 2023 14:26:34 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8988.eurprd04.prod.outlook.com (2603:10a6:20b:40b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Thu, 12 Jan
 2023 13:26:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 13:26:32 +0000
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
X-Inumbo-ID: bbeee11e-927c-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PIxgZpukXDuuEhe/KP2JHX7ZArgrhbQ5xGGRtJ2Dk4bUEJIkAdusV5++PK4DeE0CwSfw0VTHh7JdwNBgzI768ZP7TTXniFAaUP3l5VianpM16VplY2Iy3uVSc3RnfftvzjTn+88I2UTALCgrj7ad6vK2U8gTjjP8gPBDLGStbZc1cTollKPs9rHjbymkbEwsstLoVKxDUKyYABxskZcDrwfzqLRAlxNr4RssXlKf71g9kxT60x8eCWju+TnSaIGNGu782b1g6NSSd7BeuXiFoCnhFCV097iMwoglmX1rWA2mDiDh7cbhHWaE87GkvHFxFGVm/8nPCunzWDdl6w3tcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hH7GRJMJLboLqQxfrRCU7JHmsgaKy1telQ3E6ETmio0=;
 b=g00V5ZNpwNG69VkcoIYGvUStRUXt0OvuIY46caJpHof0em34B4GfvR6VS7aMeSbd/aaGHJeRR5v1wExTVoSVkOC+yV1NiJs51lMOwofb/nLWnKb/NphLR0ZOi364j0QGffyMJvAJxwVo4ZBtdJqGJ9H2pt75wJwKyZ0rmIyvQLG4RnEUlETy8L1IR26a7mJXahX4Q+g7iMJq4dDKX0nQsAbkq7ohn2Yqd51FcPE6CGuPZycENcWBt2WL8/0fcYga/JzPxCBUBL1v/24SmbKYmQKEVwsb8TsX3XooxanGgZpv7nC40Hn8buvbZ0N2Vkr0sZgvOzonCtyOus0egr+G6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hH7GRJMJLboLqQxfrRCU7JHmsgaKy1telQ3E6ETmio0=;
 b=ADP+3Gi6h4pkTQbne3+Wdo56xlqncPdciOW7iNPGt8ab2ZoqCBiisHemY6WspMshPFrGY4mqFX5WWCVFCNvXPciGEbX2DXLCIvHKL4apAQQTJfmnYkXlstqJpcLklHkMOVO9BcPvS/8PL21z2RsDxyo2qAXKVrhNOY2bD89lpSeL1HEdKDH48TWb5wx42Le43BbryG6EwCcxsSKAg5A1SMzjiq/0qyz157wEhBRLwvvz2MzIAKrZZYo26Z8kz5quVZtoYoweUca3+9TN4dJjFEytw7McLJlZZAWWMOtuEfLpmg9Lqi8mWf7pxGS1y641mDgen5ubs1FpFJQTUNiIsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f64f0bbf-8f47-e897-eb7c-51f11c9ea4a8@suse.com>
Date: Thu, 12 Jan 2023 14:26:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/8] x86/hvm: Enable guest access to MSR_PKRS
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230110171845.20542-1-andrew.cooper3@citrix.com>
 <20230110171845.20542-7-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230110171845.20542-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: 59f23e35-1ada-4d3c-ed19-08daf4a09eeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zAWqc9lnWdCTfSXrYR2lg4mlVBCZONCcIhmc3n6gRPmZk2LT9yXeJqLfsuebKqo25rTUnHQIxB53y8d99cXF6tVKAi1pM1z4nnYL9xEenZv3W3yKXGEyttnQ/qYMAiGJnWiF5UUVzC5dZ/i92Gt5kKR+JHa8XrOMz944c4/3G92JJ8DMVV3rkO0hi1SpC7eFUX9ijkuD0ftm5BSqOKponpb2KNvn2COxeD1IbR8DbTP4nZYdZB0lyGFNWRbUcMArIZtiwDofFM5hAoh0M5T7uMY2d7ZhlLNQD6vgj2kbG8QpnyUXnUVsvBedmK0oqM0gPEa/2nxz57bHYBa2k19ld7aNowBpVci9Dqw54BK7CsEdvsbXVjJjSH2olsfOWu+uah3Hqa9Dj/wObvuxTsM3pcZh32ixrKpJKfJFx94Rak3Q49wjnyomTmaEYw7cCDyOgEXTk8tJDJKC/mju8Qmd3wOjg3iZV2An4v/2bTkWRecKrdJX6Ip9zXTAaLU9/eG9A/RldMmLH7QNVL/MPOMMhTXgwLZx93HsMDvokFq7FEESJJvgvLbt49UGnycYENUni3mBE5nZ6+ng7kXGCMJlYJASabBsHTQNC5va3Y7Bwoq8ohvU6OG9Mqn10hE9jO04Wnd8rSXOM1sjk23yDqgWvU2unugTJD8VmdC+1OKjk+9g1q3gC9wZZXWzliOlXYbBD+9yKUktTxMD2OGB+G/ivYjwC2wK9JLZ10EHzKB9muY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(366004)(396003)(39860400002)(346002)(451199015)(8936002)(5660300002)(83380400001)(41300700001)(38100700002)(86362001)(36756003)(2906002)(31696002)(6486002)(478600001)(31686004)(26005)(186003)(6512007)(6506007)(8676002)(6916009)(4326008)(66476007)(66946007)(66556008)(316002)(53546011)(2616005)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUI1WFVqa29qLzRlYVVXTDFmVk9nRy9qS2M1MGo4RkVLOFR6KzBIVGZuYmNU?=
 =?utf-8?B?bnQxWndpR1F6LzVnYVlQbHlvWjZhMUovY0sxSGd2WWI3Vkxmc21GV3pwMUpl?=
 =?utf-8?B?UG81VkRUdzdVbnl2a09QajFkT0w2Y2cvSng0dHVwNmNvQWJKK1pTZzJvK2hs?=
 =?utf-8?B?TDVRUHAxMUhKcWhPcXRHdW9SNUdKdjk5WkNuRE5PTDRjWXhBOEN3aHhyZjY4?=
 =?utf-8?B?TE1HRmZocFUzQ3JDSEZlYWYwdlhmUGZlemltM3RIcXZESmM0Z0Q1UjlzWS9u?=
 =?utf-8?B?RmczSkR6SjhGNUxHdE1IOXY0MDdWbUM4NkxsRi96NTZod1djZzRvNXZUY2Jw?=
 =?utf-8?B?RnlmQkYxN3NOd3FoK01XSjl1NmFEY3BXVUNUSEpKQ2czbUdHWFdpQnl2ZmRN?=
 =?utf-8?B?VXNJanNTYTVhS0F4WkZad3dBMXhDRFpURTk5WmRZbDhtMlJ4MDdoUGVpWGtO?=
 =?utf-8?B?a2JDamtWTm51am9HUmRVREZmZ3JwT3lhUk5FYTNxT2FzNzV3MjRLZHVER2pu?=
 =?utf-8?B?U3MzL3JRRVd4N0IyWG5HL0MvTFlGMzlMd1lJWWQzekZLcllIQzJLKzRUY0s2?=
 =?utf-8?B?OTBLaVgyOWg0SjBhRVEyK2ZnSWxSWmZFckZkUkFJVmpScUd1RGJWZmdCOUpC?=
 =?utf-8?B?anlKTTMrbk5ZSE1ZQ3FUV3Rxa29ubzQ2eDdnNTlUaHBwVHk5MG5hM1h3cHFz?=
 =?utf-8?B?czA1K0tPdVVXejlIQmJpVEVuVUtkNnpFMGhhVldldGEwcUNXR09wYnhiL0Uz?=
 =?utf-8?B?M1ZCOGtobDFlYno4dnNvL0FMSjk5NVBUMERCc1FDRHQ2b01jY2tDeEtPZlRp?=
 =?utf-8?B?SmpWVlY4d254SkI3L0J3dkpLNVpHblFHVzJ2d2tmKy9wUmlnZ2VpNVN5b1Fo?=
 =?utf-8?B?clJ4S2JBYTdZd21CMTJTYlpyYkNNR0FtSHhJZVRkSlJKblV4NjBKL0hrSUhR?=
 =?utf-8?B?L3FpclZETFdVNm9mWUNpV3N0a0kxUVBxS3g4cFVpYmNITFVkaXVDR1B0cnlT?=
 =?utf-8?B?bWdlcGVFdGVpK01CNUxROTMzYmN6QzM1NW1uY1l1ZlZvdHBucElBcGF3Mzdn?=
 =?utf-8?B?alNmR2s4eGJvUDdiWE92bWN3ZGxMakR3Y1JlQzBMcGpNVGRYL3ZUbWdRSXhh?=
 =?utf-8?B?UGdCOHJOMFF3SzA4OE54NlpIY1J6cUxhQ3Z0YUErRThUcGZmS3IxSE9qODIy?=
 =?utf-8?B?YzhnVTlHajVUNjBUZGhmbHEzTVFYNGN1eCtzaGhGSTllVGJLV0lWeUlqU1lR?=
 =?utf-8?B?SDc0TCtFRDVtYUVXNXFONDNjWk9uWkUwWWthTFRnSGRLR215Ris2NEs3QXIw?=
 =?utf-8?B?UTdES1ViOFFxUzhsVy9OcHR2d0gvZFo1MUIzdmVOOE1rT3hGY29ubTZsSXpZ?=
 =?utf-8?B?Z3ZRRjZ3N1lTdEtnL3NWSnJZdGJwZ0szcEZPVnR3NVNTdk5xWG5jZEFpWS9W?=
 =?utf-8?B?bTk2T1Z6OXJLTjQ3SVFnY0NvK3pzVGZubGduVEc1QkZFcDJ6TG05VGxEUnVv?=
 =?utf-8?B?SFRtTzRIbnRMVzd1eGc0OXFoSFlYZXhHdHZlTm11MlBqd0Izc0VmMXBwTWJi?=
 =?utf-8?B?WlFqaUkzdzFpa2NMMmhNM3lBdEQ4SUpsdTNvZ09sQWFiRFhFUCttLzhyWUhK?=
 =?utf-8?B?TUVvWTIveWtXSFB5RGJ6WVU4TXlGbU1KMk1ucTdTRzNKOStVNU5FNHZWN1lX?=
 =?utf-8?B?K3I4Rm1WOEVUemdFbnNmK1p5RFNIbXV3VC9GcmYzUXVKWnhZNmIyUDZabkM2?=
 =?utf-8?B?VEVNV0E2N3MzS3d0WG9OMHFETmx3WlN2SzdLZ003NUt0WFNqaExLaEIyWWdX?=
 =?utf-8?B?WUp2RWlEc3VCNmEzRHNQRk5zZk1SU3ZiQmxUaUVBTUh5dHhJMzQvZURzeFVR?=
 =?utf-8?B?TjB5NzNCR042M2tHZkV3eStjZ2xIT1pXUFNldjZmWElyQ1p2SFBmSVZDMjkx?=
 =?utf-8?B?UEEydFJuMkdjd0dkN2kwTll5b3NQREpjcnNqMkFXR1oyTlQyc3FjNnh5Q1ZW?=
 =?utf-8?B?OEF5NVJBOTdnaFh3ZnF3WWt0VTFKMmV5d2hjdXQ3NXFXQ0c3RWtYeEI0SmEx?=
 =?utf-8?B?ZmI0WXFTdHg1SHpnUlFNZFdjNDR0bFJOU2JWZkplVEc2bzJCNHZ3WEJEc1dX?=
 =?utf-8?Q?0x5aiYaq4tlYOh8IVTNljmkhN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f23e35-1ada-4d3c-ed19-08daf4a09eeb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 13:26:32.6271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0CiWlnBcHvK/2ZpkbpERTqgOW/F8XJWihxCP9Au+m2zv/asqsQdLRloshM5ev2egCn3XNAtleapekkEXv8pNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8988

On 10.01.2023 18:18, Andrew Cooper wrote:
> @@ -2471,6 +2477,9 @@ static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
>          }
>          return val;
>  
> +    case MSR_PKRS:
> +        return (v == curr) ? rdpkrs() : msrs->pkrs;

Nothing here or ...

> @@ -2514,6 +2525,12 @@ static void cf_check vmx_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
>              domain_crash(d);
>          }
>          return;
> +
> +    case MSR_PKRS:
> +        msrs->pkrs = val;
> +        if ( v == curr )
> +            wrpkrs(val);
> +        return;

... here is VMX or (if we were to support it, just as a abstract
consideration) HVM specific. Which makes me wonder why this needs
handling in [gs]et_reg() in the first place. I guess I'm still not
fully in sync with your longer term plans here ...

The other thing I'd like to understand (and having an answer to this
would have been better before re-applying my R-b to this re-based
logic) is towards the lack of feature checks here. hvm_get_reg()
can be called from other than guest_rdmsr(), for an example see
arch_get_info_guest().

Jan

