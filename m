Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B443B08DAC
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 14:59:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046840.1417222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucOCR-0002WJ-6X; Thu, 17 Jul 2025 12:58:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046840.1417222; Thu, 17 Jul 2025 12:58:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucOCR-0002Ts-3T; Thu, 17 Jul 2025 12:58:59 +0000
Received: by outflank-mailman (input) for mailman id 1046840;
 Thu, 17 Jul 2025 12:58:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HfYL=Z6=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ucOCP-0002Tm-D8
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 12:58:57 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbaa4eeb-630d-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 14:58:55 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PA4PR03MB7021.eurprd03.prod.outlook.com (2603:10a6:102:e1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 12:58:52 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 12:58:52 +0000
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
X-Inumbo-ID: cbaa4eeb-630d-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H235pC7PqE4sF97IwCqsVs7hjFhOwHLJaZyRYIOVDbjIHPr32Cfg4qhKWV4kA89xtHSFWdIYgvs5JsdjxE/OtOlb33J8MKSwLDtj3Bg6uu3kZ222pRgzkBaLWIxpJNNyaq3enxYKUHDmavEfVORWaMUeee6UesgUrYmNfbUpsmIMsXZclgsC6iZYvMsDA2lnbRozAk9HGUe7F2pXsSYLa7JXEkQz+q/+hMOEg4nVg9cpql5988lMLR53QGW+TP7t6wyf5ydVpBiFacrKxXk3GCpjVZK7j5WGGBuJMKIT81xZJ/PC8WafoLkDu66RqQdr/yQ+5BoBiVCUG43pzaVp3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xI875Q8uh3TVrVYlNXVX6gejjqm7a/fuUaPyuMwsbYw=;
 b=DLuuqrxQeNGoYOx1mI8fAYL3zg+XngVj3c7lnfpmxA0GpmW+bbsvwuJ9dvYApgYK5D+u3sesncJja2Nrts5B8QYm5OMNjp7Lnvcp0dWZQ+AN4aGry1nP07/ejhevoEJ43U1E9ad2eno1jZkKwkeA+AKZrQQNQAT/aT2D03NGQMk+Y7uIoYT5FX+1l5dY96vReF6JDcb9beqP/yoOxVgl6kSnFWQnWrecPGbip3JcbWobhCIO0TtDVroTctfNSSaEqOd0ogYjqQ4GBTbwyAlkmMtae6eChQ6kQ0TYMFEdXTzdi3WIQMcVGu3FMXHWY+KuhQuJ/t98us6Q6kdw7Ga3oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xI875Q8uh3TVrVYlNXVX6gejjqm7a/fuUaPyuMwsbYw=;
 b=ODK+HUXWFa6dD4vTwkNM7TQqUVlnPn5T5/pjejnFmTcww7HD7ZApFGRHmLnzw1AOOzXsjOLOxI499PH3/oIQ+yeJFgrFynPksQxdpAho7rUytiL/6N4f5DXwlF0Fs+FpT9uVuZpb2ArU83XrfXuhBJFT2vFuK3zBrxpA7fWW3Kr5Nzk5F45PXK87dVVT3utV4V0m7aoau7Uzu3Yp+omoQ4UrXuhmmiH9tSqA07qa/WL74s5VV0ELVOrCd3BrQjWTWs2ajGdDRkCVcHGMSsOO1Pm1WYNcLGZzxrYgixOgggNUIpZcVRMrKVjnL1qVsuewr9hPpsoaRpUFZgPNYg8rZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <c76704bb-f1b6-458d-8a43-475b161470c1@epam.com>
Date: Thu, 17 Jul 2025 15:58:50 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/3] xen/domain: update create_dom0() messages
To: xen-devel@lists.xenproject.org
References: <20250623182721.194238-1-dmukhin@ford.com>
 <20250623182721.194238-3-dmukhin@ford.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20250623182721.194238-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0350.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::12) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|PA4PR03MB7021:EE_
