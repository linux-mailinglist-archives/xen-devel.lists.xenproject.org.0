Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7118C3F89AE
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 16:04:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173080.315807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJFzB-0001lU-2U; Thu, 26 Aug 2021 14:04:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173080.315807; Thu, 26 Aug 2021 14:04:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJFzA-0001ir-Uk; Thu, 26 Aug 2021 14:04:04 +0000
Received: by outflank-mailman (input) for mailman id 173080;
 Thu, 26 Aug 2021 14:04:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJFzA-0001il-D6
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 14:04:04 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 778a58c2-0676-11ec-aa07-12813bfff9fa;
 Thu, 26 Aug 2021 14:04:03 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-FtNK8IOdM2eaMk3dTQkmlg-1; Thu, 26 Aug 2021 16:04:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6303.eurprd04.prod.outlook.com (2603:10a6:803:f2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 14:03:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 14:03:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0701CA0032.eurprd07.prod.outlook.com (2603:10a6:200:42::42) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.6 via Frontend
 Transport; Thu, 26 Aug 2021 14:03:58 +0000
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
X-Inumbo-ID: 778a58c2-0676-11ec-aa07-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629986642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jzczTurrM4Cm4y+HUAB9UXeDSZXjRSqKYDJaGfnLsx4=;
	b=Lm948MnmUIlTpVOdTObUw20uj883ra7PpHzyUEbKqIDnW4iV/KLvjWiTsZ2LvNVoUVL5nn
	Pp9gdJkTRjFspUd+saE0GhhNmPXgy8tZMSl5YQVtwyyOb8yxIbm5laMDUS4qm2ATy1U2LN
	TCUWOgwHQLf+HTGTKV1+R75kvsyFtxk=
X-MC-Unique: FtNK8IOdM2eaMk3dTQkmlg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eitbSY7b6it2PHXWQxVDAuTKXNt7/O/o3cyUDZyzS/SDh7FX/+VENQSYyEcEKbUse3fxjQsNZ2Mj0jld3SdJKzBYfsjrumHDYs3ObksreNURkqZIPitrGjIFDWQ/Kupbhwp4aMjvIw//hOCP48y+zj51Q69UtY3CYL1CYKFQggC4q/k2EXV3E7ftAp8jgpOdkGfvhxLAMimXUGBmYcLvUM40agz6E9aJ4wNsyte9SuS/5UVgSiPrs0ZEX/Zpw4eF/lSnkFP9Sw2Wgmm/N6SVyt4IwHgyyQep/LkPdd7SyGCqrzgRXLtVT5SKxL7Sh9Wt9+8lYHGanPe8oZAX87t4XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BkRrrXqqDBS1J4mfMUL1W4j1LpGbpujFJaF4nkNi0hM=;
 b=ME5kD0m5KYRF6DcvihI2E4OgYVhXRqQrTTLFKayK37Kf4/eZ9U12gy+W8XbjiWEnWfgdG+GarUQZWsWmKIkWdbrVtonj7OXQ/P7Q69Zq95SvhdhmK6PTS0Gre0z5WkpMUCYBxqk38MCCgI7oY88ZzOoBg+iHj8ZycHRr+K/QrK3YWJwKdLnWnPQbDEDVbQB+LHsEsa1GbosRnek+fzo6zV1mddSX3HAeL/Q8Lj2mKeyBm2jsLTvk2g+oBrDFidopHtOx3Lh7uyydGQpOzu2dT6LbYc5lb1aQCp9qGKKFNCGzFxmM2pQ8L5zNpdhAU/vlKoIpQ1Tnj9pgeSUCUr6Lyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v7 4/8] AMD/IOMMU: check IVMD ranges against host
 implementation limits
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
 <c0b49a0e-44fa-4e15-ffb9-d49002060edf@suse.com>
 <05d3fb35-ed58-7b3b-59a7-fb555953cfca@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9d085b15-b871-8db0-c2f2-16f17df2fc4b@suse.com>
