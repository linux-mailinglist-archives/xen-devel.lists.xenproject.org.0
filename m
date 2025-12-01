Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF573C9847B
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 17:37:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175911.1500503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ6tP-0000tZ-3K; Mon, 01 Dec 2025 16:36:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175911.1500503; Mon, 01 Dec 2025 16:36:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ6tO-0000r0-VX; Mon, 01 Dec 2025 16:36:50 +0000
Received: by outflank-mailman (input) for mailman id 1175911;
 Mon, 01 Dec 2025 16:36:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oG9V=6H=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vQ6tN-0000qY-Gn
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 16:36:49 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edc226d7-ced3-11f0-9d19-b5c5bf9af7f9;
 Mon, 01 Dec 2025 17:36:48 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB5879.namprd03.prod.outlook.com (2603:10b6:510:35::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 16:36:44 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 16:36:44 +0000
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
X-Inumbo-ID: edc226d7-ced3-11f0-9d19-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Up3x++qvPJtrKdwKIalZyOcpAtg4tYLfwhg+pXgG2vGq6VRtAXYgwbpLKpyy7lL4FTQflc6PjAoMyOO68T8m8CuF01ZvrC/VPrSMaFS8eVms806lgeBUqNHbRGL9fv6yDYLIffRDJ8bXsauhq1VZDrpuddSbkqk9I1ZG5jrUSxBo+LxBRfz9jKEyzSwg6Ci1QMIAu6QBImBFP+WmMv+E/Lij9PGsY8IEBxeva693tllpb6zU35SQJOUqCM+ITLrjx2BpmBHrlfSFLhQ/Zp7zWveUtIJUdEDH2ZRmQTRBKR9CPUK6m4DizhAcfWzQsAFt3bluDwxTQyySQDIENVv/Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MFy+j7j4204PdZF6ILlsKZQuXZNe/sxvfyKULuusmVI=;
 b=pqL+fanX+eeH3c6VyiY8QYduNzHXodEdiobh6TnwRsbtkcKmHLtwBQ6kRsgmva9hS/xqgh/VndkMAa6TCgokcHHfd2gMSRh7AXXlVl+6UNiPXc3QMoHrnjAMJ9ZP6colLo2VmN3hvDopL9CZJxhOJpSo9ufRxLEDPZ35f1QNnzMhiz1n9n5nEbAlv5RjgVpdIMIn0NlSG2PXgjc62BTIt/0cN8UCTAKmTke+2wWB9B4Fip2gW8EPcsKbVxR/t7N24pvqhrXbTO1TLGMCP2fs7EnVdIPZeizuQmwWi+KI3/Ww5ubQ+qQCcq5j+d1Rze8p56JuA1CAUpZISPBQFlNziA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFy+j7j4204PdZF6ILlsKZQuXZNe/sxvfyKULuusmVI=;
 b=TaMB/HRrih8gz7n7E5sgPt3PYGj7FeUHmKXeUzoEZ8hY20vScS4LbANyrilQlzjLBoj+hlAy8MYEJvD/HktMxk5g5jj9b90sOb1LY1hPoLwqi7EVXy04at+AR+oVZdcsNKUka9gtoRDPV987escrMmIuZt/gTETRK8Mu+ESQjSY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <331118cc-9c2d-49dc-aa5c-b6cd0d4e6021@citrix.com>
Date: Mon, 1 Dec 2025 16:36:41 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/hvm: Unilaterally inject #UD for unknown VMExits
To: Jan Beulich <jbeulich@suse.com>
References: <20251128174735.1238055-1-andrew.cooper3@citrix.com>
 <796dccdb-0cc4-4904-b776-d651ebb012c2@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <796dccdb-0cc4-4904-b776-d651ebb012c2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0141.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB5879:EE_
X-MS-Office365-Filtering-Correlation-Id: 897b8903-c52e-4d0b-9971-08de30f7d04a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b0gvMk81SEIrK1NlOUl3MDVObjh1T1JLZDlTSFE0WnpkQXdwaWw5cHRSUUxL?=
 =?utf-8?B?UmsrK2NuWTRXK2JFWmVjRnFHTXk4cEtKSmJDN2pGTTZ5TEc0cXVTaStHMVJT?=
 =?utf-8?B?UVRPZUpSdEdlZ0pSa2tvc3czNnJFeXJiVDBxMjRIeU9jelVNd00rM3B6NVVB?=
 =?utf-8?B?K0oxdFg0WFloWlFmdzZPRWFYQzZGd2pWdlpFcW1DbGVweWVPQ3BibHI0UlBr?=
 =?utf-8?B?R3ZDSCtSaUNRNTc2QVNsbnlSTk5vMExWTWthZTZ2Q3ZVbk4vSWNlU0RPQlds?=
 =?utf-8?B?Q1ByOUlET0tjSkxIb3dmWVlONUxObzAzalNqTWVDUXF2TkY3cTMwOS9mVEJw?=
 =?utf-8?B?Zkg1bEhVR3N3UkZIR2NLVGJJQ3JNWXRPclBwYW54UXJ3SFFiK2ZydUxCb0dW?=
 =?utf-8?B?VHdVRkFyQ3NGaUxSQlp6MTdCT2JpaXUvUU9PMlVWREgzQ1U2MHZPOThSeGdR?=
 =?utf-8?B?cUVnazFpZlNlbjlIRzI5QXhVZzBoTkJIVnpBa1lpcU1CUDliRk5VSEhCSDNr?=
 =?utf-8?B?Y1ZlRStaNTdJYjR6ZFZsMTJSTlJpOHRlY2FlNWtQbUZDTlUrMi9MK0lKcjR2?=
 =?utf-8?B?L2M3ZXljS1lNTTlNcmFLVk9mKy9rRjN5RW1uRFRLajdMU3gxV09HeWloK2d4?=
 =?utf-8?B?cGU5eG9FMXZsemJCeTgydWpJY25PVWVkT2QrTlZnM3Y5MXZJVXd0VEFKWG1E?=
 =?utf-8?B?NkNEVEZYK0lZWXRzMkJSYmZmeXBHNGI2RkZ4RVhlQlRYaDE1UlIxNGRQU2Rl?=
 =?utf-8?B?ZHJEU3Z5VncvQnVscXlNNkV6QjhqMzE1VkNxYVR1bURwZVhVQlpKUUVzRnVG?=
 =?utf-8?B?d3Zjbll4RXA3b2VQQ3BxM29wUmlOLy8xZHlHZURlYm5CYmdod3ZtM1BkeDJ3?=
 =?utf-8?B?bUs2enZnNkQyclcwekZRUUhvRFpCTHFwcVJmK3ZGRDd3UkJEN1Z4eUdMR3Ez?=
 =?utf-8?B?Y2pPSlVGcGJtNnlibzhWcllhVHpZME52bGMxSTNMa2FFOEFoN0ZQRHIxNmta?=
 =?utf-8?B?RmF0MXlockVvMWJsRytTeXg2c09xbkZzTHlqVVFYcHoramNqZzRjZ2xyalhE?=
 =?utf-8?B?SStNVzUwN1plYnpWTGZ6Rm93QWJqZ0lUdEx0cFlWcVMzVWxUUytVNmpNOFlY?=
 =?utf-8?B?WHRNc3VkM1VWamZsNnBLWVZiMjdFa0VGbFVoVTV2MkptYzE1WlBEU2xWRnlX?=
 =?utf-8?B?UktHbXFEZ0xsazczMGo3RVVWN1A4b3JaYXRsNWVyOFRUa1JFNlBpNm1FbXNt?=
 =?utf-8?B?clRMcUdxNmk3WTYxeW9hb0xQQnBBVEtuNm56UWQreTZHQ1pXSVVraHZyY3ZN?=
 =?utf-8?B?Z0IyNDZTa3Q2SVRtaEpCQ3g3cUo3bm9PdmI5NTNnRHFoOHIrdk9lMGFOWVBV?=
 =?utf-8?B?bG9sL2tUSUNXNEV1MWljaVp2UzFiRWRxQTFJSmt5SDVXRmZ1ZDVvbkhZZ0tR?=
 =?utf-8?B?TXRxN2FSYWhuQzhRMnZpbHRyOUduQW05UEVja2NYY1BLVHpTUEZ2eG9CaEZn?=
 =?utf-8?B?TjB1SEhrTTZ6bXR0ODhUTXVkcUpQaVl5SUdrNTdKMmdLQXQrUUpqWmliT1Bv?=
 =?utf-8?B?NWlpa2lXa0tvZHFyNCtMNEtDOVdCR2JHbURlZSt5Y0hQR3R0R1FGWk5aNVly?=
 =?utf-8?B?USt4U2pBRW13d1NrNCtPa2o5emcvUXNjTU5SNnp1Y3NsdnhVZlJQU3ZtQktw?=
 =?utf-8?B?SG5rNEJycWlsQ2EwRTN1TEo1WG9HbExWQk45cnpyREpPL1R2QWM0dlRNa0dW?=
 =?utf-8?B?VlFJVnNsYzh6SXlWa01qZDcyVXFkRWJBbVdwenZvUGtiaGhtb3RaYUgvdDlY?=
 =?utf-8?B?UWowVHJlUHo4UlVQakhXREZMMTNGWG9BM016djQ1QVNCUEJrd29BQ3E5TDhr?=
 =?utf-8?B?TmhzT1N6MTVscUd2UndpZHF4V3UzalhjL09lSFpLSitlMDAvdDRVNDBwVE5N?=
 =?utf-8?Q?H7gn1ytZsM+64s4XfonVR7fI9GU5KPTJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1orWHM1ME5pZ24vODUwck9WUHRpRWpmU0FJZVBrS1RHY3R2UmQrbFUwWkQ5?=
 =?utf-8?B?Y1QzWEFWNnZvQUVIa0w2VkVGL0szZHp5MitHUnYwb1hZdGsrT1RlKzZLeklP?=
 =?utf-8?B?N0JwYXNlblNDREZJc3FpRHczam9VSHFTVExUL2FTTjJXemk3cmg0bXlXQTZm?=
 =?utf-8?B?L3pTbEt0WUVkYmVPVDgwMWV2WWNGd3dQMDhqYjYyTU8yNDZTOVZmQzJlVCs1?=
 =?utf-8?B?SXZCVDRXWWh4VEpKdDNLZlZyRzE2b1FVWTFzU0t1K1ozUDRoMEgwZjhYVkhp?=
 =?utf-8?B?cWh2TksxQXR6MGRBMGJuVUEzdHB3Q0k2TEZXMXk2VmN5eTRnRFF0Wk4zQ0pK?=
 =?utf-8?B?c1ZNL3FIOFRPaUdrZUlUeTc3TWpRY04xbzZ1SmRrbjNlM2s2YzU0OTcyQ0R5?=
 =?utf-8?B?ZFlYSEZGa3hpV1YyY1paS1V2VExIcm5mQUtjbzkwemRZTnlmQmNaMEQ2cGdw?=
 =?utf-8?B?TG93OTc5cUNxaGgzbTBuWVJnNzFMQ09TTUhIVXRkbjUyU2xnZ24yUS9FRFV2?=
 =?utf-8?B?UHBnSjRCWXJNY0VKazlUV3c3Q3dMMlN0NjBjVCt4NUVtYWYweUE5QlZaOFp1?=
 =?utf-8?B?OTNtUnJCN1pLb21vY01MWkRkOGY3dVdsdFMySmkrQXN5NG5XMkJoWEZ1T1h3?=
 =?utf-8?B?VkQrMERYcnJOU0RNU0pHbnc2em1IcVNsR1dNSFZ0QkdVRmgrSUVNMVJBakhy?=
 =?utf-8?B?YncvK0lBRFVFTVduV0tBdlJhTGJ2blRHUTZBVmJFSnZSWWxSc1pjS0M2bmxl?=
 =?utf-8?B?Y09mcEcvNjZicVlDd01vTE0rbHM4ajk3ZWhZR0g1a0diRDF3TGE2aDYvelJj?=
 =?utf-8?B?NXpXZlg5UTdjSklrTVFydndydjNPYmNGOVkrRmd5bjlzbjlweVE1a3BITDdW?=
 =?utf-8?B?L3ltNVlORUVBMU92eFRWYmtBSVBydGlmT0dsZDZGdEhBTmFLZUtHU0FEb3F4?=
 =?utf-8?B?ZEtMYzN6R1k5Q04rdTJQdFAxQVlOcUZEU3BpRVd5alFuV2tUVGIrVjRSL1pU?=
 =?utf-8?B?bE51UktLNXVhS3ZjYkVyL24zb25QQUdydVROZmp3aEZoUXNTTjZ2SWdVT1I1?=
 =?utf-8?B?S25oMStDRmNiVVlMeWRwbDlJazhvY2Z2VVRxVEtxVWxINkp6NS9yOXBMTWFt?=
 =?utf-8?B?T1lpWk0vSW56QmppQVVkaGpDZ08rQzVuWVpOOURtTER3d1I4ZUdPZ21hbkFw?=
 =?utf-8?B?NU1BcWY3VTNMTzBmODMvWFBkUnZzMzNUY0IrM1diZmhnekJVNk5FeFlZR25S?=
 =?utf-8?B?Mmo1SEFDaHM2UVNIZ2RDdW1vbGVaQVVQelZxazVWMVNnQldtRFByeEQwUkhh?=
 =?utf-8?B?bmxFYklPNUJSQzl4eTRUUzI3OUhMRTNXTDRCZXJkT3lhTHdCODlQNHBIMWZD?=
 =?utf-8?B?ZEV4NVdLbVhYV3g4ZzE0ZFhNZkwxQlRIVFdmWGlDczdtV2ZXSUlZTkZFWkxq?=
 =?utf-8?B?TWsrOTc0SWYyNU1Ua3RmWVpkTTZzZGdOdHdPOGtCZlkyVkhHZ01GRCtBdEFR?=
 =?utf-8?B?My9rVmgxbDd5bXNHbkdBNjJXZTBJaVJ1N3FQU3R3ci9CMWRYYkc5cmV6eHZJ?=
 =?utf-8?B?L3R0dVk5VkIvUnVnVSttQzdLa3pBL2FIcjNzaWxMVjUrZXEyRWhjdzVwODZy?=
 =?utf-8?B?WW1rMjZpb0M5dUljOW5sZGpFcTB2U1VaeFVuRVhBQjUzTHd6Z2JUSU1ZWWZC?=
 =?utf-8?B?VC9IZWpqS3FITlp0OWczSjg5V2FSM3B6VmFmTUlURnRJc0ZYRWZQc0lnUHJS?=
 =?utf-8?B?TkxnTGJ5Q1FQYnVMSnZvc1UyZUF2MFRrSGJFWXZ2TlhmcUYycjN4dDl2cFBs?=
 =?utf-8?B?RHhJVnlWMS9OVm90Z3VKdVV2b0pESjBhaU5QN3UzbVNadTNmN3V5UTdqMUo4?=
 =?utf-8?B?azE3VWs2TitIVkUvK2Jib0R4RmZOY29uL0dCcG1ZODJpYlQrNUdVQUZYZ2tC?=
 =?utf-8?B?ZCt6UDJ6S21rZ2xwN2hQVVgrV2RuK1oyM3lRQnRRcDRrQzMwYms5clpZeHp3?=
 =?utf-8?B?MUhjekJWUjcvMnVvOVRRTU9pQXZFTWxJZUIvdmVwbFkwZFNOL0RzeVRkR3VN?=
 =?utf-8?B?N20yUmZGWER3NTNiVVdOL3hQdisxNk91Rm1XRGNUV0VJMmEwejJ4U3hFS08r?=
 =?utf-8?B?akZMTnpRVWw3ekRlMDhvWDdncEZhN0pkSVc4UzN6UjZsMDRlZXVJQnpGNENi?=
 =?utf-8?B?MUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 897b8903-c52e-4d0b-9971-08de30f7d04a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 16:36:44.4281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9fDEmGtoKedoZVXKhByzG/KMXpgSM1LUzBbnc/JIHz5desh1386QoRGatfLfsWInUGiHp3hlRkPc1fSqwKzytLObaYia1mYfNn/StBIt4I0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5879

On 01/12/2025 9:02 am, Jan Beulich wrote:
> On 28.11.2025 18:47, Andrew Cooper wrote:
>> While we do this for unknown user mode exits, crashing for supervisor mode
>> exits is unhelpful.  Intel in particular expect the unknown case to be #UD
>> because they do introduce new instructions with new VMEXIT_* codes without
>> other enablement controls.  e.g. MSRLIST, USER_MSR, MSR_IMM, but AMD have
>> RDPRU and SKINIT as examples too.
> USER-MSR has MSR_USER_MSR_CTL, so doesn't fully fit here? (It's still not us
> to directly control exposure of the insns, but an OS would need to use the
> MSR to do so, and hence we need to properly handle writes to that MSR for
> the respective exits to become possible.)

