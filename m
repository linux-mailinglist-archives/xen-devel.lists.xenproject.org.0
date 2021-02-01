Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCC330A5FD
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 11:58:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79741.145187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6WuQ-0007F8-VD; Mon, 01 Feb 2021 10:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79741.145187; Mon, 01 Feb 2021 10:58:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6WuQ-0007Ej-Qu; Mon, 01 Feb 2021 10:58:18 +0000
Received: by outflank-mailman (input) for mailman id 79741;
 Mon, 01 Feb 2021 10:58:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dub/=HD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l6WuP-0007Ee-K6
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 10:58:17 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2705bdb0-0d13-4b60-8459-6b4e3d4d231c;
 Mon, 01 Feb 2021 10:58:16 +0000 (UTC)
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
X-Inumbo-ID: 2705bdb0-0d13-4b60-8459-6b4e3d4d231c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612177096;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=o6MWkZRtRYOmdsN4Tsm/RbazjW6wcOt7150x1hIVzS0=;
  b=NwaBh13NizkaCnJzGRtk+2f1FZ0ST1Mv7g2000PtMHYFGS3A65uFZKVI
   5QwBQp+yA6crIzyYeWJ52j6U5Vuxm7dHjpsf/0OXExbXygqysAmrbkWxU
   Ujaa268Jbmw3ew01MYRp2gGWicKv0v8+hrruPlUC8rHtlQ+cvYE0PuC0d
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qFxtAkRC31+P7ZLccMUmrj5x8zx8ROM/ZPJFu4pDjoksPZeHCou41bsBpOzfF7CTbkh1ErjjNu
 rhXhP/83RmOmRA17AuBuysUQgCcoyXaY+xRAMr4LIOhxALnFfO2K00tWEKbiUg5uJhR0aIHPmM
 jivjss0Ofi+huHnxaIos9+9AKJn7dAexWqL0RwWvtwj1Ekz1DmgGz/UTFW+NcdWt6wb110cU12
 1AOI81wMzyYPtFtbKtZISRKzrwi2cBVFRdJhH82Yqdtu4PGnXr/oJctyCF+BkbhvM3d7NH2PXz
 6Y8=
X-SBRS: 5.2
X-MesageID: 36643667
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,392,1602561600"; 
   d="scan'208";a="36643667"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZqGsVxsWI7Md7OE+DU88PWiUa7sMPO1va9IfLlM6KWQyFicrcvdtl+Y+ZsLp1T7t6cVWdbMPPfjP/gOZn+u3C5jrhF14TpC5xF8rMIgS7Wu/pH54Z5oe4N+eAQ+agaVSdLp/qMUUwcOBGELbkJ7GjQ5t5/1A6/K2bEch5YoHA0JDSfxbFRtTUsg/CjCysKb2Sioup6AT+ehB0Fgc9IQKCIHVKadxb8EyOVzOXexBIUDjoKEhZD79dWA5Jhq403LfbyNN5oFau14MBPrPuFo5rgtGabCa4tM4QO5tFN5rnrNAEkbLHHjQUZdz5Q/+kfBzR+1O5UzUWYJk2fB8iHx89Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tmwUFa3fBUy2JhuCDIny6Or45RAXiZzSGL1MiipUu4=;
 b=RX4V2jjIsQajON9DvSYRbshrMwbDDvL9KoCgwVxMgBq/dq3h3D0ow6Sp0Q3Smop1wUnN1Xh+Y5KepUDtYz2OIElalrXsuxKB2/8TwmGS0oPFilFR+BWFoB2DRlpDnYA2UHIXEXSx8ZOLkiknYlrJ+XUlkaSU+hCuR0wz+nNXsyY8jCuis+u7UFG2/nejS7I+9E1AGMCGgLto++55SjrwedxjvwxB9SXx8emq1PSgtmlzSqgj0pJQBNh9U6w6mvoqA87Y6xRlKKkwYsj9bRdbu9F0sVU3RbVzl5qLdSrR9nj+hIaSTCxk53Avfv34tBx0h6PU66lXv38iDptC7B45DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tmwUFa3fBUy2JhuCDIny6Or45RAXiZzSGL1MiipUu4=;
 b=dFUGQnsOm5H1flF/N9GKshjvTGZstgcTRvJgDivV4gN3kmCwflJqZWDcrSFzl0RyTsZbHiYG2ir6CIwUl6diQk9qW/o3c+ZIlrIUzVy7hzGnyHg8EJ4NeJNoLzID3CQYr0Skt6vg4X/ALFprqawkUFEDsXoxRXfRO0UQhyc5vT0=
