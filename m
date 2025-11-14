Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FDEC5CE6F
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 12:42:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162531.1490147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJsCR-0006Ht-9t; Fri, 14 Nov 2025 11:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162531.1490147; Fri, 14 Nov 2025 11:42:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJsCR-0006G9-7E; Fri, 14 Nov 2025 11:42:43 +0000
Received: by outflank-mailman (input) for mailman id 1162531;
 Fri, 14 Nov 2025 11:42:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Irg0=5W=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vJsCP-0006G0-VC
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 11:42:41 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 058c6ace-c14f-11f0-980a-7dc792cee155;
 Fri, 14 Nov 2025 12:42:40 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV3PR03MB7523.namprd03.prod.outlook.com (2603:10b6:408:196::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 11:42:36 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 11:42:36 +0000
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
X-Inumbo-ID: 058c6ace-c14f-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=krNSqhnWV6dEJcgfzLzTKZaRjW9HNFxkMhPrsYzyFIwd/nZmDYf/4N60/57uj7rVzrAOWcTj3aCaI+kiAdlTSqlZuuYYQAyfzE+aQ63MNKQx5GUimb8WCzdYOeJ+WqRvq4lClFYumbANHkS53LnHeDeLmNmNnUIn5e3Ui2U2zeq8peEAy3Ojy3vLxPmXQ3WKJVhV5y4pQvd0MOmw+RLTHpJy3+C5ZhATaoaJ8l9k2O5xqOEPpvqZ3JMRV5goh6uFJ58+RGVXzYnA1g2tQzG9FlbxjVo74zKrvjAJdfRvupmtPDj/2psy1tBtlFXcTVvv4WMyI6wiq1viPTlm0qUs9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OfES6KGhUAWg8BoCHuMAly8nwfzvpyHrYnRrMe2892U=;
 b=NCMSNxYdOh6Jlm5e4DcSf2QUSzwtF9R82SL7/2GN9LYi8dsLuld5Kfh/NcRNlOCHt/PnOd8DHuP1TdJI9LE1rwbd3quFR03hwyrHPHKYro/I6H02/9GbeRzmleW4WbePQ0XMhOMfYEkvtmrvau2Ek9qEqJ1WlIaPAUOHgUKhReAKE//UqWy1gV7MpD8jbkO/S1VR2NWmIn/pWak1BUPuI4pCS5WGGwhmzIQslvrpQL3iZHrxwJDWt10Wy+stviwGOqOgViYop+2shI7XSOhmvn3Kuzk4BCeb7kCdGxAidd5LNEtvKEpZI5brE36VNdal6G1kBLTVp2JUT9mxpFGNUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OfES6KGhUAWg8BoCHuMAly8nwfzvpyHrYnRrMe2892U=;
 b=w4FDyukjqgMHF3uOmrt8qwAC8GF2qiKxYwhoVnIzFwmfw3YWfImgM5rjbWGjki2f4gzltSyk+dXlZS1mOxqxvtNT2G1PJ7NhKI37nmcrFcxASA5rGiEMm1xrTwVuMTzZ5Xs/sPdW0NyIpMtdjDzVIBMxBD6p5AdCS/3EWs7lnZ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <468c6686-43e5-4c35-8366-58558f199e22@citrix.com>
Date: Fri, 14 Nov 2025 11:42:32 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] build: add make macro for making file from file.in
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-2-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251114113238.9279-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV3PR03MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: dbad058f-dcf6-4622-2954-08de2372e827
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ekxpM2QzRThCSURFcWdTZlFSTC8wRTZZS3BYV0M3WWV4TmluZS9KYklJRDlS?=
 =?utf-8?B?Y3lwT3hTM3ZBcjJqdnd3NnY0YWwyR0c2RnJVZURlNWhJdUo2U0YyTUtBZG5s?=
 =?utf-8?B?V0pxYlFuZXJOSTdycmJVNUtLbkdHVEFnRlVUaEtxQjJoaXZVOEQwL0xXb1o0?=
 =?utf-8?B?U1VEaXhsUjZaeEw0bTQ5cm02MHJRVG9TQk5rZHptcmd0V09MTEFjemZOdG42?=
 =?utf-8?B?Y1Z2TzZhK1FzNG90LzUrenZyWFMzZjNMMFJpQ2I3eFFicmtKbytJZHR5aVpp?=
 =?utf-8?B?elltamRZTVRRQnNQbzBFYmVKczRIeWxnaGlrbllYcHRkcW9YOFh5SGhuSDRk?=
 =?utf-8?B?WmRrYWhMSThlMEd1WUhPSnRsSVBYRFkwb3ZMR1BBcDRKU1JvN3VEcWFqandI?=
 =?utf-8?B?R0dtclJMRVpPN1czSEVBUHpIdnhwL0o4L2RkTEdWa0lIY1kxOWNKRGJPWlEr?=
 =?utf-8?B?MTUvVnBwQ1RpZ3pHczNXT3FTQ3Y5RU5mMTZScXlDNmRuZ1AxcHRwek01clI0?=
 =?utf-8?B?eVNaS0EvVStvUGpjbXZKMmszUFJaRjZVQytxT1R5WkVVRkdMSmRrLzlYdlFD?=
 =?utf-8?B?OWh2aUhnL3NXeWQzWkF3cXF6RG9jSmJ3QjNGTGI1VDRWVzVkRGMxMENrNVE5?=
 =?utf-8?B?ZnZIUysrMDg1SHUxRHJCM1NWMWpRWTA0aGFid2JWbitBZlR5V3p0d1R6OE1Q?=
 =?utf-8?B?d0xSbE1mWUVJbW5kaDZmN2JMNUJKSjArOXZybWxSWHYvYmFINFFVQVVIckl2?=
 =?utf-8?B?Q2RCenkvZUkyUWtLN1plTUtiRlVDZVpZdHFXSXp3Q3lvb21BY3VKUW1rdEt4?=
 =?utf-8?B?SWVGUHFEWTkzQWVCQndtVDZwUysxOFJSa0E4bVdId0lQakEvTkJkblRnajdr?=
 =?utf-8?B?YVJFUkNaMllCTWp1dTNKRVhBSmJ6UWxtdFA3dkJwVy9vZDRQTHlSSkFHWEY5?=
 =?utf-8?B?aHI0MFdoNTFDdGpUdDd3b1NMajM3dXBzM0VEemYvdWJnaUt2SGtGRFZxdSt2?=
 =?utf-8?B?Q0hzYzNSTWpKQXVMNm5SUytjOFlwczhwSzBmMU1hc1U1MWl3STBGL2NMQnh4?=
 =?utf-8?B?enRlbUFUTENxUDI5NERYc1ZodDN0Szh2MFlYSDdUVGhETGtRSGJmWkE4dUg1?=
 =?utf-8?B?SURSMDlKTXprYW5mRGRwOHN4Z3oxRGdBVkZNWi9JcWdHaU41ejJaSjF1M0RF?=
 =?utf-8?B?ekhpNjBjOStjTkpvV0diZDlRNmhmOGlCSUIwWlFqZVlhYVFpMWY2Q3dVZENZ?=
 =?utf-8?B?RW9vVERJd2ZQNnA3d291Z3BsZHlLWVZuZW5MOFNRajd5ZXEvRjgydXgxWlhB?=
 =?utf-8?B?cGc2OUpJRkdveEp5by9NNDB4M3NJcWFPSjJqZGdWUDRZMlpucHNWQ0JWZGdJ?=
 =?utf-8?B?YjFCQ1dpeGx4U3IxcDV6bVNPZ1kwVzJ2VVlhVEdzTm1Vdnl6eDNCTTdWZk8w?=
 =?utf-8?B?V1M3QkJ1NDNyT3BtWXc0c1JaL1psQ0NEWDU4aUYzRnVLaUU4ZDhBcTMyL0pl?=
 =?utf-8?B?RWVyWlpVU2JaMG16WWtuV3lxb083N1NKVjZabW1YcDUxdjN3T2szeElOQ0xu?=
 =?utf-8?B?RSsrUUdya0NtQUFXR25PVGF3VzZZU0dqa0syNzJWRjFqRlVRVTFkSUhoaUtV?=
 =?utf-8?B?VnRqdUIwR2Iva2w1WGs3b0VyeVkzdkhPWUNOMlVaTVNoSlZhNm5rTWdmSUpB?=
 =?utf-8?B?SXR4Z1FuZ3NhZzkyOElsdVdOWElwYU9OVkZrc012SnZONFZ6MDdCNER3WEVL?=
 =?utf-8?B?aFdDaEJqbEUvdTZjYUJHdkh3aThlYlM3WmhhZVp3a3RpbG1rS0dScHUvaENZ?=
 =?utf-8?B?azhIU2kwait3OUxzS1BrRjVzUDRiSDM1RThWK0x0aG5MK3RXc2NVM1R1amJI?=
 =?utf-8?B?RUR0cXJPeEljZUNrT2YvYWlWdFJuVmhtUTNuYmVyYWRaL1RSM0djYVdES0cw?=
 =?utf-8?Q?1KqdGIJaC4O8lNNeO27PDpIJ8HBFilLX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?am95MmtTakR6aHhkcXdVdWl4THZ4anRQTDFaNWpZSjJsSE9MK1NGUS9pSWhj?=
 =?utf-8?B?UFpFY2RkTjJkL0dzanV1SzM4cmRjZldacXVpMTh0WVZxM1cwanlhbVJMOEtE?=
 =?utf-8?B?Q0hSQUU1cEhLa0VrNEVYdUxLWWEvSnZYMzVVakVhOTdIQklGQ1BTZ3lNQ00v?=
 =?utf-8?B?MWVrNWhaVzN4SkJsL0ozU2hIQ0UxZ3Bkdm90aEFRRjdWK1dSczlYazE1aTZ0?=
 =?utf-8?B?TUlaUEp6Z1AvbHdIQzVsaGJ6Z0x5ZGtobDNOS3ptVGZDUVhZOEh4TDEyZ25Q?=
 =?utf-8?B?bkpreXIxczRlcDFHZXMrS0I2TzcwYkhtSGlpUEFQK095bG9nYS84eVBNM0Jz?=
 =?utf-8?B?L1J1MWl1RXpVY0xQYXJJanpwdmk3cTFnd2VHZXIveE8xcDVvOWRRa3cwM0JO?=
 =?utf-8?B?ZmtQaGZRbkZWMzErVTRGOFdzY1RKWGFWNGxINDAzZkVMNG9XREdZTjFRSlYw?=
 =?utf-8?B?ZnU1Zng4ditDNHRmdHdTdWFkcXBmdUc0YllRS2dib3l3aTJlR081SCtEeVNV?=
 =?utf-8?B?OFlMNmdSakptSDlHRUNGTkZiSkdOd2hBb0E4bGRaaFNQcXFBaWliOUdkS3FS?=
 =?utf-8?B?UzlJU3p5eG15MU5mVTl0WHE4a2k4ekV6ZUJHZmtFRk50OEFUWTNJWGJMemky?=
 =?utf-8?B?eHhpNThuWGpVTXMvTGVGaFFWNEVsMEJWVUd2OEoraWpKZzZMQWpxdXZJa2pp?=
 =?utf-8?B?MXVoczJyN1Jza29HeG5yTUZuSEhGNERSbHdubnJheEFoM3l0WEZvTlJkdmp3?=
 =?utf-8?B?YnNwaDB2eXcweUpwK1lVQjBxSG9iSktTYkRrd0RrRFVSTHM2Q0VrMm1OcEdy?=
 =?utf-8?B?NUEwRDJicmxlUktUZEpXUElUbGNFTk9Ha3VyQlVoKzVGWWUwMXN3d3B5Q2lI?=
 =?utf-8?B?dkt6dEoyVDNYK0xVajk5Ymdzczd6NVBpVmswQk1RNzdJYmNscFFUUWpWZ04z?=
 =?utf-8?B?enV3eitiT1lvdGppaXJ1Zld1eHNMN29peG1Sem0xbkJ1ZWRYdkcrdXRaYUk0?=
 =?utf-8?B?cTM4T2Z3SkRJcDNpTDJuWVMxVTdXOXJpblc2bUJFRlArZFFVU2lpdjY5UG1S?=
 =?utf-8?B?K1hLS2xsVnNPN1c5TGpPWjgrMHU5RUhNdFByWFMwdTZXV3hqdXNqWEhRdTFB?=
 =?utf-8?B?b1Jjd3pjckFacmVNL1B5b1A2cXhJbHU1MU0wUlU0a1huYUtJWjBkYVVkditE?=
 =?utf-8?B?YlVkZTZBbnIwL21hYzlSU25yWS95Q3o0QjRUZ0duTVVlR3dDdzFCcFNWOUdm?=
 =?utf-8?B?NnFZcE9uMjJIMnoxYktFQjU1QnhseHJDZHMveWZpVElVcVdRVnIxUDVVZzRw?=
 =?utf-8?B?bTZXeGhNQzRUZ21aaU5DWUFoMkl4NkluekR5SkZOWnpBUDVVMVlvK2NCSCt2?=
 =?utf-8?B?c2tvZ3pVN3FReTdhOC9ZSmhrSUJKbjA1L2RoSTRjZGNNUEhTQ1orckUyWGxE?=
 =?utf-8?B?eURraFFmT0ZLREptOVB2dllpakp3d1k0NnVlaHVFc2pMVFZJdll5cHJ0ZXBy?=
 =?utf-8?B?OGJLcHlRaGRxNjlpbnlGbDJTakt3V3pmeWFiSVpHTDRyZVlDK1U1VVhJN2hj?=
 =?utf-8?B?cU83SzNNTTBvT3VLN2wxbWRyMkpSLytURE9zN3JCWHJEejIvWXB6azNZYkI0?=
 =?utf-8?B?aXdnc1Q0OXJ1dzhmcWxXVENqOEJLRitXOWh0NVA3SHdkdkN4UUUzcHhLYXlX?=
 =?utf-8?B?MHFoUWZSS3lvTWVUdlozeFhDQkg5b1dRdFl0SW0waGZCZnhlNm4wUlg0Q3hr?=
 =?utf-8?B?TUFvb05hV3c3YjFiK0NIV1cxZzVFVDZIZUQzNnA0WkF2eDNOVXNrVVcxSEpp?=
 =?utf-8?B?a3B4ZFppVzlKWGhQLzNWOGRBRmIwWmxGUmF5NTM2Wm9pWDRkVXgzcVh5SVFM?=
 =?utf-8?B?QVdRTk9tb01CTnYzRnJVSDkwRkFzczFEQ2tGcVBFbG45aDlpblpYbDZ2UU9U?=
 =?utf-8?B?SWh4MmpUcmFsRHBnL1hZMEV1bnB1QkNMYkd3amI3SisrbDNvd1lFaGZRNmRr?=
 =?utf-8?B?M2dCUGNPZ1A3Y3JCZG5kY3lvZUZsdEZPRDAxdmt1Y1Q2WVpoM0VQdENBRWdJ?=
 =?utf-8?B?SG1hTHNaajY0QURpVEk5UEpzeDZhOU9nRFJObC9ZOGRPVlZ0dkVhc2dhYkJ6?=
 =?utf-8?B?RzI4Q1hmMlUvQXdpRy82ZEtPeE1pVzVIT00zc1JLMndBUEt3SXY1Zk8zeXR5?=
 =?utf-8?B?T0E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbad058f-dcf6-4622-2954-08de2372e827
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 11:42:36.2783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38ipKlxE4L24UDe0L5OcS9V7BrkfcnrDyUITkKHZrvAnBGvNWoZMjwOyV/BiL2DUYWMwrygN8y76qQD+a9Ae5SZoTcIcVst4xOotMDkoAyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7523

On 14/11/2025 11:32 am, Juergen Gross wrote:
> diff --git a/Config.mk b/Config.mk
> index e1556dfbfa..d21d67945a 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -159,6 +159,19 @@ define move-if-changed
>  	if ! cmp -s $(1) $(2); then mv -f $(1) $(2); else rm -f $(1); fi
>  endef
>  
> +PATH_FILES := Paths
> +INC_FILES := $(foreach f, $(PATH_FILES), $(XEN_ROOT)/config/$(f).mk)
> +
> +include $(INC_FILES)
> +
> +BUILD_MAKE_VARS := $(foreach f, $(PATH_FILES), $(shell awk '$$2 == ":=" { print $$1; }' $(XEN_ROOT)/config/$(f).mk.in))
> +
> +# Replace @xxx@ markers in $(1).in with $(xxx) variable contents, write to $(1)
> +define apply-build-vars
> + $(1): $(1).in
> +	sed $$(foreach v, $$(BUILD_MAKE_VARS), -e 's#@$$(v)@#$$($$(v))#g') <$$< >$$@
> +endef

Shouldn't this write to a tmp file, and use move-if-changed?  Most of
the time the markers won't have changed, and we'll want to short circuit
dependent rules.

~Andrew

