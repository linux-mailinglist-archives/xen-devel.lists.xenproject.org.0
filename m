Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFD32DB586
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 22:00:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54849.95427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpHQ6-0002E7-JX; Tue, 15 Dec 2020 20:59:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54849.95427; Tue, 15 Dec 2020 20:59:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpHQ6-0002Dk-G6; Tue, 15 Dec 2020 20:59:42 +0000
Received: by outflank-mailman (input) for mailman id 54849;
 Tue, 15 Dec 2020 20:59:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6ufw=FT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kpHQ4-0002Df-SV
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 20:59:40 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 258133db-4552-4f80-a05c-69c4a8a8e9b3;
 Tue, 15 Dec 2020 20:59:39 +0000 (UTC)
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
X-Inumbo-ID: 258133db-4552-4f80-a05c-69c4a8a8e9b3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608065978;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=twnfeOO/nJh+7Yqrwe0fs8m/4jH5/Yo3yi9Jp0z/Lss=;
  b=FoiQYpDytOcoFzfBWnV4vVzqp2A2Mf57D6pAA7yJMbwxyI6POc169uNn
   UK8skzwNZmHxiW9UfAubNlI9gOvRpwQGX54dEmE7SeVQltVl/otWYEsKw
   Rk9IbJcuWJOOm+J+uR5O1avHDvzsJ7L6Uvk8Xri28In6Bfhy27lZlDOqr
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: uuatwPkBk2JlFNvnKxCJz1fCleazbEJAfO+UCKhDHk/N1fJ6YIIb3Me8H7vmAP/wC4OOPR92M3
 Ljp+e5tikssU7acjBxZrayROOdojYqfTc57bvGwSBQkDNkPh2Zg1dnVi0S0P36ChXKPTthy94K
 uBJCWhda77S2AUZc0x84cppZ/tF2VKl+CZC+FstSAd6IlZsThgc6a+3O/5t3OHTOOkB7Xxg01C
 VnRQHy+6IEWa7QpkIJfZ5+92YLk5y8JNhfhxnw6IxvaR30I8wctCDDtdNIljbssIT9vzqVm5o+
 gbQ=
X-SBRS: 5.2
X-MesageID: 33639630
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,422,1599537600"; 
   d="scan'208";a="33639630"
Subject: Re: [PATCH v2] xen/xenbus: make xs_talkv() interruptible
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20201215111055.3810-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2deac9ce-0c27-a472-7d51-b91a640d92ed@citrix.com>
Date: Tue, 15 Dec 2020 20:59:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201215111055.3810-1-jgross@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 15/12/2020 11:10, Juergen Gross wrote:
> In case a process waits for any Xenstore action in the xenbus driver
> it should be interruptible by signals.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - don't special case SIGKILL as libxenstore is handling -EINTR fine
> ---
>  drivers/xen/xenbus/xenbus_xs.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/xen/xenbus/xenbus_xs.c b/drivers/xen/xenbus/xenbus_xs.c
> index 3a06eb699f33..17c8f8a155fd 100644
> --- a/drivers/xen/xenbus/xenbus_xs.c
> +++ b/drivers/xen/xenbus/xenbus_xs.c
> @@ -205,8 +205,15 @@ static bool test_reply(struct xb_req_data *req)
>  
>  static void *read_reply(struct xb_req_data *req)
>  {
> +	int ret;
> +
>  	do {
> -		wait_event(req->wq, test_reply(req));
> +		ret = wait_event_interruptible(req->wq, test_reply(req));
> +
> +		if (ret == -ERESTARTSYS && signal_pending(current)) {
> +			req->msg.type = XS_ERROR;
> +			return ERR_PTR(-EINTR);
> +		}

So now I can talk fully about the situations which lead to this, I think
there is a bit more complexity.

It turns out there are a number of issues related to running a Xen
system with no xenstored.

1) If a xenstore-write occurs during startup before init-xenstore-domain
runs, the former blocks on /dev/xen/xenbus waiting for xenstored to
reply, while the latter blocks on /dev/xen/xenbus_backend when trying to
tell the dom0 kernel that xenstored is in dom1.  This effectively
deadlocks the system.

2) If xenstore-watch is running when xenstored dies, it spins at 100%
cpu usage making no system calls at all.  This is caused by bad error
handling from xs_watch(), and attempting to debug found:

3) (this issue).  If anyone starts xenstore-watch with no xenstored
running at all, it blocks in D in the kernel.

The cause is the special handling for watch/unwatch commands which,
instead of just queuing up the data for xenstore, explicitly waits for
an OK for registering the watch.  This causes a write() system call to
block waiting for a non-existent entity to reply.

So while this patch does resolve the major usability issue I found (I
can't even SIGINT and get my terminal back), I think there are issues.

The reason why XS_WATCH/XS_UNWATCH are special cased is because they do
require special handling.  The main kernel thread for processing
incoming data from xenstored does need to know how to associate each
async XS_WATCH_EVENT to the caller who watched the path.

Therefore, depending on when this cancellation hits, we might be in any
of the following states:

1) the watch is queued in the kernel, but not even sent to xenstored yet
2) the watch is queued in the xenstored ring, but not acted upon
3) the watch is queued in the xenstored ring, and the xenstored has seen
it but not replied yet
4) the watch has been processed, but the XS_WATCH reply hasn't been
received yet
5) the watch has been processed, and the XS_WATCH reply received

State 5 (and a little bit) is the normal success path when xenstored has
acted upon the request, and the internal kernel infrastructure is set up
appropriately to handle XS_WATCH_EVENTs.

States 1 and 2 can be very common if there is no xenstored (or at least,
it hasn't started up yet).  In reality, there is either no xenstored, or
it is up and running (and for a period of time during system startup,
these cases occur in sequence).

As soon as the XS_WATCH event has been written into the xenstored ring,
it is not safe to cancel.  You've committed to xenstored processing the
request (if it is up).

If xenstored is actually up and running, its fine and necessary to
block.  The request will be processed in due course (timing subject to
the client and server load).  If xenstored isn't up, blocking isn't ok.

Therefore, I think we need to distinguish "not yet on the ring" from "on
the ring", as our distinction as to whether cancelling is safe, and
ensure we don't queue anything on the ring before we're sure xenstored
has started up.

Does this make sense?

~Andrew

