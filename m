Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B5A3729C3
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 13:57:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122162.230407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldtfo-000884-Co; Tue, 04 May 2021 11:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122162.230407; Tue, 04 May 2021 11:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldtfo-00087f-8m; Tue, 04 May 2021 11:57:08 +0000
Received: by outflank-mailman (input) for mailman id 122162;
 Tue, 04 May 2021 11:57:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4Og=J7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ldtfn-00087a-3L
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 11:57:07 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1784aca-fad0-457d-b15d-8d245708b444;
 Tue, 04 May 2021 11:57:05 +0000 (UTC)
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
X-Inumbo-ID: b1784aca-fad0-457d-b15d-8d245708b444
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620129425;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4keY9u1EV9zqFYDjpT+eLegpqcQzH9qzOzPqXKH+nm8=;
  b=WEDJK/PS9Jz1jq+w7DU4vpe0XSZ50WefFEbtIRxMCc7gNo/3TrFjKAGr
   oUkQuZQZVZOwa2v7TO/UCrwbWTjd3GUVRzDQYXpuPCklvmTWu6HPQt+0g
   zhyHkjNByEZS+iLW2oGcnE0HQHQ7u7/4G+LmmS0hl74THdI3QSiL5AnjN
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UetZ4xc+jB0oPjUu/ffExCZL+svyw22C+vErB/uGqxIM/PvHJ8E07Sob/o/RQ8xU4DP8j9h1/5
 SBKG/91xP78i4KjjflV5FoXGT5LwTcb8d9arAjkEKsIDEUN9HYqCpNQP/CafRfR3eWHQduugj0
 MHzVIU0OyOQh55uT4SahKGJeIkVK2xOKfi/RkfrL2iVPco3Y73zBj8mkTuApjQ2Klm7opgS4vn
 1Zjdg88MEosvGHTloFaW2YmJF7NlmK5HdxmSKzq19eQd0F612hRaVbUWGVNFb5okTpolo31W7B
 hNg=
