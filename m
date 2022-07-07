Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7196156A690
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 17:04:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363023.593348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9T3W-0008SP-Nn; Thu, 07 Jul 2022 15:04:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363023.593348; Thu, 07 Jul 2022 15:04:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9T3W-0008QF-KA; Thu, 07 Jul 2022 15:04:38 +0000
Received: by outflank-mailman (input) for mailman id 363023;
 Thu, 07 Jul 2022 15:04:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q25n=XM=citrix.com=prvs=18057f629=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1o9T3V-0008Po-61
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 15:04:37 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c1b18a5-fe06-11ec-924f-1f966e50362f;
 Thu, 07 Jul 2022 17:04:35 +0200 (CEST)
Received: from mail-dm3nam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jul 2022 11:04:32 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by BN9PR03MB5996.namprd03.prod.outlook.com (2603:10b6:408:135::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 7 Jul
 2022 15:04:29 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::b4c7:a1fc:f10d:8b9d]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::b4c7:a1fc:f10d:8b9d%3]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 15:04:29 +0000
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
X-Inumbo-ID: 1c1b18a5-fe06-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657206275;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=jUsgCGSQLuXFvk4rrV+lirV8ytq8DE33EI+U8NZ35xo=;
  b=SV1u3g823+9VWh4xUNJdkTJGpx2eql28hynioAjW+Q2ywohPBSzyKePP
   YYWAJzmUKDPdW2RKyGtz6dGKeiRSLykQk4TWzUCeVeiKEtevKDH8UU5Dz
   5I33FZ/FX0vhtQCqHuTIQHmXzJ7aBlBfrb64aMeXH8DdB6+YCUlXC8Jkk
   I=;
X-IronPort-RemoteIP: 104.47.56.41
X-IronPort-MID: 75292900
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FVj5w6I62/MJ/JiOFE+RnpUlxSXFcZb7ZxGr2PjLsTEM7AuW5UVEl
 zVBCC3DeKqUMyGmS21FGN638k8AusDdydVmHgVq+Sw2Fi5G85XPXYXHcxz+NXPIdZLIF0k4t
 poUYdSRfJ49QC+C/EagPuexoSBxj/nUF7OU5IIoQsxUbVYMpHAJ1UIz8wJAvrNVvDSZP++sk
 Y6q8sGPaAT6hDV/bGtItvPZ9Ulj46yj5DoT4wxhOqkU7QPSz3UbMskSdPq7R5farii4PQIYq
 8LrluzRErbxpk91Yj+duu+nNBVMGNY+BCDW4pZsc/HKbiNq+2pjiM7XCNJGMR0N02rRwIgro
 DlwncfYpTkBb/WkdNs1C3G0IwkmVUGR0OaaSZQXmZX7I3zuKxMA8d03ZK0FFdRwFtJMKXNP7
 ZQlxAUlNXhvsQ4ULIWTEYGAjux7RCXi0Rh2VntIlVk1Bt5+KXzPrjmjCXa1E17ci+gXdcsya
 fb1ZhJkRiX5RhseNm4rAY01keOv3FemaixH/Qf9SaofuwA/zSRX+Z21ap/5X4fPQs9Y2EGFu
 mjB4mL1RAkAM8CSwiaE9XTqgfLTmST8W8QZE7jQGvxC2QXPgDBMTkBIEwfiyRW6ohfWt9Z3B
 EET4CUj64Qv8kiiVvH2XgGioW7CtRkZMzZVO7JnslDXm/KMi+qfLnYrRBprK/oMjekNRWd26
 VrKgIzYAgU65dV5TlrYrN94twiaKSUTaGMPeyIAZQ8E+MX45pE+iArVSdRuG7Lzicf6cRnvx
 xiaoS54gK8c5eYJ2L+85kvvmC+3q97CSQtdzgfdU3+h7wh5TJW4fIHu4l/ehd5CMYKYQ1+pr
 HUC3c+E44gmFoqRnSaAROEMGrCB5PufNjDYx1l1EPEJ+z2z9la5cItX4TU4I11mWu46fjvub
 F7WqBlmzpZZN3u3bod6e4u0Tc8tyMDd+c/NU/nVap9CZ8N3fQrfpiV2PxbMhibqjVQmlrw5N
 dGDa8GwAH0GCKNhij2rW+Ma1rxtzSc7rY/Oea3GI92c+eL2TBaopX0tazNisshRAHu4nTjo
