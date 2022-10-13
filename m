Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 367DB5FDC10
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 16:08:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422213.668076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiyrv-0005St-35; Thu, 13 Oct 2022 14:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422213.668076; Thu, 13 Oct 2022 14:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiyrv-0005QQ-09; Thu, 13 Oct 2022 14:07:27 +0000
Received: by outflank-mailman (input) for mailman id 422213;
 Thu, 13 Oct 2022 14:07:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/C9=2O=citrix.com=prvs=278604417=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oiyrt-0005QK-Dc
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 14:07:25 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d9d4606-4b00-11ed-8fd0-01056ac49cbb;
 Thu, 13 Oct 2022 16:07:01 +0200 (CEST)
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Oct 2022 10:07:04 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MN2PR03MB5357.namprd03.prod.outlook.com (2603:10b6:208:1e0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 14:06:58 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%6]) with mapi id 15.20.5709.015; Thu, 13 Oct 2022
 14:06:57 +0000
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
X-Inumbo-ID: 4d9d4606-4b00-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665670042;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=7JgzM7mH3y7MvlNDCzKSymbDLRBLSICj41JVKV3zNiM=;
  b=blc21MO/9QHZ9I8UYN0B1z3QbzK/6ZVj5G2WU+nl9QXuG9MHWACdX2cp
   FmHVYmYd7AuXxlzBJRDQf5DzK+W+7h+pQm7YzwRXuhE55s3lSbR28zsib
   U5IgWN84jBRVDmtFZTntwJnIqidggNfth4XvDMGKp8wcek57jS0gQpg6/
   w=;
