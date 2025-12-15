Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89708CBF825
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 20:17:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187564.1508927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVE4B-0006ya-Oc; Mon, 15 Dec 2025 19:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187564.1508927; Mon, 15 Dec 2025 19:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVE4B-0006wQ-Lt; Mon, 15 Dec 2025 19:17:07 +0000
Received: by outflank-mailman (input) for mailman id 1187564;
 Mon, 15 Dec 2025 19:17:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6GmU=6V=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1vVE4A-0006wK-E7
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 19:17:06 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2b71a54-d9ea-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 20:17:03 +0100 (CET)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BFJC4R52829840; Mon, 15 Dec 2025 19:16:29 GMT
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b0xx2amsp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Dec 2025 19:16:29 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 5BFIu3H1016271; Mon, 15 Dec 2025 19:16:28 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11013016.outbound.protection.outlook.com
 [40.93.196.16])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4b0xkjur5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Dec 2025 19:16:28 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by SA1PR10MB997714.namprd10.prod.outlook.com (2603:10b6:806:4be::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 19:16:26 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::312:449b:788f:ae0e]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::312:449b:788f:ae0e%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 19:16:25 +0000
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
X-Inumbo-ID: a2b71a54-d9ea-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=NVvlulGnb00WGz8Xc+pdA69EVbuXg0CXQLYZMVrzRRs=; b=
	gzrz3+YoeRRzlokv7uPI87yz9VgBfM9qqWKVCZZeDG+UiV88OLtMcVPxZ+ii3j3B
	hnqUUQq3DLRM5/FlZOsLuqs332ZJ7DU4ywx3fDv9dPup2jhooOq7IXBc7yB2pFrf
	fhExo8DIJwZIXA3KBZSRahRgVKZ7r72wEIcNupsGQIdJRHpeZWsxvyeMRGLIs9MM
	+k1u2rG1ihjXrDOqk8iQV8bI8y4K81xau9pd0YxhH4Qgv4Rcqwll2hfCZUmiBp++
	zvCfy5JcC21aIjc34VI5Ev2Twvi8fG5An7wEb0WWLOGFbpj1UuxEA6VB3Rbme/xC
	hT9q8x/k0QRW2iuA3rG6oA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=im82GQ3UbkVi+ymL0ZbhBjHRXswHFT8SJiD70aXos3Gj6xK6seagwt0bsRWrhB5P6hcXZ0Ceh3bDI0jbTCobOu6fzecGN/wRsPi/ft+pBIa3Yg8NSI1nkmjnc8EBUOPaLdjWGnbix2M29dX35u2unq4w5nh2Jr2vapqG2IkKKhOyKFybn9pRxWzKHvzrS4nyIrWzbHl5mwhiCXywBiHpHwf+IkM1y7fV1xu01vCBtwT23U32rq55zxN/BK/oOJgQRtM+CoffqQCnTrT3t+YcUoiXkIb9LvPnphScqybpImBV3YvH/vpF31g03s3/pYBXRHSv8bsGshSB0dtdWsPzYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVvlulGnb00WGz8Xc+pdA69EVbuXg0CXQLYZMVrzRRs=;
 b=RgA+ERlbg9Jn7Gafqm7aCf/IFA4+cHL4eZaleU+0jNSovnFdul6c5IJ7rREj1sTVhPE4DTe68M2qwo/e1TGW+txfx/W+nRu1MtLJnt1IfmB310PnBSWHZceeFCU2PCR9a0uWgLd10XKAn9iVRmWlHmD93O4+zp+W8klMrDSJn2R0h2yzK69YXOdm76P+KFMYy/q1aHJEsaXX4cZkDCC0tnvJ9/wPOCqd7uknk01OR8R4nkmn7Q57Sgdcvz6EqZncFG/YdiCny0K1GIn7S+0BYjjKymrrtzUji35M7G0SJzS2XUSngtFIiSbUmVIyhRX+uIH89RELkLN5mB14TOtbPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVvlulGnb00WGz8Xc+pdA69EVbuXg0CXQLYZMVrzRRs=;
 b=zT53sqh2Zio7KDnveAc7G2lBF3U4CkVBvKTfm1YwPS/QS6ffUWi/U7yu/Hj2MtmRaA6tNu26JXOcLesvEiHytM092wsjSUYkNy94D4TWJCddbCZ95R9XdbMKMoJjxagsW7M779vCR9SVIdnjLAfmh9o0IcgxFzax9rc6E2LX0JA=
