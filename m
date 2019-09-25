Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DC4BE1AC
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:52:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD9YJ-0001J9-QS; Wed, 25 Sep 2019 15:50:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lLTF=XU=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iD9YH-0001Ak-OL
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:50:01 +0000
X-Inumbo-ID: 11dd41ee-dfac-11e9-bf31-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by localhost (Halon) with ESMTPS
 id 11dd41ee-dfac-11e9-bf31-bc764e2007e4;
 Wed, 25 Sep 2019 15:49:34 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id y23so6189073lje.9
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2019 08:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=NJFPNSkbKCKtYoo8rj7/1FYyvYbde46hvRMdJXjDO90=;
 b=P0iZ5xvW+6ywMUIebXmnzYb65lKxXhlreVwRVcVHhHAYIiyISZ5dwBV2J38L8YpQHk
 czipFytxPGguqya7j4aMu3DXYUewaMwncg5YTBAuaHsYDTwkSEtJOeg5sogza2uxZE+U
 yHR1cHV4wQF5EPijRfsAEuKWZURSYeQxAz7CGQcxs8lBTmSbARZj8qBvXzBlfO/MqX14
 P6wsTulhsHPuPyw6NdEdrzh0ekFRIjTVfi4adsvmfvLik/8wRixyGQmjhcL8tzdTFgxh
 PawdBotpRss/lyoy468FSCpOQTu8m0AzYJrzXNCZU0xl9tg3x4/qsE85X2auasYQxwhC
 5j7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=NJFPNSkbKCKtYoo8rj7/1FYyvYbde46hvRMdJXjDO90=;
 b=ZLio83TR6JXc5oPLjeVUkDmXGis+EUw1hlv0/aCnFyOiWKQq4mZT35DOxl56uNWBTo
 R3gHPKqjNofEf+Dksc7p8Y7lGr3DyOWdB8byIP5ENOXhYgecm+ujIdHJE8R6bPsmZKnX
 x+WGTw4w6KkO3D/Imt4MMcpKr7cyP553aKInJPZqPVmipNZ+eEH4Up6Cklbcp4vooLZL
 kyuEWZPE9X366i5xd++VuvkOJRYnagbFgt/6wAiuaC6qK7jXasNynQgcswy3kYixmK/F
 ujQCYiq6NR5nyblb/ysHQFqoPaYOHdEkPYAnQjxXecp9EhXNDfL/bvEbYI/HoLoO8Zvu
 SJFA==
X-Gm-Message-State: APjAAAW/UcNw5qbgbOWV5jGfTGKLKd1gxQuUCqXfAQ4zck5d2/5Ag+Dq
 5PCz56ryEkTinNm0tIdpg6s=
X-Google-Smtp-Source: APXvYqwAXry//LpvOq3SoeJK+utnw4k2hy0dIDYoBFmt0BA8edVLQSh4lC+hl62F8ZqGVbgIIdlEeQ==
X-Received: by 2002:a2e:2416:: with SMTP id k22mr6928182ljk.216.1569426573330; 
 Wed, 25 Sep 2019 08:49:33 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id y26sm1479016ljj.90.2019.09.25.08.49.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Sep 2019 08:49:32 -0700 (PDT)
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
References: <20190918104113.3294-1-paul.durrant@citrix.com>
 <013c45a9490e413cb97abb02cef960bc@AMSPEX02CL03.citrite.net>
 <dcfdf2ab-8c64-ee63-637f-b0517087e8b5@suse.com>
 <23dec58404634921a595653f8a5ea504@AMSPEX02CL03.citrite.net>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <7d50ae35-2642-7fe5-89c7-c4ee09f263d0@gmail.com>
