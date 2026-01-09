Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 611A6D08F30
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 12:38:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198615.1515496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veAoF-00066n-H7; Fri, 09 Jan 2026 11:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198615.1515496; Fri, 09 Jan 2026 11:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veAoF-00064o-EV; Fri, 09 Jan 2026 11:37:39 +0000
Received: by outflank-mailman (input) for mailman id 1198615;
 Fri, 09 Jan 2026 11:37:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ele=7O=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1veAoE-0005xQ-IN
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 11:37:38 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9893b892-ed4f-11f0-b15e-2bf370ae4941;
 Fri, 09 Jan 2026 12:37:37 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CO1PR03MB5761.namprd03.prod.outlook.com (2603:10b6:303:91::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 11:37:34 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 11:37:34 +0000
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
X-Inumbo-ID: 9893b892-ed4f-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kDgyLPKCveTuU0QiLFLGKgqMkZnpebNyCXXoHHYDquneRNLpakf1yh8jDPbQdg4OuVQAvbo2BpwF9QlUaSS7W+nibbUrHt9JFVCjO6HK3HdnWh4toSNeD9ixsscKyI91aQjdpmT0jYOl7GSOXFocDOyBW2KnuDtkOfw5zHDN5hUqj4P6XBZeMA0Ao2TJq3rPGUGtPC7jDYLZglk6uCZg2Ao77if5Ks5QinbYp2IM9LUb7lCCglSpn1i6HW0WOuAR2bdr05uT4wm/+AVunYjjqu734T7GCq0qpp3IF/xVCmdGs/GR6TI0sVtvNyFOQjKFclHuUSqj/oyn13ZsYCGBiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yM93/XYrl9lbCk3W4MwM71pBxzanupWWO9VvDhzXhys=;
 b=jngmlC9FcTfoR4N+LTUAkZHKAkJxD/3VTrLNuGfY3iPoZq+VGKvLpkBgsPdDW3E9akTQ2yLtV5MnCsTyF38h+TcskJEmZi6Dsy4RYcY3fWA/Ehkut0nI/Zy0hoOqVSrMd/0pJW+spi0b3bXdC3F6IHoHjIkwVrnSNUTd+HJKVzI0/DII5EYiRjV8aAytA86Ck/1/guOCK+eUNrnWtll9AQiNOni0QFMJNzTAl0kv8ozAzzYkCQ/xTFgXsiXMwtxgRIu3P69qWTN+2SW10GFd7HP1ygaieo+70qG7SmfHYH1nkrVEi1qoPwIHtLbAizyLW6FebyXjU0jpGs/NH4r8aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yM93/XYrl9lbCk3W4MwM71pBxzanupWWO9VvDhzXhys=;
 b=bGF8zxckw0gUW5AH/1bf6qUT170FmWpfGB3IkgIWW06X97MqinzNxEVksE47bLlDzf1yAKStt/I0Z7B2n2f6FuA2mMsKUnoVnmwrNkMUVygmlIxNcZOa7pjCtEKtTn7aQv5RAt6CUAUfT9xzXZNtYgASl7dWWrSb0BJmd1Ba5Hk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 9 Jan 2026 12:37:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH] pvh: Introduce SIF_HVM_GHCB for SEV-ES/SNP guests
Message-ID: <aWDoeuHWLQ04qdI0@Mac.lan>
References: <3b6f5146287d3402a09836b7cf876d4f8dc9eee1.1766889890.git.teddy.astie@vates.tech>
 <0c9c1dbb-28e1-479b-a680-e99150b3f0da@vates.tech>
 <aV_s6ySoXU-G7Gno@Mac.lan>
 <f45ff7f7-aa71-4ddb-85ce-eadb1dfdb07f@vates.tech>
 <aWDC_UDsHkXoKu44@Mac.lan>
 <ca59701c-6c3e-4e9a-84b5-1a31037fa611@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca59701c-6c3e-4e9a-84b5-1a31037fa611@vates.tech>
