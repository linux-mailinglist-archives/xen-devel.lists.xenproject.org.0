Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8048DA788E8
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 09:39:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935151.1336607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzsfu-0001R7-8z; Wed, 02 Apr 2025 07:38:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935151.1336607; Wed, 02 Apr 2025 07:38:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzsfu-0001PA-5p; Wed, 02 Apr 2025 07:38:14 +0000
Received: by outflank-mailman (input) for mailman id 935151;
 Wed, 02 Apr 2025 07:38:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=trQc=WU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tzsfr-0001P2-Jo
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 07:38:11 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2412::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a303fb4-0f95-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 09:38:07 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DM3PR12MB9389.namprd12.prod.outlook.com (2603:10b6:0:46::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8583.41; Wed, 2 Apr 2025 07:38:03 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8534.045; Wed, 2 Apr 2025
 07:38:03 +0000
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
X-Inumbo-ID: 6a303fb4-0f95-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kpSgeOZXlWi0/AcEeGp/8uX/HbjggVNutRrH+SFnW/yVjaZywmRZ17SeCWZkLWZB6srg1K8Lxozl7A1DeNNOwx5qu9RCU/fQbQfL/gGWqEDU7R4Q32fjiMYFpETQb42PVXsC6npt1YUZK7Xx2pp8xryIg8nqTakV9kEFtr50kisHxE7hCzEdShJx6YzKjjtHmKoNDhApWd1XKw36OWOmBv9DvEj2R+27t3oWohCjLGBNkA2eiMvuUy7u8VXGdzS1U1iIm7Sf21yQJ5H5Czbfejt69DtvrhqgIePjcqEafOF1IJF5UPvmz60UdlupjzNahzy+FByazJNb1DKkl0lurg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/tkTIv1dVYgEVatHX2S6NjEjl8Sxvdc+7KmIpk3lzo=;
 b=eaZ4r04BglBKxRUF0lmTTww2LIbwIp/RJfblGaW76HxoPDs081+3M6KpYSwjze2FcEHyJAj5BR60tjEYGRSqLAEJU4UyyIhfRuUf6F9sI/x1zdA8AtdHT5lb/rwOE7g7tLKVoObwcjMEPtU9QgHtAUBBqn6XguLYxnY0laybogQt9H6X54v0OyPx7sWc1SVwKVcJDwfSOGDEOSiyeurWV/17dsFzauBLyKqKx+8/ExotJamDj9ZXJDs6g0Jpxfodf7cD6ITm8Xmmb6IoAbEO3b8VGV+D5hlQdqVLDHekeqiHdpnGunqTgffRaWa+hXEsssCJwxuZfaxtLSdJxtmS7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/tkTIv1dVYgEVatHX2S6NjEjl8Sxvdc+7KmIpk3lzo=;
 b=W6attACsyhSBHGZRqF4B63vY4lFY1pfqMMr9U9E1jvGuSWwQXrchFd2y1wx2wB+TLv34jAqvV4Veau81R4EeG/bjPYVoBkolmmQXBY3xJSoo+sR2WVbok3btbBd61LB4xDZp2T66N4ACvLFw7rXewuDyJm00qvWbvAjbJgFxiiI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <4d9cc961-020e-42ec-8302-031dd93bb6ed@amd.com>
Date: Wed, 2 Apr 2025 09:38:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Drop process_shm_chosen()
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250401090937.105187-1-michal.orzel@amd.com>
 <3D313BC0-75C9-4208-9067-C1F6153B3859@arm.com>
 <f7a6dd50-28d9-409b-8740-f4433f2fd72e@amd.com>
 <237153F4-56B2-40AD-A2D4-824B621D3477@arm.com>
 <25e30373-139f-4827-91e7-a2dd6e85c433@amd.com>
 <16D32474-F78A-4E50-AA96-BE96D76D95FE@arm.com>
 <f06abd4c-dcf3-4b95-ba37-82b72da1f783@amd.com>
 <12D5AACF-7A89-43A7-A729-0F0D7AE501EB@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <12D5AACF-7A89-43A7-A729-0F0D7AE501EB@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0250.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::12) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DM3PR12MB9389:EE_
