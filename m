Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9459B4F8209
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 16:45:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300842.513263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncTNR-0004Lf-KK; Thu, 07 Apr 2022 14:44:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300842.513263; Thu, 07 Apr 2022 14:44:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncTNR-0004IA-Gk; Thu, 07 Apr 2022 14:44:49 +0000
Received: by outflank-mailman (input) for mailman id 300842;
 Thu, 07 Apr 2022 14:44:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q2qr=UR=citrix.com=prvs=08907668d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ncTNQ-0004I4-3F
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 14:44:48 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4385fe71-b681-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 16:44:46 +0200 (CEST)
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
X-Inumbo-ID: 4385fe71-b681-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649342686;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lyEj5XMgguLgdNftO1hrdIpBh/48hWEyA25CgqLHDtI=;
  b=DCMauLMAx0V3cKsX9bec0EsZDo7r/W6ubEHVb1k7jiVKgVWvExOrBvFe
   TW2e6MsSFKhKcwvYBK9r2KmQ0WTU3ik+qfZjbR0Y7uA5S6BYELoQGzOks
   Ekfi6ekdpWXcq0wzSCwPZvsAqc6xNZhzDhKsKpVnDG7YV6lbmYap0eFxk
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 68270732
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:p+ZG5KqAOC1LqEjzCUv4WlA+EvVeBmJgZRIvgKrLsJaIsI4StFCzt
 garIBmGb/yJZjTwKIhyaIm+oxlTvMLTztQxHQVu/y00HiwSpJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvR4
 Yyq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBA6LqyMdEfyViMg5TAYZHpJP2I2jmmJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVIxDfFDfEgUNbbTr/D/9Nw1zYsnMFeW/3ZY
 qL1bBIxPE6fO0IUYD/7DroBw8u4pD7DbQdXpXfKn7cd2mzCw09+he2F3N39JYXRGJQ9clyjj
 n3C13T0BFcdLtP34SqI9Degi/HCmQv/WZkOD/uo+/hymlqRy2cPThoMWjOTo/ajjVWlc8lCM
 EFS8S0rxZXe72TyEIO7BUfh5ifZ4FhMALK8DtHW9imwxYyEwF+1OlIlYRN9Q916mP40VWUDg
 wrhc8zSORRjt7icSHS4/7iSrC+vNSV9EVLudRPoXiNevYC9/dhbYgbnC486TfXr1oGd9STYm
 WjikcQou1kEYSfnPY2f9EuPvT+jr4OhouUdtlSOBTLNAu+UieeYi22UBbrzsK4owGWxFADpU
 J04dy62tr1m4XalznHlfQn1NOv1j8tpyRWF6bKVI7Ev9i6251modp1K7Td1KS9Ba5hYKGW5P
 RKD5lwIvfe/2UdGi4ctPupd7Oxwk8Dd+SnNDKiIPrKinLAvHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6R4YUyUsxaIM6Nb75Fi9cDn3lmrUuKHMyT50n3gNK2OS/OIZ9YYQTmUwzMxP7dyOkj2
 40EbJXiJtQ2eLCWXxQ7BqZPdQtaciVhXcmeRg4+XrfrHzeK0VoJU5f5qY7NsaQ/90iJvo8kJ
 k2AZ3I=
IronPort-HdrOrdr: A9a23:KSrRxqPcmPOwgsBcTsOjsMiBIKoaSvp037Eqv3oRdfVwSL3+qy
 nOpoV+6faaslossR0b9uxofZPwJ080lqQFhLX5X43SPzUO0VHAROoJgLcKgQeQeREWntQtrJ
 uIGJIfNDSfNzZHsfo=
X-IronPort-AV: E=Sophos;i="5.90,242,1643691600"; 
   d="scan'208";a="68270732"
Date: Thu, 7 Apr 2022 15:44:39 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/libs/light: update xenstore entry when setting max
 domain memory
Message-ID: <Yk74172+jHIn4PJW@perard.uk.xensource.com>
References: <20220331070755.10894-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220331070755.10894-1-jgross@suse.com>

On Thu, Mar 31, 2022 at 09:07:55AM +0200, Juergen Gross wrote:
> libxl_domain_setmaxmem() should update the domain's memory/static-max
> Xenstore node, as otherwise "xl mem-set" won't be able to set the
> memory size to the new maximum.

`xl mem-set` doesn't call libxl_domain_setmaxmem(), but calls
libxl_set_memory_target().

Or maybe you are speaking about `xl mem-max` followed by `xl mem-set`?
In this case, it is documented in `man 1 xl` that `mem-max` has no
effect to `mem-set`.

quote from man, about `xl mem-max`:
    It is allowed to be higher than the configured maximum
    memory size of the domain (B<maxmem> parameter in the domain's
    configuration). Note however that the initial B<maxmem> value is still
    used as an upper limit for B<xl mem-set>.  Also note that calling B<xl
    mem-set> will reset this value.

> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  tools/libs/light/libxl_mem.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/tools/libs/light/libxl_mem.c b/tools/libs/light/libxl_mem.c
> index c739d00f39..2f4f9d4a4a 100644
> --- a/tools/libs/light/libxl_mem.c
> +++ b/tools/libs/light/libxl_mem.c
> @@ -82,6 +82,15 @@ int libxl_domain_setmaxmem(libxl_ctx *ctx, uint32_t domid, uint64_t max_memkb)

There's a comment on this functions:
    /*
     * Set the maximum memory size of the domain in the hypervisor. There is no
     * change of the current memory size involved. The specified memory size can
     * even be above the configured maxmem size of the domain, but the related
     * Xenstore entry memory/static-max isn't modified!
     */
    int libxl_domain_setmaxmem(libxl_ctx *ctx, uint32_t domid, uint64_t max_memkb)

So it was already known that "static-max" wasn't set.
At the very least, this comment needs updating.

>          goto out;
>      }
>  
> +    rc = libxl__xs_printf(gc, XBT_NULL,
> +                          GCSPRINTF("%s/memory/static-max", dompath),
> +                          "%"PRIu64, max_memkb);
> +    if (rc != 0) {
> +        LOGED(ERROR, domid, "Couldn't set %s/memory/static-max, rc=%d\n",
> +              dompath, rc);
> +        goto out;



So, I don't know whether increasing "static-max" is fine or not, but
according to the documentation, it isn't expected.

Is a guest fine with "static-max" been changed?

If yes, there's documentation and comments that needs to change with the
code change.

Thanks,

-- 
Anthony PERARD

