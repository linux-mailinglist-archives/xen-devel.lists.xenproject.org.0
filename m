Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5EF31B618
	for <lists+xen-devel@lfdr.de>; Mon, 15 Feb 2021 10:00:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85103.159566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBZkD-0001Jn-U7; Mon, 15 Feb 2021 09:00:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85103.159566; Mon, 15 Feb 2021 09:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBZkD-0001JO-QW; Mon, 15 Feb 2021 09:00:37 +0000
Received: by outflank-mailman (input) for mailman id 85103;
 Mon, 15 Feb 2021 09:00:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fYcZ=HR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lBZkB-0001JJ-MV
 for xen-devel@lists.xenproject.org; Mon, 15 Feb 2021 09:00:35 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 371702f4-140f-4a9b-8bdc-40c79731569b;
 Mon, 15 Feb 2021 09:00:34 +0000 (UTC)
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
X-Inumbo-ID: 371702f4-140f-4a9b-8bdc-40c79731569b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613379634;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=YtvlF13IrUo6q7IT8UHZ4QFT8ApPquBv0Ln2e2Sd5eY=;
  b=Lxu4Hfl6hENDEMy3syfpid4mH1a0QtHgrBpM65/g9ID7W6g7RXuY7fDD
   eRh6cjYfJnWjRmv5sVEzggMmviF3HWHUIP/DTqmhB9rG4rVm6UqMFnpYC
   ZKdGvNnqPqoPNW3m9a0ewCnYq1wNVCTbAG5tzyg3JZMsy6TUq/OVqJtPL
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Kz0FDnN74ipmbbRLVWAdsyGKWrbcL13JdKO9l895DUv5f/HKTdEPf/zXrjGpxrRgda5bEZiJUp
 UxpMZjInSjKYLMD/pY69lYs/ZH2hKJvw0jK0yrCjprJ7b6uXZIm5J4DbDa4xIcQmEyuJRaEjFr
 X4ftgsdLDaR/N7QiiJXVCWNlTH9Ok0EpmCHU11VCXFiZqwmU9xdRgOxwLUNtyiEpQqIjoUov4K
 31fACMFXP2tXNsqtvs+5aKBGeEW9rwPMlkS0iVhA0mjM1PmNopw0L7queliu5TVU27uSiIuo1v
 0v0=
X-SBRS: 5.2
X-MesageID: 37239783
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,180,1610427600"; 
   d="scan'208";a="37239783"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iv1oEYxpb3vD8PujlyCM50RQz2p1n1AxWvg+iOCbgI9XzzDv9KjEmwJdRnAT6mG8RgNHpXkHpaA6GJOjgCpE4Tea5CEfjs7Q84T5ypc4zEzBv1sdWzx0DcWtvZQ5PmkQbzI3FlvBXYVPGwEs7ZqRJApj2EtyKt+YiT2FbM/wmkmwHsuQCubw7Y+odKCzlHlsfjvdzYDRZeLEMkPL6zllRu3/HBQi1v+lD2eXqv3O+EqtvoHkmmGjyRRrgueQywt0Tj0/qAFK9CW+8DayrnrCG0CXI1Tb7MB6EfzM1MmhlNsCl9ZH3uGiNdRUZCV35Pu0+CwF4ta/7HROVk+ACfYN+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7A+SDUPTUJPa7Mxd4brTfMtyHyQijV0QKoLVGPD+R+M=;
 b=ZU+kUphZlQtr58n5De6uPtqMCjT7QauY/qJ7V2F9dHGkjyQl1Ely7k0EUy0VGHGhVZ83vRvjoqx+tr+rzFJxOSzsmIjPAXNHZap0XeOY4nibtDw+0M1qHvzJk0yeuKaGWsaQYE+vNkWlIWhyK1WaSOO8cmBY8AV47DcaNeeLBELO0AXTr7cv/g4yn/mmPyJLQoSz1wBqTnyTtKT9KrujLRkelaGAIVpj/fuIj+nw1XRIoBB69F/Gu0XKV4+v9nycltDbhqQ4mRbvsot3wAA9IDcIe2pw8eGT4kl1//8PoqC3COxVoVH7PV2tcvknOV9x+ErULv89XZz86XuszLckFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7A+SDUPTUJPa7Mxd4brTfMtyHyQijV0QKoLVGPD+R+M=;
 b=St1B1MN2l4dMSrcuUymhCtjJ0gbS+T7Xn+NSWqsFOZOPfO8HZBAy1lSTd24UciuKJHXKzAIDtWNXmXJYLgp9ToPn7VwO2iYPbEbDzjlMGNBUIF8S9HNQiYCkCvHsNe7XL0j65RaEJihVuth4+X7JfdVpeK51U5l9QCKGlPTXqVg=
