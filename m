Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E494E9570
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 13:42:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295410.502673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYnkF-0001wo-Ax; Mon, 28 Mar 2022 11:41:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295410.502673; Mon, 28 Mar 2022 11:41:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYnkF-0001tD-72; Mon, 28 Mar 2022 11:41:11 +0000
Received: by outflank-mailman (input) for mailman id 295410;
 Mon, 28 Mar 2022 11:41:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ynyj=UH=citrix.com=prvs=079c560b7=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nYnkD-0001t7-CN
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 11:41:09 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efa82866-ae8b-11ec-a405-831a346695d4;
 Mon, 28 Mar 2022 13:41:01 +0200 (CEST)
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
X-Inumbo-ID: efa82866-ae8b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648467661;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Ja14lLKCFFdpgA1ybqBd3qI8RWeXZWtBQPg6d5/mHco=;
  b=ap/t/FOcLUe7UljPDU6qlueABHp72YZ1ksE+owJu/kTXrJMMhfdUL+8p
   65zPzb2gpRuqvnrF3BHExwzIAykM5mzc/anD5RtYQBZ1h/cUUNtD6Aekl
   mAlEe5Z9PK9t0ljqYlHT0DNx+pPSoP6SIdbptn1Xm/GxQrcIwMsnbqcVR
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67318034
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RTmXHKDyZyaM2RVW/xDjw5YqxClBgxIJ4kV8jS/XYbTApD5w0TwDy
 2JJC2uPbPmNYGqkLY8kbtm28xwE6MKEmNZjQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vj0tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhrk
 /Jc5a3zZj54M6vMgNwcAwZXNgZXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGg2xp1pgVQZ4yY
 eInawRANwn/eyRSHWcZT5thheuHwVngJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tkqAv
 WfH42S/DhwEHNOawDuBtHmrg4fnnyn2RYYTH72Q7eNxjRuYwWl7IB8fU1ehsOS6okG7UtNbb
 UcT/0IGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbizt1HUBdEGQHMoZ/8pZrG3p6j
 Tdlgu8FGxR165qEGUPe2Y7FoDWyIRAUfXANQAgtGF5tD8bYnKk/iRfGT9BGGaGzj8HoFTyY/
 w1mvBTSlJ1I05dVivzTEUTvxmv1+8OXFlJdChD/BDrN0+9vWGKyi2VEA3D/5O0IEouWR0LpU
 JMsy5nHt7Bm4X1geUWwrAQx8FOBuq3t3N702wcH83wdG9KFoSTLkWd4um0WGauRGpxYEQIFm
 WeK0e+r2LddPWGxcYh8aJ+rBsIhwMDITIq5BqyMMYAUPMMvJGdrGR2Cg2bKhQgBd2B2zMkC1
 WqzK57wXR7294w5pNZJewvt+eBynX1vrY8ibZv60w6mwdKjiI29Et843K+1Rrlhtsus+VyNm
 /4Gbpfi40gPAYXWP3iMmaZOfA9iEJTOLc2vwyChXrXYeVQO9aBII6K5/I7NjKQ4xvwMzb2Zp
 yvVt40x4AOXuEAr4D6iMxhLQLjuQYx+vTQ8OyktNkyvwH8tfcCk66J3Snf9VeBPGDBLpRKsc
 8Q4Rg==
IronPort-HdrOrdr: A9a23:JaFNsqHkN05mu9vgpLqFBpHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HnBEClewKgyXcV2/hqAV7GZmjbUQSTXeRfBOfZslnd8mjFh5JgPM
 RbAtlD4b/LfCBHZK/BiWHSebtQo6jkzEnrv5ak854Ed3AVV0gK1XYBNu/0KDwQeOEQbqBJa6
 Z0q/A37waISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGQ9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9wwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgjf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQi/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpLzPKN
 MeTf002cwmMW9zNxvizypSKZ2XLzkO9y69MwY/Upf/6UkVoJh7p3FosPD30E1wsa7VcKM0lN
 gsAp4Y5I2mcfVmH56VJN1xN/dfWVa9CC4lDgqpUCHa/ec8Sjbwl6I=
