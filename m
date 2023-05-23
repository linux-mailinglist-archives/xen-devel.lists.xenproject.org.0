Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E32CB70DA99
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 12:32:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538400.838307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1PJ4-0006WQ-IX; Tue, 23 May 2023 10:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538400.838307; Tue, 23 May 2023 10:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1PJ4-0006U5-Ft; Tue, 23 May 2023 10:31:54 +0000
Received: by outflank-mailman (input) for mailman id 538400;
 Tue, 23 May 2023 10:31:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1PJ3-0006Tz-FH
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 10:31:53 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20610.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07500e1b-f955-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 12:31:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DUZPR04MB10062.eurprd04.prod.outlook.com (2603:10a6:10:4e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 10:31:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Tue, 23 May 2023
 10:31:48 +0000
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
X-Inumbo-ID: 07500e1b-f955-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8Krp7ZEIyHS8zQAvhS3JSxMXQmWsqAYTwP/hqLKyxP3dzwZL+TKko2auCB1ZnJxIHSrJUW/MlL/a2C7ExEPQFq2MwG8TJJtfgp2X7n8epCswYx66Z8lUQcBvbdLvWvezR0f6RQR0Zl98HQova82eapWLiQmYPmoftTQYpZj3+QPY8VAIh6jhpewrvzytTLgTtYrwJFB3CR7qvavexVxaVQvoOAWTxS6Z/5SVLmt6CFSdMiPXSOh0r2O8IPRxXQu3aWk03K6P1/hn5lI7e82eABs5HrkidhO1j5J94hMLguHMjBrdlfrr5RuW8K7mYA0ttd/mygavwE97sUfuOsVgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ahmiuw8dLkApBHTPn4Wt72OFNmIZiMr5ocHFJRn6XSM=;
 b=NronREirkXlc8273I2cClzclErVTUQZZZtZzS5yABiKEoQ3XYHLrpZhBVEbxyce1/dMRPiyJ/SLEPBGupAu7dXO9hzhsOCHMwd8C8EY8kTqVpttdSD2JeNEGx2kBvW93oHBnSlmin2BI8MmYYcz4k8FEBEkATjH5YZpWe1oSjbZA9tx6PgdEKFZ/vBsJlMCjS9NyVpjkBD1jMmgr7FQ14MuNhCVrsImsWAkC19m84gDDU+tl7wmg1nrtWhRJD/BihGtUMikHDHPJuds6VN4fQpFfIHKLTMFa8u+4IWfeqxrDdYTwpPtZA1e4Z7L3IMPYzJjmi96ipwS9iHNWYNGODA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ahmiuw8dLkApBHTPn4Wt72OFNmIZiMr5ocHFJRn6XSM=;
 b=RggcN0XFV2DYPBCL+EQPNC0LUaaOHMvChNfRPloeOyJwjT7WMC1A67FvavB13oZmECAsHxRMNbmBrW40kRP1D5t/PgzN8CPpm3TwOG4U1fWHOZajfOv72jX4VrjzO0O9EEuLW71iSoqE0vmxlsWItNBYSSE4jn3eSOX3DGlYTmDaW0eKWiYxKJRe/Ek9ZjFb73eA6w91u7fS2/wIAJ28TPCTfP0CsrA6jobps9/1du2WpqKuvAskIal4qftc0wzm1OV0tmvM5nQmTKMlwDPOfvTayOxRg9wKI9htOY/uJ12bUD8V7jWSd7KQq70F5jcZyE4GC3c5gV1bLQE5I9J2Xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <767b11a1-4d43-9057-1fcc-6516fea64fb3@suse.com>
Date: Tue, 23 May 2023 12:31:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v7 07/12] xen: enable Dom0 to use SVE feature
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-8-luca.fancellu@arm.com>
 <48722696-ea22-1af9-2a0a-aa78972d118a@suse.com>
 <6DEA0CC3-C3EF-4509-A869-807CE4B21401@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6DEA0CC3-C3EF-4509-A869-807CE4B21401@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DUZPR04MB10062:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c63b4a0-f35c-4a07-d062-08db5b78e9c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aScPZEK1uja/4MQqaosyBiOkwoXWCmRbRBRLHs6t+U8rp8nKxQjnsPm41wNjL5wSm56GeUtnMP/+kVaHarrdSMI2OcRWtaS9e/R7Aukt1kUz37aHY4A7AJRbh2Hgi2t8bLkiDyAGxRESntE6vvXoIft3qTyyVA0mIPWYDi7uQ8+UesYvLehdqQFAYKJXZFq5q3AuIFecPTb4vzwXtETicBKK9Usgt28gbVLEzQUlDdb904JfdWqIEXTnQFirSkCna4WvDMNWj01nMV+j2AMtqCCKPkkjF9dAfIWaeRLHGkmbvxcTlMMFeqA7YV2WfpnB+HQ6OGMl1rxT2JLj40na1vUeQdpk8ojwKeKVjmM3oPhEmxmlarAHGZqW8etPGt5GGX+VYrTd0K0HZBtmxNg+C2DiiZvjO0cSN+cV9gWcrr7KHRDFmCx726WCi0UCEJ+EeqGS4gTLrRC0w1e+ws4Ix0YvSQiE5Kh87wlxr1wOYAv95YqoqbGJmpq37BpzlTwyrQSZUOQS2iyTW2lconeexmoZypdC0JTi4A4VjgLg1UZhXsGIar2zhwfoUi9pTSriT+s3eBHhKDKqzCtMrSS7Qbe167mh9VoBYqfVJyVf1U+jOTy35FS0/U5fvBmK/RHvasEMAflIbwW/WlnD+R0bpg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(376002)(39860400002)(366004)(136003)(451199021)(7416002)(5660300002)(8936002)(8676002)(2906002)(36756003)(186003)(2616005)(38100700002)(86362001)(31696002)(26005)(6512007)(6506007)(53546011)(54906003)(31686004)(316002)(478600001)(66476007)(4326008)(6916009)(66556008)(66946007)(6486002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2F2clFFR2lPKy9PeHV2YUpqVmxicWsrZzA2bjN2RWxURmNDcnF1eVhQbXBa?=
 =?utf-8?B?ZW12LzlFTkwvNTJqQnZLOGVNZUdNOFNmMUxaUFA1Mk5mQlYybThzdlQwWFRQ?=
 =?utf-8?B?SDhZaTZqSDI5Wlpmd0tkMGpqOXlSeGdNdTh0LzhXbVZ0ODNNaWY3eDRLbk1U?=
 =?utf-8?B?WVNPL2k3Ri9pQWNRZUtsMU5wZ0dkbisybEthakhhTG9ucXkyTmFick4xcXNh?=
 =?utf-8?B?SXROVFB2UEwyQk5selI3Um9WbkhvaVNDeXV1cnBCQmNIYktmcCswdGl2Ny9n?=
 =?utf-8?B?VEpib2VPVFI4S3E0TTNZbE9BVDJvdlpycHhQaVI3NnV4TnFCS3RyZHc4REpS?=
 =?utf-8?B?V1BYSmorTkowclB6eHpCZFFndGJHQjh4SGZLemEvM0hmWko2eTdWUkJsVG9v?=
 =?utf-8?B?Lzd5cklwNG9PU0MwdnVFd0gzZlhyVmNFellHV1FqYUJUam9EaDQwRU8yZlJx?=
 =?utf-8?B?RlpEbDRsblBhWFpLYTUwVnhOaXlUT3dHdStmVWlqeWZpQWlwUHJqcXRVMmwz?=
 =?utf-8?B?dWFQRHI4aTJ6MDVUbnJ5bzMwaEdhZDk4Ui9KUW96bGJQTnNKcGxibjVaWUNF?=
 =?utf-8?B?YUkxQVlRVmo4S1dTU3JGUVYvUEtsRnVDczNDZE5EK1FJdkh4bDFhUFVvS0V2?=
 =?utf-8?B?eUlrQ3FGMVBIQ3dmS2VqUUoyckJnMmRwMi9uOWtIcW9LamdDZkFnL0JnUE9L?=
 =?utf-8?B?VmZqT2NaTWxEYndRYURoTEdtR3U3dEdtZ08yc3FjY3JzVitIb2Z6YlY3YllV?=
 =?utf-8?B?M3hjbXVQS2pJam1wbmRweFhQM0NleUJER3RlaWRES1JRR1pRMElOeE44cjl5?=
 =?utf-8?B?V09WVk9id0FKeUliNVhLZXRoSWJOUmt1WWJVTGppR21KUzhBNHR3U0g5eDFS?=
 =?utf-8?B?ZFhWaUEzR1lNTU1CdDMvTm4xNGd6R0JWT0Qwb21WZHh5QVc2aGw3TXJ5eE1z?=
 =?utf-8?B?b0poNWVnNE9CbUxEZnJvYWFZdHdzRTB2UEZPNGRCb0l0VGc1MElLampjNmhR?=
 =?utf-8?B?OVhGSGtpM09GTitaSjd4aGpjLzl5Kzl1ejVEM0RTTUNabUwzaHA4M3l2K0pB?=
 =?utf-8?B?ZkVnWUNkN0prdmJKWjlMQlFJY0RQcVpvaWJKS3F1SWd5ZjVlVW1XbHFTWEds?=
 =?utf-8?B?b0ZkWGoxWDkvNUFMT3lGRGRoc0svYWFTWS9uTmdzdlBUZURMUTZuMjU4Vmpl?=
 =?utf-8?B?SHZsaklhUGtITlRhUmlCMUNGU1ViU0dQWWRnVkRKWEhkVmdBaWlvUU91NVRX?=
 =?utf-8?B?d2hUUDhqV3BoOEd6aGI4cjE3bmV1WXpiYjFZa0lJNVZXNUh4eHBPZXFTL25F?=
 =?utf-8?B?OXNmaEFUdUZ1NXNFWDl5clp3ZXA4SisyYllGd0VzZGg2MFpQaXBqN1lpUXpO?=
 =?utf-8?B?eFlyMHlaL0Y0SDlDMGprWXRjbjdQMEtsd0h6cm1GYWFjcnRSRkZoOHZFLzg2?=
 =?utf-8?B?ZDk4K0llOS9NNm9hTE41M3VQZ1pWeHlmdDNSOHNRaUpIbnpNNms0Y2wwSVlP?=
 =?utf-8?B?MTdUZlpqeldSeE40LzZHZlJRZXg3UzZIM243aFgwUkJ5bjFJZ1pJcHpYUXpE?=
 =?utf-8?B?eHJRUUpMUzBxa3lsWEpCZk0zUDB2QUhQbEIrSkIrK05xY1BlM2xkWHJCT3Jl?=
 =?utf-8?B?RzZPMzMvcEdYdnlUZFNhbkppQ0h5OGF0ZXdxR2MwRkRPZjlQaUlOZ3VHOXg0?=
 =?utf-8?B?QjFCcWVLSHo3MCtvQ00veGlsSXBOWUw4VkpaM09wVTZKNGpweTMwU1VsazI1?=
 =?utf-8?B?VXc5b2lCYlJJWGVmTEc5RURqN3E5eU5VT0NWVU1oQmpjaUdkNVJya3lrMWhP?=
 =?utf-8?B?K1lLLzhzT0w5cTVBdVptc01oNUp6WGJvSWEreGN1S0NYT3RleTkxQ0I1N1U3?=
 =?utf-8?B?aHFoMStIRk13NElhekxvbzIvSER6clh5eFJBNS9PRm9XdzBFWHJ4a1R6NFM5?=
 =?utf-8?B?VjhwLzJOeStLREpic0s5cXlxTjI1dVlacktWNjJwV0Rxd04xVWJ0Z2V0NVVJ?=
 =?utf-8?B?UWNQczRUM041ZmJCWUFwaHFoUUJWeVdESjdiSjRtaFBKdE1Iekt3V2tYM2NZ?=
 =?utf-8?B?Z0xUWHF6WmkxcExjOERpWkZDK1BUUmpIaEZzRlVXTDRZWFdaU0orMTNnWUlD?=
 =?utf-8?Q?QgvRsMq9VQnT9UeE4h7DLB32r?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c63b4a0-f35c-4a07-d062-08db5b78e9c3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 10:31:48.4436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AUrqkEsWXcB/6cJA3/Szj9K3I8Anr8vxg143LG+8T5pa9koTMI736Y2l8TBP+24LcN/c2Q5INash8HdJrprL5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10062

On 23.05.2023 12:21, Luca Fancellu wrote:
>> On 23 May 2023, at 11:02, Jan Beulich <jbeulich@suse.com> wrote:
>> On 23.05.2023 09:43, Luca Fancellu wrote:
>>> @@ -838,6 +838,22 @@ Controls for how dom0 is constructed on x86 systems.
>>>
>>>     If using this option is necessary to fix an issue, please report a bug.
>>>
>>> +Enables features on dom0 on Arm systems.
>>> +
>>> +*   The `sve` integer parameter enables Arm SVE usage for Dom0 domain and sets
>>> +    the maximum SVE vector length, the option is applicable only to AArch64
>>> +    guests.
>>
>> Why "guests"? Does the option affect more than Dom0?
> 
> I used “guests” because in my mind I was referring to all the aarch64 OS that can be used
> as control domain, I can change it if it sounds bad.

If you means OSes then better also say OSes. But maybe this doesn't need
specifically expressing, by saying e.g. "..., the option is applicable
only on AArch64"? Or can a Dom0 be 32-bit on Arm64 Xen?

>>> +    A value equal to 0 disables the feature, this is the default value.
>>> +    Values below 0 means the feature uses the maximum SVE vector length
>>> +    supported by hardware, if SVE is supported.
>>> +    Values above 0 explicitly set the maximum SVE vector length for Dom0,
>>> +    allowed values are from 128 to maximum 2048, being multiple of 128.
>>> +    Please note that when the user explicitly specifies the value, if that value
>>> +    is above the hardware supported maximum SVE vector length, the domain
>>> +    creation will fail and the system will stop, the same will occur if the
>>> +    option is provided with a non zero value, but the platform doesn't support
>>> +    SVE.
>>
>> Assuming this also covers the -1 case, I wonder if that isn't a little too
>> strict. "Maximum supported" imo can very well be 0.
> 
> Maximum supported, when platforms uses SVE, can be at minimum 128 by arm specs.

When there is SVE - sure. But when there's no SVE, 0 is kind of the implied
length. And I'd view a command line option value of -1 quite okay in that
case: They've asked for the maximum supported, so they'll get 0. No reason
to crash the system during boot.

Jan

