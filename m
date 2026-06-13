Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dQ9aFo6cLWq2hwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 20:08:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0869867F433
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 20:08:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SCt2Chai;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EPNaAXqB;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=qualcomm.com
Received: from list by lists.xenproject.org with outflank-mailman.1337477.1598804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYSlQ-0008T9-QR; Sat, 13 Jun 2026 18:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337477.1598804; Sat, 13 Jun 2026 18:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYSlQ-0008OT-LT; Sat, 13 Jun 2026 18:07:24 +0000
Received: by outflank-mailman (input) for mailman id 1337477;
 Sat, 13 Jun 2026 17:52:12 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1wYSWi-000706-8O
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 17:52:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYSWh-00D7c7-LQ
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 19:52:11 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a2d9865-bab6-0a2a0a5309dd-0a2a45089978-46
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 19:52:11 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a2d98ca-63b5-0a2a45080019-cddcb483c258-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 19:52:11 +0200
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65DHodth3465308
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 17:52:10 GMT
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryk69pcb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 17:52:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-9158e75cbc0so312389085a.2
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 10:52:09 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2cd6c2sm17546743f8f.30.2026.06.13.10.52.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 13 Jun 2026 10:52:07 -0700 (PDT)
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
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RJX4gaIJ647Q/seQvGYx5bjkcSPLY7cILaScJOCZLnM=; b=SCt2ChaiM2dHUs+c
	ZO7j3HLVhdtPpUFlMD3JN0/q0bba6a3C9FjAzUilu4IoG8v5GZ1EDGfpI9TveAbl
	EBk+3cd/xyzUGLHdBrdrWPgBcRvFbMY3QQKB3modneVMDmZf167na6UTQvyky4uH
	C+CBRNVdI8H3j9dTo5x28YRIsxe3UQJFnr8y5MN9hs5oq4k2ddG2K7H1aOJOYi96
	iQLX/dKTOU/luGzqzlXq5Zyu6CyCf6BFpJY0vJr4vOi6NSgiIx2RI/dBO4oGkU4W
	gXLkGv75tp3a699I6NZRd4Ftf5BVQq/nVGXQQaOHYixGViJCjq+/9cBEFq7u+CD5
	pL3LFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781373129; x=1781977929; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJX4gaIJ647Q/seQvGYx5bjkcSPLY7cILaScJOCZLnM=;
        b=EPNaAXqBS+a6mTk8LUmyZ+5DeOcEKpqdv2Q8mdjqBDLwNUG0Mrdzkfd46yy+Plb7b/
         JTDQeJUJ0I1wQgAP4syn8CtwQvg/xJL/tizJTTsmki6UTeC4vDHqZTi4hvBqBWrDpUEV
         DaeXJLNiCTWFpy6nfqyqqCHKRU2byzz8cBk2fIDQC4vSZHgDJ/nqz/6chuOyjNRjHYNA
         26UT+nrD1TWtWg2E5Kxw9V7BjvpxKc38ZgbUBZXdspOKkkir0T+M+2Z9XIsueOQyomUU
         ZoqI0EnzCGQQ/JnENRf0HEQ7Meelt4xPHSm/onwa/is1SINB6/G/yfwNPCEaaIwmEzaD
         qHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781373129; x=1781977929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RJX4gaIJ647Q/seQvGYx5bjkcSPLY7cILaScJOCZLnM=;
        b=VKBfpEvzq1E2LHKCut9i32K138eLoDRhy9hVATng12OBN+MrJj4cU+Qdp0yoZAvOcp
         OM0jk7rsEZkdH23OWGt1cftq8uZCVSEkMfNkb8sdzOTcHewWn+K4H8DJfcJ26oBMm/h/
         zSYTrofVirFiANByt0Huk/03aSOFFU7orJBBYTAMg8X3+UnFcdSIPsKgMoSTknaSXL1U
         SWiD60lhduBSnNmJg2MIPyRwwNyz7DMfSsFRNchYEqipraNqantgGEmyBWWaxwKE1SfL
         nFTsVy03NfbhurHvN5ARmG9sCs12lqnV0D7GQTOcaDFhRvKawwylhuV/51uV1DLuMqpA
         R85Q==
X-Forwarded-Encrypted: i=1; AFNElJ9KgtJYdRMoU41M9XtcD11hkqqK1MPq/6l6dhfAp6VwNtAOxacw65Odg/87G2Bqr7SdpyBJs/m0pzY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzeUH0OxWD4NmEN2fbKhU6eVxq9PvlDtyAXzKdZWfkIV+Q2vdZY
	CzVPZ5Awu7NCo7AceNwb8rYJeiOvMF7aQZD7PuoHNeaQyjniqY0X1sScViIFRrWC1wGo2hzSAba
	gF9BuCRYbJiVTNNWLKe3AKhDTI0/NbO4WiO/rIsjV1a87wXA4lk3xlrbXKr1ldpbZsrVDpQ==
