Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 727AF6405A4
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 12:18:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451864.709660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p142q-0003ru-Nz; Fri, 02 Dec 2022 11:17:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451864.709660; Fri, 02 Dec 2022 11:17:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p142q-0003ov-KU; Fri, 02 Dec 2022 11:17:28 +0000
Received: by outflank-mailman (input) for mailman id 451864;
 Fri, 02 Dec 2022 11:17:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w4XS=4A=citrix.com=prvs=328b81dc6=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1p142o-0003op-FS
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 11:17:26 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4b9d6b5-7232-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 12:17:24 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Dec 2022 06:17:22 -0500
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by BL1PR03MB6055.namprd03.prod.outlook.com (2603:10b6:208:31b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Fri, 2 Dec
 2022 11:17:18 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::5d4b:6b1d:efc2:20e5]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::5d4b:6b1d:efc2:20e5%9]) with mapi id 15.20.5880.008; Fri, 2 Dec 2022
 11:17:18 +0000
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
X-Inumbo-ID: e4b9d6b5-7232-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669979844;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=M+PpOz/w0krcXzk9q6fWnqZiorLkvvghLPXqrn4NDzQ=;
  b=XubSvW7Lgp+3x1fqZNw/sXz57//D0wzvQsLMW9sv/uri0dQwFWzEd5p3
   6SvkFEsrT0vIJDvSw9x6QYD+AUHdE4321T7iVy85GEGGtrpNzcCetqsto
   eIqCg7TIGSgS3+prpVOsru2wKK6HLx1BymZf6FCXyxeV3/BwiSnC0L8ox
   4=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 86244060
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JdhIe6t4SFZG1gXcCflZd2yBMufnVNpfMUV32f8akzHdYApBs4E2e
 1ou7Vv2eabdPDOxPpsjdtz1pnqyiuaDnYNjSFA4/H02FS4T8JbJCd6SJxn7Yi7OJ5LNQR8+t
 shBNIfNcp85FnLV/BnxaeS5pHUk2/HTS+CjV7TJZ3opLeMIpF/NrDo68wJuqtI40bBVej+wh
 O4eg/EzGXeoijUuYj4a5ayI9Rgy4Kmvsm8TsgFhPK1B4FSPyiYbXcNDKfm9IUWjT9gPFIZWZ
 QphIJKRpTqFokh3WrtJtp6hLyXml5aLZVDmZkJ+AvTk2V4a43Roic7XDdJEAW9PkTKFgttt/
 9tEsJ20WG8BM7bF3e8QSHG0KQknVUF90OKBcCbXXfC7lRWcKSK2m682VinaAKVDkgpJKTAWn
 RAnAGhlgiCr34qe3L+9Q+9wscUvROGD0FQ34ywIIZnxVJ7KcLibK0n4zYYwMAQY36iiKc32d
 csBAQeDWTybC/F51vX7P7pl9AugriGXnzS1Mzt5r4Jvi4TY5FQZPLQArLM50zFFLClYth/wm
 47Iw4j2Kkk3C+GG9GOGyXvyj/LpzHn5cb1PTJTto5aGgHXLroASIDs/cALi5NOf2gu5Ud8ZL
 FEI8C0zq6R07FasUtT2Qxy/pjiDowIYXN1TVeY97WlhyIKNu1rfWjdCE24HMYJ23CM1bWVCO
 luhsN7uHzNi9pGIT3aU7p+frC+oODhTJmgHDcMBZVtbuYW/+N9r5v7JZtV4PPftk4LRIArX0
 SCKjxFliIgd1+degs1X+niC2VpAvKPhQw4440bHU2SN615hIoWiYuSA+VXdqPpNMoudZl2Ap
 2Qf3diT6vgUCpOAnzDLR/8CdIxF/N6AOTzYxFRpT58o8m30/2b5JN4ApjZjOE1uL8AIPyfzZ
 1Pesh9Q45kVO2a2aahwYMS6DMFCIbXcKOkJn8v8NrJmCqWdvifelM2yTSZ8B1zQrXU=
