Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 366C53A0FD4
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 11:53:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139061.257240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lquTH-0006kb-N3; Wed, 09 Jun 2021 09:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139061.257240; Wed, 09 Jun 2021 09:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lquTH-0006hR-JM; Wed, 09 Jun 2021 09:25:59 +0000
Received: by outflank-mailman (input) for mailman id 139061;
 Wed, 09 Jun 2021 09:25:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jMcQ=LD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lquTF-0006hL-PC
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 09:25:57 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b813fc1e-31e0-4128-9345-d79a4c757b84;
 Wed, 09 Jun 2021 09:25:55 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-dAaOE4-tOJqkxfqb_tqnPQ-1; Wed, 09 Jun 2021 11:25:53 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3118.eurprd04.prod.outlook.com (2603:10a6:802:a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.30; Wed, 9 Jun
 2021 09:25:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Wed, 9 Jun 2021
 09:25:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Wed, 9 Jun 2021 09:25:51 +0000
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
X-Inumbo-ID: b813fc1e-31e0-4128-9345-d79a4c757b84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623230754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1UKKWmfXzIXaDaMFirhIX630AbZ84/Bj/Gao4GpCo0U=;
	b=b39h2Y9W3kERxb1kN96uZHWry2wmmtt7g+fBVXXXL8QgycmjB1We3xBXaUfDSiu9ZwYsKc
	U7VEkiwLgkoQ6To8N41oFoHXQ8HzT96a+I1+8FPYnTGIlYi32S8Rha9vGP55LbPAr6wlii
	bTEA2QxbjJzShVln2xwJUOvhzINGYEY=
X-MC-Unique: dAaOE4-tOJqkxfqb_tqnPQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0uCyvYqmXF0J4qHZqBdPyzH1m+ZUQCZmgleEaHxpERY+935PiRMqhrRqoYgxn4/EkhO0s0siMNb7jEF5c443uxx2DQR5llO0KpLGnIH5UmZ3evT19Hfde54453QjOhkH2vCgV3jJPF9Oagf/RwVNwpgPTYK9nMd4XpcBgdPD1dBCp3/eSicRNpvbliAjZEuJhUuty08hLF+qAiIdU+aNJL+sdPUELEergh9+m0V2oQXNWC3/oDN1cBiapPpccQXrR+Ov+gZSoIvZ3Tv2HblspnXXSp9s/+DR5LS36ycfAVC5xNkIjSJGAI4yxkO58Z20wikwMBUhP/AQmzCS5NHsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UKKWmfXzIXaDaMFirhIX630AbZ84/Bj/Gao4GpCo0U=;
 b=UGAp8p9pHluo63lkw30wZmKznhgziIaUiO4B/yWqYl2jaQvJatzsgBX7iM17QbE5t5vdCa5x3BlQrWx0ZPwP8VgMwuyVU0UKjhH2kLGPnrJCOCmGSB0guAix5Y2H5++aDUVwYKfKNqDbp4U09SVxpRY/s/isua8LwDqnMrQv0XVkjyW5KskQwGK+12FpmFk7lHSZwkWnrJsnEtNEZlBJ4FGAyH8tJa0iEDtCab8Sc0tMplTpzIObRIOKnjeha8L5q0X99JrOB/xAJkFEw83UGbG/0iyAo1XW0lk5FhHay1tyDO/9EOOo2Abwd80XdVdXmVxkEDSZ4MYtf4XAqI0TiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/9] IOMMU: XSA-373 follow-on
