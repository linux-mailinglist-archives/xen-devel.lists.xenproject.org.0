Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B93E972A1D0
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 20:09:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546282.853035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7gYA-0004iU-PZ; Fri, 09 Jun 2023 18:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546282.853035; Fri, 09 Jun 2023 18:09:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7gYA-0004ge-Lx; Fri, 09 Jun 2023 18:09:26 +0000
Received: by outflank-mailman (input) for mailman id 546282;
 Fri, 09 Jun 2023 18:09:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q7gYA-0004gY-0L
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 18:09:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q7gY9-0003Mr-3O; Fri, 09 Jun 2023 18:09:25 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.17.204]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q7gY8-0002Kl-Ti; Fri, 09 Jun 2023 18:09:25 +0000
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
	bh=JwSVLWnnkECKX3dSL7LC9Ah9Oz57orjZj2k8z4ZCcs8=; b=NvYvuQG9Ekrsyy/S23sigcVhl4
	o8c+g3X4DuWWMvzWeBg55RDpoU9qA50Fh6TjZ/BBp3q+JCRkRqsjTJksg4pZ2ahnRirKYw0gXpW1D
	es/A4PaYbZqDlKJ/fPfT+igiyY6k14TRllJVitv8CaiUo5GfK05Ou+AagbsrdB0Sdz6o=;
Message-ID: <5eee062b-8028-bc5e-2a5c-2422430894e6@xen.org>
Date: Fri, 9 Jun 2023 19:09:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH v3 10/16] tools/libs/store: use xen_list.h instead of
 xenstore/list.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530085418.5417-1-jgross@suse.com>
 <20230530085418.5417-11-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230530085418.5417-11-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/05/2023 09:54, Juergen Gross wrote:
