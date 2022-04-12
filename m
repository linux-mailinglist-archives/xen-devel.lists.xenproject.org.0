Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA1F4FD2E5
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 10:22:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303500.517772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neBlw-0008Lp-Fj; Tue, 12 Apr 2022 08:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303500.517772; Tue, 12 Apr 2022 08:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neBlw-0008Js-CP; Tue, 12 Apr 2022 08:21:12 +0000
Received: by outflank-mailman (input) for mailman id 303500;
 Tue, 12 Apr 2022 08:21:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=to5A=UW=citrix.com=prvs=094341a74=roger.pau@srs-se1.protection.inumbo.net>)
 id 1neBlv-0008Jm-8a
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 08:21:11 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c2e1a01-ba39-11ec-a405-831a346695d4;
 Tue, 12 Apr 2022 10:21:02 +0200 (CEST)
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
X-Inumbo-ID: 7c2e1a01-ba39-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649751662;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=HX+0BXw59w9MMWUggtUoOxn2iv1W+tdLpsPP5ulacIo=;
  b=PkQDFoMgSvq15wY+vrkI0z3BIOxyUYJTBZgfk2y1lQlDRTDSg5u2CjF4
   qr3iuBy66GCxZDzpeKAr9utixsZDeyzBLNsL74SQPJz1NEre4wSip014r
   u+MLZxnnNsOoBTyhWgTIfDh2iNzcHZVhOkgYj2itf0dDWo2yLbrMIFsLa
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 69055900
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:WH1gVan1xDY17bfmC3REomjo5gytJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKWWrTb6ncN2X0Ltt3bI+x8EhU6sPcmNUySQJlrHsyQiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DlWlnV4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYQgx0Me7XseImUiJ3DjhRJYQe5qH1GC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZvwCufFf87aZvCX7/L9ZlT2zJYasVmQ6eGO
 pdIMWIHgBLoODwQZl0UKMMCpvanuHTDdD5x9VvPnP9ii4TU5FMoi+W8WDbPQfSJSNtUmACEp
 2vA12X/HhwecteYzFKt6nuxgsffkCW9X5gdfJW6/PN3hFyYxkQIFQYbE1C8pJGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM+e8CMVjtlvLkPCNpV/EWC5UFVatdeDKquc9TmEll
 USgmejoPhNyqZKNYCqD6IWt+Gba1TcuEUcOYioNTA0g6tbloZ0ugh+ncuuPAJJZnfWuR2iun
 mniQDwWwuxK0JVVj/nTEUXv2WrEm3TfcuIiCuw7tEqB5xgxWoOqbpfABbPzvacZd9bxorVsU
 RE5dymiAAImUMnleM+lGrxl8FSVCxCtamO0bblHRcRJythV0yT/Fb28GRknTKuTDu4KeCXyf
 GjYsh5L6ZlYMROCNPErMt3pWpR6lPW6SLwJs8w4iPIUPfCdkyfdoklTibO4hTixwCDAb4liU
 XtkTSpcJSlDUvk2pNZHb+wczaUq1kgDKZD7HvjGI+Cc+ePGPha9EO5dWHPXN7xRxP7U8W39r
 ocEX+PXmko3bQELSnSOmWLlBQtRdiZT6FGfg5E/S9Nv1SI6QDpxVKKLmepJlk4Mt/09q9okN
 0qVAydw4FH+mWfGOUONbHViY6noRpFxsTQwOilEALpi8yJLjVqHhEvHS6YKQA==
IronPort-HdrOrdr: A9a23:k5b+wqPVLgYZkMBcTqKjsMiBIKoaSvp037BL7SBMoHluGfBw+P
 rCoB1273XJYVUqOU3I5+ruBEDoexq1yXcf2+Us1NmZMjXbhA==
