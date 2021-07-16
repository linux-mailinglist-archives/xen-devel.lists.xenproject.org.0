Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A253CB334
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 09:25:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157051.289861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4ICe-0007Vd-6b; Fri, 16 Jul 2021 07:24:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157051.289861; Fri, 16 Jul 2021 07:24:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4ICe-0007Ss-3b; Fri, 16 Jul 2021 07:24:08 +0000
Received: by outflank-mailman (input) for mailman id 157051;
 Fri, 16 Jul 2021 07:24:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aN3H=MI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m4ICb-0007Sm-Tv
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 07:24:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc6a871c-e606-11eb-8950-12813bfff9fa;
 Fri, 16 Jul 2021 07:24:04 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-NVQk8-L4OUSLJCh8aTHBUQ-1; Fri, 16 Jul 2021 09:24:02 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5599.eurprd04.prod.outlook.com (2603:10a6:803:de::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 07:23:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Fri, 16 Jul 2021
 07:23:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0020.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 07:23:57 +0000
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
X-Inumbo-ID: cc6a871c-e606-11eb-8950-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626420243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z2jCdfmfREg/XBvRgtwrhr25pvXR9ieoT0/twXDdzb0=;
	b=YXcyhJePIa8ZUBdf8832H8HNtFD0YcLjGqrpj42qW/CfeVhmcNqZ7G4OMIDQSI0pH2COzB
	42H+MhPolYDegQ+P0GIDRGMr2fkK/2shHVfFio078Bxt1fyGn7UxUceHE/KSZ5iIWog3pA
	rzFW0vjG6iN97ON39nFvwdZZ4T/EMlE=
X-MC-Unique: NVQk8-L4OUSLJCh8aTHBUQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ApLVNvPlMmLuOyRrwl5moJt/4yYU8lLXHQwSBnoDa/j8H4bBrynSRoquZCxu5vtr4uoiEIMQHilP59lO4G5qOYMRtctcGxuqDXW+k86fnogDpYs3PSJvsOGlRCG3Kn1yKQzfQExEnsZV94YyVi4+nh54rX0tCl4hyi7bYzMfoBhNf3ZdEl+NCYo2UWfkUCZsz14cyYrwbegsIlAILD1agCYpgQRXooAaKSYdIGWPRNLWvK+krqgQlkjP/jNIFG2RKk1nwOFICypoWeQw+Ub3QxT6mUqfAy48ItXf8kOvYDrxzIxgmUR4qCyP+sdv/lWDuNf6Exa+Ncks4dGfUSsmeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2jCdfmfREg/XBvRgtwrhr25pvXR9ieoT0/twXDdzb0=;
 b=D5ZCQLB2XFpvKyxqLYtG8IT6ztmZKUPnQVNG1VWQpU0bxgmknbwBdKA8wZgildSDOuH92WVN0KN26HlwpGHR8qG6Vk3IzeW4LAENBpOJSbmlm7rwbhJPpe/87c4uelp0JO1ryt9FCOpRKmwL3aVF2GVe/BfPs3Ijd7pggtw1Ke4FAMbIlbHlgmQDPmyfjZbXmL2SdUzfim7pt1Mi7/aDdvLGDMzFhEv/6NZi6DNFSXjbSrRvRWmMi6iQBpj4g+4Fyji1Km5nSBHw6gOBI5l0vK7QIQUB1U1qqUdO8ivJr0Um/YQkZMM5WjZMYcgCBamiJg9sekwU9gd9JSeBV1fuBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2 08/10] xsm: remove xsm_default_t from hook definitions
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org,
 Tim Deegan <tim@xen.org>, Alexandru Isaila <aisaila@bitdefender.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-9-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2f9d2f66-563d-4e7d-4886-e4fabffebc78@suse.com>
