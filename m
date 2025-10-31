Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B28C25372
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 14:15:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154305.1484378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEoya-0007MU-Mk; Fri, 31 Oct 2025 13:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154305.1484378; Fri, 31 Oct 2025 13:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEoya-0007K1-Je; Fri, 31 Oct 2025 13:15:32 +0000
Received: by outflank-mailman (input) for mailman id 1154305;
 Fri, 31 Oct 2025 13:15:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jqku=5I=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vEoyZ-0007Jv-It
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 13:15:31 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac375288-b65b-11f0-9d16-b5c5bf9af7f9;
 Fri, 31 Oct 2025 14:15:30 +0100 (CET)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by CH5PR03MB7934.namprd03.prod.outlook.com (2603:10b6:610:215::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 13:15:27 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 13:15:26 +0000
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
X-Inumbo-ID: ac375288-b65b-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OKkmnCo7WVfbrSsBJytY9IhL7sMebiwirI2i3cdmJZ2sGtnJ2CZYnTOwvvVtW1X9nrLgpVAcl/TJ8UIUIvZAPeCV7VmRq4H2iqj8XbLmNbmNttNNVE/k4GtMayI6FnH0WAIb/fJIIjIEyOWZp+EO2jD6R6934+2tau508ux6QzKis0kBUUc335Os8+cgha0TG7l3QSlhy2YtbVxVVEI+zA0yGdT320O/9LnTfUsu7UWNhhGI8600Sy6FgOF59i975nbJ3kWI/7CPgmueVGWZRJbyQKdXx1lVwCgWebKnWYX9cPhrTkiMmwI2ZHUTib8HynXcWJO+ui9ynpnfqylbSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0ln+Qp3rJ0Tongdy/62CoA3IxhaSwPLiR+TbG05VKg=;
 b=J4VpyWCj1yaf+phdjWtxvgvxKuxsjQU/z3no65TcHOypSmj5+tbIc4iimZE6s4xT0wgfNQFDL5A43eTDp3DIBOYYjqyGA7/RmHBdztKALdBd+V1b3uUwYW11Z9KJhouCNDRBhalJxi4C1F4CdJ0Gf1dYi4q+3kasH5iUawTdA1/3CFaGWr1DnrgtAyvBR3e/695giKxP2A9XUf6/hUPnNTsliTSUTkJgqZ5SLZlo7mee8hxvMgIziKK4vbEeSRb7DFCiflBX2f2jtvwufEwm4Oer1mgUtlfoOy7DbJq0ktVkadVBZwJp2Lmm1aMrwKAekxkp4SOmKZDxY1wUpr8oFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0ln+Qp3rJ0Tongdy/62CoA3IxhaSwPLiR+TbG05VKg=;
 b=Fq19m/QQTaqgYO7xhf9qsYFXddwylkrHbnKzjTLKxZDTJzQBJA8JtxX7QeC9xiCSAzWWd/AsP+nokPI4SUhb1SaQIglH+Ique3OXhHhljO+Ki24AX36QqhsYFwGg/3M5G9bldsl+wY9Lhnf+tTaAGZpysihCnHbRG16QUiuklDM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 31 Oct 2025 14:15:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 for-4.21 0/2] x86/AMD: deal with RDSEED issues
Message-ID: <aQS2arOWxEiHq1sj@Mac.lan>
References: <272093dc-c97c-434a-9977-ad1c26e7e229@suse.com>
 <aQSN3MKxAa_cltld@Mac.lan>
 <68e28e41-e835-4985-80a3-6a99b3d7dc3e@suse.com>
 <aQSVTjh5xiib-u5D@Mac.lan>
 <b7293f69-d9f8-4669-a1fd-eaa468445d68@suse.com>
 <aQSoE8ugCKdNWy9C@Mac.lan>
 <8c7881d9-5959-41b5-865d-d61199ac7a44@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c7881d9-5959-41b5-865d-d61199ac7a44@suse.com>
