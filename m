Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C07B43717E
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 08:00:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214733.373445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdnaV-0000nc-5I; Fri, 22 Oct 2021 05:59:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214733.373445; Fri, 22 Oct 2021 05:59:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdnaV-0000lA-1o; Fri, 22 Oct 2021 05:59:31 +0000
Received: by outflank-mailman (input) for mailman id 214733;
 Fri, 22 Oct 2021 05:59:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KgL4=PK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mdnaT-0000l4-B7
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 05:59:29 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 370ebe1a-32fd-11ec-83aa-12813bfff9fa;
 Fri, 22 Oct 2021 05:59:28 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-ILsiVrxSN0aI0f4EwSbVxA-1; Fri, 22 Oct 2021 07:59:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4351.eurprd04.prod.outlook.com (2603:10a6:803:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 05:59:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 05:59:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0284.eurprd06.prod.outlook.com (2603:10a6:20b:45a::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Fri, 22 Oct 2021 05:59:23 +0000
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
X-Inumbo-ID: 370ebe1a-32fd-11ec-83aa-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634882367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ooAiu42OjOtMgI5grSxQUzr+M00R2QwtZHSiOu261VM=;
	b=G9lw1GDeZe1yQnjKUawrvPIJ2tfvynR3JdD1DqWj2MFTU4gbDQkLkHX/LxjrFHFuGLjrgC
	U9VuB/bxScXaVVVJcwydkW/SWQ70J1bl6Wjz2FbYpvq+i7ZBw45Skq1y74o9Sji2r3ulHK
	mlg5NWBQjr3QgtsatRpvXgp8W+XU758=
X-MC-Unique: ILsiVrxSN0aI0f4EwSbVxA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ez1WLYeOY5rZ48KDwU7oiXOi1Y0RMvvzY3irRzc8o/lHgCogUcwIXTSdMwMPl5c3DP/Pkl6hKPC/0RHX+Wcx7+XVbw1b27UywIOmPQ8jO2VZqYqVGydIjQ4upD5QTKtRCYJ44pmT5S8zV6L0DXt0gFpGzWwxXiBMtCHJ0JLba2PE+So2hXRGLk3G2L848oO0yqTcPEEXmOvJ/j7iVybCgm8uc7h3RFrLFuqgmqzo7Asrh+Iqvz18mP/Dgo460qGkS0PA/Iz90Kpb18nh53pNjuLIAiYU7KoQu4XxErdwVo4R5pcp1B1sQfEB6oUZ5aqpClyZHwJQZcSRBSLCYVY6NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ooAiu42OjOtMgI5grSxQUzr+M00R2QwtZHSiOu261VM=;
 b=bCl6ncrZrggjoc/w+EHHf++IeX07tyf8n8JtpqjmZFfnSCNj4h0Cdnk9pfhhsSVBln4affM9oADC9MQTsJh1pT32tcXbpl6FZJh+hrfG13DgWCiNiV5J1Al0gvPaWS7XGOG92tzCbN6zxmjDTc3O0iu29itDpiT1/aaXmMkvM3luRquF6HL9LOJ5xb7UK090C+gNCQDrF/oW5eMKD8ZunvpQQX08zn8MvEIcM7hPFkX7ofaMSJJjnHQoFy4I0NAN1Uarp8fEDyjwahhSk4oINSYixdDkD8w5r369kP9sG3JTYF+UixCT7cUOumDRL5LZZ7u6IJ4m7l8HbfrJ+O1vNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2 1/3] x86/IOMMU: mark IOMMU / intremap not in use when
 ACPI tables are missing
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
References: <09137aa2-649f-08fb-ba68-75f8eb16fc63@suse.com>
 <efe34081-c813-0e37-175c-8553b395e6d9@suse.com>
Message-ID: <ffe7f130-9034-50d0-ab0a-06933dde88d8@suse.com>
Date: Fri, 22 Oct 2021 07:59:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <efe34081-c813-0e37-175c-8553b395e6d9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0284.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c025cbe-455e-4d87-001a-08d9952118fe
X-MS-TrafficTypeDiagnostic: VI1PR04MB4351:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4351334789CB5B7ABE6CBA27B3809@VI1PR04MB4351.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CNaEhsv4OolMTj9KrGty/W98PnHdJ27HfAIcVcRPZXJTZ+1b7xcvC5t7MN4rsHS1LLEluXr/Zto7+TfgPqR+ZSu9h7zV0vUS6dXUlnq0/m4XTHmXpIDnl7irqFF7D7lo75pFuXOkDzYdo/kP6LCYV5CtNEbFELgNBI4/JlKIqSRFW7bfyQD5d2JmpqsfkFe2UGwwoe8mbEOQECsQfh9y9HKfeGGLhjUdcmg8GsqPfHfcPQIRUOv97V2HdW52MIxongL1fXL0LA6/8efgTLv6iC+hhyk2HQkzbdwJEu7TK1gLI6fn7VQiwfKXSy+5Jh1LGML6r25Yjd6KhCBXBnFnpGAI/scILuIU6fmlJw9mhs1J9wpQVFlo0jju7wtIKuBR5LdIXNaMr4eciB04sBf8zP8at5DwGjXUM9VesJ+PKx/wt9jOzWwH+hjainmto5+mfzD/Z3Yjlss8xw2cBnvPcxbceRPOxqBZdfo73IiAsARvNh3B1JJVc8eJs7x/AweM3BkTFi4oSZX40e2UkIyP8249EImCDHP+KidcddfW+ysKaeY7p1POPuVxpTMnDKPTod/Ay1FGiVPG4yGkbboMzpm0jKk/yi/RJlnQ3Sf86CXXbQ4mTpRi8xXcme9DyZjcDytoYz4udq0xe0JSwRv5VuZhKa/csXfLsFJ87sqiU5f1yXDk7JRjFlYp1+tdqepAqdlPMgYy5eZt0YQqzOWo8rtfm7V6qIvzdQBsj/dI/+o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(6486002)(53546011)(66476007)(66556008)(66946007)(54906003)(38100700002)(508600001)(956004)(4326008)(2616005)(186003)(5660300002)(2906002)(316002)(16576012)(86362001)(83380400001)(36756003)(31686004)(6916009)(31696002)(8676002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0lKa1BSeUJPMTB2dXZJSkluKzNPY05BK3dlMmw3bWRZNEZXTHhLdHYvSDh5?=
 =?utf-8?B?ejZHTFg4UzRQSVpERzBwMDRTK0JaanFuSzVuUXE3cXBxWmVCeitmU3lkSk9O?=
 =?utf-8?B?WFJpN0M5L3BmOTlvbWlHcjBYNHRNdGtGOHV5RUNlOHlpZUl6S0NNbUU2L3hF?=
 =?utf-8?B?YXJCRHdrMysvYU55OEpkWU5uOFhTK1hJRVNxTURKNlJGUXRsUlJ4MjNnQ2ZN?=
 =?utf-8?B?eVJQUXQ3SUpiMzVKOWFVL3EyUU41amtkZExuZGRnV0hHejZBTmhHSURma2FN?=
 =?utf-8?B?SzlkV2NHc2JRbjM3RXV0RktjaXFjUXJhK3V6cjBuMlhjUVpuMWFWcm8zZTMr?=
 =?utf-8?B?Qk9rbm9vUnVlejlTTnlaaWlFcGRZZS8wM3FNd2ZsZ1dsNGdZSUU1eUd4ckJk?=
 =?utf-8?B?bE12eGpZWk9sVlMwcnB1TUpRNTNiejNhSG1KTjBxSy9GLzVDcUJQenR3Nk5F?=
 =?utf-8?B?TmJReWJlZGh4YVBHVUNxSzZ5WGN6L0M1ZHE1czVKMHRKeWhWcDAyVSs4Q3VO?=
 =?utf-8?B?ZFJGS3BhN2tna25OVHRjU0FQdUFsMncvN1l2NXFzTmJLcC9neEN1UzBYRjIz?=
 =?utf-8?B?c2s4VHl5TlRzcWVHc2MyN0UxeGlXcHBsclpYUEVMWDhqT0ZTajNSVk05OUw4?=
 =?utf-8?B?ZEthSWdqQ2NOekN3ZmhPeWZOOTZ3MTV2ZE1ONE1CRzNhZzIvZ1ZRd2dzTTBS?=
 =?utf-8?B?NVRSa1QweXFNUDZRcDRWK0FSd05GNDgzK2x2eW5ZdlN6R0tNemFjU2VmTmxs?=
 =?utf-8?B?cTkxN2lQcjN0OEk0RWpySGgxaXNxNktDVUZpNFJIRWRvTW5Sb2pWWktpZ3lC?=
 =?utf-8?B?RTNLZm03elR5aWRLVzVVVWFCWHNTc01rTkZHZ3UzTlk3OGpIMHl0TFFIOW4x?=
 =?utf-8?B?emV5dHpNaCsrbWVha3FNcE1Jd0lwMzBkcTIrQktlU0I4bEJiek0zd25KY2pD?=
 =?utf-8?B?RHM4M1A5MGJYQkpRc0xIY0Izc3JWKzRKcGhhUjk1L1RKZFpvdVVKUVJubCtn?=
 =?utf-8?B?NDRmazNWdGVZWWZPaDBnd1hFYnBqWWZyMkNXRHNHcHYvTGI4c1lJVEQzdEFL?=
 =?utf-8?B?aTJ3UmRVUy9hUmw5UmszcENLTm9LckRVUC82YUxLMlFvMUtVZ1BYNXhQRmlv?=
 =?utf-8?B?R2pxVkt2TjNTaFF1T0hEVVpGRy9rNnZlajNvTTlaR1cxMGN5TzBnaXZVZ1ZE?=
 =?utf-8?B?a0xweVdJaUdkN1NBRWZPTzNZbE51ZzZFK2U3WmFJQU8zOUdlVDViSFQyTk01?=
 =?utf-8?B?cXNUT2dseFRxWVBVSExzcFY2cVNtblpkT3JSVEVLREVBOEhtTWlxWVNLL3Fa?=
 =?utf-8?B?SGw3d1RsaGk0ZTMrVVcrdkd5NC90N3pyZnNqTEFMcE9QS3FjWUp0UWxjbUhk?=
 =?utf-8?B?WWFFaFNrK0ZOTDFtTGsxODJGcGpNbVhNTVRGRFhsbXlham5XcElDVE50d05E?=
 =?utf-8?B?V09NeDIvdVkybGlJTWo2YUpFNEpCb3ZreDF6bzdGbDc4WUE4c2hTaklza1lt?=
 =?utf-8?B?QWJ0cVFwNG1Nc28wMGRIT3I4bFM0N1FVSjByM3h6eUIxak00elVta2tLTDZR?=
 =?utf-8?B?ejdNUWRoMm5yL1ZwMk9aeTZSQ2U0ZWluTDJWYnFnYXpqUUdmMk5YYVhxa0xU?=
 =?utf-8?B?SEg4UlNab3ZqUDZhM0c4aFdFN053aExIQTlkQkpTNGhLSHdvRXY1VzJEMXYx?=
 =?utf-8?B?cXozVDBQWTcrSVQ2N1JENUZ0eTJjbk9GRDZSTUNEaWVWNXp5M2VCbEkrc3lH?=
 =?utf-8?B?Ym92ZSticUwzYUkrQWJ2R1JFbTRkejZ4UDlRVkcyYVJlSlRjWHV0WDdXbVhT?=
 =?utf-8?B?dUxOcWloSTZGY3JKajkvdTdYc3FLOHRBVWpFdFN3dC9QSHVhanBuM0tJdlo3?=
 =?utf-8?B?SUJtSkZocmRkMk84ZHFTeDZFdkpZUW1UV1p3S2ErRHM2ZkhHcE01TzhYc1hF?=
 =?utf-8?Q?PPd07rwSt5s=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c025cbe-455e-4d87-001a-08d9952118fe
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 05:59:23.7443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4351

On 21.10.2021 11:58, Jan Beulich wrote:
> x2apic_bsp_setup() gets called ahead of iommu_setup(), and since x2APIC
> mode (physical vs clustered) depends on iommu_intremap, that variable
> needs to be set to off as soon as we know we can't / won't enable
> interrupt remapping, i.e. in particular when parsing of the respective
> ACPI tables failed. Move the turning off of iommu_intremap from AMD
> specific code into acpi_iommu_init(), accompanying it by clearing of
> iommu_enable.
> 
> Take the opportunity and also fully skip ACPI table parsing logic on
> VT-d when both "iommu=off" and "iommu=no-intremap" are in effect anyway,
> like was already the case for AMD.
> 
> The tag below only references the commit uncovering a pre-existing
> anomaly.
> 
> Fixes: d8bd82327b0f ("AMD/IOMMU: obtain IVHD type to use earlier")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Ouch, forgot to Cc Kevin; now added.

Jan

> ---
> While the change here deals with apic_x2apic_probe() as called from
> x2apic_bsp_setup(), the check_x2apic_preenabled() path looks to be
> similarly affected. That call occurs before acpi_boot_init(), which is
> what calls acpi_iommu_init(). The ordering in setup.c is in part
> relatively fragile, which is why for the moment I'm still hesitant to
> move the generic_apic_probe() call down. Plus I don't have easy access
> to a suitable system to test this case. Thoughts?
> ---
> v2: Treat iommu_enable and iommu_intremap as separate options.
> 
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -183,9 +183,6 @@ int __init acpi_ivrs_init(void)
>  {
>      int rc;
>  
> -    if ( !iommu_enable && !iommu_intremap )
> -        return 0;
> -
>      rc = amd_iommu_get_supported_ivhd_type();
>      if ( rc < 0 )
>          return rc;
> @@ -193,10 +190,7 @@ int __init acpi_ivrs_init(void)
>      ivhd_type = rc;
>  
>      if ( (amd_iommu_detect_acpi() !=0) || (iommu_found() == 0) )
> -    {
> -        iommu_intremap = iommu_intremap_off;
>          return -ENODEV;
> -    }
>  
>      iommu_init_ops = &_iommu_init_ops;
>  
> --- a/xen/drivers/passthrough/vtd/dmar.c
> +++ b/xen/drivers/passthrough/vtd/dmar.c
> @@ -777,11 +777,7 @@ static int __init acpi_parse_dmar(struct
>      dmar = (struct acpi_table_dmar *)table;
>      dmar_flags = dmar->flags;
>  
> -    if ( !iommu_enable && !iommu_intremap )
> -    {
> -        ret = -EINVAL;
> -        goto out;
> -    }
> +    ASSERT(iommu_enable || iommu_intremap);
>  
>      if ( !dmar->width )
>      {
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -41,6 +41,24 @@ enum iommu_intremap __read_mostly iommu_
>  bool __read_mostly iommu_intpost;
>  #endif
>  
> +void __init acpi_iommu_init(void)
> +{
> +    int ret;
> +
> +    if ( !iommu_enable && !iommu_intremap )
> +        return;
> +
> +    ret = acpi_dmar_init();
> +    if ( ret == -ENODEV )
> +        ret = acpi_ivrs_init();
> +
> +    if ( ret )
> +    {
> +        iommu_enable = false;
> +        iommu_intremap = iommu_intremap_off;
> +    }
> +}
> +
>  int __init iommu_hardware_setup(void)
>  {
>      struct IO_APIC_route_entry **ioapic_entries = NULL;
> --- a/xen/include/asm-x86/acpi.h
> +++ b/xen/include/asm-x86/acpi.h
> @@ -141,16 +141,10 @@ extern u32 x86_acpiid_to_apicid[];
>  extern u32 pmtmr_ioport;
>  extern unsigned int pmtmr_width;
>  
> +void acpi_iommu_init(void);
>  int acpi_dmar_init(void);
>  int acpi_ivrs_init(void);
>  
> -static inline int acpi_iommu_init(void)
> -{
> -    int ret = acpi_dmar_init();
> -
> -    return ret == -ENODEV ? acpi_ivrs_init() : ret;
> -}
> -
>  void acpi_mmcfg_init(void);
>  
>  /* Incremented whenever we transition through S3. Value is 1 during boot. */
> 
> 


