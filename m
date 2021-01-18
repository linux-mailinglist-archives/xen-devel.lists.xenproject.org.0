Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 210EE2FA4B2
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 16:32:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69757.124996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1WVS-0003B2-Fz; Mon, 18 Jan 2021 15:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69757.124996; Mon, 18 Jan 2021 15:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1WVS-0003Ac-CY; Mon, 18 Jan 2021 15:31:50 +0000
Received: by outflank-mailman (input) for mailman id 69757;
 Mon, 18 Jan 2021 15:31:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RMBa=GV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l1WVR-0003AM-0Y
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 15:31:49 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8c19339-c080-43f8-9d27-a9b54b8574c3;
 Mon, 18 Jan 2021 15:31:47 +0000 (UTC)
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
X-Inumbo-ID: f8c19339-c080-43f8-9d27-a9b54b8574c3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610983907;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vIlk53XkperTkM7QpuGyqgSt9YTGBrl78lk75g3Hi6g=;
  b=ZkyqwjZ07sCXdiBK73l/H5gK6F93LRHzWcMPh0Jyr4Aq9CbxbzPdQtla
   mHM19AVYccBHID/+BywmqbNS7Ygc4YbI0+SY1p3fcVjXqT7LQvrzLDk/7
   +nxqHCmDrZvQBQi3BshW+OSY0WCT0po1SEthj64cjmfQtnjUtK60SylXh
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DIUwqxJdszkEvKs91Svg8x9an/NtD27kckPxGYGZxgxY4Dw8KzAnN/RI+wUG7NavzI6KLSDmeA
 ENqxorlr39RpaaY9kI+LYjtHfBqF/XdRNv5QVENf4t8YkfMLMo9+2zLe8Js4jpd9UtkCjRuzLA
 t6+eAbqPrfTZBprddUZoWXC+k5oN8p9jN4vL9I18cVIVk+mIMa28hVohGnv+EEfXuPdhFyT42j
 dGe/kc8wHcLRUoaZMREeItEwnDik3SemLbHHLUAVr6Xy4E9lUG6+5zGgijD0XCviNomP4Qqx6l
 uVk=
X-SBRS: 5.2
X-MesageID: 35309458
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,356,1602561600"; 
   d="scan'208";a="35309458"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmXYWaonv2+J4rDVFlkjdbvftEzNYGorm0wx9nbSYR2RomBVoEwSZY6/m2C8YdChIZg/SOzBUFdqVUzZsFjJeSWci7XY1P/W5LM5i8E02jsPIakWFI85xy1FpnRET83xR/Ee21YJRSfIYRz10l4ygjyyQAPP/OCnmngarxG4pUNvKWALTbWTMi6UYIksHgz/aXw1LGQUfBqvfLBejLu82uqnqNg0gR6+FkmgL/m33HR93N2srQ8V6sC1auqziThuOmdrMk5Pk1GhQRHiK/UI8RV+Be36EDErfEcv4yiIv5V0zXgpR9bXjiwBhbVLSe6viEW53vzPDkY6Pc9ZOfhwtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2VXhsAG90u4qgyD9/9294ksVcVVnQcZKwss/FbXJrA=;
 b=f1daQpijGgFMCGQvMNW9fYZzqA+XzcYDdGlOBFErb8SabAx7btqGgf70EKWX9hcEeM5Z0Wvgc4AvdB/bcExzPoCXFAIfFviSzIiAcP5IkSAz9gSUqHgbZ76TFYdGd/1dCvCud5gXpL4lvlySDWAi3Q9RifJMSE2gan+kxsc1CTgBkQnctP1lKH7vSyFFU9EThZMtV+0xi7W0a23Lv2IK+yP8iow7G0IVhkf9dvDnHXlFmZ682SdVnDX+xvGPaGJtQI/BdD8LC7cJmCy8+D3MjL81OKVM6nSrwHDCeAW66USlwapck4FO4KZ81Rnko8zliMPNV2hwcBYZhvRM1ANl4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2VXhsAG90u4qgyD9/9294ksVcVVnQcZKwss/FbXJrA=;
 b=ar07EIN+qNqlQ2BV5YvzF+aMr1ws3yQkvdFKh8Lalt9OykuoIVJVULxw2jVxZiPsOGf925x9/OTRDiycli2XlvmYCxzV5+og63K1o0RtIuReBvYc9I8NYQIwhVvP5ByXM+dADgUvGiTNYy99NpYj020NeFosJECHziLjDoZghxc=
