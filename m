Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7433261EC
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 12:24:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90249.170790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFbDm-00071R-J6; Fri, 26 Feb 2021 11:23:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90249.170790; Fri, 26 Feb 2021 11:23:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFbDm-000712-Fg; Fri, 26 Feb 2021 11:23:46 +0000
Received: by outflank-mailman (input) for mailman id 90249;
 Fri, 26 Feb 2021 11:23:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uova=H4=cert.pl=hubert.jasudowicz@srs-us1.protection.inumbo.net>)
 id 1lFbDk-00070d-MY
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 11:23:44 +0000
Received: from mx.nask.net.pl (unknown [195.187.55.89])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82f68d00-39a3-4f96-b122-169165b395cd;
 Fri, 26 Feb 2021 11:23:43 +0000 (UTC)
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
X-Inumbo-ID: 82f68d00-39a3-4f96-b122-169165b395cd
Date: Fri, 26 Feb 2021 12:23:40 +0100
From: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	=?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH] tools: Improve signal handling in xen-vmtrace
Message-ID: <20210226112340.xiygnu4qclixswuc@arnold.localdomain>
Mail-Followup-To: xen-devel@lists.xenproject.org,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	=?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
References: <26720bf5c8258e1b7b4600af3648039b5b9ee18d.1614336820.git.hubert.jasudowicz@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26720bf5c8258e1b7b4600af3648039b5b9ee18d.1614336820.git.hubert.jasudowicz@cert.pl>

On 2021-02-26, Hubert Jasudowicz wrote:
> Make sure xen-vmtrace exits cleanly in case SIGPIPE is sent. This can
> happen when piping the output to some other program.
> 
> Additionaly, add volatile qualifier to interrupted flag to avoid
> it being optimized away by the compiler.
> 
> Signed-off-by: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
> ---
>  tools/misc/xen-vmtrace.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/misc/xen-vmtrace.c b/tools/misc/xen-vmtrace.c
> index 7572e880c5..e2da043058 100644
> --- a/tools/misc/xen-vmtrace.c
> +++ b/tools/misc/xen-vmtrace.c
> @@ -43,7 +43,7 @@ static uint32_t domid, vcpu;
>  static size_t size;
>  static char *buf;
>  
> -static sig_atomic_t interrupted;
> +static volatile sig_atomic_t interrupted;
>  static void int_handler(int signum)
>  {
>      interrupted = 1;
> @@ -81,6 +81,9 @@ int main(int argc, char **argv)
>      if ( signal(SIGINT, int_handler) == SIG_ERR )
>          err(1, "Failed to register signal handler\n");
>  
> +    if ( signal(SIGPIPE, int_handler) == SIG_ERR )
> +        err(1, "Failed to register signal handler\n");
> +
>      if ( argc != 3 )
>      {
>          fprintf(stderr, "Usage: %s <domid> <vcpu_id>\n", argv[0]);
> -- 
> 2.30.0
> 
> 

Oops, forgot 4.15 tag. But IMO this should be included.

Thanks
Hubert Jasudowicz
CERT Polska

