Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E083539D17
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 08:15:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340226.565202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwHcr-0007zb-Od; Wed, 01 Jun 2022 06:14:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340226.565202; Wed, 01 Jun 2022 06:14:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwHcr-0007wd-Lp; Wed, 01 Jun 2022 06:14:37 +0000
Received: by outflank-mailman (input) for mailman id 340226;
 Wed, 01 Jun 2022 06:14:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6G0=WI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwHcp-0007wX-LY
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 06:14:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b64036a-e172-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 08:14:34 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-3A7h9_OWOl2At6zZNkBSXw-1; Wed, 01 Jun 2022 08:14:32 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4692.eurprd04.prod.outlook.com (2603:10a6:208:cc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 06:14:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 06:14:30 +0000
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
X-Inumbo-ID: 1b64036a-e172-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654064074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p07NFfR9d7h8GbcIWy0Ibo2cvAr3i2BG7PXENiPZ15c=;
	b=Zjc1ZWSC+AC7ZjWnCRiVBmzmBiIXpmW4Zpwsdq3gyEnQHuj9DDVb5WbhfcWoULMD13EzRC
	tThI73RlFfZo4JCGri8s4Dot9YraVoMR3NiDUhmCkf/UEd6g5ZrH47IEvrk9wwo92XTUZS
	TK3gKRrq57rylHePj66m0aDj4vpZHQ8=
X-MC-Unique: 3A7h9_OWOl2At6zZNkBSXw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntKsivT3y5baupIlOE6OontJfJ5IH8M28zRzxuro5kIl5KlwiM63/hJvmS0cbDIepxkhCMw3Lt/aniJKWyG31wyCFMj/B6fGVWnrr9T3By8WQxrXQH3kDxpHO7C46Fzb953izcKITsc8Rn51bkymjCU4irAGvL9XTlK82zKz2aeaDRedCZmJVf71lp/fOaLni2ko5t1M3v+2XIFoSSmlno3TkiftkjKqqCquQRSFBO20HJGBUCobGoTRfOVHOWWqVRCyNm2yQRmwMwoMZQbPCIGM327J2vHSIYS6OXaCPpEHZUUOSq/wkpmG0FHJQkGpInE4gZxfyVAOqPAXevv+Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p07NFfR9d7h8GbcIWy0Ibo2cvAr3i2BG7PXENiPZ15c=;
 b=l3IpPTn0wrpEpvblBhcJjIcMptD95pSv8I2RpzB+CoXWYjYzdSJytLFDAsRN//glriQp0GQ26H3pMf4xgZuHPmKG0jnt+YSxIgF7l/N/ayM2HI6OD6NJkn7Gw+ccQizOGJldS7s6yZ8OmIp+ycX3xav9exYUYNnptNXoM7XnQxcmJsb6WAl2fP7sAgtSqd/1Nv8zuF+++4C3OYGwDgUfq71Gkp+XDKo8WM2lFWjf2xoXOXXGJPMyNrCDAOdfDnnsYRFkjNwZXEl8v6t/vLmumO8m5N3epqthimYTKXVCphc7qgqHf4HXaUebu2DC6iro8RogRYHDBlP/a0t77g6jlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e7582bd3-1a3b-49e9-7d3f-f86ae3d4ab2b@suse.com>
Date: Wed, 1 Jun 2022 08:14:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 3/3] xsm: properly handle error from XSM init
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io, jandryuk@gmail.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
References: <20220531150857.19727-1-dpsmith@apertussolutions.com>
 <20220531150857.19727-4-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220531150857.19727-4-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0107.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::48) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e25efef3-1b9e-4273-7fd6-08da4395fd4e
