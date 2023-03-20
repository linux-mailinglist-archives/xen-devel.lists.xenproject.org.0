Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C64C26C1BBA
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 17:32:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512003.791541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peIQo-0001UB-Jq; Mon, 20 Mar 2023 16:32:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512003.791541; Mon, 20 Mar 2023 16:32:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peIQo-0001Rt-Go; Mon, 20 Mar 2023 16:32:22 +0000
Received: by outflank-mailman (input) for mailman id 512003;
 Mon, 20 Mar 2023 16:32:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GPvh=7M=list.ru=valor@srs-se1.protection.inumbo.net>)
 id 1peIQm-0001Rn-OM
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 16:32:21 +0000
Received: from smtp42.i.mail.ru (smtp42.i.mail.ru [95.163.41.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7deb5f4-c73c-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 17:32:19 +0100 (CET)
Received: by smtp42.i.mail.ru with esmtpa (envelope-from <valor@list.ru>)
 id 1peIQj-007BOZ-2A; Mon, 20 Mar 2023 19:32:17 +0300
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
X-Inumbo-ID: c7deb5f4-c73c-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=list.ru; s=mail4;
	h=Content-Transfer-Encoding:Content-Type:Subject:Cc:To:From:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=xbcTXE0pjOZFNMucyDsOoThI2mQ4UaaP2AkkM/sHP04=;
	t=1679329939;x=1679419939; 
	b=AK/tJ41eQWzvTBDSe5b2lYr6ivhl0gn7o79xEAtE22V8isyitYuHfHqKuPG55bxVrgetQuDylE8VVO5/HjPi8Vm4yB+tC6SPPW2zQ/1to4f4Vf3zqTC1+mScV3wZyxQoLLDS6oi2G4jfLZG+SzvfOPYU+BYBt91paIuJiMJ1fbTN2+Q1Rnn+a0fgfOz//UVUZPlQYkkhcLBeVWHmr0F+HSSFFfuJo1ZQYfp/kTF1uzpG6dYPRLyAUo9+9wik9dosazyvl5KGjHSFJdJdh6LkEHAURWb87rcmvHxrbH6Yip6sq7y0snc7Ou621T0sSx5euYrMTsy7K/nqd2cQj5r41Q==;
Message-ID: <e047a7a7-2e45-48de-2cb4-69001e95e1a8@list.ru>
Date: Mon, 20 Mar 2023 19:32:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: ru, en-US
From: =?UTF-8?B?0JrQvtCy0LDQu9GR0LIg0KHQtdGA0LPQtdC5?= <valor@list.ru>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Dmitry Isaykin <isaikin-dmitry@yandex.ru>
Subject: [XEN PATCH v1 1/1] x86/domctl: add gva_to_gfn command
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp42.i.mail.ru; auth=pass smtp.auth=valor@list.ru smtp.mailfrom=valor@list.ru
X-Mailru-Src: smtp
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD995AAF696F102E30FEC96FAA707C7F0DB2A515A2F6889BA781867C24CE74E72BB5FE18E9CBFBE7C070CFF8D46FA89665632B1D9D2BC62A6DFA8DEB5A5B6346E81CEE4813122F9A0DF
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE709CF9AF650BAB6C1EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637539FDAA91738A5BD8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8F0687002353604AEF2168676750B165B6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE74CF195F1528592878941B15DA834481FA18204E546F3947CAC824117EA787438117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE70BED4008E0EA3A469FA2833FD35BB23DF004C90652538430302FCEF25BFAB3454AD6D5ED66289B5278DA827A17800CE72006BFD5E60758D0D32BA5DBAC0009BE395957E7521B51C20BC6067A898B09E4090A508E0FED62991661749BA6B977358F9E841AEAEC4F2CCD04E86FAF290E2DB606B96278B59C421DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B6936FEDF0B958011F089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-B7AD71C0: 4965CFDFE0519134C1FE400A9E48C5401DD40DE57556AFB266D16FC5F53507A1816E0A2A8F779BBED8D40077074E805C66D16FC5F53507A117535B0CF9F6D0C3EE9D5CB6078CC77CC508C16425419F6C71B50B874F048A7C
X-C1DE0DAB: 0D63561A33F958A59D2EB58E5D8A60CE1FF0A101C44190A85A203102514DED5DF87CCE6106E1FC07E67D4AC08A07B9B0FE4D9CDE3FF759CF9C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A0997E3FB2386030E77
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34B7CBFF60649FF266A548857E8CC46621F9A788114E5F7F11E3C20DE73D582431FF638E19F50703AE1D7E09C32AA3244CF53DB9EFEC813F95E6F722709734F021A90944CA99CF22E3ED98077840A144B9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojbL9S8ysBdXhHeifJXYUkcH6MIPZIPUpX
X-Mailru-Sender: 6C3E74F07C41AE944C83DF7F8E76CAD95376FBB362B0C406BEA0EE2103C1A06B5599D909BD042F55671A0538F0E0E4B8C77752E0C033A69E86F8B8EC1BECD1EECCC3E8BC0E932F7CB4A721A3011E896F
X-Mras: Ok

gva_to_gfn command used for fast address translation in LibVMI project.
With such a command it is possible to perform address translation in
single call instead of series of queries to get every page table.

Thanks to Dmitry Isaykin for involvement.

Signed-off-by: Sergey Kovalev <valor@list.ru>

---
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Tamas K Lengyel <tamas@tklengyel.com>
Cc: xen-devel@lists.xenproject.org
---

---
  xen/arch/x86/domctl.c       | 17 +++++++++++++++++
  xen/include/public/domctl.h | 13 +++++++++++++
  2 files changed, 30 insertions(+)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 2118fcad5d..0c9706ea0a 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1364,6 +1364,23 @@ long arch_do_domctl(
              copyback = true;
          break;

+    case XEN_DOMCTL_gva_to_gfn:
+    {
+        uint64_t ga = domctl->u.gva_to_gfn.addr;
+        uint64_t cr3 = domctl->u.gva_to_gfn.cr3;
+        struct vcpu* v = d->vcpu[0];
+        uint32_t pfec = PFEC_page_present;
+        unsigned int page_order;
+
+        uint64_t gfn = paging_ga_to_gfn_cr3(v, cr3, ga, &pfec, 
&page_order);
+        domctl->u.gva_to_gfn.addr = gfn;
+        domctl->u.gva_to_gfn.page_order = page_order;
+        if ( __copy_to_guest(u_domctl, domctl, 1) )
+            ret = -EFAULT;
+
+        break;
+    }
+
      default:
          ret = -ENOSYS;
          break;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 51be28c3de..628dfc68fd 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -948,6 +948,17 @@ struct xen_domctl_paging_mempool {
      uint64_aligned_t size; /* Size in bytes. */
  };

+/*
+ * XEN_DOMCTL_gva_to_gfn.
+ *
+ * Get the guest virtual to guest physicall address translated.
+ */
+struct xen_domctl_gva_to_gfn {
+    uint64_aligned_t addr;
+    uint64_aligned_t cr3;
+    uint64_aligned_t page_order;
+};
+
  #if defined(__i386__) || defined(__x86_64__)
  struct xen_domctl_vcpu_msr {
      uint32_t         index;
@@ -1278,6 +1289,7 @@ struct xen_domctl {
  #define XEN_DOMCTL_vmtrace_op                    84
  #define XEN_DOMCTL_get_paging_mempool_size       85
  #define XEN_DOMCTL_set_paging_mempool_size       86
+#define XEN_DOMCTL_gva_to_gfn                    87
  #define XEN_DOMCTL_gdbsx_guestmemio            1000
  #define XEN_DOMCTL_gdbsx_pausevcpu             1001
  #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1340,6 +1352,7 @@ struct xen_domctl {
          struct xen_domctl_vuart_op          vuart_op;
          struct xen_domctl_vmtrace_op        vmtrace_op;
          struct xen_domctl_paging_mempool    paging_mempool;
+        struct xen_domctl_gva_to_gfn        gva_to_gfn;
          uint8_t                             pad[128];
      } u;
  };
-- 
2.38.1


