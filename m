Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 664481C8C16
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 15:26:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWgX5-0002vf-Bq; Thu, 07 May 2020 13:25:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=53Et=6V=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jWgX4-0002vX-33
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 13:25:46 +0000
X-Inumbo-ID: 41172195-9066-11ea-9f16-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 41172195-9066-11ea-9f16-12813bfff9fa;
 Thu, 07 May 2020 13:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588857946;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=tmB6z3p1qvF6/X9wtkwFDp/kOrzHN6RtY/T+wRJL+qY=;
 b=BEKSK1tZZDfXIWYIGMEOpLnqQIM/0IRMo9/8q/1Vf0pUAjsQfp39w08+
 DxQh6cDBTLgqYiDl3gsE5Q6U26/uF/tS/LBZO+4PEueMKF0DtdpRsLVaW
 MM7bFToZ9YU0gkU3M0QwomCMSE6NQGeO8mm2BBt5Mwj6LDqVz8reFd+Jh g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5B91iZU6GiMi0Qa9HGqChNkYNtitwrQRk5OeFoA7btNgRad+9lG0RgkjzuHQAV5N/ZdS9HmwQX
 2OQ2ApOLjRRXk7TKtyEIYbS4txD9RfxVUQfhqGWfnnlGdsohvM9o7ykdn4jXzPcQ7KZLIw5Zqs
 49+t9csNLLf4feyEc+KZUzh5h6SuhJBeBZFV5zroF6D0YDASMdxhqwTkTjM+HQpGIyAprvqKlp
 7+gk4M7lesIKa6kmFjqRYWqlxJUGlIXsZbbgXUFTRD+9FFfwzrINek6rvZTsEa7devf+89iJeN
 pGo=
X-SBRS: 2.7
X-MesageID: 16986654
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,363,1583211600"; d="scan'208";a="16986654"
Subject: Re: [PATCH 11/16] x86/spec-ctrl: Adjust DO_OVERWRITE_RSB to be shadow
 stack compatible
To: Jan Beulich <jbeulich@suse.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-12-andrew.cooper3@citrix.com>
 <3c01d6c3-5a61-018b-13df-6e75256f6d6c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <bdf2d248-aabb-8913-1d79-355623b47dfb@citrix.com>
Date: Thu, 7 May 2020 14:25:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3c01d6c3-5a61-018b-13df-6e75256f6d6c@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
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

On 07/05/2020 14:22, Jan Beulich wrote:
> On 02.05.2020 00:58, Andrew Cooper wrote:
>> @@ -114,6 +114,16 @@
>>      sub $1, %ecx
>>      jnz .L\@_fill_rsb_loop
>>      mov %\tmp, %rsp                 /* Restore old %rsp */
>> +
>> +#ifdef CONFIG_XEN_SHSTK
>> +    mov $1, %ecx
>> +    rdsspd %ecx
>> +    cmp $1, %ecx
>> +    je .L\@_shstk_done
>> +    mov $64, %ecx                   /* 64 * 4 bytes, given incsspd */
>> +    incsspd %ecx                    /* Restore old SSP */
>> +.L\@_shstk_done:
>> +#endif
> The latest here I wonder why you don't use alternatives patching.
> I thought that's what you've introduced the synthetic feature
> flag for.

We're already in the middle of an alternative and they don't nest.  More
importantly, this path gets used on the BSP, after patching and before
CET gets enabled.

~Andrew

