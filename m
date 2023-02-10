Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E8B691A1D
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 09:39:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493142.762965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQOvd-00037o-K2; Fri, 10 Feb 2023 08:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493142.762965; Fri, 10 Feb 2023 08:38:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQOvd-000352-GC; Fri, 10 Feb 2023 08:38:45 +0000
Received: by outflank-mailman (input) for mailman id 493142;
 Fri, 10 Feb 2023 08:38:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eynG=6G=citrix.com=prvs=3989d3060=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pQOvb-00034u-Pk
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 08:38:44 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 510e9ca5-a91e-11ed-933c-83870f6b2ba8;
 Fri, 10 Feb 2023 09:38:42 +0100 (CET)
Received: from mail-dm6nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Feb 2023 03:38:34 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5528.namprd03.prod.outlook.com (2603:10b6:5:2c5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Fri, 10 Feb
 2023 08:38:32 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.017; Fri, 10 Feb 2023
 08:38:31 +0000
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
X-Inumbo-ID: 510e9ca5-a91e-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676018322;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=f10DM3HQyVPyHarqupCih9gZsKZsEkMc07SwIAc+88U=;
  b=HLHfsism1caaOIShakVRqg/AdaYwiPGYRmptlfDKDd4HZ69Jg0m3NcSa
   24sy5OGV2zKRp88PqWl56IwHU2StqrRToUmDsVSdcOcBIqBCP8Utzgmzv
   bQb1xLDIDK+pPt4hEBkNj2D5s5FsYhZyH6tKi8CeaTrdYYjUUDTEW7CAY
   0=;
X-IronPort-RemoteIP: 104.47.59.171
X-IronPort-MID: 95888811
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kRnl/K1oy3sHbYpiD/bD5eJwkn2cJEfYwER7XKvMYLTBsI5bpz0Ex
 2AWWWjSOPyJa2ajfo90bt+1/ElV68ODmNA2TVNkpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gZnPagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfIzgQ6
 ccCaxI0aivTpuyo8Li5TbF0r5F2RCXrFNt3VnBI6xj8VKxjbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsi6Kk1UZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXKmCNJCROThnhJsqH+8zWc4Ej0ZbFX48NybuxGzZugDF
 WVBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rXQyxaUAC4DVDEpQMAnsecmSDps0
 UWG9/v5CDoqvLCLRHa18raPsSj0KSUTNXUFZyIPUU0C+daLnW0ophfGT9ImHKvriNTwQGv02
 2rT83F4gKgPh8kW0an95UrAnz+nupnOSEgy+xnTWWWmqAh+YeZJerCV1LQS1t4YRK7xc7VLl
 CFsdxS2hAzWMaywqQ==
IronPort-HdrOrdr: A9a23:MzYF0KxhE+MgrMgcGdD3KrPw3L1zdoMgy1knxilNoHxuH/Bw9v
 re+8jzsCWftN9/Yh4dcLy7VpVoBEmslqKdgrNhWYtKPjOHhILAFugLgbcKgQeQeREWntQ36U
 4KSdkaNDSfNzlHZcaR2njFLz4jquP3j5xBU43lvglQpQIBUdAQ0+9gYDzrdHGf3GN9dOAE/J
 z33Ls/mxOQPU45Q+6cHXc/U+3Kt7Tw5e/biU5vPW9e1OGW5wnYk4LHLw==
X-IronPort-AV: E=Sophos;i="5.97,286,1669093200"; 
   d="scan'208";a="95888811"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqBRDU7/ngQVdusYVytnS9hLWDpGNgRo6m7OMEEdf2ZUx+BO3Ti6cXI2ExZ8Rz6Wm13b3VBTYqErljT5y5XzEfHBpP3RGX7LzVMDITEUTLX3+Oz3+vbZWFkzSSrfZy9mUULauEvj0OF4lBM9vVAUIl59Eft512uaAS01O0FNHvSgUoNbgh/+AI63R0UB8lI6ikAdo5PcquEJ73XPGhv/hn+y52bNAIrWDeQir5qCO5KzfXfJeUZW4lHyQvLQCnIfndLOMgyPFdOCsz9IC/gPaypQSkt39/KcQ+EKPYIBAWTgBZIKgifQDIAS+1PXtmJhvKraJZFbbGd2dLduYjlrgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wse9i7PQQCT7mpq4yHOBI6RpsTexJCJeYMFvDaMso+Q=;
 b=c54yijjnmYpyKeyueiLmzjHb7UWIx69aqLsSmfAPnt3aq83sHcGBGicQjOqgisVIohQP+D+gOVlpgVG4/Fe9zxFg7fAOl+W+m7QT1V+dJoLRfU38xoosJltK+qNrdGbAaJC9k1qXxna/la9yLGY52yLPhlFSvkqsG37KXpV2cnpDsJ85tinsQ0vHpk0ZMAW8Uc3rwB78A4Xcm9AGclv6BJ2wvr0UlCVzhq35RKBIHDz3M2509MBAjk4sowzB9sTUjajHGI9HJbO0kp1OUO2BaV/t+f2HIQYL4J+XZVjtxM1uqocke79pIL59PdW8Qt/KJsshBC7Efk1ckc+A+POaow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wse9i7PQQCT7mpq4yHOBI6RpsTexJCJeYMFvDaMso+Q=;
 b=O/yuOATYbIpjofcV87LjFaRYxlmhfe6Z0jKvvTqws2EKWWVXmC3jB5X+4kA37OrmG2+Em6hvRXeTt1VtSpT+fz+dUQH6Hk6NiijXtoxw8PY418TF3CzuChOVCavSCbx6Be0gTUIJx06FZT3sQD+g+lQaokqx3Sv513dWvPLm8PY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d79fd2a8-5b95-892a-0710-8291d10ba32c@citrix.com>
Date: Fri, 10 Feb 2023 08:38:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 4/4] x86/shadow: re-work 4-level SHADOW_FOREACH_L2E()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c8858a19-e89a-c1de-3222-810bb43c3c88@suse.com>
 <7d2dd28a-a821-e906-6245-ab26e5518706@suse.com>
 <7751faad-d281-bdce-60c3-74b17f57313b@citrix.com>
 <a365e7e6-7ca8-6724-52af-efcc92833a94@suse.com>
