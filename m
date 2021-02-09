Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AAC3152CA
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 16:28:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83284.154578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Uve-00072y-SF; Tue, 09 Feb 2021 15:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83284.154578; Tue, 09 Feb 2021 15:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Uve-00072Z-P9; Tue, 09 Feb 2021 15:27:50 +0000
Received: by outflank-mailman (input) for mailman id 83284;
 Tue, 09 Feb 2021 15:27:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t2YR=HL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l9Uvd-00072R-23
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 15:27:49 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c742a8ba-f49b-49d5-91d2-40533d1d09f9;
 Tue, 09 Feb 2021 15:27:47 +0000 (UTC)
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
X-Inumbo-ID: c742a8ba-f49b-49d5-91d2-40533d1d09f9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612884467;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=HXZLslgFJrdRiAT2A/Enh1tqqq9va1VCA0pmgs4xyoA=;
  b=dEscJflqfxTJWfL+ncDa+jK/ECu/XZKgc52zqYjLD8BnExlhECaHzA+y
   x0FLZ0j2HU358eiGQq4DbNK+Kb6l35H93kPmj+FFtXyYZwDOydtBYThtT
   qq6u56XAIuFrKo+jaJO1eVgGHvck/BrS5K4CGvViy44RTfFwxXc2YNwBr
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: AhVPYfQI43N4hv/yeooexhfuycttd28VvyHBqCFz+HA1QtXS08EPntvQJxcPOLZjBAxrhbu17L
 NHsivAOAZ53R9nffaJ+LPRttLZ1YMbQS3O5A0B6KBfTUZszGy70nSGbhodIYKuipIAVENS6xwJ
 8mDfMXfVYPI3ccy5jNiqjv+0BhaYc0Wg37/4SDSEmfHkDJRpOwFzzamyDMIQ6ZD3KM0xQm2vO9
 w84OG7vJLtOajF9h3whxYg+aZEjmAEl9FDiZvU3MycY5BJqoH/yh5vsPCRjcFpY58kTWZGqXKy
 LPU=
X-SBRS: 5.2
X-MesageID: 36867672
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,165,1610427600"; 
   d="scan'208";a="36867672"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lyudzkh3MvF5iNBPNF+9E8EkcYgg3WoE75Ps7PuPcyPmE+s3UFuDMvmMAZ9RpTLkXLrY4Ty8TOFaCPNf2mPOMn7koFlHNDGKcuy5xdaM1xAb4JxhN/uV+C1dhiRZ5fIBxiXAh+i8Tk8Q1qOHq4hJJqXhJEzjLqH0pdeBsV/lTWkEFQwWgQMOkQ1ojmbnE4EvRlPCQ+jPI2NcDEa10tpglJ3Qw43eIhAnMss/gdLkbtbAsc4Ajkt6VjCWzz8ky92HFN54PSsolPhovva+CJshFuX3JodpRponMxGAU1vf422vnsfETTUSyWhQKq09AlNeYTIlak1jvM7liJdv41W5SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75TnBMT0TZ+oFnnZVxQ94PIkDAM1wT+CN9/UN1di+dk=;
 b=aEkfJFqK+oodA5vb5Lbr8kngTZE7pmdvXYFwxkZuM0lCUtzSm6xb0CdXaAGjreG0O7ezDdct/D9dRTjHunIHOs51hXSgNMTmS2fS6VFU5ylikVvjXJhPWrqL2O1XlSn2fUhmRO02B9F9XZT+/RwwCpGc2DA2jysZXZkKuT9FN+6DMRBBVJVvEHtsJKcNytteJsx1iREPzds3IDuqrYuykHvCbXa4KhanQ2lqSLsgBNPXLgBndUTm3dAaiTOJVgWMTXgIPvJXDcyuKupOrgUes5HTaSvHT/v31BrW5MGx6z8+N4FMt7QhdhykxOI05wHYuV8/KF7VAjKOo7koDcIy7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75TnBMT0TZ+oFnnZVxQ94PIkDAM1wT+CN9/UN1di+dk=;
 b=D9UYryspZnFRgx9QefyYoI90bIH8ccKxMkphH2gqmip9ZTIzewcveqJ2E273pT9U1foIHvWRUZJDh8xbixnHbDh23dwUpXVYkvhPIDySmFyTjUzTTD/4Gh6YqX5Y5kfebMJM9KtuPpqYen/hDVdPu9p3fFTZPryAhmS+y7T2E5w=
