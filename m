Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC3716F8A9
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 08:44:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6rJt-00053j-2k; Wed, 26 Feb 2020 07:41:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n4kM=4O=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1j6rJs-00053e-2i
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 07:41:24 +0000
X-Inumbo-ID: 627ba572-586b-11ea-8cb6-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 627ba572-586b-11ea-8cb6-bc764e2007e4;
 Wed, 26 Feb 2020 07:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582702882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dYF7a8JyzBtDdYVvRKL3K9l8bplyJoGv9xj+cwhwRXA=;
 b=NbouWq+y7B3BwMDM2J42QFVw7CCeiXADYt5s/VEQkAdnT/WSkVPcMy2pdl+7xGf0BVm9ya
 R8tBjehoPCHmmCoVfLVYQZ4ziogkBZEvlDgIzfkEoTblPf6+LZttjjfVAZkXnwSuRvKq/p
 jKsfLqA8LZlfIVSCEGoPeVtSbTuN47A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-INC8K_4kN4GPctZJEukaQw-1; Wed, 26 Feb 2020 02:41:16 -0500
X-MC-Unique: INC8K_4kN4GPctZJEukaQw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3ACEE100726F;
 Wed, 26 Feb 2020 07:41:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A7711CB;
 Wed, 26 Feb 2020 07:41:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1090811386A6; Wed, 26 Feb 2020 08:41:08 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20200131130118.1716-1-vsementsov@virtuozzo.com>
 <20200131130118.1716-4-vsementsov@virtuozzo.com>
 <87v9nxwulz.fsf@dusky.pond.sub.org>
 <cff01a02-f99a-574d-c750-200da0c1d925@virtuozzo.com>
 <87wo8aesn0.fsf@dusky.pond.sub.org>
 <b53674e2-2484-4f18-fc3f-f2a2a3d6168b@virtuozzo.com>
Date: Wed, 26 Feb 2020 08:41:08 +0100
In-Reply-To: <b53674e2-2484-4f18-fc3f-f2a2a3d6168b@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Tue, 25 Feb 2020 18:22:50 +0300")
Message-ID: <87a755aj8r.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH v7 03/11] scripts: add coccinelle script to
 use auto propagated errp
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>, qemu-devel@nongnu.org,
 Laszlo Ersek <lersek@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Greg Kurz <groug@kaod.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPiB3