IronPort-HdrOrdr: A9a23:S3V4Yqns5DAYiYkWa//WIq75nxbpDfMXiWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WBjB8bZYOCGghrjEGgG1+ffKlLbakrDH4JmtJ
 uINpIOcOEYbmIKwPoSgjPIderIqePvmM/HuQ6d9QYVcegAUdAD0+4NMHf+LqQAfngiOXNWLv
 qhz/sCgwDlVWUcb8y9CHVAd+/fp+fTnJajTQ8aCwUh4AyuiyrtzLLhCRCX0joXTjsKmN4ZgC
 f4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GKN2QhtMTIjDMjB/tQIh6QbWNsB08venqwlc3l9
 vnpQsmIq1Imj/sV1DwhSGo9xjr0T4o5XOn40Sfm2HfrcvwQy9/I9ZdhKpCGyGpqnYIjZVZ6u
 ZmzmiZv51YAVfrhyLm/eXFUBlsiw6dvWciq+gOlHZSOLFuKIO57LZvv3+9Iq1wWR4S27pXVN
 WGy/uso8q+RGnqLUwxeFMfhuBEEE5DRytuCXJyx/B9mwIm4EyRiXFoivD3101wiq4VWt1K4f
 /JPb9vk6wLRsgKbbhlDONEWsevDHfRKCi8eV57sTzcZd460l/22unKCY8OlZeXUY1NyIF3lI
 XKUVteu2J3c0XyCdeW1JkO9hzWWm2yUTnk18kbvvFCy/bBbauuNTfGREElksOmrflaCsrHW+
 yrMJYTB/P4N2PhFYtAwgW7UZhPLnsVVtETp78AKhqzi9OOLpevuv3Qcf7VKraoGTE4WnnnCn
 9GRzT3LNUo1DHeZpY5ummlZ5rAQD2NwXsrKtmqwwE68vl8CqRc9g4IlF+++saHbTVfr61eRj
 oNHI/a
X-IronPort-AV: E=Sophos;i="5.96,212,1665460800"; 
   d="asc'?scan'208";a="86244060"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3nxhp9mnTf05TlbreynxAhg1DsP4pyC+k1+YhEJcPxSSIMxnSeN6xdeZ0b98IWYIaQH19CJzwu4fnaArtdqBpm56Wod5UciXScE/VWBAlTOwVU3zDXn02HjUycEe99Xts1oEHVWXjMllu6rNKHh0BF4M5ga+DO12T5Wuzb01DfQs/q/CDZrZOf40VhpOlEmOyCOCegh101p4NDBprfUHo1Uu0jNn3QuiLEgImcCq2Z3nS4nviJ/Wkwg4Tke35ozmyCFMxkC0aR7gyYtrCl8yYlZIp4UrWWN+cp8of7kQM6qQ5ZtguSeEW4eMfBvzoHrB5H53PHJeg5sRAkdie8l2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipNbEsn4yy/aIoQQ4p2/urTkPpOXt4vE5E5tcea4LrM=;
 b=To8SKBtiBhi1I4ijksMpFScutiAwyqf5OxfX1GyzpP3Fy25NnegonEPzQ8J1NZdYQr46V9nnZZjCaRnjguNbcrgW7GwVCWiXq8ZiGVec5v/xD74J/yRzMXIZn0REWBQFBkDKhWNhD7v3IhBOawod+OrReT50GKrqmHPM7orlbgkXZtx9+s7kFzqcfYX5VvVA813tdZhDfSTbDhYqiH3TTYJ9HtvNLS9Lmzj+eMDE2KYaWPwHvEHxtQyl/2SKqLulVlM4FHCZphoVbTXF1hJ74UHd/qChTR8/mrPQkl9dXFU3rvVI4UamAQMLpJWIxo5JycSZcTGDWnqpjb2OXOLkNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipNbEsn4yy/aIoQQ4p2/urTkPpOXt4vE5E5tcea4LrM=;
 b=uCKWc2YLe6sXTehjtXv3Y1/uKa1bzs3v5UAEZcUKZenZ6s6mjl5CMtsemOOrvj5gKps345Kr8HzBFnkwAKX0drt3BTMEIeF7lRY0ZGJWb5Fpv2o4mBDNlpEfFteiHn8A7bn+AbC54vJfcl9imMWHA3Ur9Y3NVUdC+mjhQtEweo0=
