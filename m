Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 725BB92756A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 13:46:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753738.1161947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPKug-0001JD-DW; Thu, 04 Jul 2024 11:46:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753738.1161947; Thu, 04 Jul 2024 11:46:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPKug-0001G3-Ab; Thu, 04 Jul 2024 11:46:10 +0000
Received: by outflank-mailman (input) for mailman id 753738;
 Thu, 04 Jul 2024 11:46:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EPo+=OE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sPKue-0001Fu-K3
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 11:46:08 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffa78cd6-39fa-11ef-8776-851b0ebba9a2;
 Thu, 04 Jul 2024 13:46:06 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52e97e5a84bso745028e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jul 2024 04:46:06 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab08cf7csm592555366b.155.2024.07.04.04.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 04:46:05 -0700 (PDT)
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
X-Inumbo-ID: ffa78cd6-39fa-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720093566; x=1720698366; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ycLgS7NlynHELHJt6cPJK/WunF/Q/Fyf49pSd1USCzE=;
        b=O0auDqdDvuskqShK7+mx3NNME8NhKHxt7zDGBq5MikDwOae7ggVynFmkwj3HfMuV6a
         D0+HNPYhnovTuAj/VicPYqrJm3WRXJoXs2Vsq0LhGtl3v3R2oFlMc6Tt3VXp5+BC37c4
         2K3iFHMfmzgv3zuMH6lhL6OA7cyxXtrhq1v5oEZ2o9BpAUvs54g7ZrPgF3zpkV1+bVUs
         0ZWV8QAxUKVVAAFVCoM46h7GqZPajP8Xu1/8t0zcYfq7klMmR5Ppeb9xb0VvKMkVMNIj
         d46mkCPPuMmCfQqojAo79/EPlRqpTJ/xRTdjjUZ2r7GsXkJqRzz1px6a0JoU3ENu7ptV
         giFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720093566; x=1720698366;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ycLgS7NlynHELHJt6cPJK/WunF/Q/Fyf49pSd1USCzE=;
        b=tUyapJiqCLsW9sEq1l4N6V5cqBywK4FbZhnxGnKMSug9QcwbzZxG1KbVso8JG4GOVV
         Mj4RJM8hHl0IN1PJoyctNylnc8AtIyNvQIDR2ABH5ZVVLv4df5D2AH9mLllbygGT/hRf
         tc/HoexSrkIcgyos4bYeqOdlH93huurXzzdz73eAk00vFU4SSAFSnQukWSCK78eQAUGQ
         6ntOOS5pszvr4it7U0mqvCURKrrCWsZz4sHrbXluc1/bGt0DW7hobCO7y5bpcq7FYCf5
         2TDAFr8atbbddRD4aEe0DZ845r96W8AeKv/TR1X7i+TNxrORRsXOyVkv96tY0Bqf4bsU
         f9Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWerozxghC5FedZini/vfNJP2hi5lE3XiVTIu1VIDFJbW9Npz6YomYUcoBZ1Qfx6Bsh7Vk7N6Y2rehBEXIKZVD2Wf1p3fPAAhYzXzY5iII=
X-Gm-Message-State: AOJu0YxVCCsea4VpfklNSHxFnT4HnLdN/UGw3GeY+pDxdLmBifM3L+qK
	o1xuBAcqhYT/GI/c+VdQNw4WLvF9BqCnpdsm2br1W0UcJTBhGNfe
X-Google-Smtp-Source: AGHT+IH5S4NR1PbUyXZGAJgd5it52SracPMtFOjllkbfJsO2iDz9+uo+eZyBZJiQ17gE4pYdM9fQmg==
X-Received: by 2002:a19:8c04:0:b0:52c:9ae0:beed with SMTP id 2adb3069b0e04-52ea06a5995mr1151177e87.52.1720093565722;
        Thu, 04 Jul 2024 04:46:05 -0700 (PDT)
Message-ID: <7dce3f2175bed81ddc3ffb373e7c001422c7e5ce.camel@gmail.com>
Subject: Re: [PATCH for-4.19 4/4] CI: Rework the CentOS7 container
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>, Stefano Stabellini
	 <sstabellini@kernel.org>, Doug Goldstein <cardoe@cardoe.com>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>
