Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 418A62E71D5
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 16:32:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59978.105169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuGzC-0001jK-4a; Tue, 29 Dec 2020 15:32:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59978.105169; Tue, 29 Dec 2020 15:32:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuGzC-0001iu-0o; Tue, 29 Dec 2020 15:32:34 +0000
Received: by outflank-mailman (input) for mailman id 59978;
 Tue, 29 Dec 2020 15:32:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dLv=GB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuGzA-0001ip-PY
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 15:32:32 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3df0f0c7-734f-4154-a0d9-cff576767773;
 Tue, 29 Dec 2020 15:32:31 +0000 (UTC)
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
X-Inumbo-ID: 3df0f0c7-734f-4154-a0d9-cff576767773
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609255951;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=FMuoll8BSVwKpDlaL8B9r6hcYgx7oUDYdV2rNVFrE4I=;
  b=Z0YD5ABHWwvOAleuiRMcFIxB7O+4hKc50xxJjvTdqcF/++Ao462Qq9wm
   LVkB2f6wE6r7pgwts8INgTvfKUpBfEs2VqfFwVPvlh9MYXYabePrLMlrZ
   xFi29r/0X0iubJivwxU8MKWa1UbPSmpg5e/bmPXVBHM92/7dS8lpyChUx
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: g9FX22qBLyEC5ilwVQQmyNiYEvM4C/se4kg9wCDZEmH9WtwUdp4QKiHDc03MhVlnqko6cDI/BK
 yl4N/JI7tjKC1cm9HFYlxX58hH0CtW6FXde2Y43AEidRBg9DJljR4ikVWbuktMaQkE3obSM5PQ
 rdpB+FcMuS/+05XLpc/8d+Rl1Y511eDxdClBbv7laQmNvxnoFAm59prcX63ARvsbUtFrjjCOt0
 QUw3xDO0ZWQjMcyKGQZ49H6RIh90hhO6gbK5aTtSjOvjRjSqs4njcKy/nCwUbSYXJ/f1T9LtgI
 8vY=
X-SBRS: 5.2
X-MesageID: 35350412
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,458,1599537600"; 
   d="scan'208";a="35350412"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJHHEUOXeGw6kkkzrBcK771vRWr2PDaB2Pn5nMem+ZDxV+vn7bICoLyUnyP8jAzhsqx/AJ3OM8ydKmZktkjaEBR3rgWNnxhMw2GN0N/MK/AXzquYicDS59Dd8dFOOx5MbfKhhoevcXqGErN2xlRfkj8wfq2lVCUIO8dI9VAx0bQvEoM4ybwu8dgjLJatwv68FXYIOps57PG8tre2m2SrNA2ZOnTKpbr8U82DsTQVH48bCnWPrgSxTaveE/8cDBqXixFrWSpdp8KNPyDjkQO4643FXcW3QH/QVh23l8H3IpooYJJ7tGKjLvhuzclFqhTUp30Ks7Ma73YGiOGxkGa3cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8K+ftOiWQGwVTeOol0cK39c/UvBXihzSFlX0H+mOmc=;
 b=bl4y/WfNtJBnT2idffKBHTxb/DStZ5e32xvkSAF6+/ZQSUXJ5mh8igUb/socTHUF/eSL1o9UBwYjql9sxVB6Fn8KrF6PZVaK0n9iL5ulOFkcRaPRlvgga89yaBql8QSV3WPzCOlNWG1/KLJpLMqQFPawlD6KkmZylUtJw9P2VRzPxRiW3ftb7eclWaBfzfRk8/R5uTDBJ0mnRCb2K9QlThLdKbuN2NBuPMuTz1cH5bzAFX2t72CEZlsq69C7G4K9PIpI+3Acf6sqoSe1G1bnwNEpDB3OtRCUuDvnx5XK13LWQXRnpoXB390qh7/2Yx8aPSpLM8gnM3L4/M7FZ4vOzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8K+ftOiWQGwVTeOol0cK39c/UvBXihzSFlX0H+mOmc=;
 b=QTmQ7aEaWC1JxIkhgRA1g4ESGkK4dnIRAjgAhOjkYVxKZ4r6YVuGwS2Bimb9EsBVFgEdmDRMrZdYqKXFGqSUWR2FZTa+Hk4JI+Ri1fnDzNQW8vwPpA4m6devRdVG17FQi3OGcRV2JoH8RU/OxPPCzc6iffSyD1RvnBYNl7tswT4=
Date: Tue, 29 Dec 2020 16:32:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
CC: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Paul Durrant <paul@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>, Julien Grall <julien.grall@arm.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan
	<tim@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jun Nakajima <jun.nakajima@intel.com>, "Kevin
 Tian" <kevin.tian@intel.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Kaly Xin <Kaly.Xin@arm.com>, Artem Mygaiev <joculator@gmail.com>
