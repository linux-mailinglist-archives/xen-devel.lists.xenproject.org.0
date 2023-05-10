Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F17F36FDFEE
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 16:21:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532843.829161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwkgD-0004k1-F3; Wed, 10 May 2023 14:20:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532843.829161; Wed, 10 May 2023 14:20:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwkgD-0004iJ-AM; Wed, 10 May 2023 14:20:33 +0000
Received: by outflank-mailman (input) for mailman id 532843;
 Wed, 10 May 2023 14:20:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WIjz=A7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pwkgA-0004iD-V8
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 14:20:31 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1071a95-ef3d-11ed-b229-6b7b168915f2;
 Wed, 10 May 2023 16:20:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7649.eurprd04.prod.outlook.com (2603:10a6:20b:2d8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.19; Wed, 10 May
 2023 14:20:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 14:19:59 +0000
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
X-Inumbo-ID: d1071a95-ef3d-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qls2oOEbzLEbNw4KI3CSPI9W7xgTGuOdjHY3SK4cNZ/oM5pjFofyYmGEWDznNad2BYuhHhK9kX5516JGeHCkRCfKyAe0WZZTd/6N6exl6i5z1TmpwG5lurJpYGRzauoKzbT8vRcBHhljrXJXv0a+HDYzRQchTNlgxkCdwzmBPHhGxaGbgg+5YI7cwmIL5iv1DPqrqSgzrPkqsKbJt4o/Loc1DW93ZVsVmN++1Ip6gk6a/DLWAW05jmNEuH3T4N0TZ6V/TpsbLp2ge5RCWe9KWebyxlGIwEsSsvvBZWV9oMEA5gY6GS6sbMLESIL13xZpP6QjecnW7hBvvKQW6hGqPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDq3oeqi/3d0JA7vdfbc7ZJ6gyT24syYN1sRWt9jqR4=;
 b=DfLw785ExFefsQE58gaqjFJm31V+GxvZWkzGWfAEy7SUBW8p7bRXIrqUqb9/sDpGBoGvoUHa/ni5qamzlMDlc3S/1KdF3A28k3ctue+Swoi9oN7A4KNaJQ9ujCFGLaBURXH+S6NOlfVM78Xkn8tlI+/63ah4cX77E4n75V/n4qTjwJCDE2u63hnZcTsxwII/rbT3KVHKUYchgZ5TcreQOZ1RAhcEz8I3mNvlZGmfhoTJjdrIoPHSW6ntij/HtR/tVAIKU4K2uzUk4HCXY6arxuxkkYbgQiuZGaQlLBpzv2ZdcoBkCCWivoQOiQoDgbDgpzvGFuJO21n2MXCyw+eZ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDq3oeqi/3d0JA7vdfbc7ZJ6gyT24syYN1sRWt9jqR4=;
 b=biaWWzftxR8kajnJTdBV74zWep2dsDDU0qXEDYlUXZETT5OF6Orrso8lf0iKlHkv9Ae5vmSuWFDnb1HGYFxDPlVjXovXwQj8B+fjW/ps2UTt5MSDRynUcMGE6tgU15CJy5Juf6GQ6nKKk1OQGI0Myhh4Bmx4XkOeFEaZ8JxWre5Twz5FiFD52IQb9a4nODOTtvWmOwH6z/hWw6ul8p6GciSpgTR6YjftawCNIyIUrO0rSLa1D2CPuAuTy/QyIAuylP8+WxU8LP9Cc2IxMV/Oh/EJHwxt4msxcpVZKCrCOssnBVxWAP56HkC45K1kxpjd/uaOirOt/XzwmYfW1ZLPnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e9dd85d3-0e97-cb96-561e-75b23386a7a3@suse.com>
Date: Wed, 10 May 2023 16:19:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 04/14 RESEND] cpufreq: Add Hardware P-State (HWP)
 driver
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230501193034.88575-1-jandryuk@gmail.com>
 <20230501193034.88575-5-jandryuk@gmail.com>
 <43c519f7-577d-f657-a4b1-1a31bf7f093a@suse.com>
 <CAKf6xpuzk6vLjbNAHzEmVpq8sDAO8O-cRFVStQxNqyD5ERr+Yg@mail.gmail.com>
 <7921d24d-7d4d-8829-44bf-b8c2ecd001c8@suse.com>
 <CAKf6xpt0n2GO1PuqeaiWi6iOoeBt0ULoKJ4xgeiTZo2Rh67kVg@mail.gmail.com>
 <4bf60ae8-7757-7440-1a4c-95260c0f0578@suse.com>
 <CAKf6xpuZRgQSe7=ST1sa=_vNOvDeC+bnDG4deb9m=A2M5+X2Eg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xpuZRgQSe7=ST1sa=_vNOvDeC+bnDG4deb9m=A2M5+X2Eg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b927391-1d1b-4204-2646-08db5161a349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hCRmmxtZsedar4jSBpXAQvZxXGx/LELb2C6TZHzBfzkZpbeKbx5Ab+tx2Am5f+YjGQ2/JBf9/nYjeyRFRf8e55Mqoz+kkrrhRhqlFgryxpMXOBsBEOlpxBN8vbGuObhKY5JgMOeBPBB/kpQltIAD3OJLF4dtYgmmvvd3WSNVufPiNfrrjwVEQhmIF6d1tSBqs1EfHwBwmEDXyJoiOhf58L/CF6urTirWYW3pKsozmk9MJ5SMSc5GU8En2NQYk8i50R9qCLnlHAz3XK8s8Zr+whuebLvVjhpvgPEKOzqa3IQVcYFSYMURMwX0oo5FZruE2sIA0v89yiN7VCbdev5IT25qpmfXvQVYoynrdsCCh2Jh0Ci8fmTaXLmwRUWqdWB2rTgCv4T26TtF8xi+uux1oy7ilUgyDgN77ZdzgjobYnMegEBBLjXCABl7a06xNj/VBswO5DUIy3VEh/8rnpwU63lhSK4TS63xb3qNuaB0TEgw8aTb0RrOsqVhu1/5n52VZuYGB3wtiZUULv6p8hlxF+1JMYveNSDTyMDaCLpabKQtWcb60IU1Et1qjj4g9Zn8ShGReTCY7epgH1WQKO+/Yi9EN37Q2RTTHlBdq+8mPlEr3LAHJ3JZxnor3BSyt0xAsr5hHNup6V2RMTziX8QAew==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(396003)(376002)(346002)(366004)(451199021)(31686004)(38100700002)(36756003)(86362001)(31696002)(41300700001)(4326008)(6916009)(316002)(8936002)(8676002)(26005)(186003)(53546011)(6506007)(6512007)(5660300002)(2616005)(2906002)(66556008)(66476007)(66946007)(478600001)(54906003)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzJMTlQyNExzY2FURHV6VjAyd2pEb3NPQ09kZWlYQ2ZaaEF0bFBQMll3eEds?=
 =?utf-8?B?VHpTNjFQbGx1WktTNVdjR1pST1VsbGhPWnNEQnJTa2dqam5qdHZUU2ViNVlC?=
 =?utf-8?B?Z2FrcEF1c0g0YXJ2SHdFOWVVbnhRVVYxY014cUxRQUJTeTdOMzZIWlpFeTRS?=
 =?utf-8?B?OG5lSGRBM1A3Z0pFTVZwckxpc0I0M01UQUJnRTR2eE1wWExKSzU5VlV1bzhX?=
 =?utf-8?B?WUFEcFA5bGhSK2pVeG9OMjJWREdVeVBYeStEbHN6eG0rQVJSWFVKd1Q2SVdr?=
 =?utf-8?B?TUh0QzdKaXEwbkRDZjFIMC82WURQa3NXNWEzdXlidTRSVGpqRk1wSm8zSWIr?=
 =?utf-8?B?TkRROFNWUk9DY3FjRDFVK0xCRkplbFd4NzBxRHppc2hSVVE0YVZnQUYwVEs3?=
 =?utf-8?B?OVVBYU5pVGJheVRoeVNyamdHMjlwYkQ5KzJsSVQwTHBWTGR4SDU4M0pNUmhM?=
 =?utf-8?B?VDBxRFFjRHpBS0NYT1I2M29RVHcrcjk2YTJpdDltVzdLQS84eUhXMjV3aXFo?=
 =?utf-8?B?MlUvb0YxSzdoKzA4UFFSR1hnQjdaOXVTVUVPbTVXR3ZsTzhuNVhQdnZ2dno3?=
 =?utf-8?B?UWpxRG1oT21wRTh2S3dzS3ZDY3BQMmR2ODMvbHg0d0FLNXBiNUhuUk81T0U3?=
 =?utf-8?B?ZGQ0K3laYWJ4Mzdqdm9iY0Y3NVl2Q2swS05ZYmhsbEVIQXErZldhNCtFSDdk?=
 =?utf-8?B?NGprZTh0TUdFMGNUQzdMeVp1ZWQwc2hpVEpkaEw3TUJFSlQ1ang4aUE1YW5o?=
 =?utf-8?B?YzFnemdSU2N3bU9HaFZFNjlQbTdURERubmtWcmMrUnhhbzlTYXZwaVFLeHdZ?=
 =?utf-8?B?N0U2U3d0OUtqN1JRYUFWY0lBWDFvRElkaDYzamVYTG9kWERISU1xWit2ZWVx?=
 =?utf-8?B?S2libTl2ekptYXJIa2RzUWFqdFRBUVBIL0FPOTl0NE9Uay9JL1ZDSWt3TDRR?=
 =?utf-8?B?d0R0YnpoZFZWMjdJVk90cm1NZXJzc2hDWWRBRmhYTDFVZ0phczNDRjZ1K2xw?=
 =?utf-8?B?R3FqSFhzU1FaYlVyOUIzaUhSaWxGUmxRY2s0aHozNFJTQjhjY1hMZEtIK3B3?=
 =?utf-8?B?QUo0QXF1akxEVXZNczVMeU5ZTEhoclBtTXRFV0xsOEtnL252QzU3RU9EemJV?=
 =?utf-8?B?VGs3UFNUODVXa1k5ajYwMUp5bmZxZXlzblJHOFMrckFvK05pSFRTTi9mZ3BK?=
 =?utf-8?B?RzYwbGpqOHhYT2ZSbFlPdlA0cEpNWm9paDQxK2RIcWZJTWthcXR6ZGpYc0dl?=
 =?utf-8?B?TTJvZEthM1NQdFY0cWhTRFdIWG1WblNzbGcvcEE1WlE2dzRlU1NMVHVrOWw3?=
 =?utf-8?B?OFJQUkhYcFRwdnZxWlRVelVXODc1RnI5YkhpZCs4dTNNOHVIWlFuOXpQRFNx?=
 =?utf-8?B?TlpSRHN5OWFRbHVOdlZGZ1ZONk9OSkF3SmdSUEZobnhPNzN5S3pkak54NmdN?=
 =?utf-8?B?OVBLWkpvQjR3b2xXR1hHYW9lM3dPMk41SVoxdDg1TUNqaXFIUlFsVDBwV2Jp?=
 =?utf-8?B?QklqckU1a0lvSTlBSUdzYzBhcEd0SjljQ1FCNG5jMU5QMFhHMFpFZXRLUmg3?=
 =?utf-8?B?emVobTFDNC9CazdNUU5TV2JBb1loZEVPdklYREtRR0htQkQzOWZCVnhIeG4z?=
 =?utf-8?B?bmJnUjczSUx0Qjg1R0hoMlZ1Y2h5Umc2M1ppSVpIVmtaMVRvR3Q5c3ZLeVpw?=
 =?utf-8?B?VGx2VElISXZndnlTQ1lSSldCRjB0ODVRUjNBV1hodVg0M2hnakdSVjRHaGxW?=
 =?utf-8?B?dklnSWMrbTVBNXFGUzJZcjlpSC9rZ1diOURKMG1FRmpsVE9aVWdrN05Cd0Fw?=
 =?utf-8?B?cnpQc1ZSMm5QWHJpcThHaHZjOUhlajl1bkd2UWZPU0R1azd5SXdPTTNOZmFU?=
 =?utf-8?B?Sk9GK0J4UlpyNUdMUExJWmFzeElnU0hRRDJhRk5hRkdoUjBKSklvYXFaaUdj?=
 =?utf-8?B?VlNaSm5mV1IwUTBYaDBTa1YzNXRYak5MNThWNWdYVDB4cHVsUnFVZjJ0b0dZ?=
 =?utf-8?B?UXJhYlJpcmNQZEhxbmViWFdTeFh2UTZ3UStFM2xiY3N3Y0I2SzQ3a1dPMjVI?=
 =?utf-8?B?NDZNTFFyZnhDRkFRbHlpWVpHY3lGd1RuN2VUanlHbHJSY0l1WkdsMUJ3ZU9w?=
 =?utf-8?Q?JgodWfkPYbmtyR0NDT5DERyRx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b927391-1d1b-4204-2646-08db5161a349
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 14:19:59.8441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/i0PgAZGGqu8NlOD6RADqluGrJhKPNdl579sHbGCqqVvl15rU9w63g9W7DuvlIJd0EgXva9yYaDcX6oVqo6Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7649

