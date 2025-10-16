Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F3DBE2A21
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 12:05:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144385.1477780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9KrP-0000LY-Cx; Thu, 16 Oct 2025 10:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144385.1477780; Thu, 16 Oct 2025 10:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9KrP-0000IQ-8r; Thu, 16 Oct 2025 10:05:27 +0000
Received: by outflank-mailman (input) for mailman id 1144385;
 Thu, 16 Oct 2025 10:05:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NIav=4Z=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v9KrO-0000I6-0h
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 10:05:26 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0b5d31b-aa77-11f0-980a-7dc792cee155;
 Thu, 16 Oct 2025 12:05:23 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by DM6PR03MB5161.namprd03.prod.outlook.com (2603:10b6:5:240::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 10:05:20 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 10:05:20 +0000
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
X-Inumbo-ID: a0b5d31b-aa77-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BGopSH8/JnEGuqj6xKQsxKb/9HlxEOUh6HF6DBXgYh97jn6nesmKO77GfMgX+ULCCHb/pya99f124ON2cYchL7iq1v3aYw95Ozw3XPiQEkbkAkG2FOdNVy+8QveqX3nk+Z0ZOuZe2OGuLZclksI0PfOsXD50LAuE1wAgmxuc9bxZX0dBRcRiKJY/XFqthPfZlhR4ujB546LJAoyt/RWWaD5Ur4yHIZyQmRSltmhv25fJbpNobaib7/zIQd92ksGYjnOYCQ37wiNNaYhwLBE0K5DpxefQpXKbQIwVB6ArdJMFl3CW5itWuCzDry55INLQOgLMicFrOQmthFgyT8aBEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+i24iGZ9RERTlxyYIlSl1yFli7Tg6Dt/zc+h9CLCy4=;
 b=RT9g0UBGUKU+F/N07WrlQVR7s9Ly8vHWXNX1KQPx88OlUZjTJbDzcOsPcurWubLE9x4gjZlgelYGOoBBTAdU1Ipnv3roSm00+N0EOE1kbiZmETQNFwmRuYo7bhhIMN31abAEElICUn2LndDV9hApROP2HF94LmKWyluk9itq7LCLJXFwx5P/7fgfUnkUZznMZGLlIWgsWy6qfJLf7S2yolIJ7iDB3lJRCx0zsH7WdSWV2Ah2jf53ZP2XAJMluuBVN/R2BzJyntWvk1RZAIiJ2tdcQl8rlGXuQPzuBLmH2ZOod0LLv+uwUDq+xQJ9PqFGTHOqqJXSBIkJW2SQkige1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+i24iGZ9RERTlxyYIlSl1yFli7Tg6Dt/zc+h9CLCy4=;
 b=ORkqSgK+28NDKTr9N7PZTm6yT280PKMAbCNYBI2KO+aVobirfiYBf0lwmTrd2nxKOdBbRzYAlV3gc93Zbo9bm9fThbwVmz9/4mX4yt9iCwyD2TLbTE/wHR+Xp/ND1pj5crNWwPdk6IWmheY/O88nQsuQLyCR9LLNWUHb+kOjgkE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Oct 2025 12:05:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.21 00/10] x86/HPET: broadcast IRQ and other
 improvements
