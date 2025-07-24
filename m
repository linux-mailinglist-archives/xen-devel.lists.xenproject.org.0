Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86821B10C33
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 15:54:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056098.1424239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uewP1-00027F-RN; Thu, 24 Jul 2025 13:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056098.1424239; Thu, 24 Jul 2025 13:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uewP1-000256-Oh; Thu, 24 Jul 2025 13:54:31 +0000
Received: by outflank-mailman (input) for mailman id 1056098;
 Thu, 24 Jul 2025 13:54:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bzRN=2F=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uewP0-00024y-8R
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 13:54:30 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7ac9785-6895-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 15:54:29 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PA1PR03MB10602.eurprd03.prod.outlook.com (2603:10a6:102:482::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Thu, 24 Jul
 2025 13:54:27 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8922.037; Thu, 24 Jul 2025
 13:54:26 +0000
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
X-Inumbo-ID: b7ac9785-6895-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1e6y+zsSHVqFBVsDGbk88sSIzf+wZFNdGpTfyzbK5MQv3/rTTMiWnehPB/+P7QZXSKCzqP22eOisIaZHIxWKQhRVtcSsxQ+TFXwvEyHIlI7BGXSC5LrfkKUo0bgXRUFTV0Tk4Imu0qP6eOGrAVsMNFw8uDfclIBS6qwUniosnI1gzo/P7+YL8fw7znsH2uHQBTt8pFY4fa4nBzdeseP3RhbxbrD0ieqbDxzP0SqI/dBRUwnrutPxoDm+11qfmZft5wGZVWxQ5MqF7zXejgYczeSQmGaaf6L7C6/Xqq3BelkfDTkA9jBAOw6ZC7vcP3cqIBdPTmIrCi79X/WUOyqqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hR+YD69o2p6Gx+zoy1dZDtoyc9SchK1dKTpVtGAeE70=;
 b=uQN9a3+smBuBFtZXYGalMGoFPvNuzeNq8BZOgplx/+QI6VrTXddmf+4IGYiefNIrmz5r5MT15WyvHHp0CTvOaIp7kmIV5tE+yzkIFoZWbGUz2AIy3k+i3hbWhggAiEAZ0/LLXDCkdyc66wb8rmC/KfZN2LIW2A5isYh2VV5vhoGndNx5bw/h8UINHQSJLl5fzRsCBqw4u8XhVbAEeEb08ByAck5DHsdaw5ccVa+eFbyfu64QnVJhrD5ztQ/JhhRrcXSUaN/UNg7XNxnq+G9JZK94mzo10s2mB6XALrkMWXzVBijvdeU4nb/Ays6lNIRf1RlxEYFjTZgbFrV0koApKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hR+YD69o2p6Gx+zoy1dZDtoyc9SchK1dKTpVtGAeE70=;
 b=Xy73FFVWdlwvmyZa+WVTuHzdyLjXv76gndgA1dw5YL7bTE9QWUBw1UwOb8rkCMSV9DifooicOpnLlXfnf3+6FoK1T/7vEmsFsslllZ6hJrTRSM7+DW7vku1buX61+m9LZB6anPk5OrzAVAj2qGN5fWn+mWUfaHx4u2e0IPXN3vxvoBJhMrCEbWgwlx7EhiTKOSXLcafTqZA7j5El202BHa3VTybEdmK9H3yhhP6zQKQ1G8a/MM4t2ejn9C8yZGPYY7qQMXh11j0WcQbjYKRJYmgF//JKNd/+NlVHWmlON14/WgW3gePw6oMOXHz+Mx7ZbOTPWgSLtQW7ZTeT9tCN4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <3c2d53cc-e3c5-4a62-a82a-a19e0fdc7905@epam.com>
Date: Thu, 24 Jul 2025 16:54:24 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 2/8] xen/arm: move vcpu_switch_to_aarch64_mode() in
 arch_vcpu_create()