X-ClientProxiedBy: PA7P264CA0149.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:377::13) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CO1PR03MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: 217b96f9-b66e-4725-7e4b-08de4f737b14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1hOMVp6UVNaNmh0QXZ4UlIxQ2J6ckZSUUptcjVxMVRndDBLOENhUnJtOUU5?=
 =?utf-8?B?VGM3OGdydXBMOHREYklDWkpjaHN0ZkgrZ0o3NUFRNktTSFhWa3h1cm1nQ1A4?=
 =?utf-8?B?Y3RtKzV1eXBwQ1pCTlkvMEJNaUJmajZqbHoxcUZRSnQ1UzVSOG50cWg0TCtF?=
 =?utf-8?B?dVpGcTVkc3hKd3F6MmhxSVIzSUg3M0t0dFBEL1JDMUF2V3k1VXhGc3FDMWlV?=
 =?utf-8?B?NEllMGJOR0pIQnpRTUxqOVFSV1lIYkhYTmRid2ROT1FXQ0JtSHdMaVJSVHQv?=
 =?utf-8?B?TXc0cVR5d2pkc2wvV251OUpGQ0VXOUJvK2sxMWJ1Ri9aakxteEMxVy9iOS9W?=
 =?utf-8?B?UldHbkN1MG1OcE5pYzd6ZkgvektobVhsb0FDeWZDMThYeWJuK3ZRWWY1L3Vo?=
 =?utf-8?B?NjBLeVlPUW1ZaEQ3Ny94akdjVXBkeGRwVktURTc1eXVxVStyc09OdHY5Y01U?=
 =?utf-8?B?N0xVRDA1b2RwZWRLTkJRblBqSy93ZkF2TG04VGhwNTlHRWJNRHkvQXNnVzZj?=
 =?utf-8?B?UWtkOVc2NkVVdG1IeGFqbGltWTFkcDdtMGVrQml6R3hXTWpjWG9UTUcyaGRG?=
 =?utf-8?B?aW10SUpZc0VTcXNmc0RKeDA3ejhSYXcxanhoeTE0RHppOFhMTTRIbzFLQnVO?=
 =?utf-8?B?WFgwWWNFb3pZd1FqSkd5TUxSYzdKdjRMZ28yenM3MUppTkV1Q1g1Mk02bllU?=
 =?utf-8?B?SzFocUJPdk9mQlBwNzBDN05XYzJyUzM5STIvLzNJY0ozQit4azN6b3pzRUsr?=
 =?utf-8?B?aER2ay92dlJiVjc0end0Y055MExNcmRqMXRjOWw4dlhWMlRNY0N0dzFibEFJ?=
 =?utf-8?B?NVdaM0JkeGtmYWQzdlgyUkJRM3MwRk50QVNwdERYNCtiWWU0dkNRWjJTb3gw?=
 =?utf-8?B?RlBOMG5uL2R0dkRFM1NRamkrK3lDOVdtOGF3RXMvbHdVS1RtOEFQNlBkYzZJ?=
 =?utf-8?B?RjR5YjdRZE1IQ0ZFZ1cycjAvdU9tUEw1TTFOaFFnVFZSbHBCTVhON0M4WWVu?=
 =?utf-8?B?dGh3eVE1dFdUK3hBSFg0R3NQenZoWktvUHRsMDV0UkVHMW1KRERnZlFHeEh2?=
 =?utf-8?B?bHdlRkhnTEFhSUR0eTI4Vk5DUVlmQStoNXgyUFV5Z2pyMjVTVFJyZkc5OGR5?=
 =?utf-8?B?YW5CdmQzdXBNMy9BWVUzbjVvVTM0WU9QN2lHSVRTUHMrRHczbkxEZWhxbjZX?=
 =?utf-8?B?clZQbWpkQmZFZm9DMkFxRGhLd3BacUFKSGI4clZudjVSeGNDS3JSQ3hkWXNr?=
 =?utf-8?B?ajZUOGhHaiszMW9ZaGJzeFdoTllralZHQi9Lek1WcEcvYWVkcWtNYkdEMWtt?=
 =?utf-8?B?aFAyZ1NDUVpoeHBmT1VIVVRXNlVSYmFpdEtuNTVwb3NjdjhQWFdFVGhkSlYr?=
 =?utf-8?B?cGYzSDExWGJFUWFUL0xCWFVuQmZ3M043YStweUw1bmt5OUpPMWQvMmYwTDhv?=
 =?utf-8?B?cm4ydHZ3dFhCUy9HQnkzVHFTL3BkaFhJV0tORmlTUXc0N1hxeDliR3ZIRm5r?=
 =?utf-8?B?a3ZrNlp0eGw0eEUxalI0Z1VlRTlraGlEYWUzRkphWjJQZys1R0NjWTlVS1p6?=
 =?utf-8?B?OUJSTCsxOEhwSThmZVA2c1NyTzZjN0ZmaUhQcklNdUJJQjZYSnVzbnhHdyts?=
 =?utf-8?B?R2ExQ2ZPWFA3QmpTM0RLU1owUWxqd1c3WUUwMGNZbkRCZFZVZ1AxSlg4ZmJo?=
 =?utf-8?B?bitzRkxpVUdyZzhDV2pKbk54THM3VHlxcmhXdjZIWFJMSUtRNEJCL1Evc0dq?=
 =?utf-8?B?d2NjYkpqbXBYbHM1bGlaTkp6djh4djRYSWhiR1JQUnpMZnRlNFpxVjcwd3Bn?=
 =?utf-8?B?Ti9KMitVbnRLOHN6NXlTbEc1Q1dwQmtVNi85N01pNytnQW85TFBYU1l5ZVpu?=
 =?utf-8?B?eHJSc05FSllFRTlLOGdVd1JSNVFyVGtOTE0xamR4UzhIbTBWYURkNEM3YUdX?=
 =?utf-8?Q?DPOel3QkIbkPt47XsXqoI7ga6lR3x4Fg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V21NOEJqeFY5MkZSeGovR1B0RHBjdXlWU0hXTGh1UWF0TWd5Z1RZOWRtV2d4?=
 =?utf-8?B?cUtwM25WbjFaTFZaYjUrTS9jRG5Fbmc2SjdLd0I1RklDZnlXdTAxY2Zlalli?=
 =?utf-8?B?ajZPY21xUkt2aFloajUwTVJOV05wSnIwcEM4QTkvU3NycHFUV1ROWWRvWlJs?=
 =?utf-8?B?THVlejE1UThxb2JrdE1xWEE3NlhrOVk2UkNnakhhWjB3bjdaS0p3VERiTXpz?=
 =?utf-8?B?cDB2MlZzNGs4c1YyZXptSzFkSFRUSDBhY0ZrUzJqWFdtWmRSUmZRZ0pMcUlt?=
 =?utf-8?B?ekFRMGVrdXY0OEJWZkJOM0pXK0Fldk1FN0tCZW9SQUk2T0gwQ2Z5RUU0SWV1?=
 =?utf-8?B?M3JGWjJFcHlvMTJCWU9zck45N2oyOExnV1I1a24xRDc2T3hvQTUxVENneGN6?=
 =?utf-8?B?azVGMHlsLzM3UEx2RklhWTJUdlNzck1ORzVkTGh4d1QrRjZQd1prcFYwYTNL?=
 =?utf-8?B?bE5kek1aMnpWZE9CYTB0UllvY3RsTmQ3QitYYnRIZy8yRE1yV0c0UDZRSXlp?=
 =?utf-8?B?VE5UZHhiWjEwTC9NT1J0YzUrUzFUbEcxQXdlUzgwaXZGNmFWNGV5OGZBVlc4?=
 =?utf-8?B?eUNNVzNXSGdVeWc5VlpDcWZCTHgxc2RSeldZWDIvSmRvMkU2dHdzNGEwYng0?=
 =?utf-8?B?K1VrRjZKcUZSbHlpZU9tK1ZnQUxPeUhpWU5idnZwa1pDZzhnN1VVR2FWU3RN?=
 =?utf-8?B?cXR2d0lEWTVZa201NDYxd3o4bEVieHhkd3AyWXhhTVVBQnlCaDMvSTVtMHQ5?=
 =?utf-8?B?SXZkblVJQU13Vnk1Y3RSN3lXMDdaandJaEd5RG9PQk50cHp4VkJjWjZ4NE9y?=
 =?utf-8?B?bG1xMTB0bktLVzVsNVVjZlhqOUVMbHJsRDlmV0wvYXQ2eFBjZ01UMmlmY0xD?=
 =?utf-8?B?dG5LTXFaSTlVSmViazQ2Q0VGVmhHRzlQeU1mSDVHeG51bjVBTll2VFg5Tzhp?=
 =?utf-8?B?YzFQN2M5ZDBPeWsxT01JR2VNamlUZ21HZHBxOTBlWEZYMkVSUkIvZTVsVXBQ?=
 =?utf-8?B?MFl5NTFiSzVWbXpXOFI3MDFoZ042eXNqNnlONmg0SVVXeEN1K1U3M1NZV1hP?=
 =?utf-8?B?bmVpRWRjSFp3RHlQY2hreTlIcEFKK3cxQVVIN0xzL2c5anpBc0pNcEhsREZY?=
 =?utf-8?B?Mm5ITXZRTE9vWk9zWEVSWXFRWG9DU1kwc2QyMS84TDh2ZitmTmFOeHQya2pO?=
 =?utf-8?B?KzdXekdoN20ydDlseGZTMzlnRytQamFpZVU0Q0FaSW1ZTmY0SGxHQk82Yldq?=
 =?utf-8?B?VUdBM2xaTmVSSHlBRTByeE02QjB5SUQ2ZFpCekI0NjZBKzhLUWVUZEtsWjNX?=
 =?utf-8?B?ZElHbDZNSVg0NmlaUk9xejR4Zk5scXd4RFM3N0xsMXB0RndiS2VZV24zZ2VZ?=
 =?utf-8?B?bTVvK0VhT2xIS2MzWHdtSWovMU54aVNjZHFFSjRnankveDN2dlhUbnZQNmg5?=
 =?utf-8?B?Wk5POHNuejBGc29HTzhPRUdoTVpGbUNYN3Q2Ymh4azExbVplckYwektSZkcz?=
 =?utf-8?B?eGlsMnBVM2orMzQ4c2JQSTYxR28wR3FRc1A3MzhndnRZU2tmc2k4cVl4NTA4?=
 =?utf-8?B?TFJWRDZwUGRnSnZaSGY3aTl2UnlMSXM2K2xMdDJjNWtpbkRock9ZQTA1Mk53?=
 =?utf-8?B?VkF6eVBRTUJSVkZuT3BsaXZmQzZUUlI5MWR6c09ZQmdLNkJad2JoRlA4MnFO?=
 =?utf-8?B?VzQyV1JVK1drbjNvRmMwbWsraGRTd2pqNTRRNWdjWGRob0J5V3dkRGR0dnlK?=
 =?utf-8?B?RHU5cmczLzY0QWhxSEp4d09EVG1rdE56SmVwUFJKWUxLMG5OZGMyMFNINUxM?=
 =?utf-8?B?Yml1dS8za0dNbEVBRytBdVZKUDlTMk1KRGNaamk2WVorc2tUM0FHUksrV3oy?=
 =?utf-8?B?Y1o0N3F4Zm55aGVJRFZiVVZqQXgxaElpL0RGNlYvM3BUMmlyYm1taklWQzdS?=
 =?utf-8?B?R2gwdGxwTXFlZ2Q2dlA5Q0Z4YmlpZ2UvSTdNQTFyVnhtZkJ3WU1EYjd3bnhy?=
 =?utf-8?B?U1plSG41cTRNRmlpU1ppSk9WRVEzb3ZwRUFCMTlHUUVqMnNvYmtrdWZPQjAw?=
 =?utf-8?B?eVJTUUJFNVVHbUh3NHFvNTB4VUk4NGhEMHRwSENHS1pkNktJY0JSZEJabTFu?=
 =?utf-8?B?YUFSMXhnUlNnTHFMcDl0clBmMjJtekdnNWo2R1BLeE5LN2o4M0NSS0dFeTNP?=
 =?utf-8?B?UzNtQkdIZU82VXZORW5DSmxOSzc2clRLRnRnWjZUMDVKMTBxQ3lTMzczN0xa?=
 =?utf-8?B?aUd2Zmhqa3dIMWlLbjRzMmtOaTczZDk5cXI4R1RET1psRXhzV1Flb1RhT3dk?=
 =?utf-8?B?b05GVkdlNWFjMkhwL0dyWG1hRFRQYzM4eGZFUjZVSXYyVmx0VGxVZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 217b96f9-b66e-4725-7e4b-08de4f737b14
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 11:37:34.0042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1hCoBVKThvZoLLGdLxrizqnUJSHbHFLaOR2hTwLBb5VhQ33bll7ftsFtJxwEGGzB++zGJ7Ahv44MTM98UByPpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5761

