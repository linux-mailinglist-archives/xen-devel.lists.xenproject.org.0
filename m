Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB93B32B7A7
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 12:58:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92826.175006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHQ94-0005O0-JK; Wed, 03 Mar 2021 11:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92826.175006; Wed, 03 Mar 2021 11:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHQ94-0005Nb-G0; Wed, 03 Mar 2021 11:58:26 +0000
Received: by outflank-mailman (input) for mailman id 92826;
 Wed, 03 Mar 2021 11:58:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7pqQ=IB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lHQ93-0005NV-0e
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 11:58:25 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c1d4f5a-19c1-4da0-a432-0ed5f9b1730c;
 Wed, 03 Mar 2021 11:58:24 +0000 (UTC)
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
X-Inumbo-ID: 1c1d4f5a-19c1-4da0-a432-0ed5f9b1730c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614772704;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=XoH8fAGBrW3105VTDDvSPPzoMqQr9HAgGTJTdyahT+w=;
  b=Mh7Vin0sO68Pw7Jo2V6gHAEtrKqIzXOkZlYXkFv0oIP+N2kZr5cAQd2Y
   7WG8oiP9x4IBQV7DNGu0HnMMg1Llpu3E11p91Ncr8EkLuOpZfDbDnOAJN
   lFQ06olg3vo38GL8KK64B+vP+jAzyScUjpGB4ABYxAY6v9l22zDvNrgJG
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LQ68EadTl2Pjqcz9bbB3gkMEGXZB+Am/PNjr8zfJnQTrjLpCROox5891k7KBRw51tkC7Qjq3aw
 cEn49iqX43m1gC6fLBbrpS4vj2IbsaDmwCahojKkMBPGd1/4+jOoV8QKp3OJSAdHzzUFBzCGJG
 n+iNUvrHCyjFN6Wl912dP7va4jf1yvssIaKGFzJTlfyuj2nii5akfY1I5YctTBgWh3ePCFxkj+
 1XCfSytwK5tJgKL0cMUuktY5E9G71ZyJBBRjicIx+Gp1VKA/awYhTdnMywFMMvAg2iff/+1EJb
 8aI=
X-SBRS: 5.2
X-MesageID: 39825637
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,219,1610427600"; 
   d="scan'208";a="39825637"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8cUMVp0wBbYlu78a7j25/4QqEVJ321vxUXsUI8oXUvtE7Dm4vFfpZNx/Xae81v6RA9LQRBnpECZO31VM0EUXdS2NnafLzRx1dZl5hBmjar4B0qXMQ1F/HkVHZPtuJecYGqzpHhIy3UcPuixDkjViCF0/s7xXI8HP2ufuEyun/j+3ReniX8XI/rKYkFs4l1cGG86G4XkgN6ZIEhoLUwXqdZH7K92K85NyWf/z146S5xKqPPhll9H+NTf+FR4gni7RJxWyWLcjmJgUnqkVfG0sjUWg6RrM6jGUntB/l3jDcp6CRPYIh9/OP7glNZjN/1tSPUwrnep7BIfjjW/6ah4dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LznaiZPkrQDxsg0osJgpGB9a1nFePR57uEAvEfipNMg=;
 b=PjQG9JJOgR+4PK91RoffUxJ9vr+oaqgh2LdOMukLkYM/SSTY85/24vdiQxNfuqrx1G+GDiiVH/7UZjSnr3cLUGI7WAvtU66AlZPjK/yAbw/NwLMSP03RcXMHIZYXPkLJjS5Z+6xKZebBGAWvr9Ztt8u2lWcxhGoGoEtz388XKa4UWVRZFHOXYIaHAtIB4E0KML1EVTDQF62fx4G1XEHPju7846lAMG7rGmL7I4PEARfQ19EZvgyVJhLeU7Wo8qf6jAE4Cmg6uKh4eoEq4c8++GD0CN9VHw+qnqmNtKamYk956zXsCwMcIePftgr6vKQVW6LzdxVBMjjgoIzevknqYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LznaiZPkrQDxsg0osJgpGB9a1nFePR57uEAvEfipNMg=;
 b=Dnika7I3C6TYiIn1S1iL/+bGjZT2NvS29fReueBlzcjKunEyuQXQQD5rqO3+q4r9AZKF/HqDGT5csPKw2df8yyMPkocQ7VIKb3ON8MDr94hJ760aQ2PquIEaQ3MDqnJaCLF5GYsGujAuRZ9jMYaeAt9HUM2FdedfUjbBJWGCddw=
Date: Wed, 3 Mar 2021 12:57:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, Jan
 Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] automation: add a build job with NR_CPUS == 1