To: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20250723075835.3993182-1-grygorii_strashko@epam.com>
 <20250723075835.3993182-3-grygorii_strashko@epam.com>
 <99c88af9-7f89-4d7c-9827-1ba85c803195@xen.org>
 <fdf7d2b9-aca9-4392-8e4d-a7fc8ce036f2@epam.com>
 <3f74f62f-7017-48f2-ba7c-6af358fb0a50@xen.org>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <3f74f62f-7017-48f2-ba7c-6af358fb0a50@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::11) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|PA1PR03MB10602:EE_
X-MS-Office365-Filtering-Correlation-Id: 55648d51-ff1e-492a-684f-08ddcab99a86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RStPaE5OSDF2c0NyNXJ6VzZZVnloV2k5ejhSRDNGNjlaeGlwVDRUYUVDVGlG?=
 =?utf-8?B?aCsyQnJXWW9HcXFLSWZQSnVkOUxnZDdZTlBzRGJFRjY4aEJqZk9jVHhpck5I?=
 =?utf-8?B?djBDOWN5SEhkRnN6d0R2Mk5YeUlzS2VoMVduMlpWNlN6MlRIN0p5NncvczVn?=
 =?utf-8?B?V2lnVDhFQkhqcm9VSTNpWndpbmV2VlJnaTBrYmVDek1URnZ5cTJ6SUJEZTlI?=
 =?utf-8?B?eG9ybitsTWdXS0E0WExLd0h5S205Q0VBYi92SHZUNmNZdFBINmJPOXJqSDV1?=
 =?utf-8?B?WUFNdjVOVi9mcFVpOFhHeHY4dThzTlg4WmhOblVJT0NHejQ4ZW8zR2JFRGJF?=
 =?utf-8?B?STI4YVpNcVVIRGlTeDFiaGlUNnZXeXZnWlJ0VkFOcmhLT3ZsaE1PZWF2NE1N?=
 =?utf-8?B?NGt4bG43dEFKcjRZc0sxT2RNTWxOSnJVWExLRlI3d2UraDZUaFlCR0crRndH?=
 =?utf-8?B?amdmZlg1Y3h1dE5zbTUzekU4aWxndTFCWHZVdHc2UXRRK0tWeVBhaS81dWtN?=
 =?utf-8?B?T0lndEVFQmwrWVNCV3BJMDB3M21oVkxiWDVYb3NBeUd2UHd1a1RiaElyY3NS?=
 =?utf-8?B?M0JxQ1ZhWTRyUFRlQWJpUU5wUmY5RWdsa1JyMXcvVVdqTEw5eWRLdFJEQzUx?=
 =?utf-8?B?bXVpL2x4WVNWejh6QndwSmo1Z1hmZ0VoT21JekpBTE42MzRCUUh4enN4QXZG?=
 =?utf-8?B?N1g5cnBGdG1WM0hVQnVTcFQ4dThtb1Rqb0JKa3hCbkVyc1A5RlRBTzJQaWJR?=
 =?utf-8?B?U2JmZURjd3lIcWZTNExzbGdnenBsRFJiZWNUQ1pVbDVwUTNySWlyQXhiK3Fz?=
 =?utf-8?B?SzVxbnpqb0hmMlYycFVUa2M4N3l4Q05ZWHQzTXZmMFhXM1BWQUVkTkFNMW1u?=
 =?utf-8?B?YzNuOEFiVHJSRmFKZmRoM1hZM3F3bVkybzZxK0sybFlRczY4Y25nWHpIOFFO?=
 =?utf-8?B?czBHYU9FT09lcVVBWjdPeG4xNnFnc2J1bVg2WDRSUDdqbHF4NEhlQmJrU0FZ?=
 =?utf-8?B?VlVCcC9tcmlzUGVqMVR3bkRtUDV4U1d4U3orODNYOFBjbnkzSUR6WmdSdW1Z?=
 =?utf-8?B?OTBSQmxDU3ZwdTFKekRkZmJxMDZUV2pHL3FZUDJTZTlVTDUxTVV3MlBQb1F4?=
 =?utf-8?B?cVF0eXRJQjZQajV2ZnA5eWpMY29Helc3bjJUYkF4MHgvNDE3YU5GOVNzNEJr?=
 =?utf-8?B?SHc2MGZiK2FPdWdORHVkV0gwVVNkMzY5d2VoYzRyVFltaGhUNDdMTEpNRWIv?=
 =?utf-8?B?bXpuUnVaNlFpUGl2UGpWcHNRWU9nYU13cUxORTVnOUxrOG5PWjRPRU45S2dj?=
 =?utf-8?B?MXpmNmJHVGZ0TU1tbUFxUTZIWFZESVNxdGhwaFZTdVRMWGVFc1JXcUVwWDk5?=
 =?utf-8?B?NDRFVmxvWEVvWm0wMXcvSG9zRldUSzhTanJHb0FMUzgrOHNHVFF5K0lsTE1B?=
 =?utf-8?B?VDV0VnVqOGFxeUFXWEROaTBnMmpEclpCdWMzT0NVamdvczd5K2M1ZFY3bTlB?=
 =?utf-8?B?ejYrcXBvblgxSFAyTXp0VEtuNWRCbDQwU3kvVHVuR2psVkt5MEJGOExBWWw0?=
 =?utf-8?B?MThla0psYWh5MXR2UlFXZ1p0K1F4bTZlMXFFd1ZPU25Rd0R0enVmNzd4dVIr?=
 =?utf-8?B?TGNWbnlGOUpBVTlUbU5OM0lBeGpnZmFTOThUSjJaVGVNYkticjdQWDMyRzZ3?=
 =?utf-8?B?blJPVEF4UGpkbFVwcHNqUkpEQVQ4ZzQwdnhydDFrd3RJNCs2cjFsQ3k5cEhK?=
 =?utf-8?B?aDdKZk1jNWhxKzNYVU9RcVAxS2FuNkRCUmpockZyREd0UDlBUkhLZ0Rkcndl?=
 =?utf-8?B?TTY0Y251M0NGcFpOMkFNZXZvMCtFR2x4WnBmbXllNXpqcVhrZjJBQmdBWW44?=
 =?utf-8?B?b2VhTUxNVmppQ3VodVRrQzhETC8zQ0Q5N0ZEcXZCSTVqcE01RFFUNGpqbFhi?=
 =?utf-8?Q?7I22DzSf3P4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnZXd1RoQkNiaW15UVRKUzdoSm1sdW5NcmtMSVFXVWJ1NWxFemkybUNLRW1D?=
 =?utf-8?B?SURXcE1BVXRRdHExdVp6MVFEbUxZbzhIM3NqMS9KWDNnRW93NlNZWjNMeFh1?=
 =?utf-8?B?cWVjTGMvVnJMTnd5MXNubzhWcFB0OFpoTEg4SkJjTEFZbTdpWCtUbTRYa0pa?=
 =?utf-8?B?S3NGWUpxUHd1TUNlTlVicE9zQXh4dzZQcXRNemVSYThKdnAwUjZER0hnK3Nj?=
 =?utf-8?B?Q3l5WG5paFJ0a1ErTFBNd3d2N1JzWE9VQmZFRW01cGYzQUdsdjVmYm9QcGlY?=
 =?utf-8?B?ZEF4WXNzSnZvWnZSKytLMDh5blhDZy9zNWRRMlBMeGp3MXRONUttSUdEU3Jz?=
 =?utf-8?B?SnJwdHNnVXU4SUxIejNzUm5OakhVM3FkcGtESmkyd1htZ3JvVzYyVUZGV3dx?=
 =?utf-8?B?dkwrZ1ZQMzZmOHNEdmNYNUtDSERLK1hmMUFYZGtobzJqb0lyZm9pVklIckdK?=
 =?utf-8?B?eWs1b1R5bXJyTU1WM3lBMGZnY3VPY1lKQWY3VytuSWFoaHdXWktrcGxUTG1p?=
 =?utf-8?B?RE1BS1ZEQmpGVUhnUUtDOVllVmhUZ1dZcWJXTHptRzRZWW40L0JXYnFNdFZJ?=
 =?utf-8?B?OUIwSGNHU05xV0t1ME9wRHBXSXA2SHB3WS9vckhJOUpPcDFOM3VRN25oUytu?=
 =?utf-8?B?azZ1S05lVkw5WUpSSCtiVktIWHV4dFh6Qis4ZTdrRW9VVVR1Snl5bHJ3cEhE?=
 =?utf-8?B?MXpJeEVHVkhoUnBUZXJnZ0lNa01VeGQ1aHNpcHRBY1krV0JRRWdjSnYveGli?=
 =?utf-8?B?cEJ0TGhieEM4ZXprTjdNbCtMOTV6NWdzb25mMmEwN2IwV01FVWFYM1FpWnQw?=
 =?utf-8?B?NHQvQWgyZnNqQVNkVHZFcmVPT0RVVTh6NmpwN1Z5bE1wTXV2QzJiK2JncDJm?=
 =?utf-8?B?aGMwM2JjOFR1UmZ3bVVDVE1wVXdjT3dIVjk3MkwxTVBkSVFVR3dDZG4xWE9x?=
 =?utf-8?B?QngzdDMyelJKY0ZIZk5SNHJQSi9oR1IwcEJhSnh1a3FKWkhWL1BJOVVYZXlh?=
 =?utf-8?B?V2VoWnQ2T2RRaFpKaEFQZGVkQ0llUHoxTHRGVE5kTGNDTFFNMlp3NkxzaGlU?=
 =?utf-8?B?V0g2cGVwVCtqTnZleVVrem02Qy82SVJibnVtWjNwNTJDcWgxelI0YU9waXZV?=
 =?utf-8?B?b1NHSXhEcFErTENVWlRWWjVZaytFTnBhNkV2UFIrM2l5YTVNcEtkQW40czFm?=
 =?utf-8?B?aXZSSE4yb2F5Vnk5dzNVUjBhdjhwMUNYYzFISmE1b3BwRU9mcTkwWk8ybzR4?=
 =?utf-8?B?N0NkNUV4dFhGSDdJaXNaSEIvYXp6SjIvSWNLNkhWNkNJaHNiODBTcXphNXR4?=
 =?utf-8?B?ZmtuN0JobWpMR21EMEUyb01PbnFoalg5eGVtK3lvUHc3ejA5bEZrelhYSE5T?=
 =?utf-8?B?cW91b3M0QW9ESXJDV2dmMjZKR1NHMmYvcTlLNVRGRkJhWGh1L2J5ZnJ1RUkw?=
 =?utf-8?B?RmtjdnJTMURPRGN4WmZKS0hscEdLVll0ZVl4Tm02U1IvOFpQTzlXcVdJYU0r?=
 =?utf-8?B?a2JqTjFWazBTVXFNTDhEWkJTOHR1Z21iSjZtSExhdWZWRHZnaENQYU91OTMy?=
 =?utf-8?B?RjdGczhUMkhyNEFPQk55Z0oxZkNDcDArZ0Uzck1JajcvN1ZCUFVmYlFaTTgw?=
 =?utf-8?B?NFh0Ty85ZWxkdHpXby9ndWRQNWNYUGY4NlBmVkZwbTRsUDlTaFF0aFJ0bGNX?=
 =?utf-8?B?YTVjZ0dqdkg1R0NkNmtsbWFYYkVFd0dYUGpqUlM4anNIMmtKRG04QmNBQWg5?=
 =?utf-8?B?SWlwSkMzc1F1SllGWUlHc3lSMFRHWWUzRGJkdDRuWjFDK045YmFEMzhtanpF?=
 =?utf-8?B?SExzTlN0K0ZCc1YzL1JBRmpoQUhIbDVPcHhiUmpta1FzMkR3MEFIbVduZ0hR?=
 =?utf-8?B?N0JGY21UR2ZwYVNOVFliSzZ5YnNYY2c3K0h3bngyV3pXRDdVS01wUGR0WDMw?=
 =?utf-8?B?MTFNRDlXZEdKZTBodkxPMlQzWGNjaUh5VVNCRG5LYWRVQk14U2pEWXFpaFJq?=
 =?utf-8?B?cE1td1NvS2VYdFg3M0JabldBVkVNektaM2Y4OWhaQVV5VkQrT2F6L0hwemZH?=
 =?utf-8?B?SEFWL2piNDVweHdyeXNQS0M0K01HeFYvK3pWQXFZUjE4Rldmc2VYTTM2UU9L?=
 =?utf-8?B?NG10S3JmOEgrdk9MaTYxNVl1V2xSV1p3R2tZZHlreXdqZmRYVnZBK3N5WENv?=
 =?utf-8?B?M0E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55648d51-ff1e-492a-684f-08ddcab99a86
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 13:54:26.8689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jzCAz4S8laH7yrgWlxNTfCV3ThiCDT2JzFG5vM1fIQosapIR/wYjNq4Ldt+iFq7dcaYzI0uSv4W3sflGY9WndR9ez7enQmWsUocU2lUiz7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB10602

