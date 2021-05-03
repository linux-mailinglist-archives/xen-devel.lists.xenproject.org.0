Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E39371866
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 17:47:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121729.229602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldan9-0002cz-GZ; Mon, 03 May 2021 15:47:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121729.229602; Mon, 03 May 2021 15:47:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldan9-0002cZ-C4; Mon, 03 May 2021 15:47:27 +0000
Received: by outflank-mailman (input) for mailman id 121729;
 Mon, 03 May 2021 15:47:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lc2c=J6=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ldan7-0002cE-2d
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 15:47:25 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5b6d815-dc03-4f13-a96f-221b87bde8c6;
 Mon, 03 May 2021 15:47:24 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.25.5 AUTH)
 with ESMTPSA id g034cex43FlH029
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 3 May 2021 17:47:17 +0200 (CEST)
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
X-Inumbo-ID: a5b6d815-dc03-4f13-a96f-221b87bde8c6
ARC-Seal: i=1; a=rsa-sha256; t=1620056837; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=AaOW5fBW0PeSjI7JEmiMO5CeTXc9BPGx84g3bK5Es1hAOYlIIEI2ns29sSPDtOjn4B
    qAAQTVdY/gI28AmI3/iPfkepHgcKpDV5TTvLyrQRhwAne1GuphjmVDyoyepDC35ePTfk
    WIjreC2xDHedJjBdHAHLjiDJ6vnpWV/joQc5ZCv2y/iYNoc1LC10qpFoZ0lmm54vwGli
    AtKaQlnZcKUqclUdSn5gpidEUVw6hkegPF01B71dh/9EMAxLLTXiv+7z2gdxi9ZVzdVt
    cFcGi3RX+Jhg4coary7IWNZDFO8Xtrlxao8UgeIifO2ZqRqf8yU2T4gEuailJnRYIH0m
    d4LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620056837;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=ycCpPkfjO2T5krNvdESPBnNfk/UB5Msvnwpt33xdYeg=;
    b=Z3key5YpWusSNdHDORNH0htvRxhqxpzxtV8Q/INgML2jN9jDchjtKnXWZPEBQgCUuq
    Qt7AgaJoSWoVEjFcqduMKSUFoaRJOCg01FSlo9FkLq4JXTGIGAkMdckbUkO64llu0pWX
    vI2U4CFRNNlcIyu1AlNLFuhmchX/DI/YpPTtKWe0Gkfpk1OeSJMroQqJJZjolQU2kMX0
    KaYwKwlNGvpZAFb+lxiayoubJ5aBEDkMhLO3Zd4V932DiNh6Q8HR3UKhfYYav6dSuwS7
    clJGgWsM3dJnspdju/WMRcM3tRp1kNQxZ0UohQ8C66/X3DlyDogRWQx8VMKh6R/Op8yP
    T9gQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620056837;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=ycCpPkfjO2T5krNvdESPBnNfk/UB5Msvnwpt33xdYeg=;
    b=P9iTvs9pIja6nGxzlYeRAsEppWTHMH70IZNNrex9d2Z+ZorTr2FtZsIxDFcnmJL6es
    S66+3fMnQOEso11Pix4qmUZxq4rhDN4hi7m2I8UNcEw63D+kNktw/r7AaXuzic/4mpwU
    SvUnitKfc2ftP6omg9xW4gqPsVkQ5pgg5Q/O+tnQ5U8x8bxew1M+c92kS5AJyt9Knb6b
    QOejD4xsWBSJzwOyD5RuJhbWiaSEsmn+Iiah0AHTqYMh8ZiKEOewEIInOkS4LkhtRo7W
    8IkuZK1EIkKqo6/b86F/+dwYN805uusSQREKYQQO5VcucbSCAGc+AKHdHQ9JeIPdfqPr
    Jkjw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgtl+1b1FMstFZvCqIQN5N7TvWFg4vzhFVdoKAuQ"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v1] tools: add newlines to xenstored WRL_LOG
Date: Mon,  3 May 2021 17:47:12 +0200
Message-Id: <20210503154712.508-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to syslog(3) the fmt string does not need a newline.
The mini-os implementation of syslog requires the trailing newline.
Other calls to syslog do include the newline already, add it also to WRL_LOG.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/xenstore/xenstored_domain.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 3d4d0649a2..2d333b3ff6 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -1132,10 +1132,10 @@ void wrl_apply_debit_actual(struct domain *domain)
 	if (domain->wrl_credit < 0) {
 		if (!domain->wrl_delay_logged) {
 			domain->wrl_delay_logged = true;
-			WRL_LOG(now, "domain %ld is affected",
+			WRL_LOG(now, "domain %ld is affected\n",
 				(long)domain->domid);
 		} else if (!wrl_log_last_warning) {
-			WRL_LOG(now, "rate limiting restarts");
+			WRL_LOG(now, "rate limiting restarts\n");
 		}
 		wrl_log_last_warning = now.sec;
 	}
@@ -1145,7 +1145,7 @@ void wrl_log_periodic(struct wrl_timestampt now)
 {
 	if (wrl_log_last_warning &&
 	    (now.sec - wrl_log_last_warning) > WRL_LOGEVERY) {
-		WRL_LOG(now, "not in force recently");
+		WRL_LOG(now, "not in force recently\n");
 		wrl_log_last_warning = 0;
 	}
 }

