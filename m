Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 557ABBE2C15
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 12:24:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144411.1477814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9LA8-0003su-9L; Thu, 16 Oct 2025 10:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144411.1477814; Thu, 16 Oct 2025 10:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9LA8-0003q1-6C; Thu, 16 Oct 2025 10:24:48 +0000
Received: by outflank-mailman (input) for mailman id 1144411;
 Thu, 16 Oct 2025 10:24:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NIav=4Z=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v9LA5-0003pk-VB
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 10:24:45 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 549afe8a-aa7a-11f0-980a-7dc792cee155;
 Thu, 16 Oct 2025 12:24:44 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by CH2PR03MB5240.namprd03.prod.outlook.com (2603:10b6:610:93::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 10:24:39 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 10:24:39 +0000
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
X-Inumbo-ID: 549afe8a-aa7a-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=skqNMhXsqQDTtsGsmzB66XuJzskowFH6DfzhnihMjdvdM5W73QT2MI9HIbKQHryL7qGBDjNu4IiJ9937mSvirnrkCK7Ub7Hwnes6xsmtY60BU0SnAiExLqykXE1XKXW/LAOHKzGvmqgnjxmeM50PPs48u81NvUfo8y0JScihyy3Gos2zGsmHtX0onwEoFG0co+2A4b3x+68qGIeK7JTfHk6fU5bScyWBLIctXnxNdGrGiRDbblaCKiBlclc7Bot8MzA48rzjZV1FCvUM9dS3ykxPq22vdJpx3/KcCaL6pFEk//R7enFYUmP7nAE7GzU6cVSZZYiWlr7iDHqDFgEWfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5fHwBFjrWn83tH4JkAS2hRvpoUeBXwp6gWXDKzExCs=;
 b=V1V8cBvaRs8fXFcZWhqajZT+9on1+ICVcJZsEYoPxn9jOsn1hDEjpBe/NHARFVu8l9lVIvl3YXPmuVefrL6qyNSui4T0iKBZ3XnCUtRPeIz2uA6FhzTNlDqtiYv5ZaCRObjdxt5tdedFQfKVlGH8UzMw+SXEWGpoG//pmN5Rtp+eMC+W/jvbg6JncLjKcx9n3DMdSeZUIVMQHfTb69lrOHlYgUZGC4oKy3Jub4ej2JNPvNqRpxK7Ec5GpRvncL87BsfGMdrfJyH22BZdydJ+oTrgBRXhxkdAYmW92UECpyI2vvdebVIfFB5ekXQFzmyaag9ONzkpMgxhaDyLG2v0GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5fHwBFjrWn83tH4JkAS2hRvpoUeBXwp6gWXDKzExCs=;
 b=L3KOh3cqV5vU5YEpmrx+ilrtcqpJuk6Eiw5lwEvq/U0jP4p+Oq1YY+iuvm++edJw6+aOf7DdVGhZvlrd6VBh6dY6brtdZoUWH5aSsLG8/4zERognNrcD8S7g1l1YTKty3gEsjIXz43AwU8X8P2gA2bwT9E3cfLTNWQ7Nrwv45AI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Oct 2025 12:24:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.21 01/10] x86/HPET: limit channel changes
Message-ID: <aPDH4-ZEfJ9LGc9J@Mac.lan>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
 <494c897c-a138-4d16-93b2-67e3aa8d41e7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <494c897c-a138-4d16-93b2-67e3aa8d41e7@suse.com>
