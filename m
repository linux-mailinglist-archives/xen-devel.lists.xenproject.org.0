Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF1E6A46B0
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 17:06:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502793.774785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWg0a-0003t8-KM; Mon, 27 Feb 2023 16:05:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502793.774785; Mon, 27 Feb 2023 16:05:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWg0a-0003rN-HP; Mon, 27 Feb 2023 16:05:48 +0000
Received: by outflank-mailman (input) for mailman id 502793;
 Mon, 27 Feb 2023 16:05:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWg0Z-0003rH-4t
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 16:05:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062f.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97e6e38b-b6b8-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 17:05:46 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7770.eurprd04.prod.outlook.com (2603:10a6:10:1ed::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.27; Mon, 27 Feb
 2023 16:05:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 16:05:43 +0000
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
X-Inumbo-ID: 97e6e38b-b6b8-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLc6IGC/hiiU13nKGESaSyDezwgDcnpuNFOQ4AM2/3amAripBeonXbQPw1y1y6WtuQv/4wlGGdqxOfA76R5RbrMTV8FU9ytG/mUAfTyFFepqRkQckAsIqHt7HXgsQvi2i+6SaFEFT5iFQVg6xvlr4Z9lwbElLl+cpcIDTn6hkri4c1cooJl7XELA+BMVE2Lynk4zDOAoD7Bx260isHbAXNg2z7PpCtndggwqE9hBaLfpaHiKo9l8exYX2qoVAhqbpdqWkHiTkJV9xN4h24q0aMeP3xvgagI1goDPfnRaEOFgk086sqtULW9p8obsdxR5K8ptwQ++ehaV1WQ0rP4pKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSloe7PXr4WtUOMrAadpl21PcVK2Xy6Z7hqkFumGLaQ=;
 b=SrvqHcnBbGWJvln9Cd88I+qEz/GfLabYS3mnlupHfkZtIWKJCDf42WiDuW3w9vMuAm1uY0ffj+2w1RomSsA78ViJmY3/0wXUU3VJZplJyBmp4RMm/9t9Lp/evig88+vjWxB60JszY9cSkVM+Ypv/Nm/6iv81J9cJIY7lY8SLelb3KfiuVfCD+Sv5JkRHTUALXV0iYQYuvEX5DzVZj+3FV/9qCErNRRB9Zx2NgZ2qYCTU2oFMeKxiC+AKBJSutFZfuTIw6zaVXHhDkKPY5Nf3JTPIalyjSxDSpVfRA9WgfomK55GxMymgUll8NvktoQyp9tYdSLvuLfh7bL3oFKenBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSloe7PXr4WtUOMrAadpl21PcVK2Xy6Z7hqkFumGLaQ=;
 b=tjv8PrW5+MgugYMf0qpGdobU8ztxdnBJ/IXKJV4juzo0897en9tuwcJwBY+nSjcItQjcGENfIMte12pZ5CPyO8/zGGMyjVd3KSlX0OUZw0H4UqmI8/j3bsZJGzdMHXTX8qmZD4RCnGKA7V71DcDtR7BOE2F2/t2waS/gOfx8HhI7GST0c0MY29OyrxNK/U90OI9AMSPOUUvdpR2lYYWm/E+DB4IVqlLuldF/tQB9MPeAQ8SDn5Um4HlifymgPkmyCRYWqSe7gJftrjOd+BG8dyQiJn12Lfkmrsw5bNkKEaZx/kJhdeDX+NCWBYauV1e6soSMfRx/7MKApaIf8BhSkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <20713a67-0ba0-37bc-24a2-7bbecd284f44@suse.com>
Date: Mon, 27 Feb 2023 17:05:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5] x86/ucode/AMD: late load the patch on every logical
 thread
