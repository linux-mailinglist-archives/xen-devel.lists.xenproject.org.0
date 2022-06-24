Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65525559A06
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 15:00:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355530.583249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4iuI-0007wU-5c; Fri, 24 Jun 2022 12:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355530.583249; Fri, 24 Jun 2022 12:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4iuI-0007u2-1X; Fri, 24 Jun 2022 12:59:30 +0000
Received: by outflank-mailman (input) for mailman id 355530;
 Fri, 24 Jun 2022 12:59:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jTea=W7=citrix.com=prvs=167c355c5=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1o4iuG-0007tw-CN
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 12:59:28 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78df4115-f3bd-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 14:59:26 +0200 (CEST)
Received: from mail-dm3nam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Jun 2022 08:59:22 -0400
Received: from CO1PR03MB5665.namprd03.prod.outlook.com (2603:10b6:303:94::6)
 by BN9PR03MB6139.namprd03.prod.outlook.com (2603:10b6:408:11c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Fri, 24 Jun
 2022 12:59:20 +0000
Received: from CO1PR03MB5665.namprd03.prod.outlook.com
 ([fe80::8037:ee0a:e1bd:bdab]) by CO1PR03MB5665.namprd03.prod.outlook.com
 ([fe80::8037:ee0a:e1bd:bdab%7]) with mapi id 15.20.5373.016; Fri, 24 Jun 2022
 12:59:20 +0000
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
X-Inumbo-ID: 78df4115-f3bd-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656075566;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=GSKfMV47IShb+SUOa5jB3SJwXpTB0MxlIT3uXIMo9JE=;
  b=IajUnMasrZ9Nhk50URmlFI98O7XEAmCExl2Dz6TaqDVyQCFUkMaUQMhD
   mt31mE7NrB510NrxoA+DYMhIqyhw9tG25K/wcVHct5yOwmc8k2oHq2nne
   arvAK+fb0PmEenLiMAkmi6DwkNLmPfzP33KjVPPIvvkzKjymXcl/kWcuI
   0=;
X-IronPort-RemoteIP: 104.47.56.45
X-IronPort-MID: 74366479
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RD8T/6AC1FcUbxVW/yXjw5YqxClBgxIJ4kV8jC+esDiIYAhSlGxQk
 DNbHCvTJK7JMVJBSKlzPd6z8E4A6sfTxoNmHAVsqnpgQ3kRoJPMCI3DcR6gM37Cd5WbRR1q4
 ZlBNIKbcZ5kHieBrR30P+G8oSUniP7VLlaQ5JYoHwgoLeMzYHtx2XqP4tIEv7OEoeRVIivUt
 935rsPVMQb1gTQpOTxJt/LZ80oy7Piq5GwUtQZlPKEXsAfSmUdOAcNEL8ldDZdZrqq4vAKeb
 7yepF1s1jqBp3/BMvv8zvCjNBdirof6ZWBisFIPM0SZqkUE93ZaPpoTbqJGMx8J0WnRxbid9
 f0W3XCOYVZxVkHzsLx1vylwS0mS6oUfpdcriVDm2SCi5xWun0nEmp2CP2lvVWEswc5lAHkmy
 BAtAGtlgiZvJQ6B6OnTpuFE3qzPJSRwVW8VkikIITrxVZ7KTX1fKkljCBAxMDoY36hz8fjii
 8UxUgtFbR39XTl0NnBUM64ukOKIvHivfGgNwL6VjfJfD2n76iVUiOKoHP+OP9uASINSg1qSo
 X/A8yLhGBYGOdeDyD2DtHWxmuvImiC9U4UXfFG63qcy3BvPmSpOVltKCDNXotHg4qK6c/1SL
 FYb92wCsK42/VSDRdjhRRyo5nWDu3bwXvIPT7Zktl3Sm8I45S7DD20JDT1KUecHm8woeWMbh
 0+gvffAUGkHXLq9DCj1Gq2vhTS2NCsOMX4ZZQcLSAIE55/op4RbpgLCSJNvHbC4ivXxGCrs2
 HaaoS4mnbIRgMUXkaKh8jjvhDahpYPASAIv0RnGRWKu7g5/Z4mNapSh7B7Q6vMoBJmdZkmMu
 j4Dgcf2xPoJFpuXkyuORs0CGbio47CONzi0qVxgBZ467By25mWuO4tX5VlWP1x1O8wJfTvoZ
 k77ug5L4pJXenywYsdfYZ+1Csks5bjtE5LiTP+8RuRJZp99ZQqW5hZEbESb333uuEU0mKR5M
 pCeGe6mAGwGE61hwHyzTv0EzL4w7ikkwCXYQpWT8vi8+b+XZXrQRbJeNlKLNro99Pnc/FiT9
 MtDPcyXzRkZSPf5fiTc7Y8UKxYNMGQ/Apf17cdQc4ZvPzZbJY3oMNeJqZtJRmCvt/49ejvgl
 p1lZnJl9Q==
IronPort-HdrOrdr: A9a23:40kXxaPSA/AxasBcT3f155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90dq7MAnhHP9OkMMs1NKZMDUO11HYS72KgbGC/9SkIVyHygc/79
 YsT0EdMqyXMbESt6+Tj2eF+pQbsaC6GcuT9IXjJgJWPGVXgtZbnmJE42igcnFedU1jP94UBZ
 Cc7s1Iq36LYnIMdPm2AXEDQqzqu8DLvIiOW29IOzcXrC21yR+44r/zFBaVmj0EVSlU/Lsk+W
 /Z1yTk+6SYte2hwBO07R6c030Woqqh9jJwPr3OtiEnEESvtu9uXvUlZ1S2hkF0nAho0idvrD
 CDmWZmAy050QKtQoj8m2qQ5+Cn6kdj15aq8y7nvVLz5cP+Xz40EMxHmMZQdQbY8VMpuJVm3L
 tMxH/xjesfMftR9B6NmOQgeisa4XZcm0BS59I7njhaS88TebVRpYsQ8AdcF4oBBjvz7MQiHP
 N1BM/R6f5KeRfCBkqp9VVH0ZipRDA+Dx2GSk8Ntoic1CVXhmlwyw8dyNYElnkN+ZohQ91P5v
 jCMK5viLZSJ/VmJZ5VFaMEW4+6G2bNSRXDPCabJknmDrgOPzbXp5v+8NwOlZWXkVwzve4Pcb
 j6ISNlXDQJCjPT4OW1re522wGIRnmhVjLwzcwb74Rlu9THNcjWDRE=
X-IronPort-AV: E=Sophos;i="5.92,218,1650945600"; 
   d="asc'?scan'208";a="74366479"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7Ur9EXhOT7Cswdzc4Wps14M5L+crcYuGP1EpQvqLgzyC71GSHFw+VtEDSXhDT6lOS/rav2mMsGJDyNGEJsaUskQY8k5I+Xzkfy49LRK0F9gY6zV/fq7Rs/CIUEf6lnTjcbao/Gq78eM3SALVKrhYDhK8TVbwlFhOVkFfv6Vr+c6ju4zuzudonUwqdUollSF6q95P3OE+SGhm7RvPTuhReD5HUG73PNy9vy3hCVuxLdIvphjIkhEdXa1QG71lfy3HLwBgcPWP2jNFhrqNSuVvlL0NPDUYGhWf6akevuY76KSZ1oZT/CWbkFtZhapn8xza8H5Vea9/VQa8wMCNcVwpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0AWtsG9RwUMTRUD7CMXKMKlZ3tKtKdSaKiyeVLgKXc=;
 b=X3WBCAX2QUByDEfZEBt1Jf6CcXGkaXhL5a2uKitDkKE0pppTxLQLQL5pnNzsJKphWdP9qVaeBSR5xGubyp4Fcy9xxXKr8+JWUpJt2O9ZirbihAmZibaAaptBwI+QLm1yqNP6rtCP5QkH8O/SuvoVSU6145Nc9UOtfbVPJGxJv1fIfwzTDEwUh4WLiOxNqXJMg6KwQI+4/ZC8zSqGMdflZf3qvnZEAqXyPqj5HnV5ewc5m1G4U80IlFfnWU+pbNHhxanfZT4WSf5EkAPDBZw1wJS4n2ur8oWpntw6fzI2VI9ft/wgZHgPmW3fN5mQ+1fnkeiO/h2X5odQL4iOq/cyzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0AWtsG9RwUMTRUD7CMXKMKlZ3tKtKdSaKiyeVLgKXc=;
 b=YO8jG1hRJalVxq1K4MbxCqHKb2SXa0C00LPPrmduHeU8hWU2BKjxqFOZw+rI7nUHemdm3dqEJNkTnOSdn+aSJR5rpiswJxEtvi50lGTgCz/eL5txLiMSa7quQc3i3LbtlSJ/JATtmVNeBMeCtNPXSqqdb6TErnCwI6k9ILsvpe0=
From: George Dunlap <George.Dunlap@citrix.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, Juergen
 Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH V10 1/3] libxl: Add support for Virtio disk configuration
