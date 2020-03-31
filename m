Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 060BC199849
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 16:19:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJHhY-00057t-HG; Tue, 31 Mar 2020 14:17:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fshn=5Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJHhX-00057o-HN
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 14:17:11 +0000
X-Inumbo-ID: 4f311acf-735a-11ea-ba27-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f311acf-735a-11ea-ba27-12813bfff9fa;
 Tue, 31 Mar 2020 14:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585664230;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=w7fLvf6oL88RZvgi70R3uHnmgWO485kbfCxfIOm6d4E=;
 b=By3u17HudRqeGTJDFmXKjpiupRcuU5ZQ+YBFzXpOmz52UueRYC/CeT3t
 9yDvUp/j2FypE/UzxGtnzW8aPMyvh1BdSnbZ/3TBje2s7KTTTHMdOIrVI
 ftpN2dA+d6eXQuNMrtg+kxPm6rgIxZlip9WZjtYW3fRlAMk3F6Xr4Iqyh w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lalm0/MJLGBZiAJrOTil5j+XxAvI2I7XNZ025yAb+b3mutWTm4MPUpWDNnl4OjaCkaQDpibHYT
 +fkkDVoj2ZVXfte5tTqovYL/stVqh2YPFPUZh9VHeDBwP/Mwx5tM1qVBAq9f5AQ1873toST/3N
 0VL8d933Cm6+ic/mCstR7LwthBqTroTAWdkL5yUjzye6twLu4jVkHHL3GOKGHczwbCcziEy9uF
 Khs4zgy5FiqWE56uMhIWpDsS4Kz0kEXdSac8MTNO/yR663YXmYeU6r4HQ3YUBHyxSdXz+4XfOV
 EKo=
X-SBRS: 2.7
X-MesageID: 15259757
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,328,1580792400"; d="scan'208";a="15259757"
Subject: Re: [PATCH v2 3/7] x86/ucode/intel: Remove gratuitous memory
 allocations from cpu_request_microcode()
To: Jan Beulich <jbeulich@suse.com>
References: <20200327122901.11569-1-andrew.cooper3@citrix.com>
 <20200327122901.11569-4-andrew.cooper3@citrix.com>
 <c366336a-281e-db6f-1930-f7239d44bf4f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8ac19279-0396-d355-e429-286094b7d7be@citrix.com>
Date: Tue, 31 Mar 2020 15:17:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <c366336a-281e-db6f-1930-f7239d44bf4f@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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

On 31/03/2020 15:09, Jan Beulich wrote:
> On 27.03.2020 13:28, Andrew Cooper wrote:
>> cpu_request_microcode() needs to scan its container and duplicate one blob,
>> but the get_next_ucode_from_buffer() helper duplicates every blob in turn.
>> Furthermore, the length checking is only safe from overflow in 64bit builds.
>>
>> Delete get_next_ucode_from_buffer() and alter the purpose of the saved
>> variable to simply point somewhere in buf until we're ready to return.
>>
>> This is only a modest reduction in absolute code size (-144), but avoids
>> making memory allocations for every blob in the container.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
>> v2:
>>  * Rebase over struct microcode_patch re-work
>>  * Reinstate printk() for bad data
> Ooi, did the number mentioned above indeed no change with this?
> (I don't mean you to adjust it, as it's precise value is not
> really meaningful anyway without also knowing compiler version
> etc.)

I actually stripped the number after re-reading this on xen-devel.  I
didn't go back to check, but it almost certainly isn't the same.

~Andrew