From: George Dunlap <George.Dunlap@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [ANNOUNCE] Call for agenda items for 1 December Community Call @
 1600 UTC
Thread-Topic: [ANNOUNCE] Call for agenda items for 1 December Community Call @
 1600 UTC
Thread-Index: AQHZACfPFcfU+bc3t026q3xIEXKCXK5Zn1CAgADfoAA=
Date: Fri, 2 Dec 2022 11:17:18 +0000
Message-ID: <A28E972F-8F8E-4370-9BCC-A56E8D19674E@citrix.com>
References: <Y4kjIaU6PxrR9UcB@mattapan.m5p.com>
In-Reply-To: <Y4kjIaU6PxrR9UcB@mattapan.m5p.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB5669:EE_|BL1PR03MB6055:EE_
x-ms-office365-filtering-correlation-id: 7c21bc78-f3f2-4884-5ecc-08dad456c65f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 2uwEW6SIJ8FLVKjW/zkj2qXAFgBWjNRToE1QM3TGl5zlze64VHeeOgppPQQzzY+ldFv5CoGorh9S31jam1VdPdZMCd/beSfqk0E5+AS1r52LXmJN8l3KlBwajH9DZQkY+ftizrSpqIzM/sSUF9MtuO7gRe0Gm67xcR4joQ9g97rhM4HIV6m/bansrRp4C110EJaV651xMivW0eQ6dW95HbgVDkM9wEfSmrlLXpzvVlzGz4olDUZQYHgA6QsUfgbYwib1nowWGIksAV7ezZDnpu7GN7WUbpbB8qNAdQqYAV6Fl5xY5SIGKsH6pDJV01QMgxDLp74jEO/mLhqjDOis3gf528rosqONoKZJSUZGBvyJ901KqyjZV8AYPhLmV1YRdk04BXz316i9Z+Bk2DxvjgB2YVKidCOXGd6zt9S4lCPs39UHLVIcNYT4u6/ATW7ceZ1/pk54j7q5XaOKcc10ULCePBt7zZEd1firbSPY7PUX4hz1iklhd62oH+KuQkeuCZX5UZZUQ/xFBB60/JIB+4LruHr15oIRHXP4wvNT8H1Kxv709bee2FwB3+/kW1FHiOELzS6J3MjZVSYsIpoBWP65DXLjEKMq86yWYCdu6sL7/L97NoR7pERCor1tP/r2AHeQius1b6TFDvRnqZ7ygRiIM//H4kjHpaD1mzj3CXy2UrflYth5grS4BMfHCg05dq7R+6WZ35SuxpHaU0J+uUhMfVmcd1hRu4rvkJ951SVkFgIEMjGjOeiISDyA6RujSnnlI+e0PY9S25MqiPzKt7X2CqEfgqIQ1KvKIDKU15t+ai/CkwyvFjiuU0cb1A5Z
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199015)(66446008)(83380400001)(86362001)(99936003)(122000001)(5660300002)(82960400001)(66946007)(38070700005)(38100700002)(4326008)(41300700001)(2906002)(8676002)(26005)(53546011)(186003)(6512007)(6506007)(316002)(2616005)(66476007)(66556008)(76116006)(966005)(6486002)(91956017)(71200400001)(33656002)(64756008)(478600001)(36756003)(8936002)(66899015)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Vk5EeGJ1QTlxRk8zTWxoUVBEVFdSb3dtYUxTRXBYanhnQ1RYZXFlQjdPM3l4?=
 =?utf-8?B?QXNLWGpWYUtxei9ObitPMjlMdzJUTDdrQVpmTFNwUlAzaUFmSUJEM0Z1MEtE?=
 =?utf-8?B?NGtvWXo3alJxMHRoUHJkWEpCSmwzTUdGNXBKNVJ1TFBPM3IrcFhMR0tmUXE4?=
 =?utf-8?B?ejEzeThVS1ExbUhpSXY5akVoaDIranBidFp5bGpRSEhidVljejZGVTk5VU8r?=
 =?utf-8?B?V1lveWw4bmdnSWNObVpIKzU1STRsdElqOXpMTy9RamJtVGRZNVhlK3JjUWp3?=
 =?utf-8?B?dzRtTnBkTWs3NVZUR2FuN3RRbW5UT1pEa1hxTTFWUngrK3c5aGNkWGZlZXRJ?=
 =?utf-8?B?L3dNbkZGSnZYZkVTWnNVNGJXRHF1d2QwWmxpYjVTWnFTR0hzSk03OWFRQTA5?=
 =?utf-8?B?ekltemhockJjVGdtUDFKL3VJOEprMXNnNWhYWG5uVEcwaXdCZDNnUTFUYnlP?=
 =?utf-8?B?VnRMRUNyZ3phWWpmNmRMeTZBOFVzSTAwMXBKMmNzazlieFFVaE5KeWpaTnAz?=
 =?utf-8?B?SC9mMU9YSEpKZE1PVmtHOWZ4SUtYMG0zdTNDTmRvN1ZveUxxejc3czcxTVo3?=
 =?utf-8?B?Vit2ZGcvL1hHdnByTlBzanN5RjlGQjdqdXdzWEdJNDMvdWdwNHNZb3dGd3po?=
 =?utf-8?B?RzgxdE43dUh3MFhaeE1tSzdKQkVyZWVzK3hhaU1Nell2NEd0SVhCcUdndVNT?=
 =?utf-8?B?STF2eUVsOE1OSHdBYmx3ZWlwUzl6eFcyNStmY1JKektBSFV0VkZUYjV6V1BC?=
 =?utf-8?B?T2tmQU5jcHdYQnVpMWJPVzQyQTBiV0lwN0o1MmRmYS9iVVN6ZHJ2L2MwZE10?=
 =?utf-8?B?R0hjSm9yZGpqRTd3L0M0bU9XR0tLaGZqOXBLK1hJdGFORWtKT3dPVmtZSWNJ?=
 =?utf-8?B?ZVRKb1ZJeGNQY3NLdFdxTFErSjM5bVI0VHMvRTByVy9FeGE0NEJESnphbTZk?=
 =?utf-8?B?ckpSMjNGdkE2YmljOUVnRnlUR2VPMWxDYUN6RlFZcVpuNmwzbk95bWo1N0ZQ?=
 =?utf-8?B?VWl0MkMyZXlvVDh1TUJxWC9xV3FLc3dwTm1KNUo2NFRIVEIvTnR1Uy95bEQ2?=
 =?utf-8?B?UEpLcGJzdlhoUDhGTGsrdzB5bGRVSWYrU3J3eE91enl5L29yWHdBaURrZlJ4?=
 =?utf-8?B?NVRKMWUxb1hUQy9lNWZKSjBmMkdnWGdXZUs1ZUt5ak9FdGt4cGRkTk9LK3FP?=
 =?utf-8?B?MGZBTG83OEd5NkU1eThzdUYyeGR4ZHNud2V3Z3ovMFRySENXdlZUb2NPV3kw?=
 =?utf-8?B?M2x4eTJtckhDVkZTZFdxWmxMWFBoVGNzelFvazQ3TlQyZ2Z4c2UrWEkxMzd5?=
 =?utf-8?B?eEF0MTYxTkhCV3V0R1A4RXE4TWNGTzNBaUlERWM3eUVuYXhvZ0FCN3ZwR0Y3?=
 =?utf-8?B?RTZzY29SWW50M0ZNWmVuVW5XenU2VEROblRGbjRkckh1cmZOUnp2d201aUc4?=
 =?utf-8?B?UVI4Rm1EaXFNc0U3SXFJWHNGTFJVWkJuNkxEdmRlTGlNdUJaeCs5SnI3dFJ4?=
 =?utf-8?B?eTVIWVRjcFpTbzUzZllqdWJNcjBtMDVRSmhkaTY2RndZR2FzME1BekVnd2VQ?=
 =?utf-8?B?anVxczZZMnBTYWI3VHNwVGIrNTRvQWM4ai83cE04NHFkakV2YWpnYmZVb3NQ?=
 =?utf-8?B?eUpvajV6TDNtVjJYb0tBdE94dWZVREtFakN2WFFmeWVFUzNneFQvaHZvbDZY?=
 =?utf-8?B?ZzNMTHQyS0pweW5wWW8vYU1Da1pBbEJHbHEydlBJYzl5dG9VSFpBREQ2MU9Y?=
 =?utf-8?B?UmhOZ2JCTVgzUHp0eENCc3J4UElubVgwNXlhb3Q4MWlHSzN3WDRtSkEzUEpE?=
 =?utf-8?B?OG93aWtUVjByNng4anJmdW5QZE5WOFc4aGNtUlM3dFhpRUJ3eUU5d3A2dmM3?=
 =?utf-8?B?R21qaVh6TDg1MXVLSjJJNVlyeTd2dE94VTJvNEdFMEg3bFoyVFJZaFNtSGZD?=
 =?utf-8?B?eXE5dDUvSTUxSTFFb28rY2g4VVBUUW1zMXVaYUcxc25iZWZPU3hCZEZLclZw?=
 =?utf-8?B?NzdIK2VOV21TSFhoMmNESUo0NkpMczZRVWFvb1pUSXZKWE9MZGdYQ3hTajBD?=
 =?utf-8?B?eVFRZ08zcDA1KzNUOXREK2NtVDVsUTZXN2daZEFySWk1UzRlZjI3b1Qrc1pH?=
 =?utf-8?B?d1h5SXpUSTBJYUYzb2NFWTZHcVdhOFMxVjFxUGpIMFA3SnhxTnNsNXFsVEkv?=
 =?utf-8?B?cXc9PQ==?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A6179C39-7E41-495F-879E-BBB709FBFBAA";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CoROZDFugG8l1OCcJ/G3qut36A5470VXZq9Zl23+Uv1ieOR8OcvM2CyQhHdFmo9ng1Kd2DBdjxmGcype872O1sF7v6sVrOxJGQX+3ywlJu9B7sP9rnt8sOuxNgDeOHs3qIuj4vPo0h4vAiawZJ5zQsIX5elo+YDQ/2hLKCY4G+WhGAu7ed3gDyIhfGX3VAuGZI4tINhMHQ6tFWaHIkJUSElIG4t4S2zhssg8/KgAMx+EFrgcZyMfEloOSyXVugjSdS6rUGtkbczQqc4ewHmbGEevElclUHjcFQrJQg6inIuRyjJOIFJmdCXWrjhkoz0PXSNCDCqvIKvzapcSH9C46rcUzI2mcQCO/speNhfUBZT/79qP+6TZ9VJjAMToXMcBWgyfft9zn8I61G4t/VW8ZKIFYZ0BtiF4L5IEQJ94siDMTNqU+RbZYdOT6UJzBtDnKEG+RDJSIirLNYHMH4JrWrbAMm7auI1QDas7An3s0THJdz+gN6ivCNGGadj6q6eCa42Yw3RXZgEKjTBteiAoPLUI/VKI/izEB9+2em2L8Sin6unhsX6DogErJmo1OL2d/Puup+b5VYgNlfbbu6T7dBS1ygAQVrTZPtWiRC4Ut4VCOPgfsyNkUvPmufFpUMaNn/fwPQI6yr6XHbAfQWCneBGWcX3BISstEpCs0jrs2767NrfGLz0sD0JZKzDexXcPNcLLA9mj2YF71PPMPibP0LRoqDIzARK77VMj49BC+ghSKGIGwI9/ftJL/4Ux56lFKfaNJU53cLpvjs3CuNilHG6u2zx3Kid0ngwwBkCHUY4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c21bc78-f3f2-4884-5ecc-08dad456c65f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 11:17:18.6135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KrvTF2t8DA2ERv1IdclnHKfDlWXe5GbTAPTJBHVRCBXjAn2VRZEO3tEihte58NWSiFah1w91VYZJfg3nqiFavMHppubD0WR5hhgzlRtVhKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6055

