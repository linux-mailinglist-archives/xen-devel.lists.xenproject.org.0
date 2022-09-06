Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2015AF705
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:39:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400162.641827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgHz-0001cO-Il; Tue, 06 Sep 2022 21:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400162.641827; Tue, 06 Sep 2022 21:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgHz-0001V8-8A; Tue, 06 Sep 2022 21:39:23 +0000
Received: by outflank-mailman (input) for mailman id 400162;
 Tue, 06 Sep 2022 21:39:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVgGz-0000Cs-2U
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:38:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2c3449c-2dfe-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 18:12:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR04MB3147.eurprd04.prod.outlook.com (2603:10a6:7:25::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Tue, 6 Sep
 2022 16:12:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 16:12:51 +0000
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
X-Inumbo-ID: c2c3449c-2dfe-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hcuj8jS0s4Dw2Vl69S4meIqgY+w7HxZAzPOzT7vk69vXF4t1uSfR87zorUMyGGnyrsNUX2KMWBHMNqgqpfMIspSrwooxomfck25ehIkBTwb1JprdddhKoCYoA3JC5jNZiZBtKrEs42Ee6OR6X8fKR2ifghGUuqjjGYVuW/Ol42t8bfWhVJYlUkghUADRSDInfQN/8Jm7zmcdG3mmL4cwE9XTCFAX5G2Qbpt/7THM4LWClNVK4IFD8RQ4I25YhigxB4xtAhbObyYt2YdFR1Wb5KjPYaXU9U7zZIhBiitA5tqPZCw38jGVoktBFYCwPPlDQwp0AiMOet2mg7+xnJPENA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxuBNvZHj7YoYsRCVtTqWxYiumkKpcJG7SRauKxVqPQ=;
 b=Nu1afNiAuQQ8r8xzCP5ajjTTz1U+ZKITsxjoxUHb8pwi7J2583gQBUBRKXtjaKEWA+7GgRVIHgshY2S6NlRx+F/pgK1aTf1DsS5lJyKeORIMTx1o+a6qL86MEZtxTA2iH8elSTklfEVzLYZ2rwhqcPjpFQkNiya7Ifkj+tJx72CKSl++0Re/8cuzOly8aVIzV6jX+wLZPAujE+WuMOb6u/eC4+NEBY3xfrN8UMEml58GpMMmKGTTgzZtOxT8QC4niFWRFQbD3fqLEOJmgwVJ5t2A8z1kOAtTAHJA5FfSAAPNfcPMN1JkK8ohcqrtItnG+iCbuLZIEiXT3TevPED9GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxuBNvZHj7YoYsRCVtTqWxYiumkKpcJG7SRauKxVqPQ=;
 b=HuqshmxvqDi70hX/CBm4iVGH+cmDqJWb05eYl5Mgsk6iPEL6gimoEyhnafB5yZBpqOthayd1dlPObjlPqrYicL2x99QhSEvykCaOsTcLbLif55jRvebZ/X2c8przMopGhHgyMXKYU/EykYeU0S5D49NE7V/7H7OG/KruaUxd0Kem5a0m5jV8stnd1BlSgi4PAFGjSvzClNUJfdpwB+Q8XG4pcvZJsV7gdG9zg+9p0IPgVIQ2CbHte5o/igKnijGZzEytoEnlvfhpBKgpyDpLajhcMhc+6M0bagGusw3yuxAT16/AVUG/vO99aPye50Bl2HzQDvcwmI3kFY7hi5Q+rQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8d798929-fe9d-287a-8fc3-74fe44d0afb0@suse.com>
Date: Tue, 6 Sep 2022 18:12:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v6 00/10] Add Xue - console over USB 3 Debug Capability
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.00134d06d2e52e209e9f7778513a27cf0b2a3bd3.1662124370.git-series.marmarek@invisiblethingslab.com>
 <2f7b3495-7963-fa4a-f4c0-5b668238d337@suse.com> <Yxdvy8VTBMT3uMzt@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yxdvy8VTBMT3uMzt@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 397da13b-b9a5-4fef-bae5-08da9022a5c9
