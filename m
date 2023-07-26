Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EDC76384F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 16:05:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570495.892311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOf8m-0004lB-Iq; Wed, 26 Jul 2023 14:05:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570495.892311; Wed, 26 Jul 2023 14:05:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOf8m-0004iA-FD; Wed, 26 Jul 2023 14:05:24 +0000
Received: by outflank-mailman (input) for mailman id 570495;
 Wed, 26 Jul 2023 14:05:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CD/9=DM=citrix.com=prvs=564dce665=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qOf8k-0004i4-U6
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 14:05:23 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 737ec043-2bbd-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 16:05:20 +0200 (CEST)
Received: from mail-mw2nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Jul 2023 10:04:37 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM6PR03MB5242.namprd03.prod.outlook.com (2603:10b6:5:22a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 14:04:29 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 14:04:28 +0000
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
X-Inumbo-ID: 737ec043-2bbd-11ee-b242-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690380320;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=l7UNq7uk8x9OS9jS6u08AWpWKBlKLaFvY3Qe8MW629E=;
  b=YDM47ZUj2iGY5UGY5/a6+AZ8seXLcuVpKsp6hMVBW0mTeY/IZjMaTNwj
   cd2MH/bfeu9pUzS0KkNiES13mhvckiV6nSby02rY/wHUB6TL3mfjhc3oo
   TWWf25Eb0M2ameelhpVvxQ1noIb4Pd0R8dMh0kf31FRKIZHieExKglt38
   M=;
X-IronPort-RemoteIP: 104.47.55.106
X-IronPort-MID: 117947617
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FP5kVqP6C/g//5fvrR1ilsFynXyQoLVcMsEvi/4bfWQNrUp31TcOm
 2dJWmmBafjcZ2enL4hwao6woUkDuJLRytZrTgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/vrRC9H5qyo42tH5AJmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0s8mClwQy
 61EFGFOR06tlri43Y6HbMA506zPLOGzVG8ekldJ6GiBSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujCNpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyvz17OQw3qkMG4UPKSSqKNTj3PM/2YsUScUaUueueu5k1HrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAGRDNcbN0ttOctWCcnk
 FSOmrvBGjhHoLCTD3WH+d+8oSupPCkJLUcLfSIeURYe+N7nvZ0yiRTUCN1kFcaIYsbdHDjxx
 3WPs3I4jrBK1coTjfzjoxbAni6moYXPQkgt/ALLU2m57wR/Iom4e4iv7lud5vFFRGqEcmS8U
 LE/s5D2xIgz4VulxXflrDkldF1x28u4DQ==
IronPort-HdrOrdr: A9a23:8zWlpahXXnDNAJVQcMmslRyFCXBQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-Talos-CUID: =?us-ascii?q?9a23=3AN8QWJmnqgCh3zRWvkoG1vyywYuLXOVSMx0qOHR7?=
 =?us-ascii?q?kNTcqYeO7WAWe5Z9YteM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AALHENgzgIVavSkL3LN8ELm/FfWaaqL2EVh00nrt?=
 =?us-ascii?q?ZgsO7bBZyBye4lCa3W5Byfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,232,1684814400"; 
   d="scan'208";a="117947617"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJkaluvpG2ezqjsppayi5Fs3WQOp1OicuyqkP73nUCAgvu6TD2Q3j07fzQW5ph1Ug7NjWYI7F5VDFEtrrjyWA0GfxwLRacJVyYNpeW/Re/AZ+1VQlL63N8+4faqJTXwWfxX5v39batCAe3rJile72ekNIE32WMY3PCAf4jNGxDPMVXXVSCkr0TkHY0bhWHCDug//tCIzPOGE7NsYbJxgMeljvJFbgrbhx/g1psDpQvPzw5PBGHMKMQMvrf0E6atmUu8qdRZn4CFBKAXKJA3KZYOypxXEnoi3iTKPFcCHWRw86IhbwQLJJNY5NqpZ4YQJtAEwfiQQuTpYH2awkP7wVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnEWWUfvOcmz8ybJ8ODIiL5aPtA3hSbeJIbuVR3sO7s=;
 b=NT+mI7Bu1Ajs/aH3XgblI8S7/hE/fqGpab4YUZ3r2iyt29JwHhsIfKFVE99YENkRBiUAlmOUMqa11x4eYjWshU/pU76G/QgFSD9kJFLoPz5L9ZDGqsLypQGMBSIidB6tBXVXCtuzhRwk8C0bMEWhAPCt7h9dbUNgvUS6X1wxzGpWoLS38AMSuYcNegd4HQenIqOqeWsnjy1/IiWfMK/ySNzWhvyTrL/ME101jbjFyOgq0Wt7AReWqAUmsOv9ecRnrJheYCoMrxlvrRl6DQMwNz+BrZnH8qxJzCtzWRNF1hF3z7FANk2rDO27V0lV//g/JlkVY3w1Z7CKq2/SM9WrWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnEWWUfvOcmz8ybJ8ODIiL5aPtA3hSbeJIbuVR3sO7s=;
 b=oXtULbFBY/0PhwW7CS6HjwDGL8ZOrw9c8HSa8TDQRShFI3QkAU2RTpfK5DWgi0NkCP3zxI2LN54F3sz5DCg450TeYP7rHlUatnPzy4zXedi8oPmTz8wR5VDYOZtpZoEMk2jeQ7MSaVTY/KSddMfWRUsVyQIGwPklJX1IxZgvTO8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2] vpci: add permission checks to map_range()
