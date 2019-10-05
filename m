Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BDFCC964
	for <lists+xen-devel@lfdr.de>; Sat,  5 Oct 2019 12:38:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGhPC-0005CQ-8e; Sat, 05 Oct 2019 10:35:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AnWT=X6=yahoo.com=akm2tosher@srs-us1.protection.inumbo.net>)
 id 1iGhPA-0005CL-CR
 for xen-devel@lists.xenproject.org; Sat, 05 Oct 2019 10:35:16 +0000
X-Inumbo-ID: d1356286-e75b-11e9-80e3-bc764e2007e4
Received: from sonic308-56.consmr.mail.ne1.yahoo.com (unknown [66.163.187.31])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1356286-e75b-11e9-80e3-bc764e2007e4;
 Sat, 05 Oct 2019 10:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1570271714; bh=aZ1tJJfZrBrDk1nwa3f0au+ZLOpDQNkZdL4BozM8eOg=;
 h=Date:From:To:Subject:References:From:Subject;
 b=nPQvmA3gw1HueWF9x3yuQDeQFMnrQ8i6nPxtdF7wmPu51Us7H412v4cP7FVqaOG/aHMi7IW5/BrGvCHrxQ43p0yRsE4f8VvScsHRIDXZ+MCfhDgymVDpObNcXexybUuUKhFfGzRPo65CJ1tpmX3KGChjI3OZXENxiJFLMJpZRg495mfUx06irMUNPdTWAXQdJvBt6a3l2JdDw+2/liXsPePrdidE0+42e/5vIXfBetfBISyYPOoR2CP0V3mSlPxZdEWm3WfRp2PnL+rbmXxKsmb1BeGkcLaCDd64Sw5uepl9dtTjdJtH0UEnBNZ5zk+6FaaJV0YLbFvRW9YfM2c1mg==
X-YMail-OSG: 7Ec9OqwVM1kRUqO68l3wLewvmTq6Y71lL2wREyi3tynaBwC6_E_v.XhrBTWUyJS
 xN7315Wmj_SBqujioIx.6ymYicVhZHS0b6kfPwqnZ2OjzAhArBSJzgD0wqapIz743UyAprRuVb1s
 V16reMYUkDSeDfw2lVLkQavulRQCKPjnVniIF12Oqfn_vPkfjxFMLSRRlR.dLSJdPCDn_6iXV4ng
 n8kIKgUTw9rXE3iZs0k_wMeyUcvno7ntMTXjPodQpKeQuGqkXma73uLnOU9DepnV.5blfbL06zrI
 S.C5lFOaOr3nZhevcRLcLma8J0IZpQZZHnXiShROnvptdl1Wx_dL9ySiPski2ZbTyE_Q37KVRRla
 6QSP68i.NMCPhNKo1TaDlYt4xQeZrDi_aCtq_QrZzTGQV6NE5UQukFGsHONowNlT65sGS1rQ3AMA
 2jQeXdJylYIUFY32sNITzKRqC11o87Rh6hXQPs1PTbS3pfEfICr58FKufH2YPkJ1wGxEdoJteyzq
 RK3OQ26EnbTKDxbY3DEz.fTXO7dDUz3K9eeKi.3zrGKa3ja8JOdQ8jOOoNXVb.oebMAaFs.m1jNj
 bCNfecI9xFHiHoC7xKqn7VRzj7wy0Y.6ThhspxVEbBkJM342gtmgFMdU5C5gVSK80SHcqpDVz478
 6kkaWr6ahplTveJDzoJXVx_w.RTfl3pq_ToIlQn8pOPmJy9fhu.6YlZ9vEXo1eSNT45nAG.j7iik
 yppMZgSgbdiXQ_7Hxj8n2s4WPsyIvouvdZdCOgFfqNabY0v.8U_vokACClt2_DLBEYvvYwkh9zcu
 vd8VKHdp1rud2_szO_lUJvT3TWQPiZ.zz3CitjxN26PZB27ZWYTgfutX9zIcKHUHECSUJ_3rlAGS
 yWW6yuqNT.DV.0Z3aKGcxNuAcQpTABnti3l70uHuuCZQg9bUGFtLgSHkWZtwQ2YbsfxRVGr_QO_f
 BcLvNN79nwwdFz2btPpk66M.NK95JkQlPymWGOefJZBhIgy1FmIBuybCrQVeOZHYLwrlLovnkv_E
 HZNMpvSfC9Fuf.xpNpfrpKxaZKHj_w647Tf.lRklODRGuNTgqKe._vbBT9rX8oJr8jZPjgCnn9fY
 EGTzXvD7W5PekYmCSeA4iNIKY8zZWqHlIYHOKnoACviXhIoX1LE35bT5cna8mVa5ppI2U38rM3V7
 Yiq2Cm6qdlrdxEdsde5OX5lcZWu07kV0dLU9PzugoKuDDOizcaSV7C5j97xvYE3fGa4biczcrTZJ
 MDEE_i4rr6nTP8cs7qPu10eXOb7BWXPGaaVE-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.ne1.yahoo.com with HTTP; Sat, 5 Oct 2019 10:35:14 +0000
Date: Sat, 5 Oct 2019 10:35:11 +0000 (UTC)
From: tosher 1 <akm2tosher@yahoo.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <1285554440.4009671.1570271711943@mail.yahoo.com>
MIME-Version: 1.0
References: <1285554440.4009671.1570271711943.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.14448 YMailNorrin Mozilla/5.0 (Windows NT 10.0; Win64;
 x64; rv:69.0) Gecko/20100101 Firefox/69.0
Subject: [Xen-devel] How PV frontend and backend initializes?
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSB3YXMgdHJ5aW5nIHRvIHVuZGVyc3RhbmQgdGhlIGZvbGxvd2luZyB0aGluZ3MgcmVnYXJkaW5n
IHRoZSBQViBkcml2ZXIuCgoxLiBXaG8gY3JlYXRlIGZyb250ZW5kIGFuZCBiYWNrZW5kIGluc3Rh
bmNlcz8KMi4gV2hlbiBhcmUgdGhlc2UgaW5zdGFuY2VzIGNyZWF0ZWQ/CjMuIEhvdyB4ZW5idXMg
ZGlyZWN0b3JpZXMgYXJlIGNyZWF0ZWQ/IFdoYXQgaXMgdGhlIGhpZXJhcmNoeSBvZiB0aGUgZGly
ZWN0b3JpZXM/IAo0LiBXaGF0IGlzIHRoZSByb2xlIG9mICJ2aWZuYW1lIiBhbmQgd2hvIHNldHMg
aXQ/CgpQbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IGNhbiBoZWxwIHdpdGggdGhlc2UgcXVlc3Rp
b25zIG9yIGNhbiBkaXJlY3QgbWUgdG8gc29tZSByZXNvdXJjZXMuCgpUaGFua3MKTWVocmFiCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
