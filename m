Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lOGKAgp7nGmmIQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 17:06:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 907501795A1
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 17:06:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239176.1540636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuYRv-0000ut-Vg; Mon, 23 Feb 2026 16:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239176.1540636; Mon, 23 Feb 2026 16:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuYRv-0000sI-R7; Mon, 23 Feb 2026 16:06:19 +0000
Received: by outflank-mailman (input) for mailman id 1239176;
 Mon, 23 Feb 2026 16:06:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ndCc=A3=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vuYRu-0000ZK-7N
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 16:06:18 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 953d1ad3-10d1-11f1-b164-2bf370ae4941;
 Mon, 23 Feb 2026 17:06:17 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV3PR03MB7706.namprd03.prod.outlook.com (2603:10b6:408:289::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 16:06:13 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 16:06:13 +0000
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
X-Inumbo-ID: 953d1ad3-10d1-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dm1fK+e1NM5SVja27lfGeVWTmVwJzWmAJpn/qWmCxOs4W4uVT9wgwhlozrdvljBkjTQnuBdYs9oK4dGxFXB1zahceL9PCWkdzgnjSTpUMdSfXNp3nuxMWU2HqeY4U0PgGDMzzIq9QxFnn5hin21tN2hLSOecmv2TCpOmDdl9hVLTMD65diitcEtapOM7btvUjXJXpsxDGaGD6PvawGMhWz3kNWpF0L4pIaN3xOuaonUgHfhkWiGYGAYn60aR/Kc7ADrMbiuWYxXPhCzdnZXTGkghsvBy8RtgCWWUlhQrLbmjOtZdODRDkXJRRUXVnoW7xhQELyTUTSbAC0r+CzEnng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIxAVvVpUm+kbIMfFSG5+bVoCzxPD9fCqbPI+jiKJSA=;
 b=Nse4N86bLZtPt1V7E82nv0J+PVFLaku1XyEv82fcN9f+PnbeWhuQwf5pCw24TO3B7wFS2EFIM7IHYCnUGPelfZu434KvwsEZHmEqhqq1CB+zVvR9XDAMY/hQv/DiV2h769MalCfYLVrJhLQm2XGnSSz77SFLEplGd93+Burs6torN2Uhm+ECXVK/PkcNx+bksXMEgzjLPpqCUv/5BwqpaDWRqiG/5lyDU8ReoIvh+vQnqWwilp3oRfCewOgnrXwxQDz3Kf7RDPmdo7zRe8vatqk3w7r5HGvQPTs9e3lmftsMkKq3KeaAnR82UZgH9JwG2lvvQaK2yf7riOqpw7qhxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIxAVvVpUm+kbIMfFSG5+bVoCzxPD9fCqbPI+jiKJSA=;
 b=pu8/pf1XtrJ9ZL9vf6z54nSwlf/d0I9uqWI0u1zZ8s1/GTI/P5bePtAYGb8doY9i0iyXEh0cLdsBMg4jU7OasuQ8NKAxEtTEPn70zbcXuPhKtFWiVnzbq0Befy/8pD93OsPzZUCP5THqPhPz6EvEUBQ7KstUs3mD/fDsD6F9500=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c69950cf-7544-40e4-a58c-e2b826f6a5c9@citrix.com>
Date: Mon, 23 Feb 2026 16:06:10 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/4] tools/tests/x86_emulator: fix build on clang-21
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?=
 <edwin.torok@citrix.com>