Message-ID: <YD95wJUFteP2o/yM@Air-de-Roger>
References: <20210303083318.9363-1-roger.pau@citrix.com>
 <5dda8f5f-0d91-e956-383b-41060ef8f3de@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5dda8f5f-0d91-e956-383b-41060ef8f3de@citrix.com>
X-ClientProxiedBy: MRXP264CA0041.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f06b8a52-c9ba-40c5-0b17-08d8de3b953b
X-MS-TrafficTypeDiagnostic: DM5PR03MB2633:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2633A14B2EF0D9A3B9D965688F989@DM5PR03MB2633.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8ZVZvzlZjeTZDdflsD8kNakBH37iBLPnyVRS2ifTE7BPeV0f8A+1lFfV/KqjwGT/kZYiLrQmpPiQwFxrBeOdAd3ImwnrH/fj20g2Z8klmpAN9RYTPleUDj8FjgcXmMlgi8Cs8P9r4JqZN+zenN98NBzh/DGQCDpaMhg3vudxB765RmqneDDaw2gAEN6S+To2lk+Geu170mwjpJu25vD1Du0rxGkezV+MmKqWu/IN1YEEmzYsd32QklFs0+f1qEvDKGzJgumiWROcGA/O8RId8wztk5EPuoN4hAxnnLHUkWFfcocvvHdMnTVsYguuTAf3qFsUm3GCZeb/a/jSXPrndsZiRMKvjl4EIuLHA9/kGTDvLRbAGhGc+EreK5+tIqizZsRxhbb/UZ2xA3/lOovg52/SZrAyPhCxNrbRZiJ0ZIBMNgaob2HTqu6MAltMQ3jicrtIQX7RtsxGFBc47ntY71UJuba4iqgBse2IREB3SZtMhegi+AmDujnSoSwRRV3WvZUPMqGWaT0kKDbJjmFLBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(346002)(396003)(366004)(376002)(39850400004)(53546011)(54906003)(6496006)(478600001)(86362001)(6636002)(316002)(66556008)(5660300002)(66476007)(66946007)(8676002)(16526019)(4326008)(6486002)(85182001)(956004)(2906002)(83380400001)(8936002)(6862004)(6666004)(33716001)(186003)(9686003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RlQrTVVJd05SNmpCRHE2VjFUVkFmOEVKbG90d1RucFpUTDBIWXJ3aVpwT3Nw?=
 =?utf-8?B?TXpiMDVBek5tR3BIZkNQTjB1eEtESk9uMHI1MWFHOG56ODVvaVUzcUo1RmxU?=
 =?utf-8?B?NVZaSnA3bFhJRkhrL3A5b1hTSTAvWDBLVHJLZ1pHUElYY0NMSHQyRUtqY3NR?=
 =?utf-8?B?a0FueDJpMUVncTBvTXo4U2dGd1pkcVhVeCtJT1VvSTNYdnZ1MGgyOXZLa1dV?=
 =?utf-8?B?Mkt1YTRhL3ZDaU41WEdsWVlUQWR0bEp1dElodndnUW9kaWh6V2ljMkZFaXpl?=
 =?utf-8?B?NWdtV1pyWkRPRHRvYm9GQUE0cjhaU0UrSjFYVC9BT0FUNmZyUzcrbE1ZRC9C?=
 =?utf-8?B?VDk0SHJsUmF3aWVkWmc0ZHpUSkhXai8xeWx0a1VJRkh6Y2VmOVhSZWh5WEFE?=
 =?utf-8?B?Znc1SzVJbjA2b2xJcGdhRDVDNnNwNG8zZWtpdDdRYk9Xd2RYOUhTTVB1ZmZ4?=
 =?utf-8?B?YitBem5hcDBEUGR3a0lzWk5ZUVhyMFIxU0F1RXZNSlY4YXQ0ZjI4SE1FSXRI?=
 =?utf-8?B?UFVqU082T0pjN0ZXRGNYWXMxeXZhSU9WWWV0bTBUQS85QkFWbFlWZUJod21D?=
 =?utf-8?B?R3JLd2VXMGJHWGhtOTNFWlhIenIwRWc3aC9na2kxaURSVlFQR3QzclhKNHQr?=
 =?utf-8?B?VzQwRFBJMy9TMlBSUWlzQitUa1hXelNHYzBQaW5wQjlVTFNjcjE4Z0xGSW9l?=
 =?utf-8?B?SlQ5ZkRQQmxyRUczNmM2RlFGOXNrSGhVTVY5WUUzMXZ5cE5PVWZzMnJrS0dJ?=
 =?utf-8?B?bjVvYjJ3NzJOQlVua2pNRDkyMXB1ZmNxRzY5SDM4TjQrb3NLbThPajlnSXla?=
 =?utf-8?B?QVpNSVVlTkFPcWZHNEh2MGdWa3k3Qm5HYjVmeCtiV1p2Y2hBcFRBYzVzRUpG?=
 =?utf-8?B?SEl5V0QzV3JNMXpzMEQvNkJ2d3Z1QURuK3pZZW5wMFlSOVFIM3VhQXBxNGFR?=
 =?utf-8?B?ZFU3cE14MVRjeTZCWTFiSlcrU1JCbDNiZjZUWjBxM0NWdXFjNE9kMFR4eUhK?=
 =?utf-8?B?SkJYdzdGS2U1enNSRU42UzgvZXEzOUNvM1k5Zi9aWUFBb2N2aDlPTjQzMmt4?=
 =?utf-8?B?OGlCbXRxR2VPWWNuMG03Y0NoTzNrVEQrcjlielgzYldIQ2JmMEpmVGJmVEtp?=
 =?utf-8?B?WEtnSEt1OHZ5Yk41akJzM1JlTER4T095UG9aMlJPMFJLbTFaUWJGZnBITzFj?=
 =?utf-8?B?UVR4aXVJQk53NW5CYW04VCtnNExydFNicE42Zk5IRUxPRHhMNi9MUVc4ZnZu?=
 =?utf-8?B?OHArU1JyVkhkZmxucVMyN2NGVTFJV3BkYjFHRHpXMVlxcGpKeWF1SmhFczV3?=
 =?utf-8?B?Zkw0ZHR0UkxsNUIrdDY0VFNPcXoyNVc1amZLUi9aMUFWdDVtNFFScXdJbEl4?=
 =?utf-8?B?UDVVb1c5V1M1NzRNYVFGcUJxWUVWQ01SM1FIWWFRUHR1WWpmYmF4cVVHY2hL?=
 =?utf-8?B?Q3htVFppVm9IZEduNkgrT0YrNi9SZGZSbjhVbmgwYjdyYkU2MlMwQzVYemxp?=
 =?utf-8?B?a2MrNFNWT2g4ZWpITVp3OVNwSGI3REtmK1VyWTdoL2xSb3EzVGpqSXNOaGh1?=
 =?utf-8?B?OXE3cnhMbllSU3dOa242RmFGdElldEpjSmtaN1lXd2x6RjdDa2o1d1NDOWlC?=
 =?utf-8?B?ZUVNYXVtMzN3VThxc0tYQXVNaXRZeC9qYkFhSW1IVVZrUTg5SHhtbjI2cDJx?=
 =?utf-8?B?bnJQVkhUSHFoZU8wQXVnZlRtVGF2eksyVUpyMWpPTDB0UGFqejRkTUI2b1VJ?=
 =?utf-8?B?dzNpQzI1TGxIenUvQ1BBaEg2N0wxeVBZN0dnTk9BdDJlYksyWXlUMWI2ZFg5?=
 =?utf-8?B?NXF4MTZZZ0FxK3F3ckx6UT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f06b8a52-c9ba-40c5-0b17-08d8de3b953b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 11:57:56.3276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yLF4nC+NbjBiGvpuRIbEA35y88WkVMOBfNZIaz6sBYZNsvCZmnCsSlOjWmTcuBuNuvKFZJCxSqk4iDFZQuXSKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2633
X-OriginatorOrg: citrix.com

On Wed, Mar 03, 2021 at 11:46:44AM +0000, Andrew Cooper wrote:
> On 03/03/2021 08:33, Roger Pau Monne wrote:
> > This requires adding some logic in the build script in order to be
> > able to pass specific Xen Kconfig options.
> >
> > Setting any CONFIG_* environment variable when executing the build
> > script will set such variable in the empty .config file before
> > running the olddefconfig target. The .config file is also checked
> > afterwards to assert the option has not been lost as part of the
> > configuration process.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Cc: Jan Beulich <jbeulich@suse.com>
> > ---
> > Not sure whether there's some easiest way to force a config option to
> > a set value from the command line.
> 
> I'm -2 to this.  We've already use thousands of machine minutes per
> push, and this corner case isn't worth adding another 30 minutes or so
> per push.

In fact I think those builds could be hypervisor only, which will
limit them to a couple of minutes?

Would that be an acceptable compromise?

Not just to test NR_CPUS, but in general for testing specific Kconfg
options.

Likely randconfig should also be an hypervisor build only, there's no
reason to do a build test of the tools with a hypervisor randconfig.
Let me prepare a patch for that.

Thanks, Roger.

