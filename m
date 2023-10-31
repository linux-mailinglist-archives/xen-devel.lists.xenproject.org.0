Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 252727DCB3C
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 11:57:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625625.975108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxmQJ-0007IE-Ld; Tue, 31 Oct 2023 10:56:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625625.975108; Tue, 31 Oct 2023 10:56:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxmQJ-0007GZ-II; Tue, 31 Oct 2023 10:56:39 +0000
Received: by outflank-mailman (input) for mailman id 625625;
 Tue, 31 Oct 2023 10:56:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yzb5=GN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxmQH-00070U-TR
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 10:56:37 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2769c46e-77dc-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 11:56:33 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9209.eurprd04.prod.outlook.com (2603:10a6:10:2f8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.16; Tue, 31 Oct
 2023 10:56:30 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Tue, 31 Oct 2023
 10:56:30 +0000
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
X-Inumbo-ID: 2769c46e-77dc-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBo+HZhFFqdJiqVtWqOKofZdmK0eLYHobky0fSFMtIN2t3mI0FM3Ts/e88fdH9/GU9NBYD6iN/GRJ9pwFq/H2sXopA8PAV738XpcUNZwSbE8/GlFtgyvngm2DoCXrMWvhBCE7Y19eNAMpaYPSo2hM0CLVWiKj/coELvBzGeDW0rk9nFXJP29VuqR2Vl/VtGvpdKqlNG9ycmPAZeLuLNxJSs5mrGbK7pLH6sXxcwcY3TK/oGITxMryeJzUHTws0Gzmd11xaMXLH5rtsBDhFLNKB3i6gkEh9IVKX+3cd5Z4BesgLsX+3dsYGyusiPFwCRT7XeTRtl4hf7DcvpVwN6UUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXOfFExdM7yfT/+4zObIH0WurN02Ty51xEKkY1+/U/s=;
 b=UWH56St3F9KcYZrOd73S+OSnIFZzwBtW7dqvK9ysy0ydESMYjy24xM9WYvFnVFvNtrL5tUT92W7YNbaU1LzdZhbds5raC5rvTgetB9NjT3L2x+43MzKuxIIdA1QBLSzIZvZkT07rzny1xsJtgmePIVGA0Ut9697GtarMjioV6yd432oddIW+cMJTX/ozQQHPluw2p55BADop+7NUZ6vx68j26OwLT0hS8Y9hplBPckQm0fDpkPqDb62rZw+qPf+EDCchk1L8jJUKcLsCz4OFUY3aEONitt//c3SFEwmJrEMC21WemetaIS60Oom0f+bzZF/DIoJnqTkMUDbgW5Dk5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXOfFExdM7yfT/+4zObIH0WurN02Ty51xEKkY1+/U/s=;
 b=t/Z0+sXbxXrxPsB3SNi9A2KBZjsRf9Z36XqzGn0S5kSay/G7rd6HJbxZ4a4dkpOPD4kMhHAc0+/Rq1QMG6TNVa69j5Rq7021/pXFylHh/Z07aEAeJFVyYW4Vhvkrq7wjto3E71I77MiSt4q96rm6zRnCbjql6Hk1O3pCwPupupFSvaFLI4qWD5T9FFChYC0HP+XOfIxbUFKvyVdoV214R9yufbpGqRDfilXQCIxN7WPAIXRM2aLnnWceLME4iybkpz9E6P2JtP7jZ6lPEzOpVqbpRWGsgDxXAG9CexnVE25BI2pFBFIw2ctwzCHdeSiBxVm9yvZdZb9bPPtdQyGboQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1c27d0a7-f04d-32ff-05df-4da4c32bebdf@suse.com>
Date: Tue, 31 Oct 2023 11:56:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 2/5] xen/vpci: move xen_domctl_createdomain vPCI flag
 to common
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
References: <20231030235240.106998-1-stewart.hildebrand@amd.com>
 <20231030235240.106998-3-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231030235240.106998-3-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9209:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b54abea-5588-46e7-2bfb-08dbda000a09
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CkANh1UfSzJybbY7SjRZLg+2IR8k5mPDv49k9o1luWIWSoi6APpOv+fTDkZGTdLrzYDnDAHRUAe8tp2ZptuQDnRS6D4PCN/1kFnZKS2EapV3mpFfcpCBm1rUHtq7XqmwPqkl01JqKCfSUhfTtg/+KEJkeBd5IMZMQ2UjB2G4MV6RP2nAVAyGG3rJI6rUHCjHDUQhAPBbNPNJM4e2Z/xhrZCgGoHNLW6JyT//UOkGQbuQbd0Cq1w0xCCIa6NxXr1wDyM998vdQ4jJvXhPFDr3oOCs2AkFzYNydd0lzy915I903C5wsisAcRhbJBl3HJ7iqvUcLbZij3YO8Dk6Ru9Y7R0sagAEZL0wO6Uzs+0yNMtccQVEf8Cdef33j7zbZiVsWa+nzK5wO6UjTxR0dXedtPtd7QBwVnp5va5LU4aaqTsvO5iKdmiMDBZBXVPNX/xoZX2tzHqTM7jO9TU/htkJ5efQE4OtYypilEHdo2WMEhVtqq25a1z/jiKyC+7BQFFAJOPwAxWlHPR0SfFyyq/CmAnTKBg4K2zuu/AIOUadgjkhubkNdjeYpCRsUcNmNQ10ZdPHpEwpW1ShUpY1pntTioF7SqIlDOCuaDURfF47/dyEeTyRCNzS6mCDuQFhpcv1ZbVnLa9r9ZANXsT88cIgqg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(376002)(136003)(366004)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(38100700002)(2906002)(66476007)(66556008)(54906003)(66946007)(316002)(53546011)(6512007)(6486002)(478600001)(6916009)(6506007)(2616005)(26005)(5660300002)(7416002)(41300700001)(8936002)(8676002)(4326008)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEViSDVUN3NNNEVzekhGc0NMbDkzSThZMmMwYStzVDh3OEd2K3FteCtNSjZT?=
 =?utf-8?B?K2xIZTNDV3RUaUMvbUN6QVM1bXhKUTRDejk4Y21QQ0tRdnlLQmthZEpMV25W?=
 =?utf-8?B?dFlMdDdKTXFyREd0RHJWS29qRFBlM21VTnRuNmROTzY1cUZnRUJ2Z3hQSXVZ?=
 =?utf-8?B?V1pHUjFTR254alczeWUyMHdLbGpjMFVEdGN0ODRaS0FuV2FpaVM4aE9ESjFL?=
 =?utf-8?B?ZHRxWFVmQW1mWlRyK0NOMVY4Y1JtZGp0V3djdnJTTU1qNVJEL09kS3UyYU04?=
 =?utf-8?B?T2xNVGpFOU5WWjM1MGcraXZSVDNyTTdrSXVVSmFwd1VaRk1QWHFlcFo5bHNz?=
 =?utf-8?B?bEZMTlB5TVY5Sll0TTBFRDFEMXFpVkRoR3JEZitObmJaZTF0bFEzSUhVYy9v?=
 =?utf-8?B?SFlVbE1lbTc3UFZ1cFlnTVl5cmdEU2EvLzZtVDEvNGFlcEVHa0s3RGtCV0Fz?=
 =?utf-8?B?UVljcmxtSTMrVWhUOGZYNFRtU2VCMVdBbTMwQXZ2YTRqTnRycnMyYk5lRWYy?=
 =?utf-8?B?Z3RSTkJiU2RYMEhXamJoSkN5QVFNcmJKU3hDa3ozT0t0WGVKNVZZVFRJS2FK?=
 =?utf-8?B?Z2VZdlp6RytPY09CdmlmWktwRytRTTR6cHlIUzgyUlowUVJHVVRSN1d1cHZC?=
 =?utf-8?B?WGppT0JjSVEwakRVU0JaeExBMklFRXdraHduOFJCNjBrTkxsM3grMDJQdzBQ?=
 =?utf-8?B?TUhuZC9ud0pvZ25NeXFyL29RTG1KNHdtdXpiZXBGQ0JNZFZ0b1hFd2FxYkV6?=
 =?utf-8?B?QWFibHQ1OGhkd2I5Z2RvN0NLMWVtY0hxeE94U0tDcDBZdEhGWGFzV2lXd3lz?=
 =?utf-8?B?ODcrVERaakVnS1krVElFY2h0WWJ5d3dFNkFxbmF0MGYyL0JjUHErOFdTaEcw?=
 =?utf-8?B?ZnZOVFljc1VGK0E4UXpsd0NLMnVhZlBsb2E2SHhWcDZtUEdqcTlJVURXUnhH?=
 =?utf-8?B?WTUyaUtOeGhGc1JTOVNKUEZZVjVCVFc0Si94eGdTWE9PRTYxZFJSQ2FBM1Nt?=
 =?utf-8?B?eWEybVdkbWoyRlVucktyb3pSanA2SGlSV083TjhYbDdQYVFmWTNjbGNIRGtK?=
 =?utf-8?B?cmRGZmdZWjRyT0ZWYUtwL1k2bnRYYWVaRG11TlFWVVE3ejZzeDJPTWczVWNV?=
 =?utf-8?B?SEVaekZrczkvd0NhL3RPak5UYThLOHZTTStNdFVldVFpLzBrd0QwakFEdDJO?=
 =?utf-8?B?Sm9ZYmk3Y2RuZFplZWhhZkdQZnA3aVhmSVhDMXVMQk1TOEtrRXprbDBWV3Aw?=
 =?utf-8?B?K0JKTkRNbzRYd1BMaFB1dmkrbXZaZjk0dFVldUJWZ1RyQVBiTk1qelhZSTgx?=
 =?utf-8?B?YitQNWFoWlQ2SW0zZUYxdk9zb3ZBd3BUai93cHNqcUVzVmwvRmpjbkE0Lzlk?=
 =?utf-8?B?bWYwWm5VeU43UXJ6clZud3didkp1Y1duNnVyUHlCd1M3RGxXTXBEaE9nejBq?=
 =?utf-8?B?eHQ1dDYxakM3bnR1d0RtRzhmVkdYbDRmSVpzcGcwdG5TaUJ5VXRLcWt2Nk1P?=
 =?utf-8?B?bWViUTFIalRCZ0pKMWJuSFc2QVN0QVhKYnBVUkEvNTZtWmJiNFNCeFQ5ekpO?=
 =?utf-8?B?K1VjNU50WGNNSVFHV0EwNmtGOFBrL3Iraldla0toWngzSEQrZzBwSlZjUnpl?=
 =?utf-8?B?bHdJOEpKbW5uQmFzOWNybGkvRi9XMU8reC9ZM050Z3Z1bW16ZktnSUxGNzUr?=
 =?utf-8?B?blNyNFVhRWl6QVErQnZ2bUo1aGtXNytabGZZM1pGK1ZHU0xhVGtVZzR5TmVF?=
 =?utf-8?B?aDFwYnVLY3dFUTZQNlh4Y01sUHZTbk1NY0VjdmxLcmFnYTRYMzRDbEpnOFlH?=
 =?utf-8?B?VExPc2w2TjdrbFVhU3hwRStzNi8rMVVuanZVeUFWWVlFbVNGclFRNTJSWStU?=
 =?utf-8?B?YmhDa2xmV0E3YVZnWlo1KzZndll2dk4yQWFXUFdJRlVLdlQ4b3VGVUVucXhZ?=
 =?utf-8?B?dzRaUEtnZUFWR2RSZnFaYllxU1RlczF3QzFGQjlEY1llVWcwd2FodnRhcjFR?=
 =?utf-8?B?VENWV3FWdnpUT3oydlQ0SWZjK004T0oyWGI2YmpZZVY2b2lhcGRKdXlReGwr?=
 =?utf-8?B?enZHeEhOYnRWSUQ0UEZsbGRsTEF2ZUdPUERXTG92MEZ1S1p6Q1RZNGl2Ym4w?=
 =?utf-8?Q?J78nhhb3gpwWKiWSRBggZUKbD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b54abea-5588-46e7-2bfb-08dbda000a09
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 10:56:30.7836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTf0bCIneuRUyZG2eVkM5p9fg09I9ZKYl9/nM09S5e6+OmNnS4rqhq8HVz6wYqkV48gVCPz3+cEny92XXXEDDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9209