X-MS-Office365-Filtering-Correlation-Id: f21f4a02-444f-4b9f-1c4c-08dd71b94cce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dEZFWXBZdWlEYlpsekxuTEhybGRQZlVjYSszR2lCQnR1R1VVbitabHYza3dk?=
 =?utf-8?B?OUpVeU5ZUGpkTjUxc1BrOVpsUjBKSGgvSTVpQXM1Q01yZ0lTN3pFRWhsa3hn?=
 =?utf-8?B?WVdQNGNUQW96SkovUGc1eENXTHlSUjBzTWRWTkhzSld4STlFYjh0eDFWb3ox?=
 =?utf-8?B?QTJvZGFaUGw2dWZLRjVudHBDUm0rUEEwYnJxUlpVeWRkekx6ZTBQUGRUakVH?=
 =?utf-8?B?UTlTRkdJRUFRU3FRRXNCcjhmeXl3MHpqbmlZNG1ESStGOW1ESEYwdGQxNEFn?=
 =?utf-8?B?c09LUFgxcGFvTjBlNE1NU2M0YzdDSHZSelpaK0xuZ3BiSHlqbnUydVJXK29X?=
 =?utf-8?B?US9JWU43MHVHUHR1YlFPTVVQQU5BMEliYmtMZGVOdEJ2d2lGZzMrck5MU3Jw?=
 =?utf-8?B?d0NOcjJ3NDdDUTVGemJ6bEtxNXpJSm1KQjIwSHpNM2ZES2toZzNPUFdnSkJZ?=
 =?utf-8?B?T0ExTDFFNXR2WDlzTm1HckZsQXczbFk3dm44VFcrb1ByeW9YaWZJT3RGSmN1?=
 =?utf-8?B?bi9SQU94WjRPUkFnRThDK2VWMkFWS25jeEFURndSSmVNdmozR0RnNW9EdHIx?=
 =?utf-8?B?SzVMNUpRY2ZUUVZ2SjlwOGdaZE83ZGU0d3lSSnRZT0p4ZFRmYTNLWVF6UHg4?=
 =?utf-8?B?QXZhMnFIZGhhei9QUlhwS00vdmVyYzFuaGl1UUlzQTFqM2hGSmdWTlJSa00z?=
 =?utf-8?B?dlhKbFdQZnY0aVRSSTBTK05Ydm9QdDQwUjUwUWtqbHJqWUlqZEtVaCtQbGhx?=
 =?utf-8?B?cHo4czl6RWYwdWwrNzlaZFN2TDJtbEREeWJXQzFzb0dSeXhsMU9CV1J3Wmhr?=
 =?utf-8?B?aGc3YVN1Uk1TNE4rc05pZGxseG8rWFlJK3MvNTV1RThOM040VEFNWThRR1Jl?=
 =?utf-8?B?TEdGQnBrcU9MZzhZSW5JamEvWVNKUFRMZDQwaVMrMmFQWEY0d3FOSW5hcyt4?=
 =?utf-8?B?U1BLd0pyMXo3Y0JuSUQrL1hIMVlERmUwY1BHSVhrZVNTTExWOVo0VXpQWmtV?=
 =?utf-8?B?N3kyRjY2Y0kwdVVKUG9rb25Sbm4yZHRuaGVXbnRuTTZSbVF4ZkdGcTFzMEN5?=
 =?utf-8?B?VkRsbUsyL2V3YjJqY3NVOFg3ZFAxVHROZzNLb0VoYm1EcVpuRnZ0NmdkVzNo?=
 =?utf-8?B?em9BMWVGU01WQlUvdW9GeDdrWFJEc2RjTGxQcURCQTF0cFZrSlUrb2s1Um9I?=
 =?utf-8?B?cndDS1M1a21DN2l6RjdvN3J5YXlrRnVDbXlrS01nUjR1Q0g4SURTWThQdUdz?=
 =?utf-8?B?SHlDT1JjMUN3TElCdkMwYnp5Yzg3cjROVU9MZENpTkc2bGEvVkYvREdveWcw?=
 =?utf-8?B?MnhuUFdld2RQZ1ZNbWs1b0d2TThicXJPWDVFUm9JUDBHeHhoUTB2NGZLZjRh?=
 =?utf-8?B?bzhNVzNobzJkdlc3eGxTNGtERVhCQVV2Nm1Yd1Y4NDRrY3ZtdFlnbkhPKzNp?=
 =?utf-8?B?Y2ZWb1l6aUdTUWNnazVKSFpvRkpRTjNvV3RXcUJmVEdJdE53TGw4VkhHa0JE?=
 =?utf-8?B?NUhWKzNJNHQrd2FkV0hQSm9Vd2VEeGs1REx0N3l1c2lmRktlZ0JRTHZ2WTFE?=
 =?utf-8?B?a25mK0hWUzhGNWk2R1l6OCtpM2E5bFhzR2hMMTlZamFBQSt1cXB1ZnhtL3VV?=
 =?utf-8?B?d2VPUUd4eSthcDU5U2ZFZFZRWm9WOXEvOWZPRDJsenRJblk0TTlTc1hSeVNl?=
 =?utf-8?B?aC9FTEJvNTRQQU4ycUtpMndNTm5yeEtMWkYyZjNyN1VZRWZNZEwwTmN6R2ZU?=
 =?utf-8?B?eWRBSGhQMXcwZWxwQU54MXJwQ0ZyaVNOUmZSUGFSU1BFUnRMVUkzMGpjK1pY?=
 =?utf-8?B?b09KREdKYms2NXM1eDgvd0V1b3VJUWdoRVgzRDI0Yzg2Y0dtWVo1cXdJUzVB?=
 =?utf-8?Q?R3BID2arsUlzG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RURoR2I5QlBRNzFxN2diM3F5M2syRG5JeUNnT0t0SSt2WElRMGZnWUtvOEtu?=
 =?utf-8?B?OWw1emIxYnQ5L1gwYUEwWU5rUzRzK2R4aGYxdmY1Q0dRd0haYVZQR1lGTDR0?=
 =?utf-8?B?TnZwN0lYc0kwbkorZWhUMTlGSWlwSDhmZElwUXBtYzlwOVhaNUdBdkwyNEdV?=
 =?utf-8?B?MjNjQ2tEQWM5ellKMWNRaHNib0pUdW9wSlVpdFhtS2dMSTAwZmF4VndpbXI0?=
 =?utf-8?B?Vy9ib3h5ZEIzN2o2R0NjVjJ2RWRSMnhxVUQva0RvWm5JcGF1TWFPMkgyblpI?=
 =?utf-8?B?cStNOUtlRVY4UWN5dk1mV0JpaXMxZCtleTk3VElmOHdwVVQ4THBXR0NsNE1z?=
 =?utf-8?B?d2lPNWVqejJVbDhodmlhQnBOSmdPclJaTkNxVlhVREdXVGFQaWN1bTFiTE1r?=
 =?utf-8?B?T3V6V1dsR2xpUFMxUVZGZ0JFb2JGajh6TWFwSnRuNituNTRFZjJMVTJkTmFD?=
 =?utf-8?B?MDZGdzJPc3MxWGpLQ3VtazVPaklzZlI5a0dpeUZud1JWVDdhS2hYOFVyMjBO?=
 =?utf-8?B?Y1pmUGJRQlVGdml4aGFQbHdEQUNaL0gzTHp5SFFCbER2TUcxemlVRnk2RCtW?=
 =?utf-8?B?clJaZmxWNnY1c083dHlJNmY2REswNTRDZ1R4aG9MZys1Wk1vN0U0aXdIbFVT?=
 =?utf-8?B?THJYb3E5dDhZTWdkd1JiMEtIL2lYVmE5bitycG9BbGhVRVlKODlnZ0VvOHZM?=
 =?utf-8?B?R3dvM2htWjExZ3ZkZkRjYmZGYWpvUlYxK0lTbFpEeVJyQU55UmJQeUNnNDNo?=
 =?utf-8?B?QkFvdk9kVU5CbkV3RVdBSHIrZUVXN29nVDBXL2MweGMzYXR0SDNmUE42dzls?=
 =?utf-8?B?SEJvUXlJbnVWdmxVVnU3WC9HdEpwL1lMODU1T0lUSFJQM29Uc2RaTGxnMGdo?=
 =?utf-8?B?cXdiNTJJMEE0NWlVTHJjekFZdUc4MG5FdUoxaU5JV2JoT2UyT0VPMXFDT2dY?=
 =?utf-8?B?UThZdXYyKzJiWHp1ZlNYM1VSSGo0WWlFVTFsTHp5Nk1KOGo2WDAzbXlXQlFN?=
 =?utf-8?B?TThyVVlIdEp4QU5aZUFXcWtZWDB6ZmhMOGpZSGxrK00rQmRVNkE2aEJLZlds?=
 =?utf-8?B?aHcvL0x2NEYwR1JmL2VYejltUTNsd2ZhNC9ZN0d1cGdvcHI1MVg3anhENDkz?=
 =?utf-8?B?ckp3eW1yNnQ1M1QxcHZUTnRSOUNwQkZnYlVLTFZlWDg4ZjVuQWwxSmVBMWxm?=
 =?utf-8?B?bSt6SGxmeVZTOVdZV3BvUDFOb2xCVjN2S3BtVXRMUnhVQ0RwTm5nY0hzUUFp?=
 =?utf-8?B?eVpaMHhCMWxZNDEzNXNEeUxRRnV1ZjhDY09aV0tTdWdBWWkydk1rWmdrK3l2?=
 =?utf-8?B?OElLVkZ5YUQveTl2VmRSRDZhbzJlM292eGpsZVhoV01SWDFVNFY1d2V2MDZm?=
 =?utf-8?B?VmlEaGxJS29NeWRQZEJRZ2hsYmlUd2d2UVBRNFg5eEdtY2dyZGxvTDNiRm13?=
 =?utf-8?B?UFhYa3MxcHZFWEpiUWNidXFVMG1LRy9mS0FlUXZ5TEZOS245Ym96Rld3VlFJ?=
 =?utf-8?B?ditSTWdSK3VBQ3dGYmZTYlNaSU04WlQ3Qkl6N29KTWFRbnFSbXBoeVY0VVZu?=
 =?utf-8?B?eEpKSmNyNmM5Vm9GaEpKTFAwUU9pZEE5RWxZZEdyWkFEOHFyeTlhOFdwbllD?=
 =?utf-8?B?UWhhSHEyUVBwL1dEUW9hK3NpemR4MHV2U2dSZnlQWmxTR0c2L2l3WkEwRHRJ?=
 =?utf-8?B?M284ZSs1a0I2cncyNy9EbEhocWFSMFZlZHpFdnBSVnZDTjFGdXRVcGhGODJE?=
 =?utf-8?B?dnNQK2JWZVRmNDRUNlRTWUFWZlFVQU11MVpNSzBPRGJWU1JmcUtncXZDalJv?=
 =?utf-8?B?WC83UjZDbGdrT3JVTno0QkFYMXcvV1NhMkN3SDVkTGxmamZmR1I1NDQ2ZzlV?=
 =?utf-8?B?RkVIUW5PeGtNVGZRdDRxODFkWFIreHpWeVNyVzV3RVVCaFluYnRDSlpyaGlM?=
 =?utf-8?B?T0FiQlFKc2FUdTJEdlI3bnUxclpVOTNjR04xcmdqeVNRaDlwaTI5R2pWMmo5?=
 =?utf-8?B?NWZ6dEtEQkxlcjJCUklxczNUNkZOYXB2OXdCTFVjdndxamg4VTdwWk4yM0R5?=
 =?utf-8?B?cVdhNkZTR3V2S3JnTVpnQS84eGFDZ3lBbmdncFFyb0I0bkpsMlQxUWFXUXEy?=
 =?utf-8?Q?llAfoDr5wp2QVSYgkQR+DUzi8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f21f4a02-444f-4b9f-1c4c-08dd71b94cce
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 07:38:03.0318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ZE6qx50XTP8aGRER959kkt1GwFlabkz9wjnIwDnOPaJ35yQR2lPKhMDhvtj6PZU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9389



