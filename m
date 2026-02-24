Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJnBHTSEnWlsQQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 11:57:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F67185BB2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 11:57:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239817.1541227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuq6m-00062G-Iy; Tue, 24 Feb 2026 10:57:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239817.1541227; Tue, 24 Feb 2026 10:57:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuq6m-00060m-G2; Tue, 24 Feb 2026 10:57:40 +0000
Received: by outflank-mailman (input) for mailman id 1239817;
 Tue, 24 Feb 2026 10:57:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lz8P=A4=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vuq6k-0005zG-9b
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 10:57:38 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e056b62-116f-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 11:57:32 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB5845.namprd03.prod.outlook.com (2603:10b6:510:32::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 10:57:28 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 10:57:28 +0000
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
X-Inumbo-ID: 9e056b62-116f-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7Svw5bOKXpj+Q7c4ebMPL3z1n1YRbLEM2uWL5jUYv4Ue18oHfjxR4Rb0f1tg/bSPf7XJk2OEqyfcdmwBUEgpNKUZ/wB8D4enKIASDtyoLwcEYukj0KWu3Whwlc5oLNcPlFZVcwPbR8+WHjI87y4+Oyp+uTxbVQwKn+a1UQa2xEGBP4KwfHE5WCSZs+/El6stEKzs8krUu256z+UmEomW7o21dNKK59Xl6auU2TIoA8T/cAPFCwVgdKSg6tZjZ0lcxpsuXwe8aXOvz3YIo1l0B3Fbv9yxbyhtqsPn5CdgEyvJ/l4yM8PcFXJnBv5KNoniMJyY7UKjqCZutPpju4pLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+gX87f5tZhQR77cjIOkA8Le0ToC2nyq1mKv0XAHSck=;
 b=em5aCx1zauht/Jlo8vAyqoY8QruztnjeYcnIgX5uk9Jb2RDpKt/235Owpxo5d/6wSWUXXvkrcNlITdV0/E1hJyN1r5AoFt4MiLlw65v159Fq2hX4LY2afIvRhdz+L7YE4KX+3qbfIlYPf3GEISQbmEgt5pBFFNbP8BZ8URgE7TLX9whc6CuRBmNIeDtRNmWJNNpTtfJ/QviuB0sr3MJZpV/CvvExb2J2NDroSt0tIOoaZK/XvmxoOv+2awkZa7YoizGFS9F/BcYkdnj+aYvRac6sOhi5vpmyyfhWDgxI9ZsPVA9CzE/+BkNpC6caX8uEKIxjnbW2YkifCrkyVxUQHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+gX87f5tZhQR77cjIOkA8Le0ToC2nyq1mKv0XAHSck=;
 b=a4u0yX31Rium7hsOyhHweiaQ6Amdn+rVAPz2ulL5Qnwo3qHRiiVJ+Oe6SDil6ohnXjrL1vh8/f81yVeZ91RIPpuxYCJNQpUXyPAokCFIdr3XkGzUBrWr2dlr3+4Kmlz4i0C0OB8NxDvDLQnaZTiCedk5CdZYtI2/mm/8WH2SIgU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 24 Feb 2026 11:57:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] vpci/msix: check for BARs enabled in
 vpci_make_msix_hole
