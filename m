Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5B5306246
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 18:41:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76320.137666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4ooh-0000es-6W; Wed, 27 Jan 2021 17:41:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76320.137666; Wed, 27 Jan 2021 17:41:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4ooh-0000eV-31; Wed, 27 Jan 2021 17:41:19 +0000
Received: by outflank-mailman (input) for mailman id 76320;
 Wed, 27 Jan 2021 17:41:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=csCD=G6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l4oog-0000eQ-7e
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 17:41:18 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d171868-358c-4e06-ab45-99b101414c2c;
 Wed, 27 Jan 2021 17:41:17 +0000 (UTC)
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
X-Inumbo-ID: 7d171868-358c-4e06-ab45-99b101414c2c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611769277;
  h=subject:to:references:from:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=yQjP6+WeNgo1q9AJN9Xgg4evSG4Ynh197qZcYlKg4ig=;
  b=dvTwENv/DW81s9WJ/kh7DnBRrzeNk2WJfAAVLOKI6rpATTKOYyPZqfRm
   z5eoV35ZGJOPTmHV8p/Zo9huJ1PLZ+Mf1qluEBMudvlHQj4ZimnwwIJyR
   czknyHeZQ/BWU/9JSnbicRaAL2dnkhjv8gkScHtdBIMIpRGVfKUaFEo+O
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: fA6HBVkWD0p8qqgf8k6mhrfiui/T6AVkfn+oELTemyMR32wlxZ8n9e1zNBLjzAbX42njbfvO3w
 G/JWUyyeI9d95ir6/3LthPrA+AF7k+ynKP0PLvja8JE4EFn9AKCS4w25QJz5y9CO6h3o50h3NE
 NgBIa5KL/OC/HcnJvzpYZe9LNPJUIj7zxcAOXmvXRmZm/wlSP06DS1ZKWAJemvd3GBgelA6qRS
 qnOFSbMJ8Y32aF59GrsbNw+7VTVp6DGc2bKn9HgW1+n7XR1cdSxxE5at0OK4iKz+bTa2KRYXrX
 wHc=
X-SBRS: 5.2
X-MesageID: 36188525
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,380,1602561600"; 
   d="scan'208";a="36188525"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/eIFIRowJTyCwFfhO/mi9UL/w1l91qxzf0/JJw/OCWqBagNxa9aYk1yNsC7UfrGZdf5MqHkXEo/5KqJXmnrAIYS43GJqxWchQkDuI37jL12kJILVtX6Bd8GT2mF9ca+8bHEfxTUtEisxld3e6lSHb0ouNQkUg+f6xVTy+m9X8AqITxz0Wv43m8X9fzMgodxxR6gPBZfN4tUV9Og5ySaLxxI2dXahkQ92XWHzTb3EycIQ0qEu1PzLreYy0qKgpdz77bQDWSppQMoa4CdXAGdR5RLNcYVwXlGNYda7Y/je/gQlN/AOUdvh4HObBLABBQi/Nu0jNqM0PhqAHSmvy7+Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQjP6+WeNgo1q9AJN9Xgg4evSG4Ynh197qZcYlKg4ig=;
 b=QH6m8BvFZVWp9yRO7W6m7LzeSy1Vv9Nhiys/RDW+B0OSZ0/bQc5IosSKoviQxpf4dEL+SCD+49Mncf8aGvHE0DBjholZzSzMKfDzNgo8K23td/3+d5H2u6rmz6/eZr2USrRqPyhjqBWNrOcEpjTdSSfmMwz7TBBu8Z6uKxrm5H6jYvLR0YQ2BngC+kD3BdCY0SFesMtm6+A4fCbIO8MJ1MbDiVDTw6z1cJSL23BUVDouydM2S8awXFX5dzDsjxNXUVGr7JqSLAQ1tvi4SXek5Kso8jLH8/78dheOfswCXNmHCppPbDVVN8NbPLwzpsBmYrzYZQ5Bf+z8o/EZnnBCSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQjP6+WeNgo1q9AJN9Xgg4evSG4Ynh197qZcYlKg4ig=;
 b=UihYNk5slxsq3HbXWO+d2zXxG/1EbKAQxcRcGVx9XwpE9Ui1VSo7Wi+W7tfh0a+N5KahfmgEtTza9HkPf28edNzEfSdIlUsZ/Ls/vvAPCvkgJE+phlcsBzmJ2Zl9g0HQ+XjOL03RA+o0txMrgozWa7pKnpBX7EXsJza95sY2yBA=
