Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2614CC8EF8
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 18:01:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189011.1509992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVuu5-0006JF-5f; Wed, 17 Dec 2025 17:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189011.1509992; Wed, 17 Dec 2025 17:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVuu5-0006Hn-2r; Wed, 17 Dec 2025 17:01:33 +0000
Received: by outflank-mailman (input) for mailman id 1189011;
 Wed, 17 Dec 2025 17:01:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZVrU=6X=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vVuu4-0006Hh-7P
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 17:01:32 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0768886f-db6a-11f0-9cce-f158ae23cfc8;
 Wed, 17 Dec 2025 18:01:29 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by PH7PR03MB7135.namprd03.prod.outlook.com (2603:10b6:510:2b3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 17:01:25 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19%7]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 17:01:25 +0000
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
X-Inumbo-ID: 0768886f-db6a-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wP76MNYdnIcKPtrKitKyMkIISE2/drelfTr/Spbyh9LTxjl7Ug6yK3tGa7Fya5gm5MNwOdQpFRLYoBUOzXRKCezPNWGoQvdLw8fHZHNlfQdscz1wrT2JkiUvf3qUtXHRY2YBVdH9BffP8ZQlUIDvmLnhTO/FRhnNpz+i7b+fv3CMhHjnwsRaJ3ckV41Iog4q+JQWWhaw1S5Mw26ZD3yUGIIoD5ls9kLJgKy45KXXIzLLI+QcMfGEg5xiMbxjJJuKAT8qQ0sOIoBRcdwaSNODZsiqrEIAdqjgi7NzgJmFxZCqBRU44Acqum6pHwQXt6aWFl8Pbkh3OzznrnkHjxRFqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWprsbrae4k2Jc0QPq+N/R775a76gPyxb9eyeNMn99A=;
 b=C+sr2tipgzAkr+SdlHWQv8lzmlEMB0/lBcrFPdxWFfFWkcRbHe11tK2JDsgPj7niMD6QEk3HBXNRWYEls2TU+ymdvBJpq/j8EzPXSrrs5Ou5BuJnICPmw9kK4rUY5jzkrNxhZhrGgfIJJuH620A4TEgFrNK1kI90yfgnC7ffcAV0jSkf2Wz4Fcc4JKG/Y9cyjv8AzJap+vAr5pHtiJ2jtNurK2y8ir/f/KIAurB2BUNmwwQYY5iUwE5Yk2DyHMu9cC107n0VbVewW4XWiuRkKr8KMfSraeMUHyRJFpYyLoMDrfSnDLVaN/fWiT49KcoLpWMugTl6bwr4sDk+q6YjjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWprsbrae4k2Jc0QPq+N/R775a76gPyxb9eyeNMn99A=;
 b=KXxclHTKxAOvAlrise2vD05gUwK/FFneJ/fvM5pdSl259xmGNVpzeccgb+kNjh47B67MKhLqekNPM+6NJ5vTh19VbpCFdG1RDWP18Mf0UxwG64Ly2R0jGUq1IyFUctQnI9yBRy8EwbB3TbU6Wx8jJ+y8e/LgSv8IqlfqzbMf4PQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 17 Dec 2025 18:01:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 4/4] tools/tests: Memory Claims
Message-ID: <aULh4QZeT7uZufVa@Mac.lan>
References: <20251216163230.2768186-1-andrew.cooper3@citrix.com>
 <20251216163230.2768186-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251216163230.2768186-5-andrew.cooper3@citrix.com>
