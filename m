Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DBF1F7C5D
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 19:16:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjnHl-0006RU-3c; Fri, 12 Jun 2020 17:16:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CBv9=7Z=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jjnHj-0006RO-SY
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 17:16:07 +0000
X-Inumbo-ID: 669f4442-acd0-11ea-bca7-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 669f4442-acd0-11ea-bca7-bc764e2007e4;
 Fri, 12 Jun 2020 17:16:06 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: iqxVyR9EOYYFT21DnuJVlUWciVkeM5Z58f1TjKPndd02Sq6Dl6ViiDO0KBpQoiokfaewEbQsxr
 5prBjsSJZ4un1gVmaY5yoKhMcX13xfwW27WUbDpLYjZNQqLrR/hbvJ1N3gH0Lip2VM0yaRurHs
 SZ15ygy7NJKEalSTHOPNZzKMSw1UDHBzDOzNcSHUxRZfmbQ84gramepvz/WN0QkZlbQYRl4QiQ
 9SJUYb8d0ANpNpZkNKtaVD02Ex1FODPgKOO1vdiSkIReJvgbdnlIJDCYlkRuHXGdFbnlYFD/k1
 JyA=
X-SBRS: 2.7
X-MesageID: 20220997
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,504,1583211600"; d="scan'208";a="20220997"
Subject: Re: [XEN PATCH for-4.14] tools/xen-ucode: fix error code propagation
 of microcode load operation
To: Ian Jackson <ian.jackson@citrix.com>
References: <1591980255-18811-1-git-send-email-igor.druzhinin@citrix.com>
 <24291.45845.782250.165305@mariner.uk.xensource.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <2d885485-c00f-9938-33fc-1f20d084b259@citrix.com>
Date: Fri, 12 Jun 2020 18:16:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <24291.45845.782250.165305@mariner.uk.xensource.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <xadimgnik@gmail.com>, "wl@xen.org" <wl@xen.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12/06/2020 17:53, Ian Jackson wrote:
> Igor Druzhinin writes ("[PATCH] tools/xen-ucode: fix error code propagation of microcode load operation"):
>> Otherwise it's impossible to know the reason for a fault or blob rejection
>> inside the automation.
> ...
>>          fprintf(stderr, "Failed to update microcode. (err: %s)\n",
>>                  strerror(errno));
> 
> This part is fine.
> 
>> +        ret = errno;
>>      xc_interface_close(xch);
> ...
>>      }
>>      close(fd);
>>  
>> -    return 0;
>> +    return ret;
> 
> Unfortunately I don't think this is right.  errno might not fit into a
> return value.

errno codes that Xen return are all lower than 127. It fits perfectly fine.

> Returning nonzero on microcode loading error would
> definitely be right, but ...
> 
> ... oh I have just read the rest of this file.
> 
> I think what is missing here is simply `return errno' (and the braces)
> There is no need to call xc_interface_close, or munmap, if we are
> about to exit.

Probably but that is identical to what was suggested.
Cleaning resource is just a nice thing to do although unnecessary.
Can change to just "return errno" if that's what you'd prefer.

> I think fixing the lost error return is 4.14 material, so I have
> added that to the subject line.
> 
> Paul, would you Release-ack a patch that replaced every `return errno'
> with (say) exit(12) ? 

That would again conceal real return code from automation.

Igor

