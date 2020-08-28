Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC16255E49
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 17:58:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBglB-0004JR-Rv; Fri, 28 Aug 2020 15:57:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nNC1=CG=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kBglA-0004JM-Ic
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 15:57:48 +0000
X-Inumbo-ID: abee0c6c-a0d2-4136-89f2-8a552b15d9a3
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id abee0c6c-a0d2-4136-89f2-8a552b15d9a3;
 Fri, 28 Aug 2020 15:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598630260;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=t8XV0e3wPh2bGTn5aYk3wIEFr3pnu4fvQz5BBbqwf3I=;
 b=AZjVnyV9LtOPq41ivYMmWwBfCQiD5Bqc2iDF8pqrVghGbjgnAFywfzY0
 iXNmdzRdv0Dy8j7W3M+fERNPF8npaeKuZtcxZSyBwN/ja/GosQ2ia3wWU
 ze/CNNWisLeSjOAF0ncHGUd0AGnoRSexnf/DP5w65TPk00OIjz9oaiVB9 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=pass (signature verified)
 header.i=@citrix.onmicrosoft.com
IronPort-SDR: 9i8OQsdRrNhss7IbFu/nu3qRQrf9zXrXSS5Pha2kYp4+xBRD2kmOoTunOVqiYWCM490hFyem5Y
 kiYcaW3kCtbp02CiPU3TFRUfTGR6UWHAXhjY7Em7Gmut4Xq7Pyc/zAm7gOi9ABZWgCHm4gcH7G
 qRhBv8OTSqcHK2+Ubu5bcscHUQJRVMD4ymjrIMoQBObAcCa3kefyN2iRnJZssJMEsp601GmpqZ
 ulNq9lELiTHugyCNcBozPIZt+Z1E+L7vkwc0NPKQPhJsPh1sjsATbYk/vMAXdMEboTBJ3YQ4E5
 rTw=
X-SBRS: 2.7
X-MesageID: 25522181
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,364,1592884800"; d="scan'208";a="25522181"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iaXR/ynd+8PdKFCQVFsUnWk4QJHrzSbQmdVd0M57FhQwowxsBFNeHLqywSexVU+bRZ0LCJTdQiImnntAgvkh1A92zoBeNSouZsMd2Zw3hawrqQFVErfzGXfwKnTnnmfd0OQeYo3oDlSgnDhk9wrBKs8Fz+u2BZpGborb1lrTHokSsoH5GyWAFOXTns8EGoFosJUKlLMHSZL+u12SnMGAtxezxcT5HvetMxsonL2FCHzyqdylCu/gmwJIdkjOhyIBOCIGhjwD0HWuj/UwmozBHDx/ImDL7+6e3oPldLN91rvkC/PK6ZGIIXsBRSYJBeSdMUnjPv7CobdfnPnItQS88Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8XV0e3wPh2bGTn5aYk3wIEFr3pnu4fvQz5BBbqwf3I=;
 b=A+Iq7h6dwP0NjSgffwTkkTKfGYIgLS7H9hZQJmMF+OjHP+Eu4C+5EN+nimCpOTgKPCbFYWKUX4jtd7PFoqqKLU2vEnpkx2NrT8N0s166vyJCPrXyJHEJnTJQFJvsdRM2h2ITF1PlVoV7dXH8rSmgeiHEd0kfyntsJLWCm16Rt1IeIMwPEVyBwzq/6LgWq8dKPtyyTma6p6OMqFQVfGh6T5I7tli2aX6AuH2U9o5C4xivjTHxEa/SNKnzaA+jc6mKDa8rpcrAxyh/nE9Z4eD2746rXbFkZhdKrIE0G3NlVxU7pjx+m266+s3tQEghIP5+Nc/wy5SqtKGKpn2wY2mEKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8XV0e3wPh2bGTn5aYk3wIEFr3pnu4fvQz5BBbqwf3I=;
 b=ruqTxHUM5WRtyOkj2Tknbnt2CCJ7F/ZbsCYN0g3YR0UtdLOh3AESiKbyLlUQum3EbN5uRSntAd2HbSSJ0e578MMZgsVa+lAeDqqasmRFLM74lNGoiTRdwKqtRt9OR6oxl+O5wrg9jBbOg1YXcm9ej6fIuKAjUcC8aJxDUenyO1Y=
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Ian Jackson
 <Ian.Jackson@citrix.com>, "rosbrookn@ainfosec.com" <rosbrookn@ainfosec.com>
