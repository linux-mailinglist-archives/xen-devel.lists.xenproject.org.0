Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMj1EMmkwmm3fQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 15:50:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9002030A78B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 15:50:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260945.1554103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w535U-0004Om-VS; Tue, 24 Mar 2026 14:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260945.1554103; Tue, 24 Mar 2026 14:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w535U-0004Mt-S9; Tue, 24 Mar 2026 14:50:32 +0000
Received: by outflank-mailman (input) for mailman id 1260945;
 Tue, 24 Mar 2026 14:50:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1w535S-0004Mh-Lp
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 14:50:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w535R-001WQj-J0
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 15:50:29 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c2a4aa-e002-0a2a0a5209dd-0a2a45019438-24
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 15:50:29 +0100
Received: from [52.101.52.9]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c2a4b4-6400-0a2a45010019-346534092d52-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 15:50:29 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH3PR03MB7460.namprd03.prod.outlook.com (2603:10b6:610:199::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 14:50:20 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 14:50:10 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jSGFSiJ/b3iiJ29qfK+0yq44QGQKyiE+dYBy4TzSNTO1AQ2oqezDbktrCnwKK8VWOcvITa5T/AyhRQbGu1xeMztyeWEjtu953Hsi8DJs948aEr8QvcPPtj14QimFB1Ofxhbpu+1fPxhlzyLvibxbTTkIapkOPLvMATo5PcwEmcpWDAQKeWgjo67nsiv6XSvDvARMYjIjshIuDkYfeVcmEK2Zm55Lbu6udnTlXwnSSg5KQx69z44iEMCTCFYDwJUIeD83zclQmfajJZbEbjDhiWOrAO24Uoot83FYmli0Ci9pdJSU2bDRxm6LuhlQBkpdvMPYtfxEJGvCW7tZK/NqOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5iDFXhUIBetYfHEkNaSgVmrep20L/k8Pni+YdPg5Jz8=;
 b=nQXdbyF8Ibb37TTlUuhkt/jF3g4qgqrsfU/Iz67U+FrklnsFHViWBmXkwOKA7SH7GO2zxBp5EXu0mh26f4ERDm3hH3jl1jP3Qy4dfaZPaxjkslQYklhZYnwoanBNU7Od6o8z7b3Jy80D1kQAiG3sr6GRAWM49NYJSS7Jg7t2s9hXdizzHPGA/sF02QcCHaafJKuyV9j6mlakS7sztTOgGM1dnlNV1JgaSxYr7uDo2egaAZS1YFcW7fyrnpkf3PgKFdkh8WxU09qqn+ebLS2Y80NGQQSLHNaX6B/QpPSq7Aq2o5GXT+8knHKSQQ7nCNJbRuzkTreRnA4TSZbjHfejvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iDFXhUIBetYfHEkNaSgVmrep20L/k8Pni+YdPg5Jz8=;
 b=LGrw/Q2StLdfLZ4r6PZtGU2bMyiAM3Jwg45lvutkUlwmy/OCk5k8g3eJkiSC72VSif6fVkWakIxp6pjEPKhP8CwvHoimi4GblW0UAywSzzfcbag9Lrs1vgy3LkQK8CBxTtzR46gZizdRFKYTUvZbVOysKKe2yc0bIrjooQXy+Nw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7b75bbba-51b8-4e2e-9b3f-e07c8deb962e@citrix.com>
Date: Tue, 24 Mar 2026 14:50:15 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v1 2/8] x86/vmx: Remove lazy FPU support
To: Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
 <20260319132924.1469809-3-ross.lagerwall@citrix.com>
 <a67bbe7c-9c41-43e4-9d28-f5f221c96b95@citrix.com>
 <c646fd85-f526-435d-897f-c1ad72e6d234@suse.com>
 <4a03299f-cf0e-44ba-ac35-f13392eb83fc@citrix.com>
 <599e1de2-6468-4f32-a52b-408d8c63e8a6@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <599e1de2-6468-4f32-a52b-408d8c63e8a6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0295.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH3PR03MB7460:EE_