Date: Thu, 26 Aug 2021 16:03:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <05d3fb35-ed58-7b3b-59a7-fb555953cfca@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM4PR0701CA0032.eurprd07.prod.outlook.com
 (2603:10a6:200:42::42) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09cc63a5-d570-431f-3129-08d9689a59de
X-MS-TrafficTypeDiagnostic: VI1PR04MB6303:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6303BF5B285CA8AEAED4B01EB3C79@VI1PR04MB6303.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FWnWnb/rkDCrLdeFV5Mw4TSUF58u23QeEYmDCA7/9LYIeuucl51wETVt5qupqiRPknsYbOzZ3AlbI/K5XqzhYakwHNLf71UGYcRLZbjIilGuoJXu2R3UXjiDAAA7cY18tNqg6vCIIez0vC3iB6xEooTVlhX2vEBTPArRAbTdOMcRAOXohJMR3dr0NqWqbAqonu2YfT1on69JoTb4E0zKokAoNVI9O7JTSbe++7gtJ7I/AJifKbeBGMQZJ46EFcZqwXhwFOw4YeIHELuA71o15hPRiT5VjiUg7WTI7RIkXNJtlGWrvWQHpsKhSWivOdhXDfaBfeA3YEH6F1aNVv9u47ilcDwxe2gyCVxI36n955zovwnxwiTDCESd7txll9pvCYm/zHf1gvX9gzH6VRCoCGctQuBhGWTOU7lVoYrXRDnnQmD0xpHSCcHaFjllKlzpH1PGA3H9VCGvDAwXCIUFKdr91D0aXthasxXB2SW10cS3ymV/t5z3Fy0YdZA7O3py/rRW+xmk9FpsTaTg2fypZTQ7+pnFEFYUaiFrrKaAoQZWuNbgOBCvb2ixAfC/Lub1GbjQlCAJtZXjg1sWIZwZg5NxZdpVEz8WucmDxkQOlk169cEg6ODqxtNGixwBM2RVnRh+bi5AWJ4JWEiIdqJ/KjIJcOwu8ZWaJAtHkARcSuwPSCNWF3PIlOhuTzsEjHMosenOfHpd+LAsm68dxsUGZsCznAF0doSxZSlDDnd42J0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(31686004)(54906003)(38100700002)(31696002)(53546011)(186003)(8676002)(66946007)(66476007)(86362001)(26005)(4326008)(83380400001)(956004)(2616005)(2906002)(36756003)(5660300002)(6486002)(508600001)(6916009)(8936002)(316002)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nbkHruDOM1cEWwEoEhMpQdHS9ktkYDz3wR+Gg+ugwUiFBpULTy8yqql6aNoD?=
 =?us-ascii?Q?HPAMtWKKRpgC59XNNSpD+3UMKm+sQqPxly89VQu+YqTut999bAvlOnF8NpcB?=
 =?us-ascii?Q?VKq998pLwWuivIUpf/wh/ZoY7mJu7LwHE0L7hcP4mIqtp/7gK7RWMInL3fnZ?=
 =?us-ascii?Q?dEMqiSvRvkgLi0A1/TfUqPvyuHb41jiXFio8JP6FHH3FmvQys1zBVAsttzlo?=
 =?us-ascii?Q?0IKMFXMr7vaM0NUHLpHGQ+McnvZ35beuuyGJrrEn3LZuoSEUEGmwmWc8NwQ9?=
 =?us-ascii?Q?UN17lFQHZuWpjum/BFoteUIoGfphAbh3Mgv3aBw6PWO3ESdvjGsl+58QoTqO?=
 =?us-ascii?Q?YGg/1mdwCbud0UTy1tLXs0vw9UoqJc0eP2aVmcoDjjnLuUyizzP7FFM0em3n?=
 =?us-ascii?Q?pOErZmYShJbr5L+F/4R22lQLM1gR1n4EzGoeL14ulC3uZfJ5oRVmNQnD/cAJ?=
 =?us-ascii?Q?x3YI1wkAQYxWQ/HJhyazNm8+hhJA0CGONoawfMRVAOnVEv+gGdVNBk36kez3?=
 =?us-ascii?Q?Vrf3Mc695Mzoqpzzi/P14CrpZCYav6a2QyWi4Pm+ly0cPnlYBks2DobW7SVD?=
 =?us-ascii?Q?coP51TBEvJ4dl5TZoroqZ4UjTKajTM9z7YkbqUMc5UOPk0Akj5cVM4k+1/ji?=
 =?us-ascii?Q?H/sQ7v9C+w7VfCrISmuKq1jbcMsP2w9KRaX8rhD49X1Blc1tMgyP0PmjPzeb?=
 =?us-ascii?Q?Z8I/GwHqG2akSyIJglS32QwJx5uS2GLsZ0k04iT5pG2UpXMD+Zc+r05LFvGi?=
 =?us-ascii?Q?PWHqaNDRSqRyiT7fBWC1xcURfyfg3z9rNMb6m1zhAd7XsdNNN/itJnDtyQwA?=
 =?us-ascii?Q?lDgnCGcRNSS9PSiQZA0yTdIf+8cxVFL1vVhwTaV8OTQsw4GD4GmovRbeQ1Jv?=
 =?us-ascii?Q?9RRDr/z6Vm3TkO5Wnd/+tp7OdytrMSxo6XhHoymmwpiEgHly4ti15/C6UJHS?=
 =?us-ascii?Q?Yd6DLmBfXpK3olVA8OhwsW36HOZNXu0vznt7MLUq2+6/pkR3sf+KmvTrKg2u?=
 =?us-ascii?Q?Am7BuaK56XGrRPpEInR2yl8cHe3yWP4aWGQh4KDIT+r2QVf37ee59TlId8/4?=
 =?us-ascii?Q?9u2jPdEZ8Vco4Ngv7JufFk85Yu9UNu6AlsOYpsoqVnP3gh4ldVdAzsGgi6kS?=
 =?us-ascii?Q?z222aXIBKgWZ4xtz4tjAd4GPjmzGfd2HHk7d5z40TNYUydjgYhxdsZNNCUFo?=
 =?us-ascii?Q?UTxfQrmly7gkeC8d/sxshY0n5X6GzyeaA/q5uMwTtc6RpoyvUhro5GmX2Ut/?=
 =?us-ascii?Q?AsfwPAX74qgP8DQ4DkG31NGo6XdMKyskw7xmIsRRnQKyr6BEkftAFwejQ0Fy?=
 =?us-ascii?Q?QwixLPmC/vdptX5ImVmnJK9V?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09cc63a5-d570-431f-3129-08d9689a59de
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 14:03:59.3091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3U5omn08Ah18rPRIXBxsFUmY5PKhO4QxAcVULtUGHX671MhiPSU9sfVhPBqeFbMTubh/1GiwUHg5WVRpqaQ2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6303

On 26.08.2021 15:16, Andrew Cooper wrote:
> On 26/08/2021 08:24, Jan Beulich wrote:
>> When such ranges can't be represented as 1:1 mappings in page tables,
>> reject them as presumably bogus. Note that when we detect features late
>> (because of EFRSup being clear in the ACPI tables), it would be quite a
>> bit of work to check for (and drop) out of range IVMD ranges, so IOMMU
>> initialization gets failed in this case instead.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Paul Durrant <paul@xen.org>
>=20
> I'm not certain this is correct in combination with memory encryption.

Which we don't enable. I don't follow why you put this up as an
extra requirement. I'm adding checks based on IOMMU-specific data
alone. I think that's a fair and consistent step in the right
direction, no matter that there may be another step to go. Plus ...

> The upper bits are the KeyID, but we shouldn't find any of those set in
> an IVMD range.=C2=A0 I think at a minimum, we need to reduce the address
> check by the stolen bits for encryption, which gives a lower bound.

... aren't you asking here to consume data I'm only making
available in the still pending "x86/AMD: make HT range dynamic for
Fam17 and up", where I (now, i.e. v2) adjust paddr_bits accordingly?
Else I'm afraid I don't even know what you're talking about.

Jan