X-IronPort-AV: E=Sophos;i="5.90,253,1643691600"; 
   d="scan'208";a="69055900"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4DWs21IBPKA8leOB3CfDkXRHEnSq/vDEysexurnJBzOb9t69Hzn0krwLaINMdgtXFBAkdo4aJe8r9oEUyzBoS60Cu8Mdea/hWTKk414mehIGG65kVBmhjnKHZ0MgJ7KcJXRqOqZicVRxV7I42Z6h7IL74Vt5VwF1HrUmrNIplELlvSpor7NNYnXcLoN0S8anc+LCHjq4GUVL0+AfNqyo6ITusl0GVc90qlEXSXwDL+n/kUrjtcBlxfyDKbxGYWCraJaamX/bVGVelwlmEI2gKeaiORt2gntcIBA6xgC0rKceSPdbg3WGuRTnFDD0IS8e57TOVaFd38LnnlGwiMM3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RF55FxR8w3EPl9TKIwZBkM0HACdcA+tdbUN0mYxhYJg=;
 b=nVdIoO9eAMwqLLA5FOaTtJX6BHYKh71ItNqPUORfO7M/TYBtVlz3FB7y7M6gG16FKDTIZ35QTxE33RG8cRVCmGik5VR0yvzFIcn/oWIUaC6VuWG4flmyB38lbrKgRUsHFyZbu8WIg08Q+h2p6y4xtyU5hCokvtiVZlHXMJEB/WNnFQnS7o+JzxYz/0JeQksPvwiGbzrRCtZHFbKK4fYJOrVtGAeNdxAY7CC8O9pJVg1JrppJjG3e+vcZzPDYbt+vHjEmtPHKb1+BhvSBRIqGnHCjzGSCUw7ECCxBw8qpHdugfkfCu57Q/7b20ckbyMdDQd6+zUT/stHxzYNygbn0AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RF55FxR8w3EPl9TKIwZBkM0HACdcA+tdbUN0mYxhYJg=;
 b=Q/7Gl78Y2pvNMQV8+fG9heO9gAKwD5qREgStHSHyzQrnvlLSJIFrT39vE6K20hmhGU8FEYXRyZLfCokGVvI/QqFx6jlF0hhEznRpEknDdf/gElnTvgoHP8Gh37k8xRchTaBMxTgdB0dVEWHXuix9Qrgn6FuSBPyIjIRyd5D2PNc=
Date: Tue, 12 Apr 2022 10:20:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Kevin
 Tian" <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 2/8] VT-d: drop ROOT_ENTRY_NR
Message-ID: <YlU2YRC75sQJciSK@Air-de-Roger>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
 <ad944163-e8cb-6ecc-7e6f-400f9e8cd4bd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad944163-e8cb-6ecc-7e6f-400f9e8cd4bd@suse.com>
