Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC723BE868
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 14:54:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152163.281134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1749-0007sJ-19; Wed, 07 Jul 2021 12:54:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152163.281134; Wed, 07 Jul 2021 12:54:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1748-0007pp-Th; Wed, 07 Jul 2021 12:54:12 +0000
Received: by outflank-mailman (input) for mailman id 152163;
 Wed, 07 Jul 2021 12:54:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m1746-0007pU-QD
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 12:54:10 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b89d6ae-df22-11eb-84ef-12813bfff9fa;
 Wed, 07 Jul 2021 12:54:09 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2058.outbound.protection.outlook.com [104.47.1.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-VuQ2s5cyNzaCBhdSkoKeYQ-1; Wed, 07 Jul 2021 14:54:07 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7151.eurprd04.prod.outlook.com (2603:10a6:800:129::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Wed, 7 Jul
 2021 12:54:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 12:54:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM8P251CA0006.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 12:54:04 +0000
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
X-Inumbo-ID: 6b89d6ae-df22-11eb-84ef-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625662448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sUDZAlZQr1ai+cbfSbAY7rmRuHxnzvUDZskGO0Bzo9I=;
	b=bXlYBzVLkm8qnvE3ENwV7AEcqEnDdR+ZAnFJihDP134j98G1VjpoXsKc75sgOXM+UH0DYb
	Y6vEEoduE7hh3h7md6StVtIKAVZw5+mm1SpHZ0zmFyK+EqRvWaxcLB7x5Q4ThoGsPUccs6
	3my7D3GTyD/9QK+oUmLtS3CwFteV5PM=
X-MC-Unique: VuQ2s5cyNzaCBhdSkoKeYQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRHEDvKw5ovTD0sWJKDpFTZE5jzrwJqsnLVvYGDmrzYXjhW05cSMTYu7SSDQvRc1D59vQILfa7gYCzqmaMk8sZPIKb/KxNBy6rmHnPxHWhBRVBrB/oRis6WM2OeOXBu+jmSa9dW7Zt3zun///DM3rgsPIPU4Nv14bkSABG3s/uacS6QTAKgqGTk+HNOtVnfCMyeGzLHYVoNQOJ4NfD1A2FHm9N1Bn+mWKo4ZkUqvVmwZSRpREkWYPtP4bmI23Q0qlIbJUrw0+qi7I4ERisj0bnoIR6tGeX93VZYHo6TaUfmyXuy+07xrMf7o9utpps5czuPGl6myseeykxBX5xwNqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUDZAlZQr1ai+cbfSbAY7rmRuHxnzvUDZskGO0Bzo9I=;
 b=EvE8hAGDH2h8XtUcd/78Esl2ljUqIiWH5vOmMXdGsyIPGg2ZIsLt4CEn6HA7r+CrUeq8ybhhxO0jkYAxFSyTaeqiiUzYcZKr20TwasR87UIy4kuc1nitunQXkhXo3LkhxlCt6oxtD3nYj3lHfeVouKf6Qt5zvZgLzVOZQztg7yIfSyNW5zkK8z0qGnwbV6EoZsnv/E66X9m35bwoPssOnwBAnDlkLGpMcZxYvcSQGStHu0IgiSSXHK9LbuaZzqR8ARhY2i6svsVpo/iSoCQBmDrX0oLwr8HAvxuM3lwyK3p68YgZ6KjKnNM0tpU8IbCXqpTvigp2Ui28YfWVQuYMlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] tools/libxc: use uint32_t for pirq in
 xc_domain_irq_permission
To: Julien Grall <julien@xen.org>
Cc: iwj@xenproject.org, wl@xen.org, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, sstabellini@kernel.org, jgross@suse.com,
 christian.lindig@citrix.com, dave@recoil.org,
 xen-devel@lists.xenproject.org, Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1625619764-23537-1-git-send-email-igor.druzhinin@citrix.com>
 <b1720313-d636-9c8c-3109-748dbe311187@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5e454ba6-3d3f-9402-140d-f576f9124402@suse.com>
Date: Wed, 7 Jul 2021 14:54:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <b1720313-d636-9c8c-3109-748dbe311187@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P251CA0006.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27341a90-a908-4c13-c237-08d941464d55
X-MS-TrafficTypeDiagnostic: VI1PR04MB7151:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7151AB50CEE3DF4AB82BFD99B31A9@VI1PR04MB7151.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	22Rv+gVzNDk7hMc+EMF3HuDGiQ4vGz0qWtKM0EYtYwtEHXmgK3LHJrdJ3tYbLlX90IByp1/SicvFHLtqlSVT3Kup7PBuIoPc6s2l30wgQdNudQV40rYDahxPFow0lDsByJ4gKW826sFD6L4LFEC/NFfexW2qdLRMwNK3wsV/sWsFX2mAkFSj5tNmTKyuKJ17sV+H/lqWXCJ7sKBVsWktdcp6hG7kMq3gEay6XHW/w9++r3b4xmzvTJfgsECQQlYrTJM0cMownm6C1cZ3Y1Pt27xgCwAE8Xpvi5h88gDia42e+umpGGEG3NeYm9JNbQvS8o5RGbNVeTkYNsD6mAbdunUwtyBlVOl+x1tPk7L16j4MX9PFmiTKOg28yvkoq+QIUl+192IFg+k5NTYMI7akZtlqKDORlFnXDSjPoVdRMdFikbP3IGVi52FA9CarwMul1SBrfprWHTUHWuNAO2FWoGv/THzSYQ5jd4IIq1sGlipCDzUMZy8YzK6pUDG58OGBiP9cGP+zT4DQjrkN56HurkA+Djh2OvFkSE/x9mwv8pxsSjGmrI27mO1ofXfOETSvSPCMtOyx8nneejkOllw8pSOHZZ8ANpkpH+84xgLmNd6QF2FBQmzNrhb5z5cof5RIq4t1Z4apPaohBsdsn71zsopznwUNf8QaLTKlfrU0SSQdLL5HFWbGaak83OAlDwyJDGUHrmIDehP9n1lb2R3Jlq68M2vJKw5TYPBGod6xdBE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(376002)(396003)(346002)(136003)(478600001)(83380400001)(2906002)(38100700002)(36756003)(26005)(31696002)(316002)(7416002)(4744005)(31686004)(4326008)(16576012)(86362001)(6486002)(8676002)(66476007)(186003)(66556008)(956004)(6916009)(8936002)(2616005)(5660300002)(66946007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnFyS2tuNW8yR1dvT00xT3YxWUVTelQ4OGtpcGN5VXFrMjNMU1ZXVWpmcmRj?=
 =?utf-8?B?SnBuR1lOTVRNaE1YM2pOOVNETVdMRHdoUUZubXJJL240QTlyVHJtSzFnZFNv?=
 =?utf-8?B?M3RNSERCbnBVUHAwbVhoanFCTHJLTWVpTHlVVExzbmJ2YjBBNzJBOUtjQ3RV?=
 =?utf-8?B?cUhiVUpGaGMvMkMwNjNUajRRakFVbTZVYXZzYjFDcnUyVTdUVnNvaUwzSEpH?=
 =?utf-8?B?N1NmaUQwS0RrUFdraW40NSs5V0E5SnpUOHJPUmdPN2NCZGQraHZ2azYxd2RX?=
 =?utf-8?B?OTFQK2IwTy9wVXhUS1Z3bm45UytSVU40dVMxdWs5MmZqUm02WlRQRlQ5cjZX?=
 =?utf-8?B?b3JmTnFoVWF1czRxZG9yWmloRmwwcTJoVjFVUzMwRjM1NzAzdG0yS3czZm9r?=
 =?utf-8?B?eTdXQjNxUnlnQ05xL3dPT2Y4K29hZXMvOVZtdHE2NUY5UVdYYkpwNVhwR2I5?=
 =?utf-8?B?TFpLbVRiVjQ1WUhvVUM0M2h3T0hwalZoR2xidldDUmtuaE53S0F6aDQrelBl?=
 =?utf-8?B?MXBXMllVR2JjQ25IamtzdlZBSGpOeVl0Yjl6Yk1LWkNDRXRFRFlBWE55UW9j?=
 =?utf-8?B?QTN1cE9nRlhBT0paQlFVNnlCU0lEaXlQUUUyQVFiUzh6aDl6N2JveVdYdSt6?=
 =?utf-8?B?aHBZNXRLVzVYWkFBN0gwYXdBQ0xFbUdiYlF3YjRsL2xkL0xndzQ0cWhDalc2?=
 =?utf-8?B?bFN0TVFFUXFIbkxoSDFtbHNUbkxkRFJkRi94TTQ2V1hoc2FoeDBwanh4aEE0?=
 =?utf-8?B?ZmdmUi9PZm03b3A0Y2hEVWNQMm53M1B2LzdJdGtmejgzbkpKWkN5Q3pMR0Mw?=
 =?utf-8?B?cGVzbnB0ejhRWkRtZDRncGhZQUpVdzhSMnk0SlJDeVkwYk0yYnFwNnBVQk1n?=
 =?utf-8?B?ZlVrZnJzTW53c0p3NUd0aEZzT01ZbmZGT2ZMWVY4RFRUb21NRVVFem5KampQ?=
 =?utf-8?B?RVZTWlFYazd0bmNmT3dDMUVLbFpaYTFZd3hYZ2lzOFRIc2JhekZWaGtrVzlq?=
 =?utf-8?B?TXp3UUFESzdMZXJYVHlyV2dEcG5nU0NkWk5mUUhqTmRiNkV6RWg3b29kUzZ0?=
 =?utf-8?B?dVZZbWR0UGQ4NHdhK2tVOER4UmdFaXYvZzg1R2FEV1NucllMczlEbHpXd0pz?=
 =?utf-8?B?RithQWs1TEU5and0cTl5Y1dkdmZsejQ5SVhCOG5MNUlvcld4Q2VDSERTZXFQ?=
 =?utf-8?B?OFlCaDBtZ1F4WHprcnpVNGl1NDdFTUlnTW5DWTg5UUNkV1d3RkV1TEMrSzdi?=
 =?utf-8?B?MWtiV2J5Sno4Nndsem8zRTZVb0pHaFJRQW5wbDQ2MjN5bzlPQ1RsVUtwNnl3?=
 =?utf-8?B?YitlL2JzNlNlUUdNZVFneEIvUTdMRUhMRFkyMmQwZlNBTXZPQi9UYWNycXVs?=
 =?utf-8?B?S2hDNzk0czFlZEpQeEFXNWJ0OVFUQU5Ob0NBVWp5QkpvRHRBYklLN0VvQWJl?=
 =?utf-8?B?ZXJpaWFac3NiK01UdXh5dmJoNjEvZU1SQjQzVzVqV2ZrNnhVeWZWeGtyUGkw?=
 =?utf-8?B?cTZnSUFMRHRRajZTS2VzWVhrRkFpcHpkZVZlaDc4NEk1NlU4SW13SHFwczAv?=
 =?utf-8?B?UUdHT3NNSjNKM0tkNmRsVXFlUEEvR0xtcUMvVm1IRFZzVFFtZStaOXBMc2hE?=
 =?utf-8?B?b3ltTmRacGptVjR6RkNsTFNla1cvK1ZoczN3Zk8yZjZjaTE3akNYVlJzbUU3?=
 =?utf-8?B?ZkVxcE83Y3NuUmVtM1lsUldkb2E4T0xXbU54V3NGdWhvcE1sd1hRekJOdUhO?=
 =?utf-8?Q?2WCwdKxznw3jtlooekeuxMf8/xs1oBnLktA9xzM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27341a90-a908-4c13-c237-08d941464d55
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 12:54:05.1907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: za5OlKWapbsqmJx8i6uQYgqocAT4s3c79OUaS75yEv+GTnfba5cGBNaGBxDGIc+ms2OW0HtpqDxKOVhGE5HXCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7151

On 07.07.2021 14:51, Julien Grall wrote:
> On 07/07/2021 02:02, Igor Druzhinin wrote:
>> Current unit8_t for pirq argument in this interface is too restrictive
>> causing failures on modern hardware with lots of GSIs. That extends down to
>> XEN_DOMCTL_irq_permission ABI structure where it needs to be fixed up
>> as well. Internal Xen structures appear to be fine. Existing users of
>> the interface in tree (libxl, ocaml and python bindings) are already using
>> int for pirq representation that should be wide enough.
> 
> By "int", I am assuming you imply "signed int", is that correct?
> 
> If so, should the function xc_domain_irq_permission() interface take an 
> int in parameter and check it is not negative?

Please let's not make things worse than they are, the more that
./CODING_STYLE is unambiguous in cases like this one. If we mean
non-negative values, the type used should be an unsigned one. In
pre-existing code this will obviously only get changed over time.

Jan


