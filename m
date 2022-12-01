Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E07063F145
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 14:11:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450686.708074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0jL3-0001yH-BN; Thu, 01 Dec 2022 13:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450686.708074; Thu, 01 Dec 2022 13:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0jL3-0001wK-8D; Thu, 01 Dec 2022 13:10:53 +0000
Received: by outflank-mailman (input) for mailman id 450686;
 Thu, 01 Dec 2022 13:10:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/wf=37=citrix.com=prvs=32775c42f=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1p0jL2-0001wE-4P
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 13:10:52 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92589a42-7179-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 14:10:50 +0100 (CET)
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Dec 2022 08:10:40 -0500
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 DM6PR03MB4938.namprd03.prod.outlook.com (2603:10b6:5:1ec::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.8; Thu, 1 Dec 2022 13:10:38 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22%5]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 13:10:38 +0000
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
X-Inumbo-ID: 92589a42-7179-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669900250;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Ri35gFLH64/DJqlkLkwPshonJVofaLWrbJ5axIhY+kI=;
  b=VAKewshnkB8t0QdpluEqnd4YE8xm8vG8eZ8imkQC/iDGa6Ci3q4topcK
   xaFouvbr72sP4OvjiBeiFoZfnlED9oYPIUwDEkdI0ALCkXVH8ar8ZdkT8
   M1FM3OaLjYuzo8Ai/QSd4S1olT7fFD8xoq46j/UXNUvcjp3EMfIVGyU0W
   4=;
X-IronPort-RemoteIP: 104.47.57.176
X-IronPort-MID: 85608333
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:A8r1vK6SyKn1hoD9V2B1/AxRtCbGchMFZxGqfqrLsTDasY5as4F+v
 jFMXDjXPamKMWqkKI9wb4TgphgHvZ6ByYNiGwBuqnxmHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKoT5QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5my
 L8yFG8jfja4t8Xs76KRSONSgfskI5y+VG8fkikIITDxK98DGMmGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Ok0ooj+aF3Nn9I7RmQe1enlyZv
 X7H9mK/BhAcON2Q4TGE7mitlqnEmiaTtIc6RODmrq4x2wb7Kmo7Fj40b3ugjd6FtlOfepF8O
 3M48TI3hP1nnKCsZpynN/Gim1aUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebTAjy
 FKhhd7iAj1r9rqPRhqgGqy8qDqzPW0ZKDEEbCpdFA8duYC8/sc0kw7FSctlHOitlNrpFDrsw
 jeM6i8jm7EUis1N3KK+lbzavw+RSlHyZlZdzm3qsqiNtGuVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:KQuwva/Zh1fU0mvT3vNuk+Gddb1zdoMgy1knxilNoH1uA7mlfq
 WV95omPHDP6Ar5J0tQ5exoVJPgfZq+z+8H3WBuB8bBYOCOggLBRr2KhrGSoAEIdReOk9K03s
 9bAtdD4LWbNzRHZa2R2maF+xlL+rS62ZHtvMOb60pECThtbaQI1XYKNu5YeHcGOjWvwfACZe
 qhDg8snUvQRZ1tVLXeOlA1G9LbosHNltbPeAduPW9f1CC+yQmw7aL8EVyywhcaXlp0sMof2F
 mAqRX9+qKg99ayzhO07R61071m3OH5z8dFBoirlM8YMVzX+2CVTbUkYaSGoDc25NuOxT8R4a
 HxiiZlBd1393TSOlu4ugTgwC7p1DpG0Q6Y9XaoxUH7pND/RnYEB9FahYRfGyGpkXYdgA==
