Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B7FCA5B5A
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 00:49:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178376.1502229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRJ3y-0006xC-1w; Thu, 04 Dec 2025 23:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178376.1502229; Thu, 04 Dec 2025 23:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRJ3x-0006vl-V3; Thu, 04 Dec 2025 23:48:41 +0000
Received: by outflank-mailman (input) for mailman id 1178376;
 Thu, 04 Dec 2025 23:48:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TdJQ=6K=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vRJ3w-0006vP-Df
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 23:48:40 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0e9f845-d16b-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 00:48:38 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA0PR03MB5529.namprd03.prod.outlook.com (2603:10b6:806:bc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 23:48:35 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 23:48:35 +0000
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
X-Inumbo-ID: c0e9f845-d16b-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+Ce2NZAvEKkRPWJs4zBW1g+aqYlbI5DddTmiw4nANGmxP2znFrKdGzTOwxDRy03maoSOzjByBVbNbQsJer8TKGpTdMkjWSlLZBPOF9uEjIaQw3i/AOYTspI40m6yDaJq7RrwGTSBGuHZeVe51ClKM7h3xYaAhix3kmk+/4KzUbVFMWdKYNNrmCRZUKP8tdEpfykhIH1fi13XVQnHdpSMqH8mlP99GRPMjMdP6NwvfirL/vmAJBmJOleVJ4381hXSLfX1vBkJ9DuyykYLhgcKaa3la8RCFSkom+DJoOyZD4ReIHn2BjSz2BvMy6ReWLeksgv9/8b/aLNxluL5PwtlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEz/rO5SbWdWA7ZpOBLbxJfwGpdS6WrRuOMy3J8/frU=;
 b=M3U71V1HM/NH+EUrG3wU3lHvC9AjyW//4xIZ7LEuTvoBG53OKSBlDsCSwgwP3WGmYmmh6hlzGYjtJBB8bwCnqlDy1aHPrORaMyyj8r/YTg8z7AWtTnG9som7dn73VZPehG8MD8C6lq2IhlNEgHA0rz9wxdsrd9VOsxU1GGmIZl7/iaDdDsNenmM+ZinbS2qD/nBkdOw1qnbCsY+QRd3nw+taH23/xiGvAwTsq0HX48c02tFsKqf+SSMDvU0NmHnu39U0GvEifREklxpyStJM8GmciNlQ+Tsm6b0DQpbDe7CTljWhmSj7CRtFHA1dI0gBQd7mHV8IjC4qr0HFUkFA+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEz/rO5SbWdWA7ZpOBLbxJfwGpdS6WrRuOMy3J8/frU=;
 b=bPuedWS1CuGtDZn79iPUDkvLkDf16fU0ImFLqv/a8M2RuJe5HwG6oGr0zDTPGlLZ4pREKs9dqdAKW8gwAfBr6OWtxIupr8H/XLVL+5UK0Sm1wL6ZQILlxrb69g9Z2a7zlqka89UY+dAWnJmh3EE7PtqW0KOdwsVLeGCjtcsnU2k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <62173b6a-faef-4919-89ec-5075e4ed3fb9@citrix.com>
Date: Thu, 4 Dec 2025 23:48:32 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Mykola Kvach <mykola_kvach@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [REGRESSION] Re: [PATCH v2] systemd: Add hooks to stop/start
 xen-watchdog on suspend/resume
To: Mykola Kvach <xakep.amatop@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b44966513abc729f44795c0d5012e1c5fd106477.1752783296.git.mykola_kvach@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <b44966513abc729f44795c0d5012e1c5fd106477.1752783296.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0034.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA0PR03MB5529:EE_
X-MS-Office365-Filtering-Correlation-Id: fd70f36a-cd8c-426f-e3aa-08de338fa3b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDVpcUxuVXRJN3lESW5QcTdSOXJRaWh2QjhySFpuK1FFeUJPamdaOEpmSldk?=
 =?utf-8?B?VHJOV0tscTV1VkFtYTdCcTRvM1hyZk1EYVRXMStiajJ3Y0dlcklLSFJVRk1G?=
 =?utf-8?B?c3JBaE5NcEhnaUJoc3BueTJHeEJDOG8yWXIwM0R6OTZkRlVCK1k1QlVBU0Jw?=
 =?utf-8?B?eEY5TXhHak9PNFFrV2hWVE1hY2V1RVR2M3hWSG02MUMvbWpZQXhQUEc1bTVn?=
 =?utf-8?B?TjgxcU5PWThOUVI2QW9lalc2YmhEL0NjT2h5b1paR1pwcjZ5Ull5Z1JBeUdN?=
 =?utf-8?B?N2p4dTZHWk1sdFdVM0I3ek1IZVhzN2tva05OMkYrd1liRDNJaXJmei9nMmpE?=
 =?utf-8?B?QngwNlUwVzJweTZLRTVSQi9qaWg2am45RzNYUndQTVYvRDI1ek1aMFNSNXFx?=
 =?utf-8?B?eWFqRWFpWGNVQ1d3NHU1ZHZ3VTVuUjV3bEJrQXZUT2k1S0xPRW9PamErbFFQ?=
 =?utf-8?B?MlA5WVR2NkJRanFZcUFyY3hUaFYxSGEyNzFwVFpnV0kxNnordWJEeHFmZG1Q?=
 =?utf-8?B?QlNyT3lQYUJibng2ZHBkMm1ycml0b1FIT3U2bElCbXFBMkpPczlibEpwbEk0?=
 =?utf-8?B?VUVHQVFSdWlsV3VPL1JLN0w4R0tySW1aTDdjRC8veE95cG1GdlAzZklXalJZ?=
 =?utf-8?B?SzF6d2kxcFpFVUYrQWZFbzdvNy9lNG1pTC9NaDhsTC9INVpYc2NHQytlUkV5?=
 =?utf-8?B?aWVQdGdoQ1k1Z0xTOTZhWlV0aUprU0FodmdsWFIvYmIreFFLWWI1OEliNFIx?=
 =?utf-8?B?UjdKNnU3SG5Vc29xdEpNRTZodlJnMlZCOXh6dHlxc1dwOXhjTHBkYUNYZWRt?=
 =?utf-8?B?a1lFc1lteERJOCtwc3AyYjlSMGRuUGdDakF4citzQW1tdkM5d1BDRmhZb3kx?=
 =?utf-8?B?Vng1S0ZpaW54MXQ5VlNjSnp4L1UrY3Q5M2dYR0NTNkRCVStBUSs5YXNnNGt3?=
 =?utf-8?B?UzVaaEE5Ync4bjJqVzJDbTh5L0lWVnhpajk3RmloZHlkZ2xYa1daWnlFdDlk?=
 =?utf-8?B?Y0FNYzg5bVM4VEg3UWVZV1dmYXNOU1ovZHE2VlhVOVJKYy90b1BvdHdUbU90?=
 =?utf-8?B?UjBqTlZjcnVjSHJFQXhZQ3pvUDVQTHE5eDlyZHhyKzUyM0xPZ1BkOTFxdGhD?=
 =?utf-8?B?aVdBS0tOUkNwY3QyQk1hbVorSFc4WTlkbHV4MFZWUk0vWnhteG5aUGgrMlZ4?=
 =?utf-8?B?WVFtSmQ4SlFybzVmUWM4Q2hFN250dTFWUHh1a1I5MDRUMkNHOFhnTWVPWVpG?=
 =?utf-8?B?L0lrMDJyM0lRZkFTc3IydlJUWkF4dGIzYnNwNGhBbTlhMkxsRzlPWE94TDhj?=
 =?utf-8?B?dkszWXZOT2dYRW8rQ2t2aHowWThnM1BtakFWVUo3WDRkamR4RGh5aTczaUF2?=
 =?utf-8?B?dHZ6Nlh0dm5zV0ZBd0p2a2d2c09CbGw5V0pTKzNrQ0hXY01ndnR1cThQN2lu?=
 =?utf-8?B?eGpwUnpkbnBlT1VXWDdjWWVHRWxMSGtoVStEdkxYZmo3Y3NiZkJ0cVBqZHM4?=
 =?utf-8?B?TDBYU3FEcWtNNjB6cCtoc05uazU5SlhQaXRnbElVa3FDMnFlNllla1RZU2tj?=
 =?utf-8?B?ZkhUMm1yZm90Y1ZMYlBDR2FOOUVWTlBZNFRDR25pUyt2U3dQMXc2b1hhZUdV?=
 =?utf-8?B?WTJIWVh3OElDSWFMUEdyM1R1clE3N21tdjFIQXZ2WHE5R1grRVVtdVF6d2JC?=
 =?utf-8?B?UU9sbWZuWE80OWdSOE1YOWkrSlRsNldxbzgrOW9Yc2RTd2hSV0JvR3k4cE9J?=
 =?utf-8?B?cHFOQmZPdVlmN2Q1Q3FFZlpCUnc4ekJIZXY0V3JpU2xNY2E1SU4yU0FSbmYy?=
 =?utf-8?B?elFCNVo5aTFaU3NOSFNLQlQwaGRnSHY0R25LSVJvc1A1YzVCbDE4Mmh3QUYr?=
 =?utf-8?B?SHB2L2xaNnE3TmY0NHRRU1NYK2pYZFF6QTY5M2c2bGxNT0ZBSitieWQzR0FG?=
 =?utf-8?Q?HI7logly2hP3mCUb6gO3iyV/VbEzr0cm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWlxZm5UblVHV3JPS1lheWw5YVVoOG1sWm5YS0ZtRlB5N29VeTFzSXgrSldz?=
 =?utf-8?B?MTlvbHRzTW0vNVlYaWNrWEZiUloxVjlnekE0SnRlSUlVTm1XV2I5Y1BQU1hS?=
 =?utf-8?B?NktrV1FvNjhaOTJ3b0llbjYybjYrZDB1bmc5TTRVS2h6SWFaRGFrM3FncENm?=
 =?utf-8?B?VUJ5L1I5d2w5bG5ONXowMGpvZWthMU1BZ2lnM0dMckY2YitQZk5VNTZvanBh?=
 =?utf-8?B?c0lNcWtLdFdybHZDbFpvamNITFpLRGFGM0hJVUN3N29wYlh0MlNpeDROOGZV?=
 =?utf-8?B?Wk1zMHF0d09SVjJucGg3L1pzUy9XQzdQQWx3VTJCSXRXa2k3Q3FPdEVNVGpL?=
 =?utf-8?B?dFVnZDJMRGdLcnBadk1ralpHMndoL1V0ZEVhaEoyMS8xc0VwbHV3MGdvUkV1?=
 =?utf-8?B?UUlicWR1OGZEZDJ2WG1waU1URmVWUWJNVFBwaUVmeXZIOVZ1RjhTOHRjTnQ0?=
 =?utf-8?B?QzJOenVrZmZMcklnaDE5SkFCMmJNdU9DQ1dhQXVQL25wdkZ3Y2ZBYWdqblpO?=
 =?utf-8?B?azhuRHgvRTMxaHVkYVJCUGNrNG9EVVU4eE03SEJpRlgwN1RBTmR6UlNKUCtF?=
 =?utf-8?B?S0l4blE0YUtXd09RRjhMY3RRU3ROTlJSa3JQK1p3TWs3bE1DUWdvaktPS3Ry?=
 =?utf-8?B?dmNURk5UT3BVUlh3SVVMcEZCcmJlQnY4M1pxOVV4OGZESlBkVnRUdTNnYnVr?=
 =?utf-8?B?OEdmcCtrMWswbjVTMGV2WTZSMlNmOVRNUjBpeC9GR3JXZkFJS05ncGJJR2ZQ?=
 =?utf-8?B?ZG1ETHY0Wmw1VGpXNXJMUkhhRmNlM2NORm1TQ21XVTlBNkFNT3ovZUNzR0tC?=
 =?utf-8?B?dUljOUt6MWZmdGdZTmFlaVJDYjB3UDQrb0J4RGk1dmtuaFlUZEQ5UDlyQS9G?=
 =?utf-8?B?VmszWFlyZEZycytBeU42ajlhQ0lvUUR4YmFZbUJiRXpoV0IxTU1uSUV1V3A2?=
 =?utf-8?B?d3hlNjc0dG5hd1I4aDR1YlJWamJOZXlhSWJsSm9sbXAyVEJncElic1pucHBO?=
 =?utf-8?B?TFd2SHk4OUpuc0MvVGtVUmd1RTZDb05wNnkxTkhKOFNXZWM2U0pGMVh6Mk9D?=
 =?utf-8?B?RUcvdXJHNmppMGh2dWF3dnV1MmJDRWN5U1FTQUZRQlVncXRBdkJ2TlJIbmc0?=
 =?utf-8?B?MUR6VmJ6dXVTNnpBd0w2cEpiYkF4Tk82MGdKbzRMYlVjYTlMRmxTWXpxSFF0?=
 =?utf-8?B?WGtjNnRtb1VJZURvUVFzdlNHdlh2RVZSRFVEWU1VRWtHdllXZ2x0SkU3eTFZ?=
 =?utf-8?B?TzZweUNFNlRNRExpdFFUQ1ZYSzhZMlNUcVhOYzZMUnlhVGhwdVFnZFVvL21s?=
 =?utf-8?B?dE1QS1dBSXdxS2Jhck5TQ0lFd2p4ZzNHTGg3Qkd2ZEptNnpNU05QdjFINlF4?=
 =?utf-8?B?U2c0RTlaUWl0Q2JmQkVFRVZGbExXbU1tWng4R29pWHhjNzNzV3dBRG9wYXhM?=
 =?utf-8?B?M05PU24xVzJyaCtXVTFlY1FQSk5FZnVsODVCcEU4bGJjTTZ0bkllYlB1ODJw?=
 =?utf-8?B?SFRDTlFJSXFCRlJkS1lKL3ZzMUxTdFNtY04vMlRPN0E5RTVkR2UvcmFpbXRs?=
 =?utf-8?B?V0pkNmJuV1Vib3lWNktrNEVqVTNRMGE3RXo5QWdSbXpENHh0dGJUN2JTVjFT?=
 =?utf-8?B?UXFVZytFSGZiSWl0TTBpb3FOdGdwTXV4Q0hwbUU0eXVHYXNBbjlpaFJaRkxz?=
 =?utf-8?B?MGgxL2F5eHpuWUdRSkQyTEdDUHRTNExzZ0N4TFRQcWxXZFA2OE9ZZEd0bmlw?=
 =?utf-8?B?MFY1OFpRQnZFUW9CME53MmVFOWRhM2R6OElkRkh5d2tHdGRIYXdNL3JTL1la?=
 =?utf-8?B?SnA3S0UrUHh0Y1NUVGxXVHFGRFVJbW15VE8vTHJlRVdkWE9IWjB1RjFPZk5S?=
 =?utf-8?B?SDgzclVyQjNJemRJdFNJVVE0bGsvUVZlYmxncjFmbFJibDIzdmV3bTdNTWpL?=
 =?utf-8?B?d3VKWU9lRWJPWE5hQll5YVRhckRSSDdLTG96RFJ1cGswRno2WFJic2I5d0tV?=
 =?utf-8?B?TU9PVkhlZDVtZkk2WG8xRHA4cTNETkZ0VE5oMGlVVFpHR3JxZEY4bVFraGVQ?=
 =?utf-8?B?TitFSlNPTmQwcU1QVHpyRHlpSWxDSE8xMTNnbEtTL3BtWDkyVzRXWTVpMWpN?=
 =?utf-8?B?VXZOUmdiK0ltRFhlM0p2SXpXU0wydldubTF2d1VyKzZjOUwrd09tak9NVEFo?=
 =?utf-8?B?L3c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd70f36a-cd8c-426f-e3aa-08de338fa3b7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 23:48:35.3967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VNavTOkYzTC4QiOtH3ZHef2oNzy+dzO6sBPTlC+dqa1zo0Wnxz7XtIrsgZW0SV1JxKh/6MP3V/A6foZmakPVfSPFyYWagqGqYJduJq024aI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5529

On 17/07/2025 9:16 pm, Mykola Kvach wrote:
> diff --git a/m4/systemd.m4 b/m4/systemd.m4
> index ab12ea313d..ee684d3391 100644
> --- a/m4/systemd.m4
> +++ b/m4/systemd.m4
> @@ -28,6 +28,12 @@ AC_DEFUN([AX_SYSTEMD_OPTIONS], [
>  		[set directory for systemd modules load files [PREFIX/lib/modules-load.d/]]),
>  		[SYSTEMD_MODULES_LOAD="$withval"], [SYSTEMD_MODULES_LOAD=""])
>  	AC_SUBST(SYSTEMD_MODULES_LOAD)
> +
> +	AC_ARG_WITH(systemd-sleep,
> +		AS_HELP_STRING([--with-systemd-sleep=DIR],
> +		[set directory for systemd sleep script files [PREFIX/lib/systemd/system-sleep/]]),
> +		[SYSTEMD_SLEEP_DIR="$withval"], [SYSTEMD_SLEEP_DIR=""])
> +	AC_SUBST(SYSTEMD_SLEEP_DIR)
>  ])
>  
>  AC_DEFUN([AX_ENABLE_SYSTEMD_OPTS], [
> @@ -69,6 +75,14 @@ AC_DEFUN([AX_CHECK_SYSTEMD_LIBS], [
>  	AS_IF([test "x$SYSTEMD_MODULES_LOAD" = x], [
>  	    AC_MSG_ERROR([SYSTEMD_MODULES_LOAD is unset])
>  	], [])
> +
> +	AS_IF([test "x$SYSTEMD_SLEEP_DIR" = x], [
> +	    SYSTEMD_SLEEP_DIR="\$(prefix)/lib/systemd/system-sleep/"
> +	], [])
> +
> +	AS_IF([test "x$SYSTEMD_SLEEP_DIR" = x], [
> +	    AC_MSG_ERROR([SYSTEMD_SLEEP_DIR is unset])
> +	], [])
>  ])

Marek reports that this breaks the build.

https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/10959608099

Specifically, for a build using --enable-systemd (to get the
initscripts) but without systemd-dev(el) installed.

A while back we went to a lot of effort to stop depending on
systemd-dev(el).  For the sake of one path, we don't want to bring that
dependency back.

Can we see about breaking this dependency again please?

~Andrew