Message-ID: <aZ2EFPfdv-_1IT-R@macbook.local>
References: <20260224025626.26909-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260224025626.26909-1-stewart.hildebrand@amd.com>
X-ClientProxiedBy: MA3P292CA0047.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB5845:EE_
X-MS-Office365-Filtering-Correlation-Id: d4959dc5-3618-4e62-38da-08de7393800d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bS9qVGRLTzFyQlZNc0kwRkhmWWI3aGNRRTNmZGJnOC82UEthZmwxVlZlcmJQ?=
 =?utf-8?B?K1FOSmd3YTBpdStCV1phcElMN1ZCSkZHTy8xT2VxTG12YjdLajJJVldpRDFp?=
 =?utf-8?B?aTFUbVRtUlczWHV6alZyaEtud2JxUC81M0ttazRGWlZYM29YK1lTbElIZnRw?=
 =?utf-8?B?b3BYTFZVSXJDSjZMYk5sVUFrNzJBZ2QyRmVGeVl3VGNPem5rUis3TzhyQ3Yz?=
 =?utf-8?B?SW0wYXVmTEVzSEYveUYwR3FOMFJQNHQvcmRNRGhHdWJaaWp4dkgwSHZTOUZR?=
 =?utf-8?B?V3dJRnZuWktHazlmR1NoeWkwYS9XcWdERFpXWVo4YUtLR0tzZVdEcGxOUjhi?=
 =?utf-8?B?blJIazBmOUNiVHRUcVdiSkFkU3ZVZE8rQ2FiU1ZWcVRydUM2WTZTQTVpaHJF?=
 =?utf-8?B?N2xWZ1JMdEh6ZDZET1NQV2RyM0pLMGpjakNRREZyZGJLcnc3di82ODF6b1JS?=
 =?utf-8?B?NWk0Rk8yY0VGM2ZQN2Zmd1VGdGRCU1pvWjR4ekZXamY0TlE5L2lCSUlmcEV3?=
 =?utf-8?B?TEx4YUpPRStnTnY4dXdoL090eTNVajVOUHV4Mk94eFdpeUhVdVRMaHdoU1Y4?=
 =?utf-8?B?ajJvL0xodXVnOXJxaE5WejQyczI1OXc5V1IvWVFRdUR5dm5DTmNvalR1eFBj?=
 =?utf-8?B?d0xySjM3SitVYzB6VXBMYVpJaHkvZVUzWEdxMlNCMkR2QzIxck9iRnBYRGV0?=
 =?utf-8?B?b25NSDhlcXU3bFlvcWJWYWF3dkFVNllpd2laYkFPOXdIdFg0Q3J6TmpiUklW?=
 =?utf-8?B?eHNsellaemdZMVQwMkowMWFCanp3ZmJMVDZha3QxZSt1czZzZHZjMUNCWk1L?=
 =?utf-8?B?WDNhOVFIQm5hVHYvN3hOUXFNMC9EUVlqTXdLd1l5cnJsQW1LQ09XQ21NNDZH?=
 =?utf-8?B?anY2SE5QTE01dXRVRWVXNURZaDc0c2xqWUUxZkZvcmZqNDVLTFkzUlJkNHAx?=
 =?utf-8?B?blp1dFFoVm9rK2oxdytldFYyUHpLZDA1azV3VHhlMU8zYjVjZDY3NXYrSDha?=
 =?utf-8?B?OEVCczRhS3dOOWpNMU95SW85UlVJYy9VQ0Rucm1GZGtpRnNDdXIwQkNhdGNn?=
 =?utf-8?B?L1JDUEFQT1dTWVlqQ05lZHZDTEVjSklHTWFFL3ZtWUpRbGJEOU5ObUJORTA5?=
 =?utf-8?B?VWxTaXNZSTdjZk8vQi9xWHpuRUhqdG9CRERlN0RtZ1FtcmdsREQwZ1A3UUlK?=
 =?utf-8?B?QmtMNHpweGVzTG4waExZbWFJdEFkYlA2THpwV0ZzMGpndjJQRGYvUVN0eUk2?=
 =?utf-8?B?dll2VW51M3JkQlBDVUlKUDBsOWhCUEp2NWFIUlViZk5zMDZ4cUxncW5JMWM4?=
 =?utf-8?B?bGpsUWZUZEJWTG9ZSU51bmhzbHFoc0hzemZIWGk5TTVGbGJLRVZmcCtoV3JQ?=
 =?utf-8?B?ZjU4cnN5RUhtSUpBUjFtY042WnhCZjkwVVFaYnBoRlBpampqWmNEYWo4T0tN?=
 =?utf-8?B?SDdkZlhLbXJvY1NXa2JObktYMndvSm1ZWkVLdml4bVNTbzV0TzV0Um5Ebmcv?=
 =?utf-8?B?YVdsOFRqQjFidnFVRGJmRWhIOXNKRmlvWXVqWm1sempxYm9nSGFxbEREb3Vt?=
 =?utf-8?B?MTBKemp6c3YwdGM4VE9UN1ZpemlKV3NGelNnODVvWk11alN5ZUduSWpxNFp0?=
 =?utf-8?B?VGxSSHh1V0l2NjVPOFdCYlU4SktoRHR1WnUzVzdHU1dUNHM0WkFFWTNucUZl?=
 =?utf-8?B?b1FHVlVpQW1JMTc1YzA2SUFEZzNlbFpxZTZQWC85YUhSZkRDQ0RPRVFUVXcw?=
 =?utf-8?B?bkliYzkzZG9MVFQvRUp6em9QaFB5Rnhjclhyc3pTbTVYaDQ1ZXhjUkRTR0Zt?=
 =?utf-8?B?Q01pMzhEbXRCTTA5T0k4YU1kbi9DbUJGR3N1bmZrUEFoYjRKY25MT2IrbU5M?=
 =?utf-8?B?RVNoVTlqdWxiajljQ2xaSXFQMDJvUjBwamZIL0h2Y0x5Tm9ZN1N2NWMvdlZl?=
 =?utf-8?B?Z3FCL0VJdS96czB4dlEyWEQyd0NLQTB0NFovdG5lWUd6N2h2ajkrcFFZVTE1?=
 =?utf-8?B?RlhjM1VuYWRmWXJCSDM0T01yUFpEL2dTdU5Fd2JLRkhCSHZNbHQrbkNXb3Nj?=
 =?utf-8?B?bENjYmtlcFdPOUVLRWw5Nys0Ri8vcmlQZkZaU1NhSmJCNjZlZWlBMWJlU2xu?=
 =?utf-8?Q?z/3E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUJIVFlMcjRZMS9KTjNINThVNE5DeHNwZVAxUSs5TFd3WTh6NFQvZDdmYmxF?=
 =?utf-8?B?emZMdW9WSmVQNDJGV0U2OW9jM1BmeWVya1JNdHkwZWFZdmlvSXpWQ0FLWmsx?=
 =?utf-8?B?eENmZnZUQnpiYm5hem9XMytCOW9sNDF5N040c2lyOXNMalJvc3kxYllwUys3?=
 =?utf-8?B?d0ZHRmRHa1l4dkIxWHVjeTFUSUpwa1p2Y3ZTek9kWm5zaVB3aFZFaVZLZVNz?=
 =?utf-8?B?V2psbEY0N3hPSXFvL0hQZnVCMWNMbnFLTUwwUDkzYXJvMTN1czRNTjdpNWRD?=
 =?utf-8?B?dFlCZmU1QUxKdmlBT0FEZHdhQ2p2VXI5dEZVZmx6SlhVR0ZLck4rT0c2ZUhD?=
 =?utf-8?B?cU9lYkpBY081TGVXcTI5UktyNTN3QnFtdlkycFVQSWYyd3NMTGl1OGQrMVJ3?=
 =?utf-8?B?R0lLZFgxV0wrUWVsblc4ZnpIUFU0cmQ3S3Q5T1dTQ2h1ZHcvQTREd2ZHWS9x?=
 =?utf-8?B?dXg1cHB2U2NUTVhNWG1tOTBOTkpJcmFxeWNmWTJ1Ri9jY1N5TE1jQ2tCQ29B?=
 =?utf-8?B?b2dyM1RyV01aQ3UrRUZPTVQ3UTdlTEtmeTg2VWVnYk05VFgyNGludk1Yd1Z2?=
 =?utf-8?B?aHFoVzBpWlNVL2xEMHpjUmRYYWhuNm9JMFJjRVpPL01oeEVGZ1ZWR2QxeEJP?=
 =?utf-8?B?ZXRibmFlai9iSXl6cktEZi9YS3JLanA1OGxRQ1I0bVV2RFhGYnhoa2RrUW42?=
 =?utf-8?B?UjFZOEc5QUJuaHlYbDlwSkxKYk5EMDZZL0FBMHNrbDcyVHdGVTR2b2JZblUv?=
 =?utf-8?B?bzhCU2czbEZ3SlVLMDJjUDdzUnh1WjFMTFJOZTFGK1VGVVU2Q09YTHZZTG03?=
 =?utf-8?B?eDVsWXBDV0dXOEFzSzlvOUFrN09ydFlvajk4NWhFUSt0SDcybEZEaVpQZFhN?=
 =?utf-8?B?bENIQThjbER0Y0g3REFUcGdXWXlsVkxnMkRsNlRZd3p3emMyd3VSdjVPTGRF?=
 =?utf-8?B?RFVmMDZhZG40K1QvekNUc0dOaWZWWStjYmFXWjF2alQyTUpSODdIOTNMNHdT?=
 =?utf-8?B?alkrSW9RdE5SMmIwaFEraFltQno0MVRPR0JEOWoxc3p5ZUpOTDFYaEtTS21I?=
 =?utf-8?B?c3R6eG5OVW9kQ3hkd3dZbWs4SVlpNFVKQjVnWnFpQVBXb2R2R05zS0d1R281?=
 =?utf-8?B?ZVpkK1ErRUF5WUJFaUJYQi9uSXUrRHdRd3lLMHh5RkxDMjBOb2M0Q2svTzJG?=
 =?utf-8?B?eis0Q0h3TUNPREJQYUVFOTBRdEg4bzhNSjZZcnExcjFxY2hVRDhucHpIckdU?=
 =?utf-8?B?QzljSU9zNGlGNHhIZEJ6bWpqNm1vTlVEZy9NZEtoS0oyVDdBV2hacS9wTDda?=
 =?utf-8?B?OHB6RWFOTHVBR01YaUhPM2FHM0NLeWkwQTg0VFVVaWxDbmpyQ3VRYnIxdnIx?=
 =?utf-8?B?WkpYamMwNnAwTlNhUE5qMHhSSDlCdlYvRFVrbzN1Y2VhSWRNcWd4ZStmWmIr?=
 =?utf-8?B?eUJBamFJdlhmSllYUlF2c1V3UkUzTTFpL0pVY3BNTzVkUlViV0cxTlNaZi96?=
 =?utf-8?B?VldMWmlaYlBxNTgwVktpUUp4U2NPVGc5MkhIdys1WVgzYUFuYXkwMkkvWFRK?=
 =?utf-8?B?ZVhHQnFUQTZhZUxaOTlxSVJxQkpHdHM3eEdLL1hrMGhOTm1vMXRGa1VibUdP?=
 =?utf-8?B?YjlYMUI4SWtWUTBYeERvaDlsVWk5SWd1SzhWZmh5alF0UzVTcXhtK1VoYkhi?=
 =?utf-8?B?dHdmZWREdGN2UXpMK1UrL3IyVnR4S1ZBM0w5eXBNV2pWTFpEZ1VsQVN5UXRl?=
 =?utf-8?B?enN5bWYrZFRFQm13T3VDWlRVMjJPeWU2WFU0UXlqOVEyZXUyL1BqOXJhZmRp?=
 =?utf-8?B?c08rcWRyZjVielJSTExqb0xoc0dJdlVEZDFPc0tmMi9vSkNmUVNJbmh5OWND?=
 =?utf-8?B?VS9mQ3pKL014L2dGKzkzTWdPOWFpSUtReFBoMmROMWQ1M0lmdlZLcVhUR0l6?=
 =?utf-8?B?RVYxVy93M0pqMjRqYlFzM01mdXV1b1doaS82RlphNUZYQWdwVHhRcm5UNHVC?=
 =?utf-8?B?L05SMFBCSnkrLzdBVkdXMEFpV3FNQ2w2UWdKUE0yRm1OUHk5enBMWk1MVWlL?=
 =?utf-8?B?Q2VQNVljZ0svWi9OWlc4SjZHcFNyak02WklaUlBnM0tVeEprZGl0M1gyYjY2?=
 =?utf-8?B?V0hYWUN4RnNYNUtWOThOUVpvRS9wckxRUExMTGJtczlCNmFTOTIrOXJraTkx?=
 =?utf-8?B?SE5uZlpkMUlqWFlZaWFOSkJiaWI5S0lmVHd1SnBaZWZxTWlMR3NRNXRVSE84?=
 =?utf-8?B?VThDMmFtR1k2UXNGV0ZmUFZaam1LSTBIT2lBSkU5OGpzZkxpeTJ2eGh1NDhS?=
 =?utf-8?B?U2NoNFNyWTVqamZhNTljOGZRSGp6TEVDR1RWMzQraWFBTjhzTjhzZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4959dc5-3618-4e62-38da-08de7393800d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 10:57:28.1017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X3sxwdt7cQTwG2qQoFg8+lS9RHDOlKul0ooyezMk3hGApmC5YFqvBzugfUVLBiamlnOE0FWJRZl4YW+BMUixPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5845
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,amd.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D9F67185BB2
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 09:56:24PM -0500, Stewart Hildebrand wrote:
> A hotplugged PCI device may be added uninitialized. In particular,
> memory decoding might be disabled and the BARs might be zeroed. In this
> case, the BARs will not be mapped in p2m. However, vpci_make_msix_hole()
> unconditionally attempts to punch holes in p2m, leading to init_msix()
> failing:
> 
> (XEN) d0v0 0000:01:00.0: existing mapping (mfn: 1c1880 type: 0) at 0 clobbers MSIX MMIO area
> (XEN) d0 0000:01:00.0: init legacy cap 17 fail rc=-17, mask it
> 
> vpci_make_msix_hole() should only attempt to punch holes if the BARs
> containing the MSI-X/PBA tables are mapped in p2m. Introduce a helper
> for checking if a BAR is enabled, and add a check for the situation
> inside vpci_make_msix_hole().
> 
> Move the vpci_make_msix_hole() call within modify_decoding() to after
> setting ->enabled.

