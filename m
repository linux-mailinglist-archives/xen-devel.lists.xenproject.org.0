Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D34C60F8F1
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 15:24:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431048.683527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo2rB-00026p-Qf; Thu, 27 Oct 2022 13:23:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431048.683527; Thu, 27 Oct 2022 13:23:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo2rB-000253-NF; Thu, 27 Oct 2022 13:23:37 +0000
Received: by outflank-mailman (input) for mailman id 431048;
 Thu, 27 Oct 2022 13:23:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i/85=24=citrix.com=prvs=2922bd7c1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oo2rA-00024x-D8
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 13:23:36 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c13fe7a-55fa-11ed-91b5-6bf2151ebd3b;
 Thu, 27 Oct 2022 15:23:33 +0200 (CEST)
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Oct 2022 09:23:29 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MW4PR03MB6377.namprd03.prod.outlook.com (2603:10b6:303:11c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Thu, 27 Oct
 2022 13:23:27 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 13:23:27 +0000
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
X-Inumbo-ID: 8c13fe7a-55fa-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666877014;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=fkalRipwL4QhzJBlRTC3oCd7uIW7whVV3EmU6EU1m+w=;
  b=eri9ZSEaHiH4Y0knOgQ/b+sUGXiMU6ttrI2YCM/taMKuCqrNetMKGcCv
   fG5UJQXRMFSNsGWpdaYVQlnicN92wF1wzLUA8yIfwl86ENeNgERpowxCT
   MDqmsbDdbfskF6UopUjyzncD7a7bs3RLuvON7BsIb9P6Z8VOdMWS9/roK
   0=;
X-IronPort-RemoteIP: 104.47.66.43
X-IronPort-MID: 83623797
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ZwXKpa5AlcxiTnyoOOgBzwxRtA7GchMFZxGqfqrLsTDasY5as4F+v
 mtJUWHUaf+DMDCnf98laoXl9kMA6JbcmINiSwRkpSo1Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvymTras1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPewP9TlK6q4mlB5gZhPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5dH2FLz
 +FGGgtVby68gM/s7LySU/Jj05FLwMnDZOvzu1lG5BSAV7MDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/RppTSIpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+toiny3LSQzHyTtIQ6TranteBVsHio+TY2EwQYfF3r5qGnsxvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLkgJSCRQLuMvssAeTCYvk
 FSOmrvBBzZirbmUQnK17aqPoHW5Pi19BXcLeCssXQYDpd75r+kOYgnnS99iFOuwkYfzEDSpm
 TSS9nBi3PMUkNIB0Li98RbfmTWwq5PVTwkzoALKQmai6QA/b4mgD2C11WXmAT97BN7xZjG8U
 LIswqByMMhm4UmxqRGw
IronPort-HdrOrdr: A9a23:v5SlbqkWBpCO5x/4OPZV/5DkeZHpDfPDimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0msl6KdhrNhRYtKPTOWwVdASbsP0WKM+UyFJ8STzI5gPM
 RbAtVD4aPLfD9HZK/BiWHXcurIqOP3ipxA7t2uqkuFIzsaCJ2JuGxCe32m+wBNNX17LKt8MK
 DZyttMpjKmd3hSRsOnBkMdV+yGg9HQjprpbTMPGhZisWC1/EWVwY+/NyLd8gYVUjtJz7tn2W
 /Zkzbh7qHml/2g0BfT20La8pwTstr8zdloAtCKl6EuW0LRozftQL4kd6yJvTgzru3qwFE2kO
 PUqxNlBMh342O5RBDHnTLdny3blBo+4X7rzlGVxVH5p9bieT48A81dwapEbxrw8SMbzZtB+Z
 MO+1jcm4tcDBvGkii4zcPPTQtWmk29pmdnufIPjkZYTZAVZNZq3MciFXtuYds99R/Bmc8a+L
 EENrCT2B8WSyLTU5nhhBgj/DT2NU5DXytvQSA5y7yoOnZt7TBEJnAjtbIid0c7he4AoqZ/lp
 v529xT5ddzp+8tHNBA7bQ6ML6KI12IZy7wG0SvBnmiPJ07Ghv22u/KCfMOlaiXRKA=
X-IronPort-AV: E=Sophos;i="5.95,217,1661832000"; 
   d="scan'208";a="83623797"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmxXj7c/Oesn8rt0Alzk62EuqMT+IbybG/NfpckdsP35f1xa11QdDnvFOCVV8YMvZ6av/STerHJt8V9ovhue6EewzxTULa6dtjjdmucr3lbP5N97SBWVRHBh9B5jSPvuF8oBwrHe/di46bizZO8Nc1pJP6BVFl8riZpZSwE77DbiL7+x+YAcHDg+YP4QUhOH0wLPFpVMh0LC+lzTeoJ4lpkNBClFA0UNSh03iDcKRKjX5DGUmQp4UCEuZnzdd9QsCeTlyYvlX87pdFgcSK3KfII/EJklxjEe0PafQtKP+ywUVum6Y7qgOId+QwglSNI0vPH2Sz9UpweFYGAYbi6UAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8UmHt6C/ljxC4lFDsKcFQOxCx0nEIFwa+tGtO4pidA=;
 b=H4XESa+bh20XAPjoJnmlPSdHcfv2y2ViGdmvvDo9Yncx00whV/PWrf27zPt/Qag1KA+wq5kK63nGhzlMG+hCUFC/kNnEhJVnma/WIxcK1fUS7LRbScETTZy2oDT8MnI1/5qoycpq/w4Mtb7kjgQi1TVafZ0yOY3EAfYGuT1aHvUWXfCt8vjgdvKBQgiParmMMqMt7qkbyTaVT4MOuZWKINsE1odZNYYnX+LZTY3yCS7HLAAsRKO2scnsC/ZivLrqIpJ3x8MHfORPprMqiAKX0wnkWfkbOYC1WqFYY5aKJaDHWgvkebMAqrhAxPlWzh0ZCkfpkTBJWrs5JzRy2f7DtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8UmHt6C/ljxC4lFDsKcFQOxCx0nEIFwa+tGtO4pidA=;
 b=ib1ppPFKZTOiBFLeBLTM3ybLmj5nsOxh6ZsMJsczZtOI91EBtpPnH1tgffG+cg18S5agIwNEyKY88Gv81xrA18hgFfmLEniWuqn4TzsMOfFjR8AkjH557eTry6H4dbOQo8Hq0Zan5HjWbnqcyyz/euUD9rAQ6n1uygyX6Dg3utI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH for-4.17 v3 0/2] (v)pci: fixes related to memory decoding handling
