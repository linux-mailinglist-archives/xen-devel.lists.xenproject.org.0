Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1C86D45AB
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 15:25:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517446.802765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjKBG-0002XB-Jq; Mon, 03 Apr 2023 13:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517446.802765; Mon, 03 Apr 2023 13:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjKBG-0002Uf-Ge; Mon, 03 Apr 2023 13:25:06 +0000
Received: by outflank-mailman (input) for mailman id 517446;
 Mon, 03 Apr 2023 13:25:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dypz=72=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjKBE-0002UZ-Ot
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 13:25:04 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f08920c2-d222-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 15:25:03 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8401.eurprd04.prod.outlook.com (2603:10a6:20b:3f3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.30; Mon, 3 Apr
 2023 13:25:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 13:25:00 +0000
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
X-Inumbo-ID: f08920c2-d222-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BkLheGfPYrqgJ+vKyithgeLT5qTRmEiqg82FBguVCvfHKpQROcZikyMZfZvXK9aYcuvcCLd0eoBx98mdCMzCY/Mw5CwnCY8qLpeWDj4CVWK95kUDsLw10dFtvkzpOMj5m5cuzhIX+4UFMX29Lqvy3uL/A9DcXU+WvJ/b3K6XLPew9ClsGcw7vH9I4KfcwWJouUNPOKat1O0sE05xrP4Wliie7iF4snl9IcEzNuxPIzsDm68b/T9yi3Ui9i2/AXt36ewRQa0bU4WFCyVQPJV6etVCADUIhEcScTm00o4njaKc1TaB7qaAo4FZ6WFJK8mu5S9G0sUHCilE9hsDFLvSzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeO9WlffdyqbjvDDnpxR+pBUtbwT2GBSWRHSi5bAjnM=;
 b=HpvVtyGveNfjn83dfVWcJzzLN0mhOjzzeOs7XZLS2xhwvAE/14y6IR3cp1UKbFRAKxAX6vOg6Oz7NtTWbun9X3uXsAYgKk2kP4UjUAjPf6K0VK2bf3amimhcrmwfSKTtBDR4IJiyYJH3fJPgfJbypJr60vXdbtDLmWG1sL0Axn1bhyBZCALdoiXIhCniol6iiHABUyt8OFfXmRPYTf2jA9h6FLZp1VULNmkpIAiHE12VDOJw2r9qygftcUK2UnTwz70vPRVgeEyiPyQjvc+XfASH5AaX3tLrvzhCWjvM4AW38aDMyxJhejrzTfCF04v07NOxRIuqw8TD3KhVep14jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeO9WlffdyqbjvDDnpxR+pBUtbwT2GBSWRHSi5bAjnM=;
 b=15XQ/Z5fb3e0Y5ixpPR5JVkxKQ0pjp8H1f/Xt3hPpuAcWqlNjcMmQ+WyaRDcCJg01DwsW0JewPbvfroMqLiqmS8/bv+ej9uanmzrlZAth+BQk6h6iLS601GU4qMNrTy7wCgpK7SDd5gw5R9MV6kONheVLfImx1BEIZyqmvj7y9rqMNK5TcDblcMC+gACrfXn9640jh7du8swUxZs7NyVvveSBVzLFD/YLUV7Ys0aJUDrm5/1oAVGXPDoekGE81f0Q0d4GaDfaq5lcJOGltsJZT6SDrcZqVBqWi4AaV/phcy1nxKx48nFb8kVnbor/kQgCCC+nN/Ydok7ZB4EMbLAMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <335f22be-cd5b-8cc9-cd9a-25caa59df384@suse.com>
Date: Mon, 3 Apr 2023 15:24:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] x86/pci: Correct ECS handling with CF8/CFC emulation
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230331175719.500285-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230331175719.500285-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8401:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ce922e6-ce49-4487-c185-08db3446d32a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FQW0XosH6c+FLTUzXEPvaFjd7gZ4f74cp+aemhMqSgkP+7gpMbak7kpNYzTzxoz6PxrP8LCovvhmNBDFH0PPA0p3M1w3lRPqS3ZWUXraqipBKjf1Fpdr77FChtXN7nEWBYDQO8QesMKTyShvLy4ASM5XcRv/wA13Ps5K5mkX2AYYvfxWDKMuAwO60EEyQOWHsdMPgmOVTqs6AoKWw6RQsDhAZsGkJA+Fk3vFfmDv9G90T04vfvLkfMb4VzGwR56BDweEM/LByV/pKu8bNrqE3r3p/brCesW8xCzDxp9Yr7g7lFguBQ/KqtVyq01ruG5hv5fWljs7mhHKdX312BeB7mopla6zHLol6ZtGdmc3mVok49md0/qaBMsjsvf87wLkR+j9/6OK1uBH1IqDyoEKcSs5Z5tJHrpdmePMqe8HjR6HKZh1W4WvoHjPcboT7nIMpXiWnZ+4FBobtUxaLKeR1HWy4/fX+lRx00pD8hWOy25X/3P/kEeTRJBVO8Tq9c+Wvhz7ysx+TyV8CZZY+pFNeddCDCOsRCSH+1T2TkkMk6ZzlnyjlK3EDS79bseh3wNQm/UuMmI7/c+njUo3xnESUxa1yFaHQZAFK9Uxjkfpa3JJetj/rglYxgv5dAXBikPKid3v4mb0zTtOTwaIpnQIHw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199021)(31696002)(86362001)(36756003)(2906002)(66899021)(31686004)(2616005)(53546011)(83380400001)(186003)(26005)(6506007)(6486002)(6512007)(6916009)(4326008)(8676002)(66476007)(478600001)(66556008)(66946007)(41300700001)(38100700002)(5660300002)(54906003)(316002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHBBbFF2TU8wemdTSUN4TmFVeHJrd0pVSkRBYWZrYWU1ajUwQzFlK1N0anIr?=
 =?utf-8?B?NW92RjEyQ25nNE1tc2gweEpYUWdINHQ4S2hiQzRkUmtRWENWbTdlRFVRSitu?=
 =?utf-8?B?NFF0MmxYMExBNVZMamg0UHUxMmkrTHkvaVhKcEY5V0pRMk9JaVlkZlQvbEkz?=
 =?utf-8?B?M0d5Z1p0WVVJK0VoVm0zNTlCZndtNUpYUmxPR0YyZ1lSYWVRYi80L3N2TlNp?=
 =?utf-8?B?enp6bTRzTWIvb3BBaXFQbkowQzZQR2RRTGZnaUpJRzlaL01mZ2dyUXM3K3lW?=
 =?utf-8?B?YlkvaytRNWFtY2I4UE5lczA4VjBNRkhHVFVuQVFjdDZ3c3laeE9vdEJpaitF?=
 =?utf-8?B?UUlQNi9mOVVhblNNTEJYeWptSDA1eDRDRHhSVVhsdDVaOGEvM1pYVm9kdUNQ?=
 =?utf-8?B?V2R5RDZPZVRtQXUvdDZ6Z0dQR0tCSTl0U3ZvdjErUmxpbWF3K1J0V1hFR3dE?=
 =?utf-8?B?R1FRQVBSaUxZWHFPR2I5b25jdEk2QjUwbXBPYWtTY0VpYmhsM0haZ1JsRkF4?=
 =?utf-8?B?TWxTYldUWmlOMkR0OVZzRDBObnFHSnd0U2Rra0xWNkl5TlBvZzE0MnIxRlls?=
 =?utf-8?B?b0FTbzA4aDZVUDZUcE5uSTZpL3ZVbVVJSUZJck9kcHh0STRES2V4cDZubXFS?=
 =?utf-8?B?NmtwTEZUUXFET1pSb0NVcTR4ckR4VUNUVGhHZGl3cVArQkc4ZEEvNk1XNVlz?=
 =?utf-8?B?aXltbHVKbTNKM0N0b3lzQWx4RnlzZVhJaVhjR3hwL25DUDY1aDQ5enp1Mm4r?=
 =?utf-8?B?RlhtaTBwaEozeWJOT0RZY0pmNUx3NDFjL0thZVA0NkhyLzlNamQrdkxDdHhh?=
 =?utf-8?B?MVpXR3hvSURkSHhmR1RncUU3WGZwRnk2YitjdWF0OTMvUlhYMUl4b2hRY2FQ?=
 =?utf-8?B?Vm1pZWdtWWRyYlMvSVM5RHlIVTFQWEhOakpOdXRrOHFpZlBXSXdsR21GMUt6?=
 =?utf-8?B?cjU3cTVZaGFRVjBaY296OS92emFBNlRVcG5VZnJ3MGpNbGoybXdCa1gzM3pF?=
 =?utf-8?B?Vi9icmJLbVI5R1FtL1YwZkZHWXZ4QWQxa1JyR25LclljNXZLTWQxM1l3WnM4?=
 =?utf-8?B?bHVCbWVRMzZWRjdKbkJKVXZRYU9ScEVha1dmKzNidDF1RVVtdDJSQTBSdU81?=
 =?utf-8?B?ODg5TkpaSnltQk1yTE5LbDFhQlc5dHBoa3ZXMDN5UmhmdWNoRnIzZnliUlJ2?=
 =?utf-8?B?SmU4K0xMOS9wOEFacnVZTDU1TlZxcEpYUjlDTDVVODJSNzE3TmVKcUxGaGs2?=
 =?utf-8?B?NXR3NVAwcTUwbXZJNHB1cEhNVE5LdHdLQjZvT2lsajNvTGxGOC85SmFEN0Ur?=
 =?utf-8?B?RnFpeUhSc0wwcFZ3b05FR0VBeGtQdENJNGZ3UlJVMmJLMEdMU01UYTJWUk5L?=
 =?utf-8?B?dWxqZmFJT0xPWDM1bmdidHFXU2doZGJ5U0ZhV0ZCaWVDQUpqRWZrNE1seCtL?=
 =?utf-8?B?b3NMYXhlZUk3TWlnNUFrNkRGRXU1UEw2YUtLOHMvRDFyOUtCNXlhQ1pWb2ZM?=
 =?utf-8?B?Zk5CazN6MXR4KzVKT09aQWorYmI0T0YzcjRJeWNTRDQ2WWpRMWhleFhOMEVx?=
 =?utf-8?B?YzdvMUVTYXk2bzZrUVNRdTdyaE1aQ0prdTlBeS9KVUZkTGFDWWQvWnFiNkZG?=
 =?utf-8?B?YlFDYmxJeHVqRUQ5NUViaHN4UVdoVDF2RDlSelRlTk1rUDVldEpPQW9OR0hX?=
 =?utf-8?B?Sm9EKy9MZW9RblQ0QS9sNzJ6OW55ZnRXUXJhOG1heWk0aGpGelpvZG1ySGxL?=
 =?utf-8?B?QW8zcFQrMnB5QjNKdzdrcWVlMEpKbGN3L042Q2wybzJyMEpPTTI1dFJaaEY4?=
 =?utf-8?B?ZDRic3Z0MzhsM2o0aGNUcStlL3h3N1hwZHJuRTcwQyt4dWVEUC9yN01FYjRF?=
 =?utf-8?B?OExKbWduUW4vUjhQTGFJZXR2Z0gxVHNiVHhFaDlNYlIyR01zWVFZcHBVS214?=
 =?utf-8?B?QTFPbWwzVUZtSlRLZWd0elpiUGk3WnJiS2NMOUZKaDFDNEp2S09zYkQxYXJo?=
 =?utf-8?B?b3kvbnpTNUhKc1Yycm5kNkovaE9BTTlCU3RpNGNHd3dzWG9PUVRYUHlnN2JP?=
 =?utf-8?B?SVQvZkJ5U09CQmx6REJIbis4TlBsOWlIdy9wNDF6WDNRL2QyTUZVSUo0c08r?=
 =?utf-8?Q?I1n2P5S2cykPoHOgWAlkwJ6XW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce922e6-ce49-4487-c185-08db3446d32a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 13:25:00.1373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: de7B4H82wFl3h/rW8gLX1j/6assKAje5uzQLUXLySFSnFxl1M1aw0iHidTwIX7HFpxbgNLFWKYpLYDj7VYHjOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8401

On 31.03.2023 19:57, Andrew Cooper wrote:
> This started by noticing the dubious Fam17h check in
> arch_ioreq_server_get_type_addr(), and then realising that checking the host
> CF8_EXT setting is utterly bogus for the guest <-> qemu emulation path.
> 
> What should be consulted here is the guest's MSR_AMD64_NB_CFG setting, but a)
> there isn't one, and b) the vestigial remnants of the cross-vendor migration
> logic cause MSR_AMD64_NB_CFG to be unconditionally read-as-zero, making the
> CF8_EXT path unused by any suitably-written OS in the first place.
> 
> MSR_AMD64_NB_CFG really has been removed on Fam17h (it's now just a read-zero,
> write-discard stub), and the ECS extension is unconditionally active, meaning
> it is not correct for Xen to ignore the ExtRegNo field on newer AMD CPUs.

I don't buy "unconditionally active". Whether to enable this by default is
up to firmware; I view it as not unlikely that some firmware actually have
a setup control for it. Fam17 controls it through D1[8-F]F4x044:0, while
Fam19 has D1[8-F]F0xC00:0 for this purpose. (I've had a work item for quite
some time to actually make use of this bit to enable ECS.)

> It turns out that Xen did even have this behaviour in 4.5 and earlier, with
> this problematic CF8_EXT checking being added in 4.6.  Therefore, revert back
> to Xen's older behaviour - it is objectively less wrong than the current
> logic.
> 
> While fixing this, get rid of hvm_pci_decode_addr() - it is more complicated
> to follow (and to call) than using the CF8* macros in the calling context.
> Rename CF8_ADDR() to CF8_REG() to better describe what it does, and write a
> comment explaining all about CF8/CFC accesses.
> 
> There's one rare case when CF8_EXT is visible to guests, and that is for a
> pinned hwdom.  Right now, we permit such a dom0 to modify the CF8_EXT bit, but
> this seems like a very unwise idea.  Leave a TODO for people to consider.
> 
> Fixes: e0fbf3bf9871 ("x86/AMD: correct certain Fam17 checks")

Therefore I'm not convinced this Fixes: tag is warranted.

> Fixes: 2d67a7a4d37a ("x86: synchronize PCI config space access decoding")

I'm also curious which particular aspect of that change you are considering
to be fixed here.

Your claim about behavior being reserved is perhaps okay as far as hardware
is concerned, but by removing the checks you e.g. misguide
xsm_pci_config_permission() in case it handles certain register ranges
specially. Dealing with that was, according to the description, one of the
purposes of the commit above (it's been long enough, so I can only go from
the description in git).

> --- a/xen/arch/x86/hvm/io.c
> +++ b/xen/arch/x86/hvm/io.c
> @@ -248,20 +248,6 @@ void register_g2m_portio_handler(struct domain *d)
>      handler->ops = &g2m_portio_ops;
>  }
>  
> -unsigned int hvm_pci_decode_addr(unsigned int cf8, unsigned int addr,
> -                                 pci_sbdf_t *sbdf)
> -{
> -    ASSERT(CF8_ENABLED(cf8));
> -
> -    sbdf->bdf = CF8_BDF(cf8);
> -    sbdf->seg = 0;
> -    /*
> -     * NB: the lower 2 bits of the register address are fetched from the
> -     * offset into the 0xcfc register when reading/writing to it.
> -     */
> -    return CF8_ADDR_LO(cf8) | (addr & 3);
> -}

