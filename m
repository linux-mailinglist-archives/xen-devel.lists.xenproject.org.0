Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC493151E5
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 15:47:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83269.154509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9UHj-0002ov-78; Tue, 09 Feb 2021 14:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83269.154509; Tue, 09 Feb 2021 14:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9UHj-0002oY-3T; Tue, 09 Feb 2021 14:46:35 +0000
Received: by outflank-mailman (input) for mailman id 83269;
 Tue, 09 Feb 2021 14:46:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t2YR=HL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l9UHh-0002oT-Rc
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 14:46:34 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b0c44be-62fa-4ff4-9a73-cd4607e9519d;
 Tue, 09 Feb 2021 14:46:32 +0000 (UTC)
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
X-Inumbo-ID: 5b0c44be-62fa-4ff4-9a73-cd4607e9519d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612881992;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Jm2uM7sN1mhPr4RqlZCT/1dIpuyWA++MFK5EczqTNJA=;
  b=QiC2LtmTz12nui25cvC5MfOQy2caETTk7CjO8CvT+IgEM9W6ISgIj16L
   rYeibf6iRFBh2hTSpJTdFehMXjIw+l2jwxFFhiad41kVn7z7cjqsbiKU/
   BtFLZnR06kEne7KgKAoZV7QxnNr/ukXE1AsvhpR9rMZIntA4TydoikMIc
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Z/IkgMkbGJyUBjpCsHMCB1dwmcn3cZvER17v5iFt5iBvfDBLokq9tmO1lvutTOOt33rv0cgtS1
 GuwN/ckoTHiHFt5xvh4YcM/nhEODcKWINCpwunbs4Nno7ig9MTPdi74OXnbPI7HyZbznqxaHhL
 N/j6ukVKKErIRoLnRtKKIpY8sik4AGpI8ESYgMG/lViBuhmgUga/JWeSmln6wGmgCONR9I+L5D
 JrPn+SXEW/0bQFreZyrtMuNTnwfg96x10uWRaTDb56mUt47dowhg2QbEzR0wgq7BHZy4lW3rmP
 IwU=
X-SBRS: 5.2
X-MesageID: 37238681
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,165,1610427600"; 
   d="scan'208";a="37238681"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFITXuqlTYYMKdF+JMvQMBazPDE8W7us8f7E3FN3ufLlxacYVMcROytOotxceQhIXcJiRSw5OTuTHaZoSyyIva39JY5LYmrwcdYU4y7dPmPgxv4tSVStcVuLC2iixEmIcVmuecyllUQlNUPHCDvkJNgNXJ6bCUxS2tERYm3jbrDCr2E3Rws9wTpnaatdKWAaOamuMciVxArjGsSvu/MK1f2+vJBqyx8OcdIJHZlXdBv3oquXpXV+ZhezMauysbG4doUM5Ew8dX1Lf17/ndI5DysZQu/BKwvPpyRFSA69Qczp3WTnDgtR1RqRprc2fxRXH4A4tSASaozcisinUJ7Whw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9JIbKaduRGh1ym21FJE8LohQOTAqkO2V2Kr77hsM3Q=;
 b=i0MIdeXXF3NNRlWzULcdrNHZ54QkorOtKn8PAoJDBCwraWRQmU/VLJL6tddWcQnv+FllHsCetCZg/nIFOdqV4aHYt5Lgd7CfU6b4v9hL3A16Tmo01nzWpB5dbTG/6ErhUzJRLW6UNnvFGM6UMX8XBtJFWacMoJZfy7p5IbPTB3TXDBVUoBEGxz9m8zUM1AHtqUltLBmK993B3dhk/xPjt2IeVjcXfkWd7zgtkyV5Db/T5ukzAh1qcWR9T2r1Duo5NvzhKZUesJHD2sWcLUw6UpLqo26Nl5wjWfiCF2uoSpeqaZuWNFRLNR4+KIZC+mrhfaUxZY40Oe1xr7Rv/RndHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9JIbKaduRGh1ym21FJE8LohQOTAqkO2V2Kr77hsM3Q=;
 b=O4h8jw2d4qSwoRrSWght1CevYqeAylAiXcDUhePHHSejw3dpp45Tz1QGXA36HiAnMA36QsnrqzAbRyGk8sZNCQAqayJYdRFdDrt4yGqxUhCLe1wgQVjSy/3G47kRVXRs0l6cm53Yf+rACfJVCQG+3wQdWEPpLF/rgVamq19SVi4=
