Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D54D675A93A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 10:27:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566465.885314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMP08-0002RN-O3; Thu, 20 Jul 2023 08:27:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566465.885314; Thu, 20 Jul 2023 08:27:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMP08-0002Oe-Kg; Thu, 20 Jul 2023 08:27:08 +0000
Received: by outflank-mailman (input) for mailman id 566465;
 Thu, 20 Jul 2023 08:27:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/JYs=DG=citrix.com=prvs=558be806a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qMP06-0001wC-Oa
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 08:27:06 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 343663dd-26d7-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 10:27:04 +0200 (CEST)
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jul 2023 04:27:02 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5760.namprd03.prod.outlook.com (2603:10b6:a03:2d3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 08:27:00 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 08:27:00 +0000
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
X-Inumbo-ID: 343663dd-26d7-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689841624;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=PoGS6PLKgGovzFPQKOOfY9Pvlc4ex9V0H8gcinS47Ag=;
  b=Gt+mtOs3pvo+T0qyH3SMcqraOHRFPeaomUo1zWRO8TB13SFiJMz1zDZW
   JOX7OslVKmaBpoBSXMTZSQ+QwlR37UH354P4JOC+KLSwZi3fbgxzY+z0P
   PHEz/T1wsBLDtfXdIhc01JZ4rRHJ4NZMT+dQRIbyBNKfsd35O+lIhOAl0
   g=;
X-IronPort-RemoteIP: 104.47.56.172
X-IronPort-MID: 115538996
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:e+gJrKLBCU7Ynob6FE+R9ZQlxSXFcZb7ZxGr2PjKsXjdYENS1zADy
 mYdWmzTaPzeM2L8ftB1OYq380wA7cPRm4I3HVdlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4QZmPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5lE1Bt9
 OIcNwsxRR+niNDmnbOiTLZz05FLwMnDZOvzu1lG5BSAVLMNZsmGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dppTGMlmSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv127KUzXKqBur+EpW27OBBnkXJ+lUPGR48CFaCm/eHmG6xDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsUTppeNEg8sgsSlQC1
 FCTmMjyLSdyq7DTQnWYnop4thu3MCkRaGQFPCkNSFJc58G5+d5pyBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsgDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:1yX65KjIUoG+zzZtwIv9hhCeVHBQXtkji2hC6mlwRA09TyVXrb
 HIoB17726TtN91YhsdcL+7Scq9qB/nlaKdgrNxAV7BZniFhILAFugLhrcKqAeQfhEWmNQtsZ
 uIsJITNDQzNzVHZArBjzVQ2uxP/OW6
X-Talos-CUID: =?us-ascii?q?9a23=3ABPhhamu6pzRLu9ijtnUMK3ZD6Is3YEz+zWnUPHS?=
 =?us-ascii?q?EImlNR4/FFF6J/vx7xp8=3D?=
X-Talos-MUID: 9a23:9JI9gARcABS1sRlkRXTini9JKt8y352yGUMnzJg/gce6Jwx/bmI=
X-IronPort-AV: E=Sophos;i="6.01,218,1684814400"; 
   d="scan'208";a="115538996"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CCRXOicWHAj9nEam5AAl05SmfyylXnGj50Fi3ENH8ZfEu97VZIfuDVJQd2+n5KyxTJiG1zr/+7VZkCdUgHJ25gp8zxHsIVnLDQBdWPbmdK+IxIZaFVd7hnwAl7TZSl/wiVYzIZLya89RfdDDyS6jGEgn/tQGORnzS65VLODcRTTpieH28jxvtENsM6oq+2L7hZQOxNRmw5RGlhGtDsA+esif5glkEf4IKFK+QF3b4IZ0ZOV23lRkMnn8HAGYQNb+uBA894cLcCJp5b5rfQ/fj2E9+c4CLBhcaOrVMZsczuKLojOt4h9DcMvCfXZBYeAm5txf9Oy7Uo1BL7MS794ZgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/LRt01+eEG0RC09vGzKXREvrvgUJopnQM/vveJrCdc=;
 b=JcBDwyO6+8HV7w1+UryyI7sTqZfEy98ACBit3u3og6bcectR8wcd+RsWPSm68egGoRkw6iujZbGkEocgr91gxsiAPMjNTTCOvbHTFb229/VyNFIGHZCcyN92ud2NxuCfbVAuUlJC57KVJ4ifRSMRFUq2WCYg0c/LFIuw6zY1SjfL6w4++KIJn/00sPoP91MOE+g1d4mOrZseLkeFmQIUxS2V3ptlNeo7DU4uIGaQTAoiUHia6ADG67b6S8Hzjn4YvU7h+NBCaF2gn4weNwWWIe3Zhsm5rsxJyOjx54AvlQGyk/+kAVD71UbkkkHn6SEx97aWn6znJFG2/0RxhlM33w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/LRt01+eEG0RC09vGzKXREvrvgUJopnQM/vveJrCdc=;
 b=KvlmP9kLvbXZXMd9d2dnHQEDUM5IvH024MLWclhx3pkR1VDxyf9GjWyR+FvXDfpVtdNFDFmZZQ2T0+wn9B3+kwtXkjt1iSKCsHMhMFTkB9KbwDTM6Hcm2VMbRYXXpyG84v/+WMYM0w7ObxbLgDG2DKKkxOBdUreXlmCBXfH+tbU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 3/6] libxl: introduce MSR data in libxl_cpuid_policy
