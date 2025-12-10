Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFEBCB29C7
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 10:57:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182755.1505592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTGwR-0001N7-Ge; Wed, 10 Dec 2025 09:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182755.1505592; Wed, 10 Dec 2025 09:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTGwR-0001Lm-Dg; Wed, 10 Dec 2025 09:57:03 +0000
Received: by outflank-mailman (input) for mailman id 1182755;
 Wed, 10 Dec 2025 09:57:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c2u0=6Q=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vTGwQ-0001Kx-3M
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 09:57:02 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91add010-d5ae-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 10:57:00 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by CY1PR03MB8124.namprd03.prod.outlook.com (2603:10b6:930:105::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Wed, 10 Dec
 2025 09:56:55 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19%7]) with mapi id 15.20.9388.013; Wed, 10 Dec 2025
 09:56:55 +0000
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
X-Inumbo-ID: 91add010-d5ae-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nSegdbKKTv45eQx9xqWRECTk81k+/fdMVSsIHVJtJiDINURf7wn0TIL8qT5HP48/NnbfKjeFaeqSV7wYH25qIL6IFdu70dmo23QpCHSBkhprmvQqNET07rS6dtwIkYqMi275jyTP+r/MEaB/WG8IgjY4O80YRxqWN6EvlAKYxRMGaQ2GLzBpFkAphvvfRadmEfjBE3zdfI80Dm2vDOkl42We+leNpPi3HbR94YTGYPMqBr4JsehbqQN7Moj0hIz1zCL9ZnVhFimO9Q2oybpQg4dsA0wFGWT1dJwZUxxG6EXN7IbkWBCOTPM7UMXJYF48nZSE4wIa/15pmWNbNzEysw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qs2E+t1VhP5H8rhJIroQzpyOH8ZHhNkyYLyak6fFgsI=;
 b=aSrwSRP47JRqC+ebONdTz2NJUp4LAZxdRfusd27qPrNSPK4ABIJZMcfB//hNvMljK+rb6+nV6DBLDJp2IBUOVMv+zVzjGtkqwInlqPzg05ASbdfQ25awxDBORYAulgYQAU1e6jToU1LfbTze0by9qQ/LPjnZTrsyKdgl7XH9QMjssx5j3SsuxvvdapTMLMDMjERLDh8WwtgDssApWDHKhfpck+rKaAKwuhnuEEIt6WV1FVnalK35VuZt0eckVgv5A/YNRk1seW8xDCWBIuwxxICmAiJg3MCMO1FnuXhMvqsHdsO4dQn0h0c/j8wp9D/0LLQrrS1KQtDog8AEWbMYHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qs2E+t1VhP5H8rhJIroQzpyOH8ZHhNkyYLyak6fFgsI=;
 b=gto2ZsY/NFmkslMZiK7On3JYv6oViqEymR9F9MujU9VVSZ0pVXXgHi0v7OqINW2eOtVLu1UNCsFAr9k+RD0GlGQ9sFDueaf2xBRfMEGibW2sRc2SWref+4z9mT/ZvqpiovXok1fsH3vpaE5fw32nX2pAl8lajX0fYhttoaSUNcw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 10 Dec 2025 10:56:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, dmukhin@xen.org,
	xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
	dmukhin@ford.com
Subject: Re: [PATCH v3] xen/domain: introduce DOMID_ANY
Message-ID: <aTlD4nZSU5rXIxSo@Mac.lan>
References: <20250924030630.122229-2-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2512091704020.19429@ubuntu-linux-20-04-desktop>
 <f5a7536b-32e5-44d9-b087-556559650fd8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f5a7536b-32e5-44d9-b087-556559650fd8@suse.com>
