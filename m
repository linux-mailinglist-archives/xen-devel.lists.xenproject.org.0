Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B94BC91F5C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 13:12:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174789.1499732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOxKU-0007sG-Pi; Fri, 28 Nov 2025 12:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174789.1499732; Fri, 28 Nov 2025 12:12:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOxKU-0007qW-N2; Fri, 28 Nov 2025 12:12:02 +0000
Received: by outflank-mailman (input) for mailman id 1174789;
 Fri, 28 Nov 2025 12:12:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YqkP=6E=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vOxKT-0007q7-3K
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 12:12:01 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70e21aaf-cc53-11f0-9d18-b5c5bf9af7f9;
 Fri, 28 Nov 2025 13:12:00 +0100 (CET)
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com (2603:10a6:20b:6::31)
 by DB9PR03MB8848.eurprd03.prod.outlook.com (2603:10a6:10:3dc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Fri, 28 Nov
 2025 12:11:54 +0000
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4]) by AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4%4]) with mapi id 15.20.9366.009; Fri, 28 Nov 2025
 12:11:54 +0000
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
X-Inumbo-ID: 70e21aaf-cc53-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mdf18j4w//cWe+zQdOKs78nItlLPa5J4J1DZSIl3zlBcmZyLy344O30kX4yaST52DRm4ERAlrNXSSlbUKKUpg5OQfwt2QnKbhijf6ci1PB6Cl1wpOuHiwHHsAc7/kV6lcRCAgvVFZrAaFsqOh0GvZloK+8a0jj8RhLq9SczrY51RzkLssoKsLN6o1emFGE57ym44/aZy7ZqbYit5Y9WoCoFRKYJp/OENrkCj0Fx7MbhX3Uw2+P4dj1h7oNT7DJsVxQnCDJ+DOD2oDIswr088Oy5sumKYBd1Gt8huywlJemKF6PoPEIYFTX/QoMy6Ew0svOlAJzWChGS0ffiYVC3Mgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPqdg+eQdrOripILAALVdKKBeNeUMZy0aNHikISPmqs=;
 b=c2XxgxjomDgJGfcDCcUAxpMnBt4vjUz63FjxR+/agtlB2FbVSioLiLd6nLhjhedZ9svWip5Sbh7aQHl/aK28PY/jtrZMsrXawei4PtigCfBor2hzS1bJH1TLU+o59yeq2lHPBZuae2KXHrQUxePnVzjwcEl/PMoPnuEGYDtC09zAnk4de6GeTfOMeLPtjNVZcfjutyonoowv4wtp/Y9kG0okewkU+UcCodfgh/wczNp0k5yVera6oeF0/p/UUbN33rZcuwcqb/vohxxvur22YXFkDqW0+j82t1d6YI5g55U33qcM8c/loVHobYaifY+X6MkGCwkbB2I+6B6dkc0SBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPqdg+eQdrOripILAALVdKKBeNeUMZy0aNHikISPmqs=;
 b=S0eevtm39OlRT5coQR+N1DW+eOwNaJwJ7bnjlM7hbF6dR6zUhBQMupZexHESBLoFd6jjsf3GvvG0s7FBVDFsOWV7vR8iN3f7gaPCGh9/EdWXV5mLaokgSmn/4qZxGzNXNAfmQ4EG5Yk1Fb3D7GT/PqRnOmANfWQz+jUyYJ8fvUad3Z7/jPojHMm0cPyle6iw97/OXHBydEWuUX/JzzsqH2EGZYsGeSLHj5nNwQiPhctRRyFGMsLWZKp0tdo4ZYAEyxNjzWnVZ3FvDfhxKE2XA0whOWSBSNbNM37xIZPST+PGpTF/TKsXfKWr7gXMSjtSCVPWgmkHl4WBfuU9cfZuhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <fbb420d8-499a-48f9-91d0-06469f265ff7@epam.com>
