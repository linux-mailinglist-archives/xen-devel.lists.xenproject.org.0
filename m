Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3260211E6B7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 16:38:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifmzM-00034X-5f; Fri, 13 Dec 2019 15:36:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tyHa=2D=gmail.com=sj38.park@srs-us1.protection.inumbo.net>)
 id 1ifmzL-00034D-5H
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 15:36:19 +0000
X-Inumbo-ID: 4a0ea65c-1dbe-11ea-a1e1-bc764e2007e4
Received: from mail-pl1-x642.google.com (unknown [2607:f8b0:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a0ea65c-1dbe-11ea-a1e1-bc764e2007e4;
 Fri, 13 Dec 2019 15:36:11 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id s10so1397063plp.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2019 07:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=TMzbAvFP3yWT6YAfy9bgu7F+ker5oB+nrGJ42qyGAXA=;
 b=Qp+aEwOGyOZbqJRFS0g2YNqq/vGtD86zDnL9veckvgQbfMeyHYCtLk5T4tugaTMvO3
 WLqKda2xqpV803MmsBSd4k+i3mwCscmJjmere0orczPqXD5hPpm++QxlnFSOEWktxEAZ
 DRxGQz6ca0TGrEfrYq+zw4Pv4RRuFdzc7wN6eKDX8m+lMqAuxhmO2WhAv8Cd2w+S47rg
 izwTVFYZuT1Kc8oJ1Z5dGTq+Ki0uSezlcmWs7VuiRf25gY5EHphnSsOdtitR4Ti4bRu2
 mmK0d1Xc8PJ//z7A26bX/Sh4CEfVYiWsDcFg2s8AV+Q8c6EAxephCiGsSvdzKnwLtjeh
 YyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=TMzbAvFP3yWT6YAfy9bgu7F+ker5oB+nrGJ42qyGAXA=;
 b=RyvKS5Go9KV4LbwltcEcojH0mjsyip5Q/Dd5Yn/Z075dCCS2hhfqkvt08kFjLu7Eri
 EDex0G/O2bEwuXSv+UG8M0OTCCnNUDuF081keVVvZaJCsbaU/fpYmSb9RML9CAeOGDSc
 6qBpqBqIUG4jyZtxqh+kg2eyR6SudLzUerpMekrMVaCjeqJrcpS35wjLm0Rwcuu787RQ
 Plk7LOlsbzndPDLSbEEsDNyfdd+EYE6q/pYiAocQNRuXy8vrNlj3n0Va5YTSBcV3EFKu
 OvEOzZj3Lpcji9t2aW3AM3rzPWM9w4ayPwbDj6e7VisPQ1Yut1OGT8vO3vPMxe+X1O/W
 esFQ==
X-Gm-Message-State: APjAAAWTdnE59qOkZmEfGbw34NBL4QcMBTAyvdq8RAmPJ6qf57SSdFKF
 uf/OrQwWCt8DLoGmQ3eaPHk=
X-Google-Smtp-Source: APXvYqx/tTThM4N8APNQHLuc1ZTNOdmNUUvYzcgT2iO5rANQjtbhDryyAcZQW3n5eq1V6wjE4DENeg==
X-Received: by 2002:a17:90a:e4f:: with SMTP id
 p15mr16868630pja.90.1576251370516; 
 Fri, 13 Dec 2019 07:36:10 -0800 (PST)
Received: from localhost.localdomain ([12.176.148.120])
 by smtp.gmail.com with ESMTPSA id w131sm12039217pfc.16.2019.12.13.07.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 07:36:09 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
X-Google-Original-From: SeongJae Park <sjpark@amazon.de>
To: jgross@suse.com, axboe@kernel.dk, konrad.wilk@oracle.com,
 roger.pau@citrix.com
Date: Fri, 13 Dec 2019 15:35:44 +0000
Message-Id: <20191213153546.17425-3-sjpark@amazon.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213153546.17425-1-sjpark@amazon.de>
References: <20191213153546.17425-1-sjpark@amazon.de>
Subject: [Xen-devel] [PATCH v9 2/4] xen/blkback: Squeeze page pools if a
 memory pressure is detected
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
Cc: linux-block@vger.kernel.org, sjpark@amazon.com, pdurrant@amazon.com,
 SeongJae Park <sjpark@amazon.de>, linux-kernel@vger.kernel.org,
 sj38.park@gmail.com, xen-devel@lists.xenproject.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RWFjaCBgYmxraWZgIGhhcyBhIGZyZWUgcGFnZXMgcG9vbCBmb3IgdGhlIGdyYW50IG1hcHBpbmcu
ICBUaGUgc2l6ZSBvZgp0aGUgcG9vbCBzdGFydHMgZnJvbSB6ZXJvIGFuZCBpcyBpbmNyZWFzZWQg
b24gZGVtYW5kIHdoaWxlIHByb2Nlc3NpbmcKdGhlIEkvTyByZXF1ZXN0cy4gIElmIGN1cnJlbnQg
SS9PIHJlcXVlc3RzIGhhbmRsaW5nIGlzIGZpbmlzaGVkIG9yIDEwMAptaWxsaXNlY29uZHMgaGFz
IHBhc3NlZCBzaW5jZSBsYXN0IEkvTyByZXF1ZXN0cyBoYW5kbGluZywgaXQgY2hlY2tzIGFuZApz
aHJpbmtzIHRoZSBwb29sIHRvIG5vdCBleGNlZWQgdGhlIHNpemUgbGltaXQsIGBtYXhfYnVmZmVy
X3BhZ2VzYC4KClRoZXJlZm9yZSwgaG9zdCBhZG1pbmlzdHJhdG9ycyBjYW4gY2F1c2UgbWVtb3J5
IHByZXNzdXJlIGluIGJsa2JhY2sgYnkKYXR0YWNoaW5nIGEgbGFyZ2UgbnVtYmVyIG9mIGJsb2Nr
IGRldmljZXMgYW5kIGluZHVjaW5nIEkvTy4gIFN1Y2gKcHJvYmxlbWF0aWMgc2l0dWF0aW9ucyBj
YW4gYmUgYXZvaWRlZCBieSBsaW1pdGluZyB0aGUgbWF4aW11bSBudW1iZXIgb2YKZGV2aWNlcyB0
aGF0IGNhbiBiZSBhdHRhY2hlZCwgYnV0IGZpbmRpbmcgdGhlIG9wdGltYWwgbGltaXQgaXMgbm90
IHNvCmVhc3kuICBJbXByb3BlciBzZXQgb2YgdGhlIGxpbWl0IGNhbiByZXN1bHRzIGluIG1lbW9y
eSBwcmVzc3VyZSBvciBhCnJlc291cmNlIHVuZGVydXRpbGl6YXRpb24uICBUaGlzIGNvbW1pdCBh
dm9pZHMgc3VjaCBwcm9ibGVtYXRpYwpzaXR1YXRpb25zIGJ5IHNxdWVlemluZyB0aGUgcG9vbHMg
KHJldHVybnMgZXZlcnkgZnJlZSBwYWdlIGluIHRoZSBwb29sCnRvIHRoZSBzeXN0ZW0pIGZvciBh
IHdoaWxlICh1c2VycyBjYW4gc2V0IHRoaXMgZHVyYXRpb24gdmlhIGEgbW9kdWxlCnBhcmFtZXRl
cikgaWYgbWVtb3J5IHByZXNzdXJlIGlzIGRldGVjdGVkLgoKRGlzY3Vzc2lvbnMKPT09PT09PT09
PT0KClRoZSBgYmxrYmFja2AncyBvcmlnaW5hbCBzaHJpbmtpbmcgbWVjaGFuaXNtIHJldHVybnMg
b25seSBwYWdlcyBpbiB0aGUKcG9vbCB3aGljaCBhcmUgbm90IGN1cnJlbnRseSBiZSB1c2VkIGJ5
IGBibGtiYWNrYCB0byB0aGUgc3lzdGVtLiAgSW4Kb3RoZXIgd29yZHMsIHRoZSBwYWdlcyB0aGF0
IGFyZSBub3QgbWFwcGVkIHdpdGggZ3JhbnRlZCBwYWdlcy4gIEJlY2F1c2UKdGhpcyBjb21taXQg
aXMgY2hhbmdpbmcgb25seSB0aGUgc2hyaW5rIGxpbWl0IGJ1dCBzdGlsbCB1c2VzIHRoZSBzYW1l
CmZyZWVpbmcgbWVjaGFuaXNtIGl0IGRvZXMgbm90IHRvdWNoIHBhZ2VzIHdoaWNoIGFyZSBjdXJy
ZW50bHkgbWFwcGluZwpncmFudHMuCgpPbmNlIG1lbW9yeSBwcmVzc3VyZSBpcyBkZXRlY3RlZCwg
dGhpcyBjb21taXQga2VlcHMgdGhlIHNxdWVlemluZyBsaW1pdApmb3IgYSB1c2VyLXNwZWNpZmll
ZCB0aW1lIGR1cmF0aW9uLiAgVGhlIGR1cmF0aW9uIHNob3VsZCBiZSBuZWl0aGVyIHRvbwpsb25n
IG5vciB0b28gc2hvcnQuICBJZiBpdCBpcyB0b28gbG9uZywgdGhlIHNxdWVlemluZyBpbmN1cnJp
bmcgb3ZlcmhlYWQKY2FuIHJlZHVjZSB0aGUgSS9PIHBlcmZvcm1hbmNlLiAgSWYgaXQgaXMgdG9v
IHNob3J0LCBgYmxrYmFja2Agd2lsbCBub3QKZnJlZSBlbm91Z2ggcGFnZXMgdG8gcmVkdWNlIHRo
ZSBtZW1vcnkgcHJlc3N1cmUuICBUaGlzIGNvbW1pdCBzZXRzIHRoZQp2YWx1ZSBhcyBgMTAgbWls
bGlzZWNvbmRzYCBieSBkZWZhdWx0IGJlY2F1c2UgaXQgaXMgYSBzaG9ydCB0aW1lIGluCnRlcm1z
IG9mIEkvTyB3aGlsZSBpdCBpcyBhIGxvbmcgdGltZSBpbiB0ZXJtcyBvZiBtZW1vcnkgb3BlcmF0
aW9ucy4KQWxzbywgYXMgdGhlIG9yaWdpbmFsIHNocmlua2luZyBtZWNoYW5pc20gd29ya3MgZm9y
IGF0IGxlYXN0IGV2ZXJ5IDEwMAptaWxsaXNlY29uZHMsIHRoaXMgY291bGQgYmUgYSBzb21ld2hh
dCByZWFzb25hYmxlIGNob2ljZS4gIEkgYWxzbyB0ZXN0ZWQKb3RoZXIgZHVyYXRpb25zIChyZWZl
ciB0byB0aGUgYmVsb3cgc2VjdGlvbiBmb3IgbW9yZSBkZXRhaWxzKSBhbmQKY29uZmlybWVkIHRo
YXQgMTAgbWlsbGlzZWNvbmRzIGlzIHRoZSBvbmUgdGhhdCB3b3JrcyBiZXN0IHdpdGggdGhlIHRl
c3QuClRoYXQgc2FpZCwgdGhlIHByb3BlciBkdXJhdGlvbiBkZXBlbmRzIG9uIGFjdHVhbCBjb25m
aWd1cmF0aW9ucyBhbmQKd29ya2xvYWRzLiAgVGhhdCdzIHdoeSB0aGlzIGNvbW1pdCBhbGxvd3Mg
dXNlcnMgdG8gc2V0IHRoZSBkdXJhdGlvbiBhcyBhCm1vZHVsZSBwYXJhbWV0ZXIuCgpNZW1vcnkg
UHJlc3N1cmUgVGVzdAo9PT09PT09PT09PT09PT09PT09PQoKVG8gc2hvdyBob3cgdGhpcyBjb21t
aXQgZml4ZXMgdGhlIG1lbW9yeSBwcmVzc3VyZSBzaXR1YXRpb24gd2VsbCwgSQpjb25maWd1cmVk
IGEgdGVzdCBlbnZpcm9ubWVudCBvbiBhIHhlbi1ydW5uaW5nIHZpcnR1YWxpemF0aW9uIHN5c3Rl
bS4KT24gdGhlIGBibGtmcm9udGAgcnVubmluZyBndWVzdCBpbnN0YW5jZXMsIEkgYXR0YWNoIGEg
bGFyZ2UgbnVtYmVyIG9mCm5ldHdvcmstYmFja2VkIHZvbHVtZSBkZXZpY2VzIGFuZCBpbmR1Y2Ug
SS9PIHRvIHRob3NlLiAgTWVhbndoaWxlLCBJCm1lYXN1cmUgdGhlIG51bWJlciBvZiBwYWdlcyB0
aGF0IHN3YXBwZWQgaW4gKHBzd3BpbikgYW5kIG91dCAocHN3cG91dCkKb24gdGhlIGBibGtiYWNr
YCBydW5uaW5nIGd1ZXN0LiAgVGhlIHRlc3QgcmFuIHR3aWNlLCBvbmNlIGZvciB0aGUKYGJsa2Jh
Y2tgIGJlZm9yZSB0aGlzIGNvbW1pdCBhbmQgb25jZSBmb3IgdGhhdCBhZnRlciB0aGlzIGNvbW1p
dC4gIEFzCnNob3duIGJlbG93LCB0aGlzIGNvbW1pdCBoYXMgZHJhbWF0aWNhbGx5IHJlZHVjZWQg
dGhlIG1lbW9yeSBwcmVzc3VyZToKCiAgICAgICAgICAgICAgICBwc3dwaW4gIHBzd3BvdXQKICAg
IGJlZm9yZSAgICAgIDc2LDY3MiAgMTg1LDc5OQogICAgYWZ0ZXIgICAgICAgICAgMjEyICAgIDMs
MzI1CgpPcHRpbWFsIEFnZ3Jlc3NpdmUgU2hyaW5raW5nIER1cmF0aW9uCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KClRvIGZpbmQgYSBiZXN0IHNxdWVlemluZyBkdXJhdGlv
biwgSSByZXBlYXRlZCB0aGUgdGVzdCB3aXRoIHRocmVlCmRpZmZlcmVudCBkdXJhdGlvbnMgKDFt
cywgMTBtcywgYW5kIDEwMG1zKS4gIFRoZSByZXN1bHRzIGFyZSBhcyBiZWxvdzoKCiAgICBkdXJh
dGlvbiAgICBwc3dwaW4gIHBzd3BvdXQKICAgIDEgICAgICAgICAgIDg1MiAgICAgNiw0MjQKICAg
IDEwICAgICAgICAgIDIxMiAgICAgMywzMjUKICAgIDEwMCAgICAgICAgIDIwMyAgICAgMywzNDAK
CkFzIGV4cGVjdGVkLCB0aGUgbWVtb3J5IHByZXNzdXJlIGhhcyBkZWNyZWFzZWQgYXMgdGhlIGR1
cmF0aW9uIGlzCmluY3JlYXNlZCwgYnV0IHRoZSByZWR1Y3Rpb24gc3RvcHBlZCBmcm9tIHRoZSBg
MTBtc2AuICBCYXNlZCBvbiB0aGlzCnJlc3VsdHMsIEkgY2hvc2UgdGhlIGRlZmF1bHQgZHVyYXRp
b24gYXMgMTBtcy4KClBlcmZvcm1hbmNlIE92ZXJoZWFkIFRlc3QKPT09PT09PT09PT09PT09PT09
PT09PT09PQoKVGhpcyBjb21taXQgY291bGQgaW5jdXIgSS9PIHBlcmZvcm1hbmNlIGRlZ3JhZGF0
aW9uIHVuZGVyIHNldmVyZSBtZW1vcnkKcHJlc3N1cmUgYmVjYXVzZSB0aGUgc3F1ZWV6aW5nIHdp
bGwgcmVxdWlyZSBtb3JlIHBhZ2UgYWxsb2NhdGlvbnMgcGVyCkkvTy4gIFRvIHNob3cgdGhlIG92
ZXJoZWFkLCBJIGFydGlmaWNpYWxseSBtYWRlIGEgd29yc3QtY2FzZSBzcXVlZXppbmcKc2l0dWF0
aW9uIGFuZCBtZWFzdXJlZCB0aGUgSS9PIHBlcmZvcm1hbmNlIG9mIGEgYGJsa2Zyb250YCBydW5u
aW5nCmd1ZXN0LgoKRm9yIHRoZSBhcnRpZmljaWFsIHNxdWVlemluZywgSSBzZXQgdGhlIGBibGti
YWNrLm1heF9idWZmZXJfcGFnZXNgIHVzaW5nCnRoZSBgL3N5cy9tb2R1bGUveGVuX2Jsa2JhY2sv
cGFyYW1ldGVycy9tYXhfYnVmZmVyX3BhZ2VzYCBmaWxlLiAgSW4gdGhpcwp0ZXN0LCBJIHNldCB0
aGUgdmFsdWUgdG8gYDEwMjRgIGFuZCBgMGAuICBUaGUgYDEwMjRgIGlzIHRoZSBkZWZhdWx0CnZh
bHVlLiAgU2V0dGluZyB0aGUgdmFsdWUgYXMgYDBgIGlzIHNhbWUgdG8gYSBzaXR1YXRpb24gZG9p
bmcgdGhlCnNxdWVlemluZyBhbHdheXMgKHdvcnN0LWNhc2UpLgoKRm9yIHRoZSBJL08gcGVyZm9y
bWFuY2UgbWVhc3VyZW1lbnQsIEkgcnVuIGEgc2ltcGxlIGBkZGAgY29tbWFuZCA1IHRpbWVzCmFz
IGJlbG93IGFuZCBjb2xsZWN0IHRoZSAnTUIvcycgcmVzdWx0cy4KCiAgICAkIGZvciBpIGluIHsx
Li41fTsgZG8gZGQgaWY9L2Rldi96ZXJvIG9mPWZpbGUgXAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGJzPTRrIGNvdW50PSQoKDI1Nio1MTIpKTsgc3luYzsgZG9uZQoKSWYgdGhlIHVuZGVy
bHlpbmcgYmxvY2sgZGV2aWNlIGlzIHNsb3cgZW5vdWdoLCB0aGUgc3F1ZWV6aW5nIG92ZXJoZWFk
CmNvdWxkIGJlIGhpZGRlbi4gIEZvciB0aGUgcmVhc29uLCBJIGRvIHRoaXMgdGVzdCBmb3IgYm90
aCBhIHNsb3cgYmxvY2sKZGV2aWNlIGFuZCBhIGZhc3QgYmxvY2sgZGV2aWNlLiAgSSB1c2UgYSBw
b3B1bGFyIGNsb3VkIGJsb2NrIHN0b3JhZ2UKc2VydmljZSwgZWJzWzFdIGFzIGEgc2xvdyBkZXZp
Y2UgYW5kIHRoZSByYW1kaXNrIGJsb2NrIGRldmljZVsyXSBmb3IgdGhlCmZhc3QgZGV2aWNlLgoK
VGhlIHJlc3VsdHMgYXJlIGFzIGJlbG93LiAgJ21heF9wZ3MnIHJlcHJlc2VudHMgdGhlIHZhbHVl
IG9mIHRoZQpgYmxrYmFjay5tYXhfYnVmZmVyX3BhZ2VzYCBwYXJhbWV0ZXIuCgpPbiB0aGUgc2xv
dyBibG9jayBkZXZpY2UKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgogICAgbWF4X3BncyAgIE1p
biAgICAgICBNYXggICAgICAgTWVkaWFuICAgICBBdmcgICAgU3RkZGV2CiAgICAwICAgICAgICAg
MzguNyAgICAgIDQ1LjggICAgICAzOC43ICAgICAgIDQwLjEyICAzLjE3NTIxNjUKICAgIDEwMjQg
ICAgICAzOC43ICAgICAgNDUuOCAgICAgIDM4LjcgICAgICAgNDAuMTIgIDMuMTc1MjE2NQogICAg
Tm8gZGlmZmVyZW5jZSBwcm92ZW4gYXQgOTUuMCUgY29uZmlkZW5jZQoKT24gdGhlIGZhc3QgYmxv
Y2sgZGV2aWNlCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKICAgIG1heF9wZ3MgICBNaW4gICAg
ICAgTWF4ICAgICAgIE1lZGlhbiAgICAgQXZnICAgIFN0ZGRldgogICAgMCAgICAgICAgIDQxNyAg
ICAgICA0MjMgICAgICAgNDIwICAgICAgICA0MTkuNCAgMi41MDk5ODAxCiAgICAxMDI0ICAgICAg
NDE0ICAgICAgIDQyNSAgICAgICA0MTYgICAgICAgIDQxNy44ICA0LjQzODQ2ODIKICAgIE5vIGRp
ZmZlcmVuY2UgcHJvdmVuIGF0IDk1LjAlIGNvbmZpZGVuY2UKCkluIHNob3J0LCBldmVuIHdvcnN0
IGNhc2Ugc3F1ZWV6aW5nIG9uIHJhbWRpc2sgYmFzZWQgZmFzdCBibG9jayBkZXZpY2UKbWFrZXMg
bm8gdmlzaWJsZSBwZXJmb3JtYW5jZSBkZWdyYWRhdGlvbi4gIFBsZWFzZSBub3RlIHRoYXQgdGhp
cyBpcyBqdXN0CmEgdmVyeSBzaW1wbGUgYW5kIG1pbmltYWwgdGVzdC4gIE9uIHN5c3RlbXMgdXNp
bmcgc3VwZXItZmFzdCBibG9jawpkZXZpY2VzIGFuZCBhIHNwZWNpYWwgSS9PIHdvcmtsb2FkLCB0
aGUgcmVzdWx0cyBtaWdodCBiZSBkaWZmZXJlbnQuICBJZgp5b3UgaGF2ZSBhbnkgZG91YnQsIHRl
c3Qgb24geW91ciBtYWNoaW5lIHdpdGggeW91ciB3b3JrbG9hZCB0byBmaW5kIHRoZQpvcHRpbWFs
IHNxdWVlemluZyBkdXJhdGlvbiBmb3IgeW91LgoKWzFdIGh0dHBzOi8vYXdzLmFtYXpvbi5jb20v
ZWJzLwpbMl0gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvYWRtaW4tZ3Vp
ZGUvYmxvY2tkZXYvcmFtZGlzay5odG1sCgpTaWduZWQtb2ZmLWJ5OiBTZW9uZ0phZSBQYXJrIDxz
anBhcmtAYW1hem9uLmRlPgotLS0KIC4uLi9BQkkvdGVzdGluZy9zeXNmcy1kcml2ZXIteGVuLWJs
a2JhY2sgICAgICB8IDEwICsrKysrKysrKwogZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9ibGti
YWNrLmMgICAgICAgICAgIHwgIDcgKysrKystLQogZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9j
b21tb24uaCAgICAgICAgICAgIHwgIDEgKwogZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5i
dXMuYyAgICAgICAgICAgIHwgMjEgKysrKysrKysrKysrKysrKysrLQogNCBmaWxlcyBjaGFuZ2Vk
LCAzNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZHJpdmVyLXhlbi1ibGtiYWNrIGIvRG9jdW1lbnRhdGlv
bi9BQkkvdGVzdGluZy9zeXNmcy1kcml2ZXIteGVuLWJsa2JhY2sKaW5kZXggNGU3YmFiYjNiYTFm
Li5mMDEyMjQyMzFmM2YgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lz
ZnMtZHJpdmVyLXhlbi1ibGtiYWNrCisrKyBiL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lz
ZnMtZHJpdmVyLXhlbi1ibGtiYWNrCkBAIC0yNSwzICsyNSwxMyBAQCBEZXNjcmlwdGlvbjoKICAg
ICAgICAgICAgICAgICBhbGxvY2F0ZWQgd2l0aG91dCBiZWluZyBpbiB1c2UuIFRoZSB0aW1lIGlz
IGluCiAgICAgICAgICAgICAgICAgc2Vjb25kcywgMCBtZWFucyBpbmRlZmluaXRlbHkgbG9uZy4K
ICAgICAgICAgICAgICAgICBUaGUgZGVmYXVsdCBpcyA2MCBzZWNvbmRzLgorCitXaGF0OiAgICAg
ICAgICAgL3N5cy9tb2R1bGUveGVuX2Jsa2JhY2svcGFyYW1ldGVycy9idWZmZXJfc3F1ZWV6ZV9k
dXJhdGlvbl9tcworRGF0ZTogICAgICAgICAgIERlY2VtYmVyIDIwMTkKK0tlcm5lbFZlcnNpb246
ICA1LjUKK0NvbnRhY3Q6ICAgICAgICBTZW9uZ0phZSBQYXJrIDxzanBhcmtAYW1hem9uLmRlPgor
RGVzY3JpcHRpb246CisgICAgICAgICAgICAgICAgV2hlbiBtZW1vcnkgcHJlc3N1cmUgaXMgcmVw
b3J0ZWQgdG8gYmxrYmFjayB0aGlzIG9wdGlvbgorICAgICAgICAgICAgICAgIGNvbnRyb2xzIHRo
ZSBkdXJhdGlvbiBpbiBtaWxsaXNlY29uZHMgdGhhdCBibGtiYWNrIHdpbGwgbm90CisgICAgICAg
ICAgICAgICAgY2FjaGUgYW55IHBhZ2Ugbm90IGJhY2tlZCBieSBhIGdyYW50IG1hcHBpbmcuCisg
ICAgICAgICAgICAgICAgVGhlIGRlZmF1bHQgaXMgMTBtcy4KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
YmxvY2sveGVuLWJsa2JhY2svYmxrYmFjay5jIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9i
bGtiYWNrLmMKaW5kZXggZmQxZTE5ZjFhNDlmLi43OWY2NzdhZWI1Y2MgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvYmxvY2sveGVuLWJsa2JhY2svYmxrYmFjay5jCisrKyBiL2RyaXZlcnMvYmxvY2sveGVu
LWJsa2JhY2svYmxrYmFjay5jCkBAIC02NTYsOCArNjU2LDExIEBAIGludCB4ZW5fYmxraWZfc2No
ZWR1bGUodm9pZCAqYXJnKQogCQkJcmluZy0+bmV4dF9scnUgPSBqaWZmaWVzICsgbXNlY3NfdG9f
amlmZmllcyhMUlVfSU5URVJWQUwpOwogCQl9CiAKLQkJLyogU2hyaW5rIGlmIHdlIGhhdmUgbW9y
ZSB0aGFuIHhlbl9ibGtpZl9tYXhfYnVmZmVyX3BhZ2VzICovCi0JCXNocmlua19mcmVlX3BhZ2Vw
b29sKHJpbmcsIHhlbl9ibGtpZl9tYXhfYnVmZmVyX3BhZ2VzKTsKKwkJLyogU2hyaW5rIHRoZSBm
cmVlIHBhZ2VzIHBvb2wgaWYgaXQgaXMgdG9vIGxhcmdlLiAqLworCQlpZiAodGltZV9iZWZvcmUo
amlmZmllcywgYmxraWYtPmJ1ZmZlcl9zcXVlZXplX2VuZCkpCisJCQlzaHJpbmtfZnJlZV9wYWdl
cG9vbChyaW5nLCAwKTsKKwkJZWxzZQorCQkJc2hyaW5rX2ZyZWVfcGFnZXBvb2wocmluZywgeGVu
X2Jsa2lmX21heF9idWZmZXJfcGFnZXMpOwogCiAJCWlmIChsb2dfc3RhdHMgJiYgdGltZV9hZnRl
cihqaWZmaWVzLCByaW5nLT5zdF9wcmludCkpCiAJCQlwcmludF9zdGF0cyhyaW5nKTsKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2svY29tbW9uLmggYi9kcml2ZXJzL2Jsb2Nr
L3hlbi1ibGtiYWNrL2NvbW1vbi5oCmluZGV4IDFkMzAwMmQ3NzNmNy4uNTM2Yzg0ZjYxZmVkIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2NvbW1vbi5oCisrKyBiL2RyaXZl
cnMvYmxvY2sveGVuLWJsa2JhY2svY29tbW9uLmgKQEAgLTMxOSw2ICszMTksNyBAQCBzdHJ1Y3Qg
eGVuX2Jsa2lmIHsKIAkvKiBBbGwgcmluZ3MgZm9yIHRoaXMgZGV2aWNlLiAqLwogCXN0cnVjdCB4
ZW5fYmxraWZfcmluZwkqcmluZ3M7CiAJdW5zaWduZWQgaW50CQlucl9yaW5nczsKKwl1bnNpZ25l
ZCBsb25nCQlidWZmZXJfc3F1ZWV6ZV9lbmQ7CiB9OwogCiBzdHJ1Y3Qgc2VnX2J1ZiB7CmRpZmYg
LS1naXQgYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jIGIvZHJpdmVycy9ibG9j
ay94ZW4tYmxrYmFjay94ZW5idXMuYwppbmRleCBiOTBkYmNkOTljMDMuLjRmNmVhNGZlY2E3OSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYworKysgYi9kcml2
ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jCkBAIC04MjQsNiArODI0LDI0IEBAIHN0YXRp
YyB2b2lkIGZyb250ZW5kX2NoYW5nZWQoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldiwKIH0KIAog
CisvKiBPbmNlIGEgbWVtb3J5IHByZXNzdXJlIGlzIGRldGVjdGVkLCBzcXVlZXplIGZyZWUgcGFn
ZSBwb29scyBmb3IgYSB3aGlsZS4gKi8KK3N0YXRpYyB1bnNpZ25lZCBpbnQgYnVmZmVyX3NxdWVl
emVfZHVyYXRpb25fbXMgPSAxMDsKK21vZHVsZV9wYXJhbV9uYW1lZChidWZmZXJfc3F1ZWV6ZV9k
dXJhdGlvbl9tcywKKwkJYnVmZmVyX3NxdWVlemVfZHVyYXRpb25fbXMsIGludCwgMDY0NCk7CitN
T0RVTEVfUEFSTV9ERVNDKGJ1ZmZlcl9zcXVlZXplX2R1cmF0aW9uX21zLAorIkR1cmF0aW9uIGlu
IG1zIHRvIHNxdWVlemUgcGFnZXMgYnVmZmVyIHdoZW4gYSBtZW1vcnkgcHJlc3N1cmUgaXMgZGV0
ZWN0ZWQiKTsKKworLyoKKyAqIENhbGxiYWNrIHJlY2VpdmVkIHdoZW4gdGhlIG1lbW9yeSBwcmVz
c3VyZSBpcyBkZXRlY3RlZC4KKyAqLworc3RhdGljIHZvaWQgcmVjbGFpbV9tZW1vcnkoc3RydWN0
IHhlbmJ1c19kZXZpY2UgKmRldikKK3sKKwlzdHJ1Y3QgYmFja2VuZF9pbmZvICpiZSA9IGRldl9n
ZXRfZHJ2ZGF0YSgmZGV2LT5kZXYpOworCisJYmUtPmJsa2lmLT5idWZmZXJfc3F1ZWV6ZV9lbmQg
PSBqaWZmaWVzICsKKwkJbXNlY3NfdG9famlmZmllcyhidWZmZXJfc3F1ZWV6ZV9kdXJhdGlvbl9t
cyk7Cit9CisKIC8qICoqIENvbm5lY3Rpb24gKiogKi8KIAogCkBAIC0xMTE1LDcgKzExMzMsOCBA
QCBzdGF0aWMgc3RydWN0IHhlbmJ1c19kcml2ZXIgeGVuX2Jsa2JrX2RyaXZlciA9IHsKIAkuaWRz
ICA9IHhlbl9ibGtia19pZHMsCiAJLnByb2JlID0geGVuX2Jsa2JrX3Byb2JlLAogCS5yZW1vdmUg
PSB4ZW5fYmxrYmtfcmVtb3ZlLAotCS5vdGhlcmVuZF9jaGFuZ2VkID0gZnJvbnRlbmRfY2hhbmdl
ZAorCS5vdGhlcmVuZF9jaGFuZ2VkID0gZnJvbnRlbmRfY2hhbmdlZCwKKwkucmVjbGFpbV9tZW1v
cnkgPSByZWNsYWltX21lbW9yeSwKIH07CiAKIGludCB4ZW5fYmxraWZfeGVuYnVzX2luaXQodm9p
ZCkKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