cml0ZXM6Cgo+IDI1LjAyLjIwMjAgMTU6NTIsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOgo+PiBW
bGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2c2VtZW50c292QHZpcnR1b3p6by5jb20+IHdy
aXRlczoKPj4KPj4+IDIzLjAyLjIwMjAgMTE6NTUsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOgo+
Pj4+IFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZAdmlydHVvenpvLmNv
bT4gd3JpdGVzOgo+Pj4+Cj4+Pj4+IFNjcmlwdCBhZGRzIEVSUlBfQVVUT19QUk9QQUdBVEUgbWFj
cm8gaW52b2NhdGlvbiB3aGVyZSBhcHByb3ByaWF0ZSBhbmQKPj4+Pj4gZG9lcyBjb3JyZXNwb25k
aW5nIGNoYW5nZXMgaW4gY29kZSAobG9vayBmb3IgZGV0YWlscyBpbgo+Pj4+PiBpbmNsdWRlL3Fh
cGkvZXJyb3IuaCkKPj4+Pj4KPj4+Pj4gVXNhZ2UgZXhhbXBsZToKPj4+Pj4gc3BhdGNoIC0tc3At
ZmlsZSBzY3JpcHRzL2NvY2NpbmVsbGUvYXV0by1wcm9wYWdhdGVkLWVycnAuY29jY2kgXAo+Pj4+
PiAgICAtLW1hY3JvLWZpbGUgc2NyaXB0cy9jb2NjaS1tYWNyby1maWxlLmggLS1pbi1wbGFjZSAt
LW5vLXNob3ctZGlmZiBcCj4+Pj4+ICAgIGJsb2NrZGV2LW5iZC5jIHFlbXUtbmJkLmMge2Jsb2Nr
L25iZCosbmJkLyosaW5jbHVkZS9ibG9jay9uYmQqfS5baGNdCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZAdmlydHVvenpv
LmNvbT4KPj4+Pj4gLS0tCj4+Pj4+Cj4+Pj4+IENDOiBFcmljIEJsYWtlIDxlYmxha2VAcmVkaGF0
LmNvbT4KPj4+Pj4gQ0M6IEtldmluIFdvbGYgPGt3b2xmQHJlZGhhdC5jb20+Cj4+Pj4+IENDOiBN
YXggUmVpdHogPG1yZWl0ekByZWRoYXQuY29tPgo+Pj4+PiBDQzogR3JlZyBLdXJ6IDxncm91Z0Br
YW9kLm9yZz4KPj4+Pj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz4KPj4+Pj4gQ0M6IEFudGhvbnkgUGVyYXJkIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29t
Pgo+Pj4+PiBDQzogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+Cj4+Pj4+IENDOiBTdGVmYW4g
SGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Cj4+Pj4+IENDOiAiUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kiIDxwaGlsbWRAcmVkaGF0LmNvbT4KPj4+Pj4gQ0M6IExhc3psbyBFcnNlayA8bGVy
c2VrQHJlZGhhdC5jb20+Cj4+Pj4+IENDOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNv
bT4KPj4+Pj4gQ0M6IFN0ZWZhbiBCZXJnZXIgPHN0ZWZhbmJAbGludXguaWJtLmNvbT4KPj4+Pj4g
Q0M6IE1hcmt1cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0LmNvbT4KPj4+Pj4gQ0M6IE1pY2hh
ZWwgUm90aCA8bWRyb3RoQGxpbnV4LnZuZXQuaWJtLmNvbT4KPj4+Pj4gQ0M6IHFlbXUtYmxvY2tA
bm9uZ251Lm9yZwo+Pj4+PiBDQzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4+Pj4+
Cj4+Pj4+ICAgIGluY2x1ZGUvcWFwaS9lcnJvci5oICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgMyArCj4+Pj4+ICAgIHNjcmlwdHMvY29jY2luZWxsZS9hdXRvLXByb3BhZ2F0ZWQtZXJycC5j
b2NjaSB8IDE1OCArKysrKysrKysrKysrKysrKysKPj4+Pj4gICAgMiBmaWxlcyBjaGFuZ2VkLCAx
NjEgaW5zZXJ0aW9ucygrKQo+Pj4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgc2NyaXB0cy9jb2Nj
aW5lbGxlL2F1dG8tcHJvcGFnYXRlZC1lcnJwLmNvY2NpCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL3FhcGkvZXJyb3IuaCBiL2luY2x1ZGUvcWFwaS9lcnJvci5oCj4+Pj4+IGluZGV4
IGI5NDUyZDQ4MDYuLjc5ZjhlOTUyMTQgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2luY2x1ZGUvcWFwaS9l
cnJvci5oCj4+Pj4+ICsrKyBiL2luY2x1ZGUvcWFwaS9lcnJvci5oCj4+Pj4+IEBAIC0xNDEsNiAr
MTQxLDkgQEAKPj4+Pj4gICAgICogICAgICAgICAuLi4KPj4+Pj4gICAgICogICAgIH0KPj4+Pj4g
ICAgICoKPj4+Pj4gKyAqIEZvciBtYXNzIGNvbnZlcnNpb24gdXNlIHNjcmlwdAo+Pj4+PiArICog
ICBzY3JpcHRzL2NvY2NpbmVsbGUvYXV0by1wcm9wYWdhdGVkLWVycnAuY29jY2kKPj4+Pj4gKyAq
Cj4+Pj4+ICAgICAqCj4+Pj4+ICAgICAqIFJlY2VpdmUgYW5kIGFjY3VtdWxhdGUgbXVsdGlwbGUg
ZXJyb3JzIChmaXJzdCBvbmUgd2lucyk6Cj4+Pj4+ICAgICAqICAgICBFcnJvciAqZXJyID0gTlVM
TCwgKmxvY2FsX2VyciA9IE5VTEw7Cj4+Pj4KPj4+PiBFeHRyYSBibGFuayBsaW5lLgo+Pj4+Cj4+
Pj4+IGRpZmYgLS1naXQgYS9zY3JpcHRzL2NvY2NpbmVsbGUvYXV0by1wcm9wYWdhdGVkLWVycnAu
Y29jY2kgYi9zY3JpcHRzL2NvY2NpbmVsbGUvYXV0by1wcm9wYWdhdGVkLWVycnAuY29jY2kKPj4+
Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+Pj4gaW5kZXggMDAwMDAwMDAwMC4uZmIwM2M4NzFj
Ygo+Pj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4+ICsrKyBiL3NjcmlwdHMvY29jY2luZWxsZS9hdXRv
LXByb3BhZ2F0ZWQtZXJycC5jb2NjaQo+Pj4+PiBAQCAtMCwwICsxLDE1OCBAQAo+Pj4+PiArLy8g
VXNlIEVSUlBfQVVUT19QUk9QQUdBVEUgKHNlZSBpbmNsdWRlL3FhcGkvZXJyb3IuaCkKPj4+Pj4g
Ky8vCj4+Pj4+ICsvLyBDb3B5cmlnaHQgKGMpIDIwMjAgVmlydHVvenpvIEludGVybmF0aW9uYWwg
R21iSC4KPj4+Pj4gKy8vCj4+Pj4+ICsvLyBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsg
eW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQo+Pj4+PiArLy8gaXQgdW5kZXIg
dGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQg
YnkKPj4+Pj4gKy8vIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9u
IDIgb2YgdGhlIExpY2Vuc2UsIG9yCj4+Pj4+ICsvLyAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRl
ciB2ZXJzaW9uLgo+Pj4+PiArLy8KPj4+Pj4gKy8vIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRl
ZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAo+Pj4+PiArLy8gYnV0IFdJVEhP
VVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKPj4+
Pj4gKy8vIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9T
RS4gIFNlZSB0aGUKPj4+Pj4gKy8vIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3Jl
IGRldGFpbHMuCj4+Pj4+ICsvLwo+Pj4+PiArLy8gWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEg
Y29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKPj4+Pj4gKy8vIGFsb25nIHdp
dGggdGhpcyBwcm9ncmFtLiAgSWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNl
cy8+Lgo+Pj4+PiArLy8KPj4+Pj4gKy8vIFVzYWdlIGV4YW1wbGU6Cj4+Pj4+ICsvLyBzcGF0Y2gg
LS1zcC1maWxlIHNjcmlwdHMvY29jY2luZWxsZS9hdXRvLXByb3BhZ2F0ZWQtZXJycC5jb2NjaSBc
Cj4+Pj4+ICsvLyAgLS1tYWNyby1maWxlIHNjcmlwdHMvY29jY2ktbWFjcm8tZmlsZS5oIC0taW4t
cGxhY2UgLS1uby1zaG93LWRpZmYgXAo+Pj4+PiArLy8gIGJsb2NrZGV2LW5iZC5jIHFlbXUtbmJk
LmMge2Jsb2NrL25iZCosbmJkLyosaW5jbHVkZS9ibG9jay9uYmQqfS5baGNdCj4+Pj4+ICsKPj4+
Pj4gK0BydWxlMEAKPj4+Pj4gKy8vIEFkZCBpbnZvY2F0aW9uIHRvIGVycnAtZnVuY3Rpb25zIHdo
ZXJlIG5lY2Vzc2FyeQo+Pj4+PiArLy8gV2Ugc2hvdWxkIHNraXAgZnVuY3Rpb25zIHdpdGggIkVy
cm9yICpjb25zdCAqZXJycCIKPj4+Pj4gKy8vIHBhcmFtZXRlciwgYnV0IGhvdyB0byBkbyBpdCB3
aXRoIGNvY2NpbmVsbGU/Cj4+Pj4+ICsvLyBJIGRvbid0IGtub3csIHNvLCBJIHNraXAgdGhlbSBi
eSBmdW5jdGlvbiBuYW1lIHJlZ2V4Lgo+Pj4+PiArLy8gSXQncyBzYWZlOiBpZiB3ZSBkaWQgbm90
IHNraXAgc29tZSBmdW5jdGlvbnMgd2l0aAo+Pj4+PiArLy8gIkVycm9yICpjb25zdCAqZXJycCIs
IEVSUlBfQVVUT19QUk9QQUdBVEUgaW52b2NhdGlvbgo+Pj4+PiArLy8gd2lsbCBmYWlsIHRvIGNv
bXBpbGUsIGJlY2F1c2Ugb2YgY29uc3QgdmlvbGF0aW9uLgo+Pj4+Cj4+Pj4gTm90IHNraXBwaW5n
IGEgZnVuY3Rpb24gd2Ugc2hvdWxkIHNraXAgZmFpbHMgdG8gY29tcGlsZS4KPj4+Pgo+Pj4+IFdo
YXQgYWJvdXQgc2tpcHBpbmcgYSBmdW5jdGlvbiB3ZSBzaG91bGQgbm90IHNraXA/Cj4+Pgo+Pj4g
VGhlbiBpdCB3aWxsIG5vdCBiZSB1cGRhdGVkLi4gTm90IGdvb2QgYnV0IEkgZG9uJ3QgaGF2ZSBi
ZXR0ZXIgc29sdXRpb24uCj4+PiBTdGlsbCwgSSBob3BlLCBmdW5jdGlvbiBjYWxsZWQgKmVycm9y
X2FwcGVuZF8qX2hpbnQgd2lsbCBub3QgcmV0dXJuIGVycm9yCj4+PiB0aHJvdWdoIGVycnAgcG9p
bnRlci4KPj4KPj4gU2VlbXMgbGlrZWx5LiAgSSBqdXN0IGRpc2xpa2UgaW5mZXJyaW5nIGJlaGF2
aW9yIGZyb20gbmFtZSBwYXR0ZXJucy4KPj4KPj4gSWRlYWxseSwgd2UgcmVjb2duaXplIHRoZSB0
cnVlIGV4Y2VwdGlvbmFsIHBhdHRlcm4gaW5zdGVhZCwgaS5lLiB0aGUKPj4gcHJlc2VuY2Ugb2Yg
Y29uc3QuICBCdXQgZmlndXJpbmcgb3V0IGhvdyB0byBtYWtlIENvY2NpbmVsbGUgZG8gdGhhdCBm
b3IKPj4gdXMgbWF5IGJlIG1vcmUgdHJvdWJsZSB0aGFuIGl0J3Mgd29ydGguCj4+Cj4+IEhtbS4u
LiAgQ29jY2luZWxsZSBtYXRjaGVzIHRoZSBwYXJhbWV0ZXIgZXZlbiB3aXRoIGNvbnN0IGR1ZSB0
byB3aGF0IGl0Cj4+IGNhbGxzICJpc29tb3JwaGlzbSIuICBDYW4gSSBkaXNhYmxlIGl0PyAgKlRp
bmtlciogKnRpbmtlcioKPj4KPj4gZGlmZiAtLWdpdCBhL3NjcmlwdHMvY29jY2luZWxsZS9hdXRv
LXByb3BhZ2F0ZWQtZXJycC5jb2NjaSBiL3NjcmlwdHMvY29jY2luZWxsZS9hdXRvLXByb3BhZ2F0
ZWQtZXJycC5jb2NjaQo+PiBpbmRleCBmYjAzYzg3MWNiLi4wYzQ0MTRiZmYzIDEwMDY0NAo+PiAt
LS0gYS9zY3JpcHRzL2NvY2NpbmVsbGUvYXV0by1wcm9wYWdhdGVkLWVycnAuY29jY2kKPj4gKysr
IGIvc2NyaXB0cy9jb2NjaW5lbGxlL2F1dG8tcHJvcGFnYXRlZC1lcnJwLmNvY2NpCj4+IEBAIC0y
MCwxNSArMjAsMTEgQEAKPj4gICAvLyAgLS1tYWNyby1maWxlIHNjcmlwdHMvY29jY2ktbWFjcm8t
ZmlsZS5oIC0taW4tcGxhY2UgLS1uby1zaG93LWRpZmYgXAo+PiAgIC8vICBibG9ja2Rldi1uYmQu
YyBxZW11LW5iZC5jIHtibG9jay9uYmQqLG5iZC8qLGluY2x1ZGUvYmxvY2svbmJkKn0uW2hjXQo+
PiAgIC1AcnVsZTBACj4+ICtAcnVsZTAgZGlzYWJsZSBvcHRpb25hbF9xdWFsaWZpZXJACj4+ICAg
Ly8gQWRkIGludm9jYXRpb24gdG8gZXJycC1mdW5jdGlvbnMgd2hlcmUgbmVjZXNzYXJ5Cj4+IC0v
LyBXZSBzaG91bGQgc2tpcCBmdW5jdGlvbnMgd2l0aCAiRXJyb3IgKmNvbnN0ICplcnJwIgo+PiAt
Ly8gcGFyYW1ldGVyLCBidXQgaG93IHRvIGRvIGl0IHdpdGggY29jY2luZWxsZT8KPj4gLS8vIEkg
ZG9uJ3Qga25vdywgc28sIEkgc2tpcCB0aGVtIGJ5IGZ1bmN0aW9uIG5hbWUgcmVnZXguCj4+IC0v
LyBJdCdzIHNhZmU6IGlmIHdlIGRpZCBub3Qgc2tpcCBzb21lIGZ1bmN0aW9ucyB3aXRoCj4+IC0v
LyAiRXJyb3IgKmNvbnN0ICplcnJwIiwgRVJSUF9BVVRPX1BST1BBR0FURSBpbnZvY2F0aW9uCj4+
IC0vLyB3aWxsIGZhaWwgdG8gY29tcGlsZSwgYmVjYXVzZSBvZiBjb25zdCB2aW9sYXRpb24uCj4+
IC1pZGVudGlmaWVyIGZuICF+ICJlcnJvcl9hcHBlbmRfLipfaGludCI7Cj4+ICsvLyBEaXNhYmxl
IG9wdGlvbmFsX3F1YWxpZmllciB0byBza2lwIGZ1bmN0aW9ucyB3aXRoICJFcnJvciAqY29uc3Qg
KmVycnAiCj4+ICsvLyBwYXJhbWV0ZXIsCj4+ICtpZGVudGlmaWVyIGZuOwo+PiAgIGlkZW50aWZp
ZXIgbG9jYWxfZXJyLCBFUlJQOwo+PiAgIEBACj4+Cj4+IENvdWxkIHlvdSB2ZXJpZnkgdGhpcyBy
ZXN1bHRzIGluIHRoZSBzYW1lIHRyZWUtd2lkZSBjaGFuZ2UgYXMgeW91cgo+PiB2ZXJzaW9uPwo+
Cj4gWWVzLCBubyBkaWZmZXJlbmNlLiBUaGFua3MhCgpFeGNlbGxlbnQhCgpbLi4uXQo+PiBMZXQn
cyBzZWUgd2hldGhlciBJIGdvdCBpdDoKPj4KPj4gKiBUaGUgZmlyc3QgcnVsZSAocnVsZTApIGFk
ZHMgRVJSUF9BVVRPX1BST1BBR0FURSgpIHRvIGFsbCBmdW5jdGlvbnMKPj4gICAgdGhhdCB0YWtl
IGFuIEVycm9yICoqIHBhcmFtZXRlciwgYW5kIGVpdGhlciBwYXNzIGl0IGVycm9yX3ByZXBlbmQo
KSBvcgo+PiAgICBlcnJvcl9hcHBlbmRfaGludCgpLCBvciB1c2UgbG9jYWxfZXJyLCBhbmQgZG9u
J3QgaGF2ZQo+PiAgICBFUlJQX0FVVE9fUFJPUEFHQVRFKCkgYWxyZWFkeSwgZXhjZXB0IGl0IHNr
aXBzIHRoZSBvbmVzIG5hbWVkCj4+ICAgIGVycm9yX2FwcGVuZF9GT09faGludCgpLiAgVWZmLgo+
Pgo+PiAgICBUaGUgInVzZSBsb2NhbF9lcnIiIHBhcnQgaXMgYW4gYXBwcm94aW1hdGlvbiBvZiAi
dXNlIGxvY2FsX2VyciArCj4+ICAgIGVycm9yX3Byb3BhZ2F0ZSgpIi4KPj4KPj4gICAgVGhlICJl
eGNlcHQgZm9yIHRoZSBvbmVzIG5hbWVkIGVycm9yX2FwcGVuZF9GT09faGludCgpIiBwYXJ0IGlz
IGFuCj4+ICAgIGFwcHJveGltYXRpb24gb2YgImV4Y2VwdCBmb3IgdGhlIG9uZXMgdGFraW5nIGFu
IEVycm9yICpjb25zdCAqCj4+ICAgIHBhcmFtZXRlciIuCj4+Cj4+ICAgIEVSUlBfQVVUT19QUk9Q
QUdBVEUoKSByZXF1aXJlcyB0aGUgRXJyb3IgKiogcGFyYW1ldGVyIHRvIGJlIG5hbWVkCj4+ICAg
IEBlcnJwLCB3aGljaCBuZWVkIG5vdCBiZSB0aGUgY2FzZS4gIFRoZSBuZXh0IHJ1bGUgZml4ZXMg
aXQgdXA6Cj4+Cj4+ICogVGhlIHNlY29uZCBydWxlIGVuc3VyZXMgdGhlIHBhcmFtZXRlciBpcyBu
YW1lZCBAZXJycCB3aGVyZXZlciB0aGUKPj4gICAgZmlyc3QgcnVsZSBhcHBsaWVkLCByZW5hbWlu
ZyBpZiBuZWNlc3NhcnkuCj4+Cj4+ICAgIENvcnJlY3Q/Cj4+Cj4+ICAgIEluY29ycmVjdCB0cmFu
c2Zvcm1hdGlvbiBmb2xsb3dlZCBieSBmaXh1cCBpcyBub3QgaWRlYWwsIGJlY2F1c2UgaXQKPj4g
ICAgY2FuIHRyaXAgdXAgcmV2aWV3ZXJzLiAgQnV0IGlkZWFsIGlzIHRvbyBleHBlbnNpdmU7IHRo
aXMgaXMgZ29vZAo+PiAgICBlbm91Z2guCj4+Cj4+ICogVGhlIHRoaXJkIHJ1bGUgKHJ1bGUxKSBl
bnN1cmVzIGZ1bmN0aW9ucyB0aGF0IHRha2UgYW4gRXJyb3IgKiplcnJwCj4+ICAgIHBhcmFtZXRl
ciBkb24ndCBkZWNsYXJlIGxvY2FsX2VyciwgZXhjZXB0IGl0IHNraXBzIHRoZSBvbmVzIG5hbWVk
Cj4+ICAgIGVycm9yX2FwcGVuZF9GT09faGludCgpLgo+Pgo+PiAgICBJbiBpc29sYXRpb24sIHRo
aXMgcnVsZSBtYWtlcyBubyBzZW5zZS4gIFRvIG1ha2Ugc2Vuc2Ugb2YgaXQsIHdlIG5lZWQKPj4g
ICAgY29udGV4dDoKPj4KPj4gICAgKiBTdWJzZXF1ZW50IHJ1bGVzIHJlbW92ZSBhbGwgdXNlcyBv
ZiBAZXJycCBmcm9tIGFueSBmdW5jdGlvbiB3aGVyZQo+Cj4gb2YgbG9jYWxfZXJyCj4KPj4gICAg
ICBydWxlMSBtYXRjaGVzLgo+Pgo+PiAgICAqIFByZWNlZGluZyBydWxlcyBlbnN1cmUgYW55IGZ1
bmN0aW9uIHdoZXJlIHJ1bGUxIG1hdGNoZXMgaGFzCj4+ICAgICAgRVJSUF9BVVRPX1BST1BBR0FU
RSgpLgo+Pgo+PiAgICBDb3JyZWN0Pwo+Cj4gT2gsIHllcywgZXZlcnl0aGluZyBpcyBjb3JyZWN0
LgoKVGhhbmsgeW91IQoKPj4KPj4gICAgVGhlIG5lZWQgZm9yIHRoaXMgbXVjaCBjb250ZXh0IGlz
IGhhcmQgb24gcmV2aWV3ZXJzLiAgR29vZCBlbm91Z2ggZm9yCj4+ICAgIHRyYW5zZm9ybWluZyB0
aGUgdHJlZSBub3csIGJ1dCBJJ2QgaGF0ZSBoYXZpbmcgdG8gbWFrZSBzZW5zZSBvZiB0aGlzCj4+
ICAgIGFnYWluIGluIHNpeCBtb250aHMuCj4KPiBPaGgsIHllcy4gRmFyIGZyb20gZ29vZCBkZXNp
Z24uIEkgY2FuIHRyeSB0byByZW9yZGVyIGNodW5rcyBhIGJpdC4KClBsZWFzZSBkb24ndCBzcGVu
ZCB0b28gbXVjaCBlZmZvcnQgb24gaXQuICBUaGUgc2NyaXB0IGlzIHByaW1hcmlseSBmb3IKaGVs
cGluZyB1cyBjb252ZXJ0IHRoZSB3aG9sZSB0cmVlIHdpdGhpbiBhIHNob3J0IHRpbWUgc3Bhbi4g
IFdlIG1heSBhbHNvCnVzZSBpdCBsYXRlciB0byBjb252ZXJ0IGluc3RhbmNlcyBvZiB0aGUgb2xk
IHBhdHRlcm4gdGhhdCBoYXZlIGNyZXB0CmJhY2suICBXZSBob3BlZnVsbHkgd29uJ3QgaGF2ZSB0
byBjaGFuZ2UgdGhlIHNjcmlwdCB0aGVuLiAgUmVhZGFiaWxpdHkKaXMgbm90IGFzIGltcG9ydGFu
dCBhcyBpdCBpcyBmb3IgY29kZSB3ZSBleHBlY3QgdG8gYmUgcmVhZCBhZ2FpbiBhbmQKYWdhaW4g
b3ZlciBhIGxvbmcgdGltZS4KClsuLi5dCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
