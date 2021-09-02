Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 166DA3FED15
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 13:42:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177244.322563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLl6o-0003hX-Mw; Thu, 02 Sep 2021 11:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177244.322563; Thu, 02 Sep 2021 11:42:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLl6o-0003ez-JH; Thu, 02 Sep 2021 11:42:18 +0000
Received: by outflank-mailman (input) for mailman id 177244;
 Thu, 02 Sep 2021 11:42:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K8X1=NY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLl6n-0003eo-0v
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 11:42:17 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 521b01a8-d630-469f-aa7d-b44328f3c1b3;
 Thu, 02 Sep 2021 11:42:16 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-HyzUUVwYNDeDBuR0TCYHUQ-1; Thu, 02 Sep 2021 13:42:13 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7024.eurprd04.prod.outlook.com (2603:10a6:800:124::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 11:42:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.021; Thu, 2 Sep 2021
 11:42:12 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0014.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.20 via Frontend Transport; Thu, 2 Sep 2021 11:42:11 +0000
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
X-Inumbo-ID: 521b01a8-d630-469f-aa7d-b44328f3c1b3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630582935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xXFVZSaYK4b8AaJ5+/aIrMW00hZGanLVCMXLN49C26c=;
	b=HWerCo+7Od7FvhkYA/FmgjjAN+LldpW923YIMwfkRXFSpfrV1uur+t5q7WTZBE7wh2ftqk
	ds2tmGoLbfYWX5oX0KnWocFK24lYNP9R+S9DYiPAkcr98kusmPvYzjKxkhtq2NkcqIoLw3
	v37SmVZjDufBzT/ctadTZ/GVPWtQe2A=
X-MC-Unique: HyzUUVwYNDeDBuR0TCYHUQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edCBtRt22ezlv7rHVOgEMFSMVN86J+T7rDIgTPuWyB/1evYcATdlzTB+jNmy874LwZ8DgOYw1nPYb4iF5byKwdNjQosP+vnfk3MOHKXODRayJtUnIU/jCdnM/t/hZ5a3UeZZB6GuLVpGJKzetaXwownOfcWyt35Bgf6m/nnifKZ/fqwM5X33AhK7HdPS15vjIMLZYxUwSGZuMRo1PzClKviPd7KlRJo4cohVwkafeLwSZNp0aCLHjZXlh4rbLBAiNIH8Qg3sFjb0Dp0CMuS2TirbUzTR238W10lbPBCXs7bljh6YdC/KtHRn+kZzkQIMIwsyQnig9sRu3ZRdcnLRVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=xXFVZSaYK4b8AaJ5+/aIrMW00hZGanLVCMXLN49C26c=;
 b=jheRC3phtRpE6pRTliRKpNp2eiLqNm+qEh/9spIiBXkVfdh5oyawuFdOf/y5aPdKzFORt7zzlqL73zoF/aET9nZ2RusvotCakhJFgTYUAJbuU8Mn+fwW0I9kC9AwErNnzztaaxvebrX7beKuxvYI1B1sZqqwarCNy8opF+0dCNL81XMaYazkNuaLtTIEpNNm7LHLrBVZkbU3Gi/PHpUc1cCatdoLzOvD0+KTt8cuEOxsvep+OiqTGLpOIf+2UtEvOBZWwmpDbcgKJNCv7gvVTn1ghxr33GOzMFcgIosKZWaFzOmRZRB9117vTjqV/elGb0vI8WI3ml+yvOiWYz4C/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2 0/6] x86/PVH: Dom0 building adjustments
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <5972ce4c-bdb0-6d07-afad-cf4dd5615488@suse.com>
Message-ID: <2cd2d15a-01f7-6bbf-86a8-85437991da7d@suse.com>
Date: Thu, 2 Sep 2021 13:42:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <5972ce4c-bdb0-6d07-afad-cf4dd5615488@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0014.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2090ac4f-4ccd-45ed-db01-08d96e06b419
X-MS-TrafficTypeDiagnostic: VI1PR04MB7024:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7024EE810965A7B8E470F59DB3CE9@VI1PR04MB7024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z5dG3a6giBK5ITZ3af/pUPNv5609L+ZerUQVpIgDI0UHTHjHiKz/ZMjKglUvcHfRwT2XAke/i9yroruz4YC6QXHIIdzizYGCBdyFrgFKkFCIb9T2PI09dXpgv1pjl4uCQOBD8ZHWGC7XjEhWy61tjBIKTQU2UviOA5AUJpcN05cFoh1LZai+xu77J2H8EFnzRZZPyy/OFGFOJ/Hlfn/I85NpqibHc+3Bl9U/UmtB8hAfhMxOYraN4xGFX30KgS7+4Pkw7kkR0wUS7tRvKDTVXIYOFTzsShebp/hwfIjAcOMZR9Ge15X2vO/NWDgakGj4EiQkRymPgkJn0Ta/IlRduuntHi2VuK817MZ1KZfv87visFjqMtv06rSPT74Oui0FikQzCmWOh8bSqfWoa3WUg+AIv6BQQPRekVhJ2vWH6D8xdkMnYRtpPI+zi5IEUqILaLpPa7Q+WGrLwjqM0T1ASFUrkPS43JYZZgJhbGe6zh3SjWSH6veN5ReNWx7fxmYp+Hnee3sqnhIY7xjaK32Fg3zZ5u1GvwKqFTnWkeWCGbvgyVclKNQFl2sZ2YlhbHEbgAVtEbcODlruXSdjhWXTIBWDB+vQBjyFKFt21NMLkiN+84eh4f+Ed3myB+ZmQ1vDyn6DcJMe5m54KW3JStVaoQpr8IkmVe4jguS17HK/PnHfI+ybud0ukjMEajP/w0QvsYewpFEIpJf4f/EwZvXae9grwOAamEY7oAhN+Hxfi2Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(346002)(396003)(39860400002)(366004)(53546011)(8936002)(38100700002)(31696002)(2616005)(26005)(16576012)(2906002)(5660300002)(6916009)(956004)(36756003)(186003)(54906003)(4326008)(316002)(8676002)(6486002)(83380400001)(66556008)(478600001)(31686004)(86362001)(66476007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDB1azRXZkJUQm53dXRBME9RdWk4SzhiNUlDUmoxdjAvR09ObTQwZDJsbTNZ?=
 =?utf-8?B?VFRaOFQ0VHBmcGlWdzNSRHROVXZDSW03bE90UkNYdHVMRTlIb294M1gyMEo1?=
 =?utf-8?B?UjcrRksyQWZWSVpYcjhzemQ4NXhGcG4yL0dTdEU4UytVK05RTTFCU1krL1N1?=
 =?utf-8?B?QWNOaGErL1ZSMTY3ek9EMjVKa0JoOUI1ZHFMaVI2QlkzbEJvdDREak5vOEc0?=
 =?utf-8?B?TFRZRnNNZHQ0SWpqWGVMRkhkaWxRVm14VzZ5NW1obHlRblZJN2J4QmptS2J2?=
 =?utf-8?B?RkhGdnZndGZpUmdLeHduZmhGWWROUmcvWWVJWlRlbkV6QnUyWmFDUXVzZlZj?=
 =?utf-8?B?b0tscjhveWFmWFc0R243K0RXOW1CaGJPK09TYXpobDF0QUdNSy9ZUzZZRDNF?=
 =?utf-8?B?MXJrTHc1UEZ1YXR2azhBelhPa0s4T0FqdmVrTEptdXMzTVRtL01LMnZuNzBi?=
 =?utf-8?B?cnoyWHhyM1VBOHluOW1ES1ZBdjFHcmZ2Tjc3d0FGdElFL1krcFJyUW9yWnZ4?=
 =?utf-8?B?QXIyaVpOL0JxNU1OaUc4SGl4TGY2UDVXRmlJcElDT0xnTEVpaWdqbHBnRTBm?=
 =?utf-8?B?c1pXSUovWWlxeVUyZ3RBTXppS3YvT2JuK1g1THVVd21XeXA1aHVDVGxXS1lB?=
 =?utf-8?B?MngwQU55YnFDdkpBTWlBdzlwVDNKVnZBdmVtaVpYQXpEcEhKcVd3MDRyRm10?=
 =?utf-8?B?b3k3OXQ4M2V3N0JEUWF6QUZNWEFNeUZoU0UxV2RyaEwvaWllWjcraW95ZzY5?=
 =?utf-8?B?WW01SkVtWXIvc0pQZFNNMTNIZXFpOHFNaXZaSE9yaEF5ZmcyTWVJNURGNlI5?=
 =?utf-8?B?R3c0RVNlcGE2ZklabW81Zy9INU1yMWp0bEQxUUFKYVYyWnNqUXMvNDdzTEVz?=
 =?utf-8?B?WUxtWWYvcEZNSllndVUxeEhhNHpROUpqanZnUDV5Y1lrT1Y3OHM1RzFPTjEz?=
 =?utf-8?B?RkRUTnFBNzRDcmdrTVdPbld5ZXFnQW9qbFdjZHpicFZRaXkrL3hFdDlNbXc0?=
 =?utf-8?B?NFFlN0VhR3hvVExuUThIWGhRTFlQNkJMS1BjL2Ixb2E5TkQxMkd5eHJPOER2?=
 =?utf-8?B?bUlSTWgxeXhhakovdXVFd0ZndmhFY0syQVZrTU9Xak5CU2dUMlpuLytjK0l2?=
 =?utf-8?B?TlJtVHYyT3lOeTdyM2k2VUU1MXVhS0xqb2FxT3pLY1NCQ1Z0dUpmT2xkQ05L?=
 =?utf-8?B?RkhTbjlJYURQdHB4UFRwSFd2b2VCNUdXK0l5YXVYWlprdlVaNEl5dGRySHFS?=
 =?utf-8?B?dEVYL0tYT25WL3ZGRkF0QWJvUjRLWEdJd0lZSS9hRmFna3c0eHJ4bDBRMWNa?=
 =?utf-8?B?cW5xVFo4bEdvK3FveTNScEdMMTVaL1d6WkgyemZRcjFCeWE5N3NPRWxTMWsz?=
 =?utf-8?B?SlBHSTN3UnV6VmZycG1rOTFWdG9mSDFOWmxVZWUxNFBLaGVlU0RWOWVhcGlq?=
 =?utf-8?B?RGtlQWJEKzNBQU0zQjluRHRtOEQ0eE1UU210bXBSU0JWWEE5M2NQUXVZSU1h?=
 =?utf-8?B?azgwYjZIVkxNUVZHVitXUzh6QU5XSDZzajMrVHhHY29QQkxqb0pHK2JQS3BD?=
 =?utf-8?B?L2pBOEF2VTViNnpTL0dXeXVVenB4dTVIZCtlK3dkQWVWQm1jdGtzNU1KUEwy?=
 =?utf-8?B?N0g4aU01QWU1elBMUUpHV0k3WGVISE9CL3JiekNrL0NXZGNhVy9sYTFIbzJB?=
 =?utf-8?B?YW4zOHVsUUJHUEppQVBnNS9OYnM1eVVqcFZvY1M0a25SYnpMVDZEdmZZRTls?=
 =?utf-8?Q?syqoUeb8zjXOcbZ4JcGbtjkunB81RnXRzExJlD6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2090ac4f-4ccd-45ed-db01-08d96e06b419
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 11:42:12.1327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XJajRYW0bdEo0ZXOhTGPN7a/VwcgKJToY2qQFBcWnxwLrnv+OQ+gbFxQm+SMNgw5JJlzSO0lzhF1vkoz2Ia6zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7024

On 02.09.2021 10:30, Jan Beulich wrote:
> The code building PVH Dom0 made use of sequences of P2M changes
> which are disallowed as of XSA-378. First of all population of the
> first Mb of memory needs to be redone. Then, largely as a
> workaround, checking introduced by XSA-378 needs to be slightly
> relaxed.
> 
> Note that with these adjustments I get Dom0 to start booting on my
> development system, but the Dom0 kernel then gets stuck. Since it
> was the first time for me to try PVH Dom0 in this context (see
> below for why I was hesitant), I cannot tell yet whether this is
> due further fallout from the XSA, or some further unrelated
> problem. Dom0's BSP makes it all the way through to entering the
> idle loop while all APs are still in VPF_down.

This last part of the mystery is now solved: By cloning from my PV
.config, I've inherited the X86_X2APIC=n that I have there. Yet
ACPI's MADT gets populated with only x2APIC entries when building
Dom0, which such a kernel would mostly ignore (except for logging).
IOW in a way this was indeed a missing select, except that what's
needed wouldn't quite work yet:

--- a/arch/x86/xen/Kconfig
+++ b/arch/x86/xen/Kconfig
@@ -83,6 +83,6 @@ config XEN_PVH
 	bool "Xen PVH guest support"
 	depends on XEN && XEN_PVHVM && ACPI
 	select PVH
-	def_bool n
+	select X86_X2APIC if XEN_DOM0
 	help
 	  Support for running as a Xen PVH guest.

This is because, as mentioned, XEN_DOM0 gets turned off when XEN_PV
is off. Whereas x2APIC isn't strictly needed for DomU afaics
(MADT gets populated with LAPIC entries only), so the "select" also
shouldn't be unconditional.

While likely no-one will really care, I'd like to note that this
effectively means a 32-bit Linux PVH Dom0 would be impossible, as
X86_X2APIC depends on X86_64. This may want reflecting in the
eventual adjustment to the XEN_DOM0 dependencies.

Btw, I've meanwhile also checked timers: They're active and get
updated while Dom0 is in this funny idle state.

Jan


