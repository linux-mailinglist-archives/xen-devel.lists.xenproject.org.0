Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D071F7A9E
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 17:20:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjlTA-0002Yv-5D; Fri, 12 Jun 2020 15:19:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6GtF=7Z=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jjlT8-0002XL-Mx
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 15:19:46 +0000
X-Inumbo-ID: 22bc6026-acc0-11ea-8496-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22bc6026-acc0-11ea-8496-bc764e2007e4;
 Fri, 12 Jun 2020 15:19:40 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jjlT1-0005QE-VF; Fri, 12 Jun 2020 16:19:40 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [XEN PATCH for-4.14 2/2] tools: Commit flex (2.6.4) & bison (3.3.2)
 output from Debian buster
Date: Fri, 12 Jun 2020 16:19:31 +0100
Message-Id: <20200612151931.1083-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <000401d640c9$7b14e760$713eb620$@xen.org>
References: <000401d640c9$7b14e760$713eb620$@xen.org>
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
 Andrew Cooper <andrew.cooper3@citrix.com>, ian.jackson@eu.citrix.com,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

These files are in tree so that people can build (including from git)
without needing less-than-a-decade-old flex and bison.

We should update them periodically.  Debian buster has been Debian
stable for a while.  Our CI is running buster.

There should be no significant functional change; it's possible that
there are bugfixes but I have not reviewed the changes.  I *have*
checked that the flex I am using has the fix for CVE-2016-6354.

CC: Paul Durrant <paul@xen.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 tools/libxl/libxlu_cfg_l.c | 676 +++++++++++++++++++++++++------------
 tools/libxl/libxlu_cfg_l.h | 471 +++++++++++++++++++++++---
 tools/libxl/libxlu_cfg_y.c | 285 ++++++++--------
 tools/libxl/libxlu_cfg_y.h |  12 +-
 4 files changed, 1033 insertions(+), 411 deletions(-)

diff --git a/tools/libxl/libxlu_cfg_l.c b/tools/libxl/libxlu_cfg_l.c
index b82df00b4e..406b50a037 100644
--- a/tools/libxl/libxlu_cfg_l.c
+++ b/tools/libxl/libxlu_cfg_l.c
@@ -9,11 +9,245 @@
 #define FLEX_SCANNER
 #define YY_FLEX_MAJOR_VERSION 2
 #define YY_FLEX_MINOR_VERSION 6
-#define YY_FLEX_SUBMINOR_VERSION 1
+#define YY_FLEX_SUBMINOR_VERSION 4
 #if YY_FLEX_SUBMINOR_VERSION > 0
 #define FLEX_BETA
 #endif
 
+#ifdef yy_create_buffer
+#define xlu__cfg_yy_create_buffer_ALREADY_DEFINED
+#else
+#define yy_create_buffer xlu__cfg_yy_create_buffer
+#endif
+
+#ifdef yy_delete_buffer
+#define xlu__cfg_yy_delete_buffer_ALREADY_DEFINED
+#else
+#define yy_delete_buffer xlu__cfg_yy_delete_buffer
+#endif
+
+#ifdef yy_scan_buffer
+#define xlu__cfg_yy_scan_buffer_ALREADY_DEFINED
+#else
+#define yy_scan_buffer xlu__cfg_yy_scan_buffer
+#endif
+
+#ifdef yy_scan_string
+#define xlu__cfg_yy_scan_string_ALREADY_DEFINED
+#else
+#define yy_scan_string xlu__cfg_yy_scan_string
+#endif
+
+#ifdef yy_scan_bytes
+#define xlu__cfg_yy_scan_bytes_ALREADY_DEFINED
+#else
+#define yy_scan_bytes xlu__cfg_yy_scan_bytes
+#endif
+
+#ifdef yy_init_buffer
+#define xlu__cfg_yy_init_buffer_ALREADY_DEFINED
+#else
+#define yy_init_buffer xlu__cfg_yy_init_buffer
+#endif
+
+#ifdef yy_flush_buffer
+#define xlu__cfg_yy_flush_buffer_ALREADY_DEFINED
+#else
+#define yy_flush_buffer xlu__cfg_yy_flush_buffer
+#endif
+
+#ifdef yy_load_buffer_state
+#define xlu__cfg_yy_load_buffer_state_ALREADY_DEFINED
+#else
+#define yy_load_buffer_state xlu__cfg_yy_load_buffer_state
+#endif
+
+#ifdef yy_switch_to_buffer
+#define xlu__cfg_yy_switch_to_buffer_ALREADY_DEFINED
+#else
+#define yy_switch_to_buffer xlu__cfg_yy_switch_to_buffer
+#endif
+
+#ifdef yypush_buffer_state
+#define xlu__cfg_yypush_buffer_state_ALREADY_DEFINED
+#else
+#define yypush_buffer_state xlu__cfg_yypush_buffer_state
+#endif
+
+#ifdef yypop_buffer_state
+#define xlu__cfg_yypop_buffer_state_ALREADY_DEFINED
+#else
+#define yypop_buffer_state xlu__cfg_yypop_buffer_state
+#endif
+
+#ifdef yyensure_buffer_stack
+#define xlu__cfg_yyensure_buffer_stack_ALREADY_DEFINED
+#else
+#define yyensure_buffer_stack xlu__cfg_yyensure_buffer_stack
+#endif
+
+#ifdef yylex
+#define xlu__cfg_yylex_ALREADY_DEFINED
+#else
+#define yylex xlu__cfg_yylex
+#endif
+
+#ifdef yyrestart
+#define xlu__cfg_yyrestart_ALREADY_DEFINED
+#else
+#define yyrestart xlu__cfg_yyrestart
+#endif
+
+#ifdef yylex_init
+#define xlu__cfg_yylex_init_ALREADY_DEFINED
+#else
+#define yylex_init xlu__cfg_yylex_init
+#endif
+
+#ifdef yylex_init_extra
+#define xlu__cfg_yylex_init_extra_ALREADY_DEFINED
+#else
+#define yylex_init_extra xlu__cfg_yylex_init_extra
+#endif
+
+#ifdef yylex_destroy
+#define xlu__cfg_yylex_destroy_ALREADY_DEFINED
+#else
+#define yylex_destroy xlu__cfg_yylex_destroy
+#endif
+
+#ifdef yyget_debug
+#define xlu__cfg_yyget_debug_ALREADY_DEFINED
+#else
+#define yyget_debug xlu__cfg_yyget_debug
+#endif
+
+#ifdef yyset_debug
+#define xlu__cfg_yyset_debug_ALREADY_DEFINED
+#else
+#define yyset_debug xlu__cfg_yyset_debug
+#endif
+
+#ifdef yyget_extra
+#define xlu__cfg_yyget_extra_ALREADY_DEFINED
+#else
+#define yyget_extra xlu__cfg_yyget_extra
+#endif
+
+#ifdef yyset_extra
+#define xlu__cfg_yyset_extra_ALREADY_DEFINED
+#else
+#define yyset_extra xlu__cfg_yyset_extra
+#endif
+
+#ifdef yyget_in
+#define xlu__cfg_yyget_in_ALREADY_DEFINED
+#else
+#define yyget_in xlu__cfg_yyget_in
+#endif
+
+#ifdef yyset_in
+#define xlu__cfg_yyset_in_ALREADY_DEFINED
+#else
+#define yyset_in xlu__cfg_yyset_in
+#endif
+
+#ifdef yyget_out
+#define xlu__cfg_yyget_out_ALREADY_DEFINED
+#else
+#define yyget_out xlu__cfg_yyget_out
+#endif
+
+#ifdef yyset_out
+#define xlu__cfg_yyset_out_ALREADY_DEFINED
+#else
+#define yyset_out xlu__cfg_yyset_out
+#endif
+
+#ifdef yyget_leng
+#define xlu__cfg_yyget_leng_ALREADY_DEFINED
+#else
+#define yyget_leng xlu__cfg_yyget_leng
+#endif
+
+#ifdef yyget_text
+#define xlu__cfg_yyget_text_ALREADY_DEFINED
+#else
+#define yyget_text xlu__cfg_yyget_text
+#endif
+
+#ifdef yyget_lineno
+#define xlu__cfg_yyget_lineno_ALREADY_DEFINED
+#else
+#define yyget_lineno xlu__cfg_yyget_lineno
+#endif
+
+#ifdef yyset_lineno
+#define xlu__cfg_yyset_lineno_ALREADY_DEFINED
+#else
+#define yyset_lineno xlu__cfg_yyset_lineno
+#endif
+
+#ifdef yyget_column
+#define xlu__cfg_yyget_column_ALREADY_DEFINED
+#else
+#define yyget_column xlu__cfg_yyget_column
+#endif
+
+#ifdef yyset_column
+#define xlu__cfg_yyset_column_ALREADY_DEFINED
+#else
+#define yyset_column xlu__cfg_yyset_column
+#endif
+
+#ifdef yywrap
+#define xlu__cfg_yywrap_ALREADY_DEFINED
+#else
+#define yywrap xlu__cfg_yywrap
+#endif
+
+#ifdef yyget_lval
+#define xlu__cfg_yyget_lval_ALREADY_DEFINED
+#else
+#define yyget_lval xlu__cfg_yyget_lval
+#endif
+
+#ifdef yyset_lval
+#define xlu__cfg_yyset_lval_ALREADY_DEFINED
+#else
+#define yyset_lval xlu__cfg_yyset_lval
+#endif
+
+#ifdef yyget_lloc
+#define xlu__cfg_yyget_lloc_ALREADY_DEFINED
+#else
+#define yyget_lloc xlu__cfg_yyget_lloc
+#endif
+
+#ifdef yyset_lloc
+#define xlu__cfg_yyset_lloc_ALREADY_DEFINED
+#else
+#define yyset_lloc xlu__cfg_yyset_lloc
+#endif
+
+#ifdef yyalloc
+#define xlu__cfg_yyalloc_ALREADY_DEFINED
+#else
+#define yyalloc xlu__cfg_yyalloc
+#endif
+
+#ifdef yyrealloc
+#define xlu__cfg_yyrealloc_ALREADY_DEFINED
+#else
+#define yyrealloc xlu__cfg_yyrealloc
+#endif
+
+#ifdef yyfree
+#define xlu__cfg_yyfree_ALREADY_DEFINED
+#else
+#define yyfree xlu__cfg_yyfree
+#endif
+
 /* First, we deal with  platform-specific or compiler-specific issues. */
 
 /* begin standard C headers. */
@@ -84,10 +318,16 @@ typedef unsigned int flex_uint32_t;
 #define UINT32_MAX             (4294967295U)
 #endif
 
+#ifndef SIZE_MAX
+#define SIZE_MAX               (~(size_t)0)
+#endif
+
 #endif /* ! C99 */
 
 #endif /* ! FLEXINT_H */
 
+/* begin standard C++ headers. */
+
 /* TODO: this is always defined, so inline it */
 #define yyconst const
 
@@ -100,12 +340,10 @@ typedef unsigned int flex_uint32_t;
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
@@ -129,20 +367,16 @@ typedef void* yyscan_t;
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
-#define YY_NEW_FILE xlu__cfg_yyrestart(yyin ,yyscanner )
-
+#define YY_NEW_FILE yyrestart( yyin , yyscanner )
 #define YY_END_OF_BUFFER_CHAR 0
 
 /* Size of default input buffer. */
@@ -175,10 +409,10 @@ typedef size_t yy_size_t;
 #define EOB_ACT_CONTINUE_SCAN 0
 #define EOB_ACT_END_OF_FILE 1
 #define EOB_ACT_LAST_MATCH 2
-
+    
     /* Note: We specifically omit the test for yy_rule_can_match_eol because it requires
      *       access to the local variable yy_act. Since yyless() is a macro, it would break
-     *       existing scanners that call yyless() from OUTSIDE xlu__cfg_yylex.
+     *       existing scanners that call yyless() from OUTSIDE yylex.
      *       One obvious solution it to make yy_act a global. I tried that, and saw
      *       a 5% performance hit in a non-yylineno scanner, because yy_act is
      *       normally declared as a register variable-- so it is not worth it.
@@ -211,7 +445,6 @@ typedef size_t yy_size_t;
 		YY_DO_BEFORE_ACTION; /* set up yytext again */ \
 		} \
 	while ( 0 )
-
 #define unput(c) yyunput( c, yyg->yytext_ptr , yyscanner )
 
 #ifndef YY_STRUCT_YY_BUFFER_STATE
@@ -271,7 +504,7 @@ struct yy_buffer_state
 	 * possible backing-up.
 	 *
 	 * When we actually see the EOF, we change the status to "new"
-	 * (via xlu__cfg_yyrestart()), so that the user can continue scanning by
+	 * (via yyrestart()), so that the user can continue scanning by
 	 * just pointing yyin at a new input file.
 	 */
 #define YY_BUFFER_EOF_PENDING 2
@@ -288,71 +521,65 @@ struct yy_buffer_state
 #define YY_CURRENT_BUFFER ( yyg->yy_buffer_stack \
                           ? yyg->yy_buffer_stack[yyg->yy_buffer_stack_top] \
                           : NULL)
-
 /* Same as previous macro, but useful when we know that the buffer stack is not
  * NULL or when we need an lvalue. For internal use only.
  */
 #define YY_CURRENT_BUFFER_LVALUE yyg->yy_buffer_stack[yyg->yy_buffer_stack_top]
 
-void xlu__cfg_yyrestart (FILE *input_file ,yyscan_t yyscanner );
-void xlu__cfg_yy_switch_to_buffer (YY_BUFFER_STATE new_buffer ,yyscan_t yyscanner );
-YY_BUFFER_STATE xlu__cfg_yy_create_buffer (FILE *file,int size ,yyscan_t yyscanner );
-void xlu__cfg_yy_delete_buffer (YY_BUFFER_STATE b ,yyscan_t yyscanner );
-void xlu__cfg_yy_flush_buffer (YY_BUFFER_STATE b ,yyscan_t yyscanner );
-void xlu__cfg_yypush_buffer_state (YY_BUFFER_STATE new_buffer ,yyscan_t yyscanner );
-void xlu__cfg_yypop_buffer_state (yyscan_t yyscanner );
-
-static void xlu__cfg_yyensure_buffer_stack (yyscan_t yyscanner );
-static void xlu__cfg_yy_load_buffer_state (yyscan_t yyscanner );
-static void xlu__cfg_yy_init_buffer (YY_BUFFER_STATE b,FILE *file ,yyscan_t yyscanner );
+void yyrestart ( FILE *input_file , yyscan_t yyscanner );
+void yy_switch_to_buffer ( YY_BUFFER_STATE new_buffer , yyscan_t yyscanner );
+YY_BUFFER_STATE yy_create_buffer ( FILE *file, int size , yyscan_t yyscanner );
+void yy_delete_buffer ( YY_BUFFER_STATE b , yyscan_t yyscanner );
+void yy_flush_buffer ( YY_BUFFER_STATE b , yyscan_t yyscanner );
+void yypush_buffer_state ( YY_BUFFER_STATE new_buffer , yyscan_t yyscanner );
+void yypop_buffer_state ( yyscan_t yyscanner );
 
