Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A4851007A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 16:31:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313964.531793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njMDt-0001Ng-4r; Tue, 26 Apr 2022 14:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313964.531793; Tue, 26 Apr 2022 14:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njMDt-0001Ks-1j; Tue, 26 Apr 2022 14:31:25 +0000
Received: by outflank-mailman (input) for mailman id 313964;
 Tue, 26 Apr 2022 14:31:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njMDr-0001Km-Jv
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 14:31:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b57953c-c56d-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 16:31:22 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-Ecu4GaVEPv-IjKhEEyeTbQ-1; Tue, 26 Apr 2022 16:31:20 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB5105.eurprd04.prod.outlook.com (2603:10a6:208:c6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 14:31:19 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 14:31:19 +0000
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
X-Inumbo-ID: 8b57953c-c56d-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650983482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CI/BjeY9k8CyU3N0LNknU8J47Xrk2Iq06GNdksumwdM=;
	b=Yhao4i9/lnfWMAlyfDyBoj79nP+dCmHClZCXY+CnELDCc/eAjQLSIuwFPxYoFuJHgWvMxx
	4jpdHJNzjXakBXgE4Q4FgOijCs3a53VRe41XLgxP9i3TL5cCZgf9j4uxmfEl21l9ad6khI
	ff69yrvkWhSsHX53mDJd9UfLhpb6JJM=
X-MC-Unique: Ecu4GaVEPv-IjKhEEyeTbQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=McFq7a9dkaJ9Gn6lB1ip39MSBmz6G2qcm1yJYuEv/XdslMob0avYvp34zPoTbp4okCUU/i4HKF9F7FccJ8YQcfrNI+3rOrfXjEEHV6YDiQ67nLJrlTzPNPHQaEiGpFsnCkVRbNFSKn67rPIpB7eXrmhvbYHeUMGlhYdFSribHWM2CqPHn4ZMnFNaMV46fKWhVcQ/6SdEgJMA9IYov0wxiuoHNBZ6l4gVhFDInEqCKvrfkj96SjgeVMG9izGCE9R0nQegNkrwpwgCgYvjPkQb1IvgzaH19E1lfI1Jr/OTXfelsCvJVOIROffz+JxOkzMj5rElVA/hvCkPxLqB/2PDbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CI/BjeY9k8CyU3N0LNknU8J47Xrk2Iq06GNdksumwdM=;
 b=mTHX6DqM/ibEzd/F6BqaY7XRUloqb4QDx9BV1qsGxAQilZQBUZXc8l+ePQCrJ/yDI6m9WC1mKRxqdySyQE9BHbsQI5d0FvDor8Hm4BBXtMXX13NfobSTdIW2195VG94IjuwM2Ob0GRk5EvbxF0qKhQXnaJH6Wq7BdPPU5jjwPJMYCaMJRPs0OeNavG2ga8fE8ywZ0EgKQgfUr1667hFvmnZHP3BkMqOcFZWhx+cGvJBTLeXyCEpkjJP8SEqu0MaKkcVFDhYaih7+Ocv98wsaTyEvmz+C+6wVa8bB4E8K1RNIFm28OphsMKGxohl/mV8bJUk9TC1B7NL0N/Hn29NNag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <413651ff-55a4-61cf-efed-7ac82f7c6723@suse.com>
Date: Tue, 26 Apr 2022 16:31:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 02/10] xen/x86: move reusable EFI stub functions from
 x86 to common
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220418090735.3940393-1-wei.chen@arm.com>
 <20220418090735.3940393-3-wei.chen@arm.com>
 <3e5b9708-7732-a56c-f2e8-d5d39fd2093e@suse.com>
 <ed949bf4-ba9e-9ad7-b2fe-c63526ca42e5@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ed949bf4-ba9e-9ad7-b2fe-c63526ca42e5@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0008.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::21) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab8e3a80-baa8-4ab2-94d2-08da27916d84
