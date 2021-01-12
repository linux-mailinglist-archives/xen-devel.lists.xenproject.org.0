Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 028522F34B0
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 16:53:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65765.116517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzLxv-0006Y7-3h; Tue, 12 Jan 2021 15:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65765.116517; Tue, 12 Jan 2021 15:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzLxv-0006Xk-07; Tue, 12 Jan 2021 15:52:15 +0000
Received: by outflank-mailman (input) for mailman id 65765;
 Tue, 12 Jan 2021 15:52:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=59Pv=GP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kzLxt-0006Xf-2m
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 15:52:13 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dde71e98-66f7-43ba-b681-67edae25e7ca;
 Tue, 12 Jan 2021 15:52:11 +0000 (UTC)
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
X-Inumbo-ID: dde71e98-66f7-43ba-b681-67edae25e7ca
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610466730;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=vybdbESP8MHVAvd+5Oxhyjvg8aLo+b/KgBIj47QfdXU=;
  b=DSQABLS2WiryaUKCaKFEO5LXIULU5pTlwMzuqlYtUXGZ2KUqLkcZvI4y
   VlygwB2iF8+cxXPM3AuHzXFIRgE62PkIAcJ3d6zN+96QY8ZGzdLNhlkua
   G0ictvaSb84HmUjqJBEvWk62d28oUVdo4zevbEoROxIjU2nBwXn3Yoj4v
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GOUx8Hf1YavCjeYLU/soGwBd/DZSlc9rE9XZhR2Xl7a6T2aQO0a85vvRVxfLimUNXoMckFBEPS
 /mFWp++1pJVEysRFYZ+lShK/mJWsafELKPLXbIW1YRi+iN58k2wunR3g7koM/UPO75Kmmd8+gs
 OThqhckpvvtZf54jqDIBpkuuVk1rcxVeevQ81nXqgbD95V9mtEpWHRhxXealjZNMNUQhmPGjLK
 Pi4wG4HgcxJzZiNFmb5QXVOeZjX1Fo3wTCrNut30LS5ML3cLkDaIsdRbk+C0TfweCapcc2K1Eu
 jBE=
X-SBRS: 5.2
X-MesageID: 34972667
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,341,1602561600"; 
   d="scan'208";a="34972667"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6VQTAUiMVAPa7EM8Pfh7Yi+HhesHP94rAQCwdcOYGJvLhFW9n77bLkKYhGCV0eV+9pdyo5IryqzOJzANCXYDKQpY5d+Jo9dKdOLSF0ef9bUt7sWPCCzPIZhPnz3YmXKSUBa+WFIv1tozZrBjLjMn5sASXZSEOUK49Gv8OUOJm5NVHbo3tf5LnEdw0D9hDqBcPGXPV96k4Inq5wqydUV0dHKvcOhjzmifV3mafOPigZ8QlnICmiJ9nnmL0pzZ58zq2I1tbDwEX/2iQcSqCNww4h0lvkiMBuO3Mzy9c0JiBQKtLw1h9OBT2ZwaAq7NdgbZyMjpl3UguXOnRtbpPTuXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b31DgIWgKNkoIGmvJFAO7ZIK6L5TqrpjOweVGZdR3vA=;
 b=e6P1MwyIQ8z6d3PssiPBdnyR9WAhteuPDcQuiFHupgDS+FFCmUZdl7HVxrq39sqyKIryYzaNQpqEugoFr4oVaj0jWWjNHumVgRCR3eUYlaivvo6I6XENDWPw2xAWsWwg+T5Svd82YfKQhyRPq21gEUWbrf8Rjxi52yHjlKSWD7f0QPlNPbA5dYX56/xnSy3rJphexlo2btlbeXgRskiUBzhlaPafiEajC61RlIulbsyut7NhwLl/vcHVV39RA+mfMidV7iRnKWjlJ34lmtOnsWsEZ0MtLrppVhTY4VOsVtVZAkbNGqqdSpuAGn48zbu7BXKIfnKlHRFap5BwCQiuuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b31DgIWgKNkoIGmvJFAO7ZIK6L5TqrpjOweVGZdR3vA=;
 b=X/wAeUHqUm5HPD5DKdveNUy4VV89R2ZGPMK0g8MPhCLq+k3RczpHqspBGybMfRC7Lw3ie0f/GrF4UGttP0ywSw0sM6wVEjY+hGqsZqYixqEANWgK8L8QWJh7px4mbwL2tEq6p65RSBDSy3wsMcUwnVhgxKAngkxmlIHeytK/B2w=
Date: Tue, 12 Jan 2021 16:51:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: Re: Purpose of translate MSI interrupt into INTx for guest
 passthrough
