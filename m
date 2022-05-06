Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0DC51D572
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 12:13:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322871.544330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmuxY-0005g4-2x; Fri, 06 May 2022 10:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322871.544330; Fri, 06 May 2022 10:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmuxY-0005dd-0A; Fri, 06 May 2022 10:13:16 +0000
Received: by outflank-mailman (input) for mailman id 322871;
 Fri, 06 May 2022 10:13:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmuxX-0005dX-3J
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 10:13:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23c86e23-cd25-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 12:13:14 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-dCmWwwOrMOKOdWYPf_NhEQ-1; Fri, 06 May 2022 12:13:09 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB5109.eurprd04.prod.outlook.com (2603:10a6:20b:a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Fri, 6 May
 2022 10:13:07 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c%6]) with mapi id 15.20.5227.018; Fri, 6 May 2022
 10:13:07 +0000
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
X-Inumbo-ID: 23c86e23-cd25-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651831993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4yn/mjopIcsdwKCI+lQ+IMj95fSkjNZVLS4gd1rMHn0=;
	b=fx+dcz1V32d3QdNZCKiXjjSPrwoujb6ifJwxfRa398aE9TGM0SuW1vfDuPAkDqeEce8yLu
	J+2M+bcIvT5kEZO38ocP2GB5vV6zbH8M8YAD4npMszFHiaAw3OoK1MQYl1zLtRdpdfvE6/
	agbXJFme/+gYvEOIeTbVZB+OtWORvfs=
X-MC-Unique: dCmWwwOrMOKOdWYPf_NhEQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwB5tFTHBfgR7CClXhM7sSvtukjUaBneU7FV6cY2is85f5HQzfrCLYQ6XON7SMe1B/8C/Y2N13peXWicpoOCUi/JzbduhxNbggJZhNbw/i/kyqpdm2L+sZOtml4pev6SsRvRaF/uKb9Elgo2ucm8lob4CPWQs7DcPtmWYKOkMVrml7RjmaRtvFQBO8au048IcQBv9XYm4B9Q9yqxZH6YuJhnyq5MOHsltxY4Sdn6fXuOR6ppcra7amzTWLLNP3TzrJ1YZufLRw+BXhWuWHIuuEIiBWhOLIhGIU+Oo2nKR3/PP90ub4rsMUY3U3Yc5lKIVqbSoGTo7dQKAzNM81kmSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yn/mjopIcsdwKCI+lQ+IMj95fSkjNZVLS4gd1rMHn0=;
 b=KOtukV/OKzJsV38kdNVA+EN8lVn8/GKQjhlIMcducHHhkqlJ/38gbj1tY7IOy/eUjip3V6SKXDWBUY4yG9hQ0l0CSl0bJ/k/4Q8gTSAH1QXa+gTl5Cdre3dW1XmdPTQGQ1WhDKmN6CSgDecf7Qa+angFpdB/1vpSoDXT4yQ2xXWsdcZtIUzwZRO+5GvoD+pHX1JdlySVdTYWeBPGAs+Bvd2TLmKOj3BMc7mQG3aH8+yFUBgsuIr/I3D+qnXTE/bK98d0e8PKiO9uRqg+Roh2cnZylOKryz+3QIoYxwvKvdXU70w2pzuZlHaeQ9aMf+N5ZLYm2oCZzVqyeAzpXVZt+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <387bcb63-f9a7-0032-bcd5-088b65b9c10d@suse.com>
Date: Fri, 6 May 2022 12:13:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/9] xen/arm: allocate static shared memory to the
 default owner dom_io
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220506072502.2177828-1-Penny.Zheng@arm.com>
 <20220506072502.2177828-3-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220506072502.2177828-3-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0356.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::23) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 571a1230-d970-4a26-c864-08da2f490426
