Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 221284935C3
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 08:46:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258740.445968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA5fc-0008HO-54; Wed, 19 Jan 2022 07:46:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258740.445968; Wed, 19 Jan 2022 07:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA5fc-0008FH-20; Wed, 19 Jan 2022 07:46:16 +0000
Received: by outflank-mailman (input) for mailman id 258740;
 Wed, 19 Jan 2022 07:46:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nA5fa-0008FB-Un
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 07:46:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e030eeaa-78fb-11ec-9bbc-9dff3e4ee8c5;
 Wed, 19 Jan 2022 08:46:13 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-FrskXjqXNMmYAbRVtPV6GA-1; Wed, 19 Jan 2022 08:46:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM7PR04MB6806.eurprd04.prod.outlook.com (2603:10a6:20b:103::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Wed, 19 Jan
 2022 07:46:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 07:46:10 +0000
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
X-Inumbo-ID: e030eeaa-78fb-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642578373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gK2tpSNIlHt8JUBdl8amXvbyMv2LkCQhitl+LQjc0ag=;
	b=TEtzzi3Z+HNDGYCA+uljJN2Hm3MM4xr53O055e6QklsoCotUqq3KaOhR1CZbfu/oNfyMSn
	J5EuVWWpDFfDG2Mj5RQ8nAasCgRM1tvONxp2BpcGpMSSuR4w3bavrYzsFxG6jr0mcLcwRw
	es8LN87+2/f5FmTU9AZUBJdLmvXuCG4=
X-MC-Unique: FrskXjqXNMmYAbRVtPV6GA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWKBPr+PnfWUjRqDusi+YP4HMfydH5GDttc++5+af1+gt8GBuz1d47BNtee9GY28Wd9o1iNqFb36O06ES0kfQm7JYSA6+NyWrYPfzwRkl6sWzK4xlwEm8RSax/RSyu3lz81mETv65WhBHRbsBfbF+0GW7WMBMftmo5mKU2YcVHy73mTKbHXYa0LhVhkaftjPReJiTwQh2PMZLdo3TnUHGV5h0lPcWaJzAJTHfgae7gCMED/aI+1EMtw4t2FVZNt+5tgStsRjeCcJBgtrubMYcR/2gGINZAzBxeYbfE8gGCoFex4ivYA4Tzv8B0Bb2fe8C2whtP0IpwuSVDxBeXUgIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gK2tpSNIlHt8JUBdl8amXvbyMv2LkCQhitl+LQjc0ag=;
 b=FisOFqpKisHecGY13zyHJfun2XmRC2Ms2NowkN34BnwW8UfkmE92v/ok9zAcVc10UST5QcF1C80EgtgbIkQt3/TAl/30KIonku9S4r8KwO4V9jMV0XO/QvG6k0EuVqYRfqHWyvx80SG4Ewcj+ia2NBHrAyRd4DR1kJsnNGVAfXYagWE9cuyI01QJbLAfqGay1wrHe9jxB5wy1lhViEXkHAeuWw1fpuhDBy5iOeHdl8VkCXaAeE44RUADJvVzexKfPCQSsiQL/SJj9+6kMgXwrNvY0OyMaJwIKw/WhVCOdYZeBxoBk0IWbw8Zvp6WIG3hO+tQUu1CYrlmaHyo0jWorg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2689b94b-7576-307c-0e2d-edd60354f161@suse.com>
Date: Wed, 19 Jan 2022 08:46:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v8 27/47] build: grab common EFI source files in arch
 specific dir
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-28-anthony.perard@citrix.com>
 <57f03aed-c260-1c80-c604-0223d4603b4a@suse.com> <YeafMh0du+5K8YDD@perard>
 <YebpHJk1JIArcdvW@perard>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YebpHJk1JIArcdvW@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0107.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 248246ea-e197-498d-d166-08d9db1fc289