X-MS-TrafficTypeDiagnostic: AM0PR04MB4692:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB46928530DFE04FFA63D16246B3DF9@AM0PR04MB4692.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KTqSAi1v59gl7Vb7idHyIJJzdeOwgJBACwfJHFtRnDpYR/ii87NrJ6PKfWaERNXqp+eGpX8bIQlofbov+DbgiY0rDYEdt5w9t/6wdWp7xp5d1Tn6d7Q2+ghLl3MoSfw+cp+tNi1EjKfhcux48TnnXaAibXAxX74WVJygqfIvEV3aX4nneCFStL1ZinYRybIGEC9JA+ZMatpYK2o00ouvWE0IbCrGTW/Pq2Bc0qF4igE3YHmCJcCybQaXp4zeG87Mr+jo//i0GOPc1y6ci/CLX8GwlyjuaX/PF2djhkaa7r6vRy/T/pEQIieQQJhIjNbBVCF1J4tFsn5LitEFCfDLyMaPZHeIgCtUqDVGd3+7fTiCuJ5boq1RyskHbDMLAV/0Sy5kAwjWTzWgmkLwZ82RVxh33PodB8j1Bxo0wNFMw/A/yhMTHvwMLu6+iywR9Yzd+PIj7JvW8jzA709lpYU9c2jZsXXrx2MrhjfH5rsSKnqVk6jAXMv6mSJS7ss/IGr9dgA6LdTR2CIZQTTPDnv8ifkxaND0itYBRkLkKeJj3WLaLQvU9BroBaLC0isH/LBZYiQmHrLrU9zPjCNK6JG9ce9bd++T3i7+AyNWx8FIz2NbXnP/Z+yGmyWTuq7HTsCbZ6A4Fn+PdebDBm1O+eqoVNxHeuZR2UzDygwTs5TRhYV8jQlXRyxcBwGjOP2fZV/Wu2pCcA3au0vTkpoxn2Kd+PcL8FFHCe9KJtXoFCZJTNVIGr8ZvOhl+++VA0hgE+kw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(508600001)(26005)(316002)(2906002)(4326008)(8676002)(6486002)(6512007)(83380400001)(8936002)(66476007)(7416002)(5660300002)(66556008)(36756003)(31686004)(2616005)(31696002)(86362001)(6916009)(54906003)(186003)(53546011)(6506007)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0h0SzMvSnVYYkVzbkxhcW1aellHM2xSL3hQTFdHOXJmeFJmcVNIRks1Wjd2?=
 =?utf-8?B?RVdOdGNiaC9XYnRoUGhaM2Y3cjZOclRTa3lrM1BhRXYxdzFrM1l3cFJDRCtm?=
 =?utf-8?B?WnVjdm5xMXloMENqRWxSdm02b1pQeW53TzdaZDAzaFRNRGUxODNzdnFDR0Q3?=
 =?utf-8?B?bzJ2UGRGaHRSQ3hKRGxFQlluU0VsbE8zUHdNVFI2UFBiTVluVnRKcS9rY05j?=
 =?utf-8?B?anNHQWt5NUU0d0p3YVNOU3lnY3Z4MlZJQ0NMNm5UMDZlNUtWaElKaGFtTllG?=
 =?utf-8?B?NHZWV0pkSzdKZzloWUFWeThZVzhxMndDdWl3RkwyNEt1QitTLzNUa2JWS2Rm?=
 =?utf-8?B?RkxXazVqUHJqekMxM1JrV3lWWTRhTXJmdzhiMGlUaWxnT256RnNKK0VFNkd1?=
 =?utf-8?B?OVBscjYzRFZzOTl5K29oWnJrS2piQlFSQkd5aGtmaHVJTXBzYWRtZEYzOE9w?=
 =?utf-8?B?V0NXODRITmJIWEZPcURwaXRXY3pNR05vd3oxTFN0NDhXUlVpQjRpR2R5NzM0?=
 =?utf-8?B?Y0JVSkFEdVc1aVo4MnNyL1BhWi93YzlINzhwTVl1eU9qQTlmZlpjdkxjdHpp?=
 =?utf-8?B?VDBxUWdCSzZ3VFpVN3BFdmZKbFAxU3g4bi82SGJRU0hSS2djL1RBcFBSbzZu?=
 =?utf-8?B?SStMSkpuNUtIQSt1M1IzU2IvSHViem9TWUo0ZnE3bmtNZUJEaDJ6ZHA4dzN3?=
 =?utf-8?B?QTNlY0RQSTNRR0dQcC9RRmxjM0VjaWgrV1NXU3R3bFVUWEpLUTZ4cHpBcXJZ?=
 =?utf-8?B?TzRpNi9iaGdEejNiWmFuM1Nsc0R1SUFzODRCb0FIMTR3OFFWb0NyZm5VQ1hG?=
 =?utf-8?B?OW1tNHFVcEx4OThzeGlPU3duM0tlQWdiUmNURWEyaU92UDFMTVNkK043OG1s?=
 =?utf-8?B?Mm9MbEMwam1sMXFOVGdYTktwM00wVlFDU1RwS0FXK2prZXQ4Sk1oRlo4MWhH?=
 =?utf-8?B?ZnZGT1V3alJwUWZsc3FsSW9yTkJoY212U1ppVVRqQS93bzZMMkRJYjNDWHZt?=
 =?utf-8?B?M3VJZnRQU1BkQWZjU0gzV0xqek0zN3lVVWh4UkpEYW5mdHZPcWRhK3ZtbFBZ?=
 =?utf-8?B?R3BqdGpQUUYwaEFUUC92Q21oQ1pYT0tGL3Fsb04zNSsvY3VFTW5wMUNRVXI4?=
 =?utf-8?B?OG84U3F5djBId1hISy9uVFZoVlQwQmtnNXl0YXlQVDdwY1E0a0RlNitBa2Vs?=
 =?utf-8?B?aExZUDNwNWlaaDQ5aUZidXBTVks4VGc3OFoxZFVBLzg3VEo5UXBGb1lzcmNr?=
 =?utf-8?B?NmxFL0J5MGp4d255N2xOa3k2Z2ZaWDFKUEF4M2hHMHAzZXV4VFNlUHMrTkow?=
 =?utf-8?B?ajRQRU9uOXgyRXA1RHRsRlBuSHhrK3BkS2kwVlpkd1lCa2NBRkRpODFNZlBv?=
 =?utf-8?B?UW9ySVEwaC93bW1OVVdZdkxITmlvZUhvNlpUeDFYZXBDcDVJZ3RhKzRjU0d0?=
 =?utf-8?B?ZXp5WHhlMURQVlljV1lreEs4NDdLQkkxdUVRRW1nL2RDOG0yK1UrL0E2UmVn?=
 =?utf-8?B?WXJ1MFFtOWJvbUlmOENGRDNnNzBpcHc0ejJZWk9WbFRibnQ2U1Rsa0NpZ1JT?=
 =?utf-8?B?VXZDcmJlZzhQV2RHenM5K1d6UEZpZlJxQVY2dkFvY3Zta0RwL094T3RwQUNI?=
 =?utf-8?B?ZVlrZW5WLzlkdWRyRDJUeW4zZkE3cFVqemtaOVo3UGV1bVdsQVF3cmx1c2xh?=
 =?utf-8?B?bnBHS01adGJqZTQ2bTNNMUgxcndscjg1QkZkdUV2QU5MdzdRWmJVeXJJVXla?=
 =?utf-8?B?eHNFRStCRi8ySkxSOWpDc0xpUFB5MFl1dkl3UzA2RTZwcHZWLzVzcnR4eHFt?=
 =?utf-8?B?R2QzUXpFVEFqMFV4NmZ6YkFtbG5MTFFFczRtR2EzeFVlMEtUaVZiajRrNUF5?=
 =?utf-8?B?clN3RWc3dGlMM1BVZ0QzTnoxU01ROEJzTmZxSElXMGM5UUYzZUhwT3BJV1h1?=
 =?utf-8?B?eCtXRndMNEFHazNhdTJHUVcrdkcyR3V4bFluT0UvczIzQlpPckZyMHFmVnZH?=
 =?utf-8?B?M3N0SHlGdVYvd2xJcVZUcUppSitVeG54ZjFxL3I0RXlVVEh2SjE1QmNybVpW?=
 =?utf-8?B?WDBodFNCYUI3bzBnVS82Z2NCaUJjMHhXQkdWdTFCdEE3SnU1WDlLTGd4K1VF?=
 =?utf-8?B?a01ha24xdXpGQ3ZnUUZET3hZR1FCK1VFTHJ0aFBqVllpM01Fd2xaUkNoM0Vv?=
 =?utf-8?B?d1pCdHpUaWk1M1dZWERicVNNSHhCRUFhcW1OaGwwMzh2QkhpdllHMWlNalFr?=
 =?utf-8?B?cW90VFVzUDdGTVQ5eHhQOWxVbklJQXVMdm5hRWdYQnVLbU9weG52Vzl2TmRD?=
 =?utf-8?B?M0o1KzErRnBGbWgzWUZNUENrTFdDWi9QeTdLbFdtS09SaXdVR0tzUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e25efef3-1b9e-4273-7fd6-08da4395fd4e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 06:14:30.7033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bjnyDCOZVHXLcamsOYoP3Kq5e++uQzWqGFfhm9LxYvl3YJzBmvSs16IaLWysEC++eeTQll/rNztKIj0q+J4utQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4692

On 31.05.2022 17:08, Daniel P. Smith wrote:
> @@ -1690,7 +1691,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>  
>      open_softirq(NEW_TLBFLUSH_CLOCK_PERIOD_SOFTIRQ, new_tlbflush_clock_period);
>  
> -    if ( opt_watchdog ) 
> +    if ( opt_watchdog )
>          nmi_watchdog = NMI_LOCAL_APIC;
>  
>      find_smp_config();

Please omit formatting changes to entirely unrelated pieces of code.

> @@ -1700,7 +1701,11 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>      mmio_ro_ranges = rangeset_new(NULL, "r/o mmio ranges",
>                                    RANGESETF_prettyprint_hex);
>  
> -    xsm_multiboot_init(module_map, mbi);
> +    if ( xsm_multiboot_init(module_map, mbi) )
> +        warning_add("WARNING: XSM failed to initialize.\n"
> +                    "This has implications on the security of the system,\n"
> +                    "as uncontrolled communications between trusted and\n"
> +                    "untrusted domains may occur.\n");

Uncontrolled communication isn't the only thing that could occur, aiui.
So at the very least "e.g." or some such would want adding imo.

Now that return values are checked, I think that in addition to what
you already do the two function declarations may want decorating with
__must_check.

Jan


