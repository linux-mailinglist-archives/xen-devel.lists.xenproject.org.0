Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F3C7464EF
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jul 2023 23:35:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558151.871996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGRCS-0002wQ-L2; Mon, 03 Jul 2023 21:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558151.871996; Mon, 03 Jul 2023 21:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGRCS-0002tv-I2; Mon, 03 Jul 2023 21:35:12 +0000
Received: by outflank-mailman (input) for mailman id 558151;
 Mon, 03 Jul 2023 21:35:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uKsj=CV=durham.ac.uk=m.a.young@srs-se1.protection.inumbo.net>)
 id 1qGRCQ-0002tO-WE
 for xen-devel@lists.xenproject.org; Mon, 03 Jul 2023 21:35:11 +0000
Received: from GBR01-CWL-obe.outbound.protection.outlook.com
 (mail-cwlgbr01on0704.outbound.protection.outlook.com
 [2a01:111:f400:fe14::704])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b3beade-19e9-11ee-8611-37d641c3527e;
 Mon, 03 Jul 2023 23:35:08 +0200 (CEST)
Received: from LO4P265MB6510.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2e3::9)
 by CWLP265MB6049.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.28; Mon, 3 Jul
 2023 21:35:06 +0000
Received: from LO4P265MB6510.GBRP265.PROD.OUTLOOK.COM
 ([fe80::4194:3a0a:fe99:688b]) by LO4P265MB6510.GBRP265.PROD.OUTLOOK.COM
 ([fe80::4194:3a0a:fe99:688b%5]) with mapi id 15.20.6544.024; Mon, 3 Jul 2023
 21:35:05 +0000
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
X-Inumbo-ID: 7b3beade-19e9-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQnY/7lZAsxwxYwJD0CNwOIdatVrHBaNJyNTQfXOxXvOBOnHEGnPrkQjcdMiH7mMkBuknubkqkJQux2qfp27yMmKGxYWqSEfJvzjTW/r6XkeZ91mKkQHlUNnTsosB0kqQXIOWA+DdJVtPaw+PDTiKV/7whlO4EFe7rnlIrP0NfevM5DgIzulmSHKiKSEtxRamcN9TkNE/nerDbmVX/JKza4RIVsSbhH2F0mfjcH7QwxILZMwEWuSCat8W1SSzSKKKDCZK09h87iesU5eCyZBTaj2AEhEUcac5HoqkUQt5hlWQXVOh4Kh7GDW/eUsf0UI4UdvsBBlLw783TjhqhM6MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ErmgjoGgjac2N22Sjh2+rFJmPgFzQoO2T9EDJXceqgY=;
 b=Eb4wTEasYBjQR+MfWmrThUqV5/l96Pgp+nRVxgzO+ZkXsf0tN+WeENo+kzCewr7h9TnuYOAhAEfNl6yQNr06O3Lz1BHmdcAHXADTNcu6MAfU+dugXlEP+kIl5IRaC5pG6+BiMnoAV3Yw4UMToidQgE+TIfkr3FP8GWEjmHlhQFVBub1GLucacaPLkkkdyzEalx8CK4DyJi4DDu31BJPwQouB/9fRsZ4ytSZLaiDFeRDSqjdRa5qEx8mi5xRJ8CSI+/I8zBnjsSoojYkABVgsB1FuTsKrcC3RWeguEXPmW3jRNHtoNJq4ge3MM6R9La/UpDWjO9hX2CKuFwUpc8DayA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=durham.ac.uk; dmarc=pass action=none header.from=durham.ac.uk;
 dkim=pass header.d=durham.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=durhamuniversity.onmicrosoft.com;
 s=selector2-durhamuniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ErmgjoGgjac2N22Sjh2+rFJmPgFzQoO2T9EDJXceqgY=;
 b=TA0Sbku1e/fCKP7m2u4D4bM932LJwWZ2wxFnx46q7sZqvQDGbHwj4EU5Dl/Nae5kUMbG3t7H21d/Ojc8H4Uy/6SO0089Usng+eKcZon2YMYUIDXbT6IrAwld1TU9l4PKNLJuDx0xWTDXT3yOsx3jbpPoGCofDSiYgE4wNnBhWnk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=durham.ac.uk;
Date: Mon, 3 Jul 2023 22:35:04 +0100 (BST)
From: Michael Young <m.a.young@durham.ac.uk>
To: Christopher Clark <christopher.w.clark@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Daniel Smith <dpsmith@apertussolutions.com>, stefano.stabellini@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Luca Fancellu <luca.fancellu@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Rich Persaud <persaur@gmail.com>
Subject: Re: [PATCH 10/10] x86 setup: refactor efi, pvh and multiboot
 entrypoints to new boot info
