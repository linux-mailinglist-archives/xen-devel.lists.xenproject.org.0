Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DC83244EA
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 21:09:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89497.168628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lF0Se-0001jp-FO; Wed, 24 Feb 2021 20:08:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89497.168628; Wed, 24 Feb 2021 20:08:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lF0Se-0001jQ-CH; Wed, 24 Feb 2021 20:08:40 +0000
Received: by outflank-mailman (input) for mailman id 89497;
 Wed, 24 Feb 2021 20:08:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mT50=H2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lF0Sd-0001jK-20
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 20:08:39 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 627a97bb-5085-4dbe-9364-6cdc75d7adab;
 Wed, 24 Feb 2021 20:08:37 +0000 (UTC)
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
X-Inumbo-ID: 627a97bb-5085-4dbe-9364-6cdc75d7adab
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614197317;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Jpy5KTCJ9VntIKIhkGd/IlAG+YImCBxAoiDRp24skIo=;
  b=X+ndSAq6SZt54NnnLdg9kHnMzuJRI4oqU4ofWI26XldaSbEG2DQ5u42b
   NRL1VtVI5lj3q3BbISd/iMKjMIzJ24l8XMaoNQ9puAqd+6KN4nAxxSo7L
   ZdzRPnhQyV8c0e45eQpHKxUNu4fz93XRWR/NBtyQwAZ1NJDXziXMEo+8E
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NPchT8xj3OMVHVeKeApWdGJ0o8BqTClSsOv77AQYZcnVoyj0kBUupOimxjxJEaWzAt2F0cS+xH
 K/n8E7ZPhu1dncLaPwbRwWVKAlpW3zbERyterWjTKldIphjnBWVRgYq1/338meutFvHv+v2SRK
 7B44IkVavgaxooxV9KMlK53s2mtc7J/prdrXBqL4236kz3BVaV7cc69qkqiRC90/CG1gin5Dx1
 fWsxFJIv+i/9omguRnU1cG6NVHRkO7y47JumLc/pqhdX4ChsLytGSZ5Wd6z13JuPweVj3ydvQU
 rgM=
X-SBRS: 5.2
X-MesageID: 37956586
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,203,1610427600"; 
   d="scan'208";a="37956586"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUooNNbCyrCIgydRzrZTAOwSyPNbcE8D3lKnQLVo7rF/3XTmZMPIYWivjKvbkpm3LjzafS37K8A1Snx2nO1KMIx2OwUR/65LL84AKzFW4D1gcdJbdVR9MJ8Fw19WuAiz9nHDrcTv7zGrsgaDmDZRjVqY+DatAvuL+4bK9R8H7WC+LNXKVcTeZp+lQoPxrzZ01Sne04F8XFhWLDGXZAWTSJ3V0b8Uh5XM8g86ckF2Rgpn7n2VI6jAbYxCaSu7hi/27xMkOPGbwvM4WDT7YiRiAmrlaWpalRLdgQU2zw0iE97T88CJs0wZneLMsLN5SLyCplqxhw4Qq9p8+7lu9U6kbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jpy5KTCJ9VntIKIhkGd/IlAG+YImCBxAoiDRp24skIo=;
 b=Q2uIbybWtJUYUZZEvMaLnfLIujddsWeLABfC+B+J4CliCUfOff7IA33XNVxkBen4LfLgBTXxvUlRIM/Dvu9SVCs+0Fr2DxbjNQm+q4MwrdNvTGjmcLtUoRSYSKvZiovc1W2gQNdL6HqyE3KRGHxgPnVJ7Z2ovNh58I/nc4Pr76G7BADu60rzGpUFf2LsrZGPRNBhnckB6N1Nw9yHNpxBZWYJtM2BOgb0XnQM4iFfSHWzkGVVF8gQ5ozmbnPQ01bpfqSHqTx04qX101v8wmgDAaxGPPT1i1VLeVVQ45qxBarT/VZk/OiFoe4UF8fT8PGqC6/bEZQWLy7o5KQ4JB2BMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jpy5KTCJ9VntIKIhkGd/IlAG+YImCBxAoiDRp24skIo=;
 b=UDnj9jbXsTIl3ko2A2mkwYmtUVL+GbWZjViJFNWDp+7keRsTpXNeiLZCJuyDK8sL245fmsdK60Lvfjifi0X1HGaRp4hfGH12uGQkmBwYRRszqIXQZr7D8mLr22zTV/Lh08D8Ko6srelJvuZ4cyVPRU6xgvVs098F0Zq5kX/OYC0=
