Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADBB2D0346
	for <lists+xen-devel@lfdr.de>; Sun,  6 Dec 2020 12:17:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45604.81045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kls1Q-00043s-0q; Sun, 06 Dec 2020 11:16:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45604.81045; Sun, 06 Dec 2020 11:16:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kls1P-00043T-Tu; Sun, 06 Dec 2020 11:16:07 +0000
Received: by outflank-mailman (input) for mailman id 45604;
 Sun, 06 Dec 2020 11:16:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E5iC=FK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kls1N-00043O-Vg
 for xen-devel@lists.xenproject.org; Sun, 06 Dec 2020 11:16:06 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df1e5d65-e99d-4408-bcb3-e87c7dbf1ce9;
 Sun, 06 Dec 2020 11:16:03 +0000 (UTC)
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
X-Inumbo-ID: df1e5d65-e99d-4408-bcb3-e87c7dbf1ce9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607253363;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=o1ll9WNyeNBZ4YfGD8Zp4kRNPyE78q/petgNxo6u59g=;
  b=B4q3NlCL/3Uxsnj0rSMq1zI65hNKmYYyWKrpjump+H1UzNQaMXUIF4PL
   VG/vKBocDo4nERPgrCvNNb5n1FAxqQVotat4XGxyiUrzh1cbtr7bTPL8H
   QWpttGHvdJoX/mXxlcQdiMjqJQ+d5uRIDSNojxE8uSy4gVt/Vtg5GXR+u
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: D+8rKoS9IrOg+AjALfjJDFjqPlqkWaEf1S2jtiBEGNaala1Plk2fr9Kpp1krOORiSd1IyCgZWx
 YYJlQDn9aLRO5FmiRYFnW1XH6PcCJvTYkNhr6rGbZVrRNBKYJMSnl6PA+EU7ZqbHV1AXSVoACq
 vSaj8H/ccQS2msqWXJ6VyEkKirDZolrmXeqIN0Nj0kRkmChpC6GlP1BUz5osMmgbBmh1kXvwAB
 G6b1GHyRT8DGwsYTjM55eEnOXcUgSfHre4nzpxFzTnyUlICOxDTjzbytVYnla6v+NDtJ2mZNUL
 9qI=
X-SBRS: 5.1
X-MesageID: 32631746
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,397,1599537600"; 
   d="scan'208";a="32631746"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7iO1pxpbS7+m7q9aS4M2a9j7DeO7ewNXaN26TW0C/IBxrfw5Kf17dR1GbDxr8Ho+4YLA64CrctPvB5uaNzviGfbQ2pcqJxjiD3Rlm1HwXDzpjeXa2VGSh8DR/a5De9L0V7VAIoO9peV5I+XlEFGnWN+wErxg+gUiot6qvcw0KCkmL37J7KcGPfj7drwHpg3c4uloa2VPxOu6mdat22p5/FjfHzgiyvFY6PJQBBXw7Ukqhz91IXoUj+G9RpRn/y2KO9xr3jMTuXEX15lJEPLiM2cZpPia/s/v94GbBHGt5CDZIDQKMI5IZ+ngDoLJchJDiyh4Sv7XxTo5omKjCxQ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eM7X5W7dHzNFXzHEvyYyRcUzrP0YeFVpW+ECifwTc/w=;
 b=EwALGlOxEj+Wky1/vSlls4Hg+nBfNbsG766OswIVfFRKCsOmg0+lZPAt7kJ5ZWQDnvs8uS1T0+StqgF7p7Izkofy84FhhWapcIOCH3vS0+mVP20M/X8LphPerIVcr4bAGbw123EhsDX4MdJw8sJ5vFyXbp+BSp9+rRyZNY7KchtHC+PolIzSuBiMcHAg6VU8ENOerQZlT2ur8n3dusmqe/KRYQ8NkkIDHAUZCeg2B++F9LfVO0lZTQ8DoPCM7APYBub++EKgFciHLMfRFTI6tadgtDhe1rX3CgBugZjuhcD9mddXuoU+BcK+UuHKF6crKMDimFkB9rAb+hfDUV5EsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eM7X5W7dHzNFXzHEvyYyRcUzrP0YeFVpW+ECifwTc/w=;
 b=TN6PesQjqpisHwW1V6TXMWOLS6kV77HJ5gAKXeun2DcN4nJTN4s7qZ/x6vLTJ7Eqw31lE6A3/ep6aFc21Wh7FAcg2sr+opX/21lqUn2TvT2bJXJ5XZ2i/HQo7gDj9LCfxwiqI+EJ2HM2CEkhkJ5Rr8RE8Yu+e4MqqFnrQIz5Jts=
Date: Sun, 6 Dec 2020 12:15:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Manuel Bouyer <bouyer@antioche.eu.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] vpci/msix: exit early if MSI-X is disabled
Message-ID: <20201206111548.nzefo2fx6bvspuj5@Air-de-Roger>
References: <20201201174014.27878-1-roger.pau@citrix.com>
 <dfc96aa9-c39f-177c-c8f8-af18b80804de@suse.com>
 <cdb2a1ae-9ee7-6661-b69f-d2faacef2c12@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cdb2a1ae-9ee7-6661-b69f-d2faacef2c12@suse.com>
