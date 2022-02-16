Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5733B4B85C7
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 11:31:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273927.469231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKHaZ-0006WN-2O; Wed, 16 Feb 2022 10:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273927.469231; Wed, 16 Feb 2022 10:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKHaY-0006Su-Ra; Wed, 16 Feb 2022 10:31:10 +0000
Received: by outflank-mailman (input) for mailman id 273927;
 Wed, 16 Feb 2022 10:31:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oYE0=S7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nKHaX-0006QF-Qp
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 10:31:09 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b42a3d6-8f13-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 11:31:06 +0100 (CET)
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
X-Inumbo-ID: 8b42a3d6-8f13-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645007466;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=zVlywzfrFYT4j81Q9eKIZ01umyrGNIbePcDAlJ1CQAQ=;
  b=BaHpv8bOn0iSO14nCmuxM7hGFaqbjwCescefJUWFPQYCVRJCYJOGIA4+
   8Kd3/OaD2BI2XlFfxOH6pGdn9aH6g2LemPHT7X9MVWhqCCO2dQlMuwLEw
   2lq8FWw91qp7YijQCu8qq3bb6ikGEbYsWA6I3vVtOKTh9ZYyVDYxHiasi
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: l/PpeIPovc6mK8WJ6pMCVSoyEj//rpDQ3TlaOQcYkHIVuCtOyGQDoQ+cAwvOR/zNXPMU5HdnP8
 fotCSggbygUc5GPMeVYxYCGyc4bvvzFKMaWGz93oplz6yN3YpoIkGLRWkAZkc96nRhSGJuE8wR
 eDK5e+2zP1tOkcTMQEAL2A7t2UuLmGQiMgjU7KN3XDXMZlPVXTQZkOfsAUJiCbhw7ih1cEFlpK
 /YgTzhqj/0YOQQiQtTl01wJAjkq8P+CCx44nFV2MOiufZ/VBIXEaa8rdGwvTUdLUAN6WoAZiAB
 h38ZMtlKSdgVxUoM2dmsEi0z
X-SBRS: 5.1
X-MesageID: 64225270
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:epsup6uf1Qub65YOrZr9gz2wrefnVL1ZMUV32f8akzHdYApBsoF/q
 tZmKWHXMv/ZYTf1L9x0YNnkoEpTuMXczoJqQABv/CxnRCIT+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2IbhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplsof3GBwpZKv2w/0CcSJ9NyR+E+p99+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JwUR6uEO
 JJxhTxHUTjAXzBONVItDb0bgN+nqijUc2ZmkQfAzUYwyzeKl1EguFT3C/LXcNGXQcRenm6Du
 3nLuW/+B3kyK9i32TeDtHW2iYfnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM/pTN
 EkLoAIvq6Yo/UCmR9W7WAe3yENopTZFBYAWSbdjrljQlOyEuG51G1ToUBZGc5t3r89sQwZxz
 0CrpPbNADxB94aaHCf1GqivkRu+Pi0cLGknbCACTBcY79SLnLzfni4jXf44Tvfr04Sd9SXYh
 mnT8XNg3+l7Ydsjiv3jlW0rlQ5AsXQgouQdwgzMFlyo4QpiDGJOT9z5sAOLhRqswWvwc7Vgg
 JTms5XGhAztJcvU/MBofAnrNOv0jxpiGGeB6WOD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNYCf7MPYtMtPgUp5CIU3c+TLNDK28gj1mOMYZSeN61Hs2OR74M57FzCDAbp3Ty
 b/EKJ3xXB72+IxszSasRvd17FPY7ntW+I8nfriil07P+ePHPBa9EO5ZWHPTPrFRxP7V+239r
 ocAX/ZmPj0CCYUSlAGMqtVNRb3LRFBmba3LRzt/LL7TeFE3Rzt4Vpc8A9oJIuRYokicrc+Rl
 lmVUU5E0lvvw3rBLASBcHd4b73zG514qBoG0eYEZD5EAlAvPtSi6rkxbZwyceV1/eBv16csH
 fIEZ9+BErJETTGeo2YRapz0rYpDchW3hF3RY3r5MWZnJ5MwFRbU/tLEfxf08HVcBCSAqsZj8
 aar0RnWQMRfSl06XtrWcv+m03i4oWMZxLBpR0LNL9QKIBfs/YFmJjbflPgyJ81QexzPyiHDj
 1SdAAsCpPmLqIgwqYGbiaeBpoavMu1/AksFQDWLsefobXHXpzPxz5VBXeCEeSHmeFn1oKjyN
 /9Iy/zcMeEcmAoYuYRLDLs2n7k14MHipuEGw108TmnLdVmiFphpPmKCgZtUrqRIy7JU5Vm2V
 0aI9oUIMLmFIpq4QlsYJQ5jZeWfz/AE3DLV6K1tckn94SZ2+puBUFlTYEbQ2HAMcuMtPdN32
 /olte4X9xe720gjPduxhyxJ83iBcy4bWKI9u5BGWILmh2LHEL2ZjUAw3sMu3KyyVg==
