Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F113043B1
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 17:23:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75276.135492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4R6e-0004R6-J3; Tue, 26 Jan 2021 16:22:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75276.135492; Tue, 26 Jan 2021 16:22:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4R6e-0004Qj-FN; Tue, 26 Jan 2021 16:22:16 +0000
Received: by outflank-mailman (input) for mailman id 75276;
 Tue, 26 Jan 2021 16:22:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nQkR=G5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l4R6d-0004Qe-0J
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 16:22:15 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5eeec0f3-4b6e-47fd-8dcb-b49afc025e8f;
 Tue, 26 Jan 2021 16:22:13 +0000 (UTC)
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
X-Inumbo-ID: 5eeec0f3-4b6e-47fd-8dcb-b49afc025e8f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611678133;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=PdCRLPy1mWS7TocJMy9bzVdpfLCvaxiCZucESggrwIQ=;
  b=RMYdjE/CssMF/DRRkxMQWYI4CKpuD5Pi9Guz/U899Rq+IuZC43dnN3FB
   0hHB3hWMPl8R6lFtLcGj+TG/hY/7VpYjU+Zm0G+W+uWYJfxZn5UBj+Ux1
   1oPJP/acDr6iK4x7oierCs7Dxs0aavnDaS9fgACt2DmO9NmQ7WkY+CYLy
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xTLkb/BL6aLnMGwG8Y6t0sQW1MouWy/F7zPfMltAL/wPU079/0CWlvZFVwJqQF43D6OiPyT7jP
 9xpgbQlKFvnxh0TiTmAM4eN0WD8G4Rh8CL/ktk1A1Y7qAd5S/kbMWrgrDM7L/U/qCmKhHp3KkA
 lRCyvkv9pFIrWGV6Z53eEuweApwQF7gCsfFJUgnQHW+yZFYiZPUWTX/jJJaqgAMTvT3WawxlDP
 KWNgps4Zvn0YvzxroYKu66ukPJRj070VNYtnFNAo+VS+VvCZqo4eeJg1VhCao5icyS4Aq/bN6C
 j4I=
X-SBRS: 5.2
X-MesageID: 37198098
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,375,1602561600"; 
   d="scan'208";a="37198098"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDaE77cf5xEIBn8EbdBjcRiZV6J/5AAFjGf8/z8whrs/ll6S8pB70FxceTMVPzWHYR+D7ZuPJS9eKVfsg4UsGkf9l1eytWCwjluuJX1zZa7Ezr6PKFVRTqHyOC3EaCYz6ErrVUEHfX/EWS2lHxGF+QTG/o3TKS3Cd3QL0iv8/qme3ZOULjngeDWtvRAMgFoivU3SzlxzZpjtksDhROZEAGRG+UPTaRfciSLyrb8zccCG3inECaNPt9lMQxe1X2T82TorRZ3iIiiLxAVwqfo6CQcJFCnvz0dn/v4zSvu+kg89QT+N4SIFA2S9rvI8Jk107NonzZyDD2i4FXxYIjrofQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSAkpewS/T7g/TCWm/Xp18FU4aJB+e6JQoCvcrbfApk=;
 b=H2saXHR/W05siwJcUp/psQBulyfM2XHxs4Z1Ymt/uYIrBn6pYCixHM7HtOoAIRWNS+3xaOKdmb24GnaO/b4mTItuSeJULtSK+PFX+YmsR0BdzmBf+Mztgd6YXznmMqIroiqZavy7+tCt6n0pCeTxsYW5jkVZ4mHPrs7/nXJeXjbmPEVcmHT/K3HxUAGI8HHttCUHAei0ewWE9OXd7BfRQYRLKVdzLoQKF9nMLuZA7y6PLM1BVsorxyr/1qkg4FUwopj/ajSnPf8jwlKlXGdaeij3l5ylvMI2zgcj8JiGvvBPprkxvjDZOVQo+jMT6MXWsjbK7i8l5yIv/q93mdYf1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSAkpewS/T7g/TCWm/Xp18FU4aJB+e6JQoCvcrbfApk=;
 b=KEqg1PVfIGlPQB3+p5EZbEMFxjGiCvV6jKjmPYVnlWX5OkBIDp8BIfnEI9DvUfdYCmXGtpW5z7GPhc/YcuAZSGTEn0nO6VKOSeh+ugQhOOAjcsYvAOD9tjmj1PyHCxrZqj8kA2nUwbJiaDCqsV6I0YTr1TwCJ28b8Xsy5z7yFb8=