X-ClientProxiedBy: PR1P264CA0096.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:345::11) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|CH5PR03MB7934:EE_
X-MS-Office365-Filtering-Correlation-Id: 591ef11c-8a5c-4940-8099-08de187f8ea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3dSdHF1MzdyOHV6UStEbkRkL0hSTUNiNjRRUFhlYkF0WXBVT3RkNUYyaTA2?=
 =?utf-8?B?blYzMWptRE9RK2FiOGxxaDk2SHcxQlg4dE5JYU0wcjhtOW4yNVFYcmZqcUR1?=
 =?utf-8?B?RFNub3dSajNlYWV1bHdEWjJXM21JallCMHphdlFhUjErUFh1OWZ0M3FseUxw?=
 =?utf-8?B?SFFSM1pwSkY0bzUvYUZmdXR4QkF4VGNQWnk2enlBQ3J5MnBZWUxHMHNVMThI?=
 =?utf-8?B?dFpZNnI1cDBYS0tNVkxxNFZhWkNUaWRBVmtyMjNRRnBoamFQMW16b1J5QlN2?=
 =?utf-8?B?Zk4rNFF6KzRjakRkZDJFR1RzSHZ0eXVUT2hvYlZXVytKK24ya2I2VnNmQ1RL?=
 =?utf-8?B?UlpuamNFSCt2TDhNdzliU1lVQXFvU1krNWpzcE9Dd2xUeGlBV0FNc1lFN0Rm?=
 =?utf-8?B?UXVEZEhMd1NGQUdGUVQ5c1FYRDFlSVlEN29SK2MrcjZlN3ZXd2xqT3hsQW1O?=
 =?utf-8?B?MFFZM3cyREYyNHN2ZDhjaXRJT3Bzd2FVZFNYRGtOa1M5eTA0ZG9pUk04TTJR?=
 =?utf-8?B?RnQzWTR4TmlFcVhqeXhxcm1NL1hpL0R1THBLRFpzelFpaWE2NW1LcW9SVFhU?=
 =?utf-8?B?VEpnREcrbmRraFpDRGtFZXRCUFFZdm5GTHZjWDNsNTNMREVQKzBHNjBKQ3du?=
 =?utf-8?B?VFU4WGRFZmYrU1lzdzlEQjcvZVErdC9EVkhvdHp6UENYR2Jyb2F0ZjZ1TVB2?=
 =?utf-8?B?aGh1ZFlXOFc1SGFqTTlRRDZibzFwZzUyNXphTTJYOWw3ajNOQzFyMUlnSFBG?=
 =?utf-8?B?OENyZGdZOUZ2bGl4WlVYeHJjV0NZeXNOVGdZT0lRQ1BQSElxQlF4b3JtSHpY?=
 =?utf-8?B?dG9QTWtQQ21iLzhnN3VhR0Q2Rmw5WGFid2YyRDNpdktTS0E5WnNnQ2ZyQjN5?=
 =?utf-8?B?a3VLWWIvL3NTNjU0SlN6NTlOQkxQL211UjE5Ui8yLzl4ZFZaYnVseW8rOUhO?=
 =?utf-8?B?SUdldGJ3SmFSWGpMQ0pyaHRFNjdiTlFZTi90cURKZTFkTlQwVkJ4MWdMMXdX?=
 =?utf-8?B?MmhMNFhIRkdwWU0vK3pjWkJWZHpzRCtMdit6ck1taUxZVDR3NG5RRVNDZnR3?=
 =?utf-8?B?Q3ZlOWZiRlhwZXpENW1kQmRibFR5MnpPUjFRWm9TbkRGWnF6OG1qZUJmWlE5?=
 =?utf-8?B?Qkg5NHNFaEsrUE1hRE96c216S1Z6cUhZT3BGN1NJdlgxTmVIaE1nZkhVNENn?=
 =?utf-8?B?ZXc5blNWYVhBMUNydWFySHp2RmRpTjFxTkJmZDlHYUk3UFhQcnkrNkEydWxG?=
 =?utf-8?B?UjdsZFpHd240T05SWUlxQ2hXazZ6SU9rbnhlLzZRc1M2YnExL0t2MnZNc3Vt?=
 =?utf-8?B?OVZKTlZySUUyZ0FWUGRlZ2FjT2I4Y01wRUh2YXFOR3FBZWJWRGhwTjFMSEhT?=
 =?utf-8?B?blJEbjJDLy95L2VBYTRBNTBxS1ZiSkRLb0w0WnFRS0dwQ1g5UlhHbVIwZDVR?=
 =?utf-8?B?VW1wN0J0anR3N0srYVNORm9sekZlTzRHblM1d0ZPN3hRVVVxMmQyZW5BTEdv?=
 =?utf-8?B?bUtScmRPNmtqQ3Z2N0tWV3N1TjdFZWZCT1gyTG5STFNRYmloeUk0dXIzV3Ay?=
 =?utf-8?B?VzMrT0d2cWh5SDJzeVVOQlJVK3lUT0xNekVrZFFyQjFZZGZLTERuekh5TGFh?=
 =?utf-8?B?dDF6S3RoalBvZnVoU3hRRWtFVmZ6NlVhNzVvVVY5Z3RkUDdqTzBzakhVUytZ?=
 =?utf-8?B?YUlUZ3Z3ektsczJhaUZRNjlzVXE4M2ZLNFZPOUsrWHFIYVUzbmtuZGxXQzZS?=
 =?utf-8?B?N0ZHMlJsZ3p0OC8yRURuMzhrRkNQeWd1QVFNZmk0Zm13SGFlMm9RRGlhUXhl?=
 =?utf-8?B?ZnRZbFB1NENiK1pRQTExYXpHWXFuM01QbDE5aVE0ckUzNnFMQlhFKzJKaWxx?=
 =?utf-8?B?R3d1S3BTSWNWNmlSKzlGQmRuWElSZEF4UGdPODBldmkrZUlqSXNKTDg5c1hm?=
 =?utf-8?Q?b1WM7qwP5l2SwUIyiPkL+NYmPnS3CZlO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uk9kRkpzRC94MFJJeE9TSVFlbmo4ei9uRG40ejFVUGZJeFUrQVpZRWwwb3cv?=
 =?utf-8?B?RnFXOVVUNU9rRFp6R091bGRvV0d5U1A0Vm5ValBPVThrcFg5U0VlQXJmOHBW?=
 =?utf-8?B?d2dQQmlpTjJUNU1iVGxTb0lUSHgvNVpZMFR6azkzaURnOTR4UUVSbnZhUDBq?=
 =?utf-8?B?ZnEvYTF6V01SNEJ6aXcvOGp6a0o4Vk9kMHZmTmpBM00wdTFzNXFIL0t1Rzg4?=
 =?utf-8?B?eFB6SFVibWh2WEkwWVRSMCt6bXBMR3JqcVRua1RhaENFNWx2SlZ4eVZLcGRH?=
 =?utf-8?B?VUpYTTR4ZHJreGRYRnNSZm43ZlluQy8zWFIrbkpmWVhsK29RbTZMdDFVM2pT?=
 =?utf-8?B?ZW1SdHc5S1BPNkVBNDRzZG51VG1id1hBK0xULzN3WHozMzdFWGJrai9ZV0Ru?=
 =?utf-8?B?SnJtbXRhOGpydTFjaDZRRWh6aXc2L1A4bkhuRDJFWHM3dFFpM05JMElWY2xK?=
 =?utf-8?B?ZUdDZnJLVFY1NkpyQms3WUdCcFBjQ0ZGV3RCamY1SmxhdlAwbml3eUhlTEVU?=
 =?utf-8?B?N3pDUHRrVldObXJNamh0blF4SzJaRitMMng3TnVDWlBLbThXK1dqWkRBYkgy?=
 =?utf-8?B?dXUwTHRTdWNxaHQ2MG5kamFkQzJDcEsybHZYTngyT25JMHk4eEZSZlpHT3FF?=
 =?utf-8?B?dVM0MmVFUTRSWUxlM1VhNlZ5TW5PR3JrbzdzUkMydkN0UEVVUmFaNGdPRDNX?=
 =?utf-8?B?b1lyMGtoamV4NG5jYm1TMTlNb3E2WWozc3VyOC9XQlNWWjNScHNtZ1RUdkZo?=
 =?utf-8?B?SkMyOGdBTG5wekNNVThDTUdHbFBxVDc3OXhSWnFaN1NPNFdCRDh1SkN3RENo?=
 =?utf-8?B?anlod1hpL1hGbEYyNUptelJHS0psdU9HK0dtWkRBZk5hMno3VzdNWmdiRzZk?=
 =?utf-8?B?Y002cVFyM2dWSWJZMnExbWgvelBNZGJ4Uy91M0Z1MGl6c3NIYThURzREZTNi?=
 =?utf-8?B?KzJnWFJqek5JY3IzbU8rRUVONnNlWXd2M3doRjYrQnQ5M3ovTzlUU2RUZUM3?=
 =?utf-8?B?Vkh5alpKWVhWWG1nQjREL2FSK1RjVUh2VDVjSXY2eTZQenpBZ1paMFhMd0NO?=
 =?utf-8?B?TXoxQUZ2UWVTdDlLWFpUeHpHZWRxYXg2RW5NOUxjUVhMdVVOZGQzUW9nNXpw?=
 =?utf-8?B?bmtsRS9qZWJFOGtxK0JwUWZSZm8vemIzdUlQVUlrRHZOWDA4U2k1RWgraWRo?=
 =?utf-8?B?STE1Ni84VUFLN3N4YW1qbmxPVFlKSEU3ZVBDUFVtSjV3OTV2VTVzNnRjS0d4?=
 =?utf-8?B?bHRVSS94SEd4TWNVTTNIaS9KR040R2JuMlZLTUNrM3ppMmZvUUtkaFB4Rkt1?=
 =?utf-8?B?YnJIZ213ckFCZGpGYzM5b01INUNzeTJlaDdlcEYzZTF0a0NiclFacU9zdWxh?=
 =?utf-8?B?UW4vSEwranZzV2tVT09pYktrN3RXSGJKRkN6YnVJSGlUMElSS2RvYmx3Wm5Y?=
 =?utf-8?B?WG0rS0I2YW43Ni9vNjZ6TWNCcThoYUttcWlkZUQ5NTJudTBYU0RsdzRxbUkx?=
 =?utf-8?B?OXVsMTFFOVdBMzdjUDl5VHRwNHBrSzNsUEdvR2c4d0JlV3YyYUxwSHdnVG9k?=
 =?utf-8?B?ZVpPbEZZdHhXcjVLdTNUU2dmbXcwVXhhWTMzakdHZlJmSEo5VHdiYWpYNTF1?=
 =?utf-8?B?NWxiREpMLzlRTTRDWlUxOUdpTjFPdFBMTXo5U3owRWR2N3Z4cjNJTzN0cmZD?=
 =?utf-8?B?ZzZ0RVpVTGJzZXpKOFRlRVVYUHJpb0hYTkxrcFd5SExwUy9KRFNqRmdhSTZ4?=
 =?utf-8?B?a2RIT2UvaWphWlE4Ym5ySGJDcWZXQVdxUXRuNjZvTHMzY08rZW1taTlvY2JL?=
 =?utf-8?B?TnpYMGQxWDdKL3ZXSDBTeFFZWUxna2Z3U0Q3b3d2ODNzczBidkxsZTliLzlu?=
 =?utf-8?B?VHpsZ05YSEU3eU5MMEYxNE9rMWhDSFA1KzBoMU5KTnVXQlRSbVg5SG5HL3ps?=
 =?utf-8?B?Ni9LYXY0SHp6ajE3RUpKT0l4NGZNRlJrdUdKSFlDbEwzRXRsc1ZPSHRoWVRT?=
 =?utf-8?B?ZytXbHZrMkJXZGM4NWpJdkhteUpTbzg3VjdGWitaekd0MmtvbGo3TXpmL3c3?=
 =?utf-8?B?VWxvVi9COGQxSkNudDlXbDNGelVldzdYSEtBa0M4bC9kS2t6aVYvU1dmYThM?=
 =?utf-8?Q?8+RnfcWUMqbVvxdHoC2rGFQYu?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 591ef11c-8a5c-4940-8099-08de187f8ea4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 13:15:26.8808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Cqk8Hc4edey1GtYi9XWgm0T8G3u538hNCYJcIX8k3LKAogSz8wgmyODJxTRhRYRo7h7FUzPwTzFlBMLW0icEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7934