IronPort-HdrOrdr: A9a23:7yYfb6OaXjbvo8BcTjujsMiBIKoaSvp037BK7S1MoNJuEvBw9v
 re+MjzsCWftN9/Yh4dcLy7VpVoIkmskKKdg7NhXotKNTOO0AeVxelZhrcKqAeQeREWmNQ96U
 9hGZIOdeEZDzJB/LrHCN/TKade/DGFmprY+9s31x1WPGZXgzkL1XYDNu6ceHcGIjVuNN4CO7
 e3wNFInDakcWR/VLXAOpFUN9Kz3uEijfjdEGY7OyI=
X-IronPort-AV: E=Sophos;i="5.88,373,1635220800"; 
   d="scan'208";a="64225270"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/mkjCdRUppdNHAnl2tHU0LDQ+bt4tk+sCtUB2CNhfwe3xMMbgMjgurhKOf7savGtdxJcsj28tOPvx7Ym4AGck+fD45u8BFrkHcW9zUwakKaJzDebTj941rDSJ61xgidY6hYhgoWdHoBIiSVSPWKFOmrPUWIGlHgM+Xy0VXrdaAnSWOL9rtQM6aIucvs8MKv71AqPJksan3I/JX2sH6j2OnBiaYj9dkiaBhGcOk21bguUf2uK7O7ycibzTHcl5yUwMVGCrWaO2eLkvDKN0NibEJMt3tbaDVJjeucB3w6DMf+qRggpwYPdzag+fU9URLflvDxSdhGjO58XynNzUd0Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8Tgei5/cDOMx9szRnWDQ16i7axYk3kXvj6N3RsL58M=;
 b=AMGQdgwIqdxY9da3YIyRG4WtLFw/nQToUcQ+5heQeheQAFTqO86+6rHLbqyVz9fzQlA5A/nrXhg4A6fx2ul5Usbgk4cZrmiFYVEma/gToq2CBsrBP7M+JMhdyvNZsxwkexfE293CGJaooKk7CC7IG1RcDzrday2/R9ZgPZewNFjCN8Kh9PZhy3gj4fjFpLSOnQeP/3xQjaJvMNuRLmO+Lp2AnM14Q1xRpCVoKVD6hXrjs8ZldSeU3+kA/70ajnnqHHq4bQjt+TDJw3Bv9H8tz1F7v+YrJngtzHkWUlqYGFsFjj2m3nTiTGhT4/v8EMweXkiv1hI46lwQECuPvEDkPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8Tgei5/cDOMx9szRnWDQ16i7axYk3kXvj6N3RsL58M=;
 b=JfI+VDXna+Abmnlj+sNBDLrqMzek/AyqdBb8L5zcVXwNo0QZELrT0tiRNy5BudgLpC0SDYZCPZTpGRNwz5Dq6fA6ifK/IWSWPFsWWw3A5qnyCTvqCif1ws0RtdRJj591UlTuy6rrNc/t/iJBaDHRbs+VeTw3wXmecbMo1uIluhI=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <dwmw2@infradead.org>, Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 1/5] x86/cpuid: add CPUID flag for Extended Destination ID support
