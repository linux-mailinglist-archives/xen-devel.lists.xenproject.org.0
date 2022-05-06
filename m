Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E44851D991
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 15:46:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323169.544779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmyHo-0007sa-Ax; Fri, 06 May 2022 13:46:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323169.544779; Fri, 06 May 2022 13:46:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmyHo-0007pA-6y; Fri, 06 May 2022 13:46:24 +0000
Received: by outflank-mailman (input) for mailman id 323169;
 Fri, 06 May 2022 13:46:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmyHl-0007p2-VY
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 13:46:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e96f29be-cd42-11ec-a406-831a346695d4;
 Fri, 06 May 2022 15:46:21 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-wsy77zbdO62-h8nUUfs_ZQ-1; Fri, 06 May 2022 15:46:17 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM9PR04MB7554.eurprd04.prod.outlook.com (2603:10a6:20b:2da::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Fri, 6 May
 2022 13:46:16 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c%6]) with mapi id 15.20.5227.018; Fri, 6 May 2022
 13:46:16 +0000
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
X-Inumbo-ID: e96f29be-cd42-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651844780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MloX4GcdCxxi6KFR4VLPQ+Iq3sulx/22tFb9Ls/1s7Q=;
	b=IZKc5xz4BeszVopREj140u7WB7ipcG/SCL6llZDdLsqHjm776Upr6JPu2XsVZQPqynVttQ
	10H2uQjxzTseClkZ7PJn/bA3nICqx235Le8tnquoIdQskRbMSHR04dpFoXbTiCC+MCx2+E
	soGpafpwQgZS42GFDzO1jEUsdpxXhDI=
X-MC-Unique: wsy77zbdO62-h8nUUfs_ZQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3W+WBnX5kJ35W6n+dTAHnIiGoaGkscwK/xZgxHQkKqZCcca1Y6IfTWcTY6Kq8wa4oKrottUKtW4Q1Juid78nN9yx9WtYyE1b41k1HeFZXCXck+0lC9RHHVHPT6sXjayb26V5rcYc8RazQx8035onL7BswabeyxSB5QIRvwbK8ycmSfA+BJNGMYJTEEqRGmEU7NO6vhJ5YvfoXwJ8w46xF4l8uzEQKjJxLGz2Qr/SUoSOjQ+7Q6YyYIJu1DyY8c/QZ3xUf0Sfc7jncI0mkegWOUONsvWI3ciW90cksORmNhwYGpubO3p0RBEPgaxxcq7nSNl5xQEt6Il0FMX7DRGJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MloX4GcdCxxi6KFR4VLPQ+Iq3sulx/22tFb9Ls/1s7Q=;
 b=F1UecsvkhU0/7gEkZWU+GNUwRIA/JB/mpOw1s/gi4M7vz6GvFEKo+lCxIKJ6dFKPrA1tJknquEGFiJaoK6TvMDuMlzSJejFYsagESbY6/XCnfkRAK+7xu8CL/UM7HCekpOg91Loc89MdWgEsV9RNqy5Btr1vyZEQ0aS2A+RvZ3AatWKXI+FE+t7F3SSVr5gAtJSOfVAhNCQxzua1EYlLOIQ/iSV4GtS6E/a1ixBY9tJKwBGCzJb0DcEsZsfYeottVtENeJqBMwwrodlqR5BnqDNVOESMIfhivcwI5Ikxyb+QDWQEQxQ0TIdpHH+O9PUiDdKHFVqJMGkid83t7NKxvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b0208cc5-55c0-003b-1b1f-ead2349ac9e7@suse.com>
Date: Fri, 6 May 2022 15:46:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] build: suppress future GNU ld warning about RWX load
 segments
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b3e9750f-4dd6-342e-b550-21bec8da49e6@suse.com>
 <15350fcc-86ad-d42a-27a9-c0cbab091559@suse.com>
 <93722fdc-550b-bc08-3115-e92a299973a3@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <93722fdc-550b-bc08-3115-e92a299973a3@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0050.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::27) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6ac7990-6584-4aff-b6f5-08da2f66ca9c
