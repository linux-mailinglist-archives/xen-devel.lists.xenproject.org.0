Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8A752EA7A
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 13:07:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333811.557716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns0T1-000210-PK; Fri, 20 May 2022 11:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333811.557716; Fri, 20 May 2022 11:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns0T1-0001yx-Lo; Fri, 20 May 2022 11:06:47 +0000
Received: by outflank-mailman (input) for mailman id 333811;
 Fri, 20 May 2022 11:06:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mtD0=V4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ns0T0-0001yr-0O
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 11:06:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef6349a7-d82c-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 13:06:45 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-sLBo5shSPIiap29FWQu9kQ-1; Fri, 20 May 2022 13:06:42 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB5008.eurprd04.prod.outlook.com (2603:10a6:803:62::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Fri, 20 May
 2022 11:06:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 11:06:39 +0000
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
X-Inumbo-ID: ef6349a7-d82c-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653044804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kxkD9SQPfX+XP4H2QDGmxtlXZBVelTA1FqvdYRuEKxU=;
	b=d8aHnxlQK9Kv1pVvCvrRUCHjdpAnPiwsrqSKBDpt9lyBShOZTHXrFlJWVf0MDKTV+SQBRi
	vNRD5DKgdRB/SbNs2MQBQiCWrdzXDE4UXGYi56QBVrG3XIT0vBe6P63UVhmoV8z094o8h+
	oi+Yky+C59xzOEbOUHhGdwxdeRVUuHQ=
X-MC-Unique: sLBo5shSPIiap29FWQu9kQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oMKo826Y47jxoLHSxNOyR7qbB03g2OnjIn9tSiraheRtkAOKmRYthR9R4sdOfkfjsvBZRTH+yC854e6FlV8W4b5wxflz9n95SoxqkGOZlMsBAsvlNJvH8iG5mEWxTa/ztcvvS07um1Uw2gg/G4jGwfLLF2IB2RcSUjh0D6MqqrsWtYqj42Pyq/I33JO4WF4cXrSshWPpz6tL14JX+Nf8XVrlG5C7kGdfe7SLDPxIDA5UVP9c2jgydMDLpoiUkY7JunFxuVvcpqt7IY402wm1XgI8qtTZLeM1p5c+55KExdeU+Cw1c4hBf4vsu+7nQqANNxBY1fVVAWM7PDXHBAnmpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxkD9SQPfX+XP4H2QDGmxtlXZBVelTA1FqvdYRuEKxU=;
 b=Tpj3LoZP2BGmzGXoyCxoq6y1pJU2OHzaGJL4HYjmpvUoHRmtEJjFUHK/WPkuR9NQJ+d6J4hwkEWvdTuTjHt/nv/GQdeWzM4hHAlIYutUdnEbD9LV2V2gEC3UkT18P9UJup3cSFWbTsa7NPJ2qayFmQ8CTT3kbX+4kk2mpFrT+CvFOb6GrB1MjqrkJu5ac9Qq96S/VYNGrgYjCWokxDvbU8iY8V53v/S2xDwCe445K6Rgf7HhEPBMjUc+lD7C+eJ3DtOCq15OjpxuVAwy0AVK56DQGLa2poSHKUxxLiwN+FWEf0/fhi/mk99OnRbubJFUSA13Q34FpQ37RQz1imtICg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <739ac0c5-0c58-0e0f-ade6-5d48db5254c6@suse.com>
Date: Fri, 20 May 2022 13:06:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] build: Fix make warning if there is no cppcheck
Content-Language: en-US
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <11fe35abe0a4cc79e6f7253d04ed12d951f1d09d.1653043632.git.bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <11fe35abe0a4cc79e6f7253d04ed12d951f1d09d.1653043632.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0505.eurprd06.prod.outlook.com
 (2603:10a6:20b:49b::31) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d23e65e-2e3b-4e2c-2292-08da3a50d061
