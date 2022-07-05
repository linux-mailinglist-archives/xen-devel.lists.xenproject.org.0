Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A998C56715E
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 16:43:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361369.590845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8jll-0001Wl-O0; Tue, 05 Jul 2022 14:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361369.590845; Tue, 05 Jul 2022 14:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8jll-0001Th-K0; Tue, 05 Jul 2022 14:43:17 +0000
Received: by outflank-mailman (input) for mailman id 361369;
 Tue, 05 Jul 2022 14:43:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8jlk-0001Tb-9z
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 14:43:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2057.outbound.protection.outlook.com [40.107.20.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccfb711b-fc70-11ec-924f-1f966e50362f;
 Tue, 05 Jul 2022 16:43:15 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0401MB2679.eurprd04.prod.outlook.com (2603:10a6:4:37::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 14:43:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 14:43:13 +0000
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
X-Inumbo-ID: ccfb711b-fc70-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aT+7HhVuN/Xz/HIiTazpDcHfZi9UFl3EM3GhboQfeDGiOKLGa0AC2EO5/Zz9AZQ4L+A/1JrNzj8drDhGE2Ch0Wd9EMJJwuoQpvPfb0Lau4gqfDrv7gzfZ1rvQcvLDHAc+5rcotk4c4SF8tLC5puwELyrk3Lkhlg7vChnMzSuZ4ifor5GFX+aVOaw2J9NDzEB5rafXnmWkIDe0Gnf7b8MCyIZDFvksAmhmoWQq8/6BBIccdM+ZpfwAL3+LwtcXiuLEDPsk9NHyTusvODHYv5OPwkEp+U+TYszdTP5jUTxsPeAMzJfoXEipbe+BCzGCkSeHUYcaVrp0qjNXrjd8sdKhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHav9Rzph42TTthl8M1E87db8TxT+IIpSGpqcppw/h0=;
 b=dEgpqXV3LbbI+h+loyd3V4OXnZv6JDtQqFjVd4we8U6eseLfMe3jG5vy057QyejKTIsZsuG0jpkuhdma29KKHp/GxR29UAURpurBD6ZUIRfXbUzyHSfc/U93XujT1VecZ2e0JDVW3KdZEPHFgBatK7dBGgpxtbGBL1cTVebb28rSq4avzE6awV/eblfp2wcD/h1mqhsTTwy24Za6jsB3bGrtHAA2rhPxVcaraR0qLyDUL4MN0apThHiOY0SmMHGAzDBC2xMDiF9ujMVVYYtqgUYPj/VYl2WfFyueLg72dmoaLn4QrcpYaoftno6rNJL6tYLCK/Fm1NPGGvtwAyygcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHav9Rzph42TTthl8M1E87db8TxT+IIpSGpqcppw/h0=;
 b=oqMW0OwhGSOWe+ufCLiTLZalXuSxM9WmANAvv2vi5Oc9sG9SSZCEOUpuwnGCwENKJs6KdqTH1OEp4XaRHSXLIM7uK1js/kxwsN87Vj39VjRJOJfmHzepGMjAQ/x36slj176x3PdMIMIUmJe7veRyUYgFSB08mHUFoOTOc8Lk24xcKDidPvKza0kE9T1tjQ8Ss8juZq+838QP7VA5WcA2jxTsr6/WH8OJ/EM1190id3B1tB2a7V/oL0uvyLNgjCrp1Z6w+SNNuZVYQwgrBbJsRxMsFV4RzCRi/gzICVZ6r7VaSQA8TpdHkmIf9bP5Xo02chixC9Yrdz9kZlrqvF1o0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9a581989-074d-fb31-5bc2-81fd4366cd68@suse.com>
Date: Tue, 5 Jul 2022 16:43:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH RFC 5/6] amd/iommu: atomically update remapping entries
 when possible
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20220421132114.35118-1-roger.pau@citrix.com>
 <20220421132114.35118-6-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220421132114.35118-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5P194CA0021.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::31) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 720054c4-17c9-4c99-acf5-08da5e94b00e
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2679:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oWpeUrR4WNrmmARVYTQbyCd7tLypdkUEUYuRjOualfx7RZi7k8II17HKXtbSB4T6uelouT6CRy0Pks2z5tYAyevzEmx3G/VR4LpymYqlghXAOOqiDdfbiGF5DP5wiLQqurJMVqVHbI10t1sNol/9fvAxTZqZwzVWaAk2JsZwOUsTSmkJS2MQENBKO5FP7SysVb4WeBNpD/J+YTHTt1G8gOdCzPAywRMJXY96pesJ7Ek3qD0Qqlt+p5zW38F3+QSg8nNL+Kn6O03kWslHmlHilPEaytxTciGkFZRN4HabQs7xX1+/rI4DzhHIKnJgMuO4r13auXXf2e7EesQGVoSEg9Fm9t7r0CkpVzwW8EDsNrUl7tnE40Evk0ohsd2uqIAIBE+oZYYd/KbRsvwYsWsMPxo51WbZ7Ps2I7WocEOCusBMw0v4eqfg1L2w8QUwXc3n2g+kOibQrIva83eAjWi8FLt8JgSlFSiAn4oc9+j/a9/Fuf0bStXS+p1WUjxmf+lYcxG+rDY8nTbggn4FE24BITG8ahG1B64a5GNhu4i5azjH2bWA99QVPu4kBKJevzb6SHNlqnIxvQZUsZ+6g4/B8s8yiOVWXWM2VyKFLXqmydG59oVg35k0YuI8gYQOhTuE6pDC5pfnXSvC1Exr2Acgx32vd5g34ETpYe1JrMGNHqHOGmfWOJoRrhrTnqqd7D8UnCyaNNwgUO5g829wTVsN1M8MdX8XKbyQnVnolmyCUAG8MQUBOsMHOMZzCNo0ofuVT+h/UnSyVDDLK74sZWN3S/UxfZzuHiSaiVmjYWtNt7dQCQ5iUJqR1xbnfqacMNYSBP74/soVWKiNyDZhzfPNR2R3BWWpfu4Ex+eBAZbsm3w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(396003)(376002)(346002)(136003)(6916009)(86362001)(31696002)(4326008)(15650500001)(5660300002)(8936002)(38100700002)(316002)(8676002)(66476007)(66946007)(66556008)(2906002)(6506007)(36756003)(83380400001)(31686004)(53546011)(26005)(186003)(6512007)(41300700001)(2616005)(6486002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFR2NTVraTVnT0VFcU9QRkdoSlYzRHlFcjZhSHRXZzBZY1Fudmo5N2dXbVdu?=
 =?utf-8?B?QUNTK3NGK2JycXZla09QcDZpcUhiN20yN3MrWG4wVzNHcFNNMHFQSnMrOEM0?=
 =?utf-8?B?N2h5WnNkWFBYUithamM2SmFFbkMwckQ3SjJyb3p2b3FCeWo4YWJnZTgrNGhn?=
 =?utf-8?B?NXBNSkUzeU1IdjBZOCswZ0krV2NWaHRhUTM2NS82ci9iWmEvam52bUIyQXp0?=
 =?utf-8?B?alJ2aW1nWTNWMERLOFgvRkM4M3hsWDBzUk9hWGp1QzRiRTVRbGNqY0xJbTd2?=
 =?utf-8?B?TzRsSHhtV2hFRnhGR1RRWVlTc0JnazlkZlBZNnljcW80UGFxWTR2MTVBb0tE?=
 =?utf-8?B?UWR5KzNDaUlCUDU3S2E5WWFXKzQ1QmU0WERUM2dQVHBqMy85dUtUc0s2Z05v?=
 =?utf-8?B?RzIxMHovM0ozSHgwUFl0SXQ1UXFsb3krNVkzcjJ5WFhNVkt6UWoxLy9UeTNi?=
 =?utf-8?B?SXZaMlpjUnpRd2VjaEFBYXFZampyaTRjc1B6R1hpUTFBbE1LSHVaZVlzaDh6?=
 =?utf-8?B?NUpjcFZBemdpNmwwcm9KTGtDNHVZc1dLR2FsZUYzL2NOWXU3bTdmTlNEMFM5?=
 =?utf-8?B?RVAva0t1Rk0ra3I1a2h4dHlybVRBeTNDMUZKU3ZHSmpkSkhqMTVpK1ZWT1Fs?=
 =?utf-8?B?TzBRS0t0NXI2MjFpNUZCcitVeVJNVEVsMXZuRExGQVZzOXlER2ZLWVVtbW1R?=
 =?utf-8?B?SVNRbVZwV01LMi9sendhYVMvcnE1dmtjSWRMTWVIZExCdXllRDFTcnZTTmtO?=
 =?utf-8?B?MlFjWVVJSm56UEo1QXpVVUhtdFN3Q3o0OTVwbzhjTDlldGhocXJvTXpJa2FZ?=
 =?utf-8?B?VVpWS3I5QnpWbENSWTF0WVN0UW5YMXQ3SjBoTWV6MytxL0tQRU80U1lFWjBs?=
 =?utf-8?B?SXdnNTVmdkhxaUpYQlF6TTZjK29RWjRLOUhTZHhjakowZHg5a20zdUdHdW1J?=
 =?utf-8?B?U0p6TGthN0lZNVhvZlBBazMrUnBUREZZSDBEUGl2OG9oVkRTMGFuZ2J4Q1hr?=
 =?utf-8?B?YWxIc3l5ZTdIakl6d2xvS3lmaXJHS2FuYXBPYlczREdLd1BhdEpEZXRHTDZJ?=
 =?utf-8?B?VXFTY3BTNWtvdzdlR0NZUHlrVnBSbU9CYUN6a0RnMHdZQzdkSkdZTzhGV1NW?=
 =?utf-8?B?dUJjdDl3aTZ3YlUzRmZ5WWZ2aUk4L1NqNUlqWlVTd3EyaVVramtaMXVieGxn?=
 =?utf-8?B?ZkxkaHg5bHkzY3Rla0cwcUVFcldQTElVUWM5TWd6RGM0ZkhhcWNINXVjcGI2?=
 =?utf-8?B?blJhRDJUL3NvR3NZaGdzMkRKbEUvTFg3a2FkK1BFWlhlYWNjWS9Zc0VmUjNr?=
 =?utf-8?B?REFuTDNBUFNMOXdES1I4Um5LQlBhUVJpY2FiRTRsZWJHV2lWL2VoYnhpZTlU?=
 =?utf-8?B?K2FEWUlUOWVTcEZHUjlJek14aG1aUEJQNGtJZkpoUjBiUlpuRzZJUjk5d1N1?=
 =?utf-8?B?TWpRYkxqd3BWMXFQWFV4RlIwd0drNWw0bUtxcmRLL0J1NUMvUVZsMDRPVWMy?=
 =?utf-8?B?bVVSZGxwQU40QVJWOUxPNVI5aTE2SjVNTmZSeEZSd29KeVVodmtPRnFWSEF1?=
 =?utf-8?B?NVQ1SitINmtVeUFBbUJzbWJPTFZVcDQ2enBnVjdMRWJuVHhvV3EvTmtyLytE?=
 =?utf-8?B?ZHE0Si9rMVVzQXBmUThaanlKUGxRLzFkVjYybUp0bmYyRndKZEgxdk9VdjhX?=
 =?utf-8?B?NDhTditiQ1dBN0RROXJ2cnJ1QkVGcjBFa2lsQWo2d015VmVWdVJXUUFGUjRO?=
 =?utf-8?B?T3owOFhxWnVTNFN6VUZvMm5mWDNKSStaU1lDTndsNEtxYjYvZGJLYWVYMGxN?=
 =?utf-8?B?TDJTUFJUSHJTSzlFNWtxOHZjME9HRjVhN09BblRRR0Fncm1ScnJ6OUlmQmxX?=
 =?utf-8?B?YmIxU01iLzRISFhRMElURTF0bjVPdGJoNk1aUDB5Q3k0dUtCS3RiK2VZVTVQ?=
 =?utf-8?B?ZE45Z3o2d1EzeFJxOGlEWmVhQ0dJSE9FUXMrQ1d1VEdLSkVZdytBODR0V3NU?=
 =?utf-8?B?UkJIaXZzK0w1bHJhYXJQZ0YzUW91bS84bTVFMEtVV1FRUktzSlNpZkFjM3dR?=
 =?utf-8?B?TzJnN0xzcUt2eU9Ca0N2L0ZSMXJJQk9GSTdDY21sUUdCdzV3c3VzUmFtWmty?=
 =?utf-8?Q?RRKNpDijJab0gV/HamPT6n3IZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 720054c4-17c9-4c99-acf5-08da5e94b00e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 14:43:12.9675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wecfie/ruYVWGu4d7crLS26RUlB/GQVhZIMRvfR4vE5Xqz4bBU8t/eU3yqq0zXDR0+MU2iiKQrDSRrsrv2nyXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2679

On 21.04.2022 15:21, Roger Pau Monne wrote:
> @@ -366,8 +383,11 @@ void cf_check amd_iommu_ioapic_update_ire(
>          fresh = true;
>      }
>  
> -    /* mask the interrupt while we change the intremap table */
> -    if ( !saved_mask )
> +    /*
> +     * Mask the interrupt while we change the intremap table if it can't be
> +     * done atomically.
> +     */
> +    if ( !saved_mask && !cpu_has_cx16 && iommu->ctrl.ga_en )
>      {
>          old_rte.mask = 1;
>          __ioapic_write_entry(apic, pin, true, old_rte);
> @@ -383,6 +403,11 @@ void cf_check amd_iommu_ioapic_update_ire(
>          /* Keep the entry masked. */
>          printk(XENLOG_ERR "Remapping IO-APIC %#x pin %u failed (%d)\n",
>                 IO_APIC_ID(apic), pin, rc);
> +        if ( !saved_mask && (cpu_has_cx16 || !iommu->ctrl.ga_en) )
> +        {
> +            old_rte.mask = 1;
> +            __ioapic_write_entry(apic, pin, true, old_rte);
> +        }
>          return;
>      }

Iirc you have a question about this (wrt differing VT-d behavior)
elsewhere. I'm not convinced of this masking. I could see it as a
measure to prevent damage if an update was done partially, but I
don't see such being possible here. Hence to me it would look more
logical if the entry was simply left as is, leaving it to the
caller to correctly deal with the failure. But of course that
would first require telling the caller about the failure ...

Jan