X-MS-Office365-Filtering-Correlation-Id: cbe743d4-e45e-49a4-7419-08ddc531add5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OEVUK0VzOEpLdk96ODlNMC9iNkpWUVd3U3Z3T1NxQzVaU3Z5YU1BWFVTMkJF?=
 =?utf-8?B?bVpvK1pQeWF6Mm03K0hKMzBITWdabmFsdEJBOWk4c1FiVXgvZUI4L25JcDlZ?=
 =?utf-8?B?bEw4U2R0YmwxeUlEVGF5QmEvYytSSVZia1dobHZRT3BmWXNKaVpwWE8yMEZB?=
 =?utf-8?B?YmtobytCTkdKQzkxNHVUQkpFa1dQb3lUVG5BalZXNXRpUWYrd3B6RWV0QS9H?=
 =?utf-8?B?bU93VGdsaVJodTBFYTFrMkhYL1k0eFQ3bVBETU0vaGIzOE1DSzJmbTBwVGJx?=
 =?utf-8?B?QXl1bXpiNEF1Q1BqS3pjNVJjNFlnOGJ2VjVGVklCNnhMeUYyRVVrdWdWbFBY?=
 =?utf-8?B?WmxUQ0VNWVFwVXFpRFdLV0IwQnlDLzRqeUUzSWF0SFpNcjFURk9jUXgxOWhO?=
 =?utf-8?B?SXQ3MytRM05OSlEwa0ZSdEhYbExFMWNpb3VnbTVpcnJzK3J2NEh0QVdGN2xa?=
 =?utf-8?B?R094cWpKbUtLWHFtTlcvYXVrbkRCb0pEODhiL2oxVjNWeFdxWFBCUnlRSVE0?=
 =?utf-8?B?ZGh6SjF5cmNid05YRUw4S0liNmlmRTlJQWl0V1RacUxFVjhkVGcySVk3Wlli?=
 =?utf-8?B?Z1lDOFFwMFJNS3hBWVhiemRISTNUTnBzZVc5d1laMGE5Qklmc0V3ZE1VYkZr?=
 =?utf-8?B?M1RwQUNQTUN1ejFtNkJYZng3a2hJdzlYblNhaXd1ZTJYWlVXNXVxVVhRU1Zq?=
 =?utf-8?B?SWIyOC8xbjVUb00xbEpDSVNacmVzUklEOGd4S0NkVXkySmVscHh3bTVvWjVB?=
 =?utf-8?B?dk94QmJVZzBoY045cVM3SlZ2SDBKZkdwTUREWmJMdklnQ1ZZOFMxc1VFcEZY?=
 =?utf-8?B?NXErRXdPMWxJMk1USS9VbHV2TXExVXRpNUxpUG5qOTh0THY1d2lwYkR5QVV4?=
 =?utf-8?B?aU94c2xuZWRLV1BWWU8xR3BndzhiYlV1eFVGYU9iTHpLdVAxTzV3OGlwL0M4?=
 =?utf-8?B?RzV1VkRZbTNEeHREMkRzK0t2ZGF6Y3o5QVRnaU9jK1gyTjFKUm9SQmdscVdI?=
 =?utf-8?B?N0J3cVpuSk05Wkh4UnpKb1lNVEw4aTZ0MzZKaFBKcjIzb0VMMHNCVVRKNlkw?=
 =?utf-8?B?dTlvMkd0YXVJaWRSL0p1ZXlCcHVKS1I0TkFuOUcweVhwZnNxT25zTUFnVVBJ?=
 =?utf-8?B?MTVmenRzM0pyNGFnRDhMc1gxWnd5Wmt4TE96WEhZc0k4MG1ZOXAwQzBUWGJt?=
 =?utf-8?B?cnMwNU5ZcDVvOUZrd1lOd0VKU05hRVpoMnZHaFJ0dHlmbjUwN1BjM3FXbmVi?=
 =?utf-8?B?OGRvRGFISEROL2l3VW04bmlJT0gwWEc2ZDlHaXBrZUJwWm52Vi84VmVnVkcv?=
 =?utf-8?B?MkxVT0RUZTdnUUc1eUxlVTlVY25telUraVFBSXBrVld0d2MvZXRpTUNoUXY4?=
 =?utf-8?B?WnlRNHAreUtPYmpRdVBIZFI0MDJpR2RvUTZDS0VUenpWUXdpWFFrV2s5b2VQ?=
 =?utf-8?B?U2gvWG9taisxbmg2Z0dvY0F0K1FKblYxUkRZakxvTWRCNFJ1SHZtTVc0Yldr?=
 =?utf-8?B?WUFjUDJUMjdDdS9HRWxwdzFqYmx0MGdqZ0paaTE5TGFyTzVBenhNR3ZqNTRX?=
 =?utf-8?B?NlA5OXdzcE5BUUlQQ1g5dHNlL0JlOStSUUhqSm0rTnkyS0pQdkJaS3lUYXU2?=
 =?utf-8?B?R0l6SjlpVXBocng1YWdVaDkxNWJKZ1MwdXJjb1h3MmxsQitob2VxMjVJcWV6?=
 =?utf-8?B?dU5OVHJoRHJ3cGp6L0x3bVIrQmVPYUNiL1VPVkJxRVpjck42TFg5ZjBYSHZQ?=
 =?utf-8?B?M0JqVHcxRDExYS9JUGxDVmhNRzZ4V043TzUyWXV6RU1OR2t4dFZIUVZ0Zkoy?=
 =?utf-8?B?UlZzU2JSMFNnUnQzNCtVY1U4eldleFRKU09JS3pPQlhmYUs5ajkvVFV6Q3ZN?=
 =?utf-8?B?L0VIMENmUHFKTVplL05MbFRWT0dLd2tNQ1ZveE5QSEVPd1VYWWM0RDN4S1Nq?=
 =?utf-8?Q?i91Uta5DTDI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1JqVWRDQW94b3BMSzJSY2hMdEZDdktOZGJVcjZXcndMUkVxZThvcmgvVWZQ?=
 =?utf-8?B?MDVkTWRWa3RtM054eHpwWnRPSDBDVjV2UTgvNUNaTkRlajVFdTEzYTFTUGZ6?=
 =?utf-8?B?UTJlemRtRFE1WjVlV3pndEM1bXlJV3JraUFjdkp0T0hRNThlQ21kSGxxaFJB?=
 =?utf-8?B?Z280TDhRVHFDbEpiL24rWG8vWjRHV0FRTnhVdGZBQ3B5TFZpQmV2NndpanJE?=
 =?utf-8?B?ZlN3TmdZZ0pwV2tzQ0VZOC9vYnBRSk5YYmEwMEN5NE4va05od3lsN0RKaHht?=
 =?utf-8?B?ZUs3SUVEWDF5VGYwb2lIL1FGeks2NmdzVGV3d0RMUGtuN21XdDA2RUZzRGhm?=
 =?utf-8?B?QjYvRmFLSmlCK0krSjdkZ0x3YitlQnljRDJZM2lkRHhINjNKZEN4Vms5MklS?=
 =?utf-8?B?SDJJWTZCMHZFOXpzb1I5NHU4YjR5R1BUSmNZK1RDZ25oaGNMU1E0YVBRZkEw?=
 =?utf-8?B?NFlBZW9LS0dUaWNQOTU2VFhlZGhRRys2b1dMWktMdG1Zb3Rzc3kyM2JZdnVY?=
 =?utf-8?B?aTdUaldKTWNDVzlhVFhQQ2IwejIvMnArbFN4UG4va2hvMGRzcW9nS21oeWVR?=
 =?utf-8?B?TjRieWUxQ1Z0YndqSmRENjJOd3JXeU1iMWdDSkxyRG5pck1URU5yREZiYXhh?=
 =?utf-8?B?YkRnYVRHTk5Vb3dpeGk3VzV6NGhMQUloUEg3bFduZ3B4SUxKeTJ4eWY0WEdB?=
 =?utf-8?B?T2Rpdks1VlFUeTNldGhsMjRKMU9aT091SXcyL2g2emFZYnJWRDJTSU1TNncx?=
 =?utf-8?B?N05aMW01dEJKZmFSY3NZbktiSkQ3TVpRZHh5aE5nazZzcHhnam1ueGZsY2dj?=
 =?utf-8?B?dGlJUUV4SHhnRE5ySk9GQ3d3TmxadnVyRzZiVUJmVmVFQTl5eEZZbFdObDFU?=
 =?utf-8?B?K2lYYlVUeHdsenpZMVFaWVJONGlBUTFhNUtyNm5kSnlLWlNQVmdVYzRCZWlW?=
 =?utf-8?B?WVBYUkVhR2FpT1ZxSzdyZklCY2kzRGpHdFl1T1JjNktvZlE2QzZtQUNqTEhW?=
 =?utf-8?B?M3NXOGs0OXY3Wlkxc0lXcXNMRllDM1lJd3JLTjZ4YjA2REtuRWN2U1dsWVRO?=
 =?utf-8?B?ZVJSZElXMkZYRk43WGxMNE1LOHAwWnJjV0lWT3ozWDQxM0o0eUUrVlBUSGp1?=
 =?utf-8?B?czJTaDg0cGVRNGRRZlF0dmJJakZoLzFRUXBHT1NSNWs2NWQwWkNyTmlDZ1Nr?=
 =?utf-8?B?RGJqaWwySHFmTTNLazlyL2JCUnM1eERyN2lYNGxNSzh0cElqVGZIK2lCZXZj?=
 =?utf-8?B?Vkhub3ZQWjNDZHBGc2xnYXNsU01vVjJCSC95Z0RnK29qbjRNSTIzSkNpRG9q?=
 =?utf-8?B?cE5NK09zdUpQS0hTbU1tTVo1Z252YVFaMnIvVHIvV0t3OCtvSWJQWXZHZjdJ?=
 =?utf-8?B?YzMzbUFuVW94ZWhjL2JpMGVLQ2l1ZnJ3Um16TFl6Wkl6aWNjQlhtUVprTEk4?=
 =?utf-8?B?ZS96ZWUvOUtHY1FtcUR2NUR3bjZQRGZaQk01WHczTmd5V1JTb0ZzdWt1MUVj?=
 =?utf-8?B?emZFMnd1Z1kwR2MxV0psQXVha2QyanNyaDlsbnJaT2UxYmVXdDI2KzI0emdR?=
 =?utf-8?B?UWFqSnZxODAwVUlXWmZweEVrMlZDM1VYcnRhTDd2eGNXYVpFd2lmY3dhVmxx?=
 =?utf-8?B?ME1vVWZRK0RvL1NXNVJnblh2Y2kyK1FtMU12blY5SzhKZXJpcmJKYnp5dEVP?=
 =?utf-8?B?R0FYNDFvR2wweEU4RGFMQStWaHloWUJaZGlQQ2RuaU5LdFh1WGd1a3loMnda?=
 =?utf-8?B?ZklIRUJyYzlNYnp5SjRDMmQ2ajRSb0hDTDhoZmhrUWE4ZTE5SGEvRU1oS3ZI?=
 =?utf-8?B?U04vc0lUTzdVUnFJRncwcjRuZmVOSzFZRW9mZUJNWWRNbk8rcTdYTXd4OVZh?=
 =?utf-8?B?OUxPby9lSFlvUmswdDlYU0RwYS92QTNESDBlOUJ6L0JkZ0hNVldQZXhmZXcz?=
 =?utf-8?B?V1hUVU9CTXpRM1Q1RWMwbWdkN09NRk5ieXA0YllUZHBiMFFhalFENXcyd0pQ?=
 =?utf-8?B?ZDVxZDh5dC9PM0Q3QzdKcmwzSWkrM2FVeWo3ZUtOSWdZdjhmYy9wK09yem1E?=
 =?utf-8?B?Q3FodjdIMENGMG1SaWVxTTM1MG5HTkNUcitwejVLUHNGTWJjSlRzcERzV3Vq?=
 =?utf-8?B?QU82QktFR01EMERod3haSG9xbTl1TXQvNC9qMjh6QVZCMDZZa2Myb0sya1BT?=
 =?utf-8?B?d1E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe743d4-e45e-49a4-7419-08ddc531add5
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 12:58:52.5374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZsoSwYEDaG4Xia+KQGdjQnH5xmTCanTuEYwwicml/8JD8gNJeKb7YOSNe867GEZPEqEH0O5oiO7eOfIovp+wG/TMa6hMRv8Edrtvc4SeynY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7021



