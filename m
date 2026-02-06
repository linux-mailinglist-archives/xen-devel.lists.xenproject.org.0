Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJsSI4w0hmneKQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 19:35:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F422A101F84
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 19:35:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223776.1531177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voQgB-0002Mo-0I; Fri, 06 Feb 2026 18:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223776.1531177; Fri, 06 Feb 2026 18:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voQgA-0002KS-TN; Fri, 06 Feb 2026 18:35:42 +0000
Received: by outflank-mailman (input) for mailman id 1223776;
 Fri, 06 Feb 2026 18:35:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B2QQ=AK=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1voQg9-0002KM-Mu
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 18:35:41 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a299ccd3-038a-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 19:35:40 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH8PR03MB7307.namprd03.prod.outlook.com (2603:10b6:510:253::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 18:35:36 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9564.016; Fri, 6 Feb 2026
 18:35:36 +0000
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
X-Inumbo-ID: a299ccd3-038a-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6g6XfyxkWrsqVAYrwI0ApQGL1U2OX1QTOZQSKdnZgf3XWpWpqlxtTGkUfNr0wHdz+oKA6AtGS39I/aUBgek5toQMVNYTQqzfZUy2F6KMUCMHDXRPZwBLZzRH95hzl5hnt57ngfERvvA9tKUAXNBADzOUeZ7OSxHJRuhAApYZJZjtrs79f4r3g9gDa2hAURKoaufZC6G4hY2875yDqYMMdXDYroWr96RezZhLNGWtR1QYzjgt7xwzx3kSAdJ+eZbrKa0J45SNJj1FpSEX2PyIMV+lwlgl7HEpUlW6qPmkrrZPZ89rgfoyFHi5q3Xr22ElyI+6aW2fPqpcFrgnuGETQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEYlH1SHa7WJYszZwkbqaLMCrD31e4e2YYLmFr7tt48=;
 b=GK789rFxV+OtFASdi4EK+F7jx05/XAakbH3hgT4mJUuwQzU0+VYZMXjkr3Jd1EZmM74JUk4c0A8jgaKzLIbQTqQbH3nVm5+VH1o1wCcDoC/SclyqiQJGYZOs7PFQVfhY65/3eNpe2ZIAAmVV07Ye9KvEeBMDwi6wC2NJTVSQbBMWPHjiNfBOZp5jfzLXzZoYT2/K8IDFROrX+QjOpmSTbZnPczeIjOw8aQbrJyXRyZDBkgdmR6MhTsb06bqE59jMQmpc0wzywY12N3+ocwxTnm1eZiOachdw/X9vrFygrvZ1hAb322hKSadlaV4Q5qdshRADwXq3ReP5rqj4rLV4pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEYlH1SHa7WJYszZwkbqaLMCrD31e4e2YYLmFr7tt48=;
 b=jJsW4nNAxnm806k40VVE9N6Y+JtzbjvA2G+3vS1fwRzaSgu2XSof2LwzPrsApWakF2ISG+RU98Jt62VJ5oQ8mfrFSM8Qg9uU9kC+xPfvhPMsqRdLFULwEwFSxyGEBllQn5O/o/fSnFhiidefIPMOHA4r9NYjdwGLrqtUFeMmUZM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d754b3b3-ef3f-43ee-81fd-076f50ada106@citrix.com>
Date: Fri, 6 Feb 2026 18:35:32 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] xen/kexec: return error code for unknown hypercalls
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260206183100.28195-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260206183100.28195-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P265CA0004.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH8PR03MB7307:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d7c7ff6-bc40-4cbb-0ecb-08de65ae84bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YjIrNS9GbHRaK2N2dXhvM3pyeGNrODVUSHJEMktlWXBzS1Nra3VKUnNMQURJ?=
 =?utf-8?B?UHE1dThDbGRoKzNoWDlXczhWWkVvWG45QzU0SGlReFVYOEZiTVZCK0xaU210?=
 =?utf-8?B?em1OQW9hc25tY01mQXJGVll3L3VCczRhTFBhS1pZZHdPRmN5aU4wR2pQR1p3?=
 =?utf-8?B?b3BiM0E0V0lVL3hXaTlqRmRqRDRnaUhqNVo2Y29MK255NzBRRERkR0pZeG9n?=
 =?utf-8?B?TzhyTXdkS1MyTDdpRzY4bDdNM2R3VTd3b0lNZGV3aHFXQU5JNTN1cTljK01Z?=
 =?utf-8?B?cjRHZlYyV2dNeU9obHhIbWR3YzNsTWs4SzAvYkJZd09RK2dESDd0ajlzZU5m?=
 =?utf-8?B?UnhtTnROTHdkRDc5UTA3NXRFM3hjcEZPK1ZXcG9RNDdQZ1EwT2dhaVJsZGZ0?=
 =?utf-8?B?N21abVZ6TnBwU0pPeURwVlFOZEt5ZE5HQU52UGVQY2hBUzREWkFCRjZZbGZL?=
 =?utf-8?B?SVRZNmhOa2FzaE9PNG5VYWxXSTJVSFRBbmkyNmZvUHdWYXlUUWdpb1VGbC85?=
 =?utf-8?B?cnJNTzFYN0lZNU9BUFpyOVY1VkFjT1d3djFFc3FHWE9EVGlDNDQwT1U0MFpv?=
 =?utf-8?B?UXI4TEwrQjVKOCtkcXR6V3orV2swRVJXc0QxeFpCWHVlOEtUZDJPT3VDb1RN?=
 =?utf-8?B?cFpMdGpRZ3N2dVNHdXREWE5BNkVWRGFzbjBWRnNER0dGQlA5ZC9kRWJ2WCta?=
 =?utf-8?B?dVR4LzdBWmd0ZDdjZDR4MFdSY1EvWktrd0ZTaU9pbmh1blpLQmFOem5CcEVY?=
 =?utf-8?B?Wk9CZzJPR2JXVUVrTThSNUxHeFpHelZXR3JmYkJvcjR0VnRxUkR2RmdtaW9m?=
 =?utf-8?B?ejU2OWJjQ1A5MnRUNnBTZ0RxNEg3RGUreHB1UXBwa0xiU1BtQUZwYzRYR2ww?=
 =?utf-8?B?VkdHandsNElFZ3Nkb25BMitxT2pneGowVWNGWUR4bjBxVEJTdGZGZjFKRG82?=
 =?utf-8?B?UmUzQ0UxeS9GcVZFR0pFT293Q3RZVlp1VksvMzNPRXp1eVlYV2c3UUFncFlV?=
 =?utf-8?B?UjdlOFk2Smp5aDF4NnZOYTZVOFM5MVREWFJPMEVCN2NLdEw2a2p5eXJBZHVV?=
 =?utf-8?B?RVlLQmxwVVBjTUs3dTFQRVFKS05MNm9SVU9kM0FFZ2wvQkdFaUNjL0U3aU9M?=
 =?utf-8?B?eUp4TTdqSFlkUGJzMGVGTG96U1NxWnAyWlhMQzRTdHBjakJJVVFBd2ZBeGpM?=
 =?utf-8?B?ZzduZkpQM21pQ25hVjZXa2lHZ296T0NzLzJ2ZjNsVG82UlladSswOWVSaUNT?=
 =?utf-8?B?OFlqeldDQitTSFZuN1haUkszL1JTWlJRVUdLMEw1RUlmMlJkMFBpbDNRV2NU?=
 =?utf-8?B?VndlQ3RMME1IcHN5THVrN1FpUXJvRk1LUVVyVTFLNDlsVE9FM0ZBcHZWVUs3?=
 =?utf-8?B?VEJMbktBSWhWU3YvSzJralZpbkU3OEw2UU5zY3AvcjBIOERRbzBoZFdKWkJy?=
 =?utf-8?B?UjRsWkdYbU5yL2xrRjQ1ampZOFZPVVRMdjJwU29Ba0pmSlg2UlVrbTFKR0Jk?=
 =?utf-8?B?RlU1YlY0M21MZHlJWVZJQzF6RlBoVEEvU0VGZ05vZ3pNUE9HSXFjNFNDQVZw?=
 =?utf-8?B?TjRUQy91ZGxlbnBmMGJwRS9iNTJhOFBySmdLcGIxOSs3Y1NZZ0gwR29kY3I2?=
 =?utf-8?B?NHErM2VTTHJqcHpsUDE1OEl2Q2JvNkdVQ2hxNEdvNUt0R3Q5Qjh5b2plVUJq?=
 =?utf-8?B?VVk3dXdCc2Ywa1NRN2RQUi9IR3AyeGRLdnlKcklmV1hkOHkxbU0vRThWbVk2?=
 =?utf-8?B?c1RONkpzRWFjRCtwTjlmbWhJUUZ3SEY4TDI2UFY1Zms1clFEcDdxL2FSQkNN?=
 =?utf-8?B?VTAxa3ROY3M4T1YyVUdqUVYwUWQ5S0cxeXFuTTlCcDRzempZQ3NLNDlUY1V4?=
 =?utf-8?B?ZFhnRFZyVG5NcTYxUmx0OTBxMStqbzA3NkNHMkdQVjhjT3hxZ1BBT20yZnIx?=
 =?utf-8?B?dDV2VzlDSmtwRnVEZ3o5ck9QMGkvVS9xQWRKeDZpZkw3eVFROXlGaFIwbmJZ?=
 =?utf-8?B?WHlOeGROZy93QlcrTHNzMkxNZG4xWHY4ckIzaUp6Y0RjWHFrQVhUS2tEd2FJ?=
 =?utf-8?B?dFVEanBSV01KMzladVczM1RqT09NWWVnVjEwR0ZRdTdKTCszUkdrQitHRktU?=
 =?utf-8?Q?juU0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UExXSXN2MmNDd25YQXpEaHF1UjQ1VVNXK0Eyd09aRjl6bHRKT2NPVks2eFdp?=
 =?utf-8?B?UDBKMmgyNzh4aDRqdS9uRjBUNkFtTzRZcDRhVjRRWUJJZEJadkRKV2JQOWpm?=
 =?utf-8?B?ZEJxMlNFaXpZR0hZS1gyL1NtUlVBb2VuMGRzY3htT0pCUWtFNFQrdkZhVCtZ?=
 =?utf-8?B?cG1pWExidVZPMWE0b242bmNHWUw2RG9sVFlBeC9RZndJTUpYN3l5bTZwY1ZX?=
 =?utf-8?B?TGxJdEZEemZHWnNxcU1BMndiRkdPZEdaU2ljalFpcUZ5UXFJbnI4bXU2MFZU?=
 =?utf-8?B?cGpjWTZ1cnFiTWJiNTNhVER0bmxGMURETU1RTXZaQnp4TjE1bjVSSU9oYVhn?=
 =?utf-8?B?WWRlOWdId0ZPck1ya1puSXFzMU1pa01VVzZLdnphZmUwR3dIbXZiMzJseE1h?=
 =?utf-8?B?TU5YVmpXRWFUMUQ2ZUF6U2J5bWxsSDFkQUZxa3ZtUXk2RFdPRWh6WTF5bW9a?=
 =?utf-8?B?RlhGSGFtZlNmTVR5ZjFWVW9IZ1dxclp6bTI1WTYyN1FUUGVlWVdXUTV5NU1I?=
 =?utf-8?B?NlBVVXdFamF2aUVONEpFaCtDdHpCd2NJR0pLc3EzVHJqOHVCeDcxSXNzZXAy?=
 =?utf-8?B?bWN5OHZ5NTg3N1VJVFFtS3pLSVRMelRmdmVBWHFZeVhTelJobzdINGZycnpm?=
 =?utf-8?B?aHRNOEpwODVpWFFJOVZnaWhYY2xxcHBzVnM3Q1ZRMDIyTzAzUWNZK2VZZFNJ?=
 =?utf-8?B?ZGdLYmxWSENudTBUN2tLNEd5cnAvOUVNN2JIUG1jQStPeVFpQ2o2K1FSQ3JD?=
 =?utf-8?B?V2xSVTdBYm1FM3laTU9jb0RBNHJ3eDFvTjhrbTliUnlqay8yc1hja3ZkY1VK?=
 =?utf-8?B?c1A2ZDIxeHB4MjJlZzkrb2llRVNNZTRDYVk2aUdoam5xeXM2MVpKbTFLcENW?=
 =?utf-8?B?YTBVeDA0SE1oVTB6RVczQ0JFdlk1STIzQ0JZRngyRHhtNkRwTWEwY1hRZEZQ?=
 =?utf-8?B?WGt5VVpkMGpDdnNUK0NnejlZc3gzUCsxbnUwWXBzQXl6bGFhZWx4ZzdEUDBq?=
 =?utf-8?B?aGdPQzVOeFJKY3VsL3lVUTltbm5qQis0eEF5blYrZEEwSTZtSVJ6NXJWbWhC?=
 =?utf-8?B?a2hLMjFpU250ekJRaHBYKzE1TGoyOG96cDF2d3k5Q1NHM251U2dxRHBPQ0N3?=
 =?utf-8?B?OWIwZGJWM3dkL0cwQ3lTdVplZlJlT3EzK1Nra2hLdTFhZ3BrWEpBSVUreTRw?=
 =?utf-8?B?bm1rckpuTFUraXJNMmsxWjVIazBSQU4xWFpuWVpFcG1RSjBIS1hSVCsyTjZj?=
 =?utf-8?B?bml0cVRRU3NROHBpSXMzRDNZUHdSSkUvd1VoZzBRRjBhc1hGdFhkMDhIYmNy?=
 =?utf-8?B?RTIzalhRMU9IblIwYlJ5bVJBTllxNStNbjF5SUdMWnprNlMrODk2N1NmTVFW?=
 =?utf-8?B?R2NNbUNVd3VnOXBzc3c1bjNhQTBELzFRR2xrL2llNnY5d2hYT2xVRHZycko5?=
 =?utf-8?B?My9Db0hRS1dTMnNubDlRZVdOc0g1dkdKQ0h1bGJpUTBUTEpQTmxpRTQrVWFN?=
 =?utf-8?B?cThpSTZ3c3FoTkNlUXhqdHlzQ3VZTVlGQi9VbFV5NjhyTThsRWNHR2svUGt3?=
 =?utf-8?B?SGtIN3RXWGtCWlVIZjVtbFpZMmY1SFJMWW51TnZ6K3NwNVlDYXA4RXpJRm1W?=
 =?utf-8?B?SDdabDJJc1g5SVJLbWlpS0ZwaldoN2pRV0VyZW5Ic3ZrRGJ6ajJnMkpiSXdI?=
 =?utf-8?B?V21MQlJYVEUrSHZXUFBISXp2Y1RpQlVUZ0k4RlJkZVFkeXNwUGpUOFYwbHNG?=
 =?utf-8?B?V2tES0ZxZHhFTngyOUVqelZFSFMzT0llZEkzVE1wMFZCT1Ywd1RJZ2hKeGMv?=
 =?utf-8?B?WC9YMXMvSXlrY2RaczNqRUN2ejY3eTlnM3ZnZWJ5dmhCeWRyN2luTEdJc2ow?=
 =?utf-8?B?UjRJRWh5RUNiV1RtRjFteGNGUm1iVldxVGxwb3A4ZEVMVkFETGdJMnAyOGMy?=
 =?utf-8?B?LzFsRTFkcDVnNXhHSlBiTjZac3FVZkgwRzBZRVBINWthSk1VU0N0Y0VCNXQw?=
 =?utf-8?B?THpRU1pDa3hTc2Z0N2hIUWU0c2RzMzgwdjJJYTgzZVpscXRwbDh3bW5rN0cy?=
 =?utf-8?B?NVAybVNpSkR3M1JVankzWWRrd1h1ZGZPMG1GYWtTVjFqOVEyQkRSYTVPcndU?=
 =?utf-8?B?WFNrUHg5WTNjSllvZ1NxQVRqMFJjTE1hSUM1RWdYcFJsS1FYL3dwT3g1UkZO?=
 =?utf-8?B?eHU0MENRTHQwK3czalM0ZDZITHZmVHZhU3d3RklJNThhVmpDWXZ4Nmo5a2lq?=
 =?utf-8?B?OGFaZnNoL3BOd29RVjlDT096b2ZzMWZ4TkFPK0d2Zk9MdE4yQzBzeks2eXlY?=
 =?utf-8?B?TUluR2Y0d3BEQVNVZjVJb0xSVDBhZW4vYWdwdFBYcHIrL093NS9TQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d7c7ff6-bc40-4cbb-0ecb-08de65ae84bd
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 18:35:35.9992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IhbyVhCWxKLzVRxkrMr2ykCFmHeL+u7DAFNgbleAw5NcYWKgzBLcwwYPLaDgbJ7uIbYlfmc4UjAwMEZNirPS8ttdGpm3hNrpFtJV3bKAC28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB7307
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: F422A101F84
X-Rspamd-Action: no action

