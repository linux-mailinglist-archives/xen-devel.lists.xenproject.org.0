Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 391004294A5
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 18:34:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206348.361898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZyF3-0007fM-5Z; Mon, 11 Oct 2021 16:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206348.361898; Mon, 11 Oct 2021 16:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZyF3-0007cx-1s; Mon, 11 Oct 2021 16:33:33 +0000
Received: by outflank-mailman (input) for mailman id 206348;
 Mon, 11 Oct 2021 16:33:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkLr=O7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mZyF1-0007cr-3D
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 16:33:31 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6ccd630-2ab0-11ec-80ec-12813bfff9fa;
 Mon, 11 Oct 2021 16:33:29 +0000 (UTC)
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
X-Inumbo-ID: f6ccd630-2ab0-11ec-80ec-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633970009;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=67t8BCuaqEIn0Y0PWn51JD53az/ZlCtuZwJ4rW9OTMM=;
  b=EQkXnnkC20CC3Q36pV+6oqGHVcg+7gzpux8OpmLKFHPsgSpdKuJVY0EZ
   MYJFvdMH1gUXcNUKdbGWpvpQjH3QmhLBEdSK7RSc7LAl0HlF0CSnhH60D
   V8n4wXoS7cK8bSCE3ugk5re+0M+uMTA2CscOiM/cjoUxJlHpdrJQ8itX2
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5nbEISG4Wf0o/ZsQkbUpeb/1wQ5pjqoN1BHsvMVJ8GKpr0CxkK3dYV229kMvTEIGR9tuSlIVqA
 zSlX0q3kSO58ENphfXYIKbE+qNc49vBbo4E2ZbrSBr06dCcxg4tVxKiQH0TX2sf5HDZMz1gGO9
 ZcOgjLcxKlQOHos6Nbr0ugVtuDAGZMN7czSAiFe3qEabn23GZ5l23CbDRoXkI49TPOavRLs+B4
 08yGTF88JA0at9WrJ0GWruPzxfRvj/Q0oGs4BFF4ubV/CWPIoJbBCmlm8Lq213jvK/35PRSdM6
 wpa+bZhP6NlK7aIjXWjBmdRj
X-SBRS: 5.1
X-MesageID: 54932585
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3wtHI6IE3yvIMQ/vFE+RpZMlxSXFcZb7ZxGr2PjKsXjdYENSg2AGn
 TMZWzqBbqyNY2D0L49zPd/kphkPsZLWnd82S1dlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZ0ideSc+EH140Eo6wrZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2ntM9Lj
 /Z/p6fochsYOoLWocFedUdHRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2XuY4Dhmpg26iiG97EZ
 sgELjkxSCjZZixwAXENEJQ/s/yn0yyXnzpw9wvO+PtfD3Lo5BN1+KjgNpzSYNPibcRKnG6Iq
 2Te5WP7DxoGctuFxlKt6Wmwj+XCmSf6XoM6F7Ci8PNuxlqJyQQ7ChIMUkCgieKkkUP4UNVaQ
 2Q9/CY0oO4K7l66UdDnVjWxunvCtRkZM/J3F+A58wiLxrDjygCVHHUfTjVBZdols+c7XTUvk
 FSOmrvBLzF1rKecT37b076OtC6zIgAcN2pEbigBJSMV7t+mrIwtgxbnStd4DLXzntDzASv3w
 T2BsG45nbp7pfQC17i/u2vGhT2sjpHTS0g+4QC/Y46+xlonPsj/PdXusAWFq6YbRGqEcrWfl
 FYvhPLZz9IcNsm2iB2Jb/80OfKPuenQZVUwnmVTN5Um8j2s/VuqcoZR/CxyKS9VDyoURdP6S
 BSM4V0Jtfe/KFPvNPUtO9vgVKzG2IC5TYy9Ps04eOaidXSYmOWvxyppeVKLl17klEwhgMnT0
 r/KLJ7yUx725UlhpQdaptvxM5d3lkjSJkuJHPgXKihLN5LEORZ5rp9fYTOzghgRtv/sneks2
 4832zG24xteSvbiRSLc7JQeK1sHRVBiW8ut+50PKbfaflQ9cI3ENxM36eh7E2CCt/4E/tokA
 1nnAhMIoLYBrSyvxfq2hoBLN+q0AMcXQYMTNi0wJ1e4s0XPkq70hJrzg6AfJOF9nMQ6lKYcZ
 6BcJ62oX6QeIhyaqm91RcSs8+RfmOGD2Fvm09yNO2NkIfaNhmXhp7fZQ+cY3HBWVHTo7pFi/
 +TIO8GyacNrejmOxf3+MZqH51iwoWIciKR1WU7JKcNUY0Li7M5hLCmZsxP9C5hkxczrymTI2
 gCILw0foOWR8YY5/MOQ3fKPrpuzEvs4FU1fRjGJ4bGzPCjc32yi3Y4fD7rYIWGDDDv5qPe4e
 OFY7/DgK/lbzlxEhJVxTuRwxqUk6tqx+7IDllZ4HG/GZkiAA697JiXUxtFGs6BAn+cLuQa/V
 k+V1MNdPLGFZJHsHFILfVJ3ZeWfz/AE3DLV6K1tckn94SZ2+puBUFlTYEbQ2HAMcuMtPdp8k
 +k7ucMQ5wiusTYQM46L3nJO6mCBDn0cSKF75JsUN5Dm11gwwVZYbJ2CViKvuMOTa89BO1UBK
 yOPgPaQnKxVw0fPfiZhFXXJ2uYB150CtAoTkQ0HLlWN3NHEmuU2zFta9jFuFlZZyRBO0uRSP
 Gl3NhIqefXSrmkw3MUTDXqxHwxhBQGC/h2jwlQEo2TVUk20WzGfN2Y6I+uMoBgU/m80kuK3J
 11EJLIJiQrXQfw=
