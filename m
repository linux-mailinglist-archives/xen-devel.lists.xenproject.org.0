Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBEB302BD6
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 20:44:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74446.133820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47ls-0006SR-Po; Mon, 25 Jan 2021 19:43:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74446.133820; Mon, 25 Jan 2021 19:43:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47ls-0006S5-Mg; Mon, 25 Jan 2021 19:43:32 +0000
Received: by outflank-mailman (input) for mailman id 74446;
 Mon, 25 Jan 2021 19:43:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F5Bc=G4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l47lr-0006S0-Ck
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 19:43:31 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e659f03-81d6-42e8-a8f5-b0c805841b6d;
 Mon, 25 Jan 2021 19:43:30 +0000 (UTC)
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
X-Inumbo-ID: 1e659f03-81d6-42e8-a8f5-b0c805841b6d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611603810;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=avKJF1P8TaGHNN9l65y+xR34Q9vv5r94J6+NUTHkorQ=;
  b=ANhAapW2EPPmNkVI9BfKuWzket+xbi9vc7JdCSe3CpcyvB02AIsib7hi
   qY8C2Xoprbj/zpFkq8/+jP/f0QeTd4pelV0RpR/q/96SN74mbxmlIR8c5
   SJX7K2tMBLNKBzbY1ONMFoe3B+/eKRwSupXfUmPzhZ31yEdWO4BcW5JhJ
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VajkDAUaewYTyg+VqwszBSoETiipO6aRRFQR5Vn/dkItExx29hDk05uG2hL63Isw9j/7FpMU41
 Bg+5youIHtmMSDP+9ogchwBwtP4UJqEXKo00sKQ9ZhBwwbVvKfKmOrNPK6vtxbpy6VrV4WG0Jk
 pA0kIn7Fm6EMv53BMYOKaf+/U63Z7EzgiRDrP9hNg+rwkwMI6EdKFVyABKE69J9wKJdSXVuArG
 IgvK12CC4EIoFGKBqDG/bXEf/iVgAUC4Xwcc4C0nGekQdjy++9KlZSELCcBq6ACDjOSvn0wHEL
 bQE=
X-SBRS: 5.2
X-MesageID: 35784683
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,374,1602561600"; 
   d="scan'208";a="35784683"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g6FvI7XOrjESBTZtoZFGtzS0xbO/bj8FFEKU05nI1FQSKkLRM26iI+eQupPTxEYTuNEWfv3ZlERJPdK9oUuOB+8zkTCmyNhoL+IREPxLzRyhkV5rFHQ8gE/sznJzihMP5LaqZb7CvdBVay2ZLLHAzX4GG36A1bLniz3OP7PQsEScppp5dBW6GW+5ZGVNsD+R+k8uHOPTIr7WZCLG2DjSuXpQOR7xelvigweuuUUdKH+ADY0Hm7m0XjGGj/HcC7QsEPDlzq5rIt9mrii5DTCuFs1fP9kyjUtBD5Q2WS5gASjAqGsHwmlQohNPpcRnMlqXBjxoEySTVSF+X2gvottpBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5w7IgYtWsjM3ac6WFn8IoSIdMtTgSz7Dxq3vKEcNnY=;
 b=Vms7CNk5icptSM8juOnuYVf/KTbk1T/u9ULZlL4ggI8+Gep6XuP0iL8C+dVcdzGDN2F6AT75xxrG8TM08nushW7eo967dVdfQJFLRX9mZ5LHeg18FXuvv5Jt/Dm+OQNeKyyRp5e/ZtZd4aWmbhoj5Cx5N895tWEX4prIAg0Df5tI+qUX8nX97WnJfAfqyg94/RT8cbxJj6DAw0DjNspKc2M8+mzVcYjU9BZTUyE6Fv0t6txUGRKibdvsLYwS2gB5Cuz85eMCl7WguNg16Vd+fEzgt4/g+76KiDDmEBtAFSd2wKzneE/exjPXJ1dOZXYwplGrCY/4kG90a7gj5rI69A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5w7IgYtWsjM3ac6WFn8IoSIdMtTgSz7Dxq3vKEcNnY=;
 b=CUu8Ck/ZrMFnLgAlW1lvZvcma+Mq2/9SjGolFuJKXHbfMrbUh4Sq6+bNJNHLb1Y3HWqiXJq9kgsU0GJuIkQqucMwkhXWZx+fzQtqVHr00z1SAVNTDkLaiSJ3MTsXCZEK2cQ04kNuYuk84aGHKijrCo3lOaCFcKGc29c2ACfpVEU=
