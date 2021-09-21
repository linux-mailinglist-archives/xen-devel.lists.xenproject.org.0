Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EF041323F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 13:04:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191693.341785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSdZF-0004ri-6I; Tue, 21 Sep 2021 11:04:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191693.341785; Tue, 21 Sep 2021 11:04:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSdZF-0004oi-36; Tue, 21 Sep 2021 11:04:05 +0000
Received: by outflank-mailman (input) for mailman id 191693;
 Tue, 21 Sep 2021 11:04:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSdZD-0004oM-Ka
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 11:04:03 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4769d6db-fcb4-49a2-b376-abeaf72c60e7;
 Tue, 21 Sep 2021 11:04:02 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-3sxkIoiFM9Guz46mZtlivA-2; Tue, 21 Sep 2021 13:04:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 21 Sep
 2021 11:03:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 11:03:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1PR01CA0019.eurprd01.prod.exchangelabs.com (2603:10a6:102::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17 via Frontend
 Transport; Tue, 21 Sep 2021 11:03:55 +0000
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
X-Inumbo-ID: 4769d6db-fcb4-49a2-b376-abeaf72c60e7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632222241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o9ZHWeV00VO1M6yzaBpD0BDihqnJQoJNkdDkA7YiaxY=;
	b=fjsYSDHOPStS3HgCJRosKdXFECwqaqGqvhTMjZzJUy+aupm3nKyoERgtfmXeyNfCtmlWS4
	MAnJaELislfJmh96qeTn2ktu8QvQDC/oZ2wgYmf+kwwkp8DecvN5aAXHaNsPlDY8e4fwU6
	0yUZaOWiJU1Dz5IGqwBKTy3qc6aDbqo=
X-MC-Unique: 3sxkIoiFM9Guz46mZtlivA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHt2S79wS6xuHYXTN3pHMKGdh4BIzkb5va0HE87ZD6vpI7gcp9Krv4NJHlAiEy+BSvp/DBeqSqS0CkdVRr6445Qm0n7Dm++aU6DybEvGQ6gTBo90ElTHI2wlrQD+UZEdGhmEtBM55/XWFvBBX/8d3TMjCL5X2pmLnJhJDTi0ujhT0wYJ6JngSQQwhED3BZFLBKVaqCeldQaTJmo8RgDZMMi5hUAMbJyIoAq03wNBAjqgNPcSc84yVrMsZGDX7mr4dgJS4a60Ngrs7IMEPYCptwyRty/U68ICHptMdKl7aEk7pTUC+xI2GFHMWKw5I+eDc3LwXo31moTjJ/P7BEY14g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=o9ZHWeV00VO1M6yzaBpD0BDihqnJQoJNkdDkA7YiaxY=;
 b=ndsXqRJ8In7kKJRzMfh6CMdFcb/StU+M2jorAhsQAynv/t+ko1thKo/C2JYGj14AQ12+/IzFBKFHCjqLz3OJOLwW+dZ9pSVaRiwSK+JGXtHros+hnTDjtCgp7VMORX0lTlYnQUDqufnXLaOncSio64RiceO1IBQGq7Y6FuNfeye3y1I8Yql8/knbTfRz/FtEbsaRVzwqHk5E5Rk9dCC9D7bFdRdwwzWOUo7s0PsP/3KwOC1+o00jxjkPMaphYqox9+Q5LK0u1v4wqg1jdV7CJggkQ8uxHSm7bJ0lpzQs23txe6CNSkk6729qF6dTucfyF72b6ZYe6ej1/sxhO3Dghg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 09/12] xen/trace: Minor code cleanup
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
 <20210920172529.24932-10-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c34d236d-d749-5d33-207a-94fef482577f@suse.com>