X-IronPort-RemoteIP: 104.47.58.103
X-IronPort-MID: 82668859
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AxdZ6Aamhti0ZMzB16356vDno5mJPLRPFfQ1M2?=
 =?us-ascii?q?KgaY13mRzABGkScWkptc8ngYBzUGyFykm/wyE+D3Ja0mr1dQsJyx8xlu9CrO?=
 =?us-ascii?q?Ud/HK08XwqWoLOrNI02NE6BQa63M8AfmJr28CW4dSCZRVBU63lCgdePy/uRw?=
 =?us-ascii?q?4lT/srhmdHUsbwFvVfPADaDYqCXPgBffYrCDdtKEVkUXj0hex0Xd8LxH1mq/?=
 =?us-ascii?q?hZPdPMcpX5Y5McrtK+KKX8AXinVOor7AgYLjevKvMUMW2qEDGndgTYAwcqGK?=
 =?us-ascii?q?rUvgNmIL8D1b0o/5cJcG9q0P0pFE4zpvuhBQzsMrTc2gmC5OLlALa4M8OpLv?=
 =?us-ascii?q?G68zUFgSGQljKRabI/d82Pz7kAfE2svRoHt/h2FZgt7vAYbcOV+fP9cbyPoL?=
 =?us-ascii?q?vPq5IXqPecN6lEgfFAA29LPPrWSVZnIjwwKjEtCWs6EwaKrspLaO4OCAvS3g?=
 =?us-ascii?q?iYDcl6SKUeW4x+aEB8ybZNIfsIzQcHJZbSFelBjeaJyIxRrT0EA5NQzOQqit?=
 =?us-ascii?q?Dc6BnrMvjW6nEp4xmIYnBVcQlOT2em5zz0O7klQiuEN2nLdD967amaF7vAPL?=
 =?us-ascii?q?dm2OM03xMZSyK1D0yBuWsYn+2oGa4PnHR8AkLCmeNB9pzjnqPRDSoPrdwFrn?=
 =?us-ascii?q?/7OxdidS0IP5IPSHa4ubtqKuvYeQVeevU3QeHCunQSwRfeKwPB81XkbffNUs?=
 =?us-ascii?q?Ut1242i3rS9dAL4jIre59fd6ro2R7oWTmuzf8amhLyYyMzCDN5aR54Y22bYg?=
 =?us-ascii?q?I3y9agYG0JyocSRvdPA6VVcZxXpE+Zfzr79XrFCRbSbRsHbWv/TROkwZ7Rpa?=
 =?us-ascii?q?mEnSoF76Oi6zCfLCZYOKuEVBPeN6KlxKBPHtaTyP80UKTVNii8nsob0QYWDB?=
 =?us-ascii?q?TMI92GzzLoMxNdmnXVyX9gJu/7FleN3+iEGo3wQ38p02I42kxz0C8UPWnKiN?=
 =?us-ascii?q?fcqpFm1SpM/0Y+5o4CxUx881EFriBQl5FwiTUu+2GBkad++ycMrM8ZVAgZjO?=
 =?us-ascii?q?OpEHkc52s0q2AjiDl6yXPC98xVUno1j9dNM9i4Yv5k4U8BEgXcJYz5nYDA2U?=
 =?us-ascii?q?Fg8x7h+7oF9ZhesEqw0/WfkMkFRtCSgW9u/iIzhO3HwlU6Pd2lXsYMpeIIHs?=
 =?us-ascii?q?ELwgk6xu+Dl9RDkCMaSVJdTfmPRZrCumg0DSKpOoPlIBNzv47xcLu16+J5P5?=
 =?us-ascii?q?85sb7DFy4bKPBFa+KERKa4hp6UWhPKH6uiMk7YVgdLVatXwfGDPb/ZhIZDp2?=
 =?us-ascii?q?OuhjlA8ALKgI/IW4E1IsIckYe2AMHqGjeCvmPFlE2fKT8d7KQxB2p6YCgw8e?=
 =?us-ascii?q?iy2KYQD8Bsd+fWXCCrd09mFug+8R0cc++yFHrVN4gGivn9XDh534B6cN8Fz8?=
 =?us-ascii?q?nFSzJj3GjreQzkCVN9WkkFBolGi5Jhj6hXoFqHrhOhm4YVuXew6xZszCtGSW?=
 =?us-ascii?q?plLAkMzXgzL/h4K9UAFK9cgJDrAG+Y+Z0RLrCcVw9h1buXxw3fUEaLuWQUeI?=
 =?us-ascii?q?mGNNZZjz4fyD9LTxiNE0VXX2/TH+Q7gqtwEVsDT1osdtGXs0XkiwuhhnDdhR?=
 =?us-ascii?q?CQtTXKpWNMNmSZt6upJhEToW7TCqRBKLWapgHs3QXm9+kuO5bbFkfPR+RKVO?=
 =?us-ascii?q?7Cp1IT+VhKKEZ4euHtD7KDlilgvBwPkDEc8ZPnFJ1kJqr2anQ1zSREefUhUm?=
 =?us-ascii?q?/lbxzLa4gFgbsL9EMj01cXP3855LP7uy23DPhxgJnPPT4E95yocUT/eLCTpF?=
 =?us-ascii?q?JMctA/oI5LylxZaH3lmYYKQQlundyj9jFoR0kO57n6V6YLwosc4+5IuMCuK8?=
 =?us-ascii?q?zsPOVfHQFdBzOCz/EjMXrTP56EpgCvh2qjsgYvpiXmMgB8DWFCrKsxb/TIX+?=
 =?us-ascii?q?hGVlOZ5hiv2Ti5Ljq5rr1zpLBjcFouHvDovdfvNjiiFQHNB2wcXjdt3HfBmu?=
 =?us-ascii?q?djbLQofT73arQ47BxNqGTRRAqRtO+3uEafQ8q8uK3X8dGtNAMmZ5Sb2CtQ8O?=
 =?us-ascii?q?B8R7GpKT2mIZ3pQKKvGikhIxj0MtfGpfp/c/aNYFQ7DvrUSPfOR1/7XRfJFH?=
 =?us-ascii?q?x8qquRJSE6QOKpNb/RYY1gsoBQMAKKm1BoohEJpYLeN10nx9xXvB5Nd5BPau?=
 =?us-ascii?q?BKVkgPHjqJadb6eILhbskhm+23lK67vhrDUWXQZzUV37qnxB7IodpSQEo0iF?=
 =?us-ascii?q?lO7vv4cJCYoZU3YLtLHR/5dzopx4IE3Gt6HCSz0VqcK54DIaikHFG1tKYQdB?=
 =?us-ascii?q?IyfvBPIGlQI43AP1AertdAhlDkvGdMAPB7CDLgbzKNPzjxbInhm+6pI0/Wa5?=
 =?us-ascii?q?cd7bqenV8kOFq2egr378C/N1bBVX68n8FkyJYt8qRA/XcmLndeEzZrW+Aaqh?=
 =?us-ascii?q?lve5XVpG7P1QFCcX46nVNKynxgS0R0xd4+OrtEf3wdLBYB+D+lELkVLg63q0?=
 =?us-ascii?q?vGF4+HnvZi+NqvAgyeT6kppJGPs2LNIhudkB6BVqpeEghFrJnAkYUkt+wxwT?=
 =?us-ascii?q?6hkWlcsGQ=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="82668859"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgIVmSgVnDeKp3F1s25BW4SF/tTGtDKSJKGSLHtUY5kblCtMrNjLxQWcTQyy9Pwui9SZ8tauUD3G9YFjp+DD0V/DbvvZzdvvi/Gtwv5Q5bHa3/BZGjsJaqx83LFPoOTjk3L/GwFnaXwaNkH8ZUaP2gUdc7xKndnWQYfPhk1dhcd3mG5T4tcMGALmcXcYykR41A9hK8h2ZPF6mcBOJ92Cv+QjfMhgkdj9yHGcQgzOS9zZLEzNrE2T00QzYw3NCnQ/yA5RTwWWuNktSigxqzJcTFdacscnISuUqtqGteoby7euyWzPpt5NCEeSjAAMC77Xw+dFxjZhK8BqfrOp+58lDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xi17J4/zjM9vCnKOawrM8zHpxGTKfT8tBrMmDc9pbf4=;
 b=fAzwtTHPe5Dcmo1FA7N1ZjNYTTrKRdoh+brQF59AkIsTbdDBitGTZ1HYlibb9GUVmhGBTc7rSANwPNajJx4yxQI1lrFZsySzT3t1B0BK2iMzl3ALOcQDFiALOXdlxPZb/u2FyFiVeLqGUe9SLg4uNmV1ON7lOvgtN/i0BHku5NkXbrmNBBsP+tbUznyZSIDv1OzRLC2L3d9Bgxd0Ej9/xVgxyks1xhG7z3Af6n4ysk35pyyIgmC6AAHDD47QIiFBF8bKbQMTv1m48SGrEjRHg0S07cAnFlU/WBxAiMM/e1xc/HP7YX7d59Tv6eVwtL+/fz4Iu42D7ez5V6d+lEBhFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xi17J4/zjM9vCnKOawrM8zHpxGTKfT8tBrMmDc9pbf4=;
 b=tpJ3hvM4pqIYf2GjK5RUl1WVkLKj+9I7J95aFOKOUteUcEhECpF+n8MhrKRMier8sp/9FFmUJMg3IELnietlkjAPdqi8MQz7XAG2zZJLXx+kpz0W9GrmHk7K2PkDrWGTqtLujj3cmV4j0YijZlFdaW1JJ/o2dnfnhaQc/I8HbI8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 13 Oct 2022 16:06:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 4/4] amd/virt_ssbd: add to max HVM policy when SSB_NO is
 available
