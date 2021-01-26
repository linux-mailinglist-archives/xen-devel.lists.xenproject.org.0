Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C20F1304333
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 16:58:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75229.135406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4QjC-0000ZU-Sp; Tue, 26 Jan 2021 15:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75229.135406; Tue, 26 Jan 2021 15:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4QjC-0000Z4-Oq; Tue, 26 Jan 2021 15:58:02 +0000
Received: by outflank-mailman (input) for mailman id 75229;
 Tue, 26 Jan 2021 15:58:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nQkR=G5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l4QjB-0000Yz-Cs
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 15:58:01 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06c6ea79-fe0a-4965-b086-e73e04e6c442;
 Tue, 26 Jan 2021 15:57:59 +0000 (UTC)
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
X-Inumbo-ID: 06c6ea79-fe0a-4965-b086-e73e04e6c442
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611676679;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xhC2X/ziz92yVmOVZLItg1hCdFldCheU0YyU5IkSROU=;
  b=Zpa4r0paajYLL8bC71AjuFD1sbCY0NpYSWgAvWKpcHtXBgwlzMJdeqiG
   AIy7WYhVgM0f4VNmzVEj+/SPUd7rVYal4IgbARucGWTutGZz11H533ZG+
   fVanj3nsOp2TUrazVWNorPgQU0x3crRSh+yhX9Xy60aeTW3bTsj7kyTkn
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tikwhTmK7hYLqwFKaM+y3LGR7sjnhC9Ttwtqgzakd8RbZ8iyJYIf5w/o4otDX5UmuvO6hmCOw3
 kKjMUsd7gVQga/2Qo+xL///8+Ukm5KSsUfN5oz1BnsHyQ7zFOdRlHLYdacyfXWcj4TTj5U4Axz
 zgm1RqM3KIgUnPX8A6btd71qXoZoIMQ6IJNMJRjICsBw7yj+S0Esic7Lix+fX2RvZXHhhvWyKs
 0/eZ9RpyJzFstDVQ79xkMaSQJGGL0dIInH7WozuIk1hGXiEeOC0aLEpfC2CgFBAnDp+7KoMA5d
 RrE=
X-SBRS: 5.2
X-MesageID: 35877615
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,375,1602561600"; 
   d="scan'208";a="35877615"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2zWA6nCNT/5XojVbEBk+RkzgX491mmgyplWHevvIYHwR0hSe0jg1i7wK08m3Cw2B3CGXECDPEJvZqBHaIg4AaujRH7FHRCBT0qU3xKg6Rf5lFKWT0q71jmxR5R2Twy7ZDla46aJwiRcsfwz9WRPPx/M1hbtZ31kLF34yJrUxOBkQ6MbhPvll/IhTfR1RGZSD5DDmzxvYhN4thjBjjUtFEgxweOq/+AN+JtjQOd+IA5CDMcHs+nes32e5yA7uS9voxiPFSwYjO88Ovk5QjAl8JKSY8wFaAMWkp/6cByW9m+6BSo5/6X5+iVMneitP4DkFiTx86eupJbTRduKJ6rlVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1v4/9rh5l68gpX2yyVn3GN4c6XcngR7pts3CyqjpQo=;
 b=FUcMkXKaf2wNfWaKr6ExCxrBusyzumGq7cdmNrTYWZCiQQut+/L8MsMagvZ3ScyIOberqsEm3iDGjiuXJcdJUbB6VPWpCfqsVq7D22HLXfKktNVCT9t7s7z0Tl2qyfTgw005H105LYQb20lBODWm71JDcHQfz/UY2TqCrYLsaQd//+OBg+F5LG0RNWEJpDDPlgOtdPdmfwWV9o8ZDQtaDAN/08UZKiu3+FTzqETJda3AfqIZFJlUqbR774HVwToJgcpgn3vGzWZL0fEu9oDjM9FNZl/fS5rC0o2xneASl2F3+Ba0eExbQtlIT9rKdim4P0AxX6Zj7lSTDOJR+KF4Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1v4/9rh5l68gpX2yyVn3GN4c6XcngR7pts3CyqjpQo=;
 b=hy7AhxBIWDm7uZsXclly9R2GPGMP1T7zqC+wgMPB+qB2UCtwJUL2fq3wu+JqADMESt+lxEJJas1ItVrjvC8MoCvgtyKRnJFxqtfV5EtzX0g6vHAnrz4KXjNPONBnuyo755GH0K3fSypyFOioefZ0xzrjKTZUYfIPuQVqgHJi9L8=
Date: Tue, 26 Jan 2021 16:57:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul
 Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/3] x86/vmsi: tolerate unsupported MSI address/data
 fields
Message-ID: <20210126155740.qsgjzc4vlv6ynt7e@Air-de-Roger>
References: <20210126110606.21741-1-roger.pau@citrix.com>
 <20210126110606.21741-4-roger.pau@citrix.com>
 <3fead705-5d36-72df-981f-04d0c47175c3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3fead705-5d36-72df-981f-04d0c47175c3@suse.com>
