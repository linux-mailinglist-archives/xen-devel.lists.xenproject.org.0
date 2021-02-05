Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D2E310C6F
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 15:04:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81739.151165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l81it-0006eF-H4; Fri, 05 Feb 2021 14:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81739.151165; Fri, 05 Feb 2021 14:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l81it-0006dq-Dx; Fri, 05 Feb 2021 14:04:35 +0000
Received: by outflank-mailman (input) for mailman id 81739;
 Fri, 05 Feb 2021 14:04:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cB+w=HH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l81is-0006dj-As
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 14:04:34 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4eb88141-41dd-4a7d-946c-6c00d9952943;
 Fri, 05 Feb 2021 14:04:31 +0000 (UTC)
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
X-Inumbo-ID: 4eb88141-41dd-4a7d-946c-6c00d9952943
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612533870;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=dqVcbFhSDdlx1o5H2aEP/C1x+XTwSM6TeB9MH0+EejI=;
  b=f21zlfGGd0uoQAmbLdOBF24+Th0hfqZbqLnEgw+PK7nOJUzwFWUlbWRq
   1afSeREhSxaJMZkZALnYwF0hTh636y4cnv1LiKo+CV8HrL5Qpt89oO3up
   e6YQMDAeyhX1PsrkARydzdmT7IZjdwjh5QPkQ4tOzHq1AG74Z0paVRotg
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KiT6cgX95AHYOCPGXK5UboeOPbRusiVRzkOh05PzGOkHr+L/EBlprXuOtYUXuAuMKkhJ2Ica+j
 dJX41CtdSLY8QxZMCzDApN+uYeLPmnxKRotAPCvGP7SxgLs6brRIOYIw21qBJAkKuFSNLj6Ar0
 XLm+QNmlHPBdEFmXRzpNBi9R2T6Mi6lUVJk61twOfr7TYb6fLLm8Xty/d1gE5gOsSFt0VRj023
 wWfCHIcHgnTj/hym2Kqz7QjCVv+DWCRLew+jjg239fFGdLoE6BudAMPIVu19mby0toBX2mAzgn
 UXY=
X-SBRS: 5.2
X-MesageID: 36845671
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,155,1610427600"; 
   d="scan'208";a="36845671"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BBWUDjG2WdUDJPea045EtRZBUniMdJwbc7s9aJyzY+dvhJgVUe6Ivm8PYlCEYAfGOamAigh0JJuVFb4zRn9yC2SbxOQOMgZ3y0jMx+fAg5ISv+fv1N54Z8TgVV9dbxM6dKjPu3h7T95PcnCvQ0OiHzb0UD+wenO/IJPeZnoUY7g/pTO7NiaM0Mo+fWDjyXmfn3VcuxqP+1dTchahjNGb6Vf17F3C7k2mzPJ40tNREhyL2Zdlbm6RFsO4RL0EjsKPuRK942gTsmyOmcfIiaHx3gk5Bb2QaWREZkhEjRwW/i+qEx5qQuZDuDl0xWhZ8kP7Q+PnkZ0XCABFZkNpJzuOKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brzd3fHckUGI+bOjKdCAJYyz8fn7/y7WDdrmge4fyEU=;
 b=KsMLW9mLuMseB/qfEupTykPGaqHS3Hd3FI69Uk7C3ICJgc/BixARkYsDi5q5FaeLtcMX2Uw5dSIdnAQx1ZGcZGgcpvSD+HAWOgTuByB50gfXTL6PsSN1gOQy/PQXzdyUdEl52RCgO1YYx1iGbX9IGJJTK4kEnpauB1n0w3bc3DRZzFuEzsfAjvtV4cqEiVGis8uVftsrWR4kSUDp04lAD1Jl4IotyD0+aZoq+ZmBrBNjZ4XYVsLOiDQQTYyWQVpJT0NaDzLCQsk0dqY5HrEJXpuAzeip0RqNCJuTjRgr5R8C4eqwK0plHFFJYkwk1a67P1YnjPbu52wDRKY0xi3FZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brzd3fHckUGI+bOjKdCAJYyz8fn7/y7WDdrmge4fyEU=;
 b=mzeHlfxbFgxy1HOHHuoWTLC8Q26/90822ld8SbgOwjFog9ww/hTbe/ydS8Snj5WblU2ylggQliOdEXmZhgRiC6S6BWI94M3UCDlmps/Oi+t3Jral81WYiLDfh+M1oFHyNMnr3kELav7lERK5aQr2rP4h0X5NwwoDl3eC5DBJqJw=
