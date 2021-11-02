Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B162442BB0
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 11:32:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219993.381072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhr5o-0005b5-6U; Tue, 02 Nov 2021 10:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219993.381072; Tue, 02 Nov 2021 10:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhr5o-0005Xm-26; Tue, 02 Nov 2021 10:32:36 +0000
Received: by outflank-mailman (input) for mailman id 219993;
 Tue, 02 Nov 2021 10:32:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxJb=PV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mhr5m-0005Xg-6f
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 10:32:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f6d22e0-3bc8-11ec-8555-12813bfff9fa;
 Tue, 02 Nov 2021 10:32:32 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2059.outbound.protection.outlook.com [104.47.0.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-3mwCzXK-MYq7c9OfcaTlDg-1; Tue, 02 Nov 2021 11:32:30 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2958.eurprd04.prod.outlook.com (2603:10a6:802:a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 10:32:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 10:32:29 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0408.eurprd06.prod.outlook.com (2603:10a6:20b:461::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Tue, 2 Nov 2021 10:32:28 +0000
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
X-Inumbo-ID: 2f6d22e0-3bc8-11ec-8555-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635849151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hVFsVQUi957b/LaDNG4DHkFAaKF5yG27B9SDhsZiFj4=;
	b=O1mWTH+8u/yGuCi4xoDaUxZ+MsoXA6I0SE9lbMNm24jL+8jkeyuD5emzN1F4XVdL1AGTzn
	e6fvrHqHE5RJdxenmH4dtEsogkrZXJool2RwykjzKKOTZQGt4S1Aa7wLx5lQ7W0FebKfyi
	n1KZJa+JKLshMHlnkoFaokppP1PYT50=
X-MC-Unique: 3mwCzXK-MYq7c9OfcaTlDg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WoZrH7JATERX9fRtSaGq1RB0fyXR+5aKn1QUniJhcY0LagOF7wx1QBAe327mmiGiZqrW7gdc/kGjUdX/t0hUixXVo5V3E5LliWa07iMwagxQ1SVToBcsyePq2M4ZCOgnls6p1iS6PBYFBdxx0FZFwXIwal6i0uM8W6tqYKjWmGU50useJ/m/M6KN+BdHiK7A1PJq3b0clhnLgsWizXWXKxU5YSk/+qxjl+r4qq/CXIuOKNbehA5tRv5a5+RmZYd2aUbxJsUHk8O7mgleSDUO0d6Nc38aCXJJxXw3X7AYzVUs4ECDyTGhFGrHyCCaWLhPDu5VlIFxwDRL6w0hSc3Biw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVFsVQUi957b/LaDNG4DHkFAaKF5yG27B9SDhsZiFj4=;
 b=UflwXuCJeMjy+3UVmx/HNpBh0IFaDFCdeUXJlCxZqh7SfJZB1Uh8t56rSG3Qg+zRrSaxh3edYopqVDweji1abcgiyBw9egUILX1F8pVZog2xcls76Z55pXh5aliJYapK4xP0BOkuhl2nsgwmIYbJB6HQnZCqIq06WyYLYAPLZQjzXMs8d+EKPG7Ugnv/RmvVlKyjs7ARZTYWPVEHwYjwmct4sSU4AuJBxQ9u8OFFfTVhJ8JRMmzMkuie9zXbolxFziaBNFvi/9Ko1RKLaIRVFDuLHpcMb7evW0PnshOmhiZGo6XXxf8KzJqkkk02M9yJXE+afklY0/QER0hsuxVsUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <356da0d1-4e13-5122-6fb1-0e1ed01a675d@suse.com>
Date: Tue, 2 Nov 2021 11:32:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [xen-unstable test] 165973: regressions - FAIL
Content-Language: en-US
To: Ian Jackson <iwj@xenproject.org>
References: <osstest-165973-mainreport@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <osstest-165973-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0408.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f4c97a9-d1c9-460e-eae8-08d99dec11dc
X-MS-TrafficTypeDiagnostic: VI1PR04MB2958:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2958D5FAC95B7E11F33DEB56B38B9@VI1PR04MB2958.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6IDEV1uYHvC9hSSybiwHLX/2NuGUC4GxpyapOBSCr3DvMqezeL4Q4aek7QG25hZnLq6Es+Umit0sqY4LXOp1IRhurAzEa6hGTeMDvpQO9ENzFyoRKcscRLLJrq2v3UrZPU1Tj1uE7VN7jkvvc+iiTqeTF+qPjaCo9UegtQxb78r3sfqC8aGazZBbxDKadSp24HjzR8l2Q0Kk6HXoahlRiN0+sZfQ58ItnVlifn6rRyQxkXXPEkfuJFNNeGudjgbemJFyJetspxTkaGj8Sygo/z8mu6tlz8UMm/AJ2JYZW5TrJOdI/lTZyAAAqdEx192y84L6C64D2DeKMFLV/Xac3DCsFxWIP8KyO1gO2aFmvSoE6FFLMYLk+2BuEM3b+kc/3FkZQuB7HXcbzZsWImCYPSJtsc/CteFbdoJqMBzQYdUNMrBzqTot2HcP0H2cJABlp3Xcei7WxTiz3hq+8+p3ebqwycafsrp42l0Bckblmag08ngH2eHOoEgSlvHHTYQfEr4tDnLUk8uC/3emhVVRAoQxtp0wqpfg3Yp+jaOsPDPsj6qOhxIDa/Su/kKbpUfkP1AWKBFVwtRZyp1fR7PZ/K22FTu8sNkL3zyGNMGX8wY1bYKQfnU7CDp6dF2dTrAmr7v5HEGdmA/IRVyW7QQrsYo85VH1jc1PRd40BtIFb1k426E9TdQY2gefeqc8m9woUnDdX5ACAxy1YVkWlAyR3pSle4V83+PUipG7LrPagC3/hjijIv6e/kUazX/t1g0x4iiEyXR3V3JZhUzFA2Ek3PXusFje5fIbFPmgt/Cc4ZSWrB3/jOZeeD2VFvYAPBMu3H0lPyq2Pdj2Rm9AJfBwTlX/LRrniWjncylyplaAY39u0Qbi/HlX1slENqttMSiavU5fbbEio6gFGOl3lxaqiw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(8676002)(5660300002)(16576012)(508600001)(4326008)(186003)(26005)(30864003)(36756003)(83380400001)(6486002)(31696002)(2906002)(6916009)(316002)(956004)(966005)(66476007)(66556008)(66946007)(8936002)(53546011)(86362001)(2616005)(31686004)(87944003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXpBRVVrbWtnVGx4MGpvd0REamtma09IVTBONTJQeTNTc2MvaXNXbVAyZWVn?=
 =?utf-8?B?dkF6R3E0UXlhSmlGektyUHhaUDBGS0s0dlp2ZlFLdGxpUmFZQlRjR1JiKzJM?=
 =?utf-8?B?ZGFIdkxEbWR4YkN3ZGVMS2hSQmp4WFBaRm9FaEhjTTBEQm9SVG1sdDc1VHo3?=
 =?utf-8?B?enRIKytIbUh4Y05iREZ6Q080UzZqU0VaNk9JdkdiL2tPd1BLdkloVHpkekJH?=
 =?utf-8?B?cVRBMGNSYWg4WGE2bWVhWWxSc1pyS25uN3lERFVtT2tMRWRNM3ZvSWxNcE5t?=
 =?utf-8?B?Z2dlTnNrZWlSbm52dGZHRW1Bb0ZoMHRuNHZKRkdkV3FhcjFTa0lMYWhNaG9h?=
 =?utf-8?B?MUZZb01RTmpGZDJReXBLbTNBOWVCK2VEa21YSWZaL0FXR1BwV05iNFZLeDVy?=
 =?utf-8?B?OUtKSk56MWl3a3djUk4xdnZoZFY4Rm9IL0NkNlB6V3dTWXEyK2svWXkwNEpQ?=
 =?utf-8?B?eVRPenZEUncxYjlQVDhFRDlFR1RtWW4rWFZhL25YaWJuMXJxOFM5NDYwZUNN?=
 =?utf-8?B?K1k5aG1qeGV6ZngvT21GK1BkNXpaQjFVMWlpdCtseFRldmh5MnN4QW9vWkFv?=
 =?utf-8?B?UXRrUFJuZkN1ampXb0JVZzN3ZDhHTDF2ZDNLNVJLcnQzVG5RZTJ0MTVKcXlD?=
 =?utf-8?B?NnI0aVliQUg2SUh3bXFPOENhamF0Q1NUdk81VS8vMlZsemZUa2VWTmI0ek90?=
 =?utf-8?B?WC93NGRSWUwzQVFiUGdmekRxeWYyRElKTU1EUFM3RHBKTkx3TCtIMnpWUWxW?=
 =?utf-8?B?aG1COFZvV0dZdC9NZzhOajR6b3orTG1rUEdCNVhFYUtLT0NMaUNFWmM5ZlJ2?=
 =?utf-8?B?WDUyRUN1MUVZbDRlZG0vQTFsR0tXSHNqamI1eVFWT2l6dWE3dkplNUFHYTJ3?=
 =?utf-8?B?S3R2Z213ZVBhM0tZYTBsK3l0WXJmUFduWjlrRmhhNk4xbzk3YkdCbHlQNk95?=
 =?utf-8?B?OWk5bkE2MHUyQTJGVXRReCtMS2wxRW1qUVhlbkVEZGN5OVFwMWlSaitHTlpW?=
 =?utf-8?B?S3dETmc5cEZsa3M2TDE0dE9aVWJGYzU1Mk5EeHFZTDhZVXZrOFFvSWZUdG1n?=
 =?utf-8?B?aVNNWWorMkNFcndreFNjd3p3dHgvcXF5TlpPQ1FaS3ZUMEN0dG5JaEtKcDBi?=
 =?utf-8?B?VjB3UmpWYW5RM1BZMSsvZkhpVERTS0xZNjdZQVp5MXo3NytLcEpMdmlxRldm?=
 =?utf-8?B?dUkyVXhNaUloQ3FTZm1MMTZTeVE2TC9IWG5UWjF3TVI5VFc0RURzMjg3QXJo?=
 =?utf-8?B?WCtob2dHRmoyK2xsRTZOa0doN1REbTh5Z2o0VGJ4VHJiS2oycjZaRUR6QXd1?=
 =?utf-8?B?UkMvaDErQ0pDNHZBSFh1NGhCdjQxUUszWW1yd2dWWmJ5STI3VTY3VTUrblF3?=
 =?utf-8?B?c0tTU0tIZjF2Q2dFUHM3ckJaYmwxbkxOWXFLN1JPNUxTM1E5Ky9tUFhaMW1s?=
 =?utf-8?B?R0tvM3NjYjBaMjRSR1dTN0NmOU0wUUhvTGtxYitzMTZMbkdkdVVBMktaZW9S?=
 =?utf-8?B?bGsvL0dOU1F2cXhtV2RvK2hyR0dRMkpFRm80U2psWllpODFpZXNmZ2hlZHhQ?=
 =?utf-8?B?RWNQem8xVE5lUGZLcjQ5Y2EwaHdQdWxqK21nUUV1UHBOeDJXRHU5U0hTaFZI?=
 =?utf-8?B?NndIWEJpTUlKR1c0K084bndXOGZtcFVwN1dTU1Y4Qm12SjJTLy9HcFFOcUcv?=
 =?utf-8?B?akpkSHdYZDJGUzNOT0ZVSTBQTXdpQzJxbTMzaVVNZnBQcHdZampXaWsvQkZW?=
 =?utf-8?B?WDZVQ0RoMTRpbVh3NG5LT1lnUUl1THlvQURBeFRWbUNOaUwvTURXR1NXeURB?=
 =?utf-8?B?L2Y4VGl3UEtYZWo0bG92QW9oZ0h5eHVVTVpWS3RwOE1nQkgzM012WUxxSHhK?=
 =?utf-8?B?QXpQcUM4c0pCVWtqNTRTRUplckNSWG93WGsyeW0yUmRMeVNoa1dGY3pKR2Ev?=
 =?utf-8?B?SEJpOGppUjZNVnowbW1iNXBJUzRJY0NJbkIxOWpiZUtkYlVJSGZDcnd6US80?=
 =?utf-8?B?Nk8wV3F3ek5DM1ZOdW9sblpsSGNBSm9rVmpDeFZqcytwQy94ZVlyd2FpYytR?=
 =?utf-8?B?MlArRnc4TXFFMmJIcno3cTNSYis5VThqYTd3SW41VHA2OTVQUitsenlvVzlB?=
 =?utf-8?B?Sk1lQ2dML25mS1dvTGVDUG1FdHJVZjJ5MVl1bDlFMnFsclE0NENRRFAwRkU3?=
 =?utf-8?Q?7ukXvD9PZ278+rf3ojPfx+0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4c97a9-d1c9-460e-eae8-08d99dec11dc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 10:32:28.9108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dtjofIQ1XAKUKonz6GCRw/agOGQdLLdN+vIPFuxB02SefMT8vAle6wH+kZ1UxKTnK9uSet+GU0x4aeaS1eGxzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2958

On 02.11.2021 04:07, osstest service owner wrote:
> flight 165973 xen-unstable real [real]
> flight 165977 xen-unstable real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/165973/
> http://logs.test-lab.xenproject.org/osstest/logs/165977/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-examine      4 memdisk-try-append       fail REGR. vs. 165966

Ian - another force push may be on order here, as this again ended
up running on one of the albanas?

Jan

> Tests which did not succeed, but are not blocking:
>  test-amd64-amd64-xl-rtds     20 guest-localmigrate/x10       fail  like 165966
>  test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 165966
>  test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 165966
>  test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 165966
>  test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 165966
>  test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 165966
>  test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 165966
>  test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 165966
>  test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 165966
>  test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 165966
>  test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 165966
>  test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 165966
>  test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 165966
>  test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
>  test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
>  test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
>  test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
>  test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
>  test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
>  test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
>  test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
>  test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
>  test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
>  test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
>  test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
>  test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
>  test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
>  test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
>  test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
>  test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
>  test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
>  test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
>  test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
>  test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
>  test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
>  test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
>  test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
>  test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
>  test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
>  test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
>  test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
>  test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
>  test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
>  test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
>  test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
>  test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
>  test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
>  test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
>  test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
>  test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
>  test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
>  test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
>  test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
>  test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
>  test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
>  test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
>  test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
>  test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
>  test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
> 
> version targeted for testing:
>  xen                  9f8434d77859462ad98a51ec49ad8e23769d9b10
> baseline version:
>  xen                  3030a73bf849a50411da95e94abf23cb7e8642fc
> 
> Last test of basis   165966  2021-11-01 01:52:55 Z    1 days
> Testing same since   165973  2021-11-01 16:07:55 Z    0 days    1 attempts
> 
> ------------------------------------------------------------
> People who touched revisions under test:
>   Ian Jackson <iwj@xenproject.org>
> 
> jobs:
>  build-amd64-xsm                                              pass    
>  build-arm64-xsm                                              pass    
>  build-i386-xsm                                               pass    
>  build-amd64-xtf                                              pass    
>  build-amd64                                                  pass    
>  build-arm64                                                  pass    
>  build-armhf                                                  pass    
>  build-i386                                                   pass    
>  build-amd64-libvirt                                          pass    
>  build-arm64-libvirt                                          pass    
>  build-armhf-libvirt                                          pass    
>  build-i386-libvirt                                           pass    
>  build-amd64-prev                                             pass    
>  build-i386-prev                                              pass    
>  build-amd64-pvops                                            pass    
>  build-arm64-pvops                                            pass    
>  build-armhf-pvops                                            pass    
>  build-i386-pvops                                             pass    
>  test-xtf-amd64-amd64-1                                       pass    
>  test-xtf-amd64-amd64-2                                       pass    
>  test-xtf-amd64-amd64-3                                       pass    
>  test-xtf-amd64-amd64-4                                       pass    
>  test-xtf-amd64-amd64-5                                       pass    
>  test-amd64-amd64-xl                                          pass    
>  test-amd64-coresched-amd64-xl                                pass    
>  test-arm64-arm64-xl                                          pass    
>  test-armhf-armhf-xl                                          pass    
>  test-amd64-i386-xl                                           pass    
>  test-amd64-coresched-i386-xl                                 pass    
>  test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
>  test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
>  test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
>  test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
>  test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
>  test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
>  test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
>  test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
>  test-amd64-amd64-libvirt-xsm                                 pass    
>  test-arm64-arm64-libvirt-xsm                                 pass    
>  test-amd64-i386-libvirt-xsm                                  pass    
>  test-amd64-amd64-xl-xsm                                      pass    
>  test-arm64-arm64-xl-xsm                                      pass    
>  test-amd64-i386-xl-xsm                                       pass    
>  test-amd64-amd64-qemuu-nested-amd                            fail    
>  test-amd64-amd64-xl-pvhv2-amd                                pass    
>  test-amd64-i386-qemut-rhel6hvm-amd                           pass    
>  test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
>  test-amd64-amd64-dom0pvh-xl-amd                              pass    
>  test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
>  test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
>  test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
>  test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
>  test-amd64-i386-freebsd10-amd64                              pass    
>  test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
>  test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
>  test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
>  test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
>  test-amd64-amd64-xl-qemut-win7-amd64                         fail    
>  test-amd64-i386-xl-qemut-win7-amd64                          fail    
>  test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
>  test-amd64-i386-xl-qemuu-win7-amd64                          fail    
>  test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
>  test-amd64-i386-xl-qemut-ws16-amd64                          fail    
>  test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
>  test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
>  test-armhf-armhf-xl-arndale                                  pass    
>  test-amd64-amd64-xl-credit1                                  pass    
>  test-arm64-arm64-xl-credit1                                  pass    
>  test-armhf-armhf-xl-credit1                                  pass    
>  test-amd64-amd64-xl-credit2                                  pass    
>  test-arm64-arm64-xl-credit2                                  pass    
>  test-armhf-armhf-xl-credit2                                  pass    
>  test-armhf-armhf-xl-cubietruck                               pass    
>  test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
>  test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
>  test-amd64-amd64-examine                                     pass    
>  test-arm64-arm64-examine                                     pass    
>  test-armhf-armhf-examine                                     pass    
>  test-amd64-i386-examine                                      pass    
>  test-amd64-i386-freebsd10-i386                               pass    
>  test-amd64-amd64-qemuu-nested-intel                          pass    
>  test-amd64-amd64-xl-pvhv2-intel                              pass    
>  test-amd64-i386-qemut-rhel6hvm-intel                         pass    
>  test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
>  test-amd64-amd64-dom0pvh-xl-intel                            pass    
>  test-amd64-amd64-libvirt                                     pass    
>  test-armhf-armhf-libvirt                                     pass    
>  test-amd64-i386-libvirt                                      pass    
>  test-amd64-amd64-livepatch                                   pass    
>  test-amd64-i386-livepatch                                    pass    
>  test-amd64-amd64-migrupgrade                                 pass    
>  test-amd64-i386-migrupgrade                                  pass    
>  test-amd64-amd64-xl-multivcpu                                pass    
>  test-armhf-armhf-xl-multivcpu                                pass    
>  test-amd64-amd64-pair                                        pass    
>  test-amd64-i386-pair                                         pass    
>  test-amd64-amd64-libvirt-pair                                pass    
>  test-amd64-i386-libvirt-pair                                 pass    
>  test-amd64-amd64-xl-pvshim                                   pass    
>  test-amd64-i386-xl-pvshim                                    fail    
>  test-amd64-amd64-pygrub                                      pass    
>  test-armhf-armhf-libvirt-qcow2                               pass    
>  test-amd64-amd64-xl-qcow2                                    pass    
>  test-arm64-arm64-libvirt-raw                                 pass    
>  test-armhf-armhf-libvirt-raw                                 pass    
>  test-amd64-i386-libvirt-raw                                  pass    
>  test-amd64-amd64-xl-rtds                                     fail    
>  test-armhf-armhf-xl-rtds                                     pass    
>  test-arm64-arm64-xl-seattle                                  pass    
>  test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
>  test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
>  test-amd64-amd64-xl-shadow                                   pass    
>  test-amd64-i386-xl-shadow                                    pass    
>  test-arm64-arm64-xl-thunderx                                 pass    
>  test-amd64-amd64-libvirt-vhd                                 pass    
>  test-arm64-arm64-xl-vhd                                      pass    
>  test-armhf-armhf-xl-vhd                                      pass    
>  test-amd64-i386-xl-vhd                                       pass    
> 
> 
> ------------------------------------------------------------
> sg-report-flight on osstest.test-lab.xenproject.org
> logs: /home/logs/logs
> images: /home/logs/images
> 
> Logs, config files, etc. are available at
>     http://logs.test-lab.xenproject.org/osstest/logs
> 
> Explanation of these reports, and of osstest in general, is at
>     http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
>     http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master
> 
> Test harness code can be found at
>     http://xenbits.xen.org/gitweb?p=osstest.git;a=summary
> 
> 
> Not pushing.
> 
> ------------------------------------------------------------
> commit 9f8434d77859462ad98a51ec49ad8e23769d9b10
> Author: Ian Jackson <iwj@xenproject.org>
> Date:   Mon Nov 1 12:36:26 2021 +0000
> 
>     README, xen/Makefile: Change version to 4.16-rc
>     
>     Signed-off-by: Ian Jackson <iwj@xenproject.org>
> 
> commit c9ce6afbf2d7772f47fc572bb7fc9555724927ed
> Author: Ian Jackson <iwj@xenproject.org>
> Date:   Mon Nov 1 12:33:54 2021 +0000
> 
>     Config.mk: pin QEMU_UPSTREAM_REVISION (prep for Xen 4.16 RC1)
>     
>     Signed-off-by: Ian Jackson <iwj@xenproject.org>
> (qemu changes not included)
> 


