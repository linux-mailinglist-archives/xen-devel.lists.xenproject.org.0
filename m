Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB37351296
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 11:44:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104225.199088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRtsH-0004Pi-Fq; Thu, 01 Apr 2021 09:44:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104225.199088; Thu, 01 Apr 2021 09:44:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRtsH-0004PJ-CW; Thu, 01 Apr 2021 09:44:25 +0000
Received: by outflank-mailman (input) for mailman id 104225;
 Thu, 01 Apr 2021 09:44:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRtsF-0004OP-5T
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 09:44:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f93c7e43-ff02-4be7-8954-a579a24e35d6;
 Thu, 01 Apr 2021 09:44:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 97E67AEA6;
 Thu,  1 Apr 2021 09:44:21 +0000 (UTC)
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
X-Inumbo-ID: f93c7e43-ff02-4be7-8954-a579a24e35d6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617270261; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T3WVBUNZlwkjFctAwYGueyDD3YPIMV4/P6HSt5pzgHA=;
	b=NUcZU/GoXoDLtUTyg8NorkhNCs9ED7+rX+WfQPPsdOcH6v1cFfA9JS/pISL1iVJFY84d5g
	sUE62iTiyq9PFQdB1700hkojGl0u5V+cOIAp5qAEfX+tC6Ejt8VnYof4AVjN0OR4o5UYZY
	ysql3Jogls1tBttB2PzqOMxx/2nPu6s=
Subject: [PATCH 1/8] x86/EFI: drop stale section special casing when
 generating base relocs
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
Message-ID: <63ad859f-82f0-62ea-5e55-9c6d3db6816e@suse.com>
Date: Thu, 1 Apr 2021 11:44:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

As of commit a6066af5b142 ("xen/init: Annotate all command line
parameter infrastructure as const") .init.setup has been part of .init.
As of commit 544ad7f5caf5 ("xen/init: Move initcall infrastructure into
.init.data") .initcall* have been part of .init. Hence neither can be
encountered as a stand-alone section in the final binaries anymore.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/efi/mkreloc.c
+++ b/xen/arch/x86/efi/mkreloc.c
@@ -346,9 +346,7 @@ int main(int argc, char *argv[])
          * Don't generate relocations for sections that definitely
          * aren't used by the boot loader code.
          */
-        if ( memcmp(sec1[i].name, ".initcal", sizeof(sec1[i].name)) == 0 ||
-             memcmp(sec1[i].name, ".init.se", sizeof(sec1[i].name)) == 0 ||
-             memcmp(sec1[i].name, ".buildid", sizeof(sec1[i].name)) == 0 ||
+        if ( memcmp(sec1[i].name, ".buildid", sizeof(sec1[i].name)) == 0 ||
              memcmp(sec1[i].name, ".lockpro", sizeof(sec1[i].name)) == 0 )
             continue;
 


