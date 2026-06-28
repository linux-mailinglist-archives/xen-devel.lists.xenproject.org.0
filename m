Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ci1ZCgmcQWrWsgkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 00:11:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE5B6D523A
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 00:11:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=3mdeb.com header.s=ovhmo3617313-selector1 header.b=d0qpTCHo;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none
Received: from list by lists.xenproject.org with outflank-mailman.1347100.1604990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wdxhW-0005V2-Mj; Sun, 28 Jun 2026 22:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347100.1604990; Sun, 28 Jun 2026 22:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wdxhW-0005RS-J2; Sun, 28 Jun 2026 22:10:06 +0000
Received: by outflank-mailman (input) for mailman id 1347100;
 Sun, 28 Jun 2026 22:10:04 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1wdxhT-0004am-Av
 for xen-devel@lists.xenproject.org; Sun, 28 Jun 2026 22:10:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wdxhP-00ATm9-CM
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 00:09:59 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a419b93-5cb7-0a2a0a5109dd-0a2a4505cf8a-24
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 00:09:59 +0200
Received: from [178.32.96.204] (helo=9.mo583.mail-out.ovh.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a419bb6-3cb2-0a2a45050019-b22060cc887b-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 00:09:58 +0200
Received: from director2.ghost.mail-out.ovh.net (unknown [10.109.249.149])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4gpNr62P4yz5vwr
 for <xen-devel@lists.xenproject.org>; Sun, 28 Jun 2026 22:09:58 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-ltgjr (unknown [10.110.168.82])
 by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 81CB4C0778;
 Sun, 28 Jun 2026 22:09:57 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.108])
 by ghost-submission-7d8d68f679-ltgjr with ESMTPSA
 id PMeyErWbQWphYg8Au2xH8w
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 28 Jun 2026 22:09:57 +0000
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
X-OVh-ClientIp:176.111.183.249
Date: Mon, 29 Jun 2026 01:09:49 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 11/22] x86/tpm.c: support extending PCRs of TPM2.0
Message-ID: <akGbrdHHrBGk8UrI@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <dae740e8eef63af59993791d27ce490095f7cca8.1748611041.git.sergii.dmytruk@3mdeb.com>
 <91835e2e-cf59-484e-9583-f0c07513cfc1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91835e2e-cf59-484e-9583-f0c07513cfc1@suse.com>
x-ovh-tracer-id: 11220155525683619292
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFxMCv0YiROW6IGpZILz9rEiTwkceLHqrxR1DhVgt0INUxPOC22G7qsykZuFUjNTTHz9YGwQNIQsbReG/hOexKIBpHsHfXsw6JiPFH4M8Eb2KIJH9yN87PdD/pn6zx63qsCrS/Cp64QDTH9JHNuQVWv4XNCqwTVbKAq4XYc3Lcf2V+mHj0iTRbwndEybn5vMbFOmY4RhcvuzJh7Q1ca5o85pBoMjWJiY2s3vWXno2FDsN81e2yQqoE/EjpKokTRXHfnezAk8BT8P1voEhpc9R7SvdIgyv22YnoJxiSEUJ/EPoZpg/V8wgy2emSdKNIT8RKRdouzcXeXF1X4LEtcUN0igjVqFonRvIDhqmVs+dJdoJsPACRbVGbayu9dVCdexlUOhR2txPMY04BSwFs68XSwp5yHuMGAROlXzWJOcNImps50O2TIY9w+jAzgZZO6b4iV6TYRLEAfk0arWQqzjJb6heIb8wChmDHbWGRy0+6bU6B4t2KwVR+5GefOHO4c5gTdbwRKboedkGdAxthdXyUMH8UBNudiasrN5Vg334xRktmuTr95h6XRe5w+ICQtbg/zV6V7sgF9ecyaipZuyAJYquXsukUqXp2BwQUG3UFadmCMt94mu/qTb3y5Qy8VXbbU4qeMbpq6FKSbkSwuQcNKPt3aQ4fMjPdN/bvk+ITQMg
DKIM-Signature: a=rsa-sha256; bh=6qnhV0KfRzRNTOXtgcrPk3Utj4TtwNy5dHr6skQlwwM=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1782684598; v=1;
 b=d0qpTCHoDW2YuMmcXqx2pJ6l6lxdLfuCW8eb9xmzHtJcDSSI1B6sqqtbTnUDMURCFYawYynW
 AQilE6qrMoG479olSXs33fCQqJDopV58W/unDltao2Uy157Msw6370dreEyYnKDzpDgPwnS9mWX
 Z1CFqpHBF9R8W/0QiQkGW497GFcBWo1R4nNE91/rgfjLLwik4IiY8jsYN8QDYVqQRaBSGfuSOoc
 Bd57fwsKkLPNisaEPoxk0629fhSE7OqFG6hB3Gj/O06FsfKcJoSOuFGBjkclTn9hgqDT3hIg8Di
 yT0hMthpou+z0pQhfLmy2lH7wm83IF7nZYsGy5U1a3LDQ==
