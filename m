Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B614722AEA
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 17:23:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543783.849038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6C3E-0005S2-Mc; Mon, 05 Jun 2023 15:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543783.849038; Mon, 05 Jun 2023 15:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6C3E-0005QH-Jt; Mon, 05 Jun 2023 15:23:20 +0000
Received: by outflank-mailman (input) for mailman id 543783;
 Mon, 05 Jun 2023 15:23:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wlJc=BZ=citrix.com=prvs=5133c6164=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q6C3D-0005QB-Of
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 15:23:19 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4ca741a-03b4-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 17:23:17 +0200 (CEST)
Received: from mail-mw2nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jun 2023 11:23:14 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6382.namprd03.prod.outlook.com (2603:10b6:510:ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.28; Mon, 5 Jun
 2023 15:23:09 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab%3]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 15:23:09 +0000
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
X-Inumbo-ID: e4ca741a-03b4-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685978597;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Q4uifKXT7mnt79t82TjeurDL8pBGbX3RybtiU0oNCUo=;
  b=Ub+kHl4+/JGVEYVxg/wGUJBUmQFEhRPimAtb8qul7AioEXM5E1y927gX
   ee+CbgrkJ5RIH6sc7olPTgeQUHWDu5fLWvdBsYewVAk1ECxeUs93zg/g6
   Carh86wCRvU9pefdGadBGocjyix1MlujA+97T21F3kQc2MDWUFLFDUCym
   E=;
X-IronPort-RemoteIP: 104.47.55.106
X-IronPort-MID: 114143393
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:E18tRaMK6H3JHdbvrR0BlsFynXyQoLVcMsEvi/4bfWQNrUokgzIBn
 WoaUDiOOq2KNjGne9xyPoy/9B4BuMeDzYBgSQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tG5gBmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0t97Mzxyy
 PkBFCAuYhHSvbun34uRUcA506zPLOGzVG8ekldJ6GiBSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujCNpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxH+iBNlJRebQGvhCmwei/l4iBEwqVmTjsOWitkfidv9BN
 BlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQP4MudIyRDcq/
 kSUhN6vDjtq2JWKTVqN+7HSqim9UQAONnMLbyIASQoD4vHgrZs1gxaJScxseIa3k9n0FDfY0
 z2M6i8kiN07s8kP0Kmq+EHdtBilrJPJUw0d6x3eWySu6QYRTISofZCy4F7Xq/NJNp+ET0Kpt
 WIB3cOZ6YgmD5yLj2qSQeYJFbel6uytNDzaiERoWZ47+FyQF2WLeIlR5HR7Ox1vO8NdITvxO
 haL50VW+YNZO2asYelveYWtBs82zK/mU9P4SvTTadkIaZ90HOOawBxTiYer9ziFuCARfWsXY
 P93re7E4a4mNJla
IronPort-HdrOrdr: A9a23:VWIMKqDZtbdCUcrlHemi55DYdb4zR+YMi2TDtnocdfUxSKelfq
 +V88jzuSWbtN9yYhEdcKG7WZVoKEm0nfQZ3WB7B8bAYOCJghrMEKhSqafk3j38C2nf24dmpM
 NdmnFFeb/NMWQ=
