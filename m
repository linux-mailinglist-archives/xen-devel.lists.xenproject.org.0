Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E59772493
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 14:44:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578358.905824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSzbC-0005L0-KH; Mon, 07 Aug 2023 12:44:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578358.905824; Mon, 07 Aug 2023 12:44:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSzbC-0005J5-Gk; Mon, 07 Aug 2023 12:44:38 +0000
Received: by outflank-mailman (input) for mailman id 578358;
 Mon, 07 Aug 2023 12:44:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qSzbB-0004rp-0n
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 12:44:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a2da328-3520-11ee-b27e-6b7b168915f2;
 Mon, 07 Aug 2023 14:44:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8606.eurprd04.prod.outlook.com (2603:10a6:102:219::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 12:44:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 12:44:33 +0000
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
X-Inumbo-ID: 2a2da328-3520-11ee-b27e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNJnj7wyJtGM2Osd7XA4FzhNENXaOhbZeD7OPMgC5aHcy6ryHqgv5ONFKtHiBGSL6tUH2awXKP1XlunkHiqrHUfGLnf60Fc1lxTSx99TlFJKezPp6h1AjH7pYdZTalwDMLydq7ilSTQb7O29Z2LglP3cVwqizh5lubQKWwXIjFX2oD8p50SA7/A59jQDN5a0sB4CRRaKWzBfz5xjK/7OgpWxk+Q4sFlN7mFQtO8gGL2y2zkDVXwVIVfVwFBoEVZUms71K7mmfXCHwnJZiNjnpgBBNKRprRYDxHmUaOCIYmvoQIe3OxPFCR4OKJhrdn9lVVlDFUJBCccdv2THTGjUhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kMC6kOdnqVsG/Dilzf0A/0ussROHfjFtc2W89H0nh4=;
 b=c72LsioPg+QxTGBkqh6F8rxy+d2ahTAx5JCkkV+haTir6rhgrKFLNIYi6GVs8meqMJo72mxP6y5+dDTe0oIbVbt+uL+3TS8QwKYrKjXzn2xjLnI0rzMtdqqF/NmBYQa0OWewR6t0/j1lGQjKlTYE17O5GeBPvngPbvNrIg4YQNr8W76yRwmQE1ouYqFeZK0VLs3MlGo8JBCscKo3Bz3yY7YySfn891DovS1waZG1VgIX97O3+qAqzaDG4BVxPf34mp0GFwC9OxY7gJ1l6TvAhKnZ0poVzjmCbohJbc8+HFVxrc3GAQEyqL8QMuIMWg3dPpKocUcLGUzYPQtlUbgwtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kMC6kOdnqVsG/Dilzf0A/0ussROHfjFtc2W89H0nh4=;
 b=UBrbH5pDNLwF7Iz8KCDTNhuj953hxWhxO0LXkOhTin9kTUtOBTgM2U8wiUcaz8dr9B5P9GhJYw4LbLgja8M5WHouEx+IlczaXHjM7NaTWT6VSv8ouFu93Uzfypb8pxOnC84JrFq4N9d2zwEFnYL/Ny03FXA+rUFBwOBj9SwuDI1c3tQnVBWZ15JXu9fzLkEMzwGdF83QEybsIaMeI9jaD0MFW/vLiDE3Yik27VfA4edfQKVPC+4hYttbZSbR95zKJCAO6aqfei/AjZds9HiJlkDeeG3+8SsnJZ9TVGNX7AmftuldZ9IUDAoa/JGAu4q0xpldd0os+Juh9/utFs7D7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9f2772b3-ea3f-7f7b-1a28-7f288c9da7dd@suse.com>
Date: Mon, 7 Aug 2023 14:44:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v2 1/4] x86/mce: address MISRA C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1691135862.git.nicola.vetrini@bugseng.com>
 <8a11baf39c140af9d5694298e5f1f0bf59ac0621.1691135862.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2308041343140.2127516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308041343140.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8606:EE_
