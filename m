Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r2MxE0bCL2oFGAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 11:13:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D36C2684F1D
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 11:13:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HQ4JlZ+9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OelKamK4;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=qualcomm.com
Received: from list by lists.xenproject.org with outflank-mailman.1338070.1599100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ3Nr-0005KX-1g; Mon, 15 Jun 2026 09:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338070.1599100; Mon, 15 Jun 2026 09:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ3Nq-0005I8-VF; Mon, 15 Jun 2026 09:13:30 +0000
Received: by outflank-mailman (input) for mailman id 1338070;
 Mon, 15 Jun 2026 09:13:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1wZ3No-0005GT-S0
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 09:13:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ3No-005TNK-8c
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 11:13:28 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a2fc235-2eae-0a2a0a5409dd-0a2a4508c45c-18
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 11:13:28 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a2fc236-63b5-0a2a45080019-cddcb483c3c2-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 11:13:28 +0200
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65F99Brk035442
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 09:13:26 GMT
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etegur0ma-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 09:13:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-9181f3cc5ecso342214285a.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 02:13:26 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922031b7d2sm252204735e9.5.2026.06.15.02.13.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 15 Jun 2026 02:13:24 -0700 (PDT)
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
	MF2aozQ8nBaPhoD/R1S5ChTpTVtPNvgch2k7hu45wMU=; b=HQ4JlZ+9iI5Pg8gm
	5OExKe8ys/F/dP7MuxCzdbLqKeA9uVUWbRX/KBfWG/KuBcDVHLrlJjK7jmDRdkyj
	c4OeHQDvet/PAnPzGK2T8foJ9FOrw9OBkE2WGtjgUe+BRHTv/Erj3lzc4BgSPRef
	6rwYzHf3u4ksAB+QYwldlejdoPnQ3NPU6bERbGNtqH8SeDxn2xV6ZSDpw9oQg7ad
	sOqs6RxZ+wTL4agvPmBQ5VNEzPwZYkdWN80siVlKL+OJ1pSgwdMqb5DmUARReFGy
	E9VZ4fn8ryd4Jk2EVvuU+vRU1MHKsYDfFH2/zwoTMar+j/AIspZ6ydBr1N6BaNdl
	tvmY7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781514806; x=1782119606; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MF2aozQ8nBaPhoD/R1S5ChTpTVtPNvgch2k7hu45wMU=;
        b=OelKamK4gSQVQJOfqhlXYin471fqi61vduthK6yGTjFI1vWJ+BoFdMJ0J9DDh212sW
         dabApBWcPNe8Tz0haG9/4SGhHS8zTkgffFBjm43ZfxW57JNhHFzRZJGZY+jOplVpHab5
         ToEC31g3CSOj7ZUimaw3q5N4K6xYy6Zg1DSX1wnnQwAziuxymC8AVUK6mBnybo007Cyj
         8v1AUXWHlEaOPoQt87lNIiXYODhjZNzmtdZR7vGfdDJDeJ9r2WTE0S8XXpRX8I7aZcZK
         ykDfNDwq5MDojaR2zY7qydKxHUCEjDGpNqV/W7irjxcVA2mwyhX2mp6Y5xpAWGzggfTF
         CCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781514806; x=1782119606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MF2aozQ8nBaPhoD/R1S5ChTpTVtPNvgch2k7hu45wMU=;
        b=Ryzsfpxxg4pBpiNgByUpK3hEx7aqyOJtUo6G3r8FUcWCktqEr6i3ZT61UgGeeAElZp
         FakvnqMdwNnEciEY6+1TlWWlpSGrerpO64W5lUWDBkSz82dbnG1WU01o3tvxECVBO+dz
         gozqQGo8NDIp4VDkZAHziHBNApWxzOR9r1Mb/UuxjTH92fhlDtGJ47+goAGWEQvV8Kl1
         EFW+nUXcZR+DKCOvvQWurrHevcT5XarD/hWsnInAruhbMiGuWVXBcF7Rr64/jBnr/KO6
         GgsQnrvqFF12LXd3v5/kf/Yr/HYRHCWfSiYAKEC25eiqHbxamwCf0tH6/Y7tVB5UACtC
         mSRg==
X-Gm-Message-State: AOJu0YyvyYfhRvfJnw5lAzhxU9J+1/U3ir1KFdE+0w/BhRwj506Acapw
	+psg3OzMx6tWMK1uSmBKKyQQ3KXw7RnZrDI0ZLfZJg3o6++2M7gT+rd+1dKWvpOijGRNFUac4vz
	acwkJkE7nx/iMXe/tb5VQaDW6NuVmB1a5zPv8ZEhRa4lxO2ml6g0hTF8WiJtaWTSGX7/38Q==
