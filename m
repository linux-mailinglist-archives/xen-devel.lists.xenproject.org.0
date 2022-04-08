Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 150FC4F935F
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 12:55:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301374.514323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncmH7-0005fR-CK; Fri, 08 Apr 2022 10:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301374.514323; Fri, 08 Apr 2022 10:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncmH7-0005ct-7T; Fri, 08 Apr 2022 10:55:33 +0000
Received: by outflank-mailman (input) for mailman id 301374;
 Fri, 08 Apr 2022 10:55:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d3bc=US=citrix.com=prvs=090ff2996=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ncmH4-0005cW-Re
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 10:55:30 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 660eb0a6-b72a-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 12:55:28 +0200 (CEST)
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
X-Inumbo-ID: 660eb0a6-b72a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649415328;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=7wynkonSg8ayrlwGklHn10sleZpJHNxYCY2oWzcqqAs=;
  b=WDXSulMNJwFcdVaMaaBYRATpubuxsCJzaFOixzrxGYzHKIbIXbiRTqrr
   H4iBh9dIOO1sCB10oPzNdBypoyyhkOsDLr11YHpcdV9SrYXG4FVViqfJI
   39iBfiFYblvOw9/aPz5aQMvdTrB4v0I3IyO+htDrv8OLo9FbCtgWKxYrp
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68355068
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1GFykKjtnmJEBjgxyX9ut1HFX161ehAKZh0ujC45NGQN5FlHY01je
 htvWzyHP6uIMGHzKdlzaoi+/E4B7ZWAnNZhTldqpC0xEyMb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1vd4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YRVxZ7f0x7Reb0AbKwB+MYAc/YPjIkHq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiOP
 JdEMWQ/BPjGSxtoEUUNLJM3peepjGKlIi9gpUCfvqVitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRGhgHMPSPxDzD9Wij7sfNly7mXIMZFJWj6+VnxlaUwwQ7GBAQEFe2v/S9okq/QM5Eb
 VwZ/DI0qqo//1DtScPyNyBUu1bd4ERaAYAJVbRntkfdkcI4/jp1GEAWFmdbUIN29/NvBgQL1
 lOkxdbVIT9W5ej9pW2myp+Yqja7OC4wJGAEZDMZQQZt3+QPsL3fnTqUEI89TffdYsndXGipn
 mvU9HRWa6A715Zj6kmtwbzQb9tATLDtRxV92AjYV3nNAuhRNN/8PNzABbQ2AJ99wGelorup4
 SBsdyu2trlm4XSxeMqlGrhl8FaBvavtDdEkqQQzd6TNDhz0k5JZQahe4StlOGBiOdsedDnib
 Sf74F0NtcUDYSb6MvAuOupd7vjGK4C6SLwJsdiOMLJzjmVZLlfbrEmCm2bOt4wSrKTcuf5mY
 srKGSpdJX0bFb5m3FKLqxQ1itcWKtQF7TqLH/jTlk3/uZLHPSL9YepVYTOmM7FihIvZ8Vq9z
 jqqH5bTo/mpeLalOXe/HE96BQ1iEEXX8riq85cHKbPZelMO9aNII6a5/I7NsrdNxsx9vuzJ4
 mu8Sglfzl/+jmfAMgKEdjZob7aHYHq1hStT0fAEVbpw50UeXA==
IronPort-HdrOrdr: A9a23:YpTOMaw/a686HeoPCr3HKrPwIr1zdoMgy1knxilNoH1uHvBw8v
 rEoB1173DJYVoqNk3I++rhBEDwexLhHPdOiOF6UItKNzOW21dAQrsSiLfK8nnNHDD/6/4Y9Y
 oISdkbNDQoNykZsfrH
