Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E203A7DD160
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 17:18:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625947.975758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxrQu-0007zR-I4; Tue, 31 Oct 2023 16:17:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625947.975758; Tue, 31 Oct 2023 16:17:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxrQu-0007wk-Eu; Tue, 31 Oct 2023 16:17:36 +0000
Received: by outflank-mailman (input) for mailman id 625947;
 Tue, 31 Oct 2023 16:17:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yzb5=GN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxrQt-0007wc-2f
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 16:17:35 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20612.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fee3d2d1-7808-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 17:17:32 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8937.eurprd04.prod.outlook.com (2603:10a6:20b:408::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.17; Tue, 31 Oct
 2023 16:17:30 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Tue, 31 Oct 2023
 16:17:30 +0000
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
X-Inumbo-ID: fee3d2d1-7808-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPgl5Lk2ewxoZCfeaWuhOrE8R68P2ZVlHQaB6yBRd+wUXbFJHYOu6EUBz6CyJUaivnPDZm3/umT2FYj8PhS3o08FnSXhI03zwoSBgt1Xy3/BVhCjo45ZmBmWZk3nLwXYoeimTPd1RRyUCG0iI7neZbtUrOo7mP4/BZ8jwz98wpYjnfO04eXwQRqnD/j6bzDg3htcd+iYXFPSOhh0vobbP+4ccTtc8VOTpvqP+HL6gx3IVd+ewZd2ORVWhFzXSQD1seoe1Zi0+ddJE631TY+B/a2Y7K9mu/S0408mNWBJcs7wCq+ImVCPk1cYSSMVtUHsr9Y9/IAzFylVWfetrjDVCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bc/QMeuhl6E+g2BUjdQYMNPlwlIAtfBkyk7innooNDg=;
 b=jL+OkJQ2CeERsSXSGOk7HhMYcWhX7XwsR5G9gRGlsZOh2BdcgOYU8HyM+HwDzf2aaAI0IETCcZbJV83hMSELZRe2I638yHW4gP/CX+lp57rFz13JV4KQnuOWXu/nFN7sVqDnTySl4ctzAOpWx5aHx/8eIcD3Mbsx7LMTn6bNtpPwncLVpvRZ++jCntLXv77BOL35Kwvu6NVVO1tdegJQjsKIWVLII2P8hcTPiKT3bFKXyXTt/NusQIWEd6RfiUSldiaRd7icN0+kyMgiph2/Juahw1fF10xrNX4jPZMxTvo+03p6JDz9LziOLzMgHnH6cItlwv3jj1wnmeW9/9JXqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bc/QMeuhl6E+g2BUjdQYMNPlwlIAtfBkyk7innooNDg=;
 b=a9VLOH7WVzWuFBBda6CjlDhTRPINOcrMW++VOs2jTj3W03x9rsaEqSKKh8t1ecjFQQuG49HsqJVXqZGIMEyvxvuT0rGMbay/e8YbZ/XEpWDAmpatHFfqXvPW9id/0kuT7JdWkplX79s5qLFJNH44fFjGU1mNJVS9nLTHzRWTHEO31pUGaMQnTxI/Um5/6gt+Lw8TiXDD3gmDlQDWqqdj0mrEKvnoVeXgrd1KLHSLupewyNtEcmiIBPCR23+AbPhjyuSP6+3xC0JrCebxJide97V7aOWW/dclmFdO9CJ4VjUxFC2EtwLxPkjUEsYqnktWjLhePc27I0HbyuFhiED4rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <738f6c5f-3d09-a107-5585-f886d5fa149a@suse.com>
Date: Tue, 31 Oct 2023 17:17:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 4/5] [FUTURE] xen/arm: enable vPCI for domUs
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <20231030235240.106998-1-stewart.hildebrand@amd.com>
 <20231030235240.106998-5-stewart.hildebrand@amd.com>
 <2f828bd2-e6f8-15b5-b226-33e2b33ebba8@suse.com>
 <784fa30f-cdce-4d0b-97d1-a22ac52aa8c9@xen.org>
 <a31ebacb-b454-4636-8d75-df85d07f3399@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a31ebacb-b454-4636-8d75-df85d07f3399@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8937:EE_
