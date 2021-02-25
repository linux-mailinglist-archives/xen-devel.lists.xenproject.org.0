Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1CC324D5C
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 11:01:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89661.169065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFDS2-0004ys-EG; Thu, 25 Feb 2021 10:00:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89661.169065; Thu, 25 Feb 2021 10:00:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFDS2-0004yT-AZ; Thu, 25 Feb 2021 10:00:54 +0000
Received: by outflank-mailman (input) for mailman id 89661;
 Thu, 25 Feb 2021 10:00:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KbZv=H3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lFDS0-0004yO-Mf
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 10:00:53 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29e97645-4e32-46f2-acbd-3773e56d4f40;
 Thu, 25 Feb 2021 10:00:50 +0000 (UTC)
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
X-Inumbo-ID: 29e97645-4e32-46f2-acbd-3773e56d4f40
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614247250;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=zpY8Zjt2WgV9N6Dv/X1QD5JpacpvAcOuZa2Xpl0CllI=;
  b=KicKXa+XxDtIjMIVhjIb8cEYQXo0ptv5F4QGvyMCDqvmwP9zc610Yil+
   J/sCj7VSBQ5drpBCnPZZjNL7k0AATjdeiTUoMW2WU4Sc4kvLFvJDb1OKi
   BT1gb7pQd+9wGi+IebReef71TPR9z0JwE8tCocznwCnPC+eqAw84dbjn0
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: s1msz7PjlyvP9zJLGjuMlo+KgZhJ9YBdw5bdPN9id1o0JYUfb4NjkLrLODt4gpA0ZeUOplC1Un
 q29qjk3fPDGKFIsNP2YjUJMKy8xH64RyF9bQ1fnYCud5lAybRV8cu+4Vhb6y3jd0MOyXiyY2Iw
 bV+2YFGRPUZuSGjf4Ti+h3jTrqmihxhbrh6JjEAROAV97cGFIghDgMb4jHApW+rcvhRqLhPeFq
 LwWjamU667Yx7KBgIn9TELI3PWzmO2txbo41Yp5iiQiANvKAESyTV2tQYRq1xXFT36XUDgAWiG
 onM=
X-SBRS: 5.2
X-MesageID: 37924748
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,205,1610427600"; 
   d="scan'208";a="37924748"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nm15Kn3X1fCop3GK+qtcHtiFDiUM8JCnQ3TcMtQfjHIpHEgPIyWG50RfbuQb1t/I2an7z7cUFcdgfz24uyEuDGtXdx007F8BwIo0CKAaScP2BOT4KP9ZlWfomTZ4rEYYC9MpgjMesRAofBnLFBceQtOi0uw+yZs95yDou8b2wwWvIAXkJ3x3TQ+iTUi1iPvqguaNDfZ0DkgE9zLFpkFmIZn2LttFk3jkAF2QOWwZAlVq2e5qx87NmdSVHpfwVMukvqt1li1ILRvJcPtcuQD8XFCG6CUnz9RnH1IyEkyQB46AiP64AOSU2fOzQ2HR/jXyMI6bWQUDJWNDnaxvQ1KjtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PQUbz0moQEjC4YcEwZ6anskzmUEX8uXndME7hdjopc=;
 b=V/Pa7en4a/eaqUz96nzgIzwdmxBnJMBIDj5Cb9VSBzBkoERaVDo42oECBt9WlCz6Z6BS7lTPyBNfvHuURaZYW2aGhAi4Ys7HtWv8mjQD3gHdFMyCR1oqX14/1PMRa/1Iu2eWJfackOnL1UpF6GJpYFTQJ/duIweIvsQX50CRUzBUX9ILRQA7dYgstz3DA8i8vXh2NsHGoo9ifL6btOKOa8yfzcJGjfObhBdDfm3NtQdwI/A6qG7xsMceHpC9sUnP3xNRXLrE/8YI7PaOgP5nEOytaJhk5rpoMEcfDqiGaXXwwye6Kgp+8rzKJv0H8HOf+wetkNfLRIBG/R+mO57Yqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PQUbz0moQEjC4YcEwZ6anskzmUEX8uXndME7hdjopc=;
 b=vXd40k6BvkqA1AFJdMxDqncXyGbbNT0Wr6I50vx1YqZfvM6/lejV/W7ti6BNdC5t+FSo/4qQtY7pBAtQL0U6nJXUoQKmEDtFZLfMKjo+rgu72y7UIHXDN1Dl159b/fqAAzGXA93KFmDjPAUmeC2qsKUw918JPINKNzYzNWp2jeQ=
