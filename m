Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E070647AEB
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 01:45:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457519.715452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3RVy-0007nD-RU; Fri, 09 Dec 2022 00:45:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457519.715452; Fri, 09 Dec 2022 00:45:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3RVy-0007lP-OX; Fri, 09 Dec 2022 00:45:22 +0000
Received: by outflank-mailman (input) for mailman id 457519;
 Fri, 09 Dec 2022 00:45:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AAZn=4H=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p3RVw-0007lE-RO
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 00:45:20 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1501768-775a-11ed-8fd2-01056ac49cbb;
 Fri, 09 Dec 2022 01:45:19 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 244CBB825BC;
 Fri,  9 Dec 2022 00:45:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923EDC433D2;
 Fri,  9 Dec 2022 00:45:16 +0000 (UTC)
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
X-Inumbo-ID: c1501768-775a-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670546717;
	bh=q+GeIset5aT1DhBkSlhTiYZWDxqz6Aije4SiRiGG0h8=;
	h=Date:From:To:cc:Subject:From;
	b=VEB9qBFOwHikdl1Wdm/vUJRgx4JBdyYJuGfTk4fm4idPJK4WUEypxC0h8LpDxw7t1
	 CMcaw5gIRP0BYLnxVv3nktbPkekLxyzQU6qqtpP75Ur/7Hw6JiWgmwt7Ykcc3YmK6B
	 JKWtARgDOtStWc1JU7RcO+EmDHlVKc0o6U6qEMjd1HKl+v5J+PPgBn6ryHdllu5LAK
	 tNfyf2o+k5Ak1bfdflkRINbpEEvjBNNMhUCi/tww/HdCc38ggN/FBO5WU/BOd7FOEm
	 5DAHZUUKhqtQDIRW5pd4I4c0ZrbOByKq75hkYSNx4jClsUY0t+3KEXUYw37viz0XEI
	 rUbr3t0BM4Idw==
Date: Thu, 8 Dec 2022 16:45:15 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: jbeulich@suse.com, roberto.bagnara@bugseng.com
cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org, 
    andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org, 
    roger.pau@citrix.com, burzalodowa@gmail.com, michal.orzel@amd.com
Subject: MISRA C Rule 20.7 disambiguation
Message-ID: <alpine.DEB.2.22.394.2212081619310.3075842@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This patch is to start a discussion in regard to rule 20.7 and its
interpretation. During the last MISRA C call we discussed that "our"
interpretation of the rule means that the following two cases don't need
extra parenthesis:

#define M(a, b) func(a, b)
#define M(a, b) (a) = b


Moreover, MISRA C states that parenthesis should be added when the
expansion of a MACRO parameters would result in an *expression*.

Expression is the important word. Looking at this *compliant* example
from the manual:

#define GET_MEMBER( S, M ) ( S ).M

It is compliant because S results in an expression so it needs
parenthesis, while M does not, so it doesn't need parenthesis.

My understanding is the following:
- is it possible to pass an expression as a parameter of the MACRO?
    - if yes -> need parenthesis
    - if no  -> doesn't need parenthesis


As an example, cppcheck reports the following (from xmalloc.h) as
violation:

#define xmalloc_array(_type, _num) \
    ((_type *)_xmalloc_array(sizeof(_type), __alignof__(_type), _num))

I think this is a false positive. We have already enstablished that the
"," operator doesn't require parenthesis, so "_num" is not the problem.
And there is no way that adding parenthesis to "type" would allow an
expression to be passed as the type argument.


Let's take another example:

#define xzalloc_flex_struct(type, field, nr) \
    ((type *)_xzalloc(offsetof(type, field[nr]), __alignof__(type)))

"type" is the same as last time. There are 2 other interesting macro
parameters here: nr and field.

nr could result in an expression, but I don't think it needs
parenthesis because it is between []? However, we know we have a clear
exception for the "," operator. We don't have a clear exception for the
[] operator. Do we need (nr)?

field could result in an expression, so I think it needs parenthesis.

Just to be clear, I'll list all the possible options below.

a) no changes needed, xzalloc_flex_struct is good as is
b) only "field" needs parenthesis
c) only "nr" needs parenthesis
d) both "field" and "nr" need parenthesis

Option d) would look like this:

#define xzalloc_flex_struct(type, field, nr) \
    ((type *)_xzalloc(offsetof(type, (field)[(nr)]), __alignof__(type)))

What do you guys think?

Cheers,

Stefano

