Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 121A04C2EC2
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 15:57:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278350.475572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNFYo-0003ul-4m; Thu, 24 Feb 2022 14:57:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278350.475572; Thu, 24 Feb 2022 14:57:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNFYo-0003ro-0u; Thu, 24 Feb 2022 14:57:38 +0000
Received: by outflank-mailman (input) for mailman id 278350;
 Thu, 24 Feb 2022 14:57:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNFYm-0003qa-17
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 14:57:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 194ff52b-9582-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 15:57:34 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2058.outbound.protection.outlook.com [104.47.1.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-nppXZKK8NYC3cCTVSdAEXw-1; Thu, 24 Feb 2022 15:57:33 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4390.eurprd04.prod.outlook.com (2603:10a6:20b:26::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 14:57:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 14:57:31 +0000
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
X-Inumbo-ID: 194ff52b-9582-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645714654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1WxRjnE3iiiG2IlHgxZ2cvxARg4aOt8ZNoyJJ+P09Wc=;
	b=j1qfAHzhE/mPDnHuvlxd8nu3nS6mGW8LCXVqFYEO0VYBLeeFj2NG/FaIc1BSHGhFtpx1zF
	qN4fALnqoj/p4mRvnBT2XUS+oZUk2I6BlVnDqnk9H6gdQvqiKusOW/ROP5F2kFXAHHnwa1
	u/gu4rgysKQO08Qn12qVD8FRmggBx74=
X-MC-Unique: nppXZKK8NYC3cCTVSdAEXw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmubvLDdHLqURyfHrnsIJ0Sb2rRbsLIOIVuWO8OFQMJCW2MslIeSnYTH9DaYmldY1OEQL5ylXMpB8B6VrtpXFbrSqdv2eDP6rGfsO5ya/vX32B1sPSvNPTduBOFiaa25Tl+e6LcXZ4EX0pC/lLASsucTRIBQrRjz9IfkcPsrQKWDgNVqFZ2AYyjBreSa7GvfQSXbM9GrR7Hmq4Y34FmxieOQ+h7xqYYbNX81/+LKZObCzEC9Mir3hktgnKVih8cmidwZHhXPuGDmjccSD0HuOoilbpobTip4S/lPAfIK6vD4AIME2IDDkv3ie0eUXX4OQkSGdWmRaHl1uSivS3Excg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WxRjnE3iiiG2IlHgxZ2cvxARg4aOt8ZNoyJJ+P09Wc=;
 b=Awn5gS3dVCs4Jn12lTZZbuCYgKsUXTUq5ynTje2emQBKbychjXcMUjTIDmQ9Gt6+DULlxpbDAhZiqv2gJRhPAJMbZQ61wtR4ewrDwz8j2KvMV6tLv+fyD+Xu6cCzqur7nzraewyFmwbhNRBfM84eVTkudwl2imV7xVX+pSFambTbmMGeIRyBDrbT92FFBTl8sNYs3OfZiR+02FekTziCSnVICmWSuANzqwrC0Ot2Z9kE4rtWYB+k0PWB9t/DfJmZ2up+TvauTnapqtlNKsYMHF0pwC9GeqbDGMMDinkxk+eiOcCE4UXwuF0yTtnT2UeOEzUvwX64iv8P7fJaaCYs2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6e188f87-7e4c-00ee-dd0c-373d42acec34@suse.com>
Date: Thu, 24 Feb 2022 15:57:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 1/3] xen/vpci: msix: move x86 specific code to x86 file
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1644937405.git.rahul.singh@arm.com>
 <4d2a727ba218468e4f347dc12ca051a0534fe205.1644937405.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4d2a727ba218468e4f347dc12ca051a0534fe205.1644937405.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0038.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32c190d1-4b38-4837-2170-08d9f7a5fbc6
X-MS-TrafficTypeDiagnostic: AM6PR04MB4390:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB439062EE61DC9E98EBB4FAAAB33D9@AM6PR04MB4390.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lMgsOTtKfy7znAk/xmqUK/hUVe5s6IHU6pP3iesAk1DZM/+eOJ9+wsWMw0fZJsfjICq61aaKfyhFsaAECOKh7XBgdoDny8AW+LtRS7YkifoH9pm5xW6WGb+KvXpW/+6n2ybY+yRDp9kel7h52Rpt9CvRte2U/C1lEoT8Oz85NVkw38kJSMLyKoAGMyXaPBvJpneQBaJTARwXZ2//oGZN/b+KffbyodK4p5CAnYerZT1NuuDLLfSrgSgM3R7qxGN/a3W/IYardEx/sxBJkN7QLxsGuM7rqltQWtkw/4shxPxLj4fGxglntuMJQzymoggTji4vdX2DqbAcOcXpYFmT6vhKAGVEW98fJNe3pi+oOMskXTy6Uddl/qhMO0YOSlxeYepSqd+D8Lec3Jg8kTsfTJ63+JKFIgeBuylsheQ99Tn/NvgntZ2x/2J2Ju85H7EM2tTJLGhgdzznjEW9NjDRZ8DpT0Vl3lN7Z1O3/EktcHCY3YtFd/81AFSGHBXL3xqcooHA0/bZarDtwNAvQB7xa1wXjDHWf56dlFrUX741xHoj7Zz1U8oz8kqJTaSmSpHGf2mhJdQL/YlCAt1SxxZuvB4EavEUBXruAZOAFcR+FnOH8ihkA05L5ZPYTviY9BGK5hT3XPg27ymF28e0RK86fabfgcG8pNRaN8y07/TdDA/gzINIEGVMSWKtIEA+vZXQ1uWLAlpM6pkjsP1oyYk8b7zhf390kR8pSxIcakgnQClLGoSo53fTMBrouXjE6YFK7WS/qGwlErIU8NiLKHgWzQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(8676002)(2616005)(66556008)(36756003)(5660300002)(316002)(66946007)(8936002)(66476007)(26005)(38100700002)(186003)(31686004)(6486002)(53546011)(6506007)(31696002)(6916009)(54906003)(2906002)(508600001)(86362001)(83380400001)(4326008)(45980500001)(43740500002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDV3ZUswTlRiMHBOckJVdFYxbW1tQmROWmovZjFIT2pwazhEZXFDS3lYWjRZ?=
 =?utf-8?B?ZjdidkZ0aXo0SEpLQ1BYMWppMWtlOC9VWXNmVllJaXpCSURKb1dVTm5FNFdV?=
 =?utf-8?B?ZDUyZjBXVDlPaFpPMDZQY2VQcXp3T1ExVmt2dys2ZjBCQ1l4OTFVVC90cXBy?=
 =?utf-8?B?RXhkWE53aW52TnVsNFhlakdBNEI0UW0rNkZza1ZWZkJ3ZjY5aE12QVQ2RnRl?=
 =?utf-8?B?by80UDJRSSt3ekNwMUx1cDBxcjVDeUh4b282MlVYNmxVTlU2Vm1BR0tTaUFm?=
 =?utf-8?B?V3BXL3cwTm5oZlBpTWdzZFJXQ3IxQ2FiK29sYUZPSDA2U09zSmFLM254V2pP?=
 =?utf-8?B?RWplQkEwQ2RjTWp5bjd6eGp4MFIxeEI2YXlwMzdPY0FkWkFFTzRCTnlOR2tT?=
 =?utf-8?B?YUhFRStPa2xjOUN3ZkFQdnVCL0ZYT2czMUJwam5MbGF4U0k5SWRHR1FmZGlu?=
 =?utf-8?B?L1JqZnN3VzlUeFQxRytFNTYxZis2R201M1FBV2l0NVdVWmN0S3pia2x6RHVN?=
 =?utf-8?B?R0NUTXJQdWtuRkVkcnZvNmRQbEhYYWhhdmQzSDlwV2orY3Y0M1k5aGJRSEtK?=
 =?utf-8?B?ZHJ2V0hycDlzMndRTlk0VytFZGpFWUxCL01uRFZkVmlnOWFuS2p0Q29BdFRR?=
 =?utf-8?B?NHZNRHdwMWYrVFRBam9WYXJsN0ZtN0wrckFYSWo3TjB1bEM5WWFETFhqYzZM?=
 =?utf-8?B?eXU5QXJyclBibjNuaGUvZTYwbVk4aWpQYmdGZWRTT2JZLzBDcC8vR2ZWQ3Yx?=
 =?utf-8?B?ZnFvKzlsY28zemJXZ1huOUU2YkZnelUySzVVUlBjWGk0S3pDK0JNSjg3bzdQ?=
 =?utf-8?B?RnNjYjhVZGZuTnVhM1R5UWRMekpMcjYrTFdFY09qRHlzL1EvRk9jdFYwZUVi?=
 =?utf-8?B?OUliU2s5VnMyR0RaZ0lPdTJscHBRTmNUdTllMXpYaVBsQS9xbnBxcThKbkhk?=
 =?utf-8?B?RWRmdVRsOERteHhRSFJHRGVvbGlheVVGQ1BjR0pNNXV3bXBvMEtIckd4RTk1?=
 =?utf-8?B?aUQza1NJaTJXTFgzWmppb2pTV0xZVGVtTjE4ZHh3eTk5N2dCc1F3N3A2dmk3?=
 =?utf-8?B?VUJCWUpaQ21zTEY0Mldja1FNN0o4NklIMmhIbHQ1YmZVbVlWUmM4c1VNNVlu?=
 =?utf-8?B?RjJXS0xNZTJKYzlnbEh4c01Cb0RvVFdqZ09EVW9nbjZvS2xvVHJSWWlpM0dw?=
 =?utf-8?B?Z0kxK2NLWEVnK2VoMDZlMVlodlBFak5ZZVF4VVVGSHpUU1NpTXVLSCtrK2Jo?=
 =?utf-8?B?WHdmS0taa2tjRVltWXA2ZmdiTnVWT2hhQ25jTmpWeUtPZkt3ZWcvdFlrckN1?=
 =?utf-8?B?ZlMzWUhPNzlhR1B6cWRnK1J1N2pCL0xDMWVpeERkNWd2VXR6WG1NcTQrUE1D?=
 =?utf-8?B?Y29JamErTzk3ZldkeXpYMXd2TTE0OVpHS212bDZNa09MWEpORi9ZZ1MvNWRt?=
 =?utf-8?B?d0hLV29Qa2djR1pMUXBzZ2ljWjNYOTh5eFM3MHErZDQ1KzVuMURDVmNXRHVp?=
 =?utf-8?B?ZUF3aU16Z3ZnMGFCYk1rQkE1bzE3dVJnMDhWZzJ4MlFIOTlQdFhXcStMSFMw?=
 =?utf-8?B?Y21RK3BaUXFIL3VhdkdrZ0EvY1FteW92YXV5VS9WeWlERDFEa3lCWkVGaU9q?=
 =?utf-8?B?YktBdUJXVFFHbUM3WGt2ZUhFMmZvT05pNEhhK2hKQVk0QWk2UDVpNlBnVlNt?=
 =?utf-8?B?THNaR0doVjdBVThvSEJ1V1Z6RFdCWnJOMHVOazlTRkpvOHBzdkI5aHVmcndU?=
 =?utf-8?B?THhGb0F3bjN4ZmxXU1VwRGt2dUdyZ010alBQMnJxYWpVQW1OSWlHU0g0R2pt?=
 =?utf-8?B?RklzOTd6UTMyL2JvaWZ3VDc2cnFqZkdtRkZaV2lLZXNEQU9VZEU3WEtoSWlW?=
 =?utf-8?B?SklMQWV3VmZZQXFmRXUzMk0rNmZ3V0dzUjl3Tm5YcmJCaEtxNDcrazhIVjZS?=
 =?utf-8?B?SFVhUUZHNWpKSnJmclNHOFBEQ0swT3ZMTktQYWZVL1VVVVJJMFFqZUJ1SEVW?=
 =?utf-8?B?a3J0Vy9idnNsb3ZDU25JV2NxK1V0b21FRDhwSk5qOWhkVjFYNW9wMnBEbkNO?=
 =?utf-8?B?a1Q0dnVTVTUzZzg2Yzd0QXk5RDhSVkdTVkp2YzR6UzlNbndiaWxRQloxNVlS?=
 =?utf-8?B?b3lzNENDSjd0VEpGT09kVG5NUVpVMVAxdnJrSXByd2pkelBiZ3Zzc0lnYXRE?=
 =?utf-8?Q?W57K3VgUKJd7y7wvV5H1s0Q=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c190d1-4b38-4837-2170-08d9f7a5fbc6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 14:57:31.6772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otEhQANci150vu2+bmRQZc6r3enz6+QLDMobVV22AHYucXr0EBaTiwWOa5asLnLsqa73BBRj+oqi8e+jeG+XiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4390

On 15.02.2022 16:25, Rahul Singh wrote:
> vpci/msix.c file will be used for arm architecture when vpci msix
> support will be added to ARM, but there is x86 specific code in this
> file.
> 
> Move x86 specific code to the x86/hvm/vmsi.c file to make sure common
> code will be used for other architecture.

Could you provide some criteria by which code is considered x86-specific
(or not)? For example ...

> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -925,4 +925,106 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>  
>      return 0;
>  }
> +
> +int vpci_make_msix_hole(const struct pci_dev *pdev)
> +{
> +    struct domain *d = pdev->domain;
> +    unsigned int i;
> +
> +    if ( !pdev->vpci->msix )
> +        return 0;
> +
> +    /* Make sure there's a hole for the MSIX table/PBA in the p2m. */
> +    for ( i = 0; i < ARRAY_SIZE(pdev->vpci->msix->tables); i++ )
> +    {
> +        unsigned long start = PFN_DOWN(vmsix_table_addr(pdev->vpci, i));
> +        unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
> +                                     vmsix_table_size(pdev->vpci, i) - 1);
> +
> +        for ( ; start <= end; start++ )
> +        {
> +            p2m_type_t t;
> +            mfn_t mfn = get_gfn_query(d, start, &t);
> +
> +            switch ( t )
> +            {
> +            case p2m_mmio_dm:
> +            case p2m_invalid:
> +                break;
> +            case p2m_mmio_direct:
> +                if ( mfn_x(mfn) == start )
> +                {
> +                    clear_identity_p2m_entry(d, start);
> +                    break;
> +                }
> +                /* fallthrough. */
> +            default:
> +                put_gfn(d, start);
> +                gprintk(XENLOG_WARNING,
> +                        "%pp: existing mapping (mfn: %" PRI_mfn
> +                        "type: %d) at %#lx clobbers MSIX MMIO area\n",
> +                        &pdev->sbdf, mfn_x(mfn), t, start);
> +                return -EEXIST;
> +            }
> +            put_gfn(d, start);
> +        }
> +    }
> +
> +    return 0;
> +}