Message-ID: <aPDDW9N6plRHw2Rb@Mac.lan>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
X-ClientProxiedBy: PR1P264CA0086.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:345::12) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|DM6PR03MB5161:EE_
X-MS-Office365-Filtering-Correlation-Id: 39dbd9ef-2326-45e1-3a1f-08de0c9b833a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2VJUER4ZkRZK0IxM2lrR0o4akRxS0pUazhpc2ltN1pGc05iTFZ3MkxNMnNH?=
 =?utf-8?B?eS9LZnJnOFA3VVpFSlpqUjhWUG5mcFk0R1dnU29LWmJKN2E3b3hVcHdlQms1?=
 =?utf-8?B?M0VuYnkrTVBKZTdyN3ZCTE9GREVaY0djcWRnWGdpaXVmMWhxUGt5VWh3WHBO?=
 =?utf-8?B?L2JiVkM2OVFJQW55cmNIODhRKzlPWmlVMzhMNUw0dlY2ajF4L1Azc2FGM3FM?=
 =?utf-8?B?b2xMaDhtUVhEdkxVeldKMmk4MTJvQ1hzQUNpUENNdUlCNVpKNUY0aUR1c25G?=
 =?utf-8?B?ZDJVNXN1UWM1RFV0cWExcnhWemN6UXdQb0RNQWJnN1BTSUpGK1kvMHVhTllI?=
 =?utf-8?B?UldmMVo0U1hUVituQUsxdEwrNWM4NUF1ZVMrZXEzSVd4UnZOT2ZVZ0ZraXdO?=
 =?utf-8?B?MTZxb0taMDdqUnN4Nm5kL2FvQ1lmN0xOUktnNUsxVngxUUFvVWZBQXFZaDA0?=
 =?utf-8?B?cE1BcDNhYXBGaGVhN3dkdGxJUENUdFdlSXh5VHBKZlhFbVBROUtqVk1ua05v?=
 =?utf-8?B?dHdUemhtUERZTStMQjk5NVE2OXF4S3JlL1ltc0dqYzc3ME1XK21CWi84TW5n?=
 =?utf-8?B?c1FRUXZFWDNRd0YzMGtCTXZPZDVDRnVyRElKaUV4SDhhdjU3UytKakZGR1pU?=
 =?utf-8?B?Nng3aUcyZmlQRHQySGdOdGNCODdYSlJpemZhNHVxOTVUL082ZkRqb3ozTGhV?=
 =?utf-8?B?YkQ2bWgzRTQ1RDNndzkra0RhVEtsOTV1ejh2L1gvVjFVZkI0Z3lrakMvMjds?=
 =?utf-8?B?dWxNb1dKWi82MGZpUDI4VERkVFhDQlVRZHV5SmJWMU9PRTBDc2JmZW1nWk5N?=
 =?utf-8?B?R2ZjSUJzbEpRSWdhZW83cXRRV2ZBSHFhVlRhaERvU1ZSRjdSK05xRjMxZ1JS?=
 =?utf-8?B?N1U4cEUvcGNtNHZLTzNiVkVmOXpnanU2dVBhWFROM1VocXpkY1Zjanh1R2tB?=
 =?utf-8?B?RUFSSE5GdE9wc0tUNHl3d0piV2hZaDRSY2RydlBPbnhYTlYwaGRKT2F2bVVT?=
 =?utf-8?B?cmg3MzNVblpVaU9tZnJ6S0NNOFRNREE2YU9Fb0Q4TG1PRU1OY2JtaWFmKzFC?=
 =?utf-8?B?Mm1xSDlKL3VZTTB0OVNBTDRPdmMySy9wWFNoY0IwY0JpeVlNSXZRYTFKUWkw?=
 =?utf-8?B?ckRUOHJlTmpiWGJmNHRrRU1TcWpiRDJKdkhNT0sybDBUMzdvQmJMUUY4UVE3?=
 =?utf-8?B?cWt6Nms0cnErcnZ1c0JhTDEvYm1HL05qR1RVSHc1enVhUFhicDJhc1BZNWRL?=
 =?utf-8?B?d1p5MzEvK0IzZjhqN3BYWTBobnorcHJITWszL2pLdndBSlBYTEdaSE5KU0o4?=
 =?utf-8?B?RDNORXBWbkJHRUJ4UGR2MUFSaThrSVBBbTZzcXBKVGh2Y2M1SjNqNXlSRXJO?=
 =?utf-8?B?YVYwbk5GZzZybm5zRmo5YWNJUGJ4djlGVDBaKzFudldObEtHSTBTSFI2YVpE?=
 =?utf-8?B?NldjZHNzKzdIZFQ5MmQ2VVhUZXlZdVk3NkpnbFhENS9INFJVZXAvWHhDL2Jr?=
 =?utf-8?B?eW9DMXZFU2xhNlUvdlhETVZBdS9RcGlxdldhbGxHazRXb2RrdklxR2J0Y3FE?=
 =?utf-8?B?ZFhvY05GcE1JZVV6MXgzK3RCWE1lbjM3c0pBTUxWNUJJTmhHSDJGNnVXbUFN?=
 =?utf-8?B?RVEzemk3d09ZOHNXdlVpWjhrU2JTS3R1UHE2YjdNQmlpMllNZTB2WHNURmJr?=
 =?utf-8?B?QTJ1Mm0yeUN6T3lQWmpocGVaT2tpM2ZXOVFXUjlGbE1NUXlaY2Z5eTdZeCtJ?=
 =?utf-8?B?RDJOWXZ3b2VRbkJYTk1ud0RDaWQwRnFvQkJ4ZUp6QzE4NG9hWXUyK0F2cEFT?=
 =?utf-8?B?VGtSMTUzdTlQWkE0VE1hNFVlbTNTaldYV2lMa0E1bVBpbTkvRkpxMW11RW00?=
 =?utf-8?B?Y24zYmNIQzNINEpTM3hzR0lVQTNFbEhydjVqRmVreDlZbzRwMElsZXZHa2F5?=
 =?utf-8?Q?RQL0hz6zbhzWzSFBp3stFzKqVzrsMCgT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2V5dC9selhsLzEzT2FSNExnTUhjRUNzMzhEZFk2NEtUTndxdmoxQ0NVcjEv?=
 =?utf-8?B?bzdiNmRTVHJCNW16UWZOcEVxTHp1NFloZmlNc2lqTmhHcDI0dzZ4SXFGc3d2?=
 =?utf-8?B?VmZSekhRUWJKZUloRk9Xc08zWDVxeTN2YWZMcG9lWWZvc3RmTlRFTHB0SVQw?=
 =?utf-8?B?T2E5UVhlcXpPbGsvSWlUdFRwaG0yRW9JZ0JRQkk5NmVuek93U0hCT0IyTzFi?=
 =?utf-8?B?WW9oeUpoc29wdUlXZ1g4d3M1dEJEUmlYYU9va3gxUVV5R0l2WWRhbVFZUnJp?=
 =?utf-8?B?L0N4T1ZkKytCb2dRT1lja0FNZWNINEJmUXpBdndyek1CZFJSa2kydjZKL2gy?=
 =?utf-8?B?MmM3V25LSjl2bG1ZbGJlNmpNU0prbldDVTUrQXNTUXduNWFFZm5nY091RjIz?=
 =?utf-8?B?N3FJUUpGNVVlSXJ0TGJTV0RLSjZpVXo2MnZ4S3VTT01IbWhWcTM1eFVtNTdt?=
 =?utf-8?B?SlZ4Sk9nVWtPa000di9XTTJaMDVyNSs1czNhSWdEakgzYlJxQW9vUUNsdGNj?=
 =?utf-8?B?Q3NoUXlLUnpraXBiUFNCWnBsUFJRS2dabE54bEcxOWJ3ay9DL0xLV0RLZlQ0?=
 =?utf-8?B?bEJTajhackhNN254VERtM2dYVC9EazJJbWJEYmI4UUVDRDFaN090RDFhMURN?=
 =?utf-8?B?Qk9nYkxyd2lWK3lpL29ZMEhxeG0xSGJzdzQwQkNOZ1RiRU1iSzF4NDR5cXhN?=
 =?utf-8?B?MW8xUzhkbXFCV1BlYVdVK09iSFBUZExVSUdPRW5kTmpuK3RNeG9BNHk2RXlk?=
 =?utf-8?B?eUFmMEozc3pRcDZJb0daV0Fyd3FFVnVFaGk1V0ZnMStKWjdVandQSGFjVENk?=
 =?utf-8?B?bXR3N3BDeEhoRlpZZnFMSThwRmd6SHloeDF4b2NwTVh4RHg2R3lKOEZYYzZ4?=
 =?utf-8?B?VnZ5UTg0RElUK24xSldmanFGbzc0N0tEcHVJYi9NR1huNktZMmVrZVg5bXJa?=
 =?utf-8?B?VlVmWFFDUjAwR3Z5YnlRZ3pLc0ZIZ21KLzZKcFUxUnZOaU51TGpWUkltTmJX?=
 =?utf-8?B?ZHExL2FremVhME5iVnV5dHE4MDZIM2x2Y3dBeFJnYXkrM0EydEtpa0FFbHlU?=
 =?utf-8?B?dW5VLzJkNURsNHIxeGFUb2tqNURRQ3hsZ3pqc29TS21xcUFuUFVQOGw3WUdp?=
 =?utf-8?B?WFVsTWFsZXNlanBZTVJRV3hJNnhxWGluTGVtTGxMcW1VaDhtK0x4UUJUSlNS?=
 =?utf-8?B?MGtRbDhLSTlFei82RWY5bklHUUQyakpPQnRWNHFGUzBad3lJeFk5SDdNMDd2?=
 =?utf-8?B?UE5IbUYzMGJUMlpmUkZuK1JuY1RwK1FraEVOb0xrQ0pzd3VNbStmV3Y0SzZW?=
 =?utf-8?B?NHZ5eUQ3RnI2cFV4L3NkajZjUTJhaHpZVTdDUXg4Y1VEelB0TXFTZnNoSHAr?=
 =?utf-8?B?VkVMdWtCbkxVaXpjYmp0QnVtNXpwdnVra1lSeTV1MlBWTUZjSm1oa0xwaXR1?=
 =?utf-8?B?NkVJNzdNblNqZ2Q5aFFqMFFVaGF1K1Nxb0NsY0EvVkpUSzFuM3pCS2F3Ymta?=
 =?utf-8?B?QUtIdXlSUWRFOWRIUGI1VWdOeHIvNzExTXNLOWZBVVBId3BldmtFb1h6bGlX?=
 =?utf-8?B?SmVVOEkxT25LQW14YUR0R1RoVlZBVC9yV3phaG5mN2I3c1B4VFJVMGJRVXVN?=
 =?utf-8?B?V2VpVWVqaTNQUlZ1TGpxZWs2QjJlNXZnMzhHSk5kVHR1STQ4d0tTV2lENU5V?=
 =?utf-8?B?T2wvL3FRN0p1RUEvaUNETERZUDY5M0prNjFFSjBHT3Z0dmgzNW5SL280V0Er?=
 =?utf-8?B?VGVuMEdqWEJ1Qm9NSXFMNUQ4RW95OGx6cUtjZHE3WW5ZRi9tTmcwZmRmUUoz?=
 =?utf-8?B?SGw2Q00zVUI5VkwrZ0Y3WkJBYXF0ZGV6enFVTW94UkEvMTBNL1IwVVR5UFBM?=
 =?utf-8?B?RVVoZkZoamN4cndJNGxvNnBCSlRtaEdqUk10ZTFhQThoa1YxREo1S0ZLUnVz?=
 =?utf-8?B?d09ZOVRONUpkMTQxRjM1WVpnNFZIVGhscTgzelQ0QXdmamtOdjdHOTJFb3dJ?=
 =?utf-8?B?b0p2RGxKOWp1NUdtWUsxYVFWS1lYTnp3N1FvN05aVEpkTFZxb2tXSFNhWW04?=
 =?utf-8?B?T0hlcjB5c0lXTStSbWRMQjNQa2lObmFMVHFFaEU1S2Z4d2pBTDNXMi81L2F5?=
 =?utf-8?Q?pZOmh4hUCAuCrVc/1vnUan47u?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39dbd9ef-2326-45e1-3a1f-08de0c9b833a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 10:05:20.2536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Fva+86pbU6PBw39hXu8yDQdjwS3MAKGF5MyChfKB854usCWjGSej4EbCGI5wh4M72n7jvDkaPXMREhGhFFFmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5161

