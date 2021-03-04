Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC0332D13C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 11:57:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93151.175809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHlfH-000088-KH; Thu, 04 Mar 2021 10:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93151.175809; Thu, 04 Mar 2021 10:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHlfH-00007j-GZ; Thu, 04 Mar 2021 10:57:07 +0000
Received: by outflank-mailman (input) for mailman id 93151;
 Thu, 04 Mar 2021 10:57:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zd52=IC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lHlfF-00007e-0a
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 10:57:05 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02ebc281-e0fe-47bc-b891-c7a2873f4d64;
 Thu, 04 Mar 2021 10:57:03 +0000 (UTC)
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
X-Inumbo-ID: 02ebc281-e0fe-47bc-b891-c7a2873f4d64
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614855423;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=sBsmYgSrTxn2Q6M+cNiQJzrBURlwWGMyXNHpBNFF8Yw=;
  b=KjoNFUPU4Kk6heDIykcOTWNVBR5wlyOVxZA9hCO2+VyuoyxS16wKU7dv
   RAfiBKEMNSWsNST32xjCKcT6e0xJuE1z1zHmuRQ8G2iiXob8FZcFscYNd
   A1cJ/+BxLsgLjjuJ9lEqM7GTAuRQ8WEntJ/oqPej5c9wkVYPeTG2BCtTv
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0ceMOUWtGyCb5D/IbUVr4gYcx2HGfeO2450FEidOk2dwlife9s4axOEwKSFgVq4LNEkc2qO9aj
 AtyQsv60PYjSoh2PRcUyuGKrddBoU6UpSgaLPvo+AgZ5uhy/3mI2CI8o1X9KmVa33HihyBAgoS
 5yqX1RVh0YdhAC0n29q9yCVVotceO1dkMXnD3BG+iigYSO0wqpLk5HIJpESa/S54lbMKBsIMQQ
 Om5N22gy1vFwgijywqSfK31rTIyEadvWYKE1V5wnCXO4U8Wk8nv8nHXBMeJoSX5mVS+/SgqKSH
 CuQ=
X-SBRS: 5.2
X-MesageID: 38533059
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,222,1610427600"; 
   d="scan'208";a="38533059"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSZ3ZABBApuoSYqArZrLrJUz515IBb6hk2363zoAwrY0K5EpXZOjefn5Vj7G/sPtAowsOaOvKC6XrEvMYGWPLoQaWWSFSruoWk+ZIBznYBLW5eAIRKRZXRFVWLh2PlGKaafGvmLttZ15tndvwJRPX4np/2ILw8rk+iTJByo2KQ1vSlSVSXcB7W464NfPM78NdR/EvQ2Yv3WLD3ILO7OyI0ede8o9QOF1AkxpXXhcBBYjm7bwIBiN137CnqkKtFRevtauwGbFy+Ymyz8BeELBjqJzrbbaTEZSZNONsbKoeI7PE1aeSaUJG/EWyE7+LOFMqfVfiO4wj+6BMwThoPraqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FpzA0SYDxh60NY7+SBP6DGL13PLo6Fn+q0ukRqOziFI=;
 b=SKAI3+XjDoz0RD5CgT6atVA/gXQXoCSMMOgtfi5RJJJcTLltLoUSBz/3m9iOQugGYXt6Dnt/LNQRpJCxLCx32v6/tYGgQe0LLKQ7yyfzLk8faMR7gBN1G/P0UfxwyVAev59M3y3eCbT1O2XohLB2EQI2NJSIEtPfLU1ezCDONSEls2P7Khcgy5eOh5M7x1L21lhcWttAkBAiy1LCYVaznZNd/O1aLodXWu23OHSOiawp68In4b/00qn6C5oeAo/Ok83n4Z0VSTaUKQkparKToXwjNuw7EdkyJkcjVRxvPtaxXrWvX+iXj6rI2Jgt/YlhzWKDVR3o+UG9M65kiUiFdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FpzA0SYDxh60NY7+SBP6DGL13PLo6Fn+q0ukRqOziFI=;
 b=NM4FUP07TiI0iOA8DMxSt5jCfb+GQL9eYwUIM852Bhuc0QtnCL9F0UastiJiWA0FjX6qz+WiUNn6+/uTgqjjSFYTD30myEvMrgRFex14sla7s2cW6vQr58p2nJxFDlEpSr03sPu1oT33ALfOBW0nPNRSLbhVLUJDnR/253CKsnE=