Date: Mon, 15 Feb 2021 10:00:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
CC: Maximilian Engelhardt <maxi@daemonizer.de>,
	<xen-devel@lists.xenproject.org>, <pkg-xen-devel@lists.alioth.debian.org>
Subject: Re: [BUG] Linux pvh vm not getting destroyed on shutdown
Message-ID: <YCo4J2DPtecdfIir@Air-de-Roger>
References: <2195346.r5JaYcbZso@localhost> <YCgYxOxXwitkFB0T@mattapan.m5p.com>
 <22128555.Kfurr2TIWe@localhost> <YCnqMh+YB2ZDsMUl@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YCnqMh+YB2ZDsMUl@mattapan.m5p.com>
X-ClientProxiedBy: MR2P264CA0055.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06e20d8b-aed2-4ad6-2ca5-08d8d190250c
X-MS-TrafficTypeDiagnostic: DM6PR03MB5179:
X-Microsoft-Antispam-PRVS: <DM6PR03MB5179F90873B1FDB8B9D36A7A8F889@DM6PR03MB5179.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t2fW6GgXg8mydHUzbdTDLrN0DxpctIoGfp9Y8YeQeMo3DdnY9tVlunQwKLRJTUuL2RW02c1q9nks8QLwDOw3RntfhXU0HL+6bftbK+h5QJ5tjRC0tPDVXId935sFviKG1w7OuW4jrId01E2PzMbGLHPLVT/uTyhr0WzGt9FCTOSVosnHgnSALnxFrNWCj6Txwd6wwxhuAzlU/WxP7kthWh3BQNRKxD8iVMLfUSEejsjQp68Z3zT8Tuis1x3ga5Ufr/ycjsI30N58JJrZUIixZunlG1bYGArbMYKkaVhsTDTrWbgsdB6C/t86uP2aopNbAovYXrweGGAMOTuOzWBYeQwAjhA8KAcJks7tP916BfMj7sk5NVFgW0jvJP9l1uVml2t39zyMllh6NdASFJBrzMf5vfl8o/VKOeK5u5RPblwjQfG6+GDEush4ZDyft0ew1kXA6e33IMMWuY50fq4F7wvk1opPnAsSyrzNkdnMc0d80eN5a1kAE9v9GWx2KNCq8ZU9LOL++QaJULKNBsNEwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(136003)(366004)(396003)(39850400004)(346002)(66476007)(8936002)(5660300002)(66556008)(66946007)(33716001)(83380400001)(85182001)(8676002)(16526019)(26005)(9686003)(4326008)(6666004)(956004)(86362001)(186003)(6486002)(2906002)(316002)(6496006)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VS9sZm81Q0FJZUhvdjVZZ3VsL25TVW4zMWhldzM2V3JZVTZJT29WdlNoZlNH?=
 =?utf-8?B?V2hPVXR2WmFhY3U5bVI5a2pNNEhveGhSRVp1UXkvSkszYTRXZnJDRmZobHps?=
 =?utf-8?B?c2RuSFBqd3IxMG1IVnBPaHpFcjh2cUNvUDVsdXhMdlNKZERac3BlZVZaSEZD?=
 =?utf-8?B?dUl4TjRNeXA3NHFTYkwwYXdoWkhmQkhCaDZYOWpGMHUwaG4xclpNcEdxY1dH?=
 =?utf-8?B?ZGJGMWFnTDZ2Vkhxd1pRaFJtck8wZWFNbE5pMmFxZzkvQk5sSW1mMDMvK2cv?=
 =?utf-8?B?SmZjTjVMdDRyTUpjU21XL1ludG42TnY2WlVaT28rOS9kUEIwYmZaMkxYbXBF?=
 =?utf-8?B?bUdBZEJQYmZpY1RWMjQ4T3NRMkJlTGFXVjJuSzNyY3Y5QnorS28yQVkySDZR?=
 =?utf-8?B?T3lpUXhGSHNTTGZqWk9XTE1TRlh5ZjBRVnh1dS9vQnNUMjJVdW9rMllUQ01k?=
 =?utf-8?B?OGtyS2NOUlhSVDVFUU94QzlYUUhLVWVCQnAwYVN1UHU5YzVUc2k3cUZaSDBP?=
 =?utf-8?B?WlQxM29WazNoUXpndnpaTEkyYVlXLzN0NDhsNmZqMEc1Q21pVlNWUENaT01E?=
 =?utf-8?B?aGlxZkhDZEd3TlVwaEkwbHl2bnVtZjMxRFVYU3hpYWJCem4wbjYyZzI0Mk1X?=
 =?utf-8?B?Z0dmVlFTVmtCT1g4T05KUWE0Zmp5THB4Q2FSekZ4M3A5dVFMZjliUHhTOGZ4?=
 =?utf-8?B?U0NMbUJyVExuNG1UNmJXeDlOdkdjMGdlQnEvWWVoOE1acFoyMlJpeHJCQXRy?=
 =?utf-8?B?WmhaMDNaQzNLNHdnejZiamhaUG1NZTcyd0p5RUFhUldHcVJsVXp6MjdGd29Y?=
 =?utf-8?B?ZThZMjR4VS9vTDBJUW5hclFyNUFTM3Nmd2VzZm9xY0xaNENBNmY3alpkOVJ5?=
 =?utf-8?B?TlljbjhWOHh1cWRzWnQrbDZhdVFXZVZ3UEhNbTdmeCtKRlZMajUvN3FkQzd0?=
 =?utf-8?B?WURCQTR2MVVUV20rNmRjN2FZM2pUMXhGKzNBTUJpZGVDUEhDZFRvcE1qL0l2?=
 =?utf-8?B?WURadHJBMFFCQzFHWk1DVkxlV0pIQUVneDJWazNDTmFTQnZJTm42bVZLZXl1?=
 =?utf-8?B?QzZSemVsVHRVb011NXVnVE5jQWdHaUU3V0ZhZjZ0bVZ1UkVzdnU0OWVTRDFx?=
 =?utf-8?B?Q0gzcjc1UDUyQk9PMG5ITUlqYjVIOERwOTIvbGlZREtRdzRGUk13TExEcWt4?=
 =?utf-8?B?TGx6QmFkdGFjZWxqKzJGRkV4eHIxNkcvR1daNXlBdlVBeWFjaDQzWXZWdWl5?=
 =?utf-8?B?SlFLdWVUM1ZBQnZ3Zm9lU1psb3VDU2o3WnIwc2VtTXpwYUJ6Y3BkVkJXVHg2?=
 =?utf-8?B?NHo5clRyYzZoUmQ5bXlSZ1didW95eVNtWnR0UGNqQkJvRWtlWHZ3MHc2bW81?=
 =?utf-8?B?eG5WbldNWGVUOHU2ZSt0UWVhZHluck85N1ZtZWxueWJIbE9rcEpZSi9JVmYz?=
 =?utf-8?B?L2JqeUlWOVRWKzBvUmlJRnYzYU9kU1duK0o1YnJ3MUlBTERTVStRZlFrbDZq?=
 =?utf-8?B?dkdsR05BemJIZGFPdlh5TDNTSG5taE1lcE5YYnhLd2kzNVdWME5xQUM3OGtG?=
 =?utf-8?B?dU42T3pqb3YyQXZ6Y2lkYnhYWlRzZFZ5QmM4cEJPalUydHliZzR5aUpqeFVv?=
 =?utf-8?B?VExXRzh1ZEdVUUdMWUxUM3hJK2p6aEU0VDNkUDdBL2Y5MTZIdEFJWXNsdU9W?=
 =?utf-8?B?NEErZURlRjNsbnBrM0FNWDEySE1hTVQwR1hvU2p6RjdkczZ5eDZOdWxwbmds?=
 =?utf-8?Q?cnFYTLOioa3moEp9wj6DUxNkUBSlUl7TSI6wLIP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e20d8b-aed2-4ad6-2ca5-08d8d190250c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2021 09:00:30.2365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y1tLJIYoU3//8Is64d86ekgz0mgFMQEJCvrRHJmU9roO1I4MQHVMX+9gyRkzZX/XmCg24mgBWUPmkU2e4Htrkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5179
