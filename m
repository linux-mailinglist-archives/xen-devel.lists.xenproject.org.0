Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C28D33213F9
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 11:18:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87841.165056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE8IU-0007sp-12; Mon, 22 Feb 2021 10:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87841.165056; Mon, 22 Feb 2021 10:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE8IT-0007sO-S3; Mon, 22 Feb 2021 10:18:33 +0000
Received: by outflank-mailman (input) for mailman id 87841;
 Mon, 22 Feb 2021 10:18:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w45/=HY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lE8IR-0007sH-PP
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 10:18:31 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36b7d7e1-a17f-4415-8e75-13762b48c787;
 Mon, 22 Feb 2021 10:18:30 +0000 (UTC)
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
X-Inumbo-ID: 36b7d7e1-a17f-4415-8e75-13762b48c787
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613989110;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=f0ntnzxrAcCCprETtimTZivIvh35hgF0Y6cUad1bI1I=;
  b=CVv1YTQMznyjZueM4XFkZk/Nswm7+BJnwmUxUoQIU4ATtx9lB35AGclT
   sF7aVnXJl0wFaajx7j613C7+0fXgFM2DlXV8eW2mt3gdBojG8DWH10g99
   LPGtBlFByEJJS/BJwiXb6zSDCoqkWUgZuTFXcFl50Xkl0GIapBazELqJ3
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HlacU/Q282O7oSGayqyDunGI1sO5TLbsmIAkhNxDbld4Pn+EQUewy6RYP6LZArAbuJyYhZ0Uhc
 H76fHuIsoMr/agFt5DHGVT500fnUvUatDHLkIJ/MPyzN6zxczVRhlFrnXVIO6XD4NflEKvmC3d
 kw8iwGB06NkrJw0TuVUCEYs5DeGglIxmLlITcHZdNHztAQhbVTK6g17Tlj+KxpzHzsY6aRMtiP
 iIaJg1vwqpqnfOa5bEHpIkwjGoZ2FDCoxuLf8Kx4c57g1od0KUe0uRKLtkhot+22Zg+btb9P1Y
 0UU=
X-SBRS: 5.2
X-MesageID: 37652739
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,196,1610427600"; 
   d="scan'208";a="37652739"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFR7OQkD+1fqoh5cJFRlDT05llPXilOQrlyU5nmoAV5OnYP8hQwkpbIZGaI/5dUf/TG3Ftv2zaiO6r7K/hsV9ij5P2j6DvsvD3ujqPDtSRQMjvgTVgqhlDGciZZB/YnFYO+IQGTw9az53/Zq32LsvgalCh7ShjJZBCaVx6e3MX5hFt17CIg0vbyJhv92knx7MMz+zzwxWA2AJ0h9BYCzpyEXhWt0EnXOCogW1POoRqs5K8yw3uN6nj0updmE0ydHt55FrsVYN5nuofYlg7+t0bdVA0eBXjfK4OaO7+15axAqouXJkOEbw9CDAxt0b8yaXqtOHtQ+jGVXu+Zb5fJehQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDEZAqvOuOUDzy7reVKXP2Cxh0gmJnOMxrdxjFePi4k=;
 b=DKWwfz7W4SYD1Y9JruaDyE4CnnmE0Nk1I4dbUPJQlRPnwiCz98HE/jcEnR0DkTtoaMWW8HJlSn8rY0JLShw22GDcOJAWU2y+CN1yQDrJXA5227r9sLv8+RQYZaWQqY8JfD0dqdoODfXwqpUZIefQml0MOdqGMjLoTcMZHZzj7p9Hf5V9atKVWlst6rhjCa3y6NeFa6zd9JwsVi6gTX2qubH0YVGTCZt8gJmaGW3cgtspIc/hdrW3AqARhFvgDuKY/S3oakad1CcLQrvyfo7NL072CxvI5icPH0tL7NJENlq8xteBprhx/1uZ6rl46ogZgkpzldb37SmvO4rM7M963Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDEZAqvOuOUDzy7reVKXP2Cxh0gmJnOMxrdxjFePi4k=;
 b=vrLY8iU/XRRQ6ki10tm3m7cFhHKb5etEb0nWJlRdAKliSl3LongsFOyTw9mtBom+Q2P72ElY/PQpklYJ4YNbsaeWZNNDBiadVo7vUxQaJxU5qQB+iDj/7apaDcUOhLjrWM27PJrel8OURBfjVwWO1m0Of3U6inhHb3c8j/zFwEQ=
