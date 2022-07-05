Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F60567060
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 16:09:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361342.590811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8jEu-00044a-Bl; Tue, 05 Jul 2022 14:09:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361342.590811; Tue, 05 Jul 2022 14:09:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8jEu-00042e-8i; Tue, 05 Jul 2022 14:09:20 +0000
Received: by outflank-mailman (input) for mailman id 361342;
 Tue, 05 Jul 2022 14:09:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WFsg=XK=citrix.com=prvs=17855ff4b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1o8jEr-00042U-VL
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 14:09:18 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d152686-fc6c-11ec-924f-1f966e50362f;
 Tue, 05 Jul 2022 16:09:16 +0200 (CEST)
Received: from mail-bn8nam04lp2046.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jul 2022 10:09:04 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5751.namprd03.prod.outlook.com (2603:10b6:510:37::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Tue, 5 Jul
 2022 14:09:02 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5395.022; Tue, 5 Jul 2022
 14:09:02 +0000
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
X-Inumbo-ID: 0d152686-fc6c-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657030156;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=tPqeXKha6sP5c9FAZHnaKkJoueNTzZ3V4wDFQ08QLZc=;
  b=MvzSamRzXWJiNDZVUqevAMrHWaGNN3tAF6sneSQBQY5AFSrzOd3tXGL9
   szNX6l4Rskbwy2W76DcCB/RUdiN6InfKg6TUVlttzfjm9wA/AGwdIajqd
   wBvYAoEI3JB0fYD5O9IYLyIlPnwUNft6tqUS4bm3oxsiobdalXzXuhobo
   M=;
X-IronPort-RemoteIP: 104.47.74.46
X-IronPort-MID: 74928077
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rLQ2e6uVGwUWIG2IXe87TxXPL+fnVGZfMUV32f8akzHdYApBsoF/q
 tZmKW+Pb/uMMzH1LowgPIvl9xgB78XRz9FkTAJqqH1mEH8W+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywYbVvqYy2YLjW1zV5
 IuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi90EPCS3/YkYyVfMBFkbKsY+73tcCmW5Jn7I03uKxMAwt1IJWRuYcgy3LYyBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4AEmmtu7ixNNa+2i
 84xQDxjdhnfJTZIPU8aEskWl+a0nHjvNTZfrTp5oIJovzmJnFQuj9ABNvKSf4XNRfxngnq+5
 Tma5DT/WD9CFfKAnG/tHnWEw7WncTnAcKYPH7T+2Pdsi1CXwnE7AQcTE1C8pJGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JSGeAn7ACGyoLP/h2UQGMDS1ZpasEitcIwbSwn0
 BmOhdyBLSd0rLSfRHaZ97GVhTC/Iy4YKSkFfyBsZRQBy8nupsc0lB2nczp4OKu8j9mwEzegx
 TmP9HQ6n+9L0ZBN0Lin91fahT7qvoLOUgM++gTQWCSi8x99Y4mmIYev7DA38Mp9EWpQdXHZ1
 FBspiRUxLlTZX1RvERhmNkwIYw=
IronPort-HdrOrdr: A9a23:exMWZagGKbTQilMcMqv0Ep+1jXBQX3l13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICRF4B8buYOCUghrTEGgE1/qv/9SAIVy1ygc578
 tdmsdFebrN5DRB7PoSpTPIa+rIo+P3v5xA592uqUuFJDsCA84P0+46MHfjLqQcfnglOXNNLu
 v52iMxnUvERZ14VKSGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3z8FOgk/gIsKwC
 zgqUjU96+ju/a0xlv3zGnI9albn9Pn159qGNGMsM4IMT/h4zzYJLiJGofy/wzdktvfrWrCo+
 O85yvI+P4DrE85S1vF4ycFHTOQlgrGpUWSkGNwykGT3PARDAhKd/apw7gpPCcxonBQwu2Vms
 hwrh2knosSAhXakCvn4d/UExlsi0qvuHIn1fUelnpFTOIlGfZsRKEkjTRo+a07bVTHwZFiFP
 MrANDX5f5Qf1/fZ3fFvnN3yNjpWngoBB+JTkULp8TQilFt7TtE5lpdwNZakmYL9Zo7RZUB7+
 PYMr5wnLULSsMNd6pyCOoIXMPyAG3QRhDHNn6UPD3cZek6EmOIr4Sy7KQ+5emsdpBNxJwumI
 7ZWFcdrmI2c1KGM7z74HSKyGG5fIyQZ0Wc9igF3ekJhlTVfsuZDQSTDFYzjsCnv/ITRsXGRv
 fbAuMlP8Pe
X-IronPort-AV: E=Sophos;i="5.92,247,1650945600"; 
   d="scan'208";a="74928077"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QAlaeRujLeexrYgr1uBUGVQjjv4yNo2RSRk2UEjddtFBptzlX7SCTjPtB5WzyFwpds3Ln9TzdZB1yKOXIBdWwHkUfjQsFWsNugQOsa0TsRn1sU7WgP2wtiH8Gwp1rTsfV6/JoHC4Qq7vlFJHJj8iixWYFnPWdrTHF5Yd8xtFln0ju/udCk6dIzM9VKd9FMAwMXcFJ8333owH2cHSiE0oMhjCh6ZzhGYfUOeu/R9ZkPp7VcZcGcBG4FWDKP3TA+cfvwUO9R4Q0WkZYt7oiOI1CJ1aiqtSzzKT6XidQqUGl7ztFGVhu/P2n1BRiI36/VPna5PpiFQmfapDVyIegpuo9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPqeXKha6sP5c9FAZHnaKkJoueNTzZ3V4wDFQ08QLZc=;
 b=M2EOLLdtV2JrmY/a49FORvh/2qluu4g1KYodwIOu8TBX9/y7bzhZ10pSfir+hFVsQ6wxxRfsJrh0J31sYdow+fMjVUUzR4xBJHva30kdBokV1x6zf9kBR5Rz9R0bHGJQVZee+bJL+xniuDNwbqwsKhRqHKDEMptwUyad4jBWpTV9S7eaKrGJFM3PIpYRURG60Ne3Kr0vSeWiEXFrn4A4rc2UFCv8QApCxr0ZcIk7Y7sUcpDtySN95uYyGZ9QPawm71yznUeZjEfJKpLo9AP+fNPvNsA6iAM+VVK//qAbI6XMhPXjYCT6oRIpXhKYHBwf2ZAZy4NHjFD4NtgOxILzgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPqeXKha6sP5c9FAZHnaKkJoueNTzZ3V4wDFQ08QLZc=;
 b=uaiPxF15CTkkwLQfUxgD+iJ4IwWRgvH7LovwWaA5xZ4jYDyhyzZhEontY9yIaNpcOb6e7qRO6WVDP6eKVvnbhcrYhzEAgdo5pn9aekpVFI22MheVZS/xkmCamZ/Tus+Yb0s0KvEZYJ1KczQBoHGmvFROX26t1HA50+dMKMg7r7U=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: Issue with check-endbr.sh during Xen build
Thread-Topic: Issue with check-endbr.sh during Xen build
Thread-Index: AQHYkHcMKffnFiUSAU+E175V5Z5atq1v0KAA
Date: Tue, 5 Jul 2022 14:09:02 +0000
Message-ID: <529c9b80-fa74-6f2e-f9c5-e53f09aebbb3@citrix.com>
References: <815D8CFC-86A4-4C63-AA51-83C4C29E7AAD@arm.com>
In-Reply-To: <815D8CFC-86A4-4C63-AA51-83C4C29E7AAD@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f3c671f-1a44-4f9d-6db0-08da5e8fe9db
x-ms-traffictypediagnostic: PH0PR03MB5751:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 GQdaPUe1wWRcIcwqkroNua2zQjWfg74+HyHFot0MYYOxixlrPs35KWbF9T7lCkd+SGg/peFJlujEqeItKXQnwrXFMF0JTsgnRSJ+yPK9pemRxikOHQ8bPfI2AoOSm0jm73k/0V/sy5xb4OH4lgs6lJ7/K/StWXdFQ3qvAlNxq3Xl2p7d6PTYI7FV9vUGwKPu6ZE6DmYju7+EX8hifbxa59VTBEQgzd7g+2Jw12uY3EtTdqZd6R37ZM+qjwX/fib0s0CmIECaagjfL8hj7t8r1GhXXgcLPIQTW2ZAevdTEnlANu1484YwZlcnIBOz6QYXaHObZokbvvOMh9rtC5zZeJzKKPq3CdzTGiFuE7DRotRgCwXWuQqRzAaHgq5nTUKF2Yw/c/GdJ0zeMOQV8NJqWYFnqO/Ag5ike7yrA06G9iYngbMDRCnNH1lhfAPtZgDcOfXq2g0wY3+Ag+2U1h8ggwc/UgrIcP0qRbncOka5wlhBF6qhZbK77LnJV+S3JoyGUa0qJGLF4kgqZub47YvYqNZOplmr65OzQ234P3QWaKT+QOLGwZa13T4lDyxriMXbaWMP8+vbkohu4RkFjGcPX3jXyjylH7V3bmK3H82xhx10dD8UXiPR5mdEU6XQfhJSKMcIFRRTX7lZKAW4W48lU1U7geOiqoxmkGfi7eZ8cSHAkpF+LYbeKxHYAhVstErbTMQW8TUuNRmaGrb3MbjT0Uag6ojixLZpP3WG+hzLW7TKvb7FY44VvV2oJwtdCsrmdSxe/CMREtaaol4lyZ3DVRUjIkgFnPQP6n1bWn+B/uW6WHVIp50GABlaky65TsnPB1H9x7Sz5y2NpxTSl4RYg0Hmy8e1TOEBfXtBo+v1wlpwLdECZFhdeZvdh28DsGjH
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(66556008)(66476007)(66946007)(6512007)(76116006)(2906002)(4326008)(26005)(66446008)(91956017)(5660300002)(54906003)(71200400001)(8676002)(41300700001)(83380400001)(8936002)(478600001)(6486002)(2616005)(186003)(38070700005)(316002)(82960400001)(64756008)(36756003)(122000001)(6506007)(31686004)(86362001)(53546011)(38100700002)(110136005)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cVhDNld3T0tNOW9UQUZuT2xzTU0vQncwR0p6M1dHN3hUZXA0U2RNWDcxVWJW?=
 =?utf-8?B?RUdOZU5Ib1RiNjE5UWJKaURMVEdaZjFqZytZUmZZa0tyUE9iQ1VsTERZZ25U?=
 =?utf-8?B?RVB4aGJ0SmgzTzdHejFEMEVIc1dqaUU4MVdiRUZCaHJtam5TVHlEeGRrKzcy?=
 =?utf-8?B?RFlhY210SHo1eWU4WFQ5a2Q3ZHhkY2tUZTRvWUlQVlF6eWNrOG9iTEFIWGVH?=
 =?utf-8?B?MlIzVFZJVnd3REhOWHVaRUdTR3lDTklpQXdKKzNEaUZvTitIb1krbmtRMUR5?=
 =?utf-8?B?eENPVkRXckl5Nmo0QkgxNmlWcXFzaThpaloyMWx2VTN1UHo1UlYwVFhxMTJj?=
 =?utf-8?B?WGN4b1l4N2VEU0dudmRxVDNlMWo3N2JyUTVkVzB6eFJhSnNpRzMwR0U1dTJR?=
 =?utf-8?B?SFlPeHdvQ2lqRFN0L09ENG05RlNzRVMwNkIzb0JnWHF2RlRmYTVIbUVmNWRl?=
 =?utf-8?B?eTgvZlRWbnNIUmZPUHNDakwvbHBEUFdyemtHUGVZZmFtck5TSm1OK2EweDkx?=
 =?utf-8?B?Tyt0b2FueEs2YS9JZkpkTkphcmJmT3dqRTFsYXMrU1FjeE1STk10QWxiVHVo?=
 =?utf-8?B?cjEra0tlQ1BXUGh6M3dwNDdsbzdGQ1ZtZFZsKzN4SkFCbjlqZGZYOU1mak0z?=
 =?utf-8?B?amYrRGJjcU16RFlhenUyS2U1ZDVaalk4MFVYU3BkcU5scEFXNjZXU0R5Y3cv?=
 =?utf-8?B?SGdnT2pyUWJLU1NTYUowUS9RYjBMTW5qclJCYU1ZN2FGRktNU0kydHVXYkZl?=
 =?utf-8?B?RVpaakNkWlRmN1UwZURKdVlLV0FiTlRXVzhXRjdUUHEzc1FHUWFGemFQNEhw?=
 =?utf-8?B?K0J4dWh2TDZFclFldW1NcUw1bHNJeG9OMjNhU25ZU0ppeHV5YXZUTkdZd3p0?=
 =?utf-8?B?eTN3am1zdWJHdW4rL3NNck1wdWdCUlN2QkR6bk5aa3IwRk80cXVDVnBDMEZr?=
 =?utf-8?B?Tk5KMDZCM2dYZS9wZlo3ZFdESUxqQjErRXN3cGREWTVUMTNMc2xLQk1xR253?=
 =?utf-8?B?M0JtRk1CRHNERytvbE9sdGhXcVdVNS9KdTVhTSs1ekFnM29VZGFKVElaT0No?=
 =?utf-8?B?M3J0YXBENkhCWmdxWVNpSEZVTnd4ZW5jdTh3VGNDL2hMS29pd0NQVUJtM29K?=
 =?utf-8?B?Sk5mVVFEdFZSRnJRN3Y4dnhoNmtzYnhIQ01UWW9oNEVPQ2FGbVdHMzJ1cFVU?=
 =?utf-8?B?WEtKdllEYkE0NzVDdXUzMlRkaWJRNksvVEJtOHRqOUhpeXUza2FTVUI3MjBW?=
 =?utf-8?B?YklqSjNFRVdtMmxpdWNrOGcvM0ZSS0MvVDdKNWZKc2pDTlZLVUx5cWU0eEZn?=
 =?utf-8?B?Mkhtb2g3SVZFelJWYjZKaVYwN0FRYjNQY1JXSlFZUGFxOUNyd28rc1laRUVn?=
 =?utf-8?B?MlV3b3JCR1I5R3NyT1UvaHVsRkJGdThVNndjRXc4UkJoOEVWVTl4V1lYVkhV?=
 =?utf-8?B?dVBGc1R6VWFXYjBZZHo0b1RYRndGZzJlL0VBTCtrdVZ3UkZQRlhYUTBINWZl?=
 =?utf-8?B?R0hRK01tdVlXK3NDNFdIL3JLa3d4NFQxS09OTlBvdG5XbnJVS21lWENYRUo0?=
 =?utf-8?B?eFhUTUMwVVBqS1VMazZabDV4NVdZdm9CZFFJY3dsS1Q4N1FDcjdYUUFBMENN?=
 =?utf-8?B?b01iZ3RKeXN0ZUovMmkxUng5VU8rbFpBZXZacUZSVDZ2OFpUQTlqc3d5RFNQ?=
 =?utf-8?B?NVR2UHIyMHkzMFF4WFdPbUxTdUtMRC9STTRkOTVyYVFZR2p2TmhqQ2VpUDZ3?=
 =?utf-8?B?VE5HbFovNG8ySTFYdWRwN3BjSllzWFpMRHM4bEpzTlB2di92RHhXQmlncmUz?=
 =?utf-8?B?L0RPdHJEL1NHUEV0d0U3bUNCSGVESWpHQ3BKWTZwVEd4K2VrK0dQMktPYnJk?=
 =?utf-8?B?NWNhbUJlanZZMHZkbGRvMXFlVE1lZHd1M0NreWI0ZkozSXNZWHIrNHZrWnRh?=
 =?utf-8?B?dGlKL0FHZEN1UFQ3S0FxQlRSNnZiNEU4RjV5UXNyYU5oekZtbnhyR1BHL1hQ?=
 =?utf-8?B?d2JnTW9TWDNPaFoyaU04YU9ncGV5dkx0UEEzNWZkM1dGRW8weC9uTXBUTVVt?=
 =?utf-8?B?QkhHSnZJSGsxeEZTcHBraVhmaXc1T3VmMUo1TWZWU0lGOGNjYUJYSnlLTXVT?=
 =?utf-8?Q?IcEQc0z7wPcv5QIJqAGEKPTfP?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B124D482F93550468836742F398E7139@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3c671f-1a44-4f9d-6db0-08da5e8fe9db
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2022 14:09:02.2996
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YOJfJwwxm2X1lFITN4xnpaNTqJxe460ikMBLoOPSIOHyTaeH3M7naT/AW/UQhvYYMGzlKIhA0GOWlHC2TwTu4hPyhnLi1V1hWe9ivMfg3So=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5751

T24gMDUvMDcvMjAyMiAxNDo1NiwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4gQWZ0ZXIgc3BlbmRp
bmcgYSBiaXQgb2YgdGltZSB0byB1bmRlcnN0YW5kIHdoYXQgdGhlIHNjcmlwdCBkb2VzLCBJ4oCZ
dmUgY2hlY2tlZCB0aGUgYXdrIHZlcnNpb24NCj4gYW5kIHNlZW1zIHRoYXQgdGhlIHNjcmlwdCBp
cyBmYWlsaW5nIGluIHRoZSBEb2NrZXIgY29udGFpbmVyIGJlY2F1c2UgdGhlcmUgaXMgbWF3ayB0
aGVyZToNCj4gIyBhd2sgLVcgdmVyc2lvbg0KPiBtYXdrIDEuMy40IDIwMjAwMTIwDQo+IENvcHly
aWdodCAyMDA4LTIwMTksMjAyMCwgVGhvbWFzIEUuIERpY2tleQ0KPiBDb3B5cmlnaHQgMTk5MS0x
OTk2LDIwMTQsIE1pY2hhZWwgRC4gQnJlbm5hbg0KPg0KPiByYW5kb20tZnVuY3M6ICAgICAgIHNy
YW5kb20vcmFuZG9tDQo+IHJlZ2V4LWZ1bmNzOiAgICAgICAgaW50ZXJuYWwNCj4gY29tcGlsZWQg
bGltaXRzOg0KPiBzcHJpbnRmIGJ1ZmZlciAgICAgIDgxOTINCj4gbWF4aW11bS1pbnRlZ2VyICAg
ICAyMTQ3NDgzNjQ3DQo+DQo+IEluc3RlYWQgaW4gbXkgaG9zdCBtYWNoaW5lIHRoZXJlIGlzIGdh
d2s6DQo+ICQgYXdrIC1XIHZlcnNpb24NCj4gR05VIEF3ayA0LjEuNCwgQVBJOiAxLjEgKEdOVSBN
UEZSIDQuMC4xLCBHTlUgTVAgNi4xLjIpDQo+IFvigKZdDQo+DQo+DQo+IFNvIHRoZXJlIHNlZW1z
IHRvIGJlIGEgZGVwZW5kZW5jeSBvbiB0aGUgaW50ZXJwcmV0ZXIgKG9yIGF0IGxlYXN0IGl0IGRv
ZXNu4oCZdCB3b3JrIHdpdGggdGhhdCB2ZXJzaW9uIG9mIG1hd2spLg0KPg0KPiBNeSBzb2x1dGlv
biB3YXMgdG8gaW5zdGFsbCBnYXdrIGluIHRoZSBjb250YWluZXIgYW5kIGV2ZXJ5dGhpbmcgd2Fz
IHdvcmtpbmcgZmluZSBhZnRlcndhcmRzLg0KDQpIbW0uwqAgQVdLIGlzbid0IGV2ZW4gb24gdGhl
IGxpc3Qgb2YgcmVxdWlyZW1lbnRzLCBidXQgd2UgdXNlIGl0IGFsbCBvdmVyDQp0aGUgcGxhY2Uu
wqAgVGhhdCBzZWVtcyBsaWtlIGFuIGVycm9yLg0KDQpPdXIgRnJlZUJTRCBidWlsZCBlbnZpcm9u
bWVudCBkb2Vzbid0IHVzZSBnYXdrLCBzbyBpdCdzIHJlYXNvbmFibGUgdG8NCmFzc3VtZSB3ZSBk
b24ndCBmdW5kYW1lbnRhbGx5IGRlcGVuZCBvbiBnYXdrLg0KDQpBbnkgaWRlYSBob3cgZWFzeSBp
dCB3b3VsZCBiZSB0byB0d2VhayBjaGVjay1lbmRici5zaCB0byBiZSBub24tZ2F3aw0KY29tcGF0
aWJsZT8NCg0KfkFuZHJldw0K

