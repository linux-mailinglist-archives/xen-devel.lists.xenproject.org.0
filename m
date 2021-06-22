Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 075333B0DAE
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 21:36:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146067.268700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvmBI-0005VL-H0; Tue, 22 Jun 2021 19:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146067.268700; Tue, 22 Jun 2021 19:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvmBI-0005T1-Dz; Tue, 22 Jun 2021 19:35:32 +0000
Received: by outflank-mailman (input) for mailman id 146067;
 Tue, 22 Jun 2021 19:35:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZL//=LQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lvmBH-0005Sv-85
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 19:35:31 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bdaeebac-cc0c-4144-9ecd-3d2f657fa5cc;
 Tue, 22 Jun 2021 19:35:29 +0000 (UTC)
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
X-Inumbo-ID: bdaeebac-cc0c-4144-9ecd-3d2f657fa5cc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624390528;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UxgAPpj3Bju409mglp5pUiFnbpcpj17y4j6EuXBk8ZY=;
  b=JR2KOG/bJWqC0I+rCixfl1XId5lNEWcm/wjBbTfQhRT80Hjk4qLW+n8U
   0nQF/g85gU/9XMIzaopZMc8nw+16wVPjDlUAtm46NwI4psoq+Stx6KmxN
   lFPi49896RXKodMe375ic2oJsVinTkct1h6YbnfwMqnV+PSD9O7Zb8tVl
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: snSCV/BtX0JFjoKmblLr2umn3XiSiFDmCjovm2Hcv+gCgcWbhgdJjRuz+u76NEWq+LDEecnBI1
 arFCyTuBHNDXbcRxZ+6Uu6LZho7dqgQhK3Y/OXX6atoiQID+WYv9COvV+2l5GhomKrg62EGnLH
 ofUyQ5fDogDg+kAzyYn7SD8k2FSBqal22BXWhJ06IxNJgElM16xlZIZt5H29m/F1FMJuna8cQF
 iqkfY0B+l6RQoHBMB+vdYam0FARL8ofC8ZYXYI8Jk61EzYwTrPEujWQFNwK9+jZzP56GHkVU/g
 3ZE=
X-SBRS: 5.1
X-MesageID: 46787766
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:LpnRLqiY9iI54JcxnInN8GdxRXBQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-IronPort-AV: E=Sophos;i="5.83,292,1616472000"; 
   d="scan'208";a="46787766"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VRuDmQGGiwolNgS1tvThDaMYzM4IFz/J4uhkRR1tgfJ962O4FDnQH3LYww7PPh/R9tCxK2MYRuyUycqMEnWHm91ZL9HHaCnL4ZYZMHRZ6XxGl3RfguOGUjCml025ua4vzGK9BsWj9jxAeqnrJGU1tbPK/7oxVSdJQl4zabZArwadof+rp3g3Ri+ZuI+ER84LffIqzvXolKyCReePbyAWFmGRBtSlLp6e0Ccd54g1DliN9hEsCpCFOHP5PwyxafgaB6mbvQbm4Ut6GjjG8RtdxRie/txotOXwCh+WhvbPqqCTWNm9DbS/oXpYMzyuesngfIIzmVj15GRgjNp6mbP7iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxgAPpj3Bju409mglp5pUiFnbpcpj17y4j6EuXBk8ZY=;
 b=JTRc/y6qnzTZ6p/KRfxXVYot6UQ9VjuwPpM06/zXjfz5e2w/bhCGp8+nNdQYyke3l4uXLMJTwuGiIWjYns1h02VcmBSt1+6wmz2O26QxRJ0XjbTRcUFIum1YJ+fuHXgdhd/09HyaV5lsNkpNuas/9e8LIhFcexdoH2GpFvZzcvXvlWLH3uAl8fRQRT7ZwIdxuZij/0bxZWET8VVn7pqBCQjSMpRJYa5c9MQhQWFkxUzJzgEKZL+0DVG4ReHSywQmpynHV9/2C32EuepKSWPUB9om0KJsdluIUNoUK7fk+zZKplBAjCMD4eRzAeow7FLdLVk+jc0lGffJn4VAnPC9GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxgAPpj3Bju409mglp5pUiFnbpcpj17y4j6EuXBk8ZY=;
 b=vrNUiKzS6fJJuQY9rOmxgIAFWwYBRNvYwKewDihH/McaDTR7ZaDA7w2jCtXGa3jzI85dMXYDxhbIxLDFfdm4CVUDc9MB4vgspxvileS1fERRux5zFXEeD6+iAz+hWdb5XhpWDVvw1Z0ZajnUZUsyeWagXgdeYt9YSh+q+AOAqEU=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Juergen Gross
	<jgross@suse.com>
