Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FBEAC05AB
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 09:27:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993035.1376493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0Kk-0007JW-8I; Thu, 22 May 2025 07:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993035.1376493; Thu, 22 May 2025 07:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0Kk-0007I2-4V; Thu, 22 May 2025 07:27:18 +0000
Received: by outflank-mailman (input) for mailman id 993035;
 Thu, 22 May 2025 07:27:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UtGg=YG=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uI0Ki-0006K9-OV
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 07:27:16 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2418::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e27113e-36de-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 09:27:14 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by BL4PR12MB9480.namprd12.prod.outlook.com (2603:10b6:208:58d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 07:27:10 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 07:27:10 +0000
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
X-Inumbo-ID: 2e27113e-36de-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HmNGVNo2Zr2Y0gZmvVOtSRmTOd7vTjWrABOCTZ5LN4W/MDkZd2cHtw/ZMKrHWQ2QSrl8mxHH8WH8h70jmnfq//1wesO9G8i/fSRRb/37YFhi2IcHlhUiVFWhUwmftQzjEB4CzFMpCjRmltiryf8L0XskQc1LSucj7fGH6uEatJIcJdneni5P2C0EqZvPit2TL2NssO6UdbmYSDXZPO8tlLKDzYMXYrc8xfUA4A5ui0K0H982LTbVKNTRdg9XA3faDNFpPoAqRy4iFVk5fSLarAO9OQVKw9urqzqEQZ6v7KdY+oq7UUP6uvjJEYAd4osPoal0m10y4lqIQNZhhdx9Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00Rmu00Ma0deiKirFzc9Hiv4TzOZ+LhPJQDhrTZMBr0=;
 b=g2SZexQQhGkXxWjvWPYfYrSeZrtC2UZ0NH4wOXRN2GmARwooPEINaNGtTWiXxp286UssUZGrBj4F9xgkd406wz43C0RC6lYUGIZbWeCW5nSu3WJjVnfzHylIs9isa269iMBq8VAA5mwovFhBaO0V5WcsRbSjt7OrSX1U0o8FB2+0mK7Sxtheivo6kPWuHhcKMVjywJbbOdHIiYkQEbtZIKA3Gnv0gh9L7/kBzxj+thDtK1hIHujeGIVSbwrjRafBzWk+uw9XHjYFjPFPZTBYwHhj8WZ2S13aXgh1+G6RuTfs9AkrZnrV4aTPiqDN2rSaAV+cinlTf0mdJS3FbjHRJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00Rmu00Ma0deiKirFzc9Hiv4TzOZ+LhPJQDhrTZMBr0=;
 b=TWfV5RJBQ1lAhao61bA8cpDPDas0Tnd4jkhssTpx32yZN/B6OTEqQGplkMYDxzfYJNNMnk/QTCTnTuBG49GZssfpMyX6yPaKcWYRuTCPZjXRV8H4aVfFIIj5QDShQbx+sDI4JPXZow78u8sj7EiC5xrle+1DibedBy9PDUHCcuE=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v4 09/10] vpci/msi: Free MSI resources when init_msi()
 fails
Thread-Topic: [PATCH v4 09/10] vpci/msi: Free MSI resources when init_msi()
 fails
Thread-Index:
 AQHbwMGh3xGCtPOZ6EmRbIkDtAY42rPbIqIAgAApmYCAAAFtgIAACDMAgAHezgD//894AIABfxcA///NAYCAAIoGgA==
Date: Thu, 22 May 2025 07:27:09 +0000
Message-ID:
 <BL1PR12MB58494AE9D6C1336515FD0DEEE799A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-10-Jiqian.Chen@amd.com>
 <8d89f644-4ded-4490-ad23-518563d230d2@suse.com> <aCxGwSl_UuCWPf6B@Mac.lan>
 <e7ab7be1-e256-4f63-a835-cf1e13e0183f@suse.com> <aCxO1Gh_ehxpsznI@Mac.lan>
 <BL1PR12MB5849E2CD05D70E7A475646F3E79EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <aC23xI0qgsAqLb2S@macbook.local>
 <BL1PR12MB5849BD99C735B7821B7841D1E799A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <aC7OWeXWyS1qKv8h@macbook.local>
