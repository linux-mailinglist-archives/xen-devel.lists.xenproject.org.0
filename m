Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7FC2E6F47
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 10:18:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59748.104764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuB8Q-0006th-93; Tue, 29 Dec 2020 09:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59748.104764; Tue, 29 Dec 2020 09:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuB8Q-0006tH-5h; Tue, 29 Dec 2020 09:17:42 +0000
Received: by outflank-mailman (input) for mailman id 59748;
 Tue, 29 Dec 2020 09:17:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dLv=GB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuB8P-0006tC-2n
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 09:17:41 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d346378-60a4-4b2e-a002-bb66af96831c;
 Tue, 29 Dec 2020 09:17:39 +0000 (UTC)
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
X-Inumbo-ID: 7d346378-60a4-4b2e-a002-bb66af96831c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609233458;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=AJ6qCA6cbn+7lBbf20jFfVh9QHi2PbXf4y4dY20QiZo=;
  b=cpj+GqoTRC+GsxQvG7TX4mNXKxX+o9YMiPNueY7JoiiqwLnQ3us+voTg
   1Ypqo517dw3jCmWbhDulMjNaEmn19WSy0L8RPtqhP0asOkVQVQIqDxieX
   qEZjzbPJGF4ZmR8DEe/T0gVMX1rsNElBtj156K3UZGBbLt3m0J916nKOT
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Idcq7RGp/4yq7/YwbY9pR4ahURZtjzZ+QoalFVxOIK4LY8XO+efF+p7x9qWozayIarOIszCnPo
 uI7oDDe2EWHTB6UeAR8ee8XjjKXkbLuSuy8dmgGLPU+TGHlKfFhzadeaWWl14twaUtHA2LMdn4
 SJ/XcmUS4/CPy94mMblY7ez0uc2k7eUG1m9a0FlfOLk3ZoEnqX9lP3cDJRioJKXp4Ol/F+SgIM
 2vrXuXgxatAwZXgVmCKos2weEUfeigGV6qfaSVc+Q6i7U5q1yI4PbYPXttuGiqqyFZE8vLCdjH
 oDQ=
X-SBRS: 5.2
X-MesageID: 34078283
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,457,1599537600"; 
   d="scan'208";a="34078283"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e6tpnHNUVg8qLxK+69j3td7eEAWzpCR4pqeaM2JLpOR4poux9Xcf8Rz0PxboNLosSZx448opQn6HRaqJhADj42z/JBJi8gqr6z3XxYNtp8fGDq2ozbZehSPsEuB41iUCLgEqPc7ebBuBivA5MYhoY0SOB6I4zaQ+TCP/8XhkB5OSv4gBL0iMhi1qtf3Apx1RyLGg6lnbCTyfrabfw0/AwZdQ98lDCk6Rsp1kzMLJQwTWoXaA1p3yvk7TCnjFfpy/pLYq0/uM6pSvvWnZlYqCnMyaoLl1BXkVlnaFkGsg4maylHvar7BlsdpoBeBphHyFaI8lMsMByN5O06y+0KNevQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4hUbVbLbTkcs7vt7aA8JcC4oozDWj6I4QSUU+RX7zV4=;
 b=lySHj4TuBkc/fsQYS1fJEIVIGCC8n6cRsExDgVh63eNjBgz3q162P0j6im8GqHSfyX+cXACpdhL04nmBz69ygvot366lmqVkZRjC8YzPlgkTUu7EMhFtW5nmKz+9dKKY61oy17lOZvp4tgOa0uvq2JDVi5pBQLebytcalP2eMwLY5bLjkGmYVh3z8TnJmEnoiOkBPGC7j1nwD6iCctfrop/kj7+mD5MKtMpOIRuHZbOW8OU/uc5n5Gu4KKpJ1Zv1pceP/uvAQtUZzTZSMUoge0MFvGWOQdS2/SQLwjKhHsLyPYoo0Zw33s1uGYqmi9d++L6VMKcbm2QW2Z7YXLm4Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4hUbVbLbTkcs7vt7aA8JcC4oozDWj6I4QSUU+RX7zV4=;
 b=E/xiOMPTMwh0C4ALl4oiz2qEb7zeesMiHuemt63lOl0gLyrCtgV/JeNJsRbHFnvqg4Kh656Mmv/INe98jvFub2rM2dikm9/26p3if6Yuv1jWUjwL0WoYLYSYmtZDYEsptmSuMpw1yEJrxyvNTBabxqn86WpDXxcwyjBJ7Qc+o7E=