X-SBRS: 5.1
X-MesageID: 43398568
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:liXVR6BiCwxAkRflHegltMeALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPsfVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VfdMgXE3Kpm2a
 9kGpIUNPTZB1J3lNu/xQG+HcopztXvytHSuc715R5WPGJXQotn6Bp0DRveN0VwShVPC5ZRLu
 vn2uNsoT28dXMLKvmqH3VtZZmIm/TntrLDJSQHCRku9RWUgVqThILSPhCE0n4lIlRy6Jg492
 ytqW3Ez4Wl98q20xrNk1LUhq4m4OfJ7vtmKIiyhtMOKjPq4zzYKbhJf7GZpjg6rKWOxT8R4b
 /xiiwtNchy9H/dF1vdyXSC5yDa3Dkj8HPkw1OD6EGT2PDRfi4wCMZKmOtiA3nkwncgp9113e
 Zq2G+UpvNsfHf9tRn9/NTBWlVWkFO1qxMZ4IsupkFYOLF/VJZh6agkuG9FGpYJGyz3rKo9Fv
 N1Mc3a7PFKNXuHcnHwpABUsZORd0V2Oi3DblkJu8ST3TQTtmt+1VEkyMsWmWpF3I4hSqND+/
 /PPs1T5f9zZ/5TSZg4KPYKQMOxBGCIawnLKniuLVPuE7xCHH7RtZjt4vEQ6PuxcJIFiLs+8a
 6xEW9whCoXQQbDGMeO1JpE/lTmW2OmRwngzclY+tx3obv5SL33MTCSSVwnnse6ys9vQfHzar
 KWAtZ7EvXjJWzhFcJixAvlQaRfLnEYTYkUt78AKhCzi/OODrevmv3Qcf7VKraoOy0jQHnDDn
 wKWyW2IM1B60usS2LpmRS5YQKpRmXPubZLVITK9ekaz4YAcqdWtBIOtFi/7saXbTtYsqI3e0
 N6KKj9kryyoHS3+Wqg1RQoBjNtSmJupJnwWXJDogEHd2nud6wYhtmZcWdOmGecKgRnVMPQGg
 5Hr1Fx8aa6RqbggRwKOpaCCCa3nnETrHWFQ9MggaWF/97iYY59JI0hQrZNGQLCEAFVlQ5mpH
 xYUhINQlbSG1rV+OKYpa1RINuaVtFnxC+3PMZfqBvkxDihjPBqYkFeYhmDfoq8hx00Sz9dm1
 trmpVv/IaoqHKIMmswgOMxLVtWTn+YaYg2QDitbJlIm7ztZQF7RXqLgzvfkB0oZm/27Swp9x
 PcBDzRdvfRDlVHvHdElq7s7VNvb22YO1l9c3ZgrORGZC37k2c21e+Afayo1WSNLlME3+EGKT
 nACAFiVT9G1pSy1BSPniyFGmhjzpIyPvbFBLBmd73IwHuiJMmJkq4BdsUkiqpNJZTrsuURV/
 iYdBLQJDTkC/kx0wjQv207IkBP2QsZuOKt3Aeg4Hmz3XY5D/aXKFN6R6sDK9XZ62T/Xf6H3J
 hwkNpdh5r5DkzhLtqdja3HZT9KLR3e5XS7SOwlsphYt6M/vrkbJeiubRLYkHVcmBkuJsb9k0
 0TBLlh6LfaI4l1YogcfTla8ldBrqXFEGI79gjtRukwclEmgyWFY5eH47/UpaEuBUPErg3qIl
 Wb+zBc+fCAXybr789rN4sgZWBNLE474zB++enHcYvaAgCjbftC81q3KWXVSs4pdIGVXbEL6g
 9n6NSJlfKNfyX22ArMrSJ2S5g+glqPUIe3GkaQAuZG/NyxJESUjqar6MC1ii3rSTHTUTVqua
 RVMUoKbspCjTE+jIo4liiqI5aH3H4Yrw==
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="43398568"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UhnmjpgW9t++ohBH/Uws4afog9ZTutRZDDXj4+NoAsIwG7GFejlry9Zw79jX9Om1hyrSKiXjnh1rqhldumSpz9q+ZOs97ZI0laqbCq4fVWsY+LhGjffT+sVZDwT/X6mAUX/KR4js7k+TVjGboQ66cloXc2wJQOxfDo5xbDfAiESvTDH1FKwn2kMKgU4XX0iJ57/hxDo+O4D0FFofWGG65f9E85/jhHfYHFwv2aNDRqW4NHB48CQ1w70+RQyalPqCkDvakgWt/IfeVE7eMAr77qb+6yeOd0Lncc7Lier++QQzUwNvwKTN3OAXmHvJf9sm9YUarRcEaP0+quYROdXZYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAGZmKUgV3p5/89FFRlnYouNXo8eGBnLdLeQmKZcnSU=;
 b=nJptIdxeExLakYiFDIk1jU9Urxpr4jn0+wG7NhItr8xNnXKyfStDJnPT0VkwTUL+2GcOEWqMZ2W6gyUOdHSwMo5Ar8L51tKvr7p5FuslMowxdEUe7wwxVWaSI1Q5XQwcBlBUON3f7RZFsT9vyovuWqf0xhVe8XJzhqYGMVxZp/13afqGeRyRYb+QEtLYdMOrVAc++ujL2iugm/iI7Cirz2HrD1SeT34NiREpg99RPUflSZ0ac8gBqZQbLhVKlkqJUL8jvQLz2R9Tfj74OhAdl6ooHi3XMYeLIM8Pv4qd16wM17tk9wZx/QKKNi4w+GmvmSlSYUWVjq2EaMETIc/Zpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAGZmKUgV3p5/89FFRlnYouNXo8eGBnLdLeQmKZcnSU=;
 b=iWI2F1MXUKqNI6oK5jIOftcGiA93m0o2YZyOVUlr2RMA9pyCJeiPgVb77q7ttZ/JstvfhOgHVE9TBXuWoTzY729skhk9OmkZlpYwNgjA2OwacKaGsuYUn6tcnOg6hQ1fD2Y54QfKMsfWV2Vsk+M8SGe+ef7WQAZ2p6WG4E1hjGA=
Date: Tue, 4 May 2021 13:56:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 07/13] libs/guest: obtain a compatible cpu policy from
 two input ones
