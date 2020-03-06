Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF62917BF6A
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 14:43:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jADDv-0005YT-Al; Fri, 06 Mar 2020 13:41:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pagX=4X=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jADDt-0005YJ-9a
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 13:41:05 +0000
X-Inumbo-ID: 1fcdbdf4-5fb0-11ea-b52f-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fcdbdf4-5fb0-11ea-b52f-bc764e2007e4;
 Fri, 06 Mar 2020 13:41:04 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id g19so2530305eds.11
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2020 05:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=lZT8cDM2+wMgzSb6a015wsS/06jEiKYkp4wZwqUKTRQ=;
 b=mH38LTjqGZcVGMYOxhvgiQ79mALH6ZqMrUE8sisZznUHaGwPlY9LBo7LvO8KYgSdi/
 Bm4WB35NU1MspwFhkhQqN+SVDZQoGlm9j9vMFRKC2gpZ53EVhkNSS3+a+rHQiytNdFFs
 SM0kgRPv3upNaAf83wjhpXBJRcCKfpq4UJIJ/R4PPikS+dfICwiTeEgYivJAF13fbb1d
 DKQXmLNatPM2JSTvwSiUHkV4xEOInQIJttOWLM/YLjU//QWAotQsPOkkRXFFAsrFMgC3
 9bqaCKI7hFvT0YWDWz1YitIukJyZK69+1QHNpB0O4oPOgKiJtJdeeLHTgp2Z6ZqfOlCv
 TjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=lZT8cDM2+wMgzSb6a015wsS/06jEiKYkp4wZwqUKTRQ=;
 b=Fxd20BANkorKkScqsl0Ij0h5hZGZSWg9NM242dKlwipfCJQQbBJP+XX8BKbakC/cGk
 aCWtVcEeDNiOdW16eO72hGugd6KzN68ykeZdiYz4X0oIGRjuoIkbo/MFxC3IjGXRdOx+
 82YSHZdMnPZstRin5PVPYQQR3b5gCneENDVKXFaYaooW7307zDhdKvdeUVv1b/U//Vbr
 pckuzD3MEVQIrGqCS7IhhaZxFjoyFqkko9xZAihKmpIpT4s4LJ+Y8tt3jVj4ZjiNDGJP
 FDndY4uFB0kVXv7zLvll8f0l3e/X42h1tJmn/tZIZyGqstzG6S32SlSvnaC4NrTR9wHv
 z4zw==
X-Gm-Message-State: ANhLgQ0r0LnfAj/MKivYuGnfln8dyeeRSYGcXUo2ZU1SENUc5ycgjG8K
 JD+YfkZHknsJ2SPFOdvilkc=
X-Google-Smtp-Source: ADFU+vtqI1lqd3JuSuCGpVy+LGzEOzCx3KVT7wqety0qDOqZZTfy/KDf3tnVB6PISiARvz5iJ8cU/g==
X-Received: by 2002:a17:906:cc99:: with SMTP id
 oq25mr2868681ejb.154.1583502063716; 
 Fri, 06 Mar 2020 05:41:03 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id dm24sm1239337edb.57.2020.03.06.05.41.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Mar 2020 05:41:03 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>, "'Paul Durrant'" <xadimgnik@gmail.com>
References: <20200225095357.3923-1-pdurrant@amazon.com>
 <20200225095357.3923-3-pdurrant@amazon.com>
 <2653c2cf-9add-dd0c-03e5-36d951ee621e@suse.com>
 <132bb159fcf049ae87e402537ccc7d2a@EX13D32EUC003.ant.amazon.com>
 <b9bb89e1-1490-c3e6-11b6-f6944750a791@suse.com>
 <f361c33b-1fdd-d296-edb3-3dbe8d0bc18b@xen.org>
 <7170eda8579cc4c9e6a899980a87e0eb0e9c71cd.camel@amazon.co.uk>
 <7de58cb0-d8b5-ea86-f573-151356edbb79@suse.com>
 <d14b125acb6f22db084d889b4b1abcf5e5b1815e.camel@infradead.org>
 <bc28ea41-0d13-4182-db2e-9eeaf4408e3b@suse.com>
 <dc77e892d554d671e609374df8f2d19e88dc357b.camel@infradead.org>
 <54f5cb50-ebe6-7dc9-d46c-6b7a8f388577@suse.com>
 <007f01d5f3b9$110d20b0$33276210$@xen.org>
 <733e2b6c-c0b2-39a7-7def-0d18ca280649@suse.com>
 <00cc01d5f3ba$e3a89300$aaf9b900$@xen.org>
 <91c6ffa0-a53e-86a5-4544-935616bb3eee@suse.com>
In-Reply-To: <91c6ffa0-a53e-86a5-4544-935616bb3eee@suse.com>
Date: Fri, 6 Mar 2020 13:41:01 -0000
Message-ID: <001001d5f3bc$e100e0b0$a302a210$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHD9Mrly5QQ+U9AQ89eqYSTTsEMIQIV/wViAwgpctwBNyIEIAHpa+LAAblNjQsBqDUVNwIs7XNKAxxGkKMBX3/WGQGtsIQjAe/9+oEBzNtD1wE4VylLASXTpusCTJ9Aq6d8nT4g
Content-Language: en-gb
Subject: Re: [Xen-devel] [PATCH 2/2] domain: use PGC_extra domheap page for
 shared_info
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
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org, konrad.wilk@oracle.com,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com,
 'David Woodhouse' <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBTZW50OiAwNiBNYXJjaCAyMDIwIDEzOjM2Cj4gVG86IFBhdWwgRHVycmFu