Date: Tue, 9 Feb 2021 16:27:36 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Tim Deegan
	<tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 02/17] x86: split __{get,put}_user() into "guest" and
 "unsafe" variants
Message-ID: <YCKp6Cm0wtja7D1i@Air-de-Roger>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
 <13d1d621-21db-0e59-6603-2b22b6a9d180@suse.com>
 <YCKibN0mjROss4M4@Air-de-Roger>
 <11d58555-97d2-0489-b123-cbcf084a0094@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11d58555-97d2-0489-b123-cbcf084a0094@suse.com>
X-ClientProxiedBy: AM5PR1001CA0067.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::44) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d33bc5ec-06c8-4301-2c06-08d8cd0f3ded
X-MS-TrafficTypeDiagnostic: DM6PR03MB5324:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5324AE2CFBB743401741375E8F8E9@DM6PR03MB5324.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xIWv9cfLdIoc/nsyFZrg89wzMM8AchTiDf8nvCYYYAGB7IaeWX46Vex17mruW+Ha6+Ogxi4WpMIdD86bfXV+yDxXy394AlRPLRKWIYDPS95U9MqAbrTVzI7/LVYr0w6nhJu98sLn9bjfuJoLfkhk5OEfRy6TMciHSsWdJATtu4C3vJUH0phrQDT3v05+kMKqDhcYBEwmxM3qgWvLKrROEVjx2qh6ycemLL6HMCZBYmmDwsV0m2/t/COIs0WZDV+sdMjc6Ht4Zki3C6RXeGchwhi0R7G8MjVMYfRYgNcKp9QRTs6CTYv6BJ0UJhpuFmtyYL7OxFwQMfvzSwCRLUO6/KeuiZ/cPe10FOl1JONtLfYqcPauYNxyJMKgfVf9endKplB9tVAiQMuDjoWBGtuY5ptnReFKYOnwe2XT12Io95vzpcTPMbAySRDfUBQ2oGj1GgXorN/s/nVC98sMPaxfwlElzjAbOTbIcOCgf3JawSW8T8+lzv7dNHKZDxkDho3K9n4adzTOimDg7f6MUDEyZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(366004)(396003)(39860400002)(346002)(136003)(186003)(16526019)(5660300002)(107886003)(85182001)(26005)(2906002)(956004)(83380400001)(6666004)(316002)(9686003)(8936002)(66946007)(4326008)(8676002)(478600001)(6486002)(53546011)(66556008)(66476007)(54906003)(6496006)(6916009)(33716001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dWczMW9BMU9VMEVwVTVqcG1MVFFtTm5EWm1QUTF2RThXT2YvVUhvYlhLZUQv?=
 =?utf-8?B?U3FtaXZOdXVORVdnY2czam9DMEVyUkdmcXFuYWZwbllsZm52UVZMMS9HZ0Zx?=
 =?utf-8?B?MHR1dUhJT2FPNXliYk81RHA1QTFXRGR6UE5CcVNkckpFRnpiWXQ4VCtiSFdM?=
 =?utf-8?B?UGdnMXZFVnV4UG9Ha0FOaFFJTTlIUzNXZTQySXRMSzF3VStOYnJrM0NtTlpj?=
 =?utf-8?B?cnRHWFl2SFc1UUhJMGY3NmN4T3ZQZ2drSzU4TTNraUozKzNsZ0RqN096ejVS?=
 =?utf-8?B?R05VUlRMcU5kd2doR1NUQXY5N3dTVW5CQ1hycVpBR0FDNEUzM3EyZGhGZ0RO?=
 =?utf-8?B?dTE2NWVnOThIaVhNS3RtOU5FaXNrK2NObE1RQXFYQ2hhYlVKSnZJL2xpc1I5?=
 =?utf-8?B?NCtuSnJaQ0Y5dkZkOTFVSWJITVZRY01BS2ZGbFlQbWNnTjFzYUN0dFJsMVVX?=
 =?utf-8?B?dUZlOXIwTENKNm9XZk9qOXZZOHdlNDJrQ2FZUlZJN2JKRzRacjFMdUZCZ1BW?=
 =?utf-8?B?ZUZOUjFlcjY2bTJ5RDNLSW9rRXR3d3pxSVBuN0xjMldZRkVyUHlKbThSQnkz?=
 =?utf-8?B?cG1RdlJEUm9qTDg1cEFjdklnbGQvb0FDK25iYVI0c0dVMFBlM2dIMnFPVC9j?=
 =?utf-8?B?SitLYkRZMDVCSDFzMEQ0NllFQ29LY2J0bzF5akRwS2NwS3B4L0gxWlA0WXFx?=
 =?utf-8?B?M3hycWZLRnhxeXBRSUdlUklzOW1ZU253a3hRQ1VjM3RFVGQvSk9BZ1UyWHI1?=
 =?utf-8?B?UXh5Y3o4VVNIUk5xN2ZzdHZ3NUJ1Q2lGbFBSQWV6T1lITEhISHhlYzBjWTNJ?=
 =?utf-8?B?MDRQZW0xL0xXY3ZnL3p2YVNkTWdyTFdad2pkanExTXhvbllMTkdzYVNLU2Er?=
 =?utf-8?B?cGVxalFoL0R1bW9DRHVScTdJd0FLLzYrVDBtZnRYK1FTbVB0LzZkU0NVZzda?=
 =?utf-8?B?SEdnLzVuVjUwbmo1Mmk0QnRVeGtJdjROZld3QTcvYVQ2NGJ0YTlIeGFIcmZz?=
 =?utf-8?B?QmZ0cGM5RFo1b3crekV4cVJYMTQxVGRreEQzS1RPVEJOOUhjVlZncU9CWlJl?=
 =?utf-8?B?SFRZLzA1b3JtTVNTSkpFbnJvNkt5MXlRR25YdTJrSVNjYXZhQkZBcEpFdG1R?=
 =?utf-8?B?Tm5RcGdZZHVPQng5emM4d0RVSCthUGcyVTFDTjUvU1NhQ1pJd1RhcWNGWEs3?=
 =?utf-8?B?SGV4Ti8yc1JCYm9SYzYzS2xQLzA3d1FqRm0yenV3ZWhvM3FCTnIvbkFxeTEx?=
 =?utf-8?B?TUlxRzV0QmxLd2xwVGR2V1BLYThvSEoyOHNEMm1zVkhxY0lCSk5nZkR2MTA1?=
 =?utf-8?B?dFJaS0N3K1c1MzdNL2RQN0ZPOWNNWlEvclpFTzFZNFhLbHZwUEZBWXViZHBm?=
 =?utf-8?B?UVNwRVNLVUV3Q2pYdXp4d2g2dnNhZHEzenlkaGZ2bUI1bENRU2d3QnFtN2dx?=
 =?utf-8?B?M0QyRjdRREs1YXVhcC9TY2tyZUwyTGtGS3FyZ2V3UWxQUGxQMm9Lc2ZrY0E1?=
 =?utf-8?B?enFtVG95NFFqUEs0Mzg3dFU1NUo3WVBIazU4ZEUvbndLektMVlNRaFpDUHlz?=
 =?utf-8?B?Zk5HZ0xWRllUUC9vdmxTRmFoMkkvVFRQb0dJcDJ1Z0txbEhmb08xNklRb2pq?=
 =?utf-8?B?RE1hS21HSzNidU5iSVRZQUFXaWJUN1VlRFl1ci9SZ1BXdnFsVWNXVUdiSWlp?=
 =?utf-8?B?TWZCNjR3YmU5ZHlJejFNeDA5UGFoaFJ0cEVWUGRweXFsQ3YzRjZGNUk3ak93?=
 =?utf-8?Q?co9ziTqv9fz2Ueh5YOpjyiUTv8Fk16WjpdauntV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d33bc5ec-06c8-4301-2c06-08d8cd0f3ded
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 15:27:42.2023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: huNdmsUSoCUQ8f4YVAkqxitq0eJamLlRLJrOqC+41eptxRTW15+CWOkUxgASnCNz0VliVg/HtSa6PN14I2wSIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5324
X-OriginatorOrg: citrix.com

On Tue, Feb 09, 2021 at 04:14:41PM +0100, Jan Beulich wrote:
> On 09.02.2021 15:55, Roger Pau Monné wrote:
> > On Thu, Jan 14, 2021 at 04:04:11PM +0100, Jan Beulich wrote:
> >> The "guest" variants are intended to work with (potentially) fully guest
> >> controlled addresses, while the "unsafe" variants are not. (For
> >> descriptor table accesses the low bits of the addresses may still be
> >> guest controlled, but this still won't allow speculation to "escape"
> >> into unwanted areas.)
> > 
> > Descriptor table is also in guest address space, and hence would be
> > fine using the _guest accessors? (even if not in guest control and
> > thus unsuitable as an speculation vector)
> 
> No, we don't access descriptor tables in guest space, I don't
> think. See read_gate_descriptor() for an example. After all PV
> guests don't even have the full concept of self-managed (in
> their VA space) descriptor tables (GDT gets specified in terms
> of frames, while LDT gets specified in terms of (VA,size)
> tuples, but just for Xen to read the underlying page table
> entries upon 1st access).

