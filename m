Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 938D42F5F08
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 11:42:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66926.119075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l004t-0003Xu-1Q; Thu, 14 Jan 2021 10:42:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66926.119075; Thu, 14 Jan 2021 10:42:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l004s-0003XV-UV; Thu, 14 Jan 2021 10:42:06 +0000
Received: by outflank-mailman (input) for mailman id 66926;
 Thu, 14 Jan 2021 10:42:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D7Rz=GR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l004r-0003XQ-6o
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 10:42:05 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b028808-6830-4c3e-897c-70d626cd4719;
 Thu, 14 Jan 2021 10:42:03 +0000 (UTC)
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
X-Inumbo-ID: 4b028808-6830-4c3e-897c-70d626cd4719
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610620923;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=e6tkvidJcx+YLzzPbWayykAEStojkZ5+hpGSopA/yUU=;
  b=ZYsYdoMFDq/tf8d7QRnRjNFogAuL9C3MGMTYE1aVJN3koyUvGMNVUXTl
   MVIid6B+C8PcruGiafJ6ejzMfHo2Bp5z8GkopjpMLPzeFuTCukYQH5y9r
   lqfEZDDmQ/1HL3gEIulWl+NF+eVcExIkDDZWIcWrbWdQ8Mau0xLYihVn8
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: SrwbO18cWOZlN4Rq1PREY9wZ7cXWu1NB4F6camQGWaef4iB/NwZYu3ami+5LesMmfY9Q/D5Yjx
 HdXsVA5hxRJevpmkVLabTYbIIHvrv1MtyJ8ouAUb+oC3RVC/huNwHRu734uvjIMHyUPhQO9AXR
 HBXO+ziOcFxRVpXOiZ4XB8lEFLo8WVWm5AI7SJSmj3mj7WYhsNg2cI2oBNDtULvWlZrBWV65kD
 k6Lgpj6k/PAaV7kZ5vmhr9PuvyEer3r/gK3L8OT2xZzBOsWuFfpy6sn3ImqiSE60vsgjd0Xps2
 GUU=
X-SBRS: 5.2
X-MesageID: 35290934
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,347,1602561600"; 
   d="scan'208";a="35290934"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KZW+B65ivHb4SznA/V03kjR1qFFZpLN0men3BPCSYVLAOKRBhS7MXP1FAtSXgKiyqQrO46JY8AiH5rkPs6Ae713LUB/5amnYVJ6vKqKE79V98giah6neiwmHFUTb9ii9abDtQmJW5B5aN7h1He5MlKS0oeeJqsu1MVv4FXH8v2368umcqhI3rNGVpCKV+tLTx0mgc8ognaBlGOm9mZVqh/oX02aRaicWu7hXkCEtBksTWaqY7U+dx62gA4DQqYKgTZL71ekQ6DcVTxd2Ou4PZdgjYJuQP2sapkcGAGNM8/PGWI+I51L13Do2EGQvZWUjVKJcups/5OqZ07I1f/6ABw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x73Ti2GS3bL7Uw2fwj03EQJTfRLn8zb0vczMBq4/OVc=;
 b=fbuV+JGHXLzpgKbcfEiqZp+K+PtWOfxWSOpKDOubFpbD3dVpjeZZGFKbZhGLlCmiENMQsY7mWruV/BdF+2BKgciCJaHRJULdzshdeAsC04X9g49R7J75pNGv470WYD52B0Mfw6q16Yj/Qg3PtdcvR6DzvquqArNzxu24No3XR/6Rr91giSNCTej7hZDR6la3i9MPMf2ZcCqIGAjndB+Em2BiMUCgOJ3Tv+ODFu1kh9fw4fbrkJuozFXfILUpzt1bqrrCPNL1bk9Ak04O6h66j90KfA+NutTppHm+WIhqWL/vmN4rHu6AiiZq9uVncyovubIGECWhFKJGVZS1KF3ZMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x73Ti2GS3bL7Uw2fwj03EQJTfRLn8zb0vczMBq4/OVc=;
 b=SkzsTYou8mR543pGfRCBozN0Zcf3MASWCekNxrwXoVy9Agwquy6dpDfn5qUOiknzbOPqas5IcORcxGDI87ZLlhnYg1PCnUzjVdZiiCfL1zGlZSyMJbGVjTuso2TPO3grow9n9pl7xEIxdp+UsuTWXSbWyxEJVj7J3RH1IynaHd8=
