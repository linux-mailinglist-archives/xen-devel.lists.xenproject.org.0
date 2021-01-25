Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8603029E7
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 19:19:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74253.133430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l46SA-0003LI-4P; Mon, 25 Jan 2021 18:19:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74253.133430; Mon, 25 Jan 2021 18:19:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l46SA-0003Kt-0Z; Mon, 25 Jan 2021 18:19:06 +0000
Received: by outflank-mailman (input) for mailman id 74253;
 Mon, 25 Jan 2021 18:19:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F5Bc=G4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l46S8-0003Kj-UY
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 18:19:05 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 545333b2-12cf-48bf-983b-dcee74c14552;
 Mon, 25 Jan 2021 18:19:03 +0000 (UTC)
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
X-Inumbo-ID: 545333b2-12cf-48bf-983b-dcee74c14552
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611598742;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NB1VByVEs4CYwLcVTCjIFkxPFf46rBGAwsmAbyiNbFg=;
  b=dwAOczD6eK+6zRIP4QwpeXdl8RSReoQkepQgwcygzxdVpudfIoWHvNOI
   JbklC1gk503Fe/Dpmma19fbNaee7/AELFdTMe1BObVLVNg7pflvs1OZZQ
   yMCky7NlOjItPqruktgBWKuCBanr6zZwXaCZDh8VPUdXxQIarVIJFe9hb
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: U+hDOsSWnuC95b4vljd5ohCvrhmorFCFcVPflfwXsXJG+yPaI6+tQ6WS97oTq6VtAoXD4kaJOX
 FJcrSFLPiQOz6q5RC4FFBPILEWnzURtFTERZb8VnUa89gQtSmbH+1HBAmDxuHiqFzFiOLFX2h2
 dwr59DhB/Ox1WGM7QN360J9uLxUFdJ36nkt8d9l8GPJDRZlBR1md8X7nnxyk+ks/pE5+TTI+SX
 /47h+jJ2p5/Q87EC/QRbbaV2ORDgUVKwC4Tz3GDwwWCXCeL1fiDIMaOJybP5MKZ3qHzumEq3XJ
 aVk=
X-SBRS: 5.2
X-MesageID: 35807342
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,374,1602561600"; 
   d="scan'208";a="35807342"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ky1o14Ng7PthXIr1XcYCQoDZ8cvrmwZB782za7jum6G8pjzxlbz3G6WgXxJWcDUm6Mgcl9Q4/aAasUI0wnylhIMl1nVosBz//Rx7yPx4zMNKBM0CZRo3FWeXaF7DmB7+jiVY0NfVbCMc5mRoNer57oz4d7TCbTxlurSgsIaO1cemeUlyIvCDCbnbFp1fgpUlHFs1IU81a4bYuEyVSi84Lduafg6ZEHo/ocx8ZRRpfP7y8S0+jvViOcKTI3UpXBaZIzNUjpbKxFO9zz/a8qM7dxsWXa6CrPPqvij7TSJFjR/kOHsJM8f0IXhhSAdgcIoeLwmAKUKV7tLLLJZjfKeZ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGFGo1KxIoxCW18E+SphtbL6IWlYNvZiXZTy7Gbi/h0=;
 b=arx/bisTa8HqBhnk03lUloFyQf1QbPoyIgF9RN/Z8lscYZI7UTx8I6rAp7fV/3grfdEhPRBSPB2w3B2LxphrT34uB0UdpgMAPZOXSm67v0O7+W6f77OKem/oEeRNjWofbOH4T5TOCTNrnf9s+3qPWkaAnrkO59SXr1FaiuW21uGOVBFlzxeKm/9DeMOkyA+57uk7xcckf3T5FczmDJjJiDWkRWO4UDqz4B/WqfrV2kI4xxzWE3P5omyOLjYxbQffn9d6M1GYAAoVMyAWXySNma+rZZJSCFAyjT3w55FWc31QW09xKV1vth4NGN9UWFnF+5u8OUa2ukzBjryt6jzfDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGFGo1KxIoxCW18E+SphtbL6IWlYNvZiXZTy7Gbi/h0=;
 b=rtaSSpUZjoHzRRmjjl9ujVDMr7dmAFWJ6IwMwT1tVkbHyfaYWZsnZrpGvXmm+2MxgHTrVJ+BO35DowNUa8oGTo3WaPb4VtWgZZRy3LD4ocSXmZXM7nQa7Lhy5Kz06J9jrGzIA2YdJpvR4AeruYWV2u6QUNv3a5DH1LEMFsEfEuk=
