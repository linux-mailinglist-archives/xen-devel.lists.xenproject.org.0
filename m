Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPQSJEpKqmlkOgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 04:30:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E195221B1C3
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 04:30:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247359.1546055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyLsQ-0007gt-VM; Fri, 06 Mar 2026 03:29:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247359.1546055; Fri, 06 Mar 2026 03:29:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyLsQ-0007eJ-Rs; Fri, 06 Mar 2026 03:29:22 +0000
Received: by outflank-mailman (input) for mailman id 1247359;
 Fri, 06 Mar 2026 03:29:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GgqK=BG=gmail.com=soumyajyotisarkar23@srs-se1.protection.inumbo.net>)
 id 1vyLsP-0007eD-2m
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 03:29:21 +0000
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [2a00:1450:4864:20::642])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8e61b36-190c-11f1-b164-2bf370ae4941;
 Fri, 06 Mar 2026 04:29:19 +0100 (CET)
Received: by mail-ej1-x642.google.com with SMTP id
 a640c23a62f3a-b935cd1c6f3so1350864066b.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2026 19:29:19 -0800 (PST)
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
X-Inumbo-ID: a8e61b36-190c-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1772767758; cv=none;
        d=google.com; s=arc-20240605;
        b=dj314FPANkDIr3AMmNX9dEGmdKHbtns2FBWiu+5U3aIZ3utiG5t/BfBQRFjisJeBk+
         yVxiLJpvva0CVyyRhk/X9UVOSTMB1qTP2NddJiRrPu4RPYgEL3GDlTcBHadgseumZEGf
         YD9/B1Bk0UsIr2HnCcUbiV+7Kdd3R0k+RodWrEKAXHsRYasAc/pzAV5g1x6gvc5o5e5U
         /NfPXM+ycMNEqrJ9tJD4DcCn1XTvqniow2OnqHvcsHn8yGQPQ5yvBheZJub9lRduYm1G
         +nlY5vrE2KRmQ/PWJGP3k3hb5NOBt2vJRfxM7nIObrkeGYPdqDUESAN7bwh273cyo+3J
         N89g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XoxbFDZsmQse7pjbVYXTdtM53ZFTNHC86YvKyQzdLDY=;
        fh=5FPMNlxonDnoIoIMaWMAzT+Br+bG5xkQLfcZfXfS980=;
        b=byc4hknhqyA7q/WNZBiICPGJTA8N6/AWfY/PAU1jgksb0y5KVuvZp/LyHBo8g+tEzb
         tM2xtjkFvwsoALDDOVWsQ/51lxwc8qH1C5g3HKJvDesj+Ot1wIYw7Iu37LnhDSxkewrM
         /BDtN92/ZR2i/kmTIBwq9PjaxOlybt3rqlsfclXFg+7Q7a2MjyWKukb4nF7JO+9yjonn
         ROji4OZzkTygRNo3SZ0NpClBBqJUoRPAZZuegCBX+tcGE8uNdg2IGx5vTqbj/2y22Hqn
         FbSYUI4sjNuJP6xSXIqKW2esf7gt8J1goPBETfjzMTZESaG3lGWBI5g/HysqZ52JOMRH
         WD4A==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772767758; x=1773372558; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XoxbFDZsmQse7pjbVYXTdtM53ZFTNHC86YvKyQzdLDY=;
        b=JBRbVXZIrIZB4gvESd1FL5xUggFlaRBkhzx9MmdzoJUJ9d86kv40fs6PI9ud723J38
         ePu3Oj08XeRmfLp5QGQJPOvhDkpCwrVqpV5NJ5y1nauehRbK5mMLxBaD4B2ZMKD2OxDE
         Nv+EBri29Ik0Fr+zca7yW+/KU7uLliQ1zDxUfbFaAaLQ+TfXTsMtwukg59kUCoGj3lmD
         MrjDLZsyVuM9lE3Cra9gzz5MKEdAdhDNzUV9AI5Mkq+WgwEnmrxqxP9H7kNYpCgUZugQ
         9VW7Y2taVqgkidzwRMQPws3zawm2Q0t8AsMULpi/W84rRwKn+JpuftVjOja9Qg0HYYDZ
         zopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772767758; x=1773372558;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoxbFDZsmQse7pjbVYXTdtM53ZFTNHC86YvKyQzdLDY=;
        b=rD8/sgeDtxyrAGKmz34hd+xJyqJaCxAZueRw4ThzdPs+lzsy/derOhR//WBtgNfZ0G
         1ecACbmYTeDTxgC0tjrRSPuxxYeVENCToU1c8xv2oLseFvM/N7B0N4lxRm2WAgeL6uJT
         Ym/8ltPCr379wgMsavUd8GZTzR9kV9H9QqkcKhp7n+4yYw8TjZx9NcIq/CDo26AcIA3N
         TeLM5hnCEe0MEunzNBY19z4xM/jJZrhLcY/WTz7ciYrpn8ZqlJPKLub9MQVUQy5Gy/YX
         LdCBims62XiDwnzKB8i9fWIhvMIdeoXPzp/MKX5bIiXxBeKd4tUq0fGo7kzlLw3z42x7
         n+hw==
X-Gm-Message-State: AOJu0YzaMYg0g5BRQTRCvIYKYvuZn9St7rtGHFrctICV1pTntnMYrMTW
	QASB3IDlZlz8S/Ul+5mBQAjhVifCd4yEbjLBFRxTlBW5OMFoZ8xnDoyWxLlyRHJ6eOurp8Ku/4b
	OraKw6YtI3Mkugui9/Ce1pObZbLWwp24=