Subject: Re: [PATCH v10 08/11] docs / tools: specify migration v4 to include
 DOMAIN_CONTEXT
To: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>
References: <20201008185735.29875-1-paul@xen.org>
 <20201008185735.29875-9-paul@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b860e928-6e42-5432-cc89-54c47531a5e7@citrix.com>
Date: Mon, 25 Jan 2021 19:43:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20201008185735.29875-9-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0063.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::14) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 193e8938-4e1d-4ba8-d047-08d8c1697be0
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5646:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB564696D3CF8A0760617FAB23BABD9@SJ0PR03MB5646.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UXCEwbMEYfr/8rfVWthFeF/EmsouXfa0oWxkt8lQQDgoYVNMNqULKPV7epnAuSLb6vfvOiWxpx7DZtmKrQJs1cplGOlTnvkcbUQbonYfRGapwN5kAaeAOxMJm0sxdxPyTQqcTGkQxUDU3Y3fKTClMm2ZPQzfku0ZAFN75La2yJLThWVXLUKj4zLmE5y5C43INt58/M8HYofE9k3P2Rk8Z7z1ihMCp9ZZgy8XtuLI4jzI+edyQOwNcPHPy52w2yvO7Z2NFKZYTyS5B+IEsDUVzl/1YotfSeyYVhcC9iCT5U2jSCFoQuZAOPDbVfECQUBuLkm7O9XbQegTBeyTY6W2qUcklsFTfDevxtIOGA9jcYKF7cSPu98tXUzvpl9mSgALSgzA2FPWqPZ2NeAc/zZODSfA7u6OIyzpEL+BtFDgrd8RZC+65uo9RsVGDSTbbRqLLvWC7vkKu1y0clX6AFofjNDqJI4w15tBcJK82wPjhOE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(39860400002)(396003)(376002)(2616005)(2906002)(6486002)(31686004)(316002)(186003)(31696002)(8676002)(478600001)(26005)(53546011)(16526019)(956004)(6666004)(36756003)(66946007)(66476007)(83380400001)(4326008)(66556008)(5660300002)(86362001)(8936002)(54906003)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c25DMWozR1l5ZnNiQUpSRWlFMXNBQTlGclhoS3VnWGdBZ2cweDNnMFlVQStS?=
 =?utf-8?B?TnNqeVBtVTNmcUZNKzhmbHVla0FiV3cxMTFXSHE0TkRHWG03SnpzWU5mYWth?=
 =?utf-8?B?VW4rZ0NGUXR6dGs0RHAxa0tDMU1LSHdqcTF5ZXhjKzN0My9YKzFWdjVZQjht?=
 =?utf-8?B?d2dqaDJpc25STHVybDhqUXRhbGtoYVpwVS9Kdzh4VkM5Z0o0K0crOTNwcVUy?=
 =?utf-8?B?OXJybUM0WEhFOUtVNnpPK2tFMDB5Zm1DVkZHVmZWaEUzN2E3UEZycW90Q05l?=
 =?utf-8?B?dkhrYkVsb0R0WTk2Y2dmVHNmbkp1amV5YkIzQjUrNkdMR1orRzRNL3Z4czJY?=
 =?utf-8?B?ZG1US3JCa0Y3QnBzZld0c2NpbkxxQjljWHhVVlhXYlRQcU5MaHN6aDY5TlZV?=
 =?utf-8?B?Yy81OUpNUEIyNy9CR25NZ0JHNVNqOGJYVFNJcloyT0tkZ0xXMldVQSt1cmxN?=
 =?utf-8?B?TnJQbVlLNnlMWUwwY0xuYmlzbUo0T0d2VHVrdGNiYm51ZkNzaXBPbGZPWnhJ?=
 =?utf-8?B?U25Cb2liN09JK3ZZaUVMVTM4d0Y0NUhkZUdCdWM3MzVUZlZ1VU4vQVg5aDlU?=
 =?utf-8?B?UkU3bVNadk43YTRkelRPZXZ0UFdxZDgrOUVnL3VPaUQxWkpocXZTZ2hLb0Ra?=
 =?utf-8?B?WVdQWHp0eDZvdVg2dnd1SHA1L1VWc1UzQTczQ3pNY2VWTWVsWlZWQmxSdTU0?=
 =?utf-8?B?bWZvbHRUY1ZwaVI3TDNkZFYrd0RPQ0VGZTh6WFhuR29KSXZVdnBWbmJEbkxq?=
 =?utf-8?B?OEh5QkM1bVdmMkxNZ2FETnIvdnErYk50d3lZTEk4cVZaQlJlUkJLYkJBS2Y1?=
 =?utf-8?B?OWp6ZzRFU3R4bTFYbTVTblliU3Y1QjBCQUpWTXhsUXltWnB5a3YydDJYUEYz?=
 =?utf-8?B?bkdCN0htZDd5TDgzTDVPTkhHV00xMUQ2QklsUTZCb2E1d3NFZyt5UDU2TFcr?=
 =?utf-8?B?c25aQURzaEFVVnk1cnFBc1VyT0pYdHJodFZ4R3BHVVREMm5ISGpEZk5uL3h6?=
 =?utf-8?B?QlhWRkE2OG8ycHd4UytoTUQ1ZHFYMDRGYjVreTJIZDFXWjNHRkUydjdiRVMr?=
 =?utf-8?B?dlVvQXFYM0xSNWVaaURYalVCKzhac3ZsOE1ZOUU3UTY3d1NVclJEZ3F3NTJH?=
 =?utf-8?B?cTE4SVNDYURCTXE3aE12NSt3cWRGbVFlL1hSbTZxcmdrYzgvdTFqRk1zQjMr?=
 =?utf-8?B?N1kvQUpVdWp4bmZHZzkrbG1QbTQ0bW9objEyNnRhOFBzQjZGV0g2cnAvQTJ5?=
 =?utf-8?B?NE95UiticWlaaWJmeUFQWU1jYytTemg1Y3MxT0JQZkk4ZE9OcGdRM1pYRDRv?=
 =?utf-8?B?TzlJUHhGZlVyRE0xS2hocnpVV3RZZGlHWUJkQTcrREZBVWxiR1d3NFJYZzB1?=
 =?utf-8?B?SmVtbFBNaG1DYW1wV21WaHJ0WlpEbUIvYld2QTQzcy9GTlBiU3BRc2NzdGhN?=
 =?utf-8?B?YThBcnowWFRENjFZUUNjaHpPNXptL0hVaFd5YytRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 193e8938-4e1d-4ba8-d047-08d8c1697be0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 19:43:26.9041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P51FVXuA8nl/wK007seqyDOBCSI2MO7joU0bp0+Hdkrjyj+64MQLQk3drYP2/gNX3cBJNTzzMTENxWsqUzQvfvD4ueBn0p4C3GtGK3/kgPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5646
