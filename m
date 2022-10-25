Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD87160CFBD
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 16:59:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429905.681232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onLNV-0008KQ-F9; Tue, 25 Oct 2022 14:58:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429905.681232; Tue, 25 Oct 2022 14:58:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onLNV-0008He-CJ; Tue, 25 Oct 2022 14:58:05 +0000
Received: by outflank-mailman (input) for mailman id 429905;
 Tue, 25 Oct 2022 14:58:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OByo=22=citrix.com=prvs=29082ff5b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1onLNU-0008HY-2F
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 14:58:04 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b56b4a6-5475-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 16:58:02 +0200 (CEST)
Received: from mail-bn1nam07lp2042.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Oct 2022 10:57:59 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5183.namprd03.prod.outlook.com (2603:10b6:208:19e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Tue, 25 Oct
 2022 14:57:57 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 14:57:57 +0000
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
X-Inumbo-ID: 6b56b4a6-5475-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666709882;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=xTpdg1PTu3TZ6wvysef5LNvFfeZKWgF4fzcJczYzVY0=;
  b=Fu8dtWFhUi2einJ8vHYxfkDlIazjspULuKS4psbiSIu5/kaNX5MrRi+F
   DrcUGTX7J9xT7woru6T0VhBl/v09UJTNAjyC7SyP34B1PYwykJGPoxz9r
   WReGMBHpKJDUbxn8yQe2RvqPUYF/0Ro8Ko5ue2hNqeiXWKs0lJfJ21G+N
   I=;
X-IronPort-RemoteIP: 104.47.51.42
X-IronPort-MID: 83893560
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0yAjK6owfKyBdReoPnHI6CjHkd9eBmIlZBIvgKrLsJaIsI4StFCzt
 garIBmPPf3cNGHyL9skaI/g90xUuMPWnNUyHABl/3g2EH9H9ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYGYpLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4ZwehBtC5gZkPKgR4QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m5
 NgIMA0/Xgq6l8Wk2L7rE7JR3PQIM5y+VG8fkikIITDxK98DGcqGaYOToNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OlUotitABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCNlCReblqKYCbFu72kwhBTBRcAeBvqOJtkGcYYIOO
 1AF9X97xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnO87QyY7k
 GCAmdzBDCZq9raSTBq19L2ZsDezMig9NnIZaGkPSg5ty8HqvYUbnh/JCNF5H8aIYsbdHDjxx
 3WAqnE4jrBL0soTjf3npxbAni6moYXPQkgt/ALLU2m57wR/Iom4e4iv7lud5vFFRGqEcmS8U
 LE/s5D2xIgz4VulzkRhnM1l8GmV2su4
IronPort-HdrOrdr: A9a23:4J+okangSa2vRTd8guAk0QIgNKnpDfOPimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SETUOy1HYVr2KirGSjwEIeheOvNK1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge+VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPYf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcRcsvy5zXMISdOUmRMXee
 r30lMd1gNImjTsl1SO0FnQMs/boXATAjHZuAalaDDY0LHErXoBerZ8bMRiA1XkAgMbza9BOO
 gg5RPni7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4ZkWUzxjIjLH47JlON1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGcl2E+pgEz82IIgMgE2nsQ/pM0TJdJo+
 zCL6RzjblLCssbd7h0CusNSda+TmbNXRXPOmSPJkmPLtBOB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8XU/fkr/YPf+qKGjMiq9NVlVcQ6duf22vaIJy4EUbICbQRGrWRQpj9aqpekZD4nSR+
 uzUagmccPeEQ==
X-IronPort-AV: E=Sophos;i="5.95,212,1661832000"; 
   d="scan'208";a="83893560"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYu3DWEWKF/+7wUzLbLwL1byK16Q42IPzzD0JT6HLBbz3+0zGJVnFKJDdgfhc1I727b7TNL/E/vbMswhS2vsuptpEmqzPFghlecjj+u/SMXdmjsuFxEba9KemZ3t5wYF1xJVHJrMcvDfGVDJFjP4V7+ygXPBxJhetOK5ELBw3D8axjn3oUhWqT+18jKdV+1kAHSeiy9mw8acAX4b6EJWX4UezHbZ7Rg8Dy5yQCE/BHnvCRz+5vYNqgUV2i+f1bMRC/Vs736HGSqGQyYY/wFPiXg+Jj43GjrQts5S5hF8kwv/bOLHFtsQKfy6qbwpqu3eqvxBWW3ThJbSFra3Zorr7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTpdg1PTu3TZ6wvysef5LNvFfeZKWgF4fzcJczYzVY0=;
 b=iB0hzssKvwtqdEWo4+hHxAaCS6Qb8nEuTvCt17UpkPjzlb2GCby8LekpzFj+w6F9EZbHl0uMXy9cHRuocc81Q99I2CUpVnsPs/Zdvngc0C0umKQ01tXhKc9aeC19BSob+ox0Hf5ZxzIo8DVHEESM2TXDRA2OOddM59UCMyCzD5GdBX5l9cXGJimIj2rd8uAjoYIwnWXbCtLrcSZ49YYuE+zeVaVttIeipoWHsIJ2AdRrT0iB8oZ12CFs24YRPPL3YPxkHhXiSlVgoxAx/esez9jpKPMDWA/0vFaefkI+ZQPj2p/kE+K3nTIMTb+U7P08YavCuZ26K0/qLQeDqzS2tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTpdg1PTu3TZ6wvysef5LNvFfeZKWgF4fzcJczYzVY0=;
 b=r3g52t8erLHByaj0zcAlvJzXr5IeBE/nvaDo8DTAuZ+kOmj9QsOO5dDu84hbSsREK/CO6Xz3HtK9A2WyAbzNk4VNSLk6awpeUh6LX6Ecpcc4JBMqg7XhVyzNJE2JvzVlHpkz/4YODf12o9vTqkjVsxcLbdXQS3fLm8GNKgoyV9Q=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Henry.Wang@arm.com" <Henry.Wang@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH for-4.17 v2 4/5] pci: do not disable memory decoding for
 devices
Thread-Topic: [PATCH for-4.17 v2 4/5] pci: do not disable memory decoding for
 devices
Thread-Index: AQHY6IB1GZlo2uEODk66SxzrKqAIQ64fM1MA
Date: Tue, 25 Oct 2022 14:57:57 +0000
Message-ID: <46a361ba-121e-a054-da59-512e0fb6eb70@citrix.com>
References: <20221025144418.66800-1-roger.pau@citrix.com>
 <20221025144418.66800-5-roger.pau@citrix.com>
In-Reply-To: <20221025144418.66800-5-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MN2PR03MB5183:EE_
x-ms-office365-filtering-correlation-id: f7d219e9-d5e8-4b07-2380-08dab6994d88
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 K+S+eEzxALNJqowbo8ymPsaUOkAR7EPdTyDXcu9D1MdpXg+7v5MN8G+5bYmuyZylBANWi2b8Uq0o7Zm2JvzTgQbl/aI7/vtzxLMKmyS5+HvY691OXSMBm0Ix6lZVbcJDJfc16J8gGRwGV6yyux+pm1Vst5wjZVI8dMHlGHj+hLAXsNHzmAEV0TgO3auFmN1Vc3BzarGq0imqP92Pib6JtMVWCDxE2+B7zMYkNjg4w5WsGoPIELNc0c6O5pDlZl85mf081WDYiA0YiVs+XOkWRUJtTjl1bik9hMYIeWaZZ5ewytq4Ufr3Ce5+UXJKB3ZptKx8I7nkFtW259hmXTXhgr2Xt6ZtoDsBEFPGMvvYl6HQpWSRCwfz3FDgHcLYbX+f/rGDcJaxq0Hpdq65F1jP4NTiPnLXxT9JxiOovxV5PpI3wyg4f+HhKHW+cRVFXspZeQO1tR0lPc5klTtIGQNlnYzZDB9QpUPWlJ1lVrHwaH/qAypqyRg4OOO+AbCdO2GZBBffn9JPPZDF/ajtdJCGOz8FFe10Zv8wOGzbBWvmp9XhVxbYO3cGTucfxxXsPmWQ/xK+nlMi/YQZYn5zaP8WOqaX48qU1drY027mb1WfdISWjgklotZ03NcnKWSkN86j13i22xgNrbCvMw6kBPcwet0cXaKWOU/3nnnOECcuscp5C0IfUf4dbgL351rmGQFo5vrL3igrIgkJtAFB5Ja12LPwz1ezv1uSUqF7OsIm7bG0IUpy5QeWwLR7x/iKGnQ6bHISEz8rFBdly9qnKIFyYn54IUenhwLK1LbqQLpwUNdnQw2f9BLw6xTGHoZEk/8kcTB36uBj0FwmbzRcyWbzzg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(451199015)(36756003)(31686004)(86362001)(31696002)(122000001)(2906002)(2616005)(38100700002)(186003)(82960400001)(38070700005)(83380400001)(6506007)(53546011)(76116006)(66946007)(91956017)(4326008)(6486002)(6512007)(316002)(110136005)(54906003)(71200400001)(64756008)(8676002)(66446008)(66556008)(5660300002)(66476007)(41300700001)(8936002)(26005)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RVBINHB1WjJpSFMvazBiWGthM2QzQytESldCZnR3NGdJbU5hNWJTa1BDNmQz?=
 =?utf-8?B?Y0V3YkN3NkJEeE0yaXJQNHVTVnNvMFduRlZ6cmR0RjZieTR3bFBKbkdsalNL?=
 =?utf-8?B?alJaWEJnN2QvQ09YN0JvTHFDaEhPNVlQS0V2MEJ2QWp4SHZtbEVGYTlwVjFC?=
 =?utf-8?B?THVvayt3cHpLOHk2alR6cnhsWUVyT1Nya3h0OEVHak5IdUIwUVZrQjhhMGNK?=
 =?utf-8?B?THdtREFIYnlqMkQ0bDlKL1BPaGE2ZE0yUm9hNXQxa1FtTjJ5bWJGenZFay9B?=
 =?utf-8?B?SHFSZTdMTGp6U1ErTEN3eWIxejBDZGhzMTlPdWFReHIzOGZJYlU2N0J4Yyto?=
 =?utf-8?B?VzRDSFF0Y25lY1NucUtRVW1WQ1JqMkZWdVgyTzhDaHBvcWFWVzRRdlR0a2Zr?=
 =?utf-8?B?VVBub1Z6OUhlcVJvU3c2dFlObW55RWsxQ3VNcVlvU2t3bmQzVFJuQWwvZHlu?=
 =?utf-8?B?M2pGdnp2VitvVHpLSFNzVjZ4UmE3bFJDUkxGZlFiODhzem9zbjBQTEUvekov?=
 =?utf-8?B?L1JZMXJwZ3RmYjY2azljK1lpR1FCMmgzbjR0OTF6WnhuYUdTeW1helhyUjhB?=
 =?utf-8?B?d21VT0hzMFVqV1Q2THBuNlQ2Q240Wk9xWEJlc0JYdTJOYzBXREFTSzcvaGRu?=
 =?utf-8?B?SzRYQXZsQm9UajZaR0VpWmNjQmRPMlEwVHlOVFRFcS9nUGN5MDZRdDZGbHVI?=
 =?utf-8?B?RTBjRDloUHltSXdDM3I2bVZlRWUzN1BKc3VVSTQ0NFpJaWZqOHhaQUN0cEdT?=
 =?utf-8?B?VWQ4SVNBbmhvSDIvUVoyTzFTY3BzNDRpMFAxcWlyMlNGdCtsQ243NmJDZTF1?=
 =?utf-8?B?N0hVK0VJTG1neGxJYmg4cXB6dWZiSHFSMmRuVGl1algzZXRlSmp6aXFDZHgr?=
 =?utf-8?B?eTdHbDloQ1FIdE9rVHhXeEo1MDdzLy9jSGlWbzEvN2tkNTZUWk5wRDBOVS9X?=
 =?utf-8?B?cnJuMnUxcmxBTS9lTGV4VU96aEdjQ3BUbmluYVFJUzJRRXJDUzNRYUNXZEkr?=
 =?utf-8?B?L2k0ZWJpQWd2R1JYVzJZbURaeVc2eC9sL2ZqbVpEUC8vUHY5bHI1RnQ2eW1X?=
 =?utf-8?B?OVJHWmZkMHI3d2trcW8xNHNPb2puOVdjVHdGUi9SYmJySXh0UUo2RWQveHRi?=
 =?utf-8?B?b05JT2dtRWtnWElsOGVCU1htMnVxQTRrZll0V1F1ZmVWUU1uQmF1N1ZWY2V3?=
 =?utf-8?B?OThMOUg1SU11eTNTaWE1U0MrS1lZc3FTUW1lY1VRNFZyVit1eS9DL3c5cWE5?=
 =?utf-8?B?Y21qNktoSkZFUWhMdldZbytXUEM4YTdRNm85azdBcTh3RmlpenVTcFc4Vlg1?=
 =?utf-8?B?N2dMLysyeXlGbEFHeVRCdm4xeXd2LzVBWUhlOTRVQ0Vvd2JDUlI3bmdTZ2dI?=
 =?utf-8?B?ZFBhWDZyVm1vYWVOb0FXSU4xckxZNDdRT2hwNjVsSU9tUE5ieisyZk1aR3lZ?=
 =?utf-8?B?TzU2K2hSNmlUTlF0T3dOVGhYME95Zm9QZlFqUzZRdjVmRjk1TmxPclVEMXZE?=
 =?utf-8?B?V2xucW9pV1BTQmtzckliUXJVQTBXZ084NnE1VnhyMnlWZkFhMFZweTh5R1dr?=
 =?utf-8?B?UUpWMDJ4NGtzQlJyYnRxblY0SG50aXdJQ2RJZ0ZzTkxPK2lTMjNrMm9USkZE?=
 =?utf-8?B?c2k3SXFaSi9Vc1JVOXBSMHgwOGM1MlFCTFBaLzN3UFRsVnJKVnQ2eDl2NXVk?=
 =?utf-8?B?L1ZVcHoxU2t1VzVvVFZsRkNLbWIxcHpuZDRmYkc4MmZtUjczbTY3Nlhpb3lT?=
 =?utf-8?B?bFJIdlhydnRZcW1sdjdXbFBYNXYxZ1dEcisvT3ZraFM3RWdJOVJVWTVtU2g0?=
 =?utf-8?B?K21SQWtSMWQvbFZwUDY5ZXkwTU1ydmNFanBkYVc3RDB1OUJGRkZKNlRuTHJw?=
 =?utf-8?B?Vi81ZW94K0tLR3pEY1k0Sk9GMXROU01sSU9pSmZNVHArUUNLWGdzekFJeWhi?=
 =?utf-8?B?Y1A2Q0ZQRXA5ZVRReHlIQXpjem1KdmZmQ3VuUlhDNXk0YUM5NVc0WkEvTnlW?=
 =?utf-8?B?QnhZSFJkZ0hvOWhxOHlwMXBwa25wdXVQbmpLVVVjME4zZU9LendTZE1XbUN3?=
 =?utf-8?B?UURFMVJ1UDVkVzB6NEtZdFpzRGtPMU1razdCK3lOdThSUnJSaHhCd2lnQkFM?=
 =?utf-8?Q?/P+WCa12yRvshde9dHsXvOO13?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF8EE6F8DF7F96489A4CF64EC4D8058A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7d219e9-d5e8-4b07-2380-08dab6994d88
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2022 14:57:57.2896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xH6HQczJacZspfKQvPlsGmrQDNLWfBUCrDQa2f2z1twm5r97FPqOgreaNa4ULZiM1VO5dTsXamqIJSgw5ydWegu1Ayb6LmXRTBKn62P0RIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5183

T24gMjUvMTAvMjAyMiAxNTo0NCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBDb21taXQgNzVj
YzQ2MGExYiBhZGRlZCBjaGVja3MgdG8gZW5zdXJlIHRoZSBwb3NpdGlvbiBvZiB0aGUgQkFScyBm
cm9tDQo+IFBDSSBkZXZpY2VzIGRvbid0IG92ZXJsYXAgd2l0aCByZWdpb25zIGRlZmluZWQgb24g
dGhlIG1lbW9yeSBtYXAuDQo+IFdoZW4gdGhlcmUncyBhIGNvbGxpc2lvbiBtZW1vcnkgZGVjb2Rp
bmcgaXMgbGVmdCBkaXNhYmxlZCBmb3IgdGhlDQo+IGRldmljZSwgYXNzdW1pbmcgdGhhdCBkb20w
IHdpbGwgcmVwb3NpdGlvbiB0aGUgQkFSIGlmIG5lY2Vzc2FyeSBhbmQNCj4gZW5hYmxlIG1lbW9y
eSBkZWNvZGluZy4NCj4NCj4gV2hpbGUgdGhpcyB3b3VsZCBiZSB0aGUgY2FzZSBmb3IgZGV2aWNl
cyBiZWluZyB1c2VkIGJ5IGRvbTAsIGRldmljZXMNCj4gYmVpbmcgdXNlZCBieSB0aGUgZmlybXdh
cmUgaXRzZWxmIHRoYXQgaGF2ZSBubyBkcml2ZXIgd291bGQgdXN1YWxseSBiZQ0KPiBsZWZ0IHdp
dGggbWVtb3J5IGRlY29kaW5nIGRpc2FibGVkIGJ5IGRvbTAgaWYgdGhhdCdzIHRoZSBzdGF0ZSBk
b20wDQo+IGZvdW5kIHRoZW0gaW4sIGFuZCB0aHVzIGZpcm13YXJlIHRyeWluZyB0byBtYWtlIHVz
ZSBvZiB0aGVtIHdpbGwgbm90DQo+IGZ1bmN0aW9uIGNvcnJlY3RseS4NCj4NCj4gVGhlIGluaXRp
YWwgaW50ZW50IG9mIDc1Y2M0NjBhMWIgd2FzIHRvIHByZXZlbnQgdlBDSSBmcm9tIGNyZWF0aW5n
DQo+IE1NSU8gbWFwcGluZ3Mgb24gdGhlIGRvbTAgcDJtIG92ZXIgcmVnaW9ucyB0aGF0IHdvdWxk
IG90aGVyd2lzZQ0KPiBhbHJlYWR5IGhhdmUgbWFwcGluZ3MgZXN0YWJsaXNoZWQuICBJdCdzIG15
IHZpZXcgbm93IHRoYXQgd2UgbGlrZWx5DQo+IHdlbnQgdG9vIGZhciB3aXRoIDc1Y2M0NjBhMWIs
IGFuZCBYZW4gZGlzYWJsaW5nIG1lbW9yeSBkZWNvZGluZyBvZg0KPiBkZXZpY2VzIChhcyBidWdn
eSBhcyB0aGV5IG1pZ2h0IGJlKSBpcyBoYXJtZnVsLCBhbmQgcmVkdWNlcyB0aGUgc2V0IG9mDQo+
IGhhcmR3YXJlIG9uIHdoaWNoIFhlbiB3b3Jrcy4NCj4NCj4gVGhpcyBjb21taXRzIHJldmVydHMg
bW9zdCBvZiA3NWNjNDYwYTFiLCBhbmQgaW5zdGVhZCBhZGRzIGNoZWNrcyB0bw0KPiB2UENJIGlu
IG9yZGVyIHRvIHByZXZlbnQgbWlzcGxhY2VkIEJBUnMgZnJvbSBiZWluZyBhZGRlZCB0byB0aGUN
Cj4gaGFyZHdhcmUgZG9tYWluIHAybS4gIFNpZ25hbGluZyBvbiB3aGV0aGVyIEJBUnMgYXJlIG1h
cHBlZCBpcyB0cmFja2VkDQo+IGluIHRoZSB2cGNpIHN0cnVjdHVyZSwgc28gdGhhdCBtaXNwbGFj
ZWQgQkFScyBhcmUgbm90IG1hcHBlZCwgYW5kIHRodXMNCj4gWGVuIHdvbid0IGF0dGVtcHQgdG8g
dW5tYXAgdGhlbSB3aGVuIG1lbW9yeSBkZWNvZGluZyBpcyBkaXNhYmxlZC4NCj4NCj4gVGhpcyBy
ZXN0b3JlcyB0aGUgYmVoYXZpb3Igb2YgWGVuIGZvciBQViBkb20wIHRvIHRoZSBzdGF0ZSBpdCB3
YXMNCj4gcHJldmlvdXMgdG8gNzVjYzQ2MGExYiwgd2hpbGUgYWxzbyBpbnRyb2R1Y2luZyBhIG1v
cmUgY29udGFpbmVkIGZpeA0KPiBmb3IgdGhlIHZQQ0kgQkFSIG1hcHBpbmcgaXNzdWVzLg0KPg0K
PiBGaXhlczogNzVjYzQ2MGExYiAoJ3hlbi9wY2k6IGRldGVjdCB3aGVuIEJBUnMgYXJlIG5vdCBz
dWl0YWJseSBwb3NpdGlvbmVkJykNCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IC0tLQ0KPiBBVCBDaXRyaXggd2UgaGF2ZSBhIHN5c3Rl
bSB3aXRoIGEgZGV2aWNlIHdpdGggdGhlIGZvbGxvd2luZyBCQVJzOg0KPg0KPiBCQVIgWzB4ZmUw
MTAsIDB4ZmUwMTBdIC0+IGluIGEgRWZpTWVtb3J5TWFwcGVkSU8gcmVnaW9uDQo+IEJBUiBbMCwg
MHgxZmZmXSAtPiBub3QgcG9zaXRpb25lZCwgb3V0c2lkZSBob3N0IGJyaWRnZSB3aW5kb3cNCg0K
VGhpcyBuZWVkcyBhIGJpdCBtb3JlIGV4cGxhbmF0aW9uIChldmVuIGlmIG9ubHkgaW4gdGhlIGVt
YWlsIHRocmVhZCkuwqANClRoZSBmaXJzdCBpdGVtIGhlcmUgaXMgcGVybWl0dGVkIHVuZGVyIHRo
ZSBVRUZJIHNwZWMsIGFuZCBleGlzdHMgb24NCnByb2R1Y3Rpb24gc3lzdGVtcy7CoCBXZSd2ZSBn
b3Qgc2V2ZXJhbCBleGFtcGxlcy4NCg0KVGhlIHNlY29uZCBoYXMgb25seSBiZWVuIHNlZW4gb24g
YW4gU0RQLCBhbmQgaXMgaG9wZWZ1bGx5IGEgZmlybXdhcmUgYnVnDQp0aGF0IGRvZXNuJ3QgZ2V0
IG91dCB0byBwcm9kdWN0aW9uLCBidXQgd2Ugc2hvdWxkIGJvb3QgbmV2ZXJ0aGVsZXNzLg0KDQp+
QW5kcmV3DQo=

