Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9B165CB9D
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 02:43:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470889.730551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCsnE-0002um-RU; Wed, 04 Jan 2023 01:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470889.730551; Wed, 04 Jan 2023 01:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCsnE-0002sJ-OU; Wed, 04 Jan 2023 01:42:12 +0000
Received: by outflank-mailman (input) for mailman id 470889;
 Wed, 04 Jan 2023 01:42:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tpAs=5B=citrix.com=prvs=3612a7559=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pCsnC-0002sD-L1
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 01:42:10 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd129cfc-8bd0-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 02:42:05 +0100 (CET)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Jan 2023 20:41:59 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5022.namprd03.prod.outlook.com (2603:10b6:208:1ab::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 01:41:57 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 01:41:57 +0000
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
X-Inumbo-ID: fd129cfc-8bd0-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672796526;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4zdzJlG75cMPxlVOfMNmGrXGm/DiNSso512V2M2wsXg=;
  b=UGUrTio43wf+7qzzCR0k+j1JxcG7Ce5aRvBObCdbaPs5o4MnkbZ9kzC0
   DmKaoizzlbThZRSJjLxCF6VLNAlch50P/8weVhEUupAFvLZtuHeOu8aXh
   bwmolQYOjIvpdF3iADbEvMt58TCMieQXhKwDpNfxiQz8Kip+fgii8X2zY
   E=;
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 90010168
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:D5rKf6skDRdWy6jlb1VcBm2FmefnVLZfMUV32f8akzHdYApBsoF/q
 tZmKTiEMvjZNDD1LYsgPInloBgEuJ/SmN9jSAo6qCoxQy5B+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoQ5AaGzCFIZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwLS0rPyumoN2P6Y2HU65dh8ADMtLnM9ZK0p1g5Wmx4fcOZ7nmGv+PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgf60bou9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOzgrqcy2QPDroAVIEUuBUKinfSDs3W3HO1cF
 E4up3M2sZFnoSRHSfG4BXVUukWspQUAUtBdF+k77gClyafO5QudQG8eQVZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAeJHUOYiIsRgIf797u5oo0i3rnS9doEKexyNrvCzz06
 zmPoG41gLB7pckP2qag/FGBgC+2oZPJTQkd6QDeX2bj5QR8DLNJfKSt4FnfqPpFcoCQSwDbu
 GBewpbPqucTEZuKiSqBBv0XG62k7OqENzuahkNzG54m9HKm/HvLkZ1s3QyS7XxBaq4sEQIFq
 meK0e+NzPe/5EeXUJI=
IronPort-HdrOrdr: A9a23:cvHzUKvYz8TGFkid6uE8edbF7skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-IronPort-AV: E=Sophos;i="5.96,297,1665460800"; 
   d="scan'208";a="90010168"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NxsKbGibreGMl0Ag8UXh0EX3w+AkOqpvaEQ/KOWKsT8018MfPT+3W8kA2QVEBWkBcewcTIaw8HR55bvCZZL6BOFgwjgb1KnA6Rq8t/rbKiu85ykbTZmpLCPJ12CNsc4lWtytKtqdf34Lc92TJo1Y14u4OhLTh45p7kl8hGc+mfpfykElvxm0YqRA7SaAaGULjZqEDk7G6wSBDnApOWZrhSHtfxAzTZzv0/bqdTOa4HdKlhziOIVTz3TXiKAh8/MMyOi5QbjjA4taxtSew3tzDdjsa+MpZzpTBrHx4RBM4nnSkbeXj3xY6zDRcFYNbIe9mzf63oMc0M5R5vyM4EE0mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zdzJlG75cMPxlVOfMNmGrXGm/DiNSso512V2M2wsXg=;
 b=XzmKaQ0Jhr9jx3/ix0AtrFdlk4WMnilSe5xWjzR3y9kaw71+TQCDtUaKRORUz88qf7dyEmDPzQdcUT+2pZIlHybEmYBzCTjEIyT2hz1iWa/DqdgVrnI80Fn2mDxkTSIx8FAVOQIvl1yP6yrHl8NlSIEB1aNvUqwC5IyG+5ULrAyYTfMJ+aSaDZp26Ve37F8xDIGtZiUaTftbw8k5tfs+eZSOqxNo3NzUVsIN7yKW2l7LD0LO76mtBJ011APaj/xmXPTbjndD5Qu3QIuoidt/SBJoFSGoWgZ0TAVRt9zZsZNgavbh+k4PHq1SI3RW5DXW9uPjEGF6QMQ7ZLU2vYysdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zdzJlG75cMPxlVOfMNmGrXGm/DiNSso512V2M2wsXg=;
 b=oI53Kb3SjEhuGbEyDTtf/HJvKeTLyOFljsDVSEN3n9uesiqZHYfCVX1kmW13u3EnRwBuyIkmUeSBGFQ2WkQ+Fjc8w5qEjoDzT8+t31tbZNNhpNMm1a8qnRv1ApkSrIvw3fpC0ObNstNuBrNc70xUUK2vExa5VwT4e4Gq8ZRO+zo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein
	<cardoe@cardoe.com>, Anthony Perard <anthony.perard@citrix.com>, Michal Orzel
	<michal.orzel@amd.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 4/6] CI: Express HYPERVISOR_ONLY in build.yml
