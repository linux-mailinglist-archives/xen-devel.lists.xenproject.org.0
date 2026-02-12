Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uG+/DtbnjWkm8gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:46:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D897812E7AB
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:46:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229154.1535182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXxm-0004Bz-9l; Thu, 12 Feb 2026 14:46:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229154.1535182; Thu, 12 Feb 2026 14:46:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXxm-00049I-6X; Thu, 12 Feb 2026 14:46:38 +0000
Received: by outflank-mailman (input) for mailman id 1229154;
 Thu, 12 Feb 2026 14:46:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hp9h=AQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vqXxk-0003LH-Pc
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 14:46:36 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0efb225-0821-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 15:46:36 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH5PR03MB7838.namprd03.prod.outlook.com (2603:10b6:610:216::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 14:46:32 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Thu, 12 Feb 2026
 14:46:32 +0000
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
X-Inumbo-ID: a0efb225-0821-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=anTxAp4C4+ud2BAcKYPF+Da+FRy3CmaniMVsxffPZt29QxqgNay+FTHdjFRJNq9UvzhZlRlx27LRcf8dDCGXF+qLy3oaPhUHgFxtZ++ck5zW4eGwrEMAsnF+cb5537VOkqVjdRdh3h+0O+JCRYQlpHddoEr7X4/MAm5HUOh3qSaBUDoDFG4lSQ0HimKqGc+IJJgbxRHTe9B/R2TkdH8rD5K8AABg5bL3Bz0uDDdCQAJCWe+XLqvuLHLYLYk6/1ykKwNjd2TogV4fUGbdtDjUBUJhleWKemX2Pl1E8irHRg90ffwniNC/QaYc5ARHgI5ZLPWLMOkuFcIGQdJoUhivkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ueHdDOHV4edNRfS5FCg5d5jf3XY0BH0ITR6fmeHzau4=;
 b=O0bGccRrT4VS3ZaDqOfdyi4ykuBB23fyXFkW9LZT4fNpkmVVRXqUWTw66pvZzXLtybrn4aLJ2uei6e+iTKqmK/5IxY+ZASwAHT7RlCWdwNBl3cNpe/ElRV5MbRENe05YCcOrNi8jhuqivN7jxbgIOsMwGcsH4f6irmpNAU8aukJqpywq7zVVcBhajyqVBa4qVlNNbywLagfUmc2B5nBgIAF+63ggMIl4Buw9WK68HK6TMds9qAjTTkrpNq8CVTmB6P9QHlXvpSpx560ukq8H/4fHg0oeX3aYgIOzBxHiDJjjNeViUKN7bGC6nG4k93D7SEH8zNhvPunmTuR+Yx3/PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ueHdDOHV4edNRfS5FCg5d5jf3XY0BH0ITR6fmeHzau4=;
 b=R6RlbxCkvjcQrG199D3gVDtk7eBvydkpokIj6XGbLjlURUJ41ZaOwr48SzjC01rwtMOeLrazijPOzMuv4Ima2yqBhICy8jLQtlN850GHpLAo9a10BekY3qVdfZPYIas3Whuay3AJjG9ZlqsSJjgkLM4TaVj4De4b5+5Bsozz/Bo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v2 3/5] xen/tools: fix grep reporting 'illegal byte sequence' in check-endbr.sh
