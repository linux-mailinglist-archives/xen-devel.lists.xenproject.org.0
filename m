Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC755582467
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 12:33:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376032.608605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGeLO-0002j0-3N; Wed, 27 Jul 2022 10:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376032.608605; Wed, 27 Jul 2022 10:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGeLO-0002gY-0j; Wed, 27 Jul 2022 10:32:46 +0000
Received: by outflank-mailman (input) for mailman id 376032;
 Wed, 27 Jul 2022 10:32:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGeLL-0002gS-UD
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 10:32:43 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50041.outbound.protection.outlook.com [40.107.5.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71fc4593-0d97-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 12:32:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB5392.eurprd04.prod.outlook.com (2603:10a6:803:cb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Wed, 27 Jul
 2022 10:32:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Wed, 27 Jul 2022
 10:32:39 +0000
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
X-Inumbo-ID: 71fc4593-0d97-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IzmlCq5U2F/9pysmYUatCBhPj0ttkqX68ym0Gx0Gol5Hl9HsQTxZ68yyRdo4y7hh3HBVejzNqaNueKgWAlf5Ubs8/tUZldi1/CvteovyT81T+gccv4Fy9jxjPcBFQ7MhxQLDiBxcra7P7dnnO8XK6GbhwdVf2S32pcgnmCcgsk0BNjI+6Ej186duWCCE6BbkTmVpwo0Z8LX2S4CdHhXefya0moCOriJR1VeXjFwOF4id19aNL19JHh9PN7VT68gMOSRuJQ8ZDDmeZGlU+LUBG8yxlPRBr0W+TPJCDthcr2CPD/w0Gq4GKOhm7mAd3K5lpxnG2zOdcygLbEbs6JsW/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjtxdT6/eZ9e59bZ9i80obumBGxdA+CdvBsaCdcuZUg=;
 b=MnRimjRhDFwxxdKQ6q8ssYRcFJz3AW/CV/8TEObIUHLD1YA0Ze8urBqPGDlogs7kZlUay18lUzsHkY3mp1nR6CBIoCKETHOZjfpQA5KeSHOEFnCES+jm/1HZjzqAGPt45WWmdMtrt0OSS6BmYyDZI/Hs1JseEEwqWg/EdDCBrKciSdpTT1oS0kWxIgbHijPYMJVJnGNUfBg28/79MBLfUOHgG0CX2GfNKQv0osWoRSdc8SqIc9hvcnbjNeXWo831z7PO4O93Oed+tzkz68a7H6RFmTm8jm3TkrAE7IM9rw26lHR5o7HC3PMUmY/2wm+MzFwZwaXSCkXMgLE5bH7jww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjtxdT6/eZ9e59bZ9i80obumBGxdA+CdvBsaCdcuZUg=;
 b=df07r2QK32X/tTGglgzQvHgHmTiT1o6UGbx9ZG5PoHt5CVT6ePDG43P5BqPM6fFGTQQUts0w0cM2o+klMiPpcOdjPXca9K7qIjoguj1RqnU2vWlas1v5YVtnuv4pT1vulMnHclCgxBrRE25QLDTVrRmT3MBXoE0M7ziIMTInPv46pIpabVFcxde4iyz8BJXVaa43Afv89KOg6/1bp+hRBEKAGT5EzSYKEXXKboVXOS2XmivPCHJAgOxr5awuTDo6XUlc1NuVC9sFNEuKhmRi6i7iSgNUmUznZHWm3/cgyK4m8l9Bo6HcFLN4gVHIxMldM2ygzXVp5hKxfBGzIhVPVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3b3dd7bf-b528-b7ab-aec9-c912a30d9cd0@suse.com>
Date: Wed, 27 Jul 2022 12:32:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 09/11] vpci: add initial support for virtual PCI bus
 topology
Content-Language: en-US
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-10-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220719174253.541965-10-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0053.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4be9db88-5df6-4829-170b-08da6fbb545b
X-MS-TrafficTypeDiagnostic: VI1PR04MB5392:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZCwV2+X9+tqzn3TgmtJLDFDCXuQv82Rl7DWSsDEtVV7+iPVdWoa602FQnRhuTBSPq48HEeIxbKnwesgjWXRtl/VuxcxIBE6K9VBqjCiK+RdysPkM0mWC59z+1vgBarmdwlFDRvwwqa6Xo5wU9p0q237cfUTRNQHc10wlaXjLpieXr/TZl7jg4PX7uQnfTbh9ACmP87PBDkFAZiq9G19qlylvLWh2TB+Rvl5WIupkxzf4BYR5CL27wtcrTdEcB8j4mEOFnvazWcTuaT1e2jDbFRblG+CZJygNpiGUVRph1Fa5fECSnLDL1GHBHQSPuMcgAjVjY0cFiOFQyZNDXKehMN3RfPsgLiuz0u1MDTLgS+IUpFIr8poJ+dF0IsdbmyC4k2pTXoVJofUwEh8NBpPe6CYU9dw0amL0T37fFcHdymQARvyfpZgFhyoYoX5zOtO7PQaHY9kUHiVCeDWECYrJeVyFjIDTz0fMGAbDkYVgt65t4A5gXiKpxSwRrlaZeeU9gATNaoEdkmpXBlq1gr5DOxEKzwIbTQSTrVYmFrt+M9dNQmH+EA/ElMNbux2lKR7dJpFTCmOfCtUqjNywN7TSD0weP4DY70ShVNaB4ZIDooNdiKK8fMSYE3LEJWSuVEKH8zm94jdCCEHqGdwvxtfyGR2G2hz7oEr+tDsgfzPzffF4MKEJjgV9txB2V5xYFelSr/9Uir5hJ9AfqiXVvrFAsidats+SELNZk0UVVJoghNVSOxq/JHEOrStaQbCPbVqq7I93f1t5c7BhT29CRHSmc7EODA6ZoS79YRy68bhVdj2K4dPmeMFGIvwNDEgOcv/9sNFUKyAyvh4g7DqyRXJn3Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(346002)(396003)(39860400002)(376002)(8936002)(31686004)(5660300002)(66556008)(38100700002)(36756003)(54906003)(31696002)(316002)(66476007)(86362001)(6916009)(66946007)(4326008)(8676002)(2906002)(41300700001)(53546011)(6506007)(2616005)(6512007)(478600001)(6486002)(26005)(83380400001)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnVsQ3Q4VlJRUkhDLzV4QW1SOFE4dWx1cytLc1h0UXlVOXBJN0xQK0Zla1Nx?=
 =?utf-8?B?ZG1UWUJCQWRjWWxwNjZwenNLNGlNb1lJK1hEQVd0aDJuV3N5QUx6K3UyTjFG?=
 =?utf-8?B?L2JIMk5qbUVZMDRIOFp6SE1zS1FsYmZ2Um84T3Y5dXZKMGlFZk1ORXBObmJo?=
 =?utf-8?B?c05iWmlidDlFZTc1eExhMzZPQnVLWWtZdWFSbERsdkVWb2JHd01kcFpnME0v?=
 =?utf-8?B?cGMvNHZJKzhMemNFcit5c083WldVSkw0dU52bnVoVllkeXRRNmtqc1JPZU4r?=
 =?utf-8?B?RzNramFzbzZTM01RR2VhTUdiQjZ0WG1CT28yNXNIdWcxOUtxejV4Q1JaYzdz?=
 =?utf-8?B?djVpUTVCbVAwM2Y1TEJDaGNzQUVzUU5xd2FvS0hzVGVuWXRZdUdhQUo4dU1u?=
 =?utf-8?B?RHJUbVR4emFpNThWQlI0ZTVybEVPSXp1d1FDcm15VU13UXhITkYwcUtpa2lC?=
 =?utf-8?B?NEQ0S1NwVkI0eUFDUVE5aXRBb1JUWldFdUZFN3Q0dGVQaTRsU1p1WFFZSm5G?=
 =?utf-8?B?NzJHSGpwS1k0enRDdlVuM2F3UHNRRElRM1E3cGRWTiswNHNWcUlJL01WTS9q?=
 =?utf-8?B?TVJ3amtJVlB5RTF0bk9vNGZOdCtIMjNncjErV0hhT0tzcGxiUWxVMWRwYjR2?=
 =?utf-8?B?N2hIZCtnc1RBQTZJRnlseFdNN3kvWXhDOHJNSW9DTXBDeDZlbkRHdGlkMjF3?=
 =?utf-8?B?RTZGQWZHa29aMWZSMDVkVUJVRTFLbjRlNWUvQXNMeUY1QmhYUXlhRUdnK3Nu?=
 =?utf-8?B?RVdvYmdZOWNIT0h0U3VYMHkrcnQySVVqNlJLTGRzRkYyRTF1Y2xneTBwMjNQ?=
 =?utf-8?B?RGN3K2VyRWJNUmdKTGRpVGVJWDdLQzlUdUtzdW5ITzBHcVZSUEZML3UvQ1FV?=
 =?utf-8?B?WVBRRnV3SDJUWUxuam13OFM3ZUZWa2NjRWhNTmxiSGtidzFYWEFSc0VrQldT?=
 =?utf-8?B?WllFdFhBcVFSM2sxT1VIQi9yV2hBTUJQUG1Lc3pxYk9WZExYSkRhazQwYm1N?=
 =?utf-8?B?NlBZdXpIdE9mYWpXYWJNS3J0K0luaDNlRVdvZzR1NCtJNTUreEU0cC9NQ0Rl?=
 =?utf-8?B?dUdEOTIwOUJDMUtTUDAwdENEQXg1TjRkWTg5QVZqZGI0bmxFcGEvdDFJeVcz?=
 =?utf-8?B?RXBicWtDQTY2R2l4a29kZDNsbThGai9VWFhqZWk0Tzl6ZFJaZk5NWkpFSjVV?=
 =?utf-8?B?cVY5eTI1THhYTmh4WFU3R2l2dnFVUzlvMEhKL3RhTHVyTU1zWjkwc1cwSkVH?=
 =?utf-8?B?WnVHelJITGJlbXYwQUZoTGFRZktZdGpTQnVVb1lTY0ZmTC9HR1lUMjhZNzVx?=
 =?utf-8?B?a1hjdUZTZTdGQUJkRndHc1h6dzZ4bmJuVDc2Q3BHZVQyUnRsNkF3c1UrMnpl?=
 =?utf-8?B?NmtEREtkNjl0RW9rWUhVMEo2N3pwbXNxY0xXTUt3TTk3YlZJcTAySjNSRXl6?=
 =?utf-8?B?ZTFKeCtMbEhrcHRQeEVaTWhoa3JMbVU4KzdMY2sybjNFcE9pbVU4ZDVsS1F5?=
 =?utf-8?B?bC9aNFdHRkl5ZThoZzNDUUZtaG1NRU1hUHdvNVBLemtGWGEzdzlBOE9XSUY0?=
 =?utf-8?B?ejlsSEpnZVdneStBSWtKZm55YThrZ1QwUHdxM1lyVDlRM09TQTRMdVQvOUkz?=
 =?utf-8?B?bGtScE5zcEJDM3pLdm5NaXBUSldoY3BsQ096VzBVcGtRZzVjdmFxRmI4aS9B?=
 =?utf-8?B?eFZjb2M4dEhxeExDZmVhaURqOTcvSWZocVpXS282U292V1RRdXhPK1hkUHNH?=
 =?utf-8?B?ZFpsNHNJcnVaa0lvZjkwU0lYdkV2NW5QczNGa0ZkV1FWcy9yQ1hWQ2R1c2o2?=
 =?utf-8?B?Q1hXSGhPV2Y1T2VwRUlsRzl3d0l6SjJGQVBYRlhGUC9PSG5YbkcycjVQWGtV?=
 =?utf-8?B?VkVEQWkxQnBHanN3ak1XaS82UEFCU2ptMU5zSEZTcXNwR3VyZkQ0aXFEQk9F?=
 =?utf-8?B?VDhnZWxhTkVDNVd5cUx1elhwb3o2eVl2RWtIRnkrWEQ1bjVOcWQ0bEhKQ2VG?=
 =?utf-8?B?S0N2T05md2tqQ0hiMlRUdDFFNG9raVJVOGJmUnhFdXkwd1JGUkwrLytyZWdl?=
 =?utf-8?B?dTM1aUYvU3ZpMUNGQnFIU1NnUzVYdlpCclJvZnhLNm1JSlJaNTRpMnNOcmVx?=
 =?utf-8?Q?RZaV7EdbXj6iU0FRQHN1mJRMY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be9db88-5df6-4829-170b-08da6fbb545b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 10:32:39.4919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WVXaY/9kX/SAMaYEpKP6c31CC8zxqV465ygOLAvuSQ+oUr8I/KINq/+BNGDNoAwB/xOXZWp6Eh7VIIQQsijXbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5392

On 19.07.2022 19:42, Oleksandr Tyshchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Assign SBDF to the PCI devices being passed through with bus 0.
> The resulting topology is where PCIe devices reside on the bus 0 of the
> root complex itself (embedded endpoints).
> This implementation is limited to 32 devices which are allowed on
> a single PCI bus.
> 
> Please note, that at the moment only function 0 of a multifunction
> device can be passed through.

I've not been able to spot where this restriction is being enforced -
can you please point me at the respective code?

> @@ -99,6 +102,62 @@ int vpci_add_handlers(struct pci_dev *pdev)
>  }
>  
>  #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +static int add_virtual_device(struct pci_dev *pdev)
> +{
> +    struct domain *d = pdev->domain;
> +    pci_sbdf_t sbdf = { 0 };
> +    unsigned long new_dev_number;
> +
> +    if ( is_hardware_domain(d) )
> +        return 0;
> +
> +    ASSERT(pcidevs_write_locked());
> +
> +    /*
> +     * Each PCI bus supports 32 devices/slots at max or up to 256 when
> +     * there are multi-function ones which are not yet supported.
> +     */
> +    if ( pdev->info.is_extfn )
> +    {
> +        gdprintk(XENLOG_ERR, "%pp: only function 0 passthrough supported\n",
> +                 &pdev->sbdf);
> +        return -EOPNOTSUPP;
> +    }
> +
> +    new_dev_number = find_first_zero_bit(d->vpci_dev_assigned_map,
> +                                         VPCI_MAX_VIRT_DEV);
> +    if ( new_dev_number >= VPCI_MAX_VIRT_DEV )
> +        return -ENOSPC;
> +
> +    __set_bit(new_dev_number, &d->vpci_dev_assigned_map);
> +
> +    /*
> +     * Both segment and bus number are 0:
> +     *  - we emulate a single host bridge for the guest, e.g. segment 0
> +     *  - with bus 0 the virtual devices are seen as embedded
> +     *    endpoints behind the root complex
> +     *
> +     * TODO: add support for multi-function devices.
> +     */
> +    sbdf.devfn = PCI_DEVFN(new_dev_number, 0);
> +    pdev->vpci->guest_sbdf = sbdf;
> +
> +    return 0;
> +
> +}
> +
> +static void vpci_remove_virtual_device(const struct pci_dev *pdev)
> +{
> +    ASSERT(pcidevs_write_locked());
> +
> +    if ( pdev->vpci )
> +    {
> +        __clear_bit(pdev->vpci->guest_sbdf.dev,
> +                    &pdev->domain->vpci_dev_assigned_map);
> +        pdev->vpci->guest_sbdf.sbdf = ~0;
> +    }
> +}

