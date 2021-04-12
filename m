Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C6E35C56C
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 13:39:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109023.208093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVuu8-0005cN-45; Mon, 12 Apr 2021 11:38:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109023.208093; Mon, 12 Apr 2021 11:38:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVuu8-0005by-0p; Mon, 12 Apr 2021 11:38:56 +0000
Received: by outflank-mailman (input) for mailman id 109023;
 Mon, 12 Apr 2021 11:38:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lFJS=JJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lVuu6-0005br-Jt
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 11:38:54 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3744c76-32b3-44c0-a9e8-61bb61cdf56a;
 Mon, 12 Apr 2021 11:38:53 +0000 (UTC)
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
X-Inumbo-ID: e3744c76-32b3-44c0-a9e8-61bb61cdf56a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618227533;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=h7jlH8FNvx+QMQNEuYpjV+Gcu6RgAn7Ms5M0AtYEV5M=;
  b=JykylWqHKKqNURNmOnjq1rkJz8lEh58jTQcXQihUREaCZw2x4+JUCZDG
   I5fyAS8a5pw6tXHBxSYM0EyeXGhSG+f8DVUPdmyNxXWW5K/SU31D8kZ/r
   bW+gpTvBexCIe7yp7ZsWPAaIpa4bD2uUVfoZgPLA3awZv6vdT1hP932EB
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GXECQchxCo+OJR/vpzxWY17oI1tg1a4W8690EB7DIBJTAELp5sdeUL9iQrHgJXoDEGZGrt2k3C
 zIVwPYbbXLbnP7MjZX5eTr9ReztlcXb1IOquCyJJCAsG9az7D3OMzlUj099ALf9bIpOKr99NaT
 EcSWt2kgEXViEJ3AwG3QKw8T/CmzuwCvetb1c3U5qLp6QabbhnML1JyyTXNnGgJIfjxICAooQ9
 5SoqDcMoebU0wdGJqHLJ8+xYr01XAlTWcpx08bOONpNnQnKhug4nCHIA2pspP6/F5eiMA/MjPw
 674=
X-SBRS: 5.1
X-MesageID: 42849804
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:fOvG6qt5nZxZ+u0tpapuUfPv7skC2YYji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOj7U5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qz6Y
 5JSII7MtH5CDFB4frSyBWkEtom3dmM+L2pg+Cb9Ht2UQR2cchbjztRICzzKDwQeCBtA50lGJ
 2Aou9OoDS9cXoaB/7LeEUtde7FutHNidbaehYAHREq802jijmv5b78HXGjr2gjehlIxqov9n
 WArhzh6syYwo2G4zL/90uW1ZRZn9P91sBObfbstuE5Iijh4zzYH7hJdKaFuFkO0ZiSwXYs1O
 LBuhIxe/l0gkmhA12dhTvI903e3C0163nkoGXo80fLhcDiXjo1B45gqOtiA2PkwnEttt19z6
 5Htljx3/E8YGKi7UaNk+TgbB1kmlG5pnAvi4co/hpieLATdaNLqsgn9F5Vea1wbx7S0pwtE+
 VlEajnlZNrWG6dBkqp2lVH/MahRTAaEBuAXyE5y7ao+gkTtnV4w0wE/dcYj3cN+bksIqM0l9
 jsA+BGkqpDQdQRar84LOAdQdGvAmiIeh7UNnmOSG6XWp0vCjbokdra8b817OaldNghy4Yzoo
 3IVBd9uXQpc0zjJMWS1PRwg1HwaVT4eQ6o5tBV5pB/tLG5bqHsKze/RFcnlNbli+kDA+XAMs
 zDeq5+MrvGFy/DCIxJ1wrxV915Mn8FSvAYvd49Rhanvt/LEIv3rebWGcyjZ4bFIHIBYCfSE3
 EDVD/8KIFr9UawQEL1hxDXRjfDYUr60ZVsELXL3uQaxYQXX7c89jQ9uBCc3IWmODdCuqs5cA
 9VO7X8iJ62omGw4CLp4gxSS11gJ3cQxI+lf2JBpAcMPU+xW60Eoc+jdWdb22bCAhd+SsjRAT
 NOvlgfw9PwE7WggQQZT/63OGOTiHUe4FiQSY0Hp6GF7cD5PrQ1E4ghQ640MQnQDRR6lUJLpQ
 54GU85b36aMgmrpbSujZQSCu2aXcJ7mh2XLcldrm+ak16dq8EpTn4yRCWvTsaTvAYrS1Nv9x
 hM2p5apIDFtSekKGM5juh9GkZLcn6rDLVPCxnAWJ9ZgYnxeAZ7TX6DgBuTjx1bQBuyy2wiwk
 jaaQGEc/DCBVRQ/lRVyLzj/l9PemKBRE5ocXxhvYphFWPJh2Zr3YawF9+O+lrUTmFH7vAWMT
 nDbzdXGA9oytyt/DO+mTqJFxwdt9gTF92YKI5mX6DY23urJoHNqLoPGOVM+o15cPr0tPUQbO
 6ZcwiJDT/xBu8zwTaJrnI9NCQckgh9rdrYnDneqESo1n82BvTfZGl8T7YAOteG8izKQe2L3J
 gRt6N8gcKAdkHKLviIxqHcY2Qddlf9oWuqQ/oprp4Rl6Qor7d3F4TaVzyN9Hwv5mRJEO7E0G
 clBIJ86/T9H6UqWeo4USdQ5EAom9SCN1FDiH29PsYOOXUWy0bGNNaI6YfSobUhAke9tBL9UG
 PvhBF1zrPgZW+/zrYUBKI7HHROZGU94Hpk+vmed4e4MnTiS8hzuH67OGS6arlTVeysHqgRtA
 9z57iz7qOqXhu9/ADbpj1gJK1St06hXMOpGQqJXcpF6cazN1jJoqyk5qeI/XjKYAr+T0QTno
 tec0MMKuxFlzk5lYUylhGIdZafmDNvr3JupRd9llDs3YC64GDUWWF+WDep86l+bH10KXiHjc
 PM7O6C8m/yiQI1gqX+KA==
