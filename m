Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 873E19F9353
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 14:33:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861831.1273875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOd7E-0008Tj-Ap; Fri, 20 Dec 2024 13:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861831.1273875; Fri, 20 Dec 2024 13:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOd7E-0008RW-8B; Fri, 20 Dec 2024 13:32:28 +0000
Received: by outflank-mailman (input) for mailman id 861831;
 Fri, 20 Dec 2024 13:32:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DLHD=TN=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1tOd7C-0008RQ-39
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 13:32:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20619.outbound.protection.outlook.com
 [2a01:111:f403:2614::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d87e1329-bed6-11ef-99a3-01e77a169b0f;
 Fri, 20 Dec 2024 14:32:24 +0100 (CET)
Received: from AS1PR04MB9559.eurprd04.prod.outlook.com (2603:10a6:20b:483::21)
 by GV1PR04MB10846.eurprd04.prod.outlook.com (2603:10a6:150:210::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 13:32:20 +0000
Received: from AS1PR04MB9559.eurprd04.prod.outlook.com
 ([fe80::4fdc:8a62:6d92:3123]) by AS1PR04MB9559.eurprd04.prod.outlook.com
 ([fe80::4fdc:8a62:6d92:3123%5]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 13:32:20 +0000
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
X-Inumbo-ID: d87e1329-bed6-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mxvovRCyCB/8pZqTcy7kDlyrtnv1UWELGc9BDKd5NBMPB+qVASvEtuIFOKnIde6cdsCwUwKmlpnG4jge7xfrxsQzV0ownRwFHWE4e3eUkpcPNpRNSnCjTRqX6qsAT3UTVG06FxmbvQnKdTuqrBEI+KXLmhlJkgMrT2xtqlWD7w+oEm9c6UM95Tx4QPXEELFzlYORnBBEfCl3N7Rks7NwqvPr9cwi1FiLi91tkgzrjyXWMChdU/oNO6kxefcugxtq0lYXVaNPeaylrBgSUTbLIzTO36PXOcQt+unzmRJznOQl3qh1Edg0z3R3VdIh0fiDfOJNlouuJr9Cbi9mo7UQHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkpKWXgrjBo35LV9AFHyMdkFzsVCheOvl2eBB0UNrZo=;
 b=ve1oWyp4yClwqABeVFQtuV+VY883+Ai0S2SNRHOsU78TWUe61N8PyFFyglDTD16FtTh7vQ3eoTrRH7ExXEgBa3GsgqW+nQZRuzX0veH6qCoYMi3E/8Xei7ryrwMzZUV0W6hbT6IHrp1E9g6T9wpK4FU+GEKs07H7BMGlg/MrU7LnN1cJHJ4PgZD2teEVnYuLiyNR9zNjhPC5ffzJCNCxSjb1xAMSmkd9js7gu6DgeIzVAKP2hn5Y22w8COAx091fDjFkdpVj+McAeYel2MEHKxqC0pt40Dn/jZEg37dG+b8vyeRi4+YttmC+CuDWUSkcLrxzg5DdO+FqBB+1B99lbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkpKWXgrjBo35LV9AFHyMdkFzsVCheOvl2eBB0UNrZo=;
 b=u1iniY9a5oUCePPCkM7S+umRz7CCq57VFtpTNG/DyeL34Illuv91rqThGyvH0pHBikojjTB6iRVC82T2kx0kZQZo1Z9H+thp5Dpc712rDYaA5Q5y/c6IUX3FYUejAANyqXItEwx8soKGDltdO/cEnS5gP7q+LYxkT/br+H8IXiYeyOAfpkcSALyrQF/77OtQT8wruMLUdVeC1QKx1xiUCMhPYh9jhGYP0dXqYs1l/Zce20bU9jp1IwT+uWZG+Mzs5gDbrfPeE8lrcuUug1+UBnyzSsljrtUczt6u0dx7ej/Arb992uoYevKVqD9c9iwFaafQ8+wWHtrhH9rQbdQGnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Message-ID: <6b8593e4-cbb8-47e6-b56c-111c89136bbb@oss.nxp.com>
Date: Fri, 20 Dec 2024 15:31:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] xen/arm: Add support for S32CC platforms and
 LINFlexD UART
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <20241219112315.2461048-1-andrei.cherechesu@oss.nxp.com>
 <1b85e268-a06b-4e40-b652-99ffc874e10b@amd.com>
Content-Language: en-US
From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
In-Reply-To: <1b85e268-a06b-4e40-b652-99ffc874e10b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0020.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::9) To AS1PR04MB9559.eurprd04.prod.outlook.com
 (2603:10a6:20b:483::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9559:EE_|GV1PR04MB10846:EE_
X-MS-Office365-Filtering-Correlation-Id: b98a5458-34a2-4a5a-29b3-08dd20faba5f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a0V0bjJkZEU4VDVqaC8xOGFSY3lXOGZFNjVkd3gvSXNSOVVZci9jVVhJTjZ0?=
 =?utf-8?B?eFBRMkg2MmFxVTlEellPZmdTcFlqV08yOC83MTlWQWVFNDN3ZmJBR01JcENC?=
 =?utf-8?B?MjJFaUpJTEkzeXNIVG9SRDlGcW94SURVT3pBcHNTaVFRNDJkazZNOW9GK0NV?=
 =?utf-8?B?VlpScXdvQnNFRXRkOXBFL1FTbnlDQ3FvWEJFMWdROGtLZFBnbGt0OFZHcEhX?=
 =?utf-8?B?UElzWEFHMm9GU2JjRWxPMmNyYUxXZzBiS0NRZ2E5MEpEM1VKaFJ2WGo0OWhE?=
 =?utf-8?B?cnRmV3JmQW5jRHgzb3pQMDNXU2lUVEVrajIvcjFOdEJBdXEvZzFsS3d3b0hG?=
 =?utf-8?B?YUVOQXRVQnVKYkV4cERFRGVoQ2V0dUlVT0JZOG84L0NDdEhXN2NKeUl4cWJ3?=
 =?utf-8?B?dWVQUjU2MFl4Rm5vOGRjSEgwdmhuZkxUWlpJMEZOdDVVS0xrSE1WS0w4MXBH?=
 =?utf-8?B?MzY4T2NpS0JyOXh5QzlNSTVhUUdBb1hWRXZjMUhTOFN1UHlJSzhaWmZzZWp4?=
 =?utf-8?B?WkZNVXNDNHV1YjQ1Nld2b0twZ2NWM3FySm5jQjFlcmk2QnUrdG1LaW5EdE9s?=
 =?utf-8?B?aGhBQ3RhUG9pY1dKQ2VzSmw1TElEa0NSeldqbnBzSnZEMllJVHl4Vkc4Ulc3?=
 =?utf-8?B?b1AxeGJhaVNFSUtsMnhnSzE3VmFGQkxQbDhBdktIWk5NSUJkWGRxR05teFls?=
 =?utf-8?B?N3VlUFBuanFMdjR2TFBJYThZMHFQQXNsOTJKenhnekoyMlpMdno0K3ZEUnlG?=
 =?utf-8?B?cmhPS0VtRVNzK1VTa1AyUzdxZlI5WWxpcTBVeGVLcXFDTFYxZVNnOHBPRVNz?=
 =?utf-8?B?b3h6a1k4OUx6NzU0V2Uwc1JyQ0twYnJiM012U3V6MjJ1RHRyNk95em1TemxZ?=
 =?utf-8?B?azFjNU1mU3ZUdHZMTGh6UzRMZFY4QzJadVd6aWFlM095aldjTkRIWnBCOVRy?=
 =?utf-8?B?RWpBekRPK1VnWVE3T1d0WDd2Y1dydXE0eWxqR09RZEZzSFdvemtvOEsyYVJD?=
 =?utf-8?B?MzVBdlhMSDRyTEtRK3VOQmRRQ0UxdGJDNnA2WDJRQmZrY0RHWWZGRVFWd2VW?=
 =?utf-8?B?a2haOW84RmZ0Tlpka2ZWWDc2N0xDSFBPZTFvVGlPMjBaSXFYaVlycHhMVU14?=
 =?utf-8?B?a2Yvd05IeXU5d1NYSUowK2xaZWFULzZHcndja2NFa1RHaTNUTXZjeCs4VHZl?=
 =?utf-8?B?U3ZMQnRkNzBJN1o0UnVjWURIZkZUN21XVms5eXQrb3dDZWdRTXg2UmRZbWFw?=
 =?utf-8?B?YmNQQ3I2cCtLK0w0bzdrOGFqcEZPMDFyUFR1bWdQaDl0V1BjeFJ4WWdFOFFj?=
 =?utf-8?B?UmZ3bFRxMmlaQWd1azlKVEYxWHA1Z2hFVG5MRTh2SlJ3c01BbHlEMVBGT1hI?=
 =?utf-8?B?aHVMTUw4Uk5PRTlxQVY4TUFmT3JvVlFNQmx2Z1AzbEJ3R09ZL0FjZkNOcUlJ?=
 =?utf-8?B?K29wRzlEMnluUWp1bE4rb1NITUY5K0JoeEhnc3djZlRKRE0rUndab1Bod0xs?=
 =?utf-8?B?cVB0a3NDRytlK3AvS3BVbGFvaXpudFczR096SlRqVk9oS25yRjBnSlRkVFpX?=
 =?utf-8?B?aE1kUmh4bFRkNzdOWUNIMCtVVGN5a2dDUGlrY2p3eVJXTEVTRXNQdlVFVDdt?=
 =?utf-8?B?SXlIanVCcmpzL21vdDE0N3pXQlNRWkJ1RnlmZEhFeXR0VUlUdk9va2FiSmlo?=
 =?utf-8?B?VnBsUnpkRFp0bTU2OHNpcmFzOFlMWXhLTHFzWEs0OWVoZHBhZmVEQ216R2sv?=
 =?utf-8?B?WVlsNERWdGVGbTRaVWJUNXBuMGJqQzZsaFM3Mkx6ci9DR0I5ZWdqRUVMRDZY?=
 =?utf-8?B?b3F2STdVWlBtQno3TGFxeGhLRWVPWXNSclhobkU3TitoODgxNk1WNXB2eUtW?=
 =?utf-8?B?U1ltNG1tUTJPTWNuMmJ5WEt5ZXdkQ2djYW5lS1YraGt5dnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9559.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHpsa0dXSld6cXN5LzR1amE0NmppQnNiNGZIdkJ1WUh1cXQra3JZY1FmWFdx?=
 =?utf-8?B?SE1KWDNkQ3d0ZGVROEZGazYrOW0vVHByMzNBbFNaT2hCaG1WR3JDSDBGbmFZ?=
 =?utf-8?B?Rk5CZHVPT1N5akRLMWRwVTkrTW1oalJSQkc5NGk4SE94b285N0pJQjVDbkpj?=
 =?utf-8?B?U25SYXZFN08ramV1eTllRG1XWkVlaUc5dlNwaEMyN2VSZmNUUHJnOWxjK0dX?=
 =?utf-8?B?S3lvL09HcGZPOC85dEp4SEdlbjQ4WFkweElUT3krWUlheXJFNXVXRjR2akFn?=
 =?utf-8?B?WElGaDhuMHl5TVFVbjl2bFk0SGw3SS9WellqSFYxT0NZNzMyL2ROUEk0dXNz?=
 =?utf-8?B?TFVpV2Qzb2tyUm03UlhVQUdkSmZ4K05DL0VWTS9XaWZMVkh3dGpvYWQ4RTZN?=
 =?utf-8?B?eGhTZVlhSXdhazdJVlk4NGFnQ2lWd2YzeENGeHFKbXcvUDExemVHQURSRERz?=
 =?utf-8?B?aUIxS1dqTHh6ZmRVVUJ6RFNVMnVKcE1EMWMybzhMOXJYTUVHQkZWYkw4Vld0?=
 =?utf-8?B?K0V5a2FjT0pwWCtVb0owZmxSUnBvZlRjbmlLWUFPRTZLTFlHTjliSmYralo1?=
 =?utf-8?B?c3JSM0xrOXlINmFEazNpbHo1aVZXMVlZM3ZnREx6ekJzS2FUR0FmQ2dPL0JM?=
 =?utf-8?B?QzZPRGxRdE5HNmx2OHlISWNJVUxhQUI0bURJc3pnb3Y2WXVsaWQrcldZakZj?=
 =?utf-8?B?UDNUcUdJOW91Z0doZGdrOWFTNy9JZ1VoN05RUm9OLy9RdWc4Y1loSHRHOE1w?=
 =?utf-8?B?elpOakxwWVNBTnpUNVlGY3VFNS9vSEdqeXVKR0JrWHdLZU1YVFlBZU4ySUZ4?=
 =?utf-8?B?dCtOTHhKVmFnMzZDMDVCUkdGQzAvNXZsbE1heHZUNEdPdlJVRml5NlRrdHVx?=
 =?utf-8?B?TEFuTC9iL0RvVVNnUEVJdkpVVk1CblBqd2xiTTE0UkdwdjVNY2xkbDVJaXJr?=
 =?utf-8?B?U3IzREQ2QXpVaUhrWW5jMU1VbkplMm56ODBrYUd5aUltVjE5Y2JPelhwQjdK?=
 =?utf-8?B?WGM5c0xOSFhPK2hEVEhTQzVOOThBS2NQYnFpTXhJTGdQY01FVnRHQWxzbXBR?=
 =?utf-8?B?T21WOExHYnBKZkcrM01qMU5NREJOS0lCLzRQTUZFUENkOXJkTGJvQm5oelFD?=
 =?utf-8?B?Z1cwVmY3anZSSXZ1c2sxOWlERmpya0hnQnJLdUMxazVnTkNCempvWCtLWFll?=
 =?utf-8?B?NEJkWUNuVUlJRGJkYXpRSDZYWnhMODVzWTNXVDhzT2YrRGNGZUlpenJ3QmdH?=
 =?utf-8?B?MVZwcS9ubzhuMS9tZk1TbnByVW1ZcWllWnFhZzlCclpwMUhJVFJKRTcrUFZw?=
 =?utf-8?B?bS9HMzU3anBhNGVhUjBOKzk2U1RVV0dkdXNoNVREeDlQSGtJL1RlODhlZmtq?=
 =?utf-8?B?eXE0Tys1OGtWVkFhRGVnZVpyTXQ0T3d6VU5vSHJtSGUwWTUvaGp5ZElFL3JQ?=
 =?utf-8?B?TG8wQmxMMnpFSkxWWnJqMG04eUZoUlkzVFlFTjUzZG9ZeHhocXg4ZXJYTlc2?=
 =?utf-8?B?eURxNHRuOEozdk5OcktBRlpnVUliSmNOWFF1V3lmaVZ2Mkh1V0taSm5xQkxD?=
 =?utf-8?B?SVJVY1RYVzl0alBMRWRNa0NXWHdHRDB2ZE1mbGF2dkZJZWVON0ZDYm8zVm5w?=
 =?utf-8?B?eXpKTVMyVDFJdnhsM1Bkdlg4a2VvNHNUM1JPd1ljaGhZSVFNZ0YwWHZDb2hu?=
 =?utf-8?B?d2p0VVQ4a2duQVNPc012Q1FBaFBQejBKbW9tWmtnWHpOR3VCakVYc3lyUWFY?=
 =?utf-8?B?QklIUnl3RWxocUhpZ1FYSXJ6U0ROUjhxdk5xeDRmY3FUUVlFc3ltdkRXR2dY?=
 =?utf-8?B?RmFXRWZSMGxFaWN6U2lNbys5QXNHZDFseEVoaG9qMmN6YXdtWVBsYmZoVjlh?=
 =?utf-8?B?UU5ibit2SFdCbWFwSDAydWlIYmJINnR0cHhGVlN1UDdOT1BiaWxYUzJGV2Q0?=
 =?utf-8?B?SEo0eURiSmsrVldpek92Z2ZKbmVxaGl2UVpSYVdzL3JCUms2a2ZnZ0krdjJ3?=
 =?utf-8?B?UU1IU0lrbDZZUlUxVVBaZ3VyMXZjdWpiL3NQYkZ2TUhySWkzc0lZempucldW?=
 =?utf-8?B?MHpCdVo1VU5tTnBWdlhFNEpEWWF4dHdqUDl4MDdhWXJXZ2FUL1o4dlVneVBH?=
 =?utf-8?B?TW0wdjJWaTNrWHVZbEZVdVpqVndJUVQzV0gvNHMxZm95MUdUTVB0cHRWQkRG?=
 =?utf-8?B?QlE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b98a5458-34a2-4a5a-29b3-08dd20faba5f
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9559.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 13:32:20.0494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SpFp3LJGq6cTQvK9nEETORMjYnLLt7QFacoY8F2FN5PtkGszx8nj6bYPEA3iJ7BfU3vv8XWybFcNDegUWSJHXTMucVW6GnlSfA/vWEvdv8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10846

Hi,


On 20/12/2024 09:32, Michal Orzel wrote:
>
> On 19/12/2024 12:23, Andrei Cherechesu (OSS) wrote:
>>
>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>
>> Targeting: Xen 4.20
>> This v4 version of this patch series finishes the work left to support NXP
>> S32G3 Processors [0], part of the NXP S32CC Family. The LINFlexD UART support
>> patches have been merged in v2. Platforms using S32G3 Processors are not
>> affected by the TLBI by VA erratum (discussed in v2), and are security
>> supported without a workaround needed in Xen or guests. The workaround needed
>> for S32G2 [1] / S32R45 [2] will be addressed in future series.
>>
>> The 1st patch introduces a generic mechanism for forwarding SCMI
>> over SMC calls to firmware running at EL3, selected via
>> CONFIG_SCMI_SMC. The 2nd patch refactors the SiP SMC handling in
>> vSMC mechanism, to rely firstly on `platform_smc()` if implemented,
>> then on the previously introduced generic SCMI handling/forwarding
>> mechanism.
>>
>> The 3rd patch adds S32G3 platform config to enable the required drivers for
>> S32G3-based platforms.
>>
>> The 4th, 5th and 6th patches modify the CHANGELOG.md, SUPPORT.md
>> and MAINTAINERS files, respectively, to add mentions about LINFlexD
>> UART support, S32G3 Processors support, and the new SCMI-SMC layer
>> introduced.
>>
>> [0] https://www.nxp.com/products/S32G3
>> [1] https://www.nxp.com/products/S32G2
>> [2] https://www.nxp.com/products/S32R45
>>
> The series is now committed. Thanks.
>
> ~Michal

Thank you too, Michal, for all the quick feedback you provided!
Glad we've been able to get this in despite the busy period right
before FF for you guys.

I also wanted to thank Julien, Stefano, Grygorii, Oleksii, Bertrand,
Andrew and everyone else who spent time and effort on this series :)

Wish you all relaxing and happy Holidays!

Best regards,
Andrei Cherechesu

>