Feels like I did comment on this before: When ...

> @@ -111,8 +170,16 @@ int vpci_assign_device(struct pci_dev *pdev)
>  
>      rc = vpci_add_handlers(pdev);
>      if ( rc )
> -        vpci_deassign_device(pdev);
> +        goto fail;

... this path is taken and hence ...

> +    rc = add_virtual_device(pdev);

... this is bypassed, ...

> +    if ( rc )
> +        goto fail;
> +
> +    return 0;
>  
> + fail:
> +    vpci_deassign_device(pdev);

... the function here will see guest_sbdf still as ~0, while pdev->vpci
is non-NULL. Therefore mistakenly bit 31 of vpci_dev_assigned_map will
be cleared.

> @@ -124,6 +191,7 @@ void vpci_deassign_device(struct pci_dev *pdev)
>      if ( !has_vpci(pdev->domain) )
>          return;
>  
> +    vpci_remove_virtual_device(pdev);
>      vpci_remove_device(pdev);
>  }

And other call sites of vpci_remove_device() do not have a need of
cleaning up guest_sbdf / vpci_dev_assigned_map? IOW I wonder if it
wouldn't be better to have vpci_remove_device() do this as well
(retaining - see my comment on the earlier patch) the simple aliasing
of vpci_deassign_device() to vpci_remove_device()).

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -457,6 +457,14 @@ struct domain
>  
>  #ifdef CONFIG_HAS_PCI
>      struct list_head pdev_list;
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +    /*
> +     * The bitmap which shows which device numbers are already used by the
> +     * virtual PCI bus topology and is used to assign a unique SBDF to the
> +     * next passed through virtual PCI device.
> +     */
> +    DECLARE_BITMAP(vpci_dev_assigned_map, VPCI_MAX_VIRT_DEV);
> +#endif
>  #endif

Hmm, yet another reason to keep sched.h including vpci.h, which
imo would better be dropped - sched.h already has way too many
dependencies. (Just a remark, not strictly a request to change
anything.)

Jan