Date: Tue, 26 Jan 2021 17:21:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/3] x86/irq: don't disable domain MSI IRQ on force unbind
Message-ID: <20210126162157.3hr7yk6o2rbtrero@Air-de-Roger>
References: <20210126110606.21741-1-roger.pau@citrix.com>
 <20210126110606.21741-3-roger.pau@citrix.com>
 <7633ddb0-922b-0165-7e8c-d265786ef4aa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7633ddb0-922b-0165-7e8c-d265786ef4aa@suse.com>
X-ClientProxiedBy: PR3P189CA0043.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f711d99-304d-4242-bee3-08d8c216846a
X-MS-TrafficTypeDiagnostic: DM5PR03MB3370:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3370F2AD4C72FE65B297932E8FBC9@DM5PR03MB3370.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mONuU1SDA+HB2rA/7UrhLTmKlCZLBjcdr1yudp+BwF+vNtQ58GXHYxM15Sgio6EaFioNQWzvisDBihGwUrVh/FHw3qxmaoh1ZO4FDWg0eOyiwFB3mY8k+n6NHPNd+t50P9z/43ZdBehAG9DzA+P/yRGjT4wYC2V33ClZcMBmgj9J6RiYs9onLTYiHHDv3+VBUkqxRPtcUTjaT7egX5OETloHhQ0UeiLf3NTTmm2d93sPCJ9oRoLI9bZeF+2IeFn5nkUSV4aW6PxWmrudBYdLMEr6FmxWrPeQ95i6tqvX4okMBfcbSa99VycBUbeaiQuc3CfVA8w5I5XjyNj+wF+otXELVRLU9leOcODCDuIJzexJpxZaVtApX5LDVdeDBp5RqDpIzabfXnkjNziACMxz4o198oleFSuxgrlm563YxhCPwS6bm9ZjpMgp4So/i4cAYODXOco/Ez+y0RJuN45b8pHZj0ugZlM8Lde4SxZuMsL7c5+tQ7Hohu+0Mc8UIBfIUsyesjx4Zk4tvk+IMErCTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(396003)(136003)(39860400002)(366004)(346002)(186003)(1076003)(6916009)(5660300002)(33716001)(54906003)(16526019)(8936002)(26005)(316002)(4326008)(66556008)(2906002)(83380400001)(85182001)(9686003)(66946007)(66476007)(478600001)(6486002)(8676002)(53546011)(6666004)(956004)(86362001)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NTM1cmlWb01kbDVwQ0RCUHo4N1kwM3Ewd0ZQK2x3L1FhSW9YQU1wU0Z3dWYz?=
 =?utf-8?B?RUxWdndGcElMMHlPS3o5NzFoaW9CY3BwTnRXYkdvalBPWEFwT3kzZEYwblNP?=
 =?utf-8?B?eVBJYXFKTVpsT3NJT2paUFZJSFpQeHRZaHNKWTJRRm5aOHRNN1dmbGZuWHpE?=
 =?utf-8?B?T1ljZ21YSlNJWXVXdlFUYmdkTW83VmRVTE0zdXRKbkp6SCswZkd5NmU5MTRj?=
 =?utf-8?B?TE9vYnQ4QWptQWJCM3g5MFppNVR3RFFPVWpnNlM0QmU3Ynp1RnFqcHVHUTVC?=
 =?utf-8?B?UStBNVY5RS9qQkl5NE5CWUpLVnNvNE9JRm5PVVhUM2hLbFRFMXhXQ3Zaa0NV?=
 =?utf-8?B?RTBWelpXNm03aklNa1lNY2dKZEQyOVNFUFNpOEYrR0p1VGdrUEp3Yjkya1Mx?=
 =?utf-8?B?SWhuT2xLMm9INEQralNTV0w1U0RhN3psZ2d4RGJwb1MzTW82Q0xCT25CdVd3?=
 =?utf-8?B?bUVNV3dwMjA5a3ErcndyNWVwNzdDVGZHeHZBbEk4MVo5WExyKzB0N2YrY3lL?=
 =?utf-8?B?R0RVOW93MmhjV3NBcDFRMHJ3Q2trbFN4NjhqeXN2cGFwUTl1T29NbER2NlFm?=
 =?utf-8?B?ck5ZWXV3bnhSaHZ2TVc2cXIvUjdTTkROMUlKVDlXNnFsbGZWY3FTcTFaazV5?=
 =?utf-8?B?ZGlRVHdXSlVJcEhhTUVES3c3RzhKNnJielNxL2JreTBVK05aamdXSlVpa0U5?=
 =?utf-8?B?N2kyRGpmVjd1Z2ZwMlVuYmlUQTdOaUZ0UmEweHVtV3FTYklZeVJ4VjBNaW1h?=
 =?utf-8?B?clVTbDdYY2FBSzRXT1VFZmYybzIxWHM0V05DS1R1OXpvZkZMN3VwQ3NKTzlQ?=
 =?utf-8?B?MzdhRHQwSnAyTXN5QUZlWFhMdU1XUXlQdEZtRnlCTTBnQWY0dUlLZmJ6dnpS?=
 =?utf-8?B?RGRSY1lidDVkdHJ5Y3YyTDZMTjlUVkozdFBEOE96WnY2L0dxR3M1NEl3MVUz?=
 =?utf-8?B?RlF5R2dJcVFHOExGWURPb0dmeEJCdFd0QVVhTFNzcGl5dVpQRkV3T3E5aUgy?=
 =?utf-8?B?YUJxOWQrWXlyTmhwVUkwTGx4b3pHSlFWMkh3VDVPSnhOY1lKYTZrT1dTNE1W?=
 =?utf-8?B?UGR3Q21JVnU4NUwrM2RrS3BxdTBoQ2Q1Zy90bzd2ZWI2RmlFcW5JQmd6a2hy?=
 =?utf-8?B?L1BLazRaQndXQ0Vwd0xUMk1wQjV1THRvYkdsRXVLcWt5MW1zZWdNWi9Pb1Nk?=
 =?utf-8?B?MEh2aTlmZmRqa0JCYUo4UWtpNW16R3dLM0tuQW80NTdBYWpYNXZuc1ZqbVlk?=
 =?utf-8?B?dlAxb0NzRDNMTTcvd0pZVk84R21tOUQ0aFk1a2tNQWJ4aDdTTnMyZW5SY0xK?=
 =?utf-8?B?d1RhTzJXNFhkQ1hNdi9uNlhzb2dzbmJFai9aSmxaTFEwQVdiZm9Gd01JU3Bh?=
 =?utf-8?B?WDF2c01uSXI5Wno0MkdRcU1sV2gwZ1hWMmo4RDVuNVJlYWtDWEFPNGdUYWNa?=
 =?utf-8?B?MkhWL0w3MmU0NUdxcDIydHBGTFprV3B3ZEd2NHZnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f711d99-304d-4242-bee3-08d8c216846a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 16:22:04.1464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0q7u04d/OmztWk1vEzwiU40a8P0xkXl3oX6a0bdFf/Inxgl/jv+PbLUHioG18OfohQ1BtGcf8Qf0cL+ncXAOsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3370
