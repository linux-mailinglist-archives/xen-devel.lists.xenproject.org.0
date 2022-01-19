Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD6D493B30
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 14:38:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258859.446295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAB9x-0006LW-Ox; Wed, 19 Jan 2022 13:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258859.446295; Wed, 19 Jan 2022 13:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAB9x-0006JU-Kl; Wed, 19 Jan 2022 13:37:57 +0000
Received: by outflank-mailman (input) for mailman id 258859;
 Wed, 19 Jan 2022 13:37:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SXRn=SD=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nAB9v-0006JO-OZ
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 13:37:55 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff95da0c-792c-11ec-9bbc-9dff3e4ee8c5;
 Wed, 19 Jan 2022 14:37:53 +0100 (CET)
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
X-Inumbo-ID: ff95da0c-792c-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642599473;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=rjRAUCzAwfgCFilrGVUPim9q7mEmJmDSoxX0MKWWWXU=;
  b=d2rWwQq+nZVWbBu20GDu9yzF6lMoFGzS/EGSu8CnHgIlo+Sayd/QmlqH
   ZLNLF2yxDwall1+jJ1wFnA0cKAQ0+QKrwlTZ3vcQqpX4SoOdN9RGkjzjN
   yI/EP+aht/Q31QytRCIHHz4vPbUlqK8CPl9qqdtmQ9SXKn0xP5Q69jXx0
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: fOSgpSQUrrUNMTxkLBvEvsj30pIXKiO/q8x/uD29g7OcfS5bRGk5qWF+iB9DLNie6UXPFA5Bcx
 NRWHG2NhvCpihuJrosJ51BYY7QVzjJdP8ZmcltOArTb/zIRaLp4MtyOxX7/9Hf7LowbdpOUUpz
 SEMtdMqTf3nu9ipz2H1luC5hQ8oHRw2DcQsJsH6Jw5JANaSAlIO1F/ukwt1Nnf3D7mjfThwKBV
 tCG3kmSyedYUJbUSVNBUmT9K+Y7qXgtbumfrNpyoZNGIZEqYtYuXpTxMLSLrGILBU+AO59gQ6e
 tuVqIMHh+LcUzQ/cVGdZBVth
X-SBRS: 5.2
X-MesageID: 62227437
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LZaHXK0fcpZkHgjJ+vbD5SR2kn2cJEfYwER7XKvMYLTBsI5bpzIGm
 zQcWTrVP/fbZmf9e40lYY+/oE8PsJWGndAxQFdqpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o6wr9h2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhgv5Ai
 95t76aMZzh3A7PqsdUZQR1CHHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6Diu4UChmhs3Z8m8fD2O
 JcBZmphdQn5cTJ+P3EGDpkHx/jviSyqG9FfgA3M/vdmi4TJ9yRu1JD9PdyTfcaFLe1XkVyfv
 Xnu5HniD1cRM9n34TOA+SPyrvTVli29Xo8OfJWo+/gvjFCNy2g7DBwNSUD9sfS/klS5Wd9UN
 woT4CVGkEQp3BX1FJ+nBUT++SPa+E5HMzZNLwEkwByj++nfw1yjOkY7EANfTvUXsN0yXzN/g
 zdlgOjVLTBotbSUT1eU+bGVsS6+NEApEIMSWcMXZVBbuoe++enfmjqKF48+S/Dt0rUZDBmpm
 2jSxBXSkYn/miLiO0+T2VncywyhqZHSJuLezlWGBzn1hu+ViWPMWmBJ1bQ5xaoRRGp6ZgPY1
 JThpyR4xLpeZX1qvHbcKNjh5Jnzu5643MT02DaD5aUJ+TW34GKEdotN+jx4L0oBGp9aJWW0O
 xaP41wPvsY70J6WgUlfOdLZ5yMCl/mIKDgYfqqMMoomjmZZKWdrAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMJrpIf8P8dZCfM9EieVD7nlnnQv7HMmnpzz6j+b2TCPLGN8tbQvfBshkvfjsiFiEr
 L5i2z6ilk83vBvWOHeHqOb+7DkicBAGOHwBg5cGKb7YfFs3QTFJ5j246epJRrGJVp99z4/g1
 nq8RlVZ2Bz4g3jGIh+NcXdtdPXkWpMXkJ7xFXVE0Y+A1ydxbICxwr0YcpdrL7Ar+PY6lax/T
 uUfetXGCfNKE2yV9zMYZJj7jYpjaBX02l7eY3v7OGAyL8x6WgjE2t74ZQ+zpiMAOTW66Jklq
 Lq62wKFHZdaH1Z+DNzbYe6Exk+quSRPg/p7WkbFe4EBeEjl/IVwBTb2i/s7f5MFJRnZn2PI3
 AeKGxYI4+LKptZtotXOgKmFqaavEvd/QRUGTzWKs+7uOHCDrGS5wIJGXOKZRhznVTv5qPe4e
 OFY7/DgK/lbzlxEhJVxTuRwxqUk6tqx+7IDllZ4HG/GZkiAA697JiXUxtFGs6BAy+MLuQayX
 U7TqNBWNa/QZZHgGV8VYgEkcv6CxbcfnTyLtaY5J0Dz5SlW+rubUBoNY0nQ2XIFdLYlYpk4x
 eoBudIN713tgxUnBd+KkyRI+jneNXcHSagm6skXDYKDZtDHEb2ejUgw0hPL3aw=