X-ClientProxiedBy: PA7P264CA0121.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36e::8) To BY1PR03MB7875.namprd03.prod.outlook.com
 (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|CY1PR03MB8124:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fd9ece2-1b0c-46f2-878a-08de37d27330
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VVoxeER0OENZWlJjNnduTEVMb2NVaFZkK1BvWXAySzRzZEtvV3diWFRrVWpa?=
 =?utf-8?B?L2gxam1MMWY4ZFpYY1B6OU9ZemRvc2pJbFFHdjJvdnBtQWhQZmMxNkxjaWxW?=
 =?utf-8?B?UEY5SHA5VjZDK01heDFCK1MwRHZCVzgrNEtYRUlQRXcvTlFvS3JQd0p1Q1R4?=
 =?utf-8?B?NVhEc1dpazZKVVZGckVyYi9OQk4vb1pYbjNGWERNN3V0VjAyTDBNcUFwMWVi?=
 =?utf-8?B?U2NNL0t5TGNSSHovUUhsUGxOMno4UmFSR29ZYnZ2bTFHVUdFYmgrOFpLL25R?=
 =?utf-8?B?QnJpWE01SXVOaTVveXpQNVlqRkd4WE9COGxNU3pZWDlVQ2psdG95TFhNck5z?=
 =?utf-8?B?TEFyeXJnNkxmWm8rYWlwUWpSQ3kva2tXQ3VRNDQ3TVUrSlBFVVhjUERoYnFz?=
 =?utf-8?B?NngyVmNuVVNaQUVkdDRld2Q1c3pUUk5HbmV0dHV3L200djRiVHVSWDBzRkJy?=
 =?utf-8?B?SFl2Q3VPVDJGRVZkb3pXVTdQcGZ5ZDV1SDVOb2lrWDVWcVBFUzNMUTJWeThI?=
 =?utf-8?B?MUZUT0d0TWlZSTlBSnRUTUR5YVdtYi9PSlNsVGVra1BrN2Z0K2NSWUgrMFJu?=
 =?utf-8?B?dERqS2xnT09RRzNaa3NobXhHMWZUdXpySkN2ejExK2JYYjhGTUlBVXBjSzRL?=
 =?utf-8?B?aStua3BIVkhrdmZNWXVTUUV1NzRRTWlqbTBQUmthb2ZKWnR5SlNiY3NJTEVH?=
 =?utf-8?B?dEIrNndneHQ0RndLc0xhcll5RXFGVXNlSVkrUkdvbTZCUmJsbWVGRXlRbVRV?=
 =?utf-8?B?Y0RMY2dtUjVMbG9mU2E3aHFTTSt1ODB4TFFTZlFXRi9CU1hpMGZCdWJLeHdK?=
 =?utf-8?B?RnMzVk9KVW9ORXpPVkRmVzRwYVgwa2hHaXdFTlN3YlVEWVhPMFJ2UUpDSHo4?=
 =?utf-8?B?K21XUVRCWnpGS2xXekRMbEpSYkhtYTUrWEVIZGF4QkNWSTAvbWJpeVc3dVV5?=
 =?utf-8?B?QldJcnlKVUxQTmNFUHU2V2xMcC9mVVZOQkdDRjdPZG5Jd09WUVpnaDlNY0t4?=
 =?utf-8?B?NGlXSXZYdEt4VC9vdUdCcS9MZEFvVitmOUxob0dRWXNsZ2RhQmdxWWFWWkFo?=
 =?utf-8?B?RmZTSnh2MTFTMmN5V0ErNFdMZVZVZHpQQU4rUFNiWTh6NFhIMmxDT2xzNHFr?=
 =?utf-8?B?djdKTzNWMEtzOWczMm1SM0VrNU1XaTJvbWJXWE4vVFJycVM0ajNkVHZMaGY4?=
 =?utf-8?B?TUs5MHpONUpnRUZGazJHS2F5ZmxaenBDcjFHdDhmL0ZGUC91QktSZllQeHRm?=
 =?utf-8?B?QTVCT2k4d3AwOFBOQ0EvUDRzZVpzQzhxb3JaUGFXb09TUVFMZzFhdTJvYk42?=
 =?utf-8?B?UVl3WUFKcDJiV0hFWklIT0tSM3Zkb24wM2tiam40K0JxYkhJczVmSnhadEQ4?=
 =?utf-8?B?NDlad2VJRXBaOEpxbjdWQWg0TEJhVys2bExXY3Rldm5MKzMxVmN1eEdYWGFC?=
 =?utf-8?B?TklJdytWTms2c2hyN1NKMWgwL25sZGpSQU5lZDJGYzluTlZjQ1N4UTlpY1I0?=
 =?utf-8?B?a1pyV0tHK01BU1FBTVg2TG9EdExkelJ3QmpiakhvZzZqclI1bmdXclAxUzdH?=
 =?utf-8?B?ZldpZWs4cmZ0SjZXcUxQNFpJdU5iS0dYRUx4M3NRdmYzYzN5Y0pNeWxUSDBP?=
 =?utf-8?B?UHZva0o4SWFCOUp0ZzhwTE5UNVdnNnhaQW5ZZGQ4SEZuZkN2UUsxTVN4T3hl?=
 =?utf-8?B?eVZVRFljN1hGNHpyVWJHQUp0ZjVJOEJ6N0tPOC93QVRQRFFDQU04MktROHl3?=
 =?utf-8?B?L2R3aTZPd21QYTU5eXJ6RWhtejBSRDRQTFM4MUlpRHFZWmRCcTRHYUFmeFFV?=
 =?utf-8?B?S2pIUkI1cUMrbit0U3hEMzh6WmtUdGxseE4zKzdOaXF5T2pLaGZ4M3BSbEVH?=
 =?utf-8?B?QzNuYUc5UXo5bXBtRkdDY2xVdFUyVkFOOXhLQU9Ic291eG5LZFQzSHhzTUhw?=
 =?utf-8?Q?Sc9GydEa/vB94aLPKRFWma/Q6IKf0Ury?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkZYdVZ0WnhNOHZ5aEtSMjBiMkp3NVI4cncybUlvSDFZTGF1VEZxc2ZrQy9p?=
 =?utf-8?B?c0xmbHRlQ0xneU9iek56TUI1VFltNkJIMkt0bzY4VHFkVlVrRGdMSkxsN0xv?=
 =?utf-8?B?alJYaDdVK0picUZOR25iRWtLUWk1N1B5QUpuYVBiWUFOWU95ZENTZTFibXJ6?=
 =?utf-8?B?ejhnWlhOWTNiVjRBSTRXZVBzNlBZamI3VTlFWWVaRDhTMlhKRkZIU010ME9K?=
 =?utf-8?B?OVFjTEhLU2lTckx0YTV6aUNTSldNSnhrc1h0OWVYSGIvQWxwMjc5UlpYcEl1?=
 =?utf-8?B?Wlk5ODAzbnQxRng4VlJDa01SRE9uaVJaU1QxdStRT080R0FoVkc3bFlHeDVT?=
 =?utf-8?B?OGRLaGpFbktVSy82MTlIRitoSVlkSS9UMGorZEtCNU5uYU1ZWit3cTJaUGpp?=
 =?utf-8?B?bDgzaUhrQ01IRXVmQ25oQ2dKR1A2SDFPUHhPWmtEbWQ1MFZQSzhhZXdBVzQ0?=
 =?utf-8?B?bFhmQVJFRWdLRHlvYzRzdS9DTzB3aTN1QXlUZGdvZ0ZoTUVtZmZDZVZ0K0FF?=
 =?utf-8?B?algyVHo0UGNBWU16MXdnbHN1U1JkUUNLRFpQUExxV3BmQmlkMlQ1UjBoWFB6?=
 =?utf-8?B?WFJYZFdldzVTMnA4eS9HNlliZ0lOc1B2d21nZm52eW54SlM5OTdCbmsvOExv?=
 =?utf-8?B?azBlZ3BVN2dSb043WWg4Z0JHQ1dvOHYvZnQ5ZkNDNUgremk2QndRNmJSMC9J?=
 =?utf-8?B?LzNOOHdrRklUZUdXVHFBNTRadXYyazFteEJZTHd0ME14aHdoZ1BKUXpxUFVZ?=
 =?utf-8?B?K0FxR00wbjVzL25mTmJzaWJOY0xNUWlCSXduaWhZb3YxMVA0Z01oMUxUV3lT?=
 =?utf-8?B?akE2MFM5YUFXZUtDeDJYZUtaVittOHhzMFhNZlJ3cVhrYWJ5RVhiMkpqOTRG?=
 =?utf-8?B?MnZWYk0vUmFXWlpiQ0JOdzlxdDg1UXpyOHA2RlRDOHB4ZTZYeldmUFB0VUFJ?=
 =?utf-8?B?VjlTZHg3Vy9XMkV4RjRZRDJQZSttN2Jtb0lVdTJWaDUrK3h0eTRnVXJ0MS9B?=
 =?utf-8?B?L1p5ZElkYkIxNlkwdmZ1RjVTTnNubUVIZm5CcGI0MTA3V1JIZ0k5OGNiUjV6?=
 =?utf-8?B?ZzYveHVaeEtDRGZ4ak1DM3kybWJReGQzVnpPMklsczlCaUxWSEhBUHYvWXY3?=
 =?utf-8?B?M1RiUVpMSUdrVmc1dTNyRkR1LzE3LytOWWUwUGxJZG9QVTd3MGE4RnN2cVpR?=
 =?utf-8?B?SWVSV1RNb1hUbENBa0VoSUZ4RTdrTkMxcE9OSlRPT1cwSkpYVnIxVTNkY3l3?=
 =?utf-8?B?eU9QRU5tcTI1Yk90OE5WZmlEbndlaTlobTlic2hBejljQ0xacHZnMERJK3E0?=
 =?utf-8?B?UlRRSVZIczIyTXFnNnJQcDFQc0tDbE5vRS9CejFpU2YzUUpEUVJNZFc4dUVI?=
 =?utf-8?B?a0FuZDRDR1lIcGtwODE4dVpMcFdEL1Q5U2pBM3QzU3N6Y2l4djl0RjZQeGFT?=
 =?utf-8?B?QUw0U0ZHUTlsSmxUZUdUYmdzV3Q5azBpNGlENmJueHVzaU95WUNxdDZaSFRQ?=
 =?utf-8?B?N0hqcWtsRnJhWFplT1JoUHluWWZPaHovTzNMTnFxWmJoRWU4RTNXWU5ua1Ur?=
 =?utf-8?B?MTdJclhyTnlTTmtxTFBsbEpKbkFUWHovYTNHbWdxd1BzNlRaQW1HK01KdG5z?=
 =?utf-8?B?cjB3K3ZsMCtUazlyellCdFhaeTAvRFVYRVBXSjhlcmRmM0FBNUlaa2tOZHFt?=
 =?utf-8?B?L3VLSm52UUNXZkM4eEpPOUhXc0dIWEU2cE9iYmIrd1lOdkFaZlcyRzhPMC9G?=
 =?utf-8?B?dE03YVo3OUtCMy9VOEpEZHl4c3BrYWZaWXRpQkFKWmhQLytNcUI1a1lkVjhS?=
 =?utf-8?B?RENTNmJ5REFQMmFYWHZmYmRDQVpiLzNTSGxVQ2hta2lLc0dQRElwZTBxOFlX?=
 =?utf-8?B?aHdhN2dNWXpseTdDbFI0M283emsxRkNUR1FVVG5IbXk1RzVHWHVmVE9ZbElk?=
 =?utf-8?B?ektyb1FqTFErQmZ3eDlqRUlxMzkwbC8rQUZ2NFBRTlpoRjRsenJTaThQbkdh?=
 =?utf-8?B?UUE3OG0zWDhPdDdWR1hGVDEwbFB6V1JUMnNUMWtHQVpDekNMd3VmTW9DVjVw?=
 =?utf-8?B?bHFnNnlJL2JnZzNna3ovNkR5THVLYnk2N2toQXNqNlBTdjJUU0J0MzIwWndn?=
 =?utf-8?Q?J2CdImPagbuRe0sk4JtOV5MvG?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd9ece2-1b0c-46f2-878a-08de37d27330
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 09:56:55.0553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PwYnLxd5rIoDquhfTU8o7GqxVJK2kpiHtzj3fRFbMX1xL+dFsWI0grBkx/FeuYLf4eiD9nR7PaUr493Cxwux4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB8124

On Wed, Dec 10, 2025 at 08:36:37AM +0100, Jan Beulich wrote:
> On 10.12.2025 02:04, Stefano Stabellini wrote:
> > On Tue, 23 Sep 2025, dmukhin@xen.org wrote:
> >> From: Denis Mukhin <dmukhin@ford.com> 
> >>
> >> Add a new symbol DOMID_ANY aliasing DOMID_INVALID to improve the readability
> >> of the code.
> >>
> >> Update all relevant domid_alloc() call sites.
> >>
> >> Amends: 2d5065060710 ("xen/domain: unify domain ID allocation")
> >> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > 
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> The other day concern was voiced over aliasing DOMID_ANY with DOMID_INVALID.
> I don't recall though who it was or where.

I'm afraid it was me (at least) that voiced such concern.  But then I
completely forgot to reply to the patch.  I don't think this is a good
idea, aliasing DOMID_ANY with DOMID_INVALID is likely to be dangerous
in the long run.  In the example here it's fine, because the function
itself doesn't use DOMID_INVALID (iow: all usages of DOMID_INVALID are
replaced with DOMID_ANY).

However I could see a function wanting to use both DOMID_INVALID and
DOMID_ANY for different purposes.  Having both aliased to the same
value is not going to work as expected.  If we have to introduce
DOMID_ANY it must use a different value than DOMID_INVALID.  And given
the context here I would be fine leaving domid_alloc() to handle
getting passed DOMID_INVALID as a signal to search for an empty domid
to use, I don't see a compelling reason to introduce DOMID_ANY.

Thanks, Roger.