X-IronPort-AV: E=Sophos;i="5.96,209,1665460800"; 
   d="scan'208";a="85608333"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ktYyHbTU18SpTLDnQrNzJNbMHcISoSoAloZsulhXmGo1LhZ8unmYUdhS7uqk1wL2EnE3YycgVPIRFL7NPIsP00Ev96tpciy3U4BFlTweWrm4EZ6aYQtOT6LTcAySGF45I44Jv0t53cRrc4QJrtMpuD+iso4Ho98WIjh79MkMZDLY09TQJacnSkicja8nZvJVvKiQNqmitEAkNbhy9BlKqozOwwKK36q3/xnRfC41We6uOH+QuuGF64750bGkxSS7yI6f4x0vBtA3zOD61Y3WSxbkjf4xMJL3/L54KqaHZUXzlfixc5Y+TQnpC5fIDNyhpgcrMJRuTS/QWNV1YUk1nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ri35gFLH64/DJqlkLkwPshonJVofaLWrbJ5axIhY+kI=;
 b=kyinFHGTqNwMVPLrsMvp8HqJIMYOT1+3qL08Y9lu/QugpNlcupXHF8PlY53VGuT89Osx1K5KGYFidQaO8gtCa2s+49dxZVjTV9li9kh0fyKayV+cqctAGZExosU/+rQ745zDQFxvqbgbSBBxvGmTePsgUfrhWDXaM1tsjjh5rcUZkXgt0K3x7zjVingnRTc42Necva3YQqxJH7R7JxDcoA1QNpyJkUm7xpIGDPJAcL1zY2vZ5pjjESlLUcdR3SJqgeu1ECRNTekOi163xZr2nn8cg6nmKw1eWZOJRJOELt4JqFYHCLJ/ZiEiyePVoTPkC0ym1/N432gPerDRMarZlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ri35gFLH64/DJqlkLkwPshonJVofaLWrbJ5axIhY+kI=;
 b=nGD1iqdPxS1ovfw2VIZT5r3JVB2m3XpM1d7F9I+6TDPRAUGFPp5Rrp9xI1Liw1efi9t7CSoaqLB3hrYAzgqQRCD5D8Mtqwc6o9602aiOadVMmnUJ0OYrWKbNAM+O9edZ2vzL7Vq9YvZUWB2pSjBlakQLl54KF+Ph0DqoDB/GSVY=
From: Christian Lindig <christian.lindig@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>,
	Edwin Torok <edvin.torok@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>
Subject: Re: [PATCH v2 4/6] tools/oxenstored: Implement Domain.rebind_evtchn
Thread-Topic: [PATCH v2 4/6] tools/oxenstored: Implement Domain.rebind_evtchn
Thread-Index: AQHZBNyCM7ZphV/4jEuRLBRtweaKfa5Y5D8AgAAN2oCAABDJgA==
Date: Thu, 1 Dec 2022 13:10:38 +0000
Message-ID: <1ACBBE83-1A55-477A-BAF9-63B4C8A0D4D4@citrix.com>
References: <20221130165455.31125-1-andrew.cooper3@citrix.com>
 <20221130165455.31125-5-andrew.cooper3@citrix.com>
 <27ED9DA5-D63E-4F49-824A-74AD7149DA5C@citrix.com>
 <6c667e15-8a6c-753b-923d-fb5ea7839cc3@citrix.com>