X-ClientProxiedBy: MR2P264CA0167.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cfabcde-8b31-467a-d4bf-08d8c2131eea
X-MS-TrafficTypeDiagnostic: DM5PR03MB2971:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2971F042F3CEB313B64391A78FBC9@DM5PR03MB2971.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1SG3/Hd3p9Enfmr1QcW0QwZvhNmqweTRvPPztN4NbSlEFzBeZCm2ZaKSyR9bX4eWqBuMCRca234MHo2lCrgXrIWLGpvwZr7uYwUKEKQvIaz0Gpb6JunDrSW5Sp2StXkrYM3vBup6NRe6WtjijtiNGg3Cu7O2k0jKPs4nFzXtGJXwUhzD6M5omwKSAw7aw4NTdn1f1o8kcCUM+PvIPDo3ILHQKgzdC2pnw6rqOWZqMCgveRelMqv53Y2kBLPoIBRtUjQfq/4HC/6Jhnj6AEXMFwqAFthLU7egKyudPkWTpt/MX2aIO8TmZYDBIbSaOr0Jrxx6soWogXevSW/ZmBg8KLeMyf1pAIt1F4ghIZT9iiHpfEgcnwJuhgVmEcdmCePOvH7NwrtXm5E/87QIhKdhZfb4fb33x59EnjPdMTysuPvcXi2+Zfc1gbTo0sVwYL+gIhYFDps6/YH1LPUadpoufBWmN8AVXQ6LQI1cQrHKP7pjA4H1oMuV8oWul3qZLOsKL6amPNDcRWRN9jZarRYEjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(376002)(396003)(39860400002)(366004)(136003)(316002)(4326008)(2906002)(6496006)(8676002)(1076003)(9686003)(54906003)(478600001)(6486002)(6666004)(66946007)(6916009)(8936002)(85182001)(83380400001)(86362001)(66476007)(33716001)(66556008)(5660300002)(16526019)(53546011)(956004)(26005)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?djZOUFJRbW0raEF5R0Jzejljd1hlUlVBV0FSTDBwTFRXZHNjR3gwaUMxWnJC?=
 =?utf-8?B?VDFFRE1IdDRlaUR0cHBCTytHWXg1aVFuWmFMOHBHU294L2tJOFh3Tjk4ajBL?=
 =?utf-8?B?TlhzYS9MZDBZeC9lcmI3djVSUHp5ZE0xc1ZOU0pOMmtFM2lKcU5OMEpQbDl1?=
 =?utf-8?B?T0JEMlNuckorNGQzZlEyK1IzSDhZWUUwRGUzWGxyYjE1c2RyalpmK21pbUVW?=
 =?utf-8?B?SHk4MlhJRXh5c3RYUHdUYkNxZWxrd1NxWC9jam9kTUpOaXhOcnJRbTUyamM2?=
 =?utf-8?B?ckY0Tm84TXpKQS8weGtFTVMyUUk3WVJURWJXUUgyeVdMbDRHMldRQWNwK1NK?=
 =?utf-8?B?S3RWbXpLWEdxTzYrSTFPUTNKSHpOais0UzBrMnNiSEVhOEk5cVY4ZGxnRkI1?=
 =?utf-8?B?UC9kM2RGaHgrNkl2c2lXMktYbkpLTEplR1ZHNFdhZUlaZkdWQmQ4blA5dzU3?=
 =?utf-8?B?Z3VwWXFiUmdKVllVd3U5WlhPZUExV2xSTjlnR3RCd1pPZy9xNVhsS3krT1d0?=
 =?utf-8?B?d0tTWHpMRUJtOHFTZjlXREhuNThxaTk1TGpvb2cvRzBFaWRXNEVpRHFDR3Ex?=
 =?utf-8?B?ODRuVGxwMnNWUVkxdzVvUkZwWUQ1TmJNVHJHTWdKUjBBc0hsUWxGVlpPc0Rl?=
 =?utf-8?B?RUhlRmpVK3BaNkt6SVc2QjlRQ3RjMThsZ1ZNWEt3ZVRITU1aUDdGanhMWGp3?=
 =?utf-8?B?VjVJRUxXazQ4VG1OUnltd0JLWTBVc21uQ0QvdTJEb0E3aGRTRy9Hcm1MMFAx?=
 =?utf-8?B?QkVCbjdyQUMxMG5OMWFpNzhISHZFK1NLNFkxQjY2blBqb09aQkh1SUo1aldE?=
 =?utf-8?B?OGR0OTBZSVlEelo0MVdxWnJSS3QzVlY2SG05QWdPaHRaaHhjU0ZCeXA4aUhs?=
 =?utf-8?B?VGlCMzhQN0NCYTZWL2ZYVlVqMlFwNVZ6T3JpVW5IVG1oa250aVVFTFFRWU1F?=
 =?utf-8?B?bGVrMnpJbUhjOFpzdGRhU09KWG9RZWVRMDR0OGVkcGNsUTVtS3M1dVMzVFdt?=
 =?utf-8?B?ZEEyV1JScEVNN1ZQb0JGVzBralRocWQzZ0NDRlBuSlRNcUV4bldtSi9xbU4z?=
 =?utf-8?B?eDRzMWNXdktvSkpvL2ViZEZTVVpKNHZWdVpPOVhiVFdna2Y2aURHYnBCYVJ5?=
 =?utf-8?B?Wm93NEJWOTR2dnVmbTJPcFUvZWNiMWZscU5ROVdORUUwblliTmtveHhEcEw2?=
 =?utf-8?B?OWM3cTNWWmE3WXU3VHRwOHhYcHFiaFVpSTM2YzUwRVBORWp1TTBRYitWZktT?=
 =?utf-8?B?U1Nkdkh2cjNVckp5NXQ3TnMwZDFFUzQzaUdvSE9YMkxHaFg1UWlWeEQySFRo?=
 =?utf-8?B?RVNKU2ZoQlBtckZtdGxiSWdtTEE5bFF5QVJlNVo0R2NEK2VpNURJTnBIUGJM?=
 =?utf-8?B?UFg0M01BQVc0cHN6eGRVR3FyVzloRnhVTmNlYjE4c0hVdHdQbHlHL3lhbk1D?=
 =?utf-8?B?aFV5MHNXbTQyV2lQUVg3eC9ZSG1nQlkvbWRmZXhBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cfabcde-8b31-467a-d4bf-08d8c2131eea
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 15:57:45.2784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1OgU+hDwgOwB6xBq6tI2ccRSa+tsjTWfss5V3E0a6XovJCbihhSHCC66pIjl64AQ2zN6vqfc68+oVir4OByHMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2971
X-OriginatorOrg: citrix.com

