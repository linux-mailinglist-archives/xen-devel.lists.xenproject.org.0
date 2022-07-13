Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DAF572F27
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 09:25:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366245.596949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBWjo-00042H-8F; Wed, 13 Jul 2022 07:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366245.596949; Wed, 13 Jul 2022 07:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBWjo-0003yp-4y; Wed, 13 Jul 2022 07:24:48 +0000
Received: by outflank-mailman (input) for mailman id 366245;
 Wed, 13 Jul 2022 07:24:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XN81=XS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBWjm-0003ye-LV
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 07:24:46 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2071.outbound.protection.outlook.com [40.107.104.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de98de93-027c-11ed-924f-1f966e50362f;
 Wed, 13 Jul 2022 09:24:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR04MB2965.eurprd04.prod.outlook.com (2603:10a6:6:9::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.26; Wed, 13 Jul 2022 07:24:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Wed, 13 Jul 2022
 07:24:43 +0000
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
X-Inumbo-ID: de98de93-027c-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BkNfRFbI1SQIfv8XP44NHJTUIkbl0uO6iNfH/z/z340f6pgw9e3/phFwOW/yEDFR+RwaQ1dtgK+6ch7pAPfcITtWyefyskJtRF7wgvvAKB0PblnMqeWJ+W/+pWXr8gzehV+wlJezh1X8if9QVcaaNF0FjeXlE0e/z7DTnNRIpz0hIBRmeV/pPDL6itNx7HCz3w8U7VSmghPTTVr5K4OMrwdlRsc9hG9hLOdBgaMqXoTuwM/9Rli+gVe5ZpsfymkQrjtqMcW3bMomJRw7G+adH6NdDciEebVEaLzWNkNGD5L3CnHDByr5hUOOY8ckVvyJJ6Nx8iJWVOCDHkT461hfAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFOt2YU7Jt3Tz3956jw2bIzPeY3CQF7ICcOF63E80+I=;
 b=FfGE5n9t7W255yi8yLt8ArRh8LyWPTZAEjuq80yiaJsmRVKTgOvN1pb4+wLHon3Yu0WUaakeODsyzKFIi+IbZtSGSiJcanWrRQH3FoF4Jre6r1Uald/wPxEmuAflCGwz1UU9fvgenIgu3Z5jWrNRYfVdcRQnRBK9JR3S66Zhlx1dUfkQPc8bEKCu0VaMtRQWYgPiLUgNuRCEWPxJEEyS3VLHnNxSKRy5tkhDkYE3rB6eP8fyYQ82+ROY7/tFIb3SpU7xb9A7seK/bhpGELl8zQ2RC2VuQ8unWqHugxD+WFnBnsF/oQ6LJA0nMpY80WCldwUUJFLeyN1AkiZDzSCKbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFOt2YU7Jt3Tz3956jw2bIzPeY3CQF7ICcOF63E80+I=;
 b=PFU/m9qz4LPKD7AiJuCWusqPbWqKa9Aaghu9iwJOLq8IA8ymOTBvLxchOYp6shybxqjJKNVg+V/C3f/nZt6Hv/P1ekmSbvxMsvgE9HGovyoUK0EcpHdj9TmhGm6Sv72HoAy63S2SnRVIYgOF91AKR3UYFnOB5voiCypEsj4p/FEHjVU7NlG6AhII2TUChs1yK/ycUwDGjn1ukGAFZZNF+NJRv012wNvOfJog/kB+x+MwjwjAl9LbXEzCst07CemgjGF1pJKfe+Y/gpecrap2f0ZCrpBlmr0HAXrZ66g7WQl5tqW63HLlxYR/qLJg0LOl+vDzeOn5de52+fy/cDS2FA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e8c9eb59-156c-7b6b-0ef5-6744cbfa8e3d@suse.com>
Date: Wed, 13 Jul 2022 09:24:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/9] xue: add support for selecting specific xhci
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <399a41db5eb32197364b47a7031c30464803fa76.1657121519.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <399a41db5eb32197364b47a7031c30464803fa76.1657121519.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9c8449b-ffaf-45c9-e388-08da64a0c1e6
X-MS-TrafficTypeDiagnostic: DB6PR04MB2965:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xFaDkOErRIVcJo3ajnrhKBm0ekRx0Dbl7882S4BKI//HtK9bwdWhuQtgF38KIL4p5bM1C+hlNVZIhDIxYt2PrZ0crrGZqWBjBi/uMwFDT5g+SuDX/AXlwUaBOI7pkx1Ko4dgRDZuZ6tZyRoSJPtO3ptWu00BUp0gi2/AYzou/OVYqH5q7M3YuEDucpybRucsJ4nfE1dfF5v9Yf9oZGo2JhlT3u6Vx0aJ08vqAeTttXsImuxVjYvSRUCTagtxnsKHzgT0hAcYiaf/lT/OxNotCadao91A2oMcE0ORaCAnYJMypimh2zWXlBt2ZsbInBFQ7vzA/xwPxK3TcOZ3kY3VDPEz52LWp2zy/Pb7JqNQM4OfP5QOKONWvB7cyrKPvhMIkYdAU9+C9MjHBMORgoExIpfUyTJNIV+omplpkNAL1xi4WASDxHSkO7sHVWOovHeJ5hlEtemww1ZftglQg79vAAXOUp048/KW2bvm5hVMq2ZA/177Qn2TMUnXHE0QE1AKmHLokybPPVKQpLQEl3mXrtMZfcDPBMDrkZbcxyAyhV1X5+XM1rhEMVG2X88RCRLCXRxxk+HtHgSA4h0XXhK7q7IPGc7w6seI7mKYMJdJ67z6sXSRZxd27wQkttvufyVcxTvGz/9tVAruuhcSSGVLsV3wCUIQdKtqSSRTjXVF/LrBWFq+SchHNqra8Rrt9jFfKOjGWwJ3MJFaF+XR4VN9DcgzxiuJhvrp6UrpwaKSElGhbKo8BGkfq4NXnwjZI/fKmytuoHi0Tu1YeN11byi5rRp05KJpvWev2bxFa2+6fB5fBsfdBXzN58sBcy0TKPwjgOkBJsgAjPN6BRdhrHrIq11DGZA9c/McsjVSZSdGIio=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(136003)(396003)(346002)(376002)(36756003)(8676002)(316002)(6916009)(53546011)(31686004)(54906003)(66556008)(38100700002)(66476007)(66946007)(86362001)(4326008)(6512007)(6486002)(8936002)(26005)(2616005)(31696002)(41300700001)(186003)(5660300002)(6506007)(2906002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0N1MmhWZTVXZjV0NWN2c1Q5SWhqWVg4ZllVOGZWSnV2ZUlPbFAxMTlGcHdT?=
 =?utf-8?B?WnphMHVDbG1oQk1JRXRlbTljMlpuSVJXcVJETlFQb1N5WWdJMk5QYU9VRjV2?=
 =?utf-8?B?S1ZtVnVkM0lrQ1NhK0txMk10a2RveFkvSWNhcUdNNkhaOFlxT2RuZWlWOVcx?=
 =?utf-8?B?S1dQcjFWcTc0RDFNc1ZMYWg4bzVtb01kT0FmcC84VnA4MTB3NFViUFA2ZHFF?=
 =?utf-8?B?QjhTdXlxMDg1NTkzc3I2SGtkSUlWVTR0cGFlZ2Z5K0JnZmFGbFdjb081VnlT?=
 =?utf-8?B?ZjBpRWZueTEydEVWQ013T25udUlueHhDU0JIWnV1UDYrbU9zV1g1WmNaa292?=
 =?utf-8?B?bnFmL2RnaS8vMTE5NHRyTnZaMDEyT0kxQXlMTFRyZ3Zyb2ZRZzRDV2U5c1ZP?=
 =?utf-8?B?RzFyeVMvZ21hYlVab2xvbHh3NmlTeGp5RDY2M0xjVC9jOXhyeEc4eHU2QzBx?=
 =?utf-8?B?U0V3ZWNSaW1JSDFnR3VzTk9lL3k1WHZmYVdKVzl0cS9wN0wyRTE0Tm5MYWc2?=
 =?utf-8?B?cDltZ0l2S091YzYvekRCNUpjTWcxN0N3TlBwS1BnQjhsNG8zaTJmOUVDdnpX?=
 =?utf-8?B?dWRxMll4bDdRVzIzekxJYWRlZmd3bEJOZXh6UlE1OEJISFFzVmx4dW51Wmw2?=
 =?utf-8?B?U0cva3cwL3NBVUNMWjc0MEMzcnJpeFQ5a3k2L3NlQkJoRHZyajNXNXoxVWJy?=
 =?utf-8?B?N094Y2x3bVgwcW9FWFJFaUZaR0V3UHlPZEhScWVaa0V5RkM0V2c5T2N2czNM?=
 =?utf-8?B?QnBqaFdVVElESG9HOW1YNXI1OXR4SCsxdklhYXJOMUdyc1M5L2NwdDNxTWtY?=
 =?utf-8?B?WW40WnNTaUtaL0ZmemFvaTVtaVVhK3BtWlF0dGdsbmp0bndNbFhLK1pabzRi?=
 =?utf-8?B?Q0FXSzJYUnhqUmdaV0V0UjR1Mm9NejBQL2tBeXovRE10bU4wbWdhWmxxcWFC?=
 =?utf-8?B?eGNGWTZXbU9pbFpidDJkVHE4WllEZDFNZDlYMlVESzc2RWVlK2pucDlYK1la?=
 =?utf-8?B?dUZuRFV4cUtMdEM3L1IzdFdsWUhuK0QrazhOckxpTDdIQmpuQTNIRXlDN2VK?=
 =?utf-8?B?c3REV3MrZVYyWVFsR2MvWmttZ0FrcWtWaHQ4VVcxRE5aV2xERlJJR1F2Qkhk?=
 =?utf-8?B?bGRJb3o5OFlsdUdCTjlHU3d4VG01ckxyZC9YWFphRVRHdjdZUUV6akRWRDU4?=
 =?utf-8?B?ODdqSTRMZlJrVkNBbmQyWWg4QXJLQkMvRUg1emR2TkdDbldjR3RaQys5enp4?=
 =?utf-8?B?M3UzeS9pYWFXTHRiSnNpVVpWVzFDd01wcFd6SmhxbVdQL3kxLzBSTXdOL2Fp?=
 =?utf-8?B?TEw3T3ZwTzY3NFE1c1U2THZ3UWtEamc4Sy9ON1gxSTdNQWo2emQxU0ZoQ3FI?=
 =?utf-8?B?Q2RwbzJPemdaNjFXWG5MaFZZcE5VRTVyVk40cXlFVnZGcVovVGZBRlZpYWxh?=
 =?utf-8?B?c3VtM0ZKSUxDTFhVMnpreGpCcmliTU5UYm5vekxPeDVaSWtlbFJMTElxQUU2?=
 =?utf-8?B?RVBmYXlHZFRENktVMms3UU96SkI5a3NkY2dqMmF5SXJuc0RZdnFRWmlxNmtZ?=
 =?utf-8?B?S1FMOWU0U1NJREozWUc0dnhTS1JoTnhTL0p3NGFNdFEwYktTU1hONHk0UHJz?=
 =?utf-8?B?TVBqSVZHeVpXbUdSYnBHNUd2ZTZBRVFZUnVzNnlJNHlCSm4zNlRtYzZzOGlv?=
 =?utf-8?B?S3BJR3R5MTVTV3QrbXVTVVRnTW5zc05VV2tKcnBYNjBDaFh2bDVKRmowbmds?=
 =?utf-8?B?bkM0dmsrQnhZbEpuZmlQa29VMkN6SUJqVGhCUG5GeWZzVk1DTGpBZkY0Q2g2?=
 =?utf-8?B?SktNZDNJaWRDb1IwcGo1RHhsNUt1MFBma0c5dzZYeXY3UmJUTFNTWmtiZ1VP?=
 =?utf-8?B?UjhqN0hFVXduZ1BTbmx4RzVvc1VzdXdyb21qUmVPT0kwNC9iV2VudzdlbEFU?=
 =?utf-8?B?alA4WitWUWM5VzJrd3RVb0RnYkRTcXdVSTVnZVo4aFdDL3B4NXYzVDdubDJD?=
 =?utf-8?B?ZFcvRVh0SEw2cFQxaWllbFNabXVRWVN3NWpvTE9qVHQyK2VUcUo0LzFPSDJm?=
 =?utf-8?B?OVkrZUZZeUpUQ0JOZ2d0d3dyc3dnTndaOGJPT0pEOUVzY0Qva0NPZDRSV2pP?=
 =?utf-8?Q?6uxui7cUoFEI3T4pla+xicoZC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c8449b-ffaf-45c9-e388-08da64a0c1e6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 07:24:43.7963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ugbt56ZfW9wdGxsa58GyChsWC6m9xwvkc9RMZc21x3TO1O7UiP5qRy4q9Gg+Dn2Xwvna0CZirItJGyEWGzry7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB2965

On 06.07.2022 17:32, Marek Marczykowski-Górecki wrote:
> Handle parameters similar to dbgp=ehci.
> 
> Implement this by not resettting xhc_cf8 again in xue_init_xhc(), but
> using a value found there if non-zero. Additionally, add xue->xhc_num to
> select n-th controller.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
preferably with two adjustments:

> @@ -238,24 +239,35 @@ static bool __init xue_init_xhc(struct xue *xue)
>      uint64_t bar1;
>      uint64_t devfn;
>  
> -    /*
> -     * Search PCI bus 0 for the xHC. All the host controllers supported so far
> -     * are part of the chipset and are on bus 0.
> -     */
> -    for ( devfn = 0; devfn < 256; devfn++ )
> +    if ( xue->sbdf.sbdf == 0 )
>      {
> -        pci_sbdf_t sbdf = PCI_SBDF(0, 0, devfn);
> -        uint32_t hdr = pci_conf_read8(sbdf, PCI_HEADER_TYPE);
> -
> -        if ( hdr == 0 || hdr == 0x80 )
> +        /*
> +         * Search PCI bus 0 for the xHC. All the host controllers supported so far
> +         * are part of the chipset and are on bus 0.
> +         */
> +        for ( devfn = 0; devfn < 256; devfn++ )
>          {
> -            if ( (pci_conf_read32(sbdf, PCI_CLASS_REVISION) >> 8) == XUE_XHC_CLASSC )
> +            pci_sbdf_t sbdf = PCI_SBDF(0, 0, devfn);
> +            uint32_t hdr = pci_conf_read8(sbdf, PCI_HEADER_TYPE);

Already in the original code: Why uint32_t? If anything, uint8_t, but
according to ./CODING_STYLE unsigned int might be even better.

> @@ -955,12 +967,29 @@ void __init xue_uart_init(void)
>  {
>      struct xue_uart *uart = &xue_uart;
>      struct xue *xue = &uart->xue;
> +    const char *e;
>  
>      if ( strncmp(opt_dbgp, "xue", 3) )
>          return;
>  
>      memset(xue, 0, sizeof(*xue));
>  
> +    if ( isdigit(opt_dbgp[3]) || !opt_dbgp[3] )

I don't think you need the right side here, nor ...

> +    {
> +        if ( opt_dbgp[3] )

... this inner conditional.

Jan

> +            xue->xhc_num = simple_strtoul(opt_dbgp + 3, &e, 10);
> +    }
> +    else if ( strncmp(opt_dbgp + 3, "@pci", 4) == 0 )
> +    {
> +        unsigned int bus, slot, func;
> +
> +        e = parse_pci(opt_dbgp + 7, NULL, &bus, &slot, &func);
> +        if ( !e || *e )
> +            return;
> +
> +        xue->sbdf = PCI_SBDF(0, bus, slot, func);
> +    }
> +
>      xue->dbc_ctx = &ctx;
>      xue->dbc_erst = &erst;
>      xue->dbc_ering.trb = evt_trb;