Message-ID: <YJE2hxPYq2kGrOwV@Air-de-Roger>
References: <20210430155211.3709-1-roger.pau@citrix.com>
 <20210430155211.3709-8-roger.pau@citrix.com>
 <838e358d-5707-0f34-c8fe-64e29f000a69@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <838e358d-5707-0f34-c8fe-64e29f000a69@suse.com>
X-ClientProxiedBy: MR1P264CA0027.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb0c6a5d-c8f4-452c-8b50-08d90ef3b98f
X-MS-TrafficTypeDiagnostic: DM4PR03MB5998:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB599892407782346CC5FB70278F5A9@DM4PR03MB5998.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /rfBMpa6opGJRaZEE9Hc2DRMW1UHJ7L1niWOqh99JGglGyO75d2Lsy5AYI/a8FL2NM/P/EbhxZjbEfNx1VtmgdA4bKsDW0gFpiN0FuwOzrt55VhERQbxXejvinmv80wY9azY2kJ7V/G9LJw/iL+ZARbCN5gpl0PB1EkW6iHtr3eY9pPaIw+UeIACKNaV7bYvy6LiAOE4QyhzmkzLfAh4YemPiDThSw39+gkjHnPaWGHYow6L1yAoZ8SDVUR0kU729Ohc7kgl4xlAv1t/oJLpN/k4gb81tT5ArR8JPdMKw62jCjlH9cJby/ZGSnaifnNLNNTwrGfkZpuE1AEmYz5py3G1c/NHDnKtC5rprw5EfYPhEPPwXsClFwe7JgiAnjeWrH2//vkfzOXONs0MfJphBT1tsBx1SO1+l3y+jUAfz+I61TQFn0GUm8R9PTz4+/Nq3mO0JY6zn3FVHqpMNyRa7GcQ2VQEGiUVbDH6JOhxzEJjVTuFJGDL06UjRlhVlwV2xqsSLwcOoxTIfWgW3M4MjOVoqBA5ZaQAwCDcgmZPiv93YzpWf//utZ7+b90tpdKleY1dkjUMC3dPeam01I3hn6iW2YXQXfD+o88yq0Tgcco=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(6496006)(9686003)(2906002)(85182001)(956004)(6916009)(38100700002)(5660300002)(53546011)(6486002)(83380400001)(4326008)(478600001)(6666004)(8936002)(8676002)(186003)(86362001)(26005)(66946007)(54906003)(316002)(66556008)(66476007)(33716001)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WHMzU3h3VU1oaWVlZXJrQ0NLdGpBWDdzYzI0YnF3RnU4Vm04aFI3ZXhIb0Vk?=
 =?utf-8?B?Qnh3NXJrank1SnB2UUlmTldHTzAyeFBLMzZFZjRNdGdjL1E5QlBhT2lQTzRr?=
 =?utf-8?B?ME13UXdTcXc3RUpSampweWVOemVyMGhMcE56KzJFaDJwNGFlVC9ZZU5Cc08w?=
 =?utf-8?B?RXMvYzdtMmtPOXFpcTM1SFozVzdxTUI4TngvK2lhenpDTmVIRVJOTncyMjVw?=
 =?utf-8?B?bms3bUZCQUtMaUZqWmc0ZU0yVkNVejRaV1cyb0NGZDZaMEdTUEtYaWlyaGFj?=
 =?utf-8?B?ZytiZW9YanVwb3g1cjN4VkE2NHY1K3ZNaHdkVFRHY2RyMzVlRDZxUTVjS2Ny?=
 =?utf-8?B?bCt1ZnpJUnVxUkJIVzVnejVVM1p1UzJmL3dGZUN4OHNnM3ZzQ0dRT0JoUlc1?=
 =?utf-8?B?VDV5bUFHQnhxN1RMMDVDeXhScm1PMXA0UHhOZW9PaGhHQk9pS3VqQk1iSlo3?=
 =?utf-8?B?TkNXQ0dlRTE2eEdYdFdWQXdhdktTN0w1ajlKd05scUVhd2tYNi9pYWVDamhO?=
 =?utf-8?B?ajgvMm1adzFwSEV1TEFWNEh4dWRqbTEzZUpxZ2YwR0lHT2M2Rks0NzhMRERh?=
 =?utf-8?B?YVNQMnpjeDF1cVVMY2xHZ1VOZ3hGYlFvUjB6SnFpZHQyQjVIbmJtK0l2WmMx?=
 =?utf-8?B?UlRRV3I3SXArRXNMUW5SYXMrNWFqUTFUNVdmdEhqSDg2ek9mOGx6dmI1L0V5?=
 =?utf-8?B?ckxHRU5aRlBENDRDdy9waVEzWWdZNDdzRW9KODJuUnpXUW5CY3JtdzM5S1Fq?=
 =?utf-8?B?Z3FndWpFWUJmR2ZGMGlUS1BtOS9xN2VyOFBLUWQ0TTJ5U3kxRm9kUEs1TzZs?=
 =?utf-8?B?TGxsVDROWkFhbHh3TWZYbEpnWEhhSE9HOEk3QXVnaEJNd3ZibEs5c3o0MnFk?=
 =?utf-8?B?MWQyRFowQW52TDYyNTMvR25jSWxCTzlTOG9kdzhzSDdvWU92YXJCc1Z0Tm9z?=
 =?utf-8?B?a3llb2NCTjdOLzF4bitGMERFWnJ0ZmZYdFhDYThVQTgzdy9SeHFTQlExV0Vx?=
 =?utf-8?B?YWdkVlJ6ZmFvQXhuVXMwMGdNTjQ2UDdoN3J4SnZQSnpncDlIV1VQZGdkc1A4?=
 =?utf-8?B?Zm1kQ1AxRDNDQi9WZ084TWd2SGZ5TnhuTCtpU0dwcTQ5aDVlMkl6VUxMQ1FH?=
 =?utf-8?B?V1ZCblhzaUoreUZJaVAzQnVVQkp2YXoyOENzUXg3VWdOMEFYWnJFdkkrTVhR?=
 =?utf-8?B?di93MlM2dmhhdk5mTmw5OWtzbWZ4NTMyaUt1OWc5TUlEbFp6aFJtNThNSDU0?=
 =?utf-8?B?cXdzaHUvR0psRnV4ZS9nVDVlOThJQ0pKdmhudWtJaEtyNkZ0YkhGSXpETy9U?=
 =?utf-8?B?aVAwejZNUzMxWEJMbkE0am80OVlmYnRHbWxOMnVKb3pxUXZuZlhDY1k1NGpl?=
 =?utf-8?B?NTJQRy9iUS9hSXhhNys4MWtTdW1ZQU9DWjZHZWQ4aFd6dVBLMUdRTEZKMHR5?=
 =?utf-8?B?M2NYUmxwN1ZXVEZ1MDNMMHZOUUJneG9wSTVZbW9QNzI5bkNDRTl6UlY4TW1V?=
 =?utf-8?B?M2NUSXZHZWd0Wk9JMmJ0RXNSVWNLWmw5UU5iU1ZkWmRGRGpNV1phSEdtNGJB?=
 =?utf-8?B?SEN0TTljK1V0THVOSVNNSTNlbC9jRThVMFp5ckpUSHdaTnNLYzNKSC9wQVN5?=
 =?utf-8?B?WDl1YkM2ZXRvdnRsSlhXTWxJOVFVZFQ4Um5ydWNvdWhxRmFNZzZYZHhwb0Yv?=
 =?utf-8?B?YTA0WjJNS1VxenZCS0FsV3pHMTh2YTMzQjlZS2x3ZDM4R3hvcEpsd1VMU1BO?=
 =?utf-8?Q?Gbo7wBLAdYXmtsviBJ9Uw9qFjZbPBnbekwVdTQy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb0c6a5d-c8f4-452c-8b50-08d90ef3b98f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 11:57:00.3854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWrCikZSzjhMnOn66ST5IA5zNwhmdFqZqU96U7J+NKInvQRUA62ir1PJCXeGZYQv6fx3xGR1xwEJ7yLled50Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5998
