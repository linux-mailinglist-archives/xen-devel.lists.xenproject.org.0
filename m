Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0E592A396
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 15:25:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755412.1163773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQoN3-0001y0-OH; Mon, 08 Jul 2024 13:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755412.1163773; Mon, 08 Jul 2024 13:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQoN3-0001vP-Kr; Mon, 08 Jul 2024 13:25:33 +0000
Received: by outflank-mailman (input) for mailman id 755412;
 Mon, 08 Jul 2024 13:25:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m90j=OI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sQoN2-0001vH-GQ
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 13:25:32 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bf30b3a-3d2d-11ef-8776-851b0ebba9a2;
 Mon, 08 Jul 2024 15:25:30 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52e97e5a84bso5908392e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 06:25:30 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52eb10e1968sm358417e87.14.2024.07.08.06.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 06:25:28 -0700 (PDT)
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
X-Inumbo-ID: 8bf30b3a-3d2d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720445130; x=1721049930; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OovDwmgF+/rYtrAQOHh2/HmyE/etjMJJQFPhY+PiEtA=;
        b=DkGzZO3Id/EyB2k1NQy0t0WiD/h4Vu5Kl3uSyqrpMuBiUh8UU8mcXpBSSanxOuzaek
         GdtCnwefJS1EncrAxTk715eNSF9s3CByp63qBYg5UWRuYAruL4yhjKsCQ8mo8+3ySsew
         dbR4wa6rDs43lnO2PRWDS9mcQfEVG0wcwu67P5TIQjiAm8RA5qX+b0pRZF7qqPiZa9HC
         8GKEwCXOrpVrRP5HxIjVkt2CBZrHt5Y7sBjQAzeOYISZC/mz52W2i2ZozL7XC5EMyjC/
         +Foi5dMB5+xmpuBUUYBd0y+sMuT5t+EJpL6aoP6yFcpGERbj2PxSLTkKOepyLyoLKEY8
         4DRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720445130; x=1721049930;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OovDwmgF+/rYtrAQOHh2/HmyE/etjMJJQFPhY+PiEtA=;
        b=WGDyf915wpKpPWzIuv9NBvvfz22NnC8c+oB7DkK1zr2vcOwYl/HMJsbYxpi1BarFOs
         jpp2hz4KjssGhFozK3ABHwzdpTyfCLGp2rbNOy3htFjWF7CaVM2xqr+v5YBs8vcVaRkg
         7jT3A5RjFC7/aGjCZ8WID3HXt27d2/JkV2Mm2YhLTnFvRyfxuXhb7X6RUrc2aCEN5S1u
         5QFZVLtzo9gQ78x2FPA4sYaZXo+cz+ECiuLnb/Kl4bXTk+PKlRthu34WrPK82q5miB0K
         j1gYYsrQ1OAQshdBKGQYhCk65JO13PDQ3m0DfhlxSKPzwV4RCr1f18cTJF3LJVMdklnb
         pCJg==
X-Forwarded-Encrypted: i=1; AJvYcCVuIe3VyEEFgA9b2SsgDr/2GBPk5fNT6fk3pDBC1H6P9E/D7lK2bAcRyQ6QuHxeNSo8qmP5DSNxZXwOeEIbV1465MAThKGrE3KS2UH49jI=
X-Gm-Message-State: AOJu0Yw65wA6s2FMrcE6WiZUmcHfnMInESoQuuyqjQjXF7balOTLVar6
	t7gfpMUJz8fNzCejwtyfPyNhQV5YM4C6uiClDmjM+6C8b1YNqRD7
X-Google-Smtp-Source: AGHT+IGhxr7EIoQk7ugcX6LZ9yTQwtI3z3yUtnLZZdVKzckcYnIlEqFgfW0rZlkgEVNy2bJ+NWBBaQ==
X-Received: by 2002:a19:434c:0:b0:52e:9921:6dff with SMTP id 2adb3069b0e04-52ea0622fc8mr9732729e87.26.1720445128784;
        Mon, 08 Jul 2024 06:25:28 -0700 (PDT)
Message-ID: <195e9718ed2c69d362bcd8ca856631ac3aea980f.camel@gmail.com>
Subject: Re: [PATCH for-4.19 0/6] CI: Fixes, part 2
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
 <jgross@suse.com>,  Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Date: Mon, 08 Jul 2024 15:25:27 +0200
In-Reply-To: <20240705152037.1920276-1-andrew.cooper3@citrix.com>
References: <20240705152037.1920276-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

