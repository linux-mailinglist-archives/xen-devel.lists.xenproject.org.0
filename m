Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C59762B83
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 08:34:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570060.891343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOY68-0006MW-Nm; Wed, 26 Jul 2023 06:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570060.891343; Wed, 26 Jul 2023 06:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOY68-0006Js-KG; Wed, 26 Jul 2023 06:34:12 +0000
Received: by outflank-mailman (input) for mailman id 570060;
 Wed, 26 Jul 2023 06:34:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOY67-0006Jm-2D
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 06:34:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6cd1fa9a-2b7e-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 08:34:09 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7269.eurprd04.prod.outlook.com (2603:10a6:10:1a4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 06:34:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 06:34:07 +0000
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
X-Inumbo-ID: 6cd1fa9a-2b7e-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XuGS1WEZ8znwPZES/QRh9M+RcFG2blrUX+NRuRLPdc2jKWDKmmCVNfZuLfw0JZYiEXXitwza/NtSYJgsAiVIpJz1oiwrBuFt2aL6A5gYHFN0Fcdrzose8f0aTq5sDBcFBd5Tumxrtd7onmeCqyfcrR+F13r6pI3PV1ikpInGu1AdAxcKxc9XOxmqnX0dJZDP2cwlV/nKzJ9kgQQwWnlWcG+7xVdA2/gqQjohRnZUR86c5fHGshmEWXMmw6OVNaCFpdf6c+lweGBgeamdTcSAQnBUD53pI7N/HueHz+YYExKZbe74mUXqikYgmCA3+g9z5JMESWZNjoYOR1nuBkiuWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPAda3NxuYrN5eM+4qGSUW0FwYcB+s3cz+gelEC9PeI=;
 b=evU0ABe8m0fpuZx9u0vkkEXlcFb0jZVyD5RKPviJu8PAkJ4KCa8LlwswmwW8136d0TdlYdhx+vE/BESnMK57Jm3AD8trjKJp0DZUYsJuznuvNFv87AUaT1DR3C5q6za3hzdtzYw5eBxhyz90BMQxir9rg5meHI/KVFGfFGZ1rN2Pgf/im8q0Q0HpKA0LnBJywL6i30C0XdEWefMQNRQJuOvK/04IEiodAxqjnP00TuEDytss0ruqK5/VAC3WXYal81kYyhHuYda1g/5dZMtO+/lDoSSzQ7P0AQKfcmzC1oDyXaABfG3OMN+Fm5nd+0iT0slAEmsDiRIAzgPH3WBIgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPAda3NxuYrN5eM+4qGSUW0FwYcB+s3cz+gelEC9PeI=;
 b=k6YHs8B6ELAFP0D7kkGqoVp6IY2kpur1GWrXfPGEGtWIv72jwXr6JmTv5bzJVjHDARXD2HLDmuEHcWMdQuQuvi+a0aaI0BPk2eMPn9FS9a1PgDcTEACidOEc66WWg6pSSbSoIICjthPBLwJWHE/vr3alTToA4gOx0Ladk5GSukOp1ioLzBgd4aUQ3cpm0tEf9XIgUCcznUMh8c83EnlC07OYZEzEIQunMzcTdmM+t83/J5PHiBlwWFR1unrSmp+JSIUyu+pNAw22FyHZM2oAdkGxE5PkTOQFu24b+jIMhsSmYdx+IUlD3CD6zBiKLmt+zcYWlJx4PFZl8iI5OF23gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <11a3ae18-508b-cf08-2803-bc4aaeec7353@suse.com>
Date: Wed, 26 Jul 2023 08:34:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v3] xen/spinlock: mechanically rename parameter name
 'debug'
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <a66f1084686b77b098c5ccf3d0cf5f52980fdf5a.1690317797.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a66f1084686b77b098c5ccf3d0cf5f52980fdf5a.1690317797.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: 40f5a34d-87a6-4523-16bc-08db8da2501c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rqQm4noCK8jkk0kWLnqNKY2CpLkaxVRLLrQfbbYlV4fYjugf4YrblDaRVzSJb3pPEeSAk9CZlEazQNacVBQDxelvxn7nvBt55gjiyHbnbwX69BrPoLVZghVkwjUJuTnMvjawHBgKAigaIzGsAv9tsqxFLsTFa54ANLd1vOYGTEpKi5XjOreCNby6tgfbxMKC7UBni65oZPdN7ytELZurwEuwowdEkMX8cw1SHXogLhw7rV7bHOxEwTfCz/y4fWO19UbwxmGe92UcKqGD/BTPQuthhI4HmhCBoHKfmtx7Vx7w2xLxfiFl6zyVKhTd8KhJMQozPCFXNcTi41oe0NahAmy4+AreoImwbkBPeNrMFw9XGnuKkubrTh4YktGULylVgyTCOeJie9LRjlXnCQYg0rfiK/vxuAaE8JB+hwzyegcwFBdoPED9R9YwDAoZo0JkuQMuMJEbNQa9jUuctHmsL6yg/FigcvtjE9Pz5+wqqfl8VgQhF3HhyGtO+RbTIBi9oZJvb/lDs2xggPE7v6z+ILydgXFlS1CuCFl4947inEjpPJa0Wrwqs/wmOtwSFUOqgs0W+BluXfWd9P/QI7KQB5KJ7iAZrwoLa1gbA8mNgX6GA469GU9BqVsekYAbqyOoRe8SMS1EU2OGQa64qpVOtQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199021)(66946007)(6512007)(66476007)(66556008)(41300700001)(4326008)(6916009)(6486002)(316002)(38100700002)(36756003)(2906002)(478600001)(4744005)(54906003)(2616005)(186003)(31686004)(5660300002)(8676002)(8936002)(7416002)(31696002)(53546011)(6506007)(26005)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aG1HZW1va3p0WkFYRlRMOHEyZ3VPUDJYcklBenpyUVR6MUM5QXRPTlNaNGVu?=
 =?utf-8?B?V1hpenZ4S1R4Ly9YdVhad0FSMCs4UWhOS1FrQWIwUW9XTW5sWi91L0pTanFn?=
 =?utf-8?B?R2pkTGx3cm9uckdMS1U5eFNQV0w3aStmcjhDYno1bXhQNEF1NHVRMlN6ekNl?=
 =?utf-8?B?enlmWG1kUTVUWURGaVVhaUNpdVdqa3dDRWhDa3MzNTQyYUdZZEx0SWVNdjlz?=
 =?utf-8?B?NG8yd0Noek1POXU0WFROenZMWEl5eWR5NWRtR1J4L0VZTElSWCtCMlNGSmg4?=
 =?utf-8?B?S1p5NXdMWFJuVFdZN2huSHBnWkFleHlwWGMrRkdpRDNDNlVyMUhJK3FpbWtT?=
 =?utf-8?B?VHNIR3QwN212V1RZMlg0bnhBRGMzajZ0RnBHbWxBaENCeXRSaXk5SzNqL0VB?=
 =?utf-8?B?Mlljb0tnWm5XL21NcXppRkIwZFhTOE93VTNtWC9FMzRiNllMMEJyT0NudTBR?=
 =?utf-8?B?aVRocDIxUUJ5OGpCYkxBVXk1KzNDSXdtRERRallNUDJWYmRHK1gyMlZpNDlT?=
 =?utf-8?B?TXhqRUxiVWRLcXdUbmN5MWZHakFpczBaT0ZNNEgxWkkveUM5dmxlZS8zd2Nr?=
 =?utf-8?B?bTdaa0dsUjdHb0JoTlZmSVpmRDduanZnYkVRTjZzUTZDQkZ0bHh6dkM4dmFH?=
 =?utf-8?B?OEJGS2lodDJOTjl1NWdleGFWa2Y4UEV1Y2NucjFFcHovYjRxMTFKQWZhdDkx?=
 =?utf-8?B?YlA3ZW1rbm5BL3h1U1RaL0dZQWgzbHZ0bm1yTUloamdEZkhwR1NicjZqMTdl?=
 =?utf-8?B?ckYyYi83cGIrWURlY2xnWDVrUjN2OExvV2VzUG9oeDdRM1Z4dzZ5MUlnc2gw?=
 =?utf-8?B?aWVVSkpySXk5YVpuVjEyRjAreDdKUnJBZTNNOStaK0pheXowTEQrZStxSDIw?=
 =?utf-8?B?THFTVkNwaDBFdXJ3N2tOS1BxTUk2TDZoOHZZRXBXTXNBeGgrdmN1bzVRRHFD?=
 =?utf-8?B?K3JocWR5U3lnRTNoOUNqWnM2TXpuSUxVZVhuVDRTTXdMckxZRnlWeWpINDIx?=
 =?utf-8?B?eGpDTGM3VDBxdWFtNlRNYnFja01mMVlKU2F6eGJ4ZE1OcTNKOTFYNEdEYVJm?=
 =?utf-8?B?MStPcEVhSHZWOXo1Y2tnTk9MUWlUamU1WlFuSGw0ajg2UG9jeU1JQllyYmcv?=
 =?utf-8?B?SzI2VXBHaGRsdHBuMTFsS213QXRxOVNvdVNuNGkxRzZobjRXNGlNUVpWVmd4?=
 =?utf-8?B?SHdwS3Y0NVV0OXBWUHZBcVgrTDdNcHh0S2xjLzVVRmpTanBIS05taFkwQlp0?=
 =?utf-8?B?blVvRWZwb1JhUVQ4d2U5R1VVQURPUlpYWGdzOG85dWNMN1lHU3BsSTZYSWxi?=
 =?utf-8?B?VkJqYkY2aG5KaG5GSjNjWi9ybFR2Y0RVMzAxRFBxK0xsTks5VWJydk9pQmdL?=
 =?utf-8?B?amZYL0FBcFg4b0U1WUdUd1I0RmEyTTlsN0N2TkJEYUFvZHZhQm83cFZhbDJR?=
 =?utf-8?B?ODVZWVRKSG5FZzh6UjZNd3NrS2FEa0RkU090R1haei8xQXM5dWZCS1RXY0Fp?=
 =?utf-8?B?bHhDKzJHenlHQWQ0MDAyMXJYT3VZYlRyRzNJaTN5eHVBMW1Fa1ZkbWJkcUFw?=
 =?utf-8?B?Z005RFpqZGQzV052NFZoOFlJelVqd2dNRlJVTUNTam9MZWhMWFJWT0owSXlr?=
 =?utf-8?B?SnM3ZExFMTBVa3RHd21PQktaTnJwbHp0QW9sNlp6VThnbzNnK29Kam1rSWFD?=
 =?utf-8?B?NlRRdytWS3dLM05BWlpIN3VhaUZEd2NRMFIvWHk5dHpsdWJ5NTJMaVlld2tu?=
 =?utf-8?B?NElJUmp1Umg2Z21zd2FET0tvenBVcm9ST0o1UDJCRGs1cWs1dVczOUhqdkM3?=
 =?utf-8?B?QXpyeFBEcDZWS2dNOUxOYzFsQmlVQmFFT0RoUnovbGhnai9JcWNnOGVOckRz?=
 =?utf-8?B?eVgrZk9iUzFpNW5xOThuRFZEcnVTRTZNblZPbWtXUWpCbnJDUWpkb2Q1YmRs?=
 =?utf-8?B?UCtock9uZDZCRkJoZFBEQ25WdVFYTFh4a21rNnRCL25WaFNjU3BNMDlFY04r?=
 =?utf-8?B?RUV4Q0NoRTdVMWVtVWNNaUFTVG1xRkFwNWVDMFE3MVE3VVNSU2l5TzE5clY3?=
 =?utf-8?B?S2hhYzlIRUNNdGhxUmNXVE1DRlV6NHN3OEFzZGVuY3djUTBWU1JxVkRtcTRw?=
 =?utf-8?Q?ptIWmME9ZHnO2AwmrybA/hbRg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f5a34d-87a6-4523-16bc-08db8da2501c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 06:34:07.2567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o9L6JOHfD0H154jS6fxPPlMxKm3WDvL2YYKRI6qDkKBByX7rNHHG7s88PnluHuEywSsolTk/tSowgL16jcGPnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7269

On 25.07.2023 22:45, Nicola Vetrini wrote:
> Rule 5.3 has the following headline:
> "An identifier declared in an inner scope shall not hide an
> identifier declared in an outer scope"
> 
> To avoid any confusion resulting from the parameter 'debug'
> hiding the homonymous function declared at
> 'xen/arch/x86/include/asm/processor.h:428'
> the rename of parameters s/debug/lkdbg/ is performed.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Changes in v2:
> - s/dbg/lkdbg/
> Changes in v3:
> - Added missing renames for consistency

Hmm, you asked whether to send v3, but then you didn't wait for an
answer. So to repeat what I said there: I'd prefer if we could first
settle whether to rename the conflicting x86 symbol.

Jan

