Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B393AD05415
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 18:57:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197941.1515281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vduFV-0001Kz-AX; Thu, 08 Jan 2026 17:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197941.1515281; Thu, 08 Jan 2026 17:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vduFV-0001IT-7I; Thu, 08 Jan 2026 17:56:41 +0000
Received: by outflank-mailman (input) for mailman id 1197941;
 Thu, 08 Jan 2026 17:56:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AIqS=7N=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vduFT-00014Y-Sb
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 17:56:39 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6119d25b-ecbb-11f0-9ccf-f158ae23cfc8;
 Thu, 08 Jan 2026 18:56:38 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS0PR03MB7280.namprd03.prod.outlook.com (2603:10b6:8:12c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 17:56:33 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 17:56:33 +0000
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
X-Inumbo-ID: 6119d25b-ecbb-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofSAmoLf2q0PdiS18M30QYAWfDXcWhWtfbwf61E1JCfIJv/FEaBpTZR7zixeOZGcdlMSD3LsR1keKGGDbp4P6eTOJvwbi/Ml5NCwGeUUHBqpytxn6aiJlB1DzB9sEFOUD6S9YeFl1jAj+0leNfh2Lo6ayIawstCv35rgW/xvxElsZXxgp1suHsBx+VisR49VVfyPi0XQ/G2uWzhHhdxfXllyEro34FjaFxTrufOuIC3ZFN7HxW532uy6holqmcK84S0ATdLcYsUjnHslFn3aocUrTzuPNdQiIoFB5y81W/MnFZos9wrIshsBsy86pnf5IpelqT8axbtILF/pNqAmlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEiGmtpnHYUxAMzor9yJzVzpxxC+/PYjhnu5IaklfEw=;
 b=AC9j5UeAWYt/gkcVSP2B5LQOnvM5XCTBlKF1AR1+oVnhDMK+l6PUX26UMozIwrUvoe9QSJsuKRpRn8t+Qmi0tgpPzFragw6TBkoX7H0BzKPkG0/de6mOPOjYkvk8qQjHl6GQUj/+F/ioVVZT7a3E+ERGZrfYtaL9qciBQ4mbe50MV7Yx52OKZAtcwk+8Dd1nbZZP5Cbaa7f3MByJnT+0KDVquGHf5bhyShu3gYX6fILXCW3HyHJ5DWtceGFQTigXInuR+fsLppgzTXTuxHg7gd/vSbrqfwwzJE4oZmj3fbBMgV8x5Zs2BBk/gkVGLhDM9i8kPT+krg/C53FoPMgq8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEiGmtpnHYUxAMzor9yJzVzpxxC+/PYjhnu5IaklfEw=;
 b=By/6qH56LXONF2ptQH9gfiUbOdAnGFsPXLZxjdWVCdngrLlpAFtZJQiy4M7yChk3HCeXQyF1tTWXI9ZZnchrm4QVfaNDhbmt0OBhtAQLSa59r4fezBMZ45KH0add2HyFKmrBMtswgE2669GQcEf6XgwHHn+Z6HYpk7PDFQL2bSc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 1/2] xen/mm: add a NUMA node parameter to scrub_free_pages()
