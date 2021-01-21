Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 571292FF248
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 18:46:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72302.130068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2e23-000654-R6; Thu, 21 Jan 2021 17:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72302.130068; Thu, 21 Jan 2021 17:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2e23-00064f-NP; Thu, 21 Jan 2021 17:46:07 +0000
Received: by outflank-mailman (input) for mailman id 72302;
 Thu, 21 Jan 2021 17:46:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aMxC=GY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l2e22-00064a-Ns
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 17:46:06 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b38d3f79-04a5-48d3-8fc7-47e229e5bfc4;
 Thu, 21 Jan 2021 17:46:03 +0000 (UTC)
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
X-Inumbo-ID: b38d3f79-04a5-48d3-8fc7-47e229e5bfc4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611251163;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=fiUzy/F/+ecZGpAUhDioXddsqcI8H5S+67f02K1UvzU=;
  b=AkCBCw/G6zMQuy5fuQ6CpdX4xx7a/4jLdBEuEU9y1UpC3Sd//OpYKnTY
   q+17mLUT7shUyzkG4ffyE+7oSyG4P/GhdOR+zGpGS/+1meNSdsQhUaoBY
   CJ9iNhqNzLJHDx+hscztix3WmhNE5bQmjmtmGuHR/AHr8oARpF0y1J97/
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 2YKz+afmc0wiNkcd48AftRlI8n5xxblBJZUOm1xCn2+HkZnwPfgEPxWig1Po3g/nASm6rqEc4r
 umIJpBdONue0E7Sci3Q6PvObAnAcJUqkLPp9r9qeooPOKgdkKW6V0RNLt9sBLUH4+HwVRinx74
 WL23QrhuhFuk8HLFe/jaDwgs1UIoZAnFOh7Dj5V2ET7l4kA7Zrtwd8utNql2ka+uOcklfizK+J
 dmiDtopd1QCHLiok3vS+2CXgdSa3xGrBUPbvP5/+EMpon/aTjGKg2a7XB28FchMJJwbo7hAFID
 zbI=
X-SBRS: 5.2
X-MesageID: 35580457
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,364,1602561600"; 
   d="scan'208";a="35580457"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TfkLZ2xQ2/Cpr5lmU95x5HEqQDT1VKvxgOsCVWNf9enn6Z+Ve0jRff4Pke0fM4hdtdMtx3onqptqpgYVn0Xkz/+hKBtXCnAdd0WZy0z4JmzbFhTZmNxu7Bt/aTqb7TaFoFbOBhiGvU4VvLJ+nrO1OSNZ6OLqMxEz3Gfqfvq7C3AD0dTR/N2BUVrzfC8tyaxhRUu3XA7y1tLETj+CFE3XTzQP27KnhDkg2a1Xw6UuvUl6AR13OKr0m3p2aiht46QkE0EijO9xa72u4RuYRK1kEiCxLWCmWBaGM2Iwcn4gbGlG67hrblTROwLh5vF4rp/QGWyBfF1TXVrVPU+4GSo/+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ChX1/SvbxOz/orZGYfaGZm60eftD+Fv4pS0hWjcpRpc=;
 b=T93lprlBWEcXRXrYRFqzyvQEVerw56tb8zkBqRr7QheGDvDTWU1uq6i18VdcGTY6yy+5NwmiLF6LXvHcVUfjapzqErABh3prk7FvR83AGMOoGuYyjem5yR00C19lkU/B5K9wTTN6v67BCqOijmiM3aUksfnk6DOEIbzxD+Wg7GF8WNmHPHFlQDOZzgEqBhyiD/6VXgv5wv2X0IexU57Ov42CLCeurSdMXzh4Pzcmkkb1h/gZX7PgoWvxY2Df2X/5MKXOb0aEi4wcfRsWAYI996BfnojCqq+Oyh8bNFqfd6D8vmMEelHDqg3nvnj5GiR8ilckFkfPJHlSrKfYbivGWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ChX1/SvbxOz/orZGYfaGZm60eftD+Fv4pS0hWjcpRpc=;
 b=Q8AiAg38Kte6ApJgPnOAPmdTQ6Th/4E5E/yC8vnTqklrOVYjxJrcvPV3IrwrkyaT8ONMY9wUn5Vi3vR7tt34oGpuBqPP1oWSE2f9YO9n7+LCDr5xsV9mKZiR2XScVmXQJq6LjWrxf5SctLKdpwWakKTQdiuREe6TqaojJ4wHOXE=
Date: Thu, 21 Jan 2021 18:45:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 2/4] x86/vioapic: issue EOI to dpci when switching pin
 to edge trigger mode