Subject: Re: Golang design session follow-up
Thread-Topic: Golang design session follow-up
Thread-Index: AQHWXvbkqZX3isiLZUWTcowoxjQWaKlN6fcA
Date: Fri, 28 Aug 2020 15:57:36 +0000
Message-ID: <639307EB-23A4-4D76-8BDB-7F2FA4F149D1@citrix.com>
References: <20200721003548.GA9581@six>
In-Reply-To: <20200721003548.GA9581@six>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f13996ea-5d42-47cc-9491-08d84b6b1592
x-ms-traffictypediagnostic: BYAPR03MB4008:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB4008B1D2C80699AF03E21DAF99520@BYAPR03MB4008.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DfFJ/6RTxg5zN5q6daVShMDKr4o7FX3C/1DGIzxUBCF7PGmY6iFcBHQZu8kUsFavOsQJivcoCk0F9SI2JMbETow7qeXL/qqV+gcvQ9p/dKmWnAAv5p/aEqtbWmrS/QYxRQvmAbVKQlfm2dsbkaiYo8cI++v6aLf2zMsLESKM17iW5RKKxn4HH8gZ36IesSZPU/McuQaTVjwVfUGwiFksdIYhNtIwsNrMg9PSBcNJrOv/yCjhmgUYrdki1gEwG/kbXtKVJLymVUxMJuGqIsQ5Q9lS+ITgC2AP8mvuAoFVFq4VzINDwi36kqIjH41X8CFyosj+P4hwYtNcN8qikN8G/AA72qFD7MXCGRWc38Owb9lN6Zpwy3z2cEW3BclUvfyW6cCLARdK1qbzZX4nmbAM8Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB4229.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(91956017)(2906002)(6506007)(53546011)(186003)(26005)(66946007)(33656002)(76116006)(71200400001)(83380400001)(2616005)(478600001)(54906003)(64756008)(66446008)(86362001)(66476007)(66556008)(4326008)(6486002)(36756003)(6916009)(6512007)(966005)(8676002)(8936002)(5660300002)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: sCYlcNYPXeE2VVtfpt4GBZ0L+A4WDdDaTFOwOtwq3J66ffr/qvlvpZnHWbZ+lp90mUj+ghpddpXmCa4EyQwX13BXH7cCGmniGZQsLVU6AwPCmWUkiAlYvylXKpkL0+idHDK6ImT0tkkOgEPS8Ge/kOyx3+YnEpoTcB3x+e+MJccwwJhVcBhKHcNXkLNkzQjw1T8+nnOSMvYcsI4OUPrHg4quElZD9Ii538P0Mi9lFpPtH1e+Zy65xpvJJ3YNnqqd/lwnZ38KGvEoMCDFR5xzrvXJsnVA3NIaa11IUz6/XmUZdeXCOpyNdnpRy4OmaN96M4QLphatul5OX7J+TTGxOW8tHhbsYHp2A6VBG8bUpe2qoRIJo4Zz4QbWG2lNgGnRgDYIAAbCcj1Dy9MQycWEeCzKc3xRT2KmA/a8zspOkjKWQgz8hT9ukJJGJQnQ8vOT9Zu0C/962CyF8Wv8JR7MVmmX9e7fsSmCzVWVb4FFj3IUW3FGUY8ga6m/xv4EMf3gCT6hAO2s6SB0oLw8HOHS6TTJn/7UryLJge+gc10bIKg+SagFJO3cfQz/3CK+YJTsjkwLjfaZz4n8fhI1AsI3szN7wbNgjJzp+HAnw820dJU6LyVwXHpombK6ms1pNw0z4emEOqVuinHmtc3oYbiuKA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <F9FCC4A353DB5D499FC3E373A13339E8@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f13996ea-5d42-47cc-9491-08d84b6b1592
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2020 15:57:36.6557 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hoNQIEVWgIH/TFYqHXsdgMu5wVSNd1+wUUybY4BT6TMakZYB1miaV0gz3yF/zHu6jjRpUm8qxIxvZbNlWDlGXXifS7DLbPhlSLvr3FAsxk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4008
X-OriginatorOrg: citrix.com
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVsIDIxLCAyMDIwLCBhdCAxOjM1IEFNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9v
a25AZ21haWwuY29tPiB3cm90ZToNCj4gDQo+ICAjIExvbmctdGVybSBob21lIG9mIHRoZSBwYWNr
YWdlDQo+IA0KPiAgICBJYW46IEF1dG9nZW5lcmF0ZWQgc3R1ZmYgaXMgYmVjb21pbmcgbW9yZSBh
bm5veWluZy4NCj4gDQo+ICAgIERlbGV0ZSBhbGwgdGhlIGxpYnhsIGF1dG8tZ2VuZXJhdGVkIHN0
dWZmIGZyb20gc3RhZ2luZyAmIG1hc3RlciwgYW5kIGhhdmUgIm91dHB1dCBicmFuY2giLg0KPiAN
Cj4gICAgVGhlIHJlYXNvbiB3ZSBoYXZlIHRoZXNlIGluLXRyZWUgaXMgdGhhdCBvdGhlcndpc2Ug
eW91IGNhbid0IGJ1aWxkICpmcm9tIGdpdCogaWYgeW91IGRvbid0IA0KPiAgICBoYXZlIG5ldyBl
bm91Z2ggdmVyc2lvbnMgb2YgdGhlIHJpZ2h0IHRvb2xzLg0KPiANCj4gICAgRGlzdHJpYnV0aW9u
OiBNYWtlIGEgcmVwbyBvbiB4ZW5iaXRzIQ0KDQpTbyB0aGlua2luZyBhYm91dCB0aGlzOiANCg0K
VGhlIGZpcnN0IHBsYW4gSSBoYWQgd2FzIHRvIGhhdmUgYSBzY3JpcHQgaW4gdG9vbHMvZ29sYW5n
L3hlbmxpZ2h0IChhbmQvb3IgdGhlIE1ha2VmaWxlKSwgd2hpY2ggd291bGQgYmUgaGFuZGVkIGEg
ZGlyZWN0b3J5LCBhbmQgd291bGQgdGhlbjoNCg0KMS4gU3luYyBzdGF0aWMgZmlsZXMgZnJvbSB0
b29scy9nb2xhbmcveGVubGlnaHQgaW50byB0aGF0IGRpcmVjdG9yeQ0KDQoyLiBSdW4gZ2VuZ290
eXBlcy5weSwgaGF2aW5nIHRoZSByZXN1bHRpbmcgZ2VuZXJhdGVkIGZpbGVzIHB1dCBpbnRvIHRo
YXQgZGlyZWN0b3J5DQoNCjMuIFJ1biBgZ2l0IGRpZmZgIGluIHRoZSB0YXJnZXQgZGlyZWN0b3J5
OyBpZiB0aGVyZSBhcmUgYW55IGNoYW5nZXMsIHRoZW4gYXV0b21hdGljYWxseSBydW4gYGdpdCBj
b21taXRgIHRvIGNoZWNrIGluIHRoZSBjaGFuZ2VzLg0KDQpUaGF0IHdheSB5b3UgY291bGQganVz
dCBzZXQgdXAgYSBjcm9uIGpvYiB0byBzeW5jIHRoaW5ncyBvdmVyIG9uIGEgcmVndWxhciBiYXNp
cy4NCg0KVGhpbmtpbmcgYWJvdXQgR1BMIGNvbnNpZGVyYXRpb25zLCBob3dldmVyLCB5b3XigJlk
IGFsc28gd2FudCB0byBpbmNsdWRlIGxpYnhsX3R5cGVzLmlkbCBhbmQgaWRsLnB5LiAgQW5kIHRo
ZW4gb2YgY291cnNlLCB5b3Ugc2hvdWxkIGFsc28gaW5jbHVkZSBhIHdheSB0byBidWlsZCB0aGUg
Z2VuZXJhdGVkIGNvZGUgZnJvbSB0aG9zZSB0d28uDQoNCkF0IHdoaWNoIHBvaW504oCmIHdvdWxk
IGl0IG1ha2Ugc2Vuc2UgdG8ganVzdCBtb3ZlIHRoZSBwYWNrYWdlIG91dCB0byBpdHMgc2VwYXJh
dGUgcmVwbyBlbnRpcmVseT8gIEkuZS4sIGhhdmUgYWN0dWFsIGRldmVsb3BtZW50IGhhcHBlbiBp
biB0aGUgcmVwbyB3aGljaCBlbmRzIHVwIGJlaW5nIGNsb25lZCBpbiB0aGUgZW5kPw0KDQpPYnZp
b3VzbHkgdGhlcmUgYXJlIG5pY2UgdGhpbmdzIGFib3V0IGhhdmluZyB0aGUgY29kZSBpbiB0aGUg
c2FtZSByZXBvOyBidXQgdGhlcmXigJlzIGFsc28gc29tZXRoaW5nIHNhdGlzZnlpbmcgYWJvdXQg
YmVpbmcgYSBmdWxsIGRvd25zdHJlYW0uDQoNCkkgd2FzIGFjdHVhbGx5IHRoaW5raW5nIGl0IG1p
Z2h0IG1ha2Ugc2Vuc2UgdG8gcHV0IHRoZSByZXBvIGF0IGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4t
cHJvamVjdC9nby14ZW5saWdodCAsIHRvIHRyeSBvdXQgdGhhdCBhcyBhIGRldmVsb3BtZW50IG1v
ZGVsLg0KDQpBbnkgdGhvdWdodHM/DQoNCiAtR2Vvcmdl

