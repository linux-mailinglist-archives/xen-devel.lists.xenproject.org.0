Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADA0302A62
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 19:37:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74271.133466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l46jM-0005Km-9Q; Mon, 25 Jan 2021 18:36:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74271.133466; Mon, 25 Jan 2021 18:36:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l46jM-0005KN-5o; Mon, 25 Jan 2021 18:36:52 +0000
Received: by outflank-mailman (input) for mailman id 74271;
 Mon, 25 Jan 2021 18:36:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F5Bc=G4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l46jK-0005KI-Fm
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 18:36:50 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3609130-f5c7-4169-af2c-80c4906e5984;
 Mon, 25 Jan 2021 18:36:49 +0000 (UTC)
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
X-Inumbo-ID: c3609130-f5c7-4169-af2c-80c4906e5984
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611599809;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=piFzW5CPE2IL96wYIIBKO3ZYJWCWorcwEazj4IOyIA4=;
  b=A4rlirCqwA6pQxidWZOUBPgmJU+Qjsd6Nn93AVT3h9YDJrhjVOzDkl/+
   5H6wStnyf3rDzFkWmw2bbw/keryx6JQmW45nnGkQ2oc9RcXCyLe22ZX4Q
   XRgDVunglPla0+vXVK/oxhwxJQrSeizFM2ECzT/92bJEbNBUa6YVc0G79
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3LiHmbV7q4drLVWZcqoRDG3qhyssf/NxufV/KI3+2T/dYV4YpRrTdDnUNJAoyErsu+yyQLL4sY
 aajCJz3ZwSves95+Gd5Px7Mcfw8vuqlb+OqaqKMO7h6oQeIKOKicKMCezyGcIVXKaGHs6EuwXy
 +mah+6CI0cc00aitQi89260oTWEEJjgn44JxM+Pfe8Q/QQFZGtfkWw7Rb4Rg0U1amUtr4l8uhn
 ACbB1NT75kP7LAYY/m2nHf/TKj0DjUXNJ/XmWAuJ9cowc9MPmU4PgzraYIesa3KDrPi3ebryBj
 Y6I=
X-SBRS: 5.2
X-MesageID: 36018576
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,374,1602561600"; 
   d="scan'208";a="36018576"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYx8RO+n4llnRGvmrCpRJqB0dxcfYQKLp3jvIq1hx6p3EDcfuvORbjPix/3QZStKSeuWZxnplgMAHeEFIvDsIGif9C9v+sOIGo4JRIFcd9nIp2pGiboooX1EQifa+45chh0PO80Hr6qHoWSc/nS8i/qkoXdbF9MVWQoQWSK1XWNwwDY+rE+HpsLRNDO6vo2HCO1Fid4QDpOU/v1CmV3ypLAlRGd2wgzVwK1+zMJVqA0v6uwmXElrBLFHeVpIqGmIVYKhVlkPnE4mXEG07WBlnw4hWQlsSEaif9TXVdw34zmo/nbjnyGRkWahdS1db6C9wT2J83xQgEqTgZiT/pMFuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOYoIDSK0P2GkjU1P1GC4WT0gJ0EZt7GNNdp5dKqK4w=;
 b=Xj7DB9DWeQNKdrNozxwUsbLlVTOdiO7JRFhRLic19o72MBFJ0hctA0wId2gFhvtonD1joZM0kj11z0JPJEpq/0nPMHx5RwZvvGeokvkktbA2Fc/lyT6drKrTd03UBZHcB1sef4sDIbgwlKi8MmFJQG6LPPeVmSfi0v4gGwcRWqb9tH0+labDbcMGYIDb++DsxJrda0UQo8J7OCFeEf9CfhI3I19675prZOsbClhR2DdJKr5YyQuLA11BgxA4fQMiuR+jPlV55fuJuGZLCrpFWo05TI6ImswM9BNwetXvAdo4CP5Dgjei1QSj2nKBen/E4yTg5UyPhpVjEICn8BGEiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOYoIDSK0P2GkjU1P1GC4WT0gJ0EZt7GNNdp5dKqK4w=;
 b=NFh73Dcc0363u5irMK18JqBI2yZqz8FMewINav/KKTMLGLJM8EW0ipdxB7ECmDNpP/fITzXcoAlVGbI6/YMfPzHmXD7jtcLbqkomE76vwqQ+0s6/XNQqyRbexl4FGMy4yJ6xNSl48iBR+sbCjEVItj5LixjeZmriKPOzIiFqBrs=