Date: Thu, 20 Jul 2023 10:25:37 +0200
Message-ID: <20230720082540.69444-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720082540.69444-1-roger.pau@citrix.com>
References: <20230720082540.69444-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5760:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b1fa335-f0b2-40b0-b4fe-08db88fb168d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mpJ5Ulom3cy8Aq5OQEZmw89hFhI9oKQxwCIaJCP9xKeffL6RNVFl5MVIvuxsaqiHzCjHub3YQ5/SieFvQ6vTEDDlKc3U2+iEWGKTVSNRrOhx8hZbF9Kko+xvLAE8UQ5hiWkuM/e9SXNf7YurWwD9tluBywTcSj7jBBkHS6Pg8fNdWdt88ARXQ18FpnhE2ktJnYLydZOc1++J8oLYi1dp20BfuX1fvHJsa293IYFmXcBv0PX+YrdSudm32/JWcg1+weVf3Opb2Dy/NcL1GbLabZ37VzmqMitGEAypuZIn2U90HiPtJ8MC53KXSiUUECvo83L7XermNFiL4FpH46jujvwYlBTqypZXL/hbJjQbjTLr6xVBiqxHr5hLe6PqAK1g5elPjqiukga9Dg9bine2Qk6LHTNqkLUisHNozZ9w1MDYOgNPg56hEOv3WbG8Pt15ZmXqtzCDOXQ91betB8qilbQJ1ZIDgFmhZolZ/8p82mWsxxsHccRgJ60jNKkUpj/3QGlbP8/A6K66L2FVRac31JcCBQ7XW0z7twsLw9dH+OfIWjoYc/lAGxnrShQfmnt3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(451199021)(86362001)(478600001)(83380400001)(1076003)(186003)(38100700002)(41300700001)(26005)(54906003)(6916009)(8676002)(8936002)(316002)(2906002)(4326008)(6512007)(66556008)(66946007)(6666004)(66476007)(6486002)(6506007)(82960400001)(2616005)(36756003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnFhalZzamFld2VJY2VpdnFBbTN1Z1h3YWZ5dHVKdnE1eVc5bjIrZmxwSzJs?=
 =?utf-8?B?bHZCZkREdnE0eGg1TDh0S05ma1VhVUxXTFgxV1JqVzlVcHAzMGVFOWM5UFp2?=
 =?utf-8?B?SHRRNVZTekdXbHBBeGwvNENNL1U1VzVSSGFBUGltOXB2SnlNNlV3ZmprU0Yw?=
 =?utf-8?B?ejFXVERrczlyTUVyYWVEZG5INnMxN3h6QlFDbExQR0twK0E3R1l3bkZvWXJm?=
 =?utf-8?B?aEplU3NVcHlSVmczdUwrRzhGUU5icFY3WVg4VU5ldFJ4M00wb3NDV3FSMzdC?=
 =?utf-8?B?OFYyVEk4RkJHaGMyME5WNldKaHV6K0FySDZIUWplYlJCWlZUNmJ4TDJOdkMy?=
 =?utf-8?B?OVlKcldabVBHaHc2QTlFS2lxRmFCa0Z6eUtqZEU3aFR1c1VrRG90Rzc5UkpQ?=
 =?utf-8?B?UDJ1N1k5QmpmTEZjOVpodUdyVHhBVjBGODRQY1U3WGNGaXRsUG1MRzU5SEJa?=
 =?utf-8?B?TU9qWjFDNlBpejlkcmIySk9OeHE0Yk42OXhOZjJSMDJDaFYvTURmYzAySkgy?=
 =?utf-8?B?cFNMVitNK3lRTTdIeS95QXMvbFExTFVISGMxTzNibnRzYkxmZDlGVVBIRDM1?=
 =?utf-8?B?bHNyRUxxMFU5aE1TYWZDNUxEVWVicTVzRXY3U3o4OHpmVERZSDJ3dXBqQlJ6?=
 =?utf-8?B?ZEw5SkIxV3hVd3RNY1hYdmJGbXkxb1JONnBkM0YzcXNqQjIvdFhvYkxvU2hV?=
 =?utf-8?B?dDJERkdjOUEvZmZnWlc5cFduV3c3UzF5ZFh2U1VBQ0Q5elRMWWRmVDdDeFNw?=
 =?utf-8?B?cHlqZ3l6cnBDakhWdktnSTZaTkM0Uy9VM2IzTmlRbkp6VU1oNjNlTzFVTmt0?=
 =?utf-8?B?bGJmTEVHQ1ZxT1NHVkJTUkl1eGhXbnhjNi9Ha1JQREdnVG1aYmQ4QjI3UW40?=
 =?utf-8?B?aDE1aklUNHNjeXdGUDFPWGtUNG1Lazk5a1ZzNFJaUW9YTm9yN3ZBSW5sTzR0?=
 =?utf-8?B?TCt0bERCTFlNZE9FUXBtbXA1aGxmYlRDNkF5cXZ2d0pxMUZYZ0JFbmhXZnJR?=
 =?utf-8?B?ZU9HcWV3bU1qQnVDS1NSaThOQUhOcnVZRm1HN1lYS2lzRGV6azZxL0dKR2Zp?=
 =?utf-8?B?dHJrNDBDSEVadUtwMmFYV1drN2dsUWhPWm94L3ZZVEJtVmdIblBQSUh1WTBa?=
 =?utf-8?B?UENNcTgyM2ZGMFJYeXJpamJ2QitKKy9CbVRFaGJGZTliZnl4Zi9vYkdWUG1Z?=
 =?utf-8?B?VjQ2TFV1OTF2VnlUbFFybkRyVDFPT010QlFtV2I5ZWFNOVJ3d0dXNW03b1R6?=
 =?utf-8?B?QlJIaW1zMUI0NmpYZ2pTQzN3WkFneEo5UFFhRTZ1RU42TXdSMHpkbFgwaGpZ?=
 =?utf-8?B?RnRSdEY0MGZtc3dWWkZ6aTNzaEZ4Q1R3d2RHU1pXRWtEYXRjT3o3ZHBqOGJk?=
 =?utf-8?B?L2lZTWdBSlFReXZYbUcrNW80RDNpcVZzWnQrdnZDcWJRK3hSN3dFelpuNlgy?=
 =?utf-8?B?SzhtSGJsakVxQ2M5bHN6cVF4eXVTSTIxTFZvTUdyb0RMZW9sbmVlc09FdVMx?=
 =?utf-8?B?K2Y2LzhjYU1oVFhxSjlQWWhpMVprckVPOUlNZ1BkdWd3RitvMnU1N0JGQ3RZ?=
 =?utf-8?B?K1VUU25GbFRVK01Wbmd0QlpFNzdaeFkybkJLUUdrZ2VVa0FaSmx4RnMreWNn?=
 =?utf-8?B?WEZnYWR4SEUrVWIwMzB4NGpFbzVVb0FPcFdTa3owRktrNTk4enpWa1FWOE1D?=
 =?utf-8?B?N3loeUpoNjJHZGpLZUZGczdzVlRmK21pTTdlT2lXQTVtQTNPSkwvZVFFOU13?=
 =?utf-8?B?K1VMM0JpOGl1N2dhaDQyYWRVemxncm0wQ3JDd0lNbEFqbHBtQ2Y2YTZwTitK?=
 =?utf-8?B?a1VLMitLUkRxMjUvd1Uva3FlbkRsMmRaTUdXU3kzbFM1b3FDb25wZWtuS2ZW?=
 =?utf-8?B?cVBSczlmSEhlN1F1ZWQ5cFhaS3JDVjNnRWlIS3h6WUFLd3VKdk42R25wNFFM?=
 =?utf-8?B?WDZxdUlzMzRJZlAwSmdnc3ZPcThHQVM1NnBLT2xRY0dsUkVVMUdRK2ZhRTds?=
 =?utf-8?B?MStwQi9aN0RGUEtBSmgyejdmQ3dwQzhKWU1xMVpjNXBMMytuOGxhVm05M3Ny?=
 =?utf-8?B?cjRkbThqeVBPcnY1bjNVTkJKMzJxSDltZ29BeWlqRTRBdDdJemx4UFFGbERI?=
 =?utf-8?B?c3hVck1HMnFOaWFqcXJuTjF2bjFGMEdubXNxTzV1eGl6MlNRbVdtVFE4MGxz?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VG7vtKK5icSJxQE37R0XmUdgLsTke1C6DQ0IiJA+KXqNSR+XYBEQHzBbX257hiqh/MipLzVFfX3K/SP9q9OdNMzygNiTmoJ7qZdUJfR/aWX6mXZYzMyJLecTDmaaaR7yk9gGbfLh+72jdnjCifSh67z5o15x9z6yxYVCtZuerCZe221sOfQxhNXkI81XW49KhW5YDsnbIPgPQAXkKtmAn0a0BqErXuXxXhKyFOs6blDKpQ/v4PE0+Lbdx8Md+I/SigzMrd5UNRlfqF690InPfZJQzIbxlS1fAQMZcx5fk3og17kBRI4pphwHjj7geBxoeKXjlwpiFdG34UOYb/4eAOgMHv/88/UXJclVoeQgMpKCM1njCu/QR5brCe+uuvmtyTFIcdACVCUAnaukXoCDeJo4NxXZFcPpgimb/tYO8/t53v35SgYvaYCW2cYhyleAZA2H9jlaZJj9NbSBl2NFbZTLCBQAs5uC6SdSduSTXTgr976LZdQAjdE5TifKq2VofhwO+ct/DafSvU9aP1xpU9WfqCyn/D92hxtRDQKBVDYjWUf22Jg1n9ZxAJm/t17yPxMEhWrxt82kZvKF0+wJ+IL3ILuBIIE7X0OS9A8sNsxogLjyh9RrJEQH40IeHNptFdCW23GgZrLcAauriTzYRn1kgtuFJpv6abLPbB4JE3rNRd+NANOrFjHk22pWxHIHql5f7AODDnLFpAHsVrEM6/ui+tn35PxGqJBmWqQPSZJA2hwSqTxDGsw/tAZmIdsbUShdtsesanTFbdFVe/nmelSxfq07FFUSG7zHrqmK7hhukHFz7qJNkLmuMb9K6IW1
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1fa335-f0b2-40b0-b4fe-08db88fb168d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 08:27:00.0946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ZyCqlIVpX1OMka4s1N2f7nNp13P37W2t7QFjQhIuaOrQkrCrV0kIqEnpxEAWh/mXq03wgv+dsU4+uQAjouiHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5760

Add a new array field to libxl_cpuid_policy in order to store the MSR
policies.

Adding the MSR data in the libxl_cpuid_policy_list type is done so
that existing users can seamlessly pass MSR features as part of the
CPUID data, without requiring the introduction of a separate
domain_build_info field, and a new set of handlers functions.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Unconditionally call free().
 - Implement the JSON marshaling functions.
---
It would be nice to rename the json output field to 'cpu_policy'
instead of 'cpuid', so that it looks like:

"cpu_policy": {
    "cpuid": [
        {
            "leaf": 7,
            "subleaf": 0,
            "edx": "xx1xxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
        },
        {
            "leaf": 1,
            "ebx": "xxxxxxxxxxxxxxxx00010000xxxxxxxx"
        }
        }
        }
    ],
    "msr": [
        {
            "index": 266,
            "policy": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx1xx1x1"
        }
    ]
},

