Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7823565A3
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 09:42:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106439.203546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU2oR-0001KT-UP; Wed, 07 Apr 2021 07:41:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106439.203546; Wed, 07 Apr 2021 07:41:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU2oR-0001K4-Qt; Wed, 07 Apr 2021 07:41:19 +0000
Received: by outflank-mailman (input) for mailman id 106439;
 Wed, 07 Apr 2021 07:41:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gkPf=JE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lU2oQ-0001Jz-FI
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 07:41:18 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2665a86f-4792-48ee-ae7e-194154dc4028;
 Wed, 07 Apr 2021 07:41:15 +0000 (UTC)
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
X-Inumbo-ID: 2665a86f-4792-48ee-ae7e-194154dc4028
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617781274;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=zCAE4yNwk3sqBTDcak3L4NXwGmb+vg+Dyouu8uyVYwE=;
  b=RXyUZKu39x1ldvHGvZtKIt1I0OkILa8gUdj1ODhDzx2iMEc3w277Ch6g
   xydazt45ZtoVj0uhIiYAK62ADmOzUOUNzMpaGmtlYSSW2v4r2tghhsPUZ
   5uhe2v8uA1dJ/zR2BzdwMZGkIm10P677jLiwaQv0VELFh0Fjmmjs+h1Pi
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /0cKViS8PLRPr/JSoYZRtRM4e3CBGneKv61cZJSr45x+mYebr7Nzd2Vp/f0Jt1zwNpdLYqGBQA
 l2/9PjvhsHt0VCPkRMNypPje0uaSnCt8cF/WpwcgEtM5VlEhYpIyyBsWj1h8oLj741/b6rmM22
 YsyFRyRKiRCfygP+74htymsQwdEJHlWDBotoROwi+rrY0Sz89sprhsEsgYWT8Z5hA+Hk57hVTX
 Egopsy7+vX2p9qp0HvQbQvJnTtedoB4CuQoLbPfJ0l4VMQHjVn92jWEHNqjpkz/N43ksL2fVus
 6Aw=
X-SBRS: 5.2
X-MesageID: 40896329
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:4cGx/K8NzmMVIOVIqOhuk+EKdb1zdoIgy1knxilNYDRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsS9aFnXnKQU3aA6O7C+UA76/Fa5NY0K1/qH/xTMOQ3bstRc26
 BpbrRkBLTLZ2RSoM7m7GCDfOoI78KA9MmT69v261dIYUVUZ7p77wF/Yzzrd3FeYAVdH5I2GN
 69y6N81lmdUE8aZMi6GXUJNtKrz7H2vanrfAIcAFof4BSO5AnC1JfBDxOa0h0COgk/o4sKzG
 6tqW3Ez5Tmid6X4Fv212jf75NZ8eGRt+drNYi3peU+bhnpggasTox9V7OFpyBdmpDS1H8a1O
 Pijj1lE8Nv627AXmzdm2qT5yDQlAwAxlWn6ViEjWDtqcb0LQhKdfZptMZiXTbyr28D1esMt5
 5j7iaimLd8SS7kpmDb4ePFUhl7/3DE2kYKoKoooFF0FbcFZKQ5l/14wGplVK0uMQjd844dHO
 xnHKjnlYxrWGLfVXzfs2V1qebcJ0gbL1ODSkgGjMSfzyJbqnB/11cZ38wShB47heoAd6U=
