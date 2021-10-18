Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D164311CD
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 10:05:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211752.369395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcNdS-0005Pj-Dp; Mon, 18 Oct 2021 08:04:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211752.369395; Mon, 18 Oct 2021 08:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcNdS-0005Mt-AM; Mon, 18 Oct 2021 08:04:42 +0000
Received: by outflank-mailman (input) for mailman id 211752;
 Mon, 18 Oct 2021 08:04:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tpC=PG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mcNdR-0005Mn-Hv
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 08:04:41 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ae3b2c1-2fea-11ec-82ce-12813bfff9fa;
 Mon, 18 Oct 2021 08:04:39 +0000 (UTC)
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
X-Inumbo-ID: 0ae3b2c1-2fea-11ec-82ce-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634544279;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=K4bXTjPPgPko8ofm7jiQJvczyLzruiAT11T3OlpA2zg=;
  b=Znmyh5M/AuwglIwoqmqrLe/t+VUQ0Ar81w72710mvsuIO/Hx2c4h9voG
   xmgXr7L/Cz8a7M5liJ7JIhWNhulH+FnGiOmw7cd/RXU6xpb0be5BOJ8wF
   B587LMUIuy2XbqtAy4YFemNkrZ6Drmj7mGdm/ajZnvlfzlPb+A9r+we/+
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1dyQevWT6WDJAjtQZP2ac+4+kqDQr2HeaiUFzb3+9xDq63nKGXZSfBizK+UlGCHTi9WOSU1VWR
 caQUvk7MNCscokGNyQ2yUwhJyTmUDe/PtQnby7cJxdjSHXx+X8CWsWJSH9C7PyYmLi2E/C58p2
 +YLWvTQ0rkcLS/4HZ7Re2QvHKJqKvJtTx0Rh0Rph0it92wFEKLQrRXNeQ+5uQw5iFh3DC2jVpt
 UGIHmUpZz0TtiwpiLwCqEJmK841uxuNDUP5SpFN0XTCr2Sv8CPN9Og79IAYsnIYfO2PK2V2C1r
 FDRGjUO7tix9MTGz+kvvYC+H
X-SBRS: 5.1
X-MesageID: 55398827
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:JNo7bqNY35FUdi3vrR3TkcFynXyQoLVcMsEvi/4bfWQNrUokhTxVz
 2EaDWqBOP/ZNmCmeYh0atywoEgC657SyNdmTQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6ZUsxNbVU8En540Uszw7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoz6moP18z
 c1wjLubUixqOrH+28gCYSANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/iXvo4IjG1v7ixINfSFT
 I1JNiBMVwjrPgNJI3VLWL0yovj90xETdBUH8QnI9MLb+VP78gt117T8NcvPTfaDT85Vg0Wwq
 3rP+iLyBRRyHN6CzTuI9Fq8i+mJmjn0MKoNEJWo+/gsh0ecrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdwWxvXqsrhMaHd1KHIUS4gyX1rDd5QrfA2EeVyNAc/QvrspwTjsvv
 neLld70AT1ksJWOVGmQsLyTqFuaIyEVMGtEfi4CQgst6sPm5oo0i3rnVc1/GaS4itn0HzDYw
 D2QqiU6wbIJgqYj1rq51UDKhSq2oZrERRJz4R/YNl9J9SsgOtTjPdbxrwGGs7AQd+51U2Vto
 lAPtPez4eUWMKiqvzemA+ERLvKF+MS8ZWi0bUFUI7Et8DGk+niGdI9W4S1jKEoBDvvoaQMFc
 2eI5lsPvM470G+CKPYtOdroWptCIb3ITIy9Dpjpgsxyjo+dneNt1BplYlKMxCjTmUwonLBX1
 XyzIJv0Uyhy5UiKylOLqwYhPV0Dm3hWKYD7H8mTI/GbPVy2Pi/9pVAtawPmUwzBxPnYyDg5C
 v4GXydw9z1RUfflfg7c+pMJIFYBIBATXM6t95AGK7/ZflY8SQnN7sM9J5t7KuSJeIwOzo/1E
 oyVABcEmDITe1WWQel1VpyTQOy2BssuxZ7KFSctIUypyxAejXWHt88im28MVeB/roRLlKcsJ
 9FcIpnoKqkfG1zvpmVGBbGg/dMKSfherV/XV8ZTSGNkJMAIqs2g0oKMQzYDAwFVUnPo6Jdj+
 uD5vu4ZKLJaLzlf4A/tQKvH53u6vGQHmfI0WE3NI9JJf17r/pQsICv05sLb6elXQfka7jfFh
 QuQHzkCouzB/908/NXT3PjWpIa1CepuWEFdGjCDv7qxMCDb+EulwJNBD7nULWyMCjus9fXwf
 /hRwtH9LOYDwARAvb1jHus51qk5/dbu+eNXl1w2AHXRYl23Ibp8OX3aj9JXv6hAy+YB6wu7U
 06C4PdAPrCNNJ+3GVIdPlN9PO+CyesVin/Z6vFseBf24yp+/bymV0ROPkbT1HwBfeUtaI58m
 LUvos8b7QC7myEGCNfeg3AG7XmII1wBT74j6sMQDrj0h1d50VpFe5HdVHP7ucndd9VWP0A2C
 TaIn66e1a9Ez0/PfndvR3jA2e1R2cYHtBxQlQJQIl2InpzOh+Mt3Q0X+jMyF1wHwhJC2uN1G
 25qK0wqevneo2Y23JBODzK2BgVMJByF4UigmVIGmVrQQ1SsSmGQfnY2PvyA/RxB/m9RFtSBE
 Gp0FIoxve7WQfzM