Subject: Re: [PATCH 0/2] hvmloader: drop usage of system headers
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
References: <20210224102641.89455-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <35864c33-b375-a3c6-13bc-ad1e7d0773eb@citrix.com>
Date: Wed, 24 Feb 2021 20:08:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210224102641.89455-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0109.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::25) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02a4b95a-30d2-48f3-f087-08d8d8fff635
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5949:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB59490831C7ED57D9C2EF9804BA9F9@SJ0PR03MB5949.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZXRTNDx1e/6L3M14LmX7APu0+W/PWMI4+I60haKIIbvSTCxBJx0jqm8c2ZidBnj1sqGro2wB1wLw+7nb9GJJKeizKvWBj8q1vF0AvA1XoAHlahNYCLGre1NhHrx3ffcpEUR8BIAFgVjqu3+XpmY8yFnjY/S8igw5Z0wLojP99lzrpiZMhCLm82QQ701mEK1uUN6zLCrJpkyKHkxZbitXY7ZpGfPRNa962lzptHbnlKD2yU0DgskEPjVOeOa7KqgaD72v0d7RyTmu9MUlvoY4h7nvV6OT4hvk5EktfDL+tGVbSV1sSjutjMpgPzAELdfdEqZYpxE4eN8b9MuKDTE6hp3bzeyNCsjWA/fpBErI7PEFGS/YDn+f+cVCGRBRpv2puHgqCm/EJ25RR3VMGlz4lMi5lghiD+xeu0gGN1ATJ8ibuhIuWGb964r+oe5FbMqDsaAwjvsR2TiyYp0PeTdNoGEqpAUJOVB1bhkir4dwM95TSqkVJdJL9FplLFB6lSUqAmLcqwZZESsZi8C8DqMcZIZ5FWyodL7wes6vPYYy5+c+sBYUSEESvVStBX7VC7iGEH9Zy6cumkTKQ8Tl6Mg7HZtH2xhecciaJO8e3eq6mss=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(66476007)(54906003)(31686004)(66556008)(2616005)(5660300002)(53546011)(16576012)(316002)(16526019)(66946007)(31696002)(6486002)(186003)(86362001)(8936002)(26005)(6666004)(478600001)(956004)(2906002)(8676002)(36756003)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Sjc0SU5SL3JEUWk5M0g2MFRzbjZHTkpsZnNRODRhRm82NFhHby9zZEVTelJo?=
 =?utf-8?B?Z2N4MnFxZVhHS1owQVNGTXRtN1N4OWx0RldGcDk1ZlRTSDVnSXFqc1RVbFpw?=
 =?utf-8?B?S3FvYnRDdUhWYjd4OHFvOGtYamc5NG1XeFBCTEJEaStFVXZLUlNlNUJHYnVG?=
 =?utf-8?B?L2hreVB1WEdjbVh1SVZHYUdmamFSYS9PTUhWWE9VSkxucDc5NkZBaFhEekFx?=
 =?utf-8?B?MCtFMHJRczlGeGZyUXE0bjE1MTd3M1F3L1Qvcmx1MlpvNVlLQTNDbmtZTm9n?=
 =?utf-8?B?SDY5eW5zZ0hsZmw4NUxtYkN4RGs2WUJQT2xLMHFuZkE1NVZUc3BoTUtYSDlG?=
 =?utf-8?B?akJ0NE1CTjcxb3AyTFhNZ0w2ZDF4MHo5QlMyc01Wb1o1ZU9ybytuY1J1MFly?=
 =?utf-8?B?dEhGMk1NNXRuUWFzVUxielFJc1NIRzR5aUlZb0Q4ZUJoSFJzQkxUYW5sN1d2?=
 =?utf-8?B?bU5QK2dYUjduOTg3dTJTbTdqKzVrNWpPMEFHNUgxLzJRMHNBZENvejBLaEY4?=
 =?utf-8?B?WEZIWXlPNFlTMlBVbDNqbkF4R1NSdENqTU85cWc0S1ljbEhGSDJzSUJGdVVT?=
 =?utf-8?B?WnhnOHFpdlFLVU1DcFUyalpkWFJRbm9TUnN5TlllVnd5U1ZQaXBydUdpNlB1?=
 =?utf-8?B?d2pvMTRmYjJJWDk3QnRsYWxlZlFCN3BzVVZDVDZHZXdTbndSeCt2ZTZIeExs?=
 =?utf-8?B?WDJqRnE5WVM2VkdmYjhvenB3UUkwVURFS0Z4aEtKMStycUJnRDRBaG1yVTEy?=
 =?utf-8?B?bGJ0WC9NMUJodmo2ZmlTd1dJVU0va1FoZ1JUUXB2MHV4KzFDLzV1Yi85cEh2?=
 =?utf-8?B?WHlsaTBDZDZYMEtwUzhPT2U3eXlxUlMrZGM5SHVyc2ZZWC9EVWlzTE43S0M2?=
 =?utf-8?B?WDQ2NG9YMG4ySWhCc2liYVJBQ3pqay9meFJxUFZFM3plT3JVeU44ekxPWW10?=
 =?utf-8?B?RWZ4eTZqdDkvRitPazdqaFphb1E2ZFdqbHZwWWJuUjBSK3FSQlN0NmVscWRD?=
 =?utf-8?B?eHdxY1hwVVdkenlCNFdSNWRHeXdVM0hjMFdCL2pTOWtVcms1d25aRDBPdCs0?=
 =?utf-8?B?WS9zeUE1RDRTSlJseXFpa2tONUpSeExjNjNYSlhYVS9nUmtrT2gyeUhGQkhv?=
 =?utf-8?B?dENaNnIyazNXMjRaTGxkUnRBRU13V0daNUR2UDdsUTNFUm1DMmtNZ2d2akw0?=
 =?utf-8?B?S0MwUERQajBiQ2diQWM3aVNQR3ZKNUYySUZZSTRBUkpnd3FwZDRJTUc5ditE?=
 =?utf-8?B?d3NiTzNlNVFPZHlqdEp5TWhNMjhDaFJmQys4UmRnM3RVbmtCdUFTb1dDVURh?=
 =?utf-8?B?cFlaWE1ySzZCeWFZMGpiM1BYME5zamRZRGdBUUJmNDhVQmtReTQ5dndRZHox?=
 =?utf-8?B?a0FFeVVoNHBIK0dETlA4ckVYTzRMcjVNSVBuYklPSzI5UmVtcTNWNnNseWtW?=
 =?utf-8?B?bStrYjJCWktHaG5FNGh1Ykd1M1lITEtscmc5SlhVSTcrenhUYnIyQzUzallh?=
 =?utf-8?B?VER0aUwzTStuOGJVb21QSmdsR2Zpa0l6QU8vbDJCY05pK2tyaEtIK0p4Q2g0?=
 =?utf-8?B?VDRLclhMUE1zK20xbTFFUlBJVkc0SjNud09paGRKZUg4Qzk0RDV4ZFR6ekFz?=
 =?utf-8?B?RFYyamQ3SnVoQll1ellnWFJsMXBia0x5MVFWRWxJVERVV0FXUWxDVVBjbE5i?=
 =?utf-8?B?cjRFeHVHb0dhRWpLU21BV2tyd1VsbWUvb0RvazZ3aFg1SmNDaTVReGd5NmdN?=
 =?utf-8?Q?GxrkApf8f5CTvNuvDtJiUuHW7AMF0rIx9Ox2NJN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a4b95a-30d2-48f3-f087-08d8d8fff635
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 20:08:33.3944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RZQJczy81FXFDLkDmHNxHhzPHg8K8xNFZTd/SaVyFpL8uZer2e+wf8y/SEx6TwhoH/iFxGpX2sRU0FGbFHvXJLVi9qLhM11iMc5dcinQnUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5949
X-OriginatorOrg: citrix.com