On Fri, Jan 09, 2026 at 10:31:57AM +0000, Teddy Astie wrote:
> Le 09/01/2026 à 09:59, Roger Pau Monné a écrit :
> > On Thu, Jan 08, 2026 at 07:12:48PM +0000, Teddy Astie wrote:
> >> Le 08/01/2026 à 18:46, Roger Pau Monné a écrit :
> >>> On Thu, Jan 08, 2026 at 04:50:51PM +0000, Teddy Astie wrote:
> >>>> Le 28/12/2025 à 13:54, Teddy Astie a écrit :
> >>>>> Under SEV, the pagetables needs to be post-processed to add the C-bit
> >>>>> (to make the mapping encrypted). The guest is expected to query the C-bit
> >>>>> through CPUID. However, under SEV-ES and SEV-SNP modes, this instruction
> >>>>> now triggers #VC instead. The guest would need to setup a IDT very early
> >>>>> and instead use the early-GHCB protocol to emulate CPUID, which is
> >>>>> complicated.
> >>>
> >>> Possibly a stupid question, but how is this information expected to
> >>> be propagated to the guest when there's a guest firmware and
> >>> bootloader in use?
> >>>
> >>> How is OVMF and/or grub propagating this information between
> >>> themselves and to Linux?
> >>>
> >>
> >> When booting Linux with SEV+UEFI, at least during the UEFI services, the
> >> UEFI firmware transparently handles #VC for the rest to allow it to
> >> perform CPUID operation.
> >> (with SEV-SNP CPUID page exposed with a specific UEFI mecanism)
> > 
> > Hm, that's going to be cumbersome when using hvmloader in this
> > scenario, as it makes extensive use of CPUID and hence would need to
> > setup it's own #VC handler ahead of making use of CPUID.
> > 
> > Or we must instead get rid of hvmloader.
> > 
> 
> For plain SEV, hvmloader would need to run with paging (PAE or 4-level) 
> to properly handle encryption bit. But would also need Xen to handle 
> MMIO instructions (which has some quirks due to being in encrypted memory).