Subject: Re:
Message-ID: <20201229153221.lnj2mzei3s5q5xzp@Air-de-Roger>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <87h7p6u860.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h7p6u860.fsf@linaro.org>
X-ClientProxiedBy: LO2P265CA0225.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bc396b5-d38e-49fa-0735-08d8ac0ef226
X-MS-TrafficTypeDiagnostic: DM6PR03MB4762:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4762323C9ED75A840D78446D8FD80@DM6PR03MB4762.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AzaJgmNC3peVwAebaqTfZrfdmS80HBRVn9nqoxnxhY4JBUlt+h3+54bncStqCukSRgD4q5BsfhtEhevNNk80x7rU3FgZGVTAPFDTfo1pKyMpyhCz00JcosV+17Ov6ggQUee2xDmTWt//aGy6U1/x7ZKXioZSubsRw5K/T5Zcpg00XQABFaCOqLOh4AMQmAaqniT9duKqiHuSzURu47l3j1xz/42PGjBX3slHisI+BAXiy/6IQV+Gz8q7sLx2ItBCkTntFoln5RUDmFLQGRj4+zzLuqUyJ8ztERLQbq74IXIaWNdhSeF9NHngcq7GEEFnr6/5ELfinrE2cUndFcwsVeytr9zhsxzbxmoSSyxgYabMs1ggtTWjXMdwYacSiEP9xlj2wDskS5FfjEI+X9hJUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(396003)(346002)(39860400002)(376002)(136003)(186003)(86362001)(53546011)(956004)(54906003)(6486002)(9686003)(66574015)(6916009)(7416002)(6666004)(8676002)(83380400001)(66476007)(16526019)(1076003)(5660300002)(66556008)(4326008)(478600001)(85182001)(66946007)(26005)(2906002)(7116003)(6496006)(3480700007)(33716001)(316002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Wlo0clgyNXByMXhaUjBhNmVYR2IwL3V3dFMzdHh3RE9wS1I4U29zWXNQS0Ni?=
 =?utf-8?B?NUJ1UjFBN2o2NzExZytERTRFeVVWYk1NNVg1dWZaRjdhb3Iwc1o2YllmbUdB?=
 =?utf-8?B?MFdab2F0Z2liVm9DZHFDaFJSWDU3dktoSGIvaDVPVWlHbGcyQzUvVVVLQkdB?=
 =?utf-8?B?b2tLazJWWHFBMjliTnMxeUhleWJjdmRWTmI3Q1NsNU9GTlBqRTlXd1piNFg3?=
 =?utf-8?B?YnZWS0l6VUVJblBFTWtyOWZlVUg3cUZYVEMrZkVNdnpwSGhZYzJLQ2NtQ0U4?=
 =?utf-8?B?WCtrcTZuKytMYU15OHg4WWtheGh1aVdzVDNlTHlHMkZGL3U1ajVDeGlCeHRr?=
 =?utf-8?B?WkViRTRUcGFQbDczbkloY0JXemJlMXJabm5mQ2RTa2I2RENlMlRiVjgycDdr?=
 =?utf-8?B?QUZRWmFXMnB4akx0LzFSS2lNOTB1OFJTSmRPSkpMZU5rOXFqZmNLb2JJbUpn?=
 =?utf-8?B?alh2TERROXQzbWVnWHFDY1ZDbFJCQ21lbGRqOEhRckJaWE1lZTVqTnpKRkdF?=
 =?utf-8?B?eW5ESWtMM1hYQmUzbFlyUkRVK3pkUUhlYVA2Q0ZBUEZmZFNkNXJ2Mkhaek1Z?=
 =?utf-8?B?SEVSU3A2TXZOVzB0SzZ4R3Z2TkViQWoySlZ4MmlJZmQ3dHoxOGdZdmlXWEFE?=
 =?utf-8?B?cUE5VDBGUG4xUW5udklXbG1YdktLVUpmTmZyd1R4cnZtODZidktleURMeStu?=
 =?utf-8?B?U2pLbE1LS0tqV0cwTjhHdjI5Mm81YVZ5RU9nTG1SWXJvZGRINHNrSXRhWFVq?=
 =?utf-8?B?RjVrSzRKRy9MWDlaVDdGaDJXZVNLV0ZLSnVkNElIb2ZVVTFPMkduUGg5SVNZ?=
 =?utf-8?B?cDhFTm1WeVFrbWVSMzVxOEhqOTdxV0doU2l4MW0vSjhFUUNwUEtBWlgrTXJT?=
 =?utf-8?B?a21IUkJiaklZcWtOR1o4VVZqa25RNmdiOWhTL1NuUTRENGV0V21UV0ZUWjFG?=
 =?utf-8?B?Z29NQlJkejJ4cGlydTdvQ2lnVDYram1vWlI3Q0poWlkxYWJRN3NCcUFRellK?=
 =?utf-8?B?UXUwbWM3bGYyeFYrWXpQMjFNZzdKcUVQZW1BUXN5RHlINzdxc3BKekQwTUtq?=
 =?utf-8?B?eHhoeFAwOGhNdjcvYTJFTDY4UHhIZE41b3BCbENDSnZ2OU1GK1FqeDNnN1FQ?=
 =?utf-8?B?SG5Id0F0YTZVOFQ5U1ZNQ1JCTkNHTHFTOGV2S1VIbUg1L1M5QWlLanhieWd4?=
 =?utf-8?B?cHM1dlFuNm03aUZ6NTA5L0JEekRCaVo3bmhMaTE0VUNPN3dadnJuTGcxaGVK?=
 =?utf-8?B?cERsbDJGMmdRSU5jMTRVQ1h5ZzhLYUpzV2R5UFdtZGxudGZFRXY5Z2FKclcz?=
 =?utf-8?Q?BpKEuMdl3Q9dsbd+XHcqEwkNXgrP2k73Oy?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 15:32:26.3689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bc396b5-d38e-49fa-0735-08d8ac0ef226
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8JMlIZ30BfRI39oK2DfIlxibaP0g5seAD/5JCm0Hy1e10l9vWBWrFR24INE6+hydpdN22tlfOz2j7kz7IVD39g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4762
X-OriginatorOrg: citrix.com