Thread-Topic: [PATCH 4/6] CI: Express HYPERVISOR_ONLY in build.yml
Thread-Index: AQHZG+cbFLjU6ViRqEqaO8BfTNldnq6NfEWAgAADPYCAAAKVgIAAAY8A
Date: Wed, 4 Jan 2023 01:41:57 +0000
Message-ID: <4f9a9927-c287-b40e-e4b0-653e69dbc1bb@citrix.com>
References: <20221230003848.3241-1-andrew.cooper3@citrix.com>
 <20221230003848.3241-5-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2301031713530.4079@ubuntu-linux-20-04-desktop>
 <34e692e3-ef76-a43e-ec4f-a7c1ed2d094f@citrix.com>
 <alpine.DEB.2.22.394.2301031733410.4079@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2301031733410.4079@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MN2PR03MB5022:EE_
x-ms-office365-filtering-correlation-id: e9c54b3d-cb61-4b94-0dcf-08daedf4dd8b
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ewMfha2+TxL6HkdkvUj4v8C9WNEsjmYNEBTKpLEV/RMzHYNhbfYC+Kw5UCiPdpoAP6wS6+p6rR8WsCjQ84kGnxPxxihPc+5w0RnbMdrzj1H27MtXdl3a7FPa1w+GJHO5QrmkoBYICYT4HQGA3cHFDLlq7gyQeQxFodD4bCKdC3BGnP7k1ajjJcMMjCtCL2F0g79qQHz9N4zRXcgndtt1aHFhF6Df9X/Sxo8qldNhHvVue8OPwJBZYMIJwN4ZVbU4jsSJbmMD2IHUDDV2N7aWcs4LH7OSjWNxc7D/D04vBEHCzlGI56axXkfba4fJxn9xXQHuZo3waoPzV4vzHov+zIcGZg5kbh3kvhdLscRShdj0ltFUB2b9NuUJN9WOaFkxcyVDXj9V9tfA7FKZeZrBM8+JtsOcMmKbD+p50TCBMNQwUTrah7UMBQ+gu93XvyQXOFkMYqQvc8rF/xUrUqpZ/v2q/D8nsSAbFcPBNCpXQXHLbOuFh1qQODZi5UD5N9e3/4K7ZQXPj8vi9yBTWm1P4FyIKsXZDZPe6d4f8arFofE3WUm+tHOTrpzGqxz+/v7juiIw4MV2jptzzg8nTFNzvsxVaCaEk8dcF0HTlTqXmrGtyRcqm41QvMe+WoAna3QM5X3kGkvrz43RN+nUOIYaWG010F/nyY1BP1uM8h5KNBvBbylaeqbrHy8aaCLPaRUtyG5Mea3o+9C827yrqaPutkzoYTY45uBq/1nP5kmqMbLGKRs0d0Y1eYuoGQR8uebzNYNJNWOR6ANfxZLcu7poOg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(451199015)(31686004)(36756003)(86362001)(31696002)(66446008)(4326008)(54906003)(91956017)(66946007)(41300700001)(6916009)(66556008)(38070700005)(66476007)(64756008)(76116006)(8676002)(82960400001)(38100700002)(122000001)(26005)(186003)(6486002)(53546011)(6512007)(71200400001)(478600001)(5660300002)(8936002)(2906002)(6506007)(316002)(2616005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YnZTTVU0aHRsRlpKS0NwUmVUZFlETGZvK0lJYWxZTk1reW1Fc0VyUU5vdERZ?=
 =?utf-8?B?WUJOTW50SXhWZHdOei9xN0M0TnhQemdEcWJTVlNpb1hFa0twVy9XampGRnIy?=
 =?utf-8?B?eDUzZUswTml0dHBCVDM5cWZrVWFseEk1d0FISXhwekhIMENENllMRnBaOW1w?=
 =?utf-8?B?a1ZBeW93L0l3eGpvMGJPNys3MXNlRktyRmVBT3FrZ2R6U042RXJCdCtOMjZU?=
 =?utf-8?B?emdCZlNlYmNJZzA0aEVBR0l4NzNJcHcvK3JBMzNDOWVnSDhNTnlMc0FxZHI4?=
 =?utf-8?B?MndVbDhBbGwzbW53RElpSms0TWczWVJhT2xnUW5veXFWWUFUL3B1TzN0NUs5?=
 =?utf-8?B?MG9XNmdtTGlqVERuUGxzQjVSSzJHSnNUTnJZdVZiczBsZy9ZYWMyZTh2T2hC?=
 =?utf-8?B?d3FnaGJGL1Zkc01FL2czWXZnMk13U0pDQ09FMStGM1FDNkF1QUtGelhlTWN0?=
 =?utf-8?B?dVZwTWFUKzY4WnYxcTZ0RGhSdHQzZ2hvQjFkK2VpbDE0S01lYjI3U0p1MWky?=
 =?utf-8?B?VDVvcUFsL055T0ExK2lubndQMVlkTFlxRnpRZlZUdXhJMHBZc1VZdHdHNFNM?=
 =?utf-8?B?ay9KMWZLNER0a1BKNEZBTlZjWExCZGhsNmhGcWk5TUxaWThaRU1EM0dRbTBI?=
 =?utf-8?B?RGljUWE0a0I5azBjYWllc3VqZytaUTl6VkxTNnlHUkpVSGtBZmZvMHpqaSsw?=
 =?utf-8?B?OVFKUWFlM3VwTXpoYlo3WXFSNWtxRlliMzJNVFptN3l2RTVGVGpRemFudkRS?=
 =?utf-8?B?NWduSi90cGJyMXNzYlNoODdza0RURDQ5c0hRL0VhcWw4Q3Fibmw1bVpZUW5z?=
 =?utf-8?B?TjIrK3greWh2b0xxbVdhT2dVaElRM1FpSmt4WldpVmZrb0tid252VlAweW9o?=
 =?utf-8?B?T0s3S01ab1UrSVdqa3M4empSdzQwZnZYb1h4MnZBVnZjQWtDaUNmOVFyWE0r?=
 =?utf-8?B?dGIyMW9NK2ZiTWpXV0E5ZHVtOXNPVDQrVE5yQzZCcVJSWjM5RTNsZEdqcW55?=
 =?utf-8?B?Rk9lZGdKWTVuWWwweFJpazZ2QWh4SmJaWlcvUEFOa0JETTdGdjloaUNhZ0lp?=
 =?utf-8?B?MFc4Z2w5U2xYaGpvMnJHQ05rK2x5aWdWVlVvbTRKQkg2WXd3Ym9WMnhHRmFv?=
 =?utf-8?B?dzFFblk5UmdFcktEUnFLeDUwdElEb3ZPQU1QSHovbk9zWGluOXdrYXZmcG0v?=
 =?utf-8?B?WkhadmtReHJRWWZzV1pDMzRvbkU2dWhOZmV2bTQrT1ZIOWlqMW85TEpWbk5Q?=
 =?utf-8?B?M3hxV1Uzb0t3VUVTL1dEUFJSZ0F3U0IyRm50eDg5eVZjNDdZNWZiNjFtK1Iv?=
 =?utf-8?B?UnNwOElxdHZGY1FZVHJyUjlZMk5zQmF1aWRVVzZHbFNKWHRYNTZIYXJmdkZK?=
 =?utf-8?B?TWx0SDNWa2dJSnE1eXVLK0tMSEVzRVEvTTVncit2OEIzT2pScWRGcW5ZRjFp?=
 =?utf-8?B?M2dwRkdLU1RtV0g3NlQveFVBSEVvcGVHc1NDZ1lBQXJnZzE3V29xU01YeDE1?=
 =?utf-8?B?NTVoSGhSS1BWbk9ZK205QjJuZjd1Y2tsOENwUEdWTk5ybmxCQnFwYzhGNmpi?=
 =?utf-8?B?NFBUQXFKSHgyS0w0TXdON1NSQVdMR3ozZ0dkVXRhNDBHWjdUVlV3d2FwbXZm?=
 =?utf-8?B?YmswelAzbHF1aDJyRFdIZ1JUbXJwOVZ2WGkyWURXa0RMQlAydEc1UFNnaC8r?=
 =?utf-8?B?ZWNkWHRMeGJjU21iU0lSYWpmZy9malk4NHc5eHVpek5mcVI1MXIzVEh2dkx2?=
 =?utf-8?B?ZEtCeU9CcEtoOFdkVzBydGVSY3BKZThNN3B5NWg4bUF3SlBBK3k1SXI3Q0VI?=
 =?utf-8?B?cGVxM0lpTm9OUUZlKytIWFVsOXdHR21TVE1UZk1YTXQ5M2dwUUFJbUsvdnZN?=
 =?utf-8?B?UUZhRmJ2VWE2RTZSQTRiQ1p3dmQyeTFiWkZGYitTQU1lSWJKYUppKzEwUWpP?=
 =?utf-8?B?R2VRZWtIOU9uM3ZaZklZcGFxbmNMNml4M08xemRXVGNxSGpaTHNkT0lEUWVx?=
 =?utf-8?B?NHhtMDNPakpNUk5CV2FDK0J3R2dwNlQ5K3dSeEwxTHRMWTNHQWU2a0xTQzNq?=
 =?utf-8?B?MnlRYWYxOE1GNnB5UU1yQ3ZzMUpMbFhRT3A5MmUyN1NZQXNIT3U0NE5PeVY2?=
 =?utf-8?Q?QeiUove9+CZxWZSfu74KJlVh9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1239397978D90B4B8430A6826B3FDC78@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YUyL0nEbAMSdKqJQXSuH8Z+PrwARjbl/AoH6HLp7X6Y7yar7oIsmpJDKElj4t4xlu3lpseTIF0/JVhHblce2sso8ibmib+ndSUSI71kFyN3CaHxmQ14stx4QRCj8ArblQfSmwnefTCoUSqQHC2z2IGrUaiybSbOChL1fv3Cj7hT/O1EpQGUu0huBj2rJiZmEneUbqMJ16HE69twrQy3e1tDpGXYEx5SdBfyBM++maZeBSInX7oHzObwMgxcQzIEMyu0dTEaail0EflkVRYlEqZhMaX2u80uTBNeGHDLmWhRAiEEN7Utq1mACj/W2Fqj4h8Ejxg5oneYT8uJJPlZS+sOLEH1j8w8KF7hImDCya3D5+6seHMDxlmLr69iIhgrY9XBIZQugJiCZIMbXfC4jxnWSL+ejqASJAWcSP/d8XznkgHsZrxfyDiGhvThyINbwLpptD3jyNLtrgiTsMNYa8YzaTF1cIlrjWWJ+LivGAS2N6cn78NCtbAGFy0lnU9ksbpiVVf0rf202THbzXNhuxFUzGHO1ufRmUi2svoaTmeTk/DNdPkuQaF6qqIkQK39woqJ59EsiGAGo3Ww9LpvaeDfW1nyor64NshdYeYMXdebv+KDG0AI4FEBuEm6trSJczaJeedzqSC9BlJVqmPSNseMSXvOxXbfD+ZUGi2qC1I3XbQL2nsuv8WfzbsPqVNRigUC7iHa0ue8DWh2M6tDXrUJ0ghp87RbYgyzmX2ETrPswt3BtBuEMbLtVecbfu6rLCdh3JYLb8gkxXnlXaJ4YDR3228i9usH5T82dL+dQvsHQZKV5EGYqJf3KWhtd03x/PYIpCwOpy52RqFCM2U4Gohau0aejCkh5C4gCAUolJMQD6U6tbxgNhkndBpfQ2TW/
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9c54b3d-cb61-4b94-0dcf-08daedf4dd8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2023 01:41:57.0871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WjVoH2+7Ml0cbU75bkReyjjRE6T2H9mZ2ADzVpTUgo/g+Y5HE1yD2AmQe/q0bsoKlMyWU49tOe2AaKJLU7wHdNfnedeKa4s1/loIW0APAVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5022

T24gMDQvMDEvMjAyMyAxOjM2IGFtLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+IE9uIFdl
ZCwgNCBKYW4gMjAyMywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IE9uIDA0LzAxLzIwMjMgMTox
NSBhbSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+IE9uIEZyaSwgMzAgRGVjIDIwMjIs
IEFuZHJldyBDb29wZXIgd3JvdGU6DQo+Pj4NCj4+Pj4gV2hldGhlciB0byBidWlsZCBvbmx5IFhl
biwgb3IgZXZlcnl0aGluZywgaXMgYSBwcm9wZXJ0eSBvZiBjb250YWluZXIsDQo+Pj4+IHRvb2xj
aGFpbiBhbmQvb3IgdGVzdGNhc2UuICBJdCBpcyBub3QgYSBwcm9wZXJ0eSBvZiBYRU5fVEFSR0VU
X0FSQ0guDQo+Pj4+DQo+Pj4+IENhcGl0YWxpc2UgSFlQRVJWSVNPUl9PTkxZIGFuZCBoYXZlIGl0
IHNldCBieSB0aGUgZGViaWFuLXVuc3RhYmxlLWdjYy1hcm0zMi0qDQo+Pj4+IHRlc3RjYXNlcyBh
dCB0aGUgcG9pbnQgdGhhdCBhcm0zMiBnZXQgbWF0Y2hlZCB3aXRoIGEgY29udGFpbmVyIHRoYXQg
Y2FuIG9ubHkNCj4+Pj4gYnVpbGQgWGVuLg0KPj4+Pg0KPj4+PiBGb3Igc2ltcGxpY2l0eSwgcmV0
YWluIHRoZSBSQU5EQ09ORklHIC0+IEhZUEVSVklTT1JfT05MWSBpbXBsaWNhdGlvbi4NCj4+Pj4N
Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IENDOiBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5j
b20+DQo+Pj4+IENDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
DQo+Pj4+IENDOiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4NCj4+
Pj4gQ0M6IE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+Pj4+IENDOiBPbGVr
c2lpIEt1cm9jaGtvIDxvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+
ICBhdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC55YW1sIHwgIDIgKysNCj4+Pj4gIGF1dG9tYXRp
b24vc2NyaXB0cy9idWlsZCAgICAgICAgfCAxMSArKysrLS0tLS0tLQ0KPj4+PiAgMiBmaWxlcyBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+Pj4+DQo+Pj4+IGRpZmYg
LS1naXQgYS9hdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC55YW1sIGIvYXV0b21hdGlvbi9naXRs
YWItY2kvYnVpbGQueWFtbA0KPj4+PiBpbmRleCA5M2Q5ZmY2OWE5ZjIuLmU2YTkzNTdkZTNlZiAx
MDA2NDQNCj4+Pj4gLS0tIGEvYXV0b21hdGlvbi9naXRsYWItY2kvYnVpbGQueWFtbA0KPj4+PiAr
KysgYi9hdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC55YW1sDQo+Pj4+IEBAIC01MTYsMTEgKzUx
NiwxMyBAQCBkZWJpYW4tdW5zdGFibGUtZ2NjLWFybTMyOg0KPj4+PiAgICBleHRlbmRzOiAuZ2Nj
LWFybTMyLWNyb3NzLWJ1aWxkDQo+Pj4+ICAgIHZhcmlhYmxlczoNCj4+Pj4gICAgICBDT05UQUlO
RVI6IGRlYmlhbjp1bnN0YWJsZS1hcm0zMi1nY2MNCj4+Pj4gKyAgICBIWVBFUlZJU09SX09OTFk6
IHkNCj4+Pj4gIA0KPj4+PiAgZGViaWFuLXVuc3RhYmxlLWdjYy1hcm0zMi1kZWJ1ZzoNCj4+Pj4g
ICAgZXh0ZW5kczogLmdjYy1hcm0zMi1jcm9zcy1idWlsZC1kZWJ1Zw0KPj4+PiAgICB2YXJpYWJs
ZXM6DQo+Pj4+ICAgICAgQ09OVEFJTkVSOiBkZWJpYW46dW5zdGFibGUtYXJtMzItZ2NjDQo+Pj4+
ICsgICAgSFlQRVJWSVNPUl9PTkxZOiB5DQo+Pj4gY2FuIHlvdSBtb3ZlIHRoZSBzZXR0aW5nIG9m
IEhZUEVSVklTT1JfT05MWSB0byAuYXJtMzItY3Jvc3MtYnVpbGQtdG1wbCA/DQo+PiBOb3QgcmVh
bGx5IC0gdGhhdCdzIHRoZSBwb2ludCBJJ20gdHJ5aW5nIHRvIG1ha2UgaW4gdGhlIGNvbW1pdCBt
ZXNzYWdlLg0KPj4NCj4+PiBJIHRoaW5rIHRoYXQgbWFrZXMgdGhlIG1vc3Qgc2Vuc2UgYmVjYXVz
ZSAuYXJtMzItY3Jvc3MtYnVpbGQtdG1wbCBpcyB0aGUNCj4+PiBvbmUgc2V0dGluZyBYRU5fVEFS
R0VUX0FSQ0ggYW5kIGFsc28gdGhlIHg4Nl82NCB0YWcuDQo+PiBJdCdzIG5vdCBhYm91dCB4ODZf
NjQ7IGl0cyBhYm91dCB0aGUgY29udGFpbmVyLg0KPj4NCj4+IFdoZXRoZXIgd2UgY2FuIGJ1aWxk
IGp1c3QgWGVuLCBvciBldmVyeXRoaW5nLCBzb2xlbHkgZGVwZW5kcyBvbiB0aGUNCj4+IGNvbnRl
bnRzIGluIGRlYmlhbjp1bnN0YWJsZS1hcm0zMi1nY2MNCj4+DQo+PiBJZiB3ZSB3YW50ZWQgdG8s
IHdlIGNvdWxkIHVwZGF0ZSB1bnN0YWJsZS1hcm0zMi1nY2MncyBkb2NrZXJmaWxlIHRvDQo+PiBp
bnN0YWxsIHRoZSBhcm0zMiBjcm9zcyB1c2VyIGxpYnMsIGFuZCBkcm9wIHRoaXMgSFlQRVJWSVNP
Ul9PTkxZDQo+PiByZXN0cmljdGlvbi4NCj4gSWYgaXQgaXMgYSBwcm9wZXJ0eSBvZiB0aGUgY29u
dGFpbmVyLCBzaG91bGRuJ3QgSFlQRVJWSVNPUl9PTkxZIGJlIHNldA0KPiBldmVyeSB0aW1lIHRo
ZSBkZWJpYW46dW5zdGFibGUtYXJtMzItZ2NjIGNvbnRhaW5lciBpcyB1c2VkPyBJbmNsdWRpbmcN
Cj4gZGViaWFuLXVuc3RhYmxlLWdjYy1hcm0zMi1yYW5kY29uZmlnIGFuZA0KPiBkZWJpYW4tdW5z
dGFibGUtZ2NjLWFybTMyLWRlYnVnLXJhbmRjb25maWc/DQo+DQo+IEkgcmVhbGl6ZSB0aGF0IHRo
ZSBvdGhlciAyIGpvYnMgYXJlIHJhbmRjb25maWdzIHNvIEhZUEVSVklTT1JfT05MWSBnZXRzDQo+
IHNldCBhbnl3YXkuIEJ1dCBpZiBIWVBFUlZJU09SX09OTFkgaXMgYSBwcm9wZXJ0eSBvZiB0aGUg
c3BlY2lmaWMNCj4gY29udGFpbmVyLCB0aGVuIEkgdGhpbmsgaXQgd291bGQgYmUgYmVzdCB0byBi
ZSBjb25zaXN0ZW50IGFuZCBzZXQNCj4gSFlQRVJWSVNPUl9PTkxZIGV2ZXJ5d2hlcmUgZGViaWFu
OnVuc3RhYmxlLWFybTMyLWdjYyBpcyB1c2VkLg0KPg0KPiBFLmcuIG9uZSBkYXkgd2UgY291bGQg
anVzdCByYW5kY29uZmlncyB0byBidWlsZCBhbHNvIHRoZSB0b29scyB3aXRoIGENCj4gc2ltcGxl
IGNoYW5nZSB0byB0aGUgYnVpbGQgc2NyaXB0IGFuZCBvdGhlcndpc2Ugd2Ugd291bGQgbmVlZCB0
bw0KPiByZW1lbWJlciB0byBhbHNvIGFkZCB0aGUgSFlQRVJWSVNPUl9PTkxZIHRhZyBmb3IgdGhl
IG90aGVyIDIgam9icyB1c2luZw0KPiBkZWJpYW46dW5zdGFibGUtYXJtMzItZ2NjLg0KDQpPaywg
c28gd2Ugd2FudCA0IEhZUEVSVklTT1JfT05MWSdzIGluIHRvdGFsLCBvbmUgZm9yIGVhY2ggaW5z
dGFuY2Ugb2YNCkNPTlRBSU5FUjogZGViaWFuOnVuc3RhYmxlLWFybTMyLWdjYyA/DQoNCn5BbmRy
ZXcNCg==