X-IronPort-AV: E=Sophos;i="5.90,217,1643691600"; 
   d="scan'208";a="67318034"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EW3w7Gw1MBYEAwAP7zjJiRON/D5CJY7Bvv00zUjZUtMqnN+HFFEW7qWRCIqR7fmxE94D0yllg2MItkHdBfb/bzELIWo7NzfdEoAz8oR6rbhnbshMcikclRzKyeu3QnET+rkut+RuV8PRGmUpuMBBzS7WA1D1R8QDKAZ0FocXI8+mZMIPuTbWBC7P8i+r8hw72kckDvBzzMWGaiCf/BoJT805WgzHBFIG26tsQwbW7iicqduuQ2CFY4ynBbsH51mcsq/N7xcaV2EUVEBmfIHhnb7T3ZqFzSy8NTY1dELmxLrWybkZXpB1u/OGpMP2GLfhRTNLozPuhy14u5VzhHpxPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0QByrze7LV9nXdPPsdMRWDlVINwH5A6CZ+WwDS0wWk=;
 b=bwrTNMCFe7+BeC69gXRNbgppaoXhUY/Dolf1qAD4cwlbeRJRP8x6AKppAWUPffLpR0unpcrrhVp2DlC8u9sh4FzDOQfnadfOgvjS40WFWq5fB48etEVY21wdY2ksxE07QSHO50GO+SWUPn70wcm+7+sAunzX5A1VMoBx80FCYGunUmw5Ic3P+yCewwAPllXfFZR+rdiTdG087bRNTfITC4ZDw6dZ6s1uoPpuEpp5Q/wlQj5yHx0/4WsOWyIL6p6Y03t0cMKbRb87FN453099nJ0oJApHokhmAkiRL0HeU78pKQpHDeXExDKvo2UJQPK8nLKfeD8bjJzZq//+QNiBbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0QByrze7LV9nXdPPsdMRWDlVINwH5A6CZ+WwDS0wWk=;
 b=Z3qGXuP1/58KHBBcxzia7IpQzhLNvPM9NL8cG92x4xYE/fywJsezprCJAPg31BDRTgcX+nnE6pMUIiVHJhuxqYlW4ffbHxrlpnpn+CP8AkTHqJ5Vp/kXb9HpqoEphyeppO/MUXWesbE9wR2UMSvw6k26djZ9dU2gVxZomU8N+F8=
Date: Mon, 28 Mar 2022 13:40:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Daniel P. Smith"
	<dpsmith.dev@gmail.com>