Sadly I have no idea how to do that, and can be done in a followup
change anyway.
---
 tools/libs/light/libxl_cpuid.c    | 142 ++++++++++++++++++++++++++----
 tools/libs/light/libxl_internal.h |   1 +
 tools/libs/light/libxl_types.idl  |   2 +-
 3 files changed, 128 insertions(+), 17 deletions(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 3c8b2a72c0b8..68b797886642 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -16,7 +16,7 @@
 
 int libxl__cpuid_policy_is_empty(libxl_cpuid_policy_list *pl)
 {
-    return !libxl_cpuid_policy_list_length(pl);
+    return !*pl || (!libxl_cpuid_policy_list_length(pl) && !(*pl)->msr);
 }
 
 void libxl_cpuid_dispose(libxl_cpuid_policy_list *pl)
@@ -40,6 +40,8 @@ void libxl_cpuid_dispose(libxl_cpuid_policy_list *pl)
         free(policy->cpuid);
     }
 
+    free(policy->msr);
+
     free(policy);
     *pl = NULL;
     return;
@@ -516,7 +518,8 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
 
     r = xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
                               pae, itsc, nested_virt,
-                              info->cpuid ? info->cpuid->cpuid : NULL, NULL);
+                              info->cpuid ? info->cpuid->cpuid : NULL,
+                              info->cpuid ? info->cpuid->msr : NULL);
     if (r)
         LOGEVD(ERROR, -r, domid, "Failed to apply CPUID policy");
 
