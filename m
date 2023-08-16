Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A0177DDDB
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 11:52:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584276.914793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDBs-0005m9-TX; Wed, 16 Aug 2023 09:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584276.914793; Wed, 16 Aug 2023 09:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDBs-0005jT-QU; Wed, 16 Aug 2023 09:51:48 +0000
Received: by outflank-mailman (input) for mailman id 584276;
 Wed, 16 Aug 2023 09:51:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8IcS=EB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWDBr-0005jI-5P
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 09:51:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82aad512-3c1a-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 11:51:46 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8393.eurprd04.prod.outlook.com (2603:10a6:10:25f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 09:51:43 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 09:51:43 +0000
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
X-Inumbo-ID: 82aad512-3c1a-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSdAW+HbWQtYEH7JU6CNBs6mItdDFTtQSLd7cchZm9djtfVgxbHUGqOdJzgxSZ9ryaUIBrdtuyE9/WCgYuEyzb5VAgpH4yMEwOVpW0m7fHQVe/TQsB2OBQzpR2XntvfMrFLn9QymF5LIIl5hfMuKEzfHmU4kLQyYsnT6vgnA+vhJAzRvg5FxQ+sPtZzAmypqxOwU9UrvqsYqVJkd68BoCN6TCrqiFMublJvkVQfd27c30LJhEbuMuGz9V0TaNl/IcuZFCKUg4nCDCxjGZvkt0ZlPkq+v21EVSV95B6yzPNHh3pU1xU+ikyTNGjWbro7JFOdwcCXTFbLPi6QD5KsAGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6H3/85fsNAFw/guO2vvs++wKfCZQ297B6+Y0exOgXnU=;
 b=L8mwN05r3/Wty17XhiEtxlhHLkeRHUaRnmDeeWzbcQIY5HDNzL/a+GlcwDwAV7AQrfFmKHf206rq33qA9qW7bvs0kTBZJkVWOzBVKELOqXuTZ2Gv+GS9FfHccDQSxpL7T8YtDBa66QVxHfbz+1qIanD6Xv1qrf43YyQj4Xq1SZyGp7A2WzEUulS1KlFyZnqSW6cNtjOVkoGOku7BzVG152jFenqpAvdKBXE3muyEmtD4lfYQU/j6vRQl02fjRFaC3YQShmkEkKBuqXg+nrgEVembGAmNGp54DkZ3e/qda0CntbhBLnoipTTWsOcz5+1he03QFOe1q9kuf/KEV12vnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6H3/85fsNAFw/guO2vvs++wKfCZQ297B6+Y0exOgXnU=;
 b=40QKk7kbznnjvZc+ZJWZuB6SBpxfw55LhsojEsJElrWp+AzFdDg9NaVAXr8C6ETtrmXC/y3muSmdcwmSWJagRmwIzfnxHgAxZqRff2sknaNgryksXALjDdoKNY3FchPr6yc/y0TYV9Q+OOmAKUCWzq6UJuTpye23dsndqJpfeffv94nJLS/qprBGABPD3AGF08L0QX12KiJh4MvsUjHedmxpAARFDEkHmA2bc5vNwVNk4j1s940KjgoKJ33YESRolAS81MHz0MU9Kde+5d2jj6JQOv0VBdllbNQlzvjMnbl4OZp+UovUWnlMZJMO6R7YqWyxsh93d2EfHjyd9NukJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bf497b79-7661-8fa8-6979-90f9951c8735@suse.com>
Date: Wed, 16 Aug 2023 11:51:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] IOMMU/x86: fix build with old gcc after IO-APIC RTE changes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8393:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a8edc36-a247-493e-ffc1-08db9e3e655c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7geuVOxQZYLljxA1k12SLqhkb49y0pJZrrMbG3w5tqJUppehMbzqkKLZaqwMZdg68BfP9GSkvFKun7qC/ydQPIiht830gxXDvUpSP3h5hE7xCtOtEvRtI21bY4cflZE+YjebyM6KfqP10hrFKRWKUYPYLMM7ZXYvYOsIyIimkBSwLTHWyyGHQn313MusTPS3lMaWzOojUoWtYYm8qUEbzByAb7T2dPaGEgdMlnrHcdOg0VMKZnyl3OP0ZA80/YDaYd2FAg7Gh2rSv3460k3FyiKR6ABj8OxRrU8whqYRZ+e5VLd9PMjk6lip4HaZ8XlfgVvq7pnc0kHkJD4vRGvla+6o0cXX7XhsJ1qoj0DygOou0C6q+bLZW2ReVixCYDPl0bgRKschftJSK798BM8WBCXrcCLtDP1eQ21xXm1F6GfesqVWvmFUVK+MDSWvIAplCXZGpOgS3zr1EH34kPaRhcSolcMxM2O/WykUCBLlaWM+Bhxk/Gc6edPdWM/tDRYHg8MJsBWxdObYLiiGU+/797I506RGwyFEEJlWVmSSYCYnsXB18KgkaBAgz8DILtA8oGbNLpGxx7OaHs8zKMgNV2qaja5eTgArLZ5yUocbEKO0+0YEPLZc18JqAhPlqivPQLZDAe5i66A63A7GONVlUA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(366004)(346002)(376002)(1800799009)(451199024)(186009)(54906003)(316002)(6916009)(66946007)(66476007)(66556008)(41300700001)(5660300002)(38100700002)(8936002)(4326008)(8676002)(31686004)(2906002)(83380400001)(26005)(478600001)(86362001)(6512007)(31696002)(6506007)(36756003)(6486002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzhaaXJhV09qT0JmSnRlbmRWWkdJRmhRMnRUWUFXL0dENTRyNFY3RU93QTIv?=
 =?utf-8?B?UFkvNFM2ZFgvZXk2ekJXQWh6bm14OE8ydFVYeUx4Zkhjazh3YmQ2UzR3UUZI?=
 =?utf-8?B?Y2ZnTlRHVUtvVDUxODN0R0FjUHdCQlJVY0pxMS9DL0FkNldiYlBoWEpGY2d6?=
 =?utf-8?B?d25oTDRWYmVwRGpzUXhDUTVIcnhuRjV4YTZBUVROd3kxQWJyRWZIYmZLRTNu?=
 =?utf-8?B?Y3VndmVtOCtXMlo4a2NrQ3Bma2ZmN0JPTGdjeEFkMFQxanFydXUvYU9qYW5R?=
 =?utf-8?B?czE2Wm9FT2V0VGFTbVVsSDJsVm9WWnRlcEREaVlDdW5RRDNFQUxNTXN3S29s?=
 =?utf-8?B?M0xYbEMwOFc4aFJqSnJvN05DckdzVUl2RFV4WEZSNE9RV0wrbCtXc002amFZ?=
 =?utf-8?B?c1pLZE5LQ3FqNTlxZ3Y3Vm1oNzZrSWIwc051WWpCclVVbG9hZ01YTkRSbDN6?=
 =?utf-8?B?emdwRmtkZk44RkV6a0oxK2w3a29rbkFuL3k3ZUVwSC90YUlrSXE4czFNZG1Z?=
 =?utf-8?B?M3M2Uy9salc4WW1RWktkVXBEbWpwbHJ1U2pqb2tEcEl1L0VYYWxsUWJvOWJh?=
 =?utf-8?B?TVZ4WmhyVlZ1a1NmbjZWb1JWelp5TW43WHpvQ3pKbFVXMW1EbmwxbE9YZDRR?=
 =?utf-8?B?dTR3L3VxZ3R0NDAzVW55OUZ1YVdIdFo1V21Na1pzeDhGUEVhN2NJQ2pXMFBV?=
 =?utf-8?B?TXlDalh4alpvZnh4dEY5eGRmbU5uQ0srVjBaSnNhWHBjVitOa3gzLzZVZnhw?=
 =?utf-8?B?SEJpUzFtRmIrdS8vRjJIVWlXSDhJekVRTkZUUGRKZXZuVmlzdDFHK2xsSnZY?=
 =?utf-8?B?Q0hYY3VGQ1dlMUtkUHZmWk5qYzl6Z3NMcGtTYmJtTWJyZmRuS0RWVUd3VWZS?=
 =?utf-8?B?RnBpU1pCVDNvNHV1cUNEYlhOZCtJZDIvYy9hbXVOcnlVVGNWaEdEYTNnMTJt?=
 =?utf-8?B?VUNkM3hFcFdBRzhqOEdRR2VGVS9sMC9Tek9YdFVUYU14czFPYTJSNHU2aVFN?=
 =?utf-8?B?ZWduWG5LcXZjSEcxL2hOSjJBc250K29YTGYyN1RBQ25mOUZhemhucTdMUUtP?=
 =?utf-8?B?citRb2RzWUhsSU1tcW10TEV3ZGpWWVhaZEoyOG5QQk80TkVTSVkvNmYyYnNh?=
 =?utf-8?B?VW5JODJYM2pkOGE4TVBYVnp6SC8rUlFkT1Fob0NvcndtVzRxQ2VPK0tuRkw5?=
 =?utf-8?B?ZEcrKzNna3FaaEZ4QVlFcHE5RmpZbjZEdi9VM2J1d1JneGZpSnNIK2VubXRl?=
 =?utf-8?B?QWhBZjNvZnBFdlJ2OXB1NEtDTFZRTis4d3lBYzhPZ3ZYbEIvSWo5UG9qbHc1?=
 =?utf-8?B?NVpPR050SFdoRERvM3l2emRGNGE4VkhRanRjNnA2UE9GSUJNQTlkTFo3c3Fy?=
 =?utf-8?B?NFZmNzRlSDQ2ZTRnb3dqV3EvS29ZWGtyL2p1c3Q4OENwQ1NDTjJxdHZtWDRq?=
 =?utf-8?B?a0E0VlhoVzR4eHNRUmxOc24zc2xtd1JzSnpFZVdXdS9QNmk1b0VsZElRR1lm?=
 =?utf-8?B?TXJDbzBkR1BnaVVlT1RBMS9DbmJiMWhqVWhRakdVTkdocFU0Ri93V3NXNGY3?=
 =?utf-8?B?SmRHODJTbW9Ka2w4S2YxbzdSZzZVZ1NDNm9EVmRUekFTbEUxQUJwSWxPelRi?=
 =?utf-8?B?T1lXTjlmL2hLTEFCeVhncjRFeVhDeVJzRWVYZHFXUFhSNzNFWFlBakUwTSts?=
 =?utf-8?B?ZmFrY2x4cjAzVElaY1VsU29jOEszaUlJeEY1T0ZtWU5NNHo3VGdYRjZ6RUxY?=
 =?utf-8?B?YllZbmJyUWRxUWo3andMckwzQWRWQnV3eTVqWmt5VGp2cFZldVlSNlhCQUVZ?=
 =?utf-8?B?YnQxVDNkRFVuTGYrWVJlR1dLbkVyZEVWWjZlMGJPTVBrMHMwL1VhTzdwaG5i?=
 =?utf-8?B?UGZObmViVTZGanlvRFJPd3RENlhQQ1VvWWRZVGhnbXN2eFE1ZnFRNEVBNm9h?=
 =?utf-8?B?MXZPRlJYZ3ZmNjhUdlNZY0JINVNNU25BR0RhOStUTk01cmRtaFZCd2ZndnVz?=
 =?utf-8?B?ZG5IUFR0K09QMmVBSUhRZGx0SlF5d3p0ZmxHV2NjeFVGczVWUHFjU2JNVHp1?=
 =?utf-8?B?QU1pU1dQQlkxQVBIMFhENDFLMS9USGR4alVlOUdQZk9Scyt0dVh4Ui9zTG9S?=
 =?utf-8?Q?mEQJf9Ew8yO9jwC4f5weilZpd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8edc36-a247-493e-ffc1-08db9e3e655c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 09:51:43.0293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rOlMKP4wXOa/g7mYXZHE84UcdC4hazdqXj1sAoPiHsmRfcnt2MDzKzDPIsFzKZ5mtRZpCiJMTC+9X8hgIo2QFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8393

Old gcc won't cope with initializers involving unnamed struct/union
fields.

Fixes: 3e033172b025 ("x86/iommu: pass full IO-APIC RTE for remapping table update")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -321,8 +321,7 @@ static int update_intremap_entry_from_io
 void cf_check amd_iommu_ioapic_update_ire(
     unsigned int apic, unsigned int pin, uint64_t rte)
 {
-    struct IO_APIC_route_entry old_rte;
-    struct IO_APIC_route_entry new_rte = { .raw = rte };
+    struct IO_APIC_route_entry old_rte, new_rte;
     int seg, bdf, rc;
     struct amd_iommu *iommu;
     unsigned int idx;
@@ -331,6 +330,9 @@ void cf_check amd_iommu_ioapic_update_ir
     if ( idx == MAX_IO_APICS )
         return;
 
+    /* Not the initializer, for old gcc to cope. */
+    new_rte.raw = rte;
+
     /* get device id of ioapic devices */
     bdf = ioapic_sbdf[idx].bdf;
     seg = ioapic_sbdf[idx].seg;
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -432,8 +432,7 @@ unsigned int cf_check io_apic_read_remap
 void cf_check io_apic_write_remap_rte(
     unsigned int apic, unsigned int pin, uint64_t rte)
 {
-    struct IO_xAPIC_route_entry new_rte = { .raw = rte };
-    struct IO_xAPIC_route_entry old_rte = { };
+    struct IO_xAPIC_route_entry old_rte = { }, new_rte;
     struct vtd_iommu *iommu = ioapic_to_iommu(IO_APIC_ID(apic));
     bool masked = true;
     int rc;
@@ -453,6 +452,9 @@ void cf_check io_apic_write_remap_rte(
         }
     }
 
+    /* Not the initializer, for old gcc to cope. */
+    new_rte.raw = rte;
+
     rc = ioapic_rte_to_remap_entry(iommu, apic, pin, &old_rte, new_rte);
     if ( rc )
     {