--Apple-Mail=_A6179C39-7E41-495F-879E-BBB709FBFBAA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 1 Dec 2022, at 21:56, Elliott Mitchell <ehem+xen@m5p.com> wrote:
>=20
> On Thu, Nov 24, 2022 at 05:11:36PM +0000, George Dunlap wrote:
>>=20
>> =3D=3D Dial-in Information =3D=3D
>> ## Meeting time
>> 16:00 - 17:00 UTC
>> Further International meeting times:
>> =
https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2022&mon=
th=3D12&day=3D1&hour=3D16&min=3D0&sec=3D0&p1=3D1234&p2=3D37&p3=3D224&p4=3D=
179
>>=20

Ellliot,

Thanks for your feedback.  Replies in-line.

> I guess I have to ask, what is the goal of the Community Call?  =
Neither
> this message, nor the wiki page
> (https://wiki.xenproject.org/wiki/Community_Call) say much about the
> Community Call.

The goal of the call in general is just to talk about things that need =
talking about.  We obviously have the mailing list, but sometimes =
discussions here are easy to miss; and sometimes a discussion can get =
sorted out more quickly with a fast back-and-forth than with long email =
chains.  The intent has always been that if we start getting one topic =
that consistently 1) takes up a large amount of time and 2) only =
requires a subset of the attendees, to split it off into a separate =
meeting.