Date: Thu, 14 Jan 2021 11:41:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jason Andryuk <jandryuk@gmail.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: Re: Purpose of translate MSI interrupt into INTx for guest
 passthrough
Message-ID: <20210114104138.idafh4b2lits2x4o@Air-de-Roger>
References: <20210112141057.xjbslkq2em56kk3r@Air-de-Roger>
 <20210112142529.btveobjtj45hcvg6@Air-de-Roger>
 <CAKf6xptsLxtjE3-MORi2eQ7ew+rMU1qPaxfPDpOu0Cz74-r0gw@mail.gmail.com>
 <20210112155159.mqhfkww4uflttdno@Air-de-Roger>
 <5d8c11e4-a406-372f-c568-e7fbb2291ab6@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5d8c11e4-a406-372f-c568-e7fbb2291ab6@citrix.com>
X-ClientProxiedBy: MR2P264CA0092.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::32) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b09dcc00-c998-4e1d-f33d-08d8b878fbe5
X-MS-TrafficTypeDiagnostic: SA0PR03MB5642:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB564272488EC8BAEFAD3AEE5F8FA80@SA0PR03MB5642.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TFK90B0nPoA+bQyKjEtEDQVcFk/IO6FHip++5IEWod8uYXu0z5/MPnDvkN9X+HJRx4IQbLqPykOgNAWnPNifQ0aFmHYgWCi3onGGNgBQxwCAvnRZcClo9S2qXzAD9n9c4Be7MYCc1MNa+Re5vPGTzRhf31pto1RrgUw4rLexR3JF4pZjTmaGo3BZd0JO+ZPmjL+CJq36ZUpJb61G9GLlpa1X4Tj7PoG8Ue38vcthgNZ3Cs8CJPqmdnQlL1kb+tvN8U6XzyR8wRbPekZ2zHDbO7xhCzk0CRcvT4VMl1ZPhpc5nt/Rush48ndHTeF0AvuUZ51O04CzDcyzMwnHfuB0gGdTV+kg0xE1pjwN1j0hqd9U1UJqx6+tNSHTkw3R6mfixJPTyzbUlBaITUfQyoNCb0Nvhtw2kzKICOmVEWzMkhIf5aEYDep5MDnok3uL96fQ9BRqMcpFfQHehBuQ8VBX8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(39860400002)(136003)(396003)(366004)(376002)(53546011)(1076003)(6666004)(6486002)(26005)(2906002)(9686003)(478600001)(54906003)(83380400001)(316002)(66476007)(85182001)(186003)(66946007)(66556008)(33716001)(6636002)(956004)(8676002)(5660300002)(4326008)(6496006)(6862004)(16526019)(966005)(8936002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K3F4SVF2N3ZrQitRdWNkMXUxajAveVJmSkQ1ZEc1RlZYb1pFNTNKMnI5TVd3?=
 =?utf-8?B?cS9xVXgwcUpFL1NneGFBMVVMbGxZQk5hRXBJdWxVb0FMaENyWFBpdjByQjl2?=
 =?utf-8?B?TGZ2M3VQcEtFekpuRlZyeHNTSVhxaDB4R2s5aEF4bmJSa3RuOThyaVBEQ295?=
 =?utf-8?B?S0xod2orbzI2UlhVY0ZpOHZRWGpaWEJyRXI2MXJ0ZGNEdTRoSW5zdWd3NUU2?=
 =?utf-8?B?NGlINlhncW4yelBsSXphb05DNWhwNlNGbWdsWVI5bkRuNU9wdWw4cmhNVEJD?=
 =?utf-8?B?K1FYQlF0K0FLeDBPVW9pVmJnNGJBWGMySG9HSnVoWFpZUlFlUG9SZ21LQ2Rm?=
 =?utf-8?B?RUdwVUtSSUl3UmxGN21sT2t6dFhpOHE2VnBFNzJTU29sd3ByM1VjdlhWb1hV?=
 =?utf-8?B?OExyRUo1RnN5WjRiR3lxV3lPSjVYTU03bWJ2NTkyZlNMK0tVZS9lVS92eW9O?=
 =?utf-8?B?T216cDVDRW45Y1ZJYm8vcllHb2dpSVJ6akJtNW5pT09qOGRsNXdnU3Q3dHFE?=
 =?utf-8?B?dDhkZGk1V3FYNFpQbS8vY1RHK0tGWDBZNlpqNGRwd3FBK0JFRVNITU5USWZQ?=
 =?utf-8?B?ZTFlYThFQ2NXQ3ZjcG5oSE1qL051YXdCcHFEU1JLbkRUREY4SG9MQUh6ZGVk?=
 =?utf-8?B?T21vN3h4WTgwcm16dzdKQ0JGVVdKYmNiR05ITjlIUzdoYWRFaEluYk9maFVO?=
 =?utf-8?B?VFhEOHp6RWF6OUtSUm8xcXpvbjl1NWE0MmppYk5mVXRyTkNDYjFEQlZXK3Rl?=
 =?utf-8?B?R2Qyd1YyZ3B0UDdXenNIakRKd28zTHlqbzE2WG5kYXhmSVNXK05OREZ5eTM5?=
 =?utf-8?B?akg0RXkxQ29SekFwZVB0M0s4VE0xbStYUVF3Q2UvUVUybDJaaUp3Mk1vY2NL?=
 =?utf-8?B?ZGJTSmlqQjdsWDBVS0h2L2RvcU5Qb1Q2Njd5R2h0ZWF1dHhUbXNUOWdHRjd1?=
 =?utf-8?B?SExLUkp1QlFJY2tncVM2aElrb3VHblIzYnBzYkszUWRZNXAvdVNTUkZkYjNT?=
 =?utf-8?B?QnVVMnRqekxYTzMzclN5aU01QS9selN2ME95UVpqU3dKTDlRblg4bE15M0RB?=
 =?utf-8?B?L2ZTQ0pIR2ZWYUc4MUp2NDB3aGxkVnhHbjVjTXBBVkx4SnF3K2lEdHQvNHBC?=
 =?utf-8?B?M0NmR2JlcFQzbStlVVE2L3Y5N2hYNG9kZHVxWDlCSkptajRNS3NSQnFJZ09I?=
 =?utf-8?B?QVltVGNSMk9CME1EeXJOS3dKSjA3T1pQdmdoeTRMeHZMcGtiMkFQMzJ2ZWhp?=
 =?utf-8?B?TTViN3MwajZjWko1WXIwZnBRQjMvMERKTEFOMVF3eFVCSTQ1ZG5hSjZ4N1BU?=
 =?utf-8?Q?yX4kmodYD2EltO0Cf72xvnmoAsMj7JUbaD?=
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 10:41:43.3079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: b09dcc00-c998-4e1d-f33d-08d8b878fbe5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ii0cDE1Ew4FEEONVh2STzvG5754W8jOjNstWsZaobf6TNNoG22TxZj7AMvOtt0I10of9humIpCZjELuDbMrPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5642
X-OriginatorOrg: citrix.com

On Wed, Jan 13, 2021 at 09:00:47PM +0000, Andrew Cooper wrote:
> On 12/01/2021 15:51, Roger Pau Monné wrote:
> > On Tue, Jan 12, 2021 at 09:48:17AM -0500, Jason Andryuk wrote:
> >> On Tue, Jan 12, 2021 at 9:25 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >>> Dropping Qing He as this address bounces.
> >>>
> >>> On Tue, Jan 12, 2021 at 03:10:57PM +0100, Roger Pau Monné wrote:
> >>>> Hello,
> >>>>
> >>>> While trying to do some cleanup of the Xen interrupt support for pci
> >>>> pass though I came across the MSI to INTx translation that Xen is in
> >>>> theory capable of performing (ie: use a physical MSI interrupt source
> >>>> and inject that as an INTx to a guest).
> >>>>
> >>>> AFAICT such functionality is not wired up to the toolstack, so it's
> >>>> hard to tell what's the indented purpose, or whether it has seen any
> >>>> usage.
> >>> So apparently it is wired up to the toolstack for qemu-traditional,
> >>> albeit it's disabled by default. There's some documentation in
> >>> xl-pci-configuration:
> >>>
> >>> "When enabled, MSI-INTx translation will always enable MSI on the PCI
> >>> device regardless of whether the guest uses INTx or MSI."
> >>>
> >>> So the main purpose seem to be to always use the MSI interrupt source
> >>> regardless of whether the guest is using INTx or MSI. Maybe the
> >>> purpose was to workaround some bugs when using INTx? Or buggy devices
> >>> with INTx interrupts?
> >>>
> >>> qemu-upstream doesn't seem to support it anymore, so I would still
> >>> like to remove it if we get consensus.
> >> The cover letter from
> >> http://old-list-archives.xenproject.org/archives/html/xen-devel/2009-01/msg00228.html
> >> """
> >> This patchset enables MSI-INTx interrupt translation for HVM
> >> domains. The intention of the patch is to use MSI as the physical
> >> interrupt mechanism for passthrough device as much as possible,
> >> thus reducing the pirq sharing among domains.
> >>
> >> When MSI is globally enabled, if the device has the MSI capability
> >> but doesn't used by the guest, hypervisor will try to user MSI as
> >> the underlying pirq and inject translated INTx irq to guest
> >> vioapic. When guest itself enabled MSI or MSI-X, the translation
> >> is automatically turned off.
> >>
> >> Add a config file option to disable/enable this feature. Also, in
> >> order to allow the user to override the option per device, a
> >> per-device option mechanism is implemented and an MSI-INTx option
> >> is added
> >> """
> >>
> >> It seems like it could be a good idea, but I don't know if it presents
> >> compatibility issues when actually used.
> > Hm, MSI interrupts are edge triggered, while INTx is (usually) level.
> > Also devices capable of multiple MSI vectors will be limited to a
> > single one, and I'm not sure whether the transition from translated
> > MSI to INTx into multiple MSIs would work correctly, as seems tricky.
> >
> >> As you say, it's not supported by qemu-upstream, so maybe it should
> >> just be dropped.
> > I don't really see much value in forcing Xen to always use MSI
> > regardless of whether the guest is using INTx or MSI, and it's likely
> > to cause more issues than benefits.
> >
> > IMO I think we should get rid of this, as the only real value is
> > having Xen using MSI intend of INTx, but it's not introducing any kind
> > of functionality from a guest PoV.
> 
> I find this feature very dubious.
> 
> While I agree that reducing INTx sharing between domains is obviously a
> good thing, I don't see how the device can possibly be expected to work
> if the in-guest driver doesn't have an accurate idea of what's going on.
> 
> There are up to 4 INTx lines, but absolutely nothing to suggest that
> these would logically map to the first 4 MSIs enabled on the device.

Multiple MSI interrupts routed to INTx will never work IMO.

> Even in the simplified case of only INTA and a single MSI, there's
> nothing to suggest that the device will behave in the same way when it
> comes to generating interrupts.

IIRC (at least for plain MSI with message groups) it's possible to
enable a single vector even when multiple ones are available, and that
single vector will be used to deliver all events, kind of similar to
the PCI INTx stuff. But as you note MSI is edge triggered while INTx is
level, so there's likely all kind of weird interactions that could
happen from the 'translation' done by Xen.

I'm up for removing it, we don't have it in qemu-upstream and no one
has complained, so I think it's a good sign that this feature was
unused.

Unless someone objects I will prepare a patch to remove it.

Thanks, Roger.

