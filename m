Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC9C5FC0EA
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 08:49:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420791.665814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiVYA-0001ZE-Hk; Wed, 12 Oct 2022 06:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420791.665814; Wed, 12 Oct 2022 06:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiVYA-0001XD-Ez; Wed, 12 Oct 2022 06:49:06 +0000
Received: by outflank-mailman (input) for mailman id 420791;
 Wed, 12 Oct 2022 06:49:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIvO=2N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oiVY8-0000wY-LE
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 06:49:04 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130074.outbound.protection.outlook.com [40.107.13.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5d08363-49f9-11ed-91b4-6bf2151ebd3b;
 Wed, 12 Oct 2022 08:49:04 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9568.eurprd04.prod.outlook.com (2603:10a6:102:26e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Wed, 12 Oct
 2022 06:49:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Wed, 12 Oct 2022
 06:49:02 +0000
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
X-Inumbo-ID: f5d08363-49f9-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PzZkM6+HhVhyfqD9dgvDepVgriwIqvogd/BtD+YuXVsgYkcILczJCXSgRvkM63qF5eiegYXMtjaU2+9UpHPijlFOvwtWioJ/AMn0IvTou9cWFn+aIqZ6//U/lYcpElxcowy+R6hy3DUJ0pWn5cCEnOKgRhoUuVCv7fQ/PuPktxU2TH5MDgyvPzaowuDFzBTt57kcwMFgda8iINxfs7kpE/zS0gU9JKghnUWujkxdzwbYYQoH1FL53ht4y66NtW3UkpK426gx56OfpS3Hl+/Szr4Ybx50Rxgvt7izuw4h9qhiIZiqlId2blSugJLDykbmFy3+uCD9TmudXgHAZHJBHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NmEF/J40oEYASYXTpa+WuTu//in8iYvQMdD2H/ckOq0=;
 b=iB77ROTQhZ1+/41lg3sEMDbEHMHCuq4BXt1P9sqKxDadRCB/cMeGfsP5nXRz/noGHzI1zrddN6VziBtjPQ3Ex5TmgMUonlcOHkAfuEXTexMMbWevOP/Xr74IeeIQak9GFkDC91ckCo9dZ1ZNT9mAr6Lif/YUX60ZzDvz41X9lhAK2fQWLEn9+JpFvAygq9OBXiVVViqlHmvMVMGpwrWZUUf+NDcCQ7v9+WRzE8l6BaUAl/N4hl/cNEFIUrw60h5Kd9Ec5WTn2YTsiGAUGfrLo3mIiQkh2yIjgaLLMu1iIrVKvprBPZjN8pCzNZTeLb3isJV0lhlEROKBcrTWx9VayQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NmEF/J40oEYASYXTpa+WuTu//in8iYvQMdD2H/ckOq0=;
 b=xZlD4F881oH/b3QwWjkMzcMD0AjuNvbq83D+U7YTVtKh72h68Q4/MbO+sBjuWfjZsjCAqKUzHsA96rqc7d8rfk6LBb7XMfku83yoG6Gq4FdMZqWsPSUqR+Q8u2TagJpwtOaNa/xxxfKeNO5qnT7fz6h0/uGTZCytFzvhOJ9kbQK8GxkKWI7cdxgv/AsoKU5BI+fYa1PvA+tT6BD42hcGKe8s13Zadyo2pxwLJ/00l7y8eVVoebc72+RwHhnUCqort4rLRXFzg9fW1PSkk5dalVFXeul65Mj4OJ5xy8v1wj0AbEgc+MTY7ZKlHqh0YT9zHEx6BGGWQpHBDzbVlmxcOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a946d0cc-9a2c-3541-7f78-c32d5b2c804e@suse.com>
Date: Wed, 12 Oct 2022 08:48:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH-for-4.15] tools/tests: fix wrong backport of upstream
 commit 52daa6a8483e4
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221012064522.6827-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221012064522.6827-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0018.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9568:EE_
X-MS-Office365-Filtering-Correlation-Id: bb521913-c5c2-40d4-4db5-08daac1dd91e
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xd75LSBW3MekzKW01PIDUw4sYXsgQo5mP03/3l71tjkR4oaBhn5c5C9IzVcBwwX9HTrpxillNKwqPRG09iPC5lCg+7h2I0mrld64i4fY1uGy8g0QS5esNBef7bWEzC4wR1r8rgqsNZjbhdii5Yb8r51bQxed7GOFMaP4ubK15U7pkYt0kPRYgNVN8sTTYfklxN69bmPuVHG6aWiPgIKQBV3OPYpzV69h77SKT6HSlxpqRcUwO0C24ntXN0c5Igq8mC6RwQBPf8T4lDaaOGGUiQQfuPRSogZOPqfcJLE70GDQJVT3PWBhVIVOQlJY17Z9we/z/az5o6S8w/C43DVYVndDVPA+BCcb+3UB2l/bv0Qj8AgzvUkAeatpd12OXvixsNjP/fibLoqD0XKZKzc9CEs9hh2UNXVinMdQFV0osig1Vll9uKMjOcDmxUEuGFHXaXvyfo8UXj2ND6GWu2UA60f6sBecs4Ct/m0LWa4SURAgDb1SmupnmfB263w34n7yqAP5jvSMX06Fwhss5D98yFlrauiJHhjvmfkppF8+F7umwNCoxiYrpoiMHf9X5bbHWl78ASrgjt3HQXgltkkvaxScmjKHBCihJVMbOn5XfCb5ACE7xXlFMPSvRTum00ZchVgOQBZLwYghX1IW9QO5t2miO6DEUq/IDNUqJW+CiFmVjkWRfrCUa1tRb6lAe/uVn3IksDN9X+1xLi4MP1jt2aYL09kN0kgwC5vGr/1tbZtBfD+0mWb09VnNm5+h6szwwcoxu46uQkcWrw7Wjy/vUUnRKyGZlef9vaRDFCZidqYthNU/2JxKLwNvpQZc/TXO0HjvcjUC2KC+umdmf9ZUXw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199015)(36756003)(38100700002)(316002)(6486002)(54906003)(37006003)(6636002)(8676002)(6862004)(66476007)(2906002)(8936002)(5660300002)(66946007)(66556008)(41300700001)(4326008)(2616005)(478600001)(6666004)(31696002)(186003)(53546011)(6506007)(86362001)(6512007)(31686004)(558084003)(98903001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekVOaW9CdDYzN1FpZmgySnprbEZtZTkwSjExWE1WUkN5UmtSZjRYOFR2T0E0?=
 =?utf-8?B?VmlnNFlUTWlvdy9NWTRacjBYbmNGWjJuRUhqSG96eXJCLzBWL2Zyd3RuYzRp?=
 =?utf-8?B?Y1hTWTZsaFBoUkE1MzVjcFVRbThRNFIySFowSFdzbW84R1B3RFRqSnRKanls?=
 =?utf-8?B?VTBVYlhwTkVpdk5rRnBUSytGbVhlcS9sajFOZzBoYm92SDNNVksxTUprRHlo?=
 =?utf-8?B?Uks5K3ZrSHJ5TFhJSWNnMVlrUXJzdHJoeHllYzFZdXpocGxNenFSRmZRTnJO?=
 =?utf-8?B?QU9yeWJlNXVlMDJjZFpIRDJqMXZPdk1kWUhqclRVU2xxRlNHcGtpbTZ5dWJz?=
 =?utf-8?B?eXhxaUZlZWxmUDladEdVOXhDK1pMdFk3TGY4eURZZ2M1NDlOOWF2WGZNVHhF?=
 =?utf-8?B?ejdab29ob2pFUHNBR091R29nN213eDR0cXpYVUpRSm1mNWxvZlhmWnJjWHNX?=
 =?utf-8?B?am9VN2lVYlo1RWlaMytBRFh2cC9vVWl5WHJESVRvalpQcjNnQ0s0RmdvMHh0?=
 =?utf-8?B?eTRuK2xEeFlTVGlOWFpQb2MzSmovNHBiNGRiS0FjekpveHhZdDFvMFU1WXdn?=
 =?utf-8?B?d09GRktWUmd2QkVNTXpmSkJKTEttdzhwK1k4eGhJL1Irazl3VlVYZEVVeU1t?=
 =?utf-8?B?U2pJdzFsREVnbUxWY3ZiWVNlZEVVZHJhcWRWMEthR0VCbnFmUHBPVWFaeHgw?=
 =?utf-8?B?RFU1c0tOTU1uWkIzS0UvSHFsblowdFB2RzdTVmw1dzBuV3FGVXZLeE13Nm9V?=
 =?utf-8?B?ZXpCS0VHd0ZtS2xjYUt0N0JqRS9XUEdIbG43bCtvd0JSaEdoZGRnYTl3TjhK?=
 =?utf-8?B?dnNhMnQ2RDVsRnZrRFIveTlrY1pvWXdNZEdBRmEvOVJzRHdoNnRRWEx5OFI2?=
 =?utf-8?B?YzMrWXl3WEl0emdrQ0FrVHhOK2VqZ2RZN1U2TGRSRkhLY1Jia0NPS1RhMy9l?=
 =?utf-8?B?dG5Uc0xwL1NUMHlqSTlCK05oMnFYREw3SXI3VkxpV2FIT0RnVlAyMmhvVytq?=
 =?utf-8?B?NGtyR2ZObHJJeWpLSEdUVEZPUEJsbE1jZkdnU2FJRnpLM2RsdkpLK1V4eG4r?=
 =?utf-8?B?ckxmZlF1bnpOcTd1Smd2a3RnWk1mNlp5ODR4OC9ycW1OS0Q5UW5IVW1PMXQ5?=
 =?utf-8?B?aDJ5TVljcTJuSkIwRklNcE1SZXBIZk9zN2NPMEZtWlNzNUNJNTc5bWtUWERr?=
 =?utf-8?B?YTltNUFJaGNqK2NqTmpNNENiQU9SU1JEdUl6RHMvMkZTKzh5dFk0eFF4SFVN?=
 =?utf-8?B?TGd1THZFR1l2MktBQWFCdFlXMm1GN2IrcGtwMTNmR3lobGROZlQ1cktIUmJX?=
 =?utf-8?B?UlVOYmJ3SVU2ODBCZUdRUFdXV2lDQ3hmVlIvWDVmU1ZUUUtnR3lncGFYVjI3?=
 =?utf-8?B?U2FDaVErNTlNSW1iRDFjQ0MvalZqK1lrcEJvbWVzMnNqdXRwMitBSW5iVEk5?=
 =?utf-8?B?YjJndDQwR2dyYm1BMkorUFg0K3AxUVN1T2VHU1NqRGNkbkl6YmNxQm9NcXVx?=
 =?utf-8?B?Vmh2OWRFK2FJY2I2U05CMFpHQXZ3Y0lHVHZ3T2NMemhwK1dXQUhzYWxwd0pI?=
 =?utf-8?B?TXVIYXZlMStVVGxxN09HWWtPbTFPY3FNTjhLODdibkdYWUlTQ2JmbE9UdUpI?=
 =?utf-8?B?eGczeHk2OFpjSjl0M1FEYlRaVUZzbktwSHlSUmQ0d3R6aDUxWlVPOWQwc3Zh?=
 =?utf-8?B?RUdLa0FVNGFhNnE5Mm0wbWU0UTZMQlVON2UrZkNaelg5OG1LMkRwa2RqL3Nq?=
 =?utf-8?B?M1pUNW5Xb2JObmtvWXhROVR1WlRVWmJDZkw1S0huSEN1WnRJRWc0YVpZc3Bw?=
 =?utf-8?B?K0pWTFkvK0JRL1NISTA0aWV2Qk1CaFdiUmxIRHZweWtXR0FvdENKQTd2WFVT?=
 =?utf-8?B?Sm5pZmlITDhTaE9Qalhtb0dhWWF6Zm5yTUdYa1QraVMyMjNPYU15ZVNrKzlT?=
 =?utf-8?B?MlFVdDFWRHVaUTJ2Q3ZQbjVuVjJBZVhNdEp0YmZiZnQvTjcxdVZBUVgvUDQx?=
 =?utf-8?B?WHc4eWJNaitSUDdEUVdqV2JhVFNXTlNacjBVUkQ3anQzb3kxZlJFMGxDZkwx?=
 =?utf-8?B?MTdVY2I4M1VzRUdUV09XdWkvV1c3UzRJREJGalZNK0V2YjJwQ1B1bURjbThV?=
 =?utf-8?B?NldwR29abFh6VmZIMzhqYVNkTUVoUVllaExIdmFSLzk3UDc3MTVwRkRvU1J1?=
 =?utf-8?Q?DNilUffd6hIP8xlL8qmAjOCfotVR8RPkvWJqTF/VdL4b?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb521913-c5c2-40d4-4db5-08daac1dd91e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 06:49:02.4736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: puUEV141xQwb4M+61PT+NaXSAxnWkFexkpJI/p5W3ceNDCf/9bd/N60YLnKBmln4MD7rNwqzTTnPQ7iXYFfdiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9568

On 12.10.2022 08:45, Juergen Gross wrote:
> The backport of upstream commit 52daa6a8483e4 had a bug, correct it.
> 
> Fixes: 3ac64b375183 ("xen/gnttab: fix gnttab_acquire_resource()")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



