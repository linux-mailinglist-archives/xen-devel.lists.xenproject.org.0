Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC86500FE2
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 16:19:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304803.519573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf0JH-0003VL-1x; Thu, 14 Apr 2022 14:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304803.519573; Thu, 14 Apr 2022 14:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf0JG-0003Sp-Uz; Thu, 14 Apr 2022 14:18:58 +0000
Received: by outflank-mailman (input) for mailman id 304803;
 Thu, 14 Apr 2022 14:18:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfxB=UY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nf0JF-0003Sd-GL
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 14:18:57 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1b0a8c0-bbfd-11ec-a405-831a346695d4;
 Thu, 14 Apr 2022 16:18:56 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-hn_yR_cqN4a2rebs8Ib6ZQ-1; Thu, 14 Apr 2022 16:18:55 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB5357.eurprd04.prod.outlook.com (2603:10a6:803:cf::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Thu, 14 Apr
 2022 14:18:53 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5164.020; Thu, 14 Apr 2022
 14:18:53 +0000
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
X-Inumbo-ID: d1b0a8c0-bbfd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649945936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fjapXZlj1EwiPsPAor56cwM18lRMpGQ4R7RHmQzyM6E=;
	b=NVClrrxx/CccwMpzFKx5rC7dkHkGVDkYgvAt611XXCvzgTqxSVvH9lZ4ARtJg7JAss/ZfN
	aMe5Kt4W7EVewEwTHApKLfGkzKRTx38YGiC2UdDcfXs5yP1QBH/IWAE3yORIuNVisEXwz1
	VPo0s6kLPhxb8hBi3idWwmVNHJAKTdw=
X-MC-Unique: hn_yR_cqN4a2rebs8Ib6ZQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0hbrKTH3xBWypD6fnBRQlCvxZI2q/vhaBRigKrkqlQCEUz1dNc0dOWoXUxoOhU4EEKidozuSu/vIfFp2PUBDLqCUjfDAn8PlHYQLqR3UE7A+rQ68I+pBcmviMFjN3rAWnu9jj+eROvyWENevFLyffFzzD856a3bGn60D68tyld9AMw2DkjderRrUKxVjh3rCIEe7fBz5JzbLCwEhKyof+i1jZ9xWNOlJusWIlMKIOTiLB6SbR5+gW6TXSP0b9pMyQt2cxhrv6ABBRaL/BuHADYAxZyopCmjjluEZSwh1RDsHKX/VxnvnLJFJylEY6wU1C8lQL9Tn9Qj0DnEpTQZLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjapXZlj1EwiPsPAor56cwM18lRMpGQ4R7RHmQzyM6E=;
 b=CJe3rhBP0K1JWwB/3xMVLhI6gfAsCQlUHRK3bqlP2lW6bzNbMaLMVbCDfVuHKNVBio6j2t+FOXrzWvjQbuL331Ij18QvO0pyfH5IIkoEUKUBGesBbsEZZGYcDbUP8SC3iu/cYbUBH+5YKOwSJ2F1lMn/cnMD+XswB0I2O0YlkswZh95BlNUcYXy2LkLKGEsvR9Y8nPIK45nztGNvPqcCMVmxShLt+W5wD8C1mpZPV5zQ8IYdMg7JAJa/7XEujiQLTXA8HHPawzWdPyyfVzs4TqoqpDc7uz1CMaKtWo0vM+4OEYyVWyJBBXqunR8+ygEehwauG5lNffcHJiu+3t0hdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <55d71893-08f6-f1ee-10fd-666cfd9ec639@suse.com>
Date: Thu, 14 Apr 2022 16:18:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.16.1 released
To: xen-announce@lists.xenproject.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0021.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::34) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6798d12-0e53-4b58-e846-08da1e21b428
X-MS-TrafficTypeDiagnostic: VI1PR04MB5357:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB53570954C40615BF6488DBCEB3EF9@VI1PR04MB5357.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X8Mh3cXBQ4/RaiDIHcOolctqIEH9wYx2PVIybHkxMwyI14bGazqxS45XcCShhgdQ7Gwus1tQLLLqe23IhOetsRKzNfd5ntCr3KEWEZopo1N/7hs194Q2IT9HoreWG0Em83nwMcsi8GexueSpmn1KDf648gwGcKqZtqmfRtIM0kYJZLMjSPPSiCxfF7MOdxZ3dNdQPYPtX5OBjzdU6skxS+Rh8oT01XWnWMJR8KnVLDLoc+J5Lx5KZbcvF3xTHAj5FTG2ib9VwNa7jSGzmTKMEOZqtraFVl+rJ0uYwatEOrxJ48kgO72dPVrbVkUMMy1Pd2dxLB/57gZ/3pO3IHxYFNO72c9MwQRuMwYCRkOsQlz0Y143RTGjoDy+rL77mIRoWgn5MSpJ0te0L8YGCRorIChSGR+6Bi6mx0FRNpbzCr5JTChL9Vpjz1Qrfd9uvL5j3vpAqg5CH5jmNfIcvw+so7O34jJriSu9KnMIgE5aF+r7EM+jrxgrKZApaZ/B5OP/YCYZVb7lRZtHX3YVyXwISkuBQJ+asTfG8hJlLnbg9RcOGYv2qPak7cI4Wo4tB0Rv2L412G3EMawUN/GDyRMfx51ZVxMC3LZCQbtrNx38uG92my9KHbxz2uAfDQF8/3ha4vsZUc2Y09iF7SCglYZxsTE9ANF2dEeSal7YpeJw6effQUOFSQP6zKWMZbm+52jzcINTuSpCLCRNxSAzSM+wBb5jM08P8Zt6Zt4OGyN9Q9HmqonaARDHZs4HWEDAuNH8iz0nEFvIqHuI8V3WgteQIbmz/ah3YinO4bFEjKjQDx7KVeAhmCAUKDw5HjoXDX8+X3umZe2Uw6xa0pK+jFA8ew==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(966005)(6916009)(8936002)(6486002)(31686004)(450100002)(316002)(36756003)(83380400001)(5660300002)(8676002)(4326008)(2906002)(6512007)(66556008)(66946007)(4744005)(66476007)(7116003)(508600001)(2616005)(86362001)(26005)(31696002)(186003)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czJ2V3VwaXloU0NEUm5nbEd0WWhoeDdtM0ZTTkFpS0NiLzJqakVkQkIzTndW?=
 =?utf-8?B?ZmpsdmFROVpvUWdrWUJLbzlUQ2pyeEFCV0FMNXc2WEE5d29maW5US0oreHEv?=
 =?utf-8?B?QkJtdmtGbm9Pc0NDMGFqc1A0M2JkcTlQQUZoNk1IVlJtaDhEb09JWlFoTWZJ?=
 =?utf-8?B?N21DTUdPdncvU2EzTkIrVjhjUzk2Q2RnMmViVDBXem16OVJNNEVKN1dDSmVh?=
 =?utf-8?B?ZGZ0S2lPb3NsUDhIVzc5aThaRGMyMGhqWkMzTEdtWUFZTFNPSFVnQ0I3WTlq?=
 =?utf-8?B?WlRSSE92VDIxWG9Qdk9rajNxQ1FIS3NBU0llQ2FOcnVnYUVFY2RhRFlzeDE2?=
 =?utf-8?B?Vnk3WndtcTJZdlBHYUNJL0J3MjErSENIREdHdTBxdjk2ZnNLZlJ3M21iQ0cy?=
 =?utf-8?B?Skk2ZEtyWmRKcGdFbG04ekFseHplTU5zRThQeVdNemZjT0NOaHpuckZJK3Y3?=
 =?utf-8?B?MW00aDNCNDkrVnRxcVkrY243emxYS0gxc3lHekUyRHZLcHF0VXYxem9TZ0tK?=
 =?utf-8?B?RGlIZVJ0amJhUndUL1Z4U0FsNmI4Y29pU2RPTE43YXN3M250dTdXQklxQmF0?=
 =?utf-8?B?Tlh4WEp4MU5vaTBCRktqa3djaXVZQ1N6VTE1eFU3Tm1YS1BsbzhJTUNIdzQ0?=
 =?utf-8?B?YXV4NlBwQUlGN1FFNTE5UXpObVhtL21ONkxzZGFISTF0UUhDTXBIRlZ0eUwx?=
 =?utf-8?B?aVlSNG5NTktwZFZOQitESGxmaEFrZzlEQmwvc2JDR0lka3hoam0wcm5YMVFp?=
 =?utf-8?B?ZFRnenY0YUpBQTNXbFVONGs4dnFnaGtseVM5V0VRRmxkbG9Tc2N0clVKcEhT?=
 =?utf-8?B?Z2g4NHVnQUdMeXdXR3gxdyszUEpMaU9xeThYVHNpRTdEV0hTMUV3bzI2Wlk5?=
 =?utf-8?B?akNodFZPdFlIZXBMNmJuQ1lSbkZTaHhUdnlibjF0L3FKSThFNjVXQ29JaEpU?=
 =?utf-8?B?Rmo3THVZZEVKMW5CRTNySWU4VS80S09JeDY2NmFneDI4TGJJcTkwdk1DUTVF?=
 =?utf-8?B?RVRIV2hURHBCdmUwdTZObGVjYnZXYkJmMi9qcldCMFMrYWhkdnFzTTBsMVBM?=
 =?utf-8?B?ZGpZZmpGQTRUN0V6V1ZEczA2UVY2NWJNbkdCSGFkeTcvQUZiY0s5NEx1bTAz?=
 =?utf-8?B?SURsMTBYZVZrckVZV2VWTGpZUFFRdUIveFUxS2RrN1V1TU41MkU2TFhsM3lI?=
 =?utf-8?B?NW9pN2JxQmVBRWV4OUtKaDZJTERFNG1pQmRNZzZTZnBYaHdaWXBpOXNnQ041?=
 =?utf-8?B?RkR0aW14MGVCUGRtMmtPQ29JbWlCRVptQ2NxclNPMW1hQnlpU1A2bnFtUVVu?=
 =?utf-8?B?aFRhRkFySTZ1d1V5Ykd0U05HWWd0dS9tdzd2SUhuQk5iSGFvUVpmelpIQTNw?=
 =?utf-8?B?aFk4c3VpQXFZSGdQWlNaZmFlejNaSFV3dWVJYjNzNEp2MklXRjZsSE1YckM0?=
 =?utf-8?B?Ykl2d29PTHV0WDhsT1JnN0pkcHVEQXJ6RW03a2padGQ2eFFwcS9VL1NoT05U?=
 =?utf-8?B?Y2I5Qmp3SDN6OEQvNjI4bFFXMWNXdkFTaDZkMWNlTG1sZkFMU091b29SSFVp?=
 =?utf-8?B?eUFma1piYzc5dFpubGVDMU84RGtIeCtTU3pNRHdHVTQ5REZodEp2OXdwUnUz?=
 =?utf-8?B?NW53V1Y4V1g4U21WTmlYS1RsUm5adkNSU2JFMXQyZzdXdkMwMkFUbzRxYkNI?=
 =?utf-8?B?OXNRU09RVGtzaHNSTmxSQ2ZQNWdwTWN6NGN4WUVjbGw0aWcxYlhza1hLb2FG?=
 =?utf-8?B?K1RGbzBFWVVRVDEvMXM4bFdnQ1dJVm94QzdPR3F3N3NoenJ3TlVDRDdiTnBm?=
 =?utf-8?B?em82SmlXNDBTcmhKNXk1SDdXUVBIbFUxd3Yrd0xSdHZJSlVZZjBLdm1qZEFQ?=
 =?utf-8?B?NWVZVEJEVElYbTdBQ2ZDSy9Rd3dmUjFmdmN3K0lOWUFMSlRaUkZkTXo1T1Qr?=
 =?utf-8?B?Mm83ZkE0WEZkeEt5TUVmNm5CQVQzc1NlTmJsYjY1c21yK1pBV3RWQ082cjdB?=
 =?utf-8?B?RjR6WnJ1UnQ3ZWFabG5ubjVlLys4ZDMvditEVUtXSFdOTGs0V0w3aUw2ZlBX?=
 =?utf-8?B?SEF4K2QvRE1tRzRudWR1dmtsZ3AzaWpVRFIvNlFJaWQrUzkrVG1kZHNNL0Uw?=
 =?utf-8?B?V3kwV2UzbW9idEs5c256NkRrdk1TU3hQTmdZTEpCYVYvQlArRmpjejd5OXRF?=
 =?utf-8?B?aUorR01OODFzMFFNcktQc2orR3NPaG10VUxRYndPazZFT1krMlNFaTZKQVJD?=
 =?utf-8?B?REFLMlh4NEkycnVzQUxOVHBDekVaODloaVI2RFdUU1VHRjdjNW5vTmV5ai9l?=
 =?utf-8?B?SytVWEpNY2FZSlNOMGtLU3hDZVJTYitTK0ZVUzh2ZldsL0FRRWk1QT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6798d12-0e53-4b58-e846-08da1e21b428
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 14:18:53.3554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ps67YFGxdnSub0CdzOiTaN1oiXt7RDttHM69ghe7KX045PbPtTuHL0Tbibv8T69qDtfHP68FMWL67RG6Bw7R/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5357

All,

we're pleased to announce the release of Xen 4.16.1. This is available
immediately from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.16
(tag RELEASE-4.16.1) or from the XenProject download page
https://xenproject.org/downloads/xen-project-archives/xen-project-4-16-series/xen-project-4-16-1/
(where a list of changes can also be found).

We recommend all users of the 4.16 stable series to update to this
first point release.

Regards, Jan