X-ClientProxiedBy: PR3P192CA0018.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::23) To BY1PR03MB7875.namprd03.prod.outlook.com
 (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|PH7PR03MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: 5149d8b9-47b4-4277-46b2-08de3d8de9a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGlHclI4Rm4zOVRrN0JaMi9LeGQwNC9tUmNXL1B6UVM3dkF6VEJqUE1VMysw?=
 =?utf-8?B?ZlV5MTV4dDYzUFE5ZjE2bUI5NUdndUdXMHIzR1lZazg5RVpLNEVLUW1TSmsz?=
 =?utf-8?B?cHpzQnZRSlc0bVFWY0ZCRjRsaUN2YS9Vb0Q0ZTNhODNuWXkxUDh3MzFjd1lB?=
 =?utf-8?B?UThXVWdFSzRRcUt3WEpOUUdTSHBqOEdwNVU4U1BTREJlK2EyWnUxSVJ1T1Yw?=
 =?utf-8?B?Y0VLNlBhSjEvSGpsMnNPbU92Wk5KYnBlTVZCMktnRUFic005RDI4aTRpNERE?=
 =?utf-8?B?cVBnWkZSME5wL0gwendKZU54bFhldUdNTURMQS9jbDA3WExIcnJYa3VDbE9i?=
 =?utf-8?B?Zk1DUExuN1V5R1YxWCtKUTg2R1lkVytKMGc5NkJ2Zm1rU20rODJMdllmMUJX?=
 =?utf-8?B?aE5tZFZ5YnVGZHdINWQ5RUs1THE2S0w0ak9ha1AzbDdyYmNNandLRUtuVHg2?=
 =?utf-8?B?VTJoV1F0eUpzVUJlMkthd1Zna3BzaXJ0WGcxNVZnNGMvdGdjVVAwKzdZOTFB?=
 =?utf-8?B?cjJKdk9Oa2ZLYTVIaTB3a3BndStZVlVmZnRQdUVpcnFDQmxja3hXSkVKRmtv?=
 =?utf-8?B?Z0tCaXJ0a3ZPdlZJdkdJL3lOV3NkaWZXOU9pSlhFbnRPcXhmMU5SR3VGTDFG?=
 =?utf-8?B?UFp2cEJnY1VDbTNCbGtoUjAwcVd6OG9ESktvb0djbjNTYU1mRXl4WndMNGpq?=
 =?utf-8?B?UU5ST0l1L29zQ1FiOHplQTFKUmR1OUJ5WE9nSlNXMTRhcVZqNHJGTXM1aXdv?=
 =?utf-8?B?MXllQ3VPdkZBVHNzc05YVWt3eENxWitTeWVLV2pRRFFxSWVsZ2V0K1ZSN0VR?=
 =?utf-8?B?QjVPZ25Vd2NMQUJYY1l0MU5qdjNXRUU1NEkrbkVQV3hmRTM4ZFR6ZzVZRk13?=
 =?utf-8?B?V1FxdFc2MU9uMmRMYUt5MDZEbE5aZmdJMmVudHdDbkEzY0xhd2JRWDVJRmdy?=
 =?utf-8?B?ajk0cElIcTA4Uk5NN2huRjlCS0RtUVE5a1o1cjAvT0pDRXd4K3dPS3prc2ht?=
 =?utf-8?B?RVlpRzdUeXBsdHplTnIxMEFKSkIydGhzeVYzMnhDNDZ0MW5zbzhFMng4aS9F?=
 =?utf-8?B?bGF5aEJZT0xiMk1taWJ5ZHNtak5BS0o1VUxpaWdOWWtydXJGNUdnTUZBNFRa?=
 =?utf-8?B?YWt6NFBsMGJOdk5QR2dXcEJ3QXdGejhZbHJUNmxXVitYeW5PbFJBc0dPNG5r?=
 =?utf-8?B?R2JRbVcrVjhlYlpTRFkzYUw5N09WS2FibGk1Qk9BL0xGTVFhVWxxY1FYTmhX?=
 =?utf-8?B?V2owZG9LTzM0VHJZSEJsMlZIem5XWlp0MmdYN1NkSFVVT2NRTTRISCsxU01J?=
 =?utf-8?B?WlYxZXQzRDZPN1F0NFJwbDNiUnVsbjJGc0FCVHFuOHBRazVVbjFJT3p5OGRi?=
 =?utf-8?B?NXl3YUY3TUZLa0Jha3ZQaWhXYWtiSWw1Ujh3eHhxb0p2VTBWVDMxa0kzdTgx?=
 =?utf-8?B?aFZwcDJ5ZGt0bkpXU0x3c3RVV1RBMHFkVFJUVmR2cFMyMzFJYjZYd1NiMVg4?=
 =?utf-8?B?bjlXMGtqZ0JaUFVFcHdmdWEvc2ExN1pyTzhqdU1WRzZKWVRLOVQ4Q2lHcVpt?=
 =?utf-8?B?N3dyck9KQ29YTGc2bnkxVHNrUzd1S04wNjZxTFMxWkJIUS96cW9GR0srdDk2?=
 =?utf-8?B?WnlIVnF3UE1sWUxqY1I4bXpEbmczaldGSlZSUE0rOEppUURzTVZTR2pxVEdC?=
 =?utf-8?B?MExFeEVUV0Z4Mndjb1lMaGR6d0o0QzA1ZkxweTVoVTM4OVB1ZmoraldvdnVy?=
 =?utf-8?B?MGs2YVdWRXpuOGw3NUl5eERPcUdSSGVrMEVISGFqN0tIQjE5Ui9UWEltTmtp?=
 =?utf-8?B?UGt0Vk9JTkd2a1lOSWVweVBBTE54N3Z1MjA0R1RNZVJTOWJBWWV0RGd5SXlZ?=
 =?utf-8?B?aFZZTkVrZWZ6Mm1sWldvWERoN2NvZlEyNUZXREVQN1NXa0ptM2cyTVRtMENY?=
 =?utf-8?Q?nEE7F+RCXmukhy/o2/aqGYBwyEHkEdFV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkMrN2s1NjYvSGhZMVZqWmtxVUZ6QnBONHhhNVgxZGZaVFFQVjBNcHVQUFc3?=
 =?utf-8?B?TFhPZ242T2xnQktOemxjZzhMQzA1TlRjWklPb0h2SW9YLy9Nb3VQRFdmUFhL?=
 =?utf-8?B?ZzhBKyt5QzBqVFgyVmtjMXE4bDM1NHQ5Y3cvVkhzSVR4czFJN2o1VXdwT0pW?=
 =?utf-8?B?azJ0V2FGSHlEMXUzT3JvYjdHNEFNb251RnRncnRuSzRmY1IzLzY0czQyQm5q?=
 =?utf-8?B?VldDWE1KWWYrM0l4cm9sKzNDakk0N1lVUFNGYnFsRDRHbFZmWC8xZHdJVFJQ?=
 =?utf-8?B?OEFxZ3lCb3d5U0V2OTArTHRmTy9Hb3RwejZOYnFrK2lhNEE3dFdxNDh0bTFC?=
 =?utf-8?B?ZDlGN0pLOFdUR3NPdGZXcEVsOXhVeE5TR1pyd1ZWV0tvZW15ZnJJWmpKNVc0?=
 =?utf-8?B?aWRSWlBuOTJTWXBwcHJkZVBldHdZZkJwRFEyZnNkcWNsS2VsczdxVU9SRzFn?=
 =?utf-8?B?R3JOeVdGQXFkWlJablY4U3FxY3JBNExKYlRHN0NQS0lJUG9BYlR1UVZmczU5?=
 =?utf-8?B?NGFxeVVidVVxTXdrZSt4SDJzYWpaUjZVdW9LVGpaWjVabXIzSFpPUUdlblo3?=
 =?utf-8?B?RDE0QktENHRsRFpMSVNodWxwb2hYaGlqWlVrcWdRYTA1cXlyWURIVyt4dVJP?=
 =?utf-8?B?dFVmM0hsdEtxRDcyOHlaUlpiaEYvZ1VJMjdrNE5BVmt6QzU5REJMUmx1TXZq?=
 =?utf-8?B?VWdoWEVleUVhaXM1TFZycjRZN2R0c0Y0dllheDAzZ0k3SzBHeGoyZ1ZpQ1FP?=
 =?utf-8?B?NEhJM0JtYXhDNWN3YmE1UXVXWFVRMUFjOWw1b2xReDluU25uZjFVcWU5bXBE?=
 =?utf-8?B?Uk9DRGNpMXpoblBieXFsM0hOdlVOZ1VEM0ZQRjJReTFmb3NQMGlQK3UrK25B?=
 =?utf-8?B?SGF1YnA0cGVHUmtRayt6MnhqWWNwbWxhdnRnZ0NlcEx1YzhqQkRNdmx6ZFRT?=
 =?utf-8?B?QlB4V2pNakxON1Z3Q2hhVEJ6b2pHZDdXSFpwOU5jcUt1RHI4TkhTVmtkRmVL?=
 =?utf-8?B?bXloalROZ0k1Z2l2WHlHMWRtRWFBRU50SFkvM2huS2VzVVNqK1JycU9OUDlY?=
 =?utf-8?B?ZXFUS2JWd1VmRU1SdDRha282NXdPeWRIYmh4bmpPS2xWRkJTM281UTZ3aDhC?=
 =?utf-8?B?WVpjUTBleFJxcTJMVFlWaWlybStWYU5RU3lLVnRRc0NkelozRFArdmFkSUdC?=
 =?utf-8?B?V0x0OWtNODBsaXdSWWlDcUNDeGh3TndqbWh2Mk41VUpoSk1YQXlESTY5a3BX?=
 =?utf-8?B?c294UDlydWRIY0lPNnVlRjlnOTNhUHRIbWw4R0FKdVVDZkg2ejZKaUVwelp0?=
 =?utf-8?B?V2ZNWTgybUxrcloxZ3RlbnB6cG5tbDd1UFJxQUZLTXhRcTNlYW1lWmVxRzRv?=
 =?utf-8?B?UTBJUFRkRWwrZEc2MEs1ZkZJL0pIeE84NTJlYlp2c2RlZmU0QVQydDBiSi9N?=
 =?utf-8?B?eU81OFVZaTVzWFRuZUhjR1JXSG1RVHFHOUwwd0w4SGJxSGVCUVdWOXlGT0Fm?=
 =?utf-8?B?OWdXNXdQWENjVlRaaE1NSWllT09paWRrQ2s0aDJNeVRFbmh2TEZ2UmNacXgr?=
 =?utf-8?B?Z0xKZGgzU0NDZWtYODRkRnU4NmtkY0hQYnhvZ3I5TGRCWkszaS8wZVZ6dU1U?=
 =?utf-8?B?QnBkOHFxZW9VRDBQd3Z3eUplVDQrMzNyUS95cHdVaHp2cFRQSDdTQlpkUnBk?=
 =?utf-8?B?NnNONmY0ZXlMUzZpYWNvcjQ3SmFUbU8wSFlXazBQTVhnZU5EQitVbFc4U2M1?=
 =?utf-8?B?M1laeEZ2azFKU0hQajlSR0gwMVA3TmlmSlNYUldOb3JWYS8rSFFnMXU4UitL?=
 =?utf-8?B?dDY2VERMeHBmZm9KdENNQjdKKzFqZWJjdVNjVjdVTDF4dmh3RkQycFllUWps?=
 =?utf-8?B?UnlkT25VSjhxV0R5TGF1WExQYjFaNHBWMS9tZlNiTzRHZ2I4Sm50c0ZVMDNh?=
 =?utf-8?B?cEUzZUlvQ09abW51amlrM1FoSnhBMlYyUTdQS2NJMlBiK0JSazQzOTlVUEZ0?=
 =?utf-8?B?a1JjRklPZzVldmFwWjUzS0phTERxQXB3K01uSURnNTJ6b2x5YlY1Mjl4OUI4?=
 =?utf-8?B?YkN1SDBTQkNHWk9lSUhJeDVLanJpWmdjK0NKNlc4UFBjYTVvVGdFZFJIdThn?=
 =?utf-8?B?cUhoMG9zYTEzUERHWTk2VFhIakZTYkdlbWtkbHp3aGh4cnZSMEVYeURiSkVo?=
 =?utf-8?B?bXQ0S3ZPLzBuejlhTHE5QzBDN3Z5elI3N2xyc0p5MVpmSjJBN0puSVNXZXJv?=
 =?utf-8?B?OVc4RXpaL0g5cFFSZTkxbnovMG8vdUhXM0R3L1Erb1lqTFVFNnkrMWxucVBm?=
 =?utf-8?B?VFhvMUJZMndXVjdrM1VMeVkyTFFldm56TmNwa3FmckRwQmtHcUF0Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5149d8b9-47b4-4277-46b2-08de3d8de9a6
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 17:01:25.5112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zdnx6cGGE9wlr6mBgAIn/7Wc8yOO90lPMZgSptWIGYZ8JeZ1pEceJgtB+MCUewZK/VWuaMJzaWdVtp8FjpTlbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7135

On Tue, Dec 16, 2025 at 04:32:30PM +0000, Andrew Cooper wrote:
> Add some basic testing of the memory claims mechainsm.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Some nits below.

> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  tools/tests/Makefile                   |   1 +
>  tools/tests/mem-claim/.gitignore       |   1 +
>  tools/tests/mem-claim/Makefile         |  38 +++++
>  tools/tests/mem-claim/test-mem-claim.c | 190 +++++++++++++++++++++++++
>  4 files changed, 230 insertions(+)
>  create mode 100644 tools/tests/mem-claim/.gitignore
>  create mode 100644 tools/tests/mem-claim/Makefile
>  create mode 100644 tools/tests/mem-claim/test-mem-claim.c
> 
> diff --git a/tools/tests/Makefile b/tools/tests/Makefile
> index e566bd169952..6477a4386dda 100644
> --- a/tools/tests/Makefile
> +++ b/tools/tests/Makefile
> @@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
>  
>  SUBDIRS-y :=
>  SUBDIRS-y += domid
> +SUBDIRS-y += mem-claim
>  SUBDIRS-y += paging-mempool
>  SUBDIRS-y += pdx
>  SUBDIRS-y += rangeset
> diff --git a/tools/tests/mem-claim/.gitignore b/tools/tests/mem-claim/.gitignore
> new file mode 100644
> index 000000000000..cfcee00b819b
> --- /dev/null
> +++ b/tools/tests/mem-claim/.gitignore
> @@ -0,0 +1 @@
> +test-mem-claim
> diff --git a/tools/tests/mem-claim/Makefile b/tools/tests/mem-claim/Makefile
> new file mode 100644
> index 000000000000..76ba3e3c8bef
> --- /dev/null
> +++ b/tools/tests/mem-claim/Makefile
> @@ -0,0 +1,38 @@
> +XEN_ROOT = $(CURDIR)/../../..
> +include $(XEN_ROOT)/tools/Rules.mk
> +
> +TARGET := test-mem-claim
> +
> +.PHONY: all
> +all: $(TARGET)
> +
> +.PHONY: clean
> +clean:
> +	$(RM) -- *.o $(TARGET) $(DEPS_RM)
> +
> +.PHONY: distclean
> +distclean: clean
> +	$(RM) -- *~
> +
> +.PHONY: install
> +install: all
> +	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
> +	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC)/tests
> +
> +.PHONY: uninstall
> +uninstall:
> +	$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$(TARGET)
> +
> +CFLAGS += $(CFLAGS_xeninclude)
> +CFLAGS += $(CFLAGS_libxenctrl)
> +CFLAGS += $(APPEND_CFLAGS)
> +
> +LDFLAGS += $(LDLIBS_libxenctrl)
> +LDFLAGS += $(APPEND_LDFLAGS)
> +
> +%.o: Makefile
> +
> +$(TARGET): test-mem-claim.o
> +	$(CC) -o $@ $< $(LDFLAGS)
> +
> +-include $(DEPS_INCLUDE)
> diff --git a/tools/tests/mem-claim/test-mem-claim.c b/tools/tests/mem-claim/test-mem-claim.c
> new file mode 100644
> index 000000000000..78eae9091f52
> --- /dev/null
> +++ b/tools/tests/mem-claim/test-mem-claim.c
> @@ -0,0 +1,190 @@