Date: Tue, 9 Feb 2021 15:46:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Tim Deegan
	<tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 02/17] x86: split __{get,put}_user() into "guest" and
 "unsafe" variants
Message-ID: <YCKgPro1yTtSSnLQ@Air-de-Roger>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
 <13d1d621-21db-0e59-6603-2b22b6a9d180@suse.com>
 <YB1nhBeMRVGyO8Fk@Air-de-Roger>
 <d23dc40c-3b37-ade2-f987-4f79b06901b1@suse.com>
 <YB1v60CuOdhxFwNy@Air-de-Roger>
 <199d2681-9704-8804-d3c3-d8ad24fca137@suse.com>
 <YCKJLbaTzD6YF/g5@Air-de-Roger>
 <1cf476b9-4ac1-9a12-7fdb-c898f02532f7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1cf476b9-4ac1-9a12-7fdb-c898f02532f7@suse.com>
X-ClientProxiedBy: MRXP264CA0037.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8ed9210-97a2-4669-9c26-08d8cd097b2a
X-MS-TrafficTypeDiagnostic: DM6PR03MB5324:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB53249EECEBD4EFAB1AE6A5D88F8E9@DM6PR03MB5324.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fSd26OrX2KJtPKnmSP2+44k0q7OPWFXyy5XMgimA1pepf9ypqPKZry3UmzUtU7C7C6zop+gg/IZfk98J1mS2YYtirefO8VxynEsrIUNyi2BRnL3nI6GYhi0wr+/98pZFaIU/4tj0bA9aecgQ84ITN7O2oGt2Xn10eZGU9F0eV5suHYOZg4LMH8wijEPToPS3ysKmx2lCwtzEBqnzhHqTw9Lspx2vJShoKOkLicWsHD4qwZPGv2s5F1czXX64UvTYhULibunfICriwHq7jslBL+GrrsCONgZXrhNbQDRG4yOdwxQ69sM1pNpuIL+yKYj8UzPH36mH9L6D4D8SN9yWBv8Vi4XIwbyaiv/PHDRW2pjszo6dA9UMs/pfLRh2mjev2TfC1QQ51H3L8C09z5gN1PJuB0hwtYhbgqtSP2ZOfckYBGCmBHjCvxgthRwwaGRTvd2IascaWpInQOtwyJ+zD0cy0HiyZRbIpbGqicHns0THLQSn3VMHzWDvOr+rB2QC2Y6WwJc94Qrq5ZHSxNR5uQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(366004)(136003)(346002)(396003)(39860400002)(186003)(16526019)(5660300002)(107886003)(85182001)(26005)(6666004)(2906002)(956004)(83380400001)(9686003)(316002)(8936002)(66946007)(4326008)(8676002)(478600001)(6486002)(53546011)(66556008)(66476007)(54906003)(6496006)(6916009)(33716001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eGpNcU56WTRVVTgxQnNTTVdKalNLWkppSVBEc2lUS0tzYi9xMTYzaUVNZlpw?=
 =?utf-8?B?bjFxYnFVTk42T2FMVHBsbUJwZjJmRXdoaWhBVzVNM1E5LzJKRVFVd1lQV2hP?=
 =?utf-8?B?YVVhR1YrRE9vcFp4U1laeTZsREJ2YkEvMERWeTJSQ1RGVTVnd3NOWEZmdXFL?=
 =?utf-8?B?eGRzUFNQN1FmS0J5RzNma00zV0JEMlFKOEZoTlp4RUQyancySlJVWTFpYStU?=
 =?utf-8?B?YXJRVndtcWNKb2hOc0pzN2lTNExKNUlUaXh5cDVDT0hXV21iWjQ3VDFFVVBa?=
 =?utf-8?B?cDVWQjY1K0loQlBycytVR1FXVjF2WFArTUVpOFFnaSs3UVdnejZyRVZZNmc3?=
 =?utf-8?B?bXlmWDc2ZnczVnlramt3NVE5T0RCYXRtbnFualEzTG01cGl1YkhvcmpMVFR1?=
 =?utf-8?B?dGtkdTE4RGRoNzZpdTk0YklHZ1B3aWJFcGhiYUFpRlJTQzR0aUNnWG80c0Zw?=
 =?utf-8?B?NW9SZ0xLNXg0bk9EUUlpekZ3akNZVXM0cmVZcWdFVHJ4ZGc4ak84NEtQU3B0?=
 =?utf-8?B?VW4rOHNFOGdFTEp2aFZxMkpmWU44L1RIWGc0R0lwVG9xdnVDU1NRT1IwSUhZ?=
 =?utf-8?B?QUtYeElZS3JQa2NmcG8rdzVhSGVEWkdUbmNiNEhmV2pCZzU4aExwaUV1NGtr?=
 =?utf-8?B?dnNYSUtNdk1LVUNTSDYrWHhZVkRva29VZjZ4VzdVWi95NmIydDFyNnpVNUJk?=
 =?utf-8?B?bytDOEtTUURnazg2VEwySTlrTnByYjNyRkc4Yk91M3RWdDN1cS9HTjF5T3N3?=
 =?utf-8?B?VFFQMlUwclpFbW1GKzUrVklybUpTdGtFRXZadlgyb01vaTF3NFpEVTZQcXky?=
 =?utf-8?B?cmk1OGZyQ0FwL2VxeTFlVDZ0cGp4U0RhTWhOT1dNcDVOYUlJUGphc1l6KzVY?=
 =?utf-8?B?dktGRXlTTW5ab3J2eXdRVlJlZHVncDc2a1QrbTd0bUh1NHBBS256N2NPaWp5?=
 =?utf-8?B?M1N0Qm5ROFNDa3FSK0RtaVRpRjJibG5FVnNlNTJ5eUVuNGJUbHhmOXhoRXRH?=
 =?utf-8?B?QVNjNmxVTHFpYVRYd2NpUDJZbTJRN0djNk8yWFhERkhkUVJRanNobG9EeW00?=
 =?utf-8?B?M254UVFlRytMWWRWeFNhNGxMQTNoWFI2T3lhYkxBOVF5TCtqUzhCZzJkQzFj?=
 =?utf-8?B?c2pKLzZCUG84cWNxSzlId3ZwRjRmUm85UDNydk0wU2s0eVFQTUYxOHBadDR1?=
 =?utf-8?B?QlE4N0N2S2c2NmFFY3IxN09PRGRiQTZWRS82UFRmVk5yTm9teHhHVjRhTUpM?=
 =?utf-8?B?QWhSYktQbnp5and0eGhFbk9KRElMcnpUWFRTRTNOZlRmZDdxWlpka21lOEl1?=
 =?utf-8?B?dkF4SkxlbDlkRU9mNTVmbEtOZGdJbVBiOVBJYkZDdElrNGZzQ0RXb3dvZXlS?=
 =?utf-8?B?UUxhUlBCSEpnL0krMXh2NFp3VXlGU2RkcGhBZlcwUDJONW02eUhtRW9ueXVq?=
 =?utf-8?B?NGxwM3NhWERETUN1VmRxeE5hZ2gzbWZTek1TVmR2M29XRHRJYW9hZFhJTGl5?=
 =?utf-8?B?dmozeC93Y3BKY2JPWXBsQm9DUmZvWE9KQ3pGY0xBdWREY1Bic1BNa1RYbUNG?=
 =?utf-8?B?M21XcmVlYmttZXhXdkg4NkJDMCs0YkdraytlT1ZDUjRMNkEvYWpDTVFIWVFD?=
 =?utf-8?B?U3ZFQU5sMHU3dHJvbExoTDIrZmJuUzRlcWxaVXl0dm5RZHkzVXJJWlY2ZFUr?=
 =?utf-8?B?Y3YwWng3dm84R2Nrc3NOT0FOb2gxc1h6Wnh6Sm9sbzdJNTZwQWRHNitMVlZS?=
 =?utf-8?Q?r2nlbBHvtO2JWMxefUwublEeXXI7PJSgt9yU5co?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ed9210-97a2-4669-9c26-08d8cd097b2a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 14:46:28.0164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s6z8mi0g2raVNJfvLAjLCMwH4A6zjA0jXxit78VgXgrngW7kNJf6oj5NAt3zOsRe7pNWJOC/pHq4Hfi5NSaKPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5324
X-OriginatorOrg: citrix.com

On Tue, Feb 09, 2021 at 02:15:18PM +0100, Jan Beulich wrote:
> On 09.02.2021 14:07, Roger Pau Monné wrote:
> > On Fri, Feb 05, 2021 at 05:26:33PM +0100, Jan Beulich wrote:
> >> On 05.02.2021 17:18, Roger Pau Monné wrote:
> >>> On Fri, Feb 05, 2021 at 05:13:22PM +0100, Jan Beulich wrote:
> >>>> On 05.02.2021 16:43, Roger Pau Monné wrote:
> >>>>> On Thu, Jan 14, 2021 at 04:04:11PM +0100, Jan Beulich wrote:
> >>>>>> The "guest" variants are intended to work with (potentially) fully guest
> >>>>>> controlled addresses, while the "unsafe" variants are not.
> >>>>>
> >>>>> Just to clarify, both work against user addresses, but guest variants
> >>>>> need to be more careful because the guest provided address can also be
> >>>>> modified?
> >>>>>
> >>>>> I'm trying to understand the difference between "fully guest
> >>>>> controlled" and "guest controlled".
> >>>>
> >>>> Not exactly, not. "unsafe" means access to anything which may
> >>>> fault, guest controlled or not. do_invalid_op()'s reading of
> >>>> the insn stream is a good example - the faulting insn there
> >>>> isn't guest controlled at all, but we still want to be careful
> >>>> when trying to read these bytes, as we don't want to fully
> >>>> trust %rip there.
> > 
> > Oh, I see. It's possible that %rip points to an unmapped address
> > there, and we need to be careful when reading, even if the value of
> > %rip cannot be controlled by the guest and can legitimacy point to
> > Xen's address space.
> > 
> >>> Would it make sense to threat everything as 'guest' accesses for the
> >>> sake of not having this difference?
> >>
> >> That's what we've been doing until now. It is the purpose of
> >> this change to allow the two to behave differently.
> >>
> >>> I think having two accessors it's likely to cause confusion and could
> >>> possibly lead to the wrong one being used in unexpected contexts. Does
> >>> it add a too big performance penalty to always use the most
> >>> restrictive one?
> >>
> >> The problem is the most restrictive one is going to be too
> >> restrictive - we wouldn't be able to access Xen space anymore
> >> e.g. from the place pointed at above as example. This is
> >> because for guest accesses (but not for "unsafe" ones) we're
> >> going to divert them into non-canonical space (and hence make
> >> speculation impossible, as such an access would fault) if it
> >> would touch Xen space.
> > 
> > Yes, I understand now. I think it would have been helpful (for me) to
> > have the first sentence as:
> > 
> > The "guest" variants are intended to work with (potentially) fully guest
> > controlled addresses, while the "unsafe" variants are expected to be
> > used in order to access addresses not under the guest control, but
> > that could trigger faults anyway (like accessing the instruction
> > stream in do_invalid_op).
> 
> I can use some of this, but in particular "access addresses not
> under the guest control" isn't entirely correct. The question isn't
> whether there's a guest control aspect, but which part of the
> address space the addresses are in. See specifically x86/PV: use
> get_unsafe() instead of copy_from_unsafe()" for two pretty good
> examples. The address within the linear page tables are - in a
> way at least - still somewhat guest controlled, but we're
> deliberately accessing Xen virtual addresses there.

OK, could this be somehow added to the commit message then?

Maybe it would be better to have something like:

The "guest" variants are intended to work with addresses belonging to
the guest address space, while the "unsafe" variants should be used
for addresses that fall into the Xen address space.

I think it's important to list exactly how the distinction between the
guest/unsafe accessors is made, or else it's impossible to review that
the changes done here are correct.

Thanks, Roger.

