Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6152B6CD7B9
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 12:32:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516172.799870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phT6T-0004AY-Du; Wed, 29 Mar 2023 10:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516172.799870; Wed, 29 Mar 2023 10:32:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phT6T-00047a-B5; Wed, 29 Mar 2023 10:32:29 +0000
Received: by outflank-mailman (input) for mailman id 516172;
 Wed, 29 Mar 2023 10:32:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phT6R-00047U-Av
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 10:32:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20620.outbound.protection.outlook.com
 [2a01:111:f400:7d00::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff7d06ff-ce1c-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 12:32:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB10068.eurprd04.prod.outlook.com (2603:10a6:10:4c9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Wed, 29 Mar
 2023 10:32:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 10:32:24 +0000
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
X-Inumbo-ID: ff7d06ff-ce1c-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDmvkIPN+znX7101xEcmEx3LRZAFxBYtK8j1n5beGKVxHJaW60TqcdNjOHQx5WI1E37PKYVVqSFEDwq5d8cCtukxL2deyUqbu0jmAxtzGK2uHEyG1F7s1uRwbfO3SjhICgGefnuw070lQkfKO4agXKIE1qODz8u0amdo9EGVmGNCo+RmfoXJL2KP719z6saa2zRUlyieTlSwsFuQKlV+FU/ANZoM0NUOshlLjt0C4BBv1mcQi3cHht6krq/+vN5VdpxY4oBvfaQVWpPh2H0eHzPnVD0qhfGz7ec+eTlyg94xjlPmvU35vjufL+MvTkGNdllwxkVSLejIQfs+rRJCQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2JcidsXNALf/2xzil5z70T3tCERle1BA3F2yliYlJg=;
 b=I/9mfhfHnhtB+ASZIWLflz3XDD9wR0rZrTK1LELMWTYxzWTHHFQZtHK6wo7HnwJCocw9D5/mDOCR+kEJa6uJvE8LC+jqh94wymwlEXEN4Y5FAzjD5+Op3cDvxICFlQmwpX7PennCDT2qFc4ql5zP/spcTSdbsLaLK0AoOxNpP4eJDzju2MsDnkGUXIhdkb/sjz8s6rfNGJKI6iZI6zltRzC8JY0QxF1tNzI29KEmuvEfr8gz+h6GOgpFgKu04dtussH7540PLgRrQyt1pvHtACOTLtOmJsle/fFPjGf4Xc1DEKNLVlkyPgQqM/zw+J420SptZqB+SX23YQkfUm4AaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2JcidsXNALf/2xzil5z70T3tCERle1BA3F2yliYlJg=;
 b=Ga1sHxGdR0dwEL7+8gfbRBlcsdI/RvvipUx7VDJUgf/n5pPtWnM6Sb8IljwRyhnTjhCANQ/WsfVdtUfjRLYn5ZK3kFUEcaKQySFYD6WjgSbQuvRL0vdoch+/8DuMClZ3xrIiAWBn8Axl+N+fSgWg209qoBUjqzJPZApEf2bZzGT0m+hHiErL13OLwK8YIe9WnObVpnjDvssgAHOXaz0u3vvh2WPT0fi6+0CGzQ7t7zCk56Mi3d9OEjZWVjTh/z+f2xQHEJSW1wQF2KeMncrczPYMa7mWXmHUL6KARCmDK5ju9kV3yuATn0Mufeafp3XNX22b1lq07lc/zETARyC7ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6736a614-258b-0d5e-9c78-e25fa6b8a932@suse.com>
Date: Wed, 29 Mar 2023 12:32:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 02/12] xen/arm: add SVE vector length field to the
 domain
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230327105944.1360856-1-luca.fancellu@arm.com>
 <20230327105944.1360856-3-luca.fancellu@arm.com>
 <71f3e78a-aa70-a12f-8380-ab8806cefd39@suse.com>
 <D3910D5E-BA1E-40AB-B960-CF8806F0D9E6@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <D3910D5E-BA1E-40AB-B960-CF8806F0D9E6@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB10068:EE_
X-MS-Office365-Filtering-Correlation-Id: 244d33db-8967-4c08-39d0-08db3040e2c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mAptcGZj20x2D9bo+IY5a08XOtbxXR4MeWArT2KPhtpFAQx9t3w0ULVUISYjetjN+v62tXLqiH0/6i/68WXGJZdDnqH3t3S9PdqCC61/U8o+0Uinigjw8piyIh/dWnmQMfKLldHnoQQgYmC/+GSfqT5GK1cbU6fp5Xp/fcNnflP0btahXPI+XEWyoQlJZp2fQkJf6oD6H4x5F2Fo7YP0o255q+G911LCCGAzFQ/ih092ruYyaZaSDWvjsdnyx8pfQZRY26oL1g867Xeq+WFPzOunIeO/wrLqUWWpNqFmUSXJfEM8vlEEVjc0tuNyYd06dh9DszSAgv1G2+t0O9KgMIW8QCUGYwOOy9WL/fB8cHiIx1vXJczvX4IFUPx8Wi7cHU7OFAu9EDMML4v2Jm3Ly+IWYZa0zv4ZmB2OQGvs/XrkPdCS8xI7dHZd2DZ5KMTJRb6CD5Tz7mW88czHVO167SJcgZxwu3Kn5cixGMvEqqajvTbgI5ZgVjuM283VzzsChpOonqJPOmWoFFGDWTdu45/BB+7NCde6qnUMAGXbzxkAH+kP1poiHGb/s+f08ZuuIDqgvbGVoG3So9I/Dexr8a9RINE0Akc/NATW6GB0Y4LWc7eOM5e21PFTNPqn/SkLr+9a/XJF6X7AkhTou806sw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199021)(53546011)(6512007)(6506007)(6486002)(26005)(6916009)(31686004)(54906003)(316002)(478600001)(186003)(83380400001)(66946007)(8676002)(2616005)(66556008)(41300700001)(8936002)(5660300002)(4326008)(7416002)(2906002)(38100700002)(66476007)(86362001)(31696002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEwxMzZkS3JFTm5XMU96K1pWV1hnL0lUNi9kSEdsNUpXcGUwSS9CekNpdlBt?=
 =?utf-8?B?VGdpTC9obTlTT3FLSTVBYldVVHd3T25oa2lHTFRtaDE4T1pseE5HdkJWRDFv?=
 =?utf-8?B?bzNXOUlmLzEwc2RZS3RqYU5TTnpFK0hQdzEwcFNjRlF5c1RSdW9vYWY4Vmhq?=
 =?utf-8?B?M0Qyc3JuZFMxZitPQUZVaXNmZlVXeEFzcHoxdHNGTFhjd2hudmZ4S1F1eW5U?=
 =?utf-8?B?ME5vc25Cb1JrQjdJN2xOOHdVeml3ekxYam5WQmQyS2dTTEhnTmRLVW1nZ0tF?=
 =?utf-8?B?OEp2Zk54LzhuRlJuSVUyOFdPZ0F6azNuZmNWcExlTEtIbytxZUc3SkRoeng2?=
 =?utf-8?B?anBrczNrNnR1cmxJckJqMFBVTVZjalFuc01QUW9XZTBFOXRxdTZZeHRTdkVj?=
 =?utf-8?B?OEdPNmkrWE54L0Y5TWg1THNHbXJFbHR2bWxSNngxem5XRytqM1NFbTJsWUQ0?=
 =?utf-8?B?bWhQNG9vOC8zamhnb2I1MEJ5aUJDSFhqYTlVLzhaNkx4MUtsT2ExWSs3Mjhl?=
 =?utf-8?B?Tmh6N254MmVVbEtwS0FMRHVYeXI0VitJN2cwM2wxR0RhNHgyOUs1TVJkUzB0?=
 =?utf-8?B?dEF3TTI4TDE4TWJuRVBrdnBxRlBhdUhwQUdGcEdEMWFSekpIUEhGUUhpeG1V?=
 =?utf-8?B?aC9Mb3oyOXQ2UURETVdyMkF0c2pYZDExMkxQdmpCVjh2SEtEN1JhTmY5eFdX?=
 =?utf-8?B?RmgweWMyb2RhUDJlVUhEOG0zTlVLVkhCMlQyZVArQlE4RGhpaDE0ZG5kdysr?=
 =?utf-8?B?TC94MjZiNFRYTGY0aGJ2MmxCMjhPZlpKZUx0Y0crUkZ3YUtScTJ1bVdkSlJn?=
 =?utf-8?B?R0tCZlYzbk56ZkJXdUJmRUlnbnprV3pVZWlqOXN3K3R6SHlMM2dObldTOUpX?=
 =?utf-8?B?R1lWMkFJNXVLZHhmZ0JzeG1vTFd4Y1JvNDFac0xTV0YxaWJXRGJHbUJSL0tr?=
 =?utf-8?B?SFZsdC9ENUVPR3liYU1LcUp1N1dvcGVqWC9ETGhrWksyRW1pdHZxd3lsS2JE?=
 =?utf-8?B?WUpiQkl0c0EyREw1bzltSng1LzZzQ2o2aVhVU1ByNU05NXRqL294UnJYSDQz?=
 =?utf-8?B?Z0VBWi8wZWMrWTRaU0JyVXdIQkdiRy8xMmxzRTcyQ3lvcUNramw4Z1BSeEl2?=
 =?utf-8?B?NUFYYnRBZTAvU0JFUDdNQUNsNWhJTU1sVWttSGFGUkhZUXJLYUlOZFNOaDVI?=
 =?utf-8?B?MXkvaFVSTy8zRzAyRTI4RlltQnlpQ2grSGczQzFjZzN6bFl3S1NVR3FOS2FC?=
 =?utf-8?B?VStiaDJ2VmJTT3VXTkprUVpDZ1NwU2I1TTEzZG9hZnJzVU9oQjA5ZW1QWG4r?=
 =?utf-8?B?QW9qUW13NWZZT253cHpCZU5OYkppaVIyVVRJK3FDTjZWYjJ1UkFZRFFzUzhw?=
 =?utf-8?B?RUg2c21WUmdJUTRuZmhjUzVsU3RkbCtXZS9FR2pHR1lFZzRkNDA2OERocUdz?=
 =?utf-8?B?RzFmY1d2TVJvV3NVeFJjSDBobjZPOHozcW5JVi92U0JsTk12ZmtQTnFUL0Qy?=
 =?utf-8?B?aS90c1BQREJFMFZ1WnNmUFFXRWJsQ2pzYzY3SmRHT2RDK1hiUkorV3Q3bmJJ?=
 =?utf-8?B?aHI2bXdzVURXd2tScUozc2pHaDdaS0p0WlJZVmxlbEZJanFDVnM5ekRrWjY2?=
 =?utf-8?B?Ty9PaW5yR3NML3JtdEpnUUt0bzFyWGpDRHBaUk5ReWZqWjQyY05nSUJNKytT?=
 =?utf-8?B?RHF5VjdmWlBCNUZnNHRNdUNnOGVnaWlOZ3ZhaWNPVlZIWkkzZDI0TzF2Q2NO?=
 =?utf-8?B?Zk50M2h0aFM5RzAxRWo3RlZTS3lWajJ5dCtCbFladk1SMHB6ZnQwVm1MZlhu?=
 =?utf-8?B?RlJnbUoxTGtQRDFjZE5rR0txUkVqRkVIelBRSld1NWRqdnU5dEh4bGtnTjdv?=
 =?utf-8?B?TUtva2JwVG5qaFdJRm02V0Z5UG8rREF4QjR3dWhzYnZtWnA0aFFCODUrSnA2?=
 =?utf-8?B?MWs0aThjWU1YdHVEMDRkbGY0L1lpcEtyL0JLRXY2ZS91TWFNQ0pjMmNiNG4z?=
 =?utf-8?B?SUE5clFLNzdoQVVoK2JLZFIrL2JKTnY3YVNyYkJ5bFhSdWZVYzVoSXRhcFZp?=
 =?utf-8?B?TTJTejNlNjRacThpNlNCN3FRS1d3M25SYXpzWk9hQWRMcGw0WldzSUNIaE44?=
 =?utf-8?Q?IlI78XXbufx7iJieNOqT+ovWv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 244d33db-8967-4c08-39d0-08db3040e2c3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 10:32:24.4987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B16NnsVy+QYt5L+Gc4b6FY6SVjal76CQlH26Xxvmkr8qAhrYsaTeruOsnH5fyg6hxft0GFejuBhoKU3Vs6bn7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10068

On 29.03.2023 12:01, Luca Fancellu wrote:
>> On 28 Mar 2023, at 10:36, Jan Beulich <jbeulich@suse.com> wrote:
>> Yet another question is whether both range checks (against
>> SVE_VL_MAX_BITS and zcr_max_bits) are actually necessary / useful.
>> Iirc 2048 is a hard upper bound, so zcr_max_bits being higher than
>> that value should likely lead to not using SVE at all (if it doesn't
>> already; didn't check).
> 
> I think the check sve_vl_bits > zcr_max_bits is needed because from 
> sve_vl_bits = sve_decode_vl(config->arch.sve_vl); I can get values above the
> maximum supported bits (zcr_max_bits), later on I will use the struct arch_domain
> field sve_vl to compute the size of the registers to be saved/restore
> 
> Is there something I’ve missed from your comment?

Hmm, I realize my earlier response may have been ambiguous: I didn't
mean to question the presence of both checks individually. I merely
meant to question whether in addition to the zcr_max_bits check you
really also need the SVE_VL_MAX_BITS one.

Jan

