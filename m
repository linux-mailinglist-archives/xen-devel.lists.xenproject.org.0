Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B8F3BF8C4
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 13:16:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153002.282655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1S0f-00006c-Tq; Thu, 08 Jul 2021 11:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153002.282655; Thu, 08 Jul 2021 11:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1S0f-0008Uf-Qa; Thu, 08 Jul 2021 11:16:01 +0000
Received: by outflank-mailman (input) for mailman id 153002;
 Thu, 08 Jul 2021 11:16:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qibP=MA=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m1S0e-0008UZ-0M
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 11:16:00 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id de947cd8-dfdd-11eb-8565-12813bfff9fa;
 Thu, 08 Jul 2021 11:15:58 +0000 (UTC)
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
X-Inumbo-ID: de947cd8-dfdd-11eb-8565-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625742958;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3MoJZ9JcCyTQH5qyPFt7VX9OcnzWl1dsyioG9EGBiqA=;
  b=N9dnteD0iKYAq6TAtJeMTUBHKaDanMNtXhxQ+nPA+pIFx52VdJQlMYhF
   iLW0PEydnb+O9mHH7DoeiVC3f8S9q7fcVIyh9VPp+z9x3GzcKV5r1GopE
   YBZmvj9To/Ou+1cIAVj6gX82gr0ojea5/f7sVC79qNWvzxT2rrVmYC4I9
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: f+3oZqNBqUMQxF0l7ib9xgyqd/HNdPryT3Z9K1M3ciz2xRKRsEx/q71OWwUAowthWznGJ983kM
 Mhk/qbFlGZrZtXivihZtrrxuZdcmoK0oYu6xEb6XafCGlGZy+4kDS2DR/shcbhFtgW5lnm9YrQ
 GPrd6F3GAcRr8kU2DHKljgOnnJUKKJypvq42m+jLb4bRevnBDsixi83rdYCnEm0TV9oWYCoFfP
 uC4O3qjdK94WK50FBfCu8u3UYi0G/x+YKHXzxH06oPvOXoKHzz9zHlrYnLw+uNkRNAA0mDu2gh
 qd8=
X-SBRS: 5.1
X-MesageID: 47816510
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Jw/46KhPaG4CSKi+6dNkfGwnlHBQXtcji2hC6mlwRA09TyX4ra
 6TdZEgvyMc5wx/ZJhNo6HkBED4ewK5yXYxjLNhXotKPzOGhILLFu1fBOLZqlXd8kbFh4xgPM
 lbHpSWWOeaMbAW5/yb3DWF
X-IronPort-AV: E=Sophos;i="5.84,222,1620705600"; 
   d="scan'208";a="47816510"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6wkGa03wHH7gREupybBkjWTnXnT9/sI23REKdNEoVG2UFH2URc4C3Dzw/adLIW0Ue7X8KzVGXuYM0JuPAR+N84sqwRFz+y7M+BcrE2vm6vPmHrL11e93pcPwB9LmNuddmLFQ9IqUb9YLZ1WnHOg7o/HqOrRCXCldzS8k5bEAmdZsAkWnIvicO5ee+W+vXWwtXa2Ncln81SyBs4ssry8O2kSkMonufaly6UjWOg1H0+7CiQEcvuVwEhbiav3dBqcjoAoXA0Rgk5tXtqVPcC8Rm0qbnxY9KnShmfw8XwSGUJQmh/y7MKJya3NivqUesQ4/CYuSQmzzdod3Z7qNi744g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMXIU9hE9xko+HDwqxD9aIlaGPvtgEvYN145lL8FbHE=;
 b=cIXyDIAAwalTLVfkU/Tr9MzOJuW2Xt0xnF/CEiKNQREiIGECeUDhGZjRr249vfhOfycbn699+JuLj/7SIR1qyyjoRlr6Q6eSVvwmqwA7ddZ7YAl/4XqySDShUCpM7p/sM0+Ktboo4YNpDNKKW69gDhgTwyR9KNA9KhTHbVUeS8obqz72YgBCpfn0FduDAV4iGaBQS5BwanxZSwtuK4Di0ir8ocWdYElIO43imHiWs4bx4u8hp3Hf26bcBACmhwBSIe2foaABnlGDELr56acK9A9h91SES3QdFbD1ySOdXILVU25RzLmxKPgRMgpOQMSRINIp5rhesHIzDMdJyOBm0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMXIU9hE9xko+HDwqxD9aIlaGPvtgEvYN145lL8FbHE=;
 b=GAH9lke2ASlygk87I7XcYWcS7Zwucxb/2rmz/1wmuOoBJa0XCKBSl1cCZi4yWvaEJa3wi4tPHzks3xjA0QsJTbVxi2ukiO2E8Z/+JEUIZnnBEgZbAuf7kLsVwRRVQEdOqFpY6598TALkUHw2AXs1CjD4khZ+wguP3zJ98L0P1Hc=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Franklin Shen <2284696125@qq.com>
