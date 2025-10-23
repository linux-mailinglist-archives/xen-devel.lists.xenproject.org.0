Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D56AAC01DF4
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 16:46:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149221.1480908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBwa6-00062g-R3; Thu, 23 Oct 2025 14:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149221.1480908; Thu, 23 Oct 2025 14:46:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBwa6-00061G-O0; Thu, 23 Oct 2025 14:46:22 +0000
Received: by outflank-mailman (input) for mailman id 1149221;
 Thu, 23 Oct 2025 14:46:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ct/T=5A=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vBwa5-00060z-7x
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 14:46:21 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff3fea25-b01e-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 16:46:03 +0200 (CEST)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 MN2PR03MB4990.namprd03.prod.outlook.com (2603:10b6:208:1a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 14:45:59 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 14:45:59 +0000
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
X-Inumbo-ID: ff3fea25-b01e-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CIANcA9bjt6q2moQXZxQAgpfsREAjWICiH4u3TQ8WIXSOPw9nDXGGGOQjZ43t7P7tj69tXn2gOzzquTiHQUbhM7a1fRBzd4grZH99m9QNvkNMWS7bMu97278Ft9YRPbK9cXhcYP4YlEFJmEgmHZCUw61N2j2O416MsfNVx0rGqpXIaobdjCWZz2oGyNXPnBRi/1ykGqbtoHPk/mJKAD1IxL5eilAMnEhaYMPUGjjCfheZYD2ts4Utxv3mFDPJGMmh6EoLOE5PkaWjW8zx4yJXkVeSEVKuEg9tTx78fTKWxnG6YGzKbF3yE6fzk9U7zwBgvs0hXGCCu+nfZnZo0rR9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgbAAT8EsTp2lBPovP/Xa9rB/J0cfCEbCaY3hrZjNDI=;
 b=UDCoGn54ZlXbNRBN/1G6LZokv7Ui2MKgbMhWdRoRNZ8XA+HYEj8uQdgO9LkOo+lSpYdGK8LzXs6eI6ILQQ7kMQlpMlpTSb2H2HgkXn3Mya/wOHTq9UThMqwGDyTu5g4WP7KvaY8fYCD5wy4MCGDOBa/rBK0S+d3TOCEcDtkqTPa6OSgMnMN3LRSkinwwGxBBLE5U3MYnONYEDlcoKqE0wZe6I7IoMlZOwkR76au7g1hEMrjzpza+RrmvUuoNUCZFf9bGS8GivTwI9b63y+K5KHSNwQq/kZeSIl27gcVJInP8sTfJ8xqOyiCl3j+2U3c8XZyB65QRNc7yTHhR8ZnR3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgbAAT8EsTp2lBPovP/Xa9rB/J0cfCEbCaY3hrZjNDI=;
 b=Rgyism8ePjPPSFlkzdayBDTGzVCiKGyxCiu/wJOZblZbAchOaGpsJ8Ay5/1b402J1za7NdMI/XDW5cfigep1xv04b6k5ThXYp5EKz01BkADk1l1YluzO5tsYqUqdHosQQLT5i5eNFVrmP2YkLnsj0sUPcDBgET3eI6TxYB+Ol3A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <bd6c0e3f-f2bc-4399-adf6-d2dc18b06982@citrix.com>
Date: Thu, 23 Oct 2025 15:45:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH for-4.21] tools: require at least json-c 0.15
To: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20251023085730.36628-1-anthony@xenproject.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251023085730.36628-1-anthony@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0037.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::9) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|MN2PR03MB4990:EE_
X-MS-Office365-Filtering-Correlation-Id: 61587b5e-2131-44ca-306a-08de1242e133
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVdFQmllTVVoSE9VOVJsWkRHUjNudkc0VXNtTHJkV0p6QnQycW5oZFBDUFo3?=
 =?utf-8?B?bHdtcHhaaFFyUDg5bFJsejBsR0Z2ZGhUbzUwWXR5SDNobXdub24zb09GYUI4?=
 =?utf-8?B?R1pmalFvMFJQWjZDUWFkcUNNck1CYUxySUQvdVR6U1Nna2lsamdkVkU3QlRN?=
 =?utf-8?B?SU05WUY2cWVHWitlTCtZb2tBeW1UNHBSdEg4bkh0Ym1yRXVMWC84Qkw4UmhJ?=
 =?utf-8?B?Z3ZFeTI0RHNxazBsanBYVEpacmE5NW04ZW1ORWYraElLa2ZENHRFamtvTm5w?=
 =?utf-8?B?dFJSY0ZWRlhZMXpPYVE4ZXdzUU45dmpkaUloVTJmaTMrRUIzQ3QvZEw3UkVP?=
 =?utf-8?B?Tjh4b1J4cmp1alVNTTBpVitBTHpxbjhmUnV5ZmpJOXN3elhRYXFIY0xlbWJm?=
 =?utf-8?B?Z1VzWUZPd21hTW1ENlEzejdDQ0VWazhIbDhvNTV0QTdzdzludHduYmNlR05V?=
 =?utf-8?B?eTZMdXdCU05BZUFIa25SbVJSQmhBTzRxV2FwS24xUThZZy9BNXZFZktUb2Fj?=
 =?utf-8?B?cHJub2E1cnpMYkRPNGx0UGVhR29CeWx0bXREcDVrc3ExQU42RjNzcklBTGVB?=
 =?utf-8?B?WWdXckE1ZHhqNnlzUkRkTG5pRGNFcUdvYnBXV2NYRm9HQTZRYWFpQXZNSENE?=
 =?utf-8?B?d2pPazhlTUJaYytuVTgzOW91ZnhiNEdVWmRlNlg3aWlGcEhFejd1bW9tVUw0?=
 =?utf-8?B?dWttOHZRdCtjNGp1N1RlYVlPTmtDdHdhUnhoODFvTmxmeWt0OFVyOVZ1alo3?=
 =?utf-8?B?SnlUNFhJZU1DSDdENTMzNGM0akh0eERDQmtQeFhvWW1Tdk53N0QyTGZ4amtX?=
 =?utf-8?B?SUhpTTd0cGE0U01pYTAzU0FDSTVtRmtYZjBRWHVNYjR4S3cyMi9HYmZYTURz?=
 =?utf-8?B?K2JNZnJBTklSY3FnNC93YVdBb1lMU3F4ZUUwTkhWTEc1OE1uem9Qb3BPM1Mz?=
 =?utf-8?B?VjZNYkJYRUxad2E2YVM2cEp5VXVHUXJXc1JNQUFWNWY0Y2d4TDhsU0hVSDNB?=
 =?utf-8?B?MUt4ZlR5M3VrZ0R3VFMxZGVCR1JieTRwZG4yWkJ4VFZ6VGVTbldqSTA2SGtV?=
 =?utf-8?B?QVdXd3pzUzVwb0tCNVU1ZFJyTmhCMUwrZzZ3alhoUW15b21kd0N3dnd1dU8v?=
 =?utf-8?B?ajl4Nmp1MmR0Zm9vYnFXVWNhZFI2UFRaSG5oakJLcVhNbXJYUGxtQzF0eEdP?=
 =?utf-8?B?MXBodTBGTE54RithVVl1ZzJjcDRXNmpsaHVHT2NnTXRDaEtNY1grTVUydHVY?=
 =?utf-8?B?ZEtnTUEyR3ZSVXNQcUFhYS9ETjZWMFo1VURnT3VCdklOSk9JWEVYbDhzb1B5?=
 =?utf-8?B?bExvdDB3cFdQNnFSK3VOYklsVWJMTTZKMDB2cWZnVlFVZVZJcm5raTFkYnkv?=
 =?utf-8?B?a2p5QjNMVEg2L1ZmWGJZSGxCUGtLOGxLSmZUM0xSdTBZeThUOGdiSFpQSlZa?=
 =?utf-8?B?TmlzQTFEeFR2UklkRE1SR0tPK1VEbDNWOG5vSXRxdWNRVVVSQ3cvNklCRXNY?=
 =?utf-8?B?amJCandvL29KRVpHT2YvSCtHMkdMT0hQc0Q1dW1rS3lQL3pocHU0VnFMS3dy?=
 =?utf-8?B?Y09lZ3I0NVdzNUJEUHdrUGEySW5mTTBPVmdmekFXTkVIUjk1RExvcUpabCtC?=
 =?utf-8?B?aHkwOVp4YlJaVzlhc3k2MDJRUjFTTFM4TCtNaU5WUnJnZjZ6RUFuU3RnNURU?=
 =?utf-8?B?VEdZVkRDUUIwb1ROeU9ReWhheWUxWVVzUG44RnNaNlZHMGxiOHhqby8yajd4?=
 =?utf-8?B?Y295aC9vS2xBMmtYY01jRU1HaEhLN2I1SjdFNTFaeU02bFM0Mkx2aEw4bWZD?=
 =?utf-8?B?NnV6NU45MjdTbXJ2MDc0WTBlVmpZR2JDS0ZVQU9ySVIvYVBFZEoyT0xrUDRG?=
 =?utf-8?B?eGFzR1NjZFQ1elArN3pXNWVWdVBLcmNsQkNyL0RGWG1zM216WUkwUjN5WUd0?=
 =?utf-8?Q?XwBQzPQ2s0g2LCYYfzrEiK6KgwEhooyk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHFka25sTUxqZURXRGQwVSt1RVVCQW5nUHYrOXh0Sm10b1JIWU9BQ2lhNTlG?=
 =?utf-8?B?bVlaMHJJRjF0YVFvM3J5ZXNKYm8yU1h2NU81QkpvTkRYTjVqejlyc3JVbzM2?=
 =?utf-8?B?eURFL3B2OTYrRFBXdm5yL3c4dDhTdWZxTUNvNjJnYk4wN094OHBsaG81UHJN?=
 =?utf-8?B?RUFrMlpJdTlOZkpWbWdHQXo4QytGOVpZTkxWK0J6Z0gxTm92ZTIvY1h0SXJT?=
 =?utf-8?B?d3VXTmF2dUw0bllvTlVlNTBQNmdPNjlNbGE1MGVVMk5NSVl1Mm9PMy9Xbm5H?=
 =?utf-8?B?NnZzNG1PRThpQ0FkckYyblNCQVBYbEVkTER2eHBnWjkzYXFNcisvcU9PTml1?=
 =?utf-8?B?SjZ2V1haNWlMa1ZGQmNNZUp5RksxWnBUZEsyYUtWNWdLcnpxMjNyZW0vdGlW?=
 =?utf-8?B?Szg5enRSVVdUZUJodmlQSFltbXN3ajVQaVFXY2ljcExYK1huMnNqVG1VS2oy?=
 =?utf-8?B?aG1EWWVhMzJRZm16Zk1XU1kyV01JcDkzY3dNY3h3K1B3RVQvbmJoaHdISFIv?=
 =?utf-8?B?SFBOdFc3TFgzaEFMWjAxTE9sN2tScng1b21HUitEdVNrVXIvN3JNMDBuN3pV?=
 =?utf-8?B?TndqRXhVQVovUTlBZFNORUIrQnlRRXJpVjR5UW9SVGNDVU90bkpkU0FiRHho?=
 =?utf-8?B?dWNMYjFzS1c3T1RUNHplUk45bGhHQ0J6YWZWcldtamdMaGwwd2wyMkRldC9O?=
 =?utf-8?B?RlhNK1FEZlVVUUhXWTZwcDB1SW9sY0FrS1U0UVRkd0YzK01VYkZERldpTDlE?=
 =?utf-8?B?NnlmdlowME9KVVd1U3FVQVlVTDg1bll3YkEySWRtdkZ3Zk0rYVR0UVJXUlRD?=
 =?utf-8?B?dUxHSEQycXlwYU1sa1daanZ0T0JSQ0FPTHFaQjhHZHVwN25obWEzTFpGazRN?=
 =?utf-8?B?YzVLeFB5dlBCWmo3L1UyZzBJQVZhV3lzajZ5T2RXVWxSM1V2NUljekF1dEZK?=
 =?utf-8?B?OU1Ebk9LV1NJR1U0ZFUzVmwzRUxudFBGZk1xZ3psR2hrM0dsbHc4Y0E1LzBo?=
 =?utf-8?B?OHI1d1I2NXc3Unk0eWpZZlJMa0NDaDk1MlJ5c1N3bWhzYkRqaTFIalVMSFBn?=
 =?utf-8?B?WjhPWHhJS1duQTRsNk9UbVJLMEF0N2l4akMvRXVnRk9UY2pIMjBvSXpBUjg0?=
 =?utf-8?B?dit3d1VNYUxPeWY5ZDkwVG9ObnRwSUhVSklmdGNlWmd2YjRocm9ZaUNQRFVQ?=
 =?utf-8?B?VlN3TG1OK0JDbVVRVzJvMVVidUxKVFhkaGp0dmUxSDBpdW9nNUZ2NlI3VnBw?=
 =?utf-8?B?UXN3Sys4dHh4NWZkcy9sbWhyR2pJYW81N3hJMjQxRk42R3ZHZXAzR2xwRlZR?=
 =?utf-8?B?bCs1QjlnSjZsM1NMUVdCR0Q4Q3dXcHJTaXNVWENveTZ1bDlkeVNCOXI3eVhF?=
 =?utf-8?B?Vk40UXFuVkVxcHREMXN5R3ZsaEd1NGZ3QUl2MVp1TXZ3Z0hhVjFZVGlYQmdK?=
 =?utf-8?B?RDBFRFBEcVJGNHJYdW1FWG5YQnRkM3MvZUxVT05lRDlHL2FCWEc0T09CZ29w?=
 =?utf-8?B?V084TEJoMEJOYVphbDhhYmxUUDlwOXQvZlNMTkJuQWw5V3RLNlB1NlZvdU9v?=
 =?utf-8?B?WW41aDB1RjVNRGdaaG4zRUhrTVNlM3pDenEzSit0YUZJUG5zZHVDV0xwQ2Ju?=
 =?utf-8?B?b3Fmc3dJYTVITUNFb3JIK2xxbXJ0TkdkRkZlcUY2RWFsZG1tSTN0RFVkeEpS?=
 =?utf-8?B?U2EwNjZxK3I2K3VKYy8xa2FRMS9Va3gwbkgxdEdJOFZBeDVZckhWUGw4bjJL?=
 =?utf-8?B?cmZBRmpTN1BuOHF5NFl1U3REOWlPMjZPTFpDaEFiaDN6NFNSZXRMTktPVFpa?=
 =?utf-8?B?bmVLanpHcm9IcE12K2J0Lzd2OGMyMzNHUFBxZFJWWitnNE1sa0tLQ1BqdXhk?=
 =?utf-8?B?M01YVU00SXFZSExlcVRqT01YQm5EOWx1djhmTFdpc0NTbFZHNXdleEY2VVR6?=
 =?utf-8?B?aG9YQnRDVGl2RENYbjhUL0YrRzg4RUNpK1NuZ0JFZFNGOWN5bzljTGJsSnRE?=
 =?utf-8?B?ZVN1c1haN2FaTks5SFoxdUhpekszTVkrN0xSUzBvTnBuMTVPeWJiVFE5THhv?=
 =?utf-8?B?eG9RQ1VOc3hPYUtLWkxDL2d5cjVPMkZJd1hjMENZUlJjZkdNZ1VyNmZqMlFz?=
 =?utf-8?B?Wm1lcnJvVTZValBLam1xQi9lcnVPZHFwSWp2bnJ6Ti82eFRLdmdWc054SW14?=
 =?utf-8?B?Z3c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61587b5e-2131-44ca-306a-08de1242e133
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 14:45:59.2202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UWZS9Vw8KcsNUN7NvZUEvxggTr9b+ZTwyesiP+KQ+IFPE40V/QM05HhE41cEMR+mPevp0xjVnKaN9NXyaL4Gt0ZHMzN1Y83no2gB5MBRS2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4990

On 23/10/2025 9:57 am, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
>
> If not available, fallback to using YAJL.
>
> The code is using json_c_visit() which was introduced in 0.13.
> json_object_new_null() and json_object_new_uint64() where added to
> 0.14. And the last one json_object_new_array_ext() was introduced in
> 0.15.
>
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

However, you should adjust README and possibly Changelog.md to give this
new minimum version.

