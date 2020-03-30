Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDF3197B75
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 14:05:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIt7E-0000sr-WB; Mon, 30 Mar 2020 12:02:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XHnz=5P=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jIt7D-0000sm-IO
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 12:02:03 +0000
X-Inumbo-ID: 43e18b2c-727e-11ea-83d8-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43e18b2c-727e-11ea-83d8-bc764e2007e4;
 Mon, 30 Mar 2020 12:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585569722;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=g1RweuQzxFO/ahGJKuqwbIilu7hzZnvRuWC/cGf/U00=;
 b=KsxYJbxJX8krFUypv9x6ZnTaa8MYV7AO9j731TWmwAlH7fq2BFtegbWH
 Gyr8dIt8YCefEPtsKqFU1eLxzxDJtuT0sqpKPWpk5AxlV98fGHGSpSxYK
 EKNRmCptqAwG12wh2u2VSUVZGZ5lLH+3Bm2Co4xuXxDSU73IECHh3u7lM c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: s+cz7gUzInXqhijY+TYAksJRVcYlI8Hmh4F6A94IRVs9EOdfApiH0p4Yt5w4bGSe0ZhSw8oTt4
 pdwKaX2Is+CY0d3GvT/JeeffEYWEXMjkYtkwG7mtCx8K4TkUEmWkHk5TvS3lJvMSkrB+RpmDDO
 FkfUaHnwlho6f6AyvlvHnH3UbOFI3XV7rzfbtWU+q7LzjGgUxHHiPcdjyc++BsRgb30zV83Q2x
 CUH6U/kgj2TU9sO+VxSqYTs3jVy9mc2F7xj+VmRlk6RalTlQCDSBZIbT1mRd8W8BdMS56XwKMf
 +Zg=
X-SBRS: 2.7
X-MesageID: 15264934
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,324,1580792400"; d="scan'208";a="15264934"
To: Jan Beulich <jbeulich@suse.com>
References: <20200328152954.6224-1-andrew.cooper3@citrix.com>
 <3ccbd2dc-d721-c23f-d67a-6a1f8520fb2b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3a9d27aa-d2bb-4c54-0dbc-0ab4b443aac7@citrix.com>
Date: Mon, 30 Mar 2020 13:01:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <3ccbd2dc-d721-c23f-d67a-6a1f8520fb2b@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/ucode/amd: Fix more potential buffer
 overruns with microcode parsing
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30/03/2020 12:44, Jan Beulich wrote:
> On 28.03.2020 16:29, Andrew Cooper wrote:
>> --- a/xen/arch/x86/cpu/microcode/amd.c
>> +++ b/xen/arch/x86/cpu/microcode/amd.c
>> @@ -303,11 +303,20 @@ static int get_ucode_from_buffer_amd(
>>  static int install_equiv_cpu_table(
>>      struct microcode_amd *mc_amd,
>>      const void *data,
>> +    size_t size_left,
>>      size_t *offset)
>>  {
>> -    const struct mpbhdr *mpbuf = data + *offset + 4;
>> +    const struct mpbhdr *mpbuf;
>>      const struct equiv_cpu_entry *eq;
>>  
>> +    if ( size_left < (sizeof(*mpbuf) + 4) ||
>> +         (mpbuf = data + *offset + 4,
>> +          size_left - sizeof(*mpbuf) - 4 < mpbuf->len) )
> This proliferation of literal 4 made me look into where this 4
> is coming from and why it's here. Afaict it's covering for
> UCODE_MAGIC.

Correct

> There's no good sizeof() that could be used instead,
> so how about getting rid of this addend altogether by setting
> offset to sizeof(uint32_t) near
>
>     if ( *(const uint32_t *)buf != UCODE_MAGIC )
>
> in cpu_request_microcode() and adding sizeof(header[0]) into
> *offset near
>
>         if ( header[0] == UCODE_MAGIC &&
>              header[1] == UCODE_EQUIV_CPU_TABLE_TYPE )
>
> in container_fast_forward()?

I am in the process of rewriting all of this.  I'm not entirely
convinced of the correctness of cpu_request_microcode() in the first
place, but I also can't find a concrete problem with it.

>  (The code following the big, 7-
> bullet-point comment in cpu_request_microcode() may also
> need adjustment, but I wonder if we couldn't better get rid
> of it altogether.)

I'm unconvinced by what is described there. It honestly seems easier to
scan to the end of all containers.

>
> However, since the change as is looks correct to me and doesn't
> make the situation much worse, I'm not objecting to you also
> putting it in as is, in which case
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.  I'm tempted to keep it as-is because I think it is rather more
amenable to backport.

However, given the rate of finding issues, I'm going to hold off on
committing this until I've completed the rewrite, and am fairly sure
there are no further issues lurking.

~Andrew

