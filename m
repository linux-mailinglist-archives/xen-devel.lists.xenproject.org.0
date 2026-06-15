Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LUhsIj3CL2r4FwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 11:13:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1A3684F11
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 11:13:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kmM52Fj6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WOTsUO7e;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=qualcomm.com
Received: from list by lists.xenproject.org with outflank-mailman.1338067.1599082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ3Nc-0004oC-Ea; Mon, 15 Jun 2026 09:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338067.1599082; Mon, 15 Jun 2026 09:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ3Nc-0004ll-Bv; Mon, 15 Jun 2026 09:13:16 +0000
Received: by outflank-mailman (input) for mailman id 1338067;
 Mon, 15 Jun 2026 09:13:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1wZ3Nb-0004lf-CR
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 09:13:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ3Na-005TKx-8q
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 11:13:14 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a2fc225-e002-0a2a0a5209dd-0a2a4506de34-14
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 11:13:13 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a2fc228-7371-0a2a45060019-cddcb48363fa-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 11:13:13 +0200
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65F99FbG035652
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 09:13:12 GMT
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etegur0kb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 09:13:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-91579011fd1so498381085a.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 02:13:11 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2b0d4fsm35375932f8f.24.2026.06.15.02.13.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 15 Jun 2026 02:13:10 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5eKOXCv/vInmR0M9o8Av3s
	sy5kZO4+VBTWH0JYfq89M=; b=kmM52Fj6rboWFjPMnZAS/lb6TCgpsnkguiwo2f
	qRR+x+bCQWx8nWuXsS0l+8+snCT1FFvIYaIvSAyMMowHgiWnewnEhwBGWIKFrGHF
	1e/pGqDJe0GYx7+l293XniWdtWdC2M6z9w/prBVp0IsBBuyezs5YtBECnV7xvHs8
	0NSwskGCrwyTQXmicWPUS6M4ktd+xjCsmaCnXwjX2VUmqiJ/KID7aMtH5gzY6jXx
	s+7uAMsYYrglqcWjItTBL++eBHwVHdpd1pAz/kB03rJqpsTRma3dKZtXRBYwF2lu
	Dq53xyVJff3djQOKfwo9BhLoceHMibHmJuzoUDbE1TGLIrOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781514791; x=1782119591; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5eKOXCv/vInmR0M9o8Av3ssy5kZO4+VBTWH0JYfq89M=;
        b=WOTsUO7eqgjl8bkEFlW4GaNDcKatpFY8R6EXCXBfs4wCtJBQM3EIt95zZbQM5+tS5M
         G4S7RB58NwXuY80364pWQdcNe2mqsbV+FUQwbdj/PogAtm7Qay5BoB2/LydaMPVQAyH9
         C6BeVNaac0rzpy3/B7yI90/9M34ffh0qm7zFTylSgyqo0chce9uavop91dnHqbQouyDo
         36jo5Uqov1ccuCUr845XB6yBScFjaGNAnyDkEoNKpXGKD7r6z5IDu2svCdGg9paGXir1
         TxIYmC8gEPXgBOyMQaHgQz9cttfEPJoMI/zAJezEpybSLugnTg5jLP3XElN6IUtIp+VF
         cl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781514791; x=1782119591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5eKOXCv/vInmR0M9o8Av3ssy5kZO4+VBTWH0JYfq89M=;
        b=cdO2PCOKidaNXOzP9MeyZV37XF1UkOk+6TblMrB4r+/unboKodzMwujE5diexJyN2P
         zNNVNQRWyA9NoR3AwltCVRIYfqIxaynxa0uZg/2jsex87r3s9Lxzoy2VSSQqt5kxl+w2
         Wl+iS3HvujFMaSqShdk0WeF7uqB7HrZVWvWPr/qVhRiswsbYH81uHTzFMWeH6FMvZBQA
         i0ChMnzZOmWDYV8iDEGUoWy65SHKfpBfVBTk5j3LHnJn4clda13T774a+HSP2LYS50e3
         VuSHUnrzmsGBWqzTdIctxchRWbTLPgITDYGh62rZIVOrbslGz1xa9EQqPDf71bh+gA0T
         JpOQ==
X-Gm-Message-State: AOJu0Ywet4oedQKDlL/XQ4uDwa7/odgIzNkgBHOoGHQfvpiksmiX8BDC
	p801dLb9NmJlgADvwoil6ZHVEbcOFIqDn+6p55NDOig3mnMfB8ZUtFIKSBjZACJKKOoMGYU5M1/
	GupThMgQDJ2KgXQOxfDXXUFtxx/Q1zPltCJylBLKm5XxyLNya1w1TQp/+3ch3Uom83S6bqQ==
