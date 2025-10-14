Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F3EBDA1A1
	for <lists+xen-devel@lfdr.de>; Tue, 14 Oct 2025 16:43:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142876.1476785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8gFT-0004g1-Rp; Tue, 14 Oct 2025 14:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142876.1476785; Tue, 14 Oct 2025 14:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8gFT-0004eG-OC; Tue, 14 Oct 2025 14:43:35 +0000
Received: by outflank-mailman (input) for mailman id 1142876;
 Tue, 14 Oct 2025 14:43:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BBX0=4X=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v8gFS-0004eA-AL
 for xen-devel@lists.xenproject.org; Tue, 14 Oct 2025 14:43:34 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 286d0b27-a90c-11f0-9d15-b5c5bf9af7f9;
 Tue, 14 Oct 2025 16:43:33 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU4PR03MB10791.eurprd03.prod.outlook.com (2603:10a6:10:58f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 14:43:30 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 14:43:30 +0000
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
X-Inumbo-ID: 286d0b27-a90c-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svmKe0Dfrhbk24Mdf3bGrhFwIOHHvVgiLGuVhVK3ph3/R7c8LOf/w97KrnjWCQmBC0LNgce6Eu+ECB5PsTh78iwLgR+mjd4kw8tuLKgs1bQU7ok+8QeUrnwLWnWnxajDmLGVw/NRedSVKb3ciBTeILI7/POK1MIQFLrVNWLtdUzD1cJ4rSMvwyHU3xl/P/Ajak+6gkjCdHQAR7aWmT6QByUgbX3QmpJ5GuzX9Y+hIhQw/edvBQMzqr55wYZVWx/qLejMViHovz/gUClQXNX7EfTxFnIIUNrMqC2uGDrgGkby0R9roonqPNkId/kf+hzY6NOqV60NyyRtKJTQ950qdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSrHZPf0tKpXSdCdcpC8jQTuJB+SxH9wm/btlsUABmk=;
 b=fUYo+zEYtVfKRPau18Q/IzpnYm7yqSMvtkVx9z7+EefKoRQKbIoWMmg0NP2jim//46RizDSp5PtMxcrSciTYC+v8GXpwA4ASepdInHCquNQ8DUCS+f4Bf6evAe0VHZdOUIEttNvp9KhdrQ4rkF8VW6u7sVSzVrGmmVveRQU+70kft0q5RSKVlG7V9TicVg4PiT4jkaytHypCEhLaX32MYU4QewXOqsphgvMSVQ6LUKUx/SIqusS1OODALh2Le7/5kVqeF0uvkRT3GPbkdz4w8kr47trUaUqjQ/6BXztuqH0HG0JVUZo2GTajwGcrcOeR5H9K4yHJrPoJ5vA5PAYN/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSrHZPf0tKpXSdCdcpC8jQTuJB+SxH9wm/btlsUABmk=;
 b=ujeE03DZMIV+E5gLblpwl4rmgnRjvTrLOF3xZX3sL7p2M3CZCw3qMG99b8JuUVoTCvJIYigAujgAOAh0gbq2T9PrH/qFS8EYJ54WaPq/4LiLfnZcX1XYkEXtwKyICPAfZR79AlMvzFa9NNar77vSb4tUpwcvtAHeiHWjwA1ciYPaU/Rics66VUgIvkZnc7ufbdXW75L53GysqiOVF8xYb9fyR/mqZmLjX3mDrGbcMkv8YltkXJos5/1H8peYt613clY55Lk6Uk9Wy6CC4s4spAfzmbUEIiMkQxjoJTYs6XhMaClRMoVTFWyUcWaHd14Zn5TJvbLTf2sW/xlknFdGGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <771bec29-2667-43d7-a61f-2373f2fc5570@epam.com>
Date: Tue, 14 Oct 2025 17:43:29 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/28] xen/mem_sharing: wrap
 hvm_copy_context_and_params() with CONFIG_MEM_SHARING