Date: Thu,  8 Jan 2026 18:55:35 +0100
Message-ID: <20260108175536.82153-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108175536.82153-1-roger.pau@citrix.com>
References: <20260108175536.82153-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA4P292CA0007.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS0PR03MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ad45a24-e377-4326-f1c9-08de4edf4275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWE1UWJGa3RwMG1xZ2d6eTc1d0ZhcXMxVGc1d2dsUlFvS25NakdzT1hZeFlY?=
 =?utf-8?B?RXpZbmVWblB1RnlnZTFqbEdYVEFvOEZyWGU5NUlkMFRWandBMy9uZGgvZU5C?=
 =?utf-8?B?RWVBLzlnYkNXZVRFSi8zKzQyQkFGeklLWlhjREgxTHIySmxaQUV0KzFrN01P?=
 =?utf-8?B?emdSajExYTNaNXBrM3h0U3AwUWh5VGRiSEZYN0pUR1pJYk41UTVvQzAyajBQ?=
 =?utf-8?B?LzVpMThGd2g1YUYraEc0SHRhVHVvemtQTUdqRmJ1Q1h3d3ZQVjRueE9zdjhx?=
 =?utf-8?B?cmVoaktDQ1NZdHF0SXB5aGVCM200Wk9vSSt4Q1p5Y1FDeldmZi83MEN2U2tS?=
 =?utf-8?B?MHVER1hJbGpMa0VhbUZ2d2VWakY1V0xHbFRLRDFaOHptbGlkRHJudXJaTjNp?=
 =?utf-8?B?WFlXZmRHTkluRzlGRllBMFJPUTJEbHlTS08vSWhFdkEwYi9iSnBUVFhwMjVw?=
 =?utf-8?B?WXB1OWJmUTNwckc2UEgyZVRMMVBTWWxxaFp2MmwvSUxVa2xBZkRQNVRoV25s?=
 =?utf-8?B?bjVsRERDaDlXQ01SdGRlR2xva2MxWUZXeGw2elp6REhZL2M1MzZWQmJrWDJo?=
 =?utf-8?B?WG5wcU5NeGxhbWY1UUhtY3ZxNlJGYUhYek11NElXZUJtU2JaU1Y3WmpUckZL?=
 =?utf-8?B?RklpR0kwV3RTSlZ0VEo0WTB4d282a0lzSFhaRnBOY0dXM1VBUk92VlprdHFR?=
 =?utf-8?B?Y3llK2srZkhDUkFFRWNGNjhWc2N4cFowOUlQYkR4OWthYk92WklFZ3VUTGdl?=
 =?utf-8?B?Wk1KSk91bFB6WFFRS3l3WUdQcnpWWmRkS2s3WE4zNGk2SDlvR2RZY3BNclVU?=
 =?utf-8?B?S0xqVG9RTjF3RHByck1Oc1oycmRXMkxDenJpZGhhbTFJMWN0NCsrT3ZVdkF5?=
 =?utf-8?B?bnp4TlhkditzSkxTOVVTVlJuZzRteHVRUlpaelpUTVV3NkFuMzZISjQ4REV2?=
 =?utf-8?B?OVJnYzN0ZGNPRHgzQjZocTBNL3k2UWw1eFVpelVHNGJRNXlaMUUwd3dMWXlq?=
 =?utf-8?B?eFBjQTVpbEMyZTdvVWgvQ3h3dWhyVVNHVVpRdXRReG53a3RrZGlEWnkxVDFz?=
 =?utf-8?B?YlUyNHNJWVdGa1IrMUI5LzMvaEZmUER3MkVtNG9KOGtZNHRGdlNGWEFBaDJz?=
 =?utf-8?B?WHJ6QVlWcWVueUoyV2VnVzRzM0x0dlh0UW9wRzF5YWpoYnFaeEROdG1qa3dY?=
 =?utf-8?B?dDNZT3AyNUNvdFZ4TFdwRE1WbEZqWUJsZ1VUVDBON1g5cmdnVmd6NjNaR0xo?=
 =?utf-8?B?RG14T1JtVWwzNDVRNk5GeFFaY3R3cFJBTmFFSEd5cHN6MFhIZ2syQmFxVlBV?=
 =?utf-8?B?eG9qQ2ZjRVdhWllKMjZhWjNjaDQrcXpGMFFlYXFtdGxiYmdIYmR5cTFQelF5?=
 =?utf-8?B?ZjgxQUVCNXVUcXFJNnZ1cjI2TVpRamhnQVhTWGpSYy9JZmFIVEpSUDRoSUsy?=
 =?utf-8?B?bWtWUVN0dlI5V1FieDhqSkJMQm04ZitsbXFvajV6clJ1dmROYTc3UExpdDAv?=
 =?utf-8?B?QzNacmcxRjlMQ29pR1FsNjk3RUx2WTVJMkRPQXFQWXZnRHBlWUthYjdCcGZN?=
 =?utf-8?B?QVVmSHMxSTBmRnBZT1F4TE1VdU5tWStHS2pLdDFGRW05d1FIelIxdk1INjlE?=
 =?utf-8?B?RkVSY0lZZmZWeXJGYXJBczMwcWtUc2pCanlCM2hGcmpqMUlZcHlJYmJaSUdQ?=
 =?utf-8?B?TDRDNDZESGY1Qm84MDI4QWZZc0gyTjNVQ0lkSTV2dkNMTjA5eWdzcngzVnRz?=
 =?utf-8?B?QlVpQjV1UWlQZVIzTndEWHd1YXN3MXFXV1gzS2VPa0owZFZLN0c3NG40ZHFl?=
 =?utf-8?B?SnRZTDBDTlhjbU5WSWtsdFp1T2gzY3YwdEczY1Q2OVMyME8yWVg4eFpPbXMx?=
 =?utf-8?B?QlIzL1lFR1NldVNkOTV2eVE1ZTR3ZnM2OGw3ekErVjZ3RmQyWmEzVmZoQ0x5?=
 =?utf-8?Q?4Og5HwSeT1WbNhMJGhxUu6OpZwNNNLL9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0tpRmEyUHc0dXpnejVCZElUZHRRSWRQcEFjWEJBR0JQMmsvRTkxVkxPR1NQ?=
 =?utf-8?B?aGdXZTRWVlZPZ3lxQVNtRzd4NlVvcW5QcUd0OTM3eE5aUjVrTDNQWHJCc3hx?=
 =?utf-8?B?MWVSMEorTHJ6bUFHS0lkaDFpeGwrSW9WMHROblFzNytWWVRaVURidFFKL0tZ?=
 =?utf-8?B?SlNNVmlRMlJ0bXNaUTYyaDIwYml2ZkNML1dKOEl5Tkw1MlhXNGYxNE5iUGdB?=
 =?utf-8?B?NDY4ZVdIYVYzdlZWb0JlaU5nUmVMTHpyOU40bjgxbURVS3kyMUYrOEhyMVFU?=
 =?utf-8?B?dHdZTHU1MW9vVC9KS0xkdGlEWVdwcURGWWdibEVjTEpOc2s5TkdXV1BnSVBv?=
 =?utf-8?B?VUtMUzlGRUZEVis1UDk0aHNNR1pmVnpneHI5ZHRyTmZjcjBnRnJxNkVaenU3?=
 =?utf-8?B?elpqVVp4ZGNpQnFsVUxLRGNDOTdrb1YxaXdaSkNxazZMMUx6MlRtQ1FmVXJR?=
 =?utf-8?B?SXNFKzNtZ3duazhFL1lnYlhoKytvRDRWcGFldVAzVTNFWHF1MjJhSXRjUUFt?=
 =?utf-8?B?N1dLaWRDaGZhdTE1NE50TnhwWFQxMS9zZmNPUHFUL3N0am5XSmlBS0NqRWc3?=
 =?utf-8?B?UVU2M2RsTStYU3VIdXNUSWh6QXZGSThsek5Jb1ZZK05JUnY1Z1V6d3BqNDJS?=
 =?utf-8?B?SnF4aW9Qb0xpTTZpL2xkSUVFcHZYVDk3NHJlZDgrMEp0VCtSV2RGUVNtYkJn?=
 =?utf-8?B?VjV1L0ZDU3hkUmZUL29qU2RXZEYvTnBXeGVLeGEzUU1RQ2l2Y2Z2NGw5Z25x?=
 =?utf-8?B?TTduYkhnSFBJN2xxTmdYVE9GZlREc0dzTTYvakdySG9PcGdBTVdDdFZDM1pM?=
 =?utf-8?B?dlFhTytEeE9ncEZUOGVSSlpxYVdFMFZkUkd5ODZlQjJyZXdxQmRwWHRxNEZo?=
 =?utf-8?B?QW9xTXN0bGlqa1VlM1pZcUNSQ0RSdDFZTVBCWVRDSTViaURlVXZuUzVnOCtP?=
 =?utf-8?B?bWQ0QXpEOEMwZ21PQkNOckhudTZaUGlFU212a0I1M0t6U3pUOWlwTnBudzI3?=
 =?utf-8?B?aksyWERNYWtCdHl4dHMwak9lcHdCWnYxWkNLUjZhcnpGWldkQ1NHQlBadDg0?=
 =?utf-8?B?dkx2QnFRdnhVV0FZVHRwRUp2a3FKd2g5UVJwS24zWnBTMmZzTFo0Ky9YUzFH?=
 =?utf-8?B?Q0kzVkYwZFEyRUd1RXpScnNvWmZvcDI3bTJ4RGdBc3JpMEdPQ0NPSEU1L0Ru?=
 =?utf-8?B?MzRGNW01NFNUMGhmQTdZTDBvU291WmhtRGI3UWNzYldaR1RXWU1DeUtKVWVL?=
 =?utf-8?B?Rm1KSzNTdjV5TkZUZGp4MVFRUlFvQ3B4UEdUWmNYTlRSV3ZueVZXc2xwd3Fo?=
 =?utf-8?B?ZGtmSUJwUHNkamQ1aHlSUmtkRzNQV2N5L2kyZmdENjlkRmFlNURoR0krbTQw?=
 =?utf-8?B?R05pRXNmNVVtSmpxbTdhRHhmV1czcmZSZUUySHgrOFhQYU5zRWcvdjg5Nldy?=
 =?utf-8?B?c2FvN1FrUDEvMmZhQlBIeTEwL25JWmtWN2FrU2FObG1MSFFwdWh3djJDQ1FR?=
 =?utf-8?B?SVZnd0pQQkR4NWt1VEt4eHZTVjRZVVkyTFRLQ3oxLzBRUVk1UlBRZWtqSVdT?=
 =?utf-8?B?bnppQTZIYzlXbld3WkhNSnhscHNEVXBJY0M2N0NFenhzTnZqSFRHZlh3SDFx?=
 =?utf-8?B?ZzBHamlpRitUWWNIaTJBd1BwOFZnUnFMUzJ3ODdCM3kvNTIwN3BFQ1AzWlVz?=
 =?utf-8?B?ODVFQldnQzhNUmtUb2MxYkxvMGxzUmlXNEpGR2k3SmVGNCtWUlVPS1hFU1g3?=
 =?utf-8?B?S09SL1dFME9BTUFvUWsvaW1ndHFuZmYwSlFxNDdMeVpkem5pajF6S0ViaFhp?=
 =?utf-8?B?MFRaSHlMVHlzODFqVlI3U3VyVGtYZ3ZIRDlTZjFZWnlodzZ4YlgyV2pyQkVR?=
 =?utf-8?B?R0xFaDBRdm9hTkpKL0JOdzloMTl0M083bHRDYjVXTW9Gamp5VGUxeDJwdi9P?=
 =?utf-8?B?UmNleGwyeUgvZTh0d1RKUFZtWlBBOUVBOEZNQXJBcFljNURJNTVuZmxoQnVI?=
 =?utf-8?B?RSswL3FiQnB6TDg3endJNW1aUlZTMkxLaXZIZWRnWW5HRGNSQWRJM3ZqS2FT?=
 =?utf-8?B?SmxXc3gzS3ZMU2RON3FicEU3Qk1XK3ZkaGNhRkllQm0yWGt1YnhldEU1NGMz?=
 =?utf-8?B?SEwzdlh4WkZxaElYZ2ZGTUMwS2trMHkyM2JuaWhIREVBcURIV2tqMjJsMnF2?=
 =?utf-8?B?NTYrcHZUQ2J0WjZFMXd0MWo1cjc5bTRpVWxVQTE3azY2YzZmeHozQU9MUVRF?=
 =?utf-8?B?eHB1czFNNDYxaHpqK3U5dG1aU1dWQjlhMlVuUjlCMmFGdlI5MXdPbGJRdVZ2?=
 =?utf-8?B?S1VhdHhnSHM0QUZDRnR3VjcwemowcnMySW9EZGFDcmJ0VXRFTWYwdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad45a24-e377-4326-f1c9-08de4edf4275
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 17:56:33.4910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B439DyXzxnlW9Rg4sWi1gRHVCU7MRT7/vdfgLPQ3kswtcHSdodzSlEmS7fR/fABaAlWze/7cAUBt1ZSjxFf1Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7280

