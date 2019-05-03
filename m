Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 913A513488
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 22:53:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMf8P-0006Wi-AO; Fri, 03 May 2019 20:50:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lar+=TD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hMf8O-0006WL-4b
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 20:50:20 +0000
X-Inumbo-ID: 0e697570-6de5-11e9-828d-2b50afc410d5
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e697570-6de5-11e9-828d-2b50afc410d5;
 Fri, 03 May 2019 20:50:17 +0000 (UTC)
Received: from sstabellini-ThinkPad-X260.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5DC9F20B7C;
 Fri,  3 May 2019 20:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556916616;
 bh=3IWWvsDOnuB69RLJ4DGWqOAGTi/kmS2DUY2cbb7ugjk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bs2xjMaCmhrW+IPJYUQ/o2oSd5r9ntKu7RqgAdvXBS2VF0Az87/ZLRvyJIEOR9ztd
 wjgvWeVnsof8TGFBPdOR0OQgBkB19CFy5Vwd8iwSWVwqUTXyCBWrq6rtJMYXHjwcL6
 Zu0h4AbGvDcFmcVmvVsJyFKvoGf4gSCVWITfHr2s=
From: Stefano Stabellini <sstabellini@kernel.org>
To: julien.grall@arm.com
Date: Fri,  3 May 2019 13:50:14 -0700
Message-Id: <1556916614-21512-3-git-send-email-sstabellini@kernel.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <alpine.DEB.2.10.1905031347520.3722@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1905031347520.3722@sstabellini-ThinkPad-X260>
Subject: [Xen-devel] [PATCH 3/3] xen/arm: fix mask calculation in init_pdx
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, JBeulich@suse.com,
 Stefano Stabellini <stefanos@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG1hc2sgY2FsY3VsYXRpb24gaW4gaW5pdF9wZHggaXMgd3Jvbmcgd2hlbiB0aGUgZmlyc3Qg
YmFuayBzdGFydHMgYXQKYWRkcmVzcyAweDAuIFRoZSByZWFzb24gaXMgdGhhdCBwZHhfaW5pdF9t
YXNrIHdpbGwgZG8gJzAgLSAxJyBjYXVzaW5nIGFuCnVuZGVyZmxvdy4gQXMgYSByZXN1bHQsIHRo
ZSBtYXNrIGJlY29tZXMgMHhmZmZmZmZmZmZmZmZmZmZmIHdoaWNoIGlzIHRoZQpiaWdnZXN0IHBv
c3NpYmxlIG1hc2sgYW5kIGVuZHMgdXAgY2F1c2luZyBhIHNpZ25pZmljYW50IG1lbW9yeSB3YXN0
ZSBpbgp0aGUgZnJhbWV0YWJsZSBzaXplIGNvbXB1dGF0aW9uLgoKRm9yIGluc3RhbmNlLCBvbiBw
bGF0Zm9ybXMgdGhhdCBoYXZlIGEgbG93IG1lbW9yeSBiYW5rIGFuZCBhIGhpZ2ggbWVtb3J5CmJh
bmssIHRoZSBmcmFtZXRhYmxlIHdpbGwgZW5kIHVwIGNvdmVyaW5nIGFsbCB0aGUgaG9sZXMgaW4g
YmV0d2Vlbi4KClRoZSBwdXJwb3NlIG9mIHRoZSBtYXNrIGlzIHRvIGJlIHBhc3NlZCBhcyBhIHBh
cmFtZXRlciB0bwpwZm5fcGR4X2hvbGVfc2V0dXAsIHdoaWNoIGJhc2VkIG9uIHRoZSBtYXNrIHBh
cmFtZXRlciBjYWN1bGF0ZXMKcGZuX3BkeF9ob2xlX3NoaWZ0LCBwZm5fcGR4X2JvdHRvbV9tYXNr
LCBldGMuIHdoaWNoIGFyZSBhY3R1YWxseSB0aGUKaW1wb3J0YW50IG1hc2tzIGZvciBmcmFtZXRh
YmxlIGluaXRpYWxpemF0aW9uIGxhdGVyIG9uLgoKcGZuX3BkeF9ob2xlX3NldHVwIG5ldmVyIGNv
bXByZXNzZXMgYWRkcmVzc2VzIGJlbG93IE1BWF9PUkRFUiBiaXRzICgxR0IKb24gQVJNKS4gVGh1
cywgaXQgaXMgc2FmZSB0byBpbml0aWFsaXplIG1hc2sgcGFzc2luZyAxVUxMIDw8IChNQVhfT1JE
RVIKKyBQQUdFX1NISUZUKSBhcyBzdGFydCBhZGRyZXNzIHRvIHBkeF9pbml0X21hc2suCgpTaWdu
ZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+CkNDOiBK
QmV1bGljaEBzdXNlLmNvbQotLS0KIHhlbi9hcmNoL2FybS9zZXR1cC5jIHwgOSArKysrKysrLS0K
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL3NldHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwppbmRleCBj
Y2IwZjE4Li4yMmYyMGJiIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAuYworKysgYi94
ZW4vYXJjaC9hcm0vc2V0dXAuYwpAQCAtNDgxLDEwICs0ODEsMTUgQEAgc3RhdGljIHBhZGRyX3Qg
X19pbml0IG5leHRfbW9kdWxlKHBhZGRyX3QgcywgcGFkZHJfdCAqZW5kKQogc3RhdGljIHZvaWQg
X19pbml0IGluaXRfcGR4KHZvaWQpCiB7CiAgICAgcGFkZHJfdCBiYW5rX3N0YXJ0LCBiYW5rX3Np
emUsIGJhbmtfZW5kOwotCi0gICAgdTY0IG1hc2sgPSBwZHhfaW5pdF9tYXNrKGJvb3RpbmZvLm1l
bS5iYW5rWzBdLnN0YXJ0KTsKKyAgICB1NjQgbWFzazsKICAgICBpbnQgYmFuazsKIAorICAgIC8q
CisgICAgICogV2UgYWx3YXlzIG1hcCB0aGUgZmlyc3QgMTw8TUFYX09SREVSIG9mIFJBTSwgaGVu
Y2UsIHRoZXkgYXJlIGxlZnQKKyAgICAgKiB1bmNvbXByZXNzZWQuCisgICAgICovCisgICAgbWFz
ayA9IHBkeF9pbml0X21hc2soMVVMTCA8PCAoTUFYX09SREVSICsgUEFHRV9TSElGVCkpOworCiAg
ICAgZm9yICggYmFuayA9IDAgOyBiYW5rIDwgYm9vdGluZm8ubWVtLm5yX2JhbmtzOyBiYW5rKysg
KQogICAgIHsKICAgICAgICAgYmFua19zdGFydCA9IGJvb3RpbmZvLm1lbS5iYW5rW2JhbmtdLnN0
YXJ0OwotLSAKMS45LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
