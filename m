Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1A15AD445
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 15:51:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398879.639860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVCV2-0004Gq-PY; Mon, 05 Sep 2022 13:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398879.639860; Mon, 05 Sep 2022 13:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVCV2-0004DI-JY; Mon, 05 Sep 2022 13:50:52 +0000
Received: by outflank-mailman (input) for mailman id 398879;
 Mon, 05 Sep 2022 13:50:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=inei=ZI=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oVCV0-0004D4-0f
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 13:50:50 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd56896e-2d21-11ed-a016-b9edf5238543;
 Mon, 05 Sep 2022 15:50:47 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CD90A5C0129;
 Mon,  5 Sep 2022 09:50:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 05 Sep 2022 09:50:44 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Sep 2022 09:50:43 -0400 (EDT)
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
X-Inumbo-ID: bd56896e-2d21-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1662385844; x=1662472244; bh=z2EJpj9Jlrlm/5HYp/8onWWgFEWiwsTS8KY
	smptHOcA=; b=Iu5dwexg3XkHA1F8o8smQD5NDSIQ3HIlVa9ATvpkvHbiaZUrRVo
	3u5TANlGzNn/jb/B8dgLS7IhH7Fl/+oeJiVrVT5TMNzYrTBvXqxmfSlGh2AjtgFU
	536oy6mxuQ4+BZqoXRxGeLvceOQkiomOVeY7lFNELOkSbJqkcJ7ANdZ268ED3PN1
	WRg3/raf/eiCnjsguxLOw0Jrz913sWNRGpb6M0H4a5/3gd2RdZkIrTLPHAhESxB2
	27x88VeOJLdEwfSgF/369rL1zP2HWu9/nmLp/CV5mfZ9Fe3MZyOa6fOc5JpUSQHV
	tIvboXZztc1JxVJlZI6miQNWNAxA3xjkF8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1662385844; x=1662472244; bh=z2EJpj9Jlrlm/
	5HYp/8onWWgFEWiwsTS8KYsmptHOcA=; b=AwrILnfmwVzNb9VVUaT/XdJKct4H/
	shMdphDsGcCaP6m0/mC+IU6npgRPC3vETlsovZjN09w9Qs8eYDRkAST6HmCo+Q8N
	T2VO1pIKzsliERYE/huCq4lD1EtkOdk//mMYVkojif/yIJ06Ft6TIHbdM8Qhpol6
	qBDCv6hechCXMGEkoxpV0GbOgGYq0hYQQ49GzGdGeT97YB+8+6BaT0uuAjC6e79l
	cgyEI29AcAj5JOqM1d/pRFXr1T9Ni6xdCZzzlTaA5B91K1zoEPyzAQwSfJRP0hyx
	Dw318VaYvQD5yNxy5fT+rLXF4dfnXU/inZVC6XcK9tlmjgSgrjR6hCm9A==
X-ME-Sender: <xms:tP4VY5q01Wj7xKSAdRZv5A5UiI0JIPkQMHH5EmyKVtfUTNV3BCGqEg>
    <xme:tP4VY7pdLvUj5jipOcZ_6UunEJdXfKWk0rHS9l7F-wCLhFnWcIrgYFSlNkn3vMyet
    mGG4zQsZPYJZQ>
X-ME-Received: <xmr:tP4VY2Ncy7ftyAWAYhWDpG7g-ceEg9941ew4gcZ7eu5aBj1BDFRMZqcHCEk17R6-mB7kYr_Avoe37rUmEA0RnGGLd_4haVMMMrlhDxQQGZzADi4N9Ci2MQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeliedgjeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelkefh
    udelteelleelteetveeffeetffekteetjeehlefggeekleeghefhtdehvdenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:tP4VY060vkB853G-CiX3Ek2IrMTGLRT2QsNHh6wGAfVV9fAGvgIhGw>
    <xmx:tP4VY46dXP8JFMd5MwuNW2UAk1lUN-1DtQz_uygn3_jQ7gwsOXoMwg>
    <xmx:tP4VY8hFy9POSZTwVl5O4ypw_qATyC0IX8fu4sX12krcHkTC0hgR9g>
    <xmx:tP4VY4GOHCXzHW0irBJuASYfGFowiDRlZI96Edvi9FQnhlHR5s4rsw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 1/2] vchan-socket-proxy: add reconnect marker support
Date: Mon,  5 Sep 2022 15:50:18 +0200
Message-Id: <20220905135019.3749982-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When vchan client reconnect quickly, the server may not notice it. This
means, it won't reconnect the UNIX socket either. For QMP, it will
prevent the client to see the QMP protocol handshake, and the
communication will timeout.
Solve the issue by sending in-band connect marker. Whenever server sees
one (elsewhere than the first byte in the connection), handle it as a
client had reconnected. The marker is a one byte, and the user need to
choose something that doesn't appear in the data stream elsewhere.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 tools/vchan/vchan-socket-proxy.c | 51 +++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/tools/vchan/vchan-socket-proxy.c b/tools/vchan/vchan-socket-proxy.c
index e1d959c6d15c..1e7defe9bae7 100644
--- a/tools/vchan/vchan-socket-proxy.c
+++ b/tools/vchan/vchan-socket-proxy.c
@@ -31,6 +31,7 @@
  * One client is served at a time, clients needs to coordinate this themselves.
  */
 
