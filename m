Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 117D8677A5B
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 12:51:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482788.748490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJvLO-0005b3-7h; Mon, 23 Jan 2023 11:50:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482788.748490; Mon, 23 Jan 2023 11:50:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJvLO-0005Z4-4v; Mon, 23 Jan 2023 11:50:34 +0000
Received: by outflank-mailman (input) for mailman id 482788;
 Mon, 23 Jan 2023 11:50:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HTo8=5U=citrix.com=prvs=380e0b34c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pJvLM-0005Yy-HR
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 11:50:32 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20c6fe80-9b14-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 12:50:28 +0100 (CET)
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jan 2023 06:50:26 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5945.namprd03.prod.outlook.com (2603:10b6:806:11c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 11:50:24 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 11:50:23 +0000
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
X-Inumbo-ID: 20c6fe80-9b14-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674474629;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=uA4REJyAREFunQrTC+sFGsAZOIbdT7QofAVB5zoTSoM=;
  b=PGNtMFm7WMsd3G4ShrfB1DuVqhy+D20RnMROUKf4qOtRAdlqzFWdaIjn
   sW0bnvFbS999+YNVycNsivEw6bzefhTOi/0dKjbY2gDCDqvuXar2Fl0cX
   KfLpnp8AFANyEMRZ/bym4AFzZeYSht9yorg4fU5d1UoKqIzzURfMh2UC5
   I=;
X-IronPort-RemoteIP: 104.47.55.173
X-IronPort-MID: 93835459
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GonV/6K+McwBCgDUFE+RSZQlxSXFcZb7ZxGr2PjKsXjdYENSgTZUn
 2VOW26EPK2NNmP0ctB1bo+/9R8H6MPRxtdhHFZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5wZlPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4wMUce5
 7tHFgsOQU+ehOO80YiREfhz05FLwMnDZOvzu1lG5BSAV7MMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGMl2Sd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzHirA99OSezQGvhCn1OtnzYTUh4vDHC7+NKitHaFevNDN
 BlBksYphe1onKCxdfH6WxC7u3+F+B0BQd1bE+49wA6Iw6vQpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRupIjQcJ2IGYS4CTCMG7sPlrYV1iQjAJv5sEaezisD+EBnqw
 i6Ntyk4jPMYistj/6+891rWjimsopXMRwgd6QDeX2bj5QR8DKasY42z9VHa97BONo+fRVial
 GcIkI6V6+VmJZqKkiqKQukEArCyz/mAOTzYx1VoGvEcGy+F/neiecVa5mF4LUIwaMIcI2a2O
 wnUpB9b44JVMD2yd6hrbomtCsMsi6/9CdDiUfOSZd1LCnRsSDK6EOhVTRb49wjQfIIEyMnT5
 b/znR6QMEsn
IronPort-HdrOrdr: A9a23:oQmBm61a+HXXxMbU9HzDqwqjBeBxeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5AEtQ5OxpOMG7MBbhHO1OkPUs1NaZLULbUQ6TRr2KgrGSugEIdxeOldK1kJ
 0QCZSWa+eAR2SS7/yKmDVQeuxIqLLrkcCVbKXlvgxQpGpRGsVdBnJCe2Cm+zpNNW577PQCZf
 ihz/sCgwDlVWUcb8y9CHVAdfPEvcf3mJXvZgNDLwI76SGV5AnYpILSIly95FMzQjlPybAt/S
 zuiAri/JiutPm911v1y3LT1ZJLg9Hso+EzS/Bky/JlZAkEuDzYJLiJaIfy/wzdZ9vfqmrCpe
 O84ivI+f4Drk85MFvF5ScFkDOQrwrGo0WSt2Nwx0GT7PDRdXYCEMxGiptechzFr2QdnPwU6t
 MN40up86NNCxXOhSL84MWNcSpLuA6bnVoO+NRjyUC2d+MlGeZshJ1a80VPHJgaGiXmrIghDe
 l1FcnZoO1baFWAchnizx9SKfGXLwAO9y29Mz8/k93Q1yITkGFyzkMeysBalnAc9IglQ50B4+
 jfKKxnmLxHU8dTNMtGda88aNryDnaITQPHMWqUL1iiHKYbO2jVo5qy5Lku/umldJEB0ZN3kp
 XcV1FTs3I0ZivVeISz9YwO9gqITHS2XDzrxM0b759luqfkTL6uKiGHQEBGqbrUnxzeOLyoZx
 +eAuMkPxa4FxqeJW9g5XyPZ6Vv
X-IronPort-AV: E=Sophos;i="5.97,239,1669093200"; 
   d="scan'208";a="93835459"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYp/6W8Ms6GY4JHquJYVbYluKQ8vHvuzcSrTopHqat6E1mvMewK0mX1LDRr3Ena2QVLVc4YgU5qTt3cqmmLeQUYttKDdFBzOGwoJE9E3X41OnoNDdI58OvhIQ4nn6dXnOS2LaRvTLbw59uv9dXTEedTDWywbdh4VufZ73iT+FNB76Edzc3k92IH+aiZCd2tOIyXb7gflmBcIio/L9FeiizIHVkTMi6psYlSAj9O0EzWOqWDMzaIYie6826Pi2OanKJ1YdCCz9eBPG0RzCEzQZAI77+LaUIM3IZhYW3IayjJGR0FHJon7K9vNEJz09rsC0sCpKv7LB1PZSJC3WOrW0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uA4REJyAREFunQrTC+sFGsAZOIbdT7QofAVB5zoTSoM=;
 b=MhYxeajkLMRNWC8VJcdWw9fU1rpy7gsYgyKsUW8KpkK6UuMkvrvLBnFP+AMxjzNNw6ZylkTe9Qkn9BVkys/hrDJxz0ELkSDIxT/RJkHQzf6WsS34DUncYiLzvGreOvS4zPNb26w4pcR4OlNqRZRVE4z8KXx22YyES2riGHN+pANrso+Fk7Wh6PVWOsyUJemSsVnIGTXXDM3zdvX9Cj9rdQmzrCLQCo2zS5t85d0Tc80Ev5CFTvWPVL8IRXxnpcQPTSqW2gVrhdKl+T3UfKGkbUgwesETO+GNDEbcYj/NhkJwnjRrr5eq+bZV7q0Gdf5i4+ovdJdkcD4ACnOF5pxmWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uA4REJyAREFunQrTC+sFGsAZOIbdT7QofAVB5zoTSoM=;
 b=SByzrPVAS0DjFO814rfHFAobIig/wwoqVViDXCacMuKZGfMZ+1Les1Y2mLljV5D91e9I791P+06D6+XmlwnMoQSw4unco3NSNlgs5PwvToVCUtHJqf2h6n0iYmVUsvOS1LaTRHxp43M2TvGPSXZOnON7AECnaULpVsP7uIkO05E=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	<gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
 Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v1 07/14] xen/riscv: introduce exception handlers
 implementation