X-MS-TrafficTypeDiagnostic: HE1PR04MB3147:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hh9lvYCpC0IqAgpHE5Jjsfi5FKKkmIB5s5D9Vjkp10kT9Fq0YYkgnqGfq+PoWZliOO1jDNgOCY20nmOrqWBAh957W5pYY9FCTY4rzUZjxAo37K+WfIjFuM+WnfM6ktFOAT8C34pYoPFnHB0QNFLtHLcUcZfJYYAwyZe9A6XIDFDrbbSXSRvvdypgJ3kbSp+3HnTAqDB08wLc9ibO3Fej8PfOkWC55ldByG/xZf+R6shM0AgBEoJ6TrMPUCeIrUQSpJbbBeOBQhlGGdRWM4f1IDQydiv88aGU21Ro3ILATXu4E/g3uc5V5yNFe2x6+68pK2XPXDJttbnMKIDlPi89HrRpB1uQpUtkLiO0UOfgQuP5OvKU+ZUKe80DiIU+RD7JM1ZXIHUTC+MsPRTXV+w2QgFj2cFvfQkGz7Xl1kMSpzlE94bqhGozuhjh4ZKZY+xbdYUYlYU5fVxYXtoke8c0gVPtPAVM0OCL9WAAcO7uNPFJpEUH4PwFtogU0s+vRN0aVVyV0f9FZ6Zf8I25u3lkVvG+2v9tL4JYw/0CM4oFnr4+4Ke+bNM21my60OXfG0Fdm6NVFWhxVQ/X+2Rawnq/FCrIeBhc7hrBiXdXBwRfMmrCmnPsk/XSwAIyHdv6q/3FjSmMY/k1WlUeGjOI6ABl7wIIoIQpvBpdwPmf5d27Toeud4h+tW3hSPYEnW5mmVq1otKI3mOJmk3kSIWAAZBWxY0w43LmMRlGK3C/ikVDhOoOmZCO9f9Ww36DDbSPvFry/A6XVQa3W5HwPWwcA7DVZn6x2hgBJR6Gdc6BqZEg9cY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(39860400002)(136003)(346002)(396003)(31686004)(2906002)(186003)(8936002)(4326008)(5660300002)(66946007)(8676002)(66476007)(66556008)(36756003)(316002)(7416002)(6916009)(54906003)(6486002)(6666004)(6506007)(41300700001)(26005)(53546011)(86362001)(31696002)(6512007)(38100700002)(2616005)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekdIT3Yza212U2RtR1lEbFFiM2NkNG9IQnRESFQybDRNOWhVdWI1YWt2bEtw?=
 =?utf-8?B?TEd1N0RZLzljKytHN0l2c3M3SU5YbUMyU3RHTmF5REtPcUxaNWFwMmRKSEpZ?=
 =?utf-8?B?U21IS3JkS2JpMWNYK04rLzJtZUNqaGEyZDdqNURZWms4RW5sT3A3VUZoN3FP?=
 =?utf-8?B?K1BOV2dyYUI4ZmVPSFVUNjZoclZ2ZXBHZEJoV29VNGllbW9pWnZrTUl2NmlS?=
 =?utf-8?B?cDlQMjVFL3kyWndwMEhmbWUzVFpvVkVUdFJhM3E1bVFBNlRUYzRyeU96eUZR?=
 =?utf-8?B?WGpyWndTTkxvSms5Y1pydGxkNUZUYVlad1pxN0lpYTFPa2FnQkpGYWRHNThs?=
 =?utf-8?B?a3AzRU9CaGMvK0tBOTVNbGV3OUVENEdCZGhEdWMweDV3ejRSZXZoYml0K0wr?=
 =?utf-8?B?R2lUdEFwNjFWa2JGTmYxQVA4dEFkQTZYQ2pLQ3MyN2t0OUJBSXJ0aXR4aUJp?=
 =?utf-8?B?alRORHlCSEZ0dFVrWXVLRXhsWnNFbXc0WlpxNFcycGM2SE1CTFdIRFhodFpW?=
 =?utf-8?B?cnkwMkpIVytuQXp6TG9hUjFUTVE5blMwblBpTzhzWmRGNmV4ZG14WnlxUHZB?=
 =?utf-8?B?R1A2K2JaVTVHbnpNVkN6YXYzRjhFYVoydWNCSVQ0eERtV1U3L3drV2s4TDU0?=
 =?utf-8?B?SjJpRWFrQzV6My9mN2NvWXZ6UUE5d3RqNnZCOXh3M2x3SmdmNVVJdkJPc2Fm?=
 =?utf-8?B?OWdJWjVqQk5UM0NKWnQzeVZGK25Nb3RidzVpUUhvc3FiTFNrSUxkTm9PQ2ww?=
 =?utf-8?B?UTVMeDFzSFkrVDZmQlJWYlBEZEtVaklEZnRibWZ1ZXZ2NkxLb3hhK0JCVFZM?=
 =?utf-8?B?a1VFZHMxU1g3Wmo0WjFhYTF1WUZ6eWc4WE42T01SNGVpQU9WRWYxM2swaU1I?=
 =?utf-8?B?ZGYraVh3TFF2d216UlVyRDBMa1dTOFNQTmI1NEM1U3hDaklDS2tGTjFLWDYr?=
 =?utf-8?B?ejAvY25wZ0NQRStBczZrOTFxczczajhSV2lIaldIL1Q2bldibFNMaElEckty?=
 =?utf-8?B?amNYSnBjMzVHNjZvdUNXREt2MWJRQWwxQXExMG01SDNPdnpTSERWb29PVHhj?=
 =?utf-8?B?STlsaVlNUXlvMnN5d1FqdURmczNCME5hNVZHNU1MN0FUU0FQYzVuSlNWY01Y?=
 =?utf-8?B?dnJHTFBVWFBURWtkYlBtdHVFcUU5dVFTaW1aNEkxdmlYZXd0QTdndW5CREFQ?=
 =?utf-8?B?NVdWQ2NLQ0lvVjdLUzBVT2xYNkdzV2hRL1FvYkg5MDZHY1p5YXlyRjhsYmxN?=
 =?utf-8?B?YzZMUHdsaWdMUXFXYTFoYUhIYjlmYmh5NHpTa0VTOWh5STdEVEZFcDA5RUk5?=
 =?utf-8?B?UXJ0MHdlS29xS2x1Zkd1KzU0SE1ZYUcrRGxyN2h5YlNZLzFUczRDK0RONExl?=
 =?utf-8?B?cTZnWlBselBNTzlXTnNBaXpVdFJqeUdQUFUxaUxsdzd3OG1PZ3c5RHNqTDYw?=
 =?utf-8?B?dXNmdTI1czJlZ3VqMDYxL25JRklVR29UbUVZYTRaeUw3WnhOM3l1MTlUMFd3?=
 =?utf-8?B?ckNVakxocTFBVC96NzlHLzB2ZU5wRGhvd1ZKMnlSTWQ3dDM0emVQME9uMnlt?=
 =?utf-8?B?eEZEM2xFeXlpcEhCSEhNaWMzRENjMVNLR1dES1BIVnFUa0FpK0psQVlmUlVy?=
 =?utf-8?B?R3c0TUZCc1ZPMkdNNklDbldUSUhuUnRLaEdCaGdESUVlV1pXc2ovb0dFc0VG?=
 =?utf-8?B?bHEwQWUydzU3L0oyOEtPOEhhc1VFTFM5Q0hlQmlWWUdKQXdEOHM3RTE5b1hE?=
 =?utf-8?B?NW9MeXZ1MlhrNHI3LzJrc2E4NllDb25DNmVVOXpQZDZNV0hxei85by9JTW9s?=
 =?utf-8?B?KzlHWkFySUdheThGKy9LUEE3WU5JcEJZSnNhRjNlVDRCVWdXTC9zbUJJdmRL?=
 =?utf-8?B?Rk5JR1UxRXgzTnRGenlPR1NwNEhhZzRSYW5EVTlHYW9PbjFRTU1pSEthTjFR?=
 =?utf-8?B?bXkyckgrRzlSK3lTTHpiWXNjY3NXYitkNmpmQ1ZxZzFnUlV0RElHN0luNk1I?=
 =?utf-8?B?cDBjMmxRVWc0MTlkbG51bXoreWIwa3ZjNFhpTm1oWitNSityV2xIM0FiTzln?=
 =?utf-8?B?RlhHZjkvVkRMRmdnMmF2NFpXb3R6K2xZTC9sSEw0SHdqTjJVcjA2dUVTQjFS?=
 =?utf-8?Q?aX9CUYjvmMYFj02nkticWCbDy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 397da13b-b9a5-4fef-bae5-08da9022a5c9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 16:12:51.2657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DB6dAJ5wA66D6fU5PgEOW+zjX/2y+xOxJsIQpUHjCKBxf7ltU/B7D4SS5hvy3bbNnilovFiiZ+fx2UjvVsyurg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3147

