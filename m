Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EC2675BDD
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 18:44:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482048.747352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIvRM-0007XP-Sg; Fri, 20 Jan 2023 17:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482048.747352; Fri, 20 Jan 2023 17:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIvRM-0007Tv-PC; Fri, 20 Jan 2023 17:44:36 +0000
Received: by outflank-mailman (input) for mailman id 482048;
 Fri, 20 Jan 2023 17:44:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vlkl=5R=citrix.com=prvs=3778cfab1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pIvRL-0007Tp-8X
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 17:44:35 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 176efbec-98ea-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 18:44:32 +0100 (CET)
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jan 2023 12:44:24 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB4986.namprd03.prod.outlook.com (2603:10b6:5:1e4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 17:44:22 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.024; Fri, 20 Jan 2023
 17:44:22 +0000
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
X-Inumbo-ID: 176efbec-98ea-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674236672;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=uLwgvpGk16i6VK5d6cd5GVcGnGfPIhaxeruIgV1xLcY=;
  b=XIYVG0nvlr6UprLbGt0zpCpMo3CLl0RpXBjc1DXl4POv0NHZBMiaLdD6
   DmrAK9ADMVWCwt1MVfjg3shmbIfde74oRfg+0hGCe75rMNo3bRPI9biSV
   AdojP2YCW3efUvRrEPhjLDDD0lzpK4jDYtwHSojroe8kP/aYyF1zAy/i1
   8=;
X-IronPort-RemoteIP: 104.47.70.106
X-IronPort-MID: 93007184
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/XHWBqvh6N7Hp8+NKfa7C5zsW+fnVJxfMUV32f8akzHdYApBsoF/q
 tZmKWvTPKqDYmr9eN1wao6/pENSsMDdy95nHAZq/CpmFSkS+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj51v0gnRkPaoQ5AaEzyFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwCzFUMzuexPuK36OAYbN3mNx4MY7qFdZK0p1g5Wmx4fcOZ7nmGv2Pz/kHmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ouiP60aIS9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOzjrqY12Q3ProAVIBZPDUnrqqO7sVe3YNdFB
 WhE4gd1vYFnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLnMfUjdLZdgitck3bT8nz
 FmEm5XuHzMHmKKRYWKQ8PGTtzzaESoIKW4PYwcUQA1D5MPsyKkjgxSKQtt9HaqditzuBSq20
 z2MtDI5hbgYkYgMzarTwLzcqzelp5yMRAhq4AzSBzqh9lkgPNDjYJG041/G6/oGNJyeUlSKo
 HkDnY6Z8fwKCpaO0ieKRY3hAY2U2hpMCxWE6XYHInXr323FF6KLFWyI3AxDGQ==
IronPort-HdrOrdr: A9a23:1G4cU6hEADeKy2nCPLEfy5z/U3BQXs0ji2hC6mlwRA09TyX4rb
 HMoB1/73SftN9/YgBDpTn+AtjkfZqxz/NICOoqXYtKPjOJhILAFugL0WKF+VHd8kbFl9K1u5
 0OT0F2MqyVMWRH
X-IronPort-AV: E=Sophos;i="5.97,232,1669093200"; 
   d="scan'208";a="93007184"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GE816gH1VoayO7WeAStZC3EF+6OTVJr0aLbGc+wHJU7aBv6HEZ7xOdgcZrKGFn7db5YlMU87LVQUzjHFPSzUun4un9KHWLKgZQtj42HMABZ5ADPMIOi4O8UfXJa483JiIe5NhG2CqlcqHGUHANZTgX8J7sNPFLePna1Vwbs9Sw60PedeUhXud78SBu2fz/IDiw5GTAp1hd9q2K7swu79fF8PJQt1TnKhanN5C5gAOSPkku6bbVuPmy3BcMLcNH+iB8mMtMB+sxEs3iRGnug6j+NZrH3rvIuUedyvdrG1oc9Y0wZBj613Kdsa5VACiDO1kw3L3qzcgxYT9DjnptMfew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLwgvpGk16i6VK5d6cd5GVcGnGfPIhaxeruIgV1xLcY=;
 b=jpE6ma5sH5ETWwROH3/Ku0Q8wphktpkfAeoK6KkaJHa2T4fZL0Ouvf8MS4K1hpsYkrwNUPwhY5l6WPwSpga3uDFOjgIHQsyFCFyHzIaJxivio3Lz1laTxfz4ok8PX1gXl+APwwFHvA7jfsWi/GfeyUcdJvAQ8Hd+P7R0XOUxt4V02ipFnaKc/9/7jHT0gwM7gDLVG1EM9Eq+/ZvW7+FVpkug36DJNl3xy1f9mUbdH8lsjeZDXGtaPnmkz8JO4L2povK5kb/egeDTpAzsj+2QvPYKc5Dqm1TlaI2hCagEFhZaDFP3etpWpCAYKIVtuERJb+DWFv3IVOPc7UjtQwwtFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLwgvpGk16i6VK5d6cd5GVcGnGfPIhaxeruIgV1xLcY=;
 b=wlZEZ4S7hTkxVnozSgh/dw6x8ANuciDFHj0cmv0nIO7SfDjdGLHfrSVEQH3w5c3ktIJkekDZb0NmaSdLvLpDdC7k79Ro4lAOKtvaRwDD7159PrnS5RnoZj6bB9gCBQ9rmiIH3x6tLR2HAKvH2SQiOVp+m8bBz8D3382g1S6joP8=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC 07/10] domain: map/unmap GADDR based shared guest
 areas