X-MS-TrafficTypeDiagnostic: AM0PR04MB5105:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB51057814A1AFD3165E7A877AB3FB9@AM0PR04MB5105.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wqHd65fZl0RxQkAN6GGU6m7RQVk1vRpkP61dzeqXzfJ8M+ZQo4t0As2y9DUkH3ZhKI+1vb7Et6wxR7orinmO1feViflvVXRI54sgPzG25AzaVP975iYtce9T6YyhKtiPkNGvBaULnNrBFoqpABlpyF9H15MVhWK9ltkBfS8hcYWQyMTlPuyAgJzMvMrgYNIWN6hFOcWQd1jQ/FykMzlWmjcfL2C8KkFCz0uu/LxAJSpaAV8RbyVNVo5OlTU4HPjAf1n5nNbLiTwY04mDAtYnZJpZtKJK8Luay217VdN54jY2kmwZCU0PwPu3e1UK1YGADPI09e8D9jMHHWDZqAnJYtLjEBaFGTJ57AI6rVSp11uD/ZIMQFIG0aRKqQV99WCcI1VVq5i3JaaGFflCDAsbeUyk4bgyNDtw8oDoP6UGSfIleLjsYAoJ+piigTHt9vjlyvf4xSFtPSGyYjTo2R2+AkvpGV7kbM2XKdbAf04IfjZ5JUyOSoI7tzc/UwC42i6YXMMB9BGlBX3hxG7NMhPxRN42VMAo1Lck96O+4aI3Z4Cc+tou4ouX3XpPYpDD6b63BHFHK29pkWc6dKVXoa2mOuYg2iwoHET4NXzlER80n2uHw1GvlAoZIUp+XKDUStqWnywzYISpCK35kuhJAZ9adQHcF+FGgVdGPIOKTOpAejnqpgiw20xqdZ1G+yQzlNxGqxhzjeq+0372b3ThjpAG4ck3RbY1QcPyi+bL4iKS8lpWlBCcOVM1Wkm7LtFMj//R
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(2616005)(8676002)(66946007)(4326008)(66476007)(186003)(316002)(86362001)(31696002)(31686004)(66556008)(8936002)(5660300002)(6512007)(26005)(83380400001)(6486002)(54906003)(6506007)(508600001)(53546011)(6916009)(38100700002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUdJWExxK3o0YlVZMTQvUit6WUFDaE1kMEkvWU9zSkhTQ25yUHdaR1Y1RWJj?=
 =?utf-8?B?STZ5ZDhJdmg2WjRXa2N4MW45SVA2ZWJFSXpCWUR0anRKOGNvSURrUnQwem9X?=
 =?utf-8?B?aVBJYWhoK1E4cjF5bzRMNmZqRVJxblRTWnRubExFSllQU0cvUm9MNnhRbTJP?=
 =?utf-8?B?RDdCWW9wbWcxTGg1TmNrRzFwMFZ3Y2NLeWQxMExiTi93UFZhQzZzUFZ6enBZ?=
 =?utf-8?B?djUzYjk1NzM2N0cvZ05lK1dZZHlSSXlGRmI0eTd5TkZZNHdxWjhRQkd1dk85?=
 =?utf-8?B?cXBxRDFhS1FmUXR3ZFUrYTVUTW56cFJ4QzdxZFMrUXQwbER2c0VrdXpjVXVM?=
 =?utf-8?B?L2xHTEp2TnhwQUp1bll1c2VHU0dLQmdOTmltUHloeUhudTVtalZLZC8wa0tD?=
 =?utf-8?B?V1J0ME1WQTRTZlN2YkNhN3FHZGRSMkVDbWFHZHc1Tm96VjQzYmNIeGJlWTBL?=
 =?utf-8?B?ekhobUkvQlhBSFJ5dVVUNnNhTTVVOVlMczdrSmpaRzc5UGlHZ1pIcG5XaUNF?=
 =?utf-8?B?ckJrU2c5OVFDWGVadzFEUmRRK3YxRXFPNm5WNEhJV0d5OWVIRDExNDNwcHpm?=
 =?utf-8?B?SzdwZUtXT1VMUUx1ZmNlYTBZZ3hsV3RaWmNsS0pQV245eDIxdVQ1UzhtSXhH?=
 =?utf-8?B?RWVFaTZsTUVlYVRQbzR2c1ZsWVh5MHgzSXlib1pwTmtZMGhmVDNUc3Q3YW0y?=
 =?utf-8?B?MzRVWDI0L0tnQllDZFpJVU5ITHdybmxhdEw0SFVmMnlNc1JyM05SRGZjZzNx?=
 =?utf-8?B?NTRqdHRYWG1yS0RNWG41eHU1aUd5Ujh2dmlIZ252dHhOamtsd0lwQ2xoUGpy?=
 =?utf-8?B?VGtkN0dFaGw5SnRnMm5DQnVXdHFrQ0N4RHhaenhQUkhPVndKb2lVd2Q0dk1Y?=
 =?utf-8?B?MzVSVmYvbFN3WWY4THpiWWdDTlIxayt5cmt0RjliK2hjbzd0QnZFNUJUaXJO?=
 =?utf-8?B?SncvVmZndk41QUFQQlRIWEY1L0dveVJkVU0wMm9jUS9ab2hZQVFtTjdFUkdF?=
 =?utf-8?B?bXljV2kxWlh4MTBMeWtmWlRMTDU5Ym9QTm5ESTJVVUw1TERHU21oWENlZXEx?=
 =?utf-8?B?Skl6YnoxNTMxeE1Mc3pDaTE3QmFmbnNxRG84bEp0WldwWmtOTlhiaURZYW5S?=
 =?utf-8?B?Q3A4ajNaOTFoNWlNRGozemE5SHVuUDM3SXIxNDIrRzA5ODM0aXNuT2hTL1Rl?=
 =?utf-8?B?TVdmc3hXUk5EaWc3Ui9FWk1UeTBpcVd2bFNzUkRDQ0FQdnhhNHI2NGUveFpu?=
 =?utf-8?B?NktFVmE5ajVkcDhxRHk4VHZnTHVlMThPZTB3ZlVWL0xETmQvN1cyQlQ1aUgz?=
 =?utf-8?B?MmpJSkpQbU16U1l6aEw1ejFUNjlUcGUyT1RWZlZwb2ZYSE5nalRZV3c1dWVw?=
 =?utf-8?B?alZSRlA0NTlVMEM4MlRxRjJNTGxqQUFKUXkvSVpBT0JSTmlDcEZqK2FYNVIr?=
 =?utf-8?B?TnBackNLZ1IxK0l3WXhhdDIvRUlYRG1HaENRQURERTlhZlBKbE11YUpVK2Qz?=
 =?utf-8?B?U1NJVDUyM1FVT3dFemxxZkw5c0gxSWt6Q0hLblNabVJVUjRENmRNV1Bkd1NN?=
 =?utf-8?B?cEVxV2J0SnpZWkVvcTBpN2NVem8ya09CWUMxY0tQeUNLWjFOVDhvU0piMGJo?=
 =?utf-8?B?YlZyVmdxTVdiMHF5ajVPWm5TL3UweTFOeEpZVk9XTDJqRmlPTzdid3VhenFV?=
 =?utf-8?B?Mm9kZlNMcXBVbmVmNGJuMWk2ak1FbG1nSFlIaUMvSEpNUzh2cUxjSFA3a2Nn?=
 =?utf-8?B?U1hUc1NxR3ZoZnRIZE82N01DWDdkeDhlTHNmTWtuT0lteGtiNDduOS9PSXZK?=
 =?utf-8?B?Q3VMOTYyTDduNlFHbWhCSHR6cDI4U2RBRkQ5VDFPRG5mS05YUEViK09kQ1JB?=
 =?utf-8?B?N1Evc2M3emlSNW52djdOTUdaaVdmU0lGV0RJY2xEYjVaOTF1QkFJMUhCMzA4?=
 =?utf-8?B?R25RSTY0RzNKcGdLdlVjOVoyM0FVVk50VFhpV0FZdzIvdnVQTUJONTE5dklX?=
 =?utf-8?B?c0Y1ajRVemNMQUdWTTV2TC9GUVRWRE5RcVRhdG5XNmN5QWQ2Uy9hcmhwcUZa?=
 =?utf-8?B?UlFRT0krOWpyZ2MvVGdPdjVNQnREL3BiaUlZWnpqUG9wd2RHNWt5RE9Ud0V1?=
 =?utf-8?B?TUFiR2tEUTgyREYyenBJMnlaYWxFZzZ0Wmcwc3Y4QzY3NzlEMjNHOThGbHd5?=
 =?utf-8?B?WDRzNnJVWVRrWTFIeVZLQjRvYW82dWY4YXJ3bzg3bFZHczZ3c1RvWFExTEl4?=
 =?utf-8?B?NWNSVjZNUjBkcjdRTjhOY00vSnFScDIydUlPQUdsdTkySVdOQW5vcVI1Rncz?=
 =?utf-8?B?TmlncEkzeC95czlqbmpNaUErZE42WVVTb0JtdHoxT0RKcHpXbU81Zz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab8e3a80-baa8-4ab2-94d2-08da27916d84
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 14:31:19.0152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ddXO7VX/MMX30/y2wiuageXV57I6uRSWqUraqd+iBwX1c8c54O3tsq4yiSV/9k2mOrwhd3iKZs0mR2gf7K897A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5105

On 26.04.2022 12:37, Wei Chen wrote:
> On 2022/4/26 16:53, Jan Beulich wrote:
>> On 18.04.2022 11:07, Wei Chen wrote:
>>> diff --git a/xen/arch/x86/efi/stub.c b/xen/arch/x86/efi/stub-x86.c
>>> similarity index 71%
>>> rename from xen/arch/x86/efi/stub.c
>>> rename to xen/arch/x86/efi/stub-x86.c
>>> index 9984932626..2cd5c8d4dc 100644
>>> --- a/xen/arch/x86/efi/stub.c
>>> +++ b/xen/arch/x86/efi/stub-x86.c
>>
>> I'm not happy to see a file named *x86*.[ch] under x86/. I think the
>> x86 file wants to simply include the common one (and the symlinking
>> be suppressed when a real file already exists). Naming the common
>> file stub-common.c wouldn't help, as a similar anomaly would result.
>>
> 
> How about using stub-arch.c to indicate this stub file only contains
> the arch specific contents? However, we cannot predict what link files 
> will be created in this directory in the future. If someone needs to
> create a stub-arch.c link file in the future, can we solve it at that
> time?  Or do you have any suggestions?

I did provide my suggestion. I do not like stub-arch.c any better than
stub-x86.c or stub-common.c.

>>> --- /dev/null
>>> +++ b/xen/common/efi/stub.c
>>> @@ -0,0 +1,38 @@
>>> +#include <xen/efi.h>
>>> +#include <xen/errno.h>
>>> +#include <xen/lib.h>
>>> +
>>> +bool efi_enabled(unsigned int feature)
>>> +{
>>> +    return false;
>>> +}
>>> +
>>> +bool efi_rs_using_pgtables(void)
>>> +{
>>> +    return false;
>>> +}
>>> +
>>> +unsigned long efi_get_time(void)
>>> +{
>>> +    BUG();
>>> +    return 0;
>>> +}
>>> +
>>> +void efi_halt_system(void) { }
>>> +void efi_reset_system(bool warm) { }
>>> +
>>> +int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
>>> +{
>>> +    return -ENOSYS;
>>> +}
>>> +
>>> +int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *)
>>> +    __attribute__((__alias__("efi_get_info")));
>>
>> I doubt you need this outside of x86.
>>
>>> +int efi_runtime_call(struct xenpf_efi_runtime_call *op)
>>> +{
>>> +    return -ENOSYS;
>>> +}
>>> +
>>> +int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *)
>>> +    __attribute__((__alias__("efi_runtime_call")));
>>
>> Same here.
>>
> 
> You're correct, I check the code, Arm doesn't need above two
> compat functions. I will restore them to x86 specific file.
> 
>> Even for the non-compat variants the need is un-obvious: Are you
>> intending to wire these up anywhere in Arm or common code? This
>> of course is once again pointing out that such code movement would
>> better be done when the new consumers actually appear, such that
>> it's clear why the movement is done - for every individual item.
>>
> 
> Yes, but I didn't deliberately ignore your comment from the last
> series. I also hesitated for a while when constructing this patch.
> I felt that this independent work, maybe it would be better to use
> an independent patch.

Well, it of course depends on further aspects. If it had been clear
that what is moved is actually going to be wired up, this being a
standalone patch would be okay-ish. But with this unclear (and, as
per above, actually having gone too far) it's imo better to move
things as they get re-used.

Jan


