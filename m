Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE3B1DB09D
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 12:51:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbMIx-0005Lj-4N; Wed, 20 May 2020 10:50:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EGgk=7C=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jbMIv-0005Le-Hu
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 10:50:29 +0000
X-Inumbo-ID: b7b326f6-9a87-11ea-ae69-bc764e2007e4
Received: from mail-ej1-x62b.google.com (unknown [2a00:1450:4864:20::62b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7b326f6-9a87-11ea-ae69-bc764e2007e4;
 Wed, 20 May 2020 10:50:28 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id d7so3196868eja.7
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2020 03:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=kXc3YsXD6WdzJLKK/MADRHqsmnNYXZb1UrKhbte5gqU=;
 b=diYlybjPAwMFN/TSud4BonXo4C/RCNMpGBar/EgLWY9VzP3qUu3qPtGo7DdldZ5U/I
 CJPFwu5pNuzzUNEhUmiS3gXBQJ47b6Fz05CCtEdQkYBWmaSusB11x4beyc47Pe7fCgPL
 zQC3vD7fy3XJ0WckAsEzLcKjcC1r/Ia+/wDWIK7OlLPw1h17RU2BbjPGhkU5savowTQ6
 A2+NWoxKwpJQSPFO1i0ueJHRaI4EE4XGLXeYy93bYmGr6uX86vVf+2Dy3eF1NkAznHXU
 NvANnPtOcad9mfzJgxSvZppGGDGJZyxOkQIrfldNNC+TtGd9CBUYUtAaQxeZeEnuBUZv
 qFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=kXc3YsXD6WdzJLKK/MADRHqsmnNYXZb1UrKhbte5gqU=;
 b=pQ6Y1Y2+3F9m7cVCpjHvpPimwVyUG8D4jiXybgzWplqr8+KL9e7ltM/9WYy5G37BG6
 RM/79EdgbLaPPSrbpyjjEvLVzmcmYSBe7kESU9kA2g62IKSeARBarhpjd/u85bv/My0W
 q99X+1HSwL4QpAZqqsQJnSznTHmJtFkbVN85G6MJcHUOUxaWoPiVTxh3aFWdsLeTvbGW
 eJDUI5S9xRnfEZ5izXnEgAsjsrdWDmlBsI6R8U9nflHPZQlV2CXTiYlwyb9Go30xSJJA
 OLHYqvql6NmPRhBukvWAAaYYCAOFj4Snd3E3ckLyj82ZCdZfSAm/q+StBy18leFSt9Go
 Fi7w==
X-Gm-Message-State: AOAM532euLZ0ol9BwXQSBN3EX6Y42cKjdLRAKFfj/iOvJDmT9APrcms+
 3eGjkBLtUAokPI0b85zAAT8=
X-Google-Smtp-Source: ABdhPJzwoKWYQshUjlG53R7HghVrVszBOYZcRQ6iXW1dZpJqVY12+qoQYbfCLiAyYk57d5t46mxxfA==
X-Received: by 2002:a17:906:4815:: with SMTP id
 w21mr3340872ejq.533.1589971827772; 
 Wed, 20 May 2020 03:50:27 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id oq4sm1606166ejb.0.2020.05.20.03.50.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 May 2020 03:50:27 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Juergen Gross'" <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <20200520101605.4263-1-jgross@suse.com>
In-Reply-To: <20200520101605.4263-1-jgross@suse.com>
Subject: RE: [PATCH] docs: update xenstore-migration.md
Date: Wed, 20 May 2020 11:50:25 +0100
Message-ID: <002a01d62e94$78de4b40$6a9ae1c0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJtc1rpVxCWDPAud8mNEtXyIsLDq6eCQa8g
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Juergen Gross
> Sent: 20 May 2020 11:16
> To: xen-devel@lists.xenproject.org
> Cc: Juergen Gross <jgross@suse.com>; Stefano Stabellini <sstabellini@kernel.org>; Julien Grall
> <julien@xen.org>; Wei Liu <wl@xen.org>; Andrew Cooper <andrew.cooper3@citrix.com>; Ian Jackson
> <ian.jackson@eu.citrix.com>; George Dunlap <george.dunlap@citrix.com>; Jan Beulich <jbeulich@suse.com>
> Subject: [PATCH] docs: update xenstore-migration.md
> 
> Update connection record details: make flags common for sockets and
> domains, and add pending incoming data.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

LGTM

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
>  docs/designs/xenstore-migration.md | 63 ++++++++++++++++--------------
>  1 file changed, 34 insertions(+), 29 deletions(-)
> 
> diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
> index 34a2afd17e..e361d6b5e7 100644
> --- a/docs/designs/xenstore-migration.md
> +++ b/docs/designs/xenstore-migration.md
> @@ -147,31 +147,45 @@ the domain being migrated.
>  ```
>      0       1       2       3       4       5       6       7    octet
>  +-------+-------+-------+-------+-------+-------+-------+-------+
> -| conn-id                       | conn-type     | conn-spec
> +| conn-id                       | conn-type     | flags         |
> ++-------------------------------+---------------+---------------+
> +| conn-spec
>  ...
>  +-------------------------------+-------------------------------+
> -| data-len                      | data
> -+-------------------------------+
> +| in-data-len                   | out-data-len                  |
> ++-------------------------------+-------------------------------+
> +| data
>  ...
>  ```
> 
> 
> -| Field       | Description                                     |
> -|-------------|-------------------------------------------------|
> -| `conn-id`   | A non-zero number used to identify this         |
> -|             | connection in subsequent connection-specific    |
> -|             | records                                         |
> -|             |                                                 |
> -| `conn-type` | 0x0000: shared ring                             |
> -|             | 0x0001: socket                                  |
> -|             | 0x0002 - 0xFFFF: reserved for future use        |
> -|             |                                                 |
> -| `conn-spec` | See below                                       |
> -|             |                                                 |
> -| `data-len`  | The length (in octets) of any pending data not  |
> -|             | yet written to the connection                   |
> -|             |                                                 |
> -| `data`      | Pending data (may be empty)                     |
> +| Field          | Description                                  |
> +|----------------|----------------------------------------------|
> +| `conn-id`      | A non-zero number used to identify this      |
> +|                | connection in subsequent connection-specific |
> +|                | records                                      |
> +|                |                                              |
> +| `flags`        | A bit-wise OR of:                            |
> +|                | 0001: read-only                              |
> +|                |                                              |
> +| `conn-type`    | 0x0000: shared ring                          |
> +|                | 0x0001: socket                               |
> +|                | 0x0002 - 0xFFFF: reserved for future use     |
> +|                |                                              |
> +| `conn-spec`    | See below                                    |
> +|                |                                              |
> +| `in-data-len`  | The length (in octets) of any data read      |
> +|                | from the connection not yet processed        |
> +|                |                                              |
> +| `out-data-len` | The length (in octets) of any pending data   |
> +|                | not yet written to the connection            |
> +|                |                                              |
> +| `data`         | Pending data, first read data, then written  |
> +|                | data (any of both may be empty)              |
> +
> +In case of live update the connection record for the connection via which
> +the live update command was issued will contain the response for the live
> +update command in the pending write data.
> 
>  The format of `conn-spec` is dependent upon `conn-type`.
> 
> @@ -182,8 +196,6 @@ For `shared ring` connections it is as follows:
> 
>  ```
>      0       1       2       3       4       5       6       7    octet
> -                                                +-------+-------+
> -                                                | flags         |
>  +---------------+---------------+---------------+---------------+
>  | domid         | tdomid        | evtchn                        |
>  +-------------------------------+-------------------------------+
> @@ -198,8 +210,6 @@ For `shared ring` connections it is as follows:
>  |           | it has been subject to an SET_TARGET              |
>  |           | operation [2] or DOMID_INVALID [3] otherwise      |
>  |           |                                                   |
> -| `flags`   | Must be zero                                      |
> -|           |                                                   |
>  | `evtchn`  | The port number of the interdomain channel used   |
>  |           | by `domid` to communicate with xenstored          |
>  |           |                                                   |
> @@ -211,8 +221,6 @@ For `socket` connections it is as follows:
> 
> 
>  ```
> -                                                +-------+-------+
> -                                                | flags         |
>  +---------------+---------------+---------------+---------------+
>  | socket-fd                     | pad                           |
>  +-------------------------------+-------------------------------+
> @@ -221,9 +229,6 @@ For `socket` connections it is as follows:
> 
>  | Field       | Description                                     |
>  |-------------|-------------------------------------------------|
> -| `flags`     | A bit-wise OR of:                               |
> -|             | 0001: read-only                                 |
> -|             |                                                 |
>  | `socket-fd` | The file descriptor of the connected socket     |
> 
>  This type of connection is only relevant for live update, where the xenstored
> @@ -398,4 +403,4 @@ explanation of node permissions.
> 
>  [3] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/include/public/xen.h;hb=HEAD#l612
> 
> -[4] https://wiki.xen.org/wiki/XenBus
> \ No newline at end of file
> +[4] https://wiki.xen.org/wiki/XenBus
> --
> 2.26.1
> 