Message-ID: <Y0gbfCi5kp2qBxuv@Air-de-Roger>
References: <20221011160245.56735-1-roger.pau@citrix.com>
 <20221011160245.56735-5-roger.pau@citrix.com>
 <1f70c472-1b62-7c79-dc31-65fca8040cfa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1f70c472-1b62-7c79-dc31-65fca8040cfa@suse.com>
X-ClientProxiedBy: MR1P264CA0212.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::20) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MN2PR03MB5357:EE_
X-MS-Office365-Filtering-Correlation-Id: 648a200f-99e0-47c3-37ad-08daad24307b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AVHmmqiB/bq87Xc6LDQXtvA0XmNduosJVQj6rYjYomGdtOJvWEWbRRXAsMR2FCaiBEoQSaQGQYJzAZh9FzuAWKhvnntuXZW4J4WOqCsCsKoLDMfIDy/hffq2eTBv8cvaSQLgPCQCpPFfsfqfchWdh2UYhI9Oq4Ju6Bd/1Oy5wXZ00HWjP96sar8v+vKNHkZ5dl5CNL/HtnuKJzUr26B5G5SYneK2hd9x7+JXpkwEMkZ/Wzkck58YgdL/6D5bjxFRUVbrY9pv65WSn0mNEevjRo5evg3RKdxdqBf4Zcrdl2C7JnUg8eAf2pBpiIuWS8HV9HQBBvTpewBWaFnCrLvoMiWePEEd/+hsZZEUOA9kDBTS+qopRKCaBfR14UxXTKN2XDwwKjqJbrqz3svORlmO6We+BzX00enW64OSZQtf8OguToZpfh6nOjK67QOUCG+uSxQLWnu0Tubx1zK8lJbsAP/JV6Fu7ds5u90QUCJQFykloIzuVaqrb74DSZn2Krwbi6VkifMRNj7GZqGQJXreZDBZ855FIJ3wNKZlxqRiwCzlBraBdAzFy3r36KDyKcQAgBQXgxbKoL7r8TWa0eTQjTaMJAVCbGGoefuGw2qk24HRjP01xBFR45+ljet3isylnq9ec3H8ULWHdxkWZiDutgmTY2QoftT08/pBcg+KKT4LQNVbN8KqDvgz3+06h7jA7sBE5bAgCJAgpJ1KSkjmrg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199015)(5660300002)(186003)(2906002)(6506007)(41300700001)(9686003)(6512007)(53546011)(26005)(8936002)(33716001)(82960400001)(38100700002)(86362001)(83380400001)(85182001)(478600001)(316002)(54906003)(6916009)(66556008)(66476007)(66946007)(8676002)(4326008)(6666004)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkQ0Ym51d1pqS1oralAwU2NkZXJnRjloQkxwbURsbGMza0YvMjBEOUlVaGRU?=
 =?utf-8?B?SUpOTGRzMWN1eml3eUtETjVVQi9EWExvR0ZTRFppMEQzWFZKdFpwREpnZmRL?=
 =?utf-8?B?Mk5QbVJMc2EwR0QwZkJIZVpHSll2NHVad0VxajBJVzNHdFUzVHkvSGw3VFVk?=
 =?utf-8?B?U1hCM0R2OEg0dGc2bXVKVFkzMlJEUjMvaDl6SnhITVhaVlV1RHpob3k1b0sv?=
 =?utf-8?B?K1piMFlxVUZqOFMrak9lS05SMDQ5SHMreFIxVWdERHhxYXp1OHFHdmZraTdw?=
 =?utf-8?B?T1lTL2haejd3bkVqaUIyOUdtNllTK2N6OUdwYkFheDlKcmtCY2x1ZGhoL3BN?=
 =?utf-8?B?NGRiL2FKYVJGWVpXMWtJdlNtOFduQjRWY0kwY2VvdUV4KzV1RGtsRDZaUnRh?=
 =?utf-8?B?b1R1aTRjWEtBTGdjbVZ2MTREZzg3cUpNR1JqL25uM1B2NDZqdnNMblIwMWw2?=
 =?utf-8?B?OEt1eEc5YkRyT3pYQm8zQkJ0aDFUT1hPb2FHVno5UUZ6TFc5Z1U5R0hmUzRQ?=
 =?utf-8?B?VEI5dG1MdGI5ZEhKV3hucWFOZWlUbWcrS3BQcUphMkxxSFZIcmNjc1VLdlNU?=
 =?utf-8?B?OU5jR2swWVZlMGpuQWU0N3ZDbUpLUVZ1MFpGdlVHYjJ1R2RDdzlWRHhyVHIy?=
 =?utf-8?B?WTdEK1dWd1VKd0FZZURMK3pyWlhaR1FRMjB5eGY1NThEZFZ1dUpCc0VQL09U?=
 =?utf-8?B?dHFSYU1xam1sdk95cDdBZWRldHVWbncyb0I3eGptRHdmOGxUSkJnRXd5Wnla?=
 =?utf-8?B?ODRlVnFkUWlCRUsyT3QraGwzcVFtZlN0d0U5VWR4WlQ4alhuczJScUZYVFRN?=
 =?utf-8?B?a1BveWVUQlg0djJiVGZNQUhzUmpZeFREVUhvSWNtSUsvOTdSelVlbmVqVUha?=
 =?utf-8?B?M2Z5TTNnZk5QbUJkQllMSkpMc25LQXFFcjFQOUlmUy9sM3dNMkNJOExmRDFQ?=
 =?utf-8?B?UUsyYVJPbFNBd2hDWGhsWElhTWl1QnRCSTlNL1lpaWI5UDdod3UrclJFQ1pU?=
 =?utf-8?B?a2wvaHdIZ0ZvbGhya1pvSjdVdUxCZm8xbmcwR0d6WnlyNWxaSUFkK25rMFhj?=
 =?utf-8?B?bDJLV3ljSVRWaTNtUDJnRXlNNlhUd25Ba0ErclhUWS92Z3FFNzZ2YmhkTnFX?=
 =?utf-8?B?N3BpUmlRTG1EeGJyT3VYSVBUbzhXWTVFTWdTalY2M1RFMkR2TkFHZlo3Tm12?=
 =?utf-8?B?dFgzeGJxRDBUSFRaaUtRc1V2UzBJczZvU0tiSGpCSzZ2TDdCbmIzNy8reFZ6?=
 =?utf-8?B?RG1XM2NzT2ExemtKV3I4WTl4WGFvMHByNDh0K0c1QU9QZmk4enBjaVhFYlh0?=
 =?utf-8?B?MG96Q0pac01FSzF6OElUVWhIL2lhOFFEYk1lN0xqT3pBNzQwODlXUXFYaUw0?=
 =?utf-8?B?ZXo4OVh6UmpwSWw3bG5vQXlkWW5FZCsrNGpBV0FJOWpNcUZhMFFGS1QyOUJN?=
 =?utf-8?B?eU5tQndJbnhIbXJEVGtEc2lPVUFrZWFIbVh0OCtDajNlMWdyVE5SL1pDNkcr?=
 =?utf-8?B?U2kxMExCc0w5MnZMeVQ3NmZLZWExT2p6cjhINHhQakVQa0p6R0N6U3kzUXZN?=
 =?utf-8?B?Y2FPUEttZk14WXBtNFdMMmM3OHFRcXRFcCtCSER6czBVQ2ZYeWhldnhKaHpC?=
 =?utf-8?B?Yi9nVUtjcXJiTTEwRjFMMHNtNlFkNlBaQlNwUWpXWDJWei84dWgycXVVUzhN?=
 =?utf-8?B?TzV5aWovNDN1WnRseSsvSnptT3UxU25LOHVSM2l0bU9IU01NcjE2dFVWd1lr?=
 =?utf-8?B?V09JQ0d5OFJEbXJDTWZVVm9iOWJidVJXOXpHV0MrWlVDL0NvNnZITDEzWkxX?=
 =?utf-8?B?NHJiZ3pVSitKek1hMnlVSURhT0g1a0lPbExzbkhEcERaUHExcUFmakJQUUZq?=
 =?utf-8?B?U2NxZmJYTWRIdms4RjA2enYxVTVTSDBFTU1ZaUR4b0x6MjE0NDdVQ3h2akF4?=
 =?utf-8?B?Y2ZWd0hqOThUVTRjU2RTd0pSV0pKaml4OFhTdktOenVWTGZreUsxYUZ2ZDJr?=
 =?utf-8?B?ZTVOekVOais3M1NKKy9mRmt0UCtRMzVRK3ZiWXA3VG9KN0kvVDdHQXFFa09i?=
 =?utf-8?B?N0tWeGZhcG1CRUhkUEdZeGxIRWFFMVVnMElQR29WYXA4MmZweGhhTkVCT0FC?=
 =?utf-8?Q?jIWh+ExT5tNzkSFJemeyqhLDM?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 648a200f-99e0-47c3-37ad-08daad24307b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 14:06:57.5155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IAWERPFO/hMiSzJ6XmhYDkd/fBTGcpa5x6Ug1egOnqiTe9NoYSvXvOumGf4iFqfIrV76lfKlUl7Bov51rSn3Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5357