Date: Thu, 4 Mar 2021 11:56:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH for-4.15] xen/dmop: Fix XEN_DMOP_nr_vcpus to actually
 return data
Message-ID: <YEC85V+HVnOqCA8s@Air-de-Roger>
References: <20210304104805.27601-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210304104805.27601-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: PR3P195CA0029.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67f38662-40bd-4df0-b356-08d8defc3262
X-MS-TrafficTypeDiagnostic: DM6PR03MB4971:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4971B011013ECE27502BF3608F979@DM6PR03MB4971.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kuWyXy7JajhthSxMmpivi7Z4kzERGbtc/s7AZ8C6XuORjlPt3oUpaCGoJ77PXRPY56iWmvy5qzgJUAOUi7ep4lo+S0v4rAIEV6oTxhlq+IjZ94KjCwpYNKPiE+9Zej9+kfIrWtckYf0podsfxKh+XA/58ieCVqX2Rund0Q5wJbpLmjN5UGEEU8xtX+5L16KTiW+iM75OX78VttnJO2N9ar8T4GC0RpktH/vBXe0zLsEgpOri9m2CY+p1mRfgygH/f6W1PaINyxRysdlIoHOcxFQUP8C2QUoRPijA6HCkyxb3mGRzMmJRzt7fodWqotdI4JO6RSL8ULYitZMstW2uO49FqwdYN4o3ZoKMazUkRpdotSSRZVHq7O4OivVE5lrhoM1VEexzUMByTwV3OxalPfmStBFcbD0B7OONWKAaLMsNGqoa6YFE3nMlS7IfY5HQii4mNxNpDHfyb7u9iILEnLXWQQMXW/IfmkkBfQdG1/MUDTUb/1PkrE4ecZoptBnptfYr/tvEyJBjHs+/+ZH3PutGp8vBmx0e0iKb11teqFtiF14l8ulX9WPvQns7T30Z
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(6862004)(6486002)(54906003)(5660300002)(9686003)(956004)(4326008)(2906002)(6496006)(26005)(186003)(8676002)(478600001)(85182001)(8936002)(6636002)(86362001)(66556008)(6666004)(66946007)(316002)(16526019)(66476007)(33716001)(4744005)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VEp0U2lOakpZQk9ieS9sWkpBeVg2YWQ5YWVZU2dCUDlqSVdPaEhldVhvNGwy?=
 =?utf-8?B?MmpsaGNCbzF6ZGd3K2dCQWt4cDk2OG9hYklmTi8zcTVjVVpVQnFFSzFxOVZx?=
 =?utf-8?B?eGN6TmllWCtOeURiK1hoSjRDRWY4VkRSRStvc3ovYzNwRUgyelRzRlZjbzlq?=
 =?utf-8?B?T1piY01pWDF6TmwxL3BRT1ZGZXRvQkFiVG5TankwZTdMalk2NVlvOWFXS0Nh?=
 =?utf-8?B?WmFqKzZwSHdTQkxmSmpiZ3NpU3piL3RBSkNTQ2F1NE9VZG1nalg3VUF2THpI?=
 =?utf-8?B?czZIUjAvNUt4dWI4R0hmRFVTbTVoVDYvR3kvUmc2OTB5b2ZzaUUxVlRmNFFE?=
 =?utf-8?B?ZCtwQkh0MitHcHdqeHhHYnVQVkNhMTU1WklQVkVZbklncitoTW4wNXhWcTdB?=
 =?utf-8?B?c1Jyb0srUWZkdldWQTJIMXVkUks2SGpxNTY3cFlBaXJvMHdPT3BaQ1QxalIw?=
 =?utf-8?B?WFdIeEVGR1ZMdUtnQ0MzWVdHRkJJVng2bjN5dXhGNjR6TUc1L2Y0bkVLN2hX?=
 =?utf-8?B?OTFuZmx1UE84YXhVdGl6OEsvci9sK3VueWhkdjhBRGlhTDNPSm9iL05ab2hq?=
 =?utf-8?B?Q0lQbnk1aTk2bmRPMkNsQThtRE1lcFlQZXFpRTd1MTZKVGNmTTlreGNndExX?=
 =?utf-8?B?V3NneHAzTWJvdkdpeDk5dnFOZ1BjN1VrS3RmNTBtK0UyajIrcTNFU1lkbUE1?=
 =?utf-8?B?REZqYk5oN2ZlM2wwVUMrUDNtbWk4RGZaK2F4UmJ2MlhyTVlzUjdBcmJubE84?=
 =?utf-8?B?eFhOWExRcENtMmFhRmNueFMxRlVvK3UwMHd1UFRJaU1sSlRvUmRNMGdSVlJx?=
 =?utf-8?B?dXI2OTBKQmc4b0o1WDg2Rmk5WjZ3UDEyOUpFaThpL1NDNDVoSXBINlQ2RVN4?=
 =?utf-8?B?K0srZEFxV2VONDNTNWw2aXh2UlgrS3ZET1VnS05IdS8wSmJOaWI2bGFJR0Nx?=
 =?utf-8?B?RmtUUE1SL2NUaXNYcm81T1E0VU5UeU5YZmtZTG81NDBFYThaRWtSN3RXNHRi?=
 =?utf-8?B?YmpSUjBkZWlZRU9ZU0NEZFl3QWRENkdaZTVtTFBlS1hMeWNzRW9qbXhwTDd5?=
 =?utf-8?B?cmVIdjRGYmRQd3NDU1l0Vlp0bjhJNWNmcnFiQyt6RjBCY3JWTVVlWGs3VEpY?=
 =?utf-8?B?WEZ3bjQ0cU1Qck80WVgrSkJGREk0NHBSaDVrUStzZnY0V1NSblJtK2ErcEhy?=
 =?utf-8?B?SG10QUt5bHJXQ2JmNi9MQmk5ZjluaGxyK20wYWdrdXFjRjVYTVJnc0dydS9i?=
 =?utf-8?B?R1hlRXlnWnlublNseE4xa29Cb2NLaGhPOFRZUUFZbTUzMGUzaElOTXpyV2gx?=
 =?utf-8?B?Z1pjbTVIN0pyVDY3VzBDTktHMUY1eVhid0tOWGtNU3V6ZVVFRG00dDV1Y0hC?=
 =?utf-8?B?YzlRcUo0L3lxTzd3UDJ6N1RHSVI5YTFUcjVBUkZLV0FVM3duMGQ1UXhyeStL?=
 =?utf-8?B?Mjd3aDc0dFE4d1hDaGpPTXdUcXdXTGdwNWdUWVh3QjhJTmNOcFFGTFhCWUs3?=
 =?utf-8?B?em1CYkgybzlkOGRvcW9ocnVuQXJmQVpNSU1QVTZFcmVvRHhWU1ZLcEtPdGZH?=
 =?utf-8?B?SDBqWS9zZCthRk1RbkxVdGh4N0FJMTROMkV1MW9zcytKOXI0cTN2emY3QVRP?=
 =?utf-8?B?WmI0Q0RHblRxNjY3VS9saVV5REJwdVkwWjR0WksxT3dRUFpsWnRhL0NDOEJu?=
 =?utf-8?B?SHZ3WCtkdmVMdTFkZUdCa2Erb1NkN1pvMVIzeElLUmtqZUdXZ3NpVTk1NktF?=
 =?utf-8?Q?vWycs5+JbMe8+3DR21fI+KMm6o8fGnxg8bdTJDo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f38662-40bd-4df0-b356-08d8defc3262
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 10:56:43.3121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FxYjpItPQ94rGbK+4aG6etgH+CjcQiIyK3f72LoKW7y0uYP2qMbJ7MAzPne0lZiI97ZKX35WadWxf0OUu1IxIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4971
X-OriginatorOrg: citrix.com

On Thu, Mar 04, 2021 at 10:48:05AM +0000, Andrew Cooper wrote:
> The const_op boolean needs clobbering to cause data to be written back to the
> caller.
> 
> Fixes: c4441ab1f1 ("dmop: Add XEN_DMOP_nr_vcpus")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

