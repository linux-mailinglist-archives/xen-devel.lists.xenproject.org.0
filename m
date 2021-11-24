Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA3D45B3FD
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 06:25:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230051.397761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpkmP-0003Rh-H3; Wed, 24 Nov 2021 05:25:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230051.397761; Wed, 24 Nov 2021 05:25:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpkmP-0003Ph-DG; Wed, 24 Nov 2021 05:25:13 +0000
Received: by outflank-mailman (input) for mailman id 230051;
 Wed, 24 Nov 2021 05:25:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZRI3=QL=oracle.com=dongli.zhang@srs-se1.protection.inumbo.net>)
 id 1mpkmN-0003Pb-I9
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 05:25:11 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3811d86-4ce6-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 06:25:09 +0100 (CET)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AO4TIU3021511; 
 Wed, 24 Nov 2021 05:24:39 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cg69mprj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Nov 2021 05:24:39 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AO5LV6p109571;
 Wed, 24 Nov 2021 05:24:38 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2048.outbound.protection.outlook.com [104.47.73.48])
 by userp3020.oracle.com with ESMTP id 3ch5tgq59m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Nov 2021 05:24:37 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BYAPR10MB2453.namprd10.prod.outlook.com (2603:10b6:a02:b0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Wed, 24 Nov
 2021 05:24:35 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::2848:63dc:b87:8021]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::2848:63dc:b87:8021%7]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 05:24:35 +0000
