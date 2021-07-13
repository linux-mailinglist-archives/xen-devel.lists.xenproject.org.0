Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCCF3C7358
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 17:34:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155490.287019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3KQ7-0000YT-RF; Tue, 13 Jul 2021 15:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155490.287019; Tue, 13 Jul 2021 15:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3KQ7-0000Uy-Nr; Tue, 13 Jul 2021 15:34:03 +0000
Received: by outflank-mailman (input) for mailman id 155490;
 Tue, 13 Jul 2021 15:34:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3KQ5-0000Us-Nq
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 15:34:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be589754-e3ef-11eb-8775-12813bfff9fa;
 Tue, 13 Jul 2021 15:34:00 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-L--j-kVZOHSNMxT4wy1I0Q-1; Tue, 13 Jul 2021 17:33:58 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5470.eurprd04.prod.outlook.com (2603:10a6:803:d6::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Tue, 13 Jul
 2021 15:33:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 15:33:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0185.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.21 via Frontend Transport; Tue, 13 Jul 2021 15:33:55 +0000
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
X-Inumbo-ID: be589754-e3ef-11eb-8775-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626190439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dnXGTv3FQadO8NOCbKMdMebJy20YymrXYr8MzcF5cd0=;
	b=VT1+q2/hqmKG1YIBmyBnJVU/GLtsOOG+gdx2k5Tc1kp2hMf+6ALR1a1rDY4YCpJ5lDi1qs
	avdf33TaAp59UKChDXfDKomv0UcsBCUMTQa2wq3MQv4qEGhQskvmDNmyTyV/p/Sf6Hn6hh
	7bAJErS+PY1QwmEG3ulurLdOlPrayLw=
X-MC-Unique: L--j-kVZOHSNMxT4wy1I0Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzx0kYg7WhknrZwAVzhBek/MgNLW97gvSNexEQIt2wPVUsEjkK3fa0IRbhNyih8h67Q6hodgqiq1d8CFEVlsXLitlQurG98mys4DTFpfRyXia9kgyphl9HCp2b4G/VwxRI7CMjt8IHo/piujmSut0IWl3KRL3UVvqwkN055Y4arQdcHhleEpgwYAoyxbxBV09h9TXjPBsxUrInSyNBkxN4AAagQtJHVL9xUaeBE9exjRCBEl6hz+j5uC4OEQqKXmr/Jwr3vahFXyVb30yGc1PI9xWco8IHO2xempj+0is6lR4T2Ad9iglvp2CPwxGgy3A2JD2apmkux0Ug8BdcKdLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnXGTv3FQadO8NOCbKMdMebJy20YymrXYr8MzcF5cd0=;
 b=k1GVdo+ecApBEQQJJyOoXgM4AlSe35HY2WiSCWtljIqSuBDh8/zH0hbqVEz2hs9L9Ys5jXaf2quJP0Ge3+rUMf1SpGixCdbSLNaorxBldy55z0o1lwOYHVmSehwPyArMVht9vUZN2gc4idIwTFdqYkWxEd77/LL3cLaom5oZtqvhsIf4na/RQN+C3jouro0AQJB8cGZue25KD0CUGakCmp3QwTcDUTi9L4WNbGeAER6bwrFouef6Gj5CSESgUlnIrZBCo/WnC3H0LYzcsSX0adxak3esXe1hD7VnQKHRB6DifoFVIebqfN1KwRTpRQid9z+49Wk/I2gY0q0tOaCt6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v6 17/31] build: convert binfile use to if_changed
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-18-anthony.perard@citrix.com>
 <dbb33a01-d54b-d4f3-caf3-5e5544d52095@suse.com> <YOxurzTEAfW3I8yU@perard>
 <ddc38760-c042-febb-822f-560a4b613e91@suse.com> <YO2qEaFOMVM3xvkO@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <85755375-8674-04be-bf2b-31b96763e202@suse.com>