X-IronPort-AV: E=Sophos;i="5.82,216,1613451600"; 
   d="scan'208";a="42849804"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFdqA5d5nZMqE8Ui/eXnTH/Xwy6a8GR0jkKmL7U0JcGK+HQjm+Kinhn4W6P317m9UFmynQVfD7N65M2jp49FCTcV1KHTPWib9VUs20LkYNbmfu1nXP01jnOOasXT1dMlCcHQOujThxg5fAzZ3DEyhrApLuXFZlEueeJooWJL0xrtqr5O5IoksrS9b6Dwi0ZzlfKyMNVZ9r3X+J14NRCvIeLd/0ehgsGnJSqVTbHeCXAL1hC2iRbP88dzFUj505N4S9Z7auQXrKzX6x7p7GN78w6ll4sD975Nd78alJWSdlz3hBqGK02+gX01t0UubbRtEN7dMbPCZon9PE0NQvaSpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7jlH8FNvx+QMQNEuYpjV+Gcu6RgAn7Ms5M0AtYEV5M=;
 b=ihDwYqCN+1c3AkkOY+fMKMhfwZCiSp2fU8aB1zUA4mzzu0xcrsvWFK47yfVxiyRhExPdWwKzzBrKqOlhpl/3QhcL9fNinTy19kJ7HEHH5Pr3nvFaX+LXO6PRwKXlL7mAgwRGKfdcDmXaQwVit3J0bnA1iUFkqM1zJuR+QIwUsoXH1l7dCHONSVfkNCad5Hu7f7a3hHJmbpMEUsemRMN+nR4OjzDMMs05g56K4blfkm7R1uAAJJ4xGoTKz7cYwW5E0092GiWp5L3Q1i8Mi8mp/J0lz5bj93/jmqeYO3FtdvsYlqBwIbqgVOQre3Qv1FViYDIYkb/dYloxVvtR/dddnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7jlH8FNvx+QMQNEuYpjV+Gcu6RgAn7Ms5M0AtYEV5M=;
 b=vFoVXFG+5+h+4R3tmVWf5mUO72xh9zZmxqjG64GhTpWYmR9Q5MBMW22BeJd2CqUnYQRFSam0TA9MM43z1nc/TOrlEXWAXyW1fj8An259ymNI5R3ym7elJ+3w0bnqiT048OYwnr3MeusOPlEOzdN2Z/Y0MrOu7EoLi/QoQvRgTh0=
