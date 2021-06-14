Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 129873A6968
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 16:56:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141604.261510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lso0q-0007hx-Uq; Mon, 14 Jun 2021 14:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141604.261510; Mon, 14 Jun 2021 14:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lso0q-0007eY-RU; Mon, 14 Jun 2021 14:56:28 +0000
Received: by outflank-mailman (input) for mailman id 141604;
 Mon, 14 Jun 2021 14:56:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGyB=LI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lso0o-0007eS-SC
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 14:56:26 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81d0eea6-5169-4868-9341-5756902a9ab5;
 Mon, 14 Jun 2021 14:56:25 +0000 (UTC)
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
X-Inumbo-ID: 81d0eea6-5169-4868-9341-5756902a9ab5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623682585;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=g3lM/GV6pXX5PGX+Whlxjp2NRc5FeWZi9nwX0iUHM10=;
  b=PV2Dp59YH6oXSyTOhf7Ll9eVPLNRt3kJx5g+431MF/mqpg0brJW6ZiLQ
   yX7vjarIzlfYgN79EDD6NJdSBsFWHER4azvj4tF1SsJiKuDnPbky2RhL7
   EhGY2c9ibyprBNs3HQznNPOJWo+cdn3krqxHS0/dNN8+adZ7wmusXyeZ4
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +/Nxmbb4XbbckSOE9o/SQkJuPt7njpGJBxgQqZA+AmurKQFH0P/sNUBMNjNwwtEgei3LinjAI5
 0B06yRY8tje7JbBKHs1Hz9uy76e+VvKkSKaMHZJFbgmaLmkNS9bcdmbzAueGZR/wcgNwNzIQfG
 EwKMoOlsdOmz4wLJMvU06AcUCZSSxOUmlKMKVQ+3CfKt0+x+deRMhIRwEXw7X4PGwhV2EZNxjC
 sBaOPhk27GidJErAqTccz1KbeIp2+vwXFOEUy/s6GdgfA+asPejcHaw/C2JNPlt5a8hsH2y8BN
 s+4=
X-SBRS: 5.1
X-MesageID: 46442210
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:TuECX6147KWERYSAdRBfLwqjBIckLtp133Aq2lEZdPUMSL37qy
 ncpoV/6faUskdoZJhOo7C90cW7LU80lqQFmrX5X43SPzUO0VHAROoJgLcKqAeOJ8SKzI9gPN
 BbHZSWQ+eAaWSSxfyKhzVRn7wbsaO6GLbBv5a5855Cd3ASV51d
X-IronPort-AV: E=Sophos;i="5.83,273,1616472000"; 
   d="scan'208";a="46442210"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8P8UZa5Nc9Ca3YzH3WMhQQSvKq4zLyZdkxI67IihTdX8A3NdVqW+BZX3f5mpZiIIJpg+hVenv3BGWbj2Qip9B0DYAeqcTSuYaVMAebZP+lZ+05TsnYGNGVw+FzPQ6cQJzpZyD0xCXD8nIpobXgEOKNajm6tr/NT4Zbdkw63h4Ld7MS8udqX3+GyAXJo6zfOhhAbqB2DINoeKD//PW0jUOfPFWtppKMR9N8yKKgwBMhk5ddaTVsDWcu4zyRwmTg4J4WEojuEAxZZbcUcqFKia2PwqZZ2hoNbBf9M8S3p/M3fLnJAPK6U53+w6NEglosOz/p4UyldfmMUje/DfkP7iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3lM/GV6pXX5PGX+Whlxjp2NRc5FeWZi9nwX0iUHM10=;
 b=ThHM7GXsfuaN9GJ4ZLi1IXUIG/ex2sjR/PC0pRfP2bpTeIfreZ+srageoAnwQxnDnQhUjYIueVz3x547H3JlxCDw3Indtky0oFQeXEhKhnfsKTb18SGelSbD7qucw8FDhTlnuU6IZ7T9ssEuWULgaSik2kvglm9RM6GDf+8/MTqVvjomdZLnQ1sFIcmBzp6QJyaFbym+dSw622oJ3sPVfkbdiVaU0FcUGPcHizLcpQLdK6PF16x9HTBxnE8JBUkbgai+g3AvjFTezYZ6aWChTkAnvhdWLNPS6xNVavBMXD0aqaFZFg477kLmN7iPQCdO+8YBDRVPLmQMqQpkQge1pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3lM/GV6pXX5PGX+Whlxjp2NRc5FeWZi9nwX0iUHM10=;
 b=MBYm4URU6emz6nKr3WIqwR0X0LUHLjQzIsVF+/UZdwR7mf4iQOQphVbIfo6Wqsc2rRBX0+xBGZW8zPok0T+MPG/Tpq593iwuzOTX6TXWRcxM3jlIbIAabNScXFH3x4lzoHKxmnZTgLytr2cxktwqxMlaaqbpmfwgIRWoe3c6PL0=