I would maybe make it clear that the movement of the
vpci_make_msix_hole() call in modify_decoding() is due to the extra
requirement added in this patch that ->enabled must be set before
calling the function.

"As a result of the newly introduced checks in vpci_make_msix_hole(),
move the ..."

Or something along the lines.

> 
> Fixes: ee2eb6849d50 ("vpci: Refactor REGISTER_VPCI_INIT")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> Pipeline: https://gitlab.com/xen-project/people/stewarthildebrand/xen/-/pipelines/2344925375
> 
> v1->v2:
> * new title, was ("vpci/msix: conditionally invoke vpci_make_msix_hole")
> * move BAR enabled check to inside vpci_make_msix_hole()
> * introduce vmsix_table_bar_valid() helper
> * move vpci_make_msix_hole() call within modify_decoding() to after
>   setting ->enabled
> * split typo fixup to separate patch
> 
> v1: https://lore.kernel.org/xen-devel/20250812151744.460953-1-stewart.hildebrand@amd.com/T/#t
> ---
>  xen/drivers/vpci/header.c | 26 +++++++++++++-------------
>  xen/drivers/vpci/msix.c   |  4 ++++
>  xen/include/xen/vpci.h    |  6 ++++++
>  3 files changed, 23 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 739a5f610e91..6a28e07a625b 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -122,19 +122,6 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>      bool map = cmd & PCI_COMMAND_MEMORY;
>      unsigned int i;
>  
> -    /*
> -     * Make sure there are no mappings in the MSIX MMIO areas, so that accesses
> -     * can be trapped (and emulated) by Xen when the memory decoding bit is
> -     * enabled.
> -     *
> -     * FIXME: punching holes after the p2m has been set up might be racy for
> -     * DomU usage, needs to be revisited.
> -     */
> -#ifdef CONFIG_HAS_PCI_MSI
> -    if ( map && !rom_only && vpci_make_msix_hole(pdev) )
> -        return;
> -#endif
> -
>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
>          struct vpci_bar *bar = &header->bars[i];
> @@ -164,6 +151,19 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>              bar->enabled = map;
>      }
>  
> +    /*
> +     * Make sure there are no mappings in the MSIX MMIO areas, so that accesses
> +     * can be trapped (and emulated) by Xen when the memory decoding bit is
> +     * enabled.
> +     *
> +     * FIXME: punching holes after the p2m has been set up might be racy for
> +     * DomU usage, needs to be revisited.
> +     */
> +#ifdef CONFIG_HAS_PCI_MSI
> +    if ( map && !rom_only && vpci_make_msix_hole(pdev) )
> +        return;
> +#endif
> +
>      if ( !rom_only )
>      {
>          pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 516282205a53..142cfbae59d5 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -598,6 +598,10 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
>      if ( !pdev->vpci->msix )
>          return 0;
>  
> +    if ( !vmsix_table_bar_valid(pdev->vpci, VPCI_MSIX_TABLE) &&
> +         !vmsix_table_bar_valid(pdev->vpci, VPCI_MSIX_PBA) )
> +        return 0;

As Jan pointed out, this needs to be moved inside the loop.

Thanks, Roger.

