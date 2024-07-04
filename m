Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD39D92722A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 10:54:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753635.1161822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPIDC-0007Hx-CS; Thu, 04 Jul 2024 08:53:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753635.1161822; Thu, 04 Jul 2024 08:53:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPIDC-0007Er-9V; Thu, 04 Jul 2024 08:53:06 +0000
Received: by outflank-mailman (input) for mailman id 753635;
 Thu, 04 Jul 2024 08:53:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SxKa=OE=bounce.vates.tech=bounce-md_30504962.668662ee.v1-c2cd77b6ed8f426fa34785880f8b2220@srs-se1.protection.inumbo.net>)
 id 1sPIDA-0007El-Tw
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 08:53:05 +0000
Received: from mail137-26.atl71.mandrillapp.com
 (mail137-26.atl71.mandrillapp.com [198.2.137.26])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d26f1c51-39e2-11ef-bbf9-fd08da9f4363;
 Thu, 04 Jul 2024 10:53:03 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-26.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4WF9Qk0w2dzJKGtpn
 for <xen-devel@lists.xenproject.org>; Thu,  4 Jul 2024 08:53:02 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c2cd77b6ed8f426fa34785880f8b2220; Thu, 04 Jul 2024 08:53:02 +0000
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
X-Inumbo-ID: d26f1c51-39e2-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720083182; x=1720343682;
	bh=jcH3AJhU2VpWtFTY2C3mwtLqSTGbwTq1w99ijPBqKmQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=cSJ9ekErMejLxq2xmhNhl1q2aorBjfXJWZACtBgOIFdLE3hN7BcRf8zM3MxIpxs5h
	 uDKvAr2+ztjFH4TVSMlFfn/LjhUclQZcuzpkERlNbbkqI5H+l5KHYHVwcP7RrixI4e
	 91Tk0eBtGoawXnNxvqBkZAum1UsARw5jKxvAgyZ9x+rkF8NWnDve4wpN1G4ko/66xa
	 KdHiAgpoY6IpzgUWqwOvLKU1O/EK7oGyhkcN3001bTCZCPK2foBR+rtFbIUufaZk8N
	 J5p+pNzAKLIzpKRsc5KJnU6Yy0HDbv5rY++mnEAklbIDt5fCQxnbKQXdb3qyu3YywJ
	 b/9mGppT4B6Fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720083182; x=1720343682; i=anthony.perard@vates.tech;
	bh=jcH3AJhU2VpWtFTY2C3mwtLqSTGbwTq1w99ijPBqKmQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=cQqpWZ4DxGwB9hLKO2gG8rM37G5oRkK0FzIDnGhP/g/EMJ/+uHtNw3pBARGmTvrF8
	 gY9ENZFF/Ij9IVUA4KtSMIwl0XzywP7iItGKKfcocrMGA+pPBNkF83InT1wFj+mrF5
	 +U2wXcegCL8PvncyL4ZO1sKdmJCIwD8F+F5djohG+pJCKmvUJkQQs0aa/Ivhn4SDRF
	 8IlcoewegwvOjcT2g1wAL91GXVD6MZrf7lM0U9nzC6LCXR6z6Srbt8oxem5gbG73af
	 TwjslNgqtRHwTR3QTXzsmpDUQTcYMr5roX7fmZOg/nRf4SdVOEAfMi7mkhTt85plHw
	 u+A/vlUdkcoaA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=202/2]=20build/mkheader:=20Fix=20Syntax/DeprecationWarnings?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720083181042
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Message-Id: <ZoZi7IN+5/foveF5@l14>
References: <20240703225525.1759907-1-andrew.cooper3@citrix.com> <20240703225525.1759907-3-andrew.cooper3@citrix.com>
In-Reply-To: <20240703225525.1759907-3-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c2cd77b6ed8f426fa34785880f8b2220?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240704:md
Date: Thu, 04 Jul 2024 08:53:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Wed, Jul 03, 2024 at 11:55:25PM +0100, Andrew Cooper wrote:
> With Python 3.11, the following is emitted during a build:
> 
>   tools/include/xen-foreign/mkheader.py:162: DeprecationWarning: invalid escape sequence '\s'
>     regex = "#define\s+%s\\b" % define;
>   tools/include/xen-foreign/mkheader.py:177: DeprecationWarning: invalid escape sequence '\*'
>     input = re.compile("/\*(.*?)\*/", re.S).sub("", input)
>   tools/include/xen-foreign/mkheader.py:178: DeprecationWarning: invalid escape sequence '\s'
>     input = re.compile("\n\s*\n", re.S).sub("\n", input);
>   tools/include/xen-foreign/mkheader.py:182: DeprecationWarning: invalid escape sequence '\s'
>     regex = "union\s+%s\s*\{(.*?)\n\};" % union;
>   tools/include/xen-foreign/mkheader.py:192: DeprecationWarning: invalid escape sequence '\s'
>     regex = "(?:#ifdef ([A-Z_]+))?\nstruct\s+%s\s*\{(.*?)\n\};" % struct;
>   tools/include/xen-foreign/mkheader.py:218: DeprecationWarning: invalid escape sequence '\s'
>     output = re.sub("\\b(union\s+%s)\\b" % union, "\\1_%s" % arch, output);
>   tools/include/xen-foreign/mkheader.py:222: DeprecationWarning: invalid escape sequence '\s'
>     output = re.sub("\\b(struct\s+%s)\\b" % struct, "\\1_%s" % arch, output);
> 
> Python regexes should use raw strings.  Convert all regexes, and drop escaped
> backslashes.  Note that regular escape sequences are interpreted normally when
> parsing a regex, so \n even in a raw-string regex is a newline.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

