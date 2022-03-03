Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9BE4CBBA6
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 11:46:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283099.481999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiyA-0002Qx-S2; Thu, 03 Mar 2022 10:46:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283099.481999; Thu, 03 Mar 2022 10:46:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiyA-0002OJ-ON; Thu, 03 Mar 2022 10:46:02 +0000
Received: by outflank-mailman (input) for mailman id 283099;
 Thu, 03 Mar 2022 10:46:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=++p5=TO=citrix.com=prvs=054f29298=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nPiy9-0002OB-7h
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 10:46:01 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c3540aa-9adf-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 11:45:59 +0100 (CET)
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
X-Inumbo-ID: 1c3540aa-9adf-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646304359;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=KWu0hAmcLTlQGm/dUUSB0eIHCRr1dfI5IWrBk76qluY=;
  b=UWcsNiU7nUdl9znNsyv+0LWZjp4I4MEPU35DJvF03c42P7TqNskyOUCo
   UeluFJBDAa12M1G8Guy1c6w7pUPStSHYOgtnPUhO738fddDFGoaufnnUw
   AJDQYsablfhVLCBV0TYjY8ij/A+6BvVa0a2ZKawD1cysvzQj4+n2V8KT/
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65783837
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:QeSQDqgZzA2Z4bwKsp0jbEMcX161VxAKZh0ujC45NGQN5FlHY01je
 htvWj3TMq3ZZGugfNgjOomz8kID7MLRmIUyTVFvqyEzFngb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFvW4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YVgCF7Xgg9YBaUkbEAJEPZN2/Y31Infq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bklhmwSvUErANRpfbTr+RzdRZwC0xloZFGvO2i
 88xN2cwPE+QOEIn1lE/LpwZnri323/GSB5jok2kt6QIvXTw01kkuFTqGIWMIYHbLSlPpW6Ho
 krW8mK/BQsVXPSDyTuetHO3wOaXmTj8XqodEbS58rhhh1j77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVXRe1vXqFtR40QMdLHqsx7wTl90bPy1/HXC5eFGcHMYF48p9tLdA36
 rOXt4zCLCRDq4+JcyLe9ZSurQ2CPBonLmBXMEfoUjA5y9XkpYgyiDfGQdBiDLO5g7XJJN3g/
 9yZhHNg3utO1Kbnw43+pAma2Gz0+vAlWyZovl2/Y46z0u9uiGdJjaSM4EOT0/tPJZ3xorKp7
 CldwJj2AAzj4PiweM2xrAclQenBCxWtamS0bbtT838JrW7FF5mLJ9043d2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPa8S465CKyFNYUTO/CdkTNrGgk0PyZ8OEi3zSARfVwXY
 8/HIa5A815AYUiY8NZGb7hEiuJ6rszP7WjSWYr633yaPUm2PxaopUM+GALWNIgRtfrcyC2Mq
 oo3H5bamn13DbylCgGKoNF7ELz/BSVibXwAg5cMLbDrz8sPMDxJNsI9Npt6I901x/kOz7yQl
 px/M2cBoGfCabT8AVziQlhoaa/1XIY5qnQ+PCc2Ok2v1WRlaoGqhJrzvbNtFVX73ISPFcJJc
 sQ=
IronPort-HdrOrdr: A9a23:G+dH3q2+B/JRPKnKxabo6gqjBRxyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5AEtQ5OxpOMG7MBbhHQYc2/hfAV7QZnibhILOFvAt0WKC+UytJ8SazIBgPM
 hbAtFD4bHLfDtHZIPBkXOF+rUbsZi6GcKT9J/jJh5WJGkAAcAB0+46MHfhLqQffngcOXNTLu
 v52iMznUvHRZ1hVLXdOpBqZZmgm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYL6w
 H+4kzEz5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwizyveJ9qV9S5zXMISaCUmRQXee
 v30lMd1vdImjTsl6aO0F3QMjzboXMTArnZuAalaDXY0JTErXkBerV8bMpiA2XkAgwbzYtBOe
 twrhKkX9A8N2KwoA3to9fPTB1kjUyyvD4rlvMSlWVWVc8EZKZWtpF3xjIfLH4sJlOy1GkcKp
 gnMCgc3ocjTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2i5ozuNxd7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUKsHJ3XOoZjq56hd3pDhRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOtgvARW2sNA6dvP22J6IJzYEUaICbQxFrEmpe4PdIi89vd/HmZw
 ==
