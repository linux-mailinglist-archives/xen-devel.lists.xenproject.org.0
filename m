Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1031830F06C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 11:22:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81216.149648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7bm8-0004dw-P2; Thu, 04 Feb 2021 10:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81216.149648; Thu, 04 Feb 2021 10:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7bm8-0004da-Lx; Thu, 04 Feb 2021 10:22:12 +0000
Received: by outflank-mailman (input) for mailman id 81216;
 Thu, 04 Feb 2021 10:22:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YP8j=HG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l7bm7-0004dV-WA
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 10:22:12 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3eafe4fc-beab-4058-8301-97fddea7ed52;
 Thu, 04 Feb 2021 10:22:09 +0000 (UTC)
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
X-Inumbo-ID: 3eafe4fc-beab-4058-8301-97fddea7ed52
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612434128;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=CoxzTOPSwW5tiPaFhlZouS/8+gSivV1kqyVEnhlZ7Yo=;
  b=CG67oiE78/W66Zr4v4dHnSdXAvxCGb2bkpvLrCxUNaWwc/7UH4mH0Sld
   qN4Wftc4nAPLzg29bmG2m/uw1KkIE2/RAiYCJvW6W20yTPOTW5Za9JYKz
   qyX8c+93oEvUy4wKk2TlkACG0ZXXWdyeo5cxWyM85bqe+9mF705GFIvkz
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UNaKVtKZ5/jdDvBi5K+FwM1yEc8zZ0NzOVm486rId56lYGSg7EafAB63t8fKEigDN+zcuO+jVu
 pgK5qi3A/jMFSyS6PABbaJjThfp1xTuu27QYftokstGbsTzrSJrQuviZ0Wdjw5pVR2v/xWZk06
 puXy8tnTY5hX3OndLSLqeKO8vz1NDpg4fDxkegyRkkp+aHGB/j2zEYdZC9pPX8u4fcRSQWjlEw
 dYL3zS9I5QO38Sjra17LgGXwihFD0uSPQ6LKFSdUCZOA0K69gHHW1Nzct8WIdEqGh16rxx6kbj
 6iU=
X-SBRS: 5.2
X-MesageID: 36572300
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,400,1602561600"; 
   d="scan'208";a="36572300"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Muj8S/1Saj6fSzV+H13s6+yNp4UhpOdkcwlwmbKfXd1gx1z/OGUwhPPS642T88nCZi6qWE93vo3Q2erbbu/G7JqSiZ4DiOG6V6QoQkUpXy5+DgdFVWF3MruwhxYO5rJ/6ElVax9W45UQS2EaFjOubKdoOchWGNag0hYgRy1BeEwfhJfrQN1aF3OYa4oiGmFQF5T+3rCz6/wTDWLqyd+JPN98NxCMBPJhnn8MkI2W+TjJx+x8uUiFPYPYZ1PKJYpRmIqIEXMPj109d6wuOcwCnbK0am5Qau5kFSdutSNlrpkn8I8fuAP+7b6xfyqEP1AuJU+psv3QqpZlWQhe+joK8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFSUr6ePCOde4sXwl/2PbMxM4K0uNjg4kBcKWGbFAQ4=;
 b=T+RrZuCTiFYWY4IHkuoPH6ZIm8Z0YlcM7AdIKDlAEid3MEEPKa8wyD+g4vC173Zk9BdXBabKSGgbR8+xz2tGmxe9X6mtvfH3PokUsrkg7Fj0WdnVeDH6jQkCTtONRG6nREwHR1lWfvh8UeHNJVYFIK3Wxy6COdtW4In2iYWoTq4rLVPOrOgUBokKwQqaQ/o0hnqXCZUm++BezgM0zqhjy34srUXdl40VqWbsoscxOfHsbJH6emtb3XM/PDACReSeaiFuGaVER/InfI0W+RopNJtDgpIOiBjZYGO1EOCygiCSFE7tsnEC/SVlqYCToj5G91PK3vZc8Qe7Be5sB4H+sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFSUr6ePCOde4sXwl/2PbMxM4K0uNjg4kBcKWGbFAQ4=;
 b=jbzB6HKioSmX97Qly/FaCCEWGM6hJ3qNs5j2P3p+3KsCzVXoJTDpo+/aaHjv4s/ztvOdDZmHYpuVMVd+z3ZTjfs2kJE8TqPiXyCMSeBUQKVmmd0wWGKjOpAnrw8aXV4emALNZMxD9crI39i8cOyFDH1XPlGuKlAPmpvZaKImLfA=
Date: Thu, 4 Feb 2021 11:21:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.15] autoconf: check endian.h include path
Message-ID: <YBvKwNiIopKKZx/F@Air-de-Roger>
References: <20210204093833.91190-1-roger.pau@citrix.com>
 <26522f21-4714-c29d-5ca4-baf012c51ac8@suse.com>
 <YBvFbbnje+Dt7CfD@Air-de-Roger>
 <0e3576d3-4565-9898-e954-4a888b21d92f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e3576d3-4565-9898-e954-4a888b21d92f@suse.com>