SPDX header comment?

> +#include <err.h>
> +#include <errno.h>
> +#include <inttypes.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/mman.h>
> +
> +#include <xenctrl.h>
> +#include <xenforeignmemory.h>
> +#include <xengnttab.h>
> +#include <xen-tools/common-macros.h>
> +
> +static unsigned int nr_failures;
> +#define fail(fmt, ...)                          \
> +({                                              \
> +    nr_failures++;                              \
> +    (void)printf(fmt, ##__VA_ARGS__);           \
> +})
> +
> +static xc_interface *xch;
> +static uint32_t domid = -1;

I think you could use domid_t and DOMID_INVALID as the default value?

And then you could avoid the casting and just use domid <
DOMID_FIRST_RESERVED as the check for whether the cleanup is needed?

> +
> +static xc_physinfo_t physinfo;
> +
> +static struct xen_domctl_createdomain create = {
> +    .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
> +    .max_vcpus = 1,
> +    .max_grant_frames = 1,
> +    .grant_opts = XEN_DOMCTL_GRANT_version(1),
> +
> +    .arch = {
> +#if defined(__x86_64__) || defined(__i386__)
> +        .emulation_flags = XEN_X86_EMU_LAPIC,
> +#endif
> +    },
> +};
> +
> +static void run_tests(void)
> +{
> +    int rc;
> +
> +    /*
> +     * Check that the system is quiescent.  Outstanding claims is a global
> +     * field.
> +     */
> +    rc = xc_physinfo(xch, &physinfo);
> +    if ( rc )
> +        return fail("Failed to obtain physinfo: %d - %s\n",
> +                    errno, strerror(errno));
> +
> +    printf("Free pages: %"PRIu64", Oustanding claims: %"PRIu64"\n",
> +           physinfo.free_pages, physinfo.outstanding_pages);
> +
> +    if ( physinfo.outstanding_pages )
> +        return fail("  Test needs running on a quiescent system\n");
> +
> +    /*
> +     * We want any arbitrary domain.  Start with HVM/HAP, falling back to
> +     * HVM/Shadow and then to PV.  The dom0 running this test case is one of
> +     * these modes.
> +     */
> +#if defined(__x86_64__) || defined(__i386__)
> +    if ( !(physinfo.capabilities & XEN_SYSCTL_PHYSCAP_hap) )
> +        create.flags &= ~XEN_DOMCTL_CDF_hap;
> +
> +    if ( !(physinfo.capabilities & (XEN_SYSCTL_PHYSCAP_hap|XEN_SYSCTL_PHYSCAP_shadow)) ||
> +         !(physinfo.capabilities & XEN_SYSCTL_PHYSCAP_hvm) )
> +    {
> +        create.flags &= ~XEN_DOMCTL_CDF_hvm;
> +        create.arch.emulation_flags = 0;
> +    }
> +#endif
> +
> +    rc = xc_domain_create(xch, &domid, &create);
> +    if ( rc )
> +        return fail("  Domain create failure: %d - %s\n",
> +                    errno, strerror(errno));
> +
> +    rc = xc_domain_setmaxmem(xch, domid, -1);
> +    if ( rc )
> +        return fail("  Failed to set maxmem: %d - %s\n",
> +                    errno, strerror(errno));
> +
> +    printf("  Created d%u\n", domid);
> +
> +    /*
> +     * Creating a domain shouldn't change the claim.  Check it's still 0.
> +     */
> +    rc = xc_physinfo(xch, &physinfo);
> +    if ( rc )
> +        return fail("  Failed to obtain physinfo: %d - %s\n",
> +                    errno, strerror(errno));
> +
> +    if ( physinfo.outstanding_pages )
> +        return fail("  Unexpected outstanding claim of %"PRIu64" pages\n",
> +                    physinfo.outstanding_pages);
> +
> +    /*
> +     * Set a claim for 4M.  This should be the only claim in the system, and
> +     * show up globally.
> +     */
> +    rc = xc_domain_claim_pages(xch, domid, 4*1024*1024/4096);

You can use MB(4) (macro is in tools/common-macros.h) I think for
clarity?  Same below with MB(2).

Thanks, Roger.

