Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0475D41461A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 12:24:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192449.342892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSzPh-0008B8-UT; Wed, 22 Sep 2021 10:23:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192449.342892; Wed, 22 Sep 2021 10:23:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSzPh-00088k-RU; Wed, 22 Sep 2021 10:23:41 +0000
Received: by outflank-mailman (input) for mailman id 192449;
 Wed, 22 Sep 2021 10:23:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mSzPg-00088e-Ir
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 10:23:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mSzPf-0004hB-5M; Wed, 22 Sep 2021 10:23:39 +0000
Received: from [202.153.84.92] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mSzPe-0001Rc-Pe; Wed, 22 Sep 2021 10:23:39 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Qgcee8m4YPfLmiL81b5V15n8qvz2mYYoGyYhoDxNCW0=; b=1Et153U0rZtO9XAgH9Uynp0LkZ
	Y4mi9QnmxUAjEHClu903z6rRqEiGo4EpAGsREOqNZEkRjVgx66OuZieBVkDFDMoR3+CubEoL1wJyT
	H/01SmqMHoHVDRKCI/CB+65qjhJKZqdp16CDjSDW/ljWXqRUF4762RRSbBV80T2HWo4s=;
Subject: Re: [PATCH v2 5/6] tools/xenstored: partially handle domains without
 a shared ring
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <20210922082123.54374-6-roger.pau@citrix.com>
 <0aed8667-7f31-b0fb-3358-c5fd9a5734a1@xen.org>
 <YUr+K0tg6mspyOyd@MacBook-Air-de-Roger.local>
From: Julien Grall <julien@xen.org>
Message-ID: <69285850-4168-b30c-db47-8c0649bd1ffc@xen.org>
Date: Wed, 22 Sep 2021 15:23:28 +0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YUr+K0tg6mspyOyd@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Roger,

