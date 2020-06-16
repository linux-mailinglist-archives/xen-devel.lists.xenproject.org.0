Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DB01FB09F
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 14:26:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlAef-0001p3-3X; Tue, 16 Jun 2020 12:25:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LuhO=75=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jlAed-0001oy-O9
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 12:25:27 +0000
X-Inumbo-ID: 7548c19a-afcc-11ea-8496-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7548c19a-afcc-11ea-8496-bc764e2007e4;
 Tue, 16 Jun 2020 12:25:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D620BAD41;
 Tue, 16 Jun 2020 12:25:29 +0000 (UTC)
Subject: Re: [PATCH for-4.14 v2] tools/xen-ucode: fix error code propagation
 of microcode load operation
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1592307754-8844-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <be06eb9d-680c-d356-5f44-ba0a76c5b2a1@suse.com>
Date: Tue, 16 Jun 2020 14:25:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1592307754-8844-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8
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

On 16.06.2020 13:42, Igor Druzhinin wrote:
> @@ -62,8 +62,11 @@ int main(int argc, char *argv[])
>  
>      ret = xc_microcode_update(xch, buf, len);
>      if ( ret )
> +    {
>          fprintf(stderr, "Failed to update microcode. (err: %s)\n",
>                  strerror(errno));
> +        return errno;

I think you need to latch errno, as fprintf() may in principle run
into another error.

Jan