Date: Tue, 13 Jul 2021 17:33:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YO2qEaFOMVM3xvkO@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0185.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb7285a2-8a6b-4c64-e000-08d94613a052
X-MS-TrafficTypeDiagnostic: VI1PR04MB5470:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB54700E66248DA722A4B2B9A1B3149@VI1PR04MB5470.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6W0BeGvO6jsZbyMPBnVv05d0jLIeQGqpEShXzab3h79yjPzghnYnI2/EszJQtZtxmjI1c4cKTIvMkq0K/FKIRlWp+zvJXQFyqYxXEQEh3StytfSTdGI/B5lL38ubuBsJsR0bgckdOESeWRfCwIqSsFHPVtJ+tlMGnIRQBUPlYgcqkgEKFrp13M+7uwYCT8JggJza3QfSGkRwte6wx0aUi+O/fEdgwnj9QcbpZiNejMNT5e6MbEPz0Lfk2P7wJBTIlGty9NJGNS29waXJn2PG8omnjymnltfGdyOF3bGZ2kV5QvAiV4K8WGgjPkL29cTjHViC+jpSQQ3sepllcRSRAFZEIkDjij7x2bmc7CixH8/DNR0G7j82kljB3k31DQeWE3Axw+rjYqzAQXtyerB7fEsPMnlQLEQCN3HMEKXhXtxP/7yxZM4mIabkqTcN6rVNUB2QEBp3cqwLfSR44dRTZr3S5ZX7mjPHzj82i/MBb2xORF352HYCjPEAZk3L6QMYe2Km74py5mPuI30N3MDawh1855GtGNFB42bAy3slECBAHUnsQD1t/Ckxm36Iwp/r08YaQl9Y571vO5LH9EQEMrN/GpHH6IFb1XGbEzC19Gy8SKGxjm7LAlBYeTvmO+fY8twYghBMYDV01tZfq4qr2rBKEtjuHkvH4Ks0vrdL80ve/JspMqNerXq+RexR1sIQtWl3F27aUoWZm8uiGGb690wpBx26FcmTra51ugo6S5k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(366004)(376002)(39850400004)(136003)(54906003)(66946007)(316002)(66476007)(86362001)(2906002)(6916009)(16576012)(8676002)(8936002)(956004)(31696002)(66556008)(478600001)(38100700002)(36756003)(4326008)(26005)(7416002)(31686004)(186003)(6486002)(53546011)(5660300002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFJXbEFzYmpicmdEeUxuK3NaMjVVVmxLZ1dvL2g1c21aQ3llUVBsOWVEZUsz?=
 =?utf-8?B?em93YlQrakREYWdrSDlrN1dIeEx6eHJjMGhsQlAzU0ZTMVQ4dXRtL0lSZXJo?=
 =?utf-8?B?dmRwNm1FcFltL2VQVms1Q0FOWVlWUmpVTVpvY0k5cktOZDI1RGVrVnhSRjZW?=
 =?utf-8?B?aXFqeEVjZGdvMm5MaVgvSTREUlpHSEJERjFRZVAwbTNLa242YSs0MzBMM1ZY?=
 =?utf-8?B?K3l2RzkyelF2UENPY092U2NoeEFKbVZRMVFLK1hzcmlaR1BKblJlSXVkY01o?=
 =?utf-8?B?ejZBNVJBckFvRUQzd2VJUk1rN0twd28weUMzdG1hVzMzaDNMaXJGRS9CM0VH?=
 =?utf-8?B?L1ZMbG9NaEpDczB2TGg0WXNiOUV0TFVyWnFCUnhnbnlKT2dIbWEyZVpEZXNC?=
 =?utf-8?B?TktqZ1FKYlFFbHpZQnBwOSt5WmxqM1FhOTZqOU92Y1B2RUVsK1NQOFRJYzMx?=
 =?utf-8?B?dmt2ZEJzVWJzbzBnNXY4Qzc1VlpoaHg4T05IcFd5UmlBeXlsZUdWajUwMERP?=
 =?utf-8?B?aUx2WFUzb2xna3NaaFNHSzB6ZTZOL0gxYVYzQlFva0FGOUxXckdhak1lTUVk?=
 =?utf-8?B?a2JRTnNOU1hycnVJSkhlQ3hka201Zkh2V0huT0l1Mm5yK1lhTHhRbHBvZGlH?=
 =?utf-8?B?ZkRxckFZN29TQUN6dDU0T3Q2ayt1cDFWYTlIZ3NCZWEycm1YMUxLNXQ0djUy?=
 =?utf-8?B?QWlTTGJiUU43RjdhcThJTWtXYlpKajJNRWtkc0duQVlhMERwV0kyVkxsbXRl?=
 =?utf-8?B?MzNLWU9TOXBZZUN2VUF3UTJveVdCNEZ0Sjg0RW1IRDkxNG1CQW9tdHplREhB?=
 =?utf-8?B?TENZaXdyVnBvTXF4aGZDcWJyZStDRXFkckdUNTI5VHk5bUU2NjM1MVNGMHhX?=
 =?utf-8?B?SVpyd285Mk9MUTMzb3RkcVg3YUZ3MzhwOFBQYWpzM1ZHRlk4K0ZINTdWVkR0?=
 =?utf-8?B?VEVHZlZXeTIrQ3h4cmVaeFcwWFV3RTJ0YVdRNjRqbEE4K2tpOUE2Z2tnUTBq?=
 =?utf-8?B?M2VwSERmQVhleHNQT3lOMUYrVUJsYlhWT0tBTUtrUnN5eVUyU2xaY0xveW9t?=
 =?utf-8?B?N04xR3p3NHY5ZndxR093cWh4Q3ZtNVZUQURhbjlMcldXcXdTaHp0QnJud00y?=
 =?utf-8?B?K2EvT09DVWphTVlxRTJaTWY3UW9sNk1WbFZRQzJHcXZxMk95SXhOSC9aOUdP?=
 =?utf-8?B?TG1YekN2enUzMVg2dWc5OXJHMEZaZW83Yk1TaWJPNWVoNVNjcFhxRldhZVAz?=
 =?utf-8?B?TDJoUDlJSVZpZDRlMkVtOGxmSmlNWWxiV0xpMXhzOFFZMHdPY1l3TDBGT0pV?=
 =?utf-8?B?UW95K2F5bkUrMklhZDJpTVlMZ1dsYmRQOUJ5bUZhV3h1L3lrNDkyZkVUNVVI?=
 =?utf-8?B?Z3lKY0J3SUxOaXExcmw4WnUyai84ZXYrWlVlN1N5dGkyMGtSN0lEdHYyWFpJ?=
 =?utf-8?B?bC9ManRSZUdMVWtibGthNEhhTHRkcGRycXA0aFdVbnFjM2lqTWk0dVBQSHdr?=
 =?utf-8?B?OFdJZGxycUwzY3F4eEhGOG5CdXRNeVkzZ3ltUkV1NEFEM1NGSHlFclFhOFhL?=
 =?utf-8?B?WnJsRFdxQ0VITkluN09jVVdQZ1F1Vlpra3FnM3J2eWY4ZzRRR25pc09HOVRR?=
 =?utf-8?B?Ukd4UHF3VmVlTFhjVGM0L09iMU1MZ3hDMGxyU3dHYlJZVExGMmNoVFZkampX?=
 =?utf-8?B?THB4WGRpMXJxTHNHR29LM1UxYmRmSUMvamJocnR2elZXcnJ6b2lRYlZnbE9P?=
 =?utf-8?Q?gD9kAW8Li/JHrM5XFTVJQEfjqZV9qVWmKFLW7/d?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb7285a2-8a6b-4c64-e000-08d94613a052
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 15:33:55.8704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OyiTO/bxKRy4sMM2qZA4O+y3NGl816mbqUCvOAeA/a+5P+id+l65RTtSPEKRHU6dUq5czpc5Wi8jXL7dWOf71Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5470

On 13.07.2021 16:58, Anthony PERARD wrote:
> On Tue, Jul 13, 2021 at 09:51:45AM +0200, Jan Beulich wrote:
>> On 12.07.2021 18:32, Anthony PERARD wrote:
>>> On Wed, Jul 07, 2021 at 05:48:57PM +0200, Jan Beulich wrote:
>>>> On 01.07.2021 16:09, Anthony PERARD wrote:
>>>>> --- a/xen/common/Makefile
>>>>> +++ b/xen/common/Makefile
>>>>> @@ -80,8 +80,12 @@ config.gz: $(CONF_FILE)
>>>>>  
>>>>>  config_data.o: config.gz
>>>>>  
>>>>> -config_data.S: $(BASEDIR)/tools/binfile
>>>>> -	$(SHELL) $(BASEDIR)/tools/binfile $@ config.gz xen_config_data
>>>>> +quiet_cmd_binfile = BINFILE $@
>>>>> +cmd_binfile = $(SHELL) $< $@ config.gz xen_config_data
>>>>
>>>> This is an abuse of $< which I consider overly confusing:
>>>> $(BASEDIR)/tools/binfile is not the input file to the rule. Instead
>>>> the script generates an assembly file "out of thin air", with not
>>>> input files at all. The rule and ...
>>>>
>>>>> +config_data.S: $(BASEDIR)/tools/binfile FORCE
>>>>
>>>> ... dependency shouldn't give a different impression. What would
>>>> be nice (without having checked how difficult this might be) would
>>>> be if quiet_cmd_binfile and cmd_binfile could move to xen/Rules.mk
>>>> and merely be used from here (and the other location, where the
>>>> same concern obviously applies).
>>>
>>> I've though of having cmd_binfile in Rules.mk, but it's made more
>>> complicated by having a "-i" flag used in flask/.
>>>
>>> So one things I've writen was:
>>>
>>> config_data.S: $(BASEDIR)/tools/binfile FORCE
>>>        $(call if_changed,binfile,,config.gz xen_config_data)
>>> flask-policy.S: $(BASEDIR)/tools/binfile FORCE
>>>        $(call if_changed,binfile,-i,policy.bin xsm_flask_init_policy)
>>>
>>> with:
>>> cmd_binfile = $(SHELL) $(BASEDIR)/tools/binfile $(2) $@ $(3)
>>>
>>> I thought this would be confusing, so I avoid it.
>>
>> Indeed that's why I did write "without having checked how difficult
>> this might be", because I definitely didn't want to suggest such
>> anomalies to get introduced. It's unhelpful that options have to
>> come first.
>>
>>> But maybe with the lists of flags at the end, it would be better:
>>>    $(call if_changed,binfile,policy.bin xsm_flask_init_policy,-i)
>>
>> Yes, this is a little better imo, but still not pretty.
>>
>>> Still want to move cmd_binfile to Rules.mk?
>>
>> I'd still like it to be moved, but without resulting in a rule
>> that's not consistent with others. Maybe we should have a
>> BINFILE_FLAGS variable (paralleling e.g. CFLAGS)?
> 
> Sound good.
> 
>     cmd_binfile = $(SHELL) $(BASEDIR)/tools/binfile $(BINFILE_FLAGS) $@ $(2)
> 
>     flask-policy.S: BINFILE_FLAGS := -i
>     flask-policy.S: $(BASEDIR)/tools/binfile FORCE
>            $(call if_changed,binfile,policy.bin xsm_flask_init_policy)
> 
> Would the above be OK?
> Otherwise, maybe you'll prefer the following:
> 
>     flask-policy.S: BINFILE_FLAGS = -i $@ policy.bin xsm_flask_init_policy
>     flask-policy.S: $(BASEDIR)/tools/binfile FORCE
>            $(call if_changed,binfile)

I think I like the former better than the latter, but I could live
with either.

Jan