X-ClientProxiedBy: PR1P264CA0065.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2ca::19) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|CH2PR03MB5240:EE_
X-MS-Office365-Filtering-Correlation-Id: 314eb6d6-1bf3-4f6a-74c1-08de0c9e365a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXZQMFVUTitnaWk5UERtU1JTOFNiTFJxU0h4eXFOSlA1R3RkV2hhSTRJL3pp?=
 =?utf-8?B?VWRUSkhZaFBCMXAxTFhiU3gzTW10WGlMVGdxejExQXBMTWNoYmtyVGh4WGtV?=
 =?utf-8?B?SmxVbngzWW1KTVFvcUc4Y1FWWTZ3cnc3Q1I1K3l3Yi8vcEk1ODl1bWtXNm14?=
 =?utf-8?B?STI0QUloYXg4RHkvS09ydWF2R2YreTNWOWZVdE5la090anZBand5QjhmSjQr?=
 =?utf-8?B?YytjeWp2cmFHRGZ3U1Y3dnVqTEtKVzRyck1xckNLRlhOVFVxK1FWQzE5U00y?=
 =?utf-8?B?a0g5OGd0QUJGWXRwN29JbGNqa1AySklwS2U3QWdPaUtKZmRTcldrQXludTJv?=
 =?utf-8?B?aVJkQWxMUlRjcEtIUXMzV0hXQmtuNmdDVEZBOTM2U2FGYXpsZjZaME52WStJ?=
 =?utf-8?B?SXZpMjBKUENlWjZkOUkweVhCN1gzRVNSbzNPMENLYXZVOWNlbFFoM3pmVnYw?=
 =?utf-8?B?aEtTN21WSmZUWG9tZ2dlWS9rbGJEZXpaNytKWGdaQ2IxUksxNElDclpYUGc1?=
 =?utf-8?B?NVFFbGlnNlhRR3F5dWxLbFB4NG5KT3RjN2hWcUdNNWVnMDR1UUJzN3lZQjVs?=
 =?utf-8?B?OFl2K2JYUEFTY0JVcVFQNElacXd4MXozSjMzZ3R1bXNUN09lSnQvT2NJdnQz?=
 =?utf-8?B?OE12NGEvTnl1N2pVSi83L1FwT1N5clVnR3QrU01qZUR1Z2QzbGlKYzZwNzRo?=
 =?utf-8?B?RUNTakJLK1RhZk9WdkllbEtkZnhWcjFvc1JSMG5OVnZGVWc0dE5wMUF0bm9V?=
 =?utf-8?B?REhpMmpoTkJhdXIrRzVTMTFLQ05KUDJicEhFUGNnN01kRkNkUURHVDhzRU9q?=
 =?utf-8?B?MkdpRHJSSnVRdkpQRkkvc0hGVzRQUXRDRm1UN2xmNXZibmpacjZDV0ZBdFhJ?=
 =?utf-8?B?MXVta3dRMGJ3cGtuS0NMTG44cS9QSy9ac2FWN3g0L3JZSjdXY2xmZngxQzhF?=
 =?utf-8?B?TzRvK0k2WTNhK0ZySlJMTGk4a1V6OGpuWW5EWGhzTGZtd0Iwd0hjNklrWlk2?=
 =?utf-8?B?OXpWQkgvM2lwS0RPNG9NTmtUV2syTUhxOUZkaTJoOUFWU2FOMmZNWXRna0Y5?=
 =?utf-8?B?VTV4S1dOSWMrNGFpNU51OVBQWGJZbVAweWQ1aGUxV24wVS9RaDJPcWI1dnc3?=
 =?utf-8?B?eitLR1RsYVpZdE5vZllsemh4cVVaT3hCVGdCdU1wN3F2MUhvbEZWeWNsUXR4?=
 =?utf-8?B?dmJCU1pFMktmak8yeVRkWldJL1BGZDdESXBlYzB3enRMQmdTckoyeGlUZzdW?=
 =?utf-8?B?T21NTW1pZmphckRINkg3R0lNTUxMRmJmS0pnS2owcWl1Wjh5ZFQ4eFlhRmRH?=
 =?utf-8?B?YXRDL3M5cEhNU012QkZKMmJHNitsWlltK3ZITXZtY3pQcGI4bFRmWGx4dWFq?=
 =?utf-8?B?d1NoNDVNUGppSUpmSDNqMnJxNmZqV1JvVU5XdVkwaFhXam9hZHpmNFFZYURp?=
 =?utf-8?B?aWpHeWRsdm9VSG0wUlVKRnc5bFd3VjJxbDVlUUc2RFVkbFoyNzRETFZSSmlr?=
 =?utf-8?B?dGVSVHFieTFBV0xxQlBrWVNZeHc4SXhMYUpuYXNJWWNpUzlwOTY2WURoN0wz?=
 =?utf-8?B?L1l6Ym52dnVvWDJXZllaVnZoTnIyU3orckhzbXBxSzJXcWpya1JHSU5pUnZP?=
 =?utf-8?B?UThtZnF4MXhqbFRyYTFaeDBMSGpEQUN2TXpGRVpCc1FrQUhabU9ZeTk1NVZj?=
 =?utf-8?B?WEJTbXVqUzZrT25lSzBIYXZvOUdGdXZTV2R4VEJDWkxiNkhIbTEwWVpseFhh?=
 =?utf-8?B?SzNxMGhtdUxzTFdpRFZITTFCZTJIRzdESFVxcHVpT0tDRjJyaUhhUUxhVXdW?=
 =?utf-8?B?KzBuc0RITUlXSUE3QWs3dDJkQjZCMFpaeS9IWUdwbHBBS2poZXlaam00Vkwr?=
 =?utf-8?B?MlR4Yy94KzA4QzBKVVBVUXNpYStDNi82QWRUMlBFOGNqeDFBTEIyTXBLSXNi?=
 =?utf-8?Q?JNyBVMqJxP1i90rwtkfbQrfVNZuk+l4M?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlVuNXVQdlFtaGwxK0dJN0REQjFaRVBBT2s3OHluTWw5SGpaa0lWTmgraDg3?=
 =?utf-8?B?a2Z0aXBWQmpRTnNsVTd5eVBBWmdNcVFZdE5FQW15eVJ2enNkVlBOUlYwYTJB?=
 =?utf-8?B?VjNTNk5qRTE2aXNtY0lHamNTZ2xuc1BXOE5RM1RUcTRzRzE2eTRVd0grejRO?=
 =?utf-8?B?bytuY0hvRVRtcWRkYWNNN0ZxU0U2Sk9ZakdQOE1uTk45eUtqdno4TEpvdnVl?=
 =?utf-8?B?cmJId3ExMWNXRXJtNzBOQitRQWN2WFZVSWNyNTVKZkM2eWpQKzVnL1N1L1pj?=
 =?utf-8?B?dk9tQktvRWZvcnRndzZQeWN1YTNsdytxWnVzc3F6TUpFUXlEODE1QWgxZVAz?=
 =?utf-8?B?VGNSRi9SQmJNV2tzNURFOTlNNDFpNGJtVkRwNE5IZzdFMy9xbVZod21id2Nk?=
 =?utf-8?B?VzYzWitaQzZ5bTI0cVFwRlZTUXNKOG1BemZZa0REQXNmQm8xcGxxY3RnYTAz?=
 =?utf-8?B?Rk0vMXpESjB5WmJsTkNUWkVzRVN3MWZWT3FMS3UyQnh0OEx5cVlNQWpaUkRP?=
 =?utf-8?B?YWlzeGF5RG9JSUhVenFLU0Rpa09CVThEQm0rcDJ4Vk9EQ1FvUFNrczRvY2FG?=
 =?utf-8?B?ekNzckNDUzVTckFHeEZrZnJuUFFlbjhHcWJUYUU5bU90UUU1VWpZUWFHYXdo?=
 =?utf-8?B?KzJlck5tRDFCNUR0MStaZmRnY1lLSU5kUXYwU0o3YWQzdGZObzNYd2J0Nk9I?=
 =?utf-8?B?UDZYbXEwR0JvTU9hbmpJbmxMY1g4TTBiQVQyMlFnUzNIZ1hnSUdhZ3pkR3hE?=
 =?utf-8?B?TE9yUWUwNXIvamYxQWUwdUtNL1JxVEx1MzYzSDNrOFNlTkl0UW5UR2pnWlc2?=
 =?utf-8?B?UnVLOExtOHVoN1NCRW4zQ0U5aW5VbERYaFlIcUZydkg1NVJFSDZMb296c3RX?=
 =?utf-8?B?TDRiYTdwdlZWQjlHY2hhTURNa08xcThpWGVaOHBKN2hja1FtRE4zU21kTkZp?=
 =?utf-8?B?VUFJTzhrOXMvUDlSNSsvb3JlM21FdjlCbkw4QkppMyt3MDRvVDJQeDBMMFYz?=
 =?utf-8?B?ZkFpYzFSUzVSQ2JlSUJmY3NrSDZQZlhhcGxkeDZXc0hrNDdtaDE0YkhWeEV2?=
 =?utf-8?B?NU5lSTM5M2NyYXZrRWFqakhiNlFvS09wSUMzcm5RcmkrQklzaU9nYkpIUTZo?=
 =?utf-8?B?MW0zT3FrUmJpWkhJdko1N1B0ZnZDVHh3RkpmeDVTVWZ5S0Jxek9nMUtsSDZM?=
 =?utf-8?B?ajU5eDkyVmZxdi9wQzcrOGtPaE5iTXpLbDdrOVBGRUE2aSt5dWYyRmsweXdl?=
 =?utf-8?B?aVg5ZjI0QkNvNURmUFpqOGtwZGhVUkRPVTluSG0rMkp2STJvajVOemkzb0hy?=
 =?utf-8?B?VkwxUERhV3Y4Y3JlRGxCL0trdVdIWHNxWXF4QnZhQlEyNUgxQ2ozYk5oU0JS?=
 =?utf-8?B?d2I1eE5Ka2tZY0NjenFqT1U1bmF1Q0YyU3F6eGxHM2pxZUVWK2x3SnRLaERw?=
 =?utf-8?B?b3VROFJ1Wktvc2Rsd3pUaTRQT3pZYU43NDRDNEFoRGxQTzh4SlRJTGJETGRG?=
 =?utf-8?B?c1o5ZWtJQ25GV2FoQmg2WUZab2taT3NyUEdzNEFoTTRCT2RNVllxdjBXeXUy?=
 =?utf-8?B?UW5McUdUWFlNWkcyZjhBazAxYVVXUElMNlJGVkQrcXpSdHV6L3hjS1lyOGJx?=
 =?utf-8?B?a25jQkhMeDlEZHZBTGt2S1JPTklPWUd5ZFRTYVVJZy84RXdSTnB5VWw3N3Rx?=
 =?utf-8?B?Y2I3MTdTZ1RUMjdxSFhJV1JCY1l6NXpMWTkzZVdiQ2I5YzZleWV0eGs0NVFk?=
 =?utf-8?B?enZpd1RmellZblpGWHRBOHUyRGx5ak9IK3NJTWdQbGU4SGNVOVFndVJkeTVn?=
 =?utf-8?B?Z2d6V3hxNmI1VC9ZREJUVWNVY0NPbUJhRDJZWUllMmZ6SGd3YzhiRVM1RS9p?=
 =?utf-8?B?VWo1a3lLODdkdmpER0NXcXB3Y2FQRm4yZGZVQWljM2JRNytrVWhwKzkwU0Vk?=
 =?utf-8?B?d2lrcUJzN1pQTjE5NUhqY2twWk5sRVZhdWt0RlNhdUkwTUdEOWk3T0oxZjVY?=
 =?utf-8?B?OUwrOERuQVczUU0yTS9QMXdvcFZrMm1EbTU2TGx2ODV4Nlk1TTErcE9SWU8v?=
 =?utf-8?B?c3c5NG1PZDEzQklWdThhS09ndlRESWpnQmUvU1RPb3F3Y2FYUyttYThBSk03?=
 =?utf-8?Q?V83wJtaIv9wb019WBWq4coN47?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 314eb6d6-1bf3-4f6a-74c1-08de0c9e365a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 10:24:39.7620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JM8oPV/DPJCe0s/mMdCxIPt2+kCVsWbX/k6rbrnVgaf40OQVbJftk34DtuQOYIMQ7T6JYKyaDrDJikaO5Ykc8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5240

