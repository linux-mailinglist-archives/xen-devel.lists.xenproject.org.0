Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 112CA4D31A7
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 16:20:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287942.488282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRy6x-0007za-NP; Wed, 09 Mar 2022 15:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287942.488282; Wed, 09 Mar 2022 15:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRy6x-0007wg-Jf; Wed, 09 Mar 2022 15:20:23 +0000
Received: by outflank-mailman (input) for mailman id 287942;
 Wed, 09 Mar 2022 15:20:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d6dl=TU=citrix.com=prvs=060aafcb7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nRy6w-0006jj-8N
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 15:20:22 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e40eb4b-9fbc-11ec-8539-5f4723681683;
 Wed, 09 Mar 2022 16:20:21 +0100 (CET)
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
X-Inumbo-ID: 6e40eb4b-9fbc-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646839220;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZeIcQHUJJRtnxQDTvlTRsnnmCopd2Uwau0mRxANamAY=;
  b=eF9GBze7Hi/9YrVQdJ2qsFZV0vSkzEDRJ9ACtnMnLce57VMKDAxaryym
   6JVKvWxxKpJ6S+88BB2/cKqTPBUCaUw2fjxkZ+xHaAdmo95gqpQaFTNLS
   L1ujVpKpvDzO5ATvfwW7KbL92yMNkCiC4KN+RJ22bkpkbnmrbaclokKn3
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 68181396
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:AIVfbKw9bJYtBuxwGYp6t+cgxirEfRIJ4+MujC+fZmUNrF6WrkUCx
 mEXDTvSP/rZMWb2LdokbYnk9h5SuZHUz4NlTFBrpCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz2YnhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl7NuOey0GY4jwu+1ESh9SH39/J7N99+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AN
 5NJMGE+MnwsZTVBJgZOI8MYjtvrl3n+dztF93S5/K8Otj27IAtZj+G2bYu9lsaxbed/k1ucp
 2nG13/kGRxcP9uaoRKH/WirnfTnhj7gVcQZE7jQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAa60iDXtT7GRqirxa5UgU0AoQKVbdgsUfUl/SSs13x6nU4oiBpMZsYhuUZGBkW9
 VbQhtXjCWJuqqOuRifInluLlg+aNS8QJG4EQCYLSwoZ/tXuyL0OYgLzosVLS/Ds0ICscd3k6
 3XT9XVl2e1P5SIe//jjpTj6bySQSo8lp+LfziHeRSqb4wxwf+ZJjKT4uAGAvZ6swGt0J2RtX
 UToeeDDtIji7rnXzURhpdnh+pnzuZ5p1xWG3TZS82EJrWjFxpJaVdk4DMtCDEloKN0YXjTif
 VXevwhcjLcKYif0MvErOdLtV5h0pUQFKTgDfqqEBjapSsItHDJrAQk0PRLAt4wTuBNEfV4D1
 WezLp/3UCdy5VVPxzuqXeYNuYLHNQhlrV4/savTlkz9uZLHPSb9Ye5cbDOmM7BohIvZ8V692
 4sOaKO3J+B3DbSWjt//qtVIczjn7BETWPjLliCgXrXac1Q8Rz15VaO5LHFIU9UNopm5X9zgp
 hmVMnK0AnKh7ZEbAW1mskxeVY4=
IronPort-HdrOrdr: A9a23:pwbWy62/uPRjfrFTxMmSZQqjBI4kLtp133Aq2lEZdPUzSL39qy
 nOpoV/6faaskdzZJhNo7G90cq7L080l6QFhrX5VI3KNGOKhILBFvAF0WKI+UyDJ8SRzI5gPI
 5bAtFD4IKaNzNHZLzBjzVQuexQuOVvi5rFudvj
X-IronPort-AV: E=Sophos;i="5.90,167,1643691600"; 
   d="scan'208";a="68181396"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH] x86/hvm: Annotate hvm_physdev_op() with cf_check
Date: Wed, 9 Mar 2022 15:20:09 +0000
Message-ID: <20220309152009.10449-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This was missed previously, and would yield a fatal #CP for any HVM domain
which issues a physdevop hypercall.

Reported-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Juergen Gross <jgross@suse.com>
---
 xen/arch/x86/hvm/hypercall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 030243810e48..62b5349e7d6e 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -78,7 +78,7 @@ static long cf_check hvm_grant_table_op(
 }
 #endif
 
-static long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+static long cf_check hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     const struct vcpu *curr = current;
     const struct domain *currd = curr->domain;
-- 
2.11.0