References: <6c532607-c2a3-d0ab-e4e5-428f85f4a045@suse.com>
 <f56ceeaf-745b-9064-e6c1-83bdb0d04360@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 4/6] libxc: use multicall for memory-op on Linux (and
 Solaris)
Message-ID: <215dccb1-602b-20dd-2298-84ce11a797b7@citrix.com>
Date: Tue, 22 Jun 2021 20:35:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <f56ceeaf-745b-9064-e6c1-83bdb0d04360@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0497.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44ad89ca-4f6a-4612-75f6-08d935b4e1d4
X-MS-TrafficTypeDiagnostic: BYAPR03MB3670:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB367009E138CE661DA1C7DDB1BA099@BYAPR03MB3670.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gVvC9gT65ZdHUvSnTWxKXLnMhYHlcVZDl///rtKy4PMGm+aiaeHirRQTEr4PCjL9u69aCx2d9jwAlDGowYVzH14KubiIb5qDLTrUUlPa/B4drP+/Q/qQmnsig30RvrqX287FqR7vRwpD3ZrNSzbj84DGW5OCZYz4MLWrZ93mEJfmHgHQcFuzx/VL5lHi3pFj51oBz/zCwBCajS9X66HKkEoOgaIvhiN8W5u4ejrxGGTbulFn1BTqDetduJUbanuHOlPEmYckWfHRXMfIKrUrd5ZmZHZ4VAdqrbDyixWxMoBThvZWX7sRZ1osSQEJqvUFgwA5oPSa5rVTvkx6Cm277LCtP/DIsNILvh0mMU3XM0Ed4TFjRbm6feZw121IlxYBO3xzGr2LFnj+l4YAchVzF1vtvDVwjrj24IY41gB9c2vvlLLIu33UR738Y7gsTaVNFGoNq810mJXM5XHFOUXegCPtWCCcSPV+EPUpsfV6Lop4oU138YOJC/e6lgQItWd+tDdTRGujUR4x4c6npCMg/8VZTIiCMcMegPNk9YcFejvhsvCqWhKjRqf8E+Ej8L4HnH1bZnOmQSZ/OBxPWsudF8fXqNCKYH1kKsfpMadPistf7cNsioe1Oy4NzXMvXyp69J+H1/wcdv4Mi+Lbsg63kh+0+ZqSXLjDWt0uP8bt2TuVvJhEG+ZTPla6VEgcPfbT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(5660300002)(86362001)(110136005)(316002)(31696002)(478600001)(54906003)(186003)(16526019)(53546011)(26005)(16576012)(2616005)(66556008)(66476007)(4326008)(956004)(2906002)(36756003)(66946007)(8936002)(38100700002)(31686004)(8676002)(6666004)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UC9HMVdjanpWbFJxNFA5K3I3M0FZVS9pVWVZK3NGMDNqdDFxZk10VUtoQ2ZB?=
 =?utf-8?B?ekJKaDB1VzdUVXRCNW5vRG1uTE1JdmhlS29QVzM2dUdmQVBDTXpPOHhIWEVK?=
 =?utf-8?B?cFpDRTA2eDlBSWlXRmpmNzA4UUh1YjJURFdkd1lyaS9VcW5QdnJWbjdjUXpK?=
 =?utf-8?B?MXh6UmYzTDk4VnN5Um12ZzNOdnVqSXBqWk5KbTQ1eWJSVHZIZmF2QnJIWWZq?=
 =?utf-8?B?K2dRL0FCdFdGWUhDbDNZMkY0ZnFRMm02VW1uM1RpNXVXWWV0Unl2ZlkvT2xO?=
 =?utf-8?B?QyszZS9KWDVQbU5ocUxxb2dwQnI5U0ZpU2tRRTFPMldRb05vbjNudzFhSW80?=
 =?utf-8?B?ZmRBd04yZTZXY2N1cDE1cjFwTm5CSnhPNEdGMlNOSkxCRWtucFJ6ZTRXZkhM?=
 =?utf-8?B?QkVLZ25TOXB6Q3Nid1pNbWFVUUxMRDN3TUdKWjdCM2Q0NkNZdDc5NStxRHly?=
 =?utf-8?B?UXhTQWhsejVVZXBvR3NkZHExdjF1OXE0TFF6MVZmY2xEN2dlSDFMUzFwa2Iv?=
 =?utf-8?B?R1hMZ1dLa0VTQXREWWhVeU56SnV2MEpya2FCR2dXcjhWNG5Bc1BWYjBWT2VW?=
 =?utf-8?B?S0lTZm5vOWdvK0NaQzlmdDdrOTlQdHNHMXJOK1E3SnpQT1VuTFhRVmpieHRw?=
 =?utf-8?B?a3dkUXdLaHgybXdLVHJBUWtEUk43NmxnaFlwbE9qWTZRYkJVbU5WVHlwMEhK?=
 =?utf-8?B?bGRNMVk2ZjIvQW4rTzJJREtGd3R5dHl4M3lGWXNUVmI2aUtOdEh6ZjQ0MDgv?=
 =?utf-8?B?OVRHUWRCOXd2WG42ZzRxNkZkVlNOMjlvWlBjNDZpdjlYR0hDdWJSYmJlNE9L?=
 =?utf-8?B?cEJOeW9lNGRLVnJLNE9hYmNmeHpZekxSVXE3NTRUNHZOLzRaSGRteld4cHV6?=
 =?utf-8?B?N1R6OFBzWThWUWJaeW4xenI2U0syVmFDZXBIRU41WSs4RkNVem80RHh3cGU3?=
 =?utf-8?B?UkFvRGxQR24rQWJJVFk3MTZ5ODdaOFVrSlorV0d0RjVUYk9IRW5NTXFQeWhr?=
 =?utf-8?B?Q1JqN2ducnFyZmR3OVIvb25UQndHVG1jSmZFQ2lTemNKRCtIdVF4T0IwNndI?=
 =?utf-8?B?eFArQnMrS2diZjlKWjNpbkxKbTNKRFRYUlB4OHBxenRBSWlidElYcHhVUC9I?=
 =?utf-8?B?ZkJDVVk1M1hZSDlVaHlFS3lwOUI4REErV3N2Um9tbG1mSnc4dnBzWlBZYWVN?=
 =?utf-8?B?SFRzQlZ6S0tURDFkNWt6eGVHVzJ6MEU5Qy9leFNIK2ZIUFBSbkFjYnV0UUZG?=
 =?utf-8?B?UEx2TUdobG53SlFtRFlTZHdnOWtGc2RkK1p2dTVGTWhxOURHZDFXVUljLzlB?=
 =?utf-8?B?WEY1VC9uYUY4YkFHeWsrTHB1OFZxNXB0Q2Y1VElQYzdyZzc1ZUNRYVpqclQx?=
 =?utf-8?B?UnR4OXNiWHJERHVPMU5iT1NBd2NhRXJlZUVJeUxwMjJiWlZPTjhJRXp4ZTd0?=
 =?utf-8?B?MnhzM0hqUjVxRTRXbnpaRTlmcGlFNnk1cmVva2ozVk5hTktNSFo0N01NNW5T?=
 =?utf-8?B?MlFldkZmaElmU24rRHY3UVVrNysrak1vN0hrN083c3JQeGl0MlJrdzhrcGJU?=
 =?utf-8?B?QlhvRUl2SDMydUNTVm1reGU5RktFU0pEZ3NRSHNOd0xDVzhHeXlyMXdqNzIy?=
 =?utf-8?B?c3pxcWZYak55d213ZjNRL2NnRmYyVnV1ZjZXY2t1WWZGUndVekhqNUVTcUh6?=
 =?utf-8?B?WCtiSlE2MzVWenVnRVlCRGM3d0tBd2NaWk9tTmhGSitBVUhxSEhaV3FRV2oy?=
 =?utf-8?Q?A0dkqebPpj6jiwPOn6Lo/zdA6nny5mrXgAYRFEs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ad89ca-4f6a-4612-75f6-08d935b4e1d4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 19:35:25.1806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c5mN59aBmZZpuCYtGnHLVAxGsC1Rm/UiyRFKS1l4CHxSUMTT7ND9+sNGhDHbg87DddLyM/Y6PnQhkSgvFCiN2sEiTwX1mYLIZ/IdNRc4Y+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3670
X-OriginatorOrg: citrix.com

On 22/06/2021 16:19, Jan Beulich wrote:
> Some sub-functions, XENMEM_maximum_gpfn and XENMEM_maximum_ram_page in
> particular, can return values requiring more than 31 bits to represent.
> Hence we cannot issue the hypercall directly when the return value of
> ioctl() is used to propagate this value (note that this is not the case
> for the BSDs, and MiniOS already wraps all hypercalls in a multicall).

It took me 3 readings to realise you weren't saying that BSDs used
multicall (which they don't).

Instead, I'd suggest rewording it.

"Some sub-functions, XENMEM_maximum_gpfn and XENMEM_maximum_ram_page in
particular, can return values requiring more than 31 bits to represent.

The BSDs deliberately avoid using the ioctl() return value, and MiniOS
already uses a multicall.=C2=A0 They aren't affected.

Linux and Solaris however do use the ioctl() return value, which must be
avoided in this case to avoid truncation."

Or something similar.

With a suitable improvement along these lines, Acked-by: Andrew Cooper
<andrew.cooper3@citrix.com>