Oh yes, and the #GP from failing the MSR_USER_MSR_CTL check take
priority over the intercept.

> MSRLIST has a dedicated exec control, so whether the exits can occur is
> under our control.

Ah ok.


> RDPRU and SKINIT have dedicated intercepts, without use of which the
> respective exit can't occur aiui.

Correct, but note how we intercept them unconditionally?

MONITOR, MWAIT and SKINIT are for Xen's safety, because otherwise the
instructions would execute normally in guest context.

RDPRU is to block access to the perf counters, because a guest has no
legitimate use for them.

There are no enablement controls for these instructions.  They're always
guest-available (on capable hardware) if not intercepted.

>
> IOW it looks to be really only MSR-IMM which is special.
>
>> @@ -3083,8 +3067,13 @@ void asmlinkage svm_vmexit_handler(void)
>>          gprintk(XENLOG_ERR, "Unexpected vmexit: reason %#"PRIx64", "
>>                  "exitinfo1 %#"PRIx64", exitinfo2 %#"PRIx64"\n",
>>                  exit_reason, vmcb->exitinfo1, vmcb->exitinfo2);
>> -    crash_or_fault:
>> -        svm_crash_or_fault(v);
>> +        fallthrough;
>> +    case VMEXIT_MONITOR:
>> +    case VMEXIT_MWAIT:
>> +    case VMEXIT_SKINIT:
>> +    case VMEXIT_RDPRU:
>> +    inject_ud:
>> +        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
>>          break;
>>      }
>>  
> Should this be brought more in line with respective VMX code (kept) below,
> in never bypassing the gprintk() by any of the case labels? Basically
> meaning that the case labels you move could simply be dropped for the time
> being (or else, like the INVCPID one visible in context below, would want
> re-inserting a few lines earlier).

As said, they're all reachable by guests on capable hardware.

I could add a /* Not implemented for guests */ if that would make it
clearer?

But, we don't want the printk().  We know the labels are reachable, and
#UD is the right action.

~Andrew

