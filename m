Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 384DA65F860
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 01:56:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472228.732380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDb10-0001CL-Jz; Fri, 06 Jan 2023 00:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472228.732380; Fri, 06 Jan 2023 00:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDb10-0001AH-G8; Fri, 06 Jan 2023 00:55:22 +0000
Received: by outflank-mailman (input) for mailman id 472228;
 Fri, 06 Jan 2023 00:55:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sfve=5D=citrix.com=prvs=363380921=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDb0y-0001AB-27
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 00:55:20 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c80ad64e-8d5c-11ed-91b6-6bf2151ebd3b;
 Fri, 06 Jan 2023 01:55:16 +0100 (CET)
Received: from mail-dm6nam04lp2041.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:55:11 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5191.namprd03.prod.outlook.com (2603:10b6:610:93::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 00:55:09 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 00:55:09 +0000
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
X-Inumbo-ID: c80ad64e-8d5c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672966516;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=NuV4HaD2bCln0Nm0zAO4yk9D+7lRmMaC1YSTGaUxamE=;
  b=faRatfXkWZUwY5dpYh8tM1c74HuJDSweMaP52qtggbH0syub/nEmejFa
   bH7m4wrr1krlRTl5luJ95RA2z2K2byo7y/wku3JImeur/GeyAciZniQbv
   KaV8Gm4UZBKyNfwWOS3YT8XqBH0AWuTxfaug4t/bZG/lrKatjCjNMpr43
   o=;
X-IronPort-RemoteIP: 104.47.73.41
X-IronPort-MID: 90885529
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:WpQ7/aj+dSw5rgEWgAUF9+fNX161VhEKZh0ujC45NGQN5FlHY01je
 htvDDyBMq2DZ2b9LYoia9nnpB4D7Z+DyIRqTgJl+XtmEysb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6sT5QeDzyJ94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQBcA4AcwytrNuo5+68cdtuqdwSNenkadZ3VnFIlVk1DN4AaLWbH+DmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilMqluS0WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapDTO3oq6Mw0TV/wEQ9Gh0na0K0isX6ixeRVtxtF
 0ZP2WkH+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313qiQhSO/P24SN2BqTTMFSCMV7t+lp5s85i8jVf5mGa+xy9HwRzf5x
 mjWqDBk3+lKy8kWy6+84FbLxSq2oYTERRI04QORWX+56gR+Z8iuYInABUXn0Mus5b2xFjGp1
 EXoUeDHhAzSJflhTBCwfdg=
IronPort-HdrOrdr: A9a23:ko1WGK4XRbuPRHTvmQPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-IronPort-AV: E=Sophos;i="5.96,303,1665460800"; 
   d="scan'208";a="90885529"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7zJ96J4bufKwqxWhQmZFMYqEgbXCZjVxGzVwGpoNdNWIWmcHeT9id8UoLiY4SOdSowwaeSJ+C0A7OJ9b7ifO4hK/SXAhU0otJQoH5VY41p1xdRMsRgZujw2EBFJeqeKiI3tog6tY6Q9qvPuAe+uVU0sb62B3XPW40vQOFv6Oi1vw0nrmWn5CWAx4ZYDJlqg9SeC5Y4mePGxhmAa+qIyk+99p+fsau/A0Qpaim4VeY1O6u14ct++LwnQqHdsU/7luk8T24+vk/Wo9F07z2S3+lCInIB5GDzuPRw1ZD+EDnqfLoqc6+XK7UdrsArwBfvvwj4C2BqE/v/OizsR+5y7mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NuV4HaD2bCln0Nm0zAO4yk9D+7lRmMaC1YSTGaUxamE=;
 b=fkt7Jmhe8FBzQHojwck8pTwVl+k5EmauAVr7a2Z6Efz0sP77L/m2dmHxd7xafYzRxm7xkgRDHuN25DayPQVMnFTfqezc4PytcJfqC/LbU0ScTQr6HpQGcj8oUziifFXq9lClx5l/c/zAhaFNaAhzZNXzCgEjBPFMVUhjN54RGdKFwk++Ev2QE4EtBNc2AorN3TTUJP4ofIJ1nM7BUGlVQFEpPpxoAW239HWAiOXMDFnRR9++4bsU30nyXyAVS12AX6mifmaLR+EkdRmb34hugJ+IIz3yap/tkiFsdLCFgcJqVB/IxOUDbnMVPpf4LfB1grpKtL3juy9Lw1b4xNYXlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuV4HaD2bCln0Nm0zAO4yk9D+7lRmMaC1YSTGaUxamE=;
 b=p+ruaNFaGd6vUFTnU+01rrprObMQ499tFa/M5t0NT1YUX+SfFiq6nmo8ADlkRtM/K3ViceuJoNrfwVkp/6LIM2WXAMibyY2imcrX12nIx21aAyL+9WlXvG4kdmWPqi6WMw9r+3ceM2M1jWwYb3kLM+eT6WGfQs8p0XdxZCE0IqM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH 01/11] x86/shadow: replace sh_reset_l3_up_pointers()