@@ -528,16 +531,22 @@ static const char *input_names[2] = { "leaf", "subleaf" };
 static const char *policy_names[4] = { "eax", "ebx", "ecx", "edx" };
 /*
  * Aiming for:
- * [
- *     { 'leaf':    'val-eax',
- *       'subleaf': 'val-ecx',
- *       'eax':     'filter',
- *       'ebx':     'filter',
- *       'ecx':     'filter',
- *       'edx':     'filter' },
- *     { 'leaf':    'val-eax', ..., 'eax': 'filter', ... },
- *     ... etc ...
- * ]
+ * {   'cpuid': [
+ *              { 'leaf':    'val-eax',
+ *                'subleaf': 'val-ecx',
+ *                'eax':     'filter',
+ *                'ebx':     'filter',
+ *                'ecx':     'filter',
+ *                'edx':     'filter' },
+ *              { 'leaf':    'val-eax', ..., 'eax': 'filter', ... },
+ *              ... etc ...
+ *     ],
+ *     'msr': [
+ *            { 'index': 'val-index',
+ *              'policy': 'filter', },
+ *              ... etc ...
+ *     ],
+ * }
  */
 
 yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
@@ -545,9 +554,16 @@ yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
 {
     libxl_cpuid_policy_list policy = *pl;
     struct xc_xend_cpuid *cpuid;
+    struct xc_msr *msr;
     yajl_gen_status s;
     int i, j;
 
+    s = yajl_gen_map_open(hand);
+    if (s != yajl_gen_status_ok) goto out;
+
+    s = libxl__yajl_gen_asciiz(hand, "cpuid");
+    if (s != yajl_gen_status_ok) goto out;
+
     s = yajl_gen_array_open(hand);
     if (s != yajl_gen_status_ok) goto out;
 
@@ -582,6 +598,39 @@ yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
 
 empty:
     s = yajl_gen_array_close(hand);
+    if (s != yajl_gen_status_ok) goto out;
+
+    s = libxl__yajl_gen_asciiz(hand, "msr");
+    if (s != yajl_gen_status_ok) goto out;
+
+    s = yajl_gen_array_open(hand);
+    if (s != yajl_gen_status_ok) goto out;
+
+    if (!policy || !policy->msr) goto done;
+    msr = policy->msr;
+
+    for (i = 0; msr[i].index != XC_MSR_INPUT_UNUSED; i++) {
+        s = yajl_gen_map_open(hand);
+        if (s != yajl_gen_status_ok) goto out;
+
+        s = libxl__yajl_gen_asciiz(hand, "index");
+        if (s != yajl_gen_status_ok) goto out;
+        s = yajl_gen_integer(hand, msr[i].index);
+        if (s != yajl_gen_status_ok) goto out;
+        s = libxl__yajl_gen_asciiz(hand, "policy");
+        if (s != yajl_gen_status_ok) goto out;
+        s = yajl_gen_string(hand,
+                            (const unsigned char *)msr[i].policy, 64);
+        if (s != yajl_gen_status_ok) goto out;
+
+        s = yajl_gen_map_close(hand);
+        if (s != yajl_gen_status_ok) goto out;
+    }
+
+done:
+    s = yajl_gen_array_close(hand);
+    if (s != yajl_gen_status_ok) goto out;
+    s = yajl_gen_map_close(hand);
 out:
     return s;
 }
