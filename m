Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 880B1640402
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 11:03:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451768.709538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p12sl-0003Ig-BZ; Fri, 02 Dec 2022 10:02:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451768.709538; Fri, 02 Dec 2022 10:02:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p12sl-0003GK-8f; Fri, 02 Dec 2022 10:02:59 +0000
Received: by outflank-mailman (input) for mailman id 451768;
 Fri, 02 Dec 2022 10:02:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xeCl=4A=citrix.com=prvs=328e240bc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p12gX-0006fl-Qp
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 09:50:22 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b90525d8-7226-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 10:50:19 +0100 (CET)
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Dec 2022 04:50:10 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6705.namprd03.prod.outlook.com (2603:10b6:510:110::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Fri, 2 Dec
 2022 09:50:05 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 09:50:04 +0000
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
X-Inumbo-ID: b90525d8-7226-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669974619;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=gmoko/xDikgFPA4hfDSg4hjKNrTWkOYMzC4A0MqCVyY=;
  b=HEsxQgBgJNi8zTURxtD8KpZUIqAoaZpgk4SGTXCVOAKUae5l+AIRa8Ub
   PcvxGRBYwyEWV0Xbu54U15iZeDfKmBRLrnfOfESwrX4CytSBmcXBw2LsO
   Zagcr2f9oDX/ArFO2nbNxvUUCPkEFD47KeQo14lSTFcJjZxYN1CYYRIWg
   Q=;
X-IronPort-RemoteIP: 104.47.70.109
X-IronPort-MID: 88757106
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:M7s2Ya4uvLZKWMI011qDTgxRtPLGchMFZxGqfqrLsTDasY5as4F+v
 jBKDWuCO62KYWL1cox1bYW3oxgOupTcm9FiSws5/i0zHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKoT5geH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m3
 PU+GD09awK52M2JxLWae7BAnvQSFZy+VG8fkikIITDxK98DGMiGaYOVoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6MlEooiOmF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNJCS+Dnr6Y06LGV7jdDExwXd1qrmOOGzU26WYJbc
 kEQxDV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq19KqQrD60ETgYKykFfyBsZRAe/9DprYU3jxTOZtVuCqi4ipvyAz6Y6
 y+OhDgzgfMUl8Fj6kmg1VXOgjbprJ6WSAcwv13TRjj8tlI/Y5O5bYu171Sd9exHMIuSUliGu
 j4DhtSa6+cNS5qKkURhXdkwIV1g3N7dWBW0vLKlN8NJG+iFk5J7Qb1t3Q==
IronPort-HdrOrdr: A9a23:xkk2VK0xVgw2OB5Ra9uDegqjBZxxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHQYc2/hcAV7QZnidhILOFvAs0WKC+UysJ8SazIJgPM
 hbAs9D4bHLbGSSyPyKmDVQcOxQjuVvkprY49s2pk0FJW4FV0gj1XYBNu/xKDwVeOAyP+tcKH
 Pq3Lsjm9PPQxQqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LoSK05KX8Gx242A5bdz9U278t/U
 XMjgS8v8yYwrGG4y6Z81WWw4VdmdPnxNcGLMuQivINIjGpphe0aJ9nU7iiuilwhO208l4lnP
 TFvh9lFcVu7HH6eH2zvHLWqkjd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7nV6xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklVavoXRiKrLzPIt
 MeSv0018wmKG9yqEqp5lWH9ebcGUjb2C32GXTq9PbliQS+10oJsnfwjPZv4kvosqhNCKWsrt
 60TJiB3tt1P7ArRLM4C+EbTcStDGvRBRrKLWKJOFziULoKInTXtvfMkf0IDU6RCe41JbYJ6e
 L8uWljxCcPUlOrDdfL0IxA8xjLTmn4VTPxyttG75w8vrHnXrLkPSCKVVhryqKb0r8iK9yeX+
 z2NINdAvflI2erEYFV3xfmU50XLXUFSsUattsyRlrLqMPWLY/hsPDdbZ/oVfHQOCdhXnm6Dm
 oIXTD1KskF5ke3WmXgiByUQH/pclyXx+MGLEEbxZlm9GEgDPw+juFOsyXJ2iiiE0wzjoUmOE
 1jPbjgjqS34WGr4Geg1RQdBiZg
X-IronPort-AV: E=Sophos;i="5.96,210,1665460800"; 
   d="scan'208";a="88757106"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AknxM3Mx7/qFDm7pNOMYhuQSanlOhLA8aM6UsjP2eiUK/lFi6VVPiCI5TFPjCAmiT1rIjbjq0UJqGzRfIuEZ6cCcWbnBFQq1aePb/jwBIo+nCniv5dyaWvVi/Zwt1u/E52VoaDA7WUVI9Lx2mLhKSuUAONWo48mMiJrNeTZ4Rf1p7y0fAaAx7BFT8cdhUgWEmjh4U+1eACirE9j5niT1D22nfhcYDn92V3bnKv9Fs1Wyr9dcJtJnq9WXzN0XTgo8eSIXh1c1GBNiSD6oty7anXUKEC3WYEmFvN0psOHYuU7iVW9zU7KrDAXnHrw329a+6liBVfznDEMdzlQwEnlBew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmoko/xDikgFPA4hfDSg4hjKNrTWkOYMzC4A0MqCVyY=;
 b=ZzXHX28cB999isii9EqDzZkhJyCDm6uAOzYgDNmAljvgkioiJstpDuQmQKH2471jxhbd9c63WNSjRB65FLsp4k7BnTbkSNNNd3C105ZqaKufwWdFRshzVXI8IPBb77YBobx3MxlAovSns8S+uJ5yTWt+mNVB4qFVU1t4qnG2fwLFMTcmxibFU2IKXOM6zBgctUBLw9//lTxxowHavl50EjkKc8Aqe6RpvCZQaTfsMdcUx1bzljWa5gCk46eYmU+0r/c4ViAEKTjZZsphZ3vPJ2vaCnc40jN/abgMdrOcz0gup63MZp325x68iWKTUYLoBu6B16bYth0Z4qT5xtLSsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmoko/xDikgFPA4hfDSg4hjKNrTWkOYMzC4A0MqCVyY=;
 b=JT7yF62KEjtj887ZzyLP5QcF3A/5isZXacnAzBCNMGFQkjC2+5HVGLleRueBhPgYw/pc5PE1mFBwk4fMU3xMKCTXVwF/9kAEqw0NSTLFDQwIISuQsHR/e3D+NXnwEGV3UpJ8nDDAlPxQE9AokuRzoyJER1xbmIJGROzwqi6YBhY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] gnttab: don't silently truncate GFNs in compat
 setup-table handling
