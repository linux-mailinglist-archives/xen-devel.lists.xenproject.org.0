Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E696E6EF030
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 10:24:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526561.818397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1praS3-0005Xp-TY; Wed, 26 Apr 2023 08:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526561.818397; Wed, 26 Apr 2023 08:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1praS3-0005VP-Ql; Wed, 26 Apr 2023 08:24:35 +0000
Received: by outflank-mailman (input) for mailman id 526561;
 Wed, 26 Apr 2023 08:24:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dTkW=AR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1praS3-0005V3-2n
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 08:24:35 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0619.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4e249d8-e40b-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 10:24:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7601.eurprd04.prod.outlook.com (2603:10a6:20b:285::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 08:24:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 08:24:30 +0000
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
X-Inumbo-ID: c4e249d8-e40b-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ij/HIrcqIBNfVJT5xixCnrTDjwdTIVVqqe6yviN1eJRY5VYOB2CKGJq3ANVf85MR9llI4bnwUQ0m2UoAt0cOtS0cKQONOu2UnKaIay4axssB4lAivnaqcmwoE1bYSZyLwXAHnfTUcknZAyhGt52OVYECpLO0VdcOnWR6XLJkLscbbOezZjGPdhCyVadGb+R1pODmFHQb6bWOsoYjqUAzZjIk2WHeygxxcU0mRZuJXj1so898NIGqxbhrzOK2oslzF/e2imEdtxdfGXmWIvHXpPYc9Wk6l7G3osrldPxsUkww5XruxV0l+aDZXE+0Rh3VsleDsGboG8gsNJ+yFE4Gsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxMlZJ8sld0LICCblQtk6hR1iDysMeak36xDyCTXStk=;
 b=XkVSaZELCE5cbq8+npunXOExfRwxKkXArM7Ek7q3K6BHO1YOOpXdlk5vg6gs3iH5YYJO/YWBHOFyM0y5P8wvkVwQ81j/iynmgxEDakHkQJCL6PlpU/AhFD6bP5aFmhsg+X3CgVjHu1ymZC3DRrpa+Lc7+3SC+SxklJkZlnss0fEQfWwMx+4fNrMU+V1l5Aeay4V+2Yc3ioQSLlh17AK3xwJiQxfxwsHCXTo1SJvAFwCa/Z5YbJbaOWsWrKxaGCoZXzjDMJXTpoCtyOaNTNvevE9J7MlheDJgpLcmrBDTv6awCGsqHunnlQozcQZcK6UOgPLjt2QYq2tgmToEaGoGtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxMlZJ8sld0LICCblQtk6hR1iDysMeak36xDyCTXStk=;
 b=2hvf8almezl7gaJ/VGfgDGc0tOzgoyzdFwORx95+OBr/Q6TC0VLMH1z85UjxDQHrsEYC3eEG9HHgdHCx/pCK0fumGl+TNb+POaZikPygVyu5V6QJx//ep6W84NjSxoJeseL0kPpjhiE9ycHfYHIWmIPoiN1GBnierZYBxqj+5Fx830eVyOytDg4yNKQnjLfsYXjCuhsTR9AVyKdwIoPBBJl2gBYvH8Qi0V34mNc7N4bZVAn8YDYtLV3PZ9k7yFp2bPYBp1pI17wls0lQ/Jf/OfHRrUTlPDFtyHY0O/Lxpf57BnSXaMDf8q13v2c/W7VDUKkfBzclvkcSqx3WbkdiIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b41e8eb0-a776-8924-429f-8abe7e70ead7@suse.com>
Date: Wed, 26 Apr 2023 10:24:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] ns16550: enable memory decoding on MMIO-based PCI
 console card
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <20230425143902.142571-1-marmarek@invisiblethingslab.com>
 <ZEjXNLAVCixClGyl@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZEjXNLAVCixClGyl@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7601:EE_
