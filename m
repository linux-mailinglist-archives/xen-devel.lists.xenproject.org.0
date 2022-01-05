Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD83485564
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jan 2022 16:06:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253638.434862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n57rG-0004mn-EG; Wed, 05 Jan 2022 15:05:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253638.434862; Wed, 05 Jan 2022 15:05:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n57rG-0004jh-A6; Wed, 05 Jan 2022 15:05:46 +0000
Received: by outflank-mailman (input) for mailman id 253638;
 Wed, 05 Jan 2022 15:05:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WMgQ=RV=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1n57rF-0004jb-37
 for xen-devel@lists.xenproject.org; Wed, 05 Jan 2022 15:05:45 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2f408df-6e38-11ec-9ce5-af14b9085ebd;
 Wed, 05 Jan 2022 16:05:43 +0100 (CET)
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
X-Inumbo-ID: f2f408df-6e38-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1641395143;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZXTQLpjyIHdmxKEd8Bn+X0CVDVjZBRFuc2aqHrvJjSQ=;
  b=XILxVrTzjZwadjFNmEZecDPIRt+oYEuhop+4mTVSB1e0q2XZvK7wTiiW
   AdNjAHFK9vCA4c9QXiytqsiIPMEX6xGSaqPBUGsL5nq4KdJLIK6X7/PGQ
   RlRRd1atiPZ3vJ9YsIEFBzsynBTG+1iWgN+wphEf3F2FPsQE50iVotwi2
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: IHr9hRoKqkhypN3YhTVEJDGgxEtXFZc/xrFVpV6/HIHATnAC8AjJ8Z3n3kAxnQ/gRvA53OjphR
 lCWHPMqNW/3YMzVQcrpVUAtScMYITaJVa34bU3Xmwj3JIe0gbE0VIT74jMKjZdlzn6SKnp/9oU
 v/Kx4cV8AspjyPqfdz+/jekD5EAQOseZMGpxCaUCDvVfemw7cBkCRy1aH7ZcwOVRbMmlK8w8+z
 1QkXYHQbP4nx6Cg3IYtpGYqhC9BRDAqCMs1/Lm+FUxS2jTJGQ24mnxgWX+vMKhNQokq9/TPewH
 SyCadOy1ptTnjS9H0qa05JLP
X-SBRS: 5.1
X-MesageID: 61292273
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RVfx06lAkmjzxgNsgiWnUMLo5gxDIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcCzqGbvbYMWr8c4txbo6//U9TsZLWytBiTgE6q39hFCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh29Y12YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 I50nLivYwZyBPDnxu00egJIOA5aNKITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQ6+EN
 pBDNmEHgBLoOgFIZ3AZU7cFv8z4o3jEa2BfuGK1qv9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zpDxdfONGBxD6t9nO3mvSJjS79QJgVFrCz6rhtmlL77mETBRhVRVa9ifzkkgi1XNc3F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc4FpOsklwgDW8Pf/vQ+wL3MUZRFlYdNz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbo1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb5N+RECnCBtJ6sybp1qHHa4
 hDofODEtogz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0nfx0wYp9aI2O3C
 KM2he+3zMQNVJdNRfUsC79d9uxwlfSwfTgbfq28giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmDOCLbimnk/P+efPOxaopUItbQLmghYRt/jf/m04M
 r93aqO39vmoeLGkP3SMr9dMdQtiwLpSLcmelvG7v9WremJOcFzNwdeImOtJl1VNk/sHm+HW0
 Gu6X0MEmlPziWeecVeBa2x5aaOpVpF69CppMSspNFeu+n4ifYfws/tPK8ppJeEqpL550Pp5b
 /gZYMHcUP5BfSvKpmYGZp7noY08KBny3VCSPzCoaSQUdoJ7Q1Cb4cftewbirXFcDie+ucYkj
 aen0wfXHcgKSwh4VZ6EY/Oz1VKh+3ManbsqDUfPJ9BSfmTq8ZRrdHOt3qNmfZlUJEyalDWA1
 guQDRMJnsX3otc4oIvTmKSJj4a1CO8iTEBUKHbWsOStPi7A82v9nYIZCLSUfSrQXX/f8bm5Y
 bkH1On1NfAKkQoYs4d4FLo3n6sy68G2+u1fxwVgWn7Kc06qGvVrJXzfhZtDsahEx7l4vwqqW
 x3QpokGaOvRYM61QkQMIAcFb/iY0aBGkzbf2v05PUHm6XIl57GAS0hTY0GBhSE1wGGZ62/5L
 TPNYPIr1jE=
IronPort-HdrOrdr: A9a23:8lWCU65eFGLycI67ywPXwMjXdLJyesId70hD6qhwISY6TiW9rb
 HLoB17726QtN9/YhwdcLy7VJVoBEmskqKdgrNhX4tKPjOHhILAFugLhuHfKn/bak7DH4ZmpM
 FdmsNFaeEYY2IUsfrH
X-IronPort-AV: E=Sophos;i="5.88,264,1635220800"; 
   d="scan'208";a="61292273"
Date: Wed, 5 Jan 2022 15:05:23 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 5/5] tools/xl: Fix potential deallocation bug
Message-ID: <YdWzswCszMN1IE20@perard>
References: <cover.1640590794.git.ehem+xen@m5p.com>
 <2d1335a4056558d172d9aa3e59982eb761647418.1640590794.git.ehem+xen@m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2d1335a4056558d172d9aa3e59982eb761647418.1640590794.git.ehem+xen@m5p.com>

On Thu, Dec 10, 2020 at 03:09:06PM -0800, Elliott Mitchell wrote:
> There is potential for the info and info_free variable's purposes to
> diverge.  If info was overwritten with a distinct value, yet info_free
> still needed deallocation a bug would occur on this line.  Preemptively
> address this issue (making use of divergent info/info_free values is
> under consideration).
> 
> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> ---
>  tools/xl/xl_info.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
> index 3647468420..938f06f1a8 100644
> --- a/tools/xl/xl_info.c
> +++ b/tools/xl/xl_info.c
> @@ -579,7 +579,7 @@ int main_list(int argc, char **argv)
>                       info, nb_domain);
>  
>      if (info_free)
> -        libxl_dominfo_list_free(info, nb_domain);
> +        libxl_dominfo_list_free(info_free, nb_domain);
>  
>      libxl_dominfo_dispose(&info_buf);
>  

I don't think this is the right thing to do with this patch.
libxl_dominfo_list_free() should use the same variable that is used by
libxl_list_domain(). What we want to free is the allocation made by
libxl_list_domain().

"info_free" in the function seems to be used as a boolean which tell
if "info" have been allocated or not. Actually, it probably say if
"info" is a list of "libxl_dominfo" or not.

So instead of just replacing "info" by "info_free" here, we should
instead store the result from libxl_list_domain() into a different
variable and free that, like it is done with "info_buf".

I hope that makes sense?

Thanks,

-- 
Anthony PERARD

