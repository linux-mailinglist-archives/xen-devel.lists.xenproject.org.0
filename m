Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DCABE41E8
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 17:07:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144561.1477926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9PZV-00081l-I1; Thu, 16 Oct 2025 15:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144561.1477926; Thu, 16 Oct 2025 15:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9PZV-0007zY-Ej; Thu, 16 Oct 2025 15:07:17 +0000
Received: by outflank-mailman (input) for mailman id 1144561;
 Thu, 16 Oct 2025 15:07:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NIav=4Z=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v9PZU-0007zS-A4
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 15:07:16 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb4e4b71-aaa1-11f0-980a-7dc792cee155;
 Thu, 16 Oct 2025 17:07:14 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by LV8PR03MB7448.namprd03.prod.outlook.com (2603:10b6:408:182::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 15:07:07 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 15:07:07 +0000
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
X-Inumbo-ID: cb4e4b71-aaa1-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iwj0iq8Nr9CdV1weKZq44RVL2rdHCT+/B/a98tXyaykIOF6bgZ8vQXzvCGKXRi789U+ntWBjbnWEC18Pp7tdb/qTdfVKIb2xfS63rDbvNNJbyFp36ze1jy2DcNwlqqTTUSfhTbNExEv4/06yfMFf7/2HZuwAb9JZ7GMhAK9JFm5p3xfjobFRYxWBymRJz5LMWceWmzYSsB59JjaPTT5GOXoL9/10wFS0EJ30YpR8+Wp2h2u/GLQN1SXeKm59K4KLWlQsuqNK8QVWgcDsvf7X/TrG0ACToFwLFpAhU+TD5CSpL86WDaJrX5NC/6Mk3NntnFEm2wr1mvKa0fKzm1PxCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bl469f79AQB426gIggW5HVGm2UDkvhKOGqmmQIlWQf8=;
 b=Bgp7fYc+YWS316GMCJK4LpFVDvGiEAOfTAaxclDAiiqjXjOizGzQtxhWihmX2e7jYhRoLzwb9eRZZioA7Wr6BJpI4u0EYcVZ58z18qM9oYjJzpscb/9qBD1JD0UuTBx3fKX2tpQF0LEMbpAYDfA0tckKjj93YOQz6TLFaPDXHEO/P1GLiffCzOhWSqweWeAEbfFtMIJ/zThyCfCAM8OtYsOViSTF3WoEFgDKGFkZ4sBXneJZxj9yauHaVMLSd8vdLaE/RpdCs5Zw2ngQzaDc2rP2fBJrH0LPL/9ppm1uAx2OECtQhPaqQIOf3s0XrM5fRqslmanviszcyQ4zdN/jIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bl469f79AQB426gIggW5HVGm2UDkvhKOGqmmQIlWQf8=;
 b=cW/pPsPKKR+dZow9DMSjGvX1LHrtDweM265ZSZHY10yV/ED9hsYi6pTHHHqamAbllaQMZQe0g1LnJd0wuNJ5yqRvd9oupeSk+mD9UuEtylAwF6xYqOiSJbpa2QTDOEU3cuuDv0AU8C11BrSZxRcwekn7K8K89f0ZNlypMjPitbg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Oct 2025 17:07:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.21 01/10] x86/HPET: limit channel changes
Message-ID: <aPEKFwPe-PiHh-Ay@Mac.lan>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
 <494c897c-a138-4d16-93b2-67e3aa8d41e7@suse.com>
 <aPDH4-ZEfJ9LGc9J@Mac.lan>
 <14bb12b2-1a01-49a8-be9a-6a32c3729e9e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14bb12b2-1a01-49a8-be9a-6a32c3729e9e@suse.com>
