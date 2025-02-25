Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE90A439CB
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 10:38:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895562.1304222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmrOd-00081H-CE; Tue, 25 Feb 2025 09:38:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895562.1304222; Tue, 25 Feb 2025 09:38:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmrOd-0007wa-7r; Tue, 25 Feb 2025 09:38:35 +0000
Received: by outflank-mailman (input) for mailman id 895562;
 Tue, 25 Feb 2025 09:38:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g3GQ=VQ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tmrOc-0007uj-7R
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 09:38:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46795622-f35c-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 10:38:31 +0100 (CET)
Received: from nico.tail608894.ts.net (unknown [46.228.253.214])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id 0B7934EEF418;
 Tue, 25 Feb 2025 10:38:31 +0100 (CET)
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
X-Inumbo-ID: 46795622-f35c-11ef-9897-31a8f345e629
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=46.228.253.214
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1740476311;
	b=tbnGIMAl5vQUC8dk42k393Voa6dyvhHNa2ZE5Z5RvOkPlnqAW5EA3HJnPBGEqPueX2tt
	 wkzadyIylqjEv+NdiF6XzZiwLfrG7UMIIC0RGHV3Rab9zjukYYDOisl+9auefHXHi1xGd
	 ltYBq/kbZRoADJED4u0h3bq/nOOxv3jj2ayTswLxldThu9fgCWdIiAKqYLYjbnwSCUd+P
	 MGHCLXpUoQXyBkzDA9mlM6LuB8/SXAZeUHAXa0J5WOH9YIIV7a+NNJefHu3okYoA6dHPZ
	 HNz6QooScv0+WlGzEjmo5Q+lX8UhMIEpA3WZgLWVEfJkaI7DoUaesvN3wr5r/AvTTuDZ4
	 IphS9W9pFEtHzgI9cAseBEkXA8QaElnyH7Cm8GeNh/gqaYrx1L5ZevXA5FpRb3BKI1fn2
	 rx0YgqNq0fQownJmbeqFbdfwkVMAGj9PbvP0f08qsJaAopH0GrLkJ0h4zNoLeI1GCvkr+
	 S82OmlRbIU5GSPJgCqWwbJDsreogN1t0a0ftjW4P8JfbJ24xlJf6fIrkyj+LWFpRuLSYx
	 FW3iNGhinWxi1fiIrzA0DkcrScMuN/oJDIE51kXhIyMmlHmwWe9WFP7y6x9zONgvKpFgu
	 PC06nYzeIBoqlJ26D8Qmz+Fk2ABXHeT1JsuU5idRnQSV4h7EEWnzC35K7za8ZZw=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1740476311;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=mV2Snw/5hKKaTOvK0VHkFyXhGumz3S2bWIiAkQCSB3U=;
	b=jbpCIB2sP3pykhFtwSRfcJdo7tO7X0I8cb16Kr0nBfZ4BZLSkutqoG40N+qM1RBvfKzy
	 9pZTvQsqjS8MbDlJXP6v1/0ypspTXRs6MoVPGlQMJTgKLQR7rrOdqLT+J0Ju4pIOZVg5c
	 GXV9T74Fotenr9Z6rPa/QGYs95rQ3Hsiw5qzLh/e0HmCItpJSFJ4Oa8jnrWylF1eCIs8d
	 qpj0tLUwzLaugJuKJY66OVX8rWCAMHfU7bkPqQjB77EaCSINAXFVKJCkz9s3HXuakiSbm
	 v6xU4NSFm0vyHJGdN0yIJYLK024j4f9wTvlCnOUZyhCpJrpO8Hd2PE4isvvfJ6J6URmY/
	 jpAUesbTalBUPwjU0ElpdkvecXrpAuIPpN86qQWhm/wk38HlVAkehENvHuphtUWZzrHAx
	 9ubmzPgrGGG0XJrTIm36asQlHWWDn3QkKsY0QxlPbja979fgKMJkzuC6+tnYk3RR2mfh2
	 afe9Ikwq8YOf6M1AGhPri2SEmtf1o2RZta3l7GDzennEy3Oo7099cPl1oSLTJiSiEB3x9
	 i2K/hVhMd15L4mGV045DVLFzlx+HsgJIEIK7ObUMdPgSBFkd0pfOvaVmhEvPDQ2VGMOzC
	 sarS5/Jm8wD3ClbCMXGC+jdMnGB/Zjvmvok3qvOLw8ZY87WTpOH4DD6Ob6lHVPI=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=46.228.253.214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1740476311; bh=4mhypLmI+bzEIqJvhupyhI6zRRj5uMfdpWb9moyuUek=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L/sqaLDyqGy9c4R1UdyH+e2YO+Uyc4n0KPwqSNUKjXdOHmq/rMVHSy4W9F0rg8CXB
	 JkDfVrTcuXoP0/d5PSYQ22iPKg4gwRZ3ZzAHRQi98ZW2ySPCUmaP8RaRXFUKpC15fS
	 ozksbDfTgppe9SQ3xi/fTpEgwzPAlaDJUmWzsnX3QBf6qEOQO1P0sxkoPDN3gNejiK
	 funURqDlUQXP2mOmTe+JAxM8upuDVplA6A3S450PFThUdYijrZ5WeT8Vy6IAEP4ZZs
	 /PBeKl44Z7Sgb2kHxmA8dM6NSSRqjt5+iIF9o9qVueVbEZeYwfLyfc+QAsbUXvJbCJ
	 bC0W1pWplC2kA==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Meng Xu <mengxu@cis.upenn.edu>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [XEN PATCH v2 2/3] xen/rt: address violation of MISRA C Rule 8.2
Date: Tue, 25 Feb 2025 10:38:23 +0100
Message-ID: <e3c6457e50d61daa05fd9c3a7c71b06d912216a0.1740476096.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740476096.git.nicola.vetrini@bugseng.com>
References: <cover.1740476096.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 8.2 states: "Function types shall be in prototype form with
named parameters".

The parameter name is missing from the function pointer type
that constitutes the first parameter.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
Changes in v2:
- renamed function parameter name to "elem"
- changed prefix to xen/rt since only that scheduler is touched
---
 xen/common/sched/rt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index f368e0fdd5a5..7b1f64a779ea 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -500,7 +500,7 @@ deadline_queue_remove(struct list_head *queue, struct list_head *elem)
 }
 
 static inline bool
-deadline_queue_insert(struct rt_unit * (*qelem)(struct list_head *),
+deadline_queue_insert(struct rt_unit * (*qelem)(struct list_head *elem),
                       struct rt_unit *svc, struct list_head *elem,
                       struct list_head *queue)
 {
-- 
2.43.0