X-MS-Office365-Filtering-Correlation-Id: 70562a52-fb93-4429-b575-08de89b4a51a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	VBMaDH20IaukjhwO101kINd2NxUy/8ygD+sUhPOxt2u7J5HFOGKTAvCM7gA4ZsM9tiAh3FJC7TygUISX5BV0IkGpdqynWz6CArkRCIQmt5ZMTzflMebBY5E4eWnmba4iWXyMfAae46aiEkqEWLNsrqrrwfJSOUdFh6P3DAwyn7pYmFXxcp0JvpxKXMnpS8igml+mtBlwvYPu/9wlw0Kdkw/W+mpl/Us4Ourvl4zGoKt9lDckRhfZnrepGSJamWO7zV7W7d1cCzuzz6nvJmSFuXH0q0yQEZW2OZUCVUz4B4tCfE86vSyJvqh3MqEgnO3cl/s/MVhQr6OBQQCHOLEbdBFzz/JftoRkS04qmoAtH3hZIQ6/viliSGN2S7s5icxDqCccAlaASeADcffI3ie37Ort13tdbxwwWTLAykeOaHpOLQjVPGV1KO+JFh5OGaXGA8ysgIBjzdHqajZhrvvjROhswYge25Fl3qSxQg6tzw0+UThJev5aR+0D+tfpO/xsIcyRNMpquM0NGgKHhsp5P/cStR1y74gtnks3KmL0AheJsuEE3udJDnom6sr0l2Dpz6ZXmt7HK/JNNEkTWKxrdbozQ62sV1sLUtzLCkM90XzqSSpVE/fNBfpNFRcaLQ7U4blkszscpjdJOjngQrEkZcYMH6aT9SP8P0LO3SNmzmGmcMw2VlWOnuSkWzDXXh4BcNP51FlVQNkL4/5A1ys4/dkYKypqyMCfdxXbP1FOWiU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkZteWZQbk9NNEZYaU9zUnBmOFpVYkpWdUJtdCtPbUlSWHdPaTl3Y3NIaVpH?=
 =?utf-8?B?VHViQWdtY3JyZ2F3emJoYzNCdGdiODdhS05LMTBibGF2Q1B2clhVQkVuVHpn?=
 =?utf-8?B?SDg4N2FBdHZmOUNWeUJFRlFiMmY3QmdSVEZTNUk3ZkJ3T2RVZ2NvOERnWEth?=
 =?utf-8?B?Z2FTaWpFSlU4NVY3NDhyNlJmTEVpcHZtQjhBSGJDcStGdTVkSkxTNTRFUjF3?=
 =?utf-8?B?S0tySjUrOXFsdmFQenhFeWpjditXYUJiN1ZGRmcxamh2a0pLYVM4WGNzN1B6?=
 =?utf-8?B?OEEyWlBSUzVENU52bWNOaTY3cEhhR0JqbXF6VncxaENwbW5KSVREdFZmQ3Iw?=
 =?utf-8?B?OXV2Vm5NeEMvbmErbGJrc1RjMjFndXo0dEc1bkt2STdack0zR3RPZFRibE1x?=
 =?utf-8?B?VEtRaW4zWlAxN0dneUwrTFZQTGdJeVlOb2QvQ3R2MCtNbVMvT3VZWDRjeWFz?=
 =?utf-8?B?RW1JS204N0hTdmxHUGxHcDFRU3MrT3Bpd1d5WEVLMndzOXRPYkJQcGFPOEd0?=
 =?utf-8?B?bGpQVkNZZjRYMFZEVjBzUXIzQllwNmdTQ24rSUhHaEVuRmNSZ1dKbFRydXhZ?=
 =?utf-8?B?dklKV3ZiU2Q3L0ZCcHNsT3diOThiekVVS3lLTEpMZkEwN29OSk5CRzZFUXQr?=
 =?utf-8?B?QVlKYUVieWpnVk5pWENEMWZ0dUFMWmdDM3ZYTWl4UGdZeEM0ZVUzRW5DVVNo?=
 =?utf-8?B?eUs1OWUzL3VIcVNvZHk4YVBrS1doWlZmSHFxMjVuelRXejE2MllrL1I1N3dy?=
 =?utf-8?B?SGk1UzZXVGRzNHFrbXJieHFSUXJRWlEyc1NOYXFETUNRVFRxVXhnb216UEJ6?=
 =?utf-8?B?aHZqR3E5b0lnYkN3cW14WHVBNWYvT1paWG9lU3hGRFFyb2tTbURNV1VFTHJE?=
 =?utf-8?B?Q2F3Qm94MkZlL25wYXFxODcyWEZxL2c1NGhFYVF3SEkxVFpxZlVBUHIyMUhi?=
 =?utf-8?B?anI1MEJ2ZkUvVE9Qa05yTVFQWkpxRjl1TTVleDZ1aHAyU3k5UVRYRzIyeDJF?=
 =?utf-8?B?T3JiSEVRVWJBVENTODhyWFJFK0FpMkpjN0JnWlV3RXo2QmVNdUIvRU5FcWZp?=
 =?utf-8?B?cG05SDNpaWhTekd5WWl5dEtHbzhqeTcvWEk5Qyt6ZlFqYTk3TlJBNVNCZ0hh?=
 =?utf-8?B?eGcxOUw4Z0h3OHdZcExXYWJkUWhVY1lHdFFRZFE2cDA4bEpIemk0cHY2K25S?=
 =?utf-8?B?SUpTeFhZVzVINXplcHBKNEJ2U2VnRzEvR0dKb3RTSEU4dWtvU0J0R0k4UUdu?=
 =?utf-8?B?YlRCdi83T3JmbTRPdi9Vd3kyOEpYMHBvVHdybXY1czNUci9qd3FYMGF6MVpx?=
 =?utf-8?B?YVByUmhZUHBGQ0c4cEM4djlnc3NpM3ZxRGJwZ3NwN3hwQTJNSTVLajM2bWtE?=
 =?utf-8?B?NmZtNUZUUmJEaVNzZlBWRjJrbFZqN2tTVDRSa1l2Z3pOc0xGTTRxbWMwSmdG?=
 =?utf-8?B?SkNhOU01aFdyQzNYVzhBMmVXeDFnaERMWUlFdHZ2UithZElmMnJsVnZmbzZ0?=
 =?utf-8?B?aDBsempIeUNXa1QreFBNTUN4ZitEUlI5c0VLMTlrWmU0cEdvUTl0ODVWSHdu?=
 =?utf-8?B?bnVCeDRDaCszcEFROVJVdkhZZkgvdEYzdUNKcmZpdXNJZVEzd0FWSjNiZjJS?=
 =?utf-8?B?anZPWm9vTWVjblNTWW1qa1E0VzBHTVBNVE05TmNNcGNlSm1QNGxKUjVzVENu?=
 =?utf-8?B?UytMSFE1ZVZ6Y3BzbGw2T0RTTzE0NG9yM3pqZ2dLSjZJamJnU1JJNVZqSXFn?=
 =?utf-8?B?WmhvM05GY25naytaSUlYUnh6N1JRRlh2WFhMcnBscUtmN0JpSzdSY2Q4cUNL?=
 =?utf-8?B?ZHM2YWFES092bzAwRXh6N04rakhuU0VmUGs3WkFWU0xNQUJLcGdDQ1pia0ZS?=
 =?utf-8?B?TE8rLzBYaVdJckU2V0lmNDhiSkVkaGp5d2JxcjBDZStVV0lscWVyajRzTVMv?=
 =?utf-8?B?aHA0QUZVTUFYTTZMTkR0em4xZXVrSHVzNzRVYXVVenE5alhQZThCM09nVFNX?=
 =?utf-8?B?emNSMkdnNStUNVlndVdyd0IwUHVIKzhGT0M0NlhmMmFGZmhieUpvQll4emE2?=
 =?utf-8?B?dkh0UGczRmZQWk85U1hwT1ZBY1JMOUhPVktETXdVZWV5em1VdTE3dzltYmlR?=
 =?utf-8?B?SnVYLzlQUlBpazFDcDdBWENGOFRLTVI3blU1a1BSb0ZaOVhudkU5L3htdmVF?=
 =?utf-8?B?ckQvVkpvWkdsd1lDSnE3Zit4ZFpSNE5iTWIySDZ2KzVDdUt4Q3FJUWJ0SEln?=
 =?utf-8?B?SkFXZVVQa0t5eVI3dGt1S3FxWngrbW53a3N1VGpSbkRJbk5DYjFiN0YxZjNh?=
 =?utf-8?B?azVMTHRsdUh6Q0hhQ2lSeFdPWjBORUY2UUJnVEFBeTA2SVhLMDFuZFhEbG11?=
 =?utf-8?Q?N41sS6nJkLXtr0ck=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70562a52-fb93-4429-b575-08de89b4a51a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 14:50:10.1649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E8aO1ed8cB+CPCp31Iz+yQ5udE8kFuC7uony/bg8HqZkSfE0Sjzy9DDNKlQPfXZLrgAC40Io9MvXm9UI/p6JNFhtMcLE5uMfjYwXJMWbh30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7460
