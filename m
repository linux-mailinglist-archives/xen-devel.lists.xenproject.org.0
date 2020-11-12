Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2034B2B0A18
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 17:36:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25962.54054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdFZh-0002Rj-2N; Thu, 12 Nov 2020 16:35:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25962.54054; Thu, 12 Nov 2020 16:35:53 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdFZg-0002RK-Uq; Thu, 12 Nov 2020 16:35:52 +0000
Received: by outflank-mailman (input) for mailman id 25962;
 Thu, 12 Nov 2020 16:35:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=muz0=ES=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kdFZf-0002RF-Et
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 16:35:51 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b05d7510-6e1b-4423-97ed-4509bee83b4b;
 Thu, 12 Nov 2020 16:35:49 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=muz0=ES=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kdFZf-0002RF-Et
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 16:35:51 +0000
X-Inumbo-ID: b05d7510-6e1b-4423-97ed-4509bee83b4b
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b05d7510-6e1b-4423-97ed-4509bee83b4b;
	Thu, 12 Nov 2020 16:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605198949;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=6ttY6MFm/462aukDIC0mQkKNjwLCdRXnlMXXpysWgNs=;
  b=aS76W7It1OwJ6abHANO43TbV/A+e+uTKnyqhK+0tnZ/9O+2BJmjbvYkj
   DZ698Y8nBQIfpWNDu89xq/6WTM8Y76gQKoqPRBLhSl3b+HO7YFCLGOvhj
   r0rCfG1gkLUqzYm1fsngVyICjS4ubzgB2Mb3RN1dbS+NhDsSt/KGA4dkm
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZbhCex5Isx3mcyQQNHhbec6wy94UNyuVPtdJYNEDNcja5pvibhEcwb1PgZnXxBqHHNwItcPTG0
 JSXPU/9HC5rxXqgk87jBjimTw5G6LdalKT2+mPAHdeLB8xE3LKa6DOnFJ/kUetTMDO1Tm+q6ID
 5m4zcT+Tkxha/uvS9mCmzYViAC0+3tWRTDuwmr0NJt8aSABS8B9GlOL6ya0GbVJcDO11tQnMcy
 QbjMQ8h3XY3BB2/GEr3DQjv961NV2AKtGpZX6dp/cqH8BBFfRepISFw/CN5Q2HGBZYvhfz3TS9
 jOg=
X-SBRS: None
X-MesageID: 31048412
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,472,1596513600"; 
   d="scan'208";a="31048412"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7HK2RHGfF/7J9SkU+fvsMOaXopsxg74p7j4virYMQ0zxey0LTs7tVGBQKrnplF7jAowEWFZAg8MaTmxC40Zhw9AJ8TUK+HAnEK9n6J0piin57PZ3JyIx8KSioTBEq60f7mhyXHkxo6ZSAv7gtymkJLoYMz1/YTkVfMXsatcVnsgCRQWp2gazKD10vFoOc/95R2wXu4EhpFpAPKDWoq+cC4iWvrYQegpqktn18/f+18z6X5f3e1j7ZSMGwxGpl4UNhGGyG5Qki9AeVawOD58XcUPPlXGPTxXlAO47RiIuL+JmjmnLBk4h3QyFbfYS8Fj4G6laFPSjeq0ETFFuryAJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3G5ho43dK94hG68dk12jzGucVOIAh05RzdT+0FFjbk=;
 b=K2D1316Nx5dGEGLOVF/ZTpSyaFdSumgeqr0ofCatY9c7seWF2Y1+cs5K3USaXdBzJm5jdQ2iW5l0u2hTKhj916ow4Lxf3pA3pIC4A815i3gOW7D1qQY+0EmsP0bpKmLM6vGd17KnT53z2+FTs48hvsSfmLowDXcdL7JQ2nrJAl8e4P9Wb1fPRyG+YwwYTmVQPgtczMNhRd88BQBZLWT+SoqsEjSUwk6KEXrln5Hw/si158x84fzMQysFUwn7NxLXowq4K7fdcCvYojoMswwBFcrYj5UHHnTfINiSZuioozTJ87OKT6nt4Wvo0WiG/woIjtPMoMic6/RD6KFKPnPGDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3G5ho43dK94hG68dk12jzGucVOIAh05RzdT+0FFjbk=;
 b=qy2Htc1mIZXUlujaKT1vU4nfp1J2BGbNnfZm2OUOHWt/DEOKIAvHScwhkIBlXtnHsy/zrvqKzdPg70CAOlAs72wowlQGRAoFsobl0iwHWrJT0XynU4mvbfOYVVBPMHoNTWnV11Io65ZO0EVUKbOS355kcgRanfNXH7xYKIvARXQ=
