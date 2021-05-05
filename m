Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E31373B7A
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 14:38:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123101.232211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leGmx-0004xn-1P; Wed, 05 May 2021 12:38:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123101.232211; Wed, 05 May 2021 12:38:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leGmw-0004vw-UD; Wed, 05 May 2021 12:38:02 +0000
Received: by outflank-mailman (input) for mailman id 123101;
 Wed, 05 May 2021 12:38:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Yav=KA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1leGmv-0004vq-Bc
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 12:38:01 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a11d802-2799-46ba-953f-48501149e2e7;
 Wed, 05 May 2021 12:37:59 +0000 (UTC)
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
X-Inumbo-ID: 1a11d802-2799-46ba-953f-48501149e2e7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620218279;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wThaL1/1b8H4ZycIP4FD3mRmVz2MePQu5xqwAgYktI4=;
  b=Zha6PIgI/UnKa9S2l8zjym6IFRG3/HQxDK1giiNT2zYxLAngjdEaVPXm
   dYjizyoMoxkFhchLckH/IwIe48YdwVTbx/zi+Hgfa5q/gF9+JSEr9vIot
   +PQxrVmOJX/15KeyoPAhnBTM9M0QI9I3QozdCwlvfT1TYEbCak7bLWW+3
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: YSJSIbFYduA+SSmUOiGIa4QTQ0i8Dr+qRalrW6JP1n4QwuoALYzbGZXd1/KLH8W9F8H487CogA
 JmwNAzozolaoF9SZXAGLTuGl//Olz5dkY9IFgs87D65S+RGTeYE/XMlr+eYKhIlHhx0VSZ+eiB
 PyRK4bi9wA4fH9BXCRsgkAOSFEG+O9K++gLoaIa66OIQuIrkTpwDFfUkEvCE7gO4gBuvsADGke
 14SFmLAJ0d407CsRc5Rj2I+L+C3ZyERjDpOHbOn7Se2wGouAgSS37leWVcz6SKUkH/0N3GCrUL
 hWQ=
X-SBRS: 5.1
X-MesageID: 42914401
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:7cNBTqgcldEQXG74Hxr8FdEht3BQXyl13DAbvn1ZSRFFG/Gwv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmKJdy4N5B9efdSPhv3alK5wn0Jv6z1TbakvD38N+9Y
 MlSahxD9XsEUN35PyR3CCUG8stqePpzImGnuHbpk0CcShLbOVa4x59GkKnFCRNNWt7LL4YML
 bZ2cZdvTqnfh0sH6OGL10IRfLKqdGOtL+OW29kOzcd5AODjSyl5dfBenD14j4kXzxC2rsk+2
 Te+jaJg5mLiP2n1gTak1ba8pU+orDc4+FeD8+BgNV9EESJti+UYu1aOoGqjXQOj8yErH0rl9
 TNpBlIBbUN11rhOlubjDGo9w3p0DMF42Lvx1mCkRLY0LLEbQN/MeVtr8Z0dQbY9loBsbhHod
 N29lPcjbV7J1fhmznw/NfBXR0CrDvFnVMS1dQ9olYadKl2Us4pkaUvuHl7Pb1FIQfBrKcgK+
 VqBNG03ocqTXqqK0r3k0Mq/MahRR0Ib2+7a3lHgOO5+R5Mkkt0ykMJrfZv4ksoxdYGR55I6/
 +sCNUSqJh+CssfbadKDOwcW8eACmvUXRLWMG6JSG6Xbp06Bw==
