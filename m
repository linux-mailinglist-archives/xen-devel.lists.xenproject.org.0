Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F00F2FA71F
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 18:11:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69901.125292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Y3J-0007Ch-CW; Mon, 18 Jan 2021 17:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69901.125292; Mon, 18 Jan 2021 17:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Y3J-0007CI-98; Mon, 18 Jan 2021 17:10:53 +0000
Received: by outflank-mailman (input) for mailman id 69901;
 Mon, 18 Jan 2021 17:10:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wFfa=GV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1Y3I-0007CD-3a
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 17:10:52 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6453bfb7-7739-47f0-ad29-58e6f574205d;
 Mon, 18 Jan 2021 17:10:50 +0000 (UTC)
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
X-Inumbo-ID: 6453bfb7-7739-47f0-ad29-58e6f574205d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610989850;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=K+zcIJIk907Mx+o9s1SNbB74zg+digx4Ww6SndMC5Xg=;
  b=GdVWYZMy7dhqGIeMeQEHD0JjTbODas+nneTUZVFWFsoM3wxE5nx/ciad
   1mXt+LteEypIS8fthMO+zF88rf7y+K4r9z2pVPtwwIijFYkDxL2NelBm/
   GlrDdTZ9Xfr2RrW7OP9J5P/ItK4x8SgyIkNR7+KsyUmdn71a2W8nOM+Lb
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: x3rto33xYyPKk63QkBqvm3LZkILhM+Z1anan6ZdJrCyGpmE6qWq1dgMBL7YkF4m/hLf2I5Bcx0
 3g6QQ4uxKzn+VF8xJgxPtkKJSXq0iW/0PMftT5K10mAA66qS/4jXU3Jg44q9VcbzsO8fmKugKk
 UjEAK0ak1cyGMEFFPG9XZK12MuXw9JqZBVkMuoF/O921Pm2ciRDVAL9j+WvuifLDJWRlcWmnQf
 LoLC/ulzwyRYabRm4uD/ApmFpofiY0a5Urb9U/Y7kqQIxk06hJNhOm3ZwDKtCLAbGZA9NLucRG
 O8I=
X-SBRS: 5.2
X-MesageID: 36610855
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,356,1602561600"; 
   d="scan'208";a="36610855"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b52YMo3in5NfYRukQFFhZHULrmVCmd28i5TtC1p+7lvS1GjoQFFwSEEKOGugYyVoP8ZViy/jNgrz9d0Mi9nv+3GZLKGw6AqQjD4cpaeJDIQhaBRFRycPO+tI/4m0ZY3M4iU4VA6zb6QeIuJ3+u9ALKPJ3vvG4m5OD2KL7Q7wBHTyLN0rcpe6BEUlhUW2UY2zrUMyjGEvKzyaeX87MHtwkh3hzRTX6/5nkepDFQx95fJmmgs+6GAkBaFirf88jLD5Pwz1XUIWLt6jlIoEsvn1ZJFl5BTov0+Vdyy508q62VD8+/h5LN72IaK2iv52QNM8I/oX6AmnBXyeR/mWTajgsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7xu1LlhvKfsXDGMd16BZ8HtDF6hukn+suFifYrRR6w=;
 b=UfaZGVF+Pi1hANCLBshsqfkNfJ9oKOmvEktg6tkvFJja5Mok01qr1OCwaMB/IUIUHiDmVjWjjlqxT9j4Ojk8fuQ2BPSYjqv4cdsO1tVOv2xohPJTadRob3AFo1wWW+EFbFmySRBdCG/CHfgKcR6ZFCfNYE+lTG8BEr1e7bHwndKezwAShdb0vZMYFqFswiogtSPdmSpjX6o9wB3tzTXV1C9xeTwG45psjvoBGYUy5BC/9Jbd9CS4DgXBmNIwI3XRcdfnvqqUo7YgmtjVCdGzw1wBcYoOniNL3AWV2GlplgCehh3hXCOmrIs8n/1CdAynaFGCrQex0ViwrWVbY85i1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7xu1LlhvKfsXDGMd16BZ8HtDF6hukn+suFifYrRR6w=;
 b=JFIAGIjf86ufX34+PqAcuo9j2M8KBDj+3/usdTBw+HZZwvX2sHyx0bueQiiMJRRoR4ce7UC7p2+Bi+18o/5TsS+PAW3FT0APgeiF/28u8p5x5hqzmXdlXPedhxL85d2D0lnSZVT5EzpUOK8K/S4VsGK2SgcUPyAq4a9bI3Oa9Mc=
