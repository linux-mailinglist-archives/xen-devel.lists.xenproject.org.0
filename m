Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB93A6585D3
	for <lists+xen-devel@lfdr.de>; Wed, 28 Dec 2022 19:41:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469538.728909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAbLN-0007Rf-Sl; Wed, 28 Dec 2022 18:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469538.728909; Wed, 28 Dec 2022 18:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAbLN-0007OJ-PJ; Wed, 28 Dec 2022 18:40:01 +0000
Received: by outflank-mailman (input) for mailman id 469538;
 Wed, 28 Dec 2022 18:39:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xfAD=42=citrix.com=prvs=354503da8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pAbLL-0007JC-7x
 for xen-devel@lists.xenproject.org; Wed, 28 Dec 2022 18:39:59 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 057efd2a-86df-11ed-8fd4-01056ac49cbb;
 Wed, 28 Dec 2022 19:39:56 +0100 (CET)
Received: from mail-dm6nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Dec 2022 13:39:45 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB6011.namprd03.prod.outlook.com (2603:10b6:408:134::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Wed, 28 Dec
 2022 18:39:41 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.016; Wed, 28 Dec 2022
 18:39:41 +0000
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
X-Inumbo-ID: 057efd2a-86df-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672252796;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=m+CXL6G/EmOmFOxDU/95JtL7r4RCACbzAxBvN6hwFm8=;
  b=FPcESGOnL6GPjYnct2gRtdcsaaAwApk6W4RWigLZCi3y/DmmPyLYlVvk
   3AQsAu7/7SWWPycEP899eC5WTjGhZ6MquY3YVcfLBpUUufbN61HmnlVzD
   0kqabK1wRyV1DsiRcaY+WYzvDxAzRZTvNEeODMw+kLiYOc+7E8whR0SK4
   k=;
X-IronPort-RemoteIP: 104.47.58.105
X-IronPort-MID: 92856419
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FMHqJK4ia+2iCbdFRTT3RAxRtLXGchMFZxGqfqrLsTDasY5as4F+v
 mAYUD3UaP7YYGb0LYp1a420/U1XsZXSx99mT1Nu/iBkHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKoR7AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mx
 6IXeDMyaz+43/O5+L+nRNVCm8MjI5y+VG8fkikIITDxK98DGMiGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEooiOWF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNNIRODmqqc76LGV7jQUMQQ2BQbhneaaoWS8WM0cJ
 HQS5SV7+MDe82TuFLERRSaQqXqFpQIVWsAWHfcz7gqM0YLT+wufHW8ZVDVMLsMqv4k9QjlC/
 k+EmZblCCJitJWRSGmB7fGEoDWqIy8XIGQeIygeQmMt6d7pqpA+lRLLQ9NqFoa6i9T0HXf7x
 DXihCEvjrMQkMsC/6y+8RbMhDfEjpHNTxUp7wTNBDmN4QZwZYrjbIutgXDS6fdbMI+YVB+Pp
 nECkMmFxP8CBteGkynlfQkWNLSg5vLAPDiCh1dqRsEl7270oyPlep1M6jZjIksvKtwDZTLif
 E7Uv0VW+YNXO3ypK6RwZupdFvgX8EQpLvy9Pti8UzaESsEZmNOvlM22WXOt4g==
IronPort-HdrOrdr: A9a23:92a5YKAF0enyjiflHelW55DYdb4zR+YMi2TDGXofdfU1SL3/qy
 nKpp4mPHDP+VIssR0b6LW90cq7L080l6QFg7X5VI3KNGKKhILCFuBfBOXZrwHIKmnd+uJF76
 tmbsFFaOEZdDNB/KHHCXGDYrUd6ejCybuvg+jGyXdrUEVFV4FMhj0JcjqzIwlOXw9BCoM+FJ
 2Aoux9hxTlV0g2Q62AdwA4t86qnaywqHsjW298OyIa
X-IronPort-AV: E=Sophos;i="5.96,281,1665460800"; 
   d="scan'208";a="92856419"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0wlFs1EqnVVcMaUrqMkdtzSq76Gx24map1dB0Xj2KkXtl8aeR2Q550lb0Pj+iwqx8Kzdrd0Ij7+AMxWLToPooizljlBaV6t7IWvB5hBmxJ80n9zusWQNM7l6oF9B0JrXt2Icn+0W+b7XXl7urnxNoRBw1TbFv1TlEcYUZr5Zs4KtxCE9GnVZJR61bE1Sxd8C/Y1Cji1xoQjNq/Wa+utXnRo6Yr1EAoI/sbzMyWfzQLsgT+6/PlY8iNiPeJ0Z23FB+r9jGSEbPHQJ0dBAnLKNfQzGYev9TkWppeR6YUBnLEGArdVOKErI5i5IVlaS+KthJSLjL9TzOK23il/fD+3Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+CXL6G/EmOmFOxDU/95JtL7r4RCACbzAxBvN6hwFm8=;
 b=Fbvj1PsyRP699omInAnXRhXAF6kb1wQCf79aeowQIOYg3+5s6vByhmlPrYpFlXEvZ1LpFVeK7e4EA4Yq3dGmVntPj64e55hsxdCdK2FX4RMgxXVLzd0XUs6C+KMyNBQ2bTDpKF3SIWTiOLX8B3Xu+J/8d+LQnFgOBiZSGMVwrwlJf0iyIPoxOarSAXpmqJB+/4E+tAo2QxiBJGtSsrNPlZLL4O/5TUXtsS6ADWNNvXWuzsGVWgANDMjz47CDAdoKqN1e7VR/1QjLYE221qKMrCWG0PajN2sS4ClPtiAE99rvbKkG5Fk5tEMeipMmCxo0fp+5nUt+1JD5WO34BdEQNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+CXL6G/EmOmFOxDU/95JtL7r4RCACbzAxBvN6hwFm8=;
 b=KrUbIkdKj9kgv2tp6TDtex8Leeka154hJYniwbX5YQ7jeWmqyWunYz5xxM2xv0E0CPhVxyt57k3s+vl9274aQr+lMahNRRGuJbRspToZql+l14o+drJrows0/y0wkq2Y4U4pPecJzJbISOYn6JkbuFk5v6h5BHSPuvda8BgemXo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "bobbyeshleman@gmail.com" <bobbyeshleman@gmail.com>, "ayankuma@amd.com"
	<ayankuma@amd.com>, "alistair23@gmail.com" <alistair23@gmail.com>, Alistair
 Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH] xen: define PADDR_BITS for riscv