X-Gm-Gg: Acq92OHVARhS1gi6TGvqQMDKrlGGxwNYSyMzkmnlBDbTYZ8MQ6N7hyVMeuA6ipjsL8b
	qUxRq1usNH4Lw+86p2kPU7suKj64hGua5P45G42xBSjU8RkZ6qZbhNepijSIix4SU5yR3NxNoNI
	+gSBZ81BiCpmBgUT9mEUuEgfF28p0/SUEzzN68TSC7nBsAUMieQgp23nCtc9C3k/c2CgoUnq7tJ
	5QryowCJuou6jbLYYV1jtbfKOgqD7P2wgNY8HQBMW+RBt/uK9uhO2TNPiDfd4Vg+NMNgxpE6d2D
	NYhoOnKN6Gy6gjWlhTbhiYAjBPZUdh//EmqQm3aRpxbNU67NUXmmEJVxl4Qfq3WX4DMcH0iBoFq
	+xVj+LPREXsJ/mewiu7/JznyrYMm/G53FkBw8BOdn2HwZZGPU+ub3yUFMG7vjImzXZp049iRaeP
	KpLKg=
X-Received: by 2002:a05:620a:2681:b0:910:c1ba:91d3 with SMTP id af79cd13be357-91619f7d7b3mr1735524185a.45.1781514805749;
        Mon, 15 Jun 2026 02:13:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2681:b0:910:c1ba:91d3 with SMTP id af79cd13be357-91619f7d7b3mr1735521085a.45.1781514805350;
        Mon, 15 Jun 2026 02:13:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony PERARD <anthony@xenproject.org>,
        =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
        Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 2/2] qom/object: Remove pre-C11 check
Date: Mon, 15 Jun 2026 11:13:08 +0200
Message-ID: <20260615091308.4458-3-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615091308.4458-1-philmd@oss.qualcomm.com>
References: <20260615091308.4458-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5NiBTYWx0ZWRfXyOx5VSi6UrkB
 /xFQFQiZASvi1SwE8UkH/zQfhhV8tQNF3cPTSWHrZ/9dc5orweL+Po4wW8hsduCzRg3HK1aq+2J
 KWjygEPwBlT/ixO9qMZiy2njjbDTPe+kmhhmMP774Go8ILJQzrTMXJNjrlB/aGcXCTh/FVxUaC2
 x9LHdhYyeO/tzlxxXhgb7rbmgwmhOV4jd09HzcrshgOWRkTJXbZjX64OJhvj2n4jyKxJYd3lnLI
 nHl6KOVcyQV6Y7t8w6eWevL8r68UNMzBvPnkcmU67Ilrz+fOPwSaK/7iqh12QhGOYySh5UXBe0j
 Gi0QW+8Qu55TTSCUjIq2Rr/Ys/B6E148UOOdgk6XQhEeX23DXo/PS+AWQvdas0g9HMOUG2ZbDMa
 RaMfmkLYVDCU75i30OENDVhimPigt9jFSp22HEHYTbMRpcLE22aE94vonBWCju4/NT5TgEPOczw
 msJzwBiLXjgPzm7+Y3A==
X-Proofpoint-ORIG-GUID: G0HeaHXiKjZtYVECWpWEtRjdFWkuUjOb
X-Authority-Analysis: v=2.4 cv=HMvz0Itv c=1 sm=1 tr=0 ts=6a2fc236 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=_WKHBmQO-qgaVRkQabEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5NiBTYWx0ZWRfX1VJKcirxZJVn
 oVkzV7woQPtcB28SWfJLJfInqqfU/s2IkcCn4tkEN1aSR+Cbmt6RtFJnwANK++HS5quZyFDv9Yt
 Ys5k0X6lSMTyt3ndwbuYpqqjfwWPxKE=
X-Proofpoint-GUID: G0HeaHXiKjZtYVECWpWEtRjdFWkuUjOb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150096
X-purgate-ID: tlsNG-c1860d/1781514808-B7D7BDB1-7697760A/0/0
X-purgate-type: clean
X-purgate-size: 1438
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
	FREEMAIL_CC(0.00)[lists.xenproject.org,kernel.org,xenproject.org,redhat.com,gmail.com,oss.qualcomm.com];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:berrange@redhat.com,m:edgar.iglesias@gmail.com,m:pbonzini@redhat.com,m:philmd@oss.qualcomm.com,m:armbru@redhat.com,m:edgariglesias@gmail.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D36C2684F1D

We mandate a compiler supporting C11 since 2021-06-15 in
commit d22797ce36a ("configure: Use -std=gnu11"), thus the
max_align_t type definition exists. Remove what is now dead
code.

Note, C11 provides aligned_alloc(). Using it is left as a
future cleanup step.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
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


