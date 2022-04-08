Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D87474F9370
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 13:01:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301385.514334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncmN2-0007Zx-5x; Fri, 08 Apr 2022 11:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301385.514334; Fri, 08 Apr 2022 11:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncmN2-0007WY-1y; Fri, 08 Apr 2022 11:01:40 +0000
Received: by outflank-mailman (input) for mailman id 301385;
 Fri, 08 Apr 2022 11:01:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d3bc=US=citrix.com=prvs=090ff2996=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ncmN0-0007WS-To
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 11:01:39 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41d154e6-b72b-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 13:01:37 +0200 (CEST)
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
X-Inumbo-ID: 41d154e6-b72b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649415697;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ciBmRyzsvMQg+vH0lpgSiG3CqQQ8q+FXVZ8jg7oSHnE=;
  b=b+Mhn20DGLu6+5gQej2QDAUyMNLI/BgRZawFnKQKMeSocvLZUfuHcgjR
   FIrh3bXKUDQS2qR6j7QAiLXasAaQrejWeHsftNLKfOxo4EWIenKHOE6bx
   j0yRQXvajUNSC+y47dUjqh9T6DIDZO/puJnYFDYvAjav7t9pCLJK0PzA7
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68247366
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:In2YEqP+etvINorvrR1Ll8FynXyQoLVcMsEvi/4bfWQNrUojgmNUz
 mQWD2+Pb/eLY2b3cogiaIqw/EsGvsOAz4JgGwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2t4w2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zm
 ed1kqO1UEQQHaTpwMIaaUVRQn5UBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmdq2p8VQ6i2i
 8wxdD9TXj/NfEFzBnQ2C9VmwKSS3XLSbGgNwL6SjfVuuDWCpOBr65D2K8bccNGOQcRTn26bq
 3jA8mC/BQsVXPSAzRKV/3TqgfXA9Qv3VosdG7y/8v9Cm0CIyyoYDxh+fVmmpfi0jGauVtQZL
 FYbkgIsp6Uv8E2gTvHmQga15nWDu3Y0S9dWVuE39gyJ4q7V+BqCQHgJSCZbb94rv9NwQiYlv
 neOhMj1CCdz9bSZTHOb3qeZqyuoPioYJnNEYjULJTbp+PG6/tt11EiWCI8+Tujl1bUZBA0c3
 RjbnhAZuLAKzvco3oDj21f93zv9+bLwG1tdChrsYkqp6QZwZYiAboOu6ETG4fsoELt1XmVtr
 1BfxZHAsblm4YWl0XXUHb5TRO3BC+OtamW0vLJ5I3U2G91BEVaHdJsY3jxxLVwB3i0sKW6wO
 x+7Ve+8CfZu0JqWgU1fPtrZ5ycCl/GI+THZuhb8NIcmjn9ZLlLvwc2WTRTMt10BaWB1+U3FB
 b+VcNy3EVERArl9wTy9So81iOF3l3pumD6DGs+ilnxLNIZyglbPFN/p13PUMIgEAF6s+l2Jo
 76zyePUo/mgbAEOSnaOqtNCRbz7BXM6GYr3u6Rqmh2reWJb9JUaI6aJm9sJItU994wMz7ug1
 iztCydwlQuk7VWaeFriV5yWQO62NXqJhSlgZnJE0JfB8yVLXLtDG49DL8BnIuR9rLULIDwdZ
 6BtRvhsy89nE1zv0z8ccYP8vMplchGqjhiJJC2rfH40eJsIeuAD0oaMktfHnMXWMheKiA==
IronPort-HdrOrdr: A9a23:80lz/KrCt3RPwlEknpdlO58aV5vPL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBXhHLpOkPQs1NCZLXXbUQqTXftfBO7ZogEIdBeOk9K1uZ
 0QF5SWTeeAcmSS7vyKkDVQcexQuOVvmZrA7Yy1ogYPPGNXguNbnnxE426gYzxLrWJ9dOME/f
 Snl616T23KQwVoUi33PAhPY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX212oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iHnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJMg4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAlqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocYTbqjVQGYgoBT+q3uYpxqdS32AHTq+/blnwS+pUoJjnfxn6ck7zI9HJFUcegy2w
 2LCNUtqFh0dL5lUUtMPpZzfSKJMB25ffvtChPaHb21LtBOB5ryw6SHlIndotvaP6A18A==