X-IronPort-AV: E=Sophos;i="5.90,151,1643691600"; 
   d="scan'208";a="65783837"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWzoFE1S5xtpTMyIF0GyFrDGllyETpb0sVKj4rU1rS4mugq5/MGm7oCDHkh8czKgG41wihIa2HtDPRypJEWBjdiREJGhpGbi4dArqlxV2O1cmjCcfUzHdeH305zTNPsbBCe2A2RE0zV81i6ZvEpGfhdjZs9F1NsMI3l2wtACCRAPvOksrCJUT4LztrvLabkP2Ep/M0VuSCAb31U2pGUaFEYyk5Y+H1eZUSJhJgaUf0QTng0TBYYAz56K53axAAYxr9p1g4cwUtKah7phRnjpWzBXYSa06F3Q3DxQfYRtUJlUzkv4+ogVffp6gIMSbVu4W+Q5EhIfQXZDNwvyH0WhZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWu0hAmcLTlQGm/dUUSB0eIHCRr1dfI5IWrBk76qluY=;
 b=jLVT8lLDuoRjUafzLQRqYyX3sIlNpIb8+6dynlEG4bRvL7i+zO5dSjAgsIw7W6BsJSe6NNxMx9ugWgbdnHz/K/QgMegyERQwAnf2vhfhiw4BfCmo50p1sR0rNMVobCzhccdmRRabRhH3z6piWS6pI/H2wHSyNVrMS0mhueMqI4vLca1K6mCYNhwZ30X4++35SPD37VkeRadvURg6p/8CvOY8hMR4uC5xatKoQ5Gb6eIRhnKWJVwJQmIxnvXPcDsrXb86fS7ZhuQKMAoZwdNE9BBtbcwSqbKi8mzYkHeAcJZcoHHBBwk/Km9iL3jQJjlpu60rh39t9LDHbty1+6yoxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWu0hAmcLTlQGm/dUUSB0eIHCRr1dfI5IWrBk76qluY=;
 b=Zl5gNKssFdktqz7M5f6yB5brWpBd30zHBan92LgThtIdgqjFlS7epdk37vSLUsCC7kQ+Rjr6ItShZFyWGGIfEQqMYQ1kOmOOTLsuoQja1v4ENxVJhQbnMTmXZ1QsHX561efo7e5LjmxE4DzjmnKe1T4W8BJbrbbcjPVBTLf7MTs=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Alex Olson
	<this.is.a0lson@gmail.com>
Subject: Re: [PATCH 3/3] hvm/pirq: allow control domains usage of
 PHYSDEVOP_{un,}map_pirq
Thread-Topic: [PATCH 3/3] hvm/pirq: allow control domains usage of
 PHYSDEVOP_{un,}map_pirq
Thread-Index: AQHYLunWut2cJ/LWfU2xlp5ijbCQIayteeMA
Date: Thu, 3 Mar 2022 10:45:54 +0000
Message-ID: <c1fafc74-d4d2-5fc5-db38-c75f076d8405@citrix.com>
References: <20220303103057.49181-1-roger.pau@citrix.com>
 <20220303103057.49181-4-roger.pau@citrix.com>
