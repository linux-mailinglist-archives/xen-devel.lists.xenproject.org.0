Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 061CC1C771F
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 18:50:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWNFd-000400-GY; Wed, 06 May 2020 16:50:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qF4D=6U=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jWNFc-0003zq-8j
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 16:50:28 +0000
X-Inumbo-ID: adcf41c0-8fb9-11ea-9e94-12813bfff9fa
Received: from mail-wm1-f41.google.com (unknown [209.85.128.41])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id adcf41c0-8fb9-11ea-9e94-12813bfff9fa;
 Wed, 06 May 2020 16:50:24 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id x4so3337085wmj.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2020 09:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=REKJZzBmoXxzUpxFa9z7kH5tG5OsQ6wZOYBM5bjxo2w=;
 b=LD+RY5nKeowM1d+C/g3zibEOIiulVptZ9vXKUhymg85OMvYQd5kfPtbgLD/gKkhFX5
 7a6beRIyc+vTsaD5EhOFoTtGhtC3wg6XfG0z/zNX3So58p+A/vSqhCv3fJ6TT3AXaT23
 OY6H9mCWA5vfL1tiwIS9w1x1eejyVDJ+Zcq8rTV4AhKodWUmFI6sTfBrOWW4nkJVvYh0
 nLFSgHvYe74aXusxTdWNNgZQLswc1Ys9Zd6mm630lU48880Azj51iP4VRi5tb3Enm3+x
 L6pUH9qTZyNw9JL+P5/bDuxDUOB+k67NI7uDs+zMrynhKL+cXHWsXlYwQdC/GQs2ZdbV
 ZRtA==
X-Gm-Message-State: AGi0PuYx5HckjmBT91I+6kUuj6gXN2RpBbWKSYTD3IxejfgGOoFqUKnw
 /XWlLiVbw/HMySLGuADRuYuebu2R8Ls=
X-Google-Smtp-Source: APiQypJQauC4ELPDlLlVWwlUZHmqlaSR5lohXlvN7i6ZQSaIbpmm+PXCaYB8GWlorvR8s9tdPTRryA==
X-Received: by 2002:a1c:7fc6:: with SMTP id a189mr5408035wmd.27.1588783821274; 
 Wed, 06 May 2020 09:50:21 -0700 (PDT)
Received: from localhost.localdomain (44.142.6.51.dyn.plus.net. [51.6.142.44])
 by smtp.gmail.com with ESMTPSA id
 q8sm3671106wmg.22.2020.05.06.09.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 09:50:20 -0700 (PDT)
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Subject: [PATCH] libxl: update libxlu_disk_l.[ch]
Date: Wed,  6 May 2020 17:50:18 +0100
Message-Id: <20200506165018.32209-1-wl@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Use flex 2.6.4 that is shipped in Debian Buster.

Signed-off-by: Wei Liu <wl@xen.org>
---
Do this because Roger posted a patch to fix clang build, which requires
updating the same files. I don't want bury his changes in unrelated
ones.
---
 tools/libxl/libxlu_disk_l.c | 867 ++++++++++++++++++++++--------------
 tools/libxl/libxlu_disk_l.h | 474 +++++++++++++++++---
 2 files changed, 947 insertions(+), 394 deletions(-)

diff --git a/tools/libxl/libxlu_disk_l.c b/tools/libxl/libxlu_disk_l.c
index 944990732b0b..b0ac3a865a61 100644
--- a/tools/libxl/libxlu_disk_l.c
+++ b/tools/libxl/libxlu_disk_l.c
@@ -1,10 +1,7 @@
 #line 2 "libxlu_disk_l.c"
-#line 31 "libxlu_disk_l.l"
 #include "libxl_osdeps.h" /* must come before any other headers */
 
-
-
-#line 8 "libxlu_disk_l.c"
+#line 5 "libxlu_disk_l.c"
 
 #define  YY_INT_ALIGNED short int
 
@@ -12,12 +9,222 @@
 
 #define FLEX_SCANNER
 #define YY_FLEX_MAJOR_VERSION 2
-#define YY_FLEX_MINOR_VERSION 5
-#define YY_FLEX_SUBMINOR_VERSION 39
+#define YY_FLEX_MINOR_VERSION 6
+#define YY_FLEX_SUBMINOR_VERSION 4
 #if YY_FLEX_SUBMINOR_VERSION > 0
 #define FLEX_BETA
 #endif
 
+#ifdef yy_create_buffer
+#define xlu__disk_yy_create_buffer_ALREADY_DEFINED
+#else
+#define yy_create_buffer xlu__disk_yy_create_buffer
+#endif
+
+#ifdef yy_delete_buffer
+#define xlu__disk_yy_delete_buffer_ALREADY_DEFINED
+#else
+#define yy_delete_buffer xlu__disk_yy_delete_buffer
+#endif
+
+#ifdef yy_scan_buffer
+#define xlu__disk_yy_scan_buffer_ALREADY_DEFINED
+#else
+#define yy_scan_buffer xlu__disk_yy_scan_buffer
+#endif
+
+#ifdef yy_scan_string
+#define xlu__disk_yy_scan_string_ALREADY_DEFINED
+#else
+#define yy_scan_string xlu__disk_yy_scan_string
+#endif
+
+#ifdef yy_scan_bytes
+#define xlu__disk_yy_scan_bytes_ALREADY_DEFINED
+#else
+#define yy_scan_bytes xlu__disk_yy_scan_bytes
+#endif
+
+#ifdef yy_init_buffer
+#define xlu__disk_yy_init_buffer_ALREADY_DEFINED
+#else
+#define yy_init_buffer xlu__disk_yy_init_buffer
+#endif
+
+#ifdef yy_flush_buffer
+#define xlu__disk_yy_flush_buffer_ALREADY_DEFINED
+#else
+#define yy_flush_buffer xlu__disk_yy_flush_buffer
+#endif
+
+#ifdef yy_load_buffer_state
+#define xlu__disk_yy_load_buffer_state_ALREADY_DEFINED
+#else
+#define yy_load_buffer_state xlu__disk_yy_load_buffer_state
+#endif
+
+#ifdef yy_switch_to_buffer
+#define xlu__disk_yy_switch_to_buffer_ALREADY_DEFINED
+#else
+#define yy_switch_to_buffer xlu__disk_yy_switch_to_buffer
+#endif
+
+#ifdef yypush_buffer_state
+#define xlu__disk_yypush_buffer_state_ALREADY_DEFINED
+#else
+#define yypush_buffer_state xlu__disk_yypush_buffer_state
+#endif
+
+#ifdef yypop_buffer_state
+#define xlu__disk_yypop_buffer_state_ALREADY_DEFINED
+#else
+#define yypop_buffer_state xlu__disk_yypop_buffer_state
+#endif
+
+#ifdef yyensure_buffer_stack
+#define xlu__disk_yyensure_buffer_stack_ALREADY_DEFINED
+#else
+#define yyensure_buffer_stack xlu__disk_yyensure_buffer_stack
+#endif
+
+#ifdef yylex
+#define xlu__disk_yylex_ALREADY_DEFINED
+#else
+#define yylex xlu__disk_yylex
+#endif
+
+#ifdef yyrestart
+#define xlu__disk_yyrestart_ALREADY_DEFINED
+#else
+#define yyrestart xlu__disk_yyrestart
+#endif
+
+#ifdef yylex_init
+#define xlu__disk_yylex_init_ALREADY_DEFINED
+#else
+#define yylex_init xlu__disk_yylex_init
+#endif
+
+#ifdef yylex_init_extra
+#define xlu__disk_yylex_init_extra_ALREADY_DEFINED
+#else
+#define yylex_init_extra xlu__disk_yylex_init_extra
+#endif
+
+#ifdef yylex_destroy
+#define xlu__disk_yylex_destroy_ALREADY_DEFINED
+#else
+#define yylex_destroy xlu__disk_yylex_destroy
+#endif
+
+#ifdef yyget_debug
+#define xlu__disk_yyget_debug_ALREADY_DEFINED
+#else
+#define yyget_debug xlu__disk_yyget_debug
+#endif
+
+#ifdef yyset_debug
+#define xlu__disk_yyset_debug_ALREADY_DEFINED
+#else
+#define yyset_debug xlu__disk_yyset_debug
+#endif
+
+#ifdef yyget_extra
+#define xlu__disk_yyget_extra_ALREADY_DEFINED
+#else
+#define yyget_extra xlu__disk_yyget_extra
+#endif
+
+#ifdef yyset_extra
+#define xlu__disk_yyset_extra_ALREADY_DEFINED
+#else
+#define yyset_extra xlu__disk_yyset_extra
+#endif
+
+#ifdef yyget_in
+#define xlu__disk_yyget_in_ALREADY_DEFINED
+#else
+#define yyget_in xlu__disk_yyget_in
+#endif
+
+#ifdef yyset_in
+#define xlu__disk_yyset_in_ALREADY_DEFINED
+#else
+#define yyset_in xlu__disk_yyset_in
+#endif
+
+#ifdef yyget_out
+#define xlu__disk_yyget_out_ALREADY_DEFINED
+#else
+#define yyget_out xlu__disk_yyget_out
+#endif
+
+#ifdef yyset_out
+#define xlu__disk_yyset_out_ALREADY_DEFINED
+#else
+#define yyset_out xlu__disk_yyset_out
+#endif
+
+#ifdef yyget_leng
+#define xlu__disk_yyget_leng_ALREADY_DEFINED
+#else
+#define yyget_leng xlu__disk_yyget_leng
+#endif
+
+#ifdef yyget_text
+#define xlu__disk_yyget_text_ALREADY_DEFINED
+#else
+#define yyget_text xlu__disk_yyget_text
+#endif
+
+#ifdef yyget_lineno
+#define xlu__disk_yyget_lineno_ALREADY_DEFINED
+#else
+#define yyget_lineno xlu__disk_yyget_lineno
+#endif
+
+#ifdef yyset_lineno
+#define xlu__disk_yyset_lineno_ALREADY_DEFINED
+#else
+#define yyset_lineno xlu__disk_yyset_lineno
+#endif
+
+#ifdef yyget_column
+#define xlu__disk_yyget_column_ALREADY_DEFINED
+#else
+#define yyget_column xlu__disk_yyget_column
+#endif
+
+#ifdef yyset_column
+#define xlu__disk_yyset_column_ALREADY_DEFINED
+#else
+#define yyset_column xlu__disk_yyset_column
+#endif
+
+#ifdef yywrap
+#define xlu__disk_yywrap_ALREADY_DEFINED
+#else
+#define yywrap xlu__disk_yywrap
+#endif
+
+#ifdef yyalloc
+#define xlu__disk_yyalloc_ALREADY_DEFINED
+#else
+#define yyalloc xlu__disk_yyalloc
+#endif
+
+#ifdef yyrealloc
+#define xlu__disk_yyrealloc_ALREADY_DEFINED
+#else
+#define yyrealloc xlu__disk_yyrealloc
+#endif
+
+#ifdef yyfree
+#define xlu__disk_yyfree_ALREADY_DEFINED
+#else
+#define yyfree xlu__disk_yyfree
+#endif
+
 /* First, we deal with  platform-specific or compiler-specific issues. */
 
 /* begin standard C headers. */
@@ -88,40 +295,32 @@ typedef unsigned int flex_uint32_t;
 #define UINT32_MAX             (4294967295U)
 #endif
 
+#ifndef SIZE_MAX
+#define SIZE_MAX               (~(size_t)0)
+#endif
+
 #endif /* ! C99 */
 
 #endif /* ! FLEXINT_H */
 
-#ifdef __cplusplus
+/* begin standard C++ headers. */
 
-/* The "const" storage-class-modifier is valid. */
-#define YY_USE_CONST
-
-#else	/* ! __cplusplus */
-
-/* C99 requires __STDC__ to be defined as 1. */
-#if defined (__STDC__)
-
-#define YY_USE_CONST
-
-#endif	/* defined (__STDC__) */
-#endif	/* ! __cplusplus */
-
-#ifdef YY_USE_CONST
+/* TODO: this is always defined, so inline it */
 #define yyconst const
+
+#if defined(__GNUC__) && __GNUC__ >= 3
+#define yynoreturn __attribute__((__noreturn__))
 #else
-#define yyconst
+#define yynoreturn
 #endif
 
 /* Returned upon end-of-file. */
 #define YY_NULL 0
 
-/* Promotes a possibly negative, possibly signed char to an unsigned
- * integer for use as an array index.  If the signed char is negative,
- * we want to instead treat it as an 8-bit unsigned char, hence the
- * double cast.
+/* Promotes a possibly negative, possibly signed char to an
+ *   integer in range [0..255] for use as an array index.
  */
-#define YY_SC_TO_UI(c) ((unsigned int) (unsigned char) c)
+#define YY_SC_TO_UI(c) ((YY_CHAR) (c))
 
 /* An opaque pointer. */
 #ifndef YY_TYPEDEF_YY_SCANNER_T
@@ -145,20 +344,16 @@ typedef void* yyscan_t;
  * definition of BEGIN.
  */
 #define BEGIN yyg->yy_start = 1 + 2 *
-
 /* Translate the current start state into a value that can be later handed
  * to BEGIN to return to the state.  The YYSTATE alias is for lex
  * compatibility.
  */
 #define YY_START ((yyg->yy_start - 1) / 2)
 #define YYSTATE YY_START
-
 /* Action number for EOF rule of a given start state. */
 #define YY_STATE_EOF(state) (YY_END_OF_BUFFER + state + 1)
-
 /* Special action meaning "start processing a new file". */
-#define YY_NEW_FILE xlu__disk_yyrestart(yyin ,yyscanner )
-
+#define YY_NEW_FILE yyrestart( yyin , yyscanner )
 #define YY_END_OF_BUFFER_CHAR 0
 
 /* Size of default input buffer. */
@@ -191,7 +386,7 @@ typedef size_t yy_size_t;
 #define EOB_ACT_CONTINUE_SCAN 0
 #define EOB_ACT_END_OF_FILE 1
 #define EOB_ACT_LAST_MATCH 2
-
+    
     #define YY_LESS_LINENO(n)
     #define YY_LINENO_REWIND_TO(ptr)
     
