Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A479628795
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 18:56:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443499.698040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oudgv-0005DL-9o; Mon, 14 Nov 2022 17:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443499.698040; Mon, 14 Nov 2022 17:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oudgv-0005Ap-6s; Mon, 14 Nov 2022 17:56:17 +0000
Received: by outflank-mailman (input) for mailman id 443499;
 Mon, 14 Nov 2022 17:56:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2807=3O=citrix.com=prvs=3102b0b57=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oudgt-0005Aj-85
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 17:56:15 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9effcc69-6445-11ed-8fd2-01056ac49cbb;
 Mon, 14 Nov 2022 18:56:12 +0100 (CET)
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
X-Inumbo-ID: 9effcc69-6445-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668448572;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q1UW1G+GWOusDk1Y3CJSi9N7nxIrZPltlgQZ4I/HidQ=;
  b=U5kQyhqyBXFl+3mcNy15L4zbO0fK7FFuMq2e031LqXDkdd7qV0aiA3xr
   NXvDNBAuI7ncWBG2Zy8Wr1IhNxrWF28piPu3voYnEW8Esp4PMI3u5XOpy
   /XoFY9vHtg647EpuQLKuM3QbnglGJHdcG7BZRVkydKCWyvr9xwio9uF9D
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 85216251
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HrlePq9bLJdxlvLEF+6IDrUDkX6TJUtcMsCJ2f8bNWPcYEJGY0x3m
 zdJXW2BaPvcN2akfo8jbIWw/UNQu8TTn4BgGwZsry88E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnPKkX5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklBt
 vkWAQ4BXiy42f242Y2HQbdXpv88eZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGM0Yn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZUIxB/G/
 D+fl4j/KkAbEvm61mC8y3OxnNPonibXQKdDMpTto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYeVddQF+w1wBqQ0aeS6AGcbkAGRDNcbN0ttOctWCcnk
 FSOmrvBJTFpqqzTdnub+Z+dtzb0Mi8QRVLufgddE1FDuYO65thu0FSfFb6PDZJZkPX6WjT+6
 g6GnBQF2aodlPE33PuA3WvY1mfESofyciY54QDeX2SA5wx/ZZK4a4HA1WU3/cqsP67CEADf4
 SFsd9y2qblXUMrTzHDlrPAlRunB2hqTDNHLbbeD9bEF/i/lxXOsdJs4DNpWdBYwaZZsldMEj
 SbuVeJtCH17ZirCgUxfOdjZ5yEWIU/IS7zYugj8NIYmX3SIXFbvEeEHTRf4M5rRuEYti7ojH
 pyQbNyhC30XYYw+kmTmHLlBjeF3nXhvrY82eXwc5036uYdymVbPEetVWLdwRr1RAFy4TPX9r
 I8EapriJ+R3W+zieCjHmbP/3nhTRUXWxPne9aRqSwJ0ClM2QTh5UqOPmetJlk4Mt/09q9okN
 0qVAidwoGcTT1WbQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:KjZkFKHsmv2EUy4apLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-IronPort-AV: E=Sophos;i="5.96,164,1665460800"; 
   d="scan'208";a="85216251"
Date: Mon, 14 Nov 2022 17:56:06 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jim Fehlig <jfehlig@suse.com>
CC: Jan Beulich <jbeulich@suse.com>, Henry Wang <Henry.Wang@arm.com>, Roger
 Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: vnuma_nodes missing pnode 0
Message-ID: <Y3KBNpszKjG76PAA@perard.uk.xensource.com>
References: <2046b5fb-2533-02fe-69e8-f46174cf825d@suse.com>
 <AS8PR08MB799119CD58863C6D1D309E9092059@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <AS8PR08MB799186D9559BB2A066D3349092059@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <d3697867-7df2-0a1e-2485-18957b3b94a2@suse.com>
 <fb2f034c-9e65-ea64-6e54-71301497b37a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fb2f034c-9e65-ea64-6e54-71301497b37a@suse.com>

On Mon, Nov 14, 2022 at 08:53:17AM -0700, Jim Fehlig wrote:
> On 11/14/22 01:18, Jan Beulich wrote:
> > On 14.11.2022 07:43, Henry Wang wrote:
> > > Sorry, missed Anthony (The toolstack maintainer). Also added him
> > > to this thread.
> > 
> > Indeed there's nothing x86-ish in here, it's all about data representation.
> > It merely happens to be (for now) x86-specific data which is being dealt
> > with.
> > 
> > Internally I indicated to Jim that the way the code presently is generated
> > it looks to me as if 0 was simply taken as the default for "pnode". What I
> > don't know at all is whether the concept of any kind of default is actually
> > valid in json representation of guest configs.
> 
> 0 is definitely ignored in the generated libxl_vnode_info_gen_json()
> function, which essentially has
> 
> if (p->pnode)
>   format-json
> 
> I took a quick peek at the generator, but being totally unfamiliar could not
> spot a fix. I'm also not sure how such a fix could be detected for testing
> purposes by libxl users like libvirt. I.e. how to detect a libxl that emits
> `"pnode:" 0` in the json representation of libxl_domain_config object and
> one that does not.

Well, the missing "pnode: 0' in json isn't exactly a bug, it's been done
on purpose, see https://xenbits.xen.org/gitweb/?p=xen.git;h=731233d64f6a7602c1ca297f7b67ec254

When the JSON is been reloaded into it's original struct,
libxl_vnode_info, pnode will have the expected value, that is 0, because
libxl_vnode_info_init() would have reset this field to 0.

I don't think it's possible to change the generator to just have it
generate '"pnode": 0', as if we make a change, it would have to be for
all unsigned it, I think.

Is it actually wanted to have all those in json, or is it just a case of
looking like there's missing part?

Also, I don't know if any part of libxl rely of this behavior, that is
where default values are omitted from json output.

Thanks,

-- 
Anthony PERARD