In-Reply-To: <20220303103057.49181-4-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2306cd22-1a3a-410d-39d9-08d9fd02fe75
x-ms-traffictypediagnostic: DM6PR03MB3659:EE_
x-microsoft-antispam-prvs: <DM6PR03MB3659D39CA7A399DE9842B78ABA049@DM6PR03MB3659.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e70SheLknPtV5xN048T2FIPCqg4LYD3hWOxJvxn3MNkVc7Mv4PzkZpNVoa7G10w/oWR3aZUYICuQxdbNECVaBLA8m/ov7iwlxc3z3OeMp6f/w6XLjo9EuouyvfHxTW/wXZSWY73U9RGcPOuV0QSghGWu+Qr3U6hgHWu61o6FwuL55zwJ4JeqsY94QvYIUqOXEN9QSwwy7Tq+0sAJlO5na7MJzm8lG4iD2I57/jmUgWq4vSlXsPEsFpEPzwrVcorA/RsAS0iEONkwSwDSv2Ikc2/8hEknFztdW7kpaeySyn4SJkn8KyF7/4Kq57itfj/PXyzorxEHv/VwNyE1U4Si1kSKcTMAzMIaDWO5/7FvKzq1U4dfLIju4V49GTop2L3bzn2RGHfMvkBB5IPLu+9X64dTQF/Q+iS/WqFTH+0rJoJubsjaiBtZZXelmit5CQGAt2n7TGFsdvR62nFVKreAMsP0SU+Z3GnizqaJosEOXEOVb4UWOqewu6XL1Iy3n2ChG7nX5dSfe4RYcrkVEDK2KOUxq/TsL0Lt8wprsUjHFBYibpx/eWSc6CRLUbuP1v3CNbPAIfp0HH32RsT3uq1OrQ4n1J1hYuglzSXDKDnklvH1WJauQjqiWki7IZtNpwkm3h6EqocG4byaBJt1S7DMvztQCMo8xtd7zy6RE5UpXuj4kJUfr3x6mrYXdzebL3XbxCf/6R7eP0wtt9Kt1tkfOY+FZ2YkOCLEoKXF50mqv3+AF0gmHWBP9k0WmytOyDDz81xpDr6TEjz6ElfFKlSErA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(38100700002)(71200400001)(2906002)(110136005)(83380400001)(36756003)(54906003)(26005)(186003)(53546011)(2616005)(6512007)(31686004)(8936002)(6506007)(38070700005)(316002)(508600001)(6486002)(8676002)(82960400001)(4326008)(86362001)(76116006)(66556008)(66446008)(66476007)(64756008)(122000001)(31696002)(91956017)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2hOY2xIeG1sRGpsN3RhK2p6ei9xRnN3MTlEcGtPOUZWL2tJUnBhbW1ydHZ0?=
 =?utf-8?B?N0ptYUMwQmQ0bDJtQmVKVzROVFNNMndLaGJHR1FqVU9odU9IL0VrbGhJcjNo?=
 =?utf-8?B?TmROSmVtazBnYlRNQlUxVm9LbkVGMGpXdWU5b1ZXYXhCdjFTZnhHYmxXYkdp?=
 =?utf-8?B?dkRtdkdGc2tiSFArRk96NGNFVWNCMC9kM3kwV3ZGdkZFMUZSWEt1OGRtczdR?=
 =?utf-8?B?L3hpb1U5eFo4T2laMlRSSEJFeGJZRGR0WUlNNHpWOWt2aVdiaEtrS3llWTZD?=
 =?utf-8?B?dldZcnhiK3BkMnk4SVBUbzhHVnh1SXFJWWVkZ2taVVVXMXE0U1F5T21vbEZr?=
 =?utf-8?B?YmxLZUpEU0phZGdUbWxkNUI4b01xbjZqeE0wZ0xMMXdMT0tyTGhZWTRRNzc3?=
 =?utf-8?B?dm5sQlpUdEFJSjgvODl4d0VFRXkwZlROdXlWMU15ekMwWTI0UjJ5NUlMeGQ3?=
 =?utf-8?B?YXNqRjJsRjk3OUFxam04TjFwZTcyMzRDY1NUVVo0RncvWU9Wb3R5eW14SkNS?=
 =?utf-8?B?aWhyMkNlTGZkRXRKUzZHS291NG5rbnQ2UE1TWHljSEhtaEhqeGhQd1FJa3lH?=
 =?utf-8?B?aGw3SGtCR1lRVHdOUnA2dHBPSTBaUTZIS2t3VzJ5L0VSdktqQTdDNWpOMWxX?=
 =?utf-8?B?RzBXekdraC9JM01DZHpRUG9pWVFDWEN5eXBBNU9UVHBQYS9xaVVHb2hmZWNz?=
 =?utf-8?B?TlFweG5Rdk9pbHhvNlBhY0hESmJoeUM1TlVkb3RON1M0cy9oWmJsRXF2Ty9W?=
 =?utf-8?B?MGpSUDgrOFY1VlhzNHYxK3pnOVY1UDVwR1hSQ2R2R1dzbys0YkhiakZIbzRH?=
 =?utf-8?B?TEp1SllrUzgycW9Tanl3R1pvRUcrVFRYNkV0TGkwTDh1Rk1SK0NwZXp2aGt2?=
 =?utf-8?B?UHg0RExFcGpMNnNLbGpmcURzL2tZVy9FdDBTRG9wWFJIVFQ2blJuWHE2cE5x?=
 =?utf-8?B?RnpJNGI5M3I3cnRRMHB5bHpDckdpcmNEdUpDMUM4eTJwR1BsZEFmNmpIZzlP?=
 =?utf-8?B?dFR3WGVINm9PR1FhSjJyMXZpNnFXaklXVjVkUkFZbFBaWXpYQUN0K3E5RnF3?=
 =?utf-8?B?WlYyOFM1d0VmRUxlc3BrRE54R1h0SENLbk9qVVBIMEQxWEZaQ3BSL2Z2c3FS?=
 =?utf-8?B?QXZhUUtYK0E5Vk4xR1Y5cHBpQXd2QzMzZ29KeWtNY3dPOHhwTnI1S1lEZmxw?=
 =?utf-8?B?Z3NJTkVqaVF0b2FZOVpvUkpOd0ZFYmwrWjlQdWlFL2NBR0szVUt4VVRDbnh3?=
 =?utf-8?B?UlRYWmJJdU1QUkFDUmdJUlJlUGZZN2ZkaWQ4VGVBRXBIN1F1SU1mSy9rMlB1?=
 =?utf-8?B?elBlYnVMaVRHS1VHYmpTUmdTa0lRdjJPdEZwaUhERGVQUVRCRnlPYTN1YnVM?=
 =?utf-8?B?KzZoZm5oOWFBSmI0TlFPWTVpU3Q3eklpVm9sbHRnWmpGQVBJVncvVkd5TmtZ?=
 =?utf-8?B?NGhoVXNqTkNRT3FsR2lZUUNJUWxobWdHalZKMjA0cWZUcTFnMlhWeGE3Z2Vq?=
 =?utf-8?B?bjVmZEJUSXIyRXFaK2NodzZDWHYxM0RaNnlISXBQaE5mRDFSTWxsYUNJbU45?=
 =?utf-8?B?SlBaMjdwYnpHTUhXRDlZTG8wV25XN1RjMWNPeTBsNVV4Qm5zYy9mZzVPSTNw?=
 =?utf-8?B?MXFIdndNaWxwSjZRZWtKais5OUpmdXE5VktqNDc2eGJEb0ZreGFiQlovblZD?=
 =?utf-8?B?Zm1lWlZualQzb2MveWJ2UmppaFh1cEkwMUlXeUNsSi9WYXlqbll4SjY4dkVG?=
 =?utf-8?B?SWFkQTNIZkNhaVhTWFloTmcwMDN3Y0JMVmVTekxrK01McGxaVkFTcjBNVHFW?=
 =?utf-8?B?QUIxUFVuNXZEMjVZclhYTENIUFBJL0VyYWFjcEJvdFRWSjRZQVpTdG9NQXYz?=
 =?utf-8?B?anlQUTcxMUlRUU9lS3p2SlpRSEl6alA1bkZKVzlxZm0yc3hKN3BDN3NtalQ5?=
 =?utf-8?B?d0dCRW0veXFQMVF5T2trN0lhZUphd1ZnM3ZoRmZRbzhuM2Q0blZFSGs1K1hv?=
 =?utf-8?B?S2F0L2VPZ1RNYnA1VkZiYzQ5MlBUMm5lbWw2ZmwvREVaWHg5cndsS1VZVCtu?=
 =?utf-8?B?SkY4RUhGemtpVlJ4ZkpYRzVWSFJmWWxSZnNwZDBzSGNQYWpNd3lpamMrZlhr?=
 =?utf-8?B?Z0s4UWVXeHVXOFlVRU1WUHowQXphQ2dLU0R6L1JteCtiRXhLdHdydE5jdjVZ?=
 =?utf-8?B?YTZlaDhzV1EvODVweStRWGFTWXdrQkg5S3NpbUROenBYcDVsbXNwYXVaSlJG?=
 =?utf-8?B?TkovdEpTK3BmOGM3Y1VIbGFuZzZnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C33EC2E95322FF4E91A0E530A662149A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2306cd22-1a3a-410d-39d9-08d9fd02fe75
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 10:45:54.9711
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KejHbd5NvT52MF9XDi135bpfOKStlVG0f62akYr6l6RDih8diA4GopU+vlNF2cBttBehgDRqY5w9rSh1R9LH4BYZs6649yUw8FEKqyNWfG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3659
X-OriginatorOrg: citrix.com