Subject: Re: [PATCH] x86: move .altinstr_replacement past _einittext
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <759595e2-808a-46c0-7a93-fadecfeb991b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8c0ecb59-67b3-2e3d-590c-0f55d805ae54@citrix.com>
Date: Mon, 14 Jun 2021 15:56:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <759595e2-808a-46c0-7a93-fadecfeb991b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23bd9232-7446-4d83-c579-08d92f448a23
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5885:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5885AAC1E2B1FC3277105DC0BA319@SJ0PR03MB5885.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3SQET1XMGcHGkNxzTULQE4dcsLKkBrOVRb+n8Q/WVDK26YxWdkNCz4Je3ZnZGiDIcfn9/caQP0s7ZHWjIms1MetZoqk2GfSKxPsm/xQn8aDzbO5qpRFGNJlA4Ao+UzixCzMs4gNiDaHdXm0rWY+t2NydaglRyNXNEjtaX79TG8hatelWvh+8X4GYZizYmo9EgNccatNfgZHVIM5DoWvqb96ZSAwWFU9OVrFmaLnL7fweDXGLY7nt1rSkUwZjivLEatIn1FQXRYJnUOc+j2lZgDYzHU9TgoWnR+H1SMjQHFtBHG+OSuFrehjZkTQClZLhMOxfk2P318M6rsbxxtK3oDTtVdLwMy9J0w6DEL2ao/ah5ejt8Ua26WmKNMZnawqIYgv8iRrdgV8HF7EbDEUOa9cCcd/kLrRVNU9PcVY22mycdZ7OxK42wxVFr03ba3Y4+PB0LPgIcYHTvBpTPLJuixmOzT6uRo+uITmgIe8C+pBF8Oikd48kHXm4cgQ1PzA38BzUQHuLkKSJvFjABf7e9h9M+uw8eZOJKW95r+HjVQOCDuVLH1qkBKVOTQsyW3JuyvotG58fbCOWkYyvC9YY5UU7rtxhdj15PfHXvWE/1SAY8rnUDOKmF05+L730UBgWj2zA7beXCdOjSYFkBhrp72sA5duSutpLbBLZX06hQpF92OKz7AAGUA+xKf0qIq11CVasAnXIOhH7clO2RNIf0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(54906003)(26005)(2616005)(66946007)(8936002)(956004)(2906002)(31696002)(5660300002)(4744005)(66476007)(86362001)(66556008)(8676002)(36756003)(478600001)(107886003)(6486002)(316002)(186003)(38100700002)(31686004)(16526019)(6666004)(16576012)(4326008)(53546011)(110136005)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDZxUldMOGdzaTFVd1huUm8vdXRub2QrcllTRU9mUUovY0dzRFY1ZmZQQXhC?=
 =?utf-8?B?S0F5R0NRNHV2amFPdUU0Znl2SUllbkJDdXhKWlB4dXFPeUV4ZEgraGI0cW1R?=
 =?utf-8?B?eFBKbHFqMWE1aFQxbnEyVXA5NVgvZDRZeFIydUxVQ0ZGMm12SDlUekUrcmFj?=
 =?utf-8?B?Y3lNU0VBcEx1ci82UmlmdzdiOGdtdXkwR0tqY1VoZ3VSVUJNRnl5NGxNZVFO?=
 =?utf-8?B?bEhqRzZMazRwM0xrek5DS1dJOXJIN1JQQW5lWE5SRENxekMxWHBLS2VGVTJP?=
 =?utf-8?B?RzhTMmdSZVJSMEhnS3VJNGExTDV5RVMwUzQwSTIzV3FkNVlHTll1SzBtL3ZD?=
 =?utf-8?B?L1h4QW9vZ1ppdjBkS0hiSDUwUGVaRkVJR24xbnhpN2FHVVhWYmhSTEpqQzF6?=
 =?utf-8?B?ZTU4dVBwV2hSb0l3QVE4bXNYU3pOZ3ZmSnYwMytyMHRMUm9xalV2WkVlVE9a?=
 =?utf-8?B?MTNIZ01VS3ZaN3lMTjZtMmNvZzRjNHIxZlU3bWZ4WkhTeUk0bzFUTVBKUzNO?=
 =?utf-8?B?MFM3SEV0ZXArNTRXYUJIWW0vYkIyZEMrNWtXR1lndlB5NjRTNjd0ZWhWbVVZ?=
 =?utf-8?B?aFArbEVwcVU4VFZ3YjUvVGVqS0VZbk54Z3UzdlFNR29Pdks1YUZyWEJMcXVU?=
 =?utf-8?B?YTY1UXdqU3lHUld0TmFKalNTZ1VlZWtNa1N1SWtjWnJ6TDBKSWxYUUROcUwr?=
 =?utf-8?B?NjVxOFloQUVEcDZ2ZG5oZGRkVy85d1JiVU9EbG5Da2tCMjBsbXN0STRQZUgx?=
 =?utf-8?B?UnMzc2N3cGo2OW5QekkvRVlSRzlhRFdWQ2pFZnRxNlZQeFl4aDA0VjdQY1NC?=
 =?utf-8?B?WWdtUFZvb0ltWnpTUnpEN1NoWFhVTTRWN0RBM2ZvWmdMOWZ6RGVWa0VuRUlF?=
 =?utf-8?B?YUpjRkFOOHhPenBxK1dwb2tjRFZsSU1JeWFpT0hjck02cXpiWGRWWHBmb3F2?=
 =?utf-8?B?WDBBNmRuODJLcklJSUQ4VnpKTE1hQTI2TFVLR0cxc3h0MnJpSGtvd3M2b0tx?=
 =?utf-8?B?R05xenVCekNCendjeDN1SE9ubFlkS0JXb3QwUHRZakc2K1d4dGxhWDV0N3BS?=
 =?utf-8?B?ZXhNd3NhQ1RpSmdjZFdEV2kzUlFqcmdxNXNqd0ZuQUNaSnhHcFU0T21GVFFk?=
 =?utf-8?B?eklYY0lWL3d1VmFZdTh3Q21yekhEbC81UHZ3dFFuTEsyZDhLRGlVcmsvaEdP?=
 =?utf-8?B?RHA5SEY0eVJaRzVVZkw1MlB1OVE5Vi9RZUliWkU2akkza0FiSEtyaU5KVzF3?=
 =?utf-8?B?ay9XcFM0akVQd0M1Rk1aZ0Q3Mlh4b0N4QjdqV1BEeEN1V0U4S210aHZXOGVO?=
 =?utf-8?B?WnhTN1hvMVl0aVhtUnZ3WStCZ1J4M25LVWptdlBGTjZCRGhvNTg2N0grTk82?=
 =?utf-8?B?ZnZIaDBHK3hyNHpTaDZMVm9yUmcrb1NoTWxJdDRKY0hlNUxKZVFvK3JzNEJs?=
 =?utf-8?B?STRDeW1lc3hFSTlmUnVNZ2hOb3NwRDY4N0tEU3J4eC9HQ0VNUGFveU1wSi9B?=
 =?utf-8?B?QmdUY3o1QVdFeU5ENmZYcm1ZczFkSEJwK3oybjJRMDVBWUt5WDhIY0tZeDl3?=
 =?utf-8?B?SUN2QVdFaDNTcUV0K1UzQnloVXprYlM5QTFJaDBNcm1xSnJFK05oeFRONmdV?=
 =?utf-8?B?Qm8zeldQRUV4YnF2K05pTkxmRlp5RHJqRjFKQjl4Tmxxem92ZlhOcXBOajNl?=
 =?utf-8?B?ekIwdFZSVWEwTGFUQmhLbUZiREN2b1RDelZacnd6WmQ3YUdWdjU5SlpubWhO?=
 =?utf-8?Q?+YvQikBRa8a5g8PFW8JXd0FEyWCrCucCXAXZ8Lh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23bd9232-7446-4d83-c579-08d92f448a23
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 14:56:07.2526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pNxncqvAjzLyVFKnVsovPY/U9bXS8lzE5RvLCReaAdXznrvM8cXwN2tDcEt5vROtGz17ih1YFx8O3GxkkXS2RTLlTW9KnC0Z+Vd5OJ4wctc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5885
X-OriginatorOrg: citrix.com

On 14/06/2021 14:53, Jan Beulich wrote:
> This section's contents do not represent part of actual hypervisor text,
> so shouldn't be included in what is_kernel_inittext() or (while still
> booting) is_active_kernel_text() report "true" for. Keep them in
> .init.text though, as there's no real reason to have a separate section
> for this in the final binary.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

