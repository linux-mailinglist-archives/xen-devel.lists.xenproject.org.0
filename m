Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDEXBW96mGnlJAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 16:14:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7593F168CE0
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 16:14:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237252.1539632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtSDI-0005Te-C9; Fri, 20 Feb 2026 15:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237252.1539632; Fri, 20 Feb 2026 15:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtSDI-0005R5-9K; Fri, 20 Feb 2026 15:14:40 +0000
Received: by outflank-mailman (input) for mailman id 1237252;
 Fri, 20 Feb 2026 15:14:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3rFK=AY=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vtSDG-0005QV-TV
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 15:14:38 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id deb21a2d-0e6e-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 16:14:38 +0100 (CET)
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by MN6PR03MB7669.namprd03.prod.outlook.com (2603:10b6:208:4f7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 15:14:34 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%5]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 15:14:34 +0000
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
X-Inumbo-ID: deb21a2d-0e6e-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3AadSxYLqie4DyfUb6UAHUy5TUleKm+dlSSy7wyrqV81AZrRWqXeC0rxG6PdHk974Uvfl7Vi1cTeuBRHefHKQuwoUZuGRoLNfkMpIgNwx4cJYebkEn/fd5P3chJ21XSlpOJPBrkIVN8i/PWp3DaQJzIqGN+5D1orRspqjBx+s8z9wQB7egrGbNZhsyZZwzwEy1SiaKx7C7jbYsuD7BG+CtCVCxNZxM0vJg85Au4FKZ9EL6Qdu1U8+seD7AqXcBk3xfOTjPglzfFtnU/bb+IJcf2WCSlVK5s/lz5Nmqfr1adT+dBEe8+TOb7MwDW2xPkHz+s+3P40xeztFBOLLXxHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLqNqelaA8nRP3SfuKZEN0FkjhVEzjTdCxS3OB1A6iA=;
 b=atCFaVdHOSmI0soYzbE9qHULnZOsIFJJXoKH7X26rf4aabknpwvEex5Vj92i5qzohPNRwz93qJUdT5Cuhx2JZtfHOxKTkAiV7bYCqR8limsYZcbuzDMlDZO1pmMHCuqcdoRsU+TtT3s3fqIT9mrVaJcd+C4zRnoP07ZZsujjcfqTR+1fkXrYVndLe5OC5hUxJMFCp1k4SIzEwpATyHbaj9+9+zrARpqlWTtrabFonyfJLonMYUiTjVbRfGc88keZhJ7ua2wC8QPfiq6/RgZjrEzSYWnq9CZ0vxav6wS0D3ein6cVKx8r7gvl+1dkxPBDjsBsHTn/xr9pKjLpLuyLEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLqNqelaA8nRP3SfuKZEN0FkjhVEzjTdCxS3OB1A6iA=;
 b=MJ77Xf5vqEVsdrxZKntCW+SCSaC6Fr8Xh79kzwP4Pv1jnvuF4SHXN1YaQo50qWw6EqPIfu9rMRkBJuV/K2+eOrFA+fD+GpOC2ZnLpsYfZR5zVoWUl0K4If8MtjmnVcxazAd0y7u7CusfUfcBc0B5bAIhcWuOGCh2ti9oi2Px6kQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <82877022-7d25-431c-838a-2ff5b2c0a008@citrix.com>
Date: Fri, 20 Feb 2026 15:14:31 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v3 09/12] x86/shadow: drop is_hvm_...() where easily
 possible
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
 <ebf7a96c-8529-b238-f9bf-750cf42312f9@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <ebf7a96c-8529-b238-f9bf-750cf42312f9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0011.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::7) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|MN6PR03MB7669:EE_
