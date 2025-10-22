Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A64BFCCC6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 17:14:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148355.1480435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBaWq-0001mu-9G; Wed, 22 Oct 2025 15:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148355.1480435; Wed, 22 Oct 2025 15:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBaWq-0001lU-60; Wed, 22 Oct 2025 15:13:32 +0000
Received: by outflank-mailman (input) for mailman id 1148355;
 Wed, 22 Oct 2025 15:13:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pHug=47=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBaWo-0001l5-Kh
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 15:13:30 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9fbef69-af59-11f0-9d15-b5c5bf9af7f9;
 Wed, 22 Oct 2025 17:13:29 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-471193a9d9eso64620655e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 08:13:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c41ca845sm49705055e9.0.2025.10.22.08.13.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 08:13:27 -0700 (PDT)
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
X-Inumbo-ID: a9fbef69-af59-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761146008; x=1761750808; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4S9B7yZSb7jJT+Z2y/p20PLFfa4EKggtE6jUb14D6HM=;
        b=GhMBQbTxRXG5zZ83FcZBls22qe2SulzdMBC1/N7o7/DP8qmEcC2O+dMYE30qQY+wth
         TPB7j4Gza2rbufnk333gvnq1V9Vyuui/5Zu0OeZ3H1Zft6mxEEYHwRIm+2aPIMySMsmh
         zNzuBR8NEjpuJ+tSKQEbw1BQ2Ql+lZr2qcjI+ip7n3pBK8wi0W6wutdn2R3cxBFUquf+
         /cglQL/DJ0tSWy5O6Fd531UoKjcyYZc/TgKzzjLqhW98/G4crb8esTaxXHxc+Puok05K
         cChx4fvA2XklTlf5ftuy0EDxBW5+IZdC9+i5yy47DxZ0Klu3hiXLTGSd/4Yi6PcMGPJ+
         t1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761146008; x=1761750808;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4S9B7yZSb7jJT+Z2y/p20PLFfa4EKggtE6jUb14D6HM=;
        b=suUcfWInx/aMkVEpRv5Oiy3Gn9g61/ARnXmKH/HcWsB0yN0I25u3JmqtfP5kztMpiE
         5zJ9t2If8/PToT1NLHQZXk+arWUzPj2GkUkeM+/ixetm69A7QmUCV93OekU5b5Od6Avj
         E1jPNF4OCONINFk7965AaiKZKc/ScWFxTPcUQaqQyE1SAgxQN+JF35Ow86XLEOrKwmCw
         HO2Kd9z0hMkz0ILtJfp4DDodSDvB0Ly83t0jBIGq4TbYC7lj5dFBxJ8NpyjtmBmlwU7u
         pX5w4Ga0HGqx6iOFO+fsOy8/wo/3+VWaNHMt4DmH4r5qJudR/9F4vQOVinfrTnWE/Qc7
         PheQ==
X-Forwarded-Encrypted: i=1; AJvYcCURj6Yu/kYWTM7JZFKm0mSlEIhj6depDzti4TVk/B1U3gwskqdoVl3W77MCG3rHjRAcr9N4O8g2NEo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyfDDTO9JHtCAtB7mPAefYl6U/O9+ov31RrwSu4sSwRBtAtxw2/
	g1wgFAJuJcF8mX82WAnhcke15ks+LnDnw12kS4UwY/HRvn6KbfuOgYOcj8pkb1lo0A==
X-Gm-Gg: ASbGncuoX/rI5IpupD78U61TL5nvLilYMOPAv/MfggrNMoQM8kNrLi5XdEsEfxeKyg0
	EFXSDfVg/m3aFyC//mtLYLwpASoDYSn4ZeTwYAComTvyxhu4dbJ6MuznS92mbh7QgDP7O7z71Ij
	qqFqsPI1Nf9ov5Sb2KSFsl9bnaMAagI5qccQTiLZBuxsvnzy8OvtHUG1yNIT1OrNirOH9xUg/wc
	tL04fXjnibB2XGtn0HRQ2nAjG7xN4s7x2gBTFHLMASa3AOe5tjQXkZZUJN7rbU4JX19GeUEiBz7
	vydb5QVucdnl/lz+xjf+P7cmTfkpUJIPHIBCWBgbghUr2xqVjjhu+zPkIkf+4z2UyMCjz1E50Br
	FCe4o9M/cfj8VJ1gYl0UxVuCM/PYqKxVFf4M2ph37tNSStOZlocTYRCTdBZHMN1/REisJlIVnTW
	vbh/WLihiDjh5cyip7x0IY3xi12rv2QLsqbf13InoaDwk/JhdXOKMpfyIDMIjm
