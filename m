Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A40593254B8
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 18:48:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89909.169855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKjh-0006s2-2I; Thu, 25 Feb 2021 17:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89909.169855; Thu, 25 Feb 2021 17:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKjg-0006rd-VJ; Thu, 25 Feb 2021 17:47:36 +0000
Received: by outflank-mailman (input) for mailman id 89909;
 Thu, 25 Feb 2021 17:47:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3W+l=H3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lFKjf-0006rT-MD
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 17:47:35 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd27ccb3-2fae-499b-9739-f2bee1085892;
 Thu, 25 Feb 2021 17:47:34 +0000 (UTC)
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
X-Inumbo-ID: bd27ccb3-2fae-499b-9739-f2bee1085892
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614275254;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=p0bB5LXPhj/u6QZchLuLKzPAVBdmryQ3cjYIYo1x/6E=;
  b=NbFeWIV7hnMUrZWcAjHnLGr8X1QyDLOeqr0nb2UOGDdRD8CxYqk6YL8s
   97DjDvLqtW9Az9+f4lGD9V9FLWcfQH5OypM0mozg0tkhYgmGZxSjoYSIf
   1dJf5Rtbs8eqAoCN1YlJIOxBUqerHA4ilxq3zoJOMp6jxh0LdMGIXpqK3
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: RKl/JzpNylub9Xb3FH6IJYZ8tZbK8RElC4/hAt3HnljLh3YTIv7AOOIaQK0AsmbI5SbKL3Di2p
 umplfgHzdYtMT5yGQJHp+/qtGZmKaMuG+W6HMNDcrwgczky5PJVd23f07D3RevKCtQ7lbZXcGO
 FQ7CByB+UqHzTVZqy8d/twT8KLkCEx4Vus6gb9hGU3PsfZdrbFTFPZuACJtJU11+g9QiqKRZfR
 qWDPg8jHWP0lHOegY77oMmLC9g/sjN6UNxNOYfAiXcTpdqTPgACcbg+4nt9tAOYZ7wvjeP5JBs
 HuU=
X-SBRS: 5.2
X-MesageID: 39436144
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,206,1610427600"; 
   d="scan'208";a="39436144"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwm6rvTyav1Ibe578hr45EgfNe2XIEMFMSBY3+cvySZLJ5dckCrIJ2B9LYR2GmiHx2L3LGsSzcMmF4OMm/5y++BXfdvXsfgOvYe4YmXIJ7zt6hQkjAZVEwn7l/ObEEcQe/V2TY2/TN45NDRV00MqZ+0BUHAou53f0KaWQVb+BKP8VrXe/CaJW4gXCGQ4u465KVZiYqsZa8TMMxRCJGXwDPuZS+7+Iu3caymDlfw/dhckhglXIIz+/WuPyAh2g7MPX+W261I2ZabvbEDbLi4CZe2BaAioBaaYy/peFIjC6vHXkpKfVEo1tmXUmRCZbt+RH3iDr2CLe95Eikouam2EBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0bB5LXPhj/u6QZchLuLKzPAVBdmryQ3cjYIYo1x/6E=;
 b=KxossKtavnSTB0+1kPEfe3OsL2O5fZ5qyX+6fKOdIzssYccaX4L09lXmztK2TOOYjutl9oYFzfaXaVrtIyK+1bphnuh6sxBV+1IZZUMaHW9KxM3nZxGkV0nxporACJHOCdkr2U2fnaoxoTmXEO+Gp+yRPV391w5KMal0rso41TCmzEJay1MrCUt5LNzTqTlNVOk0XPP9z4A9gP8HL7HhcS996eJ4hAajh/Ir19o/T31x339gBsLpp82Il7nRJbSq8NTQwh2Rpw0NCRA/93J7wtbDvRCqkl/3yunejUkt0Ip+cBQPQe3bjdZF5HSDKkCJoxmCgnOzkYwZGIWpTD2MLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0bB5LXPhj/u6QZchLuLKzPAVBdmryQ3cjYIYo1x/6E=;
 b=r69dUEzn8P9r4OlJ2c0dYAv7ZGcMeLXj8OIpTcyr3faC/7r50+RyOJHPlu6coSXk84wgInyE0TSji2uz5zldbxIxsddlqgt/dg16asvWCy3CvuPmYwXzyRHRurhpNHiKpWTlu4S6Ar5iEpzECRhk7kokRNaa9nEBVgg61OsAKFk=