On Thu, Oct 16, 2025 at 09:31:21AM +0200, Jan Beulich wrote:
> Despite 1db7829e5657 ("x86/hpet: do local APIC EOI after interrupt
> processing") we can still observe nested invocations of
> hpet_interrupt_handler(). This is, afaict, a result of previously used
> channels retaining their IRQ affinity until some other CPU re-uses them.

But the underlying problem here is not so much the affinity itself,
but the fact that the channel is not stopped after firing?

> Such nesting is increasingly problematic with higher CPU counts, as both
> handle_hpet_broadcast() and cpumask_raise_softirq() have a cpumask_t local
> variable. IOW already a single level of nesting may require more stack
> space (2 times above 4k) than we have available (8k), when NR_CPUS=16383
> (the maximum value presently possible).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Whether this is still worthwhile with "x86/HPET: use single, global, low-
> priority vector for broadcast IRQ" isn't quite clear to me.
> 
> --- a/xen/arch/x86/hpet.c
> +++ b/xen/arch/x86/hpet.c
> @@ -442,6 +442,8 @@ static void __init hpet_fsb_cap_lookup(v
>             num_hpets_used, num_chs);
>  }
>  
> +static DEFINE_PER_CPU(struct hpet_event_channel *, lru_channel);
> +
>  static struct hpet_event_channel *hpet_get_channel(unsigned int cpu)
>  {
>      static unsigned int next_channel;
> @@ -454,9 +456,21 @@ static struct hpet_event_channel *hpet_g
>      if ( num_hpets_used >= nr_cpu_ids )
>          return &hpet_events[cpu];
>  
> +    /*
> +     * Try the least recently used channel first.  It may still have its IRQ's
> +     * affinity set to the desired CPU.  This way we also limit having multiple
> +     * of our IRQs raised on the same CPU, in possibly a nested manner.
> +     */
> +    ch = per_cpu(lru_channel, cpu);
> +    if ( ch && !test_and_set_bit(HPET_EVT_USED_BIT, &ch->flags) )
> +    {
> +        ch->cpu = cpu;
> +        return ch;
> +    }
> +
> +    /* Then look for an unused channel. */
>      next = arch_fetch_and_add(&next_channel, 1) % num_hpets_used;
>  
> -    /* try unused channel first */
>      for ( i = next; i < next + num_hpets_used; i++ )
>      {
>          ch = &hpet_events[i % num_hpets_used];
> @@ -479,6 +493,8 @@ static void set_channel_irq_affinity(str
>  {
>      struct irq_desc *desc = irq_to_desc(ch->msi.irq);
>  
> +    per_cpu(lru_channel, ch->cpu) = ch;
> +
>      ASSERT(!local_irq_is_enabled());
>      spin_lock(&desc->lock);
>      hpet_msi_mask(desc);

Maybe I'm missing the point here, but you are resetting the MSI
affinity anyway here, so there isn't much point in attempting to
re-use the same channel when Xen still unconditionally goes through the
process of setting the affinity anyway?

Thanks, Roger.