IronPort-HdrOrdr: A9a23:I31zy61hlb7HOcUSxVAmAAqjBLAkLtp133Aq2lEZdPSdGvbo8P
 xG+85rsSMc6QxhPU3I9urqBEDtexnhHL9OgbX5Xo3CYOCFggWVxehZhOPfKlvbdBEWndQx6U
 4PScRD4aXLfDpHZL3BkWqFL+o=
X-IronPort-AV: E=Sophos;i="5.92,253,1650945600"; 
   d="asc'?scan'208,217";a="75292900"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TooWe6PZfWpB7VYMeftQtIdCmhOwhsIDqnghgafDnS8KNY4fZFzgVIwIPk2ZstU7W6uumKZlZKNxKTPK+ZtaTqpbI8KLylFatTQonyI0mXzKK30O29WeYKNSwWVQTypFQd3iyTDK3aZU7FF8eLGtQWQj5hyUyTMx6wBqk65HRrNlCI/tUlbOW2Cx6DX0aAK2pV23urHpwxbNDC5K1qaQE/+QKvjR6mgqShwmyAZ9v4366yrtZCrvEj0lBaNEC/Ea4TIU7tHf7IRysOC8N9opQHYdfpD9rnKVF9ijTk/oaSp0QmFt2uArrNW/0eD0uB6kMMpNgsW1oZKrN12gkuS8Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpzsmyGCfuLEOqB+1/PeJIU7gP6YhSpxhE8g7RsWB/I=;
 b=BI329931FSImV/cxx1ZJe+77qq10LwsAVmIQvo22qm5NN1S5ldDi3Q7HPvDyvbUrmItDewlf9C9s28EQ9sRdwgRp3Uordh9W/vqtjMzULi+M3VUUQf60YoiRyN5v5XQRW4AJVSmJ5IrT1Z3vij4UPCTpzEvdnKe1/QVM7YDq9eKHdW1feHb45JAyl0oCti/ioeanZXkBJbKIijXV0mn95w5gTbvXSYekKc5F56nzCLtUaRccK8BdXNk0zmiGq6kEz81g5FGUfmn5jAuqIDduFXcdznWTzGUNFaYfke2pjTxk2kzEenJzZFklaherewHKx0kcyufWUlfwCF56rnN7vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpzsmyGCfuLEOqB+1/PeJIU7gP6YhSpxhE8g7RsWB/I=;
 b=AFtgaSZBRBf3oLZFy43YpY2hTd+9cl72cOMTyvhEudP1Wy1hhIb6N1OefNJzdzS53hsAMFA4XvE3UwE1OxMLvg/sskkICHtApLkkROZ8rAsSueKYBJiR0H2xsT0+fOU4mpSBxVNsc6mrTRX3wSO9Keyz5q/hJFmZO/SrgqzndUA=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jane Malalane <Jane.Malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony
 Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Roger Pau
 Monne <roger.pau@citrix.com>
