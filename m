Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1991A3C35
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2020 00:06:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMfIG-0002EZ-Pz; Thu, 09 Apr 2020 22:05:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FLbM=5Z=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jMfIG-0002EU-5y
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 22:05:04 +0000
X-Inumbo-ID: 292ed0cc-7aae-11ea-b4f4-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 292ed0cc-7aae-11ea-b4f4-bc764e2007e4;
 Thu, 09 Apr 2020 22:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586469903;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to;
 bh=OVRLhuWnX6yyR2IYlyeCHNC0ARBS8rk78i+ijDJxFzg=;
 b=gvHmEhZ0Lz3s6e86zIkO5auDrIVZOelSjvOWM5wwGnOWzWEQ6TcpwxuS
 Fy96OqrPN2Y9MqJdSCFFc1HLZEHc/Jlm4hcDlErVhD/UVpx5IPK2O+sQH
 gQ+cCHkOb6SAbPXAwZmB9RfqBWLkBS+OAQATvFEcsusdCKfzPJ/323PSw w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kCzUH5RuVsu0N8AQyIcbQ2/XNvdqRWdobxa3kkiEutI/XAOJcd5xkAp+sHYS2WGD9OgoXyEcAj
 p92Xsw9rBzsxETO/TINM1pnwtayppOXEAhBbzARkTKR0eomGgWcubm84S6Y+RaQd3C9enjVlGV
 Bju3OebTj9u2OoIXNTQNrmQE6O6HxG9w55b2Bir1/rar6xr/bqBUbCOy9tOEMuTj/Bf/GGYg8B
 68WhDNmdZj2tkzEal7UuRt1wUdHoMXWyhHtFEKNap9QYnldsF5xoCMb3Y+HjW0wPC4Cf+M80qg
 MR0=
X-SBRS: 2.7
X-MesageID: 15703688
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,364,1580792400"; d="scan'208";a="15703688"
Subject: Re: [PATCH] x86/mem_sharing: Fix build folloing VM Fork work
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <20200409204837.7017-1-andrew.cooper3@citrix.com>
 <CABfawhnhfTScVDRxezP3qRarBczCPs2EVmLZMnN-FMpxyWN8XQ@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <769887ee-c381-ff58-bdf9-bd1a3032cbfb@citrix.com>
Date: Thu, 9 Apr 2020 23:04:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CABfawhnhfTScVDRxezP3qRarBczCPs2EVmLZMnN-FMpxyWN8XQ@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------0C9AF3EAE1EEA1FAF626E9EB"
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--------------0C9AF3EAE1EEA1FAF626E9EB
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 09/04/2020 22:24, Tamas K Lengyel wrote:
> On Thu, Apr 9, 2020 at 2:48 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> A default build fails with:
>>
>>   mem_sharing.c: In function ‘copy_special_pages’:
>>   mem_sharing.c:1649:9: error: ‘HVM_PARAM_STORE_PFN’ undeclared (first use in this function)
>>            HVM_PARAM_STORE_PFN,
>>            ^~~~~~~~~~~~~~~~~~~
>>
>> I suspect this is a rebasing issue with respect to c/s 12f0c69f2709 "x86/HVM:
>> reduce hvm.h include dependencies".
>>
>> Fixes: 41548c5472a "mem_sharing: VM forking"
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> So staging definitely compiles for me both with and without
> CONFIG_MEM_SHARING enabled. By default its off, so this shouldn't even
> be compiled so I'm curious what's happening in your build. That said,
> I have no objection to the extra include if it turns out to be
> actually necessary.

Exact config attached.  I've just double checked that staging fails.

We should get  to the bottom of exactly what is going on here, if it
isn't the obvious thing.

~Andrew

--------------0C9AF3EAE1EEA1FAF626E9EB
Content-Type: text/plain; charset="UTF-8"; name=".config-debug"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=".config-debug"