Received: from [IPv6:2606:b400:400:7444:8000::2e3] (2606:b400:8301:1010::16aa)
 by SJ0PR05CA0155.namprd05.prod.outlook.com (2603:10b6:a03:339::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.13 via Frontend
 Transport; Wed, 24 Nov 2021 05:24:34 +0000
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
X-Inumbo-ID: e3811d86-4ce6-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=m0y6mT4qyVR8XNUGc8DkKZTyZcBHqTyMWV7agwWQghk=;
 b=v50xQpJ8m7PDJ6lWq9awTk5jqEZSIJdUZ/sLK9LPh4P6r8s4Hmv7Rbm15fED6s958GCB
 2cvHtBYB4zy6EhPV4YFIhGwc7X6J7GdkR6vmxdzp78awbAPI/X1kzN83P9G08K/ZXkrg
 uGej99uZ9H6cnUsgoe18f6MFmrCzJHckDxTbXsrQKvFzxH2l8jRAkmw87WNnRcHzAi8G
 ORBjh8z4QTcQAv/s1+3S4Xbq0m/HT6DOYKQAd2goKPmy2CxEEtS1Yiozu8SAx+vBG6sT
 LXamz6aMuOlbNd+dlXnqU8MKzP5BOrhGhe2ylGgr+mtDUuzJ5nLghPZvKSBSwnKAh3qJ 8w== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mzAr5G4MmvDo6i0T1MsjnPi0g5bvKSuQ5hKTdoYoxFRpJWQ35vhbtlfqG/LQwRxoZauSmoXsZ8rWHNoddGHBpHeArdoc5nT9QUke1fUSOk8UmdSmBYh8jS6HeXZlLRjyewuTupHKanAzyTAeAVI8inLanmU+pO2Bw0opa0Kl3HqohRhtadSjyCDpnDTaSQGMcXm6C+RD5TQaD9L6v9o61xOg9sPJZpzFTjFeN0g2xcl27/mdCCFwpdn/YcgQXZMUYVT+1nYdvzNrXHXh7fO6DAJtsJJzlYDUEnZpqqIFlgguZTQOD61UaJFRVk7I8oHU35E2KrvaPfNgw4ox2mG6Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0y6mT4qyVR8XNUGc8DkKZTyZcBHqTyMWV7agwWQghk=;
 b=HMKJYU0wDAnCD5ofJLJBFAInrzGPuBeXdWRxyiLWWWHALfhgTAPP9H9XUrRJOoynokEayZFDe5sT0gbTVgOkJ+MLqRodp4zugq/UBS03BULtWEXTy8cjqBSIOL6rjwffY5ubIVmih3nqm/utEMYbN9GwOcAVIjEuX4IrTIpQYIR+o2aNlZbbep6zPPGHPU5B/uxoHbf42YN4tN3x0Q5B4TjxhZ2OsjAfqlfkpmIQwH9hRZtKpzaslNP9HWk47+Ky/V6iMKuxohYhEzsfvhXKMwHxov1VfrBKxwXRe9ChoU1f/3Y7Vwnu7x0ZamaJhePS3MjGd0v3EoH/5DdnU0hQAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0y6mT4qyVR8XNUGc8DkKZTyZcBHqTyMWV7agwWQghk=;
 b=BnOZPJFsmJ4bvIc4ozgOTA45HqGGGgR9dFZZOdoywAzbTg2iAC5fX3Yzclugg9jBkRN0vfM4BOhKiH6IhpwDkcKoZggLLLgzTs0UwdTg+13kjkvx7qV4nlng3ubSD2TQPJQiEuFPmcKUL5UWPnQTUFvfNkOGmNZTqsXMw1VJZLQ=
Subject: Re: [PATCH] cpu/hotplug: Allow the CPU in CPU_UP_PREPARE state to be
 brought up again.
To: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Gonglei (Arei)" <arei.gonglei@huawei.com>,
        "x86@kernel.org"
 <x86@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Juergen Gross
 <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>
References: <20211122154714.xaoxok3fpk5bgznz@linutronix.de>
 <d5f43af4-f91f-ef9f-9c33-8d349f59b23c@oracle.com>
 <46f7dbb8c0cb42228ed028ed89af1282@huawei.com>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <5c0b2ab4-7e97-b9a9-e1fa-d93323f23c1f@oracle.com>
Date: Tue, 23 Nov 2021 21:24:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <46f7dbb8c0cb42228ed028ed89af1282@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0155.namprd05.prod.outlook.com
 (2603:10b6:a03:339::10) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e662cf9b-db85-4d65-418d-08d9af0ab38f
X-MS-TrafficTypeDiagnostic: BYAPR10MB2453:
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB2453CCF805548488970C3F5FF0619@BYAPR10MB2453.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	szMdH1rPzsIpGTKSJbktML5fuzfyoVXarW6AqdOi2Sd7iP6kebeUGKoA9WI/PSyfe1ddZxvjBWKEW+Zkpu67gIlrnNjXjQRd/zLTcOsOBSjsUMsk2JsW8T6CErW+ilR3d4Jpy8lCqJlqp2yT0jwjJidF4ypqi0aDbb/wiGreimsj0RNVrn0a+R4abjFpk8Ns29EOxa7/oKoyzvypWbdQC4WWyNUN+Z89UwvdRs+s7N+MgO682LjmcE626VMog9cO8ki0taRP6JC5MNz50eFnrGE/6NDgFa10qVoB1JkWuCMLCX60FUMq1leozoLj1RnqSw8Mw5TKSG/cJ8WRjN99N0GRpJip7WR5hSzuXQCPS3IGV+nExyOq5bpxhuxBHbve2N0VGNYr+yDKSemkusrqkwI9S09vezUVUqY4zxclJOfDAtHMONBajpjt9iv19U3SIW2UNIsI7ev9feWVvH1kWR3o4Eu1jM0RvwazwyNZim5+yrEGqhM00bHzRXnbaFrZpA3fyJX1HWaDGbLpu/ry0swAFRNhOX/TybIvyIjMwp5cyDOFVBxXfqWvrT1BTyUbvxY7ck8cVpU0dz4oKQcy6LIIUIl6TZJL8s57krcNgPaXJBEFlU2nRxvKSiSZNgNIUDumfkHFaKFDUrPxMqxXLRXDpJNcB1q1VssGfw1qIiHMgt2FwKvtk38sVj3zRQWHFudWdcQhYub89x55gBDWCZeJxrtSmv4efGIEslrtsJcelJlvJXLhnFWo+/RgeHouJpY44g3OAAAQlsR98dvfS3YJij/xQAMiVErnfveQF9rBqNC2uSVaV0Twn1oS0zkkpCTMb38/jw+4l848UHHnXA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2663.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(110136005)(31686004)(7416002)(8936002)(4326008)(66946007)(54906003)(6486002)(44832011)(36756003)(31696002)(966005)(508600001)(86362001)(53546011)(8676002)(316002)(2906002)(38100700002)(186003)(66476007)(66556008)(2616005)(5660300002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T0ZYdU9TVGZkeWZ6UVh4MTZBVzErdnFZYlhxYkdkb0JYNkl5N2J4RlRoTTBM?=
 =?utf-8?B?N1ZjYWxJcEZ1UERKZVBlUHZwQndMOFpUZy9uRXdLR2Z5ZTk1WlQ1Sk1FejdC?=
 =?utf-8?B?QmNKeFV6UHd0cW1qZjVMeDliM2VQbnF1UjYvY3V4dlprcitmQzFvL29zdnZ1?=
 =?utf-8?B?b3drMlFMc25LSW42R1ZDV3pNUSswc3FMUTJpYkxndDRVd2FVM3pFRmpwMWRa?=
 =?utf-8?B?eXk3bmwvbE8zek5oVVNhOTRYRUlSN2w2blBCcDBXOTdPbDBZWTRnNXFaRlMy?=
 =?utf-8?B?ZCtlWXJSODBqT1NlMG9GMHp5M3VTSVRoZnlyak9qb2JWWmp6S1g5QmlNZHJF?=
 =?utf-8?B?TjlJd3h3bWhhWFZDMGNvaXcvZURLK0gveHlaSm5iZ2ZjWjdRU0grNUZqKzls?=
 =?utf-8?B?N3FEbWVpaU0vRE5aZ1BlVHRzOVhFSzBERlNBRTZUeWlPM3R3ZzVUNTJkUkJ0?=
 =?utf-8?B?QzZOb2IvZFBwMHlqS1Z5SW9DeHVsQUNsWmo4ak5wSEtiVUR1UFhSa1k0Q0x5?=
 =?utf-8?B?T0x5cXJBdDc1MmliV3NRVEZhTTNIdC90dFFjUUhudVJ0a3lmc3owWkl4WFhj?=
 =?utf-8?B?U0xZK2kwZks1UTlsS1FuVDdaR3pkb0JlOEw3WHhUNVdxeS9YT3E5dGMydzBx?=
 =?utf-8?B?ejdrQXRVcE8weGZta1FHNTJnYS9vK3NwQXkzSmJUMmpVdXFwYjBYUnpPa3Jq?=
 =?utf-8?B?WE5QN1JKM05nbkwwNGNuMEVsNGEzSnU0cHhXYlRRVTR4SVJxcmxaZmxsajJm?=
 =?utf-8?B?TzJYNnQyb1l0blhzYlJuQW1FQWNYTG1IR1cwZXJjbEpMSnJENG5QK0lrS0Nn?=
 =?utf-8?B?UW9ReUovckZscHk0endTb3hWMWN2S3JvSWFFSzFMdm1zemVMMW5sZi9iL01T?=
 =?utf-8?B?WVRpaldPMzRzRDdUUHdIN00zVmdSTTlIanU0U0FxRE1RMlk3VnFGY095bTBV?=
 =?utf-8?B?cjBVNTM3YnJxNG5IelZUOVRwUVE1L0NoYWwzOWdoQ0VJalYrWUZXOHBKMi93?=
 =?utf-8?B?aGZKdDFSdE5FNEpLR3lJdlFhbG84cGcvMldpNEMyMU15YlNrMk83TUVyVTBo?=
 =?utf-8?B?UmlHRHhwWmJyM2tHTlNBY1crUU85UFgvNFBCL0ptMVlsUTNrZnhWVkJwYXg3?=
 =?utf-8?B?UndLb1hnYVgweEY0WVpHclJUZW44YTZRZ1RrWDJlY1JXSkdiUDNWOVEwNkNk?=
 =?utf-8?B?ckVqOGNKcDlzVEtGM1k5eXMwaFpMQlhVT2JNSnB6TEdjREtTY1RkWUU1S3Y4?=
 =?utf-8?B?RjlSVmVVQlJxUWdzRUZUSWh1YktkcERwOWc5Q1hTSHQxdkpWZVQveTBhV0VW?=
 =?utf-8?B?WFNGMXhvU0FWWUR4dCtYWjRKNytkNXAxOWF4UzFWRGJ5SWtwcDVDQWxLbXBz?=
 =?utf-8?B?MTJvTis3bUZ4N05Cd0hJR0taaWU5VDlYdE9OSTlaM2dHYk1HakRod1VCdlFB?=
 =?utf-8?B?YnNTWVM1MHFzdklyOU9TQXJjdnNGRUE5Vis2Zm1zZVRMMjhpNEdLKzNWY2FK?=
 =?utf-8?B?ZEQrdWtjODYzNmcvSjZsejBLZVZQK0ZsYjNwckNSdCtFZjVNLzNnVkVkL1ZO?=
 =?utf-8?B?K1NyMUlmbyt3amJQL3dZUy9iOG53aFo3N0RSN1RJKzh0SzF0MmVnVUpkb3Iy?=
 =?utf-8?B?QktRcHN0VFJJdWFMVGp4ZHhwY3ZjWkphV1hyTXBPUXJXdVpkUlo1NXQxNDJJ?=
 =?utf-8?B?Nnc1cXlWazNVOEpRRmxQRjBWaHJ3TXVwWHNYREJ2Q3dFMjlEbmRaTmVKWXB5?=
 =?utf-8?B?SEgwalNWcjBTamRtcFF3VzR3eng0dGNWSFIvV0V4dlVuRExMNW00NWVlSVFR?=
 =?utf-8?B?UjhxTGNlYzZaRUhyb0tIVjZIa1BoYncvVkJndWttbExJTnJJUmpKV285dFox?=
 =?utf-8?B?ZFFQM3FQb0x4SzV1aURmeEpjaFlKVXphUFlFZEJmM3dBTC8wT0MwUkVxQUNF?=
 =?utf-8?B?ckpqTEhESDJkZm9DUGtNM1VjbDlMa2RkRitCME8yV0xqYUNaTzBDNll3aU1T?=
 =?utf-8?B?SFIvVksySzhYQWNjUjkxU2IvN2d5SHk0dFBZSi9lZmNGR05URjIrL0UxdnI2?=
 =?utf-8?B?V0FmMThpc1hVelEvK3lPTGFNQlhsTC9CdThFYm0yVEpsVmxYZCs4V281UDJJ?=
 =?utf-8?B?Y0s1TG94T3Q3U3djT3l5Zno2U082UnlqWTVMTGVtN1phOGtvWkxqeUlEYnF6?=
 =?utf-8?B?WURIVXhaVE5ORTlpZkdqNlh3MVBmS2tmWFBQSExSTjVITnRHSkNLdVFza05I?=
 =?utf-8?B?TTNETTRuWm1FSjlJVW9pdnhGb1VBPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e662cf9b-db85-4d65-418d-08d9af0ab38f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 05:24:35.0957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d8Rk8MR8pRYN0Y3ve4zUSA8F6cZWwPgZG19ikA3RXz8OwgGIskDcCdo0GMiBY+OefRi5RQVPNVitxz3DgEgRbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2453
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10177 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111240031
X-Proofpoint-GUID: fv6VGFIi2_PgJ8_BgZ_h_a-sdFFimo7F
X-Proofpoint-ORIG-GUID: fv6VGFIi2_PgJ8_BgZ_h_a-sdFFimo7F



On 11/23/21 3:50 PM, Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
wrote:
> 
> 
>> -----Original Message-----
>> From: Dongli Zhang [mailto:dongli.zhang@oracle.com]
>> Sent: Wednesday, November 24, 2021 5:22 AM
>> To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>; Longpeng (Mike, Cloud
>> Infrastructure Service Product Dept.) <longpeng2@huawei.com>
>> Cc: linux-kernel@vger.kernel.org; Gonglei (Arei) <arei.gonglei@huawei.com>;
>> x86@kernel.org; xen-devel@lists.xenproject.org; Peter Zijlstra
>> <peterz@infradead.org>; Ingo Molnar <mingo@kernel.org>; Valentin Schneider
>> <valentin.schneider@arm.com>; Boris Ostrovsky <boris.ostrovsky@oracle.com>;
>> Juergen Gross <jgross@suse.com>; Stefano Stabellini <sstabellini@kernel.org>;
>> Thomas Gleixner <tglx@linutronix.de>; Ingo Molnar <mingo@redhat.com>; Borislav
>> Petkov <bp@alien8.de>; Dave Hansen <dave.hansen@linux.intel.com>; H. Peter
>> Anvin <hpa@zytor.com>
>> Subject: Re: [PATCH] cpu/hotplug: Allow the CPU in CPU_UP_PREPARE state to be
>> brought up again.
>>
>> Tested-by: Dongli Zhang <dongli.zhang@oracle.com>
>>
>>
>> The bug fixed by commit 53fafdbb8b21 ("KVM: x86: switch KVMCLOCK base to
>> monotonic raw clock") may leave the cpu_hotplug_state at CPU_UP_PREPARE. As a
>> result, to online this CPU again (even after removal) is always failed.
>>
>> I have tested that this patch works well to workaround the issue, by introducing
>> either a mdeley(11000) or while(1); to start_secondary(). That is, to online
>> the
>> same CPU again is successful even after initial do_boot_cpu() failure.
>>
>> 1. add mdelay(11000) or while(1); to the start_secondary().
>>
>> 2. to online CPU is failed at do_boot_cpu().
>>
> 
> Thanks for your testing :)
> 
> Does the cpu4 spin in wait_for_master_cpu() in your case ?

I did two tests.

TEST 1.

I added "mdelay(11000);" as the first line in start_secondary(). Once the issue
was encountered, the RIP of CPU=4 was ffffffff8c242021 (from QEMU's "info
registers -a") which was in the range of wait_for_master_cpu().

# cat /proc/kallsyms | grep ffffffff8c2420
ffffffff8c242010 t wait_for_master_cpu
ffffffff8c242030 T load_fixmap_gdt
ffffffff8c242060 T native_write_cr4
ffffffff8c2420c0 T cr4_init


TEST 2.

I added "while(true);" as the first line in start_secondary(). Once the issue
was encountered, the RIP of CPU=4 was ffffffff91654c0a (from QEMU's "info
registers -a") which was in the range of start_secondary().

# cat /proc/kallsyms | grep ffffffff91654c0
ffffffff91654c00 t start_secondary

Dongli Zhang


> 
>> 3. to online CPU again is failed without this patch.
>>
>> # echo 1 > /sys/devices/system/cpu/cpu4/online
>> -su: echo: write error: Input/output error
>>
>> 4. to online CPU again is successful with this patch.
>>
>> Thank you very much!
>>
>> Dongli Zhang
>>
>> On 11/22/21 7:47 AM, Sebastian Andrzej Siewior wrote:
>>> From: "Longpeng(Mike)" <longpeng2@huawei.com>
>>>
>>> A CPU will not show up in virtualized environment which includes an
>>> Enclave. The VM splits its resources into a primary VM and a Enclave
>>> VM. While the Enclave is active, the hypervisor will ignore all requests
>>> to bring up a CPU and this CPU will remain in CPU_UP_PREPARE state.
>>> The kernel will wait up to ten seconds for CPU to show up
>>> (do_boot_cpu()) and then rollback the hotplug state back to
>>> CPUHP_OFFLINE leaving the CPU state in CPU_UP_PREPARE. The CPU state is
>>> set back to CPUHP_TEARDOWN_CPU during the CPU_POST_DEAD stage.
>>>
>>> After the Enclave VM terminates, the primary VM can bring up the CPU
>>> again.
>>>
>>> Allow to bring up the CPU if it is in the CPU_UP_PREPARE state.
>>>
>>> [bigeasy: Rewrite commit description.]
>>>
>>> Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
>>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>>> Link:
>> https://urldefense.com/v3/__https://lore.kernel.org/r/20210901051143.2752-1
>> -longpeng2@huawei.com__;!!ACWV5N9M2RV99hQ!d4sCCXMQV7ekFwpd21vo1_9K-m5h4VZ-g
>> E8Z62PLL58DT4VJ6StH57TR_KpBdbwhBE0$
>>> ---
>>>
>>> For XEN: this changes the behaviour as it allows to invoke
>>> cpu_initialize_context() again should it have have earlier. I *think*
>>> this is okay and would to bring up the CPU again should the memory
>>> allocation in cpu_initialize_context() fail.
>>>
>>>  kernel/smpboot.c | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/kernel/smpboot.c b/kernel/smpboot.c
>>> index f6bc0bc8a2aab..34958d7fe2c1c 100644
>>> --- a/kernel/smpboot.c
>>> +++ b/kernel/smpboot.c
>>> @@ -392,6 +392,13 @@ int cpu_check_up_prepare(int cpu)
>>>  		 */
>>>  		return -EAGAIN;
>>>
>>> +	case CPU_UP_PREPARE:
>>> +		/*
>>> +		 * Timeout while waiting for the CPU to show up. Allow to try
>>> +		 * again later.
>>> +		 */
>>> +		return 0;
>>> +
>>>  	default:
>>>
>>>  		/* Should not happen.  Famous last words. */
>>>