Subject: Re: [PATCH] xen/decompress: make helper symbols static
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <28f15465-bfcd-606b-eb24-42bfb990ae3d@suse.com>
 <b073d60c-9eb1-a161-8419-a0dfa11b4c91@citrix.com>
 <b9f6447d-2677-030c-31c3-ed741be62dcc@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0290fc6d-a7a1-3f30-668d-2ef24fbc4802@citrix.com>
Date: Mon, 18 Jan 2021 15:31:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <b9f6447d-2677-030c-31c3-ed741be62dcc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0445.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::18) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 632611be-0a1f-4fc9-29b8-08d8bbc6264a
X-MS-TrafficTypeDiagnostic: BYAPR03MB4661:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4661CB0A05FDE06EF22E5583BAA40@BYAPR03MB4661.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F7O89Wlp9myP3rBBH3mMsf0DXxFzUyVdOsPhMuX5X1VnNRVG8wkpEU727PoSial3YTVCu10AFQtIssXg3se821elK1eJx3HrZBMwK7tktObY+9Hr2zV16hMfFerwo1T06/uKUcMvuwAqReVuCg8It+h1FkHgF5V3qEc0ZdrRx0XM+Y7Abzz3fFit6drcK2cvf9sVkKLYqxT+kGYoei0Hx98VKRFWvxtGq3HS65DQ1RSx/ThK9DqGv9Ag/GeGfeLzRxzAt50rnk+QftHkClR4c79Gv3kvhk/W5tbiZCaCWGezH6RnfC79x/jrZgDortBse/bL4OOl2nfOndsoRjecRTg3/rv7BiBARXDkMSfK1rF7KU1h0q4Mg6V/wLxuPjIHXTpC84cQAqbq9jETBngspPb4b5MlYLVMBZuob4r9e9yArHtRdQMr/9WAFv8HNIADGE7Aw1T6Iah5pzSTWH70SO0Ed/+ZkoQ8ZL1sJs0Ud7M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(6916009)(5660300002)(36756003)(66476007)(31696002)(86362001)(66946007)(53546011)(6666004)(66556008)(31686004)(54906003)(6486002)(4326008)(8676002)(478600001)(956004)(8936002)(2616005)(26005)(2906002)(16576012)(316002)(186003)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K0xCRHBkbXMzZFZEci9JSUQvTGh5azlwUFIzNzZ6dmxOOFI4UEUyc3ROdkFD?=
 =?utf-8?B?bFRwUWFNY0ljM1RmcHYybVVyZ1RRSFFxQnpFd0J2U2MzQlhQOHlKNk9meGxU?=
 =?utf-8?B?YWxUSlQ4OFl0OVJzVTNyM1RNQjkranlud1NVeGgxV2xtUmpsVXpSbHp6elpL?=
 =?utf-8?B?NVh2NzJFMk5vNUNIekNNOEY2WWQ4NkN6MXo2WEpiNTRaM3BSeEdkbk5jZ3Np?=
 =?utf-8?B?Rm9TMU5qRnEyZUoxMlVmUmNmRmRua1FCY3QvR1hmZERWTVc5dnFUN2Q4SXRx?=
 =?utf-8?B?aVMzeHVOV2c0QUltYVI5aEl0Smxrdms5VnM2UnVzcWEyNnlFZS9WRUtVbFVJ?=
 =?utf-8?B?WFc4SlQrVTlVcldqV3hTeitwYzgwTEo5d0hHYU1JNzZCRlB2azZuRFU1R2xL?=
 =?utf-8?B?UjdTelJrV2p3Q2FSdjg1MW1XWWVsWWdnYXNUVFZZTnVUN2ZRUWtqOGc0NW9V?=
 =?utf-8?B?N3dNTUxrbmRQcEJlMEloUEJRNjNNSDdEN2NsMGxFOEo0eDZ5bW8rSVFsYzd0?=
 =?utf-8?B?SkJOOTN3WTFDVWM2Sk9FQVAwVWprcFo0OVY0Y2dkQ1UvcXRtZEZxNXdNeTlQ?=
 =?utf-8?B?a09mYzhyUmNIZGdqT0N6aGNaNWxhNmp1dWo0dUVJMjkrbjJsTDV6eFNkYXBT?=
 =?utf-8?B?SS9oQ3BiU3N0TktXWllhSzcwUU11dmhDajNrRVl3UlVJRzBLbHVqY0p2OG4y?=
 =?utf-8?B?S1JkMTJXVVovb01YVmsxeVpML0ttbnpUZzBpZ1c2NHQ0K1RQM0Z3akgrMUYy?=
 =?utf-8?B?ZDFKZmN5VGFxR3ArVkVzWmM0V2VTTGN1Y0pnRDlhRjQwaUZwbUtBU2xJSnVG?=
 =?utf-8?B?M2xlNm9vK2pzT1pteVNqOG1GeE1UaDkyUmVJMHgzdjgrVHpLQ1liZC9IWmhQ?=
 =?utf-8?B?Yzk1Q0Frd0w1VzZqNmVkOHY5bHl0c0pNLyswNmFpb0NCOHptQy9RSHdjSXJk?=
 =?utf-8?B?eFZWTVNNb0tYNkJOM0JYa0FGT3lJTTVxdTJIa1E4RE1SalZNbXA2eUZQZXJX?=
 =?utf-8?B?dTlwN3lHb0FXS1oweDhPdGlZUnFFVGQxWEN6bWxqdUtaZkFUbE5SdmtHeDZp?=
 =?utf-8?B?bjJlYWlxWWd2dDZ4NlRoaUdxUnZBQWZtc2JGRjdFN2E3ZzlsTVZlRjhYU1BO?=
 =?utf-8?B?a3c5N1NaZXM5SHlwMTduRHRSb1Y0aVBYaUNaK1gzSHJhMjNKNnhaRjRMM0dm?=
 =?utf-8?B?dVpOZUYxWCtuOHI4NnpQVHoyTkROcytwbGw0OHZzVkV6T3NYd1pNNFgwMmlD?=
 =?utf-8?B?NTNwcUZta2ltZE93OE1iUDhUTGNoQ2tmWUYzd21aZ3ZacTJtRFFLUXNyNnpT?=
 =?utf-8?Q?S+EzKpqC9qEBVZwA7SvQy1o00GVid6kk8r?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 632611be-0a1f-4fc9-29b8-08d8bbc6264a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 15:31:39.5047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Il7N9eqXB78D9KXhCBuwXZPIdoLhE4mPufBmL7B27K6lm/qlxRv7zhRvMNukpFy0MrVxkKVvVyY7cE0aOY2VMsBSlKLpqmf6+s2NofJAgzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4661
