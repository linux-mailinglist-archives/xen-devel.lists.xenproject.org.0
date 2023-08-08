Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 207AE7738C0
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 09:55:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579347.907289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTHYL-0005Qd-SR; Tue, 08 Aug 2023 07:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579347.907289; Tue, 08 Aug 2023 07:54:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTHYL-0005OQ-PO; Tue, 08 Aug 2023 07:54:53 +0000
Received: by outflank-mailman (input) for mailman id 579347;
 Tue, 08 Aug 2023 07:54:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTHYL-0005OK-0I
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 07:54:53 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe12::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da0f57a6-35c0-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 09:54:50 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8850.eurprd04.prod.outlook.com (2603:10a6:20b:42d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 07:54:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 07:54:47 +0000
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
X-Inumbo-ID: da0f57a6-35c0-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OKO3yTvpEzSxgeJqSkA/WsJif4rlpy5oqOH/TSuPvAfE1zhL5wo1A5E5v9eR1j2A3jr35PUDxH/YNCvsPv0K4pnk0UBFNlCGxZ4xlPUN1LLwZ2jnUzXXDu2vkpj5nrvXlghJRkxcVBybnKuqEGQMSL8HwhaqfPVwmaaxAuH174leubD/dlq6KBkmbfsUAhz0fvSvqOFKcccK0vAs0Bc//vYv4qij7QICcR4QE+Q1G5NOl5il9UuTY/XJeOK/Xc52Slchg1mUn3mP+9iHOotj6JoiNxmkIH3kaD5gkAEYsgL6GsuGYm6G9/Dno6jGd1t2Fs0rztUII6UZs2VLoQm9EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOr0By17pAHE2B7BMnGWJAufSS89hXto64ugIguYhGM=;
 b=AJ/4QLqRGvTlKny09HQeNOMoetSyepJt1wDUgpwn6YRAkKiSEmpc1EBrWrx+fTIswLXrB6kxXd041R7Xbb8F3dmZyL59EZULKz7tBqGVRlfhXZ6wxM7ZauLl6D9c9tpgdgAyHiHbEKsBfoBvyn54xhUEJIWgLYPv1rcWD6Rb1EMxab6OmtBPltAQcdgLS9NSjUIeOg4iqUQXYx/wXBiybBDfKGOvvvqyVxQScnk6VVE8qsG95+fbajm57nCcNQ487krQGLuqdDEVL6VRcMUjpAYbqgU5LnO33ZorSZG51wB5839WE55SnmBVNRsnqnOy7lVDYfC/d1BBjo9OEpmT4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jOr0By17pAHE2B7BMnGWJAufSS89hXto64ugIguYhGM=;
 b=y9R7W5dkU7vPYr0MMPjd9+T+i0s9/Zaowx+TFItV3AdhLlORA0mdgeQIRaEbdjdbCta62OTiHRvygUBri2x83nkCUxghUU/Pg21LSjQTUPJNGTEmKfEFsZz7Hf8Gs4oBdFjFbOpY0K616BTLykXdYwHCWgxk8/hgGR1ypvPrP1z7M4o2PrHlECq7/JjbuaS1str1fOKusWMQV9H/2TY1Mg7RGJSNAxB+/cwZdmEDfzIh8eVr0clZOubM6et41/3YQvDSCYOYWP2J/DBZR8rI+68Pbfmji1hx8EBl6hJNJ2i69p0qqopcK/j8yeEqo58LxENtXN2pIM5AH5dbJCDHHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <504749e9-1782-f031-e015-d36c538e80cc@suse.com>
Date: Tue, 8 Aug 2023 09:54:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] xen/IOMMU: Switch bool_t to bool
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <stefano@stabellini.net>
References: <20230807165830.6719-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230807165830.6719-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8850:EE_
X-MS-Office365-Filtering-Correlation-Id: 66a1f2df-f691-4ce9-2f6a-08db97e4bca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	//CPBsDvPyzRndaxBxt4nEFszG554b76Jkp9yrSkmbwAhLRJjJn94Axvo3ujjRtV6svVdsMEtfD9G0Tp06V8bTYVNc6SEqI44TfSDTQuKAEwApmJ2HTRB6b2CBWc2mJsmfvYg5MJW6G8RW8oIkGRD8A2lixV1sZ1PLXNMeThM8xigDi9nfPYF/8KkcF57nVMZdCtDfjTfw3Lv3pn3+YJUu0DHkksatrNFHkqciGAeOaTcjvCQAMj1aYhSmuL4DbMNQgjkojICcwbwk7bq2wJ0ljLjA5PaycPjZ0ITB/hCWnQCeFMSvsPDUJ1tnrfMXd6begQBFPGNhqKKHZGpklEEzfgF4sHf5uZazSQpmcLJ6NvhhCophwaYU6BYUy4q9bKW5SPAbjaeY8vmlXHezGLyxy3rNfnY3uuyLhn5JT7QCmczgZqjODIVSydO3nGNUY3+HiE7KKrx2st1aRe8AIyj3ZIfh/tMSKApenYnCTAEicAGJst8klaA8/6AVStwh0iTGl1ovtmq49mfds8HIaBD0ex1GNg4X6R6TovJ5EB28VqMBFMg6GbC/cRWVAhaSHWTWvonhVXh4zFydejHB64yKYT0EMOcS6CfVXVqCX0Mkh4j/GEdWjwtZoAGDW+Xv7xdSTRdpIhh5qmdEFsCy7kYY56GZ7TA36mt4KsR3BjQTG4ygi68mItU0ZspsFqbYGswxuA9DOIGrvcE3o2/HmT4ZHMYwb7//tXLbg/H+aFfGbIQpKc3f4NkFYebBJoaOl3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199021)(90011799007)(90021799007)(186006)(1800799003)(2616005)(36756003)(6512007)(4326008)(316002)(86362001)(6916009)(54906003)(38100700002)(66946007)(478600001)(66476007)(66556008)(31696002)(6486002)(53546011)(6506007)(41300700001)(26005)(8676002)(8936002)(2906002)(30864003)(83380400001)(5660300002)(31686004)(45980500001)(43740500002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmRrcSs3cU5KRTltQmZTSzYwZEFCUkorM0N5eHpmdzlKUTRLQmFIUSsyeGVN?=
 =?utf-8?B?b2NwV3VwL0VhRk0wMTVjNndTaGFDNVhsUmJ3ZTZYOXhJK0xYRE5tS3hsL3R4?=
 =?utf-8?B?SU1VcHQ2a2xFQWM1OXRuWHo0L3cybjdmTmo4MVRrVXQ0eXBkV3h6SDhjVm1y?=
 =?utf-8?B?VFd5VGhWRXJRTjVlbkJMczRrVUl0MWpVbXFpRHpUOWlSYXU0VTlKRHY2ZHFC?=
 =?utf-8?B?UkQ1WUFkbzV0ZmhZbU83VFkwemxIVy81Rit0TkNaRy9XRExvaVRXRGFGUXJ4?=
 =?utf-8?B?bGJaUTYwMGxraTJSMytlSFpsRVRXN3lLcHZLbGlaK0lnOE5nclBHMlV6M0t4?=
 =?utf-8?B?bUMvS29BYjJxQTdadU1VNStmQnFqaXZEK2tGMUtDMHJPaE1ITXVva3ExRDNr?=
 =?utf-8?B?Uk9QL0VFYjlXRjQ0R2F4aDRqR2F2Y25IV1hZUUFCQVdJcDhPSmxuR3Y4d0M5?=
 =?utf-8?B?Y2RuclQrMFVrT0dUNzZ4enAxMG00RTdJRThIcmRVeFdWQlVnMkV6V0JYZjlQ?=
 =?utf-8?B?NlcrOHltU3QwY2MvNzZ1NHAxekZpV1RCTXNyZWs0RnkwL29GNlVMTlhCWWVj?=
 =?utf-8?B?Ukc4aDJRR1JhTTBaZjBFK0JJVU04czlVUE93a1pwNWRVRVEvTGtwNEJ5M1Nx?=
 =?utf-8?B?ZGN3eUYxOVZHM01qNEJGTmlDak5FMnNUS0F5Y0FuSjRDL1VoZmh5NnhKSktt?=
 =?utf-8?B?dENXV1NDc0ZWN3VCVXZpWVBObEtSOEJJOTdRK2M4dnJVWHZhUDlGVUFqc1Vu?=
 =?utf-8?B?L21tVWoycWZpd2QyTFpSVklkOEhOMjRyZFJBUm83SXZLdlRqR3J0d3d0a2xN?=
 =?utf-8?B?SkFhZTNGNXVnMWlPUUR0NHhDRFFiTHFBQ1REN1RJdElBNkRCcCs4STNIRTh2?=
 =?utf-8?B?UUVlWmRpb3lIUEE2U0JkNitGN2cvWnk4M0Z3bkV3SkZ6SWlweWdRenpTVWkx?=
 =?utf-8?B?OW9aaFl0QUs2eFNkMFpsbWtTNjB1d3E3Yi93SWJCeVhhbXZPSXR2emt1TjZt?=
 =?utf-8?B?S2FWMlRORi94YmJnSjZmVU5hM1dxTUVGeGpITWpKaVFmSEdjVFBMck81V3dG?=
 =?utf-8?B?NDVjS09rZ2gzQWFHV05uT0lVWGxrb2xkdUhRSEhFZkJDaWpOTTdpN2lWc0t0?=
 =?utf-8?B?Q0NYY3p0bGdLZUFMaW9xWDdtMnluM1p2Vnc1M1paWkplc0RxdEdFWUYyYnVr?=
 =?utf-8?B?RHRKVzdDV3hXUVA3endZMDlpL2g4K1dDUjhFU2RqSTRuczdHZE5CZHRVdG5l?=
 =?utf-8?B?anNmN3Q4VVR6Z1BWNGRXM1F3eEw0d2Vyalo3VWphV1liUFR2eUZrTUxScDNT?=
 =?utf-8?B?M0kxM0dqSlpVeGhpTlZVbVoxSWxhUWp3SDBkblNBeGdyWlVkSitPRURiekgx?=
 =?utf-8?B?RHBjRDllQmR5Qm1CNThLR1dlb0NlQU1HWk1WNTNWQUFoejgwb0puSlZ6NHNq?=
 =?utf-8?B?bHMvOWYrb3ZsK2VnRk03SGNwNTFTcG1PcDlTcmxmMW5sM1RIWVdXVkpUSjEv?=
 =?utf-8?B?UzAyeGxoYTB1bzE4YldtZ2FlTzFnWXk0R2ZOcFNDY21nRHkrcys3enJJL3Y4?=
 =?utf-8?B?NHh0OWE0YXBTdG5ZbzdqUG4zOGR6TVAvNzNkelozTDNJSy9XYTdmNHFudVVL?=
 =?utf-8?B?SEJoY3NzZnArZUZLQnlDaHVqNTZuOFNJdkVybTIybHk4endTVGJTNHo3YzJB?=
 =?utf-8?B?UXMwbitZaHFScHJySmUxalVsNkcxZzVHNllYTHhZOCttc0NBZkJiaFE1Q2ZQ?=
 =?utf-8?B?UFNaZlorT3I5TnNUa0laUHlpZktuZEdGOWZMVXhQR0Y0dzF1ZlptUDU5MzBI?=
 =?utf-8?B?ZHJiRHdlMVFraXlDS0ltS0RDYnlnbVJNUHg0UHBPMFNVY0tPNXFBU0M3S3I2?=
 =?utf-8?B?a0Nzay9Ya21RNUtpVzhyZzdOL2VOM1V4Z2l0akNxdmdmUDZUUEdLSHc4S2h0?=
 =?utf-8?B?WHBZZ1Y2VSt2YS9UK1N1RE9ITnZuWlFMRlVaSzFGY0JQYnhVTWZmS01QdFhH?=
 =?utf-8?B?RHRkdnF1TnRucXU3MkFrc1ZDb1ZPTU1nTG9PYkZKbXhzaEY0bG8zM2c5d3I0?=
 =?utf-8?B?dzFWTnJidkFlYTc2TkY4VGdXVmphSG02R0lWZmFYeGw0SFpaZVZqZmR1bXQx?=
 =?utf-8?Q?zZrmUJny5TR5Xlc+FnUe7yjDu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a1f2df-f691-4ce9-2f6a-08db97e4bca2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 07:54:47.7481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AFpRzurN8Q9x8KIoxg0XuaufFF2X6H0ACWdHf6MnvQJ8oOp/dLg8rukSpmCFOjPz1BnSxFYwNT4I/nF70XY2VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8850