In-Reply-To: <6c667e15-8a6c-753b-923d-fb5ea7839cc3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|DM6PR03MB4938:EE_
x-ms-office365-filtering-correlation-id: db89c026-046a-4332-37d5-08dad39d710e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 0NiuQb5OLZ4d+V80fr8mItr/qdMXdTJz/mdXLL5DNOhqcKfAEVJmF4jqd8Dq4jukbtnQ99XsejSd448voZ7zZLecql3MFHg0bjOZoPafi+12i0erF8uDjhdE01FWFY/tn8s7xBLQEB+jhFJssQ+NOTuK2AH3cbTmLAehCqA8TmAkfG4elPeIVJboIIsYqQtYODFGAI9HJV1n/oi73LjaKCu5e5T7PrrudPXjCCkz4pGtDgjrswHZg1lmXJCTaNghAsYUdgJEJZuvIKg8hg9sMHEA2iK/5FhXwETa2lGQGnSxyrvkNncEv9qtjOwCTk0rtpJx24a6mmCjn0N1n8IwxFVHHnb7pSzRgtkhiJGb4gkqw5sXseMuOqEt8Cr4OSwNQKd4IvKGvNnd3pusxkJKWJIyJQPGR0TaNO6TNEBSv+K3nPOpRZBgD7Ngjuo34SxQKO88h8uintxg+ALgkhMBXx/GdAOYjH/JCDIAxs1waXco6bNzouVmhsbJk47wX1by+klJYYmmRHOOscHtq6B/WUevZbLP49qxQV8plqSdjL1+tR38TM7jyMyPzxp33VpX8nuwTnkY7Q6bMff+iEWofxeb98NtzKYJAoiXYo48lKqUPJ6AuR4mYxVAl7TJDwCQ4a/GuWrMUxhIpty4SuOm/gOMCJEf5hK3tNgm8MwKzDuEFG6JPFAFugXa7LgAVT7oZ0w1yOagZyUa51imWHBFWunwoK33c5tTmHWID10o9r8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199015)(86362001)(36756003)(33656002)(2616005)(76116006)(91956017)(186003)(41300700001)(66946007)(66556008)(8676002)(66476007)(44832011)(4744005)(66446008)(64756008)(4326008)(5660300002)(71200400001)(107886003)(6506007)(316002)(6486002)(478600001)(6636002)(37006003)(6512007)(26005)(53546011)(38070700005)(54906003)(82960400001)(38100700002)(122000001)(6862004)(8936002)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dUxESlRuQlpNdERNblhDTmU2aTFZR3VrTXI5cE1YOFJpMWtaOWMxMi9Rc1NB?=
 =?utf-8?B?WEpQdnFaa0xQNS9QbXVqNE5URE1FbisyWldFM3pPeGtvQktFMnlHKy9nVHBm?=
 =?utf-8?B?S2E5RVJKVDNQY0twR0xETHVCWG9HUTZNcHpJUlJLc09kdkdlNnFhZnFlRXNW?=
 =?utf-8?B?cUQ4ckErZXhzeUtvMmJ6SHd5a0l3VFpaY2lwMDhzWTg0RmQ2WjVnY3BTeHpE?=
 =?utf-8?B?SktKRVZqcjFHVXZ6YU5RUzFZNnIyU0ZSeWN5U3VaN2pPeTQwbjk4MVU2T3RF?=
 =?utf-8?B?c1B6aEs1WC90M2J1bUhaOWt3VVViM1pGY3ZkQ3hNdExHdkFTZVptNDRLQnVU?=
 =?utf-8?B?QTlxSkQ1T0psUnk3UkpMRHVCUnpGeHoxbmJGeDZWR1YrMnZuVG1Wd2NvditW?=
 =?utf-8?B?b2VUREV2d2o4Q2hyWVV4MHBaUXQxL3JjT3lma3NuWUFpeGxuODZ4Q2graDFx?=
 =?utf-8?B?M2ZSaDBRL1dPT05jRUgrcWY2WUp1enNuWHR1NUl4NGFhTElJb2xndVF0TUpB?=
 =?utf-8?B?SXFqSThEenlONmVJZDhZSGY5MkVwODI2MitneElPeUVyYkpDWXNxaDJnRURD?=
 =?utf-8?B?anNXWEdURFB5MnRUc1ZvUFhrd0ViZktxZTBMZElxY0VwSXQ0N0lKU3llMm5y?=
 =?utf-8?B?M3AwYWxTaXZtdVJLb3UyTEJrQkw5dUhDWmRpQkZRQlpxZ1MxNFNmd1M3QmJO?=
 =?utf-8?B?aGQ2MTRLdktJWTY2cDlNdHlqbFZ0SVg0OTFYcXB1UWgra2R3Vk9qUnozd0Jo?=
 =?utf-8?B?YXNYOHByTzJDUDlZM2dsSi9sc3VuU29yOGIwbURMNitHbms1Nzl2MWUwTjh0?=
 =?utf-8?B?b3duNTN2V3Fic3RYaWsxZklaYm13SityS3c1YnF2QmJIRFFUSTF6bjR2U3pC?=
 =?utf-8?B?VzV6ZUFXVzdyUWNNS1JEQVpsUU03TFVQYzg2MmZ3ZklJVklOVXlGeUNnUHJW?=
 =?utf-8?B?SnRkemNHbG9FNXBjQ1FTbkttNE8wS0Nvczk5Rmp3bEM2Zk9EbFBLbDVIMkU3?=
 =?utf-8?B?clBYUTZDUkpFKzdXY1dRN3Z1a3ZKSkUzbUpLcUJvS29GTjl6K1dhNldVM0Nk?=
 =?utf-8?B?c2M0L1QvZ0IvUEVrWHdEZSt5Skt3bENJV0thMGZpUWhYQW8zLy9KeURNdlF0?=
 =?utf-8?B?aC9Tb0hWYnpGc253MnY4TW5kczNuY2ZOZjVmbkhyUG1UWSsrWkxuN0lpYS9M?=
 =?utf-8?B?aWdxNFpKaHoveDF5SjJabGxUK3ZsdlNVWEoyYUFHcDg1S0U0aG1zdEQwMnpE?=
 =?utf-8?B?MWNhL1NNNkI1a1VkSURoQ09jZ1dvNDhlMi9BKzE4elo4MEdnbFNxYVZzTUdQ?=
 =?utf-8?B?WXdyYk5udzdSS05mQVdSdkRGK3hQZU9hSHo5Z2NqV0QxbTEzd1JpampsYmRz?=
 =?utf-8?B?T29YTGJwUTNiOTNvQkRwR01LbC9EWE84K1ljWWdNaGc3RTR1SXIwTGFWQU5l?=
 =?utf-8?B?N1VUYUE4VTZzaExFdFlMc0xoZlJxY1hHN2FzcVhrdHF0V0RHZVo2K0Q5NWVK?=
 =?utf-8?B?dlRIclA3d3RHNHh1S1J0cTIrUGM2ZGZGVm9hUXIrb0UxcGIyZW04MlFqUFd1?=
 =?utf-8?B?OXZyRUJNdWh5V0JnditoOE51TXEzT2wxNmk4VVNFTEtzSFVOaG5CTCtLbXVu?=
 =?utf-8?B?RCtKcU1aKy9wSWJNYmZYM0RiN0xKOExlbFpYdnZQZE96V3lyVTdCUWtUV0Qr?=
 =?utf-8?B?azVsaDhPZllKOVJva1U0UUViaDN5ZlpGU3Z0V0plNm5rNjY4TDkxWFMyNUhw?=
 =?utf-8?B?UFpsSU16UXBRYTFQS0tFdk9NWDR6b0R6NFVwYUF3ZzM3dGRqQyt3VCtpc2Zu?=
 =?utf-8?B?cEhQeURzcVRaeTczcGdZUGxkT25KMXVsZTZqTnRNWW9OQXk0YkRDcW1aNVkz?=
 =?utf-8?B?c3V2VHloa1hRYTl2blNuTW1GUDZJTDlDRXh0cC9zcnhsYTF2RkxocjNhZEtp?=
 =?utf-8?B?MVhmL1pzMm5XeHdsL3ZDUDl2RXBZbHM5RXlKSEpuczREQ0RObmVGZ1JZeEx3?=
 =?utf-8?B?d0pycXFNZjJUS1N5dlVrRzRpejlLR1N5ZHRiTnRITCtOTDJmZFhCT1RtN21H?=
 =?utf-8?B?VWtTdjYraUZybVp5dnZvOFV6L3VrcWQvUURmeVovajZJQnM5SGNXUFlheEd1?=
 =?utf-8?B?WFUzSTgzeWhvT3NkandBTlhXaUZ3U3M3bnBSZE83MmdSRnByYTJLZkU5M290?=
 =?utf-8?Q?OuZKSjzrixLjfW2FfWYvHn0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC5621D8CEBFF6448A1FB8B5B2C9110B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6pXEw6U6IfBw/xczP5JPK2NfG+cDokH1TzJfCS+yE/Z8DcEuZ469/1PDGCLV4whhItQPQUH0Cxz8sxQuoSxLuSCBsGZZX3qXJAgYHidSqbARjsvJmfXB0xJtJw5OdD53jX7NrONahHUIPXdrLfjDNWKhrW2OtgdPzd6MuUpXA7yBMoubO78KAMMLYqwFYX9qG9RP5G8qAUndf5zaWXdWShsMyDYBPaneybZkIbsPhI8MnCeUJqgtayCVjAlTlnmdyZnvIbRaLns2at/qqlfuDTI3vm96SFm8477woNbio4rHs9pWRshO6JLwu8/tb5tSO4F+LWV79Nh86CL2xh4Ts9wrOBhd9tnQEMxkDkFGyQ1mJ+feTP74k4LrfJXLpGQJ6BMjXNPn4ef8RSLuJ6CRqcDFfBhv+V0Rb4E1dpu6fhfFfx4x3yVtfR1RFME/mzMs68pxBz1qSoGDqIkXeNtE5eU4KHG61gveSoMQpbyh9Ep+HpmpULOEOOcQ63x+uz9rlyAlZ39x77ORE5JccLst+Iej22Lr/jNQq1KiDPGmY03WOpIhQsDTwGuw1dZlJVekaeDL5p0f+nxx4R+/SKg5A+AcUQoo2ttNrT72bFlG0ZVdOiygUbR5sAfw8be2Au0ffyj38OtNQ5pFgwWyS5InGIP9nk0yDRXVHH2ohGROV9QjR5LUDqUkfeXwMdsnBxDFG4g0/AP8pYn+yGfnSsqwOawlOocRalmg2kUFU5d15uYKiO+KYbdCW19frXtpGETZHWtLexlEOxkPTSEprzVisnWEt8tvfFnqczqZ04XrQLTVEMCEhS2tr/FuVSAM2nhV
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db89c026-046a-4332-37d5-08dad39d710e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 13:10:38.6273
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G2JdhqDPyY6a0Lkp2b2TGhxT5hZntZO8narX+gge/Bx9JIPmgclPPKy8dK7XenNXqSD594x6WDHJ2GNrcYhGsA/ZX8Kqnk7BhG8agF7XWrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4938