X-Talos-CUID: 9a23:KzdmD2CzsRxBXQj6ExBrxhMoJ8U8Tm3+wHaBGRapFl9DU5TAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3A8QhHVg4eGtnUfHs5IQHdKhBYxoxzuZWWOnEBwKk?=
 =?us-ascii?q?FhJGVKTdMMmuwoSqoF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.00,217,1681185600"; 
   d="scan'208";a="114143393"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=haHss/eT9ds9TWQj10wSmoVaEjnMNBKobIjHsIkhTShZjMZFtibaV/BLHeoOkr/ba4dAspC1eLJNpS+B6+BHAzVlJKfzGW1HsCVBuhuHtjILtLiB/q51089dqpjJrdGXlJ+IwdPN7IZscC53Ul6r80Qkhht2LHD0AHwL357qZOrvJ8Fr6sVTUbhBLPVvJxnRJDqi2QECmGDosp4dQ+d8szGfB3pfgM5uMMHAukq8qrAeZrmRVkVhLhzLQC6T6wBuMt4zbEETUphw09I3fKeYKt/GBCDfetr1KUekMQW+CMVwYQK3VOLq61wbDDAA2SayKoxc6rsL864XdAwb3m8/ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtYR9OauQ4RZbWEochYiUuExjjDEb9q4MEedW6x5fxk=;
 b=ko8yy+gt47gx4oNxgS7zc+kw9eVMF/lk+iGWsCKwOcyrzhEGlE8Y07tROZkGHmAbhRCF6WfdWRDLtGyUa6GjLxhpy7c7HdiqgGSpw5QPitrSBBJg/otaRZZWGsWBWPmhSBR3EJabs6RRaVOmXZjAy+ydNQoPNMPaDNUBPhqMkf1+Fha/2RM7K9Pe7hmBogKEvdsT4tLmCJtuAKurk8LcoXiC8PYsl0MqfHOX5Lp/xwmUS3VE3wiP2NbgSier9quDsHQduuSvVq9NyYr5EpftijF7Sra8xTVI27H3H6XgKUzCB8Q2fpuumiL2xlD5YwuvkHptd32vgx/fP/KhbzlYnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtYR9OauQ4RZbWEochYiUuExjjDEb9q4MEedW6x5fxk=;
 b=VaOf15QigDYNkqgCgvZ1gozdQpAHWxfWkVvrGkzGv6kaA3BcmRskpD91iMLdN9qi6+EjzJZ6ivAvlMtfmjNxCFOeaCQMZ9BD9yhBpSoy3XWAPKJYkZ+HRdYFgLqfVJuGabJTo4K1YyDolw1VcyTA96daO07e5XdsXyiHzsUAxI4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <18a46079-8fa5-5e43-9296-56a8c6457133@citrix.com>
Date: Mon, 5 Jun 2023 16:23:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] x86: Introduce arch_domain_teardown()
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
References: <20230605144331.1819452-1-andrew.cooper3@citrix.com>
 <20230605144331.1819452-2-andrew.cooper3@citrix.com>
 <ZH39EGVyUBIwWQ5t@Air-de-Roger>
