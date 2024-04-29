Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5A38B5C32
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:01:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714127.1115175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SUo-0006oz-P4; Mon, 29 Apr 2024 15:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714127.1115175; Mon, 29 Apr 2024 15:00:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SUo-0006mp-KO; Mon, 29 Apr 2024 15:00:46 +0000
Received: by outflank-mailman (input) for mailman id 714127;
 Mon, 29 Apr 2024 15:00:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hXAa=MC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s1SUm-00061u-Ic
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:00:44 +0000
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 404a482c-0639-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 17:00:43 +0200 (CEST)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-4376e3fd7e4so26387901cf.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 08:00:43 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 k3-20020ac81403000000b00434b1f4e371sm10390572qtj.13.2024.04.29.08.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 08:00:42 -0700 (PDT)
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
X-Inumbo-ID: 404a482c-0639-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714402842; x=1715007642; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIQL44q1facCYinF0oLLBfEQhZ81h9VJYnFL1TS4smQ=;
        b=ocfhCp3Eg4E1PPDLGCmfEtk61vZtapxxszL+gR/9/p6og6tIz1RMiQCFbqUbfV8Uri
         sMs/VaEzOWphg0kxzE1Ckw2s23BEsqp9Pieq/ZrUi7/9WfZekl54lE4ZgEbtBwAwFZvp
         Ok4Renic0ShephJOHlfTrNm9UJt/i1GMyYNOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714402842; x=1715007642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tIQL44q1facCYinF0oLLBfEQhZ81h9VJYnFL1TS4smQ=;
        b=s/2hw6fjjNh0O431fPqeAkmT7fVTx/JkrLnb5Of6aBojDeCcdL+a/ZkV5iDXDDWRE5
         cQDPN0OpVr+4l83xtF00U5sfNVhu3RvdsISo8t58oUCXVPlQlIbQ5gP8fFFdSZQZWQNS
         jUgyOAzp9PTTJmwAdC0yz8avlVp7bu4DOR5xETLqZiXiRkBhPUd7HJ0mvkc7ZjfxLjjQ
         2UJdnKZ6AaVpp1aknr23dMyXgsnUJmBz2MkrQR4Y6gwW8SBiEprh46mfoyuqzF+X5HtL
         L4xGATUEVJoW0qXukc6wZevOXZmUte/9laBQwMxYkeRTjocVk1YPgqc6ZZ6suEIfNVld
         o9dg==
X-Gm-Message-State: AOJu0YzPDjNdlRgfuiMGDUZnDEUTYLJ/7IXS6qZF/PIFZTtQtKNJDr20
	8Lj8Rwj6SyeJ217Wz9IX+cHNQgHHciPes52t0rzelS0XHrdXzevRRJrQl0UwRfhVp5K8WBT+dqt
	C
X-Google-Smtp-Source: AGHT+IE7GahoqRxCd3aGn0U1XCVeiA/KWYl/oQDUK2088DWFjxKaP1VEXT07v9R6T974NWvCaqkJhw==
X-Received: by 2002:a05:622a:1921:b0:437:bcac:a770 with SMTP id w33-20020a05622a192100b00437bcaca770mr14426957qtc.55.1714402842435;
        Mon, 29 Apr 2024 08:00:42 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: konrad.wilk@oracle.com,
	ross.lagerwall@citrix.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 3/9] livepatch-build: fix detection of structure sizes
Date: Mon, 29 Apr 2024 16:56:48 +0200
Message-ID: <20240429145654.71669-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429145654.71669-1-roger.pau@citrix.com>
References: <20240429145654.71669-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current runes assume that in the list of DWARF tags DW_AT_byte_size will
come after DW_AT_name, but that's not always the case.  On one of my builds
I've seen:

    <b618>   DW_AT_name        : (indirect string, offset: 0x3c45): exception_table_entry
    <b61c>   DW_AT_declaration : 1
 <1><b61c>: Abbrev Number: 5 (DW_TAG_const_type)
    <b61d>   DW_AT_type        : <0xb617>
 <1><b621>: Abbrev Number: 14 (DW_TAG_pointer_type)
    <b622>   DW_AT_byte_size   : 8

Instead of assuming such order, explicitly search for the DW_AT_byte_size tag
when a match in the DW_AT_name one is found.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
All this ad hoc parsing of DWARF data seems very fragile.  This is an
improvement over the current logic, but I would still prefer if we could find a
more reliable way to obtain the struct sizes we need.
---
 livepatch-build | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/livepatch-build b/livepatch-build
index f3ca9399d149..aad9849f2ba9 100755
--- a/livepatch-build
+++ b/livepatch-build
@@ -427,9 +427,16 @@ if [ "${SKIP}" != "build" ]; then
     SPECIAL_VARS=$(readelf -wi "$OUTPUT/xen-syms" |
                awk '
                BEGIN { a = b = e = 0 }
+               # Ensure no fall through to the next tag without getting the size
+               (a == 1 || b == 1 || e == 1) && /DW_AT_name/ \
+                   {print "can not get special structure size" > "/dev/stderr"; exit 1}
                a == 0 && /DW_AT_name.* alt_instr/ {a = 1; next}
                b == 0 && /DW_AT_name.* bug_frame/ {b = 1; next}
                e == 0 && /DW_AT_name.* exception_table_entry/ {e = 1; next}
+               # Seek the line that contains the size
+               a == 1 && !/DW_AT_byte_size/ {next}
+               b == 1 && !/DW_AT_byte_size/ {next}
+               e == 1 && !/DW_AT_byte_size/ {next}
                # Use shell printf to (possibly) convert from hex to decimal
                a == 1 {printf("export ALT_STRUCT_SIZE=`printf \"%%d\" \"%s\"`\n", $4); a = 2}
                b == 1 {printf("export BUG_STRUCT_SIZE=`printf \"%%d\" \"%s\"`\n", $4); b = 2}
-- 
2.44.0