X-ClientProxiedBy: MA4P292CA0012.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::9) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|LV8PR03MB7448:EE_
X-MS-Office365-Filtering-Correlation-Id: 35693e34-79f6-4ca7-9ce0-08de0cc5ac33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXE2Z3c4RUg4N0dWTFpvSXNhTi9RdDZSUFhNQVdRWTU0UmVuMjhnUExrZWZI?=
 =?utf-8?B?ZW40WlJlcU16SGtleEFYSUVORzNJVmlGZFZTTmtKdmptT0pPcVZMMHRxcnNI?=
 =?utf-8?B?ZlFMaW02MW5zcmI4UWIwNmZkcTRoS1Q2ck8vWHZlK1hXWXExOXBpUE9FS3ly?=
 =?utf-8?B?MzZucnhKcVpxY09wbUlZVUd6ZXZtT3JNZm1qOSs5VzRZTk5LVEgrOW9ocEpN?=
 =?utf-8?B?U0pFUEU5empjakVaTUFLTmZBSnNPQnpuQzg2V2QzdDdPMXdVZGxnMGhhVklT?=
 =?utf-8?B?dWRwcHAyaWRJcVdiNGduczJ4MTN2QkRiYzZDM0s4b1ZCem5ydXlEVWp1bWhX?=
 =?utf-8?B?eDBuQlJNS2x1ektHU1hlZjR0NlQwUkJybDJ3QjlVSUJGenY4OGh0RlhuaWx6?=
 =?utf-8?B?YnZBOHVJOThUaFQ3YXI2NUZQcWVPL2VIdHpDR3dpdE1vdk45aWVpbG1FUG1p?=
 =?utf-8?B?SXhlZElWem5xd1MyNEU3R3JuQnRmSHNaYTd3bGpDK2hCc24vN0NWOTNmQ3RR?=
 =?utf-8?B?emoxVXh6bWdBbTRGQjhSTzBGdVVFdmpQUWtZK0R4dHo0NVk1VXZ1TGRZUWp3?=
 =?utf-8?B?NjdYM0JXRHFuSDdqdnhzQUZjdHZSUDlTWk9NdmRYRmkxL0pWeFVWcVJPK3BC?=
 =?utf-8?B?cW4vMWpVKzBIZVhJWGNGWkVDWnVmUXF1ZGRKRHNtSWNDdk1YOEo0Q2hqK0ZG?=
 =?utf-8?B?dHZTZlZtQlp0RXpDYi9icXN0Vk91eGRHYVJPNWNHVGh4M0h3QUVXM2FLeXdY?=
 =?utf-8?B?MGdJS3F6ejZoUVErZjJTdndscVR2VWZ1S0dWM25Sd3I2SmJEWW53clVXYlg5?=
 =?utf-8?B?a1ZOb3BINHY3cjZMcFRmdWlYQWNERTAzRjkrYWk5VVFReXkwQ25VN1F3Q091?=
 =?utf-8?B?VkdwZnBrazUycWYvWjFYTzBuUlJ0Yi9PSXMyd3FsdWxpbFcvYnV2ODdkRGpo?=
 =?utf-8?B?T1c5UTdkYTliYVIxL2p0S1BRYzBaako2Y2pkVFAvbWl2dFVPSjhxY2taQkVF?=
 =?utf-8?B?UW54VEJHY2V3REdrUFpkVldSZEpyaEN3TXFiMTZVdThqaVJXN3crek02bE9C?=
 =?utf-8?B?RG41L0UwUnhPK3EzTDZiV2pheUYvZmhZdkZRM1I0dFFmRHFxUmZ3anN1OWFk?=
 =?utf-8?B?UXJjeXliVWIyQkVkalZuVTQ5THN2eFJKYTgyZlJZRG95WmRkalUzT0ZiRVVP?=
 =?utf-8?B?dXpQQXRrVERQMEo0QlM2RGtKdjJ3N1ZGVlBiOVFzQ1JWMzhtWmNyRlRmYTFx?=
 =?utf-8?B?S0x1V291MlhaekhzRXhHRGRJQWdVMUZvNHBsNUhUN2dieDAyT1dWSDYrRDN4?=
 =?utf-8?B?ZFBFQWRCSEpTbVpxYzRZZk4zS0hyMHNETzF3aDBPa2N2NkE2aHNqaHBHaWcz?=
 =?utf-8?B?SWRuNVBCZ20yTlNZV1FFREF3TDRjV0NOZ3U4eklnZExpNUhKZWJqL2ZrN1FR?=
 =?utf-8?B?T3dCWVB3TTV6SmJRdkRBRG94T1Z1bXdDbWM1YzNVTzZlTUs4VSttbTQzUEJL?=
 =?utf-8?B?Tno3OTVVQU4yRXNTQjlFYldraDU1ZHR0aXpLaTZCWDRDOFFpV3VROUVXL2hm?=
 =?utf-8?B?OUtBaE9Td2U5L01DTmhscVF1RDFvcXhjYmJwQ0d2d1pWa1JURmo4U1h5djRH?=
 =?utf-8?B?bURlcHJyNDRFWTJXMnFNOXlNaDk2ZU96Z2lVOE1vWUsrb0lxbTdCc25lYW1w?=
 =?utf-8?B?MWt2TkdqcnkzcjN5S1pTcCtTeUJUelJuM1ZSZW96UkFFU2Q0dE40bjlFZkEr?=
 =?utf-8?B?dVRsNllwNXRCbGY3c2RXLzFFWU1yOWwzVzh0ZjNNUVpMdnlRQ3puRDV0NmlM?=
 =?utf-8?B?amtKbjVoSmdVVlBidnlOZS9LQ0JLWFJrWTdDRjlGL3Z5bFdPNzh5YlhVdUdO?=
 =?utf-8?B?RHd2Z2FYR2xLL2lsVmpYS0lMV3RSYjlVWnlPZlM2SEdRemk4VFFBUTA3YWN3?=
 =?utf-8?Q?8YolZNZJ2Sks17lu9myGzpPGRRGlOdTm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2xrK2ZyenRJazY4MTMxRXRFcU9XdWRrV1IzbG5QdG1SVmhGVEM0L1FrbXMz?=
 =?utf-8?B?bFVRQ0JXQ1VhampuTXJySU4vS2lwT0NvU3o3cjRkM2xueTdHOWNGb0VKMkpi?=
 =?utf-8?B?ZWZ5aWZicXVwSE9qMlM1Ui81azM4b2xmVVBnQWtqdUNQbDVqbmx0eHM4blNQ?=
 =?utf-8?B?ZnJpMXFoQUhPWGVNVWxTcnQ1OGVESWhHcjZBY3V1cWgzc25ib2lPcDZaOGNZ?=
 =?utf-8?B?blZONEZvODBMb1JmcUxLRWNjR012M01ycVhZajRKeGRNVkFFMXp2bUhYcUxn?=
 =?utf-8?B?c25XcWFzUERrMEdNNHZvaGJyMThvRVVBVnEyaUp2YmNNanEyUTZxeDUvRVlK?=
 =?utf-8?B?K040OS92SndoN1VRdGpvNWUxTFpHN3ZlOGcvaElGcVNuWEI4SWtHOThmSFNK?=
 =?utf-8?B?SFZ5QTZPaXRIOEVTVDFXc3FqM3VCb3dIdlcyUC83OXZCeDNUYTkwTGF4cStE?=
 =?utf-8?B?bG1GS1B5Mndoa2dPdWFmZ2RUam1kUFUwN3RwNnFRMlFldk53bHhGR1hJeUpQ?=
 =?utf-8?B?OWEwV25Oc2lVdXFFazBqS20wQllTOFZmeTdnaWIrMnVTM1hFZy8zREcyTFNp?=
 =?utf-8?B?QTdQY2hnREN5cU5BejBYSzhJQWNyVzhJcmJ1OVMxeFlBUWN6N1BKMEtPeDdF?=
 =?utf-8?B?WnI5WFM5MHo5NGw1UU0zcDlOYnIyNWJJMzNtemYwNUJBQ1Bta3B1OHVMMmM1?=
 =?utf-8?B?RDQxVHRscVk1R1lBdzdrZnZkSkZ5MlUyMXUxODBIYXNBNVNYOVZzbDFaMk0r?=
 =?utf-8?B?elZLNG01RDZ3TEdVRGdXa3RBa2hoeHVyWXhWbjNXSit1UkFMTUtIbWY0cmZE?=
 =?utf-8?B?bElDVlBYcGJVY0hYZGhLZFg0K2RXdCsrU2FFYkV2MVpSc0x1WUtrOXI0NFM1?=
 =?utf-8?B?VkpETUt5dFkyMHBlMEZlNWpiMWZtaWR6c2tJVW9pUyszMlFINE1ZK3hEYXR2?=
 =?utf-8?B?UTg2WUF5OEhUbmRMSkFwYTJXek9vWjY2OHJ3ZnFkbnJRVWlVaWZia3ZwRmRI?=
 =?utf-8?B?N2dIK2RjVFNJS1FPWmhFZW9GOFoyWkI2bzdxUTIyYWNLTlhFRWkwaUt5a0hN?=
 =?utf-8?B?eGZEbHg0cXkvSUkwaHI3dzRZcUc0Z0R2SjVSOVRtL3A1SDRFeTV1anBQRzU3?=
 =?utf-8?B?NXk0NUhic3p2L1hIb3pyWTlUK09lT1RkZGxmZDRyalRNMCtEL1NJTHpkelMw?=
 =?utf-8?B?dmRKUG0rU243OXVnVUhIQ1g4cmE3WXd3UnZ2RlJiclRRTmk3MTE0RWNrSnhQ?=
 =?utf-8?B?VDdLUjVMYzNYMUg0bHpLM1Y3WFFyRXdVMnhjT3F6L05IMGJ1Z2V4ajd1RXE5?=
 =?utf-8?B?YVM4Y0FpU0JaaHNKc3AzNXhEdUQvNk4yQ090L1E4SFhtVFRCNHJnMVgzMGdl?=
 =?utf-8?B?LzN4alg2RDQvWVkwMlpMaWZTa1VuYS9XS0NaWjloV2h4OHJIRjJRek1ZT2pr?=
 =?utf-8?B?VkRZRHlITmxJZTByRDNUYXM2REdYSFJ3aHZOT1p2NUV5L1JvL1A2Q09sSE1H?=
 =?utf-8?B?N0twSjJCQ1RuWnNwV0U3YklrVTh0VlZCdG5TSVNmMDEvZmE5Q3Y3aU9iWTUr?=
 =?utf-8?B?WkdXeUxjNnZBZFQ5dER2Wll3a0ZwYVA0aVJJVW9YSVRsbjN1amtmV0RML05O?=
 =?utf-8?B?RGs3YmtnaVl2N3RnMis4endJbHkzSWRMcTQvZDFiWkZnUTFtM2hReG5nR3By?=
 =?utf-8?B?ZEI0WmxMMUJPZkF2bXhVK1hYRDF0S0NUS2FlT09UOTdWT09CRXB2WlVWSkxY?=
 =?utf-8?B?M1dSQnlZVkdabG9rNUJJSzF3SDRYcVBkaE41Mmk3YWVwQkxLOVoxZ3RqOWNh?=
 =?utf-8?B?VTVQbWpiOFVHdGhEa2pKN0I4Ujlsb1Y0aGc2bXRja1hqTVBlalhaNTlrdy9I?=
 =?utf-8?B?ZWxZQ1MvQURhV25vYmdYN095M1diQ0xhaFNKc0F6Y3JsR2pldTFnYXcvdVk2?=
 =?utf-8?B?ZkdoK21UaVZNWE96RDgrdnBrVnFpaDlYUjc4VFhYY0xLUUtycjA1WXVlcFJD?=
 =?utf-8?B?b0lKbk9QZzB4MDJJZGRVM2JyZUdOSUFPS2wrbFIrcEd3S3VxcDVFMSt3S3FY?=
 =?utf-8?B?QVZWQVlPbHROVkNqajh2SVBOcVhwMHA0WXlxZWhBbDZGd01qcnNLZVBkbnN4?=
 =?utf-8?Q?q8d4Evb0kQseXbTDXhpOKEarj?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35693e34-79f6-4ca7-9ce0-08de0cc5ac33
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 15:07:07.3177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gteeWEOhW+QL8WGEgXvUzqroqhbqsU9Vohp6RZPJbhwPtXWiTsK/MpXjmRK8D+EuL5RcRgQqi3BSqiIe5iJOGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7448

