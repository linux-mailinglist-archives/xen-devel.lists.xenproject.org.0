Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A41F39D9A3
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 12:28:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137802.255253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqCTz-000574-GM; Mon, 07 Jun 2021 10:27:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137802.255253; Mon, 07 Jun 2021 10:27:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqCTz-00054R-Ci; Mon, 07 Jun 2021 10:27:47 +0000
Received: by outflank-mailman (input) for mailman id 137802;
 Mon, 07 Jun 2021 10:27:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cRKJ=LB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lqCTy-00054L-JD
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 10:27:46 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a915068-90d6-4975-9e1f-0da3c125cd7a;
 Mon, 07 Jun 2021 10:27:45 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-3-1W1l-NOQOIalCK4o3rJGpw-1; Mon, 07 Jun 2021 12:27:43 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5743.eurprd04.prod.outlook.com (2603:10a6:803:e0::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.26; Mon, 7 Jun
 2021 10:27:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 10:27:42 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR10CA0016.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend
 Transport; Mon, 7 Jun 2021 10:27:42 +0000
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
X-Inumbo-ID: 8a915068-90d6-4975-9e1f-0da3c125cd7a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623061664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dKwAgnJR23plKmVqZD3sWQzVp6oTZLsCnN8BZvndX7w=;
	b=b/zNU5z12BgNgKvPTppHXYXtq7LTgBeF+Q9LUizhbgUxUp0cC1lx6EfmY1EDd1d2xvX8fc
	ytQMh7Klg60YtkrVVk18eqhL4y6E0xMQbzbMGwR4TBymRIdpJdms12il8DbZXatiOZ7ALa
	bfS9BK+fq4rF0dMuoH2d9G7AvUEvrT0=
X-MC-Unique: 1W1l-NOQOIalCK4o3rJGpw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXn0+5rdSDYCEinEqrVn10+s7O9Z9ktrLCqn6TBWI491yTyzRJt1xoAObAzeujTsoDqXJsUm2J7FMbu7osjij2Wy+ihFCg1XzN0Oo2mTNVa2VtdwE0xeaLOv4xuQ6IqF4kPRi6ePPCVFdXFdRHLabQefnPY3PTCOFadLbwMbBTD8MYIttFOU+Zrz69L8Ykj0P/nYB1s3p/TfFZKgH/e0Hu25phapZ/jX44UqLsQQSSh5GeCQnlJXrbLsaOff5G2A8CuJ599GUSsiZxLBizfgy7UmuAT7ffXXsVDiKLNtEz5dq9KuBWLkCMBc8L1UlbaHU0wjmqEgCsYpv3Pt8vpFTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKwAgnJR23plKmVqZD3sWQzVp6oTZLsCnN8BZvndX7w=;
 b=dZjLxUIHtkA9FYUt79nhvdAu3SBvxH4rY+PuPLDEAfSAkL+CM9mMk5CZJsfrKzVbCTdYKbpAePRpixd/aNEh6MTvkIRkGH/RMlGka5zNLzlofSJQLKmxAn7ecYG/lnmkbo6Vd/l3nhGDoDZEeUhE4tExBbzMO0jKH6SPshlaMS7PJckNYsBdwhECcPtJ1DC7Us3rI+lO9Ix5XjpY8VJWHN4CH4UFnG1IgnHITAAvTJGKjJ8wjkL+TBc8G4g39SzovRpOzcKdqLWMkque/NLLjGWrxg8eGegjKePBzU2hg/Xktr13oRqYYkHzTY2vN7i/jZYp28NdT3p0koNB7LnENQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: Ping: [PATCH] docs: release-technician-checklist: update to leaf
 tree version pinning
From: Jan Beulich <jbeulich@suse.com>
To: Ian Jackson <iwj@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <adc2ba4f-81b9-9841-a53c-8c52278ae62a@suse.com>
 <f60da828-ed27-abaf-0301-559cfe017201@suse.com>
Message-ID: <41f6ae32-4704-a580-f103-9e1e9e51330f@suse.com>
Date: Mon, 7 Jun 2021 12:27:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <f60da828-ed27-abaf-0301-559cfe017201@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR10CA0016.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c78ef54f-a585-4925-976a-08d9299ee22f
X-MS-TrafficTypeDiagnostic: VI1PR04MB5743:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB57434A41DB0157DC52416AC8B3389@VI1PR04MB5743.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RMqiCsU3jAKw3Qta92pHJ4ACJ3zK7A+X+dB03uidV1hpYnSl4ZRaPvn4uDwaOhX/ZAZy1PhQa13zFDpqILa0kmpvrdN8CsPg/5vh/EqxXEM4x4IRLbNkX4S9yk+Rbl8ln5URaO8JLOuMfpJPuxt9Rzfeg7SF2GMZzM7HjGDMYrUYaCALuFbdZ2oAnkx4VW8gErvY3O/ULy2D/P9tb5F5XsTnqlm5UDyU9WTth9VrALyqiPX3oau80oW69HTS059jCHX2EvrpHJFhTgdILfPnl4lE0QnnPlKiAFD76sWzkTPpzaiItRi7sIxz83dUgTyVP2ToGvcRNrGBdEnLsr4a9POCdkUp7OWFF3cZuDk5KZ8m4pHal/ywU/E+7qo4oM16tuL9iMfZUeuLfNidq8QQL2e6R0uyq9VOzUp7trMUxu/OernTEcu45QSTZFX5sVQaeG/pFD4dSG6DPFxE9OQYhXCmIInDSa005xrZfyERCErFW1mU3bORbHn7bM0eaZbPH5ukVeoMDMTKJrAiTTOI+OoXUAIfno4CBWRTjQTXoTwmy+PfiBTqpHxVEuPtR7MMOupwVd/ca7X3HC7wrXTWyYoRnF66X/6H1av3ozibjEjnrpOGnVRaaw5aSi1IvBiKimlvjcfIE5pT0j6h0NwibIe6O0bf3ejN7G1dxl2o6Q58wUuR9yKTzH2wIQjbJBAZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(376002)(396003)(39860400002)(366004)(16576012)(38100700002)(86362001)(956004)(186003)(8936002)(2906002)(6916009)(4744005)(83380400001)(478600001)(31696002)(54906003)(53546011)(36756003)(316002)(8676002)(26005)(4326008)(66556008)(66946007)(66476007)(31686004)(15650500001)(5660300002)(16526019)(6486002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?ZjAwNlIvOFhoclc2QUM0Njl4MENmeEdrdjJXcXhEYkxjZ3JldkhMTXRNQ2lD?=
 =?utf-8?B?Rlk4SjYrQ2lQVUtlUkJONzdYRnpNcjZIckgrbmtTV1VnM25CdkN5Y21KSHBZ?=
 =?utf-8?B?anZ3YjRKaDFSRTdkaFlSaEc0SHJVY2tUbVA2djZlV3Jtc2tRN201ZlRKSWxB?=
 =?utf-8?B?dXlseS9WRVM5WjNadFdYNGVjVU1GQnZFb2NqcU9YMURDTTc2dW9oN0Y5MlB4?=
 =?utf-8?B?dzdDV081ZWk4WU5zbmlLQXpKZS91UnovV01XSW0wcDZOWkpvZ3lZY1FETFpi?=
 =?utf-8?B?b05RcmxOcEFsOWlOV2ptb3dBY09XZkFlbUliU0lwNlNBNjh0THhnMllhc0wv?=
 =?utf-8?B?NEhCZktTbFNUcUZWUDRud293SlZIaXFMd2l2cDlWc3pQNnlTNHphTWk2ci9F?=
 =?utf-8?B?VGV6Kzg0a3ZPdE5QT1YySm52a0NXdmVHZHJpQ1FEME42eG5KYnV0UnM3SzlX?=
 =?utf-8?B?eXdNV1RxSSsxRFoyRW9BdkJsZU1MYkJNYm02RC9hb3dQSGtxZHBlcy84YVJW?=
 =?utf-8?B?aHJCNVpRN0czQXZQdllpcmlHOVJDR2xQZnZBSzdZT29BVXp1VmM5aURsZ2pp?=
 =?utf-8?B?T2dhQzd3dmRuT1doT3ZMc1dhTmJZeU1wQ3NrY09uN3g4azNjeGk2WTZPMFZZ?=
 =?utf-8?B?NUxLVXZianNLYmdZTHhHempZSDk5K201TC94V0VuVk1hVTV3alp1T1JzdXMr?=
 =?utf-8?B?TFp4RnFFcmpCUjJSNExTMERTNyt1QythY0t6UWlYNyszaWp0S0sveFYxKzdC?=
 =?utf-8?B?WlZNV3RpSDhMQlFTY2hjSnZpTnhqVmMrSFhnVjVSSi9xQ2pvN1V3TGNNQnRh?=
 =?utf-8?B?bWZlSHVJMVpRZm82THRKa1FQZUtvT1JXU1ptSkRmS3hWUWxmSWJGUkxLVFQ2?=
 =?utf-8?B?OExrZWZnQ3dHMFdvcUZiVHNEWXdJNDBDZEJGOXZIL21TZUVyN0FYaTJXd2sz?=
 =?utf-8?B?eXdrSEU1MEQrdjV4OE9lR0QwS2RxTW8reHNZVTArQkZWR2I1b1poaHZLTEhY?=
 =?utf-8?B?WmRxTWxQdkFMaEphRnVtVEJzRHgxT2lIVkU5Mlg5NmlCSDhlSjFGcjhMV1dG?=
 =?utf-8?B?ODAyUG1Xc2pqSDJwbkZlcnp6eHNCQVpzMHZNMi9oSTl5UHdnaWhYeWFEMnll?=
 =?utf-8?B?VHU3MXdiNW9iNkNBOHR3KzhPNFZyTGY0aWdVcjZTZXNjS3FnMU1MaFQycU9J?=
 =?utf-8?B?Z0pybDRGQm1TMkhoZHA1aHhEOWhpTk83UGNyRHpXQXA0SHhpWmVwTzRKZ1pZ?=
 =?utf-8?B?ZzE3WVZsY2FYWlVyN3UxdHhRRFBabkVoYUFZckZlU1VxbXJlT1FhTlI3R3RF?=
 =?utf-8?B?VUhLeWxmbWhhZ3p6OUlEWlRiUnE0Zmhqc2pKWkpFaUgrWXFlMnk5dExidFpa?=
 =?utf-8?B?dHFDdVBaYXBGOGhsYnFzbi9yNGlwOURHbEYxUEJyeVhkS0JDcFlnR05iU2xE?=
 =?utf-8?B?alZyaEtqSlI4a2hOL0F5V0ZXQnpscE9jZWlxODY2OGpUdk0rQUEwMVZLMXZx?=
 =?utf-8?B?b1JwUHhJQkNTbzZQVTZZQy9Dd3psVndYS0NVUE1RRjZJL0laVWxWWmF2ckNs?=
 =?utf-8?B?N2VUdUJxOHArREh2MW05eW1hLzExWmg5bVFxL1NNVDZsb1FoNXY3YUQ0c0xS?=
 =?utf-8?B?aFNsYTNaR2QvdEZnY1hYbU1ZeGhXZmpMcDZxUDB1cUJBTlBsVGRmS2E2aFZr?=
 =?utf-8?B?L3U0UTF4SkwvVE5IcmVXYndOUDE0d0tTSU4xZ21HNEdXSXhTS24ra2RZZHNp?=
 =?utf-8?Q?tDF2zLzeN4QpChsUt6r71j/wVtMfeT2scF9BhYI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c78ef54f-a585-4925-976a-08d9299ee22f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 10:27:42.7046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CxcFr7iAiGghyK+/3UaJ671FaI/MSY2Y7dc+ps10U+yZc1BHDzXbzx3dFauU5X+NaXnrK+Sq2f7xrzYxH/n01w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5743

On 27.04.2021 18:01, Jan Beulich wrote:
> On 07.04.2021 11:56, Jan Beulich wrote:
>> Our releases look to flip-flop between keeping or discarding the date
>> and title of the referenced qemu-trad commit. I think with the hash
>> replaced by a tag, the commit's date and title would better also be
>> purged.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I've been noticing this inconsistency repeatedly because I simply re-use
>> version update patches for the stable trees - the context mismatch
>> results in a such updated patch to then not apply, due to said flip-
>> flopping. For 4.15 I'm inclined to drop the two offending lines perhaps
>> while updating the version to 4.15.1-pre.
> 
> Ian (and others), any thoughts here either way?

If I don't hear back by Wednesday, I guess I'll take the lazy consensus
route and put this in.

Jan


