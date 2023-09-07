Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 842DF7972CE
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 15:23:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597337.931557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeEyY-0003yg-Mw; Thu, 07 Sep 2023 13:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597337.931557; Thu, 07 Sep 2023 13:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeEyY-0003w3-JU; Thu, 07 Sep 2023 13:23:14 +0000
Received: by outflank-mailman (input) for mailman id 597337;
 Thu, 07 Sep 2023 13:23:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qeEyY-0003vx-1n
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 13:23:14 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b14f2e39-4d81-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 15:23:12 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8621.eurprd04.prod.outlook.com (2603:10a6:102:218::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 13:23:10 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 13:23:09 +0000
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
X-Inumbo-ID: b14f2e39-4d81-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2GjBLStZT1dV1alp7RYrti7UyMhaKegjwvFaxPmS07v2RovuKbXZAFomKBPIagDZ3fxIbtKf0RZPVKD4FASGytYAzQNfCJOlEYiv9fJNMorzu/aoWTUnkwRHxUJQ78V55smLCV2MyV+5A+PiBVkqgptmMmyi+VvcjqXjinLLpX4Nawv2joPk7rkBCaMTXnK97Fj5BtTd3QEBrXspn8JJNZtEiIhtdZHHyjGKc9VTbqIF0nMkeuMF3AC9WtM89VnJE6rLq9lizKHpVEyNxgef+cpoeObyId9M04nTkfUUOc0HTsb4aX58rJLl5Yo0xPSy7T70AmSDcIuAA674zVW0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gic7Wce5x6fu7yqymIFAtJ6X/bMHWNnNnQzBp5MVsp0=;
 b=BBxtRfvfz4m+b7cbA0AaqH/7ybFFL9qDmz09hRNk7FSU4VNyJ06+ZHBAsE/495S4GZJS/rhq6yFT+H52wJbmyadyw96OzE0R+Z3wqGeV/qISVyxQ2AYCjg8siX2Mmb2SylQTw6BbRBGsZk6PA/rIGfnoww/wx/gIDvok2h6UazuIIDj5g4qt6rhWSC1AvfSFWOgKgWkaquhePuPVWPhyUHebd1Wpt8vuaSYoeDpd++LNAqzFoIkExcEfTkhb+vzO1s9hWfQDZ0KVNPohWJKGs53l/WC3e0TMi5IVHpzvm1N1t1NhpljReB4NdoT84rAFD1DdjvWgET4bEyz3S1Fpfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gic7Wce5x6fu7yqymIFAtJ6X/bMHWNnNnQzBp5MVsp0=;
 b=PWj29g0QpMl9zBdmGz11eRyha6tz6Lx/5yAFBCl57m3ahzow0aRFRFIx3ErT0+BF9rJ0V9A77y3Ca7tU8aBKXiMmQ48/RU+fyxfOSa+jRRMtwHwLo7hO9/aTizZhpXdjzW9OrHQeu/pOQPUGQlB93yHADwizzTbKZRAQKoM+1nsgFnVGf5+q2v6MEWZW90so88qVbvz6lLZYoNbDGcEG2MaoQ3PyamF/NnNfBP+kylmD4KjWeXECI5A7ChCasjLF2gTx5dtEzMoEbFfJL8iH2jQAoy1FgtPf5k9yqm7rmXE9pRWDus/Zhv3fZJapYHbvOnyqaJXOHAfN0xfVt6AacQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c0a89bbe-0a78-5aba-bbf9-e9b568745ac2@suse.com>
Date: Thu, 7 Sep 2023 15:23:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 2/2] xen/ppc: Drop support for pseries/OpenFirmware
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1694044614.git.sanastasio@raptorengineering.com>
 <a13e0c54a18c4d87aae88134d9726657f9bdedc5.1694044614.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a13e0c54a18c4d87aae88134d9726657f9bdedc5.1694044614.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8621:EE_