Does hvmloader really need encryption though?  What sensitive data
does hvmloader deal with that would require encryption.

> For SEV-ES, #VC handler + GHCB is not only required for CPUID, but also 
> for VMMCALL, MMIO, some MSR accesses, ...
> 
> It would be easier to not use hvmloader, especially since only UEFI 
> supports SEV and guests would still need to support (Xen-specific) SEV 
> bits to begin with.

I would be very happy to relegate hvmloader to be used with SeaBIOS
only, and to load OVMF directly for HVM guests.  But I don't know
what's missing for OVMF to be capable of that.  I would think not
much, since it's already almost working for PVH guests AFAIK.

Maybe PCI enumeration, but OVMF must have a way of doing that already
for other platforms I expect.

> >> So overall, this proposal is only meaningful for PVH booting, everything
> >> that comes after can be handled differently.
> >>
> >>> Are they relying on the CPUID discovery logic mentioned above, or
> >>> there's some shadow infra used by KVM for example to already convey
> >>> it?
> >>>
> >>
> >> OVMF at its startup relies on #VC for emulating CPUID.
> >> It then relies on GHCB MSR for getting SEV info/C-bit (but only with
> >> SEV-ES). And under SEV-SNP, it uses "CPUID page" instead of GHCB
> >> (PAGE_TYPE_CPUID in SEV-SNP firmware ABI specification).
> >>
> >> This is because SEV/GHCB specification recommends using CPUID page under
> >> SEV-SNP (even though the same protocol as SEV-ES still works; but is
> >> discouraged).
> > 
> > In a previous reply to Jan you mention that Linux already has such
> > handlers, but just for the decompressing code (and hence not reachable
> > from the PVH entry point, that's already decompressed code).  Would it
> > be possible to share the handlers with the PVH entry point?
> > 
> 
> Maybe, Linux already does this for few parts of SEV code (e.g 
> arch/x86/coco/sev/vc-shared.c being also included in 
> arch/x86/boot/compressed/sev-handle-vc.c).
> 
> Everything we would need appears to be contained in 
> arch/x86/boot/compressed/mem_encrypt.S.

I don't know that much about Linux whether it would be easy for the
PVH entry point to re-use that code.

> >> In GHCB Version 2 (SEV-SNP)
> >>> The hypervisor may supply the encryption bit position using the SEV Information MSR protocol,
> >>> but the guest should use the CPUID information supplied in the CPUID Page to determine the
> >>> encryption bit position.
> >>
> >> But its location is unfortunately undefined in this specification and in
> >> the OVMF case, hardcoded in firmware metadata.
> >>
> >>> Adding Xen side-channels when there's an architectural defined way to
> >>> obtain the information is a duplication of interfaces, and could lead
> >>> to issues in the long run.  We can not possibly be adding all vendor
> >>> SEV options to SIF_ flags just because they are cumbersome to fetch.
> >>> I know this is just one right now, but we don't know whether more of
> >>> those CPUID options would be needed at the start of day in the future.
> >>>
> >>
> >> That exists for SEV-ES and SEV-SNP (even though complicated) but for
> >> SEV-SNP, it would relies on discouraged mecanisms (GHCB CPUID Request).
> >>
> >> AFAIU, this flag is enough for setting up long mode and GHCB which is
> >> what matters. There are some additional structures (e.g secret page and
> >> CPUID page) which could in the future be eventually exposed as PVH
> >> modules; which would be hopefully less intrusive.
> > 
> > If my understating is correct, this is not needed for the initial
> > implementation of SEV (when hypervisor doesn't implement ES or SNP
> > guests can use CPUID), and hence it might be best to wait for the
> > basic SEV implementation to be in the hypervisor before jumping into
> > ES or SNP details?
> > 
> 
> Correct; CPUID is handled normally when not running with SEV-ES/SNP.
> 
> > AFAICT (from your Linux entry point patch) you end up needing both the
> > CPUID and the GHCB ways of detecting SEV support, so one doesn't
> > preclude the other.
> > 
> 
> Both are needed if we want to support both SEV-ES and no-ES cases; but 
> if only SEV-ES+ is wanted, the CPUID path would never be taken with this 
> approach.

Since in Xen we do want to support plain SEV (without ES extensions),
I would focus initially on the CPUID path, because it would be needed
anyway.  Get that working on both Xen and Linux, and then discuss
about any ES/SNP ABI additions.  It seems premature to do ABI changes
to accommodate ES/SNP support when not even plain SEV is supported.

Thanks, Roger.

