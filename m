Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2A4CAE1E5
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 20:53:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181121.1504222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vShHI-0004b0-4l; Mon, 08 Dec 2025 19:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181121.1504222; Mon, 08 Dec 2025 19:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vShHI-0004Z1-1u; Mon, 08 Dec 2025 19:52:12 +0000
Received: by outflank-mailman (input) for mailman id 1181121;
 Mon, 08 Dec 2025 19:52:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S/AO=6O=ariadne.space=ariadne@srs-se1.protection.inumbo.net>)
 id 1vShHG-0004Yu-BC
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 19:52:10 +0000
Received: from outbound.mr.icloud.com
 (p-west2-cluster4-host7-snip4-3.eps.apple.com [57.103.69.214])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6037105e-d46f-11f0-b15b-2bf370ae4941;
 Mon, 08 Dec 2025 20:52:07 +0100 (CET)
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
 by p00-icloudmta-asmtp-us-west-2a-60-percent-1 (Postfix) with ESMTPS id
 B1C3518013A5; Mon,  8 Dec 2025 19:52:03 +0000 (UTC)
Received: from phoebe.taild41b8.ts.net (unknown [17.57.152.38])
 by p00-icloudmta-asmtp-us-west-2a-60-percent-1 (Postfix) with ESMTPSA id
 9A3A01800138; Mon,  8 Dec 2025 19:52:02 +0000 (UTC)
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
X-Inumbo-ID: 6037105e-d46f-11f0-b15b-2bf370ae4941
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ariadne.space; s=sig1; bh=DvHhgkq2dJ0sklVse1aa7ik+cqkwTEL9gjApsPpOcPk=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=Ir977hqJXy+lPFMRIZJUBmuyolPNe+HhmMPQZDPQX/VOLSpIOwxl2t5H81O04yy8iANqNwjm56wDLwTXV6g86kDtzzvMfGvCBqFYxZUP8Ra6fCblx8KNbXeor4hDEdZijL7GaOZliIH+T7/FbaCrZSeTdACflFevxgA5NWp/C5fLpdL38YDBr4c0Kz/r+lwnfw4bIB1v5SspHkjekSTVeT7OYUDmkrdN+/NMs/kbgE7OlATsjsmfBw1Mxm5KfBZ+JRaT1BtlSnlZUGuN6IlTGShAafOXyahs2VFMgxTPvuY0iDy6gqoBEazf2McqQJiGM4sd0L6jSluKhF5yVrFHPA==
mail-alias-created-date: 1688796967087
From: Ariadne Conill <ariadne@ariadne.space>
To: v9fs@lists.linux.dev
Cc: xen-devel@lists.xenproject.org,
	asmadeus@codewreck.org,
	linux_oss@crudebyte.com,
	lucho@ionkov.net,
	ericvh@kernel.org,
	Ariadne Conill <ariadne@ariadne.space>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alex Zenla <alex@edera.dev>
Subject: [PATCH] 9p/xen: mark 9p transport device as closing when removing it
Date: Mon,  8 Dec 2025 11:51:55 -0800
Message-ID: <20251208195155.27473-1-ariadne@ariadne.space>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EX3QNWAq4p9Q36IVYhk4hN6tDjCVJVgw
X-Proofpoint-ORIG-GUID: EX3QNWAq4p9Q36IVYhk4hN6tDjCVJVgw
X-Authority-Info: v=2.4 cv=f69FxeyM c=1 sm=1 tr=0 ts=69372c64 cx=c_apl:c_pps
 a=9OgfyREA4BUYbbCgc0Y0oA==:117 a=9OgfyREA4BUYbbCgc0Y0oA==:17
 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iox4zFpeAAAA:8 a=VwQbUJbxAAAA:8
 a=k0M0V4IRsTHp1vcmCjoA:9 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDE2OCBTYWx0ZWRfX5xZ2+rgn0Y/4
 Qv7tsTi0IKi0zb2IZUVafW6TZF9iFY9745vHH0rxoUZvI5ygfjgeuSlmwmMGR/yPc2bNFVFjfaN
 TjdKpfdefNGdjBSKQCabjDGhQnWejGiOy9JTO4/B6Nfw249HywEG1W4qLT/tO0nDMTYD1nUHr1C
 B7Bbc/YNuqReFBKLyoSJSNl402ka8P+ZFIEb0uLu/pqcvOO9/TWpnRlUECRAaqddrX3QEeolmEm
 A3xn/J03tuNQyYi2NnO2yFX8fH8jyeWd0DHFx0MQ2wCb4E/NTfS3nw18imfVoTYDEqWjh+oTz+C
 /iWPrTcyIRg+yS+PXcg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1030
 adultscore=0 mlxscore=0 mlxlogscore=999 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080168
X-JNJ: AAAAAAABmt3X/758cjYAQS8mYvsy7oEhS4QHglaBA9kiQvxB0XGgJqzOok1JcvHOGX3vNJSCA9RPAF3s3p7S6EEL/PgZOu8MdVGipaCDUNImHK2A9oXfxB9buA6dwgVIYulZGSnBaK8bLmEsQIjUyNXnTYFNw83wfB53TRrBY8oMwkN07qL4ukyeoLwkwJYWYDcIN5ybEZ9SKbNVPTtN3WYCkT0IpdJMzgG8LkgcAqHAv0Ti3jNG5uHTcCcKwYG5cvbTrXit2atGiwTaqxgPUI9AK0LcKxbY2YPrJVkOI23TF6sXbGphr8F1hcJGbeZe41MYGTxYvZEPPDjxMKURxGETa0QhEKR2psrpY2dSZyqeoYFAPWBNAX13DYo4ObWAikfyJmgnUidCZDpkcemckAkD15jr5OeVUovjHxrRvbr0AYPMGckY2BTr8QWHJfRT7IpVulcQih/sML9gTy/aDmjUwe1vLCxkZt8xe91NHlLm04/81NhExbX7Lf4zc5LBpZhyymwFbgKl64VjVY2f8PaSQ8RBVQExFnUUCgIBqIPXGgqO22btw9QG0E1ZJ1yfV2bjH+3lX+mwcW/gmln8B2VRPYP0wSpa784xeDEcwCq6Bki9bv8te4BOmVFuo70/ZWe8OpI/D9+2EoXbmSiojVUJ2D1ZGc/zk0Khk4xMglfGeFjgwFO0FyC4iEDj0Jak+1EwVts78Z703xQURQm5uBwwuAk0IG/IeajulQ8=

We need to do this so that we can signal to the other end that the
device is being removed, so that it will release its claim on the
underlying memory allocation.  Otherwise releasing the grant-table
entries is deferred resulting in a kernel oops since the pages have
already been freed.

Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Fixes: 71ebd71921e45 ("xen/9pfs: connect to the backend")
Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
Signed-off-by: Alex Zenla <alex@edera.dev>
---
 net/9p/trans_xen.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/9p/trans_xen.c b/net/9p/trans_xen.c
index b9ff69c7522a..cde283c42dc6 100644
--- a/net/9p/trans_xen.c
+++ b/net/9p/trans_xen.c
@@ -312,6 +312,7 @@ static void xen_9pfs_front_remove(struct xenbus_device *dev)
 {
 	struct xen_9pfs_front_priv *priv = dev_get_drvdata(&dev->dev);
 
+	xenbus_switch_state(dev, XenbusStateClosing);
 	dev_set_drvdata(&dev->dev, NULL);
 	xen_9pfs_front_free(priv);
 }
-- 
2.52.0


