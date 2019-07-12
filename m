Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5145167939
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jul 2019 10:16:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmDAI-000294-VP; Sat, 13 Jul 2019 08:13:54 +0000
Received: from mail6.bemta25.messagelabs.com ([195.245.230.43])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <pbrobinson@gmail.com>) id 1hlubO-0004xQ-GC
 for xen-devel@lists.xensource.com; Fri, 12 Jul 2019 12:24:38 +0000
Received: from [46.226.52.100] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-a.eu-west-1.aws.symcld.net id AF/B6-10653-40C782D5;
 Fri, 12 Jul 2019 12:24:36 +0000
Authentication-Results: mx.messagelabs.com; spf=pass 
 (server-21.tower-264.messagelabs.com: domain of gmail.com designates 
 209.85.166.67 as permitted sender) smtp.mailfrom=gmail.com; dkim=pass 
 (good signature) header.i=@gmail.com header.s=20161025; dmarc=pass 
 (p=none sp=quarantine adkim=r aspf=r) header.from=gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBIsWRWlGSWpSXmKPExsVyMXSZsy5LjUa
 swYMWWYt7U96zOzB6bO/bxR7AGMWamZeUX5HAmvHk/HX2goWCFWc/7mJvYHzB28XIxSEkMI1R
 4uDlbiYQh0VgFqvE6TlX2EAcCYFtrBI7Tt5l7WLkBHLKJKZ9XQ1lF0lM7//MBhM/+W4ZI4jNK
 yAocXLmExaIsddYJH4/62UCSXAKeEucabgCVMTBwSagLbG71RIkzCKgKrHmzl8miN4AiefHLo
 LNERZwlLix/SOYLSKgKbF71yxWkJnMAlNYJGY2zgdLMAMlWrf/ZoewtSWWLXzNPIFRcBaSO2Y
 hKZuFpGwBI/MqRoukosz0jJLcxMwcXUMDA11DQyNdQ0sTXUMTS73EKt1EvdRS3fLU4hJdQ73E
 8mK94src5JwUvbzUkk2MwOBOKTg0dQfjyiOv9Q4xSnIwKYnyTuZTjxXiS8pPqcxILM6ILyrNS
 S0+xCjDwaEkwfu9SiNWSLAoNT21Ii0zBxhpMGkJDh4lEV4VkDRvcUFibnFmOkTqFKMxx5KN8x
 Yxc3T8WrSIWYglLz8vVUqcVwakVACkNKM0D24QLAFcYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7
 BqCTMKw0yhSczrwRu3yugU5iATlH1UwM5pSQRISXVwORhkyblsII36tgy01+ZMl18qelsrxVb
 JuxmcOOb/HNxWdztn5LNL797vi5zXvog5HSNxAnurp9MltMfHVvxYsqR3gvLa47qW35886TZt
 /SntELu4rVuE9a2mZpdm77x++NIFY/u45uud/WkPT11wdrc4LhJZtX6Rfvb1ocJyC1OD5C317
 155JPIDanPXMnF/Yl8nb8vHew7d5zvc0bzo9an/UkTGFgPnDreeWzVJa7ma0dYiiJCp3JuMDn
 wKMBc/5fHjsk7r72xOFJ3MNrc8X7IFck5/xT6BFmOBKX5fl4Y+fCxw5EXOY6B/zb/+K1T+LTQ
 OzboR1bz1vIYUcNpa6uFHdhnN5g8OxuXkmfYlqbEUpyRaKjFXFScCAAeHtc5ewMAAA==
X-Env-Sender: pbrobinson@gmail.com
X-Msg-Ref: server-21.tower-264.messagelabs.com!1562934275!1196906!1
X-Originating-IP: [209.85.166.67]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: 
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10006 invoked from network); 12 Jul 2019 12:24:36 -0000
Received: from mail-io1-f67.google.com (HELO mail-io1-f67.google.com)
 (209.85.166.67)
 by server-21.tower-264.messagelabs.com with ECDHE-RSA-AES128-GCM-SHA256
 encrypted SMTP; 12 Jul 2019 12:24:36 -0000
