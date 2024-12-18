Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B357F9F67C9
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 14:58:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860403.1272420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNuXl-0004Uc-Ja; Wed, 18 Dec 2024 13:56:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860403.1272420; Wed, 18 Dec 2024 13:56:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNuXl-0004SA-Gs; Wed, 18 Dec 2024 13:56:53 +0000
Received: by outflank-mailman (input) for mailman id 860403;
 Wed, 18 Dec 2024 13:56:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bs8F=TL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tNuXk-0004S2-AL
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 13:56:52 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2009::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecfca7c7-bd47-11ef-a0d7-8be0dac302b0;
 Wed, 18 Dec 2024 14:56:50 +0100 (CET)
Received: from BY1P220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::8)
 by PH7PR12MB9175.namprd12.prod.outlook.com (2603:10b6:510:2e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 13:56:45 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::2f) by BY1P220CA0018.outlook.office365.com
 (2603:10b6:a03:5c3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.24 via Frontend Transport; Wed,
 18 Dec 2024 13:56:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Wed, 18 Dec 2024 13:56:44 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Dec
 2024 07:56:43 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Dec
 2024 07:56:43 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 18 Dec 2024 07:56:42 -0600
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
X-Inumbo-ID: ecfca7c7-bd47-11ef-a0d7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iwWRNRBR10RGcjdKRk7MYL/Xh1Fk7DaeVdmJR1zh48f6LrvyQ9nois8Ejqd8Ing6yNbhURepWf/gICMkyapn2zcHPFrW+FOHZvOh/g8IclIhnY9u3ORV/OhwYRJMczLhVcY2gaXCY6AUt6Eo9KPtDcPIJXlCesG32A+TPDSjEshvdOpN4hK+jgaOvJr+p+cEDGz+UB3MxKZk5iwDx3joCMe8YeiNmy+iQjLsFyW98Nrs6ftCH05vNGG3wxDWHmN7ldCcUHq1057Wh2pQGGywq1l9rhw3366/SkYC1Ppv0jhhAmnYifngzV6uBpsz8cLVKMEYCFWngdaIpIjIXiNzkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9Yxhx83rPdoTe+LiUW2tJalCkNIJlDcFhun7dGoSic=;
 b=hUN6VVFzYwhhZIRSIazrjPaqdFajsFJ4s9n3rUyqjgrsAp3fbn4iT3YQ88YxgGx3TXRjuLBnZIY+TAxqt4Ic+IRJaLkejCBM6a+/YYO1PkHcaMzWFyotT+ZRz9lFRV6N6DKTh7h4HUd4LA28DXYRNgJToatQpRQegPmItaE2zqFUb2WljymGuXaCXqTDmAWHkTURNciRD1LHtg44ppSqJgJMTjHA1kl0hd0MxIcnTDCXTZ7Wv9Uw5VkN2qeenlRBsv7mvF8MkbNqx3RPXS9IWsmTodeakTUZ/YvxU7dNksnNz1RUKxwhGodMMS5jkVr888bXcVQwtCn7e89tKPWgOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9Yxhx83rPdoTe+LiUW2tJalCkNIJlDcFhun7dGoSic=;
 b=WqkjrpByCE7mGHYjA5g920rswdNSo3ydbfJPDHe3+hQAxdQcgJ7R+Oxe+rMfSymRm5mFLasrsUG8pW2ixaK/jtD2KR46XFDama/2ijMRtUmgAKeiZXy5vkSF+LstqL5eZkbnbzYG5FTZO5geSik4zzVveHMMKl9HiWgzTBlUIag=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3984b69d-e15f-4863-8af9-53b6cc0f6bd1@amd.com>
Date: Wed, 18 Dec 2024 14:56:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: fusa: Add dom0less domain configuration
 requirements
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Ayan Kumar Halder
	<ayankuma@amd.com>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Artem Mygaiev <artem_mygaiev@epam.com>
References: <20241212190325.2130129-1-ayan.kumar.halder@amd.com>
 <779AFC45-3F8C-4065-A39E-9325F9C72AAD@arm.com>
 <2cf952f4-69cf-4eea-aace-4b7bf291b9f3@amd.com>
 <983EB0F5-8C88-4063-9C97-EC8BB89AA5B0@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <983EB0F5-8C88-4063-9C97-EC8BB89AA5B0@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|PH7PR12MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: 44930722-6623-48f0-0ce8-08dd1f6bcedf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aDRqYW55TGJmRmt4VGFyWllFOXRVM0ZvazdaS1oxNExIZ2lOWjBzOTN1akYx?=
 =?utf-8?B?SWpSdzNMb0VSRFROSEFNejJIeWU4OVJ6a3k2NFM3Z2xFKzUvNG5TNjJLR3B0?=
 =?utf-8?B?cnU1YzJtR2s3VkxNK3lkbm5MMzFqZXdMeGJBQi9NNk15MGNrUTNuVThpQkRX?=
 =?utf-8?B?TlQyUHVqYXVoZ054dit1akl1aUF5TGpVeGQramxLQ3dha3E3dGIxYnNGd3JQ?=
 =?utf-8?B?NTJaaEZxYjNlSVZsdWlRN3p6V0RUbTRrSmRBNTFUUHlndFpjWXEvb0xGekc3?=
 =?utf-8?B?dnd4LytEU29NY1dtSTFCTFQxZDhZTDRqeklkbXZMdjY0TUxOWkxITEl0ZEgz?=
 =?utf-8?B?Q0MwdWwvbzFudjlDOXZBOUJvM0tHRXBSaTExclZsd1FzL2l6WXMxbCtXYmg1?=
 =?utf-8?B?NWFDbVBoVURwcUl6Y1RXTTdhbDVGY3FPZlQvSmFDUkxqQ0lFNnp1VWNTSFJx?=
 =?utf-8?B?cTA2Y21GMEhFMmdsdlREY2VHYUR4d2g1ektCeGJrMmVkNVQ0UFA5K3pkU1ox?=
 =?utf-8?B?KzlRa1Z1NXIrMUUzRnA0YTNBQnNqYXQ5WTIwTzE1NFNQUXdSTHRIeFEzVGpu?=
 =?utf-8?B?UVd3emVPUDhxb3BhUTFEdnd1R3lMWDM1SysvUnBEMUU5ZnNjRzFwOTZNMUFJ?=
 =?utf-8?B?eFBtQVVqb2xpQXFrRWZNR1phUnc5OHV0WEpkMnNEclRuQVV3cnUyNkRrYVlZ?=
 =?utf-8?B?am92b1E3ZnJqTnZ6MkdrcXQvOFErZSs4K3lUUnRMaStUM2dKeFpoY01WVXRG?=
 =?utf-8?B?R1laeDJhMzVheCtuQWNGc2E4alBJdUVNcXJoVjVXSjlHVlJnQmN3bHNwSE1P?=
 =?utf-8?B?OE1MQXFNMTNEaDBHb0dxNTZpa29MTFE4SVJvNmFEYjAxR2ZFZDFVMkJ4VnJQ?=
 =?utf-8?B?QWJZOXZxL1hKajdBNGpuYVlMYTR1bWNKUnRQVkdLTTk1SGxXVnltU3NZY1BQ?=
 =?utf-8?B?NjNQRVN4QU1OMGFCWXp0QzlIVW15QTF5V0I4Q3dYZC9nSlcyUUtiN0RRcURw?=
 =?utf-8?B?Vi9ZM2NzaUd6K21hUVg2b1pMaWIyQ3pyT2RlODFzdGJKdGs2UjdGam5iVzZx?=
 =?utf-8?B?M3NDMmJRVXV0Zk53d3MyYm9rV0hFY3dZTnZNTW5WcmxTdTMxL1hzNGk4bFBR?=
 =?utf-8?B?Tk1CbnRrY2gzWmZkdkNMTzVRdWQraFJEbHpITjVRRm55dmJ3Z0Q2MmQyaVZp?=
 =?utf-8?B?YzVwSzdGc1FuN3Q3bHFuNXdsZmwxclYveFpiTDlPNnZleXRXTmxadlowaEVS?=
 =?utf-8?B?QXZpSjFzWnVBK2lEcnVHZDBSbmRHWHNwcVZlU29KVjV3ZGVuVEtXT2w1eGMv?=
 =?utf-8?B?bkg4WU0wWnNBZHpIVUNWcENubTZENmlsZVBFci94N3gycWZPL1k2SHdyU1Yx?=
 =?utf-8?B?WXAyMitwTHJKNEZSTGZOUXEwWWpMcjhyK1BQeDc2Rm1XRVZCWUhMM0Z2ZnJX?=
 =?utf-8?B?R3pIc2xvT1VQdTNrVUhGR0RPYllGRm92aFdTTFFpbW8ydEdyYmlXSnZuMUVs?=
 =?utf-8?B?MEdnM1VSSEU2TlVZMnFTbFl2OVRKOGJuSXNCNjRhR0RNeC9VVlRQank4bTdT?=
 =?utf-8?B?WG9KY29CYlJpZEM4NHFaTGl1RkpPRzkxejFIVDBpVzk0eHh4WUJBSjhIRVo3?=
 =?utf-8?B?SmFmUS9Pcmt2VU1JM01URXl2Vk5BcGh5cVIwM2l6T0pnajArRlUzc2txS3pS?=
 =?utf-8?B?Y0lmSlRjUDlXVUc5VnFlb2tIQmUzbVB3RGQ5b3FobGY1ZVFRdVpLUjhFSlhS?=
 =?utf-8?B?UXdlakszQlZBM3psSjRSM1VnMlRGcGNqY05NaTFEOGIyd0FuL2xCKzFlR25D?=
 =?utf-8?B?NEs2cVMycHRjWFRhbFE2QUhPcEpRUktnWE81WnBJWmdWdThDS1JzU0ozVWpY?=
 =?utf-8?B?cEFmVFA5bVZTanhKYkRQejU3TUh1VTY2UmpPeFJOVGp6ajJ5Y2Vic1pYQlA5?=
 =?utf-8?Q?iJL/vVKyXvg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 13:56:44.7445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44930722-6623-48f0-0ce8-08dd1f6bcedf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9175



On 18/12/2024 14:08, Bertrand Marquis wrote:
> 
> 
> Hi Ayan,
> 
>> On 18 Dec 2024, at 12:34, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>
>>
>> On 18/12/2024 08:27, Bertrand Marquis wrote:
>>> Hi Ayan,
>> Hi Bertrand,
>>>
>>>> On 12 Dec 2024, at 20:03, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>>>
>>>> From: Michal Orzel <michal.orzel@amd.com>
>>>>
>>>> Add requirements for dom0less domain creation.
>>>>
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>> ---
[...]

>>>> +SPIs
>>>> +----
>>>> +
>>>> +`XenSwdgn~spis~1`
>>>> +
>>>> +Description:
>>>> +Xen shall allocate a specified number of shared peripheral interrupts for a
>>>> +domain.
>>> This is very ambiguous. What do you mean here ?
>> Xen shall provide a way to specify the number of shared peripheral interrupts for a domain via the device tree .
> 
> I am lost in how you achieve such a thing in the configuration.
> All you can do is assigned an interrupt to a domain, but the sharing part I do not see what Xen has to do with it.
This req is about Arm's SPIs (Shared Peripheral Interrupts) and the max number you can allocate to a domU.
You can see more here:
https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=docs/misc/arm/device-tree/booting.txt;hb=HEAD#l172

~Michal