X-Gm-Gg: Acq92OGXcUj8k/Lsme7Bu5Uxkjrrle3WfOigjzXqKAot1WPdOn54vd7IHcbIB/7Cejv
	lh9XKcZ+i9yGUF7lnoZpqYltjCvGZY4pk1SACGL+GTbeeWhT86+W0VeTmRETLyllrVgMQkEYEbP
	Rlkp5ptk3LUfjYXSFpIhhqywYhe0FOzVvBxUbsz2Dq1tk1GOfcPilL/0cIzRxAqvl0H6sT85fee
	y3S2B/w22srMYsNvRqXJ8axMv6aZHGQsBQQg/2PBTCLC2i/TSTv2jpgFSgN3M11RlbTpa1gf71l
	1bzpHUCOIma2iy7Snvm7e5/yQoH8Lc1wzCMtrONOBPXpyc9oCMZ/MbMUECOXojh6hkxCsBDd7c4
	0G2oNWlJm8raFl8OxdZUIctne/BgIsU5+gIrWp54/Jap8TbsLXqn6mCU/gb3hHa/4YNgyRaAb/k
	H1h/UKzQFS
X-Received: by 2002:a05:620a:2406:10b0:915:7e22:6f1f with SMTP id af79cd13be357-9161bc23806mr879617185a.22.1781373129205;
        Sat, 13 Jun 2026 10:52:09 -0700 (PDT)
X-Received: by 2002:a05:620a:2406:10b0:915:7e22:6f1f with SMTP id af79cd13be357-9161bc23806mr879615485a.22.1781373128770;
        Sat, 13 Jun 2026 10:52:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        xen-devel@lists.xenproject.org,
        =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
        Anthony PERARD <anthony@xenproject.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 2/2] qom/object: Remove pre-C11 check
Date: Sat, 13 Jun 2026 19:51:51 +0200
Message-ID: <20260613175151.1357-3-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260613175151.1357-1-philmd@oss.qualcomm.com>
References: <20260613175151.1357-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDE4NiBTYWx0ZWRfX0n2g/o6hq+OT
 nRG09ctaVzWtnRMUF4qy5RqAMkJgaNxUSbSWkIaVpX5SinDS7mERNQ9T1Dje7iSomSXlhEte11x
 3t98MhXpyY3G2LSAxYgfJIWO+3IRmaE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDE4NiBTYWx0ZWRfX+o/ZfaiqJ7TP
 CPfaL4gkT2gXGJaW9+Qz3Gp2TtzoGtA8d2cQHluc4b/vng0bwzESV/oPpzbnkXqke6gVqGalhyB
 82DhHtii2Xo0ZUYgu1Dbx0OnXAYR7n4sNpEuXvs7mCeMOguxNHvkL/1RmgDwDN9+cyMMXAGWTN6
 mElTOcHi6QBzfsHNPB65xbnWdzKGFAqyi2tmcfq6uXEkYVzXtO5gyCyasoBp8gI4i6XTIsEwlLv
 iwyHJ6UmcLM4bltG6tLMtkgEGkLI7D5v4VimqAIqInoLRFAbIS4ivs9EE5/sqk1pDzLC9JJcRU0
 F8+Waw+DZhFihWJk5Jw/Um4gSi2BmJaNBj2c7WMpeqm8Q2agGz2QZzqqsv23rmx9far2Ws4pLWF
 yiR4WM+GtPuhKt96amV/l1IHQuMgOAN/z/sepLob7N7BEqDrmQ4S6SbJu3QktB0JfKp1xrF/y7/
 aADlbbNaXFhj1ZbIWXQ==
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a2d98c9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=1Y-dVNoqs5V1GzGJ_nYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: ATV4eOXpD8K3nS_f_faI9Nybz_ygoro2
X-Proofpoint-ORIG-GUID: ATV4eOXpD8K3nS_f_faI9Nybz_ygoro2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_03,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130186
X-purgate-ID: tlsNG-c1860d/1781373131-C4A7ADB1-025442B8/0/0
X-purgate-type: clean
X-purgate-size: 1303
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
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0869867F433

We mandate a compiler supporting C11 since 2021-06-15 in
commit d22797ce36a ("configure: Use -std=gnu11"), thus the
max_align_t type definition exists. Remove what is now dead
code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 qom/object.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index 0ac201de4c1..f79b2cf3618 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -675,18 +675,6 @@ static void object_finalize(void *data)
     }
 }
 
-/* Find the minimum alignment guaranteed by the system malloc. */
-#if __STDC_VERSION__ >= 201112L
-typedef max_align_t qemu_max_align_t;
-#else
-typedef union {
-    long l;
-    void *p;
-    double d;
-    long double ld;
-} qemu_max_align_t;
-#endif
-
 static Object *object_new_with_type(Type type)
 {
     Object *obj;
@@ -703,7 +691,7 @@ static Object *object_new_with_type(Type type)
      * Do not use qemu_memalign unless required.  Depending on the
      * implementation, extra alignment implies extra overhead.
      */
-    if (likely(align <= __alignof__(qemu_max_align_t))) {
+    if (likely(align <= __alignof__(max_align_t))) {
         obj = g_malloc(size);
         obj_free = g_free;
     } else {
-- 
2.53.0


