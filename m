Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 119713F5F25
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 15:27:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171384.312743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIWRr-0002xm-NU; Tue, 24 Aug 2021 13:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171384.312743; Tue, 24 Aug 2021 13:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIWRr-0002vB-KJ; Tue, 24 Aug 2021 13:26:39 +0000
Received: by outflank-mailman (input) for mailman id 171384;
 Tue, 24 Aug 2021 13:26:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QsuA=NP=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mIWRq-0002ux-GH
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 13:26:38 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e2fd834-dacd-42ca-ac56-26230566027d;
 Tue, 24 Aug 2021 13:26:37 +0000 (UTC)
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
X-Inumbo-ID: 3e2fd834-dacd-42ca-ac56-26230566027d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629811597;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+R3AKr7sSr8BenlSnpSeFd57ZL4fsrFxmCe2AT8WkTs=;
  b=RsRjhUDEczqgLUsKKuh/hAo3ajSZ4B9FL58Mcqzg1GE8NCjVVOF8uQ+P
   Vq0SEd4DtK//w3uCwZFdu7+C6s+zjC6XnjTPkNC1VvZVy5MnWu2WkmlK/
   yfitc3j/Qp/itOrYoak0ccP6jxw8Y9wICKYbGpZYXwwVS26+XH/72stZ8
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Hd3GifuYVJhJ7rbm73nNqYQFW1DtHmuwKxuEVmvS6kB00dfTeIhi+gRcIT73UV8CMOfcU2cl+H
 NZvRLyt6sCQacGz+G79oixWhTtLeICxXqrzvHKeIXvfDAqHRf09R2DksU/nd+k0o5ofjE2lCXW
 79un/9oSClA8QiX58DyFCjO9swSSqTgz+UtkeZGkSvze0FLbhyWpCQy1yabKzSJI9mxyDRep/i
 1pb3xDjG6RiTekqiB/AX6nf3Pqn9fMybCYcJJhdB15YzK/dYLY29/yXwU+9oP5SWi9lNMI8cI4
 WRP8ESWIG6ztsIfbXELsUln9
X-SBRS: 5.1
X-MesageID: 50784451
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:8JMA6K4Q2jqeYqEdRgPXwDLXdLJyesId70hD6qkQc3FomwKj9/
 xG/c5rsSMc7Qx6ZJhOo7+90cW7L080lqQFhLX5X43SPzUO0VHARO1fBOPZqAEIcBeOlNK1u5
 0AT0B/YueAcGSTj6zBkXWF+wBL+qj5zEiq792usUuEVWtRGsZdB58SMHfhLqVxLjM2Y6YRJd
 6nyedsgSGvQngTZtTTPAh+YwCSz+e77a4PeHQ9dmYa1DU=
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="50784451"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGzs+zwaR+lCmhFEwgDfyIQBxUqjV+E4LCHIZ7Kwp/IGljTVYJOLW2SfxgGaxnKUdGZJSpq3KbVNy0e9cbCpF5Nt0VRs6MstD3UBE+xZubxVKF8WSsJt9+RalAgI57oycfC96KHztweZL03zLdERdL4nglNanEoV0QdVDIFKFTvS4NekrfJU/vMvJ23NgOFmcGN2tymyYFepjPgXwAeIw2URuq1URe6qasj57XD1hGsf2N3Kbcy0ACgE8Cv67y7d0oiMDYZq61NFMyb3TXmY/D9tQPgjapEw4gzNbyh1b3fy2Vo60dAUy8UTSTozOsHz/ZAyrwY4qbTzkkgy9Xl2xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/VZWn5+2hGrIz3nmZ40y8mKPowdTAccDunKosmnRww=;
 b=aURXQ2qzXkrQK09NUo0eZAv7YLC4ebYUeVWe9vNZNdOy8UVuF00mBpXaubqf68r1X9fjVgVdFKROgJBXSPbZN5L/K4UQI0x7WAunevjSfFdJhsg2vvM1X5m0y9krNjDJMlh3uoENgJfFcJgtPMsaSayqA9Z90ALwVDQZE6DMNRwQi/2Q/nQZ5e3c9tJQVSBx4A/0CTWW++TRLJJe3JeQQ31i94MZ+FdXAnRe0Vdf+7f3he9qNp77eJxJ9eKD1qoPWSpqJT8r/rq55WFu4k6UGLYqAYRnO/wV/a642mC/Kq3f0TzKr1Xs92NmJaG5OCCl3bQPzHpivZaaYJ/8k/zcbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/VZWn5+2hGrIz3nmZ40y8mKPowdTAccDunKosmnRww=;
 b=FPK6Ke1ypMEV9qyhcynBvnlm+xRuJFvcY8xWWJHJOqUOvN4QG8yEPEFVJXUPkDFTHSwNz7BZEWM4VXxjHOKm//ae7xWxMsAlXEDcEB1le3wTrEzfXYqwB0W5YEAMrSvKtKvPP8BD57KLhBIxSzilRtYtPSom5dzwABLLPSXaFCY=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210817143006.2821-1-andrew.cooper3@citrix.com>
 <20210817143006.2821-3-andrew.cooper3@citrix.com>
 <606ce242-65d9-2180-8330-525fe5ec5562@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] x86/amd: Enumeration for speculative features/hints