On 10.05.2023 15:54, Jason Andryuk wrote:
> On Mon, May 8, 2023 at 2:33 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 05.05.2023 17:35, Jason Andryuk wrote:
>>> On Fri, May 5, 2023 at 3:01 AM Jan Beulich <jbeulich@suse.com> wrote:
>>> The other issue is that if you select "hwp" as the governor, but HWP
>>> hardware support is not available, then hwp_available() needs to reset
>>> the governor back to the default.  This feels like a layering
>>> violation.
>>
>> Layering violation - yes. But why would the governor need resetting in
>> this case? If HWP was asked for but isn't available, I don't think any
>> other cpufreq handling (and hence governor) should be put in place.
>> And turning off cpufreq altogether (if necessary in the first place)
>> wouldn't, to me, feel as much like a layering violation.
> 
> My goal was for Xen to use HWP if available and fallback to the acpi
> cpufreq driver if not.  That to me seems more user-friendly than
> disabling cpufreq.
> 
>             if ( hwp_available() )
>                 ret = hwp_register_driver();
>             else
>                 ret = cpufreq_register_driver(&acpi_cpufreq_driver);

That's fine as a (future) default, but for now using hwp requires a
command line option, and if that option says "hwp" then it ought to
be hwp imo.

> If we are setting cpufreq_opt_governor to enter hwp_available(), but
> then HWP isn't available, it seems to me that we need to reset
> cpufreq_opt_governor when exiting hwp_available() false.

This may be necessary in the future, but shouldn't be necessary right
now. It's not entirely clear to me how that future is going to look
like, command line option wise.

Jan