X-IronPort-AV: E=Sophos;i="5.82,201,1613451600"; 
   d="scan'208";a="40896329"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adEDFZCcWO9Au/mRSaEeJeDYseixZSf7MDfQu33/o+ZOUXV3xAcuTEwDC+KyheqfipRIwtX+InSYLkiLtOSXkfr+9J4UUrp4VySgBLBtot0Wuy1jgbmVWffw5zsOYC4nfAy2BaB3xzwMo3IxoUmUq1ddlE4e+w/Zx+NqwQV8ySW/nVJ8rFL3F4HiJ1x9jKsdP1lt+g1YEUhMPLY76dNPDGMY6G+wJ4YT/qS+112FV647VziTQc6pQAmd1ftRgpeU9q7BwMWYWBSCTS8fD1sSB+X2NQKz+Hw1w9Fvm5ClXvHKZSUdZCGpfyR8wzrTjBqW6oq/XcDm535ZRV/TjFoTKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uymxr+iC+zvFSBQtnecOE8yBY7IQlOKNP0xz1aefF8c=;
 b=KgU0dn9oRDlT3F15Ht8ewnpLEANCrjwdvmrQ+3OvAYVDQ3/Ma7tWZMZyIQFwyLXXNFMGcpojqYYHx57LA9rZtn6Ap/2Y/C5s7Vik84hN7TM+HqPvEazRvyU/pSMy5nUhWmESAGXQ3N3ya8rBuCOKKgT3kIK9FbtkpAcw2nz5otsIbm/omfhfPxDUloxikjVvs9X6RPXOBtHaqH9b5RCZvbDa48O8KU/j8c8temBUlEI9Nz6HP+pyAabsLlGptqHzih7eaggSX0PTE9apV7YYcH3tyPIBl7TMVS1pABlOXeyOzZPCbtbYS7mbpxXWAJHqq24SMkIatW8C0+srO2q8pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uymxr+iC+zvFSBQtnecOE8yBY7IQlOKNP0xz1aefF8c=;
 b=cciRsstvSCG+scsI2rUR0o+fz8iBJNamvBrymQwChyFgzviaICDdbzxghtNWV6qlmXkD44tjfj4tCx47D+SWEovbZ+nyVUUw+cbDJg/Ik6fuNWx//nw25LldeipNnX7PNnKNqoFU4VPMuacNz8mTBSmOjOLvyu4SZ2q3DRE/5hQ=
Date: Wed, 7 Apr 2021 09:41:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul
 Durrant <paul@xen.org>, Paul Durrant <pdurrant@amazon.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 01/11] x86/hvm: drop vcpu parameter from vlapic EOI
 callbacks
Message-ID: <YG1iD7ogQc5bgA+T@Air-de-Roger>
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-2-roger.pau@citrix.com>
 <008d8d8c-f932-c3f3-e06d-99aa6721a59f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <008d8d8c-f932-c3f3-e06d-99aa6721a59f@suse.com>