Date: Fri, 28 Nov 2025 14:11:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/domain: introduce generic functions for domain
 struct allocation and freeing
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>
References: <0a66c71356e8d6ea788022438d7a73dbff8aa5b9.1764243466.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <0a66c71356e8d6ea788022438d7a73dbff8aa5b9.1764243466.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0327.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::11) To AM6PR03MB4600.eurprd03.prod.outlook.com
 (2603:10a6:20b:6::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR03MB4600:EE_|DB9PR03MB8848:EE_
X-MS-Office365-Filtering-Correlation-Id: b058b4ee-55f7-4187-2bb4-08de2e7751ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlpIZmU2Y1VQcjljdFYwaGREVGFJVlhxNkw0TXNqemlzTngyNE1pNjNZN1k5?=
 =?utf-8?B?d0lzdFZyczhCbUl3SHczaUh2Tkh2T3YvTEtTejFzVlVra1k2emp6QnpzRVRr?=
 =?utf-8?B?MkR6amtqNlJ1S3Y5ckNFV08zZDhGNGlSMVEveWdTWTV4ZGF6SzM3bFBiYlpR?=
 =?utf-8?B?VFd6MHErTUtoSUNCU3R3VFpEMDlGRHlYUVRUUnVlU1UwejIxU3pZOE1qU0Ur?=
 =?utf-8?B?ZFZsRTF4U1M2Zk1wUy84eklpeWlxajR0SDRZMnd0SW9TL1dtWlloTWF6c25G?=
 =?utf-8?B?TGZZZ202WFZqYVdCaWpnZXZUd1BLTkE0azgySlBXWGg2dzFHRmRzc2V5ckNv?=
 =?utf-8?B?b2RVWERlTlBSWUZWR0ltVmNNa1liK3JrSXhkTU1ERUd0eWtqSmlaQ1hFWndZ?=
 =?utf-8?B?ckJjanBMYWVaSlp4Y1BOL0lrcTgrYWY2SW9odzBxSEx6RWpJeUhTQTlsT1hJ?=
 =?utf-8?B?RzhWMGQwMWF3Ymt2ZzlBbk41RUVXWEJoQTFRYzZmOHpSUWVoU1VjQmM0VTl5?=
 =?utf-8?B?NHlPNUF4M2dQR0t4M29LVkRlVTVnTUpUNjBUc2lwb0o1S3pKSmowMnUrNVlX?=
 =?utf-8?B?WDgxMGZUYTliZE42OW9GZ2tYcWRNK3ljNk5zTmk4eFhadG4vN1ErWlV6NzZS?=
 =?utf-8?B?b3hHREhwYjBsNHJqY1RsZE9Ka3ZrWEtLeGNmdGZ5RnFEVU5tQzZlazhNWUs2?=
 =?utf-8?B?STVpTUg2dTJuZXNzdTBCRDE3Z3kxbjZ5RDFCTi9xK0t2RktCSERXdEZiWjla?=
 =?utf-8?B?aDFRcklrb2t2Q0ZCOGsrUHFmUEZ2ODZiUUkvTWJlRUtEbjJJQWtYck56MnRx?=
 =?utf-8?B?ODVwS2NaNGJZV0Frd25jQTdRTitFTmsxS1FWODA2a293Wkx3dXM1b0J3TVk5?=
 =?utf-8?B?L2lmQTM0amVJUXNNa0xDeTRrTEsxelFsTXhBM243TkVSVzFBZGhDVXN4aHY1?=
 =?utf-8?B?M2FKRzBMVHNoMHJsMTM1ZE8rT3JWc09nRW1ZVVB2MzRKN0JmSWREa3c5MGZ0?=
 =?utf-8?B?UUNwbWhOeWxSMkVBdHdLM01wa1dyd25CYnNmR2lMekVmRENrdVJ3T28xVmVI?=
 =?utf-8?B?eGhtR05VQkNkR1RPYXZ0ZnVma0N3ZGgyV3Z1TUtBNUZzOWQ0WnEwTlVvTnVz?=
 =?utf-8?B?UkRvTHJHMnlHSUN1NG1HZGhkYWJBV0NRRWlYK3VwTW90WWUyYkhaWm9idEZy?=
 =?utf-8?B?VzRMTFF4VTN3ai9reEtsUnpRTUE0RmdZZWxMck1BUE92a2dQMXdGQjdWU3pE?=
 =?utf-8?B?ZTJnbDRQM0ErUjdFZDlDai8wVkFmeWV2cHpEbzFnMmk0N0dHdHV1TGRrWnZu?=
 =?utf-8?B?dGdGRWdDTVJ3RGthd3ZhZkdwT3hOZStSWFhmVENMUVFXMVV5cGJlL01yZDhu?=
 =?utf-8?B?TGVZM1RWK1JWa3VWRXJic0FVcmhwQmVFdVZnQkN2czRwdkVIT3p6d0xaaFJE?=
 =?utf-8?B?a3pHYVVUVEw2czZaWGJhNGxjUkpKcjBOcFd5TmNDdWIvWitZUGhzN3ZLRmsw?=
 =?utf-8?B?RlJ2cnBrYmVjNzhTeGtYcWI1WnBIS0hhcDJiWkpjNFpLb0N4dWdqU0VrQTJG?=
 =?utf-8?B?dThHNURHQXY0Z1VvUFJGOFhiUCs2RDhja1F6WTIvZmE1R1p4WGhqampTTmo4?=
 =?utf-8?B?ajZnM1MvR2g3QnhEa3B6V0hBUVNuNkVUaTg2NllMdmV1Y0RiS3MvV25tYlJR?=
 =?utf-8?B?YkpFZHFvWHp5T0hlaDFXd0tZMUlzY3hVY0wrZVJOVEUwSWNMU1BZRzRnRmNl?=
 =?utf-8?B?LzNYZkJLRnFaaWYvT25GZk9yWjVjRXZpRzBQdkRMakRJNDZnc0lXaFRGekhT?=
 =?utf-8?B?aVFjN1Z0R2Q5N2pDYVlRczI5S3RHaUxsVHcvcXlha3U1Tk55NVZ5ZGlTbUZZ?=
 =?utf-8?B?ZG53OHJiV0xBQWhibHFuckpRNTN1T1M1cXhJcy8rL2dhSnZ6UXBRU1p1N2JH?=
 =?utf-8?Q?ovd8PHM1mz2/uZxF31LQL6KRLJ8V9mSj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB4600.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWd4ZGpYNGYwR0NoL3lXVlBoVldkNG9yZTh3K1ZoclFDT1JRbVlEMHVhRTE5?=
 =?utf-8?B?U0Z2eUE1WnM4dkNVZDlSYWh4aVIyR2QvNjJCdjdzYmwxUTZCR3MrdEpDQVJa?=
 =?utf-8?B?ZWQ0MVJLYzZZd3hjRzJQdFhyMGxLTDhaaGZqc0dsN0tBY1FSMWE2RUFwbk53?=
 =?utf-8?B?Ly91c0tLNGEvM29pNXMwTmwrSEEzL3BiczF6Vk1MTVZJZWpYNTNoaDZoemNz?=
 =?utf-8?B?Zk45Z0NUSkt5WDErUVJYSVplcUxORHJvcm96VzB6Wnd4T09MUjBxMHBCeDJS?=
 =?utf-8?B?V0pOenFJRkNEVzZNK0ZvNXF3QWR2ejdWbk5zRitDY3V2ZVFFekoxc1FGN1FD?=
 =?utf-8?B?eGtLd2JmdFRIRmZTMFR6V0RJaXVabnlQemd2SlA1Q2E4SjdsdWl4cHladDNI?=
 =?utf-8?B?TXVJbWRNWktydzI2QTZ3OGY3eDFUcFBZY2NFV3F4MkZmdEgyaHAyV054aHVw?=
 =?utf-8?B?ZnBvN29mQzhxVDBtTlJwcEJkZTlxMm4yTlluTENOdW5KSThPOWJKdjNoWlhw?=
 =?utf-8?B?UXVyN3IwcGVDQWF5US9taUF0Ykw5K3NVUTNMYlFxaGZFVVJSdUhvbEkzV2xW?=
 =?utf-8?B?RzMzcVBGdTZJQldrWC9yaVFISXpvKzVSRzRLd1grbXgydUlNSTNES3hlQmJM?=
 =?utf-8?B?Nlk4OUZDWVVqRGFiQXRHWVgxZFBCS2ZkaDViVG8wUWtjQW5RdVRkeWpzR0Er?=
 =?utf-8?B?NEl1dWxnYXFDWnJKeTZ3RG1RSUtQZkYwc3F6SjJ4MkhaTG80VkNvbXIzaE9k?=
 =?utf-8?B?Q3NrTWlHay9GTDZuZDVCbkkrMFkrYmRkbmRjc0pFc2VHMjdZcGdmWFB6YkpF?=
 =?utf-8?B?WHU0VlQ5MXYxcXorV0p3WlcxQUV0ZjRpdHFKU3hFMHJUcEVYbXBGQlNrWFkz?=
 =?utf-8?B?QW5rQ1p4ZmZLcU00S3pCZWx5U0Z4TlpUZ210MVY1eG4wSVhJZEFZYWZPWGhp?=
 =?utf-8?B?QW84UDNMaUIvTC9YdGRxRTN2TXh6ZmNRQUx5Tnc5RFoyVVZuWnphU1JxMklu?=
 =?utf-8?B?eXZJbTc3VndWT0NLTmxhdWhHQldyZEI2K0ExWXFFVlg2OWpoTUpJellWcUk4?=
 =?utf-8?B?eXVmcTVRZ2hpbFdOcHhoWnVwclhpc1VjWHFQZHIreVB0TlFGQXc4NUpmOVNI?=
 =?utf-8?B?NHNSaklJdTdJZHZEQnNjRFY3UnVCY2Y3clhJb280VWFQTlI5UVIxdjVrR2FS?=
 =?utf-8?B?ZUlhRnJTci9adElVdmp3WVJvWEczTmJHWFQxc2lkU0RDZHBuVkk5aG90L1ps?=
 =?utf-8?B?WmE1Sk1TZXNZdFJYS3R6YUQ3VE9rVmZ5ZmlOTElFOFE1VDEzYndzV0p6N0tC?=
 =?utf-8?B?ZVRCck5oOHdCaklTSVozamNHWUhQb25YWDBaZ1NMM2x6VDlqSHVMNUlHNmxF?=
 =?utf-8?B?MlFOM0E2MmJ5UitoSXlrVGRmbXJ5NHVOUmNNWjdER2FrUHRxOE1Yd1BVMGw4?=
 =?utf-8?B?YVpxZDJFdEkzSFBmcTNQVUhBOGYwV0dCODVjSUhhTGtvMnNqajcxdGVPbGlG?=
 =?utf-8?B?amV5SmNEOEdVUUNaZTJIRC9XbGFzMVJPWlR0LzFtVWtGVXl0YjhlNTRhVFFG?=
 =?utf-8?B?RjltVUJtUFhkT1F1aWVsd2Fia2cvY0V1Z211WG5ud2owUmE0amZWSmhEV1Rl?=
 =?utf-8?B?NjhjNFZYa1RmYnpTTEhmMUJSTHRodGtNdlZFVmlLay8weE8wN1VnOTNPNUZs?=
 =?utf-8?B?WU82WHkrc1hJd2U2TkVlNTVrYlZYVExDVkZScjJmMmx5aFF5QmFacmtFQThz?=
 =?utf-8?B?clEvcWoyRzM2WmxNdjlsQTZrVC9HVzAyVFlFMkVVYTlnblNEQjArdk05V3BF?=
 =?utf-8?B?QVQ2T2JsejN0OEYrMTBlc3JNSWVCSmZobnlGYmoxbFJXQU45WHBoRWpOeVdX?=
 =?utf-8?B?T0hadFdpdmlCRm5kMUhEZFRpMWhIcHRlc0o5cHVhcG1GQnRCU25qeFZhWUV0?=
 =?utf-8?B?WGF0bVBLSzA4M2hKTUFtOXdvOHkrNk55YytOVVFqYUZCRkxmZ1dqNXlZN2Vk?=
 =?utf-8?B?cWJuOUF3alZLYVI2d054a00wV3hGMW9DRG1JNW04akU0QUlPMWJIVE1IRGNC?=
 =?utf-8?B?Tk9DOXRGUzFoN1dNakhhNS9mWjQ5ZmJ5S3IybTR5OFlRYk1hZUtleFMyYnAv?=
 =?utf-8?B?Z3pwc24yRnlibmpOcWFDZHpxNVZhM2ZtR1Z4M1FqQ2lkV2dKN2JGMGcvVDZ4?=
 =?utf-8?B?NEE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b058b4ee-55f7-4187-2bb4-08de2e7751ea
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB4600.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 12:11:54.5179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8DstI5jeyX4h02tE+SCRruoh3RnvFuLyNT0WerIhGrq8iQm9dZd2vdits70ujlif3hvimSuzv66NCLCQwMCCz/NGR7mOwNFPNUHZLp6tMYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB8848

Hi

Sorry for the late comment.

On 27.11.25 18:26, Oleksii Kurochko wrote:
> From: Roger Pau Monne <roger.pau@citrix.com>
> 
> Move x86's free_domain_struct() to common code since it is shared between
> architectures.
> 
> Move the x86 version of alloc_domain_struct() to common code as most of the
> logic is architecture-independent. To handle the remaining architectural
> differences, introduce arch_domain_struct_memflags() for x86-specific
> allocation requirements.
> 
> No functional change.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> [Introduce an arch-specific function instead of using a weak function]
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v3:
>   - s/arch_alloc_domain_struct_bits/arch_domain_struct_memflags.
>   - Make x86's arch_domain_struct_memflags() to return MEMF_bits(bits) instead
>     of bits.
>   - Move "#define arch_domain_struct_memflags arch_domain_struct_memflags"
>     and declaration of arch_domain_struct_memflags() from x86/asm/pv/domain.h
>     to x86/domain.h.
>   - Update alloc_domain_struct() to work with arch_domain_struct_memflags().
>   - s/Suggested-By/Suggested-by.
>   - CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2182821111
> ---
> Changes in v2:
> - Introduce an arch-specific function to handle differences between arch-es
>    in domain structure allocation requirements, instead of relying on a weak
>    function.
> - Move free_domain_struct() to common code.
> - Add Suggested-by: Jan Beulich <jbeulich@suse.com>.
> - Update the commit message.
> - Link to original patch:
>    https://lore.kernel.org/xen-devel/c08595dd7940b44a1392e16d4a2035b95b5c580b.1749829230.git.oleksii.kurochko@gmail.com/
> ---
>   xen/arch/arm/domain.c             | 17 -----------------
>   xen/arch/ppc/stubs.c              | 10 ----------
>   xen/arch/riscv/stubs.c            | 10 ----------
>   xen/arch/x86/domain.c             | 15 ++-------------
>   xen/arch/x86/include/asm/domain.h |  3 +++
>   xen/common/domain.c               | 22 ++++++++++++++++++++++
>   6 files changed, 27 insertions(+), 50 deletions(-)
> 

[...]

>   
>   struct vcpu *alloc_vcpu_struct(const struct domain *d)
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index 5df8c78253..386ec61745 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -12,6 +12,9 @@
>   #include <public/vcpu.h>
>   #include <public/hvm/hvm_info_table.h>
>   
> +unsigned int arch_domain_struct_memflags(void);
> +#define arch_domain_struct_memflags arch_domain_struct_memflags
> +
>   #define has_32bit_shinfo(d)    ((d)->arch.has_32bit_shinfo)
>   
>   /*
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 3b6e9471c4..2e8d74cbd9 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -799,6 +799,28 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>       return arch_sanitise_domain_config(config);
>   }
>   
> +struct domain *alloc_domain_struct(void)
> +{
> +#ifndef arch_domain_struct_memflags
> +# define arch_domain_struct_memflags() 0
> +#endif

Is it really the right way to
hide part of common interface in common code instead of header?


> +
> +    struct domain *d;
> +
> +    BUILD_BUG_ON(sizeof(*d) > PAGE_SIZE);
> +
> +    d = alloc_xenheap_pages(0, arch_domain_struct_memflags());
> +    if ( d != NULL )
> +        clear_page(d);
> +
> +    return d;
> +}
> +
> +void free_domain_struct(struct domain *d)
> +{
> +    free_xenheap_page(d);
> +}
> +
>   struct domain *domain_create(domid_t domid,
>                                struct xen_domctl_createdomain *config,
>                                unsigned int flags)

-- 
Best regards,
-grygorii


