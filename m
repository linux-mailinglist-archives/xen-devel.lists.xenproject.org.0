Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F25FC403A26
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 14:53:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181929.329285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNx4m-00011K-VR; Wed, 08 Sep 2021 12:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181929.329285; Wed, 08 Sep 2021 12:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNx4m-0000zT-RX; Wed, 08 Sep 2021 12:53:16 +0000
Received: by outflank-mailman (input) for mailman id 181929;
 Wed, 08 Sep 2021 12:53:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hF9z=N6=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNx4l-0000ye-Pj
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 12:53:16 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ddae5de8-3375-48e0-a374-03ac561259fb;
 Wed, 08 Sep 2021 12:53:14 +0000 (UTC)
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
X-Inumbo-ID: ddae5de8-3375-48e0-a374-03ac561259fb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631105594;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=10cDCX+HBcAjUdhksN9InxpkGJbG3lqZ9TVZ6Tx08yo=;
  b=hTSnYTVYXw0cz1leKgnKJOCJ0L5vDslk0okEjrS7HsuvPH1s6afL6A0N
   g/77+4dUvuFW1Z+oAyqmh2zT3g5pm+3zTU5gyGIFvHZCdJrrk4wdkA2oC
   pBH/IgQf+cTDiezkLPrwiiKxwF3dbT0WvxI+7Pek8BwpE/mUNQiDW8olF
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: XBuDn1eYi80kGcS6067kbRkSTyfxto9v0neY4S6gvc4MbjAoh1m5jQa00RftLGIafilhAsLeK0
 Ejfy6E7E1M+ulFSKgxgfuwPMIsO2D1vtH760vRnBBHb6hWZz6xfCIWq0osY03W/5/xr3UGa3Mr
 gj7XlQ9laJQ6d4t9AKb6APauv8qpVGf2T+mSFiyUbWCrTWwav/8aLbaStwgl2irtoeXHL45nqI
 rJ413/s9uL3f6DOpP7BWCodx2hOpsQYyC3mAgoerNbkyNFaRFGJ58u1vvqsg3tq0AxbiIQNLDr
 BnYlYPqV8aOYOXsM6Kgp8az8
X-SBRS: 5.1
X-MesageID: 52235485
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:QAnm6K3q8GGcYwnbYlACHwqjBSNxeYIsimQD101hICG9Lfbo7P
 xGzc5rrSMc1gxhIU3IwerwcZVpQRvnhO9ICPoqTP+ftWjdyTqVxeRZgvqZ/9SOIVyKygcw79
 YeT0E6MqyHMbF2t62V3ODaKadx/DDkytHduQ629R4EIG0aCdAEnmMJbXf8YzAGODWuR6BJY6
 Z0jvA3jQZIEk5nHvhTc0N1LdQr0Oe7564ODyR2eSLPDjP+7g9A74SbL/Gf5H1+bxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819pqHqW3+5soAwSprjztSJVqWrWEsjxwivqo8kwWnN
 7FpAplF9hv6knWYnq+rXLWqlvdOXcVmirfIG2j8CzeSP/CNWQH4g169Ktkmy7imh4dVRdHoY
 p2NiyixrFq5Fj77W/ADpDzJltXfwyP0FcfeWJ4tQ1ybWJWUs4TkaUT+VoQFJ8GACr+rIwiGO
 lqSMvY7OxNcVybZXjFvm9pqebcEUgbExKeBkwLvdCc1nxbmHh4yg8TwcQEhHcO9Jg0VplD4K
 DAOr500LVJQ88Ybah0GecGRo+7AnHAKCi8fV66LFH/UKUOPG7Ertr65L004aWhfZQT1ps8mJ
 7ITVNfsio2c1jyTcmJ0Z1F8hzBBG6sNA6dhv23P/VCy/3BrGGHC1zDdLj1/vHQ7ck3E4nVXe
 2+N4lRBOKmJWzyGZxR1wm7QJVKL2ICOfdl5urTdmj++P4jELea69AzscyjYobFAHIhQCfyE3
 EDVD/8KIFJ6V2qQGbxhFzUV2n2ckLy8JpsGOyCltJjlrQlJ8lJqEwYmF657saEJXlLtbE3Zl
 J3JPfinrmgrWe78G7U5yFiOwZbDExS/LL8Okk6+jMiIgfxa/IOqt+fcWdd0D+OIQJ+VdrfFE
 pFq1F+6cuMXsetLOAZeoqa20eh/jwuTV6xPtIhc5y4lJ7Yk8kDf9QbsYRKZEH2KyA=
