Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC043089A3
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 16:00:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78210.142186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5VFg-0005Ss-TK; Fri, 29 Jan 2021 15:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78210.142186; Fri, 29 Jan 2021 15:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5VFg-0005SS-PM; Fri, 29 Jan 2021 15:00:00 +0000
Received: by outflank-mailman (input) for mailman id 78210;
 Fri, 29 Jan 2021 14:59:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CEfz=HA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l5VFf-0005SI-Cl
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 14:59:59 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 321f947a-c05d-4cf6-aa56-a88db38081c4;
 Fri, 29 Jan 2021 14:59:58 +0000 (UTC)
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
X-Inumbo-ID: 321f947a-c05d-4cf6-aa56-a88db38081c4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611932398;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=0vIziKBIjxeJajCNJYHzMspgZhSLADHkF3q5ann3Klk=;
  b=asx6Y1HgVz28nlpTJ5Xhc9Lgxq/qKo3IGNrwqf+GuT3SQMkw/X3wFeWN
   WePs1sOXP9YTutlr6DpHDAzTSNOu00Ii7fZxEtYH9hnA9amZy64XfM+ic
   y+ggc0l9oL46kjTfYxWZLJsbZhM2TLKXl7ppmzzxGH4jLjDWkpvmG5Sdd
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: d9dd/Jx8lIoEvjJ6m3nFy5I7utbrERfaRFKFjqYEeqsUmtSzhEDLo2mAm4hDBWrtnWxiYYP8yM
 w4VrH71Yd73I2dOHq3BrlkBfTg4pIr3SaCD5DpT8BoAg/BiysmG8NR4jzKgay2iIyRHEm9v0rl
 rpjuVitytSqqj/4lrUIZ/5bO9Lu7kSMWxXQXuBmWB7eELf+TePyUGRnpaL3ghHoss897/Dhckg
 R00G8NkONdXQiSIuDBeJvyPHyYFZCMsuI8O/1jAczB3+Tmyz3HEPrrzRByxmlI/CEz78UhLQZX
 4Ls=
X-SBRS: 5.2
X-MesageID: 36196402
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,385,1602561600"; 
   d="scan'208";a="36196402"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IDjOmnLK9xst7DVDW/wGXXZILB9txnuZOH1H0q60ALTyKhDpZ7slOOemu5A8a8RoiRqGnb2M46l6mLSgl6G9ISjiwqZ7Ib8T0QuXy97PCe0QnpcXX4Y6R8uzSufzdUpQT6XIWEizDA5dGv7r6QoFEKMc8W7k3y2T0TvZWbQT9C4zkpaxNs6Uz57JhMhDb9PclvZ3khXoB5B43hXsfGWaf75yM0eR8FZ6v5ffflPP7h4jA7g8xu3NInwejJSQE+LRJeIi9AZKQuCOoo/64BOURm+5UMA1KMmQta0gA/d4DbZsclhlCJkQkWvGQdWxK2gxxs4MR+uKpO4xORqJokFumw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sAOJx6bSqG3W+eYF/HmUOyJbIhZ1d6sNKdhQs57yGQ=;
 b=Ec5AquIbiuHxJYWCQnp49kI7J/Kya6MDIimv5VOsPK/Ydf55MffVixxs6kGFJGKHLTIFAj1PFPh0Q6fL26Umtb4DzEZyb8/sLVAMSNeo5bqNXu/3lfLDVWgodtyTl1N5+nORK2sPGrinBSj0Iaor6pG8RWcqd8RFGp7Gs+dmpKsdg2nzX6ZW4rSHqfOItvSsgzwSle0BloGUegs7mYATFhssM0Lya/0azy6mZEYBwS8ymwh1WRkkQAShpmRb6ANRX1NqrpNLPb/fAW234r7i7+KlcehPe0Cb+DQN/Rgcoo2KchaWlRg6ut/tOspI0daHtb00HcM7b9e8FQpzydThCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sAOJx6bSqG3W+eYF/HmUOyJbIhZ1d6sNKdhQs57yGQ=;
 b=B7CH94cMhML2jWY4ob9JUSYIIFwAa23s+ih8TOMBBLfKeN5KS5vkvoAqq8oa0Nv6t790C2onB5oHrMAIoETkgpcpZLmQb4jV74Cxq4wXkaIzupqrJKg+n4CQvSRSupI2FQjc+ThivZW+3YJ3DpwaUKCvAU6bTFsawpSBVubufTo=
Date: Fri, 29 Jan 2021 15:59:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, Juergen Gross <jgross@suse.com>, Ian Jackson
	<iwj@xenproject.org>, Micha? Leszczy?ski <michal.leszczynski@cert.pl>, Hubert
 Jasudowicz <hubert.jasudowicz@cert.pl>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v4] tools/foreignmem: Support querying the size of a
 resource
