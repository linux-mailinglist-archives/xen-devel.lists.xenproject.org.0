Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 395B03BD485
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 14:11:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151191.279440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0jvK-0007mf-Aw; Tue, 06 Jul 2021 12:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151191.279440; Tue, 06 Jul 2021 12:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0jvK-0007jy-7l; Tue, 06 Jul 2021 12:11:34 +0000
Received: by outflank-mailman (input) for mailman id 151191;
 Tue, 06 Jul 2021 12:11:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rBn=L6=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m0jvI-0007js-LE
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 12:11:32 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9884cb4-7579-4b53-8e51-48e602732484;
 Tue, 06 Jul 2021 12:11:31 +0000 (UTC)
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
X-Inumbo-ID: b9884cb4-7579-4b53-8e51-48e602732484
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625573491;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DCANa0gc8UdHNUTKdiuBQiuX+ECVDDIIPpJ0WBFk2r8=;
  b=ADnrftkfjlJCB4OIpG9b/o9KGCKdgC2/rXOrx98X+X+c/3lKyGZWj41/
   kvMItDaqJ57/OFbtGJId5F+wSal1OEws28UL5DkwNbs1+cSLbGzb9qHik
   o1B1ZK/QsThyiyQzN5WYTfn1h9Cr4egx/9xVq6ccnLz4PLJuZs9JwucVb
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
IronPort-SDR: QjbwwAvqVuDUONltbiJldJUWNK/IppM8xqofl5bJB4IWiWVel4B1yymIrRep6Y+hWy1RHPwmBR
 IkFxdLrli0tCoMwBoR3G+VQeg4fy5a9iMzGMadBhqr6Xca9RuqukkHeqbiCGacvU2EqpXT4zR8
 v68QlL2KJL8OdwRPDcIKbGuROV24i0M0GabgbreIzD8DnvPk/5GrBrgIPmo97Jiupk1iwqlluz
 EPjv31dOrBkbPKtEW53ijSsNYMJiDRUFMQvS8dUYvTroFaJaUP/h5Dy6k5+MAa0k4BtEM76TI3
 P6I=
X-SBRS: 5.1
X-MesageID: 49265181
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:I5j/KK9Z9jKImP+Tzl1uk+E2db1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYVYqOE3Jmbi7Sc69qADnhOBICO4qTMiftWjdyReVxeRZjLcKrAeQYBEWmtQtrJ
 uINpIOdeEYbmIK/voSgjPIa+rIqePvmMvD6Ja8vhUdOD2CKZsQiTuRYjzrYnGeLzM2YKbReq
 Dsgvav6wDQA0j+Oa+Adwg4tqX41pL2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbdz9U278t/U
 XMjgS8v8yYwrCG4y6Z81WWw4VdmdPnxNcGLMuQivINIjGprgqzfoxuV5CLoThwiuCy71QBls
 XKvn4bTopOwkKUWlvwjQrm2gHm3jprwWTl00WkjXzqptG8bC4mCuJa7LgpMCfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0m3w/iuQe5kYvErf2UIUh6bD3wXklV6vpREnBmcYa+a
 hVfYHhDc9tABanhyuzhBg3/DTENU5DbCtvQSA5y4aoOnZt7ShEJ+Zx/r1Xop46zuNLd3Bz3Z
 WODk1ZrsA7ciYoV9MKOA4ge7r7NoWfe2OBDIqtSW6XXJ3vfUi98KLK3A==
X-IronPort-AV: E=Sophos;i="5.83,328,1616472000"; 
   d="scan'208";a="49265181"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlsCNWd6oP6qOeHk2khyvZmg0dJ+0HWF2N2nRqdBgJ2pvNaHbTV4pr8BxJFvNc02AdbHRQ7xZL2jjECNPg9hQeAqknBUejvbI9W+Tcl2ll6MPj8cQWaSVycfB/P56+rCPn+ziSwarHk7Y+ZrzvhkTrrAPJzz465lQPbxso/z7f5KSOX/+HgyR0GrcHdl/g+4+CFqPtSZ/tk7B8zKoDEg0irJN9Lae3HZ+RTeCYIFAD4YpfjYLAxqTkCS8s0gpBj5oyY/nF9V44YDgwJ0NYKK2WZpB4cBlbqxv84xer2P/epPrmI9dih0fThzTIeGV0xZI04Wx691kNaMB4Tj/tHY3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwTRiBSMJWJECrC2T4SZGbL6SloV1G9IFCn5dmMubgc=;
 b=c5sSzS75AcoaW69BqGYqLzdqNuVZF7I+/Dju/tfB3kBQ0QzEUBWCgWOXxTEmf+w7mvWo6A7Y6/i8xf4Ux47XCkLfrgeZnRflDWWuhQTycFy0FrDePvtDwGaJJIWIZ9cqG9yNZARY1kPMuUVqOEh8QQLi42L6bgSjtYmqc3MZEdnUqK8Zbl5tqUFOmuEut45WZjXzlsK4R+XSuxcAz5/2J2TEj4mEGrEBs70Gb6+uuWC0qBs27e+ID2iKrrOKA4KAokU3nKC7y/96hOHhJGZklVl0afZbNWy3tqmeNsb8pvNXdi/KS/WhrvHmejItsEwTNeI78mj91yaFUjjVKzZAxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwTRiBSMJWJECrC2T4SZGbL6SloV1G9IFCn5dmMubgc=;
 b=rNUueozCKN6LlghhvGHI0hwsYOysMDBnr/Sd6Ns6Lz6n1bEVnk+gRJQUhuEVNYLSRGaLzpBVaZARFChqkjwFV8FbDEB6z09P/R1dYFQw+tLXU10HaojWsrH36F3Cd7pqyqYB+lszJ6i3qGp7zVGSUzjFa0LbVNZYFjLw5gJ+L5s=