X-OriginatorOrg: citrix.com

On Tue, Jan 26, 2021 at 03:52:54PM +0100, Jan Beulich wrote:
> On 26.01.2021 12:06, Roger Pau Monne wrote:
> > When force unbinding a MSI the used IRQ would get added to the domain
> > irq-pirq tree as -irq -pirq,
> 
> I think it's -pirq at index irq, i.e. I don't think IRQ gets
> negated as far as the radix tree goes. info->arch.irq gets a
> negative value stored, yes.

Right, and this then prevents the IRQ to be used at all by the domain.
Doiong a domain_irq_to_pirq with that IRQ will get -pirq, but that
seems pretty arbitrary for MSI IRQs, that get allocated on demand.

At the end of unmap_domain_pirq the IRQ will get freed if it was
assigned to an MSI source, and hence it seem pointless to add irq ->
-pirq to the domain irq tree.

> > thus preventing the same IRQ to be used by the domain.
> 
> Iirc this (answering your post-commit-message question here)
> is for cleaning up _after_ the domain, i.e. there's no goal
> to allow re-use of this IRQ. The comment ahead of
> unmap_domain_pirq() validly says "The pirq should have been
> unbound before this call." The only time we can't make
> ourselves dependent upon this is when the guest is being
> cleaned up. During normal operation I think we actually
> _want_ to enforce correct behavior of the guest here.

OK, so that might be fine for legacy PCI IRQs, that are fixed, but
quite pointless for allocated on demand MSI IRQs that can change
between allocations.

> > It's not clear to me why we add the irq as -irq -pirq to the irq-pirq
> > domain tree on forced unbind, as allowing to bind the irq again should
> > just work regardless of whether it has been previously forcefully
> > unbound?
> 
> To continue from the above, see pirq_guest_unbind() where
> we have
> 
>     if ( desc == NULL )
>     {
>         irq = -pirq->arch.irq;
>         BUG_ON(irq <= 0);
>         desc = irq_to_desc(irq);
>         spin_lock_irq(&desc->lock);
>         clear_domain_irq_pirq(d, irq, pirq);
>     }
> 
> as the alternative to going the normal path through
> __pirq_guest_unbind(). Again iirc that's to cover for the
> unbind request arriving after the unmap one (i.e. having
> caused the unmap to force-unbind the IRQ).

Oh, so that's the point. Do you think you could add some comments to
explain the indented behaviour? I think I get it now, but it's hard to
follow without some pointers.

Thanks, Roger.