Thread-Topic: [PATCH RFC 07/10] domain: map/unmap GADDR based shared guest
 areas
Thread-Index: AQHY4457jyaOcvAnhkOdTNwMDM8hXq5O0KiAgFTsIQCAAMNSgIADpm+A
Date: Fri, 20 Jan 2023 17:44:22 +0000
Message-ID: <f9c6b4ae-8334-c823-43ca-9dfe71ed029c@citrix.com>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <5a571fd9-b0c2-216e-a444-102397a22ca0@suse.com>
 <f1229a27-f92c-a0dc-928e-1d78b928fdd0@xen.org>
 <bd6befdf-65eb-6937-fb85-449a5fa16794@citrix.com>
 <e87f4767-eb62-fc70-788c-d8afa45f6434@suse.com>
In-Reply-To: <e87f4767-eb62-fc70-788c-d8afa45f6434@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DM6PR03MB4986:EE_
x-ms-office365-filtering-correlation-id: 787f531e-00a2-4c7d-1de4-08dafb0df6d6
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 7T8RBHqeYVzuBazVE61SKD5BZg/1NjB4RSHqmfLlm77y1ffX2OUHToKfBBinC9wIt+MYdvCIx2pGjUAT/pLl+WuWRPCifQVUnGPvd30l7d2LKSGyFtqihBfgFW+siOAm/m+bteWSLAxCIhZadGv4ElfM6awyE5oPiYDX0uBZwdtT6zV7AK4NVfOxucYa+ZsKXawLafJ5JRhcbv5nIWV6ZoJZ0Wli1qxEexgHkAHuYy/CqL4ZTEnkU4JPbRbkm8rhGiJBHt9+l7lbPxi0uLCzl8lchmBlTQEebfkUTWnMlyyo2Md1fkXodUV8DZyIwJb5/Xg4YV9jSjlOs7qCBtiZcPFuabU5E/lBC2uamsKOUFSV8WP+eYgWP2PmgCySaCbwArCzZAXbqdODnHMfG5WYeKMmJonG3L7HfCdEV07jW118vOGC+kYRzNZbMZRzboi2FV2Ql9IZF5p2ISbtCbJIYKLSlLwzM7oqp4wNkwIxs/kshptBUfaqAV/+tzlJ+YcSxs4c/vxCiVKiFDlqxKl6cqJIFXIs3/ji9Vct9jFBHM1626FLo8G7ITMph7HKz6cD5OxZL7yMcRgvrIafaJ6bUvvOFhdJGR5nKLdaAjG+v8qJpUmGY1bJ9VhAdFKKY1J5Kfcg5+QGbs2bl8Uq2WQpLtXEXpyflBFsp+NfVoDssQpG/WHg/gfWdYPky9ik5s265r5+Q2bKj2+nl5Zg8PaHrdGE18zsnRUQfRsoKcKmTDRq73GP8lfFR+e6Y73buhRRlZB1/zImVy9Fs6tEib3Zsg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(451199015)(36756003)(86362001)(38070700005)(91956017)(31696002)(66476007)(66446008)(316002)(8676002)(76116006)(41300700001)(66556008)(64756008)(66946007)(6916009)(71200400001)(6486002)(4326008)(54906003)(26005)(186003)(5660300002)(8936002)(83380400001)(2906002)(122000001)(53546011)(6506007)(82960400001)(478600001)(6512007)(38100700002)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UTRBMU9NMFVYR0pqeVlsbTJHYzBwR2RNMWFpelZDYnFMcEVXcENCSEJhQ3Iv?=
 =?utf-8?B?bkYybDBXSVd0YUJZOVJERnBCUGNCNGVGeTBEeXMwVWg4YWp6c3RhOTFuQTRu?=
 =?utf-8?B?a1M3WkJobnRzNkI5WTc5N2UzM3VqMXF5eFViZW9xeDFuL2w5UTROa3pjbUwr?=
 =?utf-8?B?Ri93V2NmVHNJc2pYUWdmZlNrd3FudkpEdzBzTU8zRi9JNGEwbWVzelhyVkNm?=
 =?utf-8?B?WXpnWVVnTk1JMEQ5dWhZbTNESXNKWHlNWEprQU9veVozQXZIOTB2amtNaDZX?=
 =?utf-8?B?N2JJVkRkZnBudnJSbjZBMzJvb2ZqMU5ncGlSSTFpakgwMzAzNUV6c0RMblVO?=
 =?utf-8?B?eTFSTVg2VTZGekxEZnJVM3A0S09VTHZHWS9ZSGtWTm5PMitxc3BFNC83NGNZ?=
 =?utf-8?B?aVdSZ3FRb3ZRTEdSbXpDMWI5bXpMa0drdlk1cnNLT2h1M1ZJd3dhbHVNeUk1?=
 =?utf-8?B?WGREMHZWK1V4Q21TYi9xeFNoTVU3WXIySmp3UUlBUHZPajdvZ1dzVVl3a1BP?=
 =?utf-8?B?RVNycVdHWDFuZm9hTlRHSzJjZnZhS2hYVkVWRXUzUWZZQVhxYUJjM29DS2ZU?=
 =?utf-8?B?Uzk3M3FLMlUrcGcrSUF0Sm0zVElhV1VzcEdTYWxMbStCU0VJbHgvN1ZvY0Zy?=
 =?utf-8?B?TWQ3MVdISlJ5aXRiNWhEMTFBTCtXTGllVFM3SEphUmdmWGs2Tkx6Q0tlYk1Y?=
 =?utf-8?B?dVRzNE1oc2RqOS9ISUpYZzdENlY1UDI1QXlmS1BzK3hrNnJwZHRYanY3MzlV?=
 =?utf-8?B?UnBqYm83cmNjaFdaYUNGOGJjR3VaeUhsUGNDaC9SbVh1clAxTHFaTTRzbisv?=
 =?utf-8?B?ck9raUhpMTJmZzlIdTZPUG9pRTRKaFpEZGFYVnNCWDVvR1E3eEdwdjV6NFZZ?=
 =?utf-8?B?c0l4RU4zRnd3UThBT3k0NnJVT3BqY3ZnTU5pRk5VdUN4c2JkY3Q0OWlDazhm?=
 =?utf-8?B?NnB6VXFERVlVL2tiaU0vN1A4eHhUYXdMRzFYUzVlYXNSanprVE10ZEhRclVh?=
 =?utf-8?B?a0dONk9oVWdMb0pLRDZQUnNtZmlZQlVaYU1qQUVxWUVnM1lmUUd4UHloK2pw?=
 =?utf-8?B?ZDgyUkJQRzc1NmVndjZwTDkzR1pzM0dqd1I4TlQ4bEFHa0ljMlArWFpONU5h?=
 =?utf-8?B?aVRmeDBpUDEzdmtBSnZBeC9ydDUrakJQeFZjREN0MTl3Q2hRWktWNGlNSGNm?=
 =?utf-8?B?NjFQSUsvYmwzbmYzZjdzS0JvYnE4TVNPNmZaTm1Vejk2VFBIYkExWURFQStE?=
 =?utf-8?B?RytpNWhWajN5Ym1rTDJsTUNwRU9zUjFIYkJ4dGhvN3VYcEJ1WFJwcHNaWm5h?=
 =?utf-8?B?TklBS0tya2NNNUx3cU81bGZNaW9SUytPcEZOa0p6eWw3WTZndUtZWGlBTmY4?=
 =?utf-8?B?WHdjZHpoUkdsL25iaGJmaVYxV0hrZXZBKzRqNEVSS0VZZTRSZzMzUTRVSUc0?=
 =?utf-8?B?dlJqTm42bHI1WDM3anVOU0tLcEhlVHhPUE03NlFaWXBZUkQvSGw0NEE1R2Jw?=
 =?utf-8?B?SjNyMVZtcjlDbVpYSG1mVUVpalRUK0JUYyt1bVY5bVIzVU1Wb0oyZ2F6TVpL?=
 =?utf-8?B?THRlWllrckRpUXpMNHN5N28raWFzWkI0QWV2SVBNa2plMmlIb2xwelZuUkQ4?=
 =?utf-8?B?WTZ6N0RvcXU1eVI5M0twMFdlNGFKYXZ5U1ZOOWdoM0Q2empGemdJY3lsaFYz?=
 =?utf-8?B?R3BsdjNONzFqQ3dwbGwvRUpRcWVBRXBPM2dyUG5aa0kwTXo0Sm55M1FmTWhx?=
 =?utf-8?B?T1ZzaXowbjg2d3VHUVkyRS9mZWJtSi9rY3JmMkc1MXdGVC8vczkrQkZvNkky?=
 =?utf-8?B?Y3FzS1Q2NkhuTVgwUTBMdDlNc0p3UnpmMCtad3FhcC83QXpwVEEwTEFPRU9X?=
 =?utf-8?B?MkdmdXRKR29LSFQ0MUpxeFR5MUc4bnEzSHRCSWVsaTVxQ3dyUGgxRlVXUFVm?=
 =?utf-8?B?NjJzOWs3QWhpU0g2YVBsbVIyK3R0bUFPTW1vWGFIeXZwdmN5L2JsSzBIZ2hs?=
 =?utf-8?B?N3pUaXJFRWhVWTMvaVVxY2M3bWh5RWtIRUJmeVprVk9BY3hDNWZka1BEbEJm?=
 =?utf-8?B?VDZuSVhTMkMvdmtWNGlpb3Z2bnd6VzgrTFdIcndoc1pPRTd6cldocGRkc2pp?=
 =?utf-8?B?QmVmTHpQTnJNbmJRRVBTWkVwNUdpWXgwREp0YnRFMXZhU3MrSWxjSWxRWmlz?=
 =?utf-8?B?UlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4FF8674BD8280044BAB9B5C01081BC6E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EdLSuZLa1hMKctFcc5p160a66KnVEM4c6kNzFI/iab0x4m294LGPTV9QWqUyuboCDqwr2rH2Nuze8T8Bu0OiMxIzcc4GUypvzcntSsuAPmAXPfcIiMSsGGbkrulg/hqdzAMhnjpugt/RKmzYC7qkysD2jIOHH+aWwMlV8EH5zU9h87hAgCllaGpgjxbK4qxxAn8rNw9S/lzg0OCunTKYkTqNEvi/t89Yu634CflVBrqYTOYW56TvSvnqtJloOt9mti3NLN5JtYL5BobdL9E/2G4kBu2P14sCdeqIJI3DsOcSBUkGwtWGUwhSaGkj7X2/dUQlwvtspS5k7xU6Nk1cwMbBZ+Wt7E6e+QRh0dEF5LtnQ4FPCHqHmE0rzQRCtoo6F1SznhzPEgoUbCsBO8RkWJd9Oy+ShRMW1CK+eh4Tr/NyZROJfBNjoQLMsN22MwR2qUNdwqqlixXh/ca46jQaIbT+ErL35gGgdi7qRSCkyub11nSsLWBcCS9E03GUJ9FfyYkCjryl4MEErA1SECzGW2MD143gBtHfmwfqTQ0sfrAqeVixS0FldcBct3bZH/oAbLUKwGQJLd64nH0kwbKS7MdeK5Ww1lZLNjIVmL5guEXif1Lgc1bBUHnHFqHH1ZnSNRzeP+Wne2jE4A0bwK6/acMpDLOZr6PhFTcYMdEz/4a0f2v7esHSnohFcGkoi3xiCVvBWUwJZm8XgPM+bGhdDHL/bQh8t87R8eWJyEhQIAsVKR171/mS4Il2orMNABYqG97TABctJaprF5pjRV6rwtN/TUJfbmENooNql/x02AUUhj1EkcEcMxMzUC3RZS7V/qi+gWZvipvsyRj8pvMyTxYvh6r4D5LfF+hu4k/qfE4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 787f531e-00a2-4c7d-1de4-08dafb0df6d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 17:44:22.0564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h4MIVGTkVlnwMkXyTJYoK3EpIp8nZcTsj68X7DO/OAMF+0KVPEp/mhuECPUJ4piF1JBHmDC2vDATYA6Repx8ZJ1g750T1SchW4DearXlN7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4986

