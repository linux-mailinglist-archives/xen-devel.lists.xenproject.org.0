Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E213056BA
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 10:21:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75856.136708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4h1B-0004nL-Jm; Wed, 27 Jan 2021 09:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75856.136708; Wed, 27 Jan 2021 09:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4h1B-0004mw-GT; Wed, 27 Jan 2021 09:21:41 +0000
Received: by outflank-mailman (input) for mailman id 75856;
 Wed, 27 Jan 2021 09:21:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Xld=G6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l4h1A-0004mq-FJ
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 09:21:40 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43305748-b64f-4a37-bd8d-3b1d10d9172a;
 Wed, 27 Jan 2021 09:21:39 +0000 (UTC)
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
X-Inumbo-ID: 43305748-b64f-4a37-bd8d-3b1d10d9172a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611739298;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=QYe0WL0wYgr18r+UTO0+2LzCypqxtQEssUn2i9FG6AU=;
  b=aJEYZvTkuFrV9amlejcRexNIuOKp66o3n63A1Tx0fxQT0szH2Jj/v+55
   61nsVaXdABOiO/dtngNaS22F/kk7VSMXHATAwJvGX7/NcP088DyMNoaEN
   7g7WwRp/tkZ4L/uzBG59DLzEzKQ0pV3I1gVSJeFAE6XTHd6lxBo4r5L7n
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ASrrKvq9f07i+3Dy8XzJkYDL0h7hcQ4H1WtqRM7hrVZ7KALCu8+Sjv9sbIhlkG5RmrvJhsBp/G
 PIsiiQryPQc6+2h5mQ9PIzM62oqOhHdVJxKGbAaemFHw4wFErJby/xN7SiMCQoPmE7Vs4i6b41
 TzKveqNAJkkJKnZ4Tv+lMhU+vTLD92kk5mOB9KeEKuDYpgJZV4ywsR2/F8usGlLCsWJ3PzJ62n
 PuSpj1ivDEFWOtkxhlMM5WBOHEZLnf9hH/XqUXOA02SJ2LMiA91/hIwlglZPVbJ/kKEGmqhw5c
 OeQ=
X-SBRS: 5.2
X-MesageID: 36147751
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,378,1602561600"; 
   d="scan'208";a="36147751"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXcfxMx7PjNeFi8eunFz6QK3MkxDvhny6dJpkrwkMvSPjalE3Hbw3unPpdZVSwoe/UbggBl1BKtHx/0GzBrcGBv7rO33LcCzhC0uH40+bl2u7h0Jz76bL47iwAgX6PpnII7gX9B1Gu0eql4LEnM3QUqiKcr795C0Apwvw3jrZ06iNIeIBBDx4x+j30wK9aXQfTaJimjHVOoZv5Pa88Z0Mg+dzQSHvapGnH109jj0wm6UCN1FVTV6bv7clb0vOqOBZWNc/2brGtUFUTCvB2p0M65KcF61wUVMyQTgMo4tTexXzikZglbhzHwRzLSJqtTfPv/V9Gtjxz64A2CDOJF+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJFLVXrzh51xs6M57WFMzfYS+J4wnad27iXTxQ/rp4w=;
 b=I9c2k7MHByaXPtgMdIr0SkGZlX1OJ9XyjxzlfYQWKNbzMyd5JXT15/WYl4mcHqXtdmjqO5NlX8x85dSePD07zdsgK8SbgBfNS36aCKeR06gdZnQf/YsRsu3CxKx/TtBXas9cBjz0fSkr0CsoYSLkUSlqEnkqmeQSS5rbwin3vO2kiIs9drZOZ3zicVAMHkqF7Sn9T7xK6YzQUUanZXcpSEfmHu4w6Fcpbf5aQt/qejLmwjDDK5JCdmzAT1pOltXGxXowgC8+ryStGJdatJCIVoDB/PnUGaWWgzI5c/zorTMXcf3uXFgsDWrG2ivEssO55FIdj2FK0/EzadwhvutLZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJFLVXrzh51xs6M57WFMzfYS+J4wnad27iXTxQ/rp4w=;
 b=n3fKJbXhie0yXgEFZ0DJwDy+i8l9IY07O56sPGskObWDjkWYUWSzUj4Eyo3Xj96m3OjldRFMymox2C8rdx+MWhQhOXlsbww2Zw2f5rcZ9h7jlRNxyBuclGyDyj/IpboO3XFpmFhJyLzx21bp+4LsLFINhN+5p+3gE9kawwnTqwo=
Date: Wed, 27 Jan 2021 10:21:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Kevin
 Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 0/6] x86/intr: HVM guest interrupt handling
 fixes/cleanup
