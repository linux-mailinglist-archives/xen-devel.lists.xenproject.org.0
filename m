Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A844B6F574E
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 13:42:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529137.823201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puAsU-0005DZ-EV; Wed, 03 May 2023 11:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529137.823201; Wed, 03 May 2023 11:42:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puAsU-0005AW-AU; Wed, 03 May 2023 11:42:34 +0000
Received: by outflank-mailman (input) for mailman id 529137;
 Wed, 03 May 2023 11:42:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puAsS-0005AQ-QW
 for xen-devel@lists.xen.org; Wed, 03 May 2023 11:42:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96bd1c28-e9a7-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 13:42:31 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM7PR04MB6998.eurprd04.prod.outlook.com (2603:10a6:20b:10a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.33; Wed, 3 May
 2023 11:42:29 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 11:42:29 +0000
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
X-Inumbo-ID: 96bd1c28-e9a7-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzIJHT4HhHUjeJNm9Xv4nW2Mc4JnyDJHVwILzK1biKIll3zQkfRVloH9QIqqwyXKpe7WtUwgSmy3sQ16nvm7n53i01Ib53ODdFW4wBkxvFeecIuL5QBu44kXLSIRcTKyaZcAYQgz60iekk/AD2F2R88vJz7fpQRwwZe0gn5b2V3iYbB7fWVB9e2CTmp7+H/gOnL/kaStwQYsNnQ5sSfXhRrU3Sk3gTyH4biXkv+/+qU2ssjstGb/W9VpqNx8kjvy3L/b+cj38lHKwgkh0LlQEtsYhfBi+5h3vWfy65R4WdIRiNZrivGCMLNcxYZ8URw77jZtGEZgDIL4xIrEQfTAiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6yWBchkBNgoC9CCoa83SX//6pM98VoMRlufZMx9IEM=;
 b=IofnN4TDjXT29HplfUE20jkIWNUP2ZHTcDn89WiqK+UMsg+DWahRY5fBm+z6wAR7h8/dEZjIFRDuP6rkUZXNluFX19V6jZ5avoC6KirOceNJxzeSJ6DEEYqrhUdGsKurDv/rt+bf60enQ/5KLQrckMTEOaBP3ELQQ3+voGcY1iiPSSq2flZSYb1R1oTYGvwfyKCZr/JqyEJruzQdDACJaR0qSt3Z6ogZPWDMeo7M1xyb4Elj+FnASURJezFnv0B5koaxiGgh7nrMhBeEZoNDIX/LkFxuFQzSUILicT4sAV7Bv+5OiOrjO4seh2j2Me5WRciBvVw4sM1usA30RLGlpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6yWBchkBNgoC9CCoa83SX//6pM98VoMRlufZMx9IEM=;
 b=wZZcmxFX77cbgKZ1aJXQExSyrxQd7BzNO2ILww8/BBZLPIEDTMf6p1I5b3eN/DxqC0w44goDt17QPb3JKQlUffdJjN1PWAgq01UjiE8njkG2BKF9Uv3zcjorySA0AzVGD2j9N7Y07Y/MvpLS6XYFQkZLmHlKAZDFcLMuxiFnIX4lXsHpGq4IisKs9Ua9pjekCqpOX31SNVjngZff+/9FynlfpgHEkpxYZn+SB0GOxbLZtAqmy/EijRO3nSGVKxJhXQtthxn40ssizIg/olOZpH8WkzGAG2ivMLKJSwxyjEez+67Op+yoeDhZHxzQxTaIb2tnMzmCjoJMOml8AStebg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6d18f284-8cf9-4c21-7057-5f53bd98536e@suse.com>
Date: Wed, 3 May 2023 13:42:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH V3 2/2] libxl: fix matching of generic virtio device
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>,
 Erik Schilling <erik.schilling@linaro.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xen.org, Julien Grall <julien@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <18458fa39433ce4ac950a0a20cc64da93db0b03a.1680771422.git.viresh.kumar@linaro.org>
 <888e60d2ec49f53230bc82df393b6bed4180cb8a.1680771422.git.viresh.kumar@linaro.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <888e60d2ec49f53230bc82df393b6bed4180cb8a.1680771422.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::10) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AM7PR04MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: d8beee39-b378-42c4-f366-08db4bcb7975
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gnn/WE853ow6ZIQvpxAXQByDhilqk9fVTdBQ/CyqwX3kN8shqwqMMPB7lsr6l3FAq3ofQ83rAzwH3fwyPNQdoxpLzrLtCEnHfC+/6+jQGJIXMk3E0AEyEdRn5bU/X2UygE/cvcsOwCqJqnnrqHZiHxc6nHs8slyoXhDOlGwy0RyiVeC+D+gRmUAsCtR/yhjafnVpJTyH2FQ0YV2ybgwYtPztVQb89YH+h5rIeW5u8KgMSZjr+qkwvl29fo+rDT0bl8KvwcTkdlcHtJd2snOMzqL4/eOkIpQvNJQsfW+zC00dMoAS7I/WNEmgQr5Qq+TbjmEIS+rEeJm+BSWMm7E9GXKsprl8MAEGGEpXwxqaJDXT2Kv7vKhukVqxc1C7iYG6/dxLQsfidgo2SEF73ZeqlNYme/AKfRsjKmRDbPwXUW38UgTuEkvYcHe895QRLXOiuhdKC0ChCJmGj5kfyMa3aPcaI6Qs/mj8P4aBOatqH8ipc472R+HQ3bSrID3UnZ3M0hHxAFV4nlLt0MPDwdyYUNXPbvdQ/A2yKEjOJyMZSxHmkM7tK6HFzY4urhr/4lCGFWdGUMIImFC9EveA9pP8HDsIJ2mfKCxq4zHeWj01soQWwYhvFnE4S14hn/wu+4YJ5RqYa9EWvmvz5ySL1ZpQ1HAQxpiXNGKmPnUzDxDl3nk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199021)(2616005)(6506007)(83380400001)(2906002)(26005)(6512007)(53546011)(41300700001)(4326008)(66946007)(66476007)(66556008)(316002)(110136005)(54906003)(186003)(7416002)(107886003)(5660300002)(6486002)(8936002)(8676002)(478600001)(38100700002)(86362001)(31696002)(36756003)(31686004)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlBtMEZGeHBRcWVwMHB4aWF1dnBMN1oyTElpYXAxM2NZVXJDNEdIb0ZSbGgw?=
 =?utf-8?B?R2FzUkJHVWpBNElOc3NXUkk3RjZhT3BjSWZDMlBxK0xNYXZJV0xweG1iRHhR?=
 =?utf-8?B?U29TNjdjbmloYkxnOFA3dkJ0UnhMU0VLTlgzZUgrVU8rb2IrYVJJOGZBYjBS?=
 =?utf-8?B?UUx4QlJhK2F4eUREQWpIci9LUlU3R1FZc2hhT29lc05nenRtL3JZQnNIdGJP?=
 =?utf-8?B?TTJUWWNDV0lVMFcvbkdRUHNHTjBvS0NWUWs2c1lqYWhaY29KNzNxQ1pOZjI3?=
 =?utf-8?B?bVM2MzVuR3pwdEtNbFBRVUsvT1lJV2RTSERrNTV2ZXp5R0VqclFFdE0vWUxx?=
 =?utf-8?B?aktEaFZlNXYxUU41RDdyT05NMnBoa3BxczdUZDB1c0NBUGRUZ0F0ZWdGTGtr?=
 =?utf-8?B?YnRqUlBsWWJ4cy95OGEzTmpFWXhHcmFSMmFMVDV0SXZ2ZHBsQ3pXMDJvQWJk?=
 =?utf-8?B?dGlGSVBlVFhlaTVRQkkyZGpSOHFnRngrb3BLMnU4dGZjaE1Gcy9tb0NEdmNt?=
 =?utf-8?B?MkJXbU01bE0xQ3JJdzdUR0ZDUldjeVNnQVRHa05PSisxYnJZc0thOHlGTXkw?=
 =?utf-8?B?SElTd0cybTRtcmFlTmFhZUU4QkdvcEVoTzRHYVU5cjN2dkk3U1l0bzhBY1Nm?=
 =?utf-8?B?QWlSU1pMVFNkY0UwQzVQR1hzZnhWdWpMNmZHMGs4T2MwQVRpT3lzTGE4Y3U5?=
 =?utf-8?B?aGZ2OUxoMUx1cy9kbzRwK0pxTVV6MlBJK0tTamRpMVZNeUdsU2ZPL2VwY3NQ?=
 =?utf-8?B?OC9xdUNkOFNNckpxaUJUWDlBVHQxZUg0ak1PeUY4TVgxWkZkYXN6MTJqd3VP?=
 =?utf-8?B?N3JXNGJkNVFTZjdUY3hkeGZNTUxObGRiQ0R2aUhQQTdxZklJSXNrRlo5dy95?=
 =?utf-8?B?NFFQa3h0eFd2S0pFQ3lwblE4ME9JTUh0TWt2djEyaU80a2I4UzM5c0dvVjVX?=
 =?utf-8?B?WklleWY5azI1VGF1WmhHbFk5UmRkVmJQQ2d4Y0FKY3VJME44cllDT0pEbUdu?=
 =?utf-8?B?TFc4V3BNSVNZcSsxK2RpdDlKOTJMaTNveHVUdzlSVXhMTzNRTzNjcWluRUxW?=
 =?utf-8?B?RFlETEdMV1lLNzhvb0U4dXRwbFJoR29rZlhubzIwNUVJbjRqckF1bVFlMGxB?=
 =?utf-8?B?TVhhZ0RYMThwYTMrTm1SN2ZEVngxTHVtR1RtZCtFcGVKSFhoVHUwMHpRaDk1?=
 =?utf-8?B?RVNlMktBUkltUFhITXNkL1VKZ1dOQk9xTmRoNUl3UXlJNVFvOXl0d2w5Sjc2?=
 =?utf-8?B?TUJ5eWMrbzJKa1Eya2VWcExSR2xmeUdWbDc0SDZXSGZDdWpkdU1nMVZWMDk0?=
 =?utf-8?B?cjcvSWdKUGZ3cFRiT2RvSUsvK0pZRWNMUTJvSUh4UHZrczVhNUo1YlM0bXo5?=
 =?utf-8?B?MEh3VjY3VXZ2RE5EVVhTYVZWODlNUlZnR1QwTTJDcmNtUS9PQVYrb1FFL3lt?=
 =?utf-8?B?clRVNlJZZ000Y3FIR241S1ArOE5JUTZpbytkM1pSYWlTU29MOHo2ckxtYjVh?=
 =?utf-8?B?dEdOSlJ2TCtZQ2hTaHJMZHJHRS9IV2I3dDZoZlEzREdmQTE5MXhURG1JV3hW?=
 =?utf-8?B?SnVDb05tT0xCdFdlVDVoTzRDVW9lbmx0NlM5dTFlMDRVclRWYWtUVmVmZ2V1?=
 =?utf-8?B?bmIveWh2OW9pSWlxQXBpYithUnJ0K1JHY1IvSm1aYlZDdmY0ZklWTGdCY1NR?=
 =?utf-8?B?R0psa2NodVFnWnd4ZkV2bENJbWs2aFJEaUpXTVBaUDhpU1RPYmo5cWNnRWM2?=
 =?utf-8?B?dVMxOW9MTjhZM0pVNi9CVEluSy9OUmFnT2dmZ3FVNFB2L3c1bjRhamgveEt0?=
 =?utf-8?B?Q0dWZGNCeTFkbTBEZEU4cEsrL20reklzUzlJdnhWUUs3eFVoT2toZUdWdlha?=
 =?utf-8?B?MjNaRXZOMU1GQzBGZHRQYlJSTTZZaW93THFTQ0IwZ0h6M1RwWmtkUWN4Znlh?=
 =?utf-8?B?bnBKMmJJQUNsRllaekNwYVFhOVdZcmNRVmIyaFZxZzU5YnVqZ3NsUXNqRzlZ?=
 =?utf-8?B?MjFucUEwZDk0VWFlN0hHaXdCTXB4SDZWSmdmN2IrRXJoMGFOWlpLcUFLZFph?=
 =?utf-8?B?d0ltaFJqWGFCTExad0IrUGlpWjZVeGs5MGtzcURBYThaVkNBYU9NdzRNcXI2?=
 =?utf-8?Q?QQflbsdCZYtY74Gcib3et3qxW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8beee39-b378-42c4-f366-08db4bcb7975
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 11:42:29.4095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajXbDfDc/mJOmnEg/SLlzCr2Co2o+nDsb6Qaaxmmr/9j3NqgErSGuZqW5BQvH3M6m2q+PWoUWgyFXRbSe7hYgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6998

