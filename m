Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA71492744
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 14:30:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258494.445215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9oZA-0007G1-0E; Tue, 18 Jan 2022 13:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258494.445215; Tue, 18 Jan 2022 13:30:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9oZ9-0007D7-TX; Tue, 18 Jan 2022 13:30:27 +0000
Received: by outflank-mailman (input) for mailman id 258494;
 Tue, 18 Jan 2022 13:30:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9oZ9-0007D1-1I
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 13:30:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb46152d-7862-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 14:30:26 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-axlo66_SPe2y-l6jrLzv0Q-1; Tue, 18 Jan 2022 14:30:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4623.eurprd04.prod.outlook.com (2603:10a6:803:70::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Tue, 18 Jan
 2022 13:30:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 13:30:23 +0000
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
X-Inumbo-ID: cb46152d-7862-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642512625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gpKfqx5aEEgF36yelLlI0u+lg4U2VNri6Kbi+HKlieE=;
	b=Ma5WAV3hYAwxPY8Byh6IFZd84R9TTyyAL3+DmkKvFO/R8MzY++KAOF1UYOzculJvEmhZwc
	My9czKOiYtTLN247BGYkaBD5HxzijKUu6o9sv5J802lUy4775B7F+bXTuzEg/2owSl9jcE
	/0x1cuIhns4xXFknAyYqrWnsU6Dtrvw=
X-MC-Unique: axlo66_SPe2y-l6jrLzv0Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+dznToF/+0U+4usy2LYRbT1Z85xXc3hYy04zuEzRKMG9ctqwnIcnFyjMxyiztcBeJAtC21SzTUSs9tIldTofzh3qANMol9ocHeJgato+3lwdq5Cerodd686CVLYVVWUfROgMqB0BN/vHQZyjzNgkwPvY16BRFmNgQ2M3z7xVCsMJCwSddVxtbd3cQeup9BPnUGc/y4DcrNIQI+gIBAlxqIFCVgKVWkpI52+OhV5KRmPOAfW7pEScnsjYcOugVuanFFtwMeSinvMG70lCbh7iGoD7yRU9axBegXZlfbb9SwF01JA4iJpNPb+DMDDJMBvcb2YGa8Mb5g0I8d8gigvpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpKfqx5aEEgF36yelLlI0u+lg4U2VNri6Kbi+HKlieE=;
 b=jfXdwNx/akJOEJpHS5ROq8D2St2xDt6WuAdhQNDL3bHq+bCgO7q+omXdN+DfaysgjQTwueb9Be0CCsqCBvJ0TVG3UAdx/mL/zN6ZOY57L+Zs0d5a1ZvRq+q+89TUkld5gRhi2W6WqZsskMgLuHCB6q0r5/aWSEO3xSUeBT2EKl0B6MAcGl06/8z8J0LmEIAbrfwHLwAFU4HRPftBVkHTwb1IeCcAAFr2M4P1OlNT63n6gkZsn4BWHiSXWx2+rTNZd8tbAoVFzS/UdDBrz1TmjS2YaEoG51mRmZHeRY4kweclPt3QHWqOvtldxLppm3xtM8BtDrAkelAax2echBty9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <db51c954-d8a1-8fd0-54c7-c0791edac765@suse.com>
Date: Tue, 18 Jan 2022 14:30:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] x86/time: further improve TSC / CPU freq calibration
 accuracy
Content-Language: en-US
To: David Vrabel <dvrabel@cantab.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6c50c7b6-e521-e34f-1808-a4e2961b807e@suse.com>
 <5d3db5f4-44db-b782-656b-d755fbf4c441@suse.com>
 <a4eedbc9-f5bd-2195-679a-77747614c258@cantab.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a4eedbc9-f5bd-2195-679a-77747614c258@cantab.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR05CA0025.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4364b571-f6e9-4ef2-e757-08d9da86adb7
