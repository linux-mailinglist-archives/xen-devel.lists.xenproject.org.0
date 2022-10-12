Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D587E5FC21A
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 10:37:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420878.665960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiXEe-0004FD-2H; Wed, 12 Oct 2022 08:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420878.665960; Wed, 12 Oct 2022 08:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiXEd-0004Cu-Up; Wed, 12 Oct 2022 08:37:03 +0000
Received: by outflank-mailman (input) for mailman id 420878;
 Wed, 12 Oct 2022 08:37:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIvO=2N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oiXEc-0004Cb-Ha
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 08:37:02 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2056.outbound.protection.outlook.com [40.107.104.56])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a6ff69f-4a09-11ed-8fd0-01056ac49cbb;
 Wed, 12 Oct 2022 10:37:01 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9455.eurprd04.prod.outlook.com (2603:10a6:20b:4d8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Wed, 12 Oct
 2022 08:36:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Wed, 12 Oct 2022
 08:36:59 +0000
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
X-Inumbo-ID: 0a6ff69f-4a09-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZ9wa3M42YxW+0Hn6jgMQw1GW+7dNdpDGOxUy7z6zgU+2slj3Aeocxb3eZWIQo29OLapeNAgkevuVGnYBfqKns78upFsGPnFXTJSFLuuUlun0luWOgDBMqUykEwncq/dTwxxldV2ImKAMTibu+YvTNqcv6LELihm85yvdg5fZFfsTlmZsV2sbDe+0CXFF4baP7ektSKOxYqnLQ956PgwmvhI7uyrxeIfm2Z+U/VLS2bKTiTqA9PWGwyQlr5dOe9W0qsTTV5+puy+wK4y8ZsiMQUr4W7hJsw7ogt5WKnLSaJEeoX4X4RdP5mSwJFhJUhRvvlUQY9QTd5oVnPpjRgxMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpCbc1UXGVDHC3hoW7/BwA8ZrprD1MAEJdnQ3iZsO/c=;
 b=lrB1IhHLRdB7G1Y3sLX/E5xDex3WSpmFtPBtONQQ1CjkkleAJ5sFD6RVSGkij4PxPoirOOYHRONpnTgPAPoNA1VnGmRtcqacAV2rmtu2huHNFwAkkRJ8sUZFUa6pZzbx4XK+RaXz7LZMq0zacM2wBhvRLPLzJ4+G7qLS0KfRsfqrxU4bQhcN6YPLrh61M/dexW766h50bkgR2FUXwSwkp+0CPHVPArkb9iazTxfvOFkgMhKIEvC0mQu5ibbDSWo5oSmAyeGNjkqw9Mv4a69CP16IIUlvePMHQnrX5ex/NYU7+/66LQfMsDt5+gMREZdEigZYBqnSF+FF13/1GwRw8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpCbc1UXGVDHC3hoW7/BwA8ZrprD1MAEJdnQ3iZsO/c=;
 b=uVKoFg7TX1PM5w7MiQcmLZyt5r7PRpw2EG8413Qg0j3BzEkKurwbG3tjgZWavr5L6DSaS5BbyRSKUpYS23NVIs/4yU9aN1SYZmqay6b+95KVHFQN5C3a2d/++n80Un0nV2CN2SIgl0XCuL3O7npir2M9MMYNTMMn9S4sJwwkFPcfF8Qq7gVMRfWuh3h3nDWjBUDGyePCMNiQmHDEwoZeYH1nOiagY5Bg3RQnagpi/GKKlXyPgu3m4w4EV7xJE/iuc7Z7oYqfsliv3U0L9sZpu+k3cjIFJgHYAOURLSiSQO0PGv0VTD6dMPF/GgyGm3Zobciigk3aZ1JuQO9EJGpG7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1f70c472-1b62-7c79-dc31-65fca8040cfa@suse.com>
Date: Wed, 12 Oct 2022 10:36:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 4/4] amd/virt_ssbd: add to max HVM policy when SSB_NO is
 available
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20221011160245.56735-1-roger.pau@citrix.com>
 <20221011160245.56735-5-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221011160245.56735-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9455:EE_
