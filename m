Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7213ECEF3
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 09:04:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167193.305167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFWf6-0006WH-Eo; Mon, 16 Aug 2021 07:03:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167193.305167; Mon, 16 Aug 2021 07:03:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFWf6-0006UM-B6; Mon, 16 Aug 2021 07:03:56 +0000
Received: by outflank-mailman (input) for mailman id 167193;
 Mon, 16 Aug 2021 07:03:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tuO=NH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mFWf4-0006UG-Mq
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 07:03:54 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ce424ac-fe60-11eb-a444-12813bfff9fa;
 Mon, 16 Aug 2021 07:03:52 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-dTPtAkxEPqGv5Bn1D-OxfQ-1; Mon, 16 Aug 2021 09:03:50 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5741.eurprd04.prod.outlook.com (2603:10a6:803:df::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 07:03:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 07:03:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR10CA0047.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Mon, 16 Aug 2021 07:03:48 +0000
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
X-Inumbo-ID: 1ce424ac-fe60-11eb-a444-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629097431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1xGu9G/uWz3ddAtWlgVp54klV3LYSk/IFZxilkBLbiw=;
	b=V5CanD5adZ1BiZ1lfxPXMLKIBqwD1m9QPSRCj4A89YNrsgVJ4oLBzaJJ8FDv6dQAVBfLRa
	x0jSpHa5CyWv+skV/72uBbYmo/RUhcZm0s90XxN34zBxBqjVRKCZ3VOZ7nUGKoUKH2qk8V
	55YguaEZnfBH0j8X+wWwvQEbb4CRSA0=
X-MC-Unique: dTPtAkxEPqGv5Bn1D-OxfQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VKyvR3A3qu/KoBFlqR54FCaFFxNL/50ZdwuQThFc/12EqV8E7ZP1zWketrZWDXJ3TqBQ61s6Bq4zwnZw6d1S2vwcJVccWPKOtpQKrVFsu3mDlrCMHLzI+SFzF8ZIN1tB2sK3zuUOQjIJwRfT5fsizEXQIVOb929G7xCj+08ixqHwWKE5VYNas+ePAN7OvkzRT7oqvMIRvoJUl1nLr1FAiQSG3vabYONP92WwFE1pJhIOngdIIRromBNXFWxM0Bq+XbPyhGVAZtSF2WR2Pn9xOsnyiby7tLGJwJXAu/LOboBvE2jVEXfww2MY4VkmOjTggf751j2qoagRM7WOLEIFEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xGu9G/uWz3ddAtWlgVp54klV3LYSk/IFZxilkBLbiw=;
 b=Xl3YmjO0PU1zEngehpfbAfdpqvJShOAmUKc/KxkY9dZ4H7vB6h3/t/i4cvtc70NZIbTbZinMKAml0g80rT73hxHbocrX8PArRf8BNTCBBi5I7M4X10Z6l6+APkgd8p86a+IdBXgTuUvNtR2XGpFXYmh1ropEJ0RHbULkkbC8PR4GfiHaKug+98gUFaPtszVtSwoJxryO4p6F0l9/Jjy+11FACd3ofW2OohvGQHyRaqxvq1z5WV8Xgdrplrrzla3md9aj87IYc47qiq/wTXBvPa+/IjMCfcdmXq+JRWY6m47ce42g24UeyVhyLVSyZEXLlVpWS6O4UnKKYGCKBDxmcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [xen-unstable test] 164195: FAIL
To: osstest service owner <osstest-admin@xenproject.org>
References: <osstest-164195-mainreport@xen.org>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0ee3f99c-0ca1-18e3-f8ab-e2f10f435720@suse.com>
Date: Mon, 16 Aug 2021 09:03:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <osstest-164195-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0047.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ecef39c-c252-4941-74c7-08d96083feff
X-MS-TrafficTypeDiagnostic: VI1PR04MB5741:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5741BB5B839CC4ED29612861B3FD9@VI1PR04MB5741.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q0LdY+yngQHXcRjd1jXm8kGHqu7ubYDaualp8qZ8mHKJvlwklGgUDjMSD3FAlSTcsUDCXtv5j1t4WFioWaYlau5UvJQL8IqWJ/CkqVWXU4+TFI2cid7MBtMei0oKPauqzMCdSOM/RIJ84uIo56UnZ5PzRJZJsfHqTgdfuRHFiKq052WRO9FQmWXYLPpH2aNYhIOqxzPXa2TcEd4IrdeFdcsBA7mSF0Xz+0rpXmCaET/DWiNCrtS2jJ2VGeAxncrdjaQ2pdqEuShpzouxTOSe9WXg455ymYfghsP6cJlC2crzyT3erVJerrQCTHvoxhKcKn/Vp2vRKFqPB+lwW/X5qzY3yMemmOcAmKxg/KIw23hibZOpO5f7dk59pewhf4dBgCr9kiXr3OgCSVHixnoCZY4LMjSy6Ue7ayt0r7ErHtLOfx03bcMGo9xtcuzHAiUey5efy5pECKJYBtweHsGlBTaTV7QEzSi3wwPaUrfF1GD2w2059TxAyBt05+nPjSHxsvAG2YhEHTle2uKfTGsp4rQ3smH13c8dJf6A3rLg2umzaz7muT61WeLtQmx8NNgiWvMnjCeJJIqdPYq4Lo9+hF8i9Jtie4UGPAY0dMIJAyEj1rQWso6nTknzrKtPycYNXAtR9CU5dn5kZ92u4ben0csNMQMm/cFrKbWeXw5X6BoF71vl2LDKZY+toPOX62Ox1ryfsHp/UpbDIiACgDkMKLjFYNyUZx8JTQ0RHaJYJDPx1+o8gFq9F3zioBPFcJkJ38MbspSLTFO5pKk0vxWLu34cI2yAv2M2pFs1u98pMqjau5XiEn7v3tH4rtgWGxWZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(36756003)(31686004)(508600001)(53546011)(8676002)(38100700002)(186003)(966005)(8936002)(316002)(16576012)(956004)(2616005)(31696002)(6486002)(66476007)(66556008)(4326008)(83380400001)(6666004)(5660300002)(2906002)(86362001)(6916009)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MCtNcDd3cEwzQkk3K0NSVnNkZGxGYzNDYmpmU1IvN3lCZ2NsRW5VdHREUjll?=
 =?utf-8?B?UUVadzA4ZFh4OWtsaEFUNzZ5M0JocDRadzRscTZUYi8rNmQyY2JNeWZocTRI?=
 =?utf-8?B?MjVyTW5kc2diUU0vSVBhcHo5VlcyL05Za3lPK1VxR0JNT0lKTXE4N3RpTW1i?=
 =?utf-8?B?eTdWWnJzbXkvOFpHU1lHUVpzaVFyYWhXNytXOFhsK3ZCUDhxUHlGUStPT3Fy?=
 =?utf-8?B?QjRsblhCaFlYM0wvS3hOMXY3QXo5Y0V1TGFib0U1WFNLcXN0b3VXL2dvaGM1?=
 =?utf-8?B?NmV6Z2ROT29UK1MvZGp4RTJLVnYrYWN1MjdaQlFGZG1tNTZlZVU5VnNBS0Fu?=
 =?utf-8?B?bC9PcmxQNTZzaExnZlFFeVdBSWZKa3BJRnF3Ukw5ME1DRHltaVZGWUp4SlMx?=
 =?utf-8?B?SmhMSjZ3a0Z3NW5QWVYxcUt6WmhCNzJESnk0S2Vhc3ZudUFmV1JXdDUyOHFH?=
 =?utf-8?B?T054bExwUWJCSFpKT1V1VXlLKyt5aThTTUs0SWdIMmdBb2JqN2lxR0JZdGhI?=
 =?utf-8?B?cEdGeTQrcUpCc2t1SUNlVG1xbE5aNG1JT2EydlY3c2hqamdMeFdDcld1MVo3?=
 =?utf-8?B?aEt2aHlkSzZjaUxKUStBZlRyNThrZ2daNGhIdkhieEg1bG8vQmdPWFl4R0da?=
 =?utf-8?B?eEdUbjdRVFdkc0t4dFBrOUlBTEhJRlAvMVlKaytaS0R6NGg5Mkh1b3hiK2Jk?=
 =?utf-8?B?eUMyVmNHdXRoM3FlZDJIV3lISHNWVHR6S0dyYm5mTG14VVhnZUNmZkVobis0?=
 =?utf-8?B?eG5QQTBIWFQzN1lLZ2JzbVRlNWFGVXZ5TTVVSkhNa2JnVWtLRjJFMHVRL2Fn?=
 =?utf-8?B?Y3NqR3lPWjlEQUptNkJua3pCRDVMR1ZJaS8zbUo2QTlQZElqby9SM0ZCam5I?=
 =?utf-8?B?a2FKdmdMUlFBSHJvSFVMZG1hOE8xdUNVMnV4Vjl2SkxzQ1U5dmxpeiswL29Z?=
 =?utf-8?B?QlI4bUk0VXV4bzVqQWNpL0hsdkFiTU1mNDZ5NE1maGZ4UUx0RityNTdtNS9y?=
 =?utf-8?B?TUxodGZucmFmbi8rQnlLU2JKZ0pmQ3JBVTdlZzZYaXdIUnFSc200YWhaUFBQ?=
 =?utf-8?B?Uk1YNUM1Y2IyMDhYK0RIa2Y3NjVIakh1ZmFUTXFMT1dVcTVsRjdPT0NmaDRQ?=
 =?utf-8?B?U0tOZXVRcDk1K1JqU3o3OThzL0RVaXRJd1puY200dUsyTHNveTlKeGN2bjJE?=
 =?utf-8?B?RU5rVm10N0dycExXS09EdklhWDlrUUl2RWp2VStkSEZKSnpCVGV4U3FzSDhk?=
 =?utf-8?B?YklybGU2dXV1eDVxRURyOXNxUitTRXVVR1ZNZlJTZ3lTSHpUNGhvczJzWmt0?=
 =?utf-8?B?cnU5TFVOc0pFc0VxbkNTMndlbWtveHFZUmdvVG9DWExnbytIYUpscGF0WGJk?=
 =?utf-8?B?UDhmcDVsLzNYSGNkWnJQU2piS2FtS3h3MXpxS2ZlWlNHMWtHWmhWbGM0YlF3?=
 =?utf-8?B?WW0wc3prL0ZVc2pZS21rSVhydU84cXA1VG4wa1JTaUFSNTNSYms4ODd0dEFG?=
 =?utf-8?B?NWRRZGxVOE8wWWpId2dlQVBhTGcxOFY4TWo3N1JTVmJQREV1ZXpiUno0Z2p3?=
 =?utf-8?B?OWFLOGo3ekZvZ25BQ1dFbm13ckpidUlkbmtkWitzTTRiYUJGVlpHVjNvblBV?=
 =?utf-8?B?SzBRbkFnWUw3VlR0d3FiQk1La1pCUUIxQkJHT2k0QXhtSnJQVVlFV1dRMGtV?=
 =?utf-8?B?aGRFNmtkTkpVNUNydzNLdmRGOTdvSnYxOWZocCs4N1BFVUhDd1FsallxZDdk?=
 =?utf-8?Q?2KshgZt2EM7vIPcsmdsUiAk9fRGrG8B2ojTPMRz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ecef39c-c252-4941-74c7-08d96083feff
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 07:03:48.5761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kn9eV1FqnmUOnAzBsl4FE7TEGZDzA5mOkQS/rBL4cWpw/ZKZtRBvsWfLpO+oTUeiVmWxffpjUI7RmqGkITYEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5741

On 16.08.2021 07:50, osstest service owner wrote:
> flight 164195 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/164195/
> 
> Failures and problems with tests :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-armhf-armhf-libvirt        <job status>                 broken  in 164186
> 
> Tests which are failing intermittently (not blocking):
>  test-armhf-armhf-libvirt     5 host-install(5) broken in 164186 pass in 164195
>  test-armhf-armhf-examine      5 host-install             broken pass in 164186
>  test-amd64-amd64-amd64-pvgrub 12 debian-di-install         fail pass in 164186
>  test-amd64-amd64-i386-pvgrub 12 debian-di-install          fail pass in 164186

Are the last two perhaps connected to

Checking the Debian archive mirror  ... 25%... 50%... 75%... 100%
Choose a mirror of the Debian archive
-------------------------------------

!! ERROR: Bad archive mirror

An error has been detected while trying to use the specified Debian archive 
mirror.

Possible reasons for the error are: incorrect mirror specified; mirror is not 
available (possibly due to an unreliable network connection); mirror is broken 
(for example because an invalid Release file was found); mirror does not 
support the correct Debian version.

Additional details may be available in /var/log/syslog or on virtual console 4.

Please check the specified mirror or try a different one.
[Press enter to continue] 

in the guest log?

Jan