Subject: Re: [PATCH v4] arm64: Change type of hsr, cpsr, spsr_el1 to uint64_t
To: Olaf Hering <olaf@aepfle.de>, Michal Orzel <michal.orzel@arm.com>
CC: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila
	<aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>,
	<bertrand.marquis@arm.com>
References: <20210705063952.25629-1-michal.orzel@arm.com>
 <20210706140010.4b8802d9.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <dcfc77be-1f14-141d-7152-8cebe7563dc6@citrix.com>
Date: Tue, 6 Jul 2021 13:11:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210706140010.4b8802d9.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0093.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::33) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04070dfd-9619-4b2c-51e4-08d940772cdf
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5423:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB54237871DB324C884222D018BA1B9@SJ0PR03MB5423.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sHE+W7s89i6VxrJuAIpy6xMFcmps9v8jsjzW4ubIaDhR5CxZBarZvx6f32ktxEmTl9UiPaKJnRJEJuQW2o1oYJPYn/79lqqdFMAp1y2EYG9FR4UEVlEzQc3UgrSk3pGKqieKUrkcLieltMBV9hZsiYezwo6xpocZBN7B1SWlanwV6mVVx8AHZ5KIWgl51kwtFZWcFp09jrlYcqHYVGIB1chCyVJbbDLXHYz8rhjX0VS5/8+bZBylpNjcKArqlAQ06j8I5uPNVYEnyUI/Jz9X/FnDnR6brWkc9q8n+gFiYsT0/8BCV4ayjGyZfjJyasdexxdbZmgmDt0sTrvTF3GopaXK2nL9Ic15t/lhlenU5Z2XiJSMfl9nvFf7w1InhbgHkXgUDBvaFqqQkvKUD7NtMyOrFz46EeFaB25xUtCLwEdUaTEq7tUmKYBdWPqQTwBapo/KXnomMxRlNdKL4lISUzmc3yyubc+Cll+aAtdQN/QZGpOJfzT0QkpGKc9/z3SgmwTB9Y+uAjjRBRGrEkFY1rni/K53OWUspBhd4raEpwugQzgP01oOT47v0DmVgWeBMmE5rsZukLT/CpSTKrSi5G5EyCCDpp9AmrAo9dwbdr/I/5CGFG57H5qGPLYra4mKaSBJAKXJ5MFKGRE349L5zuC8n8PrwL2rBHC9xoAEuhwfT56IKMUdSeMRSC8emRBbbcelWIdXRVejv1Vv+miwFakO1PvRdLf/BIEjfozyX+A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(8936002)(86362001)(2616005)(478600001)(186003)(4326008)(31686004)(6666004)(6486002)(31696002)(8676002)(956004)(38100700002)(66476007)(5660300002)(7416002)(54906003)(110136005)(26005)(2906002)(66946007)(316002)(53546011)(16576012)(36756003)(66556008)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?TvkwKJq+3HyAe16r5hz9bYvO+HGEMfxRsatdA2Qf0y5O6pBghPckIng1?=
 =?Windows-1252?Q?7j6zoygSpFmUObIAJm8nsE0R7mAm3OnKECzspurH9R+Ki2QccD5UyZPR?=
 =?Windows-1252?Q?n+Wa8bHreFL8eWG/8X/tgWp3emmv6EUw0F+FPqVe9nhF2WXsM7e+DIOH?=
 =?Windows-1252?Q?wq60+cwgMg8JWbvTanU1uSFHdA3E2BVBSHBdc1IkphMVpWerFDjlclRf?=
 =?Windows-1252?Q?umg8WLMY4fvHp87tL+o3rD/HGRQ3x4Oe01tclBiRHw8Oxse/C5HEUMrV?=
 =?Windows-1252?Q?YZq4BpDNoMzPwxS3RFbW1XhHKHAMuzhjyDxp2d9qvgupfFdz/RlfHaVm?=
 =?Windows-1252?Q?Qe5JGI6A+jSjH5GkbVCHRtzy6TX9XqHiqDKveigUic6n6J9RoyCqkPtB?=
 =?Windows-1252?Q?o5FwmoTXUx5D/r+jMVqgL7JINbslwHBjx3g+7NlrFaJsUbJNKR63jmdU?=
 =?Windows-1252?Q?U5DSyoGL40LB9VG3R40ELnn4x68Xy+e1ZL9+UorIJoXeBy4Xb8cvOvzp?=
 =?Windows-1252?Q?oMP3kFTj16gDC1BMPFenpnlakPpSSDjkEZba0MCct7UPcmPEHzYKjHMK?=
 =?Windows-1252?Q?MbCAMYYn028n03MCC4VtDQeJZ90eM5bcOsbz9bS2pl5gkrRGYf2HA4TR?=
 =?Windows-1252?Q?rWOTk6xappweF40XDpswqTs5XLrSug/R2jzzB0bFnpK9dH+xTfIYCOhE?=
 =?Windows-1252?Q?6Bf+JEUqK3aWXi9/syvyiErr2S3o9KiaXKnsuAGon6v9TDjlePJfdsN3?=
 =?Windows-1252?Q?0faamtn+h0h2PsfpiZI6Fp/8ASHs4WN/q8QYMhptTUdtEJAfaOgu7ZAq?=
 =?Windows-1252?Q?VGeIZBU5mzQJN1DDzP13+ppIYR/Hmu7YxQY9Lvy6thFnrt0TdziP4Mzv?=
 =?Windows-1252?Q?RMe8UVP+hbPnmxeeXAqWnZSIGvcrxt/gx+wwcHYMuot0sWn3UnIeG+Si?=
 =?Windows-1252?Q?umZ026Uxbfn92DGVXQflqujGRBDDuA9oinFTMBektJ2M4oE93lO1V7F/?=
 =?Windows-1252?Q?Beua3U1Xfjgpp5Y1TuZCb0yg7LJr7d9fdBU80Nrd2nNWfANbQ9sGt7LV?=
 =?Windows-1252?Q?DHADF3jo2tQYTvHZJb/VGhJebIBlpCJFCDXZMw0yDlOA4bhUjYQ+Tv6S?=
 =?Windows-1252?Q?kktp19bec3vDJT98c0YQth7M88+3KiHZ/s7EON552+/nrYz138A6uuCN?=
 =?Windows-1252?Q?X2lJZf6t/k/04ee5+ex7H6e2gEh6MB65HNugyqtYcTqIU0Qzr844mhSr?=
 =?Windows-1252?Q?bxBhdmSqZi5UDaS48EwbdJwJRyuedOAkNjm9R0nMpB1XSe/juKWp7rKC?=
 =?Windows-1252?Q?EPpY6TTRyEr4T1fZNR//Z2SWP5w4pXBiC+3Kmg/imKd2wlnsjs1h9d6i?=
 =?Windows-1252?Q?F24MJeHdrftJ4bDvOsirw61ILsRkL4x6G1NgqsQ1wO/I2JWy4wS9jdvY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04070dfd-9619-4b2c-51e4-08d940772cdf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 12:11:24.8914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gr5JI9IgonApQBFoR1b+6k0idUawdWkWHVQKI1MB3EDa/BOtBnOhwEkDvDNkyblpVy7ti+rGa9bKezxo2eZ73StJ3M0myfIhZaK3U6LcUR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5423