X-ClientProxiedBy: MR1P264CA0026.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc82f931-1030-4ebf-4b6b-08d8f99883b9
X-MS-TrafficTypeDiagnostic: DM5PR03MB2635:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2635D2C031D73DDD35E54FA28F759@DM5PR03MB2635.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J117kttqwjV8urV7vCAa8JJfgI9UOPumaPqT+Vj9lTSi09Btr1vzirEPhIQmOuVeIv7c5aN6tOyxPnk2VLIPoEqSNTjCD7Q+gJ6IhuiiAfd6/E4b+YfE2ZDaFMJ7VbdiBqLQXiYxv9M9whroH++0qqyTGe0Jr9HoLHXxPgzSMHPRsit3EOujPDYQhw19mL728++CXdDrdn0+ZIXhmZuHL+bj+IU2yFmHKFHQaBJZya/UtULJ+1f7hMjhJpfU/RGpcxooRtfUfh0Pl/zCaRpDQ8/AAvLz5mznh1KIX/DFfvkEBti5maTA695CkX3B0rSnYni2d8e0x4Q6hM4uWcFI19cjFU6AFi11ZnwwE4fZUR4nzq+A3Vr/h0CmuOoI4djT5AWw6toIEAgYFNe5UGylzCeOlC/uRKSPyIZZxZl1v/BMe+xZB+bEEGaFs5wICHjDO4mAz7i1raGuO5Zb4tvowlQT3fUYazgQbeD7VxucSHhTJbc4ThdZ33MNIIgKgS/41xZZAzXu/HlcaCh6ZpkIrZ34tGAUDZuLFVO5/4mjHALyYsZv6Om5gH/Ilh2vjnllgXics9tJNbeqLeaxM0z8lcgUHvcu1xNe1jbI8xzNkGj0Qrn9X2uIFm5S6I+C6YmKCdPWWSqW0JeXsGu1xe7Cx9wzAubrrZmrp++c2iFWY/+kBpHcFPiQiEkf+J30vHtS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(366004)(376002)(136003)(346002)(39850400004)(478600001)(6486002)(38100700001)(5660300002)(6496006)(8936002)(85182001)(956004)(83380400001)(33716001)(54906003)(6666004)(2906002)(66946007)(4326008)(316002)(66476007)(66556008)(9686003)(53546011)(6916009)(8676002)(86362001)(26005)(186003)(16526019)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c3Y2Mks4VXZTMS8rMFNRRjFVaGdlNFVOVmNRczNnL2lLcXhrQlNwRWl4OVZn?=
 =?utf-8?B?ajMxTTI1R0VyTExoQ2dWYUFwOEcvQWNiL3VXOTZ1OEhJaDFpREtuSDBjdVpR?=
 =?utf-8?B?a1JPWGFTSGtCejg2RSsxRm5oNXJpL1dVK1JnT0VEdUNGUUVoNDRrY3AveDk5?=
 =?utf-8?B?TG5lR3NzQkNQVW15aUpRaHhmdUdCeHNYNEtUbGdhVkR5R0xEaVlwdG5ZalJX?=
 =?utf-8?B?S0ZtWExPRjFYS1JNQXpPcHMyQjZRdTI0a0tzeEJSNkc3d0NYUEFjRmcxNHhM?=
 =?utf-8?B?TDRXYklzbGNPd0h1OWdUZjA3dVg5dVducS9COHYvTVhzcWNjdk1kMDZtelA1?=
 =?utf-8?B?SkFQcmhWbWtla0lsbFhoR2dEdy9GeCtvWjJCc0tkd2NhbzNJNENmazRlQVly?=
 =?utf-8?B?ZFVwRWFDd0I5QkdRWVpNSVRia29iUUtZMlB6UmM3bTZPMHRqQzBXb1BqK1NC?=
 =?utf-8?B?Y1VCdi82QUJlSWNUcW9XWmYrZG1WQTZsalRkYkxxdFAxTm1ZZnJuVXdFaUNG?=
 =?utf-8?B?ZVc3YkFuRXdzSUpTS2dTM3FqKzY5K0J4WXBMUGM5WVRmazhLNzUvTUI2VUQz?=
 =?utf-8?B?MG9yY3VYWC9sL091S3p6MnF1d1RiZmt1V2FaN1cxQU1TeVlKZDhhV2J6QVVu?=
 =?utf-8?B?c1lUOUdTWVNUZFFkVVNLWks2c21JZnBvVlpLc0dEZFZTZS9WSFdydUwvVmJa?=
 =?utf-8?B?MkNvQXhCR2VySS8yUjhBTWxKQTQxeHprOVJIeUhSOFhuVlg5Y01mMTVPbUFT?=
 =?utf-8?B?bkdWcVRUSUtpeFFDSXJZbzR6YmY4eGJZN1JQeWJWR2VMbHFnckgxZU40cmt5?=
 =?utf-8?B?ZDMybUs3ZG5FUGNYaHcyUlcraWNkRks4cnBUc0wwc1ZTQVVFTUE5b1VYbkkv?=
 =?utf-8?B?djIzODNBWmVER2xwazZNRElZcXhiWXQvMlhyU0ZDL2RoU3h1TXRBaHBTRUtu?=
 =?utf-8?B?U0ZYeFFwVU1ySUFoM3JMeVB6ZkFKdWZpaHRtdzVJM1JJWjY1UEJXSm52Y0Ft?=
 =?utf-8?B?UmhMY3ZFd296akJGemVxamh2UlVCdU1xMm9QRndjWUM2aWhtR0lFMHdzWFNy?=
 =?utf-8?B?YXFaS1kzVXF3c3p6NlVTQ3lPUlQrVnp4MlVlTGNWTlFFTktqYUNZZ0ZLL0dX?=
 =?utf-8?B?YnFGVHUyWW42OVNDMERFdUt6WThJRnA4VVNXdzFELytUVGpYK0JRTEJ5aXBp?=
 =?utf-8?B?cmhnSmpaM0o5UUpWdEhsaVFKMmZCd0lOamhZeFRpRW1wUVZsN29BdGZ4MUJi?=
 =?utf-8?B?ZmljSkNzOWc5aUl2dFZTOVRGY2NJS0ZxNVFCRVNqWjZFVjFzZHZETTJiUVdC?=
 =?utf-8?B?cWdYSXFBUlhIcjB0UUFJN3FpQzVTSEx3aG5rWUVNTzg4NGcvUCt0VFNEdFZE?=
 =?utf-8?B?NWVzNWliNDhsMnAvbkY5NURBKytiL0pGemp4TnJVNEZBTXo3NHZTRFNjVGg3?=
 =?utf-8?B?cEZ0aWNjbVNCM0c1TDVLM1hwUzZNUUp4MG1FWTFodFZzVFJMQi9yR0NhVlFs?=
 =?utf-8?B?ZW9tdW1DWmVJL3c5REdmUFlVUTQ1RmJENG5qcU5yV2czN0dteExueWhtTGRK?=
 =?utf-8?B?czl6YjN2czBjc3VkcXlxWEl1Y0ZEUDhaNG5TZlBvZmZxOXl2L1dpcHlib1Jz?=
 =?utf-8?B?OUNrSUhmZkc3Q3JtdWJCSTNDYVVJNk4rQnZ0c2NiZXhFaC9CQWpUcUtNOWNz?=
 =?utf-8?B?ay9UZkVWemNuTUFHSFNVMjVsbVI0UzJIM085bm9sU3RnblZCNmlPQUxmV1ZW?=
 =?utf-8?Q?4DJVyOVFmXVRiWGHJ6qXh4V6ouMUzAwJ8GLKsgJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc82f931-1030-4ebf-4b6b-08d8f99883b9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 07:41:11.4389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPvuM3NzY95M3v52p48R52ZfueBVa9/q4/Yazjg3m4rtdeAGKmP5kOYNkZz9X/7t6ONd81M/J87+uJ1nXQwHzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2635
