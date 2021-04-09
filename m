Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F007C359C6E
	for <lists+xen-devel@lfdr.de>; Fri,  9 Apr 2021 12:57:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107757.205977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUooT-0006k9-Hx; Fri, 09 Apr 2021 10:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107757.205977; Fri, 09 Apr 2021 10:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUooT-0006jk-Eg; Fri, 09 Apr 2021 10:56:33 +0000
Received: by outflank-mailman (input) for mailman id 107757;
 Fri, 09 Apr 2021 10:56:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3s/Q=JG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lUooS-0006je-0u
 for xen-devel@lists.xenproject.org; Fri, 09 Apr 2021 10:56:32 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebb269a4-a5fc-4a7a-807d-d8a833e23072;
 Fri, 09 Apr 2021 10:56:30 +0000 (UTC)
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
X-Inumbo-ID: ebb269a4-a5fc-4a7a-807d-d8a833e23072
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617965790;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=MT7U6SxAigVHHZNj3Wq9gC0nrrTqxN1prRI8mG3ghjo=;
  b=TzdNbXNpeCd6muH1ql1dEojqmS0T007wegruOe8L297FWX0k4iq3s5Ye
   /5bm+aARsyXoLyLYuZyng1U11vsr/wsPk9G2W5KL9DHE+t3h67xZ4X21v
   Wr+yGYC9/y7p0aOV1jy3jaAY8ZOix1aAqX3vXaInctCgWOSDn0h/By+ZP
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tHsTcTozPTuDfvOgVmgYz6TAA6hvHR92EREwUJfx16ohPaTYXSqrBrUcrFep3SGcPeXa2Y6O2W
 uk1Zy3KUKfI9vtfwVr1nFhNQHWCr8AzvD7+kUY1DqVhJ0v/CU12DvPLB+gid27b8fGZNVhiS2Q
 iTHjtKzuEMpQJO/AKbU+wcKwMBwt/Jao/YVJ13cNfditVRPIGIJuJD0UuSdKwBmY5GYzPtUB2t
 QBm5mMph3IFQ+2LYBSOVEXpLjV/CrbfT2bt0W3CcLlb9pRU2GpUASHM9+E/TdLGmF4OvepeQfM
 eNs=
X-SBRS: 5.2
X-MesageID: 42722653
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:EThsv6nNK1M0V3FGGCgLgiPJd2jpDfP+imdD5ilNYBxZY6Wkvu
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/NIyKMaVI3DYCDNvmy0IIZ+qbbz2jGIIVybysdx94
 dFN5J/Btr5EERgga/BijWQPt48zLC8n5yAqvzZyx5WIz1CT4FFw0NHBh2AEktwLTM2YKYRMJ
 aH/MJIq36BVB0sH6eGL0IIVeTCuNHH/aiOCXI7LiUq9RWUineQ4KP6eiLy4j4lTzhNzb0+mF
 K18TDR26PLiZCG4y6Z7UD/xdB8mNztytxMbfb89/Q9G3HXpSuDIKhkU72GljgprO+o80ZCqq
 ixnz4Qe/5dxlmUUmapoQb8+wSI6kdQ11bSjWW2rFGmgcvlSCk0A8BM7LgpDCfx2g4bk/xXlI
 dotljp0KZ/PFf7swnWo+XsbVVMkHG5pHIz+NRj9EB3YM8lR5J66bAE8Fg9KuZnIAvKrLoJPc
 NJF8/m6PNfYTqhHgrkl1gq+tCqU3gpdy32O3Qqi4iQ2zhSqnhz01EV8swZhmsB75IwUfB/lp
 z5Dpg=