X-purgate-ID: tlsNG-c201ff/1782684598-5461D2B8-51F223CD/0/0
X-purgate-type: clean
X-purgate-size: 5469
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[3mdeb.com:s=ovhmo3617313-selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[3mdeb.com];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:dpsmith@apertussolutions.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:trenchboot-devel@googlegroups.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sergii.dmytruk@3mdeb.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergii.dmytruk@3mdeb.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[3mdeb.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5FE5B6D523A

On Wed, Oct 22, 2025 at 05:13:26PM +0200, Jan Beulich wrote:
> > -/****************************** TPM1.2 specific *******************************/
> > -#define TPM_ORD_Extend              0x00000014
> > -#define TPM_ORD_SHA1Start           0x000000A0
> > -#define TPM_ORD_SHA1Update          0x000000A1
> > -#define TPM_ORD_SHA1CompleteExtend  0x000000A3
> > +/****************************** TPM1.2 & TPM2.0 *******************************/
> >
> > -#define TPM_TAG_RQU_COMMAND         0x00C1
> > -#define TPM_TAG_RSP_COMMAND         0x00C4
> > +/*
> > + * TPM1.2 is required to support commands of up to 1101 bytes, vendors rarely
> > + * go above that. Limit maximum size of block of data to be hashed to 1024.
> > + *
> > + * TPM2.0 should support hashing of at least 1024 bytes.
> > + */
> > +#define MAX_HASH_BLOCK      1024
> >
> >  /* All fields of following structs are big endian. */
> >  struct tpm_cmd_hdr {
> > @@ -168,6 +179,17 @@ struct tpm_rsp_hdr {
> >      uint32_t    returnCode;
> >  } __packed;
> >
> > +/****************************** TPM1.2 specific *******************************/
> > +
> > +#define TPM_ORD_Extend              0x00000014
> > +#define TPM_ORD_SHA1Start           0x000000A0
> > +#define TPM_ORD_SHA1Update          0x000000A1
> > +#define TPM_ORD_SHA1CompleteExtend  0x000000A3
> > +
> > +#define TPM_TAG_RQU_COMMAND         0x00C1
> > +#define TPM_TAG_RSP_COMMAND         0x00C4
> > +
> > +/* All fields of following structs are big endian. */
> >  struct extend_cmd {
> >      struct tpm_cmd_hdr h;
> >      uint32_t pcrNum;
>
> Can the previous patch please put these right in their final resting place?

Some earlier comment of yours requested separate headers for these
definitions, so they aren't moved anymore.

> > +#define PUT_BYTES(p, bytes, size)  do {  \
> > +        memcpy((p), (bytes), (size));    \
>
> Preferably without the excess parentheses, much like you have it ...
>
> > +        (p) += (size);                   \
> > +    } while ( 0 )
> > +
> > +#define PUT_16BIT(p, data) do {          \
> > +        *(uint16_t *)(p) = swap16(data); \
>
> ... e.g. in the function call here.
>
> > +        (p) += 2;                        \
> > +    } while ( 0 )

OK, just tend to always parenthesise parameters in macros.

> > +    cmd_rsp.finish_c = (struct tpm2_sequence_complete_cmd) {
> > +        .h.tag = swap16(TPM_ST_SESSIONS),
> > +        .h.paramSize = swap32(sizeof(cmd_rsp.finish_c) + size),
> > +        .h.ordinal = swap32(TPM2_PCR_EventSequenceComplete),
> > +        .pcrHandle = swap32(HR_PCR + pcr),
> > +        .sequenceHandle = swap32(seq_handle),
> > +        .sessionHdrSize = swap32(sizeof(struct tpm2_session_header)*2),
>
> Why *2? Where to the two session headers go? (Also nit: blanks missing around *.)
>
> > +        .pcrSession.handle = swap32(TPM_RS_PW),
> > +        .sequenceSession.handle = swap32(TPM_RS_PW),
> > +        .dataSize = swap16(size),
> > +    };

Because TPM2_PCR_EventSequenceComplete command has two sessions filled directly
below in .pcrSession and .sequenceSession fields.  Will fix the spacing.

> > +static uint32_t tpm2_hash_extend(unsigned loc, const uint8_t *buf,
> > +                                 unsigned size, unsigned pcr,
> > +                                 const struct tpm2_log_hashes *log_hashes)
> > +{
> > +    uint32_t rc;
> > +    unsigned i;
> > +    struct tpm2_log_hashes supported_hashes = {0};
> > +
> > +    request_locality(loc);
> > +
> > +    for ( i = 0; i < log_hashes->count; ++i )
> > +    {
> > +        const struct tpm2_log_hash *hash = &log_hashes->hashes[i];
> > +        if ( !tpm_supports_hash(loc, hash) )
> > +        {
> > +            printk(XENLOG_WARNING "Skipped hash unsupported by TPM: %d\n",
> > +                   hash->alg);
> > +            continue;
> > +        }
> > +
> > +        if ( hash->alg == TPM_ALG_SHA1 )
> > +        {
> > +            sha1_hash(hash->data, buf, size);
> > +        }
> > +        else if ( hash->alg == TPM_ALG_SHA256 )
> > +        {
> > +            sha2_256_digest(hash->data, buf, size);
> > +        }
> > +        else
>
> Is this really just "else", not "else if ( ... )"?
>
> > +        {
> > +            /* This is called "OneDigest" in TXT Software Development Guide. */
> > +            memset(hash->data, 0, size);
> > +            hash->data[0] = 1;
> > +        }

Yes, only these two algorithms are supported, others are expected to
have some fake values (the next version won't do anything in the
else-branch, leaving that to the caller).

> > +        if ( supported_hashes.count == MAX_HASH_COUNT )
> > +        {
> > +            printk(XENLOG_ERR "Hit hash count implementation limit: %d\n",
> > +                   MAX_HASH_COUNT);
> > +            return -1;
>
> This is an odd return value for a function returning uint32_t. And it's also ...

Will `#define TPM_INTERNAL_ERROR 0xffffffffU`.  TPM only uses the lower
12 bits of UINT32, so there is no ambiguity.

> > +
> > +        rc = tpm2_hash_extend(loc, buf, size, pcr, &log_hashes);
> > +        if ( rc != 0 )
> > +        {
> > +#ifndef __EARLY_SLAUNCH__
> > +            printk(XENLOG_ERR "Extending PCR%u failed with TPM error: 0x%08x\n",
> > +                   pcr, rc);
>
> ... not exactly a TPM error.

Will s/TPM/an/.

Regards,
Sergii