On 31.10.2023 00:52, Stewart Hildebrand wrote:
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -607,7 +607,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>  {
>      unsigned int max_vcpus;
>      unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
> -    unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu);
> +    unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu |
> +                                   XEN_DOMCTL_CDF_vpci);

Is the flag (going to be, with the initial work) okay to have for Dom0
on Arm?

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -712,7 +712,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>      return 0;
>  }
>  
> -static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
> +static bool emulation_flags_ok(const struct domain *d, uint32_t emflags,
> +                               uint32_t cdf)

While apparently views differ, ./CODING_STYLE wants "unsigned int" to be
used for the latter two arguments.

> @@ -722,14 +723,17 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>      if ( is_hvm_domain(d) )
>      {
>          if ( is_hardware_domain(d) &&
> -             emflags != (X86_EMU_VPCI | X86_EMU_LAPIC | X86_EMU_IOAPIC) )
> +             (!( cdf & XEN_DOMCTL_CDF_vpci ) ||

Nit: Stray blanks inside the inner parentheses.

> +              emflags != (X86_EMU_LAPIC | X86_EMU_IOAPIC)) )
>              return false;
>          if ( !is_hardware_domain(d) &&
> -             emflags != (X86_EMU_ALL & ~X86_EMU_VPCI) &&
> -             emflags != X86_EMU_LAPIC )
> +             ((cdf & XEN_DOMCTL_CDF_vpci) ||
> +              (emflags != X86_EMU_ALL &&
> +               emflags != X86_EMU_LAPIC)) )
>              return false;
>      }
> -    else if ( emflags != 0 && emflags != X86_EMU_PIT )
> +    else if ( (cdf & XEN_DOMCTL_CDF_vpci) ||

Wouldn't this better be enforced in common code?

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -892,10 +892,11 @@ static struct domain *__init create_dom0(const module_t *image,
>      {
>          dom0_cfg.flags |= (XEN_DOMCTL_CDF_hvm |
>                             ((hvm_hap_supported() && !opt_dom0_shadow) ?
> -                            XEN_DOMCTL_CDF_hap : 0));
> +                            XEN_DOMCTL_CDF_hap : 0) |
> +                           XEN_DOMCTL_CDF_vpci);

Less of a change and imo slightly neater as a result would be to simply
put the addition on the same line where CDF_hvm already is. But as with
many style aspects, views may differ here of course ...

Jan