X-ClientProxiedBy: MR2P264CA0031.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::19)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d6ca994-d31a-4bf4-3a8a-08d8c8f6b3c3
X-MS-TrafficTypeDiagnostic: DM5PR03MB3370:
X-Microsoft-Antispam-PRVS: <DM5PR03MB3370DC8CC19E8CA5F6DE81B08FB39@DM5PR03MB3370.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PBStrNr/H3iVJ5jB3FrnfPOVOTN5BlyNNae4ohukotGxigD0UZB2m5l6Gl2IXdAJ3KW3n3GUBwALn62aQWGX0UNudJR64gqjto1wyVKqWmd1ThAcZtJKmCOa/cUVRat8S+cKmu2QlvBucDZnLUxzvWFzPEYlwq+wNsjjYYaSeyyLxgFuZM+sLyfcNLeGZ5wcKE21b4JR+B/qRFUo9kKlh+jIqphwZwtS86X3MlMWij6xByic+Pto+HLTA9/16Zu9sYft2IHfx7F3UM2hi4YfU3xqu4jNPZ0+NDP4koXMdhUjDPZuYvx0LcFASNl5ZmtAdC95OhloOG08mf7FqLFJ24HMXiRvdpXxVTIM/WCZEBiEs/Om86PD2SieCIk6R9rAfKMskwjoPJSGVkcaFO/OFxhiHqapYgpdM21ri2VvLqxbPI+wZlV1SeTXJL/qSL4L2coLAtlgyeYNrW4eIynOvgp51dOsMB1S6V9tSDehY7mSurFegrn54WQp/Ke16x64315ozQar1to7bm8np116yQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(86362001)(16526019)(6916009)(9686003)(26005)(66556008)(2906002)(6486002)(83380400001)(8676002)(6666004)(8936002)(6496006)(956004)(4326008)(5660300002)(316002)(85182001)(53546011)(33716001)(186003)(66476007)(66946007)(478600001)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bWRIcDZKa0l4ODJGR2liTXBCTXlOMmF5MHVTZ0QrMTlzSUFDTFZ5SU50Ylhl?=
 =?utf-8?B?dkZkQ2diVk9MakFHRm9ReDZpSHNlWVFIMi9EYkdxT1VqanlJa1JBMVQvbG5t?=
 =?utf-8?B?YmNRT2tqLzFWKzNlcWtJdkhQYlZBcEZOUTlvbm55MEs3NmRyRVlzVXBhNlU1?=
 =?utf-8?B?UHNXeEplZDNzbldqNExtSlgrUHdyVDJPYW5zQS9HaHJCYkpMZ2RNZFcvS1VZ?=
 =?utf-8?B?N0ZET1lpWXZ2d29oampheGhKLzZvcFU0bHZ4VXJwcXJhMHBYRHlyOTZzZDha?=
 =?utf-8?B?RzdkcGY4WFIwTCt4TEhVYk9QdGR0MUlIU2NSOExpNkRXeVdNU1RhNGl2Qlpp?=
 =?utf-8?B?SzhmMCtseXNud1hCOVMyVU8wekU5Rlc4NWliZlY1UmtPQTllVzVuL0xQTC9R?=
 =?utf-8?B?RmdKUzhPL2tzd3dLSE1aUlVaK2wrUzVWZzl4blJGVlZpOUVkU0VJRW96TFRX?=
 =?utf-8?B?Zm9lRFNYeVptSjJtckJSZm9kdWVhcURiQm1qditpaHNWV0RHNXBhQVR5c1JY?=
 =?utf-8?B?UDlRWWhiMWxmRmZzSzE3YTdhekdkNE5KWVlpenJ3WmhyelhJVE9oeTBBYXd3?=
 =?utf-8?B?ZG9ob1AwOFFOTkt2RmxuYU9xWWl4WEp4U2czaGFmYUFKd1ZURjZ6aHpBRlZV?=
 =?utf-8?B?WkNrR05taElIa2NmZy9KR1QySHgwb2RGR0dzRVRiakpNUjF1bm9QM1F5WWh6?=
 =?utf-8?B?R1ZELzdPRUFvM0ozNmJaanpMTjZvNm4wbmtNa2RkSWZpYnBRWkVQY21IQjlk?=
 =?utf-8?B?eFlzWWx0Y3FxeTl6cjZuNTdLK3ora2thNzV5NnFTbzZFbnQ2bW81akxZaDQv?=
 =?utf-8?B?RktibTRwNDJVd2lqem1qdDVnd2p2czhlT0c2cFRxVzJZMWtoVkF2T0UzR2tu?=
 =?utf-8?B?RzZrVlBTYWltS3BaMFZISzlKdmxLaGlwd0ZFNVNzbGI2bDNDSzNtV0JCZGJP?=
 =?utf-8?B?Y25TRUxSb29QZlp0aGo3YnNRM2xuMENINWYyWHlTVG9YR2tpdVl6NWlseTg1?=
 =?utf-8?B?cU8wRnMvbmJ5MnpmSWd3ZWxrK2hDdUlTQURRVDNHai9sdlFaU3MvVFpmZTQv?=
 =?utf-8?B?bERpcVh5WGVTblUzL1FtZmpMektjdUVDYUpjYkZ6bG5YVFUzSVBtdTlZbHN0?=
 =?utf-8?B?VG5Qc2w4Sm9yM0p4bzRTbzJPRmxZZC93QTdWT244QlEveUowWDUxS3pYVWRC?=
 =?utf-8?B?ZkRrSzNFMVNiZHJDNG4xOHkzOGt6SURZeTJFeU5kNFJhQ0xRSVB5ajdpSGt6?=
 =?utf-8?B?M0pHYkhKSTNabDJBSTlNbW14M3hMbHVLRm43SVlhMWlXOFdTS3BaUWZjMm9L?=
 =?utf-8?B?NGp4YVJKSjhVUVdCek14QkNQMXJ1NEEzTnUzZG9nVjQzQWsyUXVsc3g2Y1FP?=
 =?utf-8?B?TTJ5bXBseDVpVmVOVDZ4bEVpNVk1VytGU2RnVVRaMmk2NFB0L25OMkFvNmNu?=
 =?utf-8?B?Q2E2NmJudXpvdzkxSHVtWXQ1SWNVNGluYWJrQmI2UzdWYW1aQ1RZOEFMNWVL?=
 =?utf-8?B?YVhaaDZ0aXkrejJCODdPYkFkdUV3YTgzOVhndXZkQ0hhd3A2WWdvVGs1RkRB?=
 =?utf-8?B?ZnFoQkc3aGdBQ3BPa21YOGJlczFuTmZ4SHkyMjJnWjdZaThYNDViMitnRmVy?=
 =?utf-8?B?blVJWWx2c241ankrNHN1cW1FeE1XQ2dBdyt3bTlCR3NiQjlOdTgvUVErVzFx?=
 =?utf-8?B?ekQ5SnpabXRMQU02Q3JUZHkzYll0em0vbEZQb3B2Y3k3c2t1UmIzSEZxK1Rh?=
 =?utf-8?Q?nMrUiLbtv7NIUlvujoVjlviog+AIdEwVMGjFtZw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d6ca994-d31a-4bf4-3a8a-08d8c8f6b3c3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 10:21:57.8531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oReqK/cCETU06j9JqQQN9mLEWqQQ1UyqC2rwtVxFuxAy/APpuZZT/BhTCtxnXPtsfzWEmPWEz45qCBicYvaXzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3370
