Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 232943336A4
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 08:50:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95878.181007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJtb3-0001dH-S4; Wed, 10 Mar 2021 07:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95878.181007; Wed, 10 Mar 2021 07:49:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJtb3-0001cs-Ou; Wed, 10 Mar 2021 07:49:33 +0000
Received: by outflank-mailman (input) for mailman id 95878;
 Wed, 10 Mar 2021 07:49:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LfCg=II=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lJtb1-0001ci-TJ
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 07:49:32 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9514d391-d566-4922-b2d9-8afcde969665;
 Wed, 10 Mar 2021 07:49:30 +0000 (UTC)
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
X-Inumbo-ID: 9514d391-d566-4922-b2d9-8afcde969665
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615362570;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ERaUF3hE5TkWVE0K1zQogibFQ0R3myO9yEuuhccJP/g=;
  b=aJx1orDo/C0wg3Tqw814GoPjXmMcB/yAbzJsg01ys3tbtr14z7KTYbTF
   +rxCUl4cr/4BINOt9xFqm1msuhvIBEtAuhNVNuTyNg+l+ova57z5hchiu
   NQ3j5wBxPzIUkTUP8s8DzPwGGlSI/6CAw7t21PYaXymnKRdU/LkzT3DEQ
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: diq+iEhyD8zUhnkJhgA8xdr37BCoGItms7uLOMYaku9XkEvkx7/9uNmepFYrV5lkOGFeX2RV7e
 QCpg3M/sRQa3JGiEysyHF0aIGtKHqa2K6rUinytAmZ5Yr4dT3A+rg8FlFxAvuRhKIbL1ymWwO2
 oX+5J/GsTntvqPE4RZoq87NFyoZXNWKuVa2On4PlwQVLvqtFIRcZVex8+QmOKEHtkNq7aLXksC
 xRPFreTB2nKeOMWfcIK8GMO64nvRVOTrsNs4I7ylOiXiYBvKIkD1vC1QeLBiImqEjYuXcpjJn1
 2CA=
X-SBRS: 5.2
X-MesageID: 38947527
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,237,1610427600"; 
   d="scan'208";a="38947527"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7btv2Qd42rbZliF43n4ZYUHkQZL5Sg4LAII7vayZpHkt0eCX6zUl6gM1yxVX7yHLRgtvDp9zh8xv+DSi5JmQKC5g/3Sq9GlGQENiKb0Y1KvWlcrWmr3h7ZJoYO78fXlA4BsOvJXX1OIaiA72NnY29Ta2/bMhFqBhk1FTOB69HJiLDbpHcT1/CbQJN4FZHjemPT47YwkVT0dxC+o2hpwDgJtdF5B8eeQddmC9MyNCbcbQ2yKc36eGOKKx8/EjV/Z7LElGkrhFG7908aSxfTCO1Yy9Zr/VCV+Q1sgONgdqh9HigRSPz38ID/nvfHkFyOHZCTpGzALmYeVApZ5hjD+zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CpZtEeIqrPtN0Q79N5PPXnH4BaXxQ3jqSvohJqdn32s=;
 b=TE6M05wB/WQSLGOBA5dKoOILJPy79tBO3tgRg7I63p+lOcBzPN4qK5aZ3QGZ0FPQ98UG2ltLJ0ZZ3vsutw4sgcIAqjl+d4gBUZDKDvm2Y5BUHNvr0sqQc8El4PSlgPtaF+npSU79XM5sVbP7TPM+jqq5KAT/21HhbWspa/a6d/fFAm5Nn8GOu3EqNaDmW30FudmpX6AI68rSdDuVpL0XAprYtTLmibJeXqtpebiN2bhy04s7+uR8/VZXSHPDLYWbzvrgpRfjPhpdEu7EX+Lfp3LynMIuP5g562k7FryO/sPMHG9JFpDsR0yqDlom1lZbyGonSOLbQW/Nq25ei2ULuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CpZtEeIqrPtN0Q79N5PPXnH4BaXxQ3jqSvohJqdn32s=;
 b=I+fCLATSVgeh5CXjUNHZ+q0BwUEfy8BpkR5x4q8lYbQ//ayGT/W5qtHCyw5y/x4XaAOQDFlOW9UZGbZSAKxsNnTZD6azFik4t7Z+9snRdZEUAS7hVfAqfDGNENlOm58ASmYL8L36egw3ocnOgODFXzOuM6lt7ZrFhVN7xfQDfz8=
Date: Wed, 10 Mar 2021 08:49:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.15] arm: replace typeof() with __typeof__()
Message-ID: <YEh58/bHpj+n+gyM@Air-de-Roger>
References: <202103092114.129LEgZp059925@m5p.com>
 <eaef1b6d-db89-945a-e8be-2b3f9145780c@citrix.com>
 <YEg78GtM82AmbbYh@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YEg78GtM82AmbbYh@mattapan.m5p.com>
