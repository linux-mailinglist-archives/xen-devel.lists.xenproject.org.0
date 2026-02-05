Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLXEFTjihGkE6QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 19:32:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5A8F6741
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 19:32:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222390.1530336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo48Q-0000hv-R3; Thu, 05 Feb 2026 18:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222390.1530336; Thu, 05 Feb 2026 18:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo48Q-0000fB-Nz; Thu, 05 Feb 2026 18:31:22 +0000
Received: by outflank-mailman (input) for mailman id 1222390;
 Thu, 05 Feb 2026 18:31:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2IOj=AJ=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vo48P-0000f2-EV
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 18:31:21 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8800d0e-02c0-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 19:31:13 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA2PR03MB5916.namprd03.prod.outlook.com (2603:10b6:806:115::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 18:31:07 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9564.016; Thu, 5 Feb 2026
 18:31:07 +0000
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
X-Inumbo-ID: d8800d0e-02c0-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZJUgzteyiHSCgG1zjDd3rZbio0z+K1Hyq7BRzBRzI7EAWJkydOg8D4DjUwzy08QO0PFw1fs4wdL8LmCJzzC5Xsxp36Z4qQUb00oB4J4QYBoj1Q/tzx5+sdKHI80+bDSwvy1whi2Cf9U9c6Z4fIQ7/Szw2XM+35q4+B62R+NJ3g/IihFy2/0jrFaPNndGEY00CylvG49TsGBv1m2/m4MbbIjquETESVjM+bL1a/u9Mqy6x+B6T4BOZXNNp4I7/rksRNPZUsinQ2W9u9znnPycp4LWDOvMAAjSMAfEJInT7fXqLgScvd+oZvabKPxiMuVSrQiXihiz1HEECfIea1fWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBz96SJgPv9cMl5vVj12UY6iNXe/Kom5kWn+EVxny9I=;
 b=Wi+4QUpiWG1XvL4IREDdwLMjF/B+cxFlLbpGSnT1V8Wkav5MDEv11E71oMxiO9yfbHB/sKaPYJlCN7JLHzNL1trZEus7OfR3NYbmDiuKbFOkI33Fz6OK7vCMhLd+ByjjtUwfodFfA6SmqtftOwhvwDeRUMkS0jjSFTW9qV6vLuylklR/VhMH1aRL9doKZKy1xF8WAt2e7a3l/X8K81Le/fTc5DWNlIs7SGFnMOZ3T79IletkmVC6hhvezVFC6749wuTdUhzPWbgrzF2LxxhugGJezLlK5OWDA0rDwMjG59zrrEWsfhnBku8CJMuIjVeAjy6WCiMFJ+/yYLhj9q+B5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBz96SJgPv9cMl5vVj12UY6iNXe/Kom5kWn+EVxny9I=;
 b=IDck2E95MJqtj6va6c4IsLlIAD3+XY3hURFYoKu3LdMaeRe83wj1h5unKmE9tsOX80LBN7jZkmsmzod3Ij6tDob9QUep47iXnJ3clGbVvARH0AnYt/jTNuMv3t3bv8hpm50pg5MUK7vOQdSbGnjFUcnsG+z04LJQw2i1uDkSfhw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5397aef0-2103-4775-af45-49a100be7ab6@citrix.com>
Date: Thu, 5 Feb 2026 18:31:04 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3] x86/domain: adjust limitation on shared_info
 allocation below 4G
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260205080308.91057-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260205080308.91057-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0671.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA2PR03MB5916:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b963a33-6f67-4269-1a5f-08de64e4ba7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?algxb2NjNHg1S0N2ekozVFZtemtXYWU3SndGUjBSVjdPUys5K25SaThmdTRP?=
 =?utf-8?B?THMvT0l3dkI2Tk9GWHl3MWNiU2RSL1loNEFPQTJybjNjZWpvODhWTXN3TGZj?=
 =?utf-8?B?dmhLMXBpVVhmM1RIc3BPamxheDQwL0dzT2xMV3g2eGNRWTYzT0k2UmRMNHgv?=
 =?utf-8?B?bTg1cmliNWgxOExxZjRkVUdONkpSa1JFRFlaeXo3Uno5bTFNMTlNUUhFOUxa?=
 =?utf-8?B?OGNxcFF6Q1Y1anJNbkEwMFJBaVc0ZnBjVTQvMjVYWWcwNzY0K0JmU3FQL0hN?=
 =?utf-8?B?ZDNZK2hNTldocS9rR3JCLytxL29tSDJxM0JWVkMvU2VUR3FQMEV1VGJIY1Vy?=
 =?utf-8?B?bmZEZjVmdWxjYlBkTSt3ZTdEZUYxcUM1TmtnelgvZXlUYTAvdi85M0dMSzFW?=
 =?utf-8?B?SUFicXVrOERLMzNWOUh2UVFXbzNvRDc1SGJTbWluSjZYVVdXVEJzdng1bWMv?=
 =?utf-8?B?L0N5b040TFl3ek1YWlZ5M0RnUWpLVTNHQkorVEdYMUk1UTc5Yko0cE5RcUx6?=
 =?utf-8?B?UHhESXVDYmx2aFkxWVJxMWR6TXBXcFJyaUxydGg3MU01UWpoeGk2STZkK2Np?=
 =?utf-8?B?SXlJcXNIajQ4N0U4bSszYnVhMm05bTl3bjJuMlRlRG5qSmRYajFXVlArSFZj?=
 =?utf-8?B?bUljR3FCMDBqdUh2cmxWNHJ1Sjc4aDlrK2s3eEJyN3Q3WHVvVXR5YklUZ1o3?=
 =?utf-8?B?bzU1WXJ6eTFNZE5lREdrZkNoTGt5dXBCK3UrYi9HZWxHdEZLcjNNQ0lKdkpG?=
 =?utf-8?B?OGNTaXNOOGJOeFdzeXdPemIyL3V3YjZLU2xSQ3pLK0VkblQwWVN0ZGtaRStF?=
 =?utf-8?B?UGd5T05URjNKbld0ZmEycGVzWlhYUEg4R2M0aDNrdDJwMnUrM25DSlRVNEUz?=
 =?utf-8?B?dUlLSUVra3ZrM0hoVmt5NzJOTnZ6WXNqTGJGa1Y0MEpyUnEvaE1URXF3T2to?=
 =?utf-8?B?UGhtL1pIMU5hVk9tTFJNZDZ3Q0NpeEJmL01IT3JpdFhtZWh5aXRFcDN1QU1K?=
 =?utf-8?B?NHR6WTJldldNL3pPRXV2b09PQStha3JjSWVGb3NGSmN2L0JTeUtNU1VvZmtK?=
 =?utf-8?B?aTRrc1UzMkdXb3I4VEZWS2poK3RZS0ptbm9LOEJYWkVmQ1Y5Ukd4TFI0MU10?=
 =?utf-8?B?SnVSQ2kyZERDM3pRak1DNTV2VmM2amdkYmRKNjQreXl1aG1kQUx6cHo2U2xr?=
 =?utf-8?B?MnQ5N3JXcWcvL21JZ3BpZlhZbWhHNDdwalJ4bUN2T2tDbzhRUDdiNEZDRlln?=
 =?utf-8?B?Q2Q3MVgzbkRraG54UHpwekwyWWNDTkxnRnFkNU9UMTJXbDVxMG5kS1VhVk92?=
 =?utf-8?B?Tk5WQ3dXdnBtVkozZGRGb3pJV21walIwaEZVMGlrYkZPR3lLVkptZkd5ZTVR?=
 =?utf-8?B?R2IvRHdVL2tlNjhYN2dtR210ZUxHZXJMTTZNMVR3V3FHbmhKZkJPblJkbkIv?=
 =?utf-8?B?MHAzUlF5Q1hpSU14cjBxK1Y5TUwxMGpVdWY5MkZpS2VVQ2QrZ0cwZzNNaC9V?=
 =?utf-8?B?TUhJQURETzl3d3Z4VGVQRWZCcytCOE81eWRmYWJWUDh5Mzl3ZXpzemFSTWpO?=
 =?utf-8?B?NmN6VzNzU1VBZktGM2plNGkwYXNhQ05Wa2hMZTJ5TmFoUnAyTGI2S3NhMEFZ?=
 =?utf-8?B?Qy9nTHV5ejBMbm9vZEhHWkk3d0VVbFhaMDhkQzlUQ0pjbDVFUFpTcDJQOTNG?=
 =?utf-8?B?aE5wRWRUZk9RajRJSE43TkZjSlVpTEh2azZIU3dNcE9CeDkxSUpVYjhMN1Yw?=
 =?utf-8?B?TTJEUC8zNWZXRUkxcVJsMFJqNGFMZS94SWNScHdUZGlOSDV6dUZ0TXlpZ2R2?=
 =?utf-8?B?L29saGxibEl1NzBDeXVtN09KeThCdCtPY0MzVGw3N2UxaENIS1Iya1dTS2sz?=
 =?utf-8?B?SG9laGZsRHhLbk5hZDJ4NTVUZ0NzQk50akJML2RyMzNpSThsd1FtYjRraFRZ?=
 =?utf-8?B?Z2t2OU9jWGZmNHlHdkN1dzVtRWtNTHgydTJTR2pSMWFHc2FqUHlFdHl0bUhG?=
 =?utf-8?B?R2lUVXI0VURwMWc3QTJqK25MSk1ic08yc0dBbldRTzkxdTBIN29RUThPZS9R?=
 =?utf-8?B?QU5ZWUFMQkkyaElDRk92NHZiOWx1UG5LdWZEaThNRU1yNFdDZWNkellvK2hQ?=
 =?utf-8?Q?zeuk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEVzR21nL0kyUjAyZG1zNW9yYU5YaGhRc0Q4OEN6NzZJVnNOamxIdTNqTnFQ?=
 =?utf-8?B?L3BBUEtYQVJGbSswWHdKeE5nTkkxc3hLM1h5b1I5NjRkYUNGbTQxQkR0cTFo?=
 =?utf-8?B?M0hTZ3haYmtCTlF1RlJERDJ5VXk2MWwrTDMxUzIyWkVjN3c3YkI5L1RaQjB5?=
 =?utf-8?B?aTE4cENnZm5GYVlEMnNzNWxGcGpDVnBkTmVhaGJjNG9WSHMrcE04U2RPdG1o?=
 =?utf-8?B?ZFpnSkdZc2kvMG05WHh3Y0doZ0piU1R2b3QySTZOeVJ5Vm8zV2ttTGk0bEsv?=
 =?utf-8?B?cDJkS21pK29vS0VkbFZHN05ySjNXaEJ1Z1owS3I3R2lTREVJUFhIQW9ORWFp?=
 =?utf-8?B?aWdkTU4xRVNJQkdZd1ZIbkJnVS95VVJ4ZmlSek9WRS9VSkk1MHpYRkduOWV0?=
 =?utf-8?B?WWFFS0o1Qkp1M1FDcmJCZmZseDMzUUFJaTZQbk1JTnpXQUdKMzNpYmE2K0Ez?=
 =?utf-8?B?dUc3ZTc4Q2RTUE8vYk5QNVY5eC9IZWd5aEJUK0VLQU5VdG5TdnpaeU8zTTVj?=
 =?utf-8?B?Mlg0SUJocXcvTmljYU1rcGhtUlZBT2xMRFFId0dVYnZBR1FLdkhsVWFHR29Y?=
 =?utf-8?B?U1lBVzVrTWVUOEZ5U0ExbmN5SlVHRnNtbmYxTVZkeithOUp1OS9aeG1yTjln?=
 =?utf-8?B?emxaQjIzNm5RdHU1TDEvbkZHVjFaWjAzYk1mWVpvM2g0eS9DNXJ6T2hBNzIy?=
 =?utf-8?B?UzRSRkxacHJ4QjhsMGRnT09yV2JkNTZkRWNHTVh5NTN3d0FMei9NL3A3cHda?=
 =?utf-8?B?M2hSK2ZBeW1MODdxSFE4bWZDb0Vwd1hKTE5za0xqTlhxWHBSRTFmaDkyamli?=
 =?utf-8?B?cG1ZellPSW5ydis4TTFlSVdoYndHUE01SFNaV1BQa256a1h3enJnL0RDTFF3?=
 =?utf-8?B?dkIveThEUjhTbVdnMGZsZDdYZzJhQW95MFF6QkN3ME1reXZkRXdnL1NZVTJJ?=
 =?utf-8?B?ZDZlczZRZzZvclc4U1FKd2M1MGFnb25zZWhaRnFLd0gxSE1yZFZucjVCRmU2?=
 =?utf-8?B?R3g4K0lxYjkwbkp2UkpQbTRHN1hOY2hCazNUdjhybVQxRUE3UUhmL2M4L05p?=
 =?utf-8?B?WmdRdmxlWXdpOVFGVmF1cmp6VFZybTgvYTVnb09Kd1J2YWo2SzdITzRCMHRi?=
 =?utf-8?B?UStCZ05JT2kyTlVHR1IvTWpkRldGZnYzRmVOMGdzbGxJOG1ZbW1OTGZnc0h1?=
 =?utf-8?B?b1BpajZRNUc0L2ozR0tQczJFZDRYUzJ6NVBsK2JQbmlGaEN5TlQxTGt4am1x?=
 =?utf-8?B?UUVpdEEzVkU4SGU0RENTeVd0UXlnMDVMcFgyek9IQm1SeEd4MUlheHRtVjh5?=
 =?utf-8?B?Y29Md0RUTGtyWVhITW1JSU04RGFhSlFzZXR4RThsVjFkSlZVV2cyUVo0d1hR?=
 =?utf-8?B?dVRjSWt4b04rMjZZaVJ0OXArODYyV21DMFlQRDBxem5oNW5ydzA3TnFJQTFS?=
 =?utf-8?B?SXJkUjA2YlVCYmcyNlpOQmNGb3d3bkd2TEdxTCtmd0Z5UjI5bG9TeXk4cWJu?=
 =?utf-8?B?Qzl5dTJVbDZyL2ZtM1lhVDl0V0FuSGZTdGxVbWRidG5jbTNRaXpDU2pSU044?=
 =?utf-8?B?T1pJQUIrQ1pOanVUeXpCOFVDOE1tUU1NMm4rSWQ0WFhyVGFNYWVQdjgwQmI2?=
 =?utf-8?B?bXBpZjNHNXhSMDNyKzVtaTMwSE1rRGF1dTFRRWdCNjZhNnE4cU9YSzNhQS80?=
 =?utf-8?B?M2IxZW1tYjhOZ0FUaWJHRkh0THk3L0QwTlI0OVNFc1gxaGJsZnQ1TGszWlRq?=
 =?utf-8?B?OS9xWWZFeFAzRWx1Q2ZZUElsbDhRZTVySDY0bHI5bkRqaEdiOFp6VmxOV0Js?=
 =?utf-8?B?T09uT1J6K3ArTjEwbVUwVHBrR2tTM1RLWUxrZDRET1lxSXJiNXBGZkMrSXZU?=
 =?utf-8?B?Qy9INzBCR1RoelUvMEI5ZVZpQkp0RlZwKzlNL0FVTUkxOGJIZGZSMGxhZFZq?=
 =?utf-8?B?WTM0ekp5SjVOamJ2SlVObHdrbW4wS2xGdVptWVJRYkpTOHhCeE1ROU9oUmZH?=
 =?utf-8?B?WURBVzE0ZTdBV3phUnMrblBOZSs5TkJ4RlN4YkY0dkwzcm1nKzFIcVRqeDVD?=
 =?utf-8?B?NW9FQmo0Nm9hL3RmZXhBUTBYN1dtcEMxRlRIWDYrQ2dlMU5XYWZzdVMydjNm?=
 =?utf-8?B?RW1Ya2FFRkNrMlVRQkloK25XQ0phclAxOFNUeVVlL3p0R1p1OVVPUHh5enV0?=
 =?utf-8?B?ZFJYcUN2cWM4SndIRW9ObVFaT00vYUVZZzRQcFVyQmNWUjM2aTU2K2tNQVYv?=
 =?utf-8?B?SVNxY3RsdUcvWHZRNXhUc0hndnNkaTRhY1c0aXpwQWJKSlR2UlQ3Z1RFS1U5?=
 =?utf-8?B?aEZNZXFyRHArTDM3RUpTeStnbHVnOEZmVkxyREp1NnlBaVJUMWxsdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b963a33-6f67-4269-1a5f-08de64e4ba7b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 18:31:07.7874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R2SG3ffqkBV5QNhFth8hR8c65+5VhNRSqPhIaQ/uH2Qr5WUoUXMWA/TYn/228GlC8HbaqZkzlfoUqbSprKgEr5KqoGPikp0EwhToZDm7C84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5916
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8C5A8F6741
X-Rspamd-Action: no action