Date: Mon, 18 Jan 2021 18:10:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/CPUID: unconditionally set
 XEN_HVM_CPUID_IOMMU_MAPPINGS
Message-ID: <20210118171040.6ube5htw5lk4hifc@Air-de-Roger>
References: <20210115150138.36087-1-roger.pau@citrix.com>
 <7535c962-bb3b-6bca-977a-9e8a3332a0f5@suse.com>
 <20210118155426.tnzw7kiceqyytqwa@Air-de-Roger>
 <f7b3c154-7557-ce1a-c8d8-560709f6cabc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7b3c154-7557-ce1a-c8d8-560709f6cabc@suse.com>
X-ClientProxiedBy: MR2P264CA0034.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::22)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06a9b279-86cf-4be5-5c74-08d8bbd3ff08
X-MS-TrafficTypeDiagnostic: DM5PR03MB3212:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3212D90A496199349EF1DDBC8FA40@DM5PR03MB3212.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2SizCX+VQS/C/cz7rJaAXfyClhBzs+kxYQshsF0/ZgyPLdNwKRWlcGPcG+ZiuWXAJ67j2aBQvXmq+E/G/rq67F5INoz4LDswNLxarfN9Ike7cBxFNPWnm/gjGgvRvLs5R6QOVadB82Nc+S2U0wdgmalYcLPPLFbtBCd9kPmTiKStcSvY28MKB4O4FhmKJbOCryytlziLfFMILUZvv27Hag3z/yAm6NNVrz0/4DOhi8Rn2QXdEDMSIi0FkCP3oHudHSuNJq6vWr+D9U1CVgEwfN47A05yb/l1QNrwIAhW5LGS/WTKe9ykT5H5rsezi/4ZTxg8juGwSNjv9S3xSZfPI9QT2H+6aUiawbA3yG29CbvQVyiTPBRzoD1xs58UUdXBwve+E/jUd9cIppj+PqohwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(66946007)(66556008)(8676002)(66476007)(8936002)(16526019)(9686003)(5660300002)(4326008)(26005)(54906003)(6916009)(85182001)(316002)(6666004)(6486002)(53546011)(186003)(478600001)(86362001)(33716001)(2906002)(956004)(6496006)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dzUxR1ZrWU5GL3hhR2kvSWN2UW5Sbk00N2JhNjVNam90YnBjMHFaY0hNR0FF?=
 =?utf-8?B?OHBVcWk5aTh4QXFSWmlJRjRRZXdsY1lGelNTU0U2eXljODFhbGk4RWgvWXFr?=
 =?utf-8?B?Nm9VeHJtQVZPKzNNOFBMMGE0bDRVckgyTjJqVTFMbmMvSUlGQWc0WDZsbVFG?=
 =?utf-8?B?bGtMUEx3eUl2eEQ0d09rMnQ4K1pwcUJCcytlYlRpWFhEa2FJclhGb2hpNFFH?=
 =?utf-8?B?NXo5a2RtVktvQlFjc2E2NWFoeWEyd2JFL1pnV3NkSnNuM2JHS1BEZjltYkx2?=
 =?utf-8?B?bVFFdnVUNWFZYUN0cXBrWVBuVTVqR1RsOWg3YTAzemw4aXNjYlJ6SzArM3k1?=
 =?utf-8?B?cENndXllbGxsUTFBV3VpdlA4blZUZCtZYWU1cVljZmdKVnJzclZncG9pZTV2?=
 =?utf-8?B?Qlg2aHlTT2xISUFQNVVJR0xCaU9mMWVBcjErVEVlSWNlY0QyZk5jNFZkekJY?=
 =?utf-8?B?Qkh3ZHJpTE5aVUpBd2VvNEJab0pUUG1ERkwxSTFMSW5tVVl2U25ackFFQVBy?=
 =?utf-8?B?YU5veWRVQ01UUC9qcDB1azk1WjIwalA5cHc3QmdMSGdzQXhaL3k4dktGb045?=
 =?utf-8?B?Q1VOTGx2aVMzV0NxeEFvVnRNd0dPMDJDSjI1TGRsSTZMcHRKU04xQ2x4UkZY?=
 =?utf-8?B?dVl1a2x4enZiWVVBZnYrVlhhQ2RnTlVUNnJJUzJ0dzFEMnNxVnB0M05XdVZX?=
 =?utf-8?B?NDlFeTROUHY2eU5POUg2RW9Pb0dVM0xxZkVqTTZod081YUliNGpGUW9PczFM?=
 =?utf-8?B?aTNCZ001aE8rVHJ5aUM3ZlFCQjREVVcvcWhsbWU5REZETHJaTkh4Nno5eDFG?=
 =?utf-8?B?SGkvWWZ3cHphNENPaHlPVDVnNUJpc1YxbmhyZmRrdnJhcGZZZFA4c0NKdFVB?=
 =?utf-8?B?MUpicGo4QUFpbjhUcnk4bFRndXVSSnVDdG0vR295SXZSNnF3WkVNRFkxZUhC?=
 =?utf-8?B?L0NCeHFLOTRNMFhFUnhsaHpKM09wWFJxeHZMWkJlWElQQWhOSlRNaHg5Wnlk?=
 =?utf-8?B?a0ptUVhnTEJSZ1dtZFJnRjNEMVdkck9CZjFpK29rN3cwNWNqSVRwRGVycnJK?=
 =?utf-8?B?aElwMjRnTzNUcjlRTHNkM2llWlBOc2hNdXI3bVN6dVdSdldoaGtxRmxKV0sr?=
 =?utf-8?B?eGRzZnNDckkzV2l4M1AvWElBb2c4L0RsN1Y3NGI2bVhldHlQcjRJR1FpTGQ0?=
 =?utf-8?B?bE42UHZqM0x0QlpmLzlVbGVwaHFHQXdPZ0tmTDREK0ZYWnlCeGk5TXVsRjV3?=
 =?utf-8?B?cTNIcmt4N3JlYmg4S2YxVElkaW82UHNkMklOWjdhUkhYSllYWjg5dUdLdnZx?=
 =?utf-8?Q?IEAPqISrgubVvbm3qpKQAON5hVvrb8yJTk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06a9b279-86cf-4be5-5c74-08d8bbd3ff08
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 17:10:46.6347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k2pg1kjNmv8VZeK9skpBnBeTt8HCHoqnzYZhiR3DvcVhRsMDrFY6Ok22MasZ2JbKGqhNFpe2XZfZtYnKja7Lyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3212
X-OriginatorOrg: citrix.com

