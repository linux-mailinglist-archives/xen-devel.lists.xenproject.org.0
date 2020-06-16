Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F681FB0F8
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 14:41:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlAtW-0003X8-M7; Tue, 16 Jun 2020 12:40:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FkxY=75=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jlAtV-0003X2-4O
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 12:40:49 +0000
X-Inumbo-ID: 9a69e4d4-afce-11ea-8496-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a69e4d4-afce-11ea-8496-bc764e2007e4;
 Tue, 16 Jun 2020 12:40:48 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: IxqVyysXiedplLMYiC8PyE27klOryAY1LIS89ayKLPhYWtlltfUNSovh6RpHfVJYYVF6NLi0Lb
 m6qDOBi2icrd/yi8gKx92DqbARYZfOqkS3bgRhyNDIEs1WYQtk3p1+VPokcuhPiQMlAED1XiSw
 Tqi60+lXr9Rn25VPfZjqzkspk+QUch8bKjTBxkMqnDjye6zOnFEOGfAj6rpi7+/7fgooKuTKjG
 paJhzBCD5zhcWPx6UXAx25i/I7VbpX1tnkkcU6Hra1A7tUeJytVs350V2xF8CJYOdEzjDUn01P
 Vgs=
X-SBRS: 2.7
X-MesageID: 20456615
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,518,1583211600"; d="scan'208";a="20456615"
Subject: Re: [PATCH for-4.14 v2] tools/xen-ucode: fix error code propagation
 of microcode load operation
To: Jan Beulich <jbeulich@suse.com>
References: <1592307754-8844-1-git-send-email-igor.druzhinin@citrix.com>
 <be06eb9d-680c-d356-5f44-ba0a76c5b2a1@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <4d0bacbf-506c-e3c3-5448-b5ab8f6dd0ba@citrix.com>
Date: Tue, 16 Jun 2020 13:40:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <be06eb9d-680c-d356-5f44-ba0a76c5b2a1@suse.com>
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
Cc: xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com, wl@xen.org,
 xadimgnik@gmail.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16/06/2020 13:25, Jan Beulich wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> 
> On 16.06.2020 13:42, Igor Druzhinin wrote:
>> @@ -62,8 +62,11 @@ int main(int argc, char *argv[])
>>  
>>      ret = xc_microcode_update(xch, buf, len);
>>      if ( ret )
>> +    {
>>          fprintf(stderr, "Failed to update microcode. (err: %s)\n",
>>                  strerror(errno));
>> +        return errno;
> 
> I think you need to latch errno, as fprintf() may in principle run
> into another error.

Yes, I also noticed that but the whole file has this problem so I didn't
change it here specifically.

If fixing the whole file - I'd rather rewrite error reporting completely:
return 1 on error, 0 on success, etc. From what I've read returning errno
has many incompatibilities and might lead to surprise consequences.

I'll send v3 to clean this all up.

Igor

