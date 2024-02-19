Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A303A85AA66
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 18:53:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683039.1062358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc7oN-0007Rx-6m; Mon, 19 Feb 2024 17:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683039.1062358; Mon, 19 Feb 2024 17:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc7oN-0007Q7-3z; Mon, 19 Feb 2024 17:52:15 +0000
Received: by outflank-mailman (input) for mailman id 683039;
 Mon, 19 Feb 2024 17:52:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NWwU=J4=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rc7oL-0007Q1-Ba
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 17:52:13 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9aa8d64f-cf4f-11ee-8a52-1f161083a0e0;
 Mon, 19 Feb 2024 18:52:11 +0100 (CET)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1708365125938180.04530272200873;
 Mon, 19 Feb 2024 09:52:05 -0800 (PST)
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
X-Inumbo-ID: 9aa8d64f-cf4f-11ee-8a52-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; t=1708365127; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Zt2wcJXe+Uv2oiS/Iifc1MUwJwR1StTVZ+TbSqX+G9xrgqNtWuVr744AIty7y32SvFy/at5Fy9Va9YRYJgSCxq1iHlRb8xGH10RBofDb6NMzpThSbIK7JrteB7b8CHvNgxkoa8EG4vFEkXO42MYiqnwgssxhmRhYAOJ6lnYWCKo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1708365127; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TNQCLfA9htVpZRkeHZ4Mx7K1oaIJNW/iB3pExkroJRY=; 
	b=HRjVfZApxr8sa+U/svyywHMuwEaQwBaKdFa6risaXSIzTN7bOh0Q5coBjm4lOAjYRtzGMo1eva6bJMhWZ/eKukIzGLuQBYFWXCvhezrQRhk4yBFvYfOkCPoxW1Nzi4AGMqK/4AuScK5k2AAcgCUNlxTGmSpVhx4YKBWFLUsRqho=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1708365127;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Content-Type:Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Message-Id:Reply-To;
	bh=TNQCLfA9htVpZRkeHZ4Mx7K1oaIJNW/iB3pExkroJRY=;
	b=FbSPP8GyIpQO0ZnpcWjSs7Eo2bJwmNMboPij0I+co++OpDNk8Yr33pPRBi08M/Gw
	87dzIhJd9DG8Z8liY9SjAACt2x8g1RnVG9BxRdGfw7Klz5JzqpaXaEEnqu6tpJKqA5K
	k5eqfWvDlG/72Pjj3QIyy5w9ag+44vbmPda1/McM=
Content-Type: multipart/alternative;
 boundary="------------Ho0E0BJPwP6Bi1nFFQEaejQ2"
Message-ID: <b6bf7430-80d6-4d02-a032-ed08a5ee1b10@apertussolutions.com>
Date: Mon, 19 Feb 2024 12:52:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Constify some parameters
Content-Language: en-US
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
References: <20240214094734.13533-1-frediano.ziglio@cloud.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <20240214094734.13533-1-frediano.ziglio@cloud.com>
X-ZohoMailClient: External

This is a multi-part message in MIME format.
--------------Ho0E0BJPwP6Bi1nFFQEaejQ2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

For XSM changes,

Ack-by: Daniel P. Smith <dpsmith@apertussolutions.com>

V/r,
Daniel P. Smith
Apertus Solutions, LLC