Date: Wed, 16 Feb 2022 11:30:22 +0100
Message-ID: <20220216103026.11533-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216103026.11533-1-roger.pau@citrix.com>
References: <20220216103026.11533-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0023.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::13) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b67c13fd-2d8d-496c-9c3c-08d9f1376aa3
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6256:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB6256862FDAAE7A4592F9E5478F359@SJ0PR03MB6256.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lF0Lw1gFJ5/NKLbaFuMXzRM+sZD+7lU8nZxIUpOiZfh1Q7nnAlGpdaRkZYRko0Lb7raOmEkNLARQP4efaKwEXMeJgsL5iAZxq4sjBo9zv53SzthwsOjg87COpSUrAoLV2rhukDqgGPyWIifsxypQSC9ceN3yfvu7zwtpHhuYZj3tuNSjXX1uP7AxTdbe2yc0QkaCI+UXMPVuqKCSHqaSsU1UJwdKSRR8MUzZZZLcVnvhdAvCFnMmbn5lOJAiswxNBAuYdoY2Q61Q6YlEzovhs5anpaSYN/uIu3LghGVCBciZQdBuhOObnJSPayFRxKP1kSYK6PRkI0NBmJ+qPHH89PlMuuKgieZlJ3t1F0aXE6hmfXkBGEirALGAy/A/vsVQBVjoiSjhRx+P2jUipZGSOPYGiy5ui9vIzHTTsI8VpNM6UQSGB+lX5+Yju8YVbS/LibZ1G8jvKyOdUu+TY9tPdyj403/Wt3og3oZcwNCM2PjtUhwJr+/pkI7EF2rlPcOsn+nlz8C+si0w7PJJT7oHUaartry6MJamcKXR6uMhrH7zIdt5499oSLchXPFJtTiyIdWtTYd4zp24x6S8nqN7+wMxI+mqMepljyve+Px04lazgEzPW8RPMTv+s4lRofC+wsulzrrZyfVc2stmFhBsBoq9A729f1E5PsbnEdKV+4FELwcogSjbxjB0U86ULOpei4wy3JmCNpIqmbpJV6F1olPBtouoxvkcPtDsqnVaWA8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(2616005)(66946007)(6506007)(6512007)(316002)(26005)(1076003)(66556008)(508600001)(86362001)(6486002)(6916009)(6666004)(54906003)(966005)(82960400001)(66476007)(83380400001)(4326008)(38100700002)(36756003)(5660300002)(2906002)(8936002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0pWYUIzZXBsSlNrSWhHRnc0T0pMbWRaaks5K1liSzhVa2hpaTlwUmcrRlhK?=
 =?utf-8?B?UEpUaXpmdlplR0k3U0ZjaDBuM2FNelIybkdCa3BwWVJOZjZMai9KbUVKY2RV?=
 =?utf-8?B?YmNGTENpZ1NKUUV2dGdUYnA2WVg4WmZib0k4bFByMHJoc0ljRVFLbFRvQWp6?=
 =?utf-8?B?STVEOFVVVEpJM1kxTU5kblJDemhqWE5aQmlOcHpKZzFmQWdzQmRRL0pkMTVv?=
 =?utf-8?B?M2xQc1gwOU5ScWpoemN4SmtCOUlpV2tXZ3BhVFVpUHNZeTdBS3RWS2JnZ0xn?=
 =?utf-8?B?eEYwcUFnNFBORXdRaXpEd2RXMFUzZHh1dlZFckkvWWJqNDVieWs3cE51SGQ1?=
 =?utf-8?B?dHZIOUNKRnZmSUZYTm1qUVR1c3hyTFBGUVlaYW5JSTJWK292MVVmc3R2VFRm?=
 =?utf-8?B?VmpyYUtlL051MUwwTGdMenBxUFZNWDA3MFFsdnJXY3F2QWRvSHFITHhMbjBz?=
 =?utf-8?B?c3dJSU55T0tOSStpbDBpS3VlMEkwUzd6dlJLU0gvVHZNNHJSR3RNbDJWa1dn?=
 =?utf-8?B?UFNlemhmWG91NkdnWGIveEViVnJ0SVo1V2hFMmJPZ2xPbFlQM2JObzdYbllM?=
 =?utf-8?B?YVVuakNRdkJNM0ZoTVU4V0M4bTN6L1Q0N21FN1Z4V281SGt5YXFDTm5oRTg0?=
 =?utf-8?B?c292MEVSVDJXTFpqY1ZvWkZYTlUrbk1nNU5LUzY1K09FQjFobWRZQWdHeW8x?=
 =?utf-8?B?ZUt2NkJXbXE0TkJOZjltOFJzS21CdTRNS3gyOFVRUzcxaEtyNXVFVHliRU5M?=
 =?utf-8?B?S3Y1dCtCbDcrQXUwc3NQS3BIbHpaakltSWNyRmRHbVFGRm1BSFNZU1BLYndk?=
 =?utf-8?B?NHpZS3BudzhrM281UUJZOHRnMWtsVkx6eGVIK2xtQ1RLRXNzZ0dncjhXVjhU?=
 =?utf-8?B?enJ0YXhkeE02M0tFeFVDTUVJa0xnN1czM0VwUUZ0dnBYZm81UDB5eDB4T28y?=
 =?utf-8?B?eTkyR3ZZeHJzbFpVSFRwWnMrL1NWNHNEQ0VVaG5BL3F4SVhCT0ZuVVlFT1c2?=
 =?utf-8?B?ZEJweVFhclRhNGpBOFVaS01HYUxsMURDR2RUZTdxQjRFVTdyTmhMbEY0eDh1?=
 =?utf-8?B?ZjFIbWZaNk9zeUhCTHU4U3VTUHNiaGZjL3hHSFM1SUtCNkZ6TEFFRDdtNDR3?=
 =?utf-8?B?QUYwZllyUnpjNkR5SmdxdlRrQU5LWnhtNnhXaWZiaTFzcENSOUlQQjIxdFdu?=
 =?utf-8?B?SE1TZzMyQnh1YS8wTTJhYUtPL3VORllmeVBDS1QzQmU5V0JPcC9KMWFUSk12?=
 =?utf-8?B?M1l0STZyaXd1VzdBVU5wTFRuUXhkSzl5ZDdHZ21ZcUVDTDdUNSttMUhJVzZx?=
 =?utf-8?B?SFhNSy8vRmJrRGhCcGpkQ1VNK3pSK0txNmVIRnMvWXh4YmdmNE9XOHJrZmll?=
 =?utf-8?B?dldWeWpjbEVVa1FVRElHV2d2anY4MWdPZkRIcHlqWkRCMW9LNG1hME8vZjRu?=
 =?utf-8?B?WDFhQUJzTlk1d2xYR3pIVktlcW8vTk9scHNBdXVxVkdIUFB6aUt5SWdGSUVq?=
 =?utf-8?B?NVkzNkpoV3BqeEZxK2JVWkZFY0tsNkdkSUNucERMeUEwSHVmTk4yKzMwZjVr?=
 =?utf-8?B?NmZjbXVFRTY1bmVHbEQ5cGdQaWRQYnAyWGNra1VUSkUzdmtWcXI0bDl2akk5?=
 =?utf-8?B?eU9veGZoeDhid21iVUpYVWtFMkhFRUVERE5RTkhXNk9vYm5uUC9ObWtLSk9C?=
 =?utf-8?B?QS80WXhBUmgxRW9GQk1jS0JJOTBSTi9vUnF3NEY0MnpXSThHWGJrWG1ldFFG?=
 =?utf-8?B?TndLa2NUNnZJcll3aTlwaFJsd0dNbHJreDhjc2lvRWVod29OTHVtWCtYVVp5?=
 =?utf-8?B?OXhNaXM0TEJ5TjRFVU50dStVUXJWYWJjNmZ1ek4vK1lhVll2NFhhN3R5ajVo?=
 =?utf-8?B?T0R3RWpMLytDdFN3akpoNkM4WFZhZDE2aDhRQnFjZnJVNXhoUzdMcUtzUndM?=
 =?utf-8?B?bkEzeTBWcDZFL1JCVGVaRTYxZXNsREorWWJOTXZIZW9nSU1Db29VRzhmNGRD?=
 =?utf-8?B?Vy9RWUNLc0hsS1RSaDJpOVZ5YmdrTC9kMXRtZGJ4Q3JtMlB5WDcyQkRDTm1y?=
 =?utf-8?B?ek90OEd0VlUwSHZFcDQ4eUdFV1doNitNbXdyMEcxR3puenIxaDRvTGx5YVFr?=
 =?utf-8?B?ZWpqKy92LzhkeDlTUk5LNVFwazZZYnQ4Wm53MEUrdDU3T2IzOGtZdFZHeDVH?=
 =?utf-8?Q?uUPJFC9b0yI1el+KfZhOofY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b67c13fd-2d8d-496c-9c3c-08d9f1376aa3
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 10:30:56.6269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bH2vgfAnvnQWt7K6aFpUsSlyLq2k2gOWiq4YOLFmoNIZ8bLts5zybpa/QV/eh15Sw/hNt8muWnSYtH1rnShSBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6256
X-OriginatorOrg: citrix.com

Introduce the CPUID flag to be used in order to signal the support for
using an extended destination ID in IO-APIC RTEs and MSI address
fields. Such format expands the maximum target APIC ID from 255 to
32768 without requiring the usage of interrupt remapping.

The design document describing the feature can be found at:

http://david.woodhou.se/15-bit-msi.pdf

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/include/public/arch-x86/cpuid.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/include/public/arch-x86/cpuid.h b/xen/include/public/arch-x86/cpuid.h
index ce46305bee..49bcc93b6b 100644
--- a/xen/include/public/arch-x86/cpuid.h
+++ b/xen/include/public/arch-x86/cpuid.h
@@ -102,6 +102,12 @@
 #define XEN_HVM_CPUID_IOMMU_MAPPINGS   (1u << 2)
 #define XEN_HVM_CPUID_VCPU_ID_PRESENT  (1u << 3) /* vcpu id is present in EBX */
 #define XEN_HVM_CPUID_DOMID_PRESENT    (1u << 4) /* domid is present in ECX */
+/*
+ * Bits 55:49 from the IO-APIC RTE and bits 11:5 from the MSI address can be
+ * used to store high bits for the Destination ID. This expands the Destination
+ * ID field from 8 to 15 bits, allowing to target APIC IDs up 32768.
+ */
+#define XEN_HVM_CPUID_EXT_DEST_ID      (1u << 5)
 
 /*
  * Leaf 6 (0x40000x05)
-- 
2.34.1


