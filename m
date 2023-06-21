Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F217378A2
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 03:20:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552421.862500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBmW5-0007xU-Vt; Wed, 21 Jun 2023 01:20:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552421.862500; Wed, 21 Jun 2023 01:20:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBmW5-0007uG-Sg; Wed, 21 Jun 2023 01:20:13 +0000
Received: by outflank-mailman (input) for mailman id 552421;
 Wed, 21 Jun 2023 01:20:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZQ+K=CJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qBmW4-0007uA-Dc
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 01:20:12 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c364aa51-0fd1-11ee-b235-6b7b168915f2;
 Wed, 21 Jun 2023 03:20:10 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1EBDE61236;
 Wed, 21 Jun 2023 01:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42EE4C433C0;
 Wed, 21 Jun 2023 01:20:07 +0000 (UTC)
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
X-Inumbo-ID: c364aa51-0fd1-11ee-b235-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687310408;
	bh=omAn/XIjfD2yZiE+z+2Omnm2gibY6bG3uDeQkChYvVo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Uizqr80e+hUa+LKZ7hGl0obHBpHYjKFDfHDEs17+mtORd7wh96OnCzbEbSN4T2iH9
	 TBDUD7HjRxjzKuG6jUUWqGoupsJD8lo1Arp23ZVdNcYPLf6bOuI6EVrKoi85tGaCb3
	 J8IsQndid4DE7ENoFaaWZwwsN9A+oYfHHaucUwmwCL3HG71sBLvhEtSW4EkzwQ4kjb
	 RKGgNkYJ3qW67pxEj9pW4FmIbO+kKuaU98POrvnEqimbyd3wwl+ljVlODcrQ+1zC5f
	 ckTot5bhY+jCkT1peya5MTo6DWLzVxtTvt+lA6mYkR7mpFDmdzriIY3DvKZEc/vnCg
	 QwkHooAsVsqqA==
Date: Tue, 20 Jun 2023 18:20:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH] xen/decompress: Drop bool_t and use bool instead
In-Reply-To: <20230620175835.3908246-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2306201818380.897208@ubuntu-linux-20-04-desktop>
References: <20230620175835.3908246-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1067518987-1687310408=:897208"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1067518987-1687310408=:897208
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 20 Jun 2023, Andrew Cooper wrote:
> In particular, the libxg wrapper for unxz.c uses char for bool_t which is a
> major antipattern.  Luckily the code doesn't suffer from truncated values.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

FYI I checked patchew and it took the patch off of xen-devel, applied it
to a branch, triggered a gitlab-ci pipeline, and it was successful:
https://gitlab.com/xen-project/patchew/xen/-/pipelines/906050463

