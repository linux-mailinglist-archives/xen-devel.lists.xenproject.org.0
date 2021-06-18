Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BE83ACBAE
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 15:03:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144595.266115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luE91-0003sy-VV; Fri, 18 Jun 2021 13:02:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144595.266115; Fri, 18 Jun 2021 13:02:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luE91-0003qj-SQ; Fri, 18 Jun 2021 13:02:47 +0000
Received: by outflank-mailman (input) for mailman id 144595;
 Fri, 18 Jun 2021 13:02:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUMw=LM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1luE8z-0003qZ-TU
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 13:02:46 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bff6551d-79ad-42b4-90f7-9c9ba6c44261;
 Fri, 18 Jun 2021 13:02:44 +0000 (UTC)
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
X-Inumbo-ID: bff6551d-79ad-42b4-90f7-9c9ba6c44261
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624021364;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4akS4ZHJYIKwDFwHISfnWsjyQ8h8rnQ7Vk5dUlZFiEw=;
  b=HKjRlwdU5YOsP4muyr2Kc5ku9YJIZzoAq9Q/L+jPEmZxHj9rIjIAPvPy
   U24IUmNRnu7bhCCPoOm47W7hsfs4aGD6AwSrcirvFT/TD7oEqLnMI4zu7
   a6BMidfhrIq6HnDT0Bj3UU/XbEybPZolqye/w3rhaPig9iuRz3LR/9QDt
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: QN/VZVJVBuNgXvBVbGpX0Swulg3CYshVLb3M8U2RM8lO3Hgsi72uv0TG2zclzpz8hqb7guypsB
 ubLSp3BqGpDNrCAYImp/eTc9X2UnX/pEA5VLV7wmyVD5hkyyJPAix6zg7SxU/WcEm00oV+eVBP
 ujLAmmp0CI7MnCtIJsLN1irDdNsa397oXIe08F+3OQHQ7aT3LX7DHOMUMGPZ9k85Z5MmRhC5dk
 sw0s8n+slE5Dn4NCQXU/uMD0JNwxpMDHXqOtJPVlRM9XV2CLfR4fCc5HbVXeRZLjoAl75SRjP+
 IT4=
X-SBRS: 5.1
X-MesageID: 46824899
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:AFoXwaFgoK+XWXpBpLqFDJHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HlBEDyewKjyXcT2/hvAV7CZnibhILMFuBfBOTZskbd8kHFh4hgPO
 JbAtVD4b7LfCpHZKTBkXGF+r8bqbHtms3Y5pa9vgNQpENRGsZdBm9Ce3Wm+yZNNXB77PQCZf
 +hD4Z81kCdkSN9VLXKOpBJZZmMm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTij9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZgA+1Dr1fqOk2lqxrk3AftlBw07WX59FOeiXz/5eTkWTMTEaN69MdkWyqcz3BlkMB30a
 pN0W7cnYFQFwn8kCP04MWNfw12l3CzvWEpnYco/j5iuLMlGfhsRLEkjQVo+M9qJlOi1GlnKp
 gsMCjk3ocTTbvABEqp5lWGqbeXLwEO9hTveDlOhiXa6UkMoJjVp3FojPD3pU1wgq7VfaM0rd
 gsAp4Y442mcfVmJJ6VJN1xDfdfWVa9Di4lDgqpUB/a/fY8SgPwQtjMke8I2N0=