T24gRnJpLCAyMDI0LTA3LTA1IGF0IDE2OjIwICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+
IFdvcmsgdG8gZml4IGEgZmV3IGJ1aWxkIHN5c3RlbSBjaGVja3MsIGFuZCB0byBzdHJpcCB0aGUg
b2Jzb2xldGUKPiBjb250ZW50cyBvZgo+IHRoZSBidWlsZCBjb250YWluZXJzLCBwcmlvciB0byBh
ZGRpbmcgbmV3IGNvbnRhaW5lcnMgKHdpbGwgYmUgcGFydAo+IDMpLgo+IAo+IEFuZHJldyBDb29w
ZXIgKDYpOgo+IMKgIGJ1aWxkOiBSZWdlbmVyYXRlIC4vY29uZmlndXJlIHdpdGggQXV0b2NvbmYg
Mi43MQo+IMKgIGJ1aWxkOiBGaXggdGhlIHZlcnNpb24gb2YgcHl0aG9uIGNoZWNrZWQgZm9yIGJ5
IC4vY29uZmlndXJlCj4gwqAgQ0k6IFJlZnJlc2ggdGhlIENvdmVyaXR5IEdpdGh1YiBBY3Rpb24g
Y29uZmlndXJhdGlvbgo+IMKgIGJ1aWxkOiBEcm9wIG9wZW5zc2wgYXMgYSBidWlsZCBkZXBlbmRl
bmN5Cj4gwqAgYnVpbGQ6IERyb3AgbGliaWNvbnYgYXMgYSBidWlsZCBkZXBlbmRlY3kKPiDCoCBi
dWlsZDogRHJvcCB4b3JnLXgxMSBhcyBhIGJ1aWxkIGRlcGVuZGVuY3kKPiAKPiDCoC5jaXJydXMu
eW1swqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgwqDCoCAyICstCj4gwqAuZ2l0aHViL3dvcmtmbG93cy9jb3Zlcml0
eS55bWzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMzYgKy0KPiDCoFJFQURN
RcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgIDIgLQo+IMKgLi4uL2J1aWxkL2RlYmlhbi9i
b29rd29ybS1hcm02NHY4LmRvY2tlcmZpbGXCoCB8wqDCoMKgIDIgLQo+IMKgLi4uL2J1aWxkL2Rl
Ymlhbi9ib29rd29ybS1pMzg2LmRvY2tlcmZpbGXCoMKgwqDCoCB8wqDCoMKgIDIgLQo+IMKgYXV0
b21hdGlvbi9idWlsZC9kZWJpYW4vYm9va3dvcm0uZG9ja2VyZmlsZcKgwqAgfMKgwqDCoCAyIC0K
PiDCoC4uLi9idWlsZC9kZWJpYW4vamVzc2llLWkzODYuZG9ja2VyZmlsZcKgwqDCoMKgwqDCoCB8
wqDCoMKgIDIgLQo+IMKgYXV0b21hdGlvbi9idWlsZC9kZWJpYW4vamVzc2llLmRvY2tlcmZpbGXC
oMKgwqDCoCB8wqDCoMKgIDIgLQo+IMKgLi4uL2J1aWxkL2RlYmlhbi9zdHJldGNoLWkzODYuZG9j
a2VyZmlsZcKgwqDCoMKgwqAgfMKgwqDCoCAyIC0KPiDCoGF1dG9tYXRpb24vYnVpbGQvZGViaWFu
L3N0cmV0Y2guZG9ja2VyZmlsZcKgwqDCoCB8wqDCoMKgIDIgLQo+IMKgYXV0b21hdGlvbi9idWls
ZC9mZWRvcmEvMjkuZG9ja2VyZmlsZcKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoCAxIC0KPiDCoGF1
dG9tYXRpb24vYnVpbGQvdWJ1bnR1L2Jpb25pYy5kb2NrZXJmaWxlwqDCoMKgwqAgfMKgwqDCoCAy
IC0KPiDCoGF1dG9tYXRpb24vYnVpbGQvdWJ1bnR1L2ZvY2FsLmRvY2tlcmZpbGXCoMKgwqDCoMKg
IHzCoMKgwqAgMiAtCj4gwqBhdXRvbWF0aW9uL2J1aWxkL3VidW50dS90cnVzdHkuZG9ja2VyZmls
ZcKgwqDCoMKgIHzCoMKgwqAgMiAtCj4gwqBhdXRvbWF0aW9uL2J1aWxkL3VidW50dS94ZW5pYWwu
ZG9ja2VyZmlsZcKgwqDCoMKgIHzCoMKgwqAgMiAtCj4gwqAuLi4va2VybmVsLzUuMTktYXJtNjR2
OC5kb2NrZXJmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgIDEgLQo+IMKgLi4uL3Rl
c3RzLWFydGlmYWN0cy9rZXJuZWwvNi4xLjE5LmRvY2tlcmZpbGXCoCB8wqDCoMKgIDEgLQo+IMKg
Y29uZmlnL1Rvb2xzLm1rLmluwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAgMSAtCj4gwqBjb25maWd1cmXCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fCAxMDA2ICstLQo+IMKgZG9jcy9jb25maWd1cmXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgOTkwICstLQo+IMKgc3R1YmRv
bS9jb25maWd1cmXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8IDIyOTMgKysrKy0tCj4gwqB0b29scy9jb25maWcuaC5pbsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDE1ICst
Cj4gwqB0b29scy9jb25maWd1cmXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA2Mzk3ICsrKysrKysrKy0tLS0tLQo+IC0tCj4gwqB0
b29scy9jb25maWd1cmUuYWPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgwqDCoCA0ICstCj4gwqAyNCBmaWxlcyBjaGFuZ2VkLCA2MTM2IGlu
c2VydGlvbnMoKyksIDQ2MzUgZGVsZXRpb25zKC0pCj4gCgpSZWxlYXNlLUFja2VkLWJ5OiBPbGVr
c2lpIEt1cm9jaGtvIDxvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbT4KCn4gT2xla3NpaQoK