Thread-Topic: [PATCH 01/11] x86/shadow: replace sh_reset_l3_up_pointers()
Thread-Index: AQHZIR6u/vHw4RYb/kGm/un2td4VGq6QkM0A
Date: Fri, 6 Jan 2023 00:55:09 +0000
Message-ID: <e8bdffdf-d5ea-4320-3e84-b6654ac83002@citrix.com>
References: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
 <03ae5a1a-4417-0aa0-27d8-833ade20cc0b@suse.com>
In-Reply-To: <03ae5a1a-4417-0aa0-27d8-833ade20cc0b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CH2PR03MB5191:EE_
x-ms-office365-filtering-correlation-id: 19a9adfd-73b3-4b6b-4cd3-08daef80a8e6
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 IJj+nX1eunCDjNIy1QL+QUTJxVZGauey08tbp+kzR1HImsNqe1Q1R9f7k5ADqA918d6tgcE2A9gkZP0tQtw5fNCKrMxrdck73u+ZGph+8Cn9++3/DbPQOG2h4bwyG7uuMJobSC+ZdDtF6w91jvgtcJPDrRLYDvmLPjlsHXXdupqtp44ICGEmUVsW3P1BiedHkiJICFFrI++Jo2L46nSPFyGR0WgD5oDWNZ5MYIYMu0WDdkhisbTKbTBLvnhwyBN6CO3Hrvu6dBv1qYUKYGBI65SE3F8l6Wi/DuZGbL5yL1I70JwXf7F8s0zfQLtgxTW1exSfoExGbm5KIgZirmcoi7q1h2nfmxCtBlBHh+VK7+1B5P2g5vo5Ms9olwO7fki2GJ1codkVXvtXer4FWHJtQwbpLYDmp3+Kfe29Ni+FnBNVJxWN4ZY+Fw6lC2/q9Kpbg93EdR9Y3mkr+2MlNs58SfWamZrR0+S0oZPTx6ICdY0N+HfHVjwVxeJVJbOv9SllKvWqmQAVjCOFQscvI5eLbI6xnWkYGdUiDnoGn00GvB0g2BitrswYMtoOJgVdHrmIDK2TWyrgv5X6pROpuxGntt/j7RkxIliwpc4bc9lVbgAoDKzgfHWs7syYJ/+iQ/r2vTrNtY0BJA5zsM/ofo3IRpNmhpM2Zn5ojyakvio1UnWXVUK8F1JhbX72eBrVYFbCXqrffzEtG1sMh1hsWjr02nW8t1U12fASm0y+pSSRd2zn7yI9aopoD8ArNVwE63XETVknFi643dKewJbdwaZwJQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(346002)(136003)(376002)(396003)(451199015)(83380400001)(6512007)(26005)(107886003)(6506007)(38070700005)(86362001)(36756003)(31696002)(122000001)(186003)(82960400001)(53546011)(38100700002)(2616005)(316002)(4326008)(478600001)(41300700001)(8676002)(4744005)(2906002)(5660300002)(8936002)(71200400001)(31686004)(6486002)(76116006)(66476007)(66556008)(66946007)(91956017)(54906003)(66446008)(110136005)(64756008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NTdaN1RKZGRraXpUSnVjWFF1SlVlN2kzZ1NyV2tMNWJHdWF1WXBvUnN0cER1?=
 =?utf-8?B?bGwwMitNM1pud3VzYU9XMENBNzVheTkvRlRlSnV1alhpa09yZ3VITkpBUitK?=
 =?utf-8?B?WGRERThDdUg5K1lJb2VpRnUwTzgzT2hDYk9VaWtaVGM1VjBnRHhNME9yYTFR?=
 =?utf-8?B?ZE8rZS9jN29QQ0cvWXBMazEwWHFXUzFqQ08yakd0MngxMlNxbURzNUR3Yk9q?=
 =?utf-8?B?RndraXpCeFF3dU9za0Rjajh1d2EwYVhqTWdjSmFRMkYvOXJaR2o3WmFOdXNt?=
 =?utf-8?B?aXM4azVyV3VjNVU5cEpxTm1YeG5vZlNFNk5hV1MzcktPQVpmU0srdFFWdy94?=
 =?utf-8?B?NWRCMENsVTRYZ2ZwQnJ6aGZSaHNvV2FvVDNtaVlNb1ovVllUekVPSWt6VGxk?=
 =?utf-8?B?OFh3VzRNRDN4aWFVcUQzcFZtd29UZXVpaGd0dW5XNFplKy9pQXFWelBQaTdl?=
 =?utf-8?B?NThUV09XQkUwdFl0bUdBL2RkRFdOU2UyN1V1aS9jQ1lEd2VyWnpFTUdpbC9O?=
 =?utf-8?B?RUh0aUYxSkFPUHEzTno2UUhlQUtUTVNzcTJoMFhMTllzWlpPak82bHgyTVdv?=
 =?utf-8?B?VTEzWGxjQkozdGovd1ZZUXhnZUJldy9vang1QWVkbE5vNVZDdWIzS1hiMVo0?=
 =?utf-8?B?bWZ0dkJJaE1JM0RpdTVtVzRSamVFMUpEcVJDenEyRnVucWt5dWd6aGxXVGdQ?=
 =?utf-8?B?NzNFZW41ZUxWUGlIWTRQOGZTZFlaOWZjdUxEUERHS0NxcTVXVXhyZVdza3Q4?=
 =?utf-8?B?ZnB0SjJEWTB2TGFnQ21xM0h1ZEZGK0g3dDVwd3VwMHRHK3RsaXNpa2hZWmwx?=
 =?utf-8?B?SXdTZWc1ZG5ySCt0cGh3UURodGh5TWRyOUsyM2NPN3I0ZEt1Z1BFWVJXY01Q?=
 =?utf-8?B?L3JXMmFRUkZLYWh6ZjgxZ2dNQjkvV3REdnl6Z1VucTdjQTBtSUVWVHdCTkVo?=
 =?utf-8?B?aHNpZXNUWUlOZ0pYQ2xRa3IrL3ZuNk9LWVdEL2Uzd2lIaWh1STAyVWdsWDRh?=
 =?utf-8?B?NXVPWk4wU2RMN3RUbjRmc0tlQ1NsaGV3S1VRb2liSkVVbVlENHUrZ2tna05H?=
 =?utf-8?B?cEtzZ1R3a2xySXRka3ZXV2t6RmxUQXVCd2ZqV2lQVGlJMkcrcU44aU5IUE93?=
 =?utf-8?B?ZEFFR3VUWDhUN1MwZTQ4OUd6K29vN3c1SGdUT3BxZVVGOHJ0bzVVYUVmVUlm?=
 =?utf-8?B?VkxjeFhPeUlDNVZORE4vTURBV3dTNmtkZWNIQmJYd0ovVXlzNWVRU1Q1Vnov?=
 =?utf-8?B?a3hpaXNaZXNFR0xJTUYxZlpFbmpXMmdibE9JUVZubGlLRzRNUWUwQ3JJMFJq?=
 =?utf-8?B?OFo1bnlYSkVpcHJrK3p2bWZZazZjbm1ZTG9acHpLVVJYVEx6Z0Q1TWZiOHEx?=
 =?utf-8?B?Nnk4b1luakduZzdHM05sdFBUSGE2dWlUbHJOMG5JaGxjWUhENTJOcnZ1YVVh?=
 =?utf-8?B?MWcwUTNuWFdmd0VtZUljd2dVa21vMmhDQW83ZXV5YXlmelBNK3dNWTdORER4?=
 =?utf-8?B?b0owWTIydk0yK3ZaQVBvcUV0VG42RW50amtBWDZ6ME8wcWFYd0VNcWF2RmdL?=
 =?utf-8?B?ZmV1QXpiR1ZuY25QWXZGQjVTdFlHbUxyY1ZVaXNxMTF4QmhVSHprNkZMZVVx?=
 =?utf-8?B?bnBwSDBleGp5cTdIY2RUeVR1MmE4QjhaQU1NUUhBUEJYa0xsNXZWSTFpQ2Zm?=
 =?utf-8?B?dXNIZ2Zmc1Y2TU1USjZuOFJvSE5MdVJNdnp5cmo4OG8vdjNKTm1rdnRjenRL?=
 =?utf-8?B?dElGSEcyOTJkZGd0SmJibHZNTDhCaGNLd3hhbEJaMmd6Y0sxK0NwRGZsQkxT?=
 =?utf-8?B?Ri9FSFJOL3BtY0FEaTdxaTZIN0FIdXdURGxUUlFvbzk3V2F1Z2hlZ2ptKzMx?=
 =?utf-8?B?Z2VkQng1ckl1WFNwOGxYa1VyR25aczVjMFdPYjlvcDE3cmZqUS9zSWc4M1hL?=
 =?utf-8?B?ZWMzRzJDZnRKbVhYL2ZqMXBHdW5jU1l3MmY3VWR1ZFRCdnZ0aTBpRFNmNmZn?=
 =?utf-8?B?U2NYWWM5QkEzdHZIbXpFUlhzU2NvYmVDRFpjaUswY1R6SGpHS1pCN0hhbWFv?=
 =?utf-8?B?d25kanErNzl3NGNGL0gxUU5YYmZzZ294Ni93TklhTnpNNElHZDJkRzJpZWFn?=
 =?utf-8?Q?gpdSwKXPZ2ub1n/ez84Y2o/+z?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <46AE5BC851407045A5EA2D1E706E1809@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	49FpFA4vQox+TsqtH3wz2XDrcKy8/sCvDID/U4MQ2f+E6UG95e29N3zD/wz1aHATYQIG1gQaaXceU+yEpnM4wHNiv8s2Hr5c1kMOu+MP37RrFYlO3eyzXMgDu2YVxyGlyR/vWMdj7JvuN74WKW77vq2A2A/43Y5kTj3DWtdDtnpkyvca8tITspKpPF9yOENeaH+NfoqCEArIXTD/SwFgTDHMyBoncTeFwg2XUOmIbYDWQcNPfOOSbVzOf5xVPry35LPTjjgxEvHyheNAZiZY0c3MORrGPnzgBYEMWF2shevwuJFB4MNql2KBthUVwGjLKuZAO0QEVGre76gP+BtPxDcsIC1/2vMzs7CtLqOMRyL0L9fwmNt5sn/wqIyyZSKuwdaZaV2CqzR+Q+BnqSmeOQq2wyW3t8KtG5Wjs18V5esGyPO3WfUNoEz4nRFS94NkFt+KxR4Yxx3OKlQwbMADm4riDn818n08XUyd0iK+6+2v02GDkF8NdCvHr45tWRCAG0FAcGYpD4s5BO0k78Yihw4VCN13KZWxQtYRnJ36uoD7B1HYhudTZLrZ5HNnceXCUbo8ahydgmjfylqQBSjAwJKewsFcqyWROPeHeQJiqvXBnpX52/g0Hi2rHhlXU6RF2v8W+X4buzHstww+ljMnXeGBh0G9ZQ6uTwL6ziwo43SMVRzU2ZHeAGV8Wb2+W6TmIDCGI5FjMqiJXV0k7IhC+IlcUKgWrAjnvjFsoQ+2Fw7FkREfblYtMUurkzp7pxdjZEnEgWX1UgBa/dNGb1v/ztJIitBCowpEWcRsNv7I1X9hGKuUorcvGYEeBg5gtUGBsjJch9BVz7eQrJBmO5bx9w==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a9adfd-73b3-4b6b-4cd3-08daef80a8e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2023 00:55:09.4551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ss3eMvwswg/O91i+peOhWmidkxXVm3kGbBQhMaViI6AN5YBvWzss1WnbY95FrOZAHfT5W1yLy8bFbqD+dTLumhSdFoU4TKCza3uvjX2qdxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5191

T24gMDUvMDEvMjAyMyAzOjU5IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gUmF0aGVyIHRoYW4g
ZG9pbmcgYSBzZXBhcmF0ZSBoYXNoIHdhbGsgKGFuZCB0aGVuIGV2ZW4gdXNpbmcgdGhlIHZDUFUN
Cj4gdmFyaWFudCwgd2hpY2ggaXMgdG8gZ28gYXdheSksIGRvIHRoZSB1cC1wb2ludGVyLWNsZWFy
aW5nIHJpZ2h0IGluDQo+IHNoX3VucGluKCksIGFzIGFuIGFsdGVybmF0aXZlIHRvIHRoZSAobm93
IGZ1cnRoZXIgbGltaXRlZCkgZW5saXN0aW5nIG9uDQo+IGEgImZyZWUgZmxvYXRpbmciIGxpc3Qg
ZnJhZ21lbnQuIFRoaXMgdXRpbGl6ZXMgdGhlIGZhY3QgdGhhdCBzdWNoIGxpc3QNCj4gZnJhZ21l
bnRzIGFyZSB0cmF2ZXJzZWQgb25seSBmb3IgbXVsdGktcGFnZSBzaGFkb3dzIChpbiBzaGFkb3df
ZnJlZSgpKS4NCj4gRnVydGhlcm1vcmUgc2hfdGVybWluYXRlX2xpc3QoKSBpcyBhIHNhZmUgZ3Vh
cmQgb25seSBhbnl3YXksIHdoaWNoIGlzbid0DQo+IGluIHVzZSBpbiB0aGUgY29tbW9uIGNhc2Ug
KGl0IGFjdHVhbGx5IGRvZXMgYW55dGhpbmcgb25seSBmb3IgQklHTUVNDQo+IGNvbmZpZ3VyYXRp
b25zKS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pg0KDQpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4N
Cg0KSSB0aGluay7CoCBUaGUgcmVhc29uaW5nIHNlZW1zIHBsYXVzaWJsZSwgYnV0IGl0IHdvdWxk
IHByb2JhYmx5IGJlbmVmaXQNCmZyb20gc29tZW9uZSBlbHNlIGRvdWJsZSBjaGVja2luZy4NCg==

