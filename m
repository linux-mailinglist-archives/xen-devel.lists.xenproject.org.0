Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C55A64A8212
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 11:09:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264586.457725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFZ27-00024k-FE; Thu, 03 Feb 2022 10:08:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264586.457725; Thu, 03 Feb 2022 10:08:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFZ27-00022w-Bg; Thu, 03 Feb 2022 10:08:07 +0000
Received: by outflank-mailman (input) for mailman id 264586;
 Thu, 03 Feb 2022 10:08:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfZ=SS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFZ26-00022q-Fi
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 10:08:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d267748-84d9-11ec-8eb8-a37418f5ba1a;
 Thu, 03 Feb 2022 11:08:04 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-ueIPvqyhM9CwzGkbIdaU8Q-1; Thu, 03 Feb 2022 11:08:03 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB6PR0402MB2933.eurprd04.prod.outlook.com (2603:10a6:4:9c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 10:08:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 10:08:00 +0000
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
X-Inumbo-ID: 2d267748-84d9-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643882884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JxVgD5J3f611iLcCd4U9QBkLVFGWKsoTzez8mxiPSHM=;
	b=ZN9lq86EacezUuInwmKi+cf6I7win/jgfkNx3fU3I5ov9VuKiAg2/NJz0teDOKW5cB5j6e
	0cGIAd3ICJ5e4BZkOjm6VZzAaUMfB37tMFIj5bVhV8YX+kyDUURIuNTgqqv+NTzuYvW48L
	WKVFOncYSi5uD5VF+bzREmZQFb5dUWk=
X-MC-Unique: ueIPvqyhM9CwzGkbIdaU8Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCDpysO7XhlnHeqy8VvvVckiltJmWtTE1lZ4T0ETSAlYfGrZRtJCXpf6/k4iI4QddbmSK1ID2jyAMl8EevovoVzPDOnDxmcbOpkPnbQEq83IM1bWPQOQdTR6LIKi998juSXdgy2kVA/NQVk8GgQUvawbIqtCjxWGx1KdAbXxLcXFFuGgEke4XTEwY3Rxxpj3ey4/fxrffMp7nCjX3lpXQZoluCO0+hf9sBdGNqUvhtbip9zLjv+/39aYAT4VnXadreHa9khXc86jv/HDM3KDX4cpqiWcYBcKsqlzYvC1tE8JiO/ay4upq8UZp53HoRbzKaW+ea9+PTVRmebTE3/Xaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxVgD5J3f611iLcCd4U9QBkLVFGWKsoTzez8mxiPSHM=;
 b=E81fpwMpGgEpFU0i28PoQvSb8RPvtS87v5yRHD+u4kC0wpOFMpzJCP7x0lswca2bjV2S0cRrwqRPT7DSpTEm+YasOlMIIfF2/vfoa9UPTvU7zTuSXvE5cg7eSnyV8cuHugJGvE02Xv+bO1q3ZG/CI23rx/Yta1mnRxgUy+YGKfftmI+R19LouYnxVGKO2j3/RsimeNxyrdB3IF6D+JQXpFBFpp8gZ6jluVMcMmfFsHCdxIZAxO1zndN99j7AOq4UgnZhfcsnc54QtZvW1SmgZAsp5yvAjkWgHCLqZ+n0Y2+ZHOHKWEpDhvXWTDZw171zQtwHlAIP7DzFwcTtuhS0KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <efe591ea-36c9-0ead-727f-600ae3c5ed05@suse.com>
Date: Thu, 3 Feb 2022 11:07:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] docs: document patch rules
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220202114448.8608-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220202114448.8608-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0076.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b584c427-51a7-4122-8f89-08d9e6fd0f19
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2933:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB6PR0402MB29336675ACE25BD36EF37C83B3289@DB6PR0402MB2933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oS/ula1cyGDAqMR62cpTM6Q2Goc+WICKR9s8wd8n6AxqpgHLDEJnus5Nj2w8MESXKwgUnGQduJFwC1w8pHJDl1l7r6FykfFwST51tE4c2fS7AEL6o87sO+jeb6pemBLNb+tQm1e9GjRSgwblruegL1GGQtOvN6x2yHwdh5RPCHEKBh83GM2j50PfUVgb8a7YG6QM0P1OFEejKYnEuKubgoiIGGl3QeCnMJR9EYzZpbovK9TQWw12OfDcZPfILZGyHTKTz7h4gn2z/Nxz2ovQHSKIVgz9JaMzanvl4wxfGh6DhvSZUxgFt1xEop/vhKKIzCluLYdz1NPHMQiBLI9iGr3Hx0DwxWiFn7NnwJ/d3ZCjV893FH7b9wBEYeWw7THLXKZoIURwGY3Xp/fjfMYkpXLt1I5pinKAvccQwQZEh0K5yqg9zNxQoiMcPG62cnYyt5wHIknq5ZrNDwkdqmRcMIWQNWXf/Vz18CGk2mnMrqkw9TTEBLXSZO4N5vv8eqYq737WnbpgNJIWsiPjDJXAfZBRQ4hyHLNQxDfzQPT2H2LZOUh6sQF0FmpQv+bzbQZpFE1Nbgy/ss8wFvewf/nHRX2B4qbMrzqAaghxGf9o3WcAUAVrV+L2qkuG6qFtC6gXGccGyjHOj7hmKRWEPKBpByzjlran8+GtnDWab9ctShqy02KUJvZjEhzV3e8EafFqqIKLo3t8TgoVrz0CjM10wxbT+fR08sH9HBvOtxrjl5QjY4Oqp+e204EzKcFJUS4H7g/qTgydj/62mIVq24LqPqzhaKtZ/UHV5G0OqSOmQfA+uJvghwejvcHS3x1mcdps
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(83380400001)(66946007)(2616005)(66556008)(6512007)(6506007)(186003)(53546011)(38100700002)(86362001)(31696002)(26005)(6862004)(36756003)(8936002)(5660300002)(8676002)(4326008)(6486002)(37006003)(31686004)(508600001)(316002)(6636002)(54906003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dU93STRWTFZGeTNZZEFHMGI2K3BHTG8vTm1scDI1T3R5SHp4bTJ5eS9QSHNZ?=
 =?utf-8?B?ajFFWFZqRFRCNFhzZWNwWXZpUlZrQTcyeC81STVZZm9GUDZvbU5HU043cm41?=
 =?utf-8?B?VzIrN2ZVdVp0dFg3R3VxQWQ1SmZEaWoyNFo1SVdLeDRORnhQY2l4NUxPQVlQ?=
 =?utf-8?B?Y2dqOHFKNDZYUUdyb1NQbVRuekVZVmtTNng1UFNGOXVFaHpPUDNUdkNpV0Jq?=
 =?utf-8?B?Wit6VzJLeUNvRlo4bHh6NndNY01tRWhORnRzNDBwYVRCVCtGdkpRU0xLaEhz?=
 =?utf-8?B?RUZvcGxJZTB1N2dXZXExR2ZkVDFobHNQbmVQeDJ1N2Fhd0t5cmp1YTdPcVht?=
 =?utf-8?B?ZHhjUmdSczJSZ2FqNHVweDhuakJTdEtPNHhlK0pnNmQ2eG1TdWJTMUY4bHlV?=
 =?utf-8?B?K1d6amppRmRJY0dqbXNuc3F2ZktNV0V2TysrWUNBeHhoZVhuUXJVSmtDdHc0?=
 =?utf-8?B?L3orL0dBMXFUVVNtaXgzbklzZ2NVZUZwMGtFd3pBUk1uS2hkRmQ4Vi9ZaWo5?=
 =?utf-8?B?aFp6M3QvZjBkNHpaR1MyQitnNkhqQ3FEK3VHMmpERjMxV0lDTndDdm9RYW5R?=
 =?utf-8?B?NGhLT1ZXU0VzcFI3Yit4UlZUQnpKTmpxeHkvZmpCUVMyTjN4blc5akQySHNU?=
 =?utf-8?B?Q0dma1d4SFY1QkpLczhkUUFiK28yRlByS0lPZitwbGUyR1NhZ09DaDdQd3FF?=
 =?utf-8?B?eDhpcUw3TUp6YnREVk1GVzJzaVdBTkQ2dFV6aWpkV3BzazBVekNNREdtRStZ?=
 =?utf-8?B?dE9GL0hlUU0yR1ozSkJjdzl4c1FOUmxNbFlqbFNScHoyYXpXN0ZXMWlzNzRl?=
 =?utf-8?B?R0pWWXZFeFUwaVBpdEhLc3NFZnhwVlZCdnBkemhZQVNEdjJseDBTcitXQ0tH?=
 =?utf-8?B?L3VwUmtITVF3UDh1b09MUmZwRm44bGswYitIcjJ1bG93VTllOVpjbXdINThK?=
 =?utf-8?B?U3FXZUw0MTBoZTd2VmhHOElTUGVDb1VRRmFEMWJUeTNVeFRCZ0trU1pTWjVU?=
 =?utf-8?B?czJLblk1L1JhMHNmLzVkTnNNYUZwN2Z2T0RGZkFOS3FzM0JmV3dSbDF6K1ZX?=
 =?utf-8?B?bzloQUFLNDdUZ1hKajBYc0hydUh2ZVFiZExjZHhvamNNc1lFRm1mVHdmKy9T?=
 =?utf-8?B?eVBTTFMyRXlVSGNjaHo2TzZ0SkJZcFovdE1hNDFkbWZkTmpxd0kzeXBlQmlv?=
 =?utf-8?B?aEpqTHNCVkxCcXQwT0dMSWpxazhTZ0xSTWRQQmloVXhDSzNESEFvRXd5R2hZ?=
 =?utf-8?B?blRvY2VMeWpta1FaaWpqeENicmNPTlVNSElCYXFnK0xZVHIwNWRoN0taNWdD?=
 =?utf-8?B?MGwrVytyaEt6VnZINUJwcHRWbWxRV2VJZExtMnE5bUZVa1lla0JLZjdyM3R3?=
 =?utf-8?B?akVQRFp1alpkL0VXVm9IQWdrQ2VsTHFHcUFXMjNKODdnM0xKYjI1WjNnWW54?=
 =?utf-8?B?WFR2L25DWUUzNFRiVE03eC9VZjdiNEF0djFGODYzSFJFYkZlYTY3Ly9ORDRM?=
 =?utf-8?B?V1VIYmVGK1NDVzAzUHpvb3hSVEcxL2tvWCtHUTB4dWx6d3BQVWdCb1BsWDFU?=
 =?utf-8?B?cHFPdHV3NTdtbTVzUi9sOGNjRWF5c2ZOYVRrclNZb3ZZemNlYXI2bEZETGM4?=
 =?utf-8?B?a0RPSUdMZGhWY2QvZ2JaaGNGUUdoVGNMcTVyd0g4L3hvc3h3R1I3TStPTUtX?=
 =?utf-8?B?bkNZQmVXbHlDdDNsOUlmZ2VQR3NzTmlXNTJYekdXZnY4cE5NbUFBWFJ5K2Np?=
 =?utf-8?B?UWJDempaZzlCd2N6bnpHdzhpWldHZEo0bFpBY0U3VG91UHpoYmhKTU5DdnJl?=
 =?utf-8?B?WGpPUFRkNVNWTmFtMWVYQWV1cjJuUndTbG1nT2U5dWNScjJSMXByK2dpMDli?=
 =?utf-8?B?OEdiZndza29jOHhELzlKL2dpQkZTUWdJMHVkNmZVeWlKZDdrY1JGbHA1eW1s?=
 =?utf-8?B?aGRqSS9SR1E1K1k1aWgweW1OU1hTRTYyQndoWTVuRGsweGFpZ2hRMkxQVGho?=
 =?utf-8?B?Z0RVcEt4ZENoYUVZOFpjWWtoU25QQytrQWVRL1FpcWpNamZoaXdIYkIxd1pm?=
 =?utf-8?B?eklReG83T0F0RG5vWXNPNFR6NnJjZTV2YUR1aS81cGlpZDlwQmsyY1AyMXh6?=
 =?utf-8?B?d3ppOVhkSlNTQndaZ0Q2cmtmdTAwd0x3ZzlKV0d6SlpDeXFSOXVibWNTd3Qy?=
 =?utf-8?Q?G1bHRGI1Ya3TAx/baqK7HRM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b584c427-51a7-4122-8f89-08d9e6fd0f19
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 10:08:00.6427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fif41imNLREFcivWyJZl/0yIYgCsVMzdu8JW5goU3lLNDFrcMsIUplhntk5ayVn1BxaEcK+cJ9AXDc4I0ECP7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2933

On 02.02.2022 12:44, Juergen Gross wrote:
> --- /dev/null
> +++ b/docs/process/sending-patches.pandoc
> @@ -0,0 +1,284 @@
> +# How a proper patch should look like
> +
> +This is a brief description how a proper patch for the Xen project should
> +look like. Examples and tooling tips are not part of this document, those
> +can be found in the
> +[Xen Wiki](https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches).
> +
> +## The patch subject
> +
> +The first line at the top of the patch should contain a short description of
> +what the patch does, and hints as to what code it touches. This line is used
> +as the **Subject** line of the mail when sending the patch.
> +
> +The hint which code is touched us usually in form of a relative path inside

Nit: s/ us / is /

> +the Xen git repository, where obvious directories can be omitted or replaced
> +by abbreviations, or it can be a single word describing the topic:
> +
> +    <path>: <description>
> +
> +E.g.:
> +
> +    xen/arm: increase memory banks number define value
> +    tools/libs/evtchn: Deduplicate xenevtchn_fd()
> +    MAINTAINERS: update my email address
> +    build: correct usage comments in Kbuild.include

I realize there's "usually" in the wording, but I'm still uncertain in how
far we want to suggest paths here. I have to admit that I never really
liked overly long prefixes like the "tools/libs/evtchn:" you give as
example. The prefix should be sufficiently unambiguous, yes, but in this
particular case "libs/evtchn:" or "libxenevtchn:" would be enough to
achieve that.

I'd prefer if the tag was described as specifying a (sub-)component (or
other abstract entity, like is the case for your "build:" example).