-#define YY_FLUSH_BUFFER xlu__cfg_yy_flush_buffer(YY_CURRENT_BUFFER ,yyscanner)
+static void yyensure_buffer_stack ( yyscan_t yyscanner );
+static void yy_load_buffer_state ( yyscan_t yyscanner );
+static void yy_init_buffer ( YY_BUFFER_STATE b, FILE *file , yyscan_t yyscanner );
+#define YY_FLUSH_BUFFER yy_flush_buffer( YY_CURRENT_BUFFER , yyscanner)
 
-YY_BUFFER_STATE xlu__cfg_yy_scan_buffer (char *base,yy_size_t size ,yyscan_t yyscanner );
-YY_BUFFER_STATE xlu__cfg_yy_scan_string (yyconst char *yy_str ,yyscan_t yyscanner );
-YY_BUFFER_STATE xlu__cfg_yy_scan_bytes (yyconst char *bytes,int len ,yyscan_t yyscanner );
+YY_BUFFER_STATE yy_scan_buffer ( char *base, yy_size_t size , yyscan_t yyscanner );
+YY_BUFFER_STATE yy_scan_string ( const char *yy_str , yyscan_t yyscanner );
+YY_BUFFER_STATE yy_scan_bytes ( const char *bytes, int len , yyscan_t yyscanner );
 
-void *xlu__cfg_yyalloc (yy_size_t ,yyscan_t yyscanner );
-void *xlu__cfg_yyrealloc (void *,yy_size_t ,yyscan_t yyscanner );
-void xlu__cfg_yyfree (void * ,yyscan_t yyscanner );
-
-#define yy_new_buffer xlu__cfg_yy_create_buffer
+void *yyalloc ( yy_size_t , yyscan_t yyscanner );
+void *yyrealloc ( void *, yy_size_t , yyscan_t yyscanner );
+void yyfree ( void * , yyscan_t yyscanner );
 
+#define yy_new_buffer yy_create_buffer
 #define yy_set_interactive(is_interactive) \
 	{ \
 	if ( ! YY_CURRENT_BUFFER ){ \
-        xlu__cfg_yyensure_buffer_stack (yyscanner); \
+        yyensure_buffer_stack (yyscanner); \
 		YY_CURRENT_BUFFER_LVALUE =    \
-            xlu__cfg_yy_create_buffer(yyin,YY_BUF_SIZE ,yyscanner); \
+            yy_create_buffer( yyin, YY_BUF_SIZE , yyscanner); \
 	} \
 	YY_CURRENT_BUFFER_LVALUE->yy_is_interactive = is_interactive; \
 	}
-
 #define yy_set_bol(at_bol) \
 	{ \
 	if ( ! YY_CURRENT_BUFFER ){\
-        xlu__cfg_yyensure_buffer_stack (yyscanner); \
+        yyensure_buffer_stack (yyscanner); \
 		YY_CURRENT_BUFFER_LVALUE =    \
-            xlu__cfg_yy_create_buffer(yyin,YY_BUF_SIZE ,yyscanner); \
+            yy_create_buffer( yyin, YY_BUF_SIZE , yyscanner); \
 	} \
 	YY_CURRENT_BUFFER_LVALUE->yy_at_bol = at_bol; \
 	}
-
 #define YY_AT_BOL() (YY_CURRENT_BUFFER_LVALUE->yy_at_bol)
 
 #define xlu__cfg_yywrap(yyscanner) (/*CONSTCOND*/1)
 #define YY_SKIP_YYWRAP
-
-typedef unsigned char YY_CHAR;
+typedef flex_uint8_t YY_CHAR;
 
 typedef int yy_state_type;
 
 #define yytext_ptr yytext_r
 
-static yy_state_type yy_get_previous_state (yyscan_t yyscanner );
-static yy_state_type yy_try_NUL_trans (yy_state_type current_state  ,yyscan_t yyscanner);
-static int yy_get_next_buffer (yyscan_t yyscanner );
-static void yynoreturn yy_fatal_error (yyconst char* msg ,yyscan_t yyscanner );
+static yy_state_type yy_get_previous_state ( yyscan_t yyscanner );
+static yy_state_type yy_try_NUL_trans ( yy_state_type current_state  , yyscan_t yyscanner);
+static int yy_get_next_buffer ( yyscan_t yyscanner );
+static void yynoreturn yy_fatal_error ( const char* msg , yyscan_t yyscanner );
 
 /* Done after the current pattern has been matched and before the
  * corresponding action - sets up yytext.
@@ -364,7 +591,6 @@ static void yynoreturn yy_fatal_error (yyconst char* msg ,yyscan_t yyscanner );
 	yyg->yy_hold_char = *yy_cp; \
 	*yy_cp = '\0'; \
 	yyg->yy_c_buf_p = yy_cp;
-
 #define YY_NUM_RULES 17
 #define YY_END_OF_BUFFER 18
 /* This struct is not used in this scanner,
@@ -374,7 +600,7 @@ struct yy_trans_info
 	flex_int32_t yy_verify;
 	flex_int32_t yy_nxt;
 	};
-static yyconst flex_int16_t yy_accept[37] =
+static const flex_int16_t yy_accept[37] =
     {   0,
         0,    0,   15,   15,   18,   14,    3,   10,   14,   14,
        14,   13,   13,    4,    2,    9,    8,    5,    6,    1,
@@ -382,7 +608,7 @@ static yyconst flex_int16_t yy_accept[37] =
         0,    7,    2,    1,   15,    0
     } ;
 
-static yyconst YY_CHAR yy_ec[256] =
+static const YY_CHAR yy_ec[256] =
     {   0,
         1,    1,    1,    1,    1,    1,    1,    1,    2,    3,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
@@ -414,13 +640,13 @@ static yyconst YY_CHAR yy_ec[256] =
         1,    1,    1,    1,    1
     } ;
 
-static yyconst YY_CHAR yy_meta[20] =
+static const YY_CHAR yy_meta[20] =
     {   0,
         1,    2,    3,    1,    1,    1,    1,    1,    1,    4,
         4,    1,    1,    1,    1,    1,    4,    4,    4
     } ;
 
-static yyconst flex_uint16_t yy_base[43] =
+static const flex_int16_t yy_base[43] =
     {   0,
         0,    0,   18,   20,   53,   59,   59,   59,   20,   42,
        19,   59,   19,   59,   15,   59,   59,   59,   59,    0,
@@ -429,7 +655,7 @@ static yyconst flex_uint16_t yy_base[43] =
        26,   54
     } ;
 
-static yyconst flex_int16_t yy_def[43] =
+static const flex_int16_t yy_def[43] =
     {   0,
        36,    1,   37,   37,   36,   36,   36,   36,   38,   39,
        40,   36,   36,   36,   36,   36,   36,   36,   36,   41,
@@ -438,7 +664,7 @@ static yyconst flex_int16_t yy_def[43] =
        36,   36
     } ;
 
-static yyconst flex_uint16_t yy_nxt[79] =
+static const flex_int16_t yy_nxt[79] =
     {   0,
         6,    7,    8,    9,   10,   11,   12,   13,   14,   12,
        15,   16,   17,   18,    6,   19,    6,   20,   20,   22,
@@ -450,7 +676,7 @@ static yyconst flex_uint16_t yy_nxt[79] =
        36,   36,   36,   36,   36,   36,   36,   36
     } ;
 
-static yyconst flex_int16_t yy_chk[79] =
+static const flex_int16_t yy_chk[79] =
     {   0,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    3,
@@ -463,7 +689,7 @@ static yyconst flex_int16_t yy_chk[79] =
     } ;
 
 /* Table of booleans, true if rule could match eol. */
-static yyconst flex_int32_t yy_rule_can_match_eol[18] =
+static const flex_int32_t yy_rule_can_match_eol[18] =
     {   0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0,     };
 
@@ -510,8 +736,9 @@ static yyconst flex_int32_t yy_rule_can_match_eol[18] =
 int xlu__cfg_yyget_column(yyscan_t yyscanner);
 void xlu__cfg_yyset_column(int  column_no, yyscan_t yyscanner);
 
+#line 740 "libxlu_cfg_l.c"
 
-#line 515 "libxlu_cfg_l.c"
+#line 742 "libxlu_cfg_l.c"
 
 #define INITIAL 0
 #define lexerr 1
@@ -566,7 +793,7 @@ struct yyguts_t
 
     }; /* end struct yyguts_t */
 
-static int yy_init_globals (yyscan_t yyscanner );
+static int yy_init_globals ( yyscan_t yyscanner );
 
     /* This must go here because YYSTYPE and YYLTYPE are included
      * from bison output in section 1.*/
@@ -574,50 +801,50 @@ static int yy_init_globals (yyscan_t yyscanner );
     
     #    define yylloc yyg->yylloc_r
     
-int xlu__cfg_yylex_init (yyscan_t* scanner);
+int yylex_init (yyscan_t* scanner);
 
-int xlu__cfg_yylex_init_extra (YY_EXTRA_TYPE user_defined,yyscan_t* scanner);
+int yylex_init_extra ( YY_EXTRA_TYPE user_defined, yyscan_t* scanner);
 
 /* Accessor methods to globals.
    These are made visible to non-reentrant scanners for convenience. */
 
-int xlu__cfg_yylex_destroy (yyscan_t yyscanner );
+int yylex_destroy ( yyscan_t yyscanner );
 
-int xlu__cfg_yyget_debug (yyscan_t yyscanner );
+int yyget_debug ( yyscan_t yyscanner );
 
-void xlu__cfg_yyset_debug (int debug_flag ,yyscan_t yyscanner );
+void yyset_debug ( int debug_flag , yyscan_t yyscanner );
 
-YY_EXTRA_TYPE xlu__cfg_yyget_extra (yyscan_t yyscanner );
+YY_EXTRA_TYPE yyget_extra ( yyscan_t yyscanner );
 
-void xlu__cfg_yyset_extra (YY_EXTRA_TYPE user_defined ,yyscan_t yyscanner );
+void yyset_extra ( YY_EXTRA_TYPE user_defined , yyscan_t yyscanner );
 
-FILE *xlu__cfg_yyget_in (yyscan_t yyscanner );
+FILE *yyget_in ( yyscan_t yyscanner );
 
-void xlu__cfg_yyset_in  (FILE * _in_str ,yyscan_t yyscanner );
+void yyset_in  ( FILE * _in_str , yyscan_t yyscanner );
 
-FILE *xlu__cfg_yyget_out (yyscan_t yyscanner );
+FILE *yyget_out ( yyscan_t yyscanner );
 
-void xlu__cfg_yyset_out  (FILE * _out_str ,yyscan_t yyscanner );
+void yyset_out  ( FILE * _out_str , yyscan_t yyscanner );
 
-			int xlu__cfg_yyget_leng (yyscan_t yyscanner );
+			int yyget_leng ( yyscan_t yyscanner );
 
-char *xlu__cfg_yyget_text (yyscan_t yyscanner );
+char *yyget_text ( yyscan_t yyscanner );
 
-int xlu__cfg_yyget_lineno (yyscan_t yyscanner );
+int yyget_lineno ( yyscan_t yyscanner );
 
-void xlu__cfg_yyset_lineno (int _line_number ,yyscan_t yyscanner );
+void yyset_lineno ( int _line_number , yyscan_t yyscanner );
 
-int xlu__cfg_yyget_column  (yyscan_t yyscanner );
+int yyget_column  ( yyscan_t yyscanner );
 
-void xlu__cfg_yyset_column (int _column_no ,yyscan_t yyscanner );
+void yyset_column ( int _column_no , yyscan_t yyscanner );
 
-YYSTYPE * xlu__cfg_yyget_lval (yyscan_t yyscanner );
+YYSTYPE * yyget_lval ( yyscan_t yyscanner );
 
-void xlu__cfg_yyset_lval (YYSTYPE * yylval_param ,yyscan_t yyscanner );
+void yyset_lval ( YYSTYPE * yylval_param , yyscan_t yyscanner );
 
-       YYLTYPE *xlu__cfg_yyget_lloc (yyscan_t yyscanner );
+       YYLTYPE *yyget_lloc ( yyscan_t yyscanner );
     
-        void xlu__cfg_yyset_lloc (YYLTYPE * yylloc_param ,yyscan_t yyscanner );
+        void yyset_lloc ( YYLTYPE * yylloc_param , yyscan_t yyscanner );
     
 /* Macros after this point can all be overridden by user definitions in
  * section 1.
@@ -625,9 +852,9 @@ void xlu__cfg_yyset_lval (YYSTYPE * yylval_param ,yyscan_t yyscanner );
 
 #ifndef YY_SKIP_YYWRAP
 #ifdef __cplusplus
-extern "C" int xlu__cfg_yywrap (yyscan_t yyscanner );
+extern "C" int yywrap ( yyscan_t yyscanner );
 #else
-extern int xlu__cfg_yywrap (yyscan_t yyscanner );
+extern int yywrap ( yyscan_t yyscanner );
 #endif
 #endif
 
@@ -636,19 +863,18 @@ extern int xlu__cfg_yywrap (yyscan_t yyscanner );
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
-
 #ifdef __cplusplus
-static int yyinput (yyscan_t yyscanner );
+static int yyinput ( yyscan_t yyscanner );
 #else
-static int input (yyscan_t yyscanner );
+static int input ( yyscan_t yyscanner );
 #endif
 
 #endif
@@ -679,7 +905,7 @@ static int input (yyscan_t yyscanner );
 	if ( YY_CURRENT_BUFFER_LVALUE->yy_is_interactive ) \
 		{ \
 		int c = '*'; \
-		size_t n; \
+		int n; \
 		for ( n = 0; n < max_size && \
 			     (c = getc( yyin )) != EOF && c != '\n'; ++n ) \
 			buf[n] = (char) c; \
@@ -692,7 +918,7 @@ static int input (yyscan_t yyscanner );
 	else \
 		{ \
 		errno=0; \
-		while ( (result = (int) fread(buf, 1, max_size, yyin))==0 && ferror(yyin)) \
+		while ( (result = (int) fread(buf, 1, (yy_size_t) max_size, yyin)) == 0 && ferror(yyin)) \
 			{ \
 			if( errno != EINTR) \
 				{ \
@@ -733,10 +959,10 @@ static int input (yyscan_t yyscanner );
 #ifndef YY_DECL
 #define YY_DECL_IS_OURS 1
 
-extern int xlu__cfg_yylex \
-               (YYSTYPE * yylval_param,YYLTYPE * yylloc_param ,yyscan_t yyscanner);
+extern int yylex \
+               (YYSTYPE * yylval_param, YYLTYPE * yylloc_param , yyscan_t yyscanner);
 
-#define YY_DECL int xlu__cfg_yylex \
+#define YY_DECL int yylex \
                (YYSTYPE * yylval_param, YYLTYPE * yylloc_param , yyscan_t yyscanner)
 #endif /* !YY_DECL */
 
@@ -786,26 +1012,26 @@ YY_DECL
 			yyout = stdout;
 
 		if ( ! YY_CURRENT_BUFFER ) {
-			xlu__cfg_yyensure_buffer_stack (yyscanner);
+			yyensure_buffer_stack (yyscanner);
 			YY_CURRENT_BUFFER_LVALUE =
-				xlu__cfg_yy_create_buffer(yyin,YY_BUF_SIZE ,yyscanner);
+				yy_create_buffer( yyin, YY_BUF_SIZE , yyscanner);
 		}
 