Date: Fri, 16 Jul 2021 09:23:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210712203233.20289-9-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0020.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f85d795-fe85-4617-1587-08d9482aad8c
X-MS-TrafficTypeDiagnostic: VI1PR04MB5599:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB55992D605B7FD18C7EE46B98B3119@VI1PR04MB5599.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PlLIZRLiu7Lxvisu0sU9GaoQ3dYpO7jS+oAAAAL/H9SsgD1MEusT2ph4TuMZu8Pe7P8UmwWQSixlS6634xl8BGgfFhhLO+rIE6ZajcsTYl1J8y7FMKDbUkaMCyOgd2B9/hD5FSZczpT9KJVAqWsZMu+TYXPFPLmJZqPs8/r1unXGtZys30E5dBJerb5rsCckDvBAiTqg/QQ+oUsSclR1D/XJ80IWkwblXZNK1C2eQu2iQJsiS2PPsGBr6LWRf20abGLszqKNpoi0QmVpN2ZR9iLBvz6npBI6FXTQKxNnCv6BeT/9fwGQKvdK+wyHGxGQjsTnmz3MN7Y2TFbTOBwKbaRP03rZFbC3Rm5+GCcwbzLw7syFuBQevawClsDshBtlTrOHoLsxYr7xHTHOv1ICA4B+psHCnQWYheS+wJFaJbjbcTD2iZgtR0MAmoyRj6K8I5wFg2K49ueASXFgeGe+H4fdh5bMfP420QFWD5hqILO7ujGRLXM7HdRjuo1Z+BC+/AR3/hBMzFhclCsb5IU/pludhXOGKyPeDjpj48OoiTrFfhY6BltmhOfZy4hdmNZwaGCyvsYHQq26eQxJhVjapB9vrvkL2LbdxRmaR0F52/+oRgtJ7Wpuqd3+qi5KjiwD0a9drPkb9h3xrgL3AvWvm1sWKjh9qpI+N+QkS2uiOHZY7aOv+0D1G+PQhJpumzASK3AVZQM2H0rWI/LqEW4bniqovIiIDinEicuVcqZPPcZ8KuAwxJGTgsGdf7MkBYAZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39850400004)(396003)(376002)(366004)(346002)(26005)(478600001)(8676002)(316002)(6916009)(16576012)(31696002)(54906003)(186003)(8936002)(4326008)(53546011)(86362001)(5660300002)(66946007)(2616005)(956004)(31686004)(66556008)(36756003)(38100700002)(7416002)(2906002)(6486002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1FQcW56c2RkUW9PRGlsNnpFZFduUTZYc3dCN05oVVZpM0Y2TzgzVEY1YlJa?=
 =?utf-8?B?ZGt1SGFVcEE3RFcwYWdUUzB6c2l3NHpjQWNOMTl3V2tWRTN1ZHJlUkdjTWY0?=
 =?utf-8?B?bHFLN0ozWForSVAxUnlrdUFNREp5NzNyb0FKSGlaR201VnRzZVdBM0dMMldk?=
 =?utf-8?B?WGliWXhYNGZVUTBaRW8vZzlYV0hLZTF6eVRxUDE5NTVTTktMeVpiRDRaRkcv?=
 =?utf-8?B?VFNjakt2YnI3dVRpdUp4cFhpSUlFN2Z4ZXNlYzMyaDJ5a2t4bzltSFIyUDVB?=
 =?utf-8?B?Qk5ZTkdtZXBIVHhYOEtWTlNLRGxwOXVveGZNYjVRSjNtOWQ3Z1BVQ2lxTklo?=
 =?utf-8?B?aHVGbjVDdTVocW1oL3dLUjl5K3QvVlc5Z0ZkZHdlRnF6NzRFc3IrN3p4MzMr?=
 =?utf-8?B?OTJieFgvQytpM09XWHhLa0E5MGhRU0NVUEcwdjFTZXg1eHRLaEoyZGFhYmts?=
 =?utf-8?B?cWpWdUFHdDZiOXYwaU9yMXg5dkVlamtmSGpoUVJ6cVNiUHZ0MHBmUXpGTHQ5?=
 =?utf-8?B?elZITU9uY1ZVcHZ6dkx2aU1xbGJ0U1R4MWZsVGsrRW8xNzQ3UWx3d0FNOVpx?=
 =?utf-8?B?MTlYanVWOHZiN2s2UUVzQ1hxRTQvdVQ0TVBXTXcrUHQybVk0M1JZckZMRlY5?=
 =?utf-8?B?M213WlRYVTd4bHFuNStYTnJKTEVKZ0NkV0lHMWw4NS96UnczbWRWdzA1N0dt?=
 =?utf-8?B?cnNyYVpNRlFkdWJuMk1zQ3Q0VmM5Wk9pRHdPd0MrTGhFUU9TSDhML2dtbzV4?=
 =?utf-8?B?SUc4R3hwTmExRS9VVnZNaU9VNHlmUjlmNnVnU2Q2UHlyU3lhV0hwTWdEejBM?=
 =?utf-8?B?MWxsdG9yR2ROV0hLVktuNlJWWmZhM0ozOWRaMTUxanQwaWxubGQ4c3lJUk8y?=
 =?utf-8?B?bUNHTDJMRis5Q0l0SVZ3KzZCWGJMZGgwZ2xHd2FtREVadWptbytTVzdDQXpv?=
 =?utf-8?B?RWhYSkMycStaOTIyYWI1dGhtbWsxV1FadER6ZWZsMHc4L2xTN1d3STNqbXAw?=
 =?utf-8?B?dDRPVjB4NGo1MnNXWFpiK2dSNWVRVW9iNHRpUU15dy9UR1BpemJTTDB1RHVF?=
 =?utf-8?B?WmRmNUFBTjZnNzF0UHY2aHMvdDZQUE5YcDlRZlJ3SFg2Q1ZZL0FZVERZZ0Vw?=
 =?utf-8?B?NVJSUjJSb0FrRUJrQkpxVGdzL1JiSXFxakV2eFpzejc5bmM3YUx2NjBIS0Jr?=
 =?utf-8?B?VTk0V0RWNnVtZHR1NGJTbW44R003VGdZNVRrdlg0TmovTFArbmFqYlZ0MUVt?=
 =?utf-8?B?VExpMFhKaHVmeWhReHQwWjQvV2xEZ0M2TUUwVTU3eE5hUkdDZ1ZZTlpnaG1n?=
 =?utf-8?B?bmVwUlJHVnpPVENKaWl5andQLzRpcmpkbDNWem11eHBtaDBlMjRDNkQwY1ZW?=
 =?utf-8?B?MllMZ01HWE9VQ3BEMWV3NzZ0Y1ZvOFlrS1dXMzRaNWJOMmRsKzN1b3p3bEM0?=
 =?utf-8?B?RGorSCt1Q1VYRmd0OTNVMnY3VFl2bm5IRWhrOGo1OGpNYmFnVUZ3WGZJQUZw?=
 =?utf-8?B?LzZMTC9mcXhlcjNaOFhyU3hGcG9jMHlOcUh3dFJldFB2amZVOFkwRE5vcENC?=
 =?utf-8?B?RDdrMWR0Zi9EL1hWeU9WcEJnelk2Y1htQ3E0QjQvRzdTSkZ2ME53aVcwVmJM?=
 =?utf-8?B?bmczSUlucTNNSUlzeUNhU3VuZUU2eUJpQm1YSTdJMmVOS25xc2QwYjZqWlgv?=
 =?utf-8?B?Q2tvdnpsK0cvNnZ3SnFFQzRTTnJYYzI3UFZLQitTbWlzQTRrZDJwNHdPdlZR?=
 =?utf-8?Q?1RPDB5hNMQcXUWfCDEDFP0eonuulH8KZsUiporQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f85d795-fe85-4617-1587-08d9482aad8c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 07:23:58.8240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YkR9BT5WmrlHs5OOHsiKcosskkvndFfxqu7ROu41igxqNT+cCGgAppaC/RtOrqtBEPpbctpI9SRlbefqJ+S9lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5599

On 12.07.2021 22:32, Daniel P. Smith wrote:
> The passing of an xsm_default_t at each of the xsm hook call sites
> served different functions depending on whether XSM was enabled or not.
> When XSM was not enabled it attempted to function as a link-time check
> that declared default action at the call site matched the default
> declared action for that hook in the dummy policy. When XSM was enabled,
> it would just drop the  parameter.
> 
> The removal of these values is two fold. They are a redundancy that
> provides little context, especially when the value is XSM_OTHER.

For XSM_OTHER I may agree, but in general I find the call-site uses
helpful to know at least the rough level of intended restriction.
E.g. ...

> --- a/xen/arch/x86/cpu/mcheck/mce.c
> +++ b/xen/arch/x86/cpu/mcheck/mce.c
> @@ -1376,7 +1376,7 @@ long do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_mc)
>      struct xen_mc_msrinject *mc_msrinject;
>      struct xen_mc_mceinject *mc_mceinject;
>  
> -    ret = xsm_do_mca(XSM_PRIV);
> +    ret = xsm_do_mca();

... to now understand what this enforces (or not) I have to go to
the actual implementation, even if I only want to know the trivial
dummy incarnation of it. This effectively extends the "provides
little context" from XSM_OTHER to all hooks.

Jan