Date: Fri, 5 Feb 2021 15:04:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH for-4.15] tools/configure: add bison as mandatory
Message-ID: <YB1QZBejBVDwTthT@Air-de-Roger>
References: <20210205115327.4086-1-roger.pau@citrix.com>
 <bd9d86ef-485d-fc93-f402-0a97acd9d2dd@citrix.com>
 <YB1Kqez4mjzog2YM@Air-de-Roger>
 <c1185550-8e73-5985-de70-a68a0b1e31ab@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1185550-8e73-5985-de70-a68a0b1e31ab@citrix.com>
X-ClientProxiedBy: MR2P264CA0131.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 804a667c-4ba4-4906-e69e-08d8c9def254
X-MS-TrafficTypeDiagnostic: DS7PR03MB5590:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB559087848751B7D411D5479B8FB29@DS7PR03MB5590.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3pj0+MLJ2QDy0mX5B9MMSy2qGqB3BzV1QjXzRpoQbrNHrwoO05J4QF1dS33gwLSURxenvZqD1tseLjBC5HWj3UZ1C2kSBQhyhbjIZe5vrYU4GcRpitWLAkMFNdKls896qnIFAlNiHdDHe9okMz8off4HQr1EKSjUQIUq2Iyy03RGtS+Z7DNZJeENvcXx0ACD82BIhDfSgZmJ5OHexy3zkDfdZ7amdcaGH/0+Ru4nwSzw8PYr9z3eQaP9jXGgU4ddtfMutmUdqehDZragLN0qlUUe4xfXMHSVCJJfrY6bR7K+P32rTwQ1oigo21yFr5l9B2zKx/FHwIcUaOcrwe2ajm+NjjBJIkEC6XtmkHZEk+CyutSi8EG63ilZNeu/3M4dL+KSniuvm0WjQjzs8K80a/himOCmRBUpDiQr2wN7BiEvuVCIBVA/R5A2tMbZXZCLNXWiPhu218LIJS4DtD8r8ymjiUWeyJuRAYJruI7KNSN8X3N+pgNKZeJj32+peKw22g5Kb3uojwprtVjPP//c+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39850400004)(396003)(366004)(346002)(136003)(376002)(5660300002)(478600001)(4326008)(6862004)(66946007)(66476007)(66556008)(8936002)(6636002)(9686003)(53546011)(6486002)(956004)(6666004)(8676002)(33716001)(2906002)(85182001)(86362001)(54906003)(316002)(26005)(83380400001)(186003)(16526019)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MzE2azcwcGg3RzdObHVVNFNWRUVrWFNiaHRjUTZ4ZDRiSjcxSFlXeGk2M3k5?=
 =?utf-8?B?cERHVHoreTQ2ODFiWVZSQmFaOE9HdUZnczJuUU1rcjBaNE5tNVFMK3NGRHJJ?=
 =?utf-8?B?QmxiRmliSGlqS2pZa3E2c090eE5aTy9vdUdEUEhZRGxDSHM5cEU5MVgrUGFa?=
 =?utf-8?B?SFdBTUhUbS9neXlGVkIwbmlCZkgzOUR1K3NXaFp1YWk4NWZxMnVFYVJmWm9O?=
 =?utf-8?B?V0Z4WFF6ZE1Odmx6bnd5SWVoVXFXc3N2bmV5TkFuSFkwRjFzUUZXdDBnc203?=
 =?utf-8?B?UGpxOUxpU0RORDV2dVJIYXhtRDFjT0FoaVBWUE9XaXpwQklMNlVNWERESFZv?=
 =?utf-8?B?cnBUWGZMMDlsdk5nRUk0L0JZQmMzWnZ0V0dHVnkzYVUvOXJsTTFVQ0tFdFFj?=
 =?utf-8?B?czJIUk5TQnpxdVpzR1BpV2MweWg3eXUvM0w1TGZUQWQrR0kwS1gwaFliTnNN?=
 =?utf-8?B?SjBFVXNOQ1d2d1dYRURxdFdEQ3l0WS9Hek9ocUhXYXlTRXg1clVHODdKMmUz?=
 =?utf-8?B?d0tWZHNtOXIyS043WG9GTERRYy9yOTB2UU9mRHZOUGdtd3lmLzNoZkNKbEpL?=
 =?utf-8?B?ek0wN0Fud1lpYmxMdUp5OVh0bDRkZXhxM1RtOFRoTjNNMU85SUlkZUlIeTVp?=
 =?utf-8?B?dFNVS0JTRHIyd0ZQUElPRkVqbi8veWhsWENmdVIxV1NDRnZSUGUybFYrNmpK?=
 =?utf-8?B?Z2lsa0NjRnpYY3ZhZFA5ZU15aXNQeVFLSnkveEFLZ25LS0F5akxlelFpLyt4?=
 =?utf-8?B?V0pyNGw5OVk0cHR6dlVyRmZxT0hqeWVLek5neEV0c0QxSkVwOVdleHlwSWZQ?=
 =?utf-8?B?RlZlWWcyaGxDLzNvWHR3RHd4azcrZjBnZW5BL1JML2d2VTRzeXVDL1N2TFBH?=
 =?utf-8?B?c2V5ek1MM1VvZHVrNEEyUnRsYk9ZZGdWNXJpOEpoL1V5MTV5VU5xYUU5Mkw3?=
 =?utf-8?B?bC9GRjBzeHhYbUpWcjlaTzVKczcrSHBiWEIrMHZuUFJmeGZpeXJzZlhrZ1h5?=
 =?utf-8?B?UVNyRWRIWUZKSEh2ZmVibVloWUNrWFFDOHRETVlPc3RGaEFFY2E5VjBCQkI0?=
 =?utf-8?B?cUcrZ05pbE1qUFpjc080NXEwdjBzT0VoODNFdm9lT0tZeElmdGZNVklmelRh?=
 =?utf-8?B?ZTJ4U2xEOHVreTF3Q1hWZWR5a1BZWGxqSDdUMGNZTWU5N2xKM1A1REU3aktT?=
 =?utf-8?B?NllKRGdwdTd4Z2NXWjM5Y05MQk9paEIvQWNlV1VGT3ViZ0VOSUtjT25XMk5L?=
 =?utf-8?B?dGFObGI0VXQ5ZFN2MDBncWROTFUvSVJvMkE2dGNTR2Y1VTdUcDJhMTJmU3E1?=
 =?utf-8?B?ZUUvajRDaGhwa1A5S2JyQ0xVOWlXQXdRMWw4MHBWODNyZU0yUUMxS0JTRzEw?=
 =?utf-8?B?dDJNaHh6OU1UWGZKM2JFTDNZc1FPTXcwdTdkc3IrU2M4M0JsbTdOWnIrRXFl?=
 =?utf-8?B?U1RmWmFyQ1RuTW9PS0YwSVE4ZFJOMmxlVVV3YkE5aW9JdEw3QU5ZVVlPTUpr?=
 =?utf-8?B?SVRxSXJBVEo3Y09kZ2lHQ3pDVUtpQVBENjlpNGpkcE0zUGRpRVBiWi9Hb1cr?=
 =?utf-8?B?T3lySFJYVmEyMXdJd2tCWVc1V0I1NVdjaE1xOGlsczQvOXMwNTZ2SFpvSzVC?=
 =?utf-8?B?K2haMDdyMFZHRDFWek5oakZOM28vV3ZvUkFkb3dMOUhnT3ZyM3NhR2xvMFE1?=
 =?utf-8?B?UTF2ZDZuQ3BkeDZ0eHkxV3ZPTCs2UktwakFKOHNVOXhReW85UU9pN1hKdWU3?=
 =?utf-8?Q?s+6H+/TnDbIfHKjo3I4m3NuTlYmU+42QoqAIPOF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 804a667c-4ba4-4906-e69e-08d8c9def254
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 14:04:26.0907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GtzpqEKbPUv1+JTGjXo8Gw/3hhM1Aiv5iHyn/qObjFiO7IQboKN0Qw5NXtfSH0qWXKqCSwKfVSUg3phr/t4nrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5590
X-OriginatorOrg: citrix.com

