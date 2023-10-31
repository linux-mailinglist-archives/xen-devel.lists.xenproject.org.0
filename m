Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 928C47DCB53
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 12:04:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625633.975118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxmXK-00017o-FA; Tue, 31 Oct 2023 11:03:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625633.975118; Tue, 31 Oct 2023 11:03:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxmXK-00014q-CL; Tue, 31 Oct 2023 11:03:54 +0000
Received: by outflank-mailman (input) for mailman id 625633;
 Tue, 31 Oct 2023 11:03:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yzb5=GN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxmXJ-00014k-7j
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 11:03:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c154be8-77dd-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 12:03:50 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9566.eurprd04.prod.outlook.com (2603:10a6:102:26c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.18; Tue, 31 Oct
 2023 11:03:48 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Tue, 31 Oct 2023
 11:03:48 +0000
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
X-Inumbo-ID: 2c154be8-77dd-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLHuHyzRQCoKkOtrWQCGX/1QE1HTxUqmEWxKy86eT8scr1b1s7mJ5TTRu6FsRNUVeL+lzl3N8mitJMg78dD2c/lMLRAtE0GrW63MNcNdkfjy4PowgHa8j+XFg9EM1oPxCqukkHwiB4Lh7AxvBpy0Hcia1OlWYdAxkeWJ78QDvP7hNtwkNvqnC2r72PdSYDe7JvMD/DJ/XPsJ2NGEwBSclX54D9bOnrARHNKA8bOslz6NILpD0NTVYsyaCHPD31TJWzQzsUPJSXGPlO11W1DiaYSZGZ9midguo1302eiV3m/Bh/D2sYrIeHfVT7hyZIkVlKSOMRQCukemLZNVtmBFEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ri6wTvhU61+dtPiVZoj8WKX52jYX/xNXRDnRmks28bQ=;
 b=MOhkcpCywjldCmYZuSNMi3wUffFFFZ0QMcWhkr2cAdKsJerN6HsA9c2w/99u8eQKmUG7mWF1WZtjUCKXMqhdjXYDl0GR1bQ19du5HH+yGrwa/qAgma5MjVzQQb7Csr7GJg5ZzjIoFz+g2fVxkkvmap0Xjud30MEWlKgKeVa+98OYIgOUJRoWoq8pUhKuX93ebPbea3La1W1ceCKtXcTl/MxsROdbHcMxVZgx6o6ouOoVMAMXtvDKXOifptcBC6tS6hAbTBughTs5Bij/0G6t1RCx0kUwv+bm2LxFxZSSpvzurgjvE0Iixk8/hEKs77XuK+mNVc0AJkW2K3bsMoAxSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ri6wTvhU61+dtPiVZoj8WKX52jYX/xNXRDnRmks28bQ=;
 b=XZvUOhDS64CopAde9HpzBVkjTkMfxa1L03DmynBXGh9zp40c7pwOLvaGUBcJdI65vTNUEIw7e/jurK5CHu3ZXFOYhr7aas8VAZilgb3VxqBgUYuta5rsppG3j6iFePeDcsV1SqqQl7YovnTM5JDykMlyAsIYKOcczx+5qTVefJH+hld7tSJ1mKZoIuk/Q9J1NllwNELVG9aCEEwsNV7uvu+eAA02WlYnGYziRVo2G2yyrtRYEUeC3l2QIVg94zNMJsfaswty+Ih5M87E/GZmrt11vmtPzCsnKQJk9+tMGnnZpHOF0kWisrICB3Bds17t9kzyiRps1nK0/FWC89acFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2f828bd2-e6f8-15b5-b226-33e2b33ebba8@suse.com>
Date: Tue, 31 Oct 2023 12:03:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 4/5] [FUTURE] xen/arm: enable vPCI for domUs
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20231030235240.106998-1-stewart.hildebrand@amd.com>
 <20231030235240.106998-5-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231030235240.106998-5-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9566:EE_
