Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE9BB3BF43
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 17:33:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101592.1454596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us164-0001XB-1u; Fri, 29 Aug 2025 15:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101592.1454596; Fri, 29 Aug 2025 15:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us163-0001U6-UY; Fri, 29 Aug 2025 15:32:59 +0000
Received: by outflank-mailman (input) for mailman id 1101592;
 Fri, 29 Aug 2025 15:32:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1us162-0001U0-6G
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 15:32:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1us15z-00CfSB-2m;
 Fri, 29 Aug 2025 15:32:56 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1us15z-007jWh-2Z;
 Fri, 29 Aug 2025 15:32:55 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=SlcTOnJrVFknpB8LLcMBmj1NbMjmB8Z1Tib0iBZ4Xhk=; b=kuTMeYjmAiPNe0JnhsdY/Ro223
	GRVU39br/A5Iodrr+vWKoFlZTe1WrjVHbcoDGUirjUj9PQnMnQiieSjmm38FHf/EBkC+2yUkhlgCP
	h+ZOcUZ/GFiMr7fVamHifAC64/tIm8QGDWuUx0xsV6wsBr4wIVQf33F6Dih0Kkt7hEG8=;
Date: Fri, 29 Aug 2025 17:32:54 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH 07/11] libxl: libxl__object_to_json() to json-c
Message-ID: <aLHIJtn2Eyhx537E@l14>
References: <20250808145602.41716-1-anthony@xenproject.org>
 <20250808145602.41716-8-anthony@xenproject.org>
 <05c49cee-d783-40e3-a4ce-da724c308a21@amd.com>
 <eae86371-51f6-4df3-8ca3-723303864126@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eae86371-51f6-4df3-8ca3-723303864126@citrix.com>

On Wed, Aug 27, 2025 at 06:59:14PM +0100, Andrew Cooper wrote:
> On 27/08/2025 6:51 pm, Jason Andryuk wrote:
> > On 2025-08-08 10:55, Anthony PERARD wrote:
> >> From: Anthony PERARD <anthony.perard@vates.tech>
> >>
> >> - libxl changes:
> >>
> >> While doing so, we rename all "*_gen_json" function to "*_gen_jso" as
> >> they have different prototype. All the function pointer are been cast
> >> to (libxl__gen_json_callback) by "gentypes.py" when generating
> >> "*_to_json()" functions.
> >>
> >> We also introduce a few more "*_gen_jso" functions for "int" and
> >> "bool" because we can't use json_object_*() functions from json-c
> >> directly like it's done with yajl.
> >>
> >> To make the generation of _libxl_types*json.[ch] with both YAJL and
> >> json-c we add "--libjsonc" to gentypes.py so it can generate
> >> functions/types for both.
> >>
> >> Also introducing "jsonc_json_gen_fn" in the IDL, to be able to point
> >> to a different function when using json-c.
> >>
> >> Also, don't export any of the new *_gen_jso() function, at the cost of
> >> having "_hidden" macro in semi-public headers.
> >>
> >> - xl changes:
> >>
> >> Also, rework the implementation of printf_info() in `xl` to avoid
> >> using libxl_domain_config_gen_json() which isn't available without
> >> YAJL. The implementation using "json_object" call
> >> libxl_domain_config_to_json() which generate a plain string of JSON,
> >> which we parse to add it to our own json; this avoid a dependency on
> >> the json library used by libxl.
> >>
> >> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> >
> >> @@ -358,6 +535,36 @@ int libxl__mac_parse_json(libxl__gc *gc, const
> >> libxl__json_object *o,
> >>       return libxl__parse_mac(libxl__json_object_get_string(o), *p);
> >>   }
> >>   +#ifdef HAVE_LIBJSONC
> >> +int libxl_hwcap_gen_jso(json_object **jso_r, libxl_hwcap *p)
> >> +{
> >> +    json_object *jso;
> >> +    int i;
> >> +    int rc = ERROR_FAIL;
> >> +
> >> +    jso = json_object_new_array();
> >> +    if (!jso) goto out;
> >> +
> >> +    for(i=0; i<4; i++) {
> >
> > typedef uint32_t libxl_hwcap[8];
> >
> > I see this is the same as the yajl implementation, but should this be 8?

Yeah, looks like it should be ARRAY_SIZE(p). But that would want fixing
in a different patch. And since no one complained about missing bits in
this json conversion, I guess it's not used.

We would need to also fix libxl__hwcap_parse_json(), to parse up to 8
items, and be able to deal with missing 4 of them.

> >
> > The remainder looks good:
> >
> > Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> A tangent, but physinfo.hw_cap (which libxl_hwcap wraps) is as good as
> stack rubble.  It's not exactly random data, but it is a view of an
> internal Xen structure which has been reformatted multiple times before
> we even realised it was exported, then continued being reformatting it
> because it's a gross laying violation that noone could possibly be using
> anyway.

It's display in `xl info`, surely it's useful for someone :-), a long
long time ago since it seems to be inherited from `xm info`.

> It needs purging from libxl and the sysctl interface, and if that makes
> JSON easier, then lets get it done.

It would be more work, not less. Removing things from libxl's api is
annoying. But I guess we can look at removing that later.

Cheers,


-- 
Anthony PERARD