@@ -592,17 +641,24 @@ int libxl__cpuid_policy_list_parse_json(libxl__gc *gc,
 {
     int i, size;
     struct xc_xend_cpuid *l;
+    struct xc_msr *msr;
+    const libxl__json_object *co;
     flexarray_t *array;
 
-    if (!libxl__json_object_is_array(o))
+    if (!libxl__json_object_is_map(o))
         return ERROR_FAIL;
 
-    array = libxl__json_object_get_array(o);
+    co = libxl__json_map_get("cpuid", o, JSON_ARRAY);
+    if (!libxl__json_object_is_array(co))
+        return ERROR_FAIL;
+
+    *p = libxl__calloc(NOGC, 1, sizeof(**p));
+
+    array = libxl__json_object_get_array(co);
     if (!array->count)
-        return 0;
+        goto cpuid_empty;
 
     size = array->count;
-    *p = libxl__calloc(NOGC, 1, sizeof(**p));
     /* need one extra slot as sentinel */
     l = (*p)->cpuid = libxl__calloc(NOGC, size + 1,
                                     sizeof(struct xc_xend_cpuid));
@@ -642,6 +698,40 @@ int libxl__cpuid_policy_list_parse_json(libxl__gc *gc,
         }
     }
 
+cpuid_empty:
+    co = libxl__json_map_get("msr", o, JSON_ARRAY);
+    if (!libxl__json_object_is_array(co))
+        return ERROR_FAIL;
+
+    array = libxl__json_object_get_array(co);
+    if (!array->count)
+        return 0;
+    size = array->count;
+    /* need one extra slot as sentinel */
+    msr = (*p)->msr = libxl__calloc(NOGC, size + 1, sizeof(struct xc_msr));
+
+    msr[size].index = XC_MSR_INPUT_UNUSED;
+
+    for (i = 0; i < size; i++) {
+        const libxl__json_object *t, *r;
+
+        if (flexarray_get(array, i, (void**)&t) != 0)
+            return ERROR_FAIL;
+
+        if (!libxl__json_object_is_map(t))
+            return ERROR_FAIL;
+
+        r = libxl__json_map_get("index", t, JSON_INTEGER);
+        if (!r) return ERROR_FAIL;
+        msr[i].index = libxl__json_object_get_integer(r);
+        r = libxl__json_map_get("policy", t, JSON_STRING);
+        if (!r) return ERROR_FAIL;
+        if (strlen(libxl__json_object_get_string(r)) !=
+            ARRAY_SIZE(msr[i].policy) - 1)
+            return ERROR_FAIL;
+        strcpy(msr[i].policy, libxl__json_object_get_string(r));
+    }
+
     return 0;
 }
 