Subject: Re: [PATCH] x86/physdev: Call xsm_unmap_domain_irq earlier
Message-ID: <YkGevRlIpAlCDox7@Air-de-Roger>
References: <20220325141826.16245-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220325141826.16245-1-jandryuk@gmail.com>
X-ClientProxiedBy: LO4P123CA0110.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cdeb6ae-d578-45be-838c-08da10afcf0c
X-MS-TrafficTypeDiagnostic: MWHPR03MB3198:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB319866C39B3142728E52423A8F1D9@MWHPR03MB3198.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i1XX5iTKwyBI6r7FfEjJz/kIzkW1xYx8ef9b9+PB2KgBBG7MAj5P5IQwrtcawBUpL0pVtm7Fx5AJ2nf4Iqnypx79FQc3unrnDaCAEzetwiPNwX7Uwmg8VAE66GQ2xyq5sJqC0soCFtNBr/TBT5U+7p6W+djv+9BFwGX4qIM84ltg62x8cZRV0u5XENwpWEsYANM48NR8i4mbdwesKDWxN+q3iBN1C+JTT0eYivVyfpr2DMgIsRtLW4LOhki7kjRzNAA4lmLv1VM9MRwp8Jj1d6MWxg4QzJHnLZiszOrIU5eK3e0ZC9yFPZhpcSFilq9UQfdqsZ54dnncCNFHTzDaK3FjD+M8NE+i0PT5lvyvvIUrT4uscLPsOZcZKdorr+Lzk3NKNRfbBviH9nSiYRGHiylcRHOnSxZ4ea9/QFs04XjS1IEZb6unGt5s2eIx6r3eigj/GCjDccYdqpeZKslwaeVomSb/d+hBh/vcFrkm5LayB5KKYRaSPBiQQZBf7KOGOsefQkkkbdPVxy6R3+a1cuF/mvpEO9nE/ViphZG3sZyWjttPezahnFdiiBIubRTSBSCaxqNIaSbg7Cn00ITZ4MLaQB2HFzH/i6e50YaEsr5duy3LXzYDA6Fl6pyHKdWJguoIKLGcdXS7VMx+/kbYbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(9686003)(6512007)(2906002)(316002)(6486002)(8676002)(66946007)(4326008)(66476007)(66556008)(86362001)(6506007)(8936002)(5660300002)(508600001)(6666004)(33716001)(26005)(186003)(83380400001)(54906003)(6916009)(82960400001)(85182001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2tSb25DNGRMTmFCSTJodFhLV1ZEbHlWM3NTSGxkbEg3K05qS0U1TU9ZTkJa?=
 =?utf-8?B?SmNzd0NDaDBQUW5DY1Y1dnF0MUpIMjdzcWFNYk9DYTNDbmJJSUVqS0RXY1Br?=
 =?utf-8?B?a0g4OEN4U3BGcjRKOTJaWGJ6Z0dCdG1hbUJkcjRpaXgzWUhwZHMvNThqekZQ?=
 =?utf-8?B?bXpmc1N0K2hjUlJ0YjhLM2M0eURpa3FIUTBvWVg2WXk3azlFYm5GVENURXdu?=
 =?utf-8?B?ZUxMYldlckx4bTVJMWRRU0ZGZ0pQSW9QWVAzYmN1YnIzcUZ2cWhjbnhBL3RH?=
 =?utf-8?B?UmN4QUZzZmkwL1hINWZtNjBnOHhXV0dpVkNuWWlvYTF5RHAxU2ROR3A0TUJB?=
 =?utf-8?B?dFU3WG45M2hyK0cxTWFTaTlzSnpnMDhiVksvNDd5cEhIZnVWQlJjL0c4ZXdy?=
 =?utf-8?B?a3FyeGt6WHpmTHRpTEh0SEFEdlRJT05kYVhKTmkvb0xmUjVZZkhLRUg2bHl5?=
 =?utf-8?B?clZ2ZU9sQXhQSlFyWGM5aVdBSEM2K08ySTVSeU95azcvNjA3UUJFeWZJQURu?=
 =?utf-8?B?WDFXTnEvdXFnbFJUYmorMjIrbWlqYWZWN2xpMk1TMjQwcERuditaR3oydTV4?=
 =?utf-8?B?VnY4ZklHa2dvSXgvMnZEQ3lHSVNnQkhKY3FIWlZqY0JXTVNndGxaWkg5emcx?=
 =?utf-8?B?Z25aRGgzSmRiaXZRMHB3c0J0RG1HZ2Jmc0thSVpqYjBYQlRYdE9OL2RqaHVw?=
 =?utf-8?B?Wm5rdmtDQmlZQ2xORlZGeUxFYnJKcmdFUER3Qzc4cWpRTjNmbWQ1dkdyYzRr?=
 =?utf-8?B?YllBTStHc3dqZHMrZitFalNNNGVsSm0zRFlvMmE3OWd6akUxcjJGVjVPWGxR?=
 =?utf-8?B?SmZFUmlhMWc2VExINlE3MGhMTGcvdUxPU2hVK1dabFBOemNzQ0J6RmFCRlhV?=
 =?utf-8?B?RmtPUVVuVGVuL1hZSWgyZ205SEthMkVVcnAvSFc2NVJRbE5zTHJRdk40Ukg2?=
 =?utf-8?B?VzhobnRKYjhFUDUyTy9uMzBibjFoQlRUeERtdlJJNng3U1I5MXNXcjBGY0ZZ?=
 =?utf-8?B?NXVqanYzUlJmQTRXOGxLSzVlUWZYY21qVFhmQVV5RnhwcVdBTkFUWmJweDJL?=
 =?utf-8?B?WW45RFI5WUhrcVlVZnErZklsYWcrYnVocGE0YmhZMlFWL3hnRWJRSDh6dWN6?=
 =?utf-8?B?SDBMOGRaT3JSY2pLcGNmNXN5WDdzbnlHYmErTndxUUlKM2YzWjAwaGM2M3V1?=
 =?utf-8?B?U2I4Sk9lRTFVeXpZSW8zZWNGZk9BYnpNV1Z2UmlYNU90TmwyMDlwUnJMSXZR?=
 =?utf-8?B?M2V4NnZLNDFMMTRFUW4yNmt0U2F1NStEWG4xVndOWkMzd1ZsRytDN0JWc2xn?=
 =?utf-8?B?Sm0rSHd3TW5ESDFhMld5cjZnL3FPa0NESlAyaFRnWlpSNUJTTmxndXgrbCtl?=
 =?utf-8?B?emNZRDNkbkJDRlp2NmIrczI2ZDdPNGs4bHN1SFc2MkI4UW9jb3B1TEc5WlBT?=
 =?utf-8?B?NkNMYlVxRlhOallNQkFyVkQ2WStvaGV4Qmx3ZjluY0VoNVBBVEhxajA5eEZV?=
 =?utf-8?B?OWRZTjN5cGR6QkM1MWZFRUJmbXVrSHoyY3JROWxid3hGZGdRWllBaitna3V0?=
 =?utf-8?B?c2dOVWdGWXJneW5UVGVHSjlRWVBCSms5bVhmbjlPblNWNEFRVld2WkZ3M2N2?=
 =?utf-8?B?OVNaanQ1Mk1SblZNcU5XdnpFL2ZzZnJhVXZxQ0J0UUhrVjlKQTJlNzVRWnl3?=
 =?utf-8?B?UmMxdzVkOUF5a3VLNEVYbTFSN2JuZlFFbFI4aDJKcTgrbFkrRStQcHlrN2Ux?=
 =?utf-8?B?N0d6QTRUbU5QOWlDWkRTNG1GZGc4Wm54alVxeG5XVEpGMllYaVViTXV5VFly?=
 =?utf-8?B?WGZlLzZNOFdOa1dBTCtUTWozREhOZ2NnYTJpOFl0dW1tQmZyckg1Wmc5T3pi?=
 =?utf-8?B?b0RXUWkxaFZRRWdITkVvYVNVTVZDSW14KzFVK2x4VE04WjRsam1rOEs3N3M4?=
 =?utf-8?B?NXpBSzVFSG5hYW1ld2pIK2ZoWnRaSVZIQmc5UXV4UkZmcFpxazFNSzAxRVhq?=
 =?utf-8?B?NjlhUEdCQm5yalduaWdMLzh6Q2luYWY1NUg0V2pLdjg2V0ozdzgrTDlTM0J0?=
 =?utf-8?B?UGlucTNCZ0QvK2w4NkN0M3paa1FSNHRDTU9kZFdpQ3hrNTRqRFVsV0E3VU1q?=
 =?utf-8?B?V1JsclpQczVCc1NBN2ovRjRzVmNNTVpYMnV2UnNnZXVFNFpSQzNBSXRyTWNP?=
 =?utf-8?B?ZE9sQXZhM3lEVWYwS0xVOE9JTHZLQlYxNU9HK0ZWYWlsb1VJOE9DSHlMN3BJ?=
 =?utf-8?B?Z1U1VmRsV0gyRU9JOXpvZmlnVXhvZlptSERkZHVyWkxFcWFONzI5WmRvY1lz?=
 =?utf-8?B?aDZPeXVzVFJON2k3WjV4ZmRLY3krQzJyMlhpYTdTRFN3Wmd6NHlIWjdtemNK?=
 =?utf-8?Q?EVT4kHkn4xofKGPo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cdeb6ae-d578-45be-838c-08da10afcf0c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 11:40:50.6933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 63ic53vpS2iojnilWp6aYJYGj0V8xbteb5gXnM5YpbUShKh3y4BNDORxdDLtaQ9/AMiHxGIzHhAE0WoZ9dwCjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3198
X-OriginatorOrg: citrix.com

On Fri, Mar 25, 2022 at 10:18:26AM -0400, Jason Andryuk wrote:
> Pull the XSM check up out of unmap_domain_pirq into physdev_map_pirq.
> 
> xsm_unmap_domain_irq was seen denying unmap_domain_pirq when called from
> complete_domain_destroy as an RCU callback.  The source context was an
> unexpected, random domain.  Since this is a xen-internal operation,
> going through the XSM hook is inapproriate.
> 
> Move the XSM hook up into physdev_unmap_pirq, which is the
> guest-accessible path.  This requires moving some of the sanity check
> upwards as well since the hook needs the additional data to make its
> decision.  Since complete_domain_destroy still calls unmap_domain_pirq,
> replace the moved runtime checking with assert.  Only valid pirqs should
> make their way into unmap_domain_pirq from complete_domain_destroy.
> 
> This is mostly code movement, but one style change is to pull `irq =
> info->arch.irq` out of the if condition.
> 
> Label done is now unused and removed.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> unmap_domain_pirq is also called in vioapic_hwdom_map_gsi and
> vpci_msi_disable.  vioapic_hwdom_map_gsi is a cleanup path after going
> through map_domain_pirq, and I don't think the vpci code is directly
> guest-accessible.  So I think those are okay, but I not familiar with
> that code.  Hence, I am highlighting it.

Hm, for vpci_msi_disable it's not technically correct to drop the XSM
check. This is a guests accessible path, however the value of PIRQ is
not settable by the guest, so it's kind of OK just for that reason.

vioapic_hwdom_map_gsi is just for the hardware domain, so likely also
OK.

>  xen/arch/x86/irq.c     | 31 +++++++-----------------------
>  xen/arch/x86/physdev.c | 43 +++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 49 insertions(+), 25 deletions(-)
> 
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index 285ac399fb..ddd3194fba 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -2310,41 +2310,25 @@ int unmap_domain_pirq(struct domain *d, int pirq)
>      struct pirq *info;
>      struct msi_desc *msi_desc = NULL;
>  
> -    if ( (pirq < 0) || (pirq >= d->nr_pirqs) )
> -        return -EINVAL;
> -
> +    ASSERT(pirq >= 0);
> +    ASSERT(pirq < d->nr_pirqs);
>      ASSERT(pcidevs_locked());
>      ASSERT(spin_is_locked(&d->event_lock));
>  
>      info = pirq_info(d, pirq);
> -    if ( !info || (irq = info->arch.irq) <= 0 )
> -    {
> -        dprintk(XENLOG_G_ERR, "dom%d: pirq %d not mapped\n",
> -                d->domain_id, pirq);
> -        ret = -EINVAL;
> -        goto done;
> -    }
> +    ASSERT(info);
> +
> +    irq = info->arch.irq;
> +    ASSERT(irq > 0);
>  
>      desc = irq_to_desc(irq);
>      msi_desc = desc->msi_desc;
>      if ( msi_desc && msi_desc->msi_attrib.type == PCI_CAP_ID_MSI )
>      {
> -        if ( msi_desc->msi_attrib.entry_nr )
> -        {
> -            printk(XENLOG_G_ERR
> -                   "dom%d: trying to unmap secondary MSI pirq %d\n",
> -                   d->domain_id, pirq);
> -            ret = -EBUSY;
> -            goto done;
> -        }
> +        ASSERT(msi_desc->msi_attrib.entry_nr == 0);
>          nr = msi_desc->msi.nvec;
>      }
>  
> -    ret = xsm_unmap_domain_irq(XSM_HOOK, d, irq,
> -                               msi_desc ? msi_desc->dev : NULL);

Have you considered performing the check only if !d->is_dying?

Thanks, Roger.

