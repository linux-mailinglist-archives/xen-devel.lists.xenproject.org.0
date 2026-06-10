Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XuARNXQvKWppSAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 11:33:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE0C667E13
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 11:33:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=cy3TUFBU;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334080.1597183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXFJT-000623-C9; Wed, 10 Jun 2026 09:33:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334080.1597183; Wed, 10 Jun 2026 09:33:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXFJT-0005zl-9Q; Wed, 10 Jun 2026 09:33:31 +0000
Received: by outflank-mailman (input) for mailman id 1334080;
 Wed, 10 Jun 2026 09:33:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wXFJR-0005zc-5p
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 09:33:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXFJQ-00GYVL-IT
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 11:33:28 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a292f61-2eae-0a2a0a5409dd-0a2a450ab3f6-22
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 11:33:28 +0200
Received: from [52.101.57.55]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a292f67-56b3-0a2a450a0019-34653937a3d5-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 11:33:28 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB4955.namprd03.prod.outlook.com (2603:10b6:5:1e4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 09:33:24 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 09:33:24 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TmlY/pb56wqjw5OOTmCe/WgoN10qrS5+4tnfZ3YQGpdI4Hz6BKAPT9vVYAEuSH96bR9vHahtzdYM70y1oxQ21Ltswn9xsWTeTtlHWQ5ymmza1Gkl/gvG6P/CvxJH7MPv3WlegRlpkiY5HeslWxzI0JMOfSYhgMMvy0utexaf39zoFyrFU4jtQDgYyKrXSEShL9oRZ1Ga9xGw78QIxtTCE+KNfwlRk7WQr6LnqFCPkOYok6U+vCXljPGCk3C4bZDfTUnW9CeldYW9tqThOmf8U+G7LWXV6hrF3XiW/OYfXeokHoXo99k5y1V+9tZzmvmIpdT4g6ssJr155U0KZz3N+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRbLC+Vbh3/UTKdJavqw3R9SKVtWpjODEXOXt7O5vTE=;
 b=fvOi2DjljIz1A1I4iu/rhBejp7Dqkpu7iX4XcXwfF/JFLSE1P+GUjPhZXyT/wN84jPoYQRQfFGrz20JrHnW73TqaVNvB/IdON400L3nVTM9A5yW6QVYGis5oTJuOSYc1kpOD4mFSWq1QQHqnG9PcmFC95Kjwv1NbNGL2b7BVMIlkyXBIk3Jdu7CsBoSeDAoBMNssrR3wX689BBLfYD/NZxblYsaqxn1lj9SRwjKqC3t/slwB96+w78tCMJ1Sye10PktN8uFWU7Wu3wpmgCz6UEchcfO2izmOzFCPnLYi3hgBu+LyIaAkfiHgjir0ORAMJGwlVSigXFKIe9oBnp3NUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRbLC+Vbh3/UTKdJavqw3R9SKVtWpjODEXOXt7O5vTE=;
 b=cy3TUFBUHkEYhnpgHemt63PLHmUQTm+nnXDrcLDJqo2Wgo722nG1mDEqP0snmtlR2RP5psQel75KivMFl/Ac4hQBNM2fxw4YCJ46G31A6OGKa35Li53EcboI06aQuHKoxpxjdNYRvwvWmziT0n9ZDxuf5/Iq2IeMgxEA+GNA0ZQ=
Message-ID: <84df378f-d30a-42fa-8f80-cd4c2e3fa87a@citrix.com>
Date: Wed, 10 Jun 2026 10:33:19 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 3/4] CI: Introduce new qubes-hw-runner.dockerfile
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
References: <20260609173102.2908514-1-andrew.cooper3@citrix.com>
 <20260609173102.2908514-4-andrew.cooper3@citrix.com>
 <aihsv37_XNFFn3Mu@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aihsv37_XNFFn3Mu@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0205.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36d::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB4955:EE_