X-IronPort-AV: E=Sophos;i="5.83,283,1616472000"; 
   d="scan'208";a="46824899"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMFtZ+c9WQs2EdYtCqG4WgEXz5BbD9k5Tv9p9sp9tRXMEJjj8zouuY5PeVZMswGE0loXvZBoW+mIuASJvsbyjGG56Czktoqjn0FhlR5YHEam6OOvvI8jrftv6EAczZzCjSQV5A/qcniDxrKkCT5z5W9TA8gi1WTX/VntI+W0KFvabgVIuQvQWPRxN0MQHMyLYsr4CpUapve3M7it+ADwbCZE9MzpRLhb0zkYSCuCeKf+0cXmx2IWn7f+WE/A4L+vKXkoRmSWcid7Ch7OraEnbFwZOwUiDbx8s6s5b5nUUJ8+kAqDpa+WdxL1AGtRnhIDYIysm2FrqgggDspLq0iCdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubYbjb3qJxOp3audMyHTIWJqZoVf7Y0wIU88PPTeYLQ=;
 b=IKHn/Muj2XSiHgf4lF/BQmnGf4csaO9f+KFm7JSQinaAVyAFZQXSoVm8WWDM+Ed9To/vAViBbUhNWAiE/fZpL5sK8m3F3Yq956vjbXbyK5hGDmpcUograCqxAWjRwyopHggJB1QE2O/BqHy020QuJmjeJ8qxgREElOtJgdtyVZENNHFD1QYQyd/nAGh/xS/z0EyzJEFbKVNsJMGYI2rRTm4dqZ/TTmp5/jRfukNnBSkt8PZXeFGdX1E9bSOt3qWOfxL5ERtsiz0/qAO/kJ0AYunTtjg5Exm/8jHuwpXR45DNnM44/gpgcPtD8WCmgaYFqELFbKXhQXsqEvDgtYeOmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubYbjb3qJxOp3audMyHTIWJqZoVf7Y0wIU88PPTeYLQ=;
 b=KpZeU3mk1Hqldz2YRq/6STv1+GtGwT6bGDpvjjXasmaxx69SxlO1/8XO3oEd7kTwQzNmVUBpO8Q5dd+XksAVJu4RofTmhUFQhXrzdWfgzSgmkSEKAcgqC62e7dloiWdzg2jKKBrkVGcYqE4jR3mgQDIL8/K/tyUgjlJJcSMSWP8=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Juergen Gross
	<jgross@suse.com>
References: <edaf04ec-335f-a156-34c4-5c0385cba08b@suse.com>
 <c3c5df61-32f8-1ffa-aac4-0c83d620d385@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/5] x86/HVM: wire up multicalls
