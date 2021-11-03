Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6831444402
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 15:58:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220946.382420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miHi5-00083s-Hm; Wed, 03 Nov 2021 14:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220946.382420; Wed, 03 Nov 2021 14:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miHi5-000817-EG; Wed, 03 Nov 2021 14:57:53 +0000
Received: by outflank-mailman (input) for mailman id 220946;
 Wed, 03 Nov 2021 14:57:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miHi3-0007d0-Lv
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 14:57:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a437088-3cb6-11ec-9787-a32c541c8605;
 Wed, 03 Nov 2021 15:57:50 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-5IOITigfM1yPEqVwGp1uzw-1; Wed, 03 Nov 2021 15:57:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3536.eurprd04.prod.outlook.com (2603:10a6:803:2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Wed, 3 Nov
 2021 14:57:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 14:57:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0105.eurprd04.prod.outlook.com (2603:10a6:20b:31e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Wed, 3 Nov 2021 14:57:45 +0000
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
X-Inumbo-ID: 6a437088-3cb6-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635951470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CA8a7puWKQIoHvBIpr0CeI71hxyNtYv9ue9NGXGt0AM=;
	b=KHxGACPKO9BVSqPIS0vHcwf1bhi597MzVrvlH2Ewx29uT7Xbl9xGYeReB9xd0eg6krhN2T
	TTEZU5G1qwUcy1L726HBHvssqD3PgeJyxQMFzeurc6htCCqyy6HCFgvrivk4k7RgY6pXA5
	VhPdKeU2i0ZENrHeXzybJ+c7JBy9KSM=
X-MC-Unique: 5IOITigfM1yPEqVwGp1uzw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SnrVxOoZvis3bia84svuhgotqyvJauqUFMYSH/kX5aLZf1+ojBbdVMUPu1vqldxXdqrJyN8ELaKB8eyzrp4ye009HZeJUpr7CXhTKKarO0oUSPxgvwkODVAlYJu4lfRqYpcM5WE1r3j/d9Ga99h1LHuNrnBi5McFtR6lufD7tJoMabBv6V2cZVmONzvaABT2pGbYq8h4Go4G30GYNFTGXFRMYU65mF2jvyMjNs4T3eeq26N6kKPD3caR6OkIa1n8zzNJKE6yn5NtS25rRIiEhfhceaxjznLsxeMHLBOV5h2gtBvIUqwDSp3o1GnZir4N0QuNM4tnj07wzt+pXX2ynQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CA8a7puWKQIoHvBIpr0CeI71hxyNtYv9ue9NGXGt0AM=;
 b=b69XfB9p6WzkDoFFfBUwW/9t0j6wwBY4Wpki6i8ooh+DuKHtFP4uJaKCgBzeUvJ0tzm2smeSu4fZSUkw+bjYBs94lz+zJBAq50yQorfC5AZ6jDOVD8Kxpy1dJciOiv9/kC0plMhIIIIOvYRe76EYg1DWZaqRKE8yMUvdntCdRJaGp+55ZhJu3JqiAgKcrnFTBHtX3oKkAgZvd8EuQmkynVzUR2vQNoviUnTNiCNpcEj93Ic1rjRPLyZPS+azGq3PRf9ihCAUsnw8NRVlEkaYxajkXHz/paL/2Zk1074OrJZ/5h1j2UTUWxs54D9Cy5YHnoF9gENDEBK07JDA9eiaWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a24224d0-7178-ad11-d671-d42398c50d31@suse.com>
Date: Wed, 3 Nov 2021 15:57:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 05/15] xen: don't include asm/hypercall.h from C
 sources
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20211101152015.28488-1-jgross@suse.com>
 <20211101152015.28488-6-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211101152015.28488-6-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0105.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d251976-7202-4aba-dd56-08d99eda4c4e
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3536:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3536E37A447D1932F7290D34B38C9@VI1PR0402MB3536.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vgnpb88+Vgp9DPUbcBRxXOP4WdXYowsGTOTPKiwzVd4WoxPR94lrZq5nCmjyk3RndhUG+obmgWMbFmqfg1e0MN4ZQwBWRG7pKtvwrrcEyhcO0C0eM0hB2qaKIgixk0lv0kqEDpxxC11/en5xYvOySYvCFCKV0pNhbC6/1l7fX3piaL1H0Mfn0YUHlgEAuLcdAqON2Lcmrvmg/Z3VHMt8j3fq9LhTWKgxTgIqQ5wbYbB/0m1jUwfh8FN47GHlesgGuHv+h9I60UpUZma+09QQZoxKxng8oRIJSCizF2wVs/wsbPjtCwiw+2EYkIG8G0zMmCJciwW1WsApIm/lTVWCnoREJbpXNsG1Fakr0MXIUPW+0jMBd9uaRxHwS4s63NgO5rsIRcdCUb3r2HWq0h1pFYPTdd2KeVDffL4V3qj9TQOHRMUEbaGG92axnFo+JA7CHW+rkAciedubN6XvpdLLlooAiZLnleEAgHGN2JCmMT5iQ3F8bK8NrxlcrBlhn6ZvJNoqi5kETO/fNghtUL8pGu9yWqrP9en/YHOMwiCT6mF9RKxBv6kak4LmJPi7ARRuDTkOyeyWfK9iNB2TAhBjVU3U7r/U+ES7txFHdKz1MejTigJ5Sq3hKnJwyyE0om1SqCNGae2uk0835BserT8VOniyrJfuCP8XNcEwITumQCeGOFTbiOvpsqIN2CkC8fvmOj+YKjwkV0anzLSUdOEk5UWOdSWy1iG3sguz8ZORpfM88j8Q9zauSgOnhjhWOhP+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(6862004)(186003)(38100700002)(2616005)(4744005)(6486002)(956004)(53546011)(31696002)(54906003)(37006003)(8936002)(16576012)(2906002)(6636002)(316002)(8676002)(66476007)(66556008)(508600001)(86362001)(66946007)(36756003)(4326008)(5660300002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjZnZy9qNEN4d1VjbVJoZU5KTzZCQVYwSm0xZ1VhQitETnl1cTEwdDVrenJP?=
 =?utf-8?B?dnkrcHB5Y1FwWTBmZlNSZTgreUlLa0trbFJjYXlscGdWb2dzZGN0ZXN0cVhk?=
 =?utf-8?B?WkRKcmc2bUErUXVGQ1pudGRUSTZLaG4xNnRvNko2dWIwaHVZNEkxZ3hEWWsx?=
 =?utf-8?B?UERQZmt6K2k3aU5HTllic2xhVXVvaGJyYlVLWHV4MjNYUEk1K1VjL0hWKzdX?=
 =?utf-8?B?WEN5MFZJdlRqaCtVZ3dkdjZoZE5zZkpPR3hLRnJCZlZQQUFBdVRlaXAzTUpZ?=
 =?utf-8?B?NUcxWEc4QzhNSGdzblJGQXI0YktuSGlObjlOOHQzb0c5NkFLY3RCTWcxeVQ3?=
 =?utf-8?B?NitUWGhlR1NDTW5qQndsbE9ZZlBycU4rNytlSHdUYkRvem1YQXZKYUgzQWxx?=
 =?utf-8?B?WndJekR6MEFheno5aUhsRUExSFR2SVlWbVNFeFdPSk5pUG5reFc4SVZWVlR2?=
 =?utf-8?B?cWpBVW9WdjcxZ2duUE9lRC8ybWRQdHVlRVNrMWpMMUs5aUZoaytFUno2S3B2?=
 =?utf-8?B?VWI2SlVoRnFzeEFIR1ZRTGJTZkxVdktxclVHZlZuNnVNS1o0ZkU5RVNZdDZD?=
 =?utf-8?B?djEzQTNvRWFJaldEdmNnalczeDFLajgzZVVJcG1nbThVeXhKdmxKb2M4eTVZ?=
 =?utf-8?B?VTJnYUJVOHpNNWpQT0N4bWNDUDAvREV6OXk4OFNmL1N6SFJnZWxmRTMyOFds?=
 =?utf-8?B?bmpNN1JqQk5ycDBycm45d1d2UmNEb2pZZGJURm9pWFh6aWh4RjhJOFE3VEJj?=
 =?utf-8?B?aU9SOXhEeWRWY0JsTk5Yd1Bma1F0UWE1bEN4a29mNGhjWTNyQkJzd0pGZStt?=
 =?utf-8?B?MnFuSWR3OTlhL29ZU2VTVkZiY25Pd1ZJbE1wRkMwQ0pEMFVSeEFmSjJGTDE3?=
 =?utf-8?B?cTlQRzgxaWJxMTNRb2JpMFZSTTBhTmN4MlRQLzVPSmpadDFxOWhLSSs0QUxl?=
 =?utf-8?B?SG5hUTV5U0ZnV2JGUkp2T3o4R1dSRWNqWDgwaUMrLy9hUW9JQzlJVmduUDVL?=
 =?utf-8?B?NlRET2NhSndUUkpVOFRpN1lqSDluUGViWVA2QXpPR1BaNTI3ZjBFb01sR2w1?=
 =?utf-8?B?Mk5reW4wK3krWjh5MlBFa1BJeW9WYWZPa2k2bjJONnkzL2o3SG9ZRXhXS0RP?=
 =?utf-8?B?VnE2cWNsamRNQlV2ZGVjT0ZmTTRiMXgzQTZ0L0wyTUwvRU93MjRaNmJsaXoy?=
 =?utf-8?B?OE9OM3VYZHhmZk5DcU9wZlgwbnh0eFk4TXhsRFBGTGJORU1udDNEZjdXWWNK?=
 =?utf-8?B?WGFTNzYvQU9Sd1ZscUdtYXIvMUZtT0RuRDlpOGRXSGkwQnByOHJZRldBWHlS?=
 =?utf-8?B?ZXNZbTB2UnNqc2RNUTNidjJZOVp4ZnNEZHMyd1EycXJVVE40ejNvRnpBSEI2?=
 =?utf-8?B?a3pRMVNGOEl4dTN0NytyUm9zYWlUWnlTNVY5emhsUGdzQVptdEFPMDRXd2Rw?=
 =?utf-8?B?ZzBxbjBZb05XS3ZRdGMzZEdYY2x2Q0dsMS95VE9FU1lsNFZNOUJHUkFyTS84?=
 =?utf-8?B?cmdLTytFK0kyNVN1WlBxRHE1RTRtS2VSc1IxVmFXWUZLaUFwS0NORnJQdFVL?=
 =?utf-8?B?dFRxNzh1dE9BaEFCRXlLU1JDRE5JMXhDdmVIMU01aXM1TFdmS1N6aEhCbW84?=
 =?utf-8?B?aGpOdDZsTEo2Y05ubG1LVUJrRXpYaWJNL3NkMHhONm5PY1lCa1JkWVRSZXA3?=
 =?utf-8?B?aXhOTC9vK0hJV2xPc011Y0crWldjYnFGNzhnWnZIak9NZVY1eHpuWUNmZkwx?=
 =?utf-8?B?L2drTkhpVWRVSGc0SmF6YXAwOXZsOXBzN3ZscEhTNnI3Rmc2WkVhTTVRSXFy?=
 =?utf-8?B?Yjd1WVc3emk4MmwzL21KUHVaWUhPRXBYejVlRVZScC9Hc2w5bTFRMWlSdmJZ?=
 =?utf-8?B?OFhSRWJSbUxMWk5lTXNINmhrUVlRRU9JU0lTZWRuTUVpWGZWVnVveEJDckk4?=
 =?utf-8?B?OVR5c1M4ODk0N0dwWnlYR2MyUEFiTTFhVnN3QTNhR1JVN1p6NldSK1JsNGow?=
 =?utf-8?B?S3RSa2d2RW1qeWRZS3BhQTZqWnFSeTJJZnhNQjk4NGkwaVZvTng3OTNEenp2?=
 =?utf-8?B?YlFLb2hWVlFPbkd4a3RWNHpqKzFZRVo5QWVVRnhHWmV0Szk4UVdJbWxFVEti?=
 =?utf-8?B?cHY1UjU3YVdxTG5xYjJEU0pwZ2dOL2lEMGVQQlF2RWR1MVdqMnNlWVNEdXMw?=
 =?utf-8?Q?i1a8NwiFG47N6GJX25iaaU0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d251976-7202-4aba-dd56-08d99eda4c4e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 14:57:47.1381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3RQ46G9QHS9YwQrWYW/sjdtYLUdCcen7K+S8rRz6D/GfxFre05q/milBUye2rXVpvfKu8Q0S35UUh2yC7P3xOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3536

On 01.11.2021 16:20, Juergen Gross wrote:
> Instead of including asm/hypercall.h always use xen/hypercall.h.
> Additionally include xen/hypercall.h from all sources containing a
> hypercall handler.
> 
> This prepares for generating the handlers' prototypes at build time.
> 
> Add a guard in asm/hypercall.h to catch direct inclusion.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