X-Google-Smtp-Source: AGHT+IGIFHkvYqHnI5cR2qi3XNXPuKOsQg2mUMYNtGumOOchd7GSyaWJn7sNvPt+D8WsfR5+BoOzzQ==
X-Received: by 2002:a05:600c:1d9c:b0:45f:2cb5:ecff with SMTP id 5b1f17b1804b1-47117917babmr170563505e9.31.1761146008020;
        Wed, 22 Oct 2025 08:13:28 -0700 (PDT)
Message-ID: <91835e2e-cf59-484e-9583-f0c07513cfc1@suse.com>
Date: Wed, 22 Oct 2025 17:13:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/22] x86/tpm.c: support extending PCRs of TPM2.0
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <dae740e8eef63af59993791d27ce490095f7cca8.1748611041.git.sergii.dmytruk@3mdeb.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <dae740e8eef63af59993791d27ce490095f7cca8.1748611041.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.2025 15:17, Sergii Dmytruk wrote:
> @@ -146,14 +156,15 @@ static inline bool is_tpm12(void)
>              (tis_read32(TPM_STS_(0)) & TPM_FAMILY_MASK) == 0);
>  }
>  
> -/****************************** TPM1.2 specific *******************************/
> -#define TPM_ORD_Extend              0x00000014
> -#define TPM_ORD_SHA1Start           0x000000A0
> -#define TPM_ORD_SHA1Update          0x000000A1
> -#define TPM_ORD_SHA1CompleteExtend  0x000000A3
> +/****************************** TPM1.2 & TPM2.0 *******************************/
>  
> -#define TPM_TAG_RQU_COMMAND         0x00C1
> -#define TPM_TAG_RSP_COMMAND         0x00C4
> +/*
> + * TPM1.2 is required to support commands of up to 1101 bytes, vendors rarely
> + * go above that. Limit maximum size of block of data to be hashed to 1024.
> + *
> + * TPM2.0 should support hashing of at least 1024 bytes.
> + */
> +#define MAX_HASH_BLOCK      1024
>  
>  /* All fields of following structs are big endian. */
>  struct tpm_cmd_hdr {
> @@ -168,6 +179,17 @@ struct tpm_rsp_hdr {
>      uint32_t    returnCode;
>  } __packed;
>  
> +/****************************** TPM1.2 specific *******************************/
> +
> +#define TPM_ORD_Extend              0x00000014
> +#define TPM_ORD_SHA1Start           0x000000A0
> +#define TPM_ORD_SHA1Update          0x000000A1
> +#define TPM_ORD_SHA1CompleteExtend  0x000000A3
> +
> +#define TPM_TAG_RQU_COMMAND         0x00C1
> +#define TPM_TAG_RSP_COMMAND         0x00C4
> +
> +/* All fields of following structs are big endian. */
>  struct extend_cmd {
>      struct tpm_cmd_hdr h;
>      uint32_t pcrNum;

Can the previous patch please put these right in their final resting place?

> @@ -233,11 +255,6 @@ struct txt_ev_log_container_12 {
>  };
>  
>  #ifdef __EARLY_SLAUNCH__
> -/*
> - * TPM1.2 is required to support commands of up to 1101 bytes, vendors rarely
> - * go above that. Limit maximum size of block of data to be hashed to 1024.
> - */
> -#define MAX_HASH_BLOCK      1024
>  #define CMD_RSP_BUF_SIZE    (sizeof(struct sha1_update_cmd) + MAX_HASH_BLOCK)
>  
>  union cmd_rsp {
> @@ -393,6 +410,400 @@ static void *create_log_event12(struct txt_ev_log_container_12 *evt_log,
>  
>  /************************** end of TPM1.2 specific ****************************/
>  
> +/****************************** TPM2.0 specific *******************************/
> +
> +/*
> + * These constants are for TPM2.0 but don't have a distinct prefix to match
> + * names in the specification.
> + */
> +
> +#define TPM_HT_PCR   0x00
> +
> +#define TPM_RH_NULL  0x40000007
> +#define TPM_RS_PW    0x40000009
> +
> +#define HR_SHIFT     24
> +#define HR_PCR       (TPM_HT_PCR << HR_SHIFT)
> +
> +#define TPM_ST_NO_SESSIONS  0x8001
> +#define TPM_ST_SESSIONS     0x8002
> +
> +#define TPM_ALG_SHA1        0x0004
> +#define TPM_ALG_SHA256      0x000b
> +#define TPM_ALG_NULL        0x0010
> +
> +#define TPM2_PCR_Extend                 0x00000182
> +#define TPM2_PCR_HashSequenceStart      0x00000186
> +#define TPM2_PCR_SequenceUpdate         0x0000015C
> +#define TPM2_PCR_EventSequenceComplete  0x00000185
> +
> +#define PUT_BYTES(p, bytes, size)  do {  \
> +        memcpy((p), (bytes), (size));    \

Preferably without the excess parentheses, much like you have it ...

> +        (p) += (size);                   \
> +    } while ( 0 )
> +
> +#define PUT_16BIT(p, data) do {          \
> +        *(uint16_t *)(p) = swap16(data); \

... e.g. in the function call here.

> +        (p) += 2;                        \
> +    } while ( 0 )
> +
> +/* All fields of following structs are big endian. */
> +struct tpm2_session_header {
> +    uint32_t handle;
> +    uint16_t nonceSize;
> +    uint8_t nonce[0];
> +    uint8_t attrs;
> +    uint16_t hmacSize;
> +    uint8_t hmac[0];
> +} __packed;
> +
> +struct tpm2_extend_cmd {
> +    struct tpm_cmd_hdr h;
> +    uint32_t pcrHandle;
> +    uint32_t sessionHdrSize;
> +    struct tpm2_session_header pcrSession;
> +    uint32_t hashCount;
> +    uint8_t hashes[0];
> +} __packed;
> +
> +struct tpm2_extend_rsp {
> +    struct tpm_rsp_hdr h;
> +} __packed;
> +
> +struct tpm2_sequence_start_cmd {
> +    struct tpm_cmd_hdr h;
> +    uint16_t hmacSize;
> +    uint8_t hmac[0];
> +    uint16_t hashAlg;
> +} __packed;
> +
> +struct tpm2_sequence_start_rsp {
> +    struct tpm_rsp_hdr h;
> +    uint32_t sequenceHandle;
> +} __packed;
> +
> +struct tpm2_sequence_update_cmd {
> +    struct tpm_cmd_hdr h;
> +    uint32_t sequenceHandle;
> +    uint32_t sessionHdrSize;
> +    struct tpm2_session_header session;
> +    uint16_t dataSize;
> +    uint8_t data[0];
> +} __packed;
> +
> +struct tpm2_sequence_update_rsp {
> +    struct tpm_rsp_hdr h;
> +} __packed;
> +
> +struct tpm2_sequence_complete_cmd {
> +    struct tpm_cmd_hdr h;
> +    uint32_t pcrHandle;
> +    uint32_t sequenceHandle;
> +    uint32_t sessionHdrSize;
> +    struct tpm2_session_header pcrSession;
> +    struct tpm2_session_header sequenceSession;
> +    uint16_t dataSize;
> +    uint8_t data[0];
> +} __packed;
> +
> +struct tpm2_sequence_complete_rsp {
> +    struct tpm_rsp_hdr h;
> +    uint32_t paramSize;
> +    uint32_t hashCount;
> +    uint8_t hashes[0];
> +    /*
> +     * Each hash is represented as:
> +     * struct {
> +     *     uint16_t hashAlg;
> +     *     uint8_t hash[size of hashAlg];
> +     * };
> +     */
> +} __packed;
> +
> +/*
> + * These two structure are for convenience, they don't correspond to anything in
> + * any spec.
> + */
> +struct tpm2_log_hash {
> +    uint16_t alg;  /* TPM_ALG_* */
> +    uint16_t size;
> +    uint8_t *data; /* Non-owning reference to a buffer inside log entry. */
> +};
> +/* Should be more than enough for now and awhile in the future. */
> +#define MAX_HASH_COUNT 8
> +struct tpm2_log_hashes {
> +    uint32_t count;
> +    struct tpm2_log_hash hashes[MAX_HASH_COUNT];
> +};
> +
> +#ifdef __EARLY_SLAUNCH__
> +
> +union tpm2_cmd_rsp {
> +    uint8_t b[sizeof(struct tpm2_sequence_update_cmd) + MAX_HASH_BLOCK];
> +    struct tpm_cmd_hdr c;
> +    struct tpm_rsp_hdr r;
> +    struct tpm2_sequence_start_cmd start_c;
> +    struct tpm2_sequence_start_rsp start_r;
> +    struct tpm2_sequence_update_cmd update_c;
> +    struct tpm2_sequence_update_rsp update_r;
> +    struct tpm2_sequence_complete_cmd finish_c;
> +    struct tpm2_sequence_complete_rsp finish_r;
> +};
> +
> +static uint32_t tpm2_hash_extend(unsigned loc, const uint8_t *buf,
> +                                 unsigned size, unsigned pcr,
> +                                 struct tpm2_log_hashes *log_hashes)
> +{
> +    uint32_t seq_handle;
> +    unsigned max_bytes = MAX_HASH_BLOCK;
> +
> +    union tpm2_cmd_rsp cmd_rsp;
> +    unsigned o_size;
> +    unsigned i;
> +    uint8_t *p;
> +    uint32_t rc;
> +
> +    cmd_rsp.start_c = (struct tpm2_sequence_start_cmd) {
> +        .h.tag = swap16(TPM_ST_NO_SESSIONS),
> +        .h.paramSize = swap32(sizeof(cmd_rsp.start_c)),
> +        .h.ordinal = swap32(TPM2_PCR_HashSequenceStart),
> +        .hashAlg = swap16(TPM_ALG_NULL), /* Compute all supported hashes. */
> +    };
> +
> +    request_locality(loc);
> +
> +    o_size = sizeof(cmd_rsp);
> +    send_cmd(loc, cmd_rsp.b, swap32(cmd_rsp.c.paramSize), &o_size);
> +
> +    if ( cmd_rsp.r.tag == swap16(TPM_ST_NO_SESSIONS) &&
> +         cmd_rsp.r.paramSize == swap32(10) )
> +    {
> +        rc = swap32(cmd_rsp.r.returnCode);
> +        if ( rc != 0 )
> +            goto error;
> +    }
> +
> +    seq_handle = swap32(cmd_rsp.start_r.sequenceHandle);
> +
> +    while ( size > 64 )
> +    {
> +        if ( size < max_bytes )
> +            max_bytes = size & ~(64 - 1);
> +
> +        cmd_rsp.update_c = (struct tpm2_sequence_update_cmd) {
> +            .h.tag = swap16(TPM_ST_SESSIONS),
> +            .h.paramSize = swap32(sizeof(cmd_rsp.update_c) + max_bytes),
> +            .h.ordinal = swap32(TPM2_PCR_SequenceUpdate),
> +            .sequenceHandle = swap32(seq_handle),
> +            .sessionHdrSize = swap32(sizeof(struct tpm2_session_header)),
> +            .session.handle = swap32(TPM_RS_PW),
> +            .dataSize = swap16(max_bytes),
> +        };
> +
> +        memcpy(cmd_rsp.update_c.data, buf, max_bytes);
> +
> +        o_size = sizeof(cmd_rsp);
> +        send_cmd(loc, cmd_rsp.b, swap32(cmd_rsp.c.paramSize), &o_size);
> +
> +        if ( cmd_rsp.r.tag == swap16(TPM_ST_NO_SESSIONS) &&
> +             cmd_rsp.r.paramSize == swap32(10) )
> +        {
> +            rc = swap32(cmd_rsp.r.returnCode);
> +            if ( rc != 0 )
> +                goto error;
> +        }
> +
> +        size -= max_bytes;
> +        buf += max_bytes;
> +    }
> +
> +    cmd_rsp.finish_c = (struct tpm2_sequence_complete_cmd) {
> +        .h.tag = swap16(TPM_ST_SESSIONS),
> +        .h.paramSize = swap32(sizeof(cmd_rsp.finish_c) + size),
> +        .h.ordinal = swap32(TPM2_PCR_EventSequenceComplete),
> +        .pcrHandle = swap32(HR_PCR + pcr),
> +        .sequenceHandle = swap32(seq_handle),
> +        .sessionHdrSize = swap32(sizeof(struct tpm2_session_header)*2),

Why *2? Where to the two session headers go? (Also nit: blanks missing around *.)

> +        .pcrSession.handle = swap32(TPM_RS_PW),
> +        .sequenceSession.handle = swap32(TPM_RS_PW),
> +        .dataSize = swap16(size),
> +    };
> +
> +    memcpy(cmd_rsp.finish_c.data, buf, size);
> +
> +    o_size = sizeof(cmd_rsp);
> +    send_cmd(loc, cmd_rsp.b, swap32(cmd_rsp.c.paramSize), &o_size);
> +
> +    if ( cmd_rsp.r.tag == swap16(TPM_ST_NO_SESSIONS) &&
> +         cmd_rsp.r.paramSize == swap32(10) )
> +    {
> +        rc = swap32(cmd_rsp.r.returnCode);
> +        if ( rc != 0 )
> +            goto error;
> +    }
> +
> +    p = cmd_rsp.finish_r.hashes;
> +    for ( i = 0; i < swap32(cmd_rsp.finish_r.hashCount); ++i )
> +    {
> +        unsigned j;
> +        uint16_t hash_type;
> +
> +        hash_type = swap16(*(uint16_t *)p);
> +        p += sizeof(uint16_t);
> +
> +        for ( j = 0; j < log_hashes->count; ++j )
> +        {
> +            struct tpm2_log_hash *hash = &log_hashes->hashes[j];
> +            if ( hash->alg == hash_type )
> +            {
> +                memcpy(hash->data, p, hash->size);
> +                p += hash->size;
> +                break;
> +            }
> +        }
> +
> +        if ( j == log_hashes->count )
> +            /* Can't continue parsing without knowing hash size. */
> +            break;
> +    }
> +
> +    rc = 0;
> +
> +error:
> +    relinquish_locality(loc);
> +    return rc;
> +}
> +
> +#else
> +
> +union tpm2_cmd_rsp {
> +    /* Enough space for multiple hashes. */
> +    uint8_t b[sizeof(struct tpm2_extend_cmd) + 1024];
> +    struct tpm_cmd_hdr c;
> +    struct tpm_rsp_hdr r;
> +    struct tpm2_extend_cmd extend_c;
> +    struct tpm2_extend_rsp extend_r;
> +};
> +
> +static uint32_t tpm20_pcr_extend(unsigned loc, uint32_t pcr_handle,
> +                                 const struct tpm2_log_hashes *log_hashes)
> +{
> +    union tpm2_cmd_rsp cmd_rsp;
> +    unsigned o_size;
> +    unsigned i;
> +    uint8_t *p;
> +
> +    cmd_rsp.extend_c = (struct tpm2_extend_cmd) {
> +        .h.tag = swap16(TPM_ST_SESSIONS),
> +        .h.ordinal = swap32(TPM2_PCR_Extend),
> +        .pcrHandle = swap32(pcr_handle),
> +        .sessionHdrSize = swap32(sizeof(struct tpm2_session_header)),
> +        .pcrSession.handle = swap32(TPM_RS_PW),
> +        .hashCount = swap32(log_hashes->count),
> +    };
> +
> +    p = cmd_rsp.extend_c.hashes;
> +    for ( i = 0; i < log_hashes->count; ++i )
> +    {
> +        const struct tpm2_log_hash *hash = &log_hashes->hashes[i];
> +
> +        if ( p + sizeof(uint16_t) + hash->size > &cmd_rsp.b[sizeof(cmd_rsp)] )
> +        {
> +            printk(XENLOG_ERR "Hit TPM message size implementation limit: %ld\n",
> +                   sizeof(cmd_rsp));
> +            return -1;
> +        }
> +
> +        *(uint16_t *)p = swap16(hash->alg);
> +        p += sizeof(uint16_t);
> +
> +        memcpy(p, hash->data, hash->size);
> +        p += hash->size;
> +    }
> +
> +    /* Fill in command size (size of the whole buffer). */
> +    cmd_rsp.extend_c.h.paramSize = swap32(sizeof(cmd_rsp.extend_c) +
> +                                          (p - cmd_rsp.extend_c.hashes)),
> +
> +    o_size = sizeof(cmd_rsp);
> +    send_cmd(loc, cmd_rsp.b, swap32(cmd_rsp.c.paramSize), &o_size);
> +
> +    return swap32(cmd_rsp.r.returnCode);
> +}
> +
> +static bool tpm_supports_hash(unsigned loc, const struct tpm2_log_hash *hash)
> +{
> +    uint32_t rc;
> +    struct tpm2_log_hashes hashes = {
> +        .count = 1,
> +        .hashes[0] = *hash,
> +    };
> +
> +    /*
> +     * This is a valid way of checking hash support, using it to not implement
> +     * TPM2_GetCapability().
> +     */
> +    rc = tpm20_pcr_extend(loc, /*pcr_handle=*/TPM_RH_NULL, &hashes);
> +
> +    return rc == 0;
> +}
> +
> +static uint32_t tpm2_hash_extend(unsigned loc, const uint8_t *buf,
> +                                 unsigned size, unsigned pcr,
> +                                 const struct tpm2_log_hashes *log_hashes)
> +{
> +    uint32_t rc;
> +    unsigned i;
> +    struct tpm2_log_hashes supported_hashes = {0};
> +
> +    request_locality(loc);
> +
> +    for ( i = 0; i < log_hashes->count; ++i )
> +    {
> +        const struct tpm2_log_hash *hash = &log_hashes->hashes[i];
> +        if ( !tpm_supports_hash(loc, hash) )
> +        {
> +            printk(XENLOG_WARNING "Skipped hash unsupported by TPM: %d\n",
> +                   hash->alg);
> +            continue;
> +        }
> +
> +        if ( hash->alg == TPM_ALG_SHA1 )
> +        {
> +            sha1_hash(hash->data, buf, size);
> +        }
> +        else if ( hash->alg == TPM_ALG_SHA256 )
> +        {
> +            sha2_256_digest(hash->data, buf, size);
> +        }
> +        else

Is this really just "else", not "else if ( ... )"?

> +        {
> +            /* This is called "OneDigest" in TXT Software Development Guide. */
> +            memset(hash->data, 0, size);
> +            hash->data[0] = 1;
> +        }
> +
> +        if ( supported_hashes.count == MAX_HASH_COUNT )
> +        {
> +            printk(XENLOG_ERR "Hit hash count implementation limit: %d\n",
> +                   MAX_HASH_COUNT);
> +            return -1;

This is an odd return value for a function returning uint32_t. And it's also ...

> @@ -419,6 +830,35 @@ void tpm_hash_extend(unsigned loc, unsigned pcr, const uint8_t *buf,
>          {
>  #ifndef __EARLY_SLAUNCH__
>              printk(XENLOG_ERR "Extending PCR%u failed\n", pcr);
> +#endif
> +        }
> +    } else {
> +        uint8_t sha1_digest[SHA1_DIGEST_SIZE];
> +        uint8_t sha256_digest[SHA2_256_DIGEST_SIZE];
> +        uint32_t rc;
> +
> +        struct tpm2_log_hashes log_hashes = {
> +            .count = 2,
> +            .hashes = {
> +                {
> +                    .alg = TPM_ALG_SHA1,
> +                    .size = SHA1_DIGEST_SIZE,
> +                    .data = sha1_digest,
> +                },
> +                {
> +                    .alg = TPM_ALG_SHA256,
> +                    .size = SHA2_256_DIGEST_SIZE,
> +                    .data = sha256_digest,
> +                },
> +            },
> +        };
> +
> +        rc = tpm2_hash_extend(loc, buf, size, pcr, &log_hashes);
> +        if ( rc != 0 )
> +        {
> +#ifndef __EARLY_SLAUNCH__
> +            printk(XENLOG_ERR "Extending PCR%u failed with TPM error: 0x%08x\n",
> +                   pcr, rc);

... not exactly a TPM error.

Of course other comments given on the previous patch logically apply here (and
elsewhere) as well.

Jan

