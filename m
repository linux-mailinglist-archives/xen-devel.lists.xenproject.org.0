Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B294FF58C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Apr 2022 13:18:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304066.518595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neb0X-0004TD-Kc; Wed, 13 Apr 2022 11:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304066.518595; Wed, 13 Apr 2022 11:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neb0X-0004RN-HQ; Wed, 13 Apr 2022 11:17:57 +0000
Received: by outflank-mailman (input) for mailman id 304066;
 Wed, 13 Apr 2022 11:17:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aOZT=UX=citrix.com=prvs=09565da51=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1neb0W-0004RH-3Q
 for xen-devel@lists.xenproject.org; Wed, 13 Apr 2022 11:17:56 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b105d99-bb1b-11ec-8fbd-03012f2f19d4;
 Wed, 13 Apr 2022 13:17:54 +0200 (CEST)
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
X-Inumbo-ID: 5b105d99-bb1b-11ec-8fbd-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649848673;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Rmd25FRYhiMXvH/h5Hs0Qs7C4JzTG1vgqGmz0TqdzfI=;
  b=GgttyBMKaOQVh6kKG3mT/X1EYecSvqvuUKbJc/9hu6Rd0sUlAhQfibYP
   l1ZdtBb0KKDiSnx8J4Au9Ye8ePgZtklsBec9UnBcyVaOg9ajZhnbXzIHG
   OBGq9nflx1xHZM5MImNAmVOhzh8rEb84WeMIjuqMHCoXDuC6ZtqexS2Q4
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 69195662
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:J0+DxagOj3ZPdiAr/vmSPyOpX161bxAKZh0ujC45NGQN5FlHY01je
 htvDGDSafuOYzejKdola4y1oEpUscDTyd82Gldkqio3RS0b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1rW4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQsYJ/30pdQbbyFVIQZDbJJYoIOZBnfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bklNpyzyfKP8iSJTKRaji7t5ExjYgwMtJGJ4yY
 uJHOGM+MUqeOXWjPH8+S70MtaSGuELteiwFr3O/uJom6VLMmVkZPL/Fb4OOJ43iqd9utlaVo
 CfK8nr0BjkeNceD0nyV/3S0nOjNkCjnHoUIG9WQ9PRnnVmSzWw7EwANWB2wpvzRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiHK1p04kZupWL9U32iawm5XKuzrHIWdRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqVFr5e/LiJYsoZ8N0a6
 xSDt2AAiroalqbnPI3rrAmc01pASnUkJzPZBzk7vEr4tmuVh6b/PuREDGQ3C94afe51qXHb4
 hA5dzC2trxmMH10vHXlrB8xNL+o/e2ZFzbXnERiGZIsnxz0pSLyLdoIuW8ifxw0WirhRdMPS
 BWC0e+2zMUNVEZGkIctO97hYyjU5fWI+SvZugD8MYMVP8kZmP6v9yByf0+At10BY2B3+ZzTz
 ayzKJ72ZV5DUPwP5GPvG481jO96rghjlDi7bc2qkHyaPU+2OSf9pUEtawDVMIjULcqs/W3oz
 jqoH5LTlU4OAbGkP3G/HEx6BQliEEXXzKve8qR/XuWCPhBnCCcmDfrQyqkmYItrg+JekeKgw
 513chYwJIbX7ZEfFTi3Vw==
