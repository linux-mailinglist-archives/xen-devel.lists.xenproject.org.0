Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCDA1802E9
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 17:14:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBhTt-0006qz-N7; Tue, 10 Mar 2020 16:11:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HhRS=43=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jBhTr-0006qs-SC
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 16:11:43 +0000
X-Inumbo-ID: d509c4f6-62e9-11ea-bec1-bc764e2007e4
Received: from mail-ed1-x52b.google.com (unknown [2a00:1450:4864:20::52b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d509c4f6-62e9-11ea-bec1-bc764e2007e4;
 Tue, 10 Mar 2020 16:11:43 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id z65so11084218ede.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2020 09:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=zTNIrEi2cxjGaVkBkhND0fFXK5fkj1IBgKHgKVphSgQ=;
 b=uvEvz4pQUgltTYoA6GTRkJhDJKJuc/5qP1jLJqj1rhbgewjKyuia2RlDrDZZUhNcJ0
 jzYH7TP8DADPicUgqHZrtN0jvK8ZyC0rxpTdG4ZZ+MU9SwBW7yaNGUbaP5tvTiFfGCgi
 Cmbj3zA9afChYAVbEVJGEcrn7wE/KjN8eRL9d25j+ZjAJOoQhOFS+jsRBLoNM25F4lr2
 C52vt5lBubrOHstabo3DDrm0XMgVKk0nAovdl8J+4KgRN+acWNAAUOS6cVPL15PMciGW
 /9/oo+NjNk8VqqHbtfT7ELuNiHrqje096ctBhjAy58PX3Qhfng0xBjT9cNIApwPeBBp/
 NtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=zTNIrEi2cxjGaVkBkhND0fFXK5fkj1IBgKHgKVphSgQ=;
 b=DeppTq1FFUpm6XoZTjlM1BhFqkRJdu0y/c8KEOr5W9zheLaM7SxvVlFBS4uIQ96Zh1
 fo01MBW/7Le8Iu18DViHtxa4vonqNp5Wz7V/HxenAsUOduxZtDHcvLhD3y/RwYIzbUxw
 CPUF3pYYputpgHUVrgIIONF0mv6iaO9cFPhop0DRMtY7YL34osfYyoWUwsJv92JZZZE4
 UX8rMoS6wz27UIhSjOcUUVvhr+ZcPyP6JAxAfn07hEVu/alDpfbjxftKHE02svf2fz3b
 EIkAcsNSetUNdwgh2xQO76nWZ07r2+eKgpkLJV91AzBwsHbENljm58s9POz84GLJIkAi
 trUQ==
X-Gm-Message-State: ANhLgQ0OQd/13ln3KE5GLMruKUP2obcRz18rMygMoszsJu9jiVvrNSMD
 1Hk+++7ADUmtFvTUsC2DpF4=
X-Google-Smtp-Source: ADFU+vtwVGiMFob4i2gV97B9xKAnDqueQrXTvldW0BHADSgCyvcRnDD6k4hk1RRN8EdcnAsrObrZ1Q==
X-Received: by 2002:a17:906:6812:: with SMTP id
 k18mr10738955ejr.346.1583856702573; 
 Tue, 10 Mar 2020 09:11:42 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id p28sm1386086edi.32.2020.03.10.09.11.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Mar 2020 09:11:42 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <8f1b522e-8667-c230-6671-7d70252634de@suse.com>
 <97e02ced-a5e4-a0d7-0435-124fff9f5dca@suse.com>
In-Reply-To: <97e02ced-a5e4-a0d7-0435-124fff9f5dca@suse.com>
Date: Tue, 10 Mar 2020 16:11:41 -0000
Message-ID: <003601d5f6f6$96459d30$c2d0d790$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH7RxHcSPCUV9p/rP8AmZSLBgrCeQJu8Uogp+PnTpA=
Content-Language: en-gb
Subject: Re: [Xen-devel] [PATCH v2 1/9] x86/HVM: reduce domain.h include
 dependencies
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
Reply-To: paul@xen.org
Cc: 'Petre Pircalabu' <ppircalabu@bitdefender.com>,
 'Tamas K Lengyel' <tamas@tklengyel.com>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Alexandru Isaila' <aisaila@bitdefender.com>,
 'Daniel de Graaf' <dgdegra@tycho.nsa.gov>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBTZW50OiAxMCBNYXJjaCAyMDIwIDE1OjQ4Cj4gVG86IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IFJvZ2VyIFBhdSBNb25uw6kKPiA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+OyBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz47IERhbmllbCBk
ZSBHcmFhZiA8ZGdkZWdyYUB0eWNoby5uc2EuZ292PjsgVGFtYXMgSwo+IExlbmd5ZWwgPHRhbWFz
QHRrbGVuZ3llbC5jb20+OyBQZXRyZSBQaXJjYWxhYnUgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIu
Y29tPjsgQWxleGFuZHJ1IElzYWlsYQo+IDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4KPiBTdWJq
ZWN0OiBbUEFUQ0ggdjIgMS85XSB4ODYvSFZNOiByZWR1Y2UgZG9tYWluLmggaW5jbHVkZSBkZXBl
bmRlbmNpZXMKPiAKPiBEcm9wICNpbmNsdWRlLXMgbm90IG5lZWRlZCBieSB0aGUgaGVhZGVyIGl0
c2VsZi4gUHV0IHRoZSBvbmVzIG5lZWRlZAo+IGludG8gd2hpY2hldmVyIG90aGVyIGZpbGVzIGFj
dHVhbGx5IG5lZWQgdGhlbS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
