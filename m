Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1uUDNZGcLWq4hwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 20:08:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3B467F439
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 20:08:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HrainCtg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EVR16Ci6;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=qualcomm.com
Received: from list by lists.xenproject.org with outflank-mailman.1337473.1598796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYSlQ-0008Mf-EI; Sat, 13 Jun 2026 18:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337473.1598796; Sat, 13 Jun 2026 18:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYSlQ-0008Jw-76; Sat, 13 Jun 2026 18:07:24 +0000
Received: by outflank-mailman (input) for mailman id 1337473;
 Sat, 13 Jun 2026 17:51:58 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1wYSWU-0006yw-MW
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 17:51:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYSWT-00D7c7-Am
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 19:51:57 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a2d98bc-bab6-0a2a0a5309dd-0a2a45058dac-0
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 19:51:56 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a2d98bb-aaa8-0a2a45050019-cddcb4838124-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 19:51:56 +0200
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65DHodtf3465308
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 17:51:54 GMT
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryk69pbr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 17:51:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-918622c3c7bso151353985a.3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 10:51:54 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26f23fsm17139643f8f.9.2026.06.13.10.51.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 13 Jun 2026 10:51:52 -0700 (PDT)
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
	:mime-version:subject:to; s=qcppdkim1; bh=DPZ8Rdj/aNualg/exgRx39
	JnRnR+j66FFS+dq4fFEgY=; b=HrainCtgQDotbWTnLbxw/OEs4lNg+HjU/RyTZn
	fDpGddX+yAoYJa8iEWkcgLq7ErpnpDMuRRE5nwMKNkUGW+IvFlEYEVm3n7nBe/NK
	fHud4j8NiQst/O4defc6sDeqz1wrr+QTK8ELEPoR0LtfqjoNi6kkQ9zG/A0WUOGa
	4DRUnQEWrQmGQZ8PvOeagn7Qhf1lIY1TfCO2KT88FTwghDkGwUU92Cbg56LVEdTW
	3DjXN5Z1H0yozAc9tGbimSkbdaSoy+3zpN/afD0HRPo+dZ/qAD3d7OBuc27SNQQz
	HtB8Y2QVfGFb85wHwd98B8lLHpFwGwaXURAIvm3UbCiUcFRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781373114; x=1781977914; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DPZ8Rdj/aNualg/exgRx39JnRnR+j66FFS+dq4fFEgY=;
        b=EVR16Ci6TbHQW3c/FxGQn+EAVX9/wDQnI68WzkHHxQBTJkOozBNuHX0brD3XZ+DCjq
         bRQ1op8rdjXWIqpA/uO4zSG1z3VOA+UaLr/8ApJTM1n4Wyi6CvUIwPYLTVKHcOdqSbHG
         0anEQmELM9+e2JimFm6Jm4+LuhXB1NE2QgUrnmLLjgJIbyeZndCMezpIxanPZMJVrRE3
         e0nJdujC7kLAXVf1ZPhKH/pNjxa97bvbUFpLTbSZtkrgrWVnnqXGBMalWUcSg05EEzXT
         FxKwe9nNzzkJFH+QZLCcbYJkeP0mTdRs1VxxAG0IV+HcMFJLWsYZaQI+aFTWDCpB/4eI
         W96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781373114; x=1781977914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPZ8Rdj/aNualg/exgRx39JnRnR+j66FFS+dq4fFEgY=;
        b=cn1TlZH2kelNmQNylp/C44AqhsPtuJI9vXf2D15u2WgYDl20lLic23I6bmwLXWFJss
         g60ZeF0YRFjh4kih1NTukWnrBv1F/ELYl44D/yAf7OISqn2v527i13/ynW9NnTIOKLaz
         804RgfJLJECIl1enzV0LbQSee8J7pZKQ3F7M8UmWSB7q9RsLVsOEhPHIgDeI/rgML3p9
         +Zn8g6aoQc7+UOmSKiKefIKpdp+4GCe8bnSSEdPy1eF91Sh70V+B82qMXTD7jvi9Xc9K
         IrKalwNAa2xOmoKAaWR1n6gVBDjq+7eaLj9K46A+2m8TDB9V4fD5YNc1CL0gsK2iZ1xR
         oQ5A==
X-Forwarded-Encrypted: i=1; AFNElJ9JX3544ZkjsVOKZuy6vDK317CrAewjXYAjCyTvojLxH/hiz2tSAQZD7BaXiCgpVjXeSOnKhLSgk6I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4Q7Yf8t6KSnoyBd+qjORBCMJEgScNd3GC15LnVw1fXxcveHcd
	urX6kRZAqdpQ5nFihFUFhL/f+YFE2ChSKsAJXn4B1P2+6EIMKDu3s2LkUpDJxoydccZ1o1RwAQb
	PKC3QHzrKhM1O1DGwuVcwfy2uhY+GDWxkbrSobFYB9SuHbbDYbwJ/A43tQIvUweWP0JOwfg==
