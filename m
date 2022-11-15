Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A23AD629A24
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 14:28:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443946.698691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouvyU-00086T-8a; Tue, 15 Nov 2022 13:27:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443946.698691; Tue, 15 Nov 2022 13:27:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouvyU-00083f-3m; Tue, 15 Nov 2022 13:27:38 +0000
Received: by outflank-mailman (input) for mailman id 443946;
 Tue, 15 Nov 2022 13:27:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wxYI=3P=citrix.com=prvs=31178c1ec=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ouvyT-00083Z-4K
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 13:27:37 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43515c48-64e9-11ed-8fd2-01056ac49cbb;
 Tue, 15 Nov 2022 14:27:35 +0100 (CET)
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Nov 2022 08:27:27 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB6713.namprd03.prod.outlook.com (2603:10b6:a03:404::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 13:27:24 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa%5]) with mapi id 15.20.5813.016; Tue, 15 Nov 2022
 13:27:24 +0000
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
X-Inumbo-ID: 43515c48-64e9-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668518855;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=o1c92K8E2/WuwVnA/VrVYjtQGgrD0onohOcw6L2hy44=;
  b=Jnv1Qt9YI022qS8RfIhrsLlcYpiT2JngVUY/spWdpA4b0eVPxk5rDRbL
   0vAUJPc6nYyAiMHfcVGCy8tiCH7CvdPvDF1xGy5wz3iqj+ta/QrEZJ1ZU
   WhJbS0buDOyiZf6mBUKyeEXqY+URmTr7uQYgQMrTTtsFi77idQJpOORKu
   Q=;
X-IronPort-RemoteIP: 104.47.55.177
X-IronPort-MID: 87387751
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ezhNUKLpqJdGSVWqFE+RCpQlxSXFcZb7ZxGr2PjKsXjdYENS1zJUy
 DZNXTyBPKyLamDxLdFwPtvkpx4BsMLSm4A3QVFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5wVjPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5oD3AN7
 Nw9BwsSZwqD1tuV5uLkVuNj05FLwMnDZOvzu1lG5BSAV7MMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGMk2Sd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iLz3b+Qwn6iMG4UPL2UseVajAyf/EkeEDcVfF3ks/KDoHfrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAkQzhbeZoZvck5bTUw0
 xmCmNaBLT5lvaCRSHmd3qyJtj70Mi8QRUcAeCsFQA0t89Tl5oYpgXrnVc1/GaS4itn0HzDYw
 D2QqiU6wbIJgqYjyKGT7V3BxTW2qfD0ohUd4wzWWiev6FN/bYv8PYiwswGEsrBHMZqTSUSHs
 D4cgc+C4esSDJaL0iuQXOEKG7Lv7PGAWNHBvWNS81Aa32zF0xaekUp4u1mS+G8B3h44RALU
IronPort-HdrOrdr: A9a23:T45pAK3MkF4i9fEyEAYzXQqjBcZxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjjfZq6z+8M3WBxB8baYOCCggeVxe5ZnO/fKlHbexEWldQtqJ
 uIDZIOb+EYZGIS5aia3ODRKadb/DDtytHMuQ6x9QYPcek8AJsQlDuRRzzrZnFedU1jP94UBZ
 Cc7s1Iq36JfmkWVN2yAj0oTvXOvNrCkbPheFojCwQ84AeDoDu04PqieiLolis2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv+/olbg9zoz/pEHYiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2e
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvHxUWDiXXujMTlTHZiYvAx875xQ1/80Q4Nrdt82K
 VE0yawsIdWNwrJmGDY68LTXx9nu0KoqT4JkPIVjVZYTYwCAYUh2rA3zQdwKtMtDSj64IcoHK
 1HC9zd3u9fdRegY3XQrgBUsa+Rd0V2Oi3DblkJu8ST3TQTtmt+1VEkyMsWmWpF3I4hSrFfjt
 60fphApfVrdIs7fKh9DOAOTY+cEWrWWy/BN2qUPBDOCLwHAXTQsJT6iY9Fqd1CQKZ4gqfapa
 6xEW+x7QUJCgLT4Iy1rdd2Gyn2MSqAtW+H8LAc23B70oeMNIYDfxfzCmzGqPHQ3cn3MverJ8
 pbB6gmfMMLVVGef7qh/zeOKaW6ekNuJfE9i5IcZ2+khP7tB8nDitH7GcyjVYYFVwxUEV/CPg
 ==