X-MS-Office365-Filtering-Correlation-Id: 619b9401-3af9-4ed3-52c6-08db462fa7ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2X5D0PCt/ec2nTrO5S/0FrUrhNCLpBm2AkiF4ggcKR2WfpSuPdSR945iZOEThwb7BWzwsEudYX/rgcCqEENKKNWLptxPh/0BiWiTVHSEJCt8LvO3KmkRxKWFcqo40KUrYskYnL9viAPiWYJh9tvuhAo/3KcJqCAgzlrMBOx97MKIFCKr72aAMU1IYFplgA+FIlMsl+M42aRIAv+na1Oc51vTqMs/WJs9icqPTXlXk6U7Yk3DCVsDrGWNfaHTbInE/3j5SrC8hZwhO7kIyoYyWPjGuq28FqCyl2ZE6k+qrhSeP7pjfPZvaqgB6+VCdDrhXTrlsYJPpY/B/oY8Oy2z0cSI3lwg0aZqbZhd60XlpCp7oKThlghFRc951Mbj1f359DlhH2DtB1bLfLnI+7qm8wkAzmiU44VNPqK3afjBsAKy1T4VLnyObgLr0l5oTGhZKHFAGTpTnX68i7RrWR1Ozk8ZPR02v3l1E78kTx0kBoikz8K8FjHKvqwjDmLy2KrsXFQ77vVKFNCb0Qm5e1rK29rDFStiTv0q6Rlay/Zwnlu3VMC+rUSRlrqS8GWZEBQJCRX9eiKclwwMVikoNa0jRoZi07NN2k0RqmqfwI1lFFMI0zIa88iJLKAi+WAAaTKtFlyaa2o5HaqennPQbwDtIw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(376002)(136003)(396003)(366004)(451199021)(38100700002)(5660300002)(2906002)(8936002)(8676002)(36756003)(86362001)(6506007)(31696002)(6486002)(26005)(6512007)(54906003)(478600001)(2616005)(31686004)(53546011)(186003)(66946007)(66476007)(66556008)(6916009)(41300700001)(4326008)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHJEUkt1VVhwbURwZFZSUmR6bDQ1Ui9KUnd0cE40OHhOTDVXeGgranZJa0lj?=
 =?utf-8?B?enV1M1ZmMGFDZjkxQ0J0OUgzZVppeDhaSzluMnZHUzlnWklTVHpTS0dENlhU?=
 =?utf-8?B?TEphRVNQNXhrd1BOZit0U21TZm0vK0I4bUFaQncrVktaOE9NZnlFb3oydDJZ?=
 =?utf-8?B?Q3ZsVVA2UFpUQXc3REhFUk5mU2srMzUwc1NTckY3eGljcEcxMVZUbFRMbWdZ?=
 =?utf-8?B?QlBVdXZLK3hmZkRQV0lXSmVRbXBWNnd1NHhUclJBY3hoV0Nwa0UxRExSaXpk?=
 =?utf-8?B?MEpPSmQ0V25ocFRyQVZIS2RiNlN2c1VVcW1VeHM1M3FELzl1Uys2R1B5dUFv?=
 =?utf-8?B?bHV1bGljbCt6R2l2QUVNOG5WQWJtVFNmOVJFVVd2dWhjTWhxMDZ4K29BWkpw?=
 =?utf-8?B?S0l6SGVTQXRxVVFkeEhsQkRNaGNXSFBuT1lvRVAwZ2RBN3V6WXVDL05oRU1Q?=
 =?utf-8?B?c1pkdG9GcUtxdENFUFN5bnpoNUhzQWxxSkRyNW1pdnlDYVpmZWdzbWJWM0xB?=
 =?utf-8?B?L3ZIckpFQ3hRbmVINDVEK2NBSG11MUZWVXh0NCtYWU1HTzcxWlFsLyt1NG9v?=
 =?utf-8?B?dW04NFpHNFFjNnlDUUZwUGIzVmpkcHM5bzdVQWpyRVpXOWI0QnpyMmh5c2Y2?=
 =?utf-8?B?L2dzU3haRlkreGJWVm5nalZaRmcrVXVQZFM3c1NKd3lYdkxDZnlPMVBueEhQ?=
 =?utf-8?B?QTNFTlFsRzV6U0RXSzJqRFo2SWxEQmIvcFA0SjA2VmJiWnJvZWFsb2hMKzFt?=
 =?utf-8?B?MExOOGowWXhFU2EyTDhDWGdYM3piOFFZeWFmZi9zZE1iU0FmaFFqZ3c5MFM2?=
 =?utf-8?B?WkhEd0Q3NE8zOUY4QStya0FxYjJkbTdNYWRrd2V2YUd1U0ErMUZhaW5CN2Nh?=
 =?utf-8?B?ZlZZc3ZCWTJ5aU5hY2FCMGlxYWZ6TmdYMEliUFF3Ujg0d21LQzBqL0tDQzBG?=
 =?utf-8?B?SVVKNUNoQXFvZkJOMlF3eWxiYW9TY1dCSE5hVkVleFhjcys0QW9VZFoxTUVM?=
 =?utf-8?B?cU1Ta3dPV1MvM3JGampOMFk1VWFNZitxT2ROekdYZFhuZTRoRjdwVURJamlm?=
 =?utf-8?B?Q2pZSlZmc1k1aDlIdzdxY3dVTVJ1cjMzeExITlM4c3JFVjk4d0ErSElLbWI5?=
 =?utf-8?B?aHJPMk4wNjQ0R1pwL2ZQbnFMMjBKNmNPMHdVZ0doazkzcjcyeTJZQXd1QXUz?=
 =?utf-8?B?bzEwaGRKekJVM3JzN1BBQlZhRmt0blNuaHhoUHo3Q3FkNkhjVGNNZEZjWHdB?=
 =?utf-8?B?all4YWNpMlpCUXlpYysxT25sejBkdUk4ME0wT1U3Q2o3Njh0aUJydnVuWlk1?=
 =?utf-8?B?Ukx4bXc0Tythd2VtZ2dMajcwcVNOZkhOemU1Z2xBM0MvV3NnczVZTFV2N0Yr?=
 =?utf-8?B?ek5Rb1ZMbjQ1WEdLZ05VMVFJUWxHMkN1QnNtWGFaeVpFTmFqU1VXZlpESVRs?=
 =?utf-8?B?UzY5Z2RHem9VQnNYTDNPU25BRVd6dU51dkRnQnRYYy9rejdUcEwxV3ZWRGkw?=
 =?utf-8?B?SEIxbk5SNkc0bXlxbEJ2cTNnWWJsUkkwOFRpdlliYW8ydE5ueFBuSzRkTW80?=
 =?utf-8?B?SUdvMEticUZPZkZxQmpMZUI3Zk9aREJJdHN4ZUNMR3J6bDF1WU01MkRYYmor?=
 =?utf-8?B?UVM5LzdWbklUVGMvWC9mNkpFQjU4cnlhOEh2RDJPMmwyZzBqTDhCclRVYVhH?=
 =?utf-8?B?VElWUVVqcXBGZGsxcmFkb0N1czFwc0p4cGk0N0xpUXdVRUQvdmZUU2pEdld2?=
 =?utf-8?B?SnFWZDhlRTlCVW9YWnhSYzNXSHFJd2xNNjJWZ256T1hsK3NjQkxSaktheEVy?=
 =?utf-8?B?QmZ1NFlURVoyZHF2UXRRNEZlc2FtVFRKa2tJdjdqWWhZWVFvV0diWHBtdWw4?=
 =?utf-8?B?dE9wczhmRVQ0MzIveFpYNnF4Rk5PbS90Vk90NkdZZ0FpSnRsM2RydFFqSVVh?=
 =?utf-8?B?M2dhU21RVTZrQWJnWDNtL1NHSzIra09lUDM1S0lQNVo4Q2pFUTBadmJjRndM?=
 =?utf-8?B?OVBCTE1HVUtLb3hqTXoyS2d2MkJuL0JlYmRjc1piNERQWU1VUUFjMjNBQjVL?=
 =?utf-8?B?U09Kam1aS1c5SzJwN3RnQjdQSjFkMm5MU3BMNUFYdFlkY1VwVXYvQjRuNGFU?=
 =?utf-8?Q?eFfO9pldY7BmGAOtTjFeEEmF1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 619b9401-3af9-4ed3-52c6-08db462fa7ef
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 08:24:29.9640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m9AcWSpl/+EHFmpHyTlizz7+oZMKvafuWhDDO3avs6Lj20nM2loxj1pHDH+KNc4Tjqg8hctz9Ss5QLeTQPxuwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7601