X-IronPort-AV: E=Sophos;i="5.90,244,1643691600"; 
   d="scan'208";a="68355068"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFEy1xJU4Pw1e1RN+UoMsCX3xUMab1qqy8jqj8+Sgx3gIqsmnKm2CY8vmGTZhGB71w+ocQ8fz5z0dIogccbOqw7KsIjq55dzBcY2/Nr4AEWcXP6phvunJqUzN4bfC3zyXsfFEc0bkYLCegZBg4NUpxCCvj+cBqjUeQynQthBWhi8n3jnYbVgceZoWEGAsPGfOLac+3nteVqNJNIFlOVCjmLXdHMKt1bdCDEluWgRGm2oM8tQ7F1fLtDSwAvbrlRGHNtri7DzNbL2YCJzhpXmraDLTglG2wqityYhNObL26z78bXf10YNqdAhSvxKLguSL4fnZ3yan3bpy7ySr9YssQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPIji40V/ZjD/odqpInMrAyzokkt4ybmnCbHG3Pc8vI=;
 b=lA6XuJkZbptCTch7+SWzsLbDqirUc3mlU9aVMbCOjSYkFlachnX8fOxQ6kE2DGy/dgbmufKaCknpDLJrOHjDdQunz5lo0i2IV8ZD8Sdhlm1AHyG80msij56qMq+ah5xLii7R/7+KJnLpLf6WRmrGMwq0U9YhSVj5isjwEIdaX0K5fvOLDGDI4M305nczFimVBMA/GycNESTAlXQwKcyUPPgNJevb20MZvfeC02YQKbxf9NHUrUWlZNRBPNpdW32oRDIABDUBCQczGGACky8QtQlQVhDCEmIsX2f2J7cgaRGEY3Ku2Xg5P7jcdyOQ/E/T5STeD0z44LuuXw/zpxITrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPIji40V/ZjD/odqpInMrAyzokkt4ybmnCbHG3Pc8vI=;
 b=EOhKzJw/WMT8vLAMCB1a2KLMXXGqrvgfBUCxPoEkkz85GR6jkp8SxOk4mU54QrNOLIcT1XygKfkJwHLxtnJwO4f1uif8hh91+hWBN0R5n1edrU9WBy1t6zInuNVtApCkJJmilgSKKWNDOXY18XgUDiZwecjrZgqUz5KFWtsVOWY=
Date: Fri, 8 Apr 2022 12:55:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 04/14] x86/mm: split set_identity_p2m_entry() into PV
 and HVM parts
Message-ID: <YlAUloDvk20Y01tn@Air-de-Roger>
References: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
 <69623630-cda7-9b2b-4f2f-09a83d5dc22a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69623630-cda7-9b2b-4f2f-09a83d5dc22a@suse.com>