X-ClientProxiedBy: LO2P265CA0426.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cb2226f-e6f1-42a3-ab01-08d899d84eb2
X-MS-TrafficTypeDiagnostic: DM5PR03MB3066:
X-Microsoft-Antispam-PRVS: <DM5PR03MB306657E92DA98EC1B3FFD7E88FCF0@DM5PR03MB3066.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f2Qq2BNuvH9hU1biEdL4EcfE0XOVNYDxnaOmn3z3J/C87t48tWv5rbxic5Qr1rkMQYDtDZOHFdcYlPNVxSwfI+NmM42xiCWDMekYT0pSZTqeMTi8phLQhDq7xwqEiIagxTcKP+0TAWEyaMlsiWQ2lnU4ym77WNfmBGLKTauiOLWEWhKQf4uk9FFAQ3DJB5Uuvlx+WsTRS8BJh/QyPRRg9K2yYM1q/mWP8RSlpe65BLxwGfc35ENnMzPgdlgKs/Xv1csRYW5Lv9yFO3usVbwkbtNqG2MNIAiCqmLsCdGKiU/3MQnQ0wxJhrSqkoll1RZIempRrbNjB/aOB7gHp82Cvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39850400004)(396003)(376002)(136003)(346002)(366004)(66946007)(956004)(6486002)(8936002)(186003)(5660300002)(6666004)(1076003)(2906002)(16526019)(26005)(33716001)(85182001)(83380400001)(66476007)(6916009)(8676002)(86362001)(66556008)(478600001)(4326008)(9686003)(6496006)(316002)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VHZXaktBMWFud20xZzRDYmZwa0I5bjlNTkFnZzNLWnFxZ2N6M1RxYjBsV01I?=
 =?utf-8?B?NW1uNS9wdVNwZ2ROWTZvMWVQUHRCRXpSVkFCTmpLV1BqaDdEcm42RHdNZjQ0?=
 =?utf-8?B?Vkk5NlZ1NVlLZkc1MnozL21xRHEvelgwREJEMUowRFpvT29tcktOSkZQUHpI?=
 =?utf-8?B?KzdEK3g1a0RjUXpvWkpYakM2cjFwbXhJeFlTaHovNElMTytEZllXeStlOW9I?=
 =?utf-8?B?Y1JvZlo0N2FISzVIcWxLcWNldWlCUC9RSTBsQ0VmbmxXaldzTHFEcUhTT0p5?=
 =?utf-8?B?TEtpYXRmdXI0VXM3NHc1WFRjRnZWcFpLa1V5VDE4VWJHWVN3UjJYdXpZQ21a?=
 =?utf-8?B?VSs5SUxpTVNPUnRUdEdqVHRRZ1o5ZVFRcEhOVWpxakFwTTBvNGxpNTNya25v?=
 =?utf-8?B?Z2tzRUhRcXdQNUN6c3BSNVVyRjRmTVBrWWR3Rm51c3ZyVzh2dnd3TlVVK1pn?=
 =?utf-8?B?aG1OT2dheVBDOGl6TW00QWMramduQVFXUDVkME5vMWVJRUtDaGE5emRwb3ZQ?=
 =?utf-8?B?MXBDaFhqb21GSFltSUFTSWEyYkJBMStLSTVHTVpQZE9SbFN4ZS9NKzcrWW9I?=
 =?utf-8?B?VVNCL0tVT1hrZVZaUDYyclpQeGpYQXZBa0I2MDJYMmgxTG4ydnRUNHUvM2xO?=
 =?utf-8?B?SEt0MXNCaHZYNWFnL3JEOXozcENuYm85MUduYkdhZDNnSzJXNmdLOThGTkxi?=
 =?utf-8?B?NXlUc1FwdTRheUlrVWpwZHdQNVVBWXdQYXoycHRxWHBEcWRCSnYvMHpWcXdy?=
 =?utf-8?B?SWtkaWRCMVc1VHVGM2VEUlRwMEcveDdhT3dxK1ZCTzN1WmZGdkRPWTZRVEE5?=
 =?utf-8?B?aXZhdU8xeUNpeDRWTkx3SG1uc2VzTXhreUpTVklmZlg4YnV0VldSRHU1YlFk?=
 =?utf-8?B?N3c2UXJ5L0xrL0lEaU9jRlVmUS9BT0xvM3BTbG9Dc0t0UmRaaVNpcWlhclAx?=
 =?utf-8?B?ZnlqekNrQ0VIMjB2aGlQWEpaYlhpcWJpa3ZteUQweklWc0tBNC96anpuSnhi?=
 =?utf-8?B?NGR6K3ZINFV1ZFpsNUxIeHp4NStSY3VuT3czektNNjI5VUJoTy9RUk9OSzNy?=
 =?utf-8?B?YmZVNGpmdTN2TzliQ1dDYXBkTC8xMXB6NW5xeElkTW1wYVF6M2l4MmR4bDdp?=
 =?utf-8?B?TTJKMDVQcVc3d3MzcjYzbmlpanFKNlJpMDBTeUxpSjdySStKMTlIR1plWGYr?=
 =?utf-8?B?b0ZWc3BCcmVCL3Btb1R5bEhpNE5tYnkxV1RQV2NoWFF1amxJSFR3MVdlR0JK?=
 =?utf-8?B?ZnY4SWl2NlVmR3Ivb0NzYmlQMFRFQUxyUFdmZ1JhR2RKWmlsdEdYODBHUkR1?=
 =?utf-8?Q?KiHtk7Rghz9jFZ0UlTdpqzZ7uzfTKyW91e?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2020 11:15:58.4476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb2226f-e6f1-42a3-ab01-08d899d84eb2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MgSK7lZsTx0yIg5FzVBNnOKF/AkfgVPjlZB+kzqEe/7P6f88cZIJUqkNABN5zdUniFdfP7W5M5McOjd90Xh8Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3066
