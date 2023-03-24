Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E25F6C7B79
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 10:32:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514245.796322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfdmM-0001tc-HA; Fri, 24 Mar 2023 09:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514245.796322; Fri, 24 Mar 2023 09:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfdmM-0001qZ-D6; Fri, 24 Mar 2023 09:32:10 +0000
Received: by outflank-mailman (input) for mailman id 514245;
 Fri, 24 Mar 2023 09:32:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n250=7Q=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pfdmL-0001qS-9A
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 09:32:09 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be336ab3-ca26-11ed-b464-930f4c7d94ae;
 Fri, 24 Mar 2023 10:32:07 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7887.eurprd04.prod.outlook.com (2603:10a6:102:c9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 09:32:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 09:32:04 +0000
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
X-Inumbo-ID: be336ab3-ca26-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OkznySi0NABaabY4ddk84/iOGN5ByI9EmBFmq1O0fOT0kvt6MggfgicULO4zP8zGygGdpDqwCll8qRhT3BkOCuyqaUzsHJj+pbOkDWTocSxODfSHVB5jWGmF6HiigAxVzt0V0Jh9j1R2ixencqopAoyMw8L055+3RNvCx7cnwjl0IkEdiJwUDhYwjnGFUEzhM5M62WOemCuRAWg+qa6EXL5JLBTwzQBuHkduZvuiJFGuIQJ11IN96o2xLgdcvteHSTfx+XoJldcXFr5qgflB4wpZM16g692qTKsuJ8W3OO4wpmfU9khOlTnTobPk/GfbDihJDwbjPHgGp/ynNcHpKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/eb9zZBdVD9kLbjQiVzrnk6F6uIDZ0JTkaxciTQ9YVU=;
 b=Zl3IWdzP5ZwpxBzxnHzZRoDfW7Xls6/vYwDHxlJ1obWs6c+SXQokpNCL1GjczpcrDos/m7AgI9NpLx/U0hSr1E2kHDJYe7Ba8duHAnOGGrAAypvs5Tehsv9mP4YdikFiskjhdxkugoTeRljDNh+GPtRc+7iikuTf7/UkjrGqQ5ffAj94bdP2lXC5QcMGaU4TtjN49MUJRUAud99RBhqOkm1c42fayM6SrMGBZH83jgzRJjiBrxtd+WhoPiN2cZ7dpFD5Y/tgQV9vSE8x42/Rx1xerMRJdKPmdy/xHZAokyc955g1LJm4cFbZxf84ZgbZfeB7nFRHT8noP7alyS5m9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/eb9zZBdVD9kLbjQiVzrnk6F6uIDZ0JTkaxciTQ9YVU=;
 b=jx+J966NsqD4G9Aog1DyDEXY5Tb7B5Y11cBg9H1Gu6vB11CMAb2DZxe82/YqTuTMER3zLkxvwq1aT+AqpKt7J+Q5vL0XYc8S6Ca8qVTUnMTlKABbBwayNgBYy3HA8DrpNciOhZgkIdVDLvxcZsger4hNTYMYzfTaM6zGFVktQTkHmKX1SzER+PdZCjqDNdHnntksQAYmUNYLSinx4B6m0feObEyexoofLlSIwFXfkszMNVRgl8YyTPH8P7w4ZQy02kSFL7pTRbLoMtXLrJWNmljbr+RJBZosAeZ2XTSQCPzuWfrXoAXwyPHZ+0r1lzFfPQC3YzmAyHgucouBJICxfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <18957f67-7afa-1327-6c31-ef38edac8211@suse.com>
Date: Fri, 24 Mar 2023 10:32:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] x86/hvm: Improve hvm_set_guest_pat() code generation
 again
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 Edwin Torok <edvin.torok@citrix.com>
References: <20220810133655.18040-1-andrew.cooper3@citrix.com>
 <74d0425a-a206-2bcb-50d6-e5bb4c5e2bf3@suse.com>
 <77198021-f45c-9d75-c1da-5022d3ca99a2@citrix.com>
 <1eff8db6-c358-9597-6096-0a1312d59712@suse.com>
 <6f59d2a4-fcb6-77a1-2cd4-51e032fc80f4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6f59d2a4-fcb6-77a1-2cd4-51e032fc80f4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7887:EE_
