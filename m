Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E5D123F31
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 06:40:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihS11-0000gO-OF; Wed, 18 Dec 2019 05:36:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hOUS=2I=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1ihS10-0000gJ-EU
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 05:36:54 +0000
X-Inumbo-ID: 65ecaa0c-2158-11ea-b6f1-bc764e2007e4
Received: from mail-qk1-x731.google.com (unknown [2607:f8b0:4864:20::731])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65ecaa0c-2158-11ea-b6f1-bc764e2007e4;
 Wed, 18 Dec 2019 05:36:53 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id z14so581077qkg.9
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2019 21:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=i+hyPWKkRJ3TBKDBjErt9VsTN/sZmNegRE1EZnMcvfA=;
 b=G2PqrXXShCKtLqzlc7+/4AfuEADEagB0hAEi9xjBjdV73j+5sqUS9tms0d85mT2lMr
 0U2zVzvAl4uWptTG+9+CQUiYdV+MgNOXFY0Li9INx1xOMzZ3qKToQRXOwJqyRx2x5mc1
 7KIAtgp7NoJpv0UiYtZ7U0RGHckv9SDXPwQ73GsPIyeZwFmo9YqLWeGaP20SyD4Gj/Ot
 iqF3srN29UxFo2he8DM7HDkjCkfD0cyi/ywnytj1zpXG5R0OzhaSy1E6lx9jWMNpKNAl
 qbKtGYID0q7pdgW0ftePvBt2i+idlBbK/WuQRLhNmjO143NI1+KM2ZqIdXrt6WZSHLlr
 vYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=i+hyPWKkRJ3TBKDBjErt9VsTN/sZmNegRE1EZnMcvfA=;
 b=nfXzSzaqRfYdhBBnUypets37UcSHQDrlKCnt7mnlIKwS+ELTpPqJVdnGCpZFlHhRk6
 T1UuHbpAbD1p1KyISqifBlkKa//fOInUbYucIOzbN2kizb6qdRyWPXkLwnpP5gRkbRI0
 lfAC4B42IKwqHVLi7LEObt0N/mKjRbm7pDCyXAxGHcHMkqTNPtgY+0MZ3FysL4jsUWjO
 vZlDi3vT0g4LE0nbYy3J5Cz2/M7qEIJ/mrX53kcIWFR10KfT188iHtj6ASq059PSzc5W
 zVw155KJeGH8TC4u5pqH+mDIlkMv+sJwaEsEHUFDf5Na4EYObDJiTHQmq/yzj/dbDm6S
 5Y5A==
X-Gm-Message-State: APjAAAUWQaVgOmLjf/fm+PYlNrwO0W2lyTQxib4V7IwtiJjfYMVrjaCW
 VnvkqRTkJzPHTkH19gOJ9pTW25JwfDPbOf4MITDl0Q==
X-Google-Smtp-Source: APXvYqzjAkjhMSSGSfVOYBeIWeyKUBeEYz1GiHlbClH2E2DWV2cspknqNGtO6BrTjDJqYrjb+L8D95pCfx5rC6vqAIE=
X-Received: by 2002:a05:620a:918:: with SMTP id
 v24mr769795qkv.22.1576647413501; 
 Tue, 17 Dec 2019 21:36:53 -0800 (PST)
MIME-Version: 1.0
References: <ec80c318-355b-21cf-2152-f396c41dda16@suse.com>
 <b7ae9bd5-477f-40d7-27f1-68aaf2745b1a@suse.com>
 <7157118a-a40b-e72c-3924-1acefc4b9e35@suse.com>
In-Reply-To: <7157118a-a40b-e72c-3924-1acefc4b9e35@suse.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Tue, 17 Dec 2019 21:36:42 -0800
Message-ID: <CAMmSBy80bkS5VG+HbBN-YxOiqZiRj1xWjzirFnVPMrb_AxbU1A@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] clock source in PV Linux
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBEZWMgMTEsIDIwMTkgYXQgMTI6NDEgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPgo+IE9uIDExLjEyLjIwMTkgMDk6MTYsIErDvHJnZW4gR3Jvw58gd3Jv
dGU6Cj4gPiBPbiAxMS4xMi4xOSAwODoyOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4gSsO8cmdl
biwgQm9yaXMsCj4gPj4KPiA+PiBJJ3ZlIG5vdGljZWQKPiA+Pgo+ID4+IDw2PmNsb2Nrc291cmNl
OiBTd2l0Y2hlZCB0byBjbG9ja3NvdXJjZSB0c2MKPiA+Pgo+ID4+IGFzIHRoZSBmaW5hbCBjbG9j
a3NvdXJjZSByZWxhdGVkIGJvb3QgbWVzc2FnZSBpbiBhIFBWIERvbTAncwo+ID4+IGxvZyB3aXRo
IDUuNC4yLiBJcyBpdCBpbnRlbnRpb25hbCB0aGF0IGl0J3Mgbm90IHRoZSAieGVuIiBvbmUKPiA+
PiB0aGF0IGdldHMgdXNlZCBieSBkZWZhdWx0Pwo+ID4KPiA+IEkgdGhpbmsgdGhpcyBpcyBmaW5l
LiBJIGp1c3QgdGVzdGVkIGl0IGFuZCBJJ20gc2VlaW5nIHRoZSBzYW1lIGluIGRvbTAsCj4gPiB3
aGlsZSBpbiBhIFBWIGRvbVUgInhlbiIgaXMgdXNlZCBwZXIgZGVmYXVsdC4KPiA+Cj4gPiBJbiBk
b20wICJ0c2MiIHNob3VsZCBiZSBva2F5IGluIGNhc2UgaXQgaXMgc3RhYmxlLiBPciBhcmUgeW91
IGV4cGVjdGluZwo+ID4gcHJvYmxlbXMgd2l0aCB0aGF0IHNldHRpbmc/Cj4KPiBXZWxsLCBmaXJz
dCBvZiBhbGwgSSBmb3VuZCB0aGlzIHN1cnByaXNpbmcuIFdoZXRoZXIgdGhlcmUgYXJlIHByb2Js
ZW1zIHRvCj4gYmUgZXhwZWN0ZWQgbGFyZ2VseSBkZXBlbmRzIG9uIHRoZSByZWxpYWJpbGl0eSBv
ZiB0aGUgInN0YWJsZSIgZGV0ZWN0aW9uCj4gaW4gUFYgRG9tMC4KClJlbGF0ZWQgcXVlc3Rpb246
IGRvZXMgdGhpcyBtZWFuIHRoYXQgdHNjIGlzIG5vdyBkZWZhdWx0IGZvciBQVkggYXMgd2VsbD8K
ClRoZSByZWFzb24gSSdtIGFza2luZyBpcyBiZWNhdXNlIEknbSBzdGlsbCBhIGJpdCB3b3JyaWVk
IGFib3V0IHRoZQpjbG9jayBkcmlmdCB3aXRoIHRzYy4KClRoYW5rcywKUm9tYW4uCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
