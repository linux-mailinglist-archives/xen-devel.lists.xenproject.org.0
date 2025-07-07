Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5D1AFB387
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 14:48:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035567.1407893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYlGV-0001WB-9Q; Mon, 07 Jul 2025 12:48:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035567.1407893; Mon, 07 Jul 2025 12:48:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYlGV-0001TP-6V; Mon, 07 Jul 2025 12:48:11 +0000
Received: by outflank-mailman (input) for mailman id 1035567;
 Mon, 07 Jul 2025 12:48:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oIsu=ZU=bounce.vates.tech=bounce-md_30504962.686bc206.v1-42e165d5446846f588f31a10ba9cc654@srs-se1.protection.inumbo.net>)
 id 1uYlGT-0001TJ-Kp
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 12:48:09 +0000
Received: from mail124.us4.mandrillapp.com (mail124.us4.mandrillapp.com
 [205.201.136.124]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1438b42-5b30-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 14:48:07 +0200 (CEST)
Received: from pmta15.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail124.us4.mandrillapp.com (Mailchimp) with ESMTP id 4bbPD62vfVzKsbnMM
 for <xen-devel@lists.xenproject.org>; Mon,  7 Jul 2025 12:48:06 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 42e165d5446846f588f31a10ba9cc654; Mon, 07 Jul 2025 12:48:06 +0000
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
X-Inumbo-ID: a1438b42-5b30-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1751892486; x=1752162486;
	bh=r+xE6hHiR+ZNVr16RGc11K6m0veWXNDo+mzmVy/pwZE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=u/QMyzvq2VaOja3D6dZyS215bJjmxb6wfI6wp5QKybDRKwFcZ3WIGodZCjprCgdtL
	 WNI0o2hc2W0BN/8VTpGlCfK1qDS684n5oYpGm6PPxXsAaCKVbc98g3GbWtmLh1NgW9
	 PlOp4hpGH8bJBt7U3sPBvuzorFNIG2OVT5fUh6Nl5r1XVVxBdw8azCHQ87QXnsS/J1
	 V9kQ1LLKemvAAA71FHKgJgXsU3NJHEbgZvrm7nAoursZMWlRJOppUksxCbfYxZeu10
	 O+lPxTfn75mrE7IApYhmDBMITBfjv8wDvUERFja6kF0a9nJ8UIFtv/SjW2zFo/2wl4
	 1xSutlO9dh60A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1751892486; x=1752152986; i=anthony.perard@vates.tech;
	bh=r+xE6hHiR+ZNVr16RGc11K6m0veWXNDo+mzmVy/pwZE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=dWG/O/pTotWfWrdm0QGonFWkTB8cPioZ0w45XswHvIgG/J9i4OLQd5x84e+YZWc/c
	 HaOhdYGN+F3q9BsDdyMYkY61geZD+lZPf8twL83GfjvwFYaZV3/8Zd9cMWGsKp6ULU
	 tKaY0V7KticXHaZe6TQkzv0kj5GVEKp42OIP2u1PFishX0yetD4RZoEdbfFFsDwYpT
	 vyTg6rn/V0xK7hVSBVIZcH6oiHsulWH76P4CL90K+EIsQ2lpJsAqPxoyNE5HBwIjmZ
	 45LbiprOrIpiBjEuibayhy8Z353kWqfAB9/up8wLHCY31UV49FkpleSKw/1GBwzI0e
	 3Mqbo37+1mnTg==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v6]=20automation/eclair:=20update=20configuration=20of=20D4.10?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1751892482086
To: "Stefano Stabellini" <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, "Andrew Cooper" <andrew.cooper3@citrix.com>, michal.orzel@amd.com, jbeulich@suse.com, julien@xen.org, roger.pau@citrix.com, bertrand.marquis@arm.com, federico.serafini@bugseng.com, "Nicola Vetrini" <nicola.vetrini@bugseng.com>
Message-Id: <aGvCAbCGfQ8Vzcp2@l14>
References: <alpine.DEB.2.22.394.2506231650080.862517@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2506231650080.862517@ubuntu-linux-20-04-desktop>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.42e165d5446846f588f31a10ba9cc654?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250707:md
Date: Mon, 07 Jul 2025 12:48:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Jun 23, 2025 at 06:19:27PM -0700, Stefano Stabellini wrote:
> diff --git a/xen/include/xen/compile.h.in b/xen/include/xen/compile.h.in
> index 3151d1e7d1..9206341ba6 100644
> --- a/xen/include/xen/compile.h.in
> +++ b/xen/include/xen/compile.h.in
> @@ -1,3 +1,6 @@
> +#ifndef XEN_COMPILE_H
> +#define XEN_COMPILE_H
> +
>  #define XEN_COMPILE_DATE	"@@date@@"
>  #define XEN_COMPILE_TIME	"@@time@@"
>  #define XEN_COMPILE_BY		"@@whoami@@"
> diff --git a/xen/tools/process-banner.sed b/xen/tools/process-banner.sed
> index 56c76558bc..4cf3f9a116 100755
> --- a/xen/tools/process-banner.sed
> +++ b/xen/tools/process-banner.sed
> @@ -12,3 +12,8 @@ s_(.*)_"\1\\n"_
>  
>  # Trailing \ on all but the final line.
>  $!s_$_ \\_
> +
> +# Append closing header guard
> +$a\
> +\
> +#endif /* XEN_COMPILE_H */

Is it wise to put the closing header guard in a file call
"process-banner" ? It's not call compile.h-footer.sed.

There's a few way to make this better:
- simple add the header guard from the Makefile, both opening and
  closing.
- Do some more sed with something like:
  sed -rf process-banner.sed < .banner >> .banner.processed.tmp
  sed -e 's/@@date@@/$(XEN_BUILD_DATE)/g' \
      ... \
      -e '/XEN_BANNER/r .banner.processed.tmp'
  # and having the closing header guard in "compile.h.in"
  This will add the outpot of process-banner.sed in the lines after
  "#define XEN_BANNER", and so before the closing header guard.
- rename the sed command file
(- a forth option would be to use filechk make macro, but the check for
 if [ ! -r $@ -o -O $@ ] would be annoying to reproduce.)

Another thing, this could be done in a patch that isn't called
"automation/eclair: update configuration of D4.10".

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