X-OriginatorOrg: citrix.com

On Thu, Feb 04, 2021 at 11:13:43AM +0100, Jan Beulich wrote:
> On 04.02.2021 10:59, Roger Pau Monné wrote:
> > On Thu, Feb 04, 2021 at 10:46:58AM +0100, Jan Beulich wrote:
> >> On 04.02.2021 10:38, Roger Pau Monne wrote:
> >>> --- a/tools/configure.ac
> >>> +++ b/tools/configure.ac
> >>> @@ -74,6 +74,7 @@ m4_include([../m4/ax_compare_version.m4])
> >>>  m4_include([../m4/paths.m4])
> >>>  m4_include([../m4/systemd.m4])
> >>>  m4_include([../m4/golang.m4])
> >>> +m4_include([../m4/header.m4])
> >>>  
> >>>  AX_XEN_EXPAND_CONFIG()
> >>>  
> >>> @@ -517,4 +518,6 @@ AC_ARG_ENABLE([pvshim],
> >>>  ])
> >>>  AC_SUBST(pvshim)
> >>>  
> >>> +AX_FIND_HEADER([INCLUDE_ENDIAN_H], [endian.h sys/endian.h])
> >>
> >> Instead of a new macro, can't you use AC_CHECK_HEADERS()?
> > 
> > AC_CHECK_HEADERS doesn't do what we want here: it will instead produce
> > a HAVE_header-file define for each header on the list that's present,
> > and the action-if-found doesn't get passed the path of the found
> > header according to the documentation.
> > 
> > Here I want the variable to be set to the include path of the first
> > header on the list that's present on the system.
> 
> I was thinking of
> 
> #if defined(HAVE_SYS_ENDIAN_H)
> # include <sys/endian.h>
> #elif defined(HAVE_ENDIAN_H)
> # include <endian.h>
> #else
> # error ...
> #endif

I think having to replicate this logic in all places that include
endian.h is cumbersome.

> >> I'm also not certain about the order of checks - what if both
> >> exist?
> > 
> > With my macro the first one will be picked.
> 
> And which one is to be the first one? IOW how likely is it that
> on a system having both the first one is what we're after vs
> the second one?

Not sure, but the same will happen with your proposal above: in your
chunk sys/endian.h will be picked over endian.h. If we think that's
the right precedence I can adjust AX_FIND_HEADER to be:

AX_FIND_HEADER([INCLUDE_ENDIAN_H], [sys/endian.h endian.h])

Which will achieve the same as your proposed snipped.

I can also add a comment to the macro that the first match will be the
one that gets set.

Thanks, Roger.

