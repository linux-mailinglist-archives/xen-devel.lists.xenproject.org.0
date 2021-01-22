Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 136942FFF8E
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 10:54:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72643.130849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2t91-0006vr-42; Fri, 22 Jan 2021 09:54:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72643.130849; Fri, 22 Jan 2021 09:54:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2t91-0006vS-0e; Fri, 22 Jan 2021 09:54:19 +0000
Received: by outflank-mailman (input) for mailman id 72643;
 Fri, 22 Jan 2021 09:54:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=33kp=GZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l2t8z-0006vN-1y
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 09:54:17 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a366efc-cb44-4107-87fd-dd23764a0678;
 Fri, 22 Jan 2021 09:54:16 +0000 (UTC)
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
X-Inumbo-ID: 9a366efc-cb44-4107-87fd-dd23764a0678
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611309255;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=GNEM9/5Kv4z4VxXEy6yw4ILsdqm+7SZA6t3C3nB9r1A=;
  b=CPghsWAzqr8mcsasOPMaycUXpr/BAvoXhwWNI69qyN4F/nVXO8QOwbof
   QxmOdvoNNR8PGGLBfMEukQAIUvOyQRErUpD+fqKx69O8V5B3s90jrtTsP
   3PMS8B7Ow6BXarV9aPyxb9uLHFrXYeVTiy9vDX2ifG8dokKP30SYIXQgN
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: hPSdI10242pBuke8azkkDUqtxupHxuqXPEGpUJyDnzL1h5ZuadHaY72v4pZ9HagJ2cLJqj1sti
 HP7UyauyIYo9Umiwvkx8sj2KHSjXK32K3f0vSu3Y5GQg54/+tWP9NbaWyh3W+u8mLBl8HV2P4O
 Y8q+iK9sk20rrOpMPxdJopfEQyh9L6sXuZ6S6jmHbu8qIPunnatH+IAg8PVmbiHoSUjmv2jlHH
 YreCAqOeEcQQ9CSK7vwDKW+2wucEoRrv4TeGUgjFFJETjXjx6ka7++St/7Wglw2q1ARwn/IMaA
 McQ=
X-SBRS: 5.2
X-MesageID: 35691370
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,366,1602561600"; 
   d="scan'208";a="35691370"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J6JHjZoUPX5yjfKtqTkQmqsWN+fIqGA2MoH6S7ODGAMJHdl2Sjw7tHhwGXx5GGQmDZNne3PiWkxZRGu4TZjHN3Z+w21E9nbVQgvJUWq5cd2B9rVN2U5V8s/Z7RdyM+GfUiX8Bhp13ZGmeRfl7VFwV5GGTjlVMyNfJracbIq0fb69av0U8LnYh4STPnBLb9XLzi+VTJwiqOogp3YDy+jbQxafqQRR1zVjrT4wl/0RswSI2IMiQNrIgRcESXoQLHfPR64O9OM16vzsc7tlK/Y0GrUDg12qLOPkmg1pr5J7LweJvUTXTb8Ic3i3sBPZleSlCiEQdyB/BHWUxcw2XshwWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StaYakex4ChFniSU5+J55tJVinzfJJSjV/QM0hY5Ctc=;
 b=KXKoihm/oFo7iiZBLtZoO7Bx17bzqDgi4KgkIXQOXy2zZOPKHTjquvvB7s5P81yVYQ76wl6EpBniclPw13bgaFcZVZv6HRlElgqm9A4Cz5slfGLB9wBeG9cvQglOxUQebe0Xdby98Rk+83FGyCdRnJiRbyPYHbDF/789GHTgX1Gh64eHAVqUG/pkIROwCTc/Gk9Ol/M1R7deqfqXi7n48hwgJPAy8LvfavdKLZ4vY9f/3H6Mu2XhlfCFSZstvWGKOfo9IQo67/AjkzuoMY4D0aKmQ3N200PCEnbTJ6Yv8bN9ZE67tgfxLvT9y4GKvZE4Fz+EGte8KEXfncJD0vrS8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StaYakex4ChFniSU5+J55tJVinzfJJSjV/QM0hY5Ctc=;
 b=iIkf+0CHf2s/8y/RTof8QA3beyZMU3kid1tEReY9m6Nc1rH6m9Dt4A9TZSVzCc7T4299zSpEN2Ech2rdkltXAU74HN58MldIzsZKoQcvrTq8+HGEcXPWQASIsKWAVZsrvRFH0g1YbrkKQcVF8Pc4UT9KRY2j821kfpirKojmToQ=