... nothing in this function looks to be x86-specific, except maybe
functions like clear_identity_p2m_entry() may not currently be available
on Arm. But this doesn't make the code x86-specific.

> +struct vpci_msix *vpci_msix_find(const struct domain *d, unsigned long addr)
> +{
> +    struct vpci_msix *msix;
> +
> +    list_for_each_entry ( msix, &d->arch.hvm.msix_tables, next )
> +    {
> +        const struct vpci_bar *bars = msix->pdev->vpci->header.bars;
> +        unsigned int i;
> +
> +        for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
> +            if ( bars[msix->tables[i] & PCI_MSIX_BIRMASK].enabled &&
> +                 VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, i) )
> +                return msix;
> +    }
> +
> +    return NULL;
> +}

Or take this one - I don't see anything x86-specific in here. The use
of d->arch.hvm merely points out that there may be a field which now
needs generalizing.

> +static int x86_msix_accept(struct vcpu *v, unsigned long addr)
> +{
> +    return !!vpci_msix_find(v->domain, addr);
> +}
> +
> +static int x86_msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
> +                          unsigned long data)
> +{
> +    const struct domain *d = v->domain;
> +    struct vpci_msix *msix = vpci_msix_find(d, addr);
> +
> +    return vpci_msix_write(msix, addr, len, data);
> +}
> +
> +static int x86_msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
> +                         unsigned long *data)
> +{
> +    const struct domain *d = v->domain;
> +    struct vpci_msix *msix = vpci_msix_find(d, addr);
> +
> +    return vpci_msix_read(msix, addr, len, data);
> +}
> +
> +static const struct hvm_mmio_ops vpci_msix_table_ops = {
> +    .check = x86_msix_accept,
> +    .read = x86_msix_read,
> +    .write = x86_msix_write,
> +};