X-MS-TrafficTypeDiagnostic: AM6PR04MB5109:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB51098BA59B908792FB9C092EB3C59@AM6PR04MB5109.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/gL09UHpH0efU1eqmym6FfWwAbOisqZzhOtbh3yrY7E89edyRXoK+nEbLp8fD82xUOMDYlYvg3tPUYlNunBafp28FKIOKfLuHxOTvxTNUIVHBi4O2zmaZTuT8u/zrOM6KbYhh2do1c1pJXpZdZ4W1zJZ2YCJcCZHHkcMyV2cDupiKQR646RnFZ08Qy66SAMEqeTixC/FvNj5g5Cam8IPh4z4DlLVDNmcPuXhwZyK5BGbiMAWWykgNPmszf+MRHDCF64infQpXNHWTm7l+Cd0G+Txl6WmWeiNFsxgogRtaw/FaVJV0mPK+ZywWJXJiUcEYpEwWlNSwYKzB94Wv0mqSLYv6GIoAR5YdBYkazPstSEU6FWDRiK5qNZnOAgGBJx2F1fw/D9yUdizsslMu0u09KIMLUUqUZDn6yteCGf/Qa0aelWvPEne/jX/6DFUHwbdlUgf02s/2tTUSDJm4iuVeGIbS1KnzUaa5mh8KMBQOuB9Ct4ezGwRQixEQGopOqJ882QdHOGgnHMt/Is2ahHEn7fykdFZI2ZGgD2S7FKtQKRILpK7zLyosx0cWeUGQwVqjwe2yF2YZgH5HQufES0NcckE7xWzMbCBXRRmGolJEJg/q9jccwSDuRTp/WZN9TQWSbky37AuGlEw07FQwFupvV/Lers7eP6JFfsSL+FmSSQe4TAV6anlf/SvmkqsoDZbAsh5bCw27QN3ajEKupyhlSLSzGJ7XVpqzcuwqyzuprMxIlTIvjKidNYVFoC7A6v+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(6486002)(8936002)(186003)(7416002)(5660300002)(38100700002)(66946007)(66556008)(31686004)(66476007)(86362001)(6916009)(316002)(4326008)(2906002)(8676002)(26005)(31696002)(83380400001)(508600001)(6512007)(36756003)(53546011)(6506007)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmlsZUpVL09FWGZvUnRaeHQ2S09ublpoWTBneWVhajZkUmo0bE9nWDFZSURT?=
 =?utf-8?B?ZEdkaEYzalBVRWJmQ0YzdWE0dVdVOXE0ajVpdXhncW5yOWtFQVlKSFE5b2ph?=
 =?utf-8?B?ZTVsajFQcUk3R0FvY01lOStsTitRZG9jeDdEbWNSYkhDSHBxeU40SFdiS3Vo?=
 =?utf-8?B?TU5IWjJBbXo1Q1E2eitnSHhSRlRzU3ZKVnAxZWQ4aU1STkVxRXVsMk5kTUU1?=
 =?utf-8?B?bDRYUkk2Mm1kOGpsMGR4SlJhaDB4Wk9QNk5xMmVBRXpaT2NUSkhOOGFBSlNJ?=
 =?utf-8?B?bXNXNWQzbitGdHJ0TlVLSjZwR1pialdKVVp0SzJLTjRoN0FTL1d4cDFNTkdo?=
 =?utf-8?B?RTRRSjV3RkQ3MWR0VlpZWUJSMlBPa0JLY3g5OWtqSEtsa0tmTmpQL1VDV2tC?=
 =?utf-8?B?YlBFT3JqcTN0OG8zcDdzUVh4RmtsZHQwOWFCM1VQd1hCc2RPeC85a3dDSGF1?=
 =?utf-8?B?S3NVZUwzWG9Yb3FMNHNmSjFkWE5adGIrZjNwVGF5RUxBSXRmQTNNeEV0S1p6?=
 =?utf-8?B?ajBPQ0F2Y0ZSSzZxWGlPQVpzZm15cWZXNzdzdWptUGhLcHI3WW5Xb2FNdDFy?=
 =?utf-8?B?WkZiSGc5ZTJtbzVjaC9XZTlEazFjYnJ3MUpiQ0lCL1FLZHFnTmxIaGpjak00?=
 =?utf-8?B?VlUrSUJUU1hKTzNCRFNOdFZsWVdzRjVRSzZML2ZaS0hWTVZ3VTkxSEU1Q0sz?=
 =?utf-8?B?QnF5TStrckxVOWpzNC9ZYTFQYXFyMS85bjZCZjlKb0R5R2kzS3ZKVTNOamRp?=
 =?utf-8?B?bVR0NW5rbjJYRG8zVVAvVU95YUtpYTZaamR5NTAxSHU0ZjdkdExQa0ZUTTVK?=
 =?utf-8?B?M1N5UjZKOWNIKzJ0a2tpNUVPcDF1Uy9VQ0gvTDhGWVcyeUZtTUV4bXJ4YWxr?=
 =?utf-8?B?cFlKTGFZY3BFOG9pOW16M0FoNUxOK3A2SGlUNEJrUnZTZzBUR0J1Z1hrUFlm?=
 =?utf-8?B?L25XNXBpR2RTUTVIVVNUZjcwU1Vsb1Z0ZVlrdkxmTVN4cmltZVkrS1VMRjhM?=
 =?utf-8?B?Sy9UYkJiOVpCTVNObkdDU245Q1V3MENWKzlTZnB1c09pM2lTV0dZZjQxaVoy?=
 =?utf-8?B?U0pkUDdFZWhCN2VxUmdzbkdSeXZvYWtpUk1Wbm5lVld6T3JXRDNzbVFXeThU?=
 =?utf-8?B?ekRhbXA2SHNxM1VXa3R2MXBsbll5bEFmenVVRjVxTllsbWFmQ1owNlArU1Ir?=
 =?utf-8?B?WWpvR0pzRFIxcURDQndpbEdYMko1aXVUa1ZiSE5IOE12ZlFMT2RqbXJMOC9C?=
 =?utf-8?B?WVIxekdWK29PNWxmWDNaaUdhSEYvaXlQK1FVQ3U5eUI5RFhQUDVvZ2owUS9q?=
 =?utf-8?B?K05OSDhlb2c2RFI3WkhCVDhmZHAxc0xMRkpiYnlRRmRZdUs3d2R3QUtMTEJi?=
 =?utf-8?B?YldnK1JoYmdZMVBoanpMVEtiVzgwSWludXJmOS9ENWFWWXFjd2E1RUJYMHJI?=
 =?utf-8?B?ZTBuMkVDS1hxajJ0S3RFb3RYcVVFV1Y1QkZnZUZva0ZnVC8ybVlCbDFKWmRy?=
 =?utf-8?B?YUNvamFhV1RTci9IS2ZIRTlGd24zeWRSVnlBZDJjbThxdUtwbk4xb2VFaXVG?=
 =?utf-8?B?MnB4OXNrRVVWWDhQR2k4N0J5VlREaFV3NnR1N2tDREcxZytMNFJFMktvUWtH?=
 =?utf-8?B?SzZRY0hjWmV6U2Jtek9WWG1YMzNwWkxidFhsanJSRGtyS1lPYmNzZzJON21w?=
 =?utf-8?B?ZHF1VmxFdTlxak4wTmptRXdtRGRISzd5RGlFVkhGOGVOOVZwd1dBODZFRzla?=
 =?utf-8?B?cDBCdTQyNXIwamNrZ2VsV2FKVjh3T1dDWkNBb1VibE5hOCtpOXBYL01SdzZP?=
 =?utf-8?B?emE5T1MvSmxlYS9GWGZlVWZQcEd3QTRNQnl2S09yUUZGWWtNeWtQbENwWk4v?=
 =?utf-8?B?b3VTa1ZDZ2wrZ0dneVJsanNYWU1oUFpZUUJsVG5iSFM1TnBRTEcrVWgySVRQ?=
 =?utf-8?B?d0JONHBZZ29YeTFBYmREaW4vZGRGeVR5SG9xTS9vTlovcTZ4b0s1US9oRGtK?=
 =?utf-8?B?ck5yOFVEMFNnOEFMSkR1dThGUTdnS3psa3o1UTFHMU1iQnFsWVZ3VmNZL2cx?=
 =?utf-8?B?ODI2OTNqek9sN0NORE02S1FwNTFqZEFqcytQTThKb1JFb3hVSE5VOS9RZGpL?=
 =?utf-8?B?NEZPL2UzdmxLLzhTaDlxaU9CZDNQaDIvMzgyTjVzbEszVGNHb3FYNVlSTXR1?=
 =?utf-8?B?akR1TktMRE1TUWdlTmhvSm0rRG9PN25QWVNmU2tvTlJuSitwZlJNU3hwRDFK?=
 =?utf-8?B?eTA5RlpVbHhjeGtYelJOSFJ0QUF6MWJ6M3IrSjV4QklHV3JMZzlPS0ZBeS9o?=
 =?utf-8?B?QnkxUTVUV3JqTEpYaVIvS2hFTUk5bTZqSmUwS3V3dDQxVVVuSDdOdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 571a1230-d970-4a26-c864-08da2f490426
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 10:13:07.6521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2JqP4dqW5/GtN3SI80IXpIMPMSeUXRGY/tjiBkGuZgfXX+5vpYtMeD4pguKR6sCpVb1LRJskz14qbKmXOaRwdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5109

