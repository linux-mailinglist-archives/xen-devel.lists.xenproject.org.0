Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B8763DBC3
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 18:16:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450074.707232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Qgt-0000zW-Iq; Wed, 30 Nov 2022 17:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450074.707232; Wed, 30 Nov 2022 17:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Qgt-0000wg-Ep; Wed, 30 Nov 2022 17:16:11 +0000
Received: by outflank-mailman (input) for mailman id 450074;
 Wed, 30 Nov 2022 17:16:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7pd0=36=citrix.com=prvs=3269fc642=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p0Qgr-0000ky-Ls
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 17:16:09 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aaf9137b-70d2-11ed-8fd2-01056ac49cbb;
 Wed, 30 Nov 2022 18:16:04 +0100 (CET)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Nov 2022 12:16:02 -0500
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by SJ0PR03MB5774.namprd03.prod.outlook.com (2603:10b6:a03:2da::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 17:16:00 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b%5]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 17:16:00 +0000
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
X-Inumbo-ID: aaf9137b-70d2-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669828564;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=BANwaHqhI6IT2cJctozGMKaowGCYQ4FuCE6XMZprALA=;
  b=JssyTUmQabAyAZyV8hYw7bNx8Eo949YDOMF9d3vnRFsKGuaOUP/Ro5Rj
   V2PAx2ZHJaUNiY/c8ocZLDf1Z/UYoGf71vHFlAGZ7+pfh8EbjdBmYoAaT
   6nD+rzaZqXBfjxSLXMP9mhSyMUlqUq3LOTXVkvzq1LiEtjYps6Z2CD7AK
   Y=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 85904097
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ugEXd6DHflgwqhVW/zriw5YqxClBgxIJ4kV8jS/XYbTApDMr1TAEx
 2pJXG/XM/bcNmbyKY0jPdy38UgHvpbTx9I3QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WpD5gRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwyL9GKG1Ty
 M4jFjlQXii/juaM7bSjVbw57igjBJGD0II3nFhFlGicJtF/BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI++xuvDa7IA9ZidABNPLYdsKLQ4NJmVyfp
 UrN/njjAwFcP9uaodaA2iLx17eTxXKkMG4UPLmgyNBXqlio/W4eGEQ9RVSguMe11UHrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAIRyBMQMYrv8g3QXotz
 FDhoj/yLTlmsbnQQnXE8L6R9Gq2IXJMcjFEYjIYRwwY5dWluJs0kh/EUtdkFuiyk8HxHjbzh
 TuNqUDSmokusCLC7I3jlXivvt5mjsGhotIdjukPYl+Y0w==
IronPort-HdrOrdr: A9a23:C/HPda7hh/JzHA6/zwPXwROCI+orL9Y04lQ7vn2ZFiYlEfBwxv
 rPoB1E737JYW4qKQ0dcdDpAtjlfZquz+8L3WBxB8bvYOCCggCVxe5ZnPPfKlHbak/DH6tmpN
 pdmstFeZLN5DpB/L3HCWCDer5P/DDEytHTuQ639QY3cegAUdAG0+4NMHfjLqQAfnghOXNWLu
 v42iKazwDQJEj/aP7VOpD/ZYX+Tifw/q7OUFonHBgh8Q+UkHeC7rPrKRiK0n4lPw9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69B7icbs0dxKAe2Lk4wwJi/3ggilSYx9U/na1QpF4d2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303NwSsj8HjrzH6fmD/GrdbiTDw3JsJdjcZycwff6WAnoNZguZ
 g7kV6xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeQKU5l/1ewGplVLM7WA7q4oEuF+
 djSOvG4uxNTF+cZ3fF+kFy3d2XWGgpFBvueDlAhiXV6UkVoJlK9Tpd+CUtpAZGyHv7cegD2w
 3wCNUsqFiJdL5OUUsyPpZYfSL9MB2yffuFChPiHb2gLtBcB5uFke+G3JwloO6tY5AG1500hd
 DIV05Zr3c7fwb0BdSJx4AjyGGHfIwTZ0WY9ihy3ekxhlTHfsuiDQSTDFQ118ewqfQWBcPWH/
 61JZJNGvfmaW/jA5xA0QHyU4RbbSB2arxZhv8rH1aV5s7bIIzjseLWNP7VObr2CD4hHmfyGG
 EKUjT/LNhJqkqrRnj7ih7MXG6FQD20wbtgVKzBu+QDwokEMYNB9gATlFSi/8mObSZPt6QnFX
 EOVo8PUpnL0lVe0Vy4mlmBYCAtfXq9yI+QIU93mQ==
