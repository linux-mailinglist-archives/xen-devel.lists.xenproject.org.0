Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4828D5DF4
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 11:14:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733505.1139813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCyLM-000089-Dj; Fri, 31 May 2024 09:14:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733505.1139813; Fri, 31 May 2024 09:14:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCyLM-0008W4-9Z; Fri, 31 May 2024 09:14:36 +0000
Received: by outflank-mailman (input) for mailman id 733505;
 Fri, 31 May 2024 09:14:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i5xk=NC=oracle.com=john.g.garry@srs-se1.protection.inumbo.net>)
 id 1sCyLK-0008VD-Ds
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 09:14:34 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3067c957-1f2e-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 11:14:32 +0200 (CEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 44V93kQq020927; Fri, 31 May 2024 09:14:18 GMT
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yb8fcjs81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 May 2024 09:14:18 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 44V90U0R010651; Fri, 31 May 2024 09:14:17 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3yc511qac0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 May 2024 09:14:17 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by CH0PR10MB7462.namprd10.prod.outlook.com (2603:10b6:610:188::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Fri, 31 May
 2024 09:14:16 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088%5]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 09:14:16 +0000
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
X-Inumbo-ID: 3067c957-1f2e-11ef-90a1-e314d9c70b13
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcc:content-transfer-encoding:content-type:date:from:in-reply?=
 =?UTF-8?Q?-to:message-id:mime-version:references:subject:to;_s=3Dcorp-202?=
 =?UTF-8?Q?3-11-20;_bh=3D86HW1+PMNrYdS47amrU0JoQ3+mprOzG+m1WSAURzBUg=3D;_b?=
 =?UTF-8?Q?=3DTFbl1bsW447/vgYSK6crHkEHip3JQmIgutevB5tHOEfZiLhZbeh/RuKiH0L2?=
 =?UTF-8?Q?mnW/ohzC_IsAJVdcPKyZJjYT1rVtrmeth36uSQU4kRSBu0s1ntlnYcHs8AEDB2M?=
 =?UTF-8?Q?fHHU1LJiEuvy6C_FZP+l8wQmKqZ+SUJpjobABefvGGluCxlSTLWxzloZqtF2qOr?=
 =?UTF-8?Q?UAHR6Ginj8qJsLqiHol8_B+VqeWFYkM3ClyYWstru1SK0HCo9nSyG0pIWdgKWSP?=
 =?UTF-8?Q?2bRFeJ63/0jpoZAc8daaLrYP2I_0VgN1C/l5QJothy2oY+R4DFttiMYG2lNgCUX?=
 =?UTF-8?Q?+YOmVfNbINb5KuKvQJSeprbZQzkL9zw8_JA=3D=3D_?=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYDCRzMnSwXX+gU2UAeeDbPufthB19AYd5mXt1hCec4KZiqpy+Uezg3b+mNctS0mmS4iYqHQjIDks6mcSbceiL4tSU6F7cdhzsw72GsMwvwBzj2rDRYyYkpWBdyIlNAG3FGkLe8n+qlEkJY1g6TjDApL8Hj7X28Hnnn1WIiphCFb5L4JufmO2C2QVmANuECcRRbhrHOP7MG+vktxxInEbXa26F3Qex5YDzie4ndVDlA+UAt8YooXZiBBW7SG6D/dKS4zY8pHZPQXh72gaSTtPktDiMmwyikbBcxk4V9+0pl3c+Qu8jkV1HmrJe5rVp5W0HScKdqcWVZ16OzeBvY1mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86HW1+PMNrYdS47amrU0JoQ3+mprOzG+m1WSAURzBUg=;
 b=eCIBg/Msu3PFMjzlob20+WSWIQZ7ZS4SBOSIbBXVfZJK5GcUUkGnF7q7Uzg60KtJy5VVtBdSAXmFf+eDh2WUFyvysy1OcMY3weYtTEY5ieey34dsoOc9t/cjHQIdt5+Nu0/7k38t5jCZaDwP7+OrRSKTDnbgeAqmhuVxSm0IFB7mbJK1SfkPhfljKbR1QP4TjP8EF7ngMh1aHndZSCpUJxfV2vWb+rvG/i66FQQADFNyBITxmS3M+466D7RejwW4WfYdmBQWdvU8wyIGHdUy3bXLe7acQ1z1cbcGLzqGd6lwF/AMlNCPW2HIg7avpxGx+gpBqoSU7soPrRpuvlUDBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86HW1+PMNrYdS47amrU0JoQ3+mprOzG+m1WSAURzBUg=;
 b=s6kTuVp+HtMTevXWkzET2r4vM2fNG+jBVetZHodlChVV6pMQgoJzXUr1C0B9RLzZa3YdgalbychlRFFfih0VK2Azsf+vuoEdMtQou29l5X3bSLbPcmjJxu45BXkqbjz/xVwxGizGA+4ZevHo/jtWGaGv8l47TroAohpr8k/pM1Y=
Message-ID: <945070d6-b2ef-4be4-b85b-138a41641f43@oracle.com>
Date: Fri, 31 May 2024 10:14:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] block: remove unused queue limits API
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Josef Bacik
 <josef@toxicpanda.com>, Ilya Dryomov <idryomov@gmail.com>,
        Dongsheng Yang <dongsheng.yang@easystack.cn>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        linux-um@lists.infradead.org, linux-block@vger.kernel.org,
        nbd@other.debian.org, ceph-devel@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org