References: <b9bbc584-db3c-0b03-0314-3dd907f645bc@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/PV: address odd UB in I/O emulation
Message-ID: <30186860-de22-3e71-bdb1-52f42b0394f5@citrix.com>
Date: Thu, 8 Jul 2021 12:15:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <b9bbc584-db3c-0b03-0314-3dd907f645bc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0098.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5e0e141-63de-4539-a3ac-08d94201bfd9
X-MS-TrafficTypeDiagnostic: BYAPR03MB4245:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB424520370637F2424F7144CFBA199@BYAPR03MB4245.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KPVoF8nYgX4++EQ59i8GKZgzviFLjuRdBvlQ3DlnLzbF60KPuY9Azck/RHoS4q9T9m/UdL7BiKHf6NBDgmyRlR+DPPEQu5hu0qitSBwpHmnoVbLVw380Cfk6IHGmyVZqbzU1y5Opps+qUnvp56AqRCItcSSNAMA2zy3qBL7BaiERHE2eYXeL0lMA0DudPl99oLh7lDKQPp/43PMtsvCkXR+5IIQ8tIV4Otx9ghhaU2EIUwZXGoHfE27BcIeooILNDl/8m88yLyLQOhLqlFrRuGVDT9gi14n2lcl9FXv2/acyZTatNaWgaNU2sGOwL9uUNXYf1CElkU00De57XeQXrUF6y2ht1mohPAiJat9BbN5VglWj3sRHbQ62Yc+gDSzpUtZ1SVNUPkp0OYdfxNbi9xSvfXNWIoK5nDFbLezhJBgaVYNi5bBpwus+YcGrMO0G4ExJHR9onynaVfnDXKRiSB5rTz7CEGo7W18Xo1EIYm0F18y57kD9a8UNb/ApHWwVntnwTwgDSReu/jhagjRJvFBokKlMz+Rl/aWc2gJjgHGnCMeGC0Q9oHalKakiYD0DYTFxc2ja8KDTogYbtKDVwVbdD0LkCztHuIIMtiNuM6K50uEInnWKkG1jCActo54qGU+ppQTzI0u/6KJtu+k093AgCh7o+bg8YH9SvrezU8V7BHZsM5JMXkrsjt9RzRXQ32mEGuJGTyBzcgQ9sg7/bHUtB9vl26ObwIxQh5igohY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(110136005)(16576012)(316002)(2616005)(956004)(4326008)(5660300002)(31696002)(6486002)(31686004)(66476007)(83380400001)(66946007)(66556008)(2906002)(478600001)(26005)(86362001)(54906003)(6666004)(8676002)(8936002)(186003)(36756003)(53546011)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cktONlkwTVROSEptV0dzK0tiZ0QwVXpiR0NtNmlWS2gwSkU3WEVnbW5mandE?=
 =?utf-8?B?QTNUVDFiVkQxRVBiVjlZb0FkS3dNYVNrQ0xNOHcyaUptWmFvWWJEQWRBY0lP?=
 =?utf-8?B?aHdlQ3NtNkFyZkM1d2hNakRNaFh6R1B4NVBncSthSUZqSDdGelZhc2YwZklR?=
 =?utf-8?B?alRqUHI0SHR6UUdTdHdoRU90bTRaS2RLNzVaOHpybnlPeEsvV3F2bHM3TllE?=
 =?utf-8?B?U0VlSjZaUGhwL1E2dk5MVXRZd0ZaNWJYeWJ0SFFPSWdVbTA1cmJlMHpZYkpU?=
 =?utf-8?B?M2hhUnB6TS9mL2o2MzRPWUFNSFZNTVJqbHdsYklaWk9kQVo0M3gvVUxRVmhI?=
 =?utf-8?B?SWNEdGJZVDJqMHozQlNMcWVuaGxoTkJJSUU2UDAvME9IYnphYnoxVTQ4NTEz?=
 =?utf-8?B?QUJGUGJkbU1udjhIKzg3QTVJQXB0V09KQW5Sb1FYaDB2SzBsQmdidUpuQy9r?=
 =?utf-8?B?aHlZbXZhSWgvdjY2MVhFdWE2YTIyNElQM3BoL2liQ1hsajh3d1NrRzhxck9Q?=
 =?utf-8?B?NXR3Y2xSMWJXRzZ3cm9UOVJWdkV3Y0gzMUlXRzNoV1NyUDg4MktHN2Y1cS93?=
 =?utf-8?B?SHdET1I5MXF6cVY0aVVwcEdqNXZDY3FiL3dSQVVJdkpYTFRxYjhEcU45ZzJX?=
 =?utf-8?B?KzZoQ3A2OGRzbVZnOFdkTGJTdjByWXhSbGlUamQ3ZW9vUm02ZElGa0RIZmNM?=
 =?utf-8?B?T0ZBN1YwU1JyZCtPZStNUU44a0FVTzJJVDdmU3pNbmpvbWNCSk1TUkpSUlor?=
 =?utf-8?B?VUVjMjNHcHhpR2ZCRTJHNGpwVGtuQTgrcWdjM3BVaDIzdEMwcnc5ejd0bXYz?=
 =?utf-8?B?YWhMK2UyeCttakVQTHI4Y2g3Q3hUYXB6YzBCblBFb2daNXhPYWdjREZycWRT?=
 =?utf-8?B?cWI1blVFQjN0RjJmRXNNKzJtdVlqcVQzbHBTN3piTkFZOS9qWjZPUDhtOGZo?=
 =?utf-8?B?VmFRWjBIaEg5N2Z6dStHbkVPRDFuTHZtR2FiOE9YWngwT0hMUEFsNHRBZnFR?=
 =?utf-8?B?eGFpRWZLRVJscmJtQ2p6NGVUeG0yZ0NQdjllRThpS2pUMGdWVTI5QkZRVnVq?=
 =?utf-8?B?T0dpeEZhL216Nzd5NUdaNitWMGpzYW1GQld1ZVZLWitTVkF2ZFg4bTZTV2Ro?=
 =?utf-8?B?MExqajZkWll4TmU2WEU0cG1oZGxtVUlOdDlTdWZkTGhGNVM5R2NqdGpVWmZw?=
 =?utf-8?B?V1BaWkpnSTh1U2JpZUk1d0Y1MUs0dGNvczNZYUxsdDdPbnJJczkzLzBMWjlY?=
 =?utf-8?B?MHpHTm9CRWFMNTJNSnd4aFRIdHJPRVdMM0NqeHJGdmJPWjloZmFFOGdLUzRP?=
 =?utf-8?B?V2xqUnNpM2k3Z2gxL0llOFpCZlV1bE44Rk1lbDdGRG5kQzBMNEpzREI0RVRG?=
 =?utf-8?B?Z09NWmgzVWVTV2xQQTUzSUdFVHBGZStCdllteENxU3ZYQytGaStzdGFLQld6?=
 =?utf-8?B?UEJ3LzJVQWl6b0RTaUhIdEllY05sWnpGUlF3aWpSbTgrVjhSTGluaEF1MTZV?=
 =?utf-8?B?Ukx4RUhjRzlhY3prb1NlQW9oMGdVRVdJaUZoeFBxTUpZbXFoVy9xUGlySG45?=
 =?utf-8?B?c21pQ1c4cWtHN1FKSk9RdFYyNWpxUlRuOGZOc1duK0ZSWVRhc3luVTQ0U0lH?=
 =?utf-8?B?Q1JrWlozcmpheXczN3U5Qi9FZ3lFZkZiSytvMnQ4MmkvMU5pRmhwSzdFVWZk?=
 =?utf-8?B?YkIyeEVyUGFVekpQdERORXJWMUxpZkYyQzFrWGhtMG05Qy9nd1B0MUFPeUwr?=
 =?utf-8?Q?WewqZDxLoaewWf7DFDH9SQXyMOlTfcbEfxBtTf4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e0e141-63de-4539-a3ac-08d94201bfd9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 11:15:53.2746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qMhH5MjCtbFEdqV2wnBWjcEvKhzQCbfXc+jeGMDczI/v9u1V+kAJ75J/PPZWaCK2VkoW4lkt2O/FxrBQxeU/M5hMRSJnR1jMY0BzIlsIc6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4245