X-IronPort-AV: E=Sophos;i="5.96,207,1665460800"; 
   d="scan'208";a="85904097"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkMwq18vhR0CPDBsUc3Y8kcFz5cwnX6G+E0+VZdqudohpH+3ZAmiZQnwdzAfwshq5TMlaMfCB5VvB+riC58qrcz1sSd/R5J8GVhzpCHHNswtuX5dHD5+SEqk+BYxUyEI78SxbM3BkDWxIG21niizgusBjRl6CBgvsleVp2cULDzju7z9kGfafuTAZUrfyqXq+WvvoeZeU2ilxHfiEc9ejXKls7RIMoSqwhnIf2pfshpTrM1j/jPV9vwigSWJl6oyP0k+E5lHaLvlZcM19/sNQsxT2/Iue7+vGEnrR3ChS5/uW6nHklhsWVhdCZT2YIehNcF9oT//Jvvuxy3wXuvgSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BANwaHqhI6IT2cJctozGMKaowGCYQ4FuCE6XMZprALA=;
 b=OXd8g35VTnrCtNcTShlPvqgRb5zWken590MGL10tnhadf+iY14a9wmatEZPCKtRoKO9rj1ok+p1tWpREI64n9dHpzJMGCaPEckqS+xZWrETtdACZHerqbcFunXkgIuT6fmIHHV78tI/AucngnMFPYp8OeSneuNwh4UgFLMU4lB9LI7nOnPYmCcTh8U5CrzCt2DsGnlG3OcdxDmbT5jkNeoTOi1EhVVnpyvne1TolERkxeDmFh1xzo/qyirILVo+/k9EGaA16kCI6IjtTv2jQCaOGHMD3zaHtGDQJ9qp5PmaQdqlLfwj6Pa7Us9F+Cky/x3Q3hd6assJDtbhj6Fcduw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BANwaHqhI6IT2cJctozGMKaowGCYQ4FuCE6XMZprALA=;
 b=lMowBhCzSVC4dwl04mGk+vXKKEYGt4iiKKcdc9W85Y7SUnm6Afu6JChvRXJi359lmRyqgV1eJHtMEoKdPbniRHObCUSBqwQ7Nem27mYSsCYnXGBTgMwZxyexSNc2UA3WJYXqAeRb8qzo8mYCZe8V7aNAVAzU7PUvdFD2hMLX7ZU=
From: Edwin Torok <edvin.torok@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: Re: [PATCH v2 3/6] tools/oxenstored: Rename some 'port' variables to
 'remote_port'
Thread-Topic: [PATCH v2 3/6] tools/oxenstored: Rename some 'port' variables to
 'remote_port'
Thread-Index: AQHZBNyGOuNzAC/NjkO7rxn7kxYOVa5XtQ+A
Date: Wed, 30 Nov 2022 17:16:00 +0000
Message-ID: <63924CC6-CACB-402F-AF7D-87F243DE0585@citrix.com>
References: <20221130165455.31125-1-andrew.cooper3@citrix.com>
 <20221130165455.31125-4-andrew.cooper3@citrix.com>