In-Reply-To: <a365e7e6-7ca8-6724-52af-efcc92833a94@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0652.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DS7PR03MB5528:EE_
X-MS-Office365-Filtering-Correlation-Id: 68682012-d528-489b-010c-08db0b42308d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L5KLEMejbC+Jw/fdEz75P/ExAeR3qB1ST9aPPUFysI2NXxj7OzoxaS4SQZFNSccCf5skChOtZcco5Eof8c3zOxFLNL82GUlBnRGgd2zASgZbiE1vpHf82iFepGCioOFci/IDj6aXo2l2qfA8UyW9wGm+iK388bYTS81w4j5ocx2hvqzeXJJ6DxwpZ8shZMZcMZIvi9Fs/3BahTV1nYnTCkHUOayhbXJOppj60wBkIGVnLQIRubB2GA7EftmL+dWccP8Rn4bKmsb51krhHbDdO9aKocOaQ7B9sE4aKpi+NWNtr5W0tluSM/+hTgHbnwM9olOujN4BA/yCdemj8L0wIsYlXqeIeSAf2JQ1CtLOT0QL2fOgZoQfDrhwTHbxf2AmyDdAtqjBXD3AgfWmx4Wpa5C3U2ekr6xTHjC16fWjwhUd72PqkQETi49rNJ9YMmBO689Za/wOqkKxb1hmoe7eQ9swTcr3xt+K/Ol8OhjMX5OV8REenpblbsFwWT+jSveB6Afe4JmiEEawYtCw0z2AomcZk/qCLGzXbsEkxpNorxXypXyOx6XqdGkEqEO216MWVzLYjfqSmvLVitOYDjqupxx6Rob9rQ7EyIet6G32FN/x0JLkBd2tIHSkKa+1FgcVmlKdKBbZe55yyEVv5ATrRQgavhVxVE4ekxhGmooJ59vO2cvxkjxgJz9u99PQi90kPC4AnlZRTQuKJj41SWN3MoG7eMdCf+oJ8DW55Nu2TP8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(376002)(136003)(346002)(396003)(451199018)(31686004)(4326008)(86362001)(8676002)(66476007)(66946007)(66556008)(6916009)(38100700002)(82960400001)(2616005)(41300700001)(26005)(6512007)(186003)(2906002)(478600001)(8936002)(6506007)(53546011)(316002)(6666004)(6486002)(31696002)(5660300002)(54906003)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFpBWVBJbi82VGlOZ2FoS0tWb056aU9VOUlrbVVJK0llSThWSkVzdlNaeXox?=
 =?utf-8?B?c2VGM01HVlhWbzczbEVLdHk0b3V2MjNqVVpQVmpyYjQ5OXFrMVJSeE1QTU4z?=
 =?utf-8?B?ZW52SW5xaGErZjZtZ3RCRWRTbVh3YTJmTjNoNmpKRFhwMDN3amtNTTVhVzZS?=
 =?utf-8?B?ektoaFFOSG5zcG1kUFZiSllyNHhBTU5zYVdCbzhVQ01pYXhxeEtjdFJzT0Uw?=
 =?utf-8?B?QVFHaWR5eUlpdWRicUhvOS92QVMweVk2NzVyRFk5d0QvUmhUVVBxM1J2Mm5G?=
 =?utf-8?B?M29pWmd4b2pMMGdtWTlNK2ZacU1JQ05EdURhMEczL3llUDlieGJxdFhCaDFW?=
 =?utf-8?B?SGg5a096Vk9hc09lVTFHekV1QTBKc21DT2d6ajRKOG8rTHJjMjVqK1NEb1Bn?=
 =?utf-8?B?MEJPYXE0SW5xcnNPYmNlTDBLY3hKRzYybS94dnNkbUVWcGJIUjVNRmNkUENo?=
 =?utf-8?B?bEgzMnFhdTh6TVlEcHUwRWx0T01zNTdQb1NjckdEYVN3bmE1OURybkVydDRo?=
 =?utf-8?B?b2tDYW96Uy82V1FsRzJrWVA3YU1QM1NFSlRwWkRlT09SbjZFdW9PbkxzY080?=
 =?utf-8?B?MzFFR1k2OWtjVFphRndQSzlXeCtBTzdYWkN2UnhhNklQM2pycVBiVUMrK1Jz?=
 =?utf-8?B?NGJ5TWZ0bzhlUlNzdFlHWGxwRHgwZ2hhRnBhZUlpR3ZnVUlELzlrdFluNkpJ?=
 =?utf-8?B?dDd6NUZ1Z0sva0drOXlRSnBaL2FGWVZ6YWQwU094TldacnJHOTN1NDFnSHlw?=
 =?utf-8?B?Mi9kUFF1YXN5TE1XeXVUenZtY0NYK3FxbUVpRWZTWnFIK0hwNC8rM282Q3JI?=
 =?utf-8?B?STVRa1o1aGcySDFMUFVTZXdrTUo3V1NSaHdUNDgvYWxLSWZvdWFhb1JkSkVq?=
 =?utf-8?B?WTZadTg0VTZIZy96ZGFwNlFSS1BnRVZDM2hYUlBzQ1FqL2JlWGdoTW5kV3NR?=
 =?utf-8?B?Y0dOWVpNZmU4b3JtNlBOY0tJZXRxcjc1OG1WVjZJN3NtZk1NazFQZGFxN1Jn?=
 =?utf-8?B?T1dUT1kzcEoyVlRFMWNUQzZVSEcrTWpwL2RjbW8wclJsY29nZHBscEMvaFA1?=
 =?utf-8?B?dFZWeVRvejNzWjI2WmpNcHU5MnFKZHVrMUZHZ1VVc3A5bHFjZ2JKTFc3RG91?=
 =?utf-8?B?Qyt0VFB3ZjVDcklaUnNzQ2JmU3o3Q2FJdDFrUFg0c0kyTEJSZFBaWnJZZ3U2?=
 =?utf-8?B?YmVsbXV2RFVxVVgxNTFhMzVnbTZGeDFWaUt5emxmanR5SEJWKzRzUUd6NzV1?=
 =?utf-8?B?YUFWVmVCdGZ3UW45WCtXZDBpK0tSM0kzeXgwTmpXK3B4MzBkeWZPL1NwNEpX?=
 =?utf-8?B?N3VYMXVScTJGVFhma1FGTGxkbExrYXppeUc5a2lNVG1mSk02b3RJME9KL0pP?=
 =?utf-8?B?OVArc2NuUjBXcVVHMGtKaS9nams3eVkvQjQwVitEazBOcW9LbXZDdVBrR1Zp?=
 =?utf-8?B?QlRaWUtEVHNIS0NFbmJ5SXZ1aWRyN1lTMDRlc0M0cTJYNE55aXoxWTZQTkZ2?=
 =?utf-8?B?SWZQUUdsY0hqYjlYMURIbHo5SzFFV1BweXpBVEVyYi81cmNkZklGT09XdTJ0?=
 =?utf-8?B?ejA0eXdkWSt0L1FzeFJKYm5oYnVHL0RXTzErMGZ6N2ozeFoxdG1yVDZLYWg5?=
 =?utf-8?B?L0VVd2I2dnFqVW9ENlhUOTFvejREKy9yaE83R0tRemJRdjFjMjhIMkpmQkVq?=
 =?utf-8?B?NHV2aWlzczRZTWNTdTBia0JQekZ0eUc4VG5lK1YxSTNnS3BPYlNsZ3NLMzdk?=
 =?utf-8?B?VVBpMlFCMy9JRGJQdk14TzVleTZQOTVWbE8rNkpENWdjcmlHWTNOcjF0TlQw?=
 =?utf-8?B?M3d2M3Bsem94WEUrKzg0ZDY5RkdGYnNoTHJXcldXQjcrdHliVEp6ZS8yeWx2?=
 =?utf-8?B?a3ZnVUtNSE5pWG1OL2huOEVPY2Vod0dQVEdVRzhvOU1ieWhsQmM3YmFSeWZh?=
 =?utf-8?B?UFFtd21iemtCU0hYR2JhMjJaSDFBOWx3ZUljZTNqOFRlL2NoTitzZVRWZEQy?=
 =?utf-8?B?a0pTTWZsZ01TbnY1SW1iYnJjbjVSZ05Dc05RZXpLbjJKOEdaajlzT0JvSXJp?=
 =?utf-8?B?MTlENElHSTYzSEZackpTLzl0MjdmTWdSaC9Jbk5pZEJnVmVDdjU2UGJFdTdj?=
 =?utf-8?B?ZStBUStVallnZy9ZVzdUMjI0TUhqMW10cjB6Wk5ja3dXNFBFM2FuOHVteDE0?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LbF8DqgqnW8+fHZMm36l5j02s+fHzGx1B8tH+jzm3SX/Gi5u0bLaLC3O4Ds6olwdVPTnB6SSHfLbdJkpJWf1VSxDl89iKdQWMpM2y+TwbKtUTLttiwoZ03/81lJvlHzvDjia0vzww7z4oGroSYM8PW9VTntsgpXe/uWyW9d4SHdciOwGMy0SaxST9SaSL/jSxKsOK9u4yOXU0muxtA/2oe+NOBG8cdjEdP5y++Z325MzPC9DQe2ogoJshpR07ids/x/hbdwboTLMy80tgYRZm54EijRiekqBYJU+Ws1gIcapYLyivzN/iJLnnchBemo9r9Zr313N745Efdlc6YgQ6nX+z8Z0Y34wbN3UXOGhcepb+uK3J+ymP+Ki7dCBJkl7FT4SmWp9G7o5wOBW3zdm/M9iIACcri3glMpiK+P1xG1hExfNwpj7Qwl84W5bupWddHjEeXRmP4yo5x3HpxkJxmGipPDYlm9lQpBHmvXtXu8zRNfqsTZdSf8nmlhJ1N9wv8k/0jcw+X+HI00H3j1HyzoJlPGG5EInWFtjHW3odta1Qt0U9DSqUDLK/OMxPWk9orXuZQcT24yK0Mdvpo5hzIhUMa0bXoSRR9t3Y9Ac08PMYpd3DF9knlr1ngk85dg2KkhrAsj9VDfrCzzJJNUaRhApi/yFjwEUZA4jFckBzQQd490v99ukPfm0R7XOx8vswX+V9Ilh0U7lOVAFYpP8Y15+zOiGo/U2n9462+7VEIIEsAyWAqCB/4cK7cDRHbYPSw5wAXCEQAME1rykRM3fzBScxmrCnIGoUmPGaHzT5SQfX6/FF4lGbjMCRmZGPYum
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68682012-d528-489b-010c-08db0b42308d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 08:38:31.6476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zpHQHylnAF1nKZPjfALtnKT8jv2B6B1/5bvHERHBQGdQlhpXqydT3GmB0mnKbQAdHKUSvOgBOHLWddYqRiJHVv60sARrCtmmQxYLwlYy3eQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5528

