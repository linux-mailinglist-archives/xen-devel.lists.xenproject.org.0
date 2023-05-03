Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4C26F569B
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 12:54:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529104.823129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puA71-0004v1-0l; Wed, 03 May 2023 10:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529104.823129; Wed, 03 May 2023 10:53:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puA70-0004sC-U5; Wed, 03 May 2023 10:53:30 +0000
Received: by outflank-mailman (input) for mailman id 529104;
 Wed, 03 May 2023 10:53:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1puA6z-0004s6-NU
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 10:53:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puA6y-0007xn-LB; Wed, 03 May 2023 10:53:28 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.7.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puA6y-0006MO-Dp; Wed, 03 May 2023 10:53:28 +0000
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
	bh=1BCdJCjM28LGf/KTqeCxNJ67GzgccYNIlqtOxilJCvs=; b=rLE6Pp8ZSjuZuJlVO8Il++yoZ8
	nPLjeyEuc3QAa+4BtyUZGeLmmyUo9jeXeZS84stL453xg+4fqCSHVVZfQd61jYkN15tZd0uVKdwYL
	nAKzH7AmiS6k6JL1iEZ2lNzcdwkJZZkUGhJvFQuq6sHbBknrlIqyH+ttNabWOj0Uqqzg=;
Message-ID: <1a529c44-1564-ad42-3924-f58efaa83a91@xen.org>
Date: Wed, 3 May 2023 11:53:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 13/13] tools/xenstore: switch quota management to be
 table based
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230405070349.25293-1-jgross@suse.com>
 <20230405070349.25293-14-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230405070349.25293-14-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 05/04/2023 08:03, Juergen Gross wrote:
> Instead of having individual quota variables switch to a table based
> approach like the generic accounting. Include all the related data in
> the same table and add accessor functions.
> 
> This enables to use the command line --quota parameter for setting all
> possible quota values, keeping the previous parameters for
> compatibility.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - new patch
> One further remark: it would be rather easy to add soft-quota for all
> the other quotas (similar to the memory one). This could be used as
> an early warning for the need to raise global quota.

I don't have a strong opinion on this topic.