Received: by mail-io1-f67.google.com with SMTP id z3so19948939iog.0
 for <xen-devel@lists.xensource.com>; Fri, 12 Jul 2019 05:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XhlFFwASONd6AWh6YV4QeCiBhfZYbzsrx9EMoRyLA+4=;
 b=DEmli0EKbhDMozVU9ww9gwI8QNe61/W+ssQtkJdLhIGiV63TstlkpQQwaIubGlYIH+
 kJxH4ALOA2eBvf9oQ81JU4YvnXoGD7IWoFqZL3DGm4AAFQh6jrSIJqDXZAyseulH8ROz
 GnqNjqzbie0OEfUxHkCitzXJrjNO85WIp2odoG4jnzK8j8bXzUfNDa1TD4SSFGMrdgTf
 95Iuzj2VhQqAzKLQHKvUwzSMprAes2bL5ZOxeD80Qzp+a/ltsCzCBZMnikwIyT7MbhBR
 HaHeFp92WvC6KDqVVakUs6+7yYkDHUatbppNR49B9beFocr1oC6mJUF74GwctAgEbCYh
 kiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XhlFFwASONd6AWh6YV4QeCiBhfZYbzsrx9EMoRyLA+4=;
 b=BrRLQQP5L9bZThpwB3I/aboiyo65uQlkL9akb00DO9MjJ3xZvyn6rIKbbiZdixjW3A
 RgTc/CpyUu77eAbCcSCxG/oa4EvYJyr7pMOBk6Bf3xtiF0wy8VKFnUluQwto2deAEEBq
 zUlLnTp6MAX7SYrwEXMk+t9lNKxEyGStsic3ee1et2zyElMd2MpvRMaP7HcMXHGbTIJT
 02RrqmJlX47agwQo8zN1W5H5WwGGvODNbFTtVn5wJ/eIN/uwvelc4CFq1umJcKwpDk1/
 DELlYnjOblpMTgpoL4hO3c2kjaTHgsaBHMITaKlWXF6GbKMIx/XnIx4tP2YnzyqrktRn
 0vZg==
X-Gm-Message-State: APjAAAXVLJX8A64wxQzH1TPp4/DRgj9zqKLxbhGjRJW1kVUhsZEDNBSL
 GXUZPct2J6Q46mVbR3p/VV/CqJ7pk4gqFfSa/MQ=
X-Google-Smtp-Source: APXvYqwj2MWVlhdHWh/2vQ5NhMUNLJyYjlPwzE1O6KgB82yZaCxWpGK+BBvrQcrLKp8vQARmVdEccPdcOWFX6Ftb4u0=
X-Received: by 2002:a5d:8c97:: with SMTP id g23mr10420547ion.250.1562934275043; 
 Fri, 12 Jul 2019 05:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <1499367541.22465.102.camel@fedoraproject.org>
 <20170706191317.GE21146@char.us.oracle.com>
 <1499370325.22465.107.camel@fedoraproject.org>
 <06A5F10A-88B7-440F-AADB-56A2F1704A86@xenproject.org>
 <c3fb1646ea39459200c925964fb46ec8a5c04470.camel@redhat.com>
 <081a209f86a08562e9f7a087ba434ad8b1b04309.camel@fedoraproject.org>
 <c230c496979d149d2663528defd7a15d52f7ce6a.camel@infradead.org>
 <CALeDE9Mn_Zd+gCrGHSCkQ8utJ4Hv0G=T=120++yZpRQF5F1sKA@mail.gmail.com>
 <87b8a119fbbd27dd706362e4e57e810cd88d0351.camel@fedoraproject.org>
 <e296b35081171fa5f6d64e53e9fbb91e0b9e7d77.camel@infradead.org>