Message-ID: <20210127092128.ewxisdhvs53f2t7w@Air-de-Roger>
References: <20210126134521.25784-1-roger.pau@citrix.com>
 <f5d10743-676e-d723-6d3a-32b9c8b4d4fd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f5d10743-676e-d723-6d3a-32b9c8b4d4fd@suse.com>
X-ClientProxiedBy: PR0P264CA0085.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28cb28ed-2977-427b-22e5-08d8c2a4f161
X-MS-TrafficTypeDiagnostic: DS7PR03MB5590:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5590E0E0FBA6476DE5DDB7AE8FBB9@DS7PR03MB5590.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MjR92EUANgdhm8dsSUQqKTM92No16aQc4cJrvrjo0aaLvVUSUeBsnczftSwDDpfbMpYD0ztfmLgk87I+qdyVrxuFr80LR5dPXCskAaI25wA1Sq3HQ1aEWuUYmlxFNNB5uQQVoE9HkouOSdlMYprcdfomvgykyGPRrByuGclC0mRz1CJFcdLplwzpm4ssCVNsHP1x91ONbRN04LH1wiRPy+KoM0zceXOucZpGRms4Ka1GnnkEt9Q25Bj6V+uuECrmMx9zzOKsL1DWnseDPHEbRTbnbw2ud725z07kn/UaudC8sAN9JZ/9LqZVlAxDiKU4DznB0ketrzREd01eP5tlhZFFHQVgXLtBfz2ie5AtagBnlyyJX2t//5cxXwlE5tnXe5SRFBaYgFtgKpZlNtgGOjhk7+XuMh8vnQndFe6/5U6nSIlh1zw1Qvm8yETMp/VIvxgI7tPcrVY404o2L+1UYSi80QLGMdKPKXybiHRytbCBhs9s96R4Yh+wR4/QpMma4qqTPheohFSlMtzJ9MIkSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(136003)(376002)(39860400002)(396003)(366004)(66946007)(9686003)(6496006)(53546011)(478600001)(110136005)(26005)(8676002)(54906003)(1076003)(66556008)(8936002)(6486002)(2906002)(6666004)(33716001)(16526019)(5660300002)(186003)(86362001)(83380400001)(85182001)(66476007)(316002)(956004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bE9nR0gvWXdXZGh2Mkd0RUpOcGxsZ3ExNHM3KzYwWStMUTZOMWZXbU5HSEg1?=
 =?utf-8?B?TzY1YzRNQS9KY1NVNitsdnBKcllxeUUzaXEyL3BjWnlkLzQyL0hJMlZPV1Zw?=
 =?utf-8?B?VnRlQ0tXY1hLL0t3c1BsOUtrRWdsL2NOVFhDdVArY3ZLR0NqWWNDK0plUjJU?=
 =?utf-8?B?d2QzdzlxbDlTb3BCVmk3NHVoeXdUWGRucU1wdmpZTE1FZWFRejY5d3VTNHov?=
 =?utf-8?B?Y0FscW9PcVlvSDU0OEcwcUg5U3dERVpndkFzbGRPZWhDRDR2d3dUNlk0WU1j?=
 =?utf-8?B?NHdXSnBrN05XekRua1lOOUpVTWNxaDA0dkZSdGlmeHRNcjBHcGE0Rmhieml5?=
 =?utf-8?B?eThlQXVQbGpoQVVHSnRVcmhQLzlGaGREeWdDUHpRNEQya2VTekxONWg4dnpa?=
 =?utf-8?B?SjFTZEJLWXdVT2JaVmtncDhndGxYSUZkakdvcFVBeU5aNUxqWkNNV2tIWXlL?=
 =?utf-8?B?U2YyWVlXRWw4cCtkVUJ3a3Q0ZCtTRVIzaUE2UEt5eGlPYmJRMWlwdlRzaXk5?=
 =?utf-8?B?ZzkwOHMxTlBFaWtaUTlrdTVvZE5DRWhYZm96bFVTS21HT0J6M0h2SWVSeW16?=
 =?utf-8?B?Q2UzMCt3VjA3K3VHRnZlQ1JIb3lSWDNIODJ5Z09Tck5GWURNNkwrRDB6cHZQ?=
 =?utf-8?B?ajBXcksxYVJnQkdvYXRPTGdiVWxVQjIrU290SkRPY2RLTGRVTU1nNDBYK3c1?=
 =?utf-8?B?eHVVaDRkb0dYQmg1SWJpbEFEKyttQWhoUk9pNDZBbW02WFI1WlhaTngxMVE5?=
 =?utf-8?B?ei9tNUx0WVJYR3BVNlREejF5WFlmMEx1TmtNWjlxbytJQm1xcmwzYnRDYVpH?=
 =?utf-8?B?cW1nNzlGbVlDTisyTXhJQ2UzL1Baa09ITWNrVDJpYkZLYnpRM3o1Z0tEU0dE?=
 =?utf-8?B?b1BEWHZJL0laaHZTZVJpVlJIalpsQW9Dc1RGZyttdHcxN2xiQjd1SllLRjhV?=
 =?utf-8?B?bk1OWlM4Q3NjQ3kzSFRzTkJ1OE1zNEVWMHFJZTBEL2QzalMvQUJ0TGJYTXR5?=
 =?utf-8?B?ZFo5RTI2YnVvZGtqMUIxVVRiKzdhbkl3Y1NaR0QwMjZkOFRBRFJDSG00S2g0?=
 =?utf-8?B?M0dSM0dJaC9DNnhlNjdmcFFhUGlZVVl0a0EyZ2lPRVNvN3J5cytLQzZPOGta?=
 =?utf-8?B?dVpadlF2NElJUlFCMzI2ZmdBNjBpZFljenl3TUlMLzkvd2xlaCtNdlBmOXlx?=
 =?utf-8?B?M1JleTV1WkloUGo5Z0hXdXNDa1NzOFhvWmxtUHFNbTlvQ3kvVHprWVd1MTZ2?=
 =?utf-8?B?blYyR0Q2dS9JWFdCWFhwWXEyUDRtM2RML2dWS1Nid2FQYXo0bTZDMERhTldn?=
 =?utf-8?B?U1JOTS82dG0vYVlrQzgyTnhWdVZxd3poZnUrdWgwVldjek81cUxHUXAxWWVQ?=
 =?utf-8?B?ckhwdUsvMnA5OHRBdVpIdEFubXFReGFoTWlZa3UwOERHSFJ5RkYwa3lydUs5?=
 =?utf-8?B?YnJuM1dkcVFjOTYvQkI1VEs1K0RlTllDaW4zMlJ3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28cb28ed-2977-427b-22e5-08d8c2a4f161
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 09:21:35.5424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XV0S5QMeGmCCWdTZmiW+6cDyOd+lIFFHvUmPb4UvJANd0HdAjI8yLFOCyqq9nEvhnMP6DIpMf2HcsKL0spb/AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5590
X-OriginatorOrg: citrix.com

