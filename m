Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FF2A7DA71
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 11:57:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939576.1339620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1jE1-0002M0-HJ; Mon, 07 Apr 2025 09:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939576.1339620; Mon, 07 Apr 2025 09:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1jE1-0002Je-Ec; Mon, 07 Apr 2025 09:57:05 +0000
Received: by outflank-mailman (input) for mailman id 939576;
 Mon, 07 Apr 2025 09:57:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oSN7=WZ=bounce.vates.tech=bounce-md_30504962.67f3a16d.v1-abb03f902c2a4b65aa50fc8992853cb0@srs-se1.protection.inumbo.net>)
 id 1u1jE0-0002JY-K9
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 09:57:04 +0000
Received: from mail186-2.suw21.mandrillapp.com
 (mail186-2.suw21.mandrillapp.com [198.2.186.2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a71c02e5-1396-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 11:57:02 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-2.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4ZWPkj1k3WzS62H7s
 for <xen-devel@lists.xenproject.org>; Mon,  7 Apr 2025 09:57:01 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 abb03f902c2a4b65aa50fc8992853cb0; Mon, 07 Apr 2025 09:57:01 +0000
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
X-Inumbo-ID: a71c02e5-1396-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1744019821; x=1744289821;
	bh=3cb8XmT2NOPq5MmcrYAt/T5aucZmNrYNwls+mNubRPs=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Hx1btvLKHtqhdEFxqTiueXB8IzcZx5L79Q8hkX2x88w+tSTt07uH7RDC35R2AOJu5
	 KLcgZBqhK/9O4HIe/UxPtDJV42n7pUHc5r3/PdGWIbElHuvxmvvpaV64KKWRwk4Um1
	 6+rIwzSrnisBsN0A7C34b8bWHUqUKmgMUvnplxOw4DYy71+prRvtgCV8ecu1jO7yUy
	 x+T7k1c+mIyDgQ6018mynGA1lsfRWJ3WYQLOZDGmLkzNGlaS2aJAk7z/warf9H/MFy
	 raqXMvqHdpbqgysO1AJL297DmBAIXgkXLuU+okiy4xtbiwygLki/UhQW2QUUv99fq1
	 gjdnEooXbuxLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1744019821; x=1744280321; i=anthony.perard@vates.tech;
	bh=3cb8XmT2NOPq5MmcrYAt/T5aucZmNrYNwls+mNubRPs=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=iT0qptwB1hTyiZyOnI0fMpahyq42rrOqTtWyjug/dE5cgd3aYT0jbBdzg6FMYm7Kh
	 D4Y9NIjExS7bK6sXQpFWDKgEbxosR5weoAxck7akqmAPdoi6IFFworzkeGgerZWCht
	 Y+ZGZfzCN/9g46VE6xS2vdUHQBZRh8d4+8H2/bqpwGygXUSPQTppMVFUvinOm6gaM4
	 V4X10bs2H9TPBUlcoxqFW8h16APzbXRUGxMEcwhuKK2ShJkbxZ2nChZLSLURobr7AY
	 17bHwnHIXMLPXiqnpkETVe4jhC7KPjfNdz7Bfr9eD9GeHcyc+DL2on5LUKbAigNUq+
	 6IOLcI835ZKxw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3=203/3]=20xen:=20debug:=20gcov:=20add=20condition=20coverage=20support?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1744019819947
To: "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-Id: <Z_Oha7JXI2vf4uXo@l14>
References: <20250401011744.2267367-1-volodymyr_babchuk@epam.com> <20250401011744.2267367-4-volodymyr_babchuk@epam.com> <7281b7d8-ba7b-4658-82f1-a63d66c1baff@suse.com> <87mscvffo8.fsf@epam.com>
In-Reply-To: <87mscvffo8.fsf@epam.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.abb03f902c2a4b65aa50fc8992853cb0?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250407:md
Date: Mon, 07 Apr 2025 09:57:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Sat, Apr 05, 2025 at 03:30:49AM +0000, Volodymyr Babchuk wrote:
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -133,18 +133,19 @@ $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS-y += -DINIT_SECTIONS
>  
>  non-init-objects = $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(extra-y))
>  
> -ifeq ($(CONFIG_COVERAGE),y)

This removes an "ifeq ()", so you probably need to remove and "endif"
somewhere else, which doesn't appear in this snippet.

>  ifeq ($(CONFIG_CC_IS_CLANG),y)
> -    COV_FLAGS := -fprofile-instr-generate -fcoverage-mapping
> +    cov-flags-$(CONFIG_COVERAGE) := -fprofile-instr-generate -fcoverage-mapping

If you do this assignment like that, it would be better to make sure
$(cov-flags-y) is initialised properly, that is have a:

  cov-flags-y :=

before the first conditional assignment, then have all conditional
assignment be +=.

>  else
> -    COV_FLAGS := -fprofile-arcs -ftest-coverage
> +    cov-flags-$(CONFIG_COVERAGE) := -fprofile-arcs -ftest-coverage
> +    cov-flags-$(CONFIG_CONDITION_COVERAGE) += -fcondition-coverage

What happen if CONFIG_CONDITION_COVERAGE=y but CONFIG_COVERAGE=n ?

>  endif
>  
> -# Reset COV_FLAGS in cases where an objects has another one as prerequisite
> +# Reset cov-flags-y in cases where an objects has another one as prerequisite
>  $(nocov-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y)): \
> -    COV_FLAGS :=
> +    cov-flags-y :=
>  
> -$(non-init-objects): _c_flags += $(COV_FLAGS)
> +$(non-init-objects): _c_flags += $(cov-flags-y)
>  endif

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



