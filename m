Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C01036A545C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 09:26:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503095.775257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWvIw-00051D-EY; Tue, 28 Feb 2023 08:25:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503095.775257; Tue, 28 Feb 2023 08:25:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWvIw-0004xq-BO; Tue, 28 Feb 2023 08:25:46 +0000
Received: by outflank-mailman (input) for mailman id 503095;
 Tue, 28 Feb 2023 08:25:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWvIu-0004xg-Fq
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 08:25:44 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20609.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7de0af48-b741-11ed-9693-2f268f93b82a;
 Tue, 28 Feb 2023 09:25:43 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8233.eurprd04.prod.outlook.com (2603:10a6:10:24b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.20; Tue, 28 Feb
 2023 08:25:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 08:25:41 +0000
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
X-Inumbo-ID: 7de0af48-b741-11ed-9693-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/sn4/eRH2JOIZTR3Gm0WstoVWIxGt7dJNlaYHjfRBu4ZW9hRFyBdbyKqGXhjkQF1z7nFTba6HbZ6gcDApj38U+48IEUtTROcG5I+vq66q3VhccG9cSJHLAazpGx7/59LMH9uCZJboelFbXGSk8GCr49yoTCj2836MPq2npfg7jWFqKSfcE7K4cUC6K9uxm8aeUyuTqt2MpH+N7OK6j3jlYJYms1eLL0Qi+T1q62C+wnHogLslNOuTvyukCgFrcvhbHJd8+U5yOQWs4wwocwZU0dK4CSIub2qWqh+yUvaEY3khB9yqAwQYBFVS983nVlMtaG31plu3Pp0AQCMK0geQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cHhUllAWzizlBTNqM3PpXr8BBp+/9MKKVyIqA7v+Yc=;
 b=Jb3gOf9MuhuhFkmZe296fzzejOdDGs0E70szWwx1dJn+KFo9Q19MaFk06mwajdJdPVDy9CRFNQIukDAZGHL1pZTo4yb4l3Fp53ZlyN9MjyO65yMNjf4BvSgR7coOi7aA1AcCkEWHxLkaMjVeTABAvpJHjhaK9qyfaax5KPW2Wh752U+HXZzSV8m7lU4CRvMmoz5L5lg+qJyP6NUg6xIiPy3AqaynvCc3yALFqvw3rgpMC6I/YREHrsFiLaHPVu2vMxK5aFbgGmQuP/nfDhVfCZHihLtjQ+W3Lgeb6w84bJ9lNwBhMIJc/f0EdcNRLSvDMOErASYHtr8DVHiLZXkPzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cHhUllAWzizlBTNqM3PpXr8BBp+/9MKKVyIqA7v+Yc=;
 b=jhXigrtse95Q0bF0YyqwevlwQF7atrwGXOx0XuAfkBnzqG9paKP0ipGrFRTUykhS6Sh7xFV7hmfp6AV3qxyIFjxhoXwCV4mtMGAF3c43W4gB6/Zbi9B+Q+RqJtECjRZyH22/1DZPUNxCBqzyicKGkvhU+EVcVyUFvo6t0SfE0kIb+IBcP4ukjq+1dZihxy/W7z+9fYUwcIxAXSbgRlN5zzQFZzvUxGIuAsMp8xir5E86OJwxJlWIfeRcCs9FDU1bejfXdPz1MtFmnh4yPPbv7DjUQ3sXc6R0EAOFgactQObNgLRpJ70qdMNRcX0MYTwSw8SJajLDOaVjLqPHnySEow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <874a28ac-3ae4-a6c6-c230-570be3672441@suse.com>
Date: Tue, 28 Feb 2023 09:25:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] build: add crypto/ to SUBDIRS
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230227095315.6483-1-michal.orzel@amd.com>
 <c16cbd72-9a5d-cea7-dd17-c9521328fffa@suse.com>
 <113d8d74-19a6-85da-8b89-1a21bf95960e@amd.com>
 <bbf3edac-d992-28b0-91b2-ca97159fbce2@suse.com>
 <c38e0913-e588-712f-6e0f-698f9dbf51ba@amd.com>
 <8bb1d032-639b-d6f4-28f7-2f5e5fbcbf4e@suse.com>
 <bb354282-3236-c7d0-edc2-c7d18d2afde2@amd.com>
 <23af7286-fc1a-d495-d5af-a137dbc66898@suse.com>
 <5d2890c9-d78b-69af-fec3-dace8723ea24@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5d2890c9-d78b-69af-fec3-dace8723ea24@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8233:EE_