T24gMTgvMDEvMjAyMyA5OjU5IGFtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTcuMDEuMjAy
MyAyMzoyMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IE9uIDI0LzExLzIwMjIgOToyOSBwbSwg
SnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IE9uIDE5LzEwLzIwMjIgMDk6NDMsIEphbiBCZXVsaWNo
IHdyb3RlOg0KPj4+PiBUaGUgcmVnaXN0cmF0aW9uIGJ5IHZpcnR1YWwvbGluZWFyIGFkZHJlc3Mg
aGFzIGRvd25zaWRlczogQXQgbGVhc3Qgb24NCj4+Pj4geDg2IHRoZSBhY2Nlc3MgaXMgZXhwZW5z
aXZlIGZvciBIVk0vUFZIIGRvbWFpbnMuIEZ1cnRoZXJtb3JlIGZvciA2NC1iaXQNCj4+Pj4gUFYg
ZG9tYWlucyB0aGUgYXJlYXMgYXJlIGluYWNjZXNzaWJsZSAoYW5kIGhlbmNlIGNhbm5vdCBiZSB1
cGRhdGVkIGJ5DQo+Pj4+IFhlbikgd2hlbiBpbiBndWVzdC11c2VyIG1vZGUuDQo+Pj4+DQo+Pj4+
IEluIHByZXBhcmF0aW9uIG9mIHRoZSBpbnRyb2R1Y3Rpb24gb2YgbmV3IHZDUFUgb3BlcmF0aW9u
cyBhbGxvd2luZyB0bw0KPj4+PiByZWdpc3RlciB0aGUgcmVzcGVjdGl2ZSBhcmVhcyAob25lIG9m
IHRoZSB0d28gaXMgeDg2LXNwZWNpZmljKSBieQ0KPj4+PiBndWVzdC1waHlzaWNhbCBhZGRyZXNz
LCBmbGVzaCBvdXQgdGhlIG1hcC91bm1hcCBmdW5jdGlvbnMuDQo+Pj4+DQo+Pj4+IE5vdGV3b3J0
aHkgZGlmZmVyZW5jZXMgZnJvbSBtYXBfdmNwdV9pbmZvKCk6DQo+Pj4+IC0gYXJlYXMgY2FuIGJl
IHJlZ2lzdGVyZWQgbW9yZSB0aGFuIG9uY2UgKGFuZCBkZS1yZWdpc3RlcmVkKSwNCj4+Pj4gLSBy
ZW1vdGUgdkNQVS1zIGFyZSBwYXVzZWQgcmF0aGVyIHRoYW4gY2hlY2tlZCBmb3IgYmVpbmcgZG93
biAod2hpY2ggaW4NCj4+Pj4gwqDCoCBwcmluY2lwbGUgY2FuIGNoYW5nZSByaWdodCBhZnRlciB0
aGUgY2hlY2spLA0KPj4+PiAtIHRoZSBkb21haW4gbG9jayBpcyB0YWtlbiBmb3IgYSBtdWNoIHNt
YWxsZXIgcmVnaW9uLg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+DQo+Pj4+IC0tLQ0KPj4+PiBSRkM6IEJ5IHVzaW5nIGdsb2JhbCBkb21h
aW4gcGFnZSBtYXBwaW5ncyB0aGUgZGVtYW5kIG9uIHRoZSB1bmRlcmx5aW5nDQo+Pj4+IMKgwqDC
oMKgwqAgVkEgcmFuZ2UgbWF5IGluY3JlYXNlIHNpZ25pZmljYW50bHkuIEkgZGlkIGNvbnNpZGVy
IHRvIHVzZSBwZXItDQo+Pj4+IMKgwqDCoMKgwqAgZG9tYWluIG1hcHBpbmdzIGluc3RlYWQsIGJ1
dCB0aGV5IGV4aXN0IGZvciB4ODYgb25seS4gT2YgY291cnNlIHdlDQo+Pj4+IMKgwqDCoMKgwqAg
Y291bGQgaGF2ZSBhcmNoX3ssdW59bWFwX2d1ZXN0X2FyZWEoKSBhbGlhc2luZyBnbG9iYWwgZG9t
YWluIHBhZ2UNCj4+Pj4gwqDCoMKgwqDCoCBtYXBwaW5nIGZ1bmN0aW9ucyBvbiBBcm0gYW5kIHVz
aW5nIHBlci1kb21haW4gbWFwcGluZ3Mgb24geDg2LiBZZXQNCj4+Pj4gwqDCoMKgwqDCoCB0aGVu
IGFnYWluIG1hcF92Y3B1X2luZm8oKSBkb2Vzbid0IGRvIHNvIGVpdGhlciAoYWxiZWl0IHRoYXQn
cw0KPj4+PiDCoMKgwqDCoMKgIGxpa2VseSB0byBiZSBjb252ZXJ0ZWQgc3Vic2VxdWVudGx5IHRv
IHVzZSBtYXBfdmNwdV9hcmVhKCkNCj4+Pj4gYW55d2F5KS4NCj4+Pj4NCj4+Pj4gUkZDOiBJbiBt
YXBfZ3Vlc3RfYXJlYSgpIEknbSBub3QgY2hlY2tpbmcgdGhlIFAyTSB0eXBlLCBpbnN0ZWFkIC0g
anVzdA0KPj4+PiDCoMKgwqDCoMKgIGxpa2UgbWFwX3ZjcHVfaW5mbygpIC0gc29sZWx5IHJlbHlp
bmcgb24gdGhlIHR5cGUgcmVmIGFjcXVpc2l0aW9uLg0KPj4+PiDCoMKgwqDCoMKgIENoZWNraW5n
IGZvciBwMm1fcmFtX3J3IGFsb25lIHdvdWxkIGJlIHdyb25nLCBhcyBhdCBsZWFzdA0KPj4+PiDC
oMKgwqDCoMKgIHAybV9yYW1fbG9nZGlydHkgb3VnaHQgdG8gYWxzbyBiZSBva2F5IHRvIHVzZSBo
ZXJlIChhbmQgaW4gc2ltaWxhcg0KPj4+PiDCoMKgwqDCoMKgIGNhc2VzLCBlLmcuIGluIEFyZ28n
cyBmaW5kX3JpbmdfbWZuKCkpLiBwMm1faXNfcGFnZWFibGUoKSBjb3VsZCBiZQ0KPj4+PiDCoMKg
wqDCoMKgIHVzZWQgaGVyZSAobGlrZSBhbHRwMm1fdmNwdV9lbmFibGVfdmUoKSBkb2VzKSBhcyB3
ZWxsIGFzIGluDQo+Pj4+IMKgwqDCoMKgwqAgbWFwX3ZjcHVfaW5mbygpLCB5ZXQgdGhlbiBhZ2Fp
biB0aGUgUDJNIHR5cGUgaXMgc3RhbGUgYnkgdGhlIHRpbWUNCj4+Pj4gwqDCoMKgwqDCoCBpdCBp
cyBiZWluZyBsb29rZWQgYXQgYW55d2F5IHdpdGhvdXQgdGhlIFAyTSBsb2NrIGhlbGQuDQo+Pj4+
DQo+Pj4+IC0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMNCj4+Pj4gKysrIGIveGVuL2NvbW1vbi9k
b21haW4uYw0KPj4+PiBAQCAtMTU2Myw3ICsxNTYzLDgyIEBAIGludCBtYXBfZ3Vlc3RfYXJlYShz
dHJ1Y3QgdmNwdSAqdiwgcGFkZHINCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzdHJ1Y3QgZ3Vlc3RfYXJlYSAqYXJlYSwNCj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2b2lkICgqcG9wdWxhdGUpKHZvaWQgKmRzdCwgc3Ry
dWN0IHZjcHUgKnYpKQ0KPj4+PiDCoCB7DQo+Pj4+IC3CoMKgwqAgcmV0dXJuIC1FT1BOT1RTVVBQ
Ow0KPj4+PiArwqDCoMKgIHN0cnVjdCBkb21haW4gKmN1cnJkID0gdi0+ZG9tYWluOw0KPj4+PiAr
wqDCoMKgIHZvaWQgKm1hcCA9IE5VTEw7DQo+Pj4+ICvCoMKgwqAgc3RydWN0IHBhZ2VfaW5mbyAq
cGcgPSBOVUxMOw0KPj4+PiArwqDCoMKgIGludCByYyA9IDA7DQo+Pj4+ICsNCj4+Pj4gK8KgwqDC
oCBpZiAoIGdhZGRyICkNCj4+PiAwIGlzIHRlY2huaWNhbGx5IGEgdmFsaWQgKGd1ZXN0KSBwaHlz
aWNhbCBhZGRyZXNzIG9uIEFybS4NCj4+IEl0IGlzIG9uIHg4NiB0b28sIGJ1dCB0aGF0J3Mgbm90
IHdoeSAwIGlzIGdlbmVyYWxseSBjb25zaWRlcmVkIGFuDQo+PiBpbnZhbGlkIGFkZHJlc3MuDQo+
Pg0KPj4gU2VlIHRoZSBtdWx0aXR1ZGUgb2YgWFNBcywgYW5kIG5lYXItWFNBcyB3aGljaCBoYXZl
IGJlZW4gY2F1c2VkIGJ5IGJhZA0KPj4gbG9naWMgaW4gWGVuIGNhdXNlZCBieSB0cnlpbmcgdG8g
bWFrZSBhIHZhcmlhYmxlIGhlbGQgaW4gc3RydWN0DQo+PiB2Y3B1L2RvbWFpbiBoYXZlIGEgZGVm
YXVsdCB2YWx1ZSBvdGhlciB0aGFuIDAuDQo+Pg0KPj4gSXQncyBub3QgaW1wb3NzaWJsZSB0byB3
cml0ZSBzdWNoIGNvZGUgc2FmZWx5LCBhbmQgaW4gdGhpcyBjYXNlIEkgZXhwZWN0DQo+PiBpdCBj
YW4gYmUgZG9uZSBieSB0aGUgTlVMTG5lc3MgKG9yIG5vdCkgb2YgdGhlIG1hcHBpbmcgcG9pbnRl
ciwgcmF0aGVyDQo+PiB0aGFuIGJ5IHN0YXNoaW5nIHRoZSBnYWRkciwgYnV0IGhpc3RvcnkgaGFz
IHByb3ZlZCByZXBlYXRlZGx5IHRoYXQgdGhpcw0KPj4gaXMgYSB2ZXJ5IGZlcnRpbGUgc291cmNl
IG9mIHNlY3VyaXR5IGJ1Z3MuDQo+IEknbSBjaGVja2luZyBhIHZhbHVlIHBhc3NlZCBpbiBmcm9t
IHRoZSBndWVzdCBoZXJlLiBObyBjaGVja2luZyBvZiBpbnRlcm5hbA0KPiBzdGF0ZSBjYW4gcmVw
bGFjZSB0aGF0LiBUaGUgY2hlY2tzIG9uIGludGVybmFsIHN0YXRlIGxldmVyYWdlIHplcm8taW5p
dDoNCj4NCj4gIHVubWFwOg0KPiAgICAgaWYgKCBwZyApDQo+ICAgICB7DQo+ICAgICAgICAgdW5t
YXBfZG9tYWluX3BhZ2VfZ2xvYmFsKG1hcCk7DQo+ICAgICAgICAgcHV0X3BhZ2VfYW5kX3R5cGUo
cGcpOw0KPiAgICAgfQ0KPg0KPiBJdCdzIGFsc28gbm90IGNsZWFyIHRvIG1lIHdoZXRoZXIsIGxp
a2UgSnVsaWVuIGxvb2tzIHRvIGhhdmUgcmVhZCBpdCwgeW91DQo+IG1lYW4gdG8gYXNrIHRoYXQg
SSByZXZlcnQgYmFjayB0byB1c2luZyAwIGFzIHRoZSAiaW52YWxpZCIgKGkuZS4gcmVxdWVzdA0K
PiBmb3IgdW5tYXApIGluZGljYXRvci4NCg0KSSdtIG1lcmVseSBhc2tpbmcgeW91IHRvIGJlIGV4
dHJhIGNhcmVmdWwgYW5kIG5vdCBhZGQgYnVncyB0byB0aGUgZXJyb3INCnBhdGhzLsKgIEFuZCBp
dCBhcHBlYXJzIHRoYXQgeW91IGhhdmUgZG9uZSBpdCBiYXNlZCBvbiB0aGUgTlVMTG5lc3Mgb2YN
CnRoZSBtYXBwaW5nIHBvaW50ZXIsIHdoaWNoIGlzIGZpbmUuDQoNCn5BbmRyZXcNCg==