X-MS-Office365-Filtering-Correlation-Id: 195a2520-ca91-4d6b-4622-08db97440cf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sV1L+w5wjsLorIsKImM/z93sjgGOBt8HM9UcV1QXa7OfUwhD5+01FUuhocHtVkXUePMTS+ByshT7RBcT8D2TVoqVRYGq2INDj6gRDYtEj2U31k6Qy+WK/ZxK62r0Qs6R0QZ9LNdrrOICRyZT9cOvtQOX35ulPSeEDWUg99Rqu5FTfZ9+sVhGw01dzh6pr891DUe5d9emLag6fYKSVEd153eup21p5FNMz7WedJvtrgCkBzsK5I6JeaQwNj/6LOqilFLXg+cFelVkT4YvVolDjEFWxfjD5ZpuRTkSy7ckq6k668OpDuHiMrt6fssTQ/p1GzUw0kirzjbrJiYTqfsQZJa3zlGcY+IoHi+YiFSLNtCP01q5zilqLxodPzAEmW2pU/UsJVDmIleOdAusq+g4ShXrqpMi+xk4sUJwDrh2TATHtlI7BKjCNn/yeQ7tGBjlF4ugpY4ebITVHwttuxSAxhQHWiL049WmXmAG0UsHFtniKQvAJT/HFFC3+VJSMweAtc/Fa9Q8WmgF8EjqrIxfyO0pfVc3J0yAfwlYFHqCvcXx0JSAPgObUVFxdOAe+NE0KGnx4sk4lkdIViQ/OUJdJTM1avWgs7xdspCZa9Gwj5yjWswo3S/SWL1VS3t9GiqL2LS7H80jd/gvCOdoXnJZOQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(376002)(366004)(396003)(346002)(451199021)(1800799003)(186006)(2616005)(6486002)(6512007)(478600001)(86362001)(31696002)(26005)(36756003)(6506007)(53546011)(41300700001)(316002)(4744005)(8936002)(5660300002)(8676002)(7416002)(54906003)(4326008)(2906002)(6916009)(66946007)(66556008)(66476007)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2Y3Ry9yQnlTMjBqWituR2FaQUVJQ0N2MDdCVXg5c25UTFdZQ1BoSzg3QjFZ?=
 =?utf-8?B?aThNTHQzS1lzMzFhRWpOTXZrb0Q4K0g4NU9pUFNkVjQ2cXlndUZsQXdqcGVF?=
 =?utf-8?B?SGU4d3NOcGdWQm4rL2x3VStZdUVqOWNzZWxrWEViTXhMZVJlVEtoNFY4MWxp?=
 =?utf-8?B?TG85eEpvNHpnSGlJUWttU2dqS2N1RU9uSlptaVBEVWNBNmpRcFpFWUxFWWJS?=
 =?utf-8?B?YjlWUXJCaWJTaUhVY2IzZkFXLzdDK1BIM1d4bkR3SVpGQUxlakNNU1RuV0F1?=
 =?utf-8?B?SkdpV1d2bkpNSW9HNUhYUU5uNmFpeUpsU0VFaEhDZkkxRTZ6cHRlSGFqdkc3?=
 =?utf-8?B?ZG9vN2I5YmhYWElIdFBOd3ROWFFJMUYvVlpqY0FaUE1qZXR1eTh3RktSMjF2?=
 =?utf-8?B?WWdZUHg4WU9lSW01UGtTeG53MlVoajM2TCtuVWYzNDRnS3N1NTVxVWtRendN?=
 =?utf-8?B?c3IrcEpldkI4REFKWmZoZERYM3hLMnM5dDNWc3I1TFNEVC9uQVRUZXI3d3NV?=
 =?utf-8?B?ak8vN0pEczd1d1dtZDkzZHJhdUZtZ1ZZcnRWUUM1WEtMUzRsRy9IZTE1WnVS?=
 =?utf-8?B?ekRTUzZvMHo5NTlzajBZMDVnT1FRMEgrRG1ZMGJ2MXRkMm5uMXpUZi9QVDNz?=
 =?utf-8?B?UGM1cEdzeGhtMWNFRCtFYTlEblNOYzY0Qk9kSEVud2M1VUZwVHZYRmJkWWYv?=
 =?utf-8?B?dVNIcnRlSnoxVFlDZ2JoNGlldnR6N1Q5ZTNOaXZ5a0xVaWdoR1lhajNadVJo?=
 =?utf-8?B?YnBaVVpoUzdySWRBTUFsZjA5cHVSNVBuNjBPS0ZxYmQ2MTd6U3ZVYkFvem5w?=
 =?utf-8?B?VmpQZ2owZmFHRng3bDV0UEpCM2g3SmRIY3daNWRDUjRJOU5PRGhHSWZiUXQw?=
 =?utf-8?B?UmVHU2FUZklKeTFvaVVIcmh6UDU5aEtrNTN5WndnNHk4T3RzTGxyd2FScDQ2?=
 =?utf-8?B?YWZBdmlyRmw1UlhCZldrUXpZNmF1NDg0Ny9zQUQwd2QyakdKUjhueEFIdzha?=
 =?utf-8?B?eTEyeVR5aEFVK0xQd08rNFVuUW1JR3Urd3FFbjdqL1Z6QlJlQVI3a3BTSENu?=
 =?utf-8?B?UUJOS2dZdjdsVWRhMzMwb0JiTG94cElaN2grdGMrZ1pQNTFvd041Qy9zRVZC?=
 =?utf-8?B?WW15ellsNnBxMmJmZ21TTmRxYmdhSUZkcmFoeUd5WnhkNUlBSE04UXpxa2pC?=
 =?utf-8?B?eEprM2VpK0RlNUFnOUNTTEdrSmJ0ZG93a2ZsNEtLQWZ6dmNUbjhXWk01SWVn?=
 =?utf-8?B?bnFsbVJiekpKYWJtcUtYN2ZBNzQvck9sR3NSRGdOc0RweWg3N2JDZXFrVklI?=
 =?utf-8?B?azNiNkN2ek9QK3VjWmV2by9wemxIZU12V2JpYzRvTUcxcElOSmh1bExIbXdH?=
 =?utf-8?B?SFJXckV4QXhub2xkb1AwS1loQkZIWk4vSEYzM3RaUmFrVjBXTzNza2tTOEE3?=
 =?utf-8?B?T3c3dG94RWdzcC9Ec1AwdmNJYVgrYTFYem1CcjVYQ0pKcHBZU2hpTEZFRnRn?=
 =?utf-8?B?RDdrWjF5Vk9yOXNxNVRnWlkxOFA1bG5WVitvR0RNZVZ3WUhUVEVrWmpZTWd6?=
 =?utf-8?B?MkxybXdEWWtuSlpYYThvalkrbEIxTnhuanpETTg0eU5KVDBVT3hyOHpkcVMw?=
 =?utf-8?B?akJlVGsxVitKbkJJeTJ4WVFJVEhTQ2I3Qmh0TEtpa2RlUnhSRXdVa0NtUnhu?=
 =?utf-8?B?cEtPdDA0YTQvdVplUVBXL0ZSdFB5czNiNlJ0SHAzdkpuQ25LTXllTkk1WGZ3?=
 =?utf-8?B?K0V1ZXZsNzVYWXB1RGFTN3dDUU1nd1dQQ1BJUzVLNnJ4U05OczAzREVaYjlT?=
 =?utf-8?B?bUlZQWs1bG1ROWtFV2p0aTJ1VDJTaXk2dDlvajJUWFp2ek5ycC9SdFVXMU1V?=
 =?utf-8?B?L29KdzE0NTRKalZOQ0JsRWxFRVBTSmVmeEtiaW9rcVJLMzlLVW1OYzRmS1Fm?=
 =?utf-8?B?WndmajMvT1pnT1ZOWDlNZ2lEa3pKS1dWV0Uyb1lIanFLV0diUnNJcjByaXZn?=
 =?utf-8?B?Vyt0VFpVeWcxY29xRlZndVBoeTdvY0ErZUFDMEM0R1ZDNjBTbHV0Y0pWb1Bv?=
 =?utf-8?B?OHU1OEd5d1dXaVFzUmNpMDMrTEl0K0ZEWTI0RktHSkpscDR6bVZyYStaakhu?=
 =?utf-8?Q?w4FF0kflzzCNGJWzFLPHQlqS2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 195a2520-ca91-4d6b-4622-08db97440cf3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 12:44:33.4816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJn0P6RqQL6/VknQuFyG4Ljji5uwJfY0lY+ZvOQfXrrTj2am3JO8VMs+TvX8YoD98vtPM2mw8NtyhsSHzo8BqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8606

On 04.08.2023 22:43, Stefano Stabellini wrote:
> On Fri, 4 Aug 2023, Nicola Vetrini wrote:
>> Suitable mechanical renames are made to avoid shadowing
>> the function identifier 'wait' declared in 'xen/include/xen/wait.h',
>> thus addressing violations of MISRA C:2012 Rule 5.3:
>> "An identifier declared in an inner scope shall not hide an
>> identifier declared in an outer scope"
>>
>> The parameter name 'bar' is added as well to comply with MISRA C:2012
>> Rules 8.2 and 8.3.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>