Thread-Topic: [PATCH] xen: define PADDR_BITS for riscv
Thread-Index: AQHZGnwwBZOwIuQeZkyhq2axN9VynK6DooQA
Date: Wed, 28 Dec 2022 18:39:40 +0000
Message-ID: <20fba707-5438-f4d9-fa71-b616cebeba27@citrix.com>
References: <20221228052018.730671-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20221228052018.730671-1-alistair.francis@opensource.wdc.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BN9PR03MB6011:EE_
x-ms-office365-filtering-correlation-id: 833a70f5-dfec-4a68-1375-08dae902e17e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 HOCkCnGN//zXaOHZ7efSg2J313hTmuKJJuf6DmFQu7IEs27miA83+16GKVadakLrntm8P7jUgFjy97pksRer+JAFcUlYscw3WEZMR51fBzI95Z/3B9eSJINCOAHzL28jqVzloI2LkZ3MM/nQNzXFetHq6Urq9FgCkDquAUzh6Qeup9lar+RAH8LuOCWuMyjPww7Cb8Wyl9dKklXT5BduC5gGsgOdBA+r4XKoirRT2q9ps7ryZHuEsjcHdhG3c+bstT6GuIJi4oW1M6oGibvKddY8Digwk8GmocYjQy1NQftN8cdM9qRYUHQlZRfQICUWKogZDxMGv5thDM24pT6rIxj92xaQYYg/DAKQmBlok0+UHinpzEUAwO7/r4JZmBZZcq3E6jNFkaCII9J3lvUQ/w++5AoTjNZcmj0Z7bEDpuAVcHLNkE8mafNxYICNmahD09Ss0xGiHUs7z2Zg9oWWqJi0nvy/jACkE6lvGS6QC8EbKT0f3OtUTo3V/NX/ZiVZPu0xCBA0HG2SMSjUjjFYRDa+bp7GaeWDLvmi6VnuCBZ5b1yKEN1MvRJFJVQL6kvvS03LKQjYbTCVeJEz2/MIVDgRDUqtaCWHDnRgXLmm8VHzkQtBFpKpfleU2SeeTASFtymNKaisUf7S7Ic/mNqtq4gH5ZYZJCEG0Mx9Dek8VTnto3J9gBgPb2TfC8WhRte968xl0d9uKikXZu4zwWD485/yYrDh8w7seQy1XZxcEu+uWySxsJSVrl2d+yBLBDxARWgu9bNBi0G2wF2lOXpkRA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(451199015)(38070700005)(478600001)(6486002)(41300700001)(36756003)(6506007)(53546011)(186003)(26005)(6512007)(316002)(110136005)(54906003)(86362001)(31696002)(71200400001)(31686004)(2906002)(8936002)(4744005)(5660300002)(8676002)(4326008)(76116006)(64756008)(66556008)(66476007)(66446008)(2616005)(66946007)(38100700002)(122000001)(91956017)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T1J2YVpLYVM0bkZBTmdnS3pGQUdFaTh4QUtJOHJ5R2JBSHlybjFBT1RtZHdh?=
 =?utf-8?B?NjcxKzFsUU1LS1RDRUpmYVNlZHp0K1BhV1dPT0JwMzNTWWZLRjZmOGNTVE04?=
 =?utf-8?B?elZhNE44ak1GTkhuVHN2WW00WGJ0WEFYeStyeEZuVkk3Q3BqL2lTNmpVd3hq?=
 =?utf-8?B?UzB2VzBnMzhJZXJpZlI1TmlNVGRvZkk0ODdBZzc3QmJyLzREM0ptNnl4TnY0?=
 =?utf-8?B?TGVNd3ovZDYrZ1ZTTlNoNzBEemJhdUh0T0xsYlg2ajJEU09NZE5IL21XZVdZ?=
 =?utf-8?B?VDlFa2RyWlFOd3FVQ1ZHbVcwbUsxeGdmYVQ5RVB4cmJ3ZnVjSk9xY0hIUDZJ?=
 =?utf-8?B?aGVMb2dkNTk4Q0crYXdTWGZvT2dHL1d6a2phNFp6YWRBbWVSWVc3WEs2UXBE?=
 =?utf-8?B?bVRZdm9Vbk10b1ppZXVuU0FWOGE1V2hHVDQwbHBxaFg1WmZtT096bkpkd3lL?=
 =?utf-8?B?RVZaSTByNmR0bzdkKzU1cUpnajcxMmlDWHAybzgxU1BPcmgxT29ud25YMFdK?=
 =?utf-8?B?Tmo5TENaaWxHQkJmcFF2cWhVOHJVR0dYTFBSMlh3WDZNSm9NUmVpSFNERnFH?=
 =?utf-8?B?aGs0d1AvUXVaNFBZd3lMdjhmSHJCVHBmSHBWdk9IU2E2YXFMM2NIUldyZDU4?=
 =?utf-8?B?NFJnVS9aZ0pqTk80QU9WZnVkREIvam5oOTJ0aHl3WW5iK1l2eEhNYUxrRGlG?=
 =?utf-8?B?ck01V3hDTitDMjJWbDF3UG9mM1hXcXExQnAwOEh5RWZLQTYrWTdiVEJ6ZnE0?=
 =?utf-8?B?V1hXMUx1RDhSVFNOQ3NWdk1FMW0xbW16L3hrK1VmcVZ0a0gyWklySE1CVjR0?=
 =?utf-8?B?VStOWXAydnpSRGdIRzRpamlxNE51VUtFVTVYdU8xY25VQnJqVWFncC9LVzZl?=
 =?utf-8?B?QmU1eVpzM1RVdG5DSkJmVjR6ZS9jZDliZ3hOZHZDYmRiSTZlK3g0VHlHZlJp?=
 =?utf-8?B?Ry9YOW1iZThmTzB6NjFtREFFZGU1QjQwZVBJRUVDZldBZkV6enBUUzRkYWVr?=
 =?utf-8?B?czJScWhvYis5WVpKQ3dwUS9aSGNRV1ByaUV3N2c5TGJ2enMyWjFPREpWWnBY?=
 =?utf-8?B?bENCbDRPQ1dTOXBiV01SL2dHVlhiYmtsN0srSWlvamllL1NZM0dFTUpRWG1T?=
 =?utf-8?B?NFh5YWdnUXV3VXQ4UVpLZWZlT3N2M1JvMlZjZitWd28rcmZOaWNzZHNPekdh?=
 =?utf-8?B?SkxWNkN6MGNDdGdOWDY3dDA5SzdoeVNvdlJzeWRrL0VxVmgxYVYvdG9vOWhq?=
 =?utf-8?B?TlFjY0lWeFE5bEFMYndKME9TaldLYzA3cmxRNW1yZDNrREJiZSt6Ry95eTJF?=
 =?utf-8?B?cGFoV1FreTU4eGNZMFY1TWtWczYyanNzZHRMSjdXN2VuNWVBN01iSjZqM2NF?=
 =?utf-8?B?MjFWQzB5S1ByRlNldmVxWkcxcXZNSU1RK3ZrYW00cmlTUmZmd09RZHhPbVBP?=
 =?utf-8?B?Z2pkSDYrU1Vta0pDLzFMbktvbjkzWG9SWkFGOXZDenNKR2FkV2ZHUURwanp3?=
 =?utf-8?B?czBMVzFEV0U4YVFJZTZHb1lBcFV6YmdXNlk0ek1zbEp3UXVhTS9HNmxXblRh?=
 =?utf-8?B?QjFkSUZFZXdkSkhtdW9IVVVFWlY0enhrSHE5eVViWURTTEZ0MGJqVmhKZUtP?=
 =?utf-8?B?bURFbmxZTDVPZjVKOVRsbXZLVmdRY0hZdG11VnpFUTFXYnVkSWxlTUF1dDMv?=
 =?utf-8?B?SWd4REUyNWN1MGZFdytLbGtBWmRxa2xXRGgxMm5wMW9TQnVLLzh1QTBpdUZU?=
 =?utf-8?B?Z1A3T0gzdmdud2lzTUdIMzlPN2JjaXBCM2xHWi90QUxMeVZWbzdwZVNOVVRF?=
 =?utf-8?B?V0IvblgxVFRaUlZ3ODdmc2Y3ekNTRGNSa1kycTRnK28wK0xobDd0N3dKbDF2?=
 =?utf-8?B?cmV2QkFzS3lzWk45S2N2M0h0VWxjMmtGWERYeXFONWtIc3B2YzVtS0xCN3N3?=
 =?utf-8?B?UWFLYzdSUWJTRFFZUC9rNzZrc0RVS21UN3k3OGJUSFlwdnlkMnhCRnlzOFJo?=
 =?utf-8?B?eVlyd3F6NzF1SmpNMEU5cWlVTGlLZCtsUitGbGFreHFEUG14ZEdZZzRhN0h6?=
 =?utf-8?B?RFg2VUp5b3I1SWM1SDNpMlY4akNUU2tMNE5sSEhFdkV0RkZpRktjVXVGWG1o?=
 =?utf-8?Q?TNnQQn2Qy3IqIRM7FUxA+NNTE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FDFB8DCBE8919F4086EF12B8B93CEC34@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 833a70f5-dfec-4a68-1375-08dae902e17e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2022 18:39:40.8064
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w71XXFJHmvj3H1R5nIPXSzoC81VwsAMzlD+BWKXUc1F+UReMtM6ZySp/ZPIitNsLqK8gKz24AJogQNDZzxnqPRJFoDlH5hYqtCWixhtghsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6011