> Varies from place to place, but many places meeting times are more
> aspirational than ridged.  As such I felt rather disparaged by being
> careful about time, but no (obvious) effort spent prioritizing items.

It=E2=80=99s been quite a while since we=E2=80=99ve run so long.  I =
don=E2=80=99t necessarily have an objection to the call going long if =
people have time, but in this particular case I personally had to leave.

We have, in the past, continued a long-running part of the discussion =
past the end of the time; and once after I left and a handful of people =
stayed in the room for another hour and a half continuing the discussion =
they had started.  In those cases, it was clear that the people key to =
the discussion were willing to stay on later.

At yesterday=E2=80=99s meeting, I could have asked for a volunteer to =
run the meeting after I left, but as Andrew was also leaving, and a =
number of the subsequent discussions required either me or him, it =
wasn=E2=80=99t immediately clear that this would be fruitful.

> This seemed to be being pointed out at the end of D.3, which was meant =
as
> low-priority, but was dealt with first purely due to being added =
first.
> Then most of the time was spent on D.4 when D.9 actually seemed a =
rather
> timely issue (the idea to get a bit of consideration before 4.17).

To be honest, part of my reluctance to move that one up in the agenda =
was because it was my own item.  Even with the number of items ahead of =
it, I didn=E2=80=99t expect it to be a problem to get to =E2=80=94 there =
were several items which took much longer to discuss than I was =
expecting.  In the future I=E2=80=99ll be more pro-active about trying =
to prioritize things.

