Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C8B336DC0
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 09:26:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96386.182274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKGdo-0007WP-Cv; Thu, 11 Mar 2021 08:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96386.182274; Thu, 11 Mar 2021 08:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKGdo-0007W0-9Y; Thu, 11 Mar 2021 08:25:56 +0000
Received: by outflank-mailman (input) for mailman id 96386;
 Thu, 11 Mar 2021 08:25:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0MTW=IJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lKGdm-0007Vv-P0
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 08:25:55 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1fed2bae-3eef-4448-9a34-cb80ee7798e1;
 Thu, 11 Mar 2021 08:25:53 +0000 (UTC)
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
X-Inumbo-ID: 1fed2bae-3eef-4448-9a34-cb80ee7798e1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615451153;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=oU9S64iZYC/kTQLdbtiTWi/IDh+IwGQmrynRnzWfmYA=;
  b=ec3UHoXZjUn4JsV4VozmgsbWgOhk+lSB58g36UiZ5BDUY3KVjdXoaPRV
   16kBIyIfPFUZWMIM0MZNZTamy8XwEDeScvagXh2YrTbT/F4fQv9+3HpeV
   IBCYKGw4C1VwbwNxlIzS5IDXB0wT1U2gmAkV8P6m7bNbP3bbQsXDK3PNM
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 2/NQUwVIH08lJam0sPzA2ScEoQ1XPnNic13esNaKOjjehaJVZer4p3IYocuwBT7fePcRTPDotd
 Q0YY8dvrjwU1HCEbYq8tlsCghNumaWci6BAmq1nL9cXcSlh3Zhyg5BTPRHHIVoc4EhzRxfgQoV
 9zYlCCO/5jkE7D/YZ35IksULvKGOMBiyBqKnx4zHp7AAqMy+9xPrhUz8KI3xbwUeWeKrt67WtO
 txeDYFz2kubTNoBW+NnwFLDB07SJtKvY8szCbdF2AgVTIDye5Av76wjnNEmnrqzo5RnvfBQTPz
 jNc=
X-SBRS: 5.2
X-MesageID: 38942778
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23: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
 dsyApnNF0I9zs=
X-IronPort-AV: E=Sophos;i="5.81,239,1610427600"; 
   d="scan'208";a="38942778"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7k8TWyYgbPw99vmltu1HCo3SWUoAJUf3ZY1vOrzwjPJKId/z+16DH5cCH6xPcIIQhlAC61glI3+y7XlZofhjRtPKJs5vBxtkN8tzKWxvSnQqv+er81MPJrd0a1Bo8ZpxNZvRsZtBzAYXK4jDoNSnVgZMApFNDxJN2KbMhZtDXL5sLfdpswBdQB6w7feU1P922kqVMnysENemTmtjvSpsJeaHoZJTiUR/IC4nSrggVCbDBBwtXsLYnG/e4cisVqSIG1kMiB3ZIHY4XDoeqvVAR3WHjUqIkl98yg/bt+CnRNJ0xHVhqD8BqPhkszvtRoaVLEeTQOHDb5Sk2gadLSCXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwQq36Hi81n35Mtk5ZfO1VYif3bs0JJ3T/p+IlBD4Ws=;
 b=iyOmuOo0usWBTk7JUkURyF5bcxNdZfeoyFxtCKu62LIBvBOzoSGw00GtrG0RGZIzusf3vzO8K0za4AwT09s/RKPzTNblB2f0OxNLLYcejQ/MXMCFPtR2hivM1HxQqVZsPQscLSwkzqcfcTy/akIxGKxJ4TLwnPV/jQbEEY43+mwJe5xnLhXyVbuoL5jJeqyTNveJ8gr0kIyNk87iEabBRjSpQAHKgQ7/ESDsSAwofWTkQoavMUzQRd8l9zCpEcth3nlW3buKg5qmL+AAeGf0hjsd10f8a7NqugyHl7ABR+GG1kPKzzLpDWbftB3cwaln9s0f7IqIDiIgOSz4J89bFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwQq36Hi81n35Mtk5ZfO1VYif3bs0JJ3T/p+IlBD4Ws=;
 b=gcdaZ+pWC7La7aJ4WPC9cbi/TuHDX1c5GOz3xINwTtu8/RqMoouQDyAE7n5J4TQ+0Nf5vEfeqJ1JGh8XQex1bRcQDOhT6PPLwfD8QNYGicGyY81poLgGbmcQhRkhne61baE4WhbUgqbDkBdOPWQLfOhJ/hWsoIujHT8t5bS//3k=
Date: Thu, 11 Mar 2021 09:25:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH][4.15] gnttab: work around "may be used uninitialized"
 warning