Thread-Topic: [PATCH v2] gnttab: don't silently truncate GFNs in compat
 setup-table handling
Thread-Index: AQHZBjMFItpTUo5OfEy63HLCU7um965aWoCA
Date: Fri, 2 Dec 2022 09:50:04 +0000
Message-ID: <9c644cb9-43a0-b3f8-ed4a-ac91ff371d84@citrix.com>
References: <9d796752-8f8e-dc64-9803-a33e31a3f7d4@suse.com>
In-Reply-To: <9d796752-8f8e-dc64-9803-a33e31a3f7d4@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|PH0PR03MB6705:EE_
x-ms-office365-filtering-correlation-id: 7b21339c-88d6-4e19-a611-08dad44a9698
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 3rjYdOAMp+BJAdub6zaZDkFBWc+L+zbjxywrnnkn7VrJUFySS0crtNTFNFaC/6VMBUC3LW+wfGRrITeUubgh3T/w9TITRnc5oXey/8zFiM/L6+HhTxiwTPdjKZqTpSW0KRz1z5UnfduZS9S8/tm+OBf6XSVm8p5V/RvP2zTrxFcDNr+idJaD4CJyn3+NaSQ2wnTrow6PFWrD4FonFU5cF2WOD0afpDu9tR9FPNFdDWVtOIWPh+jcJPrand+qcCSh37Kqo0qV2XA3yn48pUv7qiRP2HXuawuJsbAfgjZP5OCQY4d8na/X1s6p8GTBO+p1P9+64metkQI3bax7+Nj/Q42JGRwY3D5VOc0rjc9kOl54u8nujaocwAj5IA+E9hJbwpEf3opCERaW1pC5F5VqAN+OZEeKJlpfR6Caq4OLR07wF0/dmQDuJn9vm11xLlvFBtbeediRV7WsORI2KpH5o+UjofFaZtPt0091XsXBMgLx5LHkPd25SR9DiQhfOmszMPL7+ZmOerF9XRK1tvuVfjQpFTKzo5xegEHgYoj5JkxhZ24IK0QuvQq/9QNdRkbmrSZE8cVi6IxdHuUnibScStYTwenqDSuSkBuoekaqG5+Yea/sR4E6uMOKn1XgjPYova5C1Z5xSDi0Jr425GfxVbUotpWUPVHljUrNmOL9L9uoDSA9urOL2VYhdsQwo8erNJsHOFjQbbwLjG+OXFqaGYFgRCvw3nzvKv+Xw0AY4eC9yUzforua5J0ATVbK6tt0dGZc2s2e4uuytm6Y7KNFWw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(451199015)(6486002)(66476007)(8936002)(4326008)(41300700001)(66946007)(8676002)(66556008)(66446008)(76116006)(64756008)(91956017)(36756003)(54906003)(110136005)(31696002)(316002)(5660300002)(478600001)(86362001)(82960400001)(122000001)(53546011)(71200400001)(26005)(6506007)(6512007)(186003)(2616005)(31686004)(38100700002)(2906002)(4744005)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZDdxc0lFM0ZJMzRycUtXQXhJS29QMHlsWHhxOEhwbzU1TEkvNm8wZUNlU0VX?=
 =?utf-8?B?THNtNGNIVG1zeE1zYzRJZnpvbTVxbXhTNDZURWxxeHJBdkJtNGNlTHprdW90?=
 =?utf-8?B?bitlK2d1N1o0TlI0VE00eDU1SzlrZWh1bGE5eGtuVFpqWml1M2J5NmNFeXhU?=
 =?utf-8?B?UXoyZmFjTjdCYXdxWENQd3NRakxiVUh4ZWNQWk8zSWpvUnR3WllEQUN6Y3NN?=
 =?utf-8?B?Z0l5WC8wR2hsWmNTckQzNHdLK3NSRzZUR3RwRjBBc0hoa2lpbnliTzZBRm1X?=
 =?utf-8?B?VHgyWk9rM0R5UEMxajNrdjZLQjRiQTZVRk91MlkrSE5hdUdPT3hSc2tjTjNL?=
 =?utf-8?B?N1M2Z05ZSjFRMkVPcHZUNEF2MzFQOVowMnJuekdtTXEyMWc3NmFhcUJUMkJh?=
 =?utf-8?B?aWJ5cXFxUXJvZ3dSZC8xeXZxTzZ3SCtEMWIrcnFzcWR3VU8xN1p5TlQ4Lzk5?=
 =?utf-8?B?Vkl4UGtGZVVZVWF3OWhZbDJMajNGdHdPWkkycmVOYVlaeHVGRjhQR3ErU1Za?=
 =?utf-8?B?Q3pyQmdYSjR2bHBaMzhoUWp5UkREOXJlOU9GbmlOVlhNVWlLNGJBYUJraXhm?=
 =?utf-8?B?ZHJHaXBBK2RMSmRaNjQzb2tEUUhQQTZzaGNicHp6cVlrVXR1VWVjME4vVUVv?=
 =?utf-8?B?NTY3UkZpMkRRN3FRK1FSUHk2ZmNsenZJSFRiSGpsaW5xRUZlQ1dENjlFaHI5?=
 =?utf-8?B?dnNzNHhPT2IrNzRiZjlsc2dkQkROR2xSZW9RSUVENUYwbllMWVpyclZDTGdY?=
 =?utf-8?B?Z0I5WXprY0k0MVBwbkkvWjBNTDJZM0ZCUVd2dVZUVHcrZUFnZUpjOXR4NnNZ?=
 =?utf-8?B?cGxMZXIzaGVnenhTdHQrZXVxK0lDMHpIRWg2MW11SWxhcXE4dXl1TC9GSzhI?=
 =?utf-8?B?Q0RlTm9ETjFFRmM3R0w3Tms0MzJHaGpXbUNSNGNjLytaVmVrWkJ6Mmo5QWJB?=
 =?utf-8?B?QUl3bGxmaGNpY3gvVlZGRFV3a2VLZHN4U2dmZmpVajA1T1Ntbk9DbWZkR2V3?=
 =?utf-8?B?eFJvcHF1OFJxZTYzKy92UkMrNEJuZVBoa05Wc0o2VEhISmlubUNTOEVSYzVN?=
 =?utf-8?B?ZkFmdVBZSktsVGkwazExSGNHV3NlaXVBRFNCUHBQL2pFVStMNXptTkY4Q3Ji?=
 =?utf-8?B?eUpYckQrbXhpdVlZVlNtWXNrVmwzZklrZWNvQllLOHlkMUVwdUUycnEwWmdP?=
 =?utf-8?B?ZEo4VFdHdHZOSkxHMXc0azZNMVhpY2JIUnpEVEk4VTV5R2NpQkJpNjN6NGR3?=
 =?utf-8?B?OGdxaXcvMkpSRjErU2dRdzN3YVM3bkp5VnBTclFsc3lubzM3RkNyNHRMMTJS?=
 =?utf-8?B?ZkJESzlSdXNoK0RmYkUyYW5lcHdIYmdaNldTRXZGRWYrYi9TME1LbUEyblZW?=
 =?utf-8?B?WmZIcTVFRk5Da0I2WDh2WTlRSWNXaWsyOGlLcjBubEVBTmJZcFZtM2tQNkdq?=
 =?utf-8?B?ZnJZdnhSM0E2T3hGQkplaDFycU9YM3kvbTNGdmoyVHNGV1hCYmcxeWx3eU9u?=
 =?utf-8?B?T2pVTTdSMnpCU2xwNXlGcTZVOHdJejJoWGZML1h2L1plUjRXNXV5dzhkR3hi?=
 =?utf-8?B?cnBTclJPcUUxanJRV0FCdmowWlM3MWllcUl2RVYrOHBua1lOTFdjOEphV0p6?=
 =?utf-8?B?MXBoM0VwRDh4NzlBTHhsRkhkd1VmZGg5NnpacDlOK3FhK2ZZdUtQSktrVGRm?=
 =?utf-8?B?eGdoSjFCNmNodnNhakNoeUxtQk5SbFJPQXNoSXZsMjFDSVgyWlI1K2ZIVjJq?=
 =?utf-8?B?SHRpRGF2WDMvZms2ZjRhd1I3ZjNleW8xcFMyNmZxVm1MSVJBbG91WXFicnVV?=
 =?utf-8?B?YlRvL1pHY0hIa3NZMmtJVnhFWWhpYjNzeUlFWGlXRUNKYkxGaEtMV3Y5UGlQ?=
 =?utf-8?B?YlpKektQUzQrSXRxNXF6RkNDczFoUElHbFpSTUlpcys3UVp6VHAwM3BHV244?=
 =?utf-8?B?T0p0MWVBTk14UFBYNXlvZi83ZW5MU1YrdGw2UExaWjJkVUEwUmZsY0tJbGlJ?=
 =?utf-8?B?ZHdyUlR5QjBxRzJ6enVaVXVHWG5FcmxRTVd4STNDckt1N2V5UDRYN1A0L2p1?=
 =?utf-8?B?YWdpalh2Z2prYVU0VWFjeWxGSGt2UDRFZXBJb0dCQTBCb04zOFVoNTVDbWE4?=
 =?utf-8?Q?GDneQC52NJJHPPv1ovzELRavi?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DDAA018242F1E146A4BEB1B29457AEE5@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	q8c4akR22Kp07cP2jPFgsGFu6XZ+7CHK3OWSYL8bAU9EBp3T/KA8MNLPEO+NYxNNGe+9EaW3KGpPVsUWC01Mo8L4C6tfbpsqi8iBT9otUbxhbCfWjDj5cM78U1sJgOfQN6GymsQPjak155k4ibjMyjkDenTw6LlEhIxbwWNnhbKmiOCKBmQt4eW/ZvuSghGXJeGgtclzg8g24AIsbRmURFutxz8CcxmjUFyiLiUlCXGm/E8D/MtTYyOF+XLZF6EnCJu2YX+0LIn/nbg0W2/Qp+E5kx0M06aCXaMOKSo3/kLHIKDFUB36s3Sz7HzZLiUUNVOXSWp+slv5n1Wgp4FaSPY7pM8sqGojCRcIYJZ3uUTXJoqsQH+uHc6LcS9jCnG1s7/wyufjZ69wxRCrFsZ6MhA0sHbM8MnAVrrxCtEVeN+VeWy0ee80LTKQluRoTKoInPzZ0ysV46LJOUA81I4Fkys1iGzghM2cCGsTCxNiFRodVjSjhTVtdIqE5FhlTHmWtlmtFHzVwxzCOcQiqrnKBvwv3hW2+YvrXrUQ+ikFraL000wFnOvYSjaMjodMk3H7OQjQshNO/MVleoJHg+tWl5v5blbHzaOe3WA0VVhWVYZ2mty1+1qRZ9TlfYfqy03M5nglB/VF8EZ3BXr3qAaKAj1ZpbSldmb966frycTRg1MX50FGr2bZE+pDBusgDYnlpgGI2CsL/adKn5ctPbTg3oEw9wgaP84yakhaLqx/pDDNESiK5u2bULEwX+XBJK1dHl6gmnQ517kuZO4CZnAb8rkTwju8FOlaX+bowyLZ5Tt0R2keFyO7WY+NSBGObvPNaUsoU4UJJq6hKTmQ2IHRH4UQ/lzxhaM0sL/h2RdK1qx9QH3qdtSPHb4nB3oOPp6S
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b21339c-88d6-4e19-a611-08dad44a9698
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 09:50:04.5288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yQSz4dVHlXagB4oiFx9ZU73qEdNhjVq7AS0jMqKfFE/oOl2V99o7xPySpgQUqTDqFbDw933JTSaDnebhKd5a03Mgn+UgP1pB/ikgkx4SmYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6705

T24gMDIvMTIvMjAyMiAwOTo0NiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFJldHVybmluZyBiYWNr
IHRydW5jYXRlZCBmcmFtZSBudW1iZXJzIGlzIHVuaGVscGZ1bDogUXVpdGUgbGlrZWx5DQo+IHRo
ZXkncmUgbm90IG93bmVkIGJ5IHRoZSBkb21haW4gKGlmIGl0J3MgUFYpLCBvciB3ZSBtYXkgbWlz
Z3VpZGUgdGhlDQo+IGd1ZXN0IGludG8gd3JpdGluZyBncmFudCBlbnRyaWVzIGludG8gYSBwYWdl
IHRoYXQgaXQgYWN0dWFsbHkgdXNlcyBmb3INCj4gb3RoZXIgcHVycG9zZXMuDQo+DQo+IFNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo=