X-IronPort-AV: E=Sophos;i="5.90,244,1643691600"; 
   d="scan'208";a="68247366"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RsYTaIymx8ah+IHj8c+rnUN+R5fWesgpaSDL3x/CTl/v5+dEqh7LnfMYNb8blk5e2t6I83m2C45KSSE+EVUJYmWDW3R1hnVMGvII4VqPr4rThhexQ24Qx3c3lWitPVd1qfLdmEJsGXpGPCmxNLIiOJXcr64PnYTLetHR/vGtqThQse2fKHRsaXUkh+ERwIDvkFCsDPtj0wH6C3YnLoCka6CipYvzPwNqSBT0WeAA0yWPeQxOH/ndg+xoIyg+Cm+DGtmeS1W1LW5MVdSmu8pzpaceuktujoAJ5jRJh7vOp3QPEtf/qnnv8q5QOrl2bgzzac8F/y6Qhnh+qfPXzkNHnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZlysfu2xbLtIojeMpQ+WOfCVfjYgxoa3eNp8pGK3G8=;
 b=OW3NozzjcBzVTq8QsrH5yAMnW+AIks7Zk76ZXa82VZAhN1KaQ0VgQFZnY4SOqFF7iyENs1hwDbA4qlbZE1B0h42Qq89W4tLH49zUskNLRvjKGIWNzLjDEOkO5xtYp/WbAPLHz267Kc+4zJsHPt9vELCY42472Kc3k4SoJ+XAPbbtG3CpsjNOHd6WUeOgNzD99+6VcGLhRqQcVojVTDBjWyKZm8H5EbyCHqxfwRI1PBPzSR9V26kgiMJYEPQEjpw2obmYvD+dSWyxtZ0rZLn2lhbxuLDn+E3FwqYmH7IHYP7aY8cepB1Vj2TTs5PnPdlVs5NaaeHFcZHIwNlKfPU5aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZlysfu2xbLtIojeMpQ+WOfCVfjYgxoa3eNp8pGK3G8=;
 b=CTs3Frr/HmfumjBUtxAXNakQqmZCBWVVkcaUmIDjdiPzxnFymr8DYXgXWZWDVC90O8OGKQ1I2Sat73p51KucHjobSg45t84PW05g4io4DF3jp7/6TYOXt/74xXwNtqbF5V6Px664E1RT97bFjkzgS7D1TUvG4ax/gm+nVv7zb6w=
Date: Fri, 8 Apr 2022 13:01:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, osstest service owner
	<osstest-admin@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, "Dario
 Faggioli" <dfaggioli@suse.com>
Subject: Re: [xen-4.12-testing test] 169199: regressions - FAIL
Message-ID: <YlAWBom8O8d1lCpQ@Air-de-Roger>
References: <osstest-169199-mainreport@xen.org>
 <43ad1e8c-dacc-9b7a-7250-9348e7e52580@suse.com>
 <Yk/tzuKq4D3mFEQu@Air-de-Roger>
 <a6c6901d-0f6f-f4f6-eba9-c3d169c30433@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a6c6901d-0f6f-f4f6-eba9-c3d169c30433@suse.com>