X-OriginatorOrg: citrix.com

On 08/10/2020 19:57, Paul Durrant wrote:
> diff --git a/docs/specs/libxc-migration-stream.pandoc b/docs/specs/libxc-migration-stream.pandoc
> index 8aeab3b11b..aa6fe284f3 100644
> --- a/docs/specs/libxc-migration-stream.pandoc
> +++ b/docs/specs/libxc-migration-stream.pandoc
> @@ -127,7 +127,7 @@ marker      0xFFFFFFFFFFFFFFFF.
>  
>  id          0x58454E46 ("XENF" in ASCII).
>  
> -version     0x00000003.  The version of this specification.
> +version     0x00000004.  The version of this specification.
>  
>  options     bit 0: Endianness.  0 = little-endian, 1 = big-endian.
>  
> @@ -209,9 +209,9 @@ type         0x00000000: END
>  
>               0x00000006: X86_PV_VCPU_XSAVE
>  
> -             0x00000007: SHARED_INFO
> +             0x00000007: SHARED_INFO (deprecated)

"in v4" ?

> @@ -442,10 +444,11 @@ X86_PV_VCPU_MSRS             XEN_DOMCTL_{get,set}\_vcpu_msrs
>  
>  \clearpage
>  
> -SHARED_INFO
> ------------
> +SHARED_INFO (deprecated)
> +------------------------
>  
> -The content of the Shared Info page.
> +The content of the Shared Info page. This is incorporated into the
> +DOMAIN_CONTEXT record as of specification version 4.

This needs to be stricter.  A SHARED_INFO frame must not be present in a
v4 stream.

Absolutely nothing good can come from having the state twice.  Moreover, ...

>  
>       0     1     2     3     4     5     6     7 octet
>      +-------------------------------------------------+
> @@ -462,11 +465,12 @@ shared_info      Contents of the shared info page.  This record
>  
>  \clearpage
>  
> -X86_TSC_INFO
> -------------
> +X86_TSC_INFO (deprecated)
> +-------------------------
>  
>  Domain TSC information, as accessed by the
> -XEN_DOMCTL_{get,set}tscinfo hypercall sub-ops.
> +XEN_DOMCTL_{get,set}tscinfo hypercall sub-ops. This is incorporated into the
> +DOMAIN_CONTEXT record as of specification version 4.

... it is actively problematic for this one, as incarnation counts the
number of set_tsc_info() hypercalls.

~Andrew