Date: Thu, 12 Nov 2020 17:32:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: dom0 PVH: 'entry->arch.pirq != INVALID_PIRQ' failed at vmsi.c:843
Message-ID: <20201112163240.6xswol2iswikdzef@Air-de-Roger>
References: <20201112155715.GA5003@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201112155715.GA5003@antioche.eu.org>
X-ClientProxiedBy: LO2P265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::33) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ade9288-1519-46fc-1fd9-08d8872895a5
X-MS-TrafficTypeDiagnostic: SN6PR03MB3599:
X-Microsoft-Antispam-PRVS: <SN6PR03MB35999BBDCBEA57035A6D264C8FE70@SN6PR03MB3599.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wMnIGyBogG7vcm9iE2ztqJgeUevLHKZ2nIMEyrGN9n4IaJoKyV1T2SxpHBSEYT59EeGH7WAq4lnOkvdngHXhooLABVYjJYJvSAXm8qD0XKaJZSPWkeQT4EMU8+SknxY1LwsIboQBkMGMy50JJM78t17L8TkBxyH0/Yj/ky4doLuIqB35Dpaa6KCv68LcSX3FByVllyAN1in8vSE2LMA60ZZRX1exB+/bp9KgT8V/6g6REnRDzpVRJfCuMjyJzhFwPTLGTonlNKnRuPM8N3NkKnG5Kchn2q26KtI7I8p1/2qLm98iy+a950tWl2/RtdDCR6ielU9owksrUV1rb3aJUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(346002)(396003)(39860400002)(376002)(366004)(1076003)(8676002)(26005)(83380400001)(6666004)(5660300002)(186003)(16526019)(478600001)(4326008)(316002)(6486002)(9686003)(66946007)(33716001)(956004)(66476007)(86362001)(66556008)(6916009)(2906002)(85182001)(8936002)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: wMTlWdfILc67JzPupkTuuNnCwEHX3LZ8e+i4vohwHzZW0eenWWQkT6YhEct2cIx4/qlpYfuYDzL63o6yZkDRL/Op6x56xLxS3Hueg9HQSSX7EmbD7L397x0F8MaO8s+BsLnaoBsihIwGUuXd8ms4G8S/lLyHwBeMS//Vzu6uNfMWir5lxmsP9B0fGAbIQmrggBdUroNdXPVoXDbe+w8OpxgoWNARqtsoPIa37moAD4Qn1i7QdGk7jZEErKSVVohdOGU5R9cOsQBQlsD8bNM11GazDpmrWl9nz71RwM/0ZM1YpWobEsjhkAUPe46Ilxpcvy0UBX1evAbnss+ngkIByYQAcdXxtcDWrasXLK4GNJianf2Rc6unUK4VrgjAOuJXBYsTGDwvf3842sJzNd+GnRG1G1fh3vXjPvuHuKBK3dVdw9RZ1xgGZOG6nY1+kF+LGz/aUeRqeMSV3Y0AzJCo95B6lV1sA/KjN8FROEL3pG/osTcMWKrjI4eWtafTFKzQgHwtcWj9dX6hij/28OKdm+8Ldozok9JcB6fCeZyZF4vwaYOIOLoKHpcQdDUeSIr1rp5B7LZM3mOW7d5vZvIOWJRTQ0OPlDV+X/dP2RRNyLNRWltLHeiCp4lT6mqKn5H3Sty0iudti8HAB9mpFHu4mw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ade9288-1519-46fc-1fd9-08d8872895a5
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 16:32:45.4203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CS7f51rmO1767cf3qyknVOlc4KO6AiuCYSwuqvavearasz7ZAemg4lck0vrOgtN6CRYJknhLK1RwlNgUh+bA6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3599
X-OriginatorOrg: citrix.com

On Thu, Nov 12, 2020 at 04:57:15PM +0100, Manuel Bouyer wrote:
> Hello,
> I'm trying to add dom0 PVH support to NetBSD. I'm tesing with Xen 4.13
> on a brand new Intel x86 server (Dell R440).

