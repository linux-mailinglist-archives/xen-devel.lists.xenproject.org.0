Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC5E323A84
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 11:27:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89240.167937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lErO1-0007vn-7R; Wed, 24 Feb 2021 10:27:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89240.167937; Wed, 24 Feb 2021 10:27:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lErO1-0007vR-43; Wed, 24 Feb 2021 10:27:17 +0000
Received: by outflank-mailman (input) for mailman id 89240;
 Wed, 24 Feb 2021 10:27:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qs49=H2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lErNz-0007vM-GT
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 10:27:15 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c58d1fbf-852f-4aed-99c3-6be0f2649571;
 Wed, 24 Feb 2021 10:27:14 +0000 (UTC)
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
X-Inumbo-ID: c58d1fbf-852f-4aed-99c3-6be0f2649571
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614162434;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=jRuMHfDyxkdgvMhn5xs9whO3sueeJ+Bdbr8aC7PX8V4=;
  b=MySzAkGnVaM/wJd/y+3ZqSCOZ0wn19xFC82DJbky6AkyB2QEJMwaM6/Q
   xQOuGDoumapH1F7N7iw1KH7dLEddqVIHYu2f+4xroHdyj18IwKyUZUbCc
   EGKiFqqbyO8jvj63EvhVEFqa0lWSeSLgFtdlCqiCbToBOA0KWjnih/VV+
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: eSh1scmUSUBliwiVocOA2ko1c2aqD8E/OO5rx4YPPWvYRNlt0sAF7PRiMRN6gHO3QnQbzt7e+7
 UDge7B1ZI0OxZujy7oFguS9fGVSdGhyrdcnCQWmhWDOtnk+pUUEe+pNjh71C4dIEjSPtZyRCKo
 rid6nbnHvLwaPhu5P5Rg3UUxepqw7HsHIL9rUOXsTVSqsHGxpXL3GxV3g6Gn3Vc23Ue1CzOqYT
 f6u+PbHaGrHI7M1nxfmBWFaJS4MR3H/J9Aeq92kDz0W27LIdzlGxNCGYZvRbISro/dOLAyWy9P
 jMs=
X-SBRS: 5.2
X-MesageID: 37903092
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,202,1610427600"; 
   d="scan'208";a="37903092"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JEH23qJ2ulh/NwIzAoTM52QudN8XWFFEdW+ShdjSJwIfXm+Cpvkycqd/cBBk9HWTiPAAZFlWysk9P59jzTGPyhI4p2moosQM6n3y29MrJBU3cvlRsaYgsA7+zTOEV4mj8uvIKYEfTuwb9jsZY45VIPtyFt9914MlrqhJrrOPTeSBVZUPvOBRMTUeT3ch2pdj1KUGLPaje4aOOcKGGgMN46dK9kcSmKMNNzoY0n1rFwIdTWMcbpB8PFpo/iADc+IBIby3/k1BJhr/iZPnZL5iIU4n9E99rkQgRAjHTs9B3nDVFdM7rPP9ns0qa6jiNXedJWNvSGQQ0gzwo6cQX4Dw7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjFphK9MVO6aR2exaPNH0+6en/1Yz/OXiki357Cmo/Y=;
 b=CBgPNCrpu0aSfAQiUoh2r8Q7X1A2uwDWthZgb8IV3uAlQLzyiFwKFGypLYsqTXXaybKP0+oTEqUojX96Ux+H2+6u7IDpa/YxModch6RQ3oH7Kc+pWb9rRpzXMBuLRpzsBcucIzruXpW2yrpuiILFFuk04+4cFq+C5x7d8ZuXvDwtFJUDiF1NIj1ztI0D8OYdO+Wm4MT6uJQOOJ63dnTB3oD0i3NTlSn8uTMH4D3QWS63VNI0w6+HPmoaaeCYgfoN0fiqtH+sJa0te7n6lZK3yRj3lD2GDAXOMIaGlgpu5wdzft/kYp41Gda63bKweP6jsCwsP1i1VxXiZk6dyY607A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjFphK9MVO6aR2exaPNH0+6en/1Yz/OXiki357Cmo/Y=;
 b=ZKT2v2abjWucH26b5nSaA4ycFFBA+Ay9NmZCgWXkIYSB4Iwsrf2XlGg11BmW+kMZHhxuKn2I1S+O+cGrhsVCxb5quijHyZqifp8tDK0IK0rCE7l/yUR77fNMmu402lscM+/+hurrjMt56Dzn3/2pyLRnkTOd3CiYwEy9xqQRisQ=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH 0/2] hvmloader: drop usage of system headers
