Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FF560F3B8
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 11:30:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430971.683340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onzDV-0002mh-4k; Thu, 27 Oct 2022 09:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430971.683340; Thu, 27 Oct 2022 09:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onzDV-0002jh-0X; Thu, 27 Oct 2022 09:30:25 +0000
Received: by outflank-mailman (input) for mailman id 430971;
 Thu, 27 Oct 2022 09:30:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a7vm=24=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1onzDT-0002jb-H8
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 09:30:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70081.outbound.protection.outlook.com [40.107.7.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fab800a2-55d9-11ed-8fd0-01056ac49cbb;
 Thu, 27 Oct 2022 11:30:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6937.eurprd04.prod.outlook.com (2603:10a6:10:113::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Thu, 27 Oct
 2022 09:30:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Thu, 27 Oct 2022
 09:30:20 +0000
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
X-Inumbo-ID: fab800a2-55d9-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FT1jVnzscm3tSLwup7cYDdbeIMVifWFSIq3ndt/1CcAyHNxKmwu9sGcQwTNhvwM+b902P3qlf/QUm4l3mWbxhc21FG44QKA1rlT0zNLp9v+iFIzvJIDnb550bcV+TljZsdDDXHzOxSntpofwWH4uK/QZC3Xw23fKl047xh4dyrzU+gKjnbkE+eKTT5dTrW8FocjbiSzSdbUVcNpREfpRN42ZRghHqxVXfjl1y3xazmKQQ0qw75LOAqr1opUyg1HkF8JlDQrY2rhoUa4kebCZEI4SOQx9sCAuQEa6nP6Ve0gGjTHCtKsUvFLKBvj3IjhaX3hRqV8zJXlCKDcNfWqm/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fVNj437jzI/xD1iuWJLwxgq7AmGh6GmaXbh4vWkAGo=;
 b=XuWuC2h6WMuRe2rozFbPwybEoxN7UXN6wBIl36vOtDFNWotR3TKg0yHS+Y9LsF5eODKaGup5G4qOqzaMs40UWMlW/hd5xypr4C9z5ULvCvLfIeX3CcCf2MW8LiLd8lOM6zjGmnDL7IC6eI8rUZLJy6aQi6RzNQQsSA1V6QwAmOZbJ4w/dunKH7jKeq6EB/CxBeDRxascXTyKuhWpHTjVxbD9OzQtWUrWC7gzxdWnj/TkEoqHBQGS7JJADSCy91ClYgHDbUuBm0YjFL2JEGl6AqOFw/LP0Tdx19lVpbuCSEtclC5Y3hpDwUfGgd/5TDKSk9GLqP2FPtnwc7S81QotTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fVNj437jzI/xD1iuWJLwxgq7AmGh6GmaXbh4vWkAGo=;
 b=eiJ+7crLRj5nwEs+2LuH8Fg9lRxPNYItKLy6yViXsr7CAri8HkEotSU+EisCQn89TvJQ2Vw1UXMgqT9cLJRPclAg8i7sAURE8ejyhyS7iN3paWFaPDu2HAxPood5kMi3SHLpqxiM8ffKGrjuyIwhkzyzTNTK5rtJ8SzpA9ISU2cZHU4wfnZ0tmvfC5C6gES/zQyk5tK4Ls9HCOIZzjzg83eOmQexMXhB47zJHSmR4KdFcrupWAFdm2gBpQEdzIjrAsA0WZDOecTIDlAs7gEIw7Vdp4vdisVAzoeb4gp2TRRfwYKhJ0nDmvA9r85gkjTgewhxrZ0y/v0R1/63w34ocw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6a6df9c5-a527-63ac-60ec-fe7f3b6fadbd@suse.com>
Date: Thu, 27 Oct 2022 11:30:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Anthony Perard <anthony.perard@citrix.com>, Henry Wang <Henry.Wang@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH][4.17] Arm32: prune (again) ld warning about mismatched
 wchar_t sizes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0023.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::36) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6937:EE_