Subject: Re: [PATCH] MAINTAINERS: fix entry for LIBXENLIGHT
To: <xen-devel@lists.xenproject.org>
References: <20210127161711.24005-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <669cdb63-6c35-e716-7d44-9b36f774772d@citrix.com>
Date: Wed, 27 Jan 2021 17:41:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210127161711.24005-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0448.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::21) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2116fb7-d6c2-4a96-e20f-08d8c2eabd4a
X-MS-TrafficTypeDiagnostic: BYAPR03MB4661:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4661BD1E987D8A6C11E17D66BABB9@BYAPR03MB4661.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oDQLXUNOASyE0COSPI88yG1IbqPsQhcaXB90ZYzwm+HMMcDEu5Ph+jscee11Thel1EF5D4RrrxL2DZNAbeEKYFmtsVHYUTwEZbrVGrQ6DRK8m4vWRFdbbvoQyNm+S7EvCOPIZWlHUpvHv9mlnNOPDDX18aqXGhZFltEKjiVPX1M8zlJ/M5bzNRz+ND3mPwUTJ859va86/2AHIZmsd5IVSMxzS9SVNJSDmp+q3nZns7oXvETN+Nh3J+Vc2yYQNdw8e82XZqXsv+wC/NYPdC7kIemyibs/qP+Nt16SrmlqCym8tkveJ4meuUghwBDYE6sUYg6sXlWq1d/L5dblTTwcXDAwN7Y+kQWxMeOFLnfJXmN50cUS5GkBe1qVm6vlcek1wY5aHSWyVrYSL/7iHxoJ1itF2dBpms7eOfcd+gs3ibEn+7A5EYF+n6NqKH3KA9aggrx3Vx661nzybDKG9luj1V5ZKM9RXCkzSCJasWEiK20=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(6916009)(66476007)(8936002)(4744005)(6666004)(2906002)(5660300002)(66946007)(6486002)(956004)(31696002)(36756003)(26005)(86362001)(16526019)(8676002)(478600001)(16576012)(186003)(316002)(2616005)(66556008)(53546011)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NHRLbnU2eGsvaWhabEE1SHRzY0JPNlNXN1NydWlTZlRtZG1JVGYzc0pBRUJG?=
 =?utf-8?B?SnhuQlBuK0xiVG1aa0Q3dmdjM2tBSUtiY1krU2tjSGM0Rm1Kdm5TcGRwVlNm?=
 =?utf-8?B?ZE1TV255WitHd1Voa2xxcDg4MG1tOVZIQmRQVzNwU2t6ajhNK2NRVElna3hK?=
 =?utf-8?B?OU9VbGxwUXpiQlFMQ2xLaWp5TW9yUXBhYStsSmtOVDFVdjhsazdUdGdXdThp?=
 =?utf-8?B?Vy9iT2szR0JhQVpjdEF0TSszZmN3Y3FpQU1CUXdQaXN5Rm9lQ2x1UTIrZFps?=
 =?utf-8?B?OHBHb2szN2NPcFZPbndqOFdqb3hoV1NKRkRvRCtGSytnblpxbk85aEU4bG4w?=
 =?utf-8?B?M1BwVXV5MFlrN3l4M0hZNDAxWmV4YS81M2d6QXBRWWlxV2RBSjVWTmlJZmlP?=
 =?utf-8?B?Vno1Z21SeUphTllTazBTR3JHY0k0c1FYQUYxa3haR3FNNGJYY1hKRGVjYTJw?=
 =?utf-8?B?VGRVR2E5TnA3SmhTZ3A5UkxYajh1OEJobFlKN0hrYXZmVk4zQXBZZU9MV0c4?=
 =?utf-8?B?K2NTZjRhQUV5azJsU3oyTGxvMHdNcTB2S3RnNEhKZGQxa2tGcEl0SGlJekd3?=
 =?utf-8?B?TlVvWkFYbFhkamRZRmIwMmNuMHJ5cEpkTkpsT0RLSWxQVUxIYk40TndTS0Nn?=
 =?utf-8?B?Vk8rM2NORUN3YkM3cWMrQnJnbTFRNWpSSWJkTFFzQmtDZjdxSzlmT1hmY2x2?=
 =?utf-8?B?eTFTQTQzUDZ4eUhEN0J5aEJxbXQreDZIQjdCZG9QSEZNRTk1a1dLSUFxcDJK?=
 =?utf-8?B?RTVEa0xGb0pSQmE2SUhpcVVxZ1BNZEZxM3RRVlhXNlhoenl3OWN4NG00RmUx?=
 =?utf-8?B?UFpGSFA1bkN3R1Z2d3JJU1I0N1lIN2dUM0NMcER1ek1rc0J4ZUl2blA3OGNa?=
 =?utf-8?B?K0VyM0FhbnZ4alRzaUZ5T2NNZ0JsRlU5akE5aGoyQ1J2bFRHRC9pS3p4UlJH?=
 =?utf-8?B?YVhTaVFUZWY4YjBYZmk2N2FqVndHbG8rc0FNeEYvWms3UjUxTzRja29ZYXJO?=
 =?utf-8?B?UEVnWXczR1JkUUt3TWk3MlM1MVJsTTlHbUpHUTQxWUV4Qnc2Ym1IRHM0aU10?=
 =?utf-8?B?VG5ybktnTURHeVMwWGVnS0NkMGxJRmVsVmtZTHkxVmxHTFlCNzNBYyt2NVlE?=
 =?utf-8?B?WjFrdklEY3B3cVVTOG1MVkt4ckQrUWJEQlFOblJORTdKdHFmNCtnZVlaV3Zi?=
 =?utf-8?B?SjRKTXRhdUY4VlRzOUI3T0Zid1lCSlIrc25lUTZKWk04WDh0TlJXTXp4d1Vs?=
 =?utf-8?B?bnZwa01odGFCSVZIVzJsR2lRWjhoN1l6UGtNYmVISTFFUkVlL2M4YmNXdFBy?=
 =?utf-8?B?UVRLOTladktJQ1ZSZmdDOVB6eTJwbWZaUVFlYlE0aGNOV2ZseTFydGVLNkpi?=
 =?utf-8?B?d3hCUjBocVNCa0dvWU8ySjF0eXBqaTF6cXVuUEw3WDFNY1dvYm1jNlJ4dDRz?=
 =?utf-8?B?SGJGalltMFJwTExKaWZra0lUSE84TXJ1eXUyelFRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2116fb7-d6c2-4a96-e20f-08d8c2eabd4a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 17:41:12.8181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ISaGLG66GWLAe6mTo61obin5Y7l2ZpodiCGEf5Tz/E7hoPs2uve4UYLPq+XCZTaBEtJwuvk/cfC1UOY7Sc6FIHh6WOzVEzFfPrpdXJwKUqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4661
X-OriginatorOrg: citrix.com

On 27/01/2021 16:17, Juergen Gross wrote:
> When splitting libxl into libs/light and libs/util the related
> MAINTAINERS entry was modified in a wrong way.
>
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Fixes: 032a96e5ef38f96 ("maintainers: fix libxl paths")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