@@ -677,6 +767,10 @@ void libxl_cpuid_policy_list_copy(libxl_ctx *ctx,
     }
 
     *pdst = libxl__calloc(NOGC, 1, sizeof(**pdst));
+
+    if (!(*psrc)->cpuid)
+        goto copy_msr;
+
     dst = &(*pdst)->cpuid;
     src = &(*psrc)->cpuid;
     len = libxl_cpuid_policy_list_length(psrc);
@@ -696,6 +790,22 @@ void libxl_cpuid_policy_list_copy(libxl_ctx *ctx,
                 (*dst)[i].policy[j] = NULL;
     }
 
+copy_msr:
+    if ((*psrc)->msr) {
+        const struct xc_msr *msr = (*psrc)->msr;
+
+        for (i = 0; msr[i].index != XC_MSR_INPUT_UNUSED; i++)
+            ;
+        len = i;
+        (*pdst)->msr = libxl__calloc(NOGC, len + 1, sizeof(struct xc_msr));
+        (*pdst)->msr[len].index = XC_MSR_INPUT_UNUSED;
+
+        for (i = 0; i < len; i++) {
+            (*pdst)->msr[i].index = msr[i].index;
+            strcpy((*pdst)->msr[i].policy, msr[i].policy);
+        }
+    }
+
 out:
     GC_FREE;
 }
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index ef882cff3912..b1a7cd9f615b 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -4871,6 +4871,7 @@ _hidden int libxl__domain_set_paging_mempool_size(
 
 struct libxl__cpu_policy {
     struct xc_xend_cpuid *cpuid;
+    struct xc_msr *msr;
 };
 
 #endif
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 9e48bb772646..887824fdd828 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -19,7 +19,7 @@ libxl_mac = Builtin("mac", json_parse_type="JSON_STRING", passby=PASS_BY_REFEREN
 libxl_bitmap = Builtin("bitmap", json_parse_type="JSON_ARRAY", dispose_fn="libxl_bitmap_dispose", passby=PASS_BY_REFERENCE,
                        check_default_fn="libxl_bitmap_is_empty", copy_fn="libxl_bitmap_copy_alloc")
 libxl_cpuid_policy_list = Builtin("cpuid_policy_list", dispose_fn="libxl_cpuid_dispose", passby=PASS_BY_REFERENCE,
-                                  json_parse_type="JSON_ARRAY", check_default_fn="libxl__cpuid_policy_is_empty",
+                                  json_parse_type="JSON_MAP", check_default_fn="libxl__cpuid_policy_is_empty",
                                   copy_fn="libxl_cpuid_policy_list_copy")
 
 libxl_string_list = Builtin("string_list", dispose_fn="libxl_string_list_dispose", passby=PASS_BY_REFERENCE,
-- 
2.41.0


