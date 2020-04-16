Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E324B1ABDC5
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 12:19:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP1bq-0000Eb-1q; Thu, 16 Apr 2020 10:19:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HCIP=6A=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jP1bo-0000EV-I4
 for xen-devel@lists.xen.org; Thu, 16 Apr 2020 10:19:00 +0000
X-Inumbo-ID: adb1460b-7fcb-11ea-8b6f-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id adb1460b-7fcb-11ea-8b6f-12813bfff9fa;
 Thu, 16 Apr 2020 10:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587032337;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=7yXG1cGvOJHfGQ2haqawbrQ/ZIdPpc5FOue7dtqIElM=;
 b=e3XIX0zJG7muBvvuO6oibgyuiF5zkeyz9YwPozCiW2ljOuY4ySueTXvQ
 EBtCWYuxbxe7/nojg+YFZ6sNVdnWa4WOqEim7pMeiKEorhC5R90noayl+
 exHDwxPB9n578HL3Dk8QQ05yT6HNTkIxGS4mpuwg1H1Y7lFzjQwckzYxq g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lGfQjk1y2psOXoykCMThRYcOT1HSzGLD2WsBrfz1q/9RXTK3zk+LXZxgi1L3CSARCEpPEMl2hS
 m4+oZ08ddGBjqwCyXOZxELlUkMoyg51Pzccb4A7bWElAiZFg6qT7A9htMK0LfMgFQcmHXxFSNA
 Jhs2bnlSETPiuzWYWzbNEnZ9GIg5T1lT6aWFxSRpakx8mH/NC4ozzO0AaS6CgOE5K0j9fNOfml
 gX4jk/U8fXbvyJPzdW+J2+NZdy9WvF98hbX6awIBe6p3xDeySNTzWTbGWCIF6gvBfDJek2Q4Oo
 2CA=
X-SBRS: 2.7
X-MesageID: 16009628
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,390,1580792400"; d="scan'208";a="16009628"
Subject: Re: [XTF 2/4] lib: always append CR after LF in vsnprintf()
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20200416094141.65120-1-wipawel@amazon.de>
 <20200416094141.65120-3-wipawel@amazon.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <00549997-7633-a8c2-899a-fbc0b5a45541@citrix.com>
Date: Thu, 16 Apr 2020 11:18:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200416094141.65120-3-wipawel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: semelpaul@gmail.com, julien@xen.org, nmanthey@amazon.de, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16/04/2020 10:41, Pawel Wieczorkiewicz wrote:
> The explicit LFCR sequence guarantees proper line by line formatting
> in the output.
> The '\n' character alone on some terminals is not automatically
> converted to LFCR.
>
> Signed-off-by: Pawel Wieczorkiewicz <wipawel@amazon.de>

Up until now, all console destinations have expected POSIX text semantics.

I presume this is due to the COM1 use presented in the next patch?

Unfortunately, this comes with collateral damage.

# ./xtf-runner hvm64 example
Executing 'xl create -p tests/example/test-hvm64-example.cfg'
Executing 'xl console test-hvm64-example'
Executing 'xl unpause test-hvm64-example'
--- Xen Test Framework ---

Found Xen: 4.14

Environment: HVM 64bit (Long mode 4 levels)

Hello World

Test result: SUCCESS


Combined test results:
test-hvm64-example                       CRASH

which I believe is due to xenconsoled (or the intervening pty) also
expanding \n to \r\n (and "Test result:" no longer being on the final
line from xtf-runner's point of view).  Xen also expands \n to \r\n for
the console, so ends up emitting \r\r\n.

Would it be better to have the com1 console handler do the expansion
locally, to avoid interfering with the semantics of every other
destination?  That said...

> ---
>  common/libc/vsnprintf.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/common/libc/vsnprintf.c b/common/libc/vsnprintf.c
> index a49fd30..3202137 100644
> --- a/common/libc/vsnprintf.c
> +++ b/common/libc/vsnprintf.c
> @@ -285,6 +285,16 @@ int vsnprintf(char *buf, size_t size, const char *fmt, va_list args)
>          if ( *fmt != '%' )
>          {
>              PUT(*fmt);
> +
> +            /*
> +             * The '\n' character alone on some terminals is not automatically
> +             * converted to LFCR.
> +             * The explicit LFCR sequence guarantees proper line by line
> +             * formatting in the output.
> +             */
> +            if ( *fmt == '\n' && str < end )
> +                PUT('\r');

... doesn't this end up putting out \n\r ?

~Andrew

> +
>              continue;
>          }
>  


