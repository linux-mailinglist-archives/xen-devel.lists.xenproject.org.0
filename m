Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFBF13091E
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jan 2020 17:33:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1io8nI-0002bR-8h; Sun, 05 Jan 2020 16:30:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FFS2=22=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1io8nG-0002bM-RL
 for xen-devel@lists.xenproject.org; Sun, 05 Jan 2020 16:30:22 +0000
X-Inumbo-ID: ab0003c6-2fd8-11ea-aa39-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab0003c6-2fd8-11ea-aa39-12813bfff9fa;
 Sun, 05 Jan 2020 16:30:22 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j42so47019714wrj.12
 for <xen-devel@lists.xenproject.org>; Sun, 05 Jan 2020 08:30:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MeLF5um+BIQM8wEboFZ6hNbvq5IOo6WhV+mprMmLwpI=;
 b=D/IdMaaBsgT5ZM3PIAPq/BVIiQNQHsJbFgSHqr+4bZlR2fhb3ZjwZlhYHfndLp34Vk
 GjpuswEqFTiRCV2+ofxsUnadQfVIXg20woFUROwCmAJmq3YhzssvjkkYm6/xg0VQCKdp
 zOQNF8Ov+lZSJtlLSyksRuaULgAFahADQyxGxQv+Ru/vVsyLvfU6Pl5KL5xz7feaSAaT
 NIp7AjkbXuzTElhKyb8bsa7rhLQ2tp4CUSUw11yCebP06fAyipBIY7dVTD6ShKNMGgf5
 gUgSph+olccoMUdX0bMOL6GiZ01RQ3kd96QjPPqOIvM6s2Dp58mjB4DgFWy72l0f3t0G
 RZvQ==
X-Gm-Message-State: APjAAAUUb/z6i4qEg6J5X48Op8K/bOpsZW7qQhLdN4nKqMO+VPMmbQUL
 YGWWAIsUOA17py/+YxO5tGk=
X-Google-Smtp-Source: APXvYqzY6gSA3ECSoFfptHUEHRom0X2Wi5pdfMAiqlQTpV62VP9cXSzGEt3PsMfwIWQo0x/m8z9XKw==
X-Received: by 2002:adf:ee92:: with SMTP id
 b18mr103114290wro.281.1578241821379; 
 Sun, 05 Jan 2020 08:30:21 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id f1sm69758277wrp.93.2020.01.05.08.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2020 08:30:20 -0800 (PST)
Date: Sun, 5 Jan 2020 16:30:19 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200105163019.rv2uzpimzokbelhg@debian>
References: <20200103200742.23917-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200103200742.23917-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] x86/shim: Short circuit control/hardware
 checks in PV_SHIM_EXCLUSIVE builds
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMDMsIDIwMjAgYXQgMDg6MDc6NDJQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgbmV0IGRpZmZzdGF0IGlzOgo+ICAgYWRkL3JlbW92ZTogMC8xMyBncm93L3No
cmluazogMjUvMTI5IHVwL2Rvd246IDYyOTcvLTIwNDY5ICgtMTQxNzIpCj4gCj4gV2l0aCB0aGUg
Zm9sbG93aW5nIG9iamVjdHMvZnVuY3Rpb25zIHJlbW92ZWQgZW50aXJlbHk6Cj4gICBpb21tdV9o
d2RvbV9ub25lICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDEgICAgICAgLSAgICAgIC0x
Cj4gICBod2RvbV9tYXhfb3JkZXIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDQgICAg
ICAgLSAgICAgIC00Cj4gICBleHRyYV9od2RvbV9pcnFzICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDQgICAgICAgLSAgICAgIC00Cj4gICBjdGxkb21fbWF4X29yZGVyICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDQgICAgICAgLSAgICAgIC00Cj4gICBhY3BpX2MxZV9xdWlyayAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgNDMgICAgICAgLSAgICAgLTQzCj4gICBodm1f
cGlycV9lb2kgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgNjIgICAgICAgLSAgICAg
LTYyCj4gICBtYXhfb3JkZXIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOTQg
ICAgICAgLSAgICAgLTk0Cj4gICBjb25yaW5nX3B1dHMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAxMDQgICAgICAgLSAgICAtMTA0Cj4gICBwcm9wYWdhdGVfbm9kZSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAxMTkgICAgICAgLSAgICAtMTE5Cj4gICBtbWlvX3JvX2VtdWxh
dGVfb3BzICAgICAgICAgICAgICAgICAgICAgICAgICAyMjQgICAgICAgLSAgICAtMjI0Cj4gICBt
bWNmZ19pbnRlcmNlcHRfb3BzICAgICAgICAgICAgICAgICAgICAgICAgICAyMjQgICAgICAgLSAg
ICAtMjI0Cj4gICBwY2lfY2ZnX29rICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAy
OTUgICAgICAgLSAgICAtMjk1Cj4gICBwMm1fbG9jayAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICA1NDYgICAgICAgLSAgICAtNTQ2Cj4gCj4gQW5kIHRoZSBmb2xsb3dpbmcgcmVk
dWNlZCB0byBzdHViczoKPiAgIGFyY2hfaW9tbXVfaHdkb21faW5pdCAgICAgICAgICAgICAgICAg
ICAgICAgIDg1MiAgICAgICAyICAgIC04NTAKPiAgIHAybV9hZGRfZm9yZWlnbiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDg4MCAgICAgIDE2ICAgIC04NjQKPiAKPiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6
IFdlaSBMaXUgPHdsQHhlbi5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