Date: Fri, 22 Jan 2021 10:53:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/4] x86/vpic: issue dpci EOI for cleared pins at ICW1
Message-ID: <20210122095354.c2ft7776poj7dusd@Air-de-Roger>
References: <20210115142820.35224-1-roger.pau@citrix.com>
 <20210115142820.35224-4-roger.pau@citrix.com>
 <2ebcf745-cee2-b90d-9983-42c7297c7f3a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2ebcf745-cee2-b90d-9983-42c7297c7f3a@suse.com>
X-ClientProxiedBy: MR2P264CA0158.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb1753c0-dbd9-44bb-0d97-08d8bebba4e7
X-MS-TrafficTypeDiagnostic: DM6PR03MB5289:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB52895BD5216AC06F36183CE08FA09@DM6PR03MB5289.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OxwnExTad1h3aMpHkWaycbDcEmg0AxXFdU+iSV1T6kcxizy0P0nws4O8wlUu0Kjce5wh2lhvGQIxj/+I1NNjKoMPhnyYjEShn7nzQx3nLIzVm1WeQGKFui+ViEGmaZewKYbVDrG5MuSzhKXeGOvdno8ri4Xw/mBSxqHEEudfgiSJJxOAKyxagB8KQWhxkSrPZYx+UNPggodMTFD3Za2CwSUWrinagzN1/6DbrKtMT0RgcwTmYzmg7Izcbo54AjXz5G3j8c7k7bDO0a+5SesUeAIMrlKcjSuzC03zdu5ggusjXMzZ9w4+GXFeCweiaXNz3ZV06u/cG8846IUW/hVpdQytgQej5qbLZf29yiSwmyRwkHFpd9dtVVWZItWUNvujHqXEp5JEE62pBVbyD+sRjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(396003)(366004)(376002)(136003)(39860400002)(54906003)(86362001)(1076003)(6666004)(9686003)(478600001)(4326008)(83380400001)(6486002)(53546011)(316002)(956004)(186003)(16526019)(26005)(33716001)(6496006)(85182001)(2906002)(5660300002)(8936002)(66476007)(66556008)(8676002)(66946007)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SHl3MWE5RmVDZnRIQzhDSWdmL1JRSXowNkpBM3AvTTlQMWJCanRsdXFNMUtO?=
 =?utf-8?B?QVpnclZrYWxBZ3NOWkxlNHBzU0hRTkJ5QnZXKyt2WkJ5eUsvS2c4am9kUUhq?=
 =?utf-8?B?aEdxOS9pNjVTUTQ4c0d3ZW52bXJkbjIrc1hteU9qTUxrVjFKYmM2MFpKaGs5?=
 =?utf-8?B?NHBBQ0JVMW9UblNtUGJzSVJNNTlveWszRE5GeDY3WUlRdHd2QjFaWDY5UDBW?=
 =?utf-8?B?RTVwSlMxS2VZRXdrOFZ5OTRqTEFoSEdVZU9ZTDFhbm9ZRHUzcUpIUjN2Z1BW?=
 =?utf-8?B?aWV5WjYydFJiM2V2SUpZQTRDUTdIM2tJNHoyNGo0anJmc2pSN2ROR0ErU1Bi?=
 =?utf-8?B?RU1IeGV2QTd2bFlkK0lQMjNROTQyQmd2S043TEhzSGhGYWpTZ1c5bjMzNmhC?=
 =?utf-8?B?QXdWdDZWcXJZYmRmKzRMVVI5N1BRWUZZWE10Z1JNRmlLRERDa21uZExQbzZh?=
 =?utf-8?B?TVlkcEFjdUpNWWZzalZzNlJnSzFBalQ4cVQ2dWprYlVubFZwaUptNFYrdHE1?=
 =?utf-8?B?ZmNDZnlFOWswMDlQY255OGFIVk9OOHhiV0FCYnVPWDJlRkhoeHdaVnVkWlhY?=
 =?utf-8?B?NDRkb25pZ0pUYUljYWZ1NXBqQXYzODZHa3VKcDNaL3JrdGNoZGtlTnRTdHEw?=
 =?utf-8?B?dDNnNTdDaG0reDVyeWovbno1Z1FpZzVINHRYRTA1UGVRRzZCdVhaS0VYRDVQ?=
 =?utf-8?B?cHMrZVVHSnBPd3NTdGNDWkVqb3Jha3kyV3B1ZiszdDFKMitoTDhnSk1yNlB5?=
 =?utf-8?B?L1pmSXRqeWhHM3BLWGs2V0xvd2VKd05QZVVldHhYRCtteG15Q2RCd3l4RGpI?=
 =?utf-8?B?bkRMNGsvcjFvallOemlFYlpVZEt5SC9yMzBnc1I2eXhuSHFDdUljSldMV0Ni?=
 =?utf-8?B?bTNoUU9IRUlDUk5BRnVSTTMzUGhoZ0xta1FkZHFBM0NLNHVUcTMzM3dxaHhR?=
 =?utf-8?B?bHpWSW53VEw4Ym8xeCtpcjh0Y2FnK2xjc2FBdUFvV0FQNGRQZWk0Yzl3NTQ4?=
 =?utf-8?B?NUtBV1dxUkd6Ry9ra2IxaUVsN0FadEowVmI0NVBTeDFteU1JRC9vb0Z3NGdG?=
 =?utf-8?B?ejgvcm9CalFjM0hYSzQ0c0RYOVYrVUZvZHNscTNjYXJ4c21waXNCWkM4aUhO?=
 =?utf-8?B?ZitiRDJML2NDMzRIajVlTFhkUzZQejdOM2ViUFVFZnBPRnpDWFhmSDNvK1Z4?=
 =?utf-8?B?TkxZZ2tGQ0NBeUdxNkVmM0dySWg1YmgxcG5UbG5SV1BCUm5hY0RMcnZ4UVpm?=
 =?utf-8?B?ZkhkM2drM1pXRVlOQjZWYlhVTkllb2dlcFM1S2xuK3craC9POUFEWnZBRE1o?=
 =?utf-8?B?cHNYOXRuVFZKeXNTN0dTUlRTZlpCM21ydUNKQlB4L1pTcnhJSzN5L01pbUFV?=
 =?utf-8?B?dWo1WlpOUVNjSzFRRjA1a2ovWVd1M0xRazYxVE9wZHJqRDQ3UnVrRWcraStY?=
 =?utf-8?B?RE9KRVJlQTBoVHhBd1JpcWc2K1hUZk9VS1ZVcU9RPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1753c0-dbd9-44bb-0d97-08d8bebba4e7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 09:54:01.0002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oA/TFZBqG0Ven9+QugrHVM1zT8ULJiR5Ebg21JisreoAQizTWK9GUdJsS4/+ncT2v8XAV0sSL8w2qD25ugYpJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5289