X-MS-Office365-Filtering-Correlation-Id: a75af192-391e-4ec5-7000-08dec6d35167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|4143699003|5023799004|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/cuMCfEIZvJqMhEKJxt/QS2TE35Jft8cUQhmZxb5G1AeOOmdQ/IMd3LKiTEBCHNL3ushhhzPqApfGKwy7XZIWo9Z9KZLhp3M+F9RQRiDi1cMhN835abPPR8ZM8vNA7WNL6S6x2YDgj6cYAuiyd5dgrMzbaczKUI2wP3IFBDgSFbQoAu1amHH2DSXLnfW581gLEpxD9pnbELyqGyYM+xH1qeuFOGDVFbDLhnRtiObF6qbYiHU2Zv9AaSMsp8FzV3th9DTrY8WhXKm9W1krCL4BImGcp7PbuhUZ/0x58PQJAxbA2iFK9BjzZP5sJAg1FDTQS4n/5hh3ss/P6Ok5/vGqdFWJ0aXeT3BYds5MCm5BE0ElZyi51OGddabjaaZt7dn1Xx6T/Sqb0LR3GfJVwqsa9cZU1HyCIQT42jAlouW9w7KVPl3r6s+G03ERyvXONWjgN7ut78iZDl9YvocnQ7tdN/vaFDMRPEISErM0khfkQHC8+wC/P5ik8ZWMx0V+l2TYX6tPUK5kcynjX2FSDIEHnUwNrH1gRICmNDHawfhoUdnbpm0RozJx9elnKMnMT5rNF1ngTux4gunRBH1HkC43s+dKo4HAsecj9BPa+cL3VXcND1CiIQ+Z5Be43Mw+scL+2RZWNvZACn9SwmdEHbi/G6MIPIq/PXAwcZmYmcnvS/LgJ3atX+/NhylmM0wBfAimCNINmsKt6pMAzXnJIe4jw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWp6cVhOOWNYRmZ2c1RDWCt0RS9DOSswcUgyWGYvVC9vTlRBUXI4MnBhNXpY?=
 =?utf-8?B?aXd3ZXV3dHEwcVNWcE1HbGFZSGpienRoelR1NnplaXlpcENLekZCMFpObnAw?=
 =?utf-8?B?dDlTWmY1a0N5bDJZZk5wTmdJNnlid3BxWmdxRmcrZWFjVXR5T1dpSitQSlRl?=
 =?utf-8?B?UWlVVG0wMkRBbitDY29SODl1djdwdDRycHhUaFkwZWhlc3FuMm5Xa29nOEcx?=
 =?utf-8?B?eTY3SlpRUVR6V1NMcURoaDMrZC9oM1YzamhKQkxiaFJXemJZL2ExR2VOVUdq?=
 =?utf-8?B?WXJVbDVDekx6L0VUYlZNYXJmdUlJUFpPVUdubmpRZ1JiUlROUGgrSmFzYitX?=
 =?utf-8?B?VTQyWml4THZoYWRWWldBUVA0TlZUM0VHVi9tR2FLTjdETUVmNUthc0V2UWxo?=
 =?utf-8?B?cDA3bzNQM0ZtT3h6QXZ1M0E4ZUs3dVlHTVlXTGNwRDY0SG1oeWRxRWUrRlN2?=
 =?utf-8?B?cDRXZ2FDcWFadmNrWElQWWE1MTNCS3FvZ3d6Z3oyRzdzQThYZ1ZmbnlCaFVv?=
 =?utf-8?B?MzRFeEF3RmJhWkpGQ3ltY2xlQ3pONEJueWhrZzNyVEs2cXJxdmE3QW9Ed2hH?=
 =?utf-8?B?OFErRnl6T0toMklyTVRqT0JwZG9hNFp4bGZqL2srckNQVVVSalljekxwazNm?=
 =?utf-8?B?OU0rbFd2TGJBRTNMZ3pkSnhHMkh0MWtqQVJmem5jeHRtc3MrT256TlFJVkF6?=
 =?utf-8?B?VDJDbFpRYklTK0hNQVc3VWFLeEJuWCt4Y3dNQUZUbHB3bGNCK0Y5c3ZkVjho?=
 =?utf-8?B?VVhPZW9udEZ3aUFMR3FZaVU1SEJ1QWhFWkc3KytiQTg5alVzUEYrU08yTkhq?=
 =?utf-8?B?YWczaFNxN3hMTWJWRFUybUcrTmNxLzhadC9ucTBVOG9ST2hBRGZzNElZRjhH?=
 =?utf-8?B?QTZxSllGRkQ3L0FWL3Z1OEdGa1hRNERKK1BLZ1FMeEFYY255TExwMW40Q0M0?=
 =?utf-8?B?MnFUM0dBY2ozalY1RWRZTFIvUmE1bTlvUndVeEJPcDBVSjIvVHJaNitPWW9v?=
 =?utf-8?B?MW0zQU0xV3VnemdZQmJ5clhYTzdVL1pRL0xmaVJEckdTVHVIZVdYVUhBaDZw?=
 =?utf-8?B?T0VOUTdqL0VVTmdkU3NoWmJQUGlLWHVhNnd6RjZyTkt1YzNEbkovS251MTlq?=
 =?utf-8?B?cWE0RGZZeVBHM0pMeXI5aVpkVCs4NDd5aGFJSXJNRHNDQkF1bXh1UGNUV0RD?=
 =?utf-8?B?d3NReUZQeENNdTMyVmkyZzJvWkg0ZFNxOHY0a3doQkVpTWFvczc4RHdnSTZG?=
 =?utf-8?B?VWdYYW9PR3ZWbEZWMzhPRVgyQ2JRRGZYTGpRalZFcXE5UjJMMmFHRTN3RTlR?=
 =?utf-8?B?cm9pVys4NGJkSU0yTzZhc1ZLVUg3YTVSQnFLelAyTU1Hc2VRdFduQTRTZUNY?=
 =?utf-8?B?aXB4bTlTdTRhV211ekh1ZmFBMzVCZFdQaXV3VDhuYnRqVUJwMGZxbCsxT0oz?=
 =?utf-8?B?MWtaQzIzTUlFekNvUzRtZFVMS0pPUWNQOWhUMWNMYko1ZzNrT2N6MU93RjR5?=
 =?utf-8?B?czB1SG1oQlZmQUU1ZTZSYjZPeUhwQXFmeTZsb1J2R3lIcFRDVGhQNHV1TGN0?=
 =?utf-8?B?VlU4WGNneW41VmRZak9jRFVGQUVlc2lIaXd1M1hwQ1hCalpHeSs5NXhaSnpt?=
 =?utf-8?B?RW5FeDhNUGwzVkRPRVlHOVREQm1uYlQwVWdEeTdJVU9nMkxjY2MveHNTVm4x?=
 =?utf-8?B?Mm81V1BPWktkUnRzM2xtZXo1cUtnVjkzaHBMZGdCWnZxM0FsN0s5WVZLd2Zz?=
 =?utf-8?B?dUg1ckhlUlNONnNCT2lML1J5WVFJSnZLZUs3bE5wK28wK1FXSFhacCtGUHdL?=
 =?utf-8?B?a1VYNWtRcTRaT1Fid2lsL2JlaUtoWU1zS1FFNnpKbkFzSE9kd1Nkc0p2b3Ni?=
 =?utf-8?B?ZWwzb2Z0MjU5Yks0ZzFBYmppRUlhb1h4OWZ5U2ppU1RWSU1aUlptUEFER01l?=
 =?utf-8?B?Y0JZckc1cVR4amxkL3hKNDlHcHdRdGJnakNsSkdvdEZ6TEV0dWxVNlVYcnB2?=
 =?utf-8?B?UTNuaTVXKzhYZHBNUDBXcWp5L01IcW1JRkY2UHpnMi8yN1Yva0RCam9ybGt6?=
 =?utf-8?B?TnEvaXk5QXVpU2JnUXZMRzlRajQzZGJ3MUdGT0QrUGkxa3V5WXdzdzdsaEtE?=
 =?utf-8?B?L25ZdTJIY21qRUNPRmxza0lDZG9BNGRzaE5uUW1rQ0gwOU5KVVZjZnhTNXc2?=
 =?utf-8?B?bW9INHBuSFc3Q1NSYnVEUmFEM2dGcnlab3NPeS9ENnZySTJ0VGFmdUdXUlds?=
 =?utf-8?B?Z0RXL2FNbEFLUk9nQmhtN2ZSQVJ1NjVaN25zM3pCQ2FCYVdIQ3pWWW1VejRn?=
 =?utf-8?B?V1FvaWdJbWgzK2hFNDNqZ0x0dWtZK0tIUld4ZUV4OWZyYXYxK283aVRNU3h0?=
 =?utf-8?Q?Tbf/T4fXXOWvJUvE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a75af192-391e-4ec5-7000-08dec6d35167
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 09:33:24.0370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rVA7RsXczAYljuJnE4AaD8d9gZnufPpvizU5X6Iq5KXtqnTTJVqXLuaI3u+hUMxytt53RU4kbCUQqKZQ/8Symb4nmpwQhRFT2ff/ieaUKxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4955
X-purgate-ID: tlsNG-4011c0/1781084008-7216A8B7-17F77077/10/73395122804
X-purgate-type: spam
X-purgate-size: 1972
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,lists.xenproject.org,vates.tech,kernel.org,amd.com,cardoe.com,gmail.com];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,amd.com:email,gitlab.com:url,invisiblethingslab.com:email];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:marmarek@invisiblethingslab.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1FE0C667E13

