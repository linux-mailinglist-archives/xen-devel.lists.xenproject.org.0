Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B85583A67D0
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 15:28:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141476.261316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsmcb-0006DP-J5; Mon, 14 Jun 2021 13:27:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141476.261316; Mon, 14 Jun 2021 13:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsmcb-0006BH-Fn; Mon, 14 Jun 2021 13:27:21 +0000
Received: by outflank-mailman (input) for mailman id 141476;
 Mon, 14 Jun 2021 13:27:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uT58=LI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lsmcZ-0006BA-M1
 for xen-devel@lists.xen.org; Mon, 14 Jun 2021 13:27:20 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00a04c8e-89f7-402c-8a26-14ef5179b3ad;
 Mon, 14 Jun 2021 13:27:18 +0000 (UTC)
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
X-Inumbo-ID: 00a04c8e-89f7-402c-8a26-14ef5179b3ad
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623677238;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=yKCEAH5lOjEYnguxQtxus7zIqrbkWXfvSyPchxPZ7JI=;
  b=V5AiLBNsfDQ5U5Va7/GQdD0uj1tO0wSibFsGHsJWavur1a1SAJ7ErDtl
   scWmQjdpYG1ow71G5+iAbTljD/NEOZfSJI2zSnlibItMddmAHbg3XlHON
   mH4SFpAG+eUaKvhTaZ9LX3HgaIgF2a7gCitvASM1WHFrKGyASXB1D7GJO
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: pHH1VnMaN4nuqADj2zW8eH7Tlv1xIdoiO8NQM3E0OeVZ3wpxEffxgj9UNV0NMRGwKzRiVjHMqz
 MzKh3VNPU2DAZ6intfbV7cCUOoDgzSVT368taFEjI1ClNULpwmecLWCYxbPjUOnLqaZvd7Bm/d
 Xr3rwd1L8xsBXYQgksYPH/vo2qPhnRH+f7bSZKvgzq3+J/qkq1mHvDwX9vaLGIMJ9mojOZuBhP
 V8OWIJ58IznK3bCs4jQcq83AeYIuQvM9xX6nUiER71my5zDr7mU5y7+20IVQJ8yY1RBn+jAMld
 VgM=
X-SBRS: 5.1
X-MesageID: 46068031
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:UXorJK66K4fHRzelkgPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-IronPort-AV: E=Sophos;i="5.83,273,1616472000"; 
   d="scan'208";a="46068031"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1HiC75DkKAuySJpHDX8rPPRTJB745X4Z8vhqtuSYQMp0a7MT1z1xMNVRdp9cuAlyPyK4AYg48B3yOYGC5aiR+/cKa3vcjFQbKFskGIMAcyc8GOue445LE+jcsKmxmHUqXJ7Hm1GgwXcqt/lYUvnm3eHFLtEQFk49m1pc9RpNGTWoeti24bySg5Eykq0GRXbTPTBueY9/14mCd5GZH5otPUMry0FpE3YSGHLILp15Q6hufoj8vqlzTSW+RgNpZ0fsMkfcCUKbWupPJ6z3GqGDtbW+ie/8uOzfmJ55t/trlD76K9GNyXGgDGlhLQinSXQg9mI4REgS/V1lac/Oe6r8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eke6UwnoHxePLsUmocmHA2wYq0orFxM+FVW3L87kxls=;
 b=gyWENriLCi5CpMiaIaZLeSGvgDdlPyoqo5yEQbaUVRGmgwadPGo/Dt4IxfAdX9M62g0m7JE5CEoDUG/lrs58sbUPvGj+0G8IR0I2DYvgToo6qIXdzOjjbBJL6oaIek6WFHWGB5IwuLUV2+aQZvQkoiK+JncdMcc9pgZtA+B6QsaN46sAA69BWYewscbJxGw6u56A6VEFZigb1CTP+oImOQOHvf5V0eEamgllpvkcCxVJAvIDJmMG7Zx5PjKTPQj2/uTGjCyr7wC3nPJ8loFIt75AwxBfZpD2Nmih9tBQggLldMJe3rUjJ5n/f5+XgaucOREqJpPwGkiPGOJWWl2xzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eke6UwnoHxePLsUmocmHA2wYq0orFxM+FVW3L87kxls=;
 b=WMoSNmmi/BYjU133lAU7zceZLOHEQeWQHBZqBEVle9zhzPx+LBmz6ruwIUV3bZBQMJHbH6aI0HD3Epyl1SBqA2oYCet025kVAntke2Xcbq7BuoCblIqcSlSFYT/JU2lyw2Mw5SDlV2rvSEZLChBnYswCsfX6LlwpyJxcmpZWM2Y=