> Problem with D.1 being at the start is it was unexpected half the =
agenda
> would be thrown in the garbage due to time.  Could I suggest the 10th =
as
> better?

The 10th of January instead of the 12th of January?  Why is that better?

I work as a stay-at-home dad on Tuesdays, so I wouldn=E2=80=99t be able =
to chair the meeting if it was on the 10th.

Hope all that makes sense; feel free to come back with further questions =
/ recommendations.

Thanks,
 -George

--Apple-Mail=_A6179C39-7E41-495F-879E-BBB709FBFBAA
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmOJ3rgACgkQshXHp8eE
G+2Hngf+NrLMVgbF+5Tj8VRGQrid2GvjG1+VAL+YwP5BuUP0Q3GVta9/H4WPuF+V
TT29Np8mdy0jYxKnlOwIObPajgPvprdrzzILWqIprp4qxTZr/OB1BHymyFIEF5vO
lvcAhQMt4JZGJ3OyTTMY1ZBWXQv68N8YlhFe9+jzMKhLqydStJ/lNg25JQ5umJYz
0jjhX2z2BJHs3BlC6FviBxPmN8yyqeApK5QtWUYSkjqLqlsfJ/hoygBJEkXEBaYN
1O1FrTyJ7I1dYq/cxkEfxP4bQL2jsNhj8MrvgZ+JyrLfUNpqGUsETSjuRGE3p96Z
Y32XUXdWsraiUGiIe0Z422mCgnzvbw==
=VKuz
-----END PGP SIGNATURE-----

--Apple-Mail=_A6179C39-7E41-495F-879E-BBB709FBFBAA--