X-OriginatorOrg: citrix.com

On 08/07/2021 08:21, Jan Beulich wrote:
> Compilers are certainly right in detecting UB here, given that fully
> parenthesized (to express precedence) the original offending expression
> was (((stub_va + p) - ctxt->io_emul_stub) + 5), which in fact exhibits
> two overflows in pointer calculations. We really want to calculate
> (p - ctxt->io_emul_stub) first, which is guaranteed to not overflow.

I agree that avoiding this overflow is an improvement, but as I said in
my original analysis, (f) - (expr) also underflows and results in a
negative displacement.

This is specifically why I did the cast the other way around, so we're
subtracting integers not pointers.

It appears that we don't use -fwrapv so in any case, the only way of
doing this without UB is to use unsigned long's everywhere.

> The issue was observed with clang 9 on 4.13.
>
> The oddities are
> - the issue was detected on APPEND_CALL(save_guest_gprs), despite the
>   earlier similar APPEND_CALL(load_guest_gprs),
> - merely casting the original offending expression to long was reported
>   to also help.

Further to the above, that was also so didn't have an expression of
(ptr) - (unsigned long).

>
> While at it also avoid converting guaranteed (with our current address
> space layout) negative values to unsigned long (which has implementation
> defined behavior):

?=C2=A0 Converting between signed and unsigned representations has explicit=
ly
well defined behaviour.