Content-Language: en-US
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20230223173924.11815-1-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230223173924.11815-1-sergey.dyasli@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: cdcebc07-6019-4373-087d-08db18dc7ab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Uetvf4ox3OTBPJrx+lhumJA2KegvF6KWwBWFiidNfhEl138KVvvpe1iN5UhPmPZvHxPGPDi+4xJcNtEMcGTPPD6348fhHYl70XBEPAhBhSoKBi/1Yd/2FBiDl+TjQwET+uqWWbAbVtj0dLeefvP4MxNjowzq01xQmb61KO5m9SITo9XTsKUWLW4q7CO2Quh8WkfGmQm6af49vLSamx5EkvST8IgVLwqh2t+26AiMIPG9OIDipGb0UKC81H/r5Dumf5dgIsF+xBHOfsnkOj8+tfUwYewq4/iawAgC5nMfjBtwAnOxmxmmBzFS6efXweb47VXILTtf2kBdN5X08jLkrkLxMeZEZIBbcw3PplpacGseLlXRRN+SljKony55BeUl+k5nA6LYxMx8aVvJDN1xdcCwAckc4vFTyTU0cuAGu4S/sBjnBYPwp6cUTqk1tY38fg9kt5BIMZRxJkJooR2QkXIHIRT/zJSy7PIIC//+OB49I/5/L+gGvc3rViqw96TSGYIP02SoyWB4+I4vt+b7LgrygRUhoM6sratKnyitO+tpXCu8Ts8jM7Qo07p1C7bgsceGO4KW3w7ihf6PcFijkhsxBv5aHlw99TT+ZFs4sH5Xq+QoaevwHIUpHF4bJo+RWLIM1NctOg0d4FK24yvPmd8/KIUUFFOKm00LXXnoFbD6QTM8jvLgQl9INXGeYDJ3z4b5Rg8JGkdGMF6DQHzqEz9UVJbc9TrByMUiwigF8HU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(396003)(39860400002)(366004)(346002)(376002)(451199018)(186003)(26005)(38100700002)(66476007)(66946007)(8936002)(6916009)(41300700001)(4326008)(66556008)(5660300002)(2906002)(6506007)(8676002)(4744005)(2616005)(478600001)(6512007)(53546011)(6486002)(31696002)(36756003)(316002)(86362001)(54906003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0VDVDlTa2N0VFJLdTVTM3QzZmttdkVaY3Z1N1VUeWRrOFFRd1JvckY3TXNJ?=
 =?utf-8?B?cWtPdWR1SFhmNVBXNk5yaVZ0aGFhN1ZGMHdWb2liSTVNVU9yVVovblR1eFZ1?=
 =?utf-8?B?N1hObmlzZ2prUkRKdWhXTW1RdHNWUGRqZlExTzhETXpvdnI1ZFlFTmFFbEJQ?=
 =?utf-8?B?blQ4eVcwUmc0dWFxYWY4RmxzUmJ6QVhQUnkreXI3RnZiaGR0YkVkdUpnTDNL?=
 =?utf-8?B?c1FWM1g0dm1sNVhJSDVGL1dUdGMwL0twVkRQV21Mc29GcFVoRWZmaXg4Y1RB?=
 =?utf-8?B?U25lOS8xa3ZVbUhxV0dUdjNBZUcwWkR0cUkwM2tNOWNpcHVmOE9NZEFGYk5z?=
 =?utf-8?B?MUkrUlZheTFUaWQxWkNCaDRRcExWRUhRaisxa3NJUFl5TDJLdVk4QUVOMWlC?=
 =?utf-8?B?TTFDc2xTMHFCZUxFNW9TMURNR0pPbTh2K1g3WmU0dFBBL3NZZU5tdlB4UUdY?=
 =?utf-8?B?T2VwT3M3RGpaS29rZ3FuaHVJT3VEdHhhSS9hSkJIVzgvWTRjVEJSYzJvRWw2?=
 =?utf-8?B?SExSOVdLV2JBeStydU5kbXhkNkhQTHBwSXVhMm1EMk5zc2I1RTFXTWlpZFdR?=
 =?utf-8?B?UExsR3RnV1hub0svTHM1TXNZZFBOWkxzVHVvMXBuRXFlNmVURzRBK1J2R2xr?=
 =?utf-8?B?RmkyNFpVdXFFTy9ucGpmRWZSMzNUaEIwais3TUcvTUVYWGNXMytqNzRORmxK?=
 =?utf-8?B?dnRiVWlpcjR1S2xldWFEb0VNbUxUU1QwQnA2VUczWFZXRitLek9RTlpyR2hQ?=
 =?utf-8?B?UkdyQTBObzk4bXFVT1RGazk0QW9iM21SN0RMKzYyWkFuNjQ5eDZDWFdsYzlH?=
 =?utf-8?B?TzNzUXBwTVRvdWJoMU1PU01ONzN4U2Z1MVZ6YklyOTZRSW1leWpDQ3NVak5W?=
 =?utf-8?B?OVdKUVNYaVpIVThwQ0JhTEdiaGdEK1QxQlV1dWlvYkVpMmhxbnpWME96MUVR?=
 =?utf-8?B?dEZ5ejUrVDNrYzJCMUZtaWxjZ3o0N0FHdmE2aU1EV1YyUC9zVks4M20yMEFw?=
 =?utf-8?B?OHpzL08vbE9XbXJXV2x0UXNHeXpvWHNhU2diZ2RNamc2SUNFOERmSVZuUG9Z?=
 =?utf-8?B?ZkNKRi9aWFlUeVoveTJYd09WUEJHMmNEOTlJbzM3bGJHZUtkNUZkcTZGcVRB?=
 =?utf-8?B?bkdibmNCVng5eHlEOFh0eFZFWHE3empzaDZkTzhIQU5ZNUpGc25QbDlLRktD?=
 =?utf-8?B?OTkyNG43MTZxcDlaQ0RQSytJeHc4dW45T1JRbkFmdnc2UlZHVEwwKzQxMW9h?=
 =?utf-8?B?VkNHeldmM050UTFiR3NXZVBPMXNQa2RMQkNLNVViOTdocUtRZlhQOE1HT0ll?=
 =?utf-8?B?cHhac2pLMzJaY2ZuaUdWYm13b1I0dzdGS0I3RGZ2RzJhem1GekQ5Z2VpRVY5?=
 =?utf-8?B?MWJxU1l5bjdJQVBQbkNtdnRBRFBGZUwzVnNPck1kbHN5QjJSaWJMTU1WWkJt?=
 =?utf-8?B?ei9vK0lKU2gzakh1eFRGd3hSWml4d2k0MTNkUk92OVpZZ0R3MjZtcUNoSVps?=
 =?utf-8?B?ZW5mUzJBMWlzY0VmUWNwOHFMYTh4NzFoUGpyQUtmUUdCZE1tKytjRzBNUEFD?=
 =?utf-8?B?bzdCZWprUXdNYm1IZlZkYzNGODYvSnRuNjFBWDNYdldIK1FubFdvUlFaS0tr?=
 =?utf-8?B?azlWdUtTZDZjdkRtRHdjcEZWb3k1L1dNRzl5TFN3L3JITGVKZnV4WDQ1czFq?=
 =?utf-8?B?eU5BWTZVVVdiUXZJaDNQOHB6K2dMN2Zyb2lYWm9DeERMWnNKWm9TRC9OT2dG?=
 =?utf-8?B?NENCRzJDbUhqUU9NeStTZkp0dDg5M04vN3JnVWtWc3B3TWZrWjQzbDNEb3Uw?=
 =?utf-8?B?V1VObkhGdmZlZno0WFNuVXZVQm5BNERIenh2SDc1U3NGVWxRTnFkTnh3bkFH?=
 =?utf-8?B?YkdaRXpBNXVmUTRYcDg0VXBlcDJad3lZUlhzVHFQby9WT0U5RnZvL0VSRkhz?=
 =?utf-8?B?TmIwc1ludmZhMzJuWlB6dWxDeDRxSTFVN0JBOGZHU2NxODUxTGc0WGF3cW1R?=
 =?utf-8?B?c201V3VWeklKcXpWK3pSckRTbjVzS1NpTkhWdVUvb2xiaDZPSmlNSzdCcnZz?=
 =?utf-8?B?bkJveUkxRWthaVhBSXAzNTN5clZHTVRydjZyQXZCZzJqQlhZL0dkdk90cmRn?=
 =?utf-8?Q?atxIkgbVOm9UWrbhY4rPX90BX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdcebc07-6019-4373-087d-08db18dc7ab6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 16:05:43.5710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LYWc3/d/dgK43xpCMAXI5CSGcP8q8XoDSqEsdERGwIfgyH00dAm2+kR4kR7fGr+Qt5xzPZHMZ3gr1T9CtfVehQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7770

On 23.02.2023 18:39, Sergey Dyasli wrote:
> Currently late ucode loading is performed only on the first core of CPU
> siblings.  But according to the latest recommendation from AMD, late
> ucode loading should happen on every logical thread/core on AMD CPUs.
> 
> To achieve that, introduce is_cpu_primary() helper which will consider
> every logical cpu as "primary" when running on AMD CPUs.  Also include
> Hygon in the check for future-proofing.
> 
> Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



