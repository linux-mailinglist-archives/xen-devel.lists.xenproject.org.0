Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6533B09FF
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 18:11:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145957.268486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvizA-0002fD-DV; Tue, 22 Jun 2021 16:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145957.268486; Tue, 22 Jun 2021 16:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvizA-0002cK-9S; Tue, 22 Jun 2021 16:10:48 +0000
Received: by outflank-mailman (input) for mailman id 145957;
 Tue, 22 Jun 2021 16:10:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RtyV=LQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lviz8-0002cB-Ui
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 16:10:46 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15f82209-6f92-476b-bc05-1ecb86e59190;
 Tue, 22 Jun 2021 16:10:46 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-NmOAeSOXMF2GiINgEWtqmQ-1; Tue, 22 Jun 2021 18:10:43 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4382.eurprd04.prod.outlook.com (2603:10a6:803:73::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Tue, 22 Jun
 2021 16:10:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 16:10:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P195CA0004.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19 via Frontend Transport; Tue, 22 Jun 2021 16:10:40 +0000
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
X-Inumbo-ID: 15f82209-6f92-476b-bc05-1ecb86e59190
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624378245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zm9L+/AvzN0dIVbx8GeBZqJQhaMXOfsGlUm9zPZfbzY=;
	b=IUY+6HKUwq2WNzKaT+knxV0Phcdo3/Pa0znBlACb8Z2JLcti4zvgcwWJEVEU1anxiL+rYx
	JTXqfuKFH3W5f/IRIcaU4c+AZAt+lt6czT5qNUi0M+dTtGfTieAROaaxeSLJne3NN9lxPX
	nMz+nUK7khQ6KB4uNsVgR5Og8XPZ/5c=
X-MC-Unique: NmOAeSOXMF2GiINgEWtqmQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXYpECBxZu7gOPaCT5bbGhUOtoxA6Em0atGydqa0I6gTiuggmMyORhMwOrtnC9tP5mgWqTyEzhEEJN0Z5jaTILSTlzkFQnynR+28XlW+5VBp8gbsIiKXTDA84jiG+MZmZOD3zqBWmkJn8sEyWYEuous1n1PGmIqNfCVp8i53G8VrmSHjwSZe5QyMqBQsDbZSvwiE4kgfQwGIeg7u12f3IbsCF9MV3abUUfbA9LJpJ9BgEmeTEFJeH+p0sHG5nexgu5qQCbU5ZlWNh5MwknQ/J91pokouUC/29b8nE3tVVqJoTSXr8sIF9VVMEjEPFtCx+TOoK3LkkLu36SA/cH8NZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zm9L+/AvzN0dIVbx8GeBZqJQhaMXOfsGlUm9zPZfbzY=;
 b=hBHWiB50KI6cMtwKtzBC6F4HncGePloUz8gYmZAVCR9lixE9NEXQvCdkdFiZZ/Jn4zorcAKVAPyUjYFEoTs1TOt7xT5lcIEkchhpY6nAW/eSZOY2g/ys97Wno8GbtTF8UP1wx22XLUkZBCkV2LsXrnt5tN27vCBmsHvDEjDadgJV/Wchxn4JT859nPxyicqc4G4gnAR2EmxVt7XEqiJoUeOEqlaByqUX0cT/g7pD1jecmyb/zQr960Si8WcB9WRgoEb48gP5lfp6BjKti7aHOJ75d+ghBYhKs+xjlxABGC5LFbqBFlj0jrDBg6M34rIH+A4x2HXWjpbP8E2yeO/l2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] Revert "tools/firmware/ovmf: Use OvmfXen platform file is
 exist"
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210622153930.16003-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e3104d67-d988-06f7-58e1-92ed3ef739bd@suse.com>
Date: Tue, 22 Jun 2021 18:10:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210622153930.16003-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P195CA0004.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf0f16c6-0579-4b67-b24e-08d935984851
X-MS-TrafficTypeDiagnostic: VI1PR04MB4382:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43822634D50F5E3E4071CE37B3099@VI1PR04MB4382.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z8VqRfDDHGk+DSgkn42zuUoYyFpkLVIJROxla0WAnSKXCwiWFvyvnVqRQ29jOcuyzTWxSEyw/XC4lmyvZs1210OO2/cKAtmtM/KVmq5yd9qscBaHi3rmlHNOHBxXpmYlZ7Qxu0vRZPu0KTfVs9FXDJsRmJuxJrp4BQMqjtpFQtEgWQ2DzoBMRtg3Ey7eJIbYelu2Drc0x1wfqmV+eyCxm4FsxPvgP/PnAfaEG7+EBchAooyt4olmwkRSjV6/noqlwEZkCIYkne6xzmqvk8WwgOVOy5tTVZqd5R45yiHkxP6fAIdBK0pZSNFMvU/RJBfpnm/47ILiuVLboBJTrk62poqjGoVaqmZz1WEugpntCSP1i6YHVDUr627Y2a5SpkabG+fx++DxlQHULylh94iCHnSVZKy/VRMwnfdjeYNXS2wE/oUnx2aA+dGhSmlMCtinz5eS4scFFxfybIlw0hDkI4bmJwHBFvW3TtOTdvXjC8px6NpIrbr3uVxq39j/KgpHHS4hQ9GBaIl57uNzA/CjHWeV1T+ezZ05xUPXbLX3dbZgKQr5gC66HNDo+YZrmaQdO2+1DxGDAjgGlFhmQMoqagKYS9zZUh2mlUxSZPrYXtd84bP4bkiOzdZHJnDtcFnXjsu3c6x0RdDaTlQIwDoIlQnhdtkbGCCc4UcMhvWb+J30a4fAaQtoSBJiqyESajT3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(39860400002)(396003)(366004)(376002)(956004)(54906003)(8936002)(186003)(26005)(66476007)(2616005)(83380400001)(86362001)(2906002)(53546011)(5660300002)(16526019)(38100700002)(16576012)(478600001)(6486002)(66556008)(6916009)(316002)(66946007)(36756003)(8676002)(31686004)(4326008)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzQ5VzV5V0lQamIvUGpBbm5OdkVXNGVFU2VjUXpwRG5TYzI3SXp0QzJoa05Y?=
 =?utf-8?B?ZnBsbTJWaXVVb0lBelJaRzQrU3RpdkIzZmNCZ3RmMUEzOG9RRFZWUUM0RFVI?=
 =?utf-8?B?UExuWG90QmJXcFI4c1A4WDhhcEVpSTU5bElUSENZSklBd2MxYWhHRmEvL1R2?=
 =?utf-8?B?SWVRWUFHcjZjOHBFUnFzUURHUnZXSjNtb0VIMXNDajZvL0tsTFpCL01UdE1R?=
 =?utf-8?B?KzJqdzVrNndPNkFCNkR0dEJOM1Rma0E4Z0Z2N1dwNExLNk1ZaXNNa0R5MUhO?=
 =?utf-8?B?NWIvK251amQ3c3h5aUI3NXZOT09TQWF4eWxjLy91bkc4MkZuQnVMQmxTNTVY?=
 =?utf-8?B?eEJhbjZlc0IrczB2enVyNkVybXBBVGttMGdJK2MyVVFSTDhydVNxS2xFM3E5?=
 =?utf-8?B?ZVFtN2g0S0pvcGxQNGRZVzVwcXYyL01LRzR4MjBCTGRUbWhpc3dnQXpZNnNo?=
 =?utf-8?B?bC94cjY4QS9rMUpvZkhidmUxK1dYbTRjRlhGM0ZZMk9KZ0hTMGdiaHRPM2du?=
 =?utf-8?B?OHBPNFdDd0JnR1p6ZVZNamNLb2xDL1owWWYwVHRJdVJGTDFyMG8xUzY4bEJ4?=
 =?utf-8?B?bzdURzNqc3BiZEFHZm9WUlJWWWVZa1NVUjdCRGgzOHJKdkl2TGVOR0FJbmdG?=
 =?utf-8?B?QmRzVzF6TmZXdW90ZEwzZTlyRWpaaVl5dlpmSWszMW40UmVlN21nMVc0a2l3?=
 =?utf-8?B?MDhLdGpFampZWS9GeTZNS2JPdFE2c1BlSTBkT0o3NndIYTQvQzloQ2Y5bUhq?=
 =?utf-8?B?RFhmc0wrcFROb0J4REpiZW5hV3RxVGxEcHNqbWxkWUJCMGRGSXJ6MkluZzJv?=
 =?utf-8?B?SGhJbEJ1Q1ZZRVhQbndvRWxFSFlyRHZacExSUldwY3h6Zmd1dDBXZmtWVHYv?=
 =?utf-8?B?cTBVblZEZ291dW9SZWVjMFdtZmNJcmoyVHBMTHhCbEJFYXpKZ1I3Q056ZTF6?=
 =?utf-8?B?K0NJREltV1pPMkhQRUZBcFVqOVhsUWZBMVl5SHJ1UG5odWZtYnJiQzk3dlZv?=
 =?utf-8?B?bGhwdDRCeUI3R1VaSFYxckQ1L1QvTVJ4YmptNGpsN2xVV25xZGpraEx6SVNp?=
 =?utf-8?B?dks2d1BWa3pUb25LYWRXTVJpenhySjlUWm03cml1MkE3a1M4amJSTlNhUUJm?=
 =?utf-8?B?Q25qWnJIZGZJMllJYlVjOEJmYkZPdGRRRDFPVVl1QTc4TzY3QkNDOWZ3Mko1?=
 =?utf-8?B?czY0azBFRWNiYjVQQ29RMlZnbjJQdGJUMDFuYnFleGM4akdhMkhEL09ybDlt?=
 =?utf-8?B?TlpzaHhaaXNFRzk4SmdyM2x0M3BERFo4VWx0aXpSaFFoTGU5RVZjMzQvOFVF?=
 =?utf-8?B?RE1CWDhieUJhblRzOTMzcTdxTittVjVLZVQzRnFSQjErNE53eGh3SGRZV2tk?=
 =?utf-8?B?c001MWJZRk5IanY1WFl6bUJDMEd1Yi9tSmNsd0VKbzl0dGhBWjVSU1F0U3VB?=
 =?utf-8?B?Y21ITEgxV2M4cVkyaTUwRGl1Si80NHJjWHRPQVRPaGtRUitUaUVobXlpTzJC?=
 =?utf-8?B?NVdJOUlra1A3S3FucXlnVFV1QlJmaGtLSzJ6VnVmNU5BT2VFOUhWUnNtQUo0?=
 =?utf-8?B?MlhSS2RtN3FGQ3l0bjBlbzJDMm1FZldEZ28rZVRCN0t2MnFZUng2ditaSGtS?=
 =?utf-8?B?YkU4TUlQZnI1cUpITmw3WWMybkdDM1BhenNtTnlEbGhKejlnQjNsQ0JrRjlu?=
 =?utf-8?B?NjFEanNQUTZuMytobVdZcDEvdHE1UHRBbHUyOHNPejZZYmhLNlpQc2xmN3FT?=
 =?utf-8?Q?aLBymYe0xRiksYWmv+wF60UvXPFd/lC2X1mvbpJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf0f16c6-0579-4b67-b24e-08d935984851
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 16:10:41.5230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Cl9efhYBZ/tCqUIJ1vGNv4+dFJredfvMS+7uNE0Fds59ze2QV8ZBvkcYV0mtN9C2LOW52G2c4b4NTDItovbXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4382

On 22.06.2021 17:39, Andrew Cooper wrote:
> This reverts commit aad7b5c11d51d57659978e04702ac970906894e8.
> 
> The change from OvmfX64 to OvmfXen causes a change in behaviour, whereby
> OvmfXen maps its shared info page at the top of address space.  When trying to
> migrate such a domain, XENMEM_maximum_gpfn returns a very large value.  This
> has uncovered multiple issues:
> 
>  1) The userspace hypercall wrappers truncate all return values to int on
>     Linux and Solaris.  This needs fixing in Xen.
>  2) 32bit toolstacks can't migrate any domain with RAM above the 2^40 mark,
>     because of virtual address constraints.  This needs fixing in OVMF.

And I suspect even that presently enforce boundary of 2^40 is actually
too high, and things still wouldn't work when getting close. At the
very least the tool stack then depends on a fairly big chunk of memory
(2^30 bytes) to be available in one single, virtually contiguous piece.
Iirc 32-bit Linux can be configured to not even leave this much space
for user mode.

Jan


