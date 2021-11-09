Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DC944AFCD
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 15:56:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223986.386997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkSXu-0007xK-7m; Tue, 09 Nov 2021 14:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223986.386997; Tue, 09 Nov 2021 14:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkSXu-0007uV-3k; Tue, 09 Nov 2021 14:56:22 +0000
Received: by outflank-mailman (input) for mailman id 223986;
 Tue, 09 Nov 2021 14:56:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azzv=P4=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mkSXs-0007Mb-8p
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 14:56:20 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3098dc28-416d-11ec-9787-a32c541c8605;
 Tue, 09 Nov 2021 15:56:18 +0100 (CET)
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
X-Inumbo-ID: 3098dc28-416d-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636469778;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=CuloeN+BGc9aIc2GS2Q7YtZowHm/cJyMusVDrYtC7XM=;
  b=KyWHIhqfSkUVV3LmRriSJ+5CDWgIdqpAcv36KsTerFxU4dUJnecce7M0
   zUgs46zzm3izuHJ9a8AGvYsqqxMLbOTTP7EL2cknR+U1/ZFIPzIHXrfJG
   MHIcMypCUvVwZTOpDXPgK42tnLI+KZs1J/xDCUIPCkaU2iD98S4xFns28
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wWpyQVk1/zD3UvXHtmKpYZaGOHLilZJdGuFgdySBEaUgYl2D6WnGuKeeT0u1Z9VO5SkZcguRAy
 jgsNRoguXGFUfOHJqGSv+G1GebzmM+EgTK85OEtsh3Ny9vQIePt62BRkZklv16etv405M3s7Mu
 e3ED9qNiPYHmt4A9qmmUJ153b1l1IN6tPTvAOI7iZkRE7ZmYBQ8uPBgLmgW8iYGXYpq9KKAXax
 E7sbkOtkIHO9WSDkYe6YWw2/+LFjNYODe7fNSGdC0x/y79dYWuhlNj55FRgBKFTL8IZzFLudPw
 VOL/6lVOtheDN3R2itouut1M
X-SBRS: 5.1
X-MesageID: 56939809
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:PRPiL6+kHJ2Wlad85Se6DrUDwniTJUtcMsCJ2f8bNWPcYEJGY0x3z
 TYaXjzTb6neNDb9eI0kaI/g8UpVuMSEytFiTAtlrCo8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrdh09Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhsl
 PRQjru6UD4oO4/BmPYgcgVJEh5haPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFgmZr15AWTJ4yY
 eI7YDtIPSXeOCZlJ0osMoAVxNmKv3XgJmgwRFW9+vNsvjm7IBZK+LjqNtXEat2DbcxQl1Sfo
 CTN+GGRKg4eHMySz3yC6H3Eru7QnwvrVYQKDrq6+/V2xlqJyQQ7CQYfVFi6p7y1j0+iQcN3O
 kUS9ic+67IvnGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZjxcbN0rsucmSDps0
 UWG9/vyHiBmurCRTXOb95+XoCm0NCxTKnUNDQcGRwYY59jooKkokwnCCN1kFcaIYsbdQG+qh
 WrQ9W5n2utV3ZVjO7iHEU7vnm6Nu6PuRBcM5wD1U2K30yJldY+aeNn9gbTE1spoIIGcR1iHm
 XELncmC8ewDZa2weDyxrPYlR+/wuavcWNHIqRs2RsR6qWzxk5K2VdkIuGkWGat/DioTldYFi
 mf3sBgZ2pJcNWDCgURfM9PoUJRCIUQN+L3YuhHogjhmPscZmOyvpngGiausM4bFyhVEfUYXY
 8bzTCpUJSxGYZmLNRLvLwvn7Zclxzol2UTYTo3hwhKs3NK2PSDOF+xUbgrVNb5jtctoRTk5F
 f4FaqNmLD0FAYXDjtT/q9ZPfTjm01BiXfgaVPC7hsbce1E7SQnN+tfawK87epwNokimvrygw
 51JYWcBkACXrSSecW2iMyk/AJuyDccXhS9qZkQEYAf3s0XPlK7ytc/zgbNsJuJ5nAGipNYpJ
 8Q4lzKoXq4SF2+ZomtFNvEQbuVKLXyWuO5HBAL8CBAXdJ98XQ3ZvNjiewrk7i4VCSSr88A5p
 tWdOsnzGMNrq91KAJmEZfSx4Um2uHRByut+U1GReotYeVn28ZgsICv016dlL8YJIBTF5z2by
 wfJXktI+biT+9c4oIvTmKSJj4a1CO8iTEBUKHbWsOStPi7A82v9nYIZCLSUfSrQXX/f8bm5Y
 bkH1On1NfAKxQ4Ys4d1H7tx47g54t/j++1Twgh+RS2ZZFW3ELJwZHKB2JAX5KFKw7ZYvyqwW
 16OpYYGaenYZpu9HQdIdgQ/b+mF2fUFoRXo7Kw4cBfg+St63LubSkEObROCvzNQceluO4Q/z
 OZ/5MNPs16jigAnO8qthzxP8zjeNWQJVqgqu81IAILvjQZ3mFhObYaFV33z6ZCLLd5NLlMrM
 nmfg6+b3+ZQwU/LcnwSE3nR3LUC2cRS6U4SlFJSdU6Untflh+Ms2EwD+Ds6eQ1Z0xFb3r8hI
 WNsLUB0ef2D8joAaBKvhIxw99Wt3CGkx3E=