X-MS-Office365-Filtering-Correlation-Id: f67363ae-8470-40ad-a6dd-08dab7fdddf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7VdIH37ExBgwAr49rCoL6hKq5KRahjjUMZuHn62Qxtf8OrIuI3awFSvZOlFS7BYhqaOfo2PbCBXmtofR2HfaNKz4tAP2myk7Ldv3B+HpIAgf7eLvVvTnSioW8jSgi4mfDfGf7PJ2gRh5fWQeyXplQkmxkaNdzTjvoYJVrkdutnytiWYiVTJL8xLO/K95/uyoXCLQdSVdg/Abzanx4jZDvV81EW/Xa2E5ssweHbvkpN3TLxfgQvo4m7466mcdk5UCnpIEynwxswVRYJGQgzCc9MLjAeACc2sRvgo7b/wossF8gcz4FWilnOem9oAOexGDSeunh7N1GrW3kHg6x0at9eOXxYblcKou+m/UeER2j1j6mMFsCAAL+5x/MHpNW5BbuBw0Aa2fhjkQbMeOySdOPKBH1eUSO2EuGn4fdzA7IW2tQQwVJUTHPfOr4vjVgdUiHw6r8D6ttv4h+RqRbFsnMHAdav2dqzOdAjHrN4PVOIAx3K9PqoMV/qcKlxkf5lSmUc7GsT8TkJ2/m5ncA1IPqQs2iBdDt11WY1pa7LHemipR5ZAePGR2nnj2MEaxz5BbL37r4mt6uHdhVTGafyhK/HBMjh3Y7wx7i13uF1nrcNMI+9yT/MkqJTCkANO5hVmqv1PCIjQ+F+A/kaOe68NIkFTEuQh4EbvVVjbvIUxTUtmlI6fqBtqknO8QSBbzxz/PGlqeVPrCUiQCKGk5GRO6EsJmw24o9o/4AxcIJ1m+ZuPiPjqHWAOflLgKByzkLnxemYa+o3jxc76cyHiOpFgiw+LdnYNvyhgeAikNelmMR1M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(376002)(366004)(396003)(346002)(451199015)(6506007)(5660300002)(31696002)(83380400001)(66946007)(38100700002)(86362001)(41300700001)(6486002)(8936002)(478600001)(8676002)(66476007)(316002)(2616005)(6916009)(4326008)(54906003)(66556008)(26005)(186003)(2906002)(6512007)(4744005)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3Z6K1Rjc0tIQTZSLzFRUWRxQWVaRE5TZFhjSU5mUmdONUJyT1p2WTFPS1Jw?=
 =?utf-8?B?TWh1SzU1MlpOK2JpUGFNd1hCSGcyMkhDRzNxSUx5NkxQOVpMRjBGLzh1N2xh?=
 =?utf-8?B?eWttYzZpY3Jqbm5FZDFJUFhYTy9hTURKdy8venZSK3I5c010L1dCdyt6WmRa?=
 =?utf-8?B?N25FZTArbkF6SktGQTM0VkdpalB4MVcwNW5Ua1ZLOWx3dStLV3g4Ui9pNGZJ?=
 =?utf-8?B?a1FISDdwczZJMTJHcFo3VUpmZndaRDB5cGlya2Z0d0doN2tCYnByU2w4aWd4?=
 =?utf-8?B?QUJ6NzFNUkRic3pVY29wQnBZOWNNajlpWS9sOXpQeE91SE9pUlAwRFArQnN4?=
 =?utf-8?B?NGZVRHFaNi8rYUpUT1pVYXNaSE1jWGFYTjBHUzQxR2N2Mk12RkdSV2x5K1FS?=
 =?utf-8?B?THdZeTlTeTlUT3EzclNIR2NIZmU2OUxtWENTRUp2U3B3elJvaG9pcXVvZDNY?=
 =?utf-8?B?a2dtQW9ySXd6L0dQZFM1WjZ3U1l3SzJPbHJhRlljamtGL3F1Zlh1M2NLY0RQ?=
 =?utf-8?B?K3RFMzNzdzZldWN0UTNZZVJzOFVpaGs5dU8vNmJlZW9hWkRGdHlTWm1zUXRu?=
 =?utf-8?B?Qmk0NUd2cmE2bjVJUzhDZm1rT3BsY2ZzOWNrdmVQNkE0QnVWL3cwT0FENFU5?=
 =?utf-8?B?Nk55UHZZRTR2cUppMUNwcFVZaDBsSzdZSXhCSUVRK3gwWXZlU0dJeEhLRTVp?=
 =?utf-8?B?bFBGenhaWjgxbFJUcCtpYy85Vm1IZ1JPUWRZZm54UmZLNHRrQnNuZldVaXdH?=
 =?utf-8?B?R3B4U0UvUGhncDZ3ZUkvYTZUMDZVdWE5aDRlcEN5eHlKaFVFN2haTCtlUmtM?=
 =?utf-8?B?S3IzOHFEZTc5VCtjbnpHMG9VQXFoY1BnVUIzd3M1STFoeW1kZU1yOU9Mb29U?=
 =?utf-8?B?UXoyZnk2S2VSeFY0OVIvNjRUbUtNMzR6d1N1RHBwaFNyTFE5bGplRDIza0Nq?=
 =?utf-8?B?N3o5dVBwOWUyOUUwaTc5RlpvUXc4NWdXcTlHa0MvZlVKMitxY1VFMURlRVRn?=
 =?utf-8?B?K3ZTKzlaZU8zeEZMMVo3VEhMQ0dQOU1ZbDBLMExha3grYkdaRnZaU05CcHVJ?=
 =?utf-8?B?MkJFTVozd0xMWmVBUlAvWVh5K0UvQTFiSS96VSt3VkorajcxR0ozZE40b3hB?=
 =?utf-8?B?Ky9yTzFHM1BERFJBQWdrMFBUN1hpOEM1RG93K2RJM1NISDQ0VE51TE1ub0hl?=
 =?utf-8?B?bFpUdTdzZFR1VHF4TzJvT0RqUEl5eG43REl6Tk0wTzRaZlZaZ3Jqa1k0OTZP?=
 =?utf-8?B?Qkdtb05DUC9Xemw4YjNIVk42Mjh2b0JuRTdIMFdMNFBSMCt3cTRLb2Jjdy9W?=
 =?utf-8?B?TEh1Sy9xeVBCdDkyVFdBN3NLVzJUbHQwL3BrV2F1ZnFxTU5Zekg2MlZWOE9T?=
 =?utf-8?B?dmxhY0JSbE15c0R3ZUJtWng5ZGN1K0Y5Q3hNdE4rekRjd3JBQzRRa2FvaHJB?=
 =?utf-8?B?OEx1VEE5MjRSb0JEbWk0MGoyUkxDdWlKcmJLelRyZFFKSXFDZ0ZsOUREcnVI?=
 =?utf-8?B?TmE5ZHZMdVB1WTk1cDdlNVBTM3VyUS80WmZCcUdpN0NJbklxWHR4eUdyM05R?=
 =?utf-8?B?Q2tQR0sxS1gwaFNsbjE3RnhxSk9acEZCU2F2RC80RzZxbzVVeGQ2cGprSTZ4?=
 =?utf-8?B?Mi9XaEJOZy9vWHZHWWVDcnZSSldOS1FvdUZDWmtEblZNdTRnQjFocG9WVU1K?=
 =?utf-8?B?b3c2d21xQk1iaXptSGp2N1JFN0JlbGhTM1VpS1dGWncrOTU5SndLbndxNjlX?=
 =?utf-8?B?eDUrMytOL1dnR0J6RnlMSFgrczhLYk4xSllGcWcza1V3aHMrZmlHVUo5WDM2?=
 =?utf-8?B?dFUybkI4Rlp5aUlucDloRmtGS2h5eERDbE4ybms2N1pnSWt2OGR1d0hBMWk3?=
 =?utf-8?B?aVFHQzhyeHNDQzZlQXdqZ2x1ejBZakZGSnNBQkx5RzdXU0ZnYVZnRmoybXV6?=
 =?utf-8?B?TFJXOHBGZUhGa0pBUkk5bkVWQ3F3VVlqSXpjTk9lYkdxMzFDVHpCdlJjZjA4?=
 =?utf-8?B?blBIeHVZSkszZjRoNmU4Ryt2MXQrVEpzaENaM0RKaEsrQVpIM2xYWHlmQTdt?=
 =?utf-8?B?Y2tleFdYRUFjNzBYMm9UMVNUejZWbDF4SjRWeVNndzB5Zk02K0VPM1B4NW9t?=
 =?utf-8?Q?RlYCntNWAYfZZ6Do1nDd9nTbi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f67363ae-8470-40ad-a6dd-08dab7fdddf1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 09:30:20.6275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Cr0sh1dgA1uZLo9t6N2/FsL9J6vppzfYL5XRu5DUm5OE4C1oXwa3kAS3syuVvuWuYE89yaJhbyNAhoQ/GrI/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6937

The name change (stub.c -> common-stub.c) rendered the earlier
workaround (commit a4d4c541f58b ["xen/arm32: avoid EFI stub wchar_t size
linker warning"]) ineffectual.

Fixes: bfd3e9945d1b ("build: fix x86 out-of-tree build without EFI")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/efi/Makefile
+++ b/xen/arch/arm/efi/Makefile
@@ -6,6 +6,6 @@ obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
 else
 obj-y += common-stub.o
 
-$(obj)/stub.o: CFLAGS-y += -fno-short-wchar
+$(obj)/common-stub.o: CFLAGS-y += -fno-short-wchar
 
 endif

