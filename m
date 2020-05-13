Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6251D183E
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 17:00:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYsrv-0005eQ-4D; Wed, 13 May 2020 15:00:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cxQB=63=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jYsru-0005eL-4q
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 15:00:22 +0000
X-Inumbo-ID: 77127b36-952a-11ea-ae69-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77127b36-952a-11ea-ae69-bc764e2007e4;
 Wed, 13 May 2020 15:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589382021;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=SLf79gMT3AsWVAodTqnqXd4+ahLWfTEnk6lVRWxtUUM=;
 b=HgX7rcAKlfRa0bssAzuYN62BxBgNkz+iVOJX/g2IgEr6/6j0aGQfoL6t
 KSH1AyCHXuEgte19NVpK/pgD9q2OOR1oPqozBMbZuhLmoknrIxkUw3ttV
 YFragZDZtUMEKJXgYyhZsxzWeLZYBmQsEWYYAGC0iKWoYxzvVe19WtIIS o=;
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: 5jaecxsnO2wF4TU0kso1MbXkmYFtrybExaye8QKXPT64LnPOyqXJJ4iv2mQErrNdxwei8WCla2
 GtJYD9ADWUnzQOiJpOGokThm3v1H3sQxNFu4u1L6S3YBPDjVHltML7cZKfAITCGVVCdlRucc2G
 MCWZo7Rsuljx97th4pbmG/AXUioBcIpYT02O6qd4z1LB9BzbxtXg/b1XXFy9g5akbmekWH4fqi
 5/FqVHgx3/6q/kF+gexF1otiUVFhiRO/xqttiaikNpou8bvEaKTdNCJqcyb0s+FS6kwXEro+GM
 EhA=
X-SBRS: 2.7
X-MesageID: 17421822
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,388,1583211600"; d="scan'208";a="17421822"
Subject: Re: [PATCH] x86/build32: Discard all orphaned sections
To: Jan Beulich <jbeulich@suse.com>
References: <20200512191108.6461-1-andrew.cooper3@citrix.com>
 <a1d1135a-8f9c-81c3-5fc8-bbc3787ebd0f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e11b2b5b-5504-f2a3-f1d8-986bc97a4b78@citrix.com>
Date: Wed, 13 May 2020 16:00:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a1d1135a-8f9c-81c3-5fc8-bbc3787ebd0f@suse.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jandryuk@gmail.com>, Stefan Bader <stefan.bader@canonical.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 13/05/2020 10:13, Jan Beulich wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>
> On 12.05.2020 21:11, Andrew Cooper wrote:
>> @@ -47,6 +47,14 @@ SECTIONS
>>           *
>>           * Please check build32.mk for more details.
>>           */
>> -        /* *(.got.plt) */
>> +        *(.got.plt)
>> +  }
>> +
>> +  /DISCARD/ : {
>> +        /*
>> +         * Discard everything else, to prevent linkers from putting
>> +         * orphaned sections ahead of .text, which needs to be first.
>> +         */
>> +        *(*)
>>    }
>>  }
> To be honest I'm not sure if this isn't going too far. Much
> depends on what would happen if a new real section appeared
> that needs retaining.

Anything which is important enough will result in a linker error.

> Granted the linker may then once again
> put it at the beginning of the image, and we'll be screwed
> again, just like we'll be screwed if a section gets discarded
> by mistake.

This way is more likely to result in a build failure than an inability
to boot the resulting build of Xen.

> But it would be really nice if we had a way to
> flag the need to play with the linker script. Hence perhaps
> on new enough tool chains we indeed may want to make use of
> --orphan-handling= ? And then discard just .note and .note.*
> here?

The only valid option would be =error, but experimenting with that yields

ld: error: unplaced orphan section `.comment' from `cmdline.o'
ld: error: unplaced orphan section `.note.GNU-stack' from `cmdline.o'
ld: error: unplaced orphan section `.note.gnu.property' from `cmdline.o'
ld: error: unplaced orphan section `.rel.got' from `cmdline.o'
ld: error: unplaced orphan section `.got' from `cmdline.o'
ld: error: unplaced orphan section `.got.plt' from `cmdline.o'
ld: error: unplaced orphan section `.iplt' from `cmdline.o'
ld: error: unplaced orphan section `.rel.iplt' from `cmdline.o'
ld: error: unplaced orphan section `.igot.plt' from `cmdline.o'

which I think is going to get us massively bogged down in toolchain
specifics.  I'm not entirely convinced this would be a good move.

~Andrew

