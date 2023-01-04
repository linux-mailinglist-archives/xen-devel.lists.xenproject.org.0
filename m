Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CF065D777
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 16:45:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471282.731074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD5wr-0002Hi-1S; Wed, 04 Jan 2023 15:45:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471282.731074; Wed, 04 Jan 2023 15:45:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD5wq-0002En-Un; Wed, 04 Jan 2023 15:45:00 +0000
Received: by outflank-mailman (input) for mailman id 471282;
 Wed, 04 Jan 2023 15:44:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+XhT=5B=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pD5wp-0002EU-B3
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 15:44:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdd70812-8c46-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 16:44:58 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8377.eurprd04.prod.outlook.com (2603:10a6:10:25c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 15:44:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 15:44:55 +0000
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
X-Inumbo-ID: bdd70812-8c46-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nu30EW1cGTSvrNgzZhfYOoggD+Q16sa+nRBET+DscSiBrlVEj7EaxbMowo72pZ1koFBhLX8FSup4UObLUdTOoPQH/eOJ0ko9dxE39yr4ZI5KnCQrWb+c4rajegqX/G7Ril+AKSFEnTkSq4kON3HVg++Z5aUdFDoV0ioe5sGmnknLlkwaTRqxVGLkpafs4Q6a+5F0yQaaqRIpl3q4kMhxxV/5k+0axfCWWRO0iFdO8v4bLcz9M8+f0C2QfHLc4yV4daR6dl7Bl6xhB7I7TAp/WQuXoq/8dNZ+vecBAmTleun0h3vxTkYZh+aIYIHfGmQRX2ljoIXZyWz12QwT/BFkUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekUmmCLjTlbJSqa3zB70oJ7pL5kMKDCfK5iJNx+FSQY=;
 b=TgpaWhfQrk2wD0u43wvsOTE4hyOLx9Ndm7jDs60xO6lHUNnoZKlKXdSwNj873NF++P6m0ZbfyrW8jh4oj3NzX0Ob/Tj1HRExpvEz9EY6TEBm0N6yFczxKh3pO+gHyqXbTakMlxLWj799JGDtAdxKw3D2+bb2BGObq18bXBDE42mbmLD0UNCJ6VIn9VM6GakPWGJaQVExBblAQxkLYpCVWKtTIUocdA4Iyn8E1biMc/avmFEOFP7lVdDTuHLXGW8LacSjBxl061NLmyftiUV4atMfK/ZMI+ybKpG5YOzBnm8G0FPLtERldB0rR6eW4zPXhvX2WGwMW9kFjASehf9IJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekUmmCLjTlbJSqa3zB70oJ7pL5kMKDCfK5iJNx+FSQY=;
 b=e+boEKtCGHJnMzoVsJ2p9qAvkmJLdEPKLyRYjEvkT+Uw/1VG6o8TqUjv8tjOXHIwkVfzMqDYHFW27mHjkRDEtmZBM7i98/K7lb8L7Sg5Q1j29FB3IKesZpHkOlNzuwRfn4x0pnTk99QyPGlIRYo75Ut3TORB2UTjFB9N6F5lg7KkNIHPDnu911gON3su+RzHOttfE0ya08F+0vv/zdgQjb5W4/Tq8zwg+kQxW5f8R3dBuPZrPSyN1AxIlde53xYpdYj1XggEisr2fzKJO8n+wNE6JSjUcJPbT1m8/j1KkzKfCpKqFhyobu8Ka8cpt+G+Zsp3PprxvZwAjjMSV4QYNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a225c263-dda1-8109-3dcc-ff7111f277fe@suse.com>
Date: Wed, 4 Jan 2023 16:44:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] x86/shskt: Disable CET-SS on parts susceptible to
 fractured updates
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230104111146.2094-1-andrew.cooper3@citrix.com>
 <20230104111146.2094-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230104111146.2094-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8377:EE_
