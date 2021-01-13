Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7272F51B6
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 19:10:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66674.118508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzkb9-0007t5-Pe; Wed, 13 Jan 2021 18:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66674.118508; Wed, 13 Jan 2021 18:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzkb9-0007sg-Lu; Wed, 13 Jan 2021 18:10:23 +0000
Received: by outflank-mailman (input) for mailman id 66674;
 Wed, 13 Jan 2021 18:10:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nR66=GQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kzkb8-0007sb-1M
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 18:10:22 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba54f4bf-2cba-43ea-8c7e-427cd699527f;
 Wed, 13 Jan 2021 18:10:20 +0000 (UTC)
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
X-Inumbo-ID: ba54f4bf-2cba-43ea-8c7e-427cd699527f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610561420;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=mPkzgTc9FVyOUZx2jAL5owxq73EFt2bnclD47DKbmdU=;
  b=GOpJ7+a4KBt4qjtNNeCjkBehc3wkQytTSmxvETptTvzD0NJMRX/rYCg7
   1sh8s2DhbunO9fBnQIrb9K2ZHE0xs2V1kIBb4F391IaADEDKSr9juXQe/
   oqGLUb8xKyjq4GoaBatdShFpKeP8dmOrgg1iK1xEqhq15Yx88TcBajm02
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7K6gGkA8DouezM5caS3ZmrsJ9eJIeSgKsLBKH0zXcsi5283J3S8bFimWTpJCuTABUUfAG2TEN+
 aARLLz5FBmT1E7g66ylzavHt5gR4ZLDoUxWk6DF6ZhTw0KvibwXy2foiuXTY+Mx6sDSA30W/W4
 kGBAHBc6k5yFEGoP5bRr0TBm/p1f79EjnGlZw8N7GZ8nf5Zs4iWTgwGiiQk0CLzysqYnZsGeBc
 D434jDNzQsZqWVDghQlw9xT4bfFkVVYQl3T9kfCvcNdH9kQgS1HAfAtLFxFYdetWs4WcS2uXJZ
 0SI=
X-SBRS: 5.2
X-MesageID: 36316458
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,344,1602561600"; 
   d="scan'208";a="36316458"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdX+RLg+zi5EM/NxoyowLIrLGuOIgiRmR9LAweUjaNPNx8LpMGR7qssm6FTQ+wFPQP6t+ooV+tKwixX5S5SSUDUQO2weUEYuAbHTW8wNAjuipx582spNdnKc5f6FvFDcn4l76gcMgA0H73oB3T22rcsCJjrYCndoCIois0LRXzwFo2PgJF8iX6MsQF/pizCd64iMuOlo4gCxkoNkRNaAxp1E2DTZE0Pj9XOmil4bc2KUiExVYQrYraJx3KklaIAzA0Q9X9w+fl6OSRS6+25ZqgfxE8nt7vNP5jFPsK0hzmD0WWQ5vgqCgKI5gW4BvdC6JrNVcgUgdQn75VEB4bXUNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bANpv8rdVTh0es4gCpFv7kLEh674qA+BIay3iG06Ubk=;
 b=lCluLjjhMg845WFeAEiZPG2FJV+t4XC4guMJB73I8sMCQjnupLICMdT8OkrjPtpNNz4FuvKWSXfgGzdY4pUhJXZcYtp4yUAvIj3JV0rvzcU21Ey6EkpAAhmWimOVfY8I6PG9MmGJXIMWnMBkTCnWWyURmxn1RYPkWlUZWTEMI/A3QrJR7/sxqceyrkvGnmbyaqrE1bcnRT1ABuDTqc3rr2QDX04tPerJcXVG38ok8anfNypkWQ0dVLpKY5gI2ggNNhbhvUVojggX4MrX/fKSUhlBF/+ILLRkfywfz0AuIMah5Ao8h5HGm3oArA3LPaK7bCAFVbXDwT+GNpftwi9edQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bANpv8rdVTh0es4gCpFv7kLEh674qA+BIay3iG06Ubk=;
 b=jkbJ7JqzvumCxzbCwmsYwlEO/UQni+s2cF7QEUMakqLUsd8L2u1d/8Dpw6yiu7loRK7LMETRW/ptoZwi3OYXYPKTymcyAoswYh9soXgtFWJae8khIhnWV/eneZsL1HWlNQvxUe3VKjnrGKVJdLRdV0qDKtLWGjC4RMWjwJVKsr0=