References: <cover.1771840208.git.edwin.torok@citrix.com>
 <7147fc3ef5d5bdf5a811e896925d9aa641ed0753.1771840208.git.edwin.torok@citrix.com>
 <6d564a09-b1bb-414f-ba8a-61bf9d9c7e5e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <6d564a09-b1bb-414f-ba8a-61bf9d9c7e5e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0192.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV3PR03MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: 70a7746e-7f32-4945-ed58-08de72f577bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q05kdFZIQXNFUjBqRXZCa2tSWmhlZS9JMFhUZHoxMllENTJHcXdqa3UzV25R?=
 =?utf-8?B?QVZ4aVh2VTBzbWdqaDJsZnZXWEk0UzFsbVJxZVhSdW5PcDE0TjNoaHFmcVBt?=
 =?utf-8?B?RnlHWGxEU3ltWThBQmFuQVBkWXlaNGZIRUpqRDI0NHZWV3FkdDFkdmVCd01z?=
 =?utf-8?B?YkVQb0dodjVDeFF3bVRNN0syUVRXRG5pTGpCVEpkcEUxRW15aTBYaDF4VE41?=
 =?utf-8?B?U3BFTkdHdDl0ck5UZnZRQ2R0WjlJMnlOTHBQZEJaUm5Wdlg1QVJNaCtCdDBL?=
 =?utf-8?B?T3B2ODhJTVh4b1RtK0xJSktQV3dFRk5XY3pTd3F1TC9qNDBMQWV1T01iVFlJ?=
 =?utf-8?B?em5nMTRmN2tGWUp0b1NuRGFXQ0xkOUk5dnBERk1seDhkL2d4YzNrdUU0WUVO?=
 =?utf-8?B?Rk1ITEtTOXhadGo4K09pY3R1cW0rMWlIMTYzbUlyT0U1cjdNajc3ZkpqQVh5?=
 =?utf-8?B?azNqZVlEblh5NHIrVTRLSlZlaU9UdkdLSUdZQnVkaGk2M0NvNG04anJwYTJv?=
 =?utf-8?B?SjNsQ2YrUUxUS1crdVhkM0NKZDVRdit1d1krNGFwWE9uS1NoZ29QUE9Ec1ky?=
 =?utf-8?B?Y1pDdmVxcGgxV1dKcFJUYUErRHRMcC9ZZ0pRQmc5K2tzWTBaV041cXUvVWZ2?=
 =?utf-8?B?aE1GZ2NsUERKQjgzb0toVS9ReFR6emo1bTZyME9SMGZ2R21ReWxHKzZmYTlp?=
 =?utf-8?B?SW9UeXNiUU1xRVhxMGdPbm9ud0Y1L0N6dFlCdzltUU1qRDdJcFF0V2paZUQz?=
 =?utf-8?B?d2JoQkFRVlVJVlVzdXdDanYvcnVsczBud2kxajljdmFSUllBVnhSZzdOUGlB?=
 =?utf-8?B?SlJrYWlpckRvVGYvby9ndGFRL1NjN2d0VytjeElObXR2b3hzeGVmYlpzdlpB?=
 =?utf-8?B?Tk9iT3YybGtHVFZ5RlVYK3Q5M3laQWhkcUhReWVHWEt0QjdwS1lGN1plRTIw?=
 =?utf-8?B?U1lqYjBVayt6VnY3bHNVZTk3T1pHN2dQYUEwT1FlMHdzcHUvVEkzTG9Gc2hx?=
 =?utf-8?B?dlVkcUkyOCtYS0ZxckVvSEpMTjJVNlcwOTk4Q0hoVjBrRkl1WnZkNGdBOUNP?=
 =?utf-8?B?R3gvZVhKaGczamhBWmhYL1ZmMnRxeW1kdWVTVTQ5Z3lJZEwycm1ybk9wL00z?=
 =?utf-8?B?K2ZYa0lVTE1uOU95WGdxME1UVEpmTTVTNHFsRGZIUHFGUTBNdlU1bHVtWjds?=
 =?utf-8?B?ZnhwWUIwV1FrVzNkYzhHM1pleFJmZTJ4RE1UUURhMEREcklCaFVyWmF4a3Y2?=
 =?utf-8?B?OTFrdmxqWk9yYTVSbUVBdTdUNjJmWkErMXc2QlJKU3JVbXZZeDBJK2g0YUUv?=
 =?utf-8?B?U3U1MVhIS2ZrblBCL1RBZ1I3b3FqQVhNMHdvTjlkMjBqZnN3QXptcmQ3UC84?=
 =?utf-8?B?OXkvZFE0dndxdk1taG5xbWVGMzZGdytVcDlqcEt2c0FCZytUNHNsZm5rZjZU?=
 =?utf-8?B?Vk52MCtnZ3YvRkFLcFlTK251SFJxZ2lqSWxTcktFemo1d3duU0xZR1EwNzFT?=
 =?utf-8?B?eXlSOHFyZGNqOERiMWxBUjZQM05NSXlmMGliMkR5czZvSVA3MDUyL3JCbHhX?=
 =?utf-8?B?L28wZVNDNTNLeVlRWlBTVWtEaEZ0M0EwYnV1WHZuWkNUY3V1ajgzZVhLa0k3?=
 =?utf-8?B?RmZRUWsvZ2YzZTAwMjBpRlBNRFBoMCsxeFpFSXl0eDdjNkN6dUNrNEZQMkNX?=
 =?utf-8?B?VlVmOXpHNDNiMVNRWWlZZTg5YWFDeG5nejA5aG9qQ2pmdnIwVWNGU0lBY2NK?=
 =?utf-8?B?NU45UHRZaEJyaUFUeUQ5MkdLMS9GRWRvbVp4Qy9rRWIwem5PRnZHSFVTVmNK?=
 =?utf-8?B?MnB4NGVkSVdrSXV3VENwQzJjTStJbHNTKzZUeE13VmNTYU5YUGhQU3RHT1BF?=
 =?utf-8?B?SWdUY051bnFTUThVSk9HUEovZWJ4WVlaVTROWDM1eTA5SDNSTEVIOFozak55?=
 =?utf-8?B?RURHelBZMHQySDBMNkIwYUhBa2YraXFTZHhLT1hEMnp6RmJtWGptNGMvakVG?=
 =?utf-8?B?d2M5a3pRV2cvQVhDYy9uQ05oQStkZStvN0VLVjBPYUZNbmk5NDFyYTR3bnNl?=
 =?utf-8?B?NXl3SGNrdXB1OGJ1alFkTzI0UTA1TFRLK0xaTFJqVXpBeHhRcm9VRW9lQ00w?=
 =?utf-8?Q?IBrg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2JaYllETiszaEZrN0ZEb1pSVW5zTXlZZzhXU1FwSjN2Vi9GcWpPSTJJdmJ3?=
 =?utf-8?B?SkVHUFNXMWl4N0t1SmhGYUJDcHE5MmJjbkE3K1FOd21zaVl6YndGL002ajZ0?=
 =?utf-8?B?dFg2blNKMWFZKzc1NWI1Mjh1anJZUlpKRWZZajh1MVZsUGQ4bURWVDRKcHB1?=
 =?utf-8?B?R2FZQkREa1dZZ09NSi8rQUkwSll1cU5lYkRHbTBBSUlIY1RKT2RTcEFsWlNi?=
 =?utf-8?B?WkJTVDcySEdtMTZsdnJJRkV5OEZNZVR5QmQ0QzN6WktDUlVSdEUySnNuWFc0?=
 =?utf-8?B?RUliZ1pFVmFhQXE2S1YxM2IrelZ2Q3NabVN0aGxpbndOZzh1UHQya1lFTTZy?=
 =?utf-8?B?YVBXODVJRU5CMld0SzBSemJLK0FENXdDZTlPREJ6RmpySWlKTmIySWpNb0Nt?=
 =?utf-8?B?V2s5S3A2NVJRUURnc0ZtbUdaSnBaeVRmSjdiR3lVWVpHaUR2M0FIU25WUUNa?=
 =?utf-8?B?T2ZNWjBPWUpWQ3Q2M1NreFV4eEdDdUJVWEV5cE5ieGRScCtPV3ZKRlJIa1o3?=
 =?utf-8?B?TkFTVVJFTDBnVmRaRHBMR244ZGIvaE13R2VFb3JEL3ZWK2tuSDlUMXU1cXZi?=
 =?utf-8?B?RFlaNFJGZkFYajFIYmNxMzczVE9jeHZuekJaRkl4ZjlHcm9IMWIrS2ZMTHlB?=
 =?utf-8?B?TFFLZlVhWHd1bzBWQjNoUWVZdzI1U2ZHZDBwdmw2amVSMmljaklsK2ltWDVO?=
 =?utf-8?B?REp0Q2V1aGJDaW50ZXJxNXVNUTh2Y1NxRVVsZGc4MENZazFUUHRLWHh1WVl2?=
 =?utf-8?B?eFRpZXllNkh3M1pxditWL2RqdU1OOGhGMHMzamJFdHovVUNQZ3hjOEZ3Vmox?=
 =?utf-8?B?dk5oZDJScEdaMitObHluUnhVK2xhQlBRcElWamVmR3RmazZ5amRENHRWdTlD?=
 =?utf-8?B?WWI0OW43M1RGZ3NxeFNxb3Q3c3ViOU5oZXQrK212SjBJZUNLWUhiQi91dDRx?=
 =?utf-8?B?K0lidjg3ZUw5MnhhakYxdXlIWVc5UGgzRUVtZHFEdGRObm1hbnBiOUpWc2ZB?=
 =?utf-8?B?ckRka3JWRnZhbmRIZ09yTjZZdHVvRVVBTTMyVWlYUzF0MldDTnhmOENXYmhH?=
 =?utf-8?B?S1JmamNha3NkVWJMaUpzcXp4UWV4eCtvTW83aFZBbGxtK2pIaDJlTlN2WEEr?=
 =?utf-8?B?RWJodnFwa3QzOEtDZk1WVTc3dTZzSFk4TkNNZnZsUzJMNFBSVTQ3MVdjdXhr?=
 =?utf-8?B?TkRNbWxUSElIOHB4K3hkcGc3VzlHN1Q1MUE4MGgyczlYU29QYVgvV0NqOVhZ?=
 =?utf-8?B?L2llRFBoZnZ0bU9SbGdROE1lK29uWHVSVEthUFkvY3ZGOW55RFBFNXFaeUY3?=
 =?utf-8?B?eUViNDRuWHVScXc4YkFFSjNVSURSWjhiU1RCbFNoYXNTVHNpSmp0TUJTdDZh?=
 =?utf-8?B?N1gzQ2NOWTZud2owYWtnM1N5WjJFUnBIb3N4R290VnZTeFJyWktmUTVKWFdw?=
 =?utf-8?B?TGJ5bjJiY0lVc2l1TDFPUE9JQTZJN1JsRjUwbysrNUtSNG1TMFh2bU1JSmRN?=
 =?utf-8?B?MmMxZ0poQmc3VEErVkpLZTJIT2VQVFN0aC9IN093RWljQmVReXhFU05ocDdr?=
 =?utf-8?B?aE1qdDR3YUFzTWRZSGRkd05kVTI3V0MzR0Q4VGx4L0JzcEJQdWwyYUlKUDdw?=
 =?utf-8?B?TGdkb1BlZkRGMFIzbTZrWXNaMXZtVVFITktqOG5YNFNMcVJSaTRlbWhOUStz?=
 =?utf-8?B?QzlGY21tVnQ4dXFvOHF6ZWhjSE44bm1UdzFOaDZLNFlaTnBjbVowdHNzRzNJ?=
 =?utf-8?B?QkdNcUhGWWFVUWNXaTRMSWx0NVRxS3N5NFhyVkdSR3UwdlRhT1VlZjNoVjZW?=
 =?utf-8?B?ZHp5RDUrOGdzRWRGN2E1VHd6TTlWd0pKQXlEVm9STWdNMHViTTRKM3ZRaks0?=
 =?utf-8?B?di8wQlRWU3laQzhmSmx3MWxaVFpCd1dBcjFGNTdGRUlhVTRFRk9UYThLYjdN?=
 =?utf-8?B?aHAwWVBFajVVOTBzQjMwQ0YzdDAxV0RpbW8rRkUvSkVmaElUY3BLTEFTVVIz?=
 =?utf-8?B?Mm5UaG9abVNCQVdtVExra1VIU3ZBRVh2UU5VNDJqRTk5Nm1MWnJUc05YSStk?=
 =?utf-8?B?anRhNTFaY0twL2hxM1lKUEp1NzI3THlVRnpIRzl2SXpWYVNObmlTVjMzaEtm?=
 =?utf-8?B?NTFnbitwZWFIaGN0bXFSMHkxNzNjVUJRQjRTMHZEZlZxQThRdnpNMHpSTGk5?=
 =?utf-8?B?T29sU2hxZ1NWVEl4WSt0NTlEZFZRU2tYK3lVV0hXQW9ydExPVjhmdGVZMEVu?=
 =?utf-8?B?Z29temZOZXpFYlR4QUlSaXRYSldjUWN2cS8rR0RQSDZNMi9RR21TWnJ0a3g1?=
 =?utf-8?B?aUVKTzJQdjYxRmNJZVdBSDZpYVdZOEVLNlpqTXplZWhBdkI4WlpGQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a7746e-7f32-4945-ed58-08de72f577bb
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 16:06:13.6186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9v2a48xPh9dn3rL+EtOq8lhHJ8Eh9cHxXh+nZ1p4Z3Xq0jgCQ+8ku55GBSiCjhPS075BpoXHK38CXH+56zZG7VURyt6ImEUpCRXXQYqr9t4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7706
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:edwin.torok@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 907501795A1
X-Rspamd-Action: no action

On 23/02/2026 4:02 pm, Jan Beulich wrote:
> On 23.02.2026 11:04, Edwin Török wrote:
>> clang-21's built-in assembler is enabled by default, but it doesn't
>> support some mnemonics:
>> ```
>> test_x86_emulator.c:2636:36: error: invalid instruction mnemonic 'fsaves'
>>  2636 |                        "fidivs %1\n\t"
>> test_x86_emulator.c:2640:24: error: invalid instruction mnemonic 'frstors'
>>  2640 |         asm volatile ( "frstors %0" :: "m" (res[25]) : "memory" );
>>       |                        ^
>> test_x86_emulator.c:4251:24: error: invalid instruction mnemonic 'vpcmpestriq'
>>  4251 |                        put_insn(vpcmpestri,
>>       |                        ^
>> ```
> Was this reported to them as a bug (or perhaps even two)?

Looking at just one of these, the mnemonic is FRSTOR without an S, and
Clang 21 is happy with that.

What is the trailing S supposed to signify to GAS?

~Andrew

