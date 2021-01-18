Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5408A2FA53F
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 16:54:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69825.125119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1WrX-0006Hd-VG; Mon, 18 Jan 2021 15:54:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69825.125119; Mon, 18 Jan 2021 15:54:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1WrX-0006HD-Rt; Mon, 18 Jan 2021 15:54:39 +0000
Received: by outflank-mailman (input) for mailman id 69825;
 Mon, 18 Jan 2021 15:54:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wFfa=GV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1WrV-0006H8-I3
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 15:54:37 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc46c6e4-f74c-4561-a630-3bd7e651e2f5;
 Mon, 18 Jan 2021 15:54:36 +0000 (UTC)
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
X-Inumbo-ID: bc46c6e4-f74c-4561-a630-3bd7e651e2f5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610985276;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=BL0b9H4HinE4UlZMmt+tGW23jg3w2rJ5rIPYLzUUNdA=;
  b=gibIX2Hy/PdBK+wyyphD7yFCgp1UK5Nesa5sUh/jFRgD4mVjNe19ObWo
   JRxicmbcmab1UQM8F9Tf8V4Biug0l+EzIqnWpm6xdGDOf4yZHSOE3z/sD
   rlZBtQ310e4aEC6Wd4UaVwgDkNCHOWqnSntAYCtjd9sFcybz2DipOKS3h
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: v79t6nKWOaWsMwJB5iMgVIFNowytB+mnjts1SnvcG4phufEZbPxqM3+BXetDvQ9w2mEFLfUSx3
 VtUV/WWKVOupe1n7tOzXgVrgrPmoGngFiqwT28CpG4oyDbzh/0cl5+3xMxpDXZ+q5BIFL2heWg
 wiM+xYebz+xU11/m/GO8KPIsUGVCh8BdNNSVPvSteqsPYBzMJ5wmE7xn49paw57lzyu96ZorbU
 DBWL7C8ZDOcMsPMsBubSD15qaz5JafrAvwMy6OSnbQbY3/bXhcHcnyFeOttYC1yDbO1u3cCkCW
 VuI=
X-SBRS: 5.2
X-MesageID: 36605503
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,356,1602561600"; 
   d="scan'208";a="36605503"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCotVNOUwl9yLFeVQ6y1nNrMM20fKNdJ465ZE5HmGdoDQWB/h24abCgN+LisruDWLLgacj+YMYnx/BqU2p+KS4mxDbSFqn7p7PlL61ZfWV8lKibEr2g9tYxHvV/J5zcPqnIq1bonTd4ALWiyY7DK2/NsnjADku0rtBUCGSJubVQSDeebgW2VgkjBVVHgSewvXzCwzh2jxlJRoUJUS0i2CPlhESyxNZW74FhXmO1dU07sqH2tsXKMoaJvN2lUmd7kmQvrRwFCBiNjmuxisbMUYiqFvGnG6BNBXGjeQzBmOg5Wl8QLTkU1Wv4Qvo11G13ZJa9d4tF6dSVPlcpmZjLq5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v225mOYrgURIWcbJPrDz4g3r/oIu2ammJXZGzgSQivs=;
 b=K0Ubc7jTCeefFal2deC2uaoX03C9Ok/99b1NI9ddTDA3tr/gEKvWgZ4mfgrbwqKK+gG9CdE5Q0e0TXlcKsOCqajrKh8pE/LA2O1DVn3E4aujVHLgXoQRWJgxpa6DlBIpiQOSwqEDV2qVv0o9Hk2cfe8/CpxQ+ghICDRl6NJC8qX4fN4Fi+EI+jnzYGVdAZXj3qjuH+tisToHJ8Bnw9YMqJSdOQUjH2U2OBZt84ZXyDDDOKT9+FHJ3AYS9dOHH55I91b4swPkXj+zr4VR0OueanfpnglbnjtuLmRop2RwDNwfng22NaN1uNpnvvY7CNNE6nkdC89Is9dz2WjKIPDUoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v225mOYrgURIWcbJPrDz4g3r/oIu2ammJXZGzgSQivs=;
 b=RWdhNcOjQ1Ey9tYGPnDvKg7rDXY4+64Rz1ZTCxjbgcSpOraCtgrkDjeS4XxxiK+ngWl2L4TDMFj1Lcn0g0OQaCuNUvw0kWE++q9JzUlTNViYfuOxYkKn+tD06cxPCPvoQusMVzRXVl4BnlAErpx1+fXaBI2qjYZOvrT6YzJZb7I=