Date: Thu, 27 Oct 2022 15:23:13 +0200
Message-Id: <20221027132315.80592-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:13e::31) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MW4PR03MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: 98ec76a1-4683-4009-70f7-08dab81e6e61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YCbNAwQL9eXZr8rwe5n9Kb53LDvhdbzGDa34gtLloDfe0PxwZmjDX41T7pg4FbSwB1AnWciVZG0jF9pq10cGtHIidpYnmNEq8QJOjihirmn/Nauy20lGYGZKO2gzAaf9MgvtxVo4cyd0WJIJegjFRac0eayq+HE37DmPNn0wtknL8zxc0OfuF53hheBBXBE1RFKBxXcLuzZJZbS1Y3O+mNFo5TEznAlb7XVEVrtDKFKeyiKQgzRTL9DjAKFSo1YY0dhPmSMIcAyMAoNvicbf4cOyaAibnMDSTki430ATqpg4mJfbqpLOluaoIfn2muIzfP9yGVFDOzXvKE5hRcPzifJ1jHyGU37G6P0F8Dr20RllXv7iOJmBeydl9g3HqDsy2XWlf+FonbaUuvjKCl+HTD3cg6af8nRTXNzG1yeoDIGKKgAnda5HyRzl9/H7EgTI7yhTrZM4+eQ3+5melVyZ0FG+tlS9Y/6wMPviW0nqXcN4XGW+eY8SxE8MBvSSRnxAK7eecr25gI3PZ6OzONEE+BthSpOXz47nDqmFDpg1wQQpu0sTWgxvSFc9nBhRnKiEphnuvNhBy0zE6Io/A1Q30hiI89BY3/g/L8Xwzl8aGYsCSQ/81E1jALvOKYkZSyFhR3X2EEhjKapfs+3PevHH20h9OUoRjbt/1Z6axPD3Uhyimq+WJj3giIrUgOzpKg8zDEsy+sVk7+VCIg9oNec1RQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(451199015)(478600001)(83380400001)(6486002)(54906003)(6916009)(6666004)(82960400001)(1076003)(4326008)(8676002)(36756003)(186003)(66476007)(26005)(6506007)(8936002)(41300700001)(38100700002)(66946007)(66556008)(4744005)(2906002)(316002)(6512007)(86362001)(5660300002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UllXWlFzUktzSFNtdGdPNG53czFWeFNWb0FiV1dPV1dGYkhCRitTOGwvNXcx?=
 =?utf-8?B?QWFZcVlNUU5LQk0yVGhIcEExSWVaVTFlVHFjRUIxQitCM240OW5OK08xMWE3?=
 =?utf-8?B?aktFTzZZdkNLSmxDemp2MnFZK1Z4VFBwSDZRRGVlbmZETmwwaWgvK3JHYUZk?=
 =?utf-8?B?dVI4ZlRCZzVlNG01Rk5rNXNCWDIrUXZPYU4wTW0xMmNrbS9aWk1CRWZycit4?=
 =?utf-8?B?S0hocjFyVGl2dVVQRjhrZlkrbWR5d2loSEJ3UkFJamswSjZidzhrWC9nY2RK?=
 =?utf-8?B?aHRBV2JaQ1NTS2JqbnA4WE1BdnJHMDNVTjZqeXRZMFlsOGRqaVE3amg1SGxQ?=
 =?utf-8?B?cDZmRDgwUU9IdS83TDdUdGNkNkR1TXFHVVVhbjU1emNDSXFqQkxucmMySFFP?=
 =?utf-8?B?cGl6d1dNU1d3WjdKRmpCOFF6YThBUlo3aTRSNmdYQ3NKT2toS2dZVk9qdXJl?=
 =?utf-8?B?YUNHTlBTSXgxZW9KVmRwV3JPM0NhZ2k1U2lRSCtjVGlKak8wdCtWSGowRDNG?=
 =?utf-8?B?eFgvL1dNdlUvOFlQbDRFMHVYTkVOSDgvd1JRbWVET2oraWM0T3JEQVNlQWFW?=
 =?utf-8?B?cEFZa0J0WlNOdFVnNy93RVpaR1RnMWhaRU1OK2lxOVlrVWpqM0RGYTM5dXkv?=
 =?utf-8?B?djBrUWJwMHNQOWN2SzVMUTN5azg1cnhqSEJaRlEzS1NqVW1HaVFqNjFPcm5P?=
 =?utf-8?B?ZGcwL3BmM0Y5Vmk2NDNuS0tGTEtSRHBqQjZNM0lrR21DNjFqM2xwM0E1bWZa?=
 =?utf-8?B?bVVud29IRkdlWVRNQWZKdnZGZEQ1WXY5dGowYXRrcy9NV1REWEVma0ViSTlT?=
 =?utf-8?B?amhESzYwSVBEcEIwNEp0K2V1UFN5SVRlZDIyaUhUcXhKK2FpZzF3bCtCeWg2?=
 =?utf-8?B?aHc0eXdqVkdJSE16WCtRZW5XOHYzeG5EOXh3ckRDbitjdlNjdk16cWVGRVVr?=
 =?utf-8?B?N2RFWUVKdTRvN01VT0lQY1RQSEtrOGVlNG5uajUxNnFMcHFneUtESEdhd1JW?=
 =?utf-8?B?MWRLSUkxMkd2cDF1Nlh2KzYwNFpQdHlUUm5GdnBJUGVabENVSGlUc2pvVGF6?=
 =?utf-8?B?bXJ6TGN1KzRpMTIvYk1NMktHZzg4akczL3lMOVpBZXFVWk9zdHFGMmpIalVw?=
 =?utf-8?B?NG41dXMyMHM1eVlKZUFwNUxiSEEyWHZjeDFWanR2dll0M2xnclZSNGw0SVhR?=
 =?utf-8?B?L1RzeHhNYnJJZzdOblFGVno5SmNNVkhZWlVGaVhKc3RVZ3BjbWk1ajg5NzUv?=
 =?utf-8?B?YUJzaFI4ME4yN0p5U2JzWkg5K3UrMmcxN0ZOcVVlL2JEZkdtc0N6R08rNUtn?=
 =?utf-8?B?Z29Nd0kyYXlucU5jTCtCSTBlTnBFU0lFUmE5OHg1TlhNWWVRY0YxQkNDWFNK?=
 =?utf-8?B?dDZZazQ5VStSK1QyYW1qMytJMnlvWk9OU2xPMUR0MzJFSS9Wak1RNnFhaWVw?=
 =?utf-8?B?OHB6TmpjbW1wbVViL2hON1I2SDErZVpFaGxvYUUzdFFwRjNKWVFud1hQdGUr?=
 =?utf-8?B?QWY4ZFoydmhkQTJ0TUVtNUdSVTdSMUo4aXRFRk1aek5kUTBrMGpJUzJWV3N0?=
 =?utf-8?B?Sm1GOHliTmdQWlcvd1ZJcVduaEhON3NrbGZ6U2F4L0FhWXJzZ1FiWTR6dzlp?=
 =?utf-8?B?Smx5L1pVZ3BpZFpsQnJOWVZFWk82S2h0NGgraEd5TmYwRUdLTGZteHkvSllF?=
 =?utf-8?B?UGlISEZiQzdtcTdwZVB6Nkhyb3E0QjBodEZHSHlSbEw1TGdFMHlyRm44L0Fy?=
 =?utf-8?B?eFFlLzFJdUlDeG9RRjVWbmkwWkZnRTQ0SWQyZVFqejVmWDhTMTNvYk4rV2hQ?=
 =?utf-8?B?VjZVYW9LRXVWcWVCRFpVcVV6VC8rWnlUNlR4dlVidW4vK0lnaXV6ZVJCTUNE?=
 =?utf-8?B?RUZYQVdXenVFRG1rTDI1aWRMKzkvUCtSTkhha29RWE5JeDVFa0lJdHRiREtu?=
 =?utf-8?B?QUM0Z0NPTEFSNTlQLytkSnd4Njc1d2hZNUIrVkpkZk9hbW1QL0FqbXpqZHYw?=
 =?utf-8?B?RjBmRUx0T2JCVm16MlFHVWZtNVd1WTJlUGh1WUZ4Wk1tN1lhMk5yeWI2TEda?=
 =?utf-8?B?VVcyTlEwMTIzZC94SUdDSEZUZlo5dmlxbHM3K3RoNk8yRlNTN3B3Z2R6WkVE?=
 =?utf-8?Q?x2QEYejGjW2pwvNAMFHqOVMga?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ec76a1-4683-4009-70f7-08dab81e6e61
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 13:23:26.8005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJY77IUAbqDt3avB0WuFxoWJjoJONYdkc4bfLA31S+Zu0jbNFjc+uIubgND+0X13Rx0nPpivbo1ipFUkzO8Dmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6377

Hello,

Just two patches left, but likely the ones with more meat in them.

Previous series was release-acked by Henry, but I haven't kept the acks
in case there's delay in getting them reviewed at which point the
release-ack would expire.

Thanks, Roger.

Roger Pau Monne (2):
  pci: do not disable memory decoding for devices
  vpci: refuse BAR writes only if the BAR is mapped

 xen/drivers/passthrough/pci.c | 69 -----------------------------------
 xen/drivers/vpci/header.c     | 44 ++++++++++++++++------
 xen/include/xen/vpci.h        |  6 +++
 3 files changed, 39 insertions(+), 80 deletions(-)

-- 
2.37.3