> ---
>   tools/xenstore/xenstored_control.c     |  43 ++------
>   tools/xenstore/xenstored_core.c        |  85 ++++++++--------
>   tools/xenstore/xenstored_core.h        |  10 --
>   tools/xenstore/xenstored_domain.c      | 132 +++++++++++++++++--------
>   tools/xenstore/xenstored_domain.h      |  12 ++-
>   tools/xenstore/xenstored_transaction.c |   5 +-
>   tools/xenstore/xenstored_watch.c       |   2 +-
>   7 files changed, 155 insertions(+), 134 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
> index a2ba64a15c..75f51a80db 100644
> --- a/tools/xenstore/xenstored_control.c
> +++ b/tools/xenstore/xenstored_control.c
> @@ -221,35 +221,6 @@ static int do_control_log(const void *ctx, struct connection *conn,
>   	return 0;
>   }
>   
> -struct quota {
> -	const char *name;
> -	int *quota;
> -	const char *descr;
> -};
> -
> -static const struct quota hard_quotas[] = {
> -	{ "nodes", &quota_nb_entry_per_domain, "Nodes per domain" },
> -	{ "watches", &quota_nb_watch_per_domain, "Watches per domain" },
> -	{ "transactions", &quota_max_transaction, "Transactions per domain" },
> -	{ "outstanding", &quota_req_outstanding,
> -		"Outstanding requests per domain" },
> -	{ "transaction-nodes", &quota_trans_nodes,
> -		"Max. number of accessed nodes per transaction" },
> -	{ "memory", &quota_memory_per_domain_hard,
> -		"Total Xenstore memory per domain (error level)" },
> -	{ "node-size", &quota_max_entry_size, "Max. size of a node" },
> -	{ "path-max", &quota_max_path_len, "Max. length of a node path" },
> -	{ "permissions", &quota_nb_perms_per_node,
> -		"Max. number of permissions per node" },
> -	{ NULL, NULL, NULL }
> -};
> -
> -static const struct quota soft_quotas[] = {
> -	{ "memory", &quota_memory_per_domain_soft,
> -		"Total Xenstore memory per domain (warning level)" },
> -	{ NULL, NULL, NULL }
> -};
> -
>   static int quota_show_current(const void *ctx, struct connection *conn,
>   			      const struct quota *quotas)
>   {
> @@ -260,9 +231,11 @@ static int quota_show_current(const void *ctx, struct connection *conn,
>   	if (!resp)
>   		return ENOMEM;
>   
> -	for (i = 0; quotas[i].quota; i++) {
> +	for (i = 0; i < ACC_N; i++) {
> +		if (!quotas[i].name)
> +			continue;
>   		resp = talloc_asprintf_append(resp, "%-17s: %8d %s\n",
> -					      quotas[i].name, *quotas[i].quota,
> +					      quotas[i].name, quotas[i].val,
>   					      quotas[i].descr);
>   		if (!resp)
>   			return ENOMEM;
> @@ -274,7 +247,7 @@ static int quota_show_current(const void *ctx, struct connection *conn,
>   }
>   
>   static int quota_set(const void *ctx, struct connection *conn,
> -		     char **vec, int num, const struct quota *quotas)
> +		     char **vec, int num, struct quota *quotas)
>   {
>   	unsigned int i;
>   	int val;
> @@ -286,9 +259,9 @@ static int quota_set(const void *ctx, struct connection *conn,
>   	if (val < 1)
>   		return EINVAL;
>   
> -	for (i = 0; quotas[i].quota; i++) {
> -		if (!strcmp(vec[0], quotas[i].name)) {
> -			*quotas[i].quota = val;
> +	for (i = 0; i < ACC_N; i++) {
> +		if (quotas[i].name && !strcmp(vec[0], quotas[i].name)) {
> +			quotas[i].val = val;
>   			send_ack(conn, XS_CONTROL);
>   			return 0;
>   		}
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index 65df2866bf..6e2fc06840 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -89,17 +89,6 @@ unsigned int trace_flags = TRACE_OBJ | TRACE_IO;
>   
>   static const char *sockmsg_string(enum xsd_sockmsg_type type);
>   
> -int quota_nb_entry_per_domain = 1000;
> -int quota_nb_watch_per_domain = 128;
> -int quota_max_entry_size = 2048; /* 2K */
> -int quota_max_transaction = 10;
> -int quota_nb_perms_per_node = 5;
> -int quota_trans_nodes = 1024;
> -int quota_max_path_len = XENSTORE_REL_PATH_MAX;
> -int quota_req_outstanding = 20;
> -int quota_memory_per_domain_soft = 2 * 1024 * 1024; /* 2 MB */
> -int quota_memory_per_domain_hard = 2 * 1024 * 1024 + 512 * 1024; /* 2.5 MB */
> -
>   unsigned int timeout_watch_event_msec = 20000;
>   
>   void trace(const char *fmt, ...)
> @@ -799,7 +788,7 @@ int write_node_raw(struct connection *conn, TDB_DATA *key, struct node *node,
>   		+ node->perms.num * sizeof(node->perms.p[0])
>   		+ node->datalen + node->childlen;
>   
> -	if (domain_max_chk(conn, ACC_NODESZ, data.dsize, quota_max_entry_size)
> +	if (domain_max_chk(conn, ACC_NODESZ, data.dsize)
>   	    && !no_quota_check) {
>   		errno = ENOSPC;
>   		return errno;
> @@ -1188,8 +1177,7 @@ bool is_valid_nodename(const struct connection *conn, const char *node)
>   	if (sscanf(node, "/local/domain/%5u/%n", &domid, &local_off) != 1)
>   		local_off = 0;
>   
> -	if (domain_max_chk(conn, ACC_PATHLEN, strlen(node) - local_off,
> -			   quota_max_path_len))
> +	if (domain_max_chk(conn, ACC_PATHLEN, strlen(node) - local_off))
>   		return false;
>   
>   	return valid_chars(node);
> @@ -1501,7 +1489,7 @@ static struct node *create_node(struct connection *conn, const void *ctx,
>   	for (i = node; i; i = i->parent) {
>   		/* i->parent is set for each new node, so check quota. */
>   		if (i->parent &&
> -		    domain_nbentry(conn) >= quota_nb_entry_per_domain) {
> +		    domain_nbentry(conn) >= hard_quotas[ACC_NODES].val) {
>   			ret = ENOSPC;
>   			goto err;
>   		}
> @@ -1776,7 +1764,7 @@ static int do_set_perms(const void *ctx, struct connection *conn,
>   		return EINVAL;
>   
>   	perms.num--;
> -	if (domain_max_chk(conn, ACC_NPERM, perms.num, quota_nb_perms_per_node))
> +	if (domain_max_chk(conn, ACC_NPERM, perms.num))
>   		return ENOSPC;
>   
>   	permstr = in->buffer + strlen(in->buffer) + 1;
> @@ -2644,7 +2632,16 @@ static void usage(void)
>   "                          memory: total used memory per domain for nodes,\n"
>   "                                  transactions, watches and requests, above\n"
>   "                                  which Xenstore will stop talking to domain\n"
> +"                          nodes: number nodes owned by a domain\n"
> +"                          node-permissions: number of access permissions per\n"
> +"                                            node\n"
> +"                          node-size: total size of a node (permissions +\n"
> +"                                     children names + content)\n"
>   "                          outstanding: number of outstanding requests\n"
> +"                          path-length: length of a node path\n"
> +"                          transactions: number of concurrent transactions\n"
> +"                                        per domain\n"
> +"                          watches: number of watches per domain"
>   "  -q, --quota-soft <what>=<nb> set a soft quota <what> to the value <nb>,\n"
>   "                          causing a warning to be issued via syslog() if the\n"
>   "                          limit is violated, allowed quotas are:\n"
> @@ -2695,12 +2692,12 @@ int dom0_domid = 0;
>   int dom0_event = 0;
>   int priv_domid = 0;
>   
> -static int get_optval_int(const char *arg)
> +static unsigned int get_optval_int(const char *arg)
>   {
>   	char *end;
> -	long val;
> +	unsigned long val;
>   
> -	val = strtol(arg, &end, 10);
> +	val = strtoul(arg, &end, 10);
The changes in get_optval_int() feels like more a clean-up because the 
returned value cannot be negative (see check below). I would prefer if 
they are done in a separate patch.

>   	if (!*arg || *end || val < 0 || val > INT_MAX)

Now that 'val' is unsigned long, then there is no point for checking val 
is < 0.

Lastly, I would rename the helper to make clear it returns an unsigned 
value. How about get_optval_uint()?

>   		barf("invalid parameter value \"%s\"\n", arg);
>   
> @@ -2709,15 +2706,19 @@ static int get_optval_int(const char *arg)
>   
>   static bool what_matches(const char *arg, const char *what)
>   {
> -	unsigned int what_len = strlen(what);
> +	unsigned int what_len;
> +
> +	if (!what)
> +		false;

Shouldn't this be "return false"?

>   
> +	what_len = strlen(what);
>   	return !strncmp(arg, what, what_len) && arg[what_len] == '=';
>   }
>   
>   static void set_timeout(const char *arg)
>   {
>   	const char *eq = strchr(arg, '=');
> -	int val;
> +	unsigned int val;
>   
>   	if (!eq)
>   		barf("quotas must be specified via <what>=<seconds>\n");
> @@ -2731,22 +2732,22 @@ static void set_timeout(const char *arg)
>   static void set_quota(const char *arg, bool soft)
>   {
>   	const char *eq = strchr(arg, '=');
> -	int val;
> +	struct quota *q = soft ? soft_quotas : hard_quotas;
> +	unsigned int val;
> +	unsigned int i;
>   
>   	if (!eq)
>   		barf("quotas must be specified via <what>=<nb>\n");
>   	val = get_optval_int(eq + 1);
> -	if (what_matches(arg, "outstanding") && !soft)
> -		quota_req_outstanding = val;
> -	else if (what_matches(arg, "transaction-nodes") && !soft)
> -		quota_trans_nodes = val;
> -	else if (what_matches(arg, "memory")) {
> -		if (soft)
> -			quota_memory_per_domain_soft = val;
> -		else
> -			quota_memory_per_domain_hard = val;
> -	} else
> -		barf("unknown quota \"%s\"\n", arg);
> +
> +	for (i = 0; i < ACC_N; i++) {
> +		if (what_matches(arg, q[i].name)) {
> +			q[i].val = val;
> +			return;
> +		}
> +	}
> +
> +	barf("unknown quota \"%s\"\n", arg);
>   }
>   
>   /* Sorted by bit values of TRACE_* flags. Flag is (1u << index). */
> @@ -2808,7 +2809,7 @@ int main(int argc, char *argv[])
>   			no_domain_init = true;
>   			break;
>   		case 'E':
> -			quota_nb_entry_per_domain = strtol(optarg, NULL, 10);
> +			hard_quotas[ACC_NODES].val = strtoul(optarg, NULL, 10);

I think we should use get_optval_int() here and all the other below.

>   			break;
>   		case 'F':
>   			pidfile = optarg;
> @@ -2826,10 +2827,10 @@ int main(int argc, char *argv[])
>   			recovery = false;
>   			break;
>   		case 'S':
> -			quota_max_entry_size = strtol(optarg, NULL, 10);
> +			hard_quotas[ACC_NODESZ].val = strtoul(optarg, NULL, 10);
>   			break;
>   		case 't':
> -			quota_max_transaction = strtol(optarg, NULL, 10);
> +			hard_quotas[ACC_TRANS].val = strtoul(optarg, NULL, 10);
>   			break;
>   		case 'T':
>   			tracefile = optarg;
> @@ -2849,15 +2850,17 @@ int main(int argc, char *argv[])
>   			verbose = true;
>   			break;
>   		case 'W':
> -			quota_nb_watch_per_domain = strtol(optarg, NULL, 10);
> +			hard_quotas[ACC_WATCH].val = strtoul(optarg, NULL, 10);
>   			break;
>   		case 'A':
> -			quota_nb_perms_per_node = strtol(optarg, NULL, 10);
> +			hard_quotas[ACC_NPERM].val = strtoul(optarg, NULL, 10);
>   			break;
>   		case 'M':
> -			quota_max_path_len = strtol(optarg, NULL, 10);
> -			quota_max_path_len = min(XENSTORE_REL_PATH_MAX,
> -						 quota_max_path_len);
> +			hard_quotas[ACC_PATHLEN].val =
> +				strtoul(optarg, NULL, 10);
> +			hard_quotas[ACC_PATHLEN].val =
> +				 min((unsigned int)XENSTORE_REL_PATH_MAX,
> +				     hard_quotas[ACC_PATHLEN].val);
>   			break;
>   		case 'Q':
>   			set_quota(optarg, false);
Cheers,

-- 
Julien Grall

