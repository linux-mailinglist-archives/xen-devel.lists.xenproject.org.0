Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2907F675CAD
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 19:25:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482076.747403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIw41-0005kO-1C; Fri, 20 Jan 2023 18:24:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482076.747403; Fri, 20 Jan 2023 18:24:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIw40-0005ig-UT; Fri, 20 Jan 2023 18:24:32 +0000
Received: by outflank-mailman (input) for mailman id 482076;
 Fri, 20 Jan 2023 18:24:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vlkl=5R=citrix.com=prvs=3778cfab1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pIw40-0005ia-IC
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 18:24:32 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac9c3939-98ef-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 19:24:29 +0100 (CET)
Received: from mail-dm3nam02lp2049.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jan 2023 13:24:20 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5050.namprd03.prod.outlook.com (2603:10b6:5:1e8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 20 Jan
 2023 18:24:18 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.024; Fri, 20 Jan 2023
 18:24:17 +0000
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
X-Inumbo-ID: ac9c3939-98ef-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674239069;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=NgQSqVDP/1CKKX5qck6RM2o3MN4Im2tSBUeM6n6PiHk=;
  b=Kr9S/RSb8Q+BXZnNTZ9mkHieFTPBOzDixtQgM9E9TAmK1EzE04cLRg7a
   N6Yd4MJ3GqV90rp4CAesoD/aYXzbp4nOv1X0s1nveLNKF0luW7tFMNtLR
   DKwEu85/+k9fFdDNBJ5l10xrwICkSP7yaBajmlJC2FdhFYAZ+k2oBk+aP
   w=;
X-IronPort-RemoteIP: 104.47.56.49
X-IronPort-MID: 92463461
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Nh2Dxa4mYRb/U19oZ1w3MQxRtPPGchMFZxGqfqrLsTDasY5as4F+v
 mdJCGrQO6uDMGrzft9+aIjj8UpXvpLcytM1QQRupXhjHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPakR5AeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m0
 s4SD2k1YUm4wLi7n6CWE8xcvvs5FZy+VG8fkikIITDxK98DGcqGb4CRoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkkotgdABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCdhOSubkqKcCbFu7ljw9NyAbCmqAgcbom1SDZ4JOd
 Ase0397xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnM08SCEu1
 1SJt8j0HjEpu7qQIVqf67OVoDWaKSUTa2gYakcsVhAZ6tPupIUyiBPnTdt5FqOxyNrvFlnY3
 DSivCU4wbIJgqY2O76T+FnGh3ego8PPRwttvAHPBDr5v0V+eZKvYJGu5R7D9/FcIY2FT16H+
 n8Zh8yZ6+NIBpaI/MCQfNgw8HiSz67tGFXhbZRHRvHNKxzFF6afQL1t
IronPort-HdrOrdr: A9a23:md8sGqw1bKXpjcDrZJf9KrPwO71zdoMgy1knxilNoH1uA6+lfq
 WV954mPHDP+VQssQ4b6LW90cW7LE80lqQU3WByB9mftWDd0QOVxedZgbcKqAeAJ8SRzIFgPK
 5bAsxDNOE=
X-IronPort-AV: E=Sophos;i="5.97,233,1669093200"; 
   d="scan'208";a="92463461"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SeyPLI5aCGfIiyLgC/zkqd0YP7OmEEY6PgaQhfnA022e6kuqQkMP59i6VoW3ugmrXmCUpXcnXO2XOY2lDjdjypqaJ7qM6QRiAgo9T1qfaBSG6LzrMXiWFkCZ2Qyqway4RA/OyIF/YEl3AW0rmCv4bAOqRh14tiNLLv/LyJQ7rP+X26RtMq3vH33vjvJmN+uli2iKQbdauRvHQ3ZkZAjIxYm3ZoyZNDUNjCPoy7zq9Sazws55aepEqVqcpRdgVtvUDjYoX5uAssmYy2jpPszw4e0qfSVJ5T5VgEfK7Z4hTOIkfwodE4MvD0whB4MlOS2TI2bOLjAVqhE94o7DgkVgvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NgQSqVDP/1CKKX5qck6RM2o3MN4Im2tSBUeM6n6PiHk=;
 b=M+2eDM5N1d+A3NNcUYGFEynAWsyBp2aTPPNLmpp5gvsITvk4QrRwIiEaXuDza2+lkrPNWTsKjoS2y4P0R/yZXP32iJ8huCt+Z5hod3Qf1alh0HNoezx5nxXTyQXeufoxXXU+Sc9SQW/xdBpBUiUojKiK3+vjaB07uTcwAOLUZ5D6PJ60B45b6B+aaQLH9HGBkldPVeAJNzsI/eA4ePNwwZl4zrL0mJjWELLXJdUF+BLBWAnjoVV+6sNu4JNNy9WVvqvPz7F0MTJMB7v1/xPowSzyuNvaz2fa36ZumNZp+S8dndp1rvNknG86HarMDwrg/WwfhwyxccvwvV4g9yoQ6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgQSqVDP/1CKKX5qck6RM2o3MN4Im2tSBUeM6n6PiHk=;
 b=fzIL1VDWj8qvR9C5caS4od3Ggu3bFjsbAOGAJYDQCbpF0t9BZpHQWOSlZPHGzFXHPQ494jjF6ZLLmcLn4+vmDeW5dTcnZWgrsbvHW52UpzgNdwiuue+rC4f3QuFtVRrsemI0vYhhxYPYvkFbid9T0rRrn2b/8gzARKf0xDUgVSc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v4 2/3] build: replace get-fields.sh by a python
 script