Date: Mon, 22 Feb 2021 11:18:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, <intel-gfx@lists.freedesktop.org>, xen-devel
	<xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>
Subject: Re: i915 dma faults on Xen
Message-ID: <YDOE35zhQYwgaxke@Air-de-Roger>
References: <1a3b90f4-564e-84d3-fd6a-3454e8753579@citrix.com>
 <20201015113109.GA68032@Air-de-Roger>
 <CAKf6xpsJYT7VCeaf6TxPNK1QD+3U9E8ST7E+mWtfDjw0k9L9dA@mail.gmail.com>
 <CAKf6xps1q9zMBeFg7C7ZhD-JcwQ6EG6+bYvvA9QT8PzzxKqMNg@mail.gmail.com>
 <20201021095809.o53b6hpvjl2lbqsi@Air-de-Roger>
 <CAKf6xpuTE4gBNe4YXPYh_hAMLaJduDuKL5_6aC4H=y6DRxaxvw@mail.gmail.com>
 <a4dd7778-9bd4-00c1-3056-96d435b70d70@suse.com>
 <CAKf6xpvKiWiU5Wsv2C1EiEFr77nMZTd+VHgkdk7qcKw1OFD8Vg@mail.gmail.com>
 <9bbf6768-a39e-2b3c-c4de-fd883cc9ef85@suse.com>
 <CAKf6xpuTbvGtTRHPK9Ock7rxJk4DfCumgTW7-2_PADm9cSaUBg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKf6xpuTbvGtTRHPK9Ock7rxJk4DfCumgTW7-2_PADm9cSaUBg@mail.gmail.com>