X-IronPort-AV: E=Sophos;i="5.82,209,1613451600"; 
   d="scan'208";a="42722653"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwdCYCYvaGqGX6y8sLEANfnTsKeDhWQLoD2W6XdIp0iaRKQ+aQr9zWfqq9pnfx98Lc5tH/jvfFfH0yaLcWF5YT0NI73UVCdapPYQ3O/nSUviURojhc4EJ1T0Pek/FsxZ5U1NQ87aaUbBiHs7900559df30PcVFiGhaaEW3xA49olMulOg6LKLm86D9rp0qGP8EIAKQCnJq6fJEhj9TgEqv+eqUdD/QND19RSz4Zh+X0yKSQ3jEQwjHWo8fxnW4euHYzakBz17WsQ6CpRjvXUXyxftz4+zHixwTWC7Cgufh27gdk4q/sw1vdys81iz0cSPNNLOubdzC4W7dgh/59pDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHuXdYiIiqfW70ZQbMwQD1nDL2ufASXx4a3Q3N+euqg=;
 b=EM+immKPdW79Ceu4uxAruz8XE8CMfhRMZbtq5UP0JK6nFvq/x46I136oEzVI6emgIPTJaT6qbRH1fPzikkCOuyizb1VxkHND/jgQriy2TNi7ahC57xN+BAAFHsiUzH1r3ShZeDbTMbO+WX0lpoI/Veqwh7Nz5LK1h/1ZYAtZtFE+0Zw06UMg/99xshnNoVaWHTVEnHosJTjU+PCNi0P8JIYmvCFe67gsTu6g462ItYs8zCyFLktirnjNPqimfWIvbhxX7lHhR4lGUnRa0CoJwYvfT+eE0EASpGpoHyLZFYR0sZ79cE6pma61y4upnnJAXHu94PGOH8LcYrSw4omO0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHuXdYiIiqfW70ZQbMwQD1nDL2ufASXx4a3Q3N+euqg=;
 b=b1BwSKbUDg7qTzXR2IDbRQ70Bb/yCDH8s2b+kyUwMDhnLdIItQ6Zd8rlW6j8zrcDgQ0a3gsNsW54Iqzm/VBu8IBMPOsqhfrnGiJER/xCFAYyBckwVt9fgVKHwNPPmbOYYQghsI1CdBnU7g6OdMOMzUrlkjZzmdE8okx+oCfPocI=
Date: Fri, 9 Apr 2021 12:56:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 15/21] libs/guest: obtain a compatible cpu policy from
 two input ones
Message-ID: <YHAy1e7a4aEAKTYc@Air-de-Roger>
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-16-roger.pau@citrix.com>
 <d24e9172-3939-44c3-e5f8-08b76ab23c17@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d24e9172-3939-44c3-e5f8-08b76ab23c17@citrix.com>
