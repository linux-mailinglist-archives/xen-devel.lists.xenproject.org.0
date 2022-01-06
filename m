Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1788D486731
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 17:01:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254140.435703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5VCM-0000ez-QK; Thu, 06 Jan 2022 16:01:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254140.435703; Thu, 06 Jan 2022 16:01:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5VCM-0000cv-Mv; Thu, 06 Jan 2022 16:01:06 +0000
Received: by outflank-mailman (input) for mailman id 254140;
 Thu, 06 Jan 2022 16:01:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a8QS=RW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n5VCL-0000cp-Vb
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 16:01:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9c8117c-6f09-11ec-81c0-a30af7de8005;
 Thu, 06 Jan 2022 17:01:04 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-elB51hxaMmubEzz77i6TPw-1; Thu, 06 Jan 2022 17:01:03 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4190.eurprd04.prod.outlook.com (2603:10a6:803:4b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 6 Jan
 2022 16:01:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.017; Thu, 6 Jan 2022
 16:01:01 +0000
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
X-Inumbo-ID: d9c8117c-6f09-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641484864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tKhCCh0AFmvjkEUf+eM5tBqk8NLrqZ5CSvwor2o6/rM=;
	b=OKmyaoXvczIc4gGqcXaad3ZaozUtwvWTQazOd3O56KiWLq59WfI+zN0opI2ZN8d2nqntsI
	9KFRCiLK7zAGLe2PTtOE+S07zLw7xNdEZK/9a0V+gQqGOas+esGqzT/JTmbBBplWw6qbuE
	g8TCkQnol6wAcpBeOZMJLPomYY/2RJo=
X-MC-Unique: elB51hxaMmubEzz77i6TPw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvCpeCf3WqcgGm/38I+rtN+5WL+adhEy68QM/nFytRJ1wDFcxnfWUaP+bObguTxX6i2BDOIC7+ITsyTVjBbH1VCrbOvLctcMbLAo5JXW66HNO0de0dbyuVGCsam4J9/PmUBGYHkztcB6+DiXiiv4FOA/ByX1T3ysQmOVatA1YJh0CMZ61k2W5gOZ9LU/UFGkH44sRKoWJMjw4oo6mu2BWzIXHK078feEbGgiPEcvaizt8J1xEtZF2GCxCHtf1zEvSlBYhx63/qmWEqY5XHnHhN9ec/VtFVYL0298QwN7S3LFlUPnTgQc+hFzzu4/HaHISLpEHoQZEy8rdjNhSougyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKhCCh0AFmvjkEUf+eM5tBqk8NLrqZ5CSvwor2o6/rM=;
 b=mwUkxQiZhwmBLScAA0iJ6EkP3LECeYGoSt23o/iKS4YRve15jD7WLiewrjE2/3ecXCgx8/5okqKe4dK+NMLnFBaHVAVh5i46S2iGrzGNivmXgh9qGL8xLzDzOHclcyadvGHlWx2reonkz6EBfUOiLLpRXCNBIVYZC8I2Pd+zVvekAs5FoovE8Y/OkhoOWEE13UxzvL008Lh91vT7tjMdwXHMW+3L1Uz/uBV/T0mOyVOCKzu0u/eRPIUcFkgg17RgiPtjc19wIPGJLs5D4VKk+HZcuwJEZyeXzPBBzySKsYiWuE6O6a4m3sBQtg9v1eOE3ZY3uMrghfGbtDAMHvsebw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <76c0e41b-f0a0-60e5-f2b4-d19724ee2db2@suse.com>
Date: Thu, 6 Jan 2022 17:00:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: xen 4.14.3 incorrect (~3x) cpu frequency reported
Content-Language: en-US
To: James Dingwall <james-xen@dingwall.me.uk>
Cc: alexander.rossa@ncr.com, xen-devel@lists.xenproject.org
References: <20210721092958.GA2502468@dingwall.me.uk>
 <c9c6778d-9823-4b07-fb48-604acef1f3de@suse.com>
 <20210726123332.GA3844057@dingwall.me.uk>
 <06be7360-0235-3773-b833-3e0d65512092@suse.com>
 <20211105152501.GA485838@dingwall.me.uk>
 <20220106150809.GA856484@dingwall.me.uk>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220106150809.GA856484@dingwall.me.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0363.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b20c7463-0e72-457b-0116-08d9d12dbc3c
X-MS-TrafficTypeDiagnostic: VI1PR04MB4190:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB41905DBB16D5574704AA541DB34C9@VI1PR04MB4190.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kxI1zioqHC1mx/bqPCXjX/4HxDjc0xjUXQuguPO2ezNVfU7D0/enXMQ29PHYc/OgK1hfYeKz76zzZdxkPC2+cDqmoEcf9l6b4ff9FENxrzp+m7idLwj522J4KRT+YR8fL6lE5UltE6DzsWYBry1s8d8vN/Rwg50FHboz3GWepvJozQ4hDF6sc92931ED/dWI7jbdZS25+hogOnNG/El0fl/iXaQXLSMgL8YM63yTsU6uasAxOB99El1+PgELP/xtsWIaqRb+F1qOEVTu27ladq66OphDhJLRDMj4fAYTUX8QSvD89/pRUvuauOqEFJ6kVeBJN79yQeNMtmFt+IMFzkuCm7mD3V3uUJ+v5xFc62b6smrSRleOBJmwN+zCEmFekpDfuVUPilJ5PyIrdR466ZbDzMnZEc0j2PdaL5glVJsY+mVEd2/jLkx/BFdkoUbnCYQbU/+Fph7Aq1ZVfZ1OfHbl4px7Amih51Jfg1VlELJh0UIEfkryvxUIC+UFMNMLT5O9F8diBdllOF1VrmmVVOMeFChFQjC3ssk6KkVSkTZdFXjFOJTZMt/1LoG5BZ+rgkiaF7ekxDRlbQgXFIF158r/Mh73WNYGVcPzLIrpCmowvgC8yiAe8VQffl8KgVbh3DM+HSBK4pRJLCJaqBfmQ1qMxP+qGQ6Im4w9JsddvLCnYP6Y6pd3lGtWaBPJIWi15YbtHiu3xR8SASwT+syXhn7jHsRPxMkzYJMqopkXA3e33dqMsviQQhsVhu/So+lA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(5660300002)(6916009)(31696002)(186003)(316002)(83380400001)(6512007)(53546011)(31686004)(6486002)(2906002)(8676002)(86362001)(38100700002)(8936002)(26005)(4326008)(66556008)(66476007)(36756003)(2616005)(66946007)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFJNSlF5a0pDRXpSK1BrTThMUUl6R1ZOclY4ZlBZbnY5RjFROWFwd2srUkpU?=
 =?utf-8?B?a1F3VjZCSkxNdExhaHZnaEEyRlQvOWxNNm5xcDJDdFh6ZGVmOTJySENwMGYz?=
 =?utf-8?B?alk1am0wSU0ramUwSGJaK1U1bjBubHF0WE4yMHFjZzdFOThLOTdTcTlCZXp2?=
 =?utf-8?B?bU1QNXZHamhWbTRSZXE3Q1M0MXRiTkxHZmpzK0l3SHBJZ1pVaW5yTXVFVUVj?=
 =?utf-8?B?NXoyNlJTcTY2aHVPZUorOUQwTE5GUXQzUkhYWlBrU01RdEY4R3MwQ0xiaklP?=
 =?utf-8?B?WjFRbXhnRlBEbG5yTGNTaHpVTFRWL0U2Y212Mm9vcCtwMWpMWEJPYUpjRUNP?=
 =?utf-8?B?Z3V1VWRoQ1ZRcjdNNlhieWZlMW84N1VQaHdzWEw4aTZsZjU1YkRwc1pacm1O?=
 =?utf-8?B?ZHM5YlRPZUpFZmVsVTVvcnZjS0U4RFkxamIwYnl4QkdpUENyczZuK0thSnk1?=
 =?utf-8?B?MWdJY1dnZFdLejN4RVM0M2Q4eTQ3QWxaRkZKd0dsQUJxWjgwRDdRREVWSGN5?=
 =?utf-8?B?WEluMXlrNnp4OHJwNUtqYmQ5aWptR3FSa0RHTjlhWDlzZGY4STlTWG0vK2pF?=
 =?utf-8?B?UHZrOWRYWWhGUklpMUxxR3RiUXRWUzM5VWhsajlLRHdPUlh1L2hYdGVYcjNG?=
 =?utf-8?B?R3k5ZkkrUFVvcGh1a3cvTDYwM2RqMWVTa0R1Y0ZqYXMxelNGUklaTTV2TlZ6?=
 =?utf-8?B?QWNKZ2syM1hiYnNsczlUY3M3Z01yelZQTWNqMFpoanFONE41RTlaa0JSR2Rs?=
 =?utf-8?B?WEJMQTB6bzN2dEFudHVzd2VWSXBIQmJ6N0lHSzhBSy9UbXoveHBRbkthRS9x?=
 =?utf-8?B?ZXlFVWlSZXhaRGhKZERQNXVsbTU3UDk5OW5ia2wrL0QydTlOMjNZdDU4TlRt?=
 =?utf-8?B?anYwQW5WZW45bXNIcUp6WndpdmVyTGhHSFp2ajVDYUdWWTlqSkVER29VUHdo?=
 =?utf-8?B?cWF5M0x5UmdkajFURkJkeTQ0UkZBbWticTZSQW8vZVY3SjNRREdHL3JzaWhp?=
 =?utf-8?B?M2ZkN1l1dzYwbXRicFJyS3AxZ1pBZUhSZ3hGOTA4dk5yV0Nwb1ZyM3V3L3ZN?=
 =?utf-8?B?cE83TVUwM3FGWkxzWXlLTmZsZ3JnSnc1YWV4OXNyc0V6WE5jeWphZmhZaGYx?=
 =?utf-8?B?RzhsbG93SEFLaVVwNDl0ZDZaNkkvaUI1Q3FJa2VQMUpxR3ZCVHVJTDVORGlB?=
 =?utf-8?B?UWJxYlFmZE1mTXlPUlRaRmk1T3RvVWNpVWJKcnUveGNwQnBJdzF0THNvNUI3?=
 =?utf-8?B?N3RNSGtQZ2NuUTJoQTM3SnFQbTZsbTR3a3J2Y0ZEbUZEdUJYZ2ZocVBVTURL?=
 =?utf-8?B?UGc2ZkthcmNiNDBVU1hlSncvV3hyMnZiOHVMSER6ZzZzZ1NXSzdIcFB4bm15?=
 =?utf-8?B?ZUdLaUcwMDdQNUJyY1ZpZnc4Wno4Rk9UbHc2dzVQZG1UWFBjMk45VGp5YU5T?=
 =?utf-8?B?QS9rc2NZUi9SbGN4YVZibjB0ZGUrQ3ZnOHd0ZkcxVmNwdkJqbVFTc2x4T1V6?=
 =?utf-8?B?OUltTS8xYnErL0tGUmU1dUJFbWU1L3JobHdLV0FiNnFKb25MTDd1MEdIWUxz?=
 =?utf-8?B?QzFMU1ZlTmRrZXZ3R3RnS2h2OXQ1clRDdVIrT2hKNC80S213aU44bTNablY4?=
 =?utf-8?B?Nyt1UHo4ZXlFV2s2WWsvODJOTDNsenFDN2FxcHJFNVUwN2Jmb1JYT1ZjL2xS?=
 =?utf-8?B?aDdJWHI3Q2xrbXhna0ROV3ZwYUtOSmt3ZTBkVDBMbExEbTNvOFVuOEEyaHgw?=
 =?utf-8?B?dW51MCtxUlZXZWtJVk54QVcyUE5Ed01uSkNJRnpqSzdyb2pjVVBlV0NQU2pG?=
 =?utf-8?B?Z09MVW5QKzVHdTFuK0lkK21NR3BTUjErenNqUVpicU9DVjBSaTI4MVY0eElQ?=
 =?utf-8?B?K0l3VjNBM3hZYWI4WHJNemdUalFpQi9kNFl4UXpiaUhiL2kyakFUdjRzRlZw?=
 =?utf-8?B?YnB1SldKQkZSdEZiK1ZJa0FUSU5RS0l3TXFWSmhoVkVnUDFma3Rwell2c2pi?=
 =?utf-8?B?cHNXYS8wYThLTk9kNXBjbTRtQUo3TjFlZUhtMDlqRFpGaURzY243S2pneVdy?=
 =?utf-8?B?VkVHcUx3dnFVR2ZNWlBpNEczTmNtdk41Y0JIZnZuRWY2N3h0cGpMNkhTeGtV?=
 =?utf-8?B?R2tIcUVDSm9LenVrNHFQa3lEbzRFRmh6dXRoL2VONmlqM3d3QkdGS2JudVd2?=
 =?utf-8?Q?zQKnzwtVCZgW7PsDqvZYacg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b20c7463-0e72-457b-0116-08d9d12dbc3c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 16:01:01.3047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: htWmOWuwVU3HRMt/EmvUpiML/TSGrKetzDsoNG9Wp+JpMDkr9xbTprGpOyw2UOIXh38odIddl6IhSAcG6j8zpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4190

On 06.01.2022 16:08, James Dingwall wrote:
>>> On Wed, Jul 21, 2021 at 12:59:11PM +0200, Jan Beulich wrote:                                                                            
>>>> On 21.07.2021 11:29, James Dingwall wrote:                                                                                             
>>>>> We have a system which intermittently starts up and reports an incorrect cpu frequency:                                               
> ...
>>> I'm sorry to ask, but have you got around to actually doing that? Or
>>> else is resolving this no longer of interest?
> 
> We have experienced an occurence of this issue on 4.14.3 with 'loglvl=all'
> present on the xen command line.  I have attached the 'xl dmesg' output for
> the fast MHz boot, the diff from the normal case is small so I've not added
> that log separately:
> 
> --- normal-mhz/xl-dmesg.txt     2022-01-06 14:13:47.231465234 +0000
> +++ funny-mhz/xl-dmesg.txt      2022-01-06 13:45:43.825148510 +0000
> @@ -211,7 +211,7 @@
>  (XEN)  cap enforcement granularity: 10ms
>  (XEN) load tracking window length 1073741824 ns
>  (XEN) Platform timer is 24.000MHz HPET
> -(XEN) Detected 2294.639 MHz processor.
> +(XEN) Detected 7623.412 MHz processor.
>  (XEN) EFI memory map:
>  (XEN)  0000000000000-0000000007fff type=3 attr=000000000000000f
>  (XEN)  0000000008000-000000003cfff type=7 attr=000000000000000f
> @@ -616,6 +616,7 @@
>  (XEN) PCI add device 0000:b7:00.1
>  (XEN) PCI add device 0000:b7:00.2
>  (XEN) PCI add device 0000:b7:00.3
> +(XEN) Platform timer appears to have unexpectedly wrapped 10 or more times.
>  (XEN) [VT-D]d0:PCIe: unmap 0000:65:00.2
>  (XEN) [VT-D]d32753:PCIe: map 0000:65:00.2
>  (XEN) [VT-D]d0:PCIe: unmap 0000:65:00.1

Thanks. In an earlier mail the reported value was 6895.384 MHz, but I
guess that was on a different system (with a base freq of 2200 MHz).
I wonder how stable the too high value is ...

For the moment I have only one possibly explanation: A SMI hitting in
the middle of the tail of init_hpet() (or init_pmtimer()), taking long
enough to cause the function to return way too large a number. With a
50ms calibration period that would be about 166ms. I vaguely recall
having heard of SMI potentially taking this long.

While I can see ways to reduce the likelihood of hitting the issue,
for now I lack a good idea how to avoid the problem altogether. I'll
try to get around to at least put together a debugging patch to
hopefully confirm the vague theory.

Jan

> I also have the dom0 kernel dmesg available if that would be useful but I've
> left it off initially because the log is quite large.  I don't see much in
> the diff between boots except where speed/times are reported and where things
> are initialised in a slightly different order.
> 
> Thanks,
> James


