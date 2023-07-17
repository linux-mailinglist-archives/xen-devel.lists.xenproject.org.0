Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5094A755DA1
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 09:59:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564282.881736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLJ8S-0007oy-7J; Mon, 17 Jul 2023 07:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564282.881736; Mon, 17 Jul 2023 07:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLJ8S-0007mh-4i; Mon, 17 Jul 2023 07:59:12 +0000
Received: by outflank-mailman (input) for mailman id 564282;
 Mon, 17 Jul 2023 07:59:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hD51=DD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLJ8Q-0007mQ-K0
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 07:59:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20600.outbound.protection.outlook.com
 [2a01:111:f400:7d00::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf76bec6-2477-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 09:59:09 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8970.eurprd04.prod.outlook.com (2603:10a6:20b:409::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 07:59:06 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 07:59:06 +0000
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
X-Inumbo-ID: cf76bec6-2477-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJqFRbHGZ1O8rjoZSC2J1J4WmGC+6j25hk5kXLrNj6Bge2GLNA1Bkp2IEy3b0blmbe6waAL0oqU0wvLpcZoPOBdsmsS84pz8pDWNprKsvIbHzfq5fi1YyAgI0HECfUGOgn+s/ViLTwazKh2OP0EYwKlKDAfptDKCV8B73kiOQzfcmsQog9M2FNTEvI0cyBHsFJe2jPswUH23BvSQWZg4cmNRhLMWFDG09YlzZBRuNh3QVd9GfP3rMT5AVDd1EAmb19Gf72i8nNbGhxoDUkNHrV12AErXSKR67UZ+npJCOZvLfHsX7Fele4oO02uMihubpxbi8zcVtRqiNThoF78xUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15ePut3Ap2jogJhygcZr2RNjPS0PRbnl7OL8Wr4yxNk=;
 b=UJRwD8RLOMdj8dHe/EVGq/LNr4RI8DAH4VysJTBvkgmBxld9JVn9glHQLNDnR7z+w3mVRLawS1Xb6hVN9qlngbgRm3ZKhgnUet04unf8rGULYmhzcBjRov+Yjzgg5y44piA0AKzBflgfIN2FbS1o/U1AecdbnSjQnKUw4hJTMYlNj7p7fcNDyzVfZ8SYpiS0qJKq48yneuR4m/twboSgFp8DYzwq/CAtWcdURVikFtMRrcvfmKuFCxfyKBbtCgtpvhJivWZ7KUrf88r+Xo8LMhu4ggP2M3E40Av9KfHoU4TuelIp2BJPYA2pRIw46yrkv7ku/Rh84TBsYNbT9FVBtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15ePut3Ap2jogJhygcZr2RNjPS0PRbnl7OL8Wr4yxNk=;
 b=G6atolRfhYFwhN+TuH5CmWW0vfgAOwerCjDgnKpjr86wQhlgGhNwjK7AbpFoYPWMWQqlpr8QAnxA1bNjAHaxuLM0XnvH82hohYwXDW9f9aXDUksQSKuUy2InlB2rRZWQBFQV962lkFNqRDQLlWrIh1rnFsmsN4WT/nqU6GlGo6khjcMG9tgk9A3KEG2LVxS8sP07EBNDDNKTb1QpoOy0qKMJ9zI5baB4YxySdezOaTcbU/0is04RyHBd9IqTrzEKJKHnY8LUv1PERV246RUqSMLvonmTXGzPXOR1qdViYbFS0MF9II/bwdFOV8gXQjlK2er56/EeSD1DfbPbwj+lsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0b19591e-8679-f978-8d9c-6f0984338267@suse.com>
Date: Mon, 17 Jul 2023 09:59:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] x86/common: Use const char * for string literals
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230714110009.3004073-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230714110009.3004073-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8970:EE_
X-MS-Office365-Filtering-Correlation-Id: 600f2c35-8827-4ec2-52aa-08db869bb1fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Us71qvqRWH/HjRgvi6UMSDe5cfVz4kPgW4FPiVAQVnOr3xPgfE6sVeywUSaEYDp/Xx+PQ3c6jHYgBwZlveTrCHg1XRnXRuHar54wAazSnXKg2t4wvpR4e7x1oPcVDo0L/MrSNRa+YLyJjK3Wl4zOVMQBsDZ+285gdCmTfXWuls7Bt/6FLdAyOLSlQVIMnBlf0dzqH4dOQEFsGzD8O8C/PHz4mYgoB6+HlWHpIsYCIkoR6P0v3HIL10vYYmRO3sX3sivXMCOBotzpRMXE+aEmhfNluNcSbCnIb6GY26AQb+oM7WOwTmqKCFbI90y2bUilJ6Fo4jw375Mvy4EI8lRGImn2fUSd0B/c+UgKczqtV3Pj6GoXWQ4GOPdHJEPta5IvU7FDpqdsuR0ptqxfLDVJ62MPw3x5o2kExwBvvaTsEZRKYk7yDVA+jzyv/MOEhD4CFxpTKKeBluHN5MBzby2paQcVLiUMnAJH/IZ2xvFXSyN716ayx3cuVTJV2/wpCCEaly+yM7+e9ZqrUkcZbs2h5O2lZK7YnjNHk6Mz8bUCNlWv9z7ND69AnRImUKIMXn004l/er4gdLfT520mKhZHAkmdB0FhzOUS7kkNvWO2+kXpjwGQ+8cNCv9ojO1sHSJZ3G8XnAxNbRPJYnS3p9Noiiw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199021)(6916009)(4326008)(66946007)(316002)(86362001)(31686004)(38100700002)(31696002)(6512007)(6486002)(478600001)(8936002)(26005)(41300700001)(2616005)(8676002)(66556008)(66476007)(186003)(5660300002)(6506007)(53546011)(54906003)(2906002)(36756003)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3VNMmlQdG8zT3c1QmZLbU4vMUV0YkE5S2E5eXJvTHhyT21jeXJMYmNCSlIz?=
 =?utf-8?B?WU1zQzFYc2VNV1JqUlovUWpRVm9PeDEzV040dzV2T3h5K3hZUityTlhORlk0?=
 =?utf-8?B?dnpCK1dwd1ZKcnN1Sk0vOGx6dHJnUUV4R1AxYzRqSit1RUozc3UrOU9TWDkz?=
 =?utf-8?B?MGY5OWZtOCtoekcwemtCMmpvY2tjUVJJVzU5Z0NyTU9WeURsUGlWaEppdThS?=
 =?utf-8?B?elQ5MStJczUwTG1NTDE2Kzd2aHNscnB1dUQ2QUIwQm1qUnVlZE96SFNaeGdB?=
 =?utf-8?B?Q2NtV2F5Y0lQRlJEOTFpWFdheWlVOEpmR09FZXlHUDhIRTNIMmZjQTBxMHV5?=
 =?utf-8?B?b3VCQXBybG5VVHZUMWpTVkFIZmFzdzdKRHN4bjlkaFk3ckt4ekw2dVN3akto?=
 =?utf-8?B?ZWFWRGF0N3pha1pTdGYzVi9paVRJZENNZkREbFZGcERJL2NMZy9wY3F2dnRB?=
 =?utf-8?B?bG1MZlh0R1hFd1RHS05sbGFEOGovWFltM0ZlbElkNXhoUkpaaHE3bk1jTTVl?=
 =?utf-8?B?L095Y1B2ZUJCTFBtQi9Gc0tiYlJweXVpbmVacGdJa0JkaVRVZUhhTjY2UnpH?=
 =?utf-8?B?eXBaaVNrT1hsYlVPaVpMOUErNk40ZmNMVmFKZEdzaWlTZE9tWEFpTlIzTW1D?=
 =?utf-8?B?NUxvRVI2OWw4dGtaNHhEUlhFVktWSGhNbWwxRUhhNXhHdlltd2V4aThyTzlD?=
 =?utf-8?B?WDJ6UE8waW5vUWJsd3dvc2xQS0lOT0N5YlVsZVpTSndHc0dlMWtoVm0vTFc2?=
 =?utf-8?B?eHM3My9nbHJ6d0szdENHRVVYUEdWVS9CTGZhZTFMc0dXZWdHTDlVQWZXd21R?=
 =?utf-8?B?ZzY5RzJSaWhJeTBnUWZzUHpRa0dFYyt4SXQ0eTVoQ294dUR0aDczUWZJTnFq?=
 =?utf-8?B?c2t4VXJWWWNzZTdOMFhMbzI5dUVHQk9UMEtDakhpUHVPOTVOR1pHdFJtZ0Nu?=
 =?utf-8?B?ZFUwYWdQSGRUTit1NEI4QXFiK1ovM0ZKeHpuam1CZC9PZlZ4eHc4bmZmblRJ?=
 =?utf-8?B?SFhvWU4xemlKeVNONVp5ZmFxUWd0bDV3Y1N6eTd3MkkrM2dVZWd4UXRQdmN2?=
 =?utf-8?B?dnlpMjRkZEVjeGNqWVpoeXVOQjRZRnpIZlp6Ym5rV1RKUDl2K2tmZTBUNzV5?=
 =?utf-8?B?UTNLeUZvN2hwVTR1czkxTUI3OVVmTHpLYzkzOE03Wk5uczZ4SWRKV3NIMExT?=
 =?utf-8?B?Q3hnaGNSaWdxY1FBbGdNMkZWY1o5YnpxS1FuaWF5QXBjSjdVemlkcGFsaFZs?=
 =?utf-8?B?SkpYTWxSbmNmazlqOW44eUpzNVFMZnVLR21RVHhzblpQUmxJS2xUSHR4Z0FN?=
 =?utf-8?B?eGZmOFE0cWQ3dm9KcCtjQ3c4aU5oSGtUbGwzRVBlTkpteDhHK1FVL2h0OFFK?=
 =?utf-8?B?dTZmcEw2TEZvaGJSVXEyc2Nnc1p4MjRYQ2hLcTNENTRlb0k3VjBXbEhZazRE?=
 =?utf-8?B?STJXL04xTTQ2NmxwSk1GOEFkemY4aFA3VzNNZlBKeG8vcHltTmhGSXhjVnQy?=
 =?utf-8?B?aDJySWQ1VjFmUk1SblhZUmoyV3MyWm91VzFKZWJ3L1BWdUJ3L1U2Zy9ZRExx?=
 =?utf-8?B?SUtzT0EwV29NMmovQzBTTFU5V0lEaitEVUcwTDdpcldzdEg5c3BXKzFlRjVO?=
 =?utf-8?B?bW90RnUvNEFlNXhDQzZoK3ZPN0NucW5QK3BGK1pLY1VxdENBWTd3cGhkanFo?=
 =?utf-8?B?R0JrWEkzTWlTc3hRaEZYdnR5c2xzUVpsZTk4NFgwR2xxVjB1aUhGd1JyRlQx?=
 =?utf-8?B?V2V1cXcyVWtqckxPQVN1R1kra1dMaFp1WUVHZjE5ZXlnYWFZWC9aUFVQSHVC?=
 =?utf-8?B?bjgzUFlxU3llbGJKOVNWS01JTElMRjB1RE91VEd6NmIybVJBbnc2MFVza0hZ?=
 =?utf-8?B?bGdLZHpRUUt0QkZWZ1lob2tiQVV0bGRkb3QwK0daK01wMnM0LzVJSkhwSXUz?=
 =?utf-8?B?bUs3ZFFkRWZjOTM0eUlITCtqRFBJbld0TE93VGEwNFlzaDNqYkFOTEhSaEpE?=
 =?utf-8?B?QlRyNFptelpTMnYxcVk3SWZUNnlDaUtONGNtenVRNUp5VDhZMW5wcEJ4U0NE?=
 =?utf-8?B?YnhTSFc5WjV0ZTY3ZmxCZGdydzBHdG9OT1BrMTljdk14enlZbkd3aUVJRUJP?=
 =?utf-8?Q?ye6ybeCzpZUUVXPycsZ3BpA1A?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 600f2c35-8827-4ec2-52aa-08db869bb1fd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 07:59:06.8359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iWKqcx7NlLUj6oGM6LccHgJBr6lYs241J5/Qk2FzYHhcEBJcV3zIad9XhRbAEFiKTWW5iJ5Ut/UbKliz4ad0Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8970

On 14.07.2023 13:00, Andrew Cooper wrote:
> For pre-ANSI-C compatibility reasons, string literals have a mutable type, but
> it is undefined behaviour to mutate them.
> 
> Swap char *'s to const char *'s for variables which hold string literals.
> 
> This fixes several violations of MISRA Rule 7.4:
> 
>   A string literal shall not be assigned to an object unless the object's type
>   is "pointer to const-qualified char".
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



