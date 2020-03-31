Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F8E1998D4
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 16:45:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJI6f-0008TD-UP; Tue, 31 Mar 2020 14:43:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fshn=5Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJI6e-0008T7-CF
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 14:43:08 +0000
X-Inumbo-ID: ef406080-735d-11ea-ba29-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef406080-735d-11ea-ba29-12813bfff9fa;
 Tue, 31 Mar 2020 14:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585665787;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=k6sZErTXX4Dd552tIFSDCVBDQcP3WdIiGGyfrIjjaDw=;
 b=SNVk/6Bih9lUmD7xwsCx8l3Ehvm/fuRXTZQi+p+RtOPf6Ihq/ehIgFH7
 8ntg9dcf6qZn8/cJkpfsJxWKfF7pvNFCCJo8+YQzSjsf+9shG12Oyyiu0
 jI1hbsjdnJulN5PQiShTEiDzgpe68q2Ds+N9zAUIa3FP+zpnIGvPUlOhB k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ut3ilwmamlN3xwyygqWv9XHpyxF0X2O/NjIwQ6Ss0Ecoy88DNrOxxhgtDZheIn2ys37Ei/uSi6
 qULAVUpu+DAVksG7zn+LtCpTEf0gN97fXyXt+gpam2vOEWpN8DsfLDHbdGLFhGIhbX0egp73FN
 dpwl7ZhUbFhjgvQSlvgpTrXdwHv3dtZkCZZNIkmuORXF1HP6TZi7mSxw2Nxcci6T0JstGtQZKf
 5Hc0N8aZdeNsjZ4WwRK2p1/UY0wn/weHtS4ny+Gk/UgdZunQMvWvcE2QGRhTd7H4rtXF/5YHWa
 Dvk=
X-SBRS: 2.7
X-MesageID: 15591251
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,328,1580792400"; d="scan'208";a="15591251"
Subject: Re: [PATCH 08/11] x86/ucode/amd: Rename bufsize to size in
 cpu_request_microcode()
To: Jan Beulich <jbeulich@suse.com>
References: <20200331100531.4294-1-andrew.cooper3@citrix.com>
 <20200331100531.4294-9-andrew.cooper3@citrix.com>
 <ced042c6-a881-f44a-4800-0e8ec30d92fb@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8dd2e9f1-99d1-2e5c-b710-b4fa92b34b97@citrix.com>
Date: Tue, 31 Mar 2020 15:43:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <ced042c6-a881-f44a-4800-0e8ec30d92fb@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

On 31/03/2020 15:41, Jan Beulich wrote:
> On 31.03.2020 12:05, Andrew Cooper wrote:
>> To simplify future cleanup, rename this variable.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
>
>> @@ -438,7 +437,7 @@ static struct microcode_patch *cpu_request_microcode(const void *buf,
>>      unsigned int cpu = smp_processor_id();
>>      const struct cpu_signature *sig = &per_cpu(cpu_sig, cpu);
>>  
>> -    if ( bufsize < 4 ||
>> +    if ( size < 4 ||
>>           *(const uint32_t *)buf != UCODE_MAGIC )
> Take the opportunity and put this on a single line?

I have actually done that in a later patch.

This was introduced in patch 1, so I'll fix there and rebase it
throughout the series.

~Andrew