X-OriginatorOrg: citrix.com

On Fri, Jan 22, 2021 at 10:02:15AM +0100, Jan Beulich wrote:
> On 15.01.2021 15:28, Roger Pau Monne wrote:
> > When pins are cleared from either ISR or IRR as part of the
> > initialization sequence forward the clearing of those pins to the dpci
> > EOI handler, as it is equivalent to an EOI. Not doing so can bring the
> > interrupt controller state out of sync with the dpci handling logic,
> > that expects a notification when a pin has been EOI'ed.
> 
> The question though is what this clearing of ISR and some of
> IRR during ICW1 is based upon: Going through various manuals
> (up-to-date from Nov 2020, intermediate, and all the way
> through to an old hard copy from 1993) I can't find a single
> mention of ICW1 having any effect on ISR or IRR, despite both
> soft copy ones being detailed about other state getting
> changed.
> 
> There is "Following initialization, an interrupt request (IRQ)
> input must make a low-to-high transition to generate an
> interrupt", but I'm afraid this can be read to mean different
> things. And if it was meant to describe an effect on ISR
> and/or IRR, it would imo be in conflict with us keeping IRR
> bits of level triggered interrupts.

I have an old copy of the 8259A spec, and it does mention the same
quote that you have above. I also wondered while I was adjusting this
code whether what we do is fine. I have to admit I haven't considered
changing this logic much because I don't have an effective way to test
it.

