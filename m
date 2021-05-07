Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A353761CC
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 10:21:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123807.233597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1levjd-0000ac-2j; Fri, 07 May 2021 08:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123807.233597; Fri, 07 May 2021 08:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1levjc-0000Yg-Vo; Fri, 07 May 2021 08:21:20 +0000
Received: by outflank-mailman (input) for mailman id 123807;
 Fri, 07 May 2021 08:21:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4HO4=KC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1levjc-0000YY-0U
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 08:21:20 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4481b7a-8875-4225-b720-f651ab1f4270;
 Fri, 07 May 2021 08:21:18 +0000 (UTC)
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
X-Inumbo-ID: e4481b7a-8875-4225-b720-f651ab1f4270
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620375678;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ZIh6UFaSwKCVV7sjBYWhxaFIzbVa8n+hG+bEuBG2IN4=;
  b=JaIw+VIyxgW1mmqeotKA6rYH2IhNIv+PdTbRmPgSgHSvPzP2VlNzgIqc
   EV0DYcnrfSR0bXfi4rzAD4O71CRSZ0yi+U7iBq/seqmR/VKXjtc9ZfBzQ
   cYgNZVWm0eFXgpQtQKLXkg98RiKvt9cKWNfTJZRkLysbcsw1BigOA4pmN
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 75PaO44ZiXGJaDLGySM59f5Pr15U3xQjgA3fFaPxBVC7T2cnkB2enReycUdfTBoBIMxCbs0tZu
 RwrKi+WwRbHA2FHZgNNWJ4VJvuXwsRKM8WZma4JTmeikEHpwMVQCHDC+dr2+qxn0mBPUDYp+3Q
 rBaCcVGDlIZGv5+2MBkAP/fvlT/fhQ1dfZYGM5OweJyCHJaOLtX2pNEA81MZmrpVZ3iwywsBzE
 kwJ+xeBGWRA6+QvXgt5+B1Q8w4NBhrlsyaHf5t9IG+cRlaUeftPd9lsULweghyZiaocOePHii7
 w0M=
X-SBRS: 5.1
X-MesageID: 43087042
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:mBU9eqNziMLnbMBcTjujsMiBIKoaSvp037BK7S1MoNJuEvBw9v
 re+MjzsCWftN9/Yh4dcLy7VpVoIkmskKKdg7NhXotKNTOO0AeVxelZhrcKqAeQeREWmNQ96U
 9hGZIOdeEZDzJB/LrHCN/TKade/DGFmprY+9s31x1WPGZXgzkL1XYDNu6ceHcGIjVuNN4CO7
 e3wNFInDakcWR/VLXAOpFUN9Kz3uEijfjdEGY7OyI=
X-IronPort-AV: E=Sophos;i="5.82,280,1613451600"; 
   d="scan'208";a="43087042"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJkdUsbzg+SsCm99pWdzJ1IOJH/c+IVjAWXJVjPA4eA7W3fBfLBVwMhq63+e0S0LQDi+jU8pphYnrhWuKWEfISuwM+dy9/HmdTcpYyteEshdM8vQYCw7hjgTtAomfgpjUf58eTmNYy/ot4acbb01MkxRw5IiWYSxN4SNsrWchkRnjEaH0N+dgFLdvNjcuZc8bIkR/Db4AP4lTkYTt0jDawi5CZYi7m9qVsfGyCYXh9Z8UT4TSOvF+say/+52l7+c9pCqUasS3YM6vCjfv2SX2ejy4VqRIjR/a7CGqi/+PgOdvn2fOcq20hOw/AYGxoNPNIAuo7C4szYClxMyLaS8zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyRXKoIuo4CEC3Qf6JH6q7bcHQSVweAvWdr912tnoNE=;
 b=ddoHkrT16YTsxvo/aVbX5PlpZxBUYkHVt5PLHOZsPPo+oYTzqXzwKi6eEoOxHG60gnMoA5gN40vv1PwZe+dReydGgp9za/PKaVceIlNmMl7zH6b/cCHfagfDbHJ2cLBdtm6AsSVYZHRCBvVTeNcZaCshxBXFMm52GPWlh8M1EiBClOm2WXfJFBoqDC1B3F1si50kX+0+HL52zTxcqeLDK5n73Pg7eBCUpI0bjFYft+9V1f9q2fSRtN24/khoRT+JmfFrjedoumUIPh3LwCL1EYDWtxqWBpkC1KSKtiB3FlcwyDNPw/Ls+87M2EJnN4bpr9OwiWSxFa0HIbe+rHlxWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyRXKoIuo4CEC3Qf6JH6q7bcHQSVweAvWdr912tnoNE=;
 b=okIYxpwfiULm3QIykU2CgAlkVRcATNtQvZ1ZHiheaYn4+5nyJKZfsU2ZbnwbgeERanN/DD/Ps7ZFUaQ7y2tu1lEXhXfsLEj5BeSEmA1OaKwz+vjjuhp4mE2FRv0XuuxicP6IIZ5OirImXX/iiFZ5ayOQbZwHJxp0UMnVTW24Zh0=
