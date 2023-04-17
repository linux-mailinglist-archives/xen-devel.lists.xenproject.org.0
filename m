Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B22896E465F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 13:27:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522009.811108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poN18-0001kG-Ra; Mon, 17 Apr 2023 11:27:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522009.811108; Mon, 17 Apr 2023 11:27:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poN18-0001hx-Ns; Mon, 17 Apr 2023 11:27:30 +0000
Received: by outflank-mailman (input) for mailman id 522009;
 Mon, 17 Apr 2023 11:27:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=696H=AI=citrix.com=prvs=464f2b76b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1poN17-0001ho-Hv
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 11:27:29 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d471f044-dd12-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 13:27:27 +0200 (CEST)
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Apr 2023 07:27:25 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5277.namprd03.prod.outlook.com (2603:10b6:208:1e8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 11:27:19 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 11:27:19 +0000
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
X-Inumbo-ID: d471f044-dd12-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681730847;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6UTiTsPO8GVwqlj7t3BxjpF+JtSoOgTXRCqJhoII7og=;
  b=cNiO+ZcIZN+PI51XspBLz+uX5hmMoLuchvRCvRkqscZbuGn5R+beg/c7
   OxB037y7CFoOY86YkUprwK1BFYZwqxgZgTqttkQsfabVbcIG5bMuxoMC5
   iU5fRD6WOOrBXV41+2m0igg7CSI3l8w0mvGl+iQMxVPC0BVn5YmkE/w0F
   8=;
X-IronPort-RemoteIP: 104.47.57.176
X-IronPort-MID: 105696815
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+KDNBagqV1+nU5GeRoLcvlAzX161pREKZh0ujC45NGQN5FlHY01je
 htvWjyPPPfeZmLyedBxPNzj8h8E75Tdm9YyTQZr/39jHikb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWj0N8klgZmP6sT4AaBzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRfCRkxfzO6g96qxeu1dsJLvtYJIs/SadZ3VnFIlVk1DN4AaLWaGuDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEuluGybrI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeXlqK800ATOroAVICYpDWGErPyJtladctF6A
 XweygcRgadnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBebT8t0
 EWAk5X2BDhsmLqPQHmZ+/GfqjbaETgYKyoOaDEJSSMB4sL/u8cjgxTXVNFhHaWpyNrvFlnNL
 yuiqSE/g/AfiJAN3qDipFTf2Wvz+N7OUxI/4RjRUiS99ARlaYW5Zouur1/G8fJHK4XfRV6E1
 JQZp/WjACk1JcnlvESwrC8lRdlFO97t3OXgvGNS
IronPort-HdrOrdr: A9a23:D32Pe65VAlYJ/eJh8gPXwBTXdLJyesId70hD6qkRc20vTiX8ra
 uTdZsguyMc5Ax9ZJhio6HlBED4exLhHMdOgbX5Xo3SPjUO2lHYVL2KhLGKq1fd8kvFh4tgPM
 xbHJSWZuedMbE0t7ec3OAUKadH/PCXtIqTraP1yXN1SAFjbKttqz1+Fh2QHiRNNWp77N4CZe
 Oh2vY=
X-Talos-CUID: =?us-ascii?q?9a23=3At1S5BWgUUj8ei/5M2pnGUACwszJuNVz08GbzGku?=
 =?us-ascii?q?EFWMwRoG+bmeC0q1iqp87?=
X-Talos-MUID: 9a23:HqDYUAaUQCOhN+BTjAC0vg5vMfdU+4eHC2UnoZ82lvaoOnkl
X-IronPort-AV: E=Sophos;i="5.99,204,1677560400"; 
   d="scan'208";a="105696815"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INs7hvEIOylB5wzbQFUze+In8sQwC8Y0PwEkSlzolPJu5vMI+0cwqr1JkrgLe0l2l+nsiAb8n5YcdfxO1yrvYqIWl4hwQoE+yaPLU+W1w4vDREnfv7xBkIhHhkQlSvzlQtQgdRNJp+zjDJJZKEQxWvSPiyCtU5aRinkX2BOclaORpC4//FX9/rKIJMbDyIJvnFLTKTaHpqOxDMLr8EYJIz++PUeWPebvHUKSq13gOOuyFlddWX0FtJ1d1RiyihhkluywNcph4Fqw5bEbpw+OLimkrqZrXJiV7wabIxbOp4CZ3p2g5MJb+GEO1Zh7suHDANkISPBdEeawxckd6nsWww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4VUQnZyuaznrhxdXf/7Atx4YpgITQfM7rd0F0CiHEw=;
 b=QmQQ4khmPTy1cf9T6n9eFW4td5p2LCt2kjojGfoA5kokleY/njqrpslCm+qD/0NTBsIUEe03L+Gs+ZuPh4sBUhyKpHsV0c0fdzPu7uS+CiuvXNNBfBlum39aV7YO5DGEI6iV7h3W4URdtmLZ5alGZqxVE8vMSK/Hrs1NZIqMeXrJvCX3GCnXBQFsLWQWXMfLH0M+Ii3oNkH29R6GRnQuTPAVKdaKb53XPmMI4eYBfKiKdlzGQFGVC/baKJo6vdH4m7lH0ReO/faJUSwIQMm8/38LUV6GIOoJ6WZvGZcEsCgrZT9Wl6a/SjPep1iXiA8FRP8tyRM3SQ1f4c1JhPDCpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4VUQnZyuaznrhxdXf/7Atx4YpgITQfM7rd0F0CiHEw=;
 b=clE+rQnEz1qPme5PEemZ2gFinOoWaIwLlIDvMeaRpriLinid+bc5ZS/aP0uMntPa/br87VPf/MsMBNcWZRPWw8ObG3rHQrFj837TeUzkOMsq/k4QEZCXW0rfROHVnlpGlHQZzjPxpr9faAVLykLO4JaZfx4nMYxv7pWxLgGAG3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f1ffbf21-e6e2-b3cc-5c02-2382c052d20e@citrix.com>
Date: Mon, 17 Apr 2023 12:27:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/livepatch: Fix livepatch application when CET is
 active
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230415195816.3717648-1-andrew.cooper3@citrix.com>
 <1cde4c30-bc48-7170-d465-11ed8617449f@suse.com>
In-Reply-To: <1cde4c30-bc48-7170-d465-11ed8617449f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0023.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5277:EE_
X-MS-Office365-Filtering-Correlation-Id: 746ca7fc-7a9b-4b69-21bb-08db3f36b43d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qSr8eT843mA9f8vuuUp7VNnVTGmcKER7g7TUD458OTRj9D+ekTR3urihEEVuyAH7hIWFhRqSOoEjNLaX7FgE/f304YBX8FZL5k4Io0+KLESSi7T5UE+xCezrbedh1YdPgyuZFUd+2EHG8HyFI989OjLiKAZF/ufOTJomFP6PimWFz8+lavSy/rmRIX7r7HpnTtfzJpi3IDrbuN6PbLFsbAcS2FgkTjRkxiZSate+9e3F++mkELJR30i4n2+EBULskt2JbQK+808rYMXMjcDM1OomTApa5nOdm+A74wJX0SqC1oYEl4qniqIsR3w6Noiptb0wPbzKz9geVSAu4tl2f4vBTqjhPKKzlpg6Y9uFVnAr4/0dJ5UvJWnZ3jLrxBCplb5av/5gGIXL5U67oVtBMv4gcGYEfCxQjY/QHXcvQ+mESpAY+1x4FiuAicUfnAK0FPk3wD3lEKsYlbnkw8OgUCVfanIGAGzfdlOx4LIefGHKVdmWCAlG4/kUTQSZ68pSjfJvS1LHdGFRJ7fN/Yv+Wb/CqvHGQd3BQeJiB3iZ2F87iCBQAJP9TlLLgCpJ7PGye7Kd+ZGwjVddU/mTI0Ww8LDdgsqVoW2DtgEFjYtENqpz2PHsEhVoApMPTHaVnEN95xEPb0nZYV7BkN5NmUAkJw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(451199021)(36756003)(2906002)(5660300002)(66899021)(8936002)(8676002)(41300700001)(86362001)(31696002)(38100700002)(31686004)(478600001)(54906003)(2616005)(26005)(6506007)(53546011)(6512007)(186003)(6666004)(6486002)(6916009)(4326008)(66476007)(66556008)(66946007)(316002)(83380400001)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2ZoOFR3bjF5SUYzakJaMk1LSXNBQVRyUFBiMFpNY3RnNmswd1N2WFB1WUln?=
 =?utf-8?B?OVBiQmVUbWxpQVlvSGMycHRuSHVaTzkyQ0h0THE4ank2VEczcmhjR2daMmlQ?=
 =?utf-8?B?MnFHdGRiNDZwbTJMN3d1Rkl6STU0MDlTNFVFdUJuTHNSOWlSaC82Y3hleGpQ?=
 =?utf-8?B?b01VbnpmSFRURHRTZUk0aEdQSTI0VkFWZXZpQlpRTlNSSE9zVzJ4c0RlbnFj?=
 =?utf-8?B?VGMvKzV3eU5NdEVBVWU5aUNYd1YzOUVBK2Z4dXpIQzdycTBudy8zS2hpNzBl?=
 =?utf-8?B?TlVtMFVrcDhLQVl1aDF6QUJIM3JML1RJNkVQU0tKSzB2MXpYSnQrdWxZSXBm?=
 =?utf-8?B?MnQvN2d3RmJ0YVFVamVqRVRHU0hjcW9UTi9nZXUwYVpvejNYWmFjRUZ6Q1FB?=
 =?utf-8?B?Vkh2T3RoaFlHNmxRVXRZUEhRbXF0RXBCbVNkVHRDUFY0WlRUaHk3amVFNlFa?=
 =?utf-8?B?QzRkZWtOYTAycENjbzk4K2xuT3YwUXdrTVVXK24rNWpxSFdKV1hUV1FYVVpq?=
 =?utf-8?B?WlpNZ2M3RGtLQ3NWbVR0a0paZ0xHZzJnSTRud1NOc1NXN0tyUlE0WUk2TktX?=
 =?utf-8?B?RlpjcHFZV1VPZDdTUmZZK0EzS0tjR0VrYWZxdzB1eWxLMDNmaWpGTEVTTThp?=
 =?utf-8?B?OGpBMU5hZThHa0U5RytoSS9UYnhyZzkzaXNrWmJNS3hYVmZtUmN0d0hneXp5?=
 =?utf-8?B?ejdRSjhFSDJxR3BDUVNETFhEYVVxQ3Y2WkVqNWVWVEpQYU8vOFpMc0gvWXRy?=
 =?utf-8?B?UHNrVDYrOThFRitCdHVSOEt2MHE4b1c0anMvT1Q0SmpielJVb3BRejJuSVh1?=
 =?utf-8?B?Wkg0cnloV29qbFY0NzdCVzduZGxCdXd6dU1HdzNjenM0NExUdGxiWHlPM25P?=
 =?utf-8?B?OUc2V2dqUnpKdXFSNkMrRjF3L3M0RTBtVU91MkkwT2lNTXV2UGVjT3J4SDFO?=
 =?utf-8?B?SXM1MUdVaXl6d1VPZC9qVGlqdkxwVUY2cGJRemtvOHFaZ25pSk9ienBEaGE2?=
 =?utf-8?B?TXpNVW5yekYwV2lqekxsbSs3cGxzMkUzcXd2WVlzT2NDMzZ6V0lYSFJTVWZH?=
 =?utf-8?B?cGxXeVpqeW9mc3M1aUpvN1FVYXZwK2tqeDhYU016dnhKMzNjeHdFQXBRWHU4?=
 =?utf-8?B?YVVpd2t0bFAxbDVpSEZoUUYzQ1RyQnc1ZDQ5SjRialV1ZXB2TVNoakJtd1Yz?=
 =?utf-8?B?M2hNc2VuRFZkOW5ZOEZHRUNhcG93ajZMTVFWSnNpN3pBdiszNUVUSmtBdkQ5?=
 =?utf-8?B?Nnl1b2tzMWtOYkNuNytPQ2Vwa1B0M1huZWR2dytxUzkvOEg4WEdCbDVaM2Nl?=
 =?utf-8?B?OXlmZjUrR252b0p1U2hycFZVRVlTaEFjZzdoV3lVQndEQ3RBcEp0aHh4dHBl?=
 =?utf-8?B?SW1RMWkreElBMTFBdk9lbFFoTC9pc0pQbzlxMTBLejBNc2ZoUFdHVEZWTXNh?=
 =?utf-8?B?R2RxcUJTNmRselNLa3F1RFhFdUNscDNKZ2FBTEZENWwvOE5oNEx5R1BPZ25h?=
 =?utf-8?B?b0gxckJ4b3U5LytKSWxZQjdiOUVXbGpjdFZMcUQydGxsbFdTaWxKQjZDelB2?=
 =?utf-8?B?Y2JCV3VZUUV1YlVkUFlJUzJDWDA0TGYxdVB6TWNRL2p6bEt5b052ek5mN1Rz?=
 =?utf-8?B?YmxLaEVnVTRwZTBpYlRsVWFkU21hNzFEMUsrMzRmZmdXSGwzRVR6Z1RGNjZu?=
 =?utf-8?B?VlpjNCs2b3JISHJySHloYlRBZVhHZUJXYXVmd1ZnWEVmUWdFN2YreklNSnhF?=
 =?utf-8?B?Z0NKQ1VxaDlsZFdqVEpTRDhYU25yWjkxWldCRUF0SzRsOUI3LzdqNEFDSU5z?=
 =?utf-8?B?US9oQ3RDOCtlNkZ6OEZrMG9rbUlqZS9aWVdWOUNjQ3VmNGRWWHFWUmhaeXVi?=
 =?utf-8?B?WXMyOTRUTGNUaUFlSUNhUC9KbHFPRG53M1cyS1cyV0VzTTJTblErVGtOVWs0?=
 =?utf-8?B?bWpVanlhaUtiNFdnZGtlZ1dBd251akdGakREMXg4R1plQ2swZFdXUEpuejNE?=
 =?utf-8?B?OHhJa2VIMC95a25iTDNZK2tBOEwzZTNuRDJvcjlOOEpKejQzTENzdGJyaTVS?=
 =?utf-8?B?QmFvQTFHN1A0UHNGSjFTOFd4bXVheE4wdGdRSFBLcEJCZ1U1cWQwZTZ0TjNN?=
 =?utf-8?B?VWM0TjloUkJDYmZlcVd2SFR2RXAyQzluK0pJWEt4bWs0MFdjRXFkUE1mY09J?=
 =?utf-8?B?a1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HL3us6sqS72ra6RbpHo4bCZAhCyQpAd7HiO29CwFRmzaG2W+dOTqLqlXFwmDHdX5BNfiJEG1p4Bd1dzNsQKyxXGcfBoaURnGZXFPG84wCVs43Q8jOZvk+7PR3gZKUryG48KDaTms5RjAk7/4VG/GxTg4s6DsYuGp5fgzHIKl6iE3KdvUmYdYGti7Wo7wWUn+t8b+qHzcXcM5XvRPW2HVOeCTtzrMzKBPirWLVFjGFV6hQ6Lk87DtYf/WwnsS5Ropbdsftp6ZQ6z7776rJg7z/piKA9RK5c4p6703rO0LwPVNA5MkQIUk5lyzGeitzeL3MsalIzy3DXfIYMB6zaJZ54RZI18MGP2kMhiDpzCzJTkE/DrzsZAm2+h+Gw3o5KZC6jAqZq1lo4Ph8/5lxhv0L4r4qy4WfOHXJBAlxdifYyH7tgag49fcR9tKNyJuuzV5UMxRM4sYVfGVrnkJd4fU/vmdvFnKX+oXbhxHjDND8WepvwRtRgazaa0FfoDW4knpOnubPxiK0CIIsFsr/FqKw7y8UH7CUsz+NqN3eoCq0lrjnGTL7dAZasWv/MAZTxrqowb8UEUhXmpSEKL6vxydMCYrGE8NfV/uRPscER/uflD3K4rOZw+CapUsgvodnTKBq36PdGBLk5t3958dJ/FG3gkTOhrFseb/0ZUqA2F/5neokYivnARZLvG8hWy3vrAwk6XyT8hcnQ8/BtccFVVnQd6VXbM71Totvhs9v9nXvLzNHFiUG9MssehGaLjL6qp6aYeidVTYcOuc/eRAxzWTPzNRZ5wkeE0nCAVvhIR2AbyQZ5e7sa0Z04rtNWaF+vhAJpZwSNAwh1mQuKYZkW26nc9oA+9BehhZH92TzOH0loM=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 746ca7fc-7a9b-4b69-21bb-08db3f36b43d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 11:27:19.0248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aGdtP0zU7L2/u7iJvwinN3yygU5PYll3UxD1ICylToV+xQGkchHgeIgh0M9oPZwlEW/AvT7fzaFmVkAnjmruO5JfcNCatuIk59VQxhxNevc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5277

On 17/04/2023 11:28 am, Jan Beulich wrote:
> On 15.04.2023 21:58, Andrew Cooper wrote:
>> Right now, trying to apply a livepatch on any system with CET shstk (AMD Zen3
>> or later, Intel Tiger Lake or Sapphire Rapids and later) fails as follows:
>>
>>   (XEN) livepatch: lp: Verifying enabled expectations for all functions
>>   (XEN) common/livepatch.c:1591: livepatch: lp: timeout is 30000000ns
>>   (XEN) common/livepatch.c:1703: livepatch: lp: CPU28 - IPIing the other 127 CPUs
>>   (XEN) livepatch: lp: Applying 1 functions
>>   (XEN) hi_func: Hi! (called 1 times)
>>   (XEN) Hook executing.
>>   (XEN) Assertion 'local_irq_is_enabled() || cpumask_subset(mask, cpumask_of(cpu))' failed at arch/x86/smp.c:265
>>   (XEN) *** DOUBLE FAULT ***
>>   <many double faults>
>>
>> The assertion failure is from a global (system wide) TLB flush initiated by
>> modify_xen_mappings().  I'm not entirely sure when this broke, and I'm not
>> sure exactly what causes the #DF's, but it doesn't really matter either
>> because they highlight a latent bug that I'd overlooked with the CET-SS vs
>> patching work the first place.
> Which perhaps warrants a Fixes: tag at least for that latter change you
> mention?

Hmm yes.  I meant to do that and forgot.

>
>> While we're careful to arrange for the patching CPU to avoid encountering
>> non-shstk memory with transient shstk perms, other CPUs can pick these
>> mappings up too if they need to re-walk for uarch reasons.
>>
>> Another bug is that for livepatching, we only disable CET if shadow stacks are
>> in use.  Running on Intel CET systems when Xen is only using CET-IBT will
>> crash in arch_livepatch_quiesce() when trying to clear CR0.WP with CR4.CET
>> still active.
>>
>> Also, we never went and cleared the dirty bits on .rodata.  This would
>> matter (for the same reason it matters on .text - it becomes a valid target
>> for WRSS), but we never actually patch .rodata anyway.
> Maybe worth making explicit that this (the clearing of D bits for .rodata)
> also isn't changed here? Otherwise this reads as if you meant to deal with
> this as well.

Well, it is dealt with, but in a roundabout way.

With this patch in place, we don't relax the perms on .rodata, and never
crash in either alternatives or livepatching.

So we never actually write to .rodata, and never set D bits, so there's
nothing to clean up.

If in the future we do find a usecase that involves writing to .rodata,
then we will need to relax the perms too, and the D bits will be cleared
as a side effect of re-tightening.  This will also involves extending
virtual_region with more than just the .text reference.

>
>> --- a/xen/arch/x86/alternative.c
>> +++ b/xen/arch/x86/alternative.c
>> @@ -382,24 +382,28 @@ static int __init cf_check nmi_apply_alternatives(
>>       */
>>      if ( !(alt_done & alt_todo) )
>>      {
>> -        unsigned long cr0, cr4;
>> -
>> -        cr0 = read_cr0();
>> -        cr4 = read_cr4();
>> -
>> -        if ( cr4 & X86_CR4_CET )
>> -            write_cr4(cr4 & ~X86_CR4_CET);
>> -
>> -        /* Disable WP to allow patching read-only pages. */
>> -        write_cr0(cr0 & ~X86_CR0_WP);
>> +        /*
>> +         * Relax perms on .text to be RWX, so we can modify them.
>> +         *
>> +         * This relaxes perms globally, but we run ahead of bringing APs
>> +         * online, so only have our own TLB to worry about.
>> +         */
>> +        modify_xen_mappings_lite(XEN_VIRT_START + MB(2),
>> +                                 (unsigned long)&__2M_text_end,
>> +                                 PAGE_HYPERVISOR_RWX);
>> +        flush_local(FLUSH_TLB_GLOBAL);
>>  
>>          _apply_alternatives(__alt_instructions, __alt_instructions_end,
>>                              alt_done);
>>  
>> -        write_cr0(cr0);
>> -
>> -        if ( cr4 & X86_CR4_CET )
>> -            write_cr4(cr4);
>> +        /*
>> +         * Reinstate perms on .text to be RW.  This also cleans out the dirty
> I suppose you mean RX here, matching ...
>
>> +         * bits, which matters when CET Shstk is active.
>> +         */
>> +        modify_xen_mappings_lite(XEN_VIRT_START + MB(2),
>> +                                 (unsigned long)&__2M_text_end,
>> +                                 PAGE_HYPERVISOR_RX);
> ... the code.

Oops yes.

>
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -5879,6 +5879,77 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>>      return modify_xen_mappings(s, e, _PAGE_NONE);
>>  }
>>  
>> +#if defined(CONFIG_LIVEPATCH) && defined(CONFIG_HAS_ALTERNATIVE)
> In line with your observation that this wants to be ||, ...
>
>> + * Must be called on leaf page boundaries.
>> + */
>> +void modify_xen_mappings_lite(unsigned long s, unsigned long e, unsigned int _nf)
> ... perhaps use init_or_livepatch here?

Ah yes, missed that.

>  At which point the #if may want
> to go away, as in the !LIVEPATCH case the code then will be discarded
> post-init anyway? The more that HAS_ALTERNATIVE is always true on x86
> anyway.

I was considering if there was a nicer way to do this.  One idea was to
end up with it in some kind of lib-y form so it gets pulled in on
demand.  But that wouldn't cope nicely with putting it in .init for the
!LIVEPATCH case.

I think I'll just go with init_or_livepatch and drop the ifdefary.

>> +{
>> +    unsigned long v = s, fm, nf;
>> +
>> +    /* Set of valid PTE bits which may be altered. */
>> +#define FLAGS_MASK (_PAGE_NX|_PAGE_DIRTY|_PAGE_ACCESSED|_PAGE_RW|_PAGE_PRESENT)
>> +    _nf &= FLAGS_MASK;
>> +
>> +    fm = put_pte_flags(FLAGS_MASK);
>> +    nf = put_pte_flags(_nf);
>> +
>> +    ASSERT(nf & _PAGE_PRESENT);
>> +    ASSERT(IS_ALIGNED(s, PAGE_SIZE) && s >= XEN_VIRT_START);
>> +    ASSERT(IS_ALIGNED(e, PAGE_SIZE) && e <= XEN_VIRT_END);
> I can see why you want s page-aligned, but does e really need to be?

To be honest, I copied this straight from modify_xen_mappings().

I think the logic will work without it being aligned, but I'd also
consider it an error to pass in a non-aligned end, seeing as this
function strictly operates on pagetable granularity.

~Andrew