Message-ID: <YBQi5IAUK47GvTmG@Air-de-Roger>
References: <20210128120152.9908-1-andrew.cooper3@citrix.com>
 <20210129103843.GC2015@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210129103843.GC2015@antioche.eu.org>
X-ClientProxiedBy: MR2P264CA0119.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2409611a-1de2-4330-0f6a-08d8c466888d
X-MS-TrafficTypeDiagnostic: DS7PR03MB5542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5542C168C0E2B76F7FDE2AD08FB99@DS7PR03MB5542.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /AxWuIsZ882/2npZ26C2JDzL2+spfMobvN4EF7m/LTeEmL2R16+uFEEhotufuOLtdnb0BaMLWs4AN3X0wCvhbzF0k46B1S7UdHn/IToDYPzmip75OXiPt+C5zLlkTU9OEiY468ZYdvI1YJf6pa35FuEoyv05kaG/c+s6/xTp+Yw33oOhb6S6tcUStzCrD/jwgSCdzitWnlaJgQKmqVNpCj3yF/N56HWYcJcW3qW9+hSuBrr+fbb954VeVYzm3tSIvhX1DWm27BYQGTXFfxSXkCejuYE+iJ62UE70JbsUHMfoM0yNscyee4cwzcCKEDdK2rv3HbLZT2kafn78ZhUKhNcQVMz0nIzXpu9OfJLXADcyxnzxJyhYA6tvLnuSNX43eST+W7MSuTVjsi/tt5aVDxMUZ9Wuw50WK9CY8b+Gu4isE+DcgnX7vU1OBlsQYaGpu4NrsGuDNQEVsJtHjS7dddt9A2+T2ChqYL9yW/sqpeOs2i6e2ulYYqFjALKwk84e/AEMDml6fkadcqthqfBAfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(6486002)(186003)(83380400001)(66476007)(16526019)(66946007)(6496006)(26005)(8936002)(5660300002)(54906003)(86362001)(9686003)(956004)(4326008)(8676002)(478600001)(66556008)(6666004)(6916009)(316002)(85182001)(2906002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YWMzQmptNGxzUGVjeWtzMDJPNkVORHI3OXFHWktMK1dMc1kzd2djb0l1N1RG?=
 =?utf-8?B?STlLWW5FTC9rZ3E4NjV5N3BvRFVzaENRZkMvaWF2cWRDck5vMXM4UXFDWm5x?=
 =?utf-8?B?ZmxINTg4NDBUVVZ4TGFocWh3MmtmaEdKMGZTK3ZPaU9UTU16c0tJbXE5N1hq?=
 =?utf-8?B?QzlZQ0F4akMvVkpFTy9LZzdYZmxBZUFzUEg1NkFVRlJ0eXVmWVplU0hPczlu?=
 =?utf-8?B?aTVZd3MrS2NxTmJqd05nSFNxeFZ3dWZDZ20yTzByN0tUMTdZanh2SnVEWkdP?=
 =?utf-8?B?Q1ZiaGtzSkZ3UDZMUTBjVVEzVjcyb01uaWY4TC9nRmtyY09QVldwQkoyWERr?=
 =?utf-8?B?d3VXTWQyRWY4aXE0QjFYOGlGaldLcGh1TTYwcEFmenBadXRMdjJsblVueGxL?=
 =?utf-8?B?L1U1Y0NUcEN3K2NmRlNFQ25qMDhPM2ZXc3Z6U2pVNFVOT29DLzNNYU1aZlVF?=
 =?utf-8?B?eDQyR2ZFbzFkK3kyRndtQUplNmdDTmxlNzA1NXpXODFra3dUZ2pHeWNmbE1j?=
 =?utf-8?B?cVErT090bkZvYTNKeHlPenIxK3lVcU5sUGY3ZjVadUN5WlYxUHpUelE0WG1i?=
 =?utf-8?B?UmtNdk14d1BZVTZmTW4raWpyRUo1MzZvaDBSVGNLemlWK1FxUmhxeWNDRFFQ?=
 =?utf-8?B?Z2xxd2hWWXNidWpiaVp5VDVkL0JDWXFXZndnaG92dlFXWDhjRlpZTjdwUVdi?=
 =?utf-8?B?TkVRSGxDUTJNWlNCZVN0c3VZdHlNd1RienVEaEQ5clp4dzMzRG9FNWxnQUk4?=
 =?utf-8?B?RVJBOUxBUm9IUG5FZXRZUHViMmFXQ2ZvaFk5RUtrZkVjQmRMYzdtUjBRZlVG?=
 =?utf-8?B?MnRseGlNRzcybnBDUU1PQURxWC9tMTVZeUp1dkYxb1MyRHppYWREcjRVQm8z?=
 =?utf-8?B?SHcxall5OFFmWXg0c3VzblQ1K3Mza1lZZzJOdzRLTDJPYnJqdTZsY1Q3TmV0?=
 =?utf-8?B?UGxDeGZHeFJEajgrRE9peHI2QWRsdHVDSzZpWkIvRkdEQUh3YyszRTVCY1Bu?=
 =?utf-8?B?OHZvNDlrOUMwWjl4VUtweHFJQUptSGxDOGcxRW1qQnBJWkl4blhSQjJTdklw?=
 =?utf-8?B?N3FJN1VrZlhzc3E1SEVhL2VQaEl5aDBrV1FmSjNTbjFtWnFhQk1uQ3ZSKzZ0?=
 =?utf-8?B?Wmh5bEM4TVRrRmI4V3NPN09HRVNzcDhTc3hyK0hZVUE0eTVZU3poWVBzNVFS?=
 =?utf-8?B?bVlwQ2JBWkxUNkhqbGg3cUpKMmtPa29rTC8yM3V2NXIrSXEvY2FQcklqemxE?=
 =?utf-8?B?czh2UHgyRFF6dGJxSjBrTHFVcTg0YTZtdjVwK1I0YlRIWDd6QjRPNnpMTnRo?=
 =?utf-8?B?aGRON3RISmtWRWxIeEFMdnNnbG45QkVYRTF2dzFnd05DUE8vTmp2T2RGQy9m?=
 =?utf-8?B?Z1ppMTl5STFoUHJjcWVndXpRcWVVMm1JbjVkUElPellwQ2pJRUg0MGlJL1VP?=
 =?utf-8?B?V0NuVFZJOUhFNnBLcmh2OHAyMUlKaGpEM2VacUdBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2409611a-1de2-4330-0f6a-08d8c466888d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 14:59:53.2844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7m8JH/FeFxq30tt7ronBc5jCiNxdFf2wmUxEag95zDvZKkNe1ebPf0pFkurg9vIKZI3Du6XE3wnhSD8648q0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5542
X-OriginatorOrg: citrix.com

On Fri, Jan 29, 2021 at 11:38:43AM +0100, Manuel Bouyer wrote:
> On Thu, Jan 28, 2021 at 12:01:52PM +0000, Andrew Cooper wrote:
> > With the Xen side of this interface (soon to be) fixed to return real sizes,
> > userspace needs to be able to make the query.
> > 
> > Introduce xenforeignmemory_resource_size() for the purpose, bumping the
> > library minor version.
> > 
> > Update both all osdep_xenforeignmemory_map_resource() implementations to
> > understand size requests, skip the mmap() operation, and copy back the
> > nr_frames field.
> > 
> > For NetBSD, also fix up the ioctl() error path to issue an unmap(), which was
> > overlooked by c/s 4a64e2bb39 "libs/foreignmemory: Implement on NetBSD".
> > [....]
> > diff --git a/tools/libs/foreignmemory/netbsd.c b/tools/libs/foreignmemory/netbsd.c
> > index d26566f601..4ae60aafdd 100644
> > --- a/tools/libs/foreignmemory/netbsd.c
> > +++ b/tools/libs/foreignmemory/netbsd.c
> > @@ -132,6 +132,10 @@ int osdep_xenforeignmemory_map_resource(
> >      };
> >      int rc;
> >  
> > +    if ( !fres->addr && !fres->nr_frames )
> > +        /* Request for resource size.  Skip mmap(). */
> > +        goto skip_mmap;
> > +
> >      fres->addr = mmap(fres->addr, fres->nr_frames << PAGE_SHIFT,
> >                        fres->prot, fres->flags | MAP_ANON | MAP_SHARED, -1, 0);
> 
> What happens if fres->addr is not NULL and nr_frames is 0 ?

mmap would return MAP_FAILED and errno == EINVAL in that case AFAICT
on Linux and FreeBSD. NetBSD mmap man page doesn't seem to mention
what happens in that case, so the comments below apply to Linux and
FreeBSD. Maybe we need to handle this differently for NetBSD?

> Is it supposed to happen ?

I think that's fine. Calling osdep_xenforeignmemory_map_resource with
nr_frames == 0 is pointing to a bug in the caller, so returning error
should be fine.

> Should we assert that fres->addr is NULL when
> nr_frames is 0 ? Or force fres->addr to NULL when nr_frames is 0 ?

Doesn't really matter, mmap will return EINVAL if nr_frames == 0
regardless of the value of addr.

Roger.