Subject: Re: [PATCH v10 02/11] xen: introduce implementation of save/restore
 of 'domain context'
To: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201008185735.29875-1-paul@xen.org>
 <20201008185735.29875-3-paul@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <eab34aad-9c82-75c4-d996-92bedb8a043e@citrix.com>
Date: Mon, 25 Jan 2021 18:36:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20201008185735.29875-3-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0458.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::13) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04c5d653-52dd-434c-cd86-08d8c16029bd
X-MS-TrafficTypeDiagnostic: BYAPR03MB3478:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB347817020B0F7C5195DBA7B1BABD9@BYAPR03MB3478.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:255;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I7a9t4gkSMcWSyieT2pxliope56cyU1cidBl9eVpkBDPVFiJyIdLJzIGJm6Bkl5KJaHwckbKkM10amsC0YrlfSV7pUu5YyWSVICoHj8Z/JPvt6rUVQ3gjBEhZpIKx6dZ3Uerx1r00hF9pSEhUHgTxh1SxCDN7zGAHZt4RYjnzjS0KXGe+ciptVtl2lt5Wna4AujSXmBAlpq9h9SOfPnZ/Lg+Ht/q41IcOUF3h3i4wCnswBZcU3nPkHGyUFdyHTOmATVWqo4YWF+vMHUJlYexj4sCxHbKWalMlLyPVHSJIdWEOErlIEsuLRGt2tGHwMPGdjSJPAWvU7qtg2KPfBJp30HrR/qZaAPykjLF9zMVtLBelaIR0N2eKOWVuMkXR/3rxv7GEa35xhzXefbaVf5CzRNja2d2J7ci2zTcKxIlO7QIX9Wwp9F7L0htz0b2prit/WP8wBN6cy9+Z66UKka2UkJxzSGdjaTcuXu3yyhMcbk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(346002)(39860400002)(396003)(8936002)(2906002)(4744005)(5660300002)(31686004)(4326008)(6666004)(53546011)(6486002)(316002)(8676002)(54906003)(956004)(2616005)(186003)(31696002)(86362001)(36756003)(26005)(478600001)(66476007)(66946007)(16576012)(66556008)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V21qdzJuTlhrdkE3K1J0TlNPV2tKV1FVbE8yeTVSV3ZMakh0MWkwdGpQL2FV?=
 =?utf-8?B?dFB5S1d0VEhPQzFZOVRsamlaYzh3UGloRldjdWU4dVRRaHZxYUdZVHFpbjVY?=
 =?utf-8?B?TWtUSWNTTDkycDUwcnFvaFIra05zVWxUUHRrbnl4ME1vbGVUcUNXaW56V0RU?=
 =?utf-8?B?RmhVT0IyY1NSa2djZnFOQTNucTgzcGtnNjBvTGNEWnh3WC8xZEFXMWhGN2hX?=
 =?utf-8?B?ZkFWSno5TVEzd2VFdDN0dUJHYXBVMmx6RWROdml3WHkvNU9LYmJYNEZyM0xk?=
 =?utf-8?B?eWxscWNoeUxIc2NKR2VkenRoczRtL1Q1YTI3UnZ5cmJkb2MzZUJxRlppK0Jn?=
 =?utf-8?B?cFA4TG0wem9Ocm5oUWJ1M2hMV0gyTmhqZjFKekJXSGlpaDRWcXdDR0FSUEw1?=
 =?utf-8?B?Q2YvN0tmM1hvMExOSHhScFpzS2pMaDZKNDFHVVBBU0kwK2Q2RU1hRUJjV0tM?=
 =?utf-8?B?dFdjMndjancyRjI2ejExTzVUZ1o0VUZWVkJyMStBWWRnUGFqQXAzUE9PajE0?=
 =?utf-8?B?TU9oNzhpYm9yeE5pTzE0QUxoYllvb2xuL00rOGQwV2lxSXcvVnZ5eGkvK3lk?=
 =?utf-8?B?MXhXb3I4R1ptaEJaa3hPQUpvU3dLb3ZYcGo2UHNPVFBic0w2ZDFiU0owYXMw?=
 =?utf-8?B?Y21LYzZ0eEp5Wk9GZG1hellORllFMEJ2d1U0eXRJajI0YzYyRUlrVWpqblQ3?=
 =?utf-8?B?V0dBeFBsVk5icUxLeVdMV20zVm1IdXV2b2x2blQrQkgyb1Y5cWNMRFdtWGFm?=
 =?utf-8?B?bWg5VHR1bXY0a3NhK3ppeWF6WFpLSXo2WWFLTEJhZmsrcThRa2ZDcXloQ2xi?=
 =?utf-8?B?aUNWZDNFRFJtb2x3ODRaRm0xMUVSMXJCVEE0di9EZ2hRV1lCRitld0huMGpT?=
 =?utf-8?B?VXBudk81S2JndVRCY214VW02USszbkFXd0tISytKdlVOWjFXOEg1THNWMmha?=
 =?utf-8?B?NmtTU1ZjYVJrQzQvK09HNEgvTm1NdERvblJzQmRxL2ZyUEc0a3pDVU5BL1F3?=
 =?utf-8?B?M3JDYlJ2dC9UQnF2dEhrQndTZzhtQ0d5SkR3OXBjRS91SW0xUk11dUUzdTlK?=
 =?utf-8?B?UjBwL0lqdnpSTnN6UDA0cGw2WHJCbkdUcmltSFZFakpnd0lneGtMK0lYWjNG?=
 =?utf-8?B?TlJjNXQ4TEQ2ZU03VmlJbUwyeTY2eDN6bGVrMTI1Q0tGWlZCNHplWjhoZUE3?=
 =?utf-8?B?ZHpHRWtPL0VkUXNpQXZ6THJrbHlhaktDTjRaSnBzMkprYXV3aXZEM3dBZ05o?=
 =?utf-8?B?MkYzT3NYbW1SK2dtOFEyWk9BRmtndXFmZVQ4NlZLUEx4MWJkeGtqTE9KL3Y5?=
 =?utf-8?Q?Fv0D1kGrI7w0+OQh1UD0d013LzsPpjiyUT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c5d653-52dd-434c-cd86-08d8c16029bd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 18:36:43.8978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fE5q58ylMuMoYOSCjWgDA63Iw2mirN1DGBN7zCF2+XlyVex+1MNd/F/H/qtwO7/A8gUxI7DwwSc6jPoHjKOFn1zS4PpXhJ4zoxQWjjbZgE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3478
X-OriginatorOrg: citrix.com

On 08/10/2020 19:57, Paul Durrant wrote:
> diff --git a/xen/common/save.c b/xen/common/save.c
> new file mode 100644
> index 0000000000..9287b20198
> --- /dev/null
> +++ b/xen/common/save.c
> @@ -0,0 +1,339 @@
>
> +static int load_start(struct domain *d, struct domain_ctxt_state *c)
> +{
> +    static struct domain_context_start s;
> +    unsigned int i;
> +    int rc = domain_load_ctxt_rec(c, DOMAIN_CONTEXT_START, &i, &s, sizeof(s));
> +
> +    if ( rc )
> +        return rc;
> +
> +    if ( i )
> +        return -EINVAL;
> +
> +    /*
> +     * Make sure we are not attempting to load an image generated by a newer
> +     * version of Xen.
> +     */
> +    if ( s.xen_major > XEN_VERSION && s.xen_minor > XEN_SUBVERSION )

major > XEN_VERSON || (major == XEN_VERSION && minor > XEN_SUBVERSION)

~Andrew