X-OriginatorOrg: citrix.com

On Sun, Feb 14, 2021 at 07:27:46PM -0800, Elliott Mitchell wrote:
> On Sun, Feb 14, 2021 at 11:45:47PM +0100, Maximilian Engelhardt wrote:
> > On Samstag, 13. Februar 2021 19:21:56 CET Elliott Mitchell wrote:
> > > On Sat, Feb 13, 2021 at 04:36:24PM +0100, Maximilian Engelhardt wrote:
> > > > * The issue started with Debian kernel 5.8.3+1~exp1 running in the vm,
> > > > Debian kernel 5.7.17-1 does not show the issue.
> > > 
> > > I think the first kernel update during which I saw the issue was around
> > > linux-image-4.19.0-12-amd64 or linux-image-4.19.0-13-amd64.  I think
> > > the last security update to the Xen packages was in a similar timeframe
> > > though.  Rate this portion as unreliable though.  I can definitely state
> > > this occurs with Debian's linux-image-4.19.0-13-amd64 and kernels built
> > > from corresponding source, this may have shown earlier.
> > 
> > We don't see any issues with the current Debian buster (Debian stable) kernel 
> > (4.19.0-14-amd64 #1 SMP Debian 4.19.171-2 (2021-01-30) x86_64 GNU/Linux) and 
> > also did not notice any issues with the older kernel packages in buster. Also 
> > the security update of xen in buster did not cause any behavior change for us. 
> > In our case everything in buster is working as we expect it to work (using 
> > latest updates and security updates).
> 
> I can't really say much here.  I keep up to date and I cannot point to a
> key ingredient as the one which caused this breakage.
> 
> 
> > > Fresh observation.  During a similar timeframe I started noticing VM
> > > creation leaving a `xl create` process behind.  I had discovered this
> > > process could be freely killed without appearing to effect the VM and had
> > > thus been doing so (memory in a lean Dom0 is precious).
> > > 
> > > While typing this I realized there was another scenario I needed to try.
> > > Turns out if I boot PV GRUB and get to its command-line (press 'c'), then
> > > get away from the VM console, kill the `xl create` process, return to
> > > the console and type "halt".  This results in a hung VM.
> > > 
> > > Are you perhaps either killing the `xl create` process for effected VMs,
> > > or migrating the VM and thus splitting the `xl create` process from the
> > > effected VMs?
> > > 
> > > This seems more a Debian issue than a Xen Project issue right now.
> > 
> > We don't migrate the vms, we don't kill any processes running on the dom0 and 
> > I don't see anything in our logs indicating something gets killed on the dom0. 
> > On our systems the running 'xl create' processes only use very little memory.
> > 
> > Have you tried if you still observer your hangs if you don't kill the xl 
> > processes?
> 
> That is exactly what I pointed to above.  On stable killing the
> mysterious left behind `xl create` process causes the problem to
> manifest, while leaving it undisturbed appears to makes the problem not
> manifest.

You cannot kill the 'xl create' process, or else events for the domain
(like shutdown) won't be handled by the toolstack, and thus the domain
won't be destroyed when the guest shuts down. The same would happen if
the guest ties to reboot, it won't work properly because the reboot
request won't be handled by the toolstack as you have just killed the
xl process that's in charge of doing it.

Roger.