IronPort-HdrOrdr: A9a23:Y26Fn6AZQs0OFU3lHegbsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPEfP+UsssHFJo6HkBEEZKUmsuaKdkrNhQYtKOzOW91dATbsSoLcKpgePJ8SQzJ8l6U
 4NSdkcNDS0NykBsS+Y2nj3Lz9D+qj+zEnAv463pB0NLT2CKZsQlDuRYjzrSnGeLzM2YabRYa
 DsgPav0ADQHkj/AP7LZEUtbqzmnZnmhZjmaRkJC1oM8w+Vlw6l77b8Dlyxwgoeeykn+8ZizU
 H11yjCoomzufCyzRHRk0XJ6Y5NpdfnwtxfQOSRl8kuLCn2gArAXvUgZ1TChkF3nAic0idurD
 D+mWZlAy210QKXQoiBm2qu5+An6kdp15at8y7AvZKpm72HeNtzMbs+uWseSGqD16NohqAM7I
 tbm22erJZZFhXGgWD04MXJTQhjkg6urWMlivN7tQ0WbWIyUs4mkWUkxjIdLH7AJlOO1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGcl2E+pgEy82IIgMgE2nsQ/pM0TJdJo+
 zCL6RzjblLCssbd7h0CusNSda+TmbNXRXPOmSPJkmPLtBNB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8XU/fkr/YPf+q6GjMiq9NFlVcQ6duf22vaIJyoEUbICbQxG+dA==
