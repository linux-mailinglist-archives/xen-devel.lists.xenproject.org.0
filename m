Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C422CA6DDD3
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 16:09:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925741.1328622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twjQH-0007XD-CL; Mon, 24 Mar 2025 15:09:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925741.1328622; Mon, 24 Mar 2025 15:09:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twjQH-0007VE-9X; Mon, 24 Mar 2025 15:09:05 +0000
Received: by outflank-mailman (input) for mailman id 925741;
 Mon, 24 Mar 2025 15:09:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r2bg=WL=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1twjQF-0007V8-U6
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 15:09:04 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20612.outbound.protection.outlook.com
 [2a01:111:f403:260e::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb1573b1-08c1-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 16:09:01 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS8PR03MB8345.eurprd03.prod.outlook.com (2603:10a6:20b:509::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 15:08:58 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 15:08:58 +0000
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
X-Inumbo-ID: eb1573b1-08c1-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KijUCaEoEzQqqj16CnWR3gCl1oeJJd7KLffb8a8r1IVi7f7pvZTsqMbICVvou7BXmN4tEGW0JUei9uXdxqr/tazXLbfbOlOfFJGzPPuF8NpSbL3Kl3A6SqNc7x/lmkpTZWc87sOnTSxfPgxVpD/7vXDsLS936kh2EHpt13/Wa+NGSyOlDv7jqCF40zoj4ExRgHkKkTzdpwsL/qBD2mJEKimVEGACgwFJXaAaHewMKoi2IQqI4Hb7eyQDB1LAOefDpSdJeESQBKsZ1kyyffw9FhY6mhBn4xT1TQrnsPBQcuV21wXo/ntcY7Ud9onl8ML6f+fnyjuLDFMEnPx1cDUqhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJcZU64s8E+8JKTrBjH9ibM8YLIeg7Sn3n/8HzJVY/o=;
 b=R1jYieDAIm05+bpYsWEllGcpmQ6/ud2Nd7xq0/xcomDLOGoJcrS2f2qq07HfDJGrV9nxMaY9tCYSflU3xcrrzHD7duV7B93IXj/jNWLQB9Nlpfa8qatEn/haf59OudXmXYeS4ChlID37SAXH5bxKXDNTj+eZ7gBnXQk9DgQjBMlSujJ5lDdKCqu6bEgTmYHhJfaHy946vhRSIAWjQjsbyz9KqYGYbRkb1jD+4muBUYBKbF4BMd7vvwrYPWIQ6GkvaitoaspfMaaLzxrp/FkowRUB5W0eDxDmuyZ0B1A2AjtIX7qfEJz1Nz2aNgkQMAp5wlqqvxOI0bQiYvjLyOXelA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJcZU64s8E+8JKTrBjH9ibM8YLIeg7Sn3n/8HzJVY/o=;
 b=fdNI9eauZU86hU2UMpd5vy3+u1ozqN8+evcT6IaVf47fEbnQo93kXAaKE8m7p0QSbLMvQu1YdTkKz4gDfcGSpa4QiZ+xRt+IDtJwrE6BGeZBG/Sd4lXuGONekgctBUtlhSDxR+3WW1i83lDqO6ofR/YgIjXRZ8Qd1ujsURfcDksa0ofXDwr/C0d5/SCfQFmtuN/tAtaDHBWdnz+gAQvEA0AGztFQ6w83OxX74h7SoqeivwyBn8QIqMcr1IxWNC9O93/zPzcRQBgSagfuNmLX/3CghOf96B4hG7OyKALpHjerN3rnpqEwcI14ubmK/aQwpE3rRPNyiniYR9xgJIQ9Rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <c55d6b80-89d3-4f2f-873c-e77de10d606b@epam.com>
Date: Mon, 24 Mar 2025 17:08:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 2/7] xen/arm: scmi-smc: update to be used under sci
 subsystem
To: Stefano Stabellini <sstabellini@kernel.org>,
 Grygorii Strashko <gragst.linux@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross <jgross@suse.com>
References: <20250311111618.1850927-1-grygorii_strashko@epam.com>
 <20250311111618.1850927-3-grygorii_strashko@epam.com>
 <alpine.DEB.2.22.394.2503131540530.3477110@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <alpine.DEB.2.22.394.2503131540530.3477110@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::17) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AS8PR03MB8345:EE_