Date: Thu, 25 Feb 2021 11:00:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH 0/2] hvmloader: drop usage of system headers
Message-ID: <YDd1SBQGDWOdQViB@Air-de-Roger>
References: <20210224102641.89455-1-roger.pau@citrix.com>
 <35864c33-b375-a3c6-13bc-ad1e7d0773eb@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <35864c33-b375-a3c6-13bc-ad1e7d0773eb@citrix.com>
X-ClientProxiedBy: MR2P264CA0034.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::22)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35e9bd9a-f0ce-46c2-9986-08d8d974389a
X-MS-TrafficTypeDiagnostic: DM6PR03MB3740:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB37408735E511B56B72C958B98F9E9@DM6PR03MB3740.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ArmUMhYYMzbhsgc3jU2X826giZsBm+ykfPzPKWGtxf/gJevY0Hz42CSwvyEjShuE3ZTJe9sdM1P15cAs5p3nyT5OhJnX9ObdeCjA869jiC9Wm9OYAPlH2qjCEQ2HXBt3PXgahyP9oQSjzAXnAzZ3gw/y5LIeeLX1gnUaa455b0IIq/gucQYf+x2JI2nw3h/ccjqy5p2GhdB3GbhpmRKDtlK1kuh84VAySt2x8tW8A+p0eQvOWq+A078ZsXd2oCAYwRjo6YhpFdZT3jhtJxz4OTiiZdk9aTpUyfh91S/modmOWxm9+ee3P/p2oGaYOhibosNq8tEGU5QnoNRNQPkTHpKd9kk44wQmOVnYtLL7dGNQzdqOowsgSGlKI+UKAhsSlpIF2vTapcFyYoC7T9xLlTgw2m2Za9M9Uv3qFe5XqkqN74gy4b7/NXcqM5i9Q/iT4Kg2r+pUCgTvHji/9+2sh7lOOaIYHANql9Bumm5KXUVMKBJnOyotmLpksDCb4wvlXmNJNE85BsHV70eDLcKC5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(66556008)(54906003)(16526019)(5660300002)(6666004)(6636002)(8936002)(66574015)(9686003)(478600001)(83380400001)(86362001)(8676002)(316002)(4326008)(85182001)(186003)(6496006)(26005)(53546011)(66946007)(6486002)(2906002)(956004)(33716001)(6862004)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WlRHaDA3YVFEb0NoVnBtUlNkOGNTbWFISmFJQjZ4dmwySHpvYyszc1JNU01p?=
 =?utf-8?B?WFoyanhwa3dLZGgxd1QwUFBFckRqaWpqazlkbWthR0QzU0gwQXBvWVhFL0lW?=
 =?utf-8?B?Y0tRSHJxSEdhekswd0Z2Wkl4SzZXaG51N3M3c2QvVjRSL3c2b3dQMmtaM0JZ?=
 =?utf-8?B?MlZGNXVwMmMzNm9IMXZWVVFYbm5GV1h4c0pXNGhvNkhlMlc5SXRhL0ZPMEhZ?=
 =?utf-8?B?YW1td0o3bEYrTkV4am5GOUoyK0ZrMVFSekU3VW1UTWhLelY0UGhDWnpxYU9V?=
 =?utf-8?B?S1BKdUdHdE1QREl5WkRlVW1Fc3FxQVZFOGtXeGdVdXFBM0pkZGd2eHFWaHdN?=
 =?utf-8?B?NU9zdU8wT0N0ZElZOU9TM05Ua0FXQTZSVnozeWxmK0ZYd1B1eU1BUFdNN0hX?=
 =?utf-8?B?N3luR3VpRkZRZFAySFlWZDk2RUZuSjZ5dCtQS3A2UWMyMnp5cGZJZmtBeUpZ?=
 =?utf-8?B?ckNhVmg1cHkzZ3NKTzNkTjJGZ0t4Z0FFTTRZQmtxVkUzb3ROWWtvQ2lyWEJU?=
 =?utf-8?B?YnBtK2IwZDBSeXRkcGhDQ2ZRLzhJR0dsM1pWOEJmUGcxQTBnZHFLanlSWThp?=
 =?utf-8?B?L1dMcFlYSE51TStXeEtrZ1ovb1k3aUlHMG9TcnVmR0w1dzArQ1Y4NUJTWnls?=
 =?utf-8?B?VlpucU1UQVZaTk5XT1NEcjVmVkFqeS85b1RBdERYLy9nZkgzWjdRL1NGTDhS?=
 =?utf-8?B?VXIyUjZIdk1TSkxHVEtDd3NLVW0yOXFHQWpnbXU3RjZkU0ZLNHpQNW5JbUEz?=
 =?utf-8?B?c0k3dVgvZWhEOWVQdnNxWmNFUXNaN1RuQ0dzOHhTUDlsQVd6WUNqUW9mSEdV?=
 =?utf-8?B?WFRUMGM3bFFtUUlXVnNldWlBZ2I2dU01UEgrcG1rVktNa09nZUFNOU4zek5a?=
 =?utf-8?B?eHg4eSt1cHZCbS9aNmJadTFQcjR4THN3Zzl1R1E5aHRlOVJkbEI1S0U3REdW?=
 =?utf-8?B?U1ovdVdhMHhjdmQrSDJWRmlSaUh4bEViWWtXb2lIK21DTmkyMWx2Tll5NTRY?=
 =?utf-8?B?a0Z2REJhTW1sL1RYbE9UNlc3VXhLbEdlRDVCWXhZMDVVdWwxcUt1WGxJUndX?=
 =?utf-8?B?QWhCSEQ2RHFTc2NFb2QvSC84NHRPaVJvdlpobWlmMkRERDQwN0JHSTc4TDNu?=
 =?utf-8?B?T0RERUcybkxmWjVHaGo3MFMrM1ZtaU5oVTZkL2pFeHMvNEJrSDRvaW1LZ0cx?=
 =?utf-8?B?Z2VCUlM3ZTMrWlJGTHdjejlHejYwMDh0QTQrNzNzbEgxUEVkQjFqT1QyK1Fa?=
 =?utf-8?B?UDNGaWdaK3hwWHRXb1IwS3c0SEc5UmFlVEYxSDVYalJMcDB5ai85VjJyUm1i?=
 =?utf-8?B?c3BDMUtvaTZaVk5wMWZHb2VaZ1h3YWVvclZnUFFzWEtQdzhyRlRmS2FwT29Y?=
 =?utf-8?B?anpPMjQxeGptM09BZFVwV3ptZ2pjbkoyWUFld2VUZTZmYUdBMWlMNFJ5dk9P?=
 =?utf-8?B?cXlnQms4U04raERHdWdWMFlIWWlmR3pPeXV5ZFVJV2MwZVYxblFnN3c4dHBF?=
 =?utf-8?B?OU9BK3ZkQ0dwdmViV2xjV1NXSmVHSUNpLzZTQnFlcG13VkZ4Z1pURkxTZFFK?=
 =?utf-8?B?ejVHTUowY1A3Ukl5ZE5zVFVXd2ZsM0VPUDlhaUpZWGNTQkVzMGc1Z1JjRm5a?=
 =?utf-8?B?MXVWQUFtNGdCNWY1UllRMEVVdWV5NDR2M0ZHN0ZMT1Vsb25Na3Z5eFQxYm0y?=
 =?utf-8?B?Q281N0RmUW15YWdmZXVCTEEwZUlFWjJpRTdIVC94WHl0Um1QcUZQaURzc2My?=
 =?utf-8?Q?wbvqXZTODUGUmyARBU80xCViyf6nL+ZxZHugI84?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e9bd9a-f0ce-46c2-9986-08d8d974389a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 10:00:46.3279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LMGprE/hRzWOaUbQ7rKtmE3pLcw0NSPF+ReoRuf7RXYin2DCUDm5OkqczvY/okhdDGqexIjSDlrvc+X3dXVUew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3740