X-OriginatorOrg: citrix.com

On Mon, May 03, 2021 at 12:43:08PM +0200, Jan Beulich wrote:
> On 30.04.2021 17:52, Roger Pau Monne wrote:
> > Introduce a helper to obtain a compatible cpu policy based on two
> > input cpu policies. Currently this is done by and'ing all CPUID
> > feature leaves and MSR entries, except for MSR_ARCH_CAPABILITIES which
> > has the RSBA bit or'ed.
> > 
> > The _AC macro is pulled from libxl_internal.h into xen-tools/libs.h
> > since it's required in order to use the msr-index.h header.
> > 
> > Note there's no need to place this helper in libx86, since the
> > calculation of a compatible policy shouldn't be done from the
> > hypervisor.
> > 
> > No callers of the interface introduced.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v2:
> >  - Add some comments.
> >  - Remove stray double semicolon.
> >  - AND all 0x7 subleaves (except 0.EAX).
> >  - Explicitly handle MSR indexes in a switch statement.
> >  - Error out when an unhandled MSR is found.
> >  - Add handling of leaf 0x80000021.
> > 
> > Changes since v1:
> >  - Only AND the feature parts of cpuid.
> >  - Use a binary search to find the matching leaves and msr entries.
> >  - Remove default case from MSR level function.
> > ---
> >  tools/include/xen-tools/libs.h    |   5 ++
> >  tools/include/xenctrl.h           |   4 +
> >  tools/libs/guest/xg_cpuid_x86.c   | 137 ++++++++++++++++++++++++++++++
> >  tools/libs/light/libxl_internal.h |   2 -
> >  4 files changed, 146 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tools/include/xen-tools/libs.h b/tools/include/xen-tools/libs.h
> > index a16e0c38070..b9e89f9a711 100644
> > --- a/tools/include/xen-tools/libs.h
> > +++ b/tools/include/xen-tools/libs.h
> > @@ -63,4 +63,9 @@
> >  #define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
> >  #endif
> >  
> > +#ifndef _AC
> > +#define __AC(X,Y)   (X##Y)
> > +#define _AC(X,Y)    __AC(X,Y)
> > +#endif
> > +
> >  #endif	/* __XEN_TOOLS_LIBS__ */
> > diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> > index 5f699c09509..c41d794683c 100644
> > --- a/tools/include/xenctrl.h
> > +++ b/tools/include/xenctrl.h
> > @@ -2622,6 +2622,10 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t policy,
> >  /* Compatibility calculations. */
> >  bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t host,
> >                                   const xc_cpu_policy_t guest);
> > +int xc_cpu_policy_calc_compatible(xc_interface *xch,
> > +                                  const xc_cpu_policy_t p1,
> > +                                  const xc_cpu_policy_t p2,
> > +                                  xc_cpu_policy_t out);
> >  
> >  int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
> >  int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
> > diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
> > index 6b8bae00334..be2056469aa 100644
> > --- a/tools/libs/guest/xg_cpuid_x86.c
> > +++ b/tools/libs/guest/xg_cpuid_x86.c
> > @@ -32,6 +32,7 @@ enum {
> >  #include <xen/arch-x86/cpufeatureset.h>
> >  };
> >  
> > +#include <xen/asm/msr-index.h>
> >  #include <xen/asm/x86-vendors.h>
> >  
> >  #include <xen/lib/x86/cpu-policy.h>
> > @@ -949,3 +950,139 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t host,
> >  
> >      return false;
> >  }
> > +
> > +static bool level_msr(const xen_msr_entry_t *e1, const xen_msr_entry_t *e2,
> > +                      xen_msr_entry_t *out)
> > +{
> > +    *out = (xen_msr_entry_t){ .idx = e1->idx };
> > +
> > +    switch ( e1->idx )
> > +    {
> > +    case MSR_INTEL_PLATFORM_INFO:
> > +        out->val = e1->val & e2->val;
> > +        return true;
> > +
> > +    case MSR_ARCH_CAPABILITIES:
> > +        out->val = e1->val & e2->val;
> > +        /*
> > +         * Set RSBA if present on any of the input values to notice the guest
> > +         * might run on vulnerable hardware at some point.
> > +         */
> > +        out->val |= (e1->val | e2->val) & ARCH_CAPS_RSBA;
> > +        return true;
> > +    }
> > +
> > +    return false;
> > +}
> > +
> > +/* Only level featuresets so far. */
> 
> I have to admit that I don't think I see all the implications from
> this implementation restriction. All other leaves get dropped by
> the caller, but it's not clear to me what this means wrt what the
> guest is ultimately going to get to see.