On 23.06.25 21:28, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Use %pd for domain identification in error/panic messages in create_dom0().
> 
> No functional change.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v9:
> - new patch
> ---
>   xen/arch/arm/domain_build.c | 8 ++++----
>   xen/arch/x86/setup.c        | 4 ++--
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 9fa5143eb98c..b59b56636920 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2080,17 +2080,17 @@ void __init create_dom0(void)
>   
>       dom0 = domain_create(domid, &dom0_cfg, flags);
>       if ( IS_ERR(dom0) )
> -        panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
> +        panic("Error creating d%d (rc = %ld)\n", domid, PTR_ERR(dom0));

May be you meant %pd, not d%d?

>   
>       if ( llc_coloring_enabled && (rc = dom0_set_llc_colors(dom0)) )
> -        panic("Error initializing LLC coloring for domain 0 (rc = %d)\n", rc);
> +        panic("Error initializing LLC coloring for %pd (rc = %d)\n", dom0, rc);
>   
>       if ( alloc_dom0_vcpu0(dom0) == NULL )
> -        panic("Error creating domain 0 vcpu0\n");
> +        panic("Error creating %pdv0\n", dom0);
>   
>       rc = construct_dom0(dom0);
>       if ( rc )
> -        panic("Could not set up DOM0 guest OS (rc = %d)\n", rc);
> +        panic("Could not set up guest OS for %pd (rc = %d)\n", dom0, rc);
>   
>       set_xs_domain(dom0);
>   }
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 7adb92d78a18..28bcfd1861d4 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1080,7 +1080,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>   
>           if ( (strlen(acpi_param) == 0) && acpi_disabled )
>           {
> -            printk("ACPI is disabled, notifying Domain 0 (acpi=off)\n");
> +            printk("ACPI is disabled, notifying %pd (acpi=off)\n", d);
>               safe_strcpy(acpi_param, "off");
>           }
>   
> @@ -1095,7 +1095,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>   
>       bd->d = d;
>       if ( construct_dom0(bd) != 0 )
> -        panic("Could not construct domain 0\n");
> +        panic("Could not construct %pd\n", d);
>   
>       bd->cmdline = NULL;
>       xfree(cmdline);

-- 
Best regards,
-grygorii