dCA8eGFkaW1nbmlrQGdtYWlsLmNvbT4KPiBDYzogc3N0YWJlbGxpbmlAa2VybmVsLm9yZzsganVs
aWVuQHhlbi5vcmc7IFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tOyB3bEB4ZW4ub3JnOwo+IGtv
bnJhZC53aWxrQG9yYWNsZS5jb207IGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb207IGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb207Cj4gZ2VvcmdlLmR1bmxhcEBjaXRyaXguY29tOyB4ZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmc7ICdEYXZpZCBXb29kaG91c2UnIDxkd213MkBpbmZyYWRlYWQu
b3JnPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSBkb21haW46IHVzZSBQR0NfZXh0cmEgZG9t
aGVhcCBwYWdlIGZvciBzaGFyZWRfaW5mbwo+IAo+IE9uIDA2LjAzLjIwMjAgMTQ6MjYsIFBhdWwg
RHVycmFudCB3cm90ZToKPiA+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxp
c3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuIEJldWxpY2gKPiA+PiBTZW50OiAw
NiBNYXJjaCAyMDIwIDEzOjI0Cj4gPj4KPiA+PiBPbiAwNi4wMy4yMDIwIDE0OjEzLCBQYXVsIER1
cnJhbnQgd3JvdGU6Cj4gPj4+IE15IGFpbSBpcyB0byBtYWtlIHRoZSBzZXBhcmF0aW9uIGFidW5k
YW50bHkgb2J2aW91cyBieSBnZXR0aW5nIHJpZAo+ID4+PiBvZiBzaGFyZWQgeGVuaGVhcCBwYWdl
cyAoZm9yIG5vbi1zeXN0ZW0gZG9tYWlucyBhdCBsZWFzdCkgYnV0IEkKPiA+Pj4gY2FuJ3QgZG8g
dGhhdCBiZWZvcmUgY29udmVydGluZyBzaGFyZWRfaW5mbyBhbmQgZ3JhbnQgc2hhcmVkL3N0YXR1
cwo+ID4+PiBmcmFtZXMgdG8gZG9taGVhcC4KPiA+Pgo+ID4+IEZvbGxvd2luZyBEYXZpZCdzIHZh
cmlvdXMgcmVwbGllcyAtIGluc3RlYWQgb2YgZ29pbmcgdGhpcyByb3V0ZSBvZgo+ID4+IHJlcGxh
Y2luZyB0aGUgc2hhcmluZyBvZiB4ZW5oZWFwIHBhZ2VzIGJ5IGRpZmZlcmVudCBsb2dpYywgdGhl
Cj4gPj4gc2FtZSBvdWdodCB0byBiZSBhY2hpZXZhYmxlIGJ5IG1ha2luZyB0aGUgYmFja2luZyBh
bGxvY2F0aW9ucyBjb21lCj4gPj4gZnJvbSB0aGUgY29ycmVjdCBwb29sPwo+ID4+Cj4gPgo+ID4g
SSBzdGlsbCBwcmVmZXIgdGhlIHNpbXBsaWZpY2F0aW9uIG9mIG5vdCBoYXZpbmcgdG8gY2xlYW4g
dXAgdGhlCj4gPiBzaGFyZWQgeGVuaGVhcCBwYWdlIGxpc3QgaW4gZG9tYWluX2tpbGwoKSBzbyBJ
TU8gaXQgaXMgc3RpbGwgd29ydGgKPiA+IGl0IGZvciB0aGF0IGFsb25lLgo+IAo+IEkgZG9uJ3Qg
c2VlIGFueXRoaW5nIHZlcnkgc3BlY2lhbCB3aXRoIHRoZSBjbGVhbmluZyB1cCBpbgo+IGRvbWFp
bl9raWxsKCkgLyBkb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoKS4gV2hhdCBJJ2QgdmlldyBh
cwo+IG1vcmUgZGVzaXJhYmxlIGluIHRoaXMgcmVnYXJkIGlzIHRoZSBnZW5lcmFsIGZhY3Qgb2Yg
bmVlZGluZwo+IHR3byBsaXN0cy4gQnV0IHlvdSByZWFsaXplIHRoZXJlJ3MgYSBkb3duc2lkZSB0
byB0aGlzIGFzIHdlbGw/Cj4gZHVtcF9wYWdlZnJhbWVfaW5mbygpIHdpbGwgcmVsaWFibHkgc2hv
dyBfYWxsXyBYZW4gaGVhcCBwYWdlcwo+IGFzc29jaWF0ZWQgd2l0aCBhIGRvbWFpbiwgYnV0IGl0
IHdpbGwgb25seSBldmVyIHNob3cgdXAgdG8gMTAKPiBwYWdlcyBvbiAtPnBhZ2VfbGlzdCBmb3Ig
YSBkb21haW4gdGhhdCdzIG5vdCBhbHJlYWR5IGJlaW5nCj4gY2xlYW5lZCB1cC4KClRoYXQncyBu
b3QgbXVjaCBvZiBhIGRvd25zaWRlIHRob3VnaCBJIGRvbid0IHRoaW5rLiBUaGUgeGVuaGVhcCAo
b3IgUEdDX2V4dHJhIGRvbWhlYXAgcGFnZXMpIGFyZSAnc3BlY2lhbCcgYW5kIHNvIGluZm8gYWJv
dXQgdGhlbSBvdWdodCB0byBiZSBhdmFpbGFibGUgdmlhIGFuIGFsdGVybmF0ZSBkdW1wIGZ1bmN0
aW9uIGFueXdheSAoYW5kIGlmIG5vdCBhbHJlYWR5LCBpdCBjYW4gYmUgYWRkZWQpLgoKICBQYXVs
Cgo+IAo+IEphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
