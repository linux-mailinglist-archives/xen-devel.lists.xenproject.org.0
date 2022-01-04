Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB2A483F63
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 10:53:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253128.434189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4gUt-00062L-R0; Tue, 04 Jan 2022 09:52:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253128.434189; Tue, 04 Jan 2022 09:52:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4gUt-000604-NL; Tue, 04 Jan 2022 09:52:51 +0000
Received: by outflank-mailman (input) for mailman id 253128;
 Tue, 04 Jan 2022 09:52:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+k5u=RU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n4gUs-0005zy-2t
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 09:52:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1314c55d-6d44-11ec-9ce5-af14b9085ebd;
 Tue, 04 Jan 2022 10:52:49 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-8R6WaNCyODazK5GLOTzUfQ-1; Tue, 04 Jan 2022 10:52:47 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3933.eurprd04.prod.outlook.com (2603:10a6:803:24::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.16; Tue, 4 Jan
 2022 09:52:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 09:52:46 +0000
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
X-Inumbo-ID: 1314c55d-6d44-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641289968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=57bJ3dDNbUyOxeviYmSM+5AL7AXbY2dKPdH8ElXnINw=;
	b=QmuQ02m9yEHNstUYMLWj5WKsRSua0iUVXcjik18s/AB2uiwiibl8mmZ1Sg0qt3QFXFCZVX
	CQjhQrOn8mz3/2PKmj1CAlPBJmnz82loRbb3z7umgY4LjgB6EmuNncq66GRI7gFjBahHM/
	zEt5fRKa4oPyRoSsNc0e5NsZnofIi+I=
X-MC-Unique: 8R6WaNCyODazK5GLOTzUfQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZjZAUJXKL3SO0IKz6msVZGe6KX8Kqc4St5PsuIRt1sZcMxLZudNm/G+vG7v4N9/MHJKpSiWDvgIh7KYFit5fvfBAb4ueZWd3aczGEY28OyHqiOJlmfV9mfnws/hnVPgeG2PwQK5PYGmhQLygpHf0K/d+SJzqqZPXr/SjVOMz9xWbv9L18cC/Dx3/apxMoR0+8Upi6eNsW88I8AtgSv0JwbxbhqlbSWCVT2awuSR1ATjsvHElWlNAMgUDTD++SFOgbQ2dWgagqFDuS458ydvVs6dyIvDvHOqSjoTCLZf4fU0LbZqgK8PqboZ8nXVmzlgsbM+FbvlWGq6SYCUPopYK0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57bJ3dDNbUyOxeviYmSM+5AL7AXbY2dKPdH8ElXnINw=;
 b=HXb/AYDNowdfC9hyls29zHdCgCEInp9ywTnuqvENet2j3FMIYsw4XmIp3ezjVB07xt3fUdJ+HKB8nqF2ENXrVwPkeGnKjLWPPFA7rQlBJQDyqw76wcza0/lN8QqzWxQGq7Bxu63uFiD2r2eaGo+iPMLHEZYc+Yz5OeW6J5A5H3/mRkJSuVXwxFlNfzVJ3P26XHZ87Ivp9HZYLIeal3b+FlzGzvuIrvK7gsDpQAtrIyAr6TofjVEWLsRwh98Zcw5u2S0iPvNr0ZGO8Hf2vXVwQSXnK14JUeVAAoA9jaY1eMktyjGdTlCSzpqmxYQp5DBP9MnnN7t9cmsbFE+X11RYgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4cd3264b-7c5a-250c-2a1a-3014c25e33e2@suse.com>
Date: Tue, 4 Jan 2022 10:52:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Ping: [PATCH] tools/xen-detect: avoid possible pitfall with cpuid()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <94338540-4bcc-7ad7-9de1-944c0dc96709@suse.com>
In-Reply-To: <94338540-4bcc-7ad7-9de1-944c0dc96709@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR03CA0024.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bae03471-bf86-4d68-e1c9-08d9cf67f597
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3933:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB39331906CC2C2A2CFF0B2E93B34A9@VI1PR0402MB3933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ru2D47AxBmEqSNLAsXtrlEcUztYrs1pf3qTqrU0q82L1I3+KBvM2tNlDBEF0hgxxndkDmV06KboZVeBpjnqAUPUReZ+uUFj1xbMz055tLyO6KcD5NTWIuuGoXTjfVDk+oVsIKtrjds63OddqOCs9GCrZiMp8oeW7bSHTthUcOmCOE3Z5DWwXValBiWCVA3u3LcktK0ecwYd9E4EOr1NaRqv38GI4TfwAGj+ILiumvXIl3c5e2moPAePTYYayD8G4RkBtVhIzMXgjPWa5P3LgJR7++y5uUdENhoXSYslYmWXElcohQu7I284WTbndxNfrDjxn7sfGOj3CLzXZfCDlCNZTovZ5Yv3VS1i7CA9j6WoA9FdmJ/zq9LN1bIZODdlTz8RfYKpp4QfN+z9UMECzuKi8JHKSwBOMtnJjtaoexuXkgtMsiLa/dUf2pcb4GhlF6YyMidO0lUk/sMgnjMCxudxI4pYyDDzatVI9r83x/tIwkjaTUdf9NGKiubeEHYAqZM+5FgaPrE/Tm7eq8PfioDxRHLEAeZVQwoq/inhqZ/b7HWu58gmK/G8NU60bLktncqqYcYnjFXcn1UnOAwjd9yLSGPLuXOq1Aq3ZChKzy5fA+Zz3ntev4HDe17UVFIpJOGh1+/2RIZPyir5f2NSKRo3iIiT1jVUu7nSLzyfwnlHGF3tEdXjGPJB+hbmvMtBNwp8+XRC+fgrocAGZ0lX9CvJV5k1qW1/dFifvchs0Ix8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(508600001)(86362001)(6512007)(2616005)(36756003)(6486002)(53546011)(4326008)(66476007)(110136005)(316002)(5660300002)(186003)(66556008)(6506007)(54906003)(83380400001)(66946007)(8676002)(8936002)(26005)(38100700002)(2906002)(31686004)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WW1vMkdhTVlWbmduaUIvckpkZnV4Mk9Obi9nZG4ycGZ0cDFVZlpNTElqWDNn?=
 =?utf-8?B?S3NiVjQvU0JoZDRCWHMwN3pGQ0o5a2VrM2lYMDdFQkRKdTZzQmVVbFJFeXQz?=
 =?utf-8?B?MTYrZitFTDNEajVNbTZ0TTIvS3Z1M000b09ia2NCZU5sRHNoUGJiY01tOUNN?=
 =?utf-8?B?S0RuejkwMkxpeWlqTXJwbjdCZElLaDlCSFVjRkp5ZGp5ZzNkVG9UK0NlQmVu?=
 =?utf-8?B?U3Mra2dNNG5rZ3hESFFGclFJQndHdWZTWEVvaFl2YzQ1R05neFpxZGx1SGkx?=
 =?utf-8?B?ek1EK0REeGVJMkxJY2Z1VmRtcjNRcGZINGZzd2F4c2doakNsU0ZYSU1nYUJU?=
 =?utf-8?B?d2FySkZ2NWFRc3h5c3grSXFCbVByc0p4ZGV1SHM0Z0RRcjFuNG1ZTjFPdEg5?=
 =?utf-8?B?T1kyRUJLRVRlQWVCanZlMGtNVE5WQ2NjeEdCZnRIQktMdGpEVG5DbDBVOE5a?=
 =?utf-8?B?OGF2YmZVSUI5OGNmSzlmUXI0R3RicDhXbjZIaXFQQmNBSzlrbGw5d1ZaNy9o?=
 =?utf-8?B?K3NNMTFQV3JlRkF3bVZtczZiMjM5cWh3TGVPaWFqK0hydko1dWlrcU84THRG?=
 =?utf-8?B?OThqNlNJbE1sUVduZUZrWVBFaXpjTkxJRGovVllBcDI5aTZlUk55dDFDdm5N?=
 =?utf-8?B?RzI3dEErbjhOOHIrZGtGMXJCekpVWGMrOXBvRjhvOWVYSlZoazNha004emNL?=
 =?utf-8?B?cHV6VXU3dk1BNlNZZjNNMTNrYm9oUUpzbmJhWWpSWjM1RW5wVHowOStQUmJV?=
 =?utf-8?B?djhWQi9ObmJ1YXRxMVB4MHYvQnBTNUQ4SzhyK3VzbmVNa0RZblloV2RxWkJD?=
 =?utf-8?B?dFJ2OGpiSXhaMndSRkRKUVlMMCtOamhkRDFtNUdPYXd0d3RKL1F5Mi95TGZw?=
 =?utf-8?B?QlZISWRSQ1VJSnVwNGNFdWJQVHc2bGUrdVFlbzIzN2czUW55ZWEzWW1iWGZ5?=
 =?utf-8?B?MWVYTUZJWHBNOGtOWXdGQ1padllIVWpRejZSRTNYMlo3QnFMUnpzTVVJN3Q2?=
 =?utf-8?B?SHlhVFRKMVdreXZoQy9CRno2THZLYm40OXZGZEdGaVpiaWlVNW9mWnpkb09O?=
 =?utf-8?B?NGptNG9ncit3TmRicVJHczMrOWVETFhGb2xjYmJONjZzNTg0TmRMSXZrbW5M?=
 =?utf-8?B?QjBpQWsrMHNET21hbExPRU9CaElCU3AyMWJDU0NneGtNTW9ZWGFmYlJGWE9k?=
 =?utf-8?B?cHMxYlBPdUtCT0grcFFQQlhiSk8yNXczM3VqeVE1bDNFOTlyWlRnUjV1NnJm?=
 =?utf-8?B?U1VWZ2k3S1hSTENYRHNGU1FkZU5WS3NrQU9aTU5QVmtDeDFZUWFPZTlVRnJr?=
 =?utf-8?B?d1V4SjRNd3AwQit3VkdOR1ZkMmRMNDJQTEZyR3g0VDhTUmZqZTVDaUhiK0s4?=
 =?utf-8?B?UDQ3d0tvaktMa1YzbExMaWpURmcwSW1sejNKaFVrODdFVHlGY01PRDVrYkFt?=
 =?utf-8?B?TW1tbmdocVR4Qkl2U1dKZGF1UEEyTVRwY0RNVnBlNm9VeHRRQ1hzekxCNWlY?=
 =?utf-8?B?WHQ5R1E0Y0QxWTVJcExtWklmNWFOY2NQT2JxakFxNmIvaVRlTlN4SS9tdEFj?=
 =?utf-8?B?ZXhZSXlWblRodW0yc080SjhkV2paN1RDWFNZK0dvYWc3ejhJdXI4c29IcDAv?=
 =?utf-8?B?K3NZSEpjWVRrcVI4MS81Y1lCcmg3Sy9XWElkTU1qOWozdHJWOGlURkdic1do?=
 =?utf-8?B?d0JuSndYb2xWcGZEcEVaRzljaEg2Tk5QRVd2UWJKdXY4UkRJQUU2Zkc1cWNs?=
 =?utf-8?B?TjBiM09aSnY0SzVNaGwydXB5V2Fodk0xZHphQ0VCNHM3N2thL29NUWtsOTJy?=
 =?utf-8?B?Tkpodjd0VHZVSHEvclU3b1RaeW5tV2JJVHV0Z0FqOHQzd29mSW0yanVOTEIv?=
 =?utf-8?B?UngraWFuNWo3TWkrZlBuUnc5aElkdlhGV2xIVm45K0p3MHAzMFBLTWZFWlNv?=
 =?utf-8?B?THlYSVRhd01veHhWQjQ4UEIrOHpVcXJpem1lRC9LOFBxdUYzYmVZd0UvMTQ0?=
 =?utf-8?B?UG4vaXBSVm9HZE9HMXRTYVhFUm5SdkhuMVFFSXBhTVVDTklGM3FVU0hYajlu?=
 =?utf-8?B?TlZMZDhTQUo4Z0tydG1zeWl1QWNjYTJ6T0FFYm55MkRvN1BsM2grUnF2ZXUr?=
 =?utf-8?B?SXZtM0Y0UmtHSS9hWlZ0L2tKTDZVUWhjSC9XY2NidThmZUJiU2YrMFQ0SDZG?=
 =?utf-8?Q?VgB/l97VMgCpY0j446mWnTI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bae03471-bf86-4d68-e1c9-08d9cf67f597
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 09:52:46.3455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /u/Z6Aemort94jObjDifg+OanqeBSSElDgKNwiUaT3TRx95+hT9K3EhwsEvYVbgKTiSdxzezEeRu9pKFsvJ94Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3933

On 03.12.2021 13:09, Jan Beulich wrote:
> The 64-bit form forces %ecx to 0 while the 32-bit one so far didn't - it
> only ended up that way when "pv_context" is zero. While presently no
> leaf queried by callers has separate subleaves, let's avoid chancing it.
> 
> While there
> - replace references to operands by number,
> - relax constraints where possible,
> - limit PUSH/POP to just the registers not also used as input,
> all where applicable also for the 64-bit variant.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Any chance of getting an ack or otherwise here? (Anthony, I realize you've
not been on the Cc list originally, as the patch we sent before the
maintainership adjustment.)

Jan

> ---
> I'm pretty sure %edx also wouldn't need to be subject to PUSH/POP here,
> but I didn't want to go more "against" the comment than obviously
> justifiable by the input registers used. In fact I've observed gcc to
> pick %edx for putting "pv_context" in.
> 
> --- a/tools/misc/xen-detect.c
> +++ b/tools/misc/xen-detect.c
> @@ -52,17 +52,19 @@ static void cpuid(uint32_t idx, uint32_t
>  #ifdef __i386__
>      /* Use the stack to avoid reg constraint failures with some gcc flags */
>      asm volatile (
> -        "push %%eax; push %%ebx; push %%ecx; push %%edx\n\t"
> -        "test %1,%1 ; jz 1f ; ud2a ; .ascii \"xen\" ; 1: cpuid\n\t"
> -        "mov %%eax,(%2); mov %%ebx,4(%2)\n\t"
> -        "mov %%ecx,8(%2); mov %%edx,12(%2)\n\t"
> -        "pop %%edx; pop %%ecx; pop %%ebx; pop %%eax\n\t"
> -        : : "a" (idx), "c" (pv_context), "S" (regs) : "memory" );
> +        "push %%ebx; push %%edx\n\t"
> +        "test %[pv],%[pv] ; jz 1f ; ud2a ; .ascii \"xen\" ; 1: cpuid\n\t"
> +        "mov %%eax,(%[regs]); mov %%ebx,4(%[regs])\n\t"
> +        "mov %%ecx,8(%[regs]); mov %%edx,12(%[regs])\n\t"
> +        "pop %%edx; pop %%ebx\n\t"
> +        : "+a" (idx), "=c" (idx /* dummy */)
> +        : "c" (0), [pv] "r" (pv_context), [regs] "SD" (regs)
> +        : "memory" );
>  #else
>      asm volatile (
> -        "test %5,%5 ; jz 1f ; ud2a ; .ascii \"xen\" ; 1: cpuid\n\t"
> +        "test %[pv],%[pv] ; jz 1f ; ud2a ; .ascii \"xen\" ; 1: cpuid\n\t"
>          : "=a" (regs[0]), "=b" (regs[1]), "=c" (regs[2]), "=d" (regs[3])
> -        : "0" (idx), "1" (pv_context), "2" (0) );
> +        : "0" (idx), "2" (0), [pv] "r" (pv_context) );
>  #endif
>  }
>  
> 
> 