X-ClientProxiedBy: PR3P189CA0074.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e8ac64a-49b4-4f0f-99c0-08d8d71b28b9
X-MS-TrafficTypeDiagnostic: DM6PR03MB5354:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB53547C0B39A488BBB74521BE8F819@DM6PR03MB5354.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SgNZg9C/akNhstNAJman/iFsW4+lyM4190OIPdMeUw3I4qiM2uwFC90eVQCoWrX6HDdFfterMlVNhEUws5BD9wO1+OZ8qkamUoLRvzQ8yznvvpLM0WI1Z1P1WfDIN+qxJYSV4aRmjnoMOoTFpUikHps4y1ErdeHU76Xix+2zK4prVQa4VMiu40DzLkhj2fFC+eZ89o++59DF3viGdk1f9fQ3Dt5QBDqd7iWRwtF/K3hGSf3ZVAoXFnekiuADCDXlTGwB1V7NsiyONa3nzNmSC2X2LQ5S8rw+GPkFSDy8aEXly59U1evhRNXXs18v794/kgAR7WilWL4TzXNQ67sdt9HXSA8mFRZNXSPDE0MzZNC5CQuNoc7aljxCb6e/+exCKyERcYNGKSxyUAKEp7GGzK0O+sjTjA+PM9e0rIOCFkjWUhqoBwjFZWMrGYHFtZ7i76rgTFbFhKBFB+WByf2xO4mtiBHxqcsC8p0HS6QIqOhRaWfknEzDcx+Sjr6vcvEX4TqJSjYyrlq/lylFtESCVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(33716001)(186003)(66476007)(9686003)(83380400001)(54906003)(6916009)(6666004)(26005)(2906002)(8676002)(86362001)(316002)(16526019)(956004)(478600001)(8936002)(53546011)(6496006)(5660300002)(85182001)(66946007)(66556008)(4326008)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z3ExdG1kaWtiQ05RQ3hhU2NOUWxnQUhQNi9KM2ExbFQ2bURjYnpBR1ppUEQx?=
 =?utf-8?B?SGZSMDlWMUpwdks1Z204ditYVEFJeFlhS0tEblpQbXFCYWJVclIyS1BMWFlE?=
 =?utf-8?B?QWFXQXNSTlp2RHhIaWFCbkd1QldpVjY0T2dobjVldDRUaEtoTi9VamVoVGln?=
 =?utf-8?B?aU5hVGxPbzcwMTNjaHRhanRFVkVkYTg4ZW80NllQcXdHZnMwU3VHbTJmZFNm?=
 =?utf-8?B?QXhDSXdOM1EweXhtL2lqeTBjQWdSWFlzdHpZdXFiZTRQd0haMStJa1dBNE96?=
 =?utf-8?B?TTBUeTFDSEpMb3lrL2xRZVRraGdNeXhrWk1HOGJwdkVjOENNdW5MVWUyQWho?=
 =?utf-8?B?amY4UlZscGJGUTlsT1BkYk9qN3ZFekxxY09xWStVeWJKUjN0WUhnaFlPNC8r?=
 =?utf-8?B?Wjd0Y3dtSjI0bFdnNTdwRGdrSVBjc2V1SnRwMkNpU2ZQRHRkV2lQUFRSdG94?=
 =?utf-8?B?Y1QrRTZUNnhvMnVKUFlidzJaaTFUbVVzY0UzS2doNXVsdTF6eGVSZVRPRjBq?=
 =?utf-8?B?N2tMMllYVWhUTHE5bEVQc3FSWjM4bi9NVFNTK2t0MWs3cUNGeFU0RzF3bisx?=
 =?utf-8?B?UHo3cUFIZ0FZSFlvcnJHaGlaYUNyTHFWTThKTXlDSk8yZXpkellSM2F3QmZ3?=
 =?utf-8?B?OWxLaisxRUErcjlyWVFCd25XdVFUZ1o0SnRYYXBld3pXZVN5WjIvWklIbWJs?=
 =?utf-8?B?SVJja1Y2TTVuN3lmaGpvd050OWlpUlFUUVB3OXVCOFNtL1EvblQ4ZVExK1Y1?=
 =?utf-8?B?Vmh6TEdEdlhxRnZoRVVkSE1LZ1dBZ3FiYWZtKzg3eTdzTGxUNzJRcE5TeFpq?=
 =?utf-8?B?d0dXS3hwQ0I0L2V5VGZRWWZ3VWxlWjV0Ulc1dmt5SjRUOW5JN1BraUNIZjdX?=
 =?utf-8?B?Qzh5RzltMFQ3VzZ2L3ZUcXlMc2dndWdJb01xcWpzbE10cDlhRmVWZTdrbXFI?=
 =?utf-8?B?TXN0MWc0a2VlakxNYTE1NjNZSGtnUU1VQTJIZnliOG5memVnbzhBNDk0c1Zw?=
 =?utf-8?B?VG1ZcnJZUnR6b1ZoQmpQMUJiQ0tIZm9XSytVL3BNZ1BvN2J6RnRmTGsvZVpR?=
 =?utf-8?B?cThKK0xFUmlkQ1FLd1ZIUy9kdzdsa21PRWwrc3lHMTRVcFAySmxEMnhYWjBF?=
 =?utf-8?B?R1kzRno1RFJ5dy9OdEpJc2REWm9wTTZOYVpnQTBjWmJjV2dDdHNyTVlvMUVu?=
 =?utf-8?B?UmRKUmdvaWlBZ1lVOWNxMUpYemtGTElCcXNOUSs0SVN6TjZkRUczTmVreFM0?=
 =?utf-8?B?aHhxdzJoSk1UZTZmWkpkTUNKWVR2emxPRjYyV2xVSFl3UmtJMDJuN0k4Rkw4?=
 =?utf-8?B?T2dFSmhabzJFNzM0eGhtR1RXajdKYlhBYW1zaWJkVUJuNXVGUmYvYUhPVjg5?=
 =?utf-8?B?Y05UK1lsdm01SHBjZm4rcUhwTno4SVlFYXA5RHh6T2IyZklGUXQwYU1pY1p4?=
 =?utf-8?B?ZElLVnp5aC9HWnJ2U3JnV1dXcCs5NHdOOHJYclZxcFBIZnhpNi8xVDdvR1My?=
 =?utf-8?B?YVFSS1Z2WUxnQStWNy81OHRxYjF4Mk1PWnY4U0o4eHNVejlpNTFJbE1pWHVV?=
 =?utf-8?B?cjlERk1lYitwUlEwdk9iakdwN3NnN3M3OXJiUkdwLzZDTmVMaFUwdEVjbUNM?=
 =?utf-8?B?elRMdU1ZNkhXL2ZtMEZOTld1dnpCTlJqaWk5azlma1JORFAwYi9lbWt0Sktj?=
 =?utf-8?B?VzdJUDNBcFBLR2lYMW1iNkIwQkZzMkpOdTRiNGcvZE12UUJSS3JObFR3RzVM?=
 =?utf-8?Q?3gkErRIH70ca51WbEwiz+0SzHEUjYY0ux8zVoPi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8ac64a-49b4-4f0f-99c0-08d8d71b28b9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 10:18:12.2536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5L3q2t2vBwrItu306GyTWLI8xDuTCEJOxyTzLBG8sRxeg2di2TLiC8VTJCCVnq2EQVXNoqkOfAoauRukFhBrAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5354