On 06/02/2026 6:31 pm, Roger Pau Monne wrote:
> Currently do_kexec_op_internal() will return 0 for unknown hypercalls.  Fix
> this by returning -EOPNOTSUPP instead.
>
> Fixes: d046f361dc93 ("Xen Security Modules: XSM")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> Arguably the error code for unsupported kexec hypercalls was already wonky
> before the XSM addiiton, as it would return -EINVAL.  It's however way
> worse after the XSM addition, as it returns 0.
> ---
>  xen/common/kexec.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/xen/common/kexec.c b/xen/common/kexec.c
> index 84fe8c35976e..8f52c5506d4a 100644
> --- a/xen/common/kexec.c
> +++ b/xen/common/kexec.c
> @@ -1217,9 +1217,8 @@ static int do_kexec_op_internal(unsigned long op,
>                                  XEN_GUEST_HANDLE_PARAM(void) uarg,
>                                  bool compat)
>  {
> -    int ret = -EINVAL;
> +    int ret = xsm_kexec(XSM_PRIV);
>  
> -    ret = xsm_kexec(XSM_PRIV);
>      if ( ret )
>          return ret;

Personally, I'd just have `int ret;` and leave the xsm_kexec() call as
it was.  That leaves the slightly more normal pattern intact.

>  
> @@ -1258,6 +1257,10 @@ static int do_kexec_op_internal(unsigned long op,
>      case KEXEC_CMD_kexec_status:
>          ret = kexec_status(uarg);
>          break;
> +
> +    default:
> +        ret = -EOPNOTSUPP;
> +        break;
>      }
>  
>      clear_bit(KEXEC_FLAG_IN_HYPERCALL, &kexec_flags);


