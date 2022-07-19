Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA4957A66D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 20:23:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370880.602805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDrs7-00010s-05; Tue, 19 Jul 2022 18:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370880.602805; Tue, 19 Jul 2022 18:23:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDrs6-0000yV-TQ; Tue, 19 Jul 2022 18:23:02 +0000
Received: by outflank-mailman (input) for mailman id 370880;
 Tue, 19 Jul 2022 18:23:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+LuP=XY=citrix.com=prvs=1929f1d84=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oDrs5-0000yP-JX
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 18:23:01 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0745919-078f-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 20:22:59 +0200 (CEST)
Received: from mail-dm3nam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jul 2022 14:22:35 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6119.namprd03.prod.outlook.com (2603:10b6:208:318::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Tue, 19 Jul
 2022 18:22:33 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 18:22:33 +0000
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
X-Inumbo-ID: d0745919-078f-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658254979;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=J1N65RqM0M2f7IEwxCPXDaObWZSpFN/CyaTtqVHOB+E=;
  b=UCjvAKNk3qRL0wtIeZFulvM+gi3Lpt3DhkxoSrLF6yjRt9r2tb9mhx4W
   lhKGnNXlzeceGN22No3PfXya0tlXu2uwLy6o+ixk/8p+sM5mXdprnsSD9
   lk6qz387mb2SwT5Esqw1j4uXLeuo9CIAB++OPSfPvGQpiPJmkY40pzDEv
   Q=;
X-IronPort-RemoteIP: 104.47.56.41
X-IronPort-MID: 76161833
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ot7e8a0KLkfPFUmLTvbD5SFwkn2cJEfYwER7XKvMYLTBsI5bp2dRz
 WYaWjzQaPneYDH0Ld10O9nk9RgFscXRnN4yHlZvpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOKn9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUwx4VlmrBVOSvU0
 T/Ji5CZaQXNNwJcaDpOsfrc8UI35pwehRtD1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum0xK6b5OKkBlazhHe545gXBYqheW7vB3S9zx54
 I0lWZVd0m7FNIWU8AgWe0Ew/y2TocSqUVIISJSymZX78qHIT5fj69Z1M2cqF6siwNx2PFxv9
 qUcOCtXZynW0opawJrjIgVtruIKCZGxea864TRnxzyfCus6S5feRamM/cVfwDo7msFJG7DZe
 tYdbj1sKh/HZnWjOH9OUM54wLju2ye5L2QwRFG9/MLb50D6ygBr3aerG93SYtGQHu1en1qCp
 3KA9GP8av0fHIPBkGTcoin37gPJtRL/ZNo3EZSkytkppU/UyUwJLDIYS3Lu9JFVjWb7AbqzM
 Xc85iMrpLN08EGtQcjwWzW5pmKJulgXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBBzZirbmUQnK17aqPoHW5Pi19BXAGTT8JS00C+daLiIMuiFTJR9VqEq+wh/X0Hy39x
 3aBqy1Wr7Yek88Nkbm69FbvgjSwq5yPRQkwji3LV2es9StlZ4qoYYO55Fyd5vFFRLt1VXGEt
 XkA3sSbt+YHCMnXkDTXGLlUWra0+/yCLTvQx0Z1GIUs/Cis/Hjlep1M5DZ5JwFiNcNslSLVX
 XI/cDh5vPd7VEZGp4cuC25tI6zGFZTdKOk=
IronPort-HdrOrdr: A9a23:oSjJVqkMCknOIFcaMmiWvFfeLAfpDfN1iWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SEDUOy1HYVr2KirGSjAEIeheOu9K1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge6VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPcf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcdcsvy5zXIISdOUmRIXee
 r30lAd1gNImjXsl1SO0F7QMs/boW8TAjHZuAelaDDY0LHErXoBerZ8bMRiA1rkAgMbza9BOO
 gg5RPni7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4YkWWxxjImLH4sJlON1GkcKp
 gmMOjMoPJNNV+KZXHQuWdihNSqQ3QoBx+DBkwPoNac3TRalG1wixJw/r1Uol4QsJYmD5VU7e
 XNNapl0LlIU88NdKp4QOMMW9G+BGDBSQ/FdGiSPVPkHqcaPG+lke+93JwloOWxPJAYxpo7n5
 rMFFteqG4pYkrrTdaD2ZVamyq9N1lVnQ6dvv22y6IJyoEUHoCbQBFrYGpe4PeIsrEYHtDRXe
 q1NdZfH+LjRFGebLp04w==
X-IronPort-AV: E=Sophos;i="5.92,284,1650945600"; 
   d="scan'208";a="76161833"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/rVNxrvdrOuRADep/cZz70gYFo/Zecwkz4NfW6lYGWk82UCmkECQ6l1YP6fwxGT3ZmIAlNUcox1ZdN5E20wAsCmemmhPBqIMSgQq0Sp3DHkGKVOulcJpyuEI9iIRU9n7Gf+LLyvStuyyqyeLK1bVLsIXmRFfVnUH87kMm4cJ19/2S9kyW5hMtO0OyCO9zyoFqOT7q8uAZtxyB4+CMj11KDrIqZrTAR5qM5oagna4PlLUL77+ZPh9r/ZrczZYvepN0fIR+b5HbJT5t3gcxjxe6ackiCTo/Xw9PJChWB137E9e5J9OmiRK75Pcd8EBNd+2/WXn+bCipI9w/mLr/Zamw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1N65RqM0M2f7IEwxCPXDaObWZSpFN/CyaTtqVHOB+E=;
 b=iR18J1MKivlrS+ft2J8P+15r7h3sdBFVJI0P+ZlOnF+8xpUWBC2cYwRKjMkPc0tpbDLX+2PDLiTomHYmdesy9+VYqbvdhOHY1/WIh640AH3sYMB1EdTfW5ctmvAbve2dGfoAmkJb+UVuYjdBJxEueJr+4RJITvNXa2Z+ZcCVEDWBv0lSqYyDfsw+weCozFbeHDPLMRQnk5SXdNdiDcLyvtAzBGxlygUihMONL5zibicyfB/lfg1/hXqqfVGbwBNMjmEHQVxsPIZ6VRlTp5Xrp0fRQFVx7U6vS0qm9kQBWkc1TZqu8gpeUf8iY3zyGC3tJrBzjht3ZgWGRASDpngVCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1N65RqM0M2f7IEwxCPXDaObWZSpFN/CyaTtqVHOB+E=;
 b=LlIVUQaE9JyGhbFo8/39YCWVZWjjTw2Lm3eP2doemZJkrx1n4l07kyhNZARYRJafv/ZCVfQ5LzxN/HCwQ7Z516HID8adZMwZdDrF8JGjebpv6tnaAqq8/JYh9KxTWtgQtD5ExSmNXpWRhExMaYEinBI3K40S+gweq6G1ap/MQ0I=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, George Dunlap
	<George.Dunlap@citrix.com>
Subject: Re: [PATCH] xen/mem_sharing: support forks with active vPMU state
Thread-Topic: [PATCH] xen/mem_sharing: support forks with active vPMU state
Thread-Index: AQHYm5OTwIuHiu1fjUi8OMah1wkU8K2GAd4A
Date: Tue, 19 Jul 2022 18:22:33 +0000
Message-ID: <c88916a1-21fa-7a27-f984-d40bbaa688dd@citrix.com>
References:
 <4f3ff38d8226d10dab3440f020c9ba7f07cab1fd.1658250756.git.tamas.lengyel@intel.com>
In-Reply-To:
 <4f3ff38d8226d10dab3440f020c9ba7f07cab1fd.1658250756.git.tamas.lengyel@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 421aef6b-473a-4a35-c877-08da69b3a61b
x-ms-traffictypediagnostic: BL1PR03MB6119:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 L+UjEw8+EGIn0eq3BykkxEbtbLHzyi0OETMRHAZHkErBypgDNCEOqV/JaOfXvccZXSOaQDp9VN5OZQ35dIPxCM9CIQvKuxGC5t4IpAShV6/pOPPODl9YotwfY2pAbmQiNSNubT/k5+d0f8YmlO8FdWxFDc0lf3/EmMXKckPIfnYpRNUbjorJVG3tTlFTv1haAPuFnKjwnvDP4/NPlpQvaCaf1Cs4o6nSgfBJeOCMclQIjaxiEQwbN+fR5P0dahz1rsvSUW/X9kboYh9KKsLLIgJofXnQUO6kT4eVA8WcRbKQJjpY8iyeevPRp8xLx7V3KiduoQG4sPptWXaGDJ3YHd9X/HvJh1w7FnqbQ5gO/yBHfiI06iKt57VOoN9coKVnO2ryE7h8KhOzTrsIxuLnVf/JcpbDp0xTrHcohoqzkSvC8PkBzeTn/r3ZcXUQFFKoP9Le71+5MNmrn+EySqjHwwiO3jM/x2xiXHox2H+kahEcc2iW5a8xj+fu8D7uc0yMriUWmN3IWOEjjukv4v/orr3QBn8KY/4FSDYT4QobzDBZH6ZHmZ3QppOknAAphiVkJ/CFvtrauEqNDV2yR+6Y/JFos56vDns7R4zyvtqdB8nbk5yjmk9Rn0+Z/CX3JiosY2cyfdLeYP3VKU4X997IcoU7GHuyrSteOpRONTA3PYz9LlOl6TptljNm9t5agceoliLiW+Zm9gX4asBkPerjXPLM8IIcj3DhiWt2064xgNVgmpSnHlvlVGYs5yWk3RdJdvfRa/DAXsRePqGGX+vJH4/oHMd73eyM/jRdDMpeyJnBPlsohuzYvzJpRkFYcAAPQcnmnuORnfoAl4FkponnYMsfl9GPHOagG4XhcbIa/ng=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(376002)(396003)(346002)(366004)(31696002)(38070700005)(122000001)(41300700001)(86362001)(478600001)(66946007)(4326008)(66446008)(53546011)(91956017)(64756008)(66556008)(2616005)(8676002)(66476007)(76116006)(6486002)(8936002)(316002)(110136005)(2906002)(6506007)(38100700002)(54906003)(186003)(71200400001)(31686004)(6512007)(82960400001)(26005)(107886003)(36756003)(83380400001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aVhFRFNMNGdZTnl3KzF2Ukx0SWIzSkM3cE1TVzdISDlJTkp1dS9OVjJGakc2?=
 =?utf-8?B?eEtvUWw5bk9SaURDcmw1ZG55cjJnOVNLZ2lNSGgxcjRkVzlCa0pJWjAvaUIx?=
 =?utf-8?B?S3ZpamE0TTlnWm1WajJodE5iaHdkV2dXWVZobnQza1lJeEJnOXRzS1g0bkl0?=
 =?utf-8?B?d0ppenpFQ3d1WGdnOEZCbjJ2dk9HeDRZVFpuVTNnaDlOZnk5RE11ZVpZTURJ?=
 =?utf-8?B?YzNkblJjc3ovdTFoRWpFajdqRnZFdnRVeUlNUEZRZ3BuTUhsWU45d0U1V1Rk?=
 =?utf-8?B?M0lPTEcvMWtiWVFaNTBDNkJWWi9sd0cya2dveXlkZ25RTUJNanZVSTdRdElr?=
 =?utf-8?B?Rnk3aWlCUXpETDh5UU52cEgvVTFJWmJVQWFIeFdsV3FVU2paTmZwL2dheDBt?=
 =?utf-8?B?dWRodWk3Wi9rWEFLaFJhSnJSQlowT1dnM3dPUzFGNkVEb1hKK25reFJQM3J2?=
 =?utf-8?B?NVJDQW5IeWQ3eXAxMW9DYlRRNmZrbnRuMFhEeHRSd1ZMcGw4d1BBS2gxNXJl?=
 =?utf-8?B?WHM3M1E2RWxadk5JTU01UXlKVXZzVWxPS2tOQk9XVGU2aEk4QUhXZEhUdml6?=
 =?utf-8?B?Nk84MERka2h6dlNMTWh4NTVHSnh0S0VKWEJyRUo0aW1waElPYjFFOUIvVzUv?=
 =?utf-8?B?T2kwKzVtcWZLUnZycGE2SElySWVFR1VkejBDZXJNcWtZejVkcy9GMjkzZmtF?=
 =?utf-8?B?YjJpaFJRT0FWMUcwZ0MySFgzUUNkbk5zdWZBRUdJbS90aGpPV0hTaFluRkZq?=
 =?utf-8?B?endqV0h2RGI0dUc1RWRheEk5L1BWZzVZazIzY0FubHBKZFAxblRqMDdoejdX?=
 =?utf-8?B?M0RXRFdLTDV4TnlxL2d5N0NPWjV5TXlhOEgydkl0dllBN2h4ekI2dWhqSkxE?=
 =?utf-8?B?U0Q2NVQzUm0ySTZNWVcxK1VUL3pkOG01eXQ0cDB6bWU3YmFxZEgyWUZWUG1p?=
 =?utf-8?B?Y0d2eDRKNC95cmYvWXZ2eVErbytVemtQT0xZbU9DR2J3R1RKL2FudG9UdzNj?=
 =?utf-8?B?RUxLU2piTnp5a3RaRUlwbkY3L2VBQzV4Y09TUnNNZCtBQVZYVmtHS1RDNG54?=
 =?utf-8?B?RElTZWNNbVZIUzJrNlVUOHBxcGRvUGVMQ2x4OGcvSTVaMzRZL28wWFlxN05K?=
 =?utf-8?B?a2NrZldqcXp1cyt6ZXZGUjNMRGhHVlN6dEdhM1dET2l3U1M5WVNpa3BJOWpj?=
 =?utf-8?B?d3A3bUF3blFCU1lTZEpZRmJkUW14MEdJTmpEQmEzZDIxYTN2Uk9aNGlWckxi?=
 =?utf-8?B?eFlBSllKNnFYTVZqcExPUFdJTWVTWW00c2lVZzJsendpWUlqdVR6WmFwMmdP?=
 =?utf-8?B?TTR6NHN1VFA1UjJHWkFza0dkZWdGYk96eGJUcjE5dzVITVE0L0ZzRU4yaEl5?=
 =?utf-8?B?VElRU0FMdXB0MFZicmNrNFlheVI5c01yczZjdjV1WXIvenU3UUEzbU03YmJi?=
 =?utf-8?B?Y0lLblYxMG5HWEFDejBSdDZSUEJGbEVNaTF5QWtDT0h3byt0aFpERHBTVjhE?=
 =?utf-8?B?UFQ4Y3UvaHVYME9OVkJCbkJjd2dXeStQL0UxeFdoOC95N3IvY214Mm1MM2FV?=
 =?utf-8?B?Wks0MndiVHZmR1E3ek9vSmtURGhQRWVnajFBaGpIN0R6NlRKU1dESzJuNG5l?=
 =?utf-8?B?bEN1emZ2UVpYM1RadlFrSE80d25VTVJaUUlVeVdURmJuR0t1aWw5Z1NET28z?=
 =?utf-8?B?K1d4cFh5MkRjRWRpQjVjbHpKdkgrRTBsZUd3UjNCd2hXaHdkRm1RVjRxTjNQ?=
 =?utf-8?B?N3BleDliWjFORTJHUGIzRklaYmRwUUJndkhUcnVNZDhRLzAyVHk5UEZIWlpB?=
 =?utf-8?B?bVJsOFR6S0R2aXZUdTluZUhtdTNIWmNaZXNGR1RKVXE0MlIyYUU5NmZCenU1?=
 =?utf-8?B?eEVXN3lrN2thMXhyT1FjbHlSckx3MDk1dFhMcldSL25Mdzc0UkR0UUNhTFlY?=
 =?utf-8?B?WDhkbGdObjlUMGtIdzlKbnd4LzZ0c3NNUzgrRDVnU2ZKTCtKcTFlRGhxN1Ru?=
 =?utf-8?B?Tjhya05GSFpTNjc4SExSTm1KNU9kaHY2NDNjbEpOdmJtdGFIdW1MMTVneWVj?=
 =?utf-8?B?RzNGcUF3K2ExdDhTUHRYTWFxMEZ0V3c0aTNiSWNqN056ekREVCtYSDcwNlNY?=
 =?utf-8?Q?cEof3z4rR7F2XNVy+h6jeaSHG?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B33AFE7B655DDE4CAFB10D5EF8D5CC7D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 421aef6b-473a-4a35-c877-08da69b3a61b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 18:22:33.3091
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZsAFS/8gpnrpB0P4whdnx5w+gNt/mP4/A8lkMrdNw4auA4OUw08dlfrp4LsYHCHhczXqooWrCVnUd7F+QNrwcCGu9k+ajjRczGIwAweHj3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6119

T24gMTkvMDcvMjAyMiAxODoxOCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0KPiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L2NwdS92cG11LmMgYi94ZW4vYXJjaC94ODYvY3B1L3ZwbXUuYw0KPiBp
bmRleCBkMmMwM2ExMTA0Li4yYjVkNjRhNjBkIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYv
Y3B1L3ZwbXUuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvY3B1L3ZwbXUuYw0KPiBAQCAtNTI5LDYg
KzUyOSwxNiBAQCB2b2lkIHZwbXVfaW5pdGlhbGlzZShzdHJ1Y3QgdmNwdSAqdikNCj4gICAgICAg
ICAgcHV0X3ZwbXUodik7DQo+ICB9DQo+ICANCj4gK3ZvaWQgdnBtdV9hbGxvY2F0ZV9jb250ZXh0
KHN0cnVjdCB2Y3B1ICp2KQ0KPiArew0KPiArICAgIHN0cnVjdCB2cG11X3N0cnVjdCAqdnBtdSA9
IHZjcHVfdnBtdSh2KTsNCj4gKw0KPiArICAgIGlmICggdnBtdV9pc19zZXQodnBtdSwgVlBNVV9D
T05URVhUX0FMTE9DQVRFRCkgKQ0KPiArICAgICAgICByZXR1cm47DQo+ICsNCj4gKyAgICBhbHRl
cm5hdGl2ZV9jYWxsKHZwbXVfb3BzLmFsbG9jYXRlX2NvbnRleHQsIHYpOw0KDQpZb3UgbmVlZCB0
byBmaWxsIGluIGFuIEFNRCBwb2ludGVyLCBvciBtYWtlIHRoaXMgY29uZGl0aW9uYWwuDQoNCkFs
bCBhbHRlcm5hdGl2ZXMgaGF2ZSBOVUxMIHBvaW50ZXJzIHR1cm5lZCBpbnRvIFVEcy4NCg0KU2hv
dWxkIGJlIGEgdHdvLWxpbmVyIG9uIHRoZSBBTUQgc2lkZS4NCg0KPiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L2NwdS92cG11X2ludGVsLmMgYi94ZW4vYXJjaC94ODYvY3B1L3ZwbXVfaW50ZWwu
Yw0KPiBpbmRleCA4NjEyZjQ2OTczLi4zMWRjMGVlMTRiIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJj
aC94ODYvY3B1L3ZwbXVfaW50ZWwuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvY3B1L3ZwbXVfaW50
ZWwuYw0KPiAgc3RhdGljIGludCBjb3JlMl92cG11X3ZlcmlmeShzdHJ1Y3QgdmNwdSAqdikNCj4g
QEAgLTQ3NCw3ICs0ODUsMTEgQEAgc3RhdGljIGludCBjb3JlMl92cG11X2FsbG9jX3Jlc291cmNl
KHN0cnVjdCB2Y3B1ICp2KQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c2l6ZW9mKHVpbnQ2NF90KSAqIGZpeGVkX3BtY19jbnQ7DQo+ICANCj4gICAgICB2cG11LT5jb250
ZXh0ID0gY29yZTJfdnBtdV9jeHQ7DQo+ICsgICAgdnBtdS0+Y29udGV4dF9zaXplID0gc2l6ZW9m
KHN0cnVjdCB4ZW5fcG11X2ludGVsX2N0eHQpICsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICBmaXhlZF9wbWNfY250ICogc2l6ZW9mKHVpbnQ2NF90KSArDQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgYXJjaF9wbWNfY250ICogc2l6ZW9mKHN0cnVjdCB4ZW5fcG11X2NudHJfcGFpcik7
DQoNClRoaXMgd2FudHMgZGVkdXBsaWNhdGluZyB3aXRoIHRoZSBlYXJsaWVyIGNhbGN1bGF0aW9u
LCBzdXJlbHk/DQoNCj4gICAgICB2cG11LT5wcml2X2NvbnRleHQgPSBwOw0KPiArICAgIHZwbXUt
PnByaXZfY29udGV4dF9zaXplID0gc2l6ZW9mKHVpbnQ2NF90KTsNCj4gIA0KPiAgICAgIGlmICgg
IWhhc192bGFwaWModi0+ZG9tYWluKSApDQo+ICAgICAgew0KPiBAQCAtODgyLDYgKzg5Nyw3IEBA
IHN0YXRpYyBpbnQgY2ZfY2hlY2sgdm14X3ZwbXVfaW5pdGlhbGlzZShzdHJ1Y3QgdmNwdSAqdikN
Cj4gIA0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBhcmNoX3ZwbXVfb3BzIF9faW5pdGNvbnN0X2Nm
X2Nsb2JiZXIgY29yZTJfdnBtdV9vcHMgPSB7DQo+ICAgICAgLmluaXRpYWxpc2UgPSB2bXhfdnBt
dV9pbml0aWFsaXNlLA0KPiArICAgIC5hbGxvY2F0ZV9jb250ZXh0ID0gY29yZTJfdnBtdV9hbGxv
Y19yZXNvdXJjZSwNCg0KY29yZTJfdnBtdV9hbGxvY19yZXNvdXJjZSgpIG5lZWRzIHRvIGdhaW4g
YSBjZl9jaGVjayB0byBub3QgZXhwbG9kZSBvbg0KVEdML1NQUi4NCg0KPiAgICAgIC5kb193cm1z
ciA9IGNvcmUyX3ZwbXVfZG9fd3Jtc3IsDQo+ICAgICAgLmRvX3JkbXNyID0gY29yZTJfdnBtdV9k
b19yZG1zciwNCj4gICAgICAuZG9faW50ZXJydXB0ID0gY29yZTJfdnBtdV9kb19pbnRlcnJ1cHQs
DQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vdnBtdS5oIGIveGVuL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL3ZwbXUuaA0KPiBpbmRleCBlNTcwOWJkNDRhLi4xNGQwOTM5MjQ3
IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vdnBtdS5oDQo+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS92cG11LmgNCj4gQEAgLTEwNiw4ICsxMDksMTAgQEAg
dm9pZCB2cG11X2x2dHBjX3VwZGF0ZSh1aW50MzJfdCB2YWwpOw0KPiAgaW50IHZwbXVfZG9fbXNy
KHVuc2lnbmVkIGludCBtc3IsIHVpbnQ2NF90ICptc3JfY29udGVudCwgYm9vbCBpc193cml0ZSk7
DQo+ICB2b2lkIHZwbXVfZG9faW50ZXJydXB0KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKTsN
Cj4gIHZvaWQgdnBtdV9pbml0aWFsaXNlKHN0cnVjdCB2Y3B1ICp2KTsNCj4gK3ZvaWQgdnBtdV9h
bGxvY2F0ZV9jb250ZXh0KHN0cnVjdCB2Y3B1ICp2KTsNCj4gIHZvaWQgdnBtdV9kZXN0cm95KHN0
cnVjdCB2Y3B1ICp2KTsNCj4gIHZvaWQgdnBtdV9zYXZlKHN0cnVjdCB2Y3B1ICp2KTsNCj4gK3Zv
aWQgdnBtdV9zYXZlX2ZvcmNlKHZvaWQgKmFyZyk7DQoNCk5lZWRzIHRoZSBjZl9jaGVjayB0byBj
b21waWxlLg0KDQo+ICBpbnQgdnBtdV9sb2FkKHN0cnVjdCB2Y3B1ICp2LCBib29sX3QgZnJvbV9n
dWVzdCk7DQo+ICB2b2lkIHZwbXVfZHVtcChzdHJ1Y3QgdmNwdSAqdik7DQo+ICANCj4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jIGIveGVuL2FyY2gveDg2L21tL21l
bV9zaGFyaW5nLmMNCj4gaW5kZXggOGY5ZDllZDlhOS4uMzljZDAzYWJmNyAxMDA2NDQNCj4gLS0t
IGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L21t
L21lbV9zaGFyaW5nLmMNCj4gQEAgLTE2NTMsNiArMTY1Myw1MCBAQCBzdGF0aWMgdm9pZCBjb3B5
X3ZjcHVfbm9ucmVnX3N0YXRlKHN0cnVjdCB2Y3B1ICpkX3ZjcHUsIHN0cnVjdCB2Y3B1ICpjZF92
Y3B1KQ0KPiAgICAgIGh2bV9zZXRfbm9ucmVnX3N0YXRlKGNkX3ZjcHUsICZucnMpOw0KPiAgfQ0K
PiAgDQo+ICtzdGF0aWMgaW50IGNvcHlfdnBtdShzdHJ1Y3QgdmNwdSAqZF92Y3B1LCBzdHJ1Y3Qg
dmNwdSAqY2RfdmNwdSkNCj4gK3sNCj4gKyAgICBzdHJ1Y3QgdnBtdV9zdHJ1Y3QgKmRfdnBtdSA9
IHZjcHVfdnBtdShkX3ZjcHUpOw0KPiArICAgIHN0cnVjdCB2cG11X3N0cnVjdCAqY2RfdnBtdSA9
IHZjcHVfdnBtdShjZF92Y3B1KTsNCj4gKw0KPiArICAgIGlmICggIXZwbXVfYXJlX2FsbF9zZXQo
ZF92cG11LCBWUE1VX0lOSVRJQUxJWkVEIHwgVlBNVV9DT05URVhUX0FMTE9DQVRFRCkgKQ0KPiAr
ICAgICAgICByZXR1cm4gMDsNCj4gKyAgICBpZiAoICF2cG11X2lzX3NldChjZF92cG11LCBWUE1V
X0NPTlRFWFRfQUxMT0NBVEVEKSApDQo+ICsgICAgew0KPiArICAgICAgICB2cG11X2FsbG9jYXRl
X2NvbnRleHQoY2RfdmNwdSk7DQo+ICsgICAgICAgIGlmICggIXZwbXVfaXNfc2V0KGNkX3ZwbXUs
IFZQTVVfQ09OVEVYVF9BTExPQ0FURUQpICkNCj4gKyAgICAgICAgICAgIHJldHVybiAtRU5PTUVN
Ow0KDQp2cG11X2FsbG9jYXRlX2NvbnRleHQoKSBhbHJlYWR5IGNoZWNrcyBWUE1VX0NPTlRFWFRf
QUxMT0NBVEVELsKgIEJ1dA0KaXNuJ3QgdGhlIGRvdWJsZSBjaGVjayBoZXJlIHJlZHVuZGFudD8N
Cg0KVGhlIHN1YnNlcXVlbnQgY2hlY2sgbG9va3MgbGlrZSB5b3Ugd2FudCB0byBwYXNzIHRoZSBo
b29rJ3MgcmV0dXJuIHZhbHVlDQp1cCB0aHJvdWdoIHZwbXVfYWxsb2NhdGVfY29udGV4dCgpLg0K
DQooQW5kIGlmIHlvdSBmZWVsIGxpa2UgdHVybmluZyBpdCBmcm9tIGJvb2wtYXMtaW50IHRvIHNv
bWV0aGluZyBtb3JlDQpzYW5lLCBzYXkgLWVycm5vLCB0aGF0IHdvdWxkIGFsc28gYmUgZ3JlYXQu
KQ0KDQpPdGhlcndpc2UsIGxvb2tzIHBsYXVzaWJsZS4NCg0KfkFuZHJldw0K