Message-ID: <62b8753a-8dfa-461d-b81e-d7a605c7ee82@oracle.com>
Date: Mon, 15 Dec 2025 14:16:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/21] x86/xen: Drop xen_mmu_ops
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
        x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, xen-devel@lists.xenproject.org
References: <20251127070844.21919-1-jgross@suse.com>
 <20251127070844.21919-18-jgross@suse.com>
Content-Language: en-US
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20251127070844.21919-18-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::24) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5009:EE_|SA1PR10MB997714:EE_
X-MS-Office365-Filtering-Correlation-Id: 72b4d673-c17f-4fe2-73f7-08de3c0e7094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WU1iRDBhMTRyTTlIQzgxZkVUSXdKcFE3OERRMzcrMEpxRVJsRUl4QlFpZzlj?=
 =?utf-8?B?STRsaU9OY2xOam5kaUR3RWpaazZUT3lldGI2dUdsbG90K3cyajJ5OGhWTUZK?=
 =?utf-8?B?MjNBRzlyRlFGTUNoNFJyQUdOTkZGcWxNSCtnTGNhUldqUjVQb2xVbDF2WEZ2?=
 =?utf-8?B?bjJHbnFEQjF6NU9ZSFlvL0kwMzYzbDRCNDhTVXRPaFFzN2k4bVlad0IxRFlK?=
 =?utf-8?B?Z0xYejN5RXdWc2o0cHA4bzV5TVQ0QjRzMURUZys0OFZLaEVsdnEvbFJDdExz?=
 =?utf-8?B?dUl4cFFaTU5xMlVteUZmMytkWWJsZDdHNWZPRktyeTQ4SzBqczhWanhhMCth?=
 =?utf-8?B?WHVjbG5Wc3pVY1Q2bFRDaEF2K3ZHSTJzQVdlWVdZUDdGcEk4a09qNEJmTzFE?=
 =?utf-8?B?Ly9qd3ZRZk5WZTREMGx6NDFNbXZockMxY0FoZGV0L1NrUTZLb2xFSXA1RHJK?=
 =?utf-8?B?bDJFZ1NTcFdXOUdRUTBJTEhTYVJhWWFSRUtqeWpRaWlKcE0xSWgwUEZmbVkz?=
 =?utf-8?B?bFAzOUk4SG8yYmFqS3o3Zld6aVFmWXBQSnhsSHlGRkxwdjErVXRLSzhNeC9u?=
 =?utf-8?B?MHBnMnZlUVZFMVZMV2YwKy9vOUpKV09OUmZvelNmTjZ0YlVhci9hZHI4YkVV?=
 =?utf-8?B?Sldmd3lUK29jb2RlOWw4WE9nRTRldUF2anh3czRLUWtFNUVTdGFPbVdVNFR5?=
 =?utf-8?B?WDU0TDNhUjZIYTlVVDRyNDNJdGpDcE1RbEUxYlpNZGw0UUZJOE1TU3dBNnBP?=
 =?utf-8?B?WGliU0VwT2VYZVVlRU44bVMzUU05Uk5iWnB2cTUzN0VDdUV2alFHTHVQTWRG?=
 =?utf-8?B?V2VpeGhVTmhWMXdnZHJsSGNxaTkzWUZ5UFJFTmkvUFhVWFJJalp6NEpvNEow?=
 =?utf-8?B?Z3BEN1FTbmRMZlBmR09PYjgzRGU2MTZXMnpLVDBMN2cyakNteXUyRGU0MzJs?=
 =?utf-8?B?YVJZYzJJMVFGdndoMlhGWDVXOWJGOGxvTm1tUitQODVRbFBOSlNUL1oyeUhO?=
 =?utf-8?B?MVg4aUdadXR6dFNKbDN6OS90UGhBbFZsc3R5SEFxQU1iajlNamNuL0FaeUh2?=
 =?utf-8?B?cGdVZWoxRnZsZkVoUlRnWTdCMWF5cG5TS3lGY2ozLzB0aEN5bSt3ek1GU2VN?=
 =?utf-8?B?TE9YWEUvWEZkaWRDWktlemp6eFUxZFRBaExTaEVBamxpb2VZSFVSN1U4alFh?=
 =?utf-8?B?RGZpTVRaV3gxeVpkUVFwdUprc1JmWjBnYkJOVkluT1dBNmJMMUxpbEM4T1dM?=
 =?utf-8?B?dnR5Y1QrN0ZWdnd4TlhiZndTRy9MRGtWSWU4SnhBR2JJK1BMVC9QenhnS2xD?=
 =?utf-8?B?REtMVFNyQ2R2cHd3Skc3ZUkyL1J2bTBMRlM5KzVOSUVkQXBCdG9wNTNiSWZJ?=
 =?utf-8?B?Z3ZDa0VEMWFETi9JYkNudWdCRlR3VkdyZG5FY1g3Y2ZUWXdUSU9qQ0J4Y3d6?=
 =?utf-8?B?dEFOdzdpTUhvRFVkNjhKdER2R0ZNWWlhUnVMUUZ1ZSs3dzdseUlvVDY5VW5p?=
 =?utf-8?B?cGVPOFdqSEpHTFhMK1JkMUVRMjd0elVPTW5rR3I1L2djL2hwdGhMNyt4Yk82?=
 =?utf-8?B?aE1DT0FZUUFNcFFMbXBpUGRnOWk3aEoySkprbzJnWGRlU053OVJlL293RjVz?=
 =?utf-8?B?Z2hUZnRtN1FQVTBzajFvSURDbkUwa29USkFBb29xTk1MKzk5czZqQVQrY3B6?=
 =?utf-8?B?aE1jMEM1NDRMN0pscTlLTy9XT2pHM2MyRW5EcUM1TGd0RVFwUVN4OTVrdDdM?=
 =?utf-8?B?MkxHMm1UN3lMQm5Xa0daTWJsTTU3NzlhNmVQOGk3ODZFZGxFejJ0TTNZNlRz?=
 =?utf-8?B?LzBMSng1ZHp4VW5rMUxJT2hSY0tzR2VIWHBkNEt6bktzcWZESUl0emp3Uklx?=
 =?utf-8?B?cDh6SUU0VlRTbFhOOFVFcVhKa29PT3dOWWd4ZUxxZDJBT1hzTWxtc0RpazVw?=
 =?utf-8?Q?skjZ+IPNOzo5BJDKCPtVANpiTeJUcJaw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUlHeVBKNytGUGpqbkRJd2tNNGZEQ2FVdC9idDU1TUJFZnI4clVqVTJrSm9B?=
 =?utf-8?B?VTJBaGxQTkV5RG5BNmQ2N0lnVGlyTHFiYVBnYzJzM2NZSXl4aHZSY1dtTUJ2?=
 =?utf-8?B?NEFFMG1VUnJWNlhFZDhxclo2TXFZY01OYytYRjlMYUpiZDY2Zk5DdlFVZnB5?=
 =?utf-8?B?dGpBOExSUjFTdTNuWjNubVdzUWxJNmR1RXFEaXJLcTk2VlA3Z0tEcU5panRo?=
 =?utf-8?B?S3dSc1JKQTBML2lScjBrTG52NFk0UmdmQ1U0NFM5SFdpQnVmMm52YldPQXdL?=
 =?utf-8?B?QzhRenNjTGl1S0VOQWtBWGtKQk1nWUN0RE40RUdZS0xVOEwwbVVSTmZoRHJL?=
 =?utf-8?B?QWYvejc4bGlJM1g2Sm9tREN6K3MzYjVZNW04eHA4QkNLR3d2ZUhvTVc5TXRS?=
 =?utf-8?B?U2VSS2xRNUR4bFNWUkRQQUVxZllYSGQ2KzUxY1RZbk9tclpvenN3ZXVnamdo?=
 =?utf-8?B?WFlIV3BHUFdFNE5TSFQ2Nnd6TFV6SjZZOGpqUXhlSFhHMGFwYTFreWJQbk5E?=
 =?utf-8?B?bEZpY3FOeWZGNk5CNnFTQkw0T3NGbmhFYlMyMEE4OExIaS8rUTE5MFBVem13?=
 =?utf-8?B?SDUzL0k5RC9CeXpTNGQwc0dua08yQ1I2N3I4MW9YelNicXhjUGQ0VUd2UnJM?=
 =?utf-8?B?Vzl5VjIxWFlQd1diaThBTWFTWHBPeHhQaDkzY3JqWnI2VHVWeUpFN0RIMFZm?=
 =?utf-8?B?bUJRNkdPUGpXdnFsQllHM05ON2djZDhMVG83ZGh6S0V2TEs0Wm9yMFpvN0Ew?=
 =?utf-8?B?USs4ZjNweGxzSnBNajdiSHNRL3JsRjlTc1lzYUZWR0o5NWkrYU1QY2FiQkov?=
 =?utf-8?B?cUtjaHROK3I5WG9UaGRLVkNQeFdqejVCaGlURU9QdVQ1dmorSy9wUGhUQnVO?=
 =?utf-8?B?L0NzNkhDdFZBR2dYbkdtWXdHYnZvL2ZDdFNLeG9FS0p2V0svalhCL3N4dU5N?=
 =?utf-8?B?bkZrdkxDOGVoWWZxK29PV1RjVHAwZlNsV1VXc2cxMnNhdE56WWRyemhhcGw0?=
 =?utf-8?B?M1BXT2xCMWJmRTR5YW9Md09OL2J3YytvZEZNeGp0aTlhQmpSOEtCc2xMYkRl?=
 =?utf-8?B?NXV1OHFjZkY4Yi9tK0s0YmZRUVdIZlJqTWovdzN1aXBZT3crT0VDcGc1RlF2?=
 =?utf-8?B?SlVyWjF3RE9lRWtiWGowVWVwV1VJRTE0UXlRbE5GN0NnZlY5NkZKRjJVellt?=
 =?utf-8?B?N3FmV2xnOHpvNzV4VUNYTkk0ZVowRUptaGdOZWlNUDUvZFVwTnVOci9KSHcx?=
 =?utf-8?B?ZW9iUmZkSlZXSVlQN0l3dTVMdWFUYzFWbmNKMW04cnB4S214MEk0d09LNGZL?=
 =?utf-8?B?VS9aY3JXZjZkUVJHT2xJWmNGc1JZVnV0aXNZcmdBUzh0SWdsSENNbU1iRkds?=
 =?utf-8?B?bWFoQ0FleW4wMUF3cXFsVGdseS9VNHJOamIzUkhTSE04eDg2bkVjUUdSU0FY?=
 =?utf-8?B?T2NNYjRWcXh4ZXgxQmd6MW1lWC9jWWlWdnAwYU5rVXdES0ZDVnlrbVRXTitq?=
 =?utf-8?B?c08ycG9PN1B2bC9KaE0wTXhuclB1eDMzOXE3dlZoRnhJL2RvZHRVbDJaUzBu?=
 =?utf-8?B?QjdaRGFWdk1oTWdXbUo4TWxlYzlxRVJ4VE01OWN5WXZDN2tzakd2NTBBWU4z?=
 =?utf-8?B?Tk55M1ZTUGZDS2ZLRmtZSHlNUUZQRGJHMTFoemZ1eXMzc09VL2FxbFlHK0pi?=
 =?utf-8?B?MkJwT0ZSRWZwbkNZVlhZYVl0MDkyTE10S3phZGJrZGZoTm9ONGdFQ01UK0ht?=
 =?utf-8?B?L01MMFZPVnpab1luUFdGbFJZdXc3RUVSNExvVE9KeDYrVGdFL2pvREtidVBp?=
 =?utf-8?B?bmVDT3ZNRmo1Vys2QUNBSUxFcVJjNFVjUU1wSlNhUUJiK0VXZTk2ZDVHcnlU?=
 =?utf-8?B?bFg2cDJ4WnV6NFBSZXVLT3k2WmhyQXJIYWltd2tMOFhLNE9nTkVZdW5CUUZG?=
 =?utf-8?B?TFY3QVlhOGJmSHBIU0hLbmoreEZOalZrZDZpd3FYYW5VaFpQVEV2RHJoMjdx?=
 =?utf-8?B?SjNmaDFoUUU2NlhVZS9BdDg2TzV0UmNPS1ZETEorVGRzR0MwMTYrNnV4emlU?=
 =?utf-8?B?UnloeldWTGdTcjhmai9KQkFtL24yMWZQTUxIRTZTUTgzbnAzVStHR0Q0WG95?=
 =?utf-8?B?UCtrMW5BbzNvckUzWDhDaEk1UGx2VzNWNEtVSjJOTENkNWpXVVRUYUdZVWJY?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2Dhwxd/b3NjYDOXQ2xEXQVWPX7vVheRksaZYLNCWFXuxXAKRLiDgMY+j4Z3ems+tSGui8zvV8gxZWvod4jocLeKhxIpo5O2SBjSLGi/W9HYfge0HutrBQftRS8JLznGsk5HpeLmCR9ZGRUooC71cfknJfUzX1jm9GyJpddGflPiTmBiWvCFXlT0jMmClOsBOmKHm3NUx9odEUDJGlkJuOwv7hZvSNMu8dJF7iP2s7scBznnNtJ0uevdAbXXJUHh9aF7XdqjSgZaGUEnoFTtTLF9MJFN9rZC6rwm/p+hCPBXo02CIKQbuJrGgUX6YXhfCjvQHSDvVoh+Hp1y4ZAJEruLtT717ALWZultGi1XYlZXbBz5BLw1q3xnWWMeJkYdMZoLRPQGldw8egTLsPqXMJg6+koYEEZ4ywiIRQ48WuA06ZIi8H+hSoxjr2O2JLt3hj3j+ebsi4htxgh4h6zPFIamepLEd87Q6l6pK0xEu1VgZGDRuTXoliBti3IZ/COsL0KcgAK87yeXDZ6K23oaSgKAQGqqdGkFi8YO0F6V/+3RL+2EQkryUG/TaSRRFd3Oy7drctQx8nBVXRp8J0eB8HUJEzihR1i5vWn5JvNyBTbs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72b4d673-c17f-4fe2-73f7-08de3c0e7094
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 19:16:25.0751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vLlF5NdvkTU3J6hS3aaPQTNLrpgkuIZ3Hl8GmECvJZ8JLJWSHPfasHAT/UbAtJainMMnVr0m4acsv2y3nzK/2MAtQOepZY0k7qTID1eWlxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997714
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_04,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 mlxscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512150167
X-Authority-Analysis: v=2.4 cv=B8W0EetM c=1 sm=1 tr=0 ts=69405e8d b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iox4zFpeAAAA:8 a=yPCof4ZbAAAA:8 a=AoAeTN9Xs-P516mdDt0A:9 a=QEXdDO2ut3YA:10
 a=WzC6qhA0u3u7Ye7llzcV:22 cc=ntf awl=host:12110