X-ClientProxiedBy: LO4P265CA0096.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d873a4b3-3c02-4d5b-d453-08da194f2312
X-MS-TrafficTypeDiagnostic: BN7PR03MB3443:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB3443116104DC0411ED6DDCF28FE99@BN7PR03MB3443.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AIn/CMDaJzRexEQ8IykvOwclTSSGkD3m4EwRBZhxy+EacIBSWhrT0KZwCsWLEdvDM7pyxi0H+ndzIo8PoQbA71enG+uYZVAe2Khm0Gw9UzJOvEA4Yxc/Uw2Add80mIvgJ5u369IZc7nRd3NZIVP4RxiVu2Azt/mwhrA9a+yao+r6J4EXBgW8iWp1Z+J7xMG0GWVZNkU1y4IKI9rnrQsF58/jaVNzdnVH/4I2uvret6CkOC+EcdJsGMqWs27v8sUzum0+Cj8qsLpWH/XlZLGOeqNoGgoaF6WykWuiXSoNiXji7apzDhk5Fg+YOY8k7b+cynwbnHegCK/0IJgeTFyW1Ot///LN9eJRUy/PHozxgs2ZybSm8QyFweAyhihFh+mQu1EMOrkUmgxK6mLUEeM8QdehzG/7dqOvgQdjLAvSjIDLvq3eUXCTzQSqo9Z4s9/EmxD5PAP0HbFYFBQVpjrsxwAOmlueT1z6BHpI8JCsy5H+f6DchvtNTHjId6tl8EmoTxZmj1POGfsNWztrFYoGhathDttY2nPCLUgl06DRqMdIgoZgYPxy4xzSyfUDYMEh50WOQEhamytrClVTs46yezbHrr1kkOGzFZoecNavxLI4AwI+RZJ4w9hbkTpj6Qk21RX8glEYoIeXWByPIJPrwkSgh+yoHiXXVcxU+NQXMOmhcppCUyuNGupX3WKwXzcVbrwXw93p4jZkQPwR2d8Cqj7zOMKJ8I7x/3IGkPOiIkc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(966005)(6486002)(33716001)(66946007)(4326008)(186003)(54906003)(38100700002)(316002)(53546011)(86362001)(6506007)(83380400001)(8676002)(2906002)(66556008)(85182001)(66476007)(6916009)(6666004)(5660300002)(82960400001)(9686003)(508600001)(8936002)(26005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDlHcXdZRVBQbGZDN0JtMFlrNHpUYi9uUjZCNFdzQ2Zna1FqNEpvaDI5Tmdz?=
 =?utf-8?B?bTVjU2lRbkdzRVU2eDlBQnp3WElTakZIMm1Gb2F1eEp4d094UDZKemhuOU9a?=
 =?utf-8?B?TjFpT242K2t1b3IwM2F2K2REMVVJNUtQTDQ2d3ZSd1NRWFIzSHZmRUlTNndF?=
 =?utf-8?B?ZENRRkY4dndOeVF6dWNEeVB0alZqMlFRaFQ2QjFlanl0dFpoUm1sNERZK051?=
 =?utf-8?B?VUZ2MkVVd1VGeUxKQ2dLellDSnV3OExpYlNkUmYrbUlwUkQ0cGlhQlU0TWFh?=
 =?utf-8?B?SmtRMTdLRGFHU21NYlVveUZnVEZCdC9zUXZvMW9ibGMvVEdmZi9Edm1ray85?=
 =?utf-8?B?N3N1R3VKMjVWbmVOaThidmVRVmNYbnpEQ1JiVEVqNlJ6Z0xmcGE5eTBiQ2hy?=
 =?utf-8?B?cUFRbWF4VzJ5VzdrR2dHVnlSaDBsVmtVUFhJRy8rcTZXT0Y1ZUxiREVCdklo?=
 =?utf-8?B?ZlRUSXlYdDBVNk5rOWZzNk9rdDdFUkYrR1o2Nk5GSklaSVRBblp4dW1wNC9V?=
 =?utf-8?B?c25NVzgySDFYOTdqMlAwWm8wVCtoWUxKOGJkOURNOGFHdHZXTjNQclFHb3Rq?=
 =?utf-8?B?alVXVFo1U2hOMVYzOGMvNStWR1ZlYjJ5UHhzdjk2NWZFdDBvSFpacVVNVi9n?=
 =?utf-8?B?R3VvUUh1MDhRcForN09jbmFTOFliQmlYcVY2Qnp4WWxzOTJaTStTZGdKcWpw?=
 =?utf-8?B?NlpYMmw1bWR1NjlUVWYzelduSDZudGFhMmdsT1JlWHE0aVF3T0laMVIzWWVx?=
 =?utf-8?B?N1NnQXdIVVVNWlBPaW91aVBTMkdoRlJuYk5jdXJrYkc0TEVDVFFIU2ZETHA4?=
 =?utf-8?B?QUtsZ2dkbi9HeUFSWHZSa3lCVnFsRXFGckk0cnF1dms3ODJVUnh2UVhpR2dS?=
 =?utf-8?B?cjF5MFVrVXQ4QTJlS1lpM3hOMkZCeDFOUENKYjB2dm53cTZEMUpaR0UweEtS?=
 =?utf-8?B?UElTQ1k5RFhhbHpsUnh1MGxmUXYwblJoaDVPWjlnMXhrN0hjWnB0b1V2TnI3?=
 =?utf-8?B?M0NXay9KRGdBTDFKOXI5VW93VkUrN3grSElnZUQvTmFBMGcrQS9RMVpUM0lT?=
 =?utf-8?B?MnZhcHJER1ZaK0VpMU9BS0hkNzUzTC82dE9TbW4vUDNVd1haakdOSThFR1JF?=
 =?utf-8?B?b0NmaEpkN25ML3FHUEE5Y2tGcXI0M2tuaFNTazlWUUxWcXBRY0szMnZCcGlT?=
 =?utf-8?B?aU5LVk1CT3cvQ2gzTTZNd1E0V0kveVlZSHVDb1A5NmN1bEt1Tjkzb09MMDdQ?=
 =?utf-8?B?UUZBMmdtWjk1eStIR1BtSnpHWVhIdmtuNlNGb3hRUGsxV1diaDNrZWJ1MWFs?=
 =?utf-8?B?NW5KVG51VEpZbnFWWi95YXdwcjRwUnBNYWdqc2pzZGNBV3VWTzFHQk9DVHFW?=
 =?utf-8?B?dm9qMTF0NlphL3QxRmx6bWdiMFdBZWZTNVhUSTBSMGdsS1BTOW5zTjZ2UlMv?=
 =?utf-8?B?Q3JyYmNsR1hNaEVFdG5YZW93OUpxT3dUTHA0ckRCcWV1aG5JSm5ETmhJYzZW?=
 =?utf-8?B?dlVTNE01OUdsSzljQWtHR2N1NDQ1U1Ywbkp6TnpGUnhocXR4YXdjRVV0aThl?=
 =?utf-8?B?czVZNm1zMitObHpHMXBvRGJUVWdIQnBsUytkOHdwdGRLeVY1T2xJR3FCMGtZ?=
 =?utf-8?B?QW9SeXpFOWZUQ1B6N0Z0QUJPaW9SeG5BV2Y2b3IySm5YOUNvajJ5NHRWTTBn?=
 =?utf-8?B?T203d2dibHZVR3ZXbzFmakgxSHdxSHhCRXpZRS9IKzhhelhjalJQZStXM2JK?=
 =?utf-8?B?WWhabGE1Uklic2QwZFplMWx3REc5UmNSaTR0Ty9hUTllOTVMOTQ5RGEzS25B?=
 =?utf-8?B?NEl2U2llalJwczB5SmYrQ1JCRzBBQURJMTV1WjlmMmhvYjhjaTExaWVmVXc1?=
 =?utf-8?B?U21BVXJUVU40bDNFZXZOZjJPZVhMUkU3U1NSZ0hrNS84UjQ5L2VpVW1LYmVL?=
 =?utf-8?B?czNMYlRGa3JLWnlJRjk1RTdVQ21LaGFsRGJLWTlKNjZYa0tqZGdsaE9JU2Yr?=
 =?utf-8?B?SVFXRjk5TXVyaWdrLzcycVpESnVsQzB4Sk0vYnMyMFRkbEhYM29yV2tEQXI0?=
 =?utf-8?B?SXdrNTloSjlMWXVwVlZ3aDNKMUJxdWx0blJHZnJ2WFZFTVRyb2hrWk5aYk5V?=
 =?utf-8?B?MkU5ZHZDcy9XK0Q4aWdVUFlmSW8waEJGTVZudERVZ3pzZWhZT2ZkampDcUpa?=
 =?utf-8?B?bkMvUllFOG52bC9MaW9KdmtWNWlKWldZTys4L1pOODkwUDN6bG5LK0h1dGJs?=
 =?utf-8?B?TWhqTG9RWld6K0VDS2ZJSEd5OUJmcmhkaytpOXh6MGt4VENOUHF2VGREZFVT?=
 =?utf-8?B?U01DMHFhR1l4MmtUWkhmcUswdEJYdlN1dUd3VmkxMWYxdWdMUUM0TlFDQVBw?=
 =?utf-8?Q?NK4egCkDtUQNEjF0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d873a4b3-3c02-4d5b-d453-08da194f2312
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 11:01:30.9612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P7NXE/7K11ATYtoGG+c/skafRahGX+5P2j/u9AeB8kqcPXbD8/wYNtbe2ccTzTSRmHdZUfKKQlvl2iAnCcvp+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3443
X-OriginatorOrg: citrix.com