X-ClientProxiedBy: LO2P265CA0314.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf0b286e-d4c4-4c7c-756e-08da1c5d5dbd
X-MS-TrafficTypeDiagnostic: BN6PR03MB2657:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <BN6PR03MB26573A28E7730515A488FF668FED9@BN6PR03MB2657.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M5RjSRW/xZUvZHZfQzvmVCN2c6TX08VORowxLmJlOIYv9as2iDFnahtHONrh0uEO1p3I4A67yHQWDqn54VfZEfnV71LurttI0iltvsv1AXnpEzfht3Jpzq1Yg36sJO8KRDOF723vg4VyO06FzTHpc5XeO9cEJS/lyTdN55XvFIQvG+pNKVQYFCk9B9Y9tQFoOso9Nd05zEfGGilWcA5uUL85InzHxWFQI77UTwmhRXfAEH7yLRi8k2Yw6A25LYP3PvH/HkIjQeB8ynE0dwX05TbFr5FH5/RrLyWrskHVMTYrabO/F9B+01NWDnssCOpLvbx+ykySfVoSwn2cXuT2sJAP/dFZoLSLv4RB9FFDW7jFRteEXfkhBmjoyqgiZ9RX2RUUuz4bOSExXd69E6ycvgIofPkq4cG3DegRjKLnUJLPZZNILmc1ChDiUuoz2D3NMuXLXiVla6u544NInTXDDeS14j3BpOk2+jyg0/Maa9xbRnnryGCdoTbNmncc8KUq12Lfg4wGSBDQ3Rl7tmZVgSBNH9ZwQu3w4suoOAqN2KoqqpafTdRukz4LpOq1DmSVQg4xn4c7Uo5ozDJ2/t0PAd1AlmTNmwYc/RwXXdrosnKwvSO9CWD8zqBjnlqZEYwB64Z8A3b19MpnRXxUPfS4ig==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(85182001)(2906002)(82960400001)(8936002)(66946007)(66556008)(33716001)(66476007)(26005)(186003)(5660300002)(6512007)(38100700002)(9686003)(558084003)(8676002)(508600001)(6506007)(6486002)(6666004)(316002)(4326008)(86362001)(6916009)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nms1OUhlTTlHTENmYmRPNEJKbW5JS1FxdEtJeFRZKzB4cWlUV2Z3dU5saWd6?=
 =?utf-8?B?WG1NL3kzaVhOdlBwcVhVOXljdlpHNUFDSGZ0dUpZYXQwQU44MklLNkI4ZzZl?=
 =?utf-8?B?UEYrTFZqREZrMllVeEc2V1hyV3VKN3lCWkxZN3ZJMkJxSFdONDdYZDd0dmpz?=
 =?utf-8?B?aVIvUDZWMzhvR0RINzU4RXp5d2NycUFNMGlrcHNzM1JiWHBUa0NUbXlJd1h6?=
 =?utf-8?B?akFQQWRITVNzeTA3TWN4M3N2NngwSHlIR01CMTRubG9uREJ1OTluaktZeDhR?=
 =?utf-8?B?TUE1emdUckFjRTFJQXNTYUZLajNGc2JRaHdGTTl3RnhKYzBqR1RQQnptQWtH?=
 =?utf-8?B?VmlVNUtyTTMwU3NYVFBtMGM2QkZ6OHZuZW5vQUh2dWtxekxVZFgwRDRpUCs0?=
 =?utf-8?B?elIvRzBYM2N2UWhsOU1VZ3Z3Y3dNMEFXRTR5SGg4Vmc0TVowZGtVdzU2VEc0?=
 =?utf-8?B?SlBPRnQ5b3VseEVKNlVya3Ixb3psQW1ZNVVxT2tsbkx6M1VvcUxoWWxmSHht?=
 =?utf-8?B?Syt2c0NPTWY0eDZMUkJOdzl6cnh4ZkZTR3JwYUhWTU1haG9YeDVMRnFBZFEx?=
 =?utf-8?B?QzR2UjlRNGtCelNIeWY4bEx3Mi9hd3MzV04vRmJlZXhlQXhZVkNFNW56dkpD?=
 =?utf-8?B?YXhva1FWNU12V2xKTDdDWWFYdG1JZnBlMXJLTW01MXhpTWpGMFp6c0pUY0N2?=
 =?utf-8?B?ZFFIRGwyeTYzL1FyZGx5REhoVmhpSjV2SmtocVhYaWJiT2RqWkdGVUVuR29M?=
 =?utf-8?B?Z2VxVHNDdWVSTGZ5WWNiZzA3NjE0MFM5VTdySnRCbEJEdnBvZ0xhV1ZadE80?=
 =?utf-8?B?NTFqMGUyV1paRzRqNWZUekd4RjdhL1gzVTdFS3V4cHlXM3FOTERYZlF6Unhv?=
 =?utf-8?B?MzJkNUlxQmNtSGZESzZvUmwwanY3bmtCYSs4a0syUFhac3J3NGxsVlNJTVUr?=
 =?utf-8?B?QzdVR3ZuMXFtZUQ5YU9xQVpXeXRyaWhGRUk3bnZSZGVNVnp1TmMxem9rTkNv?=
 =?utf-8?B?UlgrdUh4MU5HZDhkL3dHUHdROXhJWEc4b29Ga1RPV0ZUc3RnQ0hhRURaYUNG?=
 =?utf-8?B?V0ROZXlidHBZekw2cDZyV2tHbU5JOGlHMlBOV3doY3Nqa00zMldKZDQ3THpt?=
 =?utf-8?B?V3AwUmZ1dW9vRjBadmxqUkhCcEtBQWdyVlFneFlhOFlVM0hBWStMVERSUHR6?=
 =?utf-8?B?UmdPcmpvYis0Rkl6Z01LWitHeG5BWEJJLzBlVFlsN3BjMmZrcUloTU5pMDRQ?=
 =?utf-8?B?UERwamNtdkxkUkRwVkJ4OTRDRFB3NUVsSXozdDJsdi90YzMwVEhwbEdwZGdX?=
 =?utf-8?B?alJTbDZrVmdFVEZQU2FCb0NjbVRVaVg3NHhIRDJsMzkrQWJmR1ArNHZmR0la?=
 =?utf-8?B?aFhlbC84NGh0ZElCV3NYZnk5a1kxVHN0ZVhBc0FIV3JoVU9Zb0hvYWpYWm51?=
 =?utf-8?B?a0VHUHdTTC9GZUg1eUwxTzBWV3FuaEJLQVVJOHU2M2cvTmNqNWVsZXFyODNv?=
 =?utf-8?B?cW9PbFN2cWVRLzZjeEI1cVpxM2paYXVhTVlUaHpsdjNPVDhwOGJrT29ORWdX?=
 =?utf-8?B?NUJSOVZUbXk3T2xlVk9sY1h0Wm5VbjRBcG5IMU8vb3BOaU43dEZqd2RGWWth?=
 =?utf-8?B?UThCVlhNd1QyRW1nQVFqZWt3YWJSZThGS3FpaWs2dUd4V2pKN0ZyclBPQ050?=
 =?utf-8?B?VlFxcHVXMEdpbEtpQXdONzRSdWxlL0czbEsyb1pncVpIZ3JqYUUyWVowWklM?=
 =?utf-8?B?ZElCVSsxN0xzWHNvYno1TTJSVE5zOXY5UmN5Sm9jb1ZzSTlHdFhEZmhLcTlD?=
 =?utf-8?B?NlFFU04zejUzblo3c3FFeWYxM0VSL1JFNTBuSG8vN0o0NDdNdDNYejBkb3g5?=
 =?utf-8?B?ZDhDYnNqdWtoM3ppeDZ3SUFIdmxkZFFidVZqVGd3cWRCOXRWYnc4V21JWE5L?=
 =?utf-8?B?UkdWTXJMLzdZcXRLYnpsNkhkM0VEMjc5V3dIWE00WERmbTVaS2ZQdE9VbTlK?=
 =?utf-8?B?ZlhOS3EvUUUrMUdkNkxjSFJnSThudlhnSHBTZFVjdHRvTnFzL1VPWFJlVFRj?=
 =?utf-8?B?MnpublVLVUpGTTdOamt5dmZZRlMwbWN1K3RBbWI3ZkFKZC9hYVRNQ0daMUhn?=
 =?utf-8?B?ckpGTEJkVzhEenZxT1hiZ2hROU52eTEwWjZkWXBRL1hhZmxncEJBK1doM3Jn?=
 =?utf-8?B?dHRQV09uUXQvR1dpY3EzbHR3Q1JQRDJEMVVPWDNYK1JhL25UU3RLL3dRYWlt?=
 =?utf-8?B?MjF0WmNyMGcwWmQzb3ZNOUJPRGd0M1RjU29yRVJNYVBYSG9QdXpTa3lNVytX?=
 =?utf-8?B?MkN1WllJMXhqNHFMRlpoT1VEeWFVb3h3ampxUFIva2cydXc3WWhaQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0b286e-d4c4-4c7c-756e-08da1c5d5dbd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 08:20:55.7986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6IrSoEyLdbnvIXlOWjSjxt072Oqww2KEb6TOrB4+UIh0ocmVUolDkR/1CkueO6Py8eFLqY0Tndi6YMhIG9Jt+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2657
X-OriginatorOrg: citrix.com

On Mon, Apr 11, 2022 at 11:36:23AM +0200, Jan Beulich wrote:
> It's not only misplaced, but entirely unused.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

