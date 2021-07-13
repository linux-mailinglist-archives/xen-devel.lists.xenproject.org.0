Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AC73C6B2F
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 09:23:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155037.286338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3CkZ-0004YJ-5C; Tue, 13 Jul 2021 07:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155037.286338; Tue, 13 Jul 2021 07:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3CkZ-0004Ve-1t; Tue, 13 Jul 2021 07:22:39 +0000
Received: by outflank-mailman (input) for mailman id 155037;
 Tue, 13 Jul 2021 07:22:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3CkW-0004VY-Vr
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 07:22:37 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1836dca8-e3ab-11eb-8728-12813bfff9fa;
 Tue, 13 Jul 2021 07:22:35 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-mCZHXbfTOuCRdYVv55B5vA-1;
 Tue, 13 Jul 2021 09:22:33 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2829.eurprd04.prod.outlook.com (2603:10a6:800:bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.25; Tue, 13 Jul
 2021 07:22:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 07:22:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR03CA0024.eurprd03.prod.outlook.com (2603:10a6:208:14::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.21 via Frontend Transport; Tue, 13 Jul 2021 07:22:30 +0000
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
X-Inumbo-ID: 1836dca8-e3ab-11eb-8728-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626160954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YGOrdCOMlh6d+dkgExNRzWBXwcOU2OHQ/LG4J2hiiWs=;
	b=f6MxehUT+wvodfOt0JvJxrTt88eKz5DinXLdQN461/qSJSQ6xqjuBrsofM1KvCrfTXtmAj
	t+7vZLRFU5UIdFLvi128LVnrLYJlhZciSmCqevz1QctA1Yok+VrvXIiR/lSY8BORrNuUU+
	Q75T3/Z7zSYD+e91PE3Np0xA4LSdVI8=
X-MC-Unique: mCZHXbfTOuCRdYVv55B5vA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdhKHY3PW+71sqJ4yTILHf+KO+y32UQINGuv0diXdfM2krUWHwMQWvQdlxcQmpi3k26oALUKQXgXaoeXHrGQcYYm/b0QwhjmYKXbUMftD9fjEKRTWWXdQzxaPSgzWWCiaJm8/6m6u9qXI9KphFsYZtdQMWZeRoilsjRigfmz9Ez+oEeyGuVcmLUv4JxbavuzlDIOAE/xQ/e9S40kuK6Exi43918Yomh+NYt+5fSSDg5pR6WkjR6BtmuWflqUEd+M9pvaM0LoSmemKLfDalxDYhyMJf+779ojw3EziXbRxojeJfkUxS/+YS/2RteyLbD2hCpmFjTxT65hDqRxQGdCSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGOrdCOMlh6d+dkgExNRzWBXwcOU2OHQ/LG4J2hiiWs=;
 b=j/8Sjhf1ejpXy6HWlhZIWWspJX1z1ZJ5kw9SvW19+mCWrmFQyhtfrTu1UkakcWX4AO1n4C6J0Y1yUclT8r3qFzW/nbkdlSIZnLlQkpVEgSwgSAH790sXeTxBAiK6Uj0/Kk3do6HoAsGhskdq4OPvDCzdbryyFwoivHRQ9HY9Kxs+BAqYinU5vGheEy0BMN5NtH5ITYCKpMvdFlSBJXzPkGoJpI4xNlhJ8wZAkQP7sxJWBeuse7lsBl8WZzcsQD7Y9PTY5XMxrYZWiLwyQyMk5IMbMz2BbJoyd+LJpFm7LKuVbqtww2TIOUDWPtXYHTYbpj+hwOnrNX6G7m6q7oQn2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/AMD: adjust SYSCFG, TOM, etc exposure to deal with
 running nested
Message-ID: <cd23fd18-66f9-55c7-4a1c-a50d66628d69@suse.com>
Date: Tue, 13 Jul 2021 09:22:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0024.eurprd03.prod.outlook.com
 (2603:10a6:208:14::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0873bcc6-d74f-4370-4c66-08d945cef9dc
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2829:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2829B9777A763F77BB2CC4A0B3149@VI1PR0402MB2829.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4012Cm59RuDHPmALJLatlAGUOt+Epz90RTX5Afri4KQ5HXBZbVQFyg7TAyAVumhWsHDV42y+XPo7uiJzz4uQiCMAnVN81yQGq+pHH6j8UGsIfO8B/xBSeBLL7EEDFGkNcSzUs5MVdwkT+E90eoLAI/OIGbDwTwIex/nRwnSDp0+kEkNC2pWJvd20vkgC0zDDpE0c/Cp+2tFBfdN8EaszbnPSKq1bIzUDfxr9db6p1rB84KiAna0JVROufUgp430xOYqH/RTSmCc8T1k+wNaaHukm/LGsazPqh3Lj0N72cE8ghk1bdNdEjepvD+vA1+bgLZL273TFKrwP850ReV39NfAN7zG6tQN466YvYs90ASl4HdRHJvn/lhtsR4ooccGRBou7uuR7SsSAGFULcpR88HCruxN1lIuOzhz6L1JwF1wxgQeVDBMxNTuzDn42guBX7kTPhTE3AK8QcBiUCo2EYOJF9QUWyPhIG8uZ0DFq/56UfLAvjMe0ut8E3yUs9YkcFaC+X8o0otuuYNQ9q49YuMYcePXpIiHka5ZQcnpCqHdfcjthBNlz1RPa749+jwLYbVnVYhclk4/lJNbqYPjC+DJOVKnCXoUcFH8VlREQaC6ONlLh08NIMXjwWg58COeXdujFJQiuAS3BK6HbDvy8EcPeDxLC95x5be3BxYLHUEyglfTpUpNGNEIux7cophaqAM6ztquOIHPWY8MvWShvhHGj5yDKEftcXUJfLs7SXKE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(39860400002)(396003)(136003)(346002)(5660300002)(26005)(6916009)(6486002)(186003)(2906002)(36756003)(478600001)(8676002)(31686004)(66946007)(66476007)(66556008)(83380400001)(16576012)(316002)(54906003)(31696002)(956004)(86362001)(8936002)(2616005)(38100700002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVBrSUsxK2dVb0UvdXBQL0E3MFhvdDM3YjlOdEdmQWxQUnJuYllFTFp6MFUr?=
 =?utf-8?B?V3o1VWo0ZkZxTGc5a0Ztd0NlOXFsZHU2ajRiSy9vUWF6NTBTd250QzMzMGU3?=
 =?utf-8?B?Ly9TYVpsYm1icEVWVU5jWXJCeXpVbEFRODJmT1NTVkN2SStBMUFyVmk1K2gy?=
 =?utf-8?B?QjYxVUtmRkxlSVVPWTNUdnZ5Y0RxYjlhZWNjbUlneHYwTVhhRGlCNHRtTzdv?=
 =?utf-8?B?TUYvT0gvMUJxend3NUdRMGRRVjdHTVJaaDgrVXhJTWVRckMzbGVrd2dEQ2dV?=
 =?utf-8?B?N1BPa2VneGlPODNEQWFUY1JaNTRwWDEzRHVoMHBWTitkYmpkY2FDazVSN09X?=
 =?utf-8?B?VERDNWFEWFdLUmFWQTdOTDcvM3p4V0JwVzhFT3hYU1JDVXFHeHZFVFZTeFh1?=
 =?utf-8?B?YkE4YVRmT1d4Ty8zYUJUbXdsOTVIdFVua3p5M25yWG1HT0l1Z0tnYVE0OXNU?=
 =?utf-8?B?MDRnVWRocWxYYVc5eDdmVjFTdjQ0YytNOU5Zd05oUURRQk9KTVphbE1idGlw?=
 =?utf-8?B?ZVkxaWliRVN6VDh5eDQ0NU5BNDhBRkI4ZXdHL1ZQeWZiS2Z3a0JjVStGM0k2?=
 =?utf-8?B?Yko2Mkw2U0txM01Dd2ZkZGtwZHV3eTU0Wjl0Z1JjVWwvQjhoUVRxWEpjaFZS?=
 =?utf-8?B?ZzFqSVAwcktBbVhYOXovR1dCV1ZYZHhCaG0weDVQVWtzNUpCQzZCVVJkSXda?=
 =?utf-8?B?cm54VDRkdEtEckYxNCtqSDFkaTZzTzZFZ1doVjY1R3F4UU82RW5GdnBsRG9I?=
 =?utf-8?B?bjdLUVBzaXdKQS9zZGpxRGJUNTViTFNGYzQ5Z3UvTEtySGtCM1BmRG9yRlRH?=
 =?utf-8?B?dkpVOW1nQnJDeWdzS3BJNVBUN3JFYnM4MStTMFdKVFlQKzBMY29jUkNXNVd5?=
 =?utf-8?B?dXZLZ0MweGNFWGlESVpiVXA1TEM2U0NGcXVvOFA5ZHc5SUl2b1pmZm9YcGdZ?=
 =?utf-8?B?V0o4MmdVcWZNay93QW0xU1NWdjJlTXprVUZzUUxNY2lKSWtoMXp4QmxvUkpX?=
 =?utf-8?B?ckZqT0dRdGtoQzRnN3F5VURzazVPVEQ4eUpSNzJGeWRyNTJ6Nnd2NzlpQitG?=
 =?utf-8?B?cEJiYWxRSzFyMis0cWxaU0NDTm5NZ01ZSWRndDZVcjl0clA4U3Frd2NqSWNR?=
 =?utf-8?B?NW51K3FqRDdOcWhsTlVOS2NaRXUyWkRicWVPZmtUYWhuV29nS2JlTnByNUJ6?=
 =?utf-8?B?Sm0xK1NnK2xvWjg5QVRETi9wamUxa3ZsN2d5VkpMUFRNa2N1WFZrOXUvM3V4?=
 =?utf-8?B?dXhaQ0wrclMvak5GWGRrRzkyaklMTTg5OVhFUE1uazBMM25vM2lQVk1WZUVh?=
 =?utf-8?B?S3hrMVc4UzVNcTJpR3VaZUVBd3J2eVZjZ0x0cGZxc2hkZXljNWNKQ2owVE12?=
 =?utf-8?B?UlBxWTc0NVhuV1RDeExKOXJrRXd6bjJ4a1MvNHZ3SVBJaTZaV1dWTDZ0dUhq?=
 =?utf-8?B?RTB5dFl0ZjZPc3JJWnFkLzFIUVJUbFh2c0NLU084V3Bnb0ZOWE4rZzZleEFs?=
 =?utf-8?B?U29BOFFBKzFIQWQvK2NLMnBvWklUZy9GSFd5bzFDbVFkL0NxdW5wSk1OdnNt?=
 =?utf-8?B?SUgyMVRwUXJvVTljU0xJWlU5M2tOYWtGOTJBRStjSzVjUnFWZmtjNnhLYWhk?=
 =?utf-8?B?QzZzcWFROEJuSGFnTWRGN25JUDE4L2NkOWhwMkhja0xiTnczT2padnd2M25O?=
 =?utf-8?B?VHhVcVZrcllwbGVzcE1Md3FRNjFQY1VFY1hhR1NxWTA2a01xZHgzY09ienVQ?=
 =?utf-8?Q?zibgr5LWl6MzgMiw0cn806zEXodlkNBC+cblyKd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0873bcc6-d74f-4370-4c66-08d945cef9dc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 07:22:30.8119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gV8m3NJsRGwIfK3L1kOeqVp8muQZI4TiWreDFVgl1nTT5AlqlZBZzNTj4MnFXcFDGQkilNY9z2oFl+blIvoLmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2829

In the original change I neglected to consider the case of us running as
L1 under another Xen. In this case we're not Dom0, so the underlying Xen
wouldn't permit us access to these MSRs. As an immediate workaround use
rdmsr_safe(); I don't view this as the final solution though, as the
original problem the earlier change tried to address also applies when
running nested. Yet it is then unclear to me how to properly address the
issue: We shouldn't generally expose the MSR values, but handing back
zero (or effectively any other static value) doesn't look appropriate
either.

Fixes: bfcdaae9c210 ("x86/AMD: expose SYSCFG, TOM, TOM2, and IORRs to Dom0")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -367,7 +367,8 @@ int guest_rdmsr(struct vcpu *v, uint32_t
             goto gp_fault;
         if ( !is_hardware_domain(d) )
             return X86EMUL_UNHANDLEABLE;
-        rdmsrl(msr, *val);
+        if ( rdmsr_safe(msr, *val) )
+            goto gp_fault;
         if ( msr == MSR_K8_SYSCFG )
             *val &= (SYSCFG_TOM2_FORCE_WB | SYSCFG_MTRR_TOM2_EN |
                      SYSCFG_MTRR_VAR_DRAM_EN | SYSCFG_MTRR_FIX_DRAM_EN);