X-Gm-Gg: Acq92OEgZ7P9mXXRSzoTchJmPYM4uknzkd6leoc2FeaKdixIN2bhbUebuYY1ztEEIb7
	GhG6yZywN6LXovpodPxZx7OEUAlPsCFCRYsxwSURmTrLuAbW9c2Osxh1bkmyZm4FNQd+7HBvMYk
	87CmmkQbKlqG+Kt8qxRu/jSu/HzUBqXMnvQoDYY0yND/umoU927KyH6koueEJ7PCwxusSl9gltP
	K6lMhAR0lrto7KP+57Fgxgoe3tvK0wsfRlBxr6XXU1yRzLR2qYyhJhBsgmun+R3d8ANPrjcd/vW
	Yajj2TsmHPNqWiEL9Dvgaifkb6R1wEe8t4fsYgfLA72dgmg1g5DqFOvyyJSow6tpMfIwFI0GEP+
	rDN66TAi97k5v4VJqJ0aSz0gVEVYnSpUHswLARbx5RK04QMyf2R8YzLGBa2y0g8PPUAv7x0PC3j
	xKg94=
X-Received: by 2002:a05:620a:272a:b0:914:b65f:6b00 with SMTP id af79cd13be357-9161bac4e82mr2152721285a.6.1781514791207;
        Mon, 15 Jun 2026 02:13:11 -0700 (PDT)
X-Received: by 2002:a05:620a:272a:b0:914:b65f:6b00 with SMTP id af79cd13be357-9161bac4e82mr2152717285a.6.1781514790771;
        Mon, 15 Jun 2026 02:13:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony PERARD <anthony@xenproject.org>,
        =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v2 0/2] misc: Remove pre-C99/C11 checks
Date: Mon, 15 Jun 2026 11:13:06 +0200
Message-ID: <20260615091308.4458-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5NiBTYWx0ZWRfX/HKcKRgm++ZR
 N6bJeCU0cFskGjsUna62f6BYZPPXuzajo77Void6wKQW+WJhxWDcqcbvTKluydi06Ax4YoWH8P3
 GEH8d1k7is3Lj4MgMhCb5z43gKTqnRuUKbFd7CHJbcNEe0ZY6xXbRNpyDEffMxwYaH6giTFBe2u
 7UHulw98fBCWKSycsj/BWJilDt1WhIDJj+WopWhSBpIrN1mnwxnoRid8wCbx3pDih/xNu39UNRI
 72S7k6fRm9PjTjntcuRlFFJIY/l/GaXlatPa0gEKpXr4IbwK9keqN7e2tG1YGN2ov7wLgaO2v1x
 BYT26iMp9uqYqAXycQDnie+ev2l4lMbJMGcAd2ykscb1rwxYyTtahQBlJr+cqDdDfyLMHk48vzZ
 IADipEB+vj819QWqHxTFHe+0fNVplIZhoMzwQhRj27+Eaz/NB7pz2IbwlMq5AagrGC5qdi4H3zE
 sbIW7GdeD9/iYW394Ow==
X-Proofpoint-ORIG-GUID: ZvdRTJ11uBh-5YkA694A7c-jQ4mlLT0w
X-Authority-Analysis: v=2.4 cv=HMvz0Itv c=1 sm=1 tr=0 ts=6a2fc227 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=2Kr2Ceio6qlyrOmMFMIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5NiBTYWx0ZWRfX3NCv3HODwldd
 Sge0M7eTLKc+/nWeueyP6qxS0IwERFHw6OX40QRGNGa9B0miyOwiv39s/nmz+/gJJnXATJSYUe/
 yV4wRuOoCzbG9/SnXrI1rfIpkSoaW1A=
X-Proofpoint-GUID: ZvdRTJ11uBh-5YkA694A7c-jQ4mlLT0w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150096
X-purgate-ID: tlsNG-16d1c6/1781514793-86F73D75-B5B13013/0/0
X-purgate-type: clean
X-purgate-size: 591
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,kernel.org,xenproject.org,redhat.com,gmail.com,oss.qualcomm.com];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:berrange@redhat.com,m:edgar.iglesias@gmail.com,m:pbonzini@redhat.com,m:philmd@oss.qualcomm.com,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[philmd@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA1A3684F11

We uses C11 since 5 years now, time to
remove few obsolete __STDC_VERSION__ checks.

v2:
- Correctly use flexible array member (Bastian)

Philippe Mathieu-Daudé (2):
  hw/xen/interface: Remove pre-C99 checks
  qom/object: Remove pre-C11 check

 include/hw/xen/interface/physdev.h    |  2 +-
 include/hw/xen/interface/version.h    |  5 ++---
 include/hw/xen/interface/xen-compat.h |  2 --
 include/hw/xen/interface/xen.h        | 14 --------------
 qom/object.c                          | 14 +-------------
 5 files changed, 4 insertions(+), 33 deletions(-)

-- 
2.53.0


