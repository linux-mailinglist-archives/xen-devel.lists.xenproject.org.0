Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAECD1ADFEA
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 16:29:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPS03-0008LO-VN; Fri, 17 Apr 2020 14:29:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jPS02-0008LG-RE
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 14:29:46 +0000
X-Inumbo-ID: e2bccefe-80b7-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2bccefe-80b7-11ea-9e09-bc764e2007e4;
 Fri, 17 Apr 2020 14:29:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B3842AC69;
 Fri, 17 Apr 2020 14:29:44 +0000 (UTC)
Subject: [PATCH 10/10] x86/shadow: don't open-code
 shadow_blow_tables_per_domain()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
Message-ID: <6ca8bbff-1dcb-f57e-3d16-4cf3fef6555f@suse.com>
Date: Fri, 17 Apr 2020 16:29:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Make shadow_blow_all_tables() call the designated function, and this
occasion make the function itself use domain_vcpu().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1005,7 +1005,8 @@ static void shadow_blow_tables(struct do
 
 void shadow_blow_tables_per_domain(struct domain *d)
 {
-    if ( shadow_mode_enabled(d) && d->vcpu != NULL && d->vcpu[0] != NULL ) {
+    if ( shadow_mode_enabled(d) && domain_vcpu(d, 0) )
+    {
         paging_lock(d);
         shadow_blow_tables(d);
         paging_unlock(d);
@@ -1022,14 +1023,7 @@ static void shadow_blow_all_tables(unsig
     printk("'%c' pressed -> blowing all shadow tables\n", c);
     rcu_read_lock(&domlist_read_lock);
     for_each_domain(d)
-    {
-        if ( shadow_mode_enabled(d) && d->vcpu != NULL && d->vcpu[0] != NULL )
-        {
-            paging_lock(d);
-            shadow_blow_tables(d);
-            paging_unlock(d);
-        }
-    }
+        shadow_blow_tables_per_domain(d);
     rcu_read_unlock(&domlist_read_lock);
 }
 