Date: Wed, 26 Jul 2023 16:01:32 +0200
Message-ID: <20230726140132.80151-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0029.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::20) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM6PR03MB5242:EE_
X-MS-Office365-Filtering-Correlation-Id: d26634b0-126c-4cfc-045c-08db8de13a13
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pyyBYVUfyWWz/pB76cKERneo2gAdVQUQexLiQlgowHIkSMtw3NMxe8dfDtTbeOx607TLduDI3CntyvICZisft0gM3AenQPKNZ+ufdutBTUzhfoFpfKlCCrVAe8JOxow09Dmm8QjvwtxKw+seliSOjj4JnXyIzaIQpTDjNaTssKHIp6VahWk/ZWApb2s/3LvwMdA3BFRT6SIWxAgMhzFLR4IlEOoGHp2aClYoLT4hrHpiQ9vYU3tZIzrCBXqii3kyszj4RxvbzWXMwD22c/ruSj1W70TWCxO0duXhyFgyOiAErxz5gIh3A8MXQ5hBZZCWn0OBvx218mE5hgVatdgsGYNujm1ZPu/Y+rtH6xLRc7boK06BlUi7C2LgLBcccRMUIIuWr4576tRrMH+Yq/MDwrRcTpIDthv7Jauc7Q4ErOd8rtk8jV14hADLT68fI2NGcmgF+Rpw2RR/ONEb2c/0jUEyDMlMDmaV+TbacXrBR63p6ovSJsL+zNYBxoCnsY5OwdIBq7hLwjFAm7/ebRT0Z557LZP5/Tx7Q+jXek/5zMI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(451199021)(41300700001)(26005)(6506007)(478600001)(38100700002)(6512007)(86362001)(36756003)(6916009)(4326008)(8676002)(8936002)(186003)(316002)(66946007)(66476007)(66556008)(5660300002)(2906002)(2616005)(83380400001)(54906003)(82960400001)(6486002)(1076003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDVwa29DcVYwdENUQW1EV1lDdWFtODRFK3pncDNtV0hRTW5oVmZtcmR5YVBI?=
 =?utf-8?B?NG10OWJab01DSm9Qejk3REdOcTB0NVcrQWdEdUJDV0VhZzBEdVJ1VC9RWDFZ?=
 =?utf-8?B?MTBCTndUYnMxRGFTclZTcHUybzJNSUtsR1pHdjFVS0J6UG1VZXpGM2JQdE9a?=
 =?utf-8?B?bU1qUEFYL3MzVW84cDhvQVNVcW9EcWZJR0t2RzFGclEwckpoL0JaT2M4RUpQ?=
 =?utf-8?B?V3RqcFArUTR4b3hBQlRoZ0dDOWJpNTYvdFowSFJ0YXF5R2lsRkRIMCtjQks5?=
 =?utf-8?B?bUE4SHRtb0RKOUFIRS9vRmx6cXEybTlOc0VvUlBncE5abGdOblp1ZnFKVDlU?=
 =?utf-8?B?bk1WK09IUXFESFhGTTFIcWxjUEZKK3Z4cVBWaWp2eHZMcnpZTU5EV3N4Nms5?=
 =?utf-8?B?NDJRWnM2RjVyeUVLNGZGeHJJVTVnZUl5RUgrdzYybFRFek9KZkZtbkExbDRJ?=
 =?utf-8?B?UnRhbFJwSVJNbTRoVXN1U2xrRDlkdTJWc3pRaG1XRkVra0NSRXpMV25FWDli?=
 =?utf-8?B?U2pvUkk1SnY1d2xXUFJEeUlncGZXZkFsMHZoditTa2xuaUo1MHBpVUxpQjQ3?=
 =?utf-8?B?QlpEWmYwYS9KRnBvd0NzOE5kdFdVQkJtaXhncncyU01VTm9hajExazNXTDRs?=
 =?utf-8?B?eC9IM2lhSTFnd0VweHhQOFpPTkVoRVZiUnVQMFNFRzMydjZmcjhNekpPQmpH?=
 =?utf-8?B?MW9tVWxQWi9ncDBzbkRreGNjQzFZN1pWQ3paaU1BVXZVMGZteDBhelMyYWoz?=
 =?utf-8?B?NEZnTzBGOFJvSUZkNThaQnVaTlByeWlKOHRvUCtUYnloZzl0TlNlTlh2Y1ky?=
 =?utf-8?B?WlREaU1NcGhNSzNNVlZHcFZKeElNQStqQWd3cHFqMjYwMEFrbTRrTlBkdmI0?=
 =?utf-8?B?dFhSczZVeXRmeUpLcW1yUnR4QWJhdTZ5ZGdHQ29sckV0UnlqSENUWitWQThE?=
 =?utf-8?B?NzhRYThsOG04MFZ1LzdZMi9LVFM0RVFYVlNmSm5TcjBkNDFKMWJmUmZKL3B1?=
 =?utf-8?B?YU5reitFcStsNytXY01WYWpqck9IbllMQXcrdCtrZjlUZEo3czl0ZVZqSk5G?=
 =?utf-8?B?bWpMNEdINFhyY1ZWM1N4aWh5M05INThNRzQ0dXI3M0ErN1VNT2plaUVtR0hy?=
 =?utf-8?B?V01FRUJveHpIRkUyZDM1bktaRHo3d01NazNwRHozUEt6clU4YnhzSkp0OXky?=
 =?utf-8?B?aDVxd0R4ZXZVUlpsRUJDaUJRQUxIVG1OWWFVOTRCQUxHd3lGTnpGRFpDbEgz?=
 =?utf-8?B?ZEhrY1dmaWxTK3VicFdSUE9maEtvZjJsNllodTY5RDdJNkxkSE9Gajgwazd3?=
 =?utf-8?B?STQvK3NBZlY4MHh4OVhKMEJOUDlaemdYOTdqcEhXZWFiT0liS0U0Q1ZpWTAr?=
 =?utf-8?B?NFZTMjczVE5MaVIrNS9sZnUwM3BSRElYaWoxWGVuL25uS2JXSTg4TVY0Mk1Z?=
 =?utf-8?B?enhoZi8xZlVCbkVldWw2T0JKa2ljOUNmcnlsYXhEa2VaMFpYUWJBUnRnRENS?=
 =?utf-8?B?MU5YWEZnZmptWkE2RkZ3YzJvU1dWQWgwWkFjS1l0ams1U1g5andQN01tYWh3?=
 =?utf-8?B?ZWttcWVGc0dMOWYxK1JBM05rbkdkQWRjeXo4MERHWFR6SGg2d0pnL0ZEZC8w?=
 =?utf-8?B?akVud1dCSFZjbXNEdlB5dUovYWtFU0w0UHErRm1qNVlnRDRMdk5EVkxvcFdM?=
 =?utf-8?B?TW1iNG1MMDNPNTBrN09yekJqTjU4S3dXb3ltcXd4V2FjU1hCcHNoQWd0dHJ2?=
 =?utf-8?B?cy8xSHVwS3VRRHVLalRLbllFR25DQUphaFFEVjJjdXpIRlZ6Mk55SzhxZGk0?=
 =?utf-8?B?K3dWY1J4Tk55NFZpM1hRWkFMUUdSelVldHhHZGJyTXVubEEyak5POWlGTTZM?=
 =?utf-8?B?MjcxMnpUKzJXKytYSzRiOVJiNnhwMloyUGQyb3pmbmNYNERYclFNTElTd2pN?=
 =?utf-8?B?a0xBTzdkcGNramxncU5NWDZIdGIycXVocHphTzFINHhjZkM0MTFsc0cvVVVS?=
 =?utf-8?B?MEttU1lZOEFueURDdUs1Yzh5SlpQdkpjSWQ1bW1tRHQrQ1ZhRTBHS2lUOUhw?=
 =?utf-8?B?RzBYYUtYNXlteG1pWW1tTFJWZ2h1ZDNzcHNGZ2hsdXVXc3FJVlNkMmFpRDJs?=
 =?utf-8?B?cWNhV2lOZXF1TDlLYTNYS01qUUNWbWZUbTkySWlCaU4za3JUak9udUVHeEg3?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JfLykDCZhqvO5lqUVpcO2g8VrOrNq0rGALISeeCAHcrChqoXeo+PJrpW9JMCeptwUT8D34y/U5hxcMB8AZfsMHlOxk7d/4YG/7FJ7DlIq0x+GN2W08JFO264yTudfZam0Aqz6t3jZ6OcIv8blu+4lxCkaxUsN3QcMUI2AsC0UOdvyaIm8mfRk/GUFaDD/rYi6xI7e6aOFp0kdr4cmZ1zwTRmQ3bPlAM50b5femz2pn9WmyOm82T0XTtawH7zjOBjGkxWC2ZVvGA/mmOzBrJ0ZK8LYSOMdXBohnecCJGGWLyUCuS7/74ihL8SjuFhqQNAWqcH0dSwDNc6xelAiFrMefTnuBZvcbMgL0PhRM7bHxfZiVUe9vfC6sdWDoOiT3I80nLmoz50hN0UFLEi6nB7dADBtVx4KmvdaGgENXRBJ3PLUNuFjWo7DvJKBYuGSVTqn/jDOMN4S6rY0HSFHtEn+9DOcawAGFKR3Ke/274iXkRcM25df8aefLOD4vWnmhFGNHkknaNTuQMMke5aT1uIIA5jW9l76AoaOo8kOZMXfRDYdxY2sORPImlLnnbkrgoGR1Wjcy6stH3UuxAZtzjW8kZL91mg/3MiJOWdRnDP6ZOxRB0JkYBYsp63qhF+WFvLXBTb/Cxd2c258XMB2pXMnYYNuF6hpz3qdCv2OvPdIKebe98REkLdCnOVip+kDjxWQEhbRv/EnCSUiwLx6UT/thyQA4kuAFdGhN/8h1kywvlfp38TJpsjQM5WlFGgDrL0IEkJiBAQgoqFtSu6CT1I2nQOm6R7pIr6L0p/TRz/OshNZwXjb0nmV0BsIJCvk/X3zoBtQMRqTYnYv16oNsZ1IW5LNVITwyjj30ERo/Ax4QmtVFxOBCjvIiYVAosfBxo/
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d26634b0-126c-4cfc-045c-08db8de13a13
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 14:04:28.7326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IehIX2qfpIgILrs22kH+AdL9akhUASLx0fTKVj6VqpZyG+Oia+gMx4SXWwijwIZPqbGPKdqjZGUphcZSspV0jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5242

Just like it's done for the XEN_DOMCTL_memory_mapping hypercall, add
the permissions checks to vPCI map_range(), which is used to map the
BARs into the domain p2m.

Adding those checks requires that for x86 PVH hardware domain builder
the permissions are set before initializing the IOMMU, or else
attempts to initialize vPCI done as part of IOMMU device setup will
fail due to missing permissions to create the BAR mappings.

While moving the call to dom0_setup_permissions() convert the panic()
used for error handling to a printk, the caller will already panic if
required.

Fixes: 9c244fdef7e7 ('vpci: add header handlers')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Fix printk calls.
 - Expand commit message.
---
I'm unsure whether on ARM MMIO permissions are properly set for the
hardware domain, but I don't have a system to test with.
---
 xen/arch/x86/hvm/dom0_build.c | 21 ++++++++++++++-------
 xen/drivers/vpci/header.c     | 20 ++++++++++++++++++++
 2 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index a7ae9c3b046e..bc0e290db612 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -715,13 +715,6 @@ static int __init pvh_setup_cpus(struct domain *d, paddr_t entry,
         return rc;
     }
 
-    rc = dom0_setup_permissions(d);
-    if ( rc )
-    {
-        panic("Unable to setup Dom0 permissions: %d\n", rc);
-        return rc;
-    }
-
     update_domain_wallclock_time(d);
 
     v->is_initialised = 1;
@@ -1184,6 +1177,20 @@ int __init dom0_construct_pvh(struct domain *d, const module_t *image,
 
     printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
 
+    if ( is_hardware_domain(d) )
+    {
+        /*
+         * Setup permissions early so that calls to add MMIO regions to the
+         * p2m as part of vPCI setup don't fail due to permission checks.
+         */
+        rc = dom0_setup_permissions(d);
+        if ( rc )
+        {
+            printk("%pd unable to setup permissions: %d\n", d, rc);
+            return rc;
+        }
+    }
+
     /*
      * NB: MMCFG initialization needs to be performed before iommu
      * initialization so the iommu code can fetch the MMCFG regions used by the
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index b41556d00746..60f7049e3498 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -17,10 +17,13 @@
  * License along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/iocap.h>
 #include <xen/sched.h>
 #include <xen/softirq.h>
 #include <xen/vpci.h>
 
+#include <xsm/xsm.h>
+
 #include <asm/event.h>
 #include <asm/p2m.h>
 
@@ -43,6 +46,23 @@ static int cf_check map_range(
     {
         unsigned long size = e - s + 1;
 
+        if ( !iomem_access_permitted(map->d, s, e) )
+        {
+            printk(XENLOG_G_WARNING
+                   "%pd denied access to MMIO range [%#lx, %#lx]\n",
+                   map->d, s, e);
+            return -EPERM;
+        }
+
+        rc = xsm_iomem_mapping(XSM_HOOK, map->d, s, e, map->map);
+        if ( rc )
+        {
+            printk(XENLOG_G_WARNING
+                   "%pd XSM denied access to MMIO range [%#lx, %#lx]: %d\n",
+                   map->d, s, e, rc);
+            return rc;
+        }
+
         /*
          * ARM TODOs:
          * - On ARM whether the memory is prefetchable or not should be passed
-- 
2.41.0