> Replace the usage of the xenstore private list.h header with the
> common xen_list.h one.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V3:
> - new patch
> ---
>   tools/libs/store/xs.c | 56 +++++++++++++++++++++----------------------
>   1 file changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
> index 7a9a8b1656..3813b69ae2 100644
> --- a/tools/libs/store/xs.c
> +++ b/tools/libs/store/xs.c
> @@ -35,13 +35,13 @@
>   #include <errno.h>
>   #include "xenstore.h"
>   #include "xs_lib.h"
> -#include "list.h"
>   #include "utils.h"
>   
>   #include <xentoolcore_internal.h>
> +#include <xen_list.h>
>   
>   struct xs_stored_msg {
> -	struct list_head list;
> +	XEN_TAILQ_ENTRY(struct xs_stored_msg) list;

I have expected us to use to XEN_LIST_*. Can you explain why you didn't 
use them?

>   	struct xsd_sockmsg hdr;
>   	char *body;
>   };
> @@ -70,7 +70,7 @@ struct xs_handle {
>            * A list of fired watch messages, protected by a mutex. Users can
>            * wait on the conditional variable until a watch is pending.
>            */
> -	struct list_head watch_list;
> +	XEN_TAILQ_HEAD(, struct xs_stored_msg) watch_list;
>   	pthread_mutex_t watch_mutex;
>   	pthread_cond_t watch_condvar;
>   
> @@ -84,7 +84,7 @@ struct xs_handle {
>            * because we serialise requests. The requester can wait on the
>            * conditional variable for its response.
>            */
> -	struct list_head reply_list;
> +	XEN_TAILQ_HEAD(, struct xs_stored_msg) reply_list;
>   	pthread_mutex_t reply_mutex;
>   	pthread_cond_t reply_condvar;
>   
> @@ -133,8 +133,8 @@ static void *read_thread(void *arg);
>   struct xs_handle {
>   	int fd;
>   	Xentoolcore__Active_Handle tc_ah; /* for restrict */
> -	struct list_head reply_list;
> -	struct list_head watch_list;
> +	XEN_TAILQ_HEAD(, struct xs_stored_msg) reply_list;
> +	XEN_TAILQ_HEAD(, struct xs_stored_msg) watch_list;
>   	/* Clients can select() on this pipe to wait for a watch to fire. */
>   	int watch_pipe[2];
>   	/* Filtering watch event in unwatch function? */
> @@ -180,7 +180,7 @@ int xs_fileno(struct xs_handle *h)
>   
>   	if ((h->watch_pipe[0] == -1) && (pipe(h->watch_pipe) != -1)) {
>   		/* Kick things off if the watch list is already non-empty. */
> -		if (!list_empty(&h->watch_list))
> +		if (!XEN_TAILQ_EMPTY(&h->watch_list))
>   			while (write(h->watch_pipe[1], &c, 1) != 1)
>   				continue;
>   	}
> @@ -262,8 +262,8 @@ static struct xs_handle *get_handle(const char *connect_to)
>   	if (h->fd == -1)
>   		goto err;
>   
> -	INIT_LIST_HEAD(&h->reply_list);
> -	INIT_LIST_HEAD(&h->watch_list);
> +	XEN_TAILQ_INIT(&h->reply_list);
> +	XEN_TAILQ_INIT(&h->watch_list);
>   
>   	/* Watch pipe is allocated on demand in xs_fileno(). */
>   	h->watch_pipe[0] = h->watch_pipe[1] = -1;
> @@ -329,12 +329,12 @@ struct xs_handle *xs_open(unsigned long flags)
>   static void close_free_msgs(struct xs_handle *h) {
>   	struct xs_stored_msg *msg, *tmsg;
>   
> -	list_for_each_entry_safe(msg, tmsg, &h->reply_list, list) {
> +	XEN_TAILQ_FOREACH_SAFE(msg, &h->reply_list, list, tmsg) {
>   		free(msg->body);
>   		free(msg);
>   	}
>   
> -	list_for_each_entry_safe(msg, tmsg, &h->watch_list, list) {
> +	XEN_TAILQ_FOREACH_SAFE(msg, &h->watch_list, list, tmsg) {
>   		free(msg->body);
>   		free(msg);
>   	}
> @@ -459,17 +459,17 @@ static void *read_reply(
>   
>   	mutex_lock(&h->reply_mutex);
>   #ifdef USE_PTHREAD
> -	while (list_empty(&h->reply_list) && read_from_thread && h->fd != -1)
> +	while (XEN_TAILQ_EMPTY(&h->reply_list) && read_from_thread && h->fd != -1)
>   		condvar_wait(&h->reply_condvar, &h->reply_mutex);
>   #endif
> -	if (list_empty(&h->reply_list)) {
> +	if (XEN_TAILQ_EMPTY(&h->reply_list)) {
>   		mutex_unlock(&h->reply_mutex);
>   		errno = EINVAL;
>   		return NULL;
>   	}
> -	msg = list_top(&h->reply_list, struct xs_stored_msg, list);
> -	list_del(&msg->list);
> -	assert(list_empty(&h->reply_list));
> +	msg = XEN_TAILQ_FIRST(&h->reply_list);
> +	XEN_TAILQ_REMOVE(&h->reply_list, msg, list);
> +	assert(XEN_TAILQ_EMPTY(&h->reply_list));
>   	mutex_unlock(&h->reply_mutex);
>   
>   	*type = msg->hdr.type;
> @@ -883,7 +883,7 @@ static void xs_maybe_clear_watch_pipe(struct xs_handle *h)
>   {
>   	char c;
>   
> -	if (list_empty(&h->watch_list) && (h->watch_pipe[0] != -1))
> +	if (XEN_TAILQ_EMPTY(&h->watch_list) && (h->watch_pipe[0] != -1))
>   		while (read(h->watch_pipe[0], &c, 1) != 1)
>   			continue;
>   }
> @@ -907,7 +907,7 @@ static char **read_watch_internal(struct xs_handle *h, unsigned int *num,
>   	 * we haven't called xs_watch.	Presumably the application
>   	 * will do so later; in the meantime we just block.
>   	 */
> -	while (list_empty(&h->watch_list) && h->fd != -1) {
> +	while (XEN_TAILQ_EMPTY(&h->watch_list) && h->fd != -1) {
>   		if (nonblocking) {
>   			mutex_unlock(&h->watch_mutex);
>   			errno = EAGAIN;
> @@ -925,13 +925,13 @@ static char **read_watch_internal(struct xs_handle *h, unsigned int *num,
>   
>   #endif /* !defined(USE_PTHREAD) */
>   
> -	if (list_empty(&h->watch_list)) {
> +	if (XEN_TAILQ_EMPTY(&h->watch_list)) {
>   		mutex_unlock(&h->watch_mutex);
>   		errno = EINVAL;
>   		return NULL;
>   	}
> -	msg = list_top(&h->watch_list, struct xs_stored_msg, list);
> -	list_del(&msg->list);
> +	msg = XEN_TAILQ_FIRST(&h->watch_list);
> +	XEN_TAILQ_REMOVE(&h->watch_list, msg, list);
>   
>   	xs_maybe_clear_watch_pipe(h);
>   	mutex_unlock(&h->watch_mutex);
> @@ -1007,12 +1007,12 @@ bool xs_unwatch(struct xs_handle *h, const char *path, const char *token)
>   	/* Filter the watch list to remove potential message */
>   	mutex_lock(&h->watch_mutex);
>   
> -	if (list_empty(&h->watch_list)) {
> +	if (XEN_TAILQ_EMPTY(&h->watch_list)) {
>   		mutex_unlock(&h->watch_mutex);
>   		return res;
>   	}
>   
> -	list_for_each_entry_safe(msg, tmsg, &h->watch_list, list) {
> +	XEN_TAILQ_FOREACH_SAFE(msg, &h->watch_list, list, tmsg) {
>   		assert(msg->hdr.type == XS_WATCH_EVENT);
>   
>   		s = msg->body;
> @@ -1034,7 +1034,7 @@ bool xs_unwatch(struct xs_handle *h, const char *path, const char *token)
>   
>   		if (l_token && !strcmp(token, l_token) &&
>   		    l_path && xs_path_is_subpath(path, l_path)) {
> -			list_del(&msg->list);
> +			XEN_TAILQ_REMOVE(&h->watch_list, msg, list);
>   			free(msg);
>   		}
>   	}
> @@ -1290,12 +1290,12 @@ static int read_message(struct xs_handle *h, int nonblocking)
>   		cleanup_push(pthread_mutex_unlock, &h->watch_mutex);
>   
>   		/* Kick users out of their select() loop. */
> -		if (list_empty(&h->watch_list) &&
> +		if (XEN_TAILQ_EMPTY(&h->watch_list) &&
>   		    (h->watch_pipe[1] != -1))
>   			while (write(h->watch_pipe[1], body, 1) != 1) /* Cancellation point */
>   				continue;
>   
> -		list_add_tail(&msg->list, &h->watch_list);
> +		XEN_TAILQ_INSERT_TAIL(&h->watch_list, msg, list);
>   
>   		condvar_signal(&h->watch_condvar);
>   
> @@ -1304,13 +1304,13 @@ static int read_message(struct xs_handle *h, int nonblocking)
>   		mutex_lock(&h->reply_mutex);
>   
>   		/* There should only ever be one response pending! */
> -		if (!list_empty(&h->reply_list)) {
> +		if (!XEN_TAILQ_EMPTY(&h->reply_list)) {
>   			mutex_unlock(&h->reply_mutex);
>   			saved_errno = EEXIST;
>   			goto error_freebody;
>   		}
>   
> -		list_add_tail(&msg->list, &h->reply_list);
> +		XEN_TAILQ_INSERT_TAIL(&h->reply_list, msg, list);
>   		condvar_signal(&h->reply_condvar);
>   
>   		mutex_unlock(&h->reply_mutex);

-- 
Julien Grall