On Fri, Apr 08, 2022 at 11:25:28AM +0200, Jan Beulich wrote:
> On 08.04.2022 10:09, Roger Pau Monné wrote:
> > On Fri, Apr 08, 2022 at 09:01:11AM +0200, Jan Beulich wrote:
> >> On 07.04.2022 10:45, osstest service owner wrote:
> >>> flight 169199 xen-4.12-testing real [real]
> >>> http://logs.test-lab.xenproject.org/osstest/logs/169199/
> >>>
> >>> Regressions :-(
> >>>
> >>> Tests which did not succeed and are blocking,
> >>> including tests which could not be run:
> >>>  test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 168480
> >>
> >> While the subsequent flight passed, I thought I'd still look into
> >> the logs here since the earlier flight had failed too. The state of
> >> the machine when the debug keys were issued is somewhat odd (and
> >> similar to the earlier failure's): 11 of the 56 CPUs try to
> >> acquire (apparently) Dom0's event lock, from evtchn_move_pirqs().
> >> All other CPUs are idle. The test failed because the sole guest
> >> didn't reboot in time. Whether the failure is actually connected to
> >> this apparent lock contention is unclear, though.
> >>
> >> One can further see that really all about 70 ECS_PIRQ ports are
> >> bound to vCPU 0 (which makes me wonder about lack of balancing
> >> inside Dom0 itself, but that's unrelated). This means that all
> >> other vCPU-s have nothing at all to do in evtchn_move_pirqs().
> >> Since this moving of pIRQ-s is an optimization (the value of which
> >> has been put under question in the past, iirc), I wonder whether we
> >> shouldn't add a check to the function for the list being empty
> >> prior to actually acquiring the lock. I guess I'll make a patch and
> >> post it as RFC.
> > 
> > Seems good to me.
> > 
> > I think a better model would be to migrate the PIRQs when fired, or
> > even better when EOI is performed?  So that Xen doesn't pointlessly
> > migrate PIRQs for vCPUs that aren't running.
> 
> Well, what the function does is mark the IRQ for migration only
> (IRQ_MOVE_PENDING on x86). IRQs will only ever be migrated in the
> process of finishing the handling of an actual instance of the
> IRQ, as otherwise it's not safe / race-free.

Oh, OK, so then it doesn't seem to be that different from what I had
in mind.

> >> And of course in a mostly idle system the other aspect here (again)
> >> is: Why are vCPU-s moved across pCPU-s in the first place? I've
> >> observed (and reported) such seemingly over-aggressive vCPU
> >> migration before, most recently in the context of putting together
> >> 'x86: make "dom0_nodes=" work with credit2'. Is there anything that
> >> can be done about this in credit2?
> >>
> >> A final, osstest-related question is: Does it make sense to run Dom0
> >> on 56 vCPU-s, one each per pCPU? The bigger a system, the less
> >> useful it looks to me to actually also have a Dom0 as big, when the
> >> purpose of the system is to run guests, not meaningful other
> >> workloads in Dom0. While this is Xen's default (i.e. in the absence
> >> of command line options restricting Dom0), I don't think it's
> >> representing typical use of Xen in the field.
> > 
> > I could add a suitable dom0_max_vcpus parameter to osstest.  XenServer
> > uses 16 for example.
> 
> I'm afraid a fixed number won't do, the more that iirc there are
> systems with just a few cores in the pool (and you don't want to
> over-commit by default).

But this won't over commit, it would just assign dom0 16 vCPUs at
most, if the system has less than 16 vCPUs that's what would be
assigned to dom0.

> While for extreme cases it may not suffice,
> I would like to suggest to consider using ceil(sqrt(nr_cpus)). But
> of course this requires that osstest has a priori knowledge of how
> many (usable) CPUs each system (pair) has, to be able to form such
> a system-dependent command line option.

Well, we could get this number when installing Xen, because at that
point the system is started and running plain Linux (so can see the
real topology). No need for osstest to have a priori knowledge.

> > Albeit not having such parameter has likely led you into figuring out
> > this issue, so it might not be so bad.  I agree however it's likely
> > better to test scenarios closer to real world usage.
> 
> True. One might conclude that we need both then. But of course that
> would make each flight yet more resource hungry.

Yes, let's focus on real-world uses first.

Thanks, Roger.