References: <20240529050507.1392041-1-hch@lst.de>
 <20240529050507.1392041-12-hch@lst.de>
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20240529050507.1392041-12-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0442.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::15) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|CH0PR10MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: 45f090b4-c36c-4784-2f2c-08dc81520b64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005|7416005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M2lrcHFxZ0t0S3ZCNm9HdUlHb3dPWGtXa0J2ZGJ1L1F3cWYrbjJGUTVTZklj?=
 =?utf-8?B?bTB0U010R2IzcUxrZGZiYnZVTmdyMmQ5Y0I2QnlzdDhHTWlYVndsR0pnUlU5?=
 =?utf-8?B?emdnUzZoQzZybmlXbmFsZFZ0YisyK1BjY1JOUzVXS1RyTFpOUVVjLytqRmJU?=
 =?utf-8?B?SkxsSUN3bnRuRzdwWEsvcW05TkVCUWdaY21oMnFvdFAveko0Qi95THlBei8y?=
 =?utf-8?B?a3pyN2NpMldQc0hEQWxrOEFoSGpXNDF2aWp5ZE1OZE9PSmVNOHptK1dTVE83?=
 =?utf-8?B?N3JDVXN1UmdBVEhpL1hPbE02Nlo5TEpNZ1YxQko3UkdQaGsyR1pTd2xqSEdq?=
 =?utf-8?B?ektMMkw5Z3Z6RDBHeU5ycnhXelBVVmdHVVVLKzZaT2dYNlpFTEFMVzZKSG96?=
 =?utf-8?B?ZXdmTUg4TFU1RE1GYkdsSmJhRXN4QWdNOEswRS83S1pWY253NmczbnJpQ09I?=
 =?utf-8?B?UnkvZzZRTzAxRVFZMHlvZG0xdzYrVyt6eVpnRnBkbWg0UkVGc0FSaFZwNExP?=
 =?utf-8?B?K1pQczNyajBIbFNXWFlaWXRMQm1LU2N2TVNwQXFUcnh4ek44OWJxeTYxOXJG?=
 =?utf-8?B?cEhYdDZtNzJ1N0VWM3RobE5ybW9PbEc1R3JLSnAyemg4QUtKRGljblNGRTlm?=
 =?utf-8?B?UUk5bkQwdG5rYThoSDZ4VHY2OTUwTEtZMDZyRmszNVZOc2NvYXNwY1pTbDFn?=
 =?utf-8?B?ZjVGTlFCeWpZbC9BRGllYTFYWUN3WVByVXVFWWdpdU1ybTFEZlZJcUc2cDQ1?=
 =?utf-8?B?UjNwdVdIVWlsOTJnaWc1MTZoUWtvWVlqNjdnUHk4a3owb3hLTHV1eUN3d3ho?=
 =?utf-8?B?VkNTR0V1SWtod2dTbzVpR25BdFVzbE1oZFVyRXQrZmdJYW9nQ215NlhGT2JG?=
 =?utf-8?B?UkhEUnEyZnlXampiQlk1cWJDTEdvZmpWTGE1ci85UDd6LzVNWUlyNjlzNzdm?=
 =?utf-8?B?bFl5dUo5SjI4VHNFdGJzNjdnaTNqa1VVMG4vRU1Mdk9yeXBwSlJSTHBjcko2?=
 =?utf-8?B?Qk42bkc3Q0dKZUIvU3JjQU5vSEpCU0dMblZUUmZxVkk0bXk2WWd6cGpoRmh3?=
 =?utf-8?B?c3hMNlVqYUpBbFZuVWZqeldVYnlkQjRLZG9pTFByb1g0eERpYjNWZDNaQWZY?=
 =?utf-8?B?VHN2ZFBGUlVMRjlRQk1USlUxTU1HOCtMd1ZQWUZRMFo3M1Rhc1h6ZUdSVkh1?=
 =?utf-8?B?c2Zma3VBdFUxOFFBVTRkakFDb3pucmZMMWNNNEtHdE91MWZXc3ZLNXpTVW1K?=
 =?utf-8?B?SWQzMnJlWG5SdDcrakVLUG5ndjlkWG12QlEzd1lvMElZSUxkNW9DNVVhckhz?=
 =?utf-8?B?OVlSeDFXeDRmcGZuNm83WjVKMjZXTG8vR1JMZUFRQ29pV003bkdTWUZjRXBl?=
 =?utf-8?B?Nm85M2RFSHBKY1FITXRaa3pxdHZBNEpYRjZaSStRRHB1YXJicDlibUtxNDdH?=
 =?utf-8?B?T2xIYk9Hb3hteXowYWxaREZzQm1rUmNsRVNzVWlmWktUelBxNmMrSE1tOTRD?=
 =?utf-8?B?ZFhpNjV3dzlwb2s0L2YyTURRY0FGK0JuRFlneEZMdkJ2bGdqRHpPNE8zc01Z?=
 =?utf-8?B?RzhycSsvTkczK1FhNy9keXQzL000Q1dscjVvOXJVM1V4UG9xZ2J5SWM0U3F0?=
 =?utf-8?B?akFXeDBMR21McG9DNTkzTWpNbXVJR2RGNzJLaGIzSlBzaGd5K2lBbTZoMkJC?=
 =?utf-8?B?NlBaamwxM1QybmUvcm1wTGRIbGRkNjRMV3VPWEFJOUd0dXB5L0FvOWNnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(7416005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TXRPamRuUENxUE1welBYLzVFTWJnVnRUMVRMZFk0anR1RStVOWJSNFhSaVA2?=
 =?utf-8?B?elN2MGhBM1Jkd3pwSnhVWDhiUkdZaGQvbUtNeVVTZTgrcDcydjdCSm9zSEpC?=
 =?utf-8?B?OWh4QzBhMTF5QUg1K0xEODZaQVJObTF2OTBQdm1QSHdTTVJpalZqUDREd1BG?=
 =?utf-8?B?K01DdlRSUVJZMlkzZXhYbkw0czJqKytJQ2dSZVdGeTRGdUlLajF1aTdnQ1F6?=
 =?utf-8?B?eHNCM09CdVljTDFIWkVTdWgra1Mrc2ZVQlg0RGpqdC9VN0VFcWUvK2ZPVmlV?=
 =?utf-8?B?KzUxeG5HTTZKS0ZmMlJsclZpZmVja1k1RkpxUExhcFZYQS85RzlxMFFidkxo?=
 =?utf-8?B?cWZDTWdiZjZRZU15dDlkSHhTTDNSY1RkR1ozY2pXSzY5WVgxZWgxREtsK1ZH?=
 =?utf-8?B?eUtOYkFHWHFiRDNMTkZiMjVGL2xoa2FQYldGL3BtUjBxcFBjSGRIOUxYVlBP?=
 =?utf-8?B?a0ZpZitMTHBwYkxaa0Y0Kzh0OWU0VE5kdCtLRmFuM1NvRFlyNkVZK01wWFFy?=
 =?utf-8?B?OTlCYTF1bEUzcDhBN1E1MHFYOEV6OEFESkVXTFNHSHZOajhhNWR3aC8xQjln?=
 =?utf-8?B?VHFnRHh5WXk4YzdQUU1CY25Xck9xUUo3VFJsSjUwVU9kbGxjRzZrTE90Smdn?=
 =?utf-8?B?UDVNUFdHbmFVRUc3Rk54T0ZET3RBYXdIUUJhTWRXZkVNSGNOdUlmRVpoSk8z?=
 =?utf-8?B?OUN4bVRlemcwc2wxTUNFMTdXeG01L1ErUjlGVUYwOURPRVFOY2tBN2VEWUtN?=
 =?utf-8?B?d1c5T25IWTRkdFVKa3VKUzl3N0ljT3hzUUozVlRza0UwNXNOc3dzT3czMkZq?=
 =?utf-8?B?OVhXMENKOU9rY3NTdlU2ckRMbUJhelVXbWc4Q0Z4NS9CY3ljUDNnNFlnblBw?=
 =?utf-8?B?d0tjeVBXYlpFTnlYWVplWFY1MFBGRXZJT0dseUEvTTAvM2EyK2paY3VzVFRY?=
 =?utf-8?B?Rkg0MGYwN1AvL2ptOTZpUHdLNk8zSlN3U0pkaWRnSHRWdEJGUm1MY2xhTVZP?=
 =?utf-8?B?NTZpVG1uRnl3NU96MlV6OGpDekNINDZaVnc2ZDNvdHpOUDIwWlR3RnJhT25Q?=
 =?utf-8?B?LysvMUxoaWpXcFJrSHpSeEhKVDhwNGVtN3BBTkl5UWNlQmJlWHZTeUxOaHQ1?=
 =?utf-8?B?N3VCY2ozVHRiODU2a2NiNkcrZkc5V2pzaGZvMFlVaUYwRUlsamVvTlI1dXFn?=
 =?utf-8?B?elpqUTA0M0psSG9nalQvenRkU3VKV3ZzL0l1Qkl1Q0lMRHZ5UlJpVFM0cDlN?=
 =?utf-8?B?VEx2amh6bmJSaTBpaUFMbFg0M2tmVyt4VXBBVkZPdGlSRzl3blFNVGNLeWY3?=
 =?utf-8?B?Z0orM2hYaml2K2xRdEk4eFZFNXNVNkVOdEZOeTVlM0lXNE42dTIySFV3L3RK?=
 =?utf-8?B?SW9KbVV2STlsU3NSSDF0RkI4Uml1amV5YzRKcFFqNkZNdDl5a1NBZTB0WlR0?=
 =?utf-8?B?NFdzWlpRZFVwY0QwQlBmc3FrbFNMM2x0Ty9SZndZWVduUEQ5V0lrT0ZxMXlG?=
 =?utf-8?B?TEw2Q0d3QUVYU3huYS8rZFBJWnFCazRuajRTU2hkRjYyTFNPbkJJUTVkRjFh?=
 =?utf-8?B?RHRCMFNtRElVU0ticEtwTmQvODdsa2FITXFGcURRd3UvWndRRTFGODE2Yk9O?=
 =?utf-8?B?WG01dW54UGg4ZUdNNGVFSkRJVENkbEZLZUVlbHpEbEFHeWF6aElzZks5RHhE?=
 =?utf-8?B?eVk4TElYd0tNY0tTT04zWUFLcnhLdHNzNy9tRGFsSTJyT3RkV2lwZU83V3p2?=
 =?utf-8?B?VVVLSkV0WjJlK3l6ZExrVm1DVnhTY04rK1UvNTBHcW92eVEzT0tHNXFNNlpJ?=
 =?utf-8?B?RHdoWFJwWnBHWkNJaSs1WmV4NG1PS1JveW1uaDNDS1J2eXovSDJ1dmRydjRL?=
 =?utf-8?B?a3lGSXliTWZLTWxKemxQK2U4VkZRRGV6MitMU3hZdWdPeFEzaElka21acjdK?=
 =?utf-8?B?SEswWHR3TEF5QVFobmE5R1pLRmRnSm43TmlPTDFwVUV3bTFLYm1NRURjMUlM?=
 =?utf-8?B?Y3MxVjllNGhnQ01peWRWcDhNcDhPNmZkQVlOaXRhUGVrdW1HQU9VSkxLc0hw?=
 =?utf-8?B?Y3cremp6a0paOTNLTm1nUjh4RFNFL2cyQnNWbktDanRLYWI3dGVrWGN3b1Vp?=
 =?utf-8?B?UG9UYkw0UXR4bEtOZXlIN05vZE5hV0xJckt2OWVId1c3enlmaTVySXZUcVVX?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	1U76y2NM4Gt8xyfUG13Msu/esMoDFBF/8+SMImqdra82cDLF9vJCrD3ArcSOlg4JKEJWKwdLv+pjgrC+fzmgIGHmMfbcBk2dmyPiANHuL7u0OhHI4YwLt3l+vIqJqCe9YR6RTdECTY39RzINtL1mWVcRva5k3kyJHh5CBoEYVnQLor4UDPR5XXkr7b8VoUwYay0+DkdaZ9dB04kW7fAQNRRBj+Tujmjif3q2dyC/unzCbZT9aNeOBrRJzD3si9zF1B/QZ5w/IU5/2GH2LWXhgW8IOGUg99dulFi163RzPgFil3XEUZnX3uaBHUQqrWdVC7TkwN9TdGMRi+Vuci4kHWmltLa17Tak0Ql7eFqhgFDQjOTmAgXIj83Qxmmhs+4D7sEIK/OjUxtzXEMp4+ZxOsFl5f+/x2Xk2AR3HHoi74u424tcwrCgkB6OFJU15RO1gtSEW65aZuZj74sE3HQkS7Min8XuGbloTQX3vhMzDR2Ds40OP6NUGB9rnddcG70Ssoy6yiHGaEu/uVbxkJLbPpXoa1BmXtjtOGt+ObNhO+k8J+bPnc0bTLAWpB/8Xi93GJejzE4QTKHlvNzH6Qe7fnyul1pcoIyzlBfPeXMHsdY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f090b4-c36c-4784-2f2c-08dc81520b64
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 09:14:16.0164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LIH/+ypdASzb5nw6yBMR1FZceOd2NaufGssVTJGzMIjpGtiTlDLyBMx5iHGijewB4yxNPpuMNvtdWRUIQFoJzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7462
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_05,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 spamscore=0 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405310068
X-Proofpoint-GUID: pHqA_BRyI_DnMPAOiUm1T0iBZo7dujbO
X-Proofpoint-ORIG-GUID: pHqA_BRyI_DnMPAOiUm1T0iBZo7dujbO

On 29/05/2024 06:04, Christoph Hellwig wrote:
> Remove all APIs that are unused now that sd and sr have been converted
> to the atomic queue limits API.
> 
> Signed-off-by: Christoph Hellwig<hch@lst.de>
> ---


Reviewed-by: John Garry <john.g.garry@oracle.com>