X-ClientProxiedBy: AM6P195CA0002.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb77dd1f-49c7-495e-39bb-08d8e398ffe2
X-MS-TrafficTypeDiagnostic: DM5PR03MB2633:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB26331B8023F543BD57966AF28F919@DM5PR03MB2633.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pcq+NfcnY9ga3+2PuNOs1rwCF8SWINm5bKT8S+vpjZIWdcWyvVcpB3Ofld2NFH7OI6RHE1mwlfkiSQBOeER4H/a3L95TCLy/VWbFt1FdQWSP1OssUeCAEaC1imS8LpITwQ8SDcr71FiuR0ssOcSNUTJsxOJ2NOBIaF+1uGrJJmyvWLAjPjMoIN8tAtrSkcdNiddcy4ouJ+cDmyZ6zbBEtaP9DbYQYKtJ/lLBtrOKO29sGXqA/TEmIuyx9kW1QTPsKzVJWqvJvlUCIh3+berNOfb7Dn53Xay6YiPzFgMS2+di6/4sNwDxbfjT52axK9Thara/81ZegaAAExsgrSiJY/t4tOoyjG44JX/CEeU7nvQhQyx4h69JvaDt9xRx9JmuB24hE1a+fm6IZwYXrYOWLnDcbhiUTWRevhvYmnyFbmov7mXymDzUIG+W6jlMJ8Qkp8GQgHau0L3z02Q/VOarIFVGEkBJghhYcmI+EipOuLBBFRK3Zf7G/YEyGoKB09ueiIh8dxssKwN22yaQw30+fw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(39850400004)(136003)(346002)(366004)(396003)(5660300002)(8676002)(316002)(53546011)(86362001)(33716001)(8936002)(54906003)(66476007)(6496006)(66556008)(85182001)(16526019)(26005)(186003)(956004)(2906002)(6486002)(9686003)(66946007)(6666004)(478600001)(4326008)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N2hDNzNGdmNJcmN2aTh5dlhZc3VoZ2tpMmZOaGVqcVdweWRpaXVra0owMmlK?=
 =?utf-8?B?V0t2R0c2c1ovN0dLamZWdmU1alJkc1JRM3hDSDVtZmlvVzQ2UXNrWHVBNXQ0?=
 =?utf-8?B?SERDdGpIMFJkeVk3QzAvN1hhcVVTRWwrSEhlRE9VaFdMQkJUUUNYM1N6SVZC?=
 =?utf-8?B?NW5lbEMwN0NPZmd4NHpwR0FYVWM4QndtTFJkbzNYMFpCYzBSbk1ZVERmc3Az?=
 =?utf-8?B?cFdXaGRIbWFScjM5djFXQWJrWVlnSGpNTUxPSkxrSGEzSkxLUUNHTjR1akFC?=
 =?utf-8?B?OVMwY09rYngwejl3RlNiYWNsRjlYZVBrWTUvRktodVNPS0MzWC81VCtxK29X?=
 =?utf-8?B?NFNOaWd6UFBPNlhoRHRvMk1NUnJlcjNYZTFjTG5sSUkvbUlSVkFvZ3NNbEZV?=
 =?utf-8?B?dGkwWUhJQVJGZnNSMGZ0SGhXMXZtV0VzcDRCUGZDVlIrN3JQM3ZDT1NVV2ll?=
 =?utf-8?B?eDNSRWxlWkprelBiUmlCbWtZcEwwT1U5WE1JcTArNlFLQ1dKbVV2LzdSd0sr?=
 =?utf-8?B?VTQ1NW1hbFBkV3BocmNFK1BXV3d5NFhQRG85eWJBR1U4TDNjTHgrRUZWb29y?=
 =?utf-8?B?RGVJd3JXd3hHRk5aNXpHTmRXSVg5aFNzUnVoRjR6TVRJeS9ZZHFBQnAvRlEz?=
 =?utf-8?B?VVRZL1VBYnRlWWlSWjlFTDRHR2gyOEVlZ2NOUncyMktnNitqQVA1alo2Y0Fi?=
 =?utf-8?B?TnR1RGtPcnhyOWZwSDcxR2UrdHFnby9MaEhGaHhLa2Y2cEtjWHNzSm1VUWJB?=
 =?utf-8?B?cjd3c3V3Z2V6L3J4enBRZ0pSVVYzQVUrM2VaTzlKQjFGMWpwT1J0Z0F4VE9p?=
 =?utf-8?B?N0RuVDU0djNyV3kzeC9UQnU4dEV3eE8vVVN3eGRTQlVTR0kxWWJxd0ZWOU83?=
 =?utf-8?B?VktFeUk4T3NJRVY3MTF0UXBpbGcrRFQvNW9HL21rMWZ1QVNLNExPTnkzUk00?=
 =?utf-8?B?NEVhbzFUUGZKYnFKTS9EMThmV0FRdDR5ajBvOE96ZnpLNXpLUk80R0s4c0Vq?=
 =?utf-8?B?dEg2UDdMREFqaXlmeGlLRmxPbkJsWGxTVk9OOUJ3SUoxUXJ3S2V1dmdvWXlF?=
 =?utf-8?B?VHhuQmhEYzBIOFlmUDEzRGZBcUVSRC9BdXB2R2JIeUhnUGdiSURZdm13WmFY?=
 =?utf-8?B?aTF6VWhPbjhuZUdsZXcyeGF3a0dOeGM4VVlyeHU4b0hTbit6Q0ZLaHVxTGZ3?=
 =?utf-8?B?UldwcGZQYUk4b1AySEN1aGZkRDlyY3JHTkFDZXcya0ZKNjBDd0pWV0pkQk5t?=
 =?utf-8?B?QUZxbU5wTExqZ3JNR3doTmw1UVZNSFJQa3FrcXVlcFBxNGkzdnlYZWtQTEdV?=
 =?utf-8?B?Zk1wRmNYa3VaQWF1Y0NCSnFHL3RUT0ZsSzdrYThSTEQ3L1NoMGZZZ25lOHlL?=
 =?utf-8?B?R2NyTG03ci9ZOEk2dm5pZm1DcVVuSVl6ZFlkbWVSWHcvMVBKbnJ2ODBwMFdh?=
 =?utf-8?B?RzBvL0F4MDdJUWdUc016bjl6aVY2TlkzcW1wTGJSZFpWTzUwZUNkNVRYNlAx?=
 =?utf-8?B?Y0RmbWx0MlZJNUFqYndlZWpDOEZKbnF0ajljNzd5ZnZ1dnZ3VHpJQVNDQ2ow?=
 =?utf-8?B?WVVVVVJSUGorQlExTFRlc0FZWDQ3TTVCYStZVHpiZlBoZWdKbWE1a1NRMXY1?=
 =?utf-8?B?L1BPT1ZYd2JnNjdhbDFCejZRbkV1QkFEbkNPanZFQ051UjBia09tbzVkSEh6?=
 =?utf-8?B?K1pUWi9OSFdPaitlVGV5Z0VYVmFxSXVPTHRsQVBUOGJ6SmZkOG5tNDhPWlFi?=
 =?utf-8?Q?lksK2g03u5Y3v+qQIsCKtgfDr3RVmIEzMobMWvd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb77dd1f-49c7-495e-39bb-08d8e398ffe2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 07:49:14.2566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hVW6LRiEHDOYW/WYmyLPF4ntkgOQnDMuTLF4jyUjE8fhoZ74R3/ojoFtsBymVyJuGEEn0dwIGXS3rx33Rm4cMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2633
