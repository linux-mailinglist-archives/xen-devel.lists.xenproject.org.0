Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F5D75B329
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 17:40:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566672.885814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMVlg-0002zT-Pq; Thu, 20 Jul 2023 15:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566672.885814; Thu, 20 Jul 2023 15:40:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMVlg-0002xY-MA; Thu, 20 Jul 2023 15:40:40 +0000
Received: by outflank-mailman (input) for mailman id 566672;
 Thu, 20 Jul 2023 15:40:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMVle-0002xE-Mq
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 15:40:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c45904a1-2713-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 17:40:35 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB6792.eurprd04.prod.outlook.com (2603:10a6:20b:dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Thu, 20 Jul
 2023 15:40:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 15:40:32 +0000
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
X-Inumbo-ID: c45904a1-2713-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1jeyl3RxZTUyEokcxIDkqPuPtdPDQ2udbRJcXTS/btmeP/CuiG4DlFVLO1ltaDm5tcb6/UfW6UNSeweBamtzZnPqpNQQxIi8aXj5MFAeIvHK7JRWh5H773wSbWfhzhbSlMugiruP4NAzwOZUvx36IkylB5yhRC9YTLuVAUwGRqU1U6LG7TryiMjfEOCYQR68738X0ifGyyDScDhqUBiqJylYXMUIxx3AR+Y2VqN8AWsXrqkeDINyto3LyIc6/0q88djVEukR9LnRFF2LkIOyd3G18OgjkJ3tH4DRHqOGBMKjPMu4IedsmygGwZtq5SWTpSOwXva6WJn9CBwNn6BVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmmzDOu0Vlix94xgqi+e57VnoUNgKBhEydsZNYZ3n80=;
 b=INej2mkd6XRTjYBxqKILPGDoJVNNBzX0OLbxdoq0ozbn7iL52d68bQHtIXyBOlzJaZaOFd/TBdo3JRIVQ770A1TzAEdFeWHqA2GHVrWvaAj4yWPzVroMJFGCfQPVTlWV5ky8ktye0wZ4pSk2C2iy4z8XptgJoriQizMpiO0mjzY4MdsXrtL8XhYJ6pDFvrM+G0X497NY87LiwNVSYtLE/3mxk2nRPx7uN9FRaSZJqEsHSKrI+qpGz5TRtvB6ReikVWneIwvz6YgK5qp+AG5B34VXqvl3rkJoKzsihz4XOTMSh4cZCzLQ1EQAvXTRH7NQ0HaPQYCfxVsvzWw2ja4rTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmmzDOu0Vlix94xgqi+e57VnoUNgKBhEydsZNYZ3n80=;
 b=Djn3AtmOH7JuCMrFQWiHpoLutbgGl/DTqeG2Fo8K6CpEvVKbvaNbGtGKOtHVjLcOX0pDtCUtWOStol0QjJYOGF4wzkUsBWtsf99yMdaUX0/MBbnuxmIh621hEim4qgAYGXnI9gQY2pfAhUe+Fxkem0LRxr6m0FR4RJ+njzoWRr+HK2PemPpKbNIdZRh+KgmWDClQeeQ3y2Bk1lkYi+v+Zf6X+tJFo1Wa3pvZCfxzDm605QhYnMJK59j2mlRShnje9451lt1/O0vkSlkBNUPjzpeL551YerdOW6C63BR0F0Fft8YkvDG7RW3TFWdeyNDoM/weNcHZkTSk3tJgb1THow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b6375b17-7922-66ea-88fd-697fa759f96a@suse.com>
Date: Thu, 20 Jul 2023 17:40:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 01/13] pci: introduce per-domain PCI rwlock
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-2-volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230720003205.1828537-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0203.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB6792:EE_
X-MS-Office365-Filtering-Correlation-Id: 499f9e51-51e5-44b2-81db-08db8937a774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WErXWaQ6vLcMEfvWwnhg5zxn8Q8GwxLX2Ui1z9wVJkdu6Na8WhM4nWZMmkKg17x9yDcidEm8NfIsJxKQGh2icHYcUPCmbvWyc0if15pHeIrwhGaeWGs2prLVZHcADAWtn6D55ILprk8F1L93161SFKNDh9jh0rFicaQ38oO6M1W2zgTP2uCh1JDZx61S5aRkcC3fVvlke/6pI+lgd5Uvq6fvUPLMUBfPmhOn/cm1/b2k7jwR8YBERAVnOz85XmxC3/JFBlM73L3B1ZaPdM3UnJ/cp6WV6WkpPWDcyy1hB1TC7vbQTFlPgWjoXIwdN1GsIYwILylocebKTFfEeqv0tqmnSdr51OxosqkbP0QrLV9Qca+hF70388hu76A82HADPwWQs40u/hPYVczAErR5I0maWXA1w4SVVkFhMHNcGgjJZrMLCfn7M+f3uFoY228qpmtlwCw6xUvZtfB6BO8st2JX63ml9rAtNN0rWpTTaj0rXZ3peYzdyXjdQYrTo4EaYWVHvAwFlemJER0rUtLPburQG8zsBoADRzOabxtYi+2nPaUQLRa1uT02WF8zzUH3g6GpyPtJOgPX/6VCI5s93TVNOXMJwYYqmiauT4TPl9042Y50qxrcgqvHvn5X+FfewesLzJ6n2Kq3PBkzD1FQug==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(396003)(376002)(346002)(39860400002)(451199021)(6512007)(66476007)(26005)(186003)(6916009)(66556008)(66946007)(316002)(4326008)(6486002)(41300700001)(53546011)(6506007)(5660300002)(54906003)(31686004)(478600001)(8936002)(8676002)(2616005)(83380400001)(2906002)(38100700002)(31696002)(36756003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3VIb2FnM2ZoT2Z5a3IwU3hzTU5CZXl3ZzcxWnFMWDNiV3hMR092cjVlYWxH?=
 =?utf-8?B?aUd2aGV5TVcwKzlURWUyRWMwZnFoTUV0ajRMTGZsMHdjVjZOam1WWURIeUpV?=
 =?utf-8?B?R2tLVlI0Uk5SRWFic2N1dDFzY0ZINDJPUWE1T0xEQUN3Y2p4M000YjB0akJa?=
 =?utf-8?B?blJVcTNFYzNLMFlHN0ZDSms3RHllL3RDMzhqTGpuRGdCVG9JeGhHM1M0RzBs?=
 =?utf-8?B?Qi9xeEl2ZmVpVHVVR2VOcVJDQ0RCTllpM2owTUVnUjFlNE5FN0w3VEs4dkRI?=
 =?utf-8?B?M0UxV3phQXlRZTYweEMzZlBWOXZkYW1qRHgrTnJoTnRSYmVzbUtkOGpGMStS?=
 =?utf-8?B?Ry9PZXFiWjdzMHhiRWRSZFByM2ZXYWMzUnk0dHQrRFgvUmt5REF0UFFtbVFY?=
 =?utf-8?B?b3BQU2VUeEI1MWc1U2pETjlaUGd0MWxrcVloWlFYTldRWUN1OHJsalo4a1Rs?=
 =?utf-8?B?d2FKUXUyK3FIM29Qb3AvN2tqc3IwRFU2OHkreEo4UHJCRElXcG9kSVRKZkdt?=
 =?utf-8?B?UWJ3TXU5L1NWa3V5TEtWMVBMVmZsdS85WlZscUlBODJMZEx3cFA5bTAybSt3?=
 =?utf-8?B?V0htWUxDSUtYSFYva1I0VFdpKzFRVVdabkZwM0FyRjZqUmtGRS83d1JsV0Zr?=
 =?utf-8?B?cXlRVzFUTkdBalpQZ3Fld1VEM25jVVUxZTFqTFUwTkdFWWJOQVZuMFdiRDFN?=
 =?utf-8?B?MWZSSEZQTmFtLzM0OS9sRmFhOWtXSzdZSkJwSTJ1cXZIWWJHa3dUbDZjbk5L?=
 =?utf-8?B?cmVTbUNCMFhZeTRxSTZFalFmWDNpRWJlSmVwdEU4bjB2N2hDa3Z0U2E2cG8w?=
 =?utf-8?B?ajhzZVEwZzF6dVFBWVYrVVoyb0JnMmdxSVJoeXc0SEQxK3ExWmFtVzNNaHFY?=
 =?utf-8?B?dExVTTBmTThINm1pWVdSTFJWOERZemNLZXdmVzJsNWd5K1NQVFZVRXdvUVNl?=
 =?utf-8?B?WFVINUJWODI3U05PWEh5MmtsaStlNHpWT1lMa0lBb0U1NnlvYzhRaTZNdGd1?=
 =?utf-8?B?M2RCaXlwUHR1UnRxY2RxOUFNc2s5bmlySkRjam92c0cxQUt6WTgzU3NWRTBH?=
 =?utf-8?B?QVE5TWtNcThLMUVsaUlxREg2aGRZYk1WSjZqc0pqMWVSWnFuWERSOWZXZ0hX?=
 =?utf-8?B?UEJzR09vY0s4dkRwTS9qcTdkT1NXUENaVEM0ZnF2ejU2VS9odjBFQk5hUzJ4?=
 =?utf-8?B?MVRsZHJERWdMWDEzR29DcVFsSUwyd253ejhmRzJRaUFLenFXNHNSMUIvOVV2?=
 =?utf-8?B?K2lpeHM2SE1SeGNJazdxUWcwdlNMOGlBZGF5dHpDZDVNOXlrbzZVZlF4V1Qy?=
 =?utf-8?B?L3NDaDNzRUlaeWhLMUs3OGRFdDViV1pLdm44d0VmWk9jRWFPLzhJclVRd3dC?=
 =?utf-8?B?aXVSdDhwQ240MmxmT1phOW1KNERaekcrR3MwYmMrU25jWlJnaUVsUkp6VEVS?=
 =?utf-8?B?dzYvWVFsOVR0OEVVQktjVkVOYXVDdU5nZysvUENsSzNlM1ZmNysxZXdib2RS?=
 =?utf-8?B?akc2R1ZHc3JBTWlwTGx4TlJBOU9tckRTaCtYWFJmaEN4RWlaNU1BR3RvVXB6?=
 =?utf-8?B?VjNYdGtOd085TkxueGhRZ1dnN1VyVWJheEJzMzM5Y2hDemhPZ0RycXI5a0Iz?=
 =?utf-8?B?M29Qc3dEcllwVmJxYzZocDVKRDBaMFNxai9uc0Z2REVqa0FEOTk4TnJTenhx?=
 =?utf-8?B?S2tTb2M2SGJNZGdCWkNzKzZvbndRbmE3V2dJWkQ4elZ0RSs4SkhuQklNcEJH?=
 =?utf-8?B?MXkyNjVxbnBpeHAvdnVEb0VGTTQzSUtkUGlSV05kbUovK0JSNjYyS1N0LzZt?=
 =?utf-8?B?bGZ2RlNIRUVvMHhPNHFwOVNlM3Q4d3lBYjJ2MlByVWd4ckZ3aklBaEV6eFVk?=
 =?utf-8?B?N21wY0pOM0xmTWtDY2d6ckU0bnRHeDNZWnZJRDdzL2Nrak10UWlWWWtOek5O?=
 =?utf-8?B?aUNCVlREblJYTjVIOEhQbFBxb0cxL2hyeloyejNweHd4enRLb1VKT2NML1Bj?=
 =?utf-8?B?cHNDbFpXU3ZrcFVQL1JYc0swb0tld0ZPeGp6NTkxWlkybWpRUjhhY21iRUxM?=
 =?utf-8?B?SEJ3M1lPY1Nnblk5TW4vcDdZeDl1WENXT2ZPNTdCWjhWRUdGM3l3N081QXBa?=
 =?utf-8?Q?mgC7jm9/kgZYSBi787ivtk808?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 499f9e51-51e5-44b2-81db-08db8937a774
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 15:40:32.9619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Jr40OP6fgJ0fQhDCDYQzNalwMF/3t3Zt7EFNomON0RLt4Ctp8Sw58/Kp+pntQ3uHkN8rPO1DQ/nObUnHM9p9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6792

On 20.07.2023 02:32, Volodymyr Babchuk wrote:
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -476,8 +476,13 @@ static int cf_check reassign_device(
>  
>      if ( devfn == pdev->devfn && pdev->domain != target )
>      {
> -        list_move(&pdev->domain_list, &target->pdev_list);
> -        pdev->domain = target;
> +        write_lock(&pdev->domain->pci_lock);
> +        list_del(&pdev->domain_list);
> +        write_unlock(&pdev->domain->pci_lock);

As mentioned on an earlier version, perhaps better (cheaper) to use
"source" here? (Same in VT-d code then.)

> @@ -747,6 +749,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>      ret = 0;
>      if ( !pdev->domain )
>      {
> +        write_lock(&hardware_domain->pci_lock);
>          pdev->domain = hardware_domain;
>          list_add(&pdev->domain_list, &hardware_domain->pdev_list);
>  
> @@ -760,6 +763,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>              printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
>              list_del(&pdev->domain_list);
>              pdev->domain = NULL;
> +            write_unlock(&hardware_domain->pci_lock);
>              goto out;

In addition to Roger's comments about locking scope: In a case like this
one it would probably also be good to move the printk() out of the locked
area. It can be slow, after all.

Question is why you have this wide a locked area here in the first place:
Don't you need to hold the lock just across the two list operations (but
not in between)?

> @@ -887,26 +895,62 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>  
>  int pci_release_devices(struct domain *d)
>  {
> -    struct pci_dev *pdev, *tmp;
> -    u8 bus, devfn;
> -    int ret;
> +    int combined_ret;
> +    LIST_HEAD(failed_pdevs);
>  
>      pcidevs_lock();
> -    ret = arch_pci_clean_pirqs(d);
> -    if ( ret )
> +    write_lock(&d->pci_lock);
> +    combined_ret = arch_pci_clean_pirqs(d);
> +    if ( combined_ret )
>      {
>          pcidevs_unlock();
> -        return ret;
> +        write_unlock(&d->pci_lock);
> +        return combined_ret;
>      }
> -    list_for_each_entry_safe ( pdev, tmp, &d->pdev_list, domain_list )
> +
> +    while ( !list_empty(&d->pdev_list) )
>      {
> -        bus = pdev->bus;
> -        devfn = pdev->devfn;
> -        ret = deassign_device(d, pdev->seg, bus, devfn) ?: ret;
> +        struct pci_dev *pdev = list_first_entry(&d->pdev_list,
> +                                                struct pci_dev,
> +                                                domain_list);
> +        uint16_t seg = pdev->seg;
> +        uint8_t bus = pdev->bus;
> +        uint8_t devfn = pdev->devfn;
> +        int ret;
> +
> +        write_unlock(&d->pci_lock);
> +        ret = deassign_device(d, seg, bus, devfn);
> +        write_lock(&d->pci_lock);
> +        if ( ret )
> +        {
> +            bool still_present = false;
> +            const struct pci_dev *tmp;
> +
> +            /*
> +             * We need to check if deassign_device() left our pdev in
> +             * domain's list. As we dropped the lock, we can't be sure
> +             * that list wasn't permutated in some random way, so we
> +             * need to traverse the whole list.
> +             */
> +            for_each_pdev ( d, tmp )
> +            {
> +                if ( tmp == pdev )
> +                {
> +                    still_present = true;
> +                    break;
> +                }
> +            }
> +            if ( still_present )
> +                list_move(&pdev->domain_list, &failed_pdevs);

In order to retain original ordering on the resulting list, perhaps better
list_move_tail()?

Jan