@@ -208,7 +403,6 @@ typedef size_t yy_size_t;
 		YY_DO_BEFORE_ACTION; /* set up yytext again */ \
 		} \
 	while ( 0 )
-
 #define unput(c) yyunput( c, yyg->yytext_ptr , yyscanner )
 
 #ifndef YY_STRUCT_YY_BUFFER_STATE
@@ -223,12 +417,12 @@ struct yy_buffer_state
 	/* Size of input buffer in bytes, not including room for EOB
 	 * characters.
 	 */
-	yy_size_t yy_buf_size;
+	int yy_buf_size;
 
 	/* Number of characters read into yy_ch_buf, not including EOB
 	 * characters.
 	 */
-	yy_size_t yy_n_chars;
+	int yy_n_chars;
 
 	/* Whether we "own" the buffer - i.e., we know we created it,
 	 * and can realloc() it to grow it, and should free() it to
@@ -251,7 +445,7 @@ struct yy_buffer_state
 
     int yy_bs_lineno; /**< The line count. */
     int yy_bs_column; /**< The column count. */
-    
+
 	/* Whether to try to fill the input buffer when we reach the
 	 * end of it.
 	 */
@@ -268,7 +462,7 @@ struct yy_buffer_state
 	 * possible backing-up.
 	 *
 	 * When we actually see the EOF, we change the status to "new"
-	 * (via xlu__disk_yyrestart()), so that the user can continue scanning by
+	 * (via yyrestart()), so that the user can continue scanning by
 	 * just pointing yyin at a new input file.
 	 */
 #define YY_BUFFER_EOF_PENDING 2
@@ -285,71 +479,65 @@ struct yy_buffer_state
 #define YY_CURRENT_BUFFER ( yyg->yy_buffer_stack \
                           ? yyg->yy_buffer_stack[yyg->yy_buffer_stack_top] \
                           : NULL)
-
 /* Same as previous macro, but useful when we know that the buffer stack is not
  * NULL or when we need an lvalue. For internal use only.
  */
 #define YY_CURRENT_BUFFER_LVALUE yyg->yy_buffer_stack[yyg->yy_buffer_stack_top]
 
-void xlu__disk_yyrestart (FILE *input_file ,yyscan_t yyscanner );
-void xlu__disk_yy_switch_to_buffer (YY_BUFFER_STATE new_buffer ,yyscan_t yyscanner );
-YY_BUFFER_STATE xlu__disk_yy_create_buffer (FILE *file,int size ,yyscan_t yyscanner );
-void xlu__disk_yy_delete_buffer (YY_BUFFER_STATE b ,yyscan_t yyscanner );
-void xlu__disk_yy_flush_buffer (YY_BUFFER_STATE b ,yyscan_t yyscanner );
-void xlu__disk_yypush_buffer_state (YY_BUFFER_STATE new_buffer ,yyscan_t yyscanner );
-void xlu__disk_yypop_buffer_state (yyscan_t yyscanner );
+void yyrestart ( FILE *input_file , yyscan_t yyscanner );
+void yy_switch_to_buffer ( YY_BUFFER_STATE new_buffer , yyscan_t yyscanner );
+YY_BUFFER_STATE yy_create_buffer ( FILE *file, int size , yyscan_t yyscanner );
+void yy_delete_buffer ( YY_BUFFER_STATE b , yyscan_t yyscanner );
+void yy_flush_buffer ( YY_BUFFER_STATE b , yyscan_t yyscanner );
+void yypush_buffer_state ( YY_BUFFER_STATE new_buffer , yyscan_t yyscanner );
+void yypop_buffer_state ( yyscan_t yyscanner );
 
-static void xlu__disk_yyensure_buffer_stack (yyscan_t yyscanner );
-static void xlu__disk_yy_load_buffer_state (yyscan_t yyscanner );
-static void xlu__disk_yy_init_buffer (YY_BUFFER_STATE b,FILE *file ,yyscan_t yyscanner );
+static void yyensure_buffer_stack ( yyscan_t yyscanner );
+static void yy_load_buffer_state ( yyscan_t yyscanner );
+static void yy_init_buffer ( YY_BUFFER_STATE b, FILE *file , yyscan_t yyscanner );
+#define YY_FLUSH_BUFFER yy_flush_buffer( YY_CURRENT_BUFFER , yyscanner)
 
-#define YY_FLUSH_BUFFER xlu__disk_yy_flush_buffer(YY_CURRENT_BUFFER ,yyscanner)
+YY_BUFFER_STATE yy_scan_buffer ( char *base, yy_size_t size , yyscan_t yyscanner );
+YY_BUFFER_STATE yy_scan_string ( const char *yy_str , yyscan_t yyscanner );
+YY_BUFFER_STATE yy_scan_bytes ( const char *bytes, int len , yyscan_t yyscanner );
 
-YY_BUFFER_STATE xlu__disk_yy_scan_buffer (char *base,yy_size_t size ,yyscan_t yyscanner );
-YY_BUFFER_STATE xlu__disk_yy_scan_string (yyconst char *yy_str ,yyscan_t yyscanner );
-YY_BUFFER_STATE xlu__disk_yy_scan_bytes (yyconst char *bytes,yy_size_t len ,yyscan_t yyscanner );
-
-void *xlu__disk_yyalloc (yy_size_t ,yyscan_t yyscanner );
-void *xlu__disk_yyrealloc (void *,yy_size_t ,yyscan_t yyscanner );
-void xlu__disk_yyfree (void * ,yyscan_t yyscanner );
-
-#define yy_new_buffer xlu__disk_yy_create_buffer
+void *yyalloc ( yy_size_t , yyscan_t yyscanner );
+void *yyrealloc ( void *, yy_size_t , yyscan_t yyscanner );
+void yyfree ( void * , yyscan_t yyscanner );
 
+#define yy_new_buffer yy_create_buffer
 #define yy_set_interactive(is_interactive) \
 	{ \
 	if ( ! YY_CURRENT_BUFFER ){ \
-        xlu__disk_yyensure_buffer_stack (yyscanner); \
+        yyensure_buffer_stack (yyscanner); \
 		YY_CURRENT_BUFFER_LVALUE =    \
-            xlu__disk_yy_create_buffer(yyin,YY_BUF_SIZE ,yyscanner); \
+            yy_create_buffer( yyin, YY_BUF_SIZE , yyscanner); \
 	} \
 	YY_CURRENT_BUFFER_LVALUE->yy_is_interactive = is_interactive; \
 	}
-
 #define yy_set_bol(at_bol) \
 	{ \
 	if ( ! YY_CURRENT_BUFFER ){\
-        xlu__disk_yyensure_buffer_stack (yyscanner); \
+        yyensure_buffer_stack (yyscanner); \
 		YY_CURRENT_BUFFER_LVALUE =    \
-            xlu__disk_yy_create_buffer(yyin,YY_BUF_SIZE ,yyscanner); \
+            yy_create_buffer( yyin, YY_BUF_SIZE , yyscanner); \
 	} \
 	YY_CURRENT_BUFFER_LVALUE->yy_at_bol = at_bol; \
 	}
-
 #define YY_AT_BOL() (YY_CURRENT_BUFFER_LVALUE->yy_at_bol)
 
-#define xlu__disk_yywrap(yyscanner) 1
+#define xlu__disk_yywrap(yyscanner) (/*CONSTCOND*/1)
 #define YY_SKIP_YYWRAP
-
-typedef unsigned char YY_CHAR;
+typedef flex_uint8_t YY_CHAR;
 
 typedef int yy_state_type;
 
 #define yytext_ptr yytext_r
 
-static yy_state_type yy_get_previous_state (yyscan_t yyscanner );
-static yy_state_type yy_try_NUL_trans (yy_state_type current_state  ,yyscan_t yyscanner);
-static int yy_get_next_buffer (yyscan_t yyscanner );
-static void yy_fatal_error (yyconst char msg[] ,yyscan_t yyscanner );
+static yy_state_type yy_get_previous_state ( yyscan_t yyscanner );
+static yy_state_type yy_try_NUL_trans ( yy_state_type current_state  , yyscan_t yyscanner);
+static int yy_get_next_buffer ( yyscan_t yyscanner );
+static void yynoreturn yy_fatal_error ( const char* msg , yyscan_t yyscanner );
 
 /* Done after the current pattern has been matched and before the
  * corresponding action - sets up yytext.
@@ -357,11 +545,10 @@ static void yy_fatal_error (yyconst char msg[] ,yyscan_t yyscanner );
 #define YY_DO_BEFORE_ACTION \
 	yyg->yytext_ptr = yy_bp; \
 	yyg->yytext_ptr -= yyg->yy_more_len; \
-	yyleng = (size_t) (yy_cp - yyg->yytext_ptr); \
+	yyleng = (int) (yy_cp - yyg->yytext_ptr); \
 	yyg->yy_hold_char = *yy_cp; \
 	*yy_cp = '\0'; \
 	yyg->yy_c_buf_p = yy_cp;
-
 #define YY_NUM_RULES 36
 #define YY_END_OF_BUFFER 37
 /* This struct is not used in this scanner,
@@ -371,7 +558,7 @@ struct yy_trans_info
 	flex_int32_t yy_verify;
 	flex_int32_t yy_nxt;
 	};
-static yyconst flex_int16_t yy_acclist[575] =
+static const flex_int16_t yy_acclist[575] =
     {   0,
        35,   35,   37,   33,   34,   36, 8193,   33,   34,   36,
     16385, 8193,   33,   36,16385,   33,   34,   36,   34,   36,
@@ -438,7 +625,7 @@ static yyconst flex_int16_t yy_acclist[575] =
        21,   23,   12,   33
     } ;
 
-static yyconst flex_int16_t yy_accept[356] =
+static const flex_int16_t yy_accept[356] =
     {   0,
         1,    1,    1,    2,    3,    4,    7,   12,   16,   19,
        21,   24,   27,   30,   33,   36,   39,   42,   45,   48,
@@ -481,7 +668,7 @@ static yyconst flex_int16_t yy_accept[356] =
       570,  571,  573,  575,  575
     } ;
 
-static yyconst flex_int32_t yy_ec[256] =
+static const YY_CHAR yy_ec[256] =
     {   0,
         1,    1,    1,    1,    1,    1,    1,    1,    2,    3,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
@@ -513,7 +700,7 @@ static yyconst flex_int32_t yy_ec[256] =
         1,    1,    1,    1,    1
     } ;
 
-static yyconst flex_int32_t yy_meta[35] =
+static const YY_CHAR yy_meta[35] =
     {   0,
         1,    1,    2,    3,    1,    1,    1,    1,    4,    1,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
@@ -521,7 +708,7 @@ static yyconst flex_int32_t yy_meta[35] =
         1,    1,    1,    1
     } ;
 
-static yyconst flex_int16_t yy_base[424] =
+static const flex_int16_t yy_base[424] =
     {   0,
         0,    0,  901,  900,  902,  897,   33,   36,  905,  905,
        45,   63,   31,   42,   51,   52,  890,   33,   65,   67,
@@ -572,7 +759,7 @@ static yyconst flex_int16_t yy_base[424] =
       883,  887,  891
     } ;
 
-static yyconst flex_int16_t yy_def[424] =
+static const flex_int16_t yy_def[424] =
     {   0,
       354,    1,  355,  355,  354,  356,  357,  357,  354,  354,
       358,  358,   12,   12,   12,   12,   12,   12,   12,   12,
@@ -623,7 +810,7 @@ static yyconst flex_int16_t yy_def[424] =
       354,  354,  354
     } ;
 
-static yyconst flex_int16_t yy_nxt[940] =
+static const flex_int16_t yy_nxt[940] =
     {   0,
         6,    7,    8,    9,    6,    6,    6,    6,   10,   11,
        12,   13,   14,   15,   16,   17,   18,   19,   17,   17,
@@ -730,7 +917,7 @@ static yyconst flex_int16_t yy_nxt[940] =
       354,  354,  354,  354,  354,  354,  354,  354,  354
     } ;
 
-static yyconst flex_int16_t yy_chk[940] =
+static const flex_int16_t yy_chk[940] =
     {   0,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
@@ -1001,8 +1188,9 @@ static int vdev_and_devtype(DiskParseContext *dpc, char *str) {
 #undef DPC /* needs to be defined differently the actual lexer */
 #define DPC ((DiskParseContext*)yyextra)
 
+#line 1192 "libxlu_disk_l.c"
 
-#line 1006 "libxlu_disk_l.c"
+#line 1194 "libxlu_disk_l.c"
 
 #define INITIAL 0
 #define LEXERR 1
@@ -1032,8 +1220,8 @@ struct yyguts_t
     size_t yy_buffer_stack_max; /**< capacity of stack. */
     YY_BUFFER_STATE * yy_buffer_stack; /**< Stack as an array. */
     char yy_hold_char;
-    yy_size_t yy_n_chars;
-    yy_size_t yyleng_r;
+    int yy_n_chars;
+    int yyleng_r;
     char *yy_c_buf_p;
     int yy_init;
     int yy_start;
@@ -1064,44 +1252,44 @@ struct yyguts_t
 
     }; /* end struct yyguts_t */
 
-static int yy_init_globals (yyscan_t yyscanner );
+static int yy_init_globals ( yyscan_t yyscanner );
 
-int xlu__disk_yylex_init (yyscan_t* scanner);
+int yylex_init (yyscan_t* scanner);
 
-int xlu__disk_yylex_init_extra (YY_EXTRA_TYPE user_defined,yyscan_t* scanner);
+int yylex_init_extra ( YY_EXTRA_TYPE user_defined, yyscan_t* scanner);
 
 /* Accessor methods to globals.
    These are made visible to non-reentrant scanners for convenience. */
 
-int xlu__disk_yylex_destroy (yyscan_t yyscanner );
+int yylex_destroy ( yyscan_t yyscanner );
 
-int xlu__disk_yyget_debug (yyscan_t yyscanner );
+int yyget_debug ( yyscan_t yyscanner );
 
-void xlu__disk_yyset_debug (int debug_flag ,yyscan_t yyscanner );
+void yyset_debug ( int debug_flag , yyscan_t yyscanner );
 