Date: Wed, 13 Jan 2021 19:09:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, <amc96@cam.ac.uk>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>
Subject: Re: Inconsistent console behavior during HVM direct boot
Message-ID: <20210113180951.zqna7y5udx37y47q@Air-de-Roger>
References: <CABfawhkNt+rvUZXtcc9BT4Rtf+kt-dR-LPfSt+Aj1o7ACWnfHg@mail.gmail.com>
 <20210113131809.nawfnyhrncojhfpo@Air-de-Roger>
 <CABfawhkPNs=yV999rSPOgSvpi6OKSzUs3GsFEvT=iVxYKFBVOQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABfawhkPNs=yV999rSPOgSvpi6OKSzUs3GsFEvT=iVxYKFBVOQ@mail.gmail.com>
X-ClientProxiedBy: MR2P264CA0030.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::18)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0049857-73b0-45d0-da94-08d8b7ee6f8a
X-MS-TrafficTypeDiagnostic: DM6PR03MB3835:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB38350EDBF96373E0EC573EF98FA90@DM6PR03MB3835.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tqGjg782cB8OtLsYH2JpHHj9gtwSWrUWvRS45um+HwqLjFaWYDEpBFAWEypb4LXQ29U5v3nc/PhmD/DjbTRPisYm4mWQUmRh/HXmm42z0yIGFONBlIkYb9CcQP9DNGedh8lirRqHH+vChCUJrS4OeZ04TxdzjGnW/PpMb8l4ABR56skg1kOfZyWEt7Y10rCtv/096j5r5Ss9KdXLIshUSQqYub62GUnwb+nF6qGCZeLelmPGB0RxuDWXCOWfpfNksE3fS2IunLGD5QbxTI2z/mAyLCS45ekplsHfCPzKoZpokw4PAlqd7Z37+nRIPLeBba/bUS6cQGl06zll0AGhNm7hNF4wd1bKuSn88DjnB4iRPxCJMCyZKTkHgkN37PrnlNoGaWGX45Ea01iFZmTY9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(396003)(136003)(346002)(376002)(39860400002)(54906003)(8936002)(9686003)(956004)(316002)(6916009)(478600001)(33716001)(107886003)(4326008)(6486002)(53546011)(8676002)(5660300002)(83380400001)(66476007)(66946007)(66556008)(1076003)(186003)(16526019)(26005)(6496006)(6666004)(2906002)(85182001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NC95MXI4Wm1nV1VvZGFMMXBKOGFUUjY2MjhiQ0lwVVRlV0dPQlY0cFEwS3lq?=
 =?utf-8?B?RVlVV2liWFdZV2twZ2ZHbitwMFd0WmxmRk5yajljNEY3WWNxam5nNXM4UjZn?=
 =?utf-8?B?dkRKdXYxUnZIT0dSd1cxMzkwWk1wQnZaMFlSMTBSZjBlalZVQlRqdSs5NWFp?=
 =?utf-8?B?cmJ2T2Q1OFAyVEo1U3FlZ2EwaHBtZEVlS3FtM3V1SThMbDRTVkJ4SzlVWmtm?=
 =?utf-8?B?R0ozMkplaTRzQVB1WjZIay96ZVIveUlWbWZPREhidDdVUjdpS1BIV05oQ3ow?=
 =?utf-8?B?dHpmOHF4WG5WQ0VlbTJlZ2pTTkZuZEVUdy92YUNFR0I4WjhyYWt3ekJkeDcz?=
 =?utf-8?B?b2xjMkN1bURDZXU5WHROOVNvdk5xSUtUUGh4YVdnbWQvV2RxVzE2RVF1QStH?=
 =?utf-8?B?RGlXSGJWbkEzbUZRd2psN0tFSmRodFBhV0lQWDdQSUxoWm9iOVFaNVoyQ1da?=
 =?utf-8?B?T2M2YjB6QUJxejNBanBPUlIxYVhqOWVpd2h1T2J3UWpXRVdjdkdkMmJib3BH?=
 =?utf-8?B?Mk9hellFMjE3Z0lTRjcwNmkwUlJTUXcyak52OEVnWVBXRUVYeUlBZUxOY1NX?=
 =?utf-8?B?N0ZCazJodlk2MCtVaTIvdmc0SGdlWDJZWlVMYVF5NlE2VmIyMjA0Q0ZsY0xO?=
 =?utf-8?B?eDYrRGhuVEJvYjBlT3dJMEJvUlRkQ2FrekRmUjNBM1krNDV4VVl4TDdMdGQ3?=
 =?utf-8?B?MFpBb3J3S1Y2c1c0eHlRSFhINW5jelJSSWVzNGhBWkFydUhTZVgxMi91cG13?=
 =?utf-8?B?UThqNXcyREt5SzhuNmgyZzdHamc4WWNiUEJEZEF2Q1JvMXV0dnpFM0NYMy94?=
 =?utf-8?B?SUxJYng4OWRBcEI2WmVTQjhxUHI1aTFPSDkrZ1JPVWVMNElMckd2ZklmN0sv?=
 =?utf-8?B?VmdIbkxBTy9oUGRMb1FBTVRZUTdRNmNGN0VOSm9TNVdETXJib2M2cnVvVU9m?=
 =?utf-8?B?WlpRT1dDU2pRSndhRmJPK2RoclFidWNUdno1d0dyL0NxM05FY3JsbGdhaVNU?=
 =?utf-8?B?MlAzVS9OMGhyY1EzK210RHc5TFFZUmdCQ2V6SXo2bGtYQkVjZHRhTEFTWXRJ?=
 =?utf-8?B?U0ZaUW9ORFZsSjZ4QVl2SklHZGU2UEdvODFJdXM3Wm9MYWpYNS8xWHpjaFAx?=
 =?utf-8?B?QmRnU2NUak84eUFkZWNzcytUNmc0VEl0MGtidThNY0R6RHc1NHF4VU5LVXRh?=
 =?utf-8?B?dkx5UXEyMnhkc1ZXQjJuUlNlUUM0ZjM5azFqNXR4TlZQeStEOVRDcmhsM2Ex?=
 =?utf-8?B?bGFPdEVCTTd3WFN3TmhjWVEyaWNQNjc3anRDdFg2a0EvYTc1ZEkvNGlIYXNB?=
 =?utf-8?Q?tW61jvV9LSJwSvCiPqh/HumzH/vrg27VIP?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 18:09:57.3370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: b0049857-73b0-45d0-da94-08d8b7ee6f8a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7oMDP44UzxGxYOmI+HooKB5Nt6FP7SPNHJyc3yaaS+M9oEFcvPbBaiWC5mX/zWE1KjPYLE5vkbyEh44CGVNcLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3835
X-OriginatorOrg: citrix.com

On Wed, Jan 13, 2021 at 10:48:02AM -0500, Tamas K Lengyel wrote:
> On Wed, Jan 13, 2021 at 8:18 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Tue, Jan 12, 2021 at 09:54:18PM -0500, Tamas K Lengyel wrote:
> > > While direct booting a Linux kernel into an HVM VM no console output
> > > is received if serial="pty" is set in the VM config but the kernel
> > > command line specifies "console=hvc0". If "console=ttyS0" is specified
> > > then the console output is received as expected. Conversely, if the
> > > serial line is commented out in the VM config but hvc0 is set on the
> > > kernel command line then it also works. It's unclear whether this
> > > behavior is expected or not, after some discussion it sounds like all
> > > kernels ought to understand hvc0 irrespective of the serial="pty" line
> > > being set or not. Reporting this in case someone has more insight
> > > and/or inclination digging into this.
> >
> > So I think this is (as confusing as it might seem) the intended
> > behavior.
> >
> > Using serial='pty' exposes an emulated serial device to the guest and
> > 'xl console' will fetch the output from that device by default. So on
> > the Linux kernel command line you need to use console=ttyS0 in order
> > to point Linux to use the emulated serial device.
> >
> > however if serial='pty' is not used, there will be no emulated serial
> > device exposed to the guest, only the PV console, and that's what 'xl
> > console' will attach to in that case. You then need to point the Linux
> > kernel to use the PV serial console, by adding the console=hvc0
> > command line.
> >
> > I'm unsure how to clarify this, maybe some additions could be made to
> > the xl.cfg man page to note that using serial='pty' will add an
> > emulated serial device to the guest, and that by default 'xl console'
> > will fetch the output from that device instead of the paravirtualized
> > console?
> 
> Hi Roger,
> that explanation makes sense, I wasn't aware that there would be two
> different console's available to the guest if serial="pty" is set and
> that xl would pick on over the other. So adding that to the
> documentation would be helpful. Perhaps also pointing out under what
> scenario is the emulated console vs the pv console is useful. I assume
> the point of the emulated console would be to get console output from
> software that's not Xen-aware (like GRUB)?

Right, since you can run unmodified OSes (or bootloaders) in HVM mode
it's useful to be able to get serial output from them directly when
using 'xl console' IMO.

Would you be up for writing a patch to xl.cfg man page to clarify
it?

Thanks, Roger.

