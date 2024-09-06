Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5855096F4E1
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 15:00:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791813.1201823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smYZF-0002wJ-8u; Fri, 06 Sep 2024 13:00:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791813.1201823; Fri, 06 Sep 2024 13:00:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smYZF-0002u3-5T; Fri, 06 Sep 2024 13:00:01 +0000
Received: by outflank-mailman (input) for mailman id 791813;
 Fri, 06 Sep 2024 12:59:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MdYt=QE=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1smYZD-0002tx-Oq
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 12:59:59 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20609.outbound.protection.outlook.com
 [2a01:111:f403:2407::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb036574-6c4f-11ef-a0b4-8be0dac302b0;
 Fri, 06 Sep 2024 14:59:58 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SN7PR12MB8103.namprd12.prod.outlook.com (2603:10b6:806:355::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 12:59:53 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 12:59:53 +0000
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
X-Inumbo-ID: eb036574-6c4f-11ef-a0b4-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sdO8mmoeAZhzghNMFwE7IFLd7i866I5GWDHbTlSu33l021le9VLIG9BzTb5SXbeTcNFat8b/zMIujKysUBUQ03TF+2DyygND2h7aqoTAQghJ7zIUMcyvFLwJEw+OT4riLcitMuAyze+6PpnvceWSvRGgOeHnvjGGhGZEFjNjFWaRY+aBYGG/+5FvYSZMFKC3bsgBUls7G/maYiR1JRravc4StvF+cJGY/JcNt6XLvU0zEPgVwtTWMS9XjeeXIJvq4b90UFZAvN9FkjZkeVtedaHXiBolrpk/tTJ9/0ZvOLn1ZAMcaZQUPJOK0qvlFgF4p8BCPZs3lNMWnoPPIXPnGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewwe7E7w2q4tL728ze36DY9Z1TMdfBguie6Bji7Tdy8=;
 b=xfjAjGsLAcWKY+pgGIHCQpbGKwLX1CeiKpjTkY9ul48fPy9vdb4ycER2YmksHKENGTAi2ccJ8IZZBpr7vurKMR909nm1Fs3ApxYSQo88dhSan7N89Slj28sxNiog07B5f0R59KEV+4l1AgNFSwcvuGrThQZHJvbuXrRvlY4sM20o5Vb8XpMOF4KBrtAiouHtcnyKJ5vUz0rFhfD+qMxxfspatLS90McWXWTz8z3ixjkRgE9c76ZDpPgrMFFY/D7Kt/cfMihtdognDjCLex8sjQ9mTptxLOjDWJQ9arpttWYZCp4e5bKzQMwTTQJh1ap1ssgXQoplsjElnvur1UClZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewwe7E7w2q4tL728ze36DY9Z1TMdfBguie6Bji7Tdy8=;
 b=VDVY/UwfvMPZLVnsAtF7xoSZ2UBVfSRL2ZZWTZZSXkMgom4Zsokpc0KINdKMVH1L1gB/iscG2xY4Hi7NH299nb7Ej0zxWjdAj2eimRY0DkWinK0uTZLrJ7c4I7lNocORdHrdVxDjJh37vNmGQ53iDsNoHZjfKSVZuCHEcM8taDM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <c4e43935-4fe4-4463-a7dc-3cb087b51d9a@amd.com>
Date: Fri, 6 Sep 2024 13:59:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] xen/arm: mpu: Create boot-time MPU protection
 regions
From: Ayan Kumar Halder <ayankuma@amd.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
 <20240823163127.3443404-4-ayan.kumar.halder@amd.com>
 <f14c6fb3-0ab6-49e6-b0f1-622802a599f0@xen.org>
 <3819109b-de48-480b-b548-a5d9f45a541f@amd.com>
 <C845B4EB-2CF8-4B37-9507-4D575FC88AE2@arm.com>
 <d55f3b60-3dad-40c6-a625-b261225aebbd@amd.com>
Content-Language: en-GB
In-Reply-To: <d55f3b60-3dad-40c6-a625-b261225aebbd@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::19) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SN7PR12MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: b6cd8571-a68e-42d2-f66d-08dcce73cc84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0xveEFicmRxY2RaRk05MnJUb2hGZStuTU5GbktkVm80OThjbFZOS0dzTTNz?=
 =?utf-8?B?U3k5SzhYVUtRc05oY2ZVYmJhY1pVeVdXejFraHFPOE91alh0bFhnMm8zSmtS?=
 =?utf-8?B?QUoza083SUU1YVV4UFZKSDZMY2x1SXpNVzNMMTRyUlhzb2s2UXFuSjNURWc2?=
 =?utf-8?B?RzBpZXViNUNBWWNBQnRtNVA2Z20rSkJpbGtNakdKMkZhTkFqd3hSMFFuYkhJ?=
 =?utf-8?B?am9YR1BzTWFoYmk0clBLZVVuV3FCU3JwVXNxK09FbGswSnhYbGNURklNSWF0?=
 =?utf-8?B?aFVidXZYcENQNkNtcHJyVkxGMmU0d2d1cFJTMi9ZY2xGUlJFZnlobXU5S01Y?=
 =?utf-8?B?N01SOVoyQXZURVVSdjZ3c0pnYXB3cUJWZ1ppc01nM0N0YlVLVm5na04yVk1Y?=
 =?utf-8?B?YlFESEMxa0lGYlVBclR0M0lWRTBWVWlHNjZVdlNVVTk1MUJGeG83WjBUL2lX?=
 =?utf-8?B?M2xoQlZiNXd3SEN5Ynk2RDBTK3c4eTB2U3JKZnNTcExoaUU0SmR3a3czRUN3?=
 =?utf-8?B?VlJOZWI4a0N4YTBscGJYWmR1VzNxVHgwdlNWWk55OWYvck5LVFpWOGNFblBh?=
 =?utf-8?B?TmhDRCt6Q3VMTUZKY3BQQ1EzMFJtQ292ZWZLcGY4VmIwMXk5Ym1ON04vOE5D?=
 =?utf-8?B?WWFIbzlIVHZKTVQrL1d2VldVVERZRjMxU0hCV1pCNzlsMjZ2b29VbUlQQmhx?=
 =?utf-8?B?cjdjWExXanlKOTRUY2FVMzNLVVdWa2NXWE01bEpUVXZqck5yRmlNZFdMQjA2?=
 =?utf-8?B?WnNmcVJWNzFNTGdwQmg0bCs3U0dRZHVvN0p2YjU5RmxWOE9yTG05aTZBbFJj?=
 =?utf-8?B?L2J5RzNGYU44T0xCUTdVS25uWTVKWlNHMzBzWlBzb0JEYmd6aFFjSmM0TmtF?=
 =?utf-8?B?TW10T3J4MWxiMllTRVFKUFVITDgyS3NNTGZJNDZ0Y2JVdXBJMEdDZlczdEVO?=
 =?utf-8?B?SFMveXRSYmRtUGZLTlYzbmMwNFoweGNhY3NsVithSmUwZjI0V0VCZWduR3ZV?=
 =?utf-8?B?eVpYS2ViSVBxcmcrUDVGeXR0Uk5NQUNEdkdEdWp0T0QxaG83SHptUCtnRVl1?=
 =?utf-8?B?ZGUyM3BiRUZQYW5Cc0F6RThxencxN2VjRkJ3enJQb1hoK0wrZ3ZIdTRYTGZG?=
 =?utf-8?B?UHFrRUtncUZtNmVXSjc0KzVzZlRua0t1TTUzZWRyUm5NdThRbjJnRndNMjhE?=
 =?utf-8?B?RTdxem1LdHpJOFNkaitnZnJUb1ZKbFRPcTBoMndMUDhSd2F5eWdOYmtMQ3h6?=
 =?utf-8?B?NDgrdjlmUlBlME5ENTkyQzJ3ZHhtUmp4ZXg5a0VUOHlhekxiUTVHQm45QmQ0?=
 =?utf-8?B?eUNoUHdKdVNXaGFrbEhqNit1bFhvYS9KZUtaNkQxaStpVU5XYTZnQVhBL3lM?=
 =?utf-8?B?Qnk0TmxLbXMrTGlXUVUyMEl0YXJmQ2tPY1ZhVEtnMXpCM2wvM3FOZk5FQlJ3?=
 =?utf-8?B?M3hJSjVKMHk3MThnLzdScmx0bE9SNUFxWktyT3huak1ncWlGVmFmME5hZ1Ja?=
 =?utf-8?B?clhWMXBOSTFmZUJBaUZ3RG4wNGpUeEY3aEJMVmtJUys3RjFMNHZOQkdYeXFG?=
 =?utf-8?B?b29sOXZNZFlFRGR4K3pyN29uTnI1c3l4MUFZOWZBbmNWeXV4ZFJOdzRGTzha?=
 =?utf-8?B?eXZVNiswUDZMbU5NSlkyRWVreDQzREk1VlZCallDQnhyMCtoVUwwZU5JaG5x?=
 =?utf-8?B?KzR4T3FGTUdtNm5XbG02L0QrNTFWWTFoSDZUTWJpRkRzN2E3QTFtTncxR0pO?=
 =?utf-8?B?dzRQdUFDV28wWUhjcHBLcmE3TWJCR1MzS29kSU0zcTUzZWw2TVdJR2wzUSs0?=
 =?utf-8?Q?g/7ZtjJNkzmLQSnyV2e9QKh9cbtK8ax7z+Jz0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmM4VS95OCswR3VDbzNGTkY2dkFHU1pYbU9jSzRZa0xKeGNoUXg3Y2VJNWhz?=
 =?utf-8?B?OEpkOEplVzBwOFdVRlUra05IQTdtSko3L0tPQVZuRTJjMVpiRWwzK1IveTlm?=
 =?utf-8?B?TThoZWVTYmNiTURycG4vSU1iTVQrL1dORGc4MStRTDdaQ1BMOE1BUHNNZ0N0?=
 =?utf-8?B?RFJmLy9ncEZWMTduTlJCZ29RNk8zMDZvc3hkUDdseEtzNHd5bll5N25QekMy?=
 =?utf-8?B?bTNuY3ZoTjhDMEc3elArWW95dmtIY01ROExqdzE3YW10OG9UWlpydHdQMG91?=
 =?utf-8?B?WWsrVjc5WFZqamhZMldpUm9zaWJNOW55ZXMvVHNFQkxZYzAzR09ORUNoTHdV?=
 =?utf-8?B?TlhjMGRnN0pxWXFPalQvcjdkK2RuMUZyVWJLYzZobWIrQnhKM0paSm14elR1?=
 =?utf-8?B?a3A2VlJuc3YvNDlibGRIUjNwSnBWbzdqWXRwcTRvVEI3SUlZVGFFOUhRS3hi?=
 =?utf-8?B?UE11VyszMXNIcFJNdm1lU1plNVhzQSs1eWRlWURvWGo4OVl6ZFVhNGhpZVBl?=
 =?utf-8?B?bGYvOG5kVnZ1SzE5bU8zSlpTMFVYRHZkYUd6M0p0bStpKzY3RHhtRjZHK3d2?=
 =?utf-8?B?eE5GT3JFajRmVzRUbS9yeldXSFJMeDFQaldHMVpBaklWVEl4WkZWQmFrbHBx?=
 =?utf-8?B?SEV2Q0czcnl6a3NNd3dma2NTOXBBbDVPVE9Pa0xSRVU5YjgrRDMza1ZrWE1w?=
 =?utf-8?B?TGk5WE5NL3l3MXZ2UWRYdVBibkkrdkNYK3hPNE9UUVluTEN6WElwQ3NJeUZ3?=
 =?utf-8?B?SXRRVFo4NWNwa2xnNlgrSmMzeFh5ZTNac3pRQWdVbHhMcWdGQ3JwRzNjZUp5?=
 =?utf-8?B?ZkRHeThDeC9OMW1DR3E4NmtVSDFyck9QU3RwTHZlcGZObk03aWFVTExpTXdh?=
 =?utf-8?B?RWl6OHp6Z09KTlVyYjVaWEJZci9SSDlUcVQvZXZuSEhzOUY2SmpMUTRFZzBp?=
 =?utf-8?B?Sm5MOER5VUdpdGM2WDhxdGF0VzlIVGxGSXhzK1lIZHlEZ1RZdWdMVFExV0Vo?=
 =?utf-8?B?dm1qVm1aemdTZ1ovZkZkK2V3eVJNK20zc3FqM0hQTklwVkE1dnJWTmxqZE9o?=
 =?utf-8?B?RzhOS1Q2YXNiWjFYUTNuZjBQVGQwQS9jZkZHZzZoeDhZNkUxL0ZkT1pXTjlY?=
 =?utf-8?B?TUdhK2Uxa2VPWm1TVXNzRUFhWXAzdkpqZ3c0K1ZqNGlaM1ZIdnZPZ2lXRS9j?=
 =?utf-8?B?WGthRVhQRzNISmxocm5BTS9QblUyNk56clptTTZVUVhmNVBlZEpwL1V1eHpI?=
 =?utf-8?B?QjJteVVSbzJ5RWZFckQ0OUJQZnNmdFQ2dm5sek5rUDZvQ244M3E0bUY0L2d4?=
 =?utf-8?B?VnJUNHROT0tLemVxait3c0QyazN6R1JiREk1VGUwcFY5WUl6ZVlQV1duSlpx?=
 =?utf-8?B?elpQWU9NZFJzSFZsa2NubUxIVThGNTh4Qm5UY2ttWS84cVBGSFlaT1JyZWFC?=
 =?utf-8?B?TlcwZ0F4QUd3SEtCNmRJSE5oT2xXMVZzMXlKYzk4bGgzN1JBZWIxQmp6K0Rm?=
 =?utf-8?B?VW9RelBBUFkzY3hhbHM4S3pjTFk3Y3FadU1pRmtqeHlla2RGODJHNVEySFVL?=
 =?utf-8?B?ekpxbnlQeURLV3pmbXgzM0tZS2NCRUpKZUMzeGxZK0VsTVY5bnZpWTJsUTBV?=
 =?utf-8?B?Q2ZOR0JaV0FXSk5wUGJtTmVBM0pQa2M0Q3ZySFZiVEtSSloxTlVoVnR3dHVG?=
 =?utf-8?B?ZTBZRk45MjVUSHZkUXltdXNPODZVb1dPdjFmVExqRDNHQmVIdHQzRnJGREo0?=
 =?utf-8?B?Umk4Qkt0aklkRHk0cjRnemkveUprcHd4QkVHZDZ4aDBwY1NUbDNBQ0RmaGVU?=
 =?utf-8?B?amtveE1mRlM1SUlxSXE0WmJKUEh5T1ZTWnJCdlNPcnhYVXZaRXU1RUhIdFlm?=
 =?utf-8?B?WTVHMHc2MElGL212QXJHVGJnOFJyTVBicEx6WlJ1dkNFRVY0a2FTMHRtOUhl?=
 =?utf-8?B?bzFha01pVVVDYVVSL2t3RW8wM0NuV0IxVGtNUDN6UURvaEZhRTBwZ2g5OVRC?=
 =?utf-8?B?amRYZzVsTkFsNG5uVzFOaFpDOUdJRXhQa3p3b05TSXc5cnl3algzVHFySm9D?=
 =?utf-8?B?ZGthTDlDVDhSQUY2ZTdZZFRNdWZGNjJZM1ZNZVpLcUdVdEhhYzQwUlJ0WS8y?=
 =?utf-8?Q?b4MsKLwgIKlkOHX2npGf8h4Op?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6cd8571-a68e-42d2-f66d-08dcce73cc84
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 12:59:53.0316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RpL1W2p8JFP/D8wrRHkEpzBt7/xeXkc7hCA4sOEU1cQLcIfYcZE+INzi0DjH3PHBMN2i+S1BgZi2Om1h+AdzIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8103

