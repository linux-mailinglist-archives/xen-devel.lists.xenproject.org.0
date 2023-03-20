Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5B16C1D25
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 18:04:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512022.791582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peIv4-0006xs-1m; Mon, 20 Mar 2023 17:03:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512022.791582; Mon, 20 Mar 2023 17:03:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peIv3-0006vD-Un; Mon, 20 Mar 2023 17:03:37 +0000
Received: by outflank-mailman (input) for mailman id 512022;
 Mon, 20 Mar 2023 17:03:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peIv2-0006v3-K3
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 17:03:36 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20604.outbound.protection.outlook.com
 [2a01:111:f400:fe12::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25fb439a-c741-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 18:03:34 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9672.eurprd04.prod.outlook.com (2603:10a6:10:31d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 17:03:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 17:03:28 +0000
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
X-Inumbo-ID: 25fb439a-c741-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XPLdZAiccLfXp+TIzKzsLbzGcZWKl99rSJyC9iB2yDw2iXVj5YxRskfZ4VXLNqAt7TZH92HQIkWribtmeQYlMqxcB7TSNiU6fuoBkOis2iGa37HQAh56vWmbQXS4SAnlQcCEiJdzOmSTlPdDo49emoMQpvnoRv3hjBFrVmnkrXvfFqkfg6f/YdCWPWU0O19a5PVhu3KtVUm+WfJF0pVKP8IEFwpbbBF+Sm8wyJHfSnqSgU/SL5oEL19DoRI9ETJ1T8nu5lki3oboENQD3tZ/QkdVWt5WwTQLILrp7bSexKPmfbaxLSicQTb2+z8scqck6EkSWC4XhM8qZ1zPGZoStg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NtW3vTh8nFYUMoR1l36xhprAKNfvyviu4dU0C+8wBA=;
 b=HYdNnJuKJb0vgm4z2EPQQIPjmcqcr7QINhllbON2SZ9rOkZSZxoYR6Nn1nFdSBEDSGK3LWh51H8cSfs7yDoascK1n1j1jgx4BZtnAghBTfy3lxA3IZKqb9v60VJPU501EJe233iVRS/PJn7bBmUqFhcgZQ84HB6xDIdsFOGmzEX2+L1IGB+A3IZ5TWPIBTK5MFPVuWoyeoUq9buHdQIMOg/E0z8vDuufMJ5OINuGddLAC3qbz6WAoHmFjYMqwvUaftEAYlSXM3UXUFPyijdlNNBQy4YbGRL0RKneJUrrFILpAp1PHZ9GmUwQwKqw0VtfTBbCgFF1wgZXpmRc43a4rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NtW3vTh8nFYUMoR1l36xhprAKNfvyviu4dU0C+8wBA=;
 b=AqN2S9AKGN0Hd43RTp8q++kZgdW9FrV8p6hs7mjZS0zeaLgKyakhBSV9B8XGoMYK/KG/VprHEUrDxuY3501PUS0e/uzNOwqQ4SX6jcVZYjLuthpgm9L5LaTpasvXhHviXQ6mOqVL4iYZ+ffGiA3rtRV36rUskX1HhB6pDp/YT8S9pwh6hR7ul1YgBdGZTascJQARrM3/GHOmAhCPa04yjwhRfOKcaVxS01YlnE1IyCq0S3SakiD1enYqzprlzC6St/zhH1BZTbgFhR8ra2bEbG5ZezuAqDUb7DbJfuTxovSOGJaCnl4Q522M3kXY4R+nKhAOPEuY4/sibgrBfeBO3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fd290ce1-d1d3-9266-1b90-2b9df052a9e3@suse.com>
Date: Mon, 20 Mar 2023 18:03:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/3] xen/riscv: setup initial pagetables
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1678984041.git.oleksii.kurochko@gmail.com>
 <a748d8cf94fbf4ffee3ca3acb553a9caad1f423c.1678984041.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a748d8cf94fbf4ffee3ca3acb553a9caad1f423c.1678984041.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9672:EE_
X-MS-Office365-Filtering-Correlation-Id: 047e9e1b-dbd9-4766-bf65-08db296506d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FW4eb7ZVazyEE0/+tUQnqCXiYv9JNo3ctUITYHHHHwNDUKz/oLz53Ikqrzrv5Ley/7AU079n2aRI/iF9uRgnK9bj+UrDm/7HQPUePrzfY8/zwI4jFRW4Eoir0ycvLwr+q4YJ+fj4zAsw6Wb/ny1soUvX8SONKdXI7LRJl4UIdvrmVAzlcocXWBUbv+L07PAdcckqbQsafxfwwI9fPDs6iWy/L/GNq8eHcepJThOsKijPrXXgZZIvp+W543CYwyxwKio4CLvdQMlfcqf7gTvKZGfkpM6qcltvrkyEoD//hS83Ep4XUtej4sHSgSMu6qiAA4MXO5jcHbbf022OTUzhI3Z+HO70IHgdb2MZc6Dc8ctJIgo2PkM/0qox97HLqfIGI3Mc4loq/xW8Wu/KioqcUUi5v1Qja9RzringrrnrPh68M4Igk0z5+f24khTAVTR2P5shvq/RZojOS+fs4NakCtRGTdaTnM7mOvDKLxQ4v/jU1lT+6igzJjrTGV+HTnndMy+XqMEoEuRcHf2uy44yxaGcD+R7ymH8SBfGquSJjIZ8k0n7V9+++847mRfyPnwnKKWD7kpSg3iWh8UsHihIAJBcVyq7Tm1xae8bdA3QsTz2CIxKMHfk7IzrqyLw5pVreNYfQvkCqa+tWTw+G0zhEN5XOsJOEEA2aBTKrlr93PT3aV0u1r3l0r8ST1NQjpDVJvlLXLHMHmzUUBU9g9cA0szcBh1y+pV5Z41RpJ5asQI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(366004)(376002)(136003)(39860400002)(451199018)(8936002)(5660300002)(4744005)(31696002)(86362001)(38100700002)(41300700001)(2906002)(36756003)(4326008)(6486002)(478600001)(83380400001)(6666004)(2616005)(186003)(6512007)(26005)(6506007)(53546011)(31686004)(54906003)(316002)(66556008)(66946007)(8676002)(66476007)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlhub1Iya3BSUGE0bWkrRnRZR2RIZERFdjZWWEhETUdsTHdCbWtVVjNBQzZ6?=
 =?utf-8?B?SG41NlNKS2NRVURPVkswVHN4V1c4aGV4dXl2Z21XTG1DOHlTT29raytMYTRT?=
 =?utf-8?B?MEVRT0QrdmhmWkwxNzVlM29yVldQNGU4TTlLVU9kaXppZkUvOHNNd1hhUWZk?=
 =?utf-8?B?VDZWSFNFZHJjbC9Zb2xuNGVoWVFLYk1aYlljTW5uaDdoaFhBRG14cjJGb0lt?=
 =?utf-8?B?Qmo5djd4cWRDUUVoR1FLODVBVUJYaUtSUHlTSThkSGdaM1Z0c0xIcmdhWHl3?=
 =?utf-8?B?MW95SFZqNVVjd1hXK1Z0bHNhSGxVRFBlYjh3WUFsV2FNZ2xDMXZGZW9IdHds?=
 =?utf-8?B?ZERibTVqVE9yb0swT0cvMmxUUzBiV2NYcnFQMGhOamZiRVF0Ujk4QnhCNkEr?=
 =?utf-8?B?dkNxTm1odTZUZ2VxN3IrTDRHVWtESGduNDFYMGFWamV4Y1ZnVUVqd1lZa05K?=
 =?utf-8?B?MFdEYUt6SHVzZUVqcUdXTWNUdWFhaW9SYjBZa3d5aEZtQXhIcklzUDI1UkxU?=
 =?utf-8?B?Zm1hak1Pdkd3QWlWR1dHMCtZWklWTzhqRkY0aWFRWm5xNFFES1NqUHNHcmhL?=
 =?utf-8?B?bFhxQ0NkeWpQOXpTVy9odVViVTBkbk9RcUNSdUdaeFp1UytIeSt2VkRQeHBZ?=
 =?utf-8?B?VnBBNXJwVGMwaVhJeVdySDhNcDVlY01iZlVJR0EzaDJidk02cmJmaGRpRXVj?=
 =?utf-8?B?TGVZcFM3YmVPK1VZRGtuU05DSm5mYW9xTjNySWIxZTh3N21DRy8xd0NyQ2pr?=
 =?utf-8?B?TXJmTHNCbDkyWGhxbUgreEFXWE8xKytVS3ZEVWtIOTZhZDZLWGEyK1dhakRC?=
 =?utf-8?B?dGE0ci84U3ZKRUFnWjNCVy8zdnhBQ1F4cS9JUlo1Q2RjRVcwRFZ3NUVseVdH?=
 =?utf-8?B?aUZCR25VUEZiKzFxQVpoTStlbGdmWjBrVWxaKzgwMjY1bGRQSGJqcTE1ZTlB?=
 =?utf-8?B?b1kveENkcWtvenNQUTlDR3V5aC9CVWtCQW1Tb3NmcExvciszYmh6TVQzd1lK?=
 =?utf-8?B?Yi83cDE0Sm1IQmlGS08rQkQxQmorZllxUVZoV3MySUhsWUFKdS8vb3M4OTZG?=
 =?utf-8?B?Q2dqd1Znb05pWUdvMlNmQkk4ekswRnBHL1cwY3VTYXJsSWgvWmgwRVJQNVg1?=
 =?utf-8?B?R3RPN1E4SkU5Y21MK0VweHlIRkRzNGo1YzI3emRsOXhsb3RjeFl6NTkxQkNF?=
 =?utf-8?B?Y0hJUVFKdjZyRkFrNnlXdFBsV1FXVFN0TEJidDZMTmJZRnlBNUo1czZaWnFz?=
 =?utf-8?B?NGRqWGtnRVQwZmx1a0M4M0FlWVlnT2d0UUNIWkVySUttR282T3l0VlNYWHRK?=
 =?utf-8?B?LytlUlJ4aEJ6VXN2bENsSjlKK082MldJbjlaY0JCYlBzMzVsNW9Sd1BrYUJ4?=
 =?utf-8?B?ek1qRlRXRDBueXlKU3hnRVpNK1ZxeDZGNTVYaEwzQ3dIQXFpYThGME9pOFNx?=
 =?utf-8?B?anE5VzQ4d2NJeThXQk93Si9MQ2dWOHlaUDFzK0NLTHQvMFNFUHV0RVRJcmN0?=
 =?utf-8?B?NW5ob2tRQ2ZCUDJMNHFvMjJuNXdjUWk2R3dUUG1jL2VMUFN4dTI5VzRqVndP?=
 =?utf-8?B?NmxuOHJ3ZSthWTZGTnZKbXRIYmNiUlZFaDVwZ3NZdjh2M3JKQzNJWC9OUk1R?=
 =?utf-8?B?VDJ6WmJEOEJWUm1JRWVnenVyUGp5c0hGWWlKYkdWT0VxRjJGSlkyb1BQWDll?=
 =?utf-8?B?TkNEd0JZV1J6QUQ4L3RTMlF1MERhUVFVVXphUENrZDh3VjVIVlovblg3OVVW?=
 =?utf-8?B?QWNQcFhyQUVNV3lpT0xYbGJBWHlVM0JqL2JkMnIyRXlJd2V4WkNoSDQwNFlC?=
 =?utf-8?B?cmJqZndLRmo2QmtjamNMZlFHTmp3c0w3OWZvZDZ1V2dsdi9PbzFkaGo1TUNV?=
 =?utf-8?B?eTVTSHZxbTJtYTB1bmVUM2dzQ2Z4VW90b0RTR2x2VHRhTW5OdGtPU2ZTMmtn?=
 =?utf-8?B?eDJYUllKOWxrWitoL3o5ZTBVY1E3UC9UYUVpZjMrY0RncldVd0JIdXJXVlQ3?=
 =?utf-8?B?MzFJaHdMdUlEbys5RENudHdhL3pmSzdMUE53cGtrMjRYME05bElkcDVjRjZZ?=
 =?utf-8?B?WmVQK1VRdjFDN0lRaDdBUVRMYm51VEZjZEtoQTMzVmxvaEkwbXpUVTdscTdr?=
 =?utf-8?Q?T4FyPGZmQE4mGMrRL9AeeBZyy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 047e9e1b-dbd9-4766-bf65-08db296506d8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 17:03:28.7923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYa+I0mLxIHVqvh6vyYlsvd/X33vEh4JzcZvIsLSjITfvqZ8g0B3QP5vBJBy8qkFY+eg261fMJMH0WhYyTj+TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9672

On 16.03.2023 17:43, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V2:
>  * Update the commit message

Odd: It's empty. Since it's not part of the title, you could at least
say that you're also enabling the MMU. (Most of the time entirely
empty descriptions are suspicious.)

Jan