X-MS-Office365-Filtering-Correlation-Id: d3d7d5cc-ff56-4c19-4784-08db196560cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1450xiH66ATGIF5NgNue0Xhr15mWiebe3b1bBg3z4Y8530jEaHUj3hJUR9P3NPM1iipIjzEH8hcUaEUAfe6687sO13m7IvwcJOv27sG/UBRxZSOfPIDusd15NMrSLFwxQVP0VUgngEHG2GVSKCrcuqSyr+hydIrR5pTuSoOpmRECCRJrJGfStC35krQDHeYPhKO0AJFqzMzbqb7ggbyb9MnpH8QZcAByCgmp+wqSnpVUU7nl/Xbijqny/2Xwc4urgrnxvateS9BidHTQiUeuujFGZA0e0IBMNALVN2Z8GnW5MWhP2xTBLBPI99YSXvgPxs4j5zA18wEJRfsLRcN/rrWzHLLTz+JRoHqTjxiFbCy2ZqfjlWWAMcjKPZwolZYnRwR5gIGyRmN9L9IJGXtKSlxqeahOyG1zl5HUK4m8vEAeoCEt5z/M0ucesq/vfbjsexEUWfnBQD4M3linjdbv0CvwTLz+5gAAH3DxEhVXiTGypOXGA9qtQVxzZqSoemPHyPYA3nke9KKAbEUBaLu56MBS6OhhJDI1GstPKd892R5ou4UIcFnQ3Rhxn725Lx5RRgSx0/m9YSckZf5m95Tb27MonrUBhXkvmZsDj4qeQFOF1tmwiVz54PBS3Lo96SClOykcWG/bGH5aNtE+TJOwKzdHejd6YKc2BXTg1jpEfR9v97/kELSjJeM1HhUruZIOFxdhZskY/nrcxDeEbhPXp0TxRBrSf2bS0AVNHPR4p7c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(366004)(396003)(39860400002)(376002)(136003)(451199018)(31696002)(86362001)(6506007)(26005)(6916009)(36756003)(186003)(53546011)(4326008)(8936002)(66476007)(2616005)(66946007)(6512007)(41300700001)(5660300002)(54906003)(83380400001)(6486002)(38100700002)(66556008)(8676002)(478600001)(2906002)(316002)(6666004)(66899018)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDlCOEIxVUlrZFVKK00zamJmZ0d2VHVRMFJnamNqNUdCQ0o3dmRSbzhjcDNY?=
 =?utf-8?B?Ky82bVRxTFQrOTZ0eXdrVFpYTGIyeWJQYmxDZlM1a2NYTllrOE5USW91UkdM?=
 =?utf-8?B?T3VzVzlJLzJUS05SWEtrWk9qcFB3emFZZXpqS0tNVHlmM21rYm5XRDYyd3l3?=
 =?utf-8?B?ZktOWXhjcmVqNkFBRXRKSGRyLzE0bjVaT0RKV3FzM3NVc2ZXMTdXeEFsUDI1?=
 =?utf-8?B?dzdydXBGcWp3WUNkUXZGZC9FMHhOS1pnSUNRMGFtNmFpZzYxWDArd3BPTEVq?=
 =?utf-8?B?aDZTUisrK3FlcklGRGxOaDlxZTcrV1N1R1ljam9WWC9XakE0M0ZOcVF5enQ4?=
 =?utf-8?B?RUw5aEp6cDNnY0NvVGhKQ3ZUeXl4THlGVFdlRndLbzJVb3pOano3cVd0YXZN?=
 =?utf-8?B?U3duMktUa1NXYWNvaldKUXZFQkhTQ2xnY2NtWjRUWlNsR3cxZDZtK0krQVVr?=
 =?utf-8?B?ck9jNWNlRHN0NHdNck1oU21XRkVvNS8vam9yMUxoQTJYNFlTUHVIazFPdzlB?=
 =?utf-8?B?QVVhTis0NExCMWZRdnIxNHZTb1N0S2RIMnVXTWJzcHgrOXNabTZIb0RjYW1H?=
 =?utf-8?B?NGN4WWsrd3RyTjQwYWUzaUJwSDIrQ0U3cDRPMlZTWHM0TFBHL2pCdkM5dGZP?=
 =?utf-8?B?eC94ZWVxQnRLdUhOaXptZUh3K1daaE9CWFhFQjVCdHZQZlRWM0QxaTNDcHFv?=
 =?utf-8?B?YnJuaFB3b2pDOERncUljMktTTEhlWlAwMXp5VFRhUlBGUkg3WE5LeFFzZ2g0?=
 =?utf-8?B?am1ZWGRhOVlvb1JHZUE4c1Q0OWtNL3YrSHRPbzc1RXJBRjZPMEREd2N6R09r?=
 =?utf-8?B?UDk0MmV5YWVGNkRXYVpkT0NvRnU2YW13NThJSzZ0c2hiV0dVOXE1d2NPZEZk?=
 =?utf-8?B?SmRjMmUzaTNGd3VteFFlbFhXNzZ1VHlqcHJ4S3pISG94Qzk3OHVZZGJlc0RE?=
 =?utf-8?B?aTVRRitZampFR3NOaEZnQ2E0M292Q1hLanhsYjhJTEdMMmVoTCtnSzdIb2Ns?=
 =?utf-8?B?LzJoVncwVmF3ZnF5Nm5NMU16QzhST3pIVm9iK3pjREZyTk1lTzFKZGJjV1Qr?=
 =?utf-8?B?d1hPTk5ldko4RzhyQS9yRnpiT21yRWVLQThOMngvemZrbGJPRUNHK2xybVZp?=
 =?utf-8?B?QnlLdHVObytacmliVk5TaVpweEZiZitKMkIyR2txeThBL0E4Q2ZTU01nNlhv?=
 =?utf-8?B?dXQ3N3Z2NndJaUNLUzlIdnhOZHBJVWpJY0VyZTFMZC9qVWd1TGVibXNmcDAy?=
 =?utf-8?B?VkR2bWhhdFZIOW1PWkFrcGZPdEVNN3Jad2JOUVRzblYvUi9rTzd3YUFQLy9q?=
 =?utf-8?B?Zm5YQWYwSXY5ZCtPK3FuWW5ZUTFKU05JRFcxMEJZbHd3d3MrcDBROXRqeHFX?=
 =?utf-8?B?SFZuRVFkMGZJd0Jkd1IxRWluYmJQaUlMZ0lnbmVlYWJXaGptS3p4NW1oZ2xG?=
 =?utf-8?B?UTNEZ0hSM2xpdjVuRjdKaVNqTGY5M1ZkS2dxSllzckpzZnAyakpDQnAxZk84?=
 =?utf-8?B?eHJXT0pBZkduZHI5dzNvV3hnUUduTzFJUFdwYndMVitCdDBLbWdKcmxUb21R?=
 =?utf-8?B?VGFIQldoa2lkYXZOOGZOYllCZWNRSytYbDh0YUpZR01ybG1pT0puZkh6NTNX?=
 =?utf-8?B?VVRYSCt3cm1Kb0NFMFUzcG80YnMrbytka1F0VGNYZXpMS1cxWkphZ2hmNDY2?=
 =?utf-8?B?OFd6QTh2b0krM3BWU01RcDBXRDVoQUhDb2NEWWRMRnZWaWx1TlhTL2U4ckRq?=
 =?utf-8?B?dzRIdWh2SmE0S2xSbzhNektBaU5RcW5rblNjU3J6N1NMRFFrSHQ1WFk5TUFN?=
 =?utf-8?B?YWJGRmw3aGdOMkNJNkZJMGdlVWhKTDJtNytwM29uc1pZbFFHaTVhUXRSaUdi?=
 =?utf-8?B?RlFqSHc1RUo3anFNSEpjKzZVcU9qMUx1aEQzdWtQNWtteHVyb3ZJOGZpSDQ2?=
 =?utf-8?B?Ujl3YVVDRnAydG1vQi92MGhtY1Vxd3VpeEVLN1pwenVOc0Z6cDJoNkFXbVFY?=
 =?utf-8?B?dGphYUVWLzQ2MlFFWnFYZHAwelZGN21qYmNrL3lOV2sraW4wdk9Eemc0WjQ2?=
 =?utf-8?B?K3NhelR6N3F6VkRPMnZMend1bjlSZEk2Uy9KYWZvbzNEWlRVMjBXRTI5RGN6?=
 =?utf-8?Q?av5Z8hHqFY+2iMAGNU0JlxozV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d7d5cc-ff56-4c19-4784-08db196560cb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 08:25:41.1414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQP6zE1hpEltRD0UE1wSyfOocB0H9h4lisbF1oITPJZKVtlQPAwUshEDHU43dBk9wV2LbDhIMO7ZcZ8uEHGQUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8233