-		xlu__cfg_yy_load_buffer_state(yyscanner );
+		yy_load_buffer_state( yyscanner );
 		}
 
 	{
 #line 53 "libxlu_cfg_l.l"
 
 
-#line 802 "libxlu_cfg_l.c"
+#line 1028 "libxlu_cfg_l.c"
 
 	while ( /*CONSTCOND*/1 )		/* loops until end-of-file is reached */
 		{
 		yyg->yy_more_len = 0;
 		if ( yyg->yy_more_flag )
 			{
-			yyg->yy_more_len = yyg->yy_c_buf_p - yyg->yytext_ptr;
+			yyg->yy_more_len = (int) (yyg->yy_c_buf_p - yyg->yytext_ptr);
 			yyg->yy_more_flag = 0;
 			}
 		yy_cp = yyg->yy_c_buf_p;
@@ -832,9 +1058,9 @@ yy_match:
 				{
 				yy_current_state = (int) yy_def[yy_current_state];
 				if ( yy_current_state >= 37 )
-					yy_c = yy_meta[(unsigned int) yy_c];
+					yy_c = yy_meta[yy_c];
 				}
-			yy_current_state = yy_nxt[yy_base[yy_current_state] + (flex_int16_t) yy_c];
+			yy_current_state = yy_nxt[yy_base[yy_current_state] + yy_c];
 			++yy_cp;
 			}
 		while ( yy_current_state != 36 );
@@ -982,7 +1208,7 @@ YY_RULE_SETUP
 #line 105 "libxlu_cfg_l.l"
 YY_FATAL_ERROR( "flex scanner jammed" );
 	YY_BREAK
-#line 986 "libxlu_cfg_l.c"
+#line 1212 "libxlu_cfg_l.c"
 case YY_STATE_EOF(INITIAL):
 case YY_STATE_EOF(lexerr):
 	yyterminate();
@@ -1001,7 +1227,7 @@ case YY_STATE_EOF(lexerr):
 			/* We're scanning a new file or input source.  It's
 			 * possible that this happened because the user
 			 * just pointed yyin at a new source and called
-			 * xlu__cfg_yylex().  If so, then we have to assure
+			 * yylex().  If so, then we have to assure
 			 * consistency between YY_CURRENT_BUFFER and our
 			 * globals.  Here is the right place to do so, because
 			 * this is the first action (other than possibly a
@@ -1062,7 +1288,7 @@ case YY_STATE_EOF(lexerr):
 				{
 				yyg->yy_did_buffer_switch_on_eof = 0;
 
-				if ( xlu__cfg_yywrap(yyscanner ) )
+				if ( yywrap( yyscanner ) )
 					{
 					/* Note: because we've taken care in
 					 * yy_get_next_buffer() to have set up
@@ -1116,7 +1342,7 @@ case YY_STATE_EOF(lexerr):
 	} /* end of action switch */
 		} /* end of scanning one token */
 	} /* end of user's declarations */
-} /* end of xlu__cfg_yylex */
+} /* end of yylex */
 
 /* yy_get_next_buffer - try to read in a new buffer
  *
@@ -1195,7 +1421,8 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
 
 				b->yy_ch_buf = (char *)
 					/* Include room in for 2 EOB chars. */
-					xlu__cfg_yyrealloc((void *) b->yy_ch_buf,b->yy_buf_size + 2 ,yyscanner );
+					yyrealloc( (void *) b->yy_ch_buf,
+							 (yy_size_t) (b->yy_buf_size + 2) , yyscanner );
 				}
 			else
 				/* Can't grow it, we don't own it. */
@@ -1227,7 +1454,7 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
 		if ( number_to_move == YY_MORE_ADJ )
 			{
 			ret_val = EOB_ACT_END_OF_FILE;
-			xlu__cfg_yyrestart(yyin  ,yyscanner);
+			yyrestart( yyin  , yyscanner);
 			}
 
 		else
@@ -1244,9 +1471,12 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
 	if ((yyg->yy_n_chars + number_to_move) > YY_CURRENT_BUFFER_LVALUE->yy_buf_size) {
 		/* Extend the array by 50%, plus the number we really need. */
 		int new_size = yyg->yy_n_chars + number_to_move + (yyg->yy_n_chars >> 1);
-		YY_CURRENT_BUFFER_LVALUE->yy_ch_buf = (char *) xlu__cfg_yyrealloc((void *) YY_CURRENT_BUFFER_LVALUE->yy_ch_buf,new_size ,yyscanner );
+		YY_CURRENT_BUFFER_LVALUE->yy_ch_buf = (char *) yyrealloc(
+			(void *) YY_CURRENT_BUFFER_LVALUE->yy_ch_buf, (yy_size_t) new_size , yyscanner );
 		if ( ! YY_CURRENT_BUFFER_LVALUE->yy_ch_buf )
 			YY_FATAL_ERROR( "out of dynamic memory in yy_get_next_buffer()" );
+		/* "- 2" to take care of EOB's */
+		YY_CURRENT_BUFFER_LVALUE->yy_buf_size = (int) (new_size - 2);
 	}
 
 	yyg->yy_n_chars += number_to_move;
@@ -1280,9 +1510,9 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
 			{
 			yy_current_state = (int) yy_def[yy_current_state];
 			if ( yy_current_state >= 37 )
-				yy_c = yy_meta[(unsigned int) yy_c];
+				yy_c = yy_meta[yy_c];
 			}
-		yy_current_state = yy_nxt[yy_base[yy_current_state] + (flex_int16_t) yy_c];
+		yy_current_state = yy_nxt[yy_base[yy_current_state] + yy_c];
 		}
 
 	return yy_current_state;
@@ -1309,9 +1539,9 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
 		{
 		yy_current_state = (int) yy_def[yy_current_state];
 		if ( yy_current_state >= 37 )
-			yy_c = yy_meta[(unsigned int) yy_c];
+			yy_c = yy_meta[yy_c];
 		}
-	yy_current_state = yy_nxt[yy_base[yy_current_state] + (flex_int16_t) yy_c];
+	yy_current_state = yy_nxt[yy_base[yy_current_state] + yy_c];
 	yy_is_jam = (yy_current_state == 36);
 
 	(void)yyg;