Hi Julien, Andrew Cooper <andrew.cooper3@citrix.com>

Thanks for your comment.

On 23.07.25 14:09, Julien Grall wrote:
> Hi,
> 
> On 23/07/2025 11:19, Grygorii Strashko wrote:
>> On 23.07.25 12:16, Julien Grall wrote:
>>> On 23/07/2025 08:58, Grygorii Strashko wrote:
>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>
>>>> Move vcpu_switch_to_aarch64_mode() in arch_vcpu_create() callback instead
>>>> of calling it manually from few different places after vcpu_create().
>>>>
>>>> Before doing above ensure vcpu0 is created after kernel_probe() is done and
>>>> domain's guest execution mode (32-bit/64-bit) is set for dom0 and dom0less
>>>> domains.
>>>
>>> The commit message doesn't mention anything about domains created by the toolstack. In this case, from my understanding, the switch to 64- bit domain happens *after* the vCPUs are created.
>>>
>>> At the moment, I think this is probably ok to call...
>>>
>>>>
>>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>> ---
>>>>   xen/arch/arm/domain.c                    |  3 +++
>>>>   xen/arch/arm/domain_build.c              | 13 +++++--------
>>>>   xen/common/device-tree/dom0less-build.c  |  6 +++---
>>>>   xen/include/asm-generic/dom0less-build.h |  2 +-
>>>>   4 files changed, 12 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>>>> index 79a144e61be9..bbd4a764c696 100644
>>>> --- a/xen/arch/arm/domain.c
>>>> +++ b/xen/arch/arm/domain.c
>>>> @@ -586,6 +586,9 @@ int arch_vcpu_create(struct vcpu *v)
>>>>       if ( get_ssbd_state() == ARM_SSBD_RUNTIME )
>>>>           v->arch.cpu_info->flags |= CPUINFO_WORKAROUND_2_FLAG;
>>>> +    if ( is_64bit_domain(v->domain) )
>>>> +        vcpu_switch_to_aarch64_mode(v);
>>>
>>> ... this function here because I *think* it would be NOP. But this feels really fragile.
>>
>> The toolstack configures domain and vcpus through XEN_DOMCTL_set_address_size on Arm64:
>> - toolstack creates domain and parses kernel binary: domain created with DOMAIN_32BIT mode by default
>> - toolstack creates vcpus (still 32 bit mode): libxl__build_pre()-  >xc_domain_max_vcpus()
>> - toolstack switches domain mode depending on kernel binary type: libxl__build_dom()->xc_dom_boot_mem_init(),
>>    which triggers XEN_DOMCTL_set_address_size hypercall.
>>    Xen: arm64: switches domain mode and re-configures vcpus: subarch_do_domctl()->set_address_size()
>>
>> So, this patch does not affect toolstack path, only optimizes Xen boots a bit. 
> 
> Thanks for providing more detaisl. I am not sure what you mean by optimize. It reduces the number of places where vcpu_switch_to_aarch64_mode() is called, but there should be no difference in term of boot time.
> 
>>
>> Also, during Xen boot or by toolstack - the domain is always created before it's type is even known, which, in turn,
>> is based on guest binary which is parsed later during domain configuration stage.
> 
> What you are describing is the current situation. But this doesn't tell me *why* we can't provide the type when the domain is created.
> 
>>
>> I can add note in commit message "This patch doesn't affect on the toolstack Arm64 domain creation path as toolstack always
>> re-configures domain mode and vcpus through XEN_DOMCTL_set_address_size hypercall during domain configuration stage"
> 
> Well, as I wrote before, I find this code extremely fragile. And you so far, you don't seem to have address this concern in your reply. In fact...
> 
>>
>>>
>>> If the desire is to make 32-bit domain optional on Arm64. Then I think it would be better to pass the domain type when the domain
>>> is created (IOW add an extra flags to XEN_DOMCTL_createdomain). This will require more work, but it will be a lot more robust.
> 
> ... I proposed what I think is a better alternative. Did you consider it?


