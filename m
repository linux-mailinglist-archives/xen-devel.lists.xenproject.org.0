Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F17053B537
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 10:36:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340912.566047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwgJD-0001WQ-IF; Thu, 02 Jun 2022 08:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340912.566047; Thu, 02 Jun 2022 08:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwgJD-0001UA-FI; Thu, 02 Jun 2022 08:35:59 +0000
Received: by outflank-mailman (input) for mailman id 340912;
 Thu, 02 Jun 2022 08:35:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4LFK=WJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwgJB-0001Ty-Qz
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 08:35:57 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 059d4ead-e24f-11ec-837f-e5687231ffcc;
 Thu, 02 Jun 2022 10:35:56 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-43-Vst1ESMrNsCGbm4JhY31mw-1; Thu, 02 Jun 2022 10:35:55 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB3PR0402MB3785.eurprd04.prod.outlook.com (2603:10a6:8:f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 08:35:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 08:35:53 +0000
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
X-Inumbo-ID: 059d4ead-e24f-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654158956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c9Hjxzh1343s7FWsxgC4jtHmUl37vjhUolmpdIgd/Kc=;
	b=efRrRPwXARHCYliLrOktixMXt7lH8S08ywO29PTVE/vmgYbHyMn3JXSvcN3n3f8iLYI42F
	j3Xe3O14ls9TEu3cK3vWFN4g3lADAAxnT2ZJdiwF+qLng9QlRHL7Chc/iL+te/OQeAjuWd
	rF/Yd5bwzS0xrFeklOO1HAM9BbrO0d8=
X-MC-Unique: Vst1ESMrNsCGbm4JhY31mw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lm4ENZpDPqAMFSSQFV2D7Vj6Z+0Tvnc5xOSDna2uBGj6hGbyFjQP+1zs8MGXsCQaQYnOzPXISZ0bN1B/0+7wYrMYlvwT4gLil+R7US4lfbwSfognIRzH0jqLy5kN9luGrgRquXNc9dwlBOCUQ4UelGq2i6GuGjn1nZ9PZvZ4WmB0rS0EoT0E9C7p2GDBlpXLnkQ/8CxgD39GwxsRjGykkPGdwDkl1UxwUIySVu15Cb/tJ+iauSaJyJwxHces3POeVyej/HP1xiiyZm3stsZPuvwE2IZRobutV3u44tn87t/nv6iieHvPzTMkH80Un3r06X8YEC3cnB+hJ/sWDhooLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c9Hjxzh1343s7FWsxgC4jtHmUl37vjhUolmpdIgd/Kc=;
 b=edwVNab+pPiSTYZ1Q7UlDLvbn/XBYb3BAsXwZ5KAIrx76N2HS1a9ZWarmC3yU7/isJ9pS+UTobhOuAKPV7M2s9jM5UlK60hpTjqizb5KE5qsiaKvWKncTxwORu4OxtS6d892Jop5ZOGKtRAkzhs3E5oxC57PFF64xZMpsOk1HDnqgb2BZW2FcOeV/RA1Ulm0k1ZkhII/uPZlXH/VW623ymyAEVwUIaaKfm3d3Vvd1gWwUNq5vWld5jndnp2+3pI/GiB6oc2KSer6Flr7INC17kc7B70SexBjovo4XtCcaEQIkFSNV0cVdbzxO6Zn7PEFIq4KPSeXy6f5Od4khfKFMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ebe4b409-318f-6b2c-0e05-fe9256528b32@suse.com>
Date: Thu, 2 Jun 2022 10:35:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: MOVING COMMUNITY CALL Call for agenda items for 9 June Community
 Call @ 1500 UTC
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>, Andrew.Cooper3@citrix.com,
 julien@xen.org, Bertrand.Marquis@arm.com, fusa-sig@lists.xenproject.org
References: <CC75A251-2695-4E9E-95A7-043874B22F32@citrix.com>
 <alpine.DEB.2.22.394.2206010942010.1905099@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2206011324400.1905099@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2206011324400.1905099@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0139.eurprd04.prod.outlook.com
 (2603:10a6:20b:48a::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f2f75f5-8a3d-426a-bdab-08da4472e803
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3785:EE_
X-Microsoft-Antispam-PRVS:
	<DB3PR0402MB3785B15337B6C114C684452FB3DE9@DB3PR0402MB3785.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hZae3+XXz2WlWz4zMFJFFv5ZToinpgI2Lm73ULmZlR1oG7zFEmJOaaHbE7IwHSE9DYmBqhHtRS5IIwzylvk+5bkRsEypL1wfRxl0mThaV47yc2DC1BOpOn2WhFEWeSXLMQPmIMRtMoqgRUxpoDUtQKGGZFTKbdkCKuNfjB6tcC85Sbm7iD80PX3hnV9LDsjPYtOU1ELf8H5Wq2ik63knbjrGmLmsWNtxhLOiJzfpoYod+k0l9EWKhNjcjqC/mHGQYhWV6ODxUfBV2EurL63SVHJbyO9IkyKyF4z+Z8w3WrcHgrRjls+xRxVQb6ATyewkbV79NGx2FgYIqkkZyYGalrSH08dj/r2E6NKKJMKSurKXv1N6nS71DQ9bi4w2iE8xxVqTG6rmae4+XcnN1KfEs0wL/MTwA2hvEHJwT1LfufZbe3OZxaQ7DR7TAheMXnF900VZLCSgAtiwt1g4N4c8YpINPDNWFqB6qYenGuN7ihBTn7vs0u/faMMwLX0pJ2qS1Bi9ghysPf6eiTKliEOYO2xeX8Yxdn1b3sZ+IVmUk167OZZzCEtQiCzLvVKDslcOYmtCl0fFFHASbw30AoX+tpSuWQngy2fJJmu7TJFGaSyfSIDLZrWVuQwDrQq0UfsbigfmnxxaJYpgLANvBtszXi5TvY0QlOId/dBtlAc4/S1SuDngAy3n3SzE/OosvC5SDUs9DBP4yfw8nzJ+D48lwUBysgUiw7xCtTAGk/rwpIdaNTFKRl9UVv0LSqfBWuypQj50MviCxIvnr3K5QYasmw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(54906003)(6486002)(316002)(508600001)(2616005)(26005)(6506007)(53546011)(66476007)(31696002)(2906002)(5660300002)(4744005)(86362001)(66946007)(8676002)(66556008)(4326008)(31686004)(36756003)(8936002)(38100700002)(6512007)(186003)(221023002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0tLang0aXNEcnY0WVo4YjJ3dVdEWTBiOG5rMUcxSXBpNU91VVFVeC9LVUxS?=
 =?utf-8?B?VTgzKzhiTXBoY0RER253Z3l5SmlpdVZWVW85azhOeVo3UGhTWGgwWFpIcDVi?=
 =?utf-8?B?b3EyL0dIQlY2ek5ucCt1OXBOSkpxZUlmT0ZjTkMrSiszNlVGSSt5aHduOTI4?=
 =?utf-8?B?aEpXcnRlTXg4bnpWTGlxSC80UnRobkZGWVJGQkw5ZFNZMnY4OFk4ekJoRTNY?=
 =?utf-8?B?NUxLcWpLeWtldEpsbFJVcjI4R0ZlM0oxaHA0VXVYTnpFYzB4b0NoY1VINEpi?=
 =?utf-8?B?aTVPU1JpTW9OM0NQTXVNWXBZWllqckJleFpJV2JYM3Z0TnNhQmdDTW0zUnNo?=
 =?utf-8?B?bWhrM0hLR3R2citMdUdVYlB2V0tHdW1FcU9Oc0tON2JLQlFhMUdVbWNVWURz?=
 =?utf-8?B?YmNXYjV2QjVLVDNENDlaa29TcFM5dVEwWWUrSlNnODE0Y0srR2UrQ3AybXZS?=
 =?utf-8?B?bXNYbVZvbHJmMTJ2YTVSVXAvUXpJTHV0aVdIeXczRVR0RGZ4UVJHellpSVhD?=
 =?utf-8?B?VjRuTFBsZityKzRtenFDNHErK1NpbnJBd3FuNUpiV05OeVBKL1gxQUJrWk02?=
 =?utf-8?B?RVBmYnZzYlM1cDl6S2tCWHN0Qms4RFdxcHh5WHJrMUc3b3ZrN3N1Mk1pUU9a?=
 =?utf-8?B?MVc5enJVa29RTGY1QlFQdVJjNjNIcXBSb0Z4UU5rZWQ2ZUI3Y1Q2cGpGaVRK?=
 =?utf-8?B?T3ZHYjk0Q0EzcHJVQTZhV1VRb2tiRi9iTXVlcUIwWmtMUGdzRWxCN2JFOWwy?=
 =?utf-8?B?NXRpaE1Bb1VyZ2RqenBWKzdWVUhvU3p6V3VBd09XWnROMWNaQkwrd3FBeTQv?=
 =?utf-8?B?VVN0cFQzZnEvLzNiQngxUkhST2s4VzdpT3RSU2RXUlhwaWNZREFxZHYzUHVF?=
 =?utf-8?B?VE5TTXkxTFNNWkJaRWhZZWVEdUcvbFcyQUVxWXhYYW5wR1R0N0g3aCtmL0E5?=
 =?utf-8?B?MzZSVXNmYndxYVNseHdNMVBQcEhoeFFSSVRvc1JMVjJVRWEwSDBxZmJ1TFJh?=
 =?utf-8?B?M3VaL3d0ZnB5cXNFcWFlZFgwMXBUSzdZMUt2eUVJVm9kc0I0ZmEvb0kzZHBy?=
 =?utf-8?B?LzlNRWpncmtLSVNHM2lGVGljbmZTOUgzUTNSYklZTE9rUE1CY0hiMVFySHFk?=
 =?utf-8?B?Y0pJWEZycytxSUxQcGZYcGo2SUIvcXJWNVB6UExhQkx4MXVLNms2VW1RWVdE?=
 =?utf-8?B?VXJmZnBMNm9KbTdLRUNSYmE5SUtkN3dheGIwa0tIdXFEK055c2p3Q3QralU3?=
 =?utf-8?B?N0tac2ZQTGRLMjIvejJHa20vY1d2K2JTb3U4ZnIvN0U1U3djM2FpYyt3SjBz?=
 =?utf-8?B?N0s3S1gzcEdtMmZucWh1dkZaYTg1aDZiTWdJUkhGU09KSXJ0V2c5OUZqTXlV?=
 =?utf-8?B?am1PZTN1ak9LSzQ1YlBXSmhSajcyVFJDQmorYzRKYmc1YlZWdEM1RmZHTERV?=
 =?utf-8?B?aVRUYi90a2VqYVlLSHFzdFZEYTZrV0VibjRsS0RNYXJLb3h0QW5tUWJWSnR3?=
 =?utf-8?B?NUVvRnpFQ2R5ZEF6eTlXNktzNEEyVUp0MitIczlCV0VuMHZ3VE93dTZWR3h6?=
 =?utf-8?B?N2R0aC93NENTSDl1N2ZpVlE5aC9lcG1KM0FuNFZneTdBZ0F0UkV5QkZlelVF?=
 =?utf-8?B?ZzRTRjl2eVVtMDJDa2xXTUZaYUtVUTNQdUY1MXBsK2dTc0g3LzlpZXhMN2h2?=
 =?utf-8?B?anU1MkNqSEpFK25zU1ZKUnVLb0ZQdFdrQkRFTENpbDE2dkh3ZjZzc0JVN0NQ?=
 =?utf-8?B?TnhDa0VNZDJ6K3UvZ254OFk5SlZJVC9KSFJLTDE5V3pwdFRWYlFSSndIV0ZQ?=
 =?utf-8?B?Z29iY096V0w2V0t4UktaaUtXUGFYQStMK1VhU2N2VnVsUGRycmRIV3JsU2g4?=
 =?utf-8?B?NkFUL1ZLbC9qeFZEdVpVbHpGYzVxQSswOEFyU2ZBUTRYeWpPL0M2RENwUitI?=
 =?utf-8?B?b0hZVDZuRmd4b0E3OXNITk9Gbm5NMlIvZU91dVpJaUREcE81dENqdzBScGNo?=
 =?utf-8?B?Nlk1ZkFtL2RkMGhQSTlBT1pLc2hreUpiZ0diaXZodDZ4WGpoS0xoNHd2UFZz?=
 =?utf-8?B?SXJ1SWFPaEVVemJtamhyS3RlLzRmUVBuTzU2WmUyaURkcXJYbm01a3pRMVN5?=
 =?utf-8?B?NEhod1F5RU96eWd1WHp4K3JrRWx0ZjlXcCttY0MyNW1LYjRDMk1sV3dpY29F?=
 =?utf-8?B?WTVZdDRvTmtuaGIvR3BqMTVWL0ZweVVMWnpxL1hjZmVXSnQ2dngrWGxIeGdJ?=
 =?utf-8?B?eWdIQ1FUVGpOYStRT05uNklqbGFsREMvRy9QK0ZKelFjMEg2YWNyVXlPZkZz?=
 =?utf-8?B?Y0tKdlVFNnBQU0taWk8zOGh6ZTRTa3JWUjNhTms1cHc0WjlPK05JZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f2f75f5-8a3d-426a-bdab-08da4472e803
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 08:35:53.7897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fpd8iUH4tF8Bzh127w3UI23AtAz9ALqTFt6ZZOabK1lE32/vZFBNAqoVoD7B5/xbckxai4FxF9qixuZTYOQ75Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3785

On 01.06.2022 22:27, Stefano Stabellini wrote:
> Reducing CC and adding fusa-sig
> 
> Actually Jun 9 at 8AM California / 4PM UK doesn't work for some of you,
> so it is either:
> 1) Jun 9 at 7AM California / 3PM UK
> 2) Jun 14 at 8AM California / 4PM UK
> 
> My preference is the first option because it is sooner but let me know
> if it doesn't work and we'll try the second option.

I don't think I was aware that another call is needed. Was that said
somewhere earlier where I did miss it? In any event, either option
looks to be okay here.

Jan