IronPort-HdrOrdr: A9a23:yoo/7q62J/fesULCpQPXwVSBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc6AxwZJkh8erwXpVoZUmsiKKdhrNhQYtKPTOWwldASbsC0WKM+UyEJ8STzJ846U
 4kSdkANDSSNykLsS+Z2njBLz9I+rDum8rE9ISurQYfcegpUdAa0+4QMHfrLqQcfng+OXNWLu
 v62iIRzADQB0j/I/7LS0UtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13DDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa3O
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0ITEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4Fy1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfuspcq+SWnqLUwxg1MfheBFBh8Ib1O7qwk5y4KoOgFt7TNEJxBy/r1Zop8CnKhNAqWsqd
 60dJiAr4s+O/P+W5gNctvpcfHHeFAlfii8RF56AW6XX53vaEi94aIe3t0OlZaXkdozvcIPpK
 g=
X-IronPort-AV: E=Sophos;i="5.85,364,1624334400"; 
   d="scan'208";a="54932585"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hC/tnu4PrTlhorH59ikoEsQCCKMTy1OBaCHGo8FC7FdsW41p6ekkk/yTOQj08FL2Q9q/6XvLBpC6TOjAm4+xsU3svMKZ8gXDL+cxRw9MHMnMC+kUibT6KJYk1VEkNMMWyd/XdA31UwCFMY5qXKPeY+U3P/RT3/kUsTQ9Lpg/fz0RNopD9bZ+GoIO0mv3y8cqKFTE++/qTCQ30lK+/aG5fWkcPvy66N/Ica/beac2sZxEpjzRafh1ukBCQgJrNwWzpvXzEQcJRkSFcyYxmJ57K3m7wpeXGWbK89ol3VP+DT5mHpcSDM5HTvXyAcZLLNh5GnGUT9mYuf7BgaYEAqZ43g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JN2qooTMidmqi0poQK8uzNQTGb5Cuhe9Crr5BSVThh8=;
 b=eUWeZd1l8zz+ppp1AXUyTNRbFxH0F+GzH0zbhH+T5gWrkgh8ylY0CsE0w8qL8sn06NL2mERMBDt7/JsXo1qRXErJ3TIKMnwD5XAiz/MJ7sTleii6IWOwFp5A9xYR9VyIQ5NWdw9sbadUuIDO5v5hJ/Gmu1AH/da/UuBGyHiBcCJ7saJGpEpL0enQ2/SWe23mE+8AEhu/qLALEnKWSXjcgpRRyf3yt560YTtHSKPMqPSL5ylLrKEF2b2xNK8319ZbmQV22ftwXCCoTFGCn9O5ry6MZaG6YuEGDQk+3NG3UZlQiG9bvaMznJ/9pRYqw1RP8AZGcOroS6yogjzN/PNdpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JN2qooTMidmqi0poQK8uzNQTGb5Cuhe9Crr5BSVThh8=;
 b=cv4MBKsPoUaRafk5YISRCo/S62U4oEiRdKSm7EQkl2UNR6zV4f0UnEs4p9jb0EN0TBsp7rBhZzn+OyhkIPoMktYeP3oAXiCfsbFs9DcL/9FjSr5EHQgA/bYg3nOpCPhKcjREXak2JfJcBBMjhewu3z3dONdR6A9jD5ctGjqRixI=