IronPort-HdrOrdr: A9a23:lScdm6yf9gVrccpnjbSpKrPwKL1zdoMgy1knxilNoHtuA6ulfq
 GV7ZAmPHrP4wr5N0tNpTntAsa9qBDnlaKdg7N+AV7KZmCP0gaVxepZjLfK8nnNHDD/6/4Y9Y
 oISdkaNDQoNykYsS8t2njbL+od
X-IronPort-AV: E=Sophos;i="5.88,299,1635220800"; 
   d="scan'208";a="62227437"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFAPAfYl5tDcsO5s1w/HgWUy0/+qtSsfLmK45kD6XZivJ6BpR6LLXZ7qz8nZFJ+So0g015qKxKjzVcihyZWjjbH+R23I1kuexeH/IOAhymr/E8h+0H4IfW4vexRpk6u5ccVso/+oK8/vbkRonsHX+E8ZL60odn7ep1sGC4NmRy/zCE48TkxHFF2NaUwrLJXoSypoWjtbM5o338u3SRXR3YDrQZOktjtUf1y6A5Gg6EWYO62DRX6MsmGGNE6xuV383JKL8e0syc/xQ0CvcWSU0y9kl8QbMlICBRl3vdFOxn/SZdV/mPHXVpEgS1HgqUAwMR4HEejgG5ZZ1DANQjM5vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRYcuvoEpQZ1z62aG4uQGDfsmnSdz9orQ1fFOYkXY3I=;
 b=VgQMW2Bgb3lVPnMFR6AuNQVIhLFjwvlTNiZpNrmXtiXWWFh1JSqCPJ5uabCrSxWzrntU4zHfDvfzXXaZJ9YcrQ97ZuDD1s8zko6HOWZT3z5uzSUcSz9BZsF5jBVCzddmVcqSFH5GDdiVimQHZgUg+P9v6vBmJbBAmlIkEOLI2v+fgENZvLIGuiYwc4QhNzMekgLXvURmN1K6AHRNxrmdysfWua8bKMg3n4m/rce+yBq0eM7EfBmou7Nei+8dc3pSLq8rbnoMV8WyichX/6CIVnPP4b3jtWs8T313GX0gKnJf/qeEhUn8Pad3cMNfdiuFuQK8CSIwcsaIgS9N21+8WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRYcuvoEpQZ1z62aG4uQGDfsmnSdz9orQ1fFOYkXY3I=;
 b=T2PSROneYLD7v0XGVLsc0OWU27tfdlDamjf1E/zF9+Gud7gGjMtBYqR9wyDKV+m7iG3FM+LPTnRpRufX4VqWc0nhc2qyy/AGuYTBWanx8UBH9mPv7wrvCgy/QLfcBgSZZmjWmRKh6g8H4pAgBJEPC+GkSlXCbOXoegQ0SE75lnk=