In-Reply-To: <20230701071835.41599-11-christopher.w.clark@gmail.com>
Message-ID: <1cc9dc44-e8ce-1a87-b5b8-12e9b4beea35@durham.ac.uk>
References: <20230701071835.41599-1-christopher.w.clark@gmail.com> <20230701071835.41599-11-christopher.w.clark@gmail.com>
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-ClientProxiedBy: LO0P265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::10) To LO4P265MB6510.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2e3::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO4P265MB6510:EE_|CWLP265MB6049:EE_
X-MS-Office365-Filtering-Correlation-Id: 3912cf9b-2c34-4294-030d-08db7c0d5df7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NuSjRQkIJwFnZsHHeHCuB5OBvVdD4i4WEwHWsA1hOTx8wrHbpVHu9pBoksC1Phr5OC8WMUBBB/4ChWsFuQCZsyrZs6P5OeBznJ7Rp5JxbFGooMKHnJfA4lvD3Or5Y6/8sDWU8G8NDX77uE4Xu/k2ulQiJp+1WFQeWjHB1TegqQ1tad6mssvsE6K8Ikxsh6f08GZVyKhLKXODl5WXBjZnUba5TOpoxNaIJpzn92nCY3KJDqpjXOFnKcFzQOG+yLzivHAJde6NhNeBAA6VpwB2+GpmPpZHQ4aYUFBWrrz6kSa+jdCJ7btfncRw8P0gnwlzQ5Px/J7MEJ8ALIKMJslEShE7O3Y09ZTZF3ERaiZwjXOqnHhz2jxQEqICZRuM6VpX2jVn+VeSB/mpzKo1zxcV8AWuoEHP/6+A7AWlh1A0DPzu3gbMdJkdVSPQI4f09Ooljh0x9gfvDy45B5SY8gKjiXFzQwQRpOpe56dOYT4crUxc1RzwD3S8voIXXJQ+LbY1S7eRVdJ8XvEAxXpfT17/srrdGdoQPEFr3lok9uBvSW/jNyNuf5cqjgNefH9UTcCmVsMGWD1cwHI98JB8PKg0vZkGpqQ9bdHCx8AZ9GWzsyvk8+AJa+qrHYTRLGW8tiXu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO4P265MB6510.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199021)(2906002)(41300700001)(5660300002)(8676002)(8936002)(7416002)(36756003)(86362001)(31696002)(186003)(2616005)(478600001)(6512007)(6506007)(31686004)(6486002)(316002)(786003)(4326008)(6916009)(66476007)(66556008)(66946007)(38100700002)(54906003)(83380400001)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KXSxlpXpFLMcgs4RyBHYNKYiRV5vBF0VUde0XeeDC8aVNii7riqonC3hLYHI?=
 =?us-ascii?Q?uo8AjgYaodm3BQqojoT5wU9rBhcf2u316paooAr00PR5JeHMEejttx2+nocj?=
 =?us-ascii?Q?1Lzyx68liaR9HM9v7KCFozM0p9RqSlBX3gxmVxj+W/PVN85vtj/MwtIKPTJN?=
 =?us-ascii?Q?cOIsxxVier3T6LqWLeti0hz8oBG/SFUl5e3dn1PFBHOwMmVgajSXew7PebCD?=
 =?us-ascii?Q?x5foDdLzxHJP/pci1k5BZKSGoAjALX/PSR6r03eVqqIG8BKFSAKs8VbQK3h0?=
 =?us-ascii?Q?IvqwJ6Cuitqc8pkiuqEsG0Gj936kF1CP54wX+IoNKXuwYks8AGWqLLV+AO3f?=
 =?us-ascii?Q?QcHcuRhyuPcea68o9i1ZU2Z/JU8cYG4Ruvpxnzb+8yIa38BIzODktTah65lq?=
 =?us-ascii?Q?ZiNymwkzlZD5sE68UaKdDLpjO+W0CpMuxtMkPZUfUPkPZ52WGGCnPnqWM4ZP?=
 =?us-ascii?Q?Y0Su9KHSicalBK3O6TIVZRUmQMD5a5lCD6FhMsSye4cyHBS7tqG++GG6QUzF?=
 =?us-ascii?Q?VboQsjzQuhDekdP26tnvknx6s5g6vv1RHoU2xR+PEJsm7S+rsSwFgoQuB+Y6?=
 =?us-ascii?Q?09IIXC0PTD3klZBPMunekqxALcbmF9tXQabegw66OimnQsetr5Cuxrd78Wb0?=
 =?us-ascii?Q?+du9ep/6+roSvAq0n7P7UuKBNavoyiDa1Mhaelhk5mW9rHNXApOFB3wJV/Fr?=
 =?us-ascii?Q?lceCRZ5Is4oOCy3hYaSt2DAxI2nxQLWDxlVg5JVyAl1PZPqYkimSUFTibDCC?=
 =?us-ascii?Q?eSJuwoKDygIvj/pj0UHEYfp8G0gnZ7NHJGarbn57DHhpKaKxFKbsAYJ8YkhV?=
 =?us-ascii?Q?mOPiD1k2y0olefDxWVBkELNCidh/U49f7U/6nltBWexev2aIIpW3+ZFr9Ep2?=
 =?us-ascii?Q?qpsi0QaEYPbSWqXhUZ4RGJ2fY+UO3M77EcGUyFiNME6wYGmFgKn+EII6kLpZ?=
 =?us-ascii?Q?YSqzfmoM6uitqsrNe3ZO0L3VtbRfEbxA/evfofkkn8AzjlTL2xSk0hDG1UmJ?=
 =?us-ascii?Q?u2/VPUzKKkXHVWzuYBcX5UvCgoXHAMkuPPsrvdO8Mj+kbelZr/6Y9H1DWFYD?=
 =?us-ascii?Q?uF+BC72XBfOgKGds7l9aOfIAC6QDhRuzydrZSojOK1swVEr67y2HeyGRmszU?=
 =?us-ascii?Q?pSty5p/Rdsg5m2aeTZly5nH7EwiHxysEuuMLBjhts+RuX/6R8UEbPQVHVD01?=
 =?us-ascii?Q?+DQcopmqrW67p5UIb3wMvl9M0qh2ZdINQ2yLj402TMakOtGXd3ffhJzhOTyU?=
 =?us-ascii?Q?Lu7EBhv2KOaDdFHmbr2haeLo8fdTpzPDd2VXcdst3KvRCR81ZVTQd14ENzV9?=
 =?us-ascii?Q?4oncVdTl887inJJRY9NfU3UqIl7z00S4ElO4ZWokC4p2VLBRHTA2uIy9HO+w?=
 =?us-ascii?Q?+9SZtX4kSo8IWQXAKTnLAwtIDponhB+R0RSYU5+zQ04AUT5bTBHlZeuC5Gu0?=
 =?us-ascii?Q?yV63rUvJrHgBZYY2hTrePSr/x4Gu1F7Nnfu6QYaQ/xa6OmJ2+mzCjzJod7Em?=
 =?us-ascii?Q?DyGUZ7bWx2qqJENQVOtTV2z+SAmI0xVYyqx8/HqgJ+En+YJ555tzmKYp16+w?=
 =?us-ascii?Q?cJ92MGJS7WmrRijY1waSR9pD4tqzpu4HmIrMXVzMFotDDRrI5rPxvWXIHs0R?=
 =?us-ascii?Q?/zbythgnEb+yzUooMR0XszTrRVKLD2+jZ3ibLISXgy8q?=