Date: Mon, 11 Oct 2021 18:32:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Rahul Singh
	<Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andre Przywara <Andre.Przywara@arm.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Message-ID: <YWRnMfAi808TQ4Gt@MacBook-Air-de-Roger.local>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <d292392268df2c74c4103a82ef917072643407a8.1633540842.git.rahul.singh@arm.com>
 <YWQkblfNMYEs6jI9@MacBook-Air-de-Roger.local>
 <77CF7FA5-C566-469E-B4A8-0400789890BB@arm.com>
 <YWQ6Nk3Jk+BqgkwZ@MacBook-Air-de-Roger.local>
 <53AE6E2A-01D7-41EC-9B2C-C0D596EB8D4D@arm.com>
 <YWRCxXGQIyTOAepC@MacBook-Air-de-Roger.local>
 <FEF0B03A-5AC8-4F8D-B821-191AC2EF8295@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <FEF0B03A-5AC8-4F8D-B821-191AC2EF8295@arm.com>
X-ClientProxiedBy: LO4P123CA0382.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3b0e143-b1bb-45c9-ff11-08d98cd4c6e7
X-MS-TrafficTypeDiagnostic: DM5PR03MB3369:
X-Microsoft-Antispam-PRVS: <DM5PR03MB3369F0719AC1160A8715A3888FB59@DM5PR03MB3369.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kegMP6ZviFEEEMV+nf//1YijMPxPTByeeR0pslEoQRRInQ3U0+uj2Czpxfs3VyGCBSZtIAgc4+qoVqA8Utpq5i80GyyZGodUzSSvRMHEBdivP6VXxICbInZtq+jJ81BgBBc4soOlrE3Pd3q/4YtEe2yOHR8OLJk1mfIaaxVto+dfZvTgkXMjWlL7k8TsTUsCZYE3leoof+imUvT8vp9/TzUDiLKbbCrGL0wLkKFcMbMIbNmGq7Q1c3Yf1FdHuDee9dOB8dZPVlwBXKh7/jqL2Wn6M9Cmkpp74+Q0bekiaHezYYFwhyZEBOntne+7clK8kidpDtiYJVaYWtmAn54yB4irgVlFotVhtZj4r191Mn/UwRlLFmm1ZlBb6MJfbc2/SBXvsCnBIOkCUiuvs+koY7oNrbpQnME471ctdUrrt0xGUCaOl2Nqk9oHp1dWGy7R9adGfb0BezHMZMl7S2w/yAXxjPyCy4/UBAgBGCNkZDOdIyc8SPlizfgy6bWmDsN5b0vrV8qaUHyGBBqXameRfo3kKlLMYydAFPHjKPQaHIbuYZdcz5qSTUEf9oYK1H9J7O0MYMEH9qc3PpfA/UY+nPbKP3eOBMFQCzBCYTEv5LNrImZ+uF/q8FRJwiqa6rY0XdRcsTB0NqkZWf3gRpWPZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(84040400005)(26005)(53546011)(38100700002)(508600001)(2906002)(9686003)(6916009)(5660300002)(54906003)(8676002)(66476007)(66556008)(316002)(6666004)(186003)(6486002)(83380400001)(956004)(85182001)(6496006)(86362001)(66946007)(4326008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnNiQUExdGh6YUN6TThtZkgwZHU2UW9zYnJSK0VEWmZ2ZWFRMWVja0czREtt?=
 =?utf-8?B?VDRidlZvN3ZJSnNWTHdIa1RRK3V4SFlRYnZBT0UwNEZ3NXJJTlMxcUpKTXFp?=
 =?utf-8?B?VXg1T3Y1OVY0M3VWeUZIaUVWTHM1KzBQTm03SzJJbU04MXZ0bHhtbXQ1NVBS?=
 =?utf-8?B?NzNuZTloWjBXK2U2MXpNeVZZelZjOU5oU1FpRFR4enV2YXl5akFNWUNXNVRv?=
 =?utf-8?B?TzNFMURwdFNnVU5TQnE1L3NiUS9CSU5TYXdEMWtrcmxvaEZvTFBVZjBLV3Qv?=
 =?utf-8?B?Y0hzcnQrWHVhU2pjMk4rQzJtdlMwbERPRUpZZnV4QmVHR1lsSkhwTTdwbUhh?=
 =?utf-8?B?MzlWd0l2UFYxYWY1a1lrd0w2OFZjTjYrOUdTUEtLcmMvaktOZk90ZzQvN05Z?=
 =?utf-8?B?cDNtNXRQemRETVRZZGlZeFJPQ0lMd0M2NklhR2ppK3drektSZXEyTlNwNUx3?=
 =?utf-8?B?cGRTMmU3aFlnZVhiRU91c0plbkQ1NktaY0QvVGY5ZkVFSHZySnBjWGVzYllC?=
 =?utf-8?B?ZVNDazFORHdoM2JqazJ4UjBhQlFFZkNzTXZkc0RQYVIwNGJ6NDFxeW5uR0hj?=
 =?utf-8?B?TGRkSy94NVZSZnZYT0hlckRCaWE2Qy90cHlPVFRpUjh4b2tkMTNCUmQrOG4r?=
 =?utf-8?B?Q2liQllOenRVbks5Rkw5ZmlNM0JLQ3JWblluOGQxcmNWTXhncHZCMDB6ZUp6?=
 =?utf-8?B?c3cyLzVQQi94ZllnTkxnK2lVNlorRlZlVklIVERWM1YraklUaFQvdVh0b2ZG?=
 =?utf-8?B?MG1PTlphUlFlS25zcTl6bWlmeFltd1FkNDNrUmRacS9COEtTeDB3dzVYNTVo?=
 =?utf-8?B?WEduWHJIN0pPNllUa2E5RENSNEp2ZkJTK2dNaDB1aGIxQWVWZzFqNnl6K1h6?=
 =?utf-8?B?Smh0K3g1Qmw2Sm92SXQrRzg0amp5UVBEcURPdzZyRHhpSlBtTXpkL291SElG?=
 =?utf-8?B?elE0elVvUWt1VjJJNUdTaTFVd0hOYXpLOGlQYlZUY1YxTGo1Z2JMV0NjY1ZF?=
 =?utf-8?B?Z3g0cERSSkhZN3MzQjVuQW5ma1dLeHdkODJudXdEck5MWjJKRUtNMElYQ0hv?=
 =?utf-8?B?R29lbVNELys2SmZHRUIvNHo0NW9rOUxKbG1VL1BoTGxsMFZWQTBxVEZSMjFp?=
 =?utf-8?B?MmJ0bzVsYURkZ09lb3IzaUNBME5naytuSktkbTF1elRadUVJZjQreXd4NzRT?=
 =?utf-8?B?azFKWkloQmxrckhiN2x5dFYrM1BBRzA2TEM5QU9iUzByazlIS2RJeW1vRlpR?=
 =?utf-8?B?eThOWTY3bVc2azhTOEpxOGtjQ2FEL2pOMzVYUGg1YVJORmkwMTJFamRXaEY1?=
 =?utf-8?B?SFB6Tk4zQmJtVXNWTUdLR0QrNHdMK09zWEpZZFNFOS9uQU5GVWVSYnVreU1o?=
 =?utf-8?B?ZzM1NDlkZ2Vnamk0TUFtQmUySzlhdjY5VTBLWC9ZVy9uWkZpT1ErZjN2YlBr?=
 =?utf-8?B?eTZHVEdPeWhudWpIb21TTnY2d0s3UVNqYmJ2UGt1dWwvcGo4UVFXNThYU1dY?=
 =?utf-8?B?MDVDamM5c3FjZ1M5dHM3S2VQaTVxYUt0eEhEcW40TjE4UjY5VTNMSHN3MWZN?=
 =?utf-8?B?SldsSStBODVPbXVZZERuRmM4a1BXck83MnV0TlBPMkNFcVJ5UlQrdHFaMGIx?=
 =?utf-8?B?U0Rqb25WM3hZcUpaY1B3MkpOV3gxd0ZBRXhtRExHMUVXaXFiRkpueE1pUmR5?=
 =?utf-8?B?MmRDOGZRWnA1QmpGaCsyWFFwelNCdG5hVEJNTzJYQ2dUSitpYUxjWDBTbzFY?=
 =?utf-8?Q?iVeFc1oDxKw97q0AiMwP/GhmBNE0kZfT7vqta+v?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b0e143-b1bb-45c9-ff11-08d98cd4c6e7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 16:32:54.9068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+Xjm/e69YVvJtCHNf0zyqtPAGrg6U9irVYg/gW63OeGlnRmPFD/DioDESyhldjbAZRdMk6iKWYHCl9hvqmtqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3369