On Tue, Jan 26, 2021 at 06:07:23PM +0100, Jan Beulich wrote:
> Ian,
> 
> On 26.01.2021 14:45, Roger Pau Monne wrote:
> > The following series aims to fix some shortcomings of guest interrupt
> > handling when using passthrough devices. The first 5 patches are
> > bugfixes or cleanups, which I think should solve the issue(s) that
> > caused the dpci EOI timer to be introduced. However neither me nor
> > others seem to be able to reproduce the original issue, so it's hard to
> > tell.
> > 
> > It's my opinion that we should remove the timer and see what explodes
> > (if anything). That's the only way we will be able to figure out what
> > the original issue was, and how to fix it without introducing yet
> > another per-guest-irq related timer.
> > 
> > Thanks, Roger.
> > 
> > Roger Pau Monne (6):
> >   x86/vioapic: top word redir entry writes don't trigger interrupts
> >   x86/vioapic: issue EOI to dpci when switching pin to edge trigger mode
> >   x86/vpic: force int output to low when in init mode
> >   x86/vpic: don't trigger unmask event until end of init
> >   x86/vpic: issue dpci EOI for cleared pins at ICW1
> >   x86/dpci: remove the dpci EOI timer
> 
> while half of this series was still submitted in time, I'd still
> like to raise the question of including part or all of it in
> 4.15. In particular the last change is one which I would prefer
> to see happen early in a release cycle. Risk assessment is
> pretty difficult, I'm afraid (Roger can correct me here), as at
> least some of what gets adjusted are cases we don't normally
> expect to be exercised. (FAOD patch 5 is still pending a R-b
> tag.)
> 
> Roger, if you could give your own judgement on which of the
> changes you would view as more or less clear 4.15 candidates,
> this may help Ian take a decision.

I agree, the only risky patch is the last one, mainly because we have
no way to reproduce the issue that code was fixing. It's my assumption
that all the fixes prior to the last patch should address the same
issues the timer was trying to address.

So my recommendation would be to not commit the last patch unless all
the prior ones have been committed, and that would include 5/6 which
is still missing a R-b.

Thanks, Roger.