+#define _GNU_SOURCE
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
@@ -54,6 +55,9 @@ static void usage(char** argv)
         "\t-m, --mode=client|server - vchan connection mode (client by default)\n"
         "\t-s, --state-path=path - xenstore path where write \"running\" to \n"
         "\t                        at startup\n"
+        "\t-r, --reconnect-marker=value - send(client)/expect(server) a\n"
+        "\t                single-byte marker to detect quick reconnects and\n"
+        "\t                force reconnecting UNIX socket\n"
         "\t-v, --verbose - verbose logging\n"
         "\n"
         "client: client of a vchan connection, fourth parameter can be:\n"
@@ -61,7 +65,7 @@ static void usage(char** argv)
         "\t             whenever new connection is accepted;\n"
         "\t             handle multiple _subsequent_ connections, until terminated\n"
         "\n"
-        "\tfile-no:     except open FD of a socket in listen mode;\n"
+        "\tfile-no:     expect open FD of a socket in listen mode;\n"
         "\t             otherwise similar to socket-path\n"
         "\n"
         "\t-:           open vchan connection immediately and pass the data\n"
@@ -88,6 +92,7 @@ char outbuf[BUFSIZE];
 int insiz = 0;
 int outsiz = 0;
 int verbose = 0;
+int reconnect_marker_value = -1;
 
 struct vchan_proxy_state {
     struct libxenvchan *ctrl;
@@ -291,6 +296,7 @@ int data_loop(struct vchan_proxy_state *state)
     int ret;
     int libxenvchan_fd;
     int max_fd;
+    bool just_connected = true;
 
     libxenvchan_fd = libxenvchan_fd_for_select(state->ctrl);
     for (;;) {
@@ -368,8 +374,33 @@ int data_loop(struct vchan_proxy_state *state)
                 exit(1);
             if (verbose)
                 fprintf(stderr, "from-vchan: %.*s\n", ret, outbuf + outsiz);
+            if (reconnect_marker_value != -1) {
+                char *reconnect_found =
+                    memrchr(outbuf + outsiz, reconnect_marker_value, ret);
+                if (just_connected && reconnect_found == outbuf + outsiz) {
+                    /* skip reconnect marker at the very first byte of the data
+                     * stream */
+                    memmove(outbuf + outsiz, outbuf + outsiz + 1, ret - 1);
+                    ret -= 1;
+                } else if (reconnect_found) {
+                    size_t newsiz = outbuf + outsiz + ret - reconnect_found - 1;
+                    if (verbose)
+                        fprintf(stderr, "reconnect marker found\n");
+                    /* discard everything before and including the reconnect
+                     * marker */
+                    memmove(outbuf, reconnect_found + 1, newsiz);
+                    outsiz = newsiz;
+                    /* then handle it as the client had just disconnected */
+                    close(state->output_fd);
+                    state->output_fd = -1;
+                    close(state->input_fd);
+                    state->input_fd = -1;
+                    return 0;
+                }
+            }
             outsiz += ret;
             socket_wr(state->output_fd);
+            just_connected = false;
         }
     }
     return 0;
@@ -385,6 +416,7 @@ static struct option options[] = {
     { "mode",       required_argument, NULL, 'm' },
     { "verbose",          no_argument, NULL, 'v' },
     { "state-path", required_argument, NULL, 's' },
+    { "reconnect-marker", required_argument, NULL, 'r' },
     { }
 };
 
@@ -421,6 +453,14 @@ int main(int argc, char **argv)
             case 's':
                 state_path = optarg;
                 break;
+            case 'r':
+                reconnect_marker_value = atoi(optarg);
+                if (reconnect_marker_value < 0 || reconnect_marker_value > 255) {
+                    fprintf(stderr, "invalid argument for --reconnect-marker, "
+                                    "must be a number between 0 and 255\n");
+                    usage(argv);
+                }
+                break;
             case '?':
                 usage(argv);
         }
@@ -509,6 +549,15 @@ int main(int argc, char **argv)
                 ret = 1;
                 break;
             }
+            if (reconnect_marker_value != -1) {
+                const char marker_buf[] = { reconnect_marker_value };
+
+                if (libxenvchan_write(state.ctrl, marker_buf, sizeof(marker_buf))
+                        != sizeof(marker_buf)) {
+                    fprintf(stderr, "failed to send reconnect marker\n");
+                    break;
+                }
+            }
             if (data_loop(&state) != 0)
                 break;
             /* don't reconnect if output was stdout */
-- 
2.35.3