Subject: Re: [PATCH v10 01/11] docs / include: introduce a new framework for
 'domain context' records
To: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <20201008185735.29875-1-paul@xen.org>
 <20201008185735.29875-2-paul@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9627b5ce-3c96-2f8b-bd04-0db5ca2486c1@citrix.com>
Date: Mon, 25 Jan 2021 18:18:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20201008185735.29875-2-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0423.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::27) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 906fca08-e034-4d82-b329-08d8c15daeda
X-MS-TrafficTypeDiagnostic: BYAPR03MB3606:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB360614797269AD539609FF33BABD9@BYAPR03MB3606.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sc5z1JsRoqouVelXOliU0G3an+sBla1rEbSueLdhksOD7EWPRjojpN0L+4iaGUDghIg/Lzz2Ta86OvK2wBdEiSeL0mbsK329rtvbAzTsVIiVfiFsR1SWn8kiyO8aUmZqXoI1FgkHH9ObtqQJ+GEmbF/2Rr5ZQwNtkxRnO/axwDiCD9oNxTQXc1RZeEus9717kLSqW9Solmpl+qaL05UAcJ4uT0TmbFc6HrpKDPWNIEDoJ/4I0f2ekfd6Ie3+BbiVSH93n8G2hkiqz03HYMZX/CsHH5OrtmbEfz4womJHsqAmbDmAVjpQl+UJIqA1FA7DRvF24lEiSLm2dypIFG76wIy67HZV6f752zMQDzEVL1y+eejh2M5RNOTVqVOmweyDG/hXLobSfX50bPZo3ypQF5dk8xKsomawE6oIh2wz0T3AqvNr36CInru3m0a+RUwCCk+sgkxcegul1X7fXDaVpDHtaixgnSKbRmNAFIo+gAzH4eIAHKDNylxxBauHQK0irFImPxPyBLwxsfEHY/c8soINFaKObmL7CfgKzJdX+rsf4kD9AJN4YKY7sKhJH16+sIwVMSAcxu2rIrPyMWT8i6ggBVMKhHDJar9fBsLvUWk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(39860400002)(396003)(376002)(4326008)(66946007)(6486002)(4744005)(107886003)(31696002)(5660300002)(6666004)(66476007)(66556008)(36756003)(53546011)(16576012)(31686004)(956004)(186003)(26005)(16526019)(478600001)(316002)(86362001)(2906002)(8936002)(2616005)(54906003)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UU8xbWY4aUdsL2JQdmNkbzg2ZWtZek1IYkNrelpxNVZNeUNDZWhVYUtzRXdw?=
 =?utf-8?B?REhIa0ZaenczTGZoeDJEcDhWV1lMUFFSTkJRUURPR3RFblUxU1IxS1ptRzNR?=
 =?utf-8?B?T0xQTW9rdFkxc1laRUV3TGxUdE9ob3dTbi9OTXltMDhsNHhxK3dsTTgxOUlV?=
 =?utf-8?B?Y0QwWmxYbEpSY1Q4bGdSZ2duZjVxVElvWDdPK2pvcDR5OWtUK2tSa0tUTUxh?=
 =?utf-8?B?U3FJUmR1NWV5NlkxM0Q1TDhHMGJlNGo3Y0w5WWhwY0t0MDlMUURrd1ppK0Iw?=
 =?utf-8?B?UWJQaHJ3QXBMWG1ZSUMrOW5UcEZIbnRyaHhjTTVwaklNVGRPRlZMd1NvTGR1?=
 =?utf-8?B?NjNrQmNuNGxCYXd5R1ZjbkI0UFkzMGFZd2RHcFVPTEpNZW1UY3FzanlBVnU0?=
 =?utf-8?B?cW92Nzhyd2Q0b2pqNlNxWjE1aERZb3drb09jVGFITHpUQVp3MHJISTMxTXBr?=
 =?utf-8?B?NDRDYllJTzdscUU1VnAyemRyTktuMDJUOXdoUjZHM1lGc01RakgwaytPQmVl?=
 =?utf-8?B?TXZzUVhHSWdHNW41N0pMbU16WWJxSDJ1OHpreGxkY0I4eDhxOEh4Q0F1Q3hz?=
 =?utf-8?B?YktkUjFOd2VVRzBuNms2TWlXTnJIa2tHNDJxNlFScWo5bGUrazZmZDFJV3gr?=
 =?utf-8?B?US83dzllK3VOdDI2MVM1TEpFa2FDSWUyRFZ0dFJNNkprak5Ra3NlemZsajlm?=
 =?utf-8?B?ZEdESkN3VjN2L3h2QVFvRS80TUp4QXY1WFhrbWRxQWJrRHJyYWY5UnVEZmFv?=
 =?utf-8?B?UnI2T1FiMFA1OEt4S2RBUEN6U0FYZTdXWDZTL0tFZUZsc2hkUER5Ukc1MTFM?=
 =?utf-8?B?eHgrMmVnOVNSVFVGNnRYb2d0QlRlMjVyYUprVGpoaTl3Q1AwSUlBeDZ3WUlO?=
 =?utf-8?B?WHhuZU92QXhVdWNJWmpkcmovWVJwOWxFdmw2QitDcUFiQ2ttQ3VIZ0kxZ29r?=
 =?utf-8?B?a2k4N2tUR0JveHQxZldFN3hzc1FQRlFCK1RoZGFoYjlLdFA1c1duODNrUjdu?=
 =?utf-8?B?YklhZUQ2US9hZytSNXdTSm51RUxyNjExUTdkUU1tcVJQWXBGamR0cDAxQ2RZ?=
 =?utf-8?B?cHErd0o2Y0wrdUJ2TjBlaWQ3OTV3S2s4aFpMMVpzZEY4clJtVDN6TWlKa3FG?=
 =?utf-8?B?YnBhUkRrWjFsQlB0QkFUNkxuWm1JUG9OQmtLMUVFUk1NYVE2VjNwcmFUTDlE?=
 =?utf-8?B?cDhxUHF4ZFhPaXVvditWTi9pMmpWMHdlcGNGU3pDaGxUcmFBc0xjdmFKN1NG?=
 =?utf-8?B?NDUyMXR2RWZMbjZvN0ZwaWJYMDZIYytmK1N0NlhzdTBSZlE5aUl4SXNIWmMr?=
 =?utf-8?Q?KHMHo05VaikMxFltrIU1Bax5xQ9ANZ3+Im?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 906fca08-e034-4d82-b329-08d8c15daeda
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 18:18:58.4561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBiOAphC4J9l080AvLmLztU8UnKGS5tWIAZkZOU1OMp6yUjPCCONF2hWq7BPZPbqG9NCC4aHwN/OQjNOg7eIfOneCA0KDMdiVQFsXhhJ7cs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3606
X-OriginatorOrg: citrix.com

On 08/10/2020 19:57, Paul Durrant wrote:
> diff --git a/xen/include/public/save.h b/xen/include/public/save.h
> new file mode 100644
> index 0000000000..c4be9f570c
> --- /dev/null
> +++ b/xen/include/public/save.h
> @@ -0,0 +1,66 @@
> +/*
> + * save.h
> + *
> + * Structure definitions for common PV/HVM domain state that is held by Xen.

What exactly is, and is not in scope, for this new stream?  The PV above
I think refers to "paravirtual state", not PV guests.

> +#define _DOMAIN_CONTEXT_RECORD_ALIGN 3
> +#define DOMAIN_CONTEXT_RECORD_ALIGN (1U << _DOMAIN_CONTEXT_RECORD_ALIGN)

Do we need the logarithm version?

> +
> +enum {
> +    DOMAIN_CONTEXT_END,
> +    DOMAIN_CONTEXT_START,
> +    /* New types go here */
> +    DOMAIN_CONTEXT_NR_TYPES
> +};

Does this enum ever end up in an API?

We might be ok as we're inside __XEN_TOOLS__, but enums normally cannot
be used in ABI's because their size is implementation defined, and not
always 4 bytes.

~Andrew

