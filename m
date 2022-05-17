Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DC152A28B
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 15:02:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330780.554166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqwpy-0004WB-IV; Tue, 17 May 2022 13:02:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330780.554166; Tue, 17 May 2022 13:02:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqwpy-0004T6-EG; Tue, 17 May 2022 13:02:06 +0000
Received: by outflank-mailman (input) for mailman id 330780;
 Tue, 17 May 2022 13:02:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=juf1=VZ=citrix.com=prvs=1294c2b73=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nqwpw-0004T0-T7
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 13:02:05 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89434b6b-d5e1-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 15:02:01 +0200 (CEST)
Received: from mail-mw2nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 May 2022 09:01:30 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB3868.namprd03.prod.outlook.com (2603:10b6:5:4f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Tue, 17 May
 2022 13:01:29 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 13:01:28 +0000
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
X-Inumbo-ID: 89434b6b-d5e1-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652792522;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PmGAu3To+r0VqrZy/1vSLw336a2IvCKZaoKzqd0KYnM=;
  b=VWOPFnm13Zc8gDk2gFulJtPbPlbtW6AddvI4T7L3mm2y91QI44qopn0p
   Q9NvJGzzHpbobQrO35S1gDM7obQtLYpqmrgXnzk9r6Hxmxh4g3Tr/5HVQ
   h1xSrhluw1idkHmdUiZxfwnb+HCwmT7MVCyZmJxEZLDFxPGT7EhopzhdK
   c=;
X-IronPort-RemoteIP: 104.47.55.107
X-IronPort-MID: 70865611
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:J3OTe6k/Cpw3+0SZkyYjthno5gwnJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJXT2Aa/mJZWDyKYxxbYSw8UgE78eEm9UwSFM+ritnHiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DkWlzV4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYZDoHDvfpgLghbhxUSx9kG4hKx+DYGC3q2SCT5xWun3rE5dxLVRlzGLJCv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOXuJkBhGhYasNmRJ4yY
 +IwbzZ1YQuGSBpIIloNU7o1nfuyh2m5eDpdwL6QjfVvszaOklUouFTrGIDnJd7RZplcp3yzv
 0Hh7XjaBQkqMsPKnFJp9Vrp3IcjhxjTXJ8ZHfu2//hhjVmX20QaEhhQXly+ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c9BdCfEg4QeBjK/d+R+EB3MsRyRELtchsaceWjErk
 FSJktXBDCZq9raSTBq17ayIpDm/PSwUK24qZiIeSwYBpd75r+kbjA/LT9tlOL64iJvyAz6Y6
 w6NqC8ylrACl/kh3q+w/U3Eqz+0r52PRQkwji3VVG+46gJyZKa+epelr1Pc6J5oM4KxXlSH+
 n8elKC27u8UCoqWvDeQW+hLF7asj96JPjTTjl9oG5gJ7Cm29jioeoU43d1lDEJgM8JBfCCzZ
 kbW4FtV/MUKZCTsarJraYWsDchs1bLnCdnuSvHTaJxJf4R1cwiEuippYCZ8wlzQraTlqolnU
 b/zTCpmJS9EYUi75FJan9sg7II=
IronPort-HdrOrdr: A9a23:LD+2nKH6fHQ8PoUnpLqFsZLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNJICPoqTM2ftW7dySSVxeBZnMbfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj3Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnZ4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlXFtyssHfrWG1SYczHgNkHmpDp1L/sqq
 iLn/4UBbU315oWRBDtnfKi4Xi57N9k0Q6e9bbRuwqenSW+fkN6NyMJv/MmTvOSgXBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjx0C3fLFuHoO5l7ZvtX+90a1wbh7S+cQiCq
 1jHcvc7PFZfReTaG3YpHBmxJipUm4oFhmLT0AesojNugIm1kxR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVLQtUNZaxwCe8dSY+8C3DLQxjLLGWOSG6XX50vKjbIsdr68b817OaldNgBy4Yzgo
 3IVBdCuWs7ayvVeLqzNV1wg2TwqUmGLETQI5tllulEU5XHNcnWGDzGTkwymM29pPhaCtHHWp
 +ISedrP8M=
X-IronPort-AV: E=Sophos;i="5.91,232,1647316800"; 
   d="scan'208";a="70865611"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=II68kr5dxV2hNeY4myBJ5pwZelRvbOozwEdowV/tJ5EHqcbBaBw+Y9XVFxbLNomaKHKmrstLv45E12k5QUQoTmnoKD6rZn5YOYUzkHdi4R0J0a1hT3kikhHNRNLMlk3MlQ4je8FNQ67B7fguAbjwMDJ5Ye+jtzDtjgiAbX0RD81YKnRE+Yva8RW16PQSJtVYPvy0lhXT2qk6AJeVbjdz3V1cvc+odWeBiRWy5JAtA++Up2VyMQdFpqQqwEYJt1nFCnwqMpcBcqAGwmjMyqc8cMUnzoiK1PmCe+HmTmvLpRdjP0TNcwJ/KcVw1y4xU/bu1/WVLGoLpgG7T1ZcN7Zezw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmGAu3To+r0VqrZy/1vSLw336a2IvCKZaoKzqd0KYnM=;
 b=Bx9ydMzx+E33C+4rxKSo5d04QfjgGzf40LU83QBigUxTQEWCQI8ynbHmUMMHzu0cd8eWSTet+Ht9eH8go9BPstonuDcXsRpreUOpKHic+lWicCDBh0x7hyJJDdmlHuoRn7ItMsxtFvE79LrnLhTUX/nb+T5Wr4+i4QQ1A9x85HoRgtxMkYeZv2M1pCYywFRMYxuvrFkHKC/pixOdFnhCXFbc+SA6ThUZ6mNrUoAlfRFpJHksUZLr4nhQ6+saTM9pviL520fWhlrGC/laX+Adw4Tx312xK4n1PEjnEtSJBodDagVllee/f8W/S4V/4KVfS8RhRAzUUs/HWvEUvgBwTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmGAu3To+r0VqrZy/1vSLw336a2IvCKZaoKzqd0KYnM=;
 b=b68yC/eyZJl5koiCu2mPwfejJq6gNCnAQSfneulwmFEUX6zHZwQfr3gPAX5nbKAVzYV/qEBQ3PvosqT5UC7csC/HWSWdeAVCwUet7STQFoEHPczTzjhkE5Iaeu8EVQSK//NOaIQDXPk3cIOChUriOWQJRNUCbnSKwohaLnq6Z5o=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Luca Fancellu <luca.fancellu@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, "wei.chen@arm.com"
	<wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, George
 Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: [REGRESSION] Re: [PATCH v8 6/7] arm/dom0less: assign dom0less guests
 to cpupools
Thread-Topic: [REGRESSION] Re: [PATCH v8 6/7] arm/dom0less: assign dom0less
 guests to cpupools
Thread-Index: AQHYYUDliIUtXuVlFEquWiHjLJV14a0jGe8A
Date: Tue, 17 May 2022 13:01:28 +0000
Message-ID: <e434527b-5804-324c-3619-51a552802d2f@citrix.com>
References: <20220506120012.32326-1-luca.fancellu@arm.com>
 <20220506120012.32326-7-luca.fancellu@arm.com>
In-Reply-To: <20220506120012.32326-7-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 588663b3-cdf8-40e4-088c-08da38055b74
x-ms-traffictypediagnostic: DM6PR03MB3868:EE_
x-microsoft-antispam-prvs:
 <DM6PR03MB38686F6BE3BEDD176DC7DEE0BACE9@DM6PR03MB3868.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 93Pi6CEkhhzWA5TIPdE4HkuE/xVFHiCkN/vT/flIcG5s4g4iy+EplgmwdbtTjapindXincYOTOUI8q9VV4sAn0LZbAE4AN/XS6RGpOBR44yMSSkaYXw6N/uabl12X0PiUhbQ5QbuIcV6KEng0BzzRSajqpRHW8KQgNSb2ZFH60wXwPC21TpLPi7vBYiq2rUKo87EEZ9xdjsDfZN5ePF4oZH54PkA8WqwfVjCc6Ti85YYgXIwRkihD7MQyMyy3m79jr+QLrzzbz2+F8gBWyBuqIVx7xqvFzqrg2ocHwNqo/RviS/X0vGpbQ6lf5WIhBFrEQQfzYMsWDcl6nWovkqnoCQ1/TxJ9nKO9S8BsVI/4iB2oOGNGqYIkHDXoe1goB5IJrZGzbL+1CGNADtZ4YvmAdZh8O0DveRm5CkXr59UnRsnGSi2+PVo2PkVmj6y014RK8DRQvdnUQuRYFVfkKlqFHwy4wO4xY09QpMRx+Nw/3K3g5HzgMXmqoQH49K3jw7G0TYYMnaCE1kx16inaVWGOWtcqMf4Zm3iLPHHu1iS/EUt6OKOg3DuK83fbkPDPIIZYjGdnxexs/WG7KG8J84njtXWEPq6hdbspQofpvwjdkkt+7QrsfT4gxCJgqj6Mio+rwFGa7ZifktAaU4uEXtj3PJUC7LW67UXHGUyCO296qNGmChQ2pFsYZkbKCOHCXZgb0f3EDzotd0fPyMdUqsCefjQPX1fCD1YAlIpnIwN5fRhdebAH0lk9WelG4hyn3iT7L+DKnd+PLiTHaWo8k/BqIRP0qW98sFFU9wcTQEmPKM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66446008)(64756008)(66946007)(316002)(66476007)(66556008)(8936002)(8676002)(122000001)(86362001)(6486002)(36756003)(4326008)(4744005)(91956017)(76116006)(31686004)(5660300002)(7416002)(2906002)(2616005)(186003)(82960400001)(26005)(38100700002)(38070700005)(71200400001)(6512007)(31696002)(6506007)(83380400001)(508600001)(53546011)(54906003)(110136005)(32563001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NW1xK0sveHdCMGd4bFIrR0tHT0lXSkdUQ1R2VGgwMUszNnVYOWltMUtpbHA2?=
 =?utf-8?B?dnNBYThsYnVEQmdOTmZncllUL2R5ZHgrYmQxSDM1NGdoOHNsK0RTQWN5K3Jz?=
 =?utf-8?B?WU5kS0pUTXJja3hOQlhtK2YvRlIzRzc1K0Q2N0tBOW9IOHkxTWt1ODVCWXNP?=
 =?utf-8?B?c1VKZy9sTnB1dm5ZN3NQSGpseVdVWEwzZldwV3hLV1hPV0RpRlF1S1pQNTcy?=
 =?utf-8?B?MENnNENyVVlsdHI0WmM4WGk3QVdia0ZnbE5DSVdvLzV1WVFIa1VzWjFXdStx?=
 =?utf-8?B?QVc0Zm5VcHZtM2kzZTdIanQwYkxhLysxZkttbWZyTlltWVV0TUpnR1RDOVBu?=
 =?utf-8?B?QS94QWFXN0ozWjZBSERHakFFeSs3RnFxakpuSUhVMnM0cGdhM2NIRmpQZDda?=
 =?utf-8?B?MlZMR1hTdEkrdTBlajBMRlNlS3FYZHl2UGxHa3hCVHloRzJKWUNBWkhNbkxF?=
 =?utf-8?B?aWhCUlFWMWxYSld5Y3h4eVlNeHpZT08zakFRMUlKTVF1OGJvWUU3SGFMVC9K?=
 =?utf-8?B?K25tUmNzdWkweUxRSWQ2a0pObkdHYlc3NW9FOGxUOW5lNVoybEJVSGxUcjBI?=
 =?utf-8?B?R3BJNU1LdjdhTmttUEo4UEh5eEVwK1kvNWlia1lEc05CTFM1N1hpWHhOQVlC?=
 =?utf-8?B?RGhIb0V3MlN2V0V4Vjk4NFcyWC9CdXA5eVZlTlpyMjlibVlzMUhma1NVVnRE?=
 =?utf-8?B?S3F3dHB6cXJhZWtDMEtycXZXaXlGenJkVHZqTXlmd0sxZ2tqZjIvaGMxUGhw?=
 =?utf-8?B?bllnU25CbHhmRFVEWGVqNTdBM0lCdk5rWWtXcG1tVnc4WkZ6SmJybDk3bkhk?=
 =?utf-8?B?bkppZGE4dUJRWTZjRjdzOFQxZVpFaXJ1djQwTFJXUE5CSHRteVZuTkllcU1H?=
 =?utf-8?B?T29Pb1JSRWxVckY1M1B4TCtPbHhkN1F6VkxmUnIrMFozR0NVYW9ENWFsVU1h?=
 =?utf-8?B?ZTREK1YyMkJKNWs5MUMrczZHZHNMV3orWDRid1k3dEI1UVFpbFpDaFFtMk0w?=
 =?utf-8?B?NGttM1h5Vmx6djFxSm9EOXp1TlVyS3YwL1Fsb3dhcHI5cjJueG50SVFhb2lp?=
 =?utf-8?B?UXR5MW9ndG9rWnVXck1ZeXBNQWJYZWFoaHhtdUhROEw0aVd2T2JVVWlzNW5C?=
 =?utf-8?B?ZHRmSmhOd2YvVWVDZmRwTElzRVJ3TFdXZHFLRHRrS2FIOGptM3JHNEhoOGMy?=
 =?utf-8?B?aCtSYW5EQjFiMkJEVjcyU3h6eU5wM1NlL3hpNGNPaVlSUm1ZNmVWdmRINEsy?=
 =?utf-8?B?R1IvZlJoMnp5bXlCcEo1WS9xMDI1WHFRUDZRYXk5a0hzbnZFZlNiaVdheXNo?=
 =?utf-8?B?SElLSDdzdmJlWXVHTmw0MFZXclNZVG9sbEFmcEpQZEVTdVY5RG5sQ284ZGc4?=
 =?utf-8?B?Mi9Wempsb1gvUlFyUWtYV2Y2OUV3OGJsb0dPckM2dDNHU3pTL0NESUJuTWlU?=
 =?utf-8?B?Z2lLaUVSSkgvd3piVC94WWhHbkRFWnNSRGtkZGtSdnY3M0c3MFNsRDJSbUR2?=
 =?utf-8?B?aWZONUh0eTBnaEw0WUFmZUF6b1IwQ1FKTFM0OHdtdHdlN2o3VWhJb0YwbUxj?=
 =?utf-8?B?OVBBbys0amtpUEwxVjcvNXZsd3VIM2JXc0ZZUWV1Vk5UVUVvellJcE04WDVP?=
 =?utf-8?B?SGtHbS84aVlHMkx5eEdaMWdUSjJ6VHZvN2F4L0RHWGZTc0xYRnJTUDNVMjUw?=
 =?utf-8?B?cVJYb0lxTE1JSG5oVzRuRVNrVWVQdEVHK0Q4dzEwcTdPWHpZMTJqRTFReHYz?=
 =?utf-8?B?QVJWMjlNOW85L1BuYjZUWUZpc1RYS3lCQnBrOFBDUWZiSkthNUlSYmtlelZN?=
 =?utf-8?B?M0xGU1VjUTl5NUIwakFtL1phTUxrZndBb01mMEIzUE42YW5DdDRyNDR2VjBO?=
 =?utf-8?B?MldyU3lxRUhFdFZpTW9UU21kaGx2bExYQ0toWDdmWWxVdjllZGtwUnIxVGlI?=
 =?utf-8?B?cDlDUSttWjFMeVBYTWdTeFYvUjlreFJXOERGeGlMQWtoK3BIRUxublQyYjc3?=
 =?utf-8?B?M01PcVA3OVdJTUpnMzJzTS9kT2t4dktaUjdtQjNoa01OS1lnc0JaVTlzbk9Q?=
 =?utf-8?B?U1F6bkdzWkhBR2xzNnVPaHMwcldiWkVWWWNMQVJGYUE0dnNJaC84U21FOW1j?=
 =?utf-8?B?T3JCME9SNzRWcFQrQzdDSEZuRW5vaUlXK1lrMG9SWTFsbVYvNndzWHBReFpR?=
 =?utf-8?B?QThDaDVPQnRlUHQwaUZPQmxSTEt0S0REaWhuV0txSjhldHBuTGVtVVR4Yzd2?=
 =?utf-8?B?dENJZTV3VXBZS0diSTR1RGEyN2NnMmRHN1BJUlBLejZNRDVtYTVQaExGN25N?=
 =?utf-8?B?WHF3N0JCSHJsQWpPZk9hcGtSM3JEU201QUxOaFdPS2txRmlUVkhWWjBSZHRq?=
 =?utf-8?Q?FgDrw+rSzcSTgZOk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <921372DD79D082439B630053451849DF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 588663b3-cdf8-40e4-088c-08da38055b74
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 13:01:28.6200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lITLACIeqBIJEEg1YOEEEQrqMfF1yO9xU64zeYBd6P73lhC84cP56xDKURApa1+j6SB2bVinRO4qHep1cospv78vBr8AEoJ3QsWs+h4MRt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3868

T24gMDYvMDUvMjAyMiAxMzowMCwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4gSW50cm9kdWNlIGRv
bWFpbi1jcHVwb29sIHByb3BlcnR5IG9mIGEgeGVuLGRvbWFpbiBkZXZpY2UgdHJlZSBub2RlLA0K
PiB0aGF0IHNwZWNpZmllcyB0aGUgY3B1cG9vbCBkZXZpY2UgdHJlZSBoYW5kbGUgb2YgYSB4ZW4s
Y3B1cG9vbCBub2RlDQo+IHRoYXQgaWRlbnRpZmllcyBhIGNwdXBvb2wgY3JlYXRlZCBhdCBib290
IHRpbWUgd2hlcmUgdGhlIGd1ZXN0IHdpbGwNCj4gYmUgYXNzaWduZWQgb24gY3JlYXRpb24uDQo+
DQo+IEFkZCBtZW1iZXIgdG8gdGhlIHhlbl9kb21jdGxfY3JlYXRlZG9tYWluIHB1YmxpYyBpbnRl
cmZhY2Ugc28gdGhlDQo+IFhFTl9ET01DVExfSU5URVJGQUNFX1ZFUlNJT04gdmVyc2lvbiBpcyBi
dW1wZWQuDQo+DQo+IEFkZCBwdWJsaWMgZnVuY3Rpb24gdG8gcmV0cmlldmUgYSBwb29sIGlkIGZy
b20gdGhlIGRldmljZSB0cmVlDQo+IGNwdXBvb2wgbm9kZS4NCj4NCj4gVXBkYXRlIGRvY3VtZW50
YXRpb24gYWJvdXQgdGhlIHByb3BlcnR5Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhIEZhbmNl
bGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQo+IFJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQoNClRoaXMgaGFzIGJyb2tlbiB0aGUgT2Nh
bWwgYmluZGluZ3MsIGFuZCBpcyBjb25jZXB0dWFsbHkgd3JvbmcuDQoNClRoZSBjcHVwb29sIHRv
IHVzZSBpcyBhIHByb3BlcnR5IG9mIHRoZSB2Y3B1LCBub3QgdGhlIGRvbWFpbi7CoCBJdCBpc24n
dA0KbGVnaXRpbWF0ZWx5IHBhcnQgb2YgY3JlYXRlZG9tYWluLg0KDQp+QW5kcmV3DQo=