X-IronPort-AV: E=Sophos;i="5.96,166,1665460800"; 
   d="scan'208";a="87387751"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ep2cp77bAW4Up775s3vWKUVIOIeW9RR9K102Hz45udGN7dB5Bg/1tbIwyoChpr0P201GE+HH22E5VOZanUd9zFZ3WRGETWNee1DQ1HNCOUWl6Le3aF+GMehw8ljKt3b+NZJ0VBSGPq2xirR6SqkFniF4dU54Tc65wxehm33Kzs0QQN6gBmk8Xlz3wBSS/qldBWPMXg+76evWBi9tdMGwrkZGqFEGo53TCoIQFkbIuJPtETUQabcCOgnkt+SjKpnLb5bIHhSxUM+WuMNkBZGjKTIM89duJiWhV10fMP5h9jh7YPJBPv2If2yk28cBlY0BH264MST3bNA4R2v+0dlhlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkNy96xUO2/O5XKJY1CODRf7oTA7fVpbICttqPA7ERo=;
 b=in1rGBqZpTmSoGp5moZN+7vr7Va2+F/X84J7+2ZMC7ryTaq9/82+OjWQRGDGB4N4Sdm3M3h9jCIPwH9AoMYFbAJiag00AGshDlbGocgpu6b9Va03G03GiJ7jRJR31p6VRZAS8ZUmlpnrSiFnTwXRs29OfV9J4M2i8012VEbcluFXOI86a3xrFPABA19o5QvIcBqRgcl94PUPyc/sjWzwUL+zMbkPNwUGNOWhRgBqirTrq/6u7KrmJkQ8fQzMG6sKHhdYUG7zR/e8VJxd7bVxl/cEn9MdWp26yBjL9IDQhypKhPOKdOGef/R7tIA6qOaLQ6AbCiBOMiZrBzKW4DZLgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkNy96xUO2/O5XKJY1CODRf7oTA7fVpbICttqPA7ERo=;
 b=vHZUb4d5m8xkT/LgoXZYu7FGCvqzIqGE/35ZUVG0VVWbuCeLlaoDuvNtLyEUXU+BJcDgVT5TPY2jmMHfZMeBhXThzksouh7u+VznqvVlgCsCnUGlJUsinOZX6cF0sPNLknP1uKe+r8gCZudYKEhuDwUn3QJh2uZWcEdaEMM4Jr8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-4.17 v4 0/2] amd/virt_ssbd: refactoring and fixes
