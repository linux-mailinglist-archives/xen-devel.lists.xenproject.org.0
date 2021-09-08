Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA05403965
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 14:02:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181810.329135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNwH2-0004g7-LS; Wed, 08 Sep 2021 12:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181810.329135; Wed, 08 Sep 2021 12:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNwH2-0004dm-HJ; Wed, 08 Sep 2021 12:01:52 +0000
Received: by outflank-mailman (input) for mailman id 181810;
 Wed, 08 Sep 2021 12:01:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NNqu=N6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNwH0-0004dg-RY
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 12:01:50 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8bcd4f9e-109c-11ec-b14d-12813bfff9fa;
 Wed, 08 Sep 2021 12:01:49 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2050.outbound.protection.outlook.com [104.47.6.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-EpyZuIrHNUGasRVrBYmQiA-1;
 Wed, 08 Sep 2021 14:01:47 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3934.eurprd04.prod.outlook.com (2603:10a6:803:1b::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Wed, 8 Sep
 2021 12:01:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 12:01:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.6 via Frontend Transport; Wed, 8 Sep 2021 12:01:45 +0000
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
X-Inumbo-ID: 8bcd4f9e-109c-11ec-b14d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631102508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UG2AjnDcsmumIq1uOUgi3tNiDykLsZsmE9tn4WXrbnY=;
	b=Tj9qRJJTwa7nXMRN/PsTOh+HYlGHXcPQIH3gZ8q2wODdGy/P+CEz/E0NQjfObd7ndmwf+l
	QA977aeGspxNviOfN/bE0xiE/aZFqbMs2lDAMnIEZxyyGQhAMpAc5+bepZgB1FLRlkNDKw
	duUQExqJ0z9wrS4Wsa2U4IVvIaq6TmU=
X-MC-Unique: EpyZuIrHNUGasRVrBYmQiA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMplft3RF/qv2zfzrZG9BISwNk9psfoiMDxyjQNgzd32ZmLLxBRFhQFHcfuytoCw7m8qNsOICjVc/P1D5fOzOks8uU2xXhWG39EqwAVZnZtQ0/X5sZAyCLcfhS6HwSu8qpAydQCLb/iAL3w0fKcPYMAOxy46M6+c0Bk0YwMaBIcTC8a/A8EsnmNseZR4pgu8WVcKi2B5RAjtViYl91l8VcdwHFEer/Ki9WkQRFlLb/T6JAJentpEXVhWASbt2LvvQKYDOYuY7jK36qiKs4JxoowxPrRkKBzvWynplWE0Fb+/sWfYqKZUsfZFUF2NFD7nd/qlNR+Lti+H2GyvjNaeeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=UG2AjnDcsmumIq1uOUgi3tNiDykLsZsmE9tn4WXrbnY=;
 b=dGhhtLCGDj55ld7Vf4r4w8y7UgzkepZhKMdjesP94Wxg3pyZjIEFvPJZyDq8pWxVbdSZ6iI2D/AviePDJdCmtL3N2KKLa1JLnRriTP4CVzS1imlhWgqDJdYU56H0Pd4mKBTyZmk8nTG1i3IWOtaiXmf479Kp/34H5209YFVpTaIL2lcgkOS4ZZlu5zMZJVBP7DxN0NAPDYU6DI2ewa4z6YL3Vng6kTS58XLFYdAQ1XtVmN6pSmrQ5nnI4r+QFJi1p+v8/HAli2it7qFyL0xC72j7LkgJZ2e5M5M4A+gP/F7CxQ/ZUp4JROyaPb4kDh/o0ReSq23CzM6kYhwmSwro/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 05/51] x86/mm: avoid building multiple .o from a
 single .c file
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-6-anthony.perard@citrix.com>
 <e633af0e-a34c-3c11-49ba-1e2c6f544613@suse.com> <YTibMaayiWlJwcZ/@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <27874b1a-70cb-e647-d271-93ef12dc40dc@suse.com>
Date: Wed, 8 Sep 2021 14:01:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YTibMaayiWlJwcZ/@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43cc3789-7638-45b5-2273-08d972c06e3e
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3934:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB39349BCF6F41B1D3B00EB2B0B3D49@VI1PR0402MB3934.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aEem4ObOgpR51fzyBDOoMX0gVHcgBbWvsMJuiqlg3xDjRwAiFieylvQoC5wPeI2Yhjl0GHckSKgkbOKPYYKSuFxS7R2Gy+O4LoxsI0jQjmibhVV1xxDQZqf8T4x6+MVrFM6b52TF8PsxTOcta1+mvXX5UGJ1i1TT5Gd6gZetDwWC0yDwR7v2xKMd7CAQuF4qsuyhwxegyW6Nqb+1kDIUL22vLNdeO5VI7sQB5pblMpyemRMTwSKFYmRCLm2l0rPFn6uIR8u3yVKgKeX4ccs8fDm0mrkprMv0eeQVeDAHyoovaO+woa8FXEYNbFLNEbjmwLfWB1Drj0LCi1gUylETWG6unlDrQZvZo/WfOy/54R8hfTBuslpwntOjWxWQfci1M8rkWhXH93mTZnuBlr755tIbala7f/b2cZvorCBJ94dqRrH4UppPoRQ+aV8M8lAqeGFpeLaNJM+WSo8A2qtr6bk2O6FS47Z0icCTm1rXLYBCEZoIG0Pqg0ICIg6Gl/QXZw8I+v6JOHNhGa1IhnCmT34Qin6pXQAXmCpWA5/4dkTCRYBpK0r/9o3X0/SM+y/Vds1Y2zTPsrsOUIn3fMURPcGoa5MKQun13ZShJUaDtanGu3umyJPE57FBI5j6Q0scLVRni3jdxPEBQTXc7Rt6r28NH6wDzlQ47ziUpbdPOTlUXmWERjVk2PxRd+Vka+TVPRDZ1dN9HxutJ2fFmBOk6oxEL8/YqWekTfT0DcODqypo/hMmD0Ka/mJyyQ7b4SCQxsX2RFaGoU0z8JWceQFJJQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(396003)(346002)(376002)(366004)(31696002)(31686004)(316002)(38100700002)(16576012)(2906002)(8936002)(956004)(2616005)(6916009)(66476007)(478600001)(66946007)(53546011)(66556008)(186003)(26005)(83380400001)(7416002)(36756003)(54906003)(5660300002)(4326008)(8676002)(86362001)(6486002)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHB4ZnpDUEQ0ZTA5dG1kVWRqQlAzV3ZkdWdFUkwxWGdoT215cm95dk5naDVm?=
 =?utf-8?B?dGtnMHdndkNZTUs0Yi9wTEJ5VjR5VXA2K0lGdm1OWWZrakY4RnRGT3FFSUZV?=
 =?utf-8?B?YzFWdWNERGcrU3ZaVFBPcHR0RVNIOGRUTW5TN3cwbVM0cnV5QnBSY0FMMXB1?=
 =?utf-8?B?MmJEWnFtSlFsSm0xVDZ5L2E3SEViNmZVc0Q5Q0Z1Z3RiVmFiWDgwRVlnZjNL?=
 =?utf-8?B?YlNIcm5YTzF0cElZU0lrZ2s1QWNpWXNsK1IrL2c2SlN1QWswRzNtdzk4TElC?=
 =?utf-8?B?THM4MElkbyt6eSsxcVZVNFRTQ04rRU9vdGVZSHFlZDBvdDVyNVJrU2VocjdC?=
 =?utf-8?B?SUtsbWhRQ20wdlFxYXpDODZNSER3ZlRmSFhKeGFiejMzaExpNUtGVU9GVFE1?=
 =?utf-8?B?TGpiQjFtTVZLSFRIdHNTbXRQWG5oUnM5cU9MVTF6Wi9Jc0x5TU51SWdnSXNX?=
 =?utf-8?B?djJ1QjJrcmlhMmZodzRlSm5YSFRwdU0wT0NYNUJIQmVzT0Q0NUJ6OHpBbnRo?=
 =?utf-8?B?NFpvVnRvUCtEYWdVTTJIK0FoNTdUbDNNbkQxdTNnc3ptdW0xWTdKQVhXdWZp?=
 =?utf-8?B?VHlEYmh3NnhsWndjZDB3NS9SWURtYzBweEs2dHhNWVd4NmFNZmY0cU5BTlZK?=
 =?utf-8?B?SC9qbmp3Y2U0ZWRwU2I2SHh5ZjRxYlk2VGJpRzZSS1ZoNkVaMi9GYWV3MjFH?=
 =?utf-8?B?ZWUyMElMc2dxS2ZhTmtmL2krRnIxL0dzbjc5SnBSQjVncVM2WEE0NFFHQjVt?=
 =?utf-8?B?OVRrVkkyOFlublZxb1dsTHJveVBYbzBPV3hMSGtMQ0RIaVdWWXl4eWJnNWZj?=
 =?utf-8?B?WU5zMnpjLzBGUGV4OVhsRXl5UGJZcytCNmE5SVdlck5CMTNuRzA3UnVheG1M?=
 =?utf-8?B?RGVEdDlRSG1UeVR4WVR2RkZtTStIWGE4VG5JcjZrMDl6bmtLdGcwenpPbElZ?=
 =?utf-8?B?Ui81R2FpKytRbU1Nbm1qanBYck1yRXFoaDVJVVEzTnRxU25yMHdkdHFIMWpS?=
 =?utf-8?B?eGt3ZDNKR1U2ODA1bWlURlJmSFhqMEMxM2RMSVJkOVl5SkJJeTIyOFg2N2t0?=
 =?utf-8?B?QzFJcENsSjZvdjZaYWYrMHhTUDAvSGJmOWtUWTlyQ0FodFB2WlFYNHQ4NU9t?=
 =?utf-8?B?enZuWmN6SXVwTHlENUl0ZUl1TnVYaXNNODBGMEJFQ0JvTWJ5b29qUTRTa3c2?=
 =?utf-8?B?bFZzamlvdzFvUnc4VzM3NEorL3l4S3ZReUtaUU5HUkROSHF5S1B0YUFoaEhJ?=
 =?utf-8?B?anJpcEEyS0pnaXh6VExuS0VzYmg0QW8xRTVOVWsxUnVkMWM0K1MxYjV5Ymlx?=
 =?utf-8?B?dDZnWkRBQ1ZmWEp3Y205SWhZS05OK1Q0V3cwUnJQMDFqT04xbDhNUUFmdkFk?=
 =?utf-8?B?WWtVMzVQc1ZhZ1k3SHNtWTNnM3pUVTNKWHkyUU1hekNqYUovbS9MN1lGZ29j?=
 =?utf-8?B?MTBXRTJCZ0VpcEVTQVUwSTNyWUw0SWE2SXBFRHRHSTdHV2dmSlZQWDNtcENP?=
 =?utf-8?B?YXNyQXN0N3lQR0FEMjRITzhDRDlVWXZPWUFsRUVoR2o2aWJ3bU1jTmJZcUhh?=
 =?utf-8?B?eURaeXIrdHA4SXA2UTNyMGlNT0dlOHNZMUk5TXdQRG9kOWJteHBCTy9wSUl4?=
 =?utf-8?B?WnVwRnVVY2hkVHkwVEp0VXFEb2cyK0dHM0x4RW5yb1ZFU21hS3gzVUxrMUJB?=
 =?utf-8?B?M0JrYnJYNlI3b0FrditnVDExY00zTk1FWlRXNy9HZklha1Z1L2RHSXhCYXFQ?=
 =?utf-8?Q?sfSW/8k20o+Yuf4Mo4HZlSp6k2R09QzXqapGITP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43cc3789-7638-45b5-2273-08d972c06e3e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 12:01:46.0088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 02L2npVOEtfFZOxAA1NTzSPDMnv1Z/GWW7qlQZHRXQkb73BYvoMlYPttfOC0OyB7esV+EmkNI7MmYE/1qumlpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3934

On 08.09.2021 13:14, Anthony PERARD wrote:
> On Tue, Sep 07, 2021 at 08:14:14AM +0200, Jan Beulich wrote:
>> On 24.08.2021 12:49, Anthony PERARD wrote:
>>> This replace the use of a single .c file use for multiple .o file by
>>> creating multiple .c file including the first one.
>>>
>>> There's quite a few issues with trying to build more than one object
>>> file from a single source file: there's is a duplication of the make
>>> rules to generate those targets; there is an additional ".file" symbol
>>> added in order to differentiate between the object files; and the
>>> tools/symbols have an heuristic to try to pick up the right ".file".
>>>
>>> This patch adds new .c source file which avoid the need to add a
>>> second ".file" symbol and thus avoid the need to deal with those
>>> issues.
>>>
>>> Also remove __OBJECT_FILE__ from $(CC) command line as it isn't used
>>> anywhere anymore. And remove the macro "build-intermediate" since the
>>> generic rules for single targets can be used.
>>>
>>> And rename the objects in mm/hap/ to remove the extra "level".
>>>
>>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> Hmm, when replying to 00/51 I didn't recall I gave an R-b for this one
>> already. I'd like to restrict it some: It should be taken to stand for
>> the technical correctness of the change. Nevertheless I'm not really
>> happy with the introduction of the various tiny source files. I've
>> meanwhile been wondering: Can't these be generated (in the build tree,
>> as soon as that's possible to be separate) rather than getting put in
>> the repo?
> 
> Do we really need to generated those never to be change tiny source
> file? Do we really need to make the build system a lot more complicated?
> 
> With those tiny source file in a different directory to the main source
> file, we need to add "-I" to CFLAGS. (source tree vs build tree.)
> 
> I don't like preparation phase, I'd rather do just-in-time generation of
> those tiny file (if we really have too...) as to let make organize
> itself on when to do things. That mean, extra targets on how to generate
> the files, and telling make that those would be intermediate target
> shouldn't be deleted to avoid the final object from been regenerated
> over and over again (I'm not sure why the rebuild of tiny source file
> happen when they are intermediate, maybe because FORCE prerequisite on
> %.o).
> 
> Can't we commit this patch as is?

I'll consider another time.

> What kind of issue is there with those tiny source files?

To me they're ugly and their presence is at least mildly confusing.
And apparently I'm not the only one thinking that way, or else such
tiny stubs would have been put there right when introducing these
multiply built sources.

> Should we add a warning in those tiny source files,
> something like "No modification of this file allowed, it's part of the
> build system." ?

Not sure this would make much of a difference. Them getting touched
later on is not a primary concern of mine. In fact once they're
there, I don't see why they couldn't be extended. At least in shadow
code there might be functions which could live there, reducing
#ifdef-ary.

Jan