In-Reply-To: <e296b35081171fa5f6d64e53e9fbb91e0b9e7d77.camel@infradead.org>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Fri, 12 Jul 2019 13:24:23 +0100
Message-ID: <CALeDE9ML4uTBKbrvW3=F2Js=h6ZLO_CJ5e4a5zH3_LR-VjQq7w@mail.gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
X-Mailman-Approved-At: Sat, 13 Jul 2019 08:13:53 +0000
Subject: Re: [Xen-devel] Criteria / validation proposal: drop Xen
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
Cc: Adam Williamson <adamwill@fedoraproject.org>,
 For testing and quality assurance of Fedora releases
 <test@lists.fedoraproject.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Lars Kurth <lars.kurth.xen@gmail.com>, Daniel Kiper <daniel.kiper@oracle.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xensource.com,
 Committers <committers@xenproject.org>,
 "MICHAEL A. YOUNG" <m.a.young@durham.ac.uk>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMTIsIDIwMTkgYXQgNTo1MCBBTSBEYXZpZCBXb29kaG91c2UgPGR3bXcyQGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCAyMDE5LTA3LTExIGF0IDE0OjE5IC0wNzAw
LCBBZGFtIFdpbGxpYW1zb24gd3JvdGU6Cj4gPiBZZWFoLCB0aGF0J3Mgd2hlcmUgSSB3YXMgZ29p
bmcgdG8gZ28gbmV4dCAodGhlcmUgaGFzIGFscmVhZHkgYmVlbiBhCj4gPiB0aHJlYWQgYWJvdXQg
dGhpcyB0aGlzIG1vcm5pbmcpLiBJZiB3aGF0IHdlIGNhcmUgYWJvdXQgaXMgdGhhdCBGZWRvcmEK
PiA+IGJvb3RzIG9uIEVDMiwgdGhhdCdzIHdoYXQgd2Ugc2hvdWxkIGhhdmUgaW4gdGhlIGNyaXRl
cmlhLCBhbmQgd2hhdCB3ZQo+ID4gc2hvdWxkIHRlc3QuCj4KPiBXaGlsZSB0cnlpbmcgaGFyZCB0
byBhdm9pZCBhICJoYWhhIGhlIHdvdWxkIHNheSB0aGF0IiByZXNwb25zZSwgSSBkbwo+IGdlbnVp
bmVseSBiZWxpZXZlIHRoYXQncyBhIHJlYXNvbmFibGUgY2FuYXJ5IGFuZCBjb3VsZCBjb3ZlciBt
b3N0IG9mCj4gdGhlIHVzZSBjYXNlcyB0aGF0IHZhcmlvdXMgdXNlcnMgZXZlbiBvdXRzaWRlIEVD
MiB3b3VsZCBjYXJlIGFib3V0Lgo+Cj4gPiBJSVJDLCB3aGF0IHdlIGhhdmUgcmlnaHQgbm93IGlz
IGEgc29tZXdoYXQgdmFndWUgc2V0dXAgd2hlcmUgd2UganVzdAo+ID4gaGF2ZSAnbG9jYWwnLCAn
ZWMyJyBhbmQgJ29wZW5zdGFjaycgY29sdW1ucy4gVGhlIGluc3RydWN0aW9ucyBmb3IKPiA+ICJB
bWF6b24gV2ViIFNlcnZpY2VzIiBqdXN0IHNheSAiTGF1bmNoIGFuIGluc3RhbmNlIHdpdGggdGhl
IEFNSSB1bmRlcgo+ID4gdGVzdCIuIFNvIHdlIGNvdWxkIHByb2JhYmx5IHN0YW5kIHRvIHRpZ2h0
ZW4gdGhhdCB1cCBhIGJpdCwgYW5kIGRlZmluZQo+ID4gc3BlY2lmaWMgaW5zdGFuY2UgdHlwZShz
KSB0aGF0IHdlIHdhbnQgdG8gdGVzdC9ibG9jayBvbi4KPgo+IEkgdGhpbmsgd2UgY2FuIGRlZmlu
ZSBhIHNldCBvZiBpbnN0YW5jZSB0eXBlcyB0aGF0IHdvdWxkIGNvdmVyIHdoYXQgaXQKPiBtYWtl
cyBzZW5zZSB0byB0ZXN0LiBEbyB3ZSBzdGlsbCBjYXJlIGFib3V0IGFjdHVhbCBQViBndWVzdHMg
b3Igb25seQo+IEhWTT8gSSB0aGluayBpdCBtYWtlcyBzZW5zZSB0byB0ZXN0IGd1ZXN0cyB3aXRo
IFhlbiBuZXRiYWNrIGFuZCBibGtiYWNrCj4gcmF0aGVyIHRoYW4gb25seSBFTkEgYW5kIE5WTWUs
IGJ1dCBGZWRvcmEgcHJvYmFibHkgd2FudHMgdG8gdGVzdCB0aGUKPiBsYXR0ZXIgdHdvICphbnl3
YXkqLgo+Cj4gRG8gd2Ugd2FudCB0byBkbyB0aGlzIGJ5IG1ha2luZyBzdXJlIHlvdSBoYXZlIGZy
ZWUgY3JlZGl0cyB0byBydW4gdGhlCj4gYXBwcm9wcmlhdGUgdGVzdHMgZGlyZWN0bHkuLi4gb3Ig
aXMgaXQgYmV0dGVyIGFsbCByb3VuZCBmb3IgdXMgdG8ganVzdAo+IGRvIHRoaXMgb24gbmlnaHRs
eSBidWlsZHMgZm9yIG91cnNlbHZlcz8KPgo+IFRoZSBsYXR0ZXIgYnJpbmdzIG1lIHRvIGEgcXVl
c3Rpb24gdGhhdCdzIGJlZW4gYnVnZ2luZyBtZSBmb3IgYSB3aGlsZSDigJQKPiBob3cgaW4gJERF
SVRZJ3MgbmFtZSAqZG8qIEkgbGF1bmNoIHRoZSBsYXRlc3Qgb2ZmaWNpYWwgRmVkb3JhIEFNSQo+
IGFueXdheT8gSSBjYW4ndCBmaW5kIGl0IHRocm91Z2ggdGhlIG5vcm1hbCBHVUkgbGF1bmNoIHBy
b2Nlc3MgYW5kIGhhdmUKPiB0byBnbyB0byBnZXRmZWRvcmEub3JnIGFuZCBjbGljayBhcm91bmQg
Zm9yIGEgd2hpbGUgYmVjYXVzZSBJIGZpbmQgdGhlCj4gc3BlY2lmaWMgQU1JIElEIGZvciB0aGUg
dGhhdCByZWdpb24sIGFuZCB0aGVuIG1hbnVhbGx5IGVudGVyIHRoYXQgdG8KPiBsYXVuY2ggdGhl
IGluc3RhbmNlLiBDYW4ndCB3ZSBmaXggdGhhdCBzbyBJIGNhbiBqdXN0IHNlbGVjdCAnRmVkb3Jh
IDMwJwo+IHdpdGggYSBzaW5nbGUgY2xpY2s/IFdob3NlIGhlYWRzIGRvIEkgaGF2ZSB0byBiYXNo
IHRvZ2V0aGVyIHRvIG1ha2UKPiB0aGF0IHdvcms/CgpTbyB0aGUgZWFzaWVzdCB3YXkgdG8gZG8g
dGhpcyBpcyBieSBnb2luZyB0byBsaW5rIFsxXSBhbmQgc2VsZWN0IHRoZQpjbG91ZCBpbWFnZSAi
Y2xpY2sgdG8gbGF1bmNoIiBpdCBnaXZlcyB5b3UgYSBsaXN0IG9mIEFXUyByZWdpb25zIGFuZAp0
YWtlcyB5b3UgZGlyZWN0IHRvIHRoZSBBV1MgZGlhbG9ncyB0byBydW4gdGhlbS4KClsxXSBodHRw
czovL2FsdC5mZWRvcmFwcm9qZWN0Lm9yZy9jbG91ZC8KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