On Mon, Jan 18, 2021 at 05:04:19PM +0100, Jan Beulich wrote:
> On 18.01.2021 16:54, Roger Pau Monné wrote:
> > On Mon, Jan 18, 2021 at 12:05:12PM +0100, Jan Beulich wrote:
> >> On 15.01.2021 16:01, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/traps.c
> >>> +++ b/xen/arch/x86/traps.c
> >>> @@ -1049,11 +1049,10 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
> >>>              res->a |= XEN_HVM_CPUID_X2APIC_VIRT;
> >>>  
> >>>          /*
> >>> -         * Indicate that memory mapped from other domains (either grants or
> >>> -         * foreign pages) has valid IOMMU entries.
> >>> +         * Unconditionally set the flag to indicate this version of Xen has
> >>> +         * been fixed to create IOMMU mappings for grant/foreign maps.
> >>>           */
> >>> -        if ( is_iommu_enabled(d) )
> >>> -            res->a |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
> >>> +        res->a |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
> >>
> >> ... try to clarify the "Unconditionally" here?
> > 
> > I guess Unconditionally doesn't make much sense, so would be better to
> > start the sentence with 'Set ...' instead?
> 
> Hmm, this would further move us away from the goal of the comment
> making sufficiently clear that a conditional shouldn't be (re-)
> introduced here, I would think. Since I can't seem to think of a
> good way to express this more briefly than in the description,
> and if maybe you can't either, perhaps there's no choice then to
> leave it as is, hoping that people would look at the commit before
> proposing a further change here.

/*
 * Unconditionally set the flag to indicate this version of Xen has
 * been fixed to create IOMMU mappings for grant/foreign maps.
 *
 * NB: this flag shouldn't be made conditional on IOMMU presence, as
 * it could force guests to resort to using bounce buffers when using
 * grant/foreign maps with devices.
 */

Would be better? (albeit too verbose maybe).

Thanks, Roger.

