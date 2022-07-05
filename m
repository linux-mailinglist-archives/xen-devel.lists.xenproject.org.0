Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F12D5567270
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 17:23:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361421.590933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8kNu-000211-QJ; Tue, 05 Jul 2022 15:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361421.590933; Tue, 05 Jul 2022 15:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8kNu-0001z4-NJ; Tue, 05 Jul 2022 15:22:42 +0000
Received: by outflank-mailman (input) for mailman id 361421;
 Tue, 05 Jul 2022 15:22:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o8kNs-0001yy-HG
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 15:22:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8kNp-0007Nf-Li; Tue, 05 Jul 2022 15:22:37 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226] helo=[10.7.237.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8kNp-0008Uj-FN; Tue, 05 Jul 2022 15:22:37 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=CT0jRXhP/V+o9hJqgm/YKU9Ye/Vq6p8b65JoOMwOeTc=; b=yTgU7dbf8iFL4Xzjmd+A3v8VIK
	/DslWuwqpnbk/d6hLLSPmjRDwvD0wkIo15M0tNaeKrx740j9Xwu3aFvEnE0Le7p11+I0hto6rVEpw
	9KG9uET4B5vToMO93Pdw5u1tmybAWPo86Y617r7BP9v0sCjI3oz3RMJGt7DQdNX3CAq4=;
Message-ID: <473505a8-7df8-49a7-c33a-02b383efc22f@xen.org>
Date: Tue, 5 Jul 2022 16:22:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 3/8] xen/evtchn: modify evtchn_bind_interdomain to
 allocate specified port
To: Jan Beulich <jbeulich@suse.com>, Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1655903088.git.rahul.singh@arm.com>
 <08fab20e71d280396d7b65397339ad9d9ab96d5c.1655903088.git.rahul.singh@arm.com>
 <9822e10e-ea7e-a39e-1270-14f0e2741325@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9822e10e-ea7e-a39e-1270-14f0e2741325@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 05/07/2022 16:11, Jan Beulich wrote:
> On 22.06.2022 16:38, Rahul Singh wrote:
>> @@ -387,8 +392,19 @@ int evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind)
>>           spin_lock(&ld->event_lock);
>>       }
>>   
>> -    if ( (lport = get_free_port(ld)) < 0 )
>> -        ERROR_EXIT(lport);
>> +    if ( lport != 0 )
>> +    {
>> +        if ( (rc = evtchn_allocate_port(ld, lport)) != 0 )
>> +            ERROR_EXIT_DOM(rc, ld);
>> +    }
>> +    else
>> +    {
>> +        int alloc_port = get_free_port(ld);
>> +
>> +        if ( alloc_port < 0 )
>> +            ERROR_EXIT_DOM(alloc_port, ld);
>> +        lport = alloc_port;
>> +    }
> 
> This is then the 3rd instance of this pattern. I think the logic
> wants moving into get_free_port() (perhaps with a name change).

I think the code below would be suitable. I can send it or Rahul can 
re-use the commit [1]:

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 
e6fb024218e949529c587b7c4755295786d6e7a7..757088580c2b2a3e55774f50b8ad7b3ec9243788 
100644 (file)
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -292,6 +292,18 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
      xsm_evtchn_close_post(chn);
  }

+static int evtchn_get_port(struct domain *d, uint32_t port)
+{
+    int rc;
+
+    if ( port != 0 )
+        rc = evtchn_allocate_port(d, port);
+    else
+        rc = get_free_port(d);
+
+    return rc != 0 ? rc : port;
+}
+
  static long evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
  {
      struct evtchn *chn;
@@ -451,19 +463,10 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, 
evtchn_port_t port)
      if ( read_atomic(&v->virq_to_evtchn[virq]) )
          ERROR_EXIT(-EEXIST);

-    if ( port != 0 )
-    {
-        if ( (rc = evtchn_allocate_port(d, port)) != 0 )
-            ERROR_EXIT(rc);
-    }
-    else
-    {
-        int alloc_port = get_free_port(d);
-
-        if ( alloc_port < 0 )
-            ERROR_EXIT(alloc_port);
-        port = alloc_port;
-    }
+    port = rc = evtchn_get_port(d, port);
+    if ( rc < 0 )
+        ERROR_EXIT(rc);
+    rc = 0;

      chn = evtchn_from_port(d, port);

[1] 
https://xenbits.xen.org/gitweb/?p=people/julieng/xen-unstable.git;a=commit;h=3860ed9915d6fee97a1088110ffd0a6f29f04d9a

> 
> And of course like in the earlier patch the issue with sparse port
> numbers needs to be resolved.
> 
> Jan

-- 
Julien Grall