On 26.04.2023 09:48, Roger Pau Monné wrote:
> On Tue, Apr 25, 2023 at 04:39:02PM +0200, Marek Marczykowski-Górecki wrote:
>> --- a/xen/drivers/char/ns16550.c
>> +++ b/xen/drivers/char/ns16550.c
>> @@ -272,7 +272,15 @@ static int cf_check ns16550_getc(struct serial_port *port, char *pc)
>>  static void pci_serial_early_init(struct ns16550 *uart)
>>  {
>>  #ifdef NS16550_PCI
>> -    if ( !uart->ps_bdf_enable || uart->io_base >= 0x10000 )
>> +    if ( uart->bar )
>> +    {
>> +        pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
>> +                                  uart->ps_bdf[2]),
>> +                         PCI_COMMAND, PCI_COMMAND_MEMORY);
> 
> Don't you want to read the current command register first and just
> or PCI_COMMAND_MEMORY?
> 
> I see that for IO decoding we already do it this way, but I'm not sure
> whether it could cause issues down the road by unintentionally
> disabling command flags.

Quite some time ago I asked myself the same question when seeing that
code, but I concluded that perhaps none of the bits are really sensible
to be set for a device as simple as a serial one. I'm actually thinking
that for such a device to be used during early boot, it might even be
helpful if bits like PARITY or SERR get cleared. (Of course if any of
that was really the intention of the change introducing that code, it
should have come with a code comment.)

Jan