X-MS-Office365-Filtering-Correlation-Id: a078fee7-5c76-4b66-7b09-08dbda010eaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U9l4kFz+yxv2vXaqjS2MxAzFd7NX87NNAQeD9lrFDln/2y8+SMcVXtlknAfMcUdufn7hvCcisnMi9xkLJ38sSMz2S949A1JkbID0gorEKsjGgpS1w/zgMzzhY3wC2SfT3jHCEhuqzG2wQgVr+T/yJAwsYFezOn+G3bYK0D4UVPOKWaefV8oDWS6ynPlS3HXoMjHobiWqYifTNzIi5RtnlgbIIzyi8cO0d0xC6UX+kLxt5h0W0O1UufnmeKZgy/OlAvZ3kvGlSUvnojWislR4CIhBm/nrO2J6mlC7nHEbTp3dnY7K5HfWGpMh9foTyXPV18hJrhZrn2LlnIHSBwSXbAuByvvI3C9CuPv/xn26CyhsyNaLALzJ+YIZzQKHGUs3lZMgPlC2g0lEL7SY7DbPHjURhG0JMQ8nBgm1UNKYoTjs/W34jIsVYjbTPaxCVpAUbjnNLBr9hFePiOhkbpUyOeroLDAc9mlH5hnU8iFe1BhWgakrnoe/ontMHgqt3d9856H+ICHBdXggFf221WeCFD4qlIdszY1Xfm1aK+t1WZa+1lAN5DjOyJUGeyKQ8DrQY25Xefzl/pomrRVqKyH7pj687vX0cCfuEMOAEpKLAOetwwKuFvHlHfsINIWI2+ihd/URzx04qgEZ+LlE369LMrxY5LcyBNjnIDrJs4yhXoKLTSzwG0JBGSzTdag78g2H
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(396003)(136003)(39860400002)(230922051799003)(230273577357003)(230173577357003)(1800799009)(451199024)(186009)(64100799003)(4744005)(53546011)(6506007)(36756003)(31696002)(26005)(2616005)(86362001)(6512007)(6666004)(38100700002)(83380400001)(6486002)(2906002)(478600001)(31686004)(66476007)(66556008)(54906003)(41300700001)(316002)(6916009)(66946007)(4326008)(5660300002)(8676002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzJnaW83a0lwNTNyY2tsTjJNRm5zZVVLSzlENmhZRVU2SE9laHJCQVJmeW95?=
 =?utf-8?B?NmZEV2dOc0NEZU1yUVdyUkJoaVJiV2E0YWw0a3pyWGZzY1FVcGtxYkhiTnRI?=
 =?utf-8?B?Mjk3RUExZFVLVWFiRUk0bjFqU3BZQ3ExSDc0WG5Tc1ZUUmM0bktBVEd0cUNl?=
 =?utf-8?B?RDNycGp3NS9SazdnNkkwVUlwOFFUelFWUVgySVpqSlc5Y1QyMTJvV3M4cXB3?=
 =?utf-8?B?WU1RcjVWQ3VwMytwNWhKSktFU2sxa0IweE1rNmR5eG1saGtpRE9xdTBraFY5?=
 =?utf-8?B?eC9ENTZZZmpsVFZtNDRIRFB0bmR4MUpTZEkzakpielpzb0RWOTlhWTZkaGNL?=
 =?utf-8?B?ZEdEZVJudTBJRkc3NkxXM3BXcy9wYlBRbXplWDl0bDNsSFY5YzE5Mnp6VUE1?=
 =?utf-8?B?ZCtyT2o1bUR5ZDZhVzdmOVd2SzQ2NE9JTkRWd2x3QlFHKys3T2dzeVdFYytz?=
 =?utf-8?B?UHAxZG5SM1pHNjVrU1pRdWE1SExVV2NYZlZROGxibGprQ0NSMzVwMzdrVzVq?=
 =?utf-8?B?MW4wRDdQZzZQcVMvWjlxdlMwVjY3NS9jdC9udlk2TDFHS2pZMTY0YnNiZjZi?=
 =?utf-8?B?VTA1Q2N0R1FXR1RWbHdnLzNMemRtOStpOTArWXdjSE1xakJRMURkOHFEU2Iw?=
 =?utf-8?B?Y3NuQzZOL05GRGFVQ2VTUXdxT2lQZTJpMlRJKzBtb0x6eFFsRG8xZW12eVRj?=
 =?utf-8?B?WmxEcCtCdm1IVURkNGQxbGJsekhiRnhBbUE3N2VaVWU1UEhmY3gybWtNWlNQ?=
 =?utf-8?B?RURhTk96YVFraVNKU3I0czN6VUxVQ1pKZEFuc0J3R2lBMzRvSmZKYWdSQzF3?=
 =?utf-8?B?alBNSmhCS0l0UCsrS3NaRUNtWnB2S2FmZXRoZnp2ZFNUVWptREd2dCtJeDRF?=
 =?utf-8?B?M1p6eHVWZks1NHZjWGliY0JjQ3RkKzFIdU1xQjBwYy9pRzYvSSs2SmY2ZEI2?=
 =?utf-8?B?VGxiK0ZkcGR0WDlwc3pPbENYcUJsWElYVkFqQnZ0aVZaV0F1TkV5b3RHa3E2?=
 =?utf-8?B?c3JrS1J1YS80TlIyNFZSOFNtR0VYbnprOXFtWWFsWlNIUFMza0w4K3U0SEMz?=
 =?utf-8?B?Y2xnUVFVTitEeDVKWXBiL3pkSVZXUGswMVFrMW11cXlKc2t5Q2hLcmJYaDBN?=
 =?utf-8?B?bnB0Rk1Dem5lVGpqRzVLWmFMZ1FFek1YMlN2ZFBYZHpUM3E1UERRVDZJemRw?=
 =?utf-8?B?K2lVSTI5cWZxNmNmUzA2RFJabkVVS2g5UUs5bHluNWRiWWsyd2pLQk9OWWM2?=
 =?utf-8?B?NGVpVjdsQjBoaDU5ZGlvSzN3QmRWbEVvZ09IQUtWQnA0dkZZL2lEVm5makdn?=
 =?utf-8?B?MlRsaStqbEo3N2M2WGxKNE9aL25mSnUwc0RZUkI1bUpUQWduUUhMTW93ZTAw?=
 =?utf-8?B?Yk0vWGNmWXE2bS9IZmZORFJhOHRLNDArUEc2ZlhQZnEvVW5PcVVCUGl4L0hw?=
 =?utf-8?B?QjNiSENlV0tYbW5NQnN2dG5jZDNaU2s1d3FiL3dubTl0dGRMTjZBK2VSMFQ0?=
 =?utf-8?B?NFE0NkNFN1lxWjBaRSswSFJ6OWJqZi9OcWdNUUhPalZ5VDhaaXgrVlMxZUtS?=
 =?utf-8?B?TkJqb2pmY3I5Z3F3dTVsU05sdW5RbHJneno5TUQ3MHlnR1QrZzNCUFNYTlpO?=
 =?utf-8?B?SEJ6UmIrV0dDVlFVYUo2SEhNU2FVRVpHQlU3NlYvWTdVeDI4ZVowdi9TS3dO?=
 =?utf-8?B?VW9jQ09Talc5djZUUEVOdGhWeTFkTWNUVUc4ZXV2S1d0d0tZcUlyV3ZGYVZm?=
 =?utf-8?B?NXBFdU13SFIwQnFSaUhycXM3dkZnc0VTOTIzdmVLbDQzM0N3cjdkV29aVVY0?=
 =?utf-8?B?L3BrMnlUb1plYmI5WFRPa0FZdk9TRC9JdHFIVTQvUWh0eDk3RUI0aTYyRlRx?=
 =?utf-8?B?MzZ5a3FSTHVzelFtamRwL1NkQmZMeVB2aGZNaFBUclEzZnNWaGlmc3JhMjhK?=
 =?utf-8?B?dDNRLzB3NDVVZ0o0dHlYcXNYL1gwOW5XaGJjRlhwVEZlQzJHbGF3T2w0OU9T?=
 =?utf-8?B?ZnhzanlBNUlHUVBQNHRhNVoydWFta0MrczFINXhVdzQ2RGNuYndySkxKdisx?=
 =?utf-8?B?Y3FyTnk5UFYrUU15NUtJbncxendFa213UnYrNnBQODJ3UW00ODZ4OUluSmtX?=
 =?utf-8?Q?Xy9TfAKEd8wLBaQivKsQ0KBIe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a078fee7-5c76-4b66-7b09-08dbda010eaf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 11:03:48.0207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +8Z7ylO+/H4nt0Bb3TW1+yBnU5ZYPmGryOGCqu06thtDGiNfMNjgUykSVoLJLKotishV/X+sYWr8teo1g92GBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9566

On 31.10.2023 00:52, Stewart Hildebrand wrote:
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -1618,6 +1618,16 @@ int iommu_do_pci_domctl(
>          bus = PCI_BUS(machine_sbdf);
>          devfn = PCI_DEVFN(machine_sbdf);
>  
> +        if ( IS_ENABLED(CONFIG_ARM) &&
> +             !is_hardware_domain(d) &&
> +             !is_system_domain(d) &&
> +             (!IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) || !has_vpci(d)) )

I don't think you need the explicit ARM check; that's redundant with
checking !HAS_VPCI_GUEST_SUPPORT. It's also not really clear why you
need to check for the system domain here.

> +        {
> +            printk(XENLOG_G_WARNING "Cannot assign %pp to %pd: vPCI support not enabled\n",
> +                   &PCI_SBDF(seg, bus, devfn), d);

ret = -EPERM;

(or some other suitable error indicator)

Jan

> +            break;
> +        }
> +
>          pcidevs_lock();
>          ret = device_assigned(seg, bus, devfn);
>          if ( domctl->cmd == XEN_DOMCTL_test_assign_device )


