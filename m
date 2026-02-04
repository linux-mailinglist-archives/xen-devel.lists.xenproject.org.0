Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CISKNJ1hg2nAmAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 16:11:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 471BFE812A
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 16:11:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220898.1529312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vneX6-000182-Me; Wed, 04 Feb 2026 15:11:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220898.1529312; Wed, 04 Feb 2026 15:11:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vneX6-00015q-JX; Wed, 04 Feb 2026 15:11:08 +0000
Received: by outflank-mailman (input) for mailman id 1220898;
 Wed, 04 Feb 2026 15:11:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hC1S=AI=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vneX5-00015h-Ld
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 15:11:07 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba137350-01db-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 16:11:06 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB6233.namprd03.prod.outlook.com (2603:10b6:510:d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 15:10:49 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 15:10:49 +0000
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
X-Inumbo-ID: ba137350-01db-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tU8Wr3FuhmuXp9zwslHS3tVkGBypYYk46lcfdmfOxCdtQAqEARXjNQTSjJ0RavwGm9XlqLYuzBS9Tg5xGI6Ded3Q2YFVmLuDCbYFr8tPQK6nAh41Onri3+bBzZM0hk8ecwi4FH33bio3E3BPkvbl3UP64mrxc4I9POl1PgLh5uYTd63dKKd1rwV4jynqi7dJy713/FGTdXTn1VUGCKprH16GMIvKKRDBDm7ucPky1DzOKPYsoQPNck1RAADuvRazx/jWHMTiwOFGl0DTkqxrMOmdTyVzZyMkIlFMRU/FBem86mqrw30os8c6onkmm0jK0NjZuSdtqg9p360C3FUBEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiK9Y4xg807NRiJ+NHSuUeP+ElmW5fHLySjR3BU7rbw=;
 b=fDeRXXp71bi7c6iPUAIAkUz1APP5f4y5LG1Z83+UET+lzhZt0117i5MUczDKTEq9x1UhD2DliI7A9e23kC8gTSrz11SEE7+BpmovRIPCJpNiuKmLo2vfV6XJz/FKGmdZsDSnh8jvv+jmcF2z4/PJVsANS/lfD9B/8t8NELTkGa+y3mqknYK2kTboBKlgDYWl4uZDiyl589681zbSirjldW0iqlhy3STg7vv0NtS3+Y7bqg9tA1ut5UFrZPmE26NuzWW0Fi0iFm9NyKZZPX+OEt9eWlAyKH+9u6hPdY/HCQx/ip/eqGTvrHsCCerL9PGshS2u2qfy2QKr2JuvamP59A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aiK9Y4xg807NRiJ+NHSuUeP+ElmW5fHLySjR3BU7rbw=;
 b=ri4GrHp92yNKbLVvCelKnqh2qcvbtXUeDFu/Wkk8JDQHZKqh6ameqCa0rnFF73Nzjhy3vA7SUkFQ0WGYiFHLoLCbnC6ztQQqmmoFBcJSb6H9kDLJvryNgWzWvzvx1jWrV5UDRQv2UIONJxBV5c66G7Ogw7K65OOiMah3IAKrMVA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e92cf534-5e8f-4099-87b1-d3640c29453c@citrix.com>
Date: Wed, 4 Feb 2026 16:10:42 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/domain: adjust limitation on shared_info
 allocation below 4G
To: Jan Beulich <jbeulich@suse.com>
References: <20260204122553.75711-1-roger.pau@citrix.com>
 <cc8f0f84-fd5e-401c-ad71-ab5a10f21fa8@citrix.com>
 <c7b3b54d-3550-4abd-a52c-365202133078@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <c7b3b54d-3550-4abd-a52c-365202133078@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0196.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: e73f4e00-5f31-4c0e-66a0-08de63ff94bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGdkQzVKRlFZK2dQNTNhOVNvWExSdnM4VHQ2dEZuSTBiTm5TSy9lQUN2QitH?=
 =?utf-8?B?aTJBQlRRYkJra2d5cHdOQjdYRzZuUzg4VTBGNXJtRlBpdzkvWU9lRmUraXo0?=
 =?utf-8?B?Smc3T1UwODBKeEV6eUFzazYvTXNseDA5OUloTVczUUExbFRwZ2lSM3hBbzI1?=
 =?utf-8?B?SThPR1NxMVN5NXZMMURsQmExNVkramw2MTVMejFJYzhUVEdzNWhReFNweXZq?=
 =?utf-8?B?bDNxWmZmVEJnL1dheG4wRTBONlk4ZkVDWldFSFV4a29ISFdTYU8yYWRiU2Nm?=
 =?utf-8?B?aHZvYTRtYzJjSm5qQnJDaDR5cWhUdmFuMkY2V0Jpd0R0SHlaR1p1bmZ0NlF3?=
 =?utf-8?B?ZG9xWVFpWVdRQ2JsZ3M2c0p6TU1Rbkdycm5McHFkdnVUZ0FDZmFORjNua0Vz?=
 =?utf-8?B?dklMaW5mSEhVZFFTMmNiUFc5SHB0Z0dPUjJaVEpsRVZkQzJQTTdrY0ZaSjE2?=
 =?utf-8?B?cFM0L0U4VkQrSmdEbjdvdkZGQVI4UUtVQmsyaUdwU0FRWGhDTUowcDlxYitN?=
 =?utf-8?B?TGx5YmFpcEFlbE1JSVlWdHhPZ3hOOUo0RHI0WDk3M3VSYjlNcGppcU51UnRE?=
 =?utf-8?B?d1RRWTNsVXFxQy9MVUVqdjhyczBwSnRieHhqRFlNeklJUzlIVEdiRUR2NTBh?=
 =?utf-8?B?K3BZcnV1VlpjNnoyN3R6QWhwZ2hyVnhqNjZwZkptdndDYUJPRTVqRXFVN2d0?=
 =?utf-8?B?TkFneXd3SUZobWc4TmtrclRvOW56OGRGZjExVVR0M2RPZFRDT1BoN2dIS04z?=
 =?utf-8?B?UU55eWx4ZUk3cTVydEppUU1YeDFjNjlMSUl1emZld21mWTIyTUQ5YVZwWGc5?=
 =?utf-8?B?R0I0aEkrVmhvOFVtQTBsVmR1VDYxSWhUcmJ5aXZSWmI3eU1VZzByc2FLODJh?=
 =?utf-8?B?eW9Va3I3ZnBCb2tqNFNkSXYxNWk2Tms3c3dIZXVzRmx3elVHR3JUV2tnK2tB?=
 =?utf-8?B?ZzBDK1F3ZXhyWXVyeSt0NHdaMXFRdlRNT0FOZitkU0k1d1R1cGpkZUVpdEJU?=
 =?utf-8?B?Q3RZUUZLQmVoYWJLUDVmRlJPUzB4RHlMOHo2c1pxY1IxbWRMa0d3Rk5vSGRt?=
 =?utf-8?B?Tzhkak92NXV6Z3JJQ0lXbnZhZUlzVDAxL3N6cFJhSE55WktTUk1HaTRTU1Mx?=
 =?utf-8?B?ZDdLRmRtMTVUY29ER3BGWXloTUlnOFoxZWs2S09Xd2VtVlNrTExjUURGbEth?=
 =?utf-8?B?eURzUXlsdG9oU3EvbloybzRpZ2lYdnRKV2ZaNmc2Qkp3cXhpdHNtcEk2QU95?=
 =?utf-8?B?TEhRNzNUWXlsSlYvdFJXTlhFbFVMeVZDWTZKWWphMHNndFZsVWd0REVDejlq?=
 =?utf-8?B?c3V6QXFWN1pmOWp4M2g1aUVyWkRPK3k2MVNVTDk1b1ptTUxocTVIRHU5RVRo?=
 =?utf-8?B?VGsrV0g5UnNhNFZITUhCdkIrd1lJTHdaUHNvekpMaXFrcGhkbUY1RlVJVWJV?=
 =?utf-8?B?NmRpdXl0Y0lhQWllaDhOZlFWMzJkSnhMVFVtYVpMcG82UlF2RzFSRGVWRXl0?=
 =?utf-8?B?dFphQ1FaREhjTk9wY21LSlF6RTAxRjV2YkVySVFTZjBmWG56anUrUEUyL00w?=
 =?utf-8?B?Tm0vZmRsaW0yUEd3SGpBdWF0amIzSkUvN2dBcnVqdHgrQWJqRVA2UzNua3Vq?=
 =?utf-8?B?R2EyYS9FODRteldTTTZkVUQxUUZURk9GK0dZbE1DK2hIQVlueTRxZzJMVHRo?=
 =?utf-8?B?NGF2bXhXRnlxUXVBVnVCRnllSzAvd0JJS1pTS3Nhd0gyOWlOOWd6VGZSY3Rw?=
 =?utf-8?B?clg1MXZraWw1VzBZbVdLSGRwbGp3VFBVNHVjNEdOZDhqMnM4aUxidTZaSTZT?=
 =?utf-8?B?emhzcHlGUk5YMFdiempBYmg4OWVmTWV4TmdLUFpZU1RoaWJVcFQ4bXpYL3FT?=
 =?utf-8?B?MDUvRmVaRDB2V3VaRGRycEJJVVZHMGZvRUZlQldRTCs3aWtlbjRXK3h6SWw3?=
 =?utf-8?B?cGFjNFZ5Uk9rSUdlSGhRaCtGaWVrdzF6L0psbFc1R3l6dnFEd005TGlUdG1G?=
 =?utf-8?B?aTNvTkZoQk9BN00wMTNWcldqNE5FRjFiNk1EdXdacmwwVUp4QW9sWTZOL2dq?=
 =?utf-8?B?dFVHYlRTU25nMXFIcjNjZTVjRzA3L3hWL1N4SVBLckpERk82NWYveEdKRHI2?=
 =?utf-8?Q?QWJo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d25mRUlqbjNUVEVhbTFIYzk4aVBxYjNQY29JS3pOcmhxaDZDR3pJc1NEdllo?=
 =?utf-8?B?bzVGcGd1a1lDcDdGZFlVd3JRYmJNUExGSGhEVHJTSmFIeVNsckNabVA5MDRG?=
 =?utf-8?B?Sk5YcUFuclBpRzhsaXFpSHBBM1lhNEtONHErWVYrOWovOTE4UEFPaWFReWps?=
 =?utf-8?B?c2ZTZ3NyYmxyZVA0ak1RN0FreGRzcS9na09zcCtlMkI4RVBhVUZBNU05Qm5n?=
 =?utf-8?B?Z1Q0UUp5L0cvTjhocFFvZTZyWFloZGg0eDJIL2pOTENLdkxMQVo0L2FSamxZ?=
 =?utf-8?B?Rm56SjFOYW14b1JUTGw4bjdjeVMvTDJRdWRZRUQvdEdDTEJid3dreitudjZE?=
 =?utf-8?B?ZkRQS1ZEZmp3SGFTbTQ5Z2Z5dW4rNkNKd1VLa08xRTFrbkVwckdBRHl3aVkv?=
 =?utf-8?B?cElPcHVBK2lhbi9sYzVrazN6QTQ2NDBpZEVqTGwwbTBscFpiNnhHSk9RaTNa?=
 =?utf-8?B?ejFFTm5vd2FiMG1DM0QzajNxT3locU90cER6ZDlvT1FhcHF6Ry8zQTVGM000?=
 =?utf-8?B?NFl1eHZRK0NWT2pQalMrOU82UnVTNFVOaDNwaTlhYmwySWswMGpNd1ovam4y?=
 =?utf-8?B?TThOb09SRFJzNVdTajRLUzFKSXkrcEhZY1RiK25yYlZ4UjA0VTFsaWUyczJz?=
 =?utf-8?B?bVl1bVdwaCt1U1NEaFZkd3gzUVdhSmZ4ZVNBQnVod1dqdnEzTzNEcGNwd1Qx?=
 =?utf-8?B?SS9ueXo3WVpZUGNuSGlUbVg0b2pKU3FDQnZCbllUS2tSVThacUFMejdNUFdG?=
 =?utf-8?B?Q3BFd2dCR2RKQXdOR3AwWEFNdExtN3ZoWmpkUFdRcy9HdFdsajZ2M2ZNeFNH?=
 =?utf-8?B?c0NPRFFzTTRiak51OTN3WDBVdUlrODVkSUVTMnlmSkVnRm03R1pIMTMvN3A3?=
 =?utf-8?B?MTZKZWFQdDVHRGRXSXdyR3FSU01lcjJXNlJEL01GT1NsTlIvem1jdlRlaDBR?=
 =?utf-8?B?MHplM25SNnlrU090cTQ3aEdBejlJbURMTjJidFNlaUMrNzY5WjJETXhEYW9r?=
 =?utf-8?B?MUd6Tm1yQjlkN1ZaeExpd0FqWXA0QnFxTWNBRjNRYjc0OGFjM2p4ZHAyenpI?=
 =?utf-8?B?Wjd1ajZxVWgzVXFUL3EzUzFIcFRJV2Z0SCtDNnBqbE93VjNXc2M3N0Z1cm54?=
 =?utf-8?B?aTVXWjJJbXV1UDJDeTBQckpGQ20wOVd2UlpPOEVseGhwMGtGOWdnUXdBWS83?=
 =?utf-8?B?Y0t2YnFjWjVUcGtqdkhuNU12R2tRT2NsbW8wMXFidmY1a2hnN2x0NjgxeWl5?=
 =?utf-8?B?Q2xsb3ZXM3ZTRnQzOVcxeDhRMjJKS2R0N0N3cnBzczRQdU1CUk5rY3ZFU2Ru?=
 =?utf-8?B?NUR6cUZ5bUZmc1dOYjlkOFNsemErNHlZSzB4N0VrTzJyQnBiM0ZyZkJ5Z1RY?=
 =?utf-8?B?aTdFay8wUEt4VFBhZ245M1RPT0lTSDduZDM5T05nUURDY0VCTkJDaTB2dFhL?=
 =?utf-8?B?dzJGYzBCc0h1OXNXUGRyRlZrdVBiZGRhaW1TVDZOTGhyTjVtMys4WTM1VHR0?=
 =?utf-8?B?RXprbDBMVSsyRmdCY2lCRnBOYytnSVFwaXRjMGIydnllTUcxN2ZKelNQVzdv?=
 =?utf-8?B?cW9LOW5YbnBZYWVtTXU1eVF1RzdTUDRSdTNENzFPNWx4bzF2eENObGh2ZWpw?=
 =?utf-8?B?MFFaMkp2OXNBcnJtWDQxaWtzSFRZczdsUlZNNlY4TmVrTjhmZDJWNnRHSkwr?=
 =?utf-8?B?eTZwUDdNSURFSXk0bE9ua3AzblFLYWtMOUs0enZBclpKVDFMNXc4SnRxUEpj?=
 =?utf-8?B?OEpiQjEvbkc3SzFENjAyVGIwOWU4S3JJQW9NUU9KL21kMy9hY2YvWVZTZmhJ?=
 =?utf-8?B?WlRyYkZTWHdhTnhQUlByS0Nqdk14cXNkcTd6WkxudG5hc3R5czZTdFd5Tnc5?=
 =?utf-8?B?MExiZ0RCdnFJZUE3dmJFTEZleUQ1djZuM0h2WGhVa3c4ZWJvWnpEMHJuYk9o?=
 =?utf-8?B?NnJ5c3lZeDRVb1dnaEE2b2ZEMmxOZjhPUHROamFnbDJRdWZhSEE5V090ZFRa?=
 =?utf-8?B?RlFGa3hYZDFra1ZZZC80NWVNSWdsTVVXejdhRUlOT0R6ZjIzOFJ5dWNrYk9O?=
 =?utf-8?B?ZDlqMDRHN2VibWt1d1Jya1VPS21RbmZTQUxQb21pZWs4Yk41L0FXb1BxMmJP?=
 =?utf-8?B?ZjdyTWZIVEhWanhIOTJYTGZhZHBlaUdiZVQ3Q3dNVTVxYnNUQUdVVFBOYnN2?=
 =?utf-8?B?eDB1eEZVa0xMS3FHaHp4UUZ6Z1pkTTlFMjZ4SHU2RUMvYXZVS285bk1ZbGwv?=
 =?utf-8?B?ZUtGa0lZNTQ2V0ZWay9MNlQrcE1PYnZscUFRK1NNdEt4a3ZPUmE4KzB5QXJ5?=
 =?utf-8?B?dHU1VklpaXg3blZVNk5yWkNRelpTamRZcG0rYmVaV242SEpqZU1sYnEzVElv?=
 =?utf-8?Q?4XhSIge4KfzZY9RA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e73f4e00-5f31-4c0e-66a0-08de63ff94bb
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 15:10:49.8040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: puCMROfOyDhYTVtslOljc/9igjBmqhF/FrYAoPjQ0NQF43P42HKEwk2gWhTCSQigtNesNKYLpeiYxGhsOb4zvLXAaYbfAOho/axoRUzXgCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6233
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 471BFE812A
X-Rspamd-Action: no action

On 04/02/2026 2:40 pm, Jan Beulich wrote:
>>> +    if ( virt_to_maddr(d->shared_info) >> 32 )
>>> +    {
>>> +        shared_info_t *prev = d->shared_info;
>>> +
>>> +        d->shared_info = alloc_xenheap_pages(0, MEMF_bits(32));
>>> +        if ( !d->shared_info )
>>> +        {
>>> +            d->shared_info = prev;
>>> +            rc = -ENOMEM;
>>> +            goto undo_and_fail;
>>> +        }
>>> +        put_page(virt_to_page(prev));
>>> +        clear_page(d->shared_info);
>> I think copy_page() would be more appropriate.  That way there are fewer
>> implicit ordering dependencies.
> I'd strongly recommend against copy_page() here. If there was any data in
> there that would need copying, it would need to be done field-wise, using
> the compat xlat machinery. The layouts are different. It may be prudent to
> assert that the original page is still completely zeroed.

Oh, yes.  The layouts will be different.  Fine.

~Andrew