Date: Mon, 18 Jan 2021 16:54:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/CPUID: unconditionally set
 XEN_HVM_CPUID_IOMMU_MAPPINGS
Message-ID: <20210118155426.tnzw7kiceqyytqwa@Air-de-Roger>
References: <20210115150138.36087-1-roger.pau@citrix.com>
 <7535c962-bb3b-6bca-977a-9e8a3332a0f5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7535c962-bb3b-6bca-977a-9e8a3332a0f5@suse.com>
X-ClientProxiedBy: MR2P264CA0038.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::26)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1ea60e8-4b62-42b9-a74b-08d8bbc9583d
X-MS-TrafficTypeDiagnostic: DM5PR03MB3289:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB32893BE30621D2A58B56ED8A8FA40@DM5PR03MB3289.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o+0AOlqnzwlWonF8No6M2K8ZoZdTGJv9HT8Z968u64AiRyxn7C40P6dVTJJr04pdVDI9qFh7MCFQVHd0/xxkvuBUfHGtnIXMO7W7H8/KuI/H10MmE6BmNUuzr1jfHroKaq/2FNwSa9RztS4IlKen2+PR4kOXQNJoS9G0Dj7D00EcOUsIBgZEH/V3vIcw0lQl84CCtLDlmGKIpmB+u5c7D33UiLzyffRVv4Zz2fnIN+Gh9Tmi84H2FHzMaYgPSLg56EBlgZ9LkA1+aUfRelDrEaynnpy3ZKkGpQ6tRQjsyrWeQmeH+fuy+Skyk8SfOY7v3XSl9egqUkUwQM7hrCsU3UFRwCAii3i4W34Mr+WQI6Pn3HkP/xLgUHw1emOHnoLiWJfhlQjrMpKyUOCizx4DqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(136003)(346002)(366004)(376002)(39860400002)(26005)(5660300002)(186003)(6666004)(478600001)(86362001)(85182001)(8676002)(6486002)(6916009)(16526019)(8936002)(2906002)(54906003)(1076003)(4326008)(9686003)(956004)(316002)(6496006)(53546011)(66476007)(66946007)(66556008)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YWdsVzE1S1ZWMm9ZMGJsVkh0V25hK0RzNkllS1dRcXZMbWRsMG5aai92TzJN?=
 =?utf-8?B?dnNGc1hsR1BTRS9IeGhXOFU1QVQrSUMrY2tkcU5pRGRNYjdpbzU0K2FnTUxX?=
 =?utf-8?B?SktzMWhZQVNYRTN0MlAxVFBhbzBmd1RvME1MQWRYdzdxeHNMektUYjcxdXFy?=
 =?utf-8?B?cEp5Z2orT3hOOVJ4VTNMYnIvSHpvekFLV0VGSE9aZFNNeWU2dVQ4bEdFc3Qw?=
 =?utf-8?B?V0ROYmY4ZXdNd3ZDTm9lNHdJcnlKcXR2QzN3OGk0TVBUTHRWYlg3TGlyL1Yw?=
 =?utf-8?B?VldNZ0pjZVhLZ3hjemtkaHlPVzFTVm1VK0VtQ1Z3Y0YrbFY5N1pDa3VWZWNL?=
 =?utf-8?B?bVpXTnRxQ2c3c2wyS25BYVA5ZDdEdldEK294WUJ0eEk5aEtIU0hvZ0NRckto?=
 =?utf-8?B?dXRWNnlBRGtVdElwRk9JU0JzbmRmL2tWa1p2M3A2V29aNnBtRGNLdm5RT2RB?=
 =?utf-8?B?L000SHFsLzNyUWFaNSt3em15cUU1VnRucUE4NWJUYjY2SjE3Z3lHcTJmSERD?=
 =?utf-8?B?VnA2eHlhVjFoRjdJaVFCdG11L2VBelVpRWpvK3ZsSjlPMWJFb1A4U1Y0K0dM?=
 =?utf-8?B?Q3NDOGpQWWl0UXJjTlN2YWxtcHdCNlc0T0xKOHVkREs1eEJqaTBrSXN6TFRO?=
 =?utf-8?B?bU94QjhXUThJOTlpU1NpZEJMVlRkeTJSd2EzQmQ1ZG1RUU1yV0lQMUFZVDFa?=
 =?utf-8?B?TTRDOHlIK3IwRVB5T3IvWWJYMTF6ZUlYa1ZkODlpRHA1N3pmSUpaU0FPdk5J?=
 =?utf-8?B?S0FSb0wxQzR3dlI3dWtKaXlhR2lYTkNHdDY3RHYwT2VtU0RoaGJyaWxqK3o2?=
 =?utf-8?B?VmkvOFZNUDMxelc3QTZGVGo3Q1R4b2JKV0xJMkhVYTdGUWNxMTQzZXdIQWpB?=
 =?utf-8?B?djBDUUpEdXpSbFVTOTlxTXZDTEdSV0FKMU15U2Y0M2hPNVhiZ0dtQTdDZ01S?=
 =?utf-8?B?dVhaS2ZNRlluNHk2NkFHbmRkYyt4VHljbTJLRWg0NUtJazBtZmtWdTNIQnVD?=
 =?utf-8?B?OVNZV0lkeFRVTDNEZURLWjE4MGpQZlJiaUUzT1lHcXRMREFjN2lQMTR6TUNz?=
 =?utf-8?B?VTY0bDFua1AxRjBHWEh6MFkwUVlZNzhaWk1rUzRPMkJoZnJsdzl3Z1ZPTW9M?=
 =?utf-8?B?Ty9COWRqQzkrRUVrbWltWk9ER00zb3NOY0ZORDRFQXovTVdJQWNneU54dlQ4?=
 =?utf-8?B?YStwT0dxWnhFN0p0bWVxV1pGT2RKSWJEdXhpaGJ4UythOTB4WkZDaloyZDY5?=
 =?utf-8?B?WHRIUlk3Q2NqYXVablAxK2Vkb1NONnhvNGYwdFNydG5kTVlJTFFMc0FuTzZT?=
 =?utf-8?Q?ovaH+W1MCyC5IQgnzvOf3vkiTgqglrOcVk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ea60e8-4b62-42b9-a74b-08d8bbc9583d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 15:54:31.9347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w8m6bZLCy41tfYFxlF1GN646ZIhOgU9OaXoCB9r/Wf4Lz40GtPwjKH32hpABBPUuJhCz4J12bvo8NyzWMtjcZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3289