X-MS-Office365-Filtering-Correlation-Id: 783cdd59-978f-4841-7305-08dd6ae5cd2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SEphWituOFd2Y0s4aDBRZjhaREFIRUhzcGJiQ1dudFhxNmF1T01EL0xESlJK?=
 =?utf-8?B?NlZCSVRGT1FYQi9JTlYvTENPZ1ZTQWR3cWhuRlZoOVQ2TEdQUGo1VGNEOE9j?=
 =?utf-8?B?bHVhWWpiaUZCSmhiNTkveVBYWEhEU1UxUTVmWHZtTk9naTNMeHVEdnpYWXRr?=
 =?utf-8?B?SW82a2RnMEtSb1pkWWpHVHRFVDZBczBTQW5STnkrbGVyQVYxNm5oeGU4ektT?=
 =?utf-8?B?RThjKzF6N2pveEZxRis0VXlMZ1NpQ20vMFhOaFdrOFNJb2RqM0NydlpJMjB1?=
 =?utf-8?B?Sno2VUVRa0xTNmpveVEvNHoyZ3dSSHJJa3FlUTlnK0ptbWdpT2JOTmo1aGZi?=
 =?utf-8?B?WThSZE1HWXBXYVRPRWVLTW53OWx1YUk2VWtDSUxIWXFXNU1tb0JuRzUwNmZI?=
 =?utf-8?B?VTFka3ZRTFM0Q0RPbDRIQTFGWDZqT21yc3d3cUs5cllIM2JPV2VuYWtoVXBE?=
 =?utf-8?B?UU53Q0hzQTltbjFPbmp1ODJCWTZ3V0xUb3FkL1locFlyWWRpbXdKV05jMis3?=
 =?utf-8?B?c0Z0Vnl1MkplWExUeUlqNksvZHh4S0lISHVrUnFFS01wUWdvNmNXNGYrWlJq?=
 =?utf-8?B?ZDBPS04zSS9tMU1GZmY0czQwbFFobHdqb2VHWUY5bGp4Z3Q2eWdlUjdIdjA3?=
 =?utf-8?B?SmFXOWhIVzZLS21ZOFFKVHh4bm8yZCtNMFhhVlppQnhIci9PVzExTDRuMllx?=
 =?utf-8?B?OUlJZkFieXJSQkFBVzR0TmlSVG5YNUJlMzZtMGgwMDNiT1pOQVVrSFdCRnV5?=
 =?utf-8?B?Nm9ieHlqNEFSdnM5dzR4d3NmTEcrcC8zYlFiM3pIS3pSWUMxWTFjbHhkMlFB?=
 =?utf-8?B?T2Nmb0FQSWZlWUlIZFF2QVhHUFIwc1VMa2gxamh3U3Rwb1dlTjFwK0R4RXhj?=
 =?utf-8?B?UlJQd0wyZENHbEt2c2kvNWNZSlZPSTJFREc5K1dZazNGRG1Ib1JNK2h3alVV?=
 =?utf-8?B?bW5MeE9hRFRYd2EzaktwMWE4bWJPT2JXS1ovRHhZNDBsMnd5dkU5S0dFdW9Z?=
 =?utf-8?B?di9od3kxdEd6N2hEdktmVXlIOTBIbDNmc0dhcTRXcm9NeUZkK1FaVGx4RkQ3?=
 =?utf-8?B?ZHpPeWM0UUpGTlQrRHc4WE5JUG5Jc1FodU1IcU5tdGd1VG1FZ0pqM0NqaVE3?=
 =?utf-8?B?OCtVMzJ5amNvMFhyNzgwOFk3OEpwYW5DTk55WXVsbXBxSzhMOXQ1Q09FWkZZ?=
 =?utf-8?B?bExvNW9jWm9zamg3RzJYSlpBNktrOGZNNkZkdjcrUzVzaE1zQjBhN1JjbW80?=
 =?utf-8?B?a0ljVmI1Mk15S1BJdWJOYm9NdXUvTUZhY3dWU29TM0txQklteTdmUjZuMmdU?=
 =?utf-8?B?LzdFSzY0SkZ2dllDSk1iZHVOc0RvTE1zMzRDMVBKYTkxSlhaVStneUM1SFFD?=
 =?utf-8?B?a0VwcnBkaEVqQ1pGdWcxYmJUbTBLY2IrQTI0aTJENy9TcG50MGw1bDFFN0dG?=
 =?utf-8?B?aTB2VDBzNzFYaktYRW85T3dHbEY2eFBQeFRVbmx3ZEFydHdmNkpueGt2T1dp?=
 =?utf-8?B?b2JQejBILzVJZEk5TGJmemZDRnBhMkZpWjNXYXF2eW9xL2tKY1AwREgrZndD?=
 =?utf-8?B?RkRtQ1VwRTFvNVRxVEhobkY0NG9lck50bWx3QjJKbFJoMU9WLzNpU0tLTnI1?=
 =?utf-8?B?eS9wczJLcnFReXJXZ1p5SnBqTjg4d3kzTGZyOERzWXFVcjNEM0xIQmR5dXVU?=
 =?utf-8?B?Nk5XcXFBRUdvSGVYbEtPMURlWWtVWmMxOXJBemUza3pFdVJPRFdHbkFDWTVG?=
 =?utf-8?B?bFZQVmFBeWpPcmFaWEFROXc5SG52VFRoc3BTWmE2NGlDL0VmSmNkT3h0eUNM?=
 =?utf-8?B?aHI0bkpIZ3d5dlBuMEJFbEpGUFNja3ZCU0o5YzJ4dDB6ZWltWWs5TVhvbmdZ?=
 =?utf-8?Q?t0TzntNjdtJOG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlRHQ3Q0UVN5N1pwRDd2NjllYjlHQ3VLUDRrczg4bXZFZUV0dUwzVERCRG5i?=
 =?utf-8?B?ZWlmRk0vTjVSNU1xN3VPUGtUR1pwdzJ5dlFweDZwQlh2b0VhWWI3MkgrS3dZ?=
 =?utf-8?B?elJIZ0c2N2s3Uld3Um1ad1NCU2o0bVB4Zm9CbWQyNWRmdlF0VFdDQ0JVR2tX?=
 =?utf-8?B?SEZ5eWxLS21qdVN2UHZ3SzhMQXJKbzczbTA2UlR1ZG9QV1RPbElQR3BIZEda?=
 =?utf-8?B?SWdhQ1VKZno3UjhQRlNiNEVocDFYZTFZc3dpQ1h4Z0cxQVpULzJYVzlkQVB2?=
 =?utf-8?B?RkN6Tk83c2RnY3Y3L3dUcVRtTGFQend5dW1PaFZCVGo3eTFSZ00xOWlkQjd6?=
 =?utf-8?B?NGhScWROUGpQMzF5Qk9uRHNyekNvTkNkRnkzUEoxa0NYSkdIZjYrMFpTNFJS?=
 =?utf-8?B?NDJrQVhMMGZJYUZ5YnZyeG5WOTd3bFlYLzNYSWcwbURHSXdYM1FZQVYyTTFm?=
 =?utf-8?B?M2RNeHVkYWpvcVZ0ZnBIbzRKNDVmWXZaUDBSUTRZMlE0eXR4dFNFdVNYLzhE?=
 =?utf-8?B?Vld6dDlNSnhnUUQ5VDRnUDlST1RKUHJpSk1qVjhWamt6K3N2eE8rR3NJNTRM?=
 =?utf-8?B?dERBRllnVHV1b0FxNU0xeFM4bU9IYUlSYmU4VDkzZC9QSUxFcThLcWtKQVpa?=
 =?utf-8?B?dDV5d0lPaFhoeUVSUDdoTGdzQi9BY09ZM0ZJWFhPaVI5cXRtbk5KNkdBblRM?=
 =?utf-8?B?ZVJpS1o4YUdwNER2RkRGL0NqL21UNnNNN1FMU3NINHcyT2paTEhEL0pJR3Vh?=
 =?utf-8?B?dTAvdzE5N2huMU9UdkpsQ2xJM3lOaG9pUE0yMGJmUG1iNDlzbC9XR2FxV0hZ?=
 =?utf-8?B?TFlrWVA3clFCbTdpTVVzZnFuRityYnU3MXdTN3JTaEtIRkZEaWdxeEtodTRM?=
 =?utf-8?B?TjNKM2FPSHV1N1hHYUtKUXQzck41azB2b3IvZUthL2VrREQyUnhmK1Z0SHlz?=
 =?utf-8?B?VHh1MWttcVZSZC9DS2YzbzZVQVVyT0NjZ1daeFdFZnIrTWtvQTQ4RWdQUHJ2?=
 =?utf-8?B?QnQyVkpCb2FIWUtsT2wzdUs4VXVRc2RMVFFQcUsweG4xOVV2b01WM2JEWDhI?=
 =?utf-8?B?N244Wkl0cS9RUXk4cFlRNWJEOGxmUGx5VGtOaFg5UXd5empFMGlsQUpMYVlj?=
 =?utf-8?B?N0ozNVNPRzY1ZnFhK0Y4Y3piUlBSb0JVRG9BNjBHOWQrSGxFb3p2Unh2Q0lw?=
 =?utf-8?B?Nmt0ZFRPTFVPZ1FVWUZSK3o3U0FLTE84ZUMyQlRDdm5wQ2JZandFcWtNMm9Z?=
 =?utf-8?B?VDh4cFdmZ3R3MWExWXI2a3VoeUhqNzZjMmJoY0d5VG55OUx0NHRNRVdJbUJS?=
 =?utf-8?B?aVNRZWZpVTl4K29uUTdGVUtUZmlNS24wc1NFejhCZXRORGk1QUpTbzdJT0RQ?=
 =?utf-8?B?Ym1nbExVL21hK1VDMnVnY3ZKUWRJUld3alRMRGo5VFJOSE5UdmE0OHlCbmZ3?=
 =?utf-8?B?V1pRZ1ExbmtUa3pJQ1lodHNiK3dJSjFOcmlxaTBtWVMxWkR4eWc2L3JpZTVS?=
 =?utf-8?B?SGVndjBkdFFPb2ZYZytXVmZFUlpDdVk2a3NQUnRzUDhkVEp3eGJVMExXVFZ1?=
 =?utf-8?B?MTdBcGliUW1Ld3hXeFB1QUhIVm4xK1dRSDd0bzFxT3pQdmlhbFNpMzRYbTRI?=
 =?utf-8?B?RVMzYUJQL085ZVgvMiszWDF5b1BrOS9ZRlh1RzRBNjdNZEpnNWVCalFNRkU0?=
 =?utf-8?B?aTYwamtveHBCSWYzL0wrelQweGtjUDdnWGdaR2VoTjVlc2x2a3NWdXQzajdG?=
 =?utf-8?B?bDdlbUpnUUpGZEhFUk1DU21UR3ZpbUFDS1RXdU83WmpwajVZS1lVeEdTUVNF?=
 =?utf-8?B?ZUFUS2VRSXM3azdvQlIyTGRtcTRtN1pPdklQSVRQSnJjZW02YVZHZmpoc1Nq?=
 =?utf-8?B?a3JZRmFjV3hFRDJXMy9UQ2hiME9NbHRWMDZ3VitDcUViVXFsa1dGTC9wMHpU?=
 =?utf-8?B?azFkTkdmQ1dwTXBOanU4MUpLSjArRzNWQ0dLdWF5cHlEbWVwR1BKclI5ZkNr?=
 =?utf-8?B?Y21RSFhXMU5YUldrMDA0bTJMT0xsbmVSaldQRFhwRnJqODI2dGJ0Ykg3d2pD?=
 =?utf-8?B?MWtMM00zQlBrU3J5ZmFndkF3czg2SzF0NHB0VkZ4bU5YT3h1VXhKRDNvdm1s?=
 =?utf-8?B?dE9CcUhXYThYaXllbWUyT1R0UlV6N0RvZG5ZbW9pMXdoOVRIQmJnUUNXYTF2?=
 =?utf-8?B?bUE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 783cdd59-978f-4841-7305-08dd6ae5cd2b
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 15:08:58.0383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WY7ttWbcUgmtrozMM2F+BoV6Q04dUPqpKGKo4nWymHBiaVcKuZBuuDVYidKX3oDaKUsaOEVvqwUdpyVaIzaep8Twz8l1W2PA3tTC9MyzgVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8345