In-Reply-To: <ZH39EGVyUBIwWQ5t@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0181.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::25) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6382:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e23fadc-1d4b-45ad-2468-08db65d8c495
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uGNu//MQROADntlMoEQ6z29wz6WWuOzG3R09vh0B7blJiPPHBaqfzJR74ybmnSn0xc6Zuwl8JTwFbrI+3ccWoDkmYECJZOpm0ROp37jMPAl8jsrOvTAg9ohtO/AnsiwI5ZZeuybtPVrZmKEyJyY3ZoXwwL1VrVAqJrov8FehP/EI1HRB1CME6wCpm0efguEb4M8UUqVUpWRm8w++1zDuI1pnoT3c7VtlM5Dp3kqX6991PPwKKIt8U1i9ALTm3Q32ZzXAdKKvrPRmeecIXDpo1RbV9f8rHg7YhCouYHP06kYK2QplHE5c9HfeqSm5OI2l666dFTgrNc/Vu/IuUCQJsWHIPMj5adBUeegGoP+1/AHjMAZXjMXrsA/Rl1J0ohCqKhvIWGoJT8smJmcfs/zd6Z0D11D3O1rcUQ4WAYJx75UvJvfeUU1c/OokgPLIyefh7kuEPHVFTdAojhZG8o65Le7tIPwk3qFJBaBcZHkQtwxWKdw6+7gEkEY2JtzzWreEGGOiDruVd6hqFsXWLOKaP12j3AVf0qfLro9IbvrbbLdHTNMjtgZF/eiVi+FKdYrVpfwcWCJBS23kpaARpgEaRScmqpxmQllHf2ZuJXz31nhVtCiBIQGfK95F1BPemXB9J6m4FgOT8ZHhczBi750nUg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(451199021)(6666004)(38100700002)(31696002)(86362001)(82960400001)(478600001)(37006003)(6486002)(54906003)(6862004)(8676002)(5660300002)(8936002)(66946007)(4326008)(6636002)(66556008)(4744005)(66476007)(41300700001)(2906002)(316002)(2616005)(26005)(31686004)(53546011)(6506007)(36756003)(6512007)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHRCeFVWUU95REQ0MUpERXVFekpMM0hPUVJ2cDNZcm9OZ2psQnk3TWtxcXJm?=
 =?utf-8?B?SHM3bTA3TE1LV0FRV0ZkRWJZNzROeGh4cTNTYW9RTER2NXBJSjlrdGFBdFZv?=
 =?utf-8?B?VXFtWDJRNnlUc2p3amlJajIxSCtsampja2t6OEE2YURFS0hxeko0K0wxVTB0?=
 =?utf-8?B?TFQ0ckR4cDFHL2JsR21NenRRTnQ1ZHlDQXc3amRQczRORTB2Y2hFaGpZUVZR?=
 =?utf-8?B?Nzk2T2pLc0NIRVB2R2NOZUNGSXhTV29tVHRWeVFpN0crL0RySUVXUWVWVjZU?=
 =?utf-8?B?R240enNacE5aTlJWSkpHUjBsakhYVzdxZ050NmZxblFSRUgrdFRjU0ozR1Fl?=
 =?utf-8?B?UHBtNHJ1UytxYVVpa1NDRlhCY1EwMEFqaHBQOGxxc1BLOWNQY0VBS2lmTU53?=
 =?utf-8?B?OWh3VFpzOVMrejhrWHYxVUlJVmdOblQ4NFp4ckNUSVhvdXBsTGpZRGxLencz?=
 =?utf-8?B?OSt1bUJEOUt0cG9qU1dJajZlaUNlZm1VM3paWHBMa3IwRjRDNmt1SURldjBM?=
 =?utf-8?B?ZnlPWDZpdm50TzVYKy9IMGdaN1BFQ0VTZzAwSWFjNVc3ZDcxNS8vZVBUNHRP?=
 =?utf-8?B?NzYyd1Yva3NMWE5hZnhoaU5UVFhwOHhBSUpjNFQrQjVIR3QzdVUvSmVXaE1X?=
 =?utf-8?B?eCt1TzRZUG5oM3FxZUNFdVFzQnZ1RGszcm1UWWF1SkdKS2hUSVFIV2FmZXhG?=
 =?utf-8?B?bHFzNDN5bGtzelZDUjhYOTVUaEFwTzN4OS9VbzJUWE9qekhGL0dwc2NVblho?=
 =?utf-8?B?d2pSeUZGcUhEYjN6ZkVDQlFGQ3NiNlVQeHpNRlVsZHJjdWd5K3lMN3RuKzJI?=
 =?utf-8?B?ek81b01LTE5yN0FXQUVTREpyWnhPVkZhdDdySTBLamwwaGFPdGRlbWk2ejBJ?=
 =?utf-8?B?VWJ0REcwZ0xJVGt5RFZSZnM4UW5qK1piV05jVGw4anBueHpCbEdHMHRRMzVy?=
 =?utf-8?B?N3NPM1d1TEFNd1c5eWIxK2VkUFF4MUR1RzlRd2hXL09oYVUwTlloblFRQWJi?=
 =?utf-8?B?dDFiK3BXdEdsOFdtNGtqcVhVeGUySTZZRk9NeVpvUThqWE1LNFBFbE5GWVp3?=
 =?utf-8?B?TTNUYUVWNFlUd0V1UGY2TGtJbWNrMGgyNlh3Z3FkaUhYTkdDZlhVWG5JTHV0?=
 =?utf-8?B?dHVkYVdEVlA4b2xnd1JHZWZqWG9wV0xML3FRR2gzRS91NkExT01HQTRLeVhN?=
 =?utf-8?B?THJkTWFpWTRYMnQwRkJXSEc2OXAydUJDZWx0aEpSS1p3Vjk5T25WRG9WZ3Ns?=
 =?utf-8?B?b0JsK3lsblYxSmxnQzZyZ2FaWWEraHpodHVobjAzeE0zVDQ1ZEloeThtSXFu?=
 =?utf-8?B?NlI2UUxHenBpcnhadkZ5K0FsL3dlWER4Q0FZdTFUNDZxMG9KZEwwT0RuL2JZ?=
 =?utf-8?B?eDIxNXlsSGNHRm1BN0dZalkvRnBLc2Q0bXR3R1NkLzlXaFFtbUdZUDFvbFhh?=
 =?utf-8?B?TndidS9QdVFHQUNJQnBma2IzcFpIbEEwTHp5dysxVGpWYzd3STdrdEl3ZnJs?=
 =?utf-8?B?Y053LzhhN3gzVEozOUpsL2F3ZE02SmxURE1jOWt4UXBIeHIzQmVyRWhTenZO?=
 =?utf-8?B?VUlZUlZMbWo5TG9FanFpQVZiT3JtTHRJeElqVWdqRUNoT1luRjNCQTQxWUJ4?=
 =?utf-8?B?UFJ0Z1NLSnVVUXNuME5rRU5FaHorYzBXQ1ZpbHVMV0VOTmVxaDd6dHJHd0JO?=
 =?utf-8?B?d2xHa05ScTRnU1QyQ1BQZFdkUFAybmVDbkhaSS8vQVhlL1ltYXBOeXd6UklU?=
 =?utf-8?B?NGVieGJQQmRyV0JFVnd0TjVRaWNQcm53MGtlNjViTUdhNWwwWUlETmNqWlg2?=
 =?utf-8?B?eE5xaUJsRWcxeTRCL3pkWjZyOUkrTWtzZERMcXpSUUFnWjlsQS9Ga2xYenZJ?=
 =?utf-8?B?L29CTE5IS2pWZlp0bnpQMnEvSEEzVDNIOHgrcVcvWWJkSFp5M1JnRUR4MVVF?=
 =?utf-8?B?RkVyMHJUSXpobTZCRkUrZXc3RUh6MVpXa3F0TWZ3eUtaUmxzR0dQQ3BJNWZy?=
 =?utf-8?B?TU04S05hUStJR0tpeERsSmNJL3dDZ0lQRmNEU3lvVjBIb3R4T2JOaUlJOTBF?=
 =?utf-8?B?cTZXb1Y1ZVVoaDlMMStUV1ZrY1MzT2J3NnVNWU5sT1N0Y1pTL0FUWVJkK2w0?=
 =?utf-8?B?UHd4b1FGQVRNMXdCS2FHZnI3dzM5Q282cVBiOTdJZFFyRDJDcjk3bU5CMFpT?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+JYfRibrsBLjOSWwvUsI0GYt+OjBuwV0rhkf5yOTSNnkkL5oZp3Gqlnf3mfSJyzg4iY6msI53l196srB2PKxutHqLLrzkPAzUwxWbyKlxSMkFhayNEJKNd1vZ30X0HeZStP9pNd0lB0RyoYUfPCC/qaBhNAfDG1IUyMyd2Or+x2KXMDBWorY/OIe7R1lTKMW2X2yR10hTiUFJI2KYDJFfyH+26ie8QAvZTjqqUt7OOzXeHuR9YZgXGMReC8ONSG/LWELwOtfhAPjWBAH6wPxRvHXDU0Zxx3T5rctbfvsaVD2v1aL0bVY6vWuuL4ekREjI5qyj9V7daDqGR+Xz530bzXHnmSStz+QDSiRzRkZALtrDb41fVlZkfr6+o3cmiB3HnfvtMt7d31lP9Wj/G7qXVFsDRClOU5PeQUg/cZ1vrWeJaZQEMLYpAXqdW2GIALptPPbuXq/5/HUMraLZyGddq/rmlPMBxvomWyXyGRN3u3QQAo/Kc6m5mlnat5sQxpGEBqQZdPtqtZK+KtfJzsarjsU4jqNqm0xbFI4SDSdTsoGpz+KdNGr92VQ0hAC52iZ7UgljY1Ez+wxejafDn6h4g+zVxkMAKw/9jdyqroR1QL2ge/PTypBN6F6myW4VV9BNGEUqK1dM60tcui7Nx6GU31QQ+kk/L9jukO8ebrahZkhulqUq1a2fyPCCR/qjkU5Pfx4J65ApiIuPLb3u7O6zWHl8h0JRRktmrGTWQkGEDGyZT9RzIIIRDIQ87CRh4w+ZYulc2z6uUfTVSH1zHfZWPRf9lEn4ojL1n1MvZ3grSXRrDAnXrFt1W7GcjEsqm23oZdHO0rf8+BpWvaJX3/uuhNp4TFg6NG1BWYehuz03K+3pxhQimgwRMU99mslcigolIw/BtzqMdd28XUPirNinFlP5fI5OHn2fa0rXiBJRQU=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e23fadc-1d4b-45ad-2468-08db65d8c495
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 15:23:09.0886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U7pNSRJVP04q3o9ADdJzqBveYKgKLCDOoKnr2C//vQAiz1FEHXjxTWebXSbQU5krgLeVPM6alLJHrND1Cnv8IJsAVxUfGNSQWEx/7Cgf43Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6382

On 05/06/2023 4:19 pm, Roger Pau Monné wrote:
> On Mon, Jun 05, 2023 at 03:43:30PM +0100, Andrew Cooper wrote:
>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>> index 85242a73d374..854f3e32c00e 100644
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -589,6 +589,7 @@ struct domain
>>       */
>>      struct {
>>          unsigned int val;
>> +        unsigned int arch_val;
> While I haven't looked at patch 2, wouldn't such continuation
> information better be encoded in arch_domain in whatever way is more
> suitable for each architecture?

Well, it's filling a hole here on 64bit builds, which it couldn't do in
arch_domain.

And it's contained inside teardown{} which already signals it as fairly
magic.

~Andrew

