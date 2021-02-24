Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EBC32402F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 16:26:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89396.168354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEw3H-00063F-Rs; Wed, 24 Feb 2021 15:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89396.168354; Wed, 24 Feb 2021 15:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEw3H-00062l-OM; Wed, 24 Feb 2021 15:26:11 +0000
Received: by outflank-mailman (input) for mailman id 89396;
 Wed, 24 Feb 2021 15:26:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qs49=H2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lEw3G-00062Y-CU
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 15:26:10 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e531d45c-1892-46b8-b285-54d448d8093c;
 Wed, 24 Feb 2021 15:26:07 +0000 (UTC)
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
X-Inumbo-ID: e531d45c-1892-46b8-b285-54d448d8093c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614180367;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=FC0LM8ssa0n+KskI2PcVyMEibRpH6LqagzACBObBRWQ=;
  b=aQBeIZtb88tZ4K5UZ3cTRC4JNsh9F1ubBPUgoiD37aE/tfv8ARID6crJ
   4CLrRkWzRI64ZhEh66qEWR6QonnAxDI6cxstdjt0z+GKfvEyFvmUWGs5I
   bj/t444o+xzUnlBaSMrAohKD87Wzveytpdu6OUYBSYDirrt4XOXu8/+pS
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xcXNY8ZZzFmGuxTgpieVIvZxNpYCgE7Q2Ww29819WviihNzH4ynGbXABmA/FW2sakKFt3SfbCr
 1bebHiNJk4vaYyaGd7yNQvxmO58UzjGeEUZI5NSlo2gYcgP/aOHOXI+ev60aeD2muJg6K8sp0E
 d3MIA4RvBbl4+AzXpFZasH0X96nifZBZnIIwMSJ1l+fDPFqYtdU26fqvfZW75FKcujvuwKEIoE
 K5WOqe7dRDd6FNNafiMoi/VhP24KCLXDUhPHM9tmDjBi2XOHCHc140lm6uo00R5JDOFwUHekHy
 DN8=
X-SBRS: 5.2
X-MesageID: 37950516
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,203,1610427600"; 
   d="scan'208";a="37950516"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H2opRxzn8zggQHq6cm1wa1v1wCp00XX1bP5bN2WTIf/qb8tu864lA7mFzkMup4fab237OHXjq6xEVdiM0cmZhASKVEFMJ2/2zJYzVM9OEYxjM65mVGblMUrRKHyQg7nrRPfO2eZjW59K86VA7zYLGJoy8dPcGHJLecYM7N+nefmPxBQr20ldrSBUlwLLRX6caxB4RUOYNXuedNRy8u2vUAasG0VZSVBe486KJAfJS5hqyy6BrCs/ICgmm/IqKZ5OaqhYJR0lKp880y1yrngE2F9m5jZQYGlYTpCmohMaBOOXfL3A2Si4Fb/yV86yLV35id2FKPfSkPG7sADAmyG7jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rf4THjaV32Kqcxxb+3mvPFGJP/HPmVlHwfGg8rvX54=;
 b=A+CV5soXthExcXgPu45AtQYlRRtoqgMnMKdWHGSuZwNgSfdodJrAxIRv1c+HXWXKrjj10aSkXrtVSqPwdQ63ePMmeC9BiEMtw9dJK/bTws+FdukgAF1Mh3pxMzypyvLcPksVR5bWCNtf1pcn9usor+9N2PjiI7Qq2sKobO/UZ6oUI3clqPqgc96uqEC89t3pII+nsmCgmp25a1dNe+6Yd3TJxkwVbRfesGNQ7LUguIR4mHDM7Yz9IRYjbCTDIZvbYfk6R6EoTUOk+yoesmiU0Xk2b3AlPKRcPB7mBD1Cnn8VfU4bYFoYcCBQK4oHsuaJaV6PPI6GgKE9UjapsxGAtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rf4THjaV32Kqcxxb+3mvPFGJP/HPmVlHwfGg8rvX54=;
 b=CaL5+Eh3Mtx1ZfNUWJIW3seCMJqk7vIC1r0o4GzWcwy72Tg60FDQIzr/zCMsgiMAUrRbQVMQmAqL5nOKnDyb4YBYLARh8MAQEGT0SmH6zcT2RZe1wiJqx+HUvUjNv8XFduyJJqzSCxjzVo/wPg/IGIkZXUqqBpswp0nu0a8V2yo=
Date: Wed, 24 Feb 2021 16:25:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.15] elfstructs: add relocation defines for i386
Message-ID: <YDZwBsNBY+uyLbcB@Air-de-Roger>
References: <20210224145856.94465-1-roger.pau@citrix.com>
 <2db1f1db-6a99-c0a1-98c8-2af2ffc7ca75@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2db1f1db-6a99-c0a1-98c8-2af2ffc7ca75@suse.com>