X-OriginatorOrg: citrix.com

On Tue, Mar 09, 2021 at 07:24:32PM -0800, Elliott Mitchell wrote:
> On Tue, Mar 09, 2021 at 09:27:34PM +0000, Andrew Cooper wrote:
> > On 08/03/2021 13:36, Elliott Mitchell wrote:
> > > typeof() is available in Xen's build environment, which uses Xen's
> > > compiler.  As these headers are public, they need strict standards
> > > conformance.  Only __typeof__() is officially standardized.
> > >
> > > A compiler in standards conformance mode should report:
> > >
> > > warning: implicit declaration of function 'typeof' is invalid in C99
> > > [-Wimplicit-function-declaration]
> > >
> > > (this has been observed with FreeBSD's kernel build environment)
> > >
> > > Based-on-patch-by: Julien Grall <julien@xen.org>, Sun Oct 4 20:33:04 2015 +0100
> > > Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> > 
> > s!arm!xen/public! in the subject seeing as two thirds of the
> > modifications are in non-ARM headers.
> 
> Gah!  Crucial little detail missing when rewriting the subject line.
> Julien Grall's original patch/commit only did ARM, but when I checked I
> found the other two and I did them too.
> 
> 
> > Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > 
> > This wants backporting as a build fix, so should be considered for 4.15
> > at this point.
> > 
> > I wonder why our header checks don't pick this up.?? Do we need to throw
> > a -pedantic around?
> 
> This came up since FreeBSD's kernel build uses Clang with
> -std=iso9899:1999.  When I found FreeBSD was simply copying Xen's headers
> it was clear this needed to be *here*.

FTR this was never spotted on x86 because we don't make use of any of
the macros that use typeof in the kernel. Arm OTOH has a typeof in
set_xen_guest_handle_raw which is used by kernel code.

Thanks for fixing those.

Thanks, Roger.