X-OriginatorOrg: citrix.com

On Wed, Feb 24, 2021 at 08:08:25PM +0000, Andrew Cooper wrote:
> On 24/02/2021 10:26, Roger Pau Monne wrote:
> > Hello,
> >
> > Following two patches aim to make hvmloader standalone, so that it don'=
t
> > try to use system headers. It shouldn't result in any functional
> > change.
> >
> > Thanks, Roger.
>=20
> After some experimentation in the arch container

I'm afraid it's the alpine container the one that gives those errors,
not the arch one.

So I've done some testing on alpine and I think there's something
broken. Given the following snipped:

---
#include <stdint.h>

int main(void)
{
        _Static_assert(sizeof(uint64_t) =3D=3D 8, "");
}
---

This is the output of running `gcc -E -m32 -ffreestanding test.c` on
an alpine chroot that has just the 'gcc' package installed:

---
# 1 "test.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "test.c"

# 1 "/usr/lib/gcc/x86_64-alpine-linux-musl/10.2.1/include/stdint.h" 1 3
# 11 "/usr/lib/gcc/x86_64-alpine-linux-musl/10.2.1/include/stdint.h" 3
# 1 "/usr/lib/gcc/x86_64-alpine-linux-musl/10.2.1/include/stdint-gcc.h" 1 3
# 34 "/usr/lib/gcc/x86_64-alpine-linux-musl/10.2.1/include/stdint-gcc.h" 3