X-IronPort-AV: E=Sophos;i="5.82,274,1613451600"; 
   d="scan'208";a="42914401"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=muFhjTwEvjLX7x/EKX2GqLwAQPIVXinlMW8FdZxPrF/qhQf8yTHQjRWMu16jomebsqt0Oyt2wZOl6rP/5BM1y016Ock0iRT2h8OIh5orHyhI28LNJyR4LL0v52HoILC+aWtouaamJqiOhQf95RGivyGTzYepGvIThWUkC0E8kcNj2whTy/0G5UbCa2/enyj8468AY/npaU3maUEHEK1B0Cq4OjC0waJdHLw0Kth+SzR7uWb2FRpQLqmaNGkMZeghHgfpXu3Ixh7coP/mmB6WRYjQpRKN3hlYbMsgSO0USu4yilfF7olAY8CazoH5bcqnfCo0qJ64N2mLnX7VcFx1yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRO0Dug3qr2b3APCkU9Ypkyol+ra2DldETw5z4uCQA0=;
 b=O43rOf+xTW3NPXooPSsxMGy1JYUIEjOgl/NMzE0I6ugfGKwDer1Dv6SHdaDzSKVxKIhioKL1cbKm5cvu3UI3f0DInXnMKjnF630lHGFansMqTRxLs6L2xvXpqgntPy56Ivj4/fNoEk9rf6ovcCm4oPpiocWwrL5tAZ8cmLlx45pUr0Sk17wORx7YcANseeRsqZFvjX056prBHimrDN3RoSetKmZE/lRlniWAmqwNMtYjOzQIQkxy57iqFEq8cyg0mQtmEKHY8UKa9d3RxgOLZgJWH9iltn0Pi2eVk/3bPGxGg4/R19E1m+vSAJGTWAtSkngbOTiyITRu4kUr1msh2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRO0Dug3qr2b3APCkU9Ypkyol+ra2DldETw5z4uCQA0=;
 b=UNj1hwkp2P/uBlyJ5Mu/ilycMqnX1cxe922b/6h0OMnL6cZpsNKoWJN1hSwHMu74WPs1T1JFkYYZppsPcKNcXBOixQvRUBIxpWlYMBv2555H50hvvv5Jx2T8HKM//ndJH068Wi67JNBMTQKk9lHnN0pcTJcppKK9bXSx0m/6UsE=
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20210504213120.4179-1-andrew.cooper3@citrix.com>
 <YJJtqyDOIkMxjvxW@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] libx86: Introduce x86_cpu_policy_calculate_compatible()
 with MSR_ARCH_CAPS handling