X-MS-TrafficTypeDiagnostic: VI1PR04MB4623:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4623F022647483C6B12FC0C2B3589@VI1PR04MB4623.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E2Rq0NHJSpG1/EuVi6ejj6o9586b6dw0ao17mI+VozYVllcaoI0Eva0r3GrklQtUNVeZoJMJsKkh0sjw3sX3kmlQ9znJ0Pv5TImBy4iaoumAl5kbI8mAVyworvPArE7El+AU8ZrtD5suNG9cCbSJT4/BwfgZJbEloLNICiq1D2du6BC7kpDM12Dj2NyH0FVoQXulBHMKYY3WpytPOCuVmeePYgesc56D441tVECV4XvL/NGo0ckP8JTV9HWILVay0k6A/h3cQS/KpEI9Se5jDOQgwAjebWOXKz6Bzmc3Jx9ms4l1rPVyMKG9e8tiX095BYrUAwSYNXvmLZdbbtLa0fhrLisJqbD04nBzdLHuyR+A9CXb78k2FKp7ASyVrbnueZ7Y0NnKv0kGxCqqBT2QEwCxSfCuxhyH0UsfKfwozOAXAuQh5NtuL/dvNQoQGJDXD5gORHuwLkgvRqXictK97e4ZInA/z5/WRmxA626ko8KhKr67RxLcVhrbjY/UIQJ9kejcHG9BeqNPIvYnKLK29A0go6yCjG59B+mdvhLh+dtaA0vdJ2j4crZNSzAKOyONdW9ShIxkzhlAitI+8u0dgutDjbJFGbYxnvaecp8HtyCFpP5lZVZlZvn2Hv5eWZ4jRQWHp1pwZEeDzahaVDhSKAhQNovApSjLX1HTuyZyoqkHdjufot2Sf3qN0Czsxx6TZfByA9UZ+xE5oxTnuFjytH/6ybGiyUDo6ttS0fwNlsSTyQmDX6cAm8+LlzyAmiJG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(508600001)(4326008)(86362001)(31686004)(5660300002)(6486002)(54906003)(6512007)(2906002)(316002)(38100700002)(31696002)(8676002)(66476007)(66556008)(26005)(8936002)(2616005)(186003)(6916009)(36756003)(6506007)(53546011)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTZDOTl3SW95WVdpZlhmWk52dnV0ZElWeHpwUzJyN0dvOGhTUW1zNkpOOWY4?=
 =?utf-8?B?LzMzVVFFeFBNNjR1eFNHNmVRL2gwTjR5NEZGRkdGbHQ3YUFOMXVDZVpuTkdk?=
 =?utf-8?B?NzNzVmlxRWZMRm1QR0VhNnBLRldiWEJNQ3h1R2J2RmFiemFtaFNITjlzZXMv?=
 =?utf-8?B?S1pwdzlISXEzelFkRXV0U3RmRUdETjJrSmI3bnd3RHFUaktuaGtKc0c4OTZr?=
 =?utf-8?B?S0pzT3Z5SVU3Q2dBSHNzbnZlUGhwcFhEUjF2UHJJM0RQK1pUZmkvajBIa01s?=
 =?utf-8?B?bjJpaVZHYnRvNHJxVGdDZUtzSGhEQi94Ynd6cGJqZlNXZjVBb2xDaUgyV0Uz?=
 =?utf-8?B?djVCV3lEMHFuNytuVkp5cXNrTXZkODlYOFdDaWE0ckdQRDRmZjhTT2xKWXB1?=
 =?utf-8?B?bkVua2Y1SW5OM0J3UjdRQ1M5ak5vbXZSOUZFTmhiVTA4NW02Y3krVy9saExD?=
 =?utf-8?B?WHlvdkdHRm9PVmxISHFlNjdJSnFYMmx1eW9JekNqaksvV2NWaVNZSHU4TUtV?=
 =?utf-8?B?dENXOGZzTVJBbjkwNzdZbmtIbUgwK0pmN0lJMjdoMWRCbzRVUGpJSUQyVHRw?=
 =?utf-8?B?aHR3WjJER2wwaWpCTWt6N2pkZXQvbnlMWm1OLzZPN0hWSTYyK2toTnJYUlpO?=
 =?utf-8?B?V0xuRFRtejU1UWVjeGYrMEtnRTdlMzZoNGh0Skt2ZFQvemdRSDF3NWpXTitN?=
 =?utf-8?B?Mm5BNGY4ZXBGTENOWDBTZlJwM3FzSjBrS3dMeG44L2ZGUnlYeDdvUk9pbkR4?=
 =?utf-8?B?QVl0ekxsM3RYTGE3K0tIRXAxYUNDZ3pOVkpYWGhORzk0WWpVYlVSMjh4OHZ3?=
 =?utf-8?B?c0JaYnZwTnNSWG84ZkpVeGhPa04yWkNuRUNWLzBkTlhRV09EbzhvdDc4VGxm?=
 =?utf-8?B?bHM4K2dtWGY3SVUvaURldmQ4TFhSdGZjYUM5YzIrWE9DNjJVbmVXNGxvMVhY?=
 =?utf-8?B?S0FkTERXeEVkNFlIUG9hT1o5YlBpclJsY21jejYrNWFuS2lqWFNwd0Q5MlIr?=
 =?utf-8?B?QWY5N0pNV1VpS215UFNDaVowS3NCL3pzMUxBOXRXL2tIZWlkdFB4VEVBSG9i?=
 =?utf-8?B?RERvbk92OTd4VHdWd3Nzbko5UE52S1MyeFhkVS90bElKTGFVREtnZldic2NI?=
 =?utf-8?B?djhGSFVxNDFSY0EvRWkvVk1yUVZobzBJQ3pGdjN4aEFVSUpsOXAvY2h6TTdj?=
 =?utf-8?B?bkVXM09wSVF4VTdYYVh5emM0eFZ4R0I4eTc3TlpUY0gvUVQ0dW9LMUJyYStM?=
 =?utf-8?B?elZxZEo2c0V2NzhLMktucTlJR29aV250Tk90V3dtS2QvUFZzMjBWdVkzTVpN?=
 =?utf-8?B?MmROdDhYZlhpRjVVMW9rMDdESWh5T0Z2WVZiRWdYdTNnSlZHWUc1UzR5bldN?=
 =?utf-8?B?MGptZzc2MDdjcnNFY2ZhVUxPM2Rja0thWEY0czdhZXp3RHNXYWxzaHFXR1Fr?=
 =?utf-8?B?d2lQQzJYeUpnNXRzQzllWm02RlpEeVdhTUdZRk51QklpejJGYm5UUUFweGlO?=
 =?utf-8?B?S0hjWjROc3dDVjlNK1l5dFZINmxrV2NNc290LzU2alphTE8yaW9zLzZlV2xJ?=
 =?utf-8?B?MnNMK29TbzRBeURzczg3T2xnZXFsNFpEWkhYVVFkTmU0VFZoU2lnRDRzbzBz?=
 =?utf-8?B?eTV4akthRHRtLzlwSHRMenBNTUtSaUI0VWlPM0JSSE55UG1iNk1UdjMyR1NC?=
 =?utf-8?B?K21KamxBTGlaZmVJSTI2cWJnN3Naa1hVQm00dXdOTWg0QURwaVBtUUZtRE1t?=
 =?utf-8?B?bEJVV0c5eEg3ZEV4TjVMNDZiMS9wY0M2VVIzU2hOT0pqYzEyUGtoK0hIeStI?=
 =?utf-8?B?UDh1RWg0Y1o5dEcvSTRtMDhiUWhBMW1GVjhsbEd1UWYrZjVvcmZHTzdIZHVR?=
 =?utf-8?B?ZzluMEtnMXVqQ0NqVlFCS05NY1FETnFoRlRVTFBOditzcVdMWG5MUzNHU1Rx?=
 =?utf-8?B?am9VM2I1L2t4N2IyWUVjbWhTY1lOd21yOUNOeDlkRmZWeW1ONENQN1Irbk9l?=
 =?utf-8?B?TDNrRTg4VXZwNTluMjdEWGE4T0ZPRnMwV0tUK2kyQjhiUlRMK3dYNHRHL3g3?=
 =?utf-8?B?QlpYdWxCY2dUSmNIa2lsVGxqMUlHWUY5bWdzcXB1amdXV0NYNkUzZlVJdjFl?=
 =?utf-8?B?Q1ZEdUkrYVNNaFBrUk1uS2FUZTJMYWM5Rkt4UDBVaFA4Vm83MTIrQlZ2ZkZo?=
 =?utf-8?Q?FrWp60FYcKM1ng+KHTYmgF8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4364b571-f6e9-4ef2-e757-08d9da86adb7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 13:30:22.6008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +HP0XaEG34nRrCQWmgvPOpPpWOLN3X+pzQ91QuwJHBja0SLI7a84aOt8Krj9Y1ypaPmkO6avOcA6metlXlzhVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4623

