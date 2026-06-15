Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hzQVIz3CL2r6FwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 11:13:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 150EC684F12
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 11:13:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lkBL6qSo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WWj90fXr;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=qualcomm.com
Received: from list by lists.xenproject.org with outflank-mailman.1338068.1599092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ3Nl-00053j-My; Mon, 15 Jun 2026 09:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338068.1599092; Mon, 15 Jun 2026 09:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ3Nl-000514-JG; Mon, 15 Jun 2026 09:13:25 +0000
Received: by outflank-mailman (input) for mailman id 1338068;
 Mon, 15 Jun 2026 09:13:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1wZ3Nj-00050D-JF
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 09:13:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ3Ni-005TKx-S9
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 11:13:22 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a2fc228-e002-0a2a0a5209dd-0a2a4509ae28-34
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 11:13:22 +0200
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a2fc230-2497-0a2a45090019-cddca883bac4-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 11:13:22 +0200
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65F8qtOE2211269
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 09:13:20 GMT
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ete98030u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 09:13:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-9157d38ab37so303950085a.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 02:13:19 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2d9becsm31131680f8f.34.2026.06.15.02.13.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 15 Jun 2026 02:13:17 -0700 (PDT)
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
	4s/yUxjPNLve+3gfnP5xoK2AqyLlEffP2tRAyASu6G4=; b=lkBL6qSoRD/Z6Vb4
	UmY4e5QEW9jJL+nu+BvFJtg72MuG8gYgYmcS0A8Wy8rFkgb6Tk+RRmckjLoaLSUu
	tCYR20xqsqqVjKgDKD/5Fj93ZZLX8Pu4QcZO8gSnWGJZO+ULLRxQHaEp1erwxv9U
	q/79nezxMqieHoa0x8lsANj0hvUVE7M5hiKoYeQI3mKifJysURPq12kOfp6gCCw9
	LuAMLHfiaNGTa9t8FStG+GJxrJkuVJWvkkcFQLIcOSqusxg3gmVwM/SfPr3iJ6aZ
	w9lLfENNC5yufpuatA4xh0r9pJ1zRoyg+OPsR/dZ2rcah5giWf1IXBen5mCfoP3x
	hMOXOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781514798; x=1782119598; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4s/yUxjPNLve+3gfnP5xoK2AqyLlEffP2tRAyASu6G4=;
        b=WWj90fXrXTqSDiVLrIDqhrKqINdBFulrrVebH0Tu/USOSdNlSJz+LOzRrKFbCE2RaD
         6y8ARW+ggE9pZVeyTsviw1zi1oDRUdtzmpJCbh20Zzi5fSJIBHgRbkB7d0LyEn+guG6j
         S5RfjhbLSaCecuPM0t9LRaMNu/r69iFWNyJtxfbpWY2PH+mvPV4C59LKXnRLPVuwua+0
         hsMXWg/STxNDBnMkZRWGArLURDOeU2I/FCgEpopZcD03WONjp/ZJAXzG+hgyxe5kUThJ
         nEQ+bTdEMcxZsSSaEi4jTHgGA7kHB1oar9VCJ6VTYU7ICbXgJOsmjeMTTA17tfE7p7my
         NvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781514798; x=1782119598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4s/yUxjPNLve+3gfnP5xoK2AqyLlEffP2tRAyASu6G4=;
        b=hLSTNq9P/31HAKSlZas7W+PgRblq9Wi0Br9qelyjAoTu3THwOtJizmFfO/5lynQzzD
         ef7rDS4FP7lOZmEab/ByPDXOWQLuzD//9x7ld4uLmkCP6Vk6HMdWuCq14/p3rzPmYF8T
         Fb0rYdk6/uhQ57Dkl0oDHXkNdiJgZoqHOXP/wvwgfrzRwtJntj41i4oTcpg7ErXPgCVe
         5oLX3dQW1WcgUOAeP3U22BsR/er0f92lRJZEUiDAY/p29XO8FhUoR9/tGXwcFBhjtaws
         dTCU/9J6KzDs0r1qgwle2Lp22AL6wAMsZ+HDPA+F2v/tjUMYd2pRwGZ86rlH2jo5L5Ac
         uhiQ==
X-Gm-Message-State: AOJu0YyNfqtdGC29iRdGKF0dYrpf7gCd7NVVmZn4aytT4YgTImW8kNID
	WX3CDxZPWzkf+S2HQRpmwplFnpQPeTWxyjtVhXPbw5o/LrmpbcorRqhdSqR8wEL6Cxig/GLVsWk
	atHBzjopltnkr1+FHiB9c1Wot+kP9/yQURBR6b6K4faUtZi/lqgeVWD2pqVDLJeBW88Rc0wSQKy
	8GsQ==
