Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8626660E04B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 14:07:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430508.682258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onfBZ-0006YF-Fx; Wed, 26 Oct 2022 12:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430508.682258; Wed, 26 Oct 2022 12:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onfBZ-0006VV-D4; Wed, 26 Oct 2022 12:07:05 +0000
Received: by outflank-mailman (input) for mailman id 430508;
 Wed, 26 Oct 2022 12:07:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1onfBX-0006VO-SB
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 12:07:03 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70059.outbound.protection.outlook.com [40.107.7.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b343ec4a-5526-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 14:07:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7470.eurprd04.prod.outlook.com (2603:10a6:800:1a3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Wed, 26 Oct
 2022 12:07:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Wed, 26 Oct 2022
 12:06:59 +0000
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
X-Inumbo-ID: b343ec4a-5526-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O80MbpcSXSjhG2XtsgpJbu4Bj51Vx93a6DAhlIosT8elPEXBiV9VdKZBGXLnhKcnHV5QlRSgHxp58dmJmeblMWEMSEl7jttEk9WVG4/KKDjd2C8D2SPx31Ut04z/+pqNRtm9Tt8z18tWhk2V04G6oKr6aYaIn8wxE7FlXCWcprXZYpSBYwPWy987OvW6VK22B7ZEMUvFn9gvo0Q9ew/zE6UWZX4OOtjLOZ+YUTRBEaNkiqg1TJU8WmmQ/VAazZYZv1oox/ZjCI2f4ZsepXj9HAyFUsl1BoqmX7b6PF/JMBs6EPNC0NhXnn6yZ/XrFP59QKsWs8Cb9j2pGBoeQLrhvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvS+6gAm3nZXIXSoOJSEGQ/JthYAowZtbB5XTXkQ818=;
 b=DjS467Q9x4qODoAz/v8GqPk41XYCmVDOYAs6fUiFZywb9O0VxHLC23BSh5D2vkoxW1fVXW8pHxCMIkeEmF0SXcFwOk7Kvxlyjhp5H2Ontmqgm/naB27HozTaGmWwocI76fI6vG2kctgg5B74vTf+MQodF3xdd9e09SZpf5aagLwQVzF353XBceEmxtBoRNS60FyifNtTnS/+q8MjxLHPllV1NoYVru+XTOxp2j6JxssvW9zPhKUUteYwDg/ygePY49ji4hKg3H/yoSiMBtQi+dg9cyo+gs6peHjbNYdVybTi+jCROnVZA4VdQ+MqRhifKRGg1vn93vZ59SUKb8NuCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvS+6gAm3nZXIXSoOJSEGQ/JthYAowZtbB5XTXkQ818=;
 b=VF5fDhGAgy5QkBDdfWgK9RfnltYI7AcOCV44OfT+aToOdmB6iSPUiuWjFjZ7z9WWSZVQd0aZOsUa93lUrDCVxl26CkvSIqSmUL0sJnx1a8PlE1NAgr9tz3S2rnqU7ZgVtaeyKMM4i1nt1LwBn1ATtnW5VLpXm7Dw27wj2GAWvNkNqCas+KZnap5463lUxFgJ7aqGcxbtZKgkZ9moYER9FMOYBeIZgsIrKYaFCQYMj8dAXJzhKQ2jBc0WnvWIOUNo5dHO1dWcvfsFg4eBdQC48SnpXw6nGrvPsbxyMOzZcdDknzSlINm1PCbB9ONX7BSAegXhwYQJFBcOapcvm7bjtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a00d4591-b068-c05a-763b-905f61af4d46@suse.com>
Date: Wed, 26 Oct 2022 14:06:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [v2] Proposal for deviations in static analyser findings
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <83A7652A-3F00-4490-837F-81498808FCC7@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <83A7652A-3F00-4490-837F-81498808FCC7@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: 613cf8f4-9649-473d-5e7a-08dab74a95fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1dyjJAqS6zthjGiLozR1IMIpbscoTbqgMC48nVNl/2D9Qu618TaNMGVYouSGbWjkfOqX1fRzzaholIJihUg4jU3Y443BnizBM89NiqAe+MCI+9gNA8Pg0sk65e3I5C1hvxBDSAralGTreuWCDtefC70TRe/Vyo2/cRXJ8azM/obIfSi9uc/YocVhF9cUyTBWgv4ZAKzkFvHpMduU8iv9Llwrz0JJzQwCCD0/oIsy11rLKQuYbJK+w1y59DAuxGR+DgjLBfpX4JYr0jLVHVp6xD5x0yh5yNWSixDcMypCAivoiGcYlSrQPuiuRAx3kEzfLgvWSRtcYic4U2FjQTOm5jx9B5doaNwDVYTmGEY+tbLbDdZssV8bHWcsi4lK+3YMS9Qo0pNC018FVUtvDYFTApFxp6t1sVd+eP5LJaZaPpu4e1CNkIz6d09BTfvSZq5mNvcczhiFTZn55mXRGblRwe9yiI/bTelY0PeCNvmEBrT+uLLbAb/7uPfbeM1IKiX81V6vlASBNTRc6yh7tkspVl3SYbV6X7MqHTMf2OzmJVaytKrHxnGXZQkywlDsFgmtb3kOnKl+lrbqrnxBcfHkdNjqTTYGkJAahhxjhcf5IwoOvTVypycEWxL+1SGV8+85pja7VPkimgL/70vkyaDeZIrwUqlQOoeYDKZlPoEE360MLjSh+vJTkVBW29mj3JFMOlFWLvXpcKImQJV87Cgapde7eWPQIBCheioKqjK0Ug3xMzK/VfsTuosYECWT65YaYyNKczXNKe+lmeRkOZ+qQ5QfQwBZCHkrrIc4oGftWoU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(366004)(39860400002)(346002)(396003)(451199015)(26005)(41300700001)(6506007)(53546011)(38100700002)(36756003)(5660300002)(6916009)(54906003)(66476007)(66556008)(6486002)(316002)(8936002)(31696002)(86362001)(4326008)(478600001)(66946007)(8676002)(2906002)(2616005)(6512007)(31686004)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjRRMVhHZFBJL3pvdWFnRno3MmN5V3U2dlBpb1MrY0pUclFkRUs5bHFBN0JG?=
 =?utf-8?B?S0hyZjBzMng4dlkxQ0Y0RUFBWWNHTlVvSjNZT21ZT1M2S3ZUcEZLdlhDWitW?=
 =?utf-8?B?SmdiUjZ2cW90WDZsT002djYyK05TaVRka2RkZ054Z29ySFZXOGJGTWRObFQ1?=
 =?utf-8?B?L0FLYisxa2w0THhEcTBNWTJtUG1JWWhvYUtkMC85Zy9mV2Foa1hOVVZRelB3?=
 =?utf-8?B?UURVak8yWE9YMGpSK0h2OE1oZjhXVGxGOGd3M2tYWmYrMEhJeldxci8rWDUw?=
 =?utf-8?B?ZEE4V3ZGTmxQR1lZVGprcVpxdjR6ZjhZeGNTajVpUVJUNGlTN1ZxdFdGZDha?=
 =?utf-8?B?eXJiRS9jRndJQzZEcFJGb1R2aUVuK2NMVjJhUzhodUN2anJlQXpOZVJaSDd2?=
 =?utf-8?B?NHhzQ3diZ0Fvd1ljeW1zRWp3MmdYdFZQRFRhNzNkYUZaSnJjRGFWTExDZkpW?=
 =?utf-8?B?eEVOeGFvR00ySkZMNWdTOHZ6REhsVGVQOVVTdmFuUVhVRG5CRzNPS0xMRUFp?=
 =?utf-8?B?Qk96QzJuVVl2M3B3dENuRytwR0Z3RHZkanlaMmRWQkliNEhuWEpReTNjRnZJ?=
 =?utf-8?B?ZThBbWFOaU94V2VTUmdEcnZhYWF2UHJTeldwZkJ2U1V4YVZWZi9hNmgwcmF1?=
 =?utf-8?B?VHZqV1JoeE9JTDgyTTlTQy94SjhISjl4QSsyc0FHbFVWN3hUajZKTGl6QlJI?=
 =?utf-8?B?VlR5VXJPczdSbjFWU3JuVTlQalAxeDBsUkMvYWx5MkZ4QWpPNVIvM1oyNVMr?=
 =?utf-8?B?YTdYTkJLaHVSLzF2SHhjVU5vVzcrUjY5V0lqZUVRUGJxajJNZVFTbmVhYTJK?=
 =?utf-8?B?V1dRSVQ0Vy9PdWJVTzIrUGZXdUIvRnV0OWgxQmtxMnV3VlFobkkxQnJSUXNi?=
 =?utf-8?B?TG9XekV5MzdtV3NhOWVUY1FtajVsYVFUZm5mRzAwVEp1VUlKa0p0MXVZbDBj?=
 =?utf-8?B?TkFlTUtDcmxCc1QzN0Fib2V2YXZJTWJKL0VLRk4rdjJ0MVRqa0VLS3BpblFI?=
 =?utf-8?B?UFk2TDE4b0w0UzJFa25LenNmMHMvcXJUaEFkVnB1bHBTTUswellhS2xRazFU?=
 =?utf-8?B?bUZwL1l2SmtvOWRBUU5UbGhKZzNzUFVRREdsNDZuM0RxZ2hDZjQ0OUZoK2pm?=
 =?utf-8?B?d0o4Y0RYeDI1Tko3di9UdXJ0QzBsWjBlNVdiRjR3TlNGZGp2dVVxS2ZlYTRD?=
 =?utf-8?B?YjhvVTdJeitQNDhkOG5JRjFZTkhHaDBaNno3TnNsenFDcVpjZi9mbFZUd2lN?=
 =?utf-8?B?WkhaQWVQVjRoWkRxUGNrYStaT0xQTVVnRnVBV25xWjdycUpNMStuZk0rNldu?=
 =?utf-8?B?VGZJdXlmY1FybXR5Q2lIOTlsbjRuWERTUlc0aWdJMXJiNloxazY2c0hVc05X?=
 =?utf-8?B?RDN3L3NLc1ZKYzJoTlA3ZzlNZkhaKzFhTTdueXlVcXdMeFM2aHhPTTE2QndP?=
 =?utf-8?B?UFg2MVc2L2RaWGdlTW9TREd6UlRtMVF3a2x3RklaQW9WZXVuN0tXZEFPYWJV?=
 =?utf-8?B?NUpBZE9xMEk0M2dLZHZydVNyVmNqb0VrUkhpbE9kT1ZURisyQmZ5T0VMZGw1?=
 =?utf-8?B?SHRQYlFoVlIwdDZiUzFaYnQrR2NodWFtbHk0cUNEckRVYXR3L21DZ0xlVEtQ?=
 =?utf-8?B?K0YwbGt3dUxoTTFjN0h2b3Bkcm9YU3BZbkFxTWsrSkJ0MHVjeGVMV2FFRmll?=
 =?utf-8?B?S0VDa255b2duOHdJY09DcG92VnVKQSs3WjUwbnJlbWFHZDBQMEdacFZId0xr?=
 =?utf-8?B?SWVhUzFTdi96Ky9yNS9HL3ZjQ1pkS2NkaDJYMlI3TTBCVHRPckRUZ0pOdmYy?=
 =?utf-8?B?RzR3Z2liZzhOanFTRGEwK0twSzFMM3g3MlV2cW5tT1BXdlRnTkxzV3lHQWpX?=
 =?utf-8?B?Y0NRV09GZ2NhWi9QVE8rZmpRVEdrbCtUb0p2Qm51WGZOR2hpVkVHNUt4ZTZw?=
 =?utf-8?B?Y2hQMjY4Q0ZvdUU1OTkvQ3lnV3VWdjdKS0QyQ04zRlJKYmVSdHhQOUt5RkpW?=
 =?utf-8?B?S3hrblVrRTZ4eHFWb2lZaWxXZW9iM2EvRmUxb3RNT3R1dERrNXJNVDQzM25K?=
 =?utf-8?B?dlp6dG1laTZqU2Izd2pLazk0UEV6Rmc5aHBPTlZwd01DSjVnZ1AxNDBlUFVO?=
 =?utf-8?Q?/nQK1N8Ij7KfOTWOHZnqLeG3p?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 613cf8f4-9649-473d-5e7a-08dab74a95fa
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 12:06:59.9272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lbIevybWAEt3CE9+zOsTXWL0vsYPH2ZSUGuJjSIq/1aZ8FEmJw3XXyjaqnIIwcN28lN3ikC4uNtphQqEWCUoUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7470

On 25.10.2022 12:13, Luca Fancellu wrote:
> Here is an example to add a new justification in safe.json::
> 
> |{
> |    "version": "1.0",
> |    "content": [
> |        {
> |            "id":"SAF-0-safe",
> |            "analyser": {
> |                "cppcheck": "misra-c2012-20.7",
> |                "coverity": "misra_c_2012_rule_20_7_violation",
> |                "eclair": "MC3R1.R20.7"
> |            },
> |            "name": “R20.7 C macro parameters not used as expression",
> |            "text": "The macro parameters used in this […]"
> |        },
> |        {
> |            "id":”SAF-1-safe",
> |            "analyser": {
> |                "cppcheck": "unreadVariable",
> |                "coverity": "UNUSED_VALUE"
> |            },
> |            "name": “Variable set but not used",
> |            "text": “It is safe because […]"
> |        },
> |        {
> |            "id":”SAF-2-safe",
> |            "analyser": {},
> |            "name": "Sentinel",
> |            "text": ""
> |        }
> |    ]
> |}

Besides the still inconsistent use of double quote forms (as also pointed
out by Stefano) I'd further like to point out that colons still aren't
uniformly followed by a blank (both pointed out at v1 already, and iirc
you agreed to make both aspects consistent).

Jan

