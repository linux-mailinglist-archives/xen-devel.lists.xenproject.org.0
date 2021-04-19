Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48885364740
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 17:41:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113055.215440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYW1j-0007lJ-Au; Mon, 19 Apr 2021 15:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113055.215440; Mon, 19 Apr 2021 15:41:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYW1j-0007ku-7q; Mon, 19 Apr 2021 15:41:31 +0000
Received: by outflank-mailman (input) for mailman id 113055;
 Mon, 19 Apr 2021 15:41:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3l5R=JQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lYW1h-0007kp-Ri
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 15:41:30 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3681165-6bfb-431f-8bce-f4129a8f96ee;
 Mon, 19 Apr 2021 15:41:29 +0000 (UTC)
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
X-Inumbo-ID: d3681165-6bfb-431f-8bce-f4129a8f96ee
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618846889;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fvvP7whCMD3duNYZRY6vaDfvwuIp0piOan+hidIYSW0=;
  b=cjq5KPci7f33/L8yJIIJ3iu583aGJZ1SUfnWz8qaQEy2RmypsLTVFK0a
   42ilMp2xqTZjie+39lJIIH09LDhx8CnrkOe4eCoUT1mMiobY3xkdT3r8m
   tAs/Vppr9YT37OqVfgRLX/HuXCOLAdxQpp2OAt6znbMjGB9iI/0w1BXrq
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Fy0JXK6NypPBzdSGRLwDU+DRFfNBH+CI2iIQs1qQaUU4LrE6HB8FtI6lFg7wV8vyHhLPVF0TXZ
 Mq5OGdXItE3TMLe5esPt+sZodqieMKZU7eXsgvnBZKwFp559dwM+Q4BC/XKpWFIFNUXuIEgvsZ
 cB7biaSKqmHSNF7iYTWqsjUuXl7IWvaBZrg1A3Ojlqnv6Ryemui8zlS9zUglmsmE9DtgBOyH6E
 k5mG6mOQp6/v1uUvMQSxP2OgxAveMQUY7FxANVoM2808J3grj4WOXPAJRdQJMk2TRL1S8cpkl8
 pmM=
X-SBRS: 5.2
X-MesageID: 43385309
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:gyNs2KgKSWAyMrWQFiuR/cVUC3BQXwh13DAbvn1ZSRFFG/Gwv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmKJdy4N5B9efdSPhv3alK5wn0Jv6z1TbaknD38N+9Y
 MlSahxD9XsEUN35PyR3CCUG8stqePpzImGnuHbpk0CcShPS4VNqzh0ERyaFEoefngiObMcGI
 CH7sRK4xqMEE5nDfiTPXUOU+jdq9CjrvuPDSIuPBI79BKIyQqh9b+SKXOl9y0DWDBCy6pKyx
 mmryXF4MyY0s2T+1vn+EL4q79Xn9bgzdUrPr3wtuElbg/CpyztSIBoW7iptC04rue1+D8R4a
 XxiiZlBetfwTf8eXy0vAvM1mDboUkTwk6n83C0qz/CptH0Xz0zAcYpv/MmTjLpr3AOkfs59Y
 Aj5RP/i7NnSSnusQ642v3zEzZtrUawqWpKq59ps1VvFbEwRZUUkZYS5ypuYfE9NRO/0q8LOs
 90AvrR4f5HGGnqFUzxjy1UzNugUm9bJGb+fmEy/sic0z1hlHtk1UcvxMsGgnca9J4mIqM0n9
 j5Dg==