# 34 "/usr/lib/gcc/x86_64-alpine-linux-musl/10.2.1/include/stdint-gcc.h" 3
typedef signed char int8_t;


typedef short int int16_t;


typedef int int32_t;


typedef long long int int64_t;


typedef unsigned char uint8_t;


typedef short unsigned int uint16_t;


typedef unsigned int uint32_t;


typedef long long unsigned int uint64_t;




typedef signed char int_least8_t;
typedef short int int_least16_t;
typedef int int_least32_t;
typedef long long int int_least64_t;
typedef unsigned char uint_least8_t;
typedef short unsigned int uint_least16_t;
typedef unsigned int uint_least32_t;
typedef long long unsigned int uint_least64_t;



typedef signed char int_fast8_t;
typedef int int_fast16_t;
typedef int int_fast32_t;
typedef long long int int_fast64_t;
typedef unsigned char uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned int uint_fast32_t;
typedef long long unsigned int uint_fast64_t;




typedef int intptr_t;


typedef unsigned int uintptr_t;




typedef long long int intmax_t;
typedef long long unsigned int uintmax_t;
# 12 "/usr/lib/gcc/x86_64-alpine-linux-musl/10.2.1/include/stdint.h" 2 3
# 3 "test.c" 2


# 4 "test.c"
int main(void)
{
 _Static_assert(sizeof(uint64_t) =3D=3D 8, "");
}
---

OTOH, this is the output of the same command run on a chroot that has
the full list of packages required to build Xen (from
automation/build/alpine/3.12.dockerfile):

---
# 1 "test.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "test.c"

# 1 "/usr/include/stdint.h" 1 3 4
# 20 "/usr/include/stdint.h" 3 4
# 1 "/usr/include/bits/alltypes.h" 1 3 4
# 55 "/usr/include/bits/alltypes.h" 3 4

# 55 "/usr/include/bits/alltypes.h" 3 4
typedef unsigned long uintptr_t;
# 70 "/usr/include/bits/alltypes.h" 3 4
typedef long intptr_t;
# 96 "/usr/include/bits/alltypes.h" 3 4
typedef signed char int8_t;




typedef signed short int16_t;




typedef signed int int32_t;




typedef signed long int64_t;




typedef signed long intmax_t;




typedef unsigned char uint8_t;




typedef unsigned short uint16_t;




typedef unsigned int uint32_t;




typedef unsigned long uint64_t;
# 146 "/usr/include/bits/alltypes.h" 3 4
typedef unsigned long uintmax_t;
# 21 "/usr/include/stdint.h" 2 3 4

typedef int8_t int_fast8_t;
typedef int64_t int_fast64_t;

typedef int8_t int_least8_t;
typedef int16_t int_least16_t;
typedef int32_t int_least32_t;
typedef int64_t int_least64_t;

typedef uint8_t uint_fast8_t;
typedef uint64_t uint_fast64_t;

typedef uint8_t uint_least8_t;
typedef uint16_t uint_least16_t;
typedef uint32_t uint_least32_t;
typedef uint64_t uint_least64_t;
# 95 "/usr/include/stdint.h" 3 4
# 1 "/usr/include/bits/stdint.h" 1 3 4
typedef int32_t int_fast16_t;
typedef int32_t int_fast32_t;
typedef uint32_t uint_fast16_t;
typedef uint32_t uint_fast32_t;
# 96 "/usr/include/stdint.h" 2 3 4
# 3 "test.c" 2


