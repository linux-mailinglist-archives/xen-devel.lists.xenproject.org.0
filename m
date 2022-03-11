Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C8E4D5C92
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 08:41:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288807.489852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSZtk-0001kx-3F; Fri, 11 Mar 2022 07:41:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288807.489852; Fri, 11 Mar 2022 07:41:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSZtk-0001ic-0K; Fri, 11 Mar 2022 07:41:16 +0000
Received: by outflank-mailman (input) for mailman id 288807;
 Fri, 11 Mar 2022 07:41:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3DNt=TW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nSZth-0001iW-SC
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 07:41:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f7d2da7-a10e-11ec-853a-5f4723681683;
 Fri, 11 Mar 2022 08:41:12 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2051.outbound.protection.outlook.com [104.47.8.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-kNqtzLyhOjGB0hFoQRA3WQ-1; Fri, 11 Mar 2022 08:41:11 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4365.eurprd04.prod.outlook.com (2603:10a6:803:49::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Fri, 11 Mar
 2022 07:41:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.022; Fri, 11 Mar 2022
 07:41:08 +0000
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
X-Inumbo-ID: 9f7d2da7-a10e-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646984472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lKb6F2BfGn60D6OxmqevToHZVaT6xiH8n9n5hKW7J/4=;
	b=cdTB6/AHBTqU+sgdK6TRZdl1BRgARFMpO5SFwxZbq7rThITNB0gtfPTSkQVowGlhiXIH/d
	ILVPGy5kYEoPsCdiZertZFJt9OAlxcjWgspAlfO140KBGWsNFLvwTBWn2D6yuSGhx0DXik
	c0ixywnNJxH+iwtpdPHMDbUESGAG1G0=
X-MC-Unique: kNqtzLyhOjGB0hFoQRA3WQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1VxCOAn9Qfujs5qZE9um3njrNHuDRdNQIdUq/aGox74bFbbrnTrwFLyRPtYv4kuPhm1+kFrOls89M0rYuPVXhlyo8TdqNd7lGkinEXSVOY8+I70M/hUh4vxT8vlEZ0lX7IWO7wUX8Xxvnu9hIwhNANmW3j6Uun1uyhebv8LL8gcoXoqwY2kUSyx/T1IqpeT1UhkQYISICkHJxtUedFkWbf9N8hPMxpwYCBm5esnrvkN2xUecbmHCwseheHXAjwV/FfDd42v951HypbWcGzOGoCPlaZxiYJJJm5GwtLQRAQjqHThMODxdHhp1uKB5nGrUfJ3AZM6WBntu4DmuiSQpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKb6F2BfGn60D6OxmqevToHZVaT6xiH8n9n5hKW7J/4=;
 b=MLcMfFyRFRE/e0k93AO7jMRXeOZ50BA3U1QMvDOj8d/4yFNnLX2jf7qvxMBCg/YZWV50uLebrJa1PgXIKhCcDiOfcXWFWiEQ/+vrAvBg65khiAkqxrEMBglTcuXaNWD5HA2nZ2ZhOOOg95Q6m9IQI1+XSHICVxhRLG7lFzb3KK3rtmi0JW/O1qrqQdOUpv+YG/Kszi3cqXzpMiI3bQ8Iw3IsKL/0q7VRUdmbtlBAvKmWcnTXQXZrv82Eb3QKxuiVM9FkR/zEKqn6HihK+A1fg/7qU0JuYshb9aiwYazxP+GA7POdYPt2D6QN6ONFuQFllTupKz2mw6eD0VdSHfWfsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f02e8704-90a7-aa8b-eda6-5f7a9a6a4e3d@suse.com>
Date: Fri, 11 Mar 2022 08:41:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 4/6] xen/cpupool: Create different cpupools at boot
 time
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <20220310171019.6170-1-luca.fancellu@arm.com>
 <20220310171019.6170-5-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220310171019.6170-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87d67929-4e01-43f2-c732-08da033281c4
X-MS-TrafficTypeDiagnostic: VI1PR04MB4365:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43657AA165C2548A22EE405DB30C9@VI1PR04MB4365.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GdhAipbMMvJ2Te+3SJf9sAUm/HOIjxaE6OLNYXTqAR4ed0gs7xp9K1lMNh20gjkAPeJJIWuKXNVCiTZnINi8VguM9/tdZApCVHnh1LTomc26IIBzrFjSaT72jlz1ZGqXA0YquUwpsq+bu5T3hUHrH/8cvkNQrBK1CydiwAW5+n6o+PsKR/lts29fHkPyGcBU8AtfoUhYd/kRo+CNP2Y9jb+d8MuR7txTLhyecZ2iMzX2anUxbO91A7XFhUQH4QxEs+4tVweGb6fZ+Y1La6Bj7mS6HJs9Vnne/rNuAZzUaPyszppFsuD0d5eqgBGdhpw15L5cHXDJKRBtipcfTV84JzHwQRJFc/uZbeB4cIC4uQxmp2q6eeNgfCS6uic8Bhf0is9oYlzTCx/5XoNxa8T5GX9kKqKRPLGUz8LH01SZ1i7uHP05SX1xkRW0+Q0Eb2sO1wwwtriVjXKMeaN5Lk1um1EbwuEelXivYsAYfJvOV86R1QXKNGpNnWovTbLU6uWC6FUkv4vwmLBQpJ9IXE0bi0g13oahGb9YrOSIfKG7cdJNtA0GV6mPDvgp1TlshP2Yj2B60yacTSx0/h4kUFssya3X7BrmUfVY+UY2/2MKZA1ARtxd3CuZqjXxpd3/g87R2lXUARVw9vzCSaPvHF2URPEt65BSni8zjyfqW9DIDEegBGXlYwxozc7Y4VyZMep0kguqE8oh9YqjlxgTDSnGfkBcob3K0Ja5X9nPjjbtSIyhUCQoRFm0MBb+/eaxnijm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(2906002)(7416002)(38100700002)(8676002)(4744005)(66476007)(66556008)(66946007)(31686004)(54906003)(316002)(36756003)(5660300002)(4326008)(6916009)(6486002)(86362001)(31696002)(508600001)(2616005)(6506007)(6512007)(53546011)(26005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjVJYmR2Z3diMExrUWVhOFU2OUp6eG82bmdVU2tDNU45Vm5lTXZzelVoYXU2?=
 =?utf-8?B?a3o3NERBL3puNjV1OVhDSVZ2M3BQaWxMM0dDVmViQlMzaDQ4c1F6Qjg5dU5B?=
 =?utf-8?B?bXcxUWk2VnByeVJTeUh1SkNMYStZQkRVUGtrYkx1bzk4Y1VtaDllSUxTVHEr?=
 =?utf-8?B?aDVqMWFQY2Y3WndIdkxLUlhuaW1GMVdaQ2xMVzkyejB1Njg5YWhBODc1eEZa?=
 =?utf-8?B?UldpWmg4cEk3K0QrY0FpYlRjN0F4ejJlZ1FpNFZsRGlNTVE2aVExc2x6MjBa?=
 =?utf-8?B?VzBwY3BOTklENlVSeldmWW1kZHNEWTc3ZkVLMm8ySDJVcXZVa2J3YjZUOWFY?=
 =?utf-8?B?K05VNU1vdFNkZHNYVEY3TU1vaStJTlZ6N2svOEYwVGhIY09xR0N3NlZOY29M?=
 =?utf-8?B?UDVLNkRmT0MzYzFaTkxBMmNQekZBQUMyam1NUkZMZGsraVE4NmVRT2RBYXJV?=
 =?utf-8?B?Y3VNSXAzazdwSVpSTTNwMkFmeGNsV2lvek10ajNuTE9sckc3RHAzV3gvQ2pq?=
 =?utf-8?B?LzBNQi9KdFc4MDZsZGpzVTZPY1Q1ek1YcDBlbER1b3dGQlYyaVo1OHdpM3gr?=
 =?utf-8?B?aDhTUFVjU0pMSmx0ekYvbk5SZlJJMmYycVFnd3V0bkFTakhKU0N1K1lrVUdJ?=
 =?utf-8?B?dGZ1NzZoSVBaMUNYUnFHN0NQanNwQjZ4TzBPK0ZzZ1g1TVY1YnlDenIrZ0d4?=
 =?utf-8?B?emdaNUxJRlJPUjdDUkJBM2lvZTlCek9DTTJtNUJtQkZKb2x4WkFzc0s2Z0pY?=
 =?utf-8?B?K0cweGZESVZuL1krbVJQUkM3ZDZVcHExTndZWGJaY1NEcEVlZStZNGcwWUpx?=
 =?utf-8?B?LzRGdllUbDBEWlVkNGpaNWorL3k3VW9Ic1V6VWhzRS9MeWl3R2kzUW9IOGpk?=
 =?utf-8?B?SW4xbVJEdE1BM2RDRUU1Nm5pejdwZXk1dFNLZHE2OEExU1lZQWpJWnpyV21S?=
 =?utf-8?B?WmJKbW1lY3F3c2NJQ1A0TVNZTkcxVmdWajh0U09mMHpXSE93UzNhMEllWkhI?=
 =?utf-8?B?WDJSR0hsTXBqMHpYVTVNT3plUlNmS3E1VEFJUkNiUXV0ZndZQ21yY1FKaTlB?=
 =?utf-8?B?YVRsTElhV29OM2l3UnE1d3R1WmRaakVwOE9Bek5KV0YrdkZzbEg0eVJQb04v?=
 =?utf-8?B?MXZFdi93am5IRXhJUEIrbDBaRzYzcEwvVVpHc2pnWTNYdyt6cEI3aFV5MElL?=
 =?utf-8?B?eEpET3Z5d0hrenpIVVJGYUR4dVIwbGpBSHR0VnNBMTZMMXVvYTZoVThldnZl?=
 =?utf-8?B?NjUxK1hsQ0xINGtMMWFKRXNHNVBVd3d0eURsZVRKdUl5d1lFSW9wTlZBVGhw?=
 =?utf-8?B?eUIwelM2aWhVWFUxOE1NVVluNnFwSDlpdnZOZUdseFk5NlluaHo0OFFUbUlz?=
 =?utf-8?B?VmFsa3hCcFVrbmVQaXQxVlFvZ3FFbDZkV3dUZnhwalFuZXJtZXVIM1BtWEpX?=
 =?utf-8?B?SmRZcklLZ3VaTjIzRzlGSzkzanQrcnl4a3dSNVBnQytENDFQSXJ1VnNsaVo5?=
 =?utf-8?B?Q2tGZHEvMC9YQytMTDdGWXU3Q1lsSk9yQW1TSzMzYmpQUlY3Y254ZVEyb2J5?=
 =?utf-8?B?UE9uVFV3dVZqUWtJeFVyeU1ocUVka0JQZWRnczVEUGlWNk9VSHZkckRIUjdi?=
 =?utf-8?B?SWVQZXkzaVFRNWxIOUxRd0tIU3NGZkwvdFpzWG56aGhkeWtFbXhmOXh2T1pz?=
 =?utf-8?B?SHBmR0kyYXplTHdRUVB1ZlhTaG5EcHdydlVacVNId0JaK1BEWEpqSlBmR0g3?=
 =?utf-8?B?SGhCNnVUVUJ5UkFMQkVsTGlrQm1hdFgvVEZhUmxSRkNQdS9WbDE0WjZCRGpD?=
 =?utf-8?B?SXJDVVZLOHY2Y2RYTkZ1QjN4NHZOTEhFNHZxSTZrekduVDJwUWRudndLZW8z?=
 =?utf-8?B?QmsxQjY4eEFZQnZDSzBiNXVYMnR2d1lRTWpvcXZSazNlcDErWUM1bEdOWVdq?=
 =?utf-8?B?ZGhEUGlDYzZxTkNSdHc0cTY3WXYvOEVORndISmxxL3FEcU9oQy9naktUNkN0?=
 =?utf-8?B?L0FLODFoempveFlMRlFWMERWcjdZUGNFSnVIQmxRRllzdkhUeW0wVkJpN0Za?=
 =?utf-8?B?dmFmM3pFZm40Ly85S2hxVHhBUFdBVndVbSs0b3NNYlhxOGkvMHpadGhMZ2dj?=
 =?utf-8?B?elJmOTNkUFI3cGlncm5jTnErSDQ2RituR1lOUjl6TUQ0UmJqaGRsZk1qTWND?=
 =?utf-8?Q?h48CNnHWiJv6RBiZhsCTz7g=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d67929-4e01-43f2-c732-08da033281c4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 07:41:08.8157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v2O/blAAqPbWNIggqj6apfGVFs4RkH5e3bjyb/F0dYrWErPU74T8mio/IvScIUJJDRCL4HwOGela3OOu+t6byw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4365

On 10.03.2022 18:10, Luca Fancellu wrote:
> +chosen {
> +
> +    sched: sched_a {
> +        compatible = "xen,scheduler";
> +        sched-name = "null";
> +    };
> +    cpupool_a {
> +        compatible = "xen,cpupool";
> +        cpupool-cpus = <&a53_1 &a53_2>;
> +    };
> +    cpupool_b {
> +        compatible = "xen,cpupool";
> +        cpupool-cpus = <&a72_1 &a72_2>;
> +        cpupool-sched = <&sched>;
> +    };
> +
> +    [...]
> +
> +};
> \ No newline at end of file

Only seeing this in context of where I wanted to actually comment on.
Please fix.

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -22,6 +22,14 @@ config GRANT_TABLE
>  
>  	  If unsure, say Y.
>  
> +config BOOT_TIME_CPUPOOLS
> +	bool "Create cpupools at boot time"
> +	depends on HAS_DEVICE_TREE
> +	default n

Nit: Please omit this line - the default is N anyway unless specified
otherwise explicitly.

Jan


