Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A444F42F483
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 15:57:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210630.367568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbNiQ-0001CI-Tl; Fri, 15 Oct 2021 13:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210630.367568; Fri, 15 Oct 2021 13:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbNiQ-000194-QI; Fri, 15 Oct 2021 13:57:42 +0000
Received: by outflank-mailman (input) for mailman id 210630;
 Fri, 15 Oct 2021 13:57:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGCa=PD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mbNiP-00018y-7Z
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 13:57:41 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c862bb6-d042-4891-9f55-cff03af87784;
 Fri, 15 Oct 2021 13:57:40 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-fAk8bI9nNmOwYrMpzzQybA-1; Fri, 15 Oct 2021 15:57:38 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5901.eurprd04.prod.outlook.com (2603:10a6:803:e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 13:57:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 13:57:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR08CA0021.eurprd08.prod.outlook.com (2603:10a6:20b:b2::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Fri, 15 Oct 2021 13:57:35 +0000
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
X-Inumbo-ID: 4c862bb6-d042-4891-9f55-cff03af87784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634306259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9JWv/VNFc7LRjtRkF+Z3aoimnueAbl2VwHj/UtZSMVI=;
	b=IskJUlDRYesmd/jqVBvZkha+wfpymPvtcutyBDGhMi5ObIeFf1wEEk3cFXEm5CgPkKlgoi
	T7c2cfVkl62Sa3za0KetbHRlYN5Kar0YUR2dxLny8jVZcrwmyZFkrWfoTywS6HBRZhBKQ5
	JWioPIulQvgYfx0KKcsZHqQ2znhhCaM=
X-MC-Unique: fAk8bI9nNmOwYrMpzzQybA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFj8BU/k7IJOYMumema3iUbweeQfyvL14RVcoBFMVGAaA1HdcGuivQQwPA8ycxEZWuGeJWx8F8fzcV9EJKGTA63jeiLq5WXjboBCX1MRWcv8G81Ja+i6Sw9wXElw0n9VUSXG/iQSt1BqjKkGJwUnkDNfjOoGFdOVqJX5tJJUtKj1WJzqGoXa1dbHEYVVME2bhcbnDV5nYuTd/AdqIQIPly0uZhBDLAxdFZdvBPQhhcaIkuG0TndKOHLd+dl3qotLdPz47opmX9uL6tIKaNSnbpNQrqhERU+7puTT+yVmGoarHpwwiZBH8GBYxPidJdnoaEVUwsfsdeObOjAMXGRZtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9JWv/VNFc7LRjtRkF+Z3aoimnueAbl2VwHj/UtZSMVI=;
 b=RTma+yq0OZuDXI4bMNZ3WuZJRH/ZY5wv0ita8XGEGye+Z27vYF9efiQgAUkWZqC7cWZQnmzNLmcgtfHlf/2Y9eJ8C2d+8mdu1U+D/CxCqm94tb0lL69KsAtO3cGgwevrbaG+AU7nq3LJlS8AxBw1m5/hpxRsrIcchZy6rz2TOLDIF86Lm15l3xXXJ9WwsW4pmoJfSeEu5G4fID3BBUMxlvQylBriU/FSdgb2QbqbfiWLNOv43D+AA2uoA41nC9FCHbp+bcDxSLctBBAP/vZnKtfOecxSD51apWKrcbOy8v0yLvK3gV+YSw1haBGlTwNPF1g0h08ZFrxEElqHQcOfRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 08/12] x86/pv-shim: don't modify hypercall table
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-9-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <460a149d-8d54-679a-1af8-694d7ee1ac01@suse.com>
Date: Fri, 15 Oct 2021 15:57:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211015125152.25198-9-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0021.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b5c887b-cf2f-45be-dc2a-08d98fe3be45
X-MS-TrafficTypeDiagnostic: VI1PR04MB5901:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB59011D65CCAD56829F759DD7B3B99@VI1PR04MB5901.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VUNUXihkeA1udrS3t7W1Mme2rON5lNstmS1VyYt8+LuRdxNL60BUXGVUU3szIsvIIBf6hx+PdO8tp17RQkVlpWnMOXeKok75gM+22PvO8YDCQaw21KiBL0En8nZn9IclGG7fHofVOcWROnxBT8MRC4mI3aWDfZ1+FfQw2q7AyUXFFd7hGXX4+WVbUObYrEXkkNwCa6HNv3BhCsiFI6lcOARaiGiJxr/7hoEmFXEfUdZf3ifnFICNqLd+OvLIwHksM2vnKAE6grTnWOof0tWwiMw0V37PUKSuyXaRzQXWhoW8+pzdoQVt7pROe83yp8+75MVbn7PKvuYOXf0L+VYN8DptW97ryqGu/aN6tSK1MtdgIfFrE+Z7C/gU3vHo7EfI/4jh3lfogOYmqDMvMV2mVvKFF83wK1cJ/98S3OkhX4ar2p8kqHcVcUiVHjFdH/5EVoACz179k4yiVg5UiCAviEwwJI0+tx5OVmzLvtPgYMspLPeHql089FN2fDXajOpidzanhLT0Mr/YPf4ACttEU2l09iqlpmdrPZU6SlYWPKsqlACoI2U+tnlPliNX6HQbYrHa8V9fS9erm1riswmlFw68FUnKC4+EhW+rEJXh+XfbUYL1BhxKU+lhZQWQkQwRIcVl8rrdbW8DVxIVZYWK8x84CrrmbqiB+De65fjGdncntV0Kb6uFi2KOg16MZrEfn4Xfu30PG1VmrvilqMgkZm1ulzh22BKmz/bNLmi/FTAcCZPDazlfQJaop3UBmEKd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(31686004)(508600001)(8936002)(4326008)(86362001)(6636002)(6486002)(2616005)(956004)(2906002)(31696002)(54906003)(83380400001)(6862004)(53546011)(8676002)(186003)(66556008)(66946007)(36756003)(16576012)(316002)(66476007)(37006003)(5660300002)(38100700002)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wis5cE1uQVZSMTNnVnpaeklKZXhUMS9EeENzR0FUd0h2bkZSNDczcjQwbUlQ?=
 =?utf-8?B?d0JUSk4xS3dGUXY2R3BmOFBqR1lkVUx5NXVlMHR4eU1UV2dPRDRQVkFnakxq?=
 =?utf-8?B?UUtiYkFCZGJDcXRCY1docnVmWVNtV1B2VHdEdWE1RjkrZzNKUUlLa3Uvclp1?=
 =?utf-8?B?YVd2N2NSWHJtQmlQakxOM1JOc00vUEZVUThnUUtzYW90SHBUbURCdE54THBj?=
 =?utf-8?B?Y1FVNElWWXE1b1lIcGRCY3VIN3BBZTlDYzV4UUtXK0tiWWV2d3kyZkRwV1Fa?=
 =?utf-8?B?NzlhUzhnWU90YVErOFpmb2V4eGZSYkNxYmJWdEI3ZU96dTR0MEhqb0hYb0xt?=
 =?utf-8?B?eXlEeFkwd3pFdGhxVXdadlpKNWFMN1U2N1ZJMWJHeGRXVUtJdlh1N2RYMXVl?=
 =?utf-8?B?ME12Wi9GTVRINk5URWxLdDY4SXI0bFdxNlkreDg3aTQ4aFp1M0ExMi9ReS9S?=
 =?utf-8?B?VXRaWmY1ZS9GRDlEOWxJMGlQaTdxWDN1elRxYXRMKzBuYkRoWm16cm9YSlkz?=
 =?utf-8?B?V1NBYWp1ZnFIdHJ4SG5FUk44azJrcm5jVS96eS90eXh2QjdEaEJ1eUVCWTZ2?=
 =?utf-8?B?bldVZHR2ZU5wMXpFK0pJcXR6MVhiMFRMZHNZU1d6MTdKQzI3OFMxaFJhODQx?=
 =?utf-8?B?blBZZXkxMkFNdHdhMFV2M1k3ZzY4bk9OQ3ZsU09xK0Jwdkw5bWQzU05hTk44?=
 =?utf-8?B?SDRiQzBhRU1YbWZ0cXM2aElRdnNFNVJ4L2srdzlHY0NaUldib2pHdEQ0Rmxv?=
 =?utf-8?B?QUZkWHV1VFJXNXRWUXd2dWN1SENRbUFNRi9kTWZVcGpBMEkvbVU4OGkvQzI5?=
 =?utf-8?B?QmtGTktHQzBFL3NCTWJSMHZZYU5Fc0JmY3BLc3BZRVZHd01KQ1IwaGFRWW83?=
 =?utf-8?B?K0orQUl0WDlBa3Z6TW91c3U5WG81TmplYk16QTBXWEdyaENmSUo0WGx4Nk1M?=
 =?utf-8?B?NHFuUmxsTVNPNWZaK2lITVJnRk5pS3lubGQrZ25vZTNlNExwZXRMVElUazNw?=
 =?utf-8?B?OWROUCs1TWtqQlluUzM1MVlUOXcyc1ZnMHlDKzdWckIwdGlIMEhkbzdkWkhV?=
 =?utf-8?B?RGFmTzVPTjhjYjl2ZzkrelJuYVFqMlY2VnlQVWF2aTVic2R0b3cwWDVpV2Fa?=
 =?utf-8?B?dXpkOEZlYmVvOFVyMkRjS3BVeFRCOTVwV2sway9VbDMxOG1WaU4zYkFhc2k3?=
 =?utf-8?B?RzZGU0xnSmF2K2tGMTRoK1VMUTd5WEZhSFJaRGh3QWtuenFRUTVnN1NzNEFM?=
 =?utf-8?B?N0ZZcEVwMVM3M3M5bEpVQU9VQitIdmFLbzI2VnptQ3IxdFFPRUc4M3JtR2Ry?=
 =?utf-8?B?SUc0QW9LTFozWGFnNDV1aGRhNzZXUzFkMGFtOC95MFN1TFJXNUp4TEhoVW9L?=
 =?utf-8?B?VllkaHpVUW0wTlF2Qmp2d1ZoSXpEZ01udWNMcis3RXV5RWJWRXlLODBsYmlF?=
 =?utf-8?B?NmtKNTZEZEZ4SCs1akJuSU1zcTVEU2pXeWlyclc2alpzS2dQMVhZYjZ2L2Rs?=
 =?utf-8?B?UnFwNGtPbCtNRGlCek9FbFVvYStDR0tFK2V5UmVaK1MzOSthVFp1OTBvdjhz?=
 =?utf-8?B?VVFmb0l0MjlnUnAyQ2V2M3YrNHpYUjM1cENybFVhMEljNjVUWXViTjRmWkJ3?=
 =?utf-8?B?aUpVbHZvNllZNnkyYndZU08reHZwTUd4SlFUa25PQkJXeWJYZERiWmNUSHZP?=
 =?utf-8?B?aGwza2RGeisvbll3S1NNWmRzVEJLbkJvcnU1bzhpWkw4U1VhMElSb2xGZXBU?=
 =?utf-8?Q?GdOtjHVbCF7PfZet43BM2rlR1BHdUj3BbRa/MyE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b5c887b-cf2f-45be-dc2a-08d98fe3be45
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 13:57:36.3252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XcrLdDnIEO8cK+UTxeGdBd0zBfG0cqSJgfMeMhgH65Nu9ixn8KriVy6aj4sEXwtm+haKqD2KA7i1xOmR9iDGzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5901

On 15.10.2021 14:51, Juergen Gross wrote:
> When running as pv-shim the hypercall is modified today in order to
> replace the functions for __HYPERVISOR_event_channel_op and
> __HYPERVISOR_grant_table_op hypercalls.
> 
> Change this to call the related functions from the normal handlers
> instead when running as shim. The performance implications are not
> really relevant, as a normal production hypervisor will not be
> configured to support shim mode, so the related calls will be dropped
> due to optimization of the compiler.
> 
> Note that for the CONFIG_PV_SHIM_EXCLUSIVE case there is a dummy
> wrapper do_grant_table_op() needed, as in this case grant_table.c
> isn't being built.

While you say CONFIG_PV_SHIM_EXCLUSIVE here, ...

> @@ -845,6 +822,23 @@ static long pv_shim_grant_table_op(unsigned int cmd,
>      return rc;
>  }
>  
> +#ifndef CONFIG_GRANT_TABLE

... you don't actually enforce this here. I also don't see why it would
be needed in the "exclusive" case only. A binary usable both ways would
still need these, wouldn't it?

> +/* Thin wrapper(s) needed. */
> +long do_grant_table_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop,
> +                       unsigned int count)
> +{
> +    return pv_shim_grant_table_op(cmd, uop, count);
> +}
> +
> +#ifdef CONFIG_PV32
> +int compat_grant_table_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop,
> +                          unsigned int count)
> +{
> +    return pv_shim_grant_table_op(cmd, uop, count);
> +}
> +#endif
> +#endif

Don't you also need to adjust the respective #ifdef in
pv_hypercall_table[]? Otherwise I don't see how, at this point of the
series, the functions would actually get hooked up. In a bi-modal
binary further guarding will then be needed inside the wrappers, I
think. (While the table is going to go away, that guarding is going
to be needed even at the end of this series, I believe.)

Talking of wrappers - do you need actual code to be emitted for this?
Can't you simply put in place an alias each, which is permitted now
that pv_shim_grant_table_op() isn't static anymore? (Albeit that's
partly moot if guarding code gets added to the functions - in that
case only compat_grant_table_op() could become an alias of
do_grant_table_op().)

Jan