# 4 "test.c"
int main(void)
{
 _Static_assert(sizeof(uint64_t) =3D=3D 8, "");
}
---

This is caused by the include path order of gcc on alpine, ie:

---
# cpp -v /dev/null -o /dev/null
Using built-in specs.
COLLECT_GCC=3Dcpp
Target: x86_64-alpine-linux-musl
Configured with: /home/buildozer/aports/main/gcc/src/gcc-10.2.1_pre1/config=
ure --prefix=3D/usr --mandir=3D/usr/share/man --infodir=3D/usr/share/info -=
-build=3Dx86_64-alpine-linux-musl --host=3Dx86_64-alpine-linux-musl --targe=
t=3Dx86_64-alpine-linux-musl --with-pkgversion=3D'Alpine 10.2.1_pre1' --ena=
ble-checking=3Drelease --disable-fixed-point --disable-libstdcxx-pch --disa=
ble-multilib --disable-nls --disable-werror --disable-symvers --enable-__cx=
a_atexit --enable-default-pie --enable-default-ssp --enable-cloog-backend -=
-enable-languages=3Dc,c++,d,objc,go,fortran,ada --disable-libssp --disable-=
libmpx --disable-libmudflap --disable-libsanitizer --enable-shared --enable=
-threads --enable-tls --with-system-zlib --with-linker-hash-style=3Dgnu
Thread model: posix
Supported LTO compression algorithms: zlib
gcc version 10.2.1 20201203 (Alpine 10.2.1_pre1)
COLLECT_GCC_OPTIONS=3D'-E' '-v' '-o' '/dev/null' '-mtune=3Dgeneric' '-march=
=3Dx86-64'
 /usr/libexec/gcc/x86_64-alpine-linux-musl/10.2.1/cc1 -E -quiet -v /dev/nul=
l -o /dev/null -mtune=3Dgeneric -march=3Dx86-64
ignoring nonexistent directory "/usr/local/include"
ignoring nonexistent directory "/usr/lib/gcc/x86_64-alpine-linux-musl/10.2.=
1/../../../../x86_64-alpine-linux-musl/include"
ignoring nonexistent directory "/usr/include/fortify"
#include "..." search starts here:
#include <...> search starts here:
 /usr/include
 /usr/lib/gcc/x86_64-alpine-linux-musl/10.2.1/include
End of search list.
COMPILER_PATH=3D/usr/libexec/gcc/x86_64-alpine-linux-musl/10.2.1/:/usr/libe=
xec/gcc/x86_64-alpine-linux-musl/10.2.1/:/usr/libexec/gcc/x86_64-alpine-lin=
ux-musl/:/usr/lib/gcc/x86_64-alpine-linux-musl/10.2.1/:/usr/lib/gcc/x86_64-=
alpine-linux-musl/:/usr/lib/gcc/x86_64-alpine-linux-musl/10.2.1/../../../..=
/x86_64-alpine-linux-musl/bin/
LIBRARY_PATH=3D/usr/lib/gcc/x86_64-alpine-linux-musl/10.2.1/:/usr/lib/gcc/x=
86_64-alpine-linux-musl/10.2.1/../../../../x86_64-alpine-linux-musl/lib/../=
lib/:/usr/lib/gcc/x86_64-alpine-linux-musl/10.2.1/../../../../lib/:/lib/../=
lib/:/usr/lib/../lib/:/usr/lib/gcc/x86_64-alpine-linux-musl/10.2.1/../../..=
/../x86_64-alpine-linux-musl/lib/:/usr/lib/gcc/x86_64-alpine-linux-musl/10.=
2.1/../../../:/lib/:/usr/lib/
COLLECT_GCC_OPTIONS=3D'-E' '-v' '-o' '/dev/null' '-mtune=3Dgeneric' '-march=
=3Dx86-64'
---

/usr/include takes precedence over the gcc private headers, and thus
the usage of the -ffreestanding option is broken.

On my Debian system this is:

