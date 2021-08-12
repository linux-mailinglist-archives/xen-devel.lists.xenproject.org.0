Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B64B3EA607
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 15:54:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166451.303780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEBA8-0007Ws-CO; Thu, 12 Aug 2021 13:54:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166451.303780; Thu, 12 Aug 2021 13:54:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEBA8-0007Tt-9E; Thu, 12 Aug 2021 13:54:24 +0000
Received: by outflank-mailman (input) for mailman id 166451;
 Thu, 12 Aug 2021 13:54:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QHFb=ND=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mEBA6-0007Tl-VB
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 13:54:22 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb446578-fb74-11eb-a1a2-12813bfff9fa;
 Thu, 12 Aug 2021 13:54:21 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-geaR24mdP46VIUqfM5wToA-1; Thu, 12 Aug 2021 15:54:19 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Thu, 12 Aug
 2021 13:54:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.017; Thu, 12 Aug 2021
 13:54:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.9 via Frontend Transport; Thu, 12 Aug 2021 13:54:17 +0000
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
X-Inumbo-ID: cb446578-fb74-11eb-a1a2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628776460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BKiZY5axLlrvrW0I1NV7wtB/gErHq0jms8DzQDCP2G0=;
	b=Y6zDkexJRHL5nVJEI4KKHDbLuV10Fy5DlKzzSEAqLLuwyhr+TgD0E1NdxdhcKSg1de2R/1
	5F3YFinEc84BLYLKPYQCie1c0x46w6aTynCC3jFPGOoH7gBuoWtCKVQYSEd4Ci0glDTN0c
	2jeoA/H2yKZy4GHUhnSfIJTD7jMwb8A=