Message-ID: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
Date: Wed, 9 Jun 2021 11:25:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e18219f6-e490-40f1-3a97-08d92b289331
X-MS-TrafficTypeDiagnostic: VI1PR04MB3118:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3118F80F6EC8A0432EEC5BB0B3369@VI1PR04MB3118.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FsTcU4LMiYiKh2eC8pM//S8hMpo2y1hpZvSPMSd+Q/PANdz4RRCZUQzlX1by65BAVdeTyO/3B+1knBa/YwVg9XRfNsl5oajgcGrVWKA7l07dRQq5qW8EgRjE3YZByjt0UIgtrECERmYVT6kEt9k7mAqU4j7Jk7zB0Wtz8Pnlhiej+bXaFh/8W0SmCZOZLmZG7OBkXhIv7zU0Nh6QJh52B9bo1lJucOyi2Hn+8LRcjpj0GPFOlwQwD15dbj3lrXA6PM5sGpAEgei048SF5HelbbOb9zqlPA+5cZ1ZqrS0DSW9qg2+VH4ENrsDIiFaiRVb/d8E7ZW/f4hDLud1VsKnYh2nxKhkMSev5nFuLrwPcdQGJcKobiBfG7NkVM1f47iKtiNdXPGa30s6IBKPo0kfoPE+mr8YX25MD92dMjOagUZtZR4wscMt7zliUo8tnQCHjaEdxOO2cGgnkVjVdvsxya9adsp9ABQbddtWCKhmzgfkrsKaO59gYEMLdL01MVRoIJnNIPb5QNuJOJIE0LfGpJ1+AVViISqz8mYoOwkV/p/yBTsU0xuy9aZVFqNeH46ZQJKsUpM6u68FIqawKMtG5xVLoCLbqwnn/j5UzTZ+agiWQFFzn2ZJwDYciCjcb4DfAlW//MgxA3Cmy+JAypwCumoeS3RespUAAJbyGa+8Bf+FnJ2DvvUqA6GBezKw0QQ2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(39860400002)(366004)(346002)(396003)(16526019)(38100700002)(4326008)(26005)(66556008)(186003)(8936002)(66476007)(4744005)(6916009)(83380400001)(8676002)(956004)(2616005)(5660300002)(86362001)(31686004)(2906002)(478600001)(6486002)(16576012)(31696002)(54906003)(316002)(66946007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?MWREVGpsUFQ2bENOSTYyQkw4aU1wMVN0UkI2c2dNQU5Ud1JicXE2Y2MxVE9D?=
 =?utf-8?B?MjNldzR2Tlh1NWxwdUlPcnNVZUZYcHNCNjZuRGJMYTNIbU1sMXJjL0dPODNG?=
 =?utf-8?B?QXFYUlYzY21FTVl5U3JpMnJ5TGZySUlJTVhKbjV1amxFTzFIMGlDaExONzQ2?=
 =?utf-8?B?TEVWeTdKSHd3RFNJMW9qRmRFbU9QMDg0OHlzMUZuaG5uSmFxLzNaRm5nN0to?=
 =?utf-8?B?eFBZbjRIOGE0dHdsLzZ0R1A2cXpRTUxtRnk4OG9ENXdJYjFKeFNVSlZhaFg4?=
 =?utf-8?B?TFFvcE8yUjJMNTlicm9OakpMMDB3dXp0SURjNXVDRUZSZklGSjh1YVdYbllM?=
 =?utf-8?B?aGRuMmlGckJ1UnFYTXdqdFBOUXpzcmtwT3FOclYwc3cxa2ZIakhhVnEvTVRY?=
 =?utf-8?B?MGRxVk8vbk44elJYaXhIUHRrVjFjdi96SEE4WkRXenZ5a2Q4Tkt0RldKYStl?=
 =?utf-8?B?YUd5UVJkMmJPNHhqVFdlang1S1U0aExuaGx2VnZxVitWVERWZFdwYXJYMFJP?=
 =?utf-8?B?ODNRT2tDWFJTS2MvcVpXTmxRZzBCeTNFV3NKWC8yV3dkdWdyQXdvS1AxWm1o?=
 =?utf-8?B?Ry9TMWR1UkNRTXdlYXBxVzljQU40Y255TVMxd1paNFRaV3FMOFBYamZyQUlV?=
 =?utf-8?B?YkV6M3lCa3ZwdFMwZ25JZkNiVWNlYVFCemNIam1JK0RCUzdyOFpneDRER2Rk?=
 =?utf-8?B?dDFmMCtXc3N6WS9nbGMwd2pHS2tlZ0hFOHBWdEtxenVVMFBsQyt4WTJySHI1?=
 =?utf-8?B?bTdaOGFhTVdSVTh1eGtRSFZaZnlpeVc2c2treGt6elc4MUZxNkVsRDFOTkJU?=
 =?utf-8?B?UUlWY0pKVjEzVjVYS2J5R2ZMZ1dzbW5wUmpyTzZFKzVpaWRMMDN6L0JtT0lP?=
 =?utf-8?B?T0FqUTE5ck1tSUtERFVtaWpOdTBqOW9qNHROakxaVmhOVjYwRE0yLzhTL3Vy?=
 =?utf-8?B?U0lHaVdITzFYUzRvVTF0RUE5c3pDUnYyY1dPRzRnS1JUejI0eU1rTlhnaE40?=
 =?utf-8?B?aUxXUWx2a3RaWEpobUtpTW9CMFJIV2lBZGZBL2Nqek1zSU1sNGx6T3Y3VTJG?=
 =?utf-8?B?clhsN3RCbUtQVUwwTnVPekpwemhCTmhKbEt2a3JIZkxGV3duS3RrWkpwdzFV?=
 =?utf-8?B?bURWSDcwWDM5MENjUVpUS2xiMVRLazVDL1lweFVkWkNBUXZZSWtiWUhBZk5r?=
 =?utf-8?B?ZkFCMXU4QTlJRHluWjNHdWU5a2NtUHhqRFpQK3F2dWg5SFFUeEhvWkRDVEYy?=
 =?utf-8?B?S00yMEVQQXJBSWtmcTI5RXh1U2hPeHV5dm9Xckc3R2FRdnZhTWp1NzJuZ1lr?=
 =?utf-8?B?NUtZcVh2aituNlFWVHJaaERRdDg0ZzhDZ2JudW9vR0ZhKzVkTjhFMTRTMTJa?=
 =?utf-8?B?QnRhU282S2V3aDN1Z0xwQ3F4bDZxeFFkVE9ZWFV0MlM0VFpxR043ci9pL3NF?=
 =?utf-8?B?bGZhSUNULzBqbGNqalhlU3RTbEhzb0cwbEFBbnhFRENHZHA3aTZaVHFpYkU4?=
 =?utf-8?B?TEdMRm0wWGtpNkVudjkxS1dVS3hnL0xDTjhkdXMyMzBKRUlDczFQVHk1dDZz?=
 =?utf-8?B?bWZlUVkxRkFLNjJUUk5KbTRhU3d2K0FMTkJhZE9aUEd4eHJ6bTQwTkErcVpo?=
 =?utf-8?B?bnJPYWs0bTBUZlg1ek5vbGJ6M3Z4am0weEQvU1BCRzZ5eXM5eVl4b0o5OHo1?=
 =?utf-8?B?L2hreW5qdUk4K0o4T0pRVm1NSFVIRmZjU0tDWmZmTk8xYmRBTzlkV0lmWGJa?=
 =?utf-8?Q?bXJL9+kjk0TrxABzahNN8q+z0hDys9D9MHWO0xs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e18219f6-e490-40f1-3a97-08d92b289331
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 09:25:51.9118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6m3KFYPI3MsUJGpbOpCU87LPGAEUL4hicN8b7JErFSpEfEPJUx6OmX5KhtasOPh5zFFxXrYJSz1IxAf62cPjfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3118

A number of further adjustments were left out of the XSA, for not
being a security concern (anymore in some of the cases, with the
changes put in place there). This is the collection, possibly
looking a little random in what it contains.

1: AMD/IOMMU: redo awaiting of command completion
2: AMD/IOMMU: re-work locking around sending of commands
3: VT-d: undo device mappings upon error
4: VT-d: adjust domid map updating when unmapping context
5: VT-d: clear_fault_bits() should clear all fault bits
6: VT-d: don't lose errors when flushing TLBs on multiple IOMMUs
7: VT-d: centralize mapping of QI entries
8: VT-d: drop/move a few QI related constants
9: IOMMU/PCI: don't let domain cleanup continue when device de-assignment failed

Jan