On 24/02/2021 10:26, Roger Pau Monne wrote:
> Hello,
>
> Following two patches aim to make hvmloader standalone, so that it don't
> try to use system headers. It shouldn't result in any functional
> change.
>
> Thanks, Roger.

After some experimentation in the arch container

Given foo.c as:

#include <stdint.h>

extern uint64_t bar;
uint64_t foo(void)
{
    return bar;
}

int main(void)
{
    return 0;
}

The preprocessed form with `gcc -m32 -E` is:

# 1 "foo.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 32 "<command-line>" 2
# 1 "foo.c"
# 1 "/usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/include/stdint.h" 1 3 4
# 9 "/usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/include/stdint.h" 3 4
# 1 "/usr/include/stdint.h" 1 3 4
# 26 "/usr/include/stdint.h" 3 4
# 1 "/usr/include/bits/libc-header-start.h" 1 3 4
# 33 "/usr/include/bits/libc-header-start.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 450 "/usr/include/features.h" 3 4
# 1 "/usr/include/sys/cdefs.h" 1 3 4
# 452 "/usr/include/sys/cdefs.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 453 "/usr/include/sys/cdefs.h" 2 3 4
# 1 "/usr/include/bits/long-double.h" 1 3 4
# 454 "/usr/include/sys/cdefs.h" 2 3 4
# 451 "/usr/include/features.h" 2 3 4
# 474 "/usr/include/features.h" 3 4
# 1 "/usr/include/gnu/stubs.h" 1 3 4

# 1 "/usr/include/gnu/stubs-32.h" 1 3 4
# 8 "/usr/include/gnu/stubs.h" 2 3 4
# 475 "/usr/include/features.h" 2 3 4
# 34 "/usr/include/bits/libc-header-start.h" 2 3 4
# 27 "/usr/include/stdint.h" 2 3 4
# 1 "/usr/include/bits/types.h" 1 3 4
# 27 "/usr/include/bits/types.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 28 "/usr/include/bits/types.h" 2 3 4
# 1 "/usr/include/bits/timesize.h" 1 3 4
# 29 "/usr/include/bits/types.h" 2 3 4

# 31 "/usr/include/bits/types.h" 3 4
typedef unsigned char __u_char;
...

while the freestanding form with `gcc -ffreestanding -m32 -E` is:

# 1 "foo.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "foo.c"
# 1 "/usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/include/stdint.h" 1 3 4
# 11 "/usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/include/stdint.h" 3 4
# 1 "/usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/include/stdint-gcc.h" 1 3 4
# 34 "/usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/include/stdint-gcc.h" 3 4

# 34 "/usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/include/stdint-gcc.h" 3 4
typedef signed char int8_t;
...


I can compile and link trivial programs using -m32 and stdint.h without
any issue.

Clearly something more subtle is going on with our choice of options
when compiling hvmloader, but it certainly looks like stdint.h is fine
to use in the way we want to use it.

~Andrew