Message-ID: <8f6f339b-f025-2cd0-e666-a3083e79af3a@citrix.com>
Date: Wed, 5 May 2021 13:37:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YJJtqyDOIkMxjvxW@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0496.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b129949-4bfc-4a8d-0abf-08d90fc29b68
X-MS-TrafficTypeDiagnostic: BYAPR03MB4871:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4871B665B5D6AFCD9A4F8D9DBA599@BYAPR03MB4871.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M0aokAT08aNY1SaQTmNMQ0FxI7q5FoRqeMNtXrVGnsPFdfvzidx1d6P6PclSwLzmANfGNNPlwPYMtURfe8EeSqNLZs43ULh2UDjriXQoyg15MCJMSFs8zHfYHGNLIDY4FYYCf1oGIrsC0eIF7dpgiYB4pw0EPTLDNpw7F+43mZ+mDgLYN7krI+8X8aPNHq6LJySpqsT28axEICSgYUqw3b728r+7Dzc9l2ZXrnsSZe1YVryN6QFupp36Jz0BmQ+zugFkdwx5W38O21KWtoDnj9UnXvO394CM3KojCuXRy3ShE95mNYmBUqKdy+U08xf09NCMB9Z5LkCSzh+F0IyOQyBXds8UnBmaxZD5oHZ8eS1ZlsVU+ynre5H+H9xzFPJuAGu619gdn9M7s1rNAmC+Ymt9JDEARoF4wIOjFlu1mVYWwpk1hBEkF4HzA/kIMOQs0699LtfFqsoz5F8j+9jHo8DtrPMLJ/Z1+GCMN6KZ/DDJAd3HhYW3mc2Ll+zfA4r0EQNy/T6MdBYgOiTexFXdT+dl1cgxGtdTBlHU9Y3LcaC0QCnpiAxRZXS0yd02JS9WFgKjsjaT+iOGCxsZKbnBoHUwnQk+uYf58I58vBpSxrIze2KXGF7RdidAvmKOOo2ZTEC1mCzlutSaouFoCRrwn/gB5RpkgQvUf4UMfBc9N40sJMhSUtFCrj8C3+RmkPT4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(4326008)(5660300002)(478600001)(2906002)(6666004)(2616005)(53546011)(31686004)(6486002)(6862004)(956004)(86362001)(8936002)(30864003)(36756003)(38100700002)(66476007)(6636002)(54906003)(316002)(8676002)(16526019)(37006003)(31696002)(83380400001)(186003)(66556008)(16576012)(66946007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZUhSbm1QQ2pxQ2NjZm1PRHQ2OTJBZ1d4K0tRMzFEMnhXOVp1cW5FZVJWK2RK?=
 =?utf-8?B?Wkd3YURlUUxSZFpwODhvQTl1Z1Jtd3FDWlBmWDhXbkdpYWpjYzYxWUNhTk9a?=
 =?utf-8?B?M2FPQXA3aExzSFRjb3ZJOE1kRjhobThId1pUMk5wa3h3MVFVM0FsY3Q2Nkph?=
 =?utf-8?B?Snk5TG9BbzFxbGVKY2pKbUdXMWE0bUw4eERnaC9iVDJyZUF2RTNUaUZUaVNs?=
 =?utf-8?B?QWx4amF5ZHlBMktqL3AvMmFrcDR6OURBWGJ2MHZScTh6bnpCN3RoNUx6NFVv?=
 =?utf-8?B?aHAvbEZER3NUUnVwNkxERFlWdzZ3VzFReDJKR1V1Slh1NzFMQWtLS2R0b0Jp?=
 =?utf-8?B?SHV0REI4T2Zhc1M2cjhaSlpnRndWdlFVdHRGaXlZU05ZQkJicnB3VzFyeXUz?=
 =?utf-8?B?d2dmYXBuVFNzUC9QR3g5Y1Q2WjdlNG0yMVVYRENzYzRCaTd2MXNjaFFFbXFv?=
 =?utf-8?B?emJ1bWlKRVZjeXJraHhNMURtdnk4Q0MyVGJwU2hkNCtTbXpVcDQxVGRDYUpW?=
 =?utf-8?B?Y0pHcWUrMVdDNllNVjN2VDNLdkRUdmxXdVVhbHlqei90V0N2NzZtcEg1cWY0?=
 =?utf-8?B?YVVPUlJmMTl2Q1IyR0JsbWNFRWNFREZIck0rbytDaTdpalhqUjZuZzdhZTN0?=
 =?utf-8?B?azBuTzQ5TTVFbGZrWVhJRHRLb01Iek9vNzE3aFhFSFZMUFEveFhJL1hWcHZK?=
 =?utf-8?B?eTRHYjJLdHZZaEE3bHBLVW4rdlE0NDhXeHVaY3VXMUFmdkVZK3FPUG8wWkxo?=
 =?utf-8?B?d0NObE15eklIeGtlVmhWWW1NZEQ3SlByajczaEZ0TlZlRmF4czFCdWE3SXhG?=
 =?utf-8?B?UkJFL2NYdkFLWkd0eE5vRGdYYUpEai9VbnN1akpwZjdPMEJGTmdVOW5DWHZ5?=
 =?utf-8?B?bGJueDFZVFB6RUl6a3c5eStINUhqS1JHb21paklNTUNsUnFiVlJGNVludmoy?=
 =?utf-8?B?aG53Nm96WmVzQkR4NDcxMU5rUWNiOFhVZXdlZVUyYVVJejh4OXZ0Z3VINFJT?=
 =?utf-8?B?cCtwUVlRM1M2VTc2a1RPU1J1czdlTjZUOFM1cXhkeDJJV29wOCt6OHVKRDBD?=
 =?utf-8?B?T1psMk1tbnl5R1poRzQrTXMxZTY4MXVHTGMvMit5UVoyV0h1Mm9ROWw4elVL?=
 =?utf-8?B?TjBZWGFsaWgvTWJhSUlnQVQ5UDIwY1J6N2x1eEloSU41WGFkNzN4cXZ3SjUv?=
 =?utf-8?B?NWdZY0k0bnZtczc4blg2cVVLdkFmTXo0RzVBbW1uTWJFQ3FTTjFEN3JsVmFj?=
 =?utf-8?B?TktWZU81ZHZKdDBqRWVZRERORk1LWExiUFUreFRKU3Q4K2hZSHlVTDFvZll3?=
 =?utf-8?B?SUc2elozb1hydUZsd3pGc2prdWhkeDFRamFVSzJwRUt1VlFrUEVERXJrNUx6?=
 =?utf-8?B?a0x2c2JBMGdKSEo5V2NaNUtsaVUrdDRNMklRVWlETUlZU3VPUmJReFFiVjRO?=
 =?utf-8?B?c2xjSmJ3aWMveC9GQnNzS0hVL3FGOUQ2V2pMKzRuRUF6cnkyUEUxVHZoWW10?=
 =?utf-8?B?aGNINXdTb09uWnpwRVAyRUdRdjhISmIyNWtxS1FwWlUrTWJPVFl3RC82R2sr?=
 =?utf-8?B?Mk40azlsQzlYWW5IZ21iaDFTVlVWNnhQZXg0eWtQanJVRnBFZ0dDa2tLU2kv?=
 =?utf-8?B?NkZEeVJaazhLc1owQ3B4U1VXeWV4aXZpVG9FbVJKZDZDRVM1RTJhV1NLSHU1?=
 =?utf-8?B?bUJIbzVIcEFSZ3lDa1pBTVk0elpVZzBaMkxOaWFGRG11WmdTT2l6cmoreDdx?=
 =?utf-8?Q?k/LtCtvwaee+35Z+CJ9HsBqQHwIRlvM5ayvOdAp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b129949-4bfc-4a8d-0abf-08d90fc29b68
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 12:37:55.6743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8na76/fTH149EO+wHvqhIaOrEx/ZNRa25LCexPNJiTrI3cJ5fLHh4T0AQ0e0jiIgMhuUasMajYbU/TNsALadBgq5MFIokG4MkmhEtP8+QYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4871
X-OriginatorOrg: citrix.com

On 05/05/2021 11:04, Roger Pau Monn=C3=A9 wrote:
> On Tue, May 04, 2021 at 10:31:20PM +0100, Andrew Cooper wrote:
>> Just as with x86_cpu_policies_are_compatible(), make a start on this fun=
ction
>> with some token handling.
>>
>> Add levelling support for MSR_ARCH_CAPS, because RSBA has interesting
>> properties, and introduce test_calculate_compatible_success() to the uni=
t
>> tests, covering various cases where the arch_caps CPUID bit falls out, a=
nd
>> with RSBA accumulating rather than intersecting across the two.
>>
>> Extend x86_cpu_policies_are_compatible() with a check for MSR_ARCH_CAPS,=
 which
>> was arguably missing from c/s e32605b07ef "x86: Begin to introduce suppo=
rt for
>> MSR_ARCH_CAPS".
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> ---
>>  tools/include/xen-tools/libs.h           |   5 ++
>>  tools/tests/cpu-policy/test-cpu-policy.c | 150 ++++++++++++++++++++++++=
+++++++
>>  xen/include/xen/lib/x86/cpu-policy.h     |  22 +++++
>>  xen/lib/x86/policy.c                     |  47 ++++++++++
>>  4 files changed, 224 insertions(+)
>>
>> diff --git a/tools/include/xen-tools/libs.h b/tools/include/xen-tools/li=
bs.h
>> index a16e0c3807..4de10efdea 100644
>> --- a/tools/include/xen-tools/libs.h
>> +++ b/tools/include/xen-tools/libs.h
>> @@ -63,4 +63,9 @@
>>  #define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(=
_w))-1))
>>  #endif
>> =20
>> +#ifndef _AC
>> +#define __AC(X, Y)   (X ## Y)
>> +#define _AC(X, Y)    __AC(X, Y)
>> +#endif
> You need to remove those definitions from libxl_internal.h.