X-OriginatorOrg: citrix.com

On Mon, Jan 18, 2021 at 12:05:12PM +0100, Jan Beulich wrote:
> On 15.01.2021 16:01, Roger Pau Monne wrote:
> > This is a revert of f5cfa0985673 plus a rework of the comment that
> > accompanies the setting of the flag so we don't forget why it needs to
> > be unconditionally set: it's indicating whether the version of Xen has
> > the original issue fixed and IOMMU entries are created for
> > grant/foreign maps.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Despite my earlier ack I came to think that the description and
> comment still don't make it quite clear what was actually wrong
> with the prior change, and hence they also don't really guard
> against the same getting done again (perhaps even by me). May I
> ask that you add a paragraph above and ...

What about adding:

"If the flag is only exposed when the IOMMU is enabled the guest could
resort to use bounce buffers when running backends as it would assume
the underlying Xen version still has the bug present and thus
grant/foreign maps cannot be used with devices."

To the commit log?

> > --- a/xen/arch/x86/traps.c
> > +++ b/xen/arch/x86/traps.c
> > @@ -1049,11 +1049,10 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
> >              res->a |= XEN_HVM_CPUID_X2APIC_VIRT;
> >  
> >          /*
> > -         * Indicate that memory mapped from other domains (either grants or
> > -         * foreign pages) has valid IOMMU entries.
> > +         * Unconditionally set the flag to indicate this version of Xen has
> > +         * been fixed to create IOMMU mappings for grant/foreign maps.
> >           */
> > -        if ( is_iommu_enabled(d) )
> > -            res->a |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
> > +        res->a |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
> 
> ... try to clarify the "Unconditionally" here?

I guess Unconditionally doesn't make much sense, so would be better to
start the sentence with 'Set ...' instead?

Thanks, Roger.

