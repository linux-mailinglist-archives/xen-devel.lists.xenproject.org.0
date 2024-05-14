Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F6A8C5DE8
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 00:53:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721815.1125485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s710M-0003mb-II; Tue, 14 May 2024 22:52:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721815.1125485; Tue, 14 May 2024 22:52:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s710M-0003jP-FY; Tue, 14 May 2024 22:52:18 +0000
Received: by outflank-mailman (input) for mailman id 721815;
 Tue, 14 May 2024 22:52:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o5lq=MR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s710K-0003jJ-UB
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 22:52:16 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a00fa48-1244-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 00:52:14 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A17EBCE1366;
 Tue, 14 May 2024 22:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D780C4AF08;
 Tue, 14 May 2024 22:52:06 +0000 (UTC)
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
X-Inumbo-ID: 9a00fa48-1244-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715727127;
	bh=I0J262r6gG+COYtQKQZ2a39Mr3dDQsi4g5lKC+PZavs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uT8EycxDfwmNJVrcfDH2ap/lcf3Qn0QGLskR/Fz1lhuegGBxuFU+q+6oJe6LmYx6J
	 MD2Q00Ml5Z7K05w8twSk61gE59Kv7TWtTAOpXjkAyivGL4rtzk2jVP5h9eRexkmbH+
	 dXFv2OnT0Gkfr41WhpRMYZjdOuMv5ljO3gS00iFetvtifBeEHZa4MTNrw2PUBuG5Qx
	 9n76r2i6KG5cNap9seVNNPaMh8rqZohkjfG0OXW0r3NEnaulCJkFe8jOnVuWUtgoKU
	 IA7/dPGa1qtl+IrEqdhhxC1xI3Wp0rLsNmiSCcXlqqh6HzBYomPbMRb+5eiXYe0A0Z
	 L7iokscJwpewg==
Date: Tue, 14 May 2024 15:52:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org, nicola.vetrini@bugseng.com, 
    consulting@bugseng.com
Subject: Re: [PATCH] lib/strtoul: fix MISRA R10.2 violation
In-Reply-To: <16990192-aceb-408f-9247-45f3b1f58e0a@suse.com>
Message-ID: <alpine.DEB.2.22.394.2405141540140.2544314@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405131729180.2544314@ubuntu-linux-20-04-desktop> <16990192-aceb-408f-9247-45f3b1f58e0a@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 May 2024, Jan Beulich wrote:
> On 14.05.2024 02:32, Stefano Stabellini wrote:
> > Fix last violation of R10.2 by casting the result of toupper to plain
> > char. Note that we don't want to change toupper itself as it is a legacy
> > interface and it would cause more issues.
> 
> Can you point me at a single example where a new issue would arise? All
> places I've spotted (including tolower() uses) would appear to benefit
> from changing toupper() / tolower() themselves. Further, since they are
> both wrapper macros only anyway, if any concern remained, fiddling with
> the wrapper macros while leaving alone the underlying inline functions
> would allow any such use site to simply be switched to using the inline
> functions directly. As said, from looking at it I don't expect that
> would be necessary, so instead I'd rather hope that eventually we can
> do away with the wrapper macros, renaming the inline functions
> accordingly.

If we change __toupper to return a plain char, then there are a few
other things we need to change for consistency, see below. To be honest
I thought it would cause more problems. I am OK to go with that if you
all agree. (Nicola please have a look in case this introduces more
issues elsewhere.)


diff --git a/xen/include/xen/ctype.h b/xen/include/xen/ctype.h
index 6dec944a37..6a6854e01c 100644
--- a/xen/include/xen/ctype.h
+++ b/xen/include/xen/ctype.h
@@ -15,9 +15,9 @@
 #define _X	0x40	/* hex digit */
 #define _SP	0x80	/* hard space (0x20) */
 
-extern const unsigned char _ctype[];
+extern const char _ctype[];
 
-#define __ismask(x) (_ctype[(int)(unsigned char)(x)])
+#define __ismask(x) (_ctype[(int)(char)(x)])
 
 #define isalnum(c)	((__ismask(c)&(_U|_L|_D)) != 0)
 #define isalpha(c)	((__ismask(c)&(_U|_L)) != 0)
@@ -34,14 +34,14 @@ extern const unsigned char _ctype[];
 #define isascii(c) (((unsigned char)(c))<=0x7f)
 #define toascii(c) (((unsigned char)(c))&0x7f)
 
-static inline unsigned char __tolower(unsigned char c)
+static inline char __tolower(char c)
 {
 	if (isupper(c))
 		c -= 'A'-'a';
 	return c;
 }
 
-static inline unsigned char __toupper(unsigned char c)
+static inline char __toupper(char c)
 {
 	if (islower(c))
 		c -= 'a'-'A';
diff --git a/xen/lib/ctype.c b/xen/lib/ctype.c
index 7b233a335f..27e5b61b1c 100644
--- a/xen/lib/ctype.c
+++ b/xen/lib/ctype.c
@@ -1,7 +1,7 @@
 #include <xen/ctype.h>
 
 /* for ctype.h */
-const unsigned char _ctype[] = {
+const char _ctype[] = {
     _C,_C,_C,_C,_C,_C,_C,_C,                        /* 0-7 */
     _C,_C|_S,_C|_S,_C|_S,_C|_S,_C|_S,_C,_C,         /* 8-15 */
     _C,_C,_C,_C,_C,_C,_C,_C,                        /* 16-23 */