On 18.01.2022 12:37, David Vrabel wrote:
> 
> 
> On 18/01/2022 08:50, Jan Beulich wrote:
>> On 13.01.2022 14:41, Jan Beulich wrote:
>>> Calibration logic assumes that the platform timer (HPET or ACPI PM
>>> timer) and the TSC are read at about the same time. This assumption may
>>> not hold when a long latency event (e.g. SMI or NMI) occurs between the
>>> two reads. Reduce the risk of reading uncorrelated values by doing at
>>> least four pairs of reads, using the tuple where the delta between the
>>> enclosing TSC reads was smallest. From the fourth iteration onwards bail
>>> if the new TSC delta isn't better (smaller) than the best earlier one.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> When running virtualized, scheduling in the host would also constitute
>> long latency events. I wonder whether, to compensate for that, we'd want
>> more than 3 "base" iterations, as I would expect scheduling events to
>> occur more frequently than e.g. SMI (and with a higher probability of
>> multiple ones occurring in close succession).
> 
> Should Xen be continually or periodically recalibrating? Rather than 
> trying to get it perfect at the start of day?

I wouldn't call dealing with bad samples "getting it perfect". IOW I
think recalibrating later may be an option, but independent of what
I'm doing here.

> You may also be able to find inspiration from the design or 
> implementation of the Precision Time Protocol which has to similarly 
> filter out outliers due to transmission delays.

Thanks for the pointer.

Jan