X-Gm-Gg: ATEYQzz6uKBFGQ0kgdICjiKpXSDytAgfHaOR5w3hcFSqZuUewUVflsakxY5xKO9tATo
	27MJCk+2nA6CxZ+0jM9UvPGTDlTndwzR6HFR4oi6GX/8W+7bLzWDY9DY76AahslqCWq49ykDnn9
	SF0zCZuctYcqa2hwPra2vSE1i5MAl+D+3DUy8/HWsOtWNHOjTTAO/dqkf6SIhS4aMB3ZFt4CE4i
	Lie8SxiHmoNzD3rDPrKkIHP7YoqAeMDzpCAkGz7sJGTQRMkvvWHpcb0VeLAsoSj7zqYGZUvE8Xz
	lLOzRyzLJ04GpZ2J1v6azSJFILn+VQ6bjPG+PPed1uxbfo9IdkaGgjvcRG4MBQG3+OYZcY/4TeI
	nUqfFfuO/ukxvjQkkzL0mruDPB1YGjrVc23AfqtnAByj5JOTO
X-Received: by 2002:a17:907:9723:b0:b90:e278:a09a with SMTP id
 a640c23a62f3a-b942e0260a7mr28817066b.55.1772767758275; Thu, 05 Mar 2026
 19:29:18 -0800 (PST)
MIME-Version: 1.0
References: <20260305191810.31033-1-soumyajyotisarkar23@gmail.com>
 <20260305191810.31033-3-soumyajyotisarkar23@gmail.com> <aaoznRwdCKzRvKlD@mail-itl>
In-Reply-To: <aaoznRwdCKzRvKlD@mail-itl>
From: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Date: Fri, 6 Mar 2026 08:59:07 +0530
X-Gm-Features: AaiRm501VytSKcWIeZ-pqT47TTKnIOV6BYY3Ufp6EbWr56GD6d41Jw1euOFh5Ck
Message-ID: <CAGkZZ+tjOGskPuSipkkOBjussxy5h_fDhNOMt-6Q9cqWJQi4kw@mail.gmail.com>
Subject: Re: [PATCH 2/3] x86/acpi: Remove BGRT invalidation code
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com, 
	Jan Beulich <jbeulich@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000805590064c52a809"
X-Rspamd-Queue-Id: E195221B1C3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,suse.com,apertussolutions.com,citrix.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,m:jbeulich@suse.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

--000000000000805590064c52a809
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 6, 2026 at 7:23=E2=80=AFAM Marek Marczykowski-G=C3=B3recki <
marmarek@invisiblethingslab.com> wrote:

> On Fri, Mar 06, 2026 at 12:48:09AM +0530, Soumyajyotii Ssarkar wrote:
> > Now that BGRT images are preserved during EFI boot (via
> > EfiACPIReclaimMemory allocation), the invalidation code in
> > acpi_parse_bgrt() is no longer needed. The BGRT table remains
> > valid throughout boot.
> >
> > This removes the code that was marking BGRT invalid when the
> > image memory was detected as unavailable, which was causing
> > ACPI warnings in Linux dom0.
>
> When preserving failed for any reason, or when it was disabled (the next
> patch), the entry still should be invalidated. In fact, the check here
> for RAM_TYPE_CONVENTIONAL may already disable invalidation when it got
> preserved?
>
> --
> Best Regards,
> Marek Marczykowski-G=C3=B3recki
> Invisible Things Lab
>


I could move forward with dropping the [PATCH 2/3]. And adapt the other
patches accordingly.
This would serve as a safety net in case the preservation fails for any
reason. Would that be a valid approach?

Thank You,
Soumyajyotii Ssarkar

--000000000000805590064c52a809
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Mar 6, 2026 at 7:23=E2=80=AFAM Ma=
rek Marczykowski-G=C3=B3recki &lt;<a href=3D"mailto:marmarek@invisiblething=
slab.com">marmarek@invisiblethingslab.com</a>&gt; wrote:</div><div class=3D=
"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Fri, Mar 06, 2026 at 12:48:09AM +0530, Soumyajyotii Ssarkar w=
rote:<br>
&gt; Now that BGRT images are preserved during EFI boot (via<br>
&gt; EfiACPIReclaimMemory allocation), the invalidation code in<br>
&gt; acpi_parse_bgrt() is no longer needed. The BGRT table remains<br>
&gt; valid throughout boot.<br>
&gt; <br>
&gt; This removes the code that was marking BGRT invalid when the<br>
&gt; image memory was detected as unavailable, which was causing<br>
&gt; ACPI warnings in Linux dom0.<br>
<br>
When preserving failed for any reason, or when it was disabled (the next<br=
>
patch), the entry still should be invalidated. In fact, the check here<br>
for RAM_TYPE_CONVENTIONAL may already disable invalidation when it got<br>
preserved?<br>
<br>
-- <br>
Best Regards,<br>
Marek Marczykowski-G=C3=B3recki<br>
Invisible Things Lab<br></blockquote><div><br></div><div><br></div><div>I c=
ould move forward with dropping the [PATCH 2/3]. And adapt the other patche=
s accordingly.</div><div>This would serve as a safety=C2=A0net in case the =
preservation fails for any reason. Would that be a valid approach?</div><di=
v><br></div><div>Thank You,</div><div>Soumyajyotii Ssarkar</div></div></div=
>

--000000000000805590064c52a809--