T24gMjgvMTIvMjAyMiA1OjIwIGFtLCBBbGlzdGFpciBGcmFuY2lzIHdyb3RlOg0KPiBGcm9tOiBB
bGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpci5mcmFuY2lzQHdkYy5jb20+DQo+DQo+IERlZmluZSBQ
QUREUl9CSVRTIGFuZCBQQUdFX1NISUZUIGZvciB0aGUgUklTQy1WIDY0LWJpdCBhcmNoaXRlY3R1
cmUuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyLmZyYW5j
aXNAd2RjLmNvbT4NCg0KVGhhbmtzLsKgIEkndmUgY29tbWl0dGVkIHRoaXMgd2l0aCBhIHR3ZWFr
IHRvIHRoZSBzdWJqZWN0IChpdHMgbm90IGp1c3QNClBBRERSX0JJVFMgeW91ciBhZGRpbmcpLCBh
bmQgYSB0d2VhayB0byB0aGUgaW5jbHVkZSBndWFyZHMgKFNISUZULT5CSVRTDQp0byBtYXRjaCB0
aGUgbmFtZSBvZiB0aGUgZmlsZSkuDQoNCn5BbmRyZXcNCg0KPiAtLS0NCj4gIHhlbi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3BhZ2UtYml0cy5oIHwgNyArKysrKysrDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vcGFnZS1iaXRzLmgNCj4NCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3BhZ2UtYml0cy5oIGIveGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGFn
ZS1iaXRzLmgNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4uZDdi
ZDdiZTA5OA0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL3hlbi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3BhZ2UtYml0cy5oDQo+IEBAIC0wLDAgKzEsNyBAQA0KPiArI2lmbmRlZiBfX1JJU0NWX1BB
R0VfU0hJRlRfSF9fDQo+ICsjZGVmaW5lIF9fUklTQ1ZfUEFHRV9TSElGVF9IX18NCj4gKw0KPiAr
I2RlZmluZSBQQUdFX1NISUZUICAgICAgICAgICAgICAxMiAvKiA0IEtpQiBQYWdlcyAqLw0KPiAr
I2RlZmluZSBQQUREUl9CSVRTICAgICAgICAgICAgICA1NiAvKiA0NC1iaXQgUFBOICovDQo+ICsN
Cj4gKyNlbmRpZiAvKiBfX1JJU0NWX1BBR0VfU0hJRlRfSF9fICovDQoNCg==