Message-ID: <20210121174554.emmefqoykw3brozr@Air-de-Roger>
References: <20210115142820.35224-1-roger.pau@citrix.com>
 <20210115142820.35224-3-roger.pau@citrix.com>
 <3e6652f4-693c-cb03-a5f1-bf90e0f83253@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3e6652f4-693c-cb03-a5f1-bf90e0f83253@suse.com>
X-ClientProxiedBy: MR2P264CA0154.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53d29f01-a040-47c5-3c04-08d8be34698e
X-MS-TrafficTypeDiagnostic: DM5PR03MB2778:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2778C84F53229CB0C3A95AF88FA10@DM5PR03MB2778.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q5EKbXfysbakqpZmQgA6RlyJD0URAN8w3NMDbfPToQoP3EdzxyLji6G+uu5SJi+NtraEZmaDd2ll2QW1Xu9KsfIhN+ezePvAwohghATb7P7YR8W6u9aEUzHatUgoPZX+YQMKqsUN6EEgB18HyWq+BLprdR648lDdZOPM1t7Tt9pjx8g5YjaXfCqlb6SDgjPKruwIeDE1A981Vmi5VCqKlwRDKdc6HjNl6dOOwn3uvnekziwV6WI8kWdQMEr7T9j5vTK2T12KQCBjgGoqzvkB59Q97WnCedFRZaEsoHRuwHKf6r3i9kNI9sYgbtA+z4crZQKHMSmhkukNaFcZnpGt5LUg7JR/9cbe3/3geJZ4Y+PrzjB7JfNrzeXww9uQGPaxKtb+Ad7ETdeIPEH399bhdxXsECq2GLSGbYzn15+t/p5Sb3NAM0zMbS7Js6XzImk9TXqKFrKpS44evIekw6cdqq8jBiGUuQkQwCkY48E9svrj1QEfr8jh1uZ3hCnFq+7GWJP+P4my5HuRmf2+32jvoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(136003)(39860400002)(376002)(346002)(366004)(66946007)(186003)(6496006)(6666004)(33716001)(8936002)(26005)(16526019)(66476007)(6916009)(1076003)(5660300002)(316002)(6486002)(956004)(478600001)(8676002)(4326008)(53546011)(54906003)(83380400001)(85182001)(2906002)(9686003)(66556008)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eEdpbUVVUmc3V3NFVnEyeENJU3V5OUVzWGxZdjJDMTNWcU9LWE4ybkhxWWtJ?=
 =?utf-8?B?OVZJVi9SNHBuNTZvUllrZlJRU3FtTkFSSHdtbytKZ1gwNDVyV2tTYW15Q0dV?=
 =?utf-8?B?QzJ1UldaSm9RSmtWRGYwVzgyYnBLM1lwcURLZWg0YWhWdkxRVGNhMHIyNEJQ?=
 =?utf-8?B?d2JMM3kzazFZYWwyVDZpZTl6WXVGUTNPV0d1eTRSZGEwbXlZa2ZmUWF5VjBr?=
 =?utf-8?B?QnVtb1JpNjhLbldCYmFISTZ4bmJKZmVuNE1ZUmJoWUE2aHAxZ2VJQm1vUEpZ?=
 =?utf-8?B?dXBKMDNGVGZLc1M4N1h3ZnJtNWRaRHRFei9hdGNIa1BNOGhTVHVOQ0tIWlVK?=
 =?utf-8?B?am1YWHVkWEd3Z1paNVl0eTBrdUhZRERmS3BiYzdiSXdxNHQ2eEZwRWoyNXA3?=
 =?utf-8?B?WE41SlV2U1A1MjZObGNHUlhVMWEyRktQYyttZ0hZQ09SM2NqVDhhODBwMmsx?=
 =?utf-8?B?c3VyWnN1enM4ZS9oUEVzemJZaEZvdVhuWUxvWDNKQlhFUlBwU3NOWjk2OEhP?=
 =?utf-8?B?WS93WjdoU1ZCRjR0cWwxNE1iS0JoSlcwS3pRaFFKQms2NkxKdUtCQjZsWTFD?=
 =?utf-8?B?Zzc2SG9JeTVkemZTdmdMclJmeDBKTWtqc2NZV0V1c2Q4bDFwcWt6YVA0N3pB?=
 =?utf-8?B?cXRDdXhjRG5oTlNkNzVBVG1kQ2ljY2ZubE95S3gxSlZBcHFIMmpUeTF4SWVI?=
 =?utf-8?B?a2ZDY0tMcXZIZVV3cVpmdlhqd2pKWUJ2ZFRrZjBRRGZKcG5mOFlsdWxNTEFV?=
 =?utf-8?B?U2JiZEp4L0NLWGNXMmRYUkpOWU4veUVFVWhISVkrREZpUTRFOXRoOHJNUXBB?=
 =?utf-8?B?R3VaNGRmeVF5aTF4NUJ0T09NbjZRVzIrUlZoMk8yZXpQSzhuS0dreDZnNFdi?=
 =?utf-8?B?WEd1ZDBGTUNTcVIwMmEyZnpEOVQ2dDRYeURxa3BSODdzT1NEYzlEdG5zQUsy?=
 =?utf-8?B?Tk5ITHZ2ZWxJQUVIN2ZCVFREbWpQRlF2dUw0RGxCUVVac0dGK0FxcEVJais2?=
 =?utf-8?B?M2tJaWJidVBnNmVTZUt6OHpUNk1tQzNvcUtDY1c2ZkZ5ZXBhNGhINk1VdGRW?=
 =?utf-8?B?TDI3d3FmVVJscmFZanlHeTZBY21mdDI2M1BSUTdUamVpME9JSkdKenJreDF6?=
 =?utf-8?B?bUQ4azNTWGRla2thNitVSWRDNlJUazJqS1kyOWlMRUxQWFhhb2pXSldvTGVG?=
 =?utf-8?B?NkxQVFpTRlF3VjZ0OTdFcU5QQVR3K2w1cVdDMS90L1JqUVhmY2xkb0RwR3Rh?=
 =?utf-8?B?Mm9GOWJyQjRrWWREWHlqQ2w2VXRBakY0Z1pPK2l5NmROUWZ3MXNWZHVNUzBw?=
 =?utf-8?Q?I/lvPmybegkN55QSUJ5L5nxXJvd7z5v02m?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d29f01-a040-47c5-3c04-08d8be34698e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 17:45:59.3860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZSSwaWHeqfRN8jskubMxXhZ3V0yFt8ElLiSAmVJctCbn/otMEfUDPkXThQV7nQw46LqfOniX98iQlXOb/K7VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2778