Date: Wed, 24 Feb 2021 11:26:39 +0100
Message-ID: <20210224102641.89455-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0178.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::17)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 151abf84-a9e6-463e-362e-08d8d8aebeb7
X-MS-TrafficTypeDiagnostic: DM6PR03MB3481:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3481AAB1E1CD913A1E3EC22F8F9F9@DM6PR03MB3481.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +vKHZPN5tiGTsyZJffEsD4iQYlDAJxGUcBdES8hrdzcknrIuadyIfSRhXdS7G78HcOnYmblWtySiu1scPwfg/Quz/RKQDlzUuZtXZyNtx4K0GhbwDXvZ1fenf5XcPxtYdkNEB9cI6gkEsjE5V2BEImAKYBM8DUABSO7IbTRffYZ1GRq/5E56f1mSVRKUKgpugdmZHn+hn1Y/bQgzTJ7rqiW4A9JUW7fXB8B0UDfp4M8LyfTmbweavjiYyhVxJyI1FiBCfoXDN2XzobGNv9FWo19PTC5rty99vF98A0qKBLWcRatlNeKtG/OgxqrHN+37VyMXxZbqCIPLyc86tWs5m7E5gxgt21Z9mo1CqQmefad6mQHRLBsfpFE0zjTYQqoF7I47oFiTmau6LaJkHGqb0oo+CuAT8TP/3k/2HY5S4X+vIqu7frphtvUTohSlJvFtK87+RYT8dOsBpEt+92Hbd7KkLJ9Nr73xYEhS4FYFuomJpoeIZgYbz5iwjq2w6xdxnvl/i4jImiaSO/FKMIUVaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(83380400001)(316002)(6496006)(1076003)(4744005)(86362001)(6666004)(26005)(8936002)(8676002)(5660300002)(6486002)(54906003)(478600001)(2616005)(956004)(2906002)(66946007)(6916009)(16526019)(66476007)(36756003)(4326008)(66556008)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RGdtU2hRVWxVRlpFZ2puNVdyNHhmOEFQTURlbXhNbmJ0TWZKVTBaNStDTzJH?=
 =?utf-8?B?amRlbGtqSUp3ZUZONGlhd2hYanNlWERnWDVOUjNpazJ0cWN1ZDg3SU9PUktV?=
 =?utf-8?B?bzFPaWpwK2NSZ1BaUWhQYVk3OE94WldqR2V4ejU2TTMxcTNHdHgyQmJzVTFY?=
 =?utf-8?B?KzNpUXI4cGhBMGdhbWN5V0wyRW93T0ZCdzEySGlrNHpoVFZxNW4vSXNvZEcw?=
 =?utf-8?B?ZG9BMTcyTlpmbEZkRDlITm94TDVkTU5PL250c2dnVzBOY3hydVBWRE5CS1B1?=
 =?utf-8?B?YWpKMHJFQXFGM2xoUjQwZzUzQllCLzYwamw4TVN4MzRoVk5weDRxOUgxN01S?=
 =?utf-8?B?dXFJWktjQnMxc2FmT1pYT3BhdldJOFpFT2NSMnZCSENlSWhZeEdrd200Zlpz?=
 =?utf-8?B?WDgwbXdFMllnMTdzSWtwZ0tkN1c2TGhvYzBINllWbDVWZTB1M3RDMGswMmoy?=
 =?utf-8?B?NVNKVVd6L0drYzJXSk5MVXNXaEhDRHI2dHhqSXVCNVVxaWl5elVTNnpoODNY?=
 =?utf-8?B?RE1yN3dFaHp4ZVA4YnFGMXRaUFgrMXlRWmc1YjY5L0tCWVpjT0IvVE5Hanpu?=
 =?utf-8?B?bTUrUWlhelEwazlXZU9KTlJnVU40cW1RSVhIbEE2YzhaQ243TmJ0aGcra2tF?=
 =?utf-8?B?OGdCakx6c1RpdjZhM0VFeU1SRmFsVEw0dTJNaHlNMnQvUExpcCs1YVJ4YXVG?=
 =?utf-8?B?RmU5cGxhY1VOd1U0bmZnS2x1ZytjNHF5QkxxZFBZcFZRT0ZWN3VOQTNkTE5v?=
 =?utf-8?B?NTYyRy8ydTRxWC9VY3pRQmpERkl6TjVqNGczcFlpYUthaE9oRFduRUpTRDFz?=
 =?utf-8?B?V3BZZGFjdXRhbi9QRElvZU9od2VOMVNlN2IxWUsxTksxb1RFdUhoTnA3aE1i?=
 =?utf-8?B?a21yT1dMTjM1Q0tQT0haUjlrQVYwRm81UTkwUFVMbXlQSGgwOW12ZG9HVWZI?=
 =?utf-8?B?T2dtNmtwYnpWYm1Ca3F1WjliNHQ4S3hmZFYzYk5nZ2R4bW9MTzNLWHhlR2oz?=
 =?utf-8?B?eHV6ZTgvVnJTcUluY1Q1NWRCMFR0Nmh2WXRFdzgyVGdjYUhMa0NFMHZMT0dY?=
 =?utf-8?B?QXYwVTlXQTZYdUpUN3VKMVpnRFM1OU1ublg0MTM2bkRHZkd6MzMxL1dDUC9V?=
 =?utf-8?B?cjUwT29GZWRPQkdWU3U1V01CcHI1azMwZmRVTmZQS3dMVWFrTVRpM1o1dml2?=
 =?utf-8?B?allZbzBrVFNlbHA3VW9YUkZ0SFRlNXJoRFNleW9lM0Z5YmxlcEJuYWYwMVBm?=
 =?utf-8?B?WldLcmNWdjNDV2dQcGRpNzhrUGFDNE1MZGZvQWpXWHVqQ1lVSENIZ2taRHFI?=
 =?utf-8?B?aUZzenUySGFYaWM5d0tEWkROaWovdlJCWlptQ0VxZEZsSFVSd1B4eDNBRjBY?=
 =?utf-8?B?cnNRdVNkRXVHayt1bTdFVFo3ckdXOVd5R2dhVFlHSlRwOEhmdzBDQ2hneDAv?=
 =?utf-8?B?MFJPNndNOTgxdVh2cTI3Kyt5VW1hMmZPWVlXbmRhSERwLzl6MlBzSmI3NXJt?=
 =?utf-8?B?Q1ZZOGpoVGFiUXlJUllpNWtxUjRZVkMvMEVxK1RibVNLV25TekVCK2dYSkpT?=
 =?utf-8?B?MmVHNWdUYWpPTFQ4bjBzMFp5Y1hEbzhicWd0a0Yyb2JPV29tdU5ZLytxRlpy?=
 =?utf-8?B?U1VtNGRFR3N6cmEvV1pVcFV3UG80c1Rld210cXRaQkpWYnhiRlFidHlYRjZU?=
 =?utf-8?B?T0s3WlRkZnNFKzJYZG5HbWkvNXZNMTQ4cEc1M0pzV25GdExiM0dldGN2VUQy?=
 =?utf-8?B?cDVXd0YybDhjVnA1aTh0YW5QWlJWUDQ4Yi9adzBzQUc4anI2TFU1eEhBRjVI?=
 =?utf-8?B?dGM1T3ExRkZ0cDJJaWwxdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 151abf84-a9e6-463e-362e-08d8d8aebeb7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 10:27:10.9567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TqEL4fAwXMu9IP4zbY+sIJcJepyLr04isYDyfJxL579vcSGS7smLQCr4vVCUu2c94EOVSrWd9/dyMAvs+mJImg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3481
X-OriginatorOrg: citrix.com

Hello,

Following two patches aim to make hvmloader standalone, so that it don't
try to use system headers. It shouldn't result in any functional
change.

Thanks, Roger.

Roger Pau Monne (2):
  hvmloader: use Xen private header for elf structs
  hvmloader: do not include system headers for type declarations

 tools/firmware/hvmloader/32bitbios_support.c |  4 +-
 tools/firmware/hvmloader/config.h            |  3 +-
 tools/firmware/hvmloader/hypercall.h         |  2 +-
 tools/firmware/hvmloader/mp_tables.c         |  2 +-
 tools/firmware/hvmloader/option_rom.h        |  2 +-
 tools/firmware/hvmloader/pir_types.h         |  2 +-
 tools/firmware/hvmloader/smbios.c            |  2 +-
 tools/firmware/hvmloader/smbios_types.h      |  2 +-
 tools/firmware/hvmloader/types.h             | 47 ++++++++++++++++++++
 tools/firmware/hvmloader/util.c              |  1 -
 tools/firmware/hvmloader/util.h              |  5 +--
 11 files changed, 57 insertions(+), 15 deletions(-)
 create mode 100644 tools/firmware/hvmloader/types.h

-- 
2.30.1