X-OriginatorOrg: citrix.com

Sorry, slightly sleep deprived, hope the reply below makes sense.

On Thu, Dec 03, 2020 at 02:40:28PM +0100, Jan Beulich wrote:
> On 02.12.2020 09:38, Jan Beulich wrote:
> > On 01.12.2020 18:40, Roger Pau Monne wrote:
> >> --- a/xen/drivers/vpci/msix.c
> >> +++ b/xen/drivers/vpci/msix.c
> >> @@ -357,7 +357,11 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
> >>           * so that it picks the new state.
> >>           */
> >>          entry->masked = new_masked;
> >> -        if ( !new_masked && msix->enabled && !msix->masked && entry->updated )
> >> +
> >> +        if ( !msix->enabled )
> >> +            break;
> >> +
> >> +        if ( !new_masked && !msix->masked && entry->updated )
> >>          {
> >>              /*
> >>               * If MSI-X is enabled, the function mask is not active, the entry
> > 
> > What about a "disabled" -> "enabled-but-masked" transition? This,
> > afaict, similarly won't trigger setting up of entries from
> > control_write(), and hence I'd expect the ASSERT() to similarly
> > trigger when subsequently an entry's mask bit gets altered.

This would only happen if the user hasn't written to the entry address
or data fields since initialization, or else the update field would be
set and then when clearing the entry mask bit in
PCI_MSIX_ENTRY_VECTOR_CTRL_OFFSET the entry will be properly setup.

> > I'd also be fine making this further adjustment, if you agree,
> > but the one thing I haven't been able to fully convince myself of
> > is that there's then still no need to set ->updated to true.
> 
> I've taken another look. I think setting ->updated (or something
> equivalent) is needed in that case, in order to not lose the
> setting of the entry mask bit. However, this would only defer the
> problem to control_write(): This would now need to call
> vpci_msix_arch_mask_entry() under suitable conditions, but avoid
> calling it when the entry is disabled or was never set up.

If the entry is masked control_write won't call update_entry, leaving
the entry updated bit as-is, thus deferring the call to update_entry
to further updates in PCI_MSIX_ENTRY_VECTOR_CTRL_OFFSET. I think this
is all fine.

> No
> matter whether making the setting of ->updated conditional, or
> adding a conditional call in update_entry(), we'd need to
> evaluate whether the entry is currently disabled. Imo, instead of
> introducing a new arch hook for this, it's easier to make
> vpci_msix_arch_mask_entry() tolerate getting called on a disabled
> entry. Below my proposed alternative change.

I think just setting the updated bit for all entries at initialization
would solve this, as this would then force a call to update_entry when
and entry us unmasked (by writes to PCI_MSIX_ENTRY_VECTOR_CTRL_OFFSET).

In any case the assert in vpci_msix_arch_mask_entry is a logic check,
IIRC calling it with an invalid pirq will just result in the function
being a no op as domain_spin_lock_irq_desc will return NULL.

> 
> While writing the description I started wondering why we require
> address or data fields to have got written before the first
> unmask. I don't think the hardware imposes such a requirement;
> zeros would be used instead, whatever this means. Let's not
> forget that it's only the primary purpose of MSI/MSI-X to
> trigger interrupts. Forcing the writes to go elsewhere in
> memory is not forbidden from all I know, and could be used by a
> driver. IOW I think ->updated should start out as set to true.
> But of course vpci_msi_update() then would need to check the
> upper address bits and avoid setting up an interrupt if they're
> not 0xfee. And further arrangements would be needed to have the
> guest requested write actually get carried out correctly.

Seems correct, albeit adding such logic seems to complicate the code
and expand the attack surface. IMO I wouldn't implement this unless we
know there's a real use case for this.

Thanks, Roger.

