Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F06F2367C70
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 10:23:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115190.219658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZUbz-0004k4-QH; Thu, 22 Apr 2021 08:22:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115190.219658; Thu, 22 Apr 2021 08:22:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZUbz-0004jh-NJ; Thu, 22 Apr 2021 08:22:59 +0000
Received: by outflank-mailman (input) for mailman id 115190;
 Thu, 22 Apr 2021 08:22:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=96sM=JT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZUbx-0004jc-W0
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 08:22:58 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86d2ed67-4ac4-4421-aaf7-5ebd91c4eb7d;
 Thu, 22 Apr 2021 08:22:56 +0000 (UTC)
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
X-Inumbo-ID: 86d2ed67-4ac4-4421-aaf7-5ebd91c4eb7d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619079776;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Y4lNxyVgsMVbaIucCjAbcoKGyiLMLQPTMdVvUgYNA/Y=;
  b=RMK4NeeP4fmkyeAIGl+DP99FUeFPoarbY5UNB3b2/MdJY0FnIMllA6Y+
   NUyiHdszBq5nyQZ3aCyoYi1bedLfDGvOSZRgGq1wOiSBi9Y06ulOheWcH
   X0/nsZzIU85kqlYBzWh6P1BbEMxYSgltcAA29tLJ4VgTbdovmfKeB6VJ3
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1/LkR1rAdFP0ghiLJ7lgKEFK0gkb3U82qFJBRnv3Cpwa4Vpur3aEY9olnfooT5eQp+e1OdfxlT
 xZ2Pb3lcKIvDYyHmuhqrdzEShp/t0CyWw0A3KqwNOQ3FxTlTHuyb932YS0ImImRGVdRvT63FyO
 IqOTbdiqMlcjBrgjfidPYh1xU3b5fj4nerWB+a9B/GD4crXpml2ntGm6kuelSrlpQOc3MRiFjS
 Q/BT1r3erYtcMdo6f6hkzjXdQEliC7GGmxI30DPqhCYlaYY5WkZncEZXJEKG6iVJd7j0cyAmGt
 SJU=
X-SBRS: 5.2
X-MesageID: 41986036
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:fZdtrK5+i0QBd+PYvwPXwTuBI+orLtY04lQ7vn1ZYQBJc8Ceis
 CllOka0xixszoKRHQ8g7m7VZWoa3m0z/5IyKMWOqqvWxSjhXuwIOhZnO3f6hDDOwm7zO5S0q
 98b7NzYeebMXFWhdv3iTPWL/8O29+CmZrHuc7/yDNXQRhue+Vc6W5Ce2SmO2lXYCUDOpYjDp
 qb4aN81l2dUFAadN6yCHVAf8WrnaypqLvcbRQLBwEq5WC15FvF1JfAHxeVxRsYWT9UqI1SlF
 TtqADl+r6l98iy1x607QTuxq5Lk9jswMYrPr3ptuEpLFzX6zqAVcBadJCp+Bs0p+yu71hCqq
 iynz4Qe/5dxlmUUmW8oR7G0xTt3jA0+xbZuCGlqEqmm+PVbnYXDNdAmJJ4f3LimjsdleA56o
 1n9Sa4sIdaFhzJliiV3am5azha0nCajFBntMx7tQ0nbaIuLIV/gKZawWZuVLAHJy7+4JBPKp
 gSMOjsoMx4XHnfU2rUpQBUsaSRd0V2JDiqaG4YtPeY1jBH9UoJs3cw9YgkknAM+IlVceg+28
 30dqBhlLR5RsQLd65KBOAYXcutCmDWKCi8Sl6vHQ==