On 07.08.2023 18:58, Andrew Cooper wrote:
> ... as part of cleaning up the types used.  Minor style cleanup on some
> altered lines.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>  xen/drivers/passthrough/amd/iommu.h         |  4 ++--
>  xen/drivers/passthrough/amd/iommu_acpi.c    |  6 +++---
>  xen/drivers/passthrough/amd/iommu_init.c    |  6 +++---
>  xen/drivers/passthrough/amd/pci_amd_iommu.c |  2 +-
>  xen/drivers/passthrough/ats.c               |  2 +-
>  xen/drivers/passthrough/ats.h               |  2 +-
>  xen/drivers/passthrough/device_tree.c       |  4 ++--

This will want a DEVICE TREE ack; Cc-ing respective maintainers here
(and therefore preserving full context).

>  xen/drivers/passthrough/iommu.c             |  8 ++++----
>  xen/drivers/passthrough/pci.c               | 16 ++++++++--------

For these and ats.? you would also have wanted to Cc Paul.

Jan

>  xen/drivers/passthrough/vtd/dmar.c          |  6 +++--->  xen/drivers/passthrough/vtd/extern.h        |  6 +++---
>  xen/drivers/passthrough/vtd/iommu.c         | 18 +++++++++---------
>  xen/drivers/passthrough/vtd/qinval.c        |  2 +-
>  xen/drivers/passthrough/vtd/quirks.c        |  8 ++++----
>  xen/drivers/passthrough/vtd/x86/ats.c       |  2 +-
>  xen/include/xen/iommu.h                     |  6 +++---
>  16 files changed, 49 insertions(+), 49 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
> index 5429ada58ef5..acbaad30d564 100644
> --- a/xen/drivers/passthrough/amd/iommu.h
> +++ b/xen/drivers/passthrough/amd/iommu.h
> @@ -174,7 +174,7 @@ struct guest_iommu {
>  
>      struct domain          *domain;
>      spinlock_t              lock;
> -    bool_t                  enabled;
> +    bool                    enabled;
>  
>      struct guest_dev_table  dev_table;
>      struct guest_buffer     cmd_buffer;
> @@ -194,7 +194,7 @@ struct guest_iommu {
>      struct guest_iommu_msi  msi;
>  };
>  
> -extern bool_t iommuv2_enabled;
> +extern bool iommuv2_enabled;
>  
>  struct acpi_ivrs_hardware;
>  
> diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
> index 3b577c9b390c..891c6c6ddde2 100644
> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
> @@ -1063,14 +1063,14 @@ static unsigned int __initdata nr_ivmd;
>  #define to_ivmd_block(hdr) \
>      container_of(hdr, const struct acpi_ivrs_memory, header)
>  
> -static inline bool_t is_ivhd_block(u8 type)
> +static inline bool is_ivhd_block(u8 type)
>  {
>      return (type == ACPI_IVRS_TYPE_HARDWARE ||
>              ((amd_iommu_acpi_info & ACPI_IVRS_EFR_SUP) &&
>               type == ACPI_IVRS_TYPE_HARDWARE_11H));
>  }
>  
> -static inline bool_t is_ivmd_block(u8 type)
> +static inline bool is_ivmd_block(u8 type)
>  {
>      return (type == ACPI_IVRS_TYPE_MEMORY_ALL ||
>              type == ACPI_IVRS_TYPE_MEMORY_ONE ||
> @@ -1102,7 +1102,7 @@ static int __init cf_check parse_ivrs_table(struct acpi_table_header *table)
>      const struct acpi_ivrs_header *ivrs_block;
>      unsigned long length;
>      unsigned int apic, i;
> -    bool_t sb_ioapic = !iommu_intremap;
> +    bool sb_ioapic = !iommu_intremap;
>      int error = 0;
>  
>      BUG_ON(!table);
> diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
> index af6713d2fc02..41ec38bb72eb 100644
> --- a/xen/drivers/passthrough/amd/iommu_init.c
> +++ b/xen/drivers/passthrough/amd/iommu_init.c
> @@ -34,7 +34,7 @@ unsigned int __read_mostly ivrs_bdf_entries;
>  u8 __read_mostly ivhd_type;
>  static struct radix_tree_root ivrs_maps;
>  LIST_HEAD_READ_MOSTLY(amd_iommu_head);
> -bool_t iommuv2_enabled;
> +bool iommuv2_enabled;
>  
>  bool __ro_after_init amd_iommu_perdev_intremap = true;
>  
> @@ -737,7 +737,7 @@ static void cf_check iommu_interrupt_handler(
>      tasklet_schedule(&amd_iommu_irq_tasklet);
>  }
>  
> -static bool_t __init set_iommu_interrupt_handler(struct amd_iommu *iommu)
> +static bool __init set_iommu_interrupt_handler(struct amd_iommu *iommu)
>  {
>      int irq, ret;
>  
> @@ -1329,7 +1329,7 @@ static int __init cf_check amd_iommu_setup_device_table(
>  }
>  
>  /* Check whether SP5100 SATA Combined mode is on */
> -static bool_t __init amd_sp5100_erratum28(void)
> +static bool __init amd_sp5100_erratum28(void)
>  {
>      u32 bus, id;
>      u16 vendor_id, dev_id;
> diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> index 94e37755064b..f7f9f4e5423a 100644
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -28,7 +28,7 @@
>  /* dom_io is used as a sentinel for quarantined devices */
>  #define QUARANTINE_SKIP(d, p) ((d) == dom_io && !(p)->arch.amd.root_table)
>  
> -static bool_t __read_mostly init_done;
> +static bool __read_mostly init_done;
>  
>  static const struct iommu_init_ops _iommu_init_ops;
>  
> diff --git a/xen/drivers/passthrough/ats.c b/xen/drivers/passthrough/ats.c
> index 7f7b16dc490c..253f5c2e1042 100644
> --- a/xen/drivers/passthrough/ats.c
> +++ b/xen/drivers/passthrough/ats.c
> @@ -18,7 +18,7 @@
>  #include <xen/pci_regs.h>
>  #include "ats.h"
>  
> -bool_t __read_mostly ats_enabled = 0;
> +bool __read_mostly ats_enabled;
>  boolean_param("ats", ats_enabled);
>  
>  int enable_ats_device(struct pci_dev *pdev, struct list_head *ats_list)
> diff --git a/xen/drivers/passthrough/ats.h b/xen/drivers/passthrough/ats.h
> index c202f4ecdd67..baa5f6a6dc04 100644
> --- a/xen/drivers/passthrough/ats.h
> +++ b/xen/drivers/passthrough/ats.h
> @@ -22,7 +22,7 @@
>  #define ATS_QUEUE_DEPTH_MASK     0x1f
>  #define ATS_ENABLE               (1<<15)
>  
> -extern bool_t ats_enabled;
> +extern bool ats_enabled;
>  
>  int enable_ats_device(struct pci_dev *pdev, struct list_head *ats_list);
>  void disable_ats_device(struct pci_dev *pdev);
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 1c32d7b50cce..3c0322c7973d 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -83,9 +83,9 @@ int iommu_deassign_dt_device(struct domain *d, struct dt_device_node *dev)
>      return rc;
>  }
>  
> -static bool_t iommu_dt_device_is_assigned(const struct dt_device_node *dev)
> +static bool iommu_dt_device_is_assigned(const struct dt_device_node *dev)
>  {
> -    bool_t assigned = 0;
> +    bool assigned = false;
>  
>      if ( !dt_device_is_protected(dev) )
>          return 0;
> diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
> index 7bbe3889a214..f9a9f53dbd44 100644
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -29,7 +29,7 @@ bool __initdata iommu_enable = 1;
>  bool __read_mostly iommu_enabled;
>  bool __read_mostly force_iommu;
>  bool __read_mostly iommu_verbose;
> -static bool_t __read_mostly iommu_crash_disable;
> +static bool __read_mostly iommu_crash_disable;
>  
>  #define IOMMU_quarantine_none         0 /* aka false */
>  #define IOMMU_quarantine_basic        1 /* aka true */
> @@ -59,7 +59,7 @@ bool __read_mostly iommu_hap_pt_share = true;
>  
>  bool __read_mostly iommu_debug;
>  
> -DEFINE_PER_CPU(bool_t, iommu_dont_flush_iotlb);
> +DEFINE_PER_CPU(bool, iommu_dont_flush_iotlb);
>  
>  static int __init cf_check parse_iommu_param(const char *s)
>  {
> @@ -548,7 +548,7 @@ static int __init iommu_quarantine_init(void)
>  int __init iommu_setup(void)
>  {
>      int rc = -ENODEV;
> -    bool_t force_intremap = force_iommu && iommu_intremap;
> +    bool force_intremap = force_iommu && iommu_intremap;
>  
>      if ( iommu_hwdom_strict )
>          iommu_hwdom_passthrough = false;
> @@ -672,7 +672,7 @@ int iommu_get_reserved_device_memory(iommu_grdm_t *func, void *ctxt)
>      return iommu_call(ops, get_reserved_device_memory, func, ctxt);
>  }
>  
> -bool_t iommu_has_feature(struct domain *d, enum iommu_feature feature)
> +bool iommu_has_feature(struct domain *d, enum iommu_feature feature)
>  {
>      return is_iommu_enabled(d) && test_bit(feature, dom_iommu(d)->features);
>  }
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 33452791a8e0..ed1f689227fa 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -62,7 +62,7 @@ void pcidevs_unlock(void)
>      spin_unlock_recursive(&_pcidevs_lock);
>  }
>  
> -bool_t pcidevs_locked(void)
> +bool pcidevs_locked(void)
>  {
>      return !!spin_is_locked(&_pcidevs_lock);
>  }
> @@ -74,7 +74,7 @@ static inline struct pci_seg *get_pseg(u16 seg)
>      return radix_tree_lookup(&pci_segments, seg);
>  }
>  
> -bool_t pci_known_segment(u16 seg)
> +bool pci_known_segment(u16 seg)
>  {
>      return get_pseg(seg) != NULL;
>  }
> @@ -984,7 +984,7 @@ int find_upstream_bridge(u16 seg, u8 *bus, u8 *devfn, u8 *secbus)
>      return ret;
>  }
>  
> -bool_t __init pci_device_detect(u16 seg, u8 bus, u8 dev, u8 func)
> +bool __init pci_device_detect(u16 seg, u8 bus, u8 dev, u8 func)
>  {
>      u32 vendor;
>  
> @@ -1181,7 +1181,7 @@ static int hest_match_pci(const struct acpi_hest_aer_common *p,
>             p->function               == PCI_FUNC(pdev->devfn);
>  }
>  
> -static bool_t hest_match_type(const struct acpi_hest_header *hest_hdr,
> +static bool hest_match_type(const struct acpi_hest_header *hest_hdr,
>                                const struct pci_dev *pdev)
>  {
>      unsigned int pos = pci_find_cap_offset(pdev->seg, pdev->bus,
> @@ -1207,10 +1207,10 @@ static bool_t hest_match_type(const struct acpi_hest_header *hest_hdr,
>  
>  struct aer_hest_parse_info {
>      const struct pci_dev *pdev;
> -    bool_t firmware_first;
> +    bool firmware_first;
>  };
>  
> -static bool_t hest_source_is_pcie_aer(const struct acpi_hest_header *hest_hdr)
> +static bool hest_source_is_pcie_aer(const struct acpi_hest_header *hest_hdr)
>  {
>      if ( hest_hdr->type == ACPI_HEST_TYPE_AER_ROOT_PORT ||
>           hest_hdr->type == ACPI_HEST_TYPE_AER_ENDPOINT ||
> @@ -1224,7 +1224,7 @@ static int cf_check aer_hest_parse(
>  {
>      struct aer_hest_parse_info *info = data;
>      const struct acpi_hest_aer_common *p;
> -    bool_t ff;
> +    bool ff;
>  
>      if ( !hest_source_is_pcie_aer(hest_hdr) )
>          return 0;
> @@ -1254,7 +1254,7 @@ static int cf_check aer_hest_parse(
>      return 0;
>  }
>  
> -bool_t pcie_aer_get_firmware_first(const struct pci_dev *pdev)
> +bool pcie_aer_get_firmware_first(const struct pci_dev *pdev)
>  {
>      struct aer_hest_parse_info info = { .pdev = pdev };
>  
> diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough/vtd/dmar.c
> index 4936c20952ec..07772f178fe6 100644
> --- a/xen/drivers/passthrough/vtd/dmar.c
> +++ b/xen/drivers/passthrough/vtd/dmar.c
> @@ -149,7 +149,7 @@ struct vtd_iommu *ioapic_to_iommu(unsigned int apic_id)
>      return NULL;
>  }
>  
> -static bool_t acpi_hpet_device_match(
> +static bool acpi_hpet_device_match(
>      struct list_head *list, unsigned int hpet_id)
>  {
>      struct acpi_hpet_unit *hpet;
> @@ -1052,14 +1052,14 @@ void acpi_dmar_zap(void)
>          write_atomic((uint32_t*)&dmar_table->signature[0], sig);
>  }
>  
> -bool_t platform_supports_intremap(void)
> +bool platform_supports_intremap(void)
>  {
>      const unsigned int mask = ACPI_DMAR_INTR_REMAP;
>  
>      return (dmar_flags & mask) == ACPI_DMAR_INTR_REMAP;
>  }
>  
> -bool_t __init platform_supports_x2apic(void)
> +bool __init platform_supports_x2apic(void)
>  {
>      const unsigned int mask = ACPI_DMAR_INTR_REMAP | ACPI_DMAR_X2APIC_OPT_OUT;
>  
> diff --git a/xen/drivers/passthrough/vtd/extern.h b/xen/drivers/passthrough/vtd/extern.h
> index d49e40c5ce7d..667590ee52df 100644
> --- a/xen/drivers/passthrough/vtd/extern.h
> +++ b/xen/drivers/passthrough/vtd/extern.h
> @@ -26,7 +26,7 @@
>  #define VTDPREFIX "[VT-D]"
>  
>  struct pci_ats_dev;
> -extern bool_t rwbf_quirk;
> +extern bool rwbf_quirk;
>  extern const struct iommu_init_ops intel_iommu_init_ops;
>  
>  void print_iommu_regs(struct acpi_drhd_unit *drhd);
> @@ -111,7 +111,7 @@ int __must_check me_wifi_quirk(struct domain *domain, uint8_t bus,
>  void pci_vtd_quirk(const struct pci_dev *);
>  void quirk_iommu_caps(struct vtd_iommu *iommu);
>  
> -bool_t platform_supports_intremap(void);
> -bool_t platform_supports_x2apic(void);
> +bool platform_supports_intremap(void);
> +bool platform_supports_x2apic(void);
>  
>  #endif // _VTD_EXTERN_H_
> diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
> index 0e3062c820f9..d34c98d9c773 100644
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -644,8 +644,8 @@ static int __must_check iommu_flush_iotlb_global(struct vtd_iommu *iommu,
>  }
>  
>  static int __must_check iommu_flush_iotlb_dsi(struct vtd_iommu *iommu, u16 did,
> -                                              bool_t flush_non_present_entry,
> -                                              bool_t flush_dev_iotlb)
> +                                              bool flush_non_present_entry,
> +                                              bool flush_dev_iotlb)
>  {
>      int status;
>  
> @@ -663,8 +663,8 @@ static int __must_check iommu_flush_iotlb_dsi(struct vtd_iommu *iommu, u16 did,
>  
>  static int __must_check iommu_flush_iotlb_psi(struct vtd_iommu *iommu, u16 did,
>                                                u64 addr, unsigned int order,
> -                                              bool_t flush_non_present_entry,
> -                                              bool_t flush_dev_iotlb)
> +                                              bool flush_non_present_entry,
> +                                              bool flush_dev_iotlb)
>  {
>      int status;
>  
> @@ -694,7 +694,7 @@ static int __must_check iommu_flush_all(void)
>  {
>      struct acpi_drhd_unit *drhd;
>      struct vtd_iommu *iommu;
> -    bool_t flush_dev_iotlb;
> +    bool flush_dev_iotlb;
>      int rc = 0;
>  
>      flush_local(FLUSH_CACHE);
> @@ -736,7 +736,7 @@ static int __must_check cf_check iommu_flush_iotlb(struct domain *d, dfn_t dfn,
>      struct domain_iommu *hd = dom_iommu(d);
>      struct acpi_drhd_unit *drhd;
>      struct vtd_iommu *iommu;
> -    bool_t flush_dev_iotlb;
> +    bool flush_dev_iotlb;
>      int iommu_domid;
>      int ret = 0;
>  
> @@ -1480,7 +1480,7 @@ int domain_context_mapping_one(
>      uint16_t seg = iommu->drhd->segment, prev_did = 0;
>      struct domain *prev_dom = NULL;
>      int rc, ret;
> -    bool_t flush_dev_iotlb;
> +    bool flush_dev_iotlb;
>  
>      if ( QUARANTINE_SKIP(domain, pgd_maddr) )
>          return 0;
> @@ -1874,7 +1874,7 @@ int domain_context_unmap_one(
>      struct context_entry *context, *context_entries;
>      u64 maddr;
>      int iommu_domid, rc, ret;
> -    bool_t flush_dev_iotlb;
> +    bool flush_dev_iotlb;
>  
>      ASSERT(pcidevs_locked());
>      spin_lock(&iommu->lock);
> @@ -2873,7 +2873,7 @@ static int cf_check intel_iommu_assign_device(
>          if ( rmrr->segment == seg && bdf == PCI_BDF(bus, devfn) &&
>               rmrr->scope.devices_cnt > 1 )
>          {
> -            bool_t relaxed = !!(flag & XEN_DOMCTL_DEV_RDM_RELAXED);
> +            bool relaxed = flag & XEN_DOMCTL_DEV_RDM_RELAXED;
>  
>              printk(XENLOG_GUEST "%s" VTDPREFIX
>                     " It's %s to assign %pp"
> diff --git a/xen/drivers/passthrough/vtd/qinval.c b/xen/drivers/passthrough/vtd/qinval.c
> index 4f9ad136b9c5..036f3e850544 100644
> --- a/xen/drivers/passthrough/vtd/qinval.c
> +++ b/xen/drivers/passthrough/vtd/qinval.c
> @@ -152,7 +152,7 @@ static int __must_check queue_invalidate_iotlb_sync(struct vtd_iommu *iommu,
>  
>  static int __must_check queue_invalidate_wait(struct vtd_iommu *iommu,
>                                                u8 iflag, u8 sw, u8 fn,
> -                                              bool_t flush_dev_iotlb)
> +                                              bool flush_dev_iotlb)
>  {
>      static DEFINE_PER_CPU(uint32_t, poll_slot);
>      unsigned int index;
> diff --git a/xen/drivers/passthrough/vtd/quirks.c b/xen/drivers/passthrough/vtd/quirks.c
> index fcc8f73e8b90..5d706a539788 100644
> --- a/xen/drivers/passthrough/vtd/quirks.c
> +++ b/xen/drivers/passthrough/vtd/quirks.c
> @@ -56,9 +56,9 @@ static unsigned int snb_igd_timeout;
>  
>  static u32 __read_mostly ioh_id;
>  static u32 __initdata igd_id;
> -bool_t __read_mostly rwbf_quirk;
> -static bool_t __read_mostly is_cantiga_b3;
> -static bool_t __read_mostly is_snb_gfx;
> +bool __read_mostly rwbf_quirk;
> +static bool __read_mostly is_cantiga_b3;
> +static bool __read_mostly is_snb_gfx;
>  static u8 *__read_mostly igd_reg_va;
>  static spinlock_t igd_lock;
>  
> @@ -498,7 +498,7 @@ void pci_vtd_quirk(const struct pci_dev *pdev)
>      int seg = pdev->seg;
>      int bus = pdev->bus;
>      int pos;
> -    bool_t ff;
> +    bool ff;
>      u32 val, val2;
>      u64 bar;
>      paddr_t pa;
> diff --git a/xen/drivers/passthrough/vtd/x86/ats.c b/xen/drivers/passthrough/vtd/x86/ats.c
> index 04d702b1d6b1..9de419775f90 100644
> --- a/xen/drivers/passthrough/vtd/x86/ats.c
> +++ b/xen/drivers/passthrough/vtd/x86/ats.c
> @@ -119,7 +119,7 @@ int dev_invalidate_iotlb(struct vtd_iommu *iommu, u16 did,
>  
>      list_for_each_entry_safe( pdev, temp, &iommu->ats_devices, ats.list )
>      {
> -        bool_t sbit;
> +        bool sbit;
>          int rc = 0;
>  
>          switch ( type )
> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> index 110693c59fe8..0e33ff79684b 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -46,7 +46,7 @@ static inline dfn_t dfn_add(dfn_t dfn, unsigned long i)
>      return _dfn(dfn_x(dfn) + i);
>  }
>  
> -static inline bool_t dfn_eq(dfn_t x, dfn_t y)
> +static inline bool dfn_eq(dfn_t x, dfn_t y)
>  {
>      return dfn_x(x) == dfn_x(y);
>  }
> @@ -193,7 +193,7 @@ enum iommu_feature
>      IOMMU_FEAT_count
>  };
>  
> -bool_t iommu_has_feature(struct domain *d, enum iommu_feature feature);
> +bool iommu_has_feature(struct domain *d, enum iommu_feature feature);
>  
>  #ifdef CONFIG_HAS_PCI
>  struct pirq;
> @@ -409,7 +409,7 @@ void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev);
>   * iommu_iotlb_flush/iommu_iotlb_flush_all will be explicitly called by
>   * the caller.
>   */
> -DECLARE_PER_CPU(bool_t, iommu_dont_flush_iotlb);
> +DECLARE_PER_CPU(bool, iommu_dont_flush_iotlb);
>  
>  extern struct spinlock iommu_pt_cleanup_lock;
>  extern struct page_list_head iommu_pt_cleanup_list;