X-Proofpoint-ORIG-GUID: el2lVPxbrbOMN_pQkdt_HP742zF0Xc-s
X-Proofpoint-GUID: el2lVPxbrbOMN_pQkdt_HP742zF0Xc-s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE2NiBTYWx0ZWRfX4ezvgOGqE5Ul
 2ovmL8kx5qmgLDrxZnZWY0igeKxtS0+Nr5FY0jP/0klFPt+uvQmRmPCPVhFrtN5MXSgpm/UzPdc
 TGQMjIRS40GeiuK7UE1mDPD35oBmnHhem6XFhfut0EPLYHuZuTfkauvugtc3k7vQOZ2qNGr5aqp
 8/vq1qpfSGivs+8oWo8pl0piRhU3XhwsfrJ4jqArrcBoXZ1+6zR3Yo91WB9ULm4a5SwaHW0+Ijr
 38b4Azb/q1buPoI6TbCFfjU4AjjjAVIEZMgqXy4TYg4ImvwRWGnFdXvaIcf0jcoi1pMS94cD8Hr
 RZJ8zQvdNDy246RIayXWcnfDqx+DGO3dAD71+l+gYelVQyAmk5VXHEzbY+mPZhsneheoNr3qRac
 Oj7jevoYGiheGSQ8IpVkBoeRSzSiJ/O/UQRCjVocq9cJgXAzd3M=


On 11/27/25 2:08 AM, Juergen Gross wrote:
> Instead of having a pre-filled array xen_mmu_ops for Xen PV paravirt
> functions, drop the array and assign each element individually.
>
> This is in preparation of reducing the paravirt include hell by
> splitting paravirt.h into multiple more fine grained header files,
> which will in turn require to split up the pv_ops vector as well.
> Dropping the pre-filled array makes life easier for objtool to
> detect missing initializers in multiple pv_ops_ arrays.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>