> +The description should give a rough hint *what* is done in the patch.
> +
> +The subject line should in general not exceed 80 characters. It must be
> +followed by a blank line.
> +
> +## The commit message
> +
> +The commit message is free text describing *why* the patch is done and
> +*how* the goal of the patch is achieved. A good commit message will describe
> +the current situation, the desired goal, and the way this goal is being
> +achieved. Parts of that can be omitted in obvious cases.
> +
> +In case additional changes are done in the patch (like e.g. cleanups), those
> +should be mentioned.
> +
> +When referencing other patches (e.g. `patch xy introduced a bug ...`) those
> +patches should be referenced via their commit id (at least 12 digits) and the
> +patch subject:
> +
> +    Commit 67d01cdb5518 ("x86: infrastructure to allow converting certain
> +    indirect calls to direct ones") introduced a bug ...

I think this should have a reference to the Fixes: tag, as generally it
makes the text less convoluted if it references such a tag rather than
spelling out hash and title a 2nd time.

> +## Tags
> +
> +Tags are entries in the form
> +
> +    Tag: something
> +
> +In general tags are added in chronological order. So a `Reviewed-by:` tag
> +should be added **after** the `Signed-off-by:` tag, as the review happened
> +after the patch was written.
> +
> +Do not split a tag across multiple lines, tags are exempt from the
> +"wrap at 75 columns" rule in order to simplify parsing scripts.
> +
> +### Taken-from:
> +
> +Xen has inherited some source files from other open source projects. In case
> +a patch modifying such an inherited file is taken from that project (maybe in
> +modified form), the `Taken-from:` tag specifies the source of the patch:
> +
> +    Taken-from: <repository-URL> <commit-id>
> +
> +E.g.:
> +
> +    Taken-from: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git f093b08c47b3
> +
> +All tags **above** the `Taken-from:` tag are from the original patch (which
> +should all be kept), while tags **after** `Taken-from:` are related to the
> +normal Xen patch process as described here.

While I don't mind it becoming "Taken-from:", I'd like to put up for
consideration the (slightly shorter) alternative of "Origin:".

> +### Reported-by:
> +
> +This optional tag can be used to give credit to someone reporting an issue.
> +It is in the format:
> +
> +    Reported-by: name <email@domain>
> +
> +E.g.:
> +
> +    Reported-by: Jane Doe <jane.doe@example.org>
> +
> +As the email address will be made public via git, the reporter of an issue
> +should be asked whether he/she is fine with being mentioned in the patch.
> +
> +### Suggested-by:
> +
> +This optional tag can be used to give credit to someone having suggested the
> +solution the patch is implementing. It is in the format:
> +
> +    Suggested-by: name <email@domain>
> +
> +E.g.:
> +
> +    Suggested-by: Jane Doe <jane.doe@example.org>
> +
> +As the email address will be made public via git, the reporter of an issue
> +should be asked whether he/she is fine with being mentioned in the patch.

Besides these two we've also been using Requested-by:, which I think in
some cases conveys information more precisely than Suggested-by: (e.g.
when some result was to be achieved without a solution or path there
having been given).

> +### Reviewed-by:
> +
> +A `Reviewed-by:` tag can only be given by a reviewer of the patch. With
> +responding to a sent patch adding the `Reviewed-by:` tag the reviewer
> +(which can be anybody) confirms to have looked thoroughly at the patch and
> +didn't find any issue (being it technical, legal or formal ones). If the
> +review is covering only some parts of the patch, those parts can optionally
> +be specified (multiple areas can be covered with multiple `Reviewed-by:`
> +tags).

I'd prefer if the comma separated form was also explicitly mentioned
(and hence permitted) here. I'd even go as far as suggesting that this
should be the preferred form as long as line length constraints permit.

> It is in the format:
> +
> +    Reviewed-by: name <email@domain> [# area]
> +
> +E.g.:
> +
> +    Reviewed-by: Jane Doe <jane.doe@example.org>
> +    Reviewed-by: Jane Doe <jane.doe@example.org> # xen/x86
> +
> +In case a patch is being resent an already given `Reviewed-by:` tag can and
> +should be included, if the patch didn't change the portions of the patch
> +covered by the tag,

May I suggest to insert "meaningfully" or some such here?

> or if the reviewer already made clear it would be fine
> +to make specific changes and no *other* changes have been made.
> +
> +### Acked-by:
> +
> +Similar to `Reviewed-by:` the `Acked-by:` tag is given by someone having looked
> +at the patch. The `Acked-by:` tag can only be given by a **maintainer** of the
> +modified code, and it only covers the code the maintainer is responsible for.
> +For this reason there is no optional area possible.

I'd like this to say "normally" or alike. Maintainers may choose to
restrict their ack to less than what they're listed for, requiring
remaining areas to gain another maintainer's ack.

> +## Recipients of the patch
> +
> +A patch should always be sent **to** the xen-devel mailing list <xen-devel@lists.xenproject.org> and all maintainers of all touched code areas should get a

Nit: Split this line?

> +copy of the mail via **Cc**. In case some other recipients are known to be
> +interested in the patch, they can be added via **Cc**, too.

Prior to or alongside "interested" parties, I think we will want to mention
dedicated reviewers.

Jan


