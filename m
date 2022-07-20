Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B801257B1BD
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 09:28:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371421.603334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE46w-00080A-4r; Wed, 20 Jul 2022 07:27:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371421.603334; Wed, 20 Jul 2022 07:27:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE46w-0007xQ-1U; Wed, 20 Jul 2022 07:27:10 +0000
Received: by outflank-mailman (input) for mailman id 371421;
 Wed, 20 Jul 2022 07:27:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H1QO=XZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oE46u-0007xK-IY
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 07:27:08 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10073.outbound.protection.outlook.com [40.107.1.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bb74eba-07fd-11ed-bd2d-47488cf2e6aa;
 Wed, 20 Jul 2022 09:27:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8451.eurprd04.prod.outlook.com (2603:10a6:20b:347::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Wed, 20 Jul
 2022 07:27:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 07:27:04 +0000
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
X-Inumbo-ID: 5bb74eba-07fd-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pk8j8xdqh16rT+vy+lRDLwkkGUNRKtmhGhtOo37kSZtZME8eSDPV3dzKXVyIc0eAj7DT5xa7qEAhdGMUP6U+s2UtI5fYV58D+xC0KMizRoxtJ4cG+fHPGkb2CZ4bBr9qUN3wxSTO0cbxNBed0t9HsICmvqf2nzULOKvA6Pfd7zQyu62yL1dKzeWoV/ccz3sCQHGTx+FsQ7yKhWW6FafZkKJmfNLtCuOPKPe45EvRr5Ud0OYuB1So4Piych++9yRh2kMPQQtXg9bbii0rxvXerOcgUlaFwtxFqJKpjGmCPnoZGdMXXB4MaIMclXKYO1HSl9x8MNF3MJo3Sj1cnIdOyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wej7D2PPP022yB4o0M5gh/c5kG3KcO0qdL9cLY/AVQ=;
 b=Po4L7lMt/enePW1gLUD/4A5CjhH2a4lYSa5OhozSKViFgb8eGk/yqLK5xY6myap3QmPX249Qe8upTvC4YxFwlxy7o+QwKBF8FVzRLC3hu+nczcQdN/3Z3pc+8HsG+IbssLnYRCIO4zIAdfOzJYrhJsKtCDGm9NQzt410yJWJ3VRzMENaNHwRVgz3C4epBSwhzYLX49bmt/i1pFjgQAf0DcT5dJ+gZ93i8GCdQ/yptirqBMln6v0VJ5qBDAJpV+pbmKNaoR3oWi6Ww/C/Pv5+EIMhHWyZgxoeHh9uNYiatugkIttC/qsRoYvB1IEgSNMDNh6DyYi/qTOCox5Buk63+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wej7D2PPP022yB4o0M5gh/c5kG3KcO0qdL9cLY/AVQ=;
 b=P25nkh4xSg8bc2pjbC2OVk+uxAbwx6dFgsjN8djED7CIkVaGsypM8KwepSSegvKbQD5Vi5NVfwUDFx9aNqcl8nJ4LL5LxE4yM+YMN/ZAG6iL7PHWp789tKi6hA9YTbWTlc93Xjocyp2HwVq+xIgN+hTYCOavivgbeiA+8+BdEGStqN6gBFtDhBEN+nlwxTO4M2TkgReCqL1o2SsYNTCte8tO36buM8YZKPVIWL1npRXHdjwzGbeeGamcMDBEfn0jPLzkdrANedlhASg5btU4FTZ9Q3uMfBvohS5NEEp1q35lxHp98UScEbF1Uh6dqfBKqwVrRY4VPZZDAoSO/Jc9BA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6cc461b1-e308-0e2f-3f78-caf491095042@suse.com>
Date: Wed, 20 Jul 2022 09:27:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 01/18] kconfig: allow configuration of maximum modules
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-2-dpsmith@apertussolutions.com>
 <59114d3a-b9fe-1fb0-fac3-fe14fe4c505f@suse.com>
 <e6484f17-b79f-35c7-2d1d-d03bae7c0973@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e6484f17-b79f-35c7-2d1d-d03bae7c0973@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0014.eurprd03.prod.outlook.com
 (2603:10a6:206:14::27) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68c8f107-7383-4c01-daef-08da6a213ec5
X-MS-TrafficTypeDiagnostic: AS8PR04MB8451:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F64ABYfzKj7z/DAjj38jBzo98Z8doe1wGc4Uve68kglwjyi7dtYDqDacTOEtlqYp8kA4HPQmeAcqCquKp+CmbS5l050f+ZvM6LE3XtuuQXj3hDhC57OdHJ+UGb1LkdDmLHRdMda5mxTf9T+EO+q8Py83eyado8LMmhaJKWLxOTEgK/rnnYKnCEtM2xRODxI1/wZvmsdoKc1gVQThae0QmdIu593/EaIFQgSpHpqD0aiDch1MX1zY+3C4uU7mQZcqtAL512ALOkkq3Likdc/4bP7TKuHkxR0l69hece/Z43IXq79WMJs1rYwpPhZXbQvQKeiSant9BNzpgzIUOmlOKzXYYgC6vwxhaQC3exkCVA9zzrZ9R0zv+BH2gohvlZCoVHG+wtBhJZ12aJs8E+xnINiQLNnJy/vSJEp4eeqSGCLhv29JoiCcTorkvJHnMVfSsnEyCBjpe0lvbY0bYTem2p4uxGQDyKj8GYm0WSM/GntVJos1S0MwaNKjSta9ZfUuu27IYVZy5Z5WBuKZkiHV9OcKkvc+a7MYKjLXPstjomrU8eYplY2zRyNCwgJcIwG2fH8yMdAov5gLsdb0p8DlYdS9zlM7Y3tsqJETlvXlwxzhtM5ihhVN1G1oUmi5k5uXFK9YzVPfKaTRe7IS/FyUdm/j/BqO9YhJ43myvagCEIAFUkvVCWGTvS5VzxHhTe2x05A+qctNf03hPaE4Wt1spNJxa27UAy6TPEHjgyZv4vHxnXFMYD1I6PyQXSH3EjBk8UYT2EsIwVlX7QVHgZX37Z9EnpeJ4J5jr0TGMuseU1cX/UB3AKXGed1Ggz+Df0xOynMJ55ZEPJbPIUxJoqm0aA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(346002)(39860400002)(376002)(366004)(186003)(6512007)(2616005)(66946007)(83380400001)(316002)(6916009)(5660300002)(66556008)(66476007)(4326008)(8936002)(8676002)(36756003)(54906003)(7416002)(478600001)(6486002)(6506007)(53546011)(41300700001)(26005)(2906002)(31686004)(86362001)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjhQTTE1ejhuRFR4ajB6elVsZlFSSjdOa3NPRC9yVUxCUVhyQ0hRMUFGbzh1?=
 =?utf-8?B?cEIxdER4VC9rTU9WOGlYTWpyc2dQSWVrWmhmTldjNSt6amFDbFAyQ2tUZ2Nu?=
 =?utf-8?B?aVpWNmxxbGRPd1NIYUpRcVJkQ2lvUWhTU3NmNlhkZlpzRFBlTkk5RzJWYjBj?=
 =?utf-8?B?SGZ3cWxOdWVVREFJYUp4RFB1QnRUQ2FSa3pPVEpodkliWTFNZ0pFRCswdmQ0?=
 =?utf-8?B?V1RuaUNUSWM2MjYwTG53WHlFdEFnQzVpaSs2RTRrTEJkOXc1SVZvWG02OVlv?=
 =?utf-8?B?WER5aTkvYjJ3cXA4a2NNWE10YWFZQ0FCeFdPbzZsdnRVb3kzY1dCekthZTJY?=
 =?utf-8?B?UTNUN2pNZmwvWnBWSUE3ck5WczNYbjRYQWt1V3JlQWRUdGFXOG9aTzhXSEpO?=
 =?utf-8?B?VW51Z2tTUVA5RnBUd2s2bm9pZVNCdjZkK2dab1pET2RYb25IM2YxaU9qSEt5?=
 =?utf-8?B?c0VoQkhISVp2ZThjeWUyTnNtaVlobm1vS3VuMnAzRnBwZ05NNXU0YUtUcjFP?=
 =?utf-8?B?RFVwdXdPUG5udVhISk84Vm1HdjBod2JTOU5MakdNR1dMTkJ5TTJmZWN2blFK?=
 =?utf-8?B?cFV4MGRYSVVBNGtuUEN1TjAzR1BQNFZMWHFGVzd1anpLZlRVcjVuVzMrOFFi?=
 =?utf-8?B?aXhzcFFYNXBCU1BjL2R1UUpkRjJnQ084S3JsMC82eUhKM243NTVCSitOSEpt?=
 =?utf-8?B?Z1NoNGh6bzI4S0s2UnNSRStBRUpHUkl5Y2ZHMGtmTGF5ME1ldmxlVHYvVm9v?=
 =?utf-8?B?ejlLSXlMMmZVOTVKOE5TMzFRME5Xb1lSclIwWXplbkg2ZVhSaVl4SnhReHE2?=
 =?utf-8?B?dkZKQ2NzRDVsSU9wdW80Q1dNYmwycDc5QW1VOHF6WWRXL2srSGtGVVF5NEJy?=
 =?utf-8?B?UEorMlg4dG9pMiszcFlQSUtrMFQ3aWVYWW1Yb2d2L2xlcjFDN2ZISlQ5TU1M?=
 =?utf-8?B?RVBwWG5UQ1hkOXJFeFhhZDJheGN4aVViMFN4KzY1M3VteXRGVlJMUlJ5cmdT?=
 =?utf-8?B?NE9kWFRDMXBOQnF6VkRlNUYvMFo5TjJzb1RSK2xGSForbitFN1pnd2lhVVBW?=
 =?utf-8?B?VTNJVmZ0MTh1UHhXVGFzU3lIYzNjUU1lQnF5c3E1ZmRvaDhlWGorMVB1aWJ0?=
 =?utf-8?B?U1JqNTFjTXRUa0lTMy9TSkdrVEE4Qm1acFJCQTBTeG5waHJFVm1scXBCaFk2?=
 =?utf-8?B?YVNYRjIxLzBFOXBrTWpkLzhoS1lhYU5wRVY0NVljSmdWVWNhYjVVbjZMVlRJ?=
 =?utf-8?B?d2UxM3krRUFOakhUUGN5enFIL2NDbU5iWmQwUi93aXdOaDY5ZmplM0k0em5x?=
 =?utf-8?B?TkJqdzRsRTBwWk9jeFU1MjAvcWhzb1lMSUllcEs5bDdlVktRMkJndHJlMDUv?=
 =?utf-8?B?a0ZKbFBXbkFPOC83UkhsdlorNllPaGQ3elNYb1hYbkZtN1Z6T3JIMk5pekow?=
 =?utf-8?B?S0N5aG5LRkRETTB2YUlXb3piaHJ1OTAva0tIQVRKUzNoZWZ5c3AwT0doS2hF?=
 =?utf-8?B?RnpCeEN1Z2lUcStNbzhCZ0E1ZHB3QU1OSzR0S1pNRElrS3lkQy9YKys4Z3BG?=
 =?utf-8?B?UGhxNXlWZFVSdkNKZ25WRFZYMitBaTYzb1FBdm1zcTgvR0lQQk9YNlk1ZVBO?=
 =?utf-8?B?Y2o2bzhIbk1KUGZFU3pHOXUzZHRiWitlYXNWdjlJQVJaU3RnemZRVkFGZUMy?=
 =?utf-8?B?VExUQ0dBM21LWXhtNWRBUnpsdEFiRXNsa0daZVB1elBVRzBMR1YxcHdYVFFs?=
 =?utf-8?B?Y0twVHVrbVExQ2YyZVBQbnZPNEpvUk5PZ0F6S1RPT204NlhzMXJaM210VDlJ?=
 =?utf-8?B?a3VzMzgwNGxMM25uVGJMY3ZtdUtiOFUvTVg0aWhEazE5NWlzVDlDUms4dGhi?=
 =?utf-8?B?VEJoc21RTVBxNHhISmE5UUxNeDMyZ1IyNVljUk9PSm9WWUJieWIrWDFqZ3F2?=
 =?utf-8?B?UDJuU1FSLzlvK01EdWMrYXFsVTBGTllmVjBBM1JSVTU4N0ZVL1Y4c21weklx?=
 =?utf-8?B?czNPOXd3emkyZ1lieGxRMWtSM0htb3VRUVljVHhtTXpwbVJPNWgvcnJPRUVD?=
 =?utf-8?B?UFNMZUpuZ2UrK2tMc25MeG9aaTlJWXRFbFR2RzdwRWhKWjZ0S2JlZC9Ya0oz?=
 =?utf-8?Q?uDNtNk54ECdpHn6tWrt0wckwP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c8f107-7383-4c01-daef-08da6a213ec5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 07:27:04.7371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32X3kBWICBkgkVoTT0ZGwrEWJkDlyewrQtRvLOU8WB2E8N26wsF5zLXAIQXwOM4aCbwy0pUbqC9yhQk8xgYjlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8451

On 19.07.2022 19:02, Daniel P. Smith wrote:
> On 7/19/22 05:32, Jan Beulich wrote:
>> On 06.07.2022 23:04, Daniel P. Smith wrote:
>>> --- a/xen/arch/x86/efi/efi-boot.h
>>> +++ b/xen/arch/x86/efi/efi-boot.h
>>> @@ -18,7 +18,7 @@ static multiboot_info_t __initdata mbi = {
>>>   * The array size needs to be one larger than the number of modules we
>>>   * support - see __start_xen().
>>>   */
>>> -static module_t __initdata mb_modules[5];
>>> +static module_t __initdata mb_modules[CONFIG_NR_BOOTMODS + 1];
>>
>> If the build admin selected 1, I'm pretty sure about nothing would work.
>> I think you want max(5, CONFIG_NR_BOOTMODS) or
>> max(4, CONFIG_NR_BOOTMODS) + 1 here and ...
> 
> Actually, I reasoned this out and 1 is in fact a valid value. It would
> mean Xen + Dom0 Linux kernel with embedded initramfs with no externally
> loaded XSM policy and no boot time microcode patching. This is a working
> configuration, but open to debate if it is a desirable configuration.
> The question is whether it is desired to block someone from building
> such a configuration, or any number between 1 and 4. If the answer is
> yes, then why not just set the lower bound of the range in the Kconfig
> file instead of having to maintain a hard-coded lower bound in a max
> marco across multiple locations?

While I'd be fine with the lower bounds being raised, I wouldn't be very
happy with seeing those lower bounds becoming arch-specific.

Jan

