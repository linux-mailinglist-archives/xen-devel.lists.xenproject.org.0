Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 485CF1071C1
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 12:54:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY7T0-00066t-D7; Fri, 22 Nov 2019 11:51:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nz3w=ZO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iY7Sy-00066o-V4
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 11:51:12 +0000
X-Inumbo-ID: 6114f6a4-0d1e-11ea-adbe-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6114f6a4-0d1e-11ea-adbe-bc764e2007e4;
 Fri, 22 Nov 2019 11:51:12 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id 4so4950916wro.7
 for <xen-devel@lists.xenproject.org>; Fri, 22 Nov 2019 03:51:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=YyioLMMBA9/ZSauFMMLj8nntcY6KE5nloonEn6YaDK8=;
 b=Tnfqo8u/gSYfWKGR9ztWrzAiyjZoxxlpJ+y8vPati1gxWRYEUaJ9JMGXl/XwalwOMT
 cmQi16qxVmmX5PAgx8U12Rff2IrPg/C4GD2kv02kgEVIFe3hNMmGTbUBgMjMBS5akQAO
 NsAJOuPokf9Ld2dABwSNTFDkpMUzQO5oBOduQ+77lOkE9CQQTaYGhFmMvrvoHsHiLqHb
 9XZTGIJLcMhq/CxOpuq0HihMCA8MXcQjkhWsEB2sHpZpoW6q0+m9KjCuUfwaZL54+gL7
 9W8AMfWU8o5Y3jKVbHIzTTPRWumQxv+pnRtOTi0Uh8JIlCJ2lwmxQuhe47gGJjw6Htnw
 pLJw==
X-Gm-Message-State: APjAAAVkwxpRbu2uWCl7UpxqxciurJuEWX0vISG5Xq/Of/8oITHhuMGM
 ZoxVMODgXpTNqjqgloWMRvg=
X-Google-Smtp-Source: APXvYqzdHNOQqy/5mw1gr6ABE1Yeq9z1WWyFyQZug2FecK+BbJ+skEreR5szV/Yfr8k6Wz3DpeQ9OA==
X-Received: by 2002:adf:df8e:: with SMTP id z14mr16619686wrl.190.1574423471426; 
 Fri, 22 Nov 2019 03:51:11 -0800 (PST)
Received: from debian (74.162.147.147.dyn.plus.net. [147.147.162.74])
 by smtp.gmail.com with ESMTPSA id w132sm3498013wma.6.2019.11.22.03.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 03:51:10 -0800 (PST)
Date: Fri, 22 Nov 2019 11:51:09 +0000
From: Wei Liu <wl@xen.org>
To: "Durrant, Paul" <pdurrant@amazon.com>
Message-ID: <20191122115109.g4ygelubtjcg2irq@debian>
References: <20191121185049.16666-1-liuwe@microsoft.com>
 <20191121185049.16666-7-liuwe@microsoft.com>
 <1952bbb1513241fe97f1c4da7e2ba03e@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1952bbb1513241fe97f1c4da7e2ba03e@EX13D32EUC003.ant.amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v4 6/8] x86: switch xen guest implementation
 to use hypervisor framework
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMTE6MDI6MzBBTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBYZW4tZGV2ZWwg
PHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgV2Vp
Cj4gPiBMaXUKPiA+IFNlbnQ6IDIxIE5vdmVtYmVyIDIwMTkgMTk6NTEKPiA+IFRvOiBYZW4gRGV2
ZWxvcG1lbnQgTGlzdCA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPgo+ID4gQ2M6IFdl
aSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgQW5kcmV3
IENvb3Blcgo+ID4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBNaWNoYWVsIEtlbGxleSA8
bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT47IEphbgo+ID4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IFN1YmplY3Q6
IFtYZW4tZGV2ZWxdIFtQQVRDSCB2NCA2LzhdIHg4Njogc3dpdGNoIHhlbiBndWVzdCBpbXBsZW1l
bnRhdGlvbgo+ID4gdG8gdXNlIGh5cGVydmlzb3IgZnJhbWV3b3JrCj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Cj4gW3NuaXBdIAo+ID4gZGlmZiAt
LWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QveGVuLmggYi94ZW4vaW5jbHVkZS9hc20t
Cj4gPiB4ODYvZ3Vlc3QveGVuLmgKPiA+IGluZGV4IDAxZGMzZWU2ZjYuLmRiOTBiNTUwYTcgMTAw
NjQ0Cj4gPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oCj4gPiArKysgYi94
ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oCj4gPiBAQCAtMjMsNiArMjMsNyBAQAo+ID4g
Cj4gPiAgI2luY2x1ZGUgPGFzbS9lODIwLmg+Cj4gPiAgI2luY2x1ZGUgPGFzbS9maXhtYXAuaD4K
PiA+ICsjaW5jbHVkZSA8YXNtL2d1ZXN0L2h5cGVydmlzb3IuaD4KPiA+IAo+ID4gICNkZWZpbmUg
WEVOX3NoYXJlZF9pbmZvICgoc3RydWN0IHNoYXJlZF9pbmZvCj4gPiAqKWZpeF90b192aXJ0KEZJ
WF9YRU5fU0hBUkVEX0lORk8pKQo+ID4gCj4gPiBAQCAtMzIsNyArMzMsNyBAQCBleHRlcm4gYm9v
bCB4ZW5fZ3Vlc3Q7Cj4gPiAgZXh0ZXJuIGJvb2wgcHZfY29uc29sZTsKPiA+ICBleHRlcm4gdWlu
dDMyX3QgeGVuX2NwdWlkX2Jhc2U7Cj4gPiAKPiA+IC12b2lkIHByb2JlX2h5cGVydmlzb3Iodm9p
ZCk7Cj4gPiArY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzICp4ZW5fcHJvYmUodm9pZCk7Cj4g
PiAgaW50IHhnX2FsbG9jX3VudXNlZF9wYWdlKG1mbl90ICptZm4pOwo+ID4gIGludCB4Z19mcmVl
X3VudXNlZF9wYWdlKG1mbl90IG1mbik7Cj4gPiAKPiA+IEBAIC00NCw3ICs0NSw3IEBAIERFQ0xB
UkVfUEVSX0NQVShzdHJ1Y3QgdmNwdV9pbmZvICosIHZjcHVfaW5mbyk7Cj4gPiAgI2RlZmluZSB4
ZW5fZ3Vlc3QgMAo+ID4gICNkZWZpbmUgcHZfY29uc29sZSAwCj4gCj4gTml0OiBUaGVzZSBzaG91
bGQgYmUgI2RlZmluZWQgdG8gZmFsc2UgcmF0aGVyIHRoYW4gMC4gVGhlIHJlc3QgTEdUTSBzbyB3
aXRoIHRob3NlIGZpeGVkLAoKVGhleSB3ZXJlIHBhcnQgb2YgZXhpc3RpbmcgY29kZSBzbyBJIGRp
ZG4ndCB0b3VjaCB0aGVtLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