I don't see the need to add x86_ prefixes to static functions while
you're moving them. Provided any of this is really x86-specific in
the first place.

> +void vpci_msix_arch_register(struct vpci_msix *msix, struct domain *d)
> +{
> +    if ( list_empty(&d->arch.hvm.msix_tables) )
> +        register_mmio_handler(d, &vpci_msix_table_ops);

This is perhaps the only thing which I could see would better live
in arch-specific code.

> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -20,10 +20,10 @@
>  #include <xen/iocap.h>
>  #include <xen/keyhandler.h>
>  #include <xen/pfn.h>
> +#include <xen/msi.h>
>  #include <asm/io.h>
>  #include <asm/smp.h>
>  #include <asm/desc.h>
> -#include <asm/msi.h>

Just like you do here and elsewhere, ...

> --- a/xen/drivers/passthrough/amd/iommu.h
> +++ b/xen/drivers/passthrough/amd/iommu.h
> @@ -26,6 +26,7 @@
>  #include <xen/tasklet.h>
>  #include <xen/sched.h>
>  #include <xen/domain_page.h>
> +#include <xen/msi.h>
>  
>  #include <asm/msi.h>

... I think you want to remove this now redundant #include as well.

> --- a/xen/include/xen/msi.h
> +++ b/xen/include/xen/msi.h
> @@ -3,6 +3,34 @@
>  
>  #include <xen/pci.h>
>  
> +#define msi_control_reg(base)       (base + PCI_MSI_FLAGS)
> +#define msi_lower_address_reg(base) (base + PCI_MSI_ADDRESS_LO)
> +#define msi_upper_address_reg(base) (base + PCI_MSI_ADDRESS_HI)
> +#define msi_data_reg(base, is64bit) \
> +	( (is64bit) ? (base) + PCI_MSI_DATA_64 : (base) + PCI_MSI_DATA_32 )
> +#define msi_mask_bits_reg(base, is64bit) \
> +	( (is64bit) ? (base) + PCI_MSI_MASK_BIT : (base) + PCI_MSI_MASK_BIT - 4)
> +#define msi_pending_bits_reg(base, is64bit) \
> +	( (is64bit) ? (base) + PCI_MSI_MASK_BIT + 4 : (base) + PCI_MSI_MASK_BIT)
> +#define msi_disable(control)        control &= ~PCI_MSI_FLAGS_ENABLE
> +#define multi_msi_capable(control) \
> +	(1 << ((control & PCI_MSI_FLAGS_QMASK) >> 1))
> +#define multi_msi_enable(control, num) \
> +	control |= (((fls(num) - 1) << 4) & PCI_MSI_FLAGS_QSIZE);
> +#define is_64bit_address(control)   (!!(control & PCI_MSI_FLAGS_64BIT))
> +#define is_mask_bit_support(control)    (!!(control & PCI_MSI_FLAGS_MASKBIT))
> +#define msi_enable(control, num) multi_msi_enable(control, num); \
> +	control |= PCI_MSI_FLAGS_ENABLE
> +
> +#define msix_control_reg(base)      (base + PCI_MSIX_FLAGS)
> +#define msix_table_offset_reg(base) (base + PCI_MSIX_TABLE)
> +#define msix_pba_offset_reg(base)   (base + PCI_MSIX_PBA)
> +#define msix_enable(control)        control |= PCI_MSIX_FLAGS_ENABLE
> +#define msix_disable(control)       control &= ~PCI_MSIX_FLAGS_ENABLE
> +#define msix_table_size(control)    ((control & PCI_MSIX_FLAGS_QSIZE)+1)
> +#define msix_unmask(address)        (address & ~PCI_MSIX_VECTOR_BITMASK)
> +#define msix_mask(address)          (address | PCI_MSIX_VECTOR_BITMASK)

Why did you put these not ...

>  #ifdef CONFIG_HAS_PCI_MSI

.. below here?

Also the movement of these is quite the opposite of what the title
says. IOW this likely wants to be a separate change.

Jan