Hi Stefano,

On 14.03.25 01:48, Stefano Stabellini wrote:
> On Tue, 11 Mar 2025, Grygorii Strashko wrote:
>> The introduced SCI (System Control Interface) subsystem provides unified
>> interface to integrate in Xen SCI drivers which adds support for ARM
>> firmware (EL3, SCP) based software interfaces (like SCMI) that are used in
>> system management. The SCI subsystem allows to add drivers for different FW
>> interfaces or have different drivers for the same FW interface (for example,
>> SCMI with different transports).
>>
>> This patch updates SCMI over SMC calls handling layer, introduced by
>> commit 3e322bef8bc0 ("xen/arm: firmware: Add SCMI over SMC calls handling
>> layer"), to be SCI driver:
>> - convert to DT device;
>> - convert to SCI Xen interface.
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>>   xen/arch/arm/firmware/Kconfig                | 13 ++-
>>   xen/arch/arm/firmware/scmi-smc.c             | 93 +++++++++++---------
>>   xen/arch/arm/include/asm/firmware/scmi-smc.h | 41 ---------
>>   xen/arch/arm/vsmc.c                          |  5 +-
>>   xen/include/public/arch-arm.h                |  1 +
>>   5 files changed, 64 insertions(+), 89 deletions(-)
>>   delete mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h
>>
>> diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
>> index fc7918c7fc56..02d7b600317f 100644

[...]

>>   
>>   /*
>>    * Local variables:
>> diff --git a/xen/arch/arm/include/asm/firmware/scmi-smc.h b/xen/arch/arm/include/asm/firmware/scmi-smc.h
>> deleted file mode 100644
>> index 6b1a164a400e..000000000000
>> --- a/xen/arch/arm/include/asm/firmware/scmi-smc.h
>> +++ /dev/null
>> @@ -1,41 +0,0 @@
>> -/* SPDX-License-Identifier: GPL-2.0-only */
>> -/*
>> - * xen/arch/arm/include/asm/firmware/scmi-smc.h
>> - *
>> - * ARM System Control and Management Interface (SCMI) over SMC
>> - * Generic handling layer
>> - *
>> - * Andrei Cherechesu <andrei.cherechesu@nxp.com>
>> - * Copyright 2024 NXP
>> - */
>> -
>> -#ifndef __ASM_SCMI_SMC_H__
>> -#define __ASM_SCMI_SMC_H__
>> -
>> -#include <xen/types.h>
>> -
>> -struct cpu_user_regs;
>> -
>> -#ifdef CONFIG_SCMI_SMC
>> -
>> -bool scmi_handle_smc(struct cpu_user_regs *regs);
>> -
>> -#else
>> -
>> -static inline bool scmi_handle_smc(struct cpu_user_regs *regs)
>> -{
>> -    return false;
>> -}
>> -
>> -#endif /* CONFIG_SCMI_SMC */
>> -
>> -#endif /* __ASM_SCMI_H__ */
>> -
>> -/*
>> - * Local variables:
>> - * mode: C
>> - * c-file-style: "BSD"
>> - * c-basic-offset: 4
>> - * indent-tabs-mode: nil
>> - * End:
>> - */
>> diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
>> index 51b3c0297314..b33c69a1c22a 100644
>> --- a/xen/arch/arm/vsmc.c
>> +++ b/xen/arch/arm/vsmc.c
>> @@ -21,7 +21,6 @@
>>   #include <asm/traps.h>
>>   #include <asm/vpsci.h>
>>   #include <asm/platform.h>
>> -#include <asm/firmware/scmi-smc.h>
>>   
>>   /* Number of functions currently supported by Hypervisor Service. */
>>   #define XEN_SMCCC_FUNCTION_COUNT 3
>> @@ -233,7 +232,7 @@ static bool handle_sip(struct cpu_user_regs *regs)
>>       if ( platform_smc(regs) )
>>           return true;
>>   
>> -    return scmi_handle_smc(regs);
>> +    return sci_handle_call(regs);
> 
> Is this change...
> 
> 
>>   }
>>   
>>   /*
>> @@ -301,8 +300,6 @@ static bool vsmccc_handle_call(struct cpu_user_regs *regs)
>>               break;
>>           case ARM_SMCCC_OWNER_SIP:
>>               handled = handle_sip(regs);
>> -            if ( !handled )
>> -                handled = sci_handle_call(regs);
> 
> the one allowing this to be removed? 

Yes, it's just switch from API introduced by commit 3e322bef8bc0 ("xen/arm:
firmware: Add SCMI over SMC calls handling layer") to more generic SCI API.

>Are we sure all possible SCIs are SIPs?

Yes, as I see it, for sure for SCMI.
SCI is platform specific and so SiP.

> 
> 
>>               break;
>>           case ARM_SMCCC_OWNER_TRUSTED_APP ... ARM_SMCCC_OWNER_TRUSTED_APP_END:
>>           case ARM_SMCCC_OWNER_TRUSTED_OS ... ARM_SMCCC_OWNER_TRUSTED_OS_END:
>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
>> index 55eed9992c9d..095b1a23e30c 100644
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -328,6 +328,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>>   #define XEN_DOMCTL_CONFIG_TEE_FFA       2
>>   
>>   #define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
>> +#define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC  1
>>   
>>   struct xen_arch_domainconfig {
>>       /* IN/OUT */
>> -- 
>> 2.34.1
>>

-- 
Best regards,
-grygorii