X-OriginatorOrg: citrix.com

On 18/01/2021 15:13, Jan Beulich wrote:
> On 18.01.2021 12:58, Andrew Cooper wrote:
>> On 18/01/2021 11:19, Jan Beulich wrote:
>>> The individual decompression CUs need to only surface their top level
>>> functions to other code. Arrange for everything else to be static, to
>>> make sure no undue uses of that code exist or will appear without
>>> explicitly noticing. (In some cases this also results in code size
>>> reduction, but since this is all init-only code this probably doesn't
>>> matter very much.)
>>>
>>> In the LZO case also take the opportunity and convert u8 where lines
>>> get touched anyway.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> The downside is that the top level functions will now be non-static
>>> in stubdom builds of libxenguest, but I think that's acceptable.
>> Yeah - not something to lose sleep over.
>>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Thanks, but this actually breaks the stubdom build, which now sees
> non-static function definitions without prior declaration, which
> with -Werror results in the build to fail. There's this extra hunk
> now which addresses this:
>
> --- unstable.orig/tools/libs/guest/xg_dom_decompress_unsafe.h
> +++ unstable/tools/libs/guest/xg_dom_decompress_unsafe.h
> @@ -1,8 +1,12 @@
> +#ifdef __MINIOS__
> +# include "../../xen/include/xen/decompress.h"
> +#else
>  typedef int decompress_fn(unsigned char *inbuf, unsigned int len,
>                            int (*fill)(void*, unsigned int),
>                            int (*flush)(void*, unsigned int),
>                            unsigned char *outbuf, unsigned int *posp,
>                            void (*error)(const char *x));
> +#endif
>  
>  int xc_dom_decompress_unsafe(
>      decompress_fn fn, struct xc_dom_image *dom, void **blob, size_t *size)
>
> i.e. strictly speaking I may then also need a tools side ack.

My ack still stands.

>
>> but I really would
>> like to see the STATIC and INIT defines disappear eventually.
> I too would like to, but I don't see this happen in particular
> for INIT and INITDATA, when we have two distinct environments
> where this code gets built. Unless you envision the tool stack /
> stubdom side of the build to gain
>
> #define __init
> #define __initdata
>
> ?

I think that's fine.

One way or another, some header file somewhere needs to plumb this up
for the differing environments.  I just don't see the need for an extra
level of indirection.

> As far as STATIC goes, being in the middle of the DomU side
> work of this, I've found a need to sprinkle around quite a
> few of them in zstd/decompress.c, again to silence similar
> compiler diagnostics.

Do you mean you've had to add more STATIC's in?

~Andrew