On 09/06/2026 8:42 pm, Marek Marczykowski-Górecki wrote:
> On Tue, Jun 09, 2026 at 06:31:01PM +0100, Andrew Cooper wrote:
>> We want to make the build containers be non-root, but the hardware runner
>> needs to continue being root.  Split it out into a dedicated container.
>> Intentionally give it a generic name so it need not change in the future.
> I'd rather prefer to keep the alpine version in the container name, so
> future container updates can be made without breaking stable branches. I
> have a related patch for this at
> https://gitlab.com/xen-project/people/marmarek/xen/-/commits/automation-linux?ref_type=heads,
> but apparently not posted yet.
>
>> No practical change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Doug Goldstein <cardoe@cardoe.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> I need to backport this patch to all trees (4.18 and later) before
>> alpine:3.18-arm64v8 can be converted to be be non-root.
> Converted? Since 3.18 is EOL for quite some time already, simply phase
> it out slowly.
>
>> In all other cases we've been renaming the containers to bypass this problem,
>> but alpine:3.18-arm64v8 is in the correct new form.
>>
>> Alternatively, I could see about combining it with the Alpine update (which is
>> long overdue and needs doing).
> Yeah, this.

Marek and I had a discussion about this last night.

It's going to be much easier if I merge with the unposted series.  That
series needs to land too (all our alpine testing is currently on an
obsolete version).

However as of last night, Alpine 3.24 has been released so I'll bump to
that sorting this out.

~Andrew