On Wed, Oct 12, 2022 at 10:36:57AM +0200, Jan Beulich wrote:
> On 11.10.2022 18:02, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/cpu/amd.c
> > +++ b/xen/arch/x86/cpu/amd.c
> > @@ -814,7 +814,9 @@ void amd_set_ssbd(bool enable)
> >  		wrmsr(MSR_VIRT_SPEC_CTRL, enable ? SPEC_CTRL_SSBD : 0, 0);
> >  	else if ( amd_legacy_ssbd )
> >  		core_set_legacy_ssbd(enable);
> > -	else
> > +	else if ( cpu_has_ssb_no ) {
> 
> Nit: While already an issue in patch 1, it is actually the combination
> of inner blanks and brace placement which made me spot the style issue
> here.

Oh, indeed, extra spaces.

> > +		/* Nothing to do. */
> 
> How is the late placement here in line with ...
> 
> > --- a/xen/arch/x86/cpuid.c
> > +++ b/xen/arch/x86/cpuid.c
> > @@ -558,11 +558,16 @@ static void __init calculate_hvm_max_policy(void)
> >          __clear_bit(X86_FEATURE_IBRSB, hvm_featureset);
> >          __clear_bit(X86_FEATURE_IBRS, hvm_featureset);
> >      }
> > -    else if ( boot_cpu_has(X86_FEATURE_AMD_SSBD) )
> > +    else if ( boot_cpu_has(X86_FEATURE_AMD_SSBD) ||
> > +              boot_cpu_has(X86_FEATURE_SSB_NO) )
> >          /*
> >           * If SPEC_CTRL.SSBD is available VIRT_SPEC_CTRL.SSBD can be exposed
> >           * and implemented using the former. Expose in the max policy only as
> >           * the preference is for guests to use SPEC_CTRL.SSBD if available.
> > +         *
> > +         * Allow VIRT_SSBD in the max policy if SSB_NO is exposed for migration
> > +         * compatibility reasons.  If SSB_NO is present setting
> > +         * VIRT_SPEC_CTRL.SSBD is a no-op.
> >           */
> >          __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
> 
> ... this comment addition talking about "no-op"?

We need the empty `else if ...` body in order to avoid hitting the
ASSERT, but a guest setting VIRT_SPEC_CTRl.SSBD on a system that has
SSB_NO will not result in any setting being propagated to the
hardware.  I can make that clearer.  In any case I'm unable to test
the patch because there's no hw with the feature that I'm aware of.

Thanks, Roger.