Date: Tue, 15 Nov 2022 14:26:54 +0100
Message-Id: <20221115132657.97864-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0059.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::15) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB6713:EE_
X-MS-Office365-Filtering-Correlation-Id: 83e2fd7c-6d33-48cf-9c88-08dac70d21d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yrSqsBexMSGl2xPnJTg9L4qlW7Yu67G9cXMRJr7zeFcePQA1rylfM9tLT4RYh5nDJWs50/KOyx1Jt/gAA4Os7VaEUexOdgh/e81CdXgOpGLudaF02kNK118v+GBG0FOKJEwM9PiLgtENIpmHLOVQkrTKTJIjzi6t0Qc2uTNT427pZrbvtMnv+7sY16LXAFzsfg+v/Y9TEq0l/n+W/gPN/KZSwK+my5BSbhCk2IsFrsOZyDR9FHBmnDFLoMfTyulu0qRA4p2gBNnvUU/j4qsf0M1dKcHIs1kAE4ytE7z51OkWyc+LZdM5xB94UZJ3v1ik/1yi9VGMrjtUWOIo5UDFjwRtCIxL8THCDb0P5TXAGGdxOyNRT1fToXzwDUonPM2j+PGuqtAApjouUZVM2/pA9CosHIiWKy640GUHoDgzXn5PpxWN2t9ilI8F1XgLQTwJt0ubP3d2CkO/NBg1fm/8v/xPUeZqlO9Xt2d7rketRscbccWYhB4JaJIPUTDdQgYgQPwHPhNl3HqY4Ud8eEzG2ybIDXD0CgT6my6DgNylwWynqa3WIYJtH2dZYvLlL6HVGplV7bUmSi5z50/NF7xncv0hQHU1dWTTwgiUhfN977ufR4VscF4V2cwbKfQQxSdfqRBDmGGFd6xwRpL/OFlZEmuBEAZQTKmC6+AXa5fZvh/dBmU/oo+ZSuu8NV6Jkx3MHD5sb4W+K2vaC/2OhEefaw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199015)(82960400001)(2906002)(66946007)(66556008)(66476007)(38100700002)(5660300002)(36756003)(83380400001)(8936002)(41300700001)(8676002)(4326008)(66899015)(6666004)(478600001)(6506007)(6512007)(54906003)(26005)(2616005)(1076003)(6916009)(186003)(316002)(86362001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlA0Y0QwZTg2TUs0aXlBelBnVzNHeWVwU1FPcnpVbE9HaVVkTjNSaE40dlZG?=
 =?utf-8?B?aWdiQTRaNmlXRkl4WGJVL3libVF6NGxYVjl2V3cvc080MVMvYVVvRFJOUCtP?=
 =?utf-8?B?ZnNrTnBBc00rTmQzTE5KUVJNUjdlRlE4SGxEOHp4cGRkWW11NzVzQ1N1cytN?=
 =?utf-8?B?cWFiSjA4cllYRk1CVXVlbGNsQTM2WG1EWHJ1bkxyVlpNRmRoMGFhU0tpOTBw?=
 =?utf-8?B?eUdFMHNHYVR6dUF2cncyOHpqQ0RaYzFZeVR4cWUyNTZ6RFBoQkRNSU5vMUY0?=
 =?utf-8?B?emdqTWNCdm0yMk1RV0VKMEtDR1ErSTlHdmFNWGhPQ2lUb2J5SGZLVThJVmZI?=
 =?utf-8?B?aDFnQjdIajlyMHppME9NWGhZNWFpcngxQS9BRXQ1aE5xNzhaN1JSb1hxZVp5?=
 =?utf-8?B?VElaeExFVzhSOXo0QTJMQ3NpK2dCM0xJcytramhuY3J5blUzSWZ3WFd2TzMw?=
 =?utf-8?B?WEltOUsrNnpiVEdDN2RXNkVyL25kREdjOEhvYW1ZR1RpUUF5QStvUGdYQ0JJ?=
 =?utf-8?B?TlhzRElOUWJ5K0hpUUYxZEVwQnhCMjlXQ09NZDhkZGdvaGgwNWtra2NCeFE2?=
 =?utf-8?B?d053cUJHdysxZk0yNzExSVA2cVRKdzNWd05kTVVBT0g2OTJhZVVIZjVaNmYv?=
 =?utf-8?B?YlpyS2krNzNWM1h5bXU1U0tZUDFsYUhGc3d4aVZUVHNnV1hYOGJ5MWFqVnp6?=
 =?utf-8?B?R1gvNlZYK2psbENzK1I0VUh2em5OWksyYndmck9lL1Y1Z3ZPM0dHdTdrSnhJ?=
 =?utf-8?B?MTUxcUNlS1M0ZUhpWmhGdm9LMEh1YmlyUUdPdnF2TUZUV0xmbzB1Y3pWVUxy?=
 =?utf-8?B?UEdUbDVCWGx6b0g4ejFmVjNEeEFweE93dS9BWC8vT0lSZERaZzJrdkpWdnpy?=
 =?utf-8?B?dUJQUkNkT0xQU3M3VFBKZVRXdWJlRUFJZ2l1eHJvUkFBaDk4UisreU1FR1Ju?=
 =?utf-8?B?UVNYbzVLeFhjRmVnTFNXSkc5SWY2alF0clJaRzlrU0xTSUJPMnExL1JNcHhl?=
 =?utf-8?B?T2ZieW5qQXBOMmZmMldKa1J1TXFTTTN6L0dmZzU2cVFBS2YvTTlRWFBtSjJR?=
 =?utf-8?B?b0J6ZzNOVUtwQW4vb2ZnRlZyVW9yWWlzak1ENXVFK3IzMkttVCtodlQ0SEFy?=
 =?utf-8?B?VzZJTDgvL3NvVldtcmtMR2U2Q0lhTlF6K3pnS2VNcnNVTCtVbkFibW1neFJ3?=
 =?utf-8?B?ajlvNGhzcEFIT3JQcDJ6c05pODB3MGFXbVpHbXpDTk94RjF2aGRuRk1oblo2?=
 =?utf-8?B?OWh5WFZjRGtKMHFsUnEyRFJId1M3bzB3ak5CZm1nSzhtbXZqcm1ybWdvS3I2?=
 =?utf-8?B?UWFNak5MYXRFbW54MjdOQ29SdW83ZjVkQU9ENlFnQkFKVHdTVFB4dmt2aEdO?=
 =?utf-8?B?N2o5MUtrcHFjZU56L0ZNcmFoZTdGNy9ON2xoL3JHSi92azhWc0gwQVNUVWZl?=
 =?utf-8?B?bnFla1VLME9ITENIREVSaCsvdHBxNit0aDJHRkZkQkJOU2lXaTlxSGo5RGJh?=
 =?utf-8?B?QVk2ajRDbVBDeXFBY3JOMUt1TytNSTNQRzBsbzB6bVZaKzBOcnlLOFJnV2d5?=
 =?utf-8?B?Q2FDNFNvY2hhL3FKV05pZEtYc0FSVFlaSmdPWlNVVXhabm9sT21BL0c0WmhK?=
 =?utf-8?B?bWlJYldhMkNTUDRSN0F2c1R5VzZoY3oyRGhjOFNvV2YvNUd1N283bUx5eXI4?=
 =?utf-8?B?Ukd0YWJTWEFrdmV5VS9Vd0JMUFRQaEZBT01xSWJjRFE4dTQ1S01SeWl6R0Zy?=
 =?utf-8?B?TVcwSW9mL3lRUWVGSUVSV0xSTkkzVUM2VVVmUGZaRXlIaU5FRWdrTkEzTFVM?=
 =?utf-8?B?ZWY5WS95MStZNmZqamM5MU9QUCtZK3dJM0VJbnNsVTYveWsvZU16bW5Ea0NQ?=
 =?utf-8?B?R2IrSHVoRFJoQ3AveHpTS2IzTi8yK2JVVnk3aTdjVmw0cmYxd3hiWEZUdzA0?=
 =?utf-8?B?SHA5VjZzOXVtTzAvQTFOTmVQQWVKcEFQSlJXa0I1ZVJ5czBXZ28zVTE2blZh?=
 =?utf-8?B?cnA0V2JzcXZxSHFjeENCV0xXdE5tWFJFUi8vTnZ3b3FKSFBTaHV3NUNFbXNl?=
 =?utf-8?B?dmJ6U1RXSXRIeTdwVWl0MGVDZEN0d2ZqTDNsQThhUCtQUmJ3ZHFtMW11TVp3?=
 =?utf-8?Q?t+k2MCwmpqME20fixkamNh7le?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UqIiG3TzjUHUGPRHedCq0d8uMNeW881d3UJVd/QpIh/QawnR2lZnohKnVEWF10mWxK71jNpGxnKfFIPkkWOf4hpHXDBw/2QbNOZQb692rUYq7gHWMxLlbEpreueDSEff07EBfL/Subt5YMhlTRBgWRJ9xWRqbhFuGGz/PjI1QMPEY8wpsGDqC5GfNoR/RugrDwHJnfn/dJ1Sa3l2WAU5nptIclbcaYEl5Zg89IAqp+cW2H879Kp4hFDAlvXbWx29AgtN2qvLMmiUWCMdRvM3qjOH0js47oBadsYZVZh4TtgDCjIz0wVNtWcTeIo+iF4F8GtHaBQTlT8TyUEcoLHHQN4goVbW5dzFg3UWsUqwCwqHgC47slOoFNcekGj9mYqpHfvDx2JwPji5cj4JAAecjNJ7bam+bwr4HdqgyTVMXojXjJuApt1NhIH0DA0ZWPJk8LCO427fjdPBuRHoZg7VKGIKF1VoiAwGM4ZAc0+Kle9CxInu56iqneuBTDcVZLrwfb0HYaayCJ5mvwXGs19dIQDkE4mai6IcTSJH4SQPNow5YU5HyfXMKZv2xRpEGZ+RpFrsl73KTVc/LcXaJ9qL83gpuTY1notMo++Oo/RlcwYEzKhoJNIj6285lzt1jFE+hzmTOfuWOZcUdwYO2IQ7LasZlz2HitPfIoH1SdYrTMH6FAuAmStGoj2UNVmrDXIPxeZeiQFBWSVJIr/5AMUkEmepmrhkktusC0zTPFzX7mNbD+CyvbmYMyG7lKrQnBysGFKVQIkJN+TkEVZaMFN1LDaeb8CMGQXNYD0NTSLLpTBoVODqD78CxCRvNO0sZJeou5hWLDduqR+ezLGEohQOnc/irvYz2Om5B2sNJGnwshLRbAB2ZWsIBswbdV93QO/uZNIFxHUtWPaGuKdqhBZPFg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e2fd7c-6d33-48cf-9c88-08dac70d21d5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 13:27:24.5151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xw6I5U9c9chn6y56hNhCOl6NOkSrYsn1w05g7fdt7HlC2FBk95RRm9erO1wB/N9lrpqDlE+tGLc2hhAq9TZp4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6713

Hello,

Just two patches remaining, and the last one is already Acked.

First patch deals with moving the switching of SSBD from guest
vm{entry,exit} to vCPU context switch, and lets Xen run with the guest
SSBD selection under some circumstances by default.

Andrew has expressed reservations to me privately with patch 2/2, but
I'm still sending it so that comments can be made publicly (or the patch
applied).

Thanks, Roger.

Roger Pau Monne (2):
  amd/virt_ssbd: set SSBD at vCPU context switch
  amd: remove VIRT_SC_MSR_HVM synthetic feature

 docs/misc/xen-command-line.pandoc      | 10 +++--
 xen/arch/x86/cpu/amd.c                 | 56 ++++++++++++++------------
 xen/arch/x86/cpuid.c                   |  9 +++--
 xen/arch/x86/hvm/svm/entry.S           |  6 ---
 xen/arch/x86/hvm/svm/svm.c             | 45 ++++++++-------------
 xen/arch/x86/include/asm/amd.h         |  1 +
 xen/arch/x86/include/asm/cpufeatures.h |  2 +-
 xen/arch/x86/include/asm/msr.h         |  3 +-
 xen/arch/x86/msr.c                     |  9 +++++
 xen/arch/x86/spec_ctrl.c               |  8 ++--
 10 files changed, 75 insertions(+), 74 deletions(-)

-- 
2.37.3