X-Gm-Gg: Acq92OH/r2wh11w1A/jpQzCE3er3hNy+BCoj21cO7cUNjetQ2IvTsrVb+Z04SFfE1uf
	pdf5awJvA1IfZI7jATv6fBdVyc/CIKVORgNJZ1EeabdTEQZXDXKjiDMYnRkGMap0Ox32os8X+qU
	bP/cUQpNv5379ifozRRzNqpYjGt9UXAPX8iyqbwRfBERhL/uNoORHYKbLqjxKfY1u1XhWVl746o
	7oBypIcOmRnyAY/Jaw9du3Q/vJzM9N34azg2aFsJ/qdI4bimV1z760B0Lyhj6gaBP6PLoCT96Ew
	iJ38B1tcKJeSy9D8ow3xI2hsnY17aeDHr1vhwl3WQ0JSov7ElJJ9nSCyOVYKJ84zHq0Le2wWZ7i
	aVgedvoG2VEPcIxR3FHkducUbNKoluZDds9R+WIFiGK2bfHNnTnWvB1Vp3/rLyF3Z2yUjRM5kt0
	D7/qR1qdpV
X-Received: by 2002:a05:620a:31a1:b0:914:d348:fd63 with SMTP id af79cd13be357-917f1865d50mr751744385a.50.1781373113994;
        Sat, 13 Jun 2026 10:51:53 -0700 (PDT)
X-Received: by 2002:a05:620a:31a1:b0:914:d348:fd63 with SMTP id af79cd13be357-917f1865d50mr751741085a.50.1781373113537;
        Sat, 13 Jun 2026 10:51:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        xen-devel@lists.xenproject.org,
        =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
        Anthony PERARD <anthony@xenproject.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 0/2] misc: Remove pre-C99/C11 checks
Date: Sat, 13 Jun 2026 19:51:49 +0200
Message-ID: <20260613175151.1357-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDE4NiBTYWx0ZWRfX5pgA7XqHJJHj
 ubRgTbVqr6Enuob20ya70YcrF0rop6U0e6f2O0dKHFwCh1JoXPQvCFr/6kRohWJ0OaVjKqszxn4
 ugrtYdR1F9FFvj/pEY5zrlrpVkbli0U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDE4NiBTYWx0ZWRfX37AJ77pt2oM+
 YSFd/9lYKPYUT7Z/FHjUZyqn8SuXfMp/7sQrWkJRtnqZqE7pFAhRN5vGU1OrGbLtzZ88EkcDuTx
 O0WfxJ4CYMlkqGAz3L/zxt2JUb7VFYLOXOPupHunIJnipR8Rvp9ikNUOhXLJaudb3qS63wDo+5R
 8WRs0NyasXieAGHHy8CeBhVRrrVybn/BbdTZ2uTRZYh6xY/Sa+FhvwIHqTdKAlFHIhdUB7/WjeN
 MrlCH7yBSFeCK1Q6G1wUJBQxs0CRHGQ2pbUUYf0oYdC3bNr2WLZgKlVcCgl0FqvXZ48bws2Y3wt
 yWzdicc6dyKyqZ9Z4s/PSz1FSad1MuCcInq81RVC0vz4YJTPGrraYOITi8Db+S8vbRMio90h4P5
 Pj1OazEeCmP7iHXLLiaFkRrAcWA8+b7ugBtimsEJ6atHlKivQNT7fwbEz0+qzDeohmQYpvDNba7
 oEi0SOojQ0DmlyGBXPw==
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a2d98ba cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=2Kr2Ceio6qlyrOmMFMIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: H7ansbH3wLjN_lftXDXOu5IxK3Co4E24
X-Proofpoint-ORIG-GUID: H7ansbH3wLjN_lftXDXOu5IxK3Co4E24
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_03,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1011 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130186
X-purgate-ID: tlsNG-c201ff/1781373116-E1798443-330903A1/0/0
X-purgate-type: clean
X-purgate-size: 535
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.32 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.xenproject.org,redhat.com,xenproject.org,kernel.org,oss.qualcomm.com];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:edgar.iglesias@gmail.com,m:xen-devel@lists.xenproject.org,m:berrange@redhat.com,m:anthony@xenproject.org,m:pbonzini@redhat.com,m:sstabellini@kernel.org,m:philmd@oss.qualcomm.com,m:edgariglesias@gmail.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F3B467F439

We uses C11 since 5 years now, time to
remove few obsolete __STDC_VERSION__ checks.

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