Date: Fri, 7 May 2021 10:21:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/shim: fix build when !PV32
Message-ID: <YJT4cV62lqFgFKq/@Air-de-Roger>
References: <08ea57f0-732e-fe12-409c-5487fb493429@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <08ea57f0-732e-fe12-409c-5487fb493429@suse.com>
X-ClientProxiedBy: MR2P264CA0116.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be8ec20d-a38f-4831-014d-08d911311277
X-MS-TrafficTypeDiagnostic: DM6PR03MB5081:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5081D40CBCB365EF8110F9CC8F579@DM6PR03MB5081.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8GsDpRWxUweC08RQ+F4AT08d0LSRU2qc2LczfAh6iLbnidAInKTwa8w5Hh8zvxLwvO2psPMo3OHsSUzDwO6udXtfHZDODSToIQesdoh9FuiHAx8TU5FZXMcA166+N31yDkULzMTU3wOaIDvaRQByKZeQ2BhlpWLbA4EfUAlUiAjJHMcbJDIj95fyZTtDy0Ex2CYxVpJuANfuDV5j6Oms1yKrJ1poyLmDdZ9fnaOYFAuf3z3z5AWyn2Gx/K5urJuTsdt1FhVUva9r+9S1lzjdJyBYTxZ2GzSZcuLRo2EMRMy++qBvte8ZvcPlBV8vh243brCct5dB82NJvnWuNFXgVz8iPnWnKpaZwut+jooYQeoPdlZxv6kLXRO8y5VmNXU2eVZ/X87V7tllIEkCPN7Jk0dzjbedAW7honeIggv9FjL/p/B+wyWhutaMzIjlYtQUqfwx8QLc+dgHGMGa15ALRFdLdo/p51VNXs85O6Lt+Oey+oN3Dg/9wkOi8pxGYSM5Gu3/DCIuQ99JAXq1Ms8REYjdNR2hN5KThjHc6KNJVWhReRVaD+zffC0Xy+6B+KdAQP7bLYaYyTLt3dkyR7XforzsYthA2zzKeElZhSof1BQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(396003)(346002)(136003)(366004)(376002)(6486002)(86362001)(54906003)(26005)(38100700002)(83380400001)(6916009)(66556008)(66476007)(9686003)(66946007)(956004)(2906002)(4326008)(6666004)(6496006)(33716001)(85182001)(186003)(5660300002)(16526019)(8676002)(8936002)(316002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WCtFb095OVJibXlNTHJFUG41N1Frdjd0QlBuWmd0bnJVaGt4S290VXZGT2FI?=
 =?utf-8?B?am1Wa0VMNlNvaTNhbHJtS2Vhd0RmUEtPMGdpYUR6QmtpWVVGQytTWERZU1hK?=
 =?utf-8?B?RzhjTFhwVEJuQzBHTEZjb1lCdGVwVUJwaklHaEJmZThXeFMyT2V4dTd5OWxa?=
 =?utf-8?B?SHB2MTk2Z253WlNhUy9yZ0FFRVJaeGdBdEE2QVFzaUpxSFNtYi93VldkSUwy?=
 =?utf-8?B?TFBGSnRHK0NPRHowZDZmWGFvcFF6WndrOS9LNE1BNU42N1d1djZwN0JUOWF0?=
 =?utf-8?B?bDZSU2hxNU1rbWpWamJmdUtCbklwN0FOczByS3dkRzAyRTVqYlQ1aFRmODZj?=
 =?utf-8?B?UllpTG44Q0xvd3hUZlFtV1FhMVNhSVBhMWo1b252WVNsM0lnMmVGMmJkWW41?=
 =?utf-8?B?OXlQKzUzQWxwZjFNWlJWTUFacldvSEJaVU5XSWp4NGs5L0UrQ1d3V0R0VFV0?=
 =?utf-8?B?QXlCY3BtUWM3LzhpMFM0QmRDMldITTREYk9BZml1NEtoc0x6cER5NGp6eVBV?=
 =?utf-8?B?N3pCeUZMQzQ5QnFVT1JiQUdSN3hsQWE3UTNobnNPQXBnVi93cTMvTHFkcWhT?=
 =?utf-8?B?Z3VLN0VjN2tIZWxvT2MxVkRWUjYyWm5MTUJoOStwMzA2WElrL1V5MHBCZ2d2?=
 =?utf-8?B?WER1aWJhdHVnZnVVbGlkTFlYVE1obURyM09CRDFyQmpxL1JhWHhCZEp1Skc1?=
 =?utf-8?B?RW0rYkxJRHFZZ09NTzNNMDZKWkZWWlAraDBrT2podk82dXEzQmRTVkR2VHdC?=
 =?utf-8?B?Sm53NHZIZ2tDRENjRmZ4dHh2c25yS1ltQXp4MWd1b2xBUHFTRnNGOHh4S1du?=
 =?utf-8?B?QzhPcDNrdkpXUXNLTE9MaGNoRnZrMjRZUW9WY2R4bjc3MXNuQ1JXdEdJc3Vy?=
 =?utf-8?B?cU5KamQ4WU12bnR5VzJtUENUL3VzVW1DQUtndUsyTUI3QWFoUkhnRHphYXZB?=
 =?utf-8?B?KzZ5Mm5sZkdmZVREM01NTUNBb1FlVS9TbFQ0WGptV3UxMWNUU1hnUldGZlht?=
 =?utf-8?B?RnhIYWx0L0kyZGhJN3NwM3U3d2tMTFBBYnZndkdySzFRY2hJdEw0enNuUTRF?=
 =?utf-8?B?SU1RRzcyNVF4NlJTdEtrK1NXc1I1TEJ5UklpcGNLbEJ3d2FmaHY2SjNTSU5O?=
 =?utf-8?B?djNaL0hsNnNodUpWT3c0enFBME5mNzZnaEVOek1PaTNqOE9NejFWZlExYWZR?=
 =?utf-8?B?T3FTb29YM3h1L3ROcTFoMUZDRUVINWRjSmhNdGlaY3Vubys5bnB5aDZCQzhU?=
 =?utf-8?B?WEFSVEkrYlR6TXcwK0RnWEhhbDNReFAwNXBBSVVnb1lVREpoSGJmUktLMmFv?=
 =?utf-8?B?c0RvR1JPR3o0WHVGU2FKQ3k0YjZ3NXFzbEJpOXowdHVLZ04ySjZrdlcxZ1F2?=
 =?utf-8?B?U25OUkQ4ODd3a3N4Wk14NmZrWGpKS2RKVDQxVytzMEpoNzRMT0JFK2YyRHJS?=
 =?utf-8?B?citISitBRy9JVU9wM05aY0o4VkcvcUVTNUJ0bFRNSS9RVFFDSUhpalVzek00?=
 =?utf-8?B?b3dlcjdEbktBMDBaTWxJeHVWVVJyZEFjRDdXcitCbXREUG9ISU95MjVVUWwz?=
 =?utf-8?B?VVBtdkFwUDNvQTdDZjZIMkFnQ1JCaE1UYTFRSWp1UVliT3NOSDJTdENuNXU4?=
 =?utf-8?B?MlJUVkdUbG1yNUF1cC8wejBWQWY4UythTGYrZytnSk5qcU1zeWNjcFIzR082?=
 =?utf-8?B?TmpneStpSml2a2JQdXBQd0pTYTE2UVh3RnpVckphTDdxWVI2SVdqUnJ1L1NF?=
 =?utf-8?Q?vBJsVpnHAD8MmDDGKMnlo8/zKH/pdILkWgqrWw2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be8ec20d-a38f-4831-014d-08d911311277
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 08:21:11.2774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7rgUaWpw7qb4Ao7yym42n1TPpI1esfwQZ2SkZRCxwv9KqQoDHm/UUy8AQ5O1sg5Ey84XMwHipZXNByI18cW/hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5081
X-OriginatorOrg: citrix.com

On Fri, May 07, 2021 at 08:22:38AM +0200, Jan Beulich wrote:
> In this case compat headers don't get generated (and aren't needed).
> The changes made by 527922008bce ("x86: slim down hypercall handling
> when !PV32") also weren't quite sufficient for this case.
> 
> Try to limit #ifdef-ary by introducing two "fallback" #define-s.
> 
> Fixes: d23d792478db ("x86: avoid building COMPAT code when !HVM && !PV32")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/pv/shim.c
> +++ b/xen/arch/x86/pv/shim.c
> @@ -34,8 +34,6 @@
>  #include <public/arch-x86/cpuid.h>
>  #include <public/hvm/params.h>
>  
> -#include <compat/grant_table.h>
> -
>  #undef virt_to_mfn
>  #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
>  
> @@ -300,8 +298,10 @@ static void write_start_info(struct doma
>                                            &si->console.domU.mfn) )
>          BUG();
>  
> +#ifdef CONFIG_PV32
>      if ( compat )
>          xlat_start_info(si, XLAT_start_info_console_domU);
> +#endif

Would it help the compiler logic if the 'compat' local variable was
made const?

I'm wondering if there's a way we can force DCE from the compiler and
avoid the ifdefs around the usage of compat.

Thanks, Roger.

