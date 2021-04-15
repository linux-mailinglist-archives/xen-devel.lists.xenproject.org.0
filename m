Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5153608B3
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 14:00:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111090.212378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX0f2-0007ma-Mx; Thu, 15 Apr 2021 11:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111090.212378; Thu, 15 Apr 2021 11:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX0f2-0007mB-J5; Thu, 15 Apr 2021 11:59:52 +0000
Received: by outflank-mailman (input) for mailman id 111090;
 Thu, 15 Apr 2021 11:59:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lX0f1-0007m6-3q
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 11:59:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lX0ez-0007Ka-5k; Thu, 15 Apr 2021 11:59:49 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lX0ey-00027t-IS; Thu, 15 Apr 2021 11:59:49 +0000
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
	bh=qikvwjDaWZPMjLIsf/lGdnzuUl/YRS5fKFfVpZHvCcg=; b=Vo9xDzRvGvvqVvCFR3JoGkSw3d
	L3s8TeqSYIQ1AhgieAMmcSTpTRSCyw62p86CQPMrd5nbd0NUheGd0p8H4WGNRhCyfye0aS4tPCwd9
	TNO5st2I/nS7rrdJVLssJx+q+sa6/CxuBf//nZhfV/H3pKklDVW4J+SUjAYtGVWxGGcs=;
Subject: Re: [PATCH v3 13/15] unzstd: replace INIT{,DATA} and STATIC
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
 <19f12930-df0e-5a00-9e5e-53edffcf51d7@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <467ed62e-e5c3-0a08-b9a7-5b4e913b3c90@xen.org>
Date: Thu, 15 Apr 2021 12:59:46 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <19f12930-df0e-5a00-9e5e-53edffcf51d7@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 26/01/2021 09:52, Jan Beulich wrote:
> With xen/common/decompress.h now agreeing in both build modes about
> what STATIC expands to, there's no need for this abstraction anymore.

Shouldn't you also mention "INIT" and "INITDATA" here?

Cheers,

> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: New.
> 
> --- a/xen/common/unzstd.c
> +++ b/xen/common/unzstd.c
> @@ -71,7 +71,7 @@
>    */
>   #define ZSTD_IOBUF_SIZE		(1 << 17)
>   
> -static int INIT handle_zstd_error(size_t ret, void (*error)(const char *x))
> +static int __init handle_zstd_error(size_t ret, void (*error)(const char *x))
>   {
>   	const int err = ZSTD_getErrorCode(ret);
>   
> @@ -102,9 +102,9 @@ static int INIT handle_zstd_error(size_t
>    * We can allocate less memory (no circular buffer for the sliding window),
>    * and avoid some memcpy() calls.
>    */
> -static int INIT decompress_single(const u8 *in_buf, long in_len, u8 *out_buf,
> -				  long out_len, unsigned int *in_pos,
> -				  void (*error)(const char *x))
> +static int __init decompress_single(const u8 *in_buf, long in_len, u8 *out_buf,
> +				    long out_len, unsigned int *in_pos,
> +				    void (*error)(const char *x))
>   {
>   	const size_t wksp_size = ZSTD_DCtxWorkspaceBound();
>   	void *wksp = large_malloc(wksp_size);
> @@ -142,11 +142,11 @@ out:
>   	return err;
>   }
>   
> -int INIT unzstd(unsigned char *in_buf, unsigned int in_len,
> -	        int (*fill)(void*, unsigned int),
> -	        int (*flush)(void*, unsigned int),
> -	        unsigned char *out_buf, unsigned int *in_pos,
> -	        void (*error)(const char *x))
> +int __init unzstd(unsigned char *in_buf, unsigned int in_len,
> +		  int (*fill)(void*, unsigned int),
> +		  int (*flush)(void*, unsigned int),
> +		  unsigned char *out_buf, unsigned int *in_pos,
> +		  void (*error)(const char *x))
>   {
>   	ZSTD_inBuffer in;
>   	ZSTD_outBuffer out;
> --- a/xen/common/zstd/decompress.c
> +++ b/xen/common/zstd/decompress.c
> @@ -46,7 +46,7 @@
>   /*_*******************************************************
>   *  Memory operations
>   **********************************************************/
> -static void INIT ZSTD_copy4(void *dst, const void *src) { memcpy(dst, src, 4); }
> +static void __init ZSTD_copy4(void *dst, const void *src) { memcpy(dst, src, 4); }
>   
>   /*-*************************************************************
>   *   Context management
> @@ -98,12 +98,12 @@ struct ZSTD_DCtx_s {
>   	BYTE headerBuffer[ZSTD_FRAMEHEADERSIZE_MAX];
>   }; /* typedef'd to ZSTD_DCtx within "zstd.h" */
>   
> -STATIC size_t INIT ZSTD_DCtxWorkspaceBound(void)
> +static size_t __init ZSTD_DCtxWorkspaceBound(void)
>   {
>   	return ZSTD_ALIGN(sizeof(ZSTD_stack)) + ZSTD_ALIGN(sizeof(ZSTD_DCtx));
>   }
>   
> -STATIC size_t INIT ZSTD_decompressBegin(ZSTD_DCtx *dctx)
> +static size_t __init ZSTD_decompressBegin(ZSTD_DCtx *dctx)
>   {
>   	dctx->expected = ZSTD_frameHeaderSize_prefix;
>   	dctx->stage = ZSTDds_getFrameHeaderSize;
> @@ -123,7 +123,7 @@ STATIC size_t INIT ZSTD_decompressBegin(
>   	return 0;
>   }
>   
> -STATIC ZSTD_DCtx *INIT ZSTD_createDCtx_advanced(ZSTD_customMem customMem)
> +static ZSTD_DCtx *__init ZSTD_createDCtx_advanced(ZSTD_customMem customMem)
>   {
>   	ZSTD_DCtx *dctx;
>   
> @@ -138,13 +138,13 @@ STATIC ZSTD_DCtx *INIT ZSTD_createDCtx_a
>   	return dctx;
>   }
>   
> -STATIC ZSTD_DCtx *INIT ZSTD_initDCtx(void *workspace, size_t workspaceSize)
> +static ZSTD_DCtx *__init ZSTD_initDCtx(void *workspace, size_t workspaceSize)
>   {
>   	ZSTD_customMem const stackMem = ZSTD_initStack(workspace, workspaceSize);
>   	return ZSTD_createDCtx_advanced(stackMem);
>   }
>   
> -size_t INIT ZSTD_freeDCtx(ZSTD_DCtx *dctx)
> +size_t __init ZSTD_freeDCtx(ZSTD_DCtx *dctx)
>   {
>   	if (dctx == NULL)
>   		return 0; /* support free on NULL */
> @@ -153,15 +153,15 @@ size_t INIT ZSTD_freeDCtx(ZSTD_DCtx *dct
>   }
>   
>   #ifdef BUILD_DEAD_CODE
> -void INIT ZSTD_copyDCtx(ZSTD_DCtx *dstDCtx, const ZSTD_DCtx *srcDCtx)
> +void __init ZSTD_copyDCtx(ZSTD_DCtx *dstDCtx, const ZSTD_DCtx *srcDCtx)
>   {
>   	size_t const workSpaceSize = (ZSTD_BLOCKSIZE_ABSOLUTEMAX + WILDCOPY_OVERLENGTH) + ZSTD_frameHeaderSize_max;
>   	memcpy(dstDCtx, srcDCtx, sizeof(ZSTD_DCtx) - workSpaceSize); /* no need to copy workspace */
>   }
>   #endif
>   
> -STATIC size_t ZSTD_findFrameCompressedSize(const void *src, size_t srcSize);
> -STATIC size_t ZSTD_decompressBegin_usingDict(ZSTD_DCtx *dctx, const void *dict,
> +static size_t ZSTD_findFrameCompressedSize(const void *src, size_t srcSize);
> +static size_t ZSTD_decompressBegin_usingDict(ZSTD_DCtx *dctx, const void *dict,
>   	size_t dictSize);
>   
>   static void ZSTD_refDDict(ZSTD_DCtx *dstDCtx, const ZSTD_DDict *ddict);
> @@ -176,7 +176,7 @@ static void ZSTD_refDDict(ZSTD_DCtx *dst
>    *  Note : Frame Identifier is 4 bytes. If `size < 4`, @return will always be 0.
>    *  Note 2 : Legacy Frame Identifiers are considered valid only if Legacy Support is enabled.
>    *  Note 3 : Skippable Frame Identifiers are considered valid. */
> -unsigned INIT ZSTD_isFrame(const void *buffer, size_t size)
> +unsigned __init ZSTD_isFrame(const void *buffer, size_t size)
>   {
>   	if (size < 4)
>   		return 0;
> @@ -194,7 +194,7 @@ unsigned INIT ZSTD_isFrame(const void *b
>   /** ZSTD_frameHeaderSize() :
>   *   srcSize must be >= ZSTD_frameHeaderSize_prefix.
>   *   @return : size of the Frame Header */
> -static size_t INIT ZSTD_frameHeaderSize(const void *src, size_t srcSize)
> +static size_t __init ZSTD_frameHeaderSize(const void *src, size_t srcSize)
>   {
>   	if (srcSize < ZSTD_frameHeaderSize_prefix)
>   		return ERROR(srcSize_wrong);
> @@ -212,7 +212,7 @@ static size_t INIT ZSTD_frameHeaderSize(
>   *   @return : 0, `fparamsPtr` is correctly filled,
>   *            >0, `srcSize` is too small, result is expected `srcSize`,
>   *             or an error code, which can be tested using ZSTD_isError() */
> -STATIC size_t INIT ZSTD_getFrameParams(ZSTD_frameParams *fparamsPtr, const void *src, size_t srcSize)
> +static size_t __init ZSTD_getFrameParams(ZSTD_frameParams *fparamsPtr, const void *src, size_t srcSize)
>   {
>   	const BYTE *ip = (const BYTE *)src;
>   
> @@ -303,7 +303,7 @@ STATIC size_t INIT ZSTD_getFrameParams(Z
>   *   @return : decompressed size of the single frame pointed to be `src` if known, otherwise
>   *             - ZSTD_CONTENTSIZE_UNKNOWN if the size cannot be determined
>   *             - ZSTD_CONTENTSIZE_ERROR if an error occurred (e.g. invalid magic number, srcSize too small) */
> -unsigned long long INIT ZSTD_getFrameContentSize(const void *src, size_t srcSize)
> +unsigned long long __init ZSTD_getFrameContentSize(const void *src, size_t srcSize)
>   {
>   	{
>   		ZSTD_frameParams fParams;
> @@ -325,7 +325,7 @@ unsigned long long INIT ZSTD_getFrameCon
>    *  `srcSize` must be the exact length of some number of ZSTD compressed and/or
>    *      skippable frames
>    *  @return : decompressed size of the frames contained */
> -unsigned long long INIT ZSTD_findDecompressedSize(const void *src, size_t srcSize)
> +unsigned long long __init ZSTD_findDecompressedSize(const void *src, size_t srcSize)
>   {
>   	{
>   		unsigned long long totalDstSize = 0;
> @@ -379,7 +379,7 @@ unsigned long long INIT ZSTD_findDecompr
>   /** ZSTD_decodeFrameHeader() :
>   *   `headerSize` must be the size provided by ZSTD_frameHeaderSize().
>   *   @return : 0 if success, or an error code, which can be tested using ZSTD_isError() */
> -static size_t INIT ZSTD_decodeFrameHeader(ZSTD_DCtx *dctx, const void *src, size_t headerSize)
> +static size_t __init ZSTD_decodeFrameHeader(ZSTD_DCtx *dctx, const void *src, size_t headerSize)
>   {
>   	size_t const result = ZSTD_getFrameParams(&(dctx->fParams), src, headerSize);
>   	if (ZSTD_isError(result))
> @@ -401,7 +401,7 @@ typedef struct {
>   
>   /*! ZSTD_getcBlockSize() :
>   *   Provides the size of compressed block from block header `src` */
> -STATIC size_t INIT ZSTD_getcBlockSize(const void *src, size_t srcSize, blockProperties_t *bpPtr)
> +static size_t __init ZSTD_getcBlockSize(const void *src, size_t srcSize, blockProperties_t *bpPtr)
>   {
>   	if (srcSize < ZSTD_blockHeaderSize)
>   		return ERROR(srcSize_wrong);
> @@ -419,7 +419,7 @@ STATIC size_t INIT ZSTD_getcBlockSize(co
>   	}
>   }
>   
> -static size_t INIT ZSTD_copyRawBlock(void *dst, size_t dstCapacity, const void *src, size_t srcSize)
> +static size_t __init ZSTD_copyRawBlock(void *dst, size_t dstCapacity, const void *src, size_t srcSize)
>   {
>   	if (srcSize > dstCapacity)
>   		return ERROR(dstSize_tooSmall);
> @@ -427,7 +427,7 @@ static size_t INIT ZSTD_copyRawBlock(voi
>   	return srcSize;
>   }
>   
> -static size_t INIT ZSTD_setRleBlock(void *dst, size_t dstCapacity, const void *src, size_t srcSize, size_t regenSize)
> +static size_t __init ZSTD_setRleBlock(void *dst, size_t dstCapacity, const void *src, size_t srcSize, size_t regenSize)
>   {
>   	if (srcSize != 1)
>   		return ERROR(srcSize_wrong);
> @@ -439,7 +439,7 @@ static size_t INIT ZSTD_setRleBlock(void
>   
>   /*! ZSTD_decodeLiteralsBlock() :
>   	@return : nb of bytes read from src (< srcSize ) */
> -STATIC size_t INIT ZSTD_decodeLiteralsBlock(ZSTD_DCtx *dctx, const void *src, size_t srcSize) /* note : srcSize < BLOCKSIZE */
> +static size_t __init ZSTD_decodeLiteralsBlock(ZSTD_DCtx *dctx, const void *src, size_t srcSize) /* note : srcSize < BLOCKSIZE */
>   {
>   	if (srcSize < MIN_CBLOCK_SIZE)
>   		return ERROR(corruption_detected);
> @@ -759,10 +759,10 @@ static const FSE_decode_t4 OF_defaultDTa
>   	@return : nb bytes read from src,
>   			  or an error code if it fails, testable with ZSTD_isError()
>   */
> -static size_t INIT ZSTD_buildSeqTable(FSE_DTable *DTableSpace, const FSE_DTable **DTablePtr,
> -				      symbolEncodingType_e type, U32 max, U32 maxLog, const void *src,
> -				      size_t srcSize, const FSE_decode_t4 *defaultTable,
> -				      U32 flagRepeatTable, void *workspace, size_t workspaceSize)
> +static size_t __init ZSTD_buildSeqTable(FSE_DTable *DTableSpace, const FSE_DTable **DTablePtr,
> +					symbolEncodingType_e type, U32 max, U32 maxLog, const void *src,
> +					size_t srcSize, const FSE_decode_t4 *defaultTable,
> +					U32 flagRepeatTable, void *workspace, size_t workspaceSize)
>   {
>   	const void *const tmpPtr = defaultTable; /* bypass strict aliasing */
>   	switch (type) {
> @@ -803,7 +803,7 @@ static size_t INIT ZSTD_buildSeqTable(FS
>   	}
>   }
>   
> -STATIC size_t INIT ZSTD_decodeSeqHeaders(ZSTD_DCtx *dctx, int *nbSeqPtr, const void *src, size_t srcSize)
> +static size_t __init ZSTD_decodeSeqHeaders(ZSTD_DCtx *dctx, int *nbSeqPtr, const void *src, size_t srcSize)
>   {
>   	const BYTE *const istart = (const BYTE *const)src;
>   	const BYTE *const iend = istart + srcSize;
> @@ -940,7 +940,7 @@ size_t ZSTD_execSequenceLast7(BYTE *op,
>   	return sequenceLength;
>   }
>   
> -static seq_t INIT ZSTD_decodeSequence(seqState_t *seqState)
> +static seq_t __init ZSTD_decodeSequence(seqState_t *seqState)
>   {
>   	seq_t seq;
>   
> @@ -1102,7 +1102,7 @@ size_t ZSTD_execSequence(BYTE *op, BYTE
>   	return sequenceLength;
>   }
>   
> -static size_t INIT ZSTD_decompressSequences(ZSTD_DCtx *dctx, void *dst, size_t maxDstSize, const void *seqStart, size_t seqSize)
> +static size_t __init ZSTD_decompressSequences(ZSTD_DCtx *dctx, void *dst, size_t maxDstSize, const void *seqStart, size_t seqSize)
>   {
>   	const BYTE *ip = (const BYTE *)seqStart;
>   	const BYTE *const iend = ip + seqSize;
> @@ -1262,7 +1262,7 @@ FORCE_INLINE seq_t ZSTD_decodeSequenceLo
>   	return seq;
>   }
>   
> -static seq_t INIT ZSTD_decodeSequenceLong(seqState_t *seqState, unsigned const windowSize)
> +static seq_t __init ZSTD_decodeSequenceLong(seqState_t *seqState, unsigned const windowSize)
>   {
>   	if (ZSTD_highbit32(windowSize) > STREAM_ACCUMULATOR_MIN) {
>   		return ZSTD_decodeSequenceLong_generic(seqState, 1);
> @@ -1272,9 +1272,9 @@ static seq_t INIT ZSTD_decodeSequenceLon
>   }
>   
>   FORCE_INLINE
> -size_t INIT ZSTD_execSequenceLong(BYTE *op, BYTE *const oend, seq_t sequence, const BYTE **litPtr,
> -				  const BYTE *const litLimit, const BYTE *const base,
> -				  const BYTE *const vBase, const BYTE *const dictEnd)
> +size_t __init ZSTD_execSequenceLong(BYTE *op, BYTE *const oend, seq_t sequence, const BYTE **litPtr,
> +				    const BYTE *const litLimit, const BYTE *const base,
> +				    const BYTE *const vBase, const BYTE *const dictEnd)
>   {
>   	BYTE *const oLitEnd = op + sequence.litLength;
>   	size_t const sequenceLength = sequence.litLength + sequence.matchLength;
> @@ -1358,7 +1358,7 @@ size_t INIT ZSTD_execSequenceLong(BYTE *
>   	return sequenceLength;
>   }
>   
> -static size_t INIT ZSTD_decompressSequencesLong(ZSTD_DCtx *dctx, void *dst, size_t maxDstSize, const void *seqStart, size_t seqSize)
> +static size_t __init ZSTD_decompressSequencesLong(ZSTD_DCtx *dctx, void *dst, size_t maxDstSize, const void *seqStart, size_t seqSize)
>   {
>   	const BYTE *ip = (const BYTE *)seqStart;
>   	const BYTE *const iend = ip + seqSize;
> @@ -1455,7 +1455,7 @@ static size_t INIT ZSTD_decompressSequen
>   	return op - ostart;
>   }
>   
> -static size_t INIT ZSTD_decompressBlock_internal(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize)
> +static size_t __init ZSTD_decompressBlock_internal(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize)
>   { /* blockType == blockCompressed */
>   	const BYTE *ip = (const BYTE *)src;
>   
> @@ -1479,7 +1479,7 @@ static size_t INIT ZSTD_decompressBlock_
>   	return ZSTD_decompressSequences(dctx, dst, dstCapacity, ip, srcSize);
>   }
>   
> -static void INIT ZSTD_checkContinuity(ZSTD_DCtx *dctx, const void *dst)
> +static void __init ZSTD_checkContinuity(ZSTD_DCtx *dctx, const void *dst)
>   {
>   	if (dst != dctx->previousDstEnd) { /* not contiguous */
>   		dctx->dictEnd = dctx->previousDstEnd;
> @@ -1490,7 +1490,7 @@ static void INIT ZSTD_checkContinuity(ZS
>   }
>   
>   #ifdef BUILD_DEAD_CODE
> -size_t INIT ZSTD_decompressBlock(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize)
> +size_t __init ZSTD_decompressBlock(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize)
>   {
>   	size_t dSize;
>   	ZSTD_checkContinuity(dctx, dst);
> @@ -1501,7 +1501,7 @@ size_t INIT ZSTD_decompressBlock(ZSTD_DC
>   
>   /** ZSTD_insertBlock() :
>   	insert `src` block into `dctx` history. Useful to track uncompressed blocks. */
> -size_t INIT ZSTD_insertBlock(ZSTD_DCtx *dctx, const void *blockStart, size_t blockSize)
> +size_t __init ZSTD_insertBlock(ZSTD_DCtx *dctx, const void *blockStart, size_t blockSize)
>   {
>   	ZSTD_checkContinuity(dctx, blockStart);
>   	dctx->previousDstEnd = (const char *)blockStart + blockSize;
> @@ -1509,7 +1509,7 @@ size_t INIT ZSTD_insertBlock(ZSTD_DCtx *
>   }
>   #endif /* BUILD_DEAD_CODE */
>   
> -STATIC size_t INIT ZSTD_generateNxBytes(void *dst, size_t dstCapacity, BYTE byte, size_t length)
> +static size_t __init ZSTD_generateNxBytes(void *dst, size_t dstCapacity, BYTE byte, size_t length)
>   {
>   	if (length > dstCapacity)
>   		return ERROR(dstSize_tooSmall);
> @@ -1522,7 +1522,7 @@ STATIC size_t INIT ZSTD_generateNxBytes(
>    *  `src` must point to the start of a ZSTD frame, ZSTD legacy frame, or skippable frame
>    *  `srcSize` must be at least as large as the frame contained
>    *  @return : the compressed size of the frame starting at `src` */
> -STATIC size_t INIT ZSTD_findFrameCompressedSize(const void *src, size_t srcSize)
> +static size_t __init ZSTD_findFrameCompressedSize(const void *src, size_t srcSize)
>   {
>   	if (srcSize >= ZSTD_skippableHeaderSize && (ZSTD_readLE32(src) & 0xFFFFFFF0U) == ZSTD_MAGIC_SKIPPABLE_START) {
>   		return ZSTD_skippableHeaderSize + ZSTD_readLE32((const BYTE *)src + 4);
> @@ -1578,7 +1578,7 @@ STATIC size_t INIT ZSTD_findFrameCompres
>   
>   /*! ZSTD_decompressFrame() :
>   *   @dctx must be properly initialized */
> -static size_t INIT ZSTD_decompressFrame(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void **srcPtr, size_t *srcSizePtr)
> +static size_t __init ZSTD_decompressFrame(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void **srcPtr, size_t *srcSizePtr)
>   {
>   	const BYTE *ip = (const BYTE *)(*srcPtr);
>   	BYTE *const ostart = (BYTE * const)dst;
> @@ -1655,7 +1655,7 @@ static size_t INIT ZSTD_decompressFrame(
>   static const void *ZSTD_DDictDictContent(const ZSTD_DDict *ddict);
>   static size_t ZSTD_DDictDictSize(const ZSTD_DDict *ddict);
>   
> -static size_t INIT ZSTD_decompressMultiFrame(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize, const void *dict, size_t dictSize,
> +static size_t __init ZSTD_decompressMultiFrame(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize, const void *dict, size_t dictSize,
>   					const ZSTD_DDict *ddict)
>   {
>   	void *const dststart = dst;
> @@ -1719,12 +1719,12 @@ static size_t INIT ZSTD_decompressMultiF
>   	return (BYTE *)dst - (BYTE *)dststart;
>   }
>   
> -STATIC size_t INIT ZSTD_decompress_usingDict(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize, const void *dict, size_t dictSize)
> +static size_t __init ZSTD_decompress_usingDict(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize, const void *dict, size_t dictSize)
>   {
>   	return ZSTD_decompressMultiFrame(dctx, dst, dstCapacity, src, srcSize, dict, dictSize, NULL);
>   }
>   
> -STATIC size_t INIT ZSTD_decompressDCtx(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize)
> +static size_t __init ZSTD_decompressDCtx(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize)
>   {
>   	return ZSTD_decompress_usingDict(dctx, dst, dstCapacity, src, srcSize, NULL, 0);
>   }
> @@ -1733,12 +1733,12 @@ STATIC size_t INIT ZSTD_decompressDCtx(Z
>   *   Advanced Streaming Decompression API
>   *   Bufferless and synchronous
>   ****************************************/
> -STATIC size_t INIT ZSTD_nextSrcSizeToDecompress(ZSTD_DCtx *dctx)
> +static size_t __init ZSTD_nextSrcSizeToDecompress(ZSTD_DCtx *dctx)
>   {
>   	return dctx->expected;
>   }
>   
> -STATIC ZSTD_nextInputType_e INIT ZSTD_nextInputType(ZSTD_DCtx *dctx)
> +static ZSTD_nextInputType_e __init ZSTD_nextInputType(ZSTD_DCtx *dctx)
>   {
>   	switch (dctx->stage) {
>   	default: /* should not happen */
> @@ -1753,12 +1753,12 @@ STATIC ZSTD_nextInputType_e INIT ZSTD_ne
>   	}
>   }
>   
> -int INIT ZSTD_isSkipFrame(ZSTD_DCtx *dctx) { return dctx->stage == ZSTDds_skipFrame; } /* for zbuff */
> +int __init ZSTD_isSkipFrame(ZSTD_DCtx *dctx) { return dctx->stage == ZSTDds_skipFrame; } /* for zbuff */
>   
>   /** ZSTD_decompressContinue() :
>   *   @return : nb of bytes generated into `dst` (necessarily <= `dstCapacity)
>   *             or an error code, which can be tested using ZSTD_isError() */
> -STATIC size_t INIT ZSTD_decompressContinue(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize)
> +static size_t __init ZSTD_decompressContinue(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize)
>   {
>   	/* Sanity check */
>   	if (srcSize != dctx->expected)
> @@ -1877,7 +1877,7 @@ STATIC size_t INIT ZSTD_decompressContin
>   	}
>   }
>   
> -static size_t INIT ZSTD_refDictContent(ZSTD_DCtx *dctx, const void *dict, size_t dictSize)
> +static size_t __init ZSTD_refDictContent(ZSTD_DCtx *dctx, const void *dict, size_t dictSize)
>   {
>   	dctx->dictEnd = dctx->previousDstEnd;
>   	dctx->vBase = (const char *)dict - ((const char *)(dctx->previousDstEnd) - (const char *)(dctx->base));
> @@ -1889,7 +1889,7 @@ static size_t INIT ZSTD_refDictContent(Z
>   /* ZSTD_loadEntropy() :
>    * dict : must point at beginning of a valid zstd dictionary
>    * @return : size of entropy tables read */
> -static size_t INIT ZSTD_loadEntropy(ZSTD_entropyTables_t *entropy, const void *const dict, size_t const dictSize)
> +static size_t __init ZSTD_loadEntropy(ZSTD_entropyTables_t *entropy, const void *const dict, size_t const dictSize)
>   {
>   	const BYTE *dictPtr = (const BYTE *)dict;
>   	const BYTE *const dictEnd = dictPtr + dictSize;
> @@ -1958,7 +1958,7 @@ static size_t INIT ZSTD_loadEntropy(ZSTD
>   	return dictPtr - (const BYTE *)dict;
>   }
>   
> -static size_t INIT ZSTD_decompress_insertDictionary(ZSTD_DCtx *dctx, const void *dict, size_t dictSize)
> +static size_t __init ZSTD_decompress_insertDictionary(ZSTD_DCtx *dctx, const void *dict, size_t dictSize)
>   {
>   	if (dictSize < 8)
>   		return ZSTD_refDictContent(dctx, dict, dictSize);
> @@ -1984,7 +1984,7 @@ static size_t INIT ZSTD_decompress_inser
>   	return ZSTD_refDictContent(dctx, dict, dictSize);
>   }
>   
> -STATIC size_t INIT ZSTD_decompressBegin_usingDict(ZSTD_DCtx *dctx, const void *dict, size_t dictSize)
> +static size_t __init ZSTD_decompressBegin_usingDict(ZSTD_DCtx *dctx, const void *dict, size_t dictSize)
>   {
>   	CHECK_F(ZSTD_decompressBegin(dctx));
>   	if (dict && dictSize)
> @@ -2005,14 +2005,14 @@ struct ZSTD_DDict_s {
>   }; /* typedef'd to ZSTD_DDict within "zstd.h" */
>   
>   #ifdef BUILD_DEAD_CODE
> -size_t INIT ZSTD_DDictWorkspaceBound(void) { return ZSTD_ALIGN(sizeof(ZSTD_stack)) + ZSTD_ALIGN(sizeof(ZSTD_DDict)); }
> +size_t __init ZSTD_DDictWorkspaceBound(void) { return ZSTD_ALIGN(sizeof(ZSTD_stack)) + ZSTD_ALIGN(sizeof(ZSTD_DDict)); }
>   #endif
>   
> -static const void *INIT ZSTD_DDictDictContent(const ZSTD_DDict *ddict) { return ddict->dictContent; }
> +static const void *__init ZSTD_DDictDictContent(const ZSTD_DDict *ddict) { return ddict->dictContent; }
>   
> -static size_t INIT ZSTD_DDictDictSize(const ZSTD_DDict *ddict) { return ddict->dictSize; }
> +static size_t __init ZSTD_DDictDictSize(const ZSTD_DDict *ddict) { return ddict->dictSize; }
>   
> -static void INIT ZSTD_refDDict(ZSTD_DCtx *dstDCtx, const ZSTD_DDict *ddict)
> +static void __init ZSTD_refDDict(ZSTD_DCtx *dstDCtx, const ZSTD_DDict *ddict)
>   {
>   	ZSTD_decompressBegin(dstDCtx); /* init */
>   	if (ddict) {		       /* support refDDict on NULL */
> @@ -2039,7 +2039,7 @@ static void INIT ZSTD_refDDict(ZSTD_DCtx
>   }
>   
>   #ifdef BUILD_DEAD_CODE
> -static size_t INIT ZSTD_loadEntropy_inDDict(ZSTD_DDict *ddict)
> +static size_t __init ZSTD_loadEntropy_inDDict(ZSTD_DDict *ddict)
>   {
>   	ddict->dictID = 0;
>   	ddict->entropyPresent = 0;
> @@ -2058,7 +2058,7 @@ static size_t INIT ZSTD_loadEntropy_inDD
>   	return 0;
>   }
>   
> -static ZSTD_DDict *INIT ZSTD_createDDict_advanced(const void *dict, size_t dictSize, unsigned byReference, ZSTD_customMem customMem)
> +static ZSTD_DDict *__init ZSTD_createDDict_advanced(const void *dict, size_t dictSize, unsigned byReference, ZSTD_customMem customMem)
>   {
>   	if (!customMem.customAlloc || !customMem.customFree)
>   		return NULL;
> @@ -2101,14 +2101,14 @@ static ZSTD_DDict *INIT ZSTD_createDDict
>   *   Create a digested dictionary, to start decompression without startup delay.
>   *   `dict` content is copied inside DDict.
>   *   Consequently, `dict` can be released after `ZSTD_DDict` creation */
> -ZSTD_DDict *INIT ZSTD_initDDict(const void *dict, size_t dictSize, void *workspace, size_t workspaceSize)
> +ZSTD_DDict *__init ZSTD_initDDict(const void *dict, size_t dictSize, void *workspace, size_t workspaceSize)
>   {
>   	ZSTD_customMem const stackMem = ZSTD_initStack(workspace, workspaceSize);
>   	return ZSTD_createDDict_advanced(dict, dictSize, 1, stackMem);
>   }
>   #endif /* BUILD_DEAD_CODE */
>   
> -size_t INIT ZSTD_freeDDict(ZSTD_DDict *ddict)
> +size_t __init ZSTD_freeDDict(ZSTD_DDict *ddict)
>   {
>   	if (ddict == NULL)
>   		return 0; /* support free on NULL */
> @@ -2125,7 +2125,7 @@ size_t INIT ZSTD_freeDDict(ZSTD_DDict *d
>    *  Provides the dictID stored within dictionary.
>    *  if @return == 0, the dictionary is not conformant with Zstandard specification.
>    *  It can still be loaded, but as a content-only dictionary. */
> -unsigned INIT ZSTD_getDictID_fromDict(const void *dict, size_t dictSize)
> +unsigned __init ZSTD_getDictID_fromDict(const void *dict, size_t dictSize)
>   {
>   	if (dictSize < 8)
>   		return 0;
> @@ -2138,7 +2138,7 @@ unsigned INIT ZSTD_getDictID_fromDict(co
>    *  Provides the dictID of the dictionary loaded into `ddict`.
>    *  If @return == 0, the dictionary is not conformant to Zstandard specification, or empty.
>    *  Non-conformant dictionaries can still be loaded, but as content-only dictionaries. */
> -unsigned INIT ZSTD_getDictID_fromDDict(const ZSTD_DDict *ddict)
> +unsigned __init ZSTD_getDictID_fromDDict(const ZSTD_DDict *ddict)
>   {
>   	if (ddict == NULL)
>   		return 0;
> @@ -2155,7 +2155,7 @@ unsigned INIT ZSTD_getDictID_fromDDict(c
>    *  - `srcSize` is too small, and as a result, the frame header could not be decoded (only possible if `srcSize < ZSTD_FRAMEHEADERSIZE_MAX`).
>    *  - This is not a Zstandard frame.
>    *  When identifying the exact failure cause, it's possible to used ZSTD_getFrameParams(), which will provide a more precise error code. */
> -unsigned INIT ZSTD_getDictID_fromFrame(const void *src, size_t srcSize)
> +unsigned __init ZSTD_getDictID_fromFrame(const void *src, size_t srcSize)
>   {
>   	ZSTD_frameParams zfp = {0, 0, 0, 0};
>   	size_t const hError = ZSTD_getFrameParams(&zfp, src, srcSize);
> @@ -2168,7 +2168,7 @@ unsigned INIT ZSTD_getDictID_fromFrame(c
>   /*! ZSTD_decompress_usingDDict() :
>   *   Decompression using a pre-digested Dictionary
>   *   Use dictionary without significant overhead. */
> -STATIC size_t INIT ZSTD_decompress_usingDDict(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize, const ZSTD_DDict *ddict)
> +static size_t __init ZSTD_decompress_usingDDict(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, const void *src, size_t srcSize, const ZSTD_DDict *ddict)
>   {
>   	/* pass content and size in case legacy frames are encountered */
>   	return ZSTD_decompressMultiFrame(dctx, dst, dstCapacity, src, srcSize, NULL, 0, ddict);
> @@ -2205,7 +2205,7 @@ struct ZSTD_DStream_s {
>   	U32 hostageByte;
>   }; /* typedef'd to ZSTD_DStream within "zstd.h" */
>   
> -STATIC size_t INIT ZSTD_DStreamWorkspaceBound(size_t maxWindowSize)
> +static size_t __init ZSTD_DStreamWorkspaceBound(size_t maxWindowSize)
>   {
>   	size_t const blockSize = MIN(maxWindowSize, ZSTD_BLOCKSIZE_ABSOLUTEMAX);
>   	size_t const inBuffSize = blockSize;
> @@ -2213,7 +2213,7 @@ STATIC size_t INIT ZSTD_DStreamWorkspace
>   	return ZSTD_DCtxWorkspaceBound() + ZSTD_ALIGN(sizeof(ZSTD_DStream)) + ZSTD_ALIGN(inBuffSize) + ZSTD_ALIGN(outBuffSize);
>   }
>   
> -static ZSTD_DStream *INIT ZSTD_createDStream_advanced(ZSTD_customMem customMem)
> +static ZSTD_DStream *__init ZSTD_createDStream_advanced(ZSTD_customMem customMem)
>   {
>   	ZSTD_DStream *zds;
>   
> @@ -2235,7 +2235,7 @@ static ZSTD_DStream *INIT ZSTD_createDSt
>   	return zds;
>   }
>   
> -STATIC ZSTD_DStream *INIT ZSTD_initDStream(size_t maxWindowSize, void *workspace, size_t workspaceSize)
> +static ZSTD_DStream *__init ZSTD_initDStream(size_t maxWindowSize, void *workspace, size_t workspaceSize)
>   {
>   	ZSTD_customMem const stackMem = ZSTD_initStack(workspace, workspaceSize);
>   	ZSTD_DStream *zds = ZSTD_createDStream_advanced(stackMem);
> @@ -2269,7 +2269,7 @@ STATIC ZSTD_DStream *INIT ZSTD_initDStre
>   }
>   
>   #ifdef BUILD_DEAD_CODE
> -ZSTD_DStream *INIT ZSTD_initDStream_usingDDict(size_t maxWindowSize, const ZSTD_DDict *ddict, void *workspace, size_t workspaceSize)
> +ZSTD_DStream *__init ZSTD_initDStream_usingDDict(size_t maxWindowSize, const ZSTD_DDict *ddict, void *workspace, size_t workspaceSize)
>   {
>   	ZSTD_DStream *zds = ZSTD_initDStream(maxWindowSize, workspace, workspaceSize);
>   	if (zds) {
> @@ -2279,7 +2279,7 @@ ZSTD_DStream *INIT ZSTD_initDStream_usin
>   }
>   #endif
>   
> -size_t INIT ZSTD_freeDStream(ZSTD_DStream *zds)
> +size_t __init ZSTD_freeDStream(ZSTD_DStream *zds)
>   {
>   	if (zds == NULL)
>   		return 0; /* support free on null */
> @@ -2301,11 +2301,11 @@ size_t INIT ZSTD_freeDStream(ZSTD_DStrea
>   /* *** Initialization *** */
>   
>   #ifdef BUILD_DEAD_CODE
> -size_t INIT ZSTD_DStreamInSize(void) { return ZSTD_BLOCKSIZE_ABSOLUTEMAX + ZSTD_blockHeaderSize; }
> -size_t INIT ZSTD_DStreamOutSize(void) { return ZSTD_BLOCKSIZE_ABSOLUTEMAX; }
> +size_t __init ZSTD_DStreamInSize(void) { return ZSTD_BLOCKSIZE_ABSOLUTEMAX + ZSTD_blockHeaderSize; }
> +size_t __init ZSTD_DStreamOutSize(void) { return ZSTD_BLOCKSIZE_ABSOLUTEMAX; }
>   #endif
>   
> -STATIC size_t INIT ZSTD_resetDStream(ZSTD_DStream *zds)
> +static size_t __init ZSTD_resetDStream(ZSTD_DStream *zds)
>   {
>   	zds->stage = zdss_loadHeader;
>   	zds->lhSize = zds->inPos = zds->outStart = zds->outEnd = 0;
> @@ -2316,14 +2316,14 @@ STATIC size_t INIT ZSTD_resetDStream(ZST
>   
>   /* *****   Decompression   ***** */
>   
> -ZSTD_STATIC size_t INIT ZSTD_limitCopy(void *dst, size_t dstCapacity, const void *src, size_t srcSize)
> +ZSTD_STATIC size_t __init ZSTD_limitCopy(void *dst, size_t dstCapacity, const void *src, size_t srcSize)
>   {
>   	size_t const length = MIN(dstCapacity, srcSize);
>   	memcpy(dst, src, length);
>   	return length;
>   }
>   
> -STATIC size_t INIT ZSTD_decompressStream(ZSTD_DStream *zds, ZSTD_outBuffer *output, ZSTD_inBuffer *input)
> +static size_t __init ZSTD_decompressStream(ZSTD_DStream *zds, ZSTD_outBuffer *output, ZSTD_inBuffer *input)
>   {
>   	const char *const istart = (const char *)(input->src) + input->pos;
>   	const char *const iend = (const char *)(input->src) + input->size;
> --- a/xen/common/zstd/entropy_common.c
> +++ b/xen/common/zstd/entropy_common.c
> @@ -46,17 +46,17 @@
>   #include "mem.h"
>   
>   /*===   Version   ===*/
> -unsigned INIT FSE_versionNumber(void) { return FSE_VERSION_NUMBER; }
> +unsigned __init FSE_versionNumber(void) { return FSE_VERSION_NUMBER; }
>   
>   /*===   Error Management   ===*/
> -unsigned INIT FSE_isError(size_t code) { return ERR_isError(code); }
> +unsigned __init FSE_isError(size_t code) { return ERR_isError(code); }
>   
> -unsigned INIT HUF_isError(size_t code) { return ERR_isError(code); }
> +unsigned __init HUF_isError(size_t code) { return ERR_isError(code); }
>   
>   /*-**************************************************************
>   *  FSE NCount encoding-decoding
>   ****************************************************************/
> -size_t INIT FSE_readNCount(short *normalizedCounter, unsigned *maxSVPtr, unsigned *tableLogPtr, const void *headerBuffer, size_t hbSize)
> +size_t __init FSE_readNCount(short *normalizedCounter, unsigned *maxSVPtr, unsigned *tableLogPtr, const void *headerBuffer, size_t hbSize)
>   {
>   	const BYTE *const istart = (const BYTE *)headerBuffer;
>   	const BYTE *const iend = istart + hbSize;
> @@ -164,7 +164,7 @@ size_t INIT FSE_readNCount(short *normal
>   	@return : size read from `src` , or an error Code .
>   	Note : Needed by HUF_readCTable() and HUF_readDTableX?() .
>   */
> -size_t INIT HUF_readStats_wksp(BYTE *huffWeight, size_t hwSize, U32 *rankStats, U32 *nbSymbolsPtr, U32 *tableLogPtr, const void *src, size_t srcSize, void *workspace, size_t workspaceSize)
> +size_t __init HUF_readStats_wksp(BYTE *huffWeight, size_t hwSize, U32 *rankStats, U32 *nbSymbolsPtr, U32 *tableLogPtr, const void *src, size_t srcSize, void *workspace, size_t workspaceSize)
>   {
>   	U32 weightTotal;
>   	const BYTE *ip = (const BYTE *)src;
> --- a/xen/common/zstd/error_private.h
> +++ b/xen/common/zstd/error_private.h
> @@ -67,9 +67,9 @@ typedef ZSTD_ErrorCode ERR_enum;
>   ******************************************/
>   #define ERROR(name) ((size_t)-PREFIX(name))
>   
> -ERR_STATIC unsigned INIT ERR_isError(size_t code) { return (code > ERROR(maxCode)); }
> +ERR_STATIC unsigned __init ERR_isError(size_t code) { return (code > ERROR(maxCode)); }
>   
> -ERR_STATIC ERR_enum INIT ERR_getErrorCode(size_t code)
> +ERR_STATIC ERR_enum __init ERR_getErrorCode(size_t code)
>   {
>   	if (!ERR_isError(code))
>   		return (ERR_enum)0;
> @@ -82,7 +82,7 @@ ERR_STATIC ERR_enum INIT ERR_getErrorCod
>    *
>    * Return: Non-zero iff the code is an error.
>    */
> -static __attribute__((unused)) unsigned int INIT ZSTD_isError(size_t code)
> +static __attribute__((unused)) unsigned int __init ZSTD_isError(size_t code)
>   {
>   	return code > (size_t)-ZSTD_error_maxCode;
>   }
> @@ -94,7 +94,7 @@ static __attribute__((unused)) unsigned
>    * Return:          The ZSTD_ErrorCode corresponding to the functionResult or 0
>    *                  if the functionResult isn't an error.
>    */
> -static __attribute__((unused)) ZSTD_ErrorCode INIT ZSTD_getErrorCode(
> +static __attribute__((unused)) ZSTD_ErrorCode __init ZSTD_getErrorCode(
>   	size_t functionResult)
>   {
>   	if (!ZSTD_isError(functionResult))
> --- a/xen/common/zstd/fse_decompress.c
> +++ b/xen/common/zstd/fse_decompress.c
> @@ -82,7 +82,7 @@
>   
>   /* Function templates */
>   
> -size_t INIT FSE_buildDTable_wksp(FSE_DTable *dt, const short *normalizedCounter, unsigned maxSymbolValue, unsigned tableLog, void *workspace, size_t workspaceSize)
> +size_t __init FSE_buildDTable_wksp(FSE_DTable *dt, const short *normalizedCounter, unsigned maxSymbolValue, unsigned tableLog, void *workspace, size_t workspaceSize)
>   {
>   	void *const tdPtr = dt + 1; /* because *dt is unsigned, 32-bits aligned on 32-bits */
>   	FSE_DECODE_TYPE *const tableDecode = (FSE_DECODE_TYPE *)(tdPtr);
> @@ -157,7 +157,7 @@ size_t INIT FSE_buildDTable_wksp(FSE_DTa
>   /*-*******************************************************
>   *  Decompression (Byte symbols)
>   *********************************************************/
> -size_t INIT FSE_buildDTable_rle(FSE_DTable *dt, BYTE symbolValue)
> +size_t __init FSE_buildDTable_rle(FSE_DTable *dt, BYTE symbolValue)
>   {
>   	void *ptr = dt;
>   	FSE_DTableHeader *const DTableH = (FSE_DTableHeader *)ptr;
> @@ -174,7 +174,7 @@ size_t INIT FSE_buildDTable_rle(FSE_DTab
>   	return 0;
>   }
>   
> -size_t INIT FSE_buildDTable_raw(FSE_DTable *dt, unsigned nbBits)
> +size_t __init FSE_buildDTable_raw(FSE_DTable *dt, unsigned nbBits)
>   {
>   	void *ptr = dt;
>   	FSE_DTableHeader *const DTableH = (FSE_DTableHeader *)ptr;
> @@ -269,7 +269,7 @@ FORCE_INLINE size_t FSE_decompress_using
>   	return op - ostart;
>   }
>   
> -size_t INIT FSE_decompress_usingDTable(void *dst, size_t originalSize, const void *cSrc, size_t cSrcSize, const FSE_DTable *dt)
> +size_t __init FSE_decompress_usingDTable(void *dst, size_t originalSize, const void *cSrc, size_t cSrcSize, const FSE_DTable *dt)
>   {
>   	const void *ptr = dt;
>   	const FSE_DTableHeader *DTableH = (const FSE_DTableHeader *)ptr;
> @@ -281,7 +281,7 @@ size_t INIT FSE_decompress_usingDTable(v
>   	return FSE_decompress_usingDTable_generic(dst, originalSize, cSrc, cSrcSize, dt, 0);
>   }
>   
> -size_t INIT FSE_decompress_wksp(void *dst, size_t dstCapacity, const void *cSrc, size_t cSrcSize, unsigned maxLog, void *workspace, size_t workspaceSize)
> +size_t __init FSE_decompress_wksp(void *dst, size_t dstCapacity, const void *cSrc, size_t cSrcSize, unsigned maxLog, void *workspace, size_t workspaceSize)
>   {
>   	const BYTE *const istart = (const BYTE *)cSrc;
>   	const BYTE *ip = istart;
> --- a/xen/common/zstd/huf_decompress.c
> +++ b/xen/common/zstd/huf_decompress.c
> @@ -68,7 +68,7 @@ typedef struct {
>   	BYTE reserved;
>   } DTableDesc;
>   
> -static DTableDesc INIT HUF_getDTableDesc(const HUF_DTable *table)
> +static DTableDesc __init HUF_getDTableDesc(const HUF_DTable *table)
>   {
>   	DTableDesc dtd;
>   	memcpy(&dtd, table, sizeof(dtd));
> @@ -84,7 +84,7 @@ typedef struct {
>   	BYTE nbBits;
>   } HUF_DEltX2; /* single-symbol decoding */
>   
> -size_t INIT HUF_readDTableX2_wksp(HUF_DTable *DTable, const void *src, size_t srcSize, void *workspace, size_t workspaceSize)
> +size_t __init HUF_readDTableX2_wksp(HUF_DTable *DTable, const void *src, size_t srcSize, void *workspace, size_t workspaceSize)
>   {
>   	U32 tableLog = 0;
>   	U32 nbSymbols = 0;
> @@ -152,7 +152,7 @@ size_t INIT HUF_readDTableX2_wksp(HUF_DT
>   	return iSize;
>   }
>   
> -static BYTE INIT HUF_decodeSymbolX2(BIT_DStream_t *Dstream, const HUF_DEltX2 *dt, const U32 dtLog)
> +static BYTE __init HUF_decodeSymbolX2(BIT_DStream_t *Dstream, const HUF_DEltX2 *dt, const U32 dtLog)
>   {
>   	size_t const val = BIT_lookBitsFast(Dstream, dtLog); /* note : dtLog >= 1 */
>   	BYTE const c = dt[val].byte;
> @@ -193,7 +193,7 @@ FORCE_INLINE size_t HUF_decodeStreamX2(B
>   	return pEnd - pStart;
>   }
>   
> -static size_t INIT HUF_decompress1X2_usingDTable_internal(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
> +static size_t __init HUF_decompress1X2_usingDTable_internal(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
>   {
>   	BYTE *op = (BYTE *)dst;
>   	BYTE *const oend = op + dstSize;
> @@ -218,7 +218,7 @@ static size_t INIT HUF_decompress1X2_usi
>   	return dstSize;
>   }
>   
> -size_t INIT HUF_decompress1X2_usingDTable(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
> +size_t __init HUF_decompress1X2_usingDTable(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
>   {
>   	DTableDesc dtd = HUF_getDTableDesc(DTable);
>   	if (dtd.tableType != 0)
> @@ -226,7 +226,7 @@ size_t INIT HUF_decompress1X2_usingDTabl
>   	return HUF_decompress1X2_usingDTable_internal(dst, dstSize, cSrc, cSrcSize, DTable);
>   }
>   
> -size_t INIT HUF_decompress1X2_DCtx_wksp(HUF_DTable *DCtx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize)
> +size_t __init HUF_decompress1X2_DCtx_wksp(HUF_DTable *DCtx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize)
>   {
>   	const BYTE *ip = (const BYTE *)cSrc;
>   
> @@ -241,7 +241,7 @@ size_t INIT HUF_decompress1X2_DCtx_wksp(
>   	return HUF_decompress1X2_usingDTable_internal(dst, dstSize, ip, cSrcSize, DCtx);
>   }
>   
> -static size_t INIT HUF_decompress4X2_usingDTable_internal(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
> +static size_t __init HUF_decompress4X2_usingDTable_internal(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
>   {
>   	/* Check */
>   	if (cSrcSize < 10)
> @@ -349,7 +349,7 @@ static size_t INIT HUF_decompress4X2_usi
>   	}
>   }
>   
> -size_t INIT HUF_decompress4X2_usingDTable(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
> +size_t __init HUF_decompress4X2_usingDTable(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
>   {
>   	DTableDesc dtd = HUF_getDTableDesc(DTable);
>   	if (dtd.tableType != 0)
> @@ -357,7 +357,7 @@ size_t INIT HUF_decompress4X2_usingDTabl
>   	return HUF_decompress4X2_usingDTable_internal(dst, dstSize, cSrc, cSrcSize, DTable);
>   }
>   
> -size_t INIT HUF_decompress4X2_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize)
> +size_t __init HUF_decompress4X2_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize)
>   {
>   	const BYTE *ip = (const BYTE *)cSrc;
>   
> @@ -388,7 +388,7 @@ typedef struct {
>   
>   /* HUF_fillDTableX4Level2() :
>    * `rankValOrigin` must be a table of at least (HUF_TABLELOG_MAX + 1) U32 */
> -static void INIT HUF_fillDTableX4Level2(HUF_DEltX4 *DTable, U32 sizeLog, const U32 consumed, const U32 *rankValOrigin, const int minWeight,
> +static void __init HUF_fillDTableX4Level2(HUF_DEltX4 *DTable, U32 sizeLog, const U32 consumed, const U32 *rankValOrigin, const int minWeight,
>   					const sortedSymbol_t *sortedSymbols, const U32 sortedListSize, U32 nbBitsBaseline, U16 baseSeq)
>   {
>   	HUF_DEltX4 DElt;
> @@ -434,7 +434,7 @@ static void INIT HUF_fillDTableX4Level2(
>   typedef U32 rankVal_t[HUF_TABLELOG_MAX][HUF_TABLELOG_MAX + 1];
>   typedef U32 rankValCol_t[HUF_TABLELOG_MAX + 1];
>   
> -static void INIT HUF_fillDTableX4(HUF_DEltX4 *DTable, const U32 targetLog, const sortedSymbol_t *sortedList,
> +static void __init HUF_fillDTableX4(HUF_DEltX4 *DTable, const U32 targetLog, const sortedSymbol_t *sortedList,
>   				  const U32 sortedListSize, const U32 *rankStart,
>   			          rankVal_t rankValOrigin, const U32 maxWeight, const U32 nbBitsBaseline)
>   {
> @@ -477,7 +477,7 @@ static void INIT HUF_fillDTableX4(HUF_DE
>   	}
>   }
>   
> -size_t INIT HUF_readDTableX4_wksp(HUF_DTable *DTable, const void *src, size_t srcSize, void *workspace, size_t workspaceSize)
> +size_t __init HUF_readDTableX4_wksp(HUF_DTable *DTable, const void *src, size_t srcSize, void *workspace, size_t workspaceSize)
>   {
>   	U32 tableLog, maxW, sizeOfSort, nbSymbols;
>   	DTableDesc dtd = HUF_getDTableDesc(DTable);
> @@ -590,7 +590,7 @@ size_t INIT HUF_readDTableX4_wksp(HUF_DT
>   	return iSize;
>   }
>   
> -static U32 INIT HUF_decodeSymbolX4(void *op, BIT_DStream_t *DStream, const HUF_DEltX4 *dt, const U32 dtLog)
> +static U32 __init HUF_decodeSymbolX4(void *op, BIT_DStream_t *DStream, const HUF_DEltX4 *dt, const U32 dtLog)
>   {
>   	size_t const val = BIT_lookBitsFast(DStream, dtLog); /* note : dtLog >= 1 */
>   	memcpy(op, dt + val, 2);
> @@ -598,7 +598,7 @@ static U32 INIT HUF_decodeSymbolX4(void
>   	return dt[val].length;
>   }
>   
> -static U32 INIT HUF_decodeLastSymbolX4(void *op, BIT_DStream_t *DStream, const HUF_DEltX4 *dt, const U32 dtLog)
> +static U32 __init HUF_decodeLastSymbolX4(void *op, BIT_DStream_t *DStream, const HUF_DEltX4 *dt, const U32 dtLog)
>   {
>   	size_t const val = BIT_lookBitsFast(DStream, dtLog); /* note : dtLog >= 1 */
>   	memcpy(op, dt + val, 1);
> @@ -650,7 +650,7 @@ FORCE_INLINE size_t HUF_decodeStreamX4(B
>   	return p - pStart;
>   }
>   
> -static size_t INIT HUF_decompress1X4_usingDTable_internal(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
> +static size_t __init HUF_decompress1X4_usingDTable_internal(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
>   {
>   	BIT_DStream_t bitD;
>   
> @@ -679,7 +679,7 @@ static size_t INIT HUF_decompress1X4_usi
>   	return dstSize;
>   }
>   
> -size_t INIT HUF_decompress1X4_usingDTable(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
> +size_t __init HUF_decompress1X4_usingDTable(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
>   {
>   	DTableDesc dtd = HUF_getDTableDesc(DTable);
>   	if (dtd.tableType != 1)
> @@ -687,7 +687,7 @@ size_t INIT HUF_decompress1X4_usingDTabl
>   	return HUF_decompress1X4_usingDTable_internal(dst, dstSize, cSrc, cSrcSize, DTable);
>   }
>   
> -size_t INIT HUF_decompress1X4_DCtx_wksp(HUF_DTable *DCtx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize)
> +size_t __init HUF_decompress1X4_DCtx_wksp(HUF_DTable *DCtx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize)
>   {
>   	const BYTE *ip = (const BYTE *)cSrc;
>   
> @@ -702,7 +702,7 @@ size_t INIT HUF_decompress1X4_DCtx_wksp(
>   	return HUF_decompress1X4_usingDTable_internal(dst, dstSize, ip, cSrcSize, DCtx);
>   }
>   
> -static size_t INIT HUF_decompress4X4_usingDTable_internal(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
> +static size_t __init HUF_decompress4X4_usingDTable_internal(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
>   {
>   	if (cSrcSize < 10)
>   		return ERROR(corruption_detected); /* strict minimum : jump table + 1 byte per stream */
> @@ -812,7 +812,7 @@ static size_t INIT HUF_decompress4X4_usi
>   	}
>   }
>   
> -size_t INIT HUF_decompress4X4_usingDTable(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
> +size_t __init HUF_decompress4X4_usingDTable(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
>   {
>   	DTableDesc dtd = HUF_getDTableDesc(DTable);
>   	if (dtd.tableType != 1)
> @@ -820,7 +820,7 @@ size_t INIT HUF_decompress4X4_usingDTabl
>   	return HUF_decompress4X4_usingDTable_internal(dst, dstSize, cSrc, cSrcSize, DTable);
>   }
>   
> -size_t INIT HUF_decompress4X4_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize)
> +size_t __init HUF_decompress4X4_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize)
>   {
>   	const BYTE *ip = (const BYTE *)cSrc;
>   
> @@ -839,14 +839,14 @@ size_t INIT HUF_decompress4X4_DCtx_wksp(
>   /* Generic decompression selector */
>   /* ********************************/
>   
> -size_t INIT HUF_decompress1X_usingDTable(void *dst, size_t maxDstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
> +size_t __init HUF_decompress1X_usingDTable(void *dst, size_t maxDstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
>   {
>   	DTableDesc const dtd = HUF_getDTableDesc(DTable);
>   	return dtd.tableType ? HUF_decompress1X4_usingDTable_internal(dst, maxDstSize, cSrc, cSrcSize, DTable)
>   			     : HUF_decompress1X2_usingDTable_internal(dst, maxDstSize, cSrc, cSrcSize, DTable);
>   }
>   
> -size_t INIT HUF_decompress4X_usingDTable(void *dst, size_t maxDstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
> +size_t __init HUF_decompress4X_usingDTable(void *dst, size_t maxDstSize, const void *cSrc, size_t cSrcSize, const HUF_DTable *DTable)
>   {
>   	DTableDesc const dtd = HUF_getDTableDesc(DTable);
>   	return dtd.tableType ? HUF_decompress4X4_usingDTable_internal(dst, maxDstSize, cSrc, cSrcSize, DTable)
> @@ -882,7 +882,7 @@ static const algo_time_t algoTime[16 /*
>   *   based on a set of pre-determined metrics.
>   *   @return : 0==HUF_decompress4X2, 1==HUF_decompress4X4 .
>   *   Assumption : 0 < cSrcSize < dstSize <= 128 KB */
> -U32 INIT HUF_selectDecoder(size_t dstSize, size_t cSrcSize)
> +U32 __init HUF_selectDecoder(size_t dstSize, size_t cSrcSize)
>   {
>   	/* decoder timing evaluation */
>   	U32 const Q = (U32)(cSrcSize * 16 / dstSize); /* Q < 16 since dstSize > cSrcSize */
> @@ -896,7 +896,7 @@ U32 INIT HUF_selectDecoder(size_t dstSiz
>   
>   typedef size_t (*decompressionAlgo)(void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize);
>   
> -size_t INIT HUF_decompress4X_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize)
> +size_t __init HUF_decompress4X_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize)
>   {
>   	/* validation checks */
>   	if (dstSize == 0)
> @@ -919,7 +919,7 @@ size_t INIT HUF_decompress4X_DCtx_wksp(H
>   	}
>   }
>   
> -size_t INIT HUF_decompress4X_hufOnly_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize)
> +size_t __init HUF_decompress4X_hufOnly_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize)
>   {
>   	/* validation checks */
>   	if (dstSize == 0)
> @@ -934,7 +934,7 @@ size_t INIT HUF_decompress4X_hufOnly_wks
>   	}
>   }
>   
> -size_t INIT HUF_decompress1X_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize)
> +size_t __init HUF_decompress1X_DCtx_wksp(HUF_DTable *dctx, void *dst, size_t dstSize, const void *cSrc, size_t cSrcSize, void *workspace, size_t workspaceSize)
>   {
>   	/* validation checks */
>   	if (dstSize == 0)
> --- a/xen/common/zstd/zstd_common.c
> +++ b/xen/common/zstd/zstd_common.c
> @@ -31,7 +31,7 @@
>   		(stack)->ptr <= (stack)->end ? ptr : NULL;      \
>   	})
>   
> -ZSTD_customMem INIT ZSTD_initStack(void *workspace, size_t workspaceSize)
> +ZSTD_customMem __init ZSTD_initStack(void *workspace, size_t workspaceSize)
>   {
>   	ZSTD_customMem stackMem = {ZSTD_stackAlloc, ZSTD_stackFree, workspace};
>   	ZSTD_stack *stack = (ZSTD_stack *)workspace;
> @@ -47,27 +47,27 @@ ZSTD_customMem INIT ZSTD_initStack(void
>   	return stackMem;
>   }
>   
> -void *INIT ZSTD_stackAllocAll(void *opaque, size_t *size)
> +void *__init ZSTD_stackAllocAll(void *opaque, size_t *size)
>   {
>   	ZSTD_stack *stack = (ZSTD_stack *)opaque;
>   	*size = (BYTE const *)stack->end - (BYTE *)ZSTD_PTR_ALIGN(stack->ptr);
>   	return stack_push(stack, *size);
>   }
>   
> -void *INIT ZSTD_stackAlloc(void *opaque, size_t size)
> +void *__init ZSTD_stackAlloc(void *opaque, size_t size)
>   {
>   	ZSTD_stack *stack = (ZSTD_stack *)opaque;
>   	return stack_push(stack, size);
>   }
> -void INIT ZSTD_stackFree(void *opaque, void *address)
> +void __init ZSTD_stackFree(void *opaque, void *address)
>   {
>   	(void)opaque;
>   	(void)address;
>   }
>   
> -void *INIT ZSTD_malloc(size_t size, ZSTD_customMem customMem) { return customMem.customAlloc(customMem.opaque, size); }
> +void *__init ZSTD_malloc(size_t size, ZSTD_customMem customMem) { return customMem.customAlloc(customMem.opaque, size); }
>   
> -void INIT ZSTD_free(void *ptr, ZSTD_customMem customMem)
> +void __init ZSTD_free(void *ptr, ZSTD_customMem customMem)
>   {
>   	if (ptr != NULL)
>   		customMem.customFree(customMem.opaque, ptr);
> --- a/xen/common/zstd/zstd_internal.h
> +++ b/xen/common/zstd/zstd_internal.h
> @@ -21,7 +21,7 @@
>   *  Compiler specifics
>   *********************************************************/
>   #define FORCE_INLINE static always_inline
> -#define FORCE_NOINLINE static noinline INIT
> +#define FORCE_NOINLINE static noinline __init
>   
>   /*-*************************************
>   *  Dependencies
> 
> 

-- 
Julien Grall