Message-ID: <351b2066-d01f-16d2-f1a0-bd7e2fe0965a@citrix.com>
Date: Tue, 24 Aug 2021 14:26:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <606ce242-65d9-2180-8330-525fe5ec5562@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0103.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de2c5ab2-4826-43a3-2209-08d96702cad7
X-MS-TrafficTypeDiagnostic: BYAPR03MB4869:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB486958A80532FE1F8030D618BAC59@BYAPR03MB4869.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9l1QidbU86ROzo/POA1yt77M7qZ3DioZ2eThjHadnU6T6t3l1NnEVkJ2N/WsFOwLQwWAt+Sv1lM/GAfRhj4GBYX9/rVJVrqJRfrFYmhTigyCKn7/KRw/YW1sbXtrS3wz+a5wcLGaRcDi28K6FUpYNaOjSPCUBWLnM7JEGVEirftaJTcYrFX8dvATZHIwPGsuPzzIgIi+g9joKhae7bR5iWsdgB168rqqIKcUhvwlk5b0QZfwkzyaqfX1RnFRWurB2S6D3TrwsiAUqj0hp9RCc49gbtkjYGvMR2XCGwBHEK7prU1tMzONbrzCxcQ/3lS7AckzGADEHhMLeubiGamK3qS1Rf1DF1p+KkHdg/zGAi/ND7inOYUilMUohI9bJQtKuvwJiAaV3VnSPQcLmbWLBtye1lCFtvsC2r88V3lKU8W92x5Fg4uBhtXavv63F8tt29bYLeYVwApSPBvhSs0VhGJh0Wcg/x/p+n8j3UwWh+oK/vPaFt/JqhraYBHKdU5u8xi9Z5IL6UEnzZf2pVve8gESi1z6KTfFXgYbhA1MxAX+u0Yf58PE99DFmCxJFJv0w2Q4vqVwiqvRTeXtWE7Bal3T6OnyLuu6W5IWek0rbpfShRuY3gGARZazQeDiHBhLEA8EDQm9jg4ZHXUValdWtP6MdtboKiDpwkM2HuH6NmuMu+vLGqlEDhq82EnQk9luzKQrYVNQhGAcQx8O3J4GHXcIdzIJSWFn0IO3JkopVeo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(66476007)(31686004)(316002)(508600001)(6666004)(8676002)(66946007)(4326008)(6486002)(36756003)(54906003)(5660300002)(83380400001)(956004)(2906002)(8936002)(53546011)(186003)(2616005)(38100700002)(86362001)(6916009)(31696002)(16576012)(26005)(55236004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGpmc2NDSFVBK2k4RWd4cWtEQjg5YlB6bDhZOVpkWDZVSnRFaDVNRWgvTWhL?=
 =?utf-8?B?QWkxOFVJMDFOQ1lPZUowNEZtaFNCekNqVWpaaFArM21NcFJFbkl2UTFWSDI1?=
 =?utf-8?B?cVNSSmVpd0hiZ1FXQ25XY1VkK0VheUxtUHVxN056NG1QTDZBTjRHekwrZENl?=
 =?utf-8?B?MW93SjVSZHcrSlZ6Y2hPNFREREhjd3VESXoyVllweVNiODJNcGRhQ0x0TExJ?=
 =?utf-8?B?ZXR5SkV3MEtNcWlzZkZPSE1STzh5RGpvL3FhaDg4b1NiR2Z5Rm1DMWlvWTRV?=
 =?utf-8?B?VndJYXZ6VndLdE1IRkt4ait5U0tBYUNXVVJZRUEzWFpRUUxpQzN5dXJwY2VB?=
 =?utf-8?B?K01tWE1aSUF6SGF3TWtFMWNFWFQrVmpkSGp0aklQVE5XT25wcW9ObHdxUklm?=
 =?utf-8?B?T3hUZittMmJVVThQSS9idjdVdkRGS0hzT09KSjhISzBveU1kcnZBQ2g1WE1n?=
 =?utf-8?B?UzQrM0I1U2o5TGFSZmJVamRRYzIrdkI2a2VxMTBSV1pOMERBbGQyT3dJRmp3?=
 =?utf-8?B?MERpcnVZZ3FIK3pNNXIxeXlxVzNIeFN0OVNHVmc0NU1qcEN6ZytkWlQ5Ymk5?=
 =?utf-8?B?N1FHVTdlT1BGdXFla3AyZDFDVU9CSzBPT1hXSC9Nd3JrYVZpdVlMSFIweFFY?=
 =?utf-8?B?WFlmQkhUTm9uTW1hc1dwelVWY3Z6UlFHZGQzcmV0TEtGaElYeTBLRTBVNE5J?=
 =?utf-8?B?OHN1WGFXcXl4WWdCZFNzaE5uNXJYYnRRSlVZREU1R0ZORUtPdUZaSVIyQ3Nw?=
 =?utf-8?B?eklmUDdKeFNwMTFJcnNUZ0xSTkxDV1BpWTlZNXlpWFBZYnk4VDA4UzZscStQ?=
 =?utf-8?B?Q2lvdllxYURRVXlZVkd5eFU4Vy93cDFiODU5U2RWRnZxdEIyWERBaW16d1JJ?=
 =?utf-8?B?cUlOQ09tcVpUYzZsYlhSbDNST2JPcXJuVTlsZlBJTnkra2taWExlYllYb2pq?=
 =?utf-8?B?VDUzN0Qzcm9jczBnRWFRMFJxWXNIZkVoVVZhUTB6RmZZTGJNc3NaVTVVd09Q?=
 =?utf-8?B?Vkg3T242bzlFeFcxWWJpR3AwbnkvSUNGeUdDV2ZsNkZ6dkt0YkRMU2llVXdj?=
 =?utf-8?B?aTJSOVVRK1JQS0cxV1lPNDNTMFYvSFAvMnYwNnNTaVdKMlc0eGYrNUJ1ZDJh?=
 =?utf-8?B?ZjZzNnJoRk9JWVNKeFBZSFBpZ280UTBpVUxNNXYvUXJNQTh3b1RoV09ydldT?=
 =?utf-8?B?VS94cDhSWU5ZWVhQbm5DeVdaY2lld1JLRVV0UVZuTVRYWG9FekZnQWY2TW9J?=
 =?utf-8?B?eCtxWUtmalhWR2RUbEk3OFlWRGh5REtCeGFhc3VUVFhmWndvQlFZeFBPVTNB?=
 =?utf-8?B?aldMempzZEJuTnkrK2dJWWtpampkTVNad3NsQWZUU1pvVzFXSHZnMXpOcFlD?=
 =?utf-8?B?dlR1a2lnVnJweTlNSm1nTVBJODlseHIyeisrTzVQY3Q1QXh4Q2tlSmdQeS9I?=
 =?utf-8?B?eFo5eDRSZlh5NGVIODVsY1pQU1MvclVVZkxFM0tMWVNmYUE3ODJpak1MOVlX?=
 =?utf-8?B?OWVjZTY1dXRsbnNEOHBpTnV5V1grcy8rOHpzRU5WRS9wRVBDMklnaDh1RjRm?=
 =?utf-8?B?RmFlQzJvaW10emszbkdOTElQMTJOU1hpNzJsWVd4bUQrQ0V3TGJmdExRM0Jh?=
 =?utf-8?B?UmgyZ0gxZEVqNy9qUE96Qlp5dHJrcFBvWjBibmNYRzNJekVYbE5HYWgxRGVG?=
 =?utf-8?B?cWpROHEzTHlxUmIrU045dXJ3Q1k4TytoOEoremlhWVIwS0VSVWo1K0ljUnlw?=
 =?utf-8?Q?1h6KLhydW/5r3oE3Atx9+IBjihtrbhQ6Zh2ak6y?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de2c5ab2-4826-43a3-2209-08d96702cad7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 13:26:34.1657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pWuUsBye4oXNRga+5YUluLu/FSzld3yjzP1gS6Wsi0xjdLWq9qRjhyBrhhRuPpFX4iAHFwZaGaKCB7B4ZgV6W8TeiuY5WLYUAjkY/OvDZXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4869
X-OriginatorOrg: citrix.com

On 19/08/2021 15:47, Jan Beulich wrote:
> On 17.08.2021 16:30, Andrew Cooper wrote:
>> There is a step change in speculation protections between the Zen1 and Z=
en2
>> microarchitectures.
>>
>> Zen1 and older have no special support.  Control bits in non-architectur=
al
>> MSRs are used to make lfence be dispatch-serialising (Spectre v1), and t=
o
>> disable Memory Disambiguation (Speculative Store Bypass).  IBPB was
>> retrofitted in a microcode update, and software methods are required for
>> Spectre v2 protections.
>>
>> Because the bit controlling Memory Disambiguation is model specific,
>> hypervisors are expected to expose a MSR_VIRT_SPEC_CTRL interface which
>> abstracts the model specific details.
>>
>> Zen2 and later implement the MSR_SPEC_CTRL interface in hardware, and
>> virtualise the interface for HVM guests to use.  A number of hint bits a=
re
>> specified too to help guide OS software to the most efficient mitigation
>> strategy.
>>
>> Zen3 introduced a new feature, Predictive Store Forwarding, along with a
>> control to disable it in sensitive code.
>>
>> Add CPUID and VMCB details for all the new functionality.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with one suggestion:
>
>> --- a/tools/libs/light/libxl_cpuid.c
>> +++ b/tools/libs/light/libxl_cpuid.c
>> @@ -274,8 +274,18 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_lis=
t *cpuid, const char* str)
>>          {"rstr-fp-err-ptrs", 0x80000008, NA, CPUID_REG_EBX, 2, 1},
>>          {"wbnoinvd",     0x80000008, NA, CPUID_REG_EBX,  9,  1},
>>          {"ibpb",         0x80000008, NA, CPUID_REG_EBX, 12,  1},
>> +        {"ibrs",         0x80000008, NA, CPUID_REG_EBX, 14,  1},
>> +        {"amd-stibp",    0x80000008, NA, CPUID_REG_EBX, 15,  1},
>> +        {"ibrs-always",  0x80000008, NA, CPUID_REG_EBX, 16,  1},
>> +        {"stibp-always", 0x80000008, NA, CPUID_REG_EBX, 17,  1},
>> +        {"ibrs-fast",    0x80000008, NA, CPUID_REG_EBX, 18,  1},
>> +        {"ibrs-same-mode", 0x80000008, NA, CPUID_REG_EBX, 19,  1},
> Here and below, how about dropping the "mode" part of the name?
> I can't seem to be able to think of any other "same" that could
> possibly apply here.

ibrs-same is very ambiguous.=C2=A0 The only other reasonable reasonable
alternative I can think of is ibrs-psmp as an abbreviation for
ProvideSameModeProtection.=C2=A0 Obviously, the "Provides" bit of that can'=
t
be dropped.

~Andrew