On Thu, Oct 16, 2025 at 09:30:28AM +0200, Jan Beulich wrote:
> While 1db7829e5657 ("x86/hpet: do local APIC EOI after interrupt processing")
> helped quite a bit, nested interrupts could still occur. First and foremost
> as a result from IRQ migration (where we don't have any control over the
> vectors chosen). Hence besides reducing the number of IRQs that can be raised
> (first two patches) and possibly the number of invocations of
> handle_hpet_broadcast() from the IRQ handler (optional patch 4), the main
> goal here is to eliminate the potential for nested IRQs (patch 3). These
> patches are imo 4.21 candidates (with patch 4 being questionable altogether;
> see there). Patches 5 and onwards likely aren't important enough anymore at
> this point of the release cycle, even if those with a Fixes: tag would likely
> end up being backported later on.
> 
> The one related thing I haven't been able to find a viable solution for is
> the elimination of the cpumask_t local variable in handle_hpet_broadcast().
> That'll get in the way of possible future increases of the NR_CPUS upper
> bound: Much like right now a single level of nesting is already too much,
> if the limit was doubled even a single IRQ would end up consuming too much
> stack space (together with cpumask_raise_softirq() also having such a
> variable). Yet further doubling would not allow any such stack variables
> anymore.

If there's no nesting anymore, you could introduce a per-CPU cpumask_t
to use in the context of handle_hpet_broadcast()?

Thanks, Roger.