Date: Tue, 29 Dec 2020 10:17:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Rich Persaud <persaur@gmail.com>
CC: Jean-Philippe Ouellet <jpo@vt.edu>, Christopher Clark
	<christopher.w.clark@gmail.com>, openxt <openxt@googlegroups.com>,
	<xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Julien Grall <jgrall@amazon.com>, James McKenzie <james@bromium.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>
Subject: Re: [openxt-dev] VirtIO-Argo initial development proposal
Message-ID: <20201229091730.owgpdeekb7pcex7t@Air-de-Roger>
References: <DBCC8190-7228-483E-AE8A-09880B28F516@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DBCC8190-7228-483E-AE8A-09880B28F516@gmail.com>
X-ClientProxiedBy: LO2P265CA0440.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05a938b9-4165-4555-c912-08d8abda9421
X-MS-TrafficTypeDiagnostic: DM6PR03MB4298:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4298C6C666FE3FF4E9E6E0F78FD80@DM6PR03MB4298.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8ZPoHqq7+fS3DxBJa/59LJDt3PhGoUeA3xUp4yhAaqeTRhCamgaLaFfCwFfumurqbQSTQyW/wzcA+5XTs0+Eya9Q/nlUDMRkwkeOUO0P0VRKthlNavIPoU2mgUQ++dOJFtRWG2g1Sm0IelY5jyi02GFP/m8h2U2dmhb0akevGiYixeaLt6EcDtPDkU2UmHoza2K0UhB97+5DQDsoiAP6Wgug2cgKL7diKwuQ2A8flWw1AomYWgHsS8jdY/zBC6z/smnH7sKLIj8g/2J+HwtFkiMwYCFX1J+/qXPz/wLmf5Qgn3K7uvmTda+vP11GsfXl8igPGpcl2EWS9MSVh7W5wsuT6SsijP1ppJuyWLSyAQhTt8WUFrdLvmsCbv5AiyeRpjXiyRQqvpHasvkxXLGxurAkTgJtS9Tt8yrAgnQ4Y4U4OX98PJLaeOjPVOun09nK/CAOIdYogr4dV17HB2Uc3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(396003)(346002)(376002)(366004)(136003)(186003)(966005)(26005)(9686003)(6486002)(6666004)(5660300002)(316002)(6496006)(8936002)(6916009)(86362001)(66556008)(4326008)(8676002)(956004)(54906003)(16526019)(1076003)(66476007)(478600001)(2906002)(66946007)(83380400001)(33716001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZjM3YlBXa1RacU1rdFBxVFZQKzdvQW9tcEkzZWx1eEdrVHlOeHFnNGVNR3ln?=
 =?utf-8?B?Rkp5cHd4bXdEV29Yb3BXaVNtcHNNNVhlaEVLRkFJZTh5SDJQSUVHY1J3cWdZ?=
 =?utf-8?B?YVhMWldEWFVkM0ZVVEUyUnN6Tlpqa1EzWnU2WHZTN3I4VEwxZHJIQVg2eDNq?=
 =?utf-8?B?bTV3NVVvUkROVTg0QUVwM3UwYU1aMkU4SWh6bktxQVRLeUljdk93b3dBV1FN?=
 =?utf-8?B?MDd6Mmorenp0NXdINGpDK1d0K016M0gzSTU1bDhScVJiSjJ4Zi9pODAvMEFS?=
 =?utf-8?B?cHpwZ2tHNTRQa2w4UEVGQ3FZdURxcVpPakpRc2cxeit0NlVOY3draVBkQ1V4?=
 =?utf-8?B?VjRxVVByNHdhMENydlA0U1d0d1IrV2pWdjlDYng5V21SMDBoZEtwYURNWUFB?=
 =?utf-8?B?ekJ3UnVWWlJZTFZwN01DbTR3SkNqdktBM2dHekhoQ3BLaWdtOCtmS2NxOHgz?=
 =?utf-8?B?N3dmc2tvNEFwbDBuS2x2VEdlNUcvZ05lZWRacktzRjZ6RThuSldtd01lT2Zy?=
 =?utf-8?B?QnBUY05SbHR6eENabFNWS1NETE1PcmNZSWVPQTQyR1hvZkZSUzU5U2J2cmh2?=
 =?utf-8?B?MEVmMnNxSnJBWmdtRlJYWUpiRUtVWTlGakdTUFk4MzhReHpyMEJETjJDZnRN?=
 =?utf-8?B?YktmZVN5cXF1ZGdNak1haWpsanlFSU4wdGIwTXhqVnhDMzdFRHFUeXdHMVZm?=
 =?utf-8?B?OXpDRW02RThRU2VjSDJWYVpWRytSRkJUbVhiN0oxcWtGaFBvSFg4NG5kdm5w?=
 =?utf-8?B?aWUvTDJyRUFGNXdEb2FOVG84RkF4cEZtaVgzRVhhZytaS3owUHNHaHFNRHBh?=
 =?utf-8?B?TlZlSHRpamV0cDE2Y3dpaE5Kd3lRZHVYRXNUaDhiOEVpc3RoaVRUa0J3Tjdv?=
 =?utf-8?B?T01hSmpJNUlYRWhQWWp4cHJRRG14K3JkUGJac29oeE8xNDkxanpzbnM4QWVk?=
 =?utf-8?B?M0MvUndadXZqZDl3cHIxdXJoR01IUVZlRitVM0FjL1JVWkdvYkZkT3RFSEtQ?=
 =?utf-8?B?S3RlOWVmOHdqRDE4ZlB2UW5jRHVrK1JaUXJ0d1NrQVc4cGkyTkh2ZVllSlZk?=
 =?utf-8?B?eEQrYUV4TlB6Zk1DZlAzbnFoN0RaRHoydS8xOWpjaU1JdCs0RXZvUDR6VHov?=
 =?utf-8?B?RjhQRzlNTnZEaXVrYXJGMzRJd1h4VFVhU0trTys0U2xLZG84T0NVNjIrUjFV?=
 =?utf-8?B?cSt1UHhXZGF6Z2xVRC94Z09LRE5SUFQreFJuSEtPbzZmQm9QVndJUjczaU1h?=
 =?utf-8?B?V1JYMnNYN3F6Mm5ZQ1RpMXJDd2IxTjlmcVhBU2dZc21DZjBEcXJlNW91bkRP?=
 =?utf-8?Q?8ZbSIUsW5d+v24OYvJXTxSeNlW1E0rF9oJ?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 09:17:34.7849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a938b9-4165-4555-c912-08d8abda9421
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZ2RjlPkb97k1ZRXAjwUy5GPXbTGb6/F7Ds9vy0ovl3W5CXMNHwOMsc/HkESUIKZrBJbBVH+4y+d46tW57a01w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4298
X-OriginatorOrg: citrix.com

On Wed, Dec 23, 2020 at 04:32:01PM -0500, Rich Persaud wrote:
> ﻿On Dec 17, 2020, at 07:13, Jean-Philippe Ouellet <jpo@vt.edu> wrote:
> > ﻿On Wed, Dec 16, 2020 at 2:37 PM Christopher Clark
> > <christopher.w.clark@gmail.com> wrote:
> >> Hi all,
> >> 
> >> I have written a page for the OpenXT wiki describing a proposal for
> >> initial development towards the VirtIO-Argo transport driver, and the
> >> related system components to support it, destined for OpenXT and
> >> upstream projects:
> >> 
> >> https://openxt.atlassian.net/wiki/spaces/~cclark/pages/1696169985/VirtIO-Argo+Development+Phase+1

Thanks for the detailed document, I've taken a look and there's indeed
a lot of work to do listed there :). I have some suggestion and
questions.