X-IronPort-AV: E=Sophos;i="5.82,234,1613451600"; 
   d="scan'208";a="43385309"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLP+Jsd6Ch6nkW5eMMkET2vcaFnz9tIc9aD5H3OPQZ31MPlVGRZGnEHaM/fHI5WV0F5ySQ8TuytAITSBDPYT8ZT6k2Kjg4+4sXGy5tqkvv8T0ECGZSWceHgHCafsOfzO3bgmuivGMjJHhXu0Ag5wZuXLyJ40x0ffMi2E/UW3o1IaH2N5SuyBVpi2GUcYi2SWfTp/xBRmARswMwuF8m3SxHkJE2AyvXkxqMxXfQOipeXU70p1BMOLJP8lzc2YoLd2h9nuMUX7FRkWxGx4EzA0vMG/WgN0qV/iow0C7Fmb4p3IKq8wjs96Zc9QCRVCWVmNyVKoze/aLSctl0Ak4iYxtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lu0ZOfWDtogrq3BaA/5ECWt1npO6miuYolO18GQiwzE=;
 b=B2pzsr6L3dVcrinSwG5IhVsnuowjBFGGmW4C4vRofFOhzDqbfkzdIv1o4CE0x2c7OY3cIb1ICOWZ+94B/df+r+l/s4dsxzGmI6Iy2eu0g4Pb68EpTuG9qLdQj5dhzstbaf+pjSkQxRLGj+vBUO9EMgULZv4BGbFcRFh0Q20PQk3Snn3ngXBugaB84jLSZ9iXE9HqEXV25L9f2XrByVLLzvy3Msycb46MFwPf/R24YqCmb5AloXjzgJlaUdrfmkZI215nN96LHDaEBBNWc4wcwcb5CbX3ifDoetPy543chxUdQxIOugbGd9BVwYyn6jYB575FDvaIxemGkHtzNubMbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lu0ZOfWDtogrq3BaA/5ECWt1npO6miuYolO18GQiwzE=;
 b=gdPPbLpr5p1rdNW6NRBOvgPC6PoSYeRfFvJ1u5rKFyskt4YRmtvRVx3nb/1qPyHzUu17g/vryYXz2EYhyp6rdv6oMKY30jbgrxsgWsy9wbk32AArCvXSDLmpjl1n30qUslGUbMorxkG1769fCbvuBTQg7xRR3SPZ027mZKyFU+I=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <723af87e-329d-6f52-ece4-fc3314796960@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul: fix test harness build for gas 2.36
