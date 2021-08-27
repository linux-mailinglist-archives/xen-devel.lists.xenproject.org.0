Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE863F9AA0
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 16:07:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173694.316890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJcVu-0000X8-6J; Fri, 27 Aug 2021 14:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173694.316890; Fri, 27 Aug 2021 14:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJcVu-0000UQ-3D; Fri, 27 Aug 2021 14:07:22 +0000
Received: by outflank-mailman (input) for mailman id 173694;
 Fri, 27 Aug 2021 14:07:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVCk=NS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJcVs-0000UI-CB
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 14:07:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa1d86da-a67f-49f1-9b92-a3199d66a303;
 Fri, 27 Aug 2021 14:07:19 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-8-bDCar7AMPX6xUtyb5ZzdfQ-1;
 Fri, 27 Aug 2021 16:07:17 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7152.eurprd04.prod.outlook.com (2603:10a6:800:12b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Fri, 27 Aug
 2021 14:07:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 14:07:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0053.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Fri, 27 Aug 2021 14:07:14 +0000
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
X-Inumbo-ID: aa1d86da-a67f-49f1-9b92-a3199d66a303
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630073238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QRNaHIMLj8ZoZe6ks1SpqQzK8fJRd90l60WqfHxFnOc=;
	b=kWovJD1TXc7CVvsXsth1P22sVUE1AI1ej2GKVZNkLShVxwqKNv/IerIALTaSL2Ke8Ni+e6
	uU8H3JtJz0Xadj5b1ktRFmhlEz/3pKEH1svEi2vOLhmuApGfJ9PpPKgp4EyLaeUtF89C2S
	xYIiFUrEBBkVqRNQ1ogqZnqN1d9CuSg=
X-MC-Unique: bDCar7AMPX6xUtyb5ZzdfQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJM5tNEyE29Vrl9EPfQn7lSNnIDIBgyRU7Rh8UK8mTL0cJnj6r0UHR9i01GenwOoEIFonuuBaeJuWHr4yz5Nu5o3ETz+/GCZpf31iQMuMOexDVD5erk7jkNHmsSYONCKK9jRIYBZy38KrGd4srYYjdx5YZn9gMNnt1MuRLruNK/yXdxjtGezI7TjIJZMwqLOgyUg5Uv+LuYxxHuLsbMq6ZCD0NYXsu/zLor8qi6S2Gkw7F1yb2gbnSPRU+k7UIGWsgXGW6BI3okAH7kaA6WJ+gTvyz6kwBPnsX0ETUPqTFUlzpbYhxLj9wFREmUh2YQEFmTd5ue3VTAtWquoif5DQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRNaHIMLj8ZoZe6ks1SpqQzK8fJRd90l60WqfHxFnOc=;
 b=O+eUGHegQ8Y/l/2+LJKkzt1fEgW3+uRRowiEQHEbNvTi2syJiwhmAQyb3GuMck42VrXvn/rqmJE2hdOAL7SS5Lq9z6qH6gqF0kGpYH78V4KxwxKLSaVHEd/cYXRSsI00K1JCwSlHp2PwfPlTk8Ely5/IvOdFy4P6WqIX2iZw/9lNUykE6snFlZ2suWzO1wKxNkytI0R9NxARyIzPpu2BBJOLIiP5avKTS+f25FvLb1NQjGkFeUQy+H9up87ZHchVVRQwQzG0K5c4FVmRLz9dkDwfTZUHlqe/GA4YVrsIdXN7NZx+SXIg0b1eVRBCywFFmvII+11x+OGYv4QmpcjRhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] xen/domain: Fix label position in domain_teardown()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210827140108.6633-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <71fe27f0-7aec-03ec-1628-531c13f92357@suse.com>