IwojIEF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGZpbGU7IERPIE5PVCBFRElULgojIFhlbi94
ODYgNC4xNC11bnN0YWJsZSBDb25maWd1cmF0aW9uCiMKQ09ORklHX0NDX0lTX0dDQz15CkNP
TkZJR19HQ0NfVkVSU0lPTj02MDMwMApDT05GSUdfQ0xBTkdfVkVSU0lPTj0wCkNPTkZJR19D
Q19IQVNfVklTSUJJTElUWV9BVFRSSUJVVEU9eQpDT05GSUdfWDg2XzY0PXkKQ09ORklHX1g4
Nj15CkNPTkZJR19BUkNIX0RFRkNPTkZJRz0iYXJjaC94ODYvY29uZmlncy94ODZfNjRfZGVm
Y29uZmlnIgpDT05GSUdfSU5ESVJFQ1RfVEhVTks9eQoKIwojIEFyY2hpdGVjdHVyZSBGZWF0
dXJlcwojCkNPTkZJR19OUl9DUFVTPTI1NgpDT05GSUdfUFY9eQpDT05GSUdfUFZfTElORUFS
X1BUPXkKQ09ORklHX0hWTT15CkNPTkZJR19TSEFET1dfUEFHSU5HPXkKIyBDT05GSUdfQklH
TUVNIGlzIG5vdCBzZXQKQ09ORklHX0hWTV9GRVA9eQpDT05GSUdfVEJPT1Q9eQojIENPTkZJ
R19YRU5fQUxJR05fREVGQVVMVCBpcyBub3Qgc2V0CkNPTkZJR19YRU5fQUxJR05fMk09eQpD
T05GSUdfR1VFU1Q9eQpDT05GSUdfWEVOX0dVRVNUPXkKQ09ORklHX1BWSF9HVUVTVD15CkNP
TkZJR19QVl9TSElNPXkKIyBDT05GSUdfUFZfU0hJTV9FWENMVVNJVkUgaXMgbm90IHNldApD
T05GSUdfSFlQRVJWX0dVRVNUPXkKQ09ORklHX01FTV9TSEFSSU5HPXkKIyBlbmQgb2YgQXJj
aGl0ZWN0dXJlIEZlYXR1cmVzCgojCiMgQ29tbW9uIEZlYXR1cmVzCiMKQ09ORklHX0NPTVBB
VD15CkNPTkZJR19DT1JFX1BBUktJTkc9eQpDT05GSUdfR1JBTlRfVEFCTEU9eQpDT05GSUdf
SEFTX0FMVEVSTkFUSVZFPXkKQ09ORklHX0hBU19FWF9UQUJMRT15CkNPTkZJR19IQVNfRkFT
VF9NVUxUSVBMWT15CkNPTkZJR19NRU1fQUNDRVNTX0FMV0FZU19PTj15CkNPTkZJR19NRU1f
QUNDRVNTPXkKQ09ORklHX0hBU19NRU1fUEFHSU5HPXkKQ09ORklHX0hBU19QRFg9eQpDT05G
SUdfSEFTX1VCU0FOPXkKQ09ORklHX0hBU19LRVhFQz15CkNPTkZJR19IQVNfSU9QT1JUUz15
CkNPTkZJR19IQVNfU0NIRURfR1JBTlVMQVJJVFk9eQpDT05GSUdfTkVFRFNfTElCRUxGPXkK
CiMKIyBTcGVjdWxhdGl2ZSBoYXJkZW5pbmcKIwpDT05GSUdfU1BFQ1VMQVRJVkVfSEFSREVO
X0FSUkFZPXkKQ09ORklHX1NQRUNVTEFUSVZFX0hBUkRFTl9CUkFOQ0g9eQojIGVuZCBvZiBT
cGVjdWxhdGl2ZSBoYXJkZW5pbmcKCkNPTkZJR19LRVhFQz15CiMgQ09ORklHX0VGSV9TRVRf
VklSVFVBTF9BRERSRVNTX01BUCBpcyBub3Qgc2V0CkNPTkZJR19YRU5PUFJPRj15CkNPTkZJ
R19YU009eQpDT05GSUdfWFNNX0ZMQVNLPXkKQ09ORklHX1hTTV9GTEFTS19BVkNfU1RBVFM9
eQpDT05GSUdfWFNNX0ZMQVNLX1BPTElDWT15CkNPTkZJR19YU01fU0lMTz15CiMgQ09ORklH
X1hTTV9EVU1NWV9ERUZBVUxUIGlzIG5vdCBzZXQKIyBDT05GSUdfWFNNX0ZMQVNLX0RFRkFV
TFQgaXMgbm90IHNldApDT05GSUdfWFNNX1NJTE9fREVGQVVMVD15CiMgQ09ORklHX0xBVEVf
SFdET00gaXMgbm90IHNldApDT05GSUdfQVJHTz15CgojCiMgU2NoZWR1bGVycwojCkNPTkZJ
R19TQ0hFRF9DUkVESVQ9eQpDT05GSUdfU0NIRURfQ1JFRElUMj15CkNPTkZJR19TQ0hFRF9S
VERTPXkKQ09ORklHX1NDSEVEX0FSSU5DNjUzPXkKQ09ORklHX1NDSEVEX05VTEw9eQpDT05G
SUdfU0NIRURfQ1JFRElUX0RFRkFVTFQ9eQojIENPTkZJR19TQ0hFRF9DUkVESVQyX0RFRkFV
TFQgaXMgbm90IHNldAojIENPTkZJR19TQ0hFRF9SVERTX0RFRkFVTFQgaXMgbm90IHNldAoj
IENPTkZJR19TQ0hFRF9BUklOQzY1M19ERUZBVUxUIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NI
RURfTlVMTF9ERUZBVUxUIGlzIG5vdCBzZXQKQ09ORklHX1NDSEVEX0RFRkFVTFQ9ImNyZWRp
dCIKIyBlbmQgb2YgU2NoZWR1bGVycwoKQ09ORklHX0NSWVBUTz15CkNPTkZJR19MSVZFUEFU
Q0g9eQpDT05GSUdfRkFTVF9TWU1CT0xfTE9PS1VQPXkKQ09ORklHX0VORk9SQ0VfVU5JUVVF
X1NZTUJPTFM9eQpDT05GSUdfQ01ETElORT0iIgpDT05GSUdfRE9NMF9NRU09IiIKQ09ORklH
X1RSQUNFQlVGRkVSPXkKIyBlbmQgb2YgQ29tbW9uIEZlYXR1cmVzCgojCiMgRGV2aWNlIERy
aXZlcnMKIwpDT05GSUdfQUNQST15CkNPTkZJR19BQ1BJX0xFR0FDWV9UQUJMRVNfTE9PS1VQ
PXkKQ09ORklHX05VTUE9eQpDT05GSUdfSEFTX05TMTY1NTA9eQpDT05GSUdfSEFTX0VIQ0k9
eQpDT05GSUdfSEFTX0NQVUZSRVE9eQpDT05GSUdfSEFTX1BBU1NUSFJPVUdIPXkKQ09ORklH
X0hBU19QQ0k9eQpDT05GSUdfVklERU89eQpDT05GSUdfVkdBPXkKQ09ORklHX0hBU19WUENJ
PXkKIyBlbmQgb2YgRGV2aWNlIERyaXZlcnMKCiMKIyBEZXByZWNhdGVkIEZ1bmN0aW9uYWxp
dHkKIwojIENPTkZJR19QVl9MRFRfUEFHSU5HIGlzIG5vdCBzZXQKIyBlbmQgb2YgRGVwcmVj
YXRlZCBGdW5jdGlvbmFsaXR5CgpDT05GSUdfRVhQRVJUPSJ5IgpDT05GSUdfQVJDSF9TVVBQ
T1JUU19JTlQxMjg9eQoKIwojIERlYnVnZ2luZyBPcHRpb25zCiMKQ09ORklHX0RFQlVHPXkK
IyBDT05GSUdfQ1JBU0hfREVCVUcgaXMgbm90IHNldApDT05GSUdfR0RCU1g9eQpDT05GSUdf
REVCVUdfSU5GTz15CkNPTkZJR19GUkFNRV9QT0lOVEVSPXkKIyBDT05GSUdfREVCVUdfTE9D
S19QUk9GSUxFIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX0xPQ0tTPXkKIyBDT05GSUdfUEVS
Rl9DT1VOVEVSUyBpcyBub3Qgc2V0CkNPTkZJR19WRVJCT1NFX0RFQlVHPXkKQ09ORklHX1ND
UlVCX0RFQlVHPXkKIyBDT05GSUdfVUJTQU4gaXMgbm90IHNldAojIENPTkZJR19ERUJVR19U
UkFDRSBpcyBub3Qgc2V0CkNPTkZJR19YTUVNX1BPT0xfUE9JU09OPXkKIyBlbmQgb2YgRGVi
dWdnaW5nIE9wdGlvbnMK
--------------0C9AF3EAE1EEA1FAF626E9EB--

