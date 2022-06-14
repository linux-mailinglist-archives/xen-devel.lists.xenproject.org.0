Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5898F54AD8A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 11:46:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348750.574939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o137a-0003um-33; Tue, 14 Jun 2022 09:46:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348750.574939; Tue, 14 Jun 2022 09:46:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o137Z-0003rp-VB; Tue, 14 Jun 2022 09:46:01 +0000
Received: by outflank-mailman (input) for mailman id 348750;
 Tue, 14 Jun 2022 09:46:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWYu=WV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o137Y-0003rj-TI
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 09:46:01 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb6e352c-ebc6-11ec-bd2c-47488cf2e6aa;
 Tue, 14 Jun 2022 11:45:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR0401MB2609.eurprd04.prod.outlook.com (2603:10a6:203:38::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Tue, 14 Jun
 2022 09:45:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Tue, 14 Jun 2022
 09:45:56 +0000
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
X-Inumbo-ID: cb6e352c-ebc6-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJpDzZ2mdYX2qHoBYXbBPUe8KzMYCJm7Yn5t+0g7vTr8mNrg2cDKK6eGgbeKosKrplviRnHlyd87V6XQrwcp6FM+HEnPNukJ1ljReQU6dRqNOWz+aST9nky+SW3DXUtIf3eS95tdFod3793JHuW/AzdOv0GM9YXF34D0BTneKgHZQwZfII0LFRoYepkno97+eNlS9IW+DyGabjb2VTfks1udgdHtmzPk9GDoynzcKjYU0hbrY4QL2HRPp9AVKvIVAS1iOYKdlV1HGAMXZDss89+rg6E60Npbz+K/ZtXpUBWgDPksQ44eKjZswrIiOj9XvsKAU3qw/HNwM+FXraQICQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLi85Yk2jrBq8ym9bzJIVKYdAnYZfyWH75YdYLZaWbE=;
 b=F40747sZqPbAYn/qQc8QjYjwGjMs7qwX0p2O7hYGfkKS01+HKgZWtRXWYXsF64N09K6TEj2uoARgQSTENSWrvDKGqs8gIJJg5J8YeQW0sfkLIK10IXfq2WsVdRfHXEhck7CsPXfc0xBdsSHJW/0PNo0zLPpWa6a5SY3mwvfIYTvv8ggPqDdgWom5+NfPibGi1yb4bznGJPNUynI+zaAXrq1toPHzZLR2jarwZLPwXwu/9kq1DDIZ/UUvJUwBLDMtabeEa1J8oj1PmG5Hqpwu7ACP1HsgApVb5RHNCVYRHZdGjBaBtqMdBJX0fZDPlOj2sQuakL1RjfnJFYcHwyc1kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLi85Yk2jrBq8ym9bzJIVKYdAnYZfyWH75YdYLZaWbE=;
 b=ybrCLzIh4uHC9Ce4OjkdTt3IIKUaQqKmVjPMH0iYc4N0GAtQhqeD2TMw1ADaAfMXe0xk6PkJnOXhvH4cJhgDQkqCStaq3WCiA2v65La7e9FjuKUoJWQgAFUqYeLGL17JT+SlN/IpsxgHvcxIamhTsqrSv7Jz+e9AII4Pf7JnWquA4dgfDPcW7LtUV1ACQDv1pYNruC2lG5fPvc0Z1H49Q7D6pvyob8xbYOHWaIsD1cwPDCGfKUbg397kcJDQGyoD+U6i/+7QCUKeBvaQ9lxJQhlYIs6o2ccD7sHEyX0BATraFlE0J3h/m/miNasi4vdfhUuBWV0CgUSvEd5pICPBNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <291bb0ee-06d7-af25-79bb-e099c7ff2fe1@suse.com>
Date: Tue, 14 Jun 2022 11:45:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] xen/console: do not drop serial output from the hardware
 domain
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <YqbziQGizoNX7YFr@Air-de-Roger>
 <3d0d74d8-55a9-cdb6-0c5e-616ddd47bbc0@suse.com>
 <Yqb9gKUMokLAots7@Air-de-Roger>
 <afa0a9e3-fd35-be38-427e-3389f4c3ca26@suse.com>
 <YqcuTUJUgXcO3iYE@Air-de-Roger>
 <f0f87e99-282b-6df7-7e57-3a6c73029519@suse.com>
 <YqgwNu3QSpPcZjnU@Air-de-Roger>
 <69d85d88-4ec1-987c-151f-0d433021fe34@suse.com>
 <YqhHtetipYTG8tuc@Air-de-Roger>
 <72c94980-cbcd-d3b3-7aad-c9db58d9c4a2@suse.com>
 <YqhXFKMlIvkQzVoT@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YqhXFKMlIvkQzVoT@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P193CA0044.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3838bf6-5802-4663-917f-08da4deaae45
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2609:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0401MB2609BA27FE6B9ACD6D3EA92EB3AA9@AM5PR0401MB2609.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xsf82hCoYszdlneS4oaqZ+CiUvl+CHBuZQZ3ggzabyWnE3k5X6DA9FUDP+Y0+rpoMO/vVeY+LSOttyx21gOenHnGv95fYZrDHrHkHqgoVXYcXkpNBJCqpkg7PMoF0LHuQuExemzsDVtXZIB99Ed/muLv5o8bVUL8bbKGF0gwv8biOsIlqA1xioMW8YY8WmA26dUtfJ0gsWLZakPIclvQ7qHbJc0f3mlncl2aFc5MhTrbdCY4YmQImQeIWknsEXcO+ol37+Q5T4xhqVH8lUv1EKu8Xj51JLdqG+kb8vel7EU6jkhj5CbUNoRVBG16RrwdLiPKPr2Mxtm6H1fcxhbdb6KMIJfhpFauXQNc1nLaOLFqgd6fffR/w+m3V9P6WMfaKannr7K2q1c0u0qCIVL00Pf/yPiRpS86mETeHtbpYYF/bzpIUxXXBH1mV4h0S6/LITtkrJI3VJKGNcwu0+omfqTZjhXbX+wnfHcGy5SHGKtI5hjeWOMDuOVUupzcIQP6ZHIXcuudE1xkiwuUXwsEZtW/TDhHOzfn7Yr/D/UT20HfzdeLIyhZxbQFNXJUDvcHdXwiNYOgc1qHs2P4iXoOXSjZvduM6pZLuL3Co1CGAXOUI6cjbOJyW4ytBDb7mVoJIaDRyIjArPRV49SJp1ohtqtONIKY+Ier6D/KW71qcXCS2Uqk2cp9X9WmhxAgOzEnoB+x999AnqUtULhymRYCBrxCzi1+pRa3JP1vYLkpM7TY8YCjVenScgHgKiH9W690
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(66556008)(26005)(66476007)(8676002)(4326008)(66946007)(53546011)(6916009)(31686004)(36756003)(6486002)(54906003)(6506007)(8936002)(186003)(2906002)(2616005)(86362001)(38100700002)(316002)(508600001)(31696002)(6512007)(5660300002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTNEaytVTFhlZ0tSSjdoU0tkMHgyTEtmbEFLWnQzNG96NzBqd0F1bkNwZ28x?=
 =?utf-8?B?RjBHTzVaRjBSUjFyWm43eGs2TlFubVNKSzlkNXZUbTVwMzIxd2RjaTU4b1RG?=
 =?utf-8?B?QmhBeDJCVVZHcEo3TEZjRXgrN2NQQ0ZxZ2lTQWhVcnFkVDFGNUJTUm4xbnRV?=
 =?utf-8?B?WkhZLzlCQXBnakpHM3pxTTh4TzRtbmkzWXVpVnQ1MVUyNWo0MSttZzU1OE0r?=
 =?utf-8?B?RWY2cWcrZkh5V2VLcUhIRDFTL0wrNlNDaUVEK3FlVm1TR1ExSXd1RXdkQjIz?=
 =?utf-8?B?Z2pYcnh5QUZKOHBwa2RJbUx6R3dubmpDQXFDVlVaakhtNzFGaStnakt1MUZI?=
 =?utf-8?B?cjROaTdwVlI4VTh4QldUUThkdEtaQzN6R0NQcEJqS0k3K3lsOWZpWGNrNGxY?=
 =?utf-8?B?bDgyM2FGNUhVNzBROEtXcDE1dDhzQURxWHhLNUZnS2o0S0NjYWltVTVXN1li?=
 =?utf-8?B?eGphdHArZEQ4MzBmNHY0Wk1jTTFYdWsxWUR6UXVkcFJqVTUvSSswREJma2FZ?=
 =?utf-8?B?NEdGeklCakZ6clJNbXRBUlZjV0k4MHlZYU1jOHFJVWpjVW44c1kvSm85SE02?=
 =?utf-8?B?dU1JdXpCcHdJSnJUOThJZGlJZG5ldDNMRjZqUWsvNUJuRE1nL09NdStyY0VG?=
 =?utf-8?B?Y2NGWTFTTkdPeTJQaUkySG14dDdxc0lteWdnT3Z1anVmLyt3NFBlYk8xMlFM?=
 =?utf-8?B?WkpwVURwalZwcFZlKyt1K3JCTG10SVgwU3FFWjA3a3JYcDc1MUU0Vm15YlZT?=
 =?utf-8?B?NExWSHBSdnlpK0JNa2hseXZjZ3R5eHVZMFNibWI5RXBoUG5jNjFXOHRmN3ox?=
 =?utf-8?B?anVzTE9oMWZBNmh1YmN5RmFMNy9pcHNpVzV2QS9XZ1hPem1JeGliVlVjQi9Y?=
 =?utf-8?B?bDZPSCtnYzdHQmVoTXpqNHphYkFzZllvOVV2MkUxUkNvbXRUZmlwUFFTZ2FQ?=
 =?utf-8?B?MUpDN2RnSkdtQ2RoWW9NU1Uya0ZDVG1ZWWtTaW01NzlaU3FiN3hvenhadzRW?=
 =?utf-8?B?QWJ6WjZFZ215V3dhMmUra1ZST1dGNFRZZS9WZVNRSnhIZDlPaFUyRjV1RUk0?=
 =?utf-8?B?SFpvK2JRZUlBdVF6T1EwVHBDOXczOGhxb2N0YkY4V2tKMlRFOWY1TW45bzdY?=
 =?utf-8?B?NUVJbHBjcThKdU5YYVkycDRZdjhOQ0JLdkN4V0JFUjd5TExxRzkzR2V4cEhM?=
 =?utf-8?B?dy95YnMyWVh2cmt0ZDFBVWk3ZEp6WVhRRmI1OUVyRWVkODZJcUZ2TTR4VCtU?=
 =?utf-8?B?M2FqWDlyMVcvTUJyeEdXRGZOb3lwc0xIMkJyakV5QjA2K3dkcWFBL3NrL3pt?=
 =?utf-8?B?c0RLOElLdnNIZFNiQkJxSXgzcGNlc3Zkc3JVeEpwang5Uk5BbEV2c3ZJRmRz?=
 =?utf-8?B?RFdPdGpxSnJSaHNLa0gwblVEbDcwOUowWEJqSk14QXVlWkh2ekhXL3htZ1Nj?=
 =?utf-8?B?SmFhNDNjMnF1VUZDbFFVbGI5eS9IRHdvQllXbFJSNHBxOVRzUXRjUW1KQ2hK?=
 =?utf-8?B?VWZMQTRVY1liY3JsMjMwYktLUGxoNDBmVVdtYkNIRFpXdnRPblpjTXNHZGJO?=
 =?utf-8?B?dm5Ndldoa29TdTFRd2NvY0haeFJ6THdTU29ISndDWlZkdWF1ZjlQQkI0a0lz?=
 =?utf-8?B?VldVa1VidnNCNUNaOU1qTEdBcVZCRDg4M1M2ZjBBSUlPb0wvOWJUSXJrN0RU?=
 =?utf-8?B?NHFPakVSRWwvVFJaRFpPSG5FS0xoM2c1RDY2SS8rVFU1Z0dZZDRhL09yNzFz?=
 =?utf-8?B?bE1FLzdiNnFmc004RVpTOVF3djg1MlNMdkpnY1IxbGJ2clYrd1E4enA3anBW?=
 =?utf-8?B?STN4bGRVT0kxZ2FndmY0NlZiclR5T25reVg5SkkyTHlKaUMvUHo2Y1AzQ2ZV?=
 =?utf-8?B?TE1qNTFvQW52ODVpTG1hL1lNTFgxUk9GdkI3T3VFNGZtOWI0SXhML0hTRU54?=
 =?utf-8?B?MEw2dmhwd3RHekJDS2duWnQvOHJYUm9IRzZhR2lwWTAvYkFDQ3JHWjJURG1V?=
 =?utf-8?B?SUxzQy9WZWZEbzBIUWE1b2pOS05xTktHRUp4OXZsZUpHcHNHbCt6RXpteEZN?=
 =?utf-8?B?YzBuQ0lKa3pUMDFqRkpraWhVa0lWSEdaQzMya09haGtneXQwY1FCb1JFc3NN?=
 =?utf-8?B?UU8waEhVeU5qa0MzUGNlcURYZWM0RHZDa0d2Z28rc0VEaU5WWXViYmhkbkll?=
 =?utf-8?B?aEZGVHVwUktYWGxXSDdScDdOQXhzMG9YbEJsTjg0U25LWDNNbWVoTjBwejlz?=
 =?utf-8?B?WktlbVVObUpaYndLd25BRm5yZ2pWUHZmaEZqRkQ2aEsvRkVubkdMUkJsdkZZ?=
 =?utf-8?B?azhDdzgzdjFaeE92OTFIcDdRV3RuaUg3VkhFcjJiVDlZSTk2alNadz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3838bf6-5802-4663-917f-08da4deaae45
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 09:45:56.9233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J0vgzQexvFxm/RehZbmMDDuD6ReMfpg4Hm9Av0P+rTTKmL/eXRG01dl1i1xYf/kvC4Srg+4Ianuv39yBBtWTjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2609

On 14.06.2022 11:38, Roger Pau Monné wrote:
> On Tue, Jun 14, 2022 at 11:13:07AM +0200, Jan Beulich wrote:
>> On 14.06.2022 10:32, Roger Pau Monné wrote:
>>> On Tue, Jun 14, 2022 at 10:10:03AM +0200, Jan Beulich wrote:
>>>> On 14.06.2022 08:52, Roger Pau Monné wrote:
>>>>> On Mon, Jun 13, 2022 at 03:56:54PM +0200, Jan Beulich wrote:
>>>>>> On 13.06.2022 14:32, Roger Pau Monné wrote:
>>>>>>> On Mon, Jun 13, 2022 at 11:18:49AM +0200, Jan Beulich wrote:
>>>>>>>> On 13.06.2022 11:04, Roger Pau Monné wrote:
>>>>>>>>> On Mon, Jun 13, 2022 at 10:29:43AM +0200, Jan Beulich wrote:
>>>>>>>>>> On 13.06.2022 10:21, Roger Pau Monné wrote:
>>>>>>>>>>> On Mon, Jun 13, 2022 at 09:30:06AM +0200, Jan Beulich wrote:
>>>>>>>>>>>> On 10.06.2022 17:06, Roger Pau Monne wrote:
>>>>>>>>>>>>> Prevent dropping console output from the hardware domain, since it's
>>>>>>>>>>>>> likely important to have all the output if the boot fails without
>>>>>>>>>>>>> having to resort to sync_console (which also affects the output from
>>>>>>>>>>>>> other guests).
>>>>>>>>>>>>>
>>>>>>>>>>>>> Do so by pairing the console_serial_puts() with
>>>>>>>>>>>>> serial_{start,end}_log_everything(), so that no output is dropped.
>>>>>>>>>>>>
>>>>>>>>>>>> While I can see the goal, why would Dom0 output be (effectively) more
>>>>>>>>>>>> important than Xen's own one (which isn't "forced")? And with this
>>>>>>>>>>>> aiming at boot output only, wouldn't you want to stop the overriding
>>>>>>>>>>>> once boot has completed (of which, if I'm not mistaken, we don't
>>>>>>>>>>>> really have any signal coming from Dom0)? And even during boot I'm
>>>>>>>>>>>> not convinced we'd want to let through everything, but perhaps just
>>>>>>>>>>>> Dom0's kernel messages?
>>>>>>>>>>>
>>>>>>>>>>> I normally use sync_console on all the boxes I'm doing dev work, so
>>>>>>>>>>> this request is something that come up internally.
>>>>>>>>>>>
>>>>>>>>>>> Didn't realize Xen output wasn't forced, since we already have rate
>>>>>>>>>>> limiting based on log levels I was assuming that non-ratelimited
>>>>>>>>>>> messages wouldn't be dropped.  But yes, I agree that Xen (non-guest
>>>>>>>>>>> triggered) output shouldn't be rate limited either.
>>>>>>>>>>
>>>>>>>>>> Which would raise the question of why we have log levels for non-guest
>>>>>>>>>> messages.
>>>>>>>>>
>>>>>>>>> Hm, maybe I'm confused, but I don't see a direct relation between log
>>>>>>>>> levels and rate limiting.  If I set log level to WARNING I would
>>>>>>>>> expect to not loose _any_ non-guest log messages with level WARNING or
>>>>>>>>> above.  It's still useful to have log levels for non-guest messages,
>>>>>>>>> since user might want to filter out DEBUG non-guest messages for
>>>>>>>>> example.
>>>>>>>>
>>>>>>>> It was me who was confused, because of the two log-everything variants
>>>>>>>> we have (console and serial). You're right that your change is unrelated
>>>>>>>> to log levels. However, when there are e.g. many warnings or when an
>>>>>>>> admin has lowered the log level, what you (would) do is effectively
>>>>>>>> force sync_console mode transiently (for a subset of messages, but
>>>>>>>> that's secondary, especially because the "forced" output would still
>>>>>>>> be waiting for earlier output to make it out).
>>>>>>>
>>>>>>> Right, it would have to wait for any previous output on the buffer to
>>>>>>> go out first.  In any case we can guarantee that no more output will
>>>>>>> be added to the buffer while Xen waits for it to be flushed.
>>>>>>>
>>>>>>> So for the hardware domain it might make sense to wait for the TX
>>>>>>> buffers to be half empty (the current tx_quench logic) by preempting
>>>>>>> the hypercall.  That however could cause issues if guests manage to
>>>>>>> keep filling the buffer while the hardware domain is being preempted.
>>>>>>>
>>>>>>> Alternatively we could always reserve half of the buffer for the
>>>>>>> hardware domain, and allow it to be preempted while waiting for space
>>>>>>> (since it's guaranteed non hardware domains won't be able to steal the
>>>>>>> allocation from the hardware domain).
>>>>>>
>>>>>> Getting complicated it seems. I have to admit that I wonder whether we
>>>>>> wouldn't be better off leaving the current logic as is.
>>>>>
>>>>> Another possible solution (more like a band aid) is to increase the
>>>>> buffer size from 4 pages to 8 or 16.  That would likely allow to cope
>>>>> fine with the high throughput of boot messages.
>>>>
>>>> You mean the buffer whose size is controlled by serial_tx_buffer?
>>>
>>> Yes.
>>>
>>>> On
>>>> large systems one may want to simply make use of the command line
>>>> option then; I don't think the built-in default needs changing. Or
>>>> if so, then perhaps not statically at build time, but taking into
>>>> account system properties (like CPU count).
>>>
>>> So how about we use:
>>>
>>> min(16384, ROUNDUP(1024 * num_possible_cpus(), 4096))
>>
>> That would _reduce_ size on small systems, wouldn't it? Originally
>> you were after increasing the default size. But if you had meant
>> max(), then I'd fear on very large systems this may grow a little
>> too large.
> 
> See previous followup about my mistake of using min() instead of
> max().
> 
> On a system with 512 CPUs that would be 512KB, I don't think that's a
> lot of memory, specially taking into account that a system with 512
> CPUs should have a matching amount of memory I would expect.
> 
> It's true however that I very much doubt we would fill a 512K buffer,
> so limiting to 64K might be a sensible starting point?

Yeah, 64k could be a value to compromise on. What total size of
output have you observed to trigger the making of this patch? Xen
alone doesn't even manage to fill 16k on most of my systems ...

>>> Maybe we should also take CPU frequency into account, but that seems
>>> too complex for the purpose.
>>
>> Why would frequency matter? Other aspects I could see mattering is
>> node count and maybe memory size.
> 
> Higher frequency likely means faster boot, and faster buffer fill,
> because the baudrate of the console is constant.

Hmm, yes. But remember there are may serializing actions. Bringing
up of APs for example is relatively slow _and_ not producing a lot
of output by default. As to the baudrate - modern chipsets allow
for higher than the 115200 value, so we may want to modernize our
drivers to know of such vendor specific aspects.

Jan