Ok.

>
>>  #endif	/* __XEN_TOOLS_LIBS__ */
>> diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-=
policy/test-cpu-policy.c
>> index 75973298df..455b4fe3c0 100644
>> --- a/tools/tests/cpu-policy/test-cpu-policy.c
>> +++ b/tools/tests/cpu-policy/test-cpu-policy.c
>> @@ -775,6 +775,154 @@ static void test_is_compatible_failure(void)
>>      }
>>  }
>> =20
>> +static void test_calculate_compatible_success(void)
>> +{
>> +    static struct test {
>> +        const char *name;
>> +        struct {
>> +            struct cpuid_policy p;
>> +            struct msr_policy m;
>> +        } a, b, out;
>> +    } tests[] =3D {
>> +        {
>> +            "arch_caps, b short max_leaf",
>> +            .a =3D {
>> +                .p.basic.max_leaf =3D 7,
>> +                .p.feat.arch_caps =3D true,
>> +                .m.arch_caps.rdcl_no =3D true,
>> +            },
>> +            .b =3D {
>> +                .p.basic.max_leaf =3D 6,
>> +                .p.feat.arch_caps =3D true,
>> +                .m.arch_caps.rdcl_no =3D true,
>> +            },
>> +            .out =3D {
>> +                .p.basic.max_leaf =3D 6,
>> +            },
>> +        },
>> +        {
>> +            "arch_caps, b feat missing",
>> +            .a =3D {
>> +                .p.basic.max_leaf =3D 7,
>> +                .p.feat.arch_caps =3D true,
>> +                .m.arch_caps.rdcl_no =3D true,
>> +            },
>> +            .b =3D {
>> +                .p.basic.max_leaf =3D 7,
>> +                .m.arch_caps.rdcl_no =3D true,
>> +            },
>> +            .out =3D {
>> +                .p.basic.max_leaf =3D 7,
>> +            },
>> +        },
>> +        {
>> +            "arch_caps, b rdcl_no missing",
>> +            .a =3D {
>> +                .p.basic.max_leaf =3D 7,
>> +                .p.feat.arch_caps =3D true,
>> +                .m.arch_caps.rdcl_no =3D true,
>> +            },
>> +            .b =3D {
>> +                .p.basic.max_leaf =3D 7,
>> +                .p.feat.arch_caps =3D true,
>> +            },
>> +            .out =3D {
>> +                .p.basic.max_leaf =3D 7,
>> +                .p.feat.arch_caps =3D true,
>> +            },
>> +        },
>> +        {
>> +            "arch_caps, rdcl_no ok",
>> +            .a =3D {
>> +                .p.basic.max_leaf =3D 7,
>> +                .p.feat.arch_caps =3D true,
>> +                .m.arch_caps.rdcl_no =3D true,
>> +            },
>> +            .b =3D {
>> +                .p.basic.max_leaf =3D 7,
>> +                .p.feat.arch_caps =3D true,
>> +                .m.arch_caps.rdcl_no =3D true,
>> +            },
>> +            .out =3D {
>> +                .p.basic.max_leaf =3D 7,
>> +                .p.feat.arch_caps =3D true,
>> +                .m.arch_caps.rdcl_no =3D true,
>> +            },
>> +        },
>> +        {
>> +            "arch_caps, rsba accum",
>> +            .a =3D {
>> +                .p.basic.max_leaf =3D 7,
>> +                .p.feat.arch_caps =3D true,
>> +                .m.arch_caps.rsba =3D true,
>> +            },
>> +            .b =3D {
>> +                .p.basic.max_leaf =3D 7,
>> +                .p.feat.arch_caps =3D true,
>> +            },
>> +            .out =3D {
>> +                .p.basic.max_leaf =3D 7,
>> +                .p.feat.arch_caps =3D true,
>> +                .m.arch_caps.rsba =3D true,
>> +            },
>> +        },
>> +    };
>> +    struct cpu_policy_errors no_errors =3D INIT_CPU_POLICY_ERRORS;
>> +
>> +    printf("Testing calculate compatibility success:\n");
>> +
>> +    for ( size_t i =3D 0; i < ARRAY_SIZE(tests); ++i )
>> +    {
>> +        struct test *t =3D &tests[i];
>> +        struct cpuid_policy *p =3D malloc(sizeof(struct cpuid_policy));
>> +        struct msr_policy *m =3D malloc(sizeof(struct msr_policy));
>> +        struct cpu_policy a =3D {
>> +            &t->a.p,
>> +            &t->a.m,
>> +        }, b =3D {
>> +            &t->b.p,
>> +            &t->b.m,
>> +        }, out =3D {
>> +            p,
>> +            m,
>> +        };
>> +        struct cpu_policy_errors e;
>> +        int res;
>> +
>> +        if ( !p || !m )
>> +            err(1, "%s() malloc failure", __func__);
>> +
>> +        res =3D x86_cpu_policy_calculate_compatible(&a, &b, &out, &e);
>> +
>> +        /* Check the expected error output. */
>> +        if ( res !=3D 0 || memcmp(&no_errors, &e, sizeof(no_errors)) )
>> +        {
>> +            fail("  Test '%s' expected no errors\n"
>> +                 "    got res %d { leaf %08x, subleaf %08x, msr %08x }\=
n",
>> +                 t->name, res, e.leaf, e.subleaf, e.msr);
>> +            goto test_done;
>> +        }
>> +
>> +        if ( memcmp(&t->out.p, p, sizeof(*p)) )
>> +        {
>> +            fail("  Test '%s' resulting CPUID policy not as expected\n"=
,
>> +                 t->name);
>> +            goto test_done;
>> +        }
>> +
>> +        if ( memcmp(&t->out.m, m, sizeof(*m)) )
>> +        {
>> +            fail("  Test '%s' resulting MSR policy not as expected\n",
>> +                 t->name);
>> +            goto test_done;
>> +        }
> In order to assert that we don't mess things up, I would also add a
> x86_cpu_policies_are_compatible check here:
>
> res =3D x86_cpu_policies_are_compatible(&a, &out, &e);
> if ( res )
>     fail("  Test '%s' created incompatible policy\n"
>          "    got res %d { leaf %08x, subleaf %08x, msr %08x }\n",
>          t->name, res, e.leaf, e.subleaf, e.msr);
> res =3D x86_cpu_policies_are_compatible(&b, &out, &e);
> if ( res )
>     fail("  Test '%s' created incompatible policy\n"
>          "    got res %d { leaf %08x, subleaf %08x, msr %08x }\n",
>          t->name, res, e.leaf, e.subleaf, e.msr);

That's potentially problematic, hence not including it the first time
around.=C2=A0 See the discussion below.

>> +
>> +    test_done:
>> +        free(p);
>> +        free(m);
>> +    }
>> +}
>> +
>>  int main(int argc, char **argv)
>>  {
>>      printf("CPU Policy unit tests\n");
>> @@ -793,6 +941,8 @@ int main(int argc, char **argv)
>>      test_is_compatible_success();
>>      test_is_compatible_failure();
>> =20
>> +    test_calculate_compatible_success();
>> +
>>      if ( nr_failures )
>>          printf("Done: %u failures\n", nr_failures);
>>      else
>> diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/=
x86/cpu-policy.h
>> index 5a2c4c7b2d..0422a15557 100644
>> --- a/xen/include/xen/lib/x86/cpu-policy.h
>> +++ b/xen/include/xen/lib/x86/cpu-policy.h
>> @@ -37,6 +37,28 @@ int x86_cpu_policies_are_compatible(const struct cpu_=
policy *host,
>>                                      const struct cpu_policy *guest,
>>                                      struct cpu_policy_errors *err);
>> =20
>> +/*
>> + * Given two policies, calculate one which is compatible with each.
>> + *
>> + * i.e. Given host @a and host @b, calculate what to give a VM so it ca=
n live
>> + * migrate between the two.
>> + *
>> + * @param a        A cpu_policy.
>> + * @param b        Another cpu_policy.
>> + * @param out      A policy compatible with @a and @b.
>> + * @param err      Optional hint for error diagnostics.
>> + * @returns -errno
>> + *
>> + * For typical usage, @a and @b should be system policies of the same t=
ype
>> + * (i.e. PV/HVM default/max) from different hosts.  In the case that an
>> + * incompatibility is detected, the optional err pointer may identify t=
he
>> + * problematic leaf/subleaf and/or MSR.
>> + */
>> +int x86_cpu_policy_calculate_compatible(const struct cpu_policy *a,
>> +                                        const struct cpu_policy *b,
>> +                                        struct cpu_policy *out,
>> +                                        struct cpu_policy_errors *err);
>> +
>>  #endif /* !XEN_LIB_X86_POLICIES_H */
>> =20
>>  /*
>> diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
>> index f6cea4e2f9..06039e8aa8 100644
>> --- a/xen/lib/x86/policy.c
>> +++ b/xen/lib/x86/policy.c
>> @@ -29,6 +29,9 @@ int x86_cpu_policies_are_compatible(const struct cpu_p=
olicy *host,
>>      if ( ~host->msr->platform_info.raw & guest->msr->platform_info.raw =
)
>>          FAIL_MSR(MSR_INTEL_PLATFORM_INFO);
>> =20
>> +    if ( ~host->msr->arch_caps.raw & guest->msr->arch_caps.raw )
>> +        FAIL_MSR(MSR_ARCH_CAPABILITIES);
> It might be nice to expand test_is_compatible_{success,failure} to
> account for arch_caps being checked now.

At some point we're going to need to stop unit testing "does the AND
operator work", and limit testing to the interesting corner cases.

> Shouldn't this check also take into account that host might not have
> RSBA set, but it's legit for a guest policy to have it?

When we expose this properly to guests, the max policies will have RSBA
set, and the default policies will have RSBA forwarded from hardware
and/or the model table.

Therefore, we can accept any VM RSBA configuration, irrespective of the
particulars of this host, but if you e.g. have a pool of haswell's, the
default policy will have RSBA clear across the board, and the VM won't
see it.

> if ( ~host->msr->arch_caps.raw & guest->msr->arch_caps.raw & ~POL_MASK )
>     FAIL_MSR(MSR_ARCH_CAPABILITIES);
>
> Maybe POL_MASK should be renamed and defined in a header so it's
> widely available?

No - this would be incorrect.=C2=A0 The polarity of certain bits only matte=
rs
for levelling calculations, not for "can this VM run on this host"
calculations.

If the VM has seen RSBA, and Xen doesn't know about it, the VM cannot run.

>
>> +
>>  #undef FAIL_MSR
>>  #undef FAIL_CPUID
>>  #undef NA
>> @@ -43,6 +46,50 @@ int x86_cpu_policies_are_compatible(const struct cpu_=
policy *host,
>>      return ret;
>>  }
>> =20
>> +int x86_cpu_policy_calculate_compatible(const struct cpu_policy *a,
>> +                                        const struct cpu_policy *b,
>> +                                        struct cpu_policy *out,
>> +                                        struct cpu_policy_errors *err)
> I think this should be in an #ifndef __XEN__ protected region?
>
> There's no need to expose this to the hypervisor, as I would expect it
> will never have to do compatible policy generation? (ie: it will
> always be done by the toolstack?)

As indicated previously, I still think we want this in Xen for the boot
paths, but I suppose the guard was my suggestion to you, so is only fair
at this point.

>
>> +{
>> +    const struct cpuid_policy *ap =3D a->cpuid, *bp =3D b->cpuid;
>> +    const struct msr_policy *am =3D a->msr, *bm =3D b->msr;
>> +    struct cpuid_policy *cp =3D out->cpuid;
>> +    struct msr_policy *mp =3D out->msr;
>> +
>> +    memset(cp, 0, sizeof(*cp));
>> +    memset(mp, 0, sizeof(*mp));
>> +
>> +    cp->basic.max_leaf =3D min(ap->basic.max_leaf, bp->basic.max_leaf);
>> +
>> +    if ( cp->basic.max_leaf >=3D 7 )
>> +    {
>> +        cp->feat.max_subleaf =3D min(ap->feat.max_subleaf, bp->feat.max=
_subleaf);
>> +
>> +        cp->feat.raw[0].b =3D ap->feat.raw[0].b & bp->feat.raw[0].b;
>> +        cp->feat.raw[0].c =3D ap->feat.raw[0].c & bp->feat.raw[0].c;
>> +        cp->feat.raw[0].d =3D ap->feat.raw[0].d & bp->feat.raw[0].d;
>> +    }
>> +
>> +    /* TODO: Far more. */
> Right, my proposed patch (07/13) went a bit further and also leveled
> 1c, 1d, Da1, e1c, e1d, e7d, e8b and e21a, and we also need to level
> a couple of max_leaf fields.
>
> I'm happy for this to go in first, and I can rebase the extra logic I
> have on top of this one.

There is a lot of work to do.

One thing I haven't addressed yet is the fact is things which don't
level, e.g. vendor.=C2=A0 You've got to pick one, and there isn't a
mathematical relationship to use between a and b.

I think for that, we ought to document that we strictly take from a.=C2=A0
This makes the operation not commutative, and in particular, I don't
think we want to waste too much time/effort trying to make cross-vendor
cases work - it was a stunt a decade ago, with a huge number of sharp
corners, as well as creating a number of XSAs due to poor implementation.

For v1, I suggest we firmly stick to the same-vendor case.=C2=A0 It's not a=
s
if there is a lack of things to do to make this work.

~Andrew