On Fri, Oct 31, 2025 at 01:34:55PM +0100, Jan Beulich wrote:
> On 31.10.2025 13:14, Roger Pau Monné wrote:
> > On Fri, Oct 31, 2025 at 12:47:51PM +0100, Jan Beulich wrote:
> >> On 31.10.2025 11:54, Roger Pau Monné wrote:
> >>> On Fri, Oct 31, 2025 at 11:29:44AM +0100, Jan Beulich wrote:
> >>>> On 31.10.2025 11:22, Roger Pau Monné wrote:
> >>>>> On Tue, Oct 28, 2025 at 04:32:17PM +0100, Jan Beulich wrote:
> >>>>>> Both patches also want 'x86/CPU: extend is_forced_cpu_cap()'s "reach"' in
> >>>>>> place.
> >>>>>>
> >>>>>> 1: disable RDSEED on Fam17 model 47 stepping 0
> >>>>>> 2: disable RDSEED on most of Zen5
> >>>>>
> >>>>> For both patches: don't we need to set the feature in the max policy
> >>>>> to allow for incoming migrations of guests that have already seen the
> >>>>> feature?
> >>>>
> >>>> No, such guests should not run on affected hosts (unless overrides are in place),
> >>>> or else they'd face sudden malfunction of RDSEED. If an override was in place on
> >>>> the source host, an override will also need to be put in place on the destination
> >>>> one.
> >>>
> >>> But they may be malfunctioning before already, if started on a
> >>> vulnerable hosts without this fix and having seen RDSEED?
> >>
> >> Yes. But there could also be ones coming from good hosts. Imo ...
> >>
> >>> IMO after this fix is applied you should do pool leveling, at which
> >>> point RDSEED shouldn't be advertised anymore.  Having the feature in
> >>> the max policy allows to evacuate running guests while updating the
> >>> pool.  Otherwise those existing guests would be stuck to run on
> >>> non-updated hosts.
> >>
> >> ... we need to err on the side of caution.
> > 
> > While I understand your concerns, this would cause failures in the
> > upgrade and migration model used by both XCP-ng and XenServer at
> > least, as it could prevent eviction of running VMs to updated hosts.
> > 
> > At a minimum we would need an option to allow the feature to be set on
> > the max policy.
> 
> That's where the 3rd patch comes into play. "cpuid=rdseed" is the respective
> override. Just that it doesn't work correctly without that further patch.

Won't using "cpuid=rdseed" in the Xen command line result in RDSEED
getting exposed in the default policy also, which we want to avoid?

Or am I getting confused on where "cpuid=rdseed" should be used?

> >  Overall I think safety of migration (in this specific
> > regard) should be enforced by the toolstack (or orchestration layer),
> > rather than the hypervisor itself.  The hypervisor can reject
> > incompatible policies, but should leave the rest of the decisions to
> > higher layers as it doesn't have enough knowledge.
> 
> But without rendering guests vulnerable behind the admin's back.

I think that's part of the logic that should be implemented by the
orchestration layer, simply because it has all the data to make an
informed decision.  IMO it won't be behind the admin's back, or else
it's a bug in the higher layer toolstack.

Not putting rdseed in the max policy completely blocks the upgrade
path, even when a toolstack is possibly making the right informed
decisions.

I guess I need to see that 3rd patch.

Thanks, Roger.

