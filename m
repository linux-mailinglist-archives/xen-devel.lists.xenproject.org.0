Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED782C0249E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 18:01:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149468.1481129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxks-00031v-2O; Thu, 23 Oct 2025 16:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149468.1481129; Thu, 23 Oct 2025 16:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxkr-0002zu-VT; Thu, 23 Oct 2025 16:01:33 +0000
Received: by outflank-mailman (input) for mailman id 1149468;
 Thu, 23 Oct 2025 16:01:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hBmZ=5A=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1vBxkq-0002zo-GC
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 16:01:32 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 862583d5-b029-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 18:01:24 +0200 (CEST)
Received: from DB7PR03MB4140.eurprd03.prod.outlook.com (2603:10a6:5:34::10) by
 AS8PR03MB8928.eurprd03.prod.outlook.com (2603:10a6:20b:5be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 16:01:21 +0000
Received: from DB7PR03MB4140.eurprd03.prod.outlook.com
 ([fe80::e16e:b655:974f:43f3]) by DB7PR03MB4140.eurprd03.prod.outlook.com
 ([fe80::e16e:b655:974f:43f3%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 16:01:21 +0000
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
X-Inumbo-ID: 862583d5-b029-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmfVv30YZnqP4BwRSTf2poPKUPp1Y043vwCnsXfWq7q0Kz/Ve4R/u/R94n973/Gay8nXoNffnDEZ9yOXZIVTLPLUsflN2wUtA4o3YEWQON/VgjrUVCRk5jXoKAJgQ3XzaDfw4uv4eJD5QaeknLo+/cE6e9LS0SJBuSe4Yi+bJtfIOqkoyzDkxwq7Eob2fzHlRBHWs/dN0I4NdcW8aIlxTVEQiqSf25qvAhP/zEChFpFNui6+mQxbcov/rixdg/ghsZr//n6W+bCOX3JGO57FqWAGf9q4PyxjRU80rdwHfkEht5UVKjHnI2YDDFHaFS5rkSJQyM2TpCp/rGlCbGzq9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+ei4kCdxzuRz9VNw4YKAGQ48mQ5DmteawX2DbpcDGE=;
 b=jftQnhVvH3tOXYV749agIrkbvAqu0ALHVTBmRiLpK8/L7Nswp3DpkxxxO0p3iyfut5xPYF1fH8cgGH5s/RvOY6abr7XmaKjYNzsSSbS8+w0RGxmeIngU56spHdwKqEDzir8va2h80aYrekcpfxfeFeG+vigkILi2ew1fGiEAev3x+5XXzV8EzwLeqODS44Guas3ytLvvknOaXbgArQccmqfov5FdiJ12dARibC774ksmwOafO9RiYTlwwRrEXnLAUSsfF9FFCN9YlPdZHY8LZSN+G/XFTtubxiWuYiYGB2iHtBMBYIpTl5+8bb+gX/X2tmTtaYPDSo9TrUAP8IpATw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+ei4kCdxzuRz9VNw4YKAGQ48mQ5DmteawX2DbpcDGE=;
 b=NH/VPI6+N74tia7ILEwIs1fbDYrPgUDENfT21yNKQDYcwBsc84RN4oF5WEP5haQGzsJwKEiDcX5tvG6mDSDVcgkWwraIcT2ldHjlMdA5AesdLvfWMIZ2ye5wo1TUb7XjExdo0oZ4mipuTmHEwe0NaZY5LG4lus0hYrrXcy6jOoOeO/+yymx4HTvAfgaYAtHV0VsMwzoUc3QwxGIK0EC+/S9EMRz0irGHCiiU59B0nk9Xso+VMcibYRoHzOOx2xnvpoV9odfaGqWqsoJIzmP349w4aTD8gRHpaoGyRLA0sF5gL+heZcViH3YMNpuInawLHvk8Bt++WFfu/fkWsSxnXw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH v3] misra: consider conversion from UL or (void*) to
 function pointer as safe
Thread-Topic: [PATCH v3] misra: consider conversion from UL or (void*) to
 function pointer as safe
Thread-Index:
 AQHcPSX2fWa1eZv9x0mRzqs7fz2kjrTCvSwAgAMyXQCACZ3PAIAABnOAgAA7uwCAAAxfAIAAFloA
Date: Thu, 23 Oct 2025 16:01:21 +0000
Message-ID: <276064a9-619c-4d08-ac9e-0f92f01cef10@epam.com>
References:
 <0e72c83102668dfa6f14c4e8f9839b4a73d30b3d.1760458094.git.dmytro_prokopchuk1@epam.com>
 <ceedeefa-c506-41ca-9dfc-76937979caa9@suse.com>
 <321363444f9a3d3471bf1b3b2e020047@bugseng.com>
 <0767a5c4-6a2c-4ed0-92d3-f9f89313ad85@epam.com>
 <64411f5b-a826-48b6-9122-bf80ac377c7a@suse.com>
 <9a09cbab-851c-46f1-8026-603a7cb9d79b@epam.com>
 <5a6d1670-ce9e-4264-bbea-786df5cc5679@suse.com>
In-Reply-To: <5a6d1670-ce9e-4264-bbea-786df5cc5679@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR03MB4140:EE_|AS8PR03MB8928:EE_
x-ms-office365-filtering-correlation-id: 5e42f8ff-c02c-4b67-8c7d-08de124d68d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|42112799006|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?MnY2SUw5ZjRQcmttMUlpZ01laHYwZTZVNFVieUhaRGlWN25NSm1uVWxPUGti?=
 =?utf-8?B?anpRRWIrUlF4MVFhUi85SlQvYmJkblFIMzl5Z0pPcXBHQm9iUnI3S1k1YWlw?=
 =?utf-8?B?c2R6QnI2bmR6a1QzYkRLQ2toa0dxRGpHNXBtRURmOHByRHpnR2MyNHUzRmlQ?=
 =?utf-8?B?OWN1SXhWWDJIMnpVVytnakpZZnlSOGJqZGd1Q1JnbkM5VDBJMUFTNXVOVTNK?=
 =?utf-8?B?SDJuNmVCNkl6b0dQczBoR04vRnhMcjQyQnBWZ3NzRlV1QnIyaVJGZ0MzQ1Vr?=
 =?utf-8?B?cjRoV1g4cGlNbm9wTGowRXJSazR1UlhPMEM4SDBiMDErWVoyZnF1NVpUOTNi?=
 =?utf-8?B?eHNUUXU4cHZPRmpZRUdSd2V6S0JBc1IxRnBTbW1INFI0QTFVaWxraFdyOFM5?=
 =?utf-8?B?REY2QkZxMS9FWnhUV2hxb2hpSGkvWjgwZitYS3dHdzRuK3VPS1V1NVJiMjZv?=
 =?utf-8?B?REY2eWllTnYxT2ZlTG1VVldNc3RVVGRlSkZVS3lES01hYStjYnlrNTFKOEtI?=
 =?utf-8?B?alNnZFpFMDlRblJQTWk0c3QrSmpEMnFLc1ZhcjdXNVFISG54WWkzK2pteG5x?=
 =?utf-8?B?T0ZsamV1WGNFVDJvMVZUcnVtd3RYd0JNcXMwMnpuTmJiejZUQ2JGWWdUNE5m?=
 =?utf-8?B?ZnpWSG5iclI1YkdTVVlwaEErT3krb2JVV2Y2K21SR256WjAwdWRXMFVxdnMz?=
 =?utf-8?B?SUJFRmFxb21VYXBENndCMHRpNW55bFp5MEJkbno5Z0VDd2VzM2NTNGVyQUtW?=
 =?utf-8?B?Y1NJSFg1Wmd4aDEvTjBYSUUzZWpuUkZOOEJkSmJWY29IWGRhTENlM0JwQzUw?=
 =?utf-8?B?SkswZWUvRXpIcTlvYWFVeU4wMTV5Qyt1YWcxV0pvSmRDc0ZVRUlMdktVbW1S?=
 =?utf-8?B?YkxPZEVDdzQzSkhGVy9tZUJJNy9ZVi90VkwvbnVFczR1bEFtMWVqalNJeFBy?=
 =?utf-8?B?NDVHZ3RFYm9KVHF5K3BDTEhzanFEMVhzVWg5dHc4M0xhVEt1N0tIZ01zaFN1?=
 =?utf-8?B?VFhISjNUK0VScmJFOVc3N3huRjdsMWRnU2Zvc09zZkwyUDE4NG5iZll3YnIr?=
 =?utf-8?B?eFU5a0pWelZxUFg2YlExTzFYbURJQ3d4WGN3U3JQUkZIOVVsKzE4QU1QODlm?=
 =?utf-8?B?UWRQclc1bm1IcGNQVlRKS0ZWVzExTm1hUTEzVXcrYmtzYUR4eGc4N2NhVSt0?=
 =?utf-8?B?ZDMwZktvbFlqZkhKWXowTmtpWUo4amhCUzlEamQ1SmIrSEFjY2l4QVZMbEdm?=
 =?utf-8?B?WElCZ0VpRnlpVTdYaVlKNHpWWjdoN3ZFTFdGTUpsMXVXR0x0eXRwbHBJTHNo?=
 =?utf-8?B?M2FRL1BSeENKNW5wUEdObzBvcGFLd2NQeUNCczRFV0VVb1BLYUVCdkJmWXdi?=
 =?utf-8?B?Q1o4ZG5LUzcvT2Z2azNvZkJWNmd0bEZUK1JhemFjOHpqZzhRZ0hEeHVUclo0?=
 =?utf-8?B?eVlzR2FtZmQ5NjVmYmYxSjBrcjVyWEtjQjArbG44R2R4dHljbjgvRjB3UEgx?=
 =?utf-8?B?M2FybnArUXZMWEgrcW54Y01RSGVBZ2tPb2dqTTNrQmZtbmV5RklyTmlzVjhE?=
 =?utf-8?B?MDcyaDd6ZjNVOGE4cGhmK0tra1VIYWMrakk4MDlRSVNDK2lwSWx3N09nbFRF?=
 =?utf-8?B?SWh3WVE5NWxtSEtLZ0thT2cxVnBoUDZkVFlWbHU4SmZudGhCbDExaHZ2MTF4?=
 =?utf-8?B?MVdJbkRWY01SenhkYUhpYjI5eFZMUUxMcHlEd2ExQ040MkYvdDlmc3I4STdk?=
 =?utf-8?B?bmd3bGd3OEthTkRjUldRMDRWWlJ3YTBSck1vZkw4dzNDL3dlMlVyOGZKeXY4?=
 =?utf-8?B?dnlFcEVlcmFMdkJKdWhxR3BsUmw4bjhuL2JpY0NhdUt2VlE0dGFCUTVseUI5?=
 =?utf-8?B?U25FLzRod1VyVzFpY0RXNGMxcTRkQndJMFNnRytJR3NZVzRhSGkyY1FteFFp?=
 =?utf-8?B?bFJ6STZNTjlOZHVsaU0rSW5EVGhha2hyZ212NHZmeTVYcjB3YkZkN3NUbHpz?=
 =?utf-8?B?YXRkRE5CWFIzd0JWbTB4MDhaVXA0cmFsUmtrNVNQWmlyMGxVNmROSFIzR2h0?=
 =?utf-8?Q?tH30BZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4140.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YWU4QzBNQmFZSW5sUm83eW9HZUZPcit3d08wT0pxNnNma1RuanRTMDhLdzdZ?=
 =?utf-8?B?eTgwWlU4Qi8rb045SGZkeU1jQTVPNHdudTEvN1JRdXhUL2t1Ty93aE5qYjAz?=
 =?utf-8?B?SmhjSXhSVlNtY1p2MjBrb1ZtelpiVXVjMXpUbkVGUThXZ3VjcFRKZi9GczRy?=
 =?utf-8?B?Nkhxa2R5Rmo2M1NYUEpqenlOQlh1SjllMXoxb0k0ajJ1T3V4VXU1NmcyejRo?=
 =?utf-8?B?dlp2b0RoYnQ4MVN1Z2k2TDNKTFlUYlVYdU9peUhSSGNxTjRLZzBOSDFXbUtU?=
 =?utf-8?B?QStlY1dDU1JQRksvZ1didzl5NVdDNUdrZ0ROZE1tYXBOOHM0a3Q5NW9mbGRh?=
 =?utf-8?B?NXRHQ2EwdTRuV1FkaFlSWk5KcjJlRXEvb2xqMFdvaFd2UFBzNU1YYkxCenh2?=
 =?utf-8?B?elR2QitLN2U2OWdJLzB4bEFORXdaZW1va0c5S1lIRUJBcmtEM2RPcms5UXFU?=
 =?utf-8?B?Ui9EYzhGQnczdzRpZXUrcjZoc2V2TEhsMVpsUytqNzVSSGhST0xDdFo4dVpi?=
 =?utf-8?B?dGRLYnNFNDBzMC9QUVVqZXFGR2hiOGh6YkJlb2tZdS9uOTdCaWJma2VqcUIx?=
 =?utf-8?B?SlVWcEN1ejFremhpTkdvZzRDNSszQk5aM1F2OHBXL01Pd0wxM3FYS3dtKzIy?=
 =?utf-8?B?VDJzc0xuNDhpRU9LcVRESmVPc0trODk1WXJCQ29BS0p5SkhEWWRTWS93NFVC?=
 =?utf-8?B?Z1NCMHhSN1BsaDBtZWtaTSszSTZFSk42RTJiQU1Kd0kvSEp4QlRqNHJsclhx?=
 =?utf-8?B?Y0dWeDRhR3RTNmFQdzkrRGZJMTN4UEtGSTVLS29HbUtvRkl2MS9IT0Z1alhv?=
 =?utf-8?B?NmVNbk9OWkpSK2F4L3hEZzZpKzBkTE5NKzF1R2VMWnhqVVhVZHBkOWRWSE1m?=
 =?utf-8?B?cHZhU01rS0l4aEF4Wm1seUQzUVR5cFFnZ0JJRVBoN0NUWWliY21aaWh2V2lF?=
 =?utf-8?B?bUg1MHAzQXJHZUhnZzFzeW1UaTRLa2VSTTM2WXgwZzI5RGV6M2pkSFdMZDJQ?=
 =?utf-8?B?QlZBOXBoZkY5UUwwd25LR2V1RDd0bGJLdlRtc1A3d2EzbmZFaHJJdEZSRWUw?=
 =?utf-8?B?c2dzVUlHVHBJcEpRMEN6WnBycERHRDdTcnhrcVI0YmlmU3VwcUZxTENKWFFs?=
 =?utf-8?B?U1VIeEVtaXNKRTd0eWpxRHlZUVgzY3puaU16S1RJckt4UkVSUFUveVREUzZj?=
 =?utf-8?B?UVU5UUdYMmZlZWJPU0NUcGFQbWZxMkwxQ1p5MVFFUnhVRXkzYzZHYzBZdzR5?=
 =?utf-8?B?RFBvaVZkRDU2ZlFYblU4WHVNZmczb0pTUTIwOFh6b2VKaDMyU1V3Q2JyVzdh?=
 =?utf-8?B?RTB0akgyQjYwT3Y2dGZJYUd6b3MzY095YkdUUmNEOWdZdXc5ZURLR2VtVUVP?=
 =?utf-8?B?K2l3T0t6ZEFkSEVQK0hQazJXcDZjQVlkNStabVptQi9wWlhQUStQWlhJc0FX?=
 =?utf-8?B?d3B5elJ2eERIQWdjTWtEVWszSi9hdXZaTTd4aTJTcUJXdUFBVjVZeUVqOERk?=
 =?utf-8?B?QlFWM2d6TDhOWVdDK0xlWTljMWFUL2dFckdKeEhqTHZqMVU5Nmdmbmdpa2V3?=
 =?utf-8?B?dW1PcWJHT3JLNUxIVTViekJ3RVNaT2pqMlVwVlZMVXBOakJLdVB5Q210ZXhP?=
 =?utf-8?B?cHVDWXRDZ25rVlo3cWRBVW44WkMwd0ZoRXFHd0ZXTDlEK01GeUdsYXo0SnNC?=
 =?utf-8?B?elJ0OGFWT2dDSHM1MlNVbmdJNTNJKzJHZ0hnejJYMVNGRytDQVRTN0dwY0tB?=
 =?utf-8?B?UjJiTU1YME1BYjV1L2RRQXJwSGpzcGlKcDR2WFBMOWFuWGNuNWEzRytRTTA1?=
 =?utf-8?B?ZDdCcjRvbnJYa1JJMUZJenMrb2g4Z05PMmd2enpGTldUSG53ZXdubzFzajhK?=
 =?utf-8?B?WlJjb3ljYWNGSG9FaEFMZUR5SzFYUGtqK0t6MXVzMHY0TW5Yb3VublFzLzhW?=
 =?utf-8?B?cFFCdmJiQm5iREVESE42Y25RUU5PQzNaQXNBMGFFWDlYSzVSSFJVQTAySFlk?=
 =?utf-8?B?ZUJuT1BJelJmSUwwTnVjMHJnQy82NDd6RWUwbDI3eVdJUmhxdHJSVmdabDVJ?=
 =?utf-8?B?STBqU3RVYm9rTWhpL00zeC9qMkhJa3A5VnIxdW91RkNYcE1aZ2NCT3BON3Ba?=
 =?utf-8?B?RFNkR1pXQ005MzlUR2xXMnhGSERYSlBRS2VPbHNQT3RCOHRabXNLK0psekd1?=
 =?utf-8?B?QVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9603A114FBAFC74FBAA0B4AD20B3E181@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4140.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e42f8ff-c02c-4b67-8c7d-08de124d68d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 16:01:21.3622
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fI4zzPhcb16I/4iexZRyuMCw5XFIHTbk6QoCaIbuRRiFSrcGcHrvn0714mc4cPXRvx3JZxbtkw5XLv3ESnIXoa3EXwW7/C7L7i9GK7824Cc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8928

DQoNCk9uIDEwLzIzLzI1IDE3OjQxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjMuMTAuMjAy
NSAxNTo1NywgRG15dHJvIFByb2tvcGNodWsxIHdyb3RlOg0KPj4NCj4+DQo+PiBPbiAxMC8yMy8y
NSAxMzoyMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMjMuMTAuMjAyNSAxMjowMCwgRG15
dHJvIFByb2tvcGNodWsxIHdyb3RlOg0KPj4+PiBPbiAxMC8xNy8yNSAxMDowOSwgTmljb2xhIFZl
dHJpbmkgd3JvdGU6DQo+Pj4+PiBPbiAyMDI1LTEwLTE1IDA4OjIwLCBKYW4gQmV1bGljaCB3cm90
ZToNCj4+Pj4+PiBPbiAxNC4xMC4yMDI1IDE4OjE2LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6
DQo+Pj4+Pj4+IC0tLSBhL3hlbi9jb21tb24vdmVyc2lvbi5jDQo+Pj4+Pj4+ICsrKyBiL3hlbi9j
b21tb24vdmVyc2lvbi5jDQo+Pj4+Pj4+IEBAIC0yMTcsNiArMjE3LDIwIEBAIHZvaWQgX19pbml0
IHhlbl9idWlsZF9pbml0KHZvaWQpDQo+Pj4+Pj4+ICAgwqAjZW5kaWYgLyogQ09ORklHX1g4NiAq
Lw0KPj4+Pj4+PiAgIMKgfQ0KPj4+Pj4+PiAgIMKgI2VuZGlmIC8qIEJVSUxEX0lEICovDQo+Pj4+
Pj4+ICsNCj4+Pj4+Pj4gKyNpZiBkZWZpbmVkKF9faTM4Nl9fKSB8fCBkZWZpbmVkKF9feDg2XzY0
X18pIHx8IGRlZmluZWQoX19hcm1fXykgfHwNCj4+Pj4+Pj4gZGVmaW5lZChfX2FhcmNoNjRfXykN
Cj4+Pj4+Pg0KPj4+Pj4+IFdoeSBfX2kzODZfXz8gQWxzbyAobml0KTogTGluZSB0b28gbG9uZy4N
Cj4+Pj4NCj4+Pj4gV2VsbCwgSSBjb3BpZWQgdGhpcyBsaW5lIGZyb20gWGVuIGNvZGViYXNlLA0K
Pj4+PiBidXQgeWVhaCwgX19pMzg2X18gaXMgb3V0ZGF0ZWQgbm93Lg0KPj4+PiBJJ2xsIHJlbW92
ZSBpdC4NCj4+Pj4NCj4+Pj4+Pg0KPj4+Pj4+IEFuZCB3aHkgdGhpcyByZXN0cmljdGlvbiB3aXRo
b3V0IGFueSBjb21tZW50IGhlcmUgb3IgLi4uDQo+Pj4+Pj4NCj4+Pj4+Pj4gK3N0YXRpYyB2b2lk
IF9faW5pdCBfX21heWJlX3VudXNlZCBidWlsZF9hc3NlcnRpb25zKHZvaWQpDQo+Pj4+Pj4+ICt7
DQo+Pj4+Pj4+ICvCoMKgwqAgLyoNCj4+Pj4+Pj4gK8KgwqDCoMKgICogVG8gY29uZmlybSBjb252
ZXJzaW9uIGNvbXBhdGliaWxpdHkgYmV0d2VlbiB1bnNpZ25lZCBsb25nLA0KPj4+Pj4+PiAodm9p
ZCAqKQ0KPj4+Pj4+PiArwqDCoMKgwqAgKiBhbmQgZnVuY3Rpb24gcG9pbnRlcnMgZm9yIFg4NiBh
bmQgQVJNIGFyY2hpdGVjdHVyZXMgb25seS4NCj4+Pj4+Pg0KPj4+Pj4+IC4uLiBleHBsYW5hdGlv
biBoZXJlPyBNb3JlIGdlbmVyYWxseSAtIGhvdyB3b3VsZCBwZW9wbGUga25vdyB0byB1cGRhdGUN
Cj4+Pj4+PiB0aGUgY29uZGl0aW9uIGlmIGFub3RoZXIgcG9ydCB3YXMgdG8gYmUgY2VydGlmaWVk
Pw0KPj4+Pj4+DQo+Pj4+Pj4gRmluYWxseSwgd2l0aCB0aGUgdjMgYWRkaXRpb24gaGVyZSwgaXMg
Tmljb2xhJ3MgUi1iIHJlYWxseSBzdGlsbA0KPj4+Pj4+IGFwcGxpY2FibGU/DQo+Pj4+Pj4NCj4+
Pj4+DQo+Pj4+PiBJIGFncmVlIHdpdGggdGhlIHBvaW50IHlvdSBtYWtlIGFib3V0IGkzODYgKGUu
Zy4sIEMtbGFuZ3VhZ2UtDQo+Pj4+PiB0b29sY2hhaW4ucnN0IG1heSBiZSBtZW50aW9uZWQgdG8g
cHJvdmlkZSBzb21lIGNvbnRleHQgYWJvdXQgdGhlDQo+Pj4+PiBwcmVwcm9jZXNzb3IgZ3VhcmQp
OyB0aGF0IHNhaWQsIG15IFItYnkgY2FuIGJlIHJldGFpbmVkDQo+Pj4+Pg0KPj4+Pj4+IEphbg0K
Pj4+Pj4+DQo+Pj4+Pj4+ICvCoMKgwqDCoCAqLw0KPj4+Pj4+PiArDQo+Pj4+Pj4+ICvCoMKgwqAg
QlVJTERfQlVHX09OKHNpemVvZih1bnNpZ25lZCBsb25nKSAhPSBzaXplb2Yodm9pZCAoKikodm9p
ZCkpKTsNCj4+Pj4+Pj4gK8KgwqDCoCBCVUlMRF9CVUdfT04oc2l6ZW9mKHZvaWQgKikgIT0gc2l6
ZW9mKHZvaWQgKCopKHZvaWQpKSk7DQo+Pj4+Pj4+ICt9DQo+Pj4+Pj4+ICsjZW5kaWYNCj4+Pj4+
Pj4gKw0KPj4+Pj4+PiAgIMKgLyoNCj4+Pj4+Pj4gICDCoCAqIExvY2FsIHZhcmlhYmxlczoNCj4+
Pj4+Pj4gICDCoCAqIG1vZGU6IEMNCj4+Pj4+DQo+Pj4+DQo+Pj4+IEFuZCBwcm9iYWJseSB2NCBj
YW4gaGF2ZSB0aGUgZm9sbG93aW5nIHdvcmRpbmc6DQo+Pj4+DQo+Pj4+IC8qDQo+Pj4+ICAgICAq
IFRoaXMgYXNzZXJ0aW9uIGNoZWNrcyBjb21wYXRpYmlsaXR5IGJldHdlZW4gJ3Vuc2lnbmVkIGxv
bmcnLCAndm9pZCAqJywNCj4+Pj4gICAgICogYW5kIGZ1bmN0aW9uIHBvaW50ZXJzLiBUaGlzIGlz
IHRydWUgZm9yIFg4NiAoeDg2XzY0KSBhbmQgQVJNIChhcm0sDQo+Pj4+IGFhcmNoNjQpDQo+Pj4+
ICAgICAqIGFyY2hpdGVjdHVyZXMsIHdoaWNoIGlzIHdoeSB0aGUgY2hlY2sgaXMgcmVzdHJpY3Rl
ZCB0byB0aGVzZS4NCj4+Pj4gICAgICoNCj4+Pj4gICAgICogRm9yIG1vcmUgY29udGV4dCBvbiBh
cmNoaXRlY3R1cmUtc3BlY2lmaWMgcHJlcHJvY2Vzc29yIGd1YXJkcywgc2VlDQo+Pj4+ICAgICAq
IGRvY3MvbWlzYy9DLWxhbmd1YWdlLXRvb2xjaGFpbi5yc3QuDQo+Pj4+ICAgICAqDQo+Pj4+ICAg
ICAqIElmIFhlbiBpcyBwb3J0ZWQgdG8gYSBuZXcgYXJjaGl0ZWN0dXJlLCB2ZXJpZnkgdGhhdCB0
aGlzDQo+Pj4+IGNvbXBhdGliaWxpdHkgaG9sZHMNCj4+Pj4gICAgICogYmVmb3JlIGFkZGluZyBp
dHMgbWFjcm8gdG8gdGhlIGNvbmRpdGlvbiBiZWxvdy4gSWYgdGhlIGNvbXBhdGliaWxpdHkNCj4+
Pj4gZG9lcyBub3QNCj4+Pj4gICAgICogaG9sZCwgdGhpcyBhc3NlcnRpb24gbWF5IG5lZWQgdG8g
YmUgcmV2aXNlZCBvciByZW1vdmVkIGZvciB0aGF0DQo+Pj4+IGFyY2hpdGVjdHVyZS4NCj4+Pj4g
ICAgICovDQo+Pj4NCj4+PiBFeGNlcHQgdGhhdCB0aGlzIGRvZXNuJ3QgYWRkcmVzcyBteSBjb25j
ZXJuLiBJbW8gdGhlIGNoZWNrcyB3YW50IHRvIGJlIHRoZXJlDQo+Pj4gdW5jb25kaXRpb25hbGx5
LCBhbmQgcG9ydHMgd2hlcmUgdGhleSdyZSBfbm90XyBhcHBsaWNhYmxlIHdvdWxkIHRoZW4gbmVl
ZA0KPj4+IGV4Y2x1ZGluZyAod2l0aCBzdWl0YWJsZSBjb21tZW50YXJ5IGFuZC9vciBhbHRlcm5h
dGl2ZSBjaGVja3MpLg0KPj4+DQo+Pj4gSmFuDQo+Pg0KPj4gT2ssIGJlbG93IGlzIHRoZSB1cGRh
dGVkIGxvZ2ljOg0KPj4NCj4+IC8qDQo+PiAgICAqIFRoaXMgYXNzZXJ0aW9uIGNoZWNrcyBjb21w
YXRpYmlsaXR5IGJldHdlZW4gJ3Vuc2lnbmVkIGxvbmcnLCAndm9pZCAqJywNCj4+ICAgICogYW5k
IGZ1bmN0aW9uIHBvaW50ZXJzLiBUaGlzIGlzIHRydWUgZm9yIG1vc3Qgc3VwcG9ydGVkIGFyY2hp
dGVjdHVyZXMsDQo+PiAgICAqIGluY2x1ZGluZyBYODYgKHg4Nl82NCkgYW5kIEFSTSAoYXJtLCBh
YXJjaDY0KS4NCj4+ICAgICoNCj4+ICAgICogRm9yIG1vcmUgY29udGV4dCBvbiBhcmNoaXRlY3R1
cmUtc3BlY2lmaWMgcHJlcHJvY2Vzc29yIGd1YXJkcywgc2VlDQo+PiAgICAqIGRvY3MvbWlzYy9D
LWxhbmd1YWdlLXRvb2xjaGFpbi5yc3QuDQo+PiAgICAqDQo+PiAgICAqIElmIHBvcnRpbmcgWGVu
IHRvIGEgbmV3IGFyY2hpdGVjdHVyZSB3aGVyZSB0aGlzIGNvbXBhdGliaWxpdHkgZG9lcw0KPj4g
bm90IGhvbGQsDQo+PiAgICAqIGV4Y2x1ZGUgdGhhdCBhcmNoaXRlY3R1cmUgZnJvbSB0aGVzZSBj
aGVja3MgYW5kIHByb3ZpZGUgc3VpdGFibGUNCj4+IGNvbW1lbnRhcnkNCj4+ICAgICogYW5kL29y
IGFsdGVybmF0aXZlIGNoZWNrcyBhcyBhcHByb3ByaWF0ZS4NCj4+ICAgICovDQo+PiBzdGF0aWMg
dm9pZCBfX2luaXQgX19tYXliZV91bnVzZWQgYnVpbGRfYXNzZXJ0aW9ucyh2b2lkKQ0KPj4gew0K
Pj4gICAgICAgLyoNCj4+ICAgICAgICAqIEV4Y2x1ZGUgYXJjaGl0ZWN0dXJlcyB3aGVyZSBmdW5j
dGlvbiBwb2ludGVycyBhcmUgbGFyZ2VyIHRoYW4NCj4+IGRhdGEgcG9pbnRlcnM6DQo+PiAgICAg
ICAgKiAtIElBLTY0OiB1c2VzICdmYXQnIGZ1bmN0aW9uIHBvaW50ZXJzIChjb2RlIGFkZHJlc3Mg
KyBnbG9iYWwNCj4+IHBvaW50ZXIpDQo+PiAgICAgICAgKi8NCj4+ICNpZiAhZGVmaW5lZChfX2lh
NjRfXykNCj4+ICAgICAgIEJVSUxEX0JVR19PTihzaXplb2YodW5zaWduZWQgbG9uZykgIT0gc2l6
ZW9mKHZvaWQgKCopKHZvaWQpKSk7DQo+PiAgICAgICBCVUlMRF9CVUdfT04oc2l6ZW9mKHZvaWQg
KikgIT0gc2l6ZW9mKHZvaWQgKCopKHZvaWQpKSk7DQo+PiAjZW5kaWYNCj4+IH0NCj4gDQo+IEkg
d291bGQgb21pdCBhcmNoaXRlY3R1cmVzIHdlIGRvbid0IHN1cHBvcnQsIHRob3VnaC4gSSBnYXZl
IElBLTY0IGFzIGFuDQo+IGV4YW1wbGUgd2hlcmUgdGhpbmdzIGFyZSBtb3JlIGNvbXBsaWNhdGVk
IChhbGJlaXQgaWlyYyB0aGUgY2hlY2tzIHdvdWxkIHN0aWxsDQo+IHN1Y2NlZWQgdGhlcmUpLiBI
b3dldmVyLCBJIGRpZG4ndCBleHBlY3QgYW55IHRyYWNlIG9mIGl0IHRvIGJlIGFkZGVkIHRvIHRo
ZQ0KPiBjb2RlIGJhc2UgKGFnYWluKS4NCj4gDQo+IEphbg0KDQpXZWxsLCBsb29rcyBsaWtlIG9u
bHkgX19wb3dlcnBjX18gbWF0Y2hlcyB0aGVzZSBjcml0ZXJpYXMuDQpBdCBsZWFzdCwgSSBzZWUg
aXQgaW4gJ3hlbi9hcmNoJy4NCg0KQnV0LCB0aGlzIGFzc2VydGlvbiBkaWRuJ3QgdHJpZ2dlciBi
dWlsZCB0byBmYWlsLCB3aGVuIEkgcnVuIENJOg0KaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9q
ZWN0L3Blb3BsZS9kaW1hcHJrcDRrL3hlbi8tL2pvYnMvMTE4MjI5NDA4ODQNCmJlY2F1c2UgUFBD
NjQgcG9pbnRlciBzaXplIGlzIDY0LWJpdHMgKGFjY29yZGluZyB0byB0aGUgDQpDLWxhbmd1YWdl
LXRvb2xjaGFpbi5yc3QpLg0KDQpJbiBhbnkgY2FzZSB0aGUgX19wb3dlcnBjX18gaXMgb3V0IG9m
IHNjb3BlIG9mIGNlcnRpZmljYXRpb24sIHNvIHRoaXMgDQphcmNoaXRlY3R1cmUgc2hvdWxkIGJl
IGV4Y2x1ZGVkLg0KDQpEbXl0cm8uDQoNCg==

