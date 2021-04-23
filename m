Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C5A3690A5
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 12:54:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116159.221764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtS4-0004CE-As; Fri, 23 Apr 2021 10:54:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116159.221764; Fri, 23 Apr 2021 10:54:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtS4-0004Bl-7J; Fri, 23 Apr 2021 10:54:24 +0000
Received: by outflank-mailman (input) for mailman id 116159;
 Fri, 23 Apr 2021 10:54:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zio3=JU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZtS2-0004BS-OB
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 10:54:22 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe922e6f-90d6-40d1-9c8c-8c8d6669f295;
 Fri, 23 Apr 2021 10:54:20 +0000 (UTC)
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
X-Inumbo-ID: fe922e6f-90d6-40d1-9c8c-8c8d6669f295
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619175260;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=V9n/cbZecot66WlqkP5TQPsHAT9yUadrTwZKpkC73E4=;
  b=Iyu0N7Ujlg8QR4pbGwst/E4NR0CWMeFuXgtMtrVvzc5/t7lu0bCSt1qC
   NgwnheTB9j/sRbKne3DX24Mpd1lEJbLiiwbNQ7Zkn7QBAwyEUJKGiivNl
   9HntTc1+l+w7RwMOwBA8ghHARyTZvpAd5x7sYTgd73c5ybjPW6o3Rsgch
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: RXn9/Svsc9sclGozNQenDGkNaF7qOVaIhuNRmVsPYzlC9BpZesNjvTOVGunjoBf97vMD73CTTW
 9DuGxmUgRZ7W4JsU+RmTOtpwDBLyWf4zNLizjn4EpJFabw0gg4wbtttr84V2hOfHVnt+2sBdRn
 1qx31yI0PtteF8m5oRnQJ92sG+U8utCb5RlUC9xwM9qh591z7LxsbsYihol1XFYIEUd73AQWeV
 TGWSJO973Xj8CxdsydbHtixqTEhrRy5UH3yIm4QiFGY8PIhM0xKH9TsShFGtDRj7cbwHJMr0RF
 IB4=
X-SBRS: 5.2
X-MesageID: 42383580
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:mN0kya7SrVIA6OUZ5APXwciBI+orLtY04lQ7vn1ZYRZeftWE0+
 Wnm/oG3RH54QxhJE0Is/roAtjlfVr385lp7Y4NeZKrWwf7sGWlRbsSkrfK6TvmBiH466phxb
 5tGpIOeuHYIHpbqYLB4Ae+G8s929XvysqVrMrX0nsFd3ATV4hO9AF8YzzrcHFeZA4DPpYhEY
 rZ28wvnUvcRV0yTuCWQkYIRPLCodqjruOSXTcjCwQ84AeDyROEgYSKaCSw5RsVXzNRzbpKyw
 Gs+GGUicvD04DZ9jbm22De9JhQktf6o+EzfvCksNQfKTnnl2+TFeNccoCCpzw8raWO71sngb
 D30m4dFvlz8H/YcyWJpwLs0WDboVATwkLloGXo5EfLkIjcfnYaA9AErZ9FehHZgnBQwu1U4e
 Zu5SalkLZ5STnHhz/w4tDUUQoCrDvEnVMy1eMcy2dSXuIlGc9shJ1a8U0QC5EaE0vBmfMaLN
 U=
X-IronPort-AV: E=Sophos;i="5.82,245,1613451600"; 
   d="scan'208";a="42383580"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfqA6bdtDd85aYUpFC8EtuSIKMRrRWOI3vh4mNawqVsYUGYxUEZngl0KGd5fWGSfvl4fAUfqKvskanqf/46NEnc7moItB/9ftLIU8eXYPT7YLlw+Hu4+qoamwgttfMXiZaT3AhblndjzkJ0rzb8HOhTN3Ks77frb9sYO7zLAf8dE9UUxFzRgKBX/pNHKI9B1IZtDnmmaaUsj3WBTDgLS20nnASPxgqhSPNKNOBfO7Ol2Ab2ohr0gEPHN54GhXDJs0TyqAULcbWM5kPNYExtovyMLqeFIDQi+nIxL3Jof1sYAa9/BZjkGoKYty+X0tLn7WEyZRBh9B0BHGJB+6JXOiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53O2tEnqOV87xRSq5S2pjHQKd2sUEhduNa0fw8jowx8=;
 b=AWY6yAdDLjpzDxv4A/Q4ksxDdP/N/+i9/IZSGEV86eGXn2AplEH34F4WjPgZfggqC+Agg+0eVNko1n9CHVkD+Oc31UwhTf3h8NqFDXV52v+KdfLcRsmf2fxUkrDpkMnnYnsipn7628Gm+9FoeHm6iLhcbwUr2EfUwPnT9slHAzobmvgoQQrsVIv/dZBTiZO7RZj82OdtwwceRKxag8pt2Z70Xh9/5WgEWJcgphoZ9/BTjtg/eSrBF6eowtIefFLK3oIvepKelO6rmLwkZ8m3T6aF3bcRRFKh5YYkBSEulBxRJTLKTsuVBvyjdZx7urs5DgzUAfWwDSFWLVp5b2Re/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53O2tEnqOV87xRSq5S2pjHQKd2sUEhduNa0fw8jowx8=;
 b=k2ZVjAZfAc0HKRjUl7ziAi3NUgNd2u+qFjUwPfwwrGDfo4vIxyVygxf8qS7ZhqQ5CNQsMVFrtOghtLLFIA4O7/5Bb8kxv+5AMZvnUEedb22bidKvOcHc27k+bXzsvMN7u5lWvwem+PI4ekfrMO8h3WOFFPoS6kLhGk1KIyp0Tbg=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/cpuid: do not expand max leaves on restore