X-MS-TrafficTypeDiagnostic: AM7PR04MB6806:EE_
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB68068241950AC9AAF4C957E0B3599@AM7PR04MB6806.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qdMvkuXx0SVhB5wIl6ft/6DW/4tjxA1FseS0Yu/AIqVPDW9u5y1J8tfWMpmoTz7bX4VybBUvQqQpkBqNETpMGBmkxf7Lr0uW3sFMTmcM3kHEQnkquqVFa5V47VH1r1wBdlsWD1+/weULrtc2V/xQ/YZL5s0ImQ7KFpx0NxJNtLDLmlMPpZsukQycTe/I7W7PezDOBWeQcyGMBEvnaQYjCE7Rg9ipOq93uou/cvbyQwJT/eC76EtWaAF0nMMo3j4jx07m/whRKazJTmT8lY8LBW1uC+XptFuoetL4+SFf2mmXH0YRQTtRyZi+bafZUvJPIVJjxhXxVGuDUt+mNxz5eWKW8ZXQgKl9xjxfN2WodR7EmHX/u/KQsGjsaQdeDAzRr5HOY5F9Wa4e672ON6R1G4hZbCoplZ28z2nMWpmMW8Yvwkfmzb54vXq2PcmeTDqtaVJYhmaPbwdRzAUbrdvnKDRVWDT5MvpxaJkBCvjllcKEFPO6nOxUl+M6MhM10qMmQgG3/0kcifms+6cLvIuyBoRInqsnyJZInzAe188s1JX8DqtoxjWJWbRicNGTn0dGsFzvhtLHlc3m12swtp5ZWVu0H9imHKLVraOi6U48S667zt4wv+79S61gosmtX/p0atSGuyXEhSw2KHABlrqANSHFiFdswC0392ihD9ZuKjQSrJ/Q/Y5Wb0PGQXeTdC1bvQVbqieyMmmQZ8pGJiam1uJh9EKbNBlDNH/od7i2jw5JchyFG4FP+ph9m71LXn+n
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(6486002)(26005)(4326008)(7416002)(53546011)(6506007)(186003)(5660300002)(36756003)(8936002)(8676002)(2906002)(54906003)(38100700002)(86362001)(6512007)(508600001)(66476007)(2616005)(6916009)(66556008)(66946007)(31696002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?am9od3ZrM0grNG50VW15MldLc3BhK0NzTFlyTHgxaVNaT3JFcllHdGpqRHF0?=
 =?utf-8?B?UVhES1pkUitpV2F1RmFDZWFLTkR6L20zSlRFNWpNQUR3QXZEeHZzQjR1dm0w?=
 =?utf-8?B?Z1hncVJpREQwa215VVg0TW9MRDhheDc5MTRaT1U0aklsL2ZNZTNxblBSSmZK?=
 =?utf-8?B?bU56cjhSNC8zS1NuMHdJV1JoNTZIUDZxbnNzTUFvK1dNMDBNL0RhMnhXdHh0?=
 =?utf-8?B?YWNZS0gvekRCaGdFSFB0Y1A3Qk4wZUR5cWZ5elJCWW5oa1l3bFR3Y0EyRnc4?=
 =?utf-8?B?Y29ZZlVJN2VNZDh4NEU2T2g5V3Vrb21KU2Q0Sm9YQ2FMamJoYlpiNVZrUEVL?=
 =?utf-8?B?YVNNQURMOTBlcHVaaHEwUFRYL2ova1VkRXk5MS9xd0FqamhZOFJsMUdNa0Nk?=
 =?utf-8?B?b2luV2NFM2NESTlwRmtaeGNVc3RXWDc5a3pSS2s0V25wZEJqa2tYU0xnZTlX?=
 =?utf-8?B?MXlRa0Y4U1plYzVxTnoxSmpqTDVjVUZ3YVoybkZ4Yjc2am80T2hvL3NlY3Jp?=
 =?utf-8?B?MXRFbUFFdDNZNDdTcWhPUXZiSXBRNDNkbnNPYU9yZndjZ0tPN3RLOEQ3Y0tk?=
 =?utf-8?B?cCt6NXUzZHJ1eUJUcDJTZlIrNVVMQTdaajJNVUowd3d5R0hRWlRZVEtLYXBU?=
 =?utf-8?B?SlNYbS9oMWtySG5NOVQwTmpqak1uOEp5Y0hqWVBVdXlHZlk2WDQ2NG10OW9n?=
 =?utf-8?B?RFRIVHNpVENsTWQ5OUlzVHhuVzR6Ums3Q0lkMXZaWnQ2TVg5dDFpZm8yYkVY?=
 =?utf-8?B?OHVGTXM0TjIyRXBRZitGY0hBazU1cDh5MGlIVitsRXVjRlc2Zkp2dDh4bW5D?=
 =?utf-8?B?Y2N5ejFUdWJVSy93VnUzaFhJOHcvSUF5VWJCQkJ3c1BTbDc4aTNSdVpoNzdj?=
 =?utf-8?B?TGExOW5pU3JNbG5oWVRtdjN0ZjFLQjN0OGczZzlEN0V3RnJJMFZSUmhuckU4?=
 =?utf-8?B?dkFUZU5QRzByV3ROMmxvNWNCU3BFNXFRSHBQL0lwcEwyL2dRd0VTdzVXNXIz?=
 =?utf-8?B?WktvZ1IxMFBPWFhQU2xRMFp6UGp3L3RJZmFUUXZtb0c0dDYzQWx1VlJweFZS?=
 =?utf-8?B?SWdPQ0IveTdQVWtLQnZEelhKK0s5WW9LK0h5WDhGeFFSY1EwdDh2emVDL0dL?=
 =?utf-8?B?UDB6M3pBUmhMKzZrYTNFb2hJOFYvRUY3bGxOdjdtblI5RlBUVkM5SnhEeGpO?=
 =?utf-8?B?UGxWZENmdzFDVkpQZzlxdUM5dzZyYk5kaHVvY0tkUnFlS2VvWlJwVzN6Rjd1?=
 =?utf-8?B?UGsxN2U5NXlyNlZadENucndUeUQzRXBDaUZKTEFPQzNMd2I1UHZiSHR2amk4?=
 =?utf-8?B?ZUdqZDZoS3hsa1pBMFFWR0dCcDg3WEtuSXlmamtEL25vaEpaY2hCM3VHOVdm?=
 =?utf-8?B?YU1TS1k0T0ZvMklpTEFmRkMydGpmY1VNNjlQdDdNVWVyZzdHUjQ5VW1jTkVm?=
 =?utf-8?B?N0wxdnRKR2RmbUVINC94QTlLdlMwSkVlU1FpWmM1bFBVdmIvK2l4SnU4MEFH?=
 =?utf-8?B?aFd2d2VyNzVnUzZIYlg4RjhpY05wdDB4L0tualM3MUthcUNoNGdVb1QxZklE?=
 =?utf-8?B?TGdBVC9oeFJ3SHJEbXJ3eVBNOHhsd3hsZk9GbHFvZ0JhVWg3YmN6ejE4ZHhS?=
 =?utf-8?B?WmxLaE9aSnpyYzJTNzFUS1pTZFJuQ0NmQnQwS2lBY1Y0bERzTFJOZnRDRFpt?=
 =?utf-8?B?aG93T1BSRE9OcE5ZMmJIc2ZWQ1JTN3pPMml2enBEWVlGWkJnUWZRUys5Yi90?=
 =?utf-8?B?YnJQSXBJQS9uS2JSSDZXR1N2NlY2a1dJaXZaU2luVW9rVDNhRWFWZjBkdXpi?=
 =?utf-8?B?S3BkS00yQlBLUHdLRW5YVEJMNXNaU1ZTaFoxN2hSaGErOHJ0a0srZVVpUGxn?=
 =?utf-8?B?a3dOWlc3WHhSWGM0UUoreWo0OE9IRHNKTjhjakptUitJMDZoYXNxckx3VnhS?=
 =?utf-8?B?WnViWitiRWdRclpVNGhxTmNKYmh3eGRjblBEckVkZlY0cnRrSm01Y091bFBh?=
 =?utf-8?B?elhQK1FQeDRtSytENzRPYzQybyt0YUZRYmVRV1lDVUlidkNsdlBDKzZvWG4x?=
 =?utf-8?B?cEtyM3c0ZGQvR1EyRXZXa1NxcEpDcHZZZ21qUGhBY1NwUjNPWjBjSTh1TWlE?=
 =?utf-8?B?WGRsSTZwSkU5Y2twT1NuNlh0b1VxQ2swNzc5WEJOV2tNaWpLTmJWT2Z1WVJl?=
 =?utf-8?Q?N40WDg1KC5FptChOVvc7jD0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 248246ea-e197-498d-d166-08d9db1fc289
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 07:46:10.5316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5ypdcXV1eiunctNSgCKcMY4pHc8+g1J71HoTSkDOAkpJxrl3woQbNabF7kk6U6qufXJjnxnhPeTFEOvOY+LpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6806

On 18.01.2022 17:21, Anthony PERARD wrote:
> On Tue, Jan 18, 2022 at 11:06:38AM +0000, Anthony PERARD wrote:
>> On Tue, Dec 21, 2021 at 02:53:49PM +0100, Jan Beulich wrote:
>>> On 25.11.2021 14:39, Anthony PERARD wrote:
>>>> +$(obj)/%.c: $(abs_srctree)/common/efi/%.c FORCE
>>>> +	$(Q)ln -nfs $< $@
>>>
>>> Like was the case before, I think it would be better if the links were
>>> relative ones, at least when srctree == objtree (but ideally always).
>>
>> I can give it a try.
> 
> How about:
>     ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/$(if $(building_out_of_srctree),source/)common/efi/$(<F) $@
> 
> This will result in the relative path "../../../common/efi/runtime.c"
> for in-tree builds, and "../../../source/common/efi/runtime.c" for
> out-of-tree builds. There's a "source" symlink that can be used which
> point to the source tree when doing out-of-tree builds.
> 
> The part:
>     $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))
> means that if $(obj) were to be something other than "arch/*/efi", the
> command would still works and give the right number of "../".
> It does this steps to "arch/x86/efi":
>     arch x86 efi
>     .. .. ..
>     ../../..

Looks good to me.

> The added "source/" depends on whether we do out-of-tree build or not.

Well, I guess we're free to add a "source => ." symlink even in the
in-tree build case, deviating slightly from what Linux does? That
would then slightly simplify your construct.

Jan