X-purgate-ID: tlsNG-d62444/1774363829-4981DDF3-CA4DCF76/0/0
X-purgate-type: clean
X-purgate-size: 2340
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:ross.lagerwall@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9002030A78B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/03/2026 10:45 am, Ross Lagerwall wrote:
> On 3/19/26 4:54 PM, Andrew Cooper wrote:
>> On 19/03/2026 4:43 pm, Jan Beulich wrote:
>>> On 19.03.2026 17:38, Andrew Cooper wrote:
>>>> On 19/03/2026 1:29 pm, Ross Lagerwall wrote:
>>>>> Remove lazy FPU support from the VMX code since fully_eager_fpu is
>>>>> now
>>>>> always true.
>>>>>
>>>>> No functional change intended.
>>>>>
>>>>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>>>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>
>>>>> ---
>>>>>   xen/arch/x86/hvm/vmx/vmcs.c             |  8 +--
>>>>>   xen/arch/x86/hvm/vmx/vmx.c              | 70
>>>>> +------------------------
>>>>>   xen/arch/x86/hvm/vmx/vvmx.c             | 15 +-----
>>>>>   xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  2 -
>>>>>   4 files changed, 5 insertions(+), 90 deletions(-)
>>>>>
>>>>> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c
>>>>> b/xen/arch/x86/hvm/vmx/vmcs.c
>>>>> index c2e7f9aed39f..8e52ef4d497a 100644
>>>>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>>>>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>>>>> @@ -1247,10 +1247,7 @@ static int construct_vmcs(struct vcpu *v)
>>>>>       __vmwrite(HOST_TR_SELECTOR, TSS_SELECTOR);
>>>>>         /* Host control registers. */
>>>>> -    v->arch.hvm.vmx.host_cr0 = read_cr0() & ~X86_CR0_TS;
>>>>> -    if ( !v->arch.fully_eager_fpu )
>>>>> -        v->arch.hvm.vmx.host_cr0 |= X86_CR0_TS;
>>>>> -    __vmwrite(HOST_CR0, v->arch.hvm.vmx.host_cr0);
>>>>> +    __vmwrite(HOST_CR0, read_cr0());
>>>> (Not for this patch) but I'm pretty sure there's room to optimise this
>>>> further.
>>>>
>>>> CR0 should be constant, both here and in SVM.  Reading the active
>>>> cr0 is
>>>> an example of the anti-pattern we need to purge to make nested-virt
>>>> work
>>>> better.
>>> In which case, is it a good idea to purge the host_cr0 field?
>>
>> Oh hmm, I take back my R-by slightly.  We still need to initialise
>> v->arch.hvm.vmx.host_cr0 for this patch to be no functional change.
>> Easy enough to fix, or fix on commit.
>>
>
> Not sure I follow why v->arch.hvm.vmx.host_cr0 is needed when this would
> be the only place it is used? 

Never mind.  I'd mixed deleting this variable.  My original R-by stands.

~Andrew