X-IronPort-AV: E=Sophos;i="5.85,278,1624334400"; 
   d="scan'208";a="52235485"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDpphsaQEXAJuP3od3+JzX9XowCXn5PcKEKgJh2o+ZvYNxT+I1DyXIIUE51RAPJjL4mRgdLNfrPf0EW10E4WsDQVxlTzGFK8Q97sGo9TZcRaGrEBbL/cOfK2GTZz50nUw1WMHCy9XKUFVDrcdoAKMcOlb6YK1y67fF3i2jsJhDQYcnJEM3KvHnlRv6Jdn0OW6veZUztNBVuOatBmUjYYMXPxmFEbn9kIOBHCx15GHzih3CjUUVkGQKrchfmRf+C701X27uSZxT32qftbhOmCITVc0qDG5/bgs7u8jLs4C3ilJRV0nyc6mBII4mpXNgmF3/gTHVgBY+kFtLa24DB/9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=10cDCX+HBcAjUdhksN9InxpkGJbG3lqZ9TVZ6Tx08yo=;
 b=cFXVXMzAlZB0saTHYpNq80EOlGjGygkIFcGuPOkz6A4Vi3da2feI/fKy9QU6/jWxpuP1jKRabAJOS+USO2+cF04SGehSfH7sR5EIWwzDDN0ksm3QpnAGURJ0l3t3FfbsNUfyP0skW2iFj+vMLAXvcjK/0aehEsMeAONkJi4XDOD7K4kVNbCIHyTrXKD29iQDAnJiVXb6QyAVquTJ/F9Pxa/9igQSAsNvmQohFrntx45zHyN8YozcKC1H7s6s6JzVWGhw2rLNBFTjgf4HIsilA5NN1f/4BD4JGlVWI9z13N7crWp7CIZSmnihCMTqtFGrXcCNWu33n6esemNtN3jG5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10cDCX+HBcAjUdhksN9InxpkGJbG3lqZ9TVZ6Tx08yo=;
 b=OxsO/h0F+gPBvhGTOlDcpsQd2TaJEJeVOLsYd1Wsz9yUTnaM4Ol5I5ATp0hHbevrM0fvr98yaHPma8OtjNAQ0p16gP0PPhfS6xjR38og9n/t0Ah0GiKeZpG2hrv487oO85dExZTpXl3cIEKSfr1EuzUQ+dMeOYjs8G6KT5Ug9Gs=