Date: Mon, 1 Feb 2021 11:58:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v3 2/2] Document qemu-ifup on NetBSD
Message-ID: <YBfevtNorE5OtQVR@Air-de-Roger>
References: <20210130230300.11664-1-bouyer@netbsd.org>
 <20210130230300.11664-2-bouyer@netbsd.org> <YBe6JpR6jOLvYDz6@Air-de-Roger>
 <20210201093747.GA624@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210201093747.GA624@antioche.eu.org>
X-ClientProxiedBy: MR2P264CA0125.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cac69d5e-cc15-4be4-345a-08d8c6a04436
X-MS-TrafficTypeDiagnostic: DM6PR03MB5340:
X-Microsoft-Antispam-PRVS: <DM6PR03MB53404C7397415F38C3799F788FB69@DM6PR03MB5340.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cPYXQ4ALVJ6L/Xf5ZSUfAchatQgCiDiano7d/Y9CQW9oL5an2jtUqLR07yngk8gLfQiBJdFlKvQkX0nldN/AW7TedQu0RKIATTywLxymPe5SWRynnazZ9A1XOUUDiOhPEp1BO9E8k06zaFPTln6VmmZBFzUexfYfPGSku4kTsYQI5CTpIA4097FCEgkthSp4cCI247pWRtpenWKf5j6rAur+yvm7JmrWOC+W5qghRQOtvH00abNfo14iGMDg/vyGZ/NyHLpNxRuNws14kb9tBgMXzPDSE8KyXhxLOjO2U0R+f++MvRPxfBut+GzFcB+bZmusti9w7WQgd44j5XtpqbTJ6Bmng2lSfj3SYFz4XjiAPj0NVQLbvppc2dgbr+/OqbcPlaUI6CQVnwCqkjnhTIRiAXk75fMrzT8pSVcM6PLUWa+u51isgeMxsx0Ov0E5MVRUd5YyQ68rG3hx55odt3MbDs+tIdHlPmlog5tzDv6lxfS5CRszRg24qId0tZGl4uobGYlxj3McjFJ45AlCpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(136003)(346002)(376002)(39860400002)(396003)(9686003)(66946007)(478600001)(6666004)(66476007)(316002)(54906003)(66556008)(85182001)(33716001)(6916009)(2906002)(6496006)(8936002)(5660300002)(4326008)(8676002)(26005)(6486002)(956004)(16526019)(86362001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a2RHOVZNcVVMVzAwcnZ3NVAvejFzREt2S3hrMWZsemhEWUo4RmpXcTQ1NWd6?=
 =?utf-8?B?czFUQjRkWktXQkhYV01wZVpWTzJIOWZzRERaSkZ5SytubytNY3R0QTM2R0Ur?=
 =?utf-8?B?WStsc0p2WWZneEVPSGFxRlJOcnBpdXhDdjNBRkY2NVJwdHJpZFc0RmhDaGJp?=
 =?utf-8?B?OGNtMkpkWGRaVFNJVkdQVS9sYktZWkdNQXNZN0hzem1xRHpaM1YwbERJOUJT?=
 =?utf-8?B?SGU3NHFCS29XL1loNncwUmk3MUswQ3k5NUx0STZTN0ZtM2tyRmZLZU1uQjZn?=
 =?utf-8?B?NXArL0dRb0Rvem9xYVBWbHozOXN2UTF4SnlXaXpVaWVoZE1XMXlFd2RjRHJw?=
 =?utf-8?B?V1lRczZwWGFtbjNkR2UyeFE3b05rYUxjZkNqKy9aZ1BxUFVabGh1VCt6Q1lQ?=
 =?utf-8?B?dnMvR3RlN1p5LzUxSEx5L2ZpVUFFVTRUWDl0MkFFWXZ0ZXRQMVM3VTlTMXVH?=
 =?utf-8?B?RjVNcUQ5NzlXa1JiRW12NGIrOStaNjRTSEtxenNKUE8wTUFLN3VCN3NaM01j?=
 =?utf-8?B?L0N3eHlQMDFUMFVyUUpXM2l6NVRIWmdrWHl6QlNtSXBUVG5ST3RoOTcxbTl0?=
 =?utf-8?B?eld1N0NaYk9kQzVUdW50S0FkS1F3NkM1VjV0d1J0Q1kzYUdJM3kzQzYybzhZ?=
 =?utf-8?B?dDB6MUlrRkNKVDB3UW5ESWhNekJhRGxPbW5OK0l3UzIwamNDVXhadXBpZTE5?=
 =?utf-8?B?WkdZRUJhYUVMWHZQVkxrc2ZVSnZTMUp5SHM3NStod3pMWTVZWHc2MWgvTElM?=
 =?utf-8?B?N01VVjhjR0hxOG1VQTdrdDBycUpxUHhsczJUYy9TTk4xa3dLUlJnRnl3L3ZD?=
 =?utf-8?B?VkZiSXZiUktucWtRYkVMbXdiVWxjcGRxTkF5Z1ZGN0pEbUZyMi93cTFyVTV4?=
 =?utf-8?B?bGx3Z1E0VGVtQTcrRTlKb0hYZmFCMnp0cEZpYU5rWEJtbUxqWnQyWlNnTkVU?=
 =?utf-8?B?WVZxS2dmLzArU2VNSnRMZERibWJlTU9UcFg4WFdMK1VIS2JIR3JNT3pqN0Nv?=
 =?utf-8?B?L3h2bVROelE1TThvaUhLRG8rSFVRaVUvRzZIZUFEb3AvM2Qrb1hhWlZXN0lR?=
 =?utf-8?B?c0MxdkplM0krQmttREs4ZTBEeXlDZStXRVV5bkhHdG1HUVR2L0tQTERvaE9q?=
 =?utf-8?B?NWFTb0JQOWpHSWhCUTY0VUtscTdrQWlhMVNJWnJhVTd4TkhjdVB3UkF4eEwr?=
 =?utf-8?B?ekVhc2ZzaUp1UW82R3dhT3VsVzhEbmJHS0xrSDlidGsveGVoaE42OWNVR05R?=
 =?utf-8?B?QXJjazdkRDE2eStUT08wemFZNEU5VzZiMmk1d3Q4Z2RaWmhMeGxIN1RuWFk0?=
 =?utf-8?B?aEZPMnhhTXd6UU1xcjNFc3BmYTcyQ2E0T3R3VFp3WVg3VzBFUDNVL3VWUUxz?=
 =?utf-8?B?QTJsRUJxVStSUFR5Mi9qZmJRRlRFVDVXRXB0RzY1NHVWM3JXeVJndnBVMkNQ?=
 =?utf-8?B?YVg2TlA0S2VubS9kd3o0UWwwODcrTU1NNG5qU2RRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cac69d5e-cc15-4be4-345a-08d8c6a04436
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 10:58:11.6705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IK26yxv9Z4PtmgSlaPnUYLHr91kN/5RVkjRZqNrv3QHgS8TpPQED320BewDzfusWhGXQhuZLR4IC9ISYEAo7ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5340
X-OriginatorOrg: citrix.com

On Mon, Feb 01, 2021 at 10:37:47AM +0100, Manuel Bouyer wrote:
> On Mon, Feb 01, 2021 at 09:21:58AM +0100, Roger Pau Monné wrote:
> > On Sun, Jan 31, 2021 at 12:03:00AM +0100, Manuel Bouyer wrote:
> > > Document that on NetBSD, the tap interface will be configured by the
> > > qemu-ifup script. Document the arguments, and XEN_DOMAIN_ID environnement
> > > variable.
> > 
> > You are missing a Signed-off-by tag here ;).
> > 
> > > ---
> > >  docs/man/xl-network-configuration.5.pod | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/docs/man/xl-network-configuration.5.pod b/docs/man/xl-network-configuration.5.pod
> > > index af058d4d3c..f6eb6c31fc 100644
> > > --- a/docs/man/xl-network-configuration.5.pod
> > > +++ b/docs/man/xl-network-configuration.5.pod
> > > @@ -172,6 +172,10 @@ add it to the relevant bridge). Defaults to
> > >  C<XEN_SCRIPT_DIR/vif-bridge> but can be set to any script. Some example
> > >  scripts are installed in C<XEN_SCRIPT_DIR>.
> > >  
> > > +On NetBSD, HVM guests will always use
> > > +C<XEN_SCRIPT_DIR/qemu-ifup> to configure the tap interface. The first argument
> > > +is the tap interface, the second is the bridge name. the environnement variable
> > > +C<XEN_DOMAIN_ID> contains the domU's ID.
> > 
> > LGTM, but I would make it even less technical and more user focused:
> > 
> > Note on NetBSD HVM guests will ignore the script option for tap
> > (emulated) interfaces and always use C<XEN_SCRIPT_DIR/qemu-ifup> to
> > configure the interface in bridged mode.
> 
> Well, as a user, I want to know how the scripts are called, so that I can
> tune them ...

Isn't that information on the header of the script? I would expect
users that want to modify such script will open it and then the header
should already lists the parameters.

IMO I would leave the parameters out of this document because we don't
list them for any other script, so it seems odd to list them for the
qemu-ifup script only.

Thanks, Roger.