I see, read_gate_descriptor uses gdt_ldt_desc_ptr which points into
the per-domain Xen virt space, so it's indeed an address in Xen
address space. I realize it doesn't make sense for the descriptor
table to be in guest address space, as it's not fully under guest
control.

> >> --- a/xen/arch/x86/traps.c
> >> +++ b/xen/arch/x86/traps.c
> >> @@ -274,7 +274,7 @@ static void compat_show_guest_stack(stru
> >>      {
> >>          if ( (((long)stack - 1) ^ ((long)(stack + 1) - 1)) & mask )
> >>              break;
> >> -        if ( __get_user(addr, stack) )
> >> +        if ( get_unsafe(addr, stack) )
> >>          {
> >>              if ( i != 0 )
> >>                  printk("\n    ");
> >> @@ -343,7 +343,7 @@ static void show_guest_stack(struct vcpu
> >>      {
> >>          if ( (((long)stack - 1) ^ ((long)(stack + 1) - 1)) & mask )
> >>              break;
> >> -        if ( __get_user(addr, stack) )
> >> +        if ( get_unsafe(addr, stack) )
> > 
> > Shouldn't accessing the guest stack use the _guest accessors?
> 
> Hmm, yes indeed.
> 
> > Or has this address been verified by Xen and not in idrect control of
> > the guest, and thus can't be used for speculation purposes?
> > 
> > I feel like this should be using the _guest accessors anyway, as the
> > guest stack is an address in guest space?
> 
> I think this being a debugging function only, not directly
> accessible by guests, is what made me think speculation is
> not an issue here and hence the "unsafe" variants are fine
> to use (they're slightly cheaper after all, once the
> subsequent changes are in place). But I guess I will better
> switch these two around.

With that:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