T24gMDMvMDMvMjAyMiAxMDozMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBDb250cm9sIGRv
bWFpbnMgKGluY2x1ZGluZyBkb21haW5zIGhhdmluZyBjb250cm9sIG92ZXIgYSBzaW5nbGUgb3Ro
ZXINCj4gZ3Vlc3QpIG5lZWQgYWNjZXNzIHRvIFBIWVNERVZPUF97dW4sfW1hcF9waXJxIGluIG9y
ZGVyIHRvIHNldHVwDQo+IGJpbmRpbmdzIG9mIGludGVycnVwdHMgZnJvbSBkZXZpY2VzIGFzc2ln
bmVkIHRvIHRoZSBjb250cm9sbGVkIGd1ZXN0Lg0KPg0KPiBBcyBzdWNoIHJlbGF4IHRoZSBjaGVj
ayBmb3IgSFZNIGJhc2VkIGd1ZXN0cyBhbmQgYWxsb3cgdGhlIHVzYWdlIG9mDQo+IHRoZSBoeXBl
cmNhbGxzIGZvciBhbnkgY29udHJvbCBkb21haW5zLiBOb3RlIHRoYXQgZnVydGhlciBzYWZldHkN
Cj4gY2hlY2tzIHdpbGwgYmUgcGVyZm9ybWVkIGluIG9yZGVyIHRvIGFzc2VydCB0aGF0IHRoZSBj
dXJyZW50IGRvbWFpbg0KPiBoYXMgdGhlIHJpZ2h0IHBlcm1pc3Npb25zIGFnYWluc3QgdGhlIHRh
cmdldCBvZiB0aGUgaHlwZXJjYWxsLg0KPg0KPiBSZXBvcnRlZC1ieTogQWxleCBPbHNvbiA8dGhp
cy5pcy5hMGxzb25AZ21haWwuY29tPg0KPiBSZXBvcnRlZC1ieTogQW5kcmV3IENvb3BlciA8QW5k
cmV3LkNvb3BlcjNAY2l0cml4LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IC0tLQ0KPiAgeGVuL2FyY2gveDg2L2h2bS9oeXBl
cmNhbGwuYyB8IDcgKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0K
Pg0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwuYyBiL3hlbi9hcmNo
L3g4Ni9odm0vaHlwZXJjYWxsLmMNCj4gaW5kZXggMDMwMjQzODEwZS4uOTEyOGU0ZDAyNSAxMDA2
NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwuYw0KPiArKysgYi94ZW4vYXJj
aC94ODYvaHZtL2h5cGVyY2FsbC5jDQo+IEBAIC04Nyw2ICs4NywxMyBAQCBzdGF0aWMgbG9uZyBo
dm1fcGh5c2Rldl9vcChpbnQgY21kLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZykN
Cj4gICAgICB7DQo+ICAgICAgY2FzZSBQSFlTREVWT1BfbWFwX3BpcnE6DQo+ICAgICAgY2FzZSBQ
SFlTREVWT1BfdW5tYXBfcGlycToNCj4gKyAgICAgICAgLyoNCj4gKyAgICAgICAgICogQ29udHJv
bCBkb21haW4gKGFuZCBkb21haW5zIGNvbnRyb2xsaW5nIG90aGVycykgbmVlZCB0byB1c2UNCj4g
KyAgICAgICAgICogUEhZU0RFVk9QX3t1bix9bWFwX3BpcnEgaW4gb3JkZXIgdG8gc2V0dXAgaW50
ZXJydXB0cyBmb3IgcGFzc3Rocm91Z2gNCj4gKyAgICAgICAgICogZGV2aWNlcyBvbiBiZWhhbGYg
b2Ygb3RoZXIgZ3Vlc3RzLg0KPiArICAgICAgICAgKi8NCj4gKyAgICAgICAgaWYgKCBpc19jb250
cm9sX2RvbWFpbihjdXJyZCkgfHwgY3VycmQtPnRhcmdldCApDQo+ICsgICAgICAgICAgICBicmVh
azsNCg0KSG1tLsKgIEluIGEgc3BsaXQgY29udHJvbC9oYXJkd2FyZSBkb21haW4gbW9kZWwsIHRo
ZW4gcWVtdSBpcyBpbiB0aGUNCmhhcmR3YXJlIGRvbWFpbiByYXRoZXIgdGhhbiB0aGUgY29udHJv
bCBkb21haW4uwqAgSSBzdXNwZWN0IHRoaXMgd2FudHMNCmV4dGVuZGluZyB3aXRoIHx8IGlzX2hh
cmR3YXJlX2RvbWFpbihjdXJyZCkuDQoNCkFsc28sIHRoZSBzZW50ZW5jZSBhYm91dCBsYXRlciBz
YWZldHkgY2hlY2tzIHJlYWxseSBvdWdodCB0byBiZSBpbiB0aGlzDQpzb3VyY2UgY29tbWVudCB0
b28uDQoNCn5BbmRyZXcNCg==