>  Have stub_va be of pointer type. And since it's on an
> immediately adjacent line, also constify this_stubs.
>
> Fixes: d89e5e65f305 ("x86/ioemul: Rewrite stub generation to be shadow st=
ack compatible")
> Reported-by: Franklin Shen <2284696125@qq.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I'm not going to insist on the part avoiding implementation defined
> behavior here. If I am to drop that, it is less clear whether
> constifying this_stubs would then still be warranted.

You're implicitly casting away const now at the return, which is
something you object to in other peoples patches.

>
> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -89,8 +89,8 @@ static io_emul_stub_t *io_emul_stub_setu
>          0xc3,       /* ret       */
>      };
> =20
> -    struct stubs *this_stubs =3D &this_cpu(stubs);
> -    unsigned long stub_va =3D this_stubs->addr + STUB_BUF_SIZE / 2;
> +    const struct stubs *this_stubs =3D &this_cpu(stubs);
> +    const void *stub_va =3D (void *)this_stubs->addr + STUB_BUF_SIZE / 2=
;
>      unsigned int quirk_bytes =3D 0;
>      char *p;
> =20
> @@ -98,7 +98,7 @@ static io_emul_stub_t *io_emul_stub_setu
>  #define APPEND_BUFF(b) ({ memcpy(p, b, sizeof(b)); p +=3D sizeof(b); })
>  #define APPEND_CALL(f)                                                  =
\
>      ({                                                                  =
\
> -        long disp =3D (long)(f) - (stub_va + p - ctxt->io_emul_stub + 5)=
; \
> +        long disp =3D (void *)(f) - (stub_va + (p - ctxt->io_emul_stub) =
+ 5); \

The only version of this which is UB-free is

long disp =3D (unsigned long)(f) - (stub_va + (p - ctxt->io_emul_stub) + 5)=
;

As long as (p - ctxt->io_emul_stub) doesn't overflow (which it doesn't),
every other piece of that expression is well defined when stub_va stays
as its original type.

~Andrew


