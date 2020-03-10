Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0372118012E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 16:07:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBgRV-0005gz-OQ; Tue, 10 Mar 2020 15:05:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HhRS=43=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jBgRU-0005gp-J0
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 15:05:12 +0000
X-Inumbo-ID: 89ea92f6-62e0-11ea-bec1-bc764e2007e4
Received: from mail-ed1-x52f.google.com (unknown [2a00:1450:4864:20::52f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89ea92f6-62e0-11ea-bec1-bc764e2007e4;
 Tue, 10 Mar 2020 15:05:11 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id dc19so16706830edb.10
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2020 08:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=XH8qK/kwh7WCz3FC7rjikN1oi9O/+LwU9LGrUs1KBzs=;
 b=H+MMjIH3tpgM8cfDn4WTSq7ZCqQJFlQ3Q+YDyQoPFphRbNyQjFjzgC/Z3L8ycxAJm8
 NwGPprhBqNrF1IxdhVTWx96w6bJfw9392DGfTxv+ta/aEMLI2HNbCxKdgEtFphIvSgZC
 XYnRq1YyYFZJbCq4wL5ik7yanvHso/TcSp2xZMISuXj7aewTTTmGN0BM8dGeUiFWlqKy
 w7gxtMAw+JULzzTCQXtVB2gtFBI871Pj9aVXaFuEz24GlLWTwPjueiP7i6iRsWkSbftR
 2/MbvGWE62aLLUoAzqXrqgESt+2HlAzbOXIq9sORviosVdJ8k9pKuoqj5puOwO0dMwoj
 XTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=XH8qK/kwh7WCz3FC7rjikN1oi9O/+LwU9LGrUs1KBzs=;
 b=pPN23jpYjE4TZxr0A4WepNidG5vAwo75OnXM9j0SPLBFyaey411JJmIPH8PJx2XvBu
 My0W5pTCuGXUvovtsJ+vnHGDYl20oJZjeRxkAbpq23xSlhMd1OGOftX6qjj8YdbdozA2
 w1jEDOjgH1CGOT+97T9Gyd8Z1L1R1r+YxoUL3qIHkiFTksWSLakQnR9zlg0HSNbwxapQ
 Sh1WOTUR1SMPTpKJu3/2RQQIAjkxMyCSp/vPPpU5oVvH6Mi7icn2UeTpDY/3MFcha3pe
 ShFWUqLShLG8Jx62scXsKC8OLEH93LNW9kHZDoOcsvkK1lf7KWwuFX9sI1EZNW6hEv8m
 FncQ==
X-Gm-Message-State: ANhLgQ1B6HsbaJGf9Keb9kIbOR4VLVZAVvM7sbwDVijBxWt/JFhfP4aO
 HeGqODWjeJIuR8+sBVgUcjqYLRvmM0Y=
X-Google-Smtp-Source: ADFU+vsHOfk4a8TjiPUwvOY6GIylVn8bFleIDyJmWXZSs60WBooRLFUhmU7JI/6goVHsc918EjT7nA==
X-Received: by 2002:a17:906:1be2:: with SMTP id
 t2mr20107143ejg.357.1583852711068; 
 Tue, 10 Mar 2020 08:05:11 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id r26sm3764100edw.46.2020.03.10.08.05.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Mar 2020 08:05:10 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200309102304.1251-1-paul@xen.org>
 <20200309102304.1251-4-paul@xen.org>
 <ae9cc4a6-0378-571c-9d46-0561e536884f@suse.com>
 <001301d5f6e0$61aa5e00$24ff1a00$@xen.org>
 <bbb910df-2f61-2a67-b360-82b5988810d7@suse.com>
In-Reply-To: <bbb910df-2f61-2a67-b360-82b5988810d7@suse.com>
Date: Tue, 10 Mar 2020 15:05:09 -0000
Message-ID: <002d01d5f6ed$4b0b2000$e1216000$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH8MQiuRQX2aixYfaKKXR3nYohrUgMqvTqhAWAuss4C0MCOMwISxzrQp6oDo9A=
Content-Language: en-gb
Subject: Re: [Xen-devel] [PATCH v5 3/6] x86 / pv: do not treat PGC_extra
 pages as RAM
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
Cc: xen-devel@lists.xenproject.org, 'Paul Durrant' <pdurrant@amazon.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBTZW50OiAxMCBNYXJjaCAyMDIwIDE0OjU5Cj4gVG86IHBhdWxAeGVuLm9y
Zwo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7ICdQYXVsIER1cnJhbnQnIDxw
ZHVycmFudEBhbWF6b24uY29tPjsgJ0FuZHJldyBDb29wZXInCj4gPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+OyAnV2VpIExpdScgPHdsQHhlbi5vcmc+OyAnUm9nZXIgUGF1IE1vbm7DqScgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMy82XSB4ODYgLyBw
djogZG8gbm90IHRyZWF0IFBHQ19leHRyYSBwYWdlcyBhcyBSQU0KPiAKPiBPbiAxMC4wMy4yMDIw
IDE0OjMyLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPj4gU2VudDog
MDkgTWFyY2ggMjAyMCAxMzowNAo+ID4+IFRvOiBwYXVsQHhlbi5vcmcKPiA+PiBDYzogeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5j
b20+OyBBbmRyZXcgQ29vcGVyCj4gPj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBXZWkg
TGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
Cj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAzLzZdIHg4NiAvIHB2OiBkbyBub3QgdHJlYXQg
UEdDX2V4dHJhIHBhZ2VzIGFzIFJBTQo+ID4+Cj4gPj4gT24gMDkuMDMuMjAyMCAxMToyMywgcGF1
bEB4ZW4ub3JnIHdyb3RlOgo+ID4+PiBGcm9tOiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpv
bi5jb20+Cj4gPj4+Cj4gPj4+IFRoaXMgcGF0Y2ggbW9kaWZpZXMgc2V2ZXJhbCBwbGFjZXMgd2Fs
a2luZyB0aGUgZG9tYWluJ3MgcGFnZV9saXN0IHRvIG1ha2UKPiA+Pj4gdGhlbSBpZ25vcmUgUEdD
X2V4dHJhIHBhZ2VzOgo+ID4+Pgo+ID4+PiAtIGR1bXBfcGFnZWZyYW1lX2luZm8oKSBzaG91bGQg
aWdub3JlIFBHQ19leHRyYSBwYWdlcyBpbiBpdHMgZHVtcCBhcyBpdAo+ID4+PiAgIGRldGVybWlu
ZXMgd2hldGhlciB0byBkdW1wIHVzaW5nIGRvbWFpbl90b3RfcGFnZXMoKSB3aGljaCBhbHNvIGln
bm9yZXMKPiA+Pj4gICBQR0NfZXh0cmEgcGFnZXMuCj4gPj4KPiA+PiBUaGlzIGFyZ3VtZW50IGxv
b2tzIHdyb25nIHRvIG1lOiBMZXQncyB0YWtlIGFuIGV4YW1wbGUgLSBhIGRvbWFpbgo+ID4+IGFs
bW9zdCBmdWxseSBjbGVhbmVkIHVwLCB3aXRoIDggIm5vcm1hbCIgYW5kIDMgImV4dHJhIiBwYWdl
cyBsZWZ0Lgo+ID4+IGRvbWFpbl90b3RfcGFnZXMoKSByZXR1cm5zIDggaW4gdGhpcyBjYXNlLCBp
LmUuICJub3JtYWwiIHBhZ2UKPiA+PiBkdW1waW5nIGRvZXNuJ3QgZ2V0IHNraXBwZWQuIEhvd2V2
ZXIsIHRoZXJlIG5vdyB3b24ndCBiZSBhbnkgdHJhY2UKPiA+PiBvZiB0aGUgImV4dHJhIiBwYWdl
cywgYmVjYXVzZSB0aGV5J3JlIGFsc28gbm90IG9uIHhlbnBhZ2VfbGlzdCwKPiA+PiB3aGljaCBn
ZXRzIGFsbCBpdHMgcGFnZXMgZHVtcGVkIGluIGFsbCBjYXNlcy4gQ29ycmVjdCByZXN0b3JhdGlv
bgo+ID4+IG9mIG9yaWdpbmFsIGJlaGF2aW9yIHdvdWxkIGJlIHRvIGR1bXAgIm5vcm1hbCIgcGFn
ZXMgd2hlbiB0aGVyZQo+ID4+IGFyZSBsZXNzIHRoYW4gMTAsIGFuZCB0byBkdW1wIGFsbCAiZXh0
cmEiIHBhZ2VzLiAoU2FtZSBvZiBjb3Vyc2UKPiA+PiBnb2VzIGZvciBsaXZlIGRvbWFpbnMsIHdo
ZXJlICJub3JtYWwiIHBhZ2UgZHVtcGluZyB3b3VsZCBiZQo+ID4+IHNraXBwZWQgaW4gdGhlIGNv
bW1vbiBjYXNlLCBidXQgeGVuaGVhcCBwYWdlcyB3b3VsZCBiZSBkdW1wZWQsIGFuZAo+ID4+IGhl
bmNlIHNvIHNob3VsZCBiZSAiZXh0cmEiIG9uZXMuKSBBcyBpbmRpY2F0ZWQgYmVmb3JlLCB0aGUg
cmVtb3ZhbAo+ID4+IG9mIHRoZSBBUElDIGFzc2lzdCBwYWdlIGZyb20geGVucGFnZV9saXN0IHdh
cyBhbHJlYWR5IHNsaWdodGx5Cj4gPj4gcmVncmVzc2luZyBpbiB0aGlzIHJlZ2FyZCAoYXMgd2Vs
bCBhcyBpbiBhdCBsZWFzdCBvbmUgb3RoZXIgd2F5LAo+ID4+IEknbSBhZnJhaWQpLCBhbmQgeW91
J3JlIG5vdyBkZWxpYmVyYXRlbHkgbWFraW5nIHRoZSByZWdyZXNzaW9uCj4gPj4gZXZlbiBiaWdn
ZXIuCj4gPgo+ID4gSSB0aG91Z2h0IHRoZSBpZGVhIGhlcmUgd2FzIHRoYXQgdGhlIGRvbWhlYXAg
ZHVtcCBsb29wIHNob3VsZCBiZQo+ID4gZHVtcGluZyAnbm9ybWFsJyBwYWdlcyBzbyBpdCBzZWVt
cyByZWFzb25hYmxlIHRvIG1lIHRoYXQgdGhlIG51bWJlcgo+ID4gb2YgcGFnZXMgZHVtcGVkIHRv
IG1hdGNoIHRoZSB2YWx1ZSByZXR1cm5lZCBieSBkb21haW5fdG90X3BhZ2VzKCkuCj4gCj4gSSBu
ZXZlciB0aG91Z2h0IG9mIHN1Y2ggYSBjb25uZWN0aW9uLiBUbyBtZSB0aGUgaW52b2NhdGlvbiBv
Zgo+IGRvbWFpbl90b3RfcGFnZXMoKSB0aGVyZSBpcyB0aGVyZSBvbmx5IHRvIGF2b2lkIG92ZXJs
eSBtdWNoIG91dHB1dC4KPiAKPiA+IFdvdWxkIHlvdSBwZXJoYXBzIGJlIGhhcHBpZXIgaWYgd2Ug
cHV0ICdleHRyYScgcGFnZXMgb24gc2VwYXJhdGUKPiA+IHBhZ2UgbGlzdCwgd2hpY2ggY2FuIGJl
IHVuY29uZGl0aW9uYWxseSBkdW1wZWQgc28gYXMgSSB0cmFuc2l0aW9uCj4gPiB4ZW5oZWFwIHBh
Z2VzIHRvICdleHRyYScgcGFnZXMgdGhleSBkb24ndCBnZXQgbWlzc2VkPyBJdCB3b3VsZAo+ID4g
YWxzbyBnZXQgcmlkIG9mIHNvbWUgb2YgdGhlIG90aGVyIGNoZWNrcyBmb3IgUEdDX2V4dHJhIHRo
YXQgSQo+ID4gaGF2ZSB0byBpbnRyb2R1Y2UgYmVjYXVzZSB0aGV5IGN1cnJlbnRseSBlbmQgdXAg
b24gdGhlIGRvbWFpbidzCj4gPiBwYWdlIGxpc3QuCj4gCj4gSG1tLCB3YXNuJ3QgaXQgYW4gaW50
ZW5kZWQgc2lkZSBlZmZlY3QgdG8gaGF2ZSBhbGwgcGFnZXMgb24gb25lCj4gbGlzdCBub3c/CgpU
aGF0IHdvdWxkIGJlIG5pY2UsIGJ1dCBJIGNhbm5vdCByZWNvbmNpbGUgdGhhdCB3aXRoIHVuY29u
ZGl0aW9uYWxseSBkdW1waW5nIGFsbCBleHRyYSBwYWdlcy4uLiBvdGhlcndpc2UgZHVtcF9wYWdl
ZnJhbWVfaW5mbygpIHdvdWxkIGFsd2F5cyBoYXZlIHRvIHdhbGsgdGhlIGVudGlyZSBwYWdlX2xp
c3Qgbm8gbWF0dGVyIGhvdyBsb25nIGl0IHdhcy4KCj4gSW50cm9kdWNpbmcgYSAzcmQgbGlzdCAo
ZXZlbiBpZiBqdXN0IHRlbXBvcmFyaWx5LCB1bnRpbAo+IHhlbnBhZ2VfbGlzdCBjYW4gYmUgZHJv
cHBlZCkgd2lsbCBiZSBzb21ld2hhdCB1Z2x5IGJlY2F1c2Ugb2YgaG93Cj4gYXJjaF9mcmVlX2hl
YXBfcGFnZSgpIHdvcmtzLgoKWWVzLCBidXQgaXQgd291bGQgYXQgbGVhc3QgYmUgdGVtcG9yYXJ5
LgoKPiBJbiByZXBseSB0byBwYXRjaCA2IEkgZGlkIHN1Z2dlc3QgdG8KPiBoYXZlIGEgc2VwYXJh
dGUgbGlzdCwgYnV0IHdpdGhvdXQgdGFraW5nIHRoZXNlIHBhZ2VzIG9mZgo+IGQtPnBhZ2VfbGlz
dCwKCkhvdyB3b3VsZCB0aGF0IHdvcmsgd2l0aG91dCBhZGRpbmcgYW4gZXh0cmEgcGFnZV9saXN0
X2VudHJ5IGludG8gc3RydWN0IHBhZ2VfaW5mbz8KCj4gc3VjaCB0aGF0IGhlcmUgeW91IHdvdWxk
IHNraXAgdGhlbSBpbiB0aGUgbWFpbgo+IGRvbWFpbiBwYWdlIGR1bXBpbmcgbG9vcCwgYnV0IHlv
dSB3b3VsZCB0aGVuIHRyYXZlcnNlIHRoYXQgc2Vjb25kCj4gbGlzdCBhbmQgZHVtcCBhbGwgb2Yg
aXRzIGVsZW1lbnRzLCBqdXN0IGxpa2UgeGVucGFnZV9saXN0IGdldHMKPiBoYW5kbGVkIHRoZXJl
Lgo+IAoKV2VsbCwgdGhhdCdzIHdoYXQgSSdtIHRyeWluZyB0byBhY2hpZXZlLCB5ZXMuCgogIFBh
dWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