X-OriginatorOrg: citrix.com

On Fri, Feb 19, 2021 at 12:30:23PM -0500, Jason Andryuk wrote:
> On Wed, Oct 21, 2020 at 9:59 AM Jan Beulich <jbeulich@suse.com> wrote:
> >
> > On 21.10.2020 15:36, Jason Andryuk wrote:
> > > On Wed, Oct 21, 2020 at 8:53 AM Jan Beulich <jbeulich@suse.com> wrote:
> > >>
> > >> On 21.10.2020 14:45, Jason Andryuk wrote:
> > >>> On Wed, Oct 21, 2020 at 5:58 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> > >>>> Hm, it's hard to tell what's going on. My limited experience with
> > >>>> IOMMU faults on broken systems there's a small range that initially
> > >>>> triggers those, and then the device goes wonky and starts accessing a
> > >>>> whole load of invalid addresses.
> > >>>>
> > >>>> You could try adding those manually using the rmrr Xen command line
> > >>>> option [0], maybe you can figure out which range(s) are missing?
> > >>>
> > >>> They seem to change, so it's hard to know.  Would there be harm in
> > >>> adding one to cover the end of RAM ( 0x04,7c80,0000 ) to (
> > >>> 0xff,ffff,ffff )?  Maybe that would just quiet the pointless faults
> > >>> while leaving the IOMMU enabled?
> > >>
> > >> While they may quieten the faults, I don't think those faults are
> > >> pointless. They indicate some problem with the software (less
> > >> likely the hardware, possibly the firmware) that you're using.
> > >> Also there's the question of what the overall behavior is going
> > >> to be when devices are permitted to access unpopulated address
> > >> ranges. I assume you did check already that no devices have their
> > >> BARs placed in that range?
> > >
> > > Isn't no-igfx already letting them try to read those unpopulated addresses?
> >
> > Yes, and it is for the reason that the documentation for the
> > option says "If specifying `no-igfx` fixes anything, please
> > report the problem." I imply from in in particular that one
> > better wouldn't use it for non-development purposes of whatever
> > kind.
> 
> I stopped seeing these DMA faults, but I didn't know what made them go
> away.  Then when working with an older 5.4.64 kernel, I saw them
> again.  Eric bisected down to the 5.4.y version of mainline linux
> commit:
> 
> commit 8195400f7ea95399f721ad21f4d663a62c65036f
> Author: Chris Wilson <chris@chris-wilson.co.uk>
> Date:   Mon Oct 19 11:15:23 2020 +0100
> 
>     drm/i915: Force VT'd workarounds when running as a guest OS
> 
>     If i915.ko is being used as a passthrough device, it does not know if
>     the host is using intel_iommu. Mixing the iommu and gfx causes a few
>     issues (such as scanout overfetch) which we need to workaround inside
>     the driver, so if we detect we are running under a hypervisor, also
>     assume the device access is being virtualised.

So the commit above fixes the DMA faults seen on Linux when using a
i915 gfx card?

Thanks for digging into this.

Roger.