X-MS-Office365-Filtering-Correlation-Id: 4226bb9a-5874-401b-df7c-08daac2ced76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N/6WxC1cnDsWEejPd/XJcukMChf0cU3n0QJoc6caCsLviBcSnNavmXQctHpiN3ODiVelUZ4gYAv61qvlodUnZOIzPdtr+oQ0f0TNhhIWPxu43IDCDF2mmIALI1JO2s/WcoppEkZ9RlJnNpxCnI1CoZ6XR/qOpCI3UKybB4vbRr+9UGZN3GuZ1kFqlVVmAj46Bpa0YFnwukXcIf9x8GI5FkabK/qyEjtRy0WsR5d3baOJlmnP4W9yYJmPJAq3bQ1KdT2NNBJR0lD6l6r7FKiyJ2RXW3kyl9aGYD7Fmh+p5f/bJvyTeBrL5NIHVOeNSaqpZ8+aaAcoQtoXuMucYw8POvsk8fYqRJVdlduauWik4rj6Yp+lA04IzJRw5dUn8SqtSnZA8MgfiVAxTuC0DksYm0xR1Nu3im8LFV47XtlgWHPxA8TWk/t2JLNCwWki6nniM3M1AcvtouffNBt+gOOWvi1kt76HK6qqOiP3ayf48wy1WEG9164ueOM2yhorTDIOF7wkfxQNTFH7ptHiST3yxTNPgzOWPXKOxg+cQsHJRmo+1BYuw8FU+yX+ch0ZnPwF3DJyy0NwoqbKbfVYKCvB5HsqoTvDiCEfCn0bVgy/aj3NuHE/LqOp3zv8Z4Tbmpp2UtNO9jOs0Atxq0aPPQr65pSDRkBBcwv/+7Y9XBzaju3RIXQ5gWj82GnKewbfu2QIiJPe4FvlaffhEFMgKI/nBIHwRoIwkRHPUVpvmvHiUcwYtrVeA5hCR/RBvQbqHqiToaCmeW0m2Xc18uX0F999b7QuUCQHjK5M4jUoLmnjsR4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(136003)(396003)(376002)(346002)(451199015)(31686004)(86362001)(31696002)(36756003)(6512007)(38100700002)(66946007)(66556008)(66476007)(8676002)(2906002)(4326008)(8936002)(5660300002)(41300700001)(316002)(53546011)(54906003)(186003)(6506007)(6916009)(2616005)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1BGTnBwVTNkSFdGQ09FYzBaN0dKeDJLcUdHNjNYZHFlQjVEclZkb3ZMSXhY?=
 =?utf-8?B?U2NyNlF0ckhlcUFFYTV3eitSSHdxVU1icGMwR3ZLd3dIa005TWRCczJlaklQ?=
 =?utf-8?B?QmtYamx6NlZjME5mbXhRWFZUdVV4aEEvL0gyM0ZQSFlqK0I2bTRWS0xvUjR0?=
 =?utf-8?B?S2ppMDFXV3BiUXpHMEhPNnR2Z2QwVlF5V0VCU1U0aXp4ei94NEhsM242RVpE?=
 =?utf-8?B?VWtSOGpmaHlzUkh3aXo0dHpQeHlZOWJpeHZYUXZkYVVnZ2xIaXZJY2EvNExq?=
 =?utf-8?B?VTcyaWxUdi9FcmJ6cC94WllDaTNpQ09FMjZISjJJYXlmR3RjUEJtRkZWU1hY?=
 =?utf-8?B?MnlxSUZqRE1uMEl4K2VIYmszR1RJbTVLQmcxeHJkaE96RXIvK0pEMFFFUm8y?=
 =?utf-8?B?YVJZQ0swSk5lSUdRQ1VyZ0E5Sy9UZENaRlROWUZaMUdtckQ0NVlubW40WENm?=
 =?utf-8?B?ZENHakNlNzhvdVJWSytzdnNMQk1SL2ppcks2OHFWelZqVGNFVlgwa2haVE1H?=
 =?utf-8?B?Sy9aNjNDRlpnckxhS1pEck5qQVY4Rk42VDRpN21pcGNndStTUWhEL3NVWksx?=
 =?utf-8?B?UkRNS204S3lvRDFYMHkraWh3SkhlTDYxWE1PbklaWThrZmhnK1F0TnU2bWVi?=
 =?utf-8?B?OFgzZXdLd1NBbTFqTno0YWgzUStzV1d3NFloRUpSS1FkSC9rbmY1aVpBbktZ?=
 =?utf-8?B?MlI0Z214bEVWQmJCMEx3VTY1ZmNtRlZrMk1LWms3U2VxSkNEbGgvbkZJZlMv?=
 =?utf-8?B?ZXdRcVhUclRacTdRbDR3dENTYkJVRklXa2l4aEMzaUNyLzJydUdSQzBWcDl5?=
 =?utf-8?B?ZUpPN2tSemx1WDN0cnQ3SiswU0IwalNIZlo1eWJrdTZWSlRrRDlRanNFdTZX?=
 =?utf-8?B?WllVdUF1ZHhZQXRQSWVxMmFPL1V2d3RFRE52NkdFUVEySlBTSGRjTnhvWmNo?=
 =?utf-8?B?M0l4U0x3Yktkam1nZWN4UXhDWnZRaW1kTk1XTWFBZGlGOFR4b2hrMXFEVmsx?=
 =?utf-8?B?L1BMRzVRTm0zMFJrSks0aVpKZG9raE5pMHhLTWJHOHlxajl5cnhUL3V4ODRo?=
 =?utf-8?B?bDFRV2l5NHBoZGZjZlM0Z3RObVhXL21aOTd2RVhiV0hQM042bk5QNlplVml6?=
 =?utf-8?B?ZXlYc21Nck1PNHVSUnRiT215c09jSFdiS01WU05SeGpNKzBoT3VPYTFMOU96?=
 =?utf-8?B?ZWZuTjB3UFZWaTMxc3RNWHFWYVVUYkR3YXFubUFqUEJCajBaeGZlMW1iSjRC?=
 =?utf-8?B?TUk4WWM0U0N4R2YvaVNKbVBHelBONFMrYkg1YWFEYm9uVGMwdUZlZTVaZ3Zh?=
 =?utf-8?B?cFVaTU5XaDU0SVQxWk5mdzFnek5HTXh5VTVQaWQ1NEx4Sk1leEpCcm9kL3E3?=
 =?utf-8?B?ZmxzRHdRY3hJQmRnQXNoZE5jeTNBRlNwOGk5YlNOR0JHUGVZcWxjaEc4RE5x?=
 =?utf-8?B?QzhSdXpuWldQbEl5bkhHby90eUNqOWtPeHZlU1BHTmphK1BhSFV1ZEdOQjdi?=
 =?utf-8?B?ZXM0by93bjNuRWUrS3d2YmREQllvZUFYYVhsTUx0YmFzYlN3azJ4R2VTM1Fi?=
 =?utf-8?B?S0VtMDRDNzZGdkZNNkg5T3g4TEdNdXlMRVdJUkpCNHZwU3llWDRBb21TWDlr?=
 =?utf-8?B?T0UzRm1rUUpsVlh4bGlHcWNnMWEzenNBM1d3cGprRkFTMmZWcHVlbGdnaWt0?=
 =?utf-8?B?L2JpVDJpNFJhTXpEREZHZDRBRlQyQjFjTFp2K3JweUgvWkdYMm80VWczUUxC?=
 =?utf-8?B?dkxzWDBHanIyVTJTMDFFTDhVZ1dNcm9GQWxIVUpIUkhJVjBMUFpBYnVTUm9V?=
 =?utf-8?B?Ynk4dThseisxVEliV1hmVU16Y1RBbXQzODVtRVBlZjhkZ3lEOExDU2FHcjBV?=
 =?utf-8?B?am9pa2d0SXp3ZFRRSjRRYXZ3bldwaEtVZEVGL1lxOWpOVmFuRE9DUE5ybDZ6?=
 =?utf-8?B?bEM0RUhvRjduOHMyUkkvSHpKMndqdk9zRmUzNVdTVjdlN28zMitTYUNldFBv?=
 =?utf-8?B?NDF0RzU0bnhjb21PbGpHbUxybkwwbWRROFdiUTdmdGlWeXRPUFF1VzFPR1NN?=
 =?utf-8?B?YlMzWTBSQUNmaXZsY1lGa01SZzBtVk9MalR5eXZxaXg2QWxlSllFblZxMGcz?=
 =?utf-8?B?NDEvWmxuTDk0L1BicG1Da0ZHMHpRcGJwc3hSNk9ObTlFdVdvTlo0NXdIUlJS?=
 =?utf-8?Q?4RryM/6C9qMBlbyjjHstSRNU+cJe7jmxgBh7ZXCRxhtw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4226bb9a-5874-401b-df7c-08daac2ced76
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 08:36:58.9969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ego82lcTqDQKQRyrTaNg95txViKC6fAsr1vstQJ3imlAuejhXuVPCjqsQ+aSkA0+QqjdD7Wot8MM434o5p2Giw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9455