On 05/02/2026 8:03 am, Roger Pau Monne wrote:
> diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
> index 01499582d2d6..e3273b49269d 100644
> --- a/xen/arch/x86/pv/domain.c
> +++ b/xen/arch/x86/pv/domain.c
> @@ -247,6 +247,34 @@ int switch_compat(struct domain *d)
>      d->arch.has_32bit_shinfo = 1;
>      d->arch.pv.is_32bit = true;
>  
> +    /*
> +     * For 32bit PV guests the shared_info machine address must fit in a 32-bit
> +     * field within the guest's start_info structure.  We might need to free
> +     * the current page and allocate a new one that fulfills this requirement.
> +     */
> +    if ( virt_to_maddr(d->shared_info) >> 32 )
> +    {
> +        shared_info_t *prev = d->shared_info;
> +
> +        d->shared_info = alloc_xenheap_pages(0, MEMF_bits(32));
> +        if ( !d->shared_info )
> +        {
> +            d->shared_info = prev;
> +            rc = -ENOMEM;
> +            goto undo_and_fail;
> +        }
> +        put_page(virt_to_page(prev));
> +        clear_page(d->shared_info);
> +        share_xen_page_with_guest(virt_to_page(d->shared_info), d, SHARE_rw);
> +        /*
> +         * Ensure all pointers to the old shared_info page are replaced.  vCPUs
> +         * below XEN_LEGACY_MAX_VCPUS will stash a pointer to
> +         * shared_info->vcpu_info[id].
> +         */
> +        for_each_vcpu ( d, v )
> +            vcpu_info_reset(v);

Sorry, I missed something.  Reading this in full, there's an obvious
(risk of) UAF.

put_page(virt_to_page(prev)) needs to be no earlier than here, or we've
freed a page that we still have pointers pointing at.

In practice, I expect that the global domctl lock protects us from
anything actually going wrong.

Nevertheless, for the sake of reordering the actions in this block, lets
just fix it.

~Andrew

> +    }
> +
>      for_each_vcpu( d, v )
>      {
>          if ( (rc = setup_compat_arg_xlat(v)) ||
>