On 06.04.2023 10:58, Viresh Kumar wrote:
> The strings won't be an exact match, as we are only looking to match the
> prefix here, i.e. "virtio,device". This is already done properly in
> libxl_virtio.c file, lets do the same here too.
> 
> Fixes: 43ba5202e2ee ("libxl: add support for generic virtio device")
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

While I've committed the doc patch (patch 1), I don't think I should
commit this one without a maintainer ack, even if it looks pretty
straightforward. Anthony, Wei?

Jan

> ---
> V2->V3:
> - Tag from Oleksandr.
> 
>  tools/libs/light/libxl_arm.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index ddc7b2a15975..97c80d7ed0fa 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -1033,10 +1033,14 @@ static int make_virtio_mmio_node_device(libxl__gc *gc, void *fdt, uint64_t base,
>      } else if (!strcmp(type, VIRTIO_DEVICE_TYPE_GPIO)) {
>          res = make_virtio_mmio_node_gpio(gc, fdt);
>          if (res) return res;
> -    } else if (strcmp(type, VIRTIO_DEVICE_TYPE_GENERIC)) {
> -        /* Doesn't match generic virtio device */
> -        LOG(ERROR, "Invalid type for virtio device: %s", type);
> -        return -EINVAL;
> +    } else {
> +        int len = sizeof(VIRTIO_DEVICE_TYPE_GENERIC) - 1;
> +
> +        if (strncmp(type, VIRTIO_DEVICE_TYPE_GENERIC, len)) {
> +            /* Doesn't match generic virtio device */
> +            LOG(ERROR, "Invalid type for virtio device: %s", type);
> +            return -EINVAL;
> +        }
>      }
>  
>      return fdt_end_node(fdt);


