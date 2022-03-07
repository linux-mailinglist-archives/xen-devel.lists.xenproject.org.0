Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 568604D03BB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 17:10:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286245.485684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRFwM-0000BL-Ie; Mon, 07 Mar 2022 16:10:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286245.485684; Mon, 07 Mar 2022 16:10:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRFwM-00007o-E0; Mon, 07 Mar 2022 16:10:30 +0000
Received: by outflank-mailman (input) for mailman id 286245;
 Mon, 07 Mar 2022 16:10:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/EJ7=TS=santannapisa.it=Andrea.Stevanato@srs-se1.protection.inumbo.net>)
 id 1nRFwL-00007e-8c
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 16:10:29 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a6f509b-9e31-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 17:10:28 +0100 (CET)
Received: from AM6PR03MB5000.eurprd03.prod.outlook.com (2603:10a6:20b:88::11)
 by VI1PR03MB6271.eurprd03.prod.outlook.com (2603:10a6:800:13a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 16:10:25 +0000
Received: from AM6PR03MB5000.eurprd03.prod.outlook.com
 ([fe80::cdef:8699:47b:300d]) by AM6PR03MB5000.eurprd03.prod.outlook.com
 ([fe80::cdef:8699:47b:300d%3]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 16:10:25 +0000
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
X-Inumbo-ID: 1a6f509b-9e31-11ec-8539-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zs8uw8kM5ORnHS49qUl3LAy4moHccT5yjIu6lOQozahGq/a8doZPgQFkjaD6qio3UwXBzgkEb5UGzcM9OQgKaJ4MTHXbtq6/ZIvMwAruiHeAe1+xJYkc8/LCgIpzT+cv4LvCcTVoIxs9rPEIwxC3pMw9FjKR09/5Llrv3AqGjT6o/TYX72Yc6vS8t3B9E8zQU+rAvEWrxGCCiicYbWLt8km51Yie9G7Cjj3bDHgYfOnnU238xc0tLyZsuH0HF11WoQ1QGkZIXNGzhxfuOq41V7UaGTTpXmT+FEb7HqyZMYwKDi6zD2vO1/QUn+TAK62kY6W8fDgjoc26N23C0hwfiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8m03gDCF/6FQNc1o72rGkzNTVqWIpKBWRPbyHs9zZPE=;
 b=U+1bsMlGwF9ndk0IkBf7vM+zZofwWfqDS1jEc4S2CKsYVIK45ub8qa55zxMr3hLr7GlrUj5dZOwblrpXmqK7GTyF2hPr0zOwxDezJQJe3hapfNoHtNB5a8S1JNBDyhkIA2RFU6QJ/2sNtevmPiLSxHVEk9qIiGeceT3PN2wIx00LDuO2EYUre5a12uKxqp74HSx25r8tjk5/ShNaIThkvj6N7I5C0gsRT7R9LZQA0rNFRIjDV5mBgduvYDX6ZWoQIojn7/Mb3vbjVEdMGd9Fcr9MT5rOnTP9HPsl+d+3Bp04Yb9Mk/3aCxVqva+QrzORx68D6H7FS0PqMyEdhMiffw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8m03gDCF/6FQNc1o72rGkzNTVqWIpKBWRPbyHs9zZPE=;
 b=nb13W0CJVjb+Old8OUPpGMpAF9rB21gXLXdD1b77LJyW3l515idmYRGTvHEI1uSZHE9LZrJSWEErOQ66a2pnfLK4GBIS4q2W7NSppl9rVoakpSJaG/t9uOOsERChXQJJ3YivuGXUz2rdAm5eghA90Avxwba12W5FHjIRzbCpE+c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
Message-ID: <f3ea9089-92db-d868-c7b5-6fb76124623f@santannapisa.it>
Date: Mon, 7 Mar 2022 17:10:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: Network driver domain broken
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
References: <DB7PR03MB50027EE92E11BFFF71AADC4598049@DB7PR03MB5002.eurprd03.prod.outlook.com>
 <92827eec-b6e9-9c95-8f9e-fcf063d45090@santannapisa.it>
 <YiDt7fX92n6Luc2l@Air-de-Roger>
 <CAKf6xpsnmQG7-LXn5+Uz4mncWsN0EZ8wpagY8f8OydvZNb6g5A@mail.gmail.com>
 <YiH9cee6NIKA6MWg@Air-de-Roger>
 <53a4fe6b-efc8-bfa1-8475-0aa58774051a@santannapisa.it>
 <YiIFyRUNXpUfzwRB@Air-de-Roger>
 <0ce52d38-f542-9336-a100-1cbfc559f218@santannapisa.it>
 <YiXq5HIrvZsy7QKU@Air-de-Roger>
 <b388ed5b-177e-2e9d-6450-6df16d9250c4@santannapisa.it>
 <YiXwhUnZL8bcJvH2@Air-de-Roger>
 <93fb9755-d40a-3cfe-1f6e-335b57d5a213@santannapisa.it>
 <e5c4c591-8ef4-f8d7-aa2a-b196a5a9749c@suse.com>
 <6028180c-ff1c-5d4f-2cf2-582e4104d888@santannapisa.it>
 <04e4ecfb-0235-db0d-d5fd-3274879003fa@citrix.com>
 <9b38e9b4-b2e9-b790-397c-38d7b62443d4@santannapisa.it>
 <CAKf6xpt7ygY_+zAHR6pHSRdtbgyjnSpB2Phz8qNCrdptU9H=Cg@mail.gmail.com>
From: Andrea Stevanato <andrea.stevanato@santannapisa.it>
In-Reply-To: <CAKf6xpt7ygY_+zAHR6pHSRdtbgyjnSpB2Phz8qNCrdptU9H=Cg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR1P264CA0039.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::31) To AM6PR03MB5000.eurprd03.prod.outlook.com
 (2603:10a6:20b:88::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f8cb651-1763-4291-d5be-08da0054fd24
X-MS-TrafficTypeDiagnostic: VI1PR03MB6271:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR03MB62718C9785116E419909286D98089@VI1PR03MB6271.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rAyqCUL05ahsXqv4PHrdQdFM/JNvuqRGpCejnj//zWck/kfoH1ZR0uXalsEnZwXYuRhX5NO8mdPP0JJU6sWONA+XZdHn8NbA7OsWPsHvOqsdwEitwfABmop7mMccll3iWbDr7y4u9C8uzPJZf9lrFAOsrIEdv0bFWZRBjPpAdZAaU9J5G7VDN0OWDg29E8IlqfBQfFzUDa8mh04jYxNsMhH/sHbYIgVI/MActxgdsUIVRmCQeUKx3BBkOpHl2hLbC2vgVTpSkAJr2tDShXAdGWXz/b4JmRzN76vkDv8PPvyg9qtUkZAvTyqdIKbct0UuFSvy8nByYbgIBLodXvioja/6dIafEnjXvbvB4cnkZRFL9+K+lin3/nJUylOilAujFhhSkIJQdL0UAaGqrJZs0u2WHSlCmVNmyhWkiQk6XkgjttLZ7+JIrzw2hJkGIylVczs7OsaOzW9GO9Wxtis7djNENYX8YzJLnmMDJICmZZXPmxqVFRJfe5K8L6vGIHdv58imyGpT1Iqt2TsyMnX83auSiFHkWWcgbpg03jO7aNxk+92sMvqv8CvvbQbUN8nrMxWRFGM7Cs8/KwDonsba/2kRpvrPyX8zA7ZvYqr0gdkbi/JQXUNerUXjjZQgfT7jrwWiztgRSCQ3OyQGK8EbkMimyfl8ariGTe89JN/VWbXOSdOm2GhENNJnEJUNjzMLhd4veJl2faZoJAGbsDuwENLJtm3rum1NcsTBRWVKsIeQmCVbDD5vSbMxN35yMK+kRrMQ5KoKru64peDiXUMnxA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB5000.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31686004)(53546011)(3480700007)(6916009)(54906003)(508600001)(36756003)(6512007)(6506007)(6486002)(786003)(2906002)(38350700002)(38100700002)(316002)(8936002)(66476007)(2616005)(66946007)(44832011)(66556008)(86362001)(83380400001)(31696002)(26005)(186003)(4326008)(5660300002)(8676002)(52116002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzZ4clI3WW5xd1VPUGExWGs0d1ZLNWNBM1pHNEY2S3ZlMndaN1dkVW5EWXRm?=
 =?utf-8?B?bU1wdEdoQkZmcnpKTlI0NWFONU9lSjZqc3l3d2VtQ013bC9wS0pnNEE4VkM3?=
 =?utf-8?B?amwyUnRNZzdoNUoyd3FtOVhKUVgwSTFKM2R0T21aQk10eTdxYTZVcWx0dDlG?=
 =?utf-8?B?dDhsdmJZRU96L1BRRTgwREtwdTg5ZDZENFp0eVYrdjR5UGZTdGd4M3IzZnpo?=
 =?utf-8?B?TXhwdGxjMnRvamg3MFVCd1ExcFVVS2xKZkQ3UWNndE4wQnZVQzNrT0lpMTRL?=
 =?utf-8?B?NG9UMW9Nb0NOYlFGUFI0aHVUUnJsZ1Fha1pDNjlvVWtMamljU1NlSnlHOFFo?=
 =?utf-8?B?eERFVWxrbTZ4ejNCMm5uaDZEYXRlUzlmNy9UcUN1QS9reVoxRlRXNTlTOStB?=
 =?utf-8?B?L2IvaC9PR1RtSUxBVzhMRlo2a25GMFFnTGIvOSswRzk0dmc3QTNWRFlXU1dD?=
 =?utf-8?B?Wjl1U3Z0b2VqN2I4WEVHUXBWYWFjSnNBaFE1VnpMWXNSNmxSenl3aFRPOG5i?=
 =?utf-8?B?dVhtYTNGY3dncUdQN3RvZC9Nc2JhTkNqaXh3c0FDUE01MWpocXpEdVowRHhN?=
 =?utf-8?B?UlRXcmRXK080OWZuek9teXF5amd1RU1pQy93QllMcXgrQm5CRlBLbzFHc1hP?=
 =?utf-8?B?Z2Uvbll0NjJDRFVhMHQzQU5NL29XTDFOSTlVZGJidzlsZ1cyZGpXNU9PZU5C?=
 =?utf-8?B?L0pXN2ZCcW9uM3JyNFBSN3VOV2hBdzU1UGVJUHlPNmJnMWFHWW0zMGI4R0Zw?=
 =?utf-8?B?UGVGaFNWSFVXZEkwQW5sN2FzOWtnaDVZQVU4dkFwYXR1eTVqNkRGSGVEQUJQ?=
 =?utf-8?B?L0h5VkFpcDRnalVKT1lXQ3hSQUkwRFc4cE9ma1RHVDh0b2xBL3JvRFN4UXZj?=
 =?utf-8?B?SEF6TmdsKzQzbnpBL1hkYnI1L0hoSW1JWFo5N0I5RWtYd2VBSUQweGMyNkMw?=
 =?utf-8?B?MkRIaDQ5bStvaWFkKy8vZUNaRDhWNVM4V0pLdWQ4QzIrZk5McUlPZUV2Z0NL?=
 =?utf-8?B?Q2k5bm0wbGdvZTUrNHhpUGVIbkdENmVXZWRiL1UvcnBQMDBudCtBZU9nQVA3?=
 =?utf-8?B?eXpac3FBL2FINkNyNTRPZ3E0TkUxNjlGbjluMWt6RGtzN012UFY1azVpV1VC?=
 =?utf-8?B?eTcwaGxRYzBrZ3NRazBMWFJqMmJqUndNaGpFSXpWYjI5Q08xZEd3dE01VXN2?=
 =?utf-8?B?WEVhL3BwSWQwRllBeEJSeUtqaUJWZE5mTjFxYmJHc25FNzNJK0s4cEtqZkhJ?=
 =?utf-8?B?ei9MaFRtcFNGU2tZbXI4UW9MdXZpa05walNTZWZaaTFDVTZpaW92L01rNGhw?=
 =?utf-8?B?clJLdFNlUlZnS28wN3VEUEhCTWZXakpDT3AwQjhzaE9KNW9MWnpNUytqbFlq?=
 =?utf-8?B?OUVCMGFES2I5UVJlbDY3ZU1sVExlUUU4YUE2c1ZaRk14U0plTDhiQjNKRzkw?=
 =?utf-8?B?Y243YkNLS2c5T25WTWYraCtVVTJ1L0FsL0pMcFRWUFc5VEszYnlkeDJpNVhL?=
 =?utf-8?B?dXBUQkUxRGlDQkwyQW8wc09naHVxTWFxZWV6Y1lkdUxTenJzL1A4a2w4LzV6?=
 =?utf-8?B?KzU2TWpkd2RTV2Q1RURIM1pPQVhEVWY2ZXZVSnlBY21zUHhBYUt1U3Mydllr?=
 =?utf-8?B?ODcybmcvaHhCY3pGUUVpSkZRbnpjakt5L3NlRW50RmtvbmV1QmU0eUtkV0R2?=
 =?utf-8?B?Q05wMCtudWozTnJ1MmZjcjR1clVlaU41aFl4RWhmbHVORU5BUGV5N1VCa213?=
 =?utf-8?B?S0Vob1dJWHV1UGVHVFlCZ01WdXVOQWJrekpabHBWbU85SWRYTi9OYVMxTTl3?=
 =?utf-8?B?V1NONnJpdlQ5NVIxOW9WRk93a0NyL1ZuZldzOVp6TkxsOGdEcjQ5cnFVcFNV?=
 =?utf-8?B?RUtnQzN1T285WHBuUExieTFOTENMMm5zY1E5UVUwMTg2QlNuL05ZaVFkRUNu?=
 =?utf-8?B?QlRGR05vSWlJSUFrNDFvVG5Md0pIeUQwZVQyMDdpOE5KNUFoeTVxcnpjZ1h3?=
 =?utf-8?B?QnhzRUJueUVWSjkxZTNCU2RObEVWSm1XUWFpTHd2V2ZvRVNibGFMY1U2dWhm?=
 =?utf-8?B?M3ZrR1EyMk9uZGY5dmU5Y2pKMEw5WFdCSlJLb0diR3dtS1oxUkprTHZzRzE2?=
 =?utf-8?B?QUMya3RRaEhNVHA5UVlBamlLUTRyenZHRzFyNkRVZ1I4SzJPWmpERjVkczU0?=
 =?utf-8?B?Y0JMSHArTW5DaERlS0Zwblo1TGlaa3Z1ZDc2YklDZUo2K3FEMDVaNFR5S3lB?=
 =?utf-8?B?UUxWVCt3eEs4MVJLNFVKRnVEd2xsdC9zSmtRZHdFK0g4MTZFWEltS2ZrbW9n?=
 =?utf-8?B?ZkhCUmRQWDUzYWVRYUhGTGVTZFF3VG5XaXdUUUt0eTRSQXRqVGpMQT09?=
X-OriginatorOrg: santannapisa.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f8cb651-1763-4291-d5be-08da0054fd24
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB5000.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 16:10:25.1586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKa0RdgTe+jsh+9cTrB8dh02hsSa5Ek6ktq/ATN4RQ0QlMNTs1V6fT+k0LKtN0jPO2XRQvQX8FCE8TK9VRtKztRYjjVjJfjJb1biONqURhdTC9cUdoY0ytDBNjHWdsiu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6271

On 3/7/2022 5:07 PM, Jason Andryuk wrote:
> On Mon, Mar 7, 2022 at 10:00 AM Andrea Stevanato
> <andrea.stevanato@santannapisa.it> wrote:
>> (XEN) XSM Framework v1.0.0 initialized
>> (XEN) Initialising XSM SILO mode
> 
> Yes, SILO mode is running.
> 
>> # cat /boot/xen-4.14.3-pre.config | grep XSM
>> CONFIG_XSM=y
>> CONFIG_XSM_FLASK=y
>> CONFIG_XSM_FLASK_AVC_STATS=y
>> # CONFIG_XSM_FLASK_POLICY is not set
>> CONFIG_XSM_SILO=y
>> # CONFIG_XSM_DUMMY_DEFAULT is not set
>> # CONFIG_XSM_FLASK_DEFAULT is not set
>> CONFIG_XSM_SILO_DEFAULT=y
>>
>> This is the default configuration shipped with petalinux. From the
>> help menuconfig, it seems that this XSM SILO deny communication
>> between unprivileged VMs.
> 
> You could try adding xsm=dummy to your hypervisor command line to turn
> off SILO and allow the guests to communicate.

I changed it to FLASK adding flask=late to hypervisor the command line.
Which one should I choose? SILO + xsm=dummy or FLASK + flask=late/disabled?
What are the differences?

Cheers,
Andrea