X-IronPort-AV: E=Sophos;i="5.82,242,1613451600"; 
   d="scan'208";a="41986036"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lg9WDmQalOeFAM/a5ZPJBKKJFyCVl7N5JMYKQ2+TaGqsCfphMmLMvIHjhDGnoF2MzU4ZQMCAqA0TLI2bSRJA+GishIUJVKoIl63ivvWSMsjz+j2bRS/wc9r1vuCMIa3Mn25dztp5/+quKAod4/zxuekK17t3M8noZnNbcxEIPXrSFc35o06UXXACEgqFk6drfytqpc1MAPomuYTzphrymqz1bQuErEmyLlY9HZVVCp6W+X1p5NwZ/bQPSddj2KN5sK45wBspRu75rLwTD45OevSOwUqdY4iAoGoexQvyzrGZxoDkzJI+E7PX/uibqE3rdK3T3ab5fvdcEVDBbCc4Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsYFj6pL/DkA8o5Fac6fLwB9XME9+iCdQ5VY7V6Nmuk=;
 b=M6qpfb79Ux+nakg2IhQxpuFLBskfNCdNOdcJF+XV2IfpI1rm+Ee11tu+R2xlzij4jY1KAkMcSEukQvkB1hVPIFOgtXjD1yL5XuPl8Bs9SV8Du2s+aEYVBf5pIubGik1Xcg8wbnTzuQc+pVTEeDp8KHKIJ4qpYRrsdCr6Fdyma+VoP86biTzg9P9jDf1icvmqjlh/URQkEZxXM0TufyX6kP4GKM+VSmj1RhrSxqiVkzKdTU2Tu/6RcobhogmeTT2+dtIoNt/xxhWBhjS9fd2Wo0Wn/zTkv1nVce31hgnlKv3KeCPZBXJ/t/XoJG7DPLFQCiNgrMZ0C12T3/XF6fS6yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsYFj6pL/DkA8o5Fac6fLwB9XME9+iCdQ5VY7V6Nmuk=;
 b=ttjw1WNF4KVj6YDzPq6Tp05MSs7WERWesKIa2Oiz/80V3PBjP4w4k/zA5Wjef/+tEFbQ4wgI+SUiLB6FYYTDTL0QpF5lDTWZpXtrgnRP5xErcFaWZKqe4Os2KMyRieU+IdTDWlKeDb89KE/MBwWjFSsBWKDwFTujWMddsftRUjY=
Date: Thu, 22 Apr 2021 10:22:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 14/21] libs/guest: introduce helper to check cpu
 policy compatibility
Message-ID: <YIEyTZ5E1StTMIBk@Air-de-Roger>
References: <20210413140140.73690-1-roger.pau@citrix.com>
 <20210413140140.73690-15-roger.pau@citrix.com>
 <f20144fb-9ed5-1819-1d00-13506ba2178e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f20144fb-9ed5-1819-1d00-13506ba2178e@suse.com>