On Tue, Jan 26, 2021 at 04:17:59PM +0100, Jan Beulich wrote:
> On 26.01.2021 12:06, Roger Pau Monne wrote:
> > Plain MSI doesn't allow caching the MSI address and data fields while
> > the capability is enabled and not masked, hence we need to allow any
> > changes to those fields to update the binding of the interrupt. For
> > reference, the same doesn't apply to MSI-X that is allowed to cache
> > the data and address fields while the entry is unmasked, see section
> > 6.8.3.5 of the PCI Local Bus Specification 3.0.
> > 
> > Allowing such updates means that a guest can write an invalid address
> > (ie: all zeros) and then a valid one, so the PIRQs shouldn't be
> > unmapped when the interrupt cannot be bound to the guest, since
> > further updates to the address or data fields can result in the
> > binding succeeding.
> 
> IOW the breakage from the other patch was because rubbish was
> written first, and suitable data was written later on? I didn't
> think core PCI code in Linux would do such, which would make me
> suspect a driver having custom MSI handling code ...

So it seems that specific Linux driver will write 0s to the address
field at some point during initialization, but it also doesn't end up
using MSI interrupts anyway, so I assume it's somehow broken. FTR it's
the snd_hda_intel driver.

However it seems like Linux likes to zero all addresses fields on
shutdown for MSI (not MSI-X) with the capability enabled, and I do
see:

vmsi.c:688:d0v2 0000:00:1c.3: PIRQ 643: unsupported address 0
vmsi.c:688:d0v2 0000:00:1c.3: PIRQ 643: unsupported address 0
vmsi.c:688:d0v2 0000:00:1c.0: PIRQ 644: unsupported address 0
vmsi.c:688:d0v2 0000:00:1c.0: PIRQ 644: unsupported address 0
vmsi.c:688:d0v2 0000:00:14.0: PIRQ 641: unsupported address 0
vmsi.c:688:d0v2 0000:00:14.0: PIRQ 641: unsupported address 0
vmsi.c:688:d0v2 0000:00:14.0: PIRQ 641: unsupported address 0
vmsi.c:688:d0v2 0000:00:01.2: PIRQ 645: unsupported address 0
vmsi.c:688:d0v2 0000:00:01.2: PIRQ 645: unsupported address 0
vmsi.c:688:d0v2 0000:00:01.1: PIRQ 646: unsupported address 0
vmsi.c:688:d0v2 0000:00:01.1: PIRQ 646: unsupported address 0
vmsi.c:688:d0v2 0000:00:01.0: PIRQ 647: unsupported address 0
vmsi.c:688:d0v2 0000:00:01.0: PIRQ 647: unsupported address 0

When dom0 is shutting down. That's with the 5.4 kernel, maybe other
versions won't do it.

> > Modify the vPCI MSI arch helpers to track whether the interrupt is
> > bound, and make failures in vpci_msi_update not unmap the PIRQ, so
> > that further calls can attempt to bind the PIRQ again.
> > 
> > Note this requires some modifications to the MSI-X handlers, but there
> > shouldn't be any functional changes in that area.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Am I understanding correctly that this change is independent of
> the initial 2 patches (where I have reservations), and hence
> it could go in ahead of them (or all alone)?

Yes, it's fully independent.

Thanks, Roger.

