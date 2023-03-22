Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1DA6C452A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 09:37:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513180.793812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1petxw-0002tO-SI; Wed, 22 Mar 2023 08:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513180.793812; Wed, 22 Mar 2023 08:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1petxw-0002rh-P8; Wed, 22 Mar 2023 08:37:04 +0000
Received: by outflank-mailman (input) for mailman id 513180;
 Wed, 22 Mar 2023 08:37:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1petxu-0002ra-KH
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 08:37:02 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6a110d1-c88c-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 09:37:00 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7537.eurprd04.prod.outlook.com (2603:10a6:20b:282::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 08:36:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 08:36:58 +0000
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
X-Inumbo-ID: b6a110d1-c88c-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bG/KMTTarxW3Id+DDQtIJI9QVYzMiYBRRf9bjTnVy/EenEqRRGRtWyEbhp7qDKiMFjhpJqCR6EbJYsw7yNhAHrR2DWQnmKbCQ84dYf46S2xUtr+NjQXUdCf7lYSTAXLV2UH9Gte0Mz24iSrjRCiGO7mp6MS2Fm+qEwvZZ+jf12L4e70pzFQIQbmR55KD85MhPcQPO1XHOKDC0CAfqWU2Iwo1LqWr8gZCA4Xom4xjVfm0oTKm6PsC5MnaUgZoEjueFc1flF5dFyEvn8QpjszYTmj0DGsjma7S1i6mNx7lGkJbAyDZ5qENgT2GQrqPLw7Sfn2gXA0NvQ8XiHv+wr55kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gt2I6FLif50/FCRCNDZAKGgefhqwWH03i4HGUDAO/YY=;
 b=HwJq4rwvCqyLPFo6jd3hEGfKdmU/e2tH/zj8hrgYiiIKEoFhsQCZnO8iv3Mb7GOgJ0ik3brpmuMHKd4Y69D2uURID9WRATxrk1Aq/DwGn1jSwJX9PR0W5kIbu08VFiqrn9xTAVlFnI/wIqpaQF1hH1VuNqBJjMTZx5HSE9IEvapfnLOMdXWhzOqnc+PqOJZzoVpZtCLhmWCNUviXZBX/O9koEF5iELNAWLXxVBRDvVMIqp/DXwf/61ZZoR/jVGGOkSLtJkDmpJVacFlaikv9+CUGZunKW2ftDUc5HpRfzQAmgciMZGWLaHZz3NoaeE+GYNXPEkIcTV4QJDZ6NscoKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gt2I6FLif50/FCRCNDZAKGgefhqwWH03i4HGUDAO/YY=;
 b=OoMe5Hk/KlR3iiEk6Pm0341RyJTZYevqU6WEVBOo/2LlG1bW8pojcwt1Xzq2EgQlq0w9yoA0tqcFpKqVrgmLLubBO2ejiMTHqd+jxQet1Lx8M/ICwNUJqYOtEjg+4dx7bmfMErrxbaE+Bzd86fiGy1wGN8HD58HkFG1rUmAqu9kx1XnsMDYy0Sg89zfkdF6pWrq9WIqqncFK6+o1rZvnkGe5i9oksbWSMLxRSm4pas7PgzBX/D3fBrcnCCOqUmrqjnu4qfA+LaT5/l1i++D6CkM7e5baElIGrD67Xh9Vf7EKmEcQi6gwmUs/GkwhxZFqYNtk/hP8mgi4NCEgHs+/1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e1705e8b-12ff-6d2c-e430-709fb668b2d4@suse.com>
Date: Wed, 22 Mar 2023 09:36:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 2/5] Change remaining xenbits.xen.org link to HTTPS
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <cover.1679412247.git.demi@invisiblethingslab.com>
 <ee6b94ac9b10776a87ac71814fcaeb51121037ba.1679412247.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ee6b94ac9b10776a87ac71814fcaeb51121037ba.1679412247.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7537:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ae3f955-87d7-463b-10b9-08db2ab09971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9hLcTfXdpf4ceELgDz6QWoW9sqZRE9eiDAL2dXo9uvnnLDeQFL6VAh0277EqSPIC/6wazEu/T+MbTYVEecW8wv1eEuif4W/gP7EVqxdXxdUMTiroWizcRwrpk7We1OdOmSGjm/Ic3t2PuqzvG/xUHyK+/L3K9zPDo4XdUiB2HPlQ16M4J+GKR/rEpN1u9WpXvXVu76XWHP2QP+EnuqmaBPj4suNVVvqxDBUUzgS49l8kBdPiIqSs6SgPcPtx4aseGzvXbD9PFnTWMWRsMQoKrd/+P0PIeZO1S8jVd6D3yNfTnZCx9hnZLhvbq12sow5mxT7KrCxZndn5f1mIY8CQGuLROhMnyyaVd2G8mMJ73Cdh40n5mTA36jUmpCOaZ6Qz3g4I0SpiuGUuEGgpw59QJVZ3+qMikofus4COwlj0w3WcLVpGGJ5Cb7+/Y8ekuApyjavXjTE7CtW9GUun+yxVmptwoqhCTEDriiOmZQ0JXoDlceASSBF2xE4RAs8frShNCKjVg9WdLO50mkijofIlI6txh8SyZBRpYDAXmNdcXWarpC7TnxHEOfFWU8JQsfLZgoD6/Kgp7vcNXGMjeuRS1FFZza5U+VPJ/Vmc4H5StOPYMc4DCudbkpexDgy9Y9GHYSkAcvMsdzJjv06Xk7cQeAGnXS6mifhHB3BCyLN2X5GU7MYy08Sx60Rp7uPEazi+zgjt2uHmDr4tHJoO0LN8oi1DQYpVZTflfshZLHshkMs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(39860400002)(396003)(376002)(346002)(366004)(451199018)(31696002)(86362001)(36756003)(54906003)(4326008)(8676002)(6916009)(316002)(478600001)(66556008)(66946007)(66476007)(53546011)(26005)(6506007)(2616005)(31686004)(966005)(6486002)(6512007)(38100700002)(186003)(2906002)(5660300002)(41300700001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkJsMXgxL2hRQnZWa1RpamNmUnkrSFA0MVpvVjZySDlFYVNFYzVKTEo3OGpG?=
 =?utf-8?B?V0twL2N5WlZTYjA0cEZKUGxSUnRadXQ3SmxzSTdjVS9wVVNyZjhyaW9ZNm0v?=
 =?utf-8?B?RUhJbVVrd0Q2cnlGSGx3YUFsMVNmUDFWRVEwSnhjVlRMYmpLRmtBYzVmeDRR?=
 =?utf-8?B?cWFWdTBYZUtpSzhVV2hjWDliTW1hYytuZ0tZTkxQblMwQktBODByZFVDZVJw?=
 =?utf-8?B?Ky81RTNGSTRaaXBkaDNNNm9yYUlLQmtJTnRaSWM4SFVORUJJVGtwcTR2QUs1?=
 =?utf-8?B?Wmsrd1JrZlJKUXBiZVVrUXpOZXBtU3hPM1J0Y2JwRWw3TzBZbHVsejZsQVd3?=
 =?utf-8?B?cWlPOHJ6Wm1kMHBhNlpFN2ROSmIwT2ErNDlMTWxMcFlmV0RGSkRhVWRyaFRE?=
 =?utf-8?B?NnNhUmFMQ1RMWldHc3JsYzJ0MjJWd0pVT1BHVVVZMW5MckFIbjZ3ajlDdU5r?=
 =?utf-8?B?bEhVc0hUZXNvdStyYjVsM0FhdzlwSktOQldGdUxpWFBXSkw1VkxkNWt1NzJU?=
 =?utf-8?B?MndiMmV5RTFMNU85aGdaVHpyVG05VWNGL0lNZ3dzR0JIYjh5MTk4MVdDL3ls?=
 =?utf-8?B?dDRFUWFtVVRmWlAwVjdzd0ZoVWF2SmlUY3d5ZlMwU3FsNTlleUs5ZndDcFdX?=
 =?utf-8?B?Q2REek16VUYwUzVwbkZVanJkU0NOTEhIMWV0QTdHUnNlbGpMbTRRM1dISEs2?=
 =?utf-8?B?VGxpcUFRMHIrQ1JGeS9mSThoTkhpQ2E3eVd1a09HUzNKcFhQUG9LLzZMOHc0?=
 =?utf-8?B?TGxidm1qWHA0WXJScDhSanRLWVJJd0J0K1BUb0JRUm1nV1duMzNRT0czY1po?=
 =?utf-8?B?Y2VRekJBQmZlTERYaENhZTQ5eXRmc3NSUUlyaWwvaVBSUG9RcER1MjBUZkFV?=
 =?utf-8?B?ZC80VE9mb21jWWZ6QmJSaUtDVStCTUtBa0ZCWGFVVXJhZlJRVVgyRUN2eHBR?=
 =?utf-8?B?NlJHalZ2dVU2MEpJaXZHZlhpUWtkWWtONjdDbVg3WVYzNmY3RzN2cDJieUVk?=
 =?utf-8?B?SytTNVQ1aXJ3Y0pUZzRuOHdlSm0ycVdtWmxnWlduYmI4b3V1Yi91M3lSR2Ey?=
 =?utf-8?B?ZHlzY2ZoTEIwN2lDSStHU0JHYUgvbjVPUk50a3lXckE1NkdmZlNuM2puVnFZ?=
 =?utf-8?B?dk9IeFNmRkprODF0Z0VBWHdJQ0lBK2Q4Vlh4ZTZMTHo5bkRoUGRSRzhnL2Zw?=
 =?utf-8?B?VUR3RjZVUzJFYlhJZk1LNU16dzNDWVZnUlMzY3VzcGpUdjc4OFJGNTVpdm5V?=
 =?utf-8?B?Z0pRWHFSazVDOGtpaWIrcGlUaDhoWksyK2F2V09vMEhrVzBPdnJrMFhMczQ2?=
 =?utf-8?B?UHhpSEE3WndVSGl0b28rU1A3NlZqeVFQVWZtc0E4Vk5ZVUtDZ0FyUEF3RUty?=
 =?utf-8?B?S2FwTDJwY0t1azl2dm16b3ZzYmRHaHlXTk5NRmhlNkUvWHR1WXdLalk5eVFj?=
 =?utf-8?B?RlJqRUgyZDl1ajJpQzBrd3piVWlLVlQ5L1lyOVU0VlZZN3E4aE9RSTI0b1VE?=
 =?utf-8?B?Q2ZqYlZ0UElZNW0rRFNDdS9TeU8weXZEL0NWcjJpQWd3WHdSdEVpWENVWDc5?=
 =?utf-8?B?T0QyV1hLK3h1bHRKcDN0YklaRldWV0YydlVWN1dXTmxpQ2E1OVVWbnRBQ3k3?=
 =?utf-8?B?Um1EdnI1Vnc1UGU2Rlg4bDB2RTFNMzRZamxXNGt4RldVVExWK1A4QnJ2MjBy?=
 =?utf-8?B?VGpWWjJuOVBTUTd4ZXlDMjRXanJhK3g2dWxEWC9XelNiZGdVbWRwMXZWeGhv?=
 =?utf-8?B?ajBWRERuZ1lKYlhCNzloci9IMWN1YWoxbDlLUHJSR1kzd3JoNGJOMnh5SFZE?=
 =?utf-8?B?VkVPRUNXV2VTT2hBbTFZRS9Ca2lOSXRWSjMyc1I4TWxtSElHb2RMSFl5OE1B?=
 =?utf-8?B?a2tjMzI0WU1STXFIWGNodWJhUXhSR2lXa1RWK2E1WHpqTldWODdmVnFtZjdU?=
 =?utf-8?B?dTRnQXpXOU9uODBhSWVJM01jaGlzQ0lHaWVrei8yeEVhZ0toYVlXcEZpaHBP?=
 =?utf-8?B?WHNXSi92b05nV3BBaUdvSWk3ckNtM21zWFBjRmRlcDZFU2FZM1ltaGpSNTRC?=
 =?utf-8?B?QkZ6WC84emtJM3hFOVlnVFhSYSt3V2crR01tbTlwcHhSbWNnSk5RMGpxdXRL?=
 =?utf-8?Q?k8ogF6Vde9Q4MtB5oiXYTE7tK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ae3f955-87d7-463b-10b9-08db2ab09971
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 08:36:58.1554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ibawz1h1Y2JYSUNUMi7rrHrKo2jZMmF0lb8EnnXy/pNR/ANCKxQ7qpsBnpuR/ST8pK4gyrzqJC9Z+AB9YBpcbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7537

On 21.03.2023 18:33, Demi Marie Obenour wrote:
> Obtaining code over an insecure transport is a terrible idea for
> blatently obvious reasons.  Even for non-executable data, insecure
> transports are considered deprecated.
> 
> This patch enforces the use of secure transports for all xenbits.xen.org
> URLs.  All altered links have been tested and are known to work.
> 
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>

A patch of (almost) this title was already committed and then partly reverted,
as it had become clear that ...

> --- a/Config.mk
> +++ b/Config.mk
> @@ -191,7 +191,7 @@ APPEND_CFLAGS += $(foreach i, $(APPEND_INCLUDES), -I$(i))
>  EMBEDDED_EXTRA_CFLAGS := -fno-pie -fno-stack-protector -fno-stack-protector-all
>  EMBEDDED_EXTRA_CFLAGS += -fno-exceptions -fno-asynchronous-unwind-tables
>  
> -XEN_EXTFILES_URL ?= http://xenbits.xen.org/xen-extfiles
> +XEN_EXTFILES_URL ?= https://xenbits.xen.org/xen-extfiles

... this really is part of the build system. Hence I wonder why this wasn't
folded into patch 4 (as it should have been from the beginning, which then
also would have avoided the noise about committing the patch too early).

Jan