X-ClientProxiedBy: MR2P264CA0010.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fc9b30a-29b9-4ae8-0291-08d90567cc94
X-MS-TrafficTypeDiagnostic: DM4PR03MB5968:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB596858664B37B54B624E56C98F469@DM4PR03MB5968.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:605;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E6CLknTNbzH/qAAIJ2ppuW+QZ/HFwEbIl2wF8mHuVfFxPOEqRXT9PDCnGzyS41rOUS6tEV4TV1+fxJPWp55r1ziNYPbjH60IwKnJVK18wzbjuf8gYrUquXWQ2kbR/RLJYktrf/CiMRdZArFdXsfuR+abWbrqlV1x5tkhFkzOHtXGwK4aDrGtP9GCZKlb51YcgweoI0j11Zr+GRbdfPIXHhHJvaE5OT1nx2ddT+BEYLujVIKkRerO6QdxosEoneVdG6ojFzFmqCuZ6NeKbyOKA2QQqkvR6Gr+FD33Bzv2VQrOcjEqng/7qHmriDbyC29F3ZCHUs5G7ML/JqDK1wkePwfnBjVJGshbQ+TgS+Xojq6gSVWbED4egTIZ0J5jB4cLgRul8NYd/db9QB++lIizK1SMvHJCwKcxWMpiJmItpIpVRfd77HZROS0SfYF+D8dea40Vmu3tu+2WitJNCPGQCpo7FxUTfigPYxVdDSsOirvfJS9Kk/hMuPiquQUON3raoVod7O2SIyC3jZWPi4P+enyW8CI1GCG3HsCP/ocU7Ue5CEcsotaCA/kUeM5GGgMW/BvbcR76RC+l+eoCNQjcdtmhLVdV79PQYMjcYBeJD48=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(8676002)(8936002)(33716001)(53546011)(54906003)(2906002)(6496006)(85182001)(9686003)(6486002)(38100700002)(316002)(478600001)(26005)(186003)(4326008)(956004)(16526019)(86362001)(66556008)(5660300002)(66476007)(6666004)(66946007)(83380400001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L2Rqd2ZqMklGK0N0c1hPZi8rU2w2R3VVOTRUVXlrSVoxYUw1aDBTWWZQaVJi?=
 =?utf-8?B?eUtnMTVUazI0WXh4bEg3S05IbHFRSjJFelZLSU1NcmRsSzJaN1lzdWdkWW9M?=
 =?utf-8?B?ZEdKcFBLdnlMQVBZVVBKMzExYjhrb3JrRHpQenJxYWxTL3pON1MrNVFMeGp0?=
 =?utf-8?B?bERCU1JJcnRMcVBxeGw0dEZxN0V6dWNra0J0cGFvdWo5cFpobUpwTEd4cFFH?=
 =?utf-8?B?cDFNaWVPTTZyRDVTOXpLZThiRGxDUmdEYklFeDd2Uy9JVGdVVHRrRU9xcVd1?=
 =?utf-8?B?VmY2eGpUcWlTRnZNMlJxd0g1Q2NtV2RTS1VlWGJCMnJQcjF5YTZuNFdtczZ2?=
 =?utf-8?B?RGlIdDhBOTJuekw0aTJxUy85QXhMWDZpU2traHhmVlBEL21ZZk8yTUd6Vi94?=
 =?utf-8?B?cWNRZEt5SzJUNndOREhtNzhVUlNsVzVSb2I3R0NjM2RCbURKWXZpRklEOXN1?=
 =?utf-8?B?QUJ2aFNRTzlST0NlT1dqM3RWanFCTWd5UkxIcFJDK3N6dDlreUhaRmxrUXZ6?=
 =?utf-8?B?WHVmYmQ0T2hVWlhkb3ErQVZMMUJCbzdkZWJGclg3UndzeGJUWFBtd0szWE83?=
 =?utf-8?B?YzlGL0lqcGtDZWFaVkRLd1JCSUY2bThkYUpJclVKblRKUVNIUmJYNXdWeUdo?=
 =?utf-8?B?UzdNNlhrd2xvTTI3UEZmMUt1VXRjcllyQURHQjBmZ0tOb2drRFhlRHNIY2p3?=
 =?utf-8?B?TXJnN3g3Q1V1TUJzcHdtMTFPcFFhNGZ5SXppaFVOek1heEovaTBRblJOeHMw?=
 =?utf-8?B?cUU3V0ZjN2lUUlcvbUg3T2Y1RTZjZm5tdk5QanhZbGhHQ2NPalIzQ2ZHTytx?=
 =?utf-8?B?SDlSZDlIL0h2MUd6dzZmbmJpbzVuMkxpdDRoekx0MEU4SzFadmY2OHUwL2Zu?=
 =?utf-8?B?UlBlVDM3RENqN1Vqd3NMb1liMFN6ZzhKR0hCcUc5M3VsaXR1ZE9pSHVuMkR5?=
 =?utf-8?B?Z2Fibnl1emZmd2Jpa1ZRQksreEJ2ZUdrQi9GWmJ6V0IzYmI4NjVnY2VRQ2NB?=
 =?utf-8?B?UnJWOXpRaXZoK0tTMkdoR24xMTZlakt6UE1oL2pCd1BRKzVpSlBmMmRrYjFH?=
 =?utf-8?B?dmRTVkVxRFloT3pGNDBTajY5RjgxQ2hpZ2VmdXl0Mlp3Q0pQRnUvQVJIVjEz?=
 =?utf-8?B?WXZFbkpPMlE0anhDTTRtQis2SXRWZk9ab2pCMUo2bU5YRUt2dmt2bHdOaEN2?=
 =?utf-8?B?R0JJYnFTRnIzMG9taHVqWWtvQm1jY1RNZWEvYjlVS2gxSDZncjlkL1NtN3V4?=
 =?utf-8?B?NTNTTjIzT1Y5U3lsTWJkd3AzYXZQUXN3ZjlxMEZBaVdRZzNYRDhMbU9qbWdI?=
 =?utf-8?B?RUp2NlN5UTNSaWw4dnpHcE9NbVg4N0tyUnBpaVVHanNIT3p5dWxUM09qaWNi?=
 =?utf-8?B?ZU1oMjMrSjA0YXROeFVWL0pBVVJDS1VoWW9mNFQ2a0xER1RiOGhPUko3L0tD?=
 =?utf-8?B?WWhCWk5RbE1raTUrR3hPYnVzMGdJWmd4NU1vN2tPVWxrTHZ1Uk9YZVJxWm5z?=
 =?utf-8?B?YWxNSDVzenFtMk1JWHJGSkRPWnRuL2J1SWdXbGZScVZ5VjVFTzJRMjRKNmk0?=
 =?utf-8?B?QlVpUDAzV2xOY3Y0bUtJbTltQjRybm1iSlpvU3RrT3FOTGUrQjF2U3BIeEZU?=
 =?utf-8?B?YjI4eFJRSFg3OFJwcWZzNlEvRzRHZ0RtRVBlSjdCV3ZPK0VZZVNjT25WRzha?=
 =?utf-8?B?R1BRVG9yMXordHpYRThqSU5NdzFBMjlYSVUyL2NXMS9lN0lna01EL1A3L3p1?=
 =?utf-8?Q?snthXM55zh0h5VliPAa9leAX3CknWlYq49EmQ8F?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc9b30a-29b9-4ae8-0291-08d90567cc94
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 08:22:42.3390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dcToHDoxM1KzGYwXbOt3oA46IlwgLbC0OlAF9oTftTTEP2ezNskP4fEzlrjftp0YlA2sjGrZx5V9zcrr4SBjAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5968
X-OriginatorOrg: citrix.com

On Wed, Apr 14, 2021 at 03:36:54PM +0200, Jan Beulich wrote:
> On 13.04.2021 16:01, Roger Pau Monne wrote:
> > --- a/tools/libs/guest/xg_cpuid_x86.c
> > +++ b/tools/libs/guest/xg_cpuid_x86.c
> > @@ -925,3 +925,22 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t policy,
> >  
> >      return rc;
> >  }
> > +
> > +bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t host,
> > +                                 const xc_cpu_policy_t guest)
> > +{
> > +    struct cpu_policy_errors err = INIT_CPU_POLICY_ERRORS;
> > +    struct cpu_policy h = { &host->cpuid, &host->msr };
> > +    struct cpu_policy g = { &guest->cpuid, &guest->msr };
> > +    int rc = x86_cpu_policies_are_compatible(&h, &g, &err);
> > +
> > +    if ( !rc )
> > +        return true;
> > +
> > +    if ( err.leaf != -1 )
> > +        ERROR("Leaf %#x subleaf %#x is not compatible", err.leaf, err.subleaf);
> > +    if ( err.msr != -1 )
> > +        ERROR("MSR index %#x is not compatible", err.msr);
> 
> Personally I'm against making assumptions like these ones about what
> (in this case) INIT_CPU_POLICY_ERRORS actually expands to (i.e. three
> times -1). I can see how alternatives to this are quickly going to
> get ugly, so I'll leave it to others to judge.

Would you like me to define a separate POLICY_ERROR? ie:

#define INIT_CPU_POLICY_ERROR -1
#define INIT_CPU_POLICY_ERRORS { INIT_CPU_POLICY_ERROR, \
                                 INIT_CPU_POLICY_ERROR, \
                                 INIT_CPU_POLICY_ERROR }

We already have a bunch of open coded -1 checks anyway, but might
prevent new ones from appearing.

Thanks, Roger.

