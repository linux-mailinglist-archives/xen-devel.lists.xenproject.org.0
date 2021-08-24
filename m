Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D153F5D0F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:27:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171230.312484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUZr-00044u-RZ; Tue, 24 Aug 2021 11:26:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171230.312484; Tue, 24 Aug 2021 11:26:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUZr-00041i-Nj; Tue, 24 Aug 2021 11:26:47 +0000
Received: by outflank-mailman (input) for mailman id 171230;
 Tue, 24 Aug 2021 11:26:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QsuA=NP=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mIUZq-00041c-1N
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 11:26:46 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 293a3bc8-04ce-11ec-a8c8-12813bfff9fa;
 Tue, 24 Aug 2021 11:26:45 +0000 (UTC)
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
X-Inumbo-ID: 293a3bc8-04ce-11ec-a8c8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629804404;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kHo38nsD3Ks23BstzMQ2hTcFR5UXkGCg7TXVlBeIPA8=;
  b=K+OTUgU4iyYPoHcSsybnpxIj1V2o3j9DF/QxeFHeDeBWu1X3VoRRaVm1
   cSOwRiarDXUGd1wk2xhX4ncrH5c97ncKXgYC9Uz24DuTukG5nn9eBj073
   Vh3jWkwOrXa7CqXPvKTyHNM8crKVP7bwGQEa8etVIgSqfaVBRpvDjEmZ4
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TQg+DA0nzjWUkqws9TPicD8s/Np1hsmZF1Gc66qxLdGgkXweL5jFMQ6pE0gZJvkKo40ZnNB7ci
 kxddi2ZRMnt2W/HBUor19ocuiIgvJI+lpLr3Taw5JQ7KIh1B6JwdXIlnMFZvYcM32LFvXdsWMM
 HQTv4dp4RfjPVpvmOfKROXSZyQoQsZ8VOPzsBO84B95m+T/SBjT3S15Le+/AuXZxLg6qvwNTGv
 rs28muBUZ1p0wZ3t8gypnKvK1yxOkVR0qZH1G63etEeGXLiDjTIRrR9tsTDjIndDjdpCugjisl
 iuqyldVxOWQ6GfBQGqFMfSXS
X-SBRS: 5.1
X-MesageID: 51155452
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Xk1NeaNqKyASPcBcT0T155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/OxoS5PwPk80kqQFnbX5XI3SITUO3VHHEGgM1/qb/9SNIVyYygcZ79
 YbT0EcMqyBMbEZt7eC3ODQKb9Jq7PmgcPY99s2jU0dKT2CA5sQnjuRYTzrdHGeKjM2Z6bRWK
 Dsnfau8FGbCAoqh4mAdzc4t6+pnay8qLvWJTo9QzI34giHij2lrJb8Dhijxx8bFxdC260r/2
 TpmxHwovzLiYD69jbsk0voq7hGktrozdVOQOSKl8guMz3pziKlfp5oVbGutC085Muv9FEput
 /RpApIBbUz11rhOkWO5Tf90Qjp1zgjr1fk1F+jmHPm5ff0QTorYvAxyL5xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqvlDcmwtmrccjy1hkFacOYr5YqoISuGlPFo0bIS784Ic7VM
 FzEcDn4upMe1/yVQGagoBW+q3qYp0PJGbBfqBb0fbligS+3UoJjHfw/fZv2kvpr/kGOsF5D4
 2uCNUaqFlMJvVmJ56VSt1xGvdepwT2MFvx2VmpUCDa/Zc8SjnwQq7MkcAIDd6RCes1JbsJ6d
 j8uQBjxCEPk3yHM7zH4HQMyGGWfFmA
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51155452"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDQ6jHNuVsA+LfvAlJ9B49uDtYZqVy43ojdWC7r5WM1/UMo8QJseo7Sk/6kyUZBrcp/cEWxbbmenLcNnO8NIpSkhHixPCMzWgPaQGGn0nCDzY6+1zez7M8uo6S8xdlPo4AjRZXbwOPm/ZVW3pG6zqn3I/1MaoDjIBWcaDMaR7MYczurKMpX1GzfZSyT+VWUz6sje6T16PKHbtKLRgtJPuVSrMXrJFIWhzPpZxuhWhMgtyEj/Lx0MfwDjQC6wyxJbw68IlLQSA9o2kxl822TnlI9ZNUxdiVyX/yYT1dFMxvqB2O6/651SJ485e5dToZDR4g1Y77okTPlD4s3mLdNt0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PaXmZZWfOQnh5Uqnd7+tz6N1KiG5HkP1DbeFPUnPszM=;
 b=WszYnsGpnWT82RZtM/2SvaL2gTlUooIn19UdtdfadT+D1OsAvpiX4wv8MfbUEizZ6r90KmLfms+ZxshDwTz5AH0R8aRkGbHWhjvw3LfFAR/Lfu1yo+HKV5fzjdf2B4mTJmX1WXV8xovLQYATt6hQ8IdfDU4KWHjltOCLzEtIjAZp85UHvyOs5XGeA/F+D9wUN6OkZWc82zl0MZdFrsLTF89ZlW4/ldG+2YrRuVjWARw/hNpjwmo3nl0l5qvsCAMbgBAgdcVfvm8O/tGltJNceupZ8vu8n5O27nDKwWbmN7+77rN9UCfErC6VG+6YWEsmbTPBHsJorA/Z0USyhslGdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PaXmZZWfOQnh5Uqnd7+tz6N1KiG5HkP1DbeFPUnPszM=;
 b=f7DvI8HUwX046SIW1jB0UmotYl5pRwXZkgpP90jA68dyHkSbGJGLC+ljr2OjUChJ0xr6xy9GVzWXqXoAkXeY9cDGT8JFuHqKCnOBhISjIggTHQkbtUk3F83d0Nte+K3gHMdn+JCnzjai1E5HpWkTjjOPLmbVqhZFfDIK/y2mAqQ=