X-OriginatorOrg: citrix.com

On Thu, Jan 21, 2021 at 05:23:04PM +0100, Jan Beulich wrote:
> On 15.01.2021 15:28, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/hvm/vioapic.c
> > +++ b/xen/arch/x86/hvm/vioapic.c
> > @@ -268,6 +268,17 @@ static void vioapic_write_redirent(
> >  
> >      spin_unlock(&d->arch.hvm.irq_lock);
> >  
> > +    if ( ent.fields.trig_mode == VIOAPIC_EDGE_TRIG &&
> > +         ent.fields.remote_irr && is_iommu_enabled(d) )
> > +            /*
> > +             * Since IRR has been cleared and further interrupts can be
> > +             * injected also attempt to deassert any virtual line of passed
> > +             * through devices using this pin. Switching a pin from level to
> > +             * trigger mode can be used as a way to EOI an interrupt at the
> > +             * IO-APIC level.
> > +             */
> > +            hvm_dpci_eoi(d, gsi);
> > +
> >      if ( is_hardware_domain(d) && unmasked )
> >      {
> >          /*
> 
> I assume in the comment you mean "... from level to edge
> mode ...".

Yes, that's right, I completely missed it, sorry.

> But this isn't reflected in the if() you add -
> you do the same also when the mode doesn't change. Or do
> you build on the assumption that ent.fields.remote_irr can
> only be set if the prior mode was "level" (in which case
> an assertion may be warranted, as I don't think this is
> overly obvious)?

Yes, IRR is only set for level triggered interrupts, so it's indeed
build on the assumption that a pin can only have had IRR set when in
edge mode when it's being switched from level to edge.

I can add an assertion.

> Also, looking at this code, is it correct to trigger an IRQ
> upon the guest writing the upper half of an unmasked RTE
> with remote_irr clear? I'd assume this needs to be strictly
> limited to a 1->0 transition of the mask bit. If other code
> indeed guarantees this in all cases, perhaps another place
> where an assertion would be warranted?

Indeed. I don't think it should be possible for a write to the upper
half to trigger the injection of an interrupt, as having
gsi_assert_count > 0 would imply that either IRR is already set, or
that the pin is masked when processing an upper write.

I can add that a pre-patch if you agree.

In fact we could almost short-circuit the logic after the *pent = ent;
line for upper writes if it wasn't for the call to
vlapic_adjust_i8259_target, the rest of the code there shouldn't
matter for upper writes. And the i8259 target logic that we have is
very dodgy I would say. I have plans to fix it at some point, but
that requires fixing the virtual periodic timers logic first, which I
didn't get around to re-posting.

Thanks, Roger.