On 06.09.2022 18:05, Marek Marczykowski-Górecki wrote:
> On Tue, Sep 06, 2022 at 05:11:24PM +0200, Jan Beulich wrote:
>> On 02.09.2022 15:17, Marek Marczykowski-Górecki wrote:
>>> Marek Marczykowski-Górecki (10):
>>>   drivers/char: allow using both dbgp=xhci and dbgp=ehci
>>>   console: support multiple serial console simultaneously
>>>   IOMMU: add common API for device reserved memory
>>>   IOMMU/VT-d: wire common device reserved memory API
>>>   IOMMU/AMD: wire common device reserved memory API
>>>   drivers/char: mark DMA buffers as reserved for the XHCI
>>>   drivers/char: add RX support to the XHCI driver
>>>   drivers/char: allow driving the rest of XHCI by a domain while Xen uses DbC
>>>   drivers/char: fix handling cable re-plug in XHCI console driver
>>>   drivers/char: use smp barriers in xhci driver
>>
>> I wonder in how far it would be possible to commit parts of this series.
>> Aiui patches 3-6 belong together (lacking a suitable ack on 4), but are
>> independent of 1 and 2. What I can't really tell is whether 7-9 are
>> independent of 1-6 and could hence go in.
> 
> 7 share some context with at least patches 1 and 8 (but no functional
> dependency), and 9 modifies what 7 adds. But otherwise 7-9 should be
> independent of 2-6.

Well, if 7-9 don't easily apply on their own, then I guess I'll rather
not make an attempt. You may want to consider moving those ahead in v7.

Jan