Subject: Re: [PATCH v10 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Topic: [PATCH v10 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Index: AQHYTyjMyYwCRaSEX02AKbyBHUjKJq1zh2MA
Date: Thu, 7 Jul 2022 15:04:29 +0000
Message-ID: <93BBE1BA-35F6-4218-922D-863ED4D69AA0@citrix.com>
References: <20220413112111.30675-1-jane.malalane@citrix.com>
 <20220413112111.30675-3-jane.malalane@citrix.com>
In-Reply-To: <20220413112111.30675-3-jane.malalane@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1861aafe-8335-42d2-ca94-08da6029fdcf
x-ms-traffictypediagnostic: BN9PR03MB5996:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 xtd2R2/NWzE7jsTlAkJ8RWvwpYoK4TkBUXRV5GcbXqTWtONQ1PxXdNQKtWhPzkhLAZJjHc0uYHOX3sKcy6A3V9+zLDI0zfyMrP2wlrG7aKWil3Zazx68jsZh/49Y47IuUo5Bn/g8hZBVktfkwAU4HnECaAjLzJQMEGaJZr5+YJaMb8TLfDq5LJ6Hevm0cZ8MqvoX4IDIEo0TNn9G/0nx+gyuXSA0NpvJoZF4YiUmWDSqPPOkCtSDIWyPB5eQxaJugzwzdSCdoC1gCe1G0uq3l8zJy/t15pu9Flf7U0s7Su9GxcjQ7TndaUNVOeueW5RtIW1EfyX0tCDEaI4BrB+ZC7KG/gKAFSTM9gVOIlrKP1mgMthRwLyg7RQ2m9ik+6UcatUICNUJ6tzCNF72YUbhwavq5pjfWKzdRgw/kdwm7pMBkQICJwKrCaJo3tqT1czNVSXFLcCpvQcx9/5kP2LB7yZmvF3Gh8mJFB4DxEPkm6wwzOxFw479mayGZxcc4GDftUYe4xbvA6WmYMcIc7WvpjZJGLOcTQX6pTsGtM8J1cjZFkw+bEdR5qdFWkaDHCmc4s94qAPtAAcj1EuJN3inAwvsiasvvJg+79pEEXX7M7FGQk0mjUgn/CNPktQZZG0icQOTB+Ywt+JRhy+7v3DlNEXgQDNmiqGNBLRqfLKjOdEMIPjJzD5zAeY5nWvl0E2eetZZ2jubhsSFyTMrMSAFH71t33GpF6qGMAq94OowsHHVP338oknZB5/p+XaEvKh4GFxMOJRY6bBoWaW92ZXvdwD9+RIO44unfovhrMHT11rnBEoi7L9RyB9y36WLikBn34j/zn6GptlQMX7N/cXu3VBSPB9qIfNf8nW4KXBHHgA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(107886003)(186003)(2616005)(38070700005)(316002)(36756003)(91956017)(71200400001)(76116006)(8676002)(4326008)(83380400001)(38100700002)(6636002)(37006003)(54906003)(64756008)(66946007)(66556008)(66476007)(66446008)(478600001)(6862004)(86362001)(53546011)(8936002)(6506007)(5660300002)(6512007)(33656002)(6486002)(122000001)(82960400001)(26005)(2906002)(99936003)(41300700001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NTNBZjRqVCtNS2ZjWWZ6UUpxODhrMEpkT3hZSWR5SUNNdXlEZ0hGQ20xYm4z?=
 =?utf-8?B?OGRGTGFYdVp3Tldla2NpT1g5UVU1ZllQUFUvaExybC9EcHd1WGRNVFpYdzZr?=
 =?utf-8?B?TUYwcmdGaUo2V0RzOC9oZm40TUJWMjJTVFpBMXZGSngyaFBhcGtNZUQzWXMx?=
 =?utf-8?B?L1JHcHRyUXZkRE5VczBtbHB3OVNnY1FqdWlQWlNIQ3BWTEVuQnlnYkVsRzFL?=
 =?utf-8?B?M0EzUDBWeU41dzdRbmEzMUlMTTVZQ2d4RmI2cmtOeGhHSEhnbHBIVDRCalJV?=
 =?utf-8?B?eHIyeis5dXFHU01ORzRiMjdyMFBremFPMUdKSllaK25oR3UvZk82MVdCKzF5?=
 =?utf-8?B?QkZycTd4azY3VWRhb0l0UENyWnF3TXJGTVdJUExiMFhRVUN5S1k2WlU3eVda?=
 =?utf-8?B?WWV3YU5WUzQzY3Vmb29QdTl5UjQ3NkpMZHY4NjFlTlNUaGRjTUwzbDRpVnpI?=
 =?utf-8?B?UUtqZGRGSG5aQ2dkUFZ5WVlnRCt0WnQvOEZ1OG9mNk9CQk1tSjQySDdHNmZx?=
 =?utf-8?B?Z29UbDZBbmREVldXcWRHVmF4c2duaFJPU0VNLzBrOGZBR3hsbHVXL3U4WU1X?=
 =?utf-8?B?cHFCbkFvRVNJQjFyWlpTbWJCQTVFQXZLYUJPVENaRVhaZTRKM3Z5Q0JzNGNK?=
 =?utf-8?B?TDJtSzRQZXlrVlBnR1M0bjIzeTB1WktXdy9tb252KzRya2d4RTNMWGlhc0hm?=
 =?utf-8?B?UFhGUnhQVmxrR2NJWUJYenpFQ2hNNTZqcE03N0Y3QllJQTFTUERGS2RIWENM?=
 =?utf-8?B?VUhONllHU0VsM0taa3dGNDMyTlJzV0FYdHpYZHJrM3lwUjh6YTRhaUNTU1Rp?=
 =?utf-8?B?ek5IMFhlQk81UHFJTVc3Y0dGdVk1NVBiTGVjVjc1UzRYa2RkTXN5ZjJsR1dv?=
 =?utf-8?B?aUJONHp5bU42dkRuRXlQZ0ZJbHJTZmx1ZjFkZTlPcldJUVFLa0NzSDhoRHdE?=
 =?utf-8?B?RzQvYkpwSWNibjNvNzdOMVdLL3lCdms2UFJETndRTmRZc2tkNVBFSkpxVGRu?=
 =?utf-8?B?T3c1L0EyWGVzSHFiTVVnOHhvOUpKWU5JbTJUWE4wRTJRRERLTXRBMzFYQ3p3?=
 =?utf-8?B?RXUxcUxFMWtsSW5ucElHVU1kQ2wyMlB4S1l6RksvQWZOTVhxL3dMdzJXV3Vw?=
 =?utf-8?B?eVBTWVc5THJlSlQxSlZ5V21WaFZ6Y1hUeUNNQlpWMkIyVTRVQmJ6bVB5RFln?=
 =?utf-8?B?ZUcwMEFienhHTjZsbkVBV1N2UTRWVkdBZnBscUxjQmsxRnRCbzZsRnVzakRa?=
 =?utf-8?B?dzQrV0djSW5LbXU3WWp1eStaSEVKSlVDU0tRWndMWXBpbjlpRzhLQjh5dlpC?=
 =?utf-8?B?aUpvNjdXZ2drMXhCRW4yZUlpOFBKMUNhYkFFV2MrTHU0NE8rbEZRdXNBMFJO?=
 =?utf-8?B?ZGJBaDNhNzg2ajBzU3cyblpiSjdMWlJxK04vUnJsN3FNR2xPYTFVWUVZeisx?=
 =?utf-8?B?dWNvMFI0a1NPTjZIQndSWVJaeFNma0xZcDVJSllYL1hQdmVqaG91QTE2U1lB?=
 =?utf-8?B?R3VsTkJLb0JUeUFiV0E0dzRJTzFGeFBvR2wxSnZ3WXpBVjF2SkhmbXFaKzVP?=
 =?utf-8?B?K2U4TjFQcW85dlJuaGhXYjF0QnhVVjBaZlJlUFYxS2tDNzg3ZW5JTy9ST3dS?=
 =?utf-8?B?UDRHemYxN1E0ckVVSTVmNjhiYnB5QXU1TG93OTlZa2dQR0tCYTcramNiT2Z1?=
 =?utf-8?B?VTJNMTJpalpJMHpuci9yVkR0L0xvUVNKWm05Tk42MkRMNkNiV2pqTzNZenF4?=
 =?utf-8?B?ZVBDTHcxcnhxQThHYUYraUxEcmoweXJ4RVE3MDFNOHF6cCs0YUJrcGhKZXRV?=
 =?utf-8?B?aXQ4VUZaUjVHMG9vWitpMzhSUFdscHNtcVlML0lTNzdmZHRMV2xvMmdxQVhQ?=
 =?utf-8?B?eVE3QzVXdlhvSGtZRmlQMTU2Y2tNci9YWVc2bjRqZk1rS1ROTjVnVm1Gelh5?=
 =?utf-8?B?QmF4MU9pNGhPOXJjWVNEN0NSZU9McS81d25JV2ZlQjhHUlljd3FySUR1V2Jm?=
 =?utf-8?B?VjYzdjViRFVucTZZUDRKWFZhUXNNTTI4UENiRXRudzVjaFRhMFo4SlFvYVFC?=
 =?utf-8?B?MVRkdWdEbEZxeFVBa0hxaVdIVW5nM2hldDc4aTgzNWE5dmNMT3hpMHI4SDhY?=
 =?utf-8?B?WGFJWnpBYWRPYzdVREJ5b2lpTmhJMEg3RXhLTkJEc1U4VmtOR3IxUWkyWXJn?=
 =?utf-8?B?dGc9PQ==?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_42BFAA6B-3502-4303-A56B-BC40751AC0BC";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1861aafe-8335-42d2-ca94-08da6029fdcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 15:04:29.4056
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ixp+ArNskTyvWs7lObnEsC9aJ9wU6gcNZkzyN9i4a2baw47drsu7WXtz9k1cQZC5CIv89VSutnV5lgBcDLXUFRHuWpqPb/hmouLevvbyaII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5996

--Apple-Mail=_42BFAA6B-3502-4303-A56B-BC40751AC0BC
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_6C193DFC-0E85-4211-A0C2-B3E798EB6AD3"


--Apple-Mail=_6C193DFC-0E85-4211-A0C2-B3E798EB6AD3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 13 Apr 2022, at 12:21, Jane Malalane <Jane.Malalane@citrix.com> =
wrote:
>=20
> Introduce a new per-domain creation x86 specific flag to
> select whether hardware assisted virtualization should be used for
> x{2}APIC.
>=20
> A per-domain option is added to xl in order to select the usage of
> x{2}APIC hardware assisted virtualization, as well as a global
> configuration option.
>=20
> Having all APIC interaction exit to Xen for emulation is slow and can
> induce much overhead. Hardware can speed up x{2}APIC by decoding the
> APIC access and providing a VM exit with a more specific exit reason
> than a regular EPT fault or by altogether avoiding a VM exit.
>=20
> On the other hand, being able to disable x{2}APIC hardware assisted
> virtualization can be useful for testing and debugging purposes.
>=20
> Note:
>=20
> - vmx_install_vlapic_mapping doesn't require modifications regardless
> of whether the guest has "Virtualize APIC accesses" enabled or not,
> i.e., setting the APIC_ACCESS_ADDR VMCS field is fine so long as
> virtualize_apic_accesses is supported by the CPU.
>=20
> - Both per-domain and global assisted_x{2}apic options are not part of
> the migration stream, unless explicitly set in the respective
> configuration files. Default settings of assisted_x{2}apic done
> internally by the toolstack, based on host capabilities at create
> time, are not migrated.
>=20
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
> Reviewed-by: "Roger Pau Monn=C3=A9" <roger.pau@citrix.com>

Golang bits:

Reviewed-by: George Dunlap <george.dunlap@citrix.com =
<mailto:george.dunlap@citrix.com>>



--Apple-Mail=_6C193DFC-0E85-4211-A0C2-B3E798EB6AD3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 13 Apr 2022, at 12:21, Jane Malalane &lt;<a =
href=3D"mailto:Jane.Malalane@citrix.com" =
class=3D"">Jane.Malalane@citrix.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"">Introduce a new per-domain creation x86 specific flag to<br =
class=3D"">select whether hardware assisted virtualization should be =
used for<br class=3D"">x{2}APIC.<br class=3D""><br class=3D"">A =
per-domain option is added to xl in order to select the usage of<br =
class=3D"">x{2}APIC hardware assisted virtualization, as well as a =
global<br class=3D"">configuration option.<br class=3D""><br =
class=3D"">Having all APIC interaction exit to Xen for emulation is slow =
and can<br class=3D"">induce much overhead. Hardware can speed up =
x{2}APIC by decoding the<br class=3D"">APIC access and providing a VM =
exit with a more specific exit reason<br class=3D"">than a regular EPT =
fault or by altogether avoiding a VM exit.<br class=3D""><br class=3D"">On=
 the other hand, being able to disable x{2}APIC hardware assisted<br =
class=3D"">virtualization can be useful for testing and debugging =
purposes.<br class=3D""><br class=3D"">Note:<br class=3D""><br =
class=3D"">- vmx_install_vlapic_mapping doesn't require modifications =
regardless<br class=3D"">of whether the guest has "Virtualize APIC =
accesses" enabled or not,<br class=3D"">i.e., setting the =
APIC_ACCESS_ADDR VMCS field is fine so long as<br =
class=3D"">virtualize_apic_accesses is supported by the CPU.<br =
class=3D""><br class=3D"">- Both per-domain and global assisted_x{2}apic =
options are not part of<br class=3D"">the migration stream, unless =
explicitly set in the respective<br class=3D"">configuration files. =
Default settings of assisted_x{2}apic done<br class=3D"">internally by =
the toolstack, based on host capabilities at create<br class=3D"">time, =
are not migrated.<br class=3D""><br class=3D"">Suggested-by: Andrew =
Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com" =
class=3D"">andrew.cooper3@citrix.com</a>&gt;<br class=3D"">Signed-off-by: =
Jane Malalane &lt;<a href=3D"mailto:jane.malalane@citrix.com" =
class=3D"">jane.malalane@citrix.com</a>&gt;<br class=3D"">Reviewed-by: =
"Roger Pau Monn=C3=A9" &lt;<a href=3D"mailto:roger.pau@citrix.com" =
class=3D"">roger.pau@citrix.com</a>&gt;<br =
class=3D""></div></div></blockquote><div><br class=3D""></div><div>Golang =
bits:</div><div><br class=3D""></div><div>Reviewed-by: George Dunlap =
&lt;<a href=3D"mailto:george.dunlap@citrix.com" =
class=3D"">george.dunlap@citrix.com</a>&gt;</div><div><br =
class=3D""></div><div><br class=3D""></div></div></body></html>=

--Apple-Mail=_6C193DFC-0E85-4211-A0C2-B3E798EB6AD3--

--Apple-Mail=_42BFAA6B-3502-4303-A56B-BC40751AC0BC
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmLG9fwACgkQshXHp8eE
G+3kqQf+L6U5SSJM2QZEd12K4hoLJobxk55T5ctk9fRn33LpJYEJ8evnBddsXeH9
IlJ84OVuDDoxCoqeROdsUONfiUn73cttP6NBb53mZ+WrjAQ2hy7x7KlHFt8kAkGr
EXTgLqhW6lIMZyaql9pMJyOzZuL9Vp0LLLqQ9+Lf+bPpTgTz6iR4rBzU3fjwjylt
wGpen/kFNP+st7ZjW44Ie0AJHFSa8TazId9LmCNd35ZwBorbUOCwUwFjvKjt84Kr
qhA3LePr+UetNo18OU/Xm93oQKPXGXE2p83YGQ0aYpdGZWXL/LEEPI+6/pJ+C5TU
QLzxfNJUi8XFpbOQG7d2k8CxhP2Sjg==
=/HbF
-----END PGP SIGNATURE-----

--Apple-Mail=_42BFAA6B-3502-4303-A56B-BC40751AC0BC--

