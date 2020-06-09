Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAE61F3688
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 10:56:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jia33-0006Ki-Ei; Tue, 09 Jun 2020 08:55:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kazQ=7W=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jia32-0006Kd-An
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 08:55:56 +0000
X-Inumbo-ID: 074637d8-aa2f-11ea-bca7-bc764e2007e4
Received: from mail-wm1-x32b.google.com (unknown [2a00:1450:4864:20::32b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 074637d8-aa2f-11ea-bca7-bc764e2007e4;
 Tue, 09 Jun 2020 08:55:55 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id f185so2273414wmf.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 01:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=whQbxEjTBAiunFi9+StDN2xzyiDZ/wqXhFY3gV9qfy0=;
 b=pqlX56SptYsmlclWCiMVUBmlDIV3DqmvaDXZc+3x7VqP4iU55FtrP1uc4pvtYiWRam
 8RPdbMM/PzgTEySFeyrsNOz7EWzrymYQOXjZAsURjXJSDQqJB9RQ0dOv0X+Eoensu4CO
 vg4GpjtMBO1dW1U2fDSPiz6NwLq4zArRbezCTZVVfR9FI+MFex92Uat6DEgHQtYpSqSr
 myqF5VHNKvJRm33EKYgmEvz9HFsstHTDHziHZFKcipMgC+jlfdZ5iXn3PjWOzCbioG62
 tGSMXXawjG4L3nCf1h8bBc44oaNQVooDwyrOxf3Z4pJKu1eXWZ6pZEdh/ZzqOK6O+4BN
 G+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=whQbxEjTBAiunFi9+StDN2xzyiDZ/wqXhFY3gV9qfy0=;
 b=Bk9wfFNb6oS7uiJBUU+gnXe9Mrv3JrPh7+8CnuubLI9mZynKz+djiIp5FLLh3LzN6n
 1AUqO26gpx8hRC7tmUo6oPzd3xVJH9K0vJ9IZ45BRArfNNOTv0n5kCIJaVKIk8qCFJJx
 W9jf1wZfJ5cFHjFb9U6g8DCsiHLXwm0v5hrgU2Er5agEJvX3QWY2mdeuZbMEzP497qeG
 icGXun69rpb4Nb1P7THCgAMdv4mi/IhUX/V9j+eExUpvLnxmBvDjsk48UZ1jeOS58Ksr
 sowCEoVq+1OeMcokiG/qYZTVYPagTkqckWk768nPYlQzb/uJgaajamnyU3GTBEYQYWwU
 KeAA==
X-Gm-Message-State: AOAM532tYI9W077GbhxNGJAuNzMUe+G8uwF+J7sp/p4TzYkX1fnlORMx
 QHXuk18ehepwyCMIuHg78t/TOvKBKLE=
X-Google-Smtp-Source: ABdhPJzC0pYW4v46GAmTbkZ880Yqo1H8iKDriXCPKuF9rFuNPN5/FizT67mIkknjATxuHexhPyHIlg==
X-Received: by 2002:a1c:dd44:: with SMTP id u65mr3147600wmg.180.1591692954485; 
 Tue, 09 Jun 2020 01:55:54 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id h29sm2661115wrc.78.2020.06.09.01.55.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 01:55:53 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Olaf Hering'" <olaf@aepfle.de>,
	<xen-devel@lists.xenproject.org>
References: <20200608203849.18341-1-olaf@aepfle.de>
In-Reply-To: <20200608203849.18341-1-olaf@aepfle.de>
Subject: RE: [PATCH v1] kdd: remove zero-length arrays
Date: Tue, 9 Jun 2020 09:55:52 +0100
Message-ID: <005001d63e3b$c85059f0$58f10dd0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIqIZk/Qusa7Qsu5bkjM27jAUAPHqgoM2NA
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Tim Deegan' <tim@xen.org>, 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Olaf Hering
> Sent: 08 June 2020 21:39
> To: xen-devel@lists.xenproject.org
> Cc: Ian Jackson <ian.jackson@eu.citrix.com>; Olaf Hering <olaf@aepfle.de>; Tim Deegan <tim@xen.org>;
> Wei Liu <wl@xen.org>
> Subject: [PATCH v1] kdd: remove zero-length arrays
> 
> Struct 'kdd_hdr' already has a member named 'payload[]' to easily
> refer to the data after the header.  Remove the payload member from
> 'kdd_pkt' and always use 'kdd_hdr' to fix the following compile error:

Is it not sufficient to just change the declaration of payload in kdd_pkt from [0] to []? In fact I can't see any use of the payload
field in kdd_hdr so it looks like that is the one that ought to be dropped.

  Paul

> 
> kdd.c: In function 'kdd_tx':
> kdd.c:746:30: error: array subscript 65534 is outside the bounds of an interior zero-length array
> 'uint8_t[0]' {aka 'unsigned char[]'} [-Werror=zero-length-bounds]
>   746 |         sum += s->txp.payload[i];
>       |                ~~~~~~~~~~~~~~^~~
> In file included from kdd.c:53:
> kdd.h:326:17: note: while referencing 'payload'
>   326 |         uint8_t payload[0];
>       |                 ^~~~~~~
> cc1: all warnings being treated as errors
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  tools/debugger/kdd/kdd.c | 10 +++++-----
>  tools/debugger/kdd/kdd.h |  3 +--
>  2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/debugger/kdd/kdd.c b/tools/debugger/kdd/kdd.c
> index 3ebda9b12c..4c6b39c22b 100644
> --- a/tools/debugger/kdd/kdd.c
> +++ b/tools/debugger/kdd/kdd.c
> @@ -249,7 +249,7 @@ static void kdd_log_pkt(kdd_state *s, char *name, kdd_pkt *p)
> 
>      /* Re-check the checksum */
>      for (i = 0; i < p->h.len; i++)
> -        sum += p->payload[i];
> +        sum += p->h.payload[i];
> 
>      fprintf(f, "\n"
>              "%s: %s type 0x%4.4"PRIx16" len 0x%4.4"PRIx16
> @@ -267,8 +267,8 @@ static void kdd_log_pkt(kdd_state *s, char *name, kdd_pkt *p)
>              fprintf(f, "%8.8x ", i);
>          } else if (i % 8 == 0)
>              fprintf(f, " ");
> -        fprintf(f, " %2.2x", p->payload[i]);
> -        ascii[i % 16] = (isprint(((int)p->payload[i])) ? p->payload[i] : 0x2e);
> +        fprintf(f, " %2.2x", p->h.payload[i]);
> +        ascii[i % 16] = (isprint(((int)p->h.payload[i])) ? p->h.payload[i] : 0x2e);
>          if (i % 16 == 15)
>              fprintf(f, "  |%s|\n", ascii);
>      }
> @@ -743,7 +743,7 @@ static void kdd_tx(kdd_state *s)
> 
>      /* Fix up the checksum before we send */
>      for (i = 0; i < s->txp.h.len; i++)
> -        sum += s->txp.payload[i];
> +        sum += s->txp.h.payload[i];
>      s->txp.h.sum = sum;
> 
>      kdd_log_pkt(s, "TX", &s->txp);
> @@ -1127,7 +1127,7 @@ static void kdd_handle_pkt(kdd_state *s, kdd_pkt *p)
> 
>      /* Simple checksum: add all the bytes */
>      for (i = 0; i < p->h.len; i++)
> -        sum += p->payload[i];
> +        sum += p->h.payload[i];
>      if (p->h.sum != sum) {
>          kdd_send_ack(s, p->h.id, KDD_ACK_BAD);
>          return;
> diff --git a/tools/debugger/kdd/kdd.h b/tools/debugger/kdd/kdd.h
> index bfb00ba5c5..57525d36c6 100644
> --- a/tools/debugger/kdd/kdd.h
> +++ b/tools/debugger/kdd/kdd.h
> @@ -68,7 +68,7 @@ typedef struct {
>      uint16_t len;     /* Payload length, excl. header and trailing byte */
>      uint32_t id;      /* Echoed in responses */
>      uint32_t sum;     /* Unsigned sum of all payload bytes */
> -    uint8_t payload[0];
> +    uint8_t payload[];
>  } PACKED kdd_hdr;
> 
>  #define KDD_PKT_CMD 0x0002      /* Debugger commands (and replies to them) */
> @@ -323,7 +323,6 @@ typedef struct {
>          kdd_msg msg;
>          kdd_reg reg;
>          kdd_stc stc;
> -        uint8_t payload[0];
>      };
>  } PACKED kdd_pkt;
> 



