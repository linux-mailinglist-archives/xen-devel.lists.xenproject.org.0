Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 973222F6757
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 18:23:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67463.120454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l06L0-0002PH-HS; Thu, 14 Jan 2021 17:23:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67463.120454; Thu, 14 Jan 2021 17:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l06L0-0002Os-E6; Thu, 14 Jan 2021 17:23:10 +0000
Received: by outflank-mailman (input) for mailman id 67463;
 Thu, 14 Jan 2021 17:23:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D7Rz=GR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l06Kz-0002On-S1
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 17:23:09 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fd316f8-8b2d-454b-ba96-bd34532bdfaf;
 Thu, 14 Jan 2021 17:23:08 +0000 (UTC)
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
X-Inumbo-ID: 8fd316f8-8b2d-454b-ba96-bd34532bdfaf
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610644988;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=GKScIIU143J3uW1+sWyhflWRKHymWXJuy1AhSJcfldc=;
  b=DdAm5yNsBrJs9sxBHGZqTrSLOByuhOJQeXhpGAw596AZeYPSVjL3VZat
   /I3NGDGdR+P9ncEAGNX/zGwdMq5ol4FkUzITHAFHlrZyuxFLUGiYEheCn
   vicbD1g+K+ffU27M9w+Cq9u45zzDwOYvfkPH0ssMclla5ueGVw+KWZx4Z
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ypm2F9ZJpOL7q4iAcl81HA6xP7iN13JIUMIjbqiU/Ngx3vxUB8xoRlO0MIQKPgkJruu87sY1Z0
 i+B3+RnDbogoyd3hGSBtYyizLxL2/XVgRs+Dfsjq46Dv29v3T25pBknguyq0/HZT2vC9pTkxq9
 yNOSQhtTafi8Vqp+knNNBPubRhXhkqsC0FU6kFvu5wGqqFfXS6N+CNtpYYLNVFwwLQVhcscIOv
 pzB9X5r/WxVI9/2rSt18QwbdEnU07vu8TaaLBfv3TpPKOF5JMk0lOhtfZeOWLAb6TD9jGsXfYZ
 cbI=
X-SBRS: 5.2
X-MesageID: 35480720
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,347,1602561600"; 
   d="scan'208";a="35480720"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UwVXAmBunClczPtzl5+lF5On9H6WhVICB5VfulbYhW8WeC5bP4L1vjhAruJfmNdUSr/E2wVs6mT2XSC0vZCFUK+5L1e1N34TZ1OjIimfXjFot5d0JsmVx0h0nKi0Aat4f2BF67aaMreixY34i7wVRzl7K4O/OzTiBNkROstz5yhHqEzkhFDvJxu696xI/Ifi4FY66mqf+mpXMU5bDC0B5TySwqAH68Vu3WkWCPE+8IbJ0IDPCLknWQUl7LYGpDKJVBKYHNgjmkJR2xu2Zn29+4qrga9t+ubu53qqdxz2f1xVj3c0RxERABv7Q735IIhvjTYFy0icqElYiB3hzikXMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NagT/LfuuWX0TA+hs0uPhgrQSmhXEMoKgSnwZJLwOes=;
 b=ZT/k5Oh7TeK+bowHY5rwrpnJAXvW6gDoRSYUVTFVHUNJlxNw6WPKmPwNVl4GsIPN+MHez/IrqpHV7GC7M5AK9lu1k9x9QHRQfSSUd+STlw7tjcsPKIGk4RjyiPT3krQHk8mSu81om6FiJldZsHKJD88/whIPhRFnQghRHnvAF32u4ZiK8SoeTf9lAr+0Frxp/ChxZfe5A+hFN8Px9f+Q4SVmdEyNxD/eahsWqNGpNJq+rxuqK65ijn3/44rfYUr1YnmhhFju2/EoBAZaz/lmwMZTeuIJ+f1n0AcJEP2YKEBoG+WkL5MLV6FKPNjZMI35Am2uu9w5inKXvzQ4HHfFsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NagT/LfuuWX0TA+hs0uPhgrQSmhXEMoKgSnwZJLwOes=;
 b=qr0VEsNlUqz41bchaGVlNAmB15uYeBfLBLVCgbSp2kS5eqzYvrc1QW/TBD/BKDRewvmbDFp7xGh+b4/Zpz+6Ai5uyl4T7PK4VaGecuHELS4ukskqh9RXBeD6eF5pqQMU53RSbpARO6j1kUz9fTWNH9F+FyPKXXAljWzN3MftkQw=