X-ClientProxiedBy: MR2P264CA0095.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d8445b5-2d45-4d2b-471b-08d8fb461f80
X-MS-TrafficTypeDiagnostic: DM4PR03MB5997:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB5997030BCB68691B142EFEF08F739@DM4PR03MB5997.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jtE6hoHNyyRMTDBgZp+evRLkKXvelQyDdVpl21ZXesI7Fp6hqb9YZNR4g4TiH977JSRr9lKNBEtCylrogy5n+3nxYzZx2DN7rinDQe4CLCuVtWKzhaYyBQHDDm4Mp9lhxKBP0CZ7lcwQXVgwIhxgFx40Y6Ql/pv7xRttwS7kSYLlL2ojoVvmuXZydJl36Inv8j0mCY41isnYZiFLYPlwOX6fDXv1PPUNcaRBRdMKZh2jSgeIKWBNfmTOCE6ZtH6tZj6b7K6G6hTVuko2s+tyw1yiJiwHp3IgtzNqCGSUoNBTmB4DH/eKLNrhH3hUkLXW7/u2VMPPGbI/46KptQmQwi7tIlz6X8Cfanp4uctbD+wx3L7CGBwMOYp7LDQZ9fizQTJdpUh/JENTXZfhq6FezKgBhxri2KykdzKHOgKfxv2p5GTviHDwDs6zcZSM+PgBBAbA48XSr+HineM1LjIG4IsEHeCHJdByG4zbf87kW4P0FFb3WRGT6pMw8NnP0es7T/0gGCd55pjonttsG5i3t+zRgUioP1xbq4fsIjvF/rrPhjk59FU+zd3eS6PnXrlu4ynPQMuWHBCQ84UDB2X4086nMV1YYy+U5KSdCI/u1X5xBRzWZJ4EfRxrN+te1+CMoCbA++r7aLWrPqcaAKGLCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(396003)(376002)(39860400002)(346002)(366004)(478600001)(83380400001)(8676002)(4326008)(53546011)(6496006)(66476007)(66556008)(8936002)(6486002)(66946007)(107886003)(956004)(6666004)(2906002)(38100700001)(54906003)(85182001)(6862004)(316002)(6636002)(5660300002)(26005)(33716001)(86362001)(186003)(16526019)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VjBxdERMVXN4UUFwVmxoU093Nm1EVWRyNFlxQ0J0TFhqbzRocGJzWTB1clRw?=
 =?utf-8?B?TEhadTV1VXFydS9TNCtmYnVPaU1VSXprVWZUMXhsN1JqUVhOQUJBa1paREt4?=
 =?utf-8?B?anowbW5WTGl3akJ5TEczYUVCcXpJaHVNQ3B4Qk5IRjR1QUdFLzBiYUlmMUpV?=
 =?utf-8?B?QkUvQkNRdEZqWDNENFM4aVVmdjZrQ0JCQlFyQUs3aWI3UG8ycjB3TVU2WWMz?=
 =?utf-8?B?WUd3OXM5elNoR3BhdkNXTm5LN1YwMWcxMERjbW1hamU1bnNGNG9kbnVDLzdr?=
 =?utf-8?B?aWYrN2NZclA0bGZ1aEQrMWtzenZabDVHN0hXTEY5OElBSVI3cHI0UGRBU2wx?=
 =?utf-8?B?bW5tVURJNTVIbE0zQStCZTlKREppK3ZycWpHa0o5b0RCSVF6RWc3ZzdXT0ZV?=
 =?utf-8?B?N2IyRW1MaWFqb1N1dTRZUG1DaklFN1BxUkJwK0kxbnUrYU8vMm1RR2NlWG12?=
 =?utf-8?B?UTlnMEFQWEt4Y2xJTTArNTJMRGF2MlF1MW5kbTJ5NDR3empra04rUTQwMmJD?=
 =?utf-8?B?c0g3aWNmaytoTGl3UlByTWw0bUsvUmpkNGttYkhWQkw2MXRLVFVCRE9KUHZ1?=
 =?utf-8?B?bnV1RElhTGdyZndma2tJVzlienNzSS9WVzBZNTNKZEkzM2ppTUFwZ2dnNlFr?=
 =?utf-8?B?V3ppS1FHSjkxWnBYZk9xVk5pQ3A5ZFdFOUxEdWh5ZDBHMDBadDRKOXhIUVpN?=
 =?utf-8?B?ek94UmZ2U3Q2dHB5Z0R5YlN0ODBqMHBPOFJDSEkzOVRnMDAvZXNOYVpObHJh?=
 =?utf-8?B?SHpDSS80R2VyaDM5bkdGcGFLbWcwNmhidzJmUFRCQTdYME5xQm9QTllvVnN6?=
 =?utf-8?B?cUFEK2Rud01GV2JET2FMYzdHb2U4b1pnNzhvWnh5aHZPMEFSTGZRTjFWZDhT?=
 =?utf-8?B?aG1qRFFKNVJqNkNjVlZ6aU5BSXlwOFFhZ0ZVcHdQTTBwY3d1RFRKdVlUMGRh?=
 =?utf-8?B?RmtGYmNIZEttazNnditEZ3lzMmJHM2tMWHRlVFk2L3B2TGZjazNtSUwycWRP?=
 =?utf-8?B?c055RE1sMitvcWZPekluRWdQc0FKVGRpZ1JqRnhiUmhGdWJVKy9oQkpvbU4w?=
 =?utf-8?B?NVpnWDhwRTBZMVJoTnFzMnNlY091Y2E1aTVHeElQcTA0MUh2VWMxaGJ2bFN4?=
 =?utf-8?B?aEI4NHFUN21oZUY1SGdLaThCUTJNNXFpNWlHMFZmZ29lNXMweHB3Y1J1bEpS?=
 =?utf-8?B?WTBwcldHU3h0UGM5ZDdJdzhLQWFwWCtHSTVuck9RcExpUER0UCtGQlJuNE43?=
 =?utf-8?B?L0R0RFJnWk13WFc2RjByRnFJc3Zlb1VnNkdzSDlod2pIdnJyNGNKVk9sb2lK?=
 =?utf-8?B?SjJWb2hkVnoxRU1PSERpa28wWWdIZ2Q2UHREYlNtTmRmL3ZOakNabDRBUnE2?=
 =?utf-8?B?Y29wRXJ4emgxL2c2c1dXcDZ6S2piQk5YZnV4T3ZFc2JYTEFuWEh4UTYrTDEx?=
 =?utf-8?B?eksvTnpZREJ5cTkreEZiMXU3a29lM3QvSmZOS3dMSnoxZFl4N0RXQkIzUE1D?=
 =?utf-8?B?alNNL2VmY21tSkhwbUJXL3dHZlR0T2RvTHVWR2dPeXFGNnNSSWh3bzZjTkRN?=
 =?utf-8?B?U2VvRDFMRlJObG92VEhKaFFmOUdEM01SQlJ3c1I4N1pFTjRXR0hmc1BibEpt?=
 =?utf-8?B?bGlrRkNwd0xUNEplZjVvd3pMcFoxYk9rV0hUOVFSUGZPTUFiOEJrUzlCaTZ2?=
 =?utf-8?B?MEgwMEhNMENIYjNycnVhNXp5VlRjNU5leDlLRmRHVGE5SXBLVlJWMnNoWWk1?=
 =?utf-8?Q?4Epkvd1nHkcl+OAtZkWfZmQDni2BZtCuDMv8kBR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8445b5-2d45-4d2b-471b-08d8fb461f80
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 10:56:27.2273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Gk+K7/8+qPN02wmKHOPNE/zhlMov82ObLU32AC3O2oPXaJ1Xw3Y4ScKIDxo5c8oJbM/cgZNzUVEakRwqPM3Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5997
X-OriginatorOrg: citrix.com