To: xen-devel@lists.xenproject.org
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-3-Penny.Zheng@amd.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20251013101540.3502842-3-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0247.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::16) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DU4PR03MB10791:EE_
X-MS-Office365-Filtering-Correlation-Id: ebb14a5d-b54c-437b-95c8-08de0b300ae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3pObXlMTGI0alpYU1dkWGgvdVN2WDd0alZTTUdtNzRnN29LOHJEeitPTElu?=
 =?utf-8?B?eEducFhDR3M2QVZhcnI1eHo1am84N3pQZVFBMUhmUnpwUjBrb3A2TzlnL2FK?=
 =?utf-8?B?M0dEempDRFJzZ29ZNHROang2a2ltL2hqekJ5Q0VVK2V6aTBWWUl3WUlpZmxj?=
 =?utf-8?B?cXZyc3QzR1lUN1EzRndBdFhwTHYzMzVNWE5LOFR5ZHlLdXBLb2o4Nll0M3V6?=
 =?utf-8?B?eEtjSzltSnF5eXRSSDdMMjQ0WE9MS3ZsbXNGc1NwMTFaUFNFSnVITFBIcWpU?=
 =?utf-8?B?MS9GcEJWS01DSnBpYnVOZWVzV3pwbDZGbnpYRGt3M1h3ZDNjY01zbXJISlla?=
 =?utf-8?B?RUVHdk9yNmR6cC9vTDFSbkt2cWR1Z2JuTkFzZjFOYXZ2MjNXd3JsRUU1cVBJ?=
 =?utf-8?B?RDFHMGloMEdUZWdpeEtoVjJwUDZnV0JFai9tMEoyTERRMDBXeFMxR3BVeEt6?=
 =?utf-8?B?ODNIMGFYaGEzQkFUaWdiQWhCNXAvdUpLZVkvTHg0aTA4WVRXUXNhVS9SUldF?=
 =?utf-8?B?NERGa0E1MW9VS3BFN2R2V1JmcmVVWHRHRmZNWnZPRDlTQ2FEeWp2MmxhM3Bx?=
 =?utf-8?B?VW81amNUeEFwT21ySzdDdVNFOVkzU1NDdW9vNXB2VlZ3TG9wRzk4TldrSm1x?=
 =?utf-8?B?bHJRZGYvRE8xN1Rwdk9ZdHBmbjMrN2Y2aEV0TXRRZloraGtJSERhT2IzS0xB?=
 =?utf-8?B?eU83ckhzZ1o3OUQwcFMzMFcrTHpVWWxJNnVlVnByMEpTd25EallJZExrY3dS?=
 =?utf-8?B?K29Ea2hvUzlWenc5WG5WTVI5NW9QRitrK0FrY2h6aHZYTVkrTS9EQXhYSlN2?=
 =?utf-8?B?VytGWHNCOHZHWVRKaTM5OG5uYjlLN2QrWVV2Uzg4VlBYakxLRW1Kbk9IMGow?=
 =?utf-8?B?OWJCYWR1S2V3Z3NtM3orZnc2d1Y0QjBCSUZHc0NORzYyUjFWTDNOaXcrSU9B?=
 =?utf-8?B?ZDM3L3Rsejhzeko0cm90b1ZMMHFGUW9WWC81Wi9VT0dCbUZvRm1CWmFzTWlU?=
 =?utf-8?B?OGtIVldtamZQRTJjVVQ2a2NCSmE0bnZOMXNEYmRTTVFqVGlBcDdSM2JvbkVs?=
 =?utf-8?B?L3NRa2FLdXoyZ1JzSk9aWnBaTTN3Q2piQnJXOUxGM1A1UHNLWUM0NXh0TTNr?=
 =?utf-8?B?UEZWL3o4bDlEbEFZZ09lbmtFZVNZdE52azltSjhwQ1RZMDJPUWJlVzhOUEl6?=
 =?utf-8?B?Rk5IdGZaS2srYktqaEo4Rjd0MUhZQ0t4WkVMbU1uNzdOdFBLbnl3Kzl2cHJs?=
 =?utf-8?B?dUladVpBdXRKUWw4dDFOSXB5a0d6U25vODFkMHlleDNxZldpZ3A3U2ovemdR?=
 =?utf-8?B?alc5SHBvWE1NZXhacE5qQXJpbFA5aWJ5bk5iRFlYOW4xMmdQUllYNExlTUZq?=
 =?utf-8?B?cjQvUXBLNTNDYjFvaElaS254UGRyaHEwMDRxYU5QYTdEcHVlTTdvQm1iSCtL?=
 =?utf-8?B?Z0V2TWVWOGFqK1FOM1diR3pOaVNQVHNHVWRDeWgwMCtLdXo5VFpwNWhwNnJa?=
 =?utf-8?B?RnBIcGduWW9LbCtWOTZUNFgxTDBHdXJXOWdvU1lkMWtwYnRPd1FJcG5tcVdL?=
 =?utf-8?B?SDZ4eXlFdDJSSlc5cjVtU3JSaitCdGVQWlA5YjE2TU9RYW9OK0FvSzRhK1hX?=
 =?utf-8?B?VUtrZG5rTjRDeU1GR0N1eGhKWUlNZFZvOGVHU0M3WlBTelVNSnhUUTZKODVp?=
 =?utf-8?B?aHlZZjcvd29RK2tkVUpPSXNYTkFKNTZ6Qzdxc0RZd0xtYzBCbHNxZElLZlFu?=
 =?utf-8?B?anFiRGVVL2MwaU04WXEvSkphNVBXZzBlblFtWVdvSmdsY01oM2RUU2ZPVzBx?=
 =?utf-8?B?Wm5TQnpVZXZ5Z29aWG5WY3BUbnl5VEk3YnpRN0lvN2hGcmxpWTUyYytkcnJN?=
 =?utf-8?B?VkFoZWtUcE53UkJQZFdlS2IzbTB3eGNpb1RjaVBwMkV6SGVkN0Z4aDBESGdQ?=
 =?utf-8?Q?Z6ywhp2Rz8gf5zTls8J54/ctMQRqbMbD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QU8wVnhrTW5xLzdFNVUrZEJPQ3YrMXVSaW13TkdHRWN5ajJsSUkyV2wzV2pI?=
 =?utf-8?B?ZG1JeitMZW9UaGhkNmpPWnpSYWdMVGRRWG9BUGlqZ1UvV2FadFp6bG1SM21K?=
 =?utf-8?B?N05hamdLS3JLdHlleHhwbzdERDVUbHJiMEY3UG5wZFdYdzFGclFIYWxtOUFJ?=
 =?utf-8?B?ajNncXk0VDgvS3QwZjVoM09jbmpGZFpJbU5BMStvbnBNNWdGbGJJblhIc2o5?=
 =?utf-8?B?ZWtqbGtURi9aQ1psYnI5OVZEVXhzTVA5TUxJczFLekVsZU00LzRQVjAyVUtz?=
 =?utf-8?B?SDgzRVlkRk9jWmYyQkI1NGFCZU5oOXpMS3ZPRGg5MnZ5UWpINmpFN0pOWDA2?=
 =?utf-8?B?ekZ2M2pEWUw5MUZDYXFabWpmT1ZhZkQrOU1IMkpLWFZTSWlzQjJCcCt3bGNZ?=
 =?utf-8?B?TlphWGdJM09lbmFxUnh3QTBxeTR2d3BiNEQ5MDgvODlRWk1BZ0FUYVRBS2VT?=
 =?utf-8?B?dVVxN0N1OUtxaTRZZFFBSllhTUQ2WWcrMHg1cy9XNnRrV3FROEhuRmdSZkZn?=
 =?utf-8?B?R2QxM0h6aEMzaEZnNCttRXFWZ2hEUlZnYWE2LzJ1cUlzSEJCMVRQdk9IYWlT?=
 =?utf-8?B?SlhQNks1N0FtalRBYkRtZDh0YS91UnE0ckFxcmdqSHBaa2xwbk1zdllKMVEv?=
 =?utf-8?B?NlVSMW1hSTBpU0ZBSCtyUDk3YXBLUnFFRFZWalRnMks0YWVhMFlIWWdhT0Fq?=
 =?utf-8?B?c1ZINXBUNWN3dis5OUM0RkFVdjN6aDlva2pPN2lBSmdIdU1TSjM5QzBSNXZr?=
 =?utf-8?B?K1VOZW1idWhiYzlOTnB1bUxLU0UxVkJCSmQ3RytRdzJmYXQ4Ty9LV00wYVRx?=
 =?utf-8?B?TFhNeTNKR05MOVpvcUxndmxIbC9DejZBZFhnR0R4TGl2cnBVVHlVQWswTUsz?=
 =?utf-8?B?OTRMYlY5cHhLUFJNM2xieGZyRkdySWtTdWRRWCtqV25rU2U2YzExeWo0RWoz?=
 =?utf-8?B?V1BnWW5tVmJsdm53VkRLV3VOUk92V0JVeDVsQit6YmRWZENlQm5OcFZ2NWg2?=
 =?utf-8?B?eUQra293RnNLQkw5dXJvd09yRmY3bm43bytkUjRyd2VMeUJDNXBuYnh6eUdV?=
 =?utf-8?B?eHBsRzQyRHlDYzVOZmVqWUtSNlRYTGZiS1dOZkJKUW4zZXFVZnRoTnJVbXk3?=
 =?utf-8?B?RVNNb0VmQ0RRRXFDeDg2eGFkNWZhNDQvSjZaK1Job01ReUQxekl2OWFlNGJZ?=
 =?utf-8?B?eHRqTU9qZitwdEwxbmxQQTZNTmRXVnMvby9FYWlRMkFJdU5mVHVWejNOdGZk?=
 =?utf-8?B?Qm5EbXJsbUtzQ3dZc3NpVGtocUJzRzh5a2NWT2doUmE5aFlzTy93Rjl0anJv?=
 =?utf-8?B?N3cveUR6KzM2N0h6VW81SFdnWWlWSHkxci9udVgzOGxHMllScFVQS3NURzZN?=
 =?utf-8?B?NEFhaUxnMVVrK25jNVNFV1g5ZmJtMHJhWHVEcllGTk1VOC9ybk1HbXdaSFNW?=
 =?utf-8?B?SnFNVW1hOTR0ZGFSeGlQVlNzU1EzM3dSd3ZOUGtnKzhnaUNkdk5DUWJxOE1T?=
 =?utf-8?B?a29XT0J3UWF1MDdNMldHbHk2aitSNVY3M1JZcVhtSEpSMVhuWjBrYThidzBq?=
 =?utf-8?B?R0dWR09iWWRWQ3kxTkt2bVJQanJjTlBteG1qdDZBNlZ5M2oyTUQyL0kyOHVG?=
 =?utf-8?B?enNrd29saWRac3RjdmE2RGNNN1B1Wm9FSG0xM0d6NDFKYkNNNmRBWnhUdEFR?=
 =?utf-8?B?QXpaMC9mckhQZGl1V2Q0NU1zSWJyb1ZiUHZGaE1EK1NhYXV4LzhpbkQ4VW1t?=
 =?utf-8?B?cTVBaUdyci9CRExrRzBKSnNOaE5SeXRoMCtnTzhrS3VNazhrNkhuK0ttRTVH?=
 =?utf-8?B?SnhZWlJ1U0h4dUNUMUh3OFdMdXdXVjFYOUVqNGJxT1lxc2VuS1ZzYWl4NlBm?=
 =?utf-8?B?MklYaGJPbGhkRlE4MC9jTFZrTm5IWE5yM2s4NEZsTWVCeDROWVpBeDduY3VV?=
 =?utf-8?B?MkE1MWVMM3F0VzRkT0pkeWRtVlNUYXVoN25aSXFwVDlNc2NmWEVYRXg1Zkp1?=
 =?utf-8?B?VGMyVE1kSVRYSnk0SVF1dDlwdUh0aWFhRWpRS1B0OG9ycjRoalZQV0h6anFX?=
 =?utf-8?B?dG1MN0xHVXdiUFRpRWhHcXRuU1cxQUE4WDBFY2I2WndzVVJCMGxWQktZdjJD?=
 =?utf-8?B?cFVyVTdwdlk4VlllSlJzTGRWalNMamx6SW5QUnRsSGhhQWgvOU5MRGJaUkhX?=
 =?utf-8?B?UlE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebb14a5d-b54c-437b-95c8-08de0b300ae9
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:43:30.3982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tidOsSvxZCSFZB9svUJALiJeq5Fxsg0kZ2gaZojHcf+lOE+Vv7erl4ouc19f/XRUAnLDZS83beacXMycTV6X0rYHW9iLJs5r1DOEPrmuPqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10791