X-ClientProxiedBy: MRXP264CA0022.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbbe0c93-4c81-4d5c-53a5-08d8d8d87ff6
X-MS-TrafficTypeDiagnostic: DM6PR03MB5323:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5323964AFFDA7FFBC4C3B0378F9F9@DM6PR03MB5323.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mx9ZbNfS2rDiK9Nn4syzbwWLsFXz90s3e+ppsuTxYHs4F+R/Bwt/bpZn/S6HPJ6ZYeX+Gdx48IIUGbOWC8p2Ahi3xms+5t3JLZwUCOyB4sLZFRXjSD4MeCb3wigs6tnonjYzCxzBcNRcZYBthpNPLl8BL+FueXSfQBdaMwjmEUKxAah0vWqNc395hLqF/78k/EYiLlAgIb0RCWw8J9zTtGDgNbkg1KDn2Av89cqCs0pLdBp8VhqLFVATgL1+RPDrX+JXVal0lY+AbQV9cf5aUKZNVH9hg8Pzw+uYsWLn6I/eWpbhgTJXx2SDPuqLpowa61VeOxOHQBb6371ZEtmzCBQWS12OL9yU0DGIVAAa8hCtXcfy2MF1Dyq+Ks+81FwYlzwiT5oWUPYaTbGoyC4/pXxOaBsP2R9V4DBYObT07ubu9nQGX9vWwr8WuAE+P7Daq2cBSFUy73reUZFT0oqT97b7OR1Th8HE8cRqngg4NwNAsT7oIJyANJwvdRAv6UthanDviYtGC6pyRGzSqt59T1OelCC+2tP3wmTRC0m9GURouz8nDvP9sc7TxwcBUm0i
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(366004)(376002)(39860400002)(346002)(396003)(66556008)(6496006)(5660300002)(6486002)(26005)(9686003)(16526019)(54906003)(33716001)(478600001)(66476007)(4326008)(186003)(6666004)(316002)(8676002)(2906002)(6916009)(53546011)(8936002)(956004)(86362001)(85182001)(66946007)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K3pGcVVwcUx3YS9PTXRSTy9pSENsSmFMUitKSzF2RXRTZXk4RVVmNzhFZURG?=
 =?utf-8?B?L2Y4ZytCNXJQeGN3TVJrZEFiYzgvS1plQ09XbmpZRlN6RW1XMlVSYzBjOUg4?=
 =?utf-8?B?QlBKRit2OVZUbzlyQld3T1AzOG1SaU44MGM4WHAzNUZNeVlmV1JrU0VCQm5O?=
 =?utf-8?B?L0kyM1FUMG1OOFRnOTJ5WmR6Q1pNczFNYUkvVDBBdW1lNlZrNVE0cCs0MlV1?=
 =?utf-8?B?cGZnZGl4bkhCVm85UXRWUnJXbXNKcWErd1NYRXZJMGUwLzhVc1pjcGNwTWJC?=
 =?utf-8?B?UGhmZk5RUjhsTlZldE5YTXJkcDYrY0NIanU0NHk4S1VTQzI4T2xpQWNNM24r?=
 =?utf-8?B?RGNZbzdUNGdnK3YrTS9vUzhuUUs3TXlrV0hJWm5Ud2RMbmhHK29tZWk2MnVi?=
 =?utf-8?B?M0J3VmUvdzl3NUxqdXJEODAzczNOQjhCVDUwN2wyK3FwdjhaVElwYmt3Z3px?=
 =?utf-8?B?MjZ6Z0ZoNkQwWHRhZUxFMDNLTVEvWVY2RFRnVzJVOVpXZzhFUWJYaFgrN3k4?=
 =?utf-8?B?ZGJ4MFg5SVNYakZzamJaWE15ZjJ0bDdJK0tOelFYRncwdXhXazlsVjlqZUtB?=
 =?utf-8?B?U2ZWcllseVNZU1lualhiSTZxYnorbmx2R3hKWGRGTWRqblZCM2YrUjJxcFhK?=
 =?utf-8?B?ajkwZ2pWZjNhUFBFOWs4UjAyVWpoWkpLeDZkQ1JHaXRtV1JKd0F2SjRXL2hS?=
 =?utf-8?B?bzA1K3pTbkJvbTc4VnZzRjd3dk9OdXhoN3BVRHBWSTZ2NTAwNUg2TnhQZExu?=
 =?utf-8?B?ZUgrTVRsdVN1TWdQSzdjMW1FK3pwY1RScldOYzNuYTVydlZjWkRYMmI1WFZt?=
 =?utf-8?B?Yjl1WVhDK2NQRVZtZDhLcHBxM0k2dXIvQ25ObHZOTm8wSC9EMGpxdUk0VXRh?=
 =?utf-8?B?WWkrVkErbzZONTR4TjduOVVaQTZmUTUvVldiZjlXem94emVLRzBLeVg3ZkZy?=
 =?utf-8?B?UmVFM0ZHZEVkenRiTEo1d1JUZGRaVWgrMUFDR1F3dS9RTkJwMHZHanBLYVR4?=
 =?utf-8?B?RXgxMGFOSDQ4bzBvMTQ0bGxuRzJOZS9nYzRhNUNIbk5kNHNHNDkyQ2RvMmRC?=
 =?utf-8?B?U2oxWnJ5clRUbkJzdmlxaHpuYkJ4STJGTkRVL2REZnoyMzZnVHRSdXN3QzQy?=
 =?utf-8?B?SUc3VG5WOHRXaDlIZ2hsdXI2cGEvbzZLeUtUTWhvT0RqVmM2RStDazNpSUJT?=
 =?utf-8?B?RFI3T1R4aWZkc3QweFpnRXFBaGFLU3p5bWgyOEp4QUxlb2NtbmMrRzZYVGNU?=
 =?utf-8?B?cU02QXZNQk1ySWdhMlA3ZlQ3ZjNQTUJKZkk4RnFZME5oM2xLcW5UQ1dnLzFK?=
 =?utf-8?B?dzBITGxxeDFta09nRUt5T29ZV01vQUpUSVBmeFJ0aXJLQk9GN3lVY2xPSFIw?=
 =?utf-8?B?bFdDbW9sbW5qaUtnYU1NYUtYd2laT3F0Zmw2M1BvY0YycnBZaW9kOVNVVWlV?=
 =?utf-8?B?UnpXV0s4emZiVDJ3Q0pRQkoyZ09hOVBWQ1B6NHp5Mm11LzJnSjgzMUF0OFE3?=
 =?utf-8?B?bG9FTENBV2taTzRwdnRmQmtPNkc1WS9BRmFVZm1BRjRlZ0NZeHZ5cWhuMTdq?=
 =?utf-8?B?V2VEWjhuekpjTkZUejZtK2FWUVpYclFZdEFDRVp2RHhKbTZ1WnNQODl5YUxu?=
 =?utf-8?B?MHFRa3I1QVV4SGpwSXN5bDR1RjZaWHVBdVBzblZRRjd2bmlOak9mUFY4ZnhS?=
 =?utf-8?B?V1dkWDVxTG5QdCtkeHBuODB3NVhPRnJOam1zU2wzOTNUUDZhU1ROcm9FcFhT?=
 =?utf-8?B?ckEwY0U0T2ZCdEdsK3hRcHd2VTdyM2xGbzUrOXlHQTRRaFcvTXlTeDVseVZV?=
 =?utf-8?B?LzZSWXFnYTBaWk9kUC9MQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbbe0c93-4c81-4d5c-53a5-08d8d8d87ff6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 15:26:04.6311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lrd1aLZvAX//OHMz6kP5Fh2+13NxK9rshPRXtQH17fpuPwFAkbYVvzZI2jichq1dNmbLJhCX88MXVd5OBV79GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5323