Message-ID: <511f161f-75b8-f23b-c6ba-cd7afe303760@citrix.com>
Date: Fri, 18 Jun 2021 14:02:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <c3c5df61-32f8-1ffa-aac4-0c83d620d385@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0176.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26955d91-e0cb-4a55-eb89-08d93259588c
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5423:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB542384440B2DA3C775E72BA2BA0D9@SJ0PR03MB5423.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FlA0yGK5nZ8eQhT7MHa7Gpfu6CoTAyj6tijfW5FZ/TgWZgGJ5ZqYMKwkz6ZPbbGQS7DRRu8ln6RNkXrpuE/o5BFan7fiSYuuDrAtgzdg20Bru7WUiysuvlyC29yslcN4/IPyt5KPGCZs0Ja9OdohkGzBDh2uYeffe/+YoqUOpoq5SmYnJkx8BAeeawUo5NuYB0J90/QV5645WGPyonziEnKCe5axewYQrqJhEG6az3VMl/8lBBi+H8nWDQGyrP78dl7GPE1wz1XA9teybi2gjE4m+ARl5ywKXlFE/5JW5nqt92aWVRb9vrlc8iQMJclFd4+rVWhXolHKVtLi3vSdQ7SHNNwAqXx/NS1gCNVJr6SGdLSdLo+gVQUdUz4emfpm3pRPEe4O1BYD7sTNNM7FbwAkEsQXwe7GOKayQZXSEszqISl5UiKCQTgjjrFeOSkFXLDDsmN9ZJx+Nm2H1vx5uN9RZZ7BqGEPE2jkpNdrM8zdv5m3elrdwioEWGhVRxfCAQMoqD9nSDA8x+SKRMNUf5pJFHb66DC+7DkLDjbGyEro/r30Vl+phw3KElPeHMxRp96ykqV9LtBkoHeSDnMz+TfWdudQoGuhKTJ7y4m1+7+C8Da7buRPRxotWcyG1A6TVwIdjcN9TVvNW0OW9bRAMAJfXDxFosMhY6psEV6N3ahOq5hLG7h0GXnR2JwcYqZDaS67uHXkTx5oVjrK5i6UrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(86362001)(26005)(110136005)(6666004)(478600001)(5660300002)(54906003)(16576012)(4326008)(53546011)(36756003)(6486002)(16526019)(66476007)(66556008)(31696002)(2616005)(956004)(83380400001)(186003)(8936002)(8676002)(66946007)(316002)(2906002)(38100700002)(31686004)(156664002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFl2QlFCYnF1NXZTZDFja0Y4Qk5odmdkQlB6OHZ4dHRnSXY5YU5teEtCVDdB?=
 =?utf-8?B?QUU1Y0o5M0puK2JpZjltV1lwRUF1bDljRUZWeGFoeFpsL2owcldTYVQzVVN4?=
 =?utf-8?B?bnYwZzVmeXM2c1kvVElZZnVSeHlqbVlmd1RmbGVKTzVmVVFIVkFHSER1S01O?=
 =?utf-8?B?UllQcmU5K3VLT1JBR1V1ek50bW4ralU3YUlVWFNLekJ4SEZHUFJKUWdHQWRt?=
 =?utf-8?B?bmdkblBSWit4OGwzaFg1MUpNaURuTXdiZWVNY2VNNHQwa2V4cnBFRkkrTTdL?=
 =?utf-8?B?ZithMHlwNXZTVUFuaEhUTS9Cc0NXVUdaZElpSGR3VityRHl0WDZFa1JzbUh5?=
 =?utf-8?B?TnEzK0JTNThjeWlNMG5tL0VsV1RaQll2ZjdxMjkrRHBEc0EzdVNEQmxXSmI4?=
 =?utf-8?B?T2ZEeW1rYVdlaFdKMnJUaHdPUGxaRU05WjAvRGFEVWdraGRlYmRGZXdLdjY3?=
 =?utf-8?B?UWE1aTFlNmpCNGQ5ZTVoVHZBSXpESkt6R091UlR0bEZ1K2NpU3pmNGc4MU8y?=
 =?utf-8?B?aHFHVEg2MDNRZUJRRmVRcUZkRGJtLzhkSld4aEVueGoyRldOVXdRZ2dUNzl3?=
 =?utf-8?B?UWM1NGxNZjc0dDJCeEtWWkhhOGIvbnUvQkRFNStKWnQ1YldaSVRlcTd6WVRQ?=
 =?utf-8?B?RDB6Z2VpTTVDN05sTE1Ic1M2TWRXZE1LRTg4MDl0ZlRZNjRPdXErRG94clhS?=
 =?utf-8?B?eVNiaEhXTWVMdmcvcDBOb25JdFpPUzc0Zk1JSnVEK3FCeWVRZVNrTjNzMDNw?=
 =?utf-8?B?S1YwT2xSamlCNy9ibHBBZ2ltSkJvQU9nLzlPa3B2Y1lMaGlsNkF1NFdkR2t0?=
 =?utf-8?B?cThSR3pBdVR4RHliRWcydE1DWURHUU9xaTFlNGdrS2hHOEtpd0NUaGpOWlh1?=
 =?utf-8?B?dGZxRWlYUUZLWUV0eWtCRFkwQ0tSbUdXck5VL1RuQmEydjR6N3I1N0x5MVZU?=
 =?utf-8?B?UEo0MVVBK2NzUW4zc2h6OGZKQlBVVndMamdHWldmWGQ0dVZkUUsrd1U4WlR0?=
 =?utf-8?B?eG5yTkxyWTNQRG9YeVBwYVhzaDVtbUVTZW1vZ2pFL3pucitQYTY4aUNLTnda?=
 =?utf-8?B?MUtqM1lpTHYxYkRSckxuWWNreE9lK2FxTWN3cFlHU2QyWjFXbTVNaVFJVFVy?=
 =?utf-8?B?QXV4UHRYZ1lEUUhHeUk5T1Z6MmNCMmxIQ3JMT2ZMNU0rQmZwS1A4dEJqbUNx?=
 =?utf-8?B?V2tmWTlqUVpDZzR3UTZEdG9sV2R1bUFueW5oV3I2cUxDeENRSlk2clFTUUMx?=
 =?utf-8?B?NTdoUFFNNXcydWF3NkQrK1RPZFRmcDRLSWRybG94NkQ1OEFQNnNJaFE5U084?=
 =?utf-8?B?Y0k3aVozOW9LUDE5MlhSWDkrL0lnVXZTOGJhQXZiTWJTa2R6QjNCbVRlRW5H?=
 =?utf-8?B?ZEhCSjJzcnZDc2tBamhnVUU4TzY1a3BtM1FzVzd6emJJbWtudHA5ZTlINkpu?=
 =?utf-8?B?ZUhCRm9FN3hScmxxN1pMbTloVzFTcWRjK0JhaEd3WnUrNHUzVGFGYW5rekMv?=
 =?utf-8?B?cVJ4V1NmSVp6WjZFNTBjNXcvU2pmN2lPS3cwYVFFZ0E5Z3VqL3RnV3FHTlZp?=
 =?utf-8?B?RWJMbWd3UUZseWZrRnhkYk92bkViNXN0RVhScXBjWDg1M25wNzlxYndJNkJW?=
 =?utf-8?B?YlQrUEV3M3hqdFhpKzVaRHlrUjBOWXJNRnhlQU5sc1Vzd0V4NlJVUXBabjFR?=
 =?utf-8?B?MnRUZXZUNkVSREFScVl4VlhvTEdOS0J6ZytsSER5TU95UHd3UFBUNVg1elR3?=
 =?utf-8?Q?c8UpZ4G8FbdEDxcdVpWve/ZLz+OPQ7x6SJ8r1Kd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26955d91-e0cb-4a55-eb89-08d93259588c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 13:02:37.0033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 68h/f7YfwIkRDfateTqyWcKRnT474dr5GzfQnzOKWASjK5dHWmLosB/VMmQg3ogVfs6gHMilFyIZpItFhfayED1bdQvPAIS0QioQ8XD5dCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5423
X-OriginatorOrg: citrix.com

On 18/06/2021 11:23, Jan Beulich wrote:
> To be able to use them from, in particular, the tool stack, they need to
> be supported for all guest types. Note that xc_resource_op() already
> does, so would not work without this on PVH Dom0.

I'm not a fan of multicalls as a concept - they're mostly a layering
violation adding substantial complexity - and frankly, working around a
Linux kernel/user ABI error is a terrible reason to make this change.

But I won't object if it happens to be the least terrible option going.=C2=
=A0
I accept that there are no good options here.

> @@ -334,6 +336,39 @@ int hvm_hypercall(struct cpu_user_regs *
>      return curr->hcall_preempted ? HVM_HCALL_preempted : HVM_HCALL_compl=
eted;
>  }
> =20
> +enum mc_disposition hvm_do_multicall_call(struct mc_state *state)
> +{
> +    struct vcpu *curr =3D current;
> +    hypercall_fn_t *func =3D NULL;
> +
> +    if ( hvm_guest_x86_mode(curr) =3D=3D 8 )
> +    {
> +        struct multicall_entry *call =3D &state->call;
> +
> +        if ( call->op < ARRAY_SIZE(hvm_hypercall_table) )
> +            func =3D array_access_nospec(hvm_hypercall_table, call->op).=
native;
> +        if ( func )
> +            call->result =3D func(call->args[0], call->args[1], call->ar=
gs[2],
> +                                call->args[3], call->args[4], call->args=
[5]);
> +        else
> +            call->result =3D -ENOSYS;
> +    }
> +    else
> +    {
> +        struct compat_multicall_entry *call =3D &state->compat_call;
> +
> +        if ( call->op < ARRAY_SIZE(hvm_hypercall_table) )
> +            func =3D array_access_nospec(hvm_hypercall_table, call->op).=
compat;
> +        if ( func )
> +            call->result =3D func(call->args[0], call->args[1], call->ar=
gs[2],
> +                                call->args[3], call->args[4], call->args=
[5]);
> +        else
> +            call->result =3D -ENOSYS;
> +    }
> +
> +    return !hvm_get_cpl(curr) ? mc_continue : mc_preempt;

This is ported across from XSA-213, but even for PV guests, it was just
defence in depth IIRC for any cases we hadn't spotted, changing privilege.

There is no pagetable accounting in HVM guests to become confused by a
privilege change, and hvm_get_cpl() isn't totally free.=C2=A0 Any kernel
which puts VCPUOP_initialise in a multicall gets to keep all resulting
pieces.

I think this wants to be just "return mc_continue;"

If so, Begrudingly acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

~Andrew