Thread-Topic: [PATCH v1 07/14] xen/riscv: introduce exception handlers
 implementation
Thread-Index: AQHZLOAVkIPSVA/PBEeRaJXa6cnAQq6r6ACA
Date: Mon, 23 Jan 2023 11:50:23 +0000
Message-ID: <ac6f02e8-c493-7914-f3c4-32b4ebe1bc26@citrix.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
 <7a459ea843d5823ee2c50b0e44dded5bdb554ca6.1674226563.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <7a459ea843d5823ee2c50b0e44dded5bdb554ca6.1674226563.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SA2PR03MB5945:EE_
x-ms-office365-filtering-correlation-id: 9672f598-e79d-43c7-159f-08dafd380322
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 bJKXa4TJD7dx5q40+2HIYxvsaIJZYaEQZhNWTAwz+Z21BpSo9pX2iZyEBoRAoBCyZciD2oNRjXW1/YQ2s0taLv3FEQ/xdwu2zoaicPh1VFLhdBFg7wDwxhDawJiTAl4Zck2o6bVBgzM1+Fe1HNLxamR6geT1D0uv52dQrqhCD7nXEyTu9L/OiXcUH0PxG/041JhyVM7jFrSkap0XRjtYOZoAfA2fzv+u3sM4IaLxOEQO9ieie972V7bGUok5u0AVJNLDfv/iL+/wRJE8ZJIPeO7vibjAMTXITdqmeqMMOLPg2v1VAEJmoxqObLWmcXrl5YB54QInsdJpy5rE0pqEORWXT9KUnmz/Lv0maWeueXi87qSkakxk7+y0WIu95bGOyyv+LFxSHUigB7/Mo4G37O0I1x6RKHGXIgAbXLYSJhQv6kWGsW9Qv3/Spj6xBSdQCNPMP2RdBE5UkFTaHEdfWs5u5Wz9rKSChbLGWzFJK6PiG5LhA5FQvBDDh/z02IF6XDef+ywGUf1HDN223QCWEcg75U5T3W3l7NZCgtpkxjyZT+f2MqUMcR13Nq4o5GDAX8R4Mh6JY58SkPrbqUQf4lZIXMuPDax9iK8ANSoxYGiU5P5I2Yi5qmWDftBB+q85DWc4MMfYK/T9eyOv5xNVSNAdZI+3C6w9zku4Hdagx4oKL3DcvrUwlNjPDWtZkQB9tAp4DSnkgQZO1wGF/RU8R+pHRQjH5twgOmMmD4u3+d/digrNj3dwjs3vESQGn9HJFC0PdwXOzwhMfW3ahkYUoQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(346002)(376002)(39860400002)(396003)(451199015)(83380400001)(76116006)(66946007)(64756008)(66446008)(66476007)(66556008)(91956017)(86362001)(8676002)(4326008)(110136005)(316002)(54906003)(36756003)(71200400001)(53546011)(6506007)(6486002)(26005)(6512007)(186003)(478600001)(2616005)(31686004)(38070700005)(8936002)(122000001)(5660300002)(82960400001)(31696002)(2906002)(41300700001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?LzBPZXVHa3BiNnU0YkhVcnJ4Mm5Hd1BMWmRkdVg4Z1NmMTZLME1wanBQOXFh?=
 =?utf-8?B?RTYwRGdCajdNeTZaQi9JZnpDKzF5djRWRkpGWWN6ang5RWJ1eHhQS0ErMnVH?=
 =?utf-8?B?TWRBWnFmdmphTWIzbXYrMVMzdkdHMUJScFBjdDNKbVdMRllHbnVza21DTkdZ?=
 =?utf-8?B?MzQrTXpRdytRL0EwSzZ4Y1J1a1c1UkYwSHBvSjh0OUhIQmJ0UE1TUWdlRFV1?=
 =?utf-8?B?VDNpa2dvQ0VsL0l6R1l5UTR1V1NiQ2pHSGpsYVl5SDlZdjEyYk5aS21oVFYv?=
 =?utf-8?B?Zm9zY1pYOThYUWI4cXFpKzhvT2tCcWZOM3VmYkoyVHRaUmZFVXNqQzNVd3N3?=
 =?utf-8?B?VFJsNTU2Ny9RMXZUK1RQT1pTbi84cVRBaUR0US8vT3E0UGhSZm1FdlVTZ1Er?=
 =?utf-8?B?NTFJOGlZZGJlRHVSdHJ0bERraW5uTVZ2Tmh2bE43bCtJUlNVZFRJZ3B1dGZR?=
 =?utf-8?B?bDM2UEdMSTJhd3UyZE9scG1tVnpESlVNdFVZTFVBU0Y2S3BSaDRzVlNGS2d6?=
 =?utf-8?B?VkJRRU1SdE93WGJSR1cxaldCYVIvRE1LLzRGOUlqTWRZN3NtMnR1SUE4Y2NX?=
 =?utf-8?B?dVk0YTZEejBaTzk4WmhaUUlWZ1ZoOEJPQnFWVHNOajF5dENVT25XSGNmSHJG?=
 =?utf-8?B?ZWM3NlJoSnlsMWRIc3JSd1Y3WCtNRHQ0VGlHOWhHbFpFTUVGSTBnM3NwYmt0?=
 =?utf-8?B?Y1R2SVJBWjVWTmQ5aGVEc2ZQRWgzWTZyaXR5TFY1dDQ0K1h4Z0NwMGtZQjg5?=
 =?utf-8?B?YjdUb0lmbE90N3g4YlpQQTNxUHoyblpUUW1Fa0JVbUNzenZiUm9IYVhSZFBq?=
 =?utf-8?B?MHhMM05BK01KcCtTWndnMEJYRklnNDVjT2p5bjgySHRRR1ZmaTFTQ0hwWmtF?=
 =?utf-8?B?TWo1RTFWMGJzR0F5VElYRnlId1lEUEpWcXhwdUV2MUMrbWtOeUk4NWxCT2V5?=
 =?utf-8?B?NTdPWWtIZ01iSldaR1RwQmw2OXNpY3hjbkFuRVRTU2JnR0tXQzhpbW1tcWZR?=
 =?utf-8?B?YUJ0dG1FYWtIVDhOd2VpaHdLN09FWFhnRWx1QWQ0MFY2Q2VnTHNrQnAzUVFX?=
 =?utf-8?B?Tm8xUENUVXl5SzN3QmczU0lKbkc5dUdZL1IwRnR5ZmFEeHlXaUJQQ0EvT1dL?=
 =?utf-8?B?TlNVN25XbmlEWTQ0eG5hTU9TRnM1NmlmM0puOHBmTDdhMWQ2RzU4WnhSbXYr?=
 =?utf-8?B?Nm9oWDdPR2FaS04rdVlMNHAySjFwNkJuNXg5Q0wyY3BFUUJTLzdsT3Eyb08r?=
 =?utf-8?B?NXVkZVliLzdWR0h4eDZJQTg0MFVxeWI0eTBLeE96Y0kveGxTaTVtU3AvNnVa?=
 =?utf-8?B?VUxnYTA4R01TWHRmWDNCcy9CVEJjWEMxTkhpOHpvNThlaGlJL09VcWxhdTZI?=
 =?utf-8?B?aEV4Y1JLVnI3dDJBUEl5MTNpOUFkeWZqTHFkWXd0cnhLMmpQR3BPMTJna1F0?=
 =?utf-8?B?SWZDVXBGd1QwQjhKcm1hQUJSNjcwQTdHYWxQUEF2QXA4cDlRV2NlMVExanBV?=
 =?utf-8?B?ZGR1RTg1WVAyc1RNSTlkdU5zWEEyTnNtK21iRzJ2Tm5wd01zQXZnbFE4ampi?=
 =?utf-8?B?TmxRaU45WW9SK0hIUnR5ck5pbkxFb3BRZkV4aHBreTU4M3ZmT3RVMktpOHg2?=
 =?utf-8?B?b0dZdHVucHZWUTJWd1R5ZTZNOVhITC8wQlZhQ2NJeWdCckZHeG9pRDZWbXd0?=
 =?utf-8?B?YXRMcSszUGNsMTRqakNhOHhkeGtuUFFQRDJpUGpMZTZ2WTh3djdDaUVxTkdD?=
 =?utf-8?B?bDZnUWJobndQb2J0WlBmS1FIdjF2NWVmc1cweGFsZTBlV1prRXQzemZGK1Y0?=
 =?utf-8?B?R1ZvMWF1YVdQY0JaY3ZvUXNWTjB0MnVnczlJV3lKMkxBNmlJeTYxTnhmK0oz?=
 =?utf-8?B?alljMGZFYkN4bHlGY2ZZaHdySmE0S2k1Q1crTEhVLzh4MXV5NWdJNzlEb1Rr?=
 =?utf-8?B?NXEzdHBncjEvRXhuaXNtMHZDcy9jMVArSFlIelM0VXVaSHZER0FORkpJd0dF?=
 =?utf-8?B?aC9ST2RXZk94R2o4RWpxVk1DZ3NRMTZMQXprajhNVkRsQWQ0L1kzLzNBVXJk?=
 =?utf-8?B?azZqYWs2S1NkanZnMGcwNTJXMjNSZDFBWC93Z0VuTjg1eWdqbDIwYnN6RnFU?=
 =?utf-8?Q?3cu7IrIsl/hVaaYzZViGUVowv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5CEB97476E406648BBA189C3D3AF9306@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RxTX3Y/sUVG+0yU9r1Up9uKhF9K8gjht9Xj/gb3w0lvSZXKId3v+5GkpgaPHbKtK91ejWtcjuGMCjGvQMYIdvRBZxqYhxk1tII2tK2XdpVrbETgtRPyTRpU3gpab36wHSTa5B1FjchaoQIbwuge3PCPASbCbowUXA/5YYyrmifR7u4u5FOywlnVGkjhu1QOh+9G7eXUS48lJZ43gOWH+3bzkfWId0AZJuM6NhrtYQkyGnW40F3Es10X75SkjlJoxG+PYjzdX8egyzdBCQ/yTY8yD0Y1+n/LkmJKN/i6d3xIKf8pP2wGlHq5PmbpiywZ7EIqA6kywRgKjbq/PVNf5xEOMsT5YSsryp4GxCb7CukNgSQkansEviiS3q8yh6i3Wk76XvITbfmQZWM+v8AMQalpT1ULlP9StC29zdRoGslugMPTgrON4voddUTsIZhERJ89A7BKnKuhpCw+kXE7tak88NfYuf5mM/A+MwT+qCvr0iTcWNLaUTuS1/tcnWWF1Xu+iod4EnYDi6ATNw80tT9TECKeYICQq72WFhjszXO35k0VgWg9AARXSAzl/dfrhyCaugNIuO+wyzlCtdoyUZkAry/hSJj+4QC09Y5Mn2fbokpNmj5+OErZelxs2/qIlPOuFKYpasUHphRTyKIZmP+Ol5tvRdux08K2raFZySTYvH0qOYeqtn3jXui7Pfjcwvq9lCpHVcAdSxS3epukPrD/bgX7OuUomx3JfOiHrKv2uBs7w7mXA9MknGJ1To4ZZVpQQTuD3NW5vQounkAAIYz6Q1CkR9FU34YIif7AbBsvJlRBMpmr7BuDSL/j3gAeyQQSrNcrqIV/IbnhnrnYy73oySdKRcQzWXB4PfcH7r/u35te00DKI65x6Wpi4nNEHbpcgC2e8ui/aUqDmdKlVFw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9672f598-e79d-43c7-159f-08dafd380322
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2023 11:50:23.8282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q6Qwa42FgrZCZo4m3lLI2dt5KBMb75LthiwLPg2wr3TXJDJhSog+wFqkwjDT4mk8x1q46uLmBM6AHhuN8vDqNWSd2tW0a6EjYIrxYPN7YvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5945

T24gMjAvMDEvMjAyMyAyOjU5IHBtLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOg0KPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvcmlzY3YvZW50cnkuUyBiL3hlbi9hcmNoL3Jpc2N2L2VudHJ5LlMNCj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4uZjdkNDZmNDJiYg0KPiAt
LS0gL2Rldi9udWxsDQo+ICsrKyBiL3hlbi9hcmNoL3Jpc2N2L2VudHJ5LlMNCj4gQEAgLTAsMCAr
MSw5NyBAQA0KPiArI2luY2x1ZGUgPGFzbS9hc20uaD4NCj4gKyNpbmNsdWRlIDxhc20vcHJvY2Vz
c29yLmg+DQo+ICsjaW5jbHVkZSA8YXNtL3Jpc2N2X2VuY29kaW5nLmg+DQo+ICsjaW5jbHVkZSA8
YXNtL3RyYXBzLmg+DQo+ICsNCj4gKyAgICAgICAgLmdsb2JhbCBoYW5kbGVfZXhjZXB0aW9uDQo+
ICsgICAgICAgIC5hbGlnbiA0DQo+ICsNCj4gK2hhbmRsZV9leGNlcHRpb246DQoNCkVOVFJZKCkg
d2hpY2ggdGFrZXMgY2FyZSBvZiB0aGUgZ2xvYmFsIGFuZCB0aGUgYWxpZ24uDQoNCkFsc28sIHlv
dSB3YW50IGEgc2l6ZSBhbmQgdHlwZSBhdCB0aGUgZW5kLCBqdXN0IGxpa2UgaW4gaGVhZC5TwqAg
KFNvcnJ5LA0Kd2UgKnN0aWxsKiBkb24ndCBoYXZlIGFueSBzYW5lIGluZnJhc3RydWN0dXJlIGZv
ciBkb2luZyB0aGF0IG5pY2VseS7CoA0KT3BlbmNvZGUgaXQgZm9yIG5vdy4pDQoNCj4gKw0KPiAr
ICAgIC8qIEV4Y2VwdGlvbnMgZnJvbSB4ZW4gKi8NCj4gK3NhdmVfdG9fc3RhY2s6DQoNClRoaXMg
bGFiZWwgaXNuJ3QgdXNlZCBhdCBhbGwsIGlzIGl0Pw0KDQo+ICsgICAgICAgIC8qIFNhdmUgY29u
dGV4dCB0byBzdGFjayAqLw0KPiArICAgICAgICBSRUdfUyAgIHNwLCAoUklTQ1ZfQ1BVX1VTRVJf
UkVHU19PRkZTRVQoc3ApIC0gUklTQ1ZfQ1BVX1VTRVJfUkVHU19TSVpFKSAoc3ApDQo+ICsgICAg
ICAgIGFkZGkgICAgc3AsIHNwLCAtUklTQ1ZfQ1BVX1VTRVJfUkVHU19TSVpFDQo+ICsgICAgICAg
IFJFR19TICAgdDAsIFJJU0NWX0NQVV9VU0VSX1JFR1NfT0ZGU0VUKHQwKShzcCkNCg0KRXhjZXB0
aW9ucyBvbiBSSVNDLVYgZG9uJ3QgYWRqdXN0IHRoZSBzdGFjayBwb2ludGVyLsKgIFRoaXMgbG9n
aWMgZGVwZW5kcw0Kb24gaW50ZXJydXB0aW5nIFhlbiBjb2RlLCBhbmQgWGVuIG5vdCBoYXZpbmcg
c3VmZmVyZWQgYSBzdGFjayBvdmVyZmxvdw0KKGFuZCBhY3R1YWxseSwgdGhhdCB0aGUgc3BhY2Ug
b24gdGhlIHN0YWNrIGZvciBhbGwgcmVnaXN0ZXJzIGFsc28NCmRvZXNuJ3Qgb3ZlcmZsb3cpLg0K
DQpXaGljaCBtaWdodCBiZSBmaW5lIGZvciBub3csIGJ1dCBJIHRoaW5rIGl0IHdhcnJhbnRzIGEg
Y29tbWVudCBzb21ld2hlcmUNCihwcm9iYWJseSBhdCBoYW5kbGVfZXhjZXB0aW9uIGl0c2VsZikg
c3RhdGluZyB0aGUgZXhwZWN0YXRpb25zIHdoaWxlDQppdCdzIHN0aWxsIGEgd29yayBpbiBwcm9n
cmVzcy7CoCBTbyBpbiB0aGlzIGNhc2Ugc29tZXRoaW5nIGxpa2U6DQoNCi8qIFdvcmstaW4tcHJv
Z3Jlc3M6wqAgRGVwZW5kcyBvbiBpbnRlcnJ1cHRpbmcgWGVuLCBhbmQgdGhlIHN0YWNrIGJlaW5n
DQpnb29kLiAqLw0KDQoNCkJ1dCwgZG8gd2Ugd2FudCB0byBhbGxvY2F0ZSBzdGVtcCByaWdodCBh
d2F5IChldmVuIHdpdGggYW4gZW1wdHkNCnN0cnVjdCksIGFuZCBnZXQgdHAgc2V0IHVwIHByb3Bl
cmx5Pw0KDQpUaGF0IHNhaWQsIGFyZW4ndCB3ZSBnb2luZyB0byBoYXZlIHRvIHJld3JpdGUgdGhp
cyB3aGVuIGVuYWJsaW5nIEggbW9kZQ0KYW55d2F5Pw0KDQo+ICsgICAgICAgIGogICAgICAgc2F2
ZV9jb250ZXh0DQo+ICsNCj4gK3NhdmVfY29udGV4dDoNCg0KSSdkIGRyb3AgdGhpcy7CoCBJdCdz
IGEgbm9wIHJpZ2h0IG5vdy4NCg0KPiA8c25pcD4NCj4gKyAgICAgICAgY3NyciAgICB0MCwgQ1NS
X1NFUEMNCj4gKyAgICAgICAgUkVHX1MgICB0MCwgUklTQ1ZfQ1BVX1VTRVJfUkVHU19PRkZTRVQo
c2VwYykoc3ApDQo+ICsgICAgICAgIGNzcnIgICAgdDAsIENTUl9TU1RBVFVTDQo+ICsgICAgICAg
IFJFR19TICAgdDAsIFJJU0NWX0NQVV9VU0VSX1JFR1NfT0ZGU0VUKHNzdGF0dXMpKHNwKQ0KDQpT
byBzb21ldGhpbmcgSSd2ZSBub3RpY2VkIGFib3V0IENTUnMgdGhyb3VnaCB0aGlzIHNlcmllcy4N
Cg0KVGhlIEMgQ1NSIG1hY3JvcyBhcmUgc2V0IHVwIHRvIHVzZSByZWFsIENTUiBuYW1lcywgYnV0
IHRoZSBDU1JfKg0KY29uc3RhbnRzIHVzZWQgaW4gQyBhbmQgQVNNIGFyZSByYXcgbnVtYmVycy4N
Cg0KSWYgd2UncmUgdXNpbmcgcmF3IG51bWJlcnMsIHRoZW4gdGhlIEMgQ1NSIGFjY2Vzc29ycyBz
aG91bGQgYmUgc3RhdGljDQppbmxpbmVzIGluc3RlYWQsIGJ1dCB0aGUgYWR2YW50YWdlIG9mIHVz
aW5nIG5hbWVzIGlzIHRoZSB0b29sY2hhaW4gY2FuDQppc3N1ZSBhbiBlcnJvciB3aGVuIHdlIHJl
ZmVyZW5jZSBhIENTUiBub3Qgc3VwcG9ydGVkIGJ5IHRoZSBjdXJyZW50DQpleHRlbnNpb25zLg0K
DQpXZSBvdWdodCB0byB1c2UgYSBzaW5nbGUgZm9ybSwgY29uc2lzdGVudGx5IHRocm91Z2ggWGVu
LsKgIEhvdyBmZWFzaWJsZQ0Kd2lsbCBpdCBiZSB0byB1c2UgbmFtZXMgdGhyb3VnaG91dD8NCg0K
fkFuZHJldw0K