Thread-Topic: [XEN PATCH v4 2/3] build: replace get-fields.sh by a python
 script
Thread-Index: AQHZLBn16yskFr/tykaq4ezXFz5nWa6noJuA
Date: Fri, 20 Jan 2023 18:24:17 +0000
Message-ID: <04e0bc84-7e55-1a10-ea31-ddcf4291bc50@citrix.com>
References: <20230119152256.15832-1-anthony.perard@citrix.com>
 <20230119152256.15832-3-anthony.perard@citrix.com>
In-Reply-To: <20230119152256.15832-3-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DM6PR03MB5050:EE_
x-ms-office365-filtering-correlation-id: 22751aa7-73ef-4880-3159-08dafb138ac4
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 86h6gi4izLwNmzUrVuHEkAPgIyMmIPh9Rf+TzZxyadGGxFvgjQlxRsYszBTFo06V7gvHCY/jeZc6iqojLeeA6zcGYwDpwbYnIO9vfZTj6Yj+NengkLiI4Cmmyaj+LnM1/zGGpv9RI9I7UPC4wKUGUVGon4hqA1DaMo3X/dtysMe39eQDAozbH6ZgwPFMdoyQvXkMAoC5LxuCoLu7/HMN6i+QsEGach20yZZR62pF6ln/yZiXJKaIBNa14UURs2sN88ReYGTPVGB7K93axfUZTJIVKbrgyk3WOo29f8xcy7mgX0gSnVRJDgVfoxFKroDEQmMQwlk0DipgKvfi1SF10ha/lR0pzXMngg1I7zcDoaSQpgP5xuz4CkDgMqVTnnvoX2ho0FgE0U4wNRyfH0j6gQFZHQN6W+BBuD2Ubsu2sSsB4cTHXWLnHNTl7OGaF6SLk9lezi8C5sNh3B1NAM/et6ZXXsymcPI68pXRbY50eO9b4SN0OYaS2HHPWGNaT+QCPSdA2mTvNFk/6OBroa4Bb2nWyJpJyacNDYh/ny0OEg7zSz95fWM5uiQtrGhrwdJWfT3J80n6mOtZ2m4zlnm7Dh/chICre5/ljrmwPJFln2vdjEoFhU6FUse1cAHXuY9NrJmostC4BjVh2ZEepur6F99MMXJ7teip8ch8eXLfc/jMbzWhGJJVRzAiQNWrFGtqZ10joOOPKt59EjHWqL8Bf1aRFcdczByyrgaakqyQZvJpayWG4/q9Z1wub8zfqMo6Cu/rSu32njPuHB6zGGCNPw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(451199015)(31686004)(36756003)(91956017)(316002)(66446008)(122000001)(31696002)(8936002)(38070700005)(86362001)(2906002)(66946007)(66556008)(5660300002)(4744005)(76116006)(8676002)(38100700002)(66476007)(82960400001)(64756008)(71200400001)(6486002)(4326008)(110136005)(478600001)(2616005)(6506007)(41300700001)(54906003)(186003)(26005)(6512007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZjdhRU5KTlBZMWk2MzMweTUvT294cTVzaEZUMEwyK214bUNqd3N4cGFBcENw?=
 =?utf-8?B?SDhSbzZHd2xsVHl1RE5Ta2FvU2J6TCttYk1VMWRSbU5wLzcxaGx4UHRJdnFa?=
 =?utf-8?B?K0tRdE9EVExwV0pxaFdnTGhtNlBuUkhMZUUwY1lvWGwxWDdFZkRUTUY5UUhl?=
 =?utf-8?B?bHpVK0dJL3pWSzBEWloyZld5NTZUT1FSeGVUdEorendKS0dCZnZiWE01aWNR?=
 =?utf-8?B?eFBxb2JQSjVENmZFeXkyZFNXeWdwcmk5S1dJTDNhdXc4ZnpTMlRzejlSWnMy?=
 =?utf-8?B?Vk1EcVJqYnJ6WGhxZkdMcUQ1NjMwMTFnc2tkblFrT2RYdjlibzIvK05IWGVa?=
 =?utf-8?B?aVlyWXNaVVVRcnNoQmZWdDM1Q1BNUmR2TWVaSitSTWlaU00vUEE0MjJ1ZnFo?=
 =?utf-8?B?OTljNHpGeldaZFcvSWhPSnUxZ0VDdzFZbllyUDZQSXZVVk9tS1NDZEQ5OFpW?=
 =?utf-8?B?eFdxSVphc1lWdjV3a05NeTRSV2tOc1BkZzM1UUFHekpJUGZnbWVNaWZSanM5?=
 =?utf-8?B?R1E5MHV3K215aFQxdmZnZHhDMnY3alJjZS9MSy9HZXgwc3BDUnBzcURCcWJj?=
 =?utf-8?B?M3FFQnhJR29yY3FrZFRSMnd2M3NROVFjb3ZLRmM3WDEyRVJxWEZBcWN5c0RG?=
 =?utf-8?B?aHJRY1o3MXFEcEYvSmdwMWFiMk9KVFArNE5LRVZ5cnVjbkRzUzE4VlRzTDhC?=
 =?utf-8?B?UTlPTkI0b3RCSFZPa2JNcHFielBHcnpMZWpsNWd5RGVpZXF2WGFQWUI5NHdS?=
 =?utf-8?B?UU43SkRlazU5d3BZcElNSngxUm9YSTh6ZnpZc2kvaDlPUFNYeGttWkFMNmZX?=
 =?utf-8?B?MkcrOWMvZFR1YkNrTEtINmw4MVVEUFdFMkFhcDZsTTUvaTAxUm5ZVU9scFU0?=
 =?utf-8?B?aXBvQVFyRmhpQTFTalpFYVRsNndxWUtGWUwrWWh4VGpnQWt2RUt2UmlRamtr?=
 =?utf-8?B?aEs3a2RqZzVreWxJakJZcFB4VXZsSk1taE1JTUhEclFRc3ByeEtaajVJSjBx?=
 =?utf-8?B?MVdkazlrWkNicWJoMmdNUzBCZjJJR1NxdkNsckpMcy9KQldVVXhhdFgyMndK?=
 =?utf-8?B?Ly9NWUJsMzNoWlFVT2FSSHNQRkRJSHRIRW1jTnJPQjdIZmJydWdBUjNJSmE3?=
 =?utf-8?B?UXVuYk5rdDBKWDhYVDdQaEpaWEpxM0pMMHBTcm5vbk1LY0IrQzQ1WGYxNDlq?=
 =?utf-8?B?dEhYRmhOblE3blpxeUZlcXRSdms3MkEvcE5GNlB5ejcvZm5SYXRscHQyWnFT?=
 =?utf-8?B?NFh2UlpIMkk2ZHJLbjdXTU84aHFmNnREMTBaRmdmbkN1Zk1teWFMZ1htL1FO?=
 =?utf-8?B?aGdiTW9LeklIOU1qTVcydzJtU0p2dmdwLzRVZ3RIZUp0RnhvaTVSRWF6cHZW?=
 =?utf-8?B?YUxydkNCUDdjM0VueXlqaU9VUlJHRGhLSHE0YVc0NEF3SENYcUJHUGhpdjRP?=
 =?utf-8?B?cG5XdVRjN3dkelEvWEpOOXdVb1gyaUI2RDR0bm05S0ZyZndncXR0a1dQMEc4?=
 =?utf-8?B?V25GOTh1Tlk2UnN3NDJubWZLZ3BaSEpYY2drL2RpUitBT3ArU3huUFEyaTBD?=
 =?utf-8?B?NG5WQUM4SUVNNDJjS0ZFVTZralVXUHlLc3ZmTGtsam9PQ3VTQnI4bTFETFlv?=
 =?utf-8?B?d3BBZEtmMDRrVzZOWkpwMklOYjdqWmo2bXRKRU84ZUhpSVhPN2Q2SUgybVZU?=
 =?utf-8?B?L0R3MGpUWWZyaVZucFZrd3gxd0h2WDFHaHVsTWZTUVNPTEE0cXUreE1STmY5?=
 =?utf-8?B?a3NUdDRFU2drdk5DMmpjYnJxdlRsMzFGMVVzcG03YnU2WUFqY0lhRGxKWVlx?=
 =?utf-8?B?SjRHcXpNeEJJcWs2b3J6dDc0OXRoT1JmWFNlTlRnbHhhL2hZZHlJczRjQUIx?=
 =?utf-8?B?alZBZVFRR3U3Wk5hQzAxZEhqYkxnQVB2UytEYXdrN2kwa0sxaWNOSG5IUUZJ?=
 =?utf-8?B?OXY5TnpTWjBYTm9KZkwvVjZvcEdjK0ZrTjMwOHBhQlRaQjJmY2lKZ1VhSk91?=
 =?utf-8?B?dnllN2VCRnZDdzVpZCtWd3pBK08xbmZnMk96S2hNTWR6S29PVUg3NEhkamdY?=
 =?utf-8?B?SXJ5MitobHhkbSs0bWtIYTZNU21SdnBIWW5qQzFnbU9SNE5sQnNiUDkwdUp4?=
 =?utf-8?B?bnN2Vnp3Wk1ndTNpS2NncmFVeU9URUlqbzFpbGtNMGRUeTBNUE5mSEM1ZTMz?=
 =?utf-8?B?emc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <48383C2DF8CE3E45A0F68953783CC595@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	c5ksXP2hkCKhQaXqdmCbiV4fyOtv8nvkj0nGRNbUpey+aF1/TM0zUpJr5dNn60mo9C508k8v/sjDPKFzs3lwrAqd0XaqG6GC4TqRdG2cYhIlGsLJfoYEchqV52rI0yf6sWC7c+SYGmCxxij2B1CvPUAyYCW7YMg9WZEIEDGXl1F6sw15cmuhbEyrkilXWEz4eRa53g3hxgIY4mRuBYIroBAwyyT+quKle9Yovq+F8m3G182eU4q6YEj+qoiwVzE6KzPs2dJMS03IVGC2oXB4pbI+sOhc8JagAG90bSRl/HN5KT/I4GYu21VQ9SeJyRgJrLBC5thYJcw+XNMDnoFYyHMx8l8KhlwjbNyfuesyiq83BHYzzZHYNFS8l1knpzgqglTqhHvAVi4D0ccXij4wXJIvhwFOh8vWpoCVlieQPPgyQUemKXCGgw6pc5jzVJIzaq/5Q0XNrEgCF4pOSIZH3QolvQ4iY/vGxu61o0CSO/d8XmE4wnzcLaNrkcx+4KOh8Mjl7Hj3SQm0YrXS7eNp/RTrI01R0/biQQ+87T8NFxjZpVjynXn+eGVfy91j4TYrVGIVeiUFEJpUapF8ZOWUFwoHe8/xquZjE/oqPpY6km8lXF676bmBxwAXsDZMSgb+VRMuw99BROyCtRyIRyRTtKKGKSLs1D0txZjv4juWwiQ4BCh7bqF3EdsBcVGHq5gbj7scm/NGTyVZiSwzyXaMzzNNptvZGB2RLiVH9NJKWwcXU90QvmGxYZQtsgrA994of+JtMWGQcnP4rsa1ghsth8Y6wZS9DUyreyWrO/YXFRKe/YdQin1VOfztwEU4KWCPVopV2i8rKWIiKX3mj1Wd7n7osxSjlMGcGRYjrdwNZ3I=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22751aa7-73ef-4880-3159-08dafb138ac4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 18:24:17.7097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 98KOJdlub4JJnvUWJvMGIe9Dh2Ihdt30nOZctwHxoZswLB4dSylOD2ebxQYzqAVanBorXOSI1Pkx8DeZDne1JqGnudIlozmt/a+1Y5ZY2nQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5050

T24gMTkvMDEvMjAyMyAzOjIyIHBtLCBBbnRob255IFBFUkFSRCB3cm90ZToNCj4gVGhlIGdldC1m
aWVsZHMuc2ggd2hpY2ggZ2VuZXJhdGUgYWxsIHRoZSBpbmNsdWRlL2NvbXBhdC8ueGxhdC8qLmgN
Cj4gaGVhZGVycyBpcyBxdWl0ZSBzbG93LiBJdCB0YWtlcyBmb3IgZXhhbXBsZSBuZWFybHkgMyBz
ZWNvbmRzIHRvDQo+IGdlbmVyYXRlIHBsYXRmb3JtLmggb24gYSByZWNlbnQgbWFjaGluZSwgb3Ig
Mi4zIHNlY29uZHMgZm9yIG1lbW9yeS5oLg0KPg0KPiBSZXdyaXRpbmcgdGhlIG1peCBvZiBzaGVs
bC9zZWQvcHl0aG9uIGludG8gYSBzaW5nbGUgcHl0aG9uIHNjcmlwdCBtYWtlDQo+IHRoZSBnZW5l
cmF0aW9uIG9mIHRob3NlIGZpbGUgYSBsb3QgZmFzdGVyLg0KPg0KPiBObyBmdW5jdGlvbmFsIGNo
YW5nZSwgdGhlIGhlYWRlcnMgZ2VuZXJhdGVkIGFyZSBpZGVudGljYWwuDQo+DQo+IFNpZ25lZC1v
ZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPg0KDQpBY2tl
ZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg==