X-ClientProxiedBy: LO4P123CA0304.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 942066b4-5c89-4333-94f3-08da194e47aa
X-MS-TrafficTypeDiagnostic: CH2PR03MB5157:EE_
X-Microsoft-Antispam-PRVS: <CH2PR03MB51577BAAE283F1F1848E3A3A8FE99@CH2PR03MB5157.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3CUR7PiydanLkdn7OXWiLbGD2nkiw7ZgYLSRZMv4n9C0I8nogHZeTzAyHZePrfGgxNCNqXizl3bGOMbMeWpFSsG6XmJAIylff14YrR/gwx2gq0bMc/8aRJBzF+dw8zdSkfAUgBW/F+RO15vbhijGdwpp1f1RrpplPzAeolNvC3jGMGzcNLnnBobFHxxGcdnxXC2BTj+MxSk8RDzA3PVYCp07u7oUpxiU1DO7wX1YnA9R4/GJXHh8nMEneCFYAoqTn2jupIvp+9Prd3wfqLrqNv/8c2cM++bJ6DY3kfnTVyX22Uz6OGa5jlmNxLijhCK6NDGUpnAk2INW777/tMtC7gGWzBByU2yOT56KEAlEnmPkmXu4bOFZ0op4N4yCUWtMItZzzYD8QqruU6oUW6npDZOHHMxJKKEzBLRPp+hgBmdtRQVEUAUbkB+JaIkS+BaJtcL7xUd1O7XDRg+qf9TgJ4W8MHG7sB+5Ch9qZ8MoMrDnBpMGS/AxNmVD0cFAKAVAXy+BwkEgOqcUarXXazvDN681F2WGicf/dCU+AcEnDmJSmIVM9KL1m/xrcO/qbymkUGZXdXhr4V2lHBLXNSYKxIisyaywi0HUkQInutw8SaTKcKUgAr7AZ+ZdHZH1MuQ9mtasP09RLNBMPRUfOLoIxEpG13pzwWC05rZTA/Uzays9xheplljHQdX9VmRwb3AOgR82A5QIvKi4LrKnC+tRIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(508600001)(8936002)(82960400001)(6916009)(5660300002)(4326008)(8676002)(38100700002)(54906003)(33716001)(316002)(6666004)(86362001)(2906002)(85182001)(66946007)(66476007)(9686003)(6512007)(66556008)(26005)(186003)(6486002)(6506007)(70780200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkNxNVZpT296WWJyaGFCbXRpYnhLRE90WW1VK1lLaUN2NUc5UVVCNHZpTEJH?=
 =?utf-8?B?bXY1dHVvTGJYZ04wanJYVEtPK054MTRUdEJ3eHhBek1aQ1NlSEI2cmtlelNT?=
 =?utf-8?B?RHBsZThENzRaR0RZL2Nyd0t6OWQ4ZEQ3ZUdqdXNyR04zNWw3SSsyTEE3U1h4?=
 =?utf-8?B?aHdxdC9nc1FiNVZHc0xGbEtFcHNiSi9jMWYvZ3cvV0FoZFFXcFpuZ1p6NjFG?=
 =?utf-8?B?Vy8zR09Gcm5kZHhVNHpvbHpvWG82ZzZLcUVFdmhrQlU4V0F0b3pQU2s4NGk0?=
 =?utf-8?B?RzVuUlpDQXpkY3dXS3BjOUhQRDlPTVRZc2g3aFVnN29rN01xM3IrZkdzOVhL?=
 =?utf-8?B?YVg0MWFZeEdXemZJcStnd3dqdk9vbEY5SnlBWWVoL0w0REM3RzNMRnA0VHdZ?=
 =?utf-8?B?RENXNmxlcm04Q2R3U2kvR2twSG9kSzdiank1TmVEaVRCV1lFV0VEbGNqSjVa?=
 =?utf-8?B?T3BPQzc3WVRoaUt5VVV5TkExd2JQOHpKQWk0QVpZYXptNllHK2tEeWdVS1Nx?=
 =?utf-8?B?UmYvRUxBZ2ZZOVhHb2wvVzMxWlh2UmlJRCs1SDhrNFBMTzRqT3RnRFJBZVNN?=
 =?utf-8?B?UjN1eTBUZlgwdGVYWWgzZTNjbDJkaDAxN1lVRkIxM0Z4ek1UQlFJS2tlSDZP?=
 =?utf-8?B?bndzbVJJMCtKMDRMS0E5aUNZMjZiM2JQNk1QdHNySUE4dDZHMldOS0RYMDNF?=
 =?utf-8?B?UklSM3hPeWU3VnhrUiswNWNzVFhYYmNGcHRJQU1CSVdhMWQ1eU5BVmlTY0Vi?=
 =?utf-8?B?a0w2b2ZscGtvSFRTWE81bzB0eUl5S3E2cXBhQ254ZU0wd3F3cC9tR1BXRXM3?=
 =?utf-8?B?S0FPKy9Pc3FVRlRCYkdEVWp4elF6K2tTemYvU05leGR3Z1VVUkVuUjlialdm?=
 =?utf-8?B?R1N0TDR0NHpSUFFsSUptR0toeGNjK0xJV05qYXRBOEUvdUZKalB4RW16YTNI?=
 =?utf-8?B?aUtQRnJibjRLV2F1MklTNlA1UittcDBrejZ3bjNqQXBoakM3Y2g1ek9nM3c3?=
 =?utf-8?B?YUlzdWNFNm9GQldDK1dYUmZiK21ZelhhRTM5aXZRemVraENEYXI0Q0sxZEV0?=
 =?utf-8?B?SUh2YWxTVE95Ymp0UUdKRGxDQlc4UVZEMThtelo4TTFTaTBjOExIZDNRdzN4?=
 =?utf-8?B?T1d6NmxOQnB4N092YTEwdzJpMEQybGR1RWtlbVpGczlpWjMxSlJEeGlKMjhF?=
 =?utf-8?B?S2hIcy9Ea1VFY3A0K2Zvb3dYUENFNDNYSGIrTWVZeTZ1NUkxa25MQXZBZHRy?=
 =?utf-8?B?UGlYQlJTWW1Cc2hSaDkrS2ZYNkZOZEtIelpwdmYwUE1kYXpiK0lVbmg2V2xr?=
 =?utf-8?B?cm9JODA5Ri8vZVRHQzhBZWN0TlJDMTR2RE4xZHExUnp5Y2FibExPejhlcUFo?=
 =?utf-8?B?MENCNVYyckNEV3dDR3J3NURNYThEOEpzaUVaNERJYmJ5S1VpMlBOc0lyUGc2?=
 =?utf-8?B?bGloTE96b1BXTzRtQ3N3Rmp0aUtXbzR5VzJZRisxa0J4YlpRTFNxb2xFQk9w?=
 =?utf-8?B?UVpvQlE2dmVIb3ppYWJRUHZoamhlS2E4dUVQcXBXL0ltYmR4MWVSS1VhQ1hP?=
 =?utf-8?B?YTNobjd0cEFNcHVqSzE5WmtuOVRxcXZxb2JHTHo2RUxqeS9vUjJMV2hERmw3?=
 =?utf-8?B?VUlqNDlxckxiSmxJaHBjVThLTkUwMDVSaTF3UGM2ZUZjZTUwVlBoMzlTVkV6?=
 =?utf-8?B?cUtDMlhGSTZtSERINUVDMWNVc3dkZDZGNjEvb3BkSTB1LzZkdWE3NjEyczJo?=
 =?utf-8?B?NG5vc2lEMGlSSmVZWjEwYklWWmFNZnhlTU5ybjRSbktNNS8rb2xyaG5QVGFz?=
 =?utf-8?B?WjkyaXJ3WTM3VE9TTnlXNmUzL016UUh3aFFZcW1zbnhuWlFnQ0ZUWDhVaUhO?=
 =?utf-8?B?SDd6VFFzQXJOUTUzdzV1OWRMV0FTU2dScjA3S2o4S0lrOFl6K212bVREdG9R?=
 =?utf-8?B?RXVMbzhqWUVPdW1oTm1MZS9VclZsRjhmN2hTZGUzRElIQm43dXpJM3BObHkz?=
 =?utf-8?B?ejk1L25qUjJpem9YbGVlSmw3STBJUUJPcmdlZHBzQWVlZ0VWV2lTZ0xsZ2tq?=
 =?utf-8?B?SWZPWGI3UmN4QjhYc1E5aHdncGllbk1yZzAzbklnSW9pb3plbjN5cUlhSlhJ?=
 =?utf-8?B?djY1NldYUlZLejhuN2NRMHJWUXo4WEd4TDFCTzdJU1huWEFMSzAxWG4xM0tR?=
 =?utf-8?B?d3hudklQRFhyK3pJazIydWNhaTVUcnN6VkxHWVNwK2NlNnBwZktKc1RPSWl6?=
 =?utf-8?B?VUE0WjBLbTVxVmFjVmU5ZU96eGtSeUphNGROSi8wRjlDZWNmUTVRTWxoaU9O?=
 =?utf-8?B?K3dYcWdYaGZGOS8zZXZvaGVWdzJjYkdPa3VsdDNCOGFWYk9YSENKZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 942066b4-5c89-4333-94f3-08da194e47aa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 10:55:22.9038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XJsQlciUusKB8gDK7wplpr9t3K6myX5EPavstKRwjSLG7eh4ZV/Enx3fMziy9VshhkPoDtKr9scb4iIIESCFjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5157
X-OriginatorOrg: citrix.com

On Wed, Feb 23, 2022 at 04:59:42PM +0100, Jan Beulich wrote:
> ..., moving the former into the new physmap.c. Also call the new
> functions directly from arch_iommu_hwdom_init() and
> vpci_make_msix_hole(), as the PV/HVM split is explicit there.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: George Dunlap <george.dunlap@ctirix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Just one comment below, which can also be taken care in a followup
patch if you agree.

> ---
> v2: Change arch_iommu_hwdom_init() and vpci_make_msix_hole().
> 
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -1473,12 +1473,9 @@ static int clear_mmio_p2m_entry(struct d
>      return rc;
>  }
>  
> -#endif /* CONFIG_HVM */
> -
> -int set_identity_p2m_entry(struct domain *d, unsigned long gfn_l,
> +int p2m_add_identity_entry(struct domain *d, unsigned long gfn_l,

I guess switching the gfn_l parameter to be gfn_t gfn, and then
defining:

unsigned long gfn_l = gfn_x(gfn);

Was too much churn?

(this is just so that the exposed interface for p2m_add_identity_entry
is cleaner).

Thanks, Roger.

