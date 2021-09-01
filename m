Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B661C3FD5D6
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 10:46:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176102.320534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLLsc-0004iQ-FT; Wed, 01 Sep 2021 08:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176102.320534; Wed, 01 Sep 2021 08:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLLsc-0004gC-CG; Wed, 01 Sep 2021 08:45:58 +0000
Received: by outflank-mailman (input) for mailman id 176102;
 Wed, 01 Sep 2021 08:45:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=18Fz=NX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLLsa-0004g6-FQ
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 08:45:56 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a0caba4-5607-436f-8de1-f43c1278489b;
 Wed, 01 Sep 2021 08:45:55 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2053.outbound.protection.outlook.com [104.47.10.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-pVaYxaYpOIaZRfTz3Kv-Cw-1; Wed, 01 Sep 2021 10:45:53 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3119.eurprd04.prod.outlook.com (2603:10a6:802:10::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 08:45:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 08:45:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0032.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.9 via Frontend Transport; Wed, 1 Sep 2021 08:45:50 +0000
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
X-Inumbo-ID: 2a0caba4-5607-436f-8de1-f43c1278489b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630485954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QwTgqcw3zlA2T/dEROtSixpo30ORvGtc6P2RdjY0Gjg=;
	b=PzS2P6efoymwx83ilyV/+Epmw81JJwTLmMQTfspyeq4HmQiGVNlXYE5Js2YdYOUZ7dd9n1
	5l7PPWkwEAd2tFFUpaMwpY0Xc9QX9W3z0hKZQnxi+ORluMpRiUM47xJJgwnRy0xs+Ltfv+
	0RiTuhW+nyVL1rZPd0WjdUsoFQgliDY=
X-MC-Unique: pVaYxaYpOIaZRfTz3Kv-Cw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ggASe3nILsQkMY9u+7NaaCb+8aZEHa5QFf3rlrn7kH32vM90qDD0Y6p+2j1IJAc7IiwdfRmRInYqgRMJuPMzxba5/caNkQp3YuNQjpLsKLDPJ1rfN3VxrewYZ+21esPSoGLiK6Sbpy8YtgRw+fM2g3tsKmfPEQg1jp/c6Ni9l+iC/0w1VDrDoHmk4jSPshwcm1BvT91qfedp+PSB6OTqRtXHfUQmgrGj+C2NlDJF3/pan6IK2zxZdDUsyNrf5Ttnp9YSfDh1t2ZzxalCJMwmsHpyOtv0iZrRVR7RPaAiVj3fFuhdzDiKwew4/xnWy8xjtayd/RWREsgf4KblS26ujQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwTgqcw3zlA2T/dEROtSixpo30ORvGtc6P2RdjY0Gjg=;
 b=GW7w5QtN03F9yx6157WuZMzBZSZlC8Z3lySQ3EIjkeG6X4zVF/dT8OSnAHZN05If8O+3Hpc0gw3unDYZ/tVqzMZhC3OxjdV+nUc1zbD+YrzPDzOlhCmaQEJ4mowLHVwJa2REVwZ7/Rq55SGEBY1hcSBX/hkMv7si49Uo/oRbjaJrmXAE989DMXZAPW4sddwjy505S5YLVDbopCkkrzOMHHiGUMDtwtRZ6Tf3UT3GsTbncweUogGbAHkn+12L6qWXyjKOTCEeallF2/+NmL4kZst7Ahc8A/d1xFP+ALqunECcGzvMdkFgaRQSLP2BQ9jbbob2/2iL9tA6Wc895tFsqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] domain: try to address Coverity pointing out a missing
 "break" in domain_teardown()
Message-ID: <20e28e4b-c794-7435-5f5c-332e9a6c0433@suse.com>
Date: Wed, 1 Sep 2021 10:45:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2feab3b-1a44-42cf-c086-08d96d24e6c4
X-MS-TrafficTypeDiagnostic: VI1PR04MB3119:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB31191826650BFB051D471F33B3CD9@VI1PR04MB3119.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+rXZ7I3qL+OTk6CJBtJ6Cnw9BeFlt13zggOo+cMurxkLReMmhcoZkHzsaiMPN/knPx5g/ZogSCP8jgliDS/Rs+GcBP7/4QhJllUb/Bvo7MCoG7dLNcDFwCgHgTfZ4RoIE4or7Pk6+gCxQ6O/1LEvhoi1znuZHJAHS+VlxfkD8PJjBOHV9asgE1h5PmrJmSqj+anEBk8FdQp5F6UQXDrpsEK37Muge2bNt9B4WUehuBz52Hj1ujGUHEti98SllaH7URR5qu3ZQ8YQnUA95rr0Mkele25T8iMXmn7il6fvzsz4UF5gA4OxrdOSCxRRZjD7m+L/kOY41xHuK17/2eD015W3CER0iFf1JhBNyS6QG4V2YxyeKHis/slYk2sEFJAoZsHgcFFEGSunxZjsEUC2o2p5YEGAP4zioc2g2BayermqOv1JcBGDqUzYh1Rr8Fqk6DRMOrfIyqTotrAoXwHKmKgbdsYeTeLjGK2RyR0rJjHHEXuaV8l3GVzySQqIvr+nQ5IUfZObeiqEaC0LyBKSS62zp5ec5h0JI+E2lJ0ypp4Wm5CKUmp6+DRvUtM39Jh34k9EItVEPNafANwSYJnxlEbRBNCohCqr5f9Gc4hho7qLHXvmuCHuRc+sjWU785G862eR+2his+XWjnRaIGtdcfMCIJ105j3E/+L0jRWGxR+kBtDSFLIUrxAeXxRtC+xKh1eK/lCBKOCTASpeuctAd3tFE29pGFmLgFI14IyUWxQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(8936002)(6486002)(31686004)(31696002)(66556008)(508600001)(26005)(6916009)(66946007)(8676002)(54906003)(66476007)(16576012)(5660300002)(86362001)(956004)(2906002)(316002)(36756003)(4326008)(2616005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHZiVUsvdXczUmVrdjRaOTJBSFhDck9ITDBOMnYvelA5ejlqVVRzdFgzYno5?=
 =?utf-8?B?d2JUeVA0cWhnekR0S3YvRys0SWxUQmZUSnMzYldzbFJTaFhlZzd1RDJaOHQr?=
 =?utf-8?B?MmxrMzdtL243N2dyeW1TNTduSm1jUERnVmRJYlI0QjhZTWN2V0pQNDJYTUoz?=
 =?utf-8?B?bGRQaTNRRE5kYVBrSHp5MHdUU1ZFcUU1UUVzVjFnMW1UeGQ0QzgzUGcweVZj?=
 =?utf-8?B?QzVTY1RKcFRrQVcvNFpMbHRHbm1rYjBpTjIxbGMzdU1RTFN1STA3N3p2NGZW?=
 =?utf-8?B?eG1lUjJVQWZvRkVsSllNRTRzbVF4SjlXQ1RxeVhmdW9pbmZ1VGlJZDVuWnhr?=
 =?utf-8?B?WDFxQzR5VDNObjRVTUJNb29UUVpNOXNsYTlZMnQyS21MR3dMMUtpUkpHc1Nz?=
 =?utf-8?B?UENBdHlVN3J2SWFNZjFmd0ZHdDdqUFNCM1pBamJSV1dmRkQ0TkZNYVJQcUxI?=
 =?utf-8?B?dTNLNzZnSGcyTTY1K1l5ekFEaTQ4RzFxV0RoaE9uN3VFMHdKNWJKRkU3b05R?=
 =?utf-8?B?U3hGWHdtV0xVc0cxOHhyc0R4RktIYWhnNnZjbmRGcHljdnhoNUFVL1BUbHZU?=
 =?utf-8?B?eWE1OHZhVnoxZjJLREdOaFpHWHVTdWVTSVpoLzVnazRjQVhLV1NRT2RpajlE?=
 =?utf-8?B?R2ZhcnpQV21KT2tVTGovSWt6THk1aG1peE9JUzZCUUFzcDhyMlBKck9TbU9j?=
 =?utf-8?B?K2VSMXRocU9ITVVXa0JuZXBWOWZxN0UwNnJpQXVRYjNMRTh4SFRTWjlEOStu?=
 =?utf-8?B?VHB5Mk5iaFVmaDRMR2ZPN2tOeXh2cmhieEVYOHRNMjFHR3piclJKb0c1MnBy?=
 =?utf-8?B?c2dVbXNpZ2o1a3M0MjZrVTM4RHk3dExtZVI3V1JhUFpxOWtRSkdpUldTWHEx?=
 =?utf-8?B?MzRNMlVXcExrTWFSZFNReld1SDJVVkRoa09EdllRb2FxZzh5cnIyR1JIUzhh?=
 =?utf-8?B?ODBET3FGb3NTc21Qc0x5SUVVcEtGeE10cVpTWTdKMU9TS3FyN2Y2ZElmRUZp?=
 =?utf-8?B?NlFPVFZEbjBGWlZXQUNwRWxIZEhpa0Juc1NMNVB5U0M1OWtQd2hadldPNzh6?=
 =?utf-8?B?OU9vOFlHcWJFT014WndUL05nTnp4WTNPWEdwdnZsKytJdWdReXRNcHl5VTc1?=
 =?utf-8?B?U0tBSWtnQ1lremNxeEd1d09CaFg4R0x4elBXMXgxRzd0MFVlVHFIK0N4TGdy?=
 =?utf-8?B?WlliWlhCcXpOQmRwWWphZ20zM050TDVkQUp3eXIxeWJpUUd4VGlURlM2TWVY?=
 =?utf-8?B?cGFiQ01wWDNYblhkTzRpTWN5WFdsUEZlb2dhY0JNZXJ6TEZERXAyTzluczJU?=
 =?utf-8?B?d1QzVEZOcklSbjZlWU1SdVFQL0cvdk9Uejh0WjN5VFhmYXkxS1J5a1RFdmxt?=
 =?utf-8?B?NmRBcjE0bTlxQ1RwYWh5YTNkTjZEOUV5UG04ZmltUXFuWXhqMzhLNldQYmtJ?=
 =?utf-8?B?T2xhQktnMG04bG5YZG1tdnpsZHlTUWwvZFhpSklqbEo4dDlaa1NQWnhpVjVC?=
 =?utf-8?B?NHAyMzJ3bjQyZDhObDhsMjZ5UXd4dFlWOUFQbEhJSkZSVmVCa2t1dzFLRFQ0?=
 =?utf-8?B?RXViRTFESDRNTjZaZm5kV20xbk11aWFBVUNnQnNVZ0JPS2hJdUlnUFlTeWo4?=
 =?utf-8?B?Smo5di9mWTdmYjJiT2kwOUlkdmpoTDlZMTRTYUZiZHlCL0lpRGR3THE1M1JM?=
 =?utf-8?B?MHhwWXhXakNmWjMxd2taQWFmNW9Mc3NmTTdKanpTOTZPQlFDQi8yV0phWjE5?=
 =?utf-8?Q?1C0X3G6QJ3P/9qCQooSNmyb+ysDCgfQvoG5elug?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2feab3b-1a44-42cf-c086-08d96d24e6c4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 08:45:50.8159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eALn/01KGz0exzbybadfJfYcoNwucimaFylaUHc6OYDshdrzUvnB933eze2yzSBIaZ/rNX0blXKT59Pp1oye5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3119

Commit 806448806264 ("xen/domain: Fix label position in
domain_teardown()" has caused Coverity to report a _new_ supposedly
un-annotated fall-through in a switch(). I find this (once again)
puzzling; I'm having an increasingly hard time figuring what patterns
the tool is actually after. I would have expected that the tool would
either have spotted an issue also before this change, or not at all. Yet
if it had spotted one before, the statistics report should have included
an eliminated instance alongside the new one (because then the issue
would simply have moved by a few lines).

Hence the only thing I could guess is that the treatment of comments in
macro expansions might be subtly different. Therefore try whether
switching the comments to the still relatively new "fallthrough" pseudo
keyword actually helps.

Coverity-ID: 1490865
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
If this doesn't help, I'm afraid I'm lost as to what Coverity means us
to do to silence the reporting.

--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -401,13 +401,13 @@ static int domain_teardown(struct domain
          */
 #define PROGRESS(x)                             \
         d->teardown.val = PROG_ ## x;           \
-        /* Fallthrough */                       \
+        fallthrough;                            \
     case PROG_ ## x
 
 #define PROGRESS_VCPU(x)                        \
         d->teardown.val = PROG_vcpu_ ## x;      \
         d->teardown.vcpu = v;                   \
-        /* Fallthrough */                       \
+        fallthrough;                            \
     case PROG_vcpu_ ## x:                       \
         v = d->teardown.vcpu
 