Date: Thu, 14 Jan 2021 18:22:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <paul@xen.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>, "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH] x86/dpci: remove the dpci EOI timer
Message-ID: <20210114172259.zqxmhlipwkk2taxn@Air-de-Roger>
References: <20210112173248.28646-1-roger.pau@citrix.com>
 <MWHPR11MB1886695BC900030C025DD09A8CA90@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210113131100.p5xiyfgtp5s5rktz@Air-de-Roger>
 <20dd6c2a-a576-e4ff-53da-88de97c803ed@suse.com>
 <20210114125447.ob453h3avcug7pkc@Air-de-Roger>
 <730c73f8-d495-e887-44f3-2f19150c7fc9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <730c73f8-d495-e887-44f3-2f19150c7fc9@suse.com>
X-ClientProxiedBy: MR2P264CA0001.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ded18d4-4db7-46fd-60bf-08d8b8b10dd0
X-MS-TrafficTypeDiagnostic: DM5PR03MB2921:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2921C072C6BBE73BBB0F347A8FA80@DM5PR03MB2921.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sr6vGWbdi2LRsVoPPlgFVw6ZmEArr3KKdCJBXwuIVPGX/FP/6QTSi5m1LWNW1fmTlgvX/W8AMeEbyF27SP2SuFtFHusFCPZRenlUQtweSnESnXkVsGRHoba/WEgzIcyhustNlqQ8Z5OQBJ6Miw/e7Xm19jgmlx9Yah35f39wEGp1rVhc5mSYdAZ4a2ihruBEGqeILIkdGtUJ/lWQzMhnmFvRuOJ7MIt/1h+WjuaBWbZl/QW/Vw40AjiuRGyokrGBcpcPBNbKch9pqjqXDW7f8kX7XktOf48Y2IPusliMez6yCp4uViJreXJH1XEdkVOb6S7n0R0rX6GKFNtbZhwdFLrsaFYu4g/TXRisZM9AJRzQDmbJJg5DBHBymXQiwPX88vs2k6yhb25tsLCmnKigNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(396003)(39860400002)(136003)(366004)(376002)(6666004)(2906002)(316002)(4326008)(478600001)(6916009)(1076003)(16526019)(26005)(54906003)(66476007)(66556008)(8676002)(83380400001)(8936002)(186003)(6496006)(956004)(9686003)(33716001)(53546011)(6486002)(5660300002)(86362001)(85182001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RnFndDNQTlMyLyt3aUFlbmo4ckVJTmQ2aGQzdmhTVzAydnR3dXUvQmFDeTRP?=
 =?utf-8?B?UWQxNSswQkozS1ZrTmtIMTI4SEFVYjNhdE94WnJ6WWY2MmNYcG02dURPaTZG?=
 =?utf-8?B?Q2dTa2hsc0FFZWhFWVhDcC84UGk1WFdsSytOUE5xdmlKYkZEeTVjdWtabCt3?=
 =?utf-8?B?Tm01Y2JTeHVBNk91Wm5iVjlIL0M3ZmV4QUhOMUV6Zk9yOVNDT3FFSkh4SFFp?=
 =?utf-8?B?UGRzQjJ2cDJPVVlXMDBTZ0pkM2NQMGo4azcxd3g5a1h0dFpJenhDWTFROFpI?=
 =?utf-8?B?Q3lQNXRTRjN4VVMya0hvUy83SDFGeGp3SnRVUGRHZytrZkRyamtZYjhCRmVh?=
 =?utf-8?B?NVd6Wi9CdWhmaGNkQTl4MDBJSDhqUUtPNTFCYkIwSUVKb2xEYW1VdTBxQUY4?=
 =?utf-8?B?TlFNYXVuZXdjZ2hNemdaVythNFBVNUFGRXJxYjRwcHFXUERMejZCNzZUQ1Nm?=
 =?utf-8?B?Y3NNZkM4KzRWR05VSndaOWZQSnozTHd5N0I2Vmc2VEJxYlVZbHhndjhuTkI1?=
 =?utf-8?B?VHg2Qi9JYmk1dTIvSlhRVUhqeE50cjJhRy96UWlldDEzcVJYQnJoNkdvUmtB?=
 =?utf-8?B?UUVnT0RMMTI2VGR5MndMUFVLTGNsQUxKMGdqY0RCWFhZNE5QbkQ1MTFiTWxG?=
 =?utf-8?B?ZlNqaXFuY3JXb0VSNGYyenZ4VUtqaWViTkg3YmozaGRrRDFHWlBqakR6UlBl?=
 =?utf-8?B?V3ZObHBSbDFxK1lOTk5Ndi9kRTRZVm1WR1BxMmlXbmxRM3BHRGRXS0h5S0FG?=
 =?utf-8?B?eExYQ2JzVmRkNGQwYnNoNlZNSndvZ1AyTitoTlhzczY4eDFVS2hNYkJPalZ3?=
 =?utf-8?B?am4raDJkUnY5VSs0UzlHRnlra1BNQXlwU29pbDgyQi9ZenBHQjAxODlsdTAv?=
 =?utf-8?B?WTNlM0VJcTZnUkRkY3V6bDd3UVhML1A5ZFhFM2Jka1hocUVNTkhxL0dhS3JW?=
 =?utf-8?B?ZlZTMllIaVYyZlVlZEtQYkc3Rllzbk14M3hUd0hnTkJUSzVPWXZYeElqOWE4?=
 =?utf-8?B?NVZKTXFyUG95dmtnN0RrQzBQOGZiWk5vb2lFQVlzbEFLYzVtS3dVRDZmN2hG?=
 =?utf-8?B?TXcvYm53eFp4RVBBOU1BZllXKzNmS1c3V0xvUDVrZ3hEUHJWclA2cXhOVmlP?=
 =?utf-8?B?cFRld0h0QUZuZjZ1dVFielJUQUVwS2dhbUNxNnRlZGloWE5BZ2k1enhhc1lT?=
 =?utf-8?B?NEhpWG5hVlpNY3FuZXZSMjMvcHREMWdjVU1BNHJ2RjRNb29yRFNlZ1ZTSWRP?=
 =?utf-8?B?SWRDMFFzeDkvTDFlcnd4em5FOTVQaGwwQWNsYWZnWnpWQ1JXYzF0T05KRGxJ?=
 =?utf-8?Q?GHuHMVZqKokA3Pc6e+utZliE/8CfopRkTS?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 17:23:05.2620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ded18d4-4db7-46fd-60bf-08d8b8b10dd0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H3EgfnHyIZDES6R1qd0UDUvAyLvH1U738w0JS3Wc440TJVEmoXzt8pA3KWHacEs5W8r83dNycz32IXhXGHIcHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2921
X-OriginatorOrg: citrix.com

On Thu, Jan 14, 2021 at 02:30:15PM +0100, Jan Beulich wrote:
> On 14.01.2021 13:54, Roger Pau Monné wrote:
> > On Thu, Jan 14, 2021 at 12:48:59PM +0100, Jan Beulich wrote:
> >> On 13.01.2021 14:11, Roger Pau Monné wrote:
> >>> On Wed, Jan 13, 2021 at 06:21:03AM +0000, Tian, Kevin wrote:
> >>>>> From: Roger Pau Monne <roger.pau@citrix.com>
> >>>>> As with previous patches, I'm having a hard time figuring out why this
> >>>>> was required in the first place. I see no reason for Xen to be
> >>>>> deasserting the guest virtual line. There's a comment:
> >>>>>
> >>>>> /*
> >>>>>  * Set a timer to see if the guest can finish the interrupt or not. For
> >>>>>  * example, the guest OS may unmask the PIC during boot, before the
> >>>>>  * guest driver is loaded. hvm_pci_intx_assert() may succeed, but the
> >>>>>  * guest will never deal with the irq, then the physical interrupt line
> >>>>>  * will never be deasserted.
> >>>>>  */
> >>>>>
> >>>>> Did this happen because the device was passed through in a bogus state
> >>>>> where it would generate interrupts without the guest requesting
> >>>>
> >>>> It could be a case where two devices share the same interrupt line and
> >>>> are assigned to different domains. In this case, the interrupt activity of 
> >>>> two devices interfere with each other.
> >>>
> >>> This would also seem to be problematic if the device decides to use
> >>> MSI instead of INTx, but due to the shared nature of the INTx line we
> >>> would continue to inject INTx (generated from another device not
> >>> passed through to the guest) to the guest even if the device has
> >>> switched to MSI.
> >>
> >> I'm having trouble with this: How does the INTx line matter when
> >> a device is using MSI? I don't see why we should inject INTx when
> >> the guest has configured a device for MSI; if we do, this would
> >> indeed look like a bug (but aiui we bind either the MSI IRQ or
> >> the pin based one, but not both).
> > 
> > If the IRQ is shared between multiple devices Xen could continue to
> > receive interrupts on that IRQ, and thus inject them to the guest?
> > Even if the device passed through to that specific guest has switched
> > to use MSI.
> > 
> > Maybe I'm missing something, but I don't see QEMU removing the INTx
> > PIRQ binding when MSI(-X) is enabled for a guest device passed
> > through.
> 
> This would then match my "would indeed look like a bug". I don't see
> why this mapping would need keeping once MSI is in use. (In fact it
> probably shouldn't be the act of enabling MSI where this gets
> removed, but the setting of PCI_COMMAND_INTX_DISABLE by the guest.)

We would also need to assert that no other passthrough device on the
guest is using that same irq bounding, or else we would wedge
interrupts for that other device.

Thanks, Roger.