I have to admit that I'm surprised that you fold replacing of this
function (purely mechanical afaict) into a change with a significant
functional change. Wouldn't you agree that this may better be split off?

> @@ -1104,6 +1092,11 @@ static int cf_check write_msr(
>          if ( !is_hwdom_pinned_vcpu(curr) )
>              return X86EMUL_OKAY;
>          if ( (rdmsr_safe(MSR_AMD64_NB_CFG, temp) != 0) ||
> +             /*
> +              * TODO: this is broken.  What happens when dom0 is pinned but
> +              * can't see the full system?  CF8_EXT probably ought to be a
> +              * Xen-owned setting, and made symmetric across the system.
> +              */
>               ((val ^ temp) & ~(1ULL << AMD64_NB_CFG_CF8_EXT_ENABLE_BIT)) )
>              goto invalid;
>          if ( wrmsr_safe(MSR_AMD64_NB_CFG, val) == 0 )

What do you mean by "can't see the full system"? Originally Linux used
only the MSR view of the bit to enable ECS, but this was specifically
extended to prefer the PCI config space view instead (24d9b70b8c67
"x86: Use PCI method for enabling AMD extended config space before MSR
method").

Since here we're dealing with the MSR flavor, and since Linux shouldn't
be using this anymore (due to checking whether the bit is clear before
trying to set it), we may be okay with simply purging this code if we
don't care about very old Linux Dom0 anymore (or if we use your
argument of it not reliably affecting the entire system).

As to the setting becoming Xen-owned: Dom0 being responsible for
(almost) all of PCI, it would be somewhat odd to take away from it this
level of control.

Jan