Subject: Re: [PATCH] tools/libs: fix build of stubdoms
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210908124303.20680-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7bfb511a-2262-948a-fa54-4175550f4104@citrix.com>
Date: Wed, 8 Sep 2021 13:53:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210908124303.20680-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0446.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::26) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 352de6fb-deb9-49fa-90cb-08d972c79c8d
X-MS-TrafficTypeDiagnostic: BYAPR03MB4421:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4421B334A5392CBD95CF61F2BAD49@BYAPR03MB4421.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FyNPTVhvv7OsvdcV4JebYmkyTiDxmlo+JKiBe+FNa5n2l2cAfGzZ/B/4i4j6efHqNhf5IZjoiY62Z/jj6h7M8kqhahsLmZUMSjLSNVoUVkgko01N0qOrUkQ558jobL+AA6x7TkrDiM2Z6Uh8CeMyGK0Gsg6o+ExkBtWRi+7G+5sb12fMXiLYNz4R6s6V9Si0JQ3rI74hL5VLmMFyVy5WADME8/eadQ2NfvNDAOjSorkxahkbA5fQ5fpttNgacWgn2wRSz6sFDSMcXOch0ErAhxQmRzWRxSyqZK3w1jasEzu+xzRfuyYYNPBw8Jk5RUENnL6jxS4/BELQZnBpdYOcEhI00kjCnUNpnFuDCzyYu97EFKifzkOZ9U7/QCAaaW4BDNk/t8rbiXIxwxLR1EDFow5NyWRMpS8OB1AwEV45sLthL98Uh88S1tfUeBSc/QSYE4uR9nkJ9b3fP8UY1sVeU0s1lpOjHHlJ6GSJ4jbLS/xARDYfScKCVYOK947Rfrj01IswdoXAvq+31T5idMHe5nUwsK0FqIhi9GlLEIXNhaV4+Kqhr9/NivNTVPefPI0kJr854Hs6/fURWbUh7Tml93EZSE68JABjkqhW2g/tyu0TuEdvwWvyrK9uZGJ/UpHTN5oNSspAkD+DazVj7JzMZVoSrS22HkPl+e3mNj6Jw4IxRr/sUwUzEmZUQiXYm4C9GHR1xKuycs+op7KroFVgDp4xRMJ1hrVOuJMZI1p8mD8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(86362001)(4326008)(186003)(53546011)(31696002)(8676002)(6666004)(55236004)(66946007)(26005)(4744005)(66476007)(66556008)(31686004)(316002)(16576012)(5660300002)(2906002)(36756003)(956004)(2616005)(8936002)(54906003)(6486002)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFk4aUFEOU9NbkdkcUJrbDdPcS91bHNKemtyeWxYN1h3eEk1cWVTZlVqRm5s?=
 =?utf-8?B?OWNGZVpmQWI5cUxaZXJ4ejdPWE1nR3dDVStZUUJPRnp6TmF6Y1FTb2E3UkYr?=
 =?utf-8?B?enVhYUNNc3lVYTVBcGNJNVdZM2xJajNTTG9lN1pDSEhhUXBmN2xNQWJSYWR3?=
 =?utf-8?B?TjFtSXluNTJKY0VrcnRyZEJrOXh6SlVJTDR4UUpkcmJYTnFValAwdnp1b2tO?=
 =?utf-8?B?U2V5bWVYU1J4VHZiOFEveGtkdHJTREQ5Q2d0MjR1MEZDa1BUQ2llenV5OHNp?=
 =?utf-8?B?dGZnamtkdEU0a3JRNWVidnZqR2VRYXV4R1YxY1JqazBMMDBjT2t0Qzc2Wi9G?=
 =?utf-8?B?QzF6eDlmMHFxN09lVHZibE5XY29oY00zRWQzTk1UbnJMNTNBOHpHdUJBVmRC?=
 =?utf-8?B?QzJ3R0dCd2R3T3JoZzVmSmdKc3lJQmRVTVZia3BkRFNBemo1Ym16R3owSDZ1?=
 =?utf-8?B?UWVxQ1RwVytkZDdiVGo0SHB4dEhBV2lyWlZwVlBDeVR2Z3orSSs3b3NCK2tj?=
 =?utf-8?B?UnYyZ00ydjJkQ0UrTDlzSXJqWHRFVzNCa3JqS0VObmJUbTB0UHFyM2xKMW1Z?=
 =?utf-8?B?QnpDeXNWV1ZDV1NrZmF2VUJ2bWJsYnBDK09nNDhyamJhc09vQkJyUWltT0tw?=
 =?utf-8?B?MFJkWGYvcmRwRURkejNPMnRQWWs4dFFGTld4MUJ5OWcvTlF1R3pXSTZBdW9r?=
 =?utf-8?B?aWs1dVRHOW9NUktud2FWREdWN2tHdCtUZ2w0eWhJbkRFMEUxY3FjKzc1VCtm?=
 =?utf-8?B?NU1SL1FNQm10MnNQZ0VNbGg3M0lXTC80bUJ4aG16ZUVZL1FWNGQ1dkt1UGZl?=
 =?utf-8?B?WWFMMDR2Znk5OGtJd2EveEtkbk1rQzRramNlTGtYS1hYTGZLTUR4alhDUnhJ?=
 =?utf-8?B?b0huSzlhbUhNZytxRnJWTUpkcUhjWGJrWnpSK3E1c3N4a00zMlhMY1I5UHA2?=
 =?utf-8?B?a1cvS1ZoRGFvZXRrWGFoTndNc2E0MXF1LzhQcjN0emtISkZDcXo3aEpjcE8x?=
 =?utf-8?B?NytZd016TWdrRVFiaHJzdkVuUi9MRFdhSGduWTV1MWRLbzBvMW95cDFNK3Z6?=
 =?utf-8?B?K0txZ0lXdmRjbnYrTXExTEhXa2dWaDIzWEpsWWtnTzFUaFZQUEx3eTR5cElL?=
 =?utf-8?B?ZEtuMWNtd3BvZVFLaEFUKzI5SThocUgyTk9xcGNqS0VaRFVNaUEyR2o4Um5H?=
 =?utf-8?B?dGxEZmFtZk5IeUY3c0d5ZE4vV09qZlYwUUlCQ2hqdU0xdUtYVzRaNVBoQ3Qw?=
 =?utf-8?B?bkFJVWU2cUFkMFp2Uy95RmtTRmt0NnZ1Vkx6QndLay8vN3dnTlB6dU51Vndk?=
 =?utf-8?B?T21QMGF0VG5Hc3RqbDdSdTI3YmN5T1UrUEhGRTZyQU1ESklkNEwzVFp3WVd5?=
 =?utf-8?B?UTRTbFM2SW16SlovK3BwUE9MN0RGb2IxSHBVZWJqZHI5dDNlYlZpWjRValZD?=
 =?utf-8?B?WGxQRUJrKzBSK1hiSGVCY2N6L1A3VWVzQWdmVkwwSGx6ZDg5VDhMQXFNZnJC?=
 =?utf-8?B?WVg1dHVoZW90OFA2ZTZQZGVHelJ5LzZrbXNldkNHeFYwSUFrU24wRW1UUjlN?=
 =?utf-8?B?NTlHWk9ZZXlhWFdoUXIvRzVvTk10ZUIwSFp2T0NBL0ZWbFRWQ01XTCtnVmpK?=
 =?utf-8?B?dUlEbm11TWswclMyYmg3UGhxYytkVkEwVnQ5UDRLYWlpTGM4WU9BRzhBZXZM?=
 =?utf-8?B?QW9FK3pXWERvVWxTK09BaU9pR1IvVkNzR200bm40MVlSRkNTMTU5ZE5CNXJr?=
 =?utf-8?Q?DNwg8m9f0a6vUh5v+W8TqWV67Tg6o4yu7Ps7s35?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 352de6fb-deb9-49fa-90cb-08d972c79c8d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 12:53:10.2136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PIGfB+IqY0oP9oIl63VglqSKIMnc8rRBeRie7PhE9junrPhRLvfUdtA/FsOdSx8DRi4jMI/YNCGLwAVcvAFHDHd0efpqnflShakf29ZFbmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4421
X-OriginatorOrg: citrix.com

On 08/09/2021 13:43, Juergen Gross wrote:
> In case abi-dumper is available the stubdom builds will fail due to a
> false dependency on dynamic loadable libraries. Fix that.
>
> Fixes: d7c9f7a7a3959913b4 ("tools/libs: Write out an ABI analysis when abi-dumper is available")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