-YY_EXTRA_TYPE xlu__disk_yyget_extra (yyscan_t yyscanner );
+YY_EXTRA_TYPE yyget_extra ( yyscan_t yyscanner );
 
-void xlu__disk_yyset_extra (YY_EXTRA_TYPE user_defined ,yyscan_t yyscanner );
+void yyset_extra ( YY_EXTRA_TYPE user_defined , yyscan_t yyscanner );
 
-FILE *xlu__disk_yyget_in (yyscan_t yyscanner );
+FILE *yyget_in ( yyscan_t yyscanner );
 
-void xlu__disk_yyset_in  (FILE * in_str ,yyscan_t yyscanner );
+void yyset_in  ( FILE * _in_str , yyscan_t yyscanner );
 
-FILE *xlu__disk_yyget_out (yyscan_t yyscanner );
+FILE *yyget_out ( yyscan_t yyscanner );
 
-void xlu__disk_yyset_out  (FILE * out_str ,yyscan_t yyscanner );
+void yyset_out  ( FILE * _out_str , yyscan_t yyscanner );
 
-yy_size_t xlu__disk_yyget_leng (yyscan_t yyscanner );
+			int yyget_leng ( yyscan_t yyscanner );
 
-char *xlu__disk_yyget_text (yyscan_t yyscanner );
+char *yyget_text ( yyscan_t yyscanner );
 
-int xlu__disk_yyget_lineno (yyscan_t yyscanner );
+int yyget_lineno ( yyscan_t yyscanner );
 
-void xlu__disk_yyset_lineno (int line_number ,yyscan_t yyscanner );
+void yyset_lineno ( int _line_number , yyscan_t yyscanner );
 
-int xlu__disk_yyget_column  (yyscan_t yyscanner );
+int yyget_column  ( yyscan_t yyscanner );
 
-void xlu__disk_yyset_column (int column_no ,yyscan_t yyscanner );
+void yyset_column ( int _column_no , yyscan_t yyscanner );
 
 /* Macros after this point can all be overridden by user definitions in
  * section 1.
@@ -1109,26 +1297,29 @@ void xlu__disk_yyset_column (int column_no ,yyscan_t yyscanner );
 
 #ifndef YY_SKIP_YYWRAP
 #ifdef __cplusplus
-extern "C" int xlu__disk_yywrap (yyscan_t yyscanner );
+extern "C" int yywrap ( yyscan_t yyscanner );
 #else
-extern int xlu__disk_yywrap (yyscan_t yyscanner );
+extern int yywrap ( yyscan_t yyscanner );
 #endif
 #endif
 
+#ifndef YY_NO_UNPUT
+    
+#endif
+
 #ifndef yytext_ptr
-static void yy_flex_strncpy (char *,yyconst char *,int ,yyscan_t yyscanner);
+static void yy_flex_strncpy ( char *, const char *, int , yyscan_t yyscanner);
 #endif
 
 #ifdef YY_NEED_STRLEN
-static int yy_flex_strlen (yyconst char * ,yyscan_t yyscanner);
+static int yy_flex_strlen ( const char * , yyscan_t yyscanner);
 #endif
 
 #ifndef YY_NO_INPUT
-
 #ifdef __cplusplus
-static int yyinput (yyscan_t yyscanner );
+static int yyinput ( yyscan_t yyscanner );
 #else
-static int input (yyscan_t yyscanner );
+static int input ( yyscan_t yyscanner );
 #endif
 
 #endif
@@ -1148,7 +1339,7 @@ static int input (yyscan_t yyscanner );
 /* This used to be an fputs(), but since the string might contain NUL's,
  * we now use fwrite().
  */
-#define ECHO do { if (fwrite( yytext, yyleng, 1, yyout )) {} } while (0)
+#define ECHO do { if (fwrite( yytext, (size_t) yyleng, 1, yyout )) {} } while (0)
 #endif
 
 /* Gets input and stuffs it into "buf".  number of characters read, or YY_NULL,
@@ -1172,7 +1363,7 @@ static int input (yyscan_t yyscanner );
 	else \
 		{ \
 		errno=0; \
-		while ( (result = fread(buf, 1, (yy_size_t) max_size, yyin)) == 0 && ferror(yyin)) \
+		while ( (result = (int) fread(buf, 1, (yy_size_t) max_size, yyin)) == 0 && ferror(yyin)) \
 			{ \
 			if( errno != EINTR) \
 				{ \
@@ -1213,9 +1404,9 @@ static int input (yyscan_t yyscanner );
 #ifndef YY_DECL
 #define YY_DECL_IS_OURS 1
 
-extern int xlu__disk_yylex (yyscan_t yyscanner);
+extern int yylex (yyscan_t yyscanner);
 
-#define YY_DECL int xlu__disk_yylex (yyscan_t yyscanner)
+#define YY_DECL int yylex (yyscan_t yyscanner)
 #endif /* !YY_DECL */
 
 /* Code executed at the beginning of each rule, after yytext and yyleng
@@ -1227,7 +1418,7 @@ extern int xlu__disk_yylex (yyscan_t yyscanner);
 
 /* Code executed at the end of each rule. */
 #ifndef YY_BREAK
-#define YY_BREAK break;
+#define YY_BREAK /*LINTED*/break;
 #endif
 
 #define YY_RULE_SETUP \