This aims to be based on what XenServer does, which I was told is to
level the featuresets. I think the caller of the function will have to
fill the part of the policy that cannot be leveled. It's likely new
helpers will be added to do that as required.

One option would be to get the default policy for the guest and then
use xc_cpu_policy_update_cpuid to apply the leveled one.

> > +static bool level_leaf(const xen_cpuid_leaf_t *l1, const xen_cpuid_leaf_t *l2,
> > +                       xen_cpuid_leaf_t *out)
> > +{
> > +    *out = (xen_cpuid_leaf_t){
> > +        .leaf = l1->leaf,
> > +        .subleaf = l2->subleaf,
> 
> Since ->leaf and ->subleaf ought to match anyway, I think it would
> look less odd if both initializers were taken from consistent source.

Sure, my bad.

> > +    };
> > +
> > +    switch ( l1->leaf )
> > +    {
> > +    case 0x1:
> > +    case 0x80000001:
> > +        out->c = l1->c & l2->c;
> > +        out->d = l1->d & l2->d;
> > +        return true;
> > +
> > +    case 0xd:
> > +        if ( l1->subleaf != 1 )
> > +            break;
> > +        /*
> > +         * Only take Da1 into account, the rest of subleaves will be dropped
> > +         * and recalculated by recalculate_xstate.
> > +         */
> > +        out->a = l1->a & l2->a;
> > +        return true;
> > +
> > +    case 0x7:
> > +        if ( l1->subleaf )
> > +            /* subleaf 0 EAX contains the max subleaf count. */
> > +            out->a = l1->a & l2->a;
> 
>         else
>             out->a = min(l1->a, l2->a);
> 
> ? Or is the result from here then further passed to
> x86_cpuid_policy_shrink_max_leaves() (not visible from this patch)?
> (If not, the same would apply to all other multi-subleaf leaves.)

Hm, might be worth to set all the max fields directly in
xc_cpu_policy_calc_compatible and also add a call to
x86_cpuid_policy_shrink_max_leaves after the leveling is done.

> > +        out->b = l1->b & l2->b;
> > +        out->c = l1->c & l2->c;
> > +        out->d = l1->d & l2->d;
> > +        return true;
> > +
> > +    case 0x80000007:
> > +        out->d = l1->d & l2->d;
> > +        return true;
> > +
> > +    case 0x80000008:
> > +        out->b = l1->b & l2->b;
> > +        return true;
> > +
> > +    case 0x80000021:
> > +        out->a = l1->a & l2->a;
> > +        return true;
> > +    }
> > +
> > +    return false;
> > +}
> > +
> > +int xc_cpu_policy_calc_compatible(xc_interface *xch,
> > +                                  const xc_cpu_policy_t p1,
> > +                                  const xc_cpu_policy_t p2,
> > +                                  xc_cpu_policy_t out)
> 
> I have to admit that I find these two "const" misleading here. You
> don't equally constify the other two parameters (which would e.g. be
> xc_interface *const xch), and I don't think doing so is common
> practice elsewhere. And what p1 and p2 point to is specifically non-
> const (and cannot be const), due to ...
> 
> > +{
> > +    unsigned int nr_leaves, nr_msrs, i, index;
> > +    unsigned int p1_nr_leaves, p2_nr_leaves;
> > +    unsigned int p1_nr_entries, p2_nr_entries;
> > +    int rc;
> > +
> > +    p1_nr_leaves = p2_nr_leaves = ARRAY_SIZE(p1->leaves);
> > +    p1_nr_entries = p2_nr_entries = ARRAY_SIZE(p1->entries);
> > +
> > +    rc = xc_cpu_policy_serialise(xch, p1, p1->leaves, &p1_nr_leaves,
> > +                                 p1->entries, &p1_nr_entries);
> > +    if ( rc )
> > +        return rc;
> > +    rc = xc_cpu_policy_serialise(xch, p2, p2->leaves, &p2_nr_leaves,
> > +                                 p2->entries, &p2_nr_entries);
> 
> ... these two calls.

Right, that's a leftover from previously, where xc_cpu_policy_t didn't
also contain a buffer to store the serialized version.

Thanks, Roger.