On Thu, Oct 16, 2025 at 01:47:38PM +0200, Jan Beulich wrote:
> On 16.10.2025 12:24, Roger Pau Monné wrote:
> > On Thu, Oct 16, 2025 at 09:31:21AM +0200, Jan Beulich wrote:
> >> Despite 1db7829e5657 ("x86/hpet: do local APIC EOI after interrupt
> >> processing") we can still observe nested invocations of
> >> hpet_interrupt_handler(). This is, afaict, a result of previously used
> >> channels retaining their IRQ affinity until some other CPU re-uses them.
> > 
> > But the underlying problem here is not so much the affinity itself,
> > but the fact that the channel is not stopped after firing?
> 
> (when being detached, that is) That's the main problem here, yes. A minor
> benefit is to avoid the MMIO write in hpet_msi_set_affinity(). See also
> below.
> 
> Further, even when mask while detaching, the issue would re-surface after
> unmasking; it's just that the window then is smaller.

Yeah, it could trigger after unmasking, but the window is smaller
there, as after enabling the comparator will get updated to the new
deadline.

> >> @@ -454,9 +456,21 @@ static struct hpet_event_channel *hpet_g
> >>      if ( num_hpets_used >= nr_cpu_ids )
> >>          return &hpet_events[cpu];
> >>  
> >> +    /*
> >> +     * Try the least recently used channel first.  It may still have its IRQ's
> >> +     * affinity set to the desired CPU.  This way we also limit having multiple
> >> +     * of our IRQs raised on the same CPU, in possibly a nested manner.
> >> +     */
> >> +    ch = per_cpu(lru_channel, cpu);
> >> +    if ( ch && !test_and_set_bit(HPET_EVT_USED_BIT, &ch->flags) )
> >> +    {
> >> +        ch->cpu = cpu;
> >> +        return ch;
> >> +    }
> >> +
> >> +    /* Then look for an unused channel. */
> >>      next = arch_fetch_and_add(&next_channel, 1) % num_hpets_used;
> >>  
> >> -    /* try unused channel first */
> >>      for ( i = next; i < next + num_hpets_used; i++ )
> >>      {
> >>          ch = &hpet_events[i % num_hpets_used];
> >> @@ -479,6 +493,8 @@ static void set_channel_irq_affinity(str
> >>  {
> >>      struct irq_desc *desc = irq_to_desc(ch->msi.irq);
> >>  
> >> +    per_cpu(lru_channel, ch->cpu) = ch;
> >> +
> >>      ASSERT(!local_irq_is_enabled());
> >>      spin_lock(&desc->lock);
> >>      hpet_msi_mask(desc);
> > 
> > Maybe I'm missing the point here, but you are resetting the MSI
> > affinity anyway here, so there isn't much point in attempting to
> > re-use the same channel when Xen still unconditionally goes through the
> > process of setting the affinity anyway?
> 
> While still using normal IRQs, there's still a benefit: We can re-use the
> same vector (as staying on the same CPU), and hence we save an IRQ
> migration (being the main source of nested IRQs according to my
> observations).

Hm, I see.  You short-circuit all the logic in _assign_irq_vector().

> We could actually do even better, by avoiding the mask/unmask pair there,
> which would avoid triggering the "immediate" IRQ that I (for now) see as
> the only explanation of the large amount of "early" IRQs that I observe
> on (at least) Intel hardware. That would require doing the msg.dest32
> check earlier, but otherwise looks feasible. (Actually, the unmask would
> still be necessary, in case we're called with the channel already masked.)

Checking with .dest32 seems a bit crude, I would possibly prefer to
slightly modify hpet_attach_channel() to notice when ch->cpu == cpu
and avoid the call to set_channel_irq_affinity()?

Thanks, Roger.

