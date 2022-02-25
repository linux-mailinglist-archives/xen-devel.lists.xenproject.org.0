Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF0C4C4A03
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 17:03:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279504.477221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNd3k-0003m5-68; Fri, 25 Feb 2022 16:03:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279504.477221; Fri, 25 Feb 2022 16:03:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNd3k-0003iZ-2e; Fri, 25 Feb 2022 16:03:08 +0000
Received: by outflank-mailman (input) for mailman id 279504;
 Fri, 25 Feb 2022 16:03:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=halk=TI=citrix.com=prvs=048fa7b34=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nNd3h-0003iT-Uo
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 16:03:06 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68f8ed5d-9654-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 17:03:04 +0100 (CET)
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
X-Inumbo-ID: 68f8ed5d-9654-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645804983;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=wwq1DPbX6k4Jw2hx0Y9dUMaZk7uzSF4+0j0i9Lh17Dw=;
  b=bWtoqme33eJG3TMd96GGQaVcwSZyb178+p3rmT2n8pPv/lU5Pdo+tiAw
   qVqg8QXDCCDnQzKcrhJ5YSbcTrbUtDXNYXx+AkvCUHHkciGaeG6KAHT8n
   bjSLJffeQBp9Y6PhdIpi9ScHxHQoFnShNZZ9pqKUHvT728jEL3aJfUnah
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67270571
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/qJeTKNRwonJbQPvrR0Ul8FynXyQoLVcMsEvi/4bfWQNrUolgmYAy
 GEfCzyOM/zYZDb0ft0gaYTi9k9TuJDTztNrTQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZj2NMw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z+
 cxyjoSybA4QF/PNquUzQR93Pyh8IvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALDsDtMcU6s3VpyTjfAN4tQIzZQrWM7thdtNs1rp4RR6mGO
 pVAAdZpRCzGUxx+B0cFM50jhOHvi0v8YgVo903A8MLb5ECMlVcsgdABKuH9cNGQWd9cmEreo
 2vc5nn4GTkTLtnZwj2AmlqSgevIkTL+SZglPrSy/f53g3We3mUWThYRUDOTo+S/zEi3WNtdK
 kkd0isosaU2skesS7HVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQludE3Q3o21
 1aPt9LvGTFr9raSTBq16bO8vT60fy8PIgcqZyUJUA8E6NnLu5wog1TESdMLOKy6lNruAhnr3
 iuH6iM5gt07ltUX3q+2+VTGhTOEpZXTSAMxoALNUQqN7B59ZYOjT5yl7x7c9/koEWqCZgDf5
 j5ewZHYtb1QS8HW/MCQfAkTNICw2M2dMhjVuHcxHqsg2Sar1FKqf58FtVmSO3xVGsoDfDboZ
 mratgVQ+IJfMROWUENnX26iI590lPa9TLwJQtiRN4MTOcYpKGdr6QkzPRb44oz7rKQ7fUjT0
 7+/eN3kM3sVAL8PINGeF7ZEiu9DKszTKAruqXHHI/aPjev2iJ29E+5t3L6yggYRtvLsTOL9q
 Ys3Cidy408DONASmwGOmWLpEXgELGIgGbf9oNFNe+iIL2JOQT99VqCNmO98I9Q9x8y5c9skG
 FnnCye0L3Kl2BX6xfiiMCg/ONsDo74lxZ7EAcDcFQnxgCVyCWpexKwea4E2bdEaGB9LlpZJo
 w0+U5zYWJxnE22fkxxENMWVhNEyJXyD2FPVVwL4MWdXQnKVb1GQkjMSVlC0r3dm4+venZZWn
 oBMISuAGctTH1k5VZ2OAB9tpnvo1UUgdCtJdxKgCvFYeVn28ZgsLCr0j/QtJNoLJwmFzTyfv
 zt6yz9EzQURi+fZKOX0uJ0=