In-Reply-To: <aC7OWeXWyS1qKv8h@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8746.028)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|BL4PR12MB9480:EE_
x-ms-office365-filtering-correlation-id: 049f4110-9635-4039-5252-08dd9902105a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?azU2YXNlZ3pZRWkzQStNVFVJUWhSekErQkVORFZDT2ZsL05MUThTblJ6VEt4?=
 =?utf-8?B?VS9sbzlLVVZhTGZNbmV6cDVNUEE2QmVPWlhuTWxIczZCUnU2Ymh0aFFIbW9U?=
 =?utf-8?B?ZGdzUEFla2J4ckxPOUl1QWNSaXRBVlJSTnRxMWQ1U1MyU0FnalQxQ0FOODFB?=
 =?utf-8?B?Q3A0N2tFcm13Mlpsb24zbVhDcytmc1U4d3MxeWgxZmUrbEQrUHJJZWQ2VVZB?=
 =?utf-8?B?c3ZNeWMxclZnZGdMTGI5aUR0dVpTbnBCckJ3OFRvUUh1MUNSSXYzSzZTMTBs?=
 =?utf-8?B?N0VRNzhBZ2t5WVBUNTJZdnJxSm1Teng0d2hveE5oWG53NTYzU242WFNPU09a?=
 =?utf-8?B?NUdtOVcvS0NVb2xKclNNWTBVVGF3RWtUU2RIRFZ1ZlVvSWFJaEFWbkRBZmZJ?=
 =?utf-8?B?STZDL0lpUll3dFBJUDl3dmJ0cklzbVBzSFNRZ0tQaWJVd3JSRHJhdm1Lc0l2?=
 =?utf-8?B?WlFYZ0VkcHpONzdmdlViRGtEMWZPWG1iSTFHQVZDNnFZTUNORjQ4UHlHM0Rh?=
 =?utf-8?B?QjQ0Z2JuaVIxYU9XRjZQWjFubnNKTS9zSXphS1lzbWliMVpjNnNma1h0c3Bl?=
 =?utf-8?B?TWlGTlE3bEhrRGt3TmtCdGhsOFZTUlFFQU8rRFEvNUhjSktwYWZMRjUvRE5h?=
 =?utf-8?B?Nys2RGMrVmtCRENFalJGNmVxTlUwS2dqUERqSUpSa1FmQkhibXBiWHZlMXFE?=
 =?utf-8?B?QW9hcjBvZWJIRytoSDRvc1NJb2ZGaTNoQm1FTWwyWS9aN0s1M3I3QkRWWHgx?=
 =?utf-8?B?K0VoS3IzK3Zpak03Q1dBQWtKRk45RFFVRzNiUnFFdDl6YVFCSTY5blZ5YkZV?=
 =?utf-8?B?RTIxSUdWcVNJSkppT2sxMzhRa3daRkhZV2F4cUg2bERZalQrWlFNN2xDSWdj?=
 =?utf-8?B?K1M0UlRHTHJmTHdLYTl6RVFudXhJalArd29oaDVNK25kbHRPRlBGVjk1V3lB?=
 =?utf-8?B?a3pMRXMwOVFXT1NMVHQvTVQyczNqSlhtMzRrcEI0WTRIa1JZZ2Z2d0ZMNFVU?=
 =?utf-8?B?SlZWeTlhVkJEcnZ0dHRkM0dlUlVWNzR4RnJJbG1JY1dMdllidjdzR05YUVZi?=
 =?utf-8?B?S2xlRFZtUlkwL1F4T1l5cXBxb2hWOThCVWNIb2JPcTdQRCtxMWlIcXRqYzd5?=
 =?utf-8?B?TUhRVjl2elQyeXNlekJlSlNsQ091bG5neDd6SWVjZVVDbmxTZDBqVEpld1Z2?=
 =?utf-8?B?TEtTWmppRnJLRXlIMnpKRVhvbGcyL3cyUHcxcGZhcmNYRWpIcnlCSVJSMFdS?=
 =?utf-8?B?bXNsNG55VUY2dDJMem4zUUt6TTl6MzY3MWxiTCtzbHpEdzQrZWc2OVNGbzRW?=
 =?utf-8?B?VXhsSmhjN0l0T09MZWxhaUlndzVTcTlXcHVsR3RIejdyYUo1Tis2YlQxUWdz?=
 =?utf-8?B?ODlKR2V6VHhoenBHTTNnREtLbU43NHovQnFKMHMwQ0p3UUEzK2lobHVOeHBo?=
 =?utf-8?B?T2RURGEzKzRWNmhkT3V6SWF1em1tRFlKanp0Nk1nSmxGSUN6UXpYVVVmQjVa?=
 =?utf-8?B?bndNNzBFdnpkU054bXdENGRMbFNVY1NweVBNczE2NTN2Zjl1WTh2OFBWUjhy?=
 =?utf-8?B?Zy9XYnIwbFhvNWUreHMzTC9NdlpreFFMdElzNElwL0cxVXpvekEzN01TeTlI?=
 =?utf-8?B?MHQveDd4bWdpN0NVelFMc2Y2Yk5IMUdnNERnaGF1NU9sOWk4empUdjJTVTAy?=
 =?utf-8?B?RGVsZEQ3dHN3djhIVGdPREpKbWUzNVZLZGdaelRoRW1DcElpanRWZnJNS284?=
 =?utf-8?B?c1c5dXJXdVFBQjIxYzFSUE5hWmIrbENrZ2dNS2p0Zk1waGM4bG9oRTczYkxx?=
 =?utf-8?B?U1NoRnRtbHZ3dHhiVmhWUUpreU1CRFZZV2Z6aFhYZUZIVzZHNnNWSzFvM0Iz?=
 =?utf-8?B?bGxvU3hYNTVCcWoyRCtqNU9vNmVpRWJJUWFWM0MrYnZNcGw1SCtMZGxYZ3RC?=
 =?utf-8?B?UytYbHFXRWo2SkJzMlBJbHdzcWtvM0s1ZDhVYWR3YzZlYk9BTlk2N2ZQcjhB?=
 =?utf-8?B?ZDBEeDduK1FBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UEI1RllqcUphSXQ0dithRVQ3V0Z5SFAwdENmeWdWZzljeG94ZXMza0FkeDdj?=
 =?utf-8?B?dXo5SjhWRGwxTjRSamRxMWY0UjBUaE1NUmk1TVZmWUY2RFkzemw3dERjRVdL?=
 =?utf-8?B?WGszc2VDYnQ5bitUVEhoZFNXN01Jd2tKUTFEOHRYN2tNdDB5amFkNnVmRStt?=
 =?utf-8?B?eEplSHQ0NXdyZFE0QTBXU3dIZUdkdVZWanlYdzRvR0VaM25WUVo2WnB0dktR?=
 =?utf-8?B?SWFZY05xQ09rTkd2dFpFODRJMWxSanFnQTE4QWVkb0dacUN5M0p1TGJSUkoy?=
 =?utf-8?B?cUt6ZVlob2tpbTNoTkxrR081SjZpdVZxMksvT3ljWC9GeXhITnpyK3RDNUE5?=
 =?utf-8?B?MzhTalptZzZHdTBVUExmdk41b3JOVTZhTk9jOW5xdXpQQ2pKQ1hMeSs4THhw?=
 =?utf-8?B?TndvZy92aWpVM0o0a2puTitZOWlrTy8ySlpKZmZXSEFON05UaDhPMXE3V0NB?=
 =?utf-8?B?Sm1taVJOTUlvRW40R01kakRDajRLZ3ozYlJoWTBheDFsN1hrdDdSaXdobnlh?=
 =?utf-8?B?SkVqVGQ1M1ljYWhsU1B5OXRwdGo3c0VqRVltcExWRmRpRVF0U2ZlYzhFelpW?=
 =?utf-8?B?WXBuK2xQVEk1aFBPMzZyUyt4MzA2N2ozMldCTVczL0g5cUVNRXVCTUt6ck5U?=
 =?utf-8?B?cUFhSW4zZDM3NHR3dENvS0dXTVMvMG0yYis1VTJLOW5NSWVMV2RXbFlZMXBq?=
 =?utf-8?B?THZMRHljMkNPNWUxZktOL1pNMkk3dGZvUndhSEtBZ0dDQXhNV0svS3hLYkRl?=
 =?utf-8?B?bFNKREk2SVZyYVVQb2IxUGRmQlFSaFBTaW9VRCtBWVBwajFQY2pRY0wxL1dZ?=
 =?utf-8?B?MC96STZJRldPTUczR1dhUmpYTTBmTkl0Skc5YisyWEYvdnZrS29IcTBTTDNL?=
 =?utf-8?B?aWpuQXlFTHFyZjM3R010QVpTdXc4aVFiQTNFZ3d0bEtJOXhuQVZOaFpraERV?=
 =?utf-8?B?Yjd0SzF6RUF0N2JvNi9hNko2Z20vK0NhUG5XU0xIak1XbzlaNkpVdnlUcEQ2?=
 =?utf-8?B?U2twYStOSDJUWWJucDdDRVdvNFAydktMT0dpakZnaDZqbDVnb1VvdGxrQlIy?=
 =?utf-8?B?bHIrK2pudTlpRlRuaHhTQmlLVy9TNlJiWTlKVlVzSi9YVmlnWlBRYzU3a0M4?=
 =?utf-8?B?Ym5kbVJwZlVkNE9EdlVpSnpkODM5M2hITlFVSHpVa3pVbjVZam9nODdWb3BB?=
 =?utf-8?B?RFZsaWg1elp1MnpacGVzbTVTb0MvcGpDa05yeCtGdUg2Z3ZZQjNKWXFjc3N2?=
 =?utf-8?B?STByWVcxbVFTQ2xSNmNOTGJCaU9YaFMyUllaVERTbklIKzJjYSsvN0hpdmdI?=
 =?utf-8?B?ZmNRN20vOTVQRm9LSXJmaWF2b0hWZjZOSzNZNHZiZ1hrMWpkNFU2aUx3ZFJP?=
 =?utf-8?B?NFBGNEY5aEd2aUk0VTdVcTdldDdUWVZPM2xXaXUrRnNMVDdGc2VDRDVZakhH?=
 =?utf-8?B?R21YR1VWVW1JS2ZhUWl6WlFoNDcxYmFUSExHRm5uTU1xNFY1ZFYzakxJTnVk?=
 =?utf-8?B?K1F1ZDZTOXZxaVZZMUhwZTlCNUZyU3dVdFdhWnNnOUwwdHNlZ09PR01hRHdJ?=
 =?utf-8?B?S3p1anVWcUJ2YUttSUREQjBCVDZjZHk5VndpTExQdndlUHhsS0RyR0Y3R1Jx?=
 =?utf-8?B?THlCMWd1N01KSk90Z1QxRm9uOTlFVEJoTm1zekx2V3hENTB4ZnIyMDc0Z1Zi?=
 =?utf-8?B?MGpXV2x2YnU4YjkvWmwyajBRY2Z1M1JWQnMreDFZTkdEcy9sUDIvVlYweHpE?=
 =?utf-8?B?RTBNa0Z4ZWJDbVBCbmZyNzkzNlQrWXoyaDIxOE5WRlg4SWRGdTlaMzVKTHdC?=
 =?utf-8?B?aFc0TFNWQUhXaTB2QXBFY0V3Ykx0TzdyZUNCNnJOa0JnckZ3YUhkWTRCM1Vl?=
 =?utf-8?B?WjF4eGNwME1nbHBObkZZTkUxUlBJdnpGcnAzODhGY2FiTGR0SHNMWEVQcDVP?=
 =?utf-8?B?eWJKd3psa0x2eVFqMlZnYU9uKzBrelBiUkZYbHA1VGlkYng1NC84TkhKQjdW?=
 =?utf-8?B?U1l0KzFwbytyc0kwVnpxNk9EMEJoQzVwZy9zTWY4UGNXRWEwdlBJbGVtUHhz?=
 =?utf-8?B?bzJHZHovaGhSVlhxcEZJK2M0aWVrNjVESlNDMVBmVHZiZUVYMnVoTk1DVW5n?=
 =?utf-8?Q?3WjQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E5E9F8603AD5F4E8E8250355BDE8782@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 049f4110-9635-4039-5252-08dd9902105a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2025 07:27:09.9749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7T1hFk28dL3oTDt5iM3rejCIUjz86f+MLcVxLNT9OwMM3JwY+8gGh7LayPoZOQiHr9d7LNd8PAE3GRa9lt8o/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9480