X-OriginatorOrg: citrix.com

On Mon, Oct 11, 2021 at 02:16:19PM +0000, Bertrand Marquis wrote:
> Hi Roger,
> 
> > On 11 Oct 2021, at 14:57, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > 
> > On Mon, Oct 11, 2021 at 01:40:30PM +0000, Bertrand Marquis wrote:
> >> Hi Roger,
> >> 
> >> + Oleksandr to have a better PCI expert then me.
> >> 
> >>> On 11 Oct 2021, at 14:20, Roger Pau Monné <roger.pau@citrix.com> wrote:
> >>> 
> >>> On Mon, Oct 11, 2021 at 12:11:04PM +0000, Bertrand Marquis wrote:
> >>>> Hi Roger,
> >>>> 
> >>>>> On 11 Oct 2021, at 12:47, Roger Pau Monné <roger.pau@citrix.com> wrote:
> >>>>> 
> >>>>> On Wed, Oct 06, 2021 at 06:40:27PM +0100, Rahul Singh wrote:
> >>>>>> ARM architecture does not implement I/O ports. Ignore this call on ARM
> >>>>>> to avoid the overhead of making a hypercall just for Xen to return
> >>>>>> -ENOSYS.
> >>>>> 
> >>>>> What is the cal trace of this function actually on Arm?
> >>>>> 
> >>>>> AFAICT libxl will only call xc_domain_ioport_permission if there are
> >>>>> IO ports explicitly defined in the guest configuration, or if any of
> >>>>> the BARs of the PCI device is in the IO space, which is not possible
> >>>>> on Arm.
> >>>> 
> >>>> PCI devices BARs can be in the IO space as the PCI devices are not
> >>>> Arm specific. There is not ioports on arm so to be used those can be
> >>>> in some cases remapped and accessed as MMIOs or are not possible
> >>>> to use at all.
> >>>> 
> >>>> But the IO space does appear when BARs are listed even on Arm.
> >>> 
> >>> Urg, I wonder whether those devices with IO BARs will work correctly
> >>> under Arm then.
> >>> 
> >>> How do you know whether the BAR has been remapped from IO space into
> >>> MMIO?
> >> 
> >> We cannot, I think the platform will define if this is the case and where.
> >> @oleksandr: I remember that this was discussed during some of our
> >> meetings but I have no idea of the details here, can you help ?
> >> 
> >>> 
> >>> IMO instead of faking a successful return value from
> >>> xc_domain_ioport_permission we should avoid the call completely in the
> >>> first place, specially if we need to instead issue a call to
> >>> xc_domain_iomem_permission.
> >> 
> >> At the end we will never have to issue this because this will never be a matter
> >> of “iomem” permission as there would not be any way to cut on something under
> >> the page. If this is to be supported one day, it will probably have to be fully emulated
> >> to keep the isolation.
> > 
> > So you have a set of memory pages that map accesses from
> > MMIO into IO space but it's not possible to isolate specific IO port
> > regions as they are all contiguous in the same page(s).
> 
> Exact.
> 
> > 
> >> Right now on arm you can just make the more simple assumption that ioports are
> >> just not supported.
> > 
> > Would it make sense in the future to provide a memory region to guests
> > in order to use for IO port accesses, and call
> > xc_domain_ioport_permission to set which ports would be allowed?
> 
> Right now we do not plan to support this at all and we will have to
> figure this out if we do this one day.
> 
> > 
> > I think the commit message needs to at least be expanded in order to
> > contain the information provided here. It might also be helpful to
> > figure out whether we would have to handle IO port accesses in the
> > future on Arm, or if it's fine to just ignore them.
> 
> All our investigations and tests have been done without supporting it
> without any issues so this is not a critical feature (most devices can
> be operated without using the I/O ports).

IMO we should let the users know they attempted to use a device with
BARs in the IO space, and that those BARs won't be accessible which
could make the device not function as expected.

Do you think it would be reasonable to attempt the hypercall on Arm
also, and in case of error (on Arm) just print a warning message and
continue operations as normal?

Thanks, Roger.