IronPort-HdrOrdr: A9a23:9ygcMqDq9+3IlnHlHemZ55DYdb4zR+YMi2TDgXoBMCC9Afb5qy
 nOppomPHDP5wr5NEtMpTnEAtjjfZq+z/RICOsqTNSftWDd0QOVxcNZnO7fKlbbakvDH5tmpM
 Bdmt9FebnN5DZB4foTv2KDeOrJibO8kZxAL92ut0tQcQ==
X-IronPort-AV: E=Sophos;i="5.85,381,1624334400"; 
   d="scan'208";a="55398827"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ipjy7lTwiboGV1RDAak9wUnT6AhRK/sKSIedEIB6ugIQIR6rLLiCUeLlKYpeIibFSsH1jO+AWK9wzNBaSz8z9WceO5lC9DpirmWF7IMFE0lJotxGSrwfwD+cP8xPnEWiFPEdmMq/xfks6lhxXTH8177903mN8VyWxKevlchF2niZrXuEbS7WAk+Hec5CUL1fdOPnyJwf8lNeLrp5bjyuCbLyD45DMcIbEPrI5hLZEoC5ps44faZaGe1KtF12YKKWTrAp/PDAaiGE0OcvJ0w5UmV76V5buMBvKymPNTRecV5bsEa2LEkgTEtF2hsYTyNVdgStr98dS5D5CY8V3OodfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCGL8SNFNpLLM3D06NxF5xSBXoQ1UwrVW4z556ysmOc=;
 b=dLPtfRVqJwYBZd1Tl2ILdqPR9cg4H2Z87wvnAQS6HeX8422956K08uK1B/8ii63im4dCDwX8kfwW52sSM4ocSYFfO9X0nwUMU8AOwmkIVRbWwlcsVSFefIYI3lUaHs2pGN6wHK7Ur3M9xN4AocH37d+QqVedR6meMH8OP5r1fZAbHN47WrpOZv36U5fPIsgT4RlCstWHR50h6TK2BquoosSxaUxJglZtctuA/9Uz6jKmvpt5WhLUu4OPGs7ZdxyZdmRy6hl1uzDG+/+rShMr+IaZNYmP068GSOJJZXARuw4U2l4VF3Z9KKly18uz4Vf+9rjgqjZDxeQQXCH/xDMKKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCGL8SNFNpLLM3D06NxF5xSBXoQ1UwrVW4z556ysmOc=;
 b=rg4HAoiMm48JI70lb3TbkXfxqK3TghTmDzKUH4egSyXxeKo/+D8PhsSRqNGLxjsy4SpxfwAKBpVKaooU07TQULa07chvuPA8BzRmNo793iDY5f4nG++WEKZYBu2RXPL8G7l/uTSUZPrArxOMNZSFjNd9KC/ZM1zLl4nI6ee17UE=
