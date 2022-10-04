Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 484D85F4732
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 18:12:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415727.660368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofkWT-0000tH-Nu; Tue, 04 Oct 2022 16:11:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415727.660368; Tue, 04 Oct 2022 16:11:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofkWT-0000rH-L1; Tue, 04 Oct 2022 16:11:57 +0000
Received: by outflank-mailman (input) for mailman id 415727;
 Tue, 04 Oct 2022 16:11:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ofkWR-0000rA-SH
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 16:11:55 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130041.outbound.protection.outlook.com [40.107.13.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4365535f-43ff-11ed-964a-05401a9f4f97;
 Tue, 04 Oct 2022 18:11:54 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6819.eurprd04.prod.outlook.com (2603:10a6:208:17f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Tue, 4 Oct
 2022 16:11:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 16:11:52 +0000
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
X-Inumbo-ID: 4365535f-43ff-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLmqLkfk+MapJ/Vj+Zi4bkmvL25su9BdVGXYio+CA92EkE7AnZKHMms9geUnuEA/OGjvbbIsYd4qS8yY+nL6CoiqtYAY5bo5tDXVCrFExK9cmsc5+nm61yUm00VcU25Aoc4sosjasLwssHCce2OLqq+mQkXb/qSvpnsuZKoI1RYKGdyTrGW5Xmtv+QkJbc8wsVq0A4lvjnOCuw28gY81se3A+C/zNtvLgxe6FqEY/GBf/uKlT3Uen4oO+emPZGQCYziEhKLMWrK+YdhFkmgkpToubctchtoGQqy8S2XuKlaBZG1OfVecDdm1qaquYz7EmDaEVi1QW00qn7YKmyaKJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AvDyXkdzxCHMIcssQk9076u0oKSMQyTWQCeWMhfe2ec=;
 b=SeuwvB/21iGCx6Dnqe3FdgPrfCEU1kfyvLeKVfGvPlKfh3asQq+Fka4Tew9ajX7gspuo5LV23NDFhzPHjPH/AfMGs4T2+at3yrPPFldj2Q8Va9aeu+R9DLwjCxRhuSfI0d5RWmoDIyDkZ9Igwm0DK5v6o0u6ozbeAO1Tp1+tOLCnjdleVrxhM4JEmrV9l1xhaKbpShoyjYc5K8hWFjyC38w3PYHWJ4aQz7SGOo1O13g64LBg+3ukqu0c4ZQYYInzfYTZmMebkJR0NiZ3YMy23gn75n5Cl3ZTddXfh+hysNLZO2da/R9esOW+cejQ6SNt4jXZbyBOWTLSZUoLQLLJiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AvDyXkdzxCHMIcssQk9076u0oKSMQyTWQCeWMhfe2ec=;
 b=eo8MmtCgBFkuaCNxmEFdQPkEYtop+VU/hI8JfIk2Ebl5n7F7h2TwxBSlCUgt54lR/S7tcw86AUcuft8DYF6TE8yWguvXSlwplolQFCq+XEBbQiv/JcqVqqi6rig710gx/s/7YqFMhws99sU2ZgrspCnCJBr4xqXzOEM5PN2urH4hpOpuTeD5Cey+bzEvYYed1wNAB/Kdo1Qg2tsnm2kgKxvuPUzdTJXiTcapaoK09yc7Hpi13tKVDokgshYgxA35tQdpwZ83a64g6Be3pFKP98EvCZIkwe07kyljXtE8S7Q7VPZMnpQvJhn12sxrZZD02KjGLAcudIRoTLvhu2D5NA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4c1ce9fc-7501-89c9-f66a-9b6671d98302@suse.com>
Date: Tue, 4 Oct 2022 18:11:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH for-4.17] x86/pci: allow BARs to be positioned on e820
 reserved regions
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221004153645.3686-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221004153645.3686-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6819:EE_
X-MS-Office365-Filtering-Correlation-Id: d43b0dbf-1859-4444-f5f1-08daa6232698
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	coMOT3DFSgxrSbALMxB+V7/Q/h624RQgAaEL1xZW4yfUtYLUpZtWY+We4C0On6mGbKn4s94UpTUybJTD3WkI/nCFI+Wo56eS5wgjWooMu2V2HpxmF7M0VML7z6oSL+ppU/ny79r5s7m9iAvgfD2yzg34WNIoEn2gIS0SPGk18jFVdGvoRM8X+5umjIMIK8e0FumTm69t2n9mCqvySwC4YpCyOXe8zRfgp9kyFzOy2U9bmnseWhfPeN/ZajNV4jLhCQyWa/Lc0FEHQaRt5R2cNSPLj+OLW1nuzLDlpGx5nzfZcrBLATRPPKgHbUn2aIFRFUVcLt0/pXvmKdFHRb+ToFY0sfnGt9R6jah3OeIEzFpBfUl28lsB07wIjwlU7cylLz9w2GA7lOfecQVcJELCZLGB4B7x5KFa20Ts6m1OZGDmbC72RJwplvYP3VjpIcIuTafVi/LkLU5qhACb2Obe/T8pGdHW7zNzNCvvB8BjcTwmgp+az8Dhiuhm0mS4SN+9sjxiIMz1ULAqBsHq40ESZH9H1/1NPNfjB7uePdVtABcnsYAn5kLwhIykR2t0ofhAXGrjPUWpwzFTP+7qzHJIfoh4+Pbi5x1CX62AWAxQ2OnxjJh+psvvpN9E1zZUNnaGkDKaZ6R7lOWKVxJqmZcc7aFnqkvVqH8vqOwjqWauBm4yyFyoGP3pBAhGINsDMOaEkRcTUe6A0h7GVGFiNadqR69meQlyqCnx6tMwexaSGem/ajPvY0caK4s4GcEoenTZIsHRyofvhpNJEGuENgZAsRlfnyCk8+fL4nCDU2+5VgU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(136003)(39860400002)(376002)(366004)(451199015)(6916009)(316002)(54906003)(66946007)(6486002)(66476007)(66556008)(5660300002)(8936002)(36756003)(478600001)(8676002)(38100700002)(41300700001)(4326008)(83380400001)(6506007)(53546011)(86362001)(186003)(31696002)(6512007)(2616005)(26005)(31686004)(2906002)(66899015)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1lybCtIcGJSdm9JNnFWL1IrWEwzaGN1dlYvN1lHd0NyY28xM0N2cUJpeVdk?=
 =?utf-8?B?cDNrUExRTFNnVG5LTnY0eG5vNmhTMi9OZGlPNjBTeVk1d3dGNlFUeUwxTmhI?=
 =?utf-8?B?d2tSM0NQL3VGdEZ3Y2RJU3pvK1JlQmZnNnliR0tUTStTWUlRWWd2UHc2Sy82?=
 =?utf-8?B?Qk80dzhMdHExSDNhTVk3ZGNJMnI2ZnJ3dGUvUzZHQlcrdVBNSTR6VUtwWUx5?=
 =?utf-8?B?a2V5ZlFZcDJBbnZ3b3QxWTg5M3B4R3lDSHpzQVQwWkxaVFovN1EwbjhjNEZa?=
 =?utf-8?B?Y1RpSEp5eGNlejFXck9XdWNsVnFtcXIxaGlTWVoxVWxhSEFMUDR5RThzdGRa?=
 =?utf-8?B?SklaWm0rU1pWY1lwT2l2QmlaczNUeGc0Vk1KdlZNUkJDdFZQd1M3SzZ3WEZt?=
 =?utf-8?B?SitzV3Z2cm9sRzJ6Z01VVXVMSmEyRzFaRW5VUVE3MU4zclJFTmdXZC9IcmpO?=
 =?utf-8?B?T05tcUFHSVB5SnhkZkt4N2Z6UGFMclMydnRHenYyWHl5aVVpcjRvZ1drdzdO?=
 =?utf-8?B?Znh3aUtmTSthWmNRbGZvS1l3ZlgrWUhmYWxhRkVMYXhuRjM0SVZJOG5WeDB6?=
 =?utf-8?B?SmZ6RElCejlWN3lsaWJiQmtHUnI2cW9QS0h1Mlk1dWtVMllMSXpqemhtSGVx?=
 =?utf-8?B?bHVWTTA2VXltOFVzRUF2SC9RNCswUFNQY2RiL01LbXZhZHRiNFdHN0lpM0hk?=
 =?utf-8?B?WnJVeVJrZTBNNCtUOVArVkxndlBRWTg3ZklGRmhwalZlTlVUQXFiRTZzenNL?=
 =?utf-8?B?ckVFTDkrQTB6aXFpazlqckgzYlZTTGNxRHhHaDlVNVR6Q3dOUFR3ZWlUd2Rx?=
 =?utf-8?B?d3hqSWNiQXFhMDZNSzh3WFZJcnJodkpQMFEzS1JON1dSOGVPNjJ5eUhhdlpS?=
 =?utf-8?B?bEFNU1ZXejRDREVUOGI4b0tWU1FBSjN1MWllSlhzYThHQklGNFJUVTUwRjFo?=
 =?utf-8?B?Mi9uQWllb0p1UXkxaTZFQlh4RWRwSGU4U1BhZW4vTmVtNk1Ndkovc2k3dFJS?=
 =?utf-8?B?N0M4akoybkt0TzJmeTVid21tLzNycDd4UjY5cTVscCtFQXg1S2g2ak9pMUpO?=
 =?utf-8?B?SWFxSzV3eDRaMEtJTnkvMXQ2ZHhramR1Ymw2dGlPQ0hYWGRSZTlOY1g3SFVH?=
 =?utf-8?B?b0dhdUxla1VwZHh6OUM0SFZDcUE1VGkvcTdobXMxT2JoME9XRFVNUkRabVlE?=
 =?utf-8?B?cHNYelAvdk1WQkg4RmJRVWZVYTBCem5BcmREZUtTUEtRbERlY3ZydWIzZWlR?=
 =?utf-8?B?ZFo0NTJIR3NVZU1zNXVaRDhqVkRLTmc3Q3pEOE81K29SN2Z4bmpnL21XcWZQ?=
 =?utf-8?B?VFcxWktzU2YzVmRlOGVoZjlKMjhLdTh5ZlBiYk1kS2JjSmVTWDFQZWt0RVlL?=
 =?utf-8?B?aG5ibzB6cmd6b3VrMm1jdm5oVHFKMWxwTWhSQmhBSms4RnViSUNibW8zM2pG?=
 =?utf-8?B?U1Q3SDlORW05aFdMTWtRVUJjR1Y3Y08yeUdCYjhqS2RCY0FCWnZCYi9tYndY?=
 =?utf-8?B?NHZQSTcwdzJoWUp2M2NhWDdVZ3Uvcnpqc3IyVkRYclRlS2FqNTZOaHVIem81?=
 =?utf-8?B?Y1l2cHZMaWFUd3k0N1AwSFQvelJBRHlEYTJJYlBMdmRnazdLbXlUSUV4UVlu?=
 =?utf-8?B?Vmg5eWpRTXZMZnp5QkJPbTJMdCtRQlM3V3NIZ0lCdGhHVWNsK3dvS2R1YW94?=
 =?utf-8?B?V0pkRUZwOUZqcWZOQlE3SFI4UStQYXR6VFhEMTlmdGZCeEU0OHdFVWxTM3cx?=
 =?utf-8?B?STI3b2xDR0l3Y0xNam1tS0ZXMnpiSHJqa09rbDNyUjgvUlJKTzNJTklYNHBr?=
 =?utf-8?B?OC9paDExZGR5RmFrUDBSbW43RWFCUUpRekhJKzlMckZYY3llaUEvL0NUcDM0?=
 =?utf-8?B?aDAxRE8vYk1HR1BOaUdLVXhRZk5Wd1VJUDBOSjRiU3F1SExkemVhZ3U1R1ls?=
 =?utf-8?B?V2JMUnRYV2QyY3hZY1ZmYlNUcDl1U3owNkdKZFBDbTJDNFVBWklXSksxQW1Q?=
 =?utf-8?B?Z0cxN3FTUDlsU3l1Z3NLM3lwcTZDSE0vWUJjU2Z6Q2ZSVzhmdXNTVEtySDVS?=
 =?utf-8?B?cDgrR2tuNjFreTJZcmFvQ0RFaXZROWt6dTdVN0JOenpSUWt2M0JVei9pY3N0?=
 =?utf-8?Q?4fFNzU1+iB7IVpQLmOFfUQKX9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d43b0dbf-1859-4444-f5f1-08daa6232698
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 16:11:52.9064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wx3PwDqmGHz2/XuMiUm2A+Mn70BAwdA8Ko6iDVLddKdbI2taMknrw2WpZ+tW1cUYtY1ViEWlSmf3rNGHj5a10g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6819

On 04.10.2022 17:36, Roger Pau Monne wrote:
> The EFI memory map contains two memory types (EfiMemoryMappedIO and
> EfiMemoryMappedIOPortSpace) used to describe IO memory areas used by
> EFI firmware.
> 
> The current parsing of the EFI memory map is translating
> EfiMemoryMappedIO to E820_RESERVED on x86.  This causes issues on some
> boxes as the firmware is relying on using those regions to position
> the BARs of devices being used (possibly during runtime) for the
> firmware.
> 
> Xen will disable memory decoding on any device that has BARs
> positioned over any regions on the e820 memory map, hence the firmware
> will malfunction after Xen turning off memory decoding for the
> device(s) that have BARs mapped in EfiMemoryMappedIO regions.
> 
> The system under which this was observed has:
> 
> EFI memory map:
> [...]
>  00000fd000000-00000fe7fffff type=11 attr=800000000000100d
> [...]
> 0000:00:1f.5 disabled: BAR [0xfe010, 0xfe010] overlaps with memory map
> 
> The device behind this BAR is:
> 
> 00:1f.5 Serial bus controller [0c80]: Intel Corporation Lewisburg SPI Controller (rev 09)
> 	Subsystem: Super Micro Computer Inc Device 091c
> 	Flags: fast devsel
> 	Memory at fe010000 (32-bit, non-prefetchable) [size=4K]well
> 
> For the record, the symptom observed in that machine was a hard freeze
> when attempting to set an EFI variable (XEN_EFI_set_variable).
> 
> Fix by allowing BARs of PCI devices to be positioned over reserved
> memory regions, but print a warning message about such overlap.

Somewhat hesitantly I might ack this change, but I'd like to give
others (Andrew in particular) some time to voice their views. As
said during the earlier discussion - I think we're relaxing things
too much by going this route.

> --- a/xen/arch/x86/pci.c
> +++ b/xen/arch/x86/pci.c
> @@ -98,3 +98,30 @@ int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
>  
>      return rc;
>  }
> +
> +bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
> +{
> +    unsigned long mfn;
> +
> +    /*
> +     * Check if BAR is not overlapping with any memory region defined
> +     * in the memory map.
> +     */
> +    if ( is_memory_hole(start, end) )
> +        return true;
> +
> +    /*
> +     * Also allow BARs placed on reserved regions in order to deal with EFI
> +     * firmware using EfiMemoryMappedIO regions to place the BARs of devices
> +     * that can be used during runtime.  But print a warning when doing so.
> +     */
> +    for ( mfn = mfn_x(start); mfn <= mfn_x(end); mfn++ )
> +        if ( !page_is_ram_type(mfn, RAM_TYPE_RESERVED) )
> +            return false;

We don't need to be arch-independent here and hence instead of this
(potentially long) loop can't we use a single call to e820_all_mapped()?

Jan