Subject: Re: [PATCH] x86/HVM: move is_s3_suspended field
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <abc3c680-314d-85fb-8744-930fa5f7f95e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <91075ceb-d63c-63a5-8523-33df3c51e1f9@citrix.com>
Date: Mon, 12 Apr 2021 12:38:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <abc3c680-314d-85fb-8744-930fa5f7f95e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::26) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5a15dc7-ecca-419c-14f2-08d8fda787e6
X-MS-TrafficTypeDiagnostic: BYAPR03MB3432:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3432831CEB4FF58779F54768BA709@BYAPR03MB3432.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kltdJ437M07JEaMXau6/sm4qi4CLAeo0W9Ck4ZfiDRbSquvQPyKFI6N1MvhQQKv3HPyocj4boOEMpIf4L3aBhvrpez5N2nqAMXprj7BjKLAe3IMFQRsx1+6+E/kq52n7Xz046zjnBjbEmyjkwyZ1MTKDElA849eAcWtHSZY8rSs9O4jiAnmdObkCA151Icos8UXI1ODQrj7p5+93HbZ+jIpQV3Opov1twtGNlYhN/brozVf4dSW28zO5ypGk5QyBmdPa147+JDVjY75r66xbReDuQh3GpmuRrAPHWk4cit0J2XUuNIbLNExZxtTdHU8kLP7Utt7XjDXbCcgLtRVQPlN3xpo7TE/4CwwBQ2xmO4iLnU7STbzHo2sU7vo9m1BgW3y00MJq76JjYPW1Jg5hqJjeXraEmbWrZL/CIs4NvDCG7FALnz+yNbC/RBd9aGJdBuqai5umwQzaO59D3jXoHwk4iGavtIS6PWp2r1dnj1VeqeD3yfP/xG4L2vpU8TArrru/kNBOir8Rp8unXvSO40PrTKGgqwvmoxY4eLZEpmzn49gOjnPKJT0koSVvb0hn6ejaLnpTEHs2ooSrTGsURgovWuG29zhudOkwAH1oTbg/LI6juSqIfKrODjL1Yd0YnjiGjbCYt1yDw8TVcE1KfvfoiJGypoeVF3tnonU41SavWLVNUUWpylfKLEDHB/0U
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(956004)(66946007)(36756003)(6666004)(26005)(186003)(31686004)(6486002)(16526019)(2616005)(66556008)(2906002)(54906003)(16576012)(4326008)(8676002)(5660300002)(31696002)(8936002)(478600001)(38100700002)(86362001)(53546011)(107886003)(316002)(66476007)(558084003)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y21CbTB2S2JqN0pSUkRFd1hjYitTRjB0N0RvOTdHSWhoanFOOFc3ZEU1V3F6?=
 =?utf-8?B?OWNqV0kvOGxhM0JYc3RFQUV3V1pIcnJPazlBbzR0dlJFWVBUa1U2dW9QMXN6?=
 =?utf-8?B?V1Njck16RS9XaDh6QUNUTFk0UTJqTElTTFZONjJJcERuSjQ3VWxGVjZOdFdJ?=
 =?utf-8?B?bmlva3dGckxnYXBqVEVRYVpMR2hISnA2NTN1c3ppQUwyVzBTY2JDd0wzOVZk?=
 =?utf-8?B?bEtxd3d3ZEV6YzFGR0NqbEovOEgrcUpRbjgrVkZRT1NUVVovMUFGNnBuSm15?=
 =?utf-8?B?dlRPelJjcG9iUjF4VlVLQ0lQZ3hVUTlkTGNwSDVHYXczNldWbUJyNGVzb2Rh?=
 =?utf-8?B?SThhMWRWdmlIQWE1V1hLcytGZUJqL1o1aTZydU1ybG4zVkpuVTVESFM1NE9m?=
 =?utf-8?B?clJZbjdXbTdnMjRyZUtVQW1qME5PbE5nbURVVlVzblJwdWUwaUdrMlBXSTBL?=
 =?utf-8?B?cGxuaXQ5MHNRWTd4LzNQaGJhTDQ2MmtiWm9LY09rMmwrejNmYjFJVDE0T3A0?=
 =?utf-8?B?ZWpUUmVWQ2hmUzY0a1RCQUlVNDJqMS9YSElIbjdXZi90S1RaVnhKQ0FpZWNr?=
 =?utf-8?B?YWQ3NDdRbk1qQVB5TXBNWUNSaDA5VW9YUUZ3N3ZRR1ZBNmNjNTFtM0MrSzRE?=
 =?utf-8?B?eStDZjRseWdOUE1pbTFzbCtsbjZ1VkNTTDE2bGw2Z0dVRWJMdFpmMHNsZGFy?=
 =?utf-8?B?MlFxUkZQQUYwYSttakdXa2tQSWlsMUdBclRNZlZmUjBmRGVlMGpJbWovdkw2?=
 =?utf-8?B?RkpLQ3FRY1cxVkEralJIN1gwV3pOdUxKZi90dkFJeUZ4MkU3OVprbFF3RGtC?=
 =?utf-8?B?d0VqSWprbzQvdlBrLzhRVGFBN1BYaktyV25zYmdXTXAzRGQxbjVOclQ4dWpI?=
 =?utf-8?B?RFVYTE5mOUhNRXNwR290THF0TTNDa2pWWmd0a2Uxc1RIRjAyS3NnT0N6UTRE?=
 =?utf-8?B?dGYrNG1JNTJ2cmU2Ym9yZndkSmFhK1RiV0pFbWZqaStPZ21wV1ErODViQzJY?=
 =?utf-8?B?a28vU216Y3NyYk9FY0JZMml4SkRpblIyR2pRYmYwRWxubFF5ZHkrTVNLV1FR?=
 =?utf-8?B?cE1tb3JFN3BncTZNM0QwU1JpdzJUblZOWGxuWnZNL2syY01iWTJWQ3FVa2Fp?=
 =?utf-8?B?Skc4clRBNnpHSjBKYitBSDhMazZ0MUpQT0t4YytMc3kwSDhIUGp2OUIwRTNE?=
 =?utf-8?B?dVQzOHhWV2FWWUhoY1BBYnp2M3gyMDMydm1nQ3ZiWnBpSmlTZHNaY3VPYmdr?=
 =?utf-8?B?c0RNbkpKSjNUMTJ4RVVHRmdGUkFqR1YrN2xmd0xjNWl4cmNOTlFkZHQzU0Vi?=
 =?utf-8?B?OTZqdmhzbVJxdzNNUlh4eFhEeHFxdi9ydWpSQTNpZjNrUG13RDNSd0phNWFa?=
 =?utf-8?B?cW94aU0vSnBIN2RFWHlRRFgzcjBVaGV4cnd2WmpNU1k5MWZPU1ZuRS9lMFRu?=
 =?utf-8?B?dU1kLzV2cnErSDZYeDFqZGg2K01hUVFMQk5pNEhVRHhrRG10U3dBODByUkVm?=
 =?utf-8?B?WUVZOUpyTmF4QWkraitlMWhZRVhNTWYyMUF0VW9seEJOK2RRcm4xM2dUZVdm?=
 =?utf-8?B?STlaN20wbmNyM2RESURqRVBPMVZUbU9pRmJRR0FQRHJtbE03MC9aTGhNbVc4?=
 =?utf-8?B?TnJjdldmUjJZeTRvaDFnMU9DdmNqY1FNam9UUEE5a3U0VkJxcWs3cGJXelUr?=
 =?utf-8?B?T1JJdTRzVkdEMFdva0l5RjBHSzV1TCtjRTZQNDAvdzBzT0dETXY4VlNMNUp5?=
 =?utf-8?Q?XFE05d9pTICFdDz/TmHfUpmyuT/mMpXCq8SfCKq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a15dc7-ecca-419c-14f2-08d8fda787e6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 11:38:45.5802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9TQTOV0EpsVM8JmJ3jC+NoqkxTLGRIpFfab3ZHSw+22QY0ij+2QKbHEbOcnZjlIZgJzdUgXQiGdO5VmeoTv2J9SOoL/h2cYD7p3X1pF+/wo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3432
X-OriginatorOrg: citrix.com

On 12/04/2021 12:37, Jan Beulich wrote:
> Put it next to another boolean, so they will "share" the subsequent
> padding hole.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