Date: Mon, 14 Jun 2021 15:27:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Igor Druzhinin <igor.druzhinin@citrix.com>, <xen-devel@lists.xen.org>,
	<boris.ostrovsky@oracle.com>, <stephen.s.brennan@oracle.com>
Subject: Re: BUG in 1f3d87c75129 ("x86/vpt: do not take pt_migrate rwlock in
 some cases")
Message-ID: <YMdZKuKOnFKpQ3sg@Air-de-Roger>
References: <0efd0099-49bb-e20c-fe8d-fb97c9de2b63@citrix.com>
 <74378af9-5d04-f95e-3957-918cf5c81ded@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74378af9-5d04-f95e-3957-918cf5c81ded@suse.com>
X-ClientProxiedBy: MRXP264CA0011.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 838d7080-e982-4ee4-1001-08d92f381e74
X-MS-TrafficTypeDiagnostic: DM6PR03MB4683:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4683A0391EB899517D6392DD8F319@DM6PR03MB4683.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M+I603CkvA4HuAOJIZLsDgTvt2HGz8HpuaVwKGGZITZJbVTQvsy8rxQeeUL2guKD8hRICmaXKjpbVVzmy/halkthVuGsAz7YdHaVZHnejvGdDO6ZWa4MkEauTMbk1xFTrZc/QiqoDE7xCUARqAfobkG1/64MDqH4JSEqmcyBEagURqRMC9xjowLWnl+1RGhU4HaOWWT67iRsrD3IgK69mSFcBUUX4k8f1LX0/jfFiGNeJOK4l1T1O8bp1dpLsGqLomsfSqqPeixrW8bq3LPAISfqlVEtlOW/WHwvQRWgSrzUaekfIjPVCfMmAKzUwQgzzhSRVrV/SLkdx0zyutan1TyYt4T2l2eKWmaHpvlgUSwo/nuPKbypQSP0a/l8CQo1sbgrdECN7FAQbFiAgv8z7F6PTP/tLKZQ9LS6n6KMC52LOn84gplbgYPncTC9M7LfOa0vJ63u3I+ndI431xMrx0oQh+Q3VLtY6efIiEI5/ATIi7QpbJo/N4t/hbyfEOTzbtfEFwkiMvWEdRszN5gb7lgNkpneEMK9MLqLcYV1j1z5FpYVXthhQGyiBlSqSRc95ydSAokpN1z0ReICzvZuJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(86362001)(6496006)(66946007)(53546011)(6916009)(83380400001)(478600001)(8936002)(33716001)(5660300002)(66556008)(66476007)(6486002)(9686003)(316002)(26005)(6666004)(4326008)(956004)(2906002)(38100700002)(8676002)(85182001)(16526019)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXFpUDdaaGV0cVdHZXQ4QmNWY0dmRjM2SGVDQ3JxcEdoNEljVXFlZCt6Q3JK?=
 =?utf-8?B?b2M2Qi9pUCtxc3haWmdKdkxwVVJhRXJXU3F4UTJmZnZ5ZXBiMXlIT3FweWsw?=
 =?utf-8?B?dFFGdGJvMVF4bjFDT01meXlkaURzWlk1SGcrVlN4NHRha3BKTmNodThQSGIr?=
 =?utf-8?B?dFNYamNZSU83c1hLcmx1cWhNd244aFVhWTFqNi8zVERMcjFpb2F6bm1FQjdh?=
 =?utf-8?B?NnBmTmREUXVNRXJGL1lEdjlrdGpYN3BralJoWDRSTDRuTkp0WkVkQXdSSDZH?=
 =?utf-8?B?Tk02ZE1UQUo3eGhrNk9aT2hhUmVmbTRRQXJRMTByUDdlM1lrSmd0L1JTcFU5?=
 =?utf-8?B?WmVYbjdrOEZPQ3V6NndzbVhmQms2akE5YTgvYXVYdlhDaGNyR1FGbll2eWQ3?=
 =?utf-8?B?ajA5YmYvRGl1ckZGTGgzcDRjdksvRGYvQ3piUnFydGhFeEIyN0hIMVFKbHE1?=
 =?utf-8?B?YlF5VVJyRlNwdndod2FzQUgrMEw3VVVHeEZNOE1hQkJKS2F0RER2NUVSNDAy?=
 =?utf-8?B?SUdLM2d6NUpRclhrSkhLWmpTN3UzaUk0NTIrdTJwSVFTajdhaElQdWs3Q1hY?=
 =?utf-8?B?OGdwOUx2ZFJ0Z1dUKzhlOE9IWFllY2VLNmdkb0RIcmM2ZlVYSC82c09ZdGkx?=
 =?utf-8?B?MzBrQUFDbmw2QWZucDRtQ1Z5UHFtM2JKdVVEOE5NdXB5dE1UV3l2aDdOKzRa?=
 =?utf-8?B?bzV5dFcvQ2JUYjUvMktqcWFDYUJrSngzYmZ1RU5kMEFqKytNaTdqUDI2eENS?=
 =?utf-8?B?ckpLU0VCdE8wcVRqQ0hxdzNJK3RPTmVHZHdjMGZ1dDFVVVprOCtjNjlJbm5i?=
 =?utf-8?B?Ti9BNmpSNk9VTXJNR1J1UzdaTklKTUUyTnhIOVMzMmZ5LzhRbjRxblZjeTFQ?=
 =?utf-8?B?a2Y5S2prMWVydjV2U3k2NnVDM1NQRkFEeW5CZk84TGZDZlhLYzFFbmJBbEl3?=
 =?utf-8?B?VkhKZjRod1pqdHRXN2tSVU1BTWhjeDZPRXZ0R1hxak83T2hwZ1VPd25qdjUr?=
 =?utf-8?B?cjF2Nk5jMlgyQUlIbDBQWDdxRldaRTRWM2xBdGhCT3lKYXdhZUtNMU5KcExC?=
 =?utf-8?B?NmdDdHBhZFJpdk10WERndkNMeHM0V1FpdG5aRGg0aDdMSmh4LzFZRUw5cmlC?=
 =?utf-8?B?UnJJbHRzQTlIckhlNlNRNnRCai85T3ZTcjcvZXp5K0MvS1ZEclVsWlgxYjR1?=
 =?utf-8?B?ZzF3K2pXaitLajJodjI5QlRrbGVYYVJVWE9zYVVlV3JSTzJuUmJHQUNWTUdS?=
 =?utf-8?B?ZC9XaWJTYi91WDhCb0FMK0creEVTbGJ2aU4zbmhJcE1EUjQvUDJKZlEySVgy?=
 =?utf-8?B?WEFMQmFWVzM5SnpCUHZwZTZIaElIcWxNVEJrTFNrRkw0UitsMTBSdjRROUw2?=
 =?utf-8?B?ZDMxL1VOaE4xZDF6R0FUVDdEaDZCTWJXZDFMOFBoakJhMldXZFRKYlZudEM5?=
 =?utf-8?B?ODROaGJiQnVzZ0VyeFFTZzlvRWt6U1U2YjNra2EzZXRWMm5FbWhOcyt2d1dh?=
 =?utf-8?B?M0lwY3FDRWkvRVlsOStvY3Zoc2laTkhlSy8zQWNZV0NlaFdGRzNiOENwTU1v?=
 =?utf-8?B?MWJ5V3RyN0wwSUhhaXNJQ2pSbUVyNFB3TEh2RDQwQUZYMzV0SzVEaDhVMlhw?=
 =?utf-8?B?Z3d1Y21BbmhtSVA1VytLSWxMZmZQREdPUGg0dm1aYnpYMkNJeXRLbVJLRHV2?=
 =?utf-8?B?ckM3MmcrYTUyVjFJcE55d2VzczRBbHRCY0p2WnJIWDVkS1d1MTVMeEM2b3l1?=
 =?utf-8?Q?DcEaWPt9AnW0z0mzXgO2HEZw1o1VCtM18SEsNZq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 838d7080-e982-4ee4-1001-08d92f381e74
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 13:27:12.7950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EhWEo0eeqdWCYH4DRvJGH5T+ksswTUTpR1dseGsQ8tJeksEvLAX4eecDKPIg+GLlhvTyoRCbml7Ra7WDVccjhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4683
X-OriginatorOrg: citrix.com

On Mon, Jun 14, 2021 at 01:53:09PM +0200, Jan Beulich wrote:
> On 14.06.2021 13:15, Igor Druzhinin wrote:
> > Hi, Boris, Stephen, Roger,
> > 
> > We have stress tested recent changes on staging-4.13 which includes a
> > backport of the subject. Since the backport is identical to the
> > master branch and all of the pre-reqs are in place - we have no reason
> > to believe the issue is not the same on master.
> > 
> > Here is what we got by running heavy stress testing including multiple
> > repeated VM lifecycle operations with storage and network load:
> > 
> > 
> > Assertion 'timer->status >= TIMER_STATUS_inactive' failed at timer.c:287
> > ----[ Xen-4.13.3-10.7-d  x86_64  debug=y   Not tainted ]----
> > CPU:    17
> > RIP:    e008:[<ffff82d080246b65>] common/timer.c#active_timer+0xc/0x1b
> > RFLAGS: 0000000000010046   CONTEXT: hypervisor (d675v0)
> > rax: 0000000000000000   rbx: ffff83137a8ed300   rcx: 0000000000000000
> > rdx: ffff83303fff7fff   rsi: ffff83303fff2549   rdi: ffff83137a8ed300
> > rbp: ffff83303fff7cf8   rsp: ffff83303fff7cf8   r8:  0000000000000001
> > r9:  0000000000000000   r10: 0000000000000011   r11: 0000168b0cc08083
> > r12: 0000000000000000   r13: ffff82d0805cf300   r14: ffff82d0805cf300
> > r15: 0000000000000292   cr0: 0000000080050033   cr4: 00000000000426e0
> > cr3: 00000013c1a32000   cr2: 0000000000000000
> > fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
> > ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> > Xen code around <ffff82d080246b65> (common/timer.c#active_timer+0xc/0x1b):
> >   0f b6 47 2a 84 c0 75 02 <0f> 0b 3c 04 76 02 0f 0b 3c 02 0f 97 c0 5d c3 55
> > Xen stack trace from rsp=ffff83303fff7cf8:
> >     ffff83303fff7d48 ffff82d0802479f1 0000168b0192b846 ffff83137a8ed328
> >     000000001d0776eb ffff83137a8ed2c0 ffff83133ee47568 ffff83133ee47000
> >     ffff83133ee47560 ffff832b1a0cd000 ffff83303fff7d78 ffff82d08031e74e
> >     ffff83102d898000 ffff83133ee47000 ffff83102db8d000 0000000000000011
> >     ffff83303fff7dc8 ffff82d08027df19 0000000000000000 ffff83133ee47060
> >     ffff82d0805d0088 ffff83102d898000 ffff83133ee47000 0000000000000011
> >     0000000000000001 0000000000000011 ffff83303fff7e08 ffff82d0802414e0
> >     ffff83303fff7df8 0000168b0192b846 ffff83102d8a4660 0000168b0192b846
> >     ffff83102d8a4720 0000000000000011 ffff83303fff7ea8 ffff82d080241d6c
> >     ffff83133ee47000 ffff831244137a50 ffff83303fff7e48 ffff82d08031b5b8
> >     ffff83133ee47000 ffff832b1a0cd000 ffff83303fff7e68 ffff82d080312b65
> >     ffff83133ee47000 0000000000000000 ffff83303fff7ee8 ffff83102d8a4678
> >     ffff83303fff7ee8 ffff82d0805d6380 ffff82d0805d5b00 ffffffffffffffff
> >     ffff83303fff7fff 0000000000000000 ffff83303fff7ed8 ffff82d0802431f5
> >     ffff83133ee47000 0000000000000000 0000000000000000 0000000000000000
> >     ffff83303fff7ee8 ffff82d08024324a 00007ccfc00080e7 ffff82d08033930b
> >     ffffffffb0ebd5a0 000000000000000d 0000000000000062 0000000000000097
> >     000000000000001e 000000000000001f ffffffffb0ebd5ad 0000000000000000
> >     0000000000000005 000000000003d91d 0000000000000000 0000000000000000
> >     00000000000003d5 000000000000001e 0000000000000000 0000beef0000beef
> > Xen call trace:
> >     [<ffff82d080246b65>] R common/timer.c#active_timer+0xc/0x1b
> >     [<ffff82d0802479f1>] F stop_timer+0xf5/0x188
> >     [<ffff82d08031e74e>] F pt_save_timer+0x45/0x8a
> >     [<ffff82d08027df19>] F context_switch+0xf9/0xee0
> >     [<ffff82d0802414e0>] F common/schedule.c#sched_context_switch+0x146/0x151
> >     [<ffff82d080241d6c>] F common/schedule.c#schedule+0x28a/0x299
> >     [<ffff82d0802431f5>] F common/softirq.c#__do_softirq+0x85/0x90
> >     [<ffff82d08024324a>] F do_softirq+0x13/0x15
> >     [<ffff82d08033930b>] F vmx_asm_do_vmentry+0x2b/0x30
> > 
> > ****************************************
> > Panic on CPU 17:
> > Assertion 'timer->status >= TIMER_STATUS_inactive' failed at timer.c:287
> > ****************************************
> 
> Since this suggests a timer was found on the list without ever having been
> initialized, I've spotted a case where this indeed could now happen. Could
> you give the patch below a try?
> 
> Jan
> 
> x86/vpt: fully init timers before putting onto list
> 
> With pt_vcpu_lock() no longer acquiring the pt_migrate lock, parties
> iterating the list and acting on the timers of the list entries will no
> longer be kept from entering their loops by create_periodic_time()'s
> holding of that lock. Therefore at least init_timer() needs calling
> ahead of list insertion, but keep this and set_timer() together.
> 
> Fixes: 8113b02f0bf8 ("x86/vpt: do not take pt_migrate rwlock in some cases")
> Reported-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Thanks for looking into this so quickly, and sorry for not realizing
myself when relaxing the locking. Adding the timer to the list without
it being fully initialized was a latent issue even if protected by the
lock initially.

Provided testing shows the issue is fixed:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Roger.