Message-ID: <YEnT+vMOkfz/5Wwx@Air-de-Roger>
References: <a6b73c54-3010-6716-cac3-8f3b462a4dc7@suse.com>
 <ec2b85b6-072d-481d-3b02-c8dedf043dac@xen.org>
 <6bd14438-7dec-2176-eab5-5898f190c4d8@suse.com>
 <e45ef012-22c6-b480-d987-dd951ae36948@xen.org>
 <952ca444-2091-b7f1-3559-c728a63af37f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <952ca444-2091-b7f1-3559-c728a63af37f@suse.com>
X-ClientProxiedBy: AM6P195CA0070.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::47) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b3b4927-f426-4873-f5bc-08d8e4673f89
X-MS-TrafficTypeDiagnostic: DM6PR03MB5356:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5356C527013C2AB661A247138F909@DM6PR03MB5356.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yMT87jBidMOhHtwiqSJmaV8MJd9Va3xnPhc/LRUtlYeb/msA3PAdD1YKi1TpD6KVpurCQS2IRQOkLX7rnLFcxkX+sotCv9l++q9THsi/m3zMQ22pgU5wIJpV0MecXt9YImg6cUBCf1dSc26tpvj79woR2DMk/Uvr83SgHwhKELJRklYZemz8RC/BH3M15kG2SUfbieAuCtwMBOMDhruivY2DLGg6sI6owDiJ0wsstBPlybJBfHNFcTuh2Bdof2G3R+cp4sqea39AScWpTqLgFjWk8amZgoAvqlL1ZDMOM+LprQEd//XmV9XNvI0n/Ld44J0ku60wW4KOpQQkC/pvKdALtf/WIQUXmARETdtttC3dVHKhXAhD7yb6K1a8nHU6SZnSmCgY9A30lUy67yKh5pJk84tgelYFgpbw2DUuhl/0gtPKN70m7Q0MjtdwqRQpeh53XUR1T8YG+wIqH2WPMP7uf8VVW15jgBarZo+Ag2GY/Upyb1WIs+TksiN2AE1GWaL/7RbhuH0lz0DU4ggUOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(136003)(346002)(376002)(396003)(366004)(6916009)(9686003)(33716001)(16526019)(66556008)(66476007)(66946007)(83380400001)(6486002)(2906002)(6496006)(85182001)(478600001)(8676002)(8936002)(316002)(956004)(86362001)(54906003)(53546011)(186003)(5660300002)(6666004)(26005)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dVl6cXI3c3A3TlJkM3ZQQ3JSODFCRHU4QjA5NU1GRC9ZczVRcU5QWjZCQUQ1?=
 =?utf-8?B?VlQ0anNmN29wRmtTUHpFczMxL1d5eE1rL1F4RHo5cndHb0Q3WFJQdDB1VzdU?=
 =?utf-8?B?dy9mMU0vdnRpR3pwMTZMb2ZMRW51dFJGNlFkMzB5aVRTT01vaFlGa1JPdW5Z?=
 =?utf-8?B?ZnZ4QmlmUXBqVndOSXF2QlJBL2w2SnNmTkFwdk9SaW56Ymk1M3EwWEFGaWNF?=
 =?utf-8?B?c0hyaWRGcmtIV1FEaFdWQTFOMWpBNEtrTG1DYTVVaWdMcDlicVVCUjU0V1pU?=
 =?utf-8?B?ZXdkeXdNekZaQW5oRWNrVDVPMGJMa084ZGEvSHowK2NTcGEwZUhGSG8rWjhE?=
 =?utf-8?B?akJZSVNYc2wzRC9QWHFSTkQ0L0thbGlXOXE2TDFETU5IektUNURDbWhFdFlZ?=
 =?utf-8?B?dDR4NFhwSSs0emNEZkRmNnpJRlhyRHVMN1VodmZWSGoydW5ZYmVQdmEyRTlH?=
 =?utf-8?B?UzNHTkM3ZTNCVEY2MnNWSFNEbGVsTVdMSmYzeU14Tm5RdXhMc3QwcmxjSUJ5?=
 =?utf-8?B?UkNoQW1VaDJQd1VYbm5MY1ZSeFdTM2xhVWtLTEZGcmtHWWwzMm9xZWNxNC9w?=
 =?utf-8?B?NVpGYkNlb0Rka0xudTZjMkU4K0c0M09qK0dZNHEzU0RTdFM3TWpRSHZrVjVq?=
 =?utf-8?B?MER1WVpvSXJSWW0vc2RSWUJxYzJYQWZaZVdwMEhMbDlnYVE2eEZGanh3K1Ny?=
 =?utf-8?B?WW9VdllBWG00VW0rRHVvblUzWUZleFNCTWhTYVVvbTVQVHVYMEFjaktNd21V?=
 =?utf-8?B?bGl1a3BlamN2U3lvbHVQSlpDUW0vcHRWbWsrcWk0ZFYyR1ppajFsYitIVElk?=
 =?utf-8?B?eEYrSm9OdWNWcGRnRlpuK3VVL25tZDJWb0NoNTBNeTc4MStlTUM4TlNBUHZD?=
 =?utf-8?B?aVE2OG4yZm5pbHpPdHJQMU16czBzSFdVVVR0UFF3YzVPcWVpSCtXOUovVEZ5?=
 =?utf-8?B?NTVSckhrWjhUQ1c0S0xmRVk4S3RMck5KRHBYU2hkM1NwVFNCV2I3TmtKa0Rx?=
 =?utf-8?B?bVdiRlE0YWNjNVNTS1A5WjR2dnVXRWJoR283SXdwajc1TFlGWmVHNTdzU3BM?=
 =?utf-8?B?Z3RKKzNCN3ovcHJsMkNUV3FRZ2hvRDNCbktVK3Q5UTZDMjl6aVorWm1FTzNL?=
 =?utf-8?B?aU5WRHJyS1FCN1lhbk5pZWlEcy9OSkFUcHg4YlAyQW53ak10WVJEbWgxWkV4?=
 =?utf-8?B?YnlaeVRNdzdIb2R6NHM4THdJaHU4Q1F5NWE4WUVjb0ZxZzdhN1FSdkRGUElJ?=
 =?utf-8?B?NTdmNjFaV1JuYlFVZVl2ZllFSXlLQTFReC81ZVVlbjcrN1NXVUtNNmFsUWZn?=
 =?utf-8?B?bWdXbkIzMmZub3lBckNaQXVuMzRPVUZaSUVxYjNjS29jQjluanB6Q3lkV2dO?=
 =?utf-8?B?aWVrQm9QN2xDNUhMSW16eEFwTVlINHMvbmp3eFFaTTk4alFRM1dVcXRQZTc2?=
 =?utf-8?B?Qm1DRis3ZlRQMzhPenF4Q1ZGK2JSMG54L2hzcEViYXVxQ0llNDk0Qk9iay92?=
 =?utf-8?B?OGNVRkNDMERVTjhJSmtaM2pJQVZWeDVqODlKVmxHVEhteWNWNzI3U25kMWRh?=
 =?utf-8?B?T1MzS0JLM0NmOGVHRG5oRUd5S3lRSnRTZm1aUlcxSFNFeEFqWTFqWlhnZGJL?=
 =?utf-8?B?Z0ljUjdVQkl6ZE9mUThUcG9aNjd5aWhZMEZhU2RYUWhBYk93L2dCRW9tR0Vu?=
 =?utf-8?B?cmV6SWZVT0dyNkwzMHRwdFNianBWMHIveENmR3ovYVY3VDllcnVZR2NuN1Vy?=
 =?utf-8?Q?gSpPeshSbcA+LMYwT4L4oZIdjmDLzr4q1Gyw+YR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b3b4927-f426-4873-f5bc-08d8e4673f89
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 08:25:37.3637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C7u7jA1/iCG+Vq82GTlSqH07hhzM+3vvBY2VmwlMTa0jegvSbXVIH3m+qli4a+h+3mabH/X/C30kyEAMlAFQOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5356
X-OriginatorOrg: citrix.com