Date: Mon, 18 Oct 2021 10:03:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, <iwj@xenproject.org>, <sstabellini@kernel.org>,
	"Julien Grall" <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
Message-ID: <YW0qa2CXcnWZNCf7@MacBook-Air-de-Roger.local>
References: <cover.1634315461.git.bertrand.marquis@arm.com>
 <e2b10f56043155e4bb8eae824723045ccc042f8e.1634315461.git.bertrand.marquis@arm.com>
 <ca5558b2-25c6-90d2-284b-03cbbb02691f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ca5558b2-25c6-90d2-284b-03cbbb02691f@suse.com>
X-ClientProxiedBy: LO2P123CA0035.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::23)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e271659-a088-480d-1760-08d9920dd7cc
X-MS-TrafficTypeDiagnostic: DM5PR03MB2779:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2779EE41BA1A849BBE4ED28A8FBC9@DM5PR03MB2779.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SejfcdXNm373AICP0kakrlChVnxYVYmLvwPCMQQCVApUYLXZb5eMZdaq9cGMsHE37Etxkr51XV9/5gOO5lCND/F23U7SSasgaSmjwQ3TPTe9R58Bhbkh4Q720SOkiFeDH9Qso/wSmZImrfMn80s0sDiY0ruUTpfGgDlxyXOrwhqeVcsv94M71HEiRLKucxVMiIatGccjh2q+x5AgXKKOO1xbYS6s/BCIlt1Sis37t8xHUB+M6QE5jgF99gFgT5chye+O+0WfjI3WP9fSn6Emj5lghbNQ4yW2hrRfnF398UV4jY047RrkD641j4PC/Z0xECfjEQaFy6G5dZNlNJ97wLM1SUAj+0EXGMkpMmQxBbD5Qic6IsS2RhSHQI15Oq50bdrzy3eBrs8i6nfgQAZvUQPk84zlYVfQJP2zItaR+Ge8aa33AdG0Kt5RjW25Nr+X713I7rundeOzsaJoMbO82On5OcI8oG4XZs8WCTsPLgDxlIMKnto0grNxCBBN/BZPn68ZVQZZvfxaQ1KBnAWBKR3OPbxEcx1wqeXhFMoeWgiWc5IE341GhRdBNra2GALGZxC4myPevfqh89welOY/V3s4QOOTE4QPoTppotthDXhBk624pujzKNoI7WAO6kfraLOZAku61CDlx7f8cLrC3DkKEXjZS5MLwVWPdQJ87jWRDfilBw8t4jA3A1WgTsRi
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(508600001)(82960400001)(2906002)(8676002)(85182001)(7416002)(6496006)(5660300002)(54906003)(38100700002)(8936002)(6486002)(6666004)(316002)(53546011)(26005)(86362001)(956004)(186003)(66476007)(83380400001)(66946007)(4326008)(9686003)(66556008)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzR2aHgvQjhXNEc3MC85WkUxd3dvS1orclFYb0VGblpsaFQxWTN6YkZMWmI3?=
 =?utf-8?B?Mk9TaCtvMDltWDd6S053TS9BUlE2R1g4c1pXMXdTQ3ZJaklpY0MyOWxWSGdT?=
 =?utf-8?B?QitOMmdXN3c3RWxzTFpiK3hmSTlQeEIyUDJ2Ty81NW5XcVBQakhURm81Uk1n?=
 =?utf-8?B?VmNnTzRDZ3RVUVp4dERiWkVzaTA2TVEvc0d3bWlqVjBaSUFYYnowdTNYQWxt?=
 =?utf-8?B?cWxYZU55dWFKMzNGUUVXc1d2SEpXakoyODZ0RzZHa2ZHLzlwSklrWWxzOWJH?=
 =?utf-8?B?REFaaDRxV2ZtM3B6MFFRTkNNeExOMWFRSmN1N04zZ0VIejJSTmo3eWNUQ3Iw?=
 =?utf-8?B?NW5MSmRrcTdYSSt4TUpPY1RHWjZsWEhiZTlMNWwrYmpFSDJSSDJDOEVKNmw5?=
 =?utf-8?B?OEtRR0IwS3FRTnRHbWdkbjZkOEMzenpNdkFLNElYL3hQYnh3OEgwQ282ME9D?=
 =?utf-8?B?VHNTTndPNnplT1Bsc1U2MDFJNkt4TEcwdklWcW1kSjAyc21JYmJ3alQ1bnpv?=
 =?utf-8?B?dWpMZEJQWWdqMjBYT080RU5BZzJncjFzM2dJSUluY3o3QXU0Z1NKUGFQQkNG?=
 =?utf-8?B?NktuaTduc1dJdjc1UE5PeVNYV3p0U3FOU0JIdEo3UHN6anVSYTlZWStwNkxq?=
 =?utf-8?B?bHlpV0tTTnc4SUlxYm13T250dVgrM3EySWIvcFVnYzJwSjZYUU1KMjJnb2Fx?=
 =?utf-8?B?cExSTXZueVM4TUdrZm1NcGlrWngyWlB3VUJhSjM1T1c3MlpqWVNXU0h1dHZO?=
 =?utf-8?B?SnBDcFU3REI2S1VHWFE1S3p0YVRYc3E1ZXMxYk9JMWhEaUh1YWFiWTNlY0NZ?=
 =?utf-8?B?ZS9nR0QybjNnSno3Rk15ZDRCcnBiSkt2dzJtV3Z4Ny8rdzlNa1IvbTZpZEFP?=
 =?utf-8?B?dHJYVW5sRnJKam85Vk9PbW5FcFFIdHhOSWo3bUJmQmtZeHYrMThjYWU1eWhl?=
 =?utf-8?B?dk1FMG1XVEF3TzkzZHlhT1UvV0tLRGx5RW1aTVNHZzM4MlJod2IyUzk3WXNT?=
 =?utf-8?B?S21VT0dsbS9qa2hNVkNYMTE2VXFqUnVNaVpKM1gvaXVYck5jSFh2T1Z4SnR4?=
 =?utf-8?B?QW16RFVyV0JIemtRamtGaGErc1ZJMjZscDhtWnlldzh2U1p6WmN2V2lPSndp?=
 =?utf-8?B?eGMrSkRuVTRFN3VuamJ3Q1lwNDN1S2QxaFJJbE5XZlRtK1VUWmp6RWRCRC9j?=
 =?utf-8?B?clc2aFdld0xQd0JqUjBHVTVjQmk2Q3E1YnFTbjEzTm1RTzE5RmhWbkZhZ2Jp?=
 =?utf-8?B?cStieGZ5Q1JrL0JBN0N6bzBtb2RGbmtoeHE5OGJQbCs5V20zY3Yvc2dheGtn?=
 =?utf-8?B?L3A3VFhiTGE4OHl4MWFTSEJwRDIyNDdUWVR6SmxCb2VhcXp1Vis3SkR5VDRL?=
 =?utf-8?B?b3c3SjlRQmVZU0ExMTlZVUxsZFpQbDVWQjRybW4rcnEweGJtOFp1WTJpNWw3?=
 =?utf-8?B?SmQzQTNiR1NidWhXOFdTVjNaVUdOczI5ZUlNR2J6R3RSdFpKbkJKWGpQZHRX?=
 =?utf-8?B?UEd4ZjFtdUpiNjZxNytFYW5GUVRwcmVvNmVBa01la3JjWWo5dXR1Sk1DOElu?=
 =?utf-8?B?L1lUeUVTU1kvK1BnZURtaXRFYWprVHVtOW9BNmhid3Z0N3FzQ3ZwZ0xyYTJZ?=
 =?utf-8?B?YUx5OEpVK1NNU2pKQ2QvUytJS0JaQlJEbERjSkZsKzNRWHZXTHcveEdYckYv?=
 =?utf-8?B?bGw3VE1CR21lbnNOQlZrWXlhdVU3T0dEY3VUZVdUYVJkNkFTWFFabGVtcWR0?=
 =?utf-8?Q?mWP/f6DNZGqIEHMHgu7FwZB2QLMlKdcAXHIiSkA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e271659-a088-480d-1760-08d9920dd7cc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 08:04:00.4423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZ91V/uS/a6cPbgnQg/j3Psb+21WU8uN3ZfqxGWvmSu33mlsipDnrLNH7S1PYyLtZpXqJ8ZJmwY7AsGuRrGDqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2779
