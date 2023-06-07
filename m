Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6798072571E
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 10:14:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544462.850259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6oJV-0006Jr-JU; Wed, 07 Jun 2023 08:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544462.850259; Wed, 07 Jun 2023 08:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6oJV-0006IC-GG; Wed, 07 Jun 2023 08:14:41 +0000
Received: by outflank-mailman (input) for mailman id 544462;
 Wed, 07 Jun 2023 08:14:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdix=B3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q6oJT-0006I6-LI
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 08:14:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 574ff9d3-050b-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 10:14:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7225.eurprd04.prod.outlook.com (2603:10a6:102:83::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 08:14:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 08:14:34 +0000
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
X-Inumbo-ID: 574ff9d3-050b-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PvKZdhS/cOOl44uWDeswD3xxO/XisYgkV/vDdRISXRMvUGFzjPIQO+HDtN3Ps5VG0x3Tyrv34IBEyuxhAyrOZ7Tg7ACKP+Nx/8nmM7h4iFpURjORC6QmwGmLTcoVJeHKE323LmI8+wOfaOXJT3b9+XygpleFWQ4DnMCcmypwqJgTHpIqBgkIv25+NSp2rXZCiXPbGfLIUTPh9sKUNphgfEWiJ24uXN8v92DX0dU3Sh47MRfGRmlxjyotFp7d/Vn7YUiHf5nKcblksv9zLZCY1nMjsaUeqo5gQxGYaeXQ0ogjf5YFrEVLrilZZ7joeaMOhKa0Tc4gU0lb46DFPLNjaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1g3ISeRa7VRJey0FbHw9Y292xv4ZsdhCeKGZuofxBTo=;
 b=TJlig+ce7UQ9ZITf45xxDaxtOG1rxv/9+pxTh/gB+DqCetcTL082KBTjnJx2671GHmLJfGr4wXlluqYJk9hsL5VHNVQQBHBBaJea6PgSdnVpXU0/75g0y2oYBEoUvD41LCvmjRuhWgpIqapN5jYmgYCtUFegnNN1R9KsLOrBAAg2Mo5aUa3ZVM6nDo1vPn9dZoLNShBMhzjbqs5Ng5FOQCiuWowQvO7wpL2o3Df46nrmXmIDbUdgvI+ISo4Ovvv4Ja3stTBaZq05JPj0LB5xjFcFeDPOm867g9Kz58LR5tiNw/SIvG0DWTMfmqItGDb+TSExQX5a7WIXCvMaC9cI2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1g3ISeRa7VRJey0FbHw9Y292xv4ZsdhCeKGZuofxBTo=;
 b=u4LN9jHqByKX4OqtNhQ+HJuxYyb+Cs2k4bsyzcEN/qKMFVSwYvGcb6ZwliBEMjgmuP9Cv1lc5Q7ReZUxwgxVFv8iI4LlMlW0BmckQ6gZdGs3w6kARyBUvz73Vz6yNtdvbXVlCfM3NURhup5ur3qVKkUuD97Ijeae/I0hqC7ld08TWUKQiGVsJQnPobU2K5X5WTQTdLV/Kt01IZd3TAX5mJC84B79ZkrhokFZ2LbYwZfId8isPKcGGTfepvpXL1WlUuTpXAFn0kHCUy2kjHDdCedyxwT0Y5uC1rmt8ZMLWbjkHl9mo7rMS4Ug2o97UuAenrDReDWXiP3XEekl7innjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <37f6c3fd-5b7f-ddbd-b4b7-c72a797531eb@suse.com>
Date: Wed, 7 Jun 2023 10:14:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] livepatch: apply_alternatives() is only used for
 livepatch
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230606172307.38857-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230606172307.38857-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7225:EE_
X-MS-Office365-Filtering-Correlation-Id: dc5db1a5-3a3b-430f-b079-08db672f3a90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xAWjWHcUHxO6/5kfc0qddCvzNpxwBJ279o0JQNatF6YYjeG+AyTy50dSEGVmVOrV0WSgbjjy/AiG27p4mIZWb52hOadPBdHmiShWiOh1hah+prYqHumqv5GW/AoSuBCgAG9ydj6yi4XrLdl1PGLYnYnkZfYU2rGzIxv8VA4YA8r3QybRHDkHUCBSZGyQ6IlAShI9ZLphx/kXmFCDh3cXv5t71Ooz8wPPq4jFDcyCw6pqM28pq5hb1fJGStTDz71481cEbNPmzZCCYgypbUFUMM/VatXxIOeYFrrpsDGHfG2ygMBEeT48lKTieo8IK1MiRE15jnmyz/B0+lVYIh7Q0IgSG4Fh/1cJgJjMnhED75zm07WZGfgk99v4XsiltARg2rz8u2CePvV3yaqLG7KI5fhIjYOv6ldJASkq5hbdLlNX/i6esaUYgzcrV3eircE+zhoBnlvitDd+DylR5D2dir7bOFaF/hF6JcQHvFrCghbjAx+rCnnleC92ahU9EiGL4qjbFtOjseJcefki8C4Xc+UfwJ8LgxpZPeuZJ/Ct47U+Tk4ckD9rLTby3zvtUuEScTUi0lHH7x41tlDvDAGGfB16xeknVNdG/SvYWQb4H7OuUSQUp4PlyhkrHMCQv1YVbIGTafKuCSWXhqvG53m5Rg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199021)(66556008)(66476007)(66946007)(2906002)(4744005)(31686004)(186003)(38100700002)(4326008)(5660300002)(36756003)(316002)(41300700001)(8936002)(8676002)(6916009)(6486002)(54906003)(478600001)(86362001)(31696002)(6512007)(6506007)(26005)(53546011)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MW9HMnBuRnV5dmVmR0lPbUNPbjg1dEFwU1dyd3VKaDEvd01MM1RCU2N1ZlVt?=
 =?utf-8?B?NDNFa21iOC8rbDFwL2pldXhWNEpzNHJORnd1L2VlamZhV055RkNEK2RHM0Uy?=
 =?utf-8?B?VnFxOXVCMit2T1phSzAvZGJsWkdTQ3kza2M4WnE3Y09kYVhEcCtNcHp3L0l0?=
 =?utf-8?B?TzJpWVp5SythZHVPQ0pvSnhFVGc1dWV2bnVKeC9uL0JBbDgrd0hmZ0ZYSGxR?=
 =?utf-8?B?dHpWblovcXRwcmJINENvVWRBUEFBeWp2bEg1S3VrZHhRQkRNOWdWV1pScHc0?=
 =?utf-8?B?QXEybnZJS2UvNTJENjFLV2VqbjRSck1KdVlHNGhaRGZveUdoU3Jxd241aVBa?=
 =?utf-8?B?WjZ6ZHpmNFQ1VklIRFNHK2Uyd3dEZ2U4TUE5SWw0bEFSMm1mcWpmZGdraWhw?=
 =?utf-8?B?WjBMaGhub0VkY1d5dlB1S3Z1dEtpQWtpTEk0U3I0QkJLbE9nKzVGVHBPb2gr?=
 =?utf-8?B?eGlmLy9hT3Z0MEx4cjJkaFpUcHI4cXF3M0Vtc015MUdHYlB2ayt6RitTMUdZ?=
 =?utf-8?B?aGtBUi9qSldXS3V4ai9nSXZqbksxQzZRYW1Bb1VqYW1mOFRqdER4djB4MjlJ?=
 =?utf-8?B?VzZheFJkNGt3eU0wblJMb3oyeFFYYmJpeEhNdzRLSGtEQzZlaUZMWlN3T0kv?=
 =?utf-8?B?SDkwOXpEVm8rR1ozZTdDbXF1OWNEdWZ1UUtXOUZYQVAxNytFUTIra3BEdGgr?=
 =?utf-8?B?dHdxN0VHNVVEV1F0NXVSWld4b09YWlpoTnhpblpZa2VTL3E5SCtBL3YvZ2VB?=
 =?utf-8?B?NmdpTVVXa3FNU2JKcFJWT1ZudjhRQTdncjB1VHVIV2U5RGNEam5xc2tDeEto?=
 =?utf-8?B?dnVueEJQUkZQYWZGM2ljZCtacjhsUVVGaWY5N1BEQkREZjVYZy9FTks3VlAx?=
 =?utf-8?B?eVVTc3ZsaSs2Uk5tUk1wY2VFWFhFYXJ3cUV5bkdzSFZyOGM1TG9UdXR0K0Jx?=
 =?utf-8?B?UVRGWG9NYys5R1ZlSWt4cE9BNTN6MXJ3ZUVOZkhPMzNyaVBsM0hUeVFmeEhm?=
 =?utf-8?B?d2pCUGJKdkdNOGZOMDNiUWRsTWk2LzJhSHVvOHRTTDA3c1NnNm8vM1pMalhN?=
 =?utf-8?B?YjN1M3dwR2l0dFloUkdncW9sSXFGZzVTek4xMEVUaTAxbFVJNGtvZzFSS21C?=
 =?utf-8?B?RTZmZytmTFpzNkl4V2xlNkpBVVpQQWNuQVQ1MjJqbTRmM3h4V3pKNmxiR1Vt?=
 =?utf-8?B?OU5qWVZvQW04NndVbVFJdk5RbG5xWWVEeDFqRFVZTnRqUU8yNVFneTAwbmpO?=
 =?utf-8?B?QTJlQXRaUC9ENW5XbldkUTBuTVY1VU83RWJTbm5UNTdROE56UXFlNEVrcmt1?=
 =?utf-8?B?UFlSWHhkUGhqaS8rdDdVT3Azd3g0RmpwdmhkN2xPSkMxNitEalpQY2Z5Nmt5?=
 =?utf-8?B?ZHd3cUlqeHBzekpGY1F4M3RERWlIamFtdVpuRVZUQWtCUHE2TjRuemJWb0px?=
 =?utf-8?B?b0lnb29adEl3MzNDeUFpN2V0YllzWWc0bjM4TTdzK2xjbk5pRm1jUCt4M1RS?=
 =?utf-8?B?Y212VGFGdE5BekEraldjZEZ5WFdtckx1TWxhaDhUZ2Y4KzFHUTk0ek9uZE10?=
 =?utf-8?B?bkc0b1FwWkxISWFnYlpoSjFuVkVHcUt1ZndJZEh0L2g2MnV3K2JjSERjemlF?=
 =?utf-8?B?STIweElsenQwZkNhSi9VV2QvWjZjcGlzQlZyWGcxQnBYYkl2aXZKU2dGY250?=
 =?utf-8?B?cDZVRzdJRGMxYkhZaGZNeER1ZzN6TVV3MTJHY0tscVhkNDRhWDhFdm03ZENE?=
 =?utf-8?B?VXl3ek9VU3lSbmhITWo0Q2o0M3lnSzNPcGJ3dzFkaE02c2MyQUljS0pZOC9v?=
 =?utf-8?B?M0djaFhDRVZYWlZibDFpeU1SamR1MFo4MlVnV3J1NlZLUXIzMEFuaExiaUdQ?=
 =?utf-8?B?NEVTRlRyUUFjV0g1U09mR1VZSzV0aHJHNi92MnVTVG5mUEd1MmJpM3NoTDBG?=
 =?utf-8?B?cWhUZEY3YVBuM3ZRYkp1aHl6SWNBZk5KRWY5Yy9McHNkc2VBWmhQYTZzLy9j?=
 =?utf-8?B?SUlPanZlOEZkYUMycHl4SW54S2dmU2lwRFB5RlBWRXlBekZrSEJLaDFzWndv?=
 =?utf-8?B?TkIwd3RnOU1HakdpYUhqTHlNRDBTZTZLQVpWKzZIWUJ1S1FNUVU1czd4Vk5K?=
 =?utf-8?Q?KUgNr95gWeiEVuP4ub9A2O03l?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc5db1a5-3a3b-430f-b079-08db672f3a90
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 08:14:34.7800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uCcRVjUo3omEO8pT8FtCCsVYi8BBYNC635Vsitgtbl824lbF+PSIxP8JJc6bJtRm9xMNSGxlxI+8kKpkO/0Orw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7225

On 06.06.2023 19:23, Roger Pau Monne wrote:
> --- a/xen/arch/x86/include/asm/alternative.h
> +++ b/xen/arch/x86/include/asm/alternative.h
> @@ -24,7 +24,9 @@ struct __packed alt_instr {
>  
>  extern void add_nops(void *insns, unsigned int len);
>  /* Similar to alternative_instructions except it can be run with IRQs enabled. */
> +#ifdef CONFIG_LIVEPATCH
>  extern void apply_alternatives(struct alt_instr *start, struct alt_instr *end);
> +#endif

I don't see the need for an #ifdef on the declaration. We avoid such
in a fair number of other cases, keeping the code better readable.

Jan