On 28.02.2023 09:14, Michal Orzel wrote:
> 
> 
> On 27/02/2023 16:57, Jan Beulich wrote:
>>
>>
>> On 27.02.2023 16:46, Michal Orzel wrote:
>>> On 27/02/2023 16:00, Jan Beulich wrote:
>>>> On 27.02.2023 15:46, Michal Orzel wrote:
>>>>> On 27/02/2023 14:54, Jan Beulich wrote:
>>>>>> On 27.02.2023 14:41, Michal Orzel wrote:
>>>>>>> On 27/02/2023 11:10, Jan Beulich wrote:
>>>>>>>> On 27.02.2023 10:53, Michal Orzel wrote:
>>>>>>>>> --- a/xen/Makefile
>>>>>>>>> +++ b/xen/Makefile
>>>>>>>>> @@ -589,7 +589,7 @@ $(TARGET): outputmakefile FORCE
>>>>>>>>>       $(Q)$(MAKE) $(build)=. arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
>>>>>>>>>       $(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' 'ALL_LIBS=$(ALL_LIBS-y)' $@
>>>>>>>>>
>>>>>>>>> -SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
>>>>>>>>> +SUBDIRS = xsm arch/$(TARGET_ARCH) common crypto drivers lib test
>>>>>>>>>  define all_sources
>>>>>>>>>      ( find include -type f -name '*.h' -print; \
>>>>>>>>>        find $(SUBDIRS) -type f -name '*.[chS]' -print )
>>>>>>>>
>>>>>>>> As long as it's arch/$(TARGET_ARCH) that's used here, crypto should imo
>>>>>>>> also only be included when selected (or at the very least only when an
>>>>>>>> arch might select it, which afaics is possible on x86 only right now).
>>>>>>>>
>>>>>>>> It would also help if in the description you made explicit that SUBDIRS
>>>>>>>> isn't used for anything else (the name, after all, is pretty generic).
>>>>>>>> Which actually points at an issue: I suppose the variable would actually
>>>>>>>> better be used elsewhere as well, e.g. in the _clean: rule and perhaps
>>>>>>>> also in the setting of ALL_OBJS-y. (That'll require splitting the
>>>>>>>> variable, to that e.g. _clean would use $(SUBDIRS), $(SUBDIRS-y), and
>>>>>>>> $(SUBDIRS-) collectively.) It is, imo, that lack of consolidation which
>>>>>>>> has caused crypto to be missing from SUBDIRS.
>>>>>>>>
>>>>>>> I think what you wrote can be split into 2 parts: the part being a goal of this patch
>>>>>>> and the cleanup/improvements that would be beneficial but not related to this patch.
>>>>>>> The second part involves more code and there are parts to be discussed:
>>>>>>>
>>>>>>> 1) If we decide to create ALL_OBJS-y from SUBDIRS, then we would need to carve out test/ dir
>>>>>>> that is not part of ALL_OBJS-y and add it to SUBDIRS later on. Also, the order of ALL_OBJS-y matters
>>>>>>> for linking, so we would need to transfer the responsibility to SUBDIRS. The natural placement of
>>>>>>> SUBDIRS (including SUBDIRS-y, etc.) would be right above ALL_OBJS-y. However, when doing clean (next point),
>>>>>>> need-config is set to n and SUBDIRS would be empty. This means it would need to be defined somewhere at the
>>>>>>> top of the Makefile (thus harder to make sure the linking order is correct).
>>>>>>>
>>>>>>> 2) If we deicide to use SUBDIRS for _clean rule, then we would need some foreach loop, right?
>>>>>>> Apart from that, there are other directories that are not part of SUBDIRS i.e. include/, tools/.
>>>>>>> Together with SUBDIRS variable, it would create confusion (these dirs are also sub-directories, so why
>>>>>>> not having them listed in this variable?). Also, I can see that we do clean not only for $(TARGET_ARCH)
>>>>>>> but for all the existing architectures.
>>>>>>
>>>>>> I understand that the changes would be more involved, but I disagree with
>>>>>> your "two parts" statement: If what I've outlined was already the case,
>>>>>> your patch would not even exist (because crypto/ would already be taken
>>>>>> care of wherever needed).
>>>>>>
>>>>>>> I would prefer to stick for now to the goal of this patch which is to add crypto/ so that it is taken
>>>>>>> into account for the tags/csope generation. Would the following change be ok for that purpose?
>>>>>>>
>>>>>>> diff --git a/xen/Makefile b/xen/Makefile
>>>>>>> index 2d55bb9401f4..05bf301bd7ab 100644
>>>>>>> --- a/xen/Makefile
>>>>>>> +++ b/xen/Makefile
>>>>>>> @@ -589,7 +589,9 @@ $(TARGET): outputmakefile FORCE
>>>>>>>       $(Q)$(MAKE) $(build)=. arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
>>>>>>>       $(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' 'ALL_LIBS=$(ALL_LIBS-y)' $@
>>>>>>>
>>>>>>> -SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
>>>>>>> +SUBDIRS-$(CONFIG_CRYPTO) += crypto
>>>>>>> +SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test $(SUBDIRS-y)
>>>>>>> +
>>>>>>>  define all_sources
>>>>>>>      ( find include -type f -name '*.h' -print; \
>>>>>>>        find $(SUBDIRS) -type f -name '*.[chS]' -print )
>>>>>>
>>>>>> The fact that, afaict, this won't do is related to the outline I gave.
>>>>>> You've referred yourself to need-config. Most if not all of the goals
>>>>>> SUBDIRS is (currently) relevant for are listed in no-dot-config-targets.
>>>>>> Hence your change above is effectively a no-op, because CONFIG_CRYPTO
>>>>>> will simply be unset in the common case. Therefore if an easy change is
>>>>>> wanted, the original version of it would be it. An intermediate
>>>>>> approach might be to add crypto to SUBDIRS only when TARGET_ARCH=x86.
>>>>>> But neither would preclude the same issue from being introduced again,
>>>>>> when a new subdir appears.
>>>>> I understand your concerns. However, I cannot see how your suggested changes
>>>>> e.g. making use of SUBDIRS in ALL_OBJS and _clean would solve our issue.
>>>>> They would reduce the repetitions (hence I called them cleanup/improvements)
>>>>> but as we want to keep tags,cscope,clean as no-dot-config targets,
>>>>
>>>> I, for one, didn't take this is a goal (perhaps for clean, but there ...
>>> So you would suggest to make these targets (except clean) .config dependent?
>>>
>>>
>>>>
>>>>> we would still not be able to use:
>>>>> SUBDIRS-$(CONFIG_CRYPTO) += crypto
>>>>> and use it in all_sources (because as you pointed out, it will be a no-op).
>>>>
>>>> ... the problem is obvious to solve, as outlined before).
>>>>
>>>>> Also, why do we care so much about guarding crypto/ if we take into account
>>>>> so many architecture/config dependent files for tags/cscope (e.g. in drivers,
>>>>> lib/x86, etc.)?
>>>>
>>>> Good question, which I'm afraid I have to answer with asking back:
>>>>
>>>>> If these are no-dot-config targets, then we should take everything, apart
>>>>> from really big directories like arch/ ones.
>>>>
>>>> Why is arch/ other than arch/$(TARGET_ARCH) to be ignored? And if it is,
>>>> why would crypto, used by only x86, not be ignored? As always I'd prefer
>>>> firm rules, not arbitrary and/or fuzzy boundaries.
>>>>
>>>> Furthermore, considering e.g. cscope: Personally I view it as actively
>>>> wrong to constrain it to just one arch. That'll lead to mistakes as
>>>> soon as you want to make any cross-arch or even tree-wide change. Hence
>>>> it would probably want treating just like clean. I can't comment on the
>>>> various tags (case-insensitive) goals, as I don't know what they're
>>>> about.
>>> The useful thing about generating tags/cscope per-arch is that you can limit
>>> the number of findings. Each symbol leads to one definition and not to multiple
>>> ones. But this is still not ideal solution because doing this per-arch
>>> and not per-config leads to inconsistency. Also, as you wrote, sometimes it is useful
>>> to have all the symbols loaded when doing tree-wide changes. So in ideal world we should
>>> have an option to use approach or another. I reckon this is why Linux
>>> has a separate script for that which allows to set all-arch/per-arch, config-dependent/config-independent.
>>>
>>> Anyway, I do not have any ready-made solution for this problem.
>>> The only benefit of this patch would be that the symbols for crypto/ would be visible
>>> in cscope/tags (TBOOT uses the crypto functions but there are no definitions present
>>> which may be suprising for people using ctags).
>>> But I can understand if you do not want to take this patch in, due to all the observations above.
>>
>> Well, I'm not outright opposed. But I definitely want to hear another
>> maintainer's view before deciding.
> 
> While waiting for other maintainers vote, I would like to propose an intermediate approach
> that would at least result in unified approach (related to what you wrote about constraints):
> 
> In general, there are 2 *main* approaches when dealing with code indexing.
> The first is a "tree-wide" approach, where we do not take Kconfig into account.
> The second is a "config-aware" approach, where we take into account Kconfig options.
> 
> At the moment, in Xen, the approach taken is not uniform because we take all the directories
> into account except arch/ where we take only $(TARGET_ARCH) into indexing. This makes it difficult
> to reason about. What is the rule then - how big is the directory?
> 
> The intermediate solution is to switch for now to "tree-wide" approach by modifying the SUBDIRS
> from:
> SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
> to:
> SUBDIRS = xsm arch common drivers lib test crypto
> 
> This way, the approach is clear for everyone and we do not make any exceptions. Also the name of
> SUBDIRS and all_sources makes sense as they are read as "global" by default as oppose to e.g. "all_compiled_sources".
> In the future, we can then add support for "config-aware" approach by taking into account Kconfig which involes
> more code.
> 
> Benefits:
>  - clear approach, no fuzzy boundaries - all in
>  - crypto can be included right away as well as any new subdir without requiring to fix the infrastructure first

I'm okay with that proposal (albeit if you make a patch, please have "crypto"
at least ahead of "test"), but it'll need agreement by people actually using
any of the affected make goals.

Jan