X-OriginatorOrg: citrix.com

On Mon, Oct 18, 2021 at 09:47:06AM +0200, Jan Beulich wrote:
> On 15.10.2021 18:51, Bertrand Marquis wrote:
> > --- /dev/null
> > +++ b/xen/arch/arm/vpci.c
> > @@ -0,0 +1,77 @@
> > +/*
> > + * xen/arch/arm/vpci.c
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +#include <xen/sched.h>
> > +#include <xen/vpci.h>
> > +
> > +#include <asm/mmio.h>
> > +
> > +static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
> > +                          register_t *r, void *p)
> > +{
> > +    pci_sbdf_t sbdf;
> > +    /* data is needed to prevent a pointer cast on 32bit */
> > +    unsigned long data;
> > +
> > +    /* We ignore segment part and always handle segment 0 */
> > +    sbdf.sbdf = VPCI_ECAM_BDF(info->gpa);
> > +
> > +    if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
> > +                        1U << info->dabt.size, &data) )
> > +    {
> 
> Here it is quite clear that the SBDF you pass into vpci_ecam_read() is
> the virtual one. The function then calls vpci_read(), which in turn
> will call vpci_read_hw() in a number of situations (first and foremost
> whenever pci_get_pdev_by_domain() returns NULL). That function as well
> as pci_get_pdev_by_domain() use the passed in SBDF as if it was a
> physical one; I'm unable to spot any translation. Yet I do recall
> seeing assignment of a virtual device and function number somewhere
> (perhaps another of the related series), so the model also doesn't
> look to assume 1:1 mapping of SBDF.
> 
> > --- a/xen/drivers/passthrough/pci.c
> > +++ b/xen/drivers/passthrough/pci.c
> > @@ -756,6 +756,19 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
> >      if ( !pdev->domain )
> >      {
> >          pdev->domain = hardware_domain;
> > +#ifdef CONFIG_ARM
> > +        /*
> > +         * On ARM PCI devices discovery will be done by Dom0. Add vpci handler
> > +         * when Dom0 inform XEN to add the PCI devices in XEN.
> > +         */
> > +        ret = vpci_add_handlers(pdev);
> > +        if ( ret )
> > +        {
> > +            printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
> > +            pdev->domain = NULL;
> > +            goto out;
> > +        }
> > +#endif
> >          ret = iommu_add_device(pdev);
> >          if ( ret )
> >          {
> 
> Upon failure, vpci_add_handlers() will itself call vpci_remove_handlers().
> What about iommu_add_device() failure? The device will have ->domain
> zapped, but all vPCI handlers still in place. This aspect of insufficient
> error cleanup was pointed out already in review of v1.
> 
> Furthermore already in v1 I questioned why this would be Arm-specific: On
> x86 this code path is going to be taken for all devices Xen wasn't able
> to discover at boot (anything on segments we wouldn't consider config
> space access safe on without reassurance by Dom0 plus SR-IOV VFs, at the
> very least).

My original plans for SR-IOV VFs on PVH dom0 involved trapping
accesses to the SR-IOV capability and detecting the creation of VFs
without the need for dom0 to notify them to Xen. This would avoid dom0
having to call PHYSDEVOP_pci_device_add for that case.

I might be confused, but I think we also spoke about other (non SR-IOV
related) cases where PCI devices might appear after certain actions by
dom0, so I think we need to keep the PHYSDEVOP_pci_device_add for PVH
dom0.

> Hence it is my understanding that something along these
> lines is actually also needed for PVH Dom0. I've just checked, and
> according to my mailbox that comment was actually left unresponded to.
> 
> Roger, am I missing anything here as to PVH Dom0 getting handlers put in
> place?

No, I think we will need those, likewise for run-time reported MCFG
regions.

Thanks, Roger.