In-Reply-To: <20221130165455.31125-4-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|SJ0PR03MB5774:EE_
x-ms-office365-filtering-correlation-id: 45472641-8abb-4178-07f3-08dad2f68d7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 sp3L3mnw/+Xrny/dQDWMZdmRxPAmxuEpi3scOaB1XWI6iq8c3d559SbzFRUkYB5lk+K2Q0XW/2QtTElX6qefG85PIryZCFaD5YjLpRHCp9w93OnOb1hkbQHlCubiCr5QXJxzVUf7BKDp3G9p6ygQbofQgU3Q7mNjIggTE2v4lAaphIhjjtccY28uJZb+jRdKmPuj0y12fTSOayJUogciHhCZbUaHNTaytFD7Klh6tYH40zNRKV5JMCDFxOeXRCHIbqq2jhuPg8dzCzvolzMHZMcv5/G8dXjlQJDABU9qW8CDxM5Pk7ROxJQh71H2JMdm+Z2LZdfBkKoJyMiXxUGz4iTj+DYu0DGRfJdco8akCRadocioi5WcUJMAUtJyCCMXAxDJUQu/V8jG80KrrMvP9iBCt84ikhIp9f4O+iKq36wLxMwfVdVdRzFdbQ+MMIdVXfOfRkkm8Wkjb1Rv+iSfnC54CDKFvQlJR8sfEMFLIdlmG4CZJ3NBRmy/zMdVlmB2kVXQyRpEp5wnHh4uSHtuF70jm7GypKJBRPG2WlHVHSzkO79DC/HytwvbBMdCOfJyVHjD66oWJD2yjGCuVgOV+HQIE0YZck8+8BcHqoaOk6hggSms+60L8xLdyY2yNqqjCzAbyzyUXsbG14FSQvpsZyI5/n6l6kmjyIUleb2z1vWB8piZoqrDdEhO2MhdSBY9vom9J2OEb/bhCz4WS0zcFl57pAj8hE97lu2UpIgeY3Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(451199015)(66574015)(83380400001)(2616005)(53546011)(6506007)(6512007)(186003)(26005)(71200400001)(478600001)(41300700001)(36756003)(107886003)(2906002)(6636002)(122000001)(316002)(8676002)(54906003)(4326008)(76116006)(37006003)(91956017)(38100700002)(82960400001)(6486002)(66476007)(66946007)(66446008)(66556008)(33656002)(86362001)(64756008)(8936002)(6862004)(38070700005)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UEVYeFNGNVBseUU4SUhVODZQNTZRSWZMUlNTZFI1M3c5SWNKSXVnYkdzZWk1?=
 =?utf-8?B?TjBEZlowcDRVVU9SdTJnclh6OEZGVjlQNWpPVlFyTitDL0MxWUtpM1k0Y2pw?=
 =?utf-8?B?ZEllMnFLQjhrWCswQm5RVERMY0kvS0lpVlNZNnJzOHRYZldTMHByV3FGUGhm?=
 =?utf-8?B?Q3dOcG1zZ1VmSncra3ZGYklCQUx2dm5MREw4YzBBRktqd253Y2dEUms0blMr?=
 =?utf-8?B?L1FTR2dLWmJxM1FvNS9RcU81OHZJbU5aOHk0UHNaN0dmQ3B3Z2F4Z2RYeFZq?=
 =?utf-8?B?Y3BWbUJkYTZuNkMyQksrZy80TzU2N3FpaGUzZjNlcjZzRmE0OVdnMnZGaFFx?=
 =?utf-8?B?dUVyc1AyZEdOODR1OCt6S2tPL3R2QjZyNkVzU1U2VVpkYnJMYkVEa0Iza2Iv?=
 =?utf-8?B?ZXZBd3NvbkVFVURUVy9WM0gwY1pvc3FUa1piaGF4YVh6Zk1wWDNPbjdMRzFu?=
 =?utf-8?B?NnNGcVFkL3dLMW44YUJYUDBHVy82Vk9vT3huY0Y0K3JFdGlNYVF6Q0V2R2ha?=
 =?utf-8?B?Uzd3aW1wRnFDaW9Kem1nWnFSVUJPL21RWDlnbXRiVCtlNzFjdTUzVXRINEtw?=
 =?utf-8?B?MlZBS1E5Zjd0bUp6WEd1MUYzNE1oK2dLQnBDYkJKR09RM3F1ZUF5VTVmR2pG?=
 =?utf-8?B?ak5uU3MyVFEyS1E1bXJHZjN1VjV6T3dsQmRqN1BEQkN6aEl3MFZpREF6MFdV?=
 =?utf-8?B?WStMY3ZVTk5IalB0bkM4dGpla1ZhaXAwRXBoQ1JWVzBjeHViQTZOWnVaZ1hi?=
 =?utf-8?B?ZWRvQ2YyR0hWc3UzQVhWWnFCcGFYQzV2K3ZENHlDNTZjdTY0aEgzSjFlaDFE?=
 =?utf-8?B?SHVQcEFVaEpmTExHajFndWg1UTZPSWhRaUxleUFMTE1VRllIMDlBWHdyYUhz?=
 =?utf-8?B?ZDRPRGpQY1IraFRydUJ1UXhsTnBFQVNySGt0ZWxycHdKSXRSeW9FUnhxalVn?=
 =?utf-8?B?ZWNnbWZ3UWRETldldXU3TVpkOEt0R0ZlWkc5WktoYnlDaGZrR2dURVEydVNu?=
 =?utf-8?B?NUF3TGpydDRyYkx3Y2VtYlJYUSthVXR2aXNjdm15cnRQVHA4ZGNmc242NmFC?=
 =?utf-8?B?STRsUHZQNy9tTkJadUdad1NwRnJrRHlsQnhPdEgyK0hwK3BZVUZwcTdTNmRo?=
 =?utf-8?B?VHlVZWY5UEhGV0Y5dXZ6aVZ1dGJIOUV0NXVwTHZRamRtamZ5UjJKVXhDdFpj?=
 =?utf-8?B?TmdhRm9hcG56WkhsbERPUjU4NjMvMVdqQ3RvQnc1YXU2VXVhdk1YYzBkVVgr?=
 =?utf-8?B?cjdaWXp0elF5dEdqN2dSdlNnTVZnNGtQTmdKY0taMWNxOEZHOUdKTHR3SWJw?=
 =?utf-8?B?TTRqWFBFb21kQnhGQWwwYkxVVU1lZUFtamNiU2p4dGZxdjRvL2M3ZW5CVGJU?=
 =?utf-8?B?WkpiUm0vQmJDOTFqR2tUaFZQUnRsS3E3U2k0WU05dXQvY0dSS0RaN0RrajZ3?=
 =?utf-8?B?QU5mWmJ1ZUdPUGNtTzB5a1p1b3MxVjJXVER2dHFGaHVzSHNyaEVSVk55VnFD?=
 =?utf-8?B?cXdwWkNCMnU3UWx0RUFYWWVKTjFEa2JPWEdLMHNiYmVWM1EyanBsd002a0lX?=
 =?utf-8?B?NlhERGNrb2pic0QwVFYrM3pHbmFRS3c5SFZUcU9vSlFuZlQ5K2xIZVFIUkNI?=
 =?utf-8?B?em1CUEZ6TFI1dk5yYW02d3V1WFVhVkN0MXpLV2lXVW14eU1hUjZzd3VOU0k3?=
 =?utf-8?B?TXdCRThDcWxwWGFkb2RnNU9FNkpodk1yS0NIaGtsVXZZRnN2OWxBVHYwU1Q1?=
 =?utf-8?B?TU85U3EzaUZFMFZBZk9PdTBPbHNwRm9XSFJ0Um55UWRTSFE1bUFMSUJOWXJt?=
 =?utf-8?B?WGFMd01TV0RCR20vdWxWWWUxeDhXUjB3Q3dsYTBHcTFJRWNEelExYjYvTmQ0?=
 =?utf-8?B?RENFakhPNnV4ZkZmVHpPRUZLWHNydnczYnNqWkVQeE9DSndMdG9McGtPdDdF?=
 =?utf-8?B?M2dtU2pNNVdXckhIMVM3bGZTUm8vLzFiTUhoWC9CWStkdUVGMkFxeXRPQm43?=
 =?utf-8?B?a0F0QmlPQm0zZHJxZ1htbHNSeW04NitBYVhEbkdoWlhNTzFIQjYyUUlPKzBn?=
 =?utf-8?B?T2dvOXVnZzNPbDFPQkhiM2tTQm9oNUtUcGZsTFBVekZ0NG1EaGlVL2hyb2l3?=
 =?utf-8?B?bTNaYUtTN2J1OGJjSS9wOHJ4OUpOVkJxNDNwVjlyN3IwWWtMRlVHQXBLYmZJ?=
 =?utf-8?B?bHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8762B3FB930E14EB020749A417FF3D2@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DlnhHjjKfs32TKtoAoHDd9oldd5N0FGqxOmfqotJomS+cz1rcMgUZ5ASThZmAGmSFT8+tCo3T4Pk85reSK+n26amES6kUItSUjURfER2B5E3PKKEUBs1rPqyZhM7UuXlzLXHT6HnPi0o4pxm9RH5k2IOlH1aWPj6PtNCq2yr0MtTYEfZ478GxjH51uW2OJizSFk9wTWfcqdvGZAu9mB2d1yMtk4jOzg6SnOb+1hDaZiK5+WazqxI+eE/0l5HUm17RQ/6OfB4XrGylisjFhYhTK+te6PbxMNuZRi8xHuqcpuGfzUHPk3Br6sSmOXZrTWRwCkBssEYTwLQeV3Opm2+476CDPmPCO4ZU9ZV4+Co4/ryE9XujtRuUwNhXcOQd3J9kvR3IWcjmbt94lBCJgk7TQp3YAeEyOQh4WjI2eK7C+Prn3Zhuc0rmPRsrNeYoFgtpNfeTHV+WqPhkfAsQl1NkEdj0YJuK6UduS4ly3TKoPr6JRIoLg1CKHlr6eCoF5ZXCp4J1P8BoBXqvI+LjoVKtuQpay23NFcNHnMDxzoYCbjVwe/tgLGsp7CAGwRNUpdVE9B1N1tBJwknLb04QoIeIQY5/6xUejuJQ90Xkm6yoXSL26PtrxxgbPgrUQQTeWAwTN2uxYW9cyFCNxYJbkylCI0oM7wtVwuUiUY7ua/WydgRPDjzMOGginzZ1ZjZJmfoO1RZh76PyyJWpG4HuGFFe2UaluYwMaLiCRWn5rz7zP863hIJjZ/iMmCqBGuPFBojMTS+VqA2c29OGUCe8RJtm9lcXnGNWu3Dnzu0E9wqspTxO8TRkKUeBE6yluk10Zzu
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45472641-8abb-4178-07f3-08dad2f68d7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2022 17:16:00.3562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Su/yK/HDqU06pW26bJ36oHzIxRq3nkSkUHQjop3EF4Fdo1OdTN3pu5eefijA/NXzyvBS22M0ldNw8Kui7ZX+fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5774