On 10/02/2023 7:07 am, Jan Beulich wrote:
> On 09.02.2023 18:26, Andrew Cooper wrote:
>> On 08/02/2023 2:38 pm, Jan Beulich wrote:
>>> First of all move the almost loop-invariant condition out of the loop;
>>> transform it into an altered loop boundary, noting that the updating of
>>> _gl2p is relevant only at one use site, and then also only inside the
>>> _code blob it provides. Then drop the shadow_mode_external() part of the
>>> condition as being redundant with the is_pv_32bit_domain() check.
>>> Further, since the new local variable wants to be "unsigned int",
>>> convert the loop induction variable accordingly. Finally also adjust
>>> formatting as most code needs touching anyway.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Thanks.
>
>>> --- a/xen/arch/x86/mm/shadow/multi.c
>>> +++ b/xen/arch/x86/mm/shadow/multi.c
>>> @@ -861,23 +861,22 @@ do {
>>>  /* 64-bit l2: touch all entries except for PAE compat guests. */
>>>  #define SHADOW_FOREACH_L2E(_sl2mfn, _sl2e, _gl2p, _done, _dom, _code)       \
>>>  do {                                                                        \
>>> -    int _i;                                                                 \
>>> -    int _xen = !shadow_mode_external(_dom);                                 \
>>> +    unsigned int _i, _end = SHADOW_L2_PAGETABLE_ENTRIES;                    \
>>>      shadow_l2e_t *_sp = map_domain_page((_sl2mfn));                         \
>>>      ASSERT_VALID_L2(mfn_to_page(_sl2mfn)->u.sh.type);                       \
>>> -    for ( _i = 0; _i < SHADOW_L2_PAGETABLE_ENTRIES; _i++ )                  \
>>> +    if ( is_pv_32bit_domain(_dom) /* implies !shadow_mode_external(_dom) */ && \
>> As this is a comment, I think can reasonably be
>>
>> /* implies !shadow_mode_external */
>>
>> which shortens it enough to maintain the RHS justification.
> I would certainly have done it without pushing out the escape, but both
> alternative variants look worse to me: In
>
>     /* Implies !shadow_mode_external(_dom) */                               \
>     if ( is_pv_32bit_domain(_dom) &&                                        \
>          mfn_to_page(_sl2mfn)->u.sh.type != SH_type_l2_64_shadow )          \
>         _end = COMPAT_L2_PAGETABLE_FIRST_XEN_SLOT(_dom);                    \
>
> it isn't clear that the comment applies to only the first part of the
> conditions, whereas
>     
>     if ( /* Implies !shadow_mode_external(_dom): */                         \
>          is_pv_32bit_domain(_dom) &&                                        \
>          mfn_to_page(_sl2mfn)->u.sh.type != SH_type_l2_64_shadow )          \
>         _end = COMPAT_L2_PAGETABLE_FIRST_XEN_SLOT(_dom);                    \
>
> looks more clumsy to me. I'm not very likely to accept a suggestion to
> for the former route; if you think the latter variant is strictly
> better than the original, I might make the change while committing.
>
> Hmm, or maybe
>
>     if ( mfn_to_page(_sl2mfn)->u.sh.type != SH_type_l2_64_shadow )          \
>          /* Implies !shadow_mode_external(_dom): */                         \
>          is_pv_32bit_domain(_dom) &&                                        \
>         _end = COMPAT_L2_PAGETABLE_FIRST_XEN_SLOT(_dom);                    \
>
> ?

I simply meant:

-    for ( _i = 0; _i < SHADOW_L2_PAGETABLE_ENTRIES; _i++
)                  \
+    if ( is_pv_32bit_domain(_dom) /* implies !shadow_mode_external */
&&   \

(If this renderers properly.)

It is not important for the comment to be syntactically valid C,
especially as you're saying one predicate implies the other.

~Andrew