X-MS-TrafficTypeDiagnostic: AM9PR04MB7554:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB75545930E8AC3E83188AAEEAB3C59@AM9PR04MB7554.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XlXAAyDaLX3uJUDYBqbrIPY1XhXvFi+fwT64VpZFgi7CyAA1yB6m6hQ56LivCFCgbkGoExLtxXUtwZL1Ev8s/mypyKy2YZKqj7sWiGhRr/wdw8ZPvbSjMkZydwRv0xwrrx2o//B+vLRHxw2LWMo7PQ+o/qrqJvUiZ5+IXdazO8wC5Tn/LrlSwjyu+TDYRjgSbYHIq9fhwmGTlNJJYiqsKAG9Gjw4XBF96PR2MbGm05o6pS2HliSYzzEXdf4J2w+9LMY0n9UpY0WHctW63+hBKZF1EtZ2GtbPyyzHbx8XrSJk+mtQnvGdYCnL3FSunJjBgGLHsmBhYb0pwekX9LJtu5J2RksRUmjPbxwITVPvJ9YL5V+h9q3khB0qqkC4+jtn3vWWtPPvF7v/+ABhTUXJiyqdejxN+p0bIzX2lskh4wCIXu+IsebIGEXR6d38Iguq59PRJekoTdDFLULMNmbbxAT4fcf6wRH17jSG52NsszuxmC1ZMKQUsiTY7sJev25G1M3Nv1Mt2OSZrAA+QJfVOfY5SYRA7lZZAs2mP29PjDkECnlK1RK7LdHg2yKWWU8obt3O9wg1Qk6tc9+nti8wfvVb5viANFGHrMp76GMLjOErvEsO5qWFTfz4jmgRgEIckVYSVba6foBJhu1NDuGyN6kDjJKEhAouDjuTNLackNX5R/rVp/YzreA88Tocf9CkT5zgoAlOfqwjKbO99H6XrGUG0rr/aGxcp5bgI36paQzJ8XHGkEp2GFcn3Nr6GYFe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(186003)(6916009)(6506007)(54906003)(53546011)(2616005)(6512007)(6486002)(36756003)(31686004)(508600001)(8676002)(5660300002)(4326008)(2906002)(316002)(66556008)(66946007)(66476007)(38100700002)(83380400001)(8936002)(4744005)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnM0cy9PNVRHWTdzdkJqSjZVUi8xN21uck81ajJ6OFA2Y1Q2RnFvYU1sUzNS?=
 =?utf-8?B?a2M4ZEExM0ZOeXRQamI1UXIxK0pwVXI3b3BlREo3VnI2V0xsYVQ4Rnp4VlZq?=
 =?utf-8?B?L1UyTmczYWxTTi9yUEdmMGZIeVpFVHJqY0t3K1pyWTVReFhWV1pKR21JVjhh?=
 =?utf-8?B?NkIxYWx6K0dXNTdGQ1hyOFhYM2RKcndvNkdwZng0QW9FUmZ3THNFTjBUbjg3?=
 =?utf-8?B?aWMvSitPdTROQ0lmd3BnSVdJWkhqY1YyUk96UnU5bGNQQXJMYkxaNUxTYlVW?=
 =?utf-8?B?VlRybjlaM29pYThVL1NjYnFVOU41NTgyYWU2UHJFb2J2L0h6RzMwZ3NMMjcv?=
 =?utf-8?B?cmVvQW9lVndIbG9acmViRnZlenFHUG5ETTFEazVod0tINGFOeDcxSzNnUitP?=
 =?utf-8?B?VFZaWkFWNlUrRmpiQWl5T2oyZ2pJZDFBUTFFL1hxOUFzUGViMWdVTE5uRXRZ?=
 =?utf-8?B?NEgyWWRWV0VxTnFqdS90MEFCRXJyYzlOMnQzc0VaQzhid3RhSnB2Tlg4NHov?=
 =?utf-8?B?MW8xQkxIVWhEc3ZVdHdWMXcxUUloTTdhMVc2MUhjZ1gweDVSMWxFODVxTlRt?=
 =?utf-8?B?dHBvbWx1eEFCMUtCYy8rK0Qwc1lZbS8rSGs1UDFiY2lBd1k4KytVQnZRcXh2?=
 =?utf-8?B?QzYza0xEZUtqN21rNDlPWENtYmNIZDlSd2syZ2tVQ3RDL1lLc29QSFZUWkJM?=
 =?utf-8?B?a3NidEI0TXRnSzFvMXR0S3QyQjdMM1dWUjlrYU9WY05OejJodmxRVHk3aHkx?=
 =?utf-8?B?UGpORU1VMW9LaENXSE8xVUtkdVg4cXdVd3doc3AvUkFJT3J1b2RuMkxyZHp5?=
 =?utf-8?B?MVVpY29zNmgwbGIyU051OHA2MzB3VXFZeDhWeVI5UlZQemQxMlhtQWc4NmxQ?=
 =?utf-8?B?MUJGZStkSU4weGNsWTFJM1dsSHNESFlQL044YmRnMjdIRDlLM1dTOW4wTlMr?=
 =?utf-8?B?QU1nbWtOZGJnWE8waWR6Z0ZzYk5yTEF5aFdGYWxBWms1MFZ4eUhxRVoyL2Zj?=
 =?utf-8?B?V0NVRkxFeXhpU01KYTlmWkdQbWxzdityd3Z2V2Ria1RNV21UNnJOckhadkFL?=
 =?utf-8?B?U25nOU5SYVh5YjRpaGMvZ0RCRWNsMzNMMTJFSjQwQ2lXTGdRRkd0OFY0K1RS?=
 =?utf-8?B?VmZyNjBYSWJ4aWkwWk04ZG5MbVcrN05zSU1WRmZycHpMOEI2NXNGc2o4SW94?=
 =?utf-8?B?NU5GQjhhNnMwSi82Y3J6c0l2aVQvay9jWmZsOEx3OWg1ZS9SZVAyRy9kRnFE?=
 =?utf-8?B?am83eGF5T1RiSWdRRDN5Uk1FSXZYcVg0VFFSSE5saUlNaEtQY2FtODl1VGx5?=
 =?utf-8?B?UmEzK0toWk5Oc3RtVlk5UkpFTlRLZHBDOURqWXJQd0F1ZUxRMVMvdXpKNTZV?=
 =?utf-8?B?aTZ6NlhaQjVudkl3dEJERXN4YW9pankvYzlsa0Nsb0QyKytmbXZRcC84aVFj?=
 =?utf-8?B?WS83QjNyK25oVGJwWHNFZWgyN0xEaGNMZ3A5alNwL04rTitQQ3JjdFp3VVRB?=
 =?utf-8?B?VGwrbko3cEU1L0ptTkdtLzN1RlJSVjNvczQ5M3JWaFdhYzNrZ0VGYytrZ01I?=
 =?utf-8?B?M0RybjhyekFzblpLOEwwNGErbnNuUXVUNS9BSnlMRFl4ZWllL1hVdWRSTTBa?=
 =?utf-8?B?TXY0ZE9pNmpnNFpYUmJ1QThTUG9HL2x5UFJkdktTbFBrRW1qUEo4Q1psQk83?=
 =?utf-8?B?NzJTNVhvWFZlZXJWUXJydGtKNFI0TElWNHM1YVJKdmZxc0ZPYW5FVktrOVli?=
 =?utf-8?B?WW42R0k0dVM2eFB3YmRSS252TTkzY1o5V0ovU1dXVXE2OEdWK3NIb1QzRXd4?=
 =?utf-8?B?TWluL0FtYnhveENOQ2gzaDhRcUJId0Z5ZEhybis5dnBoSXRuRE9aOWpYQ293?=
 =?utf-8?B?OHZTZHIvb1Z2ZFIyNUNON3dJRzR4MUUvakV5RzZWdDNhUnMwMnFrYVMrWVpB?=
 =?utf-8?B?eHZMcFVTU2JRTWNUc1dXZWRlK0tOUS9nblJQak4zVFQyZW5NUW1NVFdKWHYv?=
 =?utf-8?B?N0RyQWwwaEZ0cklYR08yV1FYMTdUY2VHMHRyZ1NxV1NWQzE3SnVKWW1Fa0pr?=
 =?utf-8?B?VlUyNXZ2dkRQeUhhSVBZc2h4Um03NFRpZFgzS1lVc0hhT3lMVldaS3l4VWdl?=
 =?utf-8?B?OTFleXEwVTFvZUpDKzZVQis5WitoSFNNWm54TE93U2d3OGMxTjRiNjNnQlJD?=
 =?utf-8?B?T1IxbFRucU9nVHhjWjJqcXFPVVVscHZvWVJMcy9ncUdpWXBnbnppekNncGVF?=
 =?utf-8?B?MGsrWTFQYVBwMnI5WXk3MjFnamZ0d250elNQcHAxNUFqSEcxS1lOanhZNklO?=
 =?utf-8?B?TlduS1F4eVBlSFFRQUprQVRhRk1TUzI3anVreVNwV3N6cEVnQ0Rjdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ac7990-6584-4aff-b6f5-08da2f66ca9c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 13:46:15.9877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WWcAg5umHRjDHOLhMLrdZaFXj6BHdqUdpYSicoWQf12SGhg2f6oo9ZYGJSblTMP39oRbrf7bxhwtUKfHHWdt6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7554

On 06.05.2022 15:43, Julien Grall wrote:
> You say future, has this option been merged or still in discussion on 
> the ML?

"future" as in "no released version yet". The change is present on the
binutils master branch.

> On 06/05/2022 14:37, Jan Beulich wrote:
>> We cannot really avoid such and we're also not really at risk because of
>> them, as we control page table permissions ourselves rather than relying
>> on a loader of some sort.
> 
> Is this a preventive commit, or you have seen it in action?

I've seen it in action.

Jan