Thread-Topic: [PATCH V10 1/3] libxl: Add support for Virtio disk configuration
Thread-Index:
 AQHYf1BHHIj+DWvN90eGeepJ4klT4a1QiHQAgAAkCwCAAwIpgIAAEjOAgAALK4CACsnDgA==
Date: Fri, 24 Jun 2022 12:59:20 +0000
Message-ID: <9A36692A-8095-4C76-A69B-FBAB221A365C@citrix.com>
References: <62903b8e-6c20-600e-8283-5a3e3b853a18@gmail.com>
 <1655482471-16850-1-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1655482471-16850-1-git-send-email-olekstysh@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 050a2da6-2e56-495f-9d15-08da55e15ac9
x-ms-traffictypediagnostic: BN9PR03MB6139:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 mA2mr7jr2p2L5fMET0sMAQbhhu+EdkEciYY/CeRF4FC9TQBSe2jnwtCYMIeVZ0Ot/bGH2DMVuQY45sEbA2nYFF+LkoHFOO8S8ajAnV5KoaFqBd/B7wNZKmPLZrIlszLTbXlLRctd0Vq7+Wfc7xNTS1aZ9ft4OMvCwpYMqHfiVZ1/WLOuhEfB+NSWiLva/9X5UZkyHNZxSLzKcutkXz464m0CgBsZ3cBlVLeTo6SxT6RoT7huMNL3MfqJNmNr5RNTxndi1DbGXTxUv0AqG6y/clsI/xCHzYKMsel7m7H5b8PoySiMs4QB82ImOTESDyAKeSC+BO/OKzs2ZQUuGQgLFaj+QIYg3/g/f+7zQsMkp7zYZPvFUxRybu4z16OwXHkvHTXnxWT9+Z1GN+2kdngs35VPxAclD+2wCYVg8cVous83rRxJSxsR0uLeR6TfP8sGPzrBPWp73gx2as12dOCFgHxyFlth9pE1W2AngD9V4Hdx4l6arPOYIMr/+9QzacWKi1hrXW1Pb1TbnH++YLTzdlbJrdMyiG2onUBk+Va/EWTruw1pcPorT5z8cmWXdiGlZOIPW9DEUJXHgi0xWAPKD5syt0enyquhSf+b0psRjMgeXn27dNj2LTjH+FIfaitI6c2h5tDr/MclKUJ7jAtIj/kRmNN5tCqhkjtHS5y+nOzwtFhp1YPgmdbZiT9Ac22WPNB7rG36DHrNS7qP7TkfUdbKhyUZRr7L/EaljKvtwYYw8uXWQTuyCZ8qGOG4fuJ6w0kmaoz/PgZEn+3iL2kuC4KIabVbpcoljx/B/+wbF0m2SDfrC10bqWOkCVg6JskgH5Cca9UAN+K1GO7Lyw6M+A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB5665.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(66446008)(64756008)(66946007)(66556008)(4326008)(71200400001)(99936003)(66476007)(76116006)(6916009)(8676002)(2616005)(33656002)(54906003)(91956017)(86362001)(82960400001)(5660300002)(38070700005)(122000001)(7416002)(186003)(8936002)(83380400001)(38100700002)(53546011)(6506007)(6512007)(41300700001)(26005)(316002)(6486002)(36756003)(478600001)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z1YrZVY1TjRRZll5NkhCWGNGcEFxckpvenVjR1pGazV5aS8yNFp3VHp5VGUv?=
 =?utf-8?B?eFEycENrY3MvOS8xc0pIWTR2Z0hNZGVCNm5GRXoyUmJWakNLLzI3eWQ5TXJl?=
 =?utf-8?B?cWxVU1NXQnFISVdiaHpab3QrMmZSUXRqMmNHeHhqZkxpaTJ1dm1rMjVma0tv?=
 =?utf-8?B?SW9selhmNDlEUnZuTTVkRlcxUy9FTmNxcmtLcS9XOUcybXhxZE1RaWk4S2VK?=
 =?utf-8?B?bGNUKzVScUV0SVFFd0FmenVnbEg0RDlLdFc2ZFRqWVp6T00vV09GQS9TNXZC?=
 =?utf-8?B?VWJFei9JNll0TlI3bnJqL0RuLzg3U1RmZHFaaVpXVW9uTlo4Um9LZjJFUCs3?=
 =?utf-8?B?bHVvcExhRFdYMUFyQjd5cFhIMVZUd0FxY1lSQWRCZ1ZVbXUvVnA3QlpzLzBU?=
 =?utf-8?B?dUNKNWtJUWFtUktqU0R0UGRzRFlQVGdSbmtJcDlzZzJHSTdwelpyWVE5MnJX?=
 =?utf-8?B?U29JYWNZWlcrYkZiOWVrN083cSsrTUxMdmllYzNnYlpzcmtDSzlzM1Q5dVY5?=
 =?utf-8?B?ekR2V2NpNEJnYlNqbGY4ZnRwaVRVRmZOb2d3RmNtT05lOVBxNFRPN2JHQmVz?=
 =?utf-8?B?S09yZmhEWjFLYWhVOXNCVkk2UnBDMGJFaldSeWs2OVpsQ09kcmlCdHJWc3dQ?=
 =?utf-8?B?VlZJSm5UZDJrczFGKzR6RndjNjRHVURnZlFKb3Uvb1Y4OUZrVnZTcmRIRGdk?=
 =?utf-8?B?TThLZDRFOSs1ODd3K2ZMdmhFSTVPekoxYXROcjhhdlBDc0NPQTBvWTV4YXZG?=
 =?utf-8?B?elZ6TklabVBlbjZxSE9XZmNHYzJDc2ZUaWZaS09RYmx0MlZlNHNFcmxFTEdH?=
 =?utf-8?B?TTRYLzUwNml3MUR0cVRORjBoSlowMjg4VEFBOVlwSzFTOGZXLzZsZWs3R0wx?=
 =?utf-8?B?aDFyM0ZHaDR4aDlwWElXYlljQVdLbGhZVS9iL01IQUNkSnJldWN2bU45WHVu?=
 =?utf-8?B?WitINm1oYzJFUU5CZlF2ZlIxQ2M5SGJ2V3RhVXlYN0ZZakV4ajJialpGd3k0?=
 =?utf-8?B?Z2ZKZ0RuNUcwbnQvSkU1aFU5cjhpV0dDUVorSlZBa3NuMU9zTzlReGdyUHh5?=
 =?utf-8?B?R25LSk1ZS1Q0cHpZeEFwNThZWVpsVnVLZVRzdmNRVExDT081NCtpYjRjYVV6?=
 =?utf-8?B?aGNFVUNoazhtSEdLY2VIRCt0TnJIV05Benp5bUsyR3U3TW1sQk8vWkZlTXA1?=
 =?utf-8?B?NmtRUzIzTy9vU0VMVXhnd3F6QytsNEVCY3FQTElMeWFzNVJjeTVjcHRVOThO?=
 =?utf-8?B?S29oalVBaTUxSVFxSTdNYWh6eDVQaTFHOTBSc2F4bkhNS1VlZmltcHFhblBl?=
 =?utf-8?B?Qm1pTFdMUnhvdjI2Q2d5V2tjZWNsMHkzZFdNWnZ2QWZsYkQzRzZRbEdCMDZR?=
 =?utf-8?B?enVOdFhub2YyZUpvb05UY0FkMDdJbGRSa1B5RXBzeDVlaEZZVk1TK0V5S2tn?=
 =?utf-8?B?SHk4UlZMKzNIMERmenVjcXg5TnZIQjZkYzRFeFVsT3NUTld2R2c4SXNwVmxh?=
 =?utf-8?B?cml1M0lxN1dudExaNmV0NFVVdXFCcHNlQlFheVFLTFF5b3ZJbEhaR2FIUjNt?=
 =?utf-8?B?NjZXMytmQUd6VnBvV3lkYkdVUVFBT2kwTWxyMUZ1ZmIxZW9lc25nd2tUV3pY?=
 =?utf-8?B?WGw3bUFuZGpIRHJXcWFsVXNlZ2hSL1Z6KzlYRmU1VGltOEswNXU1cktKZm96?=
 =?utf-8?B?UzNDVHVrTE16QkFhRjhERmdmVUU3TVV4cGY1eEVnTlJiZnFxM0d5SHhZbWk4?=
 =?utf-8?B?UHVsUDU2ekdHcGxrUmxpSVdtMXJ1T1NMK3EwMnNOS2tjU1FtK2RkUTR1Vndn?=
 =?utf-8?B?MEtYdGNZMVR1K1oyMFc0akJRZWR4WjJGQ2NWcmxCeDlFMnY1djdlL2gxdmk0?=
 =?utf-8?B?Qk5veE1jNlRuc0ZuMEYwNFU1enFTMGo0YVl2ZHJkcERhQ2cveVRaazNJT3J0?=
 =?utf-8?B?WGlCRGJiUmxmc1JKVzcraHlRaUxrZ3VLdFdtVlp2Tk40WnpUMi9hZFk0WGc2?=
 =?utf-8?B?ZjZNbkx4RHo4TUJ5ZlNoR3dERVlaMUxuZEZXWSt1VmZuejliWlhNSzA5K1BR?=
 =?utf-8?B?dmxZMHVkS01uNUZUTmNJd250SDRXbXIvTUZXWGtiQ0lSSFBjcnBLbDJPMEcz?=
 =?utf-8?B?Nk5JUUJRaDRBUGdkbHprSEV5dHVuVi9VSVlaRXBtVjNNRkc4M0dQckxyY0JR?=
 =?utf-8?B?Rnc9PQ==?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_03AD81FD-8F39-4C72-AF6F-0D4E6C34C573";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB5665.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 050a2da6-2e56-495f-9d15-08da55e15ac9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 12:59:20.5354
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eHcZHUkF9GSSjSsRhHbATyyWbxv69+XcslHQcR7B2tleu0qQj1/di/zpiVVyOFsJFynw8aZimE89RzsRQLVUiNITIPFmxuqgzt2rDF7wKEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6139

