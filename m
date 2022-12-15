Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 390C964DD5E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 16:11:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463481.721671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5pte-0008Mr-GJ; Thu, 15 Dec 2022 15:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463481.721671; Thu, 15 Dec 2022 15:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5pte-0008JV-CR; Thu, 15 Dec 2022 15:11:42 +0000
Received: by outflank-mailman (input) for mailman id 463481;
 Thu, 15 Dec 2022 15:11:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g8Eh=4N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5ptc-0008JF-4H
 for xen-devel@lists.xen.org; Thu, 15 Dec 2022 15:11:40 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2042.outbound.protection.outlook.com [40.107.105.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5f0204b-7c8a-11ed-8fd3-01056ac49cbb;
 Thu, 15 Dec 2022 16:11:38 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6877.eurprd04.prod.outlook.com (2603:10a6:803:131::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Thu, 15 Dec
 2022 15:11:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.011; Thu, 15 Dec 2022
 15:11:36 +0000
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
X-Inumbo-ID: c5f0204b-7c8a-11ed-8fd3-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axKXVODExE3rcY2W+DbtZtx8IeokM+vItLaGElPFsFhbkEN2+2QvpPatZBq6Fo8k7G/h4aXVDBlPUIsijiSjDDF3dbPPABaJNuv0BmAPVBNLVzXspO/6OHglo6Pm6r0mL1qjw8eu0RgXTa+4wtIhujOddNuLMskvqUdRLz00dHFPhNkEZmyeLjUNYqvgsVPU6RUAzJ0VSjZx68E+k7Ir8ZIJ0mTPaN9CtiMS87JMTbwMugKwKeVCXw0+vf7uHUI06atT0txNs5gaG+O1sGZhVBrmNlH1j3Pju2UCKPgA+bwJf2RkB0cr4D8HFj+YNn7FK+Tkg+mZY3vCadIdO5bTXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mr0lf+gRcRWfpIfw24gPuFVeEyhcYWSXwZxGzjq7tlA=;
 b=QnPvFo/4OidF5wGe8Uzt1YTW0f9x7F3wozf+MYNp+yZDyszdcdRikc4PPu/qlOVxEyHctZmFEMsQDHtKmmp0K6nKz/g4cf3c6LzUQfB2zPjOUwt/405/+KiNQ9CQTZL1KU+Q4GZsTq0MiBxQHU2FMZc3H35zwk5mmJTsSwUdx5+0geIQDyU1ezTapYgGFdt9OGLeTOksIfXO/fqVMx3t3+DDcHIc8AhfINgHwDbvUp7lnk0KqFIz0BlWBIBOFlgFMXR7BNyoyiIMEBcn3Gidx1l6ofCtS5P3PT9MhVwcI/76600hwq1glBe7jJEnmcwqRx2UcnGap4ZXhzOZdRdX2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mr0lf+gRcRWfpIfw24gPuFVeEyhcYWSXwZxGzjq7tlA=;
 b=g4Bp1KNSy55pNCZ6bQn1grjjB2QGgk+zs+CI7h4eF34iQFcT6D+v5INK3SZ7syIQ13r7wSNxn5fOwfn5KHLwDZmS95A0zwSyFKrv4N5KU+IYzwzyNhUjKuafm0UWMVJbZj/S78/BYkdQQ5OJ7yQuweVZAd3siWjFUF7bbuWuudS7wsHE5DkjI0GhZPJC1pP2DyDCb2j0dbstxjzQoaamXzGSjLZPIkz5W6kG2nLsZYl/f5IRjXTfhwiH8DRFcOsEBeEnDlOpBJX+fExV8LB9AmQgHZ8ZPCWOOeSoY3NsN+N2YkH7W1nwU6cWmRkrGJRQHcQxRwtHTEASPPCDNbi3Hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b4c0e361-2b6a-f7b9-941d-4315144c6f65@suse.com>
Date: Thu, 15 Dec 2022 16:11:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] libxl: virtio: Fix build error for 32-bit platforms
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: xen-devel@lists.xen.org, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>, osstest-admin@xenproject.org,
 Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu <wl@xen.org>
References: <aab5f13a-782b-cb4f-ac8d-321f865c8281@xen.org>
 <d4cf6539ff179e7ade820feadd8088f33da49196.1671111056.git.viresh.kumar@linaro.org>
 <Y5slue6ujqmCscJd@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y5slue6ujqmCscJd@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6877:EE_
X-MS-Office365-Filtering-Correlation-Id: 40546d5e-4a88-4704-58d2-08dadeaea8b9
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VVTydbz2rOv3cKpRz/V/6zL96StNeJe/AFjp0Ms+u/U3fo/GTBcdPt9IGjJSJQ6pq8DrXVtRzYWqEk20n9yF51nv9pqRBF8lx+WmVZvCexK40wcWKzpffzuB5su4LSH4WZjXMnNxLXWHuMJuLtXiGpOrXHVJoZ3dwLMTFNxomEYD02rsDxnAYXU2Gzoaim6h1Pkwud0+N3X6amgD/7WwQXUmfS2Onq0/f0/1Qt33SPP8SPLaf0nluiV+SWBN9jNTCcLVSQfaT2fx+NQfWD98lk/Ws9HLdGpXaI6BSGc+MtgkhvtusrRW/S+yTFkZ2FW03S/Bgpf/o88HtHmHGqpVYptklrkFj6MtewQNzd6U0TWDWwENyawYomHpDYDWZfkfIKu7ofJAiOxVsUQsYcTmlZbc4UgV0LXDPDZK4vK+SMpKrUPTcSwSbB8l5A14d02JpNwpOApDSX8drnEFrJCJjtbvzt2yG4WqUSBB5AoVSmWljhVyInaKaoiS6BnlCwXzKVsGTQRUZjlROE5xntJIvUbMvCKiMsbXkMIkoSpZqaMvnF93Cj0lKJxxjseyMdsEAFKHw+wR8tTa4FnY6pjUuHf6Sagcj7ihf9LdGjZ2MvdH8U2RQDnT+sjxBctDcRtK1CAF3XQpdonJsIUUcTAoRbIIft8KEHImJIBwJ4KNlg/TSoeufeD6zN/C2rTCKuXR5G+GJPKp9hc/1c/wnbsLQ6JdKKGYMKNvrQm5GB3vFQY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(136003)(396003)(39850400004)(366004)(451199015)(83380400001)(8936002)(31696002)(86362001)(8676002)(38100700002)(5660300002)(7416002)(2906002)(66946007)(66476007)(4326008)(66556008)(41300700001)(6512007)(53546011)(26005)(6506007)(186003)(2616005)(110136005)(54906003)(316002)(478600001)(6486002)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXBlM3l5R3F3NGVPTTZuM2pDSms5a3hLY1gzUHlUUmdLeEJEaEQwRC9UbmVp?=
 =?utf-8?B?M09IZEd3ZmJlU2JIVnAxdDI3ZEo3Ukd0R2srZW1ZeE9XZDcvYUVTQ1lQNWdW?=
 =?utf-8?B?SGZSVWZXNVhsOWI5UFo5NFFneWdKQlVBM2p4VmlrMWtKNk1aRnFOaWt4YWRE?=
 =?utf-8?B?eUxnS3Z4c0lYWHZZVWgwS09aTUM1S0RPUHVQcDF2YW50S0laN2NLV0FyNC9Y?=
 =?utf-8?B?eVhXSmVZUGhBTDVDZG0rV2p1QVVrTGtpQ1M4YXJVRW9BQmxzNUNleW1yVkxH?=
 =?utf-8?B?UmNxWXo2S21UNVVxOWtOYlJrcElzTkVyMlFMU25vRzVVbE5YRkE5SThXaEsy?=
 =?utf-8?B?bUUrdUI0NS9QVVVNdGJOYk82YXV2Si9PTDVvWGkvN2JINWRKOFFST1FYREdS?=
 =?utf-8?B?dXo4UWxSY0VwSk01TTF5R08reHBhUWIyYjEzVHZTbUw5a0pIYlpxRlAwRFFz?=
 =?utf-8?B?ODlVRU9OcXV5NUlxVzVydkluZmduaGdiNk9OTWtCb1l1MHcrZHZ2WFNwQWow?=
 =?utf-8?B?SFRxYStsMWdDMnhuWTZRWUVIM0hFcUlxWDYrUE40QlYzNDJLYnk3SnVRQkRi?=
 =?utf-8?B?Mm9HdzcvcGQrRC80WmxwMGxNVUxPemIwc2NDd2M1amo3dnVIdGNMVzF6d2Fu?=
 =?utf-8?B?cy85am1FV2tMTlkzNUVvMVVHN0hhb2Iyd2MzcWZWUkhEMEpiRFBKMjEwQllv?=
 =?utf-8?B?dmsvZ2RCZ0VXTkNPZS9EZzRQcGlib0dqSDFVY29ZM1gyRUNHMEZZQ2JZajZO?=
 =?utf-8?B?THZpU24wYkg4SGFzRTVBQ0JycWNmb2FnVVhtRVZCVkNFR2xzdGJPMTcwanZ3?=
 =?utf-8?B?K1k2WGZ4YjFkeXAya01XWDdGNEVBS3FoWkg3VmorNk00U3kra1k5bTRrVGpN?=
 =?utf-8?B?ajdMbmdCaTk1V2tRbXlLb3VvM1N0R09IQ1ppZE56NjBkOTFwTmNEZWU0UWo4?=
 =?utf-8?B?ZmZJcm04UzZHUU8wOFNqUCtJRllUT1VaVkE0Y0N2RGpvYTN1RzJmZVRrZVN0?=
 =?utf-8?B?WFVKNDEyV3htclhyc0RoWUY0UmJ6K2kyN3FYWHd0WHpDY0xjT2ZodHllaC9X?=
 =?utf-8?B?S3dHZkY3eG1zcWx4aUtUT2dLdkV3TzJHUzNUUmNxblNTZU9lQkR4NUFDVGFI?=
 =?utf-8?B?SmxRa1BjRDRjSWVIVFMrSDZWV0ZrMjd6WFNzSEptNTZxdm8yNjJaMm9NVEoy?=
 =?utf-8?B?cHZpNGhYWENUdXp3cTNTL3dVR1pyL1VpSzdTVUEyVGY4elJIdTFUTm5IaDFv?=
 =?utf-8?B?b0syMUdUVmNrcGtONmU4NE1NcDhldmhMcW5qR2orV1dCL3hmMyt1Z25razlB?=
 =?utf-8?B?dlIvMnBaMkRYWlZ3WHNjTmIxVE9SUTF3STBTbHBHcExkOTlDZ25CYXd2b0l3?=
 =?utf-8?B?SlgzN2s3OVdmWGdJL0lCV09OcEFsdldPc3dyNStzYVpIck9Mc2JTYUNKRHJu?=
 =?utf-8?B?dFcvNWY3STZ1dnNIZU9BeGRMamNYSStzbUtxSUZvalUxTzU1SVRkaDc1cC9K?=
 =?utf-8?B?WmIyNk9RMEpYZWc0OUF6elY5MS9uc1VRM080ZlJoZ1JIVTlXM2NLMUFLRFhV?=
 =?utf-8?B?Yjl1LzFVRStTVjRzRVdZVlJEQmRiSlpZdnJVYUNaQzlQNEc3Tk04WFJBZzZh?=
 =?utf-8?B?MUJXYWhTWlgxNlpOZHBGWERZQWpXcjlCZGliZXkxcWpQNVgyOWlKMjI5LzRk?=
 =?utf-8?B?RnJlc2RYRVBhNmFYaGd5NWh0cXVKZVhUdEdaMk93YjdMWjF1WHRDaVppcmVt?=
 =?utf-8?B?clZvN0JpcS93ekxaSkxYRjV3RVdnaGwrTEorVjZ5RlVRYVFmdEpJczFGREln?=
 =?utf-8?B?UFdYVWxUcklsNHFYL0ppSWVxZTdaQ1BRb0l5UmkrMndzS0hqeUZqb3lGMWFN?=
 =?utf-8?B?K1VuMmJsQ1ZPNTVvSUJNVzNsQUdCYlFrQzc4NzdtQjF1bWdBVld6eGV6blNh?=
 =?utf-8?B?d3pESnRCUStCWjlSUHBYYjlPaTdIeFpzQnhGcWRFUVREbEFyWmptS3hCNkZV?=
 =?utf-8?B?N1Zzcmdrakx1S3U0R0tkTlhVTUh0RU96dFZJaUdNejRDZ2R6QWVTWGI2NFhC?=
 =?utf-8?B?QktVbTQ4S04rMXVSSE1CUzR6dm1PNnFKQmRGZHRLUTFQQVBCeTNhNFlVK1Ru?=
 =?utf-8?Q?mqouFF/Pmnp/BYl+SvJvnJTTL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40546d5e-4a88-4704-58d2-08dadeaea8b9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 15:11:36.4303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cAi83UEL46KZ8IHtpPPvv7VS4tqq/I/stIFrE35sHLsKffRQpprpj+t3tWksaHRZqM+b7jwoIHKSm7m4VhUKtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6877

On 15.12.2022 14:48, Anthony PERARD wrote:
> On Thu, Dec 15, 2022 at 07:01:40PM +0530, Viresh Kumar wrote:
>> The field 'base' in 'struct libxl_device_virtio' is defined as uint64,
>> while we are printing it with '%lu', which is 32bit only 32-bit
>> platforms. And so generates a error like:
>>
>>   libxl_internal.h:4388:51: error: format '%lu' expects argument of type 'long
>>   unsigned int', but argument 3 has type 'uint64_t' {aka 'long long unsigned
>>   int'} [-Werror=format=]
>>
>> Fix the same by using PRIx64 instead.
>>
>> Now that the base name is available in hexadecimal format, prefix it
>> with '0x' as well, which strtoul() also depends upon since base passed
>> is 0.
>>
>> Fixes: 43ba5202e2ee ("libxl: add support for generic virtio device")
>> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>> ---
>> Couldn't test on 32-bit platforms yet, but works fine for 64 bit one.
>>
>>  tools/libs/light/libxl_virtio.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/libs/light/libxl_virtio.c b/tools/libs/light/libxl_virtio.c
>> index 6a38def2faf5..2217bda8a253 100644
>> --- a/tools/libs/light/libxl_virtio.c
>> +++ b/tools/libs/light/libxl_virtio.c
>> @@ -45,12 +45,12 @@ static int libxl__set_xenstore_virtio(libxl__gc *gc, uint32_t domid,
>>      const char *transport = libxl_virtio_transport_to_string(virtio->transport);
>>  
>>      flexarray_append_pair(back, "irq", GCSPRINTF("%u", virtio->irq));
>> -    flexarray_append_pair(back, "base", GCSPRINTF("%lu", virtio->base));
>> +    flexarray_append_pair(back, "base", GCSPRINTF("0x%"PRIx64, virtio->base));
> 
> There is also PRIu64 that exist, which would be perfect to replace %u.
> Could we use that instead?
> 
> I'd rather not have to think about which base is used for numbers in
> xenstore. I can't find any hexadecimal numbers in xenstore for a simple
> guest at the moment, so probably best to avoid adding one. And using
> hexadecimal isn't needed to fix the build.

Otoh an address formatted in decimal is pretty unusable to any human
(who might be inspecting xenstore for whatever reasons).

Jan

