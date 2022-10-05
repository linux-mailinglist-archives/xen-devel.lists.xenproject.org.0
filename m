Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BED85F5433
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 14:10:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416139.660777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og3Dd-0000at-RQ; Wed, 05 Oct 2022 12:09:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416139.660777; Wed, 05 Oct 2022 12:09:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og3Dd-0000Xi-NM; Wed, 05 Oct 2022 12:09:45 +0000
Received: by outflank-mailman (input) for mailman id 416139;
 Wed, 05 Oct 2022 12:09:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L813=2G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1og3Db-0000Xc-Ua
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 12:09:43 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70043.outbound.protection.outlook.com [40.107.7.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 982e42ec-44a6-11ed-964a-05401a9f4f97;
 Wed, 05 Oct 2022 14:09:43 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7016.eurprd04.prod.outlook.com (2603:10a6:20b:11e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Wed, 5 Oct
 2022 12:09:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.031; Wed, 5 Oct 2022
 12:09:41 +0000
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
X-Inumbo-ID: 982e42ec-44a6-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJykIicEqWhK3yTXVQAO6b3ykIV+g5uzTm2NR663zrOjmKMI52DGbiNkGQuYgKkh3s4cGfDGzIWAANX5Fr3WoyhDL6yL9mOL9VWqiSL25j2eYT8tqhtMfVpJIiBhT4D69wpS/6VZEa0uocOpQZXRuKhvkal6GdWhm7UQ4S6IqpfMeV9DWlijhMBcmXIncuXFd5swgwF59t7602uQ44AW1l+rQWltxhMBnbpbvWfqRTWHVTKkeYapgujH8caGoEn4YMcIKt1TC3sn5FTpPbDylKf6Elv56Hk3NX0orqsTw2MsHBEeB7YRgnFtqb4j3dyoeffvRpx0UvyOktH7yhpHSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4+mzrlVX96OoGOGi2TAHnEtmXGsumBw7qZGGLWRoRw=;
 b=TL3mzHZ9teNuUQzbf65Cxbj82D8jversZVXVYVXo4sLn9VEGHQezPuAPRlWt2MqBQ5BNE/ummshtpUxlzjACKJBUe2POxKuLf58D/Lwoe374Gso4GnsUY6p87H0yyg5/uFmpzvscat1xGX0BJmLvmgLouJ0/C4+JnIiWCrRrwQ60Tsg5cTLbiUNqIAcX/fMJS5Jm3e4IGzZI3yhWx6CKW2mK9CafzxD9I5JcrPdnejZM5MPbWUz6m6QH72p64MG+0G0CXUBWcNxj/Cydpyx+YTwMMOgtOvF8ilbuHXEKfH2I/qfD0LqCy0LZ15Z8M4YcEcC4mBvL2etOgEd7QDjMkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x4+mzrlVX96OoGOGi2TAHnEtmXGsumBw7qZGGLWRoRw=;
 b=2uGR3rNQOh7au8P6Srq0Ov5l1JJ97alHhyTCpCaphZFTM9yF3fZJKQWeAH5uBdqE8PTJy8W3QWkcXvxA5t7CsrvaK8yoS1hlao6xHAjKDMuwBOZMhheZv3E0uv25lumkq4Vv1rDTUXa0gSxpN3RUkDnd0QbioX5/QcSvgDat5mnKnoquo2EnKmNVFzOxaBcUrPEE3Z/mZXws9ni1eYJoNSbzDKVPEI5s+n4JcfkxuFGSrifWcpdYX96J5YvEkfY/UNjmFv7DceyNaStYhQjDlLQ+HG1euvuA7xNJU22wjk8mcMiFBSaIdJf3XD057GOaQx0mGJzHNFC+RJve7gTw2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <272c62a7-798b-1b00-0a4a-1eb18f480798@suse.com>
Date: Wed, 5 Oct 2022 14:09:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/2] x86: Activate Data Operand Invariant Timing Mode by
 default
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>
References: <20221004160810.25364-1-andrew.cooper3@citrix.com>
 <20221004160810.25364-3-andrew.cooper3@citrix.com>
 <Yz1aZJx5AZae/2U5@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yz1aZJx5AZae/2U5@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0573.eurprd06.prod.outlook.com
 (2603:10a6:20b:486::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7016:EE_
X-MS-Office365-Filtering-Correlation-Id: 09fe18fe-66bd-4827-babd-08daa6ca7b99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hRDsH4GSWas4ohsxgmP3tYCJB36nJkXiVcXjJ/2xMhL1Xh/lGeXiUs4Ih1upqapWQLsmRY6rWh9Ra9phszcllXtvWyQRZtHL2DVjeMQWn0gOOeAOKLSjMa3BXOkMQDC6OUfMZwPa/gSjwn+uBGpkfIrQ5oa9gf30xGMflJnR2W4HFouGJp1TmBbWjuJj4B18I1N+Rc1dga5eKjLwdSzGtEgKkrY1KDZJ6I584bLVo78Ti+3IdTDgKpaSrzsLC6ztY6ME9Wk6pgYhxhMyXj5eGF8Gv3/muzjyI9jK2GL8S1WqJhD4YAuKIFRF1BavYvH7C22R1g6ExU0xPSwp03U9FdmS+QSwGnUALx0Ejks8l9vm1G/DKo2PzGJG+/AUziCxA1L66LPHEqfHZqce6/xoHjPyMsh7pWGVvbmND2YEOuekm+1FukRPxGiozTdgglZWOO8+g9FhOPVw2xJwBfLGdZnwBfHZCCQ4jNr2ggneFTsw6FNYTVLhtevjxRiB8+wrvt16tpK9WbQUYvE2m77wEDkO1c9eKpmnrEKWrcSlmKvK4rHP5BWCzCKb+0gAfhgk2Hip7nsKaS8ASN3uINfmYyj25C1WDMRMR59c+M0tlGyZnLgdoNfK5sZ2YdzKSukMa1r0fRnwBhuhi9JlsJszjO+nHPc3N+aBy6wJe9I0atT9TtpP8/PtCBiZswPxgaINExKkqXDBYAqYcNO+/J3GEdL/RXi8ROKX9AUjEUmHFtYet5VgNl0K+SjEBsr2XWDv81XRGBOjiuYgKb1RFxAODiS2Ogso5t97NA/kf3BRCQg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(346002)(376002)(39850400004)(396003)(451199015)(86362001)(5660300002)(4326008)(186003)(2616005)(8676002)(66946007)(36756003)(38100700002)(8936002)(2906002)(31696002)(31686004)(41300700001)(66556008)(66476007)(478600001)(54906003)(110136005)(316002)(6506007)(6512007)(26005)(53546011)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEUyTkh3M2dpc29aOXc0cHQ2UUZQOS9YaUpGQXRjeU5sbGlsdXMyL0thTVNG?=
 =?utf-8?B?NEk1UGx2WHVJVUw2cjZNbjdnTzI4S1RrZ05maTJwR0U2WG5KendvdGVRR09k?=
 =?utf-8?B?OXVKRnBCbTd3djRiUkpuSVVzNVhGV3R3eGgzdXZvMU1zVmN1aEx1QUZPcTFv?=
 =?utf-8?B?amxCZG45TGNHMGEvcGpVUlJSMHdWVEQyTXRFbnBCTVk3RnAxaHF1QnNpVnZI?=
 =?utf-8?B?Z1N4WXRwUlE5TW9zKzkzclNOTlBHSDF3NjFJa1BtczBaNlpNM3NvT082d3FQ?=
 =?utf-8?B?L3VjSnBtcFBtUDBmS3N0VUNKK3BmZUNlSGNEVDVtYnZSaTdDTnE2Tk9waTQ4?=
 =?utf-8?B?UEZrYVdFMnBlMkgwTEVmK2RoWU15TXNpZnJhZ1BOczFScThMWitCUnk2b0VC?=
 =?utf-8?B?Q21KQWhSWHBvc3lKM21naFB4SURkbWQ2QUcwTk1pbytBeXlmdmF2RTVEbTds?=
 =?utf-8?B?Y1JqdUVKQmJkbEpKWnFnVitwdlRIbGJEb2hwNm5EWXpxSmdJTVFTN3NaM3Zu?=
 =?utf-8?B?SFFlOElSaXJJZXNoQUFoU2lDTmorczlqK0ZMWE41YktwNTVNcTJ2M2tQdUZw?=
 =?utf-8?B?eXE4b0Y5Um1vTGhlQkpjWFBvZ1EwUnJHR2VvRGtsRHBnbENuWHlOdWNuQUhD?=
 =?utf-8?B?WXI3d1hWTmVnT2JOWi9Bd1N4bDdDaThOUTQvcjU2U3dpalR5ZktTanBqblQ1?=
 =?utf-8?B?clM2eHovTEUyNmFlZXhmeHFqdTdZa2hNSjY4MXllRDIySnlDaVZVS0xCTFNi?=
 =?utf-8?B?UFFvdWxHL2M3S1RCVGczbmRVaUYyY2ZWZ1czM3crdzkwVDRrVVlnT0xkL08w?=
 =?utf-8?B?L2tnUVFvN0t1SU5ZUmpSdXFialUwajh2RU85U2RZUnJCdFZXQW9JYnFiUm1P?=
 =?utf-8?B?MEdtaHlpUUJieXQ3S3FOQk9tbkFreVhqZW9GT3l4bE1XVy96RTFSWFZtc1pz?=
 =?utf-8?B?eWdGMTBpYWhPR25LUUYwZWhWSWFSaWlVWXJyc3I0MUhSb2RaSmY4QUwvblVr?=
 =?utf-8?B?YUt0YlVaUjh3RFNxMWdCalhmaEdrR2dDNE92QjNIaFZzUWpFejBpeVYvSkdK?=
 =?utf-8?B?ZmRaRFFoeU1aM2lNaTRDTlFUL0I0SG1rbVNBNFhma3hncXZqNzAvZzVtR0Vv?=
 =?utf-8?B?S3B6b3BrVXdpb2VvYkV3eWVUZUdVdzFsNUhQaHpnUjVHK2wzUE14ZmJhaWEx?=
 =?utf-8?B?WC84UGN1c1BlZTBrZFZrWWtyb3lLNTFHL3gxS29SSkhCVVZNZkN6ajd1WDRH?=
 =?utf-8?B?ODBBQVhVVDE0Mmo2alBRMS9LZTVQSVZodTNUbnJSYTNZRndNcC9MT25qaGFm?=
 =?utf-8?B?S21menMzeVdINCt6cjZYbHZkRWxVWTFjYmFlc3J6VVNqdjlad1BKM3hZVitl?=
 =?utf-8?B?Q0lPazJGY2dCNnI1cXArQW1ETHRPT0hhYm1aektSVVZHQUlzVk4xWHRMNVRU?=
 =?utf-8?B?ZmlzOENXR3dhMUJscHpxRndxYmVxeFI0WjBxRExleWtUclp0MXhFaFVJcWtH?=
 =?utf-8?B?OXAwR1hhbE1aZnBUMHkwMGYvYUVNV2pwblZUSlhJaGpoenh6RjZWbGtzWEZR?=
 =?utf-8?B?RWxWYUtKUEJBbCtCRmp2Z3lvdTZKQmR6a0NJMXNXWWJndXJVOWhSNVhLY255?=
 =?utf-8?B?SlJFN3Z6UnV0YXdDMWkyaUV1cXZ0aldtYnloMWZoaHpQenpmNWxLSnNNanJV?=
 =?utf-8?B?ejNYbnc5Zi83OHFlcFJhUk5ZNXJ6ODVBSDBXV0dMRmdEM2xUVW80N1dTTllZ?=
 =?utf-8?B?U2RZYUNPMkxLWTJvL1FuUDJXSWFLNHpqRzBTUkkxb2dOaDJLOEpLd0dBODU2?=
 =?utf-8?B?eE5iamhWMWdJdVpMNTRleWh5VHlSOXc3eGlNQlhDSHI2cE1wSGoweU1CbHVL?=
 =?utf-8?B?VWhXb1lMUzF6OXBhUU52c3pEMjVkTHlVQlducXVUbjlzQmZxOHUydlNnN0My?=
 =?utf-8?B?anF2R2N2c1lIVXBlS3FoRFU4cTFZNTRwSG1OQkpMcEJaZUhCdHV3ZTQ3QmU2?=
 =?utf-8?B?UW0zWWltWmNpWjQ0eTRwU3dycE8rMkljYk9YV0FseVRXZ2o3cnFWYXRrbm95?=
 =?utf-8?B?bExPS05PKzZLWWR5U0tRT2FFOW9hbVRXNlFSUXY1MUVOaDhmaEo1MFpoZU5m?=
 =?utf-8?Q?SKyBEPwkkZVFh0GlZxCk7khhT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09fe18fe-66bd-4827-babd-08daa6ca7b99
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 12:09:41.5029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +RTFsF9ERBjwRpTHO+EFwmcdIAAExbwAcg9iXJ644Sdzw/6/W6DmdIYqUuHPtQUfXzKEa1lRlh/gqrdVQna5Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7016

On 05.10.2022 12:20, Roger Pau Monné wrote:
> On Tue, Oct 04, 2022 at 05:08:10PM +0100, Andrew Cooper wrote:
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -209,6 +209,34 @@ void ctxt_switch_levelling(const struct vcpu *next)
>>  		alternative_vcall(ctxt_switch_masking, next);
>>  }
>>  
>> +bool __ro_after_init opt_doitm = true;
>> +
>> +static void doitm_init(void)
>> +{
>> +    uint64_t val;
>> +
>> +    if ( !opt_doitm || !cpu_has_arch_caps )
>> +        return;
>> +
>> +    rdmsrl(MSR_ARCH_CAPABILITIES, val);
>> +    if ( !(val & ARCH_CAPS_DOITM) )
>> +        return;
>> +
>> +    /*
>> +     * We are currently unable to enumerate MSR_ARCH_CAPS to guest.  As a
>> +     * consequence, guest kernels will believe they're safe even when they are
>> +     * not.
>> +     *
>> +     * Until we can enumerate DOITM properly for guests, set it unilaterally.
>> +     * This prevents otherwise-correct crypto from becoming vulnerable to
>> +     * timing sidechannels.
>> +     */
>> +
>> +    rdmsrl(MSR_UARCH_MISC_CTRL, val);
>> +    val |= UARCH_CTRL_DOITM;
>> +    wrmsrl(MSR_UARCH_MISC_CTRL, val);
> 
> Is it possible for the firmware to have enabled DOITM and Xen needing to
> clear it if !opt_doitm?

I think a firmware setup option is quite plausible to expect, such that
safety can also be achieved underneath an unaware OS. Note how in my
earlier patch I did specifically set the bit both ways, for this very
reason.

Jan