T24gMjAyNS81LzIyIDE1OjEyLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBUaHUsIE1h
eSAyMiwgMjAyNSBhdCAwMjoyMToxNkFNICswMDAwLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+PiBP
biAyMDI1LzUvMjEgMTk6MjMsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4gT24gV2VkLCBN
YXkgMjEsIDIwMjUgYXQgMDc6MDA6MzdBTSArMDAwMCwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4+
PiBPbiAyMDI1LzUvMjAgMTc6NDMsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+PiBPbiBU
dWUsIE1heSAyMCwgMjAyNSBhdCAxMToxNDoyN0FNICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+Pj4+PiBPbiAyMC4wNS4yMDI1IDExOjA5LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+
Pj4+PiBPbiBUdWUsIE1heSAyMCwgMjAyNSBhdCAwODo0MDoyOEFNICswMjAwLCBKYW4gQmV1bGlj
aCB3cm90ZToNCj4+Pj4+Pj4+IE9uIDA5LjA1LjIwMjUgMTE6MDUsIEppcWlhbiBDaGVuIHdyb3Rl
Og0KPj4+Pj4+Pj4+IFdoZW4gaW5pdF9tc2koKSBmYWlscywgdGhlIHByZXZpb3VzIG5ldyBjaGFu
Z2VzIHdpbGwgaGlkZSBNU0kNCj4+Pj4+Pj4+PiBjYXBhYmlsaXR5LCBpdCBjYW4ndCByZWx5IG9u
IHZwY2lfZGVhc3NpZ25fZGV2aWNlKCkgdG8gcmVtb3ZlDQo+Pj4+Pj4+Pj4gYWxsIE1TSSByZWxh
dGVkIHJlc291cmNlcyBhbnltb3JlLCB0aG9zZSByZXNvdXJjZXMgbXVzdCBiZQ0KPj4+Pj4+Pj4+
IHJlbW92ZWQgaW4gY2xlYW51cCBmdW5jdGlvbiBvZiBNU0kuDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4g
VGhhdCdzIGJlY2F1c2UgdnBjaV9kZWFzc2lnbl9kZXZpY2UoKSBzaW1wbHkgaXNuJ3QgY2FsbGVk
IGFueW1vcmU/DQo+Pj4+Pj4+PiBDb3VsZCBkbyB3aXRoIHdvcmRpbmcgYWxvbmcgdGhlc2UgbGlu
ZXMgdGhlbi4gQnV0IChhbHNvIGFwcGxpY2FibGUNCj4+Pj4+Pj4+IHRvIHRoZSBwcmV2aW91cyBw
YXRjaCkgLSBkb2Vzbid0IHRoaXMgbmVlZCB0byBjb21lIGVhcmxpZXI/IEFuZCBpcw0KPj4+Pj4+
Pj4gaXQgc3VmZmljaWVudCB0byBzaW1wbHkgcmVtb3ZlIHRoZSByZWdpc3RlciBpbnRlcmNlcHRz
PyBEb24ndCB5b3UNCj4+Pj4+Pj4+IG5lZWQgdG8gcHV0IGluIHBsYWNlIG9uZXMgZHJvcHBpbmcg
YWxsIHdyaXRlcyBhbmQgbWFraW5nIGFsbCByZWFkcw0KPj4+Pj4+Pj4gcmV0dXJuIGVpdGhlciAw
IG9yIH4wIChjb3ZlcmluZyBpbiBwYXJ0aWN1bGFyIERvbTAsIHdoaWxlIGZvciBEb21VLXMNCj4+
Pj4+Pj4+IHRoaXMgbWF5IGFscmVhZHkgYmUgdGhlIGNhc2UgYnkgZGVmYXVsdCBiZWhhdmlvcik/
DQo+Pj4+Pj4+DQo+Pj4+Pj4+IEZvciBkb21VcyB0aGlzIGlzIGFscmVhZHkgdGhlIGRlZmF1bHQg
YmVoYXZpb3IuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IEZvciBkb20wIEkgdGhpbmsgaXQgc2hvdWxkIGJl
IGVub3VnaCB0byBoaWRlIHRoZSBjYXBhYmlsaXR5IGZyb20gdGhlDQo+Pj4+Pj4+IGxpbmtlZCBs
aXN0LCBidXQgbm90IGhpZGUgYWxsIHRoZSBjYXBhYmlsaXR5IHJlbGF0ZWQNCj4+Pj4+Pj4gcmVn
aXN0ZXJzLiAgSU1PIGEgd2VsbCBiZWhhdmVkIGRvbTAgd29uJ3QgdHJ5IHRvIGFjY2VzcyBjYXBh
YmlsaXRpZXMNCj4+Pj4+Pj4gZGlzY29ubmVjdGVkIGZyb20gdGhlIGxpbmtlZCBsaXN0LA0KPj4+
Pj4+DQo+Pj4+Pj4gSnVzdCB0aGF0IEkndmUgc2VlbiBkcml2ZXJzIGtub3dpbmcgd2hlcmUgdGhl
aXIgZGV2aWNlIGhhcyBjZXJ0YWluDQo+Pj4+Pj4gY2FwYWJpbGl0aWVzLCB0aHVzIG5vdCBib3Ro
ZXJpbmcgdG8gbG9vayB1cCB0aGUgcmVzcGVjdGl2ZQ0KPj4+Pj4+IGNhcGFiaWxpdHkuDQo+Pj4+
Pg0KPj4+Pj4gT0ssIHNvIGxldCdzIG1ha2UgdGhlIGNvbnRyb2wgcmVnaXN0ZXIgcmVhZC1vbmx5
IGluIGNhc2Ugb2YgZmFpbHVyZS4NCj4+Pj4+DQo+Pj4+PiBJZiBNU0koLVgpIGlzIGFscmVhZHkg
ZW5hYmxlZCB3ZSBzaG91bGQgYWxzbyBtYWtlIHRoZSBlbnRyaWVzDQo+Pj4+PiByZWFkLW9ubHks
IGFuZCB3aGlsZSB0aGF0J3Mgbm90IHZlcnkgY29tcGxpY2F0ZWQgZm9yIE1TSSwgaXQgZG9lcyBn
ZXQNCj4+Pj4+IG1vcmUgY29udm9sdXRlZCBmb3IgTVNJLVguICBJJ20gZmluZSB3aXRoIGp1c3Qg
bWFraW5nIHRoZSBjb250cm9sDQo+Pj4+PiByZWdpc3RlciByZWFkLW9ubHkgZm9yIHRoZSB0aW1l
IGJlaW5nLg0KPj4+PiBJZiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5LCBJIG5lZWQgdG8gYXZvaWQg
Y29udHJvbCByZWdpc3RlciBiZWluZyByZW1vdmVkIGFuZCBzZXQgdGhlIHdyaXRlIGhvb2sgb2Yg
Y29udHJvbCByZWdpc3RlciB0byBiZSB2cGNpX2lnbm9yZWRfd3JpdGUgYW5kIGF2b2lkIGZyZWVp
bmcgdnBjaS0+bXNpPw0KPj4+Pg0KPj4+PiAiDQo+Pj4+ICAgICAgaWYgKCAhbXNpX3BvcyB8fCAh
dnBjaS0+bXNpICkNCj4+Pj4gICAgICAgICAgcmV0dXJuOw0KPj4+Pg0KPj4+PiArICAgIHNwaW5f
bG9jaygmdnBjaS0+bG9jayk7DQo+Pj4+ICsgICAgY29udHJvbCA9IHZwY2lfZ2V0X3JlZ2lzdGVy
KHZwY2ksIG1zaV9jb250cm9sX3JlZyhtc2lfcG9zKSwgMik7DQo+Pj4+ICsgICAgaWYgKCBjb250
cm9sICkNCj4+Pj4gKyAgICAgICAgY29udHJvbC0+d3JpdGUgPSB2cGNpX2lnbm9yZWRfd3JpdGU7
DQo+Pj4+ICsgICAgc3Bpbl91bmxvY2soJnZwY2ktPmxvY2spOw0KPj4+PiArDQo+Pj4+ICAgICAg
aWYgKCB2cGNpLT5tc2ktPm1hc2tpbmcgKQ0KPj4+PiAgICAgICAgICBlbmQgPSBtc2lfcGVuZGlu
Z19iaXRzX3JlZyhtc2lfcG9zLCB2cGNpLT5tc2ktPmFkZHJlc3M2NCk7DQo+Pj4+ICAgICAgZWxz
ZQ0KPj4+PiAgICAgICAgICBlbmQgPSBtc2lfbWFza19iaXRzX3JlZyhtc2lfcG9zLCB2cGNpLT5t
c2ktPmFkZHJlc3M2NCkgLSAyOw0KPj4+Pg0KPj4+PiAtICAgIHNpemUgPSBlbmQgLSBtc2lfY29u
dHJvbF9yZWcobXNpX3Bvcyk7DQo+Pj4+ICsgICAgc3RhcnQgPSBtc2lfY29udHJvbF9yZWcobXNp
X3BvcykgKyAyOw0KPj4+PiArICAgIHNpemUgPSBlbmQgLSBzdGFydDsNCj4+Pj4NCj4+Pj4gLSAg
ICB2cGNpX3JlbW92ZV9yZWdpc3RlcnModnBjaSwgbXNpX2NvbnRyb2xfcmVnKG1zaV9wb3MpLCBz
aXplKTsNCj4+Pj4gLSAgICBYRlJFRSh2cGNpLT5tc2kpOw0KPj4+PiArICAgIHZwY2lfcmVtb3Zl
X3JlZ2lzdGVycyh2cGNpLCBzdGFydCwgc2l6ZSk7DQo+Pj4NCj4+PiBJIHRoaW5rIHlvdSB3YW50
IHRvIGZpcnN0IHB1cmdlIGFsbCB0aGUgTVNJIHJhbmdlLCBhbmQgdGhlbiBhZGQgdGhlDQo+Pj4g
Y29udHJvbCByZWdpc3RlciwgYWxzbyB5b3Ugd2FudCB0byBrZWVwIHRoZSBYRlJFRSgpLCBhbmQg
c2V0IHRoZQ0KPj4+IHJlZ2lzdGVyIGFzOg0KPj4gVW5kZXJzdG9vZC4NCj4+DQo+Pj4NCj4+PiB2
cGNpX2FkZF9yZWdpc3Rlcih2cGNpLCB2cGNpX2h3X3JlYWQxNiwgTlVMTCwgbXNpX2NvbnRyb2xf
cmVnKG1zaV9wb3MpLA0KPj4+ICAgICAgICAgICAgICAgICAgIDIsIE5VTEwpOw0KPj4gQW5kIG9u
ZSBtb3JlIHF1ZXN0aW9uLCBob3cgZG8gSSBwcm9jZXNzIHJldHVybiB2YWx1ZSBvZiB2cGNpX2Fk
ZF9yZWdpc3RlciBzaW5jZSBkZWZpbml0aW9uIG9mIGNsZWFudXAgaG9vayBpcyAidm9pZCI/DQo+
PiBQcmludCBhIGVycm9yIG1lc3NhZ2UgaWYgZmFpbD8NCj4gDQo+IFdlbGwsIHdlIHNob3VsZCBj
b25zaWRlciB0aGUgY2xlYW51cCBmdW5jdGlvbiByZXR1cm5pbmcgYW4gZXJyb3IgY29kZS4NCj4g
dnBjaV9yZW1vdmVfcmVnaXN0ZXJzKCkgY2FuIGFsc28gZmFpbCwgYW5kIHRoZSBlcnJvciBpcyBj
dXJyZW50bHkNCj4gaWdub3JlZC4gIEJvdGggY2FzZXMgc2hvdWxkIHJlc3VsdCBpbiBmYWlsaW5n
IHRvIGFzc2lnbiB0aGUgZGV2aWNlIHRvDQo+IHRoZSBkb21haW4gSU1PLg0KT0ssIHdpbGwgY2hh
bmdlIGluIG5leHQgdmVyc2lvbi4NClRoYW5rIHlvdSENCg0KPiANCj4gVGhhbmtzLCBSb2dlci4N
Cg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