DQoNCj4gT24gMSBEZWMgMjAyMiwgYXQgMTI6MTAsIEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gSSBjYW4ga2VlcCB0aGUgYmVpbmcvZW5kIGlm
IHlvdSdkIHByZWZlci4NCj4gDQo+IExvb2tpbmcgYXQgdGhlIGVuZCByZXN1bHQsIGl0IHdvdWxk
IGFjdHVhbGx5IHNocmluayB0aGUgcGF0Y2gsIHNvIGlzDQo+IHByb2JhYmx5IHdvcnRoIGRvaW5n
IGFueXdheSBmb3IgY2xhcml0eS4gIFRoZSBuZXQgcmVzdWx0IGlzOg0KDQpJIHRoaW5rIGtlZXBp
bmcgdGhlIGJlZ2luL2VuZCBpcyBhIGdvb2QgaWRlYSAtIGFzIGl0IGtlZXBzIHRoZSBwYXRjaCBz
bWFsbC4gSSB3YXMgbW9zdGx5IGFyZ3VpbmcgZm9yIGF1dG9tYXRlZCBmb3JtYXR0aW5nIGJlY2F1
c2UgaW4gT0NhbWwgdGhlIHVuZm9ydHVuYXRlIGRpZmZlcmVuY2UgaW4gd2hhdCBjb25zdGl0dXRl
cyB0aGUgcmVzdWx0aW5nIGV4cHJlc3Npb24gaW4gaWYgdnMuIG1hdGNoIGhhcyBsZWFkIHRvIHN1
YnRsZSBidWdzIGluIHRoZSBwYXN0Lg0KDQrigJQgQw==