I would recommend using 4.14, PVH dom0 is still very much in
progress, and while I don't recall any specific fix going in 4.14 that
could be related to this there have been changes.

> While the dom0 kernel configures hardware, Xen panics with:
> (XEN) Xen call trace:
> (XEN)    [<ffff82d08031cc28>] R vpci_msix_arch_mask_entry+0x18/0x20
> (XEN)    [<ffff82d08025a38a>] S drivers/vpci/msix.c#msix_write+0x18a/0x2b0
> (XEN)    [<ffff82d08030d943>] S arch/x86/hvm/intercept.c#hvm_mmio_write+0x23/0x3
> 0
> (XEN)    [<ffff82d08030dd19>] S hvm_process_io_intercept+0x1e9/0x260
> (XEN)    [<ffff82d08030ddad>] S hvm_io_intercept+0x1d/0x40
> (XEN)    [<ffff82d0802fe7ba>] S arch/x86/hvm/emulate.c#hvmemul_do_io+0x26a/0x4d0
> (XEN)    [<ffff82d080259ef9>] S drivers/vpci/msix.c#msix_accept+0x9/0x20
> (XEN)    [<ffff82d0802fea56>] S arch/x86/hvm/emulate.c#hvmemul_do_io_buffer+0x36
> /0x70
> (XEN)    [<ffff82d0802ff005>] S arch/x86/hvm/emulate.c#hvmemul_linear_mmio_access+0x1e5/0x300
> (XEN)    [<ffff82d0802fff44>] S arch/x86/hvm/emulate.c#linear_write+0x84/0x160
> (XEN)    [<ffff82d080301ca8>] S arch/x86/hvm/emulate.c#hvmemul_write+0xe8/0x100
> (XEN)    [<ffff82d0802de6cc>] S x86_emulate+0x289dc/0x2cfb0
> (XEN)    [<ffff82d08027c7ab>] S map_domain_page+0x4b/0x600
> (XEN)    [<ffff82d080340eaa>] S __get_gfn_type_access+0x6a/0x100
> (XEN)    [<ffff82d08034a367>] S arch/x86/mm/p2m-ept.c#ept_next_level+0x107/0x150
> (XEN)    [<ffff82d0802e4961>] S x86_emulate_wrapper+0x21/0x60
> (XEN)    [<ffff82d08030024f>] S arch/x86/hvm/emulate.c#_hvm_emulate_one+0x4f/0x220
> (XEN)    [<ffff82d0803004ed>] S hvmemul_get_seg_reg+0x4d/0x50
> (XEN)    [<ffff82d08030042e>] S hvm_emulate_one+0xe/0x10
> (XEN)    [<ffff82d08030e4ca>] S hvm_emulate_one_insn+0x3a/0xf0
> (XEN)    [<ffff82d0802e4af0>] S x86_insn_is_mem_access+0/0x260
> (XEN)    [<ffff82d08030e5c9>] S handle_mmio_with_translation+0x49/0x60
> (XEN)    [<ffff82d080305d78>] S hvm_hap_nested_page_fault+0x2c8/0x720
> (XEN)    [<ffff82d0802fea56>] S arch/x86/hvm/emulate.c#hv(XEN) 
> (XEN) ****************************************
> (XEN) Panic on CPU 13:
> (XEN) Assertion 'entry->arch.pirq != INVALID_PIRQ' failed at vmsi.c:843
> (XEN) ****************************************
> 
> This is when it configures the broadcom network interface, which interrupts
> at "msix3 vec 0". It is the first MSI-X device configured; the previous
> ones are MSI only.
> 
> Is it a bug on the Xen side, or something missing on the NetBSD side ?

Looks like a bug on the Xen side, do you see any relevant messages
before hitting the assert?

Can you give a try to the following debug patch and paste what you
get?

Thanks, Roger.
---8<---
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 64dd0a929c..7ff76b7f59 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -371,7 +371,12 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
             entry->updated = false;
         }
         else
+        {
+            printk("%pp offset %u len %u new_masked %d enabled %d masked %d updated %d\n",
+                   &pdev->sbdf, offset, len, new_masked, msix->enabled, msix->masked,
+                   entry->updated);
             vpci_msix_arch_mask_entry(entry, pdev, entry->masked);
+        }
 
         break;
     }

