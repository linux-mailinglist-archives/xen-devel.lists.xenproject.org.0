Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5651633AA
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 22:00:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j49w3-0004Zd-Lc; Tue, 18 Feb 2020 20:57:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zbEH=4G=gmail.com=glenbarney@srs-us1.protection.inumbo.net>)
 id 1j49w3-0004ZX-2I
 for xen-devel@lists.xen.org; Tue, 18 Feb 2020 20:57:39 +0000
X-Inumbo-ID: 4beb7a1a-5291-11ea-ade5-bc764e2007e4
Received: from mail-qt1-x82c.google.com (unknown [2607:f8b0:4864:20::82c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4beb7a1a-5291-11ea-ade5-bc764e2007e4;
 Tue, 18 Feb 2020 20:57:38 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id d5so15625022qto.0
 for <xen-devel@lists.xen.org>; Tue, 18 Feb 2020 12:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UVdBbbZW4cRFLxcjonI5F5J4j1697k2OfJ5niC9UCvc=;
 b=YvERN5gdTFqmmijQv3rScGA1NRM93bEDLLoEPzP7SVUBRemDsf14OZLu1hrPfLW94E
 JzxpmfadJwzedhqEFoMxmE6Cf16u5zamHMnp4i05FW17BM/FcW2Fj/M1XujniKogIRRB
 +3dXD9pXhutbtBisA/L6CA8Es9fDsOAqhgOToVfr4Rzk4++Pe8lmlNAUqMfdbrL95xTn
 qOZVujCcF/nkYSQ/WETE57SfEUSUweRhvginaEF6IYPtyspmjLfqbdmuiXhC9+G5X029
 bPqzFDmRs2o/sg75gKC08HWWvvqjFeE3RzcgyWyTRUMbbZkjKNg76gUGUQDqsOqqZ/F9
 pbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UVdBbbZW4cRFLxcjonI5F5J4j1697k2OfJ5niC9UCvc=;
 b=k6SbIzLASdvdto3FJpRMN06oLAzd9vCTC8/AYYPvB5UbjeLeWu2IC/9vt89zTiWbKt
 LXY6cWv3cI8J4t+vbUO4JOjv5S9SNrMHCDL7CZZPxYANMivfVbx6XqQWjhRZqAbADbaT
 Hz6Nb48NolfsOFv2ZrY5vSYxve8mczZbjrvS8KY9TjICHaJLAcXhjHl9M3VkVgVPLdqy
 64eC5Oo7kmKEqV40vZsoTfdfpEf8aGaPP+IgStdMfRKei6sxdY/ZQ/qgWv+L1SxDeN/Q
 196LgH24TgftOIEfXY135YrFAbeHp4w8+1I31+CMSOcKWIFw5oDJfyP65cDM1oK+yj2S
 +ODA==
X-Gm-Message-State: APjAAAUB6lFsF7X66DLJpSqsloaWPPhNC9L0qYpbZ5H/spX8ytAfDhXx
 aZWPVZEkKpCtFuUqLXF1k5f4MkiIvykBfEW1Nt4=
X-Google-Smtp-Source: APXvYqz05KifX3B8iC+g1YZjnAqLy/4IrwAOw2HUA3o6YqR9Bq9oBIEjuKkl7L6qkzMv18umrN+ozPkmfsrXEEPWQho=
X-Received: by 2002:ac8:740c:: with SMTP id p12mr18850473qtq.286.1582059458161; 
 Tue, 18 Feb 2020 12:57:38 -0800 (PST)
MIME-Version: 1.0
References: <51dcae60df3a1ce7eaf51cbd5c51184645d51f53.camel@memset.com>
 <4e71d68f-2e64-363d-349b-33571a63eab2@prgmr.com>
 <2ea581e2-adca-8d5d-a54e-dba86d1535fa@eikelenboom.it>
 <CAAVVsFmS7-vYc0fDqOP_Dn_CfMSgftOJODPP-q-aD2NcWJLcTQ@mail.gmail.com>
 <606e3fd0-d0e4-22ec-722a-6bc981ece739@suse.com>
In-Reply-To: <606e3fd0-d0e4-22ec-722a-6bc981ece739@suse.com>
From: Glen <glenbarney@gmail.com>
Date: Tue, 18 Feb 2020 12:57:24 -0800
Message-ID: <CAAVVsF=JVh6R5PQzr_fiy81+SyrXTMdTMnOVzPg0vRry5MvVLw@mail.gmail.com>
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [Xen-devel] CPU Lockup bug with the credit2 scheduler
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
Cc: Alastair Browne <alastair.browne@memset.com>,
 Sander Eikelenboom <linux@eikelenboom.it>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVlcmdlbiAtCgpPbiBNb24sIEZlYiAxNywgMjAyMCBhdCAxMDo1MSBQTSBKw7xyZ2VuIEdyb8Of
IDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+ID4gQW55IHRob3VnaHRzLCBpbnNpZ2h0cyBvciBn
dWlkYW5jZSB3b3VsZCBiZSBncmVhdGx5IGFwcHJlY2lhdGVkIQo+IENhbiB5b3UgY2hlY2sgd2hl
dGhlciBhbGwgdmNwdXMgb2YgYSBoYW5naW5nIGd1ZXN0IGFyZSBjb25zdW1pbmcgdGltZQo+ICh2
aWEgeGwgdmNwdS1saXN0KSA/Cj4gSXQgd291bGQgYmUgaW50ZXJlc3RpbmcgdG8gc2VlIHdoZXJl
IHRoZSB2Y3B1cyBhcmUgcnVubmluZyBhcm91bmQuIENhbgo+IHlvdSBwbGVhc2UgY29weSB0aGUg
ZG9tVSdzIC9ib290L1N5c3RlbS5tYXAtPGtlcm5lbC12ZXJzaW9uPiB0byBkb20wCj4gYW5kIHRo
ZW4gaXNzdWU6Cj4gL3Vzci9saWIveGVuL2Jpbi94ZW5jdHggLUMgLVMgLXMgPGRvbXUtc3lzdGVt
LW1hcD4gPGRvbWlkPgo+IFRoaXMgc2hvdWxkIGdpdmUgYSBiYWNrdHJhY2UgZm9yIGFsbCB2Y3B1
cyBvZiA8ZG9taWQ+LiBUbyByZWNvZ25pemUgYQo+IGxvb3AgeW91IHNob3VsZCBpc3N1ZSB0aGF0
IG11bHRpcGxlIHRpbWVzLgo+IEp1ZXJnZW4KCkkndmUgYXBwbGllZCB0aGUgc2NoZWQ9Y3JlZGl0
IGJvb3Qgb3B0aW9uIHRvIGFsbCBteSBwcm9kdWN0aW9uIHNlcnZlcnMKYXQgdGhpcyBwb2ludCwg
aW4gcHJlcGFyYXRpb24gZm9yIGEgY2xpZW50IGN1dG92ZXIgdGhpcyB3ZWVrZW5kLgoKT25jZSB0
aGF0J3MgZG9uZSwgSSdtIGhhcHB5IG5leHQgd2VlayB0byByZWJvb3QgdGhlIG9sZCBjcmFzaGlu
ZwpzZXJ2ZXIgdG8gY3JlZGl0MiwgYW5kIHRlc3QuICBJJ2xsIHNhdmUgdGhlc2UgZGlyZWN0aW9u
cyBhbmQgYWR2aXNlLgoKVGhhbmsgeW91LApHbGVuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
