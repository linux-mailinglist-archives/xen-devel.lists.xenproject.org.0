Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0303C3FEAA5
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 10:33:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177145.322388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLi9n-00085W-VH; Thu, 02 Sep 2021 08:33:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177145.322388; Thu, 02 Sep 2021 08:33:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLi9n-00082Q-Qc; Thu, 02 Sep 2021 08:33:11 +0000
Received: by outflank-mailman (input) for mailman id 177145;
 Thu, 02 Sep 2021 08:33:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K8X1=NY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLi9m-00082K-JB
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 08:33:10 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66e249ba-0bc8-11ec-ae46-12813bfff9fa;
 Thu, 02 Sep 2021 08:33:09 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-HQDKnutlP9Km-SFC1oMmNw-1; Thu, 02 Sep 2021 10:33:07 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6862.eurprd04.prod.outlook.com (2603:10a6:803:130::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Thu, 2 Sep
 2021 08:33:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.021; Thu, 2 Sep 2021
 08:33:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0075.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 08:33:05 +0000
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
X-Inumbo-ID: 66e249ba-0bc8-11ec-ae46-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630571588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QGrOOS+VJ3eASvPOqSojyeVdMYBWoCT8pMRR8J+S6bQ=;
	b=SVBPpEgrtnX1KUYJqZY2JwSJUnF4mUAbNzM6nsOt0d10pmYgHKRTm35RIenERIk9HMpP9j
	a98zUH/+5ZzqVrrmJHY9/Zs+EAzyyseFYEW0IM5986p2xlJms1kZTU0YmlWy+osVq2AuBy
	D2A13sM7On93SO9yyCkTD+Jhwheg3qg=
X-MC-Unique: HQDKnutlP9Km-SFC1oMmNw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rh+lzgizB+Oaq/xwxm81ndeEY5ORQ+As9I0bSFEGtmWiwqTD7aW04BhDWaDWCaEm6Vsm7DvzaKDWtJEXBKfWn8tG8PP6MJobsDPyvZ+oi5idAarrhvsb0YXL47BIsVDvJSjp7H0nOpuvWP7yc4k2IsjCrxLS4icROuBzBtdFzNKjQmkw7xOJwExf2M25ruCDpQZEZ5iQSH7b6HOq/O9rKowuy6r7Kt5ui61Is1GIRgF4WGd6wz0eoP2XlPw9Z7PwDjxhUUVfsLtkDazVD0PLuasQ1zwj7EjbM2gOijfR6rtQkSSAYQr7VB6Ii/BP/gJxi0wFD6C8TrUuTT1b2eQsLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGrOOS+VJ3eASvPOqSojyeVdMYBWoCT8pMRR8J+S6bQ=;
 b=UVGP2pIZ9hKKbLUDr8rzSB9KEcyrOzfHAHCDn1SbpjIX/hhqQ6rw5sz6Tfkq7umAVGlUkXXryl0NgCFWFfkwCD5RA1xCciaPGNgmJlhLyalDZ/jSgnsi6DEA9SmH/mqkNZHj7AijtHgA0to8DyO+WssVG7f7NWN+TYIWB+nT8DSqHMmyEoRGpOG2z+03c1UpyKzLJr2uTBbehqHovGTul+mMvGDd+kdbc4sRe8RhZv0hh6YrCoA9OvOM02LhdoXE1CLzbE6eEdtOzo562DLh7y17nwCD/cS+JhNhCnhIT3ro/wOiOy9hbv84PKl2lI1B8RuFbQ7qWR5BM4JAEagrKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 2/6] x86/P2M: relax permissions of PVH Dom0's MMIO entries
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <5972ce4c-bdb0-6d07-afad-cf4dd5615488@suse.com>
Message-ID: <457637e2-d35c-18d0-ead8-0b513b257927@suse.com>
Date: Thu, 2 Sep 2021 10:33:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <5972ce4c-bdb0-6d07-afad-cf4dd5615488@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0075.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e20ac382-f2fa-4d49-97f6-08d96dec4958
X-MS-TrafficTypeDiagnostic: VI1PR04MB6862:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB68621B6F6E7C3A6FABFDBD12B3CE9@VI1PR04MB6862.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lFdn9aPOLdawBoXCVdE4Nz9eCCGK+Q5syenMA6zgtSACw4CgOMZ/YufsaCugC9GOgE2yxUHiwvmrRLjJIpk7SrJfRxEjeDYuMize4YXW3cr7buL3Iop6z5OORouZtj5vN5SDgzMpvhwdkM1cFhXAkVdp3a5yF9OZfAQYkwk5Iy/PKjsdbKxq3Vz/kDgaJftsgdaGFfbQvaUAOPMqGXFGijiYa7CYxqmEANfMq+IxiC88ZIya9tVp4RsXDLL/XDUwG23NcBJXFXssQJAxZ9AynQnv1MZJ5tmDG5zMW0s0qEIKZHWnn8E2N1sjBTIozZ0cYeJjXmEzTVAtDruTVXhnnesUSpbpwNHm7SFXt2dAzd8EirLE+wvdWQH42Sr5FpPzUTrEU+btt2GhXMC7nXekxP7f1SlfLK21nlsPzLtphBTjzxaaZaIeAhFQ1sAIdGUnI8A/Duh2rhzKscRjSms9IGsNOM9Tb+EUwbQpCKSvllI/18ZYSzikFa1w+VuVfgtH6hWalvV/heF34sZVoDaFYsuCwcPzNh35vsOlqDyFfVk2ZDe/+yLoHI4J2fyGYp6QcU+9poP6zFLQlWLhpGAH0pMjXPXLApdgmSXM49WjFZcYxdeAfzq/oGr5yiW1MvcEjxOLYNUXBLAqRebxyuc7pV8Zs86Q4YRrhCla4j07UdHckR6+sWpQ9mXZ/wFqWa9aNmVX4GMdlXPkRkxOmdC5kuR9q6z97KYTyw1GTqOhcJc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(39860400002)(366004)(396003)(346002)(2906002)(8676002)(5660300002)(2616005)(83380400001)(8936002)(478600001)(54906003)(316002)(36756003)(16576012)(38100700002)(956004)(31696002)(66946007)(186003)(31686004)(66556008)(6916009)(66476007)(4326008)(6486002)(26005)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVZmZGxYOVBhZUpKZ00zbDhpS0dTakNNbjNYL3hXdis0T3BZZDhnWEhXN01w?=
 =?utf-8?B?aVIxS25pbGdLUlFyTHdieEhkSDlvcHBjV3JyVmdQQXh2ZVQvVGdOTDV2V3hI?=
 =?utf-8?B?Sy9zTmpDbjRBbEVIdVVRc1QrUGlWU1k5c2huQnFucWt0S2xKS1ZPbmZEM0Uv?=
 =?utf-8?B?cmpoSlgyNUJwV1RMaHcxL0RYV0ViOHNuT0NHR0IzUHZpUUZLZ21HOWQwTjVl?=
 =?utf-8?B?ZWtCRWRZZnkva3J0M1Q1Y1lqMmw4eW05WHBUckZwdHU5VklISUMxcFhEeWRr?=
 =?utf-8?B?dXFwWkZGUDFyUDM1Z2VkeVE1a1NMdVNHNW8vWWhFTncwcTdFN3FoQndjUk5l?=
 =?utf-8?B?V2UyMVAyMnVGZnp5Y3NkaFBIeFhGTFdCRXV6SjRKWHNhOU14VVBiR3dHc3ZQ?=
 =?utf-8?B?TVJRWXdtWlgxVVdCSUZ5NmJTdnFKMHErK2lZbjZLSGthN3ZIQStWZi9kcDBQ?=
 =?utf-8?B?NlBuZVVaaTBwSHRHVWdMVXI4dGVzelA1OEhuazE3bkM3TXhwNi9YK2JHK3dU?=
 =?utf-8?B?enFhNWNaS0F0eGhFUUw4VmJnWmR1YXZmYXpEY3NLTTRPY1BvRGs4S0ZSN3hP?=
 =?utf-8?B?V0dVV0ozTVZ3c0R6eEVnRG55WitiZFZZV2xRMnVZVWo2V2R2L0kwTXl4SEtz?=
 =?utf-8?B?ZVVFT0E0VXhUemp1UWQ4NjgyVFo4NW1RQkR2QUkrb2FGVUVsRWJnWGVZVDFH?=
 =?utf-8?B?dm1DWG9xa1B4akpUVTlIREJCN2FhVjZib29mM09jK09NcFFobmtXTm9zZnJ3?=
 =?utf-8?B?TllaTm5TdWFSY1o5aUdNckpPdnZBalFGa2xENnZaa1l5QzQyQjFqVEVhbTBP?=
 =?utf-8?B?SzlwblM3ZFQ1aWNLMDNVa1ArUWFTaTZCQ29qYS9JU01UTjVmN1pxd0s1YkJy?=
 =?utf-8?B?Qk5HaEtCWkhQb1F2ZkRJNWU0K2h4Z1NwcllJcWxMaUg3NHpURGZIUWp0RE54?=
 =?utf-8?B?WDBLalQ1QTlCcnJOMld6SFBDNzN0QVpxVVhKczI0YWxwdWo5Q0tyV2JwWElp?=
 =?utf-8?B?UnRhS2MxODVNUGk5M0NGUjV3MEVRVGFDdGlwY1NwQ2lnWFJkZWg1MEQ4QzVM?=
 =?utf-8?B?aWpENGF3MmpoVERLaGdidndMTCtsNlhGa1F0OEFaUWtFb2lJcy83aTZkakl1?=
 =?utf-8?B?ZHd5elp3UGhHZXIxMVlZaWhXTjNsWmxia3VIZkN3b01SbTN2V1p3Z2tuWkFp?=
 =?utf-8?B?eXlrSC9uZTdwVFZVU2g4WjREL3lQclZwWkd2NElCbUphMDIvUUh4TTE4OXl3?=
 =?utf-8?B?YTRwb05pS2t2WGRGcENZQ0tQaUdTU2hOeUVDVUlqZWFrMENvWkdsTUIvdGxi?=
 =?utf-8?B?d2xTcEZ6NVRnOU5Pakt1U1k0ZGF6Tkp0ZmpJMHYzQzJYNGhyVGxzWXZDeExs?=
 =?utf-8?B?V2JscGtja2k5YzZrajJCTGRkcDBoOTdESWR6eVFKZGoxQ3VFWW1NMUlMVDhj?=
 =?utf-8?B?ODdpNmVZMHNSZGowL1hVMkYxU2Rob0cvUDNlV3hHRE1Ld1RJOUdOOVBkb09S?=
 =?utf-8?B?TldkNGZRN0MxL0hxenNCeFNSMnZuREZ1QkRzbnYyVEx6b3BuaGtPS2JZZkQ4?=
 =?utf-8?B?YUIvK0doZ1JoU0pUVWFWc25jV1lsVWZIVzJpTVZTUHV0QlBWdEh0YXZQdm1W?=
 =?utf-8?B?ak9kYU5uS25QaWNjclJwNW42RStTL0hiWllNTEhpVkRoSGp3eWlDYmZuaUR6?=
 =?utf-8?B?WTBtbEl4aFpjRGZQbjE2M3pseElBYWEyaEJyNElqV0pCQWZpbDhmMWJVaHd1?=
 =?utf-8?Q?xPb68Wz7OitJcxLikf7f3Pb2bAjFz5e+VFtj2a6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e20ac382-f2fa-4d49-97f6-08d96dec4958
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 08:33:06.1307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CdqcVrJ/MlU3FZzJXiIeI4nU2pwKHFML8YKsvPkMmdLQ7NWSPpTIA/IW5Iv1WT+ch2RGs5a8DF4tOaleKOlJRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6862

To become independent of the sequence of mapping operations, permit
"access" to accumulate for Dom0, noting that there's not going to be an
introspection agent for it which this might interfere with. While e.g.
ideally only ROM regions would get mapped with X set, getting there is
quite a bit of work. Plus the use of p2m_access_* here is abusive in the
first place.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Split off from original patch.

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1319,6 +1319,18 @@ static int set_typed_p2m_entry(struct do
             return -EPERM;
         }
 
+        /*
+         * Gross bodge, to go away again rather sooner than later:
+         *
+         * For MMIO allow access permissions to accumulate, but only for Dom0.
+         * Since set_identity_p2m_entry() and set_mmio_p2m_entry() differ in
+         * the way they specify "access", this will allow the ultimate result
+         * be independent of the sequence of operations.
+         */
+        if ( is_hardware_domain(d) && gfn_p2mt == p2m_mmio_direct &&
+             access <= p2m_access_rwx && a <= p2m_access_rwx )
+            access |= a;
+
         if ( access == a )
         {
             gfn_unlock(p2m, gfn, order);


