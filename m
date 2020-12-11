Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBC82D7FCC
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 21:12:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50880.89708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knolJ-0003tB-Ei; Fri, 11 Dec 2020 20:11:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50880.89708; Fri, 11 Dec 2020 20:11:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knolJ-0003sm-Bc; Fri, 11 Dec 2020 20:11:33 +0000
Received: by outflank-mailman (input) for mailman id 50880;
 Fri, 11 Dec 2020 20:11:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JY/4=FP=redhat.com=dgilbert@srs-us1.protection.inumbo.net>)
 id 1knolH-0003sg-UY
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 20:11:32 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 6a987fd0-289d-44f7-9fda-a26d7657b51e;
 Fri, 11 Dec 2020 20:11:30 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-3C6gZF0IO32OBrWN_dnmBQ-1; Fri, 11 Dec 2020 15:11:28 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E63F9801817;
 Fri, 11 Dec 2020 20:11:26 +0000 (UTC)
Received: from work-vm (ovpn-113-63.ams2.redhat.com [10.36.113.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4AEB10023B5;
 Fri, 11 Dec 2020 20:11:14 +0000 (UTC)
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
X-Inumbo-ID: 6a987fd0-289d-44f7-9fda-a26d7657b51e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607717490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mdUEd5LXHeWfYapDDVIeEiWas/cE1wwbAHHmrLJFBdw=;
	b=RdCDzPOLxQ6LxjH6gsOUeYzPA3ceWdpMpSTnSHaTAVjkocbT5AemWjNcSsITN7Hv3N5HWb
	64aaoScq4PSNZUOU7+/JzzB9GMtXluB3OwO2dZA9wfRDek2oyNWck/Bso9xsRpP6QD3LCT
	1VjMTBKtCGHmtbDUG+c/YT2U65JejdE=
X-MC-Unique: 3C6gZF0IO32OBrWN_dnmBQ-1
Date: Fri, 11 Dec 2020 20:11:11 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, philmd@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>, Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 06/13] virtiofsd: replace _Static_assert with
 QEMU_BUILD_BUG_ON
Message-ID: <20201211201111.GI3380@work-vm>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-7-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201210134752.780923-7-marcandre.lureau@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

* marcandre.lureau@redhat.com (marcandre.lureau@redhat.com) wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> This allows to get rid of a check for older GCC version (which was a bit
> bogus too since it was falling back on c++ version..)
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Yes I think that's OK; this is an imported file, but we've already
mangled it into QEMU's style and added includes etc.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tools/virtiofsd/fuse_common.h | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.h
> index 5aee5193eb..a2484060b6 100644
> --- a/tools/virtiofsd/fuse_common.h
> +++ b/tools/virtiofsd/fuse_common.h
> @@ -809,15 +809,6 @@ void fuse_remove_signal_handlers(struct fuse_session *se);
>   *
>   * On 32bit systems please add -D_FILE_OFFSET_BITS=64 to your compile flags!
>   */
> -
> -#if defined(__GNUC__) &&                                      \
> -    (__GNUC__ > 4 || __GNUC__ == 4 && __GNUC_MINOR__ >= 6) && \
> -    !defined __cplusplus
> -_Static_assert(sizeof(off_t) == 8, "fuse: off_t must be 64bit");
> -#else
> -struct _fuse_off_t_must_be_64bit_dummy_struct {
> -    unsigned _fuse_off_t_must_be_64bit:((sizeof(off_t) == 8) ? 1 : -1);
> -};
> -#endif
> +QEMU_BUILD_BUG_ON(sizeof(off_t) != 8);
>  
>  #endif /* FUSE_COMMON_H_ */
> -- 
> 2.29.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