X-Gm-Gg: Acq92OFTWH3pT3Y1h1F30BIRJ2kPOYxOjsZ6ML7/4p+x6/x0aV+ld/3rYMqwoj4koKp
	y7nC/xiv968U5T9wOX3LEK4HJ4gFKOVcPvZtiJXOg1AcrBkXGyOmJHr1DTEHj2uxkBJP9ucQmtu
	M/P+BhHLu3/FJFtpFens486cSoThfY8k48QmRS7apTNy96n6T5KfIAuv6y1F0UxRIqsDdJP8YjY
	7/StTvpDmowbwIhGSD989tPxJ1jOF+A59gZMCejCy95JkHZIEv5bV004gaB6oveU7SyIFxlllVP
	tlxoJeS8/5nPHNWlsOBekKP5UrXwPrM2em9Y2YFwheFf52CLMax2jcgbTlTpmLVnhDD+umxf5XS
	GrCBWPubCmwhylCtqYGQvAZFltgGnmhzfN2cLVTy/9Ji5ZJX0pTm3KGjrKilRGJ8EB0mbAzDUYZ
	BOWxk=
X-Received: by 2002:a05:620a:3198:b0:90e:2f56:2f0b with SMTP id af79cd13be357-9161bac7a1bmr2185348485a.7.1781514798486;
        Mon, 15 Jun 2026 02:13:18 -0700 (PDT)
X-Received: by 2002:a05:620a:3198:b0:90e:2f56:2f0b with SMTP id af79cd13be357-9161bac7a1bmr2185343885a.7.1781514797978;
        Mon, 15 Jun 2026 02:13:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony PERARD <anthony@xenproject.org>,
        =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
        Bastian Blank <bblank@thinkmo.de>
Subject: [PATCH v2 1/2] hw/xen/interface: Remove pre-C99 checks
Date: Mon, 15 Jun 2026 11:13:07 +0200
Message-ID: <20260615091308.4458-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615091308.4458-1-philmd@oss.qualcomm.com>
References: <20260615091308.4458-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=V5tNF+ni c=1 sm=1 tr=0 ts=6a2fc22f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=mDV3o1hIAAAA:8 a=EUspDBNiAAAA:8 a=vkG9KRslzty0At4LJNIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: _BM02O5aNScGxXlt1PV4VJ0oRwqJhJWi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5NiBTYWx0ZWRfX2KCYL+jQUYIm
 +tDn5f7IZ4SG/f6amZe8A2dw+053NTtODOMJnp+GkRHNxs0TmEkrsSUqvbtAp9qaFepb/4Z9owk
 rrp3cHHjbRdQZ70CS+MW9byUjcbHEWI=
X-Proofpoint-ORIG-GUID: _BM02O5aNScGxXlt1PV4VJ0oRwqJhJWi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5NiBTYWx0ZWRfX059ViOn6NctN
 LPwiAMwZm63tBxNDk0fQSvHYD0saZVXuGjtFLyp3JhWi4L4Ve0kRzxzmRWbcqIWGcDYsTTPucrL
 Zk2u1AjW7GB944SvTpAtkHPCQvCuYMXPmvg64EI7wbJaRVzspRbD0/IKtxfmI5Y+lJ6NEpQTbNL
 8BqX4akQjn/PEoxh2OxUrXPnqzAIwxVjp27pFjglyW2XBq7SAw0jPDmgeolvH65mYKy7vcBtxXg
 aAwzLeuxii6hmrdY83J3W7sj2wYEyhjOSG5s1cIz0hXayPFba/KvU7k1qlIxyAzJkzO4BDQ89I9
 iajaMnIRmOU/+rsWdP7kdz0bOLpY59mjFr85awGa+Uutzh3EjmiKE/C+/UXsVNsRQfjqF3+tXM5
 teXkqzkfVKbo4ETY7nnFHm/83pktK4g0dPDr5Ya7VOmj4OlxacKat41LMjo6g0iVuveBB/dfESc
 9DUm6AGhWgLxsr5yzhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150096
X-purgate-ID: tlsNG-bad1c0/1781514802-40762A53-21FEFE3D/0/0
X-purgate-type: clean
X-purgate-size: 3755
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
	FREEMAIL_CC(0.00)[lists.xenproject.org,kernel.org,xenproject.org,redhat.com,gmail.com,oss.qualcomm.com,thinkmo.de];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:berrange@redhat.com,m:edgar.iglesias@gmail.com,m:pbonzini@redhat.com,m:philmd@oss.qualcomm.com,m:bblank@thinkmo.de,m:edgariglesias@gmail.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,gnu.org:url,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 150EC684F12