X-MS-Office365-Filtering-Correlation-Id: d67e8c8a-623a-45f5-10b8-08dbda2ce17a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LhUYLChm3BvQMCK8HmaZgLiFB82gBRf6UoGucV4iOXYfAGK6fdjWPBjN4+dh4B/yA/vgAOk+EG6QZVz6F4l3RI/j1/Ky34u5hgQjeSTb1lTBG9v5O0MVrCBdELooDc22j5UP1rn04H/DxB7Fum6e6VpvBBdYEVzOvK5vFidbI9gfHtpKd6XF+HUbASRQ6vk2svwpokgfbB9OrWcF3z66doYUkrJxl2ikJwSq/pCu7E0NHCSiiB2oSpOmEgwRugEXhdhSyXVH5pMn0p8S+qyQKJJ8SvoqLDrr4HL/MATbuPBnAA/CnfFpTtuPxSBggfDHS19BsGLc+pZuk/WOBamGXSBjtfDDmtoW+qYukYTJnebuI32w0rziXjgGyE6Qa+tOCPHs+3n0Zg16tFHiLaQMZ53EHmkH3NRf+SbDWyDYmOHN5GE4lMqn9cxciGNn0A7SNM9FGaigThdLf7vo4DrGlF3OQXzkMRvWbEhPwm36xbrGkKq22q/WiSW390S7zkxC/atJkC8k9OKRIY3ncNPM+qE8cBTak6/7gVpKkYUGP+EpeGAxs+2Gle2DmO5rtDrwBpLLnOmYPr2K0FlIfsNp4yMNnQ9LXSOc41AbXWjbzvNi/xZILbSOhGbMBUl5pRp9zS+wlmr+MaJp0Eod/IS5bg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(366004)(376002)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(41300700001)(4326008)(2906002)(5660300002)(478600001)(6916009)(8936002)(316002)(8676002)(66476007)(66946007)(66556008)(54906003)(6486002)(2616005)(36756003)(31686004)(31696002)(86362001)(38100700002)(26005)(53546011)(6512007)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzRrcGQ4Q3Npck5Bb0duWG5rL2NuWThuREtTM0lZWklMQVY2L2hwYmkxTHBP?=
 =?utf-8?B?dmpVTmx2VUNpR0xMQk5yUlFPT1NSUFhENldZY2NweGJNK1RSOEFiUkJWcEhy?=
 =?utf-8?B?ZEh5Vnk0WVdhLzZzZFhaVFpTYk5YYjcwM2Z5TmRqY25PREpMRmNwWHltR3pm?=
 =?utf-8?B?NEsyRWRUWFQvZkdHQmlBYjZUSThjWW9vMklKRDltQUMzYnEvTCtHeE9DTEFl?=
 =?utf-8?B?Uk5kTkNxTnNrVTk0SVFlWStkNWFCclRmQVRLNG54eGdyYkNUYWFGRkVYOTgz?=
 =?utf-8?B?RmVHd2RsRnppR0VaY3BNQTBkQm1KcCtPRDdtR1U1dktyRVFzYXpBK2tsZVpM?=
 =?utf-8?B?TUdoempwOGY5aksvZDVabHJwRlFQNGQ1azA4ZEl5OE4xV1Mxa0lvc29jU0JO?=
 =?utf-8?B?WlM2Z1lNdUsxVldHZG9ZaDU0WEg5R1RUbWZGQlAvYVgyNHFiQmZuUjFwOUtQ?=
 =?utf-8?B?T2tSM0NNTmNlVUNFNmpvSCtOZE9XWmYxT1V5MkJxVXNMMlVzUXZJSUVkeVlE?=
 =?utf-8?B?Y1pQb2hmaXFmRnd6TzZzUlRXQ3FrcWRUL3pzbkR6U1k0T2pWRHdQS0hPYUg5?=
 =?utf-8?B?c3ZZNFNNdVdyY1Y0endvdVU5clZHU2pnaFFnNEJoa09zektaSCs5aXNxZW5C?=
 =?utf-8?B?Y3RPZE1aeHFaZ0FHMVpoUTBzNld0b3hFMzNkaFg2OGJQUThIa1hxTkQ5NjdM?=
 =?utf-8?B?Um5WUWRwOW9ZcExRMUdPK3I0a2VFcXVjU0Ywa01nQ0F3ek9wL2xWTUVpeVJM?=
 =?utf-8?B?am5zbk1NaTBodi9EN2h4eDVpUVJJUzh2Qm1QUVI1bnpMZElBb1hkQXpEWDhh?=
 =?utf-8?B?T1VRbkMzM3g4WElPME5vc1hPRFk3QXIvZitQT2ZxZllaaEM3a0x2REt3ZDNX?=
 =?utf-8?B?N1pmK0x3VWI0aTE1N3pMd0NwdVpYNm9tRmI0RG55VFk0aGpmbEhYN3RvVDhx?=
 =?utf-8?B?UWw0UkJNUTB5MlBjQ2paSURYckJieFNUM2hCY0IwTXh6ZFJDUEZRUnVuTzVi?=
 =?utf-8?B?R1VXdVI2ejZsc1VrcVEwb25IR1Z5bk1UMytITkZpZ25DQkY4UmQ3MjJGUmV5?=
 =?utf-8?B?bEg0N3Y5dkRSOUp3Z29LZEQ5cml0OVRueDUyZzlLU3pyU1R2N0pTQ3ZDdW8r?=
 =?utf-8?B?eGY2d3hRQ2xFYVExNEc4d2FVQVJWRXVxZEJIMGFJODNMUGFJdjhPak14c3BG?=
 =?utf-8?B?WlJSNGxCMS9wK2ZIYVhVbEdiTTFSM044aEhFK0ZFSnhFUGZTTVExT2pVT0Q3?=
 =?utf-8?B?Q0lwRDdTMStwZi9ucGkreEdTbjZwQ3BDblA1UWpLaysvVDZpU210RTFkZUI0?=
 =?utf-8?B?OW0zUFhYQjR0dlY0aUNBWHh3NkxuY1lKNmtReXlYbzUwRHZvNHQzdFRwM1p6?=
 =?utf-8?B?T3RrU3hNM3JpWTJqT3NIK3k5Wk0wN2pUa3BhenRUOUJsV2pUUHdBOXJ2WTRQ?=
 =?utf-8?B?U08xTEtBNmVxMEt1RC90RHFBN2JxRWxORHpCbzcySExQOEhFbi8wWVEyMDh6?=
 =?utf-8?B?Y1FwcjhNZmhCK2NpNzJlSmNDdGdRNlp0WG9tMEc0QkY1MGR0aFNwUEowbU0r?=
 =?utf-8?B?YXd1UVRTMzhvSFkxNUgyZ1dGUU4ycC9OR0hEclE2NEcxRW1qai9kSllYMUNn?=
 =?utf-8?B?VWNIUjNDL3ZDMzFzRkpHaVhmaVBpYzlFMkFlOUZCM1BEVnlSLy9zOGVaV3hJ?=
 =?utf-8?B?b0xsY3JRcVFrcWdHOVJITS90cGpyVDJCMGhCQ01vVk9VVytqM0p4dDB4M00y?=
 =?utf-8?B?Szc1OWdTZk4wM3JWTjBvWmZkTm9ra1VraXFpVjAvaG5iWUMrTVprN2NNVEVZ?=
 =?utf-8?B?MzhoNGpWdW5VK2JlOTlHbFhsM25LdDI0UXR4YTQ5eE1VbnEzWXRDTHh2SHNN?=
 =?utf-8?B?djA2c0lvTFFuWmdtMGUydG0zbFFEZ0ROOXhxWjJlUytLdjZXTEtIdEREd283?=
 =?utf-8?B?VUNOdHNMY0dqdlYvZ2V5bDNHYUN4RHV5c2pXcE5DbEFMMkZveE1lYzFjOGg5?=
 =?utf-8?B?bW9FTitVVzkyd2o1NW9JK25rOU5QaUNpQ0NyS25zN0I1T3g2WGNBYzEwOXJJ?=
 =?utf-8?B?OE1kT2JtUUNxZTBPdjUzUmZiVEFmMktzT0phOWloUmFmbGdPVUFSTmpkendY?=
 =?utf-8?Q?o3rhkVtk7d/so08UXMTl6r9/I?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d67e8c8a-623a-45f5-10b8-08dbda2ce17a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 16:17:30.0556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yg7C5leTT6T9BsVJlUQxSEhbW+k4AudnFKvQaZYoZKQJraf38lhRZGUmHa+FhT2xeWLUFFXSRKRaRLxF/GE1IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8937