IronPort-HdrOrdr: A9a23:6mGX2qsI0e0aQvBMWwMn0qww7skC2YMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJh5o6H9BEGBKUmskaKceeEqTPmftXrdyRSVxeZZnMrfKlzbamLDH4tmtJ
 uIHJIOcOEYYWIK7/oSpTPIburIo+P3sJxA592utEuFJDsCA8oLgmcJaTpzUHcGPjWubaBJTq
 Z0jfA3wAZIDE5nF/hTcUN1OdQryee78a7OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFuxaR3NThj9iLjjvnk0PD5ZVfn9XsjvFZAtaXt8QTIjLwzi61eYVaXaGYtjxdmpDs1L9qqq
 iIn/4TBbU115rjRBDynfIr4Xi47N8a0Q6n9bZfuwq6nSW2fkNgNyMLv/MmTvKQ0TtQgDg76t
 MX44vRjesmMTrQ2Cv6/NTGTBdsiw69pmcji/caizhFXZIZc6I5l/1UwKr7KuZ1IMvW0vFuLA
 BVNrCW2B+WSyLsU1nJ+m10hNC8VHU6GRmLBkAEp8yOyjBT2HR01VERysATlmoJsMtVcegJ28
 3UdqBz0L1eRM4faqxwQO8HXMusE2TIBRbBKnibL1jrHLwOf3jNt5n06rMo4/zCQu1E8LIi3J
 DaFF9Iv287fEzjTcWIwZ1Q6xjIBH6wWDz8o/surqSReoeMMoYDHRfzOmzGyfHQ0Mn3KverLs
 qOBA==
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="67270571"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFNDQDJLzg4RY/QFHX3uhjtkMxI8n4ck8UR2xi0F4Ke1f6lYSg4ub+Y16z4nj48NVxiCudZCgaTeMBfQ0Z1ZOM2TFlgQ8p13rm0Mhap0CCo0BYzUReJRn/wgOPRR2p3OZZRkpjHG/02JVgPB7dDDSscgnV6axW9v/pl6M7e5KGVSqFW5w4DQQ4pgSCMdAVxzkC2MCFz6P8MyVPNOGwlhEePLRqgO/1ajgD30lOeHuHtBeFRZjKjJza/8eHhAeJgjxNniT2MoxPn7GCPzjGJ89gklhLJM5HmXcj2W+7svGAAoWuHUGGWUl4iDw4U5OaDFTjTkW+6bHtFE0QA9zWYxZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwq1DPbX6k4Jw2hx0Y9dUMaZk7uzSF4+0j0i9Lh17Dw=;
 b=CJnvWwq1FCo5uLCVsx4oMvcr0zCZ5gBbJ8MsLWkbz8679Z/bBzNINNrjbNiaZP2qCF0gKaIam2+OqRQR++eaIj2LKZWH+YlRQjqv7QuhTDiYoxjhPEc+3aVTm18DahR5KaxjgrVZOqmXuGQwymr2j8IB5/kIMi9+ihzklg9urDe5D9zUTRo5mTY3VvTWLuX74U6x/pbnv2UDOHk+5LANCPaQlOsKbiCDwmfOgt71BF1W2r+d80hIGVxu3zqERAQkR3N7KLon+CCU2B9pZ2cD7lvsm3CSn1CCpvSjHlwOh7b72XSLUpw+1Np+toGzwPs3z2Iqc8yMrW9DqMbDL7TZKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwq1DPbX6k4Jw2hx0Y9dUMaZk7uzSF4+0j0i9Lh17Dw=;
 b=b0n2b92ObbCeROhiK05sOm/06QHRkn0B/C5qxb5asfhJMDqJmFyb+eJ6vVotSZ7SUSRt/BcOfI8+AMM5BHelnn/vprZb/yuWJHQkWE7djPnfc0dQCK6Uj2KBWYfHetpAaBupDWSDyibQ0dvzMFqVaHDNa+u1jLoUz+7LTnx5alA=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "George
 Dunlap" <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Topic: [PATCH v3 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Index: AQHYJO06JWynylsFtkyl8WR8WaDosKyixjKAgAGyPAA=
Date: Fri, 25 Feb 2022 16:02:54 +0000
Message-ID: <22ae35a0-9df8-9357-4b44-2f00586144fc@citrix.com>
References: <20220218172943.12182-1-jane.malalane@citrix.com>
 <20220218172943.12182-2-jane.malalane@citrix.com>
 <0a31970c-c0f8-c995-ce04-67523a4a830a@suse.com>