On Thu, Apr 01, 2021 at 05:26:03PM +0100, Andrew Cooper wrote:
> On 23/03/2021 09:58, Roger Pau Monne wrote:
> > Introduce a helper to obtain a compatible cpu policy based on two
> > input cpu policies. Currently this is done by and'ing all CPUID leaves
> > and MSR entries, except for MSR_ARCH_CAPABILITIES which has the RSBA
> > bit or'ed.
> >
> > The _AC macro is pulled from libxl_internal.h into xen-tools/libs.h
> > since it's required in order to use the msr-index.h header.
> >
> > Note there's no need to place this helper in libx86, since the
> > calculation of a compatible policy shouldn't be done from the
> > hypervisor.
> >
> > No callers of the interface introduced.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> I think this wants to be in libx86, because we'll want it to replace the
> opencoded derivation logic in init_cpuid()

I think you mean init_domain_cpuid_policy or recalculate_cpuid_policy?
I cannot find any init_cpuid.

I'm not convinced we need this in libx86 for the hypervisor, as I
don't know exactly how we would use it there. I expect the hypervisor
to validate policies provided by the toolstack, but not for it to
create such policies unless for very specific domains (ie: dom0 or
similar) which shouldn't require any leveling.

I'm happy to place it libx86, but I think I need to understand better
why it needs to be there.

> Also, we absolutely want to unit test it.  (I could have sworn I already
> started some work there - maybe its hidden in one of my WIP branches).

I don't think we have unit tests for the xenguest library?

Thanks, Roger.