On Fri, Feb 05, 2021 at 01:50:27PM +0000, Andrew Cooper wrote:
> On 05/02/2021 13:39, Roger Pau Monné wrote:
> > On Fri, Feb 05, 2021 at 01:34:20PM +0000, Andrew Cooper wrote:
> >> On 05/02/2021 11:53, Roger Pau Monne wrote:
> >>> Bison is now mandatory when the pvshim build is enabled in order to
> >>> generate the Kconfig.
> >>>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>> ---
> >>> Please re-run autogen.sh after applying.
> >>>
> >>> Fallout from this patch can lead to broken configure script being
> >>> generated or bison not detected correctly, but those will be cached
> >>> quite quickly by the automated testing.
> >> I think this can be simpler.  Both flex and bison are mandatory libxlutil.
> > No, we ship the output .c and .h files so that the user only needs to
> > have bison/flex if it wants to modify the .l or .y files AFAICT?
> 
> I know that theory, but it is broken in practice because of `git
> checkout` timestamps.
> 
> Also, the Makefile explicitly enforces the checks, so they are mandatory
> in despite an attempt to ship the preprocessed form.

I seem to be able to `make -C tools/libs/util/` just fine without
having bison installed. If we do require bison/flex then we certainly
need to remove the output *.c/*.h files from tools/libs/util/.

I'm not specially thrilled either way, but I think the proposed patch
is safer given the point of the release we are at.

Thanks, Roger.

