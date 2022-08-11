Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D15958FD5C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 15:27:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384613.620022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM8DG-00078z-OK; Thu, 11 Aug 2022 13:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384613.620022; Thu, 11 Aug 2022 13:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM8DG-00076F-Jp; Thu, 11 Aug 2022 13:27:02 +0000
Received: by outflank-mailman (input) for mailman id 384613;
 Thu, 11 Aug 2022 13:27:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WeOc=YP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oM8DE-000769-VS
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 13:27:00 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2073.outbound.protection.outlook.com [40.107.20.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47440fab-1979-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 15:27:00 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0401MB2681.eurprd04.prod.outlook.com (2603:10a6:3:87::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 11 Aug
 2022 13:26:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 11 Aug 2022
 13:26:56 +0000
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
X-Inumbo-ID: 47440fab-1979-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9VoU9NJL9zZpsbI6xjOPpBCCZ+YZhi7ANaTg461YP+y+Z98GnsxFIKKdJVUQLzn0/IOjSo9R6cL3XtDP3ibGb3Eva77NDi3hKyv+F7g81bCD0Qsur+rT/ECsyR49nH4/0fMHz43JZqP9A/wYFwwb2+nLFm3LRGNiHiC8HS4h0Hzka/qiWPzayXW22lM1hZaLDCTFBOQlH0wmXfhylGnlFOHMUypm37mZmwlzCfHjjXe3C4sXPMaTNNpicyB1GMxE0kwUVvyXYoWNX/tQeWmC4OxxTix9g0LRflU1s6k7GT7SUSYRbemVTc6bvYs78LX4jvMjCZTX1nFpVzJv34mqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZcPGgeiH61EGCv6EwTUFJqLvVZ7xjcfLcZdbsm1rik=;
 b=lpLTjWog1yYp0Ke27773rkLxy5gR6+c33Ob/G2bW7/0duW/k1yt/R+Wnur8h1ZEawSXWfRVPh94IeZeAgMXVkdhDxyB0qOxKH5RbxpAkJ2UCErQiCHx4ihBc8+rD1Zf0eKK9uk5Gju/0Dv9L824JwYJI3z2afU8bDpDAZRJmejeOFFAojo2+Tl0CabLeD4pc+4VR0Kn8L5kkFQUq3hLsB9mumbnaS64zp2dFOQyMZvq+by71ROUr7CiqJ9rYdWccjKNT6NRq9OQQnzhVITLQg+vGeYYoe3Idj8LKYxRO2Z34sVp2m3vMfSa5h82Z9zvXRJQJ7w9mqbY6xtle+zc7vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZcPGgeiH61EGCv6EwTUFJqLvVZ7xjcfLcZdbsm1rik=;
 b=bwtvc2f4BlOhbcPQX5nxNtt3ioXMWo1ONXGSQEJnx72C3KvBCYN1R3Da+xSX9BFKC6brauACBH0Cd0KVm0oHw4n8UYgo0kY0Fte16R4D4UHGE9/dJc2H4aJs4CSapSTYSHy1Tcz5Pc5mbOXjRipluxkC43mH/M2qGefay5GI5bLFBBWt+amWdafxwER0iSmfx4KxFUy88rb11T/BUnAWlsZuEdolsJksXgsZSEXd1i2OvWqilGbTq+j9t40dw2WKoM8+PfjpfiSvnzv5Ep406sfKfuptyZSdgYfDmCmGgRsJOJ7iFT3HxzFN19j744ZwtIjMc+5cPuJZ1EzgXwTtZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2ab93940-89c3-1316-a1a4-22daa09f96fd@suse.com>
Date: Thu, 11 Aug 2022 15:26:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/3] PCI: fold pci_get_pdev{,_by_domain}()
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 Rahul Singh <Rahul.Singh@arm.com>, George Dunlap <George.Dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5379b4bb-76c9-d7be-4bd7-2f75dde470a8@suse.com>
 <0bdd4f3f-965a-fe39-f7af-d8a40b7a68c6@suse.com>
 <48eee228-f7fa-5932-ac93-03cf70de01e8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <48eee228-f7fa-5932-ac93-03cf70de01e8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR07CA0043.eurprd07.prod.outlook.com
 (2603:10a6:20b:46b::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c026fede-6db3-429a-584b-08da7b9d29b2
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2681:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	grZCsScTjm+65SMl2byUM70xgIj2shsPSsyuN5OD1eM11Xd3WftgykwOuC5SBnIgDg+dgZJYzh7nfcPGdLiqyh2IRfkn/XxLCILeT3LZVSb448VKL08yYAdKTBr59OuEFl+7B6zAy5cxQtbebWif3uKBw5avbL+NwG3LwlUVl2Rv4t4Zpqe6NmCN9/NELG5YSfBvTdTnYtOcqqbiGeirbOCQ5CE5OFBr2Xp+DC8/0DR2V+ragFU7GiYERBiGC5ImkyiwPflzLnFVZvY9hGgsXG8F5K4aMacKQvsohgK2YpQEH9G4cvx/MJjKzelS5xWnx/MBQ0Dhz7oNxGpf3SLMjJIS+i3nCZv+s3akmEuu3Dv8nRTPlxGgJJ9goMphfG9qMrl0ZbPuoYtK8nYecbVv+1WNCSqQqF2/3UtxGrG08cHVkq3IcA4hdDXCrJKIZACBs7lNGF6ZZwu99QTCB7guEFV7CmA6v+RbQJFLDRgAbCgbXb4ZYN7BWvkUK79pg7YQ+Zla5E7FD+A2fCc5S+2oT08z8BuzuB5kyQAzZ71BnVEj3Oa2v5L5/YTE7Cxf7AMXHcyp9jLhlPXPVeECloWF0xJFDP4JB4nRzQ1r8of/gL/cytD8HgPLLeFLIycfiGbC8+fFc4n2aMVGz8SwqInbnYYaweilufjGoGI0lXH6TQSyxRYQeDy/PQoS6YkKmgYA/r5CHPvravAQCtHeJpxnIMpxpVE9Fq+/Z3mkmWX9KVXus+ftCwcMhry+13ExA+i18YUhd/LMx68v/tSbcBUDZO/TB+1a1+BdmiHIKDMyYc0/NjEzAMQX2UWtB6oKdmygvW6QjldtCdxiWFufir7adA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(346002)(376002)(136003)(39860400002)(186003)(2616005)(38100700002)(478600001)(6486002)(54906003)(41300700001)(316002)(6916009)(5660300002)(8676002)(2906002)(26005)(6512007)(66476007)(66946007)(8936002)(53546011)(66556008)(4326008)(6506007)(31686004)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aU9IMDRvQzFudDRFQkxaWHRjNEdXYjFnazg5cjJyS0RGQ1JncjUxL1BvOUhH?=
 =?utf-8?B?N3hjbStDNnYySlEweGtRbE5WMWxoQnhrd0JYRms1WDFZMUVGSjNhM1ZWY0JG?=
 =?utf-8?B?dHV0dWZGTEV2UVJtZFpnN0FQM1dsTHd6Ymd0d0lVNFd2QjRnZ29KcDJyOWVw?=
 =?utf-8?B?UzR0T1VMazg5cU81eGpScXpNSUhab1BXaFlMY0hJeC9oeVVrVWxCcFRyUHhZ?=
 =?utf-8?B?NUY2S2NkTDA4Skk0QnhsWCtLaHRmQy9FSFZ6VlhsYXJvU2JpTHZRTEVmUTEv?=
 =?utf-8?B?Nm9lS3QvTkR6SVBvS08rT2tLejczVjBBZXRnNSsvdlpPUktPcHZ0OHQyTmhu?=
 =?utf-8?B?bDVQSnBZRU94MEN3SWcvaWJuQjBOcXFzaTY4ekU4L3ZyQVhUMmtERDNTRHFv?=
 =?utf-8?B?OTNnNjBsN1FpcVp5eGNHWUtFZVExVWNPcHlpKytWRkZhSndVbHhBWG1OQ21U?=
 =?utf-8?B?U0dYSmswaXZBeW5reWtmR09QM1hVQUVRS09YazZkVVFobStYQkNiaDI0OFQr?=
 =?utf-8?B?ZEhhMEc0NXBFOGJyVTkzbkN1Skp0dHRFTWk5NldZdnhvN2ErNW9vQTA2emQr?=
 =?utf-8?B?bXZPb3FZcGFTMjRodUpKRUkxdVBHdDAxSXhaam9YcU8wVjllbUdHNU9ZZ0N4?=
 =?utf-8?B?c2ZJZzVCWFBnQU9McDRqendPbGZENWhTN05sUjBVdTV5WGJKeHZkakpxaVdU?=
 =?utf-8?B?WGVPeC9XMlNLMXA2Z1VxVTJwQ0tYdXdwZVM5NTJuNDQvazJtSmtjMHFjQTVt?=
 =?utf-8?B?TnRiRTZDNVRxMEY5TURzY3FraERsSjdpenkwelB6Wjg1V2xDOXpXZ0RNaXNo?=
 =?utf-8?B?QlNNeTZadUxYUWJMdW1EbFdLUUtCQk94ZmVCVER3eTVReWpTeHoxQTNrd1Fu?=
 =?utf-8?B?QlJmdVl1SG1WbUNCTERvVWFqNTFUZndjZzZOMHhZRDdUR1p6VFVxWW45OHll?=
 =?utf-8?B?K1l1QjlRWGZPM1lPbzA3TTI3bmxtZEZISUZDR3JQdmhxOTlLVXE5aTl4NnQz?=
 =?utf-8?B?Yk9TNnByZ1VPUDFZbituMjdMM0ZMcWthUVdSZGE4Uy8wK1BVeGVuK1phTitn?=
 =?utf-8?B?Y0pwZlc5M0ZzUThkU1FoN1F2elVVSGFPUmVTTWhJT1JpTXYxZ0xpMUo0bEJ6?=
 =?utf-8?B?UG00c0RVZmRjYTNkZXBkUk4vcGNnS1lBTTlyclg0TVBCZUNveEdaOXFTK2hz?=
 =?utf-8?B?MXZmQmQzQ3FJVE5veVlFaktKaG9HVzdqQW5Nd25Oa1NubWhScXVKMGkxTEFo?=
 =?utf-8?B?MXlXT01PejNzYm04eC9UTkN5cDd6OTNYV01vSzBKN1c3K0Y0TkZpZUR1SDFw?=
 =?utf-8?B?eGUrcHZrclE0cFRKWVoxTTVWQVlJbkdVMWZuL3pPaDU4aXdZM1VnNmVtemk5?=
 =?utf-8?B?Z2R2TU5yNGh2UzV1MndwTXdmT1p1T0Nkb1FwTENmVUtaNkRqNXhnWGVNWE1U?=
 =?utf-8?B?dUg4V0NCM3R1Wm9YWjZIejg3VzcwY2s0SzVXZ2s0Sy9XNzhWRGh4UGduaXYr?=
 =?utf-8?B?eWdzTjQ5WGUvU052eXFYUC9tNzdGZ3R1bmJhMlJTUkFvVnA1Sjk0cHcvbFIz?=
 =?utf-8?B?MVNLelFEWUl1ZTZiVHhXanVhZjFQMWhZTjlmUUE3dmVnZkxnWUhtVWZ2ZWo5?=
 =?utf-8?B?VkRJUUhvbVorcTk4R2Z6UytHZ0tra1BZMU9jdmRla0x1SG92cFNvRTY1WExT?=
 =?utf-8?B?d3VEWFdhNGU1bERobWFBblAweDFTU3BGV3p0eEloQytQVzlJT3VTODlnZGQz?=
 =?utf-8?B?QnJZS0hVM3A1WFdJRXNHZzV0ZnVzaW9PVEtBY0tVOWdlOFYzSHQzdVpmcjRB?=
 =?utf-8?B?UGdmQkRoOVdtajRBOEJra01oN2NIYmtRNlFCakNxUXZqcEthNGF0MUpQczVZ?=
 =?utf-8?B?WHNCUTk5MWhtUGlUS0V3cFFsdmg3MHZuamhtR3VZcXQ5L2V3enhEZlBhbHFv?=
 =?utf-8?B?QTdGYk4zRmxxK1htcmxIK1lqeFhXblc0K2RuRG1Ea0V3SzdXMXNZZHYzMmc5?=
 =?utf-8?B?b3VMQ3FUbmUwRDRlZlBlQ1Y2dU9CR01xQm5VR2Q1NlA1RHRaSXVIa2YyNUIr?=
 =?utf-8?B?VUpvc25EcVVZbHkwTHhSV1NwaGNmd1hybFhWT2F1M1g5eUxwYW9qSkFEUGxi?=
 =?utf-8?Q?9mG4RJuu6azFSmdXUUFWKqELg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c026fede-6db3-429a-584b-08da7b9d29b2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 13:26:56.7232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ud5RTBTVSNf3JBu/0uX8hc7LRgWpUIBkumnl8GLUiZnmW1bu9mRLWHHWEPN3EnabZbKY25brDZlHvtJx+azV7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2681

On 11.08.2022 15:21, Andrew Cooper wrote:
> On 11/08/2022 11:52, Jan Beulich wrote:
>> --- a/xen/arch/x86/irq.c
>> +++ b/xen/arch/x86/irq.c
>> @@ -2162,7 +2162,7 @@ int map_domain_pirq(
>>          if ( !cpu_has_apic )
>>              goto done;
>>  
>> -        pdev = pci_get_pdev_by_domain(d, msi->seg, msi->bus, msi->devfn);
>> +        pdev = pci_get_pdev(d, PCI_SBDF(msi->seg, msi->bus, msi->devfn));
> 
> Oh, I should really have read this patch before trying to do the sbdf
> conversion in patch 1.
> 
> However, it occurs to me that this:
> 
> diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
> index 117379318f2c..6f0ab845017c 100644
> --- a/xen/arch/x86/include/asm/msi.h
> +++ b/xen/arch/x86/include/asm/msi.h
> @@ -59,9 +59,14 @@
>  #define FIX_MSIX_MAX_PAGES              512
>  
>  struct msi_info {
> -    u16 seg;
> -    u8 bus;
> -    u8 devfn;
> +    union {
> +        struct {
> +            u8 devfn;
> +            u8 bus;
> +            u16 seg;
> +        };
> +        pci_sbdf_t sbdf;
> +    };
>      int irq;
>      int entry_nr;
>      uint64_t table_base;
> 
> will simplify several hunks in this patch, because you can just pass
> msi->sbdf rather than reconstructing it by reversing 32 bits worth of
> data from their in-memory representation.

No, I'm strictly against introducing a 2nd instance of such aliasing
(we already have one in struct pci_dev, and that's bad enough). There
could be _only_ an "sbdf" field here, yes, but that'll have knock-on
effects elsewhere, so wants to be a separate change. And there are far
more places where imo we'll want to use pci_sbdf_t.

> Preferably with something to this effect included, Reviewed-by: Andrew
> Cooper <andrew.cooper3@citrix.com>

Thanks.

Jan

