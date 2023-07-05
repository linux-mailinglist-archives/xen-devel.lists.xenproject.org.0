Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DCC747E01
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 09:12:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558814.873238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGwg1-0001QG-2a; Wed, 05 Jul 2023 07:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558814.873238; Wed, 05 Jul 2023 07:11:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGwg0-0001OZ-Vo; Wed, 05 Jul 2023 07:11:48 +0000
Received: by outflank-mailman (input) for mailman id 558814;
 Wed, 05 Jul 2023 07:11:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qGwg0-0001OT-0H
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 07:11:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2058.outbound.protection.outlook.com [40.107.7.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30fda8f6-1b03-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 09:11:41 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7607.eurprd04.prod.outlook.com (2603:10a6:20b:294::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 07:11:13 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 07:11:13 +0000
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
X-Inumbo-ID: 30fda8f6-1b03-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMeWZ27UYPf02Jvg6cjvMS9Gw/MsKy34gwmLqe1H/1/mtCt1KiUapERlUru94A4hM9MazFR9TRFZgNoU5mhdSgSVDAOrtY2J0xjxCgFc4J6vWvpHh+gKZOswrZ4QCl/RUwT/dvWfY3/g717MebHEj7nse/MY9lK3Co0ts7zsKs614ng8aMFhQZOGgUlLW7chjinpl7GA3VS9d3EcjwCW0quIWodrm7Gr/WBVpwy9dn4kZqpEROO+VaBMBzr+aQzo1gBgVzC0KSefUUv8nCJkVGQltP0DD07tOuSf51OgYPwwNkZiIVk0wpitafYTgpy0IhHmNLg+Spyd62HJmnlnHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuLVbEZtZ1EHxumkqm6EimDsQRKWUXczzKwW109ITuY=;
 b=dYjW2bb6h3HQFEGM08FdtAlQnwJVrKGnNKL5ylB2xEy+UGINeb48/UzTVW6qephe/KynZWA07pTWVKhFKIJUHNNzdnK7gGLTRFMKInLkRAlqnHw8G/VfDdeE/HlmRrTTA2QUiAU5jUdix/vcx3L2A6X5p2LlyvNb9mA3HrZPXStVvlOLE+QQpnnqNg55AjKRi4vLbnHtwYwjqHOY/buEnfpgzs9Nf3txWaXW26gOUdp/6ffrldXI1D7SPkBJGZPS8g90/4LECtJOUsiAY/0CtZxamfcYpPQjd7IjFx72t+eC0JzUWTKG4UDDpYIE4GG52naxLRfnH21xeO5fjn9rvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuLVbEZtZ1EHxumkqm6EimDsQRKWUXczzKwW109ITuY=;
 b=16X4xcj/u/TjqqnNCGXWA93PRKmVmImiE9imRbjydi1axSJX4qyrgq4SlMZmkcphAwmTOi7zTo0oWF8F7Iu9vomtFLu3f8EEQRKNoEqFOIXSXs2tGZ5GpAouqYW34esQFNt14TNnwikMztwf2g8VI+1Qh3DmHMPb175XOFptTh+g2lTIBIZSRDMngIKwYgdFCEiCF46vw7KxB1NVdk2yoD51WhnYUX0rosUf6GAJwu+BNLBfp8drqVPA9GIUno8HuIzUtzyy/7It/p9/8p57nXsu25eV+PluzIv2Ad1Lk+puKtUSpQuLgbUWzpa7XbAkPViJ6ps1Laxlexu8HztcEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ab79bcb6-6fc8-c68f-65bf-16ce7316c3ae@suse.com>
Date: Wed, 5 Jul 2023 09:11:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v7 01/12] vpci: introduce per-domain lock to protect vpci
 structure
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
 <20230613103159.524763-2-volodymyr_babchuk@epam.com>
 <ZIyOCan//39V3bdy@MacBook-Air-de-Roger.local> <87352kpj04.fsf@epam.com>
 <ZJQDGOrP1I3hR5Jj@MacBook-Air-de-Roger.local> <87ilbfnqmo.fsf@epam.com>
 <ZJVc77SwvyKOEdnJ@MacBook-Air-de-Roger.local> <87wmzfmltd.fsf@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87wmzfmltd.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7607:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a8e17fe-30ac-4e06-6fba-08db7d270440
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fJzxbh1AIhMPuymkWF203UGI6Vr2hmt0Q+Apc9nubamyD+D52JhSweadw2MhLDuWqoGgRS5FIhAk9eUz5S5djejB/7vnMHPLCJ8F9nhX+CWwSGvnuVcyqixfHcsFRWlLjwjNU/MUrgGFDhN1Mt9wJ3gPLyJkJGJUftFg/tOFwrZi4tkARffVFEYhln8kdUoiyqcelFKzCGPdOMPEssn/IMFZRIboq5/hOB/R8s2MOdObXgCaO6OwkBiMAORI+EPvmTWNz1H9xWqbML5vejLOgoyjSaxogOoBuI16D0nazfU7+WpiYDOUt+uveJxVxHZz/37F6YXOZ5egx5sHtorAm4nhFvK5MIw7e5TiYzKydP4I6uFHxPE9Fq4KlYMZIjCq2CmbtGvc17ARmRecYoqO2L2LAsArPIa2xqjPlXYbpW6kw7SBD/fSHxX54Hnr63hAlQUAVjVuwmcx3BAYsJwOxChsgrVVs/lNt0sbF/lZ1sbb3yNjm4Hsk2JkpGZIr6iIuY2u/kDv/eDLyR7JNu8l87HZbMHahy8Ame0Gky4ik7w8c4gf+ov0DcjGI8u6EFFkvz6XSYc5N3Rk5TkqGcE8acfspJ8QC4+eiJvnWPnzjQbpW9eiekKsENr+s9EVzaCpmGcyxn7KDlwYDDp0QZ+ilw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(136003)(396003)(346002)(39860400002)(451199021)(478600001)(54906003)(5660300002)(7416002)(8676002)(36756003)(8936002)(86362001)(2906002)(66556008)(38100700002)(66476007)(66946007)(6916009)(4326008)(31696002)(316002)(41300700001)(83380400001)(26005)(53546011)(31686004)(6506007)(2616005)(186003)(6512007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGxtaGNjYkc3NGhEYitDRTJvb0UxSTBuNDc0N2dzRTAyMVVCbUtGclNIQVVO?=
 =?utf-8?B?Qm1xYVVEem5XWDVzYUVCb0xia0YxTFVDYzZpblpGVy9VVkxXK2tWNFhibzd5?=
 =?utf-8?B?Vmh6em44RUltVHVuQWdNeEM3Zk5ZZThYVVIwd293S0hEWU9TY0pDbkhMc1BM?=
 =?utf-8?B?U200d2lPaTJGUHBnWVRseks3MUpKbFQ0VlBJb2RoRzdaNnlMejhnaldwWTZK?=
 =?utf-8?B?ZVptNE12UDFYWENRbHBFSjFwZk85QlRKK0FEZUNhRXJjVE5yR0lvUWVXbWVo?=
 =?utf-8?B?bGU1TUIzbGNLOUI2VVdxTU9FZEpINmljYWJZOXBCc2dwUmdHbHZMOE1jdCtU?=
 =?utf-8?B?VmZyUW5takorcnEwUlEwNnJqd2lnUmRLT1NUaGFPcmdhOHpsb2w0OW9NUWdG?=
 =?utf-8?B?VHJGTkllVlJmQTAwNGJ0bEcrTFZNZGVHNi8wUzJKaHcwRnNqNUZhVWtaMGdr?=
 =?utf-8?B?aGcwS3ZGcEF0WndjdGg1QU5xZHl6OGI4MDVnRUp0VCtva1lTUHd1djg4Zkd5?=
 =?utf-8?B?UUVvR284Uk5hcUxVell6R1M3YllGT3F5bGVCR2lnWGlpRXNBY29jSU8vc1Na?=
 =?utf-8?B?UFE1ZEI1UE5wTVBuclozbkN6ZnZvTkNoeE1PbzhOMGtla2Z0K3VhOGltWng4?=
 =?utf-8?B?c2VlVVg5QkFmcTVmbUVLcmJaMHZXV2dsNXRxNUVaaldRNzVQa2hyaUNSS3Vv?=
 =?utf-8?B?OFpOMzJVa2c2Wi9VbnE5cHBrN2tDRzQzdFRRRzVqZS91cHRPNUVnaFlLWHUx?=
 =?utf-8?B?WEUzbi94NDNzc0ZPajUzVkI2K3V0SzJwRWJIWGhiQWxxdGh3UHFwTGZiRXhR?=
 =?utf-8?B?b3l5Tnltb1JmbXRRN3F2QTJnY1ZVOGZjYjd1SjBXaUdnNkl3MmRoWlQ5MUpi?=
 =?utf-8?B?NFZGdjFFYUpsVi9TUW5NZ1NyWnlsVkEvOTg3M2JPNXhEZU1IdUFpK20rRGtU?=
 =?utf-8?B?N3ljQ3lsRjBldUVsTHFUNnhJMWZNNkVvWkJwcEV2Z1ZXN0o1Q0Z2WjJNNFN0?=
 =?utf-8?B?M0JzQkplcFQ4dnNyZU5XTEsxT2RybDBXdnMwQUgvcDcvd0RYS25QdXJFOWd2?=
 =?utf-8?B?Y3NqT2xlbzFFOHM1SUpTS3ovcTZqOFRjZUU5UDBMNGRCSUtOaFdjaDNUVkg4?=
 =?utf-8?B?empxME9JTTV3VlI3VSs3L1Z2NGZkNzZMMWJSenBPOWl6Q3VIcndkZ0cxdm1x?=
 =?utf-8?B?MllMeG9PRjkwbEJzYXhYTHFwZ0NhODNvTzd2MTdTT1BUNFlZSHgwNjU5L1FY?=
 =?utf-8?B?YkJOSXl0eDk2L0loSytiWDVGRXl1MC9hTFViejh3dnZzQWdsd0NrS3p3d3RJ?=
 =?utf-8?B?RTI4aEJOSHVieFB4UFhzU0p4bnlyNUZaZFlPakRZM2pSQlF2dEIydWNBMTJ5?=
 =?utf-8?B?R3ZuVzRkNnUxcC9TOWZoQ0JRUkxMQ3h1S3ZmZUE0QUQwTVpVU3QveVcwUzFJ?=
 =?utf-8?B?amZWU28va3ZQa0o1RlFuRzZubEhFNG14cFJnNThuclpGN3dKMjR0Q25NZWRD?=
 =?utf-8?B?RjhYTDU3NlIweDExalJQNnhPZ3NVellWdzZKUC95b3dGVUgzMWl3SXRLRnhj?=
 =?utf-8?B?TmNwN0tjSFlhQm90U0RUWXZxMVJrOUI2QlgvUm10YUNLVVBEMjdIOXFzemEx?=
 =?utf-8?B?bzErU01kY3dTSTRjd0FXczlnTDcvd1AvY0ZIZFJjQ2doN0loSzc3YUh3Vzc0?=
 =?utf-8?B?ZUJZNFM1N1VXSlQzQVBCdElMa1hDWkpZejlaVEozVmhMRElLU2VaYWR0d1JC?=
 =?utf-8?B?NHVOWG16enJMNTlpK1d1SDJHOXFXNmhTR2Y0aGZWSFpZREtOYzRoUjBUT1M1?=
 =?utf-8?B?ajJFRklkdGc4cnA2MWVwNDEwTzFBdmkwb1hTNm9LK3ZLRllQcWxGMnpTQi9r?=
 =?utf-8?B?NTFWS1hQanFCaUU0VDN1WDYrYVFOQytPWitEV3lNVkxkZGdVRGhqa3ZjK0Vi?=
 =?utf-8?B?Y1VlYU1TWTJQZjNQbGFUMHdOUWp0M2wzZHc1NFZyMGZESmxCTlFHQjZEMjdV?=
 =?utf-8?B?N0VQNXc4bk9tc0NaZ0xkSkFEcTFqSkc2SSs3aTF4TTB6Um5GZkdWS0FzWlFJ?=
 =?utf-8?B?ek42bnZkS2FCelI1V2dVMUdZNE93ZllwV1UrNXNQU3BEWmp4a01xa2dYM3Iv?=
 =?utf-8?Q?RPKJ4aLuB12O5bCUKXRu1f7oW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8e17fe-30ac-4e06-6fba-08db7d270440
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 07:11:13.3566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VCBelxgdfCpwStF+K+g+3vmUp2tl9+3s8C70E9jsPcDuJ7OyQsKJEWY3Mv81ji/Utst3FRBquJ85PALw/TAeZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7607

On 04.07.2023 23:03, Volodymyr Babchuk wrote:
> I am currently implementing your proposal (along with Jan's
> suggestions), but I am facing ABBA deadlock with IOMMU's
> reassign_device() call, which has this piece of code:
> 
>         list_move(&pdev->domain_list, &target->pdev_list);
> 
> My immediate change was:
> 
>         write_lock(&pdev->domain->pci_lock);
>         list_del(&pdev->domain_list);
>         write_unlock(&pdev->domain->pci_lock);
> 
>         write_lock(&target->pci_lock);
>         list_add(&pdev->domain_list, &target->pdev_list);
>         write_unlock(&target->pci_lock);
> 
> But this will not work because reassign_device is called from
> pci_release_devices() which iterates over d->pdev_list, so we need to
> take a d->pci_lock early.
> 
> Any suggestions on how to fix this? My idea is to remove a device from a
> list one at time:
> 
> int pci_release_devices(struct domain *d)
> {
>     struct pci_dev *pdev;
>     u8 bus, devfn;
>     int ret;
> 
>     pcidevs_lock();
>     write_lock(&d->pci_lock);
>     ret = arch_pci_clean_pirqs(d);
>     if ( ret )
>     {
>         pcidevs_unlock();
>         write_unlock(&d->pci_lock);
>         return ret;
>     }
> 
>     while ( !list_empty(&d->pdev_list) )
>     {
>         pdev = list_entry(&d->pdev_list, struct pci_dev, domain_list);
>         bus = pdev->bus;
>         devfn = pdev->devfn;
>         list_del(&pdev->domain_list);
>         write_unlock(&d->pci_lock);
>         ret = deassign_device(d, pdev->seg, bus, devfn) ?: ret;
>         write_lock(&d->pci_lock);

I think it needs doing almost like this, but with two more tweaks and
no list_del() right here (first and foremost to avoid needing to
figure whether removing early isn't going to subtly break anything;
see below for an error case that would end up with changed behavior):

    while ( !list_empty(&d->pdev_list) )
    {
        const struct pci_dev *pdev = list_first_entry(&d->pdev_list, struct pci_dev, domain_list);
        uint16_t seg = pdev->seg;
        uint8_t bus = pdev->bus;
        uint8_t devfn = pdev->devfn;

        write_unlock(&d->pci_lock);
        ret = deassign_device(d, seg, bus, devfn) ?: ret;
        write_lock(&d->pci_lock);
    }

One caveat though: The original list_for_each_entry_safe() guarantees
the loop to complete; your use of list_del() would guarantee that too,
but then the device wouldn't be on the list anymore if deassign_device()
failed. Therefore I guess you will need another local list where you
(temporarily) put all the devices which deassign_device() left on the
list, and which you would then move back to d->pdev_list after the loop
has finished. (Whether it is sufficient to inspect the list head to
determine whether the pdev is still on the list needs careful checking.)

Jan