Date: Fri, 23 Apr 2021 12:54:08 +0200
Message-ID: <20210423105408.7265-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P193CA0056.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2f43b28-9fe2-47fd-2657-08d906462460
X-MS-TrafficTypeDiagnostic: DM5PR03MB2492:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2492DF5F82B9032C744A12BF8F459@DM5PR03MB2492.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cBzpD15vf8pBQQuJagl2iSQGKfwlqh/fpFp57xyMODE62WKeiVfIuPxE+yruynzCsdp0e1SwS6O/CsgJoq3i0OEIw5p0vY6p8BmoGjhSx6G1BjWQcfHsn+emI3VX4C6tCMNLnQbGThagQvM/zYg9i0fP++HVQb/FJdJ6P0Z3Q9YxfI/HcypbtSKS5NUXku4+Jp4iS+cj10pnMqBeVXlz5WcZk5exdskYHvGfpoAzYujmLGXaBhxPLcjVPB7F91a/DBwHaxNswLRxBrJMwBCEUKy++h516U+4U3keSYSQKxhPd4SXFyzyLwfNlLVqTWrlBcaZDe+JRbrQ/fO6rxpgpqjnBtXmcDY5mT8Ce3WB+W6+cJ9G0pRM6zPJNRy8A/uVUOOogezLlPP7I/nxZDYRBiETAgj+J2z+zWflqYdz+8+vyTyH7+1ZZvZQyawmAuXfetw7ffL+wyDD14MTn/yfX8VyeJfpHJ9RVMR1xZGVfUhpzUJmHCdnTT9RkRqYuqZIiSSBG+ot2YduF3kBs24i3Dt9P/ukepI50IVaohxF2YTSwI4Lsb0C9WE1tegIBUd5jA1Uzl13yMZQcKYl3kBhkFAjP22zYm71o8x1f3l9gEg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(6496006)(66946007)(5660300002)(36756003)(54906003)(6666004)(6486002)(66476007)(38100700002)(107886003)(66556008)(16526019)(478600001)(186003)(956004)(2906002)(316002)(6916009)(86362001)(1076003)(83380400001)(4326008)(8676002)(8936002)(26005)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d0ZxY0JQWVF6UmFSbDVvOTZWZ3dsMjAxNU5xZFM1NnlrbEh0ODRxOWNZWmZE?=
 =?utf-8?B?YklZSnlPUml0aHNzd2hCWG5TZnVYVHEwbUhXSXhHdFluZnZWUW5aL2tINnhh?=
 =?utf-8?B?cVhRZmNFVWQxaWdhaC80YWVJQTdzdTJqcWh1YVJWbHpPYTkwNHVzdVhTWXZE?=
 =?utf-8?B?RFJ1UDRQM2pWalN5WlFNdjhjTXpTcXhHQzl1RVdPcnFqdW1LODRJN3VyWVlH?=
 =?utf-8?B?Zkp4T29VaGVMZzJPMDk2SUJ5UGlUZmlXZGZXakdUMmx4QmJYL0dxM3krczdK?=
 =?utf-8?B?aFFlVkJLSUxCcG4vUjFHMkx4djFyRWVRQzRSbkMyQkZ0UTB1V2x1ZmJVRW9S?=
 =?utf-8?B?ZzBqRVA0cGtmTW9ZTFpwOGRmT1dxa1RuVXpCdklIRFYzckU5YVBmTGk0Y2ly?=
 =?utf-8?B?djV3d3drZEJnclJjaEk4dk5wYlM1UFA1VER4VVFvR0QxUCs2TGY5UTluZUdn?=
 =?utf-8?B?ZFBpS1hOTENXRnBLRjh0K21lc2NVbHZ1aWh1TVBuSXFFZVNoVStVQ2lSbWd1?=
 =?utf-8?B?NldHT25wL1J3cExPMXZsbXUyd25YekRJSnprbWp0VDIxMVF0aW12VzI4Rkpr?=
 =?utf-8?B?STNZSDVLTUxOTzhOQTd1Q3BwSDQ4ZmpqUHZjZDlVWHFrMXh0MnZ2Sjc0bHhl?=
 =?utf-8?B?UXBrT0x5WjA0U09QdFRrOUtPT01LZkpkZE9UR0ZqaE5YRUhoOUhoeVBYdDVM?=
 =?utf-8?B?VVB6K1liaVdtclJtd0Y0M2RlWnlET3Jic2dXWTI2bk1nWE9IYXYwSmFTMm0y?=
 =?utf-8?B?YjdHeVBJVzFzTTFMaVJENjBLa1p1dzhta2lyZmRXRENBay9FSEY0L0d1UFFk?=
 =?utf-8?B?OVovUnh6V0hDSHpidFprVUVYeitXY3dGSHVJaisyODZwK3NmQVRvU2pRZlNv?=
 =?utf-8?B?Wk1xNDBPRjI1MzBIQ3VodW1BNHRoVmw1WGl1K2ZBbzAxTjlaV1NGRDdaVEI3?=
 =?utf-8?B?NitQaHR5bU1PdldoUGVGWUNFcEFKc29WaUlRZnA2UUZrMlphNEphZnVzVUN3?=
 =?utf-8?B?NU16M0V1bDROTmNDYVVJRDBOU1NzcHBUcjBBZEpyd3ZXaUFPWG9qRzhiUENN?=
 =?utf-8?B?cUJZRVRVRFIzcnlyQnhzYm1QS0NiZnhybWZsUTJTV3huVGdEdlJPNnlyUE9a?=
 =?utf-8?B?L3kzTExmRjAraDF1WnRxWnpjRjNLTDluNGtLVGgvbFAxT25XMmtLZm1SVTU1?=
 =?utf-8?B?WUtJazF5am53S3Z4RjBLUGlJWEFFMWRsTHpCTTArSkE0Sms4M2VhMmNVZmxw?=
 =?utf-8?B?dTdmcjU1RUdITW5xSmtUTFRqZEVzVXlLODA4cXVUaDZRNDJuL3FMYzJ1dEtt?=
 =?utf-8?B?WWFNUUZpZGhSV09Wa3hwWXhvWmFkS2tWUDh5KzA4Zm40clNHQ0RQbEZEK3RO?=
 =?utf-8?B?YzZiS1lXcFlVYURObzBpM21QZEZ3V2x0aTJidkZ5aEFJb2hITm03ZWg1MXFl?=
 =?utf-8?B?a3JTTkZBQ3J3RURob0thSkVkNkNoQWVLcVZzc09LOGhNVlhrQW90V0JnQ21S?=
 =?utf-8?B?R3hpQVVEdEtja0xBUG1EUEdjc0xzTVovZHVHNHN2K0dVbjNZb2VSL2g4dU5u?=
 =?utf-8?B?UE9tdjYxb0JKcTZMSmcvTCtVTVRxc01jU2orbmVKZnFKd3dJYVhLMWFVZ3Y5?=
 =?utf-8?B?T2FiV1Yrc25ySTBYOUV4cHhGWE84cXN2VXFaL3czTTFLUXg0Z2pPbFYzZ3NY?=
 =?utf-8?B?Rk8rYVBJM3VsakRINjMyMHdndWdzcXo4bXc2emdMazZRYlZmNWd6Ri94UENH?=
 =?utf-8?Q?stPf105sev4xlIRDlMdjqfsXfR15yMvGIZtND23?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f43b28-9fe2-47fd-2657-08d906462460
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 10:54:17.9365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPTBuSxEZkWTi/FNtzDjE39bg67pWTtpHui9xSefYi1duXnzSkKCi+S2LyXuTWDYttN9FU8OMIZqzV0DywTBVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2492
X-OriginatorOrg: citrix.com

When restoring limit the maximum leaves to the ones supported by Xen
4.13 in order to not expand the maximum leaf a guests sees. Note this
is unlikely to cause real issues.

Guests restored from Xen versions 4.13 or greater will contain CPUID
data on the stream that will override the values set by
xc_cpuid_apply_policy.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/libs/guest/xg_cpuid_x86.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 5ea69ad3d51..9296fdc34bd 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -510,6 +510,11 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         {
             p->feat.mpx = test_bit(X86_FEATURE_MPX, host_featureset);
         }
+
+        /* Clamp maximum leaves to the supported ones on 4.13. */
+        p->basic.max_leaf = min(p->basic.max_leaf, 0xdu);
+        p->feat.max_subleaf = min(p->feat.max_subleaf, 1u);
+        p->extd.max_leaf = min(p->extd.max_leaf, 0x1cu);
     }
 
     if ( featureset )
-- 
2.30.1