Message-ID: <20210112155159.mqhfkww4uflttdno@Air-de-Roger>
References: <20210112141057.xjbslkq2em56kk3r@Air-de-Roger>
 <20210112142529.btveobjtj45hcvg6@Air-de-Roger>
 <CAKf6xptsLxtjE3-MORi2eQ7ew+rMU1qPaxfPDpOu0Cz74-r0gw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKf6xptsLxtjE3-MORi2eQ7ew+rMU1qPaxfPDpOu0Cz74-r0gw@mail.gmail.com>
X-ClientProxiedBy: PR3P189CA0035.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77db6b60-f22c-4ffc-19fd-08d8b7120308
X-MS-TrafficTypeDiagnostic: DM6PR03MB5065:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5065578AA6B44049CF192E308FAA0@DM6PR03MB5065.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XExp6VcqMx56YPFr4/ULw6OpXsYDgfoFzUEuH90HiGlhg6YrwNe1bLq9wugvATVQpMsvkzd59k22Vwr2pN1X0qU+mpM9U/CyZLk+QatY+LEP1SZvEwH4D1KamGDLPKH6PkQdOGCWn/ss1rU9o3PsMS/G7lXLeFYnpSn0AztHaKmNB7GEtQILmEbtV0/NVWLT+5ys5vCcROJ3lb2vZVUBfJjBxGmTvF9sEFxDtbY7pJSqYgG0jsniWa+amg4IPJwHOGizje/rt06zVlAY0ARG/RPbG2yRaM2H0zbDhT0swHDEkFEiMlNMYD4Z8G5R7/oDJ8iklw9qJKPEZEOuwc5zE2/STotPf4wPA90LRuwiFU83AaNsndfNT+RsfhsdkRS2w/mjQ764/1XOfvcrPLoBYldKp7C/xW79ozHbep5+nYdgTFQf6NPBNPNHnIe41qDJRuFweI0FMpucblggXStcnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(396003)(39850400004)(136003)(346002)(366004)(66946007)(83380400001)(26005)(6486002)(66476007)(53546011)(66556008)(54906003)(316002)(16526019)(86362001)(1076003)(956004)(5660300002)(478600001)(186003)(85182001)(33716001)(8936002)(4326008)(6916009)(9686003)(2906002)(6666004)(966005)(8676002)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MzMya1lGM2g1QzhmTFZCbUVSdVhWQStaak9lZG0wMTFRSVMrSWN6VGwydG11?=
 =?utf-8?B?MzJOVXM1b2lldzV5VTNycXl4bGE1S2d0aU1jVW4zbFBaSUdFVkh6cG11RHpu?=
 =?utf-8?B?RXdTRkZuQlJDc0dpU3R5anpqTEU3QkdBcWdXN2pXbW9RdCs3M0pLdkIreGZq?=
 =?utf-8?B?T1pyZkRXbWtHeWNMd3JUamp2MmQ5K2hDVEVEYVhRNnRTdFlVNzhlaTVXNHVC?=
 =?utf-8?B?SE5DWExPeEpUSHNYRUErNktIWkI0YjRqc21XclNRRXZoOTViYVZQUVVWenJU?=
 =?utf-8?B?cjRvL0RIRU1nU2hWdTMwa1JDZXVGQ3N3cEt5YnFZUjhOV3p2R1pJQ3JUUHFW?=
 =?utf-8?B?K3hSOVRMOEZHSktBaVJCc1lRbXQxenEzZ054Ukg5eFJNa1ptaTQrcitvWlFj?=
 =?utf-8?B?djBiQWEzSml6ZTBkbWFsZU81RDhYdjdSZ25zTW5USlBtUTIwR1lqS2RlYWdP?=
 =?utf-8?B?NXB4emlkUGxmOW1mdmxJZU83cGRYMFhISWVLR0l4WTJ3d2tGLzVNdENNaGxR?=
 =?utf-8?B?dGN0RHVtS1c3elo5OXVVQUdPakY2QytuY0pET0tNaUF2REVtWWZIcDNGbFc0?=
 =?utf-8?B?K2grRDZJRU12bGFiZXJXYWU0WVpBbi9yVTRkaDNZZzNweC9iblA4WTBzUVQy?=
 =?utf-8?B?Ykpod2FwYk1xOGlHdVZRUUVFc1g4T0x0bUw3TzhzditaKy9EZDdlenlqbWFT?=
 =?utf-8?B?U1EzQjhsZmlsMVprQlFndzE5MEoxbXVhcEtHWFR0NDFIa09vZStwMWozZU5j?=
 =?utf-8?B?MWEzWUtNWFBma243WGM3NTN1U2d6UHl1bzE2YmhWQnB3TTZjd0g1YVo1MlRa?=
 =?utf-8?B?aXZvTittaHJnb0lITkg1Q1Nlc1pHYTlWemtreE15dzFIcm1leW91dGlPY3BU?=
 =?utf-8?B?N3BMckMxbkFGb3dkU3F4V1JFTkM0S3VoQkI4KytNRHFnVjhVakFLVjc5UWpN?=
 =?utf-8?B?bElJKzM1QzZ3R245TlUySTUvZXptdWNtTW1GS1lrZFhWZUdvREJkR2ZxVXlr?=
 =?utf-8?B?MVRZdjZqamF4K21UcUx6aEo2QUppdlg5dVByWlJEVzV4QVJuWnp1cnV1NUJq?=
 =?utf-8?B?c1ZGMGcvTmFnZEJ5aExaancrNG5JTmdRUWF5SkdaSWtpTkxtZENhSmUxQS9U?=
 =?utf-8?B?a3M2bjUvMHRnNFM5VG92K0NOalBpU2E1V3hTaEJTSVRUNitRb0pvcWxicGhm?=
 =?utf-8?B?Vy80ZzNVYmlzWHF4SThyK1gyZUNsN2hxTkVvRlZHWklVMDZ3UnhrN1lQTXpI?=
 =?utf-8?B?ZThhRjExa0dFSTBEam5yQlBKTGlCRWx6cnNHaGtSa2F4UjRXZ1RIWU1lQng0?=
 =?utf-8?Q?85FecZ1cO3U3V89ABnrS5IUPSQhcruvg6k?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 15:52:05.9678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 77db6b60-f22c-4ffc-19fd-08d8b7120308
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9vraPpqym1OCg8RXroKcLY91INTqhKddsia/7CCVaA5yxxuaE7gRX6oNlsHUZ0D0oTMkpnVguaJNMd41DxDyfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5065
X-OriginatorOrg: citrix.com