On 02/04/2025 08:18, Bertrand Marquis wrote:
> 
> 
> Hi Michal,
> 
>> On 1 Apr 2025, at 18:42, Orzel, Michal <Michal.Orzel@amd.com> wrote:
>>
>>
>>
>> On 01/04/2025 17:53, Bertrand Marquis wrote:
>>>
>>>
>>> Hi Michal,
>>>
>>>> On 1 Apr 2025, at 17:21, Orzel, Michal <michal.orzel@amd.com> wrote:
>>>>
>>>>
>>>>
>>>> On 01/04/2025 16:49, Bertrand Marquis wrote:
>>>>>
>>>>>
>>>>> Hi,
>>>>>
>>>>>> On 1 Apr 2025, at 16:22, Orzel, Michal <Michal.Orzel@amd.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 01/04/2025 14:57, Bertrand Marquis wrote:
>>>>>>>
>>>>>>>
>>>>>>> Hi Michal,
>>>>>>>
>>>>>>>> On 1 Apr 2025, at 11:09, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>>>>>
>>>>>>>> There's no benefit in having process_shm_chosen() next to process_shm().
>>>>>>>> The former is just a helper to pass "/chosen" node to the latter for
>>>>>>>> hwdom case. Drop process_shm_chosen() and instead use process_shm()
>>>>>>>> passing NULL as node parameter, which will result in searching for and
>>>>>>>> using /chosen to find shm node (the DT full path search is done in
>>>>>>>> process_shm() to avoid expensive lookup if !CONFIG_STATIC_SHM). This
>>>>>>>> will simplify future handling of hw/control domain separation.
>>>>>>>>
>>>>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>>>>> ---
>>>>>>>> xen/arch/arm/domain_build.c             |  2 +-
>>>>>>>> xen/arch/arm/include/asm/static-shmem.h | 14 --------------
>>>>>>>> xen/arch/arm/static-shmem.c             |  4 ++++
>>>>>>>> 3 files changed, 5 insertions(+), 15 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>>>>>>> index 2b5b4331834f..7f9e17e1de4d 100644
>>>>>>>> --- a/xen/arch/arm/domain_build.c
>>>>>>>> +++ b/xen/arch/arm/domain_build.c
>>>>>>>> @@ -2325,7 +2325,7 @@ int __init construct_hwdom(struct kernel_info *kinfo)
>>>>>>>>  else
>>>>>>>>      allocate_memory(d, kinfo);
>>>>>>>>
>>>>>>>> -    rc = process_shm_chosen(d, kinfo);
>>>>>>>> +    rc = process_shm(d, kinfo, NULL);
>>>>>>>>  if ( rc < 0 )
>>>>>>>>      return rc;
>>>>>>>>
>>>>>>>> diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
>>>>>>>> index fd0867c4f26b..94eaa9d500f9 100644
>>>>>>>> --- a/xen/arch/arm/include/asm/static-shmem.h
>>>>>>>> +++ b/xen/arch/arm/include/asm/static-shmem.h
>>>>>>>> @@ -18,14 +18,6 @@ int make_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
>>>>>>>> int process_shm(struct domain *d, struct kernel_info *kinfo,
>>>>>>>>              const struct dt_device_node *node);
>>>>>>>>
>>>>>>>> -static inline int process_shm_chosen(struct domain *d,
>>>>>>>> -                                     struct kernel_info *kinfo)
>>>>>>>> -{
>>>>>>>> -    const struct dt_device_node *node = dt_find_node_by_path("/chosen");
>>>>>>>> -
>>>>>>>> -    return process_shm(d, kinfo, node);
>>>>>>>> -}
>>>>>>>> -
>>>>>>>> int process_shm_node(const void *fdt, int node, uint32_t address_cells,
>>>>>>>>                   uint32_t size_cells);
>>>>>>>>
>>>>>>>> @@ -74,12 +66,6 @@ static inline int process_shm(struct domain *d, struct kernel_info *kinfo,
>>>>>>>>  return 0;
>>>>>>>> }
>>>>>>>>
>>>>>>>> -static inline int process_shm_chosen(struct domain *d,
>>>>>>>> -                                     struct kernel_info *kinfo)
>>>>>>>> -{
>>>>>>>> -    return 0;
>>>>>>>> -}
>>>>>>>> -
>>>>>>>> static inline void init_sharedmem_pages(void) {};
>>>>>>>>
>>>>>>>> static inline int remove_shm_from_rangeset(const struct kernel_info *kinfo,
>>>>>>>> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
>>>>>>>> index c74fa13d4847..cda90105923d 100644
>>>>>>>> --- a/xen/arch/arm/static-shmem.c
>>>>>>>> +++ b/xen/arch/arm/static-shmem.c
>>>>>>>> @@ -297,6 +297,10 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>>>>>>>> {
>>>>>>>>  struct dt_device_node *shm_node;
>>>>>>>>
>>>>>>>> +    /* Hwdom case - shm node under /chosen */
>>>>>>>> +    if ( !node )
>>>>>>>> +        node = dt_find_node_by_path("/chosen");
>>>>>>>> +
>>>>>>>
>>>>>>> I would have 2 questions here:
>>>>>>> - what if a NULL pointer is passed, wouldn't you wrongly look in the main device tree ?
>>>>>> Do you mean from hwdom or domU path? In the former it is expected. In the latter
>>>>>> it would be a bug given that there are several dozens of things that operate on
>>>>>> this node being a /chosen/domU@X node before we pass node to process_shm().
>>>>>>
>>>>>>> - isn't there a NULL case to be handled if dt_find_node_by_path does not find a result ?
>>>>>> It wasn't validated before this change. It would be catched in early boot code
>>>>>> so no worries.
>>>>>
>>>>> Then an ASSERT on NULL would be good.
>>>> See below.
>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>>> Couldn't the condition also check for the domain to be the hwdom ?
>>>>>> I could although we have so many /chosen and hwdom asserts in the tree in the
>>>>>> dom0 creation that I find it not necessary.
>>>>>
>>>>> There are never to many asserts but ok :-)
>>>>>
>>>>> With an ASSERT added for the NULL case you can add my R-b.
>>>> :(
>>>> So you still want to put ASSERT for a case where host DT does not have /chosen
>>>> node. I'd like to talk you to drop this idea. Normally I'm in favor of using
>>>> ASSERTs but not for so obvious violations like missing /chosen.
>>>
>>> I am not quite sure why you do not want an assert here.
>>> Reading the code the first that comes to mind is "what if this is still NULL after"
>>> which would be clearly something no expected if someone sees an assert.
>>>
>>> Seeing the place where it is, that would not impact performance in any way.
>>> So why not adding it ?
>>>
>>>>
>>>> /chosen node is so crucial for Xen on Arm functioning that a lot of things would
>>>> simply fail a lot  earlier than a point where we call process_shm() at the end
>>>> (almost) of hwdom creation. There would be no modules, so the first example that
>>>> comes to my head is panic due to no kernel which happens way before process_shm().
>>>>
>>>
>>> Sure you might be right, what if something bypass this due to efi boot or acpi boot and the
>>> code comes down here ?
>>>
>>> Even it might be true now, this would make sure that no change in the code is changing this.
>>>
>>> Anyway i will not argue on that for to long as it is kind of a matter of taste.
>>>
>>> So feel free to put my acked-by without the assert.
>> You gave me a reason to scan the code and I realized that in ACPI case, if
>> STATIC_SHM is enabled, it triggers a bug in process_shm_chosen. So, you were
>> right and we found a latent bug that is not related to this series. But maybe it
>> would want to be handled as separate fix before the process_shm_chosen drop?
> 
> Nice at least this was useful, and it also means that there are never to much asserts :-)
> 
> I would suggest to resubmit this patch on top of an other one fixing the latent issue to
> make sure everything is merged in the right order but it is up to you as you will probably
> be the one commiting both patches anyway.
Actually, I was a little bit imprecise. We don't need any ASSERT and my above
reasoning holds true. The problem I found is that when booting with ACPI we
don't protect call to process_shm_chosen with acpi_enabled like we do for cases
relying on DT. With ACPI enabled, we don't unflatten the host dt and host_dt is
always NULL, so it does not matter whether the host DT has or does not have
/chosen node. So we need the following fix I plan to submit separately later on
today:

-    rc = process_shm_chosen(d, kinfo);
-    if ( rc < 0 )
-        return rc;
+    if ( acpi_disabled )
+    {
+        rc = process_shm_chosen(d, kinfo);
+        if ( rc < 0 )
+            return rc;
+    }

~Michal