---
# cpp -v /dev/null -o /dev/null
Using built-in specs.
COLLECT_GCC=3Dcpp
Target: x86_64-linux-gnu
Configured with: ../src/configure -v --with-pkgversion=3D'Debian 6.3.0-18+d=
eb9u1' --with-bugurl=3Dfile:///usr/share/doc/gcc-6/README.Bugs --enable-lan=
guages=3Dc,ada,c++,java,go,d,fortran,objc,obj-c++ --prefix=3D/usr --program=
-suffix=3D-6 --program-prefix=3Dx86_64-linux-gnu- --enable-shared --enable-=
linker-build-id --libexecdir=3D/usr/lib --without-included-gettext --enable=
-threads=3Dposix --libdir=3D/usr/lib --enable-nls --with-sysroot=3D/ --enab=
le-clocale=3Dgnu --enable-libstdcxx-debug --enable-libstdcxx-time=3Dyes --w=
ith-default-libstdcxx-abi=3Dnew --enable-gnu-unique-object --disable-vtable=
-verify --enable-libmpx --enable-plugin --enable-default-pie --with-system-=
zlib --disable-browser-plugin --enable-java-awt=3Dgtk --enable-gtk-cairo --=
with-java-home=3D/usr/lib/jvm/java-1.5.0-gcj-6-amd64/jre --enable-java-home=
 --with-jvm-root-dir=3D/usr/lib/jvm/java-1.5.0-gcj-6-amd64 --with-jvm-jar-d=
ir=3D/usr/lib/jvm-exports/java-1.5.0-gcj-6-amd64 --with-arch-directory=3Dam=
d64 --with-ecj-jar=3D/usr/share/java/eclipse-ecj.jar --with-target-system-z=
lib --enable-objc-gc=3Dauto --enable-multiarch --with-arch-32=3Di686 --with=
-abi=3Dm64 --with-multilib-list=3Dm32,m64,mx32 --enable-multilib --with-tun=
e=3Dgeneric --enable-checking=3Drelease --build=3Dx86_64-linux-gnu --host=
=3Dx86_64-linux-gnu --target=3Dx86_64-linux-gnu
Thread model: posix
gcc version 6.3.0 20170516 (Debian 6.3.0-18+deb9u1)
COLLECT_GCC_OPTIONS=3D'-E' '-v' '-o' '/dev/null' '-mtune=3Dgeneric' '-march=
=3Dx86-64'
 /usr/lib/gcc/x86_64-linux-gnu/6/cc1 -E -quiet -v -imultiarch x86_64-linux-=
gnu /dev/null -o /dev/null -mtune=3Dgeneric -march=3Dx86-64
ignoring nonexistent directory "/usr/local/include/x86_64-linux-gnu"
ignoring nonexistent directory "/usr/lib/gcc/x86_64-linux-gnu/6/../../../..=
/x86_64-linux-gnu/include"
#include "..." search starts here:
#include <...> search starts here:
 /usr/lib/gcc/x86_64-linux-gnu/6/include
 /usr/local/include
 /usr/lib/gcc/x86_64-linux-gnu/6/include-fixed
 /usr/include/x86_64-linux-gnu
 /usr/include
End of search list.
COMPILER_PATH=3D/usr/lib/gcc/x86_64-linux-gnu/6/:/usr/lib/gcc/x86_64-linux-=
gnu/6/:/usr/lib/gcc/x86_64-linux-gnu/:/usr/lib/gcc/x86_64-linux-gnu/6/:/usr=
/lib/gcc/x86_64-linux-gnu/
LIBRARY_PATH=3D/usr/lib/gcc/x86_64-linux-gnu/6/:/usr/lib/gcc/x86_64-linux-g=
nu/6/../../../x86_64-linux-gnu/:/usr/lib/gcc/x86_64-linux-gnu/6/../../../..=
/lib/:/lib/x86_64-linux-gnu/:/lib/../lib/:/usr/lib/x86_64-linux-gnu/:/usr/l=
ib/../lib/:/usr/lib/gcc/x86_64-linux-gnu/6/../../../:/lib/:/usr/lib/
COLLECT_GCC_OPTIONS=3D'-E' '-v' '-o' '/dev/null' '-mtune=3Dgeneric' '-march=
=3Dx86-64'
---

Which seems fine as the gcc private include path takes precedence over
/usr/{,local/}include.

Will try to figure out if there's a way to fix or workaround this
brokenness.

Roger.