X-MS-Office365-Filtering-Correlation-Id: 00ea21a1-8173-4ee6-4876-08dbafa59478
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ldWnF2wObqJ0m1dfydx8Ma8o7zDVxADkqez71nfeAnxEy+RkEbJXPmJlncawcWtOZmutuBut3QIqrn29fJ/inak6E3zX+2rBkhfaPbj2quWOScL32MYCc5+NYqRKggWUkc+AWn4Fy2IG7vAVaGtAWlYsR4ys37mBosql1PZHtUcj8UqlG/G5uJ1HnMqblBOux4JmKHu20hmTsDlYCIaZviWBnQvayF8DBc0CpibD6xUynvU68lxOGnN7ZQL9eazvObGQE8k82h9GBfbG2ksnW6ngvlWAjrtMUONodPhHEOvFMngalktqdZ6ONyvn13HBFvCrmb7xrh5vIBgFLJ90IW+YWcgTu39tYXffLavw1TgQ+JWgzxZOsgb8O5Ys1Qjd7/pgoCQcxBmdXVPCF7p8sJmNTeGsdR9/UEjyuRNHJ3uVPnqb9JvauYWKkySQ3kNiLTzPckKcd1LdEmA4gHIqbwbQ9Nufmxtpgil6DVmfxdfaF+HllMMNooYFQvJMZiKyZg8e2cY+/tXHKAZHBgXT8KqX4fswP6R5t87zdPzmBe/vlXgcGWBUuS/SzvLOQ3xfkbJDjQd51EBM5zu+0OZ3niGOxgX+W9g3ONZZyJLjNRmcX1Hm7u1tMxvfqyZDDVIAZhoEnPQ1C9UAudJHurT9/g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(366004)(39860400002)(136003)(1800799009)(186009)(451199024)(86362001)(6512007)(478600001)(31696002)(6506007)(6486002)(36756003)(26005)(2616005)(41300700001)(2906002)(4744005)(4326008)(8676002)(8936002)(31686004)(5660300002)(38100700002)(54906003)(66946007)(53546011)(66476007)(66556008)(6916009)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWsrZFVKMWltOEtHaWZKR3lSdWNRLzlhUG1aUUhXL2JkSEFXL0pYdlVCeTBL?=
 =?utf-8?B?VUd2cWJQbGNzQmttdEpocTdTQ0M5OXc3VnJVcnJlcWtDNXpGdFpjVk16aEhC?=
 =?utf-8?B?RlB4Z0g4U21RV25NdS8xQ3RqTEVUc2ZkZmNDdnZIT2dhRC9oSHNrdkRTVU9D?=
 =?utf-8?B?aExnYndYQ0lpYTJCV2UyVEl4Yk8wYjRQY25MVkpvbFNTR0xiU3JIeW1tTWFT?=
 =?utf-8?B?TnhtR2VLK2xwZ21ramxXMHNmSU5BSmdLWmV1bTJ4SVViQjFidkhxUHZUTHFV?=
 =?utf-8?B?QlgyZUhYZFo0ZDJReURqbWtHUytMdmRZMU9SaEVOblBHcFdDWEpOK2UzL01B?=
 =?utf-8?B?a0tpVnhyNXJOWlp1VDdsMXFPOG9heDJ3RzBTb291d2VseW1pd0RWdi9McE9S?=
 =?utf-8?B?WHE2OXE0ZDliSzlMb0NDV2E3Z3ZGWXg5S2tzODdUdjNmZFI1SXowYXpaVzQx?=
 =?utf-8?B?ZTVHcU9nZTY1aUQwRmVMaUI2NXNIMlhPOHpmYjQ4aXdrZE1VMEsyU1BqRUZY?=
 =?utf-8?B?MzY4V0pjZnMwYS91Nm12MEVTQVZoTVVSMUk3VXRQbTh6OEphcVlPUWlMTWZV?=
 =?utf-8?B?NSsxb0hhamk1YnJ6YTkxS3NBTXZFNU45YzlaeEJJaFZpeGZ5NEVzckZuTmNa?=
 =?utf-8?B?cmJueTJqSGZ5cU90V25BaFlwdjEvTG1LZDdXdVRMVVJqbHM5SkdwRi83WlI1?=
 =?utf-8?B?eld2QUxHaGgzY3Rvb3MxeGNsWVJRN0JlUU9qOHlqaWtsamJTM29jdlZlSFpp?=
 =?utf-8?B?N1JUZDRZUGNCOHJnODBFV2tnclk1dW5pK3lZcFRzWEJvL21JUU1XSE1XSkhl?=
 =?utf-8?B?eWQ5QXBrejgwM09oWmtONndVWUtxWXdtdkNNcGZTTFBFQnI0VCttTjNOQ0NS?=
 =?utf-8?B?M3BleUEyM3g2clpvbld2S3FCMno0Y0R3aG9sUnZ0czRSRk5rQUlpOTR3L1gv?=
 =?utf-8?B?b1hIOFJiSnRXRXpxNUJwU0J5STdOMW9WRVN2ZVZLak1oU25MK0ZPTndRczlj?=
 =?utf-8?B?VVNsVjdNRTU2NDFtZmswalBpQnRMVzFRVmxxRGdTbXhheUcwWHgvQ2Z5dldZ?=
 =?utf-8?B?dy83VGJtZjJUMnR2T3NRWTh1VHhGeWNiL1ZPTEx1TEtFeFE3RVNocTNjMTQw?=
 =?utf-8?B?bjB3T2YwUlg2WlpIZVJSNW03UWxFMkdaNnVSVmJjeG94Mm5UUnl3UUFITW1l?=
 =?utf-8?B?amY5NFFxdlpYNWVmc3N6YksxNTRJSVJZb3NadmpJenk5YlhkMXdUZ0E3dVc5?=
 =?utf-8?B?K25JR0ExcVc1UlFndnlVcDNPQnBpYXhUZG9SaGFGSytndjlUQzhEcm1QODB3?=
 =?utf-8?B?ZWg3WmIrd1lNTWNaYUlsbjBLYnpnWXJnZkw2TXVieW9sSm9ja1NqN3VsdzNF?=
 =?utf-8?B?T3dmRWFRVmFwencrMEZOSWJUbmlvemhTdHduVm0weFVQdm4rV3RxbEl4WGtS?=
 =?utf-8?B?L2Q0cEk3NUNtKzZ4RU8rTCtmTEhOMXFuUXBVaFFpTFBKUzVuTTRTQXluYURU?=
 =?utf-8?B?Z0V4SlA0aE9DSnVyc0hxRTl2RTNxTkhXWHBlTlMwZzl2UEhCSTNkSlB6VGl2?=
 =?utf-8?B?eGZDTDhicExOMFc4ODJjc3FBRVZHL3dyTG9lbG0ybnJNU2UyY2hJZFMvRU94?=
 =?utf-8?B?SW1TenF1R2ZUU21KOGowbFNrQVBwVWl1ZEhuTUtzV0h2QU1teHJNYzY4bTBv?=
 =?utf-8?B?NVNrbFRIdzlxTmtrWHplaUNHdjFlK1RJNDRMMkM5VXVVSE00SkI1TjhneW5q?=
 =?utf-8?B?TGJiSDZPVGoyWnVPNXhYM0o5NWJvclBlWHRudVBTejYrbDVlREdFa0JYOUow?=
 =?utf-8?B?cllWSXk5aVZmRzBJcEFRbDZqM2MybFhycjVoRy9zSi9iTVZmZ3JtNXpZWVNH?=
 =?utf-8?B?dVFRakkrcURVV29TMHlQTy9nQytXQ2VoelhibmF5blNOMlZFUnVTLy9QMnFk?=
 =?utf-8?B?cGNSTjBScXNGdGI3MVo5MW9sTnF5UmZ0aFArSjZjTXFCTk5SZTBwUWdTdHZF?=
 =?utf-8?B?Q0w3QXFEU2ZWVnB1ZmFOTGtGcFdKZWdGMXMrTDF2QnRYT1NUOXZMcndXb09F?=
 =?utf-8?B?bURZQUtjeDQyRDh5K01HUHNPdHZJbnJXSndGeXFnbUlOcXhlSEs1SlJoSVVr?=
 =?utf-8?Q?9ibd/2EfTbGDGT2dHZ2EBvLlY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ea21a1-8173-4ee6-4876-08dbafa59478
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 13:23:09.9455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N7MSxUNGKTsueFIGg54FntZtnsZlL0dUC/1yWrUvgSxUzb5zpYxGqTBiX3gXHbqZuDgQKFIT13RjpgIvkQCbrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8621

On 07.09.2023 02:01, Shawn Anastasio wrote:
> Since QEMU's PowerNV support has matured to the point where it is
> now suitable for development, drop support for booting on the
> paravirtualized pseries machine type and its associated interfaces.
> 
> Support for booting on pseries was broken by 74b725a64d80 ('xen/ppc:
> Implement initial Radix MMU support'), and since there is little
> practical value in continuing to support pseries as a target, just drop
> support for it entirely.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Fixes: 74b725a64d80 ('xen/ppc: Implement initial Radix MMU support')

(Nit: Fixes: tag first please.)

Acked-by: Jan Beulich <jbeulich@suse.com>