Overall I think it would be easier for VirtIO to take a new transport
if it's not tied to a specific hypervisor. The way Argo is implemented
right now is using hypercalls, which is a mechanism specific to Xen.
IMO it might be easier to start by having an Argo interface using
MSRs, that all hypervisors can implement, and then base the VirtIO
implementation on top of that interface. It could be presented as a
hypervisor agnostic mediated interface for inter-domain communication
or some such.

That kind of links to a question, has any of this been discussed with
the VirtIO folks, either at OASIS or the Linux kernel?

The document mentions: "Destination: mainline Linux kernel, via the
Xen community" regarding the upstreamability of the VirtIO-Argo
transport driver, but I think this would have to go through the VirtIO
maintainers and not the Xen ones, hence you might want their feedback
quite early to make sure they are OK with the approach taken, and in
turn this might also require OASIS to agree to have a new transport
documented.

> >> 
> >> Please review ahead of tomorrow's OpenXT Community Call.
> >> 
> >> I would draw your attention to the Comparison of Argo interface options section:
> >> 
> >> https://openxt.atlassian.net/wiki/spaces/~cclark/pages/1696169985/VirtIO-Argo+Development+Phase+1#Comparison-of-Argo-interface-options
> >> 
> >> where further input to the table would be valuable;
> >> and would also appreciate input on the IOREQ project section:
> >> 
> >> https://openxt.atlassian.net/wiki/spaces/~cclark/pages/1696169985/VirtIO-Argo+Development+Phase+1#Project:-IOREQ-for-VirtIO-Argo
> >> 
> >> in particular, whether an IOREQ implementation to support the
> >> provision of devices to the frontends can replace the need for any
> >> userspace software to interact with an Argo kernel interface for the
> >> VirtIO-Argo implementation.
> >> 
> >> thanks,
> >> Christopher
> > 
> > Hi,
> > 
> > Really excited to see this happening, and disappointed that I'm not
> > able to contribute at this time. I don't think I'll be able to join
> > the call, but wanted to share some initial thoughts from my
> > middle-of-the-night review anyway.
> > 
> > Super rough notes in raw unedited notes-to-self form:
> > 
> > main point of feedback is: I love the desire to get a non-shared-mem
> > transport backend for virtio standardized. It moves us closer to an
> > HMX-only world. BUT: virtio is relevant to many hypervisors beyond
> > Xen, not all of which have the same views on how policy enforcement
> > should be done, namely some have a preference for capability-oriented
> > models over type-enforcement / MAC models. It would be nice if any
> > labeling encoded into the actual specs / guest-boundary protocols
> > would be strictly a mechanism, and be policy-agnostic, in particular
> > not making implicit assumptions about XSM / SELinux / similar. I don't
> > have specific suggestions at this point, but would love to discuss.
> > 
> > thoughts on how to handle device enumeration? hotplug notifications?
> > - can't rely on xenstore
> > - need some internal argo messaging for this?
> > - name service w/ well-known names? starts to look like xenstore
> > pretty quickly...
> > - granular disaggregation of backend device-model providers desirable

