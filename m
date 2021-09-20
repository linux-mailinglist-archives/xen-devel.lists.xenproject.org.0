Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 273EB411099
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 10:01:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190289.340118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSEEf-00014N-Fo; Mon, 20 Sep 2021 08:01:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190289.340118; Mon, 20 Sep 2021 08:01:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSEEf-00011A-BX; Mon, 20 Sep 2021 08:01:09 +0000
Received: by outflank-mailman (input) for mailman id 190289;
 Mon, 20 Sep 2021 08:01:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Spoc=OK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSEEe-000114-2k
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 08:01:08 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7a7cfc6-19e8-11ec-b863-12813bfff9fa;
 Mon, 20 Sep 2021 08:01:05 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-qOJb3w6APdipx3UhY0As-w-1; Mon, 20 Sep 2021 10:01:03 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2447.eurprd04.prod.outlook.com (2603:10a6:800:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Mon, 20 Sep
 2021 08:01:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 08:01:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR01CA0125.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Mon, 20 Sep 2021 08:01:00 +0000
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
X-Inumbo-ID: e7a7cfc6-19e8-11ec-b863-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632124865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dyevKjBK76O5ncYs/3yqDWIl6YXimggBjpRUnzmX/UU=;
	b=DuP3mNmqBz4xrcOlPFu4rznScW4BLeGH4TCUdW+IVGglzugxIzDtZeDzamR9Ota0ogcpud
	LQEJUHeUWCVF3NhNhid27sCPEXB4mNCuV1gzNU6tgpIs4VL1M7BQFhHFtUCX1oO3ywbpUk
	E3hS+6G3IrYiLSctOhDRoIUA45iA4WE=
X-MC-Unique: qOJb3w6APdipx3UhY0As-w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UC7rOPcUN5aCkojKf6l1VAWgaGb71zMZ6pu6RDBisMY6+RhF7i4OMFf9cvB9HqlPbyxWLxhFRgmI91r3teTd8vFK7vB+g2kjEVWJQ3+Vwb/He3D1x06+gd9e8rdl6nhtTwsoaA1dsTqgLMZhOqvNrWp4eAwOLBIxh9MADrDL877A4BCXEKkpYvVlri+Cp8g3Vsp93xxG5hjJrSfzDNwLPwwdFFyPIFGiv28JNhgCazUx7h+Nov44FFWSZxEZ97fSz2X0K3h5EvTFQmfS3+bqawXr2xMufBOE37vTivhizpnqo3oxc1UG+zZT4Ybl/bW3Syw8lyPHTrpgtJxF5MXkVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=dyevKjBK76O5ncYs/3yqDWIl6YXimggBjpRUnzmX/UU=;
 b=hitddAUXiJRCzk8iyt9NjIUPoqk8//6TQMn8TzKRDg9ZTHHs1Mz39usVpjjt9BFG7Ehm4FOa7+4bWQsCs6IQi8HKBLj+tmbAwv0eUpYrK3cl0H3yqiC2Ke8o5scUOyg+igl3dqJOqKhxQeRXa3ve4PuP/hNyQf6BW0J54NpH4Aq+eR1O38jTdAiwS6Q/Y6LwmXjjbWIuONBSwKykcRTFJFKYT2EftJx4TncrGeddjnnKMf1d5evG9ch8zV0xYOJmLKcS/mh53FafM/1wq/8FotJD6O9hEHRUrXzpOUOa5/81Fmvpa2mP9DgqjcJIjYr17TsK0ku0Feo+zS19gBkFbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 1/6] xen/trace: Don't over-read trace objects
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210917084559.22673-1-andrew.cooper3@citrix.com>
 <20210917084559.22673-2-andrew.cooper3@citrix.com>
 <ed07d2de-9354-6c6d-b9f6-4b325ca328ce@suse.com>
 <0db4dc68-ccf0-0de6-61ce-7f155431a977@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8b2a548f-a955-302b-82ce-59c061537e27@suse.com>
Date: Mon, 20 Sep 2021 10:00:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <0db4dc68-ccf0-0de6-61ce-7f155431a977@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0125.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bad3ad26-677a-4f79-eb6f-08d97c0cc96f
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2447:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2447A92DE92690D1925EC3ECB3A09@VI1PR0401MB2447.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i0ISI0XqPxsBCpX5INHJbuVIgfFZDXd9+jw8BC6h/N9Kl4XGf22fpCAUnADIHC2D2cT2Iww/C2S3G+o/9cq/I0Ez+B+Skcy7r+b2xviIe+SmBnbzuk+CLSvARznHGplEL450e5IQ7NFNSNYAyEaoV2R43TvJ15XEUa6zpGFtk28SziFljsazgpJWO5eLA6M4Rs8wPRroOHLdypOV1iRKXJFWo1GdL7G46yssPsHaC46fjqKIy/sslQGu623EyQCY06wBETgBuM2J8+kQIFgLGNwgCdWV20Bwi3NWaHmSkbQxZxBe/2cWW9wUiqUiqrKQmlcdqRJuhAKc39Ydh9SwY6dWN+h+AkqkW3eWZjKftFXkLncUvcduMpdHhleJbqJdiLkZ4x1nCabDCHwBPMaqq2zPhA7Qb5FuLJs4Bf16Um9cyxwDzPesX8REs96fBQmRkw3YE4yJquCNalsjN4GAW6qxD/bqc4luYnqcc9bbtbZQTt7+kiqkeLqfq+f/eA9o2rJ1IPU9n4ggaIRRvVSDPqx0dM1dGhF7T4bCWik3ym8nztvx+TOecmF9rNYXVnpPUpiT27rlQz9zEHGG7rr+2cta1frLUVBgq6pg/QB9xXF2wm5Al9kKGNy7tpsXVbE2J7SR5qa1vllK9EjujpG/VjzZKeH7OVWfZ24KgTIBaACohRLsaZHEh39++drSrrLxXNEtulkIHISricKKCGddPw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(346002)(376002)(396003)(136003)(186003)(2616005)(956004)(38100700002)(66946007)(66476007)(66556008)(83380400001)(16576012)(6916009)(53546011)(86362001)(6486002)(31696002)(54906003)(26005)(36756003)(4326008)(8936002)(8676002)(31686004)(2906002)(5660300002)(478600001)(316002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUt0cHBWdlk3TzZPenZScXJlOUloRVV1SDNmVE1GS25qL1YyTmtzK0YxT3pV?=
 =?utf-8?B?SDNlblVMczZPM0QvU0ZhZHFGbFBxWUNlNXVLV0kycjVRdEJtUFFnT2xtVlFt?=
 =?utf-8?B?elB1ZXA2Y0dJZGxGZitOeUs2YzFBd0lWcURCbm5lazFpaEdZSUQzajJNdWZr?=
 =?utf-8?B?Wmp5ajk5Y0ZLWjUvSllESVByUHpuR2txK2dFQkx1dWdva3Azbk10Ujk1MFBC?=
 =?utf-8?B?cllEUDNEdWV1VXFwa0Q1Zi9ENTJVVUZrQTlyZ1JQN0VSWEFvOGhhWWtLUndF?=
 =?utf-8?B?RGhPVmQyS3NocWpPRFdzZFN0cVZiemdVTWtwaWNKVjhaTVJWWE9PTFN3TUNk?=
 =?utf-8?B?Zm9vT0FGZU5hWkM5NHpNNVNLOXR5M3RqcUVkKzAxSlFkTyswbVZKM0NjSllI?=
 =?utf-8?B?Z3lkYjhNblZacFU5bnFQVTdqM0traTBUT2lvbzU4T0VraDhGVVcwSzJya2ZI?=
 =?utf-8?B?OXp2czcwYitUcklVZDZpNW14T0gyd0s2cnJLUkdndm9Ub0cvMUtKaW00SFdB?=
 =?utf-8?B?RzhqV0l1MEVWYjQ4Q01ZcFV3cGp4czhnZ21ldTRDVVVHaEozUEpNaDVRcElD?=
 =?utf-8?B?YkdMWGFHcHZERTF6NitHNHZCd3gzcWJ1ZTZieXg0NkVDNndBcjE5c1ZQeGFY?=
 =?utf-8?B?c2pvNjYyOU5SczVadnR5eUNFRTdjbDd3WnZ2czcxUzJKeW9SUjVpdWY5RjlQ?=
 =?utf-8?B?TldCSkZpMFRlTFNsZGROWEdmOC8xd2RzNHpWamQ2UmZSTmpRY0ZmUGdCb0tG?=
 =?utf-8?B?L3NSMnVBZTBOZHFuMitFZUc2U000alBaVk1wU0Y0TkJmT0lFMzF6MmlMVms3?=
 =?utf-8?B?THo2UzBLWVNDdmVRRFRzR0puMG92UG1pY2tFY2cvWXhIQmN1MklkWVZzcFFJ?=
 =?utf-8?B?ZkxpVnBkcE9XNFlTS2NyZkMrSEZDaTVhQWFIc3VwL1A5TUcxZ3NLcXQvZzNP?=
 =?utf-8?B?YUhmUGxPZ1k2YWlDWWNlS1JmLzdpOFpkQjRSZDg5YjhpN2R0TXZCOTN6eURx?=
 =?utf-8?B?SjE0aFVRTUhBU1VmdE14TGt1eWJha0gvZng5TGk1eTZxT3B1Zk1BbHo2enN6?=
 =?utf-8?B?Q1VQSFVpVk5HVVBIMmRwWk1OcjIrcm0vR3NFMEE3aE9JTWI4Q1VCUWE5cVc0?=
 =?utf-8?B?dC9iOGxDODhicllrNEhFWkkvZEsrQThJeFAybCt4ZFpEN0Nxa0xJbVVQZXVp?=
 =?utf-8?B?RFBJL2hCQVlxdWNMV3liRkgrU3RxQXFUZFJuUFVXZTh3MkFCMnVpRGpBZitt?=
 =?utf-8?B?RjFDZ3hnZzRmZlhRQkMvNjBzMTgrN213YUNZMGt5MHc2dWw0ZjZYdW9IYm9B?=
 =?utf-8?B?WHlxVWx2ZTNQQzNyYWJJYXAwejc0TCtQVDQxOFV0cEFXTi91STlWVjBCM0tR?=
 =?utf-8?B?U3BiZVR0cWFYNU41OTAvcDR5Q2huY1hVZ29JeTZFa0xleUowSC92Z2NwcmQv?=
 =?utf-8?B?MnJHSEVwUkFVMDVONUVJWE1FcnptWnBNdFlvMkxVc0RyZVozK2c1RDR1Smhx?=
 =?utf-8?B?MVBXQ2t6YldkOHQzRzQyTzZqdjJlcTZWSVJxd0xYYWJ0ckE4OGxic1ZQZXRS?=
 =?utf-8?B?S2Y3V3JZRDYzcWpMV0R2NEU2VEpLcUJxa2ZTUDBiQ2tkNERpOENIYzhONVZ2?=
 =?utf-8?B?M2grRi9oYkFMMHNjQ1JnaTM1VFdLck8xaklWdWU4clFtR25nMDJwOFVGell5?=
 =?utf-8?B?enltUVlxTWxtTm82eUN4V2JKYW9mcWdCTDBlNzNITlVoWDkyc1RMNUdtVzlY?=
 =?utf-8?Q?eGtPfgs977Z98HpcMe4Uh2cVgKplzJC4elbNFRr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bad3ad26-677a-4f79-eb6f-08d97c0cc96f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 08:01:01.1732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Vq4E97X1TySph1jKL4TZbGpGQnTneGWfETsc3VuGpRRQ8UG8av70cnD+9H3BYrNgdEl5rBlaJ47fEkYFNVUcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2447

On 17.09.2021 15:26, Andrew Cooper wrote:
> On 17/09/2021 13:58, Jan Beulich wrote:
>> On 17.09.2021 10:45, Andrew Cooper wrote:
>>> --- a/xen/common/trace.c
>>> +++ b/xen/common/trace.c
>>> @@ -686,22 +686,21 @@ void __trace_var(u32 event, bool_t cycles, unsigned int extra,
>>>      unsigned long flags;
>>>      u32 bytes_to_tail, bytes_to_wrap;
>>>      unsigned int rec_size, total_size;
>>> -    unsigned int extra_word;
>>>      bool_t started_below_highwater;
>>>  
>>>      if( !tb_init_done )
>>>          return;
>>>  
>>> -    /* Convert byte count into word count, rounding up */
>>> -    extra_word = (extra / sizeof(u32));
>>> -    if ( (extra % sizeof(u32)) != 0 )
>>> -        extra_word++;
>>> -    
>>> -    ASSERT(extra_word <= TRACE_EXTRA_MAX);
>>> -    extra_word = min_t(int, extra_word, TRACE_EXTRA_MAX);
>>> -
>>> -    /* Round size up to nearest word */
>>> -    extra = extra_word * sizeof(u32);
>>> +    /*
>>> +     * Trace records require extra data which is an exact multiple of
>>> +     * uint32_t.  Reject out-of-spec records.  Any failure here is an error in
>>> +     * the caller.
>>> +     */
>> Hmm, is "require" accurate?
> 
> In terms of "what will go wrong if this condition is violated", yes.
> 
>>  They may very well come without extra data
>> afaics.
> 
> 0 is fine, and used by plenty of records, and also permitted by the
> filtering logic.

I was about to say that the two parts of your reply contradict one
another, when I finally realized that it looks like the first sentence
in the comment can be read two ways: "Trace records require extra data"
then going on to describe properties, or "Trace records require extra
data to be an exact multiple of uint32_t." Obviously this is to me as a
non-native speaker. But maybe you could still reword this to be
unambiguous? (I'm not going to exclude that the lack of a comma, which
I did silently add while reading, makes a difference here: Does "Trace
records require extra data, which is an exact multiple of uint32_t" end
up altering the meaning?)

Jan