On 31.10.2023 15:15, Stewart Hildebrand wrote:
> On 10/31/23 09:17, Julien Grall wrote:
>> On 31/10/2023 11:03, Jan Beulich wrote:
>>> On 31.10.2023 00:52, Stewart Hildebrand wrote:
>>>> --- a/xen/drivers/passthrough/pci.c
>>>> +++ b/xen/drivers/passthrough/pci.c
>>>> @@ -1618,6 +1618,16 @@ int iommu_do_pci_domctl(
>>>>           bus = PCI_BUS(machine_sbdf);
>>>>           devfn = PCI_DEVFN(machine_sbdf);
>>>>   +        if ( IS_ENABLED(CONFIG_ARM) &&
>>>> +             !is_hardware_domain(d) &&
>>>> +             !is_system_domain(d) &&
>>>> +             (!IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) || !has_vpci(d)) )
>>>
>>> I don't think you need the explicit ARM check; that's redundant with
>>> checking !HAS_VPCI_GUEST_SUPPORT.
> 
> Currently that is true. However, this is allowing for the possibility that we eventually may want to enable PCI passthrough for PVH domU using vPCI (e.g. hyperlaunch, or eliminating qemu backend), in which case we may want to enable CONFIG_HAS_VPCI_GUEST_SUPPORT=y on x86.

That's precisely why I'd like to see the ARM check go away here.

>>> It's also not really clear why you
>>> need to check for the system domain here.
> 
> xl pci-assignable-add will assign the device to domIO, which doesn't have vPCI, but it is still a valid assignment. Perhaps an in code comment would be helpful for clarity?

And/or specifically check for DomIO, not any system domain.

Jan