X-MS-Office365-Filtering-Correlation-Id: 498ff4b3-c4d1-4f01-164d-08de7092c173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTZCcUR4MXJOdG1ZMGkwZm82UUhPbGVESGVTeFZ5dlNnT0FtRUwvMzIyMlBD?=
 =?utf-8?B?M21lTmpBRkh0ZnlNcllnSnZvNEJBQXdvSytEcFlDUnFUWDhHMnZqcFd0YlhJ?=
 =?utf-8?B?OERlODlkK25Ca1JKTlRDNWlCdHlCVm9QRWhUZXA1UmFGZEpOdUNneXNCNTRx?=
 =?utf-8?B?RDV2ZjNZZENBeC9xb3N5d0s0YnlOMGM0RlJnZHJBSmhVUG9ab1FiNHlINnNO?=
 =?utf-8?B?cjJaY0lxcjhDTFlLdFRaN0tTeFBYaVhuMzhmVnFCVE5ReHJnYlc1REFZdGtH?=
 =?utf-8?B?enNUM1VaR1RyUVlxR0xXWWp1cmZLZ21hdHZtcmJYc1lSYzBkVEEzYmRXVWkr?=
 =?utf-8?B?cUsvb2V1MVFMWW5WWWVrV0kzOGNrWUdLYklqMm1Ddm9RbFpTOWlFcWZZMlpQ?=
 =?utf-8?B?cW5zai8wbjVPZXBqVlBOcnhEWDlvUEFjZHhqRTc2ZVlNZmtyM2RxRnlqOWpQ?=
 =?utf-8?B?WkdWbkdjY1JsRkY4NlpaQTg2dnRxdHpWb1RhbFVCMW1FZ05vb3g5ZTBVTUlk?=
 =?utf-8?B?TnFsdURUM1g4dWtoeDRNVmF3bDNRMmJ0S3lmdUNQVGxUVGlieVNMcXhSSWRM?=
 =?utf-8?B?a2cydkhpUFNVYU5ZYzQxOCtMcXFlZnY2aEtpU01BZ0FyQkNaVGE5U2dNNDRC?=
 =?utf-8?B?Zkh0U2dseUltTEE3N3o4a1JxWlRTWGdkRklOTndXUmRGeTVnNGRxUnJtTysx?=
 =?utf-8?B?U2d6QW8rYVlJSUNLYzFQbUV4azZTaTIzVmVlYkhOOHFxdU5jV0srby9tbG9y?=
 =?utf-8?B?NW9Pb1F2NFZIZEFBYlJ6bk9xRHEzOFJqQ29BME40N0t5Mkg1dVNIYnhCSkkw?=
 =?utf-8?B?RkVkOHU0TkYrZWZ0WWFZTmp0eERYYXdyMGNUSkxiaWhZYkFUTFFibnIwc3E3?=
 =?utf-8?B?L0VMaWNZOXV1Q2RqbFlUVUYzZFdCdnBwc2dSWUJRMXVzSFBhU01NeWptMS9S?=
 =?utf-8?B?c0xoRWttOUZxUC9xdHJJYlV0Mnc3Z3U1TG41K1BzeURBei96Q2M2OENVNW9p?=
 =?utf-8?B?ZlBsdko5VjVnZzEyblhNNlEyME9MVjM4QXhTQmxPRlVYYXdrRFNtYkFQa05x?=
 =?utf-8?B?eVJsa1N2WG8valg3MFJaTVc2ZDdCMjZCNVRUU0FZdXA1ald4c3JGWlNSMmRJ?=
 =?utf-8?B?TGJRTHV1UXdKNDZjd0ovN3NVbldWa1F2SFlnSTBGMUNxNGluZ1ZNUERYNldv?=
 =?utf-8?B?UzVUZTlTT05rcTlSeVlCV0kwam1xTkp3Yk14NnA3UzNMbkFsNTJlTWRwZ1Y2?=
 =?utf-8?B?YVFUK2p6MXp2THhsMWgwTHg1dy9PT1pVaGJVcVdMeVFSQ3hpdVNUZE1CQWMy?=
 =?utf-8?B?Nm9paVVWMmtSd2tNUVdTUHF0aWg2QUI0cVpGSlo4bkJ0UTRPbkJud1Vta2FZ?=
 =?utf-8?B?cDJEQWlVaU4yelJJRkVFenlUNmF1cUtaUGpuSnk4L0NJYVR1K0VlemVOcHlu?=
 =?utf-8?B?aVEycGQ4Y08wL3Q4VGE5blg1Z1VIUmY4OWxpbFBVb3RucmpucG5Pb3ZYRUtZ?=
 =?utf-8?B?RlJNWnhjQjV0YjBlaHBzWWJhUEJjOVhleWtDc0JxSHgzR1JjM0NZVUhGOUYv?=
 =?utf-8?B?MHhGQlJDZFluaFRtekVGZmZYcERNbERhU0toN1g0N1dqQ0RBNUF3VmtjNlov?=
 =?utf-8?B?L1pjSG9SeUk1TmtJTVlNRkRtdktwbkhSK0NXN0tTUE50WDdVWEpBTmVVeEV4?=
 =?utf-8?B?R0FGdklueGlvNm5PNWZSWmova05Hd3IwQ0tXTkhVclZkTXoxTi9ZdW9HWnBw?=
 =?utf-8?B?c3Z0TUNUNTVnOE1FN0FqTzFhQTIyRUFGdXBBeTNOU1hBUTVnLzdsZHY3d09a?=
 =?utf-8?B?NzVxUStnYk1aV3hWcHU1OHdMVTF1cTVSdXV6TWNaZEp1RnM1YnkyU0kyc0ly?=
 =?utf-8?B?V3NrSnZERWtycFNjR2FCSXF4Zkd3d2ZIbUw1RUUybmJFQ2ZWVHpuVlVvN3Ba?=
 =?utf-8?B?dEFpK2wxOFNmR2dWODIyNDRNcnBYTVJPanVMRUgyc295aytBelFERlpJbEU4?=
 =?utf-8?B?bWVWTnNCWVlWZmE5UXExZnRJTXpTenVZUXZPUWowZmdRd1hYakNyRlBDMTZE?=
 =?utf-8?B?TzBkVGZEVU1HQjZOMWhxOUNSckxVK2VaeHFiTElxc0h4Mld6RE14MGF4MXVx?=
 =?utf-8?Q?UyNo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlMxVWM2NDNnaFNZTlVOYnRVSXRaeUhNOFVFZEIrRzBjMTI3cCtIa1Uzb0o5?=
 =?utf-8?B?QVhFODFDamczUnJyeEtITDArZDU4ZGtwUVVJN05EN1ZUYUZvVGNhVDVaRHpH?=
 =?utf-8?B?Rjg3MWxLYjc5ZGRpdE5ZLzZnSHNYa2xFN3JqRmdPTzFSWHVFbXBLYVdGclBX?=
 =?utf-8?B?VWpqSmNkMkt1a2NyWG44bERkNXNXa0ZmU1c5R2hOU3NmcnRoZFNaVFpZeFk5?=
 =?utf-8?B?MzRaa0xnZTVqUUxQS1d5UmxSNjJnbVRlZHBNbFUwc20xNXV1aHp5alRidWcv?=
 =?utf-8?B?N202dlFGSGVUSFp3cDJWcjhQc0JJcjYyVkR2YTJNcUVwVnJidW9pQWg5M0lX?=
 =?utf-8?B?cmJXZmtsaEJZbFR4NnRqbzZWUXptWHhodUVhRit6dWZDWHd1KzBmMnVpNW1D?=
 =?utf-8?B?eWV5UXhQVXBMY2djbldIZ0hycXBXMXp4Zm53Z3pIdHBWcXZZeWxnZlk4Y3Ra?=
 =?utf-8?B?MmJycG5GOEF4Q0pmaVJVMiszd1l1WStJeC9VVFVVMTN4UHdHYmlKYitNRERL?=
 =?utf-8?B?bTJ1V3IwbWdFOWpQOEdaSWVJRDZDeWxXeTRVRUNKNEZ4bFlreGRZSCsxcVhn?=
 =?utf-8?B?SGMxTFV1OUdlczFFZS8zZHJ2ZHJGVEJCQkxHTEgzZW1sVHc0c0NFcW9qc3Fr?=
 =?utf-8?B?bWdZN1dDWVppY0MrSG9uZlZmWkY1ZzA2QkM4M2daVmpxMFl3cDFWdVM4NzJv?=
 =?utf-8?B?bHFzWEF0UHR1VkpyWmxIdStvcHRwYXhwcGtkUWJVZWRqOXIyMHluNUR2b1Jw?=
 =?utf-8?B?WlU1b1hoUDRORHB3VzZaQXlmM3ViZWRkSjI1c2dLZk9GSnE5amZmTG1ZOU5N?=
 =?utf-8?B?b1ptMlJBNG9UY3R6Z05hdC9qMm1NOWhoWTBTVHJXWFNaSmRsRDNMdkNsZUNE?=
 =?utf-8?B?K0JWRDZtSndOcytGVXI4Kzhzb2FlNEI1a09NcXZUVWNOZi9vQ1llNzBmdENm?=
 =?utf-8?B?T2R4STU1Q1lSczNZSFo2T0c4QkY5UnBKVmUzaE02Zk1EU1BrWDk2bXl6ZjlF?=
 =?utf-8?B?TmtMbllFYS9mb3JZamZRQUV2aEI3UVRBZFV4a012QURKcjZmWnhGREJ4NUk5?=
 =?utf-8?B?bldLZExLMkE1YzlvcnQwaFRKT1NWenpId3dXL0RLYVZ6SXFPWHVJZDh2Wi81?=
 =?utf-8?B?bEY2aTBTbGkzaVN3NEEvb2FzcDBLUnF6WHBrdlFHNWsrdDdhVE1GNEtTVjV3?=
 =?utf-8?B?Q3JGZXRaR1lsaGF6MmZLcG02UFBaQWUycTVpUGc3eVRwQjFVR3JLUVVOTCtq?=
 =?utf-8?B?bGdyU3MwZDFTbkhJTWZKbnNiMDdyZi9MTXhDeXh3bGh0RUtrV1ZncC84M2FU?=
 =?utf-8?B?ZHJqZFNOU1BCQVBOY3Axbmg4QitMRittRGhxWXdQbW05cmp2MnkzdEZXQVlG?=
 =?utf-8?B?dUxMd3BsSU9EUjJ1cHdLaHpjdUlXMUZ2ak9tMFdVNkRWVm0yOFhKS3UwM25z?=
 =?utf-8?B?eHM1a2NTR1ZKSUxsYXByNHBMQXFuV0wyelVyTTJaamt5U1ZJMGF2MmtmVUE0?=
 =?utf-8?B?eS9ERlhZNFpiZ2diRkEreC9sNmcvbXRITGd6VVJ5dmY1S25KM2xsMHZTSEJM?=
 =?utf-8?B?QWJRZlF0enMyRXFZMERkQ2NqcEZld1dSWFZsUTF6cEFnSVRmTnZrVmVPc2Nh?=
 =?utf-8?B?ZVJNU2tLVlFVVEJvd0loemcvcnpoNnlBL3UxL1Q1Wk1SekczVmdEMnVkYVRl?=
 =?utf-8?B?YTdHZCtEeCt4UHoxN2R2eURUSEhJQVVHMWlJSFlJbXplODUycU5vWlh1L0Nr?=
 =?utf-8?B?RzZQOUxnUENVOXFOYTcrbThYalNQajl4ZVRydkcrZFNteDZVRThTZG5mR2dh?=
 =?utf-8?B?OGZ5MkxpWURKWEd1bmlqRTVZOWVmUzgvSFc0M3pxSys2dGdrNEtPa0xjL0Q4?=
 =?utf-8?B?MnhONXh5Z3RwVHBGSkpkSzladVc2dXJISDJlUm5JSVJrUjNKeEsyd3IwVnAv?=
 =?utf-8?B?c1JzOE1GR2VRa09vNnhtOEN6allXd3VsdEYvWHBGSmxMUjczUm1PTVNCZlUy?=
 =?utf-8?B?eXNGRGN0VjAvSVRzYVhUNTdGODY3M2FPWlJVMzRUcWw4Vm14U2MrOHZzVUhs?=
 =?utf-8?B?NDdDZ0lWbjZyVk1KUlA2YXpnbzBiZ3YrNUhmL29FNFdCcEswdjRlUVlyQVNw?=
 =?utf-8?B?OG4zbjU4RHZuWjByVDZaeFJoWFpQbjBiYVJiMXFCZWtTbWR2RlNkbGZDOXBK?=
 =?utf-8?B?cnROZ0NoMGlxdC96SHE5TVNYZDdiTW1ieFlxNjk0cnUyYW9NUTFmL1R5QlA3?=
 =?utf-8?B?YkE2cmdSY2g3SStRS2s3WkdWM2MwcDJMeUpLeGRsaForZGFWWHpuVXBvRys2?=
 =?utf-8?B?SnUzc3VESGJ6OVRCSlZQZS9FeEtBem9heW1CeDkrV1FEZERFdnNQUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 498ff4b3-c4d1-4f01-164d-08de7092c173
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 15:14:34.6950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ORiGCS9j+yZIRqLmqaqb7zAt1+q/qBZCuHBcmTO2sLP6BrBTZ4wahEV/y/uypM1N7qWwcOmxwFrI0iq8g1NqbP10s5ClZ2YD1VYqKm6Ww74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7669
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:wl@xen.org,m:roger.pau@citrix.com,m:tim@xen.org,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7593F168CE0
X-Rspamd-Action: no action

On 16/05/2023 8:41 am, Jan Beulich wrote:
> Emulation related functions are involved in HVM handling only

I think this wants clarifying a little.  *These* emulation functions are
only used by HVM.

pv/ro-page-fault.c does have emulation for PV guests, but uses
paging_{write,cmpxchg}_guest_entry() to enter into the shadow code.

> , and in
> some cases they even invoke such checks after having already done things
> which are valid for HVM domains only. OOS active also implies HVM. In
> sh_remove_all_mappings() one of the two checks is redundant with an
> earlier paging_mode_external() one (the other, however, needs to stay).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Preferably with the commit message tweaked, Acked-by: Andrew Cooper
<andrew.cooper3@citrix.com>