In-Reply-To: <0a31970c-c0f8-c995-ce04-67523a4a830a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb2a06e6-cc01-4fa7-3290-08d9f8784878
x-ms-traffictypediagnostic: BY5PR03MB5299:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs: <BY5PR03MB529940A5C3AE7274C124C174813E9@BY5PR03MB5299.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P/nuz6OoVWZq9SiVl3TgErqM+E7gGIlUbIETI5vJ4044ZSUo0JOXrYGNeslOLej0Tl+4UEwY7PRu694ASuu3yfAzpuCYAD/7saTMqA3z5x0YEete11+6eeZwwITihXK2m0BF7ngqIoT3fFsdbaWilXeeFuUhx0o95wx20seGygZcjfLWG1uGjxpDGgFCraipi3MyAMaWkbN8LegUPkcl/FHZH9C6uWdugq88ibc+vqRoTEsg8myOt1ytsHt2BGxdF2v/pFIIlSxm2Wifi4cFq2y978C2nQt3cyrMSJFgH8O+rns9am0lmGDZDKXDIT/PaXp9Q5R+Q3rtkJfn1yB4B7zEB1GeV61D/MgJmH66Ay51sZHFA2Z9pmjPyiJNak7PyTPQsoCMWs+wht5diiEWv4DoPcqudRNwSAbtX9Jd8Jz8aW+Zi+mUSEXSkrQsVDErb3qIQz+3CeQtrjS4xAZxCFFgI3+5TKlzibYA6Ms1TGCk9X1zGL5rXXCJeRE+KxFm8Fismj3xRFPUeu74IwxBJjOfsZ/4y4LIwkQToVynokUyEcjKIazD9FjZWxN96tRaZ4Kv2O5vHwaGztyICrzAaNlF9DEnc0hXHvOPENhP2PwiCw2qPa8YZFcc9zaSdmbfoWgc9dQsZ8nGxUTDRoOZUpOuBdds/uMlUSQCY03/4MnPAO+0tj9lRa16R5aPedIa3nZnGWHU44+P2LqaKRkcE9dI6H8m504+rZs9LCdZJBJHRIlEpI2R180EGPRmMAbP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(31686004)(6512007)(6506007)(66476007)(316002)(36756003)(122000001)(31696002)(508600001)(53546011)(6486002)(71200400001)(83380400001)(186003)(2616005)(26005)(8936002)(7416002)(54906003)(6916009)(5660300002)(66446008)(82960400001)(86362001)(8676002)(38100700002)(4326008)(64756008)(91956017)(76116006)(66946007)(38070700005)(66556008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVNldFNueDM1VUpXTTRhNVQwenEwb1dNOWM5Z1FtM0xDSmJnWlRJWlFEeTNo?=
 =?utf-8?B?WlAzQ1ltTklBM25hcU9JdlgvU0s3ekxWZU1kdG82b0pER2dUa2JhaURGQ2lM?=
 =?utf-8?B?T2ZKWjZZOXFsQ3dFZXppWE5ibjc4S1Mrc0tiOExhYUxOZXpzdEFXZ0JBa2Ry?=
 =?utf-8?B?bUZrQnltd01CSUkrSEUrVitRUDI2eEx2VVN6NmlVSTE2cFNrNkZ1SGgzbmVp?=
 =?utf-8?B?aFduYWVORk5iYm9kdlVBNytiOHhqWHJRVnlOOVkza05KYjkxNlNiVndhcENy?=
 =?utf-8?B?Ynk1d2NtYXYzM0J1WWl0eFNsYjAvZExFUDEzd2ZIRWxTZElKZ1g0VEN5UWo5?=
 =?utf-8?B?cEJJTnVjV1k4QXhqWVJLQ0w2SXFTb3JjWUdPRmJiZzJDRXRROXVVQVQrT1RZ?=
 =?utf-8?B?M3VwejRIa2NDMTZoMU9lZmR2U0E2NG80eXhBY2tSOXZPYXhlY25EbnZPNjFk?=
 =?utf-8?B?Vm9aei93OW1nQTl1SGs2VDd2RXNDVEZ6NGZvTWV4ZTd4WUZQNDR0L3B5aVk0?=
 =?utf-8?B?MElYUjljZUcyMkJKcTRqQmwrb1RCNzZDaTA5cklIMDlIdUcrTVp3c3RPYSsx?=
 =?utf-8?B?aFhJa3pVNy82UHdPYVNMNmYwMHdrdDIxTEpIV1RnWU15NFVSdWIrMVc4Unh4?=
 =?utf-8?B?c240akUzZ3pGdXBlWjE0ZFdKT29HbmFLOFFxRVFuQk9BV2ZoN0VQQSt1Z1Vm?=
 =?utf-8?B?TVc5aThXS1NrbVp2UWNSTjZ0OGVReEZkbDE0UXVYdzB1dzdiRXpSV0ZWNUZE?=
 =?utf-8?B?V0dxYmxvN0lORHpUMmo3UnlPTndQMDJ2dDVxaTBRNk1IMjM2ZmhNYm1QN0pD?=
 =?utf-8?B?K3RZSGhnQWRuZUdjYkpqUGhyUG9GejR2QTlaUGJtWFZGaVRsbmk1QzhWaVp0?=
 =?utf-8?B?WEwvL0piWC8zWE5RZVc3cVRDaHBveFY4dWJ6cFB6ZFY1QkFzNHJveGNuUEJW?=
 =?utf-8?B?M1g5YTVYWFNUY2pNNFVOZ1JwaVB5aWQ3RGZSSFJ0SWN3aVJDUmgxRjAwcTNz?=
 =?utf-8?B?SitaNmEvOU1tdWJnTnRmOGFCTEJvM2hIRnlGM0tBQXB5eTJWalJCQ0s2bk04?=
 =?utf-8?B?clMrMGp5cE5RNmtMdHhhRytwN3JtUnhOTVlLb0FXdENQSG5icm5JOWV3VHJ6?=
 =?utf-8?B?TFg3MncvWlZsT0luMVkzNGpJamJxdDVaQ0RwVW5EbHk4L2JkbVRQN3RCU2Jr?=
 =?utf-8?B?OFlzZ1RJY1FKNFRPOHFBSHFRalZXcU9jWERuRmVwWWFkSENmeFI2MXRrSTgx?=
 =?utf-8?B?d2JZNmFGSFFBL285UFN5cDJ0MDJaRFhVeHhwWUszWUxIR21KZU4vcDQwSS81?=
 =?utf-8?B?OTYwa1kwT3hoMWR5alpKOVN6WVVXdDlsVnVzU0hRN3pHTjlyOTBJZm1ZbGRJ?=
 =?utf-8?B?NEVQRTkvUDJGL3ZRQXlWNkpaUmg3by9uSzJ1b2Y0L3lqeDRtbDlnRStaZy8z?=
 =?utf-8?B?WFJLd1ZZa1l1elFpeUJUTU5ibGRvSjVmcExaTjltSGFIN2YvREsvd2NROWti?=
 =?utf-8?B?WStvOUhiSmZtSGFaUGdlZDVmZk1JY29LN2lHaE94czUxcEFUUFozeTlVV1ZH?=
 =?utf-8?B?ckJBZUNiZ3hDK0lkNTlSY0VMempKUHFmOWZkUlN5NUdhc29pRE4wV2tOL1Jl?=
 =?utf-8?B?QlJMa1JEYWJoN3gwNzE4UmhtMGZJNXN4ZXR3WEZUYUVJbHZVZ202YzRPTy9X?=
 =?utf-8?B?akd2M3cycGNZTXc3YnlISW9XeDZmRXBoL1A1eVNtQWxQa29QeXY1Skt2SmxH?=
 =?utf-8?B?S2xXZFNpZlB6TkthUkZ5SExOZXY1ZXhTN1cydExzc2NFTEl1VU05di9EYjNV?=
 =?utf-8?B?OUg5QXY0Umh6WjF1UkFSemh0dktlbFdXTmRPUG9zOVJXaDVXTFZVMkEwdVRF?=
 =?utf-8?B?NkxoWUc5K2Z5bCtuNHAwMWhDMDNVQVRHWThEd3lNQm8rVG52dlN3Sjg1UXdz?=
 =?utf-8?B?eVFLU2Z5VndmaklNV2dZMTJmcG1NdlMzNDJPelRxL1NkUG5zdUg3ZXhuWGFI?=
 =?utf-8?B?ZVh4aEErTWJ6K0FqcmJZaGtNeGxhcU1UZ2hla2N5RUlyaU45bllMQ0hpTFJP?=
 =?utf-8?B?THRzeGp2RDhCRzhmaEpsd0pMaWR0SXVlemJZd3dEUmlzRFg5aWc5UHhBYUFx?=
 =?utf-8?B?SzVqd3dYenlPRFdxZHBlSTlqS0FyV2RJZ2hJd2k3V3hzdlloZXpLUVFxR0Vh?=
 =?utf-8?B?cG0vRTJBLy84dEkvLyt6UXN4QnlJMFZNV0VxQzk4Wm9WZjZYZDJXSHVJKy8y?=
 =?utf-8?Q?UU1F86TpgJoO+pe3yG5xWKiOQ3KdFdIfr2p9oIs9u4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <05531D31B4132148BED2A7855A73FC2D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2a06e6-cc01-4fa7-3290-08d9f8784878
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2022 16:02:54.4611
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9wv+HRBp9Pis3GdWY/VGe4G0Dsq+TBwxiIdKwunh9T1A9ARuya2SvrmImhgz5SSJfMcJhFN+bZMEIhLtPBFwhIKWCLvquaVwSmkBn/REiSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5299
X-OriginatorOrg: citrix.com

T24gMjQvMDIvMjAyMiAxNDowOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFtDQVVUSU9OIC0gRVhU
RVJOQUwgRU1BSUxdIERPIE5PVCByZXBseSwgY2xpY2sgbGlua3MsIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZS4NCj4gDQo+IE9uIDE4LjAyLjIwMjIgMTg6MjksIEphbmUgTWFsYWxhbmUgd3Jv
dGU6DQo+PiBBZGQgWEVOX1NZU0NUTF9QSFlTQ0FQX0FSQ0hfQVNTSVNURURfeGFwaWMgYW5kDQo+
PiBYRU5fU1lTQ1RMX1BIWVNDQVBfQVJDSF9BU1NJU1RFRF94MmFwaWMgdG8gcmVwb3J0IGFjY2Vs
ZXJhdGVkIHhhcGljDQo+PiBhbmQgeDJhcGljLCBvbiB4ODYgaGFyZHdhcmUuDQo+PiBObyBzdWNo
IGZlYXR1cmVzIGFyZSBjdXJyZW50bHkgaW1wbGVtZW50ZWQgb24gQU1EIGhhcmR3YXJlLg0KPj4N
Cj4+IEZvciB0aGF0IHB1cnBvc2UsIGFsc28gYWRkIGFuIGFyY2gtc3BlY2lmaWMgImNhcGFiaWxp
dGllcyIgcGFyYW1ldGVyDQo+PiB0byBzdHJ1Y3QgeGVuX3N5c2N0bF9waHlzaW5mby4NCj4+DQo+
PiBTdWdnZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBKYW5lIE1hbGFsYW5lIDxqYW5lLm1hbGFsYW5lQGNpdHJpeC5j
b20+DQo+PiAtLS0NCj4+IHYzOg0KPj4gICAqIERlZmluZSBYRU5fU1lTQ1RMX1BIWVNDQVBfQVJD
SF9NQVggZm9yIEFCSSBjaGVja2luZyBhbmQgYWN0dWFsbHkNCj4+ICAgICBzZXQgYXJjaF9jYXBi
aWxpdGllcywgdmlhIGEgY2FsbCB0byBjX2JpdG1hcF90b19vY2FtbF9saXN0KCkNCj4+ICAgKiBI
YXZlIGFzc2lzdGVkX3gyYXBpY19hdmFpbGFibGUgb25seSBkZXBlbmQgb24NCj4+ICAgICBjcHVf
aGFzX3ZteF92aXJ0dWFsaXplX3gyYXBpY19tb2RlDQo+IA0KPiBJIHVuZGVyc3RhbmQgdGhpcyB3
YXMgdGhlIHJlc3VsdCBmcm9tIHByZXZpb3VzIGRpc2N1c3Npb24sIGJ1dCB0aGlzDQo+IG5lZWRz
IGp1c3RpZnlpbmcgaW4gdGhlIGRlc2NyaXB0aW9uLiBOb3QgdGhlIGxlYXN0IGJlY2F1c2UgaXQg
ZGlmZmVycw0KPiBmcm9tIHdoZW4gWEVOX0hWTV9DUFVJRF9YMkFQSUNfVklSVCB3b3VsZCBiZSBz
ZXQgYXMgd2VsbCBhcyBmcm9tIHdoYXQNCj4gdm14X3ZsYXBpY19tc3JfY2hhbmdlZCgpIGRvZXMu
IFRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhvc2UgdHdvIGlzDQo+IHByb2JhYmx5IGludGVuZGVk
IChqdWRnaW5nIGZyb20gYSBjb21tZW50IHRoZXJlKSwgYnV0IHRoZSBmdXJ0aGVyDQo+IGRpZmZl
cmVuY2UgdG8gd2hhdCB5b3UgYWRkIGlzbid0IG9idmlvdXMuDQoNCk9rYXksIEkgd2lsbCBtYWtl
IHRoYXQgZXhwbGljaXQuDQoNCj4gV2hpY2ggcmFpc2VzIGFub3RoZXIgdGhvdWdodDogSWYgdGhh
dCBoeXBlcnZpc29yIGxlYWYgd2FzIHBhcnQgb2YgdGhlDQo+IEhWTSBmZWF0dXJlIHNldCwgdGhl
IHRvb2wgc3RhY2sgY291bGQgYmUgYWJsZSB0byBvYnRhaW4gdGhlIHdhbnRlZA0KPiBpbmZvcm1h
dGlvbiB3aXRob3V0IGFsdGVyaW5nIHN5c2N0bCAoYXNzdW1pbmcgdGhlIGNvbmRpdGlvbnMgdG8g
c2V0DQo+IHRoZSByZXNwZWN0aXZlIGJpdHMgd2VyZSB0aGUgc2FtZSkuIEFuZCBJIHdvdWxkIHZp
ZXcgaXQgYXMgZ2VuZXJhbGx5DQo+IHJlYXNvbmFibGUgZm9yIHRoZXJlIHRvIGJlIGEgd2F5IGZv
ciB0b29sIHN0YWNrcyB0byBrbm93IHdoYXQNCj4gaHlwZXJ2aXNvciBsZWF2ZXMgZ3Vlc3RzIGFy
ZSBnb2luZyB0byBnZXQgdG8gc2VlIChhdCB0aGUgbWF4aW11bSBhbmQNCj4gYnkgZGVmYXVsdCku
DQoNCkxpa2UgdGhlICJjcHVpZCIgeHRmIHRlc3QgYWxsb3dzIHVzIHRvPw0KTWFrZXMgc2Vuc2Ug
dG8gbWUuIEknbSBoYXBweSB0byB0YWtlIHRoYXQgdXAgYWZ0ZXIuDQoNCj4gDQo+PiAtLS0gYS94
ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9z
eXNjdGwuaA0KPj4gQEAgLTM1LDcgKzM1LDcgQEANCj4+ICAgI2luY2x1ZGUgImRvbWN0bC5oIg0K
Pj4gICAjaW5jbHVkZSAicGh5c2Rldi5oIg0KPj4gICANCj4+IC0jZGVmaW5lIFhFTl9TWVNDVExf
SU5URVJGQUNFX1ZFUlNJT04gMHgwMDAwMDAxNA0KPj4gKyNkZWZpbmUgWEVOX1NZU0NUTF9JTlRF
UkZBQ0VfVkVSU0lPTiAweDAwMDAwMDE1DQo+PiAgIA0KPj4gICAvKg0KPj4gICAgKiBSZWFkIGNv
bnNvbGUgY29udGVudCBmcm9tIFhlbiBidWZmZXIgcmluZy4NCj4+IEBAIC0xMTEsNiArMTExLDEz
IEBAIHN0cnVjdCB4ZW5fc3lzY3RsX3RidWZfb3Agew0KPj4gICAvKiBNYXggWEVOX1NZU0NUTF9Q
SFlTQ0FQXyogY29uc3RhbnQuICBVc2VkIGZvciBBQkkgY2hlY2tpbmcuICovDQo+PiAgICNkZWZp
bmUgWEVOX1NZU0NUTF9QSFlTQ0FQX01BWCBYRU5fU1lTQ1RMX1BIWVNDQVBfZ250dGFiX3YyDQo+
PiAgIA0KPj4gKy8qIFRoZSBwbGF0Zm9ybSBzdXBwb3J0cyB4ezJ9YXBpYyBoYXJkd2FyZSBhc3Np
c3RlZCBlbXVsYXRpb24uICovDQo+PiArI2RlZmluZSBYRU5fU1lTQ1RMX1BIWVNDQVBfWDg2X0FT
U0lTVEVEX1hBUElDICAoMXUgPDwgMCkNCj4+ICsjZGVmaW5lIFhFTl9TWVNDVExfUEhZU0NBUF9Y
ODZfQVNTSVNURURfWDJBUElDICgxdSA8PCAxKQ0KPj4gKw0KPj4gKy8qIE1heCBYRU5fU1lTQ1RM
X1BIWVNDQVBfWDg2e0FSTX1fXyogY29uc3RhbnQuIFVzZWQgZm9yIEFCSSBjaGVja2luZy4gKi8N
Cj4+ICsjZGVmaW5lIFhFTl9TWVNDVExfUEhZU0NBUF9BUkNIX01BWCBYRU5fU1lTQ1RMX1BIWVND
QVBfWDg2X0FTU0lTVEVEX1gyQVBJQw0KPiANCj4gRG9lc24ndCB0aGlzIHRoZW4gbmVlZCB0byBi
ZSBhIHBlci1hcmNoIGNvbnN0YW50PyBUaGUgQUJJcyB3b3VsZCBkaWZmZXINCj4gdW5sZXNzIHdl
IHJlcXVpcmVkIHRoYXQgZXZlcnkgYml0IG1heSBvbmx5IGJlIHVzZWQgZm9yIGEgc2luZ2xlIHB1
cnBvc2UuDQo+IElPVyBpdCB3b3VsZCB3YW50IHRvIGJlIG5hbWVkIFhFTl9TWVNDVExfUEhZU0NB
UF9YODZfTUFYLg0KDQpPa2F5Lg0KDQo+IA0KPj4gQEAgLTEyMCw2ICsxMjcsOCBAQCBzdHJ1Y3Qg
eGVuX3N5c2N0bF9waHlzaW5mbyB7DQo+PiAgICAgICB1aW50MzJfdCBtYXhfbm9kZV9pZDsgLyog
TGFyZ2VzdCBwb3NzaWJsZSBub2RlIElEIG9uIHRoaXMgaG9zdCAqLw0KPj4gICAgICAgdWludDMy
X3QgY3B1X2toejsNCj4+ICAgICAgIHVpbnQzMl90IGNhcGFiaWxpdGllczsvKiBYRU5fU1lTQ1RM
X1BIWVNDQVBfPz8/ICovDQo+PiArICAgIHVpbnQzMl90IGFyY2hfY2FwYWJpbGl0aWVzOy8qIFhF
Tl9TWVNDVExfUEhZU0NBUF9YODZ7QVJNfV8/Pz8gKi8NCj4+ICsgICAgdWludDMyX3QgcGFkOyAv
KiBNdXN0IGJlIHplcm8uICovDQo+IA0KPiBJZiB0aGlzIHdhcyBhbiBpbnB1dCBmaWVsZCAob3Ig
Y291bGQgcG90ZW50aWFsbHkgYmVjb21lIG9uZSksIHRoZQ0KPiBjb21tZW50IHdvdWxkIGJlIGFw
cGxpY2FibGUuIEJ1dCB0aGUgd2hvbGUgc3RydWN0IGlzIE9VVC1vbmx5LCBzbw0KPiBlaXRoZXIg
b21pdCB0aGUgY29tbWVudCBvciB1c2UgZS5nLiAid2lsbCIgb3IgYmV0dGVyICJyZXNlcnZlZCIg
KGFzDQo+IHBlb3BsZSBzaG91bGRuJ3QgbWFrZSB0aGVtc2VsdmVzIGRlcGVuZGVudCBvbiB0aGUg
ZmllbGQgYmVpbmcgemVybykuDQoNCldpbGwgb21taXQuDQoNClRoYW5rIHlvdSwNCg0KSmFuZS4=