All of this without me having to do anything! We live in the future.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  .../libs/guest/xg_dom_decompress_unsafe_xz.c  |  1 -
>  xen/common/unxz.c                             |  2 +-
>  xen/common/xz/dec_bcj.c                       |  6 +++---
>  xen/common/xz/dec_lzma2.c                     | 20 +++++++++----------
>  xen/common/xz/dec_stream.c                    |  8 ++++----
>  xen/common/xz/lzma2.h                         |  2 +-
>  xen/common/xz/private.h                       |  2 +-
>  7 files changed, 20 insertions(+), 21 deletions(-)
> 
> diff --git a/tools/libs/guest/xg_dom_decompress_unsafe_xz.c b/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
> index fc4819874111..80eed912dd68 100644
> --- a/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
> +++ b/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
> @@ -11,7 +11,6 @@
>  // TODO
>  #define XZ_DEC_X86
>  
> -typedef char bool_t;
>  typedef uint8_t u8;
>  typedef uint16_t u16;
>  typedef uint32_t u32;
> diff --git a/xen/common/unxz.c b/xen/common/unxz.c
> index 17aead0adfe6..9586a4e5c94f 100644
> --- a/xen/common/unxz.c
> +++ b/xen/common/unxz.c
> @@ -166,7 +166,7 @@ int __init unxz(unsigned char *in, unsigned int in_size,
>  	struct xz_buf b;
>  	struct xz_dec *s;
>  	enum xz_ret ret;
> -	bool_t must_free_in = false;
> +	bool must_free_in = false;
>  
>  	xz_crc32_init();
>  
> diff --git a/xen/common/xz/dec_bcj.c b/xen/common/xz/dec_bcj.c
> index bfa498587ab8..bdc59770f8a6 100644
> --- a/xen/common/xz/dec_bcj.c
> +++ b/xen/common/xz/dec_bcj.c
> @@ -35,7 +35,7 @@ struct xz_dec_bcj {
>  	enum xz_ret ret;
>  
>  	/* True if we are operating in single-call mode. */
> -	bool_t single_call;
> +	bool single_call;
>  
>  	/*
>  	 * Absolute position relative to the beginning of the uncompressed
> @@ -87,7 +87,7 @@ static inline int __init bcj_x86_test_msbyte(uint8_t b)
>  
>  static size_t __init bcj_x86(struct xz_dec_bcj *s, uint8_t *buf, size_t size)
>  {
> -	static const bool_t mask_to_allowed_status[8]
> +	static const bool mask_to_allowed_status[8]
>  		= { true, true, true, false, true, false, false, false };
>  
>  	static const uint8_t mask_to_bit_num[8] = { 0, 1, 2, 2, 3, 3, 3, 3 };
> @@ -524,7 +524,7 @@ XZ_EXTERN enum xz_ret __init xz_dec_bcj_run(struct xz_dec_bcj *s,
>  	return s->ret;
>  }
>  
> -XZ_EXTERN struct xz_dec_bcj *__init xz_dec_bcj_create(bool_t single_call)
> +XZ_EXTERN struct xz_dec_bcj *__init xz_dec_bcj_create(bool single_call)
>  {
>  	struct xz_dec_bcj *s = malloc(sizeof(*s));
>  	if (s != NULL)
> diff --git a/xen/common/xz/dec_lzma2.c b/xen/common/xz/dec_lzma2.c
> index f80d8309f4c3..71359fab9f60 100644
> --- a/xen/common/xz/dec_lzma2.c
> +++ b/xen/common/xz/dec_lzma2.c
> @@ -241,13 +241,13 @@ struct lzma2_dec {
>  	 * True if dictionary reset is needed. This is false before
>  	 * the first chunk (LZMA or uncompressed).
>  	 */
> -	bool_t need_dict_reset;
> +	bool need_dict_reset;
>  
>  	/*
>  	 * True if new LZMA properties are needed. This is false
>  	 * before the first LZMA chunk.
>  	 */
> -	bool_t need_props;
> +	bool need_props;
>  };
>  
>  struct xz_dec_lzma2 {
> @@ -306,7 +306,7 @@ static void __init dict_limit(struct dictionary *dict, size_t out_max)
>  }
>  
>  /* Return true if at least one byte can be written into the dictionary. */
> -static inline bool_t __init dict_has_space(const struct dictionary *dict)
> +static inline bool __init dict_has_space(const struct dictionary *dict)
>  {
>  	return dict->pos < dict->limit;
>  }
> @@ -343,7 +343,7 @@ static inline void __init dict_put(struct dictionary *dict, uint8_t byte)
>   * invalid, false is returned. On success, true is returned and *len is
>   * updated to indicate how many bytes were left to be repeated.
>   */
> -static bool_t __init dict_repeat(struct dictionary *dict, uint32_t *len, uint32_t dist)
> +static bool __init dict_repeat(struct dictionary *dict, uint32_t *len, uint32_t dist)
>  {
>  	size_t back;
>  	uint32_t left;
> @@ -463,7 +463,7 @@ static void __init rc_reset(struct rc_dec *rc)
>   * Read the first five initial bytes into rc->code if they haven't been
>   * read already. (Yes, the first byte gets completely ignored.)
>   */
> -static bool_t __init rc_read_init(struct rc_dec *rc, struct xz_buf *b)
> +static bool __init rc_read_init(struct rc_dec *rc, struct xz_buf *b)
>  {
>  	while (rc->init_bytes_left > 0) {
>  		if (b->in_pos == b->in_size)
> @@ -477,7 +477,7 @@ static bool_t __init rc_read_init(struct rc_dec *rc, struct xz_buf *b)
>  }
>  
>  /* Return true if there may not be enough input for the next decoding loop. */
> -static inline bool_t __init rc_limit_exceeded(const struct rc_dec *rc)
> +static inline bool __init rc_limit_exceeded(const struct rc_dec *rc)
>  {
>  	return rc->in_pos > rc->in_limit;
>  }
> @@ -486,7 +486,7 @@ static inline bool_t __init rc_limit_exceeded(const struct rc_dec *rc)
>   * Return true if it is possible (from point of view of range decoder) that
>   * we have reached the end of the LZMA chunk.
>   */
> -static inline bool_t __init rc_is_finished(const struct rc_dec *rc)
> +static inline bool __init rc_is_finished(const struct rc_dec *rc)
>  {
>  	return rc->code == 0;
>  }
> @@ -736,7 +736,7 @@ static void __init lzma_rep_match(struct xz_dec_lzma2 *s, uint32_t pos_state)
>  }
>  
>  /* LZMA decoder core */
> -static bool_t __init lzma_main(struct xz_dec_lzma2 *s)
> +static bool __init lzma_main(struct xz_dec_lzma2 *s)
>  {
>  	uint32_t pos_state;
>  
> @@ -814,7 +814,7 @@ static void __init lzma_reset(struct xz_dec_lzma2 *s)
>   * from the decoded lp and pb values. On success, the LZMA decoder state is
>   * reset and true is returned.
>   */
> -static bool_t __init lzma_props(struct xz_dec_lzma2 *s, uint8_t props)
> +static bool __init lzma_props(struct xz_dec_lzma2 *s, uint8_t props)
>  {
>  	if (props > (4 * 5 + 4) * 9 + 8)
>  		return false;
> @@ -861,7 +861,7 @@ static bool_t __init lzma_props(struct xz_dec_lzma2 *s, uint8_t props)
>   * function. We decode a few bytes from the temporary buffer so that we can
>   * continue decoding from the caller-supplied input buffer again.
>   */
> -static bool_t __init lzma2_lzma(struct xz_dec_lzma2 *s, struct xz_buf *b)
> +static bool __init lzma2_lzma(struct xz_dec_lzma2 *s, struct xz_buf *b)
>  {
>  	size_t in_avail;
>  	uint32_t tmp;
> diff --git a/xen/common/xz/dec_stream.c b/xen/common/xz/dec_stream.c
> index b91d8362c19c..caea4f2596a1 100644
> --- a/xen/common/xz/dec_stream.c
> +++ b/xen/common/xz/dec_stream.c
> @@ -55,7 +55,7 @@ struct xz_dec {
>  	 * True if the next call to xz_dec_run() is allowed to return
>  	 * XZ_BUF_ERROR.
>  	 */
> -	bool_t allow_buf_error;
> +	bool allow_buf_error;
>  
>  	/* Information stored in Block Header */
>  	struct {
> @@ -132,7 +132,7 @@ struct xz_dec {
>  
>  #ifdef XZ_DEC_BCJ
>  	struct xz_dec_bcj *bcj;
> -	bool_t bcj_active;
> +	bool bcj_active;
>  #endif
>  };
>  
> @@ -154,7 +154,7 @@ static const uint8_t check_sizes[16] = {
>   * to copy into s->temp.buf. Return true once s->temp.pos has reached
>   * s->temp.size.
>   */
> -static bool_t __init fill_temp(struct xz_dec *s, struct xz_buf *b)
> +static bool __init fill_temp(struct xz_dec *s, struct xz_buf *b)
>  {
>  	size_t copy_size = min_t(size_t,
>  			b->in_size - b->in_pos, s->temp.size - s->temp.pos);
> @@ -367,7 +367,7 @@ static enum xz_ret __init crc32_validate(struct xz_dec *s, struct xz_buf *b)
>   * Skip over the Check field when the Check ID is not supported.
>   * Returns true once the whole Check field has been skipped over.
>   */
> -static bool_t __init check_skip(struct xz_dec *s, struct xz_buf *b)
> +static bool __init check_skip(struct xz_dec *s, struct xz_buf *b)
>  {
>  	while (s->pos < check_sizes[s->check_type]) {
>  		if (b->in_pos == b->in_size)
> diff --git a/xen/common/xz/lzma2.h b/xen/common/xz/lzma2.h
> index e0ef42e880a0..06a7edb4d720 100644
> --- a/xen/common/xz/lzma2.h
> +++ b/xen/common/xz/lzma2.h
> @@ -90,7 +90,7 @@ static inline void __init lzma_state_short_rep(enum lzma_state *state)
>  }
>  
>  /* Test if the previous symbol was a literal. */
> -static inline bool_t __init lzma_state_is_literal(enum lzma_state state)
> +static inline bool __init lzma_state_is_literal(enum lzma_state state)
>  {
>  	return state < LIT_STATES;
>  }
> diff --git a/xen/common/xz/private.h b/xen/common/xz/private.h
> index 511343fcc234..e6814250e84f 100644
> --- a/xen/common/xz/private.h
> +++ b/xen/common/xz/private.h
> @@ -237,7 +237,7 @@ XZ_EXTERN void xz_dec_lzma2_end(struct xz_dec_lzma2 *s);
>   * Allocate memory for BCJ decoders. xz_dec_bcj_reset() must be used before
>   * calling xz_dec_bcj_run().
>   */
> -XZ_EXTERN struct xz_dec_bcj *xz_dec_bcj_create(bool_t single_call);
> +XZ_EXTERN struct xz_dec_bcj *xz_dec_bcj_create(bool single_call);
>  
>  /*
>   * Decode the Filter ID of a BCJ filter. This implementation doesn't
> -- 
> 2.30.2
> 
--8323329-1067518987-1687310408=:897208--

