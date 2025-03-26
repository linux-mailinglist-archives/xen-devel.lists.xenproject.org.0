Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA90A71AF1
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 16:45:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928029.1330791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txSwL-0003jS-SI; Wed, 26 Mar 2025 15:45:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928029.1330791; Wed, 26 Mar 2025 15:45:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txSwL-0003hQ-P1; Wed, 26 Mar 2025 15:45:13 +0000
Received: by outflank-mailman (input) for mailman id 928029;
 Wed, 26 Mar 2025 15:45:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/1hs=WN=bounce.vates.tech=bounce-md_30504962.67e42105.v1-c92b4bcbb10142aead979be8e26344ee@srs-se1.protection.inumbo.net>)
 id 1txSwK-0003e8-4g
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 15:45:12 +0000
Received: from mail134-16.atl141.mandrillapp.com
 (mail134-16.atl141.mandrillapp.com [198.2.134.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c8f8afe-0a59-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 16:45:10 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-16.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4ZNB1x29L7zB5p7nN
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 15:45:09 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c92b4bcbb10142aead979be8e26344ee; Wed, 26 Mar 2025 15:45:09 +0000
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
X-Inumbo-ID: 4c8f8afe-0a59-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1743003909; x=1743273909;
	bh=3hi8aZCVSf89jZ5GLNkCFvPhATPL3V0uftBKHvxHiac=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Q7G46ggii5rbBKyAUCajYbSwKenCHs/0rJ6L8rtKFCm+ejXb8V+xESkrO43EW6AY8
	 vL6qddd932DZHIBXhdbIMTdys2DEDPmn1Nq73B/EDKVjgSrkPeSbtQgkQ36crjEazS
	 IMb0v5cJnfrWOb2Okv10uE8Gc/wKijGkoj8rzeGPRfMBZcNJq95kqjfE6cc21YfI37
	 VzX03x3/SAQHHJbXRox/WR3GpMpEiJi9urqsdOl68j8FtnDgzIHVl5DnTDy0ar8smJ
	 w3Q02iv+C7hvI4NwnzFMoIHJGQHnVrI/VMH7gJDLBtPRzBoRqbBxzePmkuKJTFceTn
	 NO/8oEI4DIkRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1743003909; x=1743264409; i=anthony.perard@vates.tech;
	bh=3hi8aZCVSf89jZ5GLNkCFvPhATPL3V0uftBKHvxHiac=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Zp+ooy7Q9E+KpIEqZbdjUUSrIu83/7jj2OH+mfuUCKwRdWzT1yMzkLWlhsjhNHO0A
	 0FxqueioPJKOyh9w0m/oSoibMHLVlXFitbz7d1ggnBEoFvSsl/ZYkMNlNgjIfz9hYY
	 3hS9ewNPg9ir5BSUWSABagYlm3qZhZaCUQxxEX93/CLulsXOLySNKUhaC0/4NdlHfW
	 miaMNX8osnFAsXJkxJknycNw9IgrRhdBOZ6oqmLoFuPKua2GxP58wH49KVSnuv1vD6
	 GZaSuGiC//JFP31yo3AOu1Og/rrSoEoLQsdibfVuSjLeRrWIkZw7N+H7hL/5Ex4395
	 o/XLKErQzIBsg==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3=2014/15]=20xen/xenpm:=20Adapt=20cpu=20frequency=20monitor=20in=20xenpm?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1743003908057
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Penny Zheng" <Penny.Zheng@amd.com>, "Jason Andryuk" <jandryuk@gmail.com>, ray.huang@amd.com, "Juergen Gross" <jgross@suse.com>, xen-devel@lists.xenproject.org
Message-Id: <Z-QhA4t3cHkvIt_U@l14>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com> <20250306083949.1503385-15-Penny.Zheng@amd.com> <6f5a81d7-c650-46d2-b667-6b7c3bc54c41@suse.com>
In-Reply-To: <6f5a81d7-c650-46d2-b667-6b7c3bc54c41@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c92b4bcbb10142aead979be8e26344ee?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250326:md
Date: Wed, 26 Mar 2025 15:45:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Mar 25, 2025 at 12:26:09PM +0100, Jan Beulich wrote:
> On 06.03.2025 09:39, Penny Zheng wrote:
> > Make `xenpm get-cpureq-para/set-cpufreq-para` available in CPPC mode.
> > --- a/tools/libs/ctrl/xc_pm.c
> > +++ b/tools/libs/ctrl/xc_pm.c
> > @@ -214,13 +214,12 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
> > @@ -301,7 +302,8 @@ unlock_4:
> >      if ( user_para->gov_num )
> >          xc_hypercall_bounce_post(xch, scaling_available_governors);
> >  unlock_3:
> > -    xc_hypercall_bounce_post(xch, scaling_available_frequencies);
> > +    if ( user_para->freq_num )
> > +        xc_hypercall_bounce_post(xch, scaling_available_frequencies);
> >  unlock_2:
> >      xc_hypercall_bounce_post(xch, affected_cpus);
> >  unlock_1:
> 
> I'm also puzzled by the function's inconsistent return value - Anthony,
> can you explain / spot why things are the way they are?

Looks like 73367cf3b4b4 ("libxc: Fix xc_pm API calls to return negative
error and stash error in errno.") made some changes, and fixed some
return value to be like described in "xenctrl.h", but I guess failed to
also change the "ret = -errno".

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