DQoNCj4gT24gMzAgTm92IDIwMjIsIGF0IDE2OjU0LCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IFRoaXMgd2lsbCBtYWtlIHRoZSBsb2dpYyBj
bGVhcmVyIHdoZW4gd2UgcGx1bWIgbG9jYWxfcG9ydCB0aHJvdWdoIHRoZXNlDQo+IGZ1bmN0aW9u
cy4NCj4gDQo+IFdoaWxlIGNoYW5naW5nIHRoaXMsIHNpbXBsaWZ5IHRoZSBjb25zdHJ1Y3QgaW4g
RG9tYWlucy5jcmVhdGUwIHRvIHNlcGFyYXRlIHRoZQ0KPiByZW1vdGUgcG9ydCBoYW5kbGluZyBm
cm9tIHRoZSBpbnRlcmZhY2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiAtLS0NCj4gQ0M6IENocmlzdGlhbiBMaW5kaWcg
PGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4NCj4gQ0M6IERhdmlkIFNjb3R0IDxkYXZlQHJl
Y29pbC5vcmc+DQo+IENDOiBFZHdpbiBUb3JvayA8ZWR2aW4udG9yb2tAY2l0cml4LmNvbT4NCj4g
Q0M6IFJvYiBIb2VzIDxSb2IuSG9lc0BjaXRyaXguY29tPg0KDQpXZSd2ZSByZXZpZXdlZCB0aGlz
IGNoYW5nZSBpbi1wZXJzb246DQpSZXZpZXdlZC1ieTogRWR3aW4gVMO2csO2ayA8ZWR2aW4udG9y
b2tAY2l0cml4LmNvbT4NCg0KDQo+IA0KPiB2MjoNCj4gKiBOZXcuDQo+IC0tLQ0KPiB0b29scy9v
Y2FtbC94ZW5zdG9yZWQvZG9tYWlucy5tbCAgIHwgMjYgKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0NCj4gdG9vbHMvb2NhbWwveGVuc3RvcmVkL3Byb2Nlc3MubWwgICB8IDEyICsrKysrKy0tLS0t
LQ0KPiB0b29scy9vY2FtbC94ZW5zdG9yZWQveGVuc3RvcmVkLm1sIHwgIDggKysrKy0tLS0NCj4g
MyBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS90b29scy9vY2FtbC94ZW5zdG9yZWQvZG9tYWlucy5tbCBiL3Rvb2xzL29j
YW1sL3hlbnN0b3JlZC9kb21haW5zLm1sDQo+IGluZGV4IDE3ZmUyZmEyNTc3Mi4uMjYwMThhYzBk
ZDNkIDEwMDY0NA0KPiAtLS0gYS90b29scy9vY2FtbC94ZW5zdG9yZWQvZG9tYWlucy5tbA0KPiAr
KysgYi90b29scy9vY2FtbC94ZW5zdG9yZWQvZG9tYWlucy5tbA0KPiBAQCAtMTIyLDkgKzEyMiw5
IEBAIGxldCBjbGVhbnVwIGRvbXMgPQ0KPiBsZXQgcmVzdW1lIF9kb21zIF9kb21pZCA9DQo+ICgp
DQo+IA0KPiAtbGV0IGNyZWF0ZSBkb21zIGRvbWlkIG1mbiBwb3J0ID0NCj4gK2xldCBjcmVhdGUg
ZG9tcyBkb21pZCBtZm4gcmVtb3RlX3BvcnQgPQ0KPiBsZXQgaW50ZXJmYWNlID0gWGVuY3RybC5t
YXBfZm9yZWlnbl9yYW5nZSB4YyBkb21pZCAoWGVubW1hcC5nZXRwYWdlc2l6ZSgpKSBtZm4gaW4N
Cj4gLSBsZXQgZG9tID0gRG9tYWluLm1ha2UgZG9taWQgbWZuIHBvcnQgaW50ZXJmYWNlIGRvbXMu
ZXZlbnRjaG4gaW4NCj4gKyBsZXQgZG9tID0gRG9tYWluLm1ha2UgZG9taWQgbWZuIHJlbW90ZV9w
b3J0IGludGVyZmFjZSBkb21zLmV2ZW50Y2huIGluDQo+IEhhc2h0YmwuYWRkIGRvbXMudGFibGUg
ZG9taWQgZG9tOw0KPiBEb21haW4uYmluZF9pbnRlcmRvbWFpbiBkb207DQo+IGRvbQ0KPiBAQCAt
MTMzLDE4ICsxMzMsMTYgQEAgbGV0IHhlbnN0b3JlZF9rdmEgPSByZWYgIiINCj4gbGV0IHhlbnN0
b3JlZF9wb3J0ID0gcmVmICIiDQo+IA0KPiBsZXQgY3JlYXRlMCBkb21zID0NCj4gLSBsZXQgcG9y
dCwgaW50ZXJmYWNlID0NCj4gLSAoDQo+IC0gbGV0IHBvcnQgPSBVdGlscy5yZWFkX2ZpbGVfc2lu
Z2xlX2ludGVnZXIgIXhlbnN0b3JlZF9wb3J0DQo+IC0gYW5kIGZkID0gVW5peC5vcGVuZmlsZSAh
eGVuc3RvcmVkX2t2YQ0KPiAtICAgICAgIFsgVW5peC5PX1JEV1IgXSAwbzYwMCBpbg0KPiAtIGxl
dCBpbnRlcmZhY2UgPSBYZW5tbWFwLm1tYXAgZmQgWGVubW1hcC5SRFdSIFhlbm1tYXAuU0hBUkVE
DQo+IC0gIChYZW5tbWFwLmdldHBhZ2VzaXplKCkpIDAgaW4NCj4gLSBVbml4LmNsb3NlIGZkOw0K
PiAtIHBvcnQsIGludGVyZmFjZQ0KPiAtICkNCj4gLSBpbg0KPiAtIGxldCBkb20gPSBEb21haW4u
bWFrZSAwIE5hdGl2ZWludC56ZXJvIHBvcnQgaW50ZXJmYWNlIGRvbXMuZXZlbnRjaG4gaW4NCj4g
KyBsZXQgcmVtb3RlX3BvcnQgPSBVdGlscy5yZWFkX2ZpbGVfc2luZ2xlX2ludGVnZXIgIXhlbnN0
b3JlZF9wb3J0IGluDQo+ICsNCj4gKyBsZXQgaW50ZXJmYWNlID0NCj4gKyBsZXQgZmQgPSBVbml4
Lm9wZW5maWxlICF4ZW5zdG9yZWRfa3ZhIFsgVW5peC5PX1JEV1IgXSAwbzYwMCBpbg0KPiArIGxl
dCBpbnRlcmZhY2UgPSBYZW5tbWFwLm1tYXAgZmQgWGVubW1hcC5SRFdSIFhlbm1tYXAuU0hBUkVE
IChYZW5tbWFwLmdldHBhZ2VzaXplKCkpIDAgaW4NCj4gKyBVbml4LmNsb3NlIGZkOw0KPiArIGlu
dGVyZmFjZQ0KPiArIGluDQo+ICsNCj4gKyBsZXQgZG9tID0gRG9tYWluLm1ha2UgMCBOYXRpdmVp
bnQuemVybyByZW1vdGVfcG9ydCBpbnRlcmZhY2UgZG9tcy5ldmVudGNobiBpbg0KPiBIYXNodGJs
LmFkZCBkb21zLnRhYmxlIDAgZG9tOw0KPiBEb21haW4uYmluZF9pbnRlcmRvbWFpbiBkb207DQo+
IERvbWFpbi5ub3RpZnkgZG9tOw0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwveGVuc3RvcmVk
L3Byb2Nlc3MubWwgYi90b29scy9vY2FtbC94ZW5zdG9yZWQvcHJvY2Vzcy5tbA0KPiBpbmRleCA3
MmE3OWU5MzI4ZGQuLmIyOTczYWNhMmE4MiAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvb2NhbWwveGVu
c3RvcmVkL3Byb2Nlc3MubWwNCj4gKysrIGIvdG9vbHMvb2NhbWwveGVuc3RvcmVkL3Byb2Nlc3Mu
bWwNCj4gQEAgLTU1OCwxMCArNTU4LDEwIEBAIGxldCBkb190cmFuc2FjdGlvbl9lbmQgY29uIHQg
ZG9tYWlucyBjb25zIGRhdGEgPQ0KPiBsZXQgZG9faW50cm9kdWNlIGNvbiB0IGRvbWFpbnMgY29u
cyBkYXRhID0NCj4gaWYgbm90IChDb25uZWN0aW9uLmlzX2RvbTAgY29uKQ0KPiB0aGVuIHJhaXNl
IERlZmluZS5QZXJtaXNzaW9uX2RlbmllZDsNCj4gLSBsZXQgKGRvbWlkLCBtZm4sIHBvcnQpID0N
Cj4gKyBsZXQgKGRvbWlkLCBtZm4sIHJlbW90ZV9wb3J0KSA9DQo+IG1hdGNoIChzcGxpdCBOb25l
ICdcMDAwJyBkYXRhKSB3aXRoDQo+IC0gfCBkb21pZCA6OiBtZm4gOjogcG9ydCA6OiBfIC0+DQo+
IC0gaW50X29mX3N0cmluZyBkb21pZCwgTmF0aXZlaW50Lm9mX3N0cmluZyBtZm4sIGludF9vZl9z
dHJpbmcgcG9ydA0KPiArIHwgZG9taWQgOjogbWZuIDo6IHJlbW90ZV9wb3J0IDo6IF8gLT4NCj4g
KyBpbnRfb2Zfc3RyaW5nIGRvbWlkLCBOYXRpdmVpbnQub2Zfc3RyaW5nIG1mbiwgaW50X29mX3N0
cmluZyByZW1vdGVfcG9ydA0KPiB8IF8gICAgICAgICAgICAgICAgICAgICAgICAgLT4gcmFpc2Ug
SW52YWxpZF9DbWRfQXJnczsNCj4gaW4NCj4gbGV0IGRvbSA9DQo+IEBAIC01NjksMTggKzU2OSwx
OCBAQCBsZXQgZG9faW50cm9kdWNlIGNvbiB0IGRvbWFpbnMgY29ucyBkYXRhID0NCj4gbGV0IGVk
b20gPSBEb21haW5zLmZpbmQgZG9tYWlucyBkb21pZCBpbg0KPiBpZiAoRG9tYWluLmdldF9tZm4g
ZWRvbSkgPSBtZm4gJiYgKENvbm5lY3Rpb25zLmZpbmRfZG9tYWluIGNvbnMgZG9taWQpICE9IGNv
biB0aGVuIGJlZ2luDQo+ICgqIFVzZSBYU19JTlRST0RVQ0UgZm9yIHJlY3JlYXRpbmcgdGhlIHhl
bmJ1cyBldmVudC1jaGFubmVsLiAqKQ0KPiAtIGVkb20ucmVtb3RlX3BvcnQgPC0gcG9ydDsNCj4g
KyBlZG9tLnJlbW90ZV9wb3J0IDwtIHJlbW90ZV9wb3J0Ow0KPiBEb21haW4uYmluZF9pbnRlcmRv
bWFpbiBlZG9tOw0KPiBlbmQ7DQo+IGVkb20NCj4gZWxzZSB0cnkNCj4gLSBsZXQgbmRvbSA9IERv
bWFpbnMuY3JlYXRlIGRvbWFpbnMgZG9taWQgbWZuIHBvcnQgaW4NCj4gKyBsZXQgbmRvbSA9IERv
bWFpbnMuY3JlYXRlIGRvbWFpbnMgZG9taWQgbWZuIHJlbW90ZV9wb3J0IGluDQo+IENvbm5lY3Rp
b25zLmFkZF9kb21haW4gY29ucyBuZG9tOw0KPiBDb25uZWN0aW9ucy5maXJlX3NwZWNfd2F0Y2hl
cyAoVHJhbnNhY3Rpb24uZ2V0X3Jvb3QgdCkgY29ucyBTdG9yZS5QYXRoLmludHJvZHVjZV9kb21h
aW47DQo+IG5kb20NCj4gd2l0aCBfIC0+IHJhaXNlIEludmFsaWRfQ21kX0FyZ3MNCj4gaW4NCj4g
LSBpZiAoRG9tYWluLmdldF9yZW1vdGVfcG9ydCBkb20pIDw+IHBvcnQgfHwgKERvbWFpbi5nZXRf
bWZuIGRvbSkgPD4gbWZuIHRoZW4NCj4gKyBpZiAoRG9tYWluLmdldF9yZW1vdGVfcG9ydCBkb20p
IDw+IHJlbW90ZV9wb3J0IHx8IChEb21haW4uZ2V0X21mbiBkb20pIDw+IG1mbiB0aGVuDQo+IHJh
aXNlIERvbWFpbl9ub3RfbWF0Y2gNCj4gDQo+IGxldCBkb19yZWxlYXNlIGNvbiB0IGRvbWFpbnMg
Y29ucyBkYXRhID0NCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC94ZW5zdG9y
ZWQubWwgYi90b29scy9vY2FtbC94ZW5zdG9yZWQveGVuc3RvcmVkLm1sDQo+IGluZGV4IDU1MDcx
YjQ5ZWNjYi4uMWYxMWY1NzZiNTE1IDEwMDY0NA0KPiAtLS0gYS90b29scy9vY2FtbC94ZW5zdG9y
ZWQveGVuc3RvcmVkLm1sDQo+ICsrKyBiL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC94ZW5zdG9yZWQu
bWwNCj4gQEAgLTE2NywxMCArMTY3LDEwIEBAIGxldCBmcm9tX2NoYW5uZWxfZiBjaGFuIGdsb2Jh
bF9mIHNvY2tldF9mIGRvbWFpbl9mIHdhdGNoX2Ygc3RvcmVfZiA9DQo+IGdsb2JhbF9mIH5ydw0K
PiB8ICJzb2NrZXQiIDo6IGZkIDo6IFtdIC0+DQo+IHNvY2tldF9mIH5mZDooaW50X29mX3N0cmlu
ZyBmZCkNCj4gLSB8ICJkb20iIDo6IGRvbWlkIDo6IG1mbiA6OiBwb3J0IDo6IFtdLT4NCj4gKyB8
ICJkb20iIDo6IGRvbWlkIDo6IG1mbiA6OiByZW1vdGVfcG9ydCA6OiBbXS0+DQo+IGRvbWFpbl9m
IChpbnRfb2Zfc3RyaW5nIGRvbWlkKQ0KPiAgICAgICAgIChOYXRpdmVpbnQub2Zfc3RyaW5nIG1m
bikNCj4gLSAgICAgICAgIChpbnRfb2Zfc3RyaW5nIHBvcnQpDQo+ICsgICAgICAgICAoaW50X29m
X3N0cmluZyByZW1vdGVfcG9ydCkNCj4gfCAid2F0Y2giIDo6IGRvbWlkIDo6IHBhdGggOjogdG9r
ZW4gOjogW10gLT4NCj4gd2F0Y2hfZiAoaW50X29mX3N0cmluZyBkb21pZCkNCj4gICAgICAgICh1
bmhleGlmeSBwYXRoKSAodW5oZXhpZnkgdG9rZW4pDQo+IEBAIC0yMDksMTAgKzIwOSwxMCBAQCBs
ZXQgZnJvbV9jaGFubmVsIHN0b3JlIGNvbnMgZG9tcyBjaGFuID0NCj4gZWxzZQ0KPiB3YXJuICJJ
Z25vcmluZyBpbnZhbGlkIHNvY2tldCBGRCAlZCIgZmQNCj4gaW4NCj4gLSBsZXQgZG9tYWluX2Yg
ZG9taWQgbWZuIHBvcnQgPQ0KPiArIGxldCBkb21haW5fZiBkb21pZCBtZm4gcmVtb3RlX3BvcnQg
PQ0KPiBsZXQgbmRvbSA9DQo+IGlmIGRvbWlkID4gMCB0aGVuDQo+IC0gRG9tYWlucy5jcmVhdGUg
ZG9tcyBkb21pZCBtZm4gcG9ydA0KPiArIERvbWFpbnMuY3JlYXRlIGRvbXMgZG9taWQgbWZuIHJl
bW90ZV9wb3J0DQo+IGVsc2UNCj4gRG9tYWlucy5jcmVhdGUwIGRvbXMNCj4gaW4NCj4gLS0gDQo+
IDIuMTEuMA0KPiANCg0K