X-MC-Unique: geaR24mdP46VIUqfM5wToA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VejGDy/zktZilq3hqq45q7pZuYxCJFIqsTi0aTPgT2YXI+A/Ee4bQOUOibUHCXIjODxiYYZiS9zXlviqluQU5TDXiMNWz7JOKw/I4bAP5+UrgAo903AXJj8tGBt8xYOnOkgmVapjCnO/+R+VsYgio56hYvyCpnbNzkQ5UXYa/+OmZXzMSywz+4AdMougpPBaezuiG0b1FNU3fVzZf+EOsad/PAWKBiYmxa4SqbJ8iWMtIqsJ6ACnXBRLYrsZA5TBrNEH6zp07PIlXDuUqJIsT53YDuZap2rMuSvpe/nRxar8bdnewHgJgGt0MlVrs5cD7fvw53xBd0B79tuvaODR0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BKiZY5axLlrvrW0I1NV7wtB/gErHq0jms8DzQDCP2G0=;
 b=HilhyLB+jj4diHZ7S8nRGfdLIj5LzUTF851uX9UZ1GU5MapC01LfKGvfjmi935ESenIZp3VmP8XUJqLJgyzms79V2czrnbhmw9qR8RbjCHogjvpH1jhQ2lsfaEUYASg0Ko1XSvVEWEYbySN1s1sWhXDOXt2QRE8zLGgTT1bwZgM4n4DII5nGE9ThRw1s90cukhXVJSC7ZnF7i6KzRQCHCJ8LcdwBMJwKqhxlT3EdsbUwJr87DEuRzr5ANxyHLYHL7U+Ui4Bg6tjLWxFZbLIYhX3TI5K3F8pe/C3u+225ZxnNn6M1ZBOgOlEs4gMX59A+uhbads9++IBT+zAy41gUrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] MAINTAINERS: Fix file path for kexec headers
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210812135101.27618-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4508a1c5-06c8-e789-e357-631f1fc28747@suse.com>
Date: Thu, 12 Aug 2021 15:54:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210812135101.27618-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bf80d17-402a-4d61-bc2f-08d95d98ad5c
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB715036892606EDB2EA733D34B3F99@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dmQLOM2iyG4S1dNCXwviVQkKxZvNrH3QV1BqHNCExVW6HN5BLKDWwDgwo8M5hPJBCBlcIgLGofR2eKSWmIK/lGLo5p6vgzPR5CJqnIiYbNlbw2o5NumaIPvkdt30TQhqu2wXBNN4sawA3o7owzfAN9cNTNlYI+uR3/I6aSuG+XDptDT0E9M4k8zrStYl6fCCnuy/V0s0y+zXC5HrANJ4PC3nfpzKmDVQmeaEtKhbMLEU+CbsvRaK1jbbiS5zAVb7TfMBelOcjJhAPghVO10i4vHomXCCS2K7ng2uhukr40WK9tNDSVocl0k25IYNpmfcbIzGMYFcKTcXe0vCt7GS4Hx5U4BpEWYFXxbzvgKdZlGX0/zKuiVS3z3ABD4BbraGTOV8NAv9PCZY3QEuMqv7F8+kmYMRU8QaYlyKSFDcPKl2ZeLEQjcP/L9ENzTQnPKtVse8yrBCruRNsqoMYZ3W9IfDETWh8yo/kN1oSze3hc6e16M+fpEVueZq2j3CHhyAlGSAlJiJxMl9Uo4GijsvgpkbR4bHdb9bAsf2GGtLXlJ9Ts8id2CCjXEgwirfQ21fpc3Hsbi2RxUTAZHkXpmjcgkJY3sGyJsMPD/0E9TyicF0MC//Int3agJAZvfrwyXbn53KkkLdPQoIoCKq+qr1qCNEL88pcXbXynwpnDfpD/8fVfbK4lEBjPVJxNv0qT1ePzsPAUSSZ1bzdbsfcDhWfxDms6V1V6kXPV5kJXWmrtM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39850400004)(366004)(136003)(376002)(396003)(4326008)(6916009)(36756003)(5660300002)(558084003)(2906002)(186003)(54906003)(66946007)(31696002)(8676002)(26005)(31686004)(956004)(6486002)(66476007)(316002)(2616005)(66556008)(53546011)(478600001)(8936002)(38100700002)(16576012)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGZNYk1Tby9yMzY0ZmVKTjdiMytycldPN00wa1Z5NWhyZFZXbEpGTlFsaGxJ?=
 =?utf-8?B?SVBoQjNBVVJlVk9PNy9NVGVWdCtLNUo5Q2NyWS9nMjVYTHJ5dTl1blh6ZkMr?=
 =?utf-8?B?NWZuMkV6bVM0VENqdlUxQmhTcGwvb2wxWmJyeVJtZVN1MVk2QU00S1FKOVlh?=
 =?utf-8?B?cU1TU2FEb2w3MVVCOUxXbVA3ZGZvN0ZUbFRPK3AxWjJKQWZQMjIrNEgzVjZ4?=
 =?utf-8?B?aTBRY3czd2NhTVcyR2tsNW84aDRBaTRCaUo5NjNlMGduZVdhWDlja0tXZjQz?=
 =?utf-8?B?ZEx1NlEwYk82dTNxWHRRNGJnK0pyYlpnc2J0dDBRNCtnYWQvTTY0RXB1bHIw?=
 =?utf-8?B?dUx4Q3BKM0JxVGZBY0JPYVVQazJlQnBWbUFxOEY4NjdsQWlOdEw2OXhjWTB3?=
 =?utf-8?B?WjFKOHArQzJzcElYWklaaGd6V1pLaEJDZ1RFdUpPRUplU3BUSkFGNTBtTFc4?=
 =?utf-8?B?eXQ5K0UrM1ZaSGhCNGRTd2FnTng5S1V1aXYvb3Y0elM5MG5KR014czlHbVZ4?=
 =?utf-8?B?dHdaamorMUEya0xlQ28vMzNUVkl4RUt4TVBjcGR5aDFnamU0V3RhWldFcXI1?=
 =?utf-8?B?cno5LzlxSkFDd1pjZ2V2ek5JZW1QWjJuRWNuM3E2b0E4Q0NObitTYlV5RC9D?=
 =?utf-8?B?eHdIa0pwSHViZHF4amxuUTFKWXpLcm5nM3hpSG1TbVY4WHcxcFBFTGRkdEZm?=
 =?utf-8?B?VHhaS1J2dVlhalpxd0lYMUt4R1llTHpTY0k2MlBzSzk4MEhhMjZnWVNrdTJM?=
 =?utf-8?B?MXFUVHZJSnJydG1ESzlqd2h3TEhsZnNWOVpGNTJESFkzR3JVV0NTVXhBYWMr?=
 =?utf-8?B?emtEZm1FRVplZm1KUjk4THprZzkvajM1VDI3blRncS9MWXdRZllCbnF3eFRR?=
 =?utf-8?B?SnpqZFdPQ1BtSXJtM0hMYlZhelNzc1YvS3hKRkNVdkZNeFVVNGY4RWJCMEZV?=
 =?utf-8?B?YzZlQjBBTkR5U3JiSnFOb1lyc1FFb2kza1dMMFNHSytHeTRsTndvekQvN0Za?=
 =?utf-8?B?SEVmQ1hDdU9vWE9oRmVQK1BsUjFPekJtT0RDRjFHNW1yM2NweGlPazdlU2Fv?=
 =?utf-8?B?aGk0eFExdTF1U1dnbFJxOXNKYXlKZDYxbWZLNGc2WVRKZHRaY012KzhpaWlk?=
 =?utf-8?B?YlMyc3MxbHBTbUd0bW44ZGozUW1IaGRobG8zVzlaNUE1eHlZM2lIUk81UXRS?=
 =?utf-8?B?bGFkZXZDT2Z1VGN6NVRIRnJzS0hVUU9kSWI2V3Y3TGRleForVjlxWklkR3Jw?=
 =?utf-8?B?USt0Q1BROUZBZDZPV3RuZ0pGYkpWVFRwWG5UV2NBdU9ZQ1EzYjhJT3B1NTNw?=
 =?utf-8?B?eGEvSUZQVUI3aGRkc3FDWE9xZ1Z0TXd5dmZkRSs1ZmI4MVNkdjNGbGxjd0pD?=
 =?utf-8?B?U2JMYlJzY1pnbkt4b0NTYVg4ZHlXMm9vRnA2Ynd0NFFETllWaFZ0TG11cE9k?=
 =?utf-8?B?NlFGY1JoQlY5K2lncVZtdld3cVZib0Z0NDViajNvY1JIZ25uZ1FDYlNDM2NO?=
 =?utf-8?B?WjdEUERWQnUyUHp0eHRaSVZJbEhiTFBSajFFeERGYnl3Wm92d1d6WFU4ZGxR?=
 =?utf-8?B?b1RUZkRsdjdBeTF2ZXowMVUrazAvRTZvdStkcnBObEZXbHJVczlvazhhK2dI?=
 =?utf-8?B?b1BhckZYWk1sd2JUbk1yKzI5Z1JZVzF1bEZuMUZDR0M4ZktPSEdaNmJwZ2s4?=
 =?utf-8?B?Q2piYnR1c1doa0VxVloyQWFLdmhJSDZzQWZZeHpPWGhXVElmRjkrRmxTVmdS?=
 =?utf-8?Q?Sxzvjd2dQzM+EUFM0hJz9E78ClPCwOrpoY6guFO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bf80d17-402a-4d61-bc2f-08d95d98ad5c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 13:54:17.5193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9gly0ZT+tVAipc9/ZIi3s00Dx7yRpdf1xfq1sv9i3Q0EqAt/Q3PRc3+6zlnHqCS0EfFbtCF5FPABLI4ppF6drQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

On 12.08.2021 15:51, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