X-OriginatorOrg: citrix.com

On Thu, Apr 01, 2021 at 01:06:35PM +0200, Jan Beulich wrote:
> On 31.03.2021 12:32, Roger Pau Monne wrote:
> > EOIs are always executed in guest vCPU context, so there's no reason to
> > pass a vCPU parameter around as can be fetched from current.
> 
> While not overly problematic, I'd like to point out that there's not a
> single vcpu parameter being dropped here - in both cases it's struct
> domain *.
> 
> > --- a/xen/arch/x86/hvm/vlapic.c
> > +++ b/xen/arch/x86/hvm/vlapic.c
> > @@ -459,13 +459,10 @@ void vlapic_EOI_set(struct vlapic *vlapic)
> >  
> >  void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
> >  {
> > -    struct vcpu *v = vlapic_vcpu(vlapic);
> > -    struct domain *d = v->domain;
> > -
> >      if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
> > -        vioapic_update_EOI(d, vector);
> > +        vioapic_update_EOI(vector);
> >  
> > -    hvm_dpci_msi_eoi(d, vector);
> > +    hvm_dpci_msi_eoi(vector);
> >  }
> 
> The Viridian path pointed out before was only an example. I'm afraid
> the call from vlapic_has_pending_irq() to vlapic_EOI_set() is also
> far from obvious that it always has "v == current". What we end up
> with here is a mix of passed in value (vlapic) and assumption of the
> call being for the vCPU / domain we're running on. At the very least
> I think this would want documenting here in some way (maybe ASSERT(),
> definitely mentioning in the description), but even better would
> perhaps be if the parameter of the function here as well as further
> ones involved would also be dropped then.

I've kind of attempted to purge the vlapic parameter further, but the
proper way to do it would be to audit all vlapic functions.

For example I've removed the parameter from vlapic_EOI_set and
vlapic_handle_EOI, but I'm afraid that would also raise questions
about purging it vlapic_has_pending_irq for example.

Let me know if the patch below would be acceptable, or if I should
rather not make the EOI callbacks depends on this cleanup, as I could
certainly do the cleanup later.

Thanks, Roger.
---8<---
From 4719f5a827d3154ef763e078956792855ca84e04 Mon Sep 17 00:00:00 2001
From: Roger Pau Monne <roger.pau@citrix.com>
Date: Tue, 18 Aug 2020 16:30:06 +0200
Subject: [PATCH] x86/hvm: drop vlapic parameter from vlapic EOI helpers
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

EOIs are always executed in guest vCPU context, so there's no reason to
pass a vlapic parameter around as can be fetched from current.

This also allows to drop the domain parameter from the EOI callbacks,
and while there make the vector parameter of both callbacks unsigned
int.

The callers from vmx.c (vmx_handle_eoi_write, vmx_vmexit_handler) are
clearly using v == current, as one is the vmexit handler, and the
other is called directly from such handler.

The only caller from Viridian code halso has a check that v == current
before calling vlapic_EOI_set - so it's safe.

Finally the callers from vlapic.c itself: vlapic_reg_write will only
get called with the APIC_EOI register as a parameter from the MMIO/MSR
intercepts which run in guest context and vlapic_has_pending_irq only
gets called as part of the vm entry path to guest.