X-IronPort-AV: E=Sophos;i="5.90,256,1643691600"; 
   d="scan'208";a="69195662"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bceHiGZtz97y36lkV8NpvbEOzjERHM558eWJJGgFCeZ/WLmK7LswcLC3CxgsE/GETg3XzlJ1H3aBaDpUVhOd72sM2YuXcAMWGTZv5iFS+wjicVFxu1I7na+9QFRibJwNkZIkvYElJUBEjR5kImZIXM8/G3olWHZdVL6Vkxcu2DcBMbr6CrTsQg3JCU6MlO8IC8w/087EECikL7FFJTI/TLfls8HZfi1q2JEMpnmJrCZ7ELk33ENh4jhn/Fa5DX6PR/OPW4nE7vVqDNxYpEuu1PXnZ1XMEiqPbPnh0L6fLO5BsD6oHe6yCCTpYewfWUA+laC0sdLGsneSVPeCZKo2+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rmd25FRYhiMXvH/h5Hs0Qs7C4JzTG1vgqGmz0TqdzfI=;
 b=LSXxCF+aaLC3WOezQU8IK9s+vbtViOP6KEOcvOTwuBafph2CgkfwnuzsPQgLlAeByR15G7i7RQ4EWNcLqU1zaDDgB3XGc9QYFaUDEfdvC47duT1RmY2iFKJgSnKU08uIosJ7TK0a1k66JAy13YQV/RNsRJ9rtbU7VPvFJC9AnhTGTMzmxg/auLIp2Lwl8f0H+1XVw+VmXe6QS0/4Z8cxpyMs7SAZrr+iD6X+M/LtR4l9KNHK6023rLziT48AhzMUTNtIT6q3EbujfrhzDjNqbhuDJUM3bros0n2/MWb5zZYwbXrGD+8jeqHE63KV/YmG6z6IbRB6jDlIGMj90x71oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rmd25FRYhiMXvH/h5Hs0Qs7C4JzTG1vgqGmz0TqdzfI=;
 b=RR0LERYVUfHpNEskvfezCuPruauD6AlgQ/Kb5oE/STwPn1RW2FHBOFv1zwDiWiz2DWG0P2ofbMyWnRgn4c+IQkdbNU66cmbbgj56tcELx01MjEEj+emBSPCyQZ2POaRjdV8ePykHPyPCQAv+Lkq4z/RwkC6Z171mLx5b7hwZdaI=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v9 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Topic: [PATCH v9 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Index: AQHYRbX2vSR7T5dCNEuUO7vV8Qproqzi7YYAgArXPwA=
Date: Wed, 13 Apr 2022 11:17:46 +0000
Message-ID: <619dc3d9-42d1-0c85-020e-50af3a2a8626@citrix.com>
References: <20220401104713.22291-1-jane.malalane@citrix.com>
 <20220401104713.22291-3-jane.malalane@citrix.com>
 <a389ee0d-6b2c-22bd-1004-99f79ad5f301@suse.com>
In-Reply-To: <a389ee0d-6b2c-22bd-1004-99f79ad5f301@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 236184d8-8779-4053-482c-08da1d3f3cec
x-ms-traffictypediagnostic: MW4PR03MB6965:EE_
x-microsoft-antispam-prvs: <MW4PR03MB69656484E41C81DCC0A8B49D81EC9@MW4PR03MB6965.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VNqQ6SeMHccqNAk/tp0+FlOD0sUG9RLMR1e/1isW5GiIGiovkNGYk4h3/zXazPuB8R2yY4A8IQlrIC/q7pa8RktVNsLyZ7clyKbvoYXKrFVxhYhEJOtZJD+ntH+Wl7Pcz5+/IM1rAc6+DeCB/GauapRxVPXFLsdhAvIAKiMHF/PyRine80AIKY1fDWpwQpGyXWltULBtUKJAbbm5tQkrMfsiyFCfqpnseFHssUosghRNoWCnzzKJmTsFN6Ucglm29/WK9ySvsuoqmbiiEZN7L8I5NHSeJMoJ8vd2Fh13s38pew2x8TxQe90FTvv6lEuy1EO2mWMsUE/wmpc0WF6iaUkUMQEmUsHF9ZGBtK91kxOTrIPkvwkPkv17FElhnkFJ8iKaYSDG0uaTVOzWHz1BaETcAMzqrEZ4IJgBrPMV1gQn5W2zzMTgl4rDK2liZX3rplqMWwd1MBMDZ/AuTCAiJ39/oSdi4p2M5ZNd6Gh2XQhB/A7HbncHPv+VQXB3d2hy9fFKG9nXuysPqSJvbN3zKqGcSn4m+YfOG/AbSJ+GX5A10hMFLq9gPStUhcIePpueGZbspKbYt6Qk1oeuIiiMfE6yDfJaU0szdAbFFhLWhCdgxV5cpvMxLBhkJMZ55wktG6+6+IjicTs8DrBgsonHMkvL1Z7ZZcX04t4sOxKLuZbhUmBHOQBxtEuKdQDPYh1kSy6ohmv58QxrmhNL1Jpa0PtAWohYV3gTaN+xGK7gzeo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31696002)(66946007)(91956017)(2616005)(316002)(26005)(186003)(6916009)(122000001)(76116006)(82960400001)(8936002)(86362001)(38100700002)(83380400001)(31686004)(38070700005)(36756003)(508600001)(71200400001)(8676002)(6512007)(6506007)(66556008)(64756008)(66446008)(66476007)(5660300002)(53546011)(6486002)(4326008)(2906002)(55236004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnY2b1B2cUlQM0NRcHlKSlU3a0Q4aWtBa3JUeUtlNE54bnRudEEzRy9Oblho?=
 =?utf-8?B?WHU1cC9jZjlOUHI1OTZQM0VPdWR4Q2pZTnFqbFNuT0Z3b0J3NzcxSlJFRGFl?=
 =?utf-8?B?Y21kU3FldUJqazcyUE0xSExRMnhKVm5EMVQzYm5QTktYQjdhZlViMzROVTB5?=
 =?utf-8?B?bGhwMWNzUnNRdnBGckwyaHNUNDVEekhUTGg1Rmg2ZkVNVXNaUThwaGV2WmZj?=
 =?utf-8?B?SE9KNzFuRE5HT1hsSHk4b01vaHFkWEtOdWMvYncyM1V0cU1SYm04R0VVVk9R?=
 =?utf-8?B?VExqajBuOHZPbkJYNlAwWjZKcVIrcEFSRCtWNXZMU1QvZW1NQktoaWc2NVFX?=
 =?utf-8?B?cHovNHVpb2NudWVMdTM4WC8vMnhPNmZabktXU2MyZWpHM29mdzV5aC9sVlpm?=
 =?utf-8?B?NUNsaENqdkdCb0dRWm4xamNQSjl6dHErM2J1MFZJcC85N09FaXI2U0pZclg5?=
 =?utf-8?B?QmJmdGR4cDNRbkxxVVVqejFlQ0dwVUovVHFkcENKTUdWdFd2aWNZcUo5TkxL?=
 =?utf-8?B?dkkwY0YzcmNBTzU0ZjIrUlhHcDEwcjVKZjBPNVQrNGFYMyswMkZXdUVUTGxI?=
 =?utf-8?B?UDEwTkhuUDA4SDdQVU1TaW9OeWR1bWZxUmxLeW9zUEpYVEY3TWFJVFI1R2xh?=
 =?utf-8?B?Sk5qYWRCZnBVanMxdW5waS9Yb0pHQ2pkT2lYS05xMHZmU2tNT0hWc3FRZWlv?=
 =?utf-8?B?Qml0aEs2R2VhQStuaFh1UnlrWUVnSktadnlPTkRLMUR5MkU3RHpNUTlKMXpU?=
 =?utf-8?B?UXBOUWQvb2R5ckw5M1dWOGxFNFYyWm56OTJCMnJOc0ZXVHJodFBleXRQZ0s5?=
 =?utf-8?B?UzB0Y0twRkNUd00xWW1yV2lQZ242ZVQwNXBqaXAvcjNHN3hWV1RGanRHTENl?=
 =?utf-8?B?VWNCanIxeUlQcUxKcVA5VGJmbmF0VGVvdW93RGFiaDJCVW5uNTNaZmZMcUY1?=
 =?utf-8?B?U2JkMFdyREtyaVVCV2hWMTlPS2lyeU1POWZVMzdrNlo5aWc5SW9JRWF3YjEy?=
 =?utf-8?B?OG9uSGNKeSt4alEycUl2dzJVbjBsNGRtRUw4c0lyQTZqK05INVVSa2hCK0JO?=
 =?utf-8?B?OFNHV1U3anlDQlk1Q3hYMGtORmRvcElXVGM3WTBZdElxOGIxR29jVFptZnZJ?=
 =?utf-8?B?UjU5djRPei8rVHcyS3JSSnVUaytybC9HMWdtWlZvdkpaTDRtMVk5RWF3L00z?=
 =?utf-8?B?eUNvNCtYUHVlQWVpNUZoRW8rSGlLS0Vib2I1VGNwNlF2a09OYWtSNVR3QU1j?=
 =?utf-8?B?R2hsQ0lRSTloak1vT0xUc3lUOXdHQ0xEenFSRkpSdmRyNTdDVVJ4N1ZseC9Q?=
 =?utf-8?B?VnJINlphSlpkZThhWGh1MWZRS1lvaUtyVndndUxackxNR1dOODZaZ1A3T3hE?=
 =?utf-8?B?UG55anZkRGFmWHI3RTZoUURqTjBMemFLeEw4aXFTTW9STEFGTFpMSlRBb1B0?=
 =?utf-8?B?ZjVzY3BxWmpJT3llWkJWVFF4cW9xSGo1b3hMTXl2VHFGNmxyM1plOEljRFpk?=
 =?utf-8?B?YVRGdWNRVWQ1NlR2d1hhS2ZzWTJpWjZEMklXM1dOMzFkU0VPVndVclRjTWFM?=
 =?utf-8?B?S3BTTzYwME50d0R4dzFvZHBBeFhKZ2tJVFVuSFErUXVEak83ajdlOEk0Zkxz?=
 =?utf-8?B?R2Q0bEpFVTMxOXhic0hTZkN6dFFSaHFmRG5qSTRjUmE5WStkSlcwSHI5eWFV?=
 =?utf-8?B?YVRaV3lwekJIZExjUURiOTZXb2lrU1dPdUZxUUM0bmpSR3RzYmNaRlpQajV3?=
 =?utf-8?B?bjgrV0NVTnhyU0dEUXhxbWZYMCtBb2RqSS9uWU8rSWpkcnA0Q2I1NUVyQ0d5?=
 =?utf-8?B?NmIxOEtUZlI4VUc0bE92RXA3MmRxa0lMTE9qYVVTeFcwQmJrQnZHYlFBd1RM?=
 =?utf-8?B?bFp3bjJXSFphQlo2WHBJbkJoV081M0NmRS85SzRTK1k3eXkwRXhoQ3BWSnBF?=
 =?utf-8?B?N2xiT3lROW0xY05xVCtmSnFtbjB5a0gwZGdiWENrenZXV05FWnhkRVV3ZXAr?=
 =?utf-8?B?eE56NjRNK1ZRMDMyYk9iTWNUdm9RUmd6cjlIZnFzRThTbWdyNkdMKzRmQzBH?=
 =?utf-8?B?bGlxc0hMbWdoYUdpV0FhaU9wVXNXTDRBMWpKV1VSMTJxM3lwOVBXd1lYVHVn?=
 =?utf-8?B?emZ4VGRQUkNQR1lZVm5zVDgrNVZUVzVKVGlScTh4QmE1Wm5acXlSa2Voc3hQ?=
 =?utf-8?B?NmNYdi9YcnY2ZW9sSnBlOEliR3FKVjcwYnk4dkZCY3ZZSEdTQy9NTDJybXd2?=
 =?utf-8?B?TGNRc1RyVk1LSU0rSEl4bkF2dFRWRk9IVTEvYnJEUE1RNVB6c1FJd0JzakJH?=
 =?utf-8?B?MUdTdmxYK043T3JQVmo4TWc2TEpzUUlEcGJIdWxIcFZpNUgwTTV3bFFHbHkz?=
 =?utf-8?Q?OUfOdXJP2Q3A7aDk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A018F914E79424B8FD3D359B23155CB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 236184d8-8779-4053-482c-08da1d3f3cec
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2022 11:17:46.7828
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CBun9aqT601tIQ1V1pgMa5lSh/ZI5NhIr54dJe1ny96ST74PHjqUbDVs5ojOiFhZQt4PzLib40XI0hLs/KgV7nhTafX0/ssFdfWoAqrhXsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6965
X-OriginatorOrg: citrix.com

T24gMDYvMDQvMjAyMiAxNDo0NCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFtDQVVUSU9OIC0gRVhU
RVJOQUwgRU1BSUxdIERPIE5PVCByZXBseSwgY2xpY2sgbGlua3MsIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZS4NCj4gDQo+IE9uIDAxLjA0LjIwMjIgMTI6NDcsIEphbmUgTWFsYWxhbmUgd3Jv
dGU6DQo+PiBJbnRyb2R1Y2UgYSBuZXcgcGVyLWRvbWFpbiBjcmVhdGlvbiB4ODYgc3BlY2lmaWMg
ZmxhZyB0bw0KPj4gc2VsZWN0IHdoZXRoZXIgaGFyZHdhcmUgYXNzaXN0ZWQgdmlydHVhbGl6YXRp
b24gc2hvdWxkIGJlIHVzZWQgZm9yDQo+PiB4ezJ9QVBJQy4NCj4+DQo+PiBBIHBlci1kb21haW4g
b3B0aW9uIGlzIGFkZGVkIHRvIHhsIGluIG9yZGVyIHRvIHNlbGVjdCB0aGUgdXNhZ2Ugb2YNCj4+
IHh7Mn1BUElDIGhhcmR3YXJlIGFzc2lzdGVkIHZpcnR1YWxpemF0aW9uLCBhcyB3ZWxsIGFzIGEg
Z2xvYmFsDQo+PiBjb25maWd1cmF0aW9uIG9wdGlvbi4NCj4+DQo+PiBIYXZpbmcgYWxsIEFQSUMg
aW50ZXJhY3Rpb24gZXhpdCB0byBYZW4gZm9yIGVtdWxhdGlvbiBpcyBzbG93IGFuZCBjYW4NCj4+
IGluZHVjZSBtdWNoIG92ZXJoZWFkLiBIYXJkd2FyZSBjYW4gc3BlZWQgdXAgeHsyfUFQSUMgYnkg
ZGVjb2RpbmcgdGhlDQo+PiBBUElDIGFjY2VzcyBhbmQgcHJvdmlkaW5nIGEgVk0gZXhpdCB3aXRo
IGEgbW9yZSBzcGVjaWZpYyBleGl0IHJlYXNvbg0KPj4gdGhhbiBhIHJlZ3VsYXIgRVBUIGZhdWx0
IG9yIGJ5IGFsdG9nZXRoZXIgYXZvaWRpbmcgYSBWTSBleGl0Lg0KPj4NCj4+IE9uIHRoZSBvdGhl
ciBoYW5kLCBiZWluZyBhYmxlIHRvIGRpc2FibGUgeHsyfUFQSUMgaGFyZHdhcmUgYXNzaXN0ZWQN
Cj4+IHZpcnR1YWxpemF0aW9uIGNhbiBiZSB1c2VmdWwgZm9yIHRlc3RpbmcgYW5kIGRlYnVnZ2lu
ZyBwdXJwb3Nlcy4NCj4+DQo+PiBOb3RlOg0KPj4NCj4+IC0gdm14X2luc3RhbGxfdmxhcGljX21h
cHBpbmcgZG9lc24ndCByZXF1aXJlIG1vZGlmaWNhdGlvbnMgcmVnYXJkbGVzcw0KPj4gb2Ygd2hl
dGhlciB0aGUgZ3Vlc3QgaGFzICJWaXJ0dWFsaXplIEFQSUMgYWNjZXNzZXMiIGVuYWJsZWQgb3Ig
bm90LA0KPj4gaS5lLiwgc2V0dGluZyB0aGUgQVBJQ19BQ0NFU1NfQUREUiBWTUNTIGZpZWxkIGlz
IGZpbmUgc28gbG9uZyBhcw0KPj4gdmlydHVhbGl6ZV9hcGljX2FjY2Vzc2VzIGlzIHN1cHBvcnRl
ZCBieSB0aGUgQ1BVLg0KPj4NCj4+IC0gQm90aCBwZXItZG9tYWluIGFuZCBnbG9iYWwgYXNzaXN0
ZWRfeHsyfWFwaWMgb3B0aW9ucyBhcmUgbm90IHBhcnQgb2YNCj4+IHRoZSBtaWdyYXRpb24gc3Ry
ZWFtLCB1bmxlc3MgZXhwbGljaXRseSBzZXQgaW4gdGhlIGNvbmZpZ3VyYXRpb24gZmlsZSwNCj4+
IHNvIGl0IGlzIHNhZmUgdG8gbWlncmF0ZSBhIGd1ZXN0IHRoYXQgZG9lc24ndCBoYXZlIGFzc2lz
dGVkX3h7Mn1hcGljDQo+PiBzZXQgaW4gaXRzIGNvbmZpZyBmaWxlIGJldHdlZW4gaG9zdHMgdGhh
dCBoYXZlIGRpZmZlcmVudCBzdXBwb3J0IGZvcg0KPj4gaGFyZHdhcmUgYXNzaXN0ZWQgeHsyfUFQ
SUMgdmlydHVhbGl6YXRpb24uDQo+IA0KPiBXaGlsZSBJIGNhbiBhZ3JlZSB0aGlzIGlzIHRoZSBj
YXNlIGFzIGZhciBhcyB5b3VyIGNoYW5nZXMgYXJlIGNvbmNlcm5lZCwNCj4gaXQgcmVhZHMgYXMg
aWYgdGhpcyB3YXMgYSBicm9hZGVyIHN0YXRlbWVudC4gU2luY2UgaHlwZXJ2aXNvciBDUFVJRCBs
ZWFmDQo+IGNvbnRlbnRzIGNhbiBjaGFuZ2UgYWNyb3NzIHN1Y2ggYSBtaWdyYXRpb24gKHdoaWNo
IGlzIHByZS1leGlzdGluZw0KPiBiZWhhdmlvciksIEknbSBub3QgY29udmluY2VkIHRoZSBzdGF0
ZW1lbnQgaXMgZ2VuZXJhbGx5IGFwcGxpY2FibGUuDQpJIHNlZSwgSSB3aWxsIG1ha2UgdGhpcyBj
bGVhcmVyIHRvIG9ubHkgcmVmZXJlbmNlIHRoZSB0b29sc3RhY2sgc2V0dGluZy4NCg0KVGhhbmtz
LA0KDQpKYW5lLg==

