Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EF87E49FA
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 21:41:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629032.981079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0SsU-0000zZ-32; Tue, 07 Nov 2023 20:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629032.981079; Tue, 07 Nov 2023 20:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0SsU-0000xW-01; Tue, 07 Nov 2023 20:40:50 +0000
Received: by outflank-mailman (input) for mailman id 629032;
 Tue, 07 Nov 2023 20:40:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zQVP=GU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r0SsT-0000xQ-2H
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 20:40:49 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee9b7072-7dad-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 21:40:48 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9bf86b77a2aso918614066b.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Nov 2023 12:40:48 -0800 (PST)
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
X-Inumbo-ID: ee9b7072-7dad-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699389648; x=1699994448; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/waG3YMaR/wF6ucum55gEPW5J9JFoMdxaO+1rnmtdEI=;
        b=V1+TOTRc4Ej46imp9XigfePg1mx+Soj0xrcmnzAUjcJ8hMTc77QDDCdTRimsrKH9Gq
         2TEpD+1+xsJlFUtq4pOcdKJXLrMLM79eS0jLb73Wo4YibRb+26VuyA9+F8WIsr0aP9Af
         T8nI8fdQDxT3pt1X2rm+m0aWdDDqrJU+Woaef4sJ6q9Aqv0Yzq3/NhgqdZJWhqrq6Fl2
         4BvHU1iF6bVQAqAVZ1Gla2oZ2Lvla5dGPWJKa0q+PRfwpaTBNsmge1JfUbecgvoe53sm
         +KDTVhG1ellPAAnZuCVa30AAx/oRMUHgWKa2i4Fw+KsYwoulatCX3wm3rllGRm5blclF
         Hgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699389648; x=1699994448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/waG3YMaR/wF6ucum55gEPW5J9JFoMdxaO+1rnmtdEI=;
        b=tgfml84qrDVN2GnX53YnDmgbWxzyv4vAxR9IzBA3mpE7qIAvpjzVb3b7ENoFzjyIij
         NdfR3F3Sc7caPV1kvjRUh4knJL0kElp3VDPSuQkBWoH/lp67RHlR54nqQabxfsKHVBcL
         m+3WHpCXqt00i++Zg5oF8QxFes6ZtOgtaY3U/M/rjkL9slf+lxFnQizzAtDIUJ5o6DJp
         Nje3QlL+2u5CJ0n07aJQoE466TOKnwUe7eNI/MWBToBBqDHJAbQUVcQXSQAnp4wp3VHt
         OKB+YVxysEL824DyxiYCrxiEN8fW04VdUKYx+L0OVU5lewOGSC8eXN4kB2TOZ4gDiYY+
         i60g==
X-Gm-Message-State: AOJu0YzIXe6XzXInxyMXrHyv1CLYv1lnldJxLQ8pKfOloISaD6yzkCsu
	vFTsbhBHHe0Eiwp01rlinMUfpAkNnLkOYP/IeLM=
X-Google-Smtp-Source: AGHT+IGdX7LQ+5A+PAwOaby0Z2e5vSPDQpI7gb/Ze/9WpdeqU+N2JYhf2HR2yGS84J5etrDlQ9GFAJKVuuw95pigefQ=
X-Received: by 2002:a17:907:3e1f:b0:9de:be52:608a with SMTP id
 hp31-20020a1709073e1f00b009debe52608amr9241740ejc.27.1699389647698; Tue, 07
 Nov 2023 12:40:47 -0800 (PST)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-30-jgross@suse.com>
In-Reply-To: <20231101093325.30302-30-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 7 Nov 2023 15:40:35 -0500
Message-ID: <CAKf6xpuy=3VsTU4tpz9Gn1WKq3wzpQj+gx1KVRbqzYz77ZC6QA@mail.gmail.com>
Subject: Re: [PATCH 29/29] tools/xenstored: have a single do_control_memreport()
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 6:55=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> With 9pfs now available in Xenstore-stubdom, there is no reason to
> have distinct do_control_memreport() variants for the daemon and the
> stubdom implementations.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

