Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2F86726AF
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 19:22:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480742.745287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pID45-0000Hx-9W; Wed, 18 Jan 2023 18:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480742.745287; Wed, 18 Jan 2023 18:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pID45-0000Eo-6Q; Wed, 18 Jan 2023 18:21:37 +0000
Received: by outflank-mailman (input) for mailman id 480742;
 Wed, 18 Jan 2023 18:21:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Muv5=5P=citrix.com=prvs=3754a6524=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pID43-0000Eh-Ss
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 18:21:36 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ede39c7d-975c-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 19:21:32 +0100 (CET)
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
X-Inumbo-ID: ede39c7d-975c-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674066092;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fZ9JGhXsLumSPUgpibDpHb8KbkAcIOwYinBrtT/AIbs=;
  b=cxT2EectMNMdeaO58ir6T74NyjSLqQPM7WQObhggQq+LKzFscmue7xqd
   LNUxya+6q5EsgT/LJZ2FqUS8WS4iPPpcoWSKtd9FY53DjC7bXmdejkon7
   vwX1zghWaVSbEI/bg12iMRTHCCDmUOcZTO/n49av8sg3xCru55v1iRz41
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 93193274
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:SW0luKLD6FwphuDSFE+R8ZUlxSXFcZb7ZxGr2PjKsXjdYENS0mAHn
 TBOD2vVMvvbMTD8eYh3aIvjp0MFsMWEx9VmTFdlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5wVuPa0jUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c50KEB0q
 aERdAoRLRSGmLivz7OWZ/lV05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TbHpwExRzH+
 goq+UykPQAbZfa6wgO80UiRvvSMjy/WCLsdQejQGvlC3wTImz175ActfVmmpfi0jGauVtQZL
 FYbkgI1trQ7/kGvStj7XjW7rWSCsxpaXMBfe8Ul7Cmdx6yS5ByWbkAGRDNcbN0ttOctWCcnk
 FSOmrvBFTFp9bGYV3+Z3rOVti+pfzgYK3cYYi0JRhdD5MPsyLzflTqWEIwlSvTsyISoR3epm
 WviQDUCa6s7jucq7fnm9Az9n3Goo4eTVwE0yyjHZzfwhu9mX7JJd7BE+HCCs6kbfdzDFgbR1
 JQXs5PAtb5TVPlhgATIGbxQR+/xup5pJRWG2TZS848dGyNBEpJJVaRZ+3lAKUhgKa7okhe5M
 RaI6Wu9CHK+VUZGjJObgKrrUazGNYC6SbzYugn8N7KimKRZeg6d5z1JbkWNxW3rm0VEufhhZ
 szKIZ7xVS5AVP4PIN+KqwA1iO9D+8zD7TmLGcCTI+qPjNJym0J5uZ9aaQDTP4jVHYuPoRnP8
 sY3Cid540w3bQEKWQGOqdR7BQlTfRAG6WXe95Q/mhirflA3RwnMypb5ndscRmCSt/gOzbmTo
 SztCie1CjPX3BX6FOlDUVg7AJuHYHq1hStT0fAEVbpw50UeXA==
IronPort-HdrOrdr: A9a23:kVTaLqpgM52vF+z5OG9RfMEaV5oyeYIsimQD101hICG9E/bo9P
 xG885x6faZslsssRIb+exoWpPvfZq0z/cc3WB2B9uftWLd11dAQrsJ0WKb+VzdJxE=
X-IronPort-AV: E=Sophos;i="5.97,226,1669093200"; 
   d="scan'208";a="93193274"
Date: Wed, 18 Jan 2023 18:21:25 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "George
 Dunlap" <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH v3 1/1] build: replace get-fields.sh by a python
 script
Message-ID: <Y8g4pSOHvrkqmbTU@perard.uk.xensource.com>
References: <20230116181048.30704-1-anthony.perard@citrix.com>
 <20230116181048.30704-2-anthony.perard@citrix.com>
 <1ab3bc93-326a-172d-4f0f-f6c2ddc84105@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1ab3bc93-326a-172d-4f0f-f6c2ddc84105@citrix.com>

On Tue, Jan 17, 2023 at 05:21:32PM +0000, Andrew Cooper wrote:
> On 16/01/2023 6:10 pm, Anthony PERARD wrote:
> > +def get_typedefs(tokens):
> > +    level = 1
> > +    state = 0
> > +    typedefs = []
> 
> I'm pretty sure typedefs actually wants to be a dict rather than a list
> (will have better "id in typedefs" performance lower down), but that
> wants matching with code changes elsewhere, and probably wants doing
> separately.

I'm not sure that going to make a difference to have "id in ()" instead
of "id in []". I just found out that `typedefs` is always empty...

I don't know what get_typedefs() is supposed to do, or at least if it
works as expected, because it always returns "" or an empty list. (even
the shell version)

So, it would actually be a bit faster to not call get_typedefs(), but I
don't know if that's safe.

> > +    for token in tokens:
> > +        if token == 'typedef':
> > +            if level == 1:
> > +                state = 1
> > +        elif re.match(r'^COMPAT_HANDLE\((.*)\)$', token):
> > +            if not (level != 1 or state != 1):
> > +                state = 2
> > +        elif token in ['[', '{']:
> > +            level += 1
> > +        elif token in [']', '}']:
> > +            level -= 1
> > +        elif token == ';':
> > +            if level == 1:
> > +                state = 0
> > +        elif re.match(r'^[a-zA-Z_]', token):
> > +            if not (level != 1 or state != 2):
> > +                typedefs.append(token)
> > +    return typedefs

-- 
Anthony PERARD