X-OriginatorOrg: durham.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: 3912cf9b-2c34-4294-030d-08db7c0d5df7
X-MS-Exchange-CrossTenant-AuthSource: LO4P265MB6510.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 21:35:05.8629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7250d88b-4b68-4529-be44-d59a2d8a6f94
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WWEa2DK1ekTvtgraYBtkaP/+BPGK4zuBBGY+Vj23oANIKwUZpWVMivqlpC+9hBHHw1XEUGzK5u+Yk5E9kYXNLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6049

I was trying a test build with these patches and got the following error

In function 'mbi2_reloc',
     inlined from 'reloc' at arch/x86/boot/reloc.c:437:16:
arch/x86/boot/reloc.c:349:20: error: 'bi_mods' may be used uninitialized 
[-Werror=maybe-uninitialized]
   349 |             bi_mods[mod_idx].start = get_mb2_data(tag, module, 
mod_start);
       |                    ^
arch/x86/boot/reloc.c: In function 'reloc':
arch/x86/boot/reloc.c:237:25: note: 'bi_mods' was declared here
   237 |     struct boot_module *bi_mods;
       |                         ^~~~~~~
In file included from arch/x86/boot/reloc.c:29:
In function 'mbi2_reloc',
     inlined from 'reloc' at arch/x86/boot/reloc.c:437:16:
arch/x86/boot/reloc.c:365:43: error: 'arch_bi_mods' may be used 
uninitialized [-Werror=maybe-uninitialized]
   365 |             bi_mods[mod_idx].arch = _addr(&arch_bi_mods[mod_idx]);
arch/x86/boot/defs.h:47:46: note: in definition of macro '_addr'
    47 | #define _addr(val)  ((unsigned long)(void *)(val))
       |                                              ^~~
arch/x86/boot/reloc.c: In function 'reloc':
arch/x86/boot/reloc.c:238:29: note: 'arch_bi_mods' was declared here
   238 |     struct arch_bootmodule *arch_bi_mods;
       |                             ^~~~~~~~~~~~
cc1: all warnings being treated as errors

Is there a problem in the code?

 	Michael Young