No functional change intended.

Suggested-by: Paul Durrant <pdurrant@amazon.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Purge passing the vcpu in the vlapic eoi call paths.

Changes since v1:
 - New in this version.
---
 xen/arch/x86/hvm/vioapic.c        |  5 +++--
 xen/arch/x86/hvm/viridian/synic.c |  2 +-
 xen/arch/x86/hvm/vlapic.c         | 31 +++++++++++++++++++++----------
 xen/arch/x86/hvm/vmx/vmx.c        |  4 ++--
 xen/drivers/passthrough/x86/hvm.c |  4 +++-
 xen/include/asm-x86/hvm/io.h      |  2 +-
 xen/include/asm-x86/hvm/vioapic.h |  2 +-
 xen/include/asm-x86/hvm/vlapic.h  |  4 ++--
 8 files changed, 34 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 87370dd4172..91e5f892787 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -372,7 +372,7 @@ static int vioapic_write(
 
 #if VIOAPIC_VERSION_ID >= 0x20
     case VIOAPIC_REG_EOI:
-        vioapic_update_EOI(v->domain, val);
+        vioapic_update_EOI(val);
         break;
 #endif
 
@@ -514,8 +514,9 @@ void vioapic_irq_positive_edge(struct domain *d, unsigned int irq)
     }
 }
 
-void vioapic_update_EOI(struct domain *d, u8 vector)
+void vioapic_update_EOI(unsigned int vector)
 {
+    struct domain *d = current->domain;
     struct hvm_irq *hvm_irq = hvm_domain_irq(d);
     union vioapic_redir_entry *ent;
     unsigned int i;
diff --git a/xen/arch/x86/hvm/viridian/synic.c b/xen/arch/x86/hvm/viridian/synic.c
index e18538c60a6..33bd9c9bd13 100644
--- a/xen/arch/x86/hvm/viridian/synic.c
+++ b/xen/arch/x86/hvm/viridian/synic.c
@@ -93,7 +93,7 @@ int viridian_synic_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
             ASSERT_UNREACHABLE();
             return X86EMUL_EXCEPTION;
         }
-        vlapic_EOI_set(vcpu_vlapic(v));
+        vlapic_EOI_set();
         break;
 
     case HV_X64_MSR_ICR:
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 5e21fb4937d..111b6d902f5 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -413,9 +413,10 @@ struct vlapic *vlapic_lowest_prio(
     return target;
 }
 
-void vlapic_EOI_set(struct vlapic *vlapic)
+void vlapic_EOI_set(void)
 {
-    struct vcpu *v = vlapic_vcpu(vlapic);
+    struct vcpu *v = current;
+    struct vlapic *vlapic = vcpu_vlapic(v);
     /*
      * If APIC assist was set then an EOI may have been avoided and
      * hence this EOI actually relates to a lower priority vector.
@@ -448,7 +449,7 @@ void vlapic_EOI_set(struct vlapic *vlapic)
         alternative_vcall(hvm_funcs.handle_eoi, vector,
                           vlapic_find_highest_isr(vlapic));
 
-    vlapic_handle_EOI(vlapic, vector);
+    vlapic_handle_EOI(vector);
 
     if ( missed_eoi )
     {
@@ -457,15 +458,14 @@ void vlapic_EOI_set(struct vlapic *vlapic)
     }
 }
 
-void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
+void vlapic_handle_EOI(uint8_t vector)
 {
-    struct vcpu *v = vlapic_vcpu(vlapic);
-    struct domain *d = v->domain;
+    struct vlapic *vlapic = vcpu_vlapic(current);
 
     if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
-        vioapic_update_EOI(d, vector);
+        vioapic_update_EOI(vector);
 
-    hvm_dpci_msi_eoi(d, vector);
+    hvm_dpci_msi_eoi(vector);
 }
 
 static bool_t is_multicast_dest(struct vlapic *vlapic, unsigned int short_hand,
@@ -796,7 +796,12 @@ void vlapic_reg_write(struct vcpu *v, unsigned int reg, uint32_t val)
         break;
 
     case APIC_EOI:
-        vlapic_EOI_set(vlapic);
+        if ( v != current )
+        {
+            ASSERT_UNREACHABLE();
+            break;
+        }
+        vlapic_EOI_set();
         break;
 
     case APIC_LDR:
@@ -1303,6 +1308,12 @@ int vlapic_has_pending_irq(struct vcpu *v)
     struct vlapic *vlapic = vcpu_vlapic(v);
     int irr, isr;
 
+    if ( v != current )
+    {
+        ASSERT_UNREACHABLE();
+        return -1;
+    }
+
     if ( !vlapic_enabled(vlapic) )
         return -1;
 
@@ -1327,7 +1338,7 @@ int vlapic_has_pending_irq(struct vcpu *v)
      * with IRR.
      */
     if ( viridian_apic_assist_completed(v) )
-        vlapic_EOI_set(vlapic);
+        vlapic_EOI_set();
 
     isr = vlapic_find_highest_isr(vlapic);
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index b52824677e9..22e406285cf 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3715,7 +3715,7 @@ static int vmx_handle_eoi_write(void)
          ((exit_qualification & 0xfff) == APIC_EOI) )
     {
         update_guest_eip(); /* Safe: APIC data write */
-        vlapic_EOI_set(vcpu_vlapic(current));
+        vlapic_EOI_set();
         HVMTRACE_0D(VLAPIC);
         return 1;
     }