X-OriginatorOrg: citrix.com

On Wed, Feb 24, 2021 at 04:01:13PM +0100, Jan Beulich wrote:
> On 24.02.2021 15:58, Roger Pau Monne wrote:
> > Those are need by the rombios relocation code in hvmloader. Fixes the
> > following build error:
> > 
> > 32bitbios_support.c: In function 'relocate_32bitbios':
> > 32bitbios_support.c:130:18: error: 'R_386_PC32' undeclared (first use in this function); did you mean 'R_X86_64_PC32'?
> >              case R_386_PC32:
> >                   ^~~~~~~~~~
> >                   R_X86_64_PC32
> > 32bitbios_support.c:130:18: note: each undeclared identifier is reported only once for each function it appears in
> > 32bitbios_support.c:134:18: error: 'R_386_32' undeclared (first use in this function)
> >              case R_386_32:
> >                   ^~~~~~~~
> > 
> > Only add the two defines that are actually used, which seems to match
> > what we do for amd64.
> > 
> > Fixes: 81b2b328a26c1b ('hvmloader: use Xen private header for elf structs')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> In principle
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> But ...
> 
> > --- a/xen/include/xen/elfstructs.h
> > +++ b/xen/include/xen/elfstructs.h
> > @@ -348,6 +348,9 @@ typedef struct {
> >  #define ELF32_R_TYPE(i)		((unsigned char) (i))
> >  #define ELF32_R_INFO(s,t) 	(((s) << 8) + (unsigned char)(t))
> >  
> > +#define R_386_32           1            /* Direct 32 bit  */
> > +#define R_386_PC32         2            /* PC relative 32 bit */
> > +
> >  typedef struct {
> >  	Elf64_Addr	r_offset;	/* where to do it */
> >  	Elf64_Xword	r_info;		/* index & type of relocation */
> 
> ... I'm heavily inclined to move this a few lines down to where
> the other relocation types get defined, and add a respective
> comment.

I've placed it together with the other 32bit ELF relocation structures
and macros, but I see the rest of the relocation defines are a bit
below, feel free to move it. For a comment:

/*
 * Relocation definitions required by the rombios hvmloader relocation
 * code.
 */

Does seem fine?

Thanks, Roger.

