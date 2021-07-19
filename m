Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5EA3CD0D6
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jul 2021 11:31:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158255.291451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5Pc5-00077z-7B; Mon, 19 Jul 2021 09:31:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158255.291451; Mon, 19 Jul 2021 09:31:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5Pc5-00074W-3k; Mon, 19 Jul 2021 09:31:01 +0000
Received: by outflank-mailman (input) for mailman id 158255;
 Mon, 19 Jul 2021 09:31:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTRW=ML=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m5Pc3-00074Q-Ui
 for xen-devel@lists.xenproject.org; Mon, 19 Jul 2021 09:30:59 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0634365e-e874-11eb-8af5-12813bfff9fa;
 Mon, 19 Jul 2021 09:30:59 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-yJMkv-vLPFGsuI4Cvo8vjA-1; Mon, 19 Jul 2021 11:30:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5469.eurprd04.prod.outlook.com (2603:10a6:803:cf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Mon, 19 Jul
 2021 09:30:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 09:30:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0052.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.8 via Frontend Transport; Mon, 19 Jul 2021 09:30:54 +0000
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
X-Inumbo-ID: 0634365e-e874-11eb-8af5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626687058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lP3PAa9ImJi4V7NcEa9ZEhbjp/V50ejF5y5yP63kPJM=;
	b=TlWRu37bldpm/iEbAe2D88MbUZO+meLBPr7UN+yNfnN3EFS5DRcGt7C02IUyyGkq0kTdSj
	9k+Yen0FdoVoGgyabnjZtTBkQzFN/gPz1gtiN/uUtya8B6LK9797DviApWPD53F4ik5v7t
	kKuC37Qe+SkhaX5icL/Yh+blgTMgQqo=
X-MC-Unique: yJMkv-vLPFGsuI4Cvo8vjA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFjQ89eApk4l/1dVxqNdEaVrpuzyJehiRR0MJnDcnRE9cmDF7dzAN+CKDSVKsZAvbGMC7f81LODTSDf4dZ1qO+L3/0KLc1F6r//S/5ENHSOtHRV02J57XKg3RzUJDZwSwTS39EfDtfGoGeIQkbtbrJmqj2op9h4y/xFwh+XxNAcAeGr0TqzXuZmMOHdHJ9h+wdBK56qps+4+jGCQabJ9H5Kj4d7TXQGVCD1X1RrOV5r2OOqvRF0GVBHNJvXITPQr7Zd7w9vV4nvTdagdF/hRPImPjg1vVsuSBWrqND7s9HuTEIxO3y0myyvYtPk6dwFirMErgKI/yyK3lzC85g9G7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lP3PAa9ImJi4V7NcEa9ZEhbjp/V50ejF5y5yP63kPJM=;
 b=De/4q1CXpCNBG7ADh6TuLl0W685INxTNR9eSzaBZ2RHDy+D3IUpr+RrbxoPnkTLijrCc4sc/ApzywEM7yYppO8OqRXawJQgdEtW6ODGtTZhBjA8T/qyXnine6fMAt2O4XtKhWHRtAMkC/0YhLOUwBd8GfIbRs6Y0bvjODy7Jj/IAz3o9qD5nyXxf2M9kJ8lzpJVHjEc9q5LD6QPI4kIFqUORQJllaN0yhStMGwqLZrzsL/IPPYpvL811NKveSsaqZJ1Y0aBJP/k3cucjhuCn7i4glDMm8GMdE2+T6ZJXBLanLybgGHl4ruG3lovnyqFz0Yt8XkQBpcsOyWdlODBjkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/AMD: adjust SYSCFG, TOM, etc exposure to deal with
 running nested
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cd23fd18-66f9-55c7-4a1c-a50d66628d69@suse.com>
 <d8913811-2e90-255b-98c6-44e262e113d3@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7786c4b6-15db-e026-45ee-01f851691cd6@suse.com>
Date: Mon, 19 Jul 2021 11:30:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <d8913811-2e90-255b-98c6-44e262e113d3@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67a79533-1d79-4e61-079e-08d94a97e85d
X-MS-TrafficTypeDiagnostic: VI1PR04MB5469:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5469D773460816F0DC9FE00FB3E19@VI1PR04MB5469.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GJ5f4lgAgSYRLkXJMuLiICbHcrLpKa4NiZlYNV0WVEHvbOO3Tk+SB8b5eQnyRwvOlEq//9Xq7ZNAomT0LGbVftPaGNpnge9BdOX1D8iWSqaFGQLhEnTKrI4PWq/1jHe/7CI1UNpSLuAhwTH+n0yXs6akxuZ+3vIL+4/SV7WHpvnbwWbtIp9yh29HtXthTdZCpGWRLFNdLwbJC5y7uZ08wjWTJfo0k2BLAPhl1cfAF2NQR2G9jqniC7ojjPumuEoFaN3JkpGDkAQ+TB8gRv+Yfl6HSAn0+ON7WMe6h0y6u2FmWLZ6lyo1h9VnCppbRxRyaXK/EcxzHyM1GLr0E1jS+dukV46JIhwe5p/OLU0qyuALDhObGXZXAxokAb9vJgUVb0HaJ+/ZYfz/l9TP57Nso/M+MAAnrCsX2rh3RF0UhlVlc8kezJ+LIsAfn3XirZ3JI4w/NARqyd1E7LsdZTcbtGa7jdEg/YpqURzwaHt7dhgKIiaMPLQVhzVT0L1vIERxvoZc9ka8HqmP74/iRJ4Eae9bjMasQd+lPOjva/+y6BdtcYMnEU9QZsWS+r3NGSRDyW+TYDrsj2bmefCF9rEACTJs81lrBeb6T7JvWArk3DdbFR9BAfZMYCfVZ2EnvEet4wg13G7lwa5d7SjTdIDb7EcDVdM9vOKnqNlaMyBL3wXvohnTvceA0Ar9gfnmr+nNIln0NTfBACLTpxczaKTtCjokrYMhW5PVfBm+scBVewk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(376002)(39850400004)(396003)(186003)(83380400001)(53546011)(5660300002)(26005)(86362001)(6916009)(16576012)(8676002)(31686004)(38100700002)(66946007)(316002)(31696002)(2616005)(956004)(54906003)(66476007)(66556008)(6486002)(4326008)(36756003)(478600001)(2906002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anRYKzd1Zlp4NnhMOWIvUEF5eVIrVmdpbjd3cHFqQjVJcGk2RldYT2pnUTVG?=
 =?utf-8?B?eWZ6SnhUY0MrQjZYbDRIV2h1VjBXNkZ4ajZZTGxoTUlBQmlqMDU3dnNEWVUw?=
 =?utf-8?B?bkxhVXptbjVLVnV5V3ZVckk2dlJpdnprL2NSUk9yOHdObXRDcnNxUXA5SDZP?=
 =?utf-8?B?aHgyamNTVjN0Z25EdGhwZitOVGlJUGpWNDIvODhPRUNwOFhyemEwTGFhMkxq?=
 =?utf-8?B?a0t1ZUR1VENnaTRDRXR2SDdYTDhzbURTQ1BKbWo0R0hublUrWmtyM1lKZ2d0?=
 =?utf-8?B?VkU5a1FObS9WWDh0VmkxRWNHUUZPejFJcjNjd01tTU93MUdmVTlJSjc1Zkkx?=
 =?utf-8?B?T0tzNzd5cXlxRUNOenBaYjYydlIvVlNrYVIzTTB2YzlCYnBWbmpqZjZBV1A0?=
 =?utf-8?B?dDJ6Uzlka290eVRpWDNRRmxZTktkOWhMd3daVVhzV2grMWtwdmlRR1k2SVZn?=
 =?utf-8?B?a0tBbWJIdG9RanFtcm9VQ0MyMi9wc0RhMk1vUDBqaDFlaktkdmFocEY2cEpQ?=
 =?utf-8?B?WEtULzlrYVpyZHdVdXVoQXBSb1Avem4rTGcwbWV6ZThhTmo0ZW1VS3d0V0tH?=
 =?utf-8?B?VG5RMm1xc3pDR0tFdStWVi9YNlFnT0oyVmdvK1IzajF5ckZXN2M4KzNOQUdq?=
 =?utf-8?B?c2xsYVoza1F4d3ZHbThIa0FsU3htT1hnVUVtK0YyOG1IUTQxZUpmMVVRcjUy?=
 =?utf-8?B?ajZSL1dzelZnd2loSkN2Q2JGWXVUZzZGc2pUdlp4MUlXd0NOYzZUaEl4aTZK?=
 =?utf-8?B?MFhuT3Q3L3ExQzF4ZDREaGtRbXpocVdnU2NjWDlIRFhVSFkvZXhHT2pkTGlm?=
 =?utf-8?B?dVI3REpiZ3JwM3ZsMUFLVnlZeUk3TU52OUNhb0trbXZYbTIxZnZqbElUU0Jh?=
 =?utf-8?B?a21zSzJtVkFDRmR0RFJNY2F2UUE0bnFWM0dHVGIveUdwa3hFSmJUWWpJZFJE?=
 =?utf-8?B?WktRMWs4U1FxRnQ5bFZSeFZqL01SS3JnTWw1a3R4K1hKNHNTT2J0V0p2ZzZY?=
 =?utf-8?B?VlExVFNoelhJdXFoS3pvbXp4cWwwMnR3Z1p5ZXJ6T1NyS3NGY1g3ZmtwZWZ1?=
 =?utf-8?B?aUMzVXNKdlRXVHlCaXM2QndLNzZ4R3RRVkpYWFRFenF3YzdHVXlNMEt6Y080?=
 =?utf-8?B?cXhTV2tWNVhTYTJ5c2Z0NmwrSWZkMmJUcGtzRHJ0citVYTFobU5yQUVYY09S?=
 =?utf-8?B?c2FCVnZiaGpENy9oUk9NUW95OVdzY3ZhVjVkQzExTm9CQ3dRamR5NFJGUjZ4?=
 =?utf-8?B?Q0xaZWhMK1l1ZTlTR1V2TnhQOFBybldtbFRNNm5URFdHT1lLVXRiYjgrbUJj?=
 =?utf-8?B?L2t1dXdFQW01R3I3VHoyVitRb1dUN0ZjNlNNeDdyVVorQStkeDNqUE5DN2NY?=
 =?utf-8?B?M0htckhwcEtkQ3FoTjNjeTR1d0ZpS2trYWdKMVlabTBsSzhKYVFIOUtManY1?=
 =?utf-8?B?Z2grTGRuWGdMK3lXNHdydDhubnZ1RlNaZHAzbjR5Q2hJbEJRQm5ESS92cnRI?=
 =?utf-8?B?OSt6aTBKV1lMWkZDaUFtdnBleW1VTndBZ1J4YVQwWmkyZVVmZjhtclFSckhl?=
 =?utf-8?B?Q01uTmg4ZUh6M2FxeFVHZnI1T0VqVDRjWUx3dDVqeDc3aXUyRHQxTUxNemtN?=
 =?utf-8?B?cVl0Y1VHa2Jra0lnV1dCVk5YUEYvVVEvMk9HV0d5VWFvc3FKRTJaSkdvRThF?=
 =?utf-8?B?dmlGNWhDcFdYcVdab2Q0NjN6QllWSFk2eHBveWdhTU4wME8wUDVvVmRZVXRJ?=
 =?utf-8?Q?jRASqRstOMRyIPkvaupY2BFyKGLCZ7bob3/g1Qr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a79533-1d79-4e61-079e-08d94a97e85d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 09:30:54.9503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Syk5adQD6oyzYN0F9IzzCZ2Cr5CC0zkCJip5W550pQKkCnqkflLxpvvZu8RGDlN9VgwmpLaFEgZjFyBKgxscng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5469

On 19.07.2021 11:18, Julien Grall wrote:
> On 13/07/2021 08:22, Jan Beulich wrote:
>> In the original change I neglected to consider the case of us running as
>> L1 under another Xen. In this case we're not Dom0, so the underlying Xen
>> wouldn't permit us access to these MSRs. As an immediate workaround use
>> rdmsr_safe(); I don't view this as the final solution though, as the
>> original problem the earlier change tried to address also applies when
>> running nested. Yet it is then unclear to me how to properly address the
>> issue: We shouldn't generally expose the MSR values, but handing back
>> zero (or effectively any other static value) doesn't look appropriate
>> either.
> 
> IIUC, the unsolved problem is a Linux 3.12 dom0 running on top of the L1 
> Xen. The kernel is quite old (and looks to be unsupported), so are we 
> expecting anyone to build a new stack with a newer Xen and such dom0?
> 
> If the answer is unlikely, then I think it would be fair to keep the 
> limitation until someone comes up with such setup.

I might want to put it differently: If you want to run nested, you
shouldn't be using this old a kernel for your Dom0. You saying "looks
to be unsupported" is, aiui, a statement from upstream perspective,
which distros may have a different view on.

>> Fixes: bfcdaae9c210 ("x86/AMD: expose SYSCFG, TOM, TOM2, and IORRs to Dom0")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks.

Jan