Date: Thu, 12 Feb 2026 15:46:16 +0100
Message-ID: <20260212144618.43200-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260212144618.43200-1-roger.pau@citrix.com>
References: <20260212144618.43200-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0031.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH5PR03MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ded081f-96c3-4afb-df24-08de6a458327
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YmtFNXVacjZEVmJqMUJqVXZJN1N6OWtKUE53V1N6cEV0ZktiT1pDUnhWc1Qy?=
 =?utf-8?B?ZXZlN0pxTlcxRHpOREpFa3l3Z1hUUG1yWXRkRXl2eGlFVCtQQktsN1M4bEQw?=
 =?utf-8?B?WVk2cnZET1VHbGZLdmF4UXJjbnpIeVVIR0txZGxWc1J0OW8vOXNvSGtqLzdo?=
 =?utf-8?B?RU1PZ2tncERMY3J4OWlzN3lVNHkrcWR4aWZmSUNPUXpHTDUyWWlQbCtpS1Er?=
 =?utf-8?B?MmlkeE9rdzFNeGt1OGFyK2dDaDZVUGNjZ1FhTjR4UHBmWk1CYWx1eUlML2pX?=
 =?utf-8?B?aGVVT0E3cm1uUXRkN2JicDRXS01GcVVkSG1vbk9nR1lBM2JSZVI0cWV5OThE?=
 =?utf-8?B?TDNqSGszczVTZUVMTDdubmYzMWtxaitXOTJOcEhSZkd1THNPekpMRFdUSE9P?=
 =?utf-8?B?VjEzY0tha1B4UFRJejl6VWV1cVVPK29Ga0FuM3I1RDY3RmZRaXE0dE44NHhG?=
 =?utf-8?B?bUlrQVBXUFVieVVSb0l3Q2lqc0ZBWE04UE9PbTNmL0dva1kxa01iZ0tVOFdM?=
 =?utf-8?B?Wk04a1cxSzV5cU9iek9rVkZmNTBXTDFBRytkZ3JPb2x4dTFKRHhwMXBhRXND?=
 =?utf-8?B?Y2psdEVRZTNLQnRrSVA5dFhaUnBDK3JtZ2Qwd0RmL0trRllMSWNVS2JGcXda?=
 =?utf-8?B?RC90RjBnT3pKNFAzd3I4YVpWcWZLekEyN2p5bmNRKzhaVGlXYkg4cktCdXli?=
 =?utf-8?B?NWVVcGZ0T0xCa0hvVzA5ZTVIM2lQRFh0ZVB4eTNsNkU2K3cvY3ljUkwrMFMx?=
 =?utf-8?B?ZWgvQkRYSThkRm1sc0E5aW0yWk02UlFFV1FuWUE1YU9qZmUyaERMYy9oOWRx?=
 =?utf-8?B?YitDNk9GRkRORCtZWGd2ME9vNnExZHdQbUQ4WVhzUWl3NE5aWGFESmdEM3Va?=
 =?utf-8?B?NlBWVlRrY3k4R0NTSVp4d01IbGQ1RmdURjBlV0JWRkNvaGZCT0hMdjByT3JV?=
 =?utf-8?B?bnd5NXlaem1GTW9QblR2ek9QeE1XN05YTVhCdWJZWDFUamdFVkpmNGNYSkZG?=
 =?utf-8?B?MGJET2pUNjVCaTViLzIzQ3A2eHJZTmgySEZQczZ5OUQ2QVVXYStTNkpxS2JK?=
 =?utf-8?B?SUVRcFFubEJ1eDR4dDdqNi9udnJKcHd1c0dZK3NDQVhnMHczQUpPMGlwMWMy?=
 =?utf-8?B?L25aa0FMeWxKQnZ1bEFITXRRdFdJaklxTktSQlpWYzVBY1ZSa2ZGNGx0WFFK?=
 =?utf-8?B?OU5iZ0FwNVl0M01jRVU5am51NGRTbSs1bDY0bHh4S0oraFJkTXBrUTFHZlAw?=
 =?utf-8?B?b1NoMTRuZW9WRDljRWNTSFFaSW1RMUNLQ2hrcWpBRSt1Q1RxWU1Pc3F6TkJE?=
 =?utf-8?B?azZ4T1J3d3pqUy9HaU9paCtzczNjNG5HbkRIQVNQVjZnV0ZuNTI3bFNnZFRW?=
 =?utf-8?B?eE9LZFlqZ1hld1RRUkJJREVsbUNSOUNTamE3RWh0bzZhZzJHQW5wOTNLaGdj?=
 =?utf-8?B?dUhCanhNNE1mUzliUVZrU2NSSkF5YWZLSmEvQ0NoK2MzNGxJK0p5SzNDcXdW?=
 =?utf-8?B?TmdpOTlPY1AyYzBnY00va0JUenc3R3laeURWZnpZRHBLNEpPWVQ2bklTTncy?=
 =?utf-8?B?eUNjVHFSRWlSSyt5KzZJYjZjUzBPdmYxQjJOL0k5YWdneTF3WXphYy9rWTJY?=
 =?utf-8?B?Ly9lc3hvbTFZRlBheEtOZkdRNStMZkF5ZGNYektXbDkzMTA5dFArWWhBWS8w?=
 =?utf-8?B?U0k1bUZNbHBQV01oRUtEWHdpYjViNlFxZ0VLK1V2M3NhclQ3LzFScTl6dHMx?=
 =?utf-8?B?QjhqWWF3RUhmdFFRVWgyNEV1c0lLNmFtdlEveGw2M2cwU3V4aXhFcnNqZW1n?=
 =?utf-8?B?aTc0OEE5VFJ0TWpjVDZHQ0NSVVRoVC9TbTFLNTV4aHJkemJ3ejVIa0tqMUNU?=
 =?utf-8?B?MDl0SS9Mc2hzajA5S3lhc3V4QlN4bmp5R2NoNHZIYldPWlBIakhiMVV6V01W?=
 =?utf-8?B?UWQzcGNtbHJLMjVoNDF0RHNkdzJZYXc5NHR1cHk3UDA3cGVXbHB4SkN1N2Jo?=
 =?utf-8?B?azBvaG4vK0ZaMFRWTjB3ajdoWFUxU1hEa2hycCtrVzBEdk14YlE2bVg4YkRv?=
 =?utf-8?B?Q1V0ZUJWS0NoZnIwMGhNYmxVdlA3eWpoQ0U0bGtkMy9USzF3eEpPa0VqemNt?=
 =?utf-8?Q?Sxtg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWdkWHpOZkZwd2RBL29JZi9LSVQ3ZzVEYnpiYVNtMERhV1NteTlLdHZGRmJh?=
 =?utf-8?B?ZEdFMFQ3OSt4dk9ZemhabDZaRzNqbmZRNGNmNHFsRFd1T3E2WjUwUk5UV1A5?=
 =?utf-8?B?T0ZCT0FMNHNFeWdFYVZJbE1kUzdiVjVKWm9JdVUrUHc4aGR4U01tMTNKK2Q2?=
 =?utf-8?B?cmtRLzFwVnVWMXJRV0tGU0ZLU2JUd1lSRkZJVnR3UE1VcUVteDNEeDRjendX?=
 =?utf-8?B?VXlkWkRINU15Unc2T1JmUFRGWEJpcDhkSHNRT0ZuM3UvL1hLN2FnQmxyWEVO?=
 =?utf-8?B?TzJETXNRTllIenEyaVdxVU5KRWc0bVc0Qm4xbENIMVpPSzFFWmxsbmNXNHIx?=
 =?utf-8?B?ckdDMzR5VVdVQ256SlVKSFBha2tSRHl0N29uNmFPbUszWHRaQmpJeXl3dFBT?=
 =?utf-8?B?NGgzWGRCckRCakExK2JtazZEdzhwVkNxdlZwdUV6Q1ZiODRTSUoyK25HMmZr?=
 =?utf-8?B?T0NEZjhncGpvS1VCanZBNW41ZjlteUZJRXpEMThGVHhvWDlZdVgxd3dpNFlu?=
 =?utf-8?B?ZEhSY1h2RzlIWE9tZUpVUTZMUW1nNUNVQlYydDVkQ2p0ak5Bb1VIN1VZY3Z5?=
 =?utf-8?B?OXNtTWlWR21uOHFIVEZ2RENNcVA4NStDcDBJdFE1V1VGSEdCL04xeFhlMFpz?=
 =?utf-8?B?czJ6V1pBb0p5cXpHSEVQY0thcWlPSTE1d3Q3eUZtUk8yN28yRUNKQW1TeldL?=
 =?utf-8?B?R0loZnl6QXcrOHVCTUkzZGUyVDdzU0xlb25iS1V5NFVuUWQwdCtQNDF2dXdS?=
 =?utf-8?B?YzJtbW5CaUxLdldlWHU2aDVSZ3ZyQ0xyUG8zazVncGw4azNMNTkxUWRnUlQ1?=
 =?utf-8?B?dHJTK0l1U1JHRHBsUjc3eTZVOVNwSW8wTDV4cHFZNm8yMTZsWDB2b05vUTN4?=
 =?utf-8?B?ekFPczR1ZEF4STRZbmFUOVdRdnprMDBFbTRtOWZjSGdyM2g3YW8vU3RGMWox?=
 =?utf-8?B?aGFtbnlWcmJ6WVo1SkwwV2s0cklud3VIOXBGL0gycmJnejZOWjQwYmJNK3Fs?=
 =?utf-8?B?NUxHMWI1L3hodmQ2ZjVMWHlTRWF6UGtBbmtKcVRiNEd2VnJUUDFXTXNoTHF2?=
 =?utf-8?B?b21HZ1FMRWE2a1U4SFUyV2srRkhEbC9Da0pXTUp1dmc2b3pacmY0cWYxNERB?=
 =?utf-8?B?c3BNSzNwemZodUxoeFI4Q05qUXFvMlpOVTVyZ2dYSEtONitiUzUzakQ2WFJl?=
 =?utf-8?B?SmZjWlEvMmVULzRJVXphcmRaQmZzTzIwcjFIOENDdG1yNEFGYU5US0NqWThF?=
 =?utf-8?B?c0hiRGg5TC9XY1psU3JVbXNUK2dMNVhsYThSQWs4Mm9nc0FUalIwdHJaMUh3?=
 =?utf-8?B?MnkxRzFwN1JUNUQzelMvZnJLb1pSUUlZRzcxVk1pZmQ2b2F3WUFzNGZ1YUVm?=
 =?utf-8?B?eTV6d25SNm80Z3hFQWtsNml5NktQWG5OSEFFR0p3VGdSeU84SWRDVWNOdk1j?=
 =?utf-8?B?T3VhQTM3SG93MWozQ0Q4VEJaWEcwY3pmWXN4d0VEb0xhMlNYM3M4ZGlJZE9t?=
 =?utf-8?B?c003VWJKeVhOOFJlSk5lSGY0RUdZMk1kYU45SFhmSGlvdk1kMkp3VFdmdjI5?=
 =?utf-8?B?RkpFRE10TEVGUkp4MHBaZW9IUFEybVQzeW0vcG1jc1BWQm9OQzRMU0wyMzBh?=
 =?utf-8?B?WjJ3V1BmY00rbDVJT0FPOTE0cmhQeVBZY1R6bnoreXdJRmJ2bWFZM2dSUDc4?=
 =?utf-8?B?YVpyWVhpK3EzK1hmb042QVBsTWJHeG5YSWpWRE5JNllpSHU4NGpoamlCUmJr?=
 =?utf-8?B?RkJ1T3dueHIzM1pSbDc1NEtHWGNSWUVZYWZZdXpkS3hML0ZzbUNEYXlVMWkz?=
 =?utf-8?B?Z2UvN3c1TC9lUkMzWGt0SCtyM0NJRnJMdjlyTnJyTE16MUJRK2xibXpKYWhx?=
 =?utf-8?B?SEtKSFloTXRvaS8xNllNYWtvQVJRZk9ubVVhK3FLbGhGVGl1SzQ1WFk2S3hk?=
 =?utf-8?B?S3JNSGJldFJyWW5Lb1c1b3UxZlQydnBBcm00NVRwZmZQd1haNVBOY2w0T0Rp?=
 =?utf-8?B?NnpmVDl1emQ3NEd4ekR6aEY3ODJ0UlFDUlF3ekdkK2MySUY3Z0dVSG91aXV3?=
 =?utf-8?B?VTl1NWdja2p4cS9pYkJlYk0rMC8xUmRUenRBczhNS3RCalJUaEZsUDloVGVP?=
 =?utf-8?B?Tm1nQ2tKejZBeURSWEhFYm5ydVdjekcwYzUwSUE5THIySXR2NTN0M0oycFFk?=
 =?utf-8?B?UDh3WmlQb3BlY3RjVEdoOEZqdGdoaUFsaW45OHFVaEhLcFBmVEZFWDlHSC9E?=
 =?utf-8?B?RFVrZDhRbEhwTFU5RkJ3ZUtlM2dTYVMyeXF0bHNUT0FmQjVlblc5UEV4anU4?=
 =?utf-8?B?Umk4NFBDT3E3Q0hlSW9Ka2hHcVh3eWZtaVdleXNnSDZTcmw1UzliZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ded081f-96c3-4afb-df24-08de6a458327
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 14:46:32.1076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMgvK9npSMWYHALEk/JWMp2eDEhwUfiMk0hCWZzmSBK0Zti6ZOfXtOX8LDG34z08X8P+MUvMb2QaoeGhb3B91w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7838
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D897812E7AB
X-Rspamd-Action: no action

