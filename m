Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E52DD18DDE
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 13:43:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201675.1517248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfdkG-0002fL-AE; Tue, 13 Jan 2026 12:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201675.1517248; Tue, 13 Jan 2026 12:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfdkG-0002cD-6j; Tue, 13 Jan 2026 12:43:36 +0000
Received: by outflank-mailman (input) for mailman id 1201675;
 Tue, 13 Jan 2026 12:43:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vMW5=7S=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vfdkE-0002c7-7a
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 12:43:34 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77cd3824-f07d-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 13:43:33 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA3PR03MB7593.namprd03.prod.outlook.com (2603:10b6:208:50c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 12:43:29 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 12:43:29 +0000
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
X-Inumbo-ID: 77cd3824-f07d-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qktuLXAkBIctGvWW5OHcdE01eipJj9N/B6KXHRGPs5b1TzrtZUbaxIeCY5AgB8knUDzDpv0jT+cgWVtuqVyy1dUtu8hS3YMNDlpsUluC6jduzoTTurnmzSqE1yukoM053R1xnnskSAdYuXswoDCsopoTUTuSjCG0OCJqdvm9YOAI6rFMSmleZOf82Q1FOngtP3xE/l8eN2u3XqCONN20JESv9h0FFqJnFuNDa9Yw/wSC6nkDj+oiKZzkISsOAECs90ejksvtAR3lALtstAzbHk40g/jxX0ZhqNx+gTLXsm7HvCaHvnWOVwynDBn7mu3mCkTjTrkMskufMPNbVxdD9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=huRGABghhDDApfv3LQIBFoyrw4+2bvl1ZmoOSc6ciyk=;
 b=R1rIVzkC/hJCss66q9/1X242+5f1GLglH6Da2gQdkUFYU5x6HVErNPet/lu1WiiVpFp94i2KpbxPZcjqk1foT8BZtRvU9MIju+aMPfO2F1/cfTpraku3ZCJo9fC79FPpKJvN+HcCcORyilRi+E52JzY57lnv/arDgNnxfu15pYUE+bQuPtzpuCVjcq6FHkSq2nb9zxEnbMlRn/3mgLH8uccJjvoBWJbhmbhh9j1xigCHTjnjDIWnOmpIfkfnfWbI+ahuxIst7LqObhxGgyxfC22ARMl420i+ZrvmNn322JMqnwX1BQQLIFx4YkYpHrv76h9uxxPFW3XRuQpyq4TaPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huRGABghhDDApfv3LQIBFoyrw4+2bvl1ZmoOSc6ciyk=;
 b=GUx4rZtcdKlRPdgZf0aZNM8HUuBuEaLAywAmnEXd1d+0J7nrbr037s/g5XvIMGDsFc8TsfiH52MAOKXrfxmSjvC5DPw/83SLN31mm6peh59RtUgzBC/+hFSTS8YjrKstdv3vQCEXGbnAT5peTgN3p8XweDTazZ039VqfG1t0lh0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <15233b0a-2cad-4263-8e54-3ad17037ad60@citrix.com>
Date: Tue, 13 Jan 2026 12:43:25 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] x86: Use 32-bit counter for TLB clock on debug builds
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260113120959.55156-1-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260113120959.55156-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0462.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA3PR03MB7593:EE_
X-MS-Office365-Filtering-Correlation-Id: b6e65028-b6de-4cfd-6634-08de52a15a59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bUdJSm1vNmhMZmJaYjhTZkR0QkpFSU1KZEh4OGY1clR3WFRXV1JtTDVScDls?=
 =?utf-8?B?WEl6NHFRSzlSQkNsckorZWxHLzloYlNNYWpGWVh3Qk9jelpSTEJmTkRWbHVB?=
 =?utf-8?B?Y1l6NlhGN21hNzlIMHlOS2JmZ1JWV0FVam9VM1RKTHZwOStzL1hqTlRlTVNx?=
 =?utf-8?B?aWovc1FZQ1hKODdnTWI0dlEvSENZbDlTY090Ykx1bzZIR1RLQ2xGUGhhd0Zn?=
 =?utf-8?B?bFZib3FhUk01aEFEYVJjRC90aVhKVjFUTDB4WG9DMHZvNGZteE1lTzBjQU9G?=
 =?utf-8?B?MDBvQXRMdy9vWDFaaVcyQStaZ2o0R080WmRZK21HUE5uL1Nnejk5a3JZNVFN?=
 =?utf-8?B?SzN2MURWQ2FOOE5VRG1oODkvUGhyakFUbDBhNm1hcHQ2MlRZQTdMZ0locnYw?=
 =?utf-8?B?WEJzVFc4eEQ1QUt2M0JWNTJtSTQzelVjK0hMd211SEkvNythSFoxSFFFVW4z?=
 =?utf-8?B?QWh3aHpIUmJvRFFINW9rOXNmc1VlU1Vtd05GbklMV2kwcjRveTNGS0JxK1ph?=
 =?utf-8?B?b2FaTzF4QmtUR2F0VkxyUHUzSTVScDZBMmpZT1N0WUFKZkNjNjRUMDBpZ2pt?=
 =?utf-8?B?ZmUyZ25FdU9FQnFkYStWb05rTFJpMWQyNnBnbFVlUEFEdmoyTTlhZXpIMGFE?=
 =?utf-8?B?R2c5U3NreVBQTGxrbXdxL0FSRE9wWVhLMjVnODkwK0JiUUllLytHTzVmc3Bi?=
 =?utf-8?B?alpBaTZoTWRnaFE0WjVaSklndmhtMHBCZExTVUp2VUxOSS9DQ2xscjVQTUYv?=
 =?utf-8?B?QjJ3NS9XeTRUMENuRVNGQUpJbnRIV2NXeUo0a1UyUWVjNDRHUEJtejB0RWFJ?=
 =?utf-8?B?VDVQSnY0bStueTRjSGJSOGF2YmhhMFltSmhqYk9YWEZXcm1uWnhxK3NwVmgw?=
 =?utf-8?B?bmNrWlJwVnBhcGZQMjZJQkZsUlVwUjlKVWFKcEJJUWdCMzRVbmR3WXhVdFlO?=
 =?utf-8?B?Tlpkc0htTVlwRlpRbHoxaUF6ajJoQXNMN1BBclczMTQxdXlad0lsdlFRZ1BX?=
 =?utf-8?B?K2ZuZkVhbW13Tm5KSnJKclVVRWxnb3lzVWRRQnhkNUZLZ0NDbW9TejQrVUxo?=
 =?utf-8?B?VXpXVVcreFg1RVJ2dWhZUmxma1p3emFlYVdJYW9sRVgvTncvY3pkM04zU0xU?=
 =?utf-8?B?R3lROUdOTzdUbko1RWo0N1NON2ludzkwVmpjb2ZqTGt3OG5QNTV6UUZaakht?=
 =?utf-8?B?UWJrdUIyUW1VYWZ2VUF1ZDRqMkFqNmlYZzRYRndlOGNvOW16SUxHMlpUUUJH?=
 =?utf-8?B?VWRTNmFydjkxN1UvVjdmakdkQy9FbWdGUWdKd3JBaEdRTXVjZ3FXZSt5Z1Jq?=
 =?utf-8?B?b0lJYW9VaXZGckVRdHNtN3diQ1dLZ3VuSlZwTEdCNTl4YmNlM2NxNlI1am1U?=
 =?utf-8?B?RjhhQnRRRldrckU5T3VQb0NON0YzbzhrTW80akdvanNXMDhVb01HaEpJMWNs?=
 =?utf-8?B?Yk9zbmNtYUZXMlhzY0JVUzBpNFhjV2FWbTQza09mNGp0VitkSU95MDNwYkd6?=
 =?utf-8?B?U1UwTjBIOUdsUkZOUU9YQXA3T1ZRSHdzUVh0bytBY1dENDVDL1BKaFFjNWZC?=
 =?utf-8?B?dnAzUysrTzFsaEUyNXNaVFI5VTJmZUNNT1NST2E1dmpOQk02UHVFT3hsYXdk?=
 =?utf-8?B?Y2gzbGFFUmhDbHNGZWQ4QS8rYWE3a1Z4ZXAxNCtYTW53THpuMnp6OEtOc1R2?=
 =?utf-8?B?MlpjRGlrUzJxTVB6cEtuSGNGdlBuS1JhOTJ4dnZsakttTjF6THgvQUIxUnNI?=
 =?utf-8?B?VUdlNGgvSkNXSzN4aVFqcnZLQ3VGRHBpQ3FrWE5LaDREczZVL2hHOTZHK1lK?=
 =?utf-8?B?K1FEaTkvTEZKemhMV0U0dHJFLzhZdm5ONWowWWc4TGhOcjhTQlZVWEk3RGtv?=
 =?utf-8?B?T2FFVmZWYWg3UDNSWFVLb29rcmZqNjgwU1JTczVVTHUyRU95S3NEOFd3cVVx?=
 =?utf-8?Q?jKmX4LuB6iaVcCQebO6czNYkE3MyHpAH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnlENEhiUWpqeEhjaXBJYzNhdTZOSUdYUkNwNFNML0RxRDZlME01K0V5ckVV?=
 =?utf-8?B?SjFXalJNN2N4MG41cTFKeDcrOVdkZWMwaDBEV2RPY3VyTUFNaGtmOFN3Rkkv?=
 =?utf-8?B?VEZyUGFzcDY0dllxQTIyOWJoSW11OEdXR1Jub3M5ZkQ3dDhDcnJrVDlKaFFt?=
 =?utf-8?B?dk9sSjEzVVgzditld3BnNHVYM1FmWUZEL1lGKzIrNTRUMjN0V1N0N3FmUkNv?=
 =?utf-8?B?TDFzVVg3cnAwOFZod0JBSFRqQlhMcW5qUVlpRWoyNCs4L2ptSUR1eTROb2Fr?=
 =?utf-8?B?R1hlS2pCVFVtYjdGdTVHUkVsbGYxQ2tkUm94d1ZFOFRTTnBHNmR5T012N3dR?=
 =?utf-8?B?VDBnMUJEWEZmK0lrQlRkVU55Mm9RelBoQXByWUtlQ0l6d3l1RlQvMk1TakZO?=
 =?utf-8?B?UzZZelNNMmVONytGR0l4YXZoV1dBcFVRTzhZYUdIbmZFS3NMY2ZEZGNMMlho?=
 =?utf-8?B?Q1FwYk9SWU9MS3NwT2NrTXhnamJhTHE2em5QTjZWYVgxcy9ZSzVTc2FpY29p?=
 =?utf-8?B?OWlRbFR6SzFYMTBiTGtVd1lCV2xSSHFrUm1FTDN2Wjk4OFJmbC8xR1RtYllL?=
 =?utf-8?B?cEo0L3Y1L1RkdFA1OU5qUnhYS21Hb2Z2UHhaNzg2ZVNCWkpUaG5OY1Z3ODlE?=
 =?utf-8?B?NitjYnpkcHNhdnBPUzF0Z0JhT2NTa3BmR1pvdG9MRDdSMmVVOEFzYWNpendP?=
 =?utf-8?B?ZGdRa0cyZnI5bUlLaDJIMm5kazJNUDZ1d1FJVlNqMUpCeWRadWs5OFVjUzhG?=
 =?utf-8?B?RlpibURRZElEYXl2QzhOdGVpVXU4TW9KejFyUlF2RktyZ0o1Tm4zaC9NNTA1?=
 =?utf-8?B?STNkZzFaVzEzc1NWeC9kcVhvekFRWXE5Zk5ETyt6UWs0RVBEK0lxdkJCaUsv?=
 =?utf-8?B?ekJFT3M4UkJaRW10VEgwdWZpMldtdjkrajZDczRJZ0pWT2ZQR3lqaDB4cmUz?=
 =?utf-8?B?eXJUUGhYUGZFT1B2WWNhSTR3aXV6MWJxRUJ0dGdYUjMrWC9SN1lweHBwaG5P?=
 =?utf-8?B?WlVQelJ6TkJPeHJUMHMzM2NOd2JsWlJLTzArYng3dVpINGtUeEhzektHc3Rp?=
 =?utf-8?B?czhMRlA5WlMxUCtPdHoydG1oL2UwdGFlY0t3L1dSRlJ2bE94KzFhWW9HSVcx?=
 =?utf-8?B?VWJUaVZZNEJhaTFTRkpwbWhyWnQvcXJ3cUZMNUhBajNMN1BzV0I4Q2hkNDVa?=
 =?utf-8?B?T2JYWHlpR21TMFhNbGpzTHdpNExBN2QvMENrWHFSMTVpc0N4V0pyOWdjUklm?=
 =?utf-8?B?VWE2dk96NXdvT1JSeDBnU01CWE0rQUxNNTdFSWo3Q3pwd3p2YTdjbmJMM2xO?=
 =?utf-8?B?WWtPSlJ6YWNSTDhIdUd0c2ZlclZwTURvVGU0R3pFRXNXQVNIK1Bic1VrdXhH?=
 =?utf-8?B?c3RGcU1ITzZFSVMrTnZaRHlOM2ZEeko1NVE0WHZWbUNsQWFHSEJuNXpWNWk1?=
 =?utf-8?B?S1BGdGxiQjlESHdKaEZJZ05ZSkR1U1FKNkFiTDUwdnVNQVV0OWJjb1A3cXNV?=
 =?utf-8?B?dnA1UmlGOGJWUUNyenhTb1dDbG9OTDJkdlhjY3ZnSXU3cEN0c044VGkyaHBJ?=
 =?utf-8?B?WXJ6V1hJNjFHeUNBcW9LY1J1VVYzNlJhZXl5N0JUbkwwa05qbjFHSFlKdUla?=
 =?utf-8?B?Rk9VVWVsc01tbFZoZXdsbGZJTExvcTZCcEwrK0JVZE1TZitXVTlKUEtMcWpS?=
 =?utf-8?B?U3pIUGlSMXdKenpNYzdUMVE3cjh0WkhiN3lVYnhUbGtDQXV5NHAvQXcxWlN4?=
 =?utf-8?B?VlRCdkVPTFJwU0NiTEVKclB5QWJWSERhMUIrYTBzR1NWaEFrSkFheHU3K3FT?=
 =?utf-8?B?SWVMbGU3Y1lkOXRBd043SmRhR0xnaEtoSlp0dHNwZTJQbTBUYlJRNDU5ejF1?=
 =?utf-8?B?dEZpS0l1L2tGRFNadVpoekh6cEgvM1NOMWJ6T3JIRW1SRDRjdzlCbHZ3Q1JZ?=
 =?utf-8?B?ZFdreGpHTlV6WGhiS1Z3cHdNVkNxYURLakYzYm9GS1F1d1Q0QUx5VDJ6cHR2?=
 =?utf-8?B?Z2dZcGNrMHlQLzNVMUdEN0l0V0w1RWh4bCtldUJIQ2FycDJremIwYVIvUnpj?=
 =?utf-8?B?WldRajZLWFphQml0Q014Y0tkNzd1M3libE93WUdoUnhOQ0JkN014QzFmcjgv?=
 =?utf-8?B?R0lZZk44M3d0NGY0M1JERlIzODBkNSs2eUVqT2ZjSzRlUGFPcnE4UndCejV6?=
 =?utf-8?B?Z2JVdGxNTFRGNjlOU1ZBeHVSMkNGcXdGenpKR1lsVWJsVllUTTFVbFE2RXZl?=
 =?utf-8?B?Tm4wL3IvOEZ5eHRiSVJiN1ZGQUF2VjlCRm5hRzltbHpCMG5UVGZrSFRZeTQ0?=
 =?utf-8?B?SWl0ajJ6WjFvbjV4dDh2T3Nsdm5oSVkwWjQvai9ZTldQNVByeXVLQmF2UTVR?=
 =?utf-8?Q?XJrEucKeE30wwnzs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e65028-b6de-4cfd-6634-08de52a15a59
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 12:43:29.4281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XOYw+sV/UC5En8xOv5yyycNub/nbWkeojWs9aOtuvHoHmBzx4te1WE7EKXv8fJg7TSczApJeBHflwF+sypB7EU5NAmvfcVAaqR6uVAz4jOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB7593

On 13/01/2026 12:09 pm, Alejandro Vallejo wrote:
> Debug builds traditionally ship with a 10-bit counter for the TLB
> clock. This forces global TLB shootdowns with high frequency, making
> debug builds unsuitable for any form of real time testing.
>
> Remove this quirk, unifying release and debug under a wide counter.
>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