On 22/09/2021 14:58, Roger Pau Monné wrote:
> On Wed, Sep 22, 2021 at 02:07:44PM +0500, Julien Grall wrote:
>> Hi Roger,
>>
>> On 22/09/2021 13:21, Roger Pau Monne wrote:
>>> Failure to map the shared ring and thus establish a xenstore
>>> connection with a domain shouldn't prevent the "@introduceDomain"
>>> watch from firing, likewise with "@releaseDomain".
>>>
>>> In order to handle such events properly xenstored should keep track of
>>> the domains even if the shared communication ring cannot be mapped.
>>> This was partially the case due to the restore mode, which needs to
>>> handle domains that have been destroyed between the save and restore
>>> period. This patch extends on the previous limited support of
>>> temporary adding a domain without a valid interface ring, and modifies
>>> check_domains to keep domains without an interface on the list.
>>>
>>> Handling domains without a valid shared ring is required in order to
>>> support domain without a grant table, since the lack of grant table
>>> will prevent the mapping of the xenstore ring grant reference.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> oxenstored will need a similar treatment once grant mapping is used
>>> there. For the time being it still works correctly because it uses
>>> foreign memory to map the shared ring, and that will work in the
>>> absence of grant tables on the domain.
>>> ---
>>> Changes since v1:
>>>    - New in this version.
>>> ---
>>>    tools/xenstore/xenstored_domain.c | 30 ++++++++++++++++++------------
>>>    1 file changed, 18 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
>>> index 9fb78d5772..150c6f082e 100644
>>> --- a/tools/xenstore/xenstored_domain.c
>>> +++ b/tools/xenstore/xenstored_domain.c
>>> @@ -119,6 +119,11 @@ static int writechn(struct connection *conn,
>>>    	struct xenstore_domain_interface *intf = conn->domain->interface;
>>>    	XENSTORE_RING_IDX cons, prod;
>>> +	if (!intf) {
>>> +		errno = ENODEV;
>>> +		return -1;
>>> +	}
>>> +
>>>    	/* Must read indexes once, and before anything else, and verified. */
>>>    	cons = intf->rsp_cons;
>>>    	prod = intf->rsp_prod;
>>> @@ -149,6 +154,11 @@ static int readchn(struct connection *conn, void *data, unsigned int len)
>>>    	struct xenstore_domain_interface *intf = conn->domain->interface;
>>>    	XENSTORE_RING_IDX cons, prod;
>>> +	if (!intf) {
>>> +		errno = ENODEV;
>>> +		return -1;
>>> +	}
>>> +
>>>    	/* Must read indexes once, and before anything else, and verified. */
>>>    	cons = intf->req_cons;
>>>    	prod = intf->req_prod;
>>> @@ -176,6 +186,9 @@ static bool domain_can_write(struct connection *conn)
>>>    {
>>>    	struct xenstore_domain_interface *intf = conn->domain->interface;
>>> +	if (!intf)
>>> +		return false;
>>> +
>>
>> Rather than adding an extra check, how about taking advantage of is_ignore?
> 
> Right, I just need to change the order in conn_can_read and
> conn_can_write so that the is_ignored check is performed before the
> can_{read,write} handler is called.
> 
>>>    	return ((intf->rsp_prod - intf->rsp_cons) != XENSTORE_RING_SIZE);
>>>    }
>>> @@ -183,7 +196,8 @@ static bool domain_can_read(struct connection *conn)
>>>    {
>>>    	struct xenstore_domain_interface *intf = conn->domain->interface;
>>> -	if (domain_is_unprivileged(conn) && conn->domain->wrl_credit < 0)
>>> +	if ((domain_is_unprivileged(conn) && conn->domain->wrl_credit < 0) ||
>>> +	    !intf)
>>>    		return false;
>>>    	return (intf->req_cons != intf->req_prod);
>>> @@ -268,14 +282,7 @@ void check_domains(void)
>>>    				domain->shutdown = true;
>>>    				notify = 1;
>>>    			}
>>> -			/*
>>> -			 * On Restore, we may have been unable to remap the
>>> -			 * interface and the port. As we don't know whether
>>> -			 * this was because of a dying domain, we need to
>>> -			 * check if the interface and port are still valid.
>>> -			 */
>>> -			if (!dominfo.dying && domain->port &&
>>> -			    domain->interface)
>>> +			if (!dominfo.dying)
>>>    				continue;
>>
>> This is mostly a revert on "tools/xenstore: handle dying domains in live
>> update". However, IIRC, this check was necessary to release the connection
>> if the domain has died in the middle of Live-Update.
> 
> But if the domain has died in the middle of live update
> get_domain_info will return false, and thus the code won't get here.

Hmmm... I think I am mixing up a few things... I went through the 
original discussion (it was on the security ML) to find out why I wrote 
the patch like that. When going through the archives, I noticed that I 
provided a different version of this patch (see [1]) because there was 
some issue with the check here (I wrote that it would lead to zombie 
domain, but don't have the rationale :().

Juergen, I don't seem to find the reason why the patch was not replaced 
as we discussed on the security ML. Do you remember why?

Assuming this was a mistake, could someone take care of sending an 
update? If not, I could do it when I am back in October.

For the archives, the issues would appear when shutting down a domain 
during Live-Update.

[1]

commit 3d1f5b71f8565787c0cf305e5571884d6aec6865
Author: Julien Grall <jgrall@amazon.com>
Date:   Thu Jun 11 16:13:10 2020 +0200

      tools/xenstore: handle dying domains in live update

      A domain could just be dying when live updating Xenstore, so the case
      of not being able to map the ring page or to connect to the event
      channel must be handled gracefully.

      Signed-off-by: Julien Grall <jgrall@amazon.com>

diff --git a/tools/xenstore/xenstored_control.c
b/tools/xenstore/xenstored_control.c
index d1187a4346b4..92dae6be6195 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -533,6 +533,13 @@ void lu_read_state(void)
         lu_close_dump_state(&state);

         talloc_free(ctx);
+
+       /*
+        * We may have missed the VIRQ_DOM_EXC notification and a domain may
+        * have died while we were live-updating. So check all the 
domains are
+        * still alive.
+        */
+       check_domains();
   }

   static const char *lu_activate_binary(const void *ctx)
diff --git a/tools/xenstore/xenstored_domain.c
b/tools/xenstore/xenstored_domain.c
index 4976ae420800..0519e88eb819 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -224,7 +224,7 @@ static bool get_domain_info(unsigned int domid,
xc_dominfo_t *dominfo)
                dominfo->domid == domid;
   }

-static void domain_cleanup(void)
+void check_domains()
   {
         xc_dominfo_t dominfo;
         struct domain *domain;
@@ -248,6 +248,7 @@ static void domain_cleanup(void)
                                 domain->shutdown = true;
                                 notify = 1;
                         }
+
                         if (!dominfo.dying)
                                 continue;
                 }