On Tue, Jan 12, 2021 at 09:48:17AM -0500, Jason Andryuk wrote:
> On Tue, Jan 12, 2021 at 9:25 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > Dropping Qing He as this address bounces.
> >
> > On Tue, Jan 12, 2021 at 03:10:57PM +0100, Roger Pau Monné wrote:
> > > Hello,
> > >
> > > While trying to do some cleanup of the Xen interrupt support for pci
> > > pass though I came across the MSI to INTx translation that Xen is in
> > > theory capable of performing (ie: use a physical MSI interrupt source
> > > and inject that as an INTx to a guest).
> > >
> > > AFAICT such functionality is not wired up to the toolstack, so it's
> > > hard to tell what's the indented purpose, or whether it has seen any
> > > usage.
> >
> > So apparently it is wired up to the toolstack for qemu-traditional,
> > albeit it's disabled by default. There's some documentation in
> > xl-pci-configuration:
> >
> > "When enabled, MSI-INTx translation will always enable MSI on the PCI
> > device regardless of whether the guest uses INTx or MSI."
> >
> > So the main purpose seem to be to always use the MSI interrupt source
> > regardless of whether the guest is using INTx or MSI. Maybe the
> > purpose was to workaround some bugs when using INTx? Or buggy devices
> > with INTx interrupts?
> >
> > qemu-upstream doesn't seem to support it anymore, so I would still
> > like to remove it if we get consensus.
> 
> The cover letter from
> http://old-list-archives.xenproject.org/archives/html/xen-devel/2009-01/msg00228.html
> """
> This patchset enables MSI-INTx interrupt translation for HVM
> domains. The intention of the patch is to use MSI as the physical
> interrupt mechanism for passthrough device as much as possible,
> thus reducing the pirq sharing among domains.
> 
> When MSI is globally enabled, if the device has the MSI capability
> but doesn't used by the guest, hypervisor will try to user MSI as
> the underlying pirq and inject translated INTx irq to guest
> vioapic. When guest itself enabled MSI or MSI-X, the translation
> is automatically turned off.
> 
> Add a config file option to disable/enable this feature. Also, in
> order to allow the user to override the option per device, a
> per-device option mechanism is implemented and an MSI-INTx option
> is added
> """
> 
> It seems like it could be a good idea, but I don't know if it presents
> compatibility issues when actually used.

Hm, MSI interrupts are edge triggered, while INTx is (usually) level.
Also devices capable of multiple MSI vectors will be limited to a
single one, and I'm not sure whether the transition from translated
MSI to INTx into multiple MSIs would work correctly, as seems tricky.

> As you say, it's not supported by qemu-upstream, so maybe it should
> just be dropped.

I don't really see much value in forcing Xen to always use MSI
regardless of whether the guest is using INTx or MSI, and it's likely
to cause more issues than benefits.

IMO I think we should get rid of this, as the only real value is
having Xen using MSI intend of INTx, but it's not introducing any kind
of functionality from a guest PoV.

Thanks, Roger.