I've also taken a look at what others do, QEMU for example will do
exactly the same logic as Xen during ICW1, bhyve OTOH will fully zero
IRR and leave ISR as is.

Doing a bit of archaeology in QEMU I've found the following change:

commit aa24822bdc7c4e74afbc6fa1324b01cf067da7cb
Author: Jan Kiszka <jan.kiszka@siemens.com>
Date:   Tue Jan 24 16:29:29 2012 +0100

    i8259: Do not clear level-triggered lines in IRR on init

    When an input line is handled as level-triggered, it will immediately
    raise an IRQ on the output of a PIC again that goes through an init
    reset. So only clear the edge-triggered inputs from IRR in that
    scenario.

    Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
    Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>

Which seems to point out there's a reasoning behind what it's
currently implemented. This seems to be against the spec as there's no
low-to-high transition?

> > @@ -217,6 +219,24 @@ static void vpic_ioport_write(
> >              }
> >  
> >              vpic->init_state = ((val & 3) << 2) | 1;
> > +            vpic_update_int_output(vpic);
> > +            vpic_unlock(vpic);
> > +
> > +            /*
> > +             * Forward the EOI of any pending or in service interrupt that has
> > +             * been cleared from IRR or ISR, or else the dpci logic will get
> > +             * out of sync with the state of the interrupt controller.
> > +             */
> > +            while ( pending )
> > +            {
> > +                unsigned int pin = __scanbit(pending, 8);
> > +
> > +                ASSERT(pin < 8);
> > +                hvm_dpci_eoi(current->domain,
> > +                             hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
> > +                __clear_bit(pin, &pending);
> > +            }
> > +            goto unmask;
> 
> A similar consideration applies here (albeit just as an
> observation, as being orthogonal to your change): A PIC
> becomes ready for handling interrupts only at the end of the
> ICWx sequence. Hence it would seem to me that invoking
> pt_may_unmask_irq()

Right, it might be best to force unmask = 1 when init_state gets set
to 0. A spurious call to pt_may_unmask_irq won't be harmful anyway,
even if no pins have been actually unmasked.

> (maybe also vpic_update_int_output()) at
> ICW1 is premature. To me this seems particularly relevant
> considering that ICW1 clears IMR, and hence an interrupt
> becoming pending between ICW1 and ICW2 wouldn't know which
> vector to use.
> 
> Or maybe on that side of things, vpic_update_int_output()
> should really do
> 
>     if ( vpic->int_output == (!vpic->init_state && irq >= 0) )
>         return;
> 
>     /* INT line transition L->H or H->L. */
>     vpic->int_output = !vpic->init_state && !vpic->int_output;
> 
> ?

So to force int_output = false when in init state. Seems reasonable, I
can implement this either as a pre-patch or a followup, but again I'm
not sure I have means to properly test it.

Thanks, Roger.