@@ -1237,9 +1428,9 @@ extern int xlu__disk_yylex (yyscan_t yyscanner);
  */
 YY_DECL
 {
-	register yy_state_type yy_current_state;
-	register char *yy_cp, *yy_bp;
-	register int yy_act;
+	yy_state_type yy_current_state;
+	char *yy_cp, *yy_bp;
+	int yy_act;
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 
 	if ( !yyg->yy_init )
@@ -1252,9 +1443,9 @@ YY_DECL
 
         /* Create the reject buffer large enough to save one state per allowed character. */
         if ( ! yyg->yy_state_buf )
-            yyg->yy_state_buf = (yy_state_type *)xlu__disk_yyalloc(YY_STATE_BUF_SIZE  ,yyscanner);
+            yyg->yy_state_buf = (yy_state_type *)yyalloc(YY_STATE_BUF_SIZE  , yyscanner);
             if ( ! yyg->yy_state_buf )
-                YY_FATAL_ERROR( "out of dynamic memory in xlu__disk_yylex()" );
+                YY_FATAL_ERROR( "out of dynamic memory in yylex()" );
 
 		if ( ! yyg->yy_start )
 			yyg->yy_start = 1;	/* first start state */
@@ -1266,28 +1457,29 @@ YY_DECL
 			yyout = stdout;
 
 		if ( ! YY_CURRENT_BUFFER ) {
-			xlu__disk_yyensure_buffer_stack (yyscanner);
+			yyensure_buffer_stack (yyscanner);
 			YY_CURRENT_BUFFER_LVALUE =
-				xlu__disk_yy_create_buffer(yyin,YY_BUF_SIZE ,yyscanner);
+				yy_create_buffer( yyin, YY_BUF_SIZE , yyscanner);
 		}
 
-		xlu__disk_yy_load_buffer_state(yyscanner );
+		yy_load_buffer_state( yyscanner );
 		}
 
 	{
 #line 166 "libxlu_disk_l.l"
 
 
+#line 169 "libxlu_disk_l.l"
  /*----- the scanner rules which do the parsing -----*/
 
-#line 1284 "libxlu_disk_l.c"
+#line 1476 "libxlu_disk_l.c"
 
-	while ( 1 )		/* loops until end-of-file is reached */
+	while ( /*CONSTCOND*/1 )		/* loops until end-of-file is reached */
 		{
 		yyg->yy_more_len = 0;
 		if ( yyg->yy_more_flag )
 			{
-			yyg->yy_more_len = yyg->yy_c_buf_p - yyg->yytext_ptr;
+			yyg->yy_more_len = (int) (yyg->yy_c_buf_p - yyg->yytext_ptr);
 			yyg->yy_more_flag = 0;
 			}
 		yy_cp = yyg->yy_c_buf_p;
@@ -1308,14 +1500,14 @@ YY_DECL
 yy_match:
 		do
 			{
-			register YY_CHAR yy_c = yy_ec[YY_SC_TO_UI(*yy_cp)] ;
+			YY_CHAR yy_c = yy_ec[YY_SC_TO_UI(*yy_cp)] ;
 			while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
 				{
 				yy_current_state = (int) yy_def[yy_current_state];
 				if ( yy_current_state >= 355 )
-					yy_c = yy_meta[(unsigned int) yy_c];
+					yy_c = yy_meta[yy_c];
 				}
-			yy_current_state = yy_nxt[yy_base[yy_current_state] + (unsigned int) yy_c];
+			yy_current_state = yy_nxt[yy_base[yy_current_state] + yy_c];
 			*yyg->yy_state_ptr++ = yy_current_state;
 			++yy_cp;
 			}
@@ -1369,135 +1561,135 @@ do_action:	/* This label is used only to access EOF actions. */
 case 1:
 /* rule 1 can match eol */
 YY_RULE_SETUP
-#line 170 "libxlu_disk_l.l"
+#line 171 "libxlu_disk_l.l"
 { /* ignore whitespace before parameters */ }
 	YY_BREAK
 /* ordinary parameters setting enums or strings */
 case 2:
 /* rule 2 can match eol */
 YY_RULE_SETUP
-#line 174 "libxlu_disk_l.l"
+#line 175 "libxlu_disk_l.l"
 { STRIP(','); setformat(DPC, FROMEQUALS); }
 	YY_BREAK
 case 3:
 YY_RULE_SETUP
-#line 176 "libxlu_disk_l.l"
+#line 177 "libxlu_disk_l.l"
 { DPC->disk->is_cdrom = 1; }
 	YY_BREAK
 case 4:
 YY_RULE_SETUP
-#line 177 "libxlu_disk_l.l"
+#line 178 "libxlu_disk_l.l"
 { DPC->disk->is_cdrom = 1; }
 	YY_BREAK
 case 5:
 YY_RULE_SETUP
-#line 178 "libxlu_disk_l.l"
+#line 179 "libxlu_disk_l.l"
 { DPC->disk->is_cdrom = 0; }
 	YY_BREAK
 case 6:
 /* rule 6 can match eol */
 YY_RULE_SETUP
-#line 179 "libxlu_disk_l.l"
+#line 180 "libxlu_disk_l.l"
 { xlu__disk_err(DPC,yytext,"unknown value for type"); }
 	YY_BREAK
 case 7:
 /* rule 7 can match eol */
 YY_RULE_SETUP
-#line 181 "libxlu_disk_l.l"
+#line 182 "libxlu_disk_l.l"
 { STRIP(','); setaccess(DPC, FROMEQUALS); }
 	YY_BREAK
 case 8:
 /* rule 8 can match eol */
 YY_RULE_SETUP
-#line 182 "libxlu_disk_l.l"
+#line 183 "libxlu_disk_l.l"
 { STRIP(','); SAVESTRING("backend", backend_domname, FROMEQUALS); }
 	YY_BREAK
 case 9:
 /* rule 9 can match eol */
 YY_RULE_SETUP
-#line 183 "libxlu_disk_l.l"
+#line 184 "libxlu_disk_l.l"
 { STRIP(','); setbackendtype(DPC,FROMEQUALS); }
 	YY_BREAK
 case 10:
 /* rule 10 can match eol */
 YY_RULE_SETUP
-#line 185 "libxlu_disk_l.l"
+#line 186 "libxlu_disk_l.l"
 { STRIP(','); SAVESTRING("vdev", vdev, FROMEQUALS); }
 	YY_BREAK
 case 11:
 /* rule 11 can match eol */
 YY_RULE_SETUP
-#line 186 "libxlu_disk_l.l"
+#line 187 "libxlu_disk_l.l"
 { STRIP(','); SAVESTRING("script", script, FROMEQUALS); }
 	YY_BREAK
 case 12:
 YY_RULE_SETUP
-#line 187 "libxlu_disk_l.l"
+#line 188 "libxlu_disk_l.l"
 { DPC->disk->direct_io_safe = 1; }
 	YY_BREAK
 case 13:
 YY_RULE_SETUP
-#line 188 "libxlu_disk_l.l"
+#line 189 "libxlu_disk_l.l"
 { libxl_defbool_set(&DPC->disk->discard_enable, true); }
 	YY_BREAK
 case 14:
 YY_RULE_SETUP
-#line 189 "libxlu_disk_l.l"
+#line 190 "libxlu_disk_l.l"
 { libxl_defbool_set(&DPC->disk->discard_enable, false); }
 	YY_BREAK
 /* Note that the COLO configuration settings should be considered unstable.
   * They may change incompatibly in future versions of Xen. */
 case 15:
 YY_RULE_SETUP
-#line 192 "libxlu_disk_l.l"
+#line 193 "libxlu_disk_l.l"
 { libxl_defbool_set(&DPC->disk->colo_enable, true); }
 	YY_BREAK
 case 16:
 YY_RULE_SETUP
-#line 193 "libxlu_disk_l.l"
+#line 194 "libxlu_disk_l.l"
 { libxl_defbool_set(&DPC->disk->colo_enable, false); }
 	YY_BREAK
 case 17:
 /* rule 17 can match eol */
 YY_RULE_SETUP
-#line 194 "libxlu_disk_l.l"
+#line 195 "libxlu_disk_l.l"
 { STRIP(','); SAVESTRING("colo-host", colo_host, FROMEQUALS); }
 	YY_BREAK
 case 18:
 /* rule 18 can match eol */
 YY_RULE_SETUP
-#line 195 "libxlu_disk_l.l"
+#line 196 "libxlu_disk_l.l"
 { STRIP(','); setcoloport(DPC, FROMEQUALS); }
 	YY_BREAK
 case 19:
 /* rule 19 can match eol */
 YY_RULE_SETUP
-#line 196 "libxlu_disk_l.l"
+#line 197 "libxlu_disk_l.l"
 { STRIP(','); SAVESTRING("colo-export", colo_export, FROMEQUALS); }
 	YY_BREAK
 case 20:
 /* rule 20 can match eol */
 YY_RULE_SETUP
-#line 197 "libxlu_disk_l.l"
+#line 198 "libxlu_disk_l.l"
 { STRIP(','); SAVESTRING("active-disk", active_disk, FROMEQUALS); }
 	YY_BREAK
 case 21:
 /* rule 21 can match eol */
 YY_RULE_SETUP
-#line 198 "libxlu_disk_l.l"
+#line 199 "libxlu_disk_l.l"
 { STRIP(','); SAVESTRING("hidden-disk", hidden_disk, FROMEQUALS); }
 	YY_BREAK
 /* the target magic parameter, eats the rest of the string */
 case 22:
 YY_RULE_SETUP
-#line 202 "libxlu_disk_l.l"
+#line 203 "libxlu_disk_l.l"
 { STRIP(','); SAVESTRING("target", pdev_path, FROMEQUALS); }
 	YY_BREAK
 /* unknown parameters */
 case 23:
 /* rule 23 can match eol */
 YY_RULE_SETUP
-#line 206 "libxlu_disk_l.l"
+#line 207 "libxlu_disk_l.l"
 { xlu__disk_err(DPC,yytext,"unknown parameter"); }
 	YY_BREAK
 /* deprecated prefixes */
@@ -1505,7 +1697,7 @@ YY_RULE_SETUP
    * matched the whole string, so these patterns take precedence */
 case 24:
 YY_RULE_SETUP
-#line 213 "libxlu_disk_l.l"
+#line 214 "libxlu_disk_l.l"
 {
                     STRIP(':');
                     DPC->had_depr_prefix=1; DEPRECATE("use `[format=]...,'");
@@ -1514,7 +1706,7 @@ YY_RULE_SETUP
 	YY_BREAK
 case 25:
 YY_RULE_SETUP
-#line 219 "libxlu_disk_l.l"
+#line 220 "libxlu_disk_l.l"
 {
                     char *newscript;
                     STRIP(':');
@@ -1533,12 +1725,12 @@ case 26:
 yyg->yy_c_buf_p = yy_cp = yy_bp + 8;
 YY_DO_BEFORE_ACTION; /* set up yytext again */
 YY_RULE_SETUP
-#line 232 "libxlu_disk_l.l"
+#line 233 "libxlu_disk_l.l"
 { DPC->had_depr_prefix=1; DEPRECATE(0); }
 	YY_BREAK
 case 27:
 YY_RULE_SETUP
-#line 233 "libxlu_disk_l.l"
+#line 234 "libxlu_disk_l.l"
 { DPC->had_depr_prefix=1; DEPRECATE(0); }
 	YY_BREAK
 case 28:
@@ -1546,7 +1738,7 @@ case 28:
 yyg->yy_c_buf_p = yy_cp = yy_bp + 4;
 YY_DO_BEFORE_ACTION; /* set up yytext again */
 YY_RULE_SETUP
-#line 234 "libxlu_disk_l.l"
+#line 235 "libxlu_disk_l.l"
 { DPC->had_depr_prefix=1; DEPRECATE(0); }
 	YY_BREAK
 case 29:
@@ -1554,7 +1746,7 @@ case 29:
 yyg->yy_c_buf_p = yy_cp = yy_bp + 6;
 YY_DO_BEFORE_ACTION; /* set up yytext again */
 YY_RULE_SETUP
-#line 235 "libxlu_disk_l.l"
+#line 236 "libxlu_disk_l.l"
 { DPC->had_depr_prefix=1; DEPRECATE(0); }
 	YY_BREAK
 case 30:
@@ -1562,7 +1754,7 @@ case 30:
 yyg->yy_c_buf_p = yy_cp = yy_bp + 5;
 YY_DO_BEFORE_ACTION; /* set up yytext again */
 YY_RULE_SETUP
-#line 236 "libxlu_disk_l.l"
+#line 237 "libxlu_disk_l.l"
 { DPC->had_depr_prefix=1; DEPRECATE(0); }
 	YY_BREAK
 case 31:
@@ -1570,13 +1762,13 @@ case 31:
 yyg->yy_c_buf_p = yy_cp = yy_bp + 4;
 YY_DO_BEFORE_ACTION; /* set up yytext again */
 YY_RULE_SETUP
-#line 237 "libxlu_disk_l.l"
+#line 238 "libxlu_disk_l.l"
 { DPC->had_depr_prefix=1; DEPRECATE(0); }
 	YY_BREAK
 case 32:
 /* rule 32 can match eol */
 YY_RULE_SETUP
-#line 239 "libxlu_disk_l.l"
+#line 240 "libxlu_disk_l.l"
 {
 		  xlu__disk_err(DPC,yytext,"unknown deprecated disk prefix");
 		  return 0;
@@ -1586,7 +1778,7 @@ YY_RULE_SETUP
 case 33:
 /* rule 33 can match eol */
 YY_RULE_SETUP
-#line 246 "libxlu_disk_l.l"
+#line 247 "libxlu_disk_l.l"
 {
     STRIP(',');
 
@@ -1615,7 +1807,7 @@ YY_RULE_SETUP
 	YY_BREAK
 case 34:
 YY_RULE_SETUP
-#line 272 "libxlu_disk_l.l"
+#line 273 "libxlu_disk_l.l"
 {
     BEGIN(LEXERR);
     yymore();
@@ -1623,17 +1815,17 @@ YY_RULE_SETUP
 	YY_BREAK
 case 35:
 YY_RULE_SETUP
-#line 276 "libxlu_disk_l.l"
+#line 277 "libxlu_disk_l.l"
 {
     xlu__disk_err(DPC,yytext,"bad disk syntax"); return 0;
 }
 	YY_BREAK
 case 36:
 YY_RULE_SETUP
-#line 279 "libxlu_disk_l.l"
+#line 280 "libxlu_disk_l.l"
 YY_FATAL_ERROR( "flex scanner jammed" );
 	YY_BREAK
-#line 1637 "libxlu_disk_l.c"
+#line 1829 "libxlu_disk_l.c"
 			case YY_STATE_EOF(INITIAL):
 			case YY_STATE_EOF(LEXERR):
 				yyterminate();
@@ -1652,7 +1844,7 @@ YY_FATAL_ERROR( "flex scanner jammed" );
 			/* We're scanning a new file or input source.  It's
 			 * possible that this happened because the user
 			 * just pointed yyin at a new source and called
-			 * xlu__disk_yylex().  If so, then we have to assure
+			 * yylex().  If so, then we have to assure
 			 * consistency between YY_CURRENT_BUFFER and our
 			 * globals.  Here is the right place to do so, because
 			 * this is the first action (other than possibly a
@@ -1712,7 +1904,7 @@ YY_FATAL_ERROR( "flex scanner jammed" );
 				{
 				yyg->yy_did_buffer_switch_on_eof = 0;
 
-				if ( xlu__disk_yywrap(yyscanner ) )
+				if ( yywrap( yyscanner ) )
 					{
 					/* Note: because we've taken care in
 					 * yy_get_next_buffer() to have set up
@@ -1766,7 +1958,7 @@ YY_FATAL_ERROR( "flex scanner jammed" );
 	} /* end of action switch */
 		} /* end of scanning one token */
 	} /* end of user's declarations */
-} /* end of xlu__disk_yylex */
+} /* end of yylex */
 
 /* yy_get_next_buffer - try to read in a new buffer
  *
@@ -1778,9 +1970,9 @@ YY_FATAL_ERROR( "flex scanner jammed" );
 static int yy_get_next_buffer (yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
-	register char *dest = YY_CURRENT_BUFFER_LVALUE->yy_ch_buf;
-	register char *source = yyg->yytext_ptr;
-	register int number_to_move, i;
+	char *dest = YY_CURRENT_BUFFER_LVALUE->yy_ch_buf;
+	char *source = yyg->yytext_ptr;
+	int number_to_move, i;
 	int ret_val;
 
 	if ( yyg->yy_c_buf_p > &YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[yyg->yy_n_chars + 1] )
@@ -1809,7 +2001,7 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
 	/* Try to read more data. */
 
 	/* First move last chars to start of buffer. */
-	number_to_move = (int) (yyg->yy_c_buf_p - yyg->yytext_ptr) - 1;
+	number_to_move = (int) (yyg->yy_c_buf_p - yyg->yytext_ptr - 1);
 
 	for ( i = 0; i < number_to_move; ++i )
 		*(dest++) = *(source++);
@@ -1848,7 +2040,7 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
 		if ( number_to_move == YY_MORE_ADJ )
 			{
 			ret_val = EOB_ACT_END_OF_FILE;
-			xlu__disk_yyrestart(yyin  ,yyscanner);
+			yyrestart( yyin  , yyscanner);
 			}
 
 		else
@@ -1862,12 +2054,15 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
 	else
 		ret_val = EOB_ACT_CONTINUE_SCAN;
 
-	if ((yy_size_t) (yyg->yy_n_chars + number_to_move) > YY_CURRENT_BUFFER_LVALUE->yy_buf_size) {
+	if ((yyg->yy_n_chars + number_to_move) > YY_CURRENT_BUFFER_LVALUE->yy_buf_size) {
 		/* Extend the array by 50%, plus the number we really need. */
-		yy_size_t new_size = yyg->yy_n_chars + number_to_move + (yyg->yy_n_chars >> 1);
-		YY_CURRENT_BUFFER_LVALUE->yy_ch_buf = (char *) xlu__disk_yyrealloc((void *) YY_CURRENT_BUFFER_LVALUE->yy_ch_buf,new_size ,yyscanner );
+		int new_size = yyg->yy_n_chars + number_to_move + (yyg->yy_n_chars >> 1);
+		YY_CURRENT_BUFFER_LVALUE->yy_ch_buf = (char *) yyrealloc(
+			(void *) YY_CURRENT_BUFFER_LVALUE->yy_ch_buf, (yy_size_t) new_size , yyscanner );
 		if ( ! YY_CURRENT_BUFFER_LVALUE->yy_ch_buf )
 			YY_FATAL_ERROR( "out of dynamic memory in yy_get_next_buffer()" );
+		/* "- 2" to take care of EOB's */
+		YY_CURRENT_BUFFER_LVALUE->yy_buf_size = (int) (new_size - 2);
 	}
 
 	yyg->yy_n_chars += number_to_move;
@@ -1883,8 +2078,8 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
 
     static yy_state_type yy_get_previous_state (yyscan_t yyscanner)
 {
-	register yy_state_type yy_current_state;
-	register char *yy_cp;
+	yy_state_type yy_current_state;
+	char *yy_cp;
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 
 	yy_current_state = yyg->yy_start;
@@ -1894,14 +2089,14 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
 
 	for ( yy_cp = yyg->yytext_ptr + YY_MORE_ADJ; yy_cp < yyg->yy_c_buf_p; ++yy_cp )
 		{
-		register YY_CHAR yy_c = (*yy_cp ? yy_ec[YY_SC_TO_UI(*yy_cp)] : 1);
+		YY_CHAR yy_c = (*yy_cp ? yy_ec[YY_SC_TO_UI(*yy_cp)] : 1);
 		while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
 			{
 			yy_current_state = (int) yy_def[yy_current_state];
 			if ( yy_current_state >= 355 )
-				yy_c = yy_meta[(unsigned int) yy_c];
+				yy_c = yy_meta[yy_c];
 			}
-		yy_current_state = yy_nxt[yy_base[yy_current_state] + (unsigned int) yy_c];
+		yy_current_state = yy_nxt[yy_base[yy_current_state] + yy_c];
 		*yyg->yy_state_ptr++ = yy_current_state;
 		}
 
@@ -1915,17 +2110,17 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
  */
     static yy_state_type yy_try_NUL_trans  (yy_state_type yy_current_state , yyscan_t yyscanner)
 {
-	register int yy_is_jam;
+	int yy_is_jam;
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner; /* This var may be unused depending upon options. */
 
-	register YY_CHAR yy_c = 1;
+	YY_CHAR yy_c = 1;
 	while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
 		{
 		yy_current_state = (int) yy_def[yy_current_state];
 		if ( yy_current_state >= 355 )
-			yy_c = yy_meta[(unsigned int) yy_c];
+			yy_c = yy_meta[yy_c];
 		}
-	yy_current_state = yy_nxt[yy_base[yy_current_state] + (unsigned int) yy_c];
+	yy_current_state = yy_nxt[yy_base[yy_current_state] + yy_c];
 	yy_is_jam = (yy_current_state == 354);
 	if ( ! yy_is_jam )
 		*yyg->yy_state_ptr++ = yy_current_state;
@@ -1934,6 +2129,10 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
 	return yy_is_jam ? 0 : yy_current_state;
 }
 
+#ifndef YY_NO_UNPUT
+
+#endif
+
 #ifndef YY_NO_INPUT
 #ifdef __cplusplus
     static int yyinput (yyscan_t yyscanner)
@@ -1959,7 +2158,7 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
 
 		else
 			{ /* need more input */
-			yy_size_t offset = yyg->yy_c_buf_p - yyg->yytext_ptr;
+			int offset = (int) (yyg->yy_c_buf_p - yyg->yytext_ptr);
 			++yyg->yy_c_buf_p;
 
 			switch ( yy_get_next_buffer( yyscanner ) )
@@ -1976,14 +2175,14 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
 					 */
 
 					/* Reset buffer status. */
-					xlu__disk_yyrestart(yyin ,yyscanner);
+					yyrestart( yyin , yyscanner);
 
 					/*FALLTHROUGH*/
 
 				case EOB_ACT_END_OF_FILE:
 					{
-					if ( xlu__disk_yywrap(yyscanner ) )
-						return EOF;
+					if ( yywrap( yyscanner ) )
+						return 0;
 
 					if ( ! yyg->yy_did_buffer_switch_on_eof )
 						YY_NEW_FILE;
@@ -2014,34 +2213,34 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
  * @param yyscanner The scanner object.
  * @note This function does not reset the start condition to @c INITIAL .
  */
-    void xlu__disk_yyrestart  (FILE * input_file , yyscan_t yyscanner)
+    void yyrestart  (FILE * input_file , yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 
 	if ( ! YY_CURRENT_BUFFER ){
-        xlu__disk_yyensure_buffer_stack (yyscanner);
+        yyensure_buffer_stack (yyscanner);
 		YY_CURRENT_BUFFER_LVALUE =
-            xlu__disk_yy_create_buffer(yyin,YY_BUF_SIZE ,yyscanner);
+            yy_create_buffer( yyin, YY_BUF_SIZE , yyscanner);
 	}
 
-	xlu__disk_yy_init_buffer(YY_CURRENT_BUFFER,input_file ,yyscanner);
-	xlu__disk_yy_load_buffer_state(yyscanner );
+	yy_init_buffer( YY_CURRENT_BUFFER, input_file , yyscanner);
+	yy_load_buffer_state( yyscanner );
 }
 
 /** Switch to a different input buffer.
  * @param new_buffer The new input buffer.
  * @param yyscanner The scanner object.
  */
-    void xlu__disk_yy_switch_to_buffer  (YY_BUFFER_STATE  new_buffer , yyscan_t yyscanner)
+    void yy_switch_to_buffer  (YY_BUFFER_STATE  new_buffer , yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 
 	/* TODO. We should be able to replace this entire function body
 	 * with
-	 *		xlu__disk_yypop_buffer_state();
-	 *		xlu__disk_yypush_buffer_state(new_buffer);
+	 *		yypop_buffer_state();
+	 *		yypush_buffer_state(new_buffer);
      */
-	xlu__disk_yyensure_buffer_stack (yyscanner);
+	yyensure_buffer_stack (yyscanner);
 	if ( YY_CURRENT_BUFFER == new_buffer )
 		return;
 
@@ -2054,17 +2253,17 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
 		}
 
 	YY_CURRENT_BUFFER_LVALUE = new_buffer;
-	xlu__disk_yy_load_buffer_state(yyscanner );
+	yy_load_buffer_state( yyscanner );
 
 	/* We don't actually know whether we did this switch during
-	 * EOF (xlu__disk_yywrap()) processing, but the only time this flag
-	 * is looked at is after xlu__disk_yywrap() is called, so it's safe
+	 * EOF (yywrap()) processing, but the only time this flag
+	 * is looked at is after yywrap() is called, so it's safe
 	 * to go ahead and always set it.
 	 */
 	yyg->yy_did_buffer_switch_on_eof = 1;
 }
 
-static void xlu__disk_yy_load_buffer_state  (yyscan_t yyscanner)
+static void yy_load_buffer_state  (yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 	yyg->yy_n_chars = YY_CURRENT_BUFFER_LVALUE->yy_n_chars;
@@ -2079,35 +2278,35 @@ static void xlu__disk_yy_load_buffer_state  (yyscan_t yyscanner)
  * @param yyscanner The scanner object.
  * @return the allocated buffer state.
  */
-    YY_BUFFER_STATE xlu__disk_yy_create_buffer  (FILE * file, int  size , yyscan_t yyscanner)
+    YY_BUFFER_STATE yy_create_buffer  (FILE * file, int  size , yyscan_t yyscanner)
 {
 	YY_BUFFER_STATE b;
     
-	b = (YY_BUFFER_STATE) xlu__disk_yyalloc(sizeof( struct yy_buffer_state ) ,yyscanner );
+	b = (YY_BUFFER_STATE) yyalloc( sizeof( struct yy_buffer_state ) , yyscanner );
 	if ( ! b )
-		YY_FATAL_ERROR( "out of dynamic memory in xlu__disk_yy_create_buffer()" );
+		YY_FATAL_ERROR( "out of dynamic memory in yy_create_buffer()" );
 
 	b->yy_buf_size = size;
 
 	/* yy_ch_buf has to be 2 characters longer than the size given because
 	 * we need to put in 2 end-of-buffer characters.
 	 */
-	b->yy_ch_buf = (char *) xlu__disk_yyalloc(b->yy_buf_size + 2 ,yyscanner );
+	b->yy_ch_buf = (char *) yyalloc( (yy_size_t) (b->yy_buf_size + 2) , yyscanner );
 	if ( ! b->yy_ch_buf )
-		YY_FATAL_ERROR( "out of dynamic memory in xlu__disk_yy_create_buffer()" );
+		YY_FATAL_ERROR( "out of dynamic memory in yy_create_buffer()" );
 
 	b->yy_is_our_buffer = 1;
 
-	xlu__disk_yy_init_buffer(b,file ,yyscanner);
+	yy_init_buffer( b, file , yyscanner);
 
 	return b;
 }
 
 /** Destroy the buffer.
- * @param b a buffer created with xlu__disk_yy_create_buffer()
+ * @param b a buffer created with yy_create_buffer()
  * @param yyscanner The scanner object.
  */
-    void xlu__disk_yy_delete_buffer (YY_BUFFER_STATE  b , yyscan_t yyscanner)
+    void yy_delete_buffer (YY_BUFFER_STATE  b , yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 
@@ -2118,28 +2317,28 @@ static void xlu__disk_yy_load_buffer_state  (yyscan_t yyscanner)
 		YY_CURRENT_BUFFER_LVALUE = (YY_BUFFER_STATE) 0;
 
 	if ( b->yy_is_our_buffer )
-		xlu__disk_yyfree((void *) b->yy_ch_buf ,yyscanner );
+		yyfree( (void *) b->yy_ch_buf , yyscanner );
 
-	xlu__disk_yyfree((void *) b ,yyscanner );
+	yyfree( (void *) b , yyscanner );
 }
 
 /* Initializes or reinitializes a buffer.
  * This function is sometimes called more than once on the same buffer,
- * such as during a xlu__disk_yyrestart() or at EOF.
+ * such as during a yyrestart() or at EOF.
  */
-    static void xlu__disk_yy_init_buffer  (YY_BUFFER_STATE  b, FILE * file , yyscan_t yyscanner)
+    static void yy_init_buffer  (YY_BUFFER_STATE  b, FILE * file , yyscan_t yyscanner)
 
 {
 	int oerrno = errno;
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 
-	xlu__disk_yy_flush_buffer(b ,yyscanner);
+	yy_flush_buffer( b , yyscanner);
 
 	b->yy_input_file = file;
 	b->yy_fill_buffer = 1;
 
-    /* If b is the current buffer, then xlu__disk_yy_init_buffer was _probably_
-     * called from xlu__disk_yyrestart() or through yy_get_next_buffer.
+    /* If b is the current buffer, then yy_init_buffer was _probably_
+     * called from yyrestart() or through yy_get_next_buffer.
      * In that case, we don't want to reset the lineno or column.
      */
     if (b != YY_CURRENT_BUFFER){
@@ -2156,7 +2355,7 @@ static void xlu__disk_yy_load_buffer_state  (yyscan_t yyscanner)
  * @param b the buffer state to be flushed, usually @c YY_CURRENT_BUFFER.
  * @param yyscanner The scanner object.
  */
-    void xlu__disk_yy_flush_buffer (YY_BUFFER_STATE  b , yyscan_t yyscanner)
+    void yy_flush_buffer (YY_BUFFER_STATE  b , yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 	if ( ! b )
@@ -2177,7 +2376,7 @@ static void xlu__disk_yy_load_buffer_state  (yyscan_t yyscanner)
 	b->yy_buffer_status = YY_BUFFER_NEW;
 
 	if ( b == YY_CURRENT_BUFFER )
-		xlu__disk_yy_load_buffer_state(yyscanner );
+		yy_load_buffer_state( yyscanner );
 }
 
 /** Pushes the new state onto the stack. The new state becomes
@@ -2186,15 +2385,15 @@ static void xlu__disk_yy_load_buffer_state  (yyscan_t yyscanner)
  *  @param new_buffer The new state.
  *  @param yyscanner The scanner object.
  */
-void xlu__disk_yypush_buffer_state (YY_BUFFER_STATE new_buffer , yyscan_t yyscanner)
+void yypush_buffer_state (YY_BUFFER_STATE new_buffer , yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 	if (new_buffer == NULL)
 		return;
 
-	xlu__disk_yyensure_buffer_stack(yyscanner);
+	yyensure_buffer_stack(yyscanner);
 
-	/* This block is copied from xlu__disk_yy_switch_to_buffer. */
+	/* This block is copied from yy_switch_to_buffer. */
 	if ( YY_CURRENT_BUFFER )
 		{
 		/* Flush out information for old buffer. */
@@ -2208,8 +2407,8 @@ void xlu__disk_yypush_buffer_state (YY_BUFFER_STATE new_buffer , yyscan_t yyscan
 		yyg->yy_buffer_stack_top++;
 	YY_CURRENT_BUFFER_LVALUE = new_buffer;
 
-	/* copied from xlu__disk_yy_switch_to_buffer. */
-	xlu__disk_yy_load_buffer_state(yyscanner );
+	/* copied from yy_switch_to_buffer. */
+	yy_load_buffer_state( yyscanner );
 	yyg->yy_did_buffer_switch_on_eof = 1;
 }
 
@@ -2217,19 +2416,19 @@ void xlu__disk_yypush_buffer_state (YY_BUFFER_STATE new_buffer , yyscan_t yyscan
  *  The next element becomes the new top.
  *  @param yyscanner The scanner object.
  */
-void xlu__disk_yypop_buffer_state (yyscan_t yyscanner)
+void yypop_buffer_state (yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 	if (!YY_CURRENT_BUFFER)
 		return;
 
-	xlu__disk_yy_delete_buffer(YY_CURRENT_BUFFER ,yyscanner);
+	yy_delete_buffer(YY_CURRENT_BUFFER , yyscanner);
 	YY_CURRENT_BUFFER_LVALUE = NULL;
 	if (yyg->yy_buffer_stack_top > 0)
 		--yyg->yy_buffer_stack_top;
 
 	if (YY_CURRENT_BUFFER) {
-		xlu__disk_yy_load_buffer_state(yyscanner );
+		yy_load_buffer_state( yyscanner );
 		yyg->yy_did_buffer_switch_on_eof = 1;
 	}
 }
@@ -2237,7 +2436,7 @@ void xlu__disk_yypop_buffer_state (yyscan_t yyscanner)
 /* Allocates the stack if it does not exist.
  *  Guarantees space for at least one push.
  */
-static void xlu__disk_yyensure_buffer_stack (yyscan_t yyscanner)
+static void yyensure_buffer_stack (yyscan_t yyscanner)
 {
 	yy_size_t num_to_alloc;
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
@@ -2248,15 +2447,15 @@ static void xlu__disk_yyensure_buffer_stack (yyscan_t yyscanner)
 		 * scanner will even need a stack. We use 2 instead of 1 to avoid an
 		 * immediate realloc on the next call.
          */
-		num_to_alloc = 1;
-		yyg->yy_buffer_stack = (struct yy_buffer_state**)xlu__disk_yyalloc
+      num_to_alloc = 1; /* After all that talk, this was set to 1 anyways... */
+		yyg->yy_buffer_stack = (struct yy_buffer_state**)yyalloc
 								(num_to_alloc * sizeof(struct yy_buffer_state*)
 								, yyscanner);
 		if ( ! yyg->yy_buffer_stack )
-			YY_FATAL_ERROR( "out of dynamic memory in xlu__disk_yyensure_buffer_stack()" );
-								  
+			YY_FATAL_ERROR( "out of dynamic memory in yyensure_buffer_stack()" );
+
 		memset(yyg->yy_buffer_stack, 0, num_to_alloc * sizeof(struct yy_buffer_state*));
-				
+
 		yyg->yy_buffer_stack_max = num_to_alloc;
 		yyg->yy_buffer_stack_top = 0;
 		return;
@@ -2265,15 +2464,15 @@ static void xlu__disk_yyensure_buffer_stack (yyscan_t yyscanner)
 	if (yyg->yy_buffer_stack_top >= (yyg->yy_buffer_stack_max) - 1){
 
 		/* Increase the buffer to prepare for a possible push. */
-		int grow_size = 8 /* arbitrary grow size */;
+		yy_size_t grow_size = 8 /* arbitrary grow size */;
 
 		num_to_alloc = yyg->yy_buffer_stack_max + grow_size;
-		yyg->yy_buffer_stack = (struct yy_buffer_state**)xlu__disk_yyrealloc
+		yyg->yy_buffer_stack = (struct yy_buffer_state**)yyrealloc
 								(yyg->yy_buffer_stack,
 								num_to_alloc * sizeof(struct yy_buffer_state*)
 								, yyscanner);
 		if ( ! yyg->yy_buffer_stack )
-			YY_FATAL_ERROR( "out of dynamic memory in xlu__disk_yyensure_buffer_stack()" );
+			YY_FATAL_ERROR( "out of dynamic memory in yyensure_buffer_stack()" );
 
 		/* zero only the new slots.*/
 		memset(yyg->yy_buffer_stack + yyg->yy_buffer_stack_max, 0, grow_size * sizeof(struct yy_buffer_state*));
@@ -2285,9 +2484,9 @@ static void xlu__disk_yyensure_buffer_stack (yyscan_t yyscanner)
  * @param base the character buffer
  * @param size the size in bytes of the character buffer
  * @param yyscanner The scanner object.
- * @return the newly allocated buffer state object. 
+ * @return the newly allocated buffer state object.
  */
-YY_BUFFER_STATE xlu__disk_yy_scan_buffer  (char * base, yy_size_t  size , yyscan_t yyscanner)
+YY_BUFFER_STATE yy_scan_buffer  (char * base, yy_size_t  size , yyscan_t yyscanner)
 {
 	YY_BUFFER_STATE b;
     
@@ -2295,69 +2494,69 @@ YY_BUFFER_STATE xlu__disk_yy_scan_buffer  (char * base, yy_size_t  size , yyscan
 	     base[size-2] != YY_END_OF_BUFFER_CHAR ||
 	     base[size-1] != YY_END_OF_BUFFER_CHAR )
 		/* They forgot to leave room for the EOB's. */
-		return 0;
+		return NULL;
 
-	b = (YY_BUFFER_STATE) xlu__disk_yyalloc(sizeof( struct yy_buffer_state ) ,yyscanner );
+	b = (YY_BUFFER_STATE) yyalloc( sizeof( struct yy_buffer_state ) , yyscanner );
 	if ( ! b )
-		YY_FATAL_ERROR( "out of dynamic memory in xlu__disk_yy_scan_buffer()" );
+		YY_FATAL_ERROR( "out of dynamic memory in yy_scan_buffer()" );
 
-	b->yy_buf_size = size - 2;	/* "- 2" to take care of EOB's */
+	b->yy_buf_size = (int) (size - 2);	/* "- 2" to take care of EOB's */
 	b->yy_buf_pos = b->yy_ch_buf = base;
 	b->yy_is_our_buffer = 0;
-	b->yy_input_file = 0;
+	b->yy_input_file = NULL;
 	b->yy_n_chars = b->yy_buf_size;
 	b->yy_is_interactive = 0;
 	b->yy_at_bol = 1;
 	b->yy_fill_buffer = 0;
 	b->yy_buffer_status = YY_BUFFER_NEW;
 
-	xlu__disk_yy_switch_to_buffer(b ,yyscanner );
+	yy_switch_to_buffer( b , yyscanner );
 
 	return b;
 }
 
-/** Setup the input buffer state to scan a string. The next call to xlu__disk_yylex() will
+/** Setup the input buffer state to scan a string. The next call to yylex() will
  * scan from a @e copy of @a str.
  * @param yystr a NUL-terminated string to scan
  * @param yyscanner The scanner object.
  * @return the newly allocated buffer state object.
  * @note If you want to scan bytes that may contain NUL values, then use
- *       xlu__disk_yy_scan_bytes() instead.
+ *       yy_scan_bytes() instead.
  */
-YY_BUFFER_STATE xlu__disk_yy_scan_string (yyconst char * yystr , yyscan_t yyscanner)
+YY_BUFFER_STATE yy_scan_string (const char * yystr , yyscan_t yyscanner)
 {
     
-	return xlu__disk_yy_scan_bytes(yystr,strlen(yystr) ,yyscanner);
+	return yy_scan_bytes( yystr, (int) strlen(yystr) , yyscanner);
 }
 
-/** Setup the input buffer state to scan the given bytes. The next call to xlu__disk_yylex() will
+/** Setup the input buffer state to scan the given bytes. The next call to yylex() will
  * scan from a @e copy of @a bytes.
  * @param yybytes the byte buffer to scan
  * @param _yybytes_len the number of bytes in the buffer pointed to by @a bytes.
  * @param yyscanner The scanner object.
  * @return the newly allocated buffer state object.
  */
-YY_BUFFER_STATE xlu__disk_yy_scan_bytes  (yyconst char * yybytes, yy_size_t  _yybytes_len , yyscan_t yyscanner)
+YY_BUFFER_STATE yy_scan_bytes  (const char * yybytes, int  _yybytes_len , yyscan_t yyscanner)
 {
 	YY_BUFFER_STATE b;
 	char *buf;
 	yy_size_t n;
-	yy_size_t i;
+	int i;
     
 	/* Get memory for full buffer, including space for trailing EOB's. */
-	n = _yybytes_len + 2;
-	buf = (char *) xlu__disk_yyalloc(n ,yyscanner );
+	n = (yy_size_t) (_yybytes_len + 2);
+	buf = (char *) yyalloc( n , yyscanner );
 	if ( ! buf )
-		YY_FATAL_ERROR( "out of dynamic memory in xlu__disk_yy_scan_bytes()" );
+		YY_FATAL_ERROR( "out of dynamic memory in yy_scan_bytes()" );
 
 	for ( i = 0; i < _yybytes_len; ++i )
 		buf[i] = yybytes[i];
 
 	buf[_yybytes_len] = buf[_yybytes_len+1] = YY_END_OF_BUFFER_CHAR;
 
-	b = xlu__disk_yy_scan_buffer(buf,n ,yyscanner);
+	b = yy_scan_buffer( buf, n , yyscanner);
 	if ( ! b )
-		YY_FATAL_ERROR( "bad buffer in xlu__disk_yy_scan_bytes()" );
+		YY_FATAL_ERROR( "bad buffer in yy_scan_bytes()" );
 
 	/* It's okay to grow etc. this buffer, and we should throw it
 	 * away when we're done.
@@ -2371,9 +2570,11 @@ YY_BUFFER_STATE xlu__disk_yy_scan_bytes  (yyconst char * yybytes, yy_size_t  _yy
 #define YY_EXIT_FAILURE 2
 #endif
 
-static void yy_fatal_error (yyconst char* msg , yyscan_t yyscanner)
+static void yynoreturn yy_fatal_error (const char* msg , yyscan_t yyscanner)
 {
-    	(void) fprintf( stderr, "%s\n", msg );
+	struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
+	(void)yyg;
+	fprintf( stderr, "%s\n", msg );
 	exit( YY_EXIT_FAILURE );
 }
 
@@ -2399,7 +2600,7 @@ static void yy_fatal_error (yyconst char* msg , yyscan_t yyscanner)
 /** Get the user-defined data for this scanner.
  * @param yyscanner The scanner object.
  */
-YY_EXTRA_TYPE xlu__disk_yyget_extra  (yyscan_t yyscanner)
+YY_EXTRA_TYPE yyget_extra  (yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
     return yyextra;
@@ -2408,10 +2609,10 @@ YY_EXTRA_TYPE xlu__disk_yyget_extra  (yyscan_t yyscanner)
 /** Get the current line number.
  * @param yyscanner The scanner object.
  */
-int xlu__disk_yyget_lineno  (yyscan_t yyscanner)
+int yyget_lineno  (yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
-    
+
         if (! YY_CURRENT_BUFFER)
             return 0;
     
@@ -2421,10 +2622,10 @@ int xlu__disk_yyget_lineno  (yyscan_t yyscanner)
 /** Get the current column number.
  * @param yyscanner The scanner object.
  */
-int xlu__disk_yyget_column  (yyscan_t yyscanner)
+int yyget_column  (yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
-    
+
         if (! YY_CURRENT_BUFFER)
             return 0;
     
@@ -2434,7 +2635,7 @@ int xlu__disk_yyget_column  (yyscan_t yyscanner)
 /** Get the input stream.
  * @param yyscanner The scanner object.
  */
-FILE *xlu__disk_yyget_in  (yyscan_t yyscanner)
+FILE *yyget_in  (yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
     return yyin;
@@ -2443,7 +2644,7 @@ FILE *xlu__disk_yyget_in  (yyscan_t yyscanner)
 /** Get the output stream.
  * @param yyscanner The scanner object.
  */
-FILE *xlu__disk_yyget_out  (yyscan_t yyscanner)
+FILE *yyget_out  (yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
     return yyout;
@@ -2452,7 +2653,7 @@ FILE *xlu__disk_yyget_out  (yyscan_t yyscanner)
 /** Get the length of the current token.
  * @param yyscanner The scanner object.
  */
-yy_size_t xlu__disk_yyget_leng  (yyscan_t yyscanner)
+int yyget_leng  (yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
     return yyleng;
@@ -2462,7 +2663,7 @@ yy_size_t xlu__disk_yyget_leng  (yyscan_t yyscanner)
  * @param yyscanner The scanner object.
  */
 
-char *xlu__disk_yyget_text  (yyscan_t yyscanner)
+char *yyget_text  (yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
     return yytext;
@@ -2472,90 +2673,88 @@ char *xlu__disk_yyget_text  (yyscan_t yyscanner)
  * @param user_defined The data to be associated with this scanner.
  * @param yyscanner The scanner object.
  */
-void xlu__disk_yyset_extra (YY_EXTRA_TYPE  user_defined , yyscan_t yyscanner)
+void yyset_extra (YY_EXTRA_TYPE  user_defined , yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
     yyextra = user_defined ;
 }
 
 /** Set the current line number.
- * @param line_number
+ * @param _line_number line number
  * @param yyscanner The scanner object.
  */
-void xlu__disk_yyset_lineno (int  line_number , yyscan_t yyscanner)
+void yyset_lineno (int  _line_number , yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 
         /* lineno is only valid if an input buffer exists. */
         if (! YY_CURRENT_BUFFER )
-           YY_FATAL_ERROR( "xlu__disk_yyset_lineno called with no buffer" );
+           YY_FATAL_ERROR( "yyset_lineno called with no buffer" );
     
-    yylineno = line_number;
+    yylineno = _line_number;
 }
 
 /** Set the current column.
- * @param line_number
+ * @param _column_no column number
  * @param yyscanner The scanner object.
  */
-void xlu__disk_yyset_column (int  column_no , yyscan_t yyscanner)
+void yyset_column (int  _column_no , yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 
         /* column is only valid if an input buffer exists. */
         if (! YY_CURRENT_BUFFER )
-           YY_FATAL_ERROR( "xlu__disk_yyset_column called with no buffer" );
+           YY_FATAL_ERROR( "yyset_column called with no buffer" );
     
-    yycolumn = column_no;
+    yycolumn = _column_no;
 }
 
 /** Set the input stream. This does not discard the current
  * input buffer.
- * @param in_str A readable stream.
+ * @param _in_str A readable stream.
  * @param yyscanner The scanner object.
- * @see xlu__disk_yy_switch_to_buffer
+ * @see yy_switch_to_buffer
  */
-void xlu__disk_yyset_in (FILE *  in_str , yyscan_t yyscanner)
+void yyset_in (FILE *  _in_str , yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
-    yyin = in_str ;
+    yyin = _in_str ;
 }
 
-void xlu__disk_yyset_out (FILE *  out_str , yyscan_t yyscanner)
+void yyset_out (FILE *  _out_str , yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
-    yyout = out_str ;
+    yyout = _out_str ;
 }
 
-int xlu__disk_yyget_debug  (yyscan_t yyscanner)
+int yyget_debug  (yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
     return yy_flex_debug;
 }
 
-void xlu__disk_yyset_debug (int  bdebug , yyscan_t yyscanner)
+void yyset_debug (int  _bdebug , yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
-    yy_flex_debug = bdebug ;
+    yy_flex_debug = _bdebug ;
 }
 
 /* Accessor methods for yylval and yylloc */
 
 /* User-visible API */
 
-/* xlu__disk_yylex_init is special because it creates the scanner itself, so it is
+/* yylex_init is special because it creates the scanner itself, so it is
  * the ONLY reentrant function that doesn't take the scanner as the last argument.
  * That's why we explicitly handle the declaration, instead of using our macros.
  */
-
-int xlu__disk_yylex_init(yyscan_t* ptr_yy_globals)
-
+int yylex_init(yyscan_t* ptr_yy_globals)
 {
     if (ptr_yy_globals == NULL){
         errno = EINVAL;
         return 1;
     }
 
-    *ptr_yy_globals = (yyscan_t) xlu__disk_yyalloc ( sizeof( struct yyguts_t ), NULL );
+    *ptr_yy_globals = (yyscan_t) yyalloc ( sizeof( struct yyguts_t ), NULL );
 
     if (*ptr_yy_globals == NULL){
         errno = ENOMEM;
@@ -2568,39 +2767,37 @@ int xlu__disk_yylex_init(yyscan_t* ptr_yy_globals)
     return yy_init_globals ( *ptr_yy_globals );
 }
 
-/* xlu__disk_yylex_init_extra has the same functionality as xlu__disk_yylex_init, but follows the
+/* yylex_init_extra has the same functionality as yylex_init, but follows the
  * convention of taking the scanner as the last argument. Note however, that
  * this is a *pointer* to a scanner, as it will be allocated by this call (and
  * is the reason, too, why this function also must handle its own declaration).
- * The user defined value in the first argument will be available to xlu__disk_yyalloc in
+ * The user defined value in the first argument will be available to yyalloc in
  * the yyextra field.
  */
-
-int xlu__disk_yylex_init_extra(YY_EXTRA_TYPE yy_user_defined,yyscan_t* ptr_yy_globals )
-
+int yylex_init_extra( YY_EXTRA_TYPE yy_user_defined, yyscan_t* ptr_yy_globals )
 {
     struct yyguts_t dummy_yyguts;
 
-    xlu__disk_yyset_extra (yy_user_defined, &dummy_yyguts);
+    yyset_extra (yy_user_defined, &dummy_yyguts);
 
     if (ptr_yy_globals == NULL){
         errno = EINVAL;
         return 1;
     }
-	
-    *ptr_yy_globals = (yyscan_t) xlu__disk_yyalloc ( sizeof( struct yyguts_t ), &dummy_yyguts );
-	
+
+    *ptr_yy_globals = (yyscan_t) yyalloc ( sizeof( struct yyguts_t ), &dummy_yyguts );
+
     if (*ptr_yy_globals == NULL){
         errno = ENOMEM;
         return 1;
     }
-    
+
     /* By setting to 0xAA, we expose bugs in
     yy_init_globals. Leave at 0x00 for releases. */
     memset(*ptr_yy_globals,0x00,sizeof(struct yyguts_t));
-    
-    xlu__disk_yyset_extra (yy_user_defined, *ptr_yy_globals);
-    
+
+    yyset_extra (yy_user_defined, *ptr_yy_globals);
+
     return yy_init_globals ( *ptr_yy_globals );
 }
 
@@ -2608,13 +2805,13 @@ static int yy_init_globals (yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
     /* Initialization is the same as for the non-reentrant scanner.
-     * This function is called from xlu__disk_yylex_destroy(), so don't allocate here.
+     * This function is called from yylex_destroy(), so don't allocate here.
      */
 
-    yyg->yy_buffer_stack = 0;
+    yyg->yy_buffer_stack = NULL;
     yyg->yy_buffer_stack_top = 0;
     yyg->yy_buffer_stack_max = 0;
-    yyg->yy_c_buf_p = (char *) 0;
+    yyg->yy_c_buf_p = NULL;
     yyg->yy_init = 0;
     yyg->yy_start = 0;
 
@@ -2632,45 +2829,45 @@ static int yy_init_globals (yyscan_t yyscanner)
     yyin = stdin;
     yyout = stdout;
 #else
-    yyin = (FILE *) 0;
-    yyout = (FILE *) 0;
+    yyin = NULL;
+    yyout = NULL;
 #endif
 
     /* For future reference: Set errno on error, since we are called by
-     * xlu__disk_yylex_init()
+     * yylex_init()
      */
     return 0;
 }
 
-/* xlu__disk_yylex_destroy is for both reentrant and non-reentrant scanners. */
-int xlu__disk_yylex_destroy  (yyscan_t yyscanner)
+/* yylex_destroy is for both reentrant and non-reentrant scanners. */
+int yylex_destroy  (yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 
     /* Pop the buffer stack, destroying each element. */
 	while(YY_CURRENT_BUFFER){
-		xlu__disk_yy_delete_buffer(YY_CURRENT_BUFFER ,yyscanner );
+		yy_delete_buffer( YY_CURRENT_BUFFER , yyscanner );
 		YY_CURRENT_BUFFER_LVALUE = NULL;
-		xlu__disk_yypop_buffer_state(yyscanner);
+		yypop_buffer_state(yyscanner);
 	}
 
 	/* Destroy the stack itself. */
-	xlu__disk_yyfree(yyg->yy_buffer_stack ,yyscanner);
+	yyfree(yyg->yy_buffer_stack , yyscanner);
 	yyg->yy_buffer_stack = NULL;
 
     /* Destroy the start condition stack. */
-        xlu__disk_yyfree(yyg->yy_start_stack ,yyscanner );
+        yyfree( yyg->yy_start_stack , yyscanner );
         yyg->yy_start_stack = NULL;
 
-    xlu__disk_yyfree ( yyg->yy_state_buf , yyscanner);
+    yyfree ( yyg->yy_state_buf , yyscanner);
     yyg->yy_state_buf  = NULL;
 
     /* Reset the globals. This is important in a non-reentrant scanner so the next time
-     * xlu__disk_yylex() is called, initialization will occur. */
+     * yylex() is called, initialization will occur. */
     yy_init_globals( yyscanner);
 
     /* Destroy the main struct (reentrant only). */
-    xlu__disk_yyfree ( yyscanner , yyscanner );
+    yyfree ( yyscanner , yyscanner );
     yyscanner = NULL;
     return 0;
 }
@@ -2680,18 +2877,21 @@ int xlu__disk_yylex_destroy  (yyscan_t yyscanner)
  */
 
 #ifndef yytext_ptr
-static void yy_flex_strncpy (char* s1, yyconst char * s2, int n , yyscan_t yyscanner)
+static void yy_flex_strncpy (char* s1, const char * s2, int n , yyscan_t yyscanner)
 {
-	register int i;
+	struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
+	(void)yyg;
+
+	int i;
 	for ( i = 0; i < n; ++i )
 		s1[i] = s2[i];
 }
 #endif
 
 #ifdef YY_NEED_STRLEN
-static int yy_flex_strlen (yyconst char * s , yyscan_t yyscanner)
+static int yy_flex_strlen (const char * s , yyscan_t yyscanner)
 {
-	register int n;
+	int n;
 	for ( n = 0; s[n]; ++n )
 		;
 
@@ -2699,13 +2899,18 @@ static int yy_flex_strlen (yyconst char * s , yyscan_t yyscanner)
 }
 #endif
 
-void *xlu__disk_yyalloc (yy_size_t  size , yyscan_t yyscanner)
+void *yyalloc (yy_size_t  size , yyscan_t yyscanner)
 {
-	return (void *) malloc( size );
+	struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
+	(void)yyg;
+	return malloc(size);
 }
 
-void *xlu__disk_yyrealloc  (void * ptr, yy_size_t  size , yyscan_t yyscanner)
+void *yyrealloc  (void * ptr, yy_size_t  size , yyscan_t yyscanner)
 {
+	struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
+	(void)yyg;
+
 	/* The cast to (char *) in the following accommodates both
 	 * implementations that use char* generic pointers, and those
 	 * that use void* generic pointers.  It works with the latter
@@ -2713,14 +2918,16 @@ void *xlu__disk_yyrealloc  (void * ptr, yy_size_t  size , yyscan_t yyscanner)
 	 * any pointer type to void*, and deal with argument conversions
 	 * as though doing an assignment.
 	 */
-	return (void *) realloc( (char *) ptr, size );
+	return realloc(ptr, size);
 }
 
-void xlu__disk_yyfree (void * ptr , yyscan_t yyscanner)
+void yyfree (void * ptr , yyscan_t yyscanner)
 {
-	free( (char *) ptr );	/* see xlu__disk_yyrealloc() for (char *) cast */
+	struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
+	(void)yyg;
+	free( (char *) ptr );	/* see yyrealloc() for (char *) cast */
 }
 
 #define YYTABLES_NAME "yytables"
 
-#line 278 "libxlu_disk_l.l"
+#line 280 "libxlu_disk_l.l"
diff --git a/tools/libxl/libxlu_disk_l.h b/tools/libxl/libxlu_disk_l.h
index 4d60d5c563b5..9275a3ab5547 100644
--- a/tools/libxl/libxlu_disk_l.h
+++ b/tools/libxl/libxlu_disk_l.h
@@ -3,12 +3,9 @@
 #define xlu__disk_yyIN_HEADER 1
 
 #line 6 "libxlu_disk_l.h"
-#line 31 "libxlu_disk_l.l"
 #include "libxl_osdeps.h" /* must come before any other headers */
 
-
-
-#line 12 "libxlu_disk_l.h"
+#line 9 "libxlu_disk_l.h"
 
 #define  YY_INT_ALIGNED short int
 
@@ -16,12 +13,222 @@
 
 #define FLEX_SCANNER
 #define YY_FLEX_MAJOR_VERSION 2
-#define YY_FLEX_MINOR_VERSION 5
-#define YY_FLEX_SUBMINOR_VERSION 39
+#define YY_FLEX_MINOR_VERSION 6
+#define YY_FLEX_SUBMINOR_VERSION 4
 #if YY_FLEX_SUBMINOR_VERSION > 0
 #define FLEX_BETA
 #endif
 
+#ifdef yy_create_buffer
+#define xlu__disk_yy_create_buffer_ALREADY_DEFINED
+#else
+#define yy_create_buffer xlu__disk_yy_create_buffer
+#endif
+
+#ifdef yy_delete_buffer
+#define xlu__disk_yy_delete_buffer_ALREADY_DEFINED
+#else
+#define yy_delete_buffer xlu__disk_yy_delete_buffer
+#endif
+
+#ifdef yy_scan_buffer
+#define xlu__disk_yy_scan_buffer_ALREADY_DEFINED
+#else
+#define yy_scan_buffer xlu__disk_yy_scan_buffer
+#endif
+
+#ifdef yy_scan_string
+#define xlu__disk_yy_scan_string_ALREADY_DEFINED
+#else
+#define yy_scan_string xlu__disk_yy_scan_string
+#endif
+
+#ifdef yy_scan_bytes
+#define xlu__disk_yy_scan_bytes_ALREADY_DEFINED
+#else
+#define yy_scan_bytes xlu__disk_yy_scan_bytes
+#endif
+
+#ifdef yy_init_buffer
+#define xlu__disk_yy_init_buffer_ALREADY_DEFINED
+#else
+#define yy_init_buffer xlu__disk_yy_init_buffer
+#endif
+
+#ifdef yy_flush_buffer
+#define xlu__disk_yy_flush_buffer_ALREADY_DEFINED
+#else
+#define yy_flush_buffer xlu__disk_yy_flush_buffer
+#endif
+
+#ifdef yy_load_buffer_state
+#define xlu__disk_yy_load_buffer_state_ALREADY_DEFINED
+#else
+#define yy_load_buffer_state xlu__disk_yy_load_buffer_state
+#endif
+
+#ifdef yy_switch_to_buffer
+#define xlu__disk_yy_switch_to_buffer_ALREADY_DEFINED
+#else
+#define yy_switch_to_buffer xlu__disk_yy_switch_to_buffer
+#endif
+
+#ifdef yypush_buffer_state
+#define xlu__disk_yypush_buffer_state_ALREADY_DEFINED
+#else
+#define yypush_buffer_state xlu__disk_yypush_buffer_state
+#endif
+
+#ifdef yypop_buffer_state
+#define xlu__disk_yypop_buffer_state_ALREADY_DEFINED
+#else
+#define yypop_buffer_state xlu__disk_yypop_buffer_state
+#endif
+
+#ifdef yyensure_buffer_stack
+#define xlu__disk_yyensure_buffer_stack_ALREADY_DEFINED
+#else
+#define yyensure_buffer_stack xlu__disk_yyensure_buffer_stack
+#endif
+
+#ifdef yylex
+#define xlu__disk_yylex_ALREADY_DEFINED
+#else
+#define yylex xlu__disk_yylex
+#endif
+
+#ifdef yyrestart
+#define xlu__disk_yyrestart_ALREADY_DEFINED
+#else
+#define yyrestart xlu__disk_yyrestart
+#endif
+
+#ifdef yylex_init
+#define xlu__disk_yylex_init_ALREADY_DEFINED
+#else
+#define yylex_init xlu__disk_yylex_init
+#endif
+
+#ifdef yylex_init_extra
+#define xlu__disk_yylex_init_extra_ALREADY_DEFINED
+#else
+#define yylex_init_extra xlu__disk_yylex_init_extra
+#endif
+
+#ifdef yylex_destroy
+#define xlu__disk_yylex_destroy_ALREADY_DEFINED
+#else
+#define yylex_destroy xlu__disk_yylex_destroy
+#endif
+
+#ifdef yyget_debug
+#define xlu__disk_yyget_debug_ALREADY_DEFINED
+#else
+#define yyget_debug xlu__disk_yyget_debug
+#endif
+
+#ifdef yyset_debug
+#define xlu__disk_yyset_debug_ALREADY_DEFINED
+#else
+#define yyset_debug xlu__disk_yyset_debug
+#endif
+
+#ifdef yyget_extra
+#define xlu__disk_yyget_extra_ALREADY_DEFINED
+#else
+#define yyget_extra xlu__disk_yyget_extra
+#endif
+
+#ifdef yyset_extra
+#define xlu__disk_yyset_extra_ALREADY_DEFINED
+#else
+#define yyset_extra xlu__disk_yyset_extra
+#endif
+
+#ifdef yyget_in
+#define xlu__disk_yyget_in_ALREADY_DEFINED
+#else
+#define yyget_in xlu__disk_yyget_in
+#endif
+
+#ifdef yyset_in
+#define xlu__disk_yyset_in_ALREADY_DEFINED
+#else
+#define yyset_in xlu__disk_yyset_in
+#endif
+
+#ifdef yyget_out
+#define xlu__disk_yyget_out_ALREADY_DEFINED
+#else
+#define yyget_out xlu__disk_yyget_out
+#endif
+
+#ifdef yyset_out
+#define xlu__disk_yyset_out_ALREADY_DEFINED
+#else
+#define yyset_out xlu__disk_yyset_out
+#endif
+
+#ifdef yyget_leng
+#define xlu__disk_yyget_leng_ALREADY_DEFINED
+#else
+#define yyget_leng xlu__disk_yyget_leng
+#endif
+
+#ifdef yyget_text
+#define xlu__disk_yyget_text_ALREADY_DEFINED
+#else
+#define yyget_text xlu__disk_yyget_text
+#endif
+
+#ifdef yyget_lineno
+#define xlu__disk_yyget_lineno_ALREADY_DEFINED
+#else
+#define yyget_lineno xlu__disk_yyget_lineno
+#endif
+
+#ifdef yyset_lineno
+#define xlu__disk_yyset_lineno_ALREADY_DEFINED
+#else
+#define yyset_lineno xlu__disk_yyset_lineno
+#endif
+
+#ifdef yyget_column
+#define xlu__disk_yyget_column_ALREADY_DEFINED
+#else
+#define yyget_column xlu__disk_yyget_column
+#endif
+
+#ifdef yyset_column
+#define xlu__disk_yyset_column_ALREADY_DEFINED
+#else
+#define yyset_column xlu__disk_yyset_column
+#endif
+
+#ifdef yywrap
+#define xlu__disk_yywrap_ALREADY_DEFINED
+#else
+#define yywrap xlu__disk_yywrap
+#endif
+
+#ifdef yyalloc
+#define xlu__disk_yyalloc_ALREADY_DEFINED
+#else
+#define yyalloc xlu__disk_yyalloc
+#endif
+
+#ifdef yyrealloc
+#define xlu__disk_yyrealloc_ALREADY_DEFINED
+#else
+#define yyrealloc xlu__disk_yyrealloc
+#endif
+
+#ifdef yyfree
+#define xlu__disk_yyfree_ALREADY_DEFINED
+#else
+#define yyfree xlu__disk_yyfree
+#endif
+
 /* First, we deal with  platform-specific or compiler-specific issues. */
 
 /* begin standard C headers. */
@@ -92,29 +299,23 @@ typedef unsigned int flex_uint32_t;
 #define UINT32_MAX             (4294967295U)
 #endif
 
+#ifndef SIZE_MAX
+#define SIZE_MAX               (~(size_t)0)
+#endif
+
 #endif /* ! C99 */
 
 #endif /* ! FLEXINT_H */
 
-#ifdef __cplusplus
-
-/* The "const" storage-class-modifier is valid. */
-#define YY_USE_CONST
-
-#else	/* ! __cplusplus */
-
-/* C99 requires __STDC__ to be defined as 1. */
-#if defined (__STDC__)
-
-#define YY_USE_CONST
-
-#endif	/* defined (__STDC__) */
-#endif	/* ! __cplusplus */
+/* begin standard C++ headers. */
 
-#ifdef YY_USE_CONST
+/* TODO: this is always defined, so inline it */
 #define yyconst const
+
+#if defined(__GNUC__) && __GNUC__ >= 3
+#define yynoreturn __attribute__((__noreturn__))
 #else
-#define yyconst
+#define yynoreturn
 #endif
 
 /* An opaque pointer. */
@@ -169,12 +370,12 @@ struct yy_buffer_state
 	/* Size of input buffer in bytes, not including room for EOB
 	 * characters.
 	 */
-	yy_size_t yy_buf_size;
+	int yy_buf_size;
 
 	/* Number of characters read into yy_ch_buf, not including EOB
 	 * characters.
 	 */
-	yy_size_t yy_n_chars;
+	int yy_n_chars;
 
 	/* Whether we "own" the buffer - i.e., we know we created it,
 	 * and can realloc() it to grow it, and should free() it to
@@ -197,7 +398,7 @@ struct yy_buffer_state
 
     int yy_bs_lineno; /**< The line count. */
     int yy_bs_column; /**< The column count. */
-    
+
 	/* Whether to try to fill the input buffer when we reach the
 	 * end of it.
 	 */
@@ -208,23 +409,23 @@ struct yy_buffer_state
 	};
 #endif /* !YY_STRUCT_YY_BUFFER_STATE */
 
-void xlu__disk_yyrestart (FILE *input_file ,yyscan_t yyscanner );
-void xlu__disk_yy_switch_to_buffer (YY_BUFFER_STATE new_buffer ,yyscan_t yyscanner );
-YY_BUFFER_STATE xlu__disk_yy_create_buffer (FILE *file,int size ,yyscan_t yyscanner );
-void xlu__disk_yy_delete_buffer (YY_BUFFER_STATE b ,yyscan_t yyscanner );
-void xlu__disk_yy_flush_buffer (YY_BUFFER_STATE b ,yyscan_t yyscanner );
-void xlu__disk_yypush_buffer_state (YY_BUFFER_STATE new_buffer ,yyscan_t yyscanner );
-void xlu__disk_yypop_buffer_state (yyscan_t yyscanner );
+void yyrestart ( FILE *input_file , yyscan_t yyscanner );
+void yy_switch_to_buffer ( YY_BUFFER_STATE new_buffer , yyscan_t yyscanner );
+YY_BUFFER_STATE yy_create_buffer ( FILE *file, int size , yyscan_t yyscanner );
+void yy_delete_buffer ( YY_BUFFER_STATE b , yyscan_t yyscanner );
+void yy_flush_buffer ( YY_BUFFER_STATE b , yyscan_t yyscanner );
+void yypush_buffer_state ( YY_BUFFER_STATE new_buffer , yyscan_t yyscanner );
+void yypop_buffer_state ( yyscan_t yyscanner );
 
-YY_BUFFER_STATE xlu__disk_yy_scan_buffer (char *base,yy_size_t size ,yyscan_t yyscanner );
-YY_BUFFER_STATE xlu__disk_yy_scan_string (yyconst char *yy_str ,yyscan_t yyscanner );
-YY_BUFFER_STATE xlu__disk_yy_scan_bytes (yyconst char *bytes,yy_size_t len ,yyscan_t yyscanner );
+YY_BUFFER_STATE yy_scan_buffer ( char *base, yy_size_t size , yyscan_t yyscanner );
+YY_BUFFER_STATE yy_scan_string ( const char *yy_str , yyscan_t yyscanner );
+YY_BUFFER_STATE yy_scan_bytes ( const char *bytes, int len , yyscan_t yyscanner );
 
-void *xlu__disk_yyalloc (yy_size_t ,yyscan_t yyscanner );
-void *xlu__disk_yyrealloc (void *,yy_size_t ,yyscan_t yyscanner );
-void xlu__disk_yyfree (void * ,yyscan_t yyscanner );
+void *yyalloc ( yy_size_t , yyscan_t yyscanner );
+void *yyrealloc ( void *, yy_size_t , yyscan_t yyscanner );
+void yyfree ( void * , yyscan_t yyscanner );
 
-#define xlu__disk_yywrap(yyscanner) 1
+#define xlu__disk_yywrap(yyscanner) (/*CONSTCOND*/1)
 #define YY_SKIP_YYWRAP
 
 #define yytext_ptr yytext_r
@@ -247,42 +448,42 @@ void xlu__disk_yyfree (void * ,yyscan_t yyscanner );
 #define YY_EXTRA_TYPE void *
 #endif
 
-int xlu__disk_yylex_init (yyscan_t* scanner);
+int yylex_init (yyscan_t* scanner);
 
-int xlu__disk_yylex_init_extra (YY_EXTRA_TYPE user_defined,yyscan_t* scanner);
+int yylex_init_extra ( YY_EXTRA_TYPE user_defined, yyscan_t* scanner);
 
 /* Accessor methods to globals.
    These are made visible to non-reentrant scanners for convenience. */
 
-int xlu__disk_yylex_destroy (yyscan_t yyscanner );
+int yylex_destroy ( yyscan_t yyscanner );
 
-int xlu__disk_yyget_debug (yyscan_t yyscanner );
+int yyget_debug ( yyscan_t yyscanner );
 
-void xlu__disk_yyset_debug (int debug_flag ,yyscan_t yyscanner );
+void yyset_debug ( int debug_flag , yyscan_t yyscanner );
 
-YY_EXTRA_TYPE xlu__disk_yyget_extra (yyscan_t yyscanner );
+YY_EXTRA_TYPE yyget_extra ( yyscan_t yyscanner );
 
-void xlu__disk_yyset_extra (YY_EXTRA_TYPE user_defined ,yyscan_t yyscanner );
+void yyset_extra ( YY_EXTRA_TYPE user_defined , yyscan_t yyscanner );
 
-FILE *xlu__disk_yyget_in (yyscan_t yyscanner );
+FILE *yyget_in ( yyscan_t yyscanner );
 
-void xlu__disk_yyset_in  (FILE * in_str ,yyscan_t yyscanner );
+void yyset_in  ( FILE * _in_str , yyscan_t yyscanner );
 
-FILE *xlu__disk_yyget_out (yyscan_t yyscanner );
+FILE *yyget_out ( yyscan_t yyscanner );
 
-void xlu__disk_yyset_out  (FILE * out_str ,yyscan_t yyscanner );
+void yyset_out  ( FILE * _out_str , yyscan_t yyscanner );
 
-yy_size_t xlu__disk_yyget_leng (yyscan_t yyscanner );
+			int yyget_leng ( yyscan_t yyscanner );
 
-char *xlu__disk_yyget_text (yyscan_t yyscanner );
+char *yyget_text ( yyscan_t yyscanner );
 
-int xlu__disk_yyget_lineno (yyscan_t yyscanner );
+int yyget_lineno ( yyscan_t yyscanner );
 
-void xlu__disk_yyset_lineno (int line_number ,yyscan_t yyscanner );
+void yyset_lineno ( int _line_number , yyscan_t yyscanner );
 
-int xlu__disk_yyget_column  (yyscan_t yyscanner );
+int yyget_column  ( yyscan_t yyscanner );
 
-void xlu__disk_yyset_column (int column_no ,yyscan_t yyscanner );
+void yyset_column ( int _column_no , yyscan_t yyscanner );
 
 /* Macros after this point can all be overridden by user definitions in
  * section 1.
@@ -290,18 +491,18 @@ void xlu__disk_yyset_column (int column_no ,yyscan_t yyscanner );
 
 #ifndef YY_SKIP_YYWRAP
 #ifdef __cplusplus
-extern "C" int xlu__disk_yywrap (yyscan_t yyscanner );
+extern "C" int yywrap ( yyscan_t yyscanner );
 #else
-extern int xlu__disk_yywrap (yyscan_t yyscanner );
+extern int yywrap ( yyscan_t yyscanner );
 #endif
 #endif
 
 #ifndef yytext_ptr
-static void yy_flex_strncpy (char *,yyconst char *,int ,yyscan_t yyscanner);
+static void yy_flex_strncpy ( char *, const char *, int , yyscan_t yyscanner);
 #endif
 
 #ifdef YY_NEED_STRLEN
-static int yy_flex_strlen (yyconst char * ,yyscan_t yyscanner);
+static int yy_flex_strlen ( const char * , yyscan_t yyscanner);
 #endif
 
 #ifndef YY_NO_INPUT
@@ -329,9 +530,9 @@ static int yy_flex_strlen (yyconst char * ,yyscan_t yyscanner);
 #ifndef YY_DECL
 #define YY_DECL_IS_OURS 1
 
-extern int xlu__disk_yylex (yyscan_t yyscanner);
+extern int yylex (yyscan_t yyscanner);
 
-#define YY_DECL int xlu__disk_yylex (yyscan_t yyscanner)
+#define YY_DECL int yylex (yyscan_t yyscanner)
 #endif /* !YY_DECL */
 
 /* yy_get_previous_state - get the state just before the EOB char was reached */
@@ -348,8 +549,153 @@ extern int xlu__disk_yylex (yyscan_t yyscanner);
 #undef YY_DECL
 #endif
 
-#line 278 "libxlu_disk_l.l"
+#ifndef xlu__disk_yy_create_buffer_ALREADY_DEFINED
+#undef yy_create_buffer
+#endif
+#ifndef xlu__disk_yy_delete_buffer_ALREADY_DEFINED
+#undef yy_delete_buffer
+#endif
+#ifndef xlu__disk_yy_scan_buffer_ALREADY_DEFINED
+#undef yy_scan_buffer
+#endif
+#ifndef xlu__disk_yy_scan_string_ALREADY_DEFINED
+#undef yy_scan_string
+#endif
+#ifndef xlu__disk_yy_scan_bytes_ALREADY_DEFINED
+#undef yy_scan_bytes
+#endif
+#ifndef xlu__disk_yy_init_buffer_ALREADY_DEFINED
+#undef yy_init_buffer
+#endif
+#ifndef xlu__disk_yy_flush_buffer_ALREADY_DEFINED
+#undef yy_flush_buffer
+#endif
+#ifndef xlu__disk_yy_load_buffer_state_ALREADY_DEFINED
+#undef yy_load_buffer_state
+#endif
+#ifndef xlu__disk_yy_switch_to_buffer_ALREADY_DEFINED
+#undef yy_switch_to_buffer
+#endif
+#ifndef xlu__disk_yypush_buffer_state_ALREADY_DEFINED
+#undef yypush_buffer_state
+#endif
+#ifndef xlu__disk_yypop_buffer_state_ALREADY_DEFINED
+#undef yypop_buffer_state
+#endif
+#ifndef xlu__disk_yyensure_buffer_stack_ALREADY_DEFINED
+#undef yyensure_buffer_stack
+#endif
+#ifndef xlu__disk_yylex_ALREADY_DEFINED
+#undef yylex
+#endif
+#ifndef xlu__disk_yyrestart_ALREADY_DEFINED
+#undef yyrestart
+#endif
+#ifndef xlu__disk_yylex_init_ALREADY_DEFINED
+#undef yylex_init
+#endif
+#ifndef xlu__disk_yylex_init_extra_ALREADY_DEFINED
+#undef yylex_init_extra
+#endif
+#ifndef xlu__disk_yylex_destroy_ALREADY_DEFINED
+#undef yylex_destroy
+#endif
+#ifndef xlu__disk_yyget_debug_ALREADY_DEFINED
+#undef yyget_debug
+#endif
+#ifndef xlu__disk_yyset_debug_ALREADY_DEFINED
+#undef yyset_debug
+#endif
+#ifndef xlu__disk_yyget_extra_ALREADY_DEFINED
+#undef yyget_extra
+#endif
+#ifndef xlu__disk_yyset_extra_ALREADY_DEFINED
+#undef yyset_extra
+#endif
+#ifndef xlu__disk_yyget_in_ALREADY_DEFINED
+#undef yyget_in
+#endif
+#ifndef xlu__disk_yyset_in_ALREADY_DEFINED
+#undef yyset_in
+#endif
+#ifndef xlu__disk_yyget_out_ALREADY_DEFINED
+#undef yyget_out
+#endif
+#ifndef xlu__disk_yyset_out_ALREADY_DEFINED
+#undef yyset_out
+#endif
+#ifndef xlu__disk_yyget_leng_ALREADY_DEFINED
+#undef yyget_leng
+#endif
+#ifndef xlu__disk_yyget_text_ALREADY_DEFINED
+#undef yyget_text
+#endif
+#ifndef xlu__disk_yyget_lineno_ALREADY_DEFINED
+#undef yyget_lineno
+#endif
+#ifndef xlu__disk_yyset_lineno_ALREADY_DEFINED
+#undef yyset_lineno
+#endif
+#ifndef xlu__disk_yyget_column_ALREADY_DEFINED
+#undef yyget_column
+#endif
+#ifndef xlu__disk_yyset_column_ALREADY_DEFINED
+#undef yyset_column
+#endif
+#ifndef xlu__disk_yywrap_ALREADY_DEFINED
+#undef yywrap
+#endif
+#ifndef xlu__disk_yyget_lval_ALREADY_DEFINED
+#undef yyget_lval
+#endif
+#ifndef xlu__disk_yyset_lval_ALREADY_DEFINED
+#undef yyset_lval
+#endif
+#ifndef xlu__disk_yyget_lloc_ALREADY_DEFINED
+#undef yyget_lloc
+#endif
+#ifndef xlu__disk_yyset_lloc_ALREADY_DEFINED
+#undef yyset_lloc
+#endif
+#ifndef xlu__disk_yyalloc_ALREADY_DEFINED
+#undef yyalloc
+#endif
+#ifndef xlu__disk_yyrealloc_ALREADY_DEFINED
+#undef yyrealloc
+#endif
+#ifndef xlu__disk_yyfree_ALREADY_DEFINED
+#undef yyfree
+#endif
+#ifndef xlu__disk_yytext_ALREADY_DEFINED
+#undef yytext
+#endif
+#ifndef xlu__disk_yyleng_ALREADY_DEFINED
+#undef yyleng
+#endif
+#ifndef xlu__disk_yyin_ALREADY_DEFINED
+#undef yyin
+#endif
+#ifndef xlu__disk_yyout_ALREADY_DEFINED
+#undef yyout
+#endif
+#ifndef xlu__disk_yy_flex_debug_ALREADY_DEFINED
+#undef yy_flex_debug
+#endif
+#ifndef xlu__disk_yylineno_ALREADY_DEFINED
+#undef yylineno
+#endif
+#ifndef xlu__disk_yytables_fload_ALREADY_DEFINED
+#undef yytables_fload
+#endif
+#ifndef xlu__disk_yytables_destroy_ALREADY_DEFINED
+#undef yytables_destroy
+#endif
+#ifndef xlu__disk_yyTABLES_NAME_ALREADY_DEFINED
+#undef yyTABLES_NAME
+#endif
+
+#line 280 "libxlu_disk_l.l"
 
-#line 354 "libxlu_disk_l.h"
+#line 700 "libxlu_disk_l.h"
 #undef xlu__disk_yyIN_HEADER
 #endif /* xlu__disk_yyHEADER_H */
-- 
2.20.1


