Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9088570482
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 15:41:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365137.595226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAtfF-0006hh-2f; Mon, 11 Jul 2022 13:41:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365137.595226; Mon, 11 Jul 2022 13:41:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAtfE-0006ff-V4; Mon, 11 Jul 2022 13:41:28 +0000
Received: by outflank-mailman (input) for mailman id 365137;
 Mon, 11 Jul 2022 13:41:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oAtfD-0006fX-J5
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 13:41:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2082.outbound.protection.outlook.com [40.107.21.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28f98e73-011f-11ed-bd2d-47488cf2e6aa;
 Mon, 11 Jul 2022 15:41:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4066.eurprd04.prod.outlook.com (2603:10a6:208:5b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Mon, 11 Jul
 2022 13:41:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Mon, 11 Jul 2022
 13:41:23 +0000
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
X-Inumbo-ID: 28f98e73-011f-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YR2FWXhb76ubqwZh17IzS7mS+J+0tGglf1BRUHvscUwpjGoBBGVSEjetPPocWSBTHyEDHAOT+ruNj1JfbpO1ekzGBwjUSK+YSdaE6xy6VSVagjez35ZxLBTJNGRJKjU/ymqD6SfeO1ZgZAZT0jwhC81qqCYvUY3+aH143Ohn/cnl4bmi5wL0L85RtAazS3zj0OFUn5muR6v6euy5ObMWW5cB9gPEpchx8LKfuFvtVSXGP874azc2LvPpM4AgXNPE4cydn0TCV9p9SwVHKVtypDr5EQnVO2iah/PC/V/AlwgH+CBdxw3e/+yHYViGJ2YwvB7U7iOjWI3SdUE6Qg2mQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PT8a6vqWuCNd0plAzJ9mH+Byt7yYLrj7br2ncgocIFg=;
 b=ZABandyfKfXZc6qqTq2rSMoXoLsuae3aj++TBviP6EiSWGBiPskljm99W+DKBO4xG0FoaAFzazN/4tNB0ayR+mId+kuIBdfCzF4JL5S7xs+7jE7LJIaCb4Xe+UkI93reLvtf/Iav1nM5qDSTGtCSPIvSSVWUz0azbfJ4KExQKzoZypsp6Hjtb2Z5EgG2XbcpIQcbfLDGmWsTmmReRIc5FpfYz9vutC+MRanY0nRJaQiacSwfvi5XF3Y1IW4bQie/bjF2RJvmQIXRxYMURioui4XUlfhe75kUyraq5wy1WcThyx2D1haWStM0Mi/fiDiYNwLctZHLgh+Mdu51076NCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PT8a6vqWuCNd0plAzJ9mH+Byt7yYLrj7br2ncgocIFg=;
 b=J5/sw0hMy/rFATgMm4WXFXc4YvrCWurVUCnS6/13hBEEHGuce5lY+bU7eaqSahwI9HdROJ4I0++fIawaJihHygObllQRx/06pycsQEQ4BxAN+ttvAoQe158mrBgjeA2dFDhLmwGFpQYnswX018mPhAJ7qavdkWKNzBNKy2irz27DqLvkHU5uz8CUpjDuNTlrwyyYWEvcnWrzYAJ+Sm76JjUPdkaJRs6INQN7Pjz9Yil2ktMkRiICTUA+fGdvx2XzqwC/7et48gypAJaLD+R8KVm7O1Ouj/IdWkfUW2CWDclGgtD+JFnYcgyxXnyBIkXhfcVKFcutzfcMQM81ZncVtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c93cc66a-a0e7-741f-25ae-c092f0a7d110@suse.com>
Date: Mon, 11 Jul 2022 15:41:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [XEN PATCH v3 04/25] tools/firmware/hvmloader: rework Makefile
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-5-anthony.perard@citrix.com>
 <35DF552D-E8EE-4478-891F-792F67D690D2@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <35DF552D-E8EE-4478-891F-792F67D690D2@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e493113-f248-45c0-dd3c-08da63430ba4
X-MS-TrafficTypeDiagnostic: AM0PR04MB4066:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TIfJPAfOeQVf3jVOHPhhIJHvg4YY0AgL6ERC53knXf+zesFMxC75XAuCuGQJBME4DHsxKKSBBvLcooaKPDTLx1OuU3DQc+3bg1BZLBhEJ+C+jRtgJLcW/lK2a7pROmWc3JLi/6b+YDyCIrR0fvy/EdR08S1Es8JZPJoZo/Ql4WT2244Sj04n7kcRYSPxGd+DXlQY9rfbxnlKSedfRFgY2fDwk95Zuh2t1N8ybP2+g5Lr37+gzhkAYAAoQtud4ApDfMe3I5iAxfLoHav2RmB4ajk31RIosEiN8WKVD32mC5VrjpNOLVFh0oPqqgYLeFr5kb3MsDaZnj+hVXdmcO9vvbIj+wqIi7M9DEsJOPf4bNBjtT8fIDrAjyTy+Uw68XEHIIowoBVSYzLMGI2Cvajgkmkz+SmKuR1BthYsLEpdOf8rG9zQhDw/P2TJnzx2gDgMIlC3VxQXuQrw9vuKBihs/zYiwJ/17gPb5vmIjIv0C6qd52e10l+VF6crWjjEazMdk68c+9NR9WowEYgH5cuLzCr4ZfLSPggkNjA6FYt3flEO+bpNMxPZW/qQ58kzY3s01R33ZlvWZUzqfotNqDCibZrq3TRI8Jr23hoi28Pk25yjtGF7bEsD9eQ4+P0y3z+NsdAaUQWDiYajoZ3Z786m/OX1kVqpZahcGLm+nFVf15xJ1X8en0WdYF8re/WHSI7ngAr/WNDS3uzyIGwqwz+p3qKEGePLxE30RFFxdRFqAM+70i0OegF8pUjC/qXPhB02lOQUZXTP2VWqz3TZTyYQcrNYYZe2q93HJkKNVOxNLr7Gdn8FNj1AD5CEy0qpp+ubiOCpY6mkXcVN8OUB+ZauUKEAWixcFV2KWJU1thiBaKg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(39860400002)(136003)(346002)(376002)(38100700002)(6506007)(86362001)(2906002)(31696002)(6512007)(4326008)(6916009)(41300700001)(8676002)(54906003)(36756003)(66946007)(66556008)(31686004)(316002)(66476007)(5660300002)(8936002)(186003)(478600001)(53546011)(2616005)(6486002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clg4WFZ3d3hiTmx3UWtNZmJRbEV3MGVJT2xPanpWZU5VdngrRUVMVXJ5aGlW?=
 =?utf-8?B?RVRoVHhkUXNVR3BCSlRRRVRyV0lvVUkzMXg5Ly9RT3RweWUyZS9LZW0vQmxF?=
 =?utf-8?B?V1NOckVzemlWWGtMUlZUeSs2Tm0yeGFyY1RFa3FRQTV1bW9tUWdoTXo5MXNF?=
 =?utf-8?B?SGIxU1JjK1A0dy9yU0p6Qi8rRC81bFppdjFNUkhGMVAyQUlJODlpelhVa0pi?=
 =?utf-8?B?U0ppUElhTmdQMG1DZ2l0L3pmWm12d2NMQSt3R0gzbmgvaUxpSit2MkFYWTU2?=
 =?utf-8?B?UHA5SmdGWFdIT1lYQ0RhRk5XQmlYMUNMaWl5RXRST2ZuOUJwaURXZHlUN3FO?=
 =?utf-8?B?UVgxSlpBQXpNY0NVZVZsd0pRS3dCMUVtMVlQaDBqd0hPdFdqQXZtTGxwZVRl?=
 =?utf-8?B?RG5BNlNpVzhrOUFBdnJqMlVIQ3FpclpWZVNEU1Y3THltWGJaTWI4SWFpZ0Ju?=
 =?utf-8?B?cW5ETEVQMzM0eDV6RGYrSEhtR2VkZDlncElLSjlZdUtjSDg5WDU4R2g0MVlF?=
 =?utf-8?B?Q0NqNE9YMjhnVjV0bGNQRXM5ZVRYMUk4UkRoUFFDYUxxUkZhdXlPYWtoRnli?=
 =?utf-8?B?aTBvV2JrZjV5VjVlYkZ3UEl1b0JyTWtwc3VFTW44bEFCSjBxVURoclpiR2RG?=
 =?utf-8?B?OUNidForUHdkeDhHSUFEcFRCY29pL2NZQTNJOXByTTVONHBWdElyWC9QSFA4?=
 =?utf-8?B?bStDMGNUVFR2d1Y2dVB6UnRuUUYzK1NXdERIZ2M2NkhOSnVJWDQ5cnkyZGNR?=
 =?utf-8?B?VSs4c3RaT0hLRDNvWGZJalJ0QTdhMWZ2dGxYR1h4RVZ2V1hYWkUrUVdieU55?=
 =?utf-8?B?dG5HVURXSGEvaWExR0kwUVJ6YVlpRTBQQVRZbG92VitNVzd5aUFnMEpMSWJt?=
 =?utf-8?B?aFFYVWVJT01ZUDVkQllDRDVpWEJPTVNUVk94OVpBWjk2aS9SR0F6MzdpSFZ6?=
 =?utf-8?B?T2RrengxbGI0Wk9DS1ZiT0FQbVhHTFpEME9OdDZBTTZhUVFLUEpzeUozb0lH?=
 =?utf-8?B?eCtZd0EvOHA0L3h3ZXNleEtlbkRCQlhuZlRMRXFvNm5KSTFGR2d0SlJYeGNF?=
 =?utf-8?B?YVBwUXd2aEFuUjJyNEtCeElDZisyTGdab01JV3R2YmZITVYvRG84YnZYT01r?=
 =?utf-8?B?ellGQW90ZDJDY0ZEZGt3dHRVWTJLcVRObDFIdGh1UDV1MXNUcDV1ZGQzbitB?=
 =?utf-8?B?UDlwUmxJT3JDck5LRE1ROXlqdys0WjRGTXdwSjZSV2Z4LzIvUkUxMHNnbkhZ?=
 =?utf-8?B?Mnp0YmFjSXZyWG01TGQ2UHVtV1RSYTZoMXR0V0ZlSWx4RkZ0SERRdkdFUW9p?=
 =?utf-8?B?dTEwZy9HcXltRHRZWTFWWFJFUTQ3R0V0ck8rcXp6NndTZXdDeWRQZmZWbmJi?=
 =?utf-8?B?ZXVEV2YvZWtIaFRVT2dEZ21kVzluTTd4a2E3enFhRlVpSnNVbjU1aHdRUHk1?=
 =?utf-8?B?YWxqZU5jVjdXaEdaVHBsNEdGSGNNRWxVeDBIdkFSQ014WkFSeUVTYWNESlJE?=
 =?utf-8?B?VGZzOGRrZ2Q4UFdqc2k3a1VBZThPa0VQSUo1dUw5WXdPTFBOejhNR2hzTXNP?=
 =?utf-8?B?eEdLdnhsRVBkblFhSkN5VFl5b1RnMmQrZEI5VldBZ2c1eVBDMkhPRksxWktr?=
 =?utf-8?B?VFVhY2lrTDRCa0VHM2FzNUYyOWVnVVpVdFhNenRsUlBsc0dpVzF6MzhwWDBy?=
 =?utf-8?B?dDdaM2xsQ3VLcUt5UTZtM2JTTS9ieEgvVklWMnh1aWEwWnlYRHc0NXpKRXRw?=
 =?utf-8?B?WVZtOXJSMWg0b2Q1ODF3UVpHUk1UNWVuOGVITTBlWVcrckxKTGttdHlQWlBs?=
 =?utf-8?B?Rm5mc1ZMWDh5d0ZZM2VMMkdOMG5VcmhZak1LL2swaGVRZEVqdS8vdVM0eHZp?=
 =?utf-8?B?SkxjTkZtNmFGVDBFVVA1NDRIYklIRTFPaW5TV240cCtPbEczMHNPRktRQWNh?=
 =?utf-8?B?NzFNaEc0SS9qMEhHK2QxbjU0ZDJ5SkNSRVFFZFZxWXhDTnZXVXM3WHhFZTEr?=
 =?utf-8?B?TC9rYitlWVBHUGlyWjhHY0NoZ0swL01LdWl6WGYrUXNlaUEyQXhzNXoxalY2?=
 =?utf-8?B?SEczdjMwTDBzVU1OUjlKZjB2dXVCZHhxcm94NUpNWmVpQnBtRmFqREZUaWtl?=
 =?utf-8?Q?ehbMnW88OfTi7ANg3UPExyRld?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e493113-f248-45c0-dd3c-08da63430ba4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 13:41:23.7065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VnqVCTwEkj/uYkNY1WPOp4vGD04VF0wRZwC+KMOdgAYR3k0V/phML+6V1LbqEEp8uQeYoFMV35kYKWjRuZ3MNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4066

On 08.07.2022 17:39, Luca Fancellu wrote:
>> On 24 Jun 2022, at 17:04, Anthony PERARD <anthony.perard@citrix.com> wrote:
>> @@ -87,21 +89,21 @@ roms.inc: $(ROMS)
>>
>> ifneq ($(ROMBIOS_ROM),)
>> 	echo "#ifdef ROM_INCLUDE_ROMBIOS" >> $@.new
>> -	sh ../../misc/mkhex rombios $(ROMBIOS_ROM) >> $@.new
>> +	$(SHELL) $(XEN_ROOT)/tools/misc/mkhex rombios $(ROMBIOS_ROM) >> $@.new
>> 	echo "#endif" >> $@.new
>> endif
>>
>> ifneq ($(STDVGA_ROM),)
>> 	echo "#ifdef ROM_INCLUDE_VGABIOS" >> $@.new
>> -	sh ../../misc/mkhex vgabios_stdvga $(STDVGA_ROM) >> $@.new
>> +	$(SHELL) $(XEN_ROOT)/tools/misc/mkhex vgabios_stdvga $(STDVGA_ROM) >> $@.new
>> 	echo "#endif" >> $@.new
>> endif
>> ifneq ($(CIRRUSVGA_ROM),)
>> 	echo "#ifdef ROM_INCLUDE_VGABIOS" >> $@.new
>> -	sh ../../misc/mkhex vgabios_cirrusvga $(CIRRUSVGA_ROM) >> $@.new
>> +	$(SHELL) $(XEN_ROOT)/tools/misc/mkhex vgabios_cirrusvga $(CIRRUSVGA_ROM) >> $@.new
>> 	echo "#endif" >> $@.new
>> endif
>> -	mv $@.new $@
>> +	mv -f $@.new $@
> 
> Here, instead of -f, is it safer -u? What’s your opinion on that? The patch looks good to me.

Would -u be an option to use in the first place? It's not a standard
option to mv, afaict.

Jan