X-MS-Office365-Filtering-Correlation-Id: 691ad437-f119-46ae-78d4-08daee6aa093
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nUzd5OJUrLBZxc8nhI+DVNAs97ImunS1agOQyZ+e5V7VC/ypEfFJQIsokslFIuHOCZh8OKpZNChk6lRcqroO9ac2hzmF+9VxNQo1B+WDSijM4qTN+dKE7sYHSbyeSj/WioL7SZjYPl22pGw+Hi47r/CcKWIuceEOpdFXqyw0bfMIzOeoOKT+9bYNP2ZyJ4dl9oKfxXFKa1RE5OxTVoK0lnHPR3ml+MMw4TGMZ08U3zQHAZYt2e5y22zxxk0LXdsBC+pWNtY5lX21Mg/za5969inqwy0UwMjcPZD6NR6UYjIbG9tHuc1c6S5bEWWgcffMjK8qGkTD8+mVBsA5qCXiXBuKI2JOEB8tuYwOcg7/lD4IaMx8N2JtqIyCQp0LIOmlZqpv1UjIt1dCjYK6cEzjg7w21Vwmg04/9mZtfUFMqKF30mymcxKCrERp6eqXYTiSHQIlSDgZNEh5FLGVBazHahL/4tn0bAYzUSBA5Nyik+s4Uo0pTJ+jumIU+lD0iGAKAC6GfyiAJWsXfvVxCgj3jmf0r2a6P9q1FXuwytDuQClIFOi2c0eOUb/P0av8cD898WCTe3D4Np28hpxjVBgNsKoA4Q/N18e5WnmRb+UR11G95IpKsoDTBZEEZGW7ivwTgLbQbCuAWqsShcv/b9I6co6D+Bx5SwngYYALmpO1bEE99FT7sMv5obytfj0j0dHNGjIOqzpVGGCRszgAnKeHDghTza7T7QVT/lwQuoV1950=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199015)(83380400001)(5660300002)(8936002)(36756003)(6916009)(316002)(54906003)(8676002)(4326008)(66946007)(66556008)(66476007)(2616005)(15650500001)(2906002)(31686004)(66899015)(6506007)(86362001)(31696002)(6512007)(186003)(478600001)(6486002)(53546011)(26005)(38100700002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXZaZEdxbDVUaHZDWm1WTjNvVFErOWFYbFBuRmpGK2FHZUtyZVZiMGdZcEhu?=
 =?utf-8?B?REFtVkd2NWxSU0JiSXRNb2RNVTEzSEZBUHpoTmVCZHJNT21qaHozUUNlMlZl?=
 =?utf-8?B?cHRJTFU5WEtVNWZjNTA1dFhFMlBEUkdMZnhheldWUzBPdnQ1NXJOaUdmQ3dn?=
 =?utf-8?B?NVhoWDlzck9rMmFwNlZzTnAxU2pETWhlakJ0dHVLV2lVdkdZaGNRRjFoZFRX?=
 =?utf-8?B?WWcxYWFDc3FWcWRBNTQ1eW5EOXp0TTJNRC9zSlFMSXpvWDNwNHdtWEVZNDZR?=
 =?utf-8?B?M3lab3MwdlB5UnFWVWU3NXhOVVNqY1NpUFBtakYzRHgrVm9QL0haTGIwOVB5?=
 =?utf-8?B?Z1d6aGJuSGFGd0VGSjVzQWhOVUV1NmVnYzBrTUEyQ3FyWFMrczFab3hWL0NT?=
 =?utf-8?B?RTFmb2xOUzIrSkJRMkhzWFRoUjNsY2FiK21JQ2JvRGs5UlZyVS9sUDZqRU8r?=
 =?utf-8?B?MlNQRitnT0NrbkN6MDM3dlB0TDVnM0x1amFsNDM5QkVGSFE4TkpzL0xka3lt?=
 =?utf-8?B?NUJvdndCb0VFakJzWnF3NWl6cmg2QS91WTZjZFJ3NjQ5akNJVnQ5eVNjK2h4?=
 =?utf-8?B?Q1pRSFdlaUxucjNVanIrQnN3Z3ZpQjE4UVBvMHBsTGRBTnZsMklpOEJkZ0F0?=
 =?utf-8?B?YituWWlRd2dBVTFGc083OXNXbHpndkJ5a0VzNkR5d3V2eU81bTNtZ3VTdUdq?=
 =?utf-8?B?b2FiTFY2NTFoQzRRVytrTG1OVXYvbkVGZmtsRm5oSVNsRStaNkpaVU5YRHhx?=
 =?utf-8?B?ZFRROEFzTVA2d3hrRWYwamdSTFl4VU1Rc0hPSHlHZGNJMWJXN1owZUtncWs2?=
 =?utf-8?B?NWlxdXUvUHIzWHRjYnVKWHE5V3ExMm1RRnUwTzZPa29XNE5KSmgrOXNrRm1J?=
 =?utf-8?B?QzdRRXpQdElJZDhucllydytZMm9veTQwak5zd3YwL1ZqK240OFRIeE9QcU1O?=
 =?utf-8?B?b2F0R1dEYlJ6L0IyakdIbW5DK0dmdld0QWVjRXp6OTkxWDZML25DS20vWTRY?=
 =?utf-8?B?dVEzNy9RdjJoMUNTSHl3d2xaVURaOU1nbXhDaWs4VlFES1RQZEFCZkd1dFVL?=
 =?utf-8?B?L1BUbmdSWVU3RjhXMFBZVUxNRjZUNy9wRFo1NG80ZFlBajBxUU1BT0lBWG8w?=
 =?utf-8?B?cFZOQTgxdldSRW9qSU1Ta2hwYmpiWXBWTVJDWjZOa0NsZVZ6bDQ5NkNIRjRN?=
 =?utf-8?B?NHdXSXZyWlBnM3pkMmFjc1pmOVRmZEZGTDlaMmJzRUhCKzNKOVZUeXFaVTRt?=
 =?utf-8?B?ME1QZGpkSlpxUDk2L2t4YlVvMzZ2Mmw3d2R3Q29tbEsxaURvQ3VrNmxFTURj?=
 =?utf-8?B?bFR5djdPWS9mZTRjT3NGYXJkK0RqeTVrT2pJY1FkOFVIMEx3Zm0zSkNvK2dQ?=
 =?utf-8?B?cUNMakRnbWI5MTVUSDgvelprWStWdFBiaTdaVS9DVnpNMlZFT0pVcHhveXVZ?=
 =?utf-8?B?YU4vek90b1NLRmg2bzZpQlU5WjdjVkI4d0hQVndjV0RyajhidVRiL1RTRk93?=
 =?utf-8?B?ZjJ3cEZRYWdnc1hKYVpmWXhDYkI2dDd6Syt1UmdFeld5ZXRUL0lEK2NYdGZp?=
 =?utf-8?B?dlUyRnNxUGRXSkRQWWR3dHVZdVI4bEx4b09jSXpuQk9pWVNUcyttNDhzY0dI?=
 =?utf-8?B?VGlHaC9CQjM4cHorOEZtRGFlNEFNbFI4RUJXaHduTUErazgvOHIxTCtjMlpD?=
 =?utf-8?B?RkYxNzhqajNnRXBXUEpKMXYwMC9ubnB1Z21iak9VZXFpbnphQkpWSnRpUERB?=
 =?utf-8?B?RU5WSmEreWFLTDRYcWl2bEhWMXBEbmwrdHNXVjFvRUsxZFp1TTRXY04vc3Zu?=
 =?utf-8?B?QWp6MSsvdVQ4MVVkd1FiYUNBUVY5UzAwK1NqT3NlbkhvbDFlZHNXOHJsR1ZM?=
 =?utf-8?B?YWVaNVg5WEFpalJDTWFOeUlyV2R1WS9oMnVIdmlyb0prTDBjSTdFeHB0Zzdy?=
 =?utf-8?B?SDBabnhxY1BVME8zWmhJUFNhaGRwTXYwRVhJbUlQQkY0OFRDUy9YZzd6Wnpo?=
 =?utf-8?B?R2RSK2IzZVBmQmsvblFHSURUN21FS0cyVXVsWDdrcmoxZy83SlRHNFJSSTRx?=
 =?utf-8?B?VnJscE9qR2hNQXNQWUgwNy9PU3hlNWJlbnhOVCtUY2s4b0JCR25La3p5MkhB?=
 =?utf-8?Q?g8Ejr9oLTJhWlqPscocAEom0a?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 691ad437-f119-46ae-78d4-08daee6aa093
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 15:44:55.5559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OaPlvKH3LnzB24JRc8qlxECr4rB4TF48FA0D4g/7cxUerATsOIzw1uh5ho/AeCGzRbAmF2ppB3p/VAkWnkKBnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8377

On 04.01.2023 12:11, Andrew Cooper wrote:
> Refer to Intel SDM Rev 70 (Dec 2022), Vol3 17.2.3 "Supervisor Shadow Stack
> Token".
> 
> Architecturally, an event delivery which starts in CPL<3 and switches shadow
> stack will first validate the Supervisor Shadow Stack Token (setting the busy
> bit), then pushes CS/LIP/SSP.  One example of this is an NMI interrupting Xen.
> 
> Some CPUs suffer from an issue called fracturing, whereby a fault/vmexit/etc
> between setting the busy bit and completing the event injection renders the
> action non-restartable, because when it comes time to restart, the busy bit is
> found to be already set.
> 
> This is far more easily encountered under virt, yet it is not the fault of the
> hypervisor, nor the fault of the guest kernel.  The fault lies somewhere
> between the architectural specification, and the uarch behaviour.
> 
> Intel have allocated CPUID.7[1].ecx[18] CET_SSS to enumerate that supervisor
> shadow stacks are safe to use.  Because of how Xen lays out its shadow stacks,
> fracturing is not expected to be a problem on native.

IOW that's the "contained in an aligned 32-byte region" constraint which we
meet, aiui.

> Detect this case on boot and default to not using shstk if virtualised.
> Specifying `cet=shstk` on the command line will override this heuristic and
> enable shadow stacks irrespective.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one nit (below).

> This ideally wants backporting to Xen 4.14.  I have no idea how likely it is
> to need to backport the prerequisite patch for new feature words, but we've
> already had to do that once for security patches.  OTOH, I have no idea how
> easy it is to trigger in non-synthetic cases.

Plus: How likely is it that Xen actually is used virtualized in production?
For the moment I don't see any reason to backport to branches in security-
only maintenance mode. I'm not even sure it needs backporting at all.

> @@ -1099,11 +1095,45 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>      early_cpu_init();
>  
>      /* Choose shadow stack early, to set infrastructure up appropriately. */
> -    if ( opt_xen_shstk && boot_cpu_has(X86_FEATURE_CET_SS) )
> +    if ( !boot_cpu_has(X86_FEATURE_CET_SS) )
> +        opt_xen_shstk = 0;
> +
> +    if ( opt_xen_shstk )
>      {
> -        printk("Enabling Supervisor Shadow Stacks\n");
> +        /*
> +         * Some CPUs suffer from Shadow Stack Fracturing, an issue whereby a
> +         * fault/VMExit/etc between setting a Supervisor Busy bit and the
> +         * event delivery completing renders the operation non-restartable.
> +         * On restart, event delivery will find the Busy bit already set.
> +         *
> +         * This is a problem on bare metal, but outside of synthetic cases or
> +         * a very badly timed #MC, it's not believed to problem.  It is a much

Nit: "... to be a problem."

Jan