X-MS-Office365-Filtering-Correlation-Id: ef6575c1-9e83-4dd9-5d9c-08db2c4aa107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FCTh1FWG5ck3wH9McNWV12nmbE8tTXvV5AJmhH9h1Cr+vwCyJTqmO78vOaTpwHL25TEhD4jb7K/yH1pdbcbO0vZ8u3hWv2o3RM1qtDwdRirsRcIHrDlvDufiaD1fcYt2U0YZhy4VFF2yJIHLIDbLIfoYTy7ey/ym5sXKEEYQvijva1kdBFfL6/jqMR456BLvb0UVCNXEgak2k58lEH3BVLmLI2otgs+P0XZsuqGwsvABtKpE3AwX4gpYk5SbI+Je+wr/VTwLLFt2LbwXkWqi1X7Y6Bs3QNqujddBUtxEaCWT6HAjQ959qwosBRYKjrVHk1wrrQK2rdyXQbVrWtIEAWTw7B8nzFmIwwk0dFIcLRrCl0rFg4jlNWgPAHzDP4QZMiblcKVjCkdciAraqj3e9ETuypEAnc+xNEYuqCB7J9gnOXqE29/gELfX1HdzaUuWFP5IoBXr2Qxyk4HdqSBhqgYJ5EGfTce+yKCgTx/Ot4+MPeqqeH+p1o6yUX5gGJTufiIUV4RVr2Yd7sSyoKJdTVmlQehif0Y/LgN3duWkPGfHYM9SuYUI9zdCC6zLMMShYvvEnEB7zNBBiW89O7eXrklIzD+m+k/skiYMGDy3KzInAJyTUCQ2OvnllbHMqehPRd3n11T6ShwX6AsCOuQZHQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(396003)(366004)(39860400002)(136003)(451199018)(31686004)(38100700002)(2906002)(83380400001)(6486002)(478600001)(186003)(2616005)(86362001)(31696002)(36756003)(54906003)(66556008)(8676002)(4326008)(66476007)(6916009)(66946007)(5660300002)(53546011)(8936002)(6506007)(26005)(6512007)(316002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnN0RGF4MmozbzhBaWN2WUw3eGo5ekZWL1I5MityVExtWXA5YzI5K1NoNHlS?=
 =?utf-8?B?dzBOSXNOUVNkZlphbGtYYkZjY1lOL1p0cE9JMjdBSS9CN3BMdVhidGpISzIr?=
 =?utf-8?B?bEpySUlBc1VUaWIrb1JFVk1xV0ZqMTh6NHA2emI4VDBuanhRK2h3STg2Vkdp?=
 =?utf-8?B?WEVXdWM1RENidVBEK3hPWC9OTXpXVUsyem9Ea1FxYzRydlkwZWFkSHMxK0FO?=
 =?utf-8?B?RlA0ZGhPeG9mSC9DeUI0bUhDUmRiMm1SZGk1bWszTmF0cXlzbFd0NDlNKzRE?=
 =?utf-8?B?K2lwVXFnQzdSWXU4b2hkTE1sMzA0S1lhMWJTZURKWVdEOVFHN3ZER29wVS9I?=
 =?utf-8?B?alpQL20zbE9jZVJqWkV2blZQeXhTUlprZjMxQTVYOHh4QnAzd2tnNmxXenRQ?=
 =?utf-8?B?N0xmcnZwUlVsNUpSVXVCdTdxQytpZ0lwUThSV2tPcUMvaDRTN3N5dVhSZkUr?=
 =?utf-8?B?NTdFeDJ6bW13bzlwYmdTd3BQMFZnMmtxS3ZPNWg3RG56NWF3RzNNNWt1NTZa?=
 =?utf-8?B?ZWV0VHZGR0tZRW5nZmNWVmZhM0VHQklLWFBwWWtnL3E4NENwRkJ0aWxYTTJI?=
 =?utf-8?B?Z2l1NUxMTExFN1p4MUk0KzJlL21CVlAvVEJSYjBZcks0Q0dPenFkOFYxYmU3?=
 =?utf-8?B?UHd2RlpXVzZCaGZWL0JyQUdqQkVCNnNCd2RSWU5FT1oraTM1VE5lTERCVTE4?=
 =?utf-8?B?S3lkc0FHOGxBazRtOXB0QWNVSUFGaEFJMmhkbld3cmttbSsyaU1hK3F1V2Rx?=
 =?utf-8?B?OHJOM2FieDV6a3FKMXFYK3RQeVpRMG1kQVZYWDU5YlZQc2ltTmRIUktEK24y?=
 =?utf-8?B?RDZzSWtIeW5uVzB5eW0yRWZCSmdna21vZnhvK1JIWjZrKzFVK0pDakpJcUtQ?=
 =?utf-8?B?OVE3YTJrRWpZbERVZmlnVkNGL2FaTkZZN3JzdURJcXc2RVJ0THVCbm1SY3NX?=
 =?utf-8?B?SnUyQUZROHZyc2V5UGpqSkJJajlKQnk0QjE5WWlRNGtFdlpUS2RhaG4yMHVz?=
 =?utf-8?B?R08rdU5HUkx1cWkxdjZsUTRBSkpyUXAwRHkzdllJZmtrSFFicHUwSjNHQks0?=
 =?utf-8?B?c0dQTXRXNzVlSEtDLy9SbFFLZkFrRHFIKzlKSGJ6U1RRQzhUbEdnTTZQNkVv?=
 =?utf-8?B?bTZlRDMybVUvQmNtR0NpSDR4eDhvb1hBQWx1V3NxUU1VeTVDNDdnN05LQ1Rj?=
 =?utf-8?B?aGpzYm5IRnhacW1pTlkzeS9XR0RXUjV1cERVaUh6RTRxQmYrT010TjZyZTRD?=
 =?utf-8?B?ZmtwdU15czFHM2xJVkdWTWc5c0tZREhubzVRYXlnaEpqVEhyb05DOUk1QWh2?=
 =?utf-8?B?amkyVXcvemxNR05yb3Z2U3hwR29GZ2NCNjAyUC80cldhUkZTVXM5YkdGQTNX?=
 =?utf-8?B?dDl6a3M2YjZHWUpvc21lQjB0ZGJVZzBPSitxN1JJNVI4RFVrdHNzSGNXZmMw?=
 =?utf-8?B?NGNxUGk5Mjhnaks2QTlicUhXZ05LWDcrWGlGbXAyUUNKYk0xeVYxUFVpNyt0?=
 =?utf-8?B?bVVvRU5aa1JBbEFVZEFGQjJzbkhQK3UvNmFUejYzWTQwUUl5ZjFidUhBZGdG?=
 =?utf-8?B?VHEwZlJ2cGh0dHh5d3RpbzZlRFg5N1lNa0hmcGQxbFBRV2l4Y3BqeVhTL21r?=
 =?utf-8?B?ZEYxdVk3djQyZ3oyS2Njb1lySTdwcHA4NmkwWkhsYk1XV2k3T21ZanFTb2cr?=
 =?utf-8?B?MVVPdFlJcVphUVVxVExDMHZWellxVk9jNktrc0VSWmxnRU9YZjRqZHVGK2dC?=
 =?utf-8?B?cWZVOXhpc3JXZWZEcFliQ1RjRVlJNEhNcVN6NVpoSkhGMFdTNE1BbjVpL2Zl?=
 =?utf-8?B?V095eW9JWkpqZ3pvWFZabVhRc2xUaTFIMHZBN3BkVCs2UG9lTWtnbDN4MXBP?=
 =?utf-8?B?K2laaFVoQW8yL3d6ellFekdZd0RvWEZuTWlHWTZlYXhOU3g2bEVndW5lOUVI?=
 =?utf-8?B?ZHgvbHU0VVV6MVYvMjA5QlJSdGNKNUhhZlpTT0toeG1MZWZUblU5QUoxZ1do?=
 =?utf-8?B?cUJoVkJaUSs1dUdOSUppTWpDMVJHcWhUd3VRWHlLNG13WDhiUlc1VkcrWmhH?=
 =?utf-8?B?UU1Sb2FxU2xlOEVyYVpQNUNmTDJ6aGZTSEtJai9Rbnc0RDBsQlRaa3I2aDFO?=
 =?utf-8?Q?+NsRC6FxMbQriyevxpTvLnvXR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef6575c1-9e83-4dd9-5d9c-08db2c4aa107
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 09:32:04.5748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZFuG2Iybv9RElVVbbVpB6e9kIncsRNYsphx/1KuNwtfgX79YJKXbjMRRQTJIozKIQ4EzCdkYNFqA1OszAojlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7887

On 24.03.2023 01:59, Andrew Cooper wrote:
> On 19/12/2022 7:28 am, Jan Beulich wrote:
>> On 16.12.2022 21:53, Andrew Cooper wrote:
>> Again - one way to look at things. Plus, with Demi's series now also in
>> mind, what's done here is moving us in exactly the opposite direction.
>> Is this hot enough a function to warrant that?
> 
> Yes - from the first cset, 9ce0a5e207f3 - it's used on virtual
> vmentry/exit so is (or will be) reasonably hot in due course.
> 
> What is more important in the short term is avoiding the catastrophic
> code generation that Clang still does with default Xen build settings,
> also linked from the commit message.
> 
>>>>> --- a/xen/arch/x86/hvm/hvm.c
>>>>> +++ b/xen/arch/x86/hvm/hvm.c
>>>>> @@ -302,24 +302,43 @@ void hvm_get_guest_pat(struct vcpu *v, u64 *guest_pat)
>>>>>          *guest_pat = v->arch.hvm.pat_cr;
>>>>>  }
>>>>>  
>>>>> -int hvm_set_guest_pat(struct vcpu *v, uint64_t guest_pat)
>>>>> +/*
>>>>> + * MSR_PAT takes 8 uniform fields, each of which must be a valid architectural
>>>>> + * memory type (0, 1, 4-7).  This is a fully vectorised form of the
>>>>> + * 8-iteration loop over bytes looking for PAT_TYPE_* constants.
>>>> While grep-ing for PAT_TYPE_ will hit this line, I think we want
>>>> every individual type to also be found here when grep-ing for one.
>>>> The actual values aren't going to change, but perhaps the beast
>>>> way to do so would still be by way of BUILD_BUG_ON()s.
>>> Why?  What does that solve or improve?
>>>
>>> "pat" is the thing people are going to be looking for if they're
>>> actually trying to find this logic.
>>>
>>> (And I bring this patch up specifically after reviewing Demi's series,
>>> where PAT_TYPE_* changes to X86_MT_* but "pat" is still the useful
>>> search term IMO.)
>> I don't think "PAT" is a good thing to grep for when trying to find uses
>> of particular memory types.
> 
> This is not a logical use of a particular memory type.  Being an
> architectural auditing function, the only legitimate use of these
> constants here is all of them at once.  This is the one place you firmly
> don't care about finding when asking the question "How does Xen go about
> handling WP mappings".
> 
> I have swapped PAT_TYPE_* for X86_MT_* now that Demi's series has been
> committed, but that is the extent to which I think there are relevant
> changes to be made.

In the interest of getting the code gen issue addressed, but without
being fully convinced this is a good move:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