Such parameter allow requesting to scrub memory only from the specified
node.  If there's no memory to scrub from the requested node the function
returns false.  If the node is already being scrubbed from a different CPU
the function returns true so the caller can differentiate whether there's
still pending work to do.

No functional change intended.  Existing callers are switched to use the
new interface, albeit they all pass NUMA_NO_NODE to keep the current
behavior.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/arm/domain.c   |  2 +-
 xen/arch/x86/domain.c   |  2 +-
 xen/common/page_alloc.c | 17 ++++++++++++++---
 xen/include/xen/mm.h    |  3 ++-
 4 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 47973f99d935..dff7554417ea 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -75,7 +75,7 @@ static void noreturn idle_loop(void)
          * and then, after it is done, whether softirqs became pending
          * while we were scrubbing.
          */
-        else if ( !softirq_pending(cpu) && !scrub_free_pages() &&
+        else if ( !softirq_pending(cpu) && !scrub_free_pages(NUMA_NO_NODE) &&
                   !softirq_pending(cpu) )
             do_idle();
 
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 7632d5e2d62d..276c485a204f 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -166,7 +166,7 @@ static void noreturn cf_check idle_loop(void)
          * and then, after it is done, whether softirqs became pending
          * while we were scrubbing.
          */
-        else if ( !softirq_pending(cpu) && !scrub_free_pages() &&
+        else if ( !softirq_pending(cpu) && !scrub_free_pages(NUMA_NO_NODE) &&
                   !softirq_pending(cpu) )
         {
             if ( guest )
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 2efc11ce095f..248c44df32b3 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1339,16 +1339,27 @@ static void cf_check scrub_continue(void *data)
     }
 }
 
-bool scrub_free_pages(void)
+bool scrub_free_pages(nodeid_t node)
 {
     struct page_info *pg;
     unsigned int zone;
     unsigned int cpu = smp_processor_id();
     bool preempt = false;
-    nodeid_t node;
     unsigned int cnt = 0;
 
-    node = node_to_scrub(true);
+    if ( node != NUMA_NO_NODE )
+    {
+        if ( !node_need_scrub[node] )
+            /* Nothing to scrub. */
+            return false;
+
+        if ( node_test_and_set(node, node_scrubbing) )
+            /* Another CPU is scrubbing it. */
+            return true;
+    }
+    else
+        node = node_to_scrub(true);
+
     if ( node == NUMA_NO_NODE )
         return false;
 
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 426362adb2f4..7067c9ec0405 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -65,6 +65,7 @@
 #include <xen/compiler.h>
 #include <xen/mm-frame.h>
 #include <xen/mm-types.h>
+#include <xen/numa.h>
 #include <xen/types.h>
 #include <xen/list.h>
 #include <xen/spinlock.h>
@@ -90,7 +91,7 @@ void init_xenheap_pages(paddr_t ps, paddr_t pe);
 void xenheap_max_mfn(unsigned long mfn);
 void *alloc_xenheap_pages(unsigned int order, unsigned int memflags);
 void free_xenheap_pages(void *v, unsigned int order);
-bool scrub_free_pages(void);
+bool scrub_free_pages(nodeid_t node);
 #define alloc_xenheap_page() (alloc_xenheap_pages(0,0))
 #define free_xenheap_page(v) (free_xenheap_pages(v,0))
 
-- 
2.51.0