I'm also curious about this part and I was assuming this would be
done using some kind of Argo messages, but there's no mention in the
document. Would be nice to elaborate a little more about this in the
document.

> > how does resource accounting work? each side pays for their own delivery ring?
> > - init in already-guest-mapped mem & simply register?
> > - how does it compare to grant tables?
> >  - do you need to go through linux driver to alloc (e.g. xengntalloc)
> > or has way to share arbitrary otherwise not-special userspace pages
> > (e.g. u2mfn, with all its issues (pinning, reloc, etc.))?
> > 
> > ioreq is tangled with grant refs, evt chans, generic vmexit
> > dispatcher, instruction decoder, etc. none of which seems desirable if
> > trying to move towards world with strictly safer guest interfaces
> > exposed (e.g. HMX-only)

I think this needs Christopher's clarification, but it's my
understanding that the Argo transport wouldn't need IOREQs at all,
since all data exchange would be done using the Argo interfaces, there
would be no MMIO emulation or anything similar. The mention about
IOREQs is because the Arm folks are working on using IOREQs in Arm to
enable virtio-mmio on Xen.

Fro my reading of the document, it seem Argo VirtIO would still rely
on event channels, it would IMO be better if instead interrupts are
delivered using a native mechanism, something like MSI delivery by
using a destination APIC ID, vector, delivery mode and trigger mode.

Roger.