On 13.10.25 13:15, Penny Zheng wrote:
> The only reference of hvm_copy_context_and_params() is in
> arch/x86/mm/mem_sharing.c, so it shall be wrapped with CONFIG_MEM_SHARING.
> Otherwise it will become unreachable when MEM_SHARING=n, and hence violating
> Misra rule 2.1.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v2 -> v3:
> - new commit
> ---
>   xen/arch/x86/hvm/hvm.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 0c60faa39d..239cd992a4 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -5458,6 +5458,7 @@ void hvm_set_segment_register(struct vcpu *v, enum x86_segment seg,
>       alternative_vcall(hvm_funcs.set_segment_register, v, seg, reg);
>   }
>   
> +#ifdef CONFIG_MEM_SHARING
>   int hvm_copy_context_and_params(struct domain *dst, struct domain *src)
>   {
>       struct hvm_domain_context c = { .size = hvm_save_size(src) };
> @@ -5489,6 +5490,7 @@ int hvm_copy_context_and_params(struct domain *dst, struct domain *src)
>   
>       return rc;
>   }
> +#endif /* CONFIG_MEM_SHARING */
>   
>   /*
>    * Local variables:

Thank you.

Reviewed-by: Grygorii Strashko <grygorii_strashko@epam.com>

-- 
Best regards,
-grygorii