Date: Fri, 27 Aug 2021 16:07:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210827140108.6633-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0053.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4166ddd3-bc71-4cb8-120a-08d96963f935
X-MS-TrafficTypeDiagnostic: VI1PR04MB7152:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71521E05769DBD5B2E54A790B3C89@VI1PR04MB7152.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xRtExfUkSAAffS7gd6eZEgO34FkugnkM5D2iBct9Nt9c8gm5XKVFmI/zc5vulTiaHhFKYWqjgjwUyP1KSxM0525fFNW3vyzhUxhColn7qM8GKNmFKtRKze1oVgUJKgz3wML1kIfC5eadnhfhRIZ+g0A//FY71WbHkzaOIqsjVW7ARcQlf3B/R4WK3YjQ5cFdbL03T/tJYa2wwtWEaBfVAfRAI90UXiJdTHwdevME6LVUmiQT84sW4eqiEvcBbaJNcFRT2hamT7y7y3lafPDPERUiVvhpkvF6n9OugxUv2KOaK0k9fsUG8JRECZzxJVlpqfWLRKmI+95dBo5/rEhF0CXHV2LW9OK8dDn3a5/rOrXPJ9rIHfVy+Rn7dfQhYL7XKr+ZDyLMPdMSuQa7uT4OqQKky0ZbID7JI7wbYTQsU39U0QDbZt72nZyGdz0JjoekjhOo5eSzrfCpTVwkwtS3ekHUPj7N651ML57iq8+rrFwh2TDqkGLBy/Adaq5O3NMWBno5eicOhcr022T2PAVw45ePupt1G0x34XBEo2U9X+Rq3NZTtc0pmxS5iiOCEh8m64GxZS9OqYmrKlvbfQNDhJYsXFwEZNqS0NOGz6ETe59z6+O23LXGvFWujIdAibn9L8qSRKfRZgHOKQpetdJzxBlqBPvhFGJIW56uzI8tjr0vk9VuHNaVixyplgvCiVbESTjjIe4B651JtN90USeEfnKuAbaOMh4khLlzcck1810=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(396003)(366004)(346002)(376002)(4326008)(6486002)(26005)(8936002)(5660300002)(31686004)(86362001)(2616005)(956004)(31696002)(54906003)(8676002)(2906002)(6916009)(38100700002)(53546011)(66476007)(66946007)(66556008)(16576012)(186003)(316002)(36756003)(83380400001)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0JlSEYwWE9uQWt3ZmY2eXZSK1ZpTWJqSzdXQUNmSGMrazJLbnZod2tOK3BY?=
 =?utf-8?B?cUtMc3dKSXV4NWtibElxemNkZXNXcHh3dFhQbTFZUkFMSVdySklxTGVuYmFI?=
 =?utf-8?B?ZUdmeDMrd2g5bnpZSXR5QzdhYmQxNWFLZ2Fic0Fybk95czhkNkZRcWtqUGtJ?=
 =?utf-8?B?RVRZTW4zWmV0Q1E3TVhWbzVjQ0JKaVAxZDRWWk44aXM5ck1nOGFqSndodDc3?=
 =?utf-8?B?a1F5WnRiNTFGbTE1TGJjeDQ1eW8xOTJ4SEI5bmtSQkJjdGpXOUQwMGVwbkFp?=
 =?utf-8?B?S3J1K28yNkFWODRobEZlYW4rK0JQamJub1pFRlVLcmFrVkNaV1BjQ0R4c2Np?=
 =?utf-8?B?RUpENHRiZ0pUZVRLaVZxZWUxUXVDdGFPT3lEaytiZTVTVUc4WVhYRFN1eDlu?=
 =?utf-8?B?K2JqUmVvbFRRUUZBcHZUZmtMWnBXdmc2QjdFQ2lsNVFKU1RvTnp3VFdXVlh0?=
 =?utf-8?B?MmtzTVJ3K1JJcXhLaW53VE56ZDhHdFNRMzBEWTVMdEVqM21zQlJNaHJmcGxN?=
 =?utf-8?B?VzRkQ3d4eHRVbDZucFhQMVFhQjR0UmtQUEJyVXdKOFNEczdoSURtWVNaL2JN?=
 =?utf-8?B?cm5BK1BQUThEUEhjR0s0MnVocnNiVTJRRFk5RVplYjlOekhTY3hreFdXOEFt?=
 =?utf-8?B?ZnpodERySFU0RW1nb2ZQZGJ1NGJpS2xhK0tMci9ia2gxcVN3L0VPUzMxdjRv?=
 =?utf-8?B?Z3dFZXRIVFNlckdrZmdjcGp3SGlySWF4UFNZRXJNcUw1bnNGNlR0eGRlU1FS?=
 =?utf-8?B?UUdWZHgwakdZWEkwMTVqSHkrZnQ0b0x2dUliSTA1blY2dkJsdEhoOVdJMnAr?=
 =?utf-8?B?aGhPSmdRbHJ0bWJHNzN0aFF3OFlHMTFHR2VYNTQzdElyY0NGemFJdCtwOXc3?=
 =?utf-8?B?WThsNXdCVENOT1Jvc0hJWXhPQkJsT2cyTkVVb3RpZjlvS3c4UGFmSDdFNERF?=
 =?utf-8?B?OFpTeGNSQndwSUlkQ283aW5Kb3ZjVkgzaG1kdTNST2N1UXo2LzcxMGxSVzdm?=
 =?utf-8?B?MlpJbEJGb3lid0FiL0FnQzJNYmpHOGRXN0pqTUhOZ0ROMGZaNlg0Z3JkSnJY?=
 =?utf-8?B?UmlaRnVHRDFpRnlwU0VyZmhxNmFnMTBjY0xCM1dVc0tBdEdlMVgvWjJLdjZS?=
 =?utf-8?B?Y2l6NXF2NllJWUlxTitzY2owcWRZT2lIcmNmeXVyL0FENWxzVUdQcnBCc3ZM?=
 =?utf-8?B?TFppNGRVNDk0bGQ2KzIrcVBhTlJyUWx4MGorSEhUU1YzQXNIQk1vRHNHMlpr?=
 =?utf-8?B?NnQ1aWU1Z1dmTTd1bTRRK2JFL3hsRit0bTM1VEphaytpd3c3UHNsUCtRditL?=
 =?utf-8?B?WjNSWXdBLzB3ZXVIaTNDRUs2eFlGbDIzL3k1Q3NnbDRYTzg3b0ozU0NRNDBQ?=
 =?utf-8?B?bkRuT0xHMllIQ1JOUXdQVGZaYjRlN2JNdlFxVFFJbERpWVB3TkVhR1JtOFBK?=
 =?utf-8?B?bk5wM1J4SGFneEZqRmdDd2ZYYlFXY2ZmR1FHUHJxa2xtUllSR0ZYUjFVYnk0?=
 =?utf-8?B?TWZkZlFBMkRaTVlBbTBUYXhPQnd0ZEd6T2dRMHlmRmRvbHQvYmE0MjduMzF0?=
 =?utf-8?B?d1lVWWl6Z0p3TSszQ2hjMHRQTjRlSTZtc0Z0R3dLbFRJR2FFbDlVbXZaQjQ2?=
 =?utf-8?B?Q3E2WmNWVGs2eDB2bXJwcFpLT3p2ZEJGNkZhamY4SlQxTHE0aHJqTnpUazVH?=
 =?utf-8?B?SzgvckVmcTVUN1JsZUFETXZwUC93dG9rTHJkVHFxeUQyZ0hkSmVyeXBwTC81?=
 =?utf-8?Q?jRGQPOT8tREyDGFU4oDkSfVkGiu84KUgQMa3M0y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4166ddd3-bc71-4cb8-120a-08d96963f935
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 14:07:15.4318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BrPQI25jg0ztR6GN1rNsGIukxRtDqWuVJtMWAbIHqCk/Byi9gTVzkC0WoZQCCDngNfj+9yPoK6t9vHo7z/gaVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7152

On 27.08.2021 16:01, Andrew Cooper wrote:
> As explained in the comments, a progress label wants to be before the function
> it refers to for the higher level logic to make sense.  As it happens, the
> effects are benign because gnttab_mappings is immediately adjacent to teardown
> in terms of co-routine exit points.
> 
> There is and will always be a corner case with 0.  Help alleviate this
> visually (at least slightly) with a BUILD_BUG_ON() to ensure the property
> which makes this function do anything useful.
> 
> There is also a visual corner case when changing from PROGRESS() to
> PROGRESS_VCPU().  The important detail is to check that there is a "return
> rc;" logically between each PROGRESS*() marker.
> 
> Fixes: b1ee10be5625 ("gnttab: add preemption check to gnttab_release_mappings()")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Despite the Fixes: tag I don't really view this as requiring backport.
Then again it would need to go to 4.15 only. Will need to make up my
mind ...

Jan


