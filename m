Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED31DB48894
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 11:33:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114940.1461724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvYFZ-0006p2-VN; Mon, 08 Sep 2025 09:33:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114940.1461724; Mon, 08 Sep 2025 09:33:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvYFZ-0006mV-St; Mon, 08 Sep 2025 09:33:25 +0000
Received: by outflank-mailman (input) for mailman id 1114940;
 Mon, 08 Sep 2025 09:33:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/zpM=3T=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uvYFZ-0006mP-6W
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 09:33:25 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddc4cbb3-8c96-11f0-9d13-b5c5bf9af7f9;
 Mon, 08 Sep 2025 11:33:24 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-56088927dcbso5198159e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Sep 2025 02:33:24 -0700 (PDT)
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
X-Inumbo-ID: ddc4cbb3-8c96-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757324004; x=1757928804; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMwsIgKn4wUaEskwvBxZtpRU7mhGPnrjI7rs056tFNg=;
        b=d3V8fyayMhoYM3HWAMoENiQrSz0QWPeJRYa91mgNdm2TpLIhhLQJ+OHj2mMtU5B4hk
         MUDKaDOoWqy8nps45A3W6tHsfhQWDaW12M9QFffVZ5Gapa8OTf7e0Ifs/R5szSHRBPM6
         MhqkPNO/Bo571V8Hk51jIC1U/wAYoGx0BJWnJCKpyrp5ZGAs38UFe0EBOcUP3Dh4YvBs
         ggfMbvuDTloU+Imu6DpqZQKyB7HtRvKLIYp5Oy6jzLUW21BR59RufDW4Xf9CHmlLPzf/
         In0+WdREqKVyv0DDcYs2qXdrj6XB8eNDyqxuK2b2rKMB42wATPaX1j3vRR4ZU7rsz5d0
         afww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757324004; x=1757928804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMwsIgKn4wUaEskwvBxZtpRU7mhGPnrjI7rs056tFNg=;
        b=GxMtqmEe07BzpRhW+WcTYHNLfIrgi5ToEm+vMQ3EHiZnz+vU00MO4kfy9Wo4Q4QEW7
         YD4qKNXYaxXIX8/FEZRtiJAeflo8IRxqoY1LGNGfWboM/XfcCO+fh9fomakADeCUFuBU
         RRucQJxxseo7NwCopAIX4gn3yLbjAvJefpMeLvsbpFi/wUFdixAY1EZ5kcMOtZyBRpAV
         N5ekRnTSlkjqWRdhf0GT3G6ZlkDN5HE3o+kzaOQoF70waGZQkvCJNl8nG9aEQvGF5tWO
         7+9FIHyvWaw1LdW2bLaDtHKZnCNQOjqW6C2H4IWPYrWICX27j6zBkOE+MiTRqNYR9mQJ
         IXXA==
X-Gm-Message-State: AOJu0YzHRnlzljwLRsZQhRUCT/0wCbqXJvLB8pHMKSjioPuY+sWJSGxG
	fF43k7aNwcdZI88PuMzmHOm0yYPY+2Q7NsXm9BTT7wZhElbRanY+CAtcOSvVIpNeza1Jbz+bjxf
	d3ybWTOla3SmqW2NypusOg5WYW0Iq2HE=
X-Gm-Gg: ASbGncuP+x1ouN2bQJa3D+WqpDyKXQikcbEZQzuFgeHbnIjDS+JrP2vncPeMvi+oNdj
	wJ5ajysp/N8iauE/c5bD1N49oyyMe518NwG7d0ZJNaR0mgHL65Q6zvO8UNNExuZf8UMd3z8/acD
	gDvTsgE3tjjyvgN9+61whGTebca/GVk2jfDB2nZkQ7S++30ZV81fmjRGaXfbCA4865v7FIA0PJI
	NpOagIBIhjl4q8T
X-Google-Smtp-Source: AGHT+IEmgyBkUVkOmQ4lE7SXlGjIq1NWBD1MGxHCxdtMxYnhMjSPohPUF0IDKYUMXDuqoBjlx98GzRjud2Xprx8KcD0=
X-Received: by 2002:a05:6512:230b:b0:55f:6831:6f01 with SMTP id
 2adb3069b0e04-562617e6c0emr1724073e87.40.1757324003489; Mon, 08 Sep 2025
 02:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <d5136292-e02d-47bc-b230-c85c6aba2174@suse.com>
In-Reply-To: <d5136292-e02d-47bc-b230-c85c6aba2174@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 8 Sep 2025 12:33:10 +0300
X-Gm-Features: Ac12FXxqyH6WF70_HfUbrzDkULlc2J6-iRJwDnwuwDMatnVmPC2JT7Oa0hQjSXs
Message-ID: <CAGeoDV-+8HNu9aVO5VVKy_hvpHwtHSegceKDW3MeMg6_KsxsQA@mail.gmail.com>
Subject: Re: [PATCH] symbols: fix xensyms_read() hitting the final "end" symbol
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Mon, Sep 8, 2025 at 12:22=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> A new "no (more) symbol" path there was lacking a necessary unlock.
>
> Fixes: d3b637fba31b ("symbols: arrange to know where functions end")
> Coverity ID: 1665212
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/common/symbols.c
> +++ b/xen/common/symbols.c
> @@ -202,7 +202,10 @@ int xensyms_read(uint32_t *symnum, char
>      {
>          ++next_offset;
>          if ( ++*symnum =3D=3D symbols_num_addrs )
> +        {
> +            spin_unlock(&symbols_mutex);
>              goto no_symbol;
> +        }
>      }
>
>      *type =3D symbols_get_symbol_type(next_offset);
>

Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>

Best regards,
Mykola