@@ -274,7 +275,7 @@ void handle_event(void)
                 barf_perror("Failed to read from event fd");

         if (port == virq_port)
-               domain_cleanup();
+               check_domains();

         if (xenevtchn_unmask(xce_handle, port) == -1)
                 barf_perror("Failed to write to event fd");
@@ -359,7 +360,7 @@ static struct domain *find_or_alloc_domain(const
void *ctx, unsigned int domid)
         return domain ? : alloc_domain(ctx, domid);
   }

-static int new_domain(struct domain *domain, int port)
+static int new_domain(struct domain *domain, int port, bool restore)
   {
         int rc;

@@ -375,9 +376,10 @@ static int new_domain(struct domain *domain, int port)

         /* Tell kernel we're interested in this event. */
         rc = xenevtchn_bind_interdomain(xce_handle, domain->domid, port);
-       if (rc == -1)
+       if (rc != -1)
+               domain->port = rc;
+       else if (!restore)
                 return errno;
-       domain->port = rc;

         domain->introduced = true;

@@ -428,7 +430,7 @@ static void domain_conn_reset(struct domain *domain)

   static struct domain *introduce_domain(const void *ctx,
                                        unsigned int domid,
-                                      evtchn_port_t port, bool fire_watch)
+                                      evtchn_port_t port, bool restore)
   {
         struct domain *domain;
         int rc;
@@ -440,11 +442,12 @@ static struct domain *introduce_domain(const void
*ctx,

         if (!domain->introduced) {
                 interface = map_interface(domid);
-               if (!interface)
+               if (!interface && !restore)
                         return NULL;
-               if (new_domain(domain, port)) {
+               if (new_domain(domain, port, restore)) {
                         rc = errno;
-                       unmap_interface(interface);
+                       if (interface)
+                               unmap_interface(interface);
                         errno = rc;
                         return NULL;
                 }
@@ -453,7 +456,7 @@ static struct domain *introduce_domain(const void *ctx,
                 /* Now domain belongs to its connection. */
                 talloc_steal(domain->conn, domain);

-               if (fire_watch)
+               if (!restore)
                         fire_watches(NULL, ctx, "@introduceDomain", NULL,
                                     false, NULL);
         } else {
@@ -490,7 +493,7 @@ int do_introduce(struct connection *conn, struct
buffered_data *in)
         if (port <= 0)
                 return EINVAL;

-       domain = introduce_domain(in, domid, port, true);
+       domain = introduce_domain(in, domid, port, false);
         if (!domain)
                 return errno;

@@ -730,7 +733,7 @@ static int dom0_init(void)
         dom0 = alloc_domain(NULL, xenbus_master_domid());
         if (!dom0)
                 return -1;
-       if (new_domain(dom0, port))
+       if (new_domain(dom0, port, false))
                 return -1;

         dom0->interface = xenbus_map();
@@ -1298,10 +1301,20 @@ void read_state_connection(const void *ctx,
const void *state)
                 conn = domain->conn;
         } else {
                 domain = introduce_domain(ctx, sc->spec.ring.domid,
-                                         sc->spec.ring.evtchn, false);
+                                         sc->spec.ring.evtchn, true);
                 if (!domain)
                         barf("domain allocation error");

+               conn = domain->conn;
+
+               /*
+                * The domain is about to die if we didn't manage to
+                * map the interface or the port. Mark the domain as
+                * ignored so it will be cleaned up when the domain
+                * is dead.
+                */
+               conn->is_ignored = !(domain->port && domain->interface);
+
                 if (sc->spec.ring.tdomid != DOMID_INVALID) {
                         tdomain = find_or_alloc_domain(ctx,
 
sc->spec.ring.tdomid);
@@ -1310,7 +1323,6 @@ void read_state_connection(const void *ctx, const
void *state)
                         talloc_reference(domain->conn, tdomain->conn);
                         domain->conn->target = tdomain->conn;
                 }
-               conn = domain->conn;
         }

         conn->conn_id = sc->conn_id;
diff --git a/tools/xenstore/xenstored_domain.h
b/tools/xenstore/xenstored_domain.h
index b71ab6d8a140..ec3b95a97195 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -21,6 +21,8 @@

   void handle_event(void);

+void check_domains(void);
+
   /* domid, mfn, eventchn, path */
   int do_introduce(struct connection *conn, struct buffered_data *in);

Cheers,

-- 
Julien Grall

