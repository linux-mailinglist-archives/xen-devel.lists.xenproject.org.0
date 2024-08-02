Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 276F3945AFD
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 11:29:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770809.1181398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZob7-0003A8-EY; Fri, 02 Aug 2024 09:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770809.1181398; Fri, 02 Aug 2024 09:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZob7-00038d-Bg; Fri, 02 Aug 2024 09:29:17 +0000
Received: by outflank-mailman (input) for mailman id 770809;
 Fri, 02 Aug 2024 09:29:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pzkb=PB=bounce.vates.tech=bounce-md_30504962.66aca6e7.v1-0eba0c511ac14d4ca8f9341c37603e9f@srs-se1.protection.inumbo.net>)
 id 1sZob5-00038X-Sz
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 09:29:16 +0000
Received: from mail132-30.atl131.mandrillapp.com
 (mail132-30.atl131.mandrillapp.com [198.2.132.30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adf80112-50b1-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 11:29:13 +0200 (CEST)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-30.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4Wb0s400J2zP0Jmsx
 for <xen-devel@lists.xenproject.org>; Fri,  2 Aug 2024 09:29:12 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 0eba0c511ac14d4ca8f9341c37603e9f; Fri, 02 Aug 2024 09:29:11 +0000
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
X-Inumbo-ID: adf80112-50b1-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1722590952; x=1722851452;
	bh=VhRB6aEhuJizpvxU+Ixu7l7UuM3M0W1wAmT8Exi3Sc8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ssvd9eFX+xWj9jU9PLnUgaCc/XmF0fuQnwvU4G5mdfbUy580qnHK16j4MhHQl+F8I
	 qF3ENatuxnfUgii6wBGh7cKEi5zDTI17fJdwIz31GTbleht2JR4An6rBwOq1IdbUna
	 MrsbKxTGFoQRBGCRnyPgLch0KaEQ6lK4uHKB/ujWIk3nBsitJRip/IkcBhtdLTZLqy
	 ZCS/8qy01tvXtG95BD8aKQuJKvgYJW06OV93dTMjDyDJKqmAkwWEEUbD4+XRq60Zz9
	 criiHx2M+pwrmzCUKf2y2jGTOp3QoBgvqefv50ji6DOp78DE9hghV7wPfyt/jSjXav
	 e8TUm0rXwvSuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1722590952; x=1722851452; i=anthony.perard@vates.tech;
	bh=VhRB6aEhuJizpvxU+Ixu7l7UuM3M0W1wAmT8Exi3Sc8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=fkzL+rfQ9/ntJjwu2TR081f45IZLc9/0ObbEhFWj2fGQao/bNtieqtOPLCEY4TI+Q
	 5jr6y3aFEzfG0t+94sgT6fjWvpb4FAEc2DTXqgbm+enbKeCMwQUKn0HIFfQWVV6HHm
	 0CF7PqpkVIhwNiTZ4KExNgMCm7rhFAJLx23P48lUaf/x3aNynLFvo47v0cTlbRqh5o
	 BjlfRszwZFu+vLk47QzC6ziSPxz1G6aWCFILB0qa3mk9w6e9flqGmvGSfkADshXplr
	 kirSdr7VzSCgOBTmbuwCvHshY0Pj3TKfabXwvUNXAQflS4gqwOFhwyB0FsZTeuagAa
	 cQSm65O8r8Gyg==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20mktarball:=20only=20archive=20Xen?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1722590950826
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Message-Id: <Zqym5op9e2BAn5KA@l14>
References: <cf280800-d0d6-4493-933f-f83f418dd91d@suse.com>
In-Reply-To: <cf280800-d0d6-4493-933f-f83f418dd91d@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.0eba0c511ac14d4ca8f9341c37603e9f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240802:md
Date: Fri, 02 Aug 2024 09:29:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Aug 01, 2024 at 05:46:37PM +0200, Jan Beulich wrote:
> This is the simplistic approach; I'm sure this could now be done quite a
> bit more efficiently. I also expect there's no longer a need to run
> ./configure ahead of the invocation of this script, but since I have no
> idea why it was needed earlier on, I'm not removing that here from the
> doc. I further expect that the subtree-force-update-all prereq could
> also be dropped from the two involved Makefile goals. As that
> intermediate goal isn't used for any other purpose, the question there
> would be whether there's any reason to retain it. IOW all cleanup that's
> probably better done separately, by someone actually using all of that
> machinery.

The ./configure step might not be needed anymore since
00691c6c90b2 ("tools: Allow to make *-dir-force-update without ./configure")
and `make src-tarball-release` works without issue, without running
./configure that is.

And yes, `subtree-force-update-all` prereq could be dropped from
"src-tarbal%" targets in this patch. I've just tried, and the produced
tarball is the same without or with the prereq.

As for removing the rule "subtree-force-update-all", I don't think
that's a good idea at all. As long as Xen's build systems is cloning
subtrees we need to keep the rule. Those subtrees aren't going away
anytime soon, especially mini-os for stubdom.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