Hi Julien/Luca/all,

On 04/09/2024 19:38, Ayan Kumar Halder wrote:
>
> On 04/09/2024 19:14, Luca Fancellu wrote:
>> Hi Ayan,
> Hi Luca,
>>
>> Apologies but I can’t do a full review yet,
> No worries. :)
>>
>>
>>>>> +
>>>>> +/* MPU normal memory attributes. */
>>>>> +#define PRBAR_NORMAL_MEM        0x30    /* SH=11 AP=00 XN=00 */
>>>>> +#define PRLAR_NORMAL_MEM        0x0f    /* NS=0 ATTR=111 EN=1 */
>>>>> +
>>>>> +.macro write_pr, sel, prbar, prlar
>>>>> +    msr   PRSELR_EL2, \sel
>>>>> +    dsb   sy
>>>> I am not sure I understand why this is a dsb rather than isb. Can 
>>>> you clarify?
>>> ISB is not needed here as the memory protection hasn't been 
>>> activated yet. The above instruction just selects the memory region 
>>> and the below two instructions sets the base address and limit for 
>>> that memory region. After the three instructions, we need an ISB so 
>>> that the memory protection takes into affect for further instruction 
>>> fetches.
>>>
>>> However, a DSB is needed here as the below two instructions depend 
>>> on this. So, we definitely want this instruction to complete.
>>>
>>> Further, refer to the note in ARM DDI 0600A.d ID120821, C1.7.1 
>>> "Protection region attributes"
>>>
>>> 0.
>>>
>>>    ```Writes to MPU registers are only guaranteed to be visible
>>>    following a Context synchronization event and DSB operation.```
>>>
>>> Thus, I infer that DSB is necessary here.
>> I think this was a mistake from the author of this patch, in my 
>> opinion there should be an ISB
>> after setting PRSELR_ELx, to enforce a synchronisation before writing 
>> PR{B,L}AR_ELx which
>> depends on the value written on PRSELR.
>
> That synchronisation is enforced by DSB.
>
> From 
> https://developer.arm.com/documentation/dui0489/c/arm-and-thumb-instructions/miscellaneous-instructions/dmb--dsb--and-isb 
> ,
>
> ```Data Synchronization Barrier acts as a special kind of memory 
> barrier. No instruction in program order after this instruction 
> executes until this instruction completes.
>
> ...
>
> Instruction Synchronization Barrier flushes the pipeline in the 
> processor, ```
>
>
> Why should we flush the instruction pipeline after setting PRSELR_ELx 
> ? It does not have any impact on instruction fetch.

After the discussion on matrix, I agree that we need an 'isb' here to 
ensure that there is no instruction reordering.

Thanks for the explanation.

- Ayan