On Mon, Nov 30, 2020 at 04:21:59PM +0000, Alex Bennée wrote:
> 
> Oleksandr Tyshchenko <olekstysh@gmail.com> writes:
> 
> > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >
> >
> > Date: Sat, 28 Nov 2020 22:33:51 +0200
> > Subject: [PATCH V3 00/23] IOREQ feature (+ virtio-mmio) on Arm
> > MIME-Version: 1.0
> > Content-Type: text/plain; charset=UTF-8
> > Content-Transfer-Encoding: 8bit
> >
> > Hello all.
> >
> > The purpose of this patch series is to add IOREQ/DM support to Xen on Arm.
> > You can find an initial discussion at [1] and RFC/V1/V2 series at [2]/[3]/[4].
> > Xen on Arm requires some implementation to forward guest MMIO access to a device
> > model in order to implement virtio-mmio backend or even mediator outside of hypervisor.
> > As Xen on x86 already contains required support this series tries to make it common
> > and introduce Arm specific bits plus some new functionality. Patch series is based on
> > Julien's PoC "xen/arm: Add support for Guest IO forwarding to a device emulator".
> > Besides splitting existing IOREQ/DM support and introducing Arm side, the series
> > also includes virtio-mmio related changes (last 2 patches for toolstack)
> > for the reviewers to be able to see how the whole picture could look
> > like.
> 
> Thanks for posting the latest version.
> 
> >
> > According to the initial discussion there are a few open questions/concerns
> > regarding security, performance in VirtIO solution:
> > 1. virtio-mmio vs virtio-pci, SPI vs MSI, different use-cases require different
> >    transport...
> 
> I think I'm repeating things here I've said in various ephemeral video
> chats over the last few weeks but I should probably put things down on
> the record.
> 
> I think the original intention of the virtio framers is advanced
> features would build on virtio-pci because you get a bunch of things
> "for free" - notably enumeration and MSI support. There is assumption
> that by the time you add these features to virtio-mmio you end up
> re-creating your own less well tested version of virtio-pci. I've not
> been terribly convinced by the argument that the guest implementation of
> PCI presents a sufficiently large blob of code to make the simpler MMIO
> desirable. My attempts to build two virtio kernels (PCI/MMIO) with
> otherwise the same devices wasn't terribly conclusive either way.
> 
> That said virtio-mmio still has life in it because the cloudy slimmed
> down guests moved to using it because the enumeration of PCI is a road
> block to their fast boot up requirements. I'm sure they would also
> appreciate a MSI implementation to reduce the overhead that handling
> notifications currently has on trap-and-emulate.
> 
> AIUI for Xen the other downside to PCI is you would have to emulate it
> in the hypervisor which would be additional code at the most privileged
> level.

Xen already emulates (or maybe it would be better to say decodes) PCI
accesses on the hypervisor and forwards them to the appropriate device
model using the IOREQ interface, so that's not something new. It's
not really emulating the PCI config space, but just detecting accesses
and forwarding them to the device model that should handle them.

You can register different emulators in user space that handle
accesses to different PCI devices from a guest.

Thanks, Roger.

