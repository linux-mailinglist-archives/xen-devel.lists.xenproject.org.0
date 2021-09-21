Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A17A9412EDA
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 08:53:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191356.341341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSZf0-0005hd-2N; Tue, 21 Sep 2021 06:53:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191356.341341; Tue, 21 Sep 2021 06:53:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSZez-0005fq-VW; Tue, 21 Sep 2021 06:53:45 +0000
Received: by outflank-mailman (input) for mailman id 191356;
 Tue, 21 Sep 2021 06:53:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSZez-0005fk-1V
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 06:53:45 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21f6dc82-c8c4-470b-9211-9a9f8bc8d78e;
 Tue, 21 Sep 2021 06:53:43 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-j-aCz5gbPMin6jJ5jpCQxQ-1; Tue, 21 Sep 2021 08:53:41 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4382.eurprd04.prod.outlook.com (2603:10a6:803:73::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Tue, 21 Sep
 2021 06:53:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 06:53:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR03CA0054.eurprd03.prod.outlook.com (2603:10a6:208::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Tue, 21 Sep 2021 06:53:32 +0000
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
X-Inumbo-ID: 21f6dc82-c8c4-470b-9211-9a9f8bc8d78e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632207222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7MgjA5UzoOR0QDM+7H7U3AOR8SIUwnhsa3GT0qjNqTE=;
	b=nX5zWrtGsM9DgteF18WTVHVIpahjfl8Bc0y0E0MSDWvmlPgvkG0bsopwahaiODxIT/nB+e
	HBErHCGP5XKFi1kV71QmGy7mNMl5JatzSe5WAHo8PfmhCrXqfVlwSbRagfaGwyws6XmJYu
	v8IbJBwnySlH9JXN1Itd+C3HsKFksbw=
X-MC-Unique: j-aCz5gbPMin6jJ5jpCQxQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+sRSHJ7XAXKX0RKVwFbn48vpUJWfSWU60naevsLQ9/2iqpXsJZj+qdfSYLfixI4D7IxV/Uc66wb09ITkJdoc2RanaWBToSPM81QhEZHgRq1YWJSNGWG0iIEe22NdcH/MTPOk94BqvsPjD+65PsthU8+mUZTeX9OsbyBQ0rPw71nRRFf99TGoe0E0b/hKnU4O9B8BJ27u5UHzMP4ck0QcJ3/9gs9CO7VNVIxYIvYDWphoOUzKA3e7FwM5boloW7rixsdSSnXjlqckX6pZXM6moNDl1YaDZjWQMIV1/5pEqn3WaCDDrjVXE0BFBr9Y7C2Tjk3yt1279utk6fJTj4D6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=7MgjA5UzoOR0QDM+7H7U3AOR8SIUwnhsa3GT0qjNqTE=;
 b=Ytlczr6htR/YNk/n2aiA4utI1X0vCff+/yJeinDQQTmqpf7m2g/57XfcccTtoqNX26bL30rFfJLBru7DsKFOpdHnJnVT6S8rFfyvUcvb6T8X1hLut39xRFO83olZk5Qc9gUK1L0JtDOPJQ7LgihomjHU5xGuAOQlZO8odiD2Evc6Khah0EE9sqrjaJqqgWbAB5kChnkjERhy85zyzIdzO+XDNsKrTj3E8hFOAswOiGqXzkGIe6W9x8OdHYW7npK1LtG505HrEG3rgbR1Odk8zv7P6bVNoO7rr5hjUY7kDUPfFj4fL7y0k2KNEZWx+3CTZLn3AHZWZzRPgkKeVpt7bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 01/12] xen/trace: Don't over-read trace objects
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
 <20210920172529.24932-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <731e3474-77bc-b11b-41ca-5dff57831264@suse.com>
Date: Tue, 21 Sep 2021 08:53:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210920172529.24932-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0054.eurprd03.prod.outlook.com (2603:10a6:208::31)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79151cab-6602-4140-a7ce-08d97ccc8711
X-MS-TrafficTypeDiagnostic: VI1PR04MB4382:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB438254BB0A59019BF8EA5AB1B3A19@VI1PR04MB4382.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9WowQux0IPWRIjuhP2VXXkRIWnfPq0GC8pE6/lZAJG1tMUH8UiXQQb5bIGbtu7EJdMtLzftmM44W1cQPgtC4twwqCPYW8jZ1nRWohp5cvEHKbglztVrTq4ypCHtClSAexucJZZ+AhC3mpNRYS13wc7twyncFpbRlHWTe104mAqU8hRRvf47HBCpnN5m8FFVcdpr7jdFc7YaL+3DuGOou3V0xwk2+zA4xh9laoPqoitjLwnlHkhAaN+7trd1A4UBRSplRmGhnKr3yX7XerZDWaWdQUePbDIfrPfbTSUjKhpFwQkyDN2cTVKcPukkRr6jtjpFA8T9u3rY8Jztf95Mut6fw+1AeUoSecTPJoVUw5hCdxUSSQMXvrnV12/EFvUzw+VoAP/dNVwHRylRSQ0KNAv07OvjlOx4ouQVUIbt1sfJdFDu/xjTUGpHfGam3e2Jp15ato2SJl1Nmv5bwE5mIql3l7XV/aNcBvR9FneTFoKGz+dJiOPaUv8dZBIoPE47RLjkOP+Z7A+ZdBraiXgtkKTodRCsBPIGU2rM3Om39Qszn+gSB8sMNyRJrThps1CZnR6ifX8MuzBs0dvBgwZfDdHCHU392PHO/qXSKKkXBjzapBbogRSnEbluUhPbgGT60Ju8izNomxR6KvUFrGhLLjYuRXqu8RCeLAVYRe8u8Aq6cOEQdCP4Z3kbNM7dS3lQ6Fsu9+99hR+aHF1UuxaUTzzB/57w9muulLPpnbU19R+k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(54906003)(6916009)(31686004)(31696002)(86362001)(956004)(6486002)(2616005)(186003)(5660300002)(66476007)(66556008)(8936002)(4326008)(2906002)(38100700002)(36756003)(26005)(83380400001)(66946007)(316002)(508600001)(8676002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2kyVnVrTEhwZXJiajhJSHBSS3BHeTlOaHlsVWdyb1hUN3VXeXBLTkY3d3RN?=
 =?utf-8?B?b1ovU2hKekxZYTZid1lMNDJEd2RNWWFseEF3a0Y0R29zZzVHTkpUclJhSVNs?=
 =?utf-8?B?MGdTcVpqeW5hU0RhYTJ4bWhtNFNOaVQ5NmJPOVNJWFNjZ1ltby8xbDlVNUwr?=
 =?utf-8?B?TmpVRkl2ZGZsem44QTN0enFvVWVwdXMydnR6bzh4Nmk4RHFjakxIZmQwMVNJ?=
 =?utf-8?B?cHY1N1JrTkpvN1JyVXdWdFZLUmZCWllyU1VRdWNUWm1rWjM5Z2hsd1JkdUxj?=
 =?utf-8?B?aFBHVmdWdmljMkdMMGYzS1lNUHk0RXRFOUY0U3BVaFgvbUdheWY0VE5qL2Fo?=
 =?utf-8?B?Y1FoczNVSTI5dXFoam85dDdocFViSTlHU1RKbDVzcC9lZnl0T29ESkdLdWJB?=
 =?utf-8?B?dEcvMkwrK3ozVDY4c1hQM2FERS9kQWFRVWZGRGJzeXZJdW1OUisyRGZ4UGRF?=
 =?utf-8?B?YW9UZ2NSRFhvSVU1cXEvZlFnRXN4UDNZbURzdFg5dkNWMWZMN0d5QVA3R3pG?=
 =?utf-8?B?M21aVVR4V25FSVEyYkNEMnhpZFFrb055WEY3eXlMZG5LMVFqSzdVSXJYdGVS?=
 =?utf-8?B?UVRoMUt0ZjRiNTBLOUFUaTg5aDNITEJaSGZHY2tjQXJXU1NzclFyWEpEMjYz?=
 =?utf-8?B?Y0NBWGpZU3lnakw0NXFIYUh5eEZWV3hZK2V1REwxMzZxNGhuRkFwQjZFSitW?=
 =?utf-8?B?eUFsVkVjSkRBVVVhNVQ0KzNPY0t3VnNCckcwOFpZaXgvSjU4M1NnSTN0SmxS?=
 =?utf-8?B?UVlUeSt0K0hmMjNIa0JRRnR3ZWpnbUVianVtd0xPMEI1M2JHb1FEZWV2bXh6?=
 =?utf-8?B?T2hjMzk0OFE1TDVxV2JocDFoQ2RETUFERWdva0hNdWlpQU1rU2tBTk9DdkFE?=
 =?utf-8?B?MHcvVCtMa0dMZE9yRDdZMkFhVmd6c0VRRlFmZXlNbDhDUmZKU0FmamFndm1z?=
 =?utf-8?B?ZE04OFd0VXhZVGZyTXJWeVJHNm5kY2hpb3MvQ0kvM2lUTjRrMHFVUzI5cEcw?=
 =?utf-8?B?Ky84bmgzQ2lpSGFWK015MGErV0xnOGxzQkZCU21aVUJsQVRKVUNOZWZlWjRN?=
 =?utf-8?B?Lzl0dW9hakZMODVoclNYalFkOVJ1bGxkY0hMYVdlVjRlQWlKekRFQko2YTc5?=
 =?utf-8?B?S3Rsc3NpRkZWcm5rL3FJZFVJOFBxbW03YklPWjdJVUIzNmZzVVNad29pRGJH?=
 =?utf-8?B?RGZKZlV4eEtCR083VzZlVkxsc081NmN3cUREc0gwN0FQcjgwTUYzRzhJSEU4?=
 =?utf-8?B?WE1WM0Y4SEhvK21XTUhMeWlMaHZCTzY0Z3FKWS9mZVF5aFdEUUYzMGREa1M3?=
 =?utf-8?B?OWFoWlRHT0NlWW9QRUJZeHZla1A0NGp0OW9tcnZ1UWVJcTNCbEhqWXAyeG1R?=
 =?utf-8?B?bWsyWlNJbjVOZkRYZVB2UVZka1hoeHRvZUIxYm4xang5SXpYcm5STGNUYjl2?=
 =?utf-8?B?Vkx0RGlQUm5mc1M5c0lKOFNwd215TW1WUEJJSy9jUFlpUS9xMDEyMFl0UWhH?=
 =?utf-8?B?M2ZEVGErZjdMblNJL0FxSHpVeWU4Mi8rS3ZaZTRDeVZjRGczODlaQlRoclFH?=
 =?utf-8?B?ZFpZQUFBR1l4N2JIRHpnWStMbUN5dndZcllMbi9SKzRlL1lnd0U3RkdaejZj?=
 =?utf-8?B?OWt1Q1laR29wY0x6MnRhOVFWSm1rdHAvSVpJL0kvN2pBbGlsaEVwS0VYQTB5?=
 =?utf-8?B?ejFDNlluT3VTVHJ6b1AzOC9BbTRNVXphTC9YQ2djN2l2LzZuaUNBbDNwc1li?=
 =?utf-8?Q?U6s8V8u9jq6aLInno6fVZWaefq4HSbb3ZylI09W?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79151cab-6602-4140-a7ce-08d97ccc8711
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 06:53:33.2268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x5WL9KKSGnwonJ577G6yE7cpj+l2eqPiYbmVZeQNXMr8Ij7uGrErJntK/bR7zUIlTgoV7KjN/MXtWOWgHwykYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4382

On 20.09.2021 19:25, Andrew Cooper wrote:
> In the case that 'extra' isn't a multiple of uint32_t, the calculation rounds
> the number of bytes up, causing later logic to read unrelated bytes beyond the
> end of the object.
> 
> Also, asserting that the object is within TRACE_EXTRA_MAX, but truncating it
> in release builds is rude.  Instead, reject any out-of-spec records, leaving
> enough of a message to identify the faulty caller.
> 
> There is one buggy race record, TRC_RTDS_BUDGET_BURN.  As it must remain

Nit: I guess s/race/trace/ ?

> __packed (as cur_budget is misaligned), change bool has_extratime to uint32_t
> to compensate.
> 
> The new printk() can also be hit by HVMOP_xentrace, although no over-read is
> possible.  This has no business being a hypercall in the first place, as it
> can't be used outside of custom local debugging, so extend the uint32_t
> requirement to HVMOP_xentrace too.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Two remarks (plus further not directly related ones), nevertheless:

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -5063,8 +5063,9 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
>          if ( copy_from_guest(&tr, arg, 1 ) )
>              return -EFAULT;
>  
> -        if ( tr.extra_bytes > sizeof(tr.extra)
> -             || (tr.event & ~((1u<<TRC_SUBCLS_SHIFT)-1)) )
> +        if ( tr.extra_bytes % sizeof(uint32_t) ||
> +             tr.extra_bytes > sizeof(tr.extra) ||
> +             tr.event >> TRC_SUBCLS_SHIFT )
>              return -EINVAL;

Despite this being a function that supposedly no-one is to really
use, you're breaking the interface here when really there would be a
way to be backwards compatible: Instead of failing, pad the data to
a 32-bit boundary. As the interface struct is large enough, this
would look to be as simple as a memset() plus aligning extra_bytes
upwards. Otherwise the deliberate breaking of potential existing
callers wants making explicit in the respective paragraph of the
description.

As an aside I think at the very least the case block wants enclosing
in "#ifdef CONFIG_TRACEBUFFER", such that builds without the support
would indicate so to callers (albeit that indication would then be
accompanied by a bogus log message in debug builds).

Seeing the adjacent HVMOP_get_time I also wonder who the intended
users of that one are.

> --- a/xen/common/sched/rt.c
> +++ b/xen/common/sched/rt.c
> @@ -968,18 +968,20 @@ burn_budget(const struct scheduler *ops, struct rt_unit *svc, s_time_t now)
>      /* TRACE */
>      {
>          struct __packed {
> -            unsigned unit:16, dom:16;
> +            uint16_t unit, dom;
>              uint64_t cur_budget;
> -            int delta;
> -            unsigned priority_level;
> -            bool has_extratime;
> -        } d;
> -        d.dom = svc->unit->domain->domain_id;
> -        d.unit = svc->unit->unit_id;
> -        d.cur_budget = (uint64_t) svc->cur_budget;
> -        d.delta = delta;
> -        d.priority_level = svc->priority_level;
> -        d.has_extratime = svc->flags & RTDS_extratime;
> +            uint32_t delta;

The original field was plain int, and aiui for a valid reason. I
don't see why you couldn't use int32_t here.

Feel free to retain the R-b if you decide to make the two suggested
changes which are directly related to your change here.

Jan