On macOS the default encoding is UTF-8.  The binary encoding used by the
grep matching pattern is not valid when processed as UTF-8.  Switch the
local to C just for the grep invocation to use the binary match pattern
correctly.

Suggested-by: Bertrand Marquis <bertrand.marquis@arm.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/tools/check-endbr.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/tools/check-endbr.sh b/xen/tools/check-endbr.sh
index aaaa9ebe6bd7..9346fe95c791 100755
--- a/xen/tools/check-endbr.sh
+++ b/xen/tools/check-endbr.sh
@@ -107,8 +107,9 @@ if $perl_re
 then
     LC_ALL=C grep -aobP '\xf3\x0f\x1e(\xfa|\xfb)|\x66\x0f\x1f\x01' $TEXT_BIN
 else
-    grep -aob -e "$(printf '\363\17\36\372')" -e "$(printf '\363\17\36\373')" \
-         -e "$(printf '\146\17\37\1')" $TEXT_BIN
+    LC_ALL=C grep -aob -e "$(printf '\363\17\36\372')" \
+                       -e "$(printf '\363\17\36\373')" \
+                       -e "$(printf '\146\17\37\1')" $TEXT_BIN
 fi | $AWK -F':' '{printf "%s%07x\n", "'$vma_hi'", int('$((0x$vma_lo))') + $1}' > $ALL
 
 # Wait for $VALID to become complete
-- 
2.51.0