X-MS-TrafficTypeDiagnostic: VI1PR04MB5008:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB500807F565CABFD17752864BB3D39@VI1PR04MB5008.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3S2kDNYWuz5LNkp/Q5YXkhFx8MEQjkeJ4UnNSTZMzlvWSRB7QaS3NNMABJ6g0uUIaico+XaIPTDhnU7OX4QvlMce91inU0vyFMK6Vgke1pSw6X1e4R+2W8pe5W3HEaZ9OaUyKWAMR+nPP1vR7Fnsb0y737kLNKX+LlRyNbbfSfH6YbaggU1wZapNzwa8UnTSMGTdifNbf76CG3bM7Dv6pPLpGZ8WTaJld4QQ4544nGEWj4vSnRjQW94SdEOlBPBcKU752XuCQhD55Hgt5EFlJSDSWAA+3kKe5h26kKUjU+zk2Z5IK5JJx91nOhpu4hrQfZF1Qk0HxkpjxI7M7Bp9HDinQhaQdVz1Gnso+xegm8Y+6SWpRpX7TbXIBpQ/pxw9y0ermEu7hxP0PBRfboWqnb2wzw1zNGIIQ5kMbVToWiusb6AU3mSKuiQrCELzyr9SAXGxeHCVmuD3yw3BZWXeBZLjQYJTe+7n3husPX6W7PKwHhlQNscpu2AF+ady8RkxjTufcJkPffWb49jNPx2KgB8Gu94MpVCsR1wCdqnjQ+Guu8xqtP6YCb+5kunO9TSupvQ7wi5sg01YEqcKq6vPehMFQUOhgVQEqi3Gf4uux+FQAFE9mrckxgOwEpcj9Od8GHUGkt2Z8BiSYer+AQ8ewx2NkxHi7VYoFRRbmYPAjrkbql1ScKhkrfJqPtioRx8iMue57kYDYnDXcAeU2ItBbxy8pitWUH557lzKUHZQp9LG8bf0jEQztfExDisNGYw6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(83380400001)(186003)(4326008)(6916009)(2616005)(53546011)(86362001)(31686004)(54906003)(6506007)(6512007)(26005)(316002)(2906002)(5660300002)(508600001)(31696002)(8676002)(4744005)(66556008)(66946007)(66476007)(36756003)(38100700002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFE1TFpJZlIrNUZxVm1KeEo5S2lJaFNMd2RGekRiMWJDNHcxenFWcmJnMzJW?=
 =?utf-8?B?dHVEQWFVUXVreDJqVXkwM0hsczcybThxcWxQREx5amVOcG9DaW80aUxsU01k?=
 =?utf-8?B?eldURWcyejF5U3ArTjBpSGdhWHVIRlZuakFkZ2RKZEU3cnkvOXJicTJNc0Jp?=
 =?utf-8?B?Tjh4d2Z0cGZsTTRaQnlmQjlGZVpvc0kvbWJhaG9hS0xRYW01V3VDZ2YwODlX?=
 =?utf-8?B?OXIvbFlKT2pwRFV6T3hsZGM0QitZSnhTQUFtRy9MaDR1TjY2UzlKUm5CbHpN?=
 =?utf-8?B?enhFbER4OGo5UU5kT0o3V1BlWWxtOXNTVmpnQWhpcjI2MnhYMTJNTndzWjlv?=
 =?utf-8?B?UXVrQVZhbGhQcSt3cTVVQlYrRFFMdzRST2VlSVZoa1RxcXZ0bk9mNTF2WWYx?=
 =?utf-8?B?NFZscWVlY2g5eEJNMzJ0ZXY0QzloS2N0SFJaMkZHZFVTMzlwbkd2dmtrKzk0?=
 =?utf-8?B?NHRXYUZ4dFpLbW1iVHh4NEllZkpROXhCeURZdE5VT1dIU0NzOXlnVHlCYVVG?=
 =?utf-8?B?MFdxNUhTVTJ0UkdYWkZ4SWxSQmNoTEd1VjFIMWVCazB1MFVEVWhjR0tFL0to?=
 =?utf-8?B?N3o4NS9tcGdTb3RJTE5ra2IwZHVSS2RoK0xjOUhTNnBXOTdyTnZPZTA2NUcw?=
 =?utf-8?B?TGFXL2ZMMVdWU3RxeG9QeVpCZGxja2diMWJCaFh2NmpyU2FPRUFFNEVCK24r?=
 =?utf-8?B?eE1RR2UyWVBnTzFyVG1CMUplMUtIdXpjSnVBR3cwTk51MnIwQXRpbjZqaWlM?=
 =?utf-8?B?QUtNaUhHUnBBd2czRWNGQXJqU2ZxRFZkS0xKN2l0U1p3SXZ3bmRZa3dHUU04?=
 =?utf-8?B?bUpwVW5JYXh3OXVyLzBvV21icHQzSlBzRUpzdlUrcGNLVDZrRm85WkFELzNS?=
 =?utf-8?B?c3E2bVlmMVVoaERLL3ZWWi9BdUU1MVAvZko5WnlraTFuRGFhYkx5cTE1TzRr?=
 =?utf-8?B?QzYyVWVydW9KMUMrZTVncnFZM012MFl1Z3IvcTBQUk1FcHh3ajJSMi9IOXpD?=
 =?utf-8?B?emVZQWZMZktQQkxXaGhzRWl5RUw0azJwUmlKM3ZmY1k2V3A2WG5qTVZTcWNQ?=
 =?utf-8?B?Y2JxbmF6NE4yWlZPTHZ3S0phSXRuK1ZEc044T1kzaDErVXAwMGFDelo1UzFB?=
 =?utf-8?B?RldvbTltcEZleGRGNXF1ZkpMUFdCU3hLN3ZsVXUwb1JmM2gvVk5FMTdxT0Vv?=
 =?utf-8?B?WUhKNitRZXBGK0g3bDk3MHNRMFQzUWNqMDhPUkwzV2ZKRmRHbGlTSll2OTN5?=
 =?utf-8?B?cllReWw0VHY1dFExamRUTlRXM3dlUkF5N291MWRvdkp3Q0VyWWNVSVZFZGVo?=
 =?utf-8?B?L1cxd0MybVE2Y1c3U21IWkVJY1hZSVFUd2lCQW9RdDYyb1REaEd3Y05VWHcy?=
 =?utf-8?B?Wm1ST3o2WkUxS0xFNUhNcmVZNmp0NThuQnVsSjJETlVZRmxxVzlqenZZQ1l3?=
 =?utf-8?B?ZzB2aytMblJ5WUhKK244akM1Uyt0MEtoUmM2aGZtc0lybzN1OG5jNEx5cW5l?=
 =?utf-8?B?bkduWTVYOC8xUmgwMnYvcDZjbHlhMzkrTjlibVJYdk4ySU9melhZdUZKRGRS?=
 =?utf-8?B?SnVvYjJDWStZd3I3VElLRHhJQVIreXVQd3dyVTNUSUhscGVtTHRHdDVRbjd4?=
 =?utf-8?B?NE1wOGM0NWFScFkxTnhsQXl3MUlQUEI4bGRGaEJXNnE1cGJrY3owTXVrM01M?=
 =?utf-8?B?aWd0ZjdRaUZEb1kvbFRNT28wYXQ3bTdlVmZwN3VrZ3VVbTk2QTdtRTAwb3pk?=
 =?utf-8?B?ZDNlVkNLaldjVHd5VlFqb05GKzNWakl6SE81a3NOMG5KWWV3NGRjeTNTUmpD?=
 =?utf-8?B?SWhzd3VpMitBMmNGWXdyRU5qcVZrUVlCRzR5c1lYS3BtY3MrRjZaU3dDOURY?=
 =?utf-8?B?MDNydkN2RmIvM2FHenlPRzNSMnhiNi9IOTVLeVVHSXM1LzdNYjJTNUlPa1pq?=
 =?utf-8?B?WG9JYUxlRjYwZ1VyYVh4MTVJa3RKQ3A0bTNZYUg0TENJYkt1Y284SjhWTEQ2?=
 =?utf-8?B?N2VISVlMUzRZRk9sZ2xNcTZrWVhCTU9ldHF4OElrRHJVRlhCMTlTd3RxNU1B?=
 =?utf-8?B?Q2o5M3R2U1cvL1dZRW1wSURiNm5HNlVraUZHbWM5aGZnVHRWRHg2NUl3b1pY?=
 =?utf-8?B?SWZmb1UrRlR4Z3Yya1lHaTBnWTl6bmZsV3YvQjlSVWNWbDhQS1F3Tzk2eGox?=
 =?utf-8?B?dkw4SlBLRms1aDk4SnEzV2VYem9xRTAyUW9JVFduQkJOdHdCMmUrdGU4K0Rl?=
 =?utf-8?B?dlpIM3d2SkNsYUQwcEJwYUZDQ0poOXR5cCtxSVBzS21UcFZQVTh1ZjJKNnV2?=
 =?utf-8?B?ZlE1eVZ0a0ZvaEp1Qm5rQkwxemNsNzBESFRVeGRYYVNObEFhUnJOdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d23e65e-2e3b-4e2c-2292-08da3a50d061
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 11:06:39.5574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: etEHsAro8HfcjMT+MtUYlK8F3s2Tuppql3jh0MYABnrh3hg50BnaGO6Qx0z3zV9jG9nEPOGaj/88N7h644o7Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5008

On 20.05.2022 12:49, Bertrand Marquis wrote:
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -694,12 +694,13 @@ $(objtree)/%.c.cppcheck: $(srctree)/%.c $(objtree)/include/generated/autoconf.h
>  	$(call if_changed,cppcheck_xml)
>  
>  cppcheck-version:
> -ifeq ($(shell which $(CPPCHECK)),)
> +ifeq ($(shell which $(CPPCHECK) 2> /dev/null),)
>  	$(error Cannot find cppcheck executable: $(CPPCHECK))
> -endif
> +else
>  ifeq ($(shell $(CPPCHECK) --version | awk '{print ($$2 < 2.7)}'),1)
>  	$(error Please upgrade your cppcheck to version 2.7 or greater)
>  endif
> +endif

While I agree this will silence things, I still would prefer if you
switched to $(if ...) inside the rule - there's no need to invoke the
shell while parsing the makefile. Anything like this only needlessly
slows down the build. Not by much, but it sums up.

Jan