We mandate a compiler supporting C99 since 2019-01-17 in
commit 7be41675f7c ("configure: Force the C standard to gnu99"),
thus supporting flexible array members [*]. Remove what is now
dead code.

[*] https://www.gnu.org/software/c-intro-and-ref/manual/html_node/Flexible-Array-Fields.html
Cc: Bastian Blank <bblank@thinkmo.de>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/hw/xen/interface/physdev.h    |  2 +-
 include/hw/xen/interface/version.h    |  5 ++---
 include/hw/xen/interface/xen-compat.h |  2 --
 include/hw/xen/interface/xen.h        | 14 --------------
 4 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/include/hw/xen/interface/physdev.h b/include/hw/xen/interface/physdev.h
index f0c0d4727c0..ca2bcbfd159 100644
--- a/include/hw/xen/interface/physdev.h
+++ b/include/hw/xen/interface/physdev.h
@@ -283,7 +283,7 @@ struct physdev_pci_device_add {
      * First element ([0]) is PXM domain associated with the device (if
      * XEN_PCI_DEV_PXM is set)
      */
-    uint32_t optarr[XEN_FLEX_ARRAY_DIM];
+    uint32_t optarr[];
 };
 typedef struct physdev_pci_device_add physdev_pci_device_add_t;
 DEFINE_XEN_GUEST_HANDLE(physdev_pci_device_add_t);
diff --git a/include/hw/xen/interface/version.h b/include/hw/xen/interface/version.h
index 9c78b4f3b6a..2f183c3efd4 100644
--- a/include/hw/xen/interface/version.h
+++ b/include/hw/xen/interface/version.h
@@ -77,9 +77,8 @@ typedef char xen_commandline_t[1024];
  */
 #define XENVER_build_id 10
 struct xen_build_id {
-        uint32_t        len; /* IN: size of buf[]. */
-        unsigned char   buf[XEN_FLEX_ARRAY_DIM];
-                             /* OUT: Variable length buffer with build_id. */
+        uint32_t        len;    /* IN: size of buf[]. */
+        unsigned char   buf[];  /* OUT: Variable length buffer with build_id. */
 };
 typedef struct xen_build_id xen_build_id_t;
 
diff --git a/include/hw/xen/interface/xen-compat.h b/include/hw/xen/interface/xen-compat.h
index 97fe6984989..582c0182367 100644
--- a/include/hw/xen/interface/xen-compat.h
+++ b/include/hw/xen/interface/xen-compat.h
@@ -24,6 +24,4 @@
 #error "These header files do not support the requested interface version."
 #endif
 
-#define COMPAT_FLEX_ARRAY_DIM XEN_FLEX_ARRAY_DIM
-
 #endif /* __XEN_PUBLIC_XEN_COMPAT_H__ */
diff --git a/include/hw/xen/interface/xen.h b/include/hw/xen/interface/xen.h
index 920567e0062..a6f4aa61993 100644
--- a/include/hw/xen/interface/xen.h
+++ b/include/hw/xen/interface/xen.h
@@ -36,15 +36,6 @@ DEFINE_XEN_GUEST_HANDLE(uint64_t);
 DEFINE_XEN_GUEST_HANDLE(xen_pfn_t);
 DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
 
-/* Define a variable length array (depends on compiler). */
-#if defined(__STDC_VERSION__) && __STDC_VERSION__ >= 199901L
-#define XEN_FLEX_ARRAY_DIM
-#elif defined(__GNUC__)
-#define XEN_FLEX_ARRAY_DIM  0
-#else
-#define XEN_FLEX_ARRAY_DIM  1 /* variable size */
-#endif
-
 /* Turn a plain number into a C unsigned (long (long)) constant. */
 #define __xen_mk_uint(x)  x ## U
 #define __xen_mk_ulong(x) x ## UL
@@ -986,13 +977,8 @@ typedef struct {
       ((d) >>  8) & 0xFF, ((d) >>  0) & 0xFF,                           \
                 e1, e2, e3, e4, e5, e6}}
 
-#if defined(__STDC_VERSION__) ? __STDC_VERSION__ >= 199901L : defined(__GNUC__)
 #define XEN_DEFINE_UUID(a, b, c, d, e1, e2, e3, e4, e5, e6)             \
     ((xen_uuid_t)XEN_DEFINE_UUID_(a, b, c, d, e1, e2, e3, e4, e5, e6))
-#else
-#define XEN_DEFINE_UUID(a, b, c, d, e1, e2, e3, e4, e5, e6)             \
-    XEN_DEFINE_UUID_(a, b, c, d, e1, e2, e3, e4, e5, e6)
-#endif /* __STDC_VERSION__ / __GNUC__ */
 
 #endif /* !__ASSEMBLY__ */
 
-- 
2.53.0