IronPort-HdrOrdr: A9a23:hvJ0mqNm/Fyd+sBcTyX155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080lKQFmrX5WI3NYOCIghrLEGgP1/qG/9SkIVyCygc/79
 YfT0EdMqyIMbESt6+Ti2PZYrVQseVvsprY/ds2p00dMj2CAJsQiTuRZDzrdnGfE2J9dOYE/d
 enl4F6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr1ojegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKve/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdZ11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtRqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW3HAbgcYa
 lT5fznlbVrmQvwVQGagoAv+q3hYp0LJGbGfqBY0fbllgS/nxhCvjwlLYIk7zM9HakGOup5Dt
 L/Q9BVfYF1P78rhJ1GdZU8qOuMeyXwqEH3QSqvyWqOLtBzB5uKke+x3IkI
X-IronPort-AV: E=Sophos;i="5.87,220,1631592000"; 
   d="scan'208";a="56939809"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQq+Biw/vMX1SgW4V3SXEjbSY3KSts+ahBPBbkZLP6gEHIS503nr3766S+QEua545DgvC+3Px7Y254+kfO8AnDJTyDT3brJ/wl4gQgWvjUmugamdwiLhwIrjTv0M5BTOoz1uqPH2m3TrkqktI42uoIA9erDSLBHrVdL2CLYLpWYDquOpkMzOM8KqYx4LET4VNUfcLMhAGXitaTyVwvR9jn/BEZm5PuKeVmW+uI7VSj5RObn0v/2SigeRr9f6feaBfmvG6/JxXRRvXZqjHguI0SeGtd9+njIrCJHPEszmEOabGuSe4sfGpeTQmzc4Lm5Ztq6ZTLN2idjc7gR4dbgmLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ben75gENOsRDhFh1tv9hbc39jcxUKBgNIdQJ2Ajz1hE=;
 b=MH2d5Q136KN+9qbVCePPenypJuwnABW60yzZrGY11dWDXGE0MaJTsZKZcHiFIDy8jC3XGWfEjRjRtjxIYrhiDMUBePzNNAwuW7YxfWv+qWnJK3JwWbWJteN2BR6gCIkLIP3CgaKvkqdFDiUshDUBraFt5N2VSp4ajJr3GsgJWky1wqs44KMlnW67r3f+L21rFI5u5vQcjYqFHEm2PDrZlJqgTsChMcpAvnZEbiZVUqZ92JKxFFe9+eGcdw7yPnoA95y7d0WOVcnmt9jiod5UkzyzRhY4C67yKUOoVLm1pa3FCEunx3JsyAHVpIW89r8SxiEaLCo2NkcdZPconL8rlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ben75gENOsRDhFh1tv9hbc39jcxUKBgNIdQJ2Ajz1hE=;
 b=LFMGb9A6yrTaMtm4cTAWA61wog3sg55APThYBsHsHZTzNtjCRu+aJT/PdvHSQk0SFB3Umtuy3DFJU9GwnBm67ke/bk8pT75T2a3XoEvX4kmZtTS5vw0EKLAI4EivhZ2GXAncKBo7ZykXmNDOJ23s2Vhsw7mL7F5vt/69iSg5Drc=
