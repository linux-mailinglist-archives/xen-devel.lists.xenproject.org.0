Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A070B7C7093
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 16:45:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615832.957316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqwv3-0000ss-KO; Thu, 12 Oct 2023 14:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615832.957316; Thu, 12 Oct 2023 14:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqwv3-0000r2-H1; Thu, 12 Oct 2023 14:44:09 +0000
Received: by outflank-mailman (input) for mailman id 615832;
 Thu, 12 Oct 2023 14:44:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZdDw=F2=casper.srs.infradead.org=BATV+4118f3c7cdc1feb80d69+7354+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qqwv1-0000qw-Mp
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 14:44:08 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb34eb7c-690d-11ee-98d4-6d05b1d4d9a1;
 Thu, 12 Oct 2023 16:44:06 +0200 (CEST)
Received: from [2001:8b0:10b:5:8fd2:9e3e:cd2f:735f]
 (helo=u3832b3a9db3152.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qqwup-00HSUF-4K; Thu, 12 Oct 2023 14:43:55 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: cb34eb7c-690d-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RCGoc6KqqltWggrW6SimibQ1DlxSv60q2tDrHJshffs=; b=VFVXm/pyFJYQilsOh0YcsxiAt/
	r97iKwxOKRNHJSoTDO1oXS7d2c3szm6gkkM8nvCv2HqXjywypDixbBPTCPX44hX62u8S/Mpxs5onF
	yjqwX5p7ugpU+iOO3WruLl3EwWtz4kjI1N4hQWBxcH95cCGySPVeANsHEcS6mjTDiY315UWgwFqhb
	FvhoV+Sdu8pSaCBe23tBOqRzG+0luoEHzww4Ck4t3QANgkXcpyJOlq2IH9Cc+9VHbPKmTPLOwxBST
	uxDbsc5S175i5R4/ZMXMQFm+xHPbB17emnkd5pIHulnEJnoJ7pNh1GQjYohTMzcZJGiUKUt+aLgwc
	Rjr3tNEQ==;
Message-ID: <bb0e7a9f016f22993303dd10c2c92a6ef3c7ebf6.camel@infradead.org>
Subject: Re: [PATCH v6 06/38] mm: Add default definition of set_ptes()
From: David Woodhouse <dwmw2@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-arch@vger.kernel.org, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, Mike Rapoport
 <rppt@kernel.org>,  xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 12 Oct 2023 15:43:54 +0100
In-Reply-To: <ZSf9DNSvgbT9DLmk@casper.infradead.org>
References: <20230802151406.3735276-1-willy@infradead.org>
	 <20230802151406.3735276-7-willy@infradead.org>
	 <4c63ee3634ccfed7d687fcbdd9db60663bce481f.camel@infradead.org>
	 <ZSf9DNSvgbT9DLmk@casper.infradead.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-BEEc0mgIHGyqyvDjEr79"
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-BEEc0mgIHGyqyvDjEr79
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIzLTEwLTEyIGF0IDE1OjA1ICswMTAwLCBNYXR0aGV3IFdpbGNveCB3cm90ZToK
PiBPbiBUaHUsIE9jdCAxMiwgMjAyMyBhdCAwMjo1MzowNVBNICswMTAwLCBEYXZpZCBXb29kaG91
c2Ugd3JvdGU6Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGFyY2hfZW50ZXJfbGF6eV9tbXVfbW9kZSgp
Owo+ID4gPiArwqDCoMKgwqDCoMKgwqBmb3IgKDs7KSB7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBzZXRfcHRlKHB0ZXAsIHB0ZSk7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBpZiAoLS1uciA9PSAwKQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcHRlcCsrOwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cHRlID0gX19wdGUocHRlX3ZhbChwdGUpICsgKDFVTCA8PCBQRk5fUFRFX1NISUZUKSk7Cj4gPiA+
ICvCoMKgwqDCoMKgwqDCoH0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgYXJjaF9sZWF2ZV9sYXp5X21t
dV9tb2RlKCk7Cj4gPiAKPiA+IFRoaXMgYnJlYWtzIHRoZSBYZW4gUFYgZ3Vlc3QuCj4gPiAKPiA+
IEluIG1vdmVfcHRlcygpIGluIG1tL21yZW1hcC5jIHdlIGFyY2hfZW50ZXJfbGF6eV9tbXVfbW9k
ZSgpIGFuZCB0aGVuCj4gPiBsb29wIGNhbGxpbmcgc2V0X3B0ZV9hdCgpLiBXaGljaCBub3cgKG9y
IGF0IGxlYXN0IGluIGEgZmV3IGNvbW1pdHMgdGltZQo+ID4gd2hlbiB5b3Ugd2lyZSBpdCB1cCBm
b3IgeDg2IGluIGNvbW1pdCBhM2UxYzkzNzJjOWI5NTkpIGVuZHMgdXAgaW4geW91cgo+ID4gaW1w
bGVtZW50YXRpb24gb2Ygc2V0X3B0ZXMoKSwgY2FsbHMgYXJjaF9lbnRlcl9sYXp5X21tdV9tb2Rl
KCkgYWdhaW4sCj4gPiBhbmQ6Cj4gPiAKPiA+IFvCoMKgwqAgMC42Mjg3MDBdIC0tLS0tLS0tLS0t
LVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQo+ID4gW8KgwqDCoCAwLjYyODcxOF0ga2VybmVsIEJV
RyBhdCBhcmNoL3g4Ni9rZXJuZWwvcGFyYXZpcnQuYzoxNDQhCj4gCj4gRWFzeSBmaXggLi4uIGRv
bid0IGRvIHRoYXQgOy0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcGd0YWJsZS5o
IGIvaW5jbHVkZS9saW51eC9wZ3RhYmxlLmgKPiBpbmRleCBhZjc2MzljM2IwYTMuLmYzZGE4ODM2
ZjY4OSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3BndGFibGUuaAo+ICsrKyBiL2luY2x1
ZGUvbGludXgvcGd0YWJsZS5oCj4gQEAgLTIzMSw5ICsyMzEsMTEgQEAgc3RhdGljIGlubGluZSBw
dGVfdCBwdGVfbmV4dF9wZm4ocHRlX3QgcHRlKQo+IMKgc3RhdGljIGlubGluZSB2b2lkIHNldF9w
dGVzKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwdGVfdCAqcHRlcCwgcHRlX3QgcHRlLCB1bnNpZ25lZCBp
bnQgbnIpCj4gwqB7Cj4gK8KgwqDCoMKgwqDCoMKgYm9vbCBtdWx0aXBsZSA9IG5yID4gMTsKPiDC
oMKgwqDCoMKgwqDCoMKgcGFnZV90YWJsZV9jaGVja19wdGVzX3NldChtbSwgcHRlcCwgcHRlLCBu
cik7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqBhcmNoX2VudGVyX2xhenlfbW11X21vZGUoKTsKPiAr
wqDCoMKgwqDCoMKgwqBpZiAobXVsdGlwbGUpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGFyY2hfZW50ZXJfbGF6eV9tbXVfbW9kZSgpOwo+IMKgwqDCoMKgwqDCoMKgwqBmb3IgKDs7
KSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzZXRfcHRlKHB0ZXAsIHB0ZSk7
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoLS1uciA9PSAwKQo+IEBAIC0y
NDEsNyArMjQzLDggQEAgc3RhdGljIGlubGluZSB2b2lkIHNldF9wdGVzKHN0cnVjdCBtbV9zdHJ1
Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBwdGVwKys7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwdGUgPSBwdGVf
bmV4dF9wZm4ocHRlKTsKPiDCoMKgwqDCoMKgwqDCoMKgfQo+IC3CoMKgwqDCoMKgwqDCoGFyY2hf
bGVhdmVfbGF6eV9tbXVfbW9kZSgpOwo+ICvCoMKgwqDCoMKgwqDCoGlmIChtdWx0aXBsZSkKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYXJjaF9sZWF2ZV9sYXp5X21tdV9tb2RlKCk7
Cj4gwqB9Cj4gwqAjZW5kaWYKPiDCoCNkZWZpbmUgc2V0X3B0ZV9hdChtbSwgYWRkciwgcHRlcCwg
cHRlKSBzZXRfcHRlcyhtbSwgYWRkciwgcHRlcCwgcHRlLCAxKQo+IAo+IEkgdGhpbmsgbG9uZy10
ZXJtLCB3ZSBzaG91bGQgbWFrZSBsYXp5X21tdV9tb2RlIG5lc3RhYmxlLsKgIEJ1dCB0aGlzIGlz
Cj4gYSByZWFzb25hYmxlIHF1aWNrIGZpeC4KCkkgZG9uJ3QgbXVjaCBsaWtlIGRvaW5nIGl0IGlt
cGxpY2l0bHkgYmFzZWQgb24gKG5yPT0xKSBidXQgc3VyZSwgYXMgYQpxdWljayBmaXggdGhhdCB3
b3Jrcy4gVGhlIDY0LWJpdCBQViBndWVzdCBub3cgYm9vdHMgYWdhaW4uCgpUZXN0ZWQtYnk6IERh
dmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+CgpUaGFua3MuCg==


--=-BEEc0mgIHGyqyvDjEr79
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEkQw
ggYQMIID+KADAgECAhBNlCwQ1DvglAnFgS06KwZPMA0GCSqGSIb3DQEBDAUAMIGIMQswCQYDVQQG
EwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoT
FVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0
aW9uIEF1dGhvcml0eTAeFw0xODExMDIwMDAwMDBaFw0zMDEyMzEyMzU5NTlaMIGWMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAyjztlApB/975Rrno1jvm2pK/KxBOqhq8gr2+JhwpKirSzZxQgT9tlC7zl6hn1fXjSo5MqXUf
ItMltrMaXqcESJuK8dtK56NCSrq4iDKaKq9NxOXFmqXX2zN8HHGjQ2b2Xv0v1L5Nk1MQPKA19xeW
QcpGEGFUUd0kN+oHox+L9aV1rjfNiCj3bJk6kJaOPabPi2503nn/ITX5e8WfPnGw4VuZ79Khj1YB
rf24k5Ee1sLTHsLtpiK9OjG4iQRBdq6Z/TlVx/hGAez5h36bBJMxqdHLpdwIUkTqT8se3ed0PewD
ch/8kHPo5fZl5u1B0ecpq/sDN/5sCG52Ds+QU5O5EwIDAQABo4IBZDCCAWAwHwYDVR0jBBgwFoAU
U3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFAnA8vwL2pTbX/4r36iZQs/J4K0AMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEF
BQcDBDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC51c2Vy
dHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25BdXRob3JpdHkuY3JsMHYGCCsGAQUF
BwEBBGowaDA/BggrBgEFBQcwAoYzaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJT
QUFkZFRydXN0Q0EuY3J0MCUGCCsGAQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0G
CSqGSIb3DQEBDAUAA4ICAQBBRHUAqznCFfXejpVtMnFojADdF9d6HBA4kMjjsb0XMZHztuOCtKF+
xswhh2GqkW5JQrM8zVlU+A2VP72Ky2nlRA1GwmIPgou74TZ/XTarHG8zdMSgaDrkVYzz1g3nIVO9
IHk96VwsacIvBF8JfqIs+8aWH2PfSUrNxP6Ys7U0sZYx4rXD6+cqFq/ZW5BUfClN/rhk2ddQXyn7
kkmka2RQb9d90nmNHdgKrwfQ49mQ2hWQNDkJJIXwKjYA6VUR/fZUFeCUisdDe/0ABLTI+jheXUV1
eoYV7lNwNBKpeHdNuO6Aacb533JlfeUHxvBz9OfYWUiXu09sMAviM11Q0DuMZ5760CdO2VnpsXP4
KxaYIhvqPqUMWqRdWyn7crItNkZeroXaecG03i3mM7dkiPaCkgocBg0EBYsbZDZ8bsG3a08LwEsL
1Ygz3SBsyECa0waq4hOf/Z85F2w2ZpXfP+w8q4ifwO90SGZZV+HR/Jh6rEaVPDRF/CEGVqR1hiuQ
OZ1YL5ezMTX0ZSLwrymUE0pwi/KDaiYB15uswgeIAcA6JzPFf9pLkAFFWs1QNyN++niFhsM47qod
x/PL+5jR87myx5uYdBEQkkDc+lKB1Wct6ucXqm2EmsaQ0M95QjTmy+rDWjkDYdw3Ms6mSWE3Bn7i
5ZgtwCLXgAIe5W8mybM2JzCCBhQwggT8oAMCAQICEQDGvhmWZ0DEAx0oURL6O6l+MA0GCSqGSIb3
DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYD
VQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28g
UlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTIyMDEwNzAw
MDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9y
ZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3GpC2bomUqk+91wLYBzDMcCj5C9m6
oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZHh7htyAkWYVoFsFPrwHounto8xTsy
SSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT9YgcBqKCo65pTFmOnR/VVbjJk4K2
xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNjP+qDrh0db7PAjO1D4d5ftfrsf+kd
RR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy2U+eITZ5LLE5s45mX2oPFknWqxBo
bQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3BgBEmfsYWlBXO8rVXfvPgLs32VdV
NZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/7auNVRmPB3v5SWEsH8xi4Bez2V9U
KxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmdlFYhAflWKQ03Ufiu8t3iBE3VJbc2
5oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9aelIl6vtbhMA+l0nfrsORMa4kobqQ5
C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMBAAGjggHMMIIByDAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeDMcimo0oz8o1R1Nver3ZVpSkwDgYD
VR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGln
by5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGln
b1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUFBwEB
BH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50
QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcwAYYXaHR0cDovL29j
c3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5mcmFkZWFkLm9yZzANBgkqhkiG9w0B
AQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQvQ/fzPXmtR9t54rpmI2TfyvcKgOXp
qa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvIlSPrzIB4Z2wyIGQpaPLlYflrrVFK
v9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9ChWFfgSXvrWDZspnU3Gjw/rMHrGnql
Htlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0whpBtXdyDjzBtQTaZJ7zTT/vlehc/
tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9IzCCBhQwggT8oAMCAQICEQDGvhmW
Z0DEAx0oURL6O6l+MA0GCSqGSIb3DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3Jl
YXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0
ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJl
IEVtYWlsIENBMB4XDTIyMDEwNzAwMDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJ
ARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3
GpC2bomUqk+91wLYBzDMcCj5C9m6oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZH
h7htyAkWYVoFsFPrwHounto8xTsySSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT
9YgcBqKCo65pTFmOnR/VVbjJk4K2xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNj
P+qDrh0db7PAjO1D4d5ftfrsf+kdRR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy
2U+eITZ5LLE5s45mX2oPFknWqxBobQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3
BgBEmfsYWlBXO8rVXfvPgLs32VdVNZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/
7auNVRmPB3v5SWEsH8xi4Bez2V9UKxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmd
lFYhAflWKQ03Ufiu8t3iBE3VJbc25oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9ae
lIl6vtbhMA+l0nfrsORMa4kobqQ5C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMB
AAGjggHMMIIByDAfBgNVHSMEGDAWgBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeD
Mcimo0oz8o1R1Nver3ZVpSkwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYw
FAYIKwYBBQUHAwQGCCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYB
BQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9j
cmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1h
aWxDQS5jcmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdv
LmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAj
BggrBgEFBQcwAYYXaHR0cDovL29jc3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQv
Q/fzPXmtR9t54rpmI2TfyvcKgOXpqa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvI
lSPrzIB4Z2wyIGQpaPLlYflrrVFKv9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9Ch
WFfgSXvrWDZspnU3Gjw/rMHrGnqlHtlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0w
hpBtXdyDjzBtQTaZJ7zTT/vlehc/tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9
IzGCBMcwggTDAgEBMIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVz
dGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMT
NVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA
xr4ZlmdAxAMdKFES+jupfjANBglghkgBZQMEAgEFAKCCAeswGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMxMDEyMTQ0MzU0WjAvBgkqhkiG9w0BCQQxIgQgwua/EWmV
rsYuj5rGngR0/cZGHI3bnLJ5uRrlV5SPiuUwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgB95JMRvLcnOmCbO/ex5isAkO8+7Ebesu93
WDjcsUU7KhAz4BWHSFIBVc1usncnIn468Pl4E39jx7e8SdnXUMuU+iYDMrBpegAo+eXa+nOzIXYu
P92eiUgXSQakuCE9qUmiX8su55GQGnpWXxKKwzINiKLmxyD2EoW3S+yJjD1n4PTIqNwDAxJ7dGNz
sfEERUumVa371bNXdvUL3vjfYWJ6DQvDsfHHGwfrQEBZE332gYdyfN1rZC/kEr/9vzoJn6T/L5LL
uTNUoRt4DRkG6YY6UAEDC+sTpEl+u+pbgVzaXuF+qHARh91bNVRV6DjxU9VLtf8GDjwgvjbuDVku
eWoIExSNfNf9PCLRm2sWxBIkvZqmY9aNzxspZiX5cMsyyX7X3ZYVk+ObjhRpQq1dq22AZULmVoiK
LzlgqdGXvPIoMXAzdPg2O2nkrHa9+z/ynaIseo4fWa+v0suSdlimNHvZfhPrWfVmraSVywCE7l8N
PgHUB9GmSIRN9QOBAtm6QYk1/v8bB4/zm9p9OXL9UUT/GbF+loyQwfzEZwFkCJty8esgVLvPDjEB
doosxaYOvMjoqSfarf6UxJv1bgJpc0xMWPPbGqYU8uaChIUTsVNfoT4dW6zs/yQ5ThPEa1TOEnNg
Qc1eCLanpdPhnGsDt+zgbUU7pR8CwiuaaS9PhK2GpwAAAAAAAA==


--=-BEEc0mgIHGyqyvDjEr79--