Yes, sorry for delay. I've been considering it and tried to study and estimate it, at least preliminary.
  ...It's definitely more work.

I'd be appreciated if you could clarify some points, please:

- Am understood correctly that proposal is to add "XEN_DOMCTL_CDF_is_32bit" flag which will be passed in struct xen_domctl_createdomain->flags?
   (or "XEN_DOMCTL_CDF_is_32bit_mode")

   [Arm] The Arm64 specific enum domain_type and (d)->arch.type can be dropped (use XEN_DOMCTL_CDF_is_32bit instead)
   [x86] the d->arch.pv.is_32bit can be dropped (use XEN_DOMCTL_CDF_is_32bit instead)

- is corresponding XEN_DOMINF_is_32bit needed?

- Assumption XEN_DOMCTL_set_address_size will become obsolete finally. Right?

After studying the topic, I have below thought regarding the requested change.
(I might be missing/misunderstanding smth, so will be appreciated for any advice or guidance to the right direction.
  Also I'm not very familiar with x86, sorry.)

The goal:
- domain mode (32bit/64bit) should be determined by probing guest binary before creating domain;
- domain mode (32bit/64bit) should be set during domain creation (XEN_DOMCTL_createdomain) using new flag XEN_DOMCTL_CDF_is_32bit.

Possible steps:
1) Introduce XEN_DOMCTL_CDF_is_32bit flag;
2) Arm: re-work regular dom0 creation code;
    challenges: cross references kernel_info vs domain.
3) Arm: re-work dom0les boot mode;
4) x86_pv: re-work regular PV dom0 creation code;
5) x86_hvm: ???;
6) toolstack: re-work domain creation, so guest binary probed and domain mode determined before creating domain;
    challenges: running "bootloader" to get guest binaries seems the most difficult part.
7) de-scope XEN_DOMCTL_set_address_size;

The toolstack behavior is left unchanged until step 6.

Hence the amount of work is significant It's preferred to be done in independent phases (series) to
easy review and testing process.

I'd try to come up with patches for items 1-3 as the first phase.

Thank you.

-- 
Best regards,
-grygorii