Date: Tue, 9 Nov 2021 15:55:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Hongyan Xia <hongyxia@amazon.com>, Dmitry Isaikin
	<isaikin-dmitry@yandex.ru>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH for-4.16] Revert "domctl: improve locking during domain
 destruction"
Message-ID: <YYqL9nViQiDw9C30@Air-de-Roger>
References: <20211109143128.56089-1-roger.pau@citrix.com>
 <a708312d-ab1b-4784-b1fe-01dbb680e7e9@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a708312d-ab1b-4784-b1fe-01dbb680e7e9@xen.org>
X-ClientProxiedBy: MR2P264CA0095.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbb9a363-397a-49dc-30bf-08d9a39107de
X-MS-TrafficTypeDiagnostic: DM6PR03MB3835:
X-Microsoft-Antispam-PRVS: <DM6PR03MB3835F6E6D7E340DDB593DF098F929@DM6PR03MB3835.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KE+3m5DYEVabrNhvpsGeSwztCvVXl4Zkl79I9ki00euy/Wjt96Bu5MpV7uZvnvwgQp9dBCrd9rjVVdk79JQXPV/hVbS3c5O0Yh1Uw4nQiPFkNFHoWta+lbUxpR90e22/PxER9Pculi+JJxGNXIbT+J43iPxLCwp9lX/SAVvedN4HQyTw44BCbq5vc1sBFNJ0OEsbx7/QN0164u50fLpGMlula+mgRtI6VCAwo3t4qEc6X5JfmSgHJKOPbki/uTycylwCXEpSwEkRj9SdnQfDUPXL69xfvpMi/rMw+dCx1HLRwhvjjYaGp9Ruq3DK+P2rfpcxhVlPTBOwFR0n0XexsIs96fWoOOQuTtEcTm6wKkFKB+EEOLdUxgg4NSLNT+kJZqIPLrJmGNPdJl1WpbXaj9rUyHou7bqo2zcEZ3OBw4LoVTi+qaioipJ02m0yuMrpCqL/eWuQsaFomSQDOPx6LoTVYV6I66OhGP+BoVIGmkzJN3+2OIzUolJwM2zyUH2El5/TanZp+hmZ0j4h+GlCd4y0cD8doziEUv5QVBuEwRs+86V097ncJLbQQDJoaQApR0I4UMBlmEnAl9bdpL6Sm4tlBJc2QBqb+cArA2oJxT7QjLuIvVm6y7ESWO3eiMYbNAG48tAhCD82b9+V3Mjn4tXPHMYVlBiqSFG5lMfzKqXkNEHbUXjL9ZeWn9sJSl/o6m3gPqnwdJgTeSHJpQvrW/ApVnRcvZoZLJhyM3B28x0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(2906002)(66476007)(956004)(53546011)(4326008)(66946007)(82960400001)(966005)(508600001)(33716001)(6496006)(6486002)(5660300002)(8676002)(66556008)(26005)(6666004)(83380400001)(6916009)(316002)(186003)(54906003)(86362001)(9686003)(8936002)(38100700002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzUwNUE5UkxJZTNLRTZIWG01OTFhM0xRU3QrWlRXbHBEYUU0aVBJaDROK2Jw?=
 =?utf-8?B?K0tDVDdaWmM4OHRkbDR5UVZPMDVxTkRLT1lFV0lZeU9CeFRWYm90YWZYT1V4?=
 =?utf-8?B?OWlRc1hweXFFV1U2M0VPZ3k3MnpEcGkvYUxNcW02dnkvdGNyTHdjcGtxRDl5?=
 =?utf-8?B?c3graVZMR0h4eGZmY0dNOE8va1oyOVg2dzhYY3pva2NhcGFtSnl4Z0xnejdJ?=
 =?utf-8?B?VTVuOGxxQU8ramdNL2p5YkxzVEplekF2WnNoQ1ZTNFVjTmlRaVQ3cVo3Wmwr?=
 =?utf-8?B?M2hick5zTTNDSk54bmRzZkxrWHp3bmZwOEI1UHNIcGtIZHpqVU9jVXRNVE5p?=
 =?utf-8?B?NElPRmRaTWtzV3dydDF0SlFwajVHMWNRdUdRNyt6emp1UWdaQ0RaWG1jN094?=
 =?utf-8?B?VjBZWnUzcVJMZkFLUCtxOThnalp6RjJqdXVRbVpwUTU2K2Y4bmhobEFhVzRE?=
 =?utf-8?B?ZmVRYkxEU3RFUXJZTitLazNjT200N24yeUo1OHJ6WDRzZm9FN3lickExa1ph?=
 =?utf-8?B?cktBajVWVWdaZ2lWN2VhMGJRMTg0YU1JKzVqWEZlbEh1V2JxeGxKUmQxS2tK?=
 =?utf-8?B?OTlkaVRyNGc2Z1B6eG9GcHg0Vzdqd3dBVFZGaVF3QUNEZSt1L1Y4U1lDck5s?=
 =?utf-8?B?Wkc0dkhzVm5ubHFqWVNDWVlPVlkvRVFZOUxLWnZVbTN0MGdRZWZGd2ZtU1lV?=
 =?utf-8?B?WWZpZFFhMzEwUkFnbWUxRXUxcFJaWHQ0anIwNGc5YzVtdHFMV0lNWW03NDAw?=
 =?utf-8?B?b3VBMjFPbnMvK0lKZ28waEFCOFQxUGlmT0RkL2l6cFZxSEs2V2VURVByN0Fk?=
 =?utf-8?B?bGdxbFFpUm83WVJldXJFNUpyc3pVMFVORlVscFF3RGMvWDhHQlRqdEM3N3VI?=
 =?utf-8?B?bks0NUQzN1BXWkxiNlpqUFBIalplYVFNRVA1WUtMR1VoSVNoTlZBNzg1NFFR?=
 =?utf-8?B?N3BqZ2JxU1Yxc2U5WERsWGZvK0RIdUlEZyt2dGhiWVNlQ1BXWWxjNHF2WWo0?=
 =?utf-8?B?bVJzZ2MzR1dGTUUxd0R1S256cXRsOUNxdzNMazJDWms3SE9qTVg4bUtzem1r?=
 =?utf-8?B?eFhaKzMvNStoWk8ySitvd252aEw3b3I5Rm5CaXFvU0ZnTDhKc0pmWllPTXl0?=
 =?utf-8?B?VmxDUEFoMCs3TkExTHdPa3ZBVUNCV1VHKzZHeVE0ZmRFT2Y5L2hlTmEzbmZN?=
 =?utf-8?B?RU1MOUJnek0wVGF4aUVwTWg5cHVTWUJuckRLcGp0K3RQdzRzZXlvV0pyK1Z4?=
 =?utf-8?B?dm93Nks2K1VkSms4MDlKQ1RxRENVQVZTV2Z1SnJZbmVGSlAzTDlQSmlLNndM?=
 =?utf-8?B?VVlLRW1SWUIveWM3cmxSZzVNenJIZkhwdm56K3RkdVVtWnkwOStXUWR6NUZn?=
 =?utf-8?B?c3h3c3FhaHRrTER6YS8vRjlVTEpnWWdkdkpSRkhUK2hoNEJTWXh1blErcXVX?=
 =?utf-8?B?Mk5zamRWRHlRZXlCRXRWRHRWM1ZIZ051VmhRT0VKYTBTQW1ibitvWk1kZFAx?=
 =?utf-8?B?eUdUb0FLaGppNFhrWXIzdlljOVpsM0xqd2hLTG5TZ0VHVEtBSWZEWnJIV2di?=
 =?utf-8?B?L2pHdFZsaUpFU3k2Y0drdXlxRUw4dFJNYzd4eUJQRnVtNUZmM1UrWlE3RkRO?=
 =?utf-8?B?c21MMGlyZWhuVmRFZHZENzJYdVBUSVp3S2JpTnBOUkhCcGNRNUltU0dJb2Nr?=
 =?utf-8?B?OTlIRENOazQ4TUl4aTVQWUNmVy90L054R1JvU0RxV0RGUDFUdEc2bG81NlZY?=
 =?utf-8?B?N0s0Zi96akVpTlpyd1ptVThrRnpCRm9POXFCMjh2VkpWK051cnRkMWlYNEN5?=
 =?utf-8?B?cXM5V3g1cUVqMWhmL1ZqRHU5cmxyaDU0NGRnbnZMaEh3VERqYjh3UzkvbllG?=
 =?utf-8?B?WSt2c0E1QVRSelpLVnlQdUYzaEFZcE1uM28rNXhRRmx4OUtLdHdzL2FHdGE0?=
 =?utf-8?B?eGF6RmNlTk9hejhhYUhaa1pRV2g5L05sNXFRZUV1WkJzN0RWV0hyVitKMnRj?=
 =?utf-8?B?L1l0c0NPSlN2MUVmRm1jMmtWbkVOYWMySEYzVEZJdTBSTmY1dGJBeURtQ3k2?=
 =?utf-8?B?a1FkWlMyQjJzaEs2SU52S0hIbEdORkdkdVR6S013d3FwTkI1MjF3dENldXg2?=
 =?utf-8?B?K1lzZFRaWVgxemVKZ2tTRkV6WWg2U05lTEwvemV2dWszZzdmbnJqWkh5M2lv?=
 =?utf-8?Q?lHOOpUjaQToBJPfmMNl5yAk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbb9a363-397a-49dc-30bf-08d9a39107de
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 14:55:54.9234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RImYfZh19ESarjA1XmTmDmZaJC4WHcxhDvFHS1foh+EDcN3cRBOLEPjCu3lE6fPnQQuyDArMb2Tsj6K04W/z7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3835
X-OriginatorOrg: citrix.com

On Tue, Nov 09, 2021 at 02:42:58PM +0000, Julien Grall wrote:
> Hi Roger,
> 
> On 09/11/2021 14:31, Roger Pau Monne wrote:
> > This reverts commit 228ab9992ffb1d8f9d2475f2581e68b2913acb88.
> > 
> > Performance analysis has shown that dropping the domctl lock during
> > domain destruction greatly increases the contention in the heap_lock,
> > thus making parallel destruction of domains slower.
> > 
> > The following lockperf data shows the difference between the current
> > code and the reverted one:
> > 
> > lock:  3342357(2.268295505s), block:  3263853(18.556650797s)
> > lock:  2788704(0.362311723s), block:   222681( 0.091152276s)
> 
> Thanks for the numbers, this is already an improvement from the reverted.
> 
> Can you also please provide some details on the setup that was used to get
> the number? (e.g. how many guests, amount of memory...).

Those are from Dmitry, and are gathered after destroying 5 guests in
parallel. Given his previous emails he seems to use 2GB HVM guests for
other tests, so I would assume that's the case for the lock profile data
also (albeit it's not said explicitly):

https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg01515.html

I'm not sure it's worth adding this explicitly, as it's not a very
complex test case. Probably any attempts to destroy a minimal amount
of guests in parallel (5?) will already show the lock contention in
the profiling.

Thanks, Roger.