To: Bobby Eshleman <bobby.eshleman@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich
	<jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, Jun
 Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, George
 Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <cover.1629315873.git.bobby.eshleman@gmail.com>
 <7925a89cf830e0e3705a8700fce09a408fcfc27c.1629315873.git.bobby.eshleman@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 2/6] x86/debugger: separate Xen and guest debugging
 debugger_trap_* functions
Message-ID: <c3e358de-82f5-841a-a452-b935a84ac4ea@citrix.com>
Date: Tue, 24 Aug 2021 12:26:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <7925a89cf830e0e3705a8700fce09a408fcfc27c.1629315873.git.bobby.eshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0012.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::24) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eae6753d-0be1-4c90-64e9-08d966f20bae
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6272:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB62720ABB139F9E607FB42FD4BAC59@SJ0PR03MB6272.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TzvomalAXXxxw/IspBQ+GMKmVcKsNNbBJIh8hPN01MjW9HSDau2qZgBXzW//Y7t78Urv+viCIUd0a+/EG3VlWdoEqDsv3C68EXRNpHSDptVmjsKmuEkCkErEeX1M8pa5+KuQNuQu7KkkcBtbUsx9tojDZWbdPC6MGiq8Q7jrcxSPBplavFQFUOoqVPQDi+d29JFDStI4CrlJKcHELfrW1rigPdukigwXk37yc23BHfwDJ8tDaJ2MWfLgLsq7LXc54TN3pCiFNiomP7/gyRr8mC9Y+1JaVKi7pAsNoXozCSOF3p77RjuWSzFgnJXqXLuaCrD8T7nvi2KKfequE8YPQWBnklsVjWiwNSi8SsFgd1ujstBmwzPF3lU5acoS4ERoV8sd4FEyTGKSly0bBRmw/EmeOzvrG0MUfMm9gTqtUkGZR29aENQYq6d6RywWJb0f4k/EY3Bdwo/4bB9A4C5+5b09xKV4FJf/VYXy9EV4T0Ze0orNRKiN6B+a5unU5JMfpyuVv+Xy5ZX8rpOUBQZhQOF0Q2FGvu6MUnNWdpuHe14jdAaf7IA2VaBkOue1u+7q/wWTSbQJZ4cJp8UuUtq6+Z8P+bFWDt7PCyjeC9kVXAernuv6bhxdVP1Urk9eFW7ZkNbLLdLHDX6hdQtolqGBwgUj9WxjiLgcEkAApmq9/MGhrmOYFgK5orYOMeQQgE3Wuja0zgQDPj/45gd3AsqvXp1ow16pEIv0oqoedC1oGP0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(31686004)(316002)(66556008)(66946007)(478600001)(5660300002)(66476007)(6666004)(4326008)(6486002)(54906003)(2906002)(956004)(2616005)(8936002)(186003)(53546011)(38100700002)(86362001)(7416002)(31696002)(55236004)(8676002)(26005)(36756003)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXVFeFJOZ2pQM0VLc2Y3S3VkMmFOOXdJL2ZDWXlMYUh1TW5SYVBScVhkZHlv?=
 =?utf-8?B?TW5VanBRRnE2V0dUZ0Vwc01rSTdwaEc4dWxwM3phOVFlY2Q2b0FKbkc3YUlo?=
 =?utf-8?B?OXF4aXVvTW9hWGEyc1p3MW9paXpVRjI3OVNjSWJzM0hORjlPL1o2MkNrR3JZ?=
 =?utf-8?B?TFNEUm9ETkpXbXhaclFpMVJNTzFQMzFzMTRqaWFiNVhheDBWanBNY2UvVlU1?=
 =?utf-8?B?cXFoaG1MSXQ1TStmQ0tYaDh4MWFybkVFWUw1YkQ5Z0hpdFJqai9Bd2c5VlZQ?=
 =?utf-8?B?NmRlTGFaV2dZZThneHlJTjl6VU5nVlloWUJSSllZVGNLbnBySU9TZGlTYlp1?=
 =?utf-8?B?akpmZVcreWVVNDBCVzlpM25RbFdTd2M4YTZXeDNOb0RmRHU1UzdBY2tQMVc2?=
 =?utf-8?B?b0lIbXBwazlkWmZwUCtGMExuNWZld3BUZXlOQTkrdk9rY1pSdlp2VW1reTNJ?=
 =?utf-8?B?N1ROSTRmS1VkSFY5aWd0VFpkQUhuZmJNS1dOTHFTSjVRT2doUTJadTRlNDJj?=
 =?utf-8?B?VmtKLzB6Tm56elNZZ1YxekxRY1MxdjJTTmtsL0ZleTVyM2FZaVhjbzVxTFJX?=
 =?utf-8?B?VVo1QTBJbkFUcVlURDVNMHJMeWFNRjBDeHJVN24rcjV0S3AvQUxKNi9yejZW?=
 =?utf-8?B?ZTdxRkJndUxHTitMWVM4RjlPN1NlQXVpUE1ETW4rUUwyMitaUVZpd0lsTndO?=
 =?utf-8?B?YXVnL2JKUjY5U1RMMDFTSG5yRWxzeW9PTEtlQTYxR3VONnRaT3Fzdkc3SUh1?=
 =?utf-8?B?a2s0T1lKZDV3NXRYWkJRd3pIcktCRmN1UTNpdDZBNW5vK3kzSzdUaURHQkdR?=
 =?utf-8?B?cDFZVmdJL0tiT05nWDU1eFQzRHNpTS9HbzY4ekpOMFRoaVZyTkM5UEl4KzZn?=
 =?utf-8?B?QzZEUU1QbkJGcVBiVWFCZ1ZPYy9NV0R4WnVVUmtBd3NEYTRSMU9xY0RaMkFy?=
 =?utf-8?B?ZlFmeDluNTlWdWtRaDZvSUo3dUplWlBHZElycWwzc0hnZE9LaGdyTEE5Y3l5?=
 =?utf-8?B?NmVYTkEydE5Eb25vVTFoeVV4bGZod3p0Z2pEUTIybUNsNjNTWm1nTWQ2WFVv?=
 =?utf-8?B?WDlMaTM5S083OUpYWSs0NEZPWVhFWFl0bnFidUlNYnUyMkFseU4xKzF0UFBC?=
 =?utf-8?B?b0NIbmxpNFo2Uit1a1JhazdITUhZSitGTzVlVUdsZnplbEdjTHdsUitiS0dq?=
 =?utf-8?B?a3YyWGlQYXVDNXpNZ3pZUGNjL1JRR1grYURnQzJIOEx2WUwzRlpOZjQ2VW93?=
 =?utf-8?B?MTZLN284U1JjbHJYc1lETTVnR1h5aEZEZDFrSFNuYTJKMFVKdjdFQitjM2xj?=
 =?utf-8?B?czQwaUFVYVlLeHhwbWxwckd4V3ZjT3VnQzJXRWV4dEN3RlRlbldhZ01NWHhh?=
 =?utf-8?B?QnZuZWdoZGpESERJeURMa0FtbjFya0E2VDYzZmNaa2VwM3ZBOGkwenRTWklE?=
 =?utf-8?B?UU1ubTFBeUVsSjZCaVhRMWFVK1d0K3JHMUhyOUVxajQxODJFRmxUd1BvMllG?=
 =?utf-8?B?YzVaLzhDMTRQaURFSFZYTUFkSDk1YWZYYUdpcW52ODBYRi93T1Job2N0TjFw?=
 =?utf-8?B?eDA2ZnBmWG41Mmgya1VUbmc0RHJmd0xnOW9pOHZyNzh6T3U4SW9ETHg1aVhG?=
 =?utf-8?B?Q1dxdEhPVW1GdDlrSGhlR0w3RHZXS1ZUN0U2ajJ1UXBoOHdkSFJFM0s4dzZm?=
 =?utf-8?B?Wjd2WmpoVlJLVHk2ekh0bktqY3hLSkhDS1N6VWdySGo3Tkl0amxMbWNTZnhG?=
 =?utf-8?Q?ex5YbC86h4bLXceV6KcD1jqonsqfNC2z/stKf4W?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eae6753d-0be1-4c90-64e9-08d966f20bae
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 11:26:41.5372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6OnXu1UmD0WqQd/wWXDtmRpB9salo8aKTsQM4A3Zd9Uv7sTQF7ktBGtG1xm/vBhXCAXWnb04POgitILJRR8rQKxDmFvgOHA34ju8K9rZhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6272
X-OriginatorOrg: citrix.com