On 11.10.2022 18:02, Roger Pau Monne wrote:
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -814,7 +814,9 @@ void amd_set_ssbd(bool enable)
>  		wrmsr(MSR_VIRT_SPEC_CTRL, enable ? SPEC_CTRL_SSBD : 0, 0);
>  	else if ( amd_legacy_ssbd )
>  		core_set_legacy_ssbd(enable);
> -	else
> +	else if ( cpu_has_ssb_no ) {

Nit: While already an issue in patch 1, it is actually the combination
of inner blanks and brace placement which made me spot the style issue
here.

> +		/* Nothing to do. */

How is the late placement here in line with ...

> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -558,11 +558,16 @@ static void __init calculate_hvm_max_policy(void)
>          __clear_bit(X86_FEATURE_IBRSB, hvm_featureset);
>          __clear_bit(X86_FEATURE_IBRS, hvm_featureset);
>      }
> -    else if ( boot_cpu_has(X86_FEATURE_AMD_SSBD) )
> +    else if ( boot_cpu_has(X86_FEATURE_AMD_SSBD) ||
> +              boot_cpu_has(X86_FEATURE_SSB_NO) )
>          /*
>           * If SPEC_CTRL.SSBD is available VIRT_SPEC_CTRL.SSBD can be exposed
>           * and implemented using the former. Expose in the max policy only as
>           * the preference is for guests to use SPEC_CTRL.SSBD if available.
> +         *
> +         * Allow VIRT_SSBD in the max policy if SSB_NO is exposed for migration
> +         * compatibility reasons.  If SSB_NO is present setting
> +         * VIRT_SPEC_CTRL.SSBD is a no-op.
>           */
>          __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);

... this comment addition talking about "no-op"?

Jan