On Thu, Mar 11, 2021 at 09:09:22AM +0100, Jan Beulich wrote:
> On 10.03.2021 18:52, Julien Grall wrote:
> > On 10/03/2021 16:21, Jan Beulich wrote:
> >> On 10.03.2021 15:58, Julien Grall wrote:
> >>> On 10/03/2021 10:13, Jan Beulich wrote:
> >>>     2) A compiler will not be able to help us if we are adding code
> >>> without initialized vaddrs.
> >>>
> >>> It also feels wrong to me to try to write Xen in a way that will make a
> >>> 10 years compiler happy...
> >>
> >> As said above - we've worked around limitations quite a few times
> >> in the past. This is just one more instance.
> > 
> > I find amusing you wrote that when you complained multiple time when 
> > someone was re-using existing bad pattern. :)
> 
> Well, thing is - I don't view this as a bad pattern. The only question
> really is whether NULL is a good initializer here. As per above a non-
> canonical pointer may be better, but then we have quite a few places
> elsewhere to fix.

Sorry for jumping in the middle but I think that would be a very
dangerous move for Xen to do. We have been using implicit conversions
of pointers to booleans all over the place, assuming that NULL ==
false, hence NULL no longer mapping to false would break a lot of our
code.  ie:

if ( foo )
	free(foo);

Would no longer work as expected.

Thanks, Roger.