On 18/08/2021 21:29, Bobby Eshleman wrote:
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index e60af16ddd..d0a4c0ea74 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -858,13 +858,20 @@ static void do_trap(struct cpu_user_regs *regs)
>      if ( regs->error_code & X86_XEC_EXT )
>          goto hardware_trap;
> =20
> -    if ( debugger_trap_entry(trapnr, regs) )
> -        return;
> -
>      ASSERT(trapnr < 32);
> =20
>      if ( guest_mode(regs) )
>      {
> +        struct vcpu *curr =3D current;
> +        if ( (trapnr =3D=3D TRAP_debug || trapnr =3D=3D TRAP_int3) &&
> +              guest_kernel_mode(curr, regs) &&
> +              curr->domain->debugger_attached )
> +        {
> +            if ( trapnr !=3D TRAP_debug )
> +                curr->arch.gdbsx_vcpu_event =3D trapnr;
> +            domain_pause_for_debugger();
> +            return;
> +        }

There's no need for this.=C2=A0 Both TRAP_debug and TRAP_int3 have their ow=
n
custom handers, and don't use do_trap().

> @@ -1215,6 +1218,12 @@ void do_int3(struct cpu_user_regs *regs)
> =20
>          return;
>      }
> +    else if ( guest_kernel_mode(curr, regs) && curr->domain->debugger_at=
tached )

if ( foo ) { ...; return; } else if ( bar )=C2=A0 is a dangerous anti-patte=
rn.

This should just be a plain if().

> @@ -1994,6 +1994,11 @@ void do_debug(struct cpu_user_regs *regs)
> =20
>          return;
>      }
> +    else if ( guest_kernel_mode(v, regs) && v->domain->debugger_attached=
 )

Same here.

> @@ -2028,6 +2030,12 @@ void do_entry_CP(struct cpu_user_regs *regs)
>       */
>      if ( guest_mode(regs) )
>      {
> +        struct vcpu *curr =3D current;
> +        if ( guest_kernel_mode(curr, regs) && curr->domain->debugger_att=
ached )
> +        {
> +            domain_pause_for_debugger();
> +            return;
> +        }
>          gprintk(XENLOG_ERR, "Hit #CP[%04x] in guest context %04x:%p\n",
>                  ec, regs->cs, _p(regs->rip));
>          ASSERT_UNREACHABLE();

This path is fatal to Xen, because it should be impossible.=C2=A0 If we eve=
r
get around to supporting CET for PV guests, #CP still isn't #DB/#BP so
shouldn't pause for the debugger.

I can fix all of these on commit.

~Andrew


