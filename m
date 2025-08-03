Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C06B1935E
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 12:02:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068533.1432569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVXf-0005aq-96; Sun, 03 Aug 2025 10:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068533.1432569; Sun, 03 Aug 2025 10:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVXf-0005YV-4s; Sun, 03 Aug 2025 10:02:11 +0000
Received: by outflank-mailman (input) for mailman id 1068533;
 Sun, 03 Aug 2025 10:02:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/pN=2P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiVN0-0005C5-A7
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 09:51:10 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2405::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6109e952-704f-11f0-a321-13f23c93f187;
 Sun, 03 Aug 2025 11:51:09 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 IA1PR12MB8520.namprd12.prod.outlook.com (2603:10b6:208:44d::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.18; Sun, 3 Aug 2025 09:51:06 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.8989.017; Sun, 3 Aug 2025
 09:51:05 +0000
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
X-Inumbo-ID: 6109e952-704f-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8EYFC4xu2bWWkLLDEEhKNV/29IogtOM0iD1aGF+P7rmg3yuC2nzESSG6sA8ZLrn7rcWaTnlIFmewKYHv303XFV4QGMsw7Pja0JLBEzfEBY+GW3nManEzn72veYseBxiEN05S5LTgwETt1TgKZ/diKY8SIcpzFjL09/17oFfwE1xt4Yi660hw4xYxLl7cLlSz7wNX660ScqSGzJxuuejDHTk82yhSyFcSIuQPglkvEGUl5ueG+MZaAdHvchPxDItFIYGsuP+0a5AIwwCZkNVfiW5WS7wMwkblScKRWpQKbJswn+6lMtNt2bNkiRcx0bLZh8QqlxCVIG2g1nnfmizlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31vOr+6hkU+kjHdDMaaud8RR0o+tMZNmuY0vWAWTTFM=;
 b=VjGauDdt2vPtdCzMdiU/eTNFhjUUyHavqxQI8LfyBMBs4mb7Ri96WUtUojJtqMMdU5HOILGTBAt3KcSGwD+U3uI4f2eDrrsnHQ8Kdn7fdCxcxE8/U0NcajIUZzUhtutKlKfzK72+kkQADQNmVz/yzmvbWbbaXaNOGYNPADNtNHxjGmaV4+f8066GqgaQVErx6IeKflV9bkMwcS6lKIS+Y0/ON7HsFZohtiWGQvEpERItf7zorDenQhtTMWb329J1wurg5w+jCZgoE+0evTuPGPriKYB/+6+FZ8rzdquTKXyGBlp8iTVRciOat+8D0g0uWFDmu4azy9M1RJ3J7DRSCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=31vOr+6hkU+kjHdDMaaud8RR0o+tMZNmuY0vWAWTTFM=;
 b=cIyAXs0y9WsI9sVmom+ffnWppwu/rHZI874Z+V/sg+jVZkzHHkULrF/VP9jL6zer5dgCcTNAPtRMXFNyKJRaZ90Dt1HWCxiOl+PZ1edfGUd2oOrgQfPE2klJixxxiAXIqyK/azFahIpGHi70C2j7WPf3wg8TOPDJONDBOQ+Opv0=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>
Subject: RE: [PATCH v1] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
Thread-Topic: [PATCH v1] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
Thread-Index: AQHb/S2yWmLQISYx7E+NkBDkce1BCbRI8U4AgAfL0xA=
Date: Sun, 3 Aug 2025 09:51:05 +0000
Message-ID:
 <DM4PR12MB8451408263AB7A8C96FE691BE120A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250725063039.2526488-1-Penny.Zheng@amd.com>
 <ba091eb3-f1d4-4786-ab6c-c8636628a0b2@suse.com>
In-Reply-To: <ba091eb3-f1d4-4786-ab6c-c8636628a0b2@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-08-03T09:50:54.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|IA1PR12MB8520:EE_
x-ms-office365-filtering-correlation-id: 377bb8eb-2a9c-41af-ee41-08ddd27343cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?amxldTlmaVpUanU1K21YbmM3QXJyR0dhbW91ZEd3cE52Ti9DT0tzdEdVME5y?=
 =?utf-8?B?aWVVdUZlajRuZSt2UXhSbUhjTjB4c3Bka0ZDUjZGc0dKRjVkMUtSdUxpS2V3?=
 =?utf-8?B?MnVGMVpoWnVUdGZ5bXo2SlQvOVdUN2JMZUVnVmRhRzc3cTJycmx5MStuQUpS?=
 =?utf-8?B?SVNLL0J3dmRlRTR0VjVwZnZMRTNPU2NVSWdzZnhVanA2eWVtWmUrVnBEVXlO?=
 =?utf-8?B?NzBnR3Fia3p2RHFIWEpzVHNtbWR1TGZTaGlCOXYxV3p2M05jR3VXUWFMZUNp?=
 =?utf-8?B?d015WWlHN1pUUWlieEJOQWwvd0JJMUd4ZFBHV0U1VHJIeTdhZmNUMXcxRjdD?=
 =?utf-8?B?NXBFekpxMi9oaFUyNTAxbDJxempUNitSLzYvQml3UXB0S2xzZTNsWXhkd00r?=
 =?utf-8?B?MktoRTQxQmg1UEI1dnMrSEwyU09TanRneHJOVTFYb1dzTG9IbS9GbHJSMUw0?=
 =?utf-8?B?MnZMRVp5Tk42eWZ6TXRNVHdFSkV2NWdJMUw2VlZoT1ZtZVpLM0wzSnlncEpM?=
 =?utf-8?B?cEptYnhxMUtXMGMrek5qWk9BbU03VGxPbjhLMkwxUWhrL1ZYeGY3TCtlQ1M3?=
 =?utf-8?B?dlVsU0QvQ1FNU0ZTdTFrcTVtZVkySGU5NDJVanlZRDd2UGtueVdtOGJpWDFo?=
 =?utf-8?B?czZ1RDhDS0x2Sk96NzdmNGZUOGE1SVh6M1JuQ2V4VVhTV0ozNUZodHNQc1gy?=
 =?utf-8?B?KzNWYm5USUpRSEpuMmFhcU9rUzRmSXB2OHk3M3NzT3l0cWhoWENjdi9Oa1Yr?=
 =?utf-8?B?NnZDOEpKaklNWFlFd2RvT2JrK0JEem5LaUNUZVMybVJUYVFvVmNBd251SXFN?=
 =?utf-8?B?VWdqazFyTnJVOTNkWmFwRlR4TUE1U3lsZmQyQ0pFUXRwR0N3dG5rME90WUh4?=
 =?utf-8?B?NE1CMFlKOEVIYVJucFlBeWp3OHlhMWFtQ3JtZmpiMHdVU2Y2eFBIM3hqdkhQ?=
 =?utf-8?B?blkydzNBSDhnUVZBbmJ5TzRuMDBNMXU2S29NWmZPaDUvOTBSRUxNUUxQM3Ry?=
 =?utf-8?B?eDBpeGV3cEh0cUtLanNXUzFRSitxbmdCdGtLTWxFU25MbVkwVXJxWUtJWU5s?=
 =?utf-8?B?eUgyQWlhY2NsSVVTajBmSFBOcEl4ZmFPUzhUMjBSOG9VYjV3MW9NYjFPNkV4?=
 =?utf-8?B?U3NqcG5DNHQwWHQyOExFcmszQS9tUmNSZXZKMTJnWHpjNllGMDMzd2luRlJy?=
 =?utf-8?B?R09YaXQrT2h6SlpnSmJYcFk0eU5NeVEwaDdlQ0tieVZ3V3VLVUF2WmZmaTFV?=
 =?utf-8?B?QWh6VGFNNjJpRE8rSnh0b1RKSWVCazRHY3hrdzUyQVhPb3d5UzArekRQMUhz?=
 =?utf-8?B?eU53RDUwRThOaUozcWZpbzBQeXVRU0dLb1lNMzl1d3cyNGJNc3FyVGVqNEtE?=
 =?utf-8?B?NndCbzI4R3RGbU54WnlBbFBUQzhpUkVkYy9nMzh5U3Z6aytnclRweGh3Ky9U?=
 =?utf-8?B?eGoyMmt2MjA0MDY0ZmVFMkYyNmxvcDBKQnZPTUdwNk13L0FaMDdvSTJJOHdC?=
 =?utf-8?B?Ly8vUHg5R1BZMzhRVG1rRTI2Ky82d2VnNHJjdXk0alNEYjV2ci9NaUQvSDhD?=
 =?utf-8?B?UmVmaURpT2Y0RlpYUHlmczNHaXBJelB6Uks5cks0c0czRzB0R2VtU3Z1OTJk?=
 =?utf-8?B?cHBYN29MNGkzYmlIUXJUcmNxcGpwTElqMFdqVlFmYmhsRnRMbFgrUkNCZVo4?=
 =?utf-8?B?VTJIS3VBNU1CM040KzFuSVpNVkdaOExPNnZGNXEwN0x6a3M4SytMZkRSRnRF?=
 =?utf-8?B?QWNMWWplSnMycUhnQ3BNRTVlUUlJNFFKRUEwMlJBREdxNVdYMDRSRHc0R1cw?=
 =?utf-8?B?VTlXSzkxWitsSjhZT1d0b3VXY3lnNFV1cUtETXU5bE1ZSWxraTVlcExkVzJS?=
 =?utf-8?B?aUcwam9MU3l5cU5VeDJlLzFhcEN4bFZIT0xHc2pWUUJWU1hOWkJoOWpPTGxM?=
 =?utf-8?B?bEZ2emduSUVSS0JFUm5TbUR1UURyMUdOM0NoaGVpdTRMQnExcWwzYmE5RFll?=
 =?utf-8?B?VndEY29QcmZ3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cmhIVEdUN2RJWFZzTnRJcUxyRit5Zkx2cnhKZEpIYnY3bU9keHNJY1FoVzVK?=
 =?utf-8?B?RXdVQWtWcnN3ZHUxaDMwVFVEeGVXM1h2b2R4TkVHMkU1Ukp2UGxZdWNVUXhz?=
 =?utf-8?B?VUlNdGx5V05oaVV4VXl4Tm94a0d6M0p1TXdPVXFEelQwdTFkSHloUm5GOTdH?=
 =?utf-8?B?WlJ1STMyNDF6MlU1cWRZcjhWVjBaTDAvOHBaRWVYbXNYSytLUGsvcTRIaXEx?=
 =?utf-8?B?TkFFNHBGcnZKbzU2Y3lLM0E0UnUrMWFTODVmbU9kdEVvZkh1TUdHTldzWkpY?=
 =?utf-8?B?dlRlb1h6OStxZDVCUG16cnF3NHNZUXJ2aUpLV3YvOE5vR0dCQjl4a1A1YXNF?=
 =?utf-8?B?VVJ1azE4UzJVYW1hT1BSYkRSYzh1aVVOWHJBMlkxZ0NKUklFbHJaMFdKZmdZ?=
 =?utf-8?B?S0JSNFZiYXhGOE1ubExZU0E5YS9QUHovUTBQaEZVaFZXQjNiSE4vcjJnbW1r?=
 =?utf-8?B?TEpIZ1J3Rzh2bmphQUorZUxFZzI2dGF0WEx3emxpOG1mUVJkSmRacE9JNHAr?=
 =?utf-8?B?YitjNGYzMmt2N1hCaTNJRVlPOHNqK3hCSXZhNENJYmJwVmRSeFhzQnJGdWN2?=
 =?utf-8?B?TTgxUWZpZjF3bnN3RkVXQlRqNnpHMmtUbzBZTXdDQTNCalNkTk03Ulh6RnA5?=
 =?utf-8?B?dVFBVXE5STVuZTFyTGFNWWRIK0gwd3RFT2EzaDVESE5wNWlLK3MwYXVmYjBW?=
 =?utf-8?B?ekpEYWZ4bUJmR1ExQjQ5bXBDSm9kYmdQLzFna2h6bHFmMmZrdTRNbVhEbEtG?=
 =?utf-8?B?N0IxQlhLb2o2L201QmhmWlBVSExJZG81TDhFbVB5VXBmYWlSalkrNzUwRU1N?=
 =?utf-8?B?MFVVYnVJOWQrUE5IQzFrdDY4WFRXcUwzdXNia3U0MEJEc3JLLzlmSmdYUmpO?=
 =?utf-8?B?b2xHRmZtZGFsK2RybzhyQTVjelhsOVN2eFNHYUxEcERHSGVSVE9KdXdwK0Rr?=
 =?utf-8?B?cXNLQXJ4U1FkdjQxWEdZUG9RNENiYUVqU0xxcmloZTk0TjVFOVBrd1p6aEhT?=
 =?utf-8?B?bkVzQXl5Wmc3WVlQL1ZVMmpaZkRGTDdZNFBJZktta0dQbFFUbGdNTm1sam5K?=
 =?utf-8?B?WTZVdXNxRnNSdDZKblhMdjJVbjU0QkpBWG8rMVZGTmxxNGhCWXYvS3U3cDZx?=
 =?utf-8?B?VExRYTJUcjJiUmEwc2d1MVVmY0x1MG8zWmVFZkFteVBEUUNxSjUwbTlYcTl5?=
 =?utf-8?B?RkFQbG1QT0VKUm9DQnFURlNRb2hLNWp3aFJXMmpvamNLRzJ4Y2d5R3ZDYkRB?=
 =?utf-8?B?a0tVb0JXMTJ4YVV0UGFUNWRTa25scWY4Wk8rUFVlalRLRHRSZ0ZLTTB5U3dE?=
 =?utf-8?B?c3FMNkxENzh3cG1uSE1UMzZwV3JYV3EyUDFvcTlLTXZPem5mR2FZR053ZlU1?=
 =?utf-8?B?RlVIUkZzdUkwbmVGZXN1dnJrcEJkT1pUYTFCcHYzSFNteWdNdEY1cmh6UzJp?=
 =?utf-8?B?UXNvYTV0WFd2ZCtqS2tXNFdtWkIrb1FkL2pIQlVMdjFBc1NXajRpMVVubzZw?=
 =?utf-8?B?UGNkSWdCamFMYWkyRGp5VlQrcFQ5Um5GNlNiV2JuOHdZUHMwaThIbHZPV2V6?=
 =?utf-8?B?T1J1YjI0ZWlJLzBDU1hXR09Rdk4yZXBhTkxnWk84VVU2SHBkaVcwNlIraStE?=
 =?utf-8?B?SldIUUlPdGxSYnJ6QmRwUTA0MzVnbnRrajRVZHZMMzhud1I3YzZGYnlzck5Z?=
 =?utf-8?B?QzNGQU9Tclc0b28wVmFTY211U0ZzVTB1Mnk4OHZPalVaN0pPaE85ekNzMmZZ?=
 =?utf-8?B?YlU2SFdTSDlaYkQvMzZwdjFlV2VKbWRHVkpnL1lHNm5RQmpxbWNBYng1SEdM?=
 =?utf-8?B?SFIwRi9EOXJlVGdkRUZCREFjck5RWjRlUWdFUFpiV1hNM0ZUR2h2N3AzRlRJ?=
 =?utf-8?B?bXgxdC9CMVllYng2RXRIVExndTl0WDdSYVI4R0Z0cTg4UjVKN2M1T2wvcVZi?=
 =?utf-8?B?RExlS3FXQ3JGRysxejk2bjdoc1ZNZ2VwUHJQN04yNmtzSFFZWG1rS0p0am5K?=
 =?utf-8?B?eEUrWWtGeS82TStUQU5DYzJhUE9CbDAxUVFyMWtaRExIb3dtN1k2bUViOGVT?=
 =?utf-8?B?ZjVKdTdQMmJzSE81cVdDUkh4MlB6ZzlIQnRqWmY5anl2em5wOGJDQUVYY1dE?=
 =?utf-8?Q?9RFY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 377bb8eb-2a9c-41af-ee41-08ddd27343cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2025 09:51:05.6537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NDctOXC7JBKP+/UxVEXIOGpeCBBrm5OOUrU5N8vuBoDy9k7pgwhk4nJjPrKC1ECHKapDXoz4GRqm2GJzQtGH8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8520

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bHkgMjksIDIwMjUg
Njo0NSBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBDYzog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25u
w6kNCj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQHZhdGVzLnRlY2g+OyBPcnplbCwNCj4gTWljaGFsIDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47
IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBTdGVmYW5vDQo+IFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IFN0
YWJlbGxpbmksDQo+IFN0ZWZhbm8gPHN0ZWZhbm8uc3RhYmVsbGluaUBhbWQuY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHYxXSB4ZW4veDg2OiBtb3ZlIGRvbWN0bC5vIG91dCBvZiBQVl9TSElN
X0VYQ0xVU0lWRQ0KPg0KPiBPbiAyNS4wNy4yMDI1IDA4OjMwLCBQZW5ueSBaaGVuZyB3cm90ZToN
Cj4gPiBJbiBvcmRlciB0byBmaXggQ0kgZXJyb3Igb2YgYSByYW5kY29uZmlnIHBpY2tpbmcgYm90
aA0KPiA+IFBWX1NISU1fRVhDTFVTSVZFPXkgYW5kIEhWTT15IHJlc3VsdHMgaW4gaHZtLmMgYmVp
bmcgYnVpbHQsIGJ1dA0KPiA+IGRvbWN0bC5jIG5vdCBiZWluZyBidWlsdCwgd2hpY2ggbGVhdmVz
IGEgZmV3IGZ1bmN0aW9ucywgbGlrZQ0KPiA+IGRvbWN0bF9sb2NrX2FjcXVpcmUvcmVsZWFzZSgp
IHVuZGVmaW5lZCwgY2F1c2luZyBsaW5raW5nIHRvIGZhaWwuDQo+ID4gVG8gZml4IHRoYXQsIHdl
IGludGVuZCB0byBtb3ZlIGRvbWN0bC5vIG91dCBvZiB0aGUgUFZfU0hJTV9FWENMVVNJVkUNCj4g
PiBNYWtlZmlsZSAvaHlwZXJjYWxsLWRlZnMgc2VjdGlvbiwgd2l0aCB0aGlzIGFkanVzdG1lbnQs
IHdlIGFsc28gbmVlZA0KPiA+IHRvIHJlbW92ZSByZWR1bmRhbnQgdm51bWFfZGVzdHJveSgpIHN0
dWIgZGVmaW5pdGlvbiB0byBub3QgYnJlYWsgY29tcGlsYXRpb24uDQo+ID4gQWJvdmUgY2hhbmdl
IHdpbGwgbGVhdmUgZGVhZCBjb2RlIGluIHRoZSBzaGltIGJpbmFyeSB0ZW1wb3JhcmlseSBhbmQN
Cj4gPiB3aWxsIGJlIGZpeGVkIHdpdGggdGhlIGludHJvZHVjdGlvbiBvZiBDT05GSUdfRE9NQ1RM
Lg0KPiA+DQo+ID4gRml4ZXM6IDU2OGY4MDZjYmE0YyAoInhlbi94ODY6IHJlbW92ZSAiZGVwZW5k
cyBvbg0KPiA+ICFQVl9TSElNX0VYQ0xVU0lWRSIiKQ0KPiA+IFJlcG9ydGVkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcg
PFBlbm55LlpoZW5nQGFtZC5jb20+DQo+DQo+IEl0IHNlZW1zIHByZXR0eSBjbGVhciB0aGF0IHRo
aXMgcGF0Y2ggaXMgd2hhdCBjYXVzZXMNCj4NCj4gbGQ6IHByZWxpbmsubzogaW4gZnVuY3Rpb24g
YGFyY2hfZG9fZG9tY3RsJzoNCj4gKC50ZXh0KzB4NWI4NWQpOiB1bmRlZmluZWQgcmVmZXJlbmNl
IHRvIGBwYWdpbmdfZG9tY3RsJw0KPiAoLnRleHQrMHg1Yjg1ZCk6IHJlbG9jYXRpb24gdHJ1bmNh
dGVkIHRvIGZpdDogUl9YODZfNjRfUExUMzIgYWdhaW5zdCB1bmRlZmluZWQNCj4gc3ltYm9sIGBw
YWdpbmdfZG9tY3RsJw0KPiBsZDogLi8ueGVuLXN5bXMuMDogaGlkZGVuIHN5bWJvbCBgcGFnaW5n
X2RvbWN0bCcgaXNuJ3QgZGVmaW5lZA0KPiBsZDogZmluYWwgbGluayBmYWlsZWQ6IGJhZCB2YWx1
ZQ0KPg0KPiB0aHJvdWdob3V0IHRoZSB2YXJpb3VzIGJ1aWxkIGpvYnMgaW4gQ0kuIENvbnNpZGVy
aW5nIHByaW9yIGlzc3VlcyBJIGZlZWwgdXJnZWQgdG8NCj4gYXNrIHdoZXRoZXIgeW91IGFjdHVh
bGx5IHRlc3RlZCB5b3VyIGNoYW5nZS4NCj4NCg0KU28gc29ycnksIEkgdGVzdGVkIGl0IHdpdGgg
bXkgd2hvbGUgZG9tY3RsIHBhdGNoIHNlcmllIGFuZCB0aGUgZXJyb3IgZ290IGhpZGRlbi4NCkkg
cmUtc2VudCBpdCBpbiB0aGUgaGVhZCBvZiBkb21jdGwgcGF0Y2ggc2VyaWUgYW5kIHRlc3RlZCBp
dCBpbiBoaXMgb3duLg0KDQo+IEphbg0K