Date: Wed, 19 Jan 2022 14:37:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <amc96@srcf.net>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v6 10/12] libs/{light,guest}: implement
 xc_cpuid_apply_policy in libxl
Message-ID: <YegUIsHs2dUQTKKi@Air-de-Roger>
References: <20220117094827.16756-1-roger.pau@citrix.com>
 <20220117094827.16756-11-roger.pau@citrix.com>
 <71b5f77b-acf5-fbeb-b442-9d6207dd3131@srcf.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <71b5f77b-acf5-fbeb-b442-9d6207dd3131@srcf.net>
X-ClientProxiedBy: MR2P264CA0039.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::27)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55292476-23fb-4075-729c-08d9db50dfcf
X-MS-TrafficTypeDiagnostic: CY4PR03MB2904:EE_
X-Microsoft-Antispam-PRVS: <CY4PR03MB2904D83DC944B60A50F233E98F599@CY4PR03MB2904.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GY8GXfdfG6h58WJdIjdxyEe+qFxxB41u2rKHN52IkwTHFfSSHIu1Y+Qp3t7N7h1Qgxu8SJzf9kgDlRoLeIrAFQMfR9HC9KOx71DCJkRqf6YxSVRmQVodWKAvtSfysglqVhEuU+33Tt62jL0BbZpWAFKJ5wf/ZWiwERshB7wxhtpYpvrkc3xLuyfTCPvrtiq7vOtYwmA0/IIMXeMYCelapcC202ft3LcaCwZhqQ1i0nIXqZwbFk4+agvRFXgGYonH5zhCHrgcYNxVuj2lnEcroYQvYi8WKfweslVAdVs6QW4vKxfpRDtceOoWIfAUOr2J86+rPaSKVJJaOwlNjXnp+YrqDzURqw7TxmkmHlfZPn2i/SVfLRYJpCKr0npbjPea9Dnbe/0/3UwUE5ItKXNccO/1f630QC7axO5637OjlSfQowc0+vImUF202Qc6YQx6qQ6jCIol/xtC11C0jFqymb9TD5j42q8m9+NjIwRshYtlJX8qT+OIwTKemMAiixe+ghp5Dk9CHWXy8wNYZyevW+W3tA/wrU5x6u2v0k2D1V0MqJcR9+Dn1L1Tmd/4VyrA77du60bsWRPZJUKFkwP8tm/lpuLapRAtps+rDLIFB8aii+cIND8nqeXI6uLx5Jg/1ulMBvfrM9/WuodMOYV9OQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(316002)(6506007)(186003)(66476007)(5660300002)(53546011)(6916009)(8676002)(6512007)(38100700002)(66556008)(54906003)(86362001)(33716001)(85182001)(508600001)(6486002)(6666004)(8936002)(4326008)(2906002)(9686003)(66946007)(82960400001)(26005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEQvQmttUjBoSGdTWGNDS2t3OVVQZ2VlOEVtd29KY2pvMVNJbFdoQ0l3eXN1?=
 =?utf-8?B?REFiQ3JnditzKy9xT2wrMDV4YTM5MnBZUy9TbVlISGMyMy9ITjQ5R1JKSGIr?=
 =?utf-8?B?WGdTSnhZMWdtaHBUcU9JTk5hZmFHYlRYTzI1eFNxOWlmeXBnTytmSXVONDg0?=
 =?utf-8?B?YWNwT09uS1gyMTV2TGE0cEFkVXM2TmhnMGlTQlErWk5mOUtTQUtmdGE5SXoz?=
 =?utf-8?B?SGEwcVFUbkJmaHJYTVlUcFVzaE5XRmM5L2U0ZU5kb04wcWYzZHkwazBZRTND?=
 =?utf-8?B?ZzBIc0k3S2prRHBIM2p2QnpYc3U1MG1TRnE1bGwvRVdrdlgyTUVWcUQ2MnZZ?=
 =?utf-8?B?ZEJ3V24wM3grampmZnAzeGZkcFpUY2trdTlRZElXMzV3c3JuaU4rL21iSjlF?=
 =?utf-8?B?U1ZYSE5hNHhYNkprR3dFUGhOMWhpam8zbDhtQ2FGT0hnd2I0bTJVb29YMDR0?=
 =?utf-8?B?WUp3RWljcURpQ0JWb1prNHgvVHBxU05pZWNZT0VOdEpDOHNEdmxRUTMyVXlq?=
 =?utf-8?B?ZTdybTJoVk52a1NBM0hCQnYvaGJNK3ZKZ3NQNUErMUxsMmZTSlJ2SkdsTTJH?=
 =?utf-8?B?WXlEekNQZERhOXNTV2pabmFtcFpad0VmTlRPaFZ0a01IZFlFclZyaERoZHZz?=
 =?utf-8?B?WWU1VVVnNWxkTnpBMVF0SE5jME9LZTgxU3piOW1DRzdCSGV4RnIwamNMV3FF?=
 =?utf-8?B?dVhrVVNJdFVKeHVyRHRadzlidVJValJ0MitZbGR6OE1sV2NlMyswTFBGYkc3?=
 =?utf-8?B?c1BCK212TUxoeVh6R01vVHF2eVpUS0NXOFlPeXA1S0laY0tKMGRYU0pvZThw?=
 =?utf-8?B?RFJoNU1KcjNwVmMyamdUK0p4djgwaVdCYVNldXBSSWdpdW5vTnFXSEJMRVIv?=
 =?utf-8?B?NVNKbTRVZ0NyYnpyVFV1V3RJUHNMdmsrYU43dzlsell6empXVndOTEhXYmcy?=
 =?utf-8?B?dGJIZ3BJd1hJUkhJUEFUbHZodjBObG94US9TbGE3bkhrT1pGL1UzbUNZbDlC?=
 =?utf-8?B?cjJOc0J1aGJvQ1d4b2lldGgxUVRzTTFadEVpN0lPWWtnT084YUo2WXRwUlFq?=
 =?utf-8?B?RHZtQzJwZ0JDSVRQZzZKSGMrUEtmTjJ4Z1lIR0pzYVZvYVNOMVhoUy9jZWVh?=
 =?utf-8?B?Zk9idnoxOHVwc29XT1dEdU9Da0dCSXZBei9mU3J6OHhuQWo5ZThvdmsyeFM2?=
 =?utf-8?B?QWE4dThGYXdlaldFYW1CZVJkdG8wN2haeGt5YXZaVkNRdnJVR3VXamxpcjFj?=
 =?utf-8?B?UWtDTGU5cmxZQUxpQjRVTXdIMlVYVElwTXlkYWJ6RHQvR3R6eEJCbEhjTmZJ?=
 =?utf-8?B?WmNOYldhK3JMZkpvUHlCeWJsZnZWL0EwSVJ0aDBKV09PaGszWDBnS0lZb2hl?=
 =?utf-8?B?U1J3b1U1eFN4R24zUXd6dkt2TWJQRllsaDVudy80MjNJblkzenhJSDJtVzk5?=
 =?utf-8?B?OGg3dW9WUkxDMHZ2NSsxaVZiODVqbkJ4TE1aalNKcmRLemc2VmFzcmxvMlZB?=
 =?utf-8?B?TmgyNGhDbDVtTGhBaHhRMXlmU2tXUzQxNXp2UVNGY3dBOFNzMWZEVjUvQ0p3?=
 =?utf-8?B?TGxDTkY5WlM0YUw2UG9HZGxVOUs5UGtFWFpxNXN5V2E0a2NQQll5REROdC9p?=
 =?utf-8?B?V0NmdlNZa08xNGp1d0VCRnJlWTlZUHA2WGovejFiemdqRmR5TkFDNnJKNWxK?=
 =?utf-8?B?TFNGak1qZGlOdEJOYjVsSGNyZ0JCeXB5RkNuQU9wdXVxTlJPY3ZXOU4zWXVQ?=
 =?utf-8?B?WGc3bllnZm1reG0wZm5FY3RzUzRYa2ZWNnNjK0dVaXZieXJJbEdKQWVzTEc3?=
 =?utf-8?B?ZGgrSklpVFZHaFZaRWJrMU81YWxOOGt1UEFPY09mRkhSOVNoa3paV2pDUzcr?=
 =?utf-8?B?c0hrRi96VDV0NndRWjJHUUpUc2sxMFd4dTR2Rmg5WFBCRjd2VzQ5eEJhQUdZ?=
 =?utf-8?B?TXZwU254K2U4MDVPQWtRSDJiUFA3bjdlWHhZMis0NGtiS09qRjZqVWpyR0x3?=
 =?utf-8?B?MFZwVTVJVXI4MElPVkJaTXg4OEtvM1RRd0xFOEhzWWl3WlJ0YnIxRkdjNDBj?=
 =?utf-8?B?SFpYWld5cGRzbTgyYWh2Mng4a2hzMHNQUVkrMFBhRlVUazFJdlBwOTZQeGtp?=
 =?utf-8?B?NmZWMHBGcjBhcEhEc1FwMlp3cCtLcmVLV29DVE9rTTZuMDg5MExBd3AvbzNU?=
 =?utf-8?Q?ViLtJDBfGO7jhHscduKdfiM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55292476-23fb-4075-729c-08d9db50dfcf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 13:37:45.0135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tr1FENzlJ2YPPFzfwZ9PuKifoF/BWqfwEKbBb9OUAjrdcZp8nPDnCHJLOjflOvwbRcexipdSCom96ah2m6iXlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2904
X-OriginatorOrg: citrix.com

On Tue, Jan 18, 2022 at 01:37:18PM +0000, Andrew Cooper wrote:
> On 17/01/2022 09:48, Roger Pau Monne wrote:
> > diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
> > index e1acf6648d..7dcdb35a4c 100644
> > --- a/tools/libs/light/libxl_cpuid.c
> > +++ b/tools/libs/light/libxl_cpuid.c
> > @@ -454,6 +456,41 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
> >       */
> >      bool nested_virt = info->nested_hvm.val > 0;
> >  
> > +    policy = xc_cpu_policy_init();
> > +    if (!policy) {
> > +        LOGED(ERROR, domid, "Failed to init CPU policy");
> > +        rc = ERROR_FAIL;
> > +        goto out;
> > +    }
> > +
> > +    r = xc_cpu_policy_get_domain(ctx->xch, domid, policy);
> > +    if (r) {
> > +        LOGED(ERROR, domid, "Failed to fetch domain CPU policy");
> > +        rc = ERROR_FAIL;
> > +        goto out;
> > +    }
> > +
> > +    if (restore) {
> > +        /*
> > +         * Make sure the policy is compatible with pre Xen 4.13. Note that
> > +         * newer Xen versions will pass policy data on the restore stream, so
> > +         * any adjustments done here will be superseded.
> > +         */
> > +        r = xc_cpu_policy_make_compat_4_12(ctx->xch, policy, hvm);
> 
> One hidden host policy acquisition, and ...
> 
> > +        if (r) {
> > +            LOGED(ERROR, domid, "Failed to setup compatible CPU policy");
> > +            rc = ERROR_FAIL;
> > +            goto out;
> > +        }
> > +    }
> > +
> > +    r = xc_cpu_policy_legacy_topology(ctx->xch, policy, hvm);
> 
> ... one host featureset and ... (final comment)
> 
> > +    if (r) {
> > +        LOGED(ERROR, domid, "Failed to setup CPU policy topology");
> > +        rc = ERROR_FAIL;
> > +        goto out;
> > +    }
> > +
> >      /*
> >       * For PV guests, PAE is Xen-controlled (it is the 'p' that differentiates
> >       * the xen-3.0-x86_32 and xen-3.0-x86_32p ABIs).  It is mandatory as Xen
> > @@ -466,6 +503,13 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
> >       */
> >      if (info->type == LIBXL_DOMAIN_TYPE_HVM)
> >          pae = libxl_defbool_val(info->u.hvm.pae);
> > +    rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("pae=%d", pae));
> > +    if (rc) {
> > +        LOGD(ERROR, domid, "Failed to set PAE CPUID flag");
> > +        rc = ERROR_FAIL;
> > +        goto out;
> > +    }
> > +
> >  
> >      /*
> >       * Advertising Invariant TSC to a guest means that the TSC frequency won't
> > @@ -481,14 +525,50 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
> >       */
> >      itsc = (libxl_defbool_val(info->disable_migrate) ||
> >              info->tsc_mode == LIBXL_TSC_MODE_ALWAYS_EMULATE);
> > +    rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("invtsc=%d", itsc));
> > +    if (rc) {
> > +        LOGD(ERROR, domid, "Failed to set Invariant TSC CPUID flag");
> > +        rc = ERROR_FAIL;
> > +        goto out;
> > +    }
> >  
> > -    r = xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
> > -                              pae, itsc, nested_virt, info->cpuid);
> > -    if (r)
> > -        LOGEVD(ERROR, -r, domid, "Failed to apply CPUID policy");
> > +    /* Set Nested virt CPUID bits for HVM. */
> > +    if (hvm) {
> > +        rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("vmx=%d",
> > +                                                              nested_virt));
> > +        if (rc) {
> > +            LOGD(ERROR, domid, "Failed to set VMX CPUID flag");
> > +            rc = ERROR_FAIL;
> > +            goto out;
> > +        }
> > +
> > +        rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("svm=%d",
> > +                                                              nested_virt));
> > +        if (rc) {
> > +            LOGD(ERROR, domid, "Failed to set SVM CPUID flag");
> > +            rc = ERROR_FAIL;
> > +            goto out;
> > +        }
> > +    }
> 
> libxl_cpuid_parse_config() is a large overhead, and cannot suffer errors
> because libxl crashes rather than failing memory allocations.  The
> invasiveness would be reduced substantially by having:
> 
> str = GCSPRINTF("pae=%d,invtsc=%d", pae, itsc);
> if ( hvm )
>     append GCSPRINTF("vmx=%d,svm=%d", nested_virt, nested_virt);
> 
> and a single call to libxl_cpuid_parse_config().
> 
> 
> Depending on how much we care, these need inserting at the head of the
> info->cpuid list so they get processed in the same order as before.
> 
> > +
> > +    /* Apply the bits from info->cpuid if any. */
> 
> 'if any' is stale now.
> 
> > +    r = xc_cpu_policy_apply_cpuid(ctx->xch, policy, info->cpuid, hvm);
> 
> ... and both a host and default policy.
> 
> That is a lot of overhead added behind the scenes.  It would be rather
> better to have this function obtain the host policy and pass it to all 3
> helpers.  Default policy is harder to judge, but it would avoid needing
> to pass an `hvm` boolean down into this helper.

I've fixed all the above, but haven't added a default policy parameter
to xc_cpu_policy_apply_cpuid. Let me know how strongly you feel about
that.

Thanks, Roger.