On 06.05.2022 09:24, Penny Zheng wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -777,8 +777,22 @@ void __init setup_system_domains(void)
>  
>      /*
>       * Initialise our DOMID_IO domain.
> -     * This domain owns I/O pages that are within the range of the page_info
> -     * array. Mappings occur at the priv of the caller.

This information is effectively lost; I cannot spot a suitable replacement
in the new text.

> +     * DOMID_IO is used for mapping memory and MMIO regions when no explicit
> +     * Domain need to be specified.
> +     *
> +     * For instance, DOMID_IO is the owner of memory pre-shared among
> +     * multiple domains at boot time, when no explicit owner is specified.
> +     *
> +     * Also, DOMID_IO is used to restrict page-table updates to mapping I/O
> +     * memory. Although no Foreign Domain need to be specified to map I/O
> +     * pages, DOMID_IO is useful to ensure that no mappings to the OS's own
> +     * heap are accidentally installed. (e.g., in Linux this could cause
> +     * havoc as reference counts aren't adjusted on the I/O-mapping code
> +     * path). This only makes sense as HYPERVISOR_mmu_update()'s and
> +     * HYPERVISOR_update_va_mapping_otherdomain()'s "foreigndom" argument.
> +     * For HYPERVISOR_mmu_update() context it can be specified by any
> +     * calling domain, otherwise it's only permitted if the caller is
> +     * privileged.

Much of this looks to have been copied from the public header. I don't
see why you did this; if anything a reference there would suffice.

>       * Quarantined PCI devices will be associated with this domain.
>       */

I would also like to ask that you add the new purpose of this domain
_below_ all pre-existing ones, such that this also somewhat expressed
how things have evolved.

Jan


