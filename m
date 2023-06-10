Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DB572AD94
	for <lists+xen-devel@lfdr.de>; Sat, 10 Jun 2023 19:08:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546553.853517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q824J-00088M-HM; Sat, 10 Jun 2023 17:08:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546553.853517; Sat, 10 Jun 2023 17:08:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q824J-00084w-CV; Sat, 10 Jun 2023 17:08:03 +0000
Received: by outflank-mailman (input) for mailman id 546553;
 Sat, 10 Jun 2023 17:08:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ujxR=B6=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1q824H-0007pL-SV
 for xen-devel@lists.xenproject.org; Sat, 10 Jun 2023 17:08:01 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59f8d0b9-07b1-11ee-8611-37d641c3527e;
 Sat, 10 Jun 2023 19:08:00 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 555E85C00D2;
 Sat, 10 Jun 2023 13:07:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sat, 10 Jun 2023 13:07:59 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Jun 2023 13:07:57 -0400 (EDT)
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
X-Inumbo-ID: 59f8d0b9-07b1-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1686416879; x=1686503279; bh=7Jo4c9QtvH
	tlbToAB55IunRxRJMuKNem21WfUtrWYf0=; b=R4G872AhYLcgiVT64bv01uWxyk
	UTwIQzhAviwtIXFLPZXZvAExiP7zCJC1L2DwDvix0Y/EASfsycXqZVWDZYv/W4KD
	wa1afVEZ+1fTLXff2BL4wiL1DmJUjneB6egjzzThpU7oSwT+n5VRD1uhE3af5Vfy
	vn3SNtiLfO9TOfggoGNENKVz4LorILzprI6jhwRDoyledV1PZ4Z+7BRY315l64et
	DJoAyfYhYPgCJnu+1QxzEKf4KKCEh/oPuFIgP+1RdfOEv9whP+j9vPOvziuk8757
	4sBfrpQU0TpgjfT9CRKmXccMjv+U4IhX4fbkDzlw5y1ICiUdvgEkDaTKyjnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1686416879; x=
	1686503279; bh=7Jo4c9QtvHtlbToAB55IunRxRJMuKNem21WfUtrWYf0=; b=X
	oovcJPuoEjGfvUgRl8xODTUTUISTuoR53DYOjfKU+/3BDsVh9AoXonh+6CGk2Bx7
	V6rmqF7vS8zoo1Tq/Mq+uSoXdTEUeB0XrE2Z81DFUu+eZzgi4O6WstMXfs6vCds5
	a3tvdw7mykCNksP4Xqmjr1YqdJZIrni8VQVutX3OVk46TMhnc1+4v2rWIJW82eAL
	HJk7AWeud3HyBNvLmjin43Ig0qw3YGZb7qhEJHmFsRUDnYKcaRYlV3Lz9PH7ZGKC
	jHdNH/JiBTewLNml7VzaJoNy/fFJAOtQt80QOMes9VM8/dV+0Vw2NN2wp34Ht7ae
	uQRe+sBFu1chU7B7k9vqg==
X-ME-Sender: <xms:762EZFtrsXGWH6Bi3vsdNf7KO0WeAt9CZgF_sw0uvbT6nPQTRvmhrg>
    <xme:762EZOeT2PjJFMbEpxkmF7v5Ty5_38noAd9nNqfMz21lY7bnR-tZACZY5n9yd1A9l
    HxBXgLwPt8Ypd8>
X-ME-Received: <xmr:762EZIzbbCs6lnlbpMn_MlYje7UdvucwNz94immORIpcW5DKbdPhrri6mwCDj-bwC0Rald-kszY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedutddgudduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeekveekveegudffgffgleekudeu
    keetlefgveelhfehuedtfedvgfeklefhtefgfeenucffohhmrghinhepkhgvrhhnvghlrd
    horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    uggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:762EZMOujFzVTRxP5-Stj3u7XjXaI8pS8gkgQzJSuiZZTSb2tQ0tvg>
    <xmx:762EZF9f8T4nECydLj9PLL5sjS1r2O07qLaoojvZ21krMTEcyVSMZQ>
    <xmx:762EZMWR73avhokyajzpl_EzpP-Mqwt25X8qAzLefJ4m4wpvN7lrWg>
    <xmx:762EZMjEEqz6bjWwVaBe2mGNSoOxz4EDSPbBgCo8kz67pTPZdFl0vw>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Lee Jones <lee@kernel.org>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v2 2/3] vsscanf(): do not skip spaces
Date: Sat, 10 Jun 2023 13:07:42 -0400
Message-Id: <20230610170743.2510-3-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230610170743.2510-1-demi@invisiblethingslab.com>
References: <20230610170743.2510-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Passing spaces before e.g. an integer is usually
not intended.  This was suggested by Christoph in
https://lore.kernel.org/lkml/ZIQrohcizoj4bZWx@infradead.org/.

Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 lib/vsprintf.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 8caccdcda0a2b470cda70c9b3837de37207eb512..d2d795d1aff0fd5cc50fb65ffb067067ab9f0dc6 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -3547,8 +3547,6 @@ int vsscanf(const char *buf, const char *fmt, va_list args)
 			char *s = (char *)va_arg(args, char *);
 			if (field_width == -1)
 				field_width = SHRT_MAX;
-			/* first, skip leading white space in buffer */
-			str = skip_spaces(str);
 
 			/* now copy until next white space */
 			while (*str && !isspace(*str) && field_width--)
@@ -3635,11 +3633,7 @@ int vsscanf(const char *buf, const char *fmt, va_list args)
 			return num;
 		}
 
-		/* have some sort of integer conversion.
-		 * first, skip white space in buffer.
-		 */
-		str = skip_spaces(str);
-
+		/* have some sort of integer conversion. */
 		digit = *str;
 		if (is_sign && digit == '-') {
 			if (field_width == 1)
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