--Apple-Mail=_03AD81FD-8F39-4C72-AF6F-0D4E6C34C573
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 17 Jun 2022, at 17:14, Oleksandr Tyshchenko <olekstysh@gmail.com> =
wrote:
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> This patch adds basic support for configuring and assisting =
virtio-mmio
> based virtio-disk backend (emulator) which is intended to run out of
> Qemu and could be run in any domain.
> Although the Virtio block device is quite different from traditional
> Xen PV block device (vbd) from the toolstack's point of view:
> - as the frontend is virtio-blk which is not a Xenbus driver, nothing
>   written to Xenstore are fetched by the frontend currently ("vdev"
>   is not passed to the frontend). But this might need to be revised
>   in future, so frontend data might be written to Xenstore in order to
>   support hotplugging virtio devices or passing the backend domain id
>   on arch where the device-tree is not available.
> - the ring-ref/event-channel are not used for the backend<->frontend
>   communication, the proposed IPC for Virtio is IOREQ/DM
> it is still a "block device" and ought to be integrated in existing
> "disk" handling. So, re-use (and adapt) "disk" parsing/configuration
> logic to deal with Virtio devices as well.
>=20
> For the immediate purpose and an ability to extend that support for
> other use-cases in future (Qemu, virtio-pci, etc) perform the =
following
> actions:
> - Add new disk backend type (LIBXL_DISK_BACKEND_OTHER) and reflect
>  that in the configuration
> - Introduce new disk "specification" and "transport" fields to struct
>  libxl_device_disk. Both are written to the Xenstore. The transport
>  field is only used for the specification "virtio" and it assumes
>  only "mmio" value for now.
> - Introduce new "specification" option with "xen" communication
>  protocol being default value.
> - Add new device kind (LIBXL__DEVICE_KIND_VIRTIO_DISK) as current
>  one (LIBXL__DEVICE_KIND_VBD) doesn't fit into Virtio disk model
>=20
> An example of domain configuration for Virtio disk:
> disk =3D [ 'phy:/dev/mmcblk0p3, xvda1, backendtype=3Dother, =
specification=3Dvirtio']
>=20
> Nothing has changed for default Xen disk configuration.
>=20
> Please note, this patch is not enough for virtio-disk to work
> on Xen (Arm), as for every Virtio device (including disk) we need
> to allocate Virtio MMIO params (IRQ and memory region) and pass
> them to the backend, also update Guest device-tree. The subsequent
> patch will add these missing bits. For the current patch,
> the default "irq" and "base" are just written to the Xenstore.
> This is not an ideal splitting, but this way we avoid breaking
> the bisectability.
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

OK, I am *really* sorry for coming in here at the last minute and =
quibbling about things. But this introduces a public interface which =
looks really wrong to me.  I=E2=80=99ve replied to the mail from =
December where Juergen proposed the =E2=80=9COther=E2=80=9D protocol.

Hopefully this will be a simple matter of finding a better name than =
=E2=80=9Cother=E2=80=9D.  (Or you guys convincing me that =E2=80=9Cother=E2=
=80=9D is really the best name for this value; or even Anthony asserting =
his right as a maintainer to overrule my objection if he thinks I=E2=80=99=
m out of line.)

FWIW the Golang changes look fine.

 -George


--Apple-Mail=_03AD81FD-8F39-4C72-AF6F-0D4E6C34C573
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmK1tSMACgkQshXHp8eE
G+0AGwf/TC7l31NYPRzoKxPXeL6BRTK+QSkt2pfz6UO5YGYmw0XQvywNWU2iDnNE
HMvRRIiKrmWA7OF0Z07pB8vO35rXtx7hFTfkaRYBnXwyOyC1tvd53EZhr3Qb/r6k
7Ra1yQfjH3peBbijw4nwN12lJxvVGTvyCPMDwK+3iAVk/qof4PpX1z/cVhTFY6hK
CZaa3Qfe4ME/g9v3Ba6h9bf2D6FEWrE/2DCEqdWvK8MQokd5rz+hLA35iXWfLlQf
C63uwPZ8h9eaML/KStZWHlqZTODq26SoGuVHhaCMoUvNx5klsnG7zFi98QYNBKyS
UcQOFgjh3yP4a9uSeYP/oySK9rTt6w==
=EtXf
-----END PGP SIGNATURE-----

--Apple-Mail=_03AD81FD-8F39-4C72-AF6F-0D4E6C34C573--