@@ -4364,7 +4364,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
 
         ASSERT(cpu_has_vmx_virtual_intr_delivery);
 
-        vlapic_handle_EOI(vcpu_vlapic(v), exit_qualification);
+        vlapic_handle_EOI(exit_qualification);
         break;
 
     case EXIT_REASON_IO_INSTRUCTION:
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index 351daafdc9b..2f6c81b1e2c 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -796,8 +796,10 @@ static int _hvm_dpci_msi_eoi(struct domain *d,
     return 0;
 }
 
-void hvm_dpci_msi_eoi(struct domain *d, int vector)
+void hvm_dpci_msi_eoi(unsigned int vector)
 {
+    struct domain *d = current->domain;
+
     if ( !is_iommu_enabled(d) ||
          (!hvm_domain_irq(d)->dpci && !is_hardware_domain(d)) )
        return;
diff --git a/xen/include/asm-x86/hvm/io.h b/xen/include/asm-x86/hvm/io.h
index 54e0161b492..8b8392ec59e 100644
--- a/xen/include/asm-x86/hvm/io.h
+++ b/xen/include/asm-x86/hvm/io.h
@@ -142,7 +142,7 @@ struct hvm_hw_stdvga {
 void stdvga_init(struct domain *d);
 void stdvga_deinit(struct domain *d);
 
-extern void hvm_dpci_msi_eoi(struct domain *d, int vector);
+extern void hvm_dpci_msi_eoi(unsigned int vector);
 
 /* Decode a PCI port IO access into a bus/slot/func/reg. */
 unsigned int hvm_pci_decode_addr(unsigned int cf8, unsigned int addr,
diff --git a/xen/include/asm-x86/hvm/vioapic.h b/xen/include/asm-x86/hvm/vioapic.h
index 36b64d20d60..882548c13b7 100644
--- a/xen/include/asm-x86/hvm/vioapic.h
+++ b/xen/include/asm-x86/hvm/vioapic.h
@@ -63,7 +63,7 @@ int vioapic_init(struct domain *d);
 void vioapic_deinit(struct domain *d);
 void vioapic_reset(struct domain *d);
 void vioapic_irq_positive_edge(struct domain *d, unsigned int irq);
-void vioapic_update_EOI(struct domain *d, u8 vector);
+void vioapic_update_EOI(unsigned int vector);
 
 int vioapic_get_mask(const struct domain *d, unsigned int gsi);
 int vioapic_get_vector(const struct domain *d, unsigned int gsi);
diff --git a/xen/include/asm-x86/hvm/vlapic.h b/xen/include/asm-x86/hvm/vlapic.h
index 8f908928c35..b693696eccb 100644
--- a/xen/include/asm-x86/hvm/vlapic.h
+++ b/xen/include/asm-x86/hvm/vlapic.h
@@ -133,8 +133,8 @@ uint32_t vlapic_set_ppr(struct vlapic *vlapic);
 
 void vlapic_adjust_i8259_target(struct domain *d);
 
-void vlapic_EOI_set(struct vlapic *vlapic);
-void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector);
+void vlapic_EOI_set(void);
+void vlapic_handle_EOI(uint8_t vector);
 
 void vlapic_ipi(struct vlapic *vlapic, uint32_t icr_low, uint32_t icr_high);
 
-- 
2.30.1