Message-ID: <5e6f7769-ba07-bccb-9d73-4c7c0db67f89@citrix.com>
Date: Mon, 19 Apr 2021 16:41:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <723af87e-329d-6f52-ece4-fc3314796960@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0322.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc5f8020-c2ea-4f88-1190-08d90349973a
X-MS-TrafficTypeDiagnostic: BYAPR03MB3734:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB37341BE855857D0D4A353281BA499@BYAPR03MB3734.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dZrU3Wmdut62If/o7KccnFNXCSVmCgE/GxnMja+K0YDda+2KFvJ0Ybq24aLdplMpjNwfl5LMofD+VN1HLXzzaB/EWrb70PFWHIJbOrVTO4OsdpfND59Dp2T7wT7VTeekuISfqzFRAA4OiVwhaOeNRCRjJtcHlFQ9D+Vm/vdQZpCkOM5SKilOsLL87XC17Fw15PY0a8XryMceDN08Bzi/qoJ6iwMLSegVNdi5aahJapFmZFapAdYwrsOOIq0WDpvoG4aW/kM4CgbJF52X2AuiJuQFNy2K9nhTXZIGvzwX4k6bGePkSiY7UawucFBCymwzh6gTSS2GfdEgs2u3P1vdJcK+I1OYdSOsImXBxjTENL/NtbdSnzJU+KlUj3Xo+UVBL27vNb3ptccWYns306OttJbdecN2whZ90C+mHuU+Squ18ep6nax/ykNkmZD/VdDyBpwyQ/7/yTtjh0hjCjTQVbiBeWDKW0/2sAO+LQRyGH/WJlsrFpPk/CHIrG3TuF2G1OIs33bMcLfuXdTlJVJxtOtVhj97QZyRqlzFEN6hUtJ3HlZWAd6qN1fVxdoIOL1o9kMZjwi02RYmqu81BsGhZ+qVnR4oXPOhzyDOZstZ3yYqiCLLi/CndABLp9a9ApDCBs+sPDA4AWJv/aYsyB+anb/pB0Mnpalh2ikcdT8k9KJs3Fh1+YHRxblQct8OZ/QheTEmiXc+b7IuTZstUj5N0aKj6X0IUozuquKznG7gcFRumWBWJQ0Kh9drEsSMltmrk7+AdIRfvaB85k4b+OS0LQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(366004)(39860400002)(136003)(16576012)(316002)(6486002)(31686004)(53546011)(54906003)(4326008)(2616005)(16526019)(26005)(107886003)(8676002)(8936002)(110136005)(956004)(186003)(38100700002)(86362001)(66476007)(66946007)(66556008)(36756003)(6666004)(966005)(2906002)(5660300002)(31696002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RVNKcG0vL3JDWHpkM3lPSmwyQkpiaDdHRUZGYmxNdUMyeFZwU3A0K25LWkw2?=
 =?utf-8?B?TS9pbDlDM01aUFZ6dzlEU1dTU1lBMXB4Q0w3ZTNhOUpYVnhOREJwYkxFVEdv?=
 =?utf-8?B?elZRZkhuRkVpVnB0YWxYQ1JOdUlGdlNEWmNaTHI3a2IyRm9SdGNMd3BGRXBR?=
 =?utf-8?B?K2VEQ3NnWW15SkFKZkJwdzJTcXYyQTJjbktUOTN5cnFqZlpPNTQwTXBOcDI1?=
 =?utf-8?B?SlFEU0ZFa0JOUnoySHV5SlpOMml0RjRUMklrMmVMWGhabG5LTWNVcnIxU0g2?=
 =?utf-8?B?YTM1UGxNLzJYV0l6QWpvZzFJZGtEQnlQSnhsdmVIR0pZWE9qZWFhTGM4Y0or?=
 =?utf-8?B?NjJQODVqb2JaeHcvbkdrbGMzbGNLUXkrN3prSVc4TGJRZ1RJRnBlam5reUdx?=
 =?utf-8?B?OUlISFhINmtBcEF1VVc0VWRPUWREd2w5SjdXOUk4UkR2SWlRLzRjaWhzSEFv?=
 =?utf-8?B?OWwyMThLem1leVBmT2I2VWF6TlVqS1ZsaXdCeFVVNXEyVEVhSkViSGlVdDYy?=
 =?utf-8?B?UmEvd0xESE1iOXBrSGxPdjhiN2ZYaUFINTZ6US9sSVREMlR1OXkxQldjeFZS?=
 =?utf-8?B?UWk5b3UxOXJYSEdJTjVHeHlTdnB4MHIxQUJwTUY0TzlYejgwOFVnSmVJdEZD?=
 =?utf-8?B?VW9nTGNwQkxDRHJVL1QrS3RWVWFzMmhGV3pHSmw2Y0JPMERsNlhvYzlZSXJG?=
 =?utf-8?B?dGtlOE43aUlxQUJVTEVYWGJZSWcyckhQaHpHVFQzejBURS94S1dKNXVXRE9x?=
 =?utf-8?B?THY5RHl3WWM3eTI1TU9ueVY5ektGVGFqekh0eittUERKeHVwZDVBeGV3aFNk?=
 =?utf-8?B?SU1NSVhENmNoeHlvVmkwUDJRSzJoY0I4R1Q1Z1NVYXFma1lnRER2YVFHdEhr?=
 =?utf-8?B?d2xEbHBzRnIrSy9YenBEWmZUN2xSTmRtRlhjOUpMSHhnVHFyL1ZXQS8xRXhQ?=
 =?utf-8?B?SWZFZnBHc3pmdXE0NDd5dnFIenZOU3hyK0lLa1hXZk92WDlNWFJOM093eEM1?=
 =?utf-8?B?SjlWQVZKL1ZJbTdBbElvcFBjSGhjTXlDckxvTHlpNnlyWXZ0ZFZvWjlpVDBQ?=
 =?utf-8?B?eXBSS05MaEh0Uk9HMFRtdXBsZXZidEdRaHR1dHY1clVEY1g4ZnBBUGtUdktr?=
 =?utf-8?B?NHRkVldBbUQrMzgvTWlNNURBaTVLMnVYcEF5VkVPS2ZMbW94UTNUT0NCVkxM?=
 =?utf-8?B?dVdiWGZXRzVRWFg4M0N4aWJVQ3EyNWhPZWl6YkNiQ0tsK0tDd2ZoZDkvaFdK?=
 =?utf-8?B?L0w4eXY3ZzdpSG12RUhxRm81NCszeTMrYTFSd0FYeWo3MXQ5ckI5OTl2cGU5?=
 =?utf-8?B?RmRkWHZWUlFudnkyblhCbDVDNnhGNjMwZmc2N25JdVJxTEFsOFQwTHB2SFRn?=
 =?utf-8?B?aFVUMHQ0L1Fkc1BuWFdSMGFtb0V3QmYyRjJlN2RHL3gzK2tjb29WSVlBUXAx?=
 =?utf-8?B?M2hQaXNhZXRTbWl3a2gvZ0VId0xqeGJ5aHRTL2U2Q3pjT25DLzlFcndnZm5p?=
 =?utf-8?B?Z0JiU25wbjNWZFVwcmswZjFVM3ZldisydEtQdyt5ei9QWmhodVUxc0pRbUZR?=
 =?utf-8?B?K2Zpd21LdXdhK3RkV3V2YmM5Z3BqQ2VUa3FqRUo4Y3VTQ09JZlU4WGdRQzFI?=
 =?utf-8?B?T2NHNEdQNTFuSkN6MFpiODJwazhla1RjMUxxcm93VjFNSWhMUXQzM042TUgy?=
 =?utf-8?B?aVdGOHNzUWJYSWFxbDdTWmNDQWxrS3h3aDRYS2pFU096a2crWUJEREdlUVhY?=
 =?utf-8?Q?Jw7E2y5WEeg7Y51Zlee4BRyeI/PKZSl1FVgM98w?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc5f8020-c2ea-4f88-1190-08d90349973a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 15:41:25.5876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ee+EqA3N1R9r1Qy/AIZau1uHhcutgpzkOSYT/6t3NNKrziZdUu1C5mRVQ+TEE+uGi3j0GBOoTInlUvvUHa6LUY7+Z4+jN3IwuREkuAlXDvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3734
X-OriginatorOrg: citrix.com

On 19/04/2021 16:30, Jan Beulich wrote:
> All of the sudden, besides .text and .rodata and alike, an always
> present .note.gnu.property section has appeared. This section, when
> converting to binary format output, gets placed according to its
> linked address, causing the resulting blobs to be about 128Mb in size.
> The resulting headers with a C representation of the binary blobs then
> are, of course all a multiple of that size (and take accordingly long
> to create). I didn't bother waiting to see what size the final
> test_x86_emulator binary then would have had.
>
> See also https://sourceware.org/bugzilla/show_bug.cgi?id=3D27753.
>
> Rather than figuring out whether gas supports -mx86-used-note=3D, simply
> remove the section while creating *.bin.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/tools/tests/x86_emulator/testcase.mk
> +++ b/tools/tests/x86_emulator/testcase.mk
> @@ -12,11 +12,11 @@ all: $(TESTCASE).bin
>  %.bin: %.c
>  	$(CC) $(filter-out -M% .%,$(CFLAGS)) -c $<
>  	$(LD) $(LDFLAGS_DIRECT) -N -Ttext 0x100000 -o $*.tmp $*.o
> -	$(OBJCOPY) -O binary $*.tmp $@
> +	$(OBJCOPY) -O binary -R .note.gnu.property $*.tmp $@
>  	rm -f $*.tmp
> =20
>  %-opmask.bin: opmask.S
>  	$(CC) $(filter-out -M% .%,$(CFLAGS)) -c $< -o $(basename $@).o
>  	$(LD) $(LDFLAGS_DIRECT) -N -Ttext 0x100000 -o $(basename $@).tmp $(base=
name $@).o
> -	$(OBJCOPY) -O binary $(basename $@).tmp $@
> +	$(OBJCOPY) -O binary -R .note.gnu.property $(basename $@).tmp $@
>  	rm -f $(basename $@).tmp

Hmm - this is very ugly.=C2=A0 We don't really want to be stripping this
information, because it covers various properties of the binary which
need not to be lost, including stack-clash mitigations, and CET status.

We might be able to get away with saying that we're operating strictly
with defaults, and folding these *.bin's back into a program which is
also linked with defaults, at which point the resulting binary ought to
end up with a compatible .note.gnu.property section, but I'm not sure
how convinced I am by this argument.

~Andrew