X-OriginatorOrg: citrix.com

On 06/07/2021 13:00, Olaf Hering wrote:
> Am Mon,  5 Jul 2021 08:39:52 +0200
> schrieb Michal Orzel <michal.orzel@arm.com>:
>
>> Modify type of hsr, cpsr, spsr_el1 to uint64_t.
> I think this is now commit 918b8842a852e0e7446286f546724b1c63c56c66, which fails to build:
>
> ...
> diff -u reference.size tmp.size
> --- reference.size      2021-06-29 10:50:32.237518309 +0200
> +++ tmp.size    2021-07-06 13:58:19.052592351 +0200
> @@ -4,8 +4,8 @@
>  start_info                |       -       -    1112    1168
>  trap_info                 |       -       -       8      16
>  cpu_user_regs             |       -       -      68     200
> -vcpu_guest_core_regs      |     304     304       -       -
> -vcpu_guest_context        |     344     344    2800    5168
> +vcpu_guest_core_regs      |     312     312       -       -
> +vcpu_guest_context        |     352     352    2800    5168
>  arch_vcpu_info            |       0       0      24      16
>  vcpu_time_info            |      32      32      32      32
>  vcpu_info                 |      48      48      64      64
> gmake[2]: *** [Makefile:24: check-headers] Error 1
>
> osstest may catch this error as well.

I've just reported the same on IRC too.  Gitlab is currently a wall of
red from 07d6dd51a5c508cc0f3c93a876f8b4e3102ecf60 so won't usefully
highlight this, but OSSTest ought to notice in due course.

Of course, there's copious quantities of information about what this
check is actually trying to do, and why it's present...

~Andrew

