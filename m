Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 334AE3F5C7F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 12:55:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170952.312044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIU4z-0001IS-BP; Tue, 24 Aug 2021 10:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170952.312044; Tue, 24 Aug 2021 10:54:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIU4z-0001Fa-8P; Tue, 24 Aug 2021 10:54:53 +0000
Received: by outflank-mailman (input) for mailman id 170952;
 Tue, 24 Aug 2021 10:54:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIU4y-0001FU-71
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:54:52 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0f4afe0-d9aa-4d81-bc4b-355ef466f6a1;
 Tue, 24 Aug 2021 10:54:51 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-Q31Xz7msOWWGO-aBrgASoA-1; Tue, 24 Aug 2021 12:54:49 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB4786.eurprd04.prod.outlook.com (2603:10a6:208:cf::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 10:54:48 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 10:54:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0022.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.6 via Frontend Transport; Tue, 24 Aug 2021 10:54:47 +0000
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
X-Inumbo-ID: e0f4afe0-d9aa-4d81-bc4b-355ef466f6a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629802490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S274DjccSW/v6nWZGszRzhg0IhZBbtOuANRVpp83PnI=;
	b=gf8ChfzyvTeOU1HgFMqQjLlk1nhUXKqq8LNKWagMN0LHt9Yv+tTLNzkQmqQnegI+sKKW6j
	VFmLclSZBB9m8P75mndnveNx867sMcB9muWVBBvhGsjPWFJNkqOKHY7iAU8cw+1kWw4zRl
	gFpBHoUBZh+GcjJLFZVUZchXDjdWCZU=
X-MC-Unique: Q31Xz7msOWWGO-aBrgASoA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRdbNXTBvT7EgnH2mJbsK5bOUZlv/oppNvzBE0l/v8qjkNdJRCP6GLNIXdo+czr4gxXZgRRMrYS5oMbFInSh68WjDmj/COzgvl7rG06xUC+crfvjyMdnzvzchqkUOYjfPSowi/n/br69ce7aM9PHIn1rSsVJwZaFDYXrrZBi6Myty06oUk5PGOGi4Auw0ThvQQi4IiNDL7hLN3R8uwZDO08uUQ6dU7LZHHwtfDRZ7r6+Z/AN2KWapEXNH/iFly74o3J7DVgJa+But4PhQx4XHZHHIYhf/ko9tTm3aDavBsg3rGw08coK0+MAx8oR5pP3/qMWkSSr2SjKe8UyVu/ZZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S274DjccSW/v6nWZGszRzhg0IhZBbtOuANRVpp83PnI=;
 b=NdldZ1z+bEFYXLlVjL0T3OWQFfFpXhA//d4rlZKH8gnBGA65KCn9mD+As4w4qm3gupoByy4HclDg0OmeAPpmqVz81g+WPhVBbpHJUfRIiT98IzbN5HOCCikMXiVYXAdwbT+Rmz5o+AVLcAA4sMyipF/9QoD7Jmr7GGZStJ+fKdyGtFKaLqH1grDEHDzshdrsKRIsNMqou3KsV69Yo7wRRO2R0ovphxsZr4HrpzJ+0sfBcnrpACfsM+WB0/jnXqEFJyI+32nRe9Y2LxCRiJwbLrjgT1XSjNDNNk4sLCe5zwBjxAqcrEMYJBr6yKnMUX2wakmo5XJq505yMLPUrDxuTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v5 5/7] xen: re-define assign_pages and introduce
 assign_page
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20210824095045.2281500-1-penny.zheng@arm.com>
 <20210824095045.2281500-6-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <50f8b8a2-e706-770a-ceb8-a7fc4cf189d8@suse.com>
Date: Tue, 24 Aug 2021 12:54:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210824095045.2281500-6-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::10) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7aa063ce-9229-4d93-a085-08d966ed9714
X-MS-TrafficTypeDiagnostic: AM0PR04MB4786:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB47867B5A578AAFE639EE313BB3C59@AM0PR04MB4786.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bs3KjzavZ9U2FN9pkL3Lo74rN8k3NGOmbsT2ycg0zMKZUN0BJqh5Rka3G/1JX0ICKzBk4KLfmLeK7iaIZewOiF5vty4Du1eSwaGUNDoU9vUEwlgJFXF/Eb0QoqzJEkWOpjwEDefAmPPn5GRZAYNAdDvZhVwDhF8rJPLy2B8ubY7P2wYYT7MKwsZm4MhO8IagidzYZoEy8orgEZ2c/4tXJIAiwsDPoR/qtdNWg7uvssTfHKXwoOh36AE5V2Fb/hiGjRXvqFwGq7GpznFS3NLKz8Dy43lAxdteofsBARehQhTbatSPHHwJIr//P18JVtQZuJ3IT4R30QX65FyriY+QEPKQ833EB0FWeFzMMqM9Q6l5pIo4mE6qDDX9Oq0vNlLKKCHSVjoR/Rag4QPx/ePO77x3QS4FHCuV9Y5gOpje/OsCPin97CPNrMhq2qdxG8G6TcUyWHlTWdHaokmArEmuYrcPPlGhFMc4we9vO1aRk8ie0Xk9bSdVZFXCUzO5VVe+JlnjXCTf/ijlusO0L6DW1j9gwNPPKIB5IHZ12XvC8VRWcKExELX98fCfGWtQesKngSi6YeiC6Ym9HGA8hRrA9IdxGHQrnJahoF7hHV0IKXpGuSMgJbZWGGm67J52OuqIJbrigFh/Y6+xwmC0LME3cnWC7xbyxvnvdPDB7SKORmufEeXx050X/oqPxHjyyiEqUSLDK675ri1I16WGgd0NEkyZ1ZxTrY9jBrwuFnCC7zE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(31686004)(316002)(53546011)(86362001)(66946007)(8936002)(31696002)(186003)(16576012)(6916009)(66476007)(66556008)(26005)(6486002)(5660300002)(8676002)(38100700002)(4744005)(83380400001)(36756003)(2906002)(956004)(4326008)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0ZqQTdOMUIyU3FxTUEyVGwxc0h5SEdHaDVjcThtSkRnYURWWjVGdzFlRmZU?=
 =?utf-8?B?dUhBeU9mUmZobTBDUzY1UEo1ZHpRb3UrYWlwZm9mbCt2YURqbXFXYXN0U3k3?=
 =?utf-8?B?QlFlSmhDaDllUlphTGRmK08yRVBLNzNyUjZlMEdlMy96U25TVVJyWFJaQzdy?=
 =?utf-8?B?dStrMmN2aWQ5czVURHR0Nm1NY1BIRjVldEtwZ2RFYmVsRVVqeE1PcmdRMXIy?=
 =?utf-8?B?SG1BS1ZCYmJyaFpXemNLMzlsdWV4Z0JCdlF6SGQ1Qk00ODVNdUhyejFFNU03?=
 =?utf-8?B?Uy9iYURLMEpvVi91UTlJZ3lJZ1pwQ3VFb1hYcTZMa1VYWHZhcmkvSGZrTURw?=
 =?utf-8?B?SHlVYi9YaEtpbFhVb21rU2lXMnNUT1RieHNvV285WUJZQWJVQmVjclJRS041?=
 =?utf-8?B?WGZUN3UwQmppZWJTaTlYRkh6dkUxTjF0ekxXMFEzUTRaT0RQMHo5MTEzbjBz?=
 =?utf-8?B?dWtQYnRsR20yOTNsRzBldFJ6cURad1RpZEp2dlBqanM3N2tRc1R5Y05sZEhB?=
 =?utf-8?B?QWYxbWFZTHJPSWNHWktrekE4Q0UyVURGc3NKTlZzTFVKdW94RTIyTTJzRUFX?=
 =?utf-8?B?eG00VUlKUDE0TEpNUlNnanBSeG45ajR1MEJaeHJrck82WTQ5cXZQQ1BZeGxH?=
 =?utf-8?B?SkVjdzlubFlSem9SR1BrWmZsMDdicXRUQnVFZnlqNEJTNEVWVHp1RWh2YzZS?=
 =?utf-8?B?bEx1NWIzK2JBTUMvZGp1SWp1SW5Cdy93Znd3aWNNKzFEUWgwa1MrT2Qvam5N?=
 =?utf-8?B?TEg0NHFzaGVUeHJDZ1ViQUhuS0JIdDM0NjZwNGVudEZQMElLNTl4ZEFOaVYr?=
 =?utf-8?B?d3p6a0RsNUtmS0h4R21zZ2hleXpIV3MvZFNqeC9HSjhqaFZ3R2lTWkFxb0gx?=
 =?utf-8?B?dmhGVlJyNkVEOFZubXU4bVgxY09zNEdYMTludW10Wlk1TlpuZVU1bHUxWXpT?=
 =?utf-8?B?bUZyc01UejRsL0xVaVRTcmk4eUx4Sm5XT2VpVHNzdUJ1ZVRkUVk2NWFjMy9Y?=
 =?utf-8?B?MXRjaUxiMklpaEQvU2h5eUUvbXFmaGxYczNGYS9oTUo4c2hvSlV2SHJPM3V0?=
 =?utf-8?B?QW5JalVTcUVTcXhFSjFQaHJORE42SzR1eVdjZjYxRVVTcVhIN24yNjUvT3Iz?=
 =?utf-8?B?eTVjQ3JobWtHVkdHVDlheWtZdktjNkRjQ1FqcjFvNmRqQU5DQmJ5eGx2Nzhl?=
 =?utf-8?B?UkUvRldxUFV4b3k1WlA4angyY3cwYlNBclV1RHRobGVoeUh2TkZTakR2eERO?=
 =?utf-8?B?VDZ5OWdOTWduaUFMdmUxNDIxMEMzMDRtMDdnL2Z4ajFESmdLTWxxT3NVdWlE?=
 =?utf-8?B?N0t4YmRCbXFkZDFzVE9YYUNrSmw0Z3RWK2pjOHdJODdESkZWeUFIMnRRV0NW?=
 =?utf-8?B?Z09OdzhSbS9pT3hPYnQzK1ZoRUtKL0dHdHNZOWxlVDNEV3hndVAyZFdrOHEx?=
 =?utf-8?B?SXZvNlo3b21wY2lHay93M3h2WWI4ZVdvT0hYcVF1Z1pWN0Z6MXdCUjYyRGVs?=
 =?utf-8?B?Vk1ZTTYrSHZidUo5eU5oakJOeTdnZ0VWbHJodEpmMFZLS1BNa3RqUkdtWTVK?=
 =?utf-8?B?a1graVF0b0ZrdXlheVRKMTZPMlVQQmhzRjcvQ2FhZmg5dC9wMFJoaWErcENj?=
 =?utf-8?B?bWFud3Yzd1k5VUp0TTR3N29PQzVscHVPSEt1V21qNC95ZmN0S3d2dWkxN2ls?=
 =?utf-8?B?SFY3OUhrMWVYTXNCZm80MzF5UUVTcUdxOTJBaWN2NTl5d3NEUXJMdTlZWEJI?=
 =?utf-8?Q?V668CWngLZNkHGBi6zsppchfuSfV+mae8+Aw7nj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa063ce-9229-4d93-a085-08d966ed9714
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 10:54:47.9108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5reBDdz+tCFTVPfLcfYADA6cTCcwhZKMQf2dvOFTJtcXixrqNhlaGHE5Iri66+xeF+Gfn5b8Z6dcxv0C/WeEsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4786

On 24.08.2021 11:50, Penny Zheng wrote:
> In order to deal with the trouble of count-to-order conversion when page number
> is not in a power-of-two, this commit re-define assign_pages for nr pages and
> assign_page for original page with a single order.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

This ...

> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -557,7 +557,7 @@ int __init dom0_construct_pv(struct domain *d,
>          else
>          {
>              while ( count-- )
> -                if ( assign_pages(d, mfn_to_page(_mfn(mfn++)), 0, 0) )
> +                if ( assign_pages(d, mfn_to_page(_mfn(mfn++)), 1, 0) )

... is precisely what I did _not_ ack. The re-ordering of parameters
should remain as you had it. The request from Julien wasn't to undo
that, but to harmonize the new function's parameters with those of
the existing function.

Jan