On 2/14/24 04:47, Frediano Ziglio wrote:
> Make clear they are not changed in the functions.
>
> Signed-off-by: Frediano Ziglio<frediano.ziglio@cloud.com>
> Reviewed-by: Jan Beulich<jbeulich@suse.com>
> --
> v2:
> - fixed typo in commit message.
> ---
>   xen/arch/x86/pv/callback.c | 4 ++--
>   xen/common/sched/compat.c  | 2 +-
>   xen/common/sched/core.c    | 2 +-
>   xen/xsm/flask/flask_op.c   | 8 ++++----
>   4 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/xen/arch/x86/pv/callback.c b/xen/arch/x86/pv/callback.c
> index 17829304fe..caec4fb16f 100644
> --- a/xen/arch/x86/pv/callback.c
> +++ b/xen/arch/x86/pv/callback.c
> @@ -48,7 +48,7 @@ static void unregister_guest_nmi_callback(void)
>       memset(t, 0, sizeof(*t));
>   }
>   
> -static long register_guest_callback(struct callback_register *reg)
> +static long register_guest_callback(const struct callback_register *reg)
>   {
>       long ret = 0;
>       struct vcpu *curr = current;
> @@ -102,7 +102,7 @@ static long register_guest_callback(struct callback_register *reg)
>       return ret;
>   }
>   
> -static long unregister_guest_callback(struct callback_unregister *unreg)
> +static long unregister_guest_callback(const struct callback_unregister *unreg)
>   {
>       long ret;
>   
> diff --git a/xen/common/sched/compat.c b/xen/common/sched/compat.c
> index dd97593630..a02204ec9a 100644
> --- a/xen/common/sched/compat.c
> +++ b/xen/common/sched/compat.c
> @@ -26,7 +26,7 @@ CHECK_sched_shutdown;
>   CHECK_sched_remote_shutdown;
>   #undef xen_sched_remote_shutdown
>   
> -static int compat_poll(struct compat_sched_poll *compat)
> +static int compat_poll(const struct compat_sched_poll *compat)
>   {
>       struct sched_poll native;
>   
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index d177c675c8..c5db373972 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -1431,7 +1431,7 @@ static void vcpu_block_enable_events(void)
>       vcpu_block();
>   }
>   
> -static long do_poll(struct sched_poll *sched_poll)
> +static long do_poll(const struct sched_poll *sched_poll)
>   {
>       struct vcpu   *v = current;
>       struct domain *d = v->domain;
> diff --git a/xen/xsm/flask/flask_op.c b/xen/xsm/flask/flask_op.c
> index b866e8d05f..ea7dd10dc8 100644
> --- a/xen/xsm/flask/flask_op.c
> +++ b/xen/xsm/flask/flask_op.c
> @@ -469,7 +469,7 @@ static int flask_security_load(struct xen_flask_load *load)
>       return ret;
>   }
>   
> -static int flask_devicetree_label(struct xen_flask_devicetree_label *arg)
> +static int flask_devicetree_label(const struct xen_flask_devicetree_label *arg)
>   {
>       int rv;
>       char *buf;
> @@ -492,7 +492,7 @@ static int flask_devicetree_label(struct xen_flask_devicetree_label *arg)
>   
>   #ifndef COMPAT
>   
> -static int flask_ocontext_del(struct xen_flask_ocontext *arg)
> +static int flask_ocontext_del(const struct xen_flask_ocontext *arg)
>   {
>       int rv;
>   
> @@ -506,7 +506,7 @@ static int flask_ocontext_del(struct xen_flask_ocontext *arg)
>       return security_ocontext_del(arg->ocon, arg->low, arg->high);
>   }
>   
> -static int flask_ocontext_add(struct xen_flask_ocontext *arg)
> +static int flask_ocontext_add(const struct xen_flask_ocontext *arg)
>   {
>       int rv;
>   
> @@ -550,7 +550,7 @@ static int flask_get_peer_sid(struct xen_flask_peersid *arg)
>       return rv;
>   }
>   
> -static int flask_relabel_domain(struct xen_flask_relabel *arg)
> +static int flask_relabel_domain(const struct xen_flask_relabel *arg)
>   {
>       int rc;
>       struct domain *d;
--------------Ho0E0BJPwP6Bi1nFFQEaejQ2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html data-lt-installed="true">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>For XSM changes,<br>
      <br>
      Ack-by: Daniel P. Smith <a class="moz-txt-link-rfc2396E" href="mailto:dpsmith@apertussolutions.com">&lt;dpsmith@apertussolutions.com&gt;</a><br>
    </p>
    <pre class="moz-signature" cols="72">V/r,
Daniel P. Smith
Apertus Solutions, LLC</pre>
    <div class="moz-cite-prefix">On 2/14/24 04:47, Frediano Ziglio
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240214094734.13533-1-frediano.ziglio@cloud.com">
      <pre class="moz-quote-pre" wrap="">Make clear they are not changed in the functions.

Signed-off-by: Frediano Ziglio <a class="moz-txt-link-rfc2396E" href="mailto:frediano.ziglio@cloud.com">&lt;frediano.ziglio@cloud.com&gt;</a>
Reviewed-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
--
v2:
- fixed typo in commit message.
---
 xen/arch/x86/pv/callback.c | 4 ++--
 xen/common/sched/compat.c  | 2 +-
 xen/common/sched/core.c    | 2 +-
 xen/xsm/flask/flask_op.c   | 8 ++++----
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/pv/callback.c b/xen/arch/x86/pv/callback.c
index 17829304fe..caec4fb16f 100644
--- a/xen/arch/x86/pv/callback.c
+++ b/xen/arch/x86/pv/callback.c
@@ -48,7 +48,7 @@ static void unregister_guest_nmi_callback(void)
     memset(t, 0, sizeof(*t));
 }
 
-static long register_guest_callback(struct callback_register *reg)
+static long register_guest_callback(const struct callback_register *reg)
 {
     long ret = 0;
     struct vcpu *curr = current;
@@ -102,7 +102,7 @@ static long register_guest_callback(struct callback_register *reg)
     return ret;
 }
 
-static long unregister_guest_callback(struct callback_unregister *unreg)
+static long unregister_guest_callback(const struct callback_unregister *unreg)
 {
     long ret;
 
diff --git a/xen/common/sched/compat.c b/xen/common/sched/compat.c
index dd97593630..a02204ec9a 100644
--- a/xen/common/sched/compat.c
+++ b/xen/common/sched/compat.c
@@ -26,7 +26,7 @@ CHECK_sched_shutdown;
 CHECK_sched_remote_shutdown;
 #undef xen_sched_remote_shutdown
 
-static int compat_poll(struct compat_sched_poll *compat)
+static int compat_poll(const struct compat_sched_poll *compat)
 {
     struct sched_poll native;
 
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index d177c675c8..c5db373972 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1431,7 +1431,7 @@ static void vcpu_block_enable_events(void)
     vcpu_block();
 }
 
-static long do_poll(struct sched_poll *sched_poll)
+static long do_poll(const struct sched_poll *sched_poll)
 {
     struct vcpu   *v = current;
     struct domain *d = v-&gt;domain;
diff --git a/xen/xsm/flask/flask_op.c b/xen/xsm/flask/flask_op.c
index b866e8d05f..ea7dd10dc8 100644
--- a/xen/xsm/flask/flask_op.c
+++ b/xen/xsm/flask/flask_op.c
@@ -469,7 +469,7 @@ static int flask_security_load(struct xen_flask_load *load)
     return ret;
 }
 
-static int flask_devicetree_label(struct xen_flask_devicetree_label *arg)
+static int flask_devicetree_label(const struct xen_flask_devicetree_label *arg)
 {
     int rv;
     char *buf;
@@ -492,7 +492,7 @@ static int flask_devicetree_label(struct xen_flask_devicetree_label *arg)
 
 #ifndef COMPAT
 
-static int flask_ocontext_del(struct xen_flask_ocontext *arg)
+static int flask_ocontext_del(const struct xen_flask_ocontext *arg)
 {
     int rv;
 
@@ -506,7 +506,7 @@ static int flask_ocontext_del(struct xen_flask_ocontext *arg)
     return security_ocontext_del(arg-&gt;ocon, arg-&gt;low, arg-&gt;high);
 }
 
-static int flask_ocontext_add(struct xen_flask_ocontext *arg)
+static int flask_ocontext_add(const struct xen_flask_ocontext *arg)
 {
     int rv;
 
@@ -550,7 +550,7 @@ static int flask_get_peer_sid(struct xen_flask_peersid *arg)
     return rv;
 }
 
-static int flask_relabel_domain(struct xen_flask_relabel *arg)
+static int flask_relabel_domain(const struct xen_flask_relabel *arg)
 {
     int rc;
     struct domain *d;
</pre>
    </blockquote>
  </body>
  <lt-container></lt-container>
</html>

--------------Ho0E0BJPwP6Bi1nFFQEaejQ2--