Date: Thu, 04 Jul 2024 13:46:04 +0200
In-Reply-To: <20240703142002.1662874-5-andrew.cooper3@citrix.com>
References: <20240703142002.1662874-1-andrew.cooper3@citrix.com>
	 <20240703142002.1662874-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

T24gV2VkLCAyMDI0LTA3LTAzIGF0IDE1OjIwICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+
IENlbnRPUyA3IGlzIGZ1bGx5IEVuZC1vZi1saWZlIGFzIG9mIDIwMjQtMDYtMzAsIGFuZCB0aGUg
WXVtIHJlcG8KPiBjb25maWd1cmF0aW9uCj4gcG9pbnRzIGF0IFVSTHMgd2hpY2ggaGF2ZSBiZWNv
bWUgbm9uLWV4aXN0ZW50Lgo+IAo+IEZpcnN0LCBzdGFydCBieSB1c2luZyBhIGhlcmVkb2MgUlVO
IGZvciBsZWdpYmlsaXR5LsKgIEl0J3MgaW1wb3J0YW50Cj4gdG8gdXNlCj4gYHNldCAtZWAgdG8g
b2Zmc2V0IHRoZSBmYWN0IHRoYXQgd2UncmUgbm8gbG9uZ2VyIGNoYWluaW5nIGV2ZXJ5Cj4gY29t
bWFuZAo+IHRvZ2V0aGVyIHdpdGggYW4gJiYuCj4gCj4gQWxzbywgYmVjYXVzZSB3ZSdyZSB1c2lu
ZyBhIHNpbmdsZSBSVU4gY29tbWFuZCB0byBwZXJmb3JtIGFsbCBSUE0KPiBvcGVyYXRpb25zLAo+
IHdlIG5vIGxvbmdlciBuZWVkIHRvIHdvcmsgYXJvdW5kIHRoZSBPdmVybGF5RlMgYnVnLgo+IAo+
IEFkanVzdCB0aGUgQ2VudE9TLSoucmVwbyBmaWxlcyB0byBwb2ludCBhdCB2YXVsdC5jZW50b3Mu
b3JnLgo+IAo+IFRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIHNwbGl0IHRoZSBYZW4gZGVwcyBmcm9t
IFRvb2xzIGRlcHMsIGFuZCB0bwo+IGFkanVzdCB0aGUKPiBvdGhlciBwYWNrYWdlcyB3ZSB1c2U6
Cj4gCj4gwqAqIFdlIG5lZWQgYnppcDItZGV2ZWwgZm9yIHRoZSBkb21idWlsZGVyLCBub3QganVz
dCBiemlwMi4KPiDCoCogenN0ZC1kZXZlbCBpcyBhbm90aGVyIG9wdGlvbmFsIGRlcGVuZGVuY3kg
c2luY2UgdGhlIGxhc3QgdGltZSB0aGlzCj4gcGFja2FnZQo+IMKgwqAgbGlzdCB3YXMgcmVmcmVz
aGVkLgo+IMKgKiBvcGVuc3NsLWRldmVsIGhhc24ndCBiZWVuIGEgZGVwZW5kZW5jeSBzaW5jZSBY
ZW4gNC42Lgo+IMKgKiBXZSBsb25nIGFnbyBjZWFzZWQgYmVpbmcgYWJsZSB0byBidWlsZCBRZW11
IGFuZCBTZWFCSU9TIGluIHRoaXMKPiBjb250YWluZXIsCj4gwqDCoCBzbyBkcm9wIHRoZWlyIGRl
cGVuZGVuY2llcyB0b28uCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAtLS0KPiBDQzogQW50aG9ueSBQRVJBUkQgPGFudGhvbnku
cGVyYXJkQHZhdGVzLnRlY2g+Cj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz4KPiBDQzogRG91ZyBHb2xkc3RlaW4gPGNhcmRvZUBjYXJkb2UuY29tPgo+IEND
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBDQzogT2xla3NpaSBL
dXJvY2hrbyA8b2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20+ClJlbGVhc2UtQWNrZWQtYnk6IE9s
ZWtzaWkgS3Vyb2Noa28gPG9sZWtzaWkua3Vyb2Noa29AZ21haWwuY29tPgoKfiBPbGVrc2lpCgo+
IC0tLQo+IMKgYXV0b21hdGlvbi9idWlsZC9jZW50b3MvNy5kb2NrZXJmaWxlIHwgNzAgKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0KPiAtLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDM3IGluc2VydGlv
bnMoKyksIDMzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hdXRvbWF0aW9uL2J1aWxk
L2NlbnRvcy83LmRvY2tlcmZpbGUKPiBiL2F1dG9tYXRpb24vYnVpbGQvY2VudG9zLzcuZG9ja2Vy
ZmlsZQo+IGluZGV4IDY1NzU1MGYzMDhiYi4uOWU2NmQ3MmE1YmQ1IDEwMDY0NAo+IC0tLSBhL2F1
dG9tYXRpb24vYnVpbGQvY2VudG9zLzcuZG9ja2VyZmlsZQo+ICsrKyBiL2F1dG9tYXRpb24vYnVp
bGQvY2VudG9zLzcuZG9ja2VyZmlsZQo+IEBAIC02LDQ0ICs2LDQ4IEBAIExBQkVMIG1haW50YWlu
ZXIubmFtZT0iVGhlIFhlbiBQcm9qZWN0IiBcCj4gwqBSVU4gbWtkaXIgL2J1aWxkCj4gwqBXT1JL
RElSIC9idWlsZAo+IMKgCj4gLSMgd29yayBhcm91bmQgaHR0cHM6Ly9naXRodWIuY29tL21vYnkv
bW9ieS9pc3N1ZXMvMTAxODAKPiAtIyBhbmQgYWRkIEVQRUwgZm9yIGRldjg2Cj4gLVJVTiBycG0g
LS1yZWJ1aWxkZGIgJiYgXAo+IC3CoMKgwqAgeXVtIC15IGluc3RhbGwgXAo+IC3CoMKgwqDCoMKg
wqDCoCB5dW0tcGx1Z2luLW92bCBcCj4gLcKgwqDCoMKgwqDCoMKgIGVwZWwtcmVsZWFzZSBcCj4g
LcKgwqDCoCAmJiB5dW0gY2xlYW4gYWxsICYmIFwKPiAtwqDCoMKgIHJtIC1yZiAvdmFyL2NhY2hl
L3l1bQo+ICtSVU4gPDxFT0YKPiArwqDCoMKgIHNldCAtZQo+ICsKPiArwqDCoMKgICMgRml4IHVw
IFl1bSBjb25maWcgbm93IHRoYXQgbWlycm9yLmNlbnRvcy5vcmcgZG9lc24ndCBleGlzdAo+ICvC
oMKgwqAgc2VkIC1lICdzL21pcnJvci5jZW50b3Mub3JnL3ZhdWx0LmNlbnRvcy5vcmcvZycgXAo+
ICvCoMKgwqDCoMKgwqDCoCAtZSAncy9eIy4qYmFzZXVybD1odHRwc1w/L2Jhc2V1cmw9aHR0cHMv
ZycgXAo+ICvCoMKgwqDCoMKgwqDCoCAtZSAncy9ebWlycm9ybGlzdD1odHRwc1w/LyNtaXJyb3Js
aXN0PWh0dHBzL2cnIFwKPiArwqDCoMKgwqDCoMKgwqAgLWkgL2V0Yy95dW0ucmVwb3MuZC8qLnJl
cG8KPiArCj4gK8KgwqDCoCAjIEFkZCB0aGUgRVBFTCByZXBvIHRvIGdldCBkZXY4Ngo+ICvCoMKg
wqAgeXVtIC15IGluc3RhbGwgZXBlbC1yZWxlYXNlCj4gKwo+ICvCoMKgwqAgeXVtIC15IHVwZGF0
ZQo+IMKgCj4gLSMgaW5zdGFsbCBYZW4gZGVwZW5kcwo+IC1SVU4geXVtIC15IHVwZGF0ZSBcCj4g
LcKgwqDCoCAmJiB5dW0gLXkgaW5zdGFsbCBcCj4gK8KgwqDCoCAjIFhlbiBkZXBzCj4gK8KgwqDC
oCB5dW0gLXkgaW5zdGFsbCBcCj4gK8KgwqDCoMKgwqDCoMKgIGJpc29uIFwKPiArwqDCoMKgwqDC
oMKgwqAgYmludXRpbHMgXAo+ICvCoMKgwqDCoMKgwqDCoCBjaGVja3BvbGljeSBcCj4gK8KgwqDC
oMKgwqDCoMKgIGZsZXggXAo+IMKgwqDCoMKgwqDCoMKgwqAgZ2NjIFwKPiArwqDCoMKgwqDCoMKg
wqAgbWFrZSBcCj4gKwo+ICvCoMKgwqAgIyBUb29scy9zdHViZG9tL2RvY3MgZGVwcwo+ICvCoMKg
wqAgeXVtIC15IGluc3RhbGwgXAo+ICvCoMKgwqDCoMKgwqDCoCBhY3BpY2EtdG9vbHMgXAo+ICvC
oMKgwqDCoMKgwqDCoCBiemlwMi1kZXZlbCBcCj4gK8KgwqDCoMKgwqDCoMKgIGRldjg2IFwKPiDC
oMKgwqDCoMKgwqDCoMKgIGdjYy1jKysgXAo+IC3CoMKgwqDCoMKgwqDCoCBuY3Vyc2VzLWRldmVs
IFwKPiAtwqDCoMKgwqDCoMKgwqAgemxpYi1kZXZlbCBcCj4gLcKgwqDCoMKgwqDCoMKgIG9wZW5z
c2wtZGV2ZWwgXAo+IC3CoMKgwqDCoMKgwqDCoCBweXRob24tZGV2ZWwgXAo+ICvCoMKgwqDCoMKg
wqDCoCBnaXQgXAo+IMKgwqDCoMKgwqDCoMKgwqAgbGlidXVpZC1kZXZlbCBcCj4gK8KgwqDCoMKg
wqDCoMKgIG5jdXJzZXMtZGV2ZWwgXAo+ICvCoMKgwqDCoMKgwqDCoCBwYXRjaCBcCj4gwqDCoMKg
wqDCoMKgwqDCoCBwa2djb25maWcgXAo+IC3CoMKgwqDCoMKgwqDCoCBmbGV4IFwKPiAtwqDCoMKg
wqDCoMKgwqAgYmlzb24gXAo+IC3CoMKgwqDCoMKgwqDCoCBsaWJhaW8tZGV2ZWwgXAo+IC3CoMKg
wqDCoMKgwqDCoCBnbGliMi1kZXZlbCBcCj4gLcKgwqDCoMKgwqDCoMKgIHlhamwtZGV2ZWwgXAo+
IC3CoMKgwqDCoMKgwqDCoCBwaXhtYW4tZGV2ZWwgXAo+IC3CoMKgwqDCoMKgwqDCoCBnbGliYy1k
ZXZlbCBcCj4gLcKgwqDCoMKgwqDCoMKgIG1ha2UgXAo+IC3CoMKgwqDCoMKgwqDCoCBiaW51dGls
cyBcCj4gLcKgwqDCoMKgwqDCoMKgIGdpdCBcCj4gLcKgwqDCoMKgwqDCoMKgIHdnZXQgXAo+IC3C
oMKgwqDCoMKgwqDCoCBhY3BpY2EtdG9vbHMgXAo+ICvCoMKgwqDCoMKgwqDCoCBweXRob24tZGV2
ZWwgXAo+IMKgwqDCoMKgwqDCoMKgwqAgcHl0aG9uLW1hcmtkb3duIFwKPiAtwqDCoMKgwqDCoMKg
wqAgcGF0Y2ggXAo+IC3CoMKgwqDCoMKgwqDCoCBjaGVja3BvbGljeSBcCj4gLcKgwqDCoMKgwqDC
oMKgIGRldjg2IFwKPiArwqDCoMKgwqDCoMKgwqAgd2dldCBcCj4gwqDCoMKgwqDCoMKgwqDCoCB4
ei1kZXZlbCBcCj4gLcKgwqDCoMKgwqDCoMKgIGJ6aXAyIFwKPiAtwqDCoMKgwqDCoMKgwqAgbmFz
bSBcCj4gLcKgwqDCoCAmJiB5dW0gY2xlYW4gYWxsICYmIFwKPiArwqDCoMKgwqDCoMKgwqAgeWFq
bC1kZXZlbCBcCj4gK8KgwqDCoMKgwqDCoMKgIHpsaWItZGV2ZWwgXAo+ICvCoMKgwqDCoMKgwqDC
oCB6c3RkLWRldmVsIFwKPiArCj4gK8KgwqDCoCB5dW0gY2xlYW4gYWxsCj4gwqDCoMKgwqAgcm0g
LXJmIC92YXIvY2FjaGUveXVtCj4gK0VPRgoK