@@ -1347,7 +1577,7 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
 
 		else
 			{ /* need more input */
-			int offset = yyg->yy_c_buf_p - yyg->yytext_ptr;
+			int offset = (int) (yyg->yy_c_buf_p - yyg->yytext_ptr);
 			++yyg->yy_c_buf_p;
 
 			switch ( yy_get_next_buffer( yyscanner ) )
@@ -1364,13 +1594,13 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
 					 */
 
 					/* Reset buffer status. */
-					xlu__cfg_yyrestart(yyin ,yyscanner);
+					yyrestart( yyin , yyscanner);
 
 					/*FALLTHROUGH*/
 
 				case EOB_ACT_END_OF_FILE:
 					{
-					if ( xlu__cfg_yywrap(yyscanner ) )
+					if ( yywrap( yyscanner ) )
 						return 0;
 
 					if ( ! yyg->yy_did_buffer_switch_on_eof )
@@ -1409,34 +1639,34 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
  * @param yyscanner The scanner object.
  * @note This function does not reset the start condition to @c INITIAL .
  */
-    void xlu__cfg_yyrestart  (FILE * input_file , yyscan_t yyscanner)
+    void yyrestart  (FILE * input_file , yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 
 	if ( ! YY_CURRENT_BUFFER ){
-        xlu__cfg_yyensure_buffer_stack (yyscanner);
+        yyensure_buffer_stack (yyscanner);
 		YY_CURRENT_BUFFER_LVALUE =
-            xlu__cfg_yy_create_buffer(yyin,YY_BUF_SIZE ,yyscanner);
+            yy_create_buffer( yyin, YY_BUF_SIZE , yyscanner);
 	}
 
-	xlu__cfg_yy_init_buffer(YY_CURRENT_BUFFER,input_file ,yyscanner);
-	xlu__cfg_yy_load_buffer_state(yyscanner );
+	yy_init_buffer( YY_CURRENT_BUFFER, input_file , yyscanner);
+	yy_load_buffer_state( yyscanner );
 }
 
 /** Switch to a different input buffer.
  * @param new_buffer The new input buffer.
  * @param yyscanner The scanner object.
  */
-    void xlu__cfg_yy_switch_to_buffer  (YY_BUFFER_STATE  new_buffer , yyscan_t yyscanner)
+    void yy_switch_to_buffer  (YY_BUFFER_STATE  new_buffer , yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 
 	/* TODO. We should be able to replace this entire function body
 	 * with
-	 *		xlu__cfg_yypop_buffer_state();
-	 *		xlu__cfg_yypush_buffer_state(new_buffer);
+	 *		yypop_buffer_state();
+	 *		yypush_buffer_state(new_buffer);
      */
-	xlu__cfg_yyensure_buffer_stack (yyscanner);
+	yyensure_buffer_stack (yyscanner);
 	if ( YY_CURRENT_BUFFER == new_buffer )
 		return;
 
@@ -1449,17 +1679,17 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
 		}
 
 	YY_CURRENT_BUFFER_LVALUE = new_buffer;
-	xlu__cfg_yy_load_buffer_state(yyscanner );
+	yy_load_buffer_state( yyscanner );
 
 	/* We don't actually know whether we did this switch during
-	 * EOF (xlu__cfg_yywrap()) processing, but the only time this flag
-	 * is looked at is after xlu__cfg_yywrap() is called, so it's safe
+	 * EOF (yywrap()) processing, but the only time this flag
+	 * is looked at is after yywrap() is called, so it's safe
 	 * to go ahead and always set it.
 	 */
 	yyg->yy_did_buffer_switch_on_eof = 1;
 }
 
-static void xlu__cfg_yy_load_buffer_state  (yyscan_t yyscanner)
+static void yy_load_buffer_state  (yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 	yyg->yy_n_chars = YY_CURRENT_BUFFER_LVALUE->yy_n_chars;
@@ -1474,35 +1704,35 @@ static void xlu__cfg_yy_load_buffer_state  (yyscan_t yyscanner)
  * @param yyscanner The scanner object.
  * @return the allocated buffer state.
  */
-    YY_BUFFER_STATE xlu__cfg_yy_create_buffer  (FILE * file, int  size , yyscan_t yyscanner)
+    YY_BUFFER_STATE yy_create_buffer  (FILE * file, int  size , yyscan_t yyscanner)
 {
 	YY_BUFFER_STATE b;
     
-	b = (YY_BUFFER_STATE) xlu__cfg_yyalloc(sizeof( struct yy_buffer_state ) ,yyscanner );
+	b = (YY_BUFFER_STATE) yyalloc( sizeof( struct yy_buffer_state ) , yyscanner );
 	if ( ! b )
-		YY_FATAL_ERROR( "out of dynamic memory in xlu__cfg_yy_create_buffer()" );
+		YY_FATAL_ERROR( "out of dynamic memory in yy_create_buffer()" );
 
-	b->yy_buf_size = (yy_size_t)size;
+	b->yy_buf_size = size;
 
 	/* yy_ch_buf has to be 2 characters longer than the size given because
 	 * we need to put in 2 end-of-buffer characters.
 	 */
-	b->yy_ch_buf = (char *) xlu__cfg_yyalloc(b->yy_buf_size + 2 ,yyscanner );
+	b->yy_ch_buf = (char *) yyalloc( (yy_size_t) (b->yy_buf_size + 2) , yyscanner );
 	if ( ! b->yy_ch_buf )
-		YY_FATAL_ERROR( "out of dynamic memory in xlu__cfg_yy_create_buffer()" );
+		YY_FATAL_ERROR( "out of dynamic memory in yy_create_buffer()" );
 
 	b->yy_is_our_buffer = 1;
 
-	xlu__cfg_yy_init_buffer(b,file ,yyscanner);
+	yy_init_buffer( b, file , yyscanner);
 
 	return b;
 }
 
 /** Destroy the buffer.
- * @param b a buffer created with xlu__cfg_yy_create_buffer()
+ * @param b a buffer created with yy_create_buffer()
  * @param yyscanner The scanner object.
  */
-    void xlu__cfg_yy_delete_buffer (YY_BUFFER_STATE  b , yyscan_t yyscanner)
+    void yy_delete_buffer (YY_BUFFER_STATE  b , yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 
@@ -1513,28 +1743,28 @@ static void xlu__cfg_yy_load_buffer_state  (yyscan_t yyscanner)
 		YY_CURRENT_BUFFER_LVALUE = (YY_BUFFER_STATE) 0;
 
 	if ( b->yy_is_our_buffer )
-		xlu__cfg_yyfree((void *) b->yy_ch_buf ,yyscanner );
+		yyfree( (void *) b->yy_ch_buf , yyscanner );
 
-	xlu__cfg_yyfree((void *) b ,yyscanner );
+	yyfree( (void *) b , yyscanner );
 }
 
 /* Initializes or reinitializes a buffer.
  * This function is sometimes called more than once on the same buffer,
- * such as during a xlu__cfg_yyrestart() or at EOF.
+ * such as during a yyrestart() or at EOF.
  */
-    static void xlu__cfg_yy_init_buffer  (YY_BUFFER_STATE  b, FILE * file , yyscan_t yyscanner)
+    static void yy_init_buffer  (YY_BUFFER_STATE  b, FILE * file , yyscan_t yyscanner)
 
 {
 	int oerrno = errno;
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 
-	xlu__cfg_yy_flush_buffer(b ,yyscanner);
+	yy_flush_buffer( b , yyscanner);
 
 	b->yy_input_file = file;
 	b->yy_fill_buffer = 1;
 
-    /* If b is the current buffer, then xlu__cfg_yy_init_buffer was _probably_
-     * called from xlu__cfg_yyrestart() or through yy_get_next_buffer.
+    /* If b is the current buffer, then yy_init_buffer was _probably_
+     * called from yyrestart() or through yy_get_next_buffer.
      * In that case, we don't want to reset the lineno or column.
      */
     if (b != YY_CURRENT_BUFFER){
@@ -1551,7 +1781,7 @@ static void xlu__cfg_yy_load_buffer_state  (yyscan_t yyscanner)
  * @param b the buffer state to be flushed, usually @c YY_CURRENT_BUFFER.
  * @param yyscanner The scanner object.
  */
-    void xlu__cfg_yy_flush_buffer (YY_BUFFER_STATE  b , yyscan_t yyscanner)
+    void yy_flush_buffer (YY_BUFFER_STATE  b , yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 	if ( ! b )
@@ -1572,7 +1802,7 @@ static void xlu__cfg_yy_load_buffer_state  (yyscan_t yyscanner)
 	b->yy_buffer_status = YY_BUFFER_NEW;
 
 	if ( b == YY_CURRENT_BUFFER )
-		xlu__cfg_yy_load_buffer_state(yyscanner );
+		yy_load_buffer_state( yyscanner );
 }
 
 /** Pushes the new state onto the stack. The new state becomes
@@ -1581,15 +1811,15 @@ static void xlu__cfg_yy_load_buffer_state  (yyscan_t yyscanner)
  *  @param new_buffer The new state.
  *  @param yyscanner The scanner object.
  */
-void xlu__cfg_yypush_buffer_state (YY_BUFFER_STATE new_buffer , yyscan_t yyscanner)
+void yypush_buffer_state (YY_BUFFER_STATE new_buffer , yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 	if (new_buffer == NULL)
 		return;
 
-	xlu__cfg_yyensure_buffer_stack(yyscanner);
+	yyensure_buffer_stack(yyscanner);
 
-	/* This block is copied from xlu__cfg_yy_switch_to_buffer. */
+	/* This block is copied from yy_switch_to_buffer. */
 	if ( YY_CURRENT_BUFFER )
 		{
 		/* Flush out information for old buffer. */
@@ -1603,8 +1833,8 @@ void xlu__cfg_yypush_buffer_state (YY_BUFFER_STATE new_buffer , yyscan_t yyscann
 		yyg->yy_buffer_stack_top++;
 	YY_CURRENT_BUFFER_LVALUE = new_buffer;
 
-	/* copied from xlu__cfg_yy_switch_to_buffer. */
-	xlu__cfg_yy_load_buffer_state(yyscanner );
+	/* copied from yy_switch_to_buffer. */
+	yy_load_buffer_state( yyscanner );
 	yyg->yy_did_buffer_switch_on_eof = 1;
 }
 
@@ -1612,19 +1842,19 @@ void xlu__cfg_yypush_buffer_state (YY_BUFFER_STATE new_buffer , yyscan_t yyscann
  *  The next element becomes the new top.
  *  @param yyscanner The scanner object.
  */
-void xlu__cfg_yypop_buffer_state (yyscan_t yyscanner)
+void yypop_buffer_state (yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 	if (!YY_CURRENT_BUFFER)
 		return;
 
-	xlu__cfg_yy_delete_buffer(YY_CURRENT_BUFFER ,yyscanner);
+	yy_delete_buffer(YY_CURRENT_BUFFER , yyscanner);
 	YY_CURRENT_BUFFER_LVALUE = NULL;
 	if (yyg->yy_buffer_stack_top > 0)
 		--yyg->yy_buffer_stack_top;
 
 	if (YY_CURRENT_BUFFER) {
-		xlu__cfg_yy_load_buffer_state(yyscanner );
+		yy_load_buffer_state( yyscanner );
 		yyg->yy_did_buffer_switch_on_eof = 1;
 	}
 }
@@ -1632,9 +1862,9 @@ void xlu__cfg_yypop_buffer_state (yyscan_t yyscanner)
 /* Allocates the stack if it does not exist.
  *  Guarantees space for at least one push.
  */
-static void xlu__cfg_yyensure_buffer_stack (yyscan_t yyscanner)
+static void yyensure_buffer_stack (yyscan_t yyscanner)
 {
-	int num_to_alloc;
+	yy_size_t num_to_alloc;
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 
 	if (!yyg->yy_buffer_stack) {
@@ -1644,11 +1874,11 @@ static void xlu__cfg_yyensure_buffer_stack (yyscan_t yyscanner)
 		 * immediate realloc on the next call.
          */
       num_to_alloc = 1; /* After all that talk, this was set to 1 anyways... */
-		yyg->yy_buffer_stack = (struct yy_buffer_state**)xlu__cfg_yyalloc
+		yyg->yy_buffer_stack = (struct yy_buffer_state**)yyalloc
 								(num_to_alloc * sizeof(struct yy_buffer_state*)
 								, yyscanner);
 		if ( ! yyg->yy_buffer_stack )
-			YY_FATAL_ERROR( "out of dynamic memory in xlu__cfg_yyensure_buffer_stack()" );
+			YY_FATAL_ERROR( "out of dynamic memory in yyensure_buffer_stack()" );
 
 		memset(yyg->yy_buffer_stack, 0, num_to_alloc * sizeof(struct yy_buffer_state*));
 
@@ -1663,12 +1893,12 @@ static void xlu__cfg_yyensure_buffer_stack (yyscan_t yyscanner)
 		yy_size_t grow_size = 8 /* arbitrary grow size */;
 
 		num_to_alloc = yyg->yy_buffer_stack_max + grow_size;
-		yyg->yy_buffer_stack = (struct yy_buffer_state**)xlu__cfg_yyrealloc
+		yyg->yy_buffer_stack = (struct yy_buffer_state**)yyrealloc
 								(yyg->yy_buffer_stack,
 								num_to_alloc * sizeof(struct yy_buffer_state*)
 								, yyscanner);
 		if ( ! yyg->yy_buffer_stack )
-			YY_FATAL_ERROR( "out of dynamic memory in xlu__cfg_yyensure_buffer_stack()" );
+			YY_FATAL_ERROR( "out of dynamic memory in yyensure_buffer_stack()" );
 
 		/* zero only the new slots.*/
 		memset(yyg->yy_buffer_stack + yyg->yy_buffer_stack_max, 0, grow_size * sizeof(struct yy_buffer_state*));
@@ -1682,7 +1912,7 @@ static void xlu__cfg_yyensure_buffer_stack (yyscan_t yyscanner)
  * @param yyscanner The scanner object.
  * @return the newly allocated buffer state object.
  */
-YY_BUFFER_STATE xlu__cfg_yy_scan_buffer  (char * base, yy_size_t  size , yyscan_t yyscanner)
+YY_BUFFER_STATE yy_scan_buffer  (char * base, yy_size_t  size , yyscan_t yyscanner)
 {
 	YY_BUFFER_STATE b;
     
@@ -1692,11 +1922,11 @@ YY_BUFFER_STATE xlu__cfg_yy_scan_buffer  (char * base, yy_size_t  size , yyscan_
 		/* They forgot to leave room for the EOB's. */
 		return NULL;
 
-	b = (YY_BUFFER_STATE) xlu__cfg_yyalloc(sizeof( struct yy_buffer_state ) ,yyscanner );
+	b = (YY_BUFFER_STATE) yyalloc( sizeof( struct yy_buffer_state ) , yyscanner );
 	if ( ! b )
-		YY_FATAL_ERROR( "out of dynamic memory in xlu__cfg_yy_scan_buffer()" );
+		YY_FATAL_ERROR( "out of dynamic memory in yy_scan_buffer()" );
 
-	b->yy_buf_size = size - 2;	/* "- 2" to take care of EOB's */
+	b->yy_buf_size = (int) (size - 2);	/* "- 2" to take care of EOB's */
 	b->yy_buf_pos = b->yy_ch_buf = base;
 	b->yy_is_our_buffer = 0;
 	b->yy_input_file = NULL;
@@ -1706,33 +1936,33 @@ YY_BUFFER_STATE xlu__cfg_yy_scan_buffer  (char * base, yy_size_t  size , yyscan_
 	b->yy_fill_buffer = 0;
 	b->yy_buffer_status = YY_BUFFER_NEW;
 
-	xlu__cfg_yy_switch_to_buffer(b ,yyscanner );
+	yy_switch_to_buffer( b , yyscanner );
 
 	return b;
 }
 
-/** Setup the input buffer state to scan a string. The next call to xlu__cfg_yylex() will
+/** Setup the input buffer state to scan a string. The next call to yylex() will
  * scan from a @e copy of @a str.
  * @param yystr a NUL-terminated string to scan
  * @param yyscanner The scanner object.
  * @return the newly allocated buffer state object.
  * @note If you want to scan bytes that may contain NUL values, then use
- *       xlu__cfg_yy_scan_bytes() instead.
+ *       yy_scan_bytes() instead.
  */
-YY_BUFFER_STATE xlu__cfg_yy_scan_string (yyconst char * yystr , yyscan_t yyscanner)
+YY_BUFFER_STATE yy_scan_string (const char * yystr , yyscan_t yyscanner)
 {
     
-	return xlu__cfg_yy_scan_bytes(yystr,(int) strlen(yystr) ,yyscanner);
+	return yy_scan_bytes( yystr, (int) strlen(yystr) , yyscanner);
 }
 
-/** Setup the input buffer state to scan the given bytes. The next call to xlu__cfg_yylex() will
+/** Setup the input buffer state to scan the given bytes. The next call to yylex() will
  * scan from a @e copy of @a bytes.
  * @param yybytes the byte buffer to scan
  * @param _yybytes_len the number of bytes in the buffer pointed to by @a bytes.
  * @param yyscanner The scanner object.
  * @return the newly allocated buffer state object.
  */
-YY_BUFFER_STATE xlu__cfg_yy_scan_bytes  (yyconst char * yybytes, int  _yybytes_len , yyscan_t yyscanner)
+YY_BUFFER_STATE yy_scan_bytes  (const char * yybytes, int  _yybytes_len , yyscan_t yyscanner)
 {
 	YY_BUFFER_STATE b;
 	char *buf;
@@ -1741,18 +1971,18 @@ YY_BUFFER_STATE xlu__cfg_yy_scan_bytes  (yyconst char * yybytes, int  _yybytes_l
     
 	/* Get memory for full buffer, including space for trailing EOB's. */
 	n = (yy_size_t) (_yybytes_len + 2);
-	buf = (char *) xlu__cfg_yyalloc(n ,yyscanner );
+	buf = (char *) yyalloc( n , yyscanner );
 	if ( ! buf )
-		YY_FATAL_ERROR( "out of dynamic memory in xlu__cfg_yy_scan_bytes()" );
+		YY_FATAL_ERROR( "out of dynamic memory in yy_scan_bytes()" );
 
 	for ( i = 0; i < _yybytes_len; ++i )
 		buf[i] = yybytes[i];
 
 	buf[_yybytes_len] = buf[_yybytes_len+1] = YY_END_OF_BUFFER_CHAR;
 
-	b = xlu__cfg_yy_scan_buffer(buf,n ,yyscanner);
+	b = yy_scan_buffer( buf, n , yyscanner);
 	if ( ! b )
-		YY_FATAL_ERROR( "bad buffer in xlu__cfg_yy_scan_bytes()" );
+		YY_FATAL_ERROR( "bad buffer in yy_scan_bytes()" );
 
 	/* It's okay to grow etc. this buffer, and we should throw it
 	 * away when we're done.
@@ -1766,11 +1996,11 @@ YY_BUFFER_STATE xlu__cfg_yy_scan_bytes  (yyconst char * yybytes, int  _yybytes_l
 #define YY_EXIT_FAILURE 2
 #endif
 
-static void yynoreturn yy_fatal_error (yyconst char* msg , yyscan_t yyscanner)
+static void yynoreturn yy_fatal_error (const char* msg , yyscan_t yyscanner)
 {
 	struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 	(void)yyg;
-	(void) fprintf( stderr, "%s\n", msg );
+	fprintf( stderr, "%s\n", msg );
 	exit( YY_EXIT_FAILURE );
 }
 
@@ -1796,7 +2026,7 @@ static void yynoreturn yy_fatal_error (yyconst char* msg , yyscan_t yyscanner)
 /** Get the user-defined data for this scanner.
  * @param yyscanner The scanner object.
  */
-YY_EXTRA_TYPE xlu__cfg_yyget_extra  (yyscan_t yyscanner)
+YY_EXTRA_TYPE yyget_extra  (yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
     return yyextra;
@@ -1805,7 +2035,7 @@ YY_EXTRA_TYPE xlu__cfg_yyget_extra  (yyscan_t yyscanner)
 /** Get the current line number.
  * @param yyscanner The scanner object.
  */
-int xlu__cfg_yyget_lineno  (yyscan_t yyscanner)
+int yyget_lineno  (yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 
@@ -1818,7 +2048,7 @@ int xlu__cfg_yyget_lineno  (yyscan_t yyscanner)
 /** Get the current column number.
  * @param yyscanner The scanner object.
  */
-int xlu__cfg_yyget_column  (yyscan_t yyscanner)
+int yyget_column  (yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 
@@ -1831,7 +2061,7 @@ int xlu__cfg_yyget_column  (yyscan_t yyscanner)
 /** Get the input stream.
  * @param yyscanner The scanner object.
  */
-FILE *xlu__cfg_yyget_in  (yyscan_t yyscanner)
+FILE *yyget_in  (yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
     return yyin;
@@ -1840,7 +2070,7 @@ FILE *xlu__cfg_yyget_in  (yyscan_t yyscanner)
 /** Get the output stream.
  * @param yyscanner The scanner object.
  */
-FILE *xlu__cfg_yyget_out  (yyscan_t yyscanner)
+FILE *yyget_out  (yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
     return yyout;
@@ -1849,7 +2079,7 @@ FILE *xlu__cfg_yyget_out  (yyscan_t yyscanner)
 /** Get the length of the current token.
  * @param yyscanner The scanner object.
  */
-int xlu__cfg_yyget_leng  (yyscan_t yyscanner)
+int yyget_leng  (yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
     return yyleng;
@@ -1859,7 +2089,7 @@ int xlu__cfg_yyget_leng  (yyscan_t yyscanner)
  * @param yyscanner The scanner object.
  */
 
-char *xlu__cfg_yyget_text  (yyscan_t yyscanner)
+char *yyget_text  (yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
     return yytext;
@@ -1869,7 +2099,7 @@ char *xlu__cfg_yyget_text  (yyscan_t yyscanner)
  * @param user_defined The data to be associated with this scanner.
  * @param yyscanner The scanner object.
  */
-void xlu__cfg_yyset_extra (YY_EXTRA_TYPE  user_defined , yyscan_t yyscanner)
+void yyset_extra (YY_EXTRA_TYPE  user_defined , yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
     yyextra = user_defined ;
@@ -1879,13 +2109,13 @@ void xlu__cfg_yyset_extra (YY_EXTRA_TYPE  user_defined , yyscan_t yyscanner)
  * @param _line_number line number
  * @param yyscanner The scanner object.
  */
-void xlu__cfg_yyset_lineno (int  _line_number , yyscan_t yyscanner)
+void yyset_lineno (int  _line_number , yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 
         /* lineno is only valid if an input buffer exists. */
         if (! YY_CURRENT_BUFFER )
-           YY_FATAL_ERROR( "xlu__cfg_yyset_lineno called with no buffer" );
+           YY_FATAL_ERROR( "yyset_lineno called with no buffer" );
     
     yylineno = _line_number;
 }
@@ -1894,13 +2124,13 @@ void xlu__cfg_yyset_lineno (int  _line_number , yyscan_t yyscanner)
  * @param _column_no column number
  * @param yyscanner The scanner object.
  */
-void xlu__cfg_yyset_column (int  _column_no , yyscan_t yyscanner)
+void yyset_column (int  _column_no , yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 
         /* column is only valid if an input buffer exists. */
         if (! YY_CURRENT_BUFFER )
-           YY_FATAL_ERROR( "xlu__cfg_yyset_column called with no buffer" );
+           YY_FATAL_ERROR( "yyset_column called with no buffer" );
     
     yycolumn = _column_no;
 }
@@ -1909,27 +2139,27 @@ void xlu__cfg_yyset_column (int  _column_no , yyscan_t yyscanner)
  * input buffer.
  * @param _in_str A readable stream.
  * @param yyscanner The scanner object.
- * @see xlu__cfg_yy_switch_to_buffer
+ * @see yy_switch_to_buffer
  */
-void xlu__cfg_yyset_in (FILE *  _in_str , yyscan_t yyscanner)
+void yyset_in (FILE *  _in_str , yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
     yyin = _in_str ;
 }
 
-void xlu__cfg_yyset_out (FILE *  _out_str , yyscan_t yyscanner)
+void yyset_out (FILE *  _out_str , yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
     yyout = _out_str ;
 }
 
-int xlu__cfg_yyget_debug  (yyscan_t yyscanner)
+int yyget_debug  (yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
     return yy_flex_debug;
 }
 
-void xlu__cfg_yyset_debug (int  _bdebug , yyscan_t yyscanner)
+void yyset_debug (int  _bdebug , yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
     yy_flex_debug = _bdebug ;
@@ -1937,25 +2167,25 @@ void xlu__cfg_yyset_debug (int  _bdebug , yyscan_t yyscanner)
 
 /* Accessor methods for yylval and yylloc */
 
-YYSTYPE * xlu__cfg_yyget_lval  (yyscan_t yyscanner)
+YYSTYPE * yyget_lval  (yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
     return yylval;
 }
 
-void xlu__cfg_yyset_lval (YYSTYPE *  yylval_param , yyscan_t yyscanner)
+void yyset_lval (YYSTYPE *  yylval_param , yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
     yylval = yylval_param;
 }
 
-YYLTYPE *xlu__cfg_yyget_lloc  (yyscan_t yyscanner)
+YYLTYPE *yyget_lloc  (yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
     return yylloc;
 }
     
-void xlu__cfg_yyset_lloc (YYLTYPE *  yylloc_param , yyscan_t yyscanner)
+void yyset_lloc (YYLTYPE *  yylloc_param , yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
     yylloc = yylloc_param;
@@ -1963,20 +2193,18 @@ void xlu__cfg_yyset_lloc (YYLTYPE *  yylloc_param , yyscan_t yyscanner)
     
 /* User-visible API */
 
-/* xlu__cfg_yylex_init is special because it creates the scanner itself, so it is
+/* yylex_init is special because it creates the scanner itself, so it is
  * the ONLY reentrant function that doesn't take the scanner as the last argument.
  * That's why we explicitly handle the declaration, instead of using our macros.
  */
-
-int xlu__cfg_yylex_init(yyscan_t* ptr_yy_globals)
-
+int yylex_init(yyscan_t* ptr_yy_globals)
 {
     if (ptr_yy_globals == NULL){
         errno = EINVAL;
         return 1;
     }
 
-    *ptr_yy_globals = (yyscan_t) xlu__cfg_yyalloc ( sizeof( struct yyguts_t ), NULL );
+    *ptr_yy_globals = (yyscan_t) yyalloc ( sizeof( struct yyguts_t ), NULL );
 
     if (*ptr_yy_globals == NULL){
         errno = ENOMEM;
@@ -1989,27 +2217,25 @@ int xlu__cfg_yylex_init(yyscan_t* ptr_yy_globals)
     return yy_init_globals ( *ptr_yy_globals );
 }
 
-/* xlu__cfg_yylex_init_extra has the same functionality as xlu__cfg_yylex_init, but follows the
+/* yylex_init_extra has the same functionality as yylex_init, but follows the
  * convention of taking the scanner as the last argument. Note however, that
  * this is a *pointer* to a scanner, as it will be allocated by this call (and
  * is the reason, too, why this function also must handle its own declaration).
- * The user defined value in the first argument will be available to xlu__cfg_yyalloc in
+ * The user defined value in the first argument will be available to yyalloc in
  * the yyextra field.
  */
-
-int xlu__cfg_yylex_init_extra(YY_EXTRA_TYPE yy_user_defined,yyscan_t* ptr_yy_globals )
-
+int yylex_init_extra( YY_EXTRA_TYPE yy_user_defined, yyscan_t* ptr_yy_globals )
 {
     struct yyguts_t dummy_yyguts;
 
-    xlu__cfg_yyset_extra (yy_user_defined, &dummy_yyguts);
+    yyset_extra (yy_user_defined, &dummy_yyguts);
 
     if (ptr_yy_globals == NULL){
         errno = EINVAL;
         return 1;
     }
 
-    *ptr_yy_globals = (yyscan_t) xlu__cfg_yyalloc ( sizeof( struct yyguts_t ), &dummy_yyguts );
+    *ptr_yy_globals = (yyscan_t) yyalloc ( sizeof( struct yyguts_t ), &dummy_yyguts );
 
     if (*ptr_yy_globals == NULL){
         errno = ENOMEM;
@@ -2020,7 +2246,7 @@ int xlu__cfg_yylex_init_extra(YY_EXTRA_TYPE yy_user_defined,yyscan_t* ptr_yy_glo
     yy_init_globals. Leave at 0x00 for releases. */
     memset(*ptr_yy_globals,0x00,sizeof(struct yyguts_t));
 
-    xlu__cfg_yyset_extra (yy_user_defined, *ptr_yy_globals);
+    yyset_extra (yy_user_defined, *ptr_yy_globals);
 
     return yy_init_globals ( *ptr_yy_globals );
 }
@@ -2029,7 +2255,7 @@ static int yy_init_globals (yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
     /* Initialization is the same as for the non-reentrant scanner.
-     * This function is called from xlu__cfg_yylex_destroy(), so don't allocate here.
+     * This function is called from yylex_destroy(), so don't allocate here.
      */
 
     yyg->yy_buffer_stack = NULL;
@@ -2053,37 +2279,37 @@ static int yy_init_globals (yyscan_t yyscanner)
 #endif
 
     /* For future reference: Set errno on error, since we are called by
-     * xlu__cfg_yylex_init()
+     * yylex_init()
      */
     return 0;
 }
 
-/* xlu__cfg_yylex_destroy is for both reentrant and non-reentrant scanners. */
-int xlu__cfg_yylex_destroy  (yyscan_t yyscanner)
+/* yylex_destroy is for both reentrant and non-reentrant scanners. */
+int yylex_destroy  (yyscan_t yyscanner)
 {
     struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 
     /* Pop the buffer stack, destroying each element. */
 	while(YY_CURRENT_BUFFER){
-		xlu__cfg_yy_delete_buffer(YY_CURRENT_BUFFER ,yyscanner );
+		yy_delete_buffer( YY_CURRENT_BUFFER , yyscanner );
 		YY_CURRENT_BUFFER_LVALUE = NULL;
-		xlu__cfg_yypop_buffer_state(yyscanner);
+		yypop_buffer_state(yyscanner);
 	}
 
 	/* Destroy the stack itself. */
-	xlu__cfg_yyfree(yyg->yy_buffer_stack ,yyscanner);
+	yyfree(yyg->yy_buffer_stack , yyscanner);
 	yyg->yy_buffer_stack = NULL;
 
     /* Destroy the start condition stack. */
-        xlu__cfg_yyfree(yyg->yy_start_stack ,yyscanner );
+        yyfree( yyg->yy_start_stack , yyscanner );
         yyg->yy_start_stack = NULL;
 
     /* Reset the globals. This is important in a non-reentrant scanner so the next time
-     * xlu__cfg_yylex() is called, initialization will occur. */
+     * yylex() is called, initialization will occur. */
     yy_init_globals( yyscanner);
 
     /* Destroy the main struct (reentrant only). */
-    xlu__cfg_yyfree ( yyscanner , yyscanner );
+    yyfree ( yyscanner , yyscanner );
     yyscanner = NULL;
     return 0;
 }
@@ -2093,7 +2319,7 @@ int xlu__cfg_yylex_destroy  (yyscan_t yyscanner)
  */
 
 #ifndef yytext_ptr
-static void yy_flex_strncpy (char* s1, yyconst char * s2, int n , yyscan_t yyscanner)
+static void yy_flex_strncpy (char* s1, const char * s2, int n , yyscan_t yyscanner)
 {
 	struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 	(void)yyg;
@@ -2105,7 +2331,7 @@ static void yy_flex_strncpy (char* s1, yyconst char * s2, int n , yyscan_t yysca
 #endif
 
 #ifdef YY_NEED_STRLEN
-static int yy_flex_strlen (yyconst char * s , yyscan_t yyscanner)
+static int yy_flex_strlen (const char * s , yyscan_t yyscanner)
 {
 	int n;
 	for ( n = 0; s[n]; ++n )
@@ -2115,14 +2341,14 @@ static int yy_flex_strlen (yyconst char * s , yyscan_t yyscanner)
 }
 #endif
 
-void *xlu__cfg_yyalloc (yy_size_t  size , yyscan_t yyscanner)
+void *yyalloc (yy_size_t  size , yyscan_t yyscanner)
 {
 	struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 	(void)yyg;
 	return malloc(size);
 }
 
-void *xlu__cfg_yyrealloc  (void * ptr, yy_size_t  size , yyscan_t yyscanner)
+void *yyrealloc  (void * ptr, yy_size_t  size , yyscan_t yyscanner)
 {
 	struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 	(void)yyg;
@@ -2137,11 +2363,11 @@ void *xlu__cfg_yyrealloc  (void * ptr, yy_size_t  size , yyscan_t yyscanner)
 	return realloc(ptr, size);
 }
 
-void xlu__cfg_yyfree (void * ptr , yyscan_t yyscanner)
+void yyfree (void * ptr , yyscan_t yyscanner)
 {
 	struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
 	(void)yyg;
-	free( (char *) ptr );	/* see xlu__cfg_yyrealloc() for (char *) cast */
+	free( (char *) ptr );	/* see yyrealloc() for (char *) cast */
 }
 
 #define YYTABLES_NAME "yytables"
diff --git a/tools/libxl/libxlu_cfg_l.h b/tools/libxl/libxlu_cfg_l.h
index 415c3ce089..213ba18b86 100644
--- a/tools/libxl/libxlu_cfg_l.h
+++ b/tools/libxl/libxlu_cfg_l.h
@@ -13,11 +13,245 @@
 #define FLEX_SCANNER
 #define YY_FLEX_MAJOR_VERSION 2
 #define YY_FLEX_MINOR_VERSION 6
-#define YY_FLEX_SUBMINOR_VERSION 1
+#define YY_FLEX_SUBMINOR_VERSION 4
 #if YY_FLEX_SUBMINOR_VERSION > 0
 #define FLEX_BETA
 #endif
 
+#ifdef yy_create_buffer
+#define xlu__cfg_yy_create_buffer_ALREADY_DEFINED
+#else
+#define yy_create_buffer xlu__cfg_yy_create_buffer
+#endif
+
+#ifdef yy_delete_buffer
+#define xlu__cfg_yy_delete_buffer_ALREADY_DEFINED
+#else
+#define yy_delete_buffer xlu__cfg_yy_delete_buffer
+#endif
+
+#ifdef yy_scan_buffer
+#define xlu__cfg_yy_scan_buffer_ALREADY_DEFINED
+#else
+#define yy_scan_buffer xlu__cfg_yy_scan_buffer
+#endif
+
+#ifdef yy_scan_string
+#define xlu__cfg_yy_scan_string_ALREADY_DEFINED
+#else
+#define yy_scan_string xlu__cfg_yy_scan_string
+#endif
+
+#ifdef yy_scan_bytes
+#define xlu__cfg_yy_scan_bytes_ALREADY_DEFINED
+#else
+#define yy_scan_bytes xlu__cfg_yy_scan_bytes
+#endif
+
+#ifdef yy_init_buffer
+#define xlu__cfg_yy_init_buffer_ALREADY_DEFINED
+#else
+#define yy_init_buffer xlu__cfg_yy_init_buffer
+#endif
+
+#ifdef yy_flush_buffer
+#define xlu__cfg_yy_flush_buffer_ALREADY_DEFINED
+#else
+#define yy_flush_buffer xlu__cfg_yy_flush_buffer
+#endif
+
+#ifdef yy_load_buffer_state
+#define xlu__cfg_yy_load_buffer_state_ALREADY_DEFINED
+#else
+#define yy_load_buffer_state xlu__cfg_yy_load_buffer_state
+#endif
+
+#ifdef yy_switch_to_buffer
+#define xlu__cfg_yy_switch_to_buffer_ALREADY_DEFINED
+#else
+#define yy_switch_to_buffer xlu__cfg_yy_switch_to_buffer
+#endif
+
+#ifdef yypush_buffer_state
+#define xlu__cfg_yypush_buffer_state_ALREADY_DEFINED
+#else
+#define yypush_buffer_state xlu__cfg_yypush_buffer_state
+#endif
+
+#ifdef yypop_buffer_state
+#define xlu__cfg_yypop_buffer_state_ALREADY_DEFINED
+#else
+#define yypop_buffer_state xlu__cfg_yypop_buffer_state
+#endif
+
+#ifdef yyensure_buffer_stack
+#define xlu__cfg_yyensure_buffer_stack_ALREADY_DEFINED
+#else
+#define yyensure_buffer_stack xlu__cfg_yyensure_buffer_stack
+#endif
+
+#ifdef yylex
+#define xlu__cfg_yylex_ALREADY_DEFINED
+#else
+#define yylex xlu__cfg_yylex
+#endif
+
+#ifdef yyrestart
+#define xlu__cfg_yyrestart_ALREADY_DEFINED
+#else
+#define yyrestart xlu__cfg_yyrestart
+#endif
+
+#ifdef yylex_init
+#define xlu__cfg_yylex_init_ALREADY_DEFINED
+#else
+#define yylex_init xlu__cfg_yylex_init
+#endif
+
+#ifdef yylex_init_extra
+#define xlu__cfg_yylex_init_extra_ALREADY_DEFINED
+#else
+#define yylex_init_extra xlu__cfg_yylex_init_extra
+#endif
+
+#ifdef yylex_destroy
+#define xlu__cfg_yylex_destroy_ALREADY_DEFINED
+#else
+#define yylex_destroy xlu__cfg_yylex_destroy
+#endif
+
+#ifdef yyget_debug
+#define xlu__cfg_yyget_debug_ALREADY_DEFINED
+#else
+#define yyget_debug xlu__cfg_yyget_debug
+#endif
+
+#ifdef yyset_debug
+#define xlu__cfg_yyset_debug_ALREADY_DEFINED
+#else
+#define yyset_debug xlu__cfg_yyset_debug
+#endif
+
+#ifdef yyget_extra
+#define xlu__cfg_yyget_extra_ALREADY_DEFINED
+#else
+#define yyget_extra xlu__cfg_yyget_extra
+#endif
+
+#ifdef yyset_extra
+#define xlu__cfg_yyset_extra_ALREADY_DEFINED
+#else
+#define yyset_extra xlu__cfg_yyset_extra
+#endif
+
+#ifdef yyget_in
+#define xlu__cfg_yyget_in_ALREADY_DEFINED
+#else
+#define yyget_in xlu__cfg_yyget_in
+#endif
+
+#ifdef yyset_in
+#define xlu__cfg_yyset_in_ALREADY_DEFINED
+#else
+#define yyset_in xlu__cfg_yyset_in
+#endif
+
+#ifdef yyget_out
+#define xlu__cfg_yyget_out_ALREADY_DEFINED
+#else
+#define yyget_out xlu__cfg_yyget_out
+#endif
+
+#ifdef yyset_out
+#define xlu__cfg_yyset_out_ALREADY_DEFINED
+#else
+#define yyset_out xlu__cfg_yyset_out
+#endif
+
+#ifdef yyget_leng
+#define xlu__cfg_yyget_leng_ALREADY_DEFINED
+#else
+#define yyget_leng xlu__cfg_yyget_leng
+#endif
+
+#ifdef yyget_text
+#define xlu__cfg_yyget_text_ALREADY_DEFINED
+#else
+#define yyget_text xlu__cfg_yyget_text
+#endif
+
+#ifdef yyget_lineno
+#define xlu__cfg_yyget_lineno_ALREADY_DEFINED
+#else
+#define yyget_lineno xlu__cfg_yyget_lineno
+#endif
+
+#ifdef yyset_lineno
+#define xlu__cfg_yyset_lineno_ALREADY_DEFINED
+#else
+#define yyset_lineno xlu__cfg_yyset_lineno
+#endif
+
+#ifdef yyget_column
+#define xlu__cfg_yyget_column_ALREADY_DEFINED
+#else
+#define yyget_column xlu__cfg_yyget_column
+#endif
+
+#ifdef yyset_column
+#define xlu__cfg_yyset_column_ALREADY_DEFINED
+#else
+#define yyset_column xlu__cfg_yyset_column
+#endif
+
+#ifdef yywrap
+#define xlu__cfg_yywrap_ALREADY_DEFINED
+#else
+#define yywrap xlu__cfg_yywrap
+#endif
+
+#ifdef yyget_lval
+#define xlu__cfg_yyget_lval_ALREADY_DEFINED
+#else
+#define yyget_lval xlu__cfg_yyget_lval
+#endif
+
+#ifdef yyset_lval
+#define xlu__cfg_yyset_lval_ALREADY_DEFINED
+#else
+#define yyset_lval xlu__cfg_yyset_lval
+#endif
+
+#ifdef yyget_lloc
+#define xlu__cfg_yyget_lloc_ALREADY_DEFINED
+#else
+#define yyget_lloc xlu__cfg_yyget_lloc
+#endif
+
+#ifdef yyset_lloc
+#define xlu__cfg_yyset_lloc_ALREADY_DEFINED
+#else
+#define yyset_lloc xlu__cfg_yyset_lloc
+#endif
+
+#ifdef yyalloc
+#define xlu__cfg_yyalloc_ALREADY_DEFINED
+#else
+#define yyalloc xlu__cfg_yyalloc
+#endif
+
+#ifdef yyrealloc
+#define xlu__cfg_yyrealloc_ALREADY_DEFINED
+#else
+#define yyrealloc xlu__cfg_yyrealloc
+#endif
+
+#ifdef yyfree
+#define xlu__cfg_yyfree_ALREADY_DEFINED
+#else
+#define yyfree xlu__cfg_yyfree
+#endif
+
 /* First, we deal with  platform-specific or compiler-specific issues. */
 
 /* begin standard C headers. */
@@ -88,10 +322,16 @@ typedef unsigned int flex_uint32_t;
 #define UINT32_MAX             (4294967295U)
 #endif
 
+#ifndef SIZE_MAX
+#define SIZE_MAX               (~(size_t)0)
+#endif
+
 #endif /* ! C99 */
 
 #endif /* ! FLEXINT_H */
 
+/* begin standard C++ headers. */
+
 /* TODO: this is always defined, so inline it */
 #define yyconst const
 
@@ -192,21 +432,21 @@ struct yy_buffer_state
 	};
 #endif /* !YY_STRUCT_YY_BUFFER_STATE */
 
-void xlu__cfg_yyrestart (FILE *input_file ,yyscan_t yyscanner );
-void xlu__cfg_yy_switch_to_buffer (YY_BUFFER_STATE new_buffer ,yyscan_t yyscanner );
-YY_BUFFER_STATE xlu__cfg_yy_create_buffer (FILE *file,int size ,yyscan_t yyscanner );
-void xlu__cfg_yy_delete_buffer (YY_BUFFER_STATE b ,yyscan_t yyscanner );
-void xlu__cfg_yy_flush_buffer (YY_BUFFER_STATE b ,yyscan_t yyscanner );
-void xlu__cfg_yypush_buffer_state (YY_BUFFER_STATE new_buffer ,yyscan_t yyscanner );
-void xlu__cfg_yypop_buffer_state (yyscan_t yyscanner );
+void yyrestart ( FILE *input_file , yyscan_t yyscanner );
+void yy_switch_to_buffer ( YY_BUFFER_STATE new_buffer , yyscan_t yyscanner );
+YY_BUFFER_STATE yy_create_buffer ( FILE *file, int size , yyscan_t yyscanner );
+void yy_delete_buffer ( YY_BUFFER_STATE b , yyscan_t yyscanner );
+void yy_flush_buffer ( YY_BUFFER_STATE b , yyscan_t yyscanner );
+void yypush_buffer_state ( YY_BUFFER_STATE new_buffer , yyscan_t yyscanner );
+void yypop_buffer_state ( yyscan_t yyscanner );
 
-YY_BUFFER_STATE xlu__cfg_yy_scan_buffer (char *base,yy_size_t size ,yyscan_t yyscanner );
-YY_BUFFER_STATE xlu__cfg_yy_scan_string (yyconst char *yy_str ,yyscan_t yyscanner );
-YY_BUFFER_STATE xlu__cfg_yy_scan_bytes (yyconst char *bytes,int len ,yyscan_t yyscanner );
+YY_BUFFER_STATE yy_scan_buffer ( char *base, yy_size_t size , yyscan_t yyscanner );
+YY_BUFFER_STATE yy_scan_string ( const char *yy_str , yyscan_t yyscanner );
+YY_BUFFER_STATE yy_scan_bytes ( const char *bytes, int len , yyscan_t yyscanner );
 
-void *xlu__cfg_yyalloc (yy_size_t ,yyscan_t yyscanner );
-void *xlu__cfg_yyrealloc (void *,yy_size_t ,yyscan_t yyscanner );
-void xlu__cfg_yyfree (void * ,yyscan_t yyscanner );
+void *yyalloc ( yy_size_t , yyscan_t yyscanner );
+void *yyrealloc ( void *, yy_size_t , yyscan_t yyscanner );
+void yyfree ( void * , yyscan_t yyscanner );
 
 #define xlu__cfg_yywrap(yyscanner) (/*CONSTCOND*/1)
 #define YY_SKIP_YYWRAP
@@ -231,50 +471,50 @@ void xlu__cfg_yyfree (void * ,yyscan_t yyscanner );
 #define YY_EXTRA_TYPE void *
 #endif
 
-int xlu__cfg_yylex_init (yyscan_t* scanner);
+int yylex_init (yyscan_t* scanner);
 
-int xlu__cfg_yylex_init_extra (YY_EXTRA_TYPE user_defined,yyscan_t* scanner);
+int yylex_init_extra ( YY_EXTRA_TYPE user_defined, yyscan_t* scanner);
 
 /* Accessor methods to globals.
    These are made visible to non-reentrant scanners for convenience. */
 
-int xlu__cfg_yylex_destroy (yyscan_t yyscanner );
+int yylex_destroy ( yyscan_t yyscanner );
 
-int xlu__cfg_yyget_debug (yyscan_t yyscanner );
+int yyget_debug ( yyscan_t yyscanner );
 
-void xlu__cfg_yyset_debug (int debug_flag ,yyscan_t yyscanner );
+void yyset_debug ( int debug_flag , yyscan_t yyscanner );
 
-YY_EXTRA_TYPE xlu__cfg_yyget_extra (yyscan_t yyscanner );
+YY_EXTRA_TYPE yyget_extra ( yyscan_t yyscanner );
 
-void xlu__cfg_yyset_extra (YY_EXTRA_TYPE user_defined ,yyscan_t yyscanner );
+void yyset_extra ( YY_EXTRA_TYPE user_defined , yyscan_t yyscanner );
 
-FILE *xlu__cfg_yyget_in (yyscan_t yyscanner );
+FILE *yyget_in ( yyscan_t yyscanner );
 
-void xlu__cfg_yyset_in  (FILE * _in_str ,yyscan_t yyscanner );
+void yyset_in  ( FILE * _in_str , yyscan_t yyscanner );
 
-FILE *xlu__cfg_yyget_out (yyscan_t yyscanner );
+FILE *yyget_out ( yyscan_t yyscanner );
 
-void xlu__cfg_yyset_out  (FILE * _out_str ,yyscan_t yyscanner );
+void yyset_out  ( FILE * _out_str , yyscan_t yyscanner );
 
-			int xlu__cfg_yyget_leng (yyscan_t yyscanner );
+			int yyget_leng ( yyscan_t yyscanner );
 
-char *xlu__cfg_yyget_text (yyscan_t yyscanner );
+char *yyget_text ( yyscan_t yyscanner );
 
-int xlu__cfg_yyget_lineno (yyscan_t yyscanner );
+int yyget_lineno ( yyscan_t yyscanner );
 
-void xlu__cfg_yyset_lineno (int _line_number ,yyscan_t yyscanner );
+void yyset_lineno ( int _line_number , yyscan_t yyscanner );
 
-int xlu__cfg_yyget_column  (yyscan_t yyscanner );
+int yyget_column  ( yyscan_t yyscanner );
 
-void xlu__cfg_yyset_column (int _column_no ,yyscan_t yyscanner );
+void yyset_column ( int _column_no , yyscan_t yyscanner );
 
-YYSTYPE * xlu__cfg_yyget_lval (yyscan_t yyscanner );
+YYSTYPE * yyget_lval ( yyscan_t yyscanner );
 
-void xlu__cfg_yyset_lval (YYSTYPE * yylval_param ,yyscan_t yyscanner );
+void yyset_lval ( YYSTYPE * yylval_param , yyscan_t yyscanner );
 
-       YYLTYPE *xlu__cfg_yyget_lloc (yyscan_t yyscanner );
+       YYLTYPE *yyget_lloc ( yyscan_t yyscanner );
     
-        void xlu__cfg_yyset_lloc (YYLTYPE * yylloc_param ,yyscan_t yyscanner );
+        void yyset_lloc ( YYLTYPE * yylloc_param , yyscan_t yyscanner );
     
 /* Macros after this point can all be overridden by user definitions in
  * section 1.
@@ -282,18 +522,18 @@ void xlu__cfg_yyset_lval (YYSTYPE * yylval_param ,yyscan_t yyscanner );
 
 #ifndef YY_SKIP_YYWRAP
 #ifdef __cplusplus
-extern "C" int xlu__cfg_yywrap (yyscan_t yyscanner );
+extern "C" int yywrap ( yyscan_t yyscanner );
 #else
-extern int xlu__cfg_yywrap (yyscan_t yyscanner );
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
@@ -321,10 +561,10 @@ static int yy_flex_strlen (yyconst char * ,yyscan_t yyscanner);
 #ifndef YY_DECL
 #define YY_DECL_IS_OURS 1
 
-extern int xlu__cfg_yylex \
-               (YYSTYPE * yylval_param,YYLTYPE * yylloc_param ,yyscan_t yyscanner);
+extern int yylex \
+               (YYSTYPE * yylval_param, YYLTYPE * yylloc_param , yyscan_t yyscanner);
 
-#define YY_DECL int xlu__cfg_yylex \
+#define YY_DECL int yylex \
                (YYSTYPE * yylval_param, YYLTYPE * yylloc_param , yyscan_t yyscanner)
 #endif /* !YY_DECL */
 
@@ -342,8 +582,153 @@ extern int xlu__cfg_yylex \
 #undef YY_DECL
 #endif
 
+#ifndef xlu__cfg_yy_create_buffer_ALREADY_DEFINED
+#undef yy_create_buffer
+#endif
+#ifndef xlu__cfg_yy_delete_buffer_ALREADY_DEFINED
+#undef yy_delete_buffer
+#endif
+#ifndef xlu__cfg_yy_scan_buffer_ALREADY_DEFINED
+#undef yy_scan_buffer
+#endif
+#ifndef xlu__cfg_yy_scan_string_ALREADY_DEFINED
+#undef yy_scan_string
+#endif
+#ifndef xlu__cfg_yy_scan_bytes_ALREADY_DEFINED
+#undef yy_scan_bytes
+#endif
+#ifndef xlu__cfg_yy_init_buffer_ALREADY_DEFINED
+#undef yy_init_buffer
+#endif
+#ifndef xlu__cfg_yy_flush_buffer_ALREADY_DEFINED
+#undef yy_flush_buffer
+#endif
+#ifndef xlu__cfg_yy_load_buffer_state_ALREADY_DEFINED
+#undef yy_load_buffer_state
+#endif
+#ifndef xlu__cfg_yy_switch_to_buffer_ALREADY_DEFINED
+#undef yy_switch_to_buffer
+#endif
+#ifndef xlu__cfg_yypush_buffer_state_ALREADY_DEFINED
+#undef yypush_buffer_state
+#endif
+#ifndef xlu__cfg_yypop_buffer_state_ALREADY_DEFINED
+#undef yypop_buffer_state
+#endif
+#ifndef xlu__cfg_yyensure_buffer_stack_ALREADY_DEFINED
+#undef yyensure_buffer_stack
+#endif
+#ifndef xlu__cfg_yylex_ALREADY_DEFINED
+#undef yylex
+#endif
+#ifndef xlu__cfg_yyrestart_ALREADY_DEFINED
+#undef yyrestart
+#endif
+#ifndef xlu__cfg_yylex_init_ALREADY_DEFINED
+#undef yylex_init
+#endif
+#ifndef xlu__cfg_yylex_init_extra_ALREADY_DEFINED
+#undef yylex_init_extra
+#endif
+#ifndef xlu__cfg_yylex_destroy_ALREADY_DEFINED
+#undef yylex_destroy
+#endif
+#ifndef xlu__cfg_yyget_debug_ALREADY_DEFINED
+#undef yyget_debug
+#endif
+#ifndef xlu__cfg_yyset_debug_ALREADY_DEFINED
+#undef yyset_debug
+#endif
+#ifndef xlu__cfg_yyget_extra_ALREADY_DEFINED
+#undef yyget_extra
+#endif
+#ifndef xlu__cfg_yyset_extra_ALREADY_DEFINED
+#undef yyset_extra
+#endif
+#ifndef xlu__cfg_yyget_in_ALREADY_DEFINED
+#undef yyget_in
+#endif
+#ifndef xlu__cfg_yyset_in_ALREADY_DEFINED
+#undef yyset_in
+#endif
+#ifndef xlu__cfg_yyget_out_ALREADY_DEFINED
+#undef yyget_out
+#endif
+#ifndef xlu__cfg_yyset_out_ALREADY_DEFINED
+#undef yyset_out
+#endif
+#ifndef xlu__cfg_yyget_leng_ALREADY_DEFINED
+#undef yyget_leng
+#endif
+#ifndef xlu__cfg_yyget_text_ALREADY_DEFINED
+#undef yyget_text
+#endif
+#ifndef xlu__cfg_yyget_lineno_ALREADY_DEFINED
+#undef yyget_lineno
+#endif
+#ifndef xlu__cfg_yyset_lineno_ALREADY_DEFINED
+#undef yyset_lineno
+#endif
+#ifndef xlu__cfg_yyget_column_ALREADY_DEFINED
+#undef yyget_column
+#endif
+#ifndef xlu__cfg_yyset_column_ALREADY_DEFINED
+#undef yyset_column
+#endif
+#ifndef xlu__cfg_yywrap_ALREADY_DEFINED
+#undef yywrap
+#endif
+#ifndef xlu__cfg_yyget_lval_ALREADY_DEFINED
+#undef yyget_lval
+#endif
+#ifndef xlu__cfg_yyset_lval_ALREADY_DEFINED
+#undef yyset_lval
+#endif
+#ifndef xlu__cfg_yyget_lloc_ALREADY_DEFINED
+#undef yyget_lloc
+#endif
+#ifndef xlu__cfg_yyset_lloc_ALREADY_DEFINED
+#undef yyset_lloc
+#endif
+#ifndef xlu__cfg_yyalloc_ALREADY_DEFINED
+#undef yyalloc
+#endif
+#ifndef xlu__cfg_yyrealloc_ALREADY_DEFINED
+#undef yyrealloc
+#endif
+#ifndef xlu__cfg_yyfree_ALREADY_DEFINED
+#undef yyfree
+#endif
+#ifndef xlu__cfg_yytext_ALREADY_DEFINED
+#undef yytext
+#endif
+#ifndef xlu__cfg_yyleng_ALREADY_DEFINED
+#undef yyleng
+#endif
+#ifndef xlu__cfg_yyin_ALREADY_DEFINED
+#undef yyin
+#endif
+#ifndef xlu__cfg_yyout_ALREADY_DEFINED
+#undef yyout
+#endif
+#ifndef xlu__cfg_yy_flex_debug_ALREADY_DEFINED
+#undef yy_flex_debug
+#endif
+#ifndef xlu__cfg_yylineno_ALREADY_DEFINED
+#undef yylineno
+#endif
+#ifndef xlu__cfg_yytables_fload_ALREADY_DEFINED
+#undef yytables_fload
+#endif
+#ifndef xlu__cfg_yytables_destroy_ALREADY_DEFINED
+#undef yytables_destroy
+#endif
+#ifndef xlu__cfg_yyTABLES_NAME_ALREADY_DEFINED
+#undef yyTABLES_NAME
+#endif
+
 #line 105 "libxlu_cfg_l.l"
 
-#line 348 "libxlu_cfg_l.h"
+#line 733 "libxlu_cfg_l.h"
 #undef xlu__cfg_yyIN_HEADER
 #endif /* xlu__cfg_yyHEADER_H */
diff --git a/tools/libxl/libxlu_cfg_y.c b/tools/libxl/libxlu_cfg_y.c
index 751daa3842..6d4638afc9 100644
--- a/tools/libxl/libxlu_cfg_y.c
+++ b/tools/libxl/libxlu_cfg_y.c
@@ -1,8 +1,9 @@
-/* A Bison parser, made by GNU Bison 3.0.4.  */
+/* A Bison parser, made by GNU Bison 3.3.2.  */
 
 /* Bison implementation for Yacc-like parsers in C
 
-   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.
+   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2019 Free Software Foundation,
+   Inc.
 
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
@@ -40,11 +41,14 @@
    define necessary library symbols; they are noted "INFRINGES ON
    USER NAME SPACE" below.  */
 
+/* Undocumented macros, especially those whose name start with YY_,
+   are private implementation details.  Do not rely on them.  */
+
 /* Identify Bison output.  */
 #define YYBISON 1
 
 /* Bison version.  */
-#define YYBISON_VERSION "3.0.4"
+#define YYBISON_VERSION "3.3.2"
 
 /* Skeleton name.  */
 #define YYSKELETON_NAME "yacc.c"
@@ -67,20 +71,23 @@
 #define yynerrs         xlu__cfg_yynerrs
 
 
-/* Copy the first part of user declarations.  */
-#line 19 "libxlu_cfg_y.y" /* yacc.c:339  */
+/* First part of user prologue.  */
+#line 19 "libxlu_cfg_y.y" /* yacc.c:337  */
 
 #define ctx_scanner ctx->scanner
 #include "libxlu_cfg_i.h"
 #include "libxlu_cfg_l.h"
 
-#line 78 "libxlu_cfg_y.c" /* yacc.c:339  */
-
+#line 82 "libxlu_cfg_y.c" /* yacc.c:337  */
 # ifndef YY_NULLPTR
-#  if defined __cplusplus && 201103L <= __cplusplus
-#   define YY_NULLPTR nullptr
+#  if defined __cplusplus
+#   if 201103L <= __cplusplus
+#    define YY_NULLPTR nullptr
+#   else
+#    define YY_NULLPTR 0
+#   endif
 #  else
-#   define YY_NULLPTR 0
+#   define YY_NULLPTR ((void*)0)
 #  endif
 # endif
 
@@ -122,12 +129,12 @@ extern int xlu__cfg_yydebug;
 
 union YYSTYPE
 {
-#line 25 "libxlu_cfg_y.y" /* yacc.c:355  */
+#line 25 "libxlu_cfg_y.y" /* yacc.c:352  */
 
   char *string;
   XLU_ConfigValue *value;
 
-#line 131 "libxlu_cfg_y.c" /* yacc.c:355  */
+#line 138 "libxlu_cfg_y.c" /* yacc.c:352  */
 };
 
 typedef union YYSTYPE YYSTYPE;
@@ -155,9 +162,7 @@ int xlu__cfg_yyparse (CfgParseContext *ctx);
 
 #endif /* !YY_XLU_CFG_YY_LIBXLU_CFG_Y_H_INCLUDED  */
 
-/* Copy the second part of user declarations.  */
 
-#line 161 "libxlu_cfg_y.c" /* yacc.c:358  */
 
 #ifdef short
 # undef short
@@ -178,13 +183,13 @@ typedef signed char yytype_int8;
 #ifdef YYTYPE_UINT16
 typedef YYTYPE_UINT16 yytype_uint16;
 #else
-typedef unsigned short int yytype_uint16;
+typedef unsigned short yytype_uint16;
 #endif
 
 #ifdef YYTYPE_INT16
 typedef YYTYPE_INT16 yytype_int16;
 #else
-typedef short int yytype_int16;
+typedef short yytype_int16;
 #endif
 
 #ifndef YYSIZE_T
@@ -196,7 +201,7 @@ typedef short int yytype_int16;
 #  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
 #  define YYSIZE_T size_t
 # else
-#  define YYSIZE_T unsigned int
+#  define YYSIZE_T unsigned
 # endif
 #endif
 
@@ -232,15 +237,6 @@ typedef short int yytype_int16;
 # define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
 #endif
 
-#if !defined _Noreturn \
-     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
-# if defined _MSC_VER && 1200 <= _MSC_VER
-#  define _Noreturn __declspec (noreturn)
-# else
-#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
-# endif
-#endif
-
 /* Suppress unused-variable warnings by "using" E.  */
 #if ! defined lint || defined __GNUC__
 # define YYUSE(E) ((void) (E))
@@ -248,7 +244,7 @@ typedef short int yytype_int16;
 # define YYUSE(E) /* empty */
 #endif
 
-#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
+#if defined __GNUC__ && ! defined __ICC && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
 /* Suppress an incorrect diagnostic about yylval being uninitialized.  */
 # define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
     _Pragma ("GCC diagnostic push") \
@@ -412,16 +408,16 @@ union yyalloc
 /* YYNSTATES -- Number of states.  */
 #define YYNSTATES  32
 
-/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
-   by yylex, with out-of-bounds checking.  */
 #define YYUNDEFTOK  2
 #define YYMAXUTOK   262
 
+/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
+   as returned by yylex, with out-of-bounds checking.  */
 #define YYTRANSLATE(YYX)                                                \
-  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)
+  ((unsigned) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)
 
 /* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
-   as returned by yylex, without out-of-bounds checking.  */
+   as returned by yylex.  */
 static const yytype_uint8 yytranslate[] =
 {
        0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
@@ -586,22 +582,22 @@ static const yytype_uint8 yyr2[] =
 
 #define YYRECOVERING()  (!!yyerrstatus)
 
-#define YYBACKUP(Token, Value)                                  \
-do                                                              \
-  if (yychar == YYEMPTY)                                        \
-    {                                                           \
-      yychar = (Token);                                         \
-      yylval = (Value);                                         \
-      YYPOPSTACK (yylen);                                       \
-      yystate = *yyssp;                                         \
-      goto yybackup;                                            \
-    }                                                           \
-  else                                                          \
-    {                                                           \
-      yyerror (&yylloc, ctx, YY_("syntax error: cannot back up")); \
-      YYERROR;                                                  \
-    }                                                           \
-while (0)
+#define YYBACKUP(Token, Value)                                    \
+  do                                                              \
+    if (yychar == YYEMPTY)                                        \
+      {                                                           \
+        yychar = (Token);                                         \
+        yylval = (Value);                                         \
+        YYPOPSTACK (yylen);                                       \
+        yystate = *yyssp;                                         \
+        goto yybackup;                                            \
+      }                                                           \
+    else                                                          \
+      {                                                           \
+        yyerror (&yylloc, ctx, YY_("syntax error: cannot back up")); \
+        YYERROR;                                                  \
+      }                                                           \
+  while (0)
 
 /* Error token number */
 #define YYTERROR        1
@@ -660,10 +656,10 @@ do {                                            \
 /* Print *YYLOCP on YYO.  Private, do not rely on its existence. */
 
 YY_ATTRIBUTE_UNUSED
-static unsigned
+static int
 yy_location_print_ (FILE *yyo, YYLTYPE const * const yylocp)
 {
-  unsigned res = 0;
+  int res = 0;
   int end_col = 0 != yylocp->last_column ? yylocp->last_column - 1 : 0;
   if (0 <= yylocp->first_line)
     {
@@ -706,41 +702,41 @@ do {                                                                      \
 } while (0)
 
 
-/*----------------------------------------.
-| Print this symbol's value on YYOUTPUT.  |
-`----------------------------------------*/
+/*-----------------------------------.
+| Print this symbol's value on YYO.  |
+`-----------------------------------*/
 
 static void
-yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp, CfgParseContext *ctx)
+yy_symbol_value_print (FILE *yyo, int yytype, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp, CfgParseContext *ctx)
 {
-  FILE *yyo = yyoutput;
-  YYUSE (yyo);
+  FILE *yyoutput = yyo;
+  YYUSE (yyoutput);
   YYUSE (yylocationp);
   YYUSE (ctx);
   if (!yyvaluep)
     return;
 # ifdef YYPRINT
   if (yytype < YYNTOKENS)
-    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
+    YYPRINT (yyo, yytoknum[yytype], *yyvaluep);
 # endif
   YYUSE (yytype);
 }
 
 
-/*--------------------------------.
-| Print this symbol on YYOUTPUT.  |
-`--------------------------------*/
+/*---------------------------.
+| Print this symbol on YYO.  |
+`---------------------------*/
 
 static void
-yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp, CfgParseContext *ctx)
+yy_symbol_print (FILE *yyo, int yytype, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp, CfgParseContext *ctx)
 {
-  YYFPRINTF (yyoutput, "%s %s (",
+  YYFPRINTF (yyo, "%s %s (",
              yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);
 
-  YY_LOCATION_PRINT (yyoutput, *yylocationp);
-  YYFPRINTF (yyoutput, ": ");
-  yy_symbol_value_print (yyoutput, yytype, yyvaluep, yylocationp, ctx);
-  YYFPRINTF (yyoutput, ")");
+  YY_LOCATION_PRINT (yyo, *yylocationp);
+  YYFPRINTF (yyo, ": ");
+  yy_symbol_value_print (yyo, yytype, yyvaluep, yylocationp, ctx);
+  YYFPRINTF (yyo, ")");
 }
 
 /*------------------------------------------------------------------.
@@ -774,7 +770,7 @@ do {                                                            \
 static void
 yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, YYLTYPE *yylsp, int yyrule, CfgParseContext *ctx)
 {
-  unsigned long int yylno = yyrline[yyrule];
+  unsigned long yylno = yyrline[yyrule];
   int yynrhs = yyr2[yyrule];
   int yyi;
   YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
@@ -785,7 +781,7 @@ yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, YYLTYPE *yylsp, int yyrule
       YYFPRINTF (stderr, "   $%d = ", yyi + 1);
       yy_symbol_print (stderr,
                        yystos[yyssp[yyi + 1 - yynrhs]],
-                       &(yyvsp[(yyi + 1) - (yynrhs)])
+                       &yyvsp[(yyi + 1) - (yynrhs)]
                        , &(yylsp[(yyi + 1) - (yynrhs)])                       , ctx);
       YYFPRINTF (stderr, "\n");
     }
@@ -889,7 +885,10 @@ yytnamerr (char *yyres, const char *yystr)
           case '\\':
             if (*++yyp != '\\')
               goto do_not_strip_quotes;
-            /* Fall through.  */
+            else
+              goto append;
+
+          append:
           default:
             if (yyres)
               yyres[yyn] = *yyp;
@@ -907,7 +906,7 @@ yytnamerr (char *yyres, const char *yystr)
   if (! yyres)
     return yystrlen (yystr);
 
-  return yystpcpy (yyres, yystr) - yyres;
+  return (YYSIZE_T) (yystpcpy (yyres, yystr) - yyres);
 }
 # endif
 
@@ -985,10 +984,10 @@ yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                 yyarg[yycount++] = yytname[yyx];
                 {
                   YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
-                  if (! (yysize <= yysize1
-                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
+                  if (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM)
+                    yysize = yysize1;
+                  else
                     return 2;
-                  yysize = yysize1;
                 }
               }
         }
@@ -1000,6 +999,7 @@ yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
       case N:                               \
         yyformat = S;                       \
       break
+    default: /* Avoid compiler warnings. */
       YYCASE_(0, YY_("syntax error"));
       YYCASE_(1, YY_("syntax error, unexpected %s"));
       YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
@@ -1011,9 +1011,10 @@ yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
 
   {
     YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
-    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
+    if (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM)
+      yysize = yysize1;
+    else
       return 2;
-    yysize = yysize1;
   }
 
   if (*yymsg_alloc < yysize)
@@ -1064,49 +1065,48 @@ yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep, YYLTYPE *yylocatio
   YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
   switch (yytype)
     {
-          case 3: /* IDENT  */
+    case 3: /* IDENT  */
 #line 40 "libxlu_cfg_y.y" /* yacc.c:1257  */
       { free(((*yyvaluep).string)); }
-#line 1071 "libxlu_cfg_y.c" /* yacc.c:1257  */
+#line 1072 "libxlu_cfg_y.c" /* yacc.c:1257  */
         break;
 
     case 4: /* STRING  */
 #line 40 "libxlu_cfg_y.y" /* yacc.c:1257  */
       { free(((*yyvaluep).string)); }
-#line 1077 "libxlu_cfg_y.c" /* yacc.c:1257  */
+#line 1078 "libxlu_cfg_y.c" /* yacc.c:1257  */
         break;
 
     case 5: /* NUMBER  */
 #line 40 "libxlu_cfg_y.y" /* yacc.c:1257  */
       { free(((*yyvaluep).string)); }
-#line 1083 "libxlu_cfg_y.c" /* yacc.c:1257  */
+#line 1084 "libxlu_cfg_y.c" /* yacc.c:1257  */
         break;
 
     case 19: /* value  */
 #line 44 "libxlu_cfg_y.y" /* yacc.c:1257  */
       { xlu__cfg_value_free(((*yyvaluep).value)); }
-#line 1089 "libxlu_cfg_y.c" /* yacc.c:1257  */
+#line 1090 "libxlu_cfg_y.c" /* yacc.c:1257  */
         break;
 
     case 20: /* atom  */
 #line 40 "libxlu_cfg_y.y" /* yacc.c:1257  */
       { free(((*yyvaluep).string)); }
-#line 1095 "libxlu_cfg_y.c" /* yacc.c:1257  */
+#line 1096 "libxlu_cfg_y.c" /* yacc.c:1257  */
         break;
 
     case 21: /* valuelist  */
 #line 44 "libxlu_cfg_y.y" /* yacc.c:1257  */
       { xlu__cfg_value_free(((*yyvaluep).value)); }
-#line 1101 "libxlu_cfg_y.c" /* yacc.c:1257  */
+#line 1102 "libxlu_cfg_y.c" /* yacc.c:1257  */
         break;
 
     case 22: /* values  */
 #line 44 "libxlu_cfg_y.y" /* yacc.c:1257  */
       { xlu__cfg_value_free(((*yyvaluep).value)); }
-#line 1107 "libxlu_cfg_y.c" /* yacc.c:1257  */
+#line 1108 "libxlu_cfg_y.c" /* yacc.c:1257  */
         break;
 
-
       default:
         break;
     }
@@ -1212,23 +1212,31 @@ YYLTYPE yylloc = yyloc_default;
   yylsp[0] = yylloc;
   goto yysetstate;
 
+
 /*------------------------------------------------------------.
-| yynewstate -- Push a new state, which is found in yystate.  |
+| yynewstate -- push a new state, which is found in yystate.  |
 `------------------------------------------------------------*/
- yynewstate:
+yynewstate:
   /* In all cases, when you get here, the value and location stacks
      have just been pushed.  So pushing a state here evens the stacks.  */
   yyssp++;
 
- yysetstate:
-  *yyssp = yystate;
+
+/*--------------------------------------------------------------------.
+| yynewstate -- set current state (the top of the stack) to yystate.  |
+`--------------------------------------------------------------------*/
+yysetstate:
+  *yyssp = (yytype_int16) yystate;
 
   if (yyss + yystacksize - 1 <= yyssp)
+#if !defined yyoverflow && !defined YYSTACK_RELOCATE
+    goto yyexhaustedlab;
+#else
     {
       /* Get the current used size of the three stacks, in elements.  */
-      YYSIZE_T yysize = yyssp - yyss + 1;
+      YYSIZE_T yysize = (YYSIZE_T) (yyssp - yyss + 1);
 
-#ifdef yyoverflow
+# if defined yyoverflow
       {
         /* Give user a chance to reallocate the stack.  Use copies of
            these so that the &'s don't force the real ones into
@@ -1246,15 +1254,11 @@ YYLTYPE yylloc = yyloc_default;
                     &yyvs1, yysize * sizeof (*yyvsp),
                     &yyls1, yysize * sizeof (*yylsp),
                     &yystacksize);
-
-        yyls = yyls1;
         yyss = yyss1;
         yyvs = yyvs1;
+        yyls = yyls1;
       }
-#else /* no yyoverflow */
-# ifndef YYSTACK_RELOCATE
-      goto yyexhaustedlab;
-# else
+# else /* defined YYSTACK_RELOCATE */
       /* Extend the stack our own way.  */
       if (YYMAXDEPTH <= yystacksize)
         goto yyexhaustedlab;
@@ -1271,23 +1275,23 @@ YYLTYPE yylloc = yyloc_default;
         YYSTACK_RELOCATE (yyss_alloc, yyss);
         YYSTACK_RELOCATE (yyvs_alloc, yyvs);
         YYSTACK_RELOCATE (yyls_alloc, yyls);
-#  undef YYSTACK_RELOCATE
+# undef YYSTACK_RELOCATE
         if (yyss1 != yyssa)
           YYSTACK_FREE (yyss1);
       }
 # endif
-#endif /* no yyoverflow */
 
       yyssp = yyss + yysize - 1;
       yyvsp = yyvs + yysize - 1;
       yylsp = yyls + yysize - 1;
 
       YYDPRINTF ((stderr, "Stack size increased to %lu\n",
-                  (unsigned long int) yystacksize));
+                  (unsigned long) yystacksize));
 
       if (yyss + yystacksize - 1 <= yyssp)
         YYABORT;
     }
+#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */
 
   YYDPRINTF ((stderr, "Entering state %d\n", yystate));
 
@@ -1296,11 +1300,11 @@ YYLTYPE yylloc = yyloc_default;
 
   goto yybackup;
 
+
 /*-----------.
 | yybackup.  |
 `-----------*/
 yybackup:
-
   /* Do appropriate processing given the current state.  Read a
      lookahead token if we need one and don't already have one.  */
 
@@ -1373,7 +1377,7 @@ yydefault:
 
 
 /*-----------------------------.
-| yyreduce -- Do a reduction.  |
+| yyreduce -- do a reduction.  |
 `-----------------------------*/
 yyreduce:
   /* yyn is the number of a rule to reduce with.  */
@@ -1389,79 +1393,80 @@ yyreduce:
      GCC warning that YYVAL may be used uninitialized.  */
   yyval = yyvsp[1-yylen];
 
-  /* Default location.  */
+  /* Default location. */
   YYLLOC_DEFAULT (yyloc, (yylsp - yylen), yylen);
+  yyerror_range[1] = yyloc;
   YY_REDUCE_PRINT (yyn);
   switch (yyn)
     {
         case 9:
-#line 58 "libxlu_cfg_y.y" /* yacc.c:1646  */
+#line 58 "libxlu_cfg_y.y" /* yacc.c:1652  */
     { xlu__cfg_set_store(ctx,(yyvsp[-2].string),XLU_OP_ASSIGNMENT,(yyvsp[0].value),(yylsp[0]).first_line); }
-#line 1401 "libxlu_cfg_y.c" /* yacc.c:1646  */
+#line 1406 "libxlu_cfg_y.c" /* yacc.c:1652  */
     break;
 
   case 10:
-#line 59 "libxlu_cfg_y.y" /* yacc.c:1646  */
+#line 59 "libxlu_cfg_y.y" /* yacc.c:1652  */
     { xlu__cfg_set_store(ctx,(yyvsp[-2].string),XLU_OP_ADDITION,(yyvsp[0].value),(yylsp[0]).first_line); }
-#line 1407 "libxlu_cfg_y.c" /* yacc.c:1646  */
+#line 1412 "libxlu_cfg_y.c" /* yacc.c:1652  */
     break;
 
   case 13:
-#line 64 "libxlu_cfg_y.y" /* yacc.c:1646  */
+#line 64 "libxlu_cfg_y.y" /* yacc.c:1652  */
     { (yyval.value)= xlu__cfg_string_mk(ctx,(yyvsp[0].string),&(yylsp[0])); }
-#line 1413 "libxlu_cfg_y.c" /* yacc.c:1646  */
+#line 1418 "libxlu_cfg_y.c" /* yacc.c:1652  */
     break;
 
   case 14:
-#line 65 "libxlu_cfg_y.y" /* yacc.c:1646  */
+#line 65 "libxlu_cfg_y.y" /* yacc.c:1652  */
     { (yyval.value)= (yyvsp[-1].value); }
-#line 1419 "libxlu_cfg_y.c" /* yacc.c:1646  */
+#line 1424 "libxlu_cfg_y.c" /* yacc.c:1652  */
     break;
 
   case 15:
-#line 67 "libxlu_cfg_y.y" /* yacc.c:1646  */
+#line 67 "libxlu_cfg_y.y" /* yacc.c:1652  */
     { (yyval.string)= (yyvsp[0].string); }
-#line 1425 "libxlu_cfg_y.c" /* yacc.c:1646  */
+#line 1430 "libxlu_cfg_y.c" /* yacc.c:1652  */
     break;
 
   case 16:
-#line 68 "libxlu_cfg_y.y" /* yacc.c:1646  */
+#line 68 "libxlu_cfg_y.y" /* yacc.c:1652  */
     { (yyval.string)= (yyvsp[0].string); }
-#line 1431 "libxlu_cfg_y.c" /* yacc.c:1646  */
+#line 1436 "libxlu_cfg_y.c" /* yacc.c:1652  */
     break;
 
   case 17:
-#line 70 "libxlu_cfg_y.y" /* yacc.c:1646  */
+#line 70 "libxlu_cfg_y.y" /* yacc.c:1652  */
     { (yyval.value)= xlu__cfg_list_mk(ctx,NULL,&yylloc); }
-#line 1437 "libxlu_cfg_y.c" /* yacc.c:1646  */
+#line 1442 "libxlu_cfg_y.c" /* yacc.c:1652  */
     break;
 
   case 18:
-#line 71 "libxlu_cfg_y.y" /* yacc.c:1646  */
+#line 71 "libxlu_cfg_y.y" /* yacc.c:1652  */
     { (yyval.value)= (yyvsp[0].value); }
-#line 1443 "libxlu_cfg_y.c" /* yacc.c:1646  */
+#line 1448 "libxlu_cfg_y.c" /* yacc.c:1652  */
     break;
 
   case 19:
-#line 72 "libxlu_cfg_y.y" /* yacc.c:1646  */
+#line 72 "libxlu_cfg_y.y" /* yacc.c:1652  */
     { (yyval.value)= (yyvsp[-2].value); }
-#line 1449 "libxlu_cfg_y.c" /* yacc.c:1646  */
+#line 1454 "libxlu_cfg_y.c" /* yacc.c:1652  */
     break;
 
   case 20:
-#line 74 "libxlu_cfg_y.y" /* yacc.c:1646  */
+#line 74 "libxlu_cfg_y.y" /* yacc.c:1652  */
     { (yyval.value)= xlu__cfg_list_mk(ctx,(yyvsp[-1].value),&(yylsp[-1])); }
-#line 1455 "libxlu_cfg_y.c" /* yacc.c:1646  */
+#line 1460 "libxlu_cfg_y.c" /* yacc.c:1652  */
     break;
 
   case 21:
-#line 75 "libxlu_cfg_y.y" /* yacc.c:1646  */
+#line 75 "libxlu_cfg_y.y" /* yacc.c:1652  */
     { xlu__cfg_list_append(ctx,(yyvsp[-4].value),(yyvsp[-1].value)); (yyval.value)= (yyvsp[-4].value); }
-#line 1461 "libxlu_cfg_y.c" /* yacc.c:1646  */
+#line 1466 "libxlu_cfg_y.c" /* yacc.c:1652  */
     break;
 
 
-#line 1465 "libxlu_cfg_y.c" /* yacc.c:1646  */
+#line 1470 "libxlu_cfg_y.c" /* yacc.c:1652  */
       default: break;
     }
   /* User semantic actions sometimes alter yychar, and that requires
@@ -1487,14 +1492,13 @@ yyreduce:
   /* Now 'shift' the result of the reduction.  Determine what state
      that goes to, based on the state we popped back to and the rule
      number reduced by.  */
-
-  yyn = yyr1[yyn];
-
-  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
-  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
-    yystate = yytable[yystate];
-  else
-    yystate = yydefgoto[yyn - YYNTOKENS];
+  {
+    const int yylhs = yyr1[yyn] - YYNTOKENS;
+    const int yyi = yypgoto[yylhs] + *yyssp;
+    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
+               ? yytable[yyi]
+               : yydefgoto[yylhs]);
+  }
 
   goto yynewstate;
 
@@ -1577,14 +1581,11 @@ yyerrlab:
 | yyerrorlab -- error raised explicitly by YYERROR.  |
 `---------------------------------------------------*/
 yyerrorlab:
+  /* Pacify compilers when the user code never invokes YYERROR and the
+     label yyerrorlab therefore never appears in user code.  */
+  if (0)
+    YYERROR;
 
-  /* Pacify compilers like GCC when the user code never invokes
-     YYERROR and the label yyerrorlab therefore never appears in user
-     code.  */
-  if (/*CONSTCOND*/ 0)
-     goto yyerrorlab;
-
-  yyerror_range[1] = yylsp[1-yylen];
   /* Do not reclaim the symbols of the rule whose action triggered
      this YYERROR.  */
   YYPOPSTACK (yylen);
@@ -1650,6 +1651,7 @@ yyacceptlab:
   yyresult = 0;
   goto yyreturn;
 
+
 /*-----------------------------------.
 | yyabortlab -- YYABORT comes here.  |
 `-----------------------------------*/
@@ -1657,6 +1659,7 @@ yyabortlab:
   yyresult = 1;
   goto yyreturn;
 
+
 #if !defined yyoverflow || YYERROR_VERBOSE
 /*-------------------------------------------------.
 | yyexhaustedlab -- memory exhaustion comes here.  |
@@ -1667,6 +1670,10 @@ yyexhaustedlab:
   /* Fall through.  */
 #endif
 
+
+/*-----------------------------------------------------.
+| yyreturn -- parsing is finished, return the result.  |
+`-----------------------------------------------------*/
 yyreturn:
   if (yychar != YYEMPTY)
     {
diff --git a/tools/libxl/libxlu_cfg_y.h b/tools/libxl/libxlu_cfg_y.h
index 9691bf1350..1233cb94fc 100644
--- a/tools/libxl/libxlu_cfg_y.h
+++ b/tools/libxl/libxlu_cfg_y.h
@@ -1,8 +1,9 @@
-/* A Bison parser, made by GNU Bison 3.0.4.  */
+/* A Bison parser, made by GNU Bison 3.3.2.  */
 
 /* Bison interface for Yacc-like parsers in C
 
-   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.
+   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2019 Free Software Foundation,
+   Inc.
 
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
@@ -30,6 +31,9 @@
    This special exception was added by the Free Software Foundation in
    version 2.2 of Bison.  */
 
+/* Undocumented macros, especially those whose name start with YY_,
+   are private implementation details.  Do not rely on them.  */
+
 #ifndef YY_XLU_CFG_YY_LIBXLU_CFG_Y_H_INCLUDED
 # define YY_XLU_CFG_YY_LIBXLU_CFG_Y_H_INCLUDED
 /* Debug traces.  */
@@ -58,12 +62,12 @@ extern int xlu__cfg_yydebug;
 
 union YYSTYPE
 {
-#line 25 "libxlu_cfg_y.y" /* yacc.c:1909  */
+#line 25 "libxlu_cfg_y.y" /* yacc.c:1921  */
 
   char *string;
   XLU_ConfigValue *value;
 
-#line 67 "libxlu_cfg_y.h" /* yacc.c:1909  */
+#line 71 "libxlu_cfg_y.h" /* yacc.c:1921  */
 };
 
 typedef union YYSTYPE YYSTYPE;
-- 
2.20.1