Date: Tue, 21 Sep 2021 13:03:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210920172529.24932-10-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1PR01CA0019.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1b43a46-9a81-45c6-77c9-08d97cef8193
X-MS-TrafficTypeDiagnostic: VE1PR04MB7360:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB73604E2CDA7C9E3EB41A0429B3A19@VE1PR04MB7360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mZcCWJNEKX7J3t9mHd5y56w2k8JgLNapiPGDmXeJDYosuexLQ/EbkX11tyC34G4yhtHObOjBltsuysAOmVyoSLaHUblB6FAROp8KFXqk9LnkcnSSCjcx/Eki6+75g6LzE7n7UAxJ7CphwMZSI63/ESgux+RPfBZIyLBWeGBmTDC/1d3/xKmCgWv1uhrQimkmQifhPyyG9ujzg9PEPGYxOr4h/38TkNpgCss1e/gfEg/ogWAjWiJaxKGdVSsuAhcaSdwgvG06JOMxIPa5/E7NkAJzTplUMTGczAj+FdU1mTNiy7bWOrpwLG+Y1AFEPW5/fPjyYl+PLcdhHo+SFYm4KcKJ0xVZJNsivt++tQD76jbGD/qm9jUlNK2VayhsqGFOZaf1E3PZCLhcrgQCyQ1Yc0snKjNVzo5IuPO0jQVIxzb+F6CmJqNkZfPc+g+O1ICUo8e6HS8pYRsysvgbOhhnRh5JYVPKPedRccvHc+ZcJXijS/HM2L1dEofS8pn+Vqqev2E5eXSlfaWZVoc4MMG0kt/W7guqWiEGAawGA8TnQiJ+d4cJ+YzymHP9LQEv1n85fKtYBERJrmJkW00gfFBS69M8N+or5X9u/XIiwreXXrhRSwtn52JEmPgBegAKrQDOqqGvb9EFKJgRC82FqnRR3C0cDd6bT+PKz26XOIPTJiEnfNbTYzLrZNnkB2V0+dsENsnTj/dBtijIZyHHzhj3Tg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(5660300002)(8936002)(31686004)(2616005)(4744005)(2906002)(36756003)(316002)(16576012)(54906003)(508600001)(66476007)(8676002)(86362001)(66946007)(66556008)(26005)(38100700002)(31696002)(186003)(53546011)(6486002)(4326008)(6916009)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnFBbjNZaytPUlY3K3FwRUpXTllHdTJueDIxWi9uU0haYzlRV0RKbnlnTmd3?=
 =?utf-8?B?c3BUcEh0WklNdVd3SWNuUFVPOEpEdmxsTVpXQzFJemwydFlIMmRHblBpcDNt?=
 =?utf-8?B?akM1ZE5URkEyUzJpbFo0ZTBIdklmUDFmWE5tc2ZvRG9jZTl6ZUlPSjJVc1pt?=
 =?utf-8?B?bVJRWEhvRGpMak5XbDU2TzJ1VGlGQ0xETS9ycWtXYitONWs5bTN0dGNEWlFp?=
 =?utf-8?B?a2pIb0gySlR4MzdQUSszcjFaZklQTSs3K3hhczBXVWxTSkxIa2ovRnJodTJk?=
 =?utf-8?B?TzBKT1dOamRDNk1pQ0s0L3ZpcVN3RE1GOEpYSlJpczA3UVg4VmFCWEVSWGpx?=
 =?utf-8?B?U29VSHdFT3hObDRuUWZvTVFQK3J0SERZZzFIRVRMSklNRDRpQnZSNzYvbWRm?=
 =?utf-8?B?MHJIdkpuakEycTlJS1VCUUtyZ1lCenFISTNYVjlIS01SNGNlWEl3eHFoK2tk?=
 =?utf-8?B?MDJDVU9JYVAvS0lmMC9jV2Z4UFQ0dzBSUjRXMU51d1FBMjBoMEp1a0dqK1JL?=
 =?utf-8?B?MVJFbmtIcytRZkxESVhKNzVMVVZlRi9FUEZISDZOZWxBS3JDRTE1WWRIb2wr?=
 =?utf-8?B?eGlpcmp3SzFQbXhjUm9nQXBqUklLRmJSVmg4a3BiMlB2cE9tS3lLQkFzZno3?=
 =?utf-8?B?MEpXaisrcEJvUDNaLzF2eEdHUGxGVmk5NnB5ek1ZWi9yYmRzV29DaGNhdzhY?=
 =?utf-8?B?ZXV3RjVFK1cyWlQzeCtBSldyY2lpUDdnMmVNd2E4ZEhHZXlCT0ZPUVpqZ3VT?=
 =?utf-8?B?aGkwaFFRTkxxbHpOeWx3anRES2lSaUFEYkphRzFPMlBPeDZ0Zkh2TjZ3aEhw?=
 =?utf-8?B?aEtNalpjS3BwTC9FYTBNWEQzNGFSS0VNckI4ajhjL3FZcWNncU5hTmd3NkFm?=
 =?utf-8?B?czdwWjd0NUQ2em5IVTc1WEZPSHY2QnM1dk41ZXM2aUZQb3MvZjk3a1NPd0pz?=
 =?utf-8?B?Q2JJTVJDamd3amtiL2lpNFFIajlVR3ZObk1RYmk5eUNhdFRBQlJ3bHRXTU9V?=
 =?utf-8?B?bk1vNGdNaXRRMG5wNktyV0JiaEFSdzdwMlREa0xzYzVlY3VhVHdXTG5uQlZx?=
 =?utf-8?B?dHFMWEllcW1pbkdFTDNuMUlQb3FFbEtmQk53OVQ2TU5DR3ViV3hQKzNLbVZW?=
 =?utf-8?B?MEdIMTZqTlZZQUVaaXlRVklUdDF1a1VVNm9rWjlJU3EvOFBMQ2lUTHNxbVpT?=
 =?utf-8?B?bll5NlVXSDEzYk91UUVkS3BuRTM3WndPdjFicm9QYzBKbTl1VE0xKzdVRTFB?=
 =?utf-8?B?NDliRVdpWnVsUDd5Wkwzc0tMdldLWk9tRk5TR2p2akZyb0E3cFNOUFI3QnJz?=
 =?utf-8?B?dWZYZjVORHRwNFdvN2RnZkl0ZFJ4TEY4cWtzbnRmcHNMeUdOMENTQ3JkYzM2?=
 =?utf-8?B?VXVkQ05tQ2F3ZCtrcVJHWXc0VFpIOXJPNTZacjVjS09EMURLa3p5OUNhOFc3?=
 =?utf-8?B?Ukh5QkMxbEhkWDBSbzJJVDNpY0Exd21vNmdGYkVPWm9EelJvUnNIb1NpbG9a?=
 =?utf-8?B?Q2JSS0EvK2FiOHcxS2RNRWRyaGM3RU53cW1SbmZHM1dOTTZkOGk0SXFsdEI0?=
 =?utf-8?B?SUpFZTB1L0k1OE0zQk5oZHJzcmNHM2UwQjB6bFpoOEIvREZkbXBYTVdwb1BR?=
 =?utf-8?B?bllsc0JKK1B3QWdrZGszM1VpWnpLVWdUaTJBbjd0anAycm5PYnZRNXBrbEZ2?=
 =?utf-8?B?b2xiM0orZlA1RHdQL2hKM2QzT0htYmw1eHBHT1daVmZ0OXBOZUMzcDVISGNY?=
 =?utf-8?Q?EZ4c94yRL4g7TNAl+7abro1WDwPvOWQHUb72f3u?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b43a46-9a81-45c6-77c9-08d97cef8193
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 11:03:56.3548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eRVTkOhAR3+E/wW5cIjKeEKY3aigCnkL8RlFFOqWCRxaSAA5s+p8sAkZQg/SxICDjmpTAUDMJGF43fZz/JuAwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

On 20.09.2021 19:25, Andrew Cooper wrote:
>  * Delete trailing whitespace
>  * Replace an opencoded DIV_ROUND_UP()
>  * Drop bogus smp_rmb() - spin_lock_irqsave() has full smp_mb() semantics.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Like for v1: Largely
Reviewed-by: Jan Beulich <jbeulich@suse.com>
One remark:

> @@ -717,9 +713,6 @@ void __trace_var(u32 event, bool_t cycles, unsigned int extra,
>      if ( !cpumask_test_cpu(smp_processor_id(), &tb_cpu_mask) )
>          return;
>  
> -    /* Read tb_init_done /before/ t_bufs. */
> -    smp_rmb();
> -
>      spin_lock_irqsave(&this_cpu(t_lock), flags);
>  
>      buf = this_cpu(t_bufs);

I wonder whether the comment wouldn't be helpful to move down here,
in of course a slightly edited form (going from /before/ to /after/).

Jan