Subject: Re: [PATCH for-4.15 5/5] tools/xenstored: Silence coverity when using
 xs_state_* structures
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <raphning@amazon.co.uk>, <iwj@xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <20210225174131.10115-1-julien@xen.org>
 <20210225174131.10115-6-julien@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1d456d07-a27e-aa3a-1a0e-46d7e71ba1e7@citrix.com>
Date: Thu, 25 Feb 2021 17:47:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210225174131.10115-6-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6184ae2f-bd2a-4be9-516f-08d8d9b56c52
X-MS-TrafficTypeDiagnostic: BYAPR03MB3862:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3862BCEA1E5E076940210B6ABA9E9@BYAPR03MB3862.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hRk4d/MkQGl3KwulrrlBiRc0sIA3nghScVNNe5Ncj/6Xxyb3Q7FMTjHvJr8obBeOxqM0+eIGpdk7KZys/CNjseEn5D8cTNYke6BJSDvRjkAG6IJr+NBURlgisULZnsxk12s/V01IgMzvnbklYozCln0cD+y60BLwryiHKqGHdJYkN2UoYGKtY1PY8kXi6qD0e20v7RaMoipWT3ps4nVcvkjGVxwfKX/gxeDNmnnbAwSu0y1aw5uJqVcSpWd8WXj7kPj6ExDWUVqz/3+3c8PBKm6+yP//L9e9GJ6gl0/opFeiV6clK+Ow3SgKPQnjVScGusClFpNfh7RRDbdlGuU7RuBsQPFd/7LJXVfAi3br5C4wTPrbWzR4jnyL9gr1IvbYcVTzYNK2gWPmWLSfFTzBM9GXh+NeXM2rmKMTD7Ok9Byu7E5XQ0jJUBLLriHLxvVW24fvRNlLcYTiYVMmW7vtdmlR+muJaIbG6YoO1tcMY12syZINZtHx/SSbWSPBUJTBFKWmrfaGjUJsJh5FcdYMzIpFg4b0zIOnS67b/aA8wkyL7bDt3LxzsJaD5dhU0exFdBtfcPyRmdhXK/bPpuDee63U2UAHC+zqZ2DrNdn3yZw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(54906003)(66476007)(478600001)(26005)(53546011)(16526019)(6666004)(31696002)(186003)(2616005)(16576012)(86362001)(4744005)(31686004)(2906002)(4326008)(83380400001)(956004)(6486002)(8676002)(316002)(8936002)(66556008)(36756003)(66946007)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TjYza1gyRmFvOXNNN1hIOHNqYjI2djBMcC84RzcyVys1NU5lMDdLV0gydUpy?=
 =?utf-8?B?NGNwM2tqRE53N0xuNllFSGhMS1NVb3dtUVA2VEx3OE9TVFQ4c1pKeHVYc2Vv?=
 =?utf-8?B?ZHhzUWw4cDdndVpLLzROcVVCNHZ1WDd6OFVzUEYyQWMvSldGS3NqTDlYK0JG?=
 =?utf-8?B?RWQ0bGlnQ3RUazRXeVBCTmRsS3llQ3FUK2wzbGI5MWNFZmpQNk9ZRW5WUElZ?=
 =?utf-8?B?d1ZLREpmdllsYmhGUnlVcE15cEFLckU5TjJBK1NVdk9QeXVHQWk0SUpkYlFz?=
 =?utf-8?B?OVI5cGNaY29zSWVEU2t4QlNRRUdkUGJQejA0RXNVN3o4VG5LdHd4cFNBQnRX?=
 =?utf-8?B?NTluT1NPNjFmcmtRWUV1ZHJUeWs1R0l1N0s4VXJpQzNuTjFIUHE2VERNOCtF?=
 =?utf-8?B?ejVYbUFHbzBEWTMwQlptdFJHakpXREl0dGtGeGhhcDJWQXJ6dDNzNmJ6cXBE?=
 =?utf-8?B?Vm9teDJ6MEp3VlRGZklvSHl0cW9xY21FM1U0Zk9WZHRHcFRMNkZQQlZEWjZ6?=
 =?utf-8?B?b243RjZGMExtSDA5Z3FCK3VFN0VwSXdxMVZrd3dzdklFYjRablo2UGU2Y1I3?=
 =?utf-8?B?cTRkb3JPbm81RVRnV3FsOXdkL3pyUHJUa1JkczV0aVJNK2NSd2lhUThZaFFm?=
 =?utf-8?B?ZHRsV20xSTlUcnk3cG5ENUNTT0ZmNUNaOFZnQXhjVHhjSWpzSUZZOVBveTlu?=
 =?utf-8?B?Z0o1Z05qWnlsbEtxTE9paDJINnVDNHByMzU5WHViTHZUbUN1NEdjT2pTVDh6?=
 =?utf-8?B?V2F1R242aXowNVpmRnQ4dFNreXE1eWpmOTZRWkxGY2k0Rnk3dGJvSEVpNFJQ?=
 =?utf-8?B?cmVscG1DWFpTeEY4OVZCY1cyT2R0T1Z5ODhEc09DOTNmZWNPNXQvblVrUHFP?=
 =?utf-8?B?WFBTWVpHcmQycktFVHMrdDhlbm9VcmVyVUR3T1lnc01mS3g0WDdEYzBxMkNT?=
 =?utf-8?B?SnEwdTBpTC8rSDJKVkZlKzN4MHd2V3Z0UDRvaXZBdWpKMXptUmRvSnZiM1ZT?=
 =?utf-8?B?UHk0SEN4ZHczU214L2dDS0VPSWU5cGEwWjRYbVF4RmZISkRNSU1ZU0Z3YjNX?=
 =?utf-8?B?eWJBZitPNEVDWVJCa0hCemliSkQxRitFdHdLTHIxbUo0bktuUElMUDhHeDYz?=
 =?utf-8?B?dUoxelZoOGx5bVRhblo2OFkrbmtiOEZ6a1lHOE8veEVCbFFnL1dqeTBsOG5F?=
 =?utf-8?B?eWoyTXZpM0hQWVBiRHQvdStPNmJrMitrYzRRS0UzbzZ4WnZIUzNZRTdub3cz?=
 =?utf-8?B?MXd2c0RGRnBkUElZMHlGYVI4Q2ZYVHVJYVlpN0IrY3ZLc1RPS2FmWUR5eDcr?=
 =?utf-8?B?SzVndmRiNVUzbjhRb3luWThITUFNQ0FmUGc2d3N6MmN1UXg1eGxnNTZNWEpE?=
 =?utf-8?B?aHdFeUNwOWZWdVZObjB2cE8ya3crd0hWWFhmaEM4enJvUktnWjR6WFBpL3Zk?=
 =?utf-8?B?bEtpdHJWU0tIY1EzaW9GdWJ1ZnBFSkJFSnZIUytHSjZrQnFwbEFkMjJPY3hl?=
 =?utf-8?B?Q1VqdFdHMllvQUFrK1ZmMW5LRWtkMzduNHgwWTZTR0tBMVI1endROW01bzZq?=
 =?utf-8?B?MnQ0VXhtS2t1MGZhbGh6M1NpMlhnSGpRK00zcjBsODhQVFdDdjUyRVJya2M1?=
 =?utf-8?B?UUZuazZrNkIza0h2eExJNTJwQUNXYyt2Nlh0RFNUTElMSHNPcXllTzkwMUMx?=
 =?utf-8?B?QmVVUVoxU2RsOTB6cTNoYTN2L2cxMlhNazMrdHhjMHJBREF5eGRIcUh3QmNt?=
 =?utf-8?Q?Xe4PFueSML+17esLMNiDCg5lMaQffPHNLfZjHTC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6184ae2f-bd2a-4be9-516f-08d8d9b56c52
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 17:47:30.4656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kFd0a3jisbgwo33jBwNz3JdaOd8t28BuaPY7RH3Or1mLQR6EcSZEFQGImvcq39mA0C7q1BdSmRndNqd9f13YIbCbdv75VtJc3QVoLvH77Q4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3862
X-OriginatorOrg: citrix.com

On 25/02/2021 17:41, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
>
> Coverity will report unitialized values for every use of xs_state_*
> structures in the save part. This can be prevented by using the [0]
> rather than [] to define variable length array.
>
> Coverity-ID: 1472398
> Coverity-ID: 1472397
> Coverity-ID: 1472396
> Coverity-ID: 1472395
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>
> ---
>
> From my understanding, the tools and the hypervisor already rely on GNU
> extensions. So the change should be fine.
>
> If not, we can use the same approach as XEN_FLEX_ARRAY_DIM.

Linux has recently purged the use of [0] because it causes sizeof() to
do unsafe things.

Flexible array members is a C99 standard - are we sure that Coverity is
doing something wrong with them?

~Andrew