Date: Wed, 25 Sep 2019 18:49:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <23dec58404634921a595653f8a5ea504@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v13 0/4] add per-domain IOMMU control
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, David Scott <dave@recoil.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CltDQyBKdWxpZW5dCgoKSGkgUGF1bAoKSSBtYXkgbWlzdGFrZSwgYnV0IGxvb2tzIGxpa2UKCjgw
ZmYzZDMzOGRjOTMyNjBiNDFmZmVlZWJiMGY4NTJjMmVkZWY5Y2UgaW9tbXU6IHRpZHkgdXAgCmlv
bW11X3VzZV9oYXBfcHQoKSBhbmQgbmVlZF9pb21tdV9wdF9zeW5jKCkgbWFjcm9zCgp0cmlnZ2Vy
cyBBU1NFUlRfVU5SRUFDSEFCTEUgb24gQXJtIGlmIG5vIElPTU1VIGhhcyBiZWVuIGZvdW5kIChJ
IGJ1aWx0IAp3aXRoIG15IHBsYXRmb3JtJ3MgSU9NTVUgZHJpdmVyIGRpc2FibGVkOiAjIENPTkZJ
R19JUE1NVV9WTVNBIGlzIG5vdCBzZXQpIC4KClNvLCBpb21tdV9zZXR1cCgpIGNhbGxzIGNsZWFy
X2lvbW11X2hhcF9wdF9zaGFyZSgpIHdpdGggCmlvbW11X2hhcF9wdF9zaGFyZSBiZWluZyBzZXQg
KENPTkZJR19JT01NVV9GT1JDRV9QVF9TSEFSRT15KSB3aGljaCwgCmFjdHVhbGx5LCB0cmlnZ2Vy
cyBBU1NFUlQuCgouLi4KCgooWEVOKSBBc3NlcnRpb24gJ3VucmVhY2hhYmxlJyBmYWlsZWQgYXQg
Ci4uLmlsZC13b3Jrc3BhY2UvYnVpbGQveGVuL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oOjcyCihY
RU4pIC0tLS1bIFhlbi00LjEzLXVuc3RhYmxlwqAgYXJtNjTCoCBkZWJ1Zz15wqDCoCBOb3QgdGFp
bnRlZCBdLS0tLQooWEVOKSBDUFU6wqDCoMKgIDAKKFhFTikgUEM6wqDCoMKgwqAgMDAwMDAwMDAw
MDJiM2FlMCBpb21tdV9zZXR1cCsweGEwLzB4MThjCihYRU4pIExSOsKgwqDCoMKgIDAwMDAwMDAw
MDAyYjNhOGMKKFhFTikgU1A6wqDCoMKgwqAgMDAwMDAwMDAwMDJmN2RjMAooWEVOKSBDUFNSOsKg
wqAgYTAwMDAyNDkgTU9ERTo2NC1iaXQgRUwyaCAoSHlwZXJ2aXNvciwgaGFuZGxlcikKKFhFTinC
oMKgwqDCoMKgIFgwOiAwMDAwMDAwMDAwMmE3MDAwwqAgWDE6IDAwMDAwMDAwMDAwMDAwMDDCoCBY
MjogMmM3MzYxNzM2NTZlNjU3MgooWEVOKcKgwqDCoMKgwqAgWDM6IDAwMDAwMDAwMDAwMDAwMDLC
oCBYNDogMDAwMDAwMDAwMDAwMDAwMcKgIFg1OiAwMDAwMDAwMDAwMDAwMDAwCihYRU4pwqDCoMKg
wqDCoCBYNjogMDAwMDAwMDAwMDAwMDA4MMKgIFg3OiAyYjcyNjA3MjY0NmQ2NDcxwqAgWDg6IDdm
N2Y3ZjdmN2Y3ZjdmN2YKKFhFTinCoMKgwqDCoMKgIFg5OiBmZjY1Njg1ZTZjNmY3Mjc1IFgxMDog
N2Y3ZjdmN2Y3ZjdmN2Y3ZiBYMTE6IDAxMDEwMTAxMDEwMTAxMDEKKFhFTinCoMKgwqDCoCBYMTI6
IDAwMDAwMDAwMDAwMDAwMzggWDEzOiAwMDAwMDAwMDAwMjgwOTEwIFgxNDogMDAwMDAwMDAwMDAw
MDAyMAooWEVOKcKgwqDCoMKgIFgxNTogMDAwMDAwMDAwMDAwMDAwMCBYMTY6IDAwMDAwMDAwMDAy
YTcwMDAgWDE3OiAwMDAwMDAwMDAwMmE3MDAwCihYRU4pwqDCoMKgwqAgWDE4OiAwMDAwMDAwMDAw
MmE3MDAwIFgxOTogMDAwMDAwMDAwMDAwMDAwMCBYMjA6IDAwMDAwMDAwZmZmZmZmZWQKKFhFTinC
oMKgwqDCoCBYMjE6IDAwMDAwMDAwMDAyYTYzODAgWDIyOiAwMDAwMDAwMDAwMzM1NDMwIFgyMzog
MDAwMDAwMDAwMDAwMDAwMgooWEVOKcKgwqDCoMKgIFgyNDogMDAwMDAwMDAwMDI5YjFmMCBYMjU6
IDAwMDAwMDAwMDAyZDgzZDAgWDI2OiAwMDAwMDAwMDQ4MDAwMDAwCihYRU4pwqDCoMKgwqAgWDI3
OiAwMDAwMDAwMGMwMDAwMDAwIFgyODogMDAwMDAwMDAwMDAwMDAwMcKgIEZQOiAwMDAwMDAwMDAw
MmY3ZGMwCihYRU4pCihYRU4pwqDCoCBWVENSX0VMMjogODAwMDAwMDAKKFhFTinCoCBWVFRCUl9F
TDI6IDAwMDAwMDAwMDAwMDAwMDAKKFhFTikKKFhFTinCoCBTQ1RMUl9FTDI6IDMwY2QxODNkCihY
RU4pwqDCoMKgIEhDUl9FTDI6IDAwMDAwMDAwMDAwMDAwMzgKKFhFTinCoCBUVEJSMF9FTDI6IDAw
MDAwMDAwNzgxYjQwMDAKKFhFTikKKFhFTinCoMKgwqAgRVNSX0VMMjogZjIwMDAwMDEKKFhFTinC
oCBIUEZBUl9FTDI6IDAwMDAwMDAwMDAwMDAwMDAKKFhFTinCoMKgwqAgRkFSX0VMMjogMDAwMDAw
MDAwMDAwMDAwMAooWEVOKQooWEVOKSBYZW4gc3RhY2sgdHJhY2UgZnJvbSBzcD0wMDAwMDAwMDAw
MmY3ZGMwOgooWEVOKcKgwqDCoCAwMDAwMDAwMDAwMmY3ZGUwIDAwMDAwMDAwMDAyYmRkOTQgMDAw
MDAwMDAwMDAwMDAwMiAwMDAwMDAwMDAwMDAwMDAyCihYRU4pwqDCoMKgIDAwMDAwMDAwYmZlMGI2
NjAgMDAwMDAwMDAwMDIwMDFiNCAwMDAwMDAwMDc4MDgwMDAwIDAwMDAwMDAwNzdlODAwMDAKKFhF
TinCoMKgwqAgMDAwMDAwMDA0ODAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDA0MDAw
MDAgMDAwMDAwMDAwMDAwMDAwMwooWEVOKcKgwqDCoCAwMDAwMDAwMDAwMDAwMDAxIDAwMDAwMDAw
MDAwMDAwMDAgMDAwMDAwMDA3ODA4MDAwMCAwMDAwMDAwMDQ4MDgwMDQwCihYRU4pwqDCoMKgIDAw
MDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwZjA4MCAwMDAwMDAwMDQ4MDAwMDAwIDAwMDAwMDAw
NzgwMDAwMDAKKFhFTinCoMKgwqAgMDAwMDAwMDAwMDJkODNjMCAwMDAwMDAwMDAwMmFhNDQwIDAw
MDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMAooWEVOKcKgwqDCoCAwMDAwMDAwMDAwMDAw
MDAwIDAwMDAwMDAzMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDA0MGZmZmZmZmZmCihY
RU4pwqDCoMKgIDAwMDAwMDAwMDAwMDA0MDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAw
MDAwIDAwMDAwMDAwMDAwMDAwMDAKKFhFTinCoMKgwqAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAw
MDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMAooWEVOKcKgwqDCoCAw
MDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAw
MDAwMDAwMDAwCihYRU4pwqDCoMKgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAw
MDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAKKFhFTinCoMKgwqAgMDAwMDAwMDAwMDAw
MDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMAoo
WEVOKcKgwqDCoCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAw
MDAwMCAwMDAwMDAwMDAwMDAwMDAwCihYRU4pwqDCoMKgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAw
MDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAKKFhFTinCoMKgwqAg
MDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAw
MDAwMDAwMDAwMAooWEVOKcKgwqDCoCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAg
MDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwCihYRU4pwqDCoMKgIDAwMDAwMDAwMDAw
MDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAK
KFhFTinCoMKgwqAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAw
MDAwMDAgMDAwMDAwMDAwMDAwMDAwMAooWEVOKSBYZW4gY2FsbCB0cmFjZToKKFhFTinCoMKgwqAg
WzwwMDAwMDAwMDAwMmIzYWUwPl0gaW9tbXVfc2V0dXArMHhhMC8weDE4YyAoUEMpCihYRU4pwqDC
oMKgIFs8MDAwMDAwMDAwMDJiM2E4Yz5dIGlvbW11X3NldHVwKzB4NGMvMHgxOGMgKExSKQooWEVO
KcKgwqDCoCBbPDAwMDAwMDAwMDAyYmRkOTQ+XSBzdGFydF94ZW4rMHhhYTAvMHhjN2MKKFhFTinC
oMKgwqAgWzwwMDAwMDAwMDAwMjAwMWI0Pl0gYXJtNjQvaGVhZC5vI3ByaW1hcnlfc3dpdGNoZWQr
MHhjLzB4MmMKKFhFTikKKFhFTikKKFhFTikgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKgooWEVOKSBQYW5pYyBvbiBDUFUgMDoKKFhFTikgQXNzZXJ0aW9uICd1bnJlYWNo
YWJsZScgZmFpbGVkIGF0IAouLi5pbGQtd29ya3NwYWNlL2J1aWxkL3hlbi94ZW4vaW5jbHVkZS94
ZW4vaW9tbXUuaDo3MgooWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqCihYRU4pCgoKLS0gClJlZ2FyZHMsCgpPbGVrc2FuZHIgVHlzaGNoZW5rbwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
